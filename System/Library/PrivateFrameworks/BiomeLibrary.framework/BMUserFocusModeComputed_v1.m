@interface BMUserFocusModeComputed_v1
- (int)semanticType;
@end

@implementation BMUserFocusModeComputed_v1

- (int)semanticType
{
  v4.receiver = self;
  v4.super_class = (Class)BMUserFocusModeComputed_v1;
  unsigned int v2 = [(BMUserFocusModeComputed *)&v4 semanticType];
  if (v2 < 0xA) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

@end