@interface DYIntKeyedDictionary
+ (BOOL)supportsSecureCoding;
- (DYIntKeyedDictionary)init;
- (DYIntKeyedDictionary)initWithCapacity:(unint64_t)a3;
- (DYIntKeyedDictionary)initWithCoder:(id)a3;
- (DYIntKeyedDictionary)initWithIntKeyedDictionary:(id)a3;
- (id)allKeys;
- (id)objectForIntKey:(int64_t)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForIntKey:(int64_t)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forIntKey:(int64_t)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation DYIntKeyedDictionary

- (DYIntKeyedDictionary)init
{
  return [(DYIntKeyedDictionary *)self initWithCapacity:0];
}

- (DYIntKeyedDictionary)initWithCapacity:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DYIntKeyedDictionary;
  if ([(DYIntKeyedDictionary *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (DYIntKeyedDictionary)initWithIntKeyedDictionary:(id)a3
{
  objc_super v4 = -[DYIntKeyedDictionary initWithCapacity:](self, "initWithCapacity:", [a3 count]);
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__DYIntKeyedDictionary_initWithIntKeyedDictionary___block_invoke;
    v7[3] = &unk_265336838;
    v7[4] = v4;
    [a3 enumerateKeysAndObjectsUsingBlock:v7];
  }
  return v5;
}

uint64_t __51__DYIntKeyedDictionary_initWithIntKeyedDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forIntKey:a2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYIntKeyedDictionary)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    __assert_rtn("-[DYIntKeyedDictionary initWithCoder:]", ", 0, "[coder allowsKeyedCoding]"");
  }
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"keys");
  if (!v7) {
    __assert_rtn("-[DYIntKeyedDictionary initWithCoder:]", ", 0, "keys"");
  }
  v8 = v7;
  v9 = -[DYIntKeyedDictionary initWithCapacity:](self, "initWithCapacity:", [v7 count]);
  v10 = v9;
  if (v9)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __38__DYIntKeyedDictionary_initWithCoder___block_invoke;
    v12[3] = &unk_265336D70;
    v12[4] = a3;
    v12[5] = v9;
    [v8 enumerateObjectsUsingBlock:v12];
  }
  return v10;
}

uint64_t __38__DYIntKeyedDictionary_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 longLongValue];
  uint64_t v4 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class(), objc_msgSend(NSString, "stringWithFormat:", @"%llu", v3) forKey];
  if (!v4) {
    __assert_rtn("-[DYIntKeyedDictionary initWithCoder:]_block_invoke", ", 0, "obj"");
  }
  v5 = *(void **)(a1 + 40);

  return [v5 setObject:v4 forIntKey:v3];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    __assert_rtn("-[DYIntKeyedDictionary encodeWithCoder:]", ", 0, "[coder allowsKeyedCoding]"");
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[DYIntKeyedDictionary allKeys](self, "allKeys"), @"keys");
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__DYIntKeyedDictionary_encodeWithCoder___block_invoke;
  v5[3] = &unk_265336838;
  v5[4] = a3;
  [(DYIntKeyedDictionary *)self enumerateKeysAndObjectsUsingBlock:v5];
}

uint64_t __40__DYIntKeyedDictionary_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a2);

  return [v4 encodeObject:a3 forKey:v5];
}

- (void)dealloc
{
  uint64_t v3 = (void **)self->_private;
  if (v3)
  {
    uint64_t v4 = (void **)(v3 + 2);
    for (i = v3 + 2; ; CFRelease(i[3]))
    {
      i = (void **)*i;
      if (!i) {
        break;
      }
    }
    uint64_t v6 = *v4;
    if (*v4)
    {
      do
      {
        v7 = (void *)*v6;
        operator delete(v6);
        uint64_t v6 = v7;
      }
      while (v7);
    }
    v8 = *v3;
    *uint64_t v3 = 0;
    if (v8) {
      operator delete(v8);
    }
    MEMORY[0x253360DD0](v3, 0x10A0C408EF24B1CLL);
  }
  v9.receiver = self;
  v9.super_class = (Class)DYIntKeyedDictionary;
  [(DYIntKeyedDictionary *)&v9 dealloc];
}

- (unint64_t)count
{
  return *((void *)self->_private + 3);
}

- (void)removeAllObjects
{
  v2 = self->_private;
  for (i = (uint64_t **)v2[2]; i; i = (uint64_t **)*i)
    CFRelease(i[3]);
  if (v2[3])
  {
    uint64_t v4 = (void *)v2[2];
    if (v4)
    {
      do
      {
        uint64_t v5 = (void *)*v4;
        operator delete(v4);
        uint64_t v4 = v5;
      }
      while (v5);
    }
    v2[2] = 0;
    uint64_t v6 = v2[1];
    if (v6)
    {
      for (uint64_t j = 0; j != v6; ++j)
        *(void *)(*v2 + 8 * j) = 0;
    }
    v2[3] = 0;
  }
}

