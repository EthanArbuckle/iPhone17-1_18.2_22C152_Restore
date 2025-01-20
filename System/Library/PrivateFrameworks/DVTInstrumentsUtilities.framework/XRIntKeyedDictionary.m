@interface XRIntKeyedDictionary
+ (BOOL)supportsSecureCoding;
- (XRIntKeyedDictionary)init;
- (XRIntKeyedDictionary)initWithCoder:(id)a3;
- (XRIntKeyedDictionary)initWithIntKeyedDictionary:(id)a3 copyObjects:(BOOL)a4;
- (id).cxx_construct;
- (id)allKeys;
- (id)allObjects;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)objectForIntegerKey:(unint64_t)a3;
- (id)objectForIntegerKey:(unint64_t)a3 options:(unint64_t)a4;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateObjectsAndIntegerKeys:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForIntegerKey:(unint64_t)a3;
- (void)setObject:(id)a3 forIntegerKey:(unint64_t)a4;
- (void)setPrototypeObject:(id)a3;
@end

@implementation XRIntKeyedDictionary

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XRIntKeyedDictionary)initWithIntKeyedDictionary:(id)a3 copyObjects:(BOOL)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)XRIntKeyedDictionary;
  v7 = [(XRIntKeyedDictionary *)&v16 init];
  v8 = v7;
  if (v6 && v7)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_2345907A4;
    v13[3] = &unk_264BF2118;
    BOOL v15 = a4;
    v14 = v7;
    [v6 enumerateObjectsAndIntegerKeys:v9 usingBlock:v10];
  }
  return v8;
}

- (XRIntKeyedDictionary)init
{
  return (XRIntKeyedDictionary *)((uint64_t (*)(XRIntKeyedDictionary *, char *, void, void))MEMORY[0x270F9A6D0])(self, sel_initWithIntKeyedDictionary_copyObjects_, 0, 0);
}

- (XRIntKeyedDictionary)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v10 = (XRIntKeyedDictionary *)[self init:v5 withKey:v6 withValue:v7 withCapacity:v8];
  if (v10)
  {
    unsigned int v30 = 0;
    v4 = *(int32_t *)&v30;
    if (v30)
    {
      for (unsigned int i = 0; i < v30; ++i)
      {
        uint64_t v29 = 0;
        objc_super v16 = objc_msgSend(v4, v11, v12, v13, v14);
        uint64_t v29 = [v16 v17:v18 v19:v20];

        uint64_t v25 = [v4 decodeObject:v21 withTransitionContext:v22 withObject:v23 withObject:v24];
        v31 = &v29;
        v26 = sub_234590F90((uint64_t)&v10->_hash_map, (unint64_t *)&v29, (uint64_t)&unk_2345A0510, &v31);
        v27 = (void *)v26[3];
        v26[3] = v25;
      }
    }
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int value = self->_hash_map.__table_.__p2_.__value_;
  [v4 setValue:value];
  for (unsigned int i = &self->_hash_map.__table_.__p1_; ; [v4 _encodeObject:i[3].__value_.__next_ withKey:v16 withKey:v17])
  {
    unsigned int i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, id>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, id>, void *>>> *)i->__value_.__next_;
    if (!i) {
      break;
    }
    uint64_t v11 = [NSNumber numberWithUnsignedLongLong:i[2].__value_.__next_];
    [v4 setFoo:v12];
  }
}

- (id)objectForIntegerKey:(unint64_t)a3
{
  return (id)((uint64_t (*)(XRIntKeyedDictionary *, char *, unint64_t, void))MEMORY[0x270F9A6D0])(self, sel_objectForIntegerKey_options_, a3, 0);
}

- (id)objectForIntegerKey:(unint64_t)a3 options:(unint64_t)a4
{
  char v4 = a4;
  unint64_t v14 = a3;
  p_hash_map = &self->_hash_map;
  uint64_t v7 = sub_2345914B4(&self->_hash_map.__table_.__bucket_list_.__ptr_.__value_, &v14);
  if (v7)
  {
    id v11 = (id)v7[3];
  }
  else if (v4)
  {
    id v11 = [(id)objc_msgSend_mutableCopyWithZone_(self->_prototype, v8, 0, v9, v10) mutableCopyWithZone:0];
    BOOL v15 = &v14;
    uint64_t v12 = (id *)sub_234590F90((uint64_t)p_hash_map, &v14, (uint64_t)&unk_2345A0510, &v15);
    objc_storeStrong(v12 + 3, v11);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return (id)((uint64_t (*)(XRIntKeyedDictionary *, char *, unint64_t, void))MEMORY[0x270F9A6D0])(self, sel_objectForIntegerKey_options_, a3, 0);
}

- (void)setPrototypeObject:(id)a3
{
}

- (void)setObject:(id)a3 forIntegerKey:(unint64_t)a4
{
  unint64_t v10 = a4;
  id v6 = a3;
  id v11 = v6;
  uint64_t v7 = (id *)sub_234591568((uint64_t)&self->_hash_map, &v10, (uint64_t *)&v10);
  char v9 = v8;

  if (!v9) {
    objc_storeStrong(v7 + 3, a3);
  }
}

- (void)removeObjectForIntegerKey:(unint64_t)a3
{
  unint64_t v3 = a3;
  sub_2345917B4(&self->_hash_map.__table_.__bucket_list_.__ptr_.__value_, &v3);
}

- (void)removeAllObjects
{
}

- (id)allObjects
{
  v5 = [MEMORY[0x263EFF980] arrayWithCapacity:a2];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_234590D1C;
  v11[3] = &unk_264BF2140;
  id v6 = v5;
  id v12 = v6;
  [self enumerateObjectsAndIntegerKeys:v7 usingBlock:v8];

  return v6;
}

- (id)allKeys
{
  v5 = [MEMORY[0x263EFF980] arrayWithCapacity:a2];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_234590DF4;
  v11[3] = &unk_264BF2140;
  id v6 = v5;
  id v12 = v6;
  [self enumerateObjectsAndIntegerKeys:v7 usingBlock:v8 withContext:v9];

  return v6;
}

- (void)enumerateObjectsAndIntegerKeys:(id)a3
{
  char v6 = 0;
  next = self->_hash_map.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      (*((void (**)(id, void, void, char *))a3 + 2))(a3, next[3], next[2], &v6);
      next = (void *)*next;
      if (next) {
        BOOL v5 = v6 == 0;
      }
      else {
        BOOL v5 = 0;
      }
    }
    while (v5);
  }
}

- (unint64_t)count
{
  return self->_hash_map.__table_.__p2_.__value_;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  char v4 = (XRIntKeyedDictionary *)objc_opt_new();
  BOOL v5 = v4;
  if (v4 != self)
  {
    v4->_hash_map.__table_.__p3_.__value_ = self->_hash_map.__table_.__p3_.__value_;
    sub_234591A1C(&v4->_hash_map.__table_.__bucket_list_.__ptr_.__value_, (void *)self->_hash_map.__table_.__p1_.__value_.__next_, 0);
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototype, 0);

  sub_234592094((uint64_t)&self->_hash_map);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

@end