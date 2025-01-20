@interface INIntentDescription
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrivate;
- (Class)dataClass;
- (Class)facadeClass;
- (INIntentDescription)initWithName:(id)a3 responseName:(id)a4 facadeClass:(Class)a5 dataClass:(Class)a6 type:(id)a7 isPrivate:(BOOL)a8 handleSelector:(SEL)a9 confirmSelector:(SEL)a10 slotsByName:(id)a11;
- (NSDictionary)slotsByName;
- (NSString)name;
- (NSString)responseName;
- (NSString)type;
- (SEL)confirmSelector;
- (SEL)handleSelector;
- (id)slotByName:(id)a3;
- (id)slotDescriptions;
- (unint64_t)hash;
@end

@implementation INIntentDescription

- (Class)facadeClass
{
  return self->_facadeClass;
}

- (INIntentDescription)initWithName:(id)a3 responseName:(id)a4 facadeClass:(Class)a5 dataClass:(Class)a6 type:(id)a7 isPrivate:(BOOL)a8 handleSelector:(SEL)a9 confirmSelector:(SEL)a10 slotsByName:(id)a11
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a7;
  id v20 = a11;
  v48.receiver = self;
  v48.super_class = (Class)INIntentDescription;
  v21 = [(INIntentDescription *)&v48 init];
  if (v21)
  {
    uint64_t v22 = [v17 copy];
    name = v21->_name;
    v21->_name = (NSString *)v22;

    uint64_t v24 = [v18 copy];
    responseName = v21->_responseName;
    v21->_responseName = (NSString *)v24;

    v21->_facadeClass = a5;
    v21->_dataClass = a6;
    uint64_t v26 = [v19 copy];
    type = v21->_type;
    v21->_type = (NSString *)v26;

    v21->_isPrivate = a8;
    if (a9) {
      SEL v28 = a9;
    }
    else {
      SEL v28 = 0;
    }
    v21->_handleSelector = v28;
    id v46 = v18;
    id v47 = v17;
    id v45 = v19;
    if (a10) {
      SEL v29 = a10;
    }
    else {
      SEL v29 = 0;
    }
    v21->_confirmSelector = v29;
    uint64_t v30 = [v20 copy];
    slotsByName = v21->_slotsByName;
    v21->_slotsByName = (NSDictionary *)v30;

    id v44 = v20;
    id v32 = v20;
    v33 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v32, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v34 = [v32 allKeys];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v50 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          v40 = objc_msgSend(v32, "objectForKeyedSubscript:", v39, v44);
          v41 = [v40 facadePropertyName];
          [(NSDictionary *)v33 setObject:v39 forKey:v41];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v36);
    }

    alternativeSlotNames = v21->_alternativeSlotNames;
    v21->_alternativeSlotNames = v33;

    id v18 = v46;
    id v17 = v47;
    id v20 = v44;
    id v19 = v45;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_responseName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_alternativeSlotNames, 0);

  objc_storeStrong((id *)&self->_slotsByName, 0);
}

- (SEL)confirmSelector
{
  if (self->_confirmSelector) {
    return self->_confirmSelector;
  }
  else {
    return 0;
  }
}

- (SEL)handleSelector
{
  if (self->_handleSelector) {
    return self->_handleSelector;
  }
  else {
    return 0;
  }
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (NSString)type
{
  return self->_type;
}

- (Class)dataClass
{
  return self->_dataClass;
}

- (NSString)responseName
{
  return self->_responseName;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)slotsByName
{
  return self->_slotsByName;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (NSDictionary **)v4;
    name = self->_name;
    BOOL v8 = 0;
    if (name == (NSString *)v5[4] || -[NSString isEqualToString:](name, "isEqualToString:"))
    {
      responseName = self->_responseName;
      if ((responseName == (NSString *)v5[5] || -[NSString isEqualToString:](responseName, "isEqualToString:"))
        && (NSDictionary *)self->_facadeClass == v5[6]
        && (NSDictionary *)self->_dataClass == v5[7])
      {
        type = self->_type;
        if ((type == (NSString *)v5[8] || -[NSString isEqualToString:](type, "isEqualToString:"))
          && self->_isPrivate == *((unsigned __int8 *)v5 + 24))
        {
          SEL v11 = self->_handleSelector ? self->_handleSelector : 0;
          if (v11 == (SEL)v5[9])
          {
            SEL v12 = self->_confirmSelector ? self->_confirmSelector : 0;
            if (v12 == (SEL)v5[10])
            {
              slotsByName = self->_slotsByName;
              if (slotsByName == v5[1] || -[NSDictionary isEqualToDictionary:](slotsByName, "isEqualToDictionary:")) {
                BOOL v8 = 1;
              }
            }
          }
        }
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_responseName hash];
  v5 = NSStringFromClass(self->_facadeClass);
  uint64_t v6 = [v5 hash];
  v7 = NSStringFromClass(self->_dataClass);
  uint64_t v8 = [v7 hash];
  NSUInteger v9 = [(NSString *)self->_type hash];
  BOOL isPrivate = self->_isPrivate;
  if (self->_handleSelector) {
    handleSelector = self->_handleSelector;
  }
  else {
    handleSelector = 0;
  }
  SEL v12 = NSStringFromSelector(handleSelector);
  NSUInteger v13 = v4 ^ v3 ^ v6 ^ v8 ^ v9;
  uint64_t v14 = isPrivate ^ [v12 hash];
  v15 = NSStringFromSelector(self->_confirmSelector);
  uint64_t v16 = v14 ^ [v15 hash];
  unint64_t v17 = v13 ^ v16 ^ [(NSDictionary *)self->_slotsByName hash];

  return v17;
}

- (id)slotDescriptions
{
  NSUInteger v3 = [(NSDictionary *)self->_slotsByName allValues];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__INIntentDescription_slotDescriptions__block_invoke;
  v6[3] = &unk_1E55190A0;
  v6[4] = self;
  NSUInteger v4 = [v3 sortedArrayUsingComparator:v6];

  return v4;
}

uint64_t __39__INIntentDescription_slotDescriptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 rank];

  if (v7)
  {
    uint64_t v8 = [v6 rank];

    if (v8)
    {
      NSUInteger v9 = [v5 rank];
      v10 = [v6 rank];
      uint64_t v11 = [v9 compare:v10];
    }
    else
    {
      NSUInteger v13 = (void *)INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        id v19 = *(void **)(a1 + 32);
        id v20 = v13;
        v21 = [v19 name];
        uint64_t v22 = [v6 facadePropertyName];
        int v23 = 136315650;
        uint64_t v24 = "-[INIntentDescription slotDescriptions]_block_invoke";
        __int16 v25 = 2112;
        uint64_t v26 = v21;
        __int16 v27 = 2112;
        SEL v28 = v22;
        _os_log_error_impl(&dword_18CB2F000, v20, OS_LOG_TYPE_ERROR, "%s Slot %@:%@ does not have a valid rank", (uint8_t *)&v23, 0x20u);
      }
      uint64_t v11 = 1;
    }
  }
  else
  {
    SEL v12 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v15 = *(void **)(a1 + 32);
      uint64_t v16 = v12;
      unint64_t v17 = [v15 name];
      id v18 = [v5 facadePropertyName];
      int v23 = 136315650;
      uint64_t v24 = "-[INIntentDescription slotDescriptions]_block_invoke";
      __int16 v25 = 2112;
      uint64_t v26 = v17;
      __int16 v27 = 2112;
      SEL v28 = v18;
      _os_log_error_impl(&dword_18CB2F000, v16, OS_LOG_TYPE_ERROR, "%s Slot %@:%@ does not have a valid rank", (uint8_t *)&v23, 0x20u);
    }
    uint64_t v11 = -1;
  }

  return v11;
}

- (id)slotByName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_slotsByName objectForKeyedSubscript:v4];
    if (v5)
    {
      id v6 = v5;
    }
    else
    {
      v7 = [(NSDictionary *)self->_alternativeSlotNames objectForKeyedSubscript:v4];
      if (v7
        && ([(NSDictionary *)self->_slotsByName objectForKeyedSubscript:v7],
            (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v6 = v8;
      }
      else
      {
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end