- (void)setObject:(id)a3 forIntKey:(int64_t)a4
{
  if (a3)
  {
    uint64_t v6 = self->_private;
    *(void *)&long long v11 = a4;
    *((void *)&v11 + 1) = a3;
    v7 = std::__hash_table<std::__hash_value_type<long long,objc_object  {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object  {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object  {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto8NSObject}*>>::__emplace_unique_key_args<long long,std::pair<long long const,objc_object  {objcproto8NSObject}>>((uint64_t)v6, (unint64_t *)&v11, &v11);
    if (v8)
    {
      CFRetain(a3);
    }
    else
    {
      objc_super v9 = v7;
      id v10 = (id)v7[3];
      if (v10 != a3)
      {
        CFRelease(v10);
        CFRetain(a3);
        v9[3] = a3;
      }
    }
  }
  else
  {
    [(DYIntKeyedDictionary *)self removeObjectForIntKey:a4];
  }
}

- (id)objectForIntKey:(int64_t)a3
{
  uint64_t v3 = self->_private;
  unint64_t v4 = v3[1];
  if (!v4) {
    return 0;
  }
  uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)v4);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    unint64_t v6 = a3;
    if (v4 <= a3) {
      unint64_t v6 = a3 % v4;
    }
  }
  else
  {
    unint64_t v6 = (v4 - 1) & a3;
  }
  v7 = *(uint64_t ****)(*v3 + 8 * v6);
  if (!v7) {
    return 0;
  }
  char v8 = *v7;
  if (!v8) {
    return 0;
  }
  if (v5.u32[0] < 2uLL)
  {
    unint64_t v9 = v4 - 1;
    while (1)
    {
      long long v11 = v8[1];
      if (v11 == (uint64_t *)a3)
      {
        if (v8[2] == (uint64_t *)a3) {
          return v8[3];
        }
      }
      else if (((unint64_t)v11 & v9) != v6)
      {
        return 0;
      }
      char v8 = (uint64_t **)*v8;
      if (!v8) {
        return 0;
      }
    }
  }
  while (1)
  {
    unint64_t v10 = (unint64_t)v8[1];
    if (v10 == a3) {
      break;
    }
    if (v10 >= v4) {
      v10 %= v4;
    }
    if (v10 != v6) {
      return 0;
    }
LABEL_11:
    char v8 = (uint64_t **)*v8;
    if (!v8) {
      return 0;
    }
  }
  if (v8[2] != (uint64_t *)a3) {
    goto LABEL_11;
  }
  return v8[3];
}

- (void)removeObjectForIntKey:(int64_t)a3
{
  uint64_t v3 = self->_private;
  unint64_t v4 = v3[1];
  if (v4)
  {
    uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)v4);
    v5.i16[0] = vaddlv_u8(v5);
    if (v5.u32[0] > 1uLL)
    {
      unint64_t v6 = a3;
      if (v4 <= a3) {
        unint64_t v6 = a3 % v4;
      }
    }
    else
    {
      unint64_t v6 = (v4 - 1) & a3;
    }
    v7 = *(uint64_t ****)(*v3 + 8 * v6);
    if (v7)
    {
      char v8 = *v7;
      if (*v7)
      {
        if (v5.u32[0] < 2uLL)
        {
          unint64_t v9 = v4 - 1;
          while (1)
          {
            long long v11 = v8[1];
            if (v11 == (uint64_t *)a3)
            {
              if (v8[2] == (uint64_t *)a3) {
                goto LABEL_22;
              }
            }
            else if (((unint64_t)v11 & v9) != v6)
            {
              return;
            }
            char v8 = (uint64_t **)*v8;
            if (!v8) {
              return;
            }
          }
        }
        do
        {
          unint64_t v10 = (unint64_t)v8[1];
          if (v10 == a3)
          {
            if (v8[2] == (uint64_t *)a3)
            {
LABEL_22:
              CFRelease(v8[3]);
              std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::remove(v3, v8, (uint64_t)&__p);
              v12 = __p;
              __p = 0;
              if (v12) {
                operator delete(v12);
              }
              return;
            }
          }
          else
          {
            if (v10 >= v4) {
              v10 %= v4;
            }
            if (v10 != v6) {
              return;
            }
          }
          char v8 = (uint64_t **)*v8;
        }
        while (v8);
      }
    }
  }
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  unint64_t v4 = (char *)self->_private;
  char v6 = 0;
  uint8x8_t v5 = v4 + 16;
  do
  {
    uint8x8_t v5 = (void *)*v5;
    if (!v5) {
      break;
    }
    (*((void (**)(id, void, void, char *))a3 + 2))(a3, v5[2], v5[3], &v6);
  }
  while (!v6);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v6 = [a4 longLongValue];

  [(DYIntKeyedDictionary *)self setObject:a3 forIntKey:v6];
}

- (id)objectForKey:(id)a3
{
  uint64_t v4 = [a3 longLongValue];

  return [(DYIntKeyedDictionary *)self objectForIntKey:v4];
}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v4 = [a3 longLongValue];

  [(DYIntKeyedDictionary *)self removeObjectForIntKey:v4];
}

- (id)allKeys
{
  uint64_t v3 = objc_opt_new();
  for (i = (void *)*((void *)self->_private + 2); i; i = (void *)*i)
  {
    uint8x8_t v5 = (void *)[objc_alloc(NSNumber) initWithLongLong:i[2]];
    [v3 addObject:v5];
  }

  return v3;
}

@end