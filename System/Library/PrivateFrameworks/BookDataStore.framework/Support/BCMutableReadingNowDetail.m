@interface BCMutableReadingNowDetail
+ (BOOL)supportsSecureCoding;
- (BCMutableReadingNowDetail)initWithAssetID:(id)a3;
- (BCMutableReadingNowDetail)initWithCloudData:(id)a3;
- (BCMutableReadingNowDetail)initWithCoder:(id)a3;
- (BCMutableReadingNowDetail)initWithRecord:(id)a3;
- (BOOL)isTrackedAsRecent;
- (NSDate)lastEngagedDate;
- (NSString)assetID;
- (NSString)cloudAssetType;
- (NSString)description;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setCloudAssetType:(id)a3;
- (void)setIsTrackedAsRecent:(BOOL)a3;
- (void)setLastEngagedDate:(id)a3;
@end

@implementation BCMutableReadingNowDetail

- (BCMutableReadingNowDetail)initWithAssetID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001E8ADC();
    }

    id v5 = 0;
    goto LABEL_7;
  }
  v9.receiver = self;
  v9.super_class = (Class)BCMutableReadingNowDetail;
  id v5 = [(BCMutableCloudData *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    self = (BCMutableReadingNowDetail *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v6;
LABEL_7:
  }
  return (BCMutableReadingNowDetail *)v5;
}

- (BCMutableReadingNowDetail)initWithCloudData:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BCMutableReadingNowDetail;
  id v5 = [(BCMutableCloudData *)&v18 initWithCloudData:v4];
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

      v5->_isTrackedAsRecent = [v7 isTrackedAsRecent];
      v11 = [v7 lastEngagedDate];
      v12 = (NSDate *)[v11 copy];
      lastEngagedDate = v5->_lastEngagedDate;
      v5->_lastEngagedDate = v12;

      v14 = [v7 cloudAssetType];
      v15 = (NSString *)[v14 copy];
      cloudAssetType = v5->_cloudAssetType;
      v5->_cloudAssetType = v15;
    }
    else
    {
      cloudAssetType = sub_1000083A0();
      if (os_log_type_enabled(cloudAssetType, OS_LOG_TYPE_ERROR)) {
        sub_1001E86D4();
      }
      v14 = v5;
      id v5 = 0;
    }
  }
  return v5;
}

- (BCMutableReadingNowDetail)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v10 = sub_1000083A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E8B10();
    }
    id v5 = 0;
    goto LABEL_7;
  }
  v14.receiver = self;
  v14.super_class = (Class)BCMutableReadingNowDetail;
  id v5 = [(BCMutableCloudData *)&v14 initWithRecord:v4];
  if (v5)
  {
    uint64_t v6 = +[BCCloudData localIdentifierFromRecord:v4];
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v6;

    self = [v4 objectForKey:@"isTrackedAsRecent"];
    v5->_isTrackedAsRecent = [(BCMutableReadingNowDetail *)self BOOLValue];
    uint64_t v8 = [v4 objectForKey:@"lastEngagedDate"];
    lastEngagedDate = v5->_lastEngagedDate;
    v5->_lastEngagedDate = (NSDate *)v8;

    objc_opt_class();
    v10 = [v4 objectForKey:@"cloudAssetType"];
    uint64_t v11 = BUDynamicCast();
    cloudAssetType = v5->_cloudAssetType;
    v5->_cloudAssetType = (NSString *)v11;

LABEL_7:
  }

  return v5;
}

- (NSString)description
{
  v3 = [(BCMutableReadingNowDetail *)self assetID];
  if ([(BCMutableReadingNowDetail *)self isTrackedAsRecent]) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  id v5 = [(BCMutableReadingNowDetail *)self lastEngagedDate];
  uint64_t v6 = [(BCMutableReadingNowDetail *)self cloudAssetType];
  v7 = +[NSString stringWithFormat:@"assetID: %@, isTrackedAsRecent: %@, lastEngagedDate: %@, cloudAssetType: %@", v3, v4, v5, v6];

  return (NSString *)v7;
}

- (id)recordType
{
  return @"readingNowDetail";
}

- (id)zoneName
{
  return @"AssetZone";
}

- (id)configuredRecordFromAttributes
{
  v10.receiver = self;
  v10.super_class = (Class)BCMutableReadingNowDetail;
  v3 = [(BCMutableCloudData *)&v10 configuredRecordFromAttributes];
  CFStringRef v4 = +[NSNumber numberWithBool:[(BCMutableReadingNowDetail *)self isTrackedAsRecent]];
  [v3 setObject:v4 forKey:@"isTrackedAsRecent"];

  id v5 = [(BCMutableReadingNowDetail *)self lastEngagedDate];
  [v3 setObject:v5 forKey:@"lastEngagedDate"];

  uint64_t v6 = sub_1000083A0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(BCMutableReadingNowDetail *)self cloudAssetType];
    *(_DWORD *)buf = 138412546;
    v12 = v7;
    __int16 v13 = 2112;
    CFStringRef v14 = @"cloudAssetType";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BCReadingNowDetail configuredRecordFromAttributes setting cloudAssetType:%@ for %@", buf, 0x16u);
  }
  uint64_t v8 = [(BCMutableReadingNowDetail *)self cloudAssetType];
  [v3 setObject:v8 forKey:@"cloudAssetType"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BCMutableReadingNowDetail;
  id v4 = a3;
  [(BCMutableCloudData *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[BCMutableReadingNowDetail isTrackedAsRecent](self, "isTrackedAsRecent", v7.receiver, v7.super_class), @"isTrackedAsRecent");
  id v5 = [(BCMutableReadingNowDetail *)self lastEngagedDate];
  [v4 encodeObject:v5 forKey:@"lastEngagedDate"];

  uint64_t v6 = [(BCMutableReadingNowDetail *)self cloudAssetType];
  [v4 encodeObject:v6 forKey:@"cloudAssetType"];
}

- (BCMutableReadingNowDetail)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BCMutableReadingNowDetail;
  id v5 = [(BCMutableCloudData *)&v14 initWithCoder:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(BCMutableCloudData *)v5 localRecordID];
    assetID = v6->_assetID;
    v6->_assetID = (NSString *)v7;

    v6->_isTrackedAsRecent = [v4 decodeBoolForKey:@"isTrackedAsRecent"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastEngagedDate"];
    lastEngagedDate = v6->_lastEngagedDate;
    v6->_lastEngagedDate = (NSDate *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudAssetType"];
    cloudAssetType = v6->_cloudAssetType;
    v6->_cloudAssetType = (NSString *)v11;
  }
  return v6;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (BOOL)isTrackedAsRecent
{
  return self->_isTrackedAsRecent;
}

- (void)setIsTrackedAsRecent:(BOOL)a3
{
  self->_isTrackedAsRecent = a3;
}

- (NSDate)lastEngagedDate
{
  return self->_lastEngagedDate;
}

- (void)setLastEngagedDate:(id)a3
{
}

- (NSString)cloudAssetType
{
  return self->_cloudAssetType;
}

- (void)setCloudAssetType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudAssetType, 0);
  objc_storeStrong((id *)&self->_lastEngagedDate, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end