@interface BMTextInputSession_v0
- (int)sessionInput;
@end

@implementation BMTextInputSession_v0

- (int)sessionInput
{
  v4.receiver = self;
  v4.super_class = (Class)BMTextInputSession_v0;
  unsigned int v2 = [(BMTextInputSession *)&v4 sessionInput];
  if (v2 < 4) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

@end