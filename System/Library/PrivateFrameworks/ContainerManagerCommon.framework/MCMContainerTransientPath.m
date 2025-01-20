@interface MCMContainerTransientPath
+ (Class)_containerClassPathClass;
@end

@implementation MCMContainerTransientPath

+ (Class)_containerClassPathClass
{
  return (Class)objc_opt_class();
}

@end