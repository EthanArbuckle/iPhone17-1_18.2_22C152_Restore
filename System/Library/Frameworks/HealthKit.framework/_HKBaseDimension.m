@interface _HKBaseDimension
+ (id)_uniquedDefinedDimensionWithName:(id)a3;
+ (id)_uniquedDimensionWithName:(id)a3 configuration:(id)a4;
+ (id)angle;
+ (id)changeInTemperature;
+ (id)conductance;
+ (id)diopter;
+ (id)electricPotentialDifference;
+ (id)energy;
+ (id)equivalents;
+ (id)frequency;
+ (id)hearingSensitivity;
+ (id)illuminance;
+ (id)length;
+ (id)mass;
+ (id)nonConvertibleIU;
+ (id)nonConvertibleMole;
+ (id)nullDimension;
+ (id)power;
+ (id)pressure;
+ (id)prismDiopter;
+ (id)soundPressureLevel;
+ (id)temperature;
+ (id)time;
+ (id)titer;
+ (id)unitLess;
+ (id)volume;
- (BOOL)canBeReduced;
- (BOOL)isEqual:(id)a3;
- (HKBaseUnit)reducibleBaseUnit;
- (HKUnit)reducedUnit;
- (NSString)name;
- (double)reductionCoefficient;
- (id)_baseDimensions;
- (id)_initWithName:(id)a3;
- (unint64_t)hash;
- (void)setReducedUnit:(id)a3;
- (void)setReducibleBaseUnit:(id)a3;
- (void)setReductionCoefficient:(double)a3;
@end

@implementation _HKBaseDimension

- (unint64_t)hash
{
  v2 = [(_HKBaseDimension *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [v4 name];
    v6 = [(_HKBaseDimension *)self name];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)time
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"Time"];
}

+ (id)_uniquedDefinedDimensionWithName:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53___HKBaseDimension__uniquedDefinedDimensionWithName___block_invoke;
  v8[3] = &unk_1E58C2C70;
  id v9 = v4;
  id v5 = v4;
  v6 = [a1 _uniquedDimensionWithName:v5 configuration:v8];

  return v6;
}

+ (id)_uniquedDimensionWithName:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  char v7 = (void (**)(id, void *))a4;
  if (_uniquedDimensionWithName_configuration__onceToken != -1) {
    dispatch_once(&_uniquedDimensionWithName_configuration__onceToken, &__block_literal_global_98_0);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_uniquedDimensionWithName_configuration__uniquingLock);
  v8 = [(id)_uniquedDimensionWithName_configuration____dimensionsByName objectForKey:v6];
  if (!v8)
  {
    v8 = (void *)[objc_alloc((Class)a1) _initWithName:v6];
    if (v7) {
      v7[2](v7, v8);
    }
    [(id)_uniquedDimensionWithName_configuration____dimensionsByName setObject:v8 forKey:v6];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_uniquedDimensionWithName_configuration__uniquingLock);

  return v8;
}

- (BOOL)canBeReduced
{
  return self->_reducibleBaseUnit && self->_reducedUnit != 0;
}

+ (id)nullDimension
{
  return (id)[a1 _uniquedDimensionWithName:@"(null)" configuration:&__block_literal_global_50];
}

- (id)_initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKBaseDimension;
  id v5 = [(_HKDimension *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (void)setReducibleBaseUnit:(id)a3
{
}

- (void)setReducedUnit:(id)a3
{
}

- (HKBaseUnit)reducibleBaseUnit
{
  return self->_reducibleBaseUnit;
}

- (double)reductionCoefficient
{
  return self->_reductionCoefficient;
}

- (HKUnit)reducedUnit
{
  return self->_reducedUnit;
}

+ (id)length
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"Length"];
}

+ (id)mass
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"Mass"];
}

+ (id)volume
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"Volume"];
}

+ (id)pressure
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"Pressure"];
}

+ (id)energy
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"Energy"];
}

+ (id)temperature
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"Temperature"];
}

+ (id)changeInTemperature
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"TemperatureChange"];
}

+ (id)conductance
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"Conductance"];
}

+ (id)frequency
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"Frequency"];
}

+ (id)nonConvertibleMole
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"NonConvertibleMole"];
}

+ (id)nonConvertibleIU
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"NonConvertibleIU"];
}

+ (id)equivalents
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"Equivalents"];
}

+ (id)hearingSensitivity
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"HearingSensitivity"];
}

+ (id)soundPressureLevel
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"SoundPressureLevel"];
}

+ (id)titer
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"Titer"];
}

+ (id)electricPotentialDifference
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"ElectricPotentialDifference"];
}

+ (id)power
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"Power"];
}

+ (id)diopter
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"Diopter"];
}

+ (id)prismDiopter
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"PrismDiopter"];
}

+ (id)angle
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"Angle"];
}

+ (id)illuminance
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"Illuminance"];
}

+ (id)unitLess
{
  return (id)[a1 _uniquedDefinedDimensionWithName:@"UnitLess"];
}

- (id)_baseDimensions
{
  return +[_HKFactorization factorizationWithFactor:self exponent:1];
}

- (void)setReductionCoefficient:(double)a3
{
  self->_reductionCoefficient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reducedUnit, 0);
  objc_storeStrong((id *)&self->_reducibleBaseUnit, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end