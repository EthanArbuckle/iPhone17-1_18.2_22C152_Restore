@interface WKKeyedCoder
- (BOOL)allowsKeyedCoding;
- (BOOL)containsValueForKey:(id)a3;
- (BOOL)decodeBoolForKey:(id)a3;
- (BOOL)requiresSecureCoding;
- (WKKeyedCoder)init;
- (WKKeyedCoder)initWithDictionary:(id)a3;
- (id).cxx_construct;
- (id)accumulatedDictionary;
- (id)decodeObjectForKey:(id)a3;
- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4;
- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4;
- (int64_t)decodeInt64ForKey:(id)a3;
- (int64_t)decodeIntegerForKey:(id)a3;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeInteger:(int64_t)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3 forKey:(id)a4;
@end

@implementation WKKeyedCoder

- (WKKeyedCoder)init
{
  v6.receiver = self;
  v6.super_class = (Class)WKKeyedCoder;
  v2 = [(WKKeyedCoder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    m_ptr = v2->m_dictionary.m_ptr;
    v2->m_dictionary.m_ptr = (void *)v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v2;
}

- (WKKeyedCoder)initWithDictionary:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WKKeyedCoder;
  v4 = [(WKKeyedCoder *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [a3 mutableCopy];
    m_ptr = v4->m_dictionary.m_ptr;
    v4->m_dictionary.m_ptr = (void *)v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v4;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)requiresSecureCoding
{
  return 1;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  if (a3 && IPC::isSerializableValue((IPC *)a3, (objc_object *)a2))
  {
    m_ptr = self->m_dictionary.m_ptr;
    [m_ptr setObject:a3 forKey:a4];
  }
}

- (BOOL)containsValueForKey:(id)a3
{
  return [self->m_dictionary.m_ptr objectForKey:a3] != 0;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  if (self->m_failedDecoding) {
    return 0;
  }
  v4 = (void *)[self->m_dictionary.m_ptr objectForKey:a4];
  if (v4 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = 0;
    self->m_failedDecoding = 1;
  }
  return v4;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->m_failedDecoding) {
    return 0;
  }
  v4 = (void *)[self->m_dictionary.m_ptr objectForKey:a4];
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_7:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(a3);
        }
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v9) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:
      v4 = 0;
      self->m_failedDecoding = 1;
    }
  }
  return v4;
}

- (id)decodeObjectForKey:(id)a3
{
  return (id)[self->m_dictionary.m_ptr objectForKey:a3];
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  uint64_t v6 = [NSNumber numberWithBool:a3];

  [(WKKeyedCoder *)self encodeObject:v6 forKey:a4];
}

- (BOOL)decodeBoolForKey:(id)a3
{
  id v3 = [(WKKeyedCoder *)self decodeObjectOfClass:objc_opt_class() forKey:a3];

  return [v3 BOOLValue];
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  uint64_t v6 = [NSNumber numberWithLongLong:a3];

  [(WKKeyedCoder *)self encodeObject:v6 forKey:a4];
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  id v3 = [(WKKeyedCoder *)self decodeObjectOfClass:objc_opt_class() forKey:a3];

  return [v3 longLongValue];
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  uint64_t v6 = [NSNumber numberWithInteger:a3];

  [(WKKeyedCoder *)self encodeObject:v6 forKey:a4];
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  id v3 = [(WKKeyedCoder *)self decodeObjectOfClass:objc_opt_class() forKey:a3];

  return [v3 integerValue];
}

- (id)accumulatedDictionary
{
  return self->m_dictionary.m_ptr;
}

- (void).cxx_destruct
{
  m_ptr = self->m_dictionary.m_ptr;
  self->m_dictionary.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end