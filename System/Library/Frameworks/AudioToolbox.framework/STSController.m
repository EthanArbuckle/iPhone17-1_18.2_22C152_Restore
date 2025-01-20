@interface STSController
+ (int64_t)maxNumberOfPerLabelStates;
+ (unint64_t)maxLabelLength;
- (BOOL)_updateGlobalState:(const STSGlobalState *)a3 didChange:(BOOL *)a4 error:(id *)a5;
- (BOOL)signalChangeWithError:(id *)a3;
- (BOOL)updateGlobalState:(STSGlobalState *)a3 didChange:(BOOL *)a4 error:(id *)a5;
- (BOOL)updateGlobalState:(const STSGlobalState *)a3 labelStates:(const void *)a4 additionalLabelInfo:(id)a5 error:(id *)a6;
- (BOOL)updateGlobalState:(const STSGlobalState *)a3 labelStates:(const void *)a4 error:(id *)a5;
- (BOOL)updateLabel:(__CFString *)a3 state:(STSPerLabelState *)a4 didChange:(BOOL *)a5 error:(id *)a6;
- (BOOL)updateLabel:(__CFString *)a3 state:(const STSPerLabelState *)a4 didChange:(BOOL *)a5 additionalInfo:(id)a6 error:(id *)a7;
- (STSController)initWithSTSObject:(OpaqueFigSTS *)a3 error:(id *)a4;
- (__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::string,)ensureResourcesAllocatedForLabel:(__CFString *)a3 error:(id *)a4;
- (id).cxx_construct;
- (void)cleanupAllLabels;
- (void)cleanupLabel:(__CFString *)a3;
- (void)dealloc;
@end

@implementation STSController

- (id).cxx_construct
{
  self->_perLabelState.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_perLabelState.__table_.__p1_.__value_.__next_ = 0u;
  self->_perLabelState.__table_.__p3_.__value_ = 1.0;
  *(_OWORD *)&self->_availableIndicesWithinSharedStorage.c.__map_.__first_ = 0u;
  *(_OWORD *)&self->_availableIndicesWithinSharedStorage.c.__map_.__end_ = 0u;
  *(_OWORD *)&self->_availableIndicesWithinSharedStorage.c.__start_ = 0u;
  self->_activeIndices.m_activeLabels = 0;
  MEMORY[0x1A6251780](&self->_controlSemaphore, a2);
  return self;
}

