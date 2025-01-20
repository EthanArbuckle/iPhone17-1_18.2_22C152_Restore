@interface INCodableDateComponentsAttributeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (INCodableDateComponentsAttributeMetadata)initWithCoder:(id)a3;
- (NSString)formatString;
- (NSString)formatStringID;
- (id)__INCodableDescriptionDateStyleKey;
- (id)__INCodableDescriptionFormatKey;
- (id)__INCodableDescriptionTemplateIDKey;
- (id)__INCodableDescriptionTemplateKey;
- (id)__INCodableDescriptionTimeStyleKey;
- (id)__INCodableDescriptionTypeKey;
- (id)__INIntentResponseCodableDescriptionDateStyleKey;
- (id)__INIntentResponseCodableDescriptionFormatKey;
- (id)__INIntentResponseCodableDescriptionTemplateIDKey;
- (id)__INIntentResponseCodableDescriptionTemplateKey;
- (id)__INIntentResponseCodableDescriptionTimeStyleKey;
- (id)__INIntentResponseCodableDescriptionTypeKey;
- (id)__INTypeCodableDescriptionDateStyleKey;
- (id)__INTypeCodableDescriptionFormatKey;
- (id)__INTypeCodableDescriptionTemplateIDKey;
- (id)__INTypeCodableDescriptionTemplateKey;
- (id)__INTypeCodableDescriptionTimeStyleKey;
- (id)__INTypeCodableDescriptionTypeKey;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)localizedFormatString;
- (id)localizedFormatStringWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)format;
- (int64_t)type;
- (unint64_t)dateStyle;
- (unint64_t)timeStyle;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableDateComponentsAttributeMetadata

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)INCodableDateComponentsAttributeMetadata;
  [(INCodableAttributeMetadata *)&v31 updateWithDictionary:v4];
  v5 = [(INCodableDateComponentsAttributeMetadata *)self __INCodableDescriptionTypeKey];
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

  int64_t v9 = INCodableDateComponentsAttributeMetadataTypeFromString(v8);
  self->_type = v9;
  v10 = [(INCodableDateComponentsAttributeMetadata *)self __INCodableDescriptionFormatKey];
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
  id v13 = v12;

  int64_t v14 = INCodableDateComponentsAttributeMetadataFormatFromString(v13);
  self->_format = v14;
  v15 = [(INCodableDateComponentsAttributeMetadata *)self __INCodableDescriptionDateStyleKey];
  v16 = [v4 objectForKeyedSubscript:v15];

  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }
  id v18 = v17;

  unint64_t v19 = INCodableDateComponentsAttributeMetadataStyleFromString(v18);
  self->_dateStyle = v19;
  v20 = [(INCodableDateComponentsAttributeMetadata *)self __INCodableDescriptionTimeStyleKey];
  v21 = [v4 objectForKeyedSubscript:v20];

  if (v21)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }
  id v23 = v22;

  unint64_t v24 = INCodableDateComponentsAttributeMetadataStyleFromString(v23);
  self->_timeStyle = v24;
  v25 = [(INCodableDateComponentsAttributeMetadata *)self __INCodableDescriptionTemplateKey];
  v26 = [v4 objectForKeyedSubscript:v25];
  formatString = self->_formatString;
  self->_formatString = v26;

  v28 = [(INCodableDateComponentsAttributeMetadata *)self __INCodableDescriptionTemplateIDKey];
  v29 = [v4 objectForKeyedSubscript:v28];
  formatStringID = self->_formatStringID;
  self->_formatStringID = v29;
}

- (id)__INCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTypeKey");

  return v3;
}

- (id)__INCodableDescriptionTimeStyleKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTimeStyleKey");

  return v3;
}

- (id)__INCodableDescriptionTemplateIDKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTemplateIDKey");

  return v3;
}

- (id)__INCodableDescriptionTemplateKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTemplateKey");

  return v3;
}

- (id)__INCodableDescriptionFormatKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataFormatKey");

  return v3;
}

- (id)__INCodableDescriptionDateStyleKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataDateStyleKey");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatStringID, 0);

  objc_storeStrong((id *)&self->_formatString, 0);
}

- (NSString)formatStringID
{
  return self->_formatStringID;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (unint64_t)timeStyle
{
  return self->_timeStyle;
}

- (unint64_t)dateStyle
{
  return self->_dateStyle;
}

- (int64_t)format
{
  return self->_format;
}

- (int64_t)type
{
  return self->_type;
}

- (INCodableDateComponentsAttributeMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INCodableDateComponentsAttributeMetadata;
  v5 = [(INCodableAttributeMetadata *)&v14 initWithCoder:v4];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_format = [v4 decodeIntegerForKey:@"format"];
    v5->_dateStyle = [v4 decodeIntegerForKey:@"dateStyle"];
    v5->_timeStyle = [v4 decodeIntegerForKey:@"timeStyle"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"formatString"];
    formatString = v5->_formatString;
    v5->_formatString = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formatStringID"];
    formatStringID = v5->_formatStringID;
    v5->_formatStringID = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCodableDateComponentsAttributeMetadata;
  id v4 = a3;
  [(INCodableAttributeMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_format forKey:@"format"];
  [v4 encodeInteger:self->_dateStyle forKey:@"dateStyle"];
  [v4 encodeInteger:self->_timeStyle forKey:@"timeStyle"];
  [v4 encodeObject:self->_formatString forKey:@"formatString"];
  [v4 encodeObject:self->_formatStringID forKey:@"formatStringID"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)INCodableDateComponentsAttributeMetadata;
  id v12 = 0;
  v6 = [(INCodableAttributeMetadata *)&v11 widgetPlistableRepresentationWithParameters:0 error:&v12];
  id v7 = v12;
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_type, @"type");
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_format, @"format");
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_dateStyle, @"dateStyle");
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_timeStyle, @"timeStyle");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_formatString, @"formatString");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_formatStringID, @"formatStringID");
    uint64_t v9 = (void *)[v6 copy];
  }

  return v9;
}

