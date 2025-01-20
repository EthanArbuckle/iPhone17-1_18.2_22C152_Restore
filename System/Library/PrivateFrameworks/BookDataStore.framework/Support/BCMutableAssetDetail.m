@interface BCMutableAssetDetail
+ (BOOL)supportsSecureCoding;
- (BCMutableAssetDetail)initWithAssetID:(id)a3;
- (BCMutableAssetDetail)initWithCloudData:(id)a3;
- (BCMutableAssetDetail)initWithCoder:(id)a3;
- (BCMutableAssetDetail)initWithRecord:(id)a3;
- (BOOL)isAudiobook;
- (BOOL)isFinished;
- (BOOL)notFinished;
- (NSData)readingPositionUserData;
- (NSDate)dateFinished;
- (NSDate)datePlaybackTimeUpdated;
- (NSDate)lastOpenDate;
- (NSDate)readingPositionLocationUpdateDate;
- (NSString)assetID;
- (NSString)description;
- (NSString)readingPositionAnnotationVersion;
- (NSString)readingPositionAssetVersion;
- (NSString)readingPositionCFIString;
- (NSString)readingPositionStorageUUID;
- (double)bookmarkTime;
- (float)readingProgress;
- (float)readingProgressHighWaterMark;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (int)readingPositionAbsolutePhysicalLocation;
- (int)readingPositionLocationRangeEnd;
- (int)readingPositionLocationRangeStart;
- (signed)finishedDateKind;
- (signed)taste;
- (signed)tasteSyncedToStore;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setBookmarkTime:(double)a3;
- (void)setDateFinished:(id)a3;
- (void)setDatePlaybackTimeUpdated:(id)a3;
- (void)setFinishedDateKind:(signed __int16)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setLastOpenDate:(id)a3;
- (void)setNotFinished:(BOOL)a3;
- (void)setReadingPositionAbsolutePhysicalLocation:(int)a3;
- (void)setReadingPositionAnnotationVersion:(id)a3;
- (void)setReadingPositionAssetVersion:(id)a3;
- (void)setReadingPositionCFIString:(id)a3;
- (void)setReadingPositionLocationRangeEnd:(int)a3;
- (void)setReadingPositionLocationRangeStart:(int)a3;
- (void)setReadingPositionLocationUpdateDate:(id)a3;
- (void)setReadingPositionStorageUUID:(id)a3;
- (void)setReadingPositionUserData:(id)a3;
- (void)setReadingProgress:(float)a3;
- (void)setReadingProgressHighWaterMark:(float)a3;
- (void)setTaste:(signed __int16)a3;
- (void)setTasteSyncedToStore:(signed __int16)a3;
@end

@implementation BCMutableAssetDetail

