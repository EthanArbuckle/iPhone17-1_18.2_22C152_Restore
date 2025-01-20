@interface GEOTileKeyMap
- (GEOTileKeyMap)init;
- (GEOTileKeyMap)initWithMapType:(int64_t)a3;
- (GEOTileKeyMap)initWithMapType:(int64_t)a3 capacity:(unint64_t)a4;
- (id)contentsDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (void)dealloc;
- (void)objectForKey:(void *)a3;
- (void)removeObjectForKey:(void *)a3;
- (void)reserveCapacity:(unint64_t)a3;
- (void)setObject:(void *)a3 forKey:(void *)a4;
@end

@implementation GEOTileKeyMap

- (void)removeObjectForKey:(void *)a3
{
  v4 = *(void **)(a1 + 16);
  v5 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>(v4, a3);
  if (!v5) {
    return;
  }
  if (*(void *)(a1 + 8)) {
    id v15 = 0;
  }
  else {
    id v15 = (id)v5[4];
  }
  int8x8_t v6 = (int8x8_t)v4[1];
  uint64_t v7 = *v5;
  unint64_t v8 = v5[1];
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v6);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v6) {
      v8 %= *(void *)&v6;
    }
  }
  else
  {
    v8 &= *(void *)&v6 - 1;
  }
  v10 = *(uint64_t **)(*v4 + 8 * v8);
  do
  {
    v11 = v10;
    v10 = (uint64_t *)*v10;
  }
  while (v10 != v5);
  if (v11 == v4 + 2) {
    goto LABEL_23;
  }
  unint64_t v12 = v11[1];
  if (v9.u32[0] > 1uLL)
  {
    if (v12 >= *(void *)&v6) {
      v12 %= *(void *)&v6;
    }
  }
  else
  {
    v12 &= *(void *)&v6 - 1;
  }
  if (v12 != v8)
  {
LABEL_23:
    if (v7)
    {
      unint64_t v13 = *(void *)(v7 + 8);
      if (v9.u32[0] > 1uLL)
      {
        unint64_t v14 = *(void *)(v7 + 8);
        if (v13 >= *(void *)&v6) {
          unint64_t v14 = v13 % *(void *)&v6;
        }
      }
      else
      {
        unint64_t v14 = v13 & (*(void *)&v6 - 1);
      }
      if (v14 == v8) {
        goto LABEL_27;
      }
    }
    *(void *)(*v4 + 8 * v8) = 0;
    uint64_t v7 = *v5;
  }
  if (v7)
  {
    unint64_t v13 = *(void *)(v7 + 8);
LABEL_27:
    if (v9.u32[0] > 1uLL)
    {
      if (v13 >= *(void *)&v6) {
        v13 %= *(void *)&v6;
      }
    }
    else
    {
      v13 &= *(void *)&v6 - 1;
    }
    if (v13 != v8)
    {
      *(void *)(*v4 + 8 * v13) = v11;
      uint64_t v7 = *v5;
    }
  }
  uint64_t *v11 = v7;
  uint64_t *v5 = 0;
  --v4[3];
  operator delete(v5);
}

- (void)objectForKey:(void *)a3
{
  result = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>(*(void **)(a1 + 16), a3);
  if (result)
  {
    result = (void *)result[4];
    if (!*(void *)(a1 + 8))
    {
      v5 = result;
      return v5;
    }
  }
  return result;
}

- (void)setObject:(void *)a3 forKey:(void *)a4
{
  if (*(void *)(a1 + 8))
  {
    id v29 = 0;
    uint64_t v8 = *(void *)(a1 + 16);
  }
  else
  {
    id v9 = a3;
    uint64_t v8 = *(void *)(a1 + 16);
    v10 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((void *)v8, a4);
    if (v10) {
      id v29 = (id)v10[4];
    }
    else {
      id v29 = 0;
    }
  }
  unint64_t v11 = GEOTileKeyHash(a4);
  unint64_t v12 = v11;
  unint64_t v13 = *(void *)(v8 + 8);
  if (v13)
  {
    uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
    v14.i16[0] = vaddlv_u8(v14);
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v4 = v11;
      if (v11 >= v13) {
        unint64_t v4 = v11 % v13;
      }
    }
    else
    {
      unint64_t v4 = (v13 - 1) & v11;
    }
    id v15 = *(void ***)(*(void *)v8 + 8 * v4);
    if (v15)
    {
      for (i = *v15; i; i = (void *)*i)
      {
        unint64_t v17 = i[1];
        if (v17 == v11)
        {
          if (i[2] == *a4 && i[3] == a4[1])
          {
            v28 = v29;
            goto LABEL_49;
          }
        }
        else
        {
          if (v14.u32[0] > 1uLL)
          {
            if (v17 >= v13) {
              v17 %= v13;
            }
          }
          else
          {
            v17 &= v13 - 1;
          }
          if (v17 != v4) {
            break;
          }
        }
      }
    }
  }
  i = operator new(0x28uLL);
  void *i = 0;
  i[1] = v12;
  *((_OWORD *)i + 1) = *(_OWORD *)a4;
  i[4] = 0;
  float v19 = (float)(unint64_t)(*(void *)(v8 + 24) + 1);
  float v20 = *(float *)(v8 + 32);
  if (!v13 || (float)(v20 * (float)v13) < v19)
  {
    BOOL v21 = 1;
    if (v13 >= 3) {
      BOOL v21 = (v13 & (v13 - 1)) != 0;
    }
    unint64_t v22 = v21 | (2 * v13);
    unint64_t v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23) {
      size_t v24 = v23;
    }
    else {
      size_t v24 = v22;
    }
    std::__hash_table<google::protobuf::Descriptor const*,std::hash<google::protobuf::Descriptor const*>,std::equal_to<google::protobuf::Descriptor const*>,std::allocator<google::protobuf::Descriptor const*>>::__rehash<true>(v8, v24);
    unint64_t v13 = *(void *)(v8 + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v12 >= v13) {
        unint64_t v4 = v12 % v13;
      }
      else {
        unint64_t v4 = v12;
      }
    }
    else
    {
      unint64_t v4 = (v13 - 1) & v12;
    }
  }
  uint64_t v25 = *(void *)v8;
  v26 = *(void **)(*(void *)v8 + 8 * v4);
  if (v26)
  {
    void *i = *v26;
    v28 = v29;
LABEL_47:
    void *v26 = i;
    goto LABEL_48;
  }
  void *i = *(void *)(v8 + 16);
  *(void *)(v8 + 16) = i;
  *(void *)(v25 + 8 * v4) = v8 + 16;
  v28 = v29;
  if (*i)
  {
    unint64_t v27 = *(void *)(*i + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v27 >= v13) {
        v27 %= v13;
      }
    }
    else
    {
      v27 &= v13 - 1;
    }
    v26 = (void *)(*(void *)v8 + 8 * v27);
    goto LABEL_47;
  }
