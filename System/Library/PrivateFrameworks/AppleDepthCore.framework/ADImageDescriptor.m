@interface ADImageDescriptor
+ (id)descriptorForSupportedSizes:(id)a3 pixelFormat:(unsigned int)a4;
+ (id)descriptorWithDefaultSize:(CGSize)a3 pixelFormat:(unsigned int)a4;
- (ADImageDescriptor)initWithSupportedSizes:(id)a3 pixelFormat:(unsigned int)a4;
- (BOOL)supportsLayout:(unint64_t)a3;
- (CGSize)sizeForLayout:(unint64_t)a3;
- (id).cxx_construct;
- (id)cloneWithDifferentFormat:(unsigned int)a3;
- (unint64_t)layoutForSize:(CGSize)a3;
- (unsigned)pixelFormat;
@end

@implementation ADImageDescriptor

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

+ (id)descriptorForSupportedSizes:(id)a3 pixelFormat:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = [[ADImageDescriptor alloc] initWithSupportedSizes:v5 pixelFormat:v4];

  return v6;
}

- (void).cxx_destruct
{
  next = self->_sizeForLayout.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      uint64_t v4 = (void *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_;
  self->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
  {
    operator delete(value);
  }
}

- (ADImageDescriptor)initWithSupportedSizes:(id)a3 pixelFormat:(unsigned int)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v50 = a3;
  v55.receiver = self;
  v55.super_class = (Class)ADImageDescriptor;
  v7 = [(ADImageDescriptor *)&v55 init];
  if (v7)
  {
    unsigned int v49 = a4;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v8 = v50;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v52;
      p_p1 = &v7->_sizeForLayout.__table_.__p1_;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v52 != v10) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v51 + 1) + 8 * v12);
          [v13 size];
          uint64_t v15 = v14;
          uint64_t v17 = v16;
          unint64_t v18 = [v13 layout];
          unint64_t v19 = v18;
          unint64_t value = v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          if (value)
          {
            uint8x8_t v21 = (uint8x8_t)vcnt_s8((int8x8_t)value);
            v21.i16[0] = vaddlv_u8(v21);
            if (v21.u32[0] > 1uLL)
            {
              unint64_t v4 = v18;
              if (v18 >= value) {
                unint64_t v4 = v18 % value;
              }
            }
            else
            {
              unint64_t v4 = (value - 1) & v18;
            }
            v22 = (void **)v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_[v4];
            if (v22)
            {
              for (i = *v22; i; i = (void *)*i)
              {
                unint64_t v24 = i[1];
                if (v24 == v18)
                {
                  if (i[2] == v18) {
                    goto LABEL_79;
                  }
                }
                else
                {
                  if (v21.u32[0] > 1uLL)
                  {
                    if (v24 >= value) {
                      v24 %= value;
                    }
                  }
                  else
                  {
                    v24 &= value - 1;
                  }
                  if (v24 != v4) {
                    break;
                  }
                }
              }
            }
          }
          i = operator new(0x28uLL);
          void *i = 0;
          i[1] = v19;
          i[3] = 0;
          i[4] = 0;
          i[2] = v19;
          float v25 = (float)(v7->_sizeForLayout.__table_.__p2_.__value_ + 1);
          float v26 = v7->_sizeForLayout.__table_.__p3_.__value_;
          if (!value || (float)(v26 * (float)value) < v25)
          {
            BOOL v27 = (value & (value - 1)) != 0;
            if (value < 3) {
              BOOL v27 = 1;
            }
            unint64_t v28 = v27 | (2 * value);
            unint64_t v29 = vcvtps_u32_f32(v25 / v26);
            if (v28 <= v29) {
              int8x8_t prime = (int8x8_t)v29;
            }
            else {
              int8x8_t prime = (int8x8_t)v28;
            }
            if (*(void *)&prime == 1)
            {
              int8x8_t prime = (int8x8_t)2;
            }
            else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
            {
              int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
              unint64_t value = v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
            }
            if (*(void *)&prime <= value)
            {
              if (*(void *)&prime < value)
              {
                unint64_t v37 = vcvtps_u32_f32((float)v7->_sizeForLayout.__table_.__p2_.__value_ / v7->_sizeForLayout.__table_.__p3_.__value_);
                if (value < 3
                  || (uint8x8_t v38 = (uint8x8_t)vcnt_s8((int8x8_t)value), v38.i16[0] = vaddlv_u8(v38), v38.u32[0] > 1uLL))
                {
                  unint64_t v37 = std::__next_prime(v37);
                }
                else
                {
                  uint64_t v39 = 1 << -(char)__clz(v37 - 1);
                  if (v37 >= 2) {
                    unint64_t v37 = v39;
                  }
                }
                if (*(void *)&prime <= v37) {
                  int8x8_t prime = (int8x8_t)v37;
                }
                if (*(void *)&prime >= value)
                {
                  unint64_t value = v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
                }
                else
                {
                  if (prime) {
                    goto LABEL_35;
                  }
                  v46 = v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_;
                  v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_ = 0;
                  if (v46) {
                    operator delete(v46);
                  }
                  unint64_t value = 0;
                  v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
                }
              }
            }
            else
            {
LABEL_35:
              if (*(void *)&prime >> 61) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              v31 = (void **)operator new(8 * *(void *)&prime);
              v32 = v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_;
              v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_ = v31;
              if (v32) {
                operator delete(v32);
              }
              uint64_t v33 = 0;
              v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
              do
                v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_[v33++] = 0;
              while (*(void *)&prime != v33);
              next = p_p1->__value_.__next_;
              if (p_p1->__value_.__next_)
              {
                unint64_t v35 = next[1];
                uint8x8_t v36 = (uint8x8_t)vcnt_s8(prime);
                v36.i16[0] = vaddlv_u8(v36);
                if (v36.u32[0] > 1uLL)
                {
                  if (v35 >= *(void *)&prime) {
                    v35 %= *(void *)&prime;
                  }
                }
                else
                {
                  v35 &= *(void *)&prime - 1;
                }
                v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_[v35] = p_p1;
                v40 = (void *)*next;
                if (*next)
                {
                  do
                  {
                    unint64_t v41 = v40[1];
                    if (v36.u32[0] > 1uLL)
                    {
                      if (v41 >= *(void *)&prime) {
                        v41 %= *(void *)&prime;
                      }
                    }
                    else
                    {
                      v41 &= *(void *)&prime - 1;
                    }
                    if (v41 != v35)
                    {
                      v42 = v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_;
                      if (!v42[v41])
                      {
                        v42[v41] = next;
                        goto LABEL_60;
                      }
                      void *next = *v40;
                      void *v40 = *(void *)v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_[v41];
                      *(void *)v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_[v41] = v40;
                      v40 = next;
                    }
                    unint64_t v41 = v35;
LABEL_60:
                    next = v40;
                    v40 = (void *)*v40;
                    unint64_t v35 = v41;
                  }
                  while (v40);
                }
              }
              unint64_t value = (unint64_t)prime;
            }
            if ((value & (value - 1)) != 0)
            {
              if (v19 >= value) {
                unint64_t v4 = v19 % value;
              }
              else {
                unint64_t v4 = v19;
              }
            }
            else
            {
              unint64_t v4 = (value - 1) & v19;
            }
          }
          v43 = v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_;
          v44 = (void **)v43[v4];
          if (v44)
          {
            void *i = *v44;
LABEL_77:
            *v44 = i;
            goto LABEL_78;
          }
          void *i = p_p1->__value_.__next_;
          p_p1->__value_.__next_ = i;
          v43[v4] = p_p1;
          if (*i)
          {
            unint64_t v45 = *(void *)(*i + 8);
            if ((value & (value - 1)) != 0)
            {
              if (v45 >= value) {
                v45 %= value;
              }
            }
            else
            {
              v45 &= value - 1;
            }
            v44 = &v7->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_[v45];
            goto LABEL_77;
          }