- (void).cxx_destruct
{
  MEMORY[0x1A6251790](&self->_controlSemaphore, a2);
  begin = self->_availableIndicesWithinSharedStorage.c.__map_.__begin_;
  end = self->_availableIndicesWithinSharedStorage.c.__map_.__end_;
  self->_availableIndicesWithinSharedStorage.c.__size_.__value_ = 0;
  unint64_t v5 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
  {
    do
    {
      operator delete(*begin);
      end = self->_availableIndicesWithinSharedStorage.c.__map_.__end_;
      begin = self->_availableIndicesWithinSharedStorage.c.__map_.__begin_ + 1;
      self->_availableIndicesWithinSharedStorage.c.__map_.__begin_ = begin;
      unint64_t v5 = (char *)end - (char *)begin;
    }
    while ((unint64_t)((char *)end - (char *)begin) > 0x10);
  }
  unint64_t v6 = v5 >> 3;
  if (v6 == 1)
  {
    unint64_t v7 = 256;
    goto LABEL_7;
  }
  if (v6 == 2)
  {
    unint64_t v7 = 512;
LABEL_7:
    self->_availableIndicesWithinSharedStorage.c.__start_ = v7;
  }
  if (begin != end)
  {
    do
    {
      v8 = *begin++;
      operator delete(v8);
    }
    while (begin != end);
    v10 = self->_availableIndicesWithinSharedStorage.c.__map_.__begin_;
    v9 = self->_availableIndicesWithinSharedStorage.c.__map_.__end_;
    if (v9 != v10) {
      self->_availableIndicesWithinSharedStorage.c.__map_.__end_ = (unint64_t **)((char *)v9
    }
                                                                                       + (((char *)v10 - (char *)v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  }
  first = self->_availableIndicesWithinSharedStorage.c.__map_.__first_;
  if (first) {
    operator delete(first);
  }

  std::__hash_table<std::__hash_value_type<std::string,STSPerLabelControllerState>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,STSPerLabelControllerState>>>::~__hash_table((uint64_t)&self->_perLabelState);
}

- (BOOL)_updateGlobalState:(const STSGlobalState *)a3 didChange:(BOOL *)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  p_globalState = &self->_globalState;
  if (memcmp(&self->_globalState, a3, 0x50uLL))
  {
    *a4 = 1;
    unint64_t v9 = self->_globalGeneration + 1;
    do
    {
      unint64_t v10 = v9;
      unint64_t v9 = 1;
    }
    while (!v10);
    self->_globalGeneration = v10;
    long long v11 = *(_OWORD *)&a3[2].hostTime;
    *(_OWORD *)&v35[8] = *(_OWORD *)&a3->hostTime;
    *(_OWORD *)&v35[24] = v11;
    long long v12 = *(_OWORD *)&a3[6].hostTime;
    *(_OWORD *)&v35[40] = *(_OWORD *)&a3[4].hostTime;
    *(_OWORD *)&v35[56] = v12;
    *(_OWORD *)&v35[72] = *(_OWORD *)&a3[8].hostTime;
    sharedStorage = (unsigned int *)self->_sharedStorage;
    long long v29 = *(_OWORD *)v35;
    long long v30 = *(_OWORD *)&v35[16];
    uint64_t v34 = *(void *)&v35[80];
    long long v32 = *(_OWORD *)&v35[48];
    long long v33 = *(_OWORD *)&v35[64];
    long long v31 = *(_OWORD *)&v35[32];
    int v28 = 0;
    if (sharedStorage[1] == 3) {
      unsigned int v14 = 0;
    }
    else {
      unsigned int v14 = sharedStorage[1];
    }
    unsigned int v15 = atomic_load(sharedStorage);
    if (v14 == (unsigned __int16)v15 || v14 == HIWORD(v15))
    {
      do
      {
        caulk::concurrent::details::spinloop::spin((uint64_t)&v28);
        if (v14 == 2) {
          unsigned int v14 = 0;
        }
        else {
          ++v14;
        }
        unsigned int v15 = atomic_load(sharedStorage);
        BOOL v16 = v14 == (unsigned __int16)v15 || v14 == HIWORD(v15);
      }
      while (v16);
    }
    v17 = &sharedStorage[28 * v14];
    *((void *)v17 + 2) = v10;
    v18 = v17 + 4;
    long long v19 = v32;
    *(_OWORD *)(v18 + 10) = v31;
    *(_OWORD *)(v18 + 14) = v19;
    *(_OWORD *)(v18 + 18) = v33;
    long long v20 = v30;
    *(_OWORD *)(v18 + 2) = v29;
    int v21 = *((unsigned __int8 *)v18 + 96);
    *((void *)v18 + 11) = v34;
    *(_OWORD *)(v18 + 6) = v20;
    if (!v21) {
      *((unsigned char *)v18 + 96) = 1;
    }
    unsigned int v22 = v15;
    atomic_compare_exchange_strong((atomic_uint *volatile)sharedStorage, &v22, (v14 << 16) | (unsigned __int16)v15);
    if (v22 != v15)
    {
      unsigned int v23 = v22;
      do
      {
        atomic_compare_exchange_strong((atomic_uint *volatile)sharedStorage, &v23, (unsigned __int16)v22 | (v14 << 16));
        BOOL v16 = v23 == v22;
        unsigned int v22 = v23;
      }
      while (!v16);
    }
    sharedStorage[1] = v14 + 1;
    *(_OWORD *)&p_globalState->hostTime = *(_OWORD *)&a3->hostTime;
    long long v24 = *(_OWORD *)&a3[2].hostTime;
    long long v25 = *(_OWORD *)&a3[4].hostTime;
    long long v26 = *(_OWORD *)&a3[8].hostTime;
    *(_OWORD *)&p_globalState[6].hostTime = *(_OWORD *)&a3[6].hostTime;
    *(_OWORD *)&p_globalState[8].hostTime = v26;
    *(_OWORD *)&p_globalState[2].hostTime = v24;
    *(_OWORD *)&p_globalState[4].hostTime = v25;
  }
  return 1;
}

- (BOOL)updateLabel:(__CFString *)a3 state:(const STSPerLabelState *)a4 didChange:(BOOL *)a5 additionalInfo:(id)a6 error:(id *)a7
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  v13.var0.var0 = (void *)[(STSController *)self ensureResourcesAllocatedForLabel:a3 error:a7];
  if (v13.var0.var0)
  {
    unsigned int v14 = [v12 objectForKey:@"STSAdditionalLabelInfoKey_DeferToSystemTuning"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v15 = [v14 isEqualToNumber:&unk_1EF73F908] ^ 1;
    }
    else
    {
      if (v14)
      {
        if (a7)
        {
          uint64_t v31 = *MEMORY[0x1E4F28568];
          v17 = [NSString stringWithFormat:@"Error: Incorrect type provided for STSAdditionalLabelInfoKey_DeferToSystemTuning - expecting NSNumber, got %@", v14];
          v32[0] = v17;
          v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];

          *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.STS-N" code:1396926817 userInfo:v18];
        }
        BOOL v16 = 0;
        goto LABEL_18;
      }
      int v15 = 0;
    }
    if (memcmp((char *)v13.var0.var0 + 64, a4, 0x50uLL) || *((unsigned __int8 *)v13.var0.var0 + 144) != v15)
    {
      long long v19 = (char *)v13.var0.var0 + 16;
      *a5 = 1;
      uint64_t v20 = *((void *)v13.var0.var0 + 7) + 1;
      do
      {
        uint64_t v21 = v20;
        uint64_t v20 = 1;
      }
      while (!v21);
      *((void *)v13.var0.var0 + 7) = v21;
      if (*((char *)v13.var0.var0 + 39) < 0) {
        long long v19 = *(const char **)v19;
      }
      strcpy((char *)__src + 8, v19);
      *(void *)&__src[0] = v21;
      long long v22 = *(_OWORD *)&a4[4].var1;
      __src[14] = *(_OWORD *)&a4[2].var3;
      __src[15] = v22;
      __src[16] = *(_OWORD *)&a4[5].var2;
      long long v23 = *(_OWORD *)&a4[1].var2;
      __src[12] = *(_OWORD *)&a4->var1;
      __src[13] = v23;
      LOBYTE(__src[17]) = v15;
      long long v24 = (unsigned int *)((char *)self->_sharedStorage + 928 * *((void *)v13.var0.var0 + 6) + 368);
      memcpy(__dst, __src, sizeof(__dst));
      caulk::concurrent::multi_buffer<STSPerLabelStorage,3>::write(v24, __dst);
      *((_OWORD *)v13.var0.var0 + 4) = *(_OWORD *)&a4->var1;
      long long v25 = *(_OWORD *)&a4[1].var2;
      long long v26 = *(_OWORD *)&a4[2].var3;
      long long v27 = *(_OWORD *)&a4[5].var2;
      *((_OWORD *)v13.var0.var0 + 7) = *(_OWORD *)&a4[4].var1;
      *((_OWORD *)v13.var0.var0 + 8) = v27;
      *((_OWORD *)v13.var0.var0 + 5) = v25;
      *((_OWORD *)v13.var0.var0 + 6) = v26;
      *((unsigned char *)v13.var0.var0 + 144) = v15;
    }
    BOOL v16 = 1;
LABEL_18:

    goto LABEL_19;
  }
  BOOL v16 = 0;
LABEL_19:

  return v16;
}

