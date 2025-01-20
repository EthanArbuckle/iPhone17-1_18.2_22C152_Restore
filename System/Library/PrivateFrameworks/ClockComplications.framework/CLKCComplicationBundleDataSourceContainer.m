@interface CLKCComplicationBundleDataSourceContainer
+ (NSArray)complicationBundleDataSources;
@end

@implementation CLKCComplicationBundleDataSourceContainer

+ (NSArray)complicationBundleDataSources
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

@end