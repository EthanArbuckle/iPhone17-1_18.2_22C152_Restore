@interface PKInputPointAltitudeAndAzimuthBucketingFilter
- (void)addInputPoint:(id *)a3;
@end

@implementation PKInputPointAltitudeAndAzimuthBucketingFilter

- (void)addInputPoint:(id *)a3
{
  if (self)
  {
    ++self->super._numInputPoints;
    int64_t numAzimuthBuckets = self->_numAzimuthBuckets;
    if (numAzimuthBuckets >= 1)
    {
      double v6 = 6.28318531 / (double)numAzimuthBuckets;
      double v7 = v6 * 0.5;
      double var2 = a3->var2;
      double v9 = 0.0;
      do
      {
        double v10 = v9 - v7;
        if (v9 - v7 < 0.0)
        {
          double v10 = fmod(v10, 6.28318531);
          if (v10 < 0.0) {
            double v10 = v10 + 6.28318531;
          }
          if (v10 == 0.0) {
            double v10 = 0.0;
          }
        }
        if (var2 <= v7 + v9 && var2 >= v10) {
          break;
        }
        double v9 = v6 + v9;
        --numAzimuthBuckets;
      }
      while (numAzimuthBuckets);
      a3->double var2 = v9;
    }
    int64_t numAltitudeBuckets = self->_numAltitudeBuckets;
    if (numAltitudeBuckets >= 1)
    {
      double v13 = 1.57079633 / (double)numAltitudeBuckets;
      double v14 = 0.0;
      do
      {
        double v15 = v14;
        double v14 = v13 + v14;
        if (a3->var3 <= v14) {
          break;
        }
        double v15 = v14;
        --numAltitudeBuckets;
      }
      while (numAltitudeBuckets);
      a3->var3 = v13 * 0.5 + v15;
    }
    memmove(&self->super._filteredPoint, a3, 0x80uLL);
  }
}

@end