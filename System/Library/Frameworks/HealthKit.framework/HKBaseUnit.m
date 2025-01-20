@interface HKBaseUnit
+ (BOOL)supportsSecureCoding;
+ (id)_rootUnitWithDefinition:(id *)a3;
+ (id)_uniquedRootUnit:(id)a3;
+ (id)_uniquedRootUnitFromDefinition:(id *)a3;
+ (id)_uniquedUnitWithPrefix:(id)a3 conversionConstant:(id)a4 rootUnit:(id)a5;
+ (id)_uniquedUnitWithPrefix:(id)a3 rootUnit:(id)a4;
+ (id)unitFromString:(id)a3;
- (HKBaseUnit)initWithCoder:(id)a3;
- (_HKBaseDimension)dimension;
- (double)proportionalSize;
- (id)_baseUnits;
- (id)_computeBaseUnitReductionAndProportionalSize:(double *)a3 withCycleSet:(id)a4;
- (id)_initWithUnitString:(id)a3 proportionalSize:(double)a4 scaleOffset:(double)a5;
- (id)_unitByPrefixing:(id)a3 withConversionConstant:(id)a4;
- (id)awakeAfterUsingCoder:(id)a3;
- (id)unitString;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKBaseUnit

+ (id)_uniquedRootUnit:(id)a3
{
  id v4 = a3;
  v5 = (const char *)[v4 UTF8String];
  uint64_t v6 = 0;
  while (1)
  {
    v7 = (&__SIUnitDefinitions)[v6];
    long long v8 = *(_OWORD *)&(&__SIUnitDefinitions)[v6 + 3];
    long long v19 = *(_OWORD *)&(&__SIUnitDefinitions)[v6 + 1];
    long long v20 = v8;
    v21 = (&__SIUnitDefinitions)[v6 + 5];
    if (!strcmp(v7, v5)) {
      break;
    }
    v6 += 6;
    if (v6 == 102)
    {
      uint64_t v9 = 0;
      while (1)
      {
        v7 = (&__OtherUnitDefinitions)[v9];
        long long v10 = *(_OWORD *)&(&__OtherUnitDefinitions)[v9 + 3];
        long long v19 = *(_OWORD *)&(&__OtherUnitDefinitions)[v9 + 1];
        long long v20 = v10;
        v21 = (&__OtherUnitDefinitions)[v9 + 5];
        if (!strcmp(v7, v5)) {
          goto LABEL_11;
        }
        v9 += 6;
        if (v9 == 222)
        {
          uint64_t v11 = 0;
          while (1)
          {
            v7 = (&__ContextSpecificUnitDefinitions)[v11];
            long long v12 = *(_OWORD *)&(&__ContextSpecificUnitDefinitions)[v11 + 3];
            long long v19 = *(_OWORD *)&(&__ContextSpecificUnitDefinitions)[v11 + 1];
            long long v20 = v12;
            v21 = (&__ContextSpecificUnitDefinitions)[v11 + 5];
            if (!strcmp(v7, v5)) {
              goto LABEL_11;
            }
            v11 += 6;
            if (v11 == 24)
            {
              [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Invalid (un-prefixed) unit string: %@", v4 format];
              v7 = 0;
              v21 = 0;
              long long v19 = 0u;
              long long v20 = 0u;
              goto LABEL_11;
            }
          }
        }
      }
    }
  }
LABEL_11:

  v15 = v7;
  long long v16 = v19;
  long long v17 = v20;
  v18 = v21;
  v13 = [a1 _uniquedRootUnitFromDefinition:&v15];

  return v13;
}

+ (id)_uniquedRootUnitFromDefinition:(id *)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&_uniquedRootUnitFromDefinition__lock);
  v5 = [NSString stringWithUTF8String:a3->var0];
  uint64_t v6 = [(id)_uniquedRootUnitFromDefinition__units objectForKeyedSubscript:v5];
  if (!v6)
  {
    long long v7 = *(_OWORD *)&a3->var2;
    v12[0] = *(_OWORD *)&a3->var0;
    v12[1] = v7;
    v12[2] = *(_OWORD *)&a3->var4;
    uint64_t v6 = [a1 _rootUnitWithDefinition:v12];
    v6[72] = 1;
    long long v8 = (void *)_uniquedRootUnitFromDefinition__units;
    if (!_uniquedRootUnitFromDefinition__units)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v10 = (void *)_uniquedRootUnitFromDefinition__units;
      _uniquedRootUnitFromDefinition__units = (uint64_t)v9;

      long long v8 = (void *)_uniquedRootUnitFromDefinition__units;
    }
    [v8 setObject:v6 forKeyedSubscript:v5];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_uniquedRootUnitFromDefinition__lock);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HKBaseUnit;
  [(HKUnit *)&v3 encodeWithCoder:a3];
}

