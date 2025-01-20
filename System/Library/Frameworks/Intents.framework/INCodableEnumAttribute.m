@interface INCodableEnumAttribute
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (Class)_relationshipValueTransformerClass;
- (Class)objectClass;
- (Class)resolutionResultClass;
- (INCodableEnum)codableEnum;
- (INCodableEnumAttribute)initWithCoder:(id)a3;
- (NSString)enumNamespace;
- (id)__INCodableDescriptionEnumTypeKey;
- (id)__INCodableDescriptionEnumTypeNamespaceKey;
- (id)__INIntentResponseCodableDescriptionEnumTypeKey;
- (id)__INIntentResponseCodableDescriptionEnumTypeNamespaceKey;
- (id)__INTypeCodableDescriptionEnumTypeKey;
- (id)__INTypeCodableDescriptionEnumTypeNamespaceKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)valueForIndex:(unint64_t)a3;
- (id)valueWithName:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)_attributeType;
- (int64_t)valueType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCodableEnum:(id)a3;
- (void)setEnumNamespace:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableEnumAttribute

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(INCodableEnumAttribute *)self __INCodableDescriptionEnumTypeNamespaceKey];
  v6 = [v4 objectForKeyedSubscript:v5];
  [(INCodableEnumAttribute *)self setEnumNamespace:v6];

  v7 = [(INCodableEnumAttribute *)self __INCodableDescriptionEnumTypeKey];
  v8 = [v4 objectForKeyedSubscript:v7];

  v9 = [(INCodableAttribute *)self _codableDescription];
  v10 = [v9 schema];

  v11 = [v10 _enums];
  v12 = [(INCodableEnumAttribute *)self enumNamespace];
  v13 = INIntentDefinitionNamespacedName((uint64_t)v12, v8);
  v14 = [v11 objectForKeyedSubscript:v13];

  if (([v10 isSystem] & 1) == 0 && !v14)
  {
    v15 = [(INCodableEnumAttribute *)self enumNamespace];
    int v16 = [v15 isEqualToString:@"System"];

    if (v16)
    {
      v17 = +[INSchema systemSchema];
      v18 = [v17 _enums];
      v19 = INIntentDefinitionNamespacedName(@"System", v8);
      v14 = [v18 objectForKeyedSubscript:v19];
    }
    else
    {
      v14 = 0;
    }
  }
  [(INCodableEnumAttribute *)self setCodableEnum:v14];
  v20.receiver = self;
  v20.super_class = (Class)INCodableEnumAttribute;
  [(INCodableAttribute *)&v20 updateWithDictionary:v4];
}

- (id)__INCodableDescriptionEnumTypeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeEnumTypeKey");

  return v3;
}

- (id)__INCodableDescriptionEnumTypeNamespaceKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeEnumTypeNamespaceKey");

  return v3;
}

- (void)setEnumNamespace:(id)a3
{
}

- (void)setCodableEnum:(id)a3
{
}

- (NSString)enumNamespace
{
  return self->_enumNamespace;
}

- (id)valueWithName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = [(INCodableEnumAttribute *)self codableEnum];
    v6 = [v5 values];

    id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v11 = [v10 name];
          char v12 = [v11 isEqualToString:v4];

          if (v12)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
        id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumNamespace, 0);

  objc_storeStrong((id *)&self->_codableEnum, 0);
}

- (id)valueForIndex:(unint64_t)a3
{
  id v4 = [(INCodableEnumAttribute *)self codableEnum];
  v5 = [v4 valueForIndex:a3];

  return v5;
}

