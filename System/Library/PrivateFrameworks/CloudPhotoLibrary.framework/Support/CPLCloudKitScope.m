@interface CPLCloudKitScope
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForCloudKitScopeOptions:(int64_t)a3;
+ (id)scopeFromTransportScope:(id)a3;
- (BOOL)isCoherent;
- (BOOL)isShared;
- (BOOL)isZoneish;
- (CKRecordZone)zone;
- (CKRecordZoneID)zoneID;
- (CPLCloudKitScope)fixedCloudKitScope;
- (CPLCloudKitScope)initWithCoder:(id)a3;
- (CPLCloudKitScope)initWithZone:(id)a3;
- (CPLCloudKitScope)initWithZone:(id)a3 options:(int64_t)a4;
- (CPLCloudKitScope)initWithZoneID:(id)a3;
- (CPLCloudKitScope)initWithZoneID:(id)a3 options:(int64_t)a4;
- (NSData)transportScope;
- (id)description;
- (id)recordIDWithRecordName:(id)a3;
- (int64_t)databaseScope;
- (int64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLCloudKitScope

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptionForCloudKitScopeOptions:(int64_t)a3
{
  if (qword_1002CE6F0 == -1)
  {
    if (a3)
    {
LABEL_3:
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x2020000000;
      int64_t v18 = a3;
      id v4 = objc_alloc_init((Class)NSMutableArray);
      v5 = (void *)qword_1002CE6E8;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10006649C;
      v11[3] = &unk_1002789C0;
      v13 = &v15;
      int64_t v14 = a3;
      id v6 = v4;
      id v12 = v6;
      [v5 enumerateKeysAndObjectsUsingBlock:v11];
      if (v16[3])
      {
        id v7 = objc_alloc((Class)NSString);
        v8 = [v6 componentsJoinedByString:@"|"];
        v9 = (__CFString *)[v7 initWithFormat:@"%@|???(0x%lx)", v8, v16[3]];
      }
      else
      {
        v9 = [v6 componentsJoinedByString:@"|"];
      }

      _Block_object_dispose(&v15, 8);
      goto LABEL_9;
    }
  }
  else
  {
    dispatch_once(&qword_1002CE6F0, &stru_100278998);
    if (a3) {
      goto LABEL_3;
    }
  }
  v9 = @"none";
LABEL_9:
  return v9;
}

- (CPLCloudKitScope)initWithZone:(id)a3 options:(int64_t)a4
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPLCloudKitScope;
  v9 = [(CPLCloudKitScope *)&v12 init];
  if (v9)
  {
    v10 = [v8 zoneID];

    if (!v10) {
      sub_1001C9E50((uint64_t)a2, (uint64_t)v9);
    }
    objc_storeStrong((id *)&v9->_zone, a3);
    v9->_options = a4;
  }

  return v9;
}

- (CPLCloudKitScope)initWithZoneID:(id)a3 options:(int64_t)a4
{
  id v7 = a3;
  if (!v7) {
    sub_1001C9F10((uint64_t)a2, (uint64_t)self);
  }
  id v8 = v7;
  id v9 = [objc_alloc((Class)CKRecordZone) initWithZoneID:v7];
  v10 = [(CPLCloudKitScope *)self initWithZone:v9 options:a4];

  return v10;
}

- (CPLCloudKitScope)initWithZone:(id)a3
{
  id v4 = a3;
  v5 = [v4 zoneID];
  id v6 = [v5 ownerName];
  unsigned int v7 = [v6 isEqualToString:CKCurrentUserDefaultName];

  if (v7) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 2;
  }
  id v9 = [(CPLCloudKitScope *)self initWithZone:v4 options:v8];

  return v9;
}

- (CPLCloudKitScope)initWithZoneID:(id)a3
{
  id v5 = a3;
  if (!v5) {
    sub_1001C9FD0((uint64_t)a2, (uint64_t)self);
  }
  id v6 = v5;
  id v7 = [objc_alloc((Class)CKRecordZone) initWithZoneID:v5];
  uint64_t v8 = [(CPLCloudKitScope *)self initWithZone:v7];

  return v8;
}

