@interface HMDCameraSignificantEventNotificationFilter
+ (BOOL)isRelevantSignificantEventDate:(id)a3;
- (BOOL)_isSignificantEventRelevantWithUUID:(id)a3 isFromPrimary:(BOOL)a4;
- (HMDCameraSignificantEventNotificationFilter)init;
- (NSMutableDictionary)cloudSignificantEventsByUUID;
- (NSMutableDictionary)primaryResidentSignificantEventNotificationsByUUID;
- (id)consumeCloudSignificantEventWithUUID:(id)a3;
- (id)consumePrimaryResidentSignificantEventWithUUID:(id)a3;
- (void)_pruneCloudSignificantEvents;
- (void)_prunePrimaryResidentSignificantEvents;
- (void)addIncomingCloudSignificantEvent:(id)a3;
- (void)addIncomingPrimaryResidentSignificantEventNotificationWithUUID:(id)a3 notificationReasons:(unint64_t)a4 date:(id)a5;
@end

@implementation HMDCameraSignificantEventNotificationFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSignificantEventsByUUID, 0);
  objc_storeStrong((id *)&self->_primaryResidentSignificantEventNotificationsByUUID, 0);
}

- (NSMutableDictionary)cloudSignificantEventsByUUID
{
  return self->_cloudSignificantEventsByUUID;
}

- (NSMutableDictionary)primaryResidentSignificantEventNotificationsByUUID
{
  return self->_primaryResidentSignificantEventNotificationsByUUID;
}

- (void)_pruneCloudSignificantEvents
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(HMDCameraSignificantEventNotificationFilter *)self cloudSignificantEventsByUUID];
  v4 = [v3 allKeys];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        uint64_t v10 = [(HMDCameraSignificantEventNotificationFilter *)self cloudSignificantEventsByUUID];
        v11 = [(id)v10 objectForKeyedSubscript:v9];

        v12 = [v11 dateOfOccurrence];
        LOBYTE(v10) = +[HMDCameraSignificantEventNotificationFilter isRelevantSignificantEventDate:v12];

        if ((v10 & 1) == 0)
        {
          v13 = [(HMDCameraSignificantEventNotificationFilter *)self cloudSignificantEventsByUUID];
          [v13 setObject:0 forKeyedSubscript:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)_prunePrimaryResidentSignificantEvents
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(HMDCameraSignificantEventNotificationFilter *)self primaryResidentSignificantEventNotificationsByUUID];
  v4 = [v3 allKeys];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        uint64_t v10 = [(HMDCameraSignificantEventNotificationFilter *)self primaryResidentSignificantEventNotificationsByUUID];
        v11 = [(id)v10 objectForKeyedSubscript:v9];

        v12 = [v11 date];
        LOBYTE(v10) = +[HMDCameraSignificantEventNotificationFilter isRelevantSignificantEventDate:v12];

        if ((v10 & 1) == 0)
        {
          v13 = [(HMDCameraSignificantEventNotificationFilter *)self primaryResidentSignificantEventNotificationsByUUID];
          [v13 setObject:0 forKeyedSubscript:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (BOOL)_isSignificantEventRelevantWithUUID:(id)a3 isFromPrimary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    uint64_t v7 = [(HMDCameraSignificantEventNotificationFilter *)self primaryResidentSignificantEventNotificationsByUUID];
    uint64_t v8 = [v7 objectForKeyedSubscript:v6];
    [v8 date];
  }
  else
  {
    uint64_t v7 = [(HMDCameraSignificantEventNotificationFilter *)self cloudSignificantEventsByUUID];
    uint64_t v8 = [v7 objectForKeyedSubscript:v6];
    [v8 dateOfOccurrence];
  uint64_t v9 = };

  if (v9) {
    BOOL v10 = +[HMDCameraSignificantEventNotificationFilter isRelevantSignificantEventDate:v9];
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)consumeCloudSignificantEventWithUUID:(id)a3
{
  id v4 = a3;
  if ([(HMDCameraSignificantEventNotificationFilter *)self _isSignificantEventRelevantWithUUID:v4 isFromPrimary:0])
  {
    uint64_t v5 = [(HMDCameraSignificantEventNotificationFilter *)self cloudSignificantEventsByUUID];
    id v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = [(HMDCameraSignificantEventNotificationFilter *)self cloudSignificantEventsByUUID];
  [v7 setObject:0 forKeyedSubscript:v4];

  [(HMDCameraSignificantEventNotificationFilter *)self _pruneCloudSignificantEvents];
  return v6;
}

- (id)consumePrimaryResidentSignificantEventWithUUID:(id)a3
{
  id v4 = a3;
  if ([(HMDCameraSignificantEventNotificationFilter *)self _isSignificantEventRelevantWithUUID:v4 isFromPrimary:1])
  {
    uint64_t v5 = [(HMDCameraSignificantEventNotificationFilter *)self primaryResidentSignificantEventNotificationsByUUID];
    id v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = [(HMDCameraSignificantEventNotificationFilter *)self primaryResidentSignificantEventNotificationsByUUID];
  [v7 setObject:0 forKeyedSubscript:v4];

  [(HMDCameraSignificantEventNotificationFilter *)self _prunePrimaryResidentSignificantEvents];
  return v6;
}

- (void)addIncomingCloudSignificantEvent:(id)a3
{
  id v4 = a3;
  id v6 = [(HMDCameraSignificantEventNotificationFilter *)self cloudSignificantEventsByUUID];
  uint64_t v5 = [v4 uniqueIdentifier];
  [v6 setObject:v4 forKeyedSubscript:v5];
}

- (void)addIncomingPrimaryResidentSignificantEventNotificationWithUUID:(id)a3 notificationReasons:(unint64_t)a4 date:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v11 = [[HMDCameraSignificantEventNotificationRecord alloc] initWithUUID:v9 notificationReasons:a4 date:v8];

  BOOL v10 = [(HMDCameraSignificantEventNotificationFilter *)self primaryResidentSignificantEventNotificationsByUUID];
  [v10 setObject:v11 forKeyedSubscript:v9];
}

- (HMDCameraSignificantEventNotificationFilter)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMDCameraSignificantEventNotificationFilter;
  v2 = [(HMDCameraSignificantEventNotificationFilter *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    primaryResidentSignificantEventNotificationsByUUID = v2->_primaryResidentSignificantEventNotificationsByUUID;
    v2->_primaryResidentSignificantEventNotificationsByUUID = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    cloudSignificantEventsByUUID = v2->_cloudSignificantEventsByUUID;
    v2->_cloudSignificantEventsByUUID = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (BOOL)isRelevantSignificantEventDate:(id)a3
{
  [a3 timeIntervalSinceNow];
  return v3 >= -900.0;
}

@end