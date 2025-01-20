@interface PKInputPointRollNoiseFilter
- (id).cxx_construct;
- (void)_recalculateOffset;
- (void)addInputPoint:(id *)a3;
- (void)resetFilter;
@end

@implementation PKInputPointRollNoiseFilter

- (id).cxx_construct
{
  *((_DWORD *)self + 38) = 1;
  return self;
}

- (void)resetFilter
{
  v3.receiver = self;
  v3.super_class = (Class)PKInputPointRollNoiseFilter;
  [(PKInputPointBaseFilter *)&v3 resetFilter];
  [(PKInputPointRollNoiseFilter *)self _recalculateOffset];
}

- (void)_recalculateOffset
{
  if (self) {
    double rollOffsetNoise = self->_rollOffsetNoise;
  }
  else {
    double rollOffsetNoise = 0.0;
  }
  v3[0] = 0.0;
  v3[1] = rollOffsetNoise;
  char v4 = 0;
  self->currentRollOffsetValue = std::normal_distribution<double>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)v3, &self->generator.__x_, v3)* 0.0174532925;
}

- (void)addInputPoint:(id *)a3
{
  if (!self)
  {
    double rollJitterNoise = 0.0;
LABEL_3:
    if (self->currentRollOffsetValue <= 0.0) {
      goto LABEL_14;
    }
    goto LABEL_4;
  }
  ++self->super._numInputPoints;
  double rollJitterNoise = self->_rollJitterNoise;
  if (rollJitterNoise <= 0.0) {
    goto LABEL_3;
  }
LABEL_4:
  v9[0] = 0.0;
  v9[1] = rollJitterNoise;
  char v10 = 0;
  double v6 = a3->var12
     + std::normal_distribution<double>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)v9, &self->generator.__x_, v9)* 0.0174532925+ self->currentRollOffsetValue;
  long double v7 = fmod(v6, 6.28318531);
  if (v6 <= 6.28318531 && v6 >= 0.0) {
    long double v7 = v6;
  }
  if (v7 < 0.0) {
    long double v7 = v7 + 6.28318531;
  }
  if (v7 == 0.0) {
    long double v7 = 0.0;
  }
  a3->var12 = v7;
LABEL_14:

  memmove(&self->super._filteredPoint, a3, 0x80uLL);
}

@end