@interface BCCloudSyncVersions
- (NSPersistentHistoryToken)historyToken;
- (id)mutableCopy;
- (void)configureFromSyncVersions:(id)a3;
- (void)setHistoryToken:(id)a3;
@end

@implementation BCCloudSyncVersions

- (id)mutableCopy
{
  v3 = [BCMutableCloudSyncVersions alloc];
  return [(BCMutableCloudSyncVersions *)v3 initWithCloudSyncVersions:self];
}

- (NSPersistentHistoryToken)historyToken
{
  v2 = [(BCCloudSyncVersions *)self rawHistoryToken];
  if (v2)
  {
    id v8 = 0;
    v3 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v8];
    id v4 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
    }
    else
    {
      v6 = sub_1000083A0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1001E693C((uint64_t)v4, v6);
      }

      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return (NSPersistentHistoryToken *)v5;
}

- (void)setHistoryToken:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v6 = 0;
LABEL_6:
    id v5 = 0;
    goto LABEL_7;
  }
  id v7 = 0;
  id v5 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v7];
  id v6 = v7;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1001E68BC((uint64_t)v6);
    }
    goto LABEL_6;
  }
LABEL_7:
  [(BCCloudSyncVersions *)self setRawHistoryToken:v5];
}

- (void)configureFromSyncVersions:(id)a3
{
  id v4 = a3;
  -[BCCloudSyncVersions setCloudVersion:](self, "setCloudVersion:", [v4 cloudVersion]);
  -[BCCloudSyncVersions setLocalVersion:](self, "setLocalVersion:", [v4 localVersion]);
  -[BCCloudSyncVersions setSyncVersion:](self, "setSyncVersion:", [v4 syncVersion]);
  id v5 = [v4 historyToken];
  [(BCCloudSyncVersions *)self setHistoryToken:v5];

  id v6 = [v4 historyTokenOffset];
  [(BCCloudSyncVersions *)self setHistoryTokenOffset:v6];
}

@end