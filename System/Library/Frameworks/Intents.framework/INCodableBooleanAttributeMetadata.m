@interface INCodableBooleanAttributeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (INCodableBooleanAttributeMetadata)initWithCoder:(id)a3;
- (NSNumber)defaultValue;
- (NSString)falseDisplayName;
- (NSString)falseDisplayNameID;
- (NSString)localizedFalseDisplayName;
- (NSString)localizedTrueDisplayName;
- (NSString)trueDisplayName;
- (NSString)trueDisplayNameID;
- (id)__INCodableDescriptionDefaultValueKey;
- (id)__INCodableDescriptionFalseDisplayNameIDKey;
- (id)__INCodableDescriptionFalseDisplayNameKey;
- (id)__INCodableDescriptionTrueDisplayNameIDKey;
- (id)__INCodableDescriptionTrueDisplayNameKey;
- (id)__INIntentResponseCodableDescriptionDefaultValueKey;
- (id)__INIntentResponseCodableDescriptionFalseDisplayNameIDKey;
- (id)__INIntentResponseCodableDescriptionFalseDisplayNameKey;
- (id)__INIntentResponseCodableDescriptionTrueDisplayNameIDKey;
- (id)__INIntentResponseCodableDescriptionTrueDisplayNameKey;
- (id)__INTypeCodableDescriptionDefaultValueKey;
- (id)__INTypeCodableDescriptionFalseDisplayNameIDKey;
- (id)__INTypeCodableDescriptionFalseDisplayNameKey;
- (id)__INTypeCodableDescriptionTrueDisplayNameIDKey;
- (id)__INTypeCodableDescriptionTrueDisplayNameKey;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)localizedFalseDisplayNameWithLocalizer:(id)a3;
- (id)localizedTrueDisplayNameWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setFalseDisplayName:(id)a3;
- (void)setFalseDisplayNameID:(id)a3;
- (void)setTrueDisplayName:(id)a3;
- (void)setTrueDisplayNameID:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableBooleanAttributeMetadata

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)INCodableBooleanAttributeMetadata;
  [(INCodableAttributeMetadata *)&v35 updateWithDictionary:v4];
  v5 = [(INCodableBooleanAttributeMetadata *)self __INCodableDescriptionDefaultValueKey];
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

  v9 = (NSNumber *)[v8 copy];
  defaultValue = self->_defaultValue;
  self->_defaultValue = v9;

  v11 = [(INCodableBooleanAttributeMetadata *)self __INCodableDescriptionFalseDisplayNameKey];
  v12 = [v4 objectForKeyedSubscript:v11];

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

  v15 = (NSString *)[v14 copy];
  falseDisplayName = self->_falseDisplayName;
  self->_falseDisplayName = v15;

  v17 = [(INCodableBooleanAttributeMetadata *)self __INCodableDescriptionFalseDisplayNameIDKey];
  v18 = [v4 objectForKeyedSubscript:v17];

  if (v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }
  id v20 = v19;

  v21 = (NSString *)[v20 copy];
  falseDisplayNameID = self->_falseDisplayNameID;
  self->_falseDisplayNameID = v21;

  v23 = [(INCodableBooleanAttributeMetadata *)self __INCodableDescriptionTrueDisplayNameKey];
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

  v27 = (NSString *)[v26 copy];
  trueDisplayName = self->_trueDisplayName;
  self->_trueDisplayName = v27;

  v29 = [(INCodableBooleanAttributeMetadata *)self __INCodableDescriptionTrueDisplayNameIDKey];
  v30 = [v4 objectForKeyedSubscript:v29];

  if (v30)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }
  }
  else
  {
    v31 = 0;
  }
  id v32 = v31;

  v33 = (NSString *)[v32 copy];
  trueDisplayNameID = self->_trueDisplayNameID;
  self->_trueDisplayNameID = v33;
}

- (id)__INCodableDescriptionTrueDisplayNameIDKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataTrueDisplayNameIDKey");

  return v3;
}

- (id)__INCodableDescriptionTrueDisplayNameKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataTrueDisplayNameKey");

  return v3;
}

- (id)__INCodableDescriptionFalseDisplayNameIDKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataFalseDisplayNameIDKey");

  return v3;
}

