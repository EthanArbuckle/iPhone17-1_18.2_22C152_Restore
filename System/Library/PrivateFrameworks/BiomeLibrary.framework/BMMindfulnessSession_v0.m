@interface BMMindfulnessSession_v0
- (int)sessionMode;
@end

@implementation BMMindfulnessSession_v0

- (int)sessionMode
{
  v4.receiver = self;
  v4.super_class = (Class)BMMindfulnessSession_v0;
  unsigned int v2 = [(BMMindfulnessSession *)&v4 sessionMode];
  if (v2 < 3) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

@end