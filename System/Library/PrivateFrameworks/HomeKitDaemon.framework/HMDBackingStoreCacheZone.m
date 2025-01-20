@interface HMDBackingStoreCacheZone
- (HMDBackingStoreCacheZone)initWithZoneID:(int64_t)a3 name:(id)a4;
- (NSMutableArray)actualGroups;
- (NSString)zoneName;
- (id)dumpDebug;
- (int64_t)zoneID;
- (void)setActualGroups:(id)a3;
@end

@implementation HMDBackingStoreCacheZone

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualGroups, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

- (void)setActualGroups:(id)a3
{
}

- (NSMutableArray)actualGroups
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)zoneName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)zoneID
{
  return self->_zoneID;
}

- (id)dumpDebug
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] string];
  objc_msgSend(v3, "appendFormat:", @"zone: %lu (%p)\n", -[HMDBackingStoreCacheZone zoneID](self, "zoneID"), self);
  v4 = [(HMDBackingStoreCacheZone *)self zoneName];
  [v3 appendFormat:@"  name: %@\n", v4];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = [(HMDBackingStoreCacheZone *)self actualGroups];
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v10 = [v9 dumpDebug];
        v11 = [v10 componentsSeparatedByString:@"\n"];

        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              [v3 appendFormat:@"    %@\n", *(void *)(*((void *)&v18 + 1) + 8 * j)];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v13);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  return v3;
}

- (HMDBackingStoreCacheZone)initWithZoneID:(int64_t)a3 name:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDBackingStoreCacheZone;
  v8 = [(HMDBackingStoreCacheZone *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_zoneID = a3;
    objc_storeStrong((id *)&v8->_zoneName, a4);
    uint64_t v10 = [MEMORY[0x263EFF980] array];
    actualGroups = v9->_actualGroups;
    v9->_actualGroups = (NSMutableArray *)v10;

    uint64_t v12 = v9;
  }

  return v9;
}

@end