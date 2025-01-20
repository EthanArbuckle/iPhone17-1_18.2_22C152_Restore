@interface ASVAnalytics
+ (void)sendAnalyticsWithCategory:(id)a3 payloadDict:(id)a4;
+ (void)sendAnalyticsWithEvent:(unint64_t)a3;
+ (void)sendAnalyticsWithEvent:(unint64_t)a3 error:(id)a4;
+ (void)sendAnalyticsWithEvent:(unint64_t)a3 payloadDict:(id)a4;
@end

@implementation ASVAnalytics

+ (void)sendAnalyticsWithEvent:(unint64_t)a3
{
}

+ (void)sendAnalyticsWithEvent:(unint64_t)a3 error:(id)a4
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"errorDomain";
  id v5 = a4;
  v6 = [v5 domain];
  v11[0] = v6;
  v10[1] = @"errorCode";
  v7 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v5, "code"));
  v11[1] = v7;
  v10[2] = @"errorMessage";
  v8 = [v5 localizedDescription];

  v11[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  +[ASVAnalytics sendAnalyticsWithEvent:a3 payloadDict:v9];
}

+ (void)sendAnalyticsWithEvent:(unint64_t)a3 payloadDict:(id)a4
{
  id v7 = a4;
  id v15 = v7;
  if (a3 >= 0x15)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"ASVAnalytics.m" lineNumber:190 description:@"Event name should be defined"];

    id v8 = v15;
    v9 = 0;
    v10 = 0;
  }
  else
  {
    id v8 = v7;
    v9 = off_1E6DD7628[a3];
    v10 = off_1E6DD76D0[a3];
  }
  v12 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
  v13 = [v12 objectForKeyedSubscript:@"type"];

  if (v13)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"ASVAnalytics.m" lineNumber:194 description:@"[Analytics] Type should not already be defined"];
  }
  [v12 setObject:v10 forKeyedSubscript:@"type"];
  +[ASVAnalytics sendAnalyticsWithCategory:v9 payloadDict:v12];
}

+ (void)sendAnalyticsWithCategory:(id)a3 payloadDict:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:@"type"];

  if (!v8)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"ASVAnalytics.m" lineNumber:203 description:@"Event type should be defined"];
  }
  AnalyticsSendEvent();
}

@end