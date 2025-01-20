@interface NSDictionary
- (BOOL)aap_BOOLValueForKey:(id)a3;
- (id)aap_arrayValueForKey:(id)a3 expectedContainingObjectsType:(Class)a4;
- (id)aap_stringValueForKey:(id)a3;
@end

@implementation NSDictionary

- (BOOL)aap_BOOLValueForKey:(id)a3
{
  id v3 = -[NSDictionary objectForKey:](self, "objectForKey:");
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_1546C();
    }
    return 0;
  }
  else
  {
    return [v3 BOOLValue];
  }
}

- (id)aap_stringValueForKey:(id)a3
{
  id v3 = -[NSDictionary objectForKey:](self, "objectForKey:");
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_154E0();
      }
      return 0;
    }
  }
  return v3;
}

- (id)aap_arrayValueForKey:(id)a3 expectedContainingObjectsType:(Class)a4
{
  id result = -[NSDictionary objectForKey:](self, "objectForKey:");
  if (result)
  {
    id v7 = result;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v28 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v7);
            }
            uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v12);
            if (objc_opt_isKindOfClass())
            {
              [v8 addObject:v13];
            }
            else
            {
              v14 = AFSiriLogContextPlugin;
              if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR))
              {
                v15 = NSStringFromClass(a4);
                *(_DWORD *)buf = 136315906;
                v21 = "-[NSDictionary(AAPIntentsInfoSync) aap_arrayValueForKey:expectedContainingObjectsType:]";
                __int16 v22 = 2114;
                id v23 = a3;
                __int16 v24 = 2114;
                v25 = v15;
                __int16 v26 = 2112;
                id v27 = v7;
                _os_log_error_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: Value in array for key %{public}@ is not of expected class %{public}@: %@, skipping", buf, 0x2Au);
              }
            }
            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          id v10 = [v7 countByEnumeratingWithState:&v16 objects:v28 count:16];
        }
        while (v10);
      }
      return v8;
    }
    else
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_15554();
      }
      return 0;
    }
  }
  return result;
}

@end