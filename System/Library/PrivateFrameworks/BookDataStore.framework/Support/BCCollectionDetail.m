@interface BCCollectionDetail
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromCollectionDetail:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BCCollectionDetail

- (id)mutableCopy
{
  v3 = [BCMutableCollectionDetail alloc];
  return [(BCMutableCollectionDetail *)v3 initWithCloudData:self];
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v6 = BUProtocolCast();
  if (v6)
  {
    [(BCCollectionDetail *)self _configureFromCollectionDetail:v6 withMergers:v5];
  }
  else
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001EA494();
    }
  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v5 = a4;
  id v7 = a3;
  v8 = BUProtocolCast();
  v29.receiver = self;
  v29.super_class = (Class)BCCollectionDetail;
  unsigned int v28 = [(BCCloudData *)&v29 isEqualExceptForDate:v7 ignoringEmptySalt:v5];

  v9 = [(BCCollectionDetail *)self name];
  v10 = [v8 name];
  unsigned int v11 = [v9 isEqualToString:v10];

  v12 = [(BCCollectionDetail *)self collectionID];
  v13 = [v8 collectionID];
  unsigned int v14 = [v12 isEqualToString:v13];

  v15 = [(BCCollectionDetail *)self collectionDescription];
  if (!v15)
  {
    v4 = [v8 collectionDescription];
    if (!v4)
    {
      unsigned int v18 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v16 = [(BCCollectionDetail *)self collectionDescription];
  v17 = [v8 collectionDescription];
  unsigned int v18 = [v16 isEqualToString:v17];

  if (!v15) {
    goto LABEL_6;
  }
LABEL_7:

  unsigned int v19 = [(BCCollectionDetail *)self hidden];
  unsigned int v20 = [v8 hidden];
  unsigned int v21 = [(BCCollectionDetail *)self sortOrder];
  unsigned int v22 = [v8 sortOrder];
  unsigned int v23 = [(BCCollectionDetail *)self sortMode];
  unsigned int v24 = [v8 sortMode];
  BOOL v25 = 0;
  if ((v28 & v11 & v14) == 1 && v18 && ((v19 ^ v20) & 1) == 0) {
    BOOL v25 = v21 == v22 && v23 == v24;
  }

  return v25;
}

- (void)_configureFromCollectionDetail:(id)a3 withMergers:(id)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BCCollectionDetail;
  [(BCCloudData *)&v20 configureFromCloudData:v6 withMergers:a4];
  id v7 = [v6 collectionID];
  [(BCCollectionDetail *)self setDifferentString:v7 forKey:@"collectionID"];

  v8 = [v6 name];

  if (v8)
  {
    v9 = [v6 name];
    [(BCCollectionDetail *)self setDifferentString:v9 forKey:@"name"];
  }
  else
  {
    [(BCCollectionDetail *)self setDifferentString:&stru_10026BED0 forKey:@"name"];
  }
  v10 = [v6 collectionDescription];
  [(BCCollectionDetail *)self setDifferentString:v10 forKey:@"collectionDescription"];

  unsigned int v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 hidden]);
  [(BCCollectionDetail *)self setDifferentNumber:v11 forKey:@"hidden"];

  v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v6 sortOrder]);
  [(BCCollectionDetail *)self setDifferentNumber:v12 forKey:@"sortOrder"];

  v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v6 sortMode]);
  [(BCCollectionDetail *)self setDifferentNumber:v13 forKey:@"sortMode"];

  unsigned int v14 = +[BULogUtilities shared];
  unsigned int v15 = [v14 verboseLoggingEnabled];

  if (v15)
  {
    v16 = sub_10000CD80();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(BCCollectionDetail *)self collectionID];
      unsigned int v18 = [(BCCollectionDetail *)self debugDescription];
      unsigned int v19 = [v6 collectionID];
      *(_DWORD *)buf = 138543874;
      unsigned int v22 = v17;
      __int16 v23 = 2112;
      unsigned int v24 = v18;
      __int16 v25 = 2114;
      v26 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCollectionDetail configured: %{public}@ %@ from assetDetail:%{public}@\\\"\"", buf, 0x20u);
    }
  }
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  id v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BCCollectionDetail;
  [(BCCloudData *)&v47 resolveConflictsFromRecord:v6 withResolvers:a4];
  if (v6)
  {
    id v7 = +[BCCloudData localIdentifierFromRecord:v6];
    v8 = [(BCCollectionDetail *)self collectionID];
    unsigned __int8 v9 = [v8 isEqualToString:v7];

    if ((v9 & 1) == 0)
    {
      v10 = sub_1000083A0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001EA550(self, (uint64_t)v7, v10);
      }

      [(BCCollectionDetail *)self setCollectionID:v7];
    }
    uint64_t v11 = [(BCCollectionDetail *)self modificationDate];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [(BCCollectionDetail *)self modificationDate];
      [v13 timeIntervalSinceReferenceDate];
      double v15 = v14;
      v16 = [v6 modificationDate];
      [v16 timeIntervalSinceReferenceDate];
      double v18 = v17;

      if (v15 > v18)
      {
        unsigned int v19 = sub_1000083A0();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          objc_super v20 = [(BCCollectionDetail *)self collectionID];
          unsigned int v21 = [v6 recordID];
          unsigned int v22 = [v21 recordName];
          __int16 v23 = [(BCCollectionDetail *)self modificationDate];
          [v23 timeIntervalSinceReferenceDate];
          double v25 = v24;
          v26 = [v6 modificationDate];
          [v26 timeIntervalSinceReferenceDate];
          CFStringRef v27 = @"newer";
          *(_DWORD *)buf = 138543874;
          v49 = v20;
          __int16 v50 = 2114;
          if (v25 == v28) {
            CFStringRef v27 = @"the same";
          }
          v51 = v22;
          __int16 v52 = 2114;
          CFStringRef v53 = v27;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "BCCollectionDetail %{public}@ Resolving conflicts from record %{public}@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);
        }
        [(BCCloudData *)self incrementEditGeneration];
        goto LABEL_32;
      }
    }
    v46 = [v6 objectForKey:@"hidden"];
    -[BCCollectionDetail setDifferentNumber:forKey:](self, "setDifferentNumber:forKey:");
    v45 = [v6 objectForKey:@"sortOrder"];
    -[BCCollectionDetail setDifferentNumber:forKey:](self, "setDifferentNumber:forKey:");
    objc_super v29 = [v6 objectForKey:@"sortMode"];
    [(BCCollectionDetail *)self setDifferentNumber:v29 forKey:@"sortMode"];
    uint64_t v30 = [v6 objectForKey:@"name"];
    v31 = (void *)v30;
    if (v30) {
      CFStringRef v32 = (const __CFString *)v30;
    }
    else {
      CFStringRef v32 = &stru_10026BED0;
    }
    [(BCCollectionDetail *)self setDifferentString:v32 forKey:@"name"];
    v33 = [(BCCollectionDetail *)self name];

    if (!v33) {
      [(BCCollectionDetail *)self setName:&stru_10026BED0];
    }
    v34 = [v6 objectForKey:@"collectionDescription"];
    if (v34) {
      [(BCCollectionDetail *)self setDifferentString:v34 forKey:@"collectionDescription"];
    }
    v35 = [v6 modificationDate];
    [(BCCollectionDetail *)self setDifferentDate:v35 forKey:@"modificationDate"];
    unsigned int v36 = [(BCCollectionDetail *)self hasChanges];
    v37 = +[BULogUtilities shared];
    unsigned int v38 = [v37 verboseLoggingEnabled];

    if (v36)
    {
      if (v38)
      {
        v39 = sub_10000CD80();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = [(BCCollectionDetail *)self collectionID];
          v44 = [v6 recordID];
          v41 = [v44 recordName];
          v42 = [(BCCollectionDetail *)self debugDescription];
          *(_DWORD *)buf = 138543874;
          v49 = v40;
          __int16 v50 = 2112;
          v51 = v41;
          __int16 v52 = 2112;
          CFStringRef v53 = v42;
          v43 = "\"\\\"BCCollectionDetail %{public}@ Resolving: Adopted properties from record: %@ %@\\\"\"";
LABEL_29:
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, v43, buf, 0x20u);

          goto LABEL_30;
        }
        goto LABEL_30;
      }
    }
    else if (v38)
    {
      v39 = sub_10000CD80();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = [(BCCollectionDetail *)self collectionID];
        v44 = [v6 recordID];
        v41 = [v44 recordName];
        v42 = [(BCCollectionDetail *)self debugDescription];
        *(_DWORD *)buf = 138543874;
        v49 = v40;
        __int16 v50 = 2112;
        v51 = v41;
        __int16 v52 = 2112;
        CFStringRef v53 = v42;
        v43 = "\"\\\"BCCollectionDetail %{public}@ Resolving: Identical properties from record: %@ %@\\\"\"";
        goto LABEL_29;
      }
LABEL_30:
    }
    goto LABEL_32;
  }
  id v7 = sub_1000083A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1001EA4C8(self);
  }
LABEL_32:
}

- (id)recordType
{
  return @"collectionDetail";
}

+ (id)propertyIDKey
{
  return @"collectionID";
}

- (id)zoneName
{
  return @"CollectionZone";
}

- (NSString)debugDescription
{
  v3 = [(BCCollectionDetail *)self collectionID];
  v4 = [(BCCollectionDetail *)self name];
  BOOL v5 = [(BCCollectionDetail *)self collectionDescription];
  if ([(BCCollectionDetail *)self hidden]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  id v7 = +[NSString stringWithFormat:@"collectionID: %@, Name: %@, Description: %@ hidden:%@ sortOrder:%d sortMode %d", v3, v4, v5, v6, [(BCCollectionDetail *)self sortOrder], [(BCCollectionDetail *)self sortMode]];

  return (NSString *)v7;
}

@end