@interface UnitInfo
- ($71D83D51AB0F57F7CF166351F850C832)baseDenominator;
- ($71D83D51AB0F57F7CF166351F850C832)baseNumerator;
- (BOOL)doNotSuggest;
- (BOOL)formatNextSmallest;
- (BOOL)impliesDivision;
- (BOOL)isBaseUnit;
- (BOOL)isCelsius;
- (BOOL)isDisplayName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFahrenheit;
- (BOOL)isInverted;
- (BOOL)isKelvin;
- (BOOL)isPreferredUnit;
- (NSArray)subunitIDs;
- (NSMutableDictionary)localizationToCompactName;
- (NSSet)allSubunitIDs;
- (NSString)name;
- (UnitInfo)bestEquivalent;
- (UnitInfo)init;
- (UnitInfo)nextSmallest;
- (UnitTypeInfo)typeInfo;
- (int)unitID;
- (int)unitType;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)measurementSystem;
- (void)setAllSubunitIDs:(id)a3;
- (void)setBaseDenominator:(id)a3;
- (void)setBaseNumerator:(id)a3;
- (void)setBestEquivalent:(id)a3;
- (void)setDoNotSuggest:(BOOL)a3;
- (void)setFormatNextSmallest:(BOOL)a3;
- (void)setImpliesDivision:(BOOL)a3;
- (void)setIsBaseUnit:(BOOL)a3;
- (void)setIsCelsius:(BOOL)a3;
- (void)setIsDisplayName:(BOOL)a3;
- (void)setIsFahrenheit:(BOOL)a3;
- (void)setIsInverted:(BOOL)a3;
- (void)setIsKelvin:(BOOL)a3;
- (void)setIsPreferredUnit:(BOOL)a3;
- (void)setLocalizationToCompactName:(id)a3;
- (void)setMeasurementSystem:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setNextSmallest:(id)a3;
- (void)setSubunitIDs:(id)a3;
- (void)setTypeInfo:(id)a3;
- (void)setUnitID:(int)a3;
- (void)setUnitType:(int)a3;
@end

@implementation UnitInfo

- (UnitTypeInfo)typeInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_typeInfo);
  return (UnitTypeInfo *)WeakRetained;
}

- (NSString)name
{
  return self->_name;
}

- (int)unitID
{
  return self->_unitID;
}

- (NSArray)subunitIDs
{
  return self->_subunitIDs;
}

- (NSSet)allSubunitIDs
{
  return self->_allSubunitIDs;
}

- (void)setMeasurementSystem:(unint64_t)a3
{
  self->_measurementSystem = a3;
}

- (UnitInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)UnitInfo;
  v2 = [(UnitInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(UnitInfo *)v2 setUnitID:0];
    -[UnitInfo setBaseNumerator:](v3, "setBaseNumerator:", 1, 0x3040000000000000);
    -[UnitInfo setBaseDenominator:](v3, "setBaseDenominator:", 1, 0x3040000000000000);
    v4 = objc_opt_new();
    [(UnitInfo *)v3 setAllSubunitIDs:v4];
  }
  return v3;
}

- (void)setUnitID:(int)a3
{
  self->_unitID = a3;
}

- (void)setBaseNumerator:(id)a3
{
  self->_baseNumerator = ($739D1A12408C92E4BFA0C2DF4C691557)a3;
}

- (void)setBaseDenominator:(id)a3
{
  self->_baseDenominator = ($739D1A12408C92E4BFA0C2DF4C691557)a3;
}

- (void)setAllSubunitIDs:(id)a3
{
}

- (void)setUnitType:(int)a3
{
  self->_unitType = a3;
}

- (void)setTypeInfo:(id)a3
{
}

- (void)setNextSmallest:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setIsPreferredUnit:(BOOL)a3
{
  self->_isPreferredUnit = a3;
}

- (void)setIsInverted:(BOOL)a3
{
  self->_isInverted = a3;
}

