@interface _GEOConfigKeyHelper
- (BOOL)isEqual:(id)a3;
- (id)_currentValue;
- (id)description;
- (uint64_t)valueChanged;
- (unint64_t)hash;
- (void)_lookupKeyProperties;
- (void)keyNumber;
- (void)keyString;
@end

@implementation _GEOConfigKeyHelper

- (unint64_t)hash
{
  return self->configKey.identifier ^ ((uint64_t)self->configKey.metadata << 8);
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v6 = 0;
  if (self && (isKindOfClass & 1) != 0)
  {
    if (v4)
    {
      int v7 = v4[10];
      v8 = (void *)*((void *)v4 + 6);
    }
    else
    {
      v8 = 0;
      int v7 = 0;
    }
    BOOL v6 = v7 == *(void *)&self->configKey.identifier && v8 == self->configKey.metadata;
  }

  return v6;
}

- (void)keyString
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[4];
    if (!v3)
    {
      -[_GEOConfigKeyHelper _lookupKeyProperties]((uint64_t)a1);
      v3 = (void *)v2[4];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_lookupKeyProperties
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43___GEOConfigKeyHelper__lookupKeyProperties__block_invoke;
  v3[3] = &unk_1E53E8428;
  v3[4] = a1;
  GEOConfigGetPropertiesForKey(v2, v1, v3);
}

- (uint64_t)valueChanged
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [(_GEOConfigKeyHelper *)a1[5] _currentValue];
  v3 = (void *)a1[1];
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v2 == 0;
  }
  if (v4)
  {
    if (!v3 || v2)
    {
      uint64_t v5 = 0;
      if (v3 && v2)
      {
        uint64_t v5 = [v3 isEqual:v2] ^ 1;
        v3 = (void *)a1[1];
      }
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0;
  }
  uint64_t v5 = 1;
LABEL_13:
  a1[1] = v2;

  return v5;
}

- (id)_currentValue
{
  uint64_t v2 = _getValue(a1, a2, 1, 0, 0, 0);

  return v2;
}

- (void)keyNumber
{
  if (a1)
  {
    uint64_t v2 = a1;
    v3 = (void *)a1[3];
    if (!v3)
    {
      uint64_t v4 = [NSNumber numberWithUnsignedLongLong:*((unsigned int *)a1 + 10) | (a1[6] << 16)];
      uint64_t v5 = (void *)v2[3];
      v2[3] = v4;

      v3 = (void *)v2[3];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  metadata = self->configKey.metadata;
  uint64_t identifier = self->configKey.identifier;
  v8 = -[_GEOConfigKeyHelper keyNumber](self);
  v9 = -[_GEOConfigKeyHelper keyString](self);
  v10 = [v3 stringWithFormat:@"<%@ %p: md: %p id: %d n: %@ s: %@ lv: %@>", v5, self, metadata, identifier, v8, v9, self->_lastValue];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyString, 0);
  objc_storeStrong((id *)&self->_keyNumber, 0);

  objc_storeStrong(&self->_lastValue, 0);
}

@end