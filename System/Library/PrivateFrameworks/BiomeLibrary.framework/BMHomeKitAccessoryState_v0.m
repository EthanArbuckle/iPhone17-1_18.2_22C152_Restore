@interface BMHomeKitAccessoryState_v0
- (int)valuetype;
@end

@implementation BMHomeKitAccessoryState_v0

- (int)valuetype
{
  v4.receiver = self;
  v4.super_class = (Class)BMHomeKitAccessoryState_v0;
  unsigned int v2 = [(BMHomeKitAccessoryState *)&v4 valueType];
  if (v2 < 3) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

@end