@interface FigKVCInspectable
- (BOOL)validateValue:(id *)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)validateValue:(id *)a3 forKeyPath:(id)a4 error:(id *)a5;
- (id)valueForUndefinedKey:(id)a3;
@end

@implementation FigKVCInspectable

- (id)valueForUndefinedKey:(id)a3
{
  v3 = objc_alloc_init(FigUndefinedKeyValueSentry);

  return v3;
}

- (BOOL)validateValue:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return 0;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)FigKVCInspectable;
  return [(FigKVCInspectable *)&v10 validateValue:a3 forKey:a4 error:a5];
}

- (BOOL)validateValue:(id *)a3 forKeyPath:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = *a3;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            return 0;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        BOOL result = 1;
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)FigKVCInspectable;
    return [(FigKVCInspectable *)&v15 validateValue:a3 forKeyPath:a4 error:a5];
  }
  return result;
}

@end