- (BCMutableAssetDetail)initWithAssetID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001E672C();
    }

    id v5 = 0;
    goto LABEL_7;
  }
  v9.receiver = self;
  v9.super_class = (Class)BCMutableAssetDetail;
  id v5 = [(BCMutableCloudData *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    self = (BCMutableAssetDetail *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v6;
LABEL_7:
  }
  return (BCMutableAssetDetail *)v5;
}

- (BCMutableAssetDetail)initWithCloudData:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BCMutableAssetDetail;
  id v5 = [(BCMutableCloudData *)&v43 initWithCloudData:v4];
  if (v5)
  {
    id v6 = BUProtocolCast();
    v7 = v6;
    if (v6)
    {
      v8 = [v6 assetID];
      objc_super v9 = (NSString *)[v8 copy];
      assetID = v5->_assetID;
      v5->_assetID = v9;

      v5->_isFinished = [v7 isFinished];
      v5->_notFinished = [v7 notFinished];
      v5->_taste = (unsigned __int16)[v7 taste];
      v5->_tasteSyncedToStore = (unsigned __int16)[v7 tasteSyncedToStore];
      v11 = [v7 dateFinished];
      v12 = (NSDate *)[v11 copy];
      dateFinished = v5->_dateFinished;
      v5->_dateFinished = v12;

      v5->_finishedDateKind = (unsigned __int16)[v7 finishedDateKind];
      v14 = [v7 lastOpenDate];
      v15 = (NSDate *)[v14 copy];
      lastOpenDate = v5->_lastOpenDate;
      v5->_lastOpenDate = v15;

      [v7 readingProgress];
      v5->_readingProgress = v17;
      [v7 readingProgressHighWaterMark];
      v5->_readingProgressHighWaterMark = v18;
      v19 = [v7 readingPositionCFIString];
      v20 = (NSString *)[v19 copy];
      readingPositionCFIString = v5->_readingPositionCFIString;
      v5->_readingPositionCFIString = v20;

      v22 = [v7 readingPositionAnnotationVersion];
      v23 = (NSString *)[v22 copy];
      readingPositionAnnotationVersion = v5->_readingPositionAnnotationVersion;
      v5->_readingPositionAnnotationVersion = v23;

      v25 = [v7 readingPositionAssetVersion];
      v26 = (NSString *)[v25 copy];
      readingPositionAssetVersion = v5->_readingPositionAssetVersion;
      v5->_readingPositionAssetVersion = v26;

      v28 = [v7 readingPositionUserData];
      v29 = (NSData *)[v28 copy];
      readingPositionUserData = v5->_readingPositionUserData;
      v5->_readingPositionUserData = v29;

      v5->_readingPositionLocationRangeStart = [v7 readingPositionLocationRangeStart];
      v5->_readingPositionLocationRangeEnd = [v7 readingPositionLocationRangeEnd];
      v5->_readingPositionAbsolutePhysicalLocation = [v7 readingPositionAbsolutePhysicalLocation];
      v31 = [v7 readingPositionStorageUUID];
      v32 = (NSString *)[v31 copy];
      readingPositionStorageUUID = v5->_readingPositionStorageUUID;
      v5->_readingPositionStorageUUID = v32;

      v34 = [v7 readingPositionLocationUpdateDate];
      v35 = (NSDate *)[v34 copy];
      readingPositionLocationUpdateDate = v5->_readingPositionLocationUpdateDate;
      v5->_readingPositionLocationUpdateDate = v35;

      v37 = [v7 datePlaybackTimeUpdated];
      v38 = (NSDate *)[v37 copy];
      datePlaybackTimeUpdated = v5->_datePlaybackTimeUpdated;
      v5->_datePlaybackTimeUpdated = v38;

      [v7 bookmarkTime];
      v5->_bookmarkTime = v40;
    }
    else
    {
      v41 = sub_1000083A0();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_1001E65B0();
      }

      id v5 = 0;
    }
  }
  return v5;
}

