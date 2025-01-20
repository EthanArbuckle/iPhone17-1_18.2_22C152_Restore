@interface INCodableURLAttributeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (INCodableURLAttributeMetadata)initWithCoder:(id)a3;
- (NSURL)defaultValue;
- (id)__INCodableDescriptionDefaultValueKey;
- (id)__INCodableDescriptionKey;
- (id)__INIntentResponseCodableDescriptionDefaultValueKey;
- (id)__INIntentResponseCodableDescriptionKey;
- (id)__INTypeCodableDescriptionDefaultValueKey;
- (id)__INTypeCodableDescriptionKey;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableURLAttributeMetadata

- (void).cxx_destruct
{
}

- (void)setDefaultValue:(id)a3
{
}

- (NSURL)defaultValue
{
  return self->_defaultValue;
}

- (INCodableURLAttributeMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)INCodableURLAttributeMetadata;
  v5 = [(INCodableAttributeMetadata *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultValue"];
    [(INCodableURLAttributeMetadata *)v5 setDefaultValue:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCodableURLAttributeMetadata;
  id v4 = a3;
  [(INCodableAttributeMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValue, @"defaultValue", v5.receiver, v5.super_class);
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)INCodableURLAttributeMetadata;
  id v12 = 0;
  v6 = [(INCodableAttributeMetadata *)&v11 widgetPlistableRepresentationWithParameters:a3 error:&v12];
  id v7 = v12;
  objc_super v8 = v7;
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
    v9 = (void *)[v6 copy];
  }

  return v9;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)INCodableURLAttributeMetadata;
  id v4 = [(INCodableAttributeMetadata *)&v13 dictionaryRepresentationWithLocalizer:a3];
  objc_super v5 = [(INCodableURLAttributeMetadata *)self __INCodableDescriptionDefaultValueKey];
  v14 = v5;
  v6 = [(INCodableURLAttributeMetadata *)self defaultValue];
  id v7 = [v6 absoluteString];
  objc_super v8 = v7;
  if (!v7)
  {
    objc_super v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v10 = objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v9);

  if (!v7) {
  objc_super v11 = objc_msgSend(v10, "if_dictionaryWithNonEmptyValues");
  }

  return v11;
}

- (void)updateWithDictionary:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)INCodableURLAttributeMetadata;
  id v4 = a3;
  [(INCodableAttributeMetadata *)&v9 updateWithDictionary:v4];
  objc_super v5 = [(INCodableURLAttributeMetadata *)self __INCodableDescriptionDefaultValueKey];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
    char v8 = 0;
  }
  else
  {

    v6 = 0;
    id v7 = 0;
    char v8 = 1;
  }
  objc_storeStrong((id *)&self->_defaultValue, v7);
  if ((v8 & 1) == 0) {
}
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___INCodableURLAttributeMetadata;
  id v14 = 0;
  id v7 = objc_msgSendSuper2(&v13, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v14);
  id v8 = v14;
  objc_super v9 = v8;
  if (v8)
  {
    id v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    objc_super v11 = objc_msgSend(v6, "intents_urlForKey:", @"defaultValue");
    [v7 setDefaultValue:v11];

    id v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableURLAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INTypeCodableDescriptionKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableURLAttributeMetadataKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableURLAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableURLAttributeMetadataKey");

  return v3;
}

- (id)__INCodableDescriptionDefaultValueKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableURLAttributeMetadataDefaultValueKey");

  return v3;
}

- (id)__INCodableDescriptionKey
{
  v2 = [(INCodableAttributeMetadata *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableURLAttributeMetadataKey");

  return v3;
}

@end