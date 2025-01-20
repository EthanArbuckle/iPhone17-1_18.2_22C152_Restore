@interface UnitTypeInfo
- ($71D83D51AB0F57F7CF166351F850C832)decompositionCoefficient;
- (BOOL)isCurrency;
- (BOOL)isDecomposable;
- (BOOL)isTemperature;
- (BOOL)isVolume;
- (NSArray)units;
- (NSString)name;
- (UnitCounts)decomposition;
- (UnitInfo)baseUnit;
- (int)unitType;
- (void)setBaseUnit:(id)a3;
- (void)setDecomposition:(UnitCounts *)a3;
- (void)setDecompositionCoefficient:(id)a3;
- (void)setIsCurrency:(BOOL)a3;
- (void)setIsDecomposable:(BOOL)a3;
- (void)setIsTemperature:(BOOL)a3;
- (void)setIsVolume:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setUnitType:(int)a3;
- (void)setUnits:(id)a3;
@end

@implementation UnitTypeInfo

- (BOOL)isCurrency
{
  return self->_isCurrency;
}

- (BOOL)isTemperature
{
  return self->_isTemperature;
}

- (BOOL)isDecomposable
{
  return self->_isDecomposable;
}

- (UnitInfo)baseUnit
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_baseUnit);
  return (UnitInfo *)WeakRetained;
}

- (void)setUnits:(id)a3
{
}

- (void)setUnitType:(int)a3
{
  self->_unitType = a3;
}

- (void)setName:(id)a3
{
}

- (void)setIsDecomposable:(BOOL)a3
{
  self->_isDecomposable = a3;
}

- (void)setDecompositionCoefficient:(id)a3
{
  self->_decompositionCoefficient = ($739D1A12408C92E4BFA0C2DF4C691557)a3;
}

- (void)setBaseUnit:(id)a3
{
}

- (void)setDecomposition:(UnitCounts *)a3
{
  long long v3 = *(_OWORD *)&a3->types[0].unitID;
  long long v4 = *(_OWORD *)&a3->types[2].unitID;
  long long v5 = *(_OWORD *)&a3->types[6].unitID;
  *(_OWORD *)&self->_decomposition.types[4].unitID = *(_OWORD *)&a3->types[4].unitID;
  *(_OWORD *)&self->_decomposition.types[6].unitID = v5;
  *(_OWORD *)&self->_decomposition.types[0].unitID = v3;
  *(_OWORD *)&self->_decomposition.types[2].unitID = v4;
  long long v6 = *(_OWORD *)&a3->types[8].unitID;
  long long v7 = *(_OWORD *)&a3->types[10].unitID;
  long long v8 = *(_OWORD *)&a3->types[14].unitID;
  *(_OWORD *)&self->_decomposition.types[12].unitID = *(_OWORD *)&a3->types[12].unitID;
  *(_OWORD *)&self->_decomposition.types[14].unitID = v8;
  *(_OWORD *)&self->_decomposition.types[8].unitID = v6;
  *(_OWORD *)&self->_decomposition.types[10].unitID = v7;
}

- (void)setIsVolume:(BOOL)a3
{
  self->_isVolume = a3;
}

- (void)setIsTemperature:(BOOL)a3
{
  self->_isTemperature = a3;
}

- (void)setIsCurrency:(BOOL)a3
{
  self->_isCurrency = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_baseUnit);
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)isVolume
{
  return self->_isVolume;
}

- (NSArray)units
{
  return self->_units;
}

- (UnitCounts)decomposition
{
  long long v3 = *(_OWORD *)&self[1].types[2].unitID;
  *(_OWORD *)&retstr->types[8].unitID = *(_OWORD *)&self[1].types[0].unitID;
  *(_OWORD *)&retstr->types[10].unitID = v3;
  long long v4 = *(_OWORD *)&self[1].types[6].unitID;
  *(_OWORD *)&retstr->types[12].unitID = *(_OWORD *)&self[1].types[4].unitID;
  *(_OWORD *)&retstr->types[14].unitID = v4;
  long long v5 = *(_OWORD *)&self->types[10].unitID;
  *(_OWORD *)&retstr->types[0].unitID = *(_OWORD *)&self->types[8].unitID;
  *(_OWORD *)&retstr->types[2].unitID = v5;
  long long v6 = *(_OWORD *)&self->types[14].unitID;
  *(_OWORD *)&retstr->types[4].unitID = *(_OWORD *)&self->types[12].unitID;
  *(_OWORD *)&retstr->types[6].unitID = v6;
  return self;
}

- ($71D83D51AB0F57F7CF166351F850C832)decompositionCoefficient
{
  unint64_t v2 = self->_decompositionCoefficient.w[1];
  unint64_t v3 = self->_decompositionCoefficient.w[0];
  result.var0[1] = v2;
  result.var0[0] = v3;
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (int)unitType
{
  return self->_unitType;
}

@end