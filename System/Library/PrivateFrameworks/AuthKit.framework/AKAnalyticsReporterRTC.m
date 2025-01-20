@interface AKAnalyticsReporterRTC
+ (id)rtcAnalyticsReporter;
@end

@implementation AKAnalyticsReporterRTC

+ (id)rtcAnalyticsReporter
{
  if (qword_1002723A8 != -1) {
    dispatch_once(&qword_1002723A8, &stru_100228150);
  }
  v2 = (void *)qword_1002723A0;

  return v2;
}

@end