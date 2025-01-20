@interface HMDRVCUsageLogEvent
+ (id)eventWithSource:(unint64_t)a3 wholeHouse:(BOOL)a4 roomCount:(id)a5 roomsInHome:(id)a6 cleanModes:(id)a7;
- (BOOL)wholeHouse;
- (NSArray)cleanModes;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)roomCount;
- (NSNumber)roomsInHome;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)source;
- (void)setCleanModes:(id)a3;
- (void)setRoomCount:(id)a3;
- (void)setRoomsInHome:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setWholeHouse:(BOOL)a3;
@end

@implementation HMDRVCUsageLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanModes, 0);
  objc_storeStrong((id *)&self->_roomsInHome, 0);
  objc_storeStrong((id *)&self->_roomCount, 0);
}

- (void)setCleanModes:(id)a3
{
}

- (NSArray)cleanModes
{
  return self->_cleanModes;
}

- (void)setRoomsInHome:(id)a3
{
}

- (NSNumber)roomsInHome
{
  return self->_roomsInHome;
}

- (void)setRoomCount:(id)a3
{
}

- (NSNumber)roomCount
{
  return self->_roomCount;
}

- (void)setWholeHouse:(BOOL)a3
{
  self->_wholeHouse = a3;
}

- (BOOL)wholeHouse
{
  return self->_wholeHouse;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = NSNumber;
  v5 = [(HMMLogEvent *)self error];
  v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "code"));
  [v3 setObject:v6 forKeyedSubscript:@"errorCode"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDRVCUsageLogEvent source](self, "source"));
  [v3 setObject:v7 forKeyedSubscript:@"source"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDRVCUsageLogEvent wholeHouse](self, "wholeHouse"));
  [v3 setObject:v8 forKeyedSubscript:@"wholeHouse"];

  v9 = [(HMDRVCUsageLogEvent *)self roomCount];
  [v3 setObject:v9 forKeyedSubscript:@"roomCount"];

  v10 = [(HMDRVCUsageLogEvent *)self roomsInHome];
  [v3 setObject:v10 forKeyedSubscript:@"roomsInHome"];

  v11 = [(HMDRVCUsageLogEvent *)self cleanModes];
  [v3 setObject:v11 forKeyedSubscript:@"cleanModes"];

  v12 = (void *)[v3 copy];
  return (NSDictionary *)v12;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homekit.rvc.usage";
}

+ (id)eventWithSource:(unint64_t)a3 wholeHouse:(BOOL)a4 roomCount:(id)a5 roomsInHome:(id)a6 cleanModes:(id)a7
{
  BOOL v9 = a4;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  v14 = objc_alloc_init(HMDRVCUsageLogEvent);
  [(HMDRVCUsageLogEvent *)v14 setSource:a3];
  [(HMDRVCUsageLogEvent *)v14 setWholeHouse:v9];
  [(HMDRVCUsageLogEvent *)v14 setRoomCount:v13];

  [(HMDRVCUsageLogEvent *)v14 setRoomsInHome:v12];
  [(HMDRVCUsageLogEvent *)v14 setCleanModes:v11];

  return v14;
}

@end