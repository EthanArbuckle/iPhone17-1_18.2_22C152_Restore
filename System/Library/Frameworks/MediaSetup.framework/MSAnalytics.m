@interface MSAnalytics
+ (void)sendConfigEvent:(id)a3;
+ (void)sendPlayIntent:(BOOL)a3;
+ (void)sendPrimaryUserUpdatedOn:(id)a3;
+ (void)sendRemovalEvent:(id)a3;
+ (void)sendServiceEvent:(id)a3;
+ (void)sendServiceRequestLapseEvent:(id)a3;
+ (void)sendSetupEvent:(id)a3;
+ (void)sendUserRegisteredNumberOfServices:(int)a3;
@end

@implementation MSAnalytics

+ (void)sendSetupEvent:(id)a3
{
  id v3 = a3;
  v4 = [v3 eventName];
  v6 = v3;
  id v5 = v3;
  AnalyticsSendEventLazy();
}

uint64_t __30__MSAnalytics_sendSetupEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) encoded];
}

+ (void)sendServiceEvent:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 eventType] == 2)
  {
    v16[0] = @"duration";
    v4 = NSNumber;
    id v5 = [v3 stopwatch];
    v6 = objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v5, "elapsedTimeMS"));
    v17[0] = v6;
    v16[1] = @"didSucceed";
    v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "didSucceed"));
    v17[1] = v7;
    v8 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  else
  {
    v14[0] = @"service";
    id v5 = [v3 serviceID];
    v6 = [v5 UUIDString];
    v15[0] = v6;
    v14[1] = @"duration";
    v9 = NSNumber;
    v7 = [v3 stopwatch];
    v10 = objc_msgSend(v9, "numberWithUnsignedLongLong:", objc_msgSend(v7, "elapsedTimeMS"));
    v15[1] = v10;
    v14[2] = @"didSucceed";
    v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "didSucceed"));
    v15[2] = v11;
    v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  }
  v12 = [v3 eventName];

  id v13 = v8;
  AnalyticsSendEventLazy();
}

id __32__MSAnalytics_sendServiceEvent___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)sendServiceRequestLapseEvent:(id)a3
{
  void v14[3] = *MEMORY[0x263EF8340];
  v13[0] = @"service";
  id v3 = a3;
  v4 = [v3 serviceID];
  v14[0] = v4;
  v13[1] = @"durationBetweenRequestAndRecordCreation";
  id v5 = NSNumber;
  [v3 durationBetweenRequestAndRecordCreation];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v14[1] = v6;
  v13[2] = @"durationBetweenRequestAndReadyToUse";
  v7 = NSNumber;
  [v3 durationBetweenRequestAndReadyToUse];
  double v9 = v8;

  v10 = [v7 numberWithDouble:v9];
  v14[2] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  id v12 = v11;
  AnalyticsSendEventLazy();
}

id __44__MSAnalytics_sendServiceRequestLapseEvent___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)sendRemovalEvent:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = @"service";
  id v3 = [a3 serviceId];
  v7[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  id v5 = v4;
  AnalyticsSendEventLazy();
}

id __32__MSAnalytics_sendRemovalEvent___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)sendConfigEvent:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = @"service";
  id v3 = [a3 serviceId];
  v7[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  id v5 = v4;
  AnalyticsSendEventLazy();
}

id __31__MSAnalytics_sendConfigEvent___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)sendUserRegisteredNumberOfServices:(int)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = @"numServices";
  id v3 = [NSNumber numberWithInt:*(void *)&a3];
  v7[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  id v5 = v4;
  AnalyticsSendEventLazy();
}

id __50__MSAnalytics_sendUserRegisteredNumberOfServices___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)sendPlayIntent:(BOOL)a3
{
  BOOL v3 = a3;
  void v16[2] = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v4 doubleForKey:@"cloudMediaServicesPlayBackIntentDate"];
  double v6 = v5;

  v7 = [MEMORY[0x263EFF910] now];
  [v7 timeIntervalSince1970];
  double v9 = v8;

  if (v6 == 0.0) {
    double v10 = v9;
  }
  else {
    double v10 = v6;
  }
  v15[0] = @"secondsSinceLastPlayIntent";
  v11 = [NSNumber numberWithDouble:v9 - v10];
  v15[1] = @"isFromEndpoint";
  v16[0] = v11;
  id v12 = [NSNumber numberWithBool:v3];
  v16[1] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  AnalyticsSendEvent();
  v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v14 setDouble:@"cloudMediaServicesPlayBackIntentDate" forKey:v9];
}

+ (void)sendPrimaryUserUpdatedOn:(id)a3
{
  v12[3] = *MEMORY[0x263EF8340];
  v11[0] = @"automatic";
  BOOL v3 = NSNumber;
  id v4 = a3;
  double v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isAutomatic"));
  v12[0] = v5;
  v11[1] = @"isOwner";
  double v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "changedToHomeOwner"));
  v12[1] = v6;
  v11[2] = @"otherAccount";
  v7 = NSNumber;
  uint64_t v8 = [v4 changedToUserNotInHome];

  double v9 = [v7 numberWithBool:v8];
  v12[2] = v9;
  double v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  AnalyticsSendEvent();
}

@end