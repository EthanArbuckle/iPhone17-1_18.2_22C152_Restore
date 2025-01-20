@interface BCAssetReview
+ (id)assetIDFromAssetReviewID:(id)a3;
+ (id)assetReviewIDWithUserID:(id)a3 assetID:(id)a4;
+ (id)propertyIDKey;
+ (id)userIDFromAssetReviewID:(id)a3;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (double)normalizedStarRating;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromAssetReview:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
- (void)setNormalizedStarRating:(double)a3;
@end

@implementation BCAssetReview

- (id)mutableCopy
{
  v3 = [BCMutableAssetReview alloc];
  return [(BCMutableAssetReview *)v3 initWithCloudData:self];
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v6 = BUProtocolCast();
  if (v6)
  {
    [(BCAssetReview *)self _configureFromAssetReview:v6 withMergers:v5];
  }
  else
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001E8C44();
    }
  }
}

- (void)_configureFromAssetReview:(id)a3 withMergers:(id)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BCAssetReview;
  [(BCCloudData *)&v19 configureFromCloudData:v6 withMergers:a4];
  v7 = [v6 assetReviewID];
  v8 = +[BCAssetReview userIDFromAssetReviewID:v7];

  [(BCAssetReview *)self setDifferentString:v8 forKey:@"userID"];
  v9 = [v6 assetReviewID];
  [(BCAssetReview *)self setDifferentString:v9 forKey:@"assetReviewID"];

  v10 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v6 starRating]);
  [(BCAssetReview *)self setDifferentNumber:v10 forKey:@"starRating"];

  v11 = [v6 reviewTitle];
  [(BCAssetReview *)self setDifferentString:v11 forKey:@"reviewTitle"];

  v12 = [v6 reviewBody];
  [(BCAssetReview *)self setDifferentString:v12 forKey:@"reviewBody"];

  v13 = +[BULogUtilities shared];
  unsigned int v14 = [v13 verboseLoggingEnabled];

  if (v14)
  {
    v15 = sub_10000CD80();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(BCAssetReview *)self assetReviewID];
      v17 = [(BCAssetReview *)self debugDescription];
      v18 = [v6 assetReviewID];
      *(_DWORD *)buf = 138412802;
      v21 = v16;
      __int16 v22 = 2112;
      v23 = v17;
      __int16 v24 = 2112;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "\"\\\"BCAssetReview configured: %@ %@ from assetReview:%@\\\"\"", buf, 0x20u);
    }
  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v5 = a4;
  id v7 = a3;
  v8 = BUProtocolCast();
  v26.receiver = self;
  v26.super_class = (Class)BCAssetReview;
  unsigned __int8 v25 = [(BCCloudData *)&v26 isEqualExceptForDate:v7 ignoringEmptySalt:v5];

  v9 = [(BCAssetReview *)self assetReviewID];
  v10 = [v8 assetReviewID];
  unsigned __int8 v11 = [v9 isEqualToString:v10];

  unsigned int v12 = [(BCAssetReview *)self starRating];
  unsigned int v13 = [v8 starRating];
  unsigned int v14 = [(BCAssetReview *)self reviewTitle];
  if (!v14)
  {
    v4 = [v8 reviewTitle];
    if (!v4)
    {
      unsigned __int8 v17 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v15 = [(BCAssetReview *)self reviewTitle];
  v16 = [v8 reviewTitle];
  unsigned __int8 v17 = [v15 isEqualToString:v16];

  if (!v14) {
    goto LABEL_6;
  }
LABEL_7:

  v18 = [(BCAssetReview *)self reviewBody];
  if (v18 || ([v8 reviewBody], (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v19 = [(BCAssetReview *)self reviewBody];
    v20 = [v8 reviewBody];
    unsigned __int8 v21 = [v19 isEqualToString:v20];

    if (v18) {
      goto LABEL_13;
    }
  }
  else
  {
    unsigned __int8 v21 = 1;
  }

LABEL_13:
  char v22 = v25 & v11;
  if (v12 != v13) {
    char v22 = 0;
  }
  char v23 = v22 & v17 & v21;

  return v23;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  id v6 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BCAssetReview;
  [(BCCloudData *)&v43 resolveConflictsFromRecord:v6 withResolvers:a4];
  if (v6)
  {
    id v7 = +[BCCloudData localIdentifierFromRecord:v6];
    v8 = [(BCAssetReview *)self assetReviewID];
    unsigned __int8 v9 = [v8 isEqualToString:v7];

    if ((v9 & 1) == 0)
    {
      v10 = sub_1000083A0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001E8D10(self, (uint64_t)v7, v10);
      }

      [(BCAssetReview *)self setAssetReviewID:v7];
      unsigned __int8 v11 = +[BCAssetReview userIDFromAssetReviewID:v7];
      [(BCAssetReview *)self setDifferentString:v11 forKey:@"userID"];
    }
    uint64_t v12 = [(BCAssetReview *)self modificationDate];
    if (v12)
    {
      unsigned int v13 = (void *)v12;
      unsigned int v14 = [(BCAssetReview *)self modificationDate];
      [v14 timeIntervalSinceReferenceDate];
      double v16 = v15;
      unsigned __int8 v17 = [v6 modificationDate];
      [v17 timeIntervalSinceReferenceDate];
      double v19 = v18;

      if (v16 > v19)
      {
        v20 = sub_1000083A0();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          unsigned __int8 v21 = [(BCAssetReview *)self assetReviewID];
          char v22 = [v6 recordID];
          char v23 = [v22 recordName];
          __int16 v24 = [(BCAssetReview *)self modificationDate];
          [v24 timeIntervalSinceReferenceDate];
          double v26 = v25;
          v27 = [v6 modificationDate];
          [v27 timeIntervalSinceReferenceDate];
          CFStringRef v28 = @"newer";
          *(_DWORD *)buf = 138412802;
          v45 = v21;
          if (v26 == v29) {
            CFStringRef v28 = @"the same";
          }
          __int16 v46 = 2112;
          v47 = v23;
          __int16 v48 = 2114;
          CFStringRef v49 = v28;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "BCAssetReview %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);
        }
        [(BCCloudData *)self incrementEditGeneration];
        goto LABEL_25;
      }
    }
    v30 = [v6 objectForKey:@"starRating"];
    [(BCAssetReview *)self setDifferentNumber:v30 forKey:@"starRating"];
    v31 = [v6 objectForKey:@"reviewTitle"];
    [(BCAssetReview *)self setDifferentString:v31 forKey:@"reviewTitle"];
    v32 = [v6 objectForKey:@"reviewBody"];
    [(BCAssetReview *)self setDifferentString:v32 forKey:@"reviewBody"];
    v33 = [v6 modificationDate];
    [(BCAssetReview *)self setDifferentDate:v33 forKey:@"modificationDate"];
    unsigned int v34 = [(BCAssetReview *)self hasChanges];
    v35 = +[BULogUtilities shared];
    unsigned int v36 = [v35 verboseLoggingEnabled];

    if (v34)
    {
      if (v36)
      {
        v37 = sub_10000CD80();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = [(BCAssetReview *)self assetReviewID];
          v42 = [v6 recordID];
          v39 = [v42 recordName];
          v40 = [(BCAssetReview *)self debugDescription];
          *(_DWORD *)buf = 138412802;
          v45 = v38;
          __int16 v46 = 2112;
          v47 = v39;
          __int16 v48 = 2112;
          CFStringRef v49 = v40;
          v41 = "\"\\\"BCAssetReview %@ Resolving: Adopted properties from record: %@ %@\\\"\"";
LABEL_22:
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v41, buf, 0x20u);

          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
    else if (v36)
    {
      v37 = sub_10000CD80();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = [(BCAssetReview *)self assetReviewID];
        v42 = [v6 recordID];
        v39 = [v42 recordName];
        v40 = [(BCAssetReview *)self debugDescription];
        *(_DWORD *)buf = 138412802;
        v45 = v38;
        __int16 v46 = 2112;
        v47 = v39;
        __int16 v48 = 2112;
        CFStringRef v49 = v40;
        v41 = "\"\\\"BCAssetReview %@ Resolving: Identical properties from record: %@ %@\\\"\"";
        goto LABEL_22;
      }
LABEL_23:
    }
    goto LABEL_25;
  }
  id v7 = sub_1000083A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1001E8C78(self, v7);
  }
LABEL_25:
}

