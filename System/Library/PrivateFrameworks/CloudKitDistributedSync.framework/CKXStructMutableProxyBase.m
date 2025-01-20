@interface CKXStructMutableProxyBase
- ($3CC19D079FD0B010EE84973AA846B91B)mutableListInstanceForField:(SEL)a3;
- (BOOL)isMutable;
- (id).cxx_construct;
- (void)commit;
- (void)reset;
@end

@implementation CKXStructMutableProxyBase

- (BOOL)isMutable
{
  return 1;
}

- (void)commit
{
  v4 = objc_msgSend_backingStore(self, a2, v2);
  v6 = objc_msgSend_writerForProxy_(v4, v5, (uint64_t)self);
  objc_msgSend_structInstance(self, v7, v8);
  objc_msgSend_commitStruct_(v6, v9, (uint64_t)v11);

  v10.receiver = self;
  v10.super_class = (Class)CKXStructMutableProxyBase;
  [(CKXProxyBase *)&v10 commit];
}

- (void)reset
{
  v8.receiver = self;
  v8.super_class = (Class)CKXStructMutableProxyBase;
  [(CKXStructProxyBase *)&v8 reset];
  p_fieldTokenToListInstance = &self->fieldTokenToListInstance;
  if (p_fieldTokenToListInstance->__table_.__p2_.__value_)
  {
    next = p_fieldTokenToListInstance->__table_.__p1_.__value_.__next_;
    if (next)
    {
      do
      {
        v5 = (void *)*next;
        operator delete(next);
        next = v5;
      }
      while (v5);
    }
    p_fieldTokenToListInstance->__table_.__p1_.__value_.__next_ = 0;
    unint64_t value = p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (uint64_t i = 0; i != value; ++i)
        p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[i] = 0;
    }
    p_fieldTokenToListInstance->__table_.__p2_.__value_ = 0;
  }
}

- ($3CC19D079FD0B010EE84973AA846B91B)mutableListInstanceForField:(SEL)a3
{
  p_fieldTokenToListInstance = &self->fieldTokenToListInstance;
  if (sub_1DD31616C(&self->fieldTokenToListInstance.__table_.__bucket_list_.__ptr_.__value_, a4)) {
    goto LABEL_79;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  objc_super v10 = objc_msgSend_backingStore(self, v8, v9);
  unint64_t v12 = objc_msgSend_writerForProxy_(v10, v11, (uint64_t)self);
  objc_msgSend_structInstance(self, v13, v14);
  if (v12)
  {
    objc_msgSend_beginReferencedListForReference_inStruct_((void *)v12, v15, a4, v45);
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
  }

  unint64_t value = p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] > 1uLL)
    {
      unint64_t v12 = a4;
      if (value <= a4) {
        unint64_t v12 = a4 % value;
      }
    }
    else
    {
      unint64_t v12 = (value - 1) & a4;
    }
    v18 = (void **)p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v12];
    if (v18)
    {
      v19 = (char *)*v18;
      if (*v18)
      {
        do
        {
          unint64_t v20 = *((void *)v19 + 1);
          if (v20 == a4)
          {
            if (*((void *)v19 + 2) == a4) {
              goto LABEL_78;
            }
          }
          else
          {
            if (v17.u32[0] > 1uLL)
            {
              if (v20 >= value) {
                v20 %= value;
              }
            }
            else
            {
              v20 &= value - 1;
            }
            if (v20 != v12) {
              break;
            }
          }
          v19 = *(char **)v19;
        }
        while (v19);
      }
    }
  }
  v19 = (char *)operator new(0x38uLL);
  *(void *)v19 = 0;
  *((void *)v19 + 1) = a4;
  *((void *)v19 + 2) = a4;
  *(_OWORD *)(v19 + 24) = 0u;
  *(_OWORD *)(v19 + 40) = 0u;
  float v21 = (float)(p_fieldTokenToListInstance->__table_.__p2_.__value_ + 1);
  float v22 = p_fieldTokenToListInstance->__table_.__p3_.__value_;
  if (!value || (float)(v22 * (float)value) < v21)
  {
    BOOL v23 = 1;
    if (value >= 3) {
      BOOL v23 = (value & (value - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * value);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      int8x8_t prime = (int8x8_t)v25;
    }
    else {
      int8x8_t prime = (int8x8_t)v24;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t value = p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    }
    if (*(void *)&prime > value) {
      goto LABEL_34;
    }
    if (*(void *)&prime < value)
    {
      unint64_t v33 = vcvtps_u32_f32((float)p_fieldTokenToListInstance->__table_.__p2_.__value_/ p_fieldTokenToListInstance->__table_.__p3_.__value_);
      if (value < 3 || (uint8x8_t v34 = (uint8x8_t)vcnt_s8((int8x8_t)value), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        unint64_t v33 = std::__next_prime(v33);
      }
      else
      {
        uint64_t v35 = 1 << -(char)__clz(v33 - 1);
        if (v33 >= 2) {
          unint64_t v33 = v35;
        }
      }
      if (*(void *)&prime <= v33) {
        int8x8_t prime = (int8x8_t)v33;
      }
      if (*(void *)&prime >= value)
      {
        unint64_t value = p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      }
      else
      {
        if (prime)
        {
LABEL_34:
          if (*(void *)&prime >> 61) {
            sub_1DD251C54();
          }
          v27 = (void **)operator new(8 * *(void *)&prime);
          v28 = p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_;
          p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_ = v27;
          if (v28) {
            operator delete(v28);
          }
          uint64_t v29 = 0;
          p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
          do
            p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v29++] = 0;
          while (*(void *)&prime != v29);
          next = p_fieldTokenToListInstance->__table_.__p1_.__value_.__next_;
          if (next)
          {
            unint64_t v31 = next[1];
            uint8x8_t v32 = (uint8x8_t)vcnt_s8(prime);
            v32.i16[0] = vaddlv_u8(v32);
            if (v32.u32[0] > 1uLL)
            {
              if (v31 >= *(void *)&prime) {
                v31 %= *(void *)&prime;
              }
            }
            else
            {
              v31 &= *(void *)&prime - 1;
            }
            p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v31] = &p_fieldTokenToListInstance->__table_.__p1_;
            v36 = (void *)*next;
            if (*next)
            {
              do
              {
                unint64_t v37 = v36[1];
                if (v32.u32[0] > 1uLL)
                {
                  if (v37 >= *(void *)&prime) {
                    v37 %= *(void *)&prime;
                  }
                }
                else
                {
                  v37 &= *(void *)&prime - 1;
                }
                if (v37 != v31)
                {
                  if (!p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v37])
                  {
                    p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v37] = next;
                    goto LABEL_59;
                  }
                  void *next = *v36;
                  void *v36 = *(void *)p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v37];
                  *(void *)p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v37] = v36;
                  v36 = next;
                }
                unint64_t v37 = v31;
LABEL_59:
                next = v36;
                v36 = (void *)*v36;
                unint64_t v31 = v37;
              }
              while (v36);
            }
          }
          unint64_t value = (unint64_t)prime;
          goto LABEL_63;
        }
        v44 = p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_;
        p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_ = 0;
        if (v44) {
          operator delete(v44);
        }
        unint64_t value = 0;
        p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      }
    }
