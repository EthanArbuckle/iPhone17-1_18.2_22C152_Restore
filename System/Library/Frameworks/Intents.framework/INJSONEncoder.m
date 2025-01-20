@interface INJSONEncoder
- (INJSONEncoder)init;
- (INJSONEncoder)initWithConfiguration:(id)a3;
- (INJSONEncoderConfiguration)_storedConfiguration;
- (INJSONEncoderConfiguration)configuration;
- (NSString)languageCode;
- (id)_encodeObject:(id)a3 codableAttribute:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeObject:(id)a3;
- (id)encodeObject:(id)a3 withCodableAttribute:(id)a4;
- (id)encodeObject:(id)a3 withCodableDescription:(id)a4;
- (void)setLanguageCode:(id)a3;
@end

@implementation INJSONEncoder

- (void).cxx_destruct
{
}

- (NSString)languageCode
{
  return [(INJSONEncoderConfiguration *)self->_configuration languageCode];
}

- (void)setLanguageCode:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [INJSONEncoder alloc];
  configuration = self->_configuration;

  return [(INJSONEncoder *)v4 initWithConfiguration:configuration];
}

- (INJSONEncoderConfiguration)_storedConfiguration
{
  return self->_configuration;
}

- (id)_encodeObject:(id)a3 codableAttribute:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v9 = v8;
      }
      else {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
    id v20 = v9;

    if ([v20 type] == 8 || objc_msgSend(v20, "type") == 7)
    {
      id v21 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v22 = v21;
      }
      else {
        v22 = 0;
      }
      id v23 = v22;

      id v14 = [(INJSONEncoder *)self encodeObject:v23];
    }
    else
    {
      id v14 = v6;
    }
    goto LABEL_59;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v7;
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

      v41 = [v20 codableDescription];
      v42 = objc_msgSend(v41, "_nullable_schema");
      v28 = [v42 _objectDescriptionForTypeOfClass:objc_opt_class()];

      if (v28)
      {
        id v43 = v28;
      }
      else
      {
        id v43 = [v20 codableDescription];
      }
      v44 = v43;
      id v14 = [(INJSONEncoder *)self encodeObject:v6 withCodableDescription:v43];

LABEL_58:
LABEL_59:

      goto LABEL_60;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = v7;
      if (v20)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v24 = +[INSchema systemSchema];
          v25 = [v24 _types];
          v26 = [v20 typeName];
          v27 = INIntentDefinitionNamespacedName(@"System", v26);
          v28 = [v25 objectForKeyedSubscript:v27];
        }
        else
        {
          v28 = 0;
          v24 = v20;
          id v20 = 0;
        }
      }
      else
      {
        v24 = 0;
        v28 = 0;
      }

      id v14 = [(INJSONEncoder *)self encodeObject:v6 withCodableDescription:v28];
      goto LABEL_58;
    }
LABEL_32:
    id v14 = 0;
    goto LABEL_60;
  }
  id v10 = v6;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    v12 = v10;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  id v14 = 0;
  if (isKindOfClass)
  {
    unint64_t v15 = [v10 integerValue];
    id v16 = v7;
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
    id v29 = v17;

    v30 = [v29 codableEnum];
    if ([v30 type] == 2)
    {
      id v47 = v29;
      id v48 = v13;
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v46 = v30;
      v32 = [v30 values];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v50 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            if ((v15 >> [v37 index]))
            {
              v38 = [v37 name];

              if (v38)
              {
                v39 = [v37 name];
                [v31 addObject:v39];
              }
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v49 objects:v53 count:16];
        }
        while (v34);
      }

      id v14 = (id)[v31 copy];
      id v29 = v47;
      id v13 = v48;
      v30 = v46;
    }
    else
    {
      v40 = [v29 valueForIndex:v15];
      id v14 = [v40 name];
    }
  }

LABEL_60:

  return v14;
}

- (INJSONEncoderConfiguration)configuration
{
  v2 = (void *)[(INJSONEncoderConfiguration *)self->_configuration copy];

  return (INJSONEncoderConfiguration *)v2;
}

- (id)encodeObject:(id)a3 withCodableAttribute:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          unint64_t v15 = -[INJSONEncoder _encodeObject:codableAttribute:](self, "_encodeObject:codableAttribute:", *(void *)(*((void *)&v18 + 1) + 8 * i), v7, (void)v18);
          if (v15) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    id v16 = (void *)[v9 copy];
  }
  else
  {

    id v16 = [(INJSONEncoder *)self _encodeObject:v8 codableAttribute:v7];
  }

  return v16;
}

- (id)encodeObject:(id)a3
{
  return [(INJSONEncoder *)self encodeObject:a3 withCodableDescription:0];
}

- (id)encodeObject:(id)a3 withCodableDescription:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
LABEL_27:
    id v7 = 0;
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && [v5 conformsToProtocol:&unk_1EDBB9D30]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = objc_msgSend(v5, "_intents_encodeWithJSONEncoder:codableDescription:", self, v6);
    goto LABEL_28;
  }
  if (!v6)
  {
    id v8 = +[INSchema systemSchema];
    id v6 = [v8 _objectDescriptionForTypeOfClass:objc_opt_class()];

    if (!v6)
    {
      if (([v5 conformsToProtocol:&unk_1EDBB9D30] & 1) != 0
        || (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v7 = objc_msgSend(v5, "_intents_encodeWithJSONEncoder:codableDescription:", self, 0);
        id v6 = 0;
        goto LABEL_28;
      }
      long long v21 = (void *)INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = v21;
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        *(_DWORD *)buf = 136315394;
        uint64_t v34 = "-[INJSONEncoder encodeObject:withCodableDescription:]";
        __int16 v35 = 2112;
        v36 = v25;
        _os_log_error_impl(&dword_18CB2F000, v23, OS_LOG_TYPE_ERROR, "%s %@ is not JSON encodable", buf, 0x16u);
      }
      id v6 = 0;
      goto LABEL_27;
    }
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v26 = v6;
  id v10 = [v6 attributes];
  uint64_t v11 = [v10 allValues];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v17 = [v16 propertyName];
        if (([v17 hasPrefix:@"_"] & 1) == 0
          && objc_msgSend(v5, "_intents_isValidKey:", v17))
        {
          long long v18 = [v5 valueForKey:v17];
          long long v19 = [(INJSONEncoder *)self encodeObject:v18 withCodableAttribute:v16];
          objc_msgSend(v9, "if_setObjectIfNonNil:forKey:", v19, v17);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }

  id v6 = v26;
  long long v20 = [v26 semanticRoot];
  if (v20) {
    [v9 setObject:v20 forKey:@"_type"];
  }
  id v7 = (void *)[v9 copy];

LABEL_28:

  return v7;
}

- (INJSONEncoder)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INJSONEncoder;
  id v5 = [(INJSONEncoder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (INJSONEncoderConfiguration *)v6;
  }
  return v5;
}

- (INJSONEncoder)init
{
  v3 = objc_alloc_init(INJSONEncoderConfiguration);
  id v4 = [(INJSONEncoder *)self initWithConfiguration:v3];

  return v4;
}

@end