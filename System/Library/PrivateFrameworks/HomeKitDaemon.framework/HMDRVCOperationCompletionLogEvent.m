@interface HMDRVCOperationCompletionLogEvent
+ (id)eventWithErrorCode:(id)a3 totalOperationalTime:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)errorCode;
- (NSNumber)totalOperationalTime;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setErrorCode:(id)a3;
- (void)setTotalOperationalTime:(id)a3;
@end

@implementation HMDRVCOperationCompletionLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalOperationalTime, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
}

- (void)setTotalOperationalTime:(id)a3
{
}

- (NSNumber)totalOperationalTime
{
  return self->_totalOperationalTime;
}

- (void)setErrorCode:(id)a3
{
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(HMDRVCOperationCompletionLogEvent *)self totalOperationalTime];
  [v3 setObject:v4 forKeyedSubscript:@"totalOperationalTime"];

  v5 = [(HMDRVCOperationCompletionLogEvent *)self errorCode];
  [v3 setObject:v5 forKeyedSubscript:@"errorCode"];

  v6 = (void *)[v3 copy];
  return (NSDictionary *)v6;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homekit.rvc.operationcompletion";
}

+ (id)eventWithErrorCode:(id)a3 totalOperationalTime:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(HMDRVCOperationCompletionLogEvent);
  [(HMDRVCOperationCompletionLogEvent *)v7 setErrorCode:v6];

  [(HMDRVCOperationCompletionLogEvent *)v7 setTotalOperationalTime:v5];
  return v7;
}

@end