- (__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::string,)ensureResourcesAllocatedForLabel:(__CFString *)a3 error:(id *)a4
{
  v61[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[(__CFString *)v7 UTF8String]);
  std::string::size_type v8 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  std::string::size_type size = __p.__r_.__value_.__l.__size_;
  unint64_t v10 = +[STSController maxLabelLength];
  if ((v8 & 0x80u) == 0) {
    std::string::size_type v11 = v8;
  }
  else {
    std::string::size_type v11 = size;
  }
  if (v11 > v10)
  {
    if (a4)
    {
      uint64_t v60 = *MEMORY[0x1E4F28568];
      id v12 = [NSString stringWithFormat:@"Error: label \"%@\" is too long - please keep under %u characters", v7, 180];
      v61[0] = v12;
      __hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::string, STSPerLabelControllerState>, void *> *>> v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];

      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.STS-N" code:1396924774 userInfo:v13];
    }
LABEL_7:
    unsigned int v14 = 0;
    goto LABEL_9;
  }
  p_perLabelState = &self->_perLabelState;
  unsigned int v14 = (char *)std::__hash_table<std::__hash_value_type<std::string,STSPerLabelControllerState>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,STSPerLabelControllerState>>>::find<std::string>(&self->_perLabelState.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)&__p);
  if (v14) {
    goto LABEL_9;
  }
  unint64_t value = self->_availableIndicesWithinSharedStorage.c.__size_.__value_;
  if (!value)
  {
    if (a4)
    {
      uint64_t v58 = *MEMORY[0x1E4F28568];
      long long v25 = [NSString stringWithFormat:@"Error: no resources available for new label %@", v7];
      v59 = v25;
      long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];

      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.STS-N" code:1396924774 userInfo:v26];
    }
    goto LABEL_7;
  }
  begin = self->_availableIndicesWithinSharedStorage.c.__map_.__begin_;
  end = self->_availableIndicesWithinSharedStorage.c.__map_.__end_;
  uint64_t v20 = (((char *)end - (char *)begin) << 6) - 1;
  if (end == begin) {
    uint64_t v20 = 0;
  }
  unint64_t v21 = value - 1;
  unint64_t v22 = self->_availableIndicesWithinSharedStorage.c.__start_ + v21;
  unint64_t v23 = (*(unint64_t **)((char *)begin + ((v22 >> 6) & 0x3FFFFFFFFFFFFF8)))[v22 & 0x1FF];
  self->_availableIndicesWithinSharedStorage.c.__size_.__value_ = v21;
  if (v20 - v22 >= 0x400)
  {
    operator delete(*(end - 1));
    --self->_availableIndicesWithinSharedStorage.c.__map_.__end_;
  }
  unint64_t m_activeLabels = self->_activeIndices.m_activeLabels;
  if (v23 <= 0x3F)
  {
    m_activeLabels |= 1 << v23;
    self->_activeIndices.unint64_t m_activeLabels = m_activeLabels;
  }
  atomic_store(m_activeLabels, (unint64_t *)self->_sharedStorage + 44);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v49, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v49 = __p;
  }
  long long v50 = v23;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  LOBYTE(v56) = 0;
  *(void *)((char *)&v56 + 1) = *(void *)v57;
  *((void *)&v56 + 1) = *(void *)&v57[7];
  unint64_t v27 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v49);
  unint64_t v28 = v27;
  unint64_t v29 = self->_perLabelState.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!v29) {
    goto LABEL_41;
  }
  uint8x8_t v30 = (uint8x8_t)vcnt_s8((int8x8_t)v29);
  v30.i16[0] = vaddlv_u8(v30);
  unint64_t v31 = v30.u32[0];
  if (v30.u32[0] > 1uLL)
  {
    unint64_t v4 = v27;
    if (v27 >= v29) {
      unint64_t v4 = v27 % v29;
    }
  }
  else
  {
    unint64_t v4 = (v29 - 1) & v27;
  }
  long long v32 = (void **)p_perLabelState->__table_.__bucket_list_.__ptr_.__value_[v4];
  if (!v32 || (unsigned int v14 = (char *)*v32) == 0)
  {
LABEL_41:
    unsigned int v14 = (char *)operator new(0xA0uLL);
    *(void *)unsigned int v14 = 0;
    *((void *)v14 + 1) = v28;
    uint64_t v34 = (std::string *)(v14 + 16);
    char v35 = HIBYTE(v49.__r_.__value_.__r.__words[2]);
    if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v34, v49.__r_.__value_.__l.__data_, v49.__r_.__value_.__l.__size_);
    }
    else
    {
      *(_OWORD *)&v34->__r_.__value_.__l.__data_ = *(_OWORD *)&v49.__r_.__value_.__l.__data_;
      *((void *)v14 + 4) = *((void *)&v49.__r_.__value_.__l + 2);
    }
    long long v36 = v55;
    *((_OWORD *)v14 + 7) = v54;
    *((_OWORD *)v14 + 8) = v36;
    *((_OWORD *)v14 + 9) = v56;
    long long v37 = v51;
    *((_OWORD *)v14 + 3) = v50;
    *((_OWORD *)v14 + 4) = v37;
    long long v38 = v53;
    *((_OWORD *)v14 + 5) = v52;
    *((_OWORD *)v14 + 6) = v38;
    float v39 = (float)(self->_perLabelState.__table_.__p2_.__value_ + 1);
    float v40 = self->_perLabelState.__table_.__p3_.__value_;
    if (!v29 || (float)(v40 * (float)v29) < v39)
    {
      BOOL v41 = 1;
      if (v29 >= 3) {
        BOOL v41 = (v29 & (v29 - 1)) != 0;
      }
      unint64_t v42 = v41 | (2 * v29);
      unint64_t v43 = vcvtps_u32_f32(v39 / v40);
      if (v42 <= v43) {
        size_t v44 = v43;
      }
      else {
        size_t v44 = v42;
      }
      std::__hash_table<std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>>>::__rehash<true>((uint64_t)&self->_perLabelState, v44);
      unint64_t v29 = self->_perLabelState.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if ((v29 & (v29 - 1)) != 0)
      {
        if (v28 >= v29) {
          unint64_t v4 = v28 % v29;
        }
        else {
          unint64_t v4 = v28;
        }
      }
      else
      {
        unint64_t v4 = (v29 - 1) & v28;
      }
    }
    v45 = p_perLabelState->__table_.__bucket_list_.__ptr_.__value_;
    v46 = (void **)p_perLabelState->__table_.__bucket_list_.__ptr_.__value_[v4];
    if (v46)
    {
      *(void *)unsigned int v14 = *v46;
    }
    else
    {
      *(void *)unsigned int v14 = self->_perLabelState.__table_.__p1_.__value_.__next_;
      self->_perLabelState.__table_.__p1_.__value_.__next_ = v14;
      v45[v4] = &self->_perLabelState.__table_.__p1_;
      if (!*(void *)v14) {
        goto LABEL_65;
      }
      unint64_t v47 = *(void *)(*(void *)v14 + 8);
      if ((v29 & (v29 - 1)) != 0)
      {
        if (v47 >= v29) {
          v47 %= v29;
        }
      }
      else
      {
        v47 &= v29 - 1;
      }
      v46 = &p_perLabelState->__table_.__bucket_list_.__ptr_.__value_[v47];
    }
    *v46 = v14;