- (id)localizedFormatStringWithLocalizer:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(INCodableDateComponentsAttributeMetadata *)self formatStringID];
  v6 = [(INCodableDateComponentsAttributeMetadata *)self formatString];
  id v7 = [(INCodableAttributeMetadata *)self _localizationTable];
  id v8 = INLocalizedStringFromCodable(v5, v6, v7, v4, 0);

  return v8;
}

- (id)localizedFormatString
{
  v3 = objc_opt_new();
  id v4 = [(INCodableDateComponentsAttributeMetadata *)self localizedFormatStringWithLocalizer:v3];

  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v32[6] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)INCodableDateComponentsAttributeMetadata;
  id v4 = a3;
  v25 = [(INCodableAttributeMetadata *)&v30 dictionaryRepresentationWithLocalizer:v4];
  v29 = [(INCodableDateComponentsAttributeMetadata *)self __INCodableDescriptionTypeKey];
  v31[0] = v29;
  int64_t v5 = [(INCodableDateComponentsAttributeMetadata *)self type];
  v6 = @"DateTime";
  if (v5 == 1) {
    v6 = @"Date";
  }
  if (v5 == 2) {
    v6 = @"Time";
  }
  v28 = v6;
  v32[0] = v28;
  v27 = [(INCodableDateComponentsAttributeMetadata *)self __INCodableDescriptionFormatKey];
  v31[1] = v27;
  int64_t v7 = [(INCodableDateComponentsAttributeMetadata *)self format];
  id v8 = @"Style";
  if (v7 == 1) {
    id v8 = @"Relative";
  }
  if (v7 == 2) {
    id v8 = @"Template";
  }
  v26 = v8;
  v32[1] = v26;
  unint64_t v24 = [(INCodableDateComponentsAttributeMetadata *)self __INCodableDescriptionDateStyleKey];
  v31[2] = v24;
  unint64_t v9 = [(INCodableDateComponentsAttributeMetadata *)self dateStyle];
  if (v9 > 3) {
    v10 = @"Full";
  }
  else {
    v10 = off_1E551B9C0[v9];
  }
  v32[2] = v10;
  objc_super v11 = [(INCodableDateComponentsAttributeMetadata *)self __INCodableDescriptionTimeStyleKey];
  v31[3] = v11;
  unint64_t v12 = [(INCodableDateComponentsAttributeMetadata *)self timeStyle];
  if (v12 > 3) {
    id v13 = @"Full";
  }
  else {
    id v13 = off_1E551B9C0[v12];
  }
  v32[3] = v13;
  objc_super v14 = [(INCodableDateComponentsAttributeMetadata *)self __INCodableDescriptionTemplateKey];
  v31[4] = v14;
  v15 = [(INCodableDateComponentsAttributeMetadata *)self localizedFormatStringWithLocalizer:v4];

  v16 = v15;
  if (!v15)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[4] = v16;
  v17 = [(INCodableDateComponentsAttributeMetadata *)self __INCodableDescriptionTemplateIDKey];
  v31[5] = v17;
  id v18 = [(INCodableDateComponentsAttributeMetadata *)self formatStringID];
  unint64_t v19 = v18;
  if (!v18)
  {
    unint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[5] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:6];
  v21 = objc_msgSend(v25, "if_dictionaryByAddingEntriesFromDictionary:", v20);

  if (!v18) {
  if (!v15)
  }

  v22 = objc_msgSend(v21, "if_dictionaryWithNonEmptyValues");

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___INCodableDateComponentsAttributeMetadata;
  id v17 = 0;
  int64_t v7 = objc_msgSendSuper2(&v16, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v17);
  id v8 = v17;
  unint64_t v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    v7[5] = objc_msgSend(v6, "intents_intForKey:", @"type");
    v7[6] = objc_msgSend(v6, "intents_intForKey:", @"format");
    v7[7] = objc_msgSend(v6, "intents_intForKey:", @"dateStyle");
    v7[8] = objc_msgSend(v6, "intents_intForKey:", @"timeStyle");
    uint64_t v11 = objc_msgSend(v6, "intents_stringForKey:", @"formatString");
    unint64_t v12 = (void *)v7[9];
    v7[9] = v11;

    uint64_t v13 = objc_msgSend(v6, "intents_stringForKey:", @"formatStringID");
    objc_super v14 = (void *)v7[10];
    v7[10] = v13;

    v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTypeKey");

  return v3;
}

- (id)__INTypeCodableDescriptionTimeStyleKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTimeStyleKey");

  return v3;
}

- (id)__INTypeCodableDescriptionTemplateIDKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTemplateIDKey");

  return v3;
}

- (id)__INTypeCodableDescriptionTemplateKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTemplateKey");

  return v3;
}

- (id)__INTypeCodableDescriptionFormatKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataFormatKey");

  return v3;
}

- (id)__INTypeCodableDescriptionDateStyleKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataDateStyleKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTypeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTimeStyleKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTimeStyleKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTemplateIDKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTemplateIDKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTemplateKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTemplateKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionFormatKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataFormatKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDateStyleKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataDateStyleKey");

  return v3;
}

@end