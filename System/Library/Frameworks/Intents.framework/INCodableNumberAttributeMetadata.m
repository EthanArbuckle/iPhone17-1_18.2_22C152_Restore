@interface INCodableNumberAttributeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)supportsNegativeNumbers;
- (INCodableNumberAttributeMetadata)initWithCoder:(id)a3;
- (NSNumber)defaultValue;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (id)__INCodableDescriptionDefaultValueKey;
- (id)__INCodableDescriptionMaximumValueKey;
- (id)__INCodableDescriptionMinimumValueKey;
- (id)__INCodableDescriptionSupportsNegativeNumbersKey;
- (id)__INCodableDescriptionTypeKey;
- (id)__INIntentResponseCodableDescriptionDefaultValueKey;
- (id)__INIntentResponseCodableDescriptionMaximumValueKey;
- (id)__INIntentResponseCodableDescriptionMinimumValueKey;
- (id)__INIntentResponseCodableDescriptionSupportsNegativeNumbersKey;
- (id)__INIntentResponseCodableDescriptionTypeKey;
- (id)__INTypeCodableDescriptionDefaultValueKey;
- (id)__INTypeCodableDescriptionMaximumValueKey;
- (id)__INTypeCodableDescriptionMinimumValueKey;
- (id)__INTypeCodableDescriptionSupportsNegativeNumbersKey;
- (id)__INTypeCodableDescriptionTypeKey;
- (id)_localizedDialogTokensWithLocalizer:(id)a3;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setMaximumValue:(id)a3;
- (void)setMinimumValue:(id)a3;
- (void)setType:(int64_t)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableNumberAttributeMetadata

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)INCodableNumberAttributeMetadata;
  [(INCodableAttributeMetadata *)&v33 updateWithDictionary:v4];
  v5 = [(INCodableNumberAttributeMetadata *)self __INCodableDescriptionTypeKey];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  int64_t v9 = INCodableAttributeMetadataInputTypeWithString(v8);
  self->_type = v9;
  v10 = [(INCodableNumberAttributeMetadata *)self __INCodableDescriptionDefaultValueKey];
  v11 = [v4 objectForKeyedSubscript:v10];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  defaultValue = self->_defaultValue;
  self->_defaultValue = v13;

  v15 = [(INCodableNumberAttributeMetadata *)self __INCodableDescriptionMinimumValueKey];
  v16 = [v4 objectForKeyedSubscript:v15];

  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (![v16 length])
    {
      v17 = 0;
      goto LABEL_25;
    }
  }
  else
  {

    v16 = 0;
  }
  v18 = [(INCodableNumberAttributeMetadata *)self __INCodableDescriptionMinimumValueKey];
  v19 = [v4 objectForKeyedSubscript:v18];

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

  if (v21) {
    v22 = v21;
  }
  else {
    v22 = &unk_1EDBA7768;
  }
  v17 = v22;

LABEL_25:
  minimumValue = self->_minimumValue;
  self->_minimumValue = v17;

  v24 = [(INCodableNumberAttributeMetadata *)self __INCodableDescriptionMaximumValueKey];
  v25 = [v4 objectForKeyedSubscript:v24];

  if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (![v25 length])
    {
      v26 = 0;
      goto LABEL_39;
    }
  }
  else
  {

    v25 = 0;
  }
  v27 = [(INCodableNumberAttributeMetadata *)self __INCodableDescriptionMaximumValueKey];
  v28 = [v4 objectForKeyedSubscript:v27];

  if (v28)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v29 = v28;
    }
    else {
      v29 = 0;
    }
  }
  else
  {
    v29 = 0;
  }
  id v30 = v29;

  if (v30) {
    v31 = v30;
  }
  else {
    v31 = &unk_1EDBA7768;
  }
  v26 = v31;

LABEL_39:
  maximumValue = self->_maximumValue;
  self->_maximumValue = v26;
}

- (id)__INCodableDescriptionMinimumValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataMinimumValueKey");

  return v3;
}

- (id)__INCodableDescriptionMaximumValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataMaximumValueKey");

  return v3;
}

- (id)__INCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataTypeKey");

  return v3;
}

- (id)__INCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataDefaultValueKey");

  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);

  objc_storeStrong((id *)&self->_defaultValue, 0);
}

- (void)setMaximumValue:(id)a3
{
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (void)setMinimumValue:(id)a3
{
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (void)setDefaultValue:(id)a3
{
}

- (NSNumber)defaultValue
{
  return self->_defaultValue;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (INCodableNumberAttributeMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INCodableNumberAttributeMetadata;
  v5 = [(INCodableAttributeMetadata *)&v13 initWithCoder:v4];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultValue"];
    defaultValue = v5->_defaultValue;
    v5->_defaultValue = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumValue"];
    minimumValue = v5->_minimumValue;
    v5->_minimumValue = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumValue"];
    maximumValue = v5->_maximumValue;
    v5->_maximumValue = (NSNumber *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCodableNumberAttributeMetadata;
  id v4 = a3;
  [(INCodableAttributeMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_defaultValue forKey:@"defaultValue"];
  [v4 encodeObject:self->_minimumValue forKey:@"minimumValue"];
  [v4 encodeObject:self->_maximumValue forKey:@"maximumValue"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)INCodableNumberAttributeMetadata;
  id v12 = 0;
  uint64_t v6 = [(INCodableAttributeMetadata *)&v11 widgetPlistableRepresentationWithParameters:a3 error:&v12];
  id v7 = v12;
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_type, @"type");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_defaultValue, @"defaultValue");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_minimumValue, @"minimumValue");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_maximumValue, @"maximumValue");
    id v9 = v6;
  }

  return v9;
}