LABEL_78:
          ++v7->_sizeForLayout.__table_.__p2_.__value_;
LABEL_79:
          i[3] = v15;
          i[4] = v17;
          ++v12;
        }
        while (v12 != v9);
        uint64_t v47 = [v8 countByEnumeratingWithState:&v51 objects:v56 count:16];
        uint64_t v9 = v47;
      }
      while (v47);
    }

    v7->_pixelFormat = v49;
  }

  return v7;
}

- (CGSize)sizeForLayout:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v4 = (double *)std::__hash_table<std::__hash_value_type<ADLayout,CGSize>,std::__unordered_map_hasher<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::hash<ADLayout>,std::equal_to<ADLayout>,true>,std::__unordered_map_equal<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::equal_to<ADLayout>,std::hash<ADLayout>,true>,std::allocator<std::__hash_value_type<ADLayout,CGSize>>>::find<ADLayout>(&self->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v4)
  {
    double v6 = v4[3];
    double v5 = v4[4];
  }
  else
  {
    double v6 = 0.0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      id v8 = +[ADLayoutUtils layoutAsString:a3];
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unsupported layout: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    double v5 = 0.0;
  }
  double v7 = v6;
  result.height = v5;
  result.width = v7;
  return result;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)layoutForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v6 = +[ADLayoutUtils layoutForSize:"layoutForSize:"];
  if (![(ADImageDescriptor *)self supportsLayout:v6])
  {
    [(ADImageDescriptor *)self sizeForLayout:255];
    float v7 = width / height;
    double v10 = v8 / v9;
    *(float *)&double v9 = v10;
    *(float *)&double v10 = v7;
    if (+[ADLayoutUtils aspectRatio:v10 matchesAspectRatio:v9])
    {
      return 255;
    }
    else
    {
      return 254;
    }
  }
  return v6;
}

- (BOOL)supportsLayout:(unint64_t)a3
{
  return a3 != 254
      && std::__hash_table<std::__hash_value_type<ADLayout,CGSize>,std::__unordered_map_hasher<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::hash<ADLayout>,std::equal_to<ADLayout>,true>,std::__unordered_map_equal<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::equal_to<ADLayout>,std::hash<ADLayout>,true>,std::allocator<std::__hash_value_type<ADLayout,CGSize>>>::find<ADLayout>(&self->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_, a3) != 0;
}

- (id)cloneWithDifferentFormat:(unsigned int)a3
{
  double v5 = (ADImageDescriptor *)objc_opt_new();
  unint64_t v6 = v5;
  v5->_pixelFormat = a3;
  if (v5 != self)
  {
    v5->_sizeForLayout.__table_.__p3_.__value_ = self->_sizeForLayout.__table_.__p3_.__value_;
    next = (char *)self->_sizeForLayout.__table_.__p1_.__value_.__next_;
    unint64_t value = v5->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (!value) {
      goto LABEL_10;
    }
    for (uint64_t i = 0; i != value; v5->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_[i++] = 0)
      ;
    double v10 = (char *)v5->_sizeForLayout.__table_.__p1_.__value_.__next_;
    v5->_sizeForLayout.__table_.__p1_.__value_.__next_ = 0;
    v5->_sizeForLayout.__table_.__p2_.__value_ = 0;
    if (v10)
    {
      while (next)
      {
        unint64_t v11 = *((void *)next + 2);
        *((void *)v10 + 2) = v11;
        *(_OWORD *)(v10 + 24) = *(_OWORD *)(next + 24);
        uint64_t v12 = *(char **)v10;
        *((void *)v10 + 1) = v11;
        inserted = std::__hash_table<std::__hash_value_type<ADLayout,CGSize>,std::__unordered_map_hasher<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::hash<ADLayout>,std::equal_to<ADLayout>,true>,std::__unordered_map_equal<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::equal_to<ADLayout>,std::hash<ADLayout>,true>,std::allocator<std::__hash_value_type<ADLayout,CGSize>>>::__node_insert_multi_prepare((uint64_t)&v6->_sizeForLayout, v11, (void *)v10 + 2);
        std::__hash_table<std::__hash_value_type<ADLayout,CGSize>,std::__unordered_map_hasher<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::hash<ADLayout>,std::equal_to<ADLayout>,true>,std::__unordered_map_equal<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::equal_to<ADLayout>,std::hash<ADLayout>,true>,std::allocator<std::__hash_value_type<ADLayout,CGSize>>>::__node_insert_multi_perform(&v6->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_, v10, inserted);
        next = *(char **)next;
        double v10 = v12;
        if (!v12) {
          goto LABEL_10;
        }
      }
      do
      {
        unint64_t v19 = *(char **)v10;
        operator delete(v10);
        double v10 = v19;
      }
      while (v19);
    }
    else
    {
LABEL_10:
      while (next)
      {
        uint64_t v14 = operator new(0x28uLL);
        *uint64_t v14 = 0;
        uint64_t v15 = *((void *)next + 4);
        *((_OWORD *)v14 + 1) = *((_OWORD *)next + 1);
        v14[4] = v15;
        unint64_t v16 = v14[2];
        v14[1] = v16;
        uint64_t v17 = std::__hash_table<std::__hash_value_type<ADLayout,CGSize>,std::__unordered_map_hasher<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::hash<ADLayout>,std::equal_to<ADLayout>,true>,std::__unordered_map_equal<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::equal_to<ADLayout>,std::hash<ADLayout>,true>,std::allocator<std::__hash_value_type<ADLayout,CGSize>>>::__node_insert_multi_prepare((uint64_t)&v6->_sizeForLayout, v16, v14 + 2);
        std::__hash_table<std::__hash_value_type<ADLayout,CGSize>,std::__unordered_map_hasher<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::hash<ADLayout>,std::equal_to<ADLayout>,true>,std::__unordered_map_equal<ADLayout,std::__hash_value_type<ADLayout,CGSize>,std::equal_to<ADLayout>,std::hash<ADLayout>,true>,std::allocator<std::__hash_value_type<ADLayout,CGSize>>>::__node_insert_multi_perform(&v6->_sizeForLayout.__table_.__bucket_list_.__ptr_.__value_, v14, v17);
        next = *(char **)next;
      }
    }
  }

  return v6;
}

+ (id)descriptorWithDefaultSize:(CGSize)a3 pixelFormat:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v9[1] = *MEMORY[0x263EF8340];
  double v5 = +[ADImageSupportedSize createWithSize:andLayout:](ADImageSupportedSize, "createWithSize:andLayout:", 255, a3.width, a3.height);
  v9[0] = v5;
  unint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  float v7 = +[ADImageDescriptor descriptorForSupportedSizes:v6 pixelFormat:v4];

  return v7;
}

@end