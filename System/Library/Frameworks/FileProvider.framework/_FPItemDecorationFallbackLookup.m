@interface _FPItemDecorationFallbackLookup
- (_FPItemDecorationFallbackLookup)initWithItems:(id)a3;
- (id)fp_valueForKeyPath:(id)a3;
@end

@implementation _FPItemDecorationFallbackLookup

- (_FPItemDecorationFallbackLookup)initWithItems:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_FPItemDecorationFallbackLookup;
  v6 = [(_FPItemDecorationFallbackLookup *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_items, a3);
  }

  return v7;
}

- (id)fp_valueForKeyPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_items;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "fp_valueForKeyPath:", v4, (void)v11);
        if (v9)
        {

          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  objc_super v9 = 0;
LABEL_11:

  return v9;
}

- (void).cxx_destruct
{
}

@end