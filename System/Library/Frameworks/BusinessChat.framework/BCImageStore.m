@interface BCImageStore
- (BCImageStore)initWithArray:(id)a3;
- (BCImageStore)initWithData:(id)a3;
- (BCImageStore)initWithImages:(id)a3;
- (NSArray)rawArray;
- (NSDictionary)dictionary;
- (id)generateImageDictionaryFromArray:(void *)a1;
- (void)setDictionary:(id)a3;
- (void)setRawArray:(id)a3;
@end

@implementation BCImageStore

- (BCImageStore)initWithData:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = LogCategory_Daemon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 description];
    *(_DWORD *)buf = 138412290;
    v18 = v7;
    _os_log_impl(&dword_228C26000, v6, OS_LOG_TYPE_DEFAULT, "BCImageStore: initWithData %@", buf, 0xCu);
  }
  v16.receiver = self;
  v16.super_class = (Class)BCImageStore;
  v8 = [(BCImageStore *)&v16 init];
  if (v8)
  {
    v9 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:0 error:0];
    v10 = [v9 objectForKeyedSubscript:@"images"];
    [(BCImageStore *)v8 setRawArray:v10];
    v11 = -[BCImageStore generateImageDictionaryFromArray:](v10);
    [(BCImageStore *)v8 setDictionary:v11];

    objc_storeStrong((id *)&v8->_data, a3);
  }
  v12 = [(BCImageStore *)v8 dictionary];
  if (v12) {
    v13 = v8;
  }
  else {
    v13 = 0;
  }
  v14 = v13;

  return v14;
}

- (id)generateImageDictionaryFromArray:(void *)a1
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (v1)
  {
    id v27 = v1;
    v28 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v1;
    uint64_t v3 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = @"data";
      v6 = @"identifier";
      uint64_t v7 = *(void *)v33;
      do
      {
        uint64_t v8 = 0;
        uint64_t v29 = v4;
        do
        {
          if (*(void *)v33 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
          v10 = objc_msgSend(v9, "objectForKeyedSubscript:", v5, v27);
          v11 = [v9 objectForKeyedSubscript:v6];
          if (v11) {
            BOOL v12 = v10 == 0;
          }
          else {
            BOOL v12 = 1;
          }
          if (v12)
          {
            v13 = LogCategory_Daemon();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_228C26000, v13, OS_LOG_TYPE_ERROR, "BCImageStore: image is missing data or identifier", buf, 2u);
            }
          }
          else
          {
            v14 = v6;
            v15 = v5;
            id v16 = objc_alloc(MEMORY[0x263EFF8F8]);
            id v17 = v10;
            uint64_t v18 = [v17 length];
            if ((v18 & 0xFFFFFFFFFFFFFFFCLL) == 0xFFFFFFFFFFFFFFFCLL)
            {
              id v19 = v17;
            }
            else
            {
              [v17 stringByPaddingToLength:(v18 & 0xFFFFFFFFFFFFFFFCLL) + 4 withString:@"=" startingAtIndex:0];
              id v19 = (id)objc_claimAutoreleasedReturnValue();
            }
            v20 = v19;

            v13 = [v16 initWithBase64EncodedString:v20 options:0];
            if (v13)
            {
              v21 = [BCImage alloc];
              v22 = [v9 objectForKeyedSubscript:@"description"];
              v23 = [(BCImage *)v21 initWithImageData:v13 identifier:v11 description:v22];

              [v28 setObject:v23 forKeyedSubscript:v11];
            }
            else
            {
              v23 = LogCategory_Daemon();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_228C26000, v23, OS_LOG_TYPE_ERROR, "BCImageStore: image data cannot be decoded", buf, 2u);
              }
            }
            id v5 = v15;
            v6 = v14;
            uint64_t v4 = v29;
          }
          ++v8;
        }
        while (v4 != v8);
        uint64_t v4 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v4);
    }

    v24 = [v28 allKeys];
    if ([v24 count]) {
      v25 = v28;
    }
    else {
      v25 = 0;
    }
    id v2 = v25;

    id v1 = v27;
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (BCImageStore)initWithArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_228C26000, v5, OS_LOG_TYPE_DEFAULT, "BCImageStore: initWithArray %@", buf, 0xCu);
  }

  v14.receiver = self;
  v14.super_class = (Class)BCImageStore;
  v6 = [(BCImageStore *)&v14 init];
  uint64_t v7 = v6;
  if (v6)
  {
    [(BCImageStore *)v6 setRawArray:v4];
    uint64_t v8 = -[BCImageStore generateImageDictionaryFromArray:](v4);
    [(BCImageStore *)v7 setDictionary:v8];

    data = v7->_data;
    v7->_data = 0;
  }
  v10 = [(BCImageStore *)v7 dictionary];
  if (v10) {
    v11 = v7;
  }
  else {
    v11 = 0;
  }
  BOOL v12 = v11;

  return v12;
}

- (BCImageStore)initWithImages:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v4;
    _os_log_impl(&dword_228C26000, v5, OS_LOG_TYPE_DEFAULT, "BCImageStore: initWithImages %@", buf, 0xCu);
  }

  v21.receiver = self;
  v21.super_class = (Class)BCImageStore;
  v6 = [(BCImageStore *)&v21 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_super v14 = objc_msgSend(v13, "identifier", (void)v17);
          [v7 setObject:v13 forKey:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }

    [(BCImageStore *)v6 setDictionary:v7];
    [(BCImageStore *)v6 setRawArray:0];
    data = v6->_data;
    v6->_data = 0;
  }
  return v6;
}

- (NSArray)rawArray
{
  return self->_rawArray;
}

- (void)setRawArray:(id)a3
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);

  objc_storeStrong((id *)&self->_rawArray, 0);
}

@end