LABEL_65:
    ++self->_perLabelState.__table_.__p2_.__value_;
    if (v35 < 0) {
      goto LABEL_66;
    }
    goto LABEL_9;
  }
  while (1)
  {
    unint64_t v33 = *((void *)v14 + 1);
    if (v33 == v28) {
      break;
    }
    if (v31 > 1)
    {
      if (v33 >= v29) {
        v33 %= v29;
      }
    }
    else
    {
      v33 &= v29 - 1;
    }
    if (v33 != v4) {
      goto LABEL_41;
    }
LABEL_40:
    unsigned int v14 = *(char **)v14;
    if (!v14) {
      goto LABEL_41;
    }
  }
  if (!std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v14 + 16, (unsigned __int8 *)&v49)) {
    goto LABEL_40;
  }
  if ((*((unsigned char *)&v49.__r_.__value_.__s + 23) & 0x80) != 0) {
LABEL_66:
  }
    operator delete(v49.__r_.__value_.__l.__data_);
LABEL_9:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return (__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::string, STSPerLabelControllerState>, void *> *>>)v14;
}

- (BOOL)updateGlobalState:(const STSGlobalState *)a3 labelStates:(const void *)a4 additionalLabelInfo:(id)a5 error:(id *)a6
{
  id v10 = a5;
  if (a6) {
    *a6 = 0;
  }
  std::string::size_type v11 = (char *)a4 + 16;
  id v12 = (char *)a4 + 16;
  while (1)
  {
    id v12 = (void *)*v12;
    if (!v12) {
      break;
    }
    if ([(STSController *)self ensureResourcesAllocatedForLabel:v12[2] error:a6] == 0)
    {
      BOOL v13 = 0;
      goto LABEL_15;
    }
  }
  char v17 = 0;
  if (a3
    && ![(STSController *)self _updateGlobalState:a3 didChange:&v17 error:a6])
  {
LABEL_11:
    BOOL v13 = 0;
  }
  else
  {
    while (1)
    {
      std::string::size_type v11 = (void *)*v11;
      BOOL v13 = v11 == 0;
      if (!v11) {
        break;
      }
      unsigned int v14 = [v10 objectForKey:v11[2]];
      BOOL v15 = [(STSController *)self updateLabel:v11[2] state:v11 + 4 didChange:&v17 additionalInfo:v14 error:a6];

      if (!v15) {
        goto LABEL_11;
      }
    }
  }
  if (v17 || self->_allowAutomaticHeadTracking) {
    BOOL v13 = [(STSController *)self signalChangeWithError:a6];
  }
LABEL_15:

  return v13;
}

