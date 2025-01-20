@interface CLSettingsDictionary
+ (id)settingsWithDictionary:(id)a3;
- (BOOL)BOOLForKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)hasValueForKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CLSettingsDictionary)initWithDictionary:(id)a3;
- (NSDictionary)dictionary;
- (double)doubleForKey:(id)a3 defaultValue:(double)a4;
- (float)floatForKey:(id)a3 defaultValue:(float)a4;
- (id)arrayForKey:(id)a3 defaultValue:(id)a4;
- (id)dictionaryForKey:(id)a3 defaultValue:(id)a4;
- (id)stringForKey:(id)a3 defaultValue:(id)a4;
- (int)intForKey:(id)a3 defaultValue:(int)a4;
- (int64_t)longForKey:(id)a3 defaultValue:(int64_t)a4;
- (signed)shortForKey:(id)a3 defaultValue:(signed __int16)a4;
- (void)dealloc;
- (void)setDictionary:(id)a3;
@end

@implementation CLSettingsDictionary

+ (id)settingsWithDictionary:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithDictionary:a3];
  return v3;
}

- (CLSettingsDictionary)initWithDictionary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLSettingsDictionary;
  v4 = [(CLSettingsDictionary *)&v7 init];
  v5 = v4;
  if (v4) {
    [(CLSettingsDictionary *)v4 setDictionary:a3];
  }
  return v5;
}

- (void)dealloc
{
  [(CLSettingsDictionary *)self setDictionary:0];
  v3.receiver = self;
  v3.super_class = (Class)CLSettingsDictionary;
  [(CLSettingsDictionary *)&v3 dealloc];
}

- (BOOL)hasValueForKey:(id)a3
{
  return [self->_internal objectForKeyedSubscript:a3] != 0;
}

- (id)dictionaryForKey:(id)a3 defaultValue:(id)a4
{
  uint64_t v5 = [self->_internal objectForKeyedSubscript:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return a4;
  }
  return +[CLSettingsDictionary settingsWithDictionary:v5];
}

- (BOOL)BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  uint64_t v5 = [self->_internal objectForKeyedSubscript:a3];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a4;
  }
  return MEMORY[0x1F4181798](v5, sel_BOOLValue);
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
  uint64_t v6 = [a3 dictionary];
  return [internal isEqual:v6];
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)self->_internal;
}

- (void)setDictionary:(id)a3
{
}

@end