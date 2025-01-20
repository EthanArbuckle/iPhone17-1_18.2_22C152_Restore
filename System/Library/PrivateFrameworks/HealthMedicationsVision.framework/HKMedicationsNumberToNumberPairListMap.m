@interface HKMedicationsNumberToNumberPairListMap
- (HKMedicationsNumberToNumberPairListMap)init;
- (void)addInteger:(int64_t)a3 andInteger:(int64_t)a4 forKey:(int64_t)a5;
- (void)enumerateIntegersForKey:(int64_t)a3 block:(id)a4;
@end

@implementation HKMedicationsNumberToNumberPairListMap

- (HKMedicationsNumberToNumberPairListMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKMedicationsNumberToNumberPairListMap;
  v2 = [(HKMedicationsNumberToNumberPairListMap *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    storage = v2->_storage;
    v2->_storage = v3;
  }
  return v2;
}

- (void)addInteger:(int64_t)a3 andInteger:(int64_t)a4 forKey:(int64_t)a5
{
  storage = self->_storage;
  v10 = [NSNumber numberWithInteger:a5];
  id v14 = [(NSMutableDictionary *)storage objectForKeyedSubscript:v10];

  if (!v14)
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    v11 = self->_storage;
    v12 = [NSNumber numberWithInteger:a5];
    [(NSMutableDictionary *)v11 setObject:v14 forKeyedSubscript:v12];
  }
  v13 = objc_alloc_init(HKMedicationsIntegerPair);
  [(HKMedicationsIntegerPair *)v13 setFirst:a3];
  [(HKMedicationsIntegerPair *)v13 setSecond:a4];
  [v14 addObject:v13];
}

- (void)enumerateIntegersForKey:(int64_t)a3 block:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_super v6 = (void (**)(id, uint64_t, uint64_t))a4;
  if (v6)
  {
    storage = self->_storage;
    v8 = [NSNumber numberWithInteger:a3];
    v9 = [(NSMutableDictionary *)storage objectForKeyedSubscript:v8];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          v6[2](v6, objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14), "first", (void)v15), objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14), "second"));
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
}

- (void).cxx_destruct
{
}

@end