- (BOOL)updateGlobalState:(const STSGlobalState *)a3 labelStates:(const void *)a4 error:(id *)a5
{
  return [(STSController *)self updateGlobalState:a3 labelStates:a4 additionalLabelInfo:0 error:a5];
}

- (void)cleanupAllLabels
{
  long long v33 = 0u;
  long long v34 = 0u;
  float value = self->_perLabelState.__table_.__p3_.__value_;
  std::__hash_table<std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>>>::__rehash<true>((uint64_t)&v33, self->_perLabelState.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_);
  for (i = (char *)self->_perLabelState.__table_.__p1_.__value_.__next_; i; i = *(char **)i)
  {
    unint64_t v5 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(i + 16));
    unint64_t v6 = v5;
    unint64_t v7 = *((void *)&v33 + 1);
    if (*((void *)&v33 + 1))
    {
      uint8x8_t v8 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v33 + 8));
      v8.i16[0] = vaddlv_u8(v8);
      unint64_t v9 = v8.u32[0];
      if (v8.u32[0] > 1uLL)
      {
        unint64_t v2 = v5;
        if (v5 >= *((void *)&v33 + 1)) {
          unint64_t v2 = v5 % *((void *)&v33 + 1);
        }
      }
      else
      {
        unint64_t v2 = (*((void *)&v33 + 1) - 1) & v5;
      }
      id v10 = *(unsigned __int8 ***)(v33 + 8 * v2);
      if (v10)
      {
        for (j = *v10; j; j = *(unsigned __int8 **)j)
        {
          unint64_t v12 = *((void *)j + 1);
          if (v12 == v6)
          {
            if (std::equal_to<std::string>::operator()[abi:ne180100](j + 16, (unsigned __int8 *)i + 16)) {
              goto LABEL_43;
            }
          }
          else
          {
            if (v9 > 1)
            {
              if (v12 >= v7) {
                v12 %= v7;
              }
            }
            else
            {
              v12 &= v7 - 1;
            }
            if (v12 != v2) {
              break;
            }
          }
        }
      }
    }
    BOOL v13 = (char *)operator new(0xA0uLL);
    *(void *)BOOL v13 = 0;
    *((void *)v13 + 1) = v6;
    unsigned int v14 = (std::string *)(v13 + 16);
    if (i[39] < 0)
    {
      std::string::__init_copy_ctor_external(v14, *((const std::string::value_type **)i + 2), *((void *)i + 3));
    }
    else
    {
      long long v15 = *((_OWORD *)i + 1);
      *((void *)v13 + 4) = *((void *)i + 4);
      *(_OWORD *)&v14->__r_.__value_.__l.__data_ = v15;
    }
    long long v16 = *((_OWORD *)i + 3);
    long long v17 = *((_OWORD *)i + 5);
    *((_OWORD *)v13 + 4) = *((_OWORD *)i + 4);
    *((_OWORD *)v13 + 5) = v17;
    *((_OWORD *)v13 + 3) = v16;
    long long v18 = *((_OWORD *)i + 6);
    long long v19 = *((_OWORD *)i + 7);
    long long v20 = *((_OWORD *)i + 9);
    *((_OWORD *)v13 + 8) = *((_OWORD *)i + 8);
    *((_OWORD *)v13 + 9) = v20;
    *((_OWORD *)v13 + 6) = v18;
    *((_OWORD *)v13 + 7) = v19;
    float v21 = (float)(unint64_t)(*((void *)&v34 + 1) + 1);
    if (!v7 || (float)(value * (float)v7) < v21)
    {
      BOOL v22 = (v7 & (v7 - 1)) != 0;
      if (v7 < 3) {
        BOOL v22 = 1;
      }
      unint64_t v23 = v22 | (2 * v7);
      unint64_t v24 = vcvtps_u32_f32(v21 / value);
      if (v23 <= v24) {
        size_t v25 = v24;
      }
      else {
        size_t v25 = v23;
      }
      std::__hash_table<std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>>>::__rehash<true>((uint64_t)&v33, v25);
      unint64_t v7 = *((void *)&v33 + 1);
      if ((*((void *)&v33 + 1) & (*((void *)&v33 + 1) - 1)) != 0)
      {
        if (v6 >= *((void *)&v33 + 1)) {
          unint64_t v2 = v6 % *((void *)&v33 + 1);
        }
        else {
          unint64_t v2 = v6;
        }
      }
      else
      {
        unint64_t v2 = (*((void *)&v33 + 1) - 1) & v6;
      }
    }
    uint64_t v26 = v33;
    unint64_t v27 = *(void **)(v33 + 8 * v2);
    if (v27)
    {
      *(void *)BOOL v13 = *v27;
    }
    else
    {
      *(void *)BOOL v13 = v34;
      *(void *)&long long v34 = v13;
      *(void *)(v26 + 8 * v2) = &v34;
      if (!*(void *)v13) {
        goto LABEL_42;
      }
      unint64_t v28 = *(void *)(*(void *)v13 + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v28 >= v7) {
          v28 %= v7;
        }
      }
      else
      {
        v28 &= v7 - 1;
      }
      unint64_t v27 = (void *)(v33 + 8 * v28);
    }
    *unint64_t v27 = v13;
