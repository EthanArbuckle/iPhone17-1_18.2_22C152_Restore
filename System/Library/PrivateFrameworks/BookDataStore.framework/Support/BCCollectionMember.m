@interface BCCollectionMember
+ (id)assetIDFromCollectionMemberID:(id)a3;
+ (id)collectionIDFromCollectionMemberID:(id)a3;
+ (id)collectionMemberIDWithCollectionID:(id)a3 assetID:(id)a4;
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromCollectionMember:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BCCollectionMember

- (id)mutableCopy
{
  v3 = [BCMutableCollectionMember alloc];
  return [(BCMutableCollectionMember *)v3 initWithCloudData:self];
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v6 = BUProtocolCast();
  if (v6)
  {
    [(BCCollectionMember *)self _configureFromCollectionMember:v6 withMergers:v5];
  }
  else
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001EA724();
    }
  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = BUProtocolCast();
  v15.receiver = self;
  v15.super_class = (Class)BCCollectionMember;
  unsigned int v8 = [(BCCloudData *)&v15 isEqualExceptForDate:v6 ignoringEmptySalt:v4];

  v9 = [(BCCollectionMember *)self collectionMemberID];
  v10 = [v7 collectionMemberID];
  unsigned __int8 v11 = [v9 isEqualToString:v10];

  LODWORD(self) = [(BCCollectionMember *)self sortOrder];
  if (self == [v7 sortOrder]) {
    unsigned __int8 v12 = v11;
  }
  else {
    unsigned __int8 v12 = 0;
  }
  if (v8) {
    BOOL v13 = v12;
  }
  else {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)_configureFromCollectionMember:(id)a3 withMergers:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BCCollectionMember;
  [(BCCloudData *)&v15 configureFromCloudData:v6 withMergers:a4];
  v7 = [v6 collectionMemberID];
  [(BCCollectionMember *)self setDifferentString:v7 forKey:@"collectionMemberID"];

  unsigned int v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v6 sortOrder]);
  [(BCCollectionMember *)self setDifferentNumber:v8 forKey:@"sortOrder"];

  v9 = +[BULogUtilities shared];
  unsigned int v10 = [v9 verboseLoggingEnabled];

  if (v10)
  {
    unsigned __int8 v11 = sub_10000CD80();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v12 = [(BCCollectionMember *)self collectionMemberID];
      BOOL v13 = [(BCCollectionMember *)self debugDescription];
      v14 = [v6 collectionMemberID];
      *(_DWORD *)buf = 138412802;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v13;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCollectionMember configured: %@ %@ from collectionMember:%@\\\"\"", buf, 0x20u);
    }
  }
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    unsigned int v8 = +[BCCloudData localIdentifierFromRecord:v6];
    if (v8)
    {
      v9 = [(BCCollectionMember *)self collectionMemberID];
      unsigned __int8 v10 = [v9 isEqualToString:v8];

      if ((v10 & 1) == 0)
      {
        unsigned __int8 v11 = sub_1000083A0();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1001EA78C(self, (uint64_t)v8, v11);
        }

        [(BCCollectionMember *)self setCollectionMemberID:v8];
      }
    }
    else
    {
      unsigned __int8 v12 = sub_1000083A0();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1001EA758();
      }
    }
    v42.receiver = self;
    v42.super_class = (Class)BCCollectionMember;
    [(BCCloudData *)&v42 resolveConflictsFromRecord:v6 withResolvers:v7];
    uint64_t v13 = [(BCCollectionMember *)self modificationDate];
    if (v13)
    {
      v14 = (void *)v13;
      objc_super v15 = [(BCCollectionMember *)self modificationDate];
      [v15 timeIntervalSinceReferenceDate];
      double v17 = v16;
      __int16 v18 = [v6 modificationDate];
      [v18 timeIntervalSinceReferenceDate];
      double v20 = v19;

      if (v17 > v20)
      {
        v21 = sub_1000083A0();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = [(BCCollectionMember *)self collectionMemberID];
          v23 = [v6 recordID];
          v24 = [v23 recordName];
          v25 = [(BCCollectionMember *)self modificationDate];
          [v25 timeIntervalSinceReferenceDate];
          double v27 = v26;
          v28 = [v6 modificationDate];
          [v28 timeIntervalSinceReferenceDate];
          CFStringRef v29 = @"newer";
          *(_DWORD *)buf = 138412802;
          v44 = v22;
          __int16 v45 = 2114;
          if (v27 == v30) {
            CFStringRef v29 = @"the same";
          }
          v46 = v24;
          __int16 v47 = 2114;
          CFStringRef v48 = v29;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "BCCollectionMember %@ Resolving conflicts from record %{public}@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);
        }
        [(BCCloudData *)self incrementEditGeneration];
        goto LABEL_27;
      }
    }
    v31 = [v6 objectForKey:@"sortOrder"];
    [(BCCollectionMember *)self setDifferentNumber:v31 forKey:@"sortOrder"];
    v32 = [v6 modificationDate];
    [(BCCollectionMember *)self setDifferentDate:v32 forKey:@"modificationDate"];
    unsigned int v33 = [(BCCollectionMember *)self hasChanges];
    v34 = +[BULogUtilities shared];
    unsigned int v35 = [v34 verboseLoggingEnabled];

    if (v33)
    {
      if (v35)
      {
        v36 = sub_10000CD80();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = [(BCCollectionMember *)self collectionMemberID];
          v38 = [v6 recordID];
          v39 = [v38 recordName];
          v40 = [(BCCollectionMember *)self debugDescription];
          *(_DWORD *)buf = 138412802;
          v44 = v37;
          __int16 v45 = 2112;
          v46 = v39;
          __int16 v47 = 2112;
          CFStringRef v48 = v40;
          v41 = "\"\\\"BCCollectionMember %@ Resolving: Adopted properties from record: %@ %@\\\"\"";
LABEL_24:
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, v41, buf, 0x20u);

          goto LABEL_25;
        }
        goto LABEL_25;
      }
    }
    else if (v35)
    {
      v36 = sub_10000CD80();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = [(BCCollectionMember *)self collectionMemberID];
        v38 = [v6 recordID];
        v39 = [v38 recordName];
        v40 = [(BCCollectionMember *)self debugDescription];
        *(_DWORD *)buf = 138412802;
        v44 = v37;
        __int16 v45 = 2112;
        v46 = v39;
        __int16 v47 = 2112;
        CFStringRef v48 = v40;
        v41 = "\"\\\"BCCollectionMember %@ Resolving: Identical properties from record: %@ %@\\\"\"";
        goto LABEL_24;
      }
LABEL_25:
    }
LABEL_27:
  }
}

- (id)recordType
{
  return @"collectionMember";
}

+ (id)propertyIDKey
{
  return @"collectionMemberID";
}

- (id)zoneName
{
  return @"CollectionZone";
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  id v5 = [(BCCollectionMember *)self collectionMemberID];
  id v6 = [(BCCollectionMember *)self sortOrder];
  id v7 = [(BCCollectionMember *)self modificationDate];
  unsigned int v8 = +[NSString stringWithFormat:@"<%@: %p> collectionMemberID: %@, sortOrder:%d modificationDate:%@", v4, self, v5, v6, v7];

  return (NSString *)v8;
}

+ (id)collectionMemberIDWithCollectionID:(id)a3 assetID:(id)a4
{
  return +[NSString stringWithFormat:@"%@|%@", a3, a4];
}

+ (id)assetIDFromCollectionMemberID:(id)a3
{
  id v3 = a3;
  BOOL v4 = (char *)[v3 rangeOfString:@"|"];
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v3 substringFromIndex:&v4[v5]];
  }

  return v6;
}

+ (id)collectionIDFromCollectionMemberID:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rangeOfString:@"|"];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v3 substringToIndex:v4];
  }

  return v5;
}

@end