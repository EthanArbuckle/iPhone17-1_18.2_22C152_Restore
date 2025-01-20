@interface INCodableCustomObjectAttribute
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (Class)_relationshipValueTransformerClass;
- (Class)_unsafeObjectClass;
- (Class)objectClass;
- (Class)resolutionResultClass;
- (INCodableCustomObjectAttribute)initWithCoder:(id)a3;
- (INCodableDescription)codableDescription;
- (NSString)objectTypeName;
- (NSString)objectTypeNamespace;
- (id)__INCodableDescriptionObjectTypeKey;
- (id)__INCodableDescriptionObjectTypeNamespaceKey;
- (id)__INIntentResponseCodableDescriptionObjectTypeKey;
- (id)__INIntentResponseCodableDescriptionObjectTypeNamespaceKey;
- (id)__INTypeCodableDescriptionObjectTypeKey;
- (id)__INTypeCodableDescriptionObjectTypeNamespaceKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)valueTransformer;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)_attributeType;
- (int64_t)valueType;
- (unint64_t)hash;
- (void)_assignCodableDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setCodableDescription:(id)a3;
- (void)setObjectTypeName:(id)a3;
- (void)setObjectTypeNamespace:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableCustomObjectAttribute

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(INCodableCustomObjectAttribute *)self __INCodableDescriptionObjectTypeKey];
  v6 = [v4 objectForKeyedSubscript:v5];
  objectTypeName = self->_objectTypeName;
  self->_objectTypeName = v6;

  v8 = [(INCodableCustomObjectAttribute *)self __INCodableDescriptionObjectTypeNamespaceKey];
  v9 = [v4 objectForKeyedSubscript:v8];
  objectTypeNamespace = self->_objectTypeNamespace;
  self->_objectTypeNamespace = v9;

  [(INCodableCustomObjectAttribute *)self _assignCodableDescription];
  v11.receiver = self;
  v11.super_class = (Class)INCodableCustomObjectAttribute;
  [(INCodableObjectAttribute *)&v11 updateWithDictionary:v4];
}

- (id)__INCodableDescriptionObjectTypeNamespaceKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableCustomObjectAttributeObjectTypeNamespaceKey");

  return v3;
}

- (id)__INCodableDescriptionObjectTypeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableCustomObjectAttributeObjectTypeKey");

  return v3;
}

- (unint64_t)hash
{
  v3 = [(INCodableCustomObjectAttribute *)self objectTypeNamespace];
  uint64_t v4 = [v3 hash];
  v5 = [(INCodableCustomObjectAttribute *)self objectTypeName];
  uint64_t v6 = [v5 hash] ^ v4;
  v9.receiver = self;
  v9.super_class = (Class)INCodableCustomObjectAttribute;
  unint64_t v7 = v6 ^ [(INCodableObjectAttribute *)&v9 hash];

  return v7;
}

