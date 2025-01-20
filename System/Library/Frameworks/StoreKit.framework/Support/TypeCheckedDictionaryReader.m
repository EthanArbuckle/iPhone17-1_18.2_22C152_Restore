@interface TypeCheckedDictionaryReader
- (TypeCheckedDictionaryReader)initWithDictionary:(id)a3;
- (id)valueOfClass:(Class)a3 forKey:(id)a4;
- (id)valueOfClass:(Class)a3 forKeyPath:(id)a4;
@end

@implementation TypeCheckedDictionaryReader

- (TypeCheckedDictionaryReader)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TypeCheckedDictionaryReader;
  v5 = [(TypeCheckedDictionaryReader *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dictionary, v4);
  }

  return v6;
}

- (id)valueOfClass:(Class)a3 forKey:(id)a4
{
  p_dictionary = &self->_dictionary;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_dictionary);
  v7 = [WeakRetained objectForKeyedSubscript:v5];

  if (objc_opt_isKindOfClass()) {
    objc_super v8 = v7;
  }
  else {
    objc_super v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (id)valueOfClass:(Class)a3 forKeyPath:(id)a4
{
  id v6 = a4;
  v7 = (char *)[v6 rangeOfString:@"." options:4];
  if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(TypeCheckedDictionaryReader *)self valueOfClass:a3 forKey:v6];
    goto LABEL_20;
  }
  id v9 = v7;
  v10 = [v6 substringToIndex:v7];
  id WeakRetained = [(NSMutableDictionary *)self->_keyPathCache objectForKeyedSubscript:v10];
  if (!WeakRetained)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dictionary);
    [v10 componentsSeparatedByString:@"."];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v27 = 16;
      v28 = self;
      v29 = v9;
      Class v30 = a3;
      id v31 = v6;
      uint64_t v17 = *(void *)v33;
      char v18 = 1;
      while (2)
      {
        v19 = 0;
        v20 = WeakRetained;
        do
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v19);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          id WeakRetained = [v20 objectForKeyedSubscript:v21];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            id v8 = 0;
            id v6 = v31;
            goto LABEL_19;
          }
          v18 &= isKindOfClass ^ 1;
          v19 = (char *)v19 + 1;
          v20 = WeakRetained;
        }
        while (v16 != v19);
        id v16 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v16) {
          continue;
        }
        break;
      }

      id v6 = v31;
      self = v28;
      if ((v18 & 1) == 0) {
        goto LABEL_27;
      }
    }
    else
    {
    }
    keyPathCache = self->_keyPathCache;
    if (!keyPathCache)
    {
      v25 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
      v26 = self->_keyPathCache;
      self->_keyPathCache = v25;

      keyPathCache = self->_keyPathCache;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](keyPathCache, "setObject:forKeyedSubscript:", WeakRetained, v10, v27, v28, v29, v30);
LABEL_27:
  }
  v12 = objc_msgSend(v6, "substringFromIndex:", v9 + 1, v27, v28, v29, v30);
  id v13 = [WeakRetained objectForKeyedSubscript:v12];

  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v8 = v14;
LABEL_19:

LABEL_20:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPathCache, 0);

  objc_destroyWeak((id *)&self->_dictionary);
}

@end