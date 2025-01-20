@interface BCAssetDetail
+ (id)propertyIDKey;
- (BOOL)isAudiobook;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (BOOL)setDifferentBookmarkTime:(double)a3;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromAssetDetail:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BCAssetDetail

- (id)mutableCopy
{
  v3 = [BCMutableAssetDetail alloc];
  return [(BCMutableAssetDetail *)v3 initWithCloudData:self];
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v6 = BUProtocolCast();
  if (v6)
  {
    [(BCAssetDetail *)self _configureFromAssetDetail:v6 withMergers:v5];
  }
  else
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001E65B0();
    }
  }
}

- (void)_configureFromAssetDetail:(id)a3 withMergers:(id)a4
{
  id v6 = a3;
  v62.receiver = self;
  v62.super_class = (Class)BCAssetDetail;
  [(BCCloudData *)&v62 configureFromCloudData:v6 withMergers:a4];
  v7 = [v6 assetID];
  [(BCAssetDetail *)self setDifferentString:v7 forKey:@"assetID"];

  v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isFinished]);
  [(BCAssetDetail *)self setDifferentNumber:v8 forKey:@"isFinished"];

  v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 notFinished]);
  [(BCAssetDetail *)self setDifferentNumber:v9 forKey:@"notFinished"];

  unsigned __int8 v10 = [(BCAssetDetail *)self taste];
  unsigned __int8 v11 = [v6 taste];
  int v12 = v10 & 3;
  if ((v11 & 3) != 0) {
    int v12 = v11 & 3;
  }
  v13 = +[NSNumber numberWithShort:v12 | (v11 | v10) & 4u];
  [(BCAssetDetail *)self setDifferentNumber:v13 forKey:@"taste"];

  v14 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v6 tasteSyncedToStore]);
  [(BCAssetDetail *)self setDifferentNumber:v14 forKey:@"tasteSyncedToStore"];

  v15 = [v6 dateFinished];
  [(BCAssetDetail *)self setDifferentDate:v15 forKey:@"dateFinished"];

  v16 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v6 finishedDateKind]);
  [(BCAssetDetail *)self setDifferentNumber:v16 forKey:@"finishedDateKind"];

  v17 = [v6 lastOpenDate];
  [(BCAssetDetail *)self setDifferentDate:v17 forKey:@"lastOpenDate"];

  v18 = [v6 readingPositionLocationUpdateDate];
  v19 = v18;
  if (v18)
  {
    [v18 timeIntervalSinceReferenceDate];
    double v21 = v20;
    v22 = [(BCAssetDetail *)self readingPositionLocationUpdateDate];
    [v22 timeIntervalSinceReferenceDate];
    double v24 = v23;

    if (v21 > v24)
    {
      [v6 readingProgress];
      v25 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(BCAssetDetail *)self setDifferentNumber:v25 forKey:@"readingProgress"];

      [v6 readingProgressHighWaterMark];
      v26 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(BCAssetDetail *)self setDifferentNumber:v26 forKey:@"readingProgressHighWaterMark"];

      v27 = [v6 readingPositionCFIString];
      [(BCAssetDetail *)self setDifferentString:v27 forKey:@"readingPositionCFIString"];

      v28 = [v6 readingPositionAnnotationVersion];
      [(BCAssetDetail *)self setDifferentString:v28 forKey:@"readingPositionAnnotationVersion"];

      v29 = [v6 readingPositionAssetVersion];
      [(BCAssetDetail *)self setDifferentString:v29 forKey:@"readingPositionAssetVersion"];

      v30 = [v6 readingPositionUserData];
      [(BCAssetDetail *)self setDifferentValue:v30 forKey:@"readingPositionUserData" klass:objc_opt_class()];

      v31 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 readingPositionLocationRangeStart]);
      [(BCAssetDetail *)self setDifferentNumber:v31 forKey:@"readingPositionLocationRangeStart"];

      v32 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 readingPositionLocationRangeEnd]);
      [(BCAssetDetail *)self setDifferentNumber:v32 forKey:@"readingPositionLocationRangeEnd"];

      v33 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 readingPositionAbsolutePhysicalLocation]);
      [(BCAssetDetail *)self setDifferentNumber:v33 forKey:@"readingPositionAbsolutePhysicalLocation"];

      v34 = [v6 readingPositionStorageUUID];
      [(BCAssetDetail *)self setDifferentString:v34 forKey:@"readingPositionStorageUUID"];

      [(BCAssetDetail *)self setDifferentDate:v19 forKey:@"readingPositionLocationUpdateDate"];
    }
  }
  v35 = [v6 datePlaybackTimeUpdated];
  if (v35)
  {
    uint64_t v36 = [(BCAssetDetail *)self datePlaybackTimeUpdated];
    if (!v36) {
      goto LABEL_9;
    }
    v37 = (void *)v36;
    [v35 timeIntervalSinceReferenceDate];
    double v39 = v38;
    v40 = [(BCAssetDetail *)self datePlaybackTimeUpdated];
    [v40 timeIntervalSinceReferenceDate];
    double v42 = v41;

    if (v39 <= v42)
    {
      v50 = sub_10000CEB0();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = [(BCAssetDetail *)self assetID];
        v52 = [(BCAssetDetail *)self datePlaybackTimeUpdated];
        [(BCAssetDetail *)self bookmarkTime];
        v54 = v53;
        [v6 bookmarkTime];
        *(_DWORD *)buf = 138413314;
        v64 = v51;
        __int16 v65 = 2112;
        v66 = v52;
        __int16 v67 = 2048;
        v68 = v54;
        __int16 v69 = 2112;
        v70 = v35;
        __int16 v71 = 2048;
        double v72 = v55;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Audiobook Configuring bookmark time, ignoring as my bookmark time is same or newer old:[%@ = %.2f] new:[%@ = %.2f].", buf, 0x34u);
      }
    }
    else
    {
LABEL_9:
      [v6 bookmarkTime];
      double v44 = v43;
      v45 = sub_10000CEB0();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = [(BCAssetDetail *)self assetID];
        v47 = [(BCAssetDetail *)self datePlaybackTimeUpdated];
        [(BCAssetDetail *)self bookmarkTime];
        *(_DWORD *)buf = 138413314;
        v64 = v46;
        __int16 v65 = 2112;
        v66 = v47;
        __int16 v67 = 2048;
        v68 = v48;
        __int16 v69 = 2112;
        v70 = v35;
        __int16 v71 = 2048;
        double v72 = v44;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Audiobook Configuring bookmark time old:[%@ = %.2f] new:[%@ = %.2f].", buf, 0x34u);
      }
      v49 = [v6 datePlaybackTimeUpdated];
      [(BCAssetDetail *)self setDifferentDate:v49 forKey:@"datePlaybackTimeUpdated"];

      [(BCAssetDetail *)self setDifferentBookmarkTime:v44];
    }
  }
  v56 = +[BULogUtilities shared];
  unsigned int v57 = [v56 verboseLoggingEnabled];

  if (v57)
  {
    v58 = sub_10000CD80();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = [(BCAssetDetail *)self assetID];
      v60 = [(BCAssetDetail *)self debugDescription];
      v61 = [v6 assetID];
      *(_DWORD *)buf = 138412802;
      v64 = v59;
      __int16 v65 = 2112;
      v66 = v60;
      __int16 v67 = 2112;
      v68 = v61;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "\"\\\"BCAssetDetail configured: %@ %@ from assetDetail:%@\\\"\"", buf, 0x20u);
    }
  }
}