- (INCodableEnumAttribute)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INCodableEnumAttribute;
  v5 = [(INCodableAttribute *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codableEnum"];
    [(INCodableEnumAttribute *)v5 setCodableEnum:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enumNamespace"];
    [(INCodableEnumAttribute *)v5 setEnumNamespace:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)INCodableEnumAttribute;
  id v4 = a3;
  [(INCodableAttribute *)&v7 encodeWithCoder:v4];
  v5 = [(INCodableEnumAttribute *)self codableEnum];
  [v4 encodeObject:v5 forKey:@"codableEnum"];

  v6 = [(INCodableEnumAttribute *)self enumNamespace];
  [v4 encodeObject:v6 forKey:@"enumNamespace"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)INCodableEnumAttribute;
  id v18 = 0;
  objc_super v7 = [(INCodableAttribute *)&v17 widgetPlistableRepresentationWithParameters:v6 error:&v18];
  id v8 = v18;
  if (v8)
  {
    id v9 = v8;
    if (a4)
    {
LABEL_3:
      id v9 = v9;
      id v10 = 0;
      *a4 = v9;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  v11 = [(INCodableEnumAttribute *)self codableEnum];
  id v16 = 0;
  objc_msgSend(v7, "intents_setWidgetPlistRepresentable:forKey:parameters:error:", v11, @"codableEnum", v6, &v16);
  id v9 = v16;

  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    id v10 = 0;
    goto LABEL_8;
  }
  char v12 = [(INCodableEnumAttribute *)self codableEnum];
  v13 = [v12 name];
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v13, @"enumType");

  long long v14 = [(INCodableEnumAttribute *)self enumNamespace];
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v14, @"enumNamespace");

  id v10 = v7;
  id v9 = 0;
LABEL_8:

  return v10;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)INCodableEnumAttribute;
  id v4 = [(INCodableAttribute *)&v16 dictionaryRepresentationWithLocalizer:a3];
  v5 = [(INCodableEnumAttribute *)self __INCodableDescriptionEnumTypeNamespaceKey];
  v17[0] = v5;
  id v6 = [(INCodableEnumAttribute *)self enumNamespace];
  objc_super v7 = v6;
  if (!v6)
  {
    objc_super v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[0] = v7;
  id v8 = [(INCodableEnumAttribute *)self __INCodableDescriptionEnumTypeKey];
  v17[1] = v8;
  id v9 = [(INCodableEnumAttribute *)self codableEnum];
  id v10 = [v9 name];
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[1] = v11;
  char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v13 = objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v12);

  if (!v10) {
  if (!v6)
  }

  long long v14 = objc_msgSend(v13, "if_dictionaryWithNonEmptyValues");

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (v11.receiver = self,
        v11.super_class = (Class)INCodableEnumAttribute,
        [(INCodableAttribute *)&v11 isEqual:v4]))
  {
    v5 = [(INCodableEnumAttribute *)self codableEnum];
    id v6 = [v4 codableEnum];
    if ([v5 isEqual:v6])
    {
      objc_super v7 = [(INCodableEnumAttribute *)self enumNamespace];
      id v8 = [v4 enumNamespace];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(INCodableEnumAttribute *)self codableEnum];
  uint64_t v4 = [v3 hash];
  v7.receiver = self;
  v7.super_class = (Class)INCodableEnumAttribute;
  unint64_t v5 = [(INCodableAttribute *)&v7 hash] ^ v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)INCodableEnumAttribute;
  id v4 = [(INCodableAttribute *)&v8 copyWithZone:a3];
  unint64_t v5 = [(INCodableEnumAttribute *)self codableEnum];
  [v4 setCodableEnum:v5];

  id v6 = [(INCodableEnumAttribute *)self enumNamespace];
  [v4 setEnumNamespace:v6];

  return v4;
}

- (Class)objectClass
{
  return (Class)objc_opt_class();
}

- (Class)_relationshipValueTransformerClass
{
  return (Class)objc_opt_class();
}

- (Class)resolutionResultClass
{
  return (Class)objc_opt_class();
}

- (INCodableEnum)codableEnum
{
  if (!self->_codableEnum)
  {
    v3 = [(INCodableEnumAttribute *)self enumNamespace];
    int v4 = [v3 isEqualToString:@"System"];

    if (v4)
    {
      unint64_t v5 = +[INSchema systemSchema];
      id v6 = [v5 _enums];
      objc_super v7 = [(INCodableEnumAttribute *)self enumNamespace];
      objc_super v8 = INIntentDefinitionNamespacedName(@"System", v7);
      char v9 = [v6 objectForKeyedSubscript:v8];
      codableEnum = self->_codableEnum;
      self->_codableEnum = v9;
    }
  }
  objc_super v11 = self->_codableEnum;

  return v11;
}

- (int64_t)valueType
{
  v2 = [(INCodableEnumAttribute *)self codableEnum];
  uint64_t v3 = [v2 type];

  if (v3 == 1) {
    return 204;
  }
  else {
    return 65;
  }
}

- (int64_t)_attributeType
{
  return 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___INCodableEnumAttribute;
  id v18 = 0;
  objc_super v7 = objc_msgSendSuper2(&v17, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v18);
  id v8 = v18;
  if (v8)
  {
    id v9 = v8;
    if (a4)
    {
LABEL_3:
      id v9 = v9;
      id v10 = 0;
      *a4 = v9;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  uint64_t v11 = objc_msgSend(v6, "intents_stringForKey:", @"enumNamespace");
  char v12 = (void *)v7[20];
  v7[20] = v11;

  id v16 = 0;
  uint64_t v13 = +[NSObject intents_widgetPlistRepresentableInDict:v6 key:@"codableEnum" error:&v16];
  id v9 = v16;
  long long v14 = (void *)v7[19];
  v7[19] = v13;

  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    id v10 = 0;
    goto LABEL_8;
  }
  id v10 = v7;
LABEL_8:

  return v10;
}

- (id)__INTypeCodableDescriptionEnumTypeNamespaceKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeEnumTypeNamespaceKey");

  return v3;
}

- (id)__INTypeCodableDescriptionEnumTypeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeEnumTypeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionEnumTypeNamespaceKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeEnumTypeNamespaceKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionEnumTypeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeEnumTypeKey");

  return v3;
}

@end