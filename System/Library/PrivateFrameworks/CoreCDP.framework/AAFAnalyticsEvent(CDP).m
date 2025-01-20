@interface AAFAnalyticsEvent(CDP)
+ (id)analyticsEventWithContext:()CDP eventName:category:;
+ (id)analyticsEventWithFollowUpContext:()CDP eventName:category:;
@end

@implementation AAFAnalyticsEvent(CDP)

+ (id)analyticsEventWithContext:()CDP eventName:category:
{
  v7 = (objc_class *)MEMORY[0x263F202A8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v7 alloc] initWithEventName:v9 eventCategory:v8 initData:0];

  v12 = [v10 telemetryFlowID];
  [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x263F20348]];

  v13 = [v10 telemetryDeviceSessionID];
  [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x263F20320]];

  v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "type"));
  [v11 setObject:v14 forKeyedSubscript:@"contextType"];

  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "walrusStatus"));
  [v11 setObject:v15 forKeyedSubscript:@"advancedDataProtectionState"];

  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "securityLevel"));
  [v11 setObject:v16 forKeyedSubscript:@"securityLevel"];

  v17 = [v10 followUpType];
  [v11 setObject:v17 forKeyedSubscript:@"cfuType"];

  v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "keychainSyncSystem"));
  [v11 setObject:v18 forKeyedSubscript:@"keychainSyncSystemType"];

  v19 = [v10 accountType];
  [v11 setObject:v19 forKeyedSubscript:@"accountType"];

  v20 = [v10 adpCohort];
  [v11 setObject:v20 forKeyedSubscript:@"telemetryVersion"];

  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "edpState"));
  [v11 setObject:v21 forKeyedSubscript:@"edpEligible"];

  v22 = NSNumber;
  uint64_t v23 = [v10 edpHealth];

  v24 = [v22 numberWithUnsignedInteger:v23];
  [v11 setObject:v24 forKeyedSubscript:@"edpHealth"];

  return v11;
}

+ (id)analyticsEventWithFollowUpContext:()CDP eventName:category:
{
  v7 = (objc_class *)MEMORY[0x263F202A8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v7 alloc] initWithEventName:v9 eventCategory:v8 initData:0];

  v12 = [v10 telemetryFlowID];
  [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x263F20348]];

  v13 = [v10 telemetryDeviceSessionID];

  [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x263F20320]];
  return v11;
}

@end