- (BCMutableAssetDetail)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v8 = sub_1000083A0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001E6760();
    }
    id v5 = 0;
    goto LABEL_7;
  }
  v37.receiver = self;
  v37.super_class = (Class)BCMutableAssetDetail;
  id v5 = [(BCMutableCloudData *)&v37 initWithRecord:v4];
  if (v5)
  {
    uint64_t v6 = +[BCCloudData localIdentifierFromRecord:v4];
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v6;

    self = [v4 objectForKey:@"isFinished"];
    v5->_isFinished = [(BCMutableAssetDetail *)self BOOLValue];
    v8 = [v4 objectForKey:@"notFinished"];
    v5->_notFinished = [v8 BOOLValue];
    v36 = [v4 objectForKey:@"taste"];
    v5->_taste = (unsigned __int16)[v36 integerValue];
    v35 = [v4 objectForKey:@"tasteSyncedToStore"];
    v5->_tasteSyncedToStore = (unsigned __int16)[v35 integerValue];
    uint64_t v9 = [v4 objectForKey:@"dateFinished"];
    dateFinished = v5->_dateFinished;
    v5->_dateFinished = (NSDate *)v9;

    v11 = [v4 encryptedValues];
    v34 = [v11 objectForKeyedSubscript:@"finishedDateKind"];

    v5->_finishedDateKind = (unsigned __int16)[v34 integerValue];
    uint64_t v12 = [v4 objectForKey:@"lastOpenDate"];
    lastOpenDate = v5->_lastOpenDate;
    v5->_lastOpenDate = (NSDate *)v12;

    v14 = [v4 objectForKey:@"readingProgress"];
    [v14 floatValue];
    v5->_readingProgress = v15;
    v16 = [v4 objectForKey:@"readingProgressHighWaterMark"];
    [v16 floatValue];
    v5->_readingProgressHighWaterMark = v17;
    uint64_t v18 = [v4 objectForKey:@"readingPositionCFIString"];
    readingPositionCFIString = v5->_readingPositionCFIString;
    v5->_readingPositionCFIString = (NSString *)v18;

    uint64_t v20 = [v4 objectForKey:@"readingPositionUserData"];
    readingPositionUserData = v5->_readingPositionUserData;
    v5->_readingPositionUserData = (NSData *)v20;

    v22 = [v4 objectForKey:@"readingPositionLocationRangeStart"];
    v5->_readingPositionLocationRangeStart = [v22 intValue];
    v23 = [v4 objectForKey:@"readingPositionLocationRangeEnd"];
    v5->_readingPositionLocationRangeEnd = [v23 intValue];
    v24 = [v4 objectForKey:@"readingPositionAbsolutePhysicalLocation"];
    v5->_readingPositionAbsolutePhysicalLocation = [v24 intValue];
    uint64_t v25 = [v4 objectForKey:@"readingPositionStorageUUID"];
    readingPositionStorageUUID = v5->_readingPositionStorageUUID;
    v5->_readingPositionStorageUUID = (NSString *)v25;

    uint64_t v27 = [v4 objectForKey:@"readingPositionLocationUpdateDate"];
    readingPositionLocationUpdateDate = v5->_readingPositionLocationUpdateDate;
    v5->_readingPositionLocationUpdateDate = (NSDate *)v27;

    uint64_t v29 = [v4 objectForKey:@"datePlaybackTimeUpdated"];
    datePlaybackTimeUpdated = v5->_datePlaybackTimeUpdated;
    v5->_datePlaybackTimeUpdated = (NSDate *)v29;

    v31 = [v4 objectForKey:@"bookmarkTime"];
    [v31 doubleValue];
    v5->_bookmarkTime = v32;

LABEL_7:
  }

  return v5;
}

- (NSString)description
{
  uint64_t v29 = [(BCMutableAssetDetail *)self assetID];
  if ([(BCMutableAssetDetail *)self isFinished]) {
    CFStringRef v3 = @"YES";
  }
  else {
    CFStringRef v3 = @"NO";
  }
  CFStringRef v28 = v3;
  if ([(BCMutableAssetDetail *)self notFinished]) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  CFStringRef v27 = v4;
  v26 = [(BCMutableAssetDetail *)self dateFinished];
  signed int v25 = [(BCMutableAssetDetail *)self finishedDateKind];
  v24 = [(BCMutableAssetDetail *)self lastOpenDate];
  signed int v23 = [(BCMutableAssetDetail *)self taste];
  signed int v22 = [(BCMutableAssetDetail *)self tasteSyncedToStore];
  [(BCMutableAssetDetail *)self readingProgress];
  double v6 = v5;
  [(BCMutableAssetDetail *)self readingProgressHighWaterMark];
  double v8 = v7;
  uint64_t v9 = [(BCMutableAssetDetail *)self readingPositionCFIString];
  v21 = [(BCMutableAssetDetail *)self readingPositionAnnotationVersion];
  uint64_t v20 = [(BCMutableAssetDetail *)self readingPositionAssetVersion];
  v10 = [(BCMutableAssetDetail *)self readingPositionUserData];
  uint64_t v11 = [(BCMutableAssetDetail *)self readingPositionLocationRangeStart];
  uint64_t v12 = [(BCMutableAssetDetail *)self readingPositionLocationRangeEnd];
  uint64_t v13 = [(BCMutableAssetDetail *)self readingPositionAbsolutePhysicalLocation];
  v14 = [(BCMutableAssetDetail *)self readingPositionStorageUUID];
  float v15 = [(BCMutableAssetDetail *)self readingPositionLocationUpdateDate];
  v16 = [(BCMutableAssetDetail *)self datePlaybackTimeUpdated];
  [(BCMutableAssetDetail *)self bookmarkTime];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"BCMutableAssetDetail assetID: %@\n  (isFinished: %@, notFinished: %@, dateFinished: %@, finishedDateKind: %d, lastOpenDate: %@)  (taste: %x, tasteSyncedToStore: %d)  readingPosition=(\n    readingProgress:%.2f\n    readingProgressHighWaterMark:%.2f\n    cfi:%@\n    annotationVersion=%@\n    assetVersion=%@\n    userData=%@\n    locationRangeStart=%d    locationRangeEnd=%d    absolutePhysicalLocation=%d    storageUUID=%@\n    locationUpdateDate=%@)\n  playbackPosition=(\n    datePlaybackTimeUpdated=%@\n    bookmarkTime = %.2f)", v29, v28, v27, v26, v25, v24, v23, v22, *(void *)&v6, *(void *)&v8, v9, v21, v20, v10, v11, v12,
    v13,
    v14,
    v15,
    v16,
  uint64_t v18 = v17);

  return (NSString *)v18;
}

