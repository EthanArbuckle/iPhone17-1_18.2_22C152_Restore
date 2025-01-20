@interface GTIntKeyedDictionary_tools_diagnostics
+ (BOOL)supportsSecureCoding;
- (GTIntKeyedDictionary_tools_diagnostics)init;
- (GTIntKeyedDictionary_tools_diagnostics)initWithCapacity:(unint64_t)a3;
- (GTIntKeyedDictionary_tools_diagnostics)initWithCoder:(id)a3;
- (GTIntKeyedDictionary_tools_diagnostics)initWithIntKeyedDictionary:(id)a3;
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

@implementation GTIntKeyedDictionary_tools_diagnostics

- (id)allKeys
{
  v3 = objc_opt_new();
  for (i = (void *)*((void *)self->_private + 2); i; i = (void *)*i)
  {
    id v5 = [objc_alloc((Class)NSNumber) initWithLongLong:i[2]];
    [v3 addObject:v5];
  }

  return v3;
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = [a3 longLongValue];

  [(GTIntKeyedDictionary_tools_diagnostics *)self removeObjectForIntKey:v4];
}

- (id)objectForKey:(id)a3
{
  id v4 = [a3 longLongValue];

  return [(GTIntKeyedDictionary_tools_diagnostics *)self objectForIntKey:v4];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = [a4 longLongValue];

  [(GTIntKeyedDictionary_tools_diagnostics *)self setObject:a3 forIntKey:v6];
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4 = (char *)self->_private;
  char v6 = 0;
  id v5 = v4 + 16;
  do
  {
    id v5 = (void *)*v5;
    if (!v5) {
      break;
    }
    (*((void (**)(id, void, void, char *))a3 + 2))(a3, v5[2], v5[3], &v6);
  }
  while (!v6);
}

- (void)removeObjectForIntKey:(int64_t)a3
{
  v3 = self->_private;
  id v4 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>(v3, a3);
  if (v4)
  {
    id v5 = v4;
    CFRelease((CFTypeRef)v4[3]);
    int8x8_t v6 = (int8x8_t)v3[1];
    unint64_t v7 = v5[1];
    uint8x8_t v8 = (uint8x8_t)vcnt_s8(v6);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      if (v7 >= *(void *)&v6) {
        v7 %= *(void *)&v6;
      }
    }
    else
    {
      v7 &= *(void *)&v6 - 1;
    }
    v9 = *(void **)(*v3 + 8 * v7);
    do
    {
      v10 = v9;
      v9 = (void *)*v9;
    }
    while (v9 != v5);
    if (v10 == v3 + 2) {
      goto LABEL_20;
    }
    unint64_t v11 = v10[1];
    if (v8.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v6) {
        v11 %= *(void *)&v6;
      }
    }
    else
    {
      v11 &= *(void *)&v6 - 1;
    }
    if (v11 != v7)
    {
LABEL_20:
      if (!*v5) {
        goto LABEL_21;
      }
      unint64_t v12 = *(void *)(*v5 + 8);
      if (v8.u32[0] > 1uLL)
      {
        if (v12 >= *(void *)&v6) {
          v12 %= *(void *)&v6;
        }
      }
      else
      {
        v12 &= *(void *)&v6 - 1;
      }
      if (v12 != v7) {
LABEL_21:
      }
        *(void *)(*v3 + 8 * v7) = 0;
    }
    uint64_t v13 = *v5;
    if (*v5)
    {
      unint64_t v14 = *(void *)(v13 + 8);
      if (v8.u32[0] > 1uLL)
      {
        if (v14 >= *(void *)&v6) {
          v14 %= *(void *)&v6;
        }
      }
      else
      {
        v14 &= *(void *)&v6 - 1;
      }
      if (v14 != v7)
      {
        *(void *)(*v3 + 8 * v14) = v10;
        uint64_t v13 = *v5;
      }
    }
    void *v10 = v13;
    *id v5 = 0;
    --v3[3];
    operator delete(v5);
  }
}

- (id)objectForIntKey:(int64_t)a3
{
  id result = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>((void *)self->_private, a3);
  if (result) {
    return (id)*((void *)result + 3);
  }
  return result;
}

