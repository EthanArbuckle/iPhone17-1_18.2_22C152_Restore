@interface PHASESoundEventNodeAsset
+ (PHASESoundEventNodeAsset)new;
- (NSMutableDictionary)streamNodeFormats;
- (PHASESoundEventNodeAsset)init;
- (PHASESoundEventNodeAsset)initWithUID:(id)a3 actionTreeWeakReference:(const void *)a4 assetRegistry:(id)a5 details:(id)a6;
- (PHASESoundEventNodeAsset)initWithUID:(id)a3 assetRegistry:(id)a4;
- (PHASESoundEventNodeAsset)initWithUID:(id)a3 ownedActionTree:()unique_ptr<Phase:(std:(id)a5 :(id)a6 default_delete<Phase::ActionTree>>)a4 :ActionTree assetRegistry:details:;
- (const)getActionTree;
- (id).cxx_construct;
- (unint64_t)sizeInBytes;
- (void)getRandomHistory:(unint64_t)a3;
@end

@implementation PHASESoundEventNodeAsset

- (PHASESoundEventNodeAsset)init
{
  return 0;
}

+ (PHASESoundEventNodeAsset)new
{
  return 0;
}

- (PHASESoundEventNodeAsset)initWithUID:(id)a3 assetRegistry:(id)a4
{
  return 0;
}

- (PHASESoundEventNodeAsset)initWithUID:(id)a3 ownedActionTree:()unique_ptr<Phase:(std:(id)a5 :(id)a6 default_delete<Phase::ActionTree>>)a4 :ActionTree assetRegistry:details:
{
  v7 = [(PHASESoundEventNodeAsset *)self initWithUID:a3 actionTreeWeakReference:*(void *)a4.__ptr_.__value_ assetRegistry:a5 details:a6];
  v8 = v7;
  if (v7)
  {
    v9 = *(Phase::ActionTree **)a4.__ptr_.__value_;
    *(void *)a4.__ptr_.__value_ = 0;
    std::unique_ptr<Phase::ActionTree>::reset[abi:ne180100]((Phase::ActionTree **)&v7->_actionTreeOwnedAsset, v9);
    v10 = v8;
  }

  return v8;
}

- (PHASESoundEventNodeAsset)initWithUID:(id)a3 actionTreeWeakReference:(const void *)a4 assetRegistry:(id)a5 details:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PHASESoundEventNodeAsset;
  v13 = [(PHASEAsset *)&v18 initWithUID:v10 assetRegistry:v11];
  if (v13)
  {
    uint64_t v14 = [v12 streamNodeFormats];
    streamNodeFormats = v13->_streamNodeFormats;
    v13->_streamNodeFormats = (NSMutableDictionary *)v14;

    v13->_actionTreeReference = a4;
    v16 = v13;
  }

  return v13;
}

- (const)getActionTree
{
  return self->_actionTreeReference;
}