- (id)recordType
{
  return @"assetDetail";
}

- (id)zoneName
{
  return @"AssetZone";
}

- (void)setReadingProgressHighWaterMark:(float)a3
{
  float readingProgressHighWaterMark = self->_readingProgressHighWaterMark;
  if (readingProgressHighWaterMark >= a3)
  {
    if (readingProgressHighWaterMark > a3)
    {
      double v6 = sub_1000083A0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        float v7 = [(BCMutableAssetDetail *)self assetID];
        double v8 = self->_readingProgressHighWaterMark;
        int v9 = 138412802;
        v10 = v7;
        __int16 v11 = 2048;
        double v12 = v8;
        __int16 v13 = 2048;
        double v14 = a3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "BCMutableAssetDetail %@ attempt to move readingProgressHighWaterMark backwards from %f to %f", (uint8_t *)&v9, 0x20u);
      }
    }
  }
  else
  {
    self->_float readingProgressHighWaterMark = a3;
  }
}

- (id)configuredRecordFromAttributes
{
  v26.receiver = self;
  v26.super_class = (Class)BCMutableAssetDetail;
  CFStringRef v3 = [(BCMutableCloudData *)&v26 configuredRecordFromAttributes];
  CFStringRef v4 = +[NSNumber numberWithBool:[(BCMutableAssetDetail *)self isFinished]];
  [v3 setObject:v4 forKey:@"isFinished"];

  float v5 = +[NSNumber numberWithBool:[(BCMutableAssetDetail *)self notFinished]];
  [v3 setObject:v5 forKey:@"notFinished"];

  double v6 = +[NSNumber numberWithShort:[(BCMutableAssetDetail *)self taste]];
  [v3 setObject:v6 forKey:@"taste"];

  float v7 = +[NSNumber numberWithShort:[(BCMutableAssetDetail *)self tasteSyncedToStore]];
  [v3 setObject:v7 forKey:@"tasteSyncedToStore"];

  double v8 = [(BCMutableAssetDetail *)self lastOpenDate];
  [v3 setObject:v8 forKey:@"lastOpenDate"];

  int v9 = [(BCMutableAssetDetail *)self dateFinished];
  [v3 setObject:v9 forKey:@"dateFinished"];

  if (_os_feature_enabled_impl())
  {
    v10 = +[NSNumber numberWithShort:[(BCMutableAssetDetail *)self finishedDateKind]];
    __int16 v11 = [v3 encryptedValues];
    [v11 setObject:v10 forKeyedSubscript:@"finishedDateKind"];
  }
  [(BCMutableAssetDetail *)self readingProgress];
  double v12 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v3 setObject:v12 forKey:@"readingProgress"];

  [(BCMutableAssetDetail *)self readingProgressHighWaterMark];
  __int16 v13 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v3 setObject:v13 forKey:@"readingProgressHighWaterMark"];

  double v14 = [(BCMutableAssetDetail *)self readingPositionCFIString];
  [v3 setObject:v14 forKey:@"readingPositionCFIString"];

  float v15 = [(BCMutableAssetDetail *)self readingPositionAnnotationVersion];
  [v3 setObject:v15 forKey:@"readingPositionAnnotationVersion"];

  v16 = [(BCMutableAssetDetail *)self readingPositionAssetVersion];
  [v3 setObject:v16 forKey:@"readingPositionAssetVersion"];

  uint64_t v17 = [(BCMutableAssetDetail *)self readingPositionUserData];
  [v3 setObject:v17 forKey:@"readingPositionUserData"];

  uint64_t v18 = +[NSNumber numberWithInt:[(BCMutableAssetDetail *)self readingPositionLocationRangeStart]];
  [v3 setObject:v18 forKey:@"readingPositionLocationRangeStart"];

  v19 = +[NSNumber numberWithInt:[(BCMutableAssetDetail *)self readingPositionLocationRangeEnd]];
  [v3 setObject:v19 forKey:@"readingPositionLocationRangeEnd"];

  uint64_t v20 = +[NSNumber numberWithInt:[(BCMutableAssetDetail *)self readingPositionAbsolutePhysicalLocation]];
  [v3 setObject:v20 forKey:@"readingPositionAbsolutePhysicalLocation"];

  v21 = [(BCMutableAssetDetail *)self readingPositionStorageUUID];
  [v3 setObject:v21 forKey:@"readingPositionStorageUUID"];

  signed int v22 = [(BCMutableAssetDetail *)self readingPositionLocationUpdateDate];
  [v3 setObject:v22 forKey:@"readingPositionLocationUpdateDate"];

  signed int v23 = [(BCMutableAssetDetail *)self datePlaybackTimeUpdated];
  [v3 setObject:v23 forKey:@"datePlaybackTimeUpdated"];

  [(BCMutableAssetDetail *)self bookmarkTime];
  v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v24 forKey:@"bookmarkTime"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)BCMutableAssetDetail;
  id v4 = a3;
  [(BCMutableCloudData *)&v16 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[BCMutableAssetDetail isFinished](self, "isFinished", v16.receiver, v16.super_class), @"isFinished");
  objc_msgSend(v4, "encodeBool:forKey:", -[BCMutableAssetDetail notFinished](self, "notFinished"), @"notFinished");
  objc_msgSend(v4, "encodeInt32:forKey:", -[BCMutableAssetDetail taste](self, "taste"), @"taste");
  objc_msgSend(v4, "encodeInt32:forKey:", -[BCMutableAssetDetail tasteSyncedToStore](self, "tasteSyncedToStore"), @"tasteSyncedToStore");
  float v5 = [(BCMutableAssetDetail *)self dateFinished];
  [v4 encodeObject:v5 forKey:@"dateFinished"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[BCMutableAssetDetail finishedDateKind](self, "finishedDateKind"), @"finishedDateKind");
  double v6 = [(BCMutableAssetDetail *)self lastOpenDate];
  [v4 encodeObject:v6 forKey:@"lastOpenDate"];

  [(BCMutableAssetDetail *)self readingProgress];
  [v4 encodeDouble:@"readingProgress" forKey:v7];
  [(BCMutableAssetDetail *)self readingProgressHighWaterMark];
  [v4 encodeDouble:@"readingProgressHighWaterMark" forKey:v8];
  int v9 = [(BCMutableAssetDetail *)self readingPositionCFIString];
  [v4 encodeObject:v9 forKey:@"readingPositionCFIString"];

  v10 = [(BCMutableAssetDetail *)self readingPositionAnnotationVersion];
  [v4 encodeObject:v10 forKey:@"readingPositionAnnotationVersion"];

  __int16 v11 = [(BCMutableAssetDetail *)self readingPositionAssetVersion];
  [v4 encodeObject:v11 forKey:@"readingPositionAssetVersion"];

  double v12 = [(BCMutableAssetDetail *)self readingPositionUserData];
  [v4 encodeObject:v12 forKey:@"readingPositionUserData"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[BCMutableAssetDetail readingPositionLocationRangeStart](self, "readingPositionLocationRangeStart"), @"readingPositionLocationRangeStart");
  objc_msgSend(v4, "encodeInt32:forKey:", -[BCMutableAssetDetail readingPositionLocationRangeEnd](self, "readingPositionLocationRangeEnd"), @"readingPositionLocationRangeEnd");
  objc_msgSend(v4, "encodeInt32:forKey:", -[BCMutableAssetDetail readingPositionAbsolutePhysicalLocation](self, "readingPositionAbsolutePhysicalLocation"), @"readingPositionAbsolutePhysicalLocation");
  __int16 v13 = [(BCMutableAssetDetail *)self readingPositionStorageUUID];
  [v4 encodeObject:v13 forKey:@"readingPositionStorageUUID"];

  double v14 = [(BCMutableAssetDetail *)self readingPositionLocationUpdateDate];
  [v4 encodeObject:v14 forKey:@"readingPositionLocationUpdateDate"];

  float v15 = [(BCMutableAssetDetail *)self datePlaybackTimeUpdated];
  [v4 encodeObject:v15 forKey:@"datePlaybackTimeUpdated"];

  [(BCMutableAssetDetail *)self bookmarkTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"bookmarkTime");
}

