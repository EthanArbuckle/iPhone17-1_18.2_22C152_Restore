@interface HKMedicationsNumberToNumberMap
- (HKMedicationsNumberToNumberMap)init;
- (int64_t)integerForKey:(int64_t)a3;
- (void)setInteger:(int64_t)a3 forKey:(int64_t)a4;
@end

@implementation HKMedicationsNumberToNumberMap

- (HKMedicationsNumberToNumberMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKMedicationsNumberToNumberMap;
  v2 = [(HKMedicationsNumberToNumberMap *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    storage = v2->_storage;
    v2->_storage = v3;
  }
  return v2;
}

- (int64_t)integerForKey:(int64_t)a3
{
  storage = self->_storage;
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)storage objectForKeyedSubscript:v4];
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (void)setInteger:(int64_t)a3 forKey:(int64_t)a4
{
  id v8 = [NSNumber numberWithInteger:a3];
  storage = self->_storage;
  v7 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)storage setObject:v8 forKeyedSubscript:v7];
}

- (void).cxx_destruct
{
}

@end