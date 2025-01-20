@interface CRKComparator
+ (id)compare;
+ (id)compareWithCriteria:(id)a3;
- (CRKComparator)init;
- (NSMutableArray)allCriteria;
- (id)compare;
- (id)compareWithCriteria:(id)a3;
- (id)run;
- (int64_t)runComparison;
@end

@implementation CRKComparator

+ (id)compareWithCriteria:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v4 compareWithCriteria:v3];

  return v5;
}

+ (id)compare
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __24__CRKComparator_compare__block_invoke;
  v4[3] = &__block_descriptor_40_e29___CRKComparator_16__0___q___8l;
  v4[4] = a1;
  v2 = (void *)MEMORY[0x22A620AF0](v4, a2);

  return v2;
}

uint64_t __24__CRKComparator_compare__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) compareWithCriteria:a2];
}

{
  return [*(id *)(a1 + 32) compareWithCriteria:a2];
}

- (int64_t)runComparison
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(CRKComparator *)self allCriteria];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v6) + 16))();
        if (v7)
        {
          int64_t v8 = v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  int64_t v8 = 0;
LABEL_11:

  return v8;
}

- (id)run
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __20__CRKComparator_run__block_invoke;
  v4[3] = &unk_2646F4878;
  v4[4] = self;
  v2 = (void *)MEMORY[0x22A620AF0](v4, a2);

  return v2;
}

uint64_t __20__CRKComparator_run__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) runComparison];
}

- (id)compareWithCriteria:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRKComparator *)self allCriteria];
  uint64_t v6 = (void *)MEMORY[0x22A620AF0](v4);

  [v5 addObject:v6];
  return self;
}

- (id)compare
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __24__CRKComparator_compare__block_invoke;
  v4[3] = &unk_2646F48A0;
  v4[4] = self;
  v2 = (void *)MEMORY[0x22A620AF0](v4, a2);

  return v2;
}

- (NSMutableArray)allCriteria
{
  return self->_allCriteria;
}

- (void).cxx_destruct
{
}

- (CRKComparator)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRKComparator;
  v2 = [(CRKComparator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    allCriteria = v2->_allCriteria;
    v2->_allCriteria = (NSMutableArray *)v3;
  }
  return v2;
}

@end