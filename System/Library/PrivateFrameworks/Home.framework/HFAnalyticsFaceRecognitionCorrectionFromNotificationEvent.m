@interface HFAnalyticsFaceRecognitionCorrectionFromNotificationEvent
- (HFAnalyticsFaceRecognitionCorrectionFromNotificationEvent)initWithData:(id)a3;
- (NSNumber)errorCode;
- (NSString)errorDomain;
- (id)payload;
- (void)setErrorCode:(id)a3;
- (void)setErrorDomain:(id)a3;
@end

@implementation HFAnalyticsFaceRecognitionCorrectionFromNotificationEvent

- (HFAnalyticsFaceRecognitionCorrectionFromNotificationEvent)initWithData:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HFAnalyticsFaceRecognitionCorrectionFromNotificationEvent;
  v5 = [(HFAnalyticsEvent *)&v17 initWithEventType:3];
  if (v5)
  {
    objc_opt_class();
    v6 = [v4 objectForKeyedSubscript:@"error"];
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    uint64_t v9 = [v8 domain];
    v10 = (void *)v9;
    if (v9) {
      v11 = (__CFString *)v9;
    }
    else {
      v11 = @"nil";
    }
    objc_storeStrong((id *)&v5->_errorDomain, v11);

    v12 = NSNumber;
    uint64_t v13 = [v8 code];

    uint64_t v14 = [v12 numberWithInteger:v13];
    errorCode = v5->_errorCode;
    v5->_errorCode = (NSNumber *)v14;
  }
  return v5;
}

- (id)payload
{
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsFaceRecognitionCorrectionFromNotificationEvent;
  v3 = [(HFAnalyticsEvent *)&v8 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsFaceRecognitionCorrectionFromNotificationEvent *)self errorDomain];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"errorDomain");

  v6 = [(HFAnalyticsFaceRecognitionCorrectionFromNotificationEvent *)self errorCode];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"errorCode");

  return v4;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

@end