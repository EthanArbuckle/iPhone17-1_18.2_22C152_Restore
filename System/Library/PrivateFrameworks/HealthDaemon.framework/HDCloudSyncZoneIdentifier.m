@interface HDCloudSyncZoneIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)identifierForZone:(id)a3 container:(id)a4 scope:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentIgnoringOwnerToZone:(id)a3;
- (BOOL)isEquivalentIgnoringOwnerToZone:(id)a3 container:(id)a4;
- (BOOL)isEquivalentToZone:(id)a3 container:(id)a4;
- (CKRecordZoneID)zoneIdentifier;
- (HDCloudSyncZoneIdentifier)initWithCoder:(id)a3;
- (NSString)containerIdentifier;
- (id)description;
- (id)initForZone:(id)a3 container:(id)a4;
- (id)initForZone:(id)a3 container:(id)a4 scope:(int64_t)a5;
- (int64_t)scope;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDCloudSyncZoneIdentifier

+ (id)identifierForZone:(id)a3 container:(id)a4 scope:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[HDCloudSyncZoneIdentifier alloc] initForZone:v8 container:v7 scope:a5];

  return v9;
}

- (id)initForZone:(id)a3 container:(id)a4
{
  return [(HDCloudSyncZoneIdentifier *)self initForZone:a3 container:a4 scope:2];
}

- (id)initForZone:(id)a3 container:(id)a4 scope:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)HDCloudSyncZoneIdentifier;
  v10 = [(HDCloudSyncZoneIdentifier *)&v32 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    zoneIdentifier = v10->_zoneIdentifier;
    v10->_zoneIdentifier = (CKRecordZoneID *)v11;

    uint64_t v13 = [v9 copy];
    containerIdentifier = v10->_containerIdentifier;
    v10->_containerIdentifier = (NSString *)v13;

    v10->_scope = a5;
    id v15 = v8;
    self;
    id v41 = 0;
    char v16 = objc_msgSend(v15, "hd_isMasterZoneIDForSyncCircleIdentifier:", &v41);
    id v17 = v41;
    id v18 = v17;
    if (v16)
    {
      uint64_t v19 = 0;
    }
    else
    {
      id v40 = v17;
      char v20 = objc_msgSend(v15, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v40);
      id v21 = v40;

      if (v20)
      {
        uint64_t v19 = 2;
LABEL_9:

        v10->_type = v19;
        goto LABEL_10;
      }
      id v39 = v21;
      char v22 = objc_msgSend(v15, "hd_isPrivateMetadataZoneIDForSyncCircleIdentifier:", &v39);
      id v18 = v39;

      if ((v22 & 1) == 0)
      {
        id v37 = 0;
        id v38 = v18;
        char v24 = objc_msgSend(v15, "hd_isStateSyncZoneIDForSyncCircleIdentifier:domain:", &v38, &v37);
        id v21 = v38;

        id v25 = v37;
        if (v24)
        {
          uint64_t v19 = 6;
        }
        else
        {
          id v36 = v21;
          char v26 = objc_msgSend(v15, "hd_isContextSyncZoneIDForSyncCircleIdentifier:", &v36);
          id v27 = v36;

          if (v26)
          {
            uint64_t v19 = 7;
            id v21 = v27;
          }
          else
          {
            id v34 = v27;
            id v35 = 0;
            char v28 = objc_msgSend(v15, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v35, &v34);
            id v29 = v35;
            id v21 = v34;

            if (v28)
            {
              uint64_t v19 = 3;
            }
            else
            {
              id v33 = v21;
              int v30 = objc_msgSend(v15, "hd_isAttachmentZoneIDForSyncCircleIdentifier:", &v33);
              id v31 = v33;

              if (v30) {
                uint64_t v19 = 5;
              }
              else {
                uint64_t v19 = 1;
              }
              id v21 = v31;
            }
          }
        }

        goto LABEL_9;
      }
      uint64_t v19 = 4;
    }
    id v21 = v18;
    goto LABEL_9;
  }
LABEL_10:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDCloudSyncZoneIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zone_id_record_zone_id"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zone_id_container_id"];
  int v7 = [v4 decodeIntForKey:@"zone_id_scope"];

  id v8 = [(HDCloudSyncZoneIdentifier *)self initForZone:v5 container:v6 scope:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  zoneIdentifier = self->_zoneIdentifier;
  id v5 = a3;
  [v5 encodeObject:zoneIdentifier forKey:@"zone_id_record_zone_id"];
  [v5 encodeObject:self->_containerIdentifier forKey:@"zone_id_container_id"];
  [v5 encodeInt:LODWORD(self->_scope) forKey:@"zone_id_scope"];
}

- (unint64_t)hash
{
  v3 = [(CKRecordZoneID *)self->_zoneIdentifier zoneName];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_containerIdentifier hash] ^ self->_scope ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_scope == v4[3])
  {
    NSUInteger v5 = [v4 zoneIdentifier];
    v6 = [v4 containerIdentifier];
    BOOL v7 = [(HDCloudSyncZoneIdentifier *)self isEquivalentToZone:v5 container:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEquivalentToZone:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKRecordZoneID *)self->_zoneIdentifier zoneName];
  id v9 = [v6 zoneName];
  if ([v8 isEqualToString:v9])
  {
    v10 = [(CKRecordZoneID *)self->_zoneIdentifier ownerName];
    uint64_t v11 = [v6 ownerName];
    if ([v10 isEqualToString:v11]) {
      BOOL v12 = [(NSString *)self->_containerIdentifier isEqualToString:v7];
    }
    else {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)isEquivalentIgnoringOwnerToZone:(id)a3 container:(id)a4
{
  id v6 = a4;
  zoneIdentifier = self->_zoneIdentifier;
  id v8 = a3;
  id v9 = [(CKRecordZoneID *)zoneIdentifier zoneName];
  v10 = [v8 zoneName];

  if ([v9 isEqualToString:v10]) {
    BOOL v11 = [(NSString *)self->_containerIdentifier isEqualToString:v6];
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isEquivalentIgnoringOwnerToZone:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [v4 zoneIdentifier];
  id v6 = [v4 containerIdentifier];

  LOBYTE(self) = [(HDCloudSyncZoneIdentifier *)self isEquivalentIgnoringOwnerToZone:v5 container:v6];
  return (char)self;
}

- (id)description
{
  v3 = NSString;
  containerIdentifier = self->_containerIdentifier;
  NSUInteger v5 = HDCKDatabaseScopeToString(self->_scope);
  id v6 = [(CKRecordZoneID *)self->_zoneIdentifier zoneName];
  id v7 = [(CKRecordZoneID *)self->_zoneIdentifier ownerName];
  id v8 = [v3 stringWithFormat:@"<%@ (%@): %@ [%@]>", containerIdentifier, v5, v6, v7];

  return v8;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (CKRecordZoneID)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (int64_t)scope
{
  return self->_scope;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);

  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end