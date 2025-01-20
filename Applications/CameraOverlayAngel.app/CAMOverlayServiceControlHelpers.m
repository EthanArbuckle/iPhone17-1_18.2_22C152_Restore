@interface CAMOverlayServiceControlHelpers
+ (id)interpretControl:(id)a3;
- (CAMOverlayServiceControlHelpers)init;
@end

@implementation CAMOverlayServiceControlHelpers

- (CAMOverlayServiceControlHelpers)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CAMOverlayServiceControlHelpers *)&v3 init];
}

+ (id)interpretControl:(id)a3
{
  id v3 = a3;
  id v4 = sub_10000B094();

  return v4;
}

@end