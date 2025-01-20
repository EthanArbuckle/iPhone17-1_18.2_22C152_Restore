@interface INCodableObjectAttribute
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (Class)_relationshipValueTransformerClass;
- (Class)objectClass;
- (Class)resolutionResultClass;
- (INCodableObjectAttribute)initWithCoder:(id)a3;
- (NSString)_originalTypeName;
- (NSString)typeName;
- (NSValueTransformer)valueTransformer;
- (id)__INCodableDescriptionKey;
- (id)__INCodableDescriptionTypeKey;
- (id)__INIntentResponseCodableDescriptionKey;
- (id)__INIntentResponseCodableDescriptionTypeKey;
- (id)__INTypeCodableDescriptionKey;
- (id)__INTypeCodableDescriptionTypeKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)_attributeType;
- (int64_t)valueType;
- (unint64_t)hash;
- (void)_setOriginalTypeName:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setTypeName:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableObjectAttribute

- (id)__INCodableDescriptionTypeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableObjectAttributeTypeKey");

  return v3;
}

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(INCodableObjectAttribute *)self __INCodableDescriptionTypeKey];
  v6 = [v4 objectForKeyedSubscript:v5];

  if ([(NSString *)v6 isEqualToString:@"Decimal"]
    || [(NSString *)v6 isEqualToString:@"TimeInterval"])
  {
    v7 = @"Double";
  }
  else
  {
    if (![(NSString *)v6 isEqualToString:@"Integer"]) {
      goto LABEL_5;
    }
    v7 = @"Long";
  }
  originalTypeName = self->_originalTypeName;
  self->_originalTypeName = v6;

  v6 = (NSString *)v7;
LABEL_5:
  typeName = self->_typeName;
  self->_typeName = v6;
  v10 = v6;

  v11.receiver = self;
  v11.super_class = (Class)INCodableObjectAttribute;
  [(INCodableAttribute *)&v11 updateWithDictionary:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if ([v5 isMemberOfClass:objc_opt_class()])
  {
    v6 = [(INCodableObjectAttribute *)self typeName];
    if (v6 || ([v5 typeName], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = [(INCodableObjectAttribute *)self typeName];
      v8 = [v5 typeName];
      int v9 = [v7 isEqual:v8];

      if (v6)
      {
LABEL_9:

        v12.receiver = self;
        v12.super_class = (Class)INCodableObjectAttribute;
        unsigned int v10 = [(INCodableAttribute *)&v12 isEqual:v5] & v9;
        goto LABEL_10;
      }
    }
    else
    {
      int v9 = 1;
    }

    goto LABEL_9;
  }
  LOBYTE(v10) = 0;
LABEL_10:

  return v10;
}

- (void)setTypeName:(id)a3
{
}

- (unint64_t)hash
{
  v3 = [(INCodableObjectAttribute *)self typeName];
  uint64_t v4 = [v3 hash];
  v7.receiver = self;
  v7.super_class = (Class)INCodableObjectAttribute;
  unint64_t v5 = [(INCodableAttribute *)&v7 hash] ^ v4;

  return v5;
}

- (NSString)typeName
{
  return self->_typeName;
}

- (NSValueTransformer)valueTransformer
{
  v2 = [(INCodableObjectAttribute *)self typeName];
  v3 = [NSString stringWithFormat:@"_IN%@ValueTransformer", v2];
  id v4 = [MEMORY[0x1E4F29248] valueTransformerForName:v3];
  if (!v4)
  {
    unint64_t v5 = [NSString stringWithFormat:@"INIntent%@SlotValueTransformer", v2];
    v6 = NSClassFromString(v5);
    if (v6)
    {
      id v4 = objc_alloc_init(v6);
      [MEMORY[0x1E4F29248] setValueTransformer:v4 forName:v5];
    }
    else
    {
      id v4 = 0;
    }
  }
  objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    if ([(id)objc_opt_class() reverseTransformedValueClass]) {
      objc_super v7 = v4;
    }
    else {
      objc_super v7 = 0;
    }
  }
  else
  {
    objc_super v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (int64_t)valueType
{
  v2 = [(INCodableObjectAttribute *)self valueTransformer];
  if (v2 && (objc_opt_class(), (objc_opt_respondsToSelector() & 1) != 0)) {
    int64_t v3 = objc_msgSend((id)objc_opt_class(), "_intents_valueType");
  }
  else {
    int64_t v3 = 225;
  }

  return v3;
}

- (Class)resolutionResultClass
{
  v2 = [(INCodableObjectAttribute *)self valueTransformer];
  int64_t v3 = objc_msgSend((id)objc_opt_class(), "_intents_resolutionResultClass");

  return (Class)v3;
}

- (INCodableObjectAttribute)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INCodableObjectAttribute;
  unint64_t v5 = [(INCodableAttribute *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typeName"];
    typeName = v5->_typeName;
    v5->_typeName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originalTypeName"];
    originalTypeName = v5->_originalTypeName;
    v5->_originalTypeName = (NSString *)v8;

    unsigned int v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"className"];
    if (v10) {
      objc_storeStrong((id *)&v5->_typeName, v10);
    }
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeName, 0);

  objc_storeStrong((id *)&self->_originalTypeName, 0);
}

- (void)_setOriginalTypeName:(id)a3
{
}

- (NSString)_originalTypeName
{
  return self->_originalTypeName;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCodableObjectAttribute;
  id v4 = a3;
  [(INCodableAttribute *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_typeName, @"typeName", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_originalTypeName forKey:@"_originalTypeName"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)INCodableObjectAttribute;
  id v12 = 0;
  uint64_t v6 = [(INCodableAttribute *)&v11 widgetPlistableRepresentationWithParameters:a3 error:&v12];
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
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_typeName, @"typeName");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_originalTypeName, @"_originalTypeName");
    id v9 = v6;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)INCodableObjectAttribute;
  id v4 = [(INCodableAttribute *)&v8 copyWithZone:a3];
  objc_super v5 = [(INCodableObjectAttribute *)self typeName];
  [v4 setTypeName:v5];

  uint64_t v6 = [(INCodableObjectAttribute *)self _originalTypeName];
  [v4 _setOriginalTypeName:v6];

  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)INCodableObjectAttribute;
  id v4 = [(INCodableAttribute *)&v14 dictionaryRepresentationWithLocalizer:a3];
  objc_super v5 = [(INCodableObjectAttribute *)self typeName];
  if ([v5 isEqualToString:@"Double"])
  {
    uint64_t v6 = @"Decimal";
  }
  else
  {
    if (![v5 isEqualToString:@"Long"]) {
      goto LABEL_6;
    }
    uint64_t v6 = @"Integer";
  }

  objc_super v5 = v6;
