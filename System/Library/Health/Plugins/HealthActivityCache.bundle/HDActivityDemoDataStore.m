@interface HDActivityDemoDataStore
+ (BOOL)shouldShowActivityDemoData;
+ (id)demoStatisticsDataForTypeIdentifier:(id)a3;
+ (id)demoValueForKey:(id)a3 withDataTypeIdentifier:(id)a4;
@end

@implementation HDActivityDemoDataStore

+ (BOOL)shouldShowActivityDemoData
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"showDemoActivityData"];

  return v3;
}

+ (id)demoValueForKey:(id)a3 withDataTypeIdentifier:(id)a4
{
  id v6 = a3;
  v7 = sub_4718((uint64_t)a1, a4);
  v8 = [v7 stringByAppendingString:v6];

  v9 = +[NSUserDefaults standardUserDefaults];
  v10 = [v9 valueForKey:v8];

  return v10;
}

+ (id)demoStatisticsDataForTypeIdentifier:(id)a3
{
  unsigned __int8 v3 = sub_4718((uint64_t)a1, a3);
  v4 = [v3 stringByAppendingString:@".array"];
  v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 arrayForKey:v4];

  return v6;
}

@end