- (BOOL)setDifferentBookmarkTime:(double)a3
{
  [(BCAssetDetail *)self bookmarkTime];
  if (v5 == a3 || vabdd_f64(a3, v5) <= 0.001) {
    return 0;
  }
  [(BCAssetDetail *)self setBookmarkTime:a3];
  return 1;
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = BUProtocolCast();
  v82.receiver = self;
  v82.super_class = (Class)BCAssetDetail;
  unsigned int v8 = [(BCCloudData *)&v82 isEqualExceptForDate:v6 ignoringEmptySalt:v4];

  v9 = [(BCAssetDetail *)self assetID];
  unsigned __int8 v10 = [v7 assetID];
  unsigned int v80 = [v9 isEqualToString:v10];

  uint64_t v11 = (uint64_t)[(BCAssetDetail *)self isFinished];
  unsigned int v12 = [v7 isFinished];
  unsigned int v78 = [(BCAssetDetail *)self notFinished];
  unsigned int v77 = [v7 notFinished];
  unsigned int v13 = [(BCAssetDetail *)self taste];
  unsigned int v60 = [v7 taste];
  unsigned int v59 = [(BCAssetDetail *)self tasteSyncedToStore];
  unsigned int v58 = [v7 tasteSyncedToStore];
  v14 = [(BCAssetDetail *)self dateFinished];
  if (!v14)
  {
    unsigned __int8 v10 = [v7 dateFinished];
    if (!v10)
    {
      unsigned int v76 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v15 = [(BCAssetDetail *)self dateFinished];
  v16 = [v7 dateFinished];
  unsigned int v76 = [v15 isEqualToDate:v16];

  if (!v14) {
    goto LABEL_6;
  }
LABEL_7:

  unsigned int v75 = [(BCAssetDetail *)self finishedDateKind];
  unsigned int v74 = [v7 finishedDateKind];
  v17 = [(BCAssetDetail *)self lastOpenDate];
  if (!v17)
  {
    unsigned __int8 v10 = [v7 lastOpenDate];
    if (!v10)
    {
      unsigned int v73 = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  v18 = [(BCAssetDetail *)self lastOpenDate];
  v19 = [v7 lastOpenDate];
  unsigned int v73 = [v18 isEqualToDate:v19];

  if (!v17) {
    goto LABEL_12;
  }
LABEL_13:

  [(BCAssetDetail *)self readingProgress];
  float v21 = v20;
  [v7 readingProgress];
  float v23 = v22;
  [(BCAssetDetail *)self readingProgressHighWaterMark];
  float v25 = v24;
  [v7 readingProgressHighWaterMark];
  float v27 = v26;
  v28 = [(BCAssetDetail *)self readingPositionCFIString];
  if (!v28)
  {
    unsigned __int8 v10 = [v7 readingPositionCFIString];
    if (!v10)
    {
      unsigned int v72 = 1;
LABEL_18:

      goto LABEL_19;
    }
  }
  v29 = [(BCAssetDetail *)self readingPositionCFIString];
  v30 = [v7 readingPositionCFIString];
  unsigned int v72 = [v29 isEqualToString:v30];

  if (!v28) {
    goto LABEL_18;
  }
LABEL_19:

  v31 = [(BCAssetDetail *)self readingPositionAssetVersion];
  if (!v31)
  {
    unsigned __int8 v10 = [v7 readingPositionAssetVersion];
    if (!v10)
    {
      unsigned int v70 = 1;
LABEL_24:

      goto LABEL_25;
    }
  }
  v32 = [(BCAssetDetail *)self readingPositionAssetVersion];
  v33 = [v7 readingPositionAssetVersion];
  unsigned int v70 = [v32 isEqualToString:v33];

  if (!v31) {
    goto LABEL_24;
  }
LABEL_25:

  v34 = [(BCAssetDetail *)self readingPositionAnnotationVersion];
  if (!v34)
  {
    unsigned __int8 v10 = [v7 readingPositionAnnotationVersion];
    if (!v10)
    {
      unsigned int v69 = 1;
LABEL_30:

      goto LABEL_31;
    }
  }
  v35 = [(BCAssetDetail *)self readingPositionAnnotationVersion];
  uint64_t v36 = [v7 readingPositionAnnotationVersion];
  unsigned int v69 = [v35 isEqualToString:v36];

  if (!v34) {
    goto LABEL_30;
  }
LABEL_31:

  v37 = [(BCAssetDetail *)self readingPositionUserData];
  unsigned int v81 = v8;
  if (!v37)
  {
    unsigned __int8 v10 = [v7 readingPositionUserData];
    if (!v10)
    {
      unsigned int v71 = 1;
LABEL_36:

      goto LABEL_37;
    }
  }
  double v38 = [(BCAssetDetail *)self readingPositionUserData];
  double v39 = [v7 readingPositionUserData];
  unsigned int v71 = [v38 isEqual:v39];

  if (!v37) {
    goto LABEL_36;
  }
LABEL_37:

  unsigned int v68 = [(BCAssetDetail *)self readingPositionLocationRangeStart];
  unsigned int v67 = [v7 readingPositionLocationRangeStart];
  unsigned int v66 = [(BCAssetDetail *)self readingPositionLocationRangeEnd];
  unsigned int v65 = [v7 readingPositionLocationRangeEnd];
  unsigned int v64 = [(BCAssetDetail *)self readingPositionAbsolutePhysicalLocation];
  unsigned int v63 = [v7 readingPositionAbsolutePhysicalLocation];
  v40 = [(BCAssetDetail *)self readingPositionStorageUUID];
  double v41 = [v7 readingPositionStorageUUID];

  objc_super v62 = v40;
  double v42 = [(BCAssetDetail *)self readingPositionLocationUpdateDate];
  if (!v42)
  {
    unsigned __int8 v10 = [v7 readingPositionLocationUpdateDate];
    if (!v10)
    {
      unsigned int v61 = 1;
LABEL_42:

      goto LABEL_43;
    }
  }
  [(BCAssetDetail *)self readingPositionLocationUpdateDate];
  v44 = uint64_t v43 = v11;
  [v7 readingPositionLocationUpdateDate];
  v46 = unsigned int v45 = v12;
  unsigned int v61 = [v44 isEqualToDate:v46];

  unsigned int v12 = v45;
  uint64_t v11 = v43;
  if (!v42) {
    goto LABEL_42;
  }
LABEL_43:
  int v47 = v11 ^ v12;
  int v48 = v78 ^ v77;

  v49 = [(BCAssetDetail *)self datePlaybackTimeUpdated];
  if (!v49)
  {
    uint64_t v11 = [v7 datePlaybackTimeUpdated];
    if (!v11)
    {
      unsigned __int8 v79 = 1;
LABEL_48:

      goto LABEL_49;
    }
  }
  v50 = [(BCAssetDetail *)self datePlaybackTimeUpdated];
  [v7 datePlaybackTimeUpdated];
  v52 = unsigned int v51 = v13;
  unsigned __int8 v79 = [v50 isEqualToDate:v52];

  unsigned int v13 = v51;
  if (!v49) {
    goto LABEL_48;
  }
LABEL_49:

  [(BCAssetDetail *)self bookmarkTime];
  double v54 = v53;
  [v7 bookmarkTime];
  BOOL v56 = 0;
  if (((v81 & v80 ^ 1 | v47 | v48) & 1) == 0
    && ((v76 ^ 1) & 1) == 0
    && v75 == v74
    && ((v73 ^ 1) & 1) == 0
    && v21 == v23
    && v25 == v27
    && ((v72 ^ 1) & 1) == 0
    && ((v71 ^ 1) & 1) == 0
    && ((v70 ^ 1) & 1) == 0
    && ((v69 ^ 1) & 1) == 0
    && v68 == v67
    && v66 == v65
    && v64 == v63
    && v62 == v41
    && ((v61 ^ 1) & 1) == 0
    && v13 == v60
    && v59 == v58)
  {
    if (v54 == v55) {
      BOOL v56 = v79;
    }
    else {
      BOOL v56 = 0;
    }
  }

  return v56;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  id v6 = a3;
  v153.receiver = self;
  v153.super_class = (Class)BCAssetDetail;
  [(BCCloudData *)&v153 resolveConflictsFromRecord:v6 withResolvers:a4];
  if (v6)
  {
    v7 = +[BULogUtilities shared];
    unsigned int v8 = [v7 verboseLoggingEnabled];

    if (v8)
    {
      v9 = sub_10000CD80();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "\"\\\"BCAssetDetail resolveConflictsFromRecord:withResolvers: record != nil\\\"\"", buf, 2u);
      }
    }
    uint64_t v10 = +[BCCloudData localIdentifierFromRecord:v6];
    uint64_t v11 = [(BCAssetDetail *)self assetID];
    unsigned __int8 v12 = [v11 isEqualToString:v10];

    if ((v12 & 1) == 0)
    {
      unsigned int v13 = sub_1000083A0();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1001E667C(self, v10, v13);
      }

      [(BCAssetDetail *)self setAssetID:v10];
    }
    v152 = v10;
    uint64_t v14 = [(BCAssetDetail *)self modificationDate];
    if (!v14) {
      goto LABEL_12;
    }
    v15 = (void *)v14;
    v16 = [(BCAssetDetail *)self modificationDate];
    [v16 timeIntervalSinceReferenceDate];
    double v18 = v17;
    v19 = [v6 modificationDate];
    [v19 timeIntervalSinceReferenceDate];
    double v21 = v20;

    if (v18 >= v21)
    {
      unsigned int v66 = [(BCAssetDetail *)self modificationDate];
      if (v66)
      {
        unsigned int v67 = [v6 modificationDate];
        [v67 timeIntervalSinceReferenceDate];
        double v69 = v68;
        unsigned int v70 = [(BCAssetDetail *)self modificationDate];
        [v70 timeIntervalSinceReferenceDate];
        BOOL v39 = v69 != v71;
      }
      else
      {
        BOOL v39 = 0;
      }

      float v26 = sub_1000083A0();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v137 = [(BCAssetDetail *)self assetID];
        v138 = [v6 recordID];
        v139 = [v138 recordName];
        v140 = [(BCAssetDetail *)self modificationDate];
        [v140 timeIntervalSinceReferenceDate];
        double v142 = v141;
        v143 = [v6 modificationDate];
        [v143 timeIntervalSinceReferenceDate];
        CFStringRef v144 = @"newer";
        *(_DWORD *)buf = 138412802;
        v155 = v137;
        if (v142 == v145) {
          CFStringRef v144 = @"the same";
        }
        __int16 v156 = 2112;
        v157 = v139;
        __int16 v158 = 2114;
        CFStringRef v159 = v144;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "BCAssetDetail %@ Resolving conflicts from record %@, keeping my basic properties as my modification date is %{public}@.", buf, 0x20u);
      }
    }
    else
    {
LABEL_12:
      float v22 = sub_1000083A0();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        float v23 = [(BCAssetDetail *)self assetID];
        float v24 = [v6 recordID];
        float v25 = [v24 recordName];
        *(_DWORD *)buf = 138412546;
        v155 = v23;
        __int16 v156 = 2112;
        v157 = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "BCAssetDetail %@ Resolving conflicts from record %@ adopting general record properties.", buf, 0x16u);
      }
      float v26 = [v6 objectForKey:@"isFinished"];
      [(BCAssetDetail *)self setDifferentNumber:v26 forKey:@"isFinished"];
      float v27 = [v6 objectForKey:@"notFinished"];
      [(BCAssetDetail *)self setDifferentNumber:v27 forKey:@"notFinished"];
      v28 = [v6 objectForKey:@"taste"];
      unsigned __int8 v29 = [(BCAssetDetail *)self taste];
      unsigned __int8 v30 = [v28 shortValue];
      int v31 = v29 & 3;
      if ((v30 & 3) != 0) {
        int v31 = v30 & 3;
      }
      v32 = +[NSNumber numberWithShort:v31 | (v30 | v29) & 4u];
      [(BCAssetDetail *)self setDifferentNumber:v32 forKey:@"taste"];

      v33 = [v6 objectForKey:@"tasteSyncedToStore"];
      [(BCAssetDetail *)self setDifferentNumber:v33 forKey:@"tasteSyncedToStore"];
      v34 = [v6 objectForKey:@"dateFinished"];
      [(BCAssetDetail *)self setDifferentDate:v34 forKey:@"dateFinished"];
      v35 = [v6 encryptedValues];
      uint64_t v36 = [v35 objectForKeyedSubscript:@"finishedDateKind"];

      [(BCAssetDetail *)self setDifferentNumber:v36 forKey:@"finishedDateKind"];
      v37 = [v6 objectForKey:@"lastOpenDate"];
      [(BCAssetDetail *)self setDifferentDate:v37 forKey:@"lastOpenDate"];
      double v38 = [v6 modificationDate];
      [(BCAssetDetail *)self setDifferentDate:v38 forKey:@"modificationDate"];

      BOOL v39 = 0;
    }

    v40 = [v6 objectForKey:@"readingPositionLocationUpdateDate"];
    double v41 = v40;
    if (v40
      && ([v40 timeIntervalSinceReferenceDate],
          double v43 = v42,
          [(BCAssetDetail *)self readingPositionLocationUpdateDate],
          double v44 = objc_claimAutoreleasedReturnValue(),
          [v44 timeIntervalSinceReferenceDate],
          double v46 = v45,
          v44,
          v43 > v46))
    {
      BOOL v150 = v39;
      v151 = v41;
      int v47 = sub_1000083A0();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        int v48 = [(BCAssetDetail *)self assetID];
        v49 = [v6 recordID];
        v50 = [v49 recordName];
        *(_DWORD *)buf = 138412546;
        v155 = v48;
        __int16 v156 = 2112;
        v157 = v50;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "BCAssetDetail %@ Resolving conflicts from record %@ adopting reading position properties.", buf, 0x16u);
      }
      unsigned int v51 = [v6 objectForKey:@"readingProgress"];
      [(BCAssetDetail *)self setDifferentNumber:v51 forKey:@"readingProgress"];
      v149 = [v6 objectForKey:@"readingProgressHighWaterMark"];
      [(BCAssetDetail *)self setDifferentNumber:v149 forKey:@"readingProgressHighWaterMark"];
      v148 = [v6 objectForKey:@"readingPositionCFIString"];
      [(BCAssetDetail *)self setDifferentString:v148 forKey:@"readingPositionCFIString"];
      v147 = [v6 objectForKey:@"readingPositionAssetVersion"];
      [(BCAssetDetail *)self setDifferentString:v147 forKey:@"readingPositionAssetVersion"];
      v146 = [v6 objectForKey:@"readingPositionAnnotationVersion"];
      [(BCAssetDetail *)self setDifferentString:v146 forKey:@"readingPositionAnnotationVersion"];
      v52 = [v6 objectForKey:@"readingPositionUserData"];
      [(BCAssetDetail *)self setDifferentValue:v52 forKey:@"readingPositionUserData" klass:objc_opt_class()];
      double v53 = [v6 objectForKey:@"readingPositionLocationRangeStart"];
      [(BCAssetDetail *)self setDifferentNumber:v53 forKey:@"readingPositionLocationRangeStart"];
      double v54 = [v6 objectForKey:@"readingPositionLocationRangeEnd"];
      [(BCAssetDetail *)self setDifferentNumber:v54 forKey:@"readingPositionLocationRangeEnd"];
      double v55 = [v6 objectForKey:@"readingPositionAbsolutePhysicalLocation"];
      [(BCAssetDetail *)self setDifferentNumber:v55 forKey:@"readingPositionAbsolutePhysicalLocation"];
      BOOL v56 = [v6 objectForKey:@"readingPositionStorageUUID"];
      [(BCAssetDetail *)self setDifferentString:v56 forKey:@"readingPositionStorageUUID"];
      unsigned int v57 = [v6 objectForKey:@"readingPositionLocationUpdateDate"];
      [(BCAssetDetail *)self setDifferentDate:v57 forKey:@"readingPositionLocationUpdateDate"];

      double v41 = v151;
      int v58 = v150;
    }
    else
    {
      unsigned int v59 = [(BCAssetDetail *)self readingPositionLocationUpdateDate];
      if (v59)
      {
        [v41 timeIntervalSinceReferenceDate];
        double v61 = v60;
        objc_super v62 = [(BCAssetDetail *)self readingPositionLocationUpdateDate];
        [v62 timeIntervalSinceReferenceDate];
        BOOL v64 = v61 != v63;
      }
      else
      {
        BOOL v64 = 0;
      }

      int v58 = v64 || v39;
      unsigned int v51 = sub_1000083A0();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        unsigned int v72 = [(BCAssetDetail *)self assetID];
        unsigned int v73 = [v6 recordID];
        unsigned int v74 = [v73 recordName];
        unsigned int v75 = [(BCAssetDetail *)self readingPositionLocationUpdateDate];
        [v75 timeIntervalSinceReferenceDate];
        double v77 = v76;
        [v41 timeIntervalSinceReferenceDate];
        CFStringRef v78 = @"newer";
        *(_DWORD *)buf = 138412802;
        v155 = v72;
        if (v77 == v79) {
          CFStringRef v78 = @"the same";
        }
        __int16 v156 = 2112;
        v157 = v74;
        __int16 v158 = 2114;
        CFStringRef v159 = v78;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "BCAssetDetail %@ Resolving conflicts from record %@, keeping my reading position properties as my reading position update date is %{public}@.", buf, 0x20u);
      }
    }

    unsigned int v80 = [v6 objectForKey:@"datePlaybackTimeUpdated"];
    if (v80)
    {
      uint64_t v81 = [(BCAssetDetail *)self datePlaybackTimeUpdated];
      if (!v81) {
        goto LABEL_36;
      }
      objc_super v82 = (void *)v81;
      [v80 timeIntervalSinceReferenceDate];
      double v84 = v83;
      v85 = [(BCAssetDetail *)self datePlaybackTimeUpdated];
      [v85 timeIntervalSinceReferenceDate];
      double v87 = v86;

      if (v84 > v87)
      {
LABEL_36:
        v88 = sub_1000083A0();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          v89 = [(BCAssetDetail *)self assetID];
          v90 = [v6 recordID];
          v91 = [v90 recordName];
          *(_DWORD *)buf = 138412546;
          v155 = v89;
          __int16 v156 = 2112;
          v157 = v91;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Resolving conflicts from record %@ adopting playback time properties.", buf, 0x16u);
        }
        v92 = [v6 objectForKey:@"bookmarkTime"];
        v93 = v92;
        if (v92)
        {
          [v92 doubleValue];
          double v95 = v94;
          v96 = sub_10000CEB0();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
          {
            v97 = [(BCAssetDetail *)self assetID];
            v98 = [(BCAssetDetail *)self datePlaybackTimeUpdated];
            [(BCAssetDetail *)self bookmarkTime];
            *(_DWORD *)buf = 138413314;
            v155 = v97;
            __int16 v156 = 2112;
            v157 = v98;
            __int16 v158 = 2048;
            CFStringRef v159 = v99;
            __int16 v160 = 2112;
            v161 = v80;
            __int16 v162 = 2048;
            double v163 = v95;
            _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Audiobook Resolving bookmark time old:[%@ = %.2f] new:[%@ = %.2f].", buf, 0x34u);
          }
          [(BCAssetDetail *)self setDifferentDate:v80 forKey:@"datePlaybackTimeUpdated"];
          [(BCAssetDetail *)self setDifferentBookmarkTime:v95];
        }
        else
        {
          v125 = sub_10000CEB0();
          if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
          {
            v126 = [(BCAssetDetail *)self assetID];
            *(_DWORD *)buf = 138412290;
            v155 = v126;
            _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Audiobook Resolving bookmark time, ignoring as bookmark time is NULL.", buf, 0xCu);
          }
        }
LABEL_62:

        if ((v58 & 1) == 0) {
          goto LABEL_64;
        }
        goto LABEL_63;
      }
    }
    v100 = [(BCAssetDetail *)self datePlaybackTimeUpdated];
    if (v100)
    {
      [v80 timeIntervalSinceReferenceDate];
      double v102 = v101;
      v103 = [(BCAssetDetail *)self datePlaybackTimeUpdated];
      [v103 timeIntervalSinceReferenceDate];
      double v105 = v104;

      if (v102 != v105) {
        int v58 = 1;
      }
    }

    if (!v80)
    {
      v116 = sub_10000CEB0();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
      {
        v117 = [(BCAssetDetail *)self assetID];
        v118 = [v6 recordID];
        v119 = [v118 recordName];
        v120 = [(BCAssetDetail *)self datePlaybackTimeUpdated];
        [v120 timeIntervalSinceReferenceDate];
        double v122 = v121;
        [0 timeIntervalSinceReferenceDate];
        CFStringRef v123 = @"newer";
        *(_DWORD *)buf = 138412802;
        v155 = v117;
        if (v122 == v124) {
          CFStringRef v123 = @"the same";
        }
        __int16 v156 = 2112;
        v157 = v119;
        __int16 v158 = 2114;
        CFStringRef v159 = v123;
        _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "BCAssetDetail %@ Resolving conflicts from record %@, keeping my playback time properties as my playback time update date is %{public}@.", buf, 0x20u);
      }
      if (!v58)
      {
LABEL_64:
        unsigned int v128 = [(BCAssetDetail *)self hasChanges];
        v129 = +[BULogUtilities shared];
        unsigned int v130 = [v129 verboseLoggingEnabled];

        if (v128)
        {
          if (v130)
          {
            v131 = sub_10000CD80();
            if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
            {
              v132 = [(BCAssetDetail *)self assetID];
              v133 = [v6 recordID];
              v134 = [v133 recordName];
              v135 = [(BCAssetDetail *)self debugDescription];
              *(_DWORD *)buf = 138412802;
              v155 = v132;
              __int16 v156 = 2112;
              v157 = v134;
              __int16 v158 = 2112;
              CFStringRef v159 = v135;
              v136 = "\"\\\"BCAssetDetail %@ Resolving: Adopted properties from record: %@ %@\\\"\"";
LABEL_71:
              _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEFAULT, v136, buf, 0x20u);

              goto LABEL_72;
            }
            goto LABEL_72;
          }
        }
        else if (v130)
        {
          v131 = sub_10000CD80();
          if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
          {
            v132 = [(BCAssetDetail *)self assetID];
            v133 = [v6 recordID];
            v134 = [v133 recordName];
            v135 = [(BCAssetDetail *)self debugDescription];
            *(_DWORD *)buf = 138412802;
            v155 = v132;
            __int16 v156 = 2112;
            v157 = v134;
            __int16 v158 = 2112;
            CFStringRef v159 = v135;
            v136 = "\"\\\"BCAssetDetail %@ Resolving: Identical properties from record: %@ %@\\\"\"";
            goto LABEL_71;
          }
LABEL_72:
        }
        unsigned int v65 = v152;
        goto LABEL_74;
      }