- (id)recordType
{
  return @"assetReview";
}

+ (id)propertyIDKey
{
  return @"assetReviewID";
}

- (double)normalizedStarRating
{
  v2 = +[NSNumber numberWithShort:[(BCAssetReview *)self starRating]];
  [v2 floatValue];
  double v4 = v3 / 5.0;

  return v4;
}

- (void)setNormalizedStarRating:(double)a3
{
  id v4 = +[NSNumber numberWithDouble:floor(a3 * 5.0)];
  -[BCAssetReview setStarRating:](self, "setStarRating:", (__int16)[v4 integerValue]);
}

- (id)zoneName
{
  return @"AssetZone";
}

- (NSString)debugDescription
{
  float v3 = [(BCAssetReview *)self assetReviewID];
  signed int v4 = [(BCAssetReview *)self starRating];
  BOOL v5 = [(BCAssetReview *)self reviewTitle];
  id v6 = [(BCAssetReview *)self reviewBody];
  id v7 = +[NSString stringWithFormat:@"assetReviewID: %@, starRating: %hd, reviewTitle: %@, reviewBody: %@", v3, v4, v5, v6];

  return (NSString *)v7;
}

+ (id)assetReviewIDWithUserID:(id)a3 assetID:(id)a4
{
  return +[NSString stringWithFormat:@"%@|%@", a3, a4];
}

+ (id)assetIDFromAssetReviewID:(id)a3
{
  id v3 = a3;
  signed int v4 = (char *)[v3 rangeOfString:@"|"];
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

+ (id)userIDFromAssetReviewID:(id)a3
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