@interface USKToken_helper
+ (id)tokenWithString:(id)a3;
@end

@implementation USKToken_helper

+ (id)tokenWithString:(id)a3
{
  v3 = (void *)[objc_alloc((Class)USKToken_weak) initWithString:a3];

  return v3;
}

@end