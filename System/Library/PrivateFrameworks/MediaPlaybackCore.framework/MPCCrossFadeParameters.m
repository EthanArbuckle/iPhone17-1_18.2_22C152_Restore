@interface MPCCrossFadeParameters
- (double)duration;
- (void)setDuration:(double)a3;
@end

@implementation MPCCrossFadeParameters

- (double)duration
{
  return *(double *)self->duration;
}

- (void)setDuration:(double)a3
{
  *(double *)self->duration = a3;
}

@end