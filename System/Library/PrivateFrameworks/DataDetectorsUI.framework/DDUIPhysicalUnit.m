@interface DDUIPhysicalUnit
+ (id)unitWithIdentifier:(id)a3;
- (BOOL)inputValueIsValid:(double)a3 fromUnit:(id)a4;
- (BOOL)isUKMeasurement;
- (BOOL)keepZeroValue;
- (DDUIPhysicalUnit)initWithName:(id)a3 abbreviation:(id)a4 restrictionLocales:(id)a5 groupType:(unint64_t)a6 a:(double)a7 b:(double)a8;
- (DDUIPhysicalUnitGroup)group;
- (NSArray)restrictionLocales;
- (NSString)abbreviation;
- (NSString)identifier;
- (NSString)name;
- (double)a;
- (double)b;
- (double)baseToUnit:(double)a3;
- (double)unitToBase:(double)a3;
- (double)valueFrom:(double)result unit:(id)a4;
- (id)floatFormatString:(id)a3 precision:(int64_t)a4 exp:(BOOL)a5;
- (id)localizedConvertedValueFormat:(id)a3;
- (id)localizedConvertedValueFrom:(double)a3 unit:(id)a4;
- (id)localizedMenuTitleFormat:(id)a3;
- (id)localizedUnitNameWithValue:(double)a3 unit:(id)a4;
- (id)patchedVariantName;
- (id)valueAsString:(double)a3;
- (unint64_t)groupType;
- (void)setGroup:(id)a3;
@end

@implementation DDUIPhysicalUnit

- (double)unitToBase:(double)a3
{
  if ([(NSString *)self->_name isEqualToString:@"Mile per gallon"]) {
    return 235.214583 / a3;
  }
  if ([(NSString *)self->_name isEqualToString:@"Percent grade"])
  {
    return atan(a3 / 100.0);
  }
  else
  {
    if ([(DDUIPhysicalUnit *)self isUKMeasurement])
    {
      v7 = [&unk_1EF511048 objectForKeyedSubscript:self->_name];
      if (v7)
      {
        v8 = v7;
        [v7 doubleValue];
        double v5 = v9 * a3;

        return v5;
      }
    }
    return self->_b + a3 * self->_a;
  }
}

- (BOOL)isUKMeasurement
{
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  v3 = [v2 objectForKey:*MEMORY[0x1E4F1C440]];
  char v4 = [v3 isEqual:@"U.K."];

  return v4;
}

- (unint64_t)groupType
{
  return self->_groupType;
}

- (NSArray)restrictionLocales
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

+ (id)unitWithIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    if (unitWithIdentifier__onceToken != -1) {
      dispatch_once(&unitWithIdentifier__onceToken, &__block_literal_global_5);
    }
    char v4 = (void *)unitWithIdentifier___supportedUnits;
    double v5 = [v3 lowercaseString];
    v6 = [v4 objectForKeyedSubscript:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)valueFrom:(double)result unit:(id)a4
{
  if (a4 != self)
  {
    [a4 unitToBase:result];
    -[DDUIPhysicalUnit baseToUnit:](self, "baseToUnit:");
  }
  return result;
}

- (BOOL)keepZeroValue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_group);
  uint64_t v4 = [WeakRetained name];
  char v5 = [v4 isEqualToString:@"Angle"];

  return (v5 & 1) != 0 || self->_b != 0.0;
}

- (BOOL)inputValueIsValid:(double)a3 fromUnit:(id)a4
{
  id v6 = a4;
  v7 = v6;
  BOOL v8 = 0;
  if (fabs(a3) != INFINITY)
  {
    [v6 unitToBase:a3];
    double v10 = v9;
    BOOL v8 = 0;
    if (fabs(v9) != INFINITY)
    {
      if ([(NSString *)self->_identifier isEqualToString:@"percent grade"]) {
        BOOL v8 = v10 <= 0.785398163 && v10 >= 0.0;
      }
      else {
        BOOL v8 = 1;
      }
    }
  }

  return v8;
}

- (double)baseToUnit:(double)a3
{
  if ([(NSString *)self->_name isEqualToString:@"Mile per gallon"]) {
    return 235.214583 / a3;
  }
  if ([(NSString *)self->_name isEqualToString:@"Percent grade"]) {
    return fabs(tan(fabs(a3))) * 100.0;
  }
  if (![(DDUIPhysicalUnit *)self isUKMeasurement]) {
    return (a3 - self->_b) / self->_a;
  }
  id v6 = [&unk_1EF511048 objectForKeyedSubscript:self->_name];
  if (!v6) {
    return (a3 - self->_b) / self->_a;
  }
  v7 = v6;
  [v6 doubleValue];
  double v5 = a3 / v8;

  return v5;
}

- (DDUIPhysicalUnitGroup)group
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_group);
  return (DDUIPhysicalUnitGroup *)WeakRetained;
}

uint64_t __39__DDUIPhysicalUnit_unitWithIdentifier___block_invoke()
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)unitWithIdentifier___supportedUnits;
  unitWithIdentifier___supportedUnits = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = (void *)unitWithIdentifier___supportedGroups;
  unitWithIdentifier___supportedGroups = (uint64_t)v2;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t result = [&unk_1EF510C08 countByEnumeratingWithState:&v44 objects:v49 count:16];
  uint64_t v32 = result;
  if (result)
  {
    uint64_t v31 = *(void *)v45;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(&unk_1EF510C08);
        }
        id v6 = *(void **)(*((void *)&v44 + 1) + 8 * v5);
        id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        v33 = v6;
        id obj = [v6 objectAtIndexedSubscript:3];
        uint64_t v39 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
        uint64_t v34 = v5;
        if (v39)
        {
          uint64_t v37 = *(void *)v41;
          do
          {
            uint64_t v7 = 0;
            do
            {
              if (*(void *)v41 != v37) {
                objc_enumerationMutation(obj);
              }
              double v8 = *(void **)(*((void *)&v40 + 1) + 8 * v7);
              double v9 = [DDUIPhysicalUnit alloc];
              double v10 = [v8 objectAtIndexedSubscript:0];
              v11 = [v8 objectAtIndexedSubscript:1];
              v12 = [v8 objectAtIndexedSubscript:2];
              unint64_t v13 = [v8 count];
              uint64_t v14 = 1;
              if (v13 >= 6)
              {
                v36 = [v8 objectAtIndexedSubscript:5];
                uint64_t v14 = [v36 unsignedIntegerValue];
              }
              v15 = [v8 objectAtIndexedSubscript:3];
              [v15 doubleValue];
              double v17 = v16;
              v18 = [v8 objectAtIndexedSubscript:4];
              [v18 doubleValue];
              v20 = [(DDUIPhysicalUnit *)v9 initWithName:v10 abbreviation:v11 restrictionLocales:v12 groupType:v14 a:v17 b:v19];

              if (v13 >= 6) {
              [v38 addObject:v20];
              }
              v21 = (void *)unitWithIdentifier___supportedUnits;
              v22 = [(DDUIPhysicalUnit *)v20 identifier];
              [v21 setObject:v20 forKeyedSubscript:v22];

              ++v7;
            }
            while (v39 != v7);
            uint64_t v39 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
          }
          while (v39);
        }

        v23 = [DDUIPhysicalUnitGroup alloc];
        v24 = [v33 objectAtIndexedSubscript:0];
        v25 = [v33 objectAtIndexedSubscript:1];
        uint64_t v26 = [v25 BOOLValue];
        v27 = [v33 objectAtIndexedSubscript:2];
        v28 = [(DDUIPhysicalUnitGroup *)v23 initWithName:v24 units:v38 restricted:v26 symbol:v27];

        v29 = (void *)unitWithIdentifier___supportedGroups;
        v30 = [(DDUIPhysicalUnitGroup *)v28 name];
        [v29 setObject:v28 forKeyedSubscript:v30];

        uint64_t v5 = v34 + 1;
      }
      while (v34 + 1 != v32);
      uint64_t result = [&unk_1EF510C08 countByEnumeratingWithState:&v44 objects:v49 count:16];
      uint64_t v32 = result;
    }
    while (result);
  }
  return result;
}

- (DDUIPhysicalUnit)initWithName:(id)a3 abbreviation:(id)a4 restrictionLocales:(id)a5 groupType:(unint64_t)a6 a:(double)a7 b:(double)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v23.receiver = self;
  v23.super_class = (Class)DDUIPhysicalUnit;
  v18 = [(DDUIPhysicalUnit *)&v23 init];
  if (v18)
  {
    uint64_t v19 = [v15 lowercaseString];
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v19;

    objc_storeStrong((id *)&v18->_name, a3);
    v18->_a = a7;
    v18->_b = a8;
    objc_storeStrong((id *)&v18->_restrictionLocales, a5);
    if (v16) {
      v21 = v16;
    }
    else {
      v21 = v15;
    }
    objc_storeStrong((id *)&v18->_abbreviation, v21);
    v18->_groupType = a6;
  }

  return v18;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGroup:(id)a3
{
}

- (id)patchedVariantName
{
  if ([(DDUIPhysicalUnit *)self isUKMeasurement]
    && ([&unk_1EF511048 objectForKeyedSubscript:self->_name],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    uint64_t v4 = [(NSString *)self->_name stringByAppendingString:@" (Imperial)"];
  }
  else
  {
    uint64_t v4 = self->_name;
  }
  return v4;
}

- (id)localizedUnitNameWithValue:(double)a3 unit:(id)a4
{
  uint64_t v5 = NSString;
  id v6 = [(DDUIPhysicalUnit *)self localizedTitleFormat:@"x", a3];
  uint64_t v7 = [(DDUIPhysicalUnit *)self patchedVariantName];
  double v8 = DDLocalizedStringFromTable(v6, (uint64_t)&stru_1EF5023D8, v7, @"Conversion");
  double v9 = [v5 stringWithFormat:v8];

  return v9;
}

- (id)localizedConvertedValueFormat:(id)a3
{
  return (id)[NSString stringWithFormat:@"%%f%%@ %@", self->_identifier];
}

- (id)localizedMenuTitleFormat:(id)a3
{
  BOOL v4 = [(NSString *)self->_identifier isEqualToString:@"degree"];
  uint64_t v5 = NSString;
  if (v4)
  {
    id v6 = [NSString stringWithFormat:@"Convert Angle"];
  }
  else
  {
    uint64_t v7 = [(DDUIPhysicalUnit *)self patchedVariantName];
    id v6 = [v5 stringWithFormat:@"Convert %@", v7];
  }
  return v6;
}

- (id)floatFormatString:(id)a3 precision:(int64_t)a4 exp:(BOOL)a5
{
  if (a5) {
    uint64_t v5 = @"%%.%lde";
  }
  else {
    uint64_t v5 = @"%%.%ldf";
  }
  id v6 = objc_msgSend(NSString, "stringWithFormat:", v5, a4);
  return v6;
}

- (id)valueAsString:(double)a3
{
  double v5 = fabs(a3);
  if (v5 < 1.0e-15 || v5 >= 0.1)
  {
    float64x2_t v14 = vdivq_f64(vrndaq_f64(vmulq_n_f64((float64x2_t)xmmword_1A175CCE0, v5)), (float64x2_t)xmmword_1A175CCE0);
    double v15 = round(v5);
    uint64_t v16 = 2;
    if (v14.f64[0] == v14.f64[1]) {
      uint64_t v16 = 1;
    }
    if (v15 == v14.f64[1] || v15 > 9999.0 || a3 == 0.0) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v16;
    }
    goto LABEL_27;
  }
  double v25 = v5;
  double v6 = fabs(floor(log10(a3)));
  double v7 = v25 * __exp10(v6);
  float64x2_t v8 = vdivq_f64(vrndaq_f64(vmulq_n_f64((float64x2_t)xmmword_1A175CCE0, v7)), (float64x2_t)xmmword_1A175CCE0);
  double v9 = round(v7);
  uint64_t v10 = 2;
  if (v8.f64[0] == v8.f64[1]) {
    uint64_t v10 = 1;
  }
  if (v9 == v8.f64[1] || v9 > 9999.0 || v7 == 0.0) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v10;
  }
  if (v6 <= 6.0)
  {
    v13 += (uint64_t)v6;
LABEL_27:
    uint64_t v19 = NSString;
    v20 = self;
    uint64_t v21 = 0;
    goto LABEL_29;
  }
  uint64_t v19 = NSString;
  v20 = self;
  uint64_t v21 = 1;
LABEL_29:
  v22 = [(DDUIPhysicalUnit *)v20 floatFormatString:@"%f" precision:v13 exp:v21];
  objc_super v23 = objc_msgSend(v19, "localizedStringWithFormat:", v22, *(void *)&a3);

  return v23;
}

- (id)localizedConvertedValueFrom:(double)a3 unit:(id)a4
{
  [(DDUIPhysicalUnit *)self valueFrom:a4 unit:a3];
  double v6 = v5;
  double v7 = fabs(v5);
  if (v7 < INFINITY || v7 > INFINITY)
  {
    BOOL v9 = [(NSString *)self->_name isEqualToString:@"Foot"];
    BOOL v10 = v6 <= 0.0 || !v9;
    if (v10 || (v18 = floor(v6), double v19 = round((v6 - v18) * 1200.0) / 100.0, v19 >= 12.0) || v18 <= 0.0 || v19 == 0.0)
    {
      v11 = NSString;
      v12 = [(DDUIPhysicalUnit *)self localizedConvertedValueFormat:@"%f%@"];
      uint64_t v13 = [NSString stringWithFormat:@"%%2$@ %@", self->_abbreviation];
      float64x2_t v14 = DDLocalizedStringFromTable(v12, (uint64_t)&stru_1EF5023D8, v13, @"Conversion");
      float v15 = v6;
      double v16 = v15;
      id v17 = [(DDUIPhysicalUnit *)self valueAsString:v6];
      float64x2_t v8 = objc_msgSend(v11, "stringWithFormat:", v14, *(void *)&v16, v17);
    }
    else
    {
      v20 = NSString;
      uint64_t v21 = DDLocalizedStringFromTable(@"%@ ft %@ in", @"Feet and inches conversions", @"%@ ft %@ in", @"Conversion");
      v22 = [(DDUIPhysicalUnit *)self valueAsString:v18];
      objc_super v23 = [(DDUIPhysicalUnit *)self valueAsString:v19];
      float64x2_t v8 = objc_msgSend(v20, "stringWithFormat:", v21, v22, v23);
    }
  }
  else
  {
    float64x2_t v8 = DDLocalizedStringFromTable(@"Cannot Convert Value", @"Generic value conversion action menu title", @"Cannot Convert Value", @"Conversion");
  }
  return v8;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)abbreviation
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (double)a
{
  return self->_a;
}

- (double)b
{
  return self->_b;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_group);
  objc_storeStrong((id *)&self->_restrictionLocales, 0);
  objc_storeStrong((id *)&self->_abbreviation, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end