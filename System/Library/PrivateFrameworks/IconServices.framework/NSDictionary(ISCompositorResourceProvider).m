@interface NSDictionary(ISCompositorResourceProvider)
- (id)_IS_resourceNamed:()ISCompositorResourceProvider;
@end

@implementation NSDictionary(ISCompositorResourceProvider)

- (id)_IS_resourceNamed:()ISCompositorResourceProvider
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  v6 = [MEMORY[0x1E4F1CA80] setWithObject:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    while (1)
    {
      if (!v6)
      {
        v6 = [MEMORY[0x1E4F1CA80] setWithObject:v4];
      }
      if ([v6 containsObject:v5]) {
        break;
      }
      [v6 addObject:v5];
      uint64_t v7 = [a1 objectForKey:v5];
      if (!v7) {
        goto LABEL_8;
      }
      v8 = (void *)v7;

      objc_opt_class();
      v5 = v8;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_12;
      }
    }
    v9 = _ISDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1AE771000, v9, OS_LOG_TYPE_DEFAULT, "Content referancince cycle detected name '%@'.", (uint8_t *)&v11, 0xCu);
    }

    v8 = 0;
  }
  else
  {
LABEL_8:
    v8 = v5;
  }
LABEL_12:

  return v8;
}

@end