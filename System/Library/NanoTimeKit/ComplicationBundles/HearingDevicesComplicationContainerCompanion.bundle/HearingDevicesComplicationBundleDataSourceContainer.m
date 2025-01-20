@interface HearingDevicesComplicationBundleDataSourceContainer
+ (id)complicationBundleDataSources;
@end

@implementation HearingDevicesComplicationBundleDataSourceContainer

+ (id)complicationBundleDataSources
{
  uint64_t v4 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

@end