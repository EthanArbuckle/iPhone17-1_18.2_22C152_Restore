@interface IMSendProgressRealTimeDataSource
- (double)timeIntervalSinceReferenceDate;
@end

@implementation IMSendProgressRealTimeDataSource

- (double)timeIntervalSinceReferenceDate
{
  v4 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], a2, v2, v3);
  objc_msgSend_timeIntervalSinceReferenceDate(v4, v5, v6, v7);
  double v9 = v8;

  return v9;
}

@end