@interface _GEORouteMatchingSegment
- (id)description;
- (long)distanceFromCoordinate:(uint64_t)a3 outCoordinateOnSegment:(double)a4 outRouteCoordinate:(double)a5;
@end

@implementation _GEORouteMatchingSegment

- (long)distanceFromCoordinate:(uint64_t)a3 outCoordinateOnSegment:(double)a4 outRouteCoordinate:(double)a5
{
  if (!a1) {
    return 0.0;
  }
  double v16 = GEOClosestCoordinateOnLineSegmentFromCoordinate3D(*(double *)(a1 + 24), *(double *)(a1 + 32), 1.79769313e308, *(double *)(a1 + 40), *(double *)(a1 + 48), 1.79769313e308, a10, a11, a4, a5);
  double v18 = v16;
  double v19 = v17;
  if (a2)
  {
    *a2 = v16;
    a2[1] = v17;
  }
  if (a3)
  {
    double v20 = *(double *)(a1 + 24);
    double v21 = *(double *)(a1 + 40);
    if (vabdd_f64(v20, v21) <= 0.0000005)
    {
      double v23 = *(double *)(a1 + 32);
      double v24 = *(double *)(a1 + 48);
      double v22 = 0.0;
      if (vabdd_f64(v23, v24) > 0.0000005) {
        double v22 = (v19 - v23) / (v24 - v23);
      }
    }
    else
    {
      double v22 = (v18 - v20) / (v21 - v20);
    }
    if (v22 < 0.0) {
      double v22 = 0.0;
    }
    if (v22 > 1.0) {
      double v22 = 1.0;
    }
    float v25 = v22;
    float v26 = *(float *)(a1 + 12) + (float)((float)(*(float *)(a1 + 16) - *(float *)(a1 + 12)) * v25);
    if (v26 < 0.0) {
      float v26 = 0.0;
    }
    if (v26 > 1.0) {
      float v26 = 1.0;
    }
    *(_DWORD *)a3 = *(_DWORD *)(a1 + 8);
    *(float *)(a3 + 4) = v26;
  }

  return GEOCalculateDistanceRadius(a4, a5, v18, v19, 6367000.0);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[%u, %f] - [%u, %f] | (%f, %f) to (%f, %f) | course: %0.2f | step: %d", self->_startPointIndex, self->_startRouteCoordinateOffset, self->_startPointIndex, self->_endRouteCoordinateOffset, *(void *)&self->_startCoordinate.latitude, *(void *)&self->_startCoordinate.longitude, *(void *)&self->_endCoordinate.latitude, *(void *)&self->_endCoordinate.longitude, GEOBearingFromCoordinateToCoordinate(self->_startCoordinate.latitude, self->_startCoordinate.longitude, self->_endCoordinate.latitude, self->_endCoordinate.longitude), -[GEOComposedRouteStep stepIndex](self->_step, "stepIndex")];
}

- (void).cxx_destruct
{
}

@end