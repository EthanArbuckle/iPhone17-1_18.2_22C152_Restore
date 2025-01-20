@interface DKAnalytics
+ (void)sendAnalyticsWithEvent:(unint64_t)a3 error:(id)a4;
+ (void)sendAnalyticsWithEvent:(unint64_t)a3 payloadDict:(id)a4;
@end

@implementation DKAnalytics

+ (void)sendAnalyticsWithEvent:(unint64_t)a3 error:(id)a4
{
  v11[3] = *MEMORY[0x263EF8340];
  if (a4)
  {
    id v5 = a4;
    v6 = [v5 domain];
    v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "code"));
    v8 = [v5 localizedDescription];
  }
  else
  {
    v7 = &unk_26F0DB9C0;
    v8 = &stru_26F0D5118;
    v6 = &stru_26F0D5118;
  }
  v10[0] = @"errorDomain";
  v10[1] = @"errorCode";
  v11[0] = v6;
  v11[1] = v7;
  v10[2] = @"errorMessage";
  v11[2] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  +[DKAnalytics sendAnalyticsWithEvent:a3 payloadDict:v9];
}

+ (void)sendAnalyticsWithEvent:(unint64_t)a3 payloadDict:(id)a4
{
  if (a3 > 5) {
    v4 = 0;
  }
  else {
    v4 = off_264E866D8[a3];
  }
  id v5 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a4];
  [v5 setObject:v4 forKeyedSubscript:@"type"];
  AnalyticsSendEvent();
}

@end