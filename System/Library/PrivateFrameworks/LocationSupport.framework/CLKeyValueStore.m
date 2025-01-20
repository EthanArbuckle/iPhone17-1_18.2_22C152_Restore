@interface CLKeyValueStore
+ (id)store;
+ (id)storeWithDictionary:(id)a3;
- (BOOL)BOOLForKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)hasValueForKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CLKeyValueStore)initWithDictionary:(id)a3;
- (NSDictionary)underlyingDictionary;
- (double)doubleForKey:(id)a3 defaultValue:(double)a4;
- (float)floatForKey:(id)a3 defaultValue:(float)a4;
- (id)arrayForKey:(id)a3 defaultValue:(id)a4;
- (id)dataForKey:(id)a3 defaultValue:(id)a4;
- (id)description;
- (id)dictionary;
- (id)dictionaryForKey:(id)a3 defaultValue:(id)a4;
- (id)storeForKey:(id)a3 defaultValue:(id)a4;
- (id)stringForKey:(id)a3 defaultValue:(id)a4;
- (int)intForKey:(id)a3 defaultValue:(int)a4;
- (int64_t)longForKey:(id)a3 defaultValue:(int64_t)a4;
- (signed)shortForKey:(id)a3 defaultValue:(signed __int16)a4;
- (unint64_t)count;
- (void)dealloc;
- (void)setUnderlyingDictionary:(id)a3;
@end

@implementation CLKeyValueStore

+ (id)storeWithDictionary:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithDictionary:a3];
  return v3;
}

- (CLKeyValueStore)initWithDictionary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLKeyValueStore;
  v4 = [(CLKeyValueStore *)&v7 init];
  v5 = v4;
  if (v4) {
    [(CLKeyValueStore *)v4 setUnderlyingDictionary:a3];
  }
  return v5;
}

- (void)dealloc
{
  [(CLKeyValueStore *)self setUnderlyingDictionary:0];
  v3.receiver = self;
  v3.super_class = (Class)CLKeyValueStore;
  [(CLKeyValueStore *)&v3 dealloc];
}

- (void)setUnderlyingDictionary:(id)a3
{
}

- (id)dictionary
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  objc_super v3 = [(CLKeyValueStore *)self underlyingDictionary];
  return (id)[v2 dictionaryWithDictionary:v3];
}

- (NSDictionary)underlyingDictionary
{
  return (NSDictionary *)self->_internal;
}

- (id)arrayForKey:(id)a3 defaultValue:(id)a4
{
  [self->_internal objectForKey:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return a4;
  }
  uint64_t v5 = MEMORY[0x1E4F1C978];
  return (id)MEMORY[0x1F4181798](v5, sel_arrayWithArray_);
}

- (BOOL)BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  uint64_t v5 = [self->_internal objectForKeyedSubscript:a3];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a4;
  }
  return MEMORY[0x1F4181798](v5, sel_BOOLValue);
}

+ (id)store
{
  id v2 = objc_alloc((Class)a1);
  objc_super v3 = (void *)[v2 initWithDictionary:MEMORY[0x1E4F1CC08]];
  return v3;
}

- (BOOL)hasValueForKey:(id)a3
{
  return [self->_internal objectForKeyedSubscript:a3] != 0;
}

- (unint64_t)count
{
  return [self->_internal count];
}

- (id)storeForKey:(id)a3 defaultValue:(id)a4
{
  [self->_internal objectForKeyedSubscript:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return a4;
  }
  return (id)MEMORY[0x1F4181798](CLKeyValueStore, sel_storeWithDictionary_);
}

- (signed)shortForKey:(id)a3 defaultValue:(signed __int16)a4
{
  uint64_t v5 = [self->_internal objectForKeyedSubscript:a3];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a4;
  }
  return MEMORY[0x1F4181798](v5, sel_shortValue);
}

- (int)intForKey:(id)a3 defaultValue:(int)a4
{
  uint64_t v5 = (void *)[self->_internal objectForKeyedSubscript:a3];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a4;
  }
  return [v5 intValue];
}

- (int64_t)longForKey:(id)a3 defaultValue:(int64_t)a4
{
  uint64_t v5 = [self->_internal objectForKeyedSubscript:a3];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a4;
  }
  return MEMORY[0x1F4181798](v5, sel_longValue);
}

- (float)floatForKey:(id)a3 defaultValue:(float)a4
{
  uint64_t v5 = [self->_internal objectForKeyedSubscript:a3];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a4;
  }
  MEMORY[0x1F4181798](v5, sel_floatValue);
  return result;
}

- (double)doubleForKey:(id)a3 defaultValue:(double)a4
{
  uint64_t v5 = [self->_internal objectForKeyedSubscript:a3];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a4;
  }
  MEMORY[0x1F4181798](v5, sel_doubleValue);
  return result;
}

- (id)stringForKey:(id)a3 defaultValue:(id)a4
{
  uint64_t v5 = [self->_internal objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = NSString;
    return (id)MEMORY[0x1F4181798](v6, sel_stringWithString_);
  }
  else if (objc_opt_respondsToSelector())
  {
    return (id)MEMORY[0x1F4181798](v5, sel_stringValue);
  }
  else
  {
    return a4;
  }
}

- (id)dictionaryForKey:(id)a3 defaultValue:(id)a4
{
  uint64_t v5 = [self->_internal objectForKey:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return a4;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
  return (id)[v6 dictionaryWithDictionary:v5];
}

- (id)dataForKey:(id)a3 defaultValue:(id)a4
{
  [self->_internal objectForKey:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return a4;
  }
  uint64_t v5 = MEMORY[0x1E4F1C9B8];
  return (id)MEMORY[0x1F4181798](v5, sel_dataWithData_);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id internal = self->_internal;
  uint64_t v6 = [a3 underlyingDictionary];
  return [internal isEqual:v6];
}

- (id)description
{
  return (id)[self->_internal description];
}

@end