id __50__INCodableCustomObjectAttribute_valueTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v31 = [v3 className];
    uint64_t v4 = NSClassFromString(v31);
    v32 = v4;
    if (v4) {
      id v5 = objc_alloc_init(v4);
    }
    else {
      id v5 = [[INCustomObject alloc] _initWithCodableDescription:*(void *)(a1 + 32)];
    }
    uint64_t v6 = v5;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    unint64_t v7 = [*(id *)(a1 + 32) attributes];
    v8 = [v7 allValues];

    id obj = v8;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v36;
      unint64_t v12 = 0x1E4F28000uLL;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(obj);
          }
          v14 = [*(id *)(*((void *)&v35 + 1) + 8 * i) propertyName];
          v15 = [v34 valueForPropertyNamed:v14];
          if (v15)
          {
            v16 = [*(id *)(v12 + 2896) bundleForClass:objc_opt_class()];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v17 = v6;
              v18 = v17;
              if (v6)
              {
                if ([v17 conformsToProtocol:&unk_1EDBB2340]) {
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
              id v25 = v19;

              if ([&unk_1EDBAB100 containsObject:v14])
              {
                [v18 setValue:v15 forKey:v14];
              }
              else if (v25)
              {
                [v25 setValue:v15 forProperty:v14];
              }

              unint64_t v12 = 0x1E4F28000;
            }
            else
            {
              v20 = [*(id *)(v12 + 2896) bundleForClass:objc_opt_class()];

              if (v16 != v20)
              {
                v21 = [v16 bundlePath];
                int v22 = [v21 hasPrefix:@"/System/Library/"];

                v23 = (void *)INSiriLogContextIntents;
                BOOL v24 = os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT);
                if (!v22)
                {
                  unint64_t v12 = 0x1E4F28000;
                  if (v24)
                  {
                    v28 = v23;
                    unint64_t v12 = 0x1E4F28000;
                    uint64_t v29 = objc_opt_class();
                    *(_DWORD *)buf = 136315650;
                    v40 = "-[INCodableCustomObjectAttribute valueTransformer]_block_invoke";
                    __int16 v41 = 2114;
                    uint64_t v42 = v29;
                    __int16 v43 = 2114;
                    v44 = v32;
                    _os_log_fault_impl(&dword_18CB2F000, v28, OS_LOG_TYPE_FAULT, "%s Use of %{public}@ on a class outside of system frameworks: %{public}@", buf, 0x20u);
                  }
                  goto LABEL_30;
                }
                unint64_t v12 = 0x1E4F28000;
                if (v24)
                {
                  v26 = v23;
                  unint64_t v12 = 0x1E4F28000;
                  uint64_t v27 = objc_opt_class();
                  *(_DWORD *)buf = 136315650;
                  v40 = "-[INCodableCustomObjectAttribute valueTransformer]_block_invoke_2";
                  __int16 v41 = 2114;
                  uint64_t v42 = v27;
                  __int16 v43 = 2114;
                  v44 = v32;
                  _os_log_fault_impl(&dword_18CB2F000, v26, OS_LOG_TYPE_FAULT, "%s Use of %{public}@ on a class outside of Intents framework: %{public}@", buf, 0x20u);
                }
              }
              [v6 setValue:v15 forKey:v14];
            }
LABEL_30:
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v10);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_assignCodableDescription
{
  v3 = [(INCodableAttribute *)self _codableDescription];
  id v15 = [v3 schema];

  uint64_t v4 = [v15 _types];
  id v5 = [(INCodableCustomObjectAttribute *)self objectTypeNamespace];
  uint64_t v6 = [(INCodableCustomObjectAttribute *)self objectTypeName];
  unint64_t v7 = INIntentDefinitionNamespacedName((uint64_t)v5, v6);
  v8 = [v4 objectForKeyedSubscript:v7];

  if (([v15 isSystem] & 1) == 0 && !v8)
  {
    uint64_t v9 = [(INCodableCustomObjectAttribute *)self objectTypeNamespace];
    int v10 = [v9 isEqualToString:@"System"];

    if (v10)
    {
      uint64_t v11 = +[INSchema systemSchema];
      unint64_t v12 = [v11 _types];
      v13 = [(INCodableCustomObjectAttribute *)self objectTypeName];
      v14 = INIntentDefinitionNamespacedName(@"System", v13);
      v8 = [v12 objectForKeyedSubscript:v14];
    }
    else
    {
      v8 = 0;
    }
  }
  objc_storeWeak((id *)&self->_codableDescription, v8);
}

- (id)valueTransformer
{
  v3 = [(INCodableCustomObjectAttribute *)self codableDescription];
  uint64_t v4 = (void *)MEMORY[0x1E4F29248];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__INCodableCustomObjectAttribute_valueTransformer__block_invoke;
  v11[3] = &unk_1E551B580;
  id v12 = v3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__INCodableCustomObjectAttribute_valueTransformer__block_invoke_2;
  v8[3] = &unk_1E551B5A8;
  id v9 = v12;
  int v10 = self;
  id v5 = v12;
  uint64_t v6 = objc_msgSend(v4, "if_transformerUsingForwardTransformation:reverseTransformation:", v11, v8);

  return v6;
}