- (id)__INCodableDescriptionFalseDisplayNameKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataFalseDisplayNameKey");

  return v3;
}

- (id)__INCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataDefaultValueKey");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trueDisplayNameID, 0);
  objc_storeStrong((id *)&self->_trueDisplayName, 0);
  objc_storeStrong((id *)&self->_falseDisplayNameID, 0);
  objc_storeStrong((id *)&self->_falseDisplayName, 0);

  objc_storeStrong((id *)&self->_defaultValue, 0);
}

- (void)setTrueDisplayNameID:(id)a3
{
}

- (NSString)trueDisplayNameID
{
  return self->_trueDisplayNameID;
}

- (void)setTrueDisplayName:(id)a3
{
}

- (NSString)trueDisplayName
{
  return self->_trueDisplayName;
}

- (void)setFalseDisplayNameID:(id)a3
{
}

- (NSString)falseDisplayNameID
{
  return self->_falseDisplayNameID;
}

- (void)setFalseDisplayName:(id)a3
{
}

- (NSString)falseDisplayName
{
  return self->_falseDisplayName;
}

- (void)setDefaultValue:(id)a3
{
}

- (NSNumber)defaultValue
{
  return self->_defaultValue;
}

- (INCodableBooleanAttributeMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INCodableBooleanAttributeMetadata;
  v5 = [(INCodableAttributeMetadata *)&v18 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultValue"];
    [(INCodableBooleanAttributeMetadata *)v5 setDefaultValue:v6];

    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"falseDisplayName"];
    [(INCodableBooleanAttributeMetadata *)v5 setFalseDisplayName:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"falseDisplayNameID"];
    [(INCodableBooleanAttributeMetadata *)v5 setFalseDisplayNameID:v11];

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"trueDisplayName"];
    [(INCodableBooleanAttributeMetadata *)v5 setTrueDisplayName:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trueDisplayNameID"];
    [(INCodableBooleanAttributeMetadata *)v5 setTrueDisplayNameID:v16];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCodableBooleanAttributeMetadata;
  id v4 = a3;
  [(INCodableAttributeMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValue, @"defaultValue", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_falseDisplayName forKey:@"falseDisplayName"];
  [v4 encodeObject:self->_falseDisplayNameID forKey:@"falseDisplayNameID"];
  [v4 encodeObject:self->_trueDisplayName forKey:@"trueDisplayName"];
  [v4 encodeObject:self->_trueDisplayNameID forKey:@"trueDisplayNameID"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)INCodableBooleanAttributeMetadata;
  id v12 = 0;
  v6 = [(INCodableAttributeMetadata *)&v11 widgetPlistableRepresentationWithParameters:a3 error:&v12];
  id v7 = v12;
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
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_defaultValue, @"defaultValue");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_falseDisplayName, @"falseDisplayName");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_falseDisplayNameID, @"falseDisplayNameID");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_trueDisplayName, @"trueDisplayName");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_trueDisplayNameID, @"trueDisplayNameID");
    v9 = (void *)[v6 copy];
  }

  return v9;
}

- (id)localizedFalseDisplayNameWithLocalizer:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(INCodableBooleanAttributeMetadata *)self falseDisplayNameID];
  v6 = [(INCodableBooleanAttributeMetadata *)self falseDisplayName];
  id v7 = [(INCodableAttributeMetadata *)self _localizationTable];
  uint64_t v8 = INLocalizedStringFromCodable(v5, v6, v7, v4, 0);

  return v8;
}

- (NSString)localizedFalseDisplayName
{
  v3 = objc_opt_new();
  id v4 = [(INCodableBooleanAttributeMetadata *)self localizedFalseDisplayNameWithLocalizer:v3];

  return (NSString *)v4;
}

- (id)localizedTrueDisplayNameWithLocalizer:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(INCodableBooleanAttributeMetadata *)self trueDisplayNameID];
  v6 = [(INCodableBooleanAttributeMetadata *)self trueDisplayName];
  id v7 = [(INCodableAttributeMetadata *)self _localizationTable];
  uint64_t v8 = INLocalizedStringFromCodable(v5, v6, v7, v4, 0);

  return v8;
}