- (id)_localizedDialogTokensWithLocalizer:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = @"minimumValue";
  id v4 = [(INCodableNumberAttributeMetadata *)self minimumValue];
  uint64_t v5 = [v4 stringValue];
  uint64_t v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = &stru_1EDA6DB28;
  }
  v14[1] = @"maximumValue";
  v15[0] = v7;
  uint64_t v8 = [(INCodableNumberAttributeMetadata *)self maximumValue];
  uint64_t v9 = [v8 stringValue];
  uint64_t v10 = (void *)v9;
  if (v9) {
    objc_super v11 = (__CFString *)v9;
  }
  else {
    objc_super v11 = &stru_1EDA6DB28;
  }
  v15[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v12;
}

- (BOOL)supportsNegativeNumbers
{
  minimumValue = self->_minimumValue;
  if (!minimumValue) {
    return 1;
  }
  [(NSNumber *)minimumValue doubleValue];
  return v3 < 0.0;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v29[5] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)INCodableNumberAttributeMetadata;
  v23 = [(INCodableAttributeMetadata *)&v27 dictionaryRepresentationWithLocalizer:a3];
  v26 = [(INCodableNumberAttributeMetadata *)self __INCodableDescriptionTypeKey];
  v28[0] = v26;
  int64_t v4 = [(INCodableNumberAttributeMetadata *)self type];
  uint64_t v5 = @"Field";
  if (v4 == 1) {
    uint64_t v5 = @"Stepper";
  }
  if (v4 == 2) {
    uint64_t v5 = @"Slider";
  }
  v25 = v5;
  v29[0] = v25;
  v24 = [(INCodableNumberAttributeMetadata *)self __INCodableDescriptionSupportsNegativeNumbersKey];
  v28[1] = v24;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[INCodableNumberAttributeMetadata supportsNegativeNumbers](self, "supportsNegativeNumbers"));
  id v7 = (void *)v6;
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v6;
  v29[1] = v6;
  v22 = [(INCodableNumberAttributeMetadata *)self __INCodableDescriptionDefaultValueKey];
  v28[2] = v22;
  uint64_t v8 = [(INCodableNumberAttributeMetadata *)self defaultValue];
  uint64_t v9 = (void *)v8;
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[2] = v8;
  id v21 = [(INCodableNumberAttributeMetadata *)self __INCodableDescriptionMinimumValueKey];
  v28[3] = v21;
  uint64_t v10 = [(INCodableNumberAttributeMetadata *)self minimumValue];
  objc_super v11 = v10;
  if (!v10)
  {
    objc_super v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[3] = v11;
  id v12 = [(INCodableNumberAttributeMetadata *)self __INCodableDescriptionMaximumValueKey];
  v28[4] = v12;
  objc_super v13 = [(INCodableNumberAttributeMetadata *)self maximumValue];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[4] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:5];
  v16 = objc_msgSend(v23, "if_dictionaryByAddingEntriesFromDictionary:", v15);

  if (!v13) {
  if (!v10)
  }

  if (!v9) {
  if (!v7)
  }

  v17 = objc_msgSend(v16, "if_dictionaryWithNonEmptyValues");

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___INCodableNumberAttributeMetadata;
  id v19 = 0;
  id v7 = objc_msgSendSuper2(&v18, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v19);
  id v8 = v19;
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    v7[5] = objc_msgSend(v6, "intents_intForKey:", @"type");
    uint64_t v11 = objc_msgSend(v6, "intents_numberForKey:", @"defaultValue");
    id v12 = (void *)v7[6];
    v7[6] = v11;

    uint64_t v13 = objc_msgSend(v6, "intents_numberForKey:", @"minimumValue");
    v14 = (void *)v7[7];
    v7[7] = v13;

    uint64_t v15 = objc_msgSend(v6, "intents_numberForKey:", @"maximumValue");
    v16 = (void *)v7[8];
    v7[8] = v15;

    uint64_t v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  double v3 = objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataTypeKey");

  return v3;
}

- (id)__INTypeCodableDescriptionSupportsNegativeNumbersKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  double v3 = objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataSupportsNegativeNumbersKey");

  return v3;
}

- (id)__INTypeCodableDescriptionMinimumValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  double v3 = objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataMinimumValueKey");

  return v3;
}

- (id)__INTypeCodableDescriptionMaximumValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  double v3 = objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataMaximumValueKey");

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  double v3 = objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  double v3 = objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataTypeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionSupportsNegativeNumbersKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  double v3 = objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataSupportsNegativeNumbersKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionMinimumValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  double v3 = objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataMinimumValueKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionMaximumValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  double v3 = objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataMaximumValueKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  double v3 = objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INCodableDescriptionSupportsNegativeNumbersKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  double v3 = objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataSupportsNegativeNumbersKey");

  return v3;
}

@end