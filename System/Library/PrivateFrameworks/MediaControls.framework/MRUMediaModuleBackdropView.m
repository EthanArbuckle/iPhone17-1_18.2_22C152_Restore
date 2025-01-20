@interface MRUMediaModuleBackdropView
+ (Class)layerClass;
@end

@implementation MRUMediaModuleBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end