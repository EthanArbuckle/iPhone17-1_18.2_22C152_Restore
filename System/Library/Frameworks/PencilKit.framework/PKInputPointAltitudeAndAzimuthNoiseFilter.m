@interface PKInputPointAltitudeAndAzimuthNoiseFilter
- (id).cxx_construct;
- (void)_recalculateOffsets;
- (void)addInputPoint:(id *)a3;
- (void)resetFilter;
@end

@implementation PKInputPointAltitudeAndAzimuthNoiseFilter

- (void)_recalculateOffsets
{
  if (self) {
    double azimuthOffsetNoise = self->_azimuthOffsetNoise;
  }
  else {
    double azimuthOffsetNoise = 0.0;
  }
  v7[0] = 0.0;
  v7[1] = azimuthOffsetNoise;
  char v8 = 0;
  self->currentAzimuthOffsetValue = std::normal_distribution<double>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)v7, &self->generator.__x_, v7)* 0.0174532925;
  double altitudeOffsetNoise = self->_altitudeOffsetNoise;
  v5[0] = 0.0;
  v5[1] = altitudeOffsetNoise;
  char v6 = 0;
  self->currentAltitudeOffsetValue = std::normal_distribution<double>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)v5, &self->generator.__x_, v5)* 0.0174532925;
}

- (void)resetFilter
{
  v3.receiver = self;
  v3.super_class = (Class)PKInputPointAltitudeAndAzimuthNoiseFilter;
  [(PKInputPointBaseFilter *)&v3 resetFilter];
  [(PKInputPointAltitudeAndAzimuthNoiseFilter *)self _recalculateOffsets];
}

- (void)addInputPoint:(id *)a3
{
  if (self)
  {
    ++self->super._numInputPoints;
    if (self->_noiseIsHeightBased) {
      double v5 = a3->var6 / 12.0;
    }
    else {
      double v5 = 1.0;
    }
    double v6 = v5 * self->_azimuthJitterNoise;
    if (v6 > 0.0)
    {
      uint64_t v15 = 0;
      double v16 = v6;
      char v17 = 0;
      double v7 = a3->var2
         + std::normal_distribution<double>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)&v15, &self->generator.__x_, (double *)&v15)* 0.0174532925+ self->currentAzimuthOffsetValue * v5;
      long double v8 = fmod(v7, 6.28318531);
      if (v7 <= 6.28318531 && v7 >= 0.0) {
        long double v8 = v7;
      }
      if (v8 < 0.0) {
        long double v8 = v8 + 6.28318531;
      }
      if (v8 == 0.0) {
        long double v8 = 0.0;
      }
      a3->var2 = v8;
    }
    double v10 = v5 * self->_altitudeJitterNoise;
    if (v10 > 0.0)
    {
      uint64_t v15 = 0;
      double v16 = v10;
      char v17 = 0;
      double v11 = a3->var3
          + std::normal_distribution<double>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)&v15, &self->generator.__x_, (double *)&v15)* 0.0174532925+ self->currentAltitudeOffsetValue * v5;
      double v12 = fmod(v11, 6.28318531);
      double v13 = 0.0;
      if (v11 <= 6.28318531 && v11 >= 0.0) {
        double v12 = v11;
      }
      if (v12 < 0.0) {
        double v12 = v12 + 6.28318531;
      }
      if (v12 == 0.0) {
        double v12 = 0.0;
      }
      if (v12 >= 0.0)
      {
        double v13 = v12;
        if (v12 > 1.57079633) {
          double v13 = 1.57079633;
        }
      }
      a3->var3 = v13;
    }
    memmove(&self->super._filteredPoint, a3, 0x80uLL);
  }
}

- (id).cxx_construct
{
  *((_DWORD *)self + 38) = 1;
  return self;
}

@end