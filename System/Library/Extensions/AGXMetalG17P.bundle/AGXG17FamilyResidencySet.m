@interface AGXG17FamilyResidencySet
- (BOOL)_commitAddedAllocations:(const void *)a3 count:(unint64_t)a4 removedAllocations:(const void *)a5 count:(unint64_t)a6;
- (id).cxx_construct;
@end

@implementation AGXG17FamilyResidencySet

- (id).cxx_construct
{
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_DWORD *)self + 60) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
  p_subResourceRefCounts = &self->_subResourceRefCounts;
  next = self->_subResourceRefCounts.__table_.__p1_.__value_.__next_;
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
  value = p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_;
  p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
  {
    operator delete(value);
  }
}

- (BOOL)_commitAddedAllocations:(const void *)a3 count:(unint64_t)a4 removedAllocations:(const void *)a5 count:(unint64_t)a6
{
  p_subResourceRefCounts = &self->_subResourceRefCounts;
  v105 = v104;
  long long v106 = xmmword_242EA8820;
  if (a4)
  {
    unint64_t v7 = a4;
    uint64_t v8 = 0;
    p_p1 = &self->_subResourceRefCounts.__table_.__p1_;
    do
    {
      v10 = a3[v8];
      uint64_t v94 = v8;
      if (*(void *)((char *)v10 + (int)*MEMORY[0x263F12B10]) != 1) {
        v10 = *(void **)((char *)v10 + (int)*MEMORY[0x263F4B170]);
      }
      v11 = (char *)v10 + (int)*MEMORY[0x263F4B188];
      if (*((void *)v11 + 2) >> 61 != 2 || *(void *)(v10[67] + 48) != 3)
      {
        int v12 = *((_DWORD *)v11 + 12);
        uint64_t v13 = v106;
        if ((unint64_t)v106 >= *((void *)&v106 + 1))
        {
          *((void *)&v106 + 1) *= 2;
          operator new[]();
        }
        *(void *)&long long v106 = v106 + 1;
        *(_DWORD *)&v105[4 * v13] = v12;
        if (*((void *)v11 + 2) >> 61 == 3)
        {
          v99 = 0;
          v100 = 0;
          uint64_t v101 = 0;
          AGX::UserIntersectionFunctionTableGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getChildResources(v10[37], (uint64_t)&v99);
          v14 = v99;
          v95 = v100;
          if (v99 != v100)
          {
            unint64_t value = p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
            for (i = v99; i != v95; ++i)
            {
              uint64_t v17 = *i;
              unint64_t v18 = HIDWORD(*i);
              unint64_t v19 = 0x9DDFEA08EB382D69 * ((8 * *i + 8) ^ v18);
              unint64_t v20 = (0x9DDFEA08EB382D69 * (v18 ^ (v19 >> 47) ^ v19)) ^ ((0x9DDFEA08EB382D69
                                                                         * (v18 ^ (v19 >> 47) ^ v19)) >> 47);
              unint64_t v21 = 0x9DDFEA08EB382D69 * v20;
              if (!value) {
                goto LABEL_37;
              }
              uint8x8_t v22 = (uint8x8_t)vcnt_s8((int8x8_t)value);
              v22.i16[0] = vaddlv_u8(v22);
              if (v22.u32[0] > 1uLL)
              {
                unint64_t v23 = 0x9DDFEA08EB382D69 * v20;
                if (v21 >= value) {
                  unint64_t v23 = v21 % value;
                }
              }
              else
              {
                unint64_t v23 = v21 & (value - 1);
              }
              v24 = (uint64_t **)p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v23];
              if (!v24 || (v25 = *v24) == 0)
              {
LABEL_37:
                unint64_t v28 = *(unsigned int *)(v17 + (int)*MEMORY[0x263F4B188] + 48);
                uint64_t v29 = v106;
                if ((unint64_t)v106 >= *((void *)&v106 + 1))
                {
                  *((void *)&v106 + 1) *= 2;
                  operator new[]();
                }
                *(void *)&long long v106 = v106 + 1;
                *(_DWORD *)&v105[4 * v29] = v28;
                if (value)
                {
                  uint8x8_t v30 = (uint8x8_t)vcnt_s8((int8x8_t)value);
                  v30.i16[0] = vaddlv_u8(v30);
                  if (v30.u32[0] > 1uLL)
                  {
                    unint64_t v28 = v21;
                    if (v21 >= value) {
                      unint64_t v28 = v21 % value;
                    }
                  }
                  else
                  {
                    unint64_t v28 = v21 & (value - 1);
                  }
                  v31 = p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v28];
                  if (v31)
                  {
                    v32 = (void *)*v31;
                    if (v32)
                    {
                      if (v30.u32[0] < 2uLL)
                      {
                        while (1)
                        {
                          uint64_t v34 = v32[1];
                          if (v34 == v21)
                          {
                            if (v32[2] == v17) {
                              goto LABEL_16;
                            }
                          }
                          else if ((v34 & (value - 1)) != v28)
                          {
                            goto LABEL_58;
                          }
                          v32 = (void *)*v32;
                          if (!v32) {
                            goto LABEL_58;
                          }
                        }
                      }
                      do
                      {
                        unint64_t v33 = v32[1];
                        if (v33 == v21)
                        {
                          if (v32[2] == v17) {
                            goto LABEL_16;
                          }
                        }
                        else
                        {
                          if (v33 >= value) {
                            v33 %= value;
                          }
                          if (v33 != v28) {
                            break;
                          }
                        }
                        v32 = (void *)*v32;
                      }
                      while (v32);
                    }
                  }
                }
LABEL_58:
                v35 = operator new(0x20uLL);
                void *v35 = 0;
                v35[1] = v21;
                v35[2] = v17;
                *((_DWORD *)v35 + 6) = 1;
                float v36 = (float)(p_subResourceRefCounts->__table_.__p2_.__value_ + 1);
                float v37 = p_subResourceRefCounts->__table_.__p3_.__value_;
                if (!value || (float)(v37 * (float)value) < v36)
                {
                  BOOL v38 = (value & (value - 1)) != 0;
                  if (value < 3) {
                    BOOL v38 = 1;
                  }
                  unint64_t v39 = v38 | (2 * value);
                  unint64_t v40 = vcvtps_u32_f32(v36 / v37);
                  if (v39 <= v40) {
                    size_t prime = v40;
                  }
                  else {
                    size_t prime = v39;
                  }
                  if (prime == 1)
                  {
                    size_t prime = 2;
                  }
                  else if ((prime & (prime - 1)) != 0)
                  {
                    size_t prime = std::__next_prime(prime);
                    unint64_t value = p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
                  }
                  if (prime > value)
                  {
LABEL_70:
                    if (prime >> 61) {
                      std::__throw_bad_array_new_length[abi:nn180100]();
                    }
                    v42 = (void **)operator new(8 * prime);
                    v43 = p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_;
                    p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_ = v42;
                    if (v43) {
                      operator delete(v43);
                    }
                    uint64_t v44 = 0;
                    p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = prime;
                    do
                      p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v44++] = 0;
                    while (prime != v44);
                    next = p_p1->__value_.__next_;
                    if (!p_p1->__value_.__next_) {
                      goto LABEL_94;
                    }
                    size_t v46 = next[1];
                    size_t v47 = prime - 1;
                    if ((prime & (prime - 1)) == 0)
                    {
                      size_t v48 = v46 & v47;
                      p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v48] = p_p1;
                      for (j = (void *)*next; *next; j = (void *)*next)
                      {
                        uint64_t v50 = j[1] & v47;
                        if (v50 == v48)
                        {
                          next = j;
                        }
                        else if (p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v50])
                        {
                          void *next = *j;
                          uint64_t v51 = v50;
                          void *j = *(void *)p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v51];
                          *(void *)p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v51] = j;
                        }
                        else
                        {
                          p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v50] = next;
                          next = j;
                          size_t v48 = v50;
                        }
                      }
                      goto LABEL_94;
                    }
                    if (v46 >= prime) {
                      v46 %= prime;
                    }
                    p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v46] = p_p1;
                    v55 = (void *)*next;
                    if (!*next)
                    {
LABEL_94:
                      unint64_t value = prime;
                      goto LABEL_95;
                    }
                    while (2)
                    {
                      size_t v57 = v55[1];
                      if (v57 >= prime) {
                        v57 %= prime;
                      }
                      if (v57 != v46)
                      {
                        if (!p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v57])
                        {
                          p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v57] = next;
LABEL_99:
                          next = v55;
                          v55 = (void *)*v55;
                          size_t v46 = v57;
                          if (!v55) {
                            goto LABEL_94;
                          }
                          continue;
                        }
                        void *next = *v55;
                        uint64_t v56 = v57;
                        void *v55 = *(void *)p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v56];
                        *(void *)p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v56] = v55;
                        v55 = next;
                      }
                      break;
                    }
                    size_t v57 = v46;
                    goto LABEL_99;
                  }
                  if (prime < value)
                  {
                    unint64_t v52 = vcvtps_u32_f32((float)p_subResourceRefCounts->__table_.__p2_.__value_/ p_subResourceRefCounts->__table_.__p3_.__value_);
                    if (value < 3
                      || (uint8x8_t v53 = (uint8x8_t)vcnt_s8((int8x8_t)value), v53.i16[0] = vaddlv_u8(v53), v53.u32[0] > 1uLL))
                    {
                      unint64_t v52 = std::__next_prime(v52);
                    }
                    else
                    {
                      uint64_t v54 = 1 << -(char)__clz(v52 - 1);
                      if (v52 >= 2) {
                        unint64_t v52 = v54;
                      }
                    }
                    if (prime <= v52) {
                      size_t prime = v52;
                    }
                    if (prime >= value)
                    {
                      unint64_t value = p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
                    }
                    else
                    {
                      if (prime) {
                        goto LABEL_70;
                      }
                      v61 = p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_;
                      p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_ = 0;
                      if (v61) {
                        operator delete(v61);
                      }
                      unint64_t value = 0;
                      p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
                    }
                  }
LABEL_95:
                  if ((value & (value - 1)) != 0)
                  {
                    if (v21 >= value) {
                      unint64_t v28 = v21 % value;
                    }
                    else {
                      unint64_t v28 = v21;
                    }
                  }
                  else
                  {
                    unint64_t v28 = (value - 1) & v21;
                  }
                }
                v58 = p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_;
                v59 = (void **)p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v28];
                if (!v59)
                {
                  void *v35 = p_p1->__value_.__next_;
                  p_p1->__value_.__next_ = v35;
                  v58[v28] = p_p1;
                  if (*v35)
                  {
                    unint64_t v60 = *(void *)(*v35 + 8);
                    if ((value & (value - 1)) != 0)
                    {
                      if (v60 >= value) {
                        v60 %= value;
                      }
                    }
                    else
                    {
                      v60 &= value - 1;
                    }
                    v59 = &p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v60];
LABEL_14:
                    *v59 = v35;
                  }
                  ++p_subResourceRefCounts->__table_.__p2_.__value_;
                  continue;
                }
                void *v35 = *v59;
                goto LABEL_14;
              }
              if (v22.u32[0] < 2uLL)
              {
                while (1)
                {
                  uint64_t v27 = v25[1];
                  if (v27 == v21)
                  {
                    if (v25[2] == v17) {
                      goto LABEL_115;
                    }
                  }
                  else if ((v27 & (value - 1)) != v23)
                  {
                    goto LABEL_37;
                  }
                  v25 = (uint64_t *)*v25;
                  if (!v25) {
                    goto LABEL_37;
                  }
                }
              }
              while (1)
              {
                unint64_t v26 = v25[1];
                if (v26 == v21) {
                  break;
                }
                if (v26 >= value) {
                  v26 %= value;
                }
                if (v26 != v23) {
                  goto LABEL_37;
                }
LABEL_27:
                v25 = (uint64_t *)*v25;
                if (!v25) {
                  goto LABEL_37;
                }
              }
              if (v25[2] != v17) {
                goto LABEL_27;
              }
LABEL_115:
              ++*((_DWORD *)v25 + 6);
LABEL_16:
              ;
            }
          }
          if (v14) {
            operator delete(v14);
          }
          unint64_t v7 = a4;
        }
      }
      uint64_t v8 = v94 + 1;
    }
    while (v94 + 1 != v7);
  }
  v102 = (void **)&v99;
  long long v103 = xmmword_242EA8820;
  if (a6)
  {
    uint64_t v62 = 0;
    while (1)
    {
      v63 = a5[v62];
      if (*(void *)((char *)v63 + (int)*MEMORY[0x263F12B10]) != 1) {
        v63 = *(void **)((char *)v63 + (int)*MEMORY[0x263F4B170]);
      }
      v64 = (char *)v63 + (int)*MEMORY[0x263F4B188];
      if (*((void *)v64 + 2) >> 61 == 2 && *(void *)(v63[67] + 48) == 3) {
        goto LABEL_131;
      }
      v65 = (void *)*((void *)v64 + 12);
      uint64_t v66 = v103;
      if ((unint64_t)v103 >= *((void *)&v103 + 1))
      {
        *((void *)&v103 + 1) *= 2;
        operator new[]();
      }
      *(void *)&long long v103 = v103 + 1;
      v102[v66] = v65;
      if (*((void *)v64 + 2) >> 61 != 3) {
        goto LABEL_131;
      }
      v96 = 0;
      v97 = 0;
      uint64_t v98 = 0;
      AGX::UserIntersectionFunctionTableGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getChildResources(v63[37], (uint64_t)&v96);
      v68 = v96;
      v67 = v97;
      v69 = v96;
      if (v96 != v97) {
        break;
      }
LABEL_139:
      if (v68) {
        operator delete(v68);
      }
LABEL_131:
      if (++v62 == a6) {
        goto LABEL_184;
      }
    }
    while (1)
    {
      v70 = (char *)*v69;
      uint64_t v71 = HIDWORD(*v69);
      unint64_t v72 = 0x9DDFEA08EB382D69 * ((8 * *v69 + 8) ^ v71);
      unint64_t v73 = 0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69 * (v71 ^ (v72 >> 47) ^ v72)) ^ ((0x9DDFEA08EB382D69 * (v71 ^ (v72 >> 47) ^ v72)) >> 47));
      unint64_t v74 = p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if ((v74 & (v74 - 1)) != 0)
      {
        unint64_t v76 = v73;
        if (v73 >= v74) {
          unint64_t v76 = v73 % v74;
        }
        v75 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<const IOGPUMetalResource *, unsigned int>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<const IOGPUMetalResource *, unsigned int>, void *>>> *)p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v76];
        do
        {
          do
            v75 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<const IOGPUMetalResource *, unsigned int>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<const IOGPUMetalResource *, unsigned int>, void *>>> *)v75->__value_.__next_;
          while (v75[1].__value_.__next_ != (void *)v73);
        }
        while (v75[2].__value_.__next_ != v70);
      }
      else
      {
        v75 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<const IOGPUMetalResource *, unsigned int>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<const IOGPUMetalResource *, unsigned int>, void *>>> *)p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v73 & (v74 - 1)];
        do
        {
          do
            v75 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<const IOGPUMetalResource *, unsigned int>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<const IOGPUMetalResource *, unsigned int>, void *>>> *)v75->__value_.__next_;
          while (v75[1].__value_.__next_ != (void *)v73);
        }
        while (v75[2].__value_.__next_ != v70);
      }
      int v77 = LODWORD(v75[3].__value_.__next_) - 1;
      LODWORD(v75[3].__value_.__next_) = v77;
      if (v77) {
        goto LABEL_142;
      }
      v78 = *(void **)&v70[*MEMORY[0x263F4B188] + 96];
      uint64_t v79 = v103;
      if ((unint64_t)v103 >= *((void *)&v103 + 1))
      {
        *((void *)&v103 + 1) *= 2;
        operator new[]();
      }
      *(void *)&long long v103 = v103 + 1;
      v102[v79] = v78;
      v80 = v75->__value_.__next_;
      int8x8_t v81 = (int8x8_t)p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      uint8x8_t v82 = (uint8x8_t)vcnt_s8(v81);
      v82.i16[0] = vaddlv_u8(v82);
      if (v82.u32[0] > 1uLL)
      {
        if (v73 >= *(void *)&v81) {
          v73 %= *(void *)&v81;
        }
      }
      else
      {
        v73 &= *(void *)&v81 - 1;
      }
      v83 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<const IOGPUMetalResource *, unsigned int>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<const IOGPUMetalResource *, unsigned int>, void *>>> *)p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v73];
      do
      {
        v84 = v83;
        v83 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<const IOGPUMetalResource *, unsigned int>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<const IOGPUMetalResource *, unsigned int>, void *>>> *)v83->__value_.__next_;
      }
      while (v83 != v75);
      if (v84 == &p_subResourceRefCounts->__table_.__p1_) {
        goto LABEL_172;
      }
      unint64_t v85 = (unint64_t)v84[1].__value_.__next_;
      if (v82.u32[0] > 1uLL)
      {
        if (v85 >= *(void *)&v81) {
          v85 %= *(void *)&v81;
        }
      }
      else
      {
        v85 &= *(void *)&v81 - 1;
      }
      if (v85 != v73)
      {
LABEL_172:
        if (v80)
        {
          unint64_t v86 = v80[1];
          if (v82.u32[0] > 1uLL)
          {
            unint64_t v87 = v80[1];
            if (v86 >= *(void *)&v81) {
              unint64_t v87 = v86 % *(void *)&v81;
            }
          }
          else
          {
            unint64_t v87 = v86 & (*(void *)&v81 - 1);
          }
          if (v87 == v73) {
            goto LABEL_176;
          }
        }
        p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v73] = 0;
        v80 = v75->__value_.__next_;
      }
      if (v80)
      {
        unint64_t v86 = v80[1];
LABEL_176:
        if (v82.u32[0] > 1uLL)
        {
          if (v86 >= *(void *)&v81) {
            v86 %= *(void *)&v81;
          }
        }
        else
        {
          v86 &= *(void *)&v81 - 1;
        }
        if (v86 != v73)
        {
          p_subResourceRefCounts->__table_.__bucket_list_.__ptr_.__value_[v86] = v84;
          v80 = v75->__value_.__next_;
        }
      }
      v84->__value_.__next_ = v80;
      --p_subResourceRefCounts->__table_.__p2_.__value_;
      operator delete(v75);
LABEL_142:
      if (++v69 == v67) {
        goto LABEL_139;
      }
    }
  }
LABEL_184:
  int updated = IOGPUResourceGroupUpdateResources();
  if (v102 != (void **)&v99 && v102) {
    MEMORY[0x24566ED70]();
  }
  if (v105 != v104 && v105) {
    MEMORY[0x24566ED70]();
  }
  return updated == 0;
}

@end