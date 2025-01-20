@interface HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent
- (HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent)initWithData:(id)a3;
- (NSNumber)nonConfiguredAccessoryCount;
- (NSNumber)nonConfiguredBridgeCount;
- (NSNumber)nonConfiguredBridgedCount;
- (NSString)homeID;
- (id)payload;
- (void)setHomeID:(id)a3;
- (void)setNonConfiguredAccessoryCount:(id)a3;
- (void)setNonConfiguredBridgeCount:(id)a3;
- (void)setNonConfiguredBridgedCount:(id)a3;
@end

@implementation HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent

- (HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"resumeSetupNonConfiguredAccessoryCount"];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  v8 = [v4 objectForKeyedSubscript:@"resumeSetupNonConfiguredBridgeCount"];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  objc_opt_class();
  v11 = [v4 objectForKeyedSubscript:@"resumeSetupNonConfiguredBridgedCount"];
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  objc_opt_class();
  v14 = [v4 objectForKeyedSubscript:@"homeUUID"];

  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  v20.receiver = self;
  v20.super_class = (Class)HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent;
  v17 = [(HFAnalyticsEvent *)&v20 initWithEventType:30];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_nonConfiguredAccessoryCount, v6);
    objc_storeStrong((id *)&v18->_nonConfiguredBridgeCount, v9);
    objc_storeStrong((id *)&v18->_nonConfiguredBridgedCount, v12);
    objc_storeStrong((id *)&v18->_homeID, v15);
  }

  return v18;
}

- (id)payload
{
  v10.receiver = self;
  v10.super_class = (Class)HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent;
  v3 = [(HFAnalyticsEvent *)&v10 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent *)self nonConfiguredAccessoryCount];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"nonConfiguredAccessoryCount");

  v6 = [(HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent *)self nonConfiguredBridgeCount];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"nonConfiguredBridgesCount");

  id v7 = [(HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent *)self nonConfiguredBridgedCount];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"nonConfiguredBridgedCount");

  v8 = [(HFAnalyticsResumeSetupNonConfiguredAccessoryCountEvent *)self homeID];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, @"home");

  return v4;
}

- (NSNumber)nonConfiguredBridgedCount
{
  return self->_nonConfiguredBridgedCount;
}

- (NSNumber)nonConfiguredBridgeCount
{
  return self->_nonConfiguredBridgeCount;
}

- (NSNumber)nonConfiguredAccessoryCount
{
  return self->_nonConfiguredAccessoryCount;
}

- (NSString)homeID
{
  return self->_homeID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeID, 0);
  objc_storeStrong((id *)&self->_nonConfiguredBridgedCount, 0);
  objc_storeStrong((id *)&self->_nonConfiguredBridgeCount, 0);
  objc_storeStrong((id *)&self->_nonConfiguredAccessoryCount, 0);
}

- (void)setNonConfiguredAccessoryCount:(id)a3
{
}

- (void)setNonConfiguredBridgeCount:(id)a3
{
}

- (void)setNonConfiguredBridgedCount:(id)a3
{
}

- (void)setHomeID:(id)a3
{
}

@end