@interface HMDCloudShareTrustManagerFailureLogEvent
- (HMDCloudShareTrustManagerFailureLogEvent)initWithTrustManagerErrorCode:(int64_t)a3 error:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)trustManagerErrorCode;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDCloudShareTrustManagerFailureLogEvent

- (void).cxx_destruct
{
}

- (NSNumber)trustManagerErrorCode
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"trustManagerErrorCode";
  v3 = [(HMDCloudShareTrustManagerFailureLogEvent *)self trustManagerErrorCode];
  v12[0] = v3;
  v11[1] = @"errorCode";
  v4 = NSNumber;
  v5 = [(HMMLogEvent *)self error];
  v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "code"));
  v12[1] = v6;
  v11[2] = @"errorDomain";
  v7 = [(HMMLogEvent *)self error];
  v8 = [v7 domain];
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return (NSDictionary *)v9;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.trustManager.failure";
}

- (HMDCloudShareTrustManagerFailureLogEvent)initWithTrustManagerErrorCode:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v7 = v6;
    v19.receiver = self;
    v19.super_class = (Class)HMDCloudShareTrustManagerFailureLogEvent;
    v8 = [(HMMLogEvent *)&v19 init];
    if (v8)
    {
      uint64_t v9 = [NSNumber numberWithInteger:a3];
      trustManagerErrorCode = v8->_trustManagerErrorCode;
      v8->_trustManagerErrorCode = (NSNumber *)v9;

      v11 = [v7 domain];

      if (v11)
      {
        [(HMMLogEvent *)v8 setError:v7];
      }
      else
      {
        v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = [v7 code];
        v14 = [v7 userInfo];
        v15 = [v12 errorWithDomain:@"<No Domain>" code:v13 userInfo:v14];
        [(HMMLogEvent *)v8 setError:v15];
      }
    }

    return v8;
  }
  else
  {
    v17 = (HMDUserCloudShareOwnerAdoptionDailyEvent *)_HMFPreconditionFailure();
    [(HMDUserCloudShareOwnerAdoptionDailyEvent *)v17 .cxx_destruct];
  }
  return result;
}

@end