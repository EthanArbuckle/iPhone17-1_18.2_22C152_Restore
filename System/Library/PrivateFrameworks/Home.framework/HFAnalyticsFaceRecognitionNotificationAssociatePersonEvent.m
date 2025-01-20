@interface HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent
- (HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent)initWithData:(id)a3;
- (NSNumber)openURLSuccess;
- (NSNumber)unknownPersonsTagCount;
- (id)payload;
- (void)setOpenURLSuccess:(id)a3;
- (void)setUnknownPersonsTagCount:(id)a3;
@end

@implementation HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent

- (HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"faceRecognitionNotificationAssociatePersonCount"];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    NSLog(&cfstr_Hfanalyticsfac.isa);
  }
  objc_opt_class();
  v8 = [v4 objectForKeyedSubscript:@"faceRecognitionNotificationAssociatePersonSuccess"];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (!v10) {
    NSLog(&cfstr_Hfanalyticsfac_0.isa);
  }
  v14.receiver = self;
  v14.super_class = (Class)HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent;
  v11 = [(HFAnalyticsEvent *)&v14 initWithEventType:5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_unknownPersonsTagCount, v6);
    objc_storeStrong((id *)&v12->_openURLSuccess, v9);
  }

  return v12;
}

- (id)payload
{
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent;
  v3 = [(HFAnalyticsEvent *)&v8 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent *)self unknownPersonsTagCount];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"faceRecognitionNotificationAssociatePersonCount");

  v6 = [(HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent *)self openURLSuccess];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"faceRecognitionNotificationAssociatePersonSuccess");

  return v4;
}

- (NSNumber)unknownPersonsTagCount
{
  return self->_unknownPersonsTagCount;
}

- (void)setUnknownPersonsTagCount:(id)a3
{
}

- (NSNumber)openURLSuccess
{
  return self->_openURLSuccess;
}

- (void)setOpenURLSuccess:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openURLSuccess, 0);
  objc_storeStrong((id *)&self->_unknownPersonsTagCount, 0);
}

@end