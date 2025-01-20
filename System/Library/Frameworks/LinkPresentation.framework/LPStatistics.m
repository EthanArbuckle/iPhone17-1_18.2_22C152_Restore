@interface LPStatistics
+ (void)recordEvent:(id)a3;
+ (void)recordMetadataFetchEvent:(id)a3;
@end

@implementation LPStatistics

+ (void)recordEvent:(id)a3
{
  id v4 = a3;
  if (![v4 type] || objc_msgSend(v4, "type") == 4) {
    [a1 recordMetadataFetchEvent:v4];
  }
}

+ (void)recordMetadataFetchEvent:(id)a3
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v9[0] = @"status";
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "status"));
  v10[0] = v4;
  v9[1] = @"specialization";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "specialization"));
  v10[1] = v5;
  v9[2] = @"duration";
  v6 = NSNumber;
  [v3 duration];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v10[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  AnalyticsSendEvent();
}

@end