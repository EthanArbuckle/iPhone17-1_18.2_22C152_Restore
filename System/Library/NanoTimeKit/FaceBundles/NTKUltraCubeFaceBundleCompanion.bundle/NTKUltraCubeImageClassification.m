@interface NTKUltraCubeImageClassification
- (BOOL)hasAnimal;
- (BOOL)hasCityscape;
- (BOOL)hasNature;
- (BOOL)hasPeople;
- (NTKUltraCubeImageClassification)init;
- (void)setHasAnimal:(BOOL)a3;
- (void)setHasCityscape:(BOOL)a3;
- (void)setHasNature:(BOOL)a3;
- (void)setHasPeople:(BOOL)a3;
@end

@implementation NTKUltraCubeImageClassification

- (NTKUltraCubeImageClassification)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKUltraCubeImageClassification;
  result = [(NTKUltraCubeImageClassification *)&v3 init];
  if (result) {
    *(_DWORD *)&result->_hasPeople = 0;
  }
  return result;
}

- (BOOL)hasPeople
{
  return self->_hasPeople;
}

- (void)setHasPeople:(BOOL)a3
{
  self->_hasPeople = a3;
}

- (BOOL)hasAnimal
{
  return self->_hasAnimal;
}

- (void)setHasAnimal:(BOOL)a3
{
  self->_hasAnimal = a3;
}

- (BOOL)hasCityscape
{
  return self->_hasCityscape;
}

- (void)setHasCityscape:(BOOL)a3
{
  self->_hasCityscape = a3;
}

- (BOOL)hasNature
{
  return self->_hasNature;
}

- (void)setHasNature:(BOOL)a3
{
  self->_hasNature = a3;
}

@end