@interface HMDCoreDataWorkingStoreTransactionLogEvent
- (HMDCoreDataWorkingStoreTransactionLogEvent)initWithTransactionAuthor:(id)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)transactionAuthor;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDCoreDataWorkingStoreTransactionLogEvent

- (void).cxx_destruct
{
}

- (NSString)transactionAuthor
{
  return self->_transactionAuthor;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v6[2] = *MEMORY[0x263EF8340];
  v5[0] = @"transactionAuthor";
  v2 = [(HMDCoreDataWorkingStoreTransactionLogEvent *)self transactionAuthor];
  v5[1] = @"transactionCount";
  v6[0] = v2;
  v6[1] = &unk_26E4736F0;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homed.daemon.workingStoreTransactionsDailyTotal";
}

- (HMDCoreDataWorkingStoreTransactionLogEvent)initWithTransactionAuthor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCoreDataWorkingStoreTransactionLogEvent;
  v6 = [(HMMLogEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transactionAuthor, a3);
  }

  return v7;
}

@end