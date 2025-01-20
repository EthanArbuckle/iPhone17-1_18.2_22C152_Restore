@interface INJSONDecoder
- (id)_decodeObjectOfClass:(Class)a3 withCodableDescription:(id)a4 from:(id)a5 outCodableDescription:(id *)a6;
- (id)_decodeWithCodableAttribute:(id)a3 from:(id)a4;
- (id)decodeObjectOfClass:(Class)a3 from:(id)a4;
- (id)decodeObjectsOfClass:(Class)a3 from:(id)a4;
- (id)decodeWithCodableAttribute:(id)a3 from:(id)a4;
- (void)decodeObject:(id)a3 withCodableDescription:(id)a4 from:(id)a5;
@end

@implementation INJSONDecoder

- (id)_decodeWithCodableAttribute:(id)a3 from:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
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
    id v14 = v9;

    if ([v14 type] == 8 || objc_msgSend(v14, "type") == 7)
    {
      id v15 = [(INJSONDecoder *)self decodeObjectOfClass:objc_opt_class() from:v7];
    }
    else
    {
      id v15 = v7;
    }
    v18 = v15;
LABEL_46:

    goto LABEL_70;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v6;
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
        id v41 = v17;

        v42 = +[INSchema systemSchema];
        v43 = [v42 _types];
        v44 = [v41 typeName];
        v45 = INIntentDefinitionNamespacedName(@"System", v44);
        v46 = [v43 objectForKeyedSubscript:v45];

        uint64_t v47 = [v41 objectClass];
        v18 = [(INJSONDecoder *)self _decodeObjectOfClass:v47 withCodableDescription:v46 from:v7 outCodableDescription:0];
      }
      else
      {
        v18 = 0;
      }
      goto LABEL_70;
    }
    id v12 = v6;
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

    id v28 = [v14 codableDescription];
    id v53 = 0;
    v18 = -[INJSONDecoder _decodeObjectOfClass:withCodableDescription:from:outCodableDescription:](self, "_decodeObjectOfClass:withCodableDescription:from:outCodableDescription:", [v14 objectClass], v28, v7, &v53);
    id v29 = v53;
    v30 = v29;
    if (v29 && v29 != v28)
    {
      [v14 setCodableDescription:v29];
      v31 = [v30 typeName];
      [v14 setObjectTypeName:v31];
    }
    goto LABEL_46;
  }
  id v10 = v6;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  id v19 = v11;

  v20 = [v19 codableEnum];
  uint64_t v21 = [v20 type];
  id v22 = v7;
  v23 = v22;
  if (v21 == 2)
  {
    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v24 = v23;
      }
      else {
        v24 = 0;
      }
    }
    else
    {
      v24 = 0;
    }
    v51 = v20;
    id v52 = v6;
    id v32 = v24;

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v33 = v32;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = 0;
      uint64_t v37 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v55 != v37) {
            objc_enumerationMutation(v33);
          }
          id v39 = *(id *)(*((void *)&v54 + 1) + 8 * i);
          if (v39)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v40 = [v19 valueWithName:v39];
              v36 |= 1 << [v40 index];
            }
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v35);
    }
    else
    {
      uint64_t v36 = 0;
    }

    v18 = [NSNumber numberWithUnsignedInteger:v36];

    id v6 = v52;
    v20 = v51;
  }
  else
  {
    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v25 = v10;
      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v26 = v25;
        }
        else {
          v26 = 0;
        }
      }
      else
      {
        v26 = 0;
      }
      id v48 = v26;

      v49 = [v48 valueWithName:v23];

      if (v49) {
        uint64_t v27 = [v49 index];
      }
      else {
        uint64_t v27 = 0;
      }
    }
    else
    {
      uint64_t v27 = 0;
    }

    v18 = [NSNumber numberWithInteger:v27];
  }

LABEL_70:

  return v18;
}

