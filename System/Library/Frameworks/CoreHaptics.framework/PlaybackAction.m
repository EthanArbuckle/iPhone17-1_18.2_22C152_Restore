@interface PlaybackAction
- (float)time;
- (int64_t)action;
- (void)setAction:(int64_t)a3;
- (void)setTime:(float)a3;
@end

@implementation PlaybackAction

- (int64_t)action
{
  return self->action;
}

- (void)setTime:(float)a3
{
  self->time = a3;
}

- (void)setAction:(int64_t)a3
{
  self->action = a3;
}

- (float)time
{
  return self->time;
}

@end