@interface BMHealthWorkout_v0
- (int)eventType;
@end

@implementation BMHealthWorkout_v0

- (int)eventType
{
  v4.receiver = self;
  v4.super_class = (Class)BMHealthWorkout_v0;
  unsigned int v2 = [(BMHealthWorkout *)&v4 eventType];
  if (v2 < 4) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

@end