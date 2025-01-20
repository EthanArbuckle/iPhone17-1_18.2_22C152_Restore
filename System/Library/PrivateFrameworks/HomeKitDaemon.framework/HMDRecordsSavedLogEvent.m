@interface HMDRecordsSavedLogEvent
+ (id)legacyRecordsSaved:(id)a3;
+ (id)recordsSaved:(id)a3;
- (HMDRecordsSavedLogEvent)initWithSavedRecords:(id)a3 isLegacy:(BOOL)a4;
@end

@implementation HMDRecordsSavedLogEvent

- (HMDRecordsSavedLogEvent)initWithSavedRecords:(id)a3 isLegacy:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        v9 += [*(id *)(*((void *)&v15 + 1) + 8 * i) size];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)HMDRecordsSavedLogEvent;
  v12 = [(HMDRecordOperationLogEvent *)&v14 initWithSize:v9 isLegacy:v4];

  return v12;
}

+ (id)legacyRecordsSaved:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HMDRecordsSavedLogEvent alloc] initWithSavedRecords:v3 isLegacy:1];

  return v4;
}

+ (id)recordsSaved:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[HMDRecordsSavedLogEvent alloc] initWithSavedRecords:v3 isLegacy:0];

  return v4;
}

@end