@interface INCodableEnumAttributeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (INCodableEnumAttributeMetadata)initWithCoder:(id)a3;
- (INCodableEnumValue)defaultValue;
- (id)__INCodableDescriptionDefaultValueKey;
- (id)__INCodableDescriptionKey;
- (id)__INIntentResponseCodableDescriptionDefaultValueKey;
- (id)__INIntentResponseCodableDescriptionKey;
- (id)__INTypeCodableDescriptionDefaultValueKey;
- (id)__INTypeCodableDescriptionKey;
- (id)defaultValueForIntentDefaultValueProvider;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableEnumAttributeMetadata

- (void)updateWithDictionary:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)INCodableEnumAttributeMetadata;
  id v4 = a3;
  [(INCodableAttributeMetadata *)&v14 updateWithDictionary:v4];
  v5 = [(INCodableAttributeMetadata *)self codableAttribute];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [(INCodableEnumAttributeMetadata *)self __INCodableDescriptionDefaultValueKey];
  v9 = [v4 objectForKeyedSubscript:v8];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  v12 = [v7 valueWithName:v11];

  defaultValue = self->_defaultValue;
  self->_defaultValue = v12;
}

- (id)__INCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeMetadataDefaultValueKey");

  return v3;
}

- (void).cxx_destruct
{
}

- (void)setDefaultValue:(id)a3
{
}

- (INCodableEnumValue)defaultValue
{
  return self->_defaultValue;
}

- (INCodableEnumAttributeMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INCodableEnumAttributeMetadata;
  v5 = [(INCodableAttributeMetadata *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultValue"];
    defaultValue = v5->_defaultValue;
    v5->_defaultValue = (INCodableEnumValue *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCodableEnumAttributeMetadata;
  id v4 = a3;
  [(INCodableAttributeMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValue, @"defaultValue", v5.receiver, v5.super_class);
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INCodableEnumAttributeMetadata;
  id v15 = 0;
  id v7 = [(INCodableAttributeMetadata *)&v14 widgetPlistableRepresentationWithParameters:v6 error:&v15];
  id v8 = v15;
  if (v8)
  {
    id v9 = v8;
    if (a4)
    {
LABEL_3:
      id v9 = v9;
      v10 = 0;
      *a4 = v9;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  defaultValue = self->_defaultValue;
  id v13 = 0;
  objc_msgSend(v7, "intents_setWidgetPlistRepresentable:forKey:parameters:error:", defaultValue, @"defaultValue", v6, &v13);
  id v9 = v13;
  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    v10 = 0;
    goto LABEL_8;
  }
  v10 = (void *)[v7 copy];
LABEL_8:

  return v10;
}

- (id)defaultValueForIntentDefaultValueProvider
{
  v2 = NSNumber;
  v3 = [(INCodableEnumAttributeMetadata *)self defaultValue];
  id v4 = objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "index"));

  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)INCodableEnumAttributeMetadata;
  id v4 = [(INCodableAttributeMetadata *)&v13 dictionaryRepresentationWithLocalizer:a3];
  objc_super v5 = [(INCodableEnumAttributeMetadata *)self __INCodableDescriptionDefaultValueKey];
  objc_super v14 = v5;
  id v6 = [(INCodableEnumAttributeMetadata *)self defaultValue];
  id v7 = [v6 name];
  id v8 = v7;
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v10 = objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v9);

  if (!v7) {
  id v11 = objc_msgSend(v10, "if_dictionaryWithNonEmptyValues");
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___INCodableEnumAttributeMetadata;
  id v16 = 0;
  id v7 = objc_msgSendSuper2(&v15, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v16);
  id v8 = v16;
  if (v8)
  {
    id v9 = v8;
    if (a4)
    {
LABEL_3:
      id v9 = v9;
      v10 = 0;
      *a4 = v9;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  id v14 = 0;
  uint64_t v11 = +[NSObject intents_widgetPlistRepresentableInDict:v6 key:@"defaultValue" error:&v14];
  id v9 = v14;
  v12 = (void *)v7[5];
  v7[5] = v11;

  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    v10 = 0;
    goto LABEL_8;
  }
  v10 = v7;
LABEL_8:

  return v10;
}

- (id)__INTypeCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INTypeCodableDescriptionKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeMetadataKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeMetadataKey");

  return v3;
}

- (id)__INCodableDescriptionKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeMetadataKey");

  return v3;
}

@end