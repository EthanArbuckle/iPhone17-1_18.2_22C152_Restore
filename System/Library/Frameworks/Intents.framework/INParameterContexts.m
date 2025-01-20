@interface INParameterContexts
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)_isEmpty;
- (NSDictionary)_operatorsDictionary;
- (NSDictionary)_suggestedValuesDictionary;
- (NSDictionary)_typedSuggestedValuesDictionary;
- (id)_initWithIntent:(id)a3 decoder:(id)a4 JSONDictionary:(id)a5;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)valueForUndefinedKey:(id)a3;
- (void)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (void)_setOperatorsDictionary:(id)a3;
- (void)_setSuggestedValuesDictionary:(id)a3;
- (void)_setTypedSuggestedValuesDictionary:(id)a3;
- (void)_updateOperatorsForIntent:(id)a3 JSONDictionary:(id)a4;
- (void)_updateSuggestedValuesForIntent:(id)a3 decoder:(id)a4 JSONDictionary:(id)a5;
@end

@implementation INParameterContexts

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operatorsDictionary, 0);
  objc_storeStrong((id *)&self->_typedSuggestedValuesDictionary, 0);

  objc_storeStrong((id *)&self->_suggestedValuesDictionary, 0);
}

- (void)_setOperatorsDictionary:(id)a3
{
}

- (NSDictionary)_operatorsDictionary
{
  return self->_operatorsDictionary;
}

- (void)_setTypedSuggestedValuesDictionary:(id)a3
{
}

- (NSDictionary)_typedSuggestedValuesDictionary
{
  return self->_typedSuggestedValuesDictionary;
}

- (void)_setSuggestedValuesDictionary:(id)a3
{
}

- (NSDictionary)_suggestedValuesDictionary
{
  return self->_suggestedValuesDictionary;
}

- (void)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v30 = a4;
  id v7 = a5;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v26 = v8;
  v9 = [v26 objectForKey:@"suggestedValues"];
  v28 = v7;
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

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [v11 allKeys];
  uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        v18 = [v11 objectForKeyedSubscript:v17];
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

        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __78__INParameterContexts__intents_decodeWithJSONDecoder_codableDescription_from___block_invoke;
        v32[3] = &unk_1E5518A58;
        id v33 = v31;
        id v34 = v30;
        uint64_t v35 = v17;
        v21 = objc_msgSend(v20, "if_map:", v32);

        objc_msgSend(v12, "if_setObjectIfNonNil:forKey:", v21, v17);
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v14);
  }

  v22 = (NSDictionary *)[v12 copy];
  suggestedValuesDictionary = self->_suggestedValuesDictionary;
  self->_suggestedValuesDictionary = v22;

  v24 = [v26 objectForKey:@"operators"];
  operatorsDictionary = self->_operatorsDictionary;
  self->_operatorsDictionary = v24;
}