LABEL_63:
    if ((value & (value - 1)) != 0)
    {
      if (value <= a4) {
        unint64_t v12 = a4 % value;
      }
      else {
        unint64_t v12 = a4;
      }
    }
    else
    {
      unint64_t v12 = (value - 1) & a4;
    }
  }
  v38 = p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_;
  v39 = (void **)p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v12];
  if (v39)
  {
    *(void *)v19 = *v39;
  }
  else
  {
    *(void *)v19 = p_fieldTokenToListInstance->__table_.__p1_.__value_.__next_;
    p_fieldTokenToListInstance->__table_.__p1_.__value_.__next_ = v19;
    v38[v12] = &p_fieldTokenToListInstance->__table_.__p1_;
    if (!*(void *)v19) {
      goto LABEL_77;
    }
    unint64_t v40 = *(void *)(*(void *)v19 + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v40 >= value) {
        v40 %= value;
      }
    }
    else
    {
      v40 &= value - 1;
    }
    v39 = &p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_[v40];
  }
  *v39 = v19;
LABEL_77:
  ++p_fieldTokenToListInstance->__table_.__p2_.__value_;
LABEL_78:
  long long v41 = v47;
  *(_OWORD *)(v19 + 24) = v46;
  *(_OWORD *)(v19 + 40) = v41;
LABEL_79:
  result = ($3CC19D079FD0B010EE84973AA846B91B *)sub_1DD31616C(p_fieldTokenToListInstance, a4);
  if (!result) {
    sub_1DD25B5D0("unordered_map::at: key not found");
  }
  long long v43 = *(_OWORD *)&result[1].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&result->var3;
  *(_OWORD *)&retstr->var2 = v43;
  return result;
}

- (void).cxx_destruct
{
  p_fieldTokenToListInstance = &self->fieldTokenToListInstance;
  next = self->fieldTokenToListInstance.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (void *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  unint64_t value = p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_;
  p_fieldTokenToListInstance->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
  {
    operator delete(value);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  return self;
}

@end