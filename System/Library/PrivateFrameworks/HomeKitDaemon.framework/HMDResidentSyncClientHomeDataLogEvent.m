@interface HMDResidentSyncClientHomeDataLogEvent
- (HMDResidentSyncClientHomeDataLogEvent)initWithHomeUUID:(id)a3 encodedDataSize:(unint64_t)a4 homeDataType:(int64_t)a5 transportType:(int)a6;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (int)transportType;
- (int64_t)homeDataType;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)encodedDataSize;
@end

@implementation HMDResidentSyncClientHomeDataLogEvent

- (int)transportType
{
  return self->_transportType;
}

- (int64_t)homeDataType
{
  return self->_homeDataType;
}

- (unint64_t)encodedDataSize
{
  return self->_encodedDataSize;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([(HMDResidentSyncClientHomeDataLogEvent *)self homeDataType] == 2)
  {
    v4 = objc_msgSend(NSNumber, "numberWithDouble:", (double)-[HMDResidentSyncClientHomeDataLogEvent encodedDataSize](self, "encodedDataSize") * 0.0009765625);
    [v3 setObject:v4 forKeyedSubscript:@"sparseEncodedDataSizeKBMaxUsingCA"];
  }
  else
  {
    [v3 setObject:&unk_26E4718A8 forKeyedSubscript:@"sparseEncodedDataSizeKBMaxUsingCA"];
  }
  v5 = &unk_26E4718A8;
  if ([(HMDResidentSyncClientHomeDataLogEvent *)self homeDataType] == 1)
  {
    v6 = objc_msgSend(NSNumber, "numberWithDouble:", (double)-[HMDResidentSyncClientHomeDataLogEvent encodedDataSize](self, "encodedDataSize") * 0.0009765625);
    [v3 setObject:v6 forKeyedSubscript:@"fullEncodedDataSizeKBMaxUsingCA"];
  }
  else
  {
    [v3 setObject:&unk_26E4718A8 forKeyedSubscript:@"fullEncodedDataSizeKBMaxUsingCA"];
  }
  if ([(HMDResidentSyncClientHomeDataLogEvent *)self homeDataType] == 2) {
    v7 = &unk_26E4718C0;
  }
  else {
    v7 = &unk_26E4718A8;
  }
  [v3 setObject:v7 forKeyedSubscript:@"sparseEncodedDataCount"];
  if ([(HMDResidentSyncClientHomeDataLogEvent *)self homeDataType] == 1) {
    v8 = &unk_26E4718C0;
  }
  else {
    v8 = &unk_26E4718A8;
  }
  [v3 setObject:v8 forKeyedSubscript:@"fullEncodedDataCount"];
  if ([(HMDResidentSyncClientHomeDataLogEvent *)self transportType] == 2) {
    v9 = &unk_26E4718C0;
  }
  else {
    v9 = &unk_26E4718A8;
  }
  [v3 setObject:v9 forKeyedSubscript:@"transportIDSCount"];
  if ([(HMDResidentSyncClientHomeDataLogEvent *)self transportType] == 6) {
    v10 = &unk_26E4718C0;
  }
  else {
    v10 = &unk_26E4718A8;
  }
  [v3 setObject:v10 forKeyedSubscript:@"transportRapportCount"];
  if ([(HMDResidentSyncClientHomeDataLogEvent *)self transportType] != 6
    && [(HMDResidentSyncClientHomeDataLogEvent *)self transportType] != 2)
  {
    v5 = &unk_26E4718C0;
  }
  [v3 setObject:v5 forKeyedSubscript:@"transportOtherCount"];
  if ([(HMDResidentSyncClientHomeDataLogEvent *)self transportType] == 2)
  {
    v11 = objc_msgSend(NSNumber, "numberWithDouble:", (double)-[HMDResidentSyncClientHomeDataLogEvent encodedDataSize](self, "encodedDataSize") * 0.0009765625);
    [v3 setObject:v11 forKeyedSubscript:@"transportIDSEncodedDataSizeKB"];
  }
  else
  {
    [v3 setObject:&unk_26E4718A8 forKeyedSubscript:@"transportIDSEncodedDataSizeKB"];
  }
  if ([(HMDResidentSyncClientHomeDataLogEvent *)self transportType] == 6)
  {
    v12 = objc_msgSend(NSNumber, "numberWithDouble:", (double)-[HMDResidentSyncClientHomeDataLogEvent encodedDataSize](self, "encodedDataSize") * 0.0009765625);
    [v3 setObject:v12 forKeyedSubscript:@"transportRapportEncodedDataSizeKB"];
  }
  else
  {
    [v3 setObject:&unk_26E4718A8 forKeyedSubscript:@"transportRapportEncodedDataSizeKB"];
  }
  v13 = (void *)[v3 copy];

  return (NSDictionary *)v13;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homed.daemon.residentSyncClient.encodedHomeDataSize";
}

- (HMDResidentSyncClientHomeDataLogEvent)initWithHomeUUID:(id)a3 encodedDataSize:(unint64_t)a4 homeDataType:(int64_t)a5 transportType:(int)a6
{
  v10.receiver = self;
  v10.super_class = (Class)HMDResidentSyncClientHomeDataLogEvent;
  result = [(HMMHomeLogEvent *)&v10 initWithHomeUUID:a3];
  if (result)
  {
    result->_encodedDataSize = a4;
    result->_homeDataType = a5;
    result->_transportType = a6;
  }
  return result;
}

@end