@interface SGMicrodataItemScope
- (BOOL)isReferencedBy:(id)a3;
- (NSArray)itemProps;
- (SGMicrodataItemScope)init;
- (void)addItemProp:(id)a3;
@end

@implementation SGMicrodataItemScope

- (void).cxx_destruct
{
}

- (NSArray)itemProps
{
  return &self->_itemProps->super;
}

- (BOOL)isReferencedBy:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (SGMicrodataItemScope *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = [(SGMicrodataItemScope *)v4 itemProps];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) itemValue];
          if (v11 && [(SGMicrodataItemScope *)self isReferencedBy:v11])
          {

            BOOL v12 = 1;
            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 0;
LABEL_14:
  }
  return v12;
}

- (void)addItemProp:(id)a3
{
}

- (SGMicrodataItemScope)init
{
  v6.receiver = self;
  v6.super_class = (Class)SGMicrodataItemScope;
  v2 = [(SGMicrodataItemScope *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    itemProps = v2->_itemProps;
    v2->_itemProps = (NSMutableArray *)v3;
  }
  return v2;
}

@end