@interface AMSEngagementMessageEvent
- (AMSEngagementMessageEvent)initWithServiceType:(id)a3 placementInfo:(id)a4;
- (AMSEngagementMessageEvent)initWithServiceType:(id)a3 placements:(id)a4;
- (NSArray)placementInfo;
- (NSDictionary)engagementData;
- (NSString)serviceType;
- (void)setPlacementInfo:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation AMSEngagementMessageEvent

uint64_t __43__AMSEngagementMessageEvent_engagementData__block_invoke(uint64_t a1, void *a2)
{
  return [a2 makeRawDictionary];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_placementInfo, 0);
}

- (NSDictionary)engagementData
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"source";
  v8[1] = @"eventType";
  v9[0] = @"AMS";
  v9[1] = @"MessageRequest";
  v8[2] = @"serviceType";
  v3 = [(AMSEngagementMessageEvent *)self serviceType];
  v9[2] = v3;
  v8[3] = @"placements";
  v4 = [(AMSEngagementMessageEvent *)self placementInfo];
  v5 = objc_msgSend(v4, "ams_mapWithTransform:", &__block_literal_global_48);
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return (NSDictionary *)v6;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSArray)placementInfo
{
  return self->_placementInfo;
}

- (AMSEngagementMessageEvent)initWithServiceType:(id)a3 placements:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
        v15 = [AMSEngagementPlacementInfo alloc];
        v16 = -[AMSEngagementPlacementInfo initWithPlacement:context:](v15, "initWithPlacement:context:", v14, 0, (void)v20);
        [v8 addObject:v16];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  v17 = [MEMORY[0x1E4F1C978] arrayWithArray:v8];
  v18 = [(AMSEngagementMessageEvent *)self initWithServiceType:v6 placementInfo:v17];

  return v18;
}

- (AMSEngagementMessageEvent)initWithServiceType:(id)a3 placementInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSEngagementMessageEvent;
  id v9 = [(AMSEngagementMessageEvent *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceType, a3);
    objc_storeStrong((id *)&v10->_placementInfo, a4);
  }

  return v10;
}

- (void)setPlacementInfo:(id)a3
{
}

- (void)setServiceType:(id)a3
{
}

@end