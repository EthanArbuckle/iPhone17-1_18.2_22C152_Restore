@interface USKObjectPath_helper
+ (id)objectPathWithString:(id)a3;
@end

@implementation USKObjectPath_helper

+ (id)objectPathWithString:(id)a3
{
  v3 = (void *)[objc_alloc((Class)USKObjectPath_weak) initWithString:a3];

  return v3;
}

@end