LABEL_63:
      [(BCCloudData *)self incrementEditGeneration];
      goto LABEL_64;
    }
    v93 = [v6 objectForKey:@"bookmarkTime"];
    v106 = sub_10000CEB0();
    BOOL v107 = os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT);
    if (v93)
    {
      if (v107)
      {
        v108 = [(BCAssetDetail *)self assetID];
        v109 = [(BCAssetDetail *)self datePlaybackTimeUpdated];
        [(BCAssetDetail *)self bookmarkTime];
        CFStringRef v111 = v110;
        [v93 doubleValue];
        *(_DWORD *)buf = 138413314;
        v155 = v108;
        __int16 v156 = 2112;
        v157 = v109;
        __int16 v158 = 2048;
        CFStringRef v159 = v111;
        __int16 v160 = 2112;
        v161 = v80;
        __int16 v162 = 2048;
        double v163 = v112;
        v113 = "BCAssetDetail %@ Audiobook Resolving bookmark time, ignoring as my bookmark time is newer old:[%@ = %.2f]"
               " new:[%@ = %.2f].";
        v114 = v106;
        uint32_t v115 = 52;
LABEL_60:
        _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, v113, buf, v115);
      }
    }
    else if (v107)
    {
      v108 = [(BCAssetDetail *)self assetID];
      v109 = [(BCAssetDetail *)self datePlaybackTimeUpdated];
      [(BCAssetDetail *)self bookmarkTime];
      *(_DWORD *)buf = 138413058;
      v155 = v108;
      __int16 v156 = 2112;
      v157 = v109;
      __int16 v158 = 2048;
      CFStringRef v159 = v127;
      __int16 v160 = 2112;
      v161 = v80;
      v113 = "BCAssetDetail %@ Audiobook Resolving bookmark time, ignoring as my bookmark time is newer old:[%@ = %.2f] new:[%@ = NULL].";
      v114 = v106;
      uint32_t v115 = 42;
      goto LABEL_60;
    }

    goto LABEL_62;
  }
  unsigned int v65 = sub_1000083A0();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
    sub_1001E65E4(self, v65);
  }