- (void)getRandomHistory:(unint64_t)a3
{
  unint64_t v4 = a3;
  p_randomHistory = &self->_randomHistory;
  unint64_t value = self->_randomHistory.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v8 = a3;
      if (value <= a3) {
        unint64_t v8 = a3 % value;
      }
    }
    else
    {
      unint64_t v8 = (value - 1) & a3;
    }
    v9 = p_randomHistory->__table_.__bucket_list_.__ptr_.__value_;
    id v10 = (void **)p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v8];
    if (v10)
    {
      for (i = *v10; i; i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == a3)
        {
          if (i[2] == a3) {
            return i + 3;
          }
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v12 >= value) {
              v12 %= value;
            }
          }
          else
          {
            v12 &= value - 1;
          }
          if (v12 != v8) {
            break;
          }
        }
      }
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v39 = 0u;
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v3 = a3;
      if (value <= a3) {
        unint64_t v3 = a3 % value;
      }
    }
    else
    {
      unint64_t v3 = (value - 1) & a3;
    }
    v13 = v9[v3];
    if (v13)
    {
      for (j = (void *)*v13; j; j = (void *)*j)
      {
        unint64_t v15 = j[1];
        if (v15 == a3)
        {
          if (j[2] == a3)
          {
            std::deque<int>::~deque[abi:ne180100]((uint64_t)&v39);
            return 0;
          }
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v15 >= value) {
              v15 %= value;
            }
          }
          else
          {
            v15 &= value - 1;
          }
          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v39 = 0u;
  }
  v16 = (char *)operator new(0x48uLL);
  p_p1 = &p_randomHistory->__table_.__p1_;
  v42[0] = v16;
  v42[1] = &p_randomHistory->__table_.__p1_;
  *(void *)v16 = 0;
  *((void *)v16 + 1) = v4;
  *((void *)v16 + 2) = v4;
  *(_OWORD *)(v16 + 24) = 0u;
  *(_OWORD *)(v16 + 40) = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  *((void *)v16 + 7) = 0;
  *((void *)v16 + 8) = 0;
  long long v41 = 0uLL;
  char v43 = 1;
  float v18 = (float)(p_randomHistory->__table_.__p2_.__value_ + 1);
  float v19 = p_randomHistory->__table_.__p3_.__value_;
  if (value && (float)(v19 * (float)value) >= v18)
  {
    unint64_t v4 = v3;
    goto LABEL_79;
  }
  BOOL v20 = 1;
  if (value >= 3) {
    BOOL v20 = (value & (value - 1)) != 0;
  }
  unint64_t v21 = v20 | (2 * value);
  unint64_t v22 = vcvtps_u32_f32(v18 / v19);
  if (v21 <= v22) {
    int8x8_t prime = (int8x8_t)v22;
  }
  else {
    int8x8_t prime = (int8x8_t)v21;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t value = p_randomHistory->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  }
  if (*(void *)&prime <= value)
  {
    if (*(void *)&prime >= value) {
      goto LABEL_75;
    }
    unint64_t v30 = vcvtps_u32_f32((float)p_randomHistory->__table_.__p2_.__value_ / p_randomHistory->__table_.__p3_.__value_);
    if (value < 3 || (uint8x8_t v31 = (uint8x8_t)vcnt_s8((int8x8_t)value), v31.i16[0] = vaddlv_u8(v31), v31.u32[0] > 1uLL))
    {
      unint64_t v30 = std::__next_prime(v30);
    }
    else
    {
      uint64_t v32 = 1 << -(char)__clz(v30 - 1);
      if (v30 >= 2) {
        unint64_t v30 = v32;
      }
    }
    if (*(void *)&prime <= v30) {
      int8x8_t prime = (int8x8_t)v30;
    }
    if (*(void *)&prime >= value)
    {
      unint64_t value = p_randomHistory->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      goto LABEL_75;
    }
    if (!*(void *)&prime)
    {
      v38 = p_randomHistory->__table_.__bucket_list_.__ptr_.__value_;
      p_randomHistory->__table_.__bucket_list_.__ptr_.__value_ = 0;
      if (v38) {
        operator delete(v38);
      }
      unint64_t value = 0;
      p_randomHistory->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      goto LABEL_75;
    }
  }
  if (*(void *)&prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  v24 = (void **)operator new(8 * *(void *)&prime);
  v25 = p_randomHistory->__table_.__bucket_list_.__ptr_.__value_;
  p_randomHistory->__table_.__bucket_list_.__ptr_.__value_ = v24;
  if (v25) {
    operator delete(v25);
  }
  uint64_t v26 = 0;
  p_randomHistory->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
  do
    p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v26++] = 0;
  while (*(void *)&prime != v26);
  next = p_p1->__value_.__next_;
  if (p_p1->__value_.__next_)
  {
    unint64_t v28 = next[1];
    uint8x8_t v29 = (uint8x8_t)vcnt_s8(prime);
    v29.i16[0] = vaddlv_u8(v29);
    if (v29.u32[0] > 1uLL)
    {
      if (v28 >= *(void *)&prime) {
        v28 %= *(void *)&prime;
      }
    }
    else
    {
      v28 &= *(void *)&prime - 1;
    }
    p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v28] = p_p1;
    v33 = (void *)*next;
    if (*next)
    {
      do
      {
        unint64_t v34 = v33[1];
        if (v29.u32[0] > 1uLL)
        {
          if (v34 >= *(void *)&prime) {
            v34 %= *(void *)&prime;
          }
        }
        else
        {
          v34 &= *(void *)&prime - 1;
        }
        if (v34 != v28)
        {
          if (!p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v34])
          {
            p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v34] = next;
            goto LABEL_71;
          }
          void *next = *v33;
          void *v33 = *(void *)p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v34];
          *(void *)p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v34] = v33;
          v33 = next;
        }
        unint64_t v34 = v28;
LABEL_71:
        next = v33;
        v33 = (void *)*v33;
        unint64_t v28 = v34;
      }
      while (v33);
    }
  }
  unint64_t value = (unint64_t)prime;
LABEL_75:
  if ((value & (value - 1)) != 0)
  {
    if (value <= v4) {
      v4 %= value;
    }
  }
  else
  {
    v4 &= value - 1;
  }
LABEL_79:
  v35 = (void **)p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v4];
  i = (void *)v42[0];
  if (v35)
  {
    *(void *)v42[0] = *v35;
LABEL_87:
    *v35 = i;
    goto LABEL_88;
  }
  *(void *)v42[0] = p_randomHistory->__table_.__p1_.__value_.__next_;
  p_randomHistory->__table_.__p1_.__value_.__next_ = i;
  p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v4] = p_p1;
  if (*i)
  {
    unint64_t v36 = *(void *)(*i + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v36 >= value) {
        v36 %= value;
      }
    }
    else
    {
      v36 &= value - 1;
    }
    v35 = &p_randomHistory->__table_.__bucket_list_.__ptr_.__value_[v36];
    goto LABEL_87;
  }
LABEL_88:
  v42[0] = 0;
  ++p_randomHistory->__table_.__p2_.__value_;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,std::deque<int>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::deque<int>>,void *>>>>::reset[abi:ne180100]((uint64_t)v42);
  std::deque<int>::~deque[abi:ne180100]((uint64_t)&v39);
  return i + 3;
}

- (unint64_t)sizeInBytes
{
  actionTreeReference = (unsigned int *)self->_actionTreeReference;
  return 4 * actionTreeReference[10]
       + 8 * (actionTreeReference[6] + (unint64_t)actionTreeReference[2] + actionTreeReference[10])
       + 464 * actionTreeReference[16]
       + actionTreeReference[20]
       + 5944 * actionTreeReference[24]
       + 120;
}

- (NSMutableDictionary)streamNodeFormats
{
  return self->_streamNodeFormats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamNodeFormats, 0);
  p_randomHistory = &self->_randomHistory;
  next = self->_randomHistory.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v5 = (void *)*next;
      std::deque<int>::~deque[abi:ne180100]((uint64_t)(next + 3));
      operator delete(next);
      next = v5;
    }
    while (v5);
  }
  unint64_t value = p_randomHistory->__table_.__bucket_list_.__ptr_.__value_;
  p_randomHistory->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }

  std::unique_ptr<Phase::ActionTree>::reset[abi:ne180100]((Phase::ActionTree **)&self->_actionTreeOwnedAsset, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

@end