- (id)_decodeObjectOfClass:(Class)a3 withCodableDescription:(id)a4 from:(id)a5 outCodableDescription:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
LABEL_26:
    id v12 = 0;
    goto LABEL_27;
  }
  if ((Class)objc_opt_class() != a3
    && [(objc_class *)a3 conformsToProtocol:&unk_1EDBB9D30]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v12 = [(objc_class *)a3 _intents_decodeWithJSONDecoder:self codableDescription:v10 from:v11];
    goto LABEL_27;
  }
  if (!v10)
  {
    v13 = +[INSchema systemSchema];
    id v10 = [v13 _objectDescriptionForTypeOfClass:a3];

    if (!v10)
    {
      if (([(objc_class *)a3 conformsToProtocol:&unk_1EDBB9D30] & 1) != 0
        || (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v12 = [(objc_class *)a3 _intents_decodeWithJSONDecoder:self codableDescription:0 from:v11];
        id v10 = 0;
        goto LABEL_27;
      }
      uint64_t v21 = (void *)INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        v23 = v21;
        v24 = NSStringFromClass(a3);
        int v25 = 136315394;
        v26 = "-[INJSONDecoder _decodeObjectOfClass:withCodableDescription:from:outCodableDescription:]";
        __int16 v27 = 2112;
        id v28 = v24;
        _os_log_error_impl(&dword_18CB2F000, v23, OS_LOG_TYPE_ERROR, "%s %@ is not JSON decodable", (uint8_t *)&v25, 0x16u);
      }
      id v10 = 0;
      goto LABEL_26;
    }
  }
  if ((Class)objc_opt_class() == a3)
  {
    id v14 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    v17 = [v16 objectForKeyedSubscript:@"_type"];

    if (v17)
    {
      v18 = objc_msgSend(v10, "_nullable_schema");
      id v19 = [v18 _objectDescriptionWithSemanticKeypath:v17];

      if (v19)
      {
        id v20 = v19;

        id v10 = v20;
      }
    }
    id v12 = [[INCustomObject alloc] initWithObject:0 codableDescription:v10];
  }
  else
  {
    id v12 = (INCustomObject *)objc_alloc_init(a3);
  }
  [(INJSONDecoder *)self decodeObject:v12 withCodableDescription:v10 from:v11];
  if (a6)
  {
    id v10 = v10;
    *a6 = v10;
  }
LABEL_27:

  return v12;
}

- (id)decodeObjectsOfClass:(Class)a3 from:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    id v8 = v6;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      id v10 = v8;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (isKindOfClass)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v12 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = -[INJSONDecoder decodeObjectOfClass:from:](self, "decodeObjectOfClass:from:", a3, *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
            if (v16) {
              [v7 addObject:v16];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v13);
      }
    }
    else
    {
      v18 = [(INJSONDecoder *)self decodeObjectOfClass:a3 from:v8];
      if (v18) {
        [v7 addObject:v18];
      }
    }
    if (objc_msgSend(v7, "count", (void)v20)) {
      v17 = (void *)[v7 copy];
    }
    else {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)decodeObjectOfClass:(Class)a3 from:(id)a4
{
  return [(INJSONDecoder *)self _decodeObjectOfClass:a3 withCodableDescription:0 from:a4 outCodableDescription:0];
}

- (id)decodeWithCodableAttribute:(id)a3 from:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;
  id v10 = v6;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  id v12 = v11;

  uint64_t v13 = [v12 codableEnum];

  if (!v9 || v13 && [v13 type] == 2)
  {
    uint64_t v14 = [(INJSONDecoder *)self _decodeWithCodableAttribute:v10 from:v7];
  }
  else
  {
    long long v23 = v13;
    id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v16 = v9;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = [(INJSONDecoder *)self _decodeWithCodableAttribute:v10 from:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v18);
    }

    uint64_t v14 = (void *)[v15 copy];
    uint64_t v13 = v23;
  }

  return v14;
}

- (void)decodeObject:(id)a3 withCodableDescription:(id)a4 from:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && [v7 conformsToProtocol:&unk_1EDBB9D30]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "_intents_decodeWithJSONDecoder:codableDescription:from:", self, v8, v9);
LABEL_5:

    goto LABEL_23;
  }
  if (v8
    || (+[INSchema systemSchema],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 _objectDescriptionForTypeOfClass:objc_opt_class()],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v10,
        v8))
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = [v8 attributes];
    id v12 = [v11 allValues];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v18 = [v17 propertyName];
          if (objc_msgSend(v7, "_intents_isValidKey:", v18))
          {
            id v19 = v9;
            if (v9)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                long long v20 = v19;
              }
              else {
                long long v20 = 0;
              }
            }
            else
            {
              long long v20 = 0;
            }
            id v21 = v20;

            long long v22 = [v21 objectForKeyedSubscript:v18];

            long long v23 = [(INJSONDecoder *)self decodeWithCodableAttribute:v17 from:v22];

            long long v24 = [v7 _setterForProperty:v18];
            objc_msgSend(v7, "if_setValueIfNonNil:forKey:", v23, v24);
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v14);
    }
  }
  else
  {
    if (([v7 conformsToProtocol:&unk_1EDBB9D30] & 1) == 0)
    {
      long long v25 = (void *)INSiriLogContextIntents;
      if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      id v8 = v25;
      long long v26 = (objc_class *)objc_opt_class();
      long long v27 = NSStringFromClass(v26);
      *(_DWORD *)buf = 136315394;
      uint64_t v36 = "-[INJSONDecoder decodeObject:withCodableDescription:from:]";
      __int16 v37 = 2112;
      v38 = v27;
      _os_log_error_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_ERROR, "%s %@ is not JSON decodable", buf, 0x16u);

      goto LABEL_5;
    }
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v7, "_intents_decodeWithJSONDecoder:codableDescription:from:", self, 0, v9);
    }
  }
LABEL_23:
}

@end