- (INCodableDescription)codableDescription
{
  WeakRetained = objc_loadWeakRetained((id *)&self->_codableDescription);
  if (!WeakRetained)
  {
    uint64_t v4 = [(INCodableCustomObjectAttribute *)self objectTypeNamespace];
    int v5 = [v4 isEqualToString:@"System"];

    if (v5)
    {
      uint64_t v6 = +[INSchema systemSchema];
      unint64_t v7 = [v6 _types];
      v8 = [(INCodableCustomObjectAttribute *)self objectTypeName];
      id v9 = INIntentDefinitionNamespacedName(@"System", v8);
      WeakRetained = [v7 objectForKeyedSubscript:v9];
    }
    else
    {
      WeakRetained = 0;
    }
  }

  return (INCodableDescription *)WeakRetained;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)objectTypeNamespace
{
  return self->_objectTypeNamespace;
}

- (NSString)objectTypeName
{
  return self->_objectTypeName;
}

- (void)setCodableDescription:(id)a3
{
}

- (int64_t)valueType
{
  return 225;
}

- (Class)resolutionResultClass
{
  return (Class)objc_opt_class();
}

- (INCodableCustomObjectAttribute)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INCodableCustomObjectAttribute;
  int v5 = [(INCodableObjectAttribute *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectTypeName"];
    objectTypeName = v5->_objectTypeName;
    v5->_objectTypeName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectTypeNamespace"];
    objectTypeNamespace = v5->_objectTypeNamespace;
    v5->_objectTypeNamespace = (NSString *)v8;

    int v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codableDescription"];
    objc_storeWeak((id *)&v5->_codableDescription, v10);
  }
  return v5;
}

INCodable *__50__INCodableCustomObjectAttribute_valueTransformer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v4 = [[INCodable alloc] initWithCodableDescription:*(void *)(a1 + 32) data:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v5 = objc_msgSend(*(id *)(a1 + 32), "attributes", 0);
    uint64_t v6 = [v5 allValues];

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
          uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) propertyName];
          objc_super v12 = [v3 valueForKey:v11];
          [(INCodable *)v4 setValue:v12 forPropertyNamed:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)INCodableCustomObjectAttribute;
  id v12 = 0;
  uint64_t v6 = [(INCodableObjectAttribute *)&v11 widgetPlistableRepresentationWithParameters:a3 error:&v12];
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
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_objectTypeName, @"objectTypeName");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_objectTypeNamespace, @"objectTypeNamespace");
    id v9 = v6;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectTypeNamespace, 0);
  objc_storeStrong((id *)&self->_objectTypeName, 0);

  objc_destroyWeak((id *)&self->_codableDescription);
}

- (void)setObjectTypeNamespace:(id)a3
{
}