- (id)unitString
{
  return self->_unitString;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return [(NSString *)self->_unitString hash];
}

+ (id)_uniquedUnitWithPrefix:(id)a3 rootUnit:(id)a4
{
  return (id)[a1 _uniquedUnitWithPrefix:a3 conversionConstant:0 rootUnit:a4];
}

+ (id)_uniquedUnitWithPrefix:(id)a3 conversionConstant:(id)a4 rootUnit:(id)a5
{
  id v7 = a3;
  long long v8 = (__CFString *)a4;
  id v9 = a5;
  os_unfair_lock_lock((os_unfair_lock_t)&_uniquedUnitWithPrefix_conversionConstant_rootUnit__lock);
  long long v10 = [v9 unitString];
  uint64_t v11 = _unitStringForUnit(v7, v10, v8);

  long long v12 = [(id)_uniquedUnitWithPrefix_conversionConstant_rootUnit__units objectForKey:v11];
  if (!v12)
  {
    long long v12 = [v9 _unitByPrefixing:v7 withConversionConstant:v8];
    v12[72] = 1;
    v13 = (void *)_uniquedUnitWithPrefix_conversionConstant_rootUnit__units;
    if (!_uniquedUnitWithPrefix_conversionConstant_rootUnit__units)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v15 = (void *)_uniquedUnitWithPrefix_conversionConstant_rootUnit__units;
      _uniquedUnitWithPrefix_conversionConstant_rootUnit__units = (uint64_t)v14;

      v13 = (void *)_uniquedUnitWithPrefix_conversionConstant_rootUnit__units;
    }
    [v13 setObject:v12 forKeyedSubscript:v11];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_uniquedUnitWithPrefix_conversionConstant_rootUnit__lock);

  return v12;
}

- (HKBaseUnit)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKBaseUnit;
  v5 = [(HKUnit *)&v15 initWithCoder:v4];
  if (v5 && ([v4 containsValueForKey:@"HKUnitStringKey"] & 1) == 0)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BaseUnitStringKey"];
    unitString = v5->_unitString;
    v5->_unitString = (NSString *)v6;

    [v4 decodeDoubleForKey:@"BaseUnitProportionalSizeKey"];
    v5->_proportionalSize = v8;
    [v4 decodeDoubleForKey:@"BaseUnitScaleOffsetKey"];
    v5->super._scaleOffset = v9;
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BaseUnitPrefixKey"];
    prefix = v5->_prefix;
    v5->_prefix = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BaseUnitRootKey"];
    root = v5->_root;
    v5->_root = (NSString *)v12;

    v5->_uniqued = [v4 decodeBoolForKey:@"BaseUnitUniquedKey"];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_prefix, 0);

  objc_storeStrong((id *)&self->_unitString, 0);
}

- (id)awakeAfterUsingCoder:(id)a3
{
  char v4 = [a3 containsValueForKey:@"HKUnitStringKey"];
  v5 = self;
  uint64_t v6 = v5;
  id v7 = v5;
  if ((v4 & 1) == 0)
  {
    id v7 = v5;
    if (v5->_uniqued)
    {
      if (v5->_root)
      {
        double v8 = +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:");
        prefix = v6->_prefix;
        if (prefix)
        {
          uint64_t v10 = _Prefixes();
          uint64_t v11 = [v10 objectForKey:v6->_prefix];
          [v11 doubleValue];
          double v13 = v12;

          LOBYTE(prefix) = v6->_prefix != 0;
        }
        else
        {
          double v13 = 1.0;
        }
        double v14 = fabs(v6->_proportionalSize / v13 + -1.0);
        if ((prefix & 1) != 0 || v14 > 0.00000011920929)
        {
          if (v14 <= 0.00000011920929)
          {
            objc_super v15 = 0;
          }
          else
          {
            objc_super v15 = objc_msgSend(NSNumber, "numberWithDouble:");
          }
          id v7 = +[HKBaseUnit _uniquedUnitWithPrefix:v6->_prefix conversionConstant:v15 rootUnit:v8];
        }
        else
        {
          id v7 = v8;
          objc_super v15 = v6;
        }
      }
      else
      {
        id v7 = +[HKBaseUnit _uniquedRootUnit:v5->_unitString];
        double v8 = v6;
      }
    }
  }

  return v7;
}