- (BCMutableAssetDetail)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BCMutableAssetDetail;
  float v5 = [(BCMutableCloudData *)&v31 initWithCoder:v4];
  double v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(BCMutableCloudData *)v5 localRecordID];
    assetID = v6->_assetID;
    v6->_assetID = (NSString *)v7;

    v6->_isFinished = [v4 decodeBoolForKey:@"isFinished"];
    v6->_notFinished = [v4 decodeBoolForKey:@"notFinished"];
    v6->_taste = (unsigned __int16)[v4 decodeInt32ForKey:@"taste"];
    v6->_tasteSyncedToStore = (unsigned __int16)[v4 decodeInt32ForKey:@"tasteSyncedToStore"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateFinished"];
    dateFinished = v6->_dateFinished;
    v6->_dateFinished = (NSDate *)v9;

    v6->_finishedDateKind = (unsigned __int16)[v4 decodeInt32ForKey:@"finishedDateKind"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastOpenDate"];
    lastOpenDate = v6->_lastOpenDate;
    v6->_lastOpenDate = (NSDate *)v11;

    [v4 decodeDoubleForKey:@"readingProgress"];
    *(float *)&double v13 = v13;
    v6->_readingProgress = *(float *)&v13;
    [v4 decodeDoubleForKey:@"readingProgressHighWaterMark"];
    *(float *)&double v14 = v14;
    v6->_float readingProgressHighWaterMark = *(float *)&v14;
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readingPositionCFIString"];
    readingPositionCFIString = v6->_readingPositionCFIString;
    v6->_readingPositionCFIString = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readingPositionAnnotationVersion"];
    readingPositionAnnotationVersion = v6->_readingPositionAnnotationVersion;
    v6->_readingPositionAnnotationVersion = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readingPositionAssetVersion"];
    readingPositionAssetVersion = v6->_readingPositionAssetVersion;
    v6->_readingPositionAssetVersion = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readingPositionUserData"];
    readingPositionUserData = v6->_readingPositionUserData;
    v6->_readingPositionUserData = (NSData *)v21;

    v6->_readingPositionLocationRangeStart = [v4 decodeInt32ForKey:@"readingPositionLocationRangeStart"];
    v6->_readingPositionLocationRangeEnd = [v4 decodeInt32ForKey:@"readingPositionLocationRangeEnd"];
    v6->_readingPositionAbsolutePhysicalLocation = [v4 decodeInt32ForKey:@"readingPositionAbsolutePhysicalLocation"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readingPositionStorageUUID"];
    readingPositionStorageUUID = v6->_readingPositionStorageUUID;
    v6->_readingPositionStorageUUID = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readingPositionLocationUpdateDate"];
    readingPositionLocationUpdateDate = v6->_readingPositionLocationUpdateDate;
    v6->_readingPositionLocationUpdateDate = (NSDate *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"datePlaybackTimeUpdated"];
    datePlaybackTimeUpdated = v6->_datePlaybackTimeUpdated;
    v6->_datePlaybackTimeUpdated = (NSDate *)v27;

    [v4 decodeDoubleForKey:@"bookmarkTime"];
    v6->_bookmarkTime = v29;
  }

  return v6;
}

- (BOOL)isAudiobook
{
  v2 = [(BCMutableAssetDetail *)self datePlaybackTimeUpdated];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (BOOL)notFinished
{
  return self->_notFinished;
}

- (void)setNotFinished:(BOOL)a3
{
  self->_notFinished = a3;
}

- (signed)taste
{
  return self->_taste;
}

- (void)setTaste:(signed __int16)a3
{
  self->_taste = a3;
}

- (signed)tasteSyncedToStore
{
  return self->_tasteSyncedToStore;
}

- (void)setTasteSyncedToStore:(signed __int16)a3
{
  self->_tasteSyncedToStore = a3;
}

- (NSDate)dateFinished
{
  return self->_dateFinished;
}

- (void)setDateFinished:(id)a3
{
}

- (signed)finishedDateKind
{
  return self->_finishedDateKind;
}

- (void)setFinishedDateKind:(signed __int16)a3
{
  self->_finishedDateKind = a3;
}

- (NSDate)lastOpenDate
{
  return self->_lastOpenDate;
}

- (void)setLastOpenDate:(id)a3
{
}

- (float)readingProgress
{
  return self->_readingProgress;
}

- (void)setReadingProgress:(float)a3
{
  self->_readingProgress = a3;
}

- (float)readingProgressHighWaterMark
{
  return self->_readingProgressHighWaterMark;
}

- (NSString)readingPositionCFIString
{
  return self->_readingPositionCFIString;
}

- (void)setReadingPositionCFIString:(id)a3
{
}

- (NSString)readingPositionAnnotationVersion
{
  return self->_readingPositionAnnotationVersion;
}

- (void)setReadingPositionAnnotationVersion:(id)a3
{
}

- (NSString)readingPositionAssetVersion
{
  return self->_readingPositionAssetVersion;
}

- (void)setReadingPositionAssetVersion:(id)a3
{
}

- (NSData)readingPositionUserData
{
  return self->_readingPositionUserData;
}

- (void)setReadingPositionUserData:(id)a3
{
}

- (int)readingPositionLocationRangeStart
{
  return self->_readingPositionLocationRangeStart;
}

- (void)setReadingPositionLocationRangeStart:(int)a3
{
  self->_readingPositionLocationRangeStart = a3;
}

- (int)readingPositionLocationRangeEnd
{
  return self->_readingPositionLocationRangeEnd;
}

- (void)setReadingPositionLocationRangeEnd:(int)a3
{
  self->_readingPositionLocationRangeEnd = a3;
}

- (int)readingPositionAbsolutePhysicalLocation
{
  return self->_readingPositionAbsolutePhysicalLocation;
}

- (void)setReadingPositionAbsolutePhysicalLocation:(int)a3
{
  self->_readingPositionAbsolutePhysicalLocation = a3;
}

- (NSString)readingPositionStorageUUID
{
  return self->_readingPositionStorageUUID;
}

- (void)setReadingPositionStorageUUID:(id)a3
{
}

- (NSDate)datePlaybackTimeUpdated
{
  return self->_datePlaybackTimeUpdated;
}

- (void)setDatePlaybackTimeUpdated:(id)a3
{
}

- (double)bookmarkTime
{
  return self->_bookmarkTime;
}

- (void)setBookmarkTime:(double)a3
{
  self->_bookmarkTime = a3;
}

- (NSDate)readingPositionLocationUpdateDate
{
  return self->_readingPositionLocationUpdateDate;
}

- (void)setReadingPositionLocationUpdateDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingPositionLocationUpdateDate, 0);
  objc_storeStrong((id *)&self->_datePlaybackTimeUpdated, 0);
  objc_storeStrong((id *)&self->_readingPositionStorageUUID, 0);
  objc_storeStrong((id *)&self->_readingPositionUserData, 0);
  objc_storeStrong((id *)&self->_readingPositionAssetVersion, 0);
  objc_storeStrong((id *)&self->_readingPositionAnnotationVersion, 0);
  objc_storeStrong((id *)&self->_readingPositionCFIString, 0);
  objc_storeStrong((id *)&self->_lastOpenDate, 0);
  objc_storeStrong((id *)&self->_dateFinished, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end