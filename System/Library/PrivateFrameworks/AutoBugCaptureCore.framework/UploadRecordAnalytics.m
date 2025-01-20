@interface UploadRecordAnalytics
- (UploadRecordAnalytics)init;
- (UploadRecordAnalytics)initWithWorkspace:(id)a3 withCache:(BOOL)a4;
@end

@implementation UploadRecordAnalytics

- (UploadRecordAnalytics)init
{
  v3 = +[AnalyticsWorkspace defaultWorkspace];
  v6.receiver = self;
  v6.super_class = (Class)UploadRecordAnalytics;
  v4 = [(ObjectAnalytics *)&v6 initWithWorkspace:v3 entityName:@"UploadRecord" withCache:1];

  return v4;
}

- (UploadRecordAnalytics)initWithWorkspace:(id)a3 withCache:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UploadRecordAnalytics;
  return [(ObjectAnalytics *)&v5 initWithWorkspace:a3 entityName:@"UploadRecord" withCache:a4];
}

@end