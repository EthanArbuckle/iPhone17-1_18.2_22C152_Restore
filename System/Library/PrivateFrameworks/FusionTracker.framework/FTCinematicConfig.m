@interface FTCinematicConfig
- (BOOL)allowTrackPromotion;
- (BOOL)ensureObservationTimestampMatchesFrame;
- (FTCinematicConfig)init;
- (void)setAllowTrackPromotion:(BOOL)a3;
- (void)setEnsureObservationTimestampMatchesFrame:(BOOL)a3;
@end

@implementation FTCinematicConfig

- (FTCinematicConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTCinematicConfig;
  v2 = [(FTCinematicConfig *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(FTCinematicConfig *)v2 setEnsureObservationTimestampMatchesFrame:0];
    [(FTCinematicConfig *)v3 setAllowTrackPromotion:0];
    v4 = v3;
  }

  return v3;
}

- (BOOL)ensureObservationTimestampMatchesFrame
{
  return self->_ensureObservationTimestampMatchesFrame;
}

- (void)setEnsureObservationTimestampMatchesFrame:(BOOL)a3
{
  self->_ensureObservationTimestampMatchesFrame = a3;
}

- (BOOL)allowTrackPromotion
{
  return self->_allowTrackPromotion;
}

- (void)setAllowTrackPromotion:(BOOL)a3
{
  self->_allowTrackPromotion = a3;
}

@end