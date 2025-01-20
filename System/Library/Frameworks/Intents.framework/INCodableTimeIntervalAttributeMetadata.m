@interface INCodableTimeIntervalAttributeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (INCodableTimeIntervalAttributeMetadata)initWithCoder:(id)a3;
- (NSNumber)defaultValue;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (id)__INCodableDescriptionDefaultUnitKey;
- (id)__INCodableDescriptionDefaultValueKey;
- (id)__INCodableDescriptionMaximumUnitKey;
- (id)__INCodableDescriptionMaximumValueKey;
- (id)__INCodableDescriptionMinimumUnitKey;
- (id)__INCodableDescriptionMinimumValueKey;
- (id)__INCodableDescriptionUnitKey;
- (id)__INIntentResponseCodableDescriptionDefaultUnitKey;
- (id)__INIntentResponseCodableDescriptionDefaultValueKey;
- (id)__INIntentResponseCodableDescriptionMaximumUnitKey;
- (id)__INIntentResponseCodableDescriptionMaximumValueKey;
- (id)__INIntentResponseCodableDescriptionMinimumUnitKey;
- (id)__INIntentResponseCodableDescriptionMinimumValueKey;
- (id)__INIntentResponseCodableDescriptionUnitKey;
- (id)__INTypeCodableDescriptionDefaultUnitKey;
- (id)__INTypeCodableDescriptionDefaultValueKey;
- (id)__INTypeCodableDescriptionMaximumUnitKey;
- (id)__INTypeCodableDescriptionMaximumValueKey;
- (id)__INTypeCodableDescriptionMinimumUnitKey;
- (id)__INTypeCodableDescriptionMinimumValueKey;
- (id)__INTypeCodableDescriptionUnitKey;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)defaultUnit;
- (int64_t)maximumUnit;
- (int64_t)minimumUnit;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultUnit:(int64_t)a3;
- (void)setDefaultValue:(id)a3;
- (void)setMaximumUnit:(int64_t)a3;
- (void)setMaximumValue:(id)a3;
- (void)setMinimumUnit:(int64_t)a3;
- (void)setMinimumValue:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableTimeIntervalAttributeMetadata

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

- (void)setMaximumUnit:(int64_t)a3
{
  self->_maximumUnit = a3;
}

- (int64_t)maximumUnit
{
  return self->_maximumUnit;
}

- (void)setMinimumUnit:(int64_t)a3
{
  self->_minimumUnit = a3;
}

- (int64_t)minimumUnit
{
  return self->_minimumUnit;
}

- (void)setDefaultUnit:(int64_t)a3
{
  self->_defaultUnit = a3;
}

- (int64_t)defaultUnit
{
  return self->_defaultUnit;
}

- (INCodableTimeIntervalAttributeMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INCodableTimeIntervalAttributeMetadata;
  v5 = [(INCodableAttributeMetadata *)&v10 initWithCoder:v4];
  if (v5)
  {
    -[INCodableTimeIntervalAttributeMetadata setDefaultUnit:](v5, "setDefaultUnit:", [v4 decodeIntegerForKey:@"defaultUnit"]);
    -[INCodableTimeIntervalAttributeMetadata setMinimumUnit:](v5, "setMinimumUnit:", [v4 decodeIntegerForKey:@"minimumUnit"]);
    -[INCodableTimeIntervalAttributeMetadata setMaximumUnit:](v5, "setMaximumUnit:", [v4 decodeIntegerForKey:@"maximumUnit"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultValue"];
    [(INCodableTimeIntervalAttributeMetadata *)v5 setDefaultValue:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumValue"];
    [(INCodableTimeIntervalAttributeMetadata *)v5 setMinimumValue:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumValue"];
    [(INCodableTimeIntervalAttributeMetadata *)v5 setMaximumValue:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCodableTimeIntervalAttributeMetadata;
  id v4 = a3;
  [(INCodableAttributeMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_defaultUnit, @"defaultUnit", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_minimumUnit forKey:@"minimumUnit"];
  [v4 encodeInteger:self->_maximumUnit forKey:@"maximumUnit"];
  [v4 encodeObject:self->_defaultValue forKey:@"defaultValue"];
  [v4 encodeObject:self->_minimumValue forKey:@"minimumValue"];
  [v4 encodeObject:self->_maximumValue forKey:@"maximumValue"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)INCodableTimeIntervalAttributeMetadata;
  id v12 = 0;
  v6 = [(INCodableAttributeMetadata *)&v11 widgetPlistableRepresentationWithParameters:a3 error:&v12];
  id v7 = v12;
  v8 = v7;
  if (v7)
  {
    v9 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_defaultUnit, @"defaultUnit");
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_minimumUnit, @"minimumUnit");
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_maximumUnit, @"maximumUnit");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_defaultValue, @"defaultValue");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_minimumValue, @"minimumValue");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_maximumValue, @"maximumValue");
    v9 = (void *)[v6 copy];
  }

  return v9;
}

- (NSNumber)defaultValue
{
  if (self->_defaultValue) {
    return self->_defaultValue;
  }
  else {
    return (NSNumber *)&unk_1EDBA7558;
  }
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v34[7] = *MEMORY[0x1E4F143B8];
  int64_t minimumUnit = self->_minimumUnit;
  if (minimumUnit == self->_maximumUnit)
  {
    unint64_t v5 = minimumUnit - 1;
    if (v5 > 2) {
      v6 = @"Seconds";
    }
    else {
      v6 = *(&off_1E5519AC8 + v5);
    }
  }
  else
  {
    v6 = @"Multiple";
  }
  v32.receiver = self;
  v32.super_class = (Class)INCodableTimeIntervalAttributeMetadata;
  v28 = [(INCodableAttributeMetadata *)&v32 dictionaryRepresentationWithLocalizer:a3];
  v31 = [(INCodableTimeIntervalAttributeMetadata *)self __INCodableDescriptionUnitKey];
  v33[0] = v31;
  v34[0] = v6;
  v30 = [(INCodableTimeIntervalAttributeMetadata *)self __INCodableDescriptionDefaultUnitKey];
  v33[1] = v30;
  int64_t v7 = [(INCodableTimeIntervalAttributeMetadata *)self defaultUnit];
  if ((unint64_t)(v7 - 1) > 2) {
    v8 = @"Seconds";
  }
  else {
    v8 = *(&off_1E5519AC8 + v7 - 1);
  }
  v34[1] = v8;
  v29 = [(INCodableTimeIntervalAttributeMetadata *)self __INCodableDescriptionMinimumUnitKey];
  v33[2] = v29;
  int64_t v9 = [(INCodableTimeIntervalAttributeMetadata *)self minimumUnit];
  if ((unint64_t)(v9 - 1) > 2) {
    objc_super v10 = @"Seconds";
  }
  else {
    objc_super v10 = *(&off_1E5519AC8 + v9 - 1);
  }
  v34[2] = v10;
  v27 = [(INCodableTimeIntervalAttributeMetadata *)self __INCodableDescriptionMaximumUnitKey];
  v33[3] = v27;
  int64_t v11 = [(INCodableTimeIntervalAttributeMetadata *)self maximumUnit];
  if ((unint64_t)(v11 - 1) > 2) {
    id v12 = @"Seconds";
  }
  else {
    id v12 = *(&off_1E5519AC8 + v11 - 1);
  }
  v34[3] = v12;
  v26 = [(INCodableTimeIntervalAttributeMetadata *)self __INCodableDescriptionDefaultValueKey];
  v33[4] = v26;
  uint64_t v13 = [(INCodableTimeIntervalAttributeMetadata *)self defaultValue];
  v14 = (void *)v13;
  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v13;
  v34[4] = v13;
  v15 = [(INCodableTimeIntervalAttributeMetadata *)self __INCodableDescriptionMinimumValueKey];
  v33[5] = v15;
  v16 = [(INCodableTimeIntervalAttributeMetadata *)self minimumValue];
  v17 = v16;
  if (!v16)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[5] = v17;
  v18 = [(INCodableTimeIntervalAttributeMetadata *)self __INCodableDescriptionMaximumValueKey];
  v33[6] = v18;
  v19 = [(INCodableTimeIntervalAttributeMetadata *)self maximumValue];
  v20 = v19;
  if (!v19)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[6] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:7];
  v22 = objc_msgSend(v28, "if_dictionaryByAddingEntriesFromDictionary:", v21);

  if (!v19) {
  if (!v16)
  }

  if (!v14) {
  v23 = objc_msgSend(v22, "if_dictionaryWithNonEmptyValues");
  }

  return v23;
}

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)INCodableTimeIntervalAttributeMetadata;
  [(INCodableAttributeMetadata *)&v48 updateWithDictionary:v4];
  unint64_t v5 = [(INCodableTimeIntervalAttributeMetadata *)self __INCodableDescriptionUnitKey];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v7 = v6;
    }
    else {
      int64_t v7 = 0;
    }
  }
  else
  {
    int64_t v7 = 0;
  }
  id v8 = v7;

  if ([v8 isEqualToString:@"Multiple"])
  {
    int64_t v9 = [(INCodableTimeIntervalAttributeMetadata *)self __INCodableDescriptionDefaultUnitKey];
    objc_super v10 = [v4 objectForKeyedSubscript:v9];

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int64_t v11 = v10;
      }
      else {
        int64_t v11 = 0;
      }
    }
    else
    {
      int64_t v11 = 0;
    }
    id v14 = v11;

    int64_t v15 = INCodableTimeIntervalAttributeMetadataUnitWithString(v14);
    self->_defaultUnit = v15;
    v16 = [(INCodableTimeIntervalAttributeMetadata *)self __INCodableDescriptionMinimumUnitKey];
    v17 = [v4 objectForKeyedSubscript:v16];

    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
    }
    else
    {
      v18 = 0;
    }
    id v19 = v18;

    int64_t v20 = INCodableTimeIntervalAttributeMetadataUnitWithString(v19);
    self->_int64_t minimumUnit = v20;
    v21 = [(INCodableTimeIntervalAttributeMetadata *)self __INCodableDescriptionMaximumUnitKey];
    v22 = [v4 objectForKeyedSubscript:v21];

    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }
    }
    else
    {
      v23 = 0;
    }
    id v24 = v23;

    id v12 = (objc_class *)INCodableTimeIntervalAttributeMetadataUnitWithString(v24);
    uint64_t v13 = &OBJC_IVAR___INCodableTimeIntervalAttributeMetadata__maximumUnit;
  }
  else
  {
    id v12 = (objc_class *)INCodableTimeIntervalAttributeMetadataUnitWithString(v8);
    self->_defaultUnit = (int64_t)v12;
    self->_maximumUnit = (int64_t)v12;
    uint64_t v13 = &OBJC_IVAR___INCodableTimeIntervalAttributeMetadata__minimumUnit;
  }
  *(Class *)((char *)&self->super.super.isa + *v13) = v12;
  v25 = [(INCodableTimeIntervalAttributeMetadata *)self __INCodableDescriptionDefaultValueKey];
  v26 = [v4 objectForKeyedSubscript:v25];

  if (v26)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v27 = v26;
    }
    else {
      v27 = 0;
    }
  }
  else
  {
    v27 = 0;
  }
  v28 = v27;

  defaultValue = self->_defaultValue;
  self->_defaultValue = v28;

  v30 = [(INCodableTimeIntervalAttributeMetadata *)self __INCodableDescriptionMinimumValueKey];
  v31 = [v4 objectForKeyedSubscript:v30];

  if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (![v31 length])
    {
      objc_super v32 = 0;
      goto LABEL_43;
    }
  }
  else
  {

    v31 = 0;
  }
  v33 = [(INCodableTimeIntervalAttributeMetadata *)self __INCodableDescriptionMinimumValueKey];
  v34 = [v4 objectForKeyedSubscript:v33];

  if (v34)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v35 = v34;
    }
    else {
      v35 = 0;
    }
  }
  else
  {
    v35 = 0;
  }
  id v36 = v35;

  if (v36) {
    v37 = v36;
  }
  else {
    v37 = &unk_1EDBA7558;
  }
  objc_super v32 = v37;