- (NSString)localizedTrueDisplayName
{
  v3 = objc_opt_new();
  id v4 = [(INCodableBooleanAttributeMetadata *)self localizedTrueDisplayNameWithLocalizer:v3];

  return (NSString *)v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v31[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)INCodableBooleanAttributeMetadata;
  v24 = [(INCodableAttributeMetadata *)&v29 dictionaryRepresentationWithLocalizer:v4];
  v27 = [(INCodableBooleanAttributeMetadata *)self __INCodableDescriptionDefaultValueKey];
  v30[0] = v27;
  uint64_t v5 = [(INCodableBooleanAttributeMetadata *)self defaultValue];
  id v26 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v5;
  v31[0] = v5;
  v25 = [(INCodableBooleanAttributeMetadata *)self __INCodableDescriptionTrueDisplayNameKey];
  v30[1] = v25;
  uint64_t v6 = [(INCodableBooleanAttributeMetadata *)self localizedTrueDisplayNameWithLocalizer:v4];
  id v7 = (void *)v6;
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  id v20 = (void *)v6;
  v31[1] = v6;
  v23 = [(INCodableBooleanAttributeMetadata *)self __INCodableDescriptionTrueDisplayNameIDKey];
  v30[2] = v23;
  uint64_t v8 = [(INCodableBooleanAttributeMetadata *)self trueDisplayNameID];
  v9 = (void *)v8;
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[2] = v8;
  v22 = [(INCodableBooleanAttributeMetadata *)self __INCodableDescriptionFalseDisplayNameKey];
  v30[3] = v22;
  v28 = v4;
  v10 = [(INCodableBooleanAttributeMetadata *)self localizedFalseDisplayNameWithLocalizer:v4];
  objc_super v11 = v10;
  if (!v10)
  {
    objc_super v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[3] = v11;
  id v12 = [(INCodableBooleanAttributeMetadata *)self __INCodableDescriptionFalseDisplayNameIDKey];
  v30[4] = v12;
  uint64_t v13 = [(INCodableBooleanAttributeMetadata *)self falseDisplayNameID];
  id v14 = v13;
  if (!v13)
  {
    id v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[4] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:5];
  v16 = objc_msgSend(v24, "if_dictionaryByAddingEntriesFromDictionary:", v15);

  if (!v13) {
  if (!v10)
  }

  if (!v9) {
  if (!v7)
  }

  if (!v26) {
  v17 = objc_msgSend(v16, "if_dictionaryWithNonEmptyValues");
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___INCodableBooleanAttributeMetadata;
  id v18 = 0;
  id v7 = objc_msgSendSuper2(&v17, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v18);
  id v8 = v18;
  v9 = v8;
  if (v8)
  {
    id v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    objc_super v11 = objc_msgSend(v6, "intents_numberForKey:", @"defaultValue");
    [v7 setDefaultValue:v11];

    id v12 = objc_msgSend(v6, "intents_stringForKey:", @"falseDisplayName");
    [v7 setFalseDisplayName:v12];

    uint64_t v13 = objc_msgSend(v6, "intents_stringForKey:", @"falseDisplayNameID");
    [v7 setFalseDisplayNameID:v13];

    id v14 = objc_msgSend(v6, "intents_stringForKey:", @"trueDisplayName");
    [v7 setTrueDisplayName:v14];

    v15 = objc_msgSend(v6, "intents_stringForKey:", @"trueDisplayNameID");
    [v7 setTrueDisplayNameID:v15];

    id v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionTrueDisplayNameIDKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataTrueDisplayNameIDKey");

  return v3;
}

- (id)__INTypeCodableDescriptionTrueDisplayNameKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataTrueDisplayNameKey");

  return v3;
}

- (id)__INTypeCodableDescriptionFalseDisplayNameIDKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataFalseDisplayNameIDKey");

  return v3;
}

- (id)__INTypeCodableDescriptionFalseDisplayNameKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataFalseDisplayNameKey");

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTrueDisplayNameIDKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataTrueDisplayNameIDKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTrueDisplayNameKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataTrueDisplayNameKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionFalseDisplayNameIDKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataFalseDisplayNameIDKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionFalseDisplayNameKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataFalseDisplayNameKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataDefaultValueKey");

  return v3;
}

@end