@interface AMDMemoryBasedProvider
+ (BOOL)isValidFeatureObject:(id)a3;
+ (BOOL)isValidMultiArray:(id)a3;
+ (id)sharedProvider;
- (NSMutableDictionary)featureStore;
- (id)fetchOutputRemapDictForUsecase:(id)a3;
- (id)getFeatureWithName:(id)a3 withColumn:(id)a4 error:(id *)a5;
- (void)setFeatureStore:(id)a3;
- (void)storeFeatureData:(id)a3 error:(id *)a4;
- (void)storeOutputRemapData:(id)a3 error:(id *)a4;
@end

@implementation AMDMemoryBasedProvider

+ (id)sharedProvider
{
  v5 = (dispatch_once_t *)&sharedProvider_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_2);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedProvider_sharedProvider;

  return v2;
}

void __40__AMDMemoryBasedProvider_sharedProvider__block_invoke()
{
  v0 = objc_alloc_init(AMDMemoryBasedProvider);
  v1 = (void *)sharedProvider_sharedProvider;
  sharedProvider_sharedProvider = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend((id)sharedProvider_sharedProvider, "setFeatureStore:");
}

- (id)getFeatureWithName:(id)a3 withColumn:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = a5;
  v10 = [(AMDMemoryBasedProvider *)v17 featureStore];
  id v13 = (id)[(NSMutableDictionary *)v10 objectForKey:location[0]];

  if (v13)
  {
    id v18 = +[AMDFeature featureFromValue:v13];
  }
  else
  {
    id v12 = (id)[NSString stringWithFormat:@"could not find in-memory feature with id %@", location[0]];
    os_log_t oslog = (os_log_t)&_os_log_internal;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)v12);
      _os_log_error_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_ERROR, "%@", v19, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v5 = +[AMDError allocError:16 withMessage:v12];
    id *v14 = v5;
    id v18 = 0;
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  v6 = v18;

  return v6;
}

- (id)fetchOutputRemapDictForUsecase:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(AMDMemoryBasedProvider *)v8 featureStore];
  id v6 = (id)[(NSMutableDictionary *)v5 objectForKey:location[0]];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v6;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  v3 = v9;

  return v3;
}

- (void)storeFeatureData:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = location[0];
    memset(__b, 0, sizeof(__b));
    id obj = v20;
    uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
    if (v13)
    {
      uint64_t v9 = *(void *)__b[2];
      uint64_t v10 = 0;
      unint64_t v11 = v13;
      while (1)
      {
        uint64_t v8 = v10;
        if (*(void *)__b[2] != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(__b[1] + 8 * v10);
        id v17 = (id)[v20 objectForKey:v19];
        if (+[AMDMemoryBasedProvider isValidFeatureObject:v17])
        {
          int v21 = 0;
        }
        else
        {
          id v16 = (id)[NSString stringWithFormat:@"Invalid data for feature '%@'", v19];
          os_log_t oslog = (os_log_t)&_os_log_internal;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            log = oslog;
            __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v16);
            _os_log_error_impl(&dword_20ABD4000, log, OS_LOG_TYPE_ERROR, "%@", v26, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          id v5 = +[AMDError allocError:16 withMessage:v16];
          id *v23 = v5;
          int v21 = 1;
          objc_storeStrong(&v16, 0);
        }
        objc_storeStrong(&v17, 0);
        if (v21) {
          break;
        }
        ++v10;
        if (v8 + 1 >= v11)
        {
          uint64_t v10 = 0;
          unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
          if (!v11) {
            goto LABEL_15;
          }
        }
      }
    }
    else
    {
LABEL_15:
      int v21 = 0;
    }

    if (!v21)
    {
      id v6 = [(AMDMemoryBasedProvider *)v25 featureStore];
      [(NSMutableDictionary *)v6 addEntriesFromDictionary:v20];

      int v21 = 0;
    }
    objc_storeStrong(&v20, 0);
  }
  else
  {
    v22 = @"Inference input data not a dictionary";
    id v4 = +[AMDError allocError:15 withMessage:v22];
    id *v23 = v4;
    int v21 = 1;
    objc_storeStrong((id *)&v22, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)storeOutputRemapData:(id)a3 error:(id *)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v10 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = location[0];
    id v5 = [(AMDMemoryBasedProvider *)v12 featureStore];
    [(NSMutableDictionary *)v5 addEntriesFromDictionary:v7];

    objc_storeStrong(&v7, 0);
    int v8 = 0;
  }
  else
  {
    uint64_t v9 = @"Output mapping is data not a dictionary";
    id v4 = +[AMDError allocError:15 withMessage:v9];
    id *v10 = v4;
    int v8 = 1;
    objc_storeStrong((id *)&v9, 0);
  }
  objc_storeStrong(location, 0);
}

+ (BOOL)isValidMultiArray:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v22 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = (id)[location[0] firstObject];
  if (v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      memset(__b, 0, sizeof(__b));
      id obj = location[0];
      uint64_t v15 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
      if (v15)
      {
        uint64_t v11 = *(void *)__b[2];
        uint64_t v12 = 0;
        unint64_t v13 = v15;
        while (1)
        {
          uint64_t v10 = v12;
          if (*(void *)__b[2] != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(__b[1] + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            char v23 = 0;
            int v19 = 1;
            goto LABEL_15;
          }
          if (([v22 isValidMultiArray:v18] & 1) == 0) {
            break;
          }
          ++v12;
          if (v10 + 1 >= v13)
          {
            uint64_t v12 = 0;
            unint64_t v13 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
            if (!v13) {
              goto LABEL_14;
            }
          }
        }
        char v23 = 0;
        int v19 = 1;
      }
      else
      {
LABEL_14:
        int v19 = 0;
      }
LABEL_15:

      if (!v19)
      {
        char v23 = 1;
        int v19 = 1;
      }
    }
    else
    {
      memset(v16, 0, 0x40uLL);
      id v8 = location[0];
      uint64_t v9 = [v8 countByEnumeratingWithState:v16 objects:v24 count:16];
      if (v9)
      {
        uint64_t v5 = *(void *)v16[2];
        uint64_t v6 = 0;
        unint64_t v7 = v9;
        while (1)
        {
          uint64_t v4 = v6;
          if (*(void *)v16[2] != v5) {
            objc_enumerationMutation(v8);
          }
          v16[8] = *(void *)(v16[1] + 8 * v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          ++v6;
          if (v4 + 1 >= v7)
          {
            uint64_t v6 = 0;
            unint64_t v7 = [v8 countByEnumeratingWithState:v16 objects:v24 count:16];
            if (!v7) {
              goto LABEL_25;
            }
          }
        }
        char v23 = 0;
        int v19 = 1;
      }
      else
      {
LABEL_25:
        int v19 = 0;
      }

      if (!v19)
      {
        char v23 = 1;
        int v19 = 1;
      }
    }
  }
  else
  {
    char v23 = 0;
    int v19 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v23 & 1;
}

+ (BOOL)isValidFeatureObject:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v24 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (id)[location[0] allValues];
    id v4 = v22;
    id v22 = v3;

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong(&v22, location[0]);
LABEL_9:
    id v20 = (id)[v22 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      memset(__b, 0, 0x40uLL);
      id obj = v22;
      uint64_t v17 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
      if (v17)
      {
        uint64_t v13 = *(void *)__b[2];
        uint64_t v14 = 0;
        unint64_t v15 = v17;
        while (1)
        {
          uint64_t v12 = v14;
          if (*(void *)__b[2] != v13) {
            objc_enumerationMutation(obj);
          }
          void __b[8] = *(void *)(__b[1] + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          ++v14;
          if (v12 + 1 >= v15)
          {
            uint64_t v14 = 0;
            unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
            if (!v15) {
              goto LABEL_18;
            }
          }
        }
        char v25 = 0;
        int v21 = 1;
      }
      else
      {
LABEL_18:
        int v21 = 0;
      }

      if (v21) {
        goto LABEL_38;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          char v25 = [v24 isValidMultiArray:v22] & 1;
        }
        else {
          char v25 = 0;
        }
        int v21 = 1;
        goto LABEL_38;
      }
      memset(v18, 0, 0x40uLL);
      id v10 = v22;
      uint64_t v11 = [v10 countByEnumeratingWithState:v18 objects:v26 count:16];
      if (v11)
      {
        uint64_t v7 = *(void *)v18[2];
        uint64_t v8 = 0;
        unint64_t v9 = v11;
        while (1)
        {
          uint64_t v6 = v8;
          if (*(void *)v18[2] != v7) {
            objc_enumerationMutation(v10);
          }
          v18[8] = *(void *)(v18[1] + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          ++v8;
          if (v6 + 1 >= v9)
          {
            uint64_t v8 = 0;
            unint64_t v9 = [v10 countByEnumeratingWithState:v18 objects:v26 count:16];
            if (!v9) {
              goto LABEL_30;
            }
          }
        }
        char v25 = 0;
        int v21 = 1;
      }
      else
      {
LABEL_30:
        int v21 = 0;
      }

      if (v21) {
        goto LABEL_38;
      }
    }
    char v25 = 1;
    int v21 = 1;
LABEL_38:
    objc_storeStrong(&v20, 0);
    goto LABEL_39;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char v25 = 1;
    int v21 = 1;
  }
  else
  {
    char v25 = 0;
    int v21 = 1;
  }
LABEL_39:
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v25 & 1;
}

- (NSMutableDictionary)featureStore
{
  return self->_featureStore;
}

- (void)setFeatureStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end