@interface NSURL(MapUtils)
+ (id)__ck_appleMapsURLForCoordinate:()MapUtils coordinateName:;
@end

@implementation NSURL(MapUtils)

+ (id)__ck_appleMapsURLForCoordinate:()MapUtils coordinateName:
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = objc_msgSend(NSString, "__ck_appleMapsURLStringForCoordinate:coordinateName:");
  v2 = [v0 URLWithString:v1];

  return v2;
}

@end