@interface BCStoreItem
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromStoreItem:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BCStoreItem

- (id)mutableCopy
{
  v3 = [BCMutableStoreItem alloc];
  return [(BCMutableStoreItem *)v3 initWithCloudData:self];
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v6 = BUProtocolCast();
  if (v6)
  {
    [(BCStoreItem *)self _configureFromStoreItem:v6 withMergers:v5];
  }
  else
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001E96E0();
    }
  }
}

- (void)_configureFromStoreItem:(id)a3 withMergers:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCStoreItem;
  [(BCCloudData *)&v13 configureFromCloudData:v6 withMergers:a4];
  v7 = +[BULogUtilities shared];
  unsigned int v8 = [v7 verboseLoggingEnabled];

  if (v8)
  {
    v9 = sub_10000CD80();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(BCStoreItem *)self storeID];
      v11 = [v6 storeID];
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "\"\\\"Configuring storeItem:%@ from storeItem:%@\\\"\"", buf, 0x16u);
    }
  }
  v12 = [v6 storeID];
  [(BCStoreItem *)self setDifferentString:v12 forKey:@"storeID"];
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = BUProtocolCast();
  v12.receiver = self;
  v12.super_class = (Class)BCStoreItem;
  LOBYTE(v4) = [(BCCloudData *)&v12 isEqualExceptForDate:v6 ignoringEmptySalt:v4];

  unsigned int v8 = [(BCStoreItem *)self storeID];
  v9 = [v7 storeID];
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  return v4 & v10;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  id v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BCStoreItem;
  [(BCCloudData *)&v37 resolveConflictsFromRecord:v6 withResolvers:a4];
  if (v6)
  {
    v7 = +[BCCloudData localIdentifierFromRecord:v6];
    unsigned int v8 = [(BCStoreItem *)self storeID];
    unsigned __int8 v9 = [v8 isEqualToString:v7];

    if ((v9 & 1) == 0)
    {
      unsigned __int8 v10 = sub_1000083A0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001E97AC(self, (uint64_t)v7, v10);
      }

      [(BCStoreItem *)self setStoreID:v7];
    }
    uint64_t v11 = [(BCStoreItem *)self modificationDate];
    if (!v11) {
      goto LABEL_13;
    }
    objc_super v12 = (void *)v11;
    objc_super v13 = [(BCStoreItem *)self modificationDate];
    [v13 timeIntervalSinceReferenceDate];
    double v15 = v14;
    __int16 v16 = [v6 modificationDate];
    [v16 timeIntervalSinceReferenceDate];
    double v18 = v17;

    if (v15 > v18)
    {
      v19 = sub_1000083A0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = [(BCStoreItem *)self storeID];
        v21 = [v6 recordID];
        v22 = [v21 recordName];
        v23 = [(BCStoreItem *)self modificationDate];
        [v23 timeIntervalSinceReferenceDate];
        double v25 = v24;
        v26 = [v6 modificationDate];
        [v26 timeIntervalSinceReferenceDate];
        CFStringRef v27 = @"newer";
        *(_DWORD *)buf = 138412802;
        v39 = v20;
        if (v25 == v28) {
          CFStringRef v27 = @"the same";
        }
        __int16 v40 = 2112;
        v41 = v22;
        __int16 v42 = 2114;
        CFStringRef v43 = v27;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "BCStoreItem %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);
      }
      [(BCCloudData *)self incrementEditGeneration];
    }
    else
    {
LABEL_13:
      v29 = +[BULogUtilities shared];
      unsigned int v30 = [v29 verboseLoggingEnabled];

      if (v30)
      {
        v31 = sub_10000CD80();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = [(BCStoreItem *)self storeID];
          v33 = [v6 recordID];
          v34 = [v33 recordName];
          *(_DWORD *)buf = 138412546;
          v39 = v32;
          __int16 v40 = 2114;
          v41 = v34;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "\"\\\"BCStoreItem %@ Resolving conflicts from record %{public}@\\\"\"", buf, 0x16u);
        }
      }
      v35 = [(BCStoreItem *)self storeID];
      [(BCStoreItem *)self setDifferentString:v35 forKey:@"storeID"];

      v36 = [v6 modificationDate];
      [(BCStoreItem *)self setDifferentDate:v36 forKey:@"modificationDate"];
    }
  }
  else
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001E9714(self, v7);
    }
  }
}

- (id)recordType
{
  return @"storeItem";
}

+ (id)propertyIDKey
{
  return @"storeID";
}

- (id)zoneName
{
  return @"AssetZone";
}

- (NSString)debugDescription
{
  v2 = [(BCStoreItem *)self storeID];
  v3 = +[NSString stringWithFormat:@"storeID: %@, ", v2];

  return (NSString *)v3;
}

@end