@interface HMDAppleMediaAccessoryDailySetRoomEvent
+ (id)filterToAllowedRoomName:(id)a3;
- (HMDAppleMediaAccessoryDailySetRoomEvent)initWithCurrentRoom:(id)a3 previousRoom:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)currentRoom;
- (NSString)previousRoom;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDAppleMediaAccessoryDailySetRoomEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousRoom, 0);
  objc_storeStrong((id *)&self->_currentRoom, 0);
}

- (NSString)previousRoom
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)currentRoom
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(HMDAppleMediaAccessoryDailySetRoomEvent *)self currentRoom];
  v5 = +[HMDAppleMediaAccessoryDailySetRoomEvent filterToAllowedRoomName:v4];
  [v3 setObject:v5 forKeyedSubscript:@"CurrentRoom"];

  v6 = [(HMDAppleMediaAccessoryDailySetRoomEvent *)self previousRoom];
  v7 = +[HMDAppleMediaAccessoryDailySetRoomEvent filterToAllowedRoomName:v6];
  [v3 setObject:v7 forKeyedSubscript:@"PreviousRoom"];

  v8 = (void *)[v3 copy];
  return (NSDictionary *)v8;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.MediaAccessory.DailyRoomLog";
}

- (HMDAppleMediaAccessoryDailySetRoomEvent)initWithCurrentRoom:(id)a3 previousRoom:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAppleMediaAccessoryDailySetRoomEvent;
  v9 = [(HMMLogEvent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_currentRoom, a3);
    objc_storeStrong((id *)&v10->_previousRoom, a4);
  }

  return v10;
}

+ (id)filterToAllowedRoomName:(id)a3
{
  id v3 = (__CFString *)a3;
  if (filterToAllowedRoomName__onceToken != -1) {
    dispatch_once(&filterToAllowedRoomName__onceToken, &__block_literal_global_60442);
  }
  v4 = @"User Defined";
  if (v3 && [(id)filterToAllowedRoomName__allowedRoomNames containsObject:v3]) {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

void __67__HMDAppleMediaAccessoryDailySetRoomEvent_filterToAllowedRoomName___block_invoke()
{
  v0 = (void *)filterToAllowedRoomName__allowedRoomNames;
  filterToAllowedRoomName__allowedRoomNames = (uint64_t)&unk_26E473F90;
}

@end