- (CPLCloudKitScope)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPLCloudKitScope;
  id v5 = [(CPLCloudKitScope *)&v10 init];
  if (v5
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"z"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        zone = v5->_zone,
        v5->_zone = (CKRecordZone *)v6,
        zone,
        v5->_options = (int64_t)[v4 decodeIntegerForKey:@"o"],
        !v5->_zone))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = v5;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  zone = self->_zone;
  id v5 = a3;
  [v5 encodeObject:zone forKey:@"z"];
  [v5 encodeInteger:self->_options forKey:@"o"];
}

+ (id)scopeFromTransportScope:(id)a3
{
  id v3 = a3;
  if (qword_1002CE700 != -1) {
    dispatch_once(&qword_1002CE700, &stru_1002789E0);
  }
  id v4 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:v3 classes:qword_1002CE6F8];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(CPLCloudKitScope *)v5 zoneID];

      if (v6)
      {
        id v7 = [(CPLCloudKitScope *)v5 zoneID];
        uint64_t v8 = [v7 ownerName];
        unsigned int v9 = [v8 isEqualToString:CKCurrentUserDefaultName];

        if (v9) {
          uint64_t v10 = 0;
        }
        else {
          uint64_t v10 = 2;
        }
        id v4 = [[CPLCloudKitScope alloc] initWithZone:v5 options:v10];
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          v11 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            int v13 = 138543362;
            int64_t v14 = v5;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "CKRecordZone without a zone ID: %{public}@", (uint8_t *)&v13, 0xCu);
          }
        }
        id v4 = 0;
      }
    }
  }

  return v4;
}

- (NSData)transportScope
{
  return (NSData *)+[NSKeyedArchiver cpl_archivedDataWithRootObject:self];
}

- (int64_t)databaseScope
{
  if (([(CPLCloudKitScope *)self options] & 2) != 0) {
    return 3;
  }
  else {
    return 2;
  }
}

- (CKRecordZoneID)zoneID
{
  return [(CKRecordZone *)self->_zone zoneID];
}

- (BOOL)isShared
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)isZoneish
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (id)recordIDWithRecordName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)CKRecordID);
  uint64_t v6 = [(CKRecordZone *)self->_zone zoneID];
  id v7 = [v5 initWithRecordName:v4 zoneID:v6];

  return v7;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  id v5 = [(CPLCloudKitScope *)self zoneID];
  uint64_t v6 = objc_msgSend(v5, "cpl_zoneName");
  id v7 = [(id)objc_opt_class() descriptionForCloudKitScopeOptions:self->_options];
  id v8 = [v3 initWithFormat:@"<%@ %@ (%@)>", v4, v6, v7];

  return v8;
}

- (CPLCloudKitScope)fixedCloudKitScope
{
  id v3 = [(CPLCloudKitScope *)self zoneID];
  uint64_t v4 = v3;
  if (v3
    && [v3 databaseScope]
    && (id v5 = [v4 databaseScope], v5 != (id)-[CPLCloudKitScope databaseScope](self, "databaseScope")))
  {
    id v7 = objc_alloc((Class)CKRecordZoneID);
    id v8 = [v4 zoneName];
    unsigned int v9 = [v4 ownerName];
    id v10 = [v7 initWithZoneName:v8 ownerName:v9];

    uint64_t v6 = [[CPLCloudKitScope alloc] initWithZoneID:v10 options:[(CPLCloudKitScope *)self options]];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isCoherent
{
  id v3 = [(CPLCloudKitScope *)self zoneID];
  uint64_t v4 = v3;
  BOOL v6 = 1;
  if (v3)
  {
    if ([v3 databaseScope])
    {
      id v5 = [v4 databaseScope];
      if (v5 != (id)[(CPLCloudKitScope *)self databaseScope]) {
        BOOL v6 = 0;
      }
    }
  }

  return v6;
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (int64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end