@interface SKANGhostbackEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
+ (id)defaultProperties;
- (BOOL)canUpdateWithRestrictedConversionValue:(int64_t)a3;
@end

@implementation SKANGhostbackEntity

+ (id)databaseTable
{
  return @"skan_ghostbacks";
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultProperties
{
  v4[0] = @"app_adam_id";
  v4[1] = @"app_bundle_id";
  v4[2] = @"restricted_conversion_value";
  v4[3] = @"free_conversion_value";
  v4[4] = @"coarse_conversion_value";
  v4[5] = @"is_registered";
  v4[6] = @"origin_timestamp";
  v4[7] = @"update_timestamp";
  v4[8] = @"restricted_update_timestamp";
  v4[9] = @"fetch_timestamp";
  v4[10] = @"is_locked";
  v4[11] = @"environment";
  v2 = +[NSArray arrayWithObjects:v4 count:12];
  return v2;
}

- (BOOL)canUpdateWithRestrictedConversionValue:(int64_t)a3
{
  v5 = +[NSDate dateWithTimeIntervalSinceNow:-86400.0];
  [v5 timeIntervalSince1970];
  double v7 = v6;

  v8 = sub_10026E95C(self, @"environment");
  v9 = +[SKANEnvironmentHelper pingbackDelayOverrideForEnvironment:v8];
  v10 = v9;
  if (v9)
  {
    v11 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)-(uint64_t)[v9 integerValue]);
    [v11 timeIntervalSince1970];
    double v7 = v12;
  }
  v13 = sub_10026E82C(self, @"restricted_update_timestamp");
  id v14 = [v13 longLongValue];

  BOOL v15 = (uint64_t)v14 >= (uint64_t)(v7 * 1000.0)
     && (uint64_t)sub_10026E91C(self, @"restricted_conversion_value") < a3;

  return v15;
}

@end