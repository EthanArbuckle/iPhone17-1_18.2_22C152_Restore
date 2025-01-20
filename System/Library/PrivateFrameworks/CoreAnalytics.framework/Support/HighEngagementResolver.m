@interface HighEngagementResolver
+ (id)fetchHighEngagementCategories;
@end

@implementation HighEngagementResolver

+ (id)fetchHighEngagementCategories
{
  v2 = objc_opt_new();
  [v2 setObject:&stru_10015AE90 forKeyedSubscript:@"TopCategory1"];
  [v2 setObject:&stru_10015AE90 forKeyedSubscript:@"TopCategory2"];
  [v2 setObject:&stru_10015AE90 forKeyedSubscript:@"TopCategory3"];
  [v2 setObject:&stru_10015AE90 forKeyedSubscript:@"HighEngagementCategory1"];
  [v2 setObject:&stru_10015AE90 forKeyedSubscript:@"HighEngagementCategory2"];
  if (objc_opt_class() && objc_opt_class())
  {
    v3 = BiomeLibrary();
    v4 = [v3 OSAnalytics];
    v5 = [v4 CA];
    v6 = [v5 HighEngagementDevices];

    v7 = objc_opt_new();
    [v7 setDay:-1];
    v8 = +[NSDate date];
    v9 = +[NSCalendar currentCalendar];
    v10 = [v9 dateByAddingComponents:v7 toDate:v8 options:0];

    id v11 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:v10 endDate:v8 maxEvents:1 lastN:1 reversed:0];
    v12 = [v6 publisherWithOptions:v11];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100063CB8;
    v15[3] = &unk_100153DA0;
    id v16 = v2;
    id v13 = [v12 sinkWithCompletion:&stru_100153D78 receiveInput:v15];
  }

  return v2;
}

@end