LABEL_74:
}

- (id)recordType
{
  return @"assetDetail";
}

+ (id)propertyIDKey
{
  return @"assetID";
}

- (id)zoneName
{
  return @"AssetZone";
}

- (BOOL)isAudiobook
{
  v2 = [(BCAssetDetail *)self datePlaybackTimeUpdated];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)debugDescription
{
  unsigned __int8 v29 = [(BCAssetDetail *)self assetID];
  if ([(BCAssetDetail *)self isFinished]) {
    CFStringRef v3 = @"YES";
  }
  else {
    CFStringRef v3 = @"NO";
  }
  CFStringRef v28 = v3;
  if ([(BCAssetDetail *)self notFinished]) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  CFStringRef v27 = v4;
  float v26 = [(BCAssetDetail *)self dateFinished];
  signed int v25 = [(BCAssetDetail *)self finishedDateKind];
  float v24 = [(BCAssetDetail *)self lastOpenDate];
  signed int v23 = [(BCAssetDetail *)self taste];
  signed int v22 = [(BCAssetDetail *)self tasteSyncedToStore];
  [(BCAssetDetail *)self readingProgress];
  double v6 = v5;
  [(BCAssetDetail *)self readingProgressHighWaterMark];
  double v8 = v7;
  v9 = [(BCAssetDetail *)self readingPositionCFIString];
  double v21 = [(BCAssetDetail *)self readingPositionAnnotationVersion];
  double v20 = [(BCAssetDetail *)self readingPositionAssetVersion];
  uint64_t v10 = [(BCAssetDetail *)self readingPositionUserData];
  id v11 = [(BCAssetDetail *)self readingPositionLocationRangeStart];
  id v12 = [(BCAssetDetail *)self readingPositionLocationRangeEnd];
  id v13 = [(BCAssetDetail *)self readingPositionAbsolutePhysicalLocation];
  uint64_t v14 = [(BCAssetDetail *)self readingPositionStorageUUID];
  v15 = [(BCAssetDetail *)self readingPositionLocationUpdateDate];
  v16 = [(BCAssetDetail *)self datePlaybackTimeUpdated];
  [(BCAssetDetail *)self bookmarkTime];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"BCAssetDetail assetID: %@\n  (isFinished: %@, notFinished: %@, dateFinished: %@, finishedDateKind: %d, lastOpenDate: %@)  (taste: %x, tasteSyncedToStore: %d)  readingPosition=(\n    readingProgress:%.2f\n    readingProgressHighWaterMark:%.2f\n    cfi:%@\n    annotationVersion=%@\n    assetVersion=%@\n    userData=%@\n    locationRangeStart=%d    locationRangeEnd=%d    absolutePhysicalLocation=%d    storageUUID=%@\n    locationUpdateDate=%@)\n  playbackPosition=(\n    datePlaybackTimeUpdated=%@\n    bookmarkTime = %.2f)", v29, v28, v27, v26, v25, v24, v23, v22, *(void *)&v6, *(void *)&v8, v9, v21, v20, v10, v11, v12,
    v13,
    v14,
    v15,
    v16,
  double v18 = v17);

  return (NSString *)v18;
}

@end