- (void)setObject:(id)a3 forIntKey:(int64_t)a4
{
  if (a3)
  {
    unint64_t v7 = (char *)self->_private;
    unint64_t v8 = *((void *)v7 + 1);
    if (v8)
    {
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        unint64_t v4 = a4;
        if (v8 <= a4) {
          unint64_t v4 = a4 % v8;
        }
      }
      else
      {
        unint64_t v4 = (v8 - 1) & a4;
      }
      v10 = *(void **)(*(void *)v7 + 8 * v4);
      if (v10)
      {
        unint64_t v11 = (void *)*v10;
        if (*v10)
        {
          do
          {
            unint64_t v12 = v11[1];
            if (v12 == a4)
            {
              if (v11[2] == a4)
              {
                id v23 = (id)v11[3];
                if (v23 != a3)
                {
                  CFRelease(v23);
                  CFRetain(a3);
                  v11[3] = a3;
                }
                return;
              }
            }
            else
            {
              if (v9.u32[0] > 1uLL)
              {
                if (v12 >= v8) {
                  v12 %= v8;
                }
              }
              else
              {
                v12 &= v8 - 1;
              }
              if (v12 != v4) {
                break;
              }
            }
            unint64_t v11 = (void *)*v11;
          }
          while (v11);
        }
      }
    }
    uint64_t v13 = operator new(0x20uLL);
    *uint64_t v13 = 0;
    v13[1] = a4;
    v13[2] = a4;
    v13[3] = a3;
    float v14 = (float)(unint64_t)(*((void *)v7 + 3) + 1);
    float v15 = *((float *)v7 + 8);
    if (!v8 || (float)(v15 * (float)v8) < v14)
    {
      BOOL v16 = 1;
      if (v8 >= 3) {
        BOOL v16 = (v8 & (v8 - 1)) != 0;
      }
      unint64_t v17 = v16 | (2 * v8);
      unint64_t v18 = vcvtps_u32_f32(v14 / v15);
      if (v17 <= v18) {
        size_t v19 = v18;
      }
      else {
        size_t v19 = v17;
      }
      std::__hash_table<std::__hash_value_type<long long,objc_object  {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object  {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object  {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto8NSObject}*>>::__rehash<true>((uint64_t)v7, v19);
      unint64_t v8 = *((void *)v7 + 1);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v8 <= a4) {
          unint64_t v4 = a4 % v8;
        }
        else {
          unint64_t v4 = a4;
        }
      }
      else
      {
        unint64_t v4 = (v8 - 1) & a4;
      }
    }
    uint64_t v20 = *(void *)v7;
    v21 = *(void **)(*(void *)v7 + 8 * v4);
    if (v21)
    {
      *uint64_t v13 = *v21;
    }
    else
    {
      *uint64_t v13 = *((void *)v7 + 2);
      *((void *)v7 + 2) = v13;
      *(void *)(v20 + 8 * v4) = v7 + 16;
      if (!*v13)
      {
LABEL_43:
        ++*((void *)v7 + 3);
        CFRetain(a3);
        return;
      }
      unint64_t v22 = *(void *)(*v13 + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8) {
          v22 %= v8;
        }
      }
      else
      {
        v22 &= v8 - 1;
      }
      v21 = (void *)(*(void *)v7 + 8 * v22);
    }
    void *v21 = v13;
    goto LABEL_43;
  }

  [(GTIntKeyedDictionary_tools_diagnostics *)self removeObjectForIntKey:a4];
}

- (void)removeAllObjects
{
  v2 = self->_private;
  for (i = (uint64_t **)v2[2]; i; i = (uint64_t **)*i)
    CFRelease(i[3]);
  if (v2[3])
  {
    unint64_t v4 = (void *)v2[2];
    if (v4)
    {
      do
      {
        id v5 = (void *)*v4;
        operator delete(v4);
        unint64_t v4 = v5;
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

- (unint64_t)count
{
  return *((void *)self->_private + 3);
}

- (void)dealloc
{
  v2 = (char *)self->_private;
  if (v2)
  {
    for (i = (CFTypeRef *)(v2 + 16); ; CFRelease(i[3]))
    {
      i = (CFTypeRef *)*i;
      if (!i) {
        break;
      }
    }
    std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::~__hash_table((uint64_t)v2);
    operator delete();
  }
  v4.receiver = self;
  v4.super_class = (Class)GTIntKeyedDictionary_tools_diagnostics;
  [(GTIntKeyedDictionary_tools_diagnostics *)&v4 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    __assert_rtn("-[GTIntKeyedDictionary encodeWithCoder:]", ", 0, "[coder allowsKeyedCoding]"");
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[GTIntKeyedDictionary_tools_diagnostics allKeys](self, "allKeys"), @"keys");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __40__GTIntKeyedDictionary_encodeWithCoder___block_invoke;
  v5[3] = &unk_24900;
  v5[4] = a3;
  [(GTIntKeyedDictionary_tools_diagnostics *)self enumerateKeysAndObjectsUsingBlock:v5];
}

- (GTIntKeyedDictionary_tools_diagnostics)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    unint64_t v11 = "[coder allowsKeyedCoding]";
    goto LABEL_8;
  }
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0), @"keys");
  if (!v6)
  {
    unint64_t v11 = "keys";
LABEL_8:
    __assert_rtn("-[GTIntKeyedDictionary initWithCoder:]", "", 0, v11);
  }
  unint64_t v7 = v6;
  unint64_t v8 = -[GTIntKeyedDictionary_tools_diagnostics initWithCapacity:](self, "initWithCapacity:", [v6 count]);
  uint8x8_t v9 = v8;
  if (v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __38__GTIntKeyedDictionary_initWithCoder___block_invoke;
    v12[3] = &unk_24928;
    v12[4] = a3;
    v12[5] = v8;
    [v7 enumerateObjectsUsingBlock:v12];
  }
  return v9;
}

- (GTIntKeyedDictionary_tools_diagnostics)initWithIntKeyedDictionary:(id)a3
{
  objc_super v4 = -[GTIntKeyedDictionary_tools_diagnostics initWithCapacity:](self, "initWithCapacity:", [a3 count]);
  uint64_t v5 = v4;
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __51__GTIntKeyedDictionary_initWithIntKeyedDictionary___block_invoke;
    v7[3] = &unk_24900;
    v7[4] = v4;
    [a3 enumerateKeysAndObjectsUsingBlock:v7];
  }
  return v5;
}

- (GTIntKeyedDictionary_tools_diagnostics)initWithCapacity:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GTIntKeyedDictionary_tools_diagnostics;
  if ([(GTIntKeyedDictionary_tools_diagnostics *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (GTIntKeyedDictionary_tools_diagnostics)init
{
  return [(GTIntKeyedDictionary_tools_diagnostics *)self initWithCapacity:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end