LABEL_48:
  ++*(void *)(v8 + 24);
LABEL_49:
  i[4] = a3;
}

- (GEOTileKeyMap)initWithMapType:(int64_t)a3 capacity:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTileKeyMap;
  v5 = [(GEOTileKeyMap *)&v7 init];
  if (v5)
  {
    v5->_type = a3;
    operator new();
  }
  return 0;
}

- (GEOTileKeyMap)initWithMapType:(int64_t)a3
{
  return [(GEOTileKeyMap *)self initWithMapType:a3 capacity:0];
}

- (void)reserveCapacity:(unint64_t)a3
{
}

- (void)dealloc
{
  if (!self->_type)
  {
    for (i = (uint64_t **)*((void *)self->_map + 2); i; i = (uint64_t **)*i)
  }
  map = (void **)self->_map;
  if (map)
  {
    v5 = map[2];
    if (v5)
    {
      do
      {
        int8x8_t v6 = (void *)*v5;
        operator delete(v5);
        v5 = v6;
      }
      while (v6);
    }
    objc_super v7 = *map;
    *map = 0;
    if (v7) {
      operator delete(v7);
    }
    MEMORY[0x18C11F580](map, 0x10A0C408EF24B1CLL);
  }
  v8.receiver = self;
  v8.super_class = (Class)GEOTileKeyMap;
  [(GEOTileKeyMap *)&v8 dealloc];
}

- (GEOTileKeyMap)init
{
  result = (GEOTileKeyMap *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMapType:", self->_type);
  map = self->_map;
  uint64_t v6 = v4[2];
  if ((_DWORD *)v6 != map)
  {
    *(_DWORD *)(v6 + 32) = map[8];
    objc_super v7 = (uint64_t *)*((void *)map + 2);
    uint64_t v8 = *(void *)(v6 + 8);
    if (!v8) {
      goto LABEL_10;
    }
    for (uint64_t i = 0; i != v8; *(void *)(*(void *)v6 + 8 * i++) = 0)
      ;
    v10 = *(uint64_t **)(v6 + 16);
    *(void *)(v6 + 16) = 0;
    *(void *)(v6 + 24) = 0;
    if (v10)
    {
      while (v7)
      {
        *((_OWORD *)v10 + 1) = *((_OWORD *)v7 + 1);
        v10[4] = v7[4];
        unint64_t v11 = (uint64_t *)*v10;
        std::__hash_table<std::__hash_value_type<_GEOTileKey,void const*>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,void const*>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,void const*>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,void const*>>>::__node_insert_multi(v6, v10);
        objc_super v7 = (uint64_t *)*v7;
        v10 = v11;
        if (!v11) {
          goto LABEL_10;
        }
      }
      do
      {
        unint64_t v17 = (uint64_t *)*v10;
        operator delete(v10);
        v10 = v17;
      }
      while (v17);
    }
    else
    {
LABEL_10:
      while (v7)
      {
        unint64_t v12 = operator new(0x28uLL);
        *unint64_t v12 = 0;
        v12[1] = 0;
        long long v13 = *((_OWORD *)v7 + 1);
        v12[4] = v7[4];
        *((_OWORD *)v12 + 1) = v13;
        v12[1] = GEOTileKeyHash(v12 + 2);
        std::__hash_table<std::__hash_value_type<_GEOTileKey,void const*>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,void const*>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,void const*>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,void const*>>>::__node_insert_multi(v6, v12);
        objc_super v7 = (uint64_t *)*v7;
      }
    }
  }
  if (!self->_type)
  {
    for (j = (uint64_t **)*((void *)self->_map + 2); j; j = (uint64_t **)*j)
      id v15 = j[4];
  }
  return v4;
}

- (id)contentsDescription
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  unint64_t v4 = (objc_class *)objc_opt_class();
  v5 = (void *)[v3 stringWithFormat:@"<%@ %p>", NSStringFromClass(v4), self];
  for (uint64_t i = (uint64_t *)*((void *)self->_map + 2); i; uint64_t i = (uint64_t *)*i)
  {
    *(_OWORD *)uint64_t v8 = *((_OWORD *)i + 1);
    [v5 appendFormat:@"\n%@ => %@", GEOStringFromTileKey(v8), i[4]];
  }
  return v5;
}

- (unint64_t)count
{
  return *((void *)self->_map + 3);
}

@end