id __78__INParameterContexts__intents_decodeWithJSONDecoder_codableDescription_from___block_invoke(void *a1, void *a2)
{
  v2 = (void *)a1[4];
  v3 = (void *)a1[5];
  uint64_t v4 = a1[6];
  id v5 = a2;
  v6 = [v3 attributeByName:v4];
  id v7 = [v2 decodeWithCodableAttribute:v6 from:v5];

  return v7;
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v6 = a4;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(NSDictionary *)self->_suggestedValuesDictionary allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = [(NSDictionary *)self->_suggestedValuesDictionary objectForKeyedSubscript:v12];
        uint64_t v14 = [v6 attributeByName:v12];
        uint64_t v15 = [v19 encodeObject:v13 withCodableAttribute:v14];

        objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, v12);
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  [v17 setValue:v7 forKey:@"suggestedValues"];
  objc_msgSend(v17, "if_setObjectIfNonNil:forKey:", self->_operatorsDictionary, @"operators");

  return v17;
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasPrefix:@"suggestedValuesFor"])
  {
    id v5 = [v4 substringFromIndex:objc_msgSend(@"suggestedValuesFor", "length")];
    id v6 = objc_msgSend(v5, "if_ASCIIStringByLowercasingFirstCharacter");

    typedSuggestedValuesDictionary = self->_typedSuggestedValuesDictionary;
    if (!typedSuggestedValuesDictionary)
    {
      uint64_t v25 = v6;
      id v26 = v4;
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_suggestedValuesDictionary, "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v9 = [(NSDictionary *)self->_suggestedValuesDictionary allKeys];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v29 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            uint64_t v15 = -[NSDictionary objectForKey:](self->_suggestedValuesDictionary, "objectForKey:", v14, v25, v26);
            if (v15)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v16 = v15;
              }
              else {
                v16 = 0;
              }
            }
            else
            {
              v16 = 0;
            }
            id v17 = v16;

            v18 = objc_msgSend(v17, "if_map:", &__block_literal_global_40135);

            [v8 setValue:v18 forKey:v14];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v11);
      }

      id v19 = (NSDictionary *)[v8 copy];
      long long v20 = self->_typedSuggestedValuesDictionary;
      self->_typedSuggestedValuesDictionary = v19;

      typedSuggestedValuesDictionary = self->_typedSuggestedValuesDictionary;
      id v6 = v25;
      id v4 = v26;
    }
    long long v21 = -[NSDictionary objectForKey:](typedSuggestedValuesDictionary, "objectForKey:", v6, v25, v26);
  }
  else if ([v4 hasPrefix:@"operatorsFor"])
  {
    long long v22 = [v4 substringFromIndex:objc_msgSend(@"operatorsFor", "length")];
    long long v23 = objc_msgSend(v22, "if_ASCIIStringByLowercasingFirstCharacter");

    long long v21 = [(NSDictionary *)self->_operatorsDictionary objectForKey:v23];
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)INParameterContexts;
    long long v21 = [(INParameterContexts *)&v27 valueForUndefinedKey:v4];
  }

  return v21;
}

id __44__INParameterContexts_valueForUndefinedKey___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    INTypedObjectWithCustomObject(v2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = v2;
  }
  id v4 = v3;

  return v4;
}

- (BOOL)_isEmpty
{
  id v3 = [(NSDictionary *)self->_suggestedValuesDictionary allKeys];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(NSDictionary *)self->_operatorsDictionary allKeys];
    BOOL v4 = [v5 count] == 0;
  }
  return v4;
}

- (void)_updateSuggestedValuesForIntent:(id)a3 decoder:(id)a4 JSONDictionary:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __78__INParameterContexts__updateSuggestedValuesForIntent_decoder_JSONDictionary___block_invoke;
  v55[3] = &unk_1E55189E8;
  id v39 = v8;
  id v56 = v39;
  v43 = v7;
  v44 = (void (**)(void, void, void))MEMORY[0x192F984C0](v55);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v11 = [v7 _codableDescription];
  uint64_t v12 = [v11 attributes];
  uint64_t v13 = [v12 allValues];

  id obj = v13;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id v41 = v10;
    uint64_t v16 = *(void *)v52;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v52 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v51 + 1) + 8 * v17);
        id v19 = [v18 propertyName];
        long long v20 = [v9 objectForKeyedSubscript:v19];

        if (v20)
        {
          if ([v18 modifier])
          {
            long long v21 = [v9 objectForKeyedSubscript:v19];
            if (v21)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                long long v22 = v21;
              }
              else {
                long long v22 = 0;
              }
            }
            else
            {
              long long v22 = 0;
            }
            id v27 = v22;

            long long v28 = ((void (**)(void, id, void *))v44)[2](v44, v27, v18);

            uint64_t v29 = [v18 objectClass];
            if (v29 != objc_opt_class()) {
              goto LABEL_31;
            }
            long long v30 = [v43 valueForKey:v19];
            if (v30)
            {
              objc_opt_class();
              long long v31 = (objc_opt_isKindOfClass() & 1) != 0 ? v30 : 0;
            }
            else
            {
              long long v31 = 0;
            }
            id v35 = v31;

            [v35 setAlternatives:v28];
            if (!v35) {
              goto LABEL_31;
            }
          }
          else
          {
            id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            uint64_t v25 = [v9 objectForKeyedSubscript:v19];
            if (v25)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v26 = v25;
              }
              else {
                id v26 = 0;
              }
            }
            else
            {
              id v26 = 0;
            }
            id v32 = v26;

            v45[0] = MEMORY[0x1E4F143A8];
            v45[1] = 3221225472;
            v45[2] = __78__INParameterContexts__updateSuggestedValuesForIntent_decoder_JSONDictionary___block_invoke_2;
            v45[3] = &unk_1E5518A10;
            v50 = v44;
            v45[4] = v18;
            id v33 = v23;
            id v46 = v33;
            id v47 = v43;
            id v48 = v19;
            id v34 = v24;
            id v49 = v34;
            [v32 enumerateObjectsUsingBlock:v45];

            if ([v33 count]) {
              long long v28 = (void *)[v33 copy];
            }
            else {
              long long v28 = 0;
            }
            id v10 = v41;
            if ([v34 count]) {
              id v35 = (id)[v34 copy];
            }
            else {
              id v35 = 0;
            }

            if (!v35) {
              goto LABEL_31;
            }
          }
          [v43 setValue:v35 forKey:v19];

LABEL_31:
          objc_msgSend(v10, "if_setObjectIfNonNil:forKey:", v28, v19);
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v36 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      uint64_t v15 = v36;
    }
    while (v36);
  }

  long long v37 = (NSDictionary *)[v10 copy];
  suggestedValuesDictionary = self->_suggestedValuesDictionary;
  self->_suggestedValuesDictionary = v37;
}

id __78__INParameterContexts__updateSuggestedValuesForIntent_decoder_JSONDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = [v5 objectForKeyedSubscript:@"suggestedValues"];
    id v20 = v5;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
    id v11 = v9;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v21 + 1) + 8 * i) objectForKeyedSubscript:@"value"];
          if (v17)
          {
            v18 = [*(id *)(a1 + 32) decodeWithCodableAttribute:v6 from:v17];
            objc_msgSend(v7, "if_addObjectIfNonNil:", v18);
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    if ([v7 count]) {
      id v10 = (void *)[v7 copy];
    }
    else {
      id v10 = 0;
    }
    id v5 = v20;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __78__INParameterContexts__updateSuggestedValuesForIntent_decoder_JSONDictionary___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 72);
  id v17 = v5;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v17;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  id v9 = (*(void (**)(uint64_t, id, void))(v6 + 16))(v6, v8, *(void *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "if_addObjectIfNonNil:", v9);
  uint64_t v10 = [*(id *)(a1 + 32) objectClass];
  if (v10 == objc_opt_class())
  {
    id v11 = [*(id *)(a1 + 48) valueForKey:*(void *)(a1 + 56)];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
    id v13 = v12;

    if ([v13 count] > a3)
    {
      uint64_t v14 = [v13 objectAtIndexedSubscript:a3];
      if (v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = 0;
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
      id v16 = v15;

      [v16 setAlternatives:v9];
      [*(id *)(a1 + 64) addObject:v16];
    }
  }
}

- (void)_updateOperatorsForIntent:(id)a3 JSONDictionary:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = [v5 _codableDescription];
  id v9 = [v8 attributes];
  long long v23 = objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [v5 _codableDescription];
  id v11 = [v10 attributes];
  id v12 = [v11 allValues];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v24 + 1) + 8 * i) propertyName];
        v18 = [v6 objectForKeyedSubscript:v17];
        if (v18)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v19 = [v18 objectForKeyedSubscript:@"operators"];
            if (v19)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v23 setObject:v19 forKey:v17];
              }
            }
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  id v20 = (NSDictionary *)[v23 copy];
  operatorsDictionary = self->_operatorsDictionary;
  self->_operatorsDictionary = v20;
}

- (id)_initWithIntent:(id)a3 decoder:(id)a4 JSONDictionary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)INParameterContexts;
  id v11 = [(INParameterContexts *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    [(INParameterContexts *)v11 _updateSuggestedValuesForIntent:v8 decoder:v9 JSONDictionary:v10];
    [(INParameterContexts *)v12 _updateOperatorsForIntent:v8 JSONDictionary:v10];
  }

  return v12;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "_intents_decodeWithJSONDecoder:codableDescription:from:", v10, v9, v8);

  return v11;
}

@end