LABEL_6:
  id v7 = [(INCodableObjectAttribute *)self __INCodableDescriptionTypeKey];
  v15 = v7;
  originalTypeName = self->_originalTypeName;
  if (originalTypeName)
  {
    int v9 = 0;
  }
  else if (v5)
  {
    int v9 = 0;
    originalTypeName = v5;
  }
  else
  {
    originalTypeName = [MEMORY[0x1E4F1CA98] null];
    int v9 = 1;
  }
  v16[0] = originalTypeName;
  unsigned int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  objc_super v11 = objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v10);

  if (v9) {
  id v12 = objc_msgSend(v11, "if_dictionaryWithNonEmptyValues");
  }

  return v12;
}

- (Class)_relationshipValueTransformerClass
{
  int64_t v3 = [(INCodableObjectAttribute *)self objectClass];
  if (v3 == (objc_class *)objc_opt_class()) {
    goto LABEL_4;
  }
  id v4 = NSString;
  objc_super v5 = [(INCodableAttribute *)self _typeString];
  uint64_t v6 = [v4 stringWithFormat:@"_INCodableObjectAttributeRelationship%@ValueTransformer", v5];
  Class v7 = NSClassFromString(v6);

  if (!v7) {
    goto LABEL_4;
  }
  objc_super v8 = [MEMORY[0x1E4F28B50] bundleForClass:v7];
  int v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  if (v8 == v9)
  {
    unsigned int v10 = v7;
  }
  else
  {
LABEL_4:
    objc_opt_class();
    unsigned int v10 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (Class)objectClass
{
  v2 = [(INCodableObjectAttribute *)self valueTransformer];
  int64_t v3 = [(id)objc_opt_class() transformedValueClass];

  return (Class)v3;
}

- (int64_t)_attributeType
{
  return 4;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___INCodableObjectAttribute;
  id v17 = 0;
  Class v7 = objc_msgSendSuper2(&v16, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v17);
  id v8 = v17;
  int v9 = v8;
  if (v8)
  {
    unsigned int v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    uint64_t v11 = objc_msgSend(v6, "intents_stringForKey:", @"typeName");
    id v12 = (void *)v7[20];
    v7[20] = v11;

    uint64_t v13 = objc_msgSend(v6, "intents_stringForKey:", @"_originalTypeName");
    objc_super v14 = (void *)v7[19];
    v7[19] = v13;

    unsigned int v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionTypeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  int64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableObjectAttributeTypeKey");

  return v3;
}

- (id)__INTypeCodableDescriptionKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  int64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableObjectAttributeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  int64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableObjectAttributeTypeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  int64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableObjectAttributeKey");

  return v3;
}

- (id)__INCodableDescriptionKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  int64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableObjectAttributeKey");

  return v3;
}

@end