LABEL_43:
  minimumValue = self->_minimumValue;
  self->_minimumValue = v32;

  v39 = [(INCodableTimeIntervalAttributeMetadata *)self __INCodableDescriptionMaximumValueKey];
  v40 = [v4 objectForKeyedSubscript:v39];

  if (v40 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (![v40 length])
    {
      v41 = 0;
      goto LABEL_57;
    }
  }
  else
  {

    v40 = 0;
  }
  v42 = [(INCodableTimeIntervalAttributeMetadata *)self __INCodableDescriptionMaximumValueKey];
  v43 = [v4 objectForKeyedSubscript:v42];

  if (v43)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v44 = v43;
    }
    else {
      v44 = 0;
    }
  }
  else
  {
    v44 = 0;
  }
  id v45 = v44;

  if (v45) {
    v46 = v45;
  }
  else {
    v46 = &unk_1EDBA7558;
  }
  v41 = v46;

LABEL_57:
  maximumValue = self->_maximumValue;
  self->_maximumValue = v41;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___INCodableTimeIntervalAttributeMetadata;
  id v16 = 0;
  int64_t v7 = objc_msgSendSuper2(&v15, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v16);
  id v8 = v16;
  int64_t v9 = v8;
  if (v8)
  {
    id v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    objc_msgSend(v7, "setDefaultUnit:", objc_msgSend(v6, "intents_intForKey:", @"defaultUnit"));
    objc_msgSend(v7, "setMinimumUnit:", objc_msgSend(v6, "intents_intForKey:", @"minimumUnit"));
    objc_msgSend(v7, "setMaximumUnit:", objc_msgSend(v6, "intents_intForKey:", @"maximumUnit"));
    int64_t v11 = objc_msgSend(v6, "intents_numberForKey:", @"defaultValue");
    [v7 setDefaultValue:v11];

    id v12 = objc_msgSend(v6, "intents_numberForKey:", @"minimumValue");
    [v7 setMinimumValue:v12];

    uint64_t v13 = objc_msgSend(v6, "intents_numberForKey:", @"maximumValue");
    [v7 setMaximumValue:v13];

    id v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataUnitKey");

  return v3;
}

- (id)__INTypeCodableDescriptionMinimumValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMinimumValueKey");

  return v3;
}

- (id)__INTypeCodableDescriptionMinimumUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMinimumUnitKey");

  return v3;
}

- (id)__INTypeCodableDescriptionMaximumValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMaximumValueKey");

  return v3;
}

- (id)__INTypeCodableDescriptionMaximumUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMaximumUnitKey");

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataDefaultUnitKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataUnitKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionMinimumValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMinimumValueKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionMinimumUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMinimumUnitKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionMaximumValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMaximumValueKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionMaximumUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMaximumUnitKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataDefaultUnitKey");

  return v3;
}

- (id)__INCodableDescriptionUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataUnitKey");

  return v3;
}

- (id)__INCodableDescriptionMinimumValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMinimumValueKey");

  return v3;
}

- (id)__INCodableDescriptionMinimumUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMinimumUnitKey");

  return v3;
}

- (id)__INCodableDescriptionMaximumValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMaximumValueKey");

  return v3;
}

- (id)__INCodableDescriptionMaximumUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMaximumUnitKey");

  return v3;
}

- (id)__INCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INCodableDescriptionDefaultUnitKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataDefaultUnitKey");

  return v3;
}

@end