LABEL_42:
    ++*((void *)&v34 + 1);
LABEL_43:
    ;
  }
  unint64_t v29 = (uint64_t *)v34;
  if ((void)v34)
  {
    CFAllocatorRef v30 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      unint64_t v31 = (const char *)(v29 + 2);
      if (*((char *)v29 + 39) < 0) {
        unint64_t v31 = *(const char **)v31;
      }
      CFStringRef v32 = CFStringCreateWithCString(v30, v31, 0x8000100u);
      [(STSController *)self cleanupLabel:v32];
      CFRelease(v32);
      unint64_t v29 = (uint64_t *)*v29;
    }
    while (v29);
  }
  std::__hash_table<std::__hash_value_type<std::string,STSPerLabelControllerState>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,STSPerLabelControllerState>>>::~__hash_table((uint64_t)&v33);
}

- (void)cleanupLabel:(__CFString *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[(__CFString *)v4 UTF8String]);
  p_perLabelState = &self->_perLabelState;
  unint64_t v6 = std::__hash_table<std::__hash_value_type<std::string,STSPerLabelControllerState>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,STSPerLabelControllerState>>>::find<std::string>(&self->_perLabelState.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p);
  if (v6)
  {
    unint64_t v7 = (void **)v6;
    uint8x8_t v8 = (unsigned int *)((char *)self->_sharedStorage + 928 * *((void *)v6 + 6) + 368);
    __src[0] = 0;
    char v34 = 0;
    caulk::concurrent::multi_buffer<STSPerLabelStorage,3>::write(v8, __src);
    unint64_t v9 = (unint64_t)v7[6];
    unint64_t m_activeLabels = self->_activeIndices.m_activeLabels;
    if (v9 <= 0x3F)
    {
      m_activeLabels &= ~(1 << v9);
      self->_activeIndices.unint64_t m_activeLabels = m_activeLabels;
    }
    atomic_store(m_activeLabels, (unint64_t *)self->_sharedStorage + 44);
    end = self->_availableIndicesWithinSharedStorage.c.__map_.__end_;
    begin = self->_availableIndicesWithinSharedStorage.c.__map_.__begin_;
    uint64_t v13 = (((char *)end - (char *)begin) << 6) - 1;
    if (end == begin) {
      uint64_t v13 = 0;
    }
    unint64_t v14 = self->_availableIndicesWithinSharedStorage.c.__size_.__value_
        + self->_availableIndicesWithinSharedStorage.c.__start_;
    if (v13 == v14)
    {
      std::deque<unsigned long>::__add_back_capacity(&self->_availableIndicesWithinSharedStorage.c.__map_.__first_);
      begin = self->_availableIndicesWithinSharedStorage.c.__map_.__begin_;
      unint64_t v14 = self->_availableIndicesWithinSharedStorage.c.__size_.__value_
          + self->_availableIndicesWithinSharedStorage.c.__start_;
    }
    (*(unint64_t **)((char *)begin + ((v14 >> 6) & 0x3FFFFFFFFFFFFF8)))[v14 & 0x1FF] = (unint64_t)v7[6];
    ++self->_availableIndicesWithinSharedStorage.c.__size_.__value_;
    unint64_t value = self->_perLabelState.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    unint64_t v16 = (unint64_t)v7[1];
    uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] > 1uLL)
    {
      if (v16 >= value) {
        v16 %= value;
      }
    }
    else
    {
      v16 &= value - 1;
    }
    isa = (STSController *)p_perLabelState->__table_.__bucket_list_.__ptr_.__value_[v16];
    do
    {
      long long v19 = isa;
      isa = (STSController *)isa->super.isa;
    }
    while (isa != (STSController *)v7);
    if (v19 == (STSController *)&self->_perLabelState.__table_.__p1_) {
      goto LABEL_25;
    }
    unint64_t sts = (unint64_t)v19->_sts;
    if (v17.u32[0] > 1uLL)
    {
      if (sts >= value) {
        sts %= value;
      }
    }
    else
    {
      sts &= value - 1;
    }
    if (sts != v16)
    {
LABEL_25:
      if (!*v7) {
        goto LABEL_26;
      }
      unint64_t v21 = *((void *)*v7 + 1);
      if (v17.u32[0] > 1uLL)
      {
        if (v21 >= value) {
          v21 %= value;
        }
      }
      else
      {
        v21 &= value - 1;
      }
      if (v21 != v16) {
LABEL_26:
      }
        p_perLabelState->__table_.__bucket_list_.__ptr_.__value_[v16] = 0;
    }
    BOOL v22 = (objc_class *)*v7;
    if (*v7)
    {
      unint64_t v23 = *((void *)v22 + 1);
      if (v17.u32[0] > 1uLL)
      {
        if (v23 >= value) {
          v23 %= value;
        }
      }
      else
      {
        v23 &= value - 1;
      }
      if (v23 != v16)
      {
        p_perLabelState->__table_.__bucket_list_.__ptr_.__value_[v23] = v19;
        BOOL v22 = (objc_class *)*v7;
      }
    }
    v19->super.isa = v22;
    *unint64_t v7 = 0;
    --self->_perLabelState.__table_.__p2_.__value_;
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,STSPerLabelControllerState>,void *>>>::operator()[abi:ne180100](1, v7);
    id v26 = 0;
    BOOL v24 = [(STSController *)self signalChangeWithError:&v26];
    id v25 = v26;
    if (!v24 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      CFAllocatorRef v30 = v4;
      __int16 v31 = 2112;
      id v32 = v25;
      _os_log_error_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to signal cleanup of label %@: %@", buf, 0x16u);
    }
  }
  if (v28 < 0) {
    operator delete(__p[0]);
  }
}

