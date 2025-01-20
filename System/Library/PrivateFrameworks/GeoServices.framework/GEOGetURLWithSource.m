@interface GEOGetURLWithSource
@end

@implementation GEOGetURLWithSource

id ___GEOGetURLWithSource_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v3 length])
      {
        uint64_t v4 = *(void *)(a1 + 32);
        if (v4)
        {
          (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
          id v5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v5 = v3;
        }
        v8 = v5;
        goto LABEL_10;
      }
    }
    else
    {
      v6 = GEOGetUserDefaultsLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = _GEOGetURLWithSource(*(void *)(a1 + 40), 0, 1, 0);
        int v10 = 138543618;
        v11 = v7;
        __int16 v12 = 2114;
        uint64_t v13 = objc_opt_class();
        _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "URL for type '%{public}@' is of unexpected type '%{public}@'", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  v8 = 0;
LABEL_10:

  return v8;
}

@end