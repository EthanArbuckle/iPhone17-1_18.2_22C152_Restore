@interface RSCamera
- (int64_t)trackingState;
- (void)setTrackingState:(int64_t)a3;
@end

@implementation RSCamera

- (int64_t)trackingState
{
  return *(void *)self->trackingState;
}

- (void)setTrackingState:(int64_t)a3
{
  *(void *)self->trackingState = a3;
}

@end