- (void)setObjectTypeName:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)INCodableCustomObjectAttribute;
  id v4 = a3;
  [(INCodableObjectAttribute *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_objectTypeName, @"objectTypeName", v6.receiver, v6.super_class);
  [v4 encodeObject:self->_objectTypeNamespace forKey:@"objectTypeNamespace"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_codableDescription);
  [v4 encodeConditionalObject:WeakRetained forKey:@"codableDescription"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)INCodableCustomObjectAttribute;
  id v4 = [(INCodableObjectAttribute *)&v9 copyWithZone:a3];
  int v5 = [(INCodableCustomObjectAttribute *)self objectTypeName];
  [v4 setObjectTypeName:v5];

  objc_super v6 = [(INCodableCustomObjectAttribute *)self objectTypeNamespace];
  [v4 setObjectTypeNamespace:v6];

  id v7 = [(INCodableCustomObjectAttribute *)self codableDescription];
  [v4 setCodableDescription:v7];

  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)INCodableCustomObjectAttribute;
  id v4 = [(INCodableObjectAttribute *)&v15 dictionaryRepresentationWithLocalizer:a3];
  int v5 = [(INCodableCustomObjectAttribute *)self __INCodableDescriptionObjectTypeNamespaceKey];
  v16[0] = v5;
  objc_super v6 = [(INCodableCustomObjectAttribute *)self objectTypeNamespace];
  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v7;
  uint64_t v8 = [(INCodableCustomObjectAttribute *)self __INCodableDescriptionObjectTypeKey];
  v16[1] = v8;
  objc_super v9 = [(INCodableCustomObjectAttribute *)self objectTypeName];
  int v10 = v9;
  if (!v9)
  {
    int v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v10;
  objc_super v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  id v12 = objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v11);

  if (!v9) {
  if (!v6)
  }

  v13 = objc_msgSend(v12, "if_dictionaryWithNonEmptyValues");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)INCodableCustomObjectAttribute;
  if ([(INCodableObjectAttribute *)&v16 isEqual:v5])
  {
    objc_super v6 = [(INCodableCustomObjectAttribute *)self objectTypeName];
    if (v6 || ([v5 objectTypeName], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v7 = [(INCodableCustomObjectAttribute *)self objectTypeName];
      uint64_t v8 = [v5 objectTypeName];
      char v9 = [v7 isEqual:v8];

      if (v6)
      {
LABEL_9:

        objc_super v11 = [(INCodableCustomObjectAttribute *)self objectTypeNamespace];
        if (v11 || ([v5 objectTypeNamespace], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v12 = [(INCodableCustomObjectAttribute *)self objectTypeNamespace];
          v13 = [v5 objectTypeNamespace];
          char v14 = [v12 isEqual:v13];

          if (v11)
          {
LABEL_15:

            char v10 = v9 & v14;
            goto LABEL_16;
          }
        }
        else
        {
          char v14 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      char v9 = 1;
    }

    goto LABEL_9;
  }
  char v10 = 0;
LABEL_16:

  return v10;
}

- (Class)_unsafeObjectClass
{
  id v3 = [(INCodableCustomObjectAttribute *)self objectClass];
  if (v3 == (objc_class *)objc_opt_class())
  {
    id v4 = [(INCodableCustomObjectAttribute *)self codableDescription];
    id v5 = [v4 className];
    id v3 = NSClassFromString(v5);
  }

  return v3;
}

- (Class)_relationshipValueTransformerClass
{
  return (Class)objc_opt_class();
}

- (Class)objectClass
{
  id v3 = [(INCodableCustomObjectAttribute *)self objectTypeNamespace];
  int v4 = [v3 isEqualToString:@"System"];

  if (v4)
  {
    id v5 = +[INSchema systemSchema];
    objc_super v6 = [v5 _types];
    id v7 = [(INCodableCustomObjectAttribute *)self objectTypeName];
    uint64_t v8 = INIntentDefinitionNamespacedName(@"System", v7);
    char v9 = [v6 objectForKeyedSubscript:v8];

    char v10 = [v9 className];

    if (v10)
    {
      objc_super v11 = [v9 className];
      id v12 = NSClassFromString(v11);

      if (v12) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v12 = objc_opt_class();
LABEL_7:

  return (Class)v12;
}

- (int64_t)_attributeType
{
  return 5;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___INCodableCustomObjectAttribute;
  id v17 = 0;
  id v7 = objc_msgSendSuper2(&v16, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v17);
  id v8 = v17;
  char v9 = v8;
  if (v8)
  {
    char v10 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    uint64_t v11 = objc_msgSend(v6, "intents_stringForKey:", @"objectTypeName");
    id v12 = (void *)v7[22];
    v7[22] = v11;

    uint64_t v13 = objc_msgSend(v6, "intents_stringForKey:", @"objectTypeNamespace");
    char v14 = (void *)v7[23];
    v7[23] = v13;

    char v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionObjectTypeNamespaceKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableCustomObjectAttributeObjectTypeNamespaceKey");

  return v3;
}

- (id)__INTypeCodableDescriptionObjectTypeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableCustomObjectAttributeObjectTypeKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionObjectTypeNamespaceKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableCustomObjectAttributeObjectTypeNamespaceKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionObjectTypeKey
{
  v2 = [(INCodableAttribute *)self _codableDescription];
  id v3 = objc_msgSend((id)objc_opt_class(), "__INCodableCustomObjectAttributeObjectTypeKey");

  return v3;
}

@end