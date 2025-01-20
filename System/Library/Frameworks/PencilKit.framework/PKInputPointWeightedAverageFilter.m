@interface PKInputPointWeightedAverageFilter
- (void)addInputPoint:(id *)a3;
@end

@implementation PKInputPointWeightedAverageFilter

- (void)addInputPoint:(id *)a3
{
  if (self)
  {
    int64_t numInputPoints = self->super._numInputPoints;
    self->super._int64_t numInputPoints = numInputPoints + 1;
    if (numInputPoints)
    {
      double x = a3->var0.var0.x;
      double xyPositionSmoothingFactor = self->_xyPositionSmoothingFactor;
      if (xyPositionSmoothingFactor > 1.0) {
        double x = (x + self->super._filteredPoint.var0.point.x * (xyPositionSmoothingFactor + -1.0))
      }
          / xyPositionSmoothingFactor;
      double y = self->super._filteredPoint.var0.point.y;
      double azimuth = self->super._filteredPoint.azimuth;
      double altitude = self->super._filteredPoint.altitude;
      double zPosition = self->super._filteredPoint.zPosition;
      a3->var0.var0.double x = x;
      double v12 = a3->var0.var0.y;
      double v13 = self->_xyPositionSmoothingFactor;
      if (v13 > 1.0) {
        double v12 = (v12 + y * (v13 + -1.0)) / v13;
      }
      a3->var0.var0.double y = v12;
      double var6 = a3->var6;
      double zPositionSmoothingFactor = self->_zPositionSmoothingFactor;
      if (zPositionSmoothingFactor > 1.0) {
        double var6 = (var6 + zPosition * (zPositionSmoothingFactor + -1.0)) / zPositionSmoothingFactor;
      }
      a3->double var6 = var6;
      long double var3 = a3->var3;
      double altitudeSmoothingFactor = self->_altitudeSmoothingFactor;
      if (altitudeSmoothingFactor > 1.0)
      {
        DKDMixAnglesInRadians(altitude, var3, 1.0 / (altitudeSmoothingFactor + 1.0));
        long double var3 = v18;
      }
      a3->long double var3 = var3;
      long double var2 = a3->var2;
      double azimuthSmoothingFactor = self->_azimuthSmoothingFactor;
      if (azimuthSmoothingFactor > 1.0)
      {
        DKDMixAnglesInRadians(azimuth, var2, 1.0 / (azimuthSmoothingFactor + 1.0));
        long double var2 = v21;
      }
      a3->long double var2 = var2;
    }
    memmove(&self->super._filteredPoint, a3, 0x80uLL);
  }
}

@end