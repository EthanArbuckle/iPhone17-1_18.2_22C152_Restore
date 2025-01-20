@interface FUFLightTrack
- (FUFlightLeg)leg;
- (MKGeodesicPolyline)polyline;
- (void)setLeg:(id)a3;
- (void)setPolyline:(id)a3;
@end

@implementation FUFLightTrack

- (MKGeodesicPolyline)polyline
{
  return (MKGeodesicPolyline *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPolyline:(id)a3
{
}

- (FUFlightLeg)leg
{
  return (FUFlightLeg *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLeg:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leg, 0);

  objc_storeStrong((id *)&self->_polyline, 0);
}

@end