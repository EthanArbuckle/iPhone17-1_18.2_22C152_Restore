@interface HMDFetchAccessorySettingsLogEvent
- (HMDFetchAccessorySettingsLogEvent)initWithKeyPaths:(id)a3 startTime:(unint64_t)a4 requestingClientName:(id)a5 error:(id)a6;
- (NSArray)failedKeyPaths;
- (NSArray)keyPaths;
- (NSArray)succeededKeyPaths;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)requestingClientName;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)responseTimeStamp;
- (unint64_t)startTimeStamp;
- (void)setFailedKeyPaths:(id)a3;
- (void)setResponseTimeStamp:(unint64_t)a3;
- (void)setSucceededKeyPaths:(id)a3;
@end

@implementation HMDFetchAccessorySettingsLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingClientName, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_storeStrong((id *)&self->_succeededKeyPaths, 0);
  objc_storeStrong((id *)&self->_failedKeyPaths, 0);
}

- (NSString)requestingClientName
{
  return self->_requestingClientName;
}

- (unint64_t)startTimeStamp
{
  return self->_startTimeStamp;
}

- (NSArray)keyPaths
{
  return self->_keyPaths;
}

- (void)setResponseTimeStamp:(unint64_t)a3
{
  self->_responseTimeStamp = a3;
}

- (unint64_t)responseTimeStamp
{
  return self->_responseTimeStamp;
}

- (void)setSucceededKeyPaths:(id)a3
{
}

- (NSArray)succeededKeyPaths
{
  return self->_succeededKeyPaths;
}

- (void)setFailedKeyPaths:(id)a3
{
}

- (NSArray)failedKeyPaths
{
  return self->_failedKeyPaths;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:9];
  v4 = [(HMMLogEvent *)self error];
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "code"));
    [v3 setObject:v6 forKeyedSubscript:@"errorCode"];

    v7 = [v5 domain];
    [v3 setObject:v7 forKeyedSubscript:@"errorDomain"];
  }
  v8 = +[HMDLogEventHistograms lowVolumeHistogram];
  v9 = [(HMDFetchAccessorySettingsLogEvent *)self keyPaths];
  v10 = objc_msgSend(v8, "intervalForValue:", objc_msgSend(v9, "count"));
  v11 = [v10 start];
  [v3 setObject:v11 forKeyedSubscript:@"keyPathCount"];

  v12 = +[HMDLogEventHistograms lowVolumeHistogram];
  v13 = [(HMDFetchAccessorySettingsLogEvent *)self failedKeyPaths];
  v14 = objc_msgSend(v12, "intervalForValue:", objc_msgSend(v13, "count"));
  v15 = [v14 start];
  [v3 setObject:v15 forKeyedSubscript:@"failedKeyPaths"];

  v16 = +[HMDLogEventHistograms lowVolumeHistogram];
  v17 = [(HMDFetchAccessorySettingsLogEvent *)self succeededKeyPaths];
  v18 = objc_msgSend(v16, "intervalForValue:", objc_msgSend(v17, "count"));
  v19 = [v18 start];
  [v3 setObject:v19 forKeyedSubscript:@"succeededKeyPaths"];

  if ([(HMDFetchAccessorySettingsLogEvent *)self responseTimeStamp])
  {
    unint64_t v20 = [(HMDFetchAccessorySettingsLogEvent *)self responseTimeStamp];
    unint64_t v21 = v20 - [(HMDFetchAccessorySettingsLogEvent *)self startTimeStamp];
  }
  else
  {
    unint64_t v21 = 0;
  }
  v22 = +[HMDLogEventHistograms latencyHistogram];
  v23 = [v22 intervalForValue:v21];
  v24 = [v23 start];
  [v3 setObject:v24 forKeyedSubscript:@"responseTime"];

  v25 = [(HMDFetchAccessorySettingsLogEvent *)self requestingClientName];
  [v3 setObject:v25 forKeyedSubscript:@"requestingClientName"];

  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.accessorySettings.fetch";
}

- (HMDFetchAccessorySettingsLogEvent)initWithKeyPaths:(id)a3 startTime:(unint64_t)a4 requestingClientName:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HMDFetchAccessorySettingsLogEvent;
  v13 = [(HMMLogEvent *)&v23 init];
  v14 = v13;
  if (v13)
  {
    [(HMMLogEvent *)v13 setError:v12];
    uint64_t v15 = [v10 copy];
    keyPaths = v14->_keyPaths;
    v14->_keyPaths = (NSArray *)v15;

    v14->_startTimeStamp = a4;
    uint64_t v17 = [v11 copy];
    requestingClientName = v14->_requestingClientName;
    v14->_requestingClientName = (NSString *)v17;

    succeededKeyPaths = v14->_succeededKeyPaths;
    unint64_t v20 = (NSArray *)MEMORY[0x263EFFA68];
    v14->_succeededKeyPaths = (NSArray *)MEMORY[0x263EFFA68];

    failedKeyPaths = v14->_failedKeyPaths;
    v14->_failedKeyPaths = v20;
  }
  return v14;
}

@end