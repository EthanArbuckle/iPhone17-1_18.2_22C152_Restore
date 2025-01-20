@interface HealthAppScribeAnalyticEventManager
- (BOOL)isImproveHealthAndActivityEnabled;
- (id)createEventPayloadWithDataType:(id)a3 requestCategory:(id)a4 requestType:(int64_t)a5 requestInterval:(id)a6 hourOfDay:(id)a7 userAction:(id)a8 hasHealthDataAuthorization:(BOOL)a9 isFirstInvocation:(BOOL)a10;
- (id)createHealthEventPayloadWithDescription:(id)a3 requestInterval:(id)a4;
- (void)submitEventWithDataType:(id)a3 requestCategory:(id)a4 requestType:(int64_t)a5 requestInterval:(id)a6 hourOfDay:(id)a7 userAction:(id)a8 hasHealthDataAuthorization:(BOOL)a9 isFirstInvocation:(BOOL)a10;
- (void)submitHealthEventWithDescription:(id)a3 requestInterval:(id)a4;
@end

@implementation HealthAppScribeAnalyticEventManager

- (BOOL)isImproveHealthAndActivityEnabled
{
  return MEMORY[0x1F40E7D50](self, a2);
}

- (void)submitEventWithDataType:(id)a3 requestCategory:(id)a4 requestType:(int64_t)a5 requestInterval:(id)a6 hourOfDay:(id)a7 userAction:(id)a8 hasHealthDataAuthorization:(BOOL)a9 isFirstInvocation:(BOOL)a10
{
  LOWORD(v10) = __PAIR16__(a10, a9);
  -[HealthAppScribeAnalyticEventManager createEventPayloadWithDataType:requestCategory:requestType:requestInterval:hourOfDay:userAction:hasHealthDataAuthorization:isFirstInvocation:](self, "createEventPayloadWithDataType:requestCategory:requestType:requestInterval:hourOfDay:userAction:hasHealthDataAuthorization:isFirstInvocation:", a3, a4, a5, a6, a7, a8, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();
}

- (id)createEventPayloadWithDataType:(id)a3 requestCategory:(id)a4 requestType:(int64_t)a5 requestInterval:(id)a6 hourOfDay:(id)a7 userAction:(id)a8 hasHealthDataAuthorization:(BOOL)a9 isFirstInvocation:(BOOL)a10
{
  id v30 = a3;
  id v16 = a4;
  id v17 = a7;
  v18 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v19 = a8;
  id v20 = a6;
  id v21 = objc_alloc_init(v18);
  BOOL v22 = [(HealthAppScribeAnalyticEventManager *)self isImproveHealthAndActivityEnabled];
  v23 = [NSNumber numberWithBool:v22];
  [v21 setObject:v23 forKeyedSubscript:@"isIHA"];

  v24 = @"unknown";
  if (a5 == 1) {
    v24 = @"write";
  }
  if (a5) {
    v25 = v24;
  }
  else {
    v25 = @"read";
  }
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, @"requestType", v30);
  [v21 setObject:v20 forKeyedSubscript:@"requestInterval"];

  [v21 setObject:v19 forKeyedSubscript:@"userAction"];
  v26 = [NSNumber numberWithBool:a10];
  [v21 setObject:v26 forKeyedSubscript:@"isFirstInvocation"];

  v27 = [NSNumber numberWithBool:a9];
  [v21 setObject:v27 forKeyedSubscript:@"isSiriAuthenticated"];

  if (v22)
  {
    v28 = [v31 identifier];
    [v21 setObject:v28 forKeyedSubscript:@"HKDataType"];

    [v21 setObject:v16 forKeyedSubscript:@"requestCategory"];
    [v21 setObject:v17 forKeyedSubscript:@"hourOfDay"];
  }

  return v21;
}

- (void)submitHealthEventWithDescription:(id)a3 requestInterval:(id)a4
{
  id v4 = [(HealthAppScribeAnalyticEventManager *)self createHealthEventPayloadWithDescription:a3 requestInterval:a4];
  AnalyticsSendEvent();
}

- (id)createHealthEventPayloadWithDescription:(id)a3 requestInterval:(id)a4
{
  id v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  BOOL v10 = [(HealthAppScribeAnalyticEventManager *)self isImproveHealthAndActivityEnabled];
  id v11 = [NSNumber numberWithBool:v10];
  [v9 setObject:v11 forKeyedSubscript:@"isIHA"];

  [v9 setObject:v8 forKeyedSubscript:@"requestInterval"];
  [v9 setObject:@"health" forKeyedSubscript:@"userAction"];
  if (v10)
  {
    [v9 setObject:v6 forKeyedSubscript:@"HKDataType"];
    v12 = [MEMORY[0x1E4F1C9C8] now];
    v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v14 = [v13 component:32 fromDate:v12];

    v15 = (void *)[objc_alloc(NSNumber) initWithInteger:v14];
    [v9 setObject:v15 forKeyedSubscript:@"hourOfDay"];
  }
  return v9;
}

@end