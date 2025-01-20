@interface DNDApplicationConfiguration(Record)
+ (id)configurationForRecord:()Record;
- (DNDSMutableApplicationConfigurationRecord)makeRecord;
@end

@implementation DNDApplicationConfiguration(Record)

+ (id)configurationForRecord:()Record
{
  v3 = (objc_class *)MEMORY[0x1E4F5F6C8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 minimumBreakthroughUrgency];
  objc_msgSend(v5, "setMinimumBreakthroughUrgency:", objc_msgSend(v6, "integerValue"));

  v7 = [v4 allowedThreads];
  v8 = (void *)[v7 mutableCopy];
  [v5 setAllowedThreads:v8];

  v9 = [v4 deniedThreads];

  v10 = (void *)[v9 mutableCopy];
  [v5 setDeniedThreads:v10];

  return v5;
}

- (DNDSMutableApplicationConfigurationRecord)makeRecord
{
  v2 = objc_alloc_init(DNDSMutableApplicationConfigurationRecord);
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "minimumBreakthroughUrgency"));
  [(DNDSMutableApplicationConfigurationRecord *)v2 setMinimumBreakthroughUrgency:v3];

  id v4 = [a1 allowedThreads];
  [(DNDSMutableApplicationConfigurationRecord *)v2 setAllowedThreads:v4];

  id v5 = [a1 deniedThreads];
  [(DNDSMutableApplicationConfigurationRecord *)v2 setDeniedThreads:v5];

  return v2;
}

@end