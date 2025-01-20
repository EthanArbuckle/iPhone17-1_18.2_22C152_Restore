@interface HDCloudSyncTarget
- (BOOL)isEqual:(id)a3;
- (CKContainer)container;
- (HDCloudSyncStore)store;
- (HDCloudSyncStoreRecord)storeRecord;
- (HDCloudSyncTarget)init;
- (HDCloudSyncTarget)initWithPurpose:(int64_t)a3 container:(id)a4 zoneIdentifier:(id)a5 storeRecord:(id)a6 store:(id)a7 options:(unint64_t)a8;
- (HDCloudSyncZone)zone;
- (HDCloudSyncZoneIdentifier)zoneIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)targetByAddingOptions:(unint64_t)a3;
- (id)targetByRemovingOptions:(unint64_t)a3;
- (id)targetByUpdatingPurpose:(int64_t)a3;
- (int64_t)purpose;
- (unint64_t)hash;
- (unint64_t)options;
- (void)setZone:(id)a3;
@end

@implementation HDCloudSyncTarget

- (HDCloudSyncTarget)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncTarget)initWithPurpose:(int64_t)a3 container:(id)a4 zoneIdentifier:(id)a5 storeRecord:(id)a6 store:(id)a7 options:(unint64_t)a8
{
  id v13 = a4;
  id v14 = a5;
  id v26 = a6;
  id v25 = a7;
  v15 = [v13 containerIdentifier];
  v16 = [v14 containerIdentifier];
  char v17 = [v15 isEqualToString:v16];

  if ((v17 & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HDCloudSyncTarget.m", 65, @"Invalid parameter not satisfying: %@", @"[container.containerIdentifier isEqualToString:zoneIdentifier.containerIdentifier]" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)HDCloudSyncTarget;
  v18 = [(HDCloudSyncTarget *)&v27 init];
  v19 = v18;
  if (v18)
  {
    v18->_purpose = a3;
    objc_storeStrong((id *)&v18->_container, a4);
    objc_storeStrong((id *)&v19->_zoneIdentifier, a5);
    objc_storeStrong((id *)&v19->_storeRecord, a6);
    objc_storeStrong((id *)&v19->_store, a7);
    v19->_options = a8;
  }

  return v19;
}

- (id)targetByAddingOptions:(unint64_t)a3
{
  v3 = [[HDCloudSyncTarget alloc] initWithPurpose:self->_purpose container:self->_container zoneIdentifier:self->_zoneIdentifier storeRecord:self->_storeRecord store:self->_store options:self->_options | a3];

  return v3;
}

- (id)targetByRemovingOptions:(unint64_t)a3
{
  v3 = [[HDCloudSyncTarget alloc] initWithPurpose:self->_purpose container:self->_container zoneIdentifier:self->_zoneIdentifier storeRecord:self->_storeRecord store:self->_store options:self->_options & ~a3];

  return v3;
}

- (id)targetByUpdatingPurpose:(int64_t)a3
{
  v3 = [[HDCloudSyncTarget alloc] initWithPurpose:a3 container:self->_container zoneIdentifier:self->_zoneIdentifier storeRecord:self->_storeRecord store:self->_store options:self->_options];

  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = HDCloudSyncTargetPurposeToString(self->_purpose);
  v5 = HDCloudSyncTargetOptionsToString(self->_options);
  v6 = [(CKContainer *)self->_container containerIdentifier];
  v7 = [(HDCloudSyncZoneIdentifier *)self->_zoneIdentifier zoneIdentifier];
  v8 = [v7 zoneName];
  v9 = [(HDCloudSyncRecord *)self->_storeRecord record];
  v10 = [v9 recordID];
  v11 = [v10 recordName];
  v12 = [v3 stringWithFormat:@"<%@ Target: (%@) [%@] %@ : %@>", v4, v5, v6, v8, v11];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t purpose = self->_purpose;
  container = self->_container;
  zoneIdentifier = self->_zoneIdentifier;
  storeRecord = self->_storeRecord;
  store = self->_store;
  unint64_t options = self->_options;

  return (id)[v4 initWithPurpose:purpose container:container zoneIdentifier:zoneIdentifier storeRecord:storeRecord store:store options:options];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(CKContainer *)self->_container containerIdentifier];
    v6 = [v4 container];
    v7 = [v6 containerIdentifier];
    if ([v5 isEqualToString:v7])
    {
      zoneIdentifier = self->_zoneIdentifier;
      v9 = [v4 zoneIdentifier];
      if ([(HDCloudSyncZoneIdentifier *)zoneIdentifier isEqual:v9])
      {
        storeRecord = self->_storeRecord;
        v11 = [v4 storeRecord];
        BOOL v12 = [(HDCloudSyncStoreRecord *)storeRecord isEqual:v11];
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(CKContainer *)self->_container containerIdentifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(HDCloudSyncZoneIdentifier *)self->_zoneIdentifier hash] ^ v4;
  v6 = [(HDCloudSyncRecord *)self->_storeRecord record];
  v7 = [v6 recordID];
  unint64_t v8 = v5 ^ [v7 hash];

  return v8;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (CKContainer)container
{
  return self->_container;
}

- (HDCloudSyncZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (HDCloudSyncStoreRecord)storeRecord
{
  return self->_storeRecord;
}

- (HDCloudSyncStore)store
{
  return self->_store;
}

- (unint64_t)options
{
  return self->_options;
}

- (HDCloudSyncZone)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_storeRecord, 0);
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

@end