- (void)setIsDisplayName:(BOOL)a3
{
  self->_isDisplayName = a3;
}

- (void)setImpliesDivision:(BOOL)a3
{
  self->_impliesDivision = a3;
}

- (void)setFormatNextSmallest:(BOOL)a3
{
  self->_formatNextSmallest = a3;
}

- (void)setDoNotSuggest:(BOOL)a3
{
  self->_doNotSuggest = a3;
}

- (void)setBestEquivalent:(id)a3
{
}

- (BOOL)isDisplayName
{
  return self->_isDisplayName;
}

- ($71D83D51AB0F57F7CF166351F850C832)baseNumerator
{
  unint64_t v2 = self->_baseNumerator.w[1];
  unint64_t v3 = self->_baseNumerator.w[0];
  result.var0[1] = v2;
  result.var0[0] = v3;
  return result;
}

- (void)setSubunitIDs:(id)a3
{
}

- ($71D83D51AB0F57F7CF166351F850C832)baseDenominator
{
  unint64_t v2 = self->_baseDenominator.w[1];
  unint64_t v3 = self->_baseDenominator.w[0];
  result.var0[1] = v2;
  result.var0[0] = v3;
  return result;
}

- (int)unitType
{
  return self->_unitType;
}

- (void)setIsBaseUnit:(BOOL)a3
{
  self->_isBaseUnit = a3;
}

- (void)setIsKelvin:(BOOL)a3
{
  self->_isKelvin = a3;
}

- (void)setIsFahrenheit:(BOOL)a3
{
  self->_isFahrenheit = a3;
}

- (void)setIsCelsius:(BOOL)a3
{
  self->_isCelsius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizationToCompactName, 0);
  objc_storeStrong((id *)&self->_allSubunitIDs, 0);
  objc_storeStrong((id *)&self->_subunitIDs, 0);
  objc_destroyWeak((id *)&self->_nextSmallest);
  objc_destroyWeak((id *)&self->_bestEquivalent);
  objc_destroyWeak((id *)&self->_typeInfo);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setLocalizationToCompactName:(id)a3
{
}

- (NSMutableDictionary)localizationToCompactName
{
  return self->_localizationToCompactName;
}

- (BOOL)isPreferredUnit
{
  return self->_isPreferredUnit;
}

- (BOOL)formatNextSmallest
{
  return self->_formatNextSmallest;
}

- (UnitInfo)nextSmallest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextSmallest);
  return (UnitInfo *)WeakRetained;
}

- (BOOL)doNotSuggest
{
  return self->_doNotSuggest;
}

- (unint64_t)measurementSystem
{
  return self->_measurementSystem;
}

- (UnitInfo)bestEquivalent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bestEquivalent);
  return (UnitInfo *)WeakRetained;
}

- (BOOL)isKelvin
{
  return self->_isKelvin;
}

- (BOOL)isCelsius
{
  return self->_isCelsius;
}

- (BOOL)isFahrenheit
{
  return self->_isFahrenheit;
}

- (BOOL)impliesDivision
{
  return self->_impliesDivision;
}

- (BOOL)isBaseUnit
{
  return self->_isBaseUnit;
}

- (BOOL)isInverted
{
  return self->_isInverted;
}

- (unint64_t)hash
{
  uint64_t v3 = 31 * [(UnitInfo *)self unitID];
  return v3 + [(UnitInfo *)self unitType] + 961;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int v5 = [(UnitInfo *)self unitID];
  if (v5 <= (int)[v4 unitID])
  {
    int v7 = [(UnitInfo *)self unitID];
    if (v7 >= (int)[v4 unitID]) {
      int64_t v6 = 0;
    }
    else {
      int64_t v6 = -1;
    }
  }
  else
  {
    int64_t v6 = 1;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = [(UnitInfo *)self unitID];
  if (v5 == [v4 unitID])
  {
    int v6 = [(UnitInfo *)self unitType];
    BOOL v7 = v6 == [v4 unitType];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end