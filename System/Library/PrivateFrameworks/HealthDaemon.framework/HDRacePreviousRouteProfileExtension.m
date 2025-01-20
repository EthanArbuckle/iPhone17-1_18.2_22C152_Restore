@interface HDRacePreviousRouteProfileExtension
- (HDRacePreviousRouteProfileExtension)initWithProfile:(id)a3;
- (HDRaceRouteClusterManager)raceRouteClusterManager;
@end

@implementation HDRacePreviousRouteProfileExtension

- (HDRacePreviousRouteProfileExtension)initWithProfile:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDRacePreviousRouteProfileExtension;
  v5 = [(HDRacePreviousRouteProfileExtension *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = [[HDRaceRouteClusterManager alloc] initWithProfile:v4];
    raceRouteClusterManager = v6->_raceRouteClusterManager;
    v6->_raceRouteClusterManager = v7;
  }
  return v6;
}

- (HDRaceRouteClusterManager)raceRouteClusterManager
{
  return self->_raceRouteClusterManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_raceRouteClusterManager, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end