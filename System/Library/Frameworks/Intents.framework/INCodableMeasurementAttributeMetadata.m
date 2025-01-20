@interface INCodableMeasurementAttributeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)supportsNegativeNumbers;
- (Class)_unitClass;
- (INCodableMeasurementAttributeMetadata)initWithCoder:(id)a3;
- (NSOrderedSet)defaultUnits;
- (NSUnit)unit;
- (double)defaultValue;
- (id)__INCodableDescriptionDefaultUnitKey;
- (id)__INCodableDescriptionDefaultValueKey;
- (id)__INCodableDescriptionSupportsNegativeNumbersKey;
- (id)__INCodableDescriptionUnitKey;
- (id)__INIntentResponseCodableDescriptionDefaultUnitKey;
- (id)__INIntentResponseCodableDescriptionDefaultValueKey;
- (id)__INIntentResponseCodableDescriptionSupportsNegativeNumbersKey;
- (id)__INIntentResponseCodableDescriptionUnitKey;
- (id)__INTypeCodableDescriptionDefaultUnitKey;
- (id)__INTypeCodableDescriptionDefaultValueKey;
- (id)__INTypeCodableDescriptionSupportsNegativeNumbersKey;
- (id)__INTypeCodableDescriptionUnitKey;
- (id)_defaultUnitWithNames:(id)a3;
- (id)_unitWithUnitName:(id)a3;
- (id)defaultValueForIntentDefaultValueProvider;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultUnits:(id)a3;
- (void)setDefaultValue:(double)a3;
- (void)setSupportsNegativeNumbers:(BOOL)a3;
- (void)setUnit:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableMeasurementAttributeMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultUnits, 0);

  objc_storeStrong((id *)&self->_unit, 0);
}

- (void)setSupportsNegativeNumbers:(BOOL)a3
{
  self->_supportsNegativeNumbers = a3;
}

- (BOOL)supportsNegativeNumbers
{
  return self->_supportsNegativeNumbers;
}

- (void)setDefaultValue:(double)a3
{
  self->_defaultValue = a3;
}

- (double)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultUnits:(id)a3
{
}

- (NSOrderedSet)defaultUnits
{
  return self->_defaultUnits;
}

- (void)setUnit:(id)a3
{
}

- (NSUnit)unit
{
  return self->_unit;
}

- (INCodableMeasurementAttributeMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INCodableMeasurementAttributeMetadata;
  v5 = [(INCodableAttributeMetadata *)&v12 initWithCoder:v4];
  if (v5)
  {
    -[INCodableMeasurementAttributeMetadata setSupportsNegativeNumbers:](v5, "setSupportsNegativeNumbers:", [v4 decodeBoolForKey:@"supportsNegativeNumbers"]);
    [v4 decodeDoubleForKey:@"defaultValue"];
    -[INCodableMeasurementAttributeMetadata setDefaultValue:](v5, "setDefaultValue:");
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unit"];
    [(INCodableMeasurementAttributeMetadata *)v5 setUnit:v6];

    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"defaultUnits"];
    [(INCodableMeasurementAttributeMetadata *)v5 setDefaultUnits:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCodableMeasurementAttributeMetadata;
  id v4 = a3;
  [(INCodableAttributeMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsNegativeNumbers, @"supportsNegativeNumbers", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"defaultValue" forKey:self->_defaultValue];
  [v4 encodeObject:self->_unit forKey:@"unit"];
  [v4 encodeObject:self->_defaultUnits forKey:@"defaultUnits"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v18.receiver = self;
  v18.super_class = (Class)INCodableMeasurementAttributeMetadata;
  id v19 = 0;
  v6 = [(INCodableAttributeMetadata *)&v18 widgetPlistableRepresentationWithParameters:a3 error:&v19];
  id v7 = v19;
  uint64_t v8 = v7;
  if (v7)
  {
    v9 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    objc_msgSend(v6, "intents_setBoolIfTrue:forKey:", self->_supportsNegativeNumbers, @"supportsNegativeNumbers");
    v10 = [NSNumber numberWithDouble:self->_defaultValue];
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", v10, @"defaultValue");

    v11 = [(INCodableMeasurementAttributeMetadata *)self unit];
    uint64_t v12 = objc_msgSend(v11, "_intents_stringRepresentation");
    v13 = (void *)v12;
    if (v12) {
      v14 = (__CFString *)v12;
    }
    else {
      v14 = @"Any";
    }
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", v14, @"unit");

    v15 = [(NSOrderedSet *)self->_defaultUnits if_map:&__block_literal_global_93];
    v16 = [v15 array];

    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", v16, @"defaultUnits");
    v9 = (void *)[v6 copy];
  }

  return v9;
}

__CFString *__91__INCodableMeasurementAttributeMetadata_widgetPlistableRepresentationWithParameters_error___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_intents_stringRepresentation");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2) {
    v2 = @"Any";
  }
  id v4 = v2;

  return v4;
}

- (id)_defaultUnitWithNames:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[INCodableMeasurementAttributeMetadata _unitWithUnitName:](self, "_unitWithUnitName:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    uint64_t v12 = (void *)[v5 copy];
  }
  else {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)_unitWithUnitName:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4 && ([v4 isEqualToString:@"Any"] & 1) == 0)
  {
    id v6 = [(INCodableMeasurementAttributeMetadata *)self _unitClass];
    objc_msgSend(v5, "if_stringByLowercasingFirstCharacter");
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v7;
    if (v6)
    {
      NSSelectorFromString(v7);
      if (objc_opt_respondsToSelector())
      {
        id v6 = [(objc_class *)v6 valueForKey:v8];
      }
      else
      {
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (Class)_unitClass
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  objc_super v5 = [(INCodableAttributeMetadata *)self name];
  id v6 = [v4 stringByAppendingString:v5];
  uint64_t v7 = NSClassFromString(v6);

  return (Class)v7;
}

- (id)defaultValueForIntentDefaultValueProvider
{
  v3 = [(INCodableMeasurementAttributeMetadata *)self unit];
  if (v3
    || ([(INCodableMeasurementAttributeMetadata *)self defaultUnits],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 firstObject],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3))
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28E28]);
    [(INCodableMeasurementAttributeMetadata *)self defaultValue];
    id v6 = objc_msgSend(v5, "initWithDoubleValue:unit:", v3);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)INCodableMeasurementAttributeMetadata;
  v21 = [(INCodableAttributeMetadata *)&v27 dictionaryRepresentationWithLocalizer:a3];
  v26 = [(INCodableMeasurementAttributeMetadata *)self __INCodableDescriptionUnitKey];
  v28[0] = v26;
  v25 = [(INCodableMeasurementAttributeMetadata *)self unit];
  uint64_t v4 = objc_msgSend(v25, "_intents_stringRepresentation");
  id v5 = @"Any";
  v20 = (void *)v4;
  if (v4) {
    id v5 = (__CFString *)v4;
  }
  v29[0] = v5;
  v24 = [(INCodableMeasurementAttributeMetadata *)self __INCodableDescriptionDefaultUnitKey];
  v28[1] = v24;
  v23 = [(NSOrderedSet *)self->_defaultUnits array];
  v22 = objc_msgSend(v23, "if_map:", &__block_literal_global_77286);
  uint64_t v6 = [v22 componentsJoinedByString:@"/"];
  uint64_t v7 = (void *)v6;
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[1] = v6;
  uint64_t v8 = [(INCodableMeasurementAttributeMetadata *)self __INCodableDescriptionSupportsNegativeNumbersKey];
  v28[2] = v8;
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[INCodableMeasurementAttributeMetadata supportsNegativeNumbers](self, "supportsNegativeNumbers"));
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[2] = v10;
  v11 = [(INCodableMeasurementAttributeMetadata *)self __INCodableDescriptionDefaultValueKey];
  v28[3] = v11;
  uint64_t v12 = NSNumber;
  [(INCodableMeasurementAttributeMetadata *)self defaultValue];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  long long v14 = v13;
  if (!v13)
  {
    long long v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[3] = v14;
  long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
  long long v16 = objc_msgSend(v21, "if_dictionaryByAddingEntriesFromDictionary:", v15);

  if (!v13) {
  if (!v9)
  }

  if (!v7) {
  long long v17 = objc_msgSend(v16, "if_dictionaryWithNonEmptyValues");
  }

  return v17;
}

