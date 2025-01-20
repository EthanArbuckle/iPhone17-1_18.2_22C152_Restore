@interface HFColorCollection
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFColorCollection)init;
- (HFColorCollection)initWithPrimitiveColor:(id)a3;
- (HFColorCollection)initWithPrimitiveColors:(id)a3;
- (HFColorPrimitive)preferredColorPrimitive;
- (HFRGBColor)RGBColor;
- (HFTemperatureColor)temperatureColor;
- (NSString)description;
- (id)colorByAdjustingForProfile:(id)a3;
- (id)colorPrimitives;
- (unint64_t)hash;
@end

@implementation HFColorCollection

- (HFColorCollection)initWithPrimitiveColors:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![v5 count])
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HFColorCollection.m", 59, @"Invalid parameter not satisfying: %@", @"primitiveColors.count > 0" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)HFColorCollection;
  v6 = [(HFColorCollection *)&v22 init];
  v7 = v6;
  if (v6)
  {
    v17 = v6;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (!v9) {
      goto LABEL_20;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v17->_RGBColor)
          {
            NSLog(&cfstr_FoundMultipleR.isa, v8);
            continue;
          }
          p_RGBColor = (id *)&v17->_RGBColor;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          if (v17->_temperatureColor)
          {
            NSLog(&cfstr_FoundMultipleT.isa, v8);
            continue;
          }
          p_RGBColor = (id *)&v17->_temperatureColor;
        }
        objc_storeStrong(p_RGBColor, v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (!v10)
      {
LABEL_20:

        v7 = v17;
        break;
      }
    }
  }

  return v7;
}

- (HFRGBColor)RGBColor
{
  v3 = self->_RGBColor;
  if (!v3)
  {
    v4 = [(HFColorCollection *)self temperatureColor];
    objc_msgSend(v4, "hf_RGBColorRepresentation");
    v3 = (HFRGBColor *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (HFTemperatureColor)temperatureColor
{
  v3 = self->_temperatureColor;
  if (!v3)
  {
    v4 = [(HFColorCollection *)self RGBColor];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      v6 = [(HFColorCollection *)self RGBColor];
      objc_msgSend(v6, "hf_temperatureColorRepresentation");
      v3 = (HFTemperatureColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)colorPrimitives
{
  v3 = [MEMORY[0x263EFF9C0] set];
  objc_msgSend(v3, "na_safeAddObject:", self->_RGBColor);
  objc_msgSend(v3, "na_safeAddObject:", self->_temperatureColor);
  return v3;
}

- (HFColorPrimitive)preferredColorPrimitive
{
  temperatureColor = self->_temperatureColor;
  if (!temperatureColor) {
    temperatureColor = self->_RGBColor;
  }
  return (HFColorPrimitive *)temperatureColor;
}

- (HFColorCollection)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  char v5 = NSStringFromSelector(sel_initWithPrimitiveColors_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFColorCollection.m", 49, @"%s is unavailable; use %@ instead",
    "-[HFColorCollection init]",
    v5);

  return 0;
}

- (HFColorCollection)initWithPrimitiveColor:(id)a3
{
  v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  char v5 = [(HFColorCollection *)self initWithPrimitiveColors:v4];

  return v5;
}

- (id)colorByAdjustingForProfile:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(HFColorCollection *)self colorPrimitives];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__HFColorCollection_colorByAdjustingForProfile___block_invoke;
  v11[3] = &unk_26408D670;
  id v12 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_map:", v11);
  uint64_t v9 = (void *)[v5 initWithPrimitiveColors:v8];

  return v9;
}

uint64_t __48__HFColorCollection_colorByAdjustingForProfile___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) adjustedColorPrimitiveForPrimitive:a2];
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_211 != -1) {
    dispatch_once(&_MergedGlobals_211, &__block_literal_global_28);
  }
  v2 = (void *)qword_26AB2EC18;
  return (NAIdentity *)v2;
}

void __32__HFColorCollection_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_35];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_37_0];
  uint64_t v3 = [v0 build];

  id v4 = (void *)qword_26AB2EC18;
  qword_26AB2EC18 = v3;
}

uint64_t __32__HFColorCollection_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 RGBColor];
}

uint64_t __32__HFColorCollection_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 temperatureColor];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x263F58188] builderWithObject:self];
  unint64_t v4 = [(HFColorCollection *)self RGBColor];
  id v5 = (id)[v3 appendObject:v4 withName:@"RGBColor"];

  v6 = [(HFColorCollection *)self temperatureColor];
  id v7 = (id)[v3 appendObject:v6 withName:@"temperatureColor"];

  id v8 = [v3 build];

  return (NSString *)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temperatureColor, 0);
  objc_storeStrong((id *)&self->_RGBColor, 0);
}

@end