+ (id)_rootUnitWithDefinition:(id *)a3
{
  char v4 = [NSString stringWithUTF8String:a3->var2];
  v5 = [NSString stringWithUTF8String:a3->var0];
  uint64_t v6 = (void *)[objc_alloc(NSClassFromString(v4)) _initWithUnitString:v5 proportionalSize:a3->var3 scaleOffset:a3->var4];

  return v6;
}

- (id)_initWithUnitString:(id)a3 proportionalSize:(double)a4 scaleOffset:(double)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKBaseUnit;
  double v9 = [(HKUnit *)&v13 _init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    uint64_t v11 = (void *)v9[6];
    v9[6] = v10;

    *((double *)v9 + 10) = a4;
    *((double *)v9 + 1) = a5;
  }

  return v9;
}

- (id)_unitByPrefixing:(id)a3 withConversionConstant:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  uint64_t v8 = [objc_alloc((Class)objc_opt_class()) _init];
  double v9 = _unitStringForUnit(v6, self->_unitString, v7);
  uint64_t v10 = [v9 copy];
  uint64_t v11 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = v10;

  if (v6)
  {
    double v12 = _Prefixes();
    objc_super v13 = [v12 objectForKey:v6];

    if (!v13) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Invalid unit prefix: %@", v6 format];
    }
  }
  else
  {
    objc_super v13 = &unk_1EECE4D18;
  }
  if (v7) {
    double v14 = v7;
  }
  else {
    double v14 = (__CFString *)&unk_1EECE4D18;
  }
  objc_super v15 = v14;

  [(__CFString *)v15 doubleValue];
  double v17 = v16;
  [v13 doubleValue];
  double v19 = v17 * v18;
  *(double *)(v8 + 80) = v19 * self->_proportionalSize;
  *(double *)(v8 + 8) = self->super._scaleOffset / v19;
  uint64_t v20 = [v6 copy];
  v21 = *(void **)(v8 + 56);
  *(void *)(v8 + 56) = v20;

  uint64_t v22 = [(NSString *)self->_unitString copy];
  v23 = *(void **)(v8 + 64);
  *(void *)(v8 + 64) = v22;

  return (id)v8;
}

- (id)_computeBaseUnitReductionAndProportionalSize:(double *)a3 withCycleSet:(id)a4
{
  id v6 = a4;
  double proportionalSize = self->_proportionalSize;
  uint64_t v8 = [(HKBaseUnit *)self dimension];
  if ([v6 containsObject:v8])
  {
    double v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3B8];
    uint64_t v11 = [v8 name];
    [v9 raise:v10, @"Illegal dimension dependency cycle involving %@", v11 format];
  }
  if (![v8 canBeReduced])
  {
    double v18 = [(HKBaseUnit *)self _baseUnits];
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  double v12 = [v8 reducibleBaseUnit];
  [v12 proportionalSize];
  double v14 = proportionalSize / v13;

  [v8 reductionCoefficient];
  double v16 = v14 * v15;
  [v6 addObject:v8];
  double v20 = 1.0;
  double v17 = [v8 reducedUnit];
  double v18 = [v17 _baseUnitReductionAndProportionalSize:&v20 withCycleSet:v6];

  double proportionalSize = v16 * v20;
  [v6 removeObject:v8];
  if (a3) {
LABEL_7:
  }
    *a3 = proportionalSize;
LABEL_8:

  return v18;
}

- (id)_baseUnits
{
  return +[_HKFactorization factorizationWithFactor:self exponent:1];
}

- (double)proportionalSize
{
  return self->_proportionalSize;
}

- (_HKBaseDimension)dimension
{
  v4.receiver = self;
  v4.super_class = (Class)HKBaseUnit;
  v2 = [(HKUnit *)&v4 dimension];

  return (_HKBaseDimension *)v2;
}

+ (id)unitFromString:(id)a3
{
  id v3 = a3;
  objc_super v4 = _HKBaseUnitGrammar();
  v5 = [v4 parseTreeForString:v3];

  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unable to parse base unit string: %@", v3 format];
  }
  id v6 = [v5 evaluate];

  return v6;
}

@end