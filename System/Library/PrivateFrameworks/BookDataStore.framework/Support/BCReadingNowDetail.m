@interface BCReadingNowDetail
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromReadingNowDetail:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BCReadingNowDetail

- (id)mutableCopy
{
  v3 = [BCMutableReadingNowDetail alloc];
  return [(BCMutableReadingNowDetail *)v3 initWithCloudData:self];
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v6 = BUProtocolCast();
  if (v6)
  {
    [(BCReadingNowDetail *)self _configureFromReadingNowDetail:v6 withMergers:v5];
  }
  else
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001E86D4();
    }
  }
}

- (void)_configureFromReadingNowDetail:(id)a3 withMergers:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BCReadingNowDetail;
  id v7 = a4;
  [(BCCloudData *)&v14 configureFromCloudData:v6 withMergers:v7];
  v8 = [v6 assetID];
  [(BCReadingNowDetail *)self setDifferentString:v8 forKey:@"assetID"];

  v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isTrackedAsRecent]);
  [(BCReadingNowDetail *)self setDifferentNumber:v9 forKey:@"isTrackedAsRecent"];

  v10 = [v6 lastEngagedDate];
  [(BCReadingNowDetail *)self setDifferentDate:v10 forKey:@"lastEngagedDate"];

  v11 = [v6 cloudAssetType];
  [(BCReadingNowDetail *)self setDifferentString:v11 forKey:@"cloudAssetType"];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005C850;
  v13[3] = &unk_100261970;
  v13[4] = self;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];

  v12 = sub_1000083A0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1001E8708(self, v6, v12);
  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v5 = a4;
  id v7 = a3;
  v8 = BUProtocolCast();
  v27.receiver = self;
  v27.super_class = (Class)BCReadingNowDetail;
  unsigned int v26 = [(BCCloudData *)&v27 isEqualExceptForDate:v7 ignoringEmptySalt:v5];

  v9 = [(BCReadingNowDetail *)self assetID];
  v10 = [v8 assetID];
  unsigned int v11 = [v9 isEqualToString:v10];

  unsigned int v12 = [(BCReadingNowDetail *)self isTrackedAsRecent];
  uint64_t v13 = (uint64_t)[v8 isTrackedAsRecent];
  objc_super v14 = [(BCReadingNowDetail *)self lastEngagedDate];
  if (!v14)
  {
    v4 = [v8 lastEngagedDate];
    if (!v4)
    {
      unsigned int v17 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v15 = [(BCReadingNowDetail *)self lastEngagedDate];
  v16 = [v8 lastEngagedDate];
  unsigned int v17 = [v15 isEqualToDate:v16];

  if (!v14) {
    goto LABEL_6;
  }
LABEL_7:
  int v18 = v12 ^ v13;

  v19 = [(BCReadingNowDetail *)self cloudAssetType];
  if (v19 || ([v8 cloudAssetType], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v20 = [(BCReadingNowDetail *)self cloudAssetType];
    v21 = [v8 cloudAssetType];
    unsigned int v22 = [v20 isEqualToString:v21];

    if (v19) {
      goto LABEL_13;
    }
  }
  else
  {
    unsigned int v22 = 1;
  }

LABEL_13:
  int v23 = v26 & v11 & ~v18 & v17 & v22;
  v24 = sub_1000083A0();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v29 = v8;
    __int16 v30 = 2112;
    v31 = self;
    __int16 v32 = 1024;
    int v33 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "BCReadingNowDetail compare %@ to self:%@ SAME:%{BOOL}d", buf, 0x1Cu);
  }

  return v23;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  id v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BCReadingNowDetail;
  [(BCCloudData *)&v39 resolveConflictsFromRecord:v6 withResolvers:a4];
  if (v6)
  {
    id v7 = +[BCCloudData localIdentifierFromRecord:v6];
    v8 = [(BCReadingNowDetail *)self assetID];
    unsigned __int8 v9 = [v8 isEqualToString:v7];

    if ((v9 & 1) == 0)
    {
      v10 = sub_1000083A0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001E8A2C(self, (uint64_t)v7, v10);
      }

      [(BCReadingNowDetail *)self setAssetID:v7];
    }
    unsigned int v11 = [v6 objectForKey:@"lastEngagedDate"];
    unsigned int v12 = [(BCReadingNowDetail *)self modificationDate];
    if (v12)
    {
    }
    else
    {
      unsigned int v26 = [(BCReadingNowDetail *)self lastEngagedDate];

      if (v26)
      {
        if (!v11) {
          goto LABEL_9;
        }
        objc_super v27 = [(BCReadingNowDetail *)self lastEngagedDate];
        id v28 = [v27 compare:v11];

        if (v28 == (id)1) {
          goto LABEL_9;
        }
        goto LABEL_19;
      }
    }
    uint64_t v13 = [(BCReadingNowDetail *)self modificationDate];
    objc_super v14 = [v6 modificationDate];
    id v15 = [v13 compare:v14];

    if (v15 == (id)1)
    {
LABEL_9:
      v16 = sub_1000083A0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        unsigned int v17 = [(BCReadingNowDetail *)self assetID];
        int v18 = [v6 recordID];
        v19 = [v18 recordName];
        v20 = [(BCReadingNowDetail *)self modificationDate];
        [v20 timeIntervalSinceReferenceDate];
        double v22 = v21;
        int v23 = [v6 modificationDate];
        [v23 timeIntervalSinceReferenceDate];
        CFStringRef v24 = @"newer";
        *(_DWORD *)buf = 138412802;
        v41 = v17;
        if (v22 == v25) {
          CFStringRef v24 = @"the same";
        }
        __int16 v42 = 2112;
        v43 = v19;
        __int16 v44 = 2114;
        CFStringRef v45 = v24;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "BCReadingNowDetail %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);
      }
      [(BCCloudData *)self incrementEditGeneration];
LABEL_29:

      goto LABEL_30;
    }
LABEL_19:
    v29 = [v6 objectForKey:@"isTrackedAsRecent"];
    [(BCReadingNowDetail *)self setDifferentNumber:v29 forKey:@"isTrackedAsRecent"];
    [(BCReadingNowDetail *)self setDifferentDate:v11 forKey:@"lastEngagedDate"];
    __int16 v30 = [v6 objectForKey:@"cloudAssetType"];
    if (v30)
    {
      v31 = sub_1000083A0();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        sub_1001E8958(self, v6);
      }

      [(BCReadingNowDetail *)self setDifferentString:v30 forKey:@"cloudAssetType"];
    }
    unsigned int v32 = [(BCReadingNowDetail *)self hasChanges];
    int v33 = sub_1000083A0();
    v34 = v33;
    if (v32)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v35 = [(BCReadingNowDetail *)self assetID];
        v36 = [v6 recordID];
        v37 = [v36 recordName];
        v38 = [(BCReadingNowDetail *)self debugDescription];
        *(_DWORD *)buf = 138412802;
        v41 = v35;
        __int16 v42 = 2112;
        v43 = v37;
        __int16 v44 = 2112;
        CFStringRef v45 = v38;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "BCReadingNowDetail %@ Resolving: Adopted properties from record: %@ %@", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      sub_1001E8884(self, v6);
    }

    goto LABEL_29;
  }
  id v7 = sub_1000083A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1001E87EC(self, v7);
  }
LABEL_30:
}

- (id)recordType
{
  return @"readingNowDetail";
}

+ (id)propertyIDKey
{
  return @"assetID";
}

- (id)zoneName
{
  return @"AssetZone";
}

- (NSString)debugDescription
{
  v3 = [(BCReadingNowDetail *)self assetID];
  if ([(BCReadingNowDetail *)self isTrackedAsRecent]) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  BOOL v5 = [(BCReadingNowDetail *)self lastEngagedDate];
  id v6 = [(BCReadingNowDetail *)self cloudAssetType];
  id v7 = +[NSString stringWithFormat:@"assetID: %@, isTrackedAsRecent: %@, lastEngagedDate: %@ , cloudAssetType:%@", v3, v4, v5, v6];

  return (NSString *)v7;
}

@end