- (BOOL)updateGlobalState:(STSGlobalState *)a3 didChange:(BOOL *)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  BOOL v11 = 0;
  BOOL v8 = [(STSController *)self _updateGlobalState:a3 didChange:&v11 error:a5];
  LOBYTE(v9) = 0;
  if (v8)
  {
    if (v11 || self->_allowAutomaticHeadTracking)
    {
      BOOL v9 = [(STSController *)self signalChangeWithError:a5];
      if (!a4) {
        return v9;
      }
    }
    else
    {
      BOOL v9 = 1;
      if (!a4) {
        return v9;
      }
    }
    if (v9)
    {
      *a4 = v11;
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

- (BOOL)updateLabel:(__CFString *)a3 state:(STSPerLabelState *)a4 didChange:(BOOL *)a5 error:(id *)a6
{
  if (a6) {
    *a6 = 0;
  }
  BOOL v12 = 0;
  BOOL v9 = [(STSController *)self updateLabel:a3 state:a4 didChange:&v12 additionalInfo:0 error:a6];
  LOBYTE(v10) = 0;
  if (v9)
  {
    if (v12)
    {
      BOOL v10 = [(STSController *)self signalChangeWithError:a6];
      if (!a5) {
        return v10;
      }
    }
    else
    {
      BOOL v10 = 1;
      if (!a5) {
        return v10;
      }
    }
    if (v10)
    {
      *a5 = v12;
      LOBYTE(v10) = 1;
    }
  }
  return v10;
}

- (BOOL)signalChangeWithError:(id *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = caulk::mach::semaphore::signal_or_error((caulk::mach::semaphore *)&self->_controlSemaphore) & 0xFF00000000;
  if (a3 && !v4)
  {
    uint64_t v8 = *MEMORY[0x1E4F28568];
    unint64_t v5 = [NSString stringWithFormat:@"Error: failed to signal change"];
    v9[0] = v5;
    unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.STS-N" code:1396929899 userInfo:v6];
  }
  return v4 != 0;
}

- (void)dealloc
{
  [(STSController *)self cleanupAllLabels];
  unint64_t sts = self->_sts;
  if (sts) {
    CFRelease(sts);
  }
  sharedStorage = self->_sharedStorage;
  if (sharedStorage) {
    munmap(sharedStorage, self->_shmemSize);
  }
  v5.receiver = self;
  v5.super_class = (Class)STSController;
  [(STSController *)&v5 dealloc];
}

- (STSController)initWithSTSObject:(OpaqueFigSTS *)a3 error:(id *)a4
{
  p_isa = a4;
  v50[1] = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    if (!a3) {
      goto LABEL_10;
    }
LABEL_5:
    xpc_object_t xdict = 0;
    uint64_t v35 = 0;
    long long v36 = &v35;
    uint64_t v37 = 0x2020000000;
    BOOL v9 = (uint64_t (*)(OpaqueFigSTS *))getCMBaseObjectGetVTableSymbolLoc(void)::ptr;
    long long v38 = getCMBaseObjectGetVTableSymbolLoc(void)::ptr;
    if (!getCMBaseObjectGetVTableSymbolLoc(void)::ptr)
    {
      region[0] = (void *)MEMORY[0x1E4F143A8];
      region[1] = (void *)3221225472;
      region[2] = ___ZL33getCMBaseObjectGetVTableSymbolLocv_block_invoke;
      region[3] = &unk_1E5B16400;
      region[4] = &v35;
      ___ZL33getCMBaseObjectGetVTableSymbolLocv_block_invoke(region);
      BOOL v9 = (uint64_t (*)(OpaqueFigSTS *))v36[3];
    }
    _Block_object_dispose(&v35, 8);
    if (v9)
    {
      uint64_t v10 = *(void *)(v9(a3) + 16);
      if (v10) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
      uint64_t v13 = *(uint64_t (**)(OpaqueFigSTS *, __CFString *, xpc_object_t *))(v11 + 40);
      if (!v13)
      {
        uint64_t v14 = 4294954514;
        if (p_isa) {
          goto LABEL_18;
        }
        goto LABEL_21;
      }
      uint64_t v14 = v13(a3, @"SharedStorage", &xdict);
      if (v14 || !xdict)
      {
LABEL_17:
        if (p_isa)
        {
LABEL_18:
          uint64_t v47 = *MEMORY[0x1E4F28568];
          long long v15 = objc_msgSend(NSString, "stringWithFormat:", @"Error: Failed to copy STS shared memory configuration: %d", v14);
          v48 = v15;
          unint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];

          [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.STS-N" code:1396924774 userInfo:v16];
          BOOL v12 = 0;
          id *p_isa = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_22:
          goto LABEL_23;
        }
LABEL_21:
        BOOL v12 = 0;
        goto LABEL_22;
      }
      if (MEMORY[0x1A62535A0](xdict) != MEMORY[0x1E4F14590])
      {
        uint64_t v14 = 0;
        goto LABEL_17;
      }
      uint64_t v18 = xpc_dictionary_get_value(xdict, "sharedstorage");
      unint64_t v16 = (void *)v18;
      if (!v18 || MEMORY[0x1A62535A0](v18) != MEMORY[0x1E4F145E8])
      {
        if (p_isa)
        {
          uint64_t v45 = *MEMORY[0x1E4F28568];
          long long v19 = [NSString stringWithFormat:@"Error: Failed to copy STS shared memory from configuration"];
          v46 = v19;
          long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];

          id *p_isa = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.STS-N" code:1396924774 userInfo:v20];
        }
        goto LABEL_28;
      }
      region[0] = 0;
      size_t v4 = xpc_shmem_map(v16, region);
      unint64_t v21 = region[0];
      if (!region[0])
      {
        if (!p_isa)
        {
LABEL_28:
          BOOL v12 = 0;
          goto LABEL_19;
        }
        uint64_t v43 = *MEMORY[0x1E4F28568];
        BOOL v24 = objc_msgSend(NSString, "stringWithFormat:", @"Error: Failed to map STS shared memory w/ size %lu: %d", v4, 0);
        size_t v44 = v24;
        id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];

        [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.STS-N" code:1396924774 userInfo:v25];
        BOOL v12 = 0;
        id *p_isa = (id)objc_claimAutoreleasedReturnValue();
LABEL_49:

        goto LABEL_19;
      }
      if (v4 >> 4 <= 0xE96)
      {
        if (p_isa)
        {
          uint64_t v41 = *MEMORY[0x1E4F28568];
          BOOL v22 = objc_msgSend(NSString, "stringWithFormat:", @"Error: STS shared memory region of size %lu isn't large enough (requires %lu)", v4, 59760);
          unint64_t v42 = v22;
          unint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];

          id *p_isa = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.STS-N" code:1396924774 userInfo:v23];

          unint64_t v21 = region[0];
        }
        munmap(v21, v4);
        goto LABEL_28;
      }
      uint64_t v26 = xpc_dictionary_get_value(xdict, "controlsemaphore");
      id v25 = (void *)v26;
      if (!v26 || MEMORY[0x1A62535A0](v26) != MEMORY[0x1E4F145C8])
      {
        if (p_isa)
        {
          uint64_t v39 = *MEMORY[0x1E4F28568];
          unint64_t v27 = [NSString stringWithFormat:@"Error: Failed to copy STS control semaphore from configuration"];
          float v40 = v27;
          char v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];

          id *p_isa = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.STS-N" code:1396924774 userInfo:v28];
        }
        munmap(region[0], v4);
        BOOL v12 = 0;
        goto LABEL_49;
      }
      xpc_mach_send_copy_right();
      v32.receiver = self;
      v32.super_class = (Class)STSController;
      unint64_t v29 = [(STSController *)&v32 init];
      p_isa = (id *)&v29->super.isa;
      if (v29)
      {
        v29->_shmemSize = v4;
        v29->_unint64_t sts = (OpaqueFigSTS *)CFRetain(a3);
        p_isa[25] = region[0];
        caulk::mach::semaphore::semaphore((caulk::mach::semaphore *)&v35);
        caulk::mach::semaphore::operator=();
        MEMORY[0x1A6251790](&v35);
        *((unsigned char *)p_isa + 224) = xpc_dictionary_get_BOOL(xdict, "allowautomaticheadtracking");
        int v30 = +[STSController maxNumberOfPerLabelStates];
        if (v30 >= 1)
        {
          unint64_t v31 = v30 + 1;
          do
          {
            uint64_t v35 = (v31 - 2);
            std::deque<unsigned long>::push_back(p_isa + 7, &v35);
            --v31;
          }
          while (v31 > 1);
        }
        goto LABEL_48;
      }
    }
    else
    {
      unint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      id v25 = [NSString stringWithUTF8String:"const CMBaseVTable *softLink_CMBaseObjectGetVTable(CMBaseObjectRef)"];
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v25, @"STSController.mm", 27, @"%s", dlerror());

      __break(1u);
    }
    munmap(region[0], v4);
LABEL_48:
    self = p_isa;
    BOOL v12 = self;
    goto LABEL_49;
  }
  *a4 = 0;
  if (a3) {
    goto LABEL_5;
  }
  uint64_t v49 = *MEMORY[0x1E4F28568];
  v50[0] = @"Error: NULL FigSTSRef";
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
  id *p_isa = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.STS-N" code:1396926817 userInfo:v8];

LABEL_10:
  BOOL v12 = 0;
LABEL_23:

  return v12;
}

+ (unint64_t)maxLabelLength
{
  return 179;
}

+ (int64_t)maxNumberOfPerLabelStates
{
  return 64;
}

@end