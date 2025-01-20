@interface AMSMetricsIdentifierInfo
+ (BOOL)bothDatesAreNilOr:(id)a3 equals:(id)a4;
+ (BOOL)bothStringsAreNilOr:(id)a3 equals:(id)a4;
- (BOOL)crossDeviceSync;
- (BOOL)deleted;
- (BOOL)isEqualIgnoringLastSync:(id)a3;
- (NSDate)expires;
- (NSDate)lastSync;
- (NSDate)modified;
- (NSDate)serverProvidedAt;
- (NSString)idKey;
- (NSString)name;
- (NSString)storeUUID;
- (NSString)value;
- (id)description;
- (id)syncStateFieldName;
- (void)populateDictionary:(id)a3;
- (void)setCrossDeviceSync:(BOOL)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setExpires:(id)a3;
- (void)setIdKey:(id)a3;
- (void)setLastSync:(id)a3;
- (void)setModified:(id)a3;
- (void)setName:(id)a3;
- (void)setServerProvidedAt:(id)a3;
- (void)setStoreUUID:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation AMSMetricsIdentifierInfo

- (NSDate)expires
{
  return self->_expires;
}

- (BOOL)crossDeviceSync
{
  return self->_crossDeviceSync;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void)setStoreUUID:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setIdKey:(id)a3
{
}

- (void)setExpires:(id)a3
{
}

- (void)setCrossDeviceSync:(BOOL)a3
{
  self->_crossDeviceSync = a3;
}

- (void)setServerProvidedAt:(id)a3
{
}

- (void)setModified:(id)a3
{
}

- (void)setLastSync:(id)a3
{
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverProvidedAt, 0);
  objc_storeStrong((id *)&self->_modified, 0);
  objc_storeStrong((id *)&self->_lastSync, 0);
  objc_storeStrong((id *)&self->_expires, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_storeUUID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_idKey, 0);
}

- (void)populateDictionary:(id)a3
{
  id v9 = a3;
  v4 = [(AMSMetricsIdentifierInfo *)self value];
  v5 = [(AMSMetricsIdentifierInfo *)self name];
  [v9 setObject:v4 forKeyedSubscript:v5];

  if ([(AMSMetricsIdentifierInfo *)self crossDeviceSync])
  {
    v6 = [(AMSMetricsIdentifierInfo *)self syncStateFieldName];
    v7 = [(AMSMetricsIdentifierInfo *)self lastSync];
    if (v7) {
      v8 = @"synchronized";
    }
    else {
      v8 = @"unsynchronized";
    }
    [v9 setObject:v8 forKeyedSubscript:v6];
  }
}

- (NSString)name
{
  return self->_name;
}

- (id)syncStateFieldName
{
  v2 = [(AMSMetricsIdentifierInfo *)self name];
  if ([v2 length])
  {
    v3 = [v2 substringToIndex:1];
    v4 = [v3 uppercaseString];
    uint64_t v5 = objc_msgSend(v2, "stringByReplacingCharactersInRange:withString:", 0, 1, v4);

    v6 = [NSString stringWithFormat:@"xp%@SyncState", v5];

    v2 = (void *)v5;
  }
  else
  {
    v6 = @"xpSyncState";
  }

  return v6;
}

- (NSDate)lastSync
{
  return self->_lastSync;
}

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)AMSMetricsIdentifierInfo;
  v3 = [(AMSMetricsIdentifierInfo *)&v14 description];
  long long v13 = *(_OWORD *)&self->_idKey;
  storeUUID = self->_storeUUID;
  value = self->_value;
  lastSync = self->_lastSync;
  modified = self->_modified;
  expires = self->_expires;
  id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_crossDeviceSync];
  v10 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_deleted];
  v11 = [v3 stringByAppendingFormat:@" (idKey: %@, name: %@, value: %@, storeUUID: %@, expires: %@, modified: %@, lastSync: %@, crossDeviceSync: %@, deleted: %@, serverProvidedAt: %@)", v13, value, storeUUID, expires, modified, lastSync, v9, v10, self->_serverProvidedAt];

  return v11;
}

- (BOOL)isEqualIgnoringLastSync:(id)a3
{
  v4 = (AMSMetricsIdentifierInfo *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  if (v4 == self)
  {
    char v7 = 1;
    goto LABEL_26;
  }
  BOOL v6 = [(AMSMetricsIdentifierInfo *)v4 crossDeviceSync];
  if (v6 == [(AMSMetricsIdentifierInfo *)self crossDeviceSync])
  {
    v8 = objc_opt_class();
    id v9 = [(AMSMetricsIdentifierInfo *)v5 idKey];
    v10 = [(AMSMetricsIdentifierInfo *)self idKey];
    if ([v8 bothStringsAreNilOr:v9 equals:v10])
    {
      v11 = objc_opt_class();
      v12 = [(AMSMetricsIdentifierInfo *)v5 name];
      long long v13 = [(AMSMetricsIdentifierInfo *)self name];
      if ([v11 bothStringsAreNilOr:v12 equals:v13])
      {
        objc_super v14 = objc_opt_class();
        v15 = [(AMSMetricsIdentifierInfo *)v5 storeUUID];
        v16 = [(AMSMetricsIdentifierInfo *)self storeUUID];
        if ([v14 bothStringsAreNilOr:v15 equals:v16])
        {
          uint64_t v17 = objc_opt_class();
          v18 = [(AMSMetricsIdentifierInfo *)v5 value];
          uint64_t v19 = [(AMSMetricsIdentifierInfo *)self value];
          v20 = (void *)v17;
          v21 = (void *)v19;
          if ([v20 bothStringsAreNilOr:v18 equals:v19])
          {
            v34 = v21;
            v35 = v18;
            v22 = objc_opt_class();
            uint64_t v23 = [(AMSMetricsIdentifierInfo *)v5 expires];
            [(AMSMetricsIdentifierInfo *)self expires];
            v33 = v36 = (void *)v23;
            if (objc_msgSend(v22, "bothDatesAreNilOr:equals:", v23)
              && (BOOL v24 = [(AMSMetricsIdentifierInfo *)v5 deleted],
                  v24 == [(AMSMetricsIdentifierInfo *)self deleted]))
            {
              v25 = objc_opt_class();
              v26 = [(AMSMetricsIdentifierInfo *)v5 modified];
              v32 = [(AMSMetricsIdentifierInfo *)self modified];
              if (objc_msgSend(v25, "bothDatesAreNilOr:equals:", v26))
              {
                v30 = objc_opt_class();
                [(AMSMetricsIdentifierInfo *)v5 serverProvidedAt];
                v27 = v31 = v26;
                v28 = [(AMSMetricsIdentifierInfo *)self serverProvidedAt];
                char v7 = [v30 bothDatesAreNilOr:v27 equals:v28];

                v26 = v31;
              }
              else
              {
                char v7 = 0;
              }
              v18 = v35;
            }
            else
            {
              char v7 = 0;
              v18 = v35;
            }
            v21 = v34;
          }
          else
          {
            char v7 = 0;
          }
        }
        else
        {
          char v7 = 0;
        }
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
LABEL_4:
    char v7 = 0;
  }
LABEL_26:

  return v7;
}

+ (BOOL)bothStringsAreNilOr:(id)a3 equals:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4) {
    return [a3 isEqualToString:a4];
  }
  else {
    return 1;
  }
}

+ (BOOL)bothDatesAreNilOr:(id)a3 equals:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4) {
    return [a3 isEqualToDate:a4];
  }
  else {
    return 1;
  }
}

- (NSString)idKey
{
  return self->_idKey;
}

- (NSString)storeUUID
{
  return self->_storeUUID;
}

- (NSDate)modified
{
  return self->_modified;
}

- (NSDate)serverProvidedAt
{
  return self->_serverProvidedAt;
}

@end