uint64_t __79__INCodableMeasurementAttributeMetadata_dictionaryRepresentationWithLocalizer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_intents_stringRepresentation");
}

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)INCodableMeasurementAttributeMetadata;
  [(INCodableAttributeMetadata *)&v29 updateWithDictionary:v4];
  id v5 = [(INCodableMeasurementAttributeMetadata *)self __INCodableDescriptionUnitKey];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [(INCodableMeasurementAttributeMetadata *)self _unitWithUnitName:v8];

  unit = self->_unit;
  self->_unit = v9;

  if (!self->_unit)
  {
    v11 = [(INCodableMeasurementAttributeMetadata *)self __INCodableDescriptionDefaultUnitKey];
    uint64_t v12 = [v4 objectForKeyedSubscript:v11];

    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
    id v14 = v13;

    long long v15 = [v14 componentsSeparatedByString:@"/"];

    long long v16 = [(INCodableMeasurementAttributeMetadata *)self _defaultUnitWithNames:v15];
    defaultUnits = self->_defaultUnits;
    self->_defaultUnits = v16;
  }
  objc_super v18 = [(INCodableMeasurementAttributeMetadata *)self __INCodableDescriptionSupportsNegativeNumbersKey];
  uint64_t v19 = [v4 objectForKeyedSubscript:v18];

  if (v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }
  id v21 = v20;

  char v22 = [v21 BOOLValue];
  self->_supportsNegativeNumbers = v22;
  v23 = [(INCodableMeasurementAttributeMetadata *)self __INCodableDescriptionDefaultValueKey];
  v24 = [v4 objectForKeyedSubscript:v23];

  if (v24)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v25 = v24;
    }
    else {
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
  }
  id v26 = v25;

  [v26 doubleValue];
  double v28 = v27;

  self->_defaultValue = v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v23.receiver = a1;
  v23.super_class = (Class)&OBJC_METACLASS___INCodableMeasurementAttributeMetadata;
  id v24 = 0;
  uint64_t v7 = objc_msgSendSuper2(&v23, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v24);
  id v8 = v24;
  if (v8)
  {
    id v9 = v8;
    if (a4)
    {
      id v9 = v8;
      id v10 = 0;
      *a4 = v9;
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v7, "setSupportsNegativeNumbers:", objc_msgSend(v6, "intents_BOOLForKey:", @"supportsNegativeNumbers"));
    objc_msgSend(v6, "intents_doubleForKey:", @"defaultValue");
    objc_msgSend(v7, "setDefaultValue:");
    v11 = objc_msgSend(v6, "intents_stringForKey:", @"unit");
    if (v11
      || ([NSString stringWithFormat:@"Unable to decode measurement unit: %@", 0],
          v20 = objc_claimAutoreleasedReturnValue(),
          INIntentError(8001, v20, 0),
          id v9 = (id)objc_claimAutoreleasedReturnValue(),
          v20,
          !v9))
    {
      uint64_t v12 = [v7 _unitWithUnitName:v11];
      [v7 setUnit:v12];

      v13 = objc_msgSend(v6, "intents_safeObjectForKey:ofType:", @"defaultUnits", objc_opt_class());
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __85__INCodableMeasurementAttributeMetadata_makeFromWidgetPlistableRepresentation_error___block_invoke;
      v21[3] = &unk_1E551B8D8;
      id v14 = v7;
      id v22 = v14;
      long long v15 = objc_msgSend(v13, "if_compactMap:", v21);
      uint64_t v16 = [v15 count];
      if (v16 == [v13 count]
        || ([NSString stringWithFormat:@"Unable to decode measurement units: %@", v13],
            long long v17 = objc_claimAutoreleasedReturnValue(),
            INIntentError(8001, v17, 0),
            id v9 = (id)objc_claimAutoreleasedReturnValue(),
            v17,
            !v9))
      {
        objc_super v18 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v15];
        [v14 setDefaultUnits:v18];

        id v10 = v14;
        id v9 = 0;
      }
      else if (a4)
      {
        id v9 = v9;
        id v10 = 0;
        *a4 = v9;
      }
      else
      {
        id v10 = 0;
      }
    }
    else if (a4)
    {
      id v9 = v9;
      id v10 = 0;
      *a4 = v9;
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

id __85__INCodableMeasurementAttributeMetadata_makeFromWidgetPlistableRepresentation_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [*(id *)(a1 + 32) _unitWithUnitName:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)__INTypeCodableDescriptionUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataUnitKey");

  return v3;
}

- (id)__INTypeCodableDescriptionSupportsNegativeNumbersKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataSupportsNegativeNumbersKey");

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataDefaultUnitKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataUnitKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionSupportsNegativeNumbersKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataSupportsNegativeNumbersKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataDefaultUnitKey");

  return v3;
}

- (id)__INCodableDescriptionUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataUnitKey");

  return v3;
}

- (id)__INCodableDescriptionSupportsNegativeNumbersKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataSupportsNegativeNumbersKey");

  return v3;
}

- (id)__INCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INCodableDescriptionDefaultUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataDefaultUnitKey");

  return v3;
}

@end