@interface NSDictionary
- (id)nas_arrayValueForKey:(id)a3 expectedContainingObjectsType:(Class)a4;
- (id)nas_stringValueForKey:(id)a3;
@end

@implementation NSDictionary

- (id)nas_arrayValueForKey:(id)a3 expectedContainingObjectsType:(Class)a4
{
  id v21 = a3;
  v6 = -[NSDictionary objectForKey:](self, "objectForKey:");
  if (!v6)
  {
LABEL_17:
    id v8 = 0;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v27 = "-[NSDictionary(NASIntentsInfoSync) nas_arrayValueForKey:expectedContainingObjectsType:]";
      __int16 v28 = 2112;
      id v29 = v21;
      __int16 v30 = 2112;
      v31 = v6;
      _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "%s Value for key %@ is not an array: %@", buf, 0x20u);
    }
    goto LABEL_17;
  }
  v20 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v13);
        if (objc_opt_isKindOfClass())
        {
          [v8 addObject:v14];
        }
        else
        {
          v15 = (void *)AFSiriLogContextPlugin;
          if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR))
          {
            v16 = v15;
            v17 = NSStringFromClass(a4);
            *(_DWORD *)buf = 136315906;
            v27 = "-[NSDictionary(NASIntentsInfoSync) nas_arrayValueForKey:expectedContainingObjectsType:]";
            __int16 v28 = 2112;
            id v29 = v21;
            __int16 v30 = 2114;
            v31 = v17;
            __int16 v32 = 2112;
            id v33 = v9;
            _os_log_error_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "%s Value in array for key %@ is not of expected class %{public}@: %@, skipping", buf, 0x2Au);
          }
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v11);
  }

  v6 = v20;
LABEL_18:

  return v8;
}

- (id)nas_stringValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v7 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315650;
      id v10 = "-[NSDictionary(NASIntentsInfoSync) nas_stringValueForKey:]";
      __int16 v11 = 2112;
      id v12 = v4;
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      _os_log_error_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "%s Value for key %@ is not a string: %@", (uint8_t *)&v9, 0x20u);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

@end