@interface ETTaskDefinition
- (BOOL)doTrainingOnData:(id)a3 forNumberOfEpochs:(unint64_t)a4 withCallback:(id)a5 error:(id *)a6;
- (BOOL)privateDoTrainingOnData:(id)a3 forNumberOfEpochs:(unint64_t)a4 withCallback:(id)a5 error:(id *)a6;
- (BOOL)saveNetwork:(id)a3 inplace:(BOOL)a4 error:(id *)a5;
- (BOOL)saveTrainingNetwork:(id)a3 checkpoint:(id)a4 error:(id *)a5;
- (BOOL)setInferenceNetworkWeights:(shared_ptr<Espresso:(id *)a4 :net>)a3 error:;
- (BOOL)setParameterOfType:(unint64_t)a3 forLayerNamed:(id)a4 withValue:(id)a5 error:(id *)a6;
- (BOOL)setTensorNamed:(id)a3 withValue:(id)a4 error:(id *)a5;
- (BOOL)setWeightsOfInferenceNetworkLoadedFrom:(id)a3 AndSaveTo:(id)a4 error:(id *)a5;
- (ETModelDefinition)inferenceModel;
- (ETOptimizerDefinition)optimizer;
- (ETTaskDefinition)initWithModelDefinition:(id)a3 lossDefinition:(id)a4 variablesDefinition:(id)a5 optimizerDefinition:(id)a6 forPlatform:(unint64_t)a7 error:(id *)a8;
- (ETTaskDefinition)initWithTrainingModelDefinition:(id)a3 forPlatform:(unint64_t)a4 error:(id *)a5;
- (ETTaskState)taskState;
- (id).cxx_construct;
- (id)description;
- (id)doInferenceOnData:(id)a3 error:(id *)a4;
- (id)getParameterOfType:(unint64_t)a3 forLayerNamed:(id)a4 error:(id *)a5;
- (id)getTensorNamed:(id)a3;
- (id)getTensorNamed:(id)a3 directBind:(BOOL)a4;
- (id)namesVectorToFoundationArray:()vector<std:(std::allocator<std::string>> *)a3 :string;
- (shared_ptr<Espresso::abstract_context>)context_for_runtime_platform:(id *)a3;
- (shared_ptr<Espresso::net>)inferenceGraphNetPtr;
- (shared_ptr<Espresso::net>)trainingGraphNetPtr;
- (std::string)saveNetwork:inplace:error:;
- (std::string)saveTrainingNetwork:checkpoint:error:;
- (uint64_t)saveNetwork:inplace:error:;
- (uint64_t)saveTrainingNetwork:checkpoint:error:;
- (unint64_t)dataTypeForParameterOfType:(unint64_t)a3 fromLayerNamed:(id)a4;
- (unint64_t)platform;
- (unint64_t)platformForLayerNamed:(id)a3 error:(id *)a4;
- (void)checkShapes:(const void *)a3 withSample:(const void *)a4 withError:(id *)a5;
- (void)reloadOnRuntimePlatform:(id *)a3;
- (void)saveNetwork:inplace:error:;
- (void)saveTrainingNetwork:checkpoint:error:;
- (void)setInferenceGraphNetPtr:(shared_ptr<Espresso::net>)a3;
- (void)setInferenceModel:(id)a3;
- (void)setOptimizer:(id)a3;
- (void)setPlatform:(unint64_t)a3;
- (void)setTaskState:(id)a3;
- (void)setTrainingGraphNetPtr:(shared_ptr<Espresso::net>)a3;
- (void)setupInputOutputShapes:(id *)a3;
- (void)setupShapes:(void *)a3 forBlobs:(id)a4 withError:(id *)a5;
- (void)shareWeights;
@end

@implementation ETTaskDefinition

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((void *)self + 18) = 0;
  *((_DWORD *)self + 54) = 1065353216;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_DWORD *)self + 64) = 1065353216;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *((_DWORD *)self + 74) = 1065353216;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_DWORD *)self + 84) = 1065353216;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  return self;
}

- (void).cxx_destruct
{
  optimizer = self->_optimizer;
  if (optimizer) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)optimizer);
  }
  v4 = *(std::__shared_weak_count **)&self->trainOutputBlobShapes.__table_.__p3_.__value_;
  if (v4) {
    nitro::nitro_function::nitro_function(v4);
  }
  objc_storeStrong(&self->trainOutputBlobShapes.__table_.__p1_.__value_.__next_, 0);
  objc_storeStrong((id *)&self->trainOutputBlobShapes.__table_.__bucket_list_.__ptr_.__value_, 0);
  objc_storeStrong((id *)&self->infOutputBlobShapes.__table_.__p3_, 0);
  std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::~__hash_table((uint64_t)&self->trainInputBlobShapes.__table_.__p3_);
  std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::~__hash_table((uint64_t)&self->infInputBlobShapes.__table_.__p3_);
  std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::~__hash_table((uint64_t)&self->trainOutputNames);
  std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::~__hash_table((uint64_t)&self->optimizer_control_name.__r_.var0);
  objc_storeStrong((id *)&self->optimizer_control_name.__r_.__value_.var0.__l + 2, 0);
  objc_storeStrong((id *)&self->optimizer_control_name.__r_.__value_.var0.__l.__size_, 0);
  objc_storeStrong((id *)&self->optimizer_control_name, 0);
  objc_storeStrong((id *)&self->gradient_control_name.var0, 0);
  if (*((char *)&self->gradient_control_name.__r_.var1 + 3) < 0) {
    operator delete((void *)self->gradient_control_name.__r_.__value_.var0.__l.__size_);
  }
  if (self->gradient_control_name.__r_.__value_.var0.__s.__data_[7] < 0) {
    operator delete(*(void **)&self->training_control_name.__r_.var0);
  }
  if (*((char *)&self->training_control_name.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->training_control_name.__r_.__value_.var0.__l.__data_);
  }
  objc_storeStrong((id *)&self->varsDef, 0);

  std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::~__hash_table((uint64_t)&self->inference_layer_index);
}

- (void)setTrainingGraphNetPtr:(shared_ptr<Espresso::net>)a3
{
}

- (shared_ptr<Espresso::net>)trainingGraphNetPtr
{
  objc_copyCppObjectAtomic(v2, &self->_inferenceModel, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setInferenceGraphNetPtr:(shared_ptr<Espresso::net>)a3
{
}

- (shared_ptr<Espresso::net>)inferenceGraphNetPtr
{
  objc_copyCppObjectAtomic(v2, &self->trainOutputBlobShapes.__table_.__p2_, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setTaskState:(id)a3
{
}

- (void)setPlatform:(unint64_t)a3
{
  self->trainOutputBlobShapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = a3;
}

- (unint64_t)platform
{
  return self->trainOutputBlobShapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
}

- (void)setOptimizer:(id)a3
{
}

- (ETOptimizerDefinition)optimizer
{
  return (ETOptimizerDefinition *)self->trainOutputBlobShapes.__table_.__bucket_list_.__ptr_.__value_;
}

- (void)setInferenceModel:(id)a3
{
}

- (ETModelDefinition)inferenceModel
{
  return *(ETModelDefinition **)&self->infOutputBlobShapes.__table_.__p3_.__value_;
}

- (unint64_t)platformForLayerNamed:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  v5 = [(ETTaskDefinition *)self taskState];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  v8 = 0;
  unint64_t v9 = 0;
  if (!v5) {
    goto LABEL_6;
  }
LABEL_2:
  [v5 networkPointer];
  unint64_t v10 = (uint64_t)(*(void *)(v28 + 40) - *(void *)(v28 + 32)) >> 4;
  if (v29) {
    nitro::nitro_function::nitro_function(v29);
  }
  if (v9 < v10)
  {
    do
    {
      v11 = [(ETTaskDefinition *)self taskState];
      [v11 networkPointer];
      uint64_t v12 = *(void *)(*(void *)(v28 + 32) + v6);
      v13 = (const char *)[v27 UTF8String];
      v14 = (void *)(v12 + 16);
      size_t v15 = strlen(v13);
      if (*(char *)(v12 + 39) < 0)
      {
        if (v15 == *(void *)(v12 + 24))
        {
          if (v15 == -1) {
            std::string::__throw_out_of_range[abi:ne180100]();
          }
          v14 = (void *)*v14;
LABEL_13:
          BOOL v16 = memcmp(v14, v13, v15) == 0;
          goto LABEL_15;
        }
      }
      else if (v15 == *(unsigned __int8 *)(v12 + 39))
      {
        goto LABEL_13;
      }
      BOOL v16 = 0;
LABEL_15:
      if (v29) {
        nitro::nitro_function::nitro_function(v29);
      }

      if (v16)
      {
        v17 = [(ETTaskDefinition *)self taskState];
        [v17 networkPointer];
        v18 = (uint64_t *)(*(void *)(v28 + 32) + v6);
        uint64_t v7 = *v18;
        v19 = (std::__shared_weak_count *)v18[1];
        if (v19) {
          atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (v8) {
          nitro::nitro_function::nitro_function(v8);
        }
        if (v29) {
          nitro::nitro_function::nitro_function(v29);
        }

        v8 = v19;
      }
      ++v9;
      v6 += 16;
      if (v5) {
        goto LABEL_2;
      }
LABEL_6:
      ;
    }
    while (v9 < (uint64_t)(MEMORY[0x28] - MEMORY[0x20]) >> 4);
  }
  if (v7)
  {
    v20 = *(unsigned int (****)(void))(*(void *)(*(void *)(v7 + 64) + 8) + 8);
    unint64_t v21 = (**v20)(v20) == 0;
    if (v8) {
LABEL_29:
    }
      nitro::nitro_function::nitro_function(v8);
  }
  else
  {
    if (a4)
    {
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v24 = [NSString stringWithFormat:@"Unable to find layer named: %@", v27];
      v31[0] = v24;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      *a4 = [v23 errorWithDomain:@"EspressoError" code:1 userInfo:v25];
    }
    unint64_t v21 = 0;
    if (v8) {
      goto LABEL_29;
    }
  }

  return v21;
}

- (id)getTensorNamed:(id)a3
{
  v3 = [(ETTaskDefinition *)self getTensorNamed:a3 directBind:0];

  return v3;
}

- (id)getTensorNamed:(id)a3 directBind:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(ETTaskDefinition *)self taskState];
  v8 = v7;
  if (v7)
  {
    [v7 networkPointer];
    uint64_t v9 = v23;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v23 = 0;
    v24 = 0;
  }
  id v10 = v6;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v10 UTF8String]);
  Espresso::net::get_global(&v25, v9, (unsigned __int8 *)__p);
  if (v22 < 0) {
    operator delete(__p[0]);
  }
  if (v24) {
    nitro::nitro_function::nitro_function(v24);
  }
  uint64_t v11 = v25;
  if (v25) {
    goto LABEL_21;
  }
  if (v8)
  {
    [v8 networkPointer];
    uint64_t v12 = v23;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v23 = 0;
    v24 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v10 UTF8String]);
  id v27 = __p;
  v13 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v12 + 136, (unsigned __int8 *)__p, (long long **)&v27);
  uint64_t v11 = *((void *)v13 + 5);
  v14 = (std::__shared_weak_count *)*((void *)v13 + 6);
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  size_t v15 = v26;
  v26 = v14;
  if (v15) {
    nitro::nitro_function::nitro_function(v15);
  }
  if (v22 < 0) {
    operator delete(__p[0]);
  }
  if (v24) {
    nitro::nitro_function::nitro_function(v24);
  }
  if (v11)
  {
LABEL_21:
    BOOL v16 = [ETDataTensor alloc];
    v14 = v26;
    uint64_t v19 = v11;
    v20 = v26;
    if (v26) {
      atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v17 = [(ETDataTensor *)v16 initWithBlobContainer:&v19 directBind:v4];
    if (v20) {
      nitro::nitro_function::nitro_function(v20);
    }
    if (v14) {
      goto LABEL_26;
    }
  }
  else
  {
    v17 = 0;
    if (v14) {
LABEL_26:
    }
      nitro::nitro_function::nitro_function(v14);
  }

  return v17;
}

- (BOOL)setTensorNamed:(id)a3 withValue:(id)a4 error:(id *)a5
{
  void (***v27)(uint64_t *__return_ptr, void);
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v46;
  void *__p;
  unsigned char v48[32];
  long long v49;
  long long v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  uint64_t v53;
  std::__shared_weak_count *v54;
  uint64_t v55;
  std::__shared_weak_count *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  ETDataTensor *v62;
  uint64_t v63;
  void v64[3];

  v64[1] = *MEMORY[0x1E4F143B8];
  v46 = a3;
  id v8 = a4;
  uint64_t v9 = [(ETTaskDefinition *)self taskState];
  id v10 = v9;
  if (v9)
  {
    [v9 networkPointer];
    uint64_t v11 = v53;
  }
  else
  {
    uint64_t v11 = 0;
    v53 = 0;
    v54 = 0;
  }
  id v12 = v46;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v12 UTF8String]);
  Espresso::net::get_global(&v55, v11, (unsigned __int8 *)&__p);
  if ((v48[15] & 0x80000000) != 0) {
    operator delete(__p);
  }
  if (v54) {
    nitro::nitro_function::nitro_function(v54);
  }
  uint64_t v13 = v55;
  if (!v55)
  {
    if (a5)
    {
      v29 = (void *)MEMORY[0x1E4F28C58];
      v63 = *MEMORY[0x1E4F28568];
      BOOL v16 = [NSString stringWithFormat:@"Unable to set tensor named %@, no variable tensor with that name found.", v12];
      v64[0] = v16;
      uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
      *a5 = [v29 errorWithDomain:@"EspressoError" code:1 userInfo:v30];

      goto LABEL_36;
    }
LABEL_31:
    uint64_t v28 = 0;
    goto LABEL_38;
  }
  if ([v8 type] != 2)
  {
    if (a5)
    {
      v31 = (void *)MEMORY[0x1E4F28C58];
      v61 = *MEMORY[0x1E4F28568];
      BOOL v16 = [NSString stringWithFormat:@"Trying to set tensor %@ failed, tensor must be of type: kETDataTypeFloat32.", v12];
      v62 = v16;
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
      *a5 = [v31 errorWithDomain:@"EspressoError" code:1 userInfo:v32];

      goto LABEL_36;
    }
    goto LABEL_31;
  }
  v14 = [ETDataTensor alloc];
  size_t v15 = v56;
  v51 = v13;
  v52 = v56;
  if (v56) {
    atomic_fetch_add_explicit(&v56->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  BOOL v16 = [(ETDataTensor *)v14 initWithBlobContainer:&v51];
  if (v52) {
    nitro::nitro_function::nitro_function(v52);
  }
  v17 = [(ETDataTensor *)v16 shape];
  v18 = [v8 shape];
  char v19 = [v17 isEqual:v18];

  if (v19)
  {
    v20 = [(ETDataTensor *)v16 strides];
    unint64_t v21 = [v8 strides];
    char v22 = [v20 isEqual:v21];

    if (v22)
    {
      uint64_t v23 = [v8 dataPointer];
      __p = &unk_1EE36BF10;
      v49 = 0u;
      v50 = 0u;
      *(_OWORD *)v48 = xmmword_192DC3600;
      *(void *)&v48[16] = v23;
      v48[24] = 0;
      v24 = (char *)operator new(0x60uLL);
      uint64_t v25 = (std::__shared_weak_count *)v24;
      *(_OWORD *)(v24 + 8) = 0u;
      *(void *)v24 = &unk_1EE3899C8;
      v26 = v24 + 24;
      *((void *)v24 + 3) = &unk_1EE36BF10;
      *((_OWORD *)v24 + 2) = *(_OWORD *)v48;
      *(_OWORD *)(v24 + 41) = *(_OWORD *)&v48[9];
      *((_OWORD *)v24 + 4) = 0u;
      *((_OWORD *)v24 + 5) = 0u;
      if (v15) {
        atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      atomic_fetch_add_explicit((atomic_ullong *volatile)v24 + 1, 1uLL, memory_order_relaxed);
      id v27 = *(void (****)(uint64_t *__return_ptr, void))(v13 + 72);
      __p = (void *)MEMORY[0x1E4F143A8];
      *(void *)v48 = 3321888768;
      *(void *)&v48[8] = ___ZN8Espresso19sync_copy_from_hostENSt3__110shared_ptrINS_23abstract_blob_containerEEENS1_INS_4blobIfLi4EEEEE_block_invoke;
      *(void *)&v48[16] = &__block_descriptor_64_ea8_32c62_ZTSNSt3__110shared_ptrIN8Espresso23abstract_blob_containerEEE48c49_ZTSNSt3__110shared_ptrIN8Espresso4blobIfLi4EEEEE_e10_v16__0r_v8l;
      *(void *)&v48[24] = v13;
      *(void *)&v49 = v15;
      if (v15) {
        atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      *((void *)&v49 + 1) = v26;
      *(void *)&v50 = v25;
      atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
      Espresso::abstract_context::compute_batch_sync(v27, &__p);
      if ((void)v50) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)v50);
      }
      if ((void)v49) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)v49);
      }
      nitro::nitro_function::nitro_function(v25);
      if (v15) {
        nitro::nitro_function::nitro_function(v15);
      }
      nitro::nitro_function::nitro_function(v25);
      uint64_t v28 = 1;
      goto LABEL_37;
    }
    if (a5)
    {
      v39 = (void *)MEMORY[0x1E4F28C58];
      v57 = *MEMORY[0x1E4F28568];
      v40 = NSString;
      v41 = [(ETDataTensor *)v16 shape];
      v42 = [v8 shape];
      v43 = [v40 stringWithFormat:@"Trying to set tensor %@ failed, provided tensor must have strides: %@ (found: %@).", v12, v41, v42];
      v58 = v43;
      v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      *a5 = [v39 errorWithDomain:@"EspressoError" code:1 userInfo:v44];
    }
  }
  else if (a5)
  {
    v33 = (void *)MEMORY[0x1E4F28C58];
    v59 = *MEMORY[0x1E4F28568];
    v34 = NSString;
    v35 = [(ETDataTensor *)v16 shape];
    v36 = [v8 shape];
    v37 = [v34 stringWithFormat:@"Trying to set tensor %@ failed, provided tensor must be of shape: %@, (found: %@).", v12, v35, v36];
    v60 = v37;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    *a5 = [v33 errorWithDomain:@"EspressoError" code:1 userInfo:v38];
  }
LABEL_36:
  uint64_t v28 = 0;
LABEL_37:

LABEL_38:
  if (v56) {
    nitro::nitro_function::nitro_function(v56);
  }

  return v28;
}

- (BOOL)setParameterOfType:(unint64_t)a3 forLayerNamed:(id)a4 withValue:(id)a5 error:(id *)a6
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v57 = a4;
  id v55 = a5;
  uint64_t v9 = [(ETTaskDefinition *)self taskState];
  uint64_t v10 = 0;
  v56 = 0;
  uint64_t v11 = 0;
  unint64_t v12 = 0;
  if (!v9) {
    goto LABEL_6;
  }
LABEL_2:
  [v9 networkPointer];
  unint64_t v13 = (uint64_t)(*(void *)(v61.__r_.__value_.__r.__words[0] + 40) - *(void *)(v61.__r_.__value_.__r.__words[0] + 32)) >> 4;
  if (v61.__r_.__value_.__l.__size_) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v61.__r_.__value_.__l.__size_);
  }
  if (v12 < v13)
  {
    do
    {
      v14 = [(ETTaskDefinition *)self taskState];
      [v14 networkPointer];
      uint64_t v15 = *(void *)(*(void *)(v61.__r_.__value_.__r.__words[0] + 32) + v10);
      BOOL v16 = (const char *)[v57 UTF8String];
      v17 = (void *)(v15 + 16);
      size_t v18 = strlen(v16);
      if (*(char *)(v15 + 39) < 0)
      {
        if (v18 == *(void *)(v15 + 24))
        {
          if (v18 == -1) {
            std::string::__throw_out_of_range[abi:ne180100]();
          }
          v17 = (void *)*v17;
LABEL_13:
          BOOL v19 = memcmp(v17, v16, v18) == 0;
          goto LABEL_15;
        }
      }
      else if (v18 == *(unsigned __int8 *)(v15 + 39))
      {
        goto LABEL_13;
      }
      BOOL v19 = 0;
LABEL_15:
      if (v61.__r_.__value_.__l.__size_) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)v61.__r_.__value_.__l.__size_);
      }

      if (v19)
      {
        v20 = [(ETTaskDefinition *)self taskState];
        [v20 networkPointer];
        unint64_t v21 = (uint64_t *)(*(void *)(v61.__r_.__value_.__r.__words[0] + 32) + v10);
        uint64_t v11 = *v21;
        char v22 = (std::__shared_weak_count *)v21[1];
        if (v22) {
          atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (v56) {
          nitro::nitro_function::nitro_function(v56);
        }
        if (v61.__r_.__value_.__l.__size_) {
          nitro::nitro_function::nitro_function((std::__shared_weak_count *)v61.__r_.__value_.__l.__size_);
        }

        v56 = v22;
      }
      ++v12;
      v10 += 16;
      if (v9) {
        goto LABEL_2;
      }
LABEL_6:
      ;
    }
    while (v12 < (uint64_t)(MEMORY[0x28] - MEMORY[0x20]) >> 4);
  }
  if (!v11)
  {
    if (a6)
    {
      v38 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v68 = *MEMORY[0x1E4F28568];
      v39 = [NSString stringWithFormat:@"Unable to find layer named: %@", v57];
      v69[0] = v39;
      v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:&v68 count:1];
      *a6 = [v38 errorWithDomain:@"EspressoError" code:1 userInfo:v40];
    }
    goto LABEL_49;
  }
  if (a3 == 3)
  {
    uint64_t v23 = *(const void **)(v11 + 64);
    if (v23)
    {
      if (v24)
      {
        uint64_t v25 = v24;
        v26 = *(std::__shared_weak_count **)(v11 + 72);
        if (v26) {
          atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        id v27 = [v55 shape];
        if ([v27 count] == 1)
        {
          uint64_t v28 = [v55 shape];
          v29 = [v28 objectAtIndexedSubscript:0];
          BOOL v30 = 0xAAAAAAAAAAAAAAABLL * [v29 integerValue] + 0x2AAAAAAAAAAAAAAALL < 0x5555555555555555;

          if (v30)
          {
            v31 = [v55 shape];
            v32 = [v31 objectAtIndexedSubscript:0];
            int v33 = [v32 integerValue];

            int v34 = v33 % 3;
            *(_DWORD *)((*(uint64_t (**)(void *))(*(void *)v25 + 384))(v25) + 8) = v33 % 3;
            uint64_t v35 = [v55 dataPointer];
            v36 = (char *)operator new(0x58uLL);
            *((void *)v36 + 1) = 0;
            *(void *)v36 = &unk_1EE389920;
            *((void *)v36 + 2) = 0;
            *((void *)v36 + 3) = &unk_1EE36BEB0;
            *(_OWORD *)(v36 + 56) = 0u;
            *(_OWORD *)(v36 + 72) = 0u;
            *((_DWORD *)v36 + 8) = 3 * v34;
            *((void *)v36 + 5) = v35;
            v36[48] = 0;
            v62 = v36 + 24;
            v63 = (std::__shared_weak_count *)v36;
            atomic_fetch_add_explicit((atomic_ullong *volatile)v36 + 1, 1uLL, memory_order_relaxed);
            (*(void (**)(void *, char **))(*(void *)v25 + 392))(v25, &v62);
            if (v63) {
              nitro::nitro_function::nitro_function(v63);
            }
            nitro::nitro_function::nitro_function((std::__shared_weak_count *)v36);
            BOOL v37 = 1;
LABEL_67:
            if (v26) {
              nitro::nitro_function::nitro_function(v26);
            }
            goto LABEL_69;
          }
        }
        else
        {
        }
        if (a6)
        {
          v51 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v66 = *MEMORY[0x1E4F28568];
          v67 = @"kETLayerParameterTypeSparseWeightsCOO has to have rank 1 and its length must be a multiple of 3";
          v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
          *a6 = [v51 errorWithDomain:@"EspressoError" code:1 userInfo:v52];
        }
        BOOL v37 = 0;
        goto LABEL_67;
      }
    }
    if (a6)
    {
      v43 = (void *)(v11 + 40);
      if (*(char *)(v11 + 63) < 0) {
        v43 = (void *)*v43;
      }
      v44 = [NSString stringWithFormat:@"Trying to set sparse weights for non-sparse layer %@ with type %s", v57, v43];
      v45 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v64 = *MEMORY[0x1E4F28568];
      v65 = v44;
      v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
      *a6 = [v45 errorWithDomain:@"EspressoError" code:1 userInfo:v46];
    }
LABEL_49:
    BOOL v37 = 0;
    goto LABEL_69;
  }
  if (a3 == 1) {
    int v41 = 1;
  }
  else {
    int v41 = 2;
  }
  if (v9)
  {
    [v9 networkPointer];
    v42 = v59;
  }
  else
  {
    v42 = 0;
    v59 = 0;
    v60 = 0;
  }
  Espresso::get_layer_parameter_name((const void **)(v11 + 16), v41, &__p);
  uint64_t v47 = Espresso::net::loaded_global_name(v42, (uint64_t)&__p);
  if (*(char *)(v47 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v61, *(const std::string::value_type **)v47, *(void *)(v47 + 8));
  }
  else
  {
    long long v48 = *(_OWORD *)v47;
    v61.__r_.__value_.__r.__words[2] = *(void *)(v47 + 16);
    *(_OWORD *)&v61.__r_.__value_.__l.__data_ = v48;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v60) {
    nitro::nitro_function::nitro_function(v60);
  }
  if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v49 = &v61;
  }
  else {
    v49 = (std::string *)v61.__r_.__value_.__r.__words[0];
  }
  v50 = [NSString stringWithUTF8String:v49];
  BOOL v37 = [(ETTaskDefinition *)self setTensorNamed:v50 withValue:v55 error:a6];

  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v61.__r_.__value_.__l.__data_);
  }
LABEL_69:
  if (v56) {
    nitro::nitro_function::nitro_function(v56);
  }

  return v37;
}

- (id)getParameterOfType:(unint64_t)a3 forLayerNamed:(id)a4 error:(id *)a5
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v33 = a4;
  id v6 = [(ETTaskDefinition *)self taskState];
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  unint64_t v10 = 0;
  if (!v6) {
    goto LABEL_6;
  }
LABEL_2:
  [v6 networkPointer];
  unint64_t v11 = (uint64_t)(*(void *)(v37.__r_.__value_.__r.__words[0] + 40) - *(void *)(v37.__r_.__value_.__r.__words[0] + 32)) >> 4;
  if (v37.__r_.__value_.__l.__size_) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v37.__r_.__value_.__l.__size_);
  }
  if (v10 >= v11)
  {
    if (v8)
    {
      memset(&v37, 0, sizeof(v37));
      [v6 networkPointer];
      if (a3 == 1) {
        int v21 = 1;
      }
      else {
        int v21 = 2;
      }
      char v22 = v35;
      goto LABEL_37;
    }
    goto LABEL_46;
  }
  do
  {
    unint64_t v12 = [(ETTaskDefinition *)self taskState];
    [v12 networkPointer];
    uint64_t v13 = *(void *)(*(void *)(v37.__r_.__value_.__r.__words[0] + 32) + v7);
    v14 = (const char *)[v33 UTF8String];
    uint64_t v15 = (void *)(v13 + 16);
    size_t v16 = strlen(v14);
    if (*(char *)(v13 + 39) < 0)
    {
      if (v16 == *(void *)(v13 + 24))
      {
        if (v16 == -1) {
          std::string::__throw_out_of_range[abi:ne180100]();
        }
        uint64_t v15 = (void *)*v15;
LABEL_13:
        BOOL v17 = memcmp(v15, v14, v16) == 0;
        goto LABEL_15;
      }
    }
    else if (v16 == *(unsigned __int8 *)(v13 + 39))
    {
      goto LABEL_13;
    }
    BOOL v17 = 0;
LABEL_15:
    if (v37.__r_.__value_.__l.__size_) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)v37.__r_.__value_.__l.__size_);
    }

    if (v17)
    {
      size_t v18 = [(ETTaskDefinition *)self taskState];
      [v18 networkPointer];
      BOOL v19 = (uint64_t *)(*(void *)(v37.__r_.__value_.__r.__words[0] + 32) + v7);
      uint64_t v8 = *v19;
      v20 = (std::__shared_weak_count *)v19[1];
      if (v20) {
        atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (v9) {
        nitro::nitro_function::nitro_function(v9);
      }
      if (v37.__r_.__value_.__l.__size_) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)v37.__r_.__value_.__l.__size_);
      }

      uint64_t v9 = v20;
    }
    ++v10;
    v7 += 16;
    if (v6) {
      goto LABEL_2;
    }
LABEL_6:
    ;
  }
  while (v10 < (uint64_t)(MEMORY[0x28] - MEMORY[0x20]) >> 4);
  if (!v8)
  {
LABEL_46:
    if (a5)
    {
      id v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = *MEMORY[0x1E4F28568];
      uint64_t v28 = [NSString stringWithFormat:@"Unable to find layer named: %@", v33];
      v39[0] = v28;
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
      *a5 = [v27 errorWithDomain:@"EspressoError" code:1 userInfo:v29];
    }
    v26 = 0;
    goto LABEL_49;
  }
  char v22 = 0;
  *(_OWORD *)&v37.__r_.__value_.__l.__data_ = 0uLL;
  if (a3 == 1) {
    int v21 = 1;
  }
  else {
    int v21 = 2;
  }
  v37.__r_.__value_.__r.__words[2] = 0;
  uint64_t v35 = 0;
  v36 = 0;
LABEL_37:
  Espresso::get_layer_parameter_name((const void **)(v8 + 16), v21, &__p);
  uint64_t v23 = (const std::string *)Espresso::net::loaded_global_name(v22, (uint64_t)&__p);
  std::string::operator=(&v37, v23);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v36) {
    nitro::nitro_function::nitro_function(v36);
  }
  if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v24 = &v37;
  }
  else {
    v24 = (std::string *)v37.__r_.__value_.__r.__words[0];
  }
  uint64_t v25 = [NSString stringWithUTF8String:v24];
  v26 = [(ETTaskDefinition *)self getTensorNamed:v25];

  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
LABEL_49:
  if (v9) {
    nitro::nitro_function::nitro_function(v9);
  }

  return v26;
}

- (unint64_t)dataTypeForParameterOfType:(unint64_t)a3 fromLayerNamed:(id)a4
{
  return 2;
}

- (ETTaskState)taskState
{
  v3 = [ETTaskState alloc];
  [(ETTaskDefinition *)self trainingGraphNetPtr];
  BOOL v4 = [(ETTaskState *)v3 initWithNetwork:&v6];
  if (v7) {
    nitro::nitro_function::nitro_function(v7);
  }

  return v4;
}

- (BOOL)setWeightsOfInferenceNetworkLoadedFrom:(id)a3 AndSaveTo:(id)a4 error:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  LODWORD(__str.__r_.__value_.__l.__data_) = 80000;
  Espresso::create_context((int *)&__str, &v53);
  self->precision = 0;
  id v10 = v8;
  unint64_t v11 = std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v10 UTF8String]);
  Espresso::load_network((uint64_t)v11, &v53, self->precision, 0, (uint64_t *)&v50);
  long long v12 = *(_OWORD *)&v50.__r_.__value_.__l.__data_;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  long long v51 = v12;
  if (*((void *)&v12 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v12 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  BOOL v13 = [(ETTaskDefinition *)self setInferenceNetworkWeights:&v51 error:a5];
  if (*((void *)&v51 + 1)) {
    nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v51 + 1));
  }
  if (v13)
  {
    id v36 = v9;
    p_str = &__str;
    std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v36 UTF8String]);
    BOOL v37 = v13;
    id v38 = v10;
    int v15 = SHIBYTE(__str.__r_.__value_.__r.__words[2]);
    long long v16 = *(_OWORD *)&__str.__r_.__value_.__l.__data_;
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int64_t size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    }
    else {
      int64_t size = __str.__r_.__value_.__l.__size_;
    }
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    size_t v18 = (char *)p_str + size;
    if (size >= 4)
    {
      int64_t v20 = size;
      int v21 = p_str;
      do
      {
        char v22 = (char *)memchr(v21, 46, v20 - 3);
        if (!v22) {
          break;
        }
        if (*(_DWORD *)v22 == 1852400174) {
          goto LABEL_20;
        }
        int v21 = (std::string *)(v22 + 1);
        int64_t v20 = v18 - (char *)v21;
      }
      while (v18 - (char *)v21 > 3);
      char v22 = (char *)p_str + size;
LABEL_20:
      uint64_t v23 = v22 - (char *)p_str;
      if (v22 == v18) {
        uint64_t v23 = -1;
      }
      BOOL v19 = v23 == size - 4;
      if (size >= 5)
      {
        uint64_t v25 = p_str;
        do
        {
          v24 = (char *)memchr(v25, 46, size - 4);
          if (!v24) {
            break;
          }
          if (*(_DWORD *)v24 == 1852400174 && v24[4] == 58) {
            goto LABEL_32;
          }
          uint64_t v25 = (std::string *)(v24 + 1);
          int64_t size = v18 - (char *)v25;
        }
        while (v18 - (char *)v25 > 4);
        v24 = v18;
LABEL_32:
        BOOL v27 = v24 == v18 || v24 - (char *)p_str == -1;
        int v28 = !v27;
        int v29 = !v27 || v19;
        if (v15 < 0) {
          std::string::__init_copy_ctor_external(&v50, (const std::string::value_type *)v16, *((std::string::size_type *)&v16 + 1));
        }
        else {
          std::string v50 = __str;
        }
        std::string::basic_string[abi:ne180100]<0>(&__p, "");
        if (v28)
        {
          BOOL v30 = &__str;
          if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            BOOL v30 = (std::string *)__str.__r_.__value_.__r.__words[0];
          }
          std::string::size_type v31 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
          if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            std::string::size_type v31 = __str.__r_.__value_.__l.__size_;
          }
          while (v31)
          {
            int v32 = v30->__r_.__value_.__s.__data_[--v31];
            if (v32 == 58)
            {
              std::string::size_type v33 = v31;
              goto LABEL_53;
            }
          }
          std::string::size_type v33 = -1;
LABEL_53:
          std::string::basic_string(&v48, &__str, 0, v33, (std::allocator<char> *)v55);
          if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v50.__r_.__value_.__l.__data_);
          }
          std::string v50 = v48;
          std::string::basic_string(&v48, &__str, v33 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)v55);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          std::string __p = v48;
        }
        if (v29)
        {
          long long v47 = v12;
          if (*((void *)&v12 + 1)) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v12 + 1) + 8), 1uLL, memory_order_relaxed);
          }
          if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
            std::string::__init_copy_ctor_external(&v46, v50.__r_.__value_.__l.__data_, v50.__r_.__value_.__l.__size_);
          }
          else {
            std::string v46 = v50;
          }
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            std::string::__init_copy_ctor_external(&v45, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          }
          else {
            std::string v45 = __p;
          }
          id v10 = v38;
          BOOL v13 = v37;
          Espresso::dump_network_binserializer((uint64_t *)&v47, (const char *)&v46, (const void **)&v45.__r_.__value_.__l.__data_);
          if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v45.__r_.__value_.__l.__data_);
          }
          if ((SHIBYTE(v46.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_80;
          }
          int v34 = (void *)v46.__r_.__value_.__r.__words[0];
        }
        else
        {
          long long v44 = v12;
          if (*((void *)&v12 + 1)) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v12 + 1) + 8), 1uLL, memory_order_relaxed);
          }
          id v10 = v38;
          BOOL v13 = v37;
          std::string::basic_string[abi:ne180100]<0>(&v43, (char *)[v36 UTF8String]);
          std::string::basic_string[abi:ne180100]<0>(v41, "");
          std::string::basic_string[abi:ne180100]<0>(v39, "");
          Espresso::dump_network((uint64_t *)&v44, &v43, (uint64_t)v41, (uint64_t)v39);
          if (v40 < 0) {
            operator delete(v39[0]);
          }
          if (v42 < 0) {
            operator delete(v41[0]);
          }
          if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_80;
          }
          int v34 = (void *)v43.__r_.__value_.__r.__words[0];
        }
        operator delete(v34);
LABEL_80:
        if (*((void *)&v12 + 1)) {
          nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v12 + 1));
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v50.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__str.__r_.__value_.__l.__data_);
        }
        goto LABEL_88;
      }
    }
    else
    {
      BOOL v19 = size == 3;
    }
    v24 = (char *)p_str + size;
    goto LABEL_32;
  }
LABEL_88:
  if (*((void *)&v12 + 1)) {
    nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v12 + 1));
  }
  if (v54) {
    nitro::nitro_function::nitro_function(v54);
  }

  return v13;
}

- (BOOL)setInferenceNetworkWeights:(shared_ptr<Espresso:(id *)a4 :net>)a3 error:
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  [(ETTaskDefinition *)self trainingGraphNetPtr];
  Espresso::run_pass_on_network<Espresso::pass_blob_name_indexing>((uint64_t)v134.__r_.__value_.__l.__data_);
  if (v134.__r_.__value_.__l.__size_) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v134.__r_.__value_.__l.__size_);
  }
  [(ETTaskDefinition *)self trainingGraphNetPtr];
  v5 = (char *)Espresso::net::get_analysis<Espresso::pass_blob_name_indexing_result>((uint64_t)v134.__r_.__value_.__l.__data_);
  if (v134.__r_.__value_.__l.__size_) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v134.__r_.__value_.__l.__size_);
  }
  uint64_t v6 = *(void *)(*(void *)a3.__ptr_ + 32);
  if (*(void *)(*(void *)a3.__ptr_ + 40) == v6) {
    return 1;
  }
  unint64_t v7 = 0;
  v114 = v5;
  v115 = v5 + 16;
  v116 = (uint64_t *)*MEMORY[0x1E4F28568];
  while (1)
  {
    id v8 = (uint64_t *)(v6 + 16 * v7);
    uint64_t v10 = *v8;
    id v9 = (std::__shared_weak_count *)v8[1];
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v11 = v10 + 16;
    if (*(char *)(v10 + 39) < 0) {
      uint64_t v11 = *(void *)(v10 + 16);
    }
    long long v12 = objc_msgSend(NSString, "stringWithFormat:", @"Missing inference layer %s", v11);
    [(ETTaskDefinition *)self trainingGraphNetPtr];
    BOOL v13 = (void *)(v134.__r_.__value_.__r.__words[0] + 928);
    id v14 = v12;
    int v15 = std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::find<std::string>(v13, v10 + 16);
    long long v16 = v15;
    if (a3.__cntrl_ && !v15)
    {
      BOOL v17 = (void *)MEMORY[0x1E4F28C58];
      v143 = (unint64_t *)v116;
      v142.__r_.__value_.__r.__words[0] = (std::string::size_type)v14;
      size_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:&v143 count:1];
      *(void *)a3.__cntrl_ = [v17 errorWithDomain:@"EspressoError" code:1 userInfo:v18];
    }
    if (v134.__r_.__value_.__l.__size_) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)v134.__r_.__value_.__l.__size_);
    }

    if (!v16)
    {
      int v35 = 1;
      goto LABEL_184;
    }
    uint64_t v135 = 0;
    [(ETTaskDefinition *)self trainingGraphNetPtr];
    v142.__r_.__value_.__r.__words[0] = v10 + 16;
    uint64_t v19 = std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v134.__r_.__value_.__r.__words[0] + 928, v10 + 16, (uint64_t)&std::piecewise_construct, (long long **)&v142)[5];
    if (v134.__r_.__value_.__l.__size_) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)v134.__r_.__value_.__l.__size_);
    }
    uint64_t v135 = v19;
    [(ETTaskDefinition *)self trainingGraphNetPtr];
    int64_t v20 = (uint64_t *)(*(void *)(v134.__r_.__value_.__r.__words[0] + 32) + 16 * v135);
    uint64_t v22 = *v20;
    int v21 = (std::__shared_weak_count *)v20[1];
    if (v21) {
      atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v134.__r_.__value_.__l.__size_) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)v134.__r_.__value_.__l.__size_);
    }
    uint64_t v23 = *(const void **)(v22 + 64);
    if (!v23
    {
      goto LABEL_181;
    }
    v24 = *(std::__shared_weak_count **)(v22 + 72);
    if (v24)
    {
      atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
      nitro::nitro_function::nitro_function(v24);
    }
    uint64_t v25 = [(ETVariablesDefinition *)self->varsDef layerNames];
    if (v25)
    {
      v26 = [(ETVariablesDefinition *)self->varsDef layerNames];
      BOOL v27 = (void *)(v22 + 16);
      if (*(char *)(v22 + 39) < 0) {
        BOOL v27 = (void *)*v27;
      }
      int v28 = [NSString stringWithUTF8String:v27];
      char v29 = [v26 containsObject:v28];

      if ((v29 & 1) == 0) {
        goto LABEL_117;
      }
    }
    BOOL v30 = *(const void **)(v22 + 64);
    if (!v30) {
      goto LABEL_118;
    }
    {
      std::string::size_type v31 = *(std::__shared_weak_count **)(v22 + 72);
      if (v31)
      {
        atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
        nitro::nitro_function::nitro_function(v31);
      }
      int v32 = *(const void **)(v10 + 64);
      if (v32)
      {
        if (v33)
        {
          int v34 = *(std::__shared_weak_count **)(v10 + 72);
          if (v34) {
            atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          goto LABEL_49;
        }
      }
      else
      {
        std::string::size_type v33 = 0;
      }
      int v34 = 0;
LABEL_49:
      [(ETTaskDefinition *)self trainingGraphNetPtr];
      v142.__r_.__value_.__r.__words[0] = (std::string::size_type)&v135;
      v39 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v134.__r_.__value_.__r.__words[0] + 56, (unint64_t *)&v135, (uint64_t)&std::piecewise_construct, (uint64_t **)&v142);
      uint64_t v41 = v39[3];
      uint64_t v40 = v39[4];
      if (v134.__r_.__value_.__l.__size_) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)v134.__r_.__value_.__l.__size_);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v40 - v41) >> 3) >= 2)
      {
        [(ETTaskDefinition *)self trainingGraphNetPtr];
        char v42 = (uint64_t *)v143;
        Espresso::get_layer_parameter_name((const void **)(v22 + 16), 1, &v142);
        uint64_t v43 = Espresso::net::loaded_global_name(v42, (uint64_t)&v142);
        if (*(char *)(v43 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v134, *(const std::string::value_type **)v43, *(void *)(v43 + 8));
        }
        else
        {
          long long v44 = *(_OWORD *)v43;
          v134.__r_.__value_.__r.__words[2] = *(void *)(v43 + 16);
          *(_OWORD *)&v134.__r_.__value_.__l.__data_ = v44;
        }
        if (SHIBYTE(v142.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v142.__r_.__value_.__l.__data_);
        }
        if (v144) {
          nitro::nitro_function::nitro_function(v144);
        }
        [(ETTaskDefinition *)self trainingGraphNetPtr];
        Espresso::net::get_global(&v142, (uint64_t)v143, (unsigned __int8 *)&v134);
        if (v144) {
          nitro::nitro_function::nitro_function(v144);
        }
        int64_t size = (std::__shared_weak_count *)v142.__r_.__value_.__l.__size_;
        if (v142.__r_.__value_.__r.__words[0])
        {
          long long v133 = *(_OWORD *)&v142.__r_.__value_.__l.__data_;
          if (v142.__r_.__value_.__l.__size_) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v142.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
          }
          Espresso::sync_copy_to_host(&v143, &v133);
          if (size) {
            nitro::nitro_function::nitro_function(size);
          }
          v52 = v144;
          v131 = (uint64_t *)v143;
          v132 = v144;
          if (v144) {
            atomic_fetch_add_explicit(&v144->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          (*(void (**)(void *, uint64_t **))(*(void *)v33 + 400))(v33, &v131);
          if (v132) {
            nitro::nitro_function::nitro_function(v132);
          }
          if (v52) {
            nitro::nitro_function::nitro_function(v52);
          }
        }
        if (size) {
          nitro::nitro_function::nitro_function(size);
        }
        if (SHIBYTE(v134.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v134.__r_.__value_.__l.__data_);
        }
      }
      [(ETTaskDefinition *)self trainingGraphNetPtr];
      v142.__r_.__value_.__r.__words[0] = (std::string::size_type)&v135;
      uint64_t v53 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v134.__r_.__value_.__r.__words[0] + 56, (unint64_t *)&v135, (uint64_t)&std::piecewise_construct, (uint64_t **)&v142);
      uint64_t v55 = v53[3];
      uint64_t v54 = v53[4];
      if (v134.__r_.__value_.__l.__size_) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)v134.__r_.__value_.__l.__size_);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v54 - v55) >> 3) < 3) {
        goto LABEL_179;
      }
      [(ETTaskDefinition *)self trainingGraphNetPtr];
      uint64_t v56 = (uint64_t *)v143;
      Espresso::get_layer_parameter_name((const void **)(v22 + 16), 2, &v142);
      uint64_t v57 = Espresso::net::loaded_global_name(v56, (uint64_t)&v142);
      if (*(char *)(v57 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v134, *(const std::string::value_type **)v57, *(void *)(v57 + 8));
      }
      else
      {
        long long v58 = *(_OWORD *)v57;
        v134.__r_.__value_.__r.__words[2] = *(void *)(v57 + 16);
        *(_OWORD *)&v134.__r_.__value_.__l.__data_ = v58;
      }
      if (SHIBYTE(v142.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v142.__r_.__value_.__l.__data_);
      }
      if (v144) {
        nitro::nitro_function::nitro_function(v144);
      }
      [(ETTaskDefinition *)self trainingGraphNetPtr];
      Espresso::net::get_global(&v142, (uint64_t)v143, (unsigned __int8 *)&v134);
      if (v144) {
        nitro::nitro_function::nitro_function(v144);
      }
      v59 = (std::__shared_weak_count *)v142.__r_.__value_.__l.__size_;
      if (!v142.__r_.__value_.__r.__words[0])
      {
LABEL_175:
        if (v59) {
          nitro::nitro_function::nitro_function(v59);
        }
        if (SHIBYTE(v134.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v134.__r_.__value_.__l.__data_);
        }
LABEL_179:
        if (v34) {
          nitro::nitro_function::nitro_function(v34);
        }
        goto LABEL_181;
      }
      long long v130 = *(_OWORD *)&v142.__r_.__value_.__l.__data_;
      if (v142.__r_.__value_.__l.__size_) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v142.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
      }
      Espresso::sync_copy_to_host(&v143, &v130);
      if (v59) {
        nitro::nitro_function::nitro_function(v59);
      }
      std::allocate_shared[abi:ne180100]<Espresso::blob<float,1>,std::allocator<Espresso::blob<float,1>>,int &,void>(&v128, *((_DWORD *)v143 + 4));
      v60 = v129;
      uint64_t v126 = v128;
      v127 = v129;
      if (v129) {
        atomic_fetch_add_explicit(&v129->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      (*(void (**)(void *, uint64_t *))(*(void *)v33 + 392))(v33, &v126);
      if (v127) {
        nitro::nitro_function::nitro_function(v127);
      }
      if (!v60)
      {
LABEL_173:
        if (v144) {
          nitro::nitro_function::nitro_function(v144);
        }
        goto LABEL_175;
      }
      std::string v61 = v60;
LABEL_172:
      nitro::nitro_function::nitro_function(v61);
      goto LABEL_173;
    }
    {
      id v36 = *(std::__shared_weak_count **)(v22 + 72);
      if (v36)
      {
        atomic_fetch_add_explicit(&v36->__shared_owners_, 1uLL, memory_order_relaxed);
        nitro::nitro_function::nitro_function(v36);
      }
      BOOL v37 = *(const void **)(v10 + 64);
      if (v37)
      {
        if (v38)
        {
          int v34 = *(std::__shared_weak_count **)(v10 + 72);
          if (v34) {
            atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          goto LABEL_108;
        }
      }
      else
      {
        id v38 = 0;
      }
      int v34 = 0;
LABEL_108:
      [(ETTaskDefinition *)self trainingGraphNetPtr];
      v142.__r_.__value_.__r.__words[0] = (std::string::size_type)&v135;
      v62 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v134.__r_.__value_.__r.__words[0] + 56, (unint64_t *)&v135, (uint64_t)&std::piecewise_construct, (uint64_t **)&v142);
      uint64_t v64 = v62[3];
      uint64_t v63 = v62[4];
      if (v134.__r_.__value_.__l.__size_) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)v134.__r_.__value_.__l.__size_);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v63 - v64) >> 3) >= 2)
      {
        [(ETTaskDefinition *)self trainingGraphNetPtr];
        v65 = (uint64_t *)v143;
        Espresso::get_layer_parameter_name((const void **)(v22 + 16), 1, &v142);
        uint64_t v66 = Espresso::net::loaded_global_name(v65, (uint64_t)&v142);
        if (*(char *)(v66 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v134, *(const std::string::value_type **)v66, *(void *)(v66 + 8));
        }
        else
        {
          long long v67 = *(_OWORD *)v66;
          v134.__r_.__value_.__r.__words[2] = *(void *)(v66 + 16);
          *(_OWORD *)&v134.__r_.__value_.__l.__data_ = v67;
        }
        if (SHIBYTE(v142.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v142.__r_.__value_.__l.__data_);
        }
        if (v144) {
          nitro::nitro_function::nitro_function(v144);
        }
        [(ETTaskDefinition *)self trainingGraphNetPtr];
        Espresso::net::get_global(&v142, (uint64_t)v143, (unsigned __int8 *)&v134);
        if (v144) {
          nitro::nitro_function::nitro_function(v144);
        }
        v71 = (std::__shared_weak_count *)v142.__r_.__value_.__l.__size_;
        if (v142.__r_.__value_.__r.__words[0])
        {
          long long v125 = *(_OWORD *)&v142.__r_.__value_.__l.__data_;
          if (v142.__r_.__value_.__l.__size_) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v142.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
          }
          Espresso::sync_copy_to_host(&v143, &v125);
          if (v71) {
            nitro::nitro_function::nitro_function(v71);
          }
          v72 = (uint64_t *)v143;
          std::allocate_shared[abi:ne180100]<Espresso::blob<float,2>,std::allocator<Espresso::blob<float,2>>,int &,int &,void>(&v128, *((_DWORD *)v143 + 2), *((_DWORD *)v143 + 3));
          uint64_t v73 = 0;
          uint64_t v74 = v128;
          uint64_t v75 = *((int *)v72 + 2);
          do
          {
            v75 *= *(int *)((char *)v72 + v73 + 12);
            v73 += 4;
          }
          while (v73 != 12);
          memcpy(*(void **)(v128 + 16), (const void *)v72[3], 4 * v75);
          v76 = v129;
          uint64_t v123 = v74;
          v124 = v129;
          if (v129) {
            atomic_fetch_add_explicit(&v129->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          (*(void (**)(void *, uint64_t *))(*(void *)v38 + 400))(v38, &v123);
          if (v124) {
            nitro::nitro_function::nitro_function(v124);
          }
          if (v76) {
            nitro::nitro_function::nitro_function(v76);
          }
          if (v144) {
            nitro::nitro_function::nitro_function(v144);
          }
        }
        if (v71) {
          nitro::nitro_function::nitro_function(v71);
        }
        if (SHIBYTE(v134.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v134.__r_.__value_.__l.__data_);
        }
      }
      [(ETTaskDefinition *)self trainingGraphNetPtr];
      v142.__r_.__value_.__r.__words[0] = (std::string::size_type)&v135;
      v77 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v134.__r_.__value_.__r.__words[0] + 56, (unint64_t *)&v135, (uint64_t)&std::piecewise_construct, (uint64_t **)&v142);
      uint64_t v79 = v77[3];
      uint64_t v78 = v77[4];
      if (v134.__r_.__value_.__l.__size_) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)v134.__r_.__value_.__l.__size_);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v78 - v79) >> 3) < 3) {
        goto LABEL_179;
      }
      [(ETTaskDefinition *)self trainingGraphNetPtr];
      v80 = (uint64_t *)v143;
      Espresso::get_layer_parameter_name((const void **)(v22 + 16), 2, &v142);
      uint64_t v81 = Espresso::net::loaded_global_name(v80, (uint64_t)&v142);
      if (*(char *)(v81 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v134, *(const std::string::value_type **)v81, *(void *)(v81 + 8));
      }
      else
      {
        long long v82 = *(_OWORD *)v81;
        v134.__r_.__value_.__r.__words[2] = *(void *)(v81 + 16);
        *(_OWORD *)&v134.__r_.__value_.__l.__data_ = v82;
      }
      if (SHIBYTE(v142.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v142.__r_.__value_.__l.__data_);
      }
      if (v144) {
        nitro::nitro_function::nitro_function(v144);
      }
      [(ETTaskDefinition *)self trainingGraphNetPtr];
      Espresso::net::get_global(&v142, (uint64_t)v143, (unsigned __int8 *)&v134);
      if (v144) {
        nitro::nitro_function::nitro_function(v144);
      }
      v59 = (std::__shared_weak_count *)v142.__r_.__value_.__l.__size_;
      if (!v142.__r_.__value_.__r.__words[0]) {
        goto LABEL_175;
      }
      long long v122 = *(_OWORD *)&v142.__r_.__value_.__l.__data_;
      if (v142.__r_.__value_.__l.__size_) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v142.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
      }
      Espresso::sync_copy_to_host(&v143, &v122);
      if (v59) {
        nitro::nitro_function::nitro_function(v59);
      }
      v83 = (uint64_t *)v143;
      std::allocate_shared[abi:ne180100]<Espresso::blob<float,1>,std::allocator<Espresso::blob<float,1>>,int &,void>(&v128, *((_DWORD *)v143 + 4));
      uint64_t v84 = 0;
      uint64_t v85 = v128;
      uint64_t v86 = *((int *)v83 + 2);
      do
      {
        v86 *= *(int *)((char *)v83 + v84 + 12);
        v84 += 4;
      }
      while (v84 != 12);
      memcpy(*(void **)(v128 + 16), (const void *)v83[3], 4 * v86);
      v87 = v129;
      uint64_t v120 = v85;
      v121 = v129;
      if (v129) {
        atomic_fetch_add_explicit(&v129->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      (*(void (**)(void *, uint64_t *))(*(void *)v38 + 392))(v38, &v120);
      if (v121) {
        nitro::nitro_function::nitro_function(v121);
      }
      if (!v87) {
        goto LABEL_173;
      }
      std::string v61 = v87;
      goto LABEL_172;
    }
    if (!v45)
    {
      {
        uint64_t v68 = *(std::__shared_weak_count **)(v22 + 72);
        if (v68)
        {
          atomic_fetch_add_explicit(&v68->__shared_owners_, 1uLL, memory_order_relaxed);
          nitro::nitro_function::nitro_function(v68);
        }
LABEL_117:
        int v35 = 4;
        goto LABEL_182;
      }
LABEL_118:
      if (a3.__cntrl_)
      {
        v69 = (void *)MEMORY[0x1E4F28C58];
        v136 = v116;
        v137 = @"Currently only supports networks where only inner product and convolution layers have weights";
        v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v137 forKeys:&v136 count:1];
        *(void *)a3.__cntrl_ = [v69 errorWithDomain:@"EspressoError" code:1 userInfo:v70];
      }
LABEL_120:
      int v35 = 1;
      goto LABEL_182;
    }
    std::string v46 = v45;
    long long v47 = *(std::__shared_weak_count **)(v22 + 72);
    if (v47) {
      atomic_fetch_add_explicit(&v47->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    std::string v48 = *(const void **)(v10 + 64);
    if (!v48)
    {
      v49 = 0;
LABEL_190:
      std::string v50 = 0;
      goto LABEL_191;
    }
    if (!v49) {
      goto LABEL_190;
    }
    std::string v50 = *(std::__shared_weak_count **)(v10 + 72);
    if (v50) {
      atomic_fetch_add_explicit(&v50->__shared_owners_, 1uLL, memory_order_relaxed);
    }
LABEL_191:
    if (*(_DWORD *)((*(uint64_t (**)(void *))(*(void *)v46 + 384))(v46) + 4))
    {
      if (a3.__cntrl_)
      {
        v88 = (void *)MEMORY[0x1E4F28C58];
        v140 = v116;
        v141 = @"training batchnorm is not supported";
        v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v141 forKeys:&v140 count:1];
        *(void *)a3.__cntrl_ = [v88 errorWithDomain:@"EspressoError" code:1 userInfo:v89];
      }
      goto LABEL_201;
    }
    [(ETTaskDefinition *)self trainingGraphNetPtr];
    v142.__r_.__value_.__r.__words[0] = (std::string::size_type)&v135;
    v90 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v134.__r_.__value_.__r.__words[0] + 56, (unint64_t *)&v135, (uint64_t)&std::piecewise_construct, (uint64_t **)&v142);
    uint64_t v92 = v90[3];
    uint64_t v91 = v90[4];
    if (v134.__r_.__value_.__l.__size_) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)v134.__r_.__value_.__l.__size_);
    }
    if (v91 - v92 != 48)
    {
      if (a3.__cntrl_)
      {
        v94 = (void *)MEMORY[0x1E4F28C58];
        v138 = v116;
        v139 = @"number of batchnorm inputs != 2";
        v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v139 forKeys:&v138 count:1];
        *(void *)a3.__cntrl_ = [v94 errorWithDomain:@"EspressoError" code:1 userInfo:v95];
      }
LABEL_201:
      char v96 = 0;
      if (!v50) {
        goto LABEL_203;
      }
LABEL_202:
      nitro::nitro_function::nitro_function(v50);
      goto LABEL_203;
    }
    [(ETTaskDefinition *)self trainingGraphNetPtr];
    v143 = (unint64_t *)&v135;
    uint64_t v93 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v142.__r_.__value_.__r.__words[0] + 56, (unint64_t *)&v135, (uint64_t)&std::piecewise_construct, (uint64_t **)&v143)[3];
    if (*(char *)(v93 + 47) < 0) {
      std::string::__init_copy_ctor_external(&v134, *(const std::string::value_type **)(v93 + 24), *(void *)(v93 + 32));
    }
    else {
      std::string v134 = *(std::string *)(v93 + 24);
    }
    if (v142.__r_.__value_.__l.__size_) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)v142.__r_.__value_.__l.__size_);
    }
    v97 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(v115, (unsigned __int8 *)&v134);
    if (!v97) {
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    unint64_t v98 = *((int *)v97 + 10);
    uint64_t v99 = *((void *)v114 + 19);
    if (v98 >= (*((void *)v114 + 20) - v99) >> 3) {
      std::vector<unsigned long>::__throw_out_of_range[abi:ne180100]();
    }
    uint64_t v100 = *(void *)(v99 + 8 * v98);
    [(ETTaskDefinition *)self trainingGraphNetPtr];
    uint64_t v101 = *(void *)(*(void *)(v142.__r_.__value_.__r.__words[0] + 32) + 16 * v100);
    v102 = *(const void **)(v101 + 64);
    if (!v102)
    {
      v103 = 0;
LABEL_217:
      v104 = 0;
      goto LABEL_218;
    }
    if (!v103) {
      goto LABEL_217;
    }
    v104 = *(std::__shared_weak_count **)(v101 + 72);
    if (v104) {
      atomic_fetch_add_explicit(&v104->__shared_owners_, 1uLL, memory_order_relaxed);
    }
LABEL_218:
    if (v142.__r_.__value_.__l.__size_) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)v142.__r_.__value_.__l.__size_);
    }
    if (v103)
    {
      v113 = v104;
      Espresso::inline_get_cpu_blob<Espresso::blob<float,4>,false>(&v142, v103 + 43);
      uint64_t v105 = 0;
      std::string::size_type v106 = v142.__r_.__value_.__r.__words[0];
      int v107 = *(_DWORD *)(v142.__r_.__value_.__r.__words[0] + 8);
      do
      {
        v107 *= *(_DWORD *)(v142.__r_.__value_.__r.__words[0] + 12 + v105);
        v105 += 4;
      }
      while (v105 != 12);
      std::allocate_shared[abi:ne180100]<Espresso::blob<float,1>,std::allocator<Espresso::blob<float,1>>,unsigned long,void>(&v143, v107);
      uint64_t v108 = 0;
      v109 = (uint64_t *)v143;
      uint64_t v110 = *(int *)(v106 + 8);
      do
      {
        v110 *= *(int *)(v106 + 12 + v108);
        v108 += 4;
      }
      while (v108 != 12);
      memcpy((void *)v143[2], *(const void **)(v106 + 24), 4 * v110);
      v111 = v144;
      v118 = v109;
      v119 = v144;
      if (v144) {
        atomic_fetch_add_explicit(&v144->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v104 = v113;
      (*(void (**)(void *, uint64_t **))(*(void *)v49 + 392))(v49, &v118);
      if (v119) {
        nitro::nitro_function::nitro_function(v119);
      }
      if (v111) {
        nitro::nitro_function::nitro_function(v111);
      }
      if (v142.__r_.__value_.__l.__size_) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)v142.__r_.__value_.__l.__size_);
      }
    }
    if (v104) {
      nitro::nitro_function::nitro_function(v104);
    }
    if (SHIBYTE(v134.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v134.__r_.__value_.__l.__data_);
    }
    char v96 = 1;
    if (v50) {
      goto LABEL_202;
    }
LABEL_203:
    if (v47) {
      nitro::nitro_function::nitro_function(v47);
    }
    if ((v96 & 1) == 0) {
      goto LABEL_120;
    }
LABEL_181:
    int v35 = 0;
LABEL_182:
    if (v21) {
      nitro::nitro_function::nitro_function(v21);
    }
LABEL_184:
    if (v9) {
      nitro::nitro_function::nitro_function(v9);
    }
    if ((v35 | 4) != 4) {
      return 0;
    }
    ++v7;
    uint64_t v6 = *(void *)(*(void *)a3.__ptr_ + 32);
    if (v7 >= (*(void *)(*(void *)a3.__ptr_ + 40) - v6) >> 4) {
      return 1;
    }
  }
}

- (BOOL)saveTrainingNetwork:(id)a3 checkpoint:(id)a4 error:(id *)a5
{
  v31[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  memset(v29, 0, sizeof(v29));
  [(ETTaskDefinition *)self trainingGraphNetPtr];
  v31[0] = &unk_1EE379830;
  v31[1] = v29;
  v31[3] = v31;
  Espresso::net::apply_to_all_globals(__p, v31);
  std::__function::__value_func<void ()(std::pair<std::string,std::shared_ptr<Espresso::abstract_blob_container>> &)>::~__value_func[abi:ne180100](v31);
  if (v23) {
    nitro::nitro_function::nitro_function(v23);
  }
  [(ETTaskDefinition *)self trainingGraphNetPtr];
  Espresso::build_variable_loader(&v27, (uint64_t *)&__p, v29);
  if (v23) {
    nitro::nitro_function::nitro_function(v23);
  }
  [(ETTaskDefinition *)self trainingGraphNetPtr];
  uint64_t v9 = v25;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v8 UTF8String]);
  p_p = &__p;
  uint64_t v10 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v9 + 984, (unsigned __int8 *)&__p, (long long **)&p_p);
  uint64_t v11 = v27;
  long long v12 = v28;
  if (v28) {
    atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  BOOL v13 = (std::__shared_weak_count *)*((void *)v10 + 6);
  *((void *)v10 + 5) = v11;
  *((void *)v10 + 6) = v12;
  if (v13) {
    nitro::nitro_function::nitro_function(v13);
  }
  if (v24 < 0) {
    operator delete(__p);
  }
  if (v26) {
    nitro::nitro_function::nitro_function(v26);
  }
  [(ETTaskDefinition *)self trainingGraphNetPtr];
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v7 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(v17, "");
  std::string::basic_string[abi:ne180100]<0>(v15, "");
  Espresso::dump_network(&v20, &__str, (uint64_t)v17, (uint64_t)v15);
  if (v16 < 0) {
    operator delete(v15[0]);
  }
  if (v18 < 0) {
    operator delete(v17[0]);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (v21) {
    nitro::nitro_function::nitro_function(v21);
  }
  if (v12) {
    nitro::nitro_function::nitro_function(v12);
  }
  std::string __p = v29;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  return 1;
}

- (void)saveTrainingNetwork:checkpoint:error:
{
}

- (uint64_t)saveTrainingNetwork:checkpoint:error:
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EE379830;
  a2[1] = v2;
  return result;
}

- (std::string)saveTrainingNetwork:checkpoint:error:
{
  uint64_t v2 = *(void *)(a1 + 8);
  v3 = *(std::string **)(v2 + 8);
  if ((unint64_t)v3 >= *(void *)(v2 + 16))
  {
    shared_ptr<Espresso::net> result = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)v2, (uint64_t)a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(v2, a2);
    shared_ptr<Espresso::net> result = v3 + 1;
  }
  *(void *)(v2 + 8) = result;
  return result;
}

- (BOOL)saveNetwork:(id)a3 inplace:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v79[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [(ETTaskDefinition *)self inferenceGraphNetPtr];
  if (v65) {
    nitro::nitro_function::nitro_function(v65);
  }
  if (!v64)
  {
    if (a5)
    {
      id v38 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v78 = *MEMORY[0x1E4F28568];
      v79[0] = @"Use saveTrainingNetwork for ETTaskDefinition created by initWithTrainingModelDefinition";
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:&v78 count:1];
      *a5 = [v38 errorWithDomain:@"EspressoError" code:1 userInfo:v39];
    }
    goto LABEL_88;
  }
  if (v6)
  {
    [(ETTaskDefinition *)self inferenceGraphNetPtr];
    BOOL v9 = [(ETTaskDefinition *)self setInferenceNetworkWeights:v74 error:a5];
    if (v75) {
      nitro::nitro_function::nitro_function(v75);
    }
    if (v9)
    {
      [(ETTaskDefinition *)self inferenceGraphNetPtr];
      std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v8 UTF8String]);
      std::string::basic_string[abi:ne180100]<0>(v69, "");
      std::string::basic_string[abi:ne180100]<0>(__p, "");
      Espresso::dump_network(&v72, &__str, (uint64_t)v69, (uint64_t)__p);
      if (v68 < 0) {
        operator delete(__p[0]);
      }
      if (v70 < 0) {
        operator delete(v69[0]);
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      if (v73) {
        nitro::nitro_function::nitro_function(v73);
      }
      goto LABEL_16;
    }
LABEL_88:
    LOBYTE(v36) = 0;
    goto LABEL_89;
  }
LABEL_16:
  uint64_t v64 = 0;
  v65 = 0;
  uint64_t v66 = 0;
  [(ETTaskDefinition *)self trainingGraphNetPtr];
  v77[0] = &unk_1EE3797D8;
  v77[1] = &v64;
  v77[3] = v77;
  Espresso::net::apply_to_all_globals(v57, v77);
  std::__function::__value_func<void ()(std::pair<std::string,std::shared_ptr<Espresso::abstract_blob_container>> &)>::~__value_func[abi:ne180100](v77);
  if (v58) {
    nitro::nitro_function::nitro_function(v58);
  }
  [(ETTaskDefinition *)self trainingGraphNetPtr];
  Espresso::build_variable_loader(&v62, (uint64_t *)&v57, &v64);
  if (v58) {
    nitro::nitro_function::nitro_function(v58);
  }
  [(ETTaskDefinition *)self trainingGraphNetPtr];
  uint64_t v10 = v60;
  std::string::basic_string[abi:ne180100]<0>(&v57, "globals_container_net");
  v76 = &v57;
  uint64_t v11 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v10 + 984, (unsigned __int8 *)&v57, (long long **)&v76);
  uint64_t v12 = v62;
  BOOL v13 = v63;
  if (v63) {
    atomic_fetch_add_explicit(&v63->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v14 = (std::__shared_weak_count *)*((void *)v11 + 6);
  *((void *)v11 + 5) = v12;
  *((void *)v11 + 6) = v13;
  if (v14) {
    nitro::nitro_function::nitro_function(v14);
  }
  if (v59 < 0) {
    operator delete(v57);
  }
  if (v61) {
    nitro::nitro_function::nitro_function(v61);
  }
  uint64_t v41 = v13;
  [(ETTaskDefinition *)self trainingGraphNetPtr];
  uint64_t v15 = v60;
  std::string::basic_string[abi:ne180100]<0>(&v57, "training");
  v76 = &v57;
  char v16 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)(v15 + 472), &v57, (uint64_t)&std::piecewise_construct, (_OWORD **)&v76);
  MEMORY[0x192FF0F50]((char *)v16 + 56, "1");
  if (v59 < 0) {
    operator delete(v57);
  }
  if (v61) {
    nitro::nitro_function::nitro_function(v61);
  }
  [(ETTaskDefinition *)self inferenceGraphNetPtr];
  BOOL v17 = v57;
  if (v58) {
    nitro::nitro_function::nitro_function(v58);
  }
  char v18 = (uint64_t *)v17[4];
  char v42 = (uint64_t *)v17[5];
  if (v18 != v42)
  {
    while (1)
    {
      uint64_t v20 = *v18;
      uint64_t v19 = (std::__shared_weak_count *)v18[1];
      if (v19) {
        atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [(ETTaskDefinition *)self trainingGraphNetPtr];
      int v21 = v57;
      if (v58) {
        nitro::nitro_function::nitro_function(v58);
      }
      uint64_t v22 = (uint64_t *)v21[4];
      uint64_t v23 = (uint64_t *)v21[5];
      if (v22 != v23) {
        break;
      }
LABEL_62:
      if (v19) {
        nitro::nitro_function::nitro_function(v19);
      }
      v18 += 2;
      if (v18 == v42) {
        goto LABEL_65;
      }
    }
    while (1)
    {
      uint64_t v24 = *v22;
      uint64_t v25 = (std::__shared_weak_count *)v22[1];
      if (v25) {
        atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v26 = *(unsigned __int8 *)(v20 + 39);
      if ((v26 & 0x80u) == 0) {
        uint64_t v27 = *(unsigned __int8 *)(v20 + 39);
      }
      else {
        uint64_t v27 = *(void *)(v20 + 24);
      }
      uint64_t v28 = *(unsigned __int8 *)(v24 + 39);
      int v29 = (char)v28;
      if ((v28 & 0x80u) != 0) {
        uint64_t v28 = *(void *)(v24 + 24);
      }
      if (v27 != v28) {
        goto LABEL_59;
      }
      BOOL v30 = v29 >= 0 ? (unsigned __int8 *)(v24 + 16) : *(unsigned __int8 **)(v24 + 16);
      if ((v26 & 0x80) == 0) {
        break;
      }
      if (!memcmp(*(const void **)(v20 + 16), v30, *(void *)(v20 + 24))) {
        goto LABEL_58;
      }
LABEL_59:
      if (v25) {
        nitro::nitro_function::nitro_function(v25);
      }
      v22 += 2;
      if (v22 == v23) {
        goto LABEL_62;
      }
    }
    if (*(unsigned char *)(v20 + 39))
    {
      std::string::size_type v31 = (unsigned __int8 *)(v20 + 16);
      while (*v31 == *v30)
      {
        ++v31;
        ++v30;
        if (!--v26) {
          goto LABEL_58;
        }
      }
      goto LABEL_59;
    }
LABEL_58:
    (*(void (**)(uint64_t, unsigned __int8 *))(*(void *)v24 + 24))(v24, v30);
    goto LABEL_59;
  }
LABEL_65:
  [(ETTaskDefinition *)self inferenceGraphNetPtr];
  id v32 = v8;
  std::string::basic_string[abi:ne180100]<0>(&v54, (char *)[v32 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(v52, "");
  std::string::basic_string[abi:ne180100]<0>(v50, "");
  Espresso::dump_network(&v55, &v54, (uint64_t)v52, (uint64_t)v50);
  if (v51 < 0) {
    operator delete(v50[0]);
  }
  if (v53 < 0) {
    operator delete(v52[0]);
  }
  if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v54.__r_.__value_.__l.__data_);
  }
  if (v56) {
    nitro::nitro_function::nitro_function(v56);
  }
  std::string::size_type v33 = [v32 stringByReplacingOccurrencesOfString:@".espresso.net" withString:@"_updatable.espresso.net"];
  [(ETTaskDefinition *)self trainingGraphNetPtr];
  id v34 = v33;
  std::string::basic_string[abi:ne180100]<0>(&v47, (char *)[v34 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(v45, "");
  std::string::basic_string[abi:ne180100]<0>(v43, "");
  Espresso::dump_network(&v48, &v47, (uint64_t)v45, (uint64_t)v43);
  if (v44 < 0) {
    operator delete(v43[0]);
  }
  if (v46 < 0) {
    operator delete(v45[0]);
  }
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v47.__r_.__value_.__l.__data_);
  }
  if (v49) {
    nitro::nitro_function::nitro_function(v49);
  }
  int v35 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v36 = [v35 fileExistsAtPath:v32];

  if (v36)
  {
    BOOL v37 = [MEMORY[0x1E4F28CB8] defaultManager];
    LOBYTE(v36) = [v37 fileExistsAtPath:v34];
  }
  [(ETTaskDefinition *)self shareWeights];

  if (v41) {
    nitro::nitro_function::nitro_function(v41);
  }
  uint64_t v57 = &v64;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v57);
LABEL_89:

  return v36;
}

- (void)saveNetwork:inplace:error:
{
}

- (uint64_t)saveNetwork:inplace:error:
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EE3797D8;
  a2[1] = v2;
  return result;
}

- (std::string)saveNetwork:inplace:error:
{
  uint64_t v2 = *(void *)(a1 + 8);
  v3 = *(std::string **)(v2 + 8);
  if ((unint64_t)v3 >= *(void *)(v2 + 16))
  {
    shared_ptr<Espresso::net> result = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)v2, (uint64_t)a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(v2, a2);
    shared_ptr<Espresso::net> result = v3 + 1;
  }
  *(void *)(v2 + 8) = result;
  return result;
}

- (BOOL)doTrainingOnData:(id)a3 forNumberOfEpochs:(unint64_t)a4 withCallback:(id)a5 error:(id *)a6
{
  id v10 = 0;
  BOOL v7 = [(ETTaskDefinition *)self privateDoTrainingOnData:a3 forNumberOfEpochs:a4 withCallback:a5 error:&v10];
  id v8 = v10;
  if (a6 && v10)
  {
    *a6 = v10;
    id v8 = v10;
  }

  return v7;
}

- (BOOL)privateDoTrainingOnData:(id)a3 forNumberOfEpochs:(unint64_t)a4 withCallback:(id)a5 error:(id *)a6
{
  void (***v21)(uint64_t *__return_ptr, void);
  void *j;
  float *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  const void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t (**v35)(void, void, void, void);
  char v36;
  void *v37;
  void *v38;
  void *v40;
  uint64_t (**v41)(void, void, void, void);
  char v42;
  char v43;
  void *v44;
  void *v46;
  std::__shared_weak_count *v47;
  BOOL v48;
  void *context;
  uint64_t v51;
  id v52;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_training_control_name;
  id v54;
  uint64_t v55;
  id *v56;
  unint64_t v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  uint64_t v60;
  std::__shared_weak_count *v61;
  void v62[6];
  void *v63[5];
  id v64;
  void *__p;
  std::__shared_weak_count *v66;
  void *v67;
  long long v68;
  long long v69;
  int v70;
  uint64_t v71;
  std::__shared_weak_count *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  uint64_t (*v75)(uint64_t);
  long long v76;
  long long v77;
  uint64_t v78;
  int i;
  uint64_t v80;
  std::__shared_weak_count *v81;
  uint64_t v82;
  std::__shared_weak_count *v83;
  uint64_t v84;
  std::__shared_weak_count *v85;
  uint64_t v86;

  uint64_t v86 = *MEMORY[0x1E4F143B8];
  v52 = a3;
  std::string v54 = a5;
  char v46 = (void *)MEMORY[0x192FF2020]();
  [(ETTaskDefinition *)self trainingGraphNetPtr];
  p_training_control_name = &self->training_control_name;
  Espresso::net::get_global(&v84, v71, (unsigned __int8 *)&self->training_control_name);
  Espresso::fill_bc(&v84, 1.0);
  if (v85) {
    nitro::nitro_function::nitro_function(v85);
  }
  if (v72) {
    nitro::nitro_function::nitro_function(v72);
  }
  if (self->runtimePlatform == 4)
  {
    [(ETTaskDefinition *)self trainingGraphNetPtr];
    Espresso::net::get_global(&v82, v71, (unsigned __int8 *)&self->training_control_name.__r_.var0);
    Espresso::fill_bc(&v82, 1.0);
    if (v83) {
      nitro::nitro_function::nitro_function(v83);
    }
    if (v72) {
      nitro::nitro_function::nitro_function(v72);
    }
    [(ETTaskDefinition *)self trainingGraphNetPtr];
    Espresso::net::get_global(&v80, v71, (unsigned __int8 *)&self->gradient_control_name.__r_.__value_.var0.__s.__data_[8]);
    Espresso::fill_bc(&v80, 1.0);
    if (v81) {
      nitro::nitro_function::nitro_function(v81);
    }
    if (v72) {
      nitro::nitro_function::nitro_function(v72);
    }
  }
  uint64_t v56 = a6;
  BOOL v9 = (char *)std::allocate_shared[abi:ne180100]<Espresso::espresso_training_data_source,std::allocator<Espresso::espresso_training_data_source>,objc_object  {objcproto14ETDataProvider}* {__strong}&,void>(&v71, v52);
  uint64_t v55 = v71;
  std::string v47 = v72;
  unint64_t value = self->infOutputBlobShapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  v71 = 0;
  uint64_t v72 = (std::__shared_weak_count *)&v71;
  uint64_t v73 = 0x5812000000;
  uint64_t v74 = __Block_byref_object_copy__818;
  v76 = 0u;
  v77 = 0u;
  uint64_t v75 = __Block_byref_object_dispose__819;
  uint64_t v78 = 0;
  for (i = 1065353216; value; unint64_t value = *(void *)value)
  {
    std::allocate_shared[abi:ne180100]<Espresso::blob<float,4>,std::allocator<Espresso::blob<float,4>>,int &,int &,int &,int &,void>(&v68, *(_DWORD *)(value + 40), *(_DWORD *)(value + 44), *(_DWORD *)(value + 48), *(_DWORD *)(value + 56) * *(_DWORD *)(value + 52));
    std::string __p = (void *)(value + 16);
    BOOL v9 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v72[2], (unsigned __int8 *)(value + 16), (long long **)&__p);
    uint64_t v11 = (std::__shared_weak_count *)*((void *)v9 + 6);
    *(_OWORD *)(v9 + 40) = v68;
    if (v11) {
      nitro::nitro_function::nitro_function(v11);
    }
  }
  if (a4)
  {
    uint64_t v48 = 0;
    char v51 = 0;
    while (1)
    {
      context = (void *)MEMORY[0x192FF2020](v9);
      if (objc_opt_respondsToSelector()) {
        [v52 prepareForEpoch];
      }
      uint64_t v12 = [v52 numberOfDataPoints];
      unint64_t batchSize = self->batchSize;
      uint64_t v57 = (v12 - 1) / batchSize;
      id v14 = [[_ETBufferDataSource alloc] initWithBlobShapes:&self->trainInputBlobShapes.__table_.__p3_ numberOfDataPoints:(v57 + 1) * batchSize batchSize:batchSize error:0];
      if (v57 == -1)
      {
LABEL_53:
        uint64_t v40 = [v54 objectForKeyedSubscript:@"Epoch"];
        if (!v40
          || ([v54 objectForKeyedSubscript:@"Epoch"],
              uint64_t v41 = (uint64_t (**)(void, void, void, void))objc_claimAutoreleasedReturnValue(),
              char v42 = ((uint64_t (**)(void, uint64_t, _ETBufferDataSource *, ETTaskDefinition *))v41)[2](v41, v51, v14, self), v41, v40, (v42 & 1) != 0))
        {
          [(ETTaskDefinition *)self trainingGraphNetPtr];
          Espresso::net::get_global(&v58, v68, (unsigned __int8 *)p_training_control_name);
          Espresso::fill_bc(&v58, 1.0);
          if (v59) {
            nitro::nitro_function::nitro_function(v59);
          }
          if (*((void *)&v68 + 1)) {
            nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v68 + 1));
          }
          uint64_t v43 = 1;
          goto LABEL_61;
        }
      }
      else
      {
        uint64_t v15 = 0;
        while (1)
        {
          char v16 = (void *)MEMORY[0x192FF2020]();
          char v68 = 0u;
          v69 = 0u;
          char v70 = 1065353216;
          (*(void (**)(void **__return_ptr))(*(void *)v55 + 8))(&__p);
          std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>>>::__move_assign((uint64_t)&v68, (uint64_t *)&__p);
          std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node(v67);
          BOOL v17 = __p;
          std::string __p = 0;
          if (v17) {
            operator delete(v17);
          }
          uint64_t v64 = 0;
          [(ETTaskDefinition *)self checkShapes:&self->trainOutputNames withSample:&v68 withError:&v64];
          id v18 = v64;
          id v19 = v64;
          if (v19)
          {
            if (v56) {
              objc_storeStrong(v56, v18);
            }
            int v20 = 1;
          }
          else
          {
            [(ETTaskDefinition *)self trainingGraphNetPtr];
            int v21 = (void (***)(uint64_t *__return_ptr, void))*((void *)__p + 2);
            v62[0] = MEMORY[0x1E4F143A8];
            v62[1] = 3321888768;
            v62[2] = __81__ETTaskDefinition_privateDoTrainingOnData_forNumberOfEpochs_withCallback_error___block_invoke;
            v62[3] = &unk_1EE38F210;
            std::unordered_map<std::string,std::shared_ptr<Espresso::blob<float,4>>>::unordered_map((uint64_t)v63, (uint64_t)&v68);
            v62[4] = self;
            v62[5] = &v71;
            Espresso::abstract_context::compute_batch_sync(v21, v62);
            if (v66) {
              nitro::nitro_function::nitro_function(v66);
            }
            for (j = (void *)v72[2].__shared_weak_owners_; j; j = (void *)*j)
            {
              uint64_t v23 = [(_ETBufferDataSource *)v14 dataAtIndex:self->batchSize * v15 key:j + 2];
              uint64_t v24 = 0;
              uint64_t v25 = j[5];
              uint64_t v26 = *(_DWORD *)(v25 + 8);
              uint64_t v27 = v25 + 12;
              do
              {
                v26 *= *(_DWORD *)(v27 + v24);
                v24 += 4;
              }
              while (v24 != 12);
              uint64_t v28 = (char *)operator new(0x60uLL);
              int v29 = 0;
              *((void *)v28 + 1) = 0;
              *((void *)v28 + 2) = 0;
              *(void *)uint64_t v28 = &unk_1EE3899C8;
              *((void *)v28 + 3) = &unk_1EE36BF10;
              *((_OWORD *)v28 + 4) = 0u;
              *((_OWORD *)v28 + 5) = 0u;
              *((_DWORD *)v28 + 8) = v26;
              *(void *)(v28 + 36) = 0x100000001;
              *((_DWORD *)v28 + 11) = 1;
              *((void *)v28 + 6) = v23;
              v28[56] = 0;
              BOOL v30 = j[5];
              std::string::size_type v31 = *(const void **)(v30 + 24);
              id v32 = *(int *)(v30 + 8);
              std::string::size_type v33 = v30 + 12;
              do
              {
                v32 *= *(int *)(v33 + v29);
                v29 += 4;
              }
              while (v29 != 12);
              memcpy(v23, v31, 4 * v32);
              nitro::nitro_function::nitro_function((std::__shared_weak_count *)v28);
            }
            id v34 = [v54 objectForKeyedSubscript:@"Batch"];
            if (v34
              && ([v54 objectForKeyedSubscript:@"Batch"],
                  int v35 = (uint64_t (**)(void, void, void, void))objc_claimAutoreleasedReturnValue(),
                  int v36 = ((uint64_t (**)(void, uint64_t, _ETBufferDataSource *, ETTaskDefinition *))v35)[2](v35, v15, v14, self), v35, v34, (v36 & 1) == 0))
            {
              int v20 = 1;
            }
            else
            {
              [(ETTaskDefinition *)self trainingGraphNetPtr];
              Espresso::net::get_global(&v60, (uint64_t)__p, (unsigned __int8 *)p_training_control_name);
              Espresso::fill_bc(&v60, 1.0);
              if (v61) {
                nitro::nitro_function::nitro_function(v61);
              }
              if (v66) {
                nitro::nitro_function::nitro_function(v66);
              }
              int v20 = 0;
            }
            std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node((void *)v63[2]);
            BOOL v37 = v63[0];
            v63[0] = 0;
            if (v37) {
              operator delete(v37);
            }
          }

          std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node((void *)v69);
          id v38 = (void *)v68;
          *(void *)&char v68 = 0;
          if (v38) {
            operator delete(v38);
          }
          if (v20) {
            break;
          }
          if (v15++ == v57) {
            goto LABEL_53;
          }
        }
      }
      uint64_t v43 = 0;
LABEL_61:

      if (v43)
      {
        uint64_t v48 = ++v51 >= a4;
        if (v51 != a4) {
          continue;
        }
      }
      goto LABEL_65;
    }
  }
  uint64_t v48 = 1;
LABEL_65:
  _Block_object_dispose(&v71, 8);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node(*((void **)&v77 + 1));
  char v44 = (void *)*((void *)&v76 + 1);
  *((void *)&v76 + 1) = 0;
  if (v44) {
    operator delete(v44);
  }
  if (v47) {
    nitro::nitro_function::nitro_function(v47);
  }

  return v48;
}

void __81__ETTaskDefinition_privateDoTrainingOnData_forNumberOfEpochs_withCallback_error___block_invoke(void *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  for (i = (void *)a1[8]; i; i = (void *)*i)
  {
    v5 = (void *)a1[4];
    if (v5)
    {
      [v5 trainingGraphNetPtr];
      BOOL v6 = __p;
    }
    else
    {
      BOOL v6 = 0;
      std::string __p = 0;
      uint64_t v25 = 0;
    }
    BOOL v7 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::find<std::string>((uint64_t)v6 + 232, i + 2);
    id v8 = (void *)a1[4];
    if (v8)
    {
      [v8 trainingGraphNetPtr];
      uint64_t v9 = (uint64_t)(v31 + 30);
      if (v32) {
        nitro::nitro_function::nitro_function(v32);
      }
    }
    else
    {
      uint64_t v9 = 240;
    }
    if (v25) {
      nitro::nitro_function::nitro_function(v25);
    }
    if ((void *)v9 != v7)
    {
      Espresso::blob<float,4>::copy(&__p, i[5]);
      id v10 = (void *)a1[4];
      if (v10)
      {
        [v10 trainingGraphNetPtr];
        uint64_t v11 = v31;
      }
      else
      {
        uint64_t v11 = 0;
        std::string::size_type v31 = 0;
        id v32 = 0;
      }
      p_p = (void **)(i + 2);
      uint64_t v12 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)(v11 + 17), (unsigned __int8 *)i + 16, (long long **)&p_p);
      (*(void (**)(void, void *, void **))(**((void **)v12 + 5) + 48))(*((void *)v12 + 5), a2, &__p);
      if (v32) {
        nitro::nitro_function::nitro_function(v32);
      }
      if (v25) {
        nitro::nitro_function::nitro_function(v25);
      }
    }
  }
  BOOL v13 = (void *)a1[4];
  if (v13)
  {
    [v13 trainingGraphNetPtr];
    BOOL v13 = __p;
  }
  else
  {
    std::string __p = 0;
    uint64_t v25 = 0;
  }
  Espresso::net::__forward((uint64_t)v13, a2, 0, 0xFFFFFFFFLL);
  if (v25) {
    nitro::nitro_function::nitro_function(v25);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = *(id *)(a1[4] + 176);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v14);
        }
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[*(id *)(*((void *)&v27 + 1) + 8 * j) UTF8String]);
        id v18 = (void *)a1[4];
        if (v18)
        {
          [v18 trainingGraphNetPtr];
          id v19 = v31;
        }
        else
        {
          id v19 = 0;
          std::string::size_type v31 = 0;
          id v32 = 0;
        }
        p_p = &__p;
        int v20 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)(v19 + 17), (unsigned __int8 *)&__p, (long long **)&p_p);
        if (v32) {
          nitro::nitro_function::nitro_function(v32);
        }
        uint64_t v21 = *((void *)v20 + 5);
        uint64_t v22 = *(void *)(a1[5] + 8) + 48;
        std::string::size_type v31 = &__p;
        uint64_t v23 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v22, (unsigned __int8 *)&__p, (long long **)&v31);
        (*(void (**)(uint64_t, void *, char *))(*(void *)v21 + 40))(v21, a2, v23 + 40);
        if (v26 < 0) {
          operator delete(__p);
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v15);
  }
}

- (id)doInferenceOnData:(id)a3 error:(id *)a4
{
  void (***v18)(uint64_t *__return_ptr, void);
  char *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  int v23;
  uint64_t j;
  char *v25;
  float *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  size_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  _ETBufferDataSource *v39;
  void *v40;
  void *v41;
  void *v42;
  id *v44;
  std::__shared_weak_count *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  long long v51;
  long long v52;
  long long v53;
  long long v54;
  void v55[6];
  void *v56[5];
  id v57;
  void *__p;
  std::__shared_weak_count *v59;
  void *v60;
  void *v61[2];
  long long v62;
  int v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  uint64_t (*v68)(uint64_t);
  long long v69;
  long long v70;
  uint64_t v71;
  int v72;
  void v73[2];
  uint64_t v74;
  std::__shared_weak_count *v75;
  void **p_p;
  unsigned char v77[144];
  uint64_t v78;
  uint64_t vars8;

  uint64_t v78 = *MEMORY[0x1E4F143B8];
  char v46 = a3;
  [(ETTaskDefinition *)self trainingGraphNetPtr];
  Espresso::net::get_global(&v74, v64, (unsigned __int8 *)&self->training_control_name);
  if (v65) {
    nitro::nitro_function::nitro_function(v65);
  }
  BOOL v6 = v75;
  v73[0] = v74;
  v73[1] = v75;
  if (v75) {
    atomic_fetch_add_explicit(&v75->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  Espresso::fill_bc(v73, 0.0);
  if (v6) {
    nitro::nitro_function::nitro_function(v6);
  }
  BOOL v7 = -[_ETBufferDataSource initWithBlobShapes:numberOfDataPoints:batchSize:error:]([_ETBufferDataSource alloc], "initWithBlobShapes:numberOfDataPoints:batchSize:error:", &self->infInputBlobShapes.__table_.__p3_, [v46 numberOfDataPoints], self->batchSize, 0);
  if (v7)
  {
    char v44 = a4;
    std::allocate_shared[abi:ne180100]<Espresso::espresso_training_data_source,std::allocator<Espresso::espresso_training_data_source>,objc_object  {objcproto14ETDataProvider}* {__strong}&,void>(&v64, v46);
    uint64_t v48 = v64;
    std::string v45 = v65;
    uint64_t v8 = [v46 numberOfDataPoints];
    unint64_t batchSize = self->batchSize;
    unint64_t v10 = [v46 numberOfDataPoints];
    unint64_t v11 = self->batchSize;
    uint64_t v64 = 0;
    v65 = (std::__shared_weak_count *)&v64;
    uint64_t v66 = 0x5812000000;
    long long v67 = __Block_byref_object_copy__818;
    v69 = 0u;
    char v70 = 0u;
    char v68 = __Block_byref_object_dispose__819;
    v71 = 0;
    uint64_t v72 = 1065353216;
    for (unint64_t i = self->trainInputBlobShapes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_; i; unint64_t i = *(void *)i)
    {
      std::allocate_shared[abi:ne180100]<Espresso::blob<float,4>,std::allocator<Espresso::blob<float,4>>,int &,int &,int &,int &,void>(v61, *(_DWORD *)(i + 40), *(_DWORD *)(i + 44), *(_DWORD *)(i + 48), *(_DWORD *)(i + 56) * *(_DWORD *)(i + 52));
      std::string __p = (void *)(i + 16);
      BOOL v13 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v65[2], (unsigned __int8 *)(i + 16), (long long **)&__p);
      id v14 = (std::__shared_weak_count *)*((void *)v13 + 6);
      *(_OWORD *)(v13 + 40) = *(_OWORD *)v61;
      if (v14) {
        nitro::nitro_function::nitro_function(v14);
      }
    }
    v49 = (v8 - 1) / batchSize;
    if (v49 == -1)
    {
LABEL_51:
      v39 = v7;
    }
    else
    {
      uint64_t v15 = 0;
      std::string v47 = (v10 % v11);
      std::string v50 = (uint64_t)((v10 % v11) << 32) >> 30;
      while (1)
      {
        *(_OWORD *)std::string v61 = 0u;
        uint64_t v62 = 0u;
        uint64_t v63 = 1065353216;
        (*(void (**)(void **__return_ptr))(*(void *)v48 + 8))(&__p);
        std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>>>::__move_assign((uint64_t)v61, (uint64_t *)&__p);
        std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node(v60);
        uint64_t v16 = __p;
        std::string __p = 0;
        if (v16) {
          operator delete(v16);
        }
        uint64_t v57 = 0;
        [(ETTaskDefinition *)self checkShapes:&self->optimizer_control_name.__r_.var0 withSample:v61 withError:&v57];
        id v17 = v57;
        if (v17) {
          break;
        }
        [(ETTaskDefinition *)self trainingGraphNetPtr];
        id v18 = (void (***)(uint64_t *__return_ptr, void))*((void *)__p + 2);
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3321888768;
        v55[2] = __44__ETTaskDefinition_doInferenceOnData_error___block_invoke;
        v55[3] = &unk_1EE38F210;
        std::unordered_map<std::string,std::shared_ptr<Espresso::blob<float,4>>>::unordered_map((uint64_t)v56, (uint64_t)v61);
        v55[4] = self;
        v55[5] = &v64;
        Espresso::abstract_context::compute_batch_sync(v18, v55);
        if (v59) {
          nitro::nitro_function::nitro_function(v59);
        }
        char v51 = 0u;
        v52 = 0u;
        char v53 = 0u;
        std::string v54 = 0u;
        id v19 = self->optimizer_control_name.__r_.__value_.var0.__l.__data_;
        int v20 = [v19 countByEnumeratingWithState:&v51 objects:v77 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v52;
          uint64_t v22 = v15 != v49 || v47 == 0;
          uint64_t v23 = !v22;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v52 != v21) {
                objc_enumerationMutation(v19);
              }
              std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[*(id *)(*((void *)&v51 + 1) + 8 * j) UTF8String]);
              p_p = &__p;
              uint64_t v25 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v65[2], (unsigned __int8 *)&__p, (long long **)&p_p);
              char v26 = [(_ETBufferDataSource *)v7 dataAtIndex:self->batchSize * v15 key:&__p];
              long long v27 = *((void *)v25 + 5);
              if (v23)
              {
                long long v28 = 0;
                long long v29 = *(int *)(v27 + 8);
                long long v30 = v29;
                do
                {
                  v30 *= *(int *)(v27 + 12 + v28);
                  v28 += 4;
                }
                while (v28 != 12);
                if (v30 == 1)
                {
                  std::__shared_weak_count *v26 = **(float **)(v27 + 24);
                  goto LABEL_41;
                }
                for (k = 0; k != 12; k += 4)
                  v29 *= *(int *)(v27 + 12 + k);
                id v32 = *(const void **)(v27 + 24);
                uint64_t v35 = v50 * (v29 / self->batchSize);
              }
              else
              {
                std::string::size_type v31 = 0;
                id v32 = *(const void **)(v27 + 24);
                std::string::size_type v33 = *(int *)(v27 + 8);
                id v34 = v27 + 12;
                do
                {
                  v33 *= *(int *)(v34 + v31);
                  v31 += 4;
                }
                while (v31 != 12);
                uint64_t v35 = 4 * v33;
              }
              memcpy(v26, v32, v35);
LABEL_41:
              if (SHIBYTE(v60) < 0) {
                operator delete(__p);
              }
            }
            int v20 = [v19 countByEnumeratingWithState:&v51 objects:v77 count:16];
          }
          while (v20);
        }

        std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node((void *)v56[2]);
        BOOL v37 = v56[0];
        v56[0] = 0;
        if (v37) {
          operator delete(v37);
        }
        std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node((void *)v62);
        id v38 = v61[0];
        v61[0] = 0;
        if (v38) {
          operator delete(v38);
        }
        uint64_t v22 = v15++ == v49;
        if (v22) {
          goto LABEL_51;
        }
      }
      uint64_t v40 = v17;
      if (v44) {
        void *v44 = v17;
      }

      std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node((void *)v62);
      uint64_t v41 = v61[0];
      v61[0] = 0;
      if (v41) {
        operator delete(v41);
      }
      v39 = 0;
    }
    _Block_object_dispose(&v64, 8);
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node(*((void **)&v70 + 1));
    char v42 = (void *)*((void *)&v69 + 1);
    *((void *)&v69 + 1) = 0;
    if (v42) {
      operator delete(v42);
    }
    if (v45) {
      nitro::nitro_function::nitro_function(v45);
    }
  }
  else
  {
    v39 = 0;
  }

  if (v75) {
    nitro::nitro_function::nitro_function(v75);
  }

  return v39;
}

void __44__ETTaskDefinition_doInferenceOnData_error___block_invoke(void *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  for (unint64_t i = (void *)a1[8]; i; unint64_t i = (void *)*i)
  {
    v5 = (void *)a1[4];
    if (v5)
    {
      [v5 trainingGraphNetPtr];
      BOOL v6 = __p;
    }
    else
    {
      BOOL v6 = 0;
      std::string __p = 0;
      uint64_t v25 = 0;
    }
    BOOL v7 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::find<std::string>((uint64_t)v6 + 232, i + 2);
    uint64_t v8 = (void *)a1[4];
    if (v8)
    {
      [v8 trainingGraphNetPtr];
      uint64_t v9 = (uint64_t)(v31 + 30);
      if (v32) {
        nitro::nitro_function::nitro_function(v32);
      }
    }
    else
    {
      uint64_t v9 = 240;
    }
    if (v25) {
      nitro::nitro_function::nitro_function(v25);
    }
    if ((void *)v9 != v7)
    {
      Espresso::blob<float,4>::copy(&__p, i[5]);
      unint64_t v10 = (void *)a1[4];
      if (v10)
      {
        [v10 trainingGraphNetPtr];
        unint64_t v11 = v31;
      }
      else
      {
        unint64_t v11 = 0;
        std::string::size_type v31 = 0;
        id v32 = 0;
      }
      p_p = (void **)(i + 2);
      uint64_t v12 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)(v11 + 17), (unsigned __int8 *)i + 16, (long long **)&p_p);
      (*(void (**)(void, void *, void **))(**((void **)v12 + 5) + 48))(*((void *)v12 + 5), a2, &__p);
      if (v32) {
        nitro::nitro_function::nitro_function(v32);
      }
      if (v25) {
        nitro::nitro_function::nitro_function(v25);
      }
    }
  }
  BOOL v13 = (void *)a1[4];
  if (v13)
  {
    [v13 trainingGraphNetPtr];
    BOOL v13 = __p;
  }
  else
  {
    std::string __p = 0;
    uint64_t v25 = 0;
  }
  Espresso::net::__forward((uint64_t)v13, a2, 0, 0xFFFFFFFFLL);
  if (v25) {
    nitro::nitro_function::nitro_function(v25);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = *(id *)(a1[4] + 160);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v14);
        }
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[*(id *)(*((void *)&v27 + 1) + 8 * j) UTF8String]);
        id v18 = (void *)a1[4];
        if (v18)
        {
          [v18 trainingGraphNetPtr];
          id v19 = v31;
        }
        else
        {
          id v19 = 0;
          std::string::size_type v31 = 0;
          id v32 = 0;
        }
        p_p = &__p;
        int v20 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)(v19 + 17), (unsigned __int8 *)&__p, (long long **)&p_p);
        if (v32) {
          nitro::nitro_function::nitro_function(v32);
        }
        uint64_t v21 = *((void *)v20 + 5);
        uint64_t v22 = *(void *)(a1[5] + 8) + 48;
        std::string::size_type v31 = &__p;
        uint64_t v23 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v22, (unsigned __int8 *)&__p, (long long **)&v31);
        (*(void (**)(uint64_t, void *, char *))(*(void *)v21 + 40))(v21, a2, v23 + 40);
        if (v26 < 0) {
          operator delete(__p);
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v15);
  }
}

- (id)namesVectorToFoundationArray:()vector<std:(std::allocator<std::string>> *)a3 :string
{
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0xAAAAAAAAAAAAAAABLL * (((char *)a3->__end_ - (char *)a3->__begin_) >> 3)];
  if (a3->__end_ != a3->__begin_)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      BOOL v7 = objc_msgSend(NSString, "stringWithUTF8String:");
      [v4 addObject:v7];

      ++v6;
      v5 += 24;
    }
    while (0xAAAAAAAAAAAAAAABLL * (((char *)a3->__end_ - (char *)a3->__begin_) >> 3) > v6);
  }

  return v4;
}

- (ETTaskDefinition)initWithTrainingModelDefinition:(id)a3 forPlatform:(unint64_t)a4 error:(id *)a5
{
  void (***v57)(uint64_t *__return_ptr, void);
  void *v59;
  void v60[5];
  std::__shared_weak_count *v61;
  uint64_t v62[2];
  void *v63;
  std::__shared_weak_count *v64;
  char v65;
  void *__p;
  std::__shared_weak_count *v67;
  char v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  std::__shared_weak_count *v73;
  uint64_t v74;
  std::__shared_weak_count *v75;
  objc_super v76;
  id v77;
  std::__shared_weak_count *v78;
  uint64_t v79;
  __CFString *v80;
  uint64_t v81;
  __CFString *v82;
  long long *v83[3];

  v83[1] = *(long long **)MEMORY[0x1E4F143B8];
  id v8 = a3;
  v76.receiver = self;
  v76.super_class = (Class)ETTaskDefinition;
  uint64_t v9 = [(ETTaskDefinition *)&v76 init];
  unint64_t v10 = v9;
  if (!v9)
  {
LABEL_5:
    BOOL v13 = 0;
    goto LABEL_78;
  }
  [(ETTaskDefinition *)v9 setInferenceModel:v8];
  if (v10->runtimePlatform == 4)
  {
    if (a5)
    {
      unint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v81 = *MEMORY[0x1E4F28568];
      long long v82 = @"MultiGPU not supported yet";
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      *a5 = [v11 errorWithDomain:@"EspressoError" code:1 userInfo:v12];
    }
    goto LABEL_5;
  }
  v10->runtimePlatform = a4;
  [(ETTaskDefinition *)v10 context_for_runtime_platform:a5];
  if (!v74) {
    goto LABEL_20;
  }
  (*(void (**)(uint64_t))(*(void *)v74 + 96))(v74);
  v10->precision = 0;
  id v14 = [v8 modelURL];
  id v15 = [v14 path];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v15 UTF8String]);
  Espresso::load_network((uint64_t)&__p, &v74, v10->precision, 0, &v72);
  [(ETTaskDefinition *)v10 setTrainingGraphNetPtr:&v72];
  if (v73) {
    nitro::nitro_function::nitro_function(v73);
  }
  if (v68 < 0) {
    operator delete(__p);
  }

  [(ETTaskDefinition *)v10 trainingGraphNetPtr];
  uint64_t v16 = __p;
  if (v67) {
    nitro::nitro_function::nitro_function(v67);
  }
  if (!v16)
  {
    if (a5)
    {
      long long v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v79 = *MEMORY[0x1E4F28568];
      v80 = @"No network made from call to load_network";
      char v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
      id v27 = [v28 errorWithDomain:@"EspressoError" code:1 userInfo:v26];
      goto LABEL_19;
    }
LABEL_20:
    BOOL v13 = 0;
    goto LABEL_76;
  }
  uint64_t v17 = [v8 inputs];
  var0 = (void *)v10->gradient_control_name.var0;
  v10->gradient_control_name.var0 = v17;

  uint64_t v19 = [v8 outputs];
  data = v10->optimizer_control_name.__r_.__value_.var0.__l.__data_;
  v10->optimizer_control_name.__r_.__value_.var0.__l.__data_ = (char *)v19;

  uint64_t v21 = [v8 trainingInputs];
  int64_t size = (void *)v10->optimizer_control_name.__r_.__value_.var0.__l.__size_;
  v10->optimizer_control_name.__r_.__value_.var0.__l.__size_ = v21;

  uint64_t v23 = [v8 trainingOutputs];
  uint64_t v24 = (void *)*((void *)&v10->optimizer_control_name.__r_.__value_.var0.__l + 2);
  *((void *)&v10->optimizer_control_name.__r_.__value_.var0.__l + 2) = v23;

  v71 = 0;
  [(ETTaskDefinition *)v10 setupInputOutputShapes:&v71];
  id v25 = v71;
  if (!v25)
  {
    [(ETTaskDefinition *)v10 trainingGraphNetPtr];
    id v29 = v77;
    long long v30 = [v8 inputs];
    id v31 = [v30 objectAtIndexedSubscript:0];
    std::string::basic_string[abi:ne180100]<0>(&v63, (char *)[v31 UTF8String]);
    v83[0] = (long long *)&v63;
    id v32 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v29 + 136, (unsigned __int8 *)&v63, v83);
    Espresso::abstract_blob_container::shape((char *)&__p, v32[5]);
    v10->unint64_t batchSize = SHIDWORD(v67);
    if (v69)
    {
      char v70 = v69;
      operator delete(v69);
    }
    if (v65 < 0) {
      operator delete(v63);
    }

    if (v78) {
      nitro::nitro_function::nitro_function(v78);
    }
    id v33 = [v8 isTrainingGlobalName];
    MEMORY[0x192FF0F50](&v10->training_control_name, [v33 UTF8String]);

    p_training_control_name = &v10->training_control_name;
    if (*((char *)&v10->training_control_name.__r_.__value_.var0.__l + 23) < 0) {
      p_training_control_name = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)v10->training_control_name.__r_.__value_.var0.__l.__data_;
    }
    uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"training control variable '%s' not found", p_training_control_name);
    [(ETTaskDefinition *)v10 trainingGraphNetPtr];
    BOOL v36 = find_or_create_error<std::string,std::shared_ptr<Espresso::abstract_blob_container>>((void *)__p + 17, (unsigned __int8 *)&v10->training_control_name, a5, v35);
    if (v67) {
      nitro::nitro_function::nitro_function(v67);
    }

    if (v36)
    {
      id v37 = [v8 initializer];
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v37 UTF8String]);

      p_p = &__p;
      if (v68 < 0) {
        p_p = __p;
      }
      char v59 = objc_msgSend(NSString, "stringWithFormat:", @"Initializer '%s' not found", p_p);
      [(ETTaskDefinition *)v10 trainingGraphNetPtr];
      v39 = (int8x8_t *)v63;
      id v40 = v59;
      unint64_t v41 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&__p);
      int8x8_t v42 = v39[124];
      if (v42)
      {
        unint64_t v43 = v41;
        uint8x8_t v44 = (uint8x8_t)vcnt_s8(v42);
        v44.i16[0] = vaddlv_u8(v44);
        unint64_t v45 = v44.u32[0];
        if (v44.u32[0] > 1uLL)
        {
          unint64_t v46 = v41;
          if (v41 >= *(void *)&v42) {
            unint64_t v46 = v41 % *(void *)&v42;
          }
        }
        else
        {
          unint64_t v46 = (*(void *)&v42 - 1) & v41;
        }
        std::string v47 = *(unsigned __int8 ***)(*(void *)&v39[123] + 8 * v46);
        if (v47)
        {
          for (unint64_t i = *v47; i; unint64_t i = *(unsigned __int8 **)i)
          {
            unint64_t v49 = *((void *)i + 1);
            if (v43 == v49)
            {
              if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, (unsigned __int8 *)&__p))
              {
                LOBYTE(a5) = i != 0;
                goto LABEL_54;
              }
            }
            else
            {
              if (v45 > 1)
              {
                if (v49 >= *(void *)&v42) {
                  v49 %= *(void *)&v42;
                }
              }
              else
              {
                v49 &= *(void *)&v42 - 1;
              }
              if (v49 != v46) {
                break;
              }
            }
          }
        }
      }
      if (a5)
      {
        std::string v50 = (void *)MEMORY[0x1E4F28C58];
        v83[0] = *(long long **)MEMORY[0x1E4F28568];
        v77 = v40;
        char v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:v83 count:1];
        *a5 = [v50 errorWithDomain:@"EspressoError" code:1 userInfo:v51];

        LOBYTE(a5) = 0;
      }
LABEL_54:

      if (v64) {
        nitro::nitro_function::nitro_function(v64);
      }

      if (a5)
      {
        [(ETTaskDefinition *)v10 trainingGraphNetPtr];
        id v52 = v77;
        id v53 = [v8 initializer];
        std::string::basic_string[abi:ne180100]<0>(&v63, (char *)[v53 UTF8String]);
        v83[0] = (long long *)&v63;
        std::string v54 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v52 + 984, (unsigned __int8 *)&v63, v83);
        uint64_t v55 = *((void *)v54 + 5);
        uint64_t v56 = (std::__shared_weak_count *)*((void *)v54 + 6);
        if (v56) {
          atomic_fetch_add_explicit(&v56->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (v65 < 0) {
          operator delete(v63);
        }

        if (v78) {
          nitro::nitro_function::nitro_function(v78);
        }
        v62[0] = 0;
        v62[1] = 0;
        [(ETTaskDefinition *)v10 trainingGraphNetPtr];
        Espresso::net::setup_script(v55, v62, *(unsigned int *)(**((void **)v63 + 4) + 12));
        if (v64) {
          nitro::nitro_function::nitro_function(v64);
        }
        uint64_t v57 = *(void (****)(uint64_t *__return_ptr, void))(v55 + 16);
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3321888768;
        v60[2] = __70__ETTaskDefinition_initWithTrainingModelDefinition_forPlatform_error___block_invoke;
        v60[3] = &__block_descriptor_48_ea8_32c41_ZTSNSt3__110shared_ptrIN8Espresso3netEEE_e10_v16__0r_v8l;
        v60[4] = v55;
        std::string v61 = v56;
        if (v56) {
          atomic_fetch_add_explicit(&v56->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        Espresso::abstract_context::compute_batch_sync(v57, v60);
        BOOL v13 = v10;
        if (v61) {
          nitro::nitro_function::nitro_function(v61);
        }
        if (v56) {
          nitro::nitro_function::nitro_function(v56);
        }
      }
      else
      {
        BOOL v13 = 0;
      }
      if (v68 < 0) {
        operator delete(__p);
      }
      char v26 = 0;
      goto LABEL_75;
    }
    char v26 = 0;
    goto LABEL_38;
  }
  char v26 = v25;
  if (!a5)
  {
LABEL_38:
    BOOL v13 = 0;
    goto LABEL_75;
  }
  id v27 = v25;
  char v26 = v27;
LABEL_19:
  BOOL v13 = 0;
  *a5 = v27;
LABEL_75:

LABEL_76:
  if (v75) {
    nitro::nitro_function::nitro_function(v75);
  }
LABEL_78:

  return v13;
}

void __70__ETTaskDefinition_initWithTrainingModelDefinition_forPlatform_error___block_invoke(uint64_t a1, void *a2)
{
}

- (ETTaskDefinition)initWithModelDefinition:(id)a3 lossDefinition:(id)a4 variablesDefinition:(id)a5 optimizerDefinition:(id)a6 forPlatform:(unint64_t)a7 error:(id *)a8
{
  void (***v63)(uint64_t *__return_ptr, void);
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  BOOL v76;
  unsigned char *v77;
  unsigned char *v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  int v84;
  void *v85;
  uint64_t i;
  id v87;
  int v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint8x8_t v92;
  unint64_t v93;
  void **v94;
  char *v95;
  unint64_t v96;
  float v97;
  BOOL v98;
  unint64_t v99;
  unint64_t v100;
  size_t v101;
  uint64_t v102;
  void *v103;
  unint64_t v104;
  ETTaskDefinition *v105;
  int v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  std::__shared_weak_count *v110;
  uint64_t *v111;
  int v112;
  uint64_t *v113;
  int v114;
  void *v116;
  void *v117;
  uint64_t **j;
  char *v119;
  void *v120;
  unsigned __int8 *v121;
  unsigned __int8 *v122;
  void *v123;
  unsigned __int8 *v124;
  uint64_t v125;
  uint64_t v126;
  int v127;
  unint64_t batchSize;
  char *v129;
  void *v130;
  void *v131;
  unsigned __int8 *v132;
  unsigned __int8 *v133;
  std::__shared_weak_count *v134;
  int precision;
  id v136;
  void *v137;
  void *v138;
  uint64_t *p_inferenceModel;
  uint64_t v140;
  uint64_t v141;
  id v142;
  unsigned __int8 *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  id v150;
  id v151;
  id v152;
  size_t v153;
  std::string *p_sz;
  long long *v155;
  char *v156;
  unint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  long long v161;
  uint64_t v162;
  long long v163;
  uint64_t k;
  uint64_t m;
  void *v166;
  long long v167;
  char *v168;
  void *v169;
  void *v170;
  float v171;
  float v172;
  void *v173;
  void *v174;
  float v175;
  float v176;
  void *v177;
  void *v178;
  float v179;
  float v180;
  void *v181;
  void *v182;
  float v183;
  float v184;
  void *v185;
  void *v186;
  float v187;
  float v188;
  void *v189;
  void *v190;
  float v191;
  float v192;
  void *v193;
  void *v194;
  void *v195;
  std::__shared_weak_count *v196;
  uint64_t p_var0;
  uint64_t p_training_control_name;
  id v200;
  id v201;
  id v203;
  id v205;
  id v206;
  id v207;
  id obj;
  ETTaskDefinition *v209;
  int v210;
  uint64_t v211;
  uint64_t v212;
  std::__shared_weak_count *v213;
  uint64_t v214;
  std::__shared_weak_count *v215;
  std::string::size_type v216[3];
  uint64_t v217;
  std::__shared_weak_count *v218;
  uint64_t v219[3];
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  std::__shared_weak_count *v224;
  uint64_t v225[3];
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  std::__shared_weak_count *v230;
  uint64_t v231[3];
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  std::__shared_weak_count *v236;
  uint64_t v237[3];
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241[2];
  char v242;
  void *v243[2];
  char v244;
  uint64_t v245;
  std::__shared_weak_count *v246;
  std::string __s;
  uint64_t v248;
  unint64_t v249;
  char v250;
  long long v251;
  uint64_t v252;
  char v253;
  uint64_t v254;
  std::string v255;
  int v256;
  uint64_t v257;
  std::string v258;
  _OWORD v259[2];
  uint64_t v260;
  void *v261;
  void *v262;
  uint64_t v263;
  void *v264;
  char v265;
  std::string *v266;
  std::string *v267;
  std::string *v268;
  std::string *v269;
  std::string *v270;
  std::string *v271;
  std::string *v272;
  std::string *v273;
  std::string *v274;
  std::string *v275;
  std::string *v276;
  std::string *v277;
  std::string *v278;
  std::string *v279;
  std::string *v280;
  std::__shared_weak_count *v281;
  std::string *v282;
  std::string *v283;
  std::string *v284;
  std::string *v285;
  void **p_data;
  std::string *v287;
  std::string *v288;
  std::string *v289;
  std::string *v290;
  std::string *v291;
  std::string *v292;
  void *v293;
  unsigned char *v294;
  char *v295;
  std::string v296;
  std::string v297;
  uint64_t v298;
  int v299;
  int v300;
  unint64_t v301;
  uint64_t v302;
  uint64_t v303;
  void *v304;
  void *v305;
  uint64_t v306;
  void *v307;
  char v308;
  std::string __sz;
  long long v310;
  uint64_t v311;
  uint64_t v312[2];
  uint64_t v313[2];
  uint64_t v314;
  std::__shared_weak_count *v315;
  void *v316;
  std::__shared_weak_count *v317;
  uint64_t *v318[2];
  int v319;
  void *v320;
  char v321;
  uint64_t v322;
  std::__shared_weak_count *v323;
  std::__shared_weak_count *v324;
  std::__shared_weak_count *v325;
  uint64_t v326;
  Espresso *v327;
  std::__shared_weak_count *v328;
  uint64_t v329;
  std::__shared_weak_count *v330;
  char v331[8];
  char *v332;
  char *v333[3];
  char **v334;
  char *v335[2];
  void **v336;
  std::__shared_weak_count *v337;
  long long v338;
  long long v339;
  long long v340;
  long long v341;
  uint64_t v342;
  int v343[2];
  uint64_t v344;
  void *v345[2];
  long long v346;
  int v347;
  long long v348;
  long long v349;
  float v350;
  uint64_t v351;
  std::__shared_weak_count *v352;
  uint64_t v353;
  std::__shared_weak_count *v354;
  void **v355;
  std::__shared_weak_count *v356;
  std::__shared_weak_count *v357;
  uint64_t v358[3];
  uint64_t v359;
  char v360;
  id v361;
  id v362;
  void v363[5];
  std::__shared_weak_count *v364;
  uint64_t v365[2];
  uint64_t v366;
  std::__shared_weak_count *v367;
  uint64_t v368;
  std::__shared_weak_count *v369;
  uint64_t v370;
  std::__shared_weak_count *v371;
  uint64_t v372;
  std::__shared_weak_count *v373;
  objc_super v374;
  void **v375;
  uint64_t v376;
  __CFString *v377;
  void *__p[2];
  unsigned char v379[24];
  void *v380;
  long long v381[14];
  void *v382;
  char v383;
  uint64_t v384;
  void *v385;
  uint64_t v386;
  void *v387;
  std::string v388;
  long long v389;
  void v390[2];
  unsigned char v391[128];
  uint64_t v392;
  __CFString *v393;
  uint64_t v394;
  __CFString *v395;
  uint64_t v396;
  __CFString *v397;
  uint64_t v398;
  void v399[4];

  v399[1] = *MEMORY[0x1E4F143B8];
  v206 = a3;
  v205 = a4;
  v203 = a5;
  v207 = a6;
  v374.receiver = self;
  v374.super_class = (Class)ETTaskDefinition;
  v209 = [(ETTaskDefinition *)&v374 init];

  if (!v209)
  {
LABEL_17:
    id v25 = 0;
    goto LABEL_429;
  }
  [(ETTaskDefinition *)v209 setInferenceModel:v206];
  [(ETTaskDefinition *)v209 setOptimizer:v207];
  p_varsDef = (id *)&v209->varsDef;
  objc_storeStrong((id *)&v209->varsDef, a5);
  BOOL v13 = [v207 optimizationParameters];
  id v14 = [v13 objectForKeyedSubscript:@"batchSize"];
  v209->unint64_t batchSize = [v14 unsignedIntegerValue];

  if (!v209->batchSize)
  {
    if (a8)
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      v398 = *MEMORY[0x1E4F28568];
      v399[0] = @"Batch size can't be 0/";
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v399 forKeys:&v398 count:1];
      *a8 = [v23 errorWithDomain:@"EspressoError" code:1 userInfo:v24];
    }
    goto LABEL_17;
  }
  v209->runtimePlatform = a7;
  p_training_control_name = (uint64_t)&v209->training_control_name;
  MEMORY[0x192FF0F50]();
  p_var0 = (uint64_t)&v209->training_control_name.__r_.var0;
  MEMORY[0x192FF0F50]();
  MEMORY[0x192FF0F50]();
  LODWORD(__p[0]) = 80000;
  Espresso::create_context((int *)__p, &v372);
  (*(void (**)(uint64_t))(*(void *)v372 + 96))(v372);
  v209->precision = 0;
  id v15 = [v206 modelURL];
  id v16 = [v15 path];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v16 UTF8String]);
  Espresso::load_network((uint64_t)__p, &v372, v209->precision, 0, &v370);
  [(ETTaskDefinition *)v209 setInferenceGraphNetPtr:&v370];
  if (v371) {
    nitro::nitro_function::nitro_function(v371);
  }
  if ((v379[7] & 0x80000000) != 0) {
    operator delete(__p[0]);
  }

  [(ETTaskDefinition *)v209 inferenceGraphNetPtr];
  uint64_t v17 = __p[0];
  if (__p[1]) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p[1]);
  }
  if (v17)
  {
    id v18 = [v206 modelURL];
    uint64_t v19 = [v18 path];
    v200 = [v19 stringByReplacingOccurrencesOfString:@".espresso.net" withString:@"_updatable.espresso.net"];

    int v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v21 = [v20 fileExistsAtPath:v200];

    if (v21)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v200 UTF8String]);
      uint64_t v22 = v209;
      Espresso::load_network((uint64_t)__p, &v372, v209->precision, 0, &v368);
      [(ETTaskDefinition *)v209 setTrainingGraphNetPtr:&v368];
      if (v369) {
        nitro::nitro_function::nitro_function(v369);
      }
      if ((v379[7] & 0x80000000) != 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      id v27 = [v206 modelURL];
      id v28 = [v27 path];
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v28 UTF8String]);
      Espresso::load_network((uint64_t)__p, &v372, v209->precision, 0, &v366);
      [(ETTaskDefinition *)v209 setTrainingGraphNetPtr:&v366];
      if (v367) {
        nitro::nitro_function::nitro_function(v367);
      }
      if ((v379[7] & 0x80000000) != 0) {
        operator delete(__p[0]);
      }

      uint64_t v22 = v209;
    }
    [(ETTaskDefinition *)v22 trainingGraphNetPtr];
    id v29 = __p[0];
    if (__p[1]) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p[1]);
    }
    if (!v29)
    {
      if (a8)
      {
        uint64_t v56 = (void *)MEMORY[0x1E4F28C58];
        v394 = *MEMORY[0x1E4F28568];
        v395 = @"No network made from call to load_network";
        uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v395 forKeys:&v394 count:1];
        *a8 = [v56 errorWithDomain:@"EspressoError" code:1 userInfo:v57];
      }
LABEL_85:
      id v25 = 0;
      goto LABEL_426;
    }
    [(ETTaskDefinition *)v22 inferenceGraphNetPtr];
    update_layer_index((uint64_t *)__p, (uint64_t)&v22->inference_layer_index);
    if (__p[1]) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p[1]);
    }
    [(ETTaskDefinition *)v22 shareWeights];
    v210 = v21;
    [(ETTaskDefinition *)v22 trainingGraphNetPtr];
    uint64_t v31 = *((void *)__p[0] + 4);
    uint64_t v30 = *((void *)__p[0] + 5);
    if (__p[1]) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p[1]);
    }
    [(ETTaskDefinition *)v22 trainingGraphNetPtr];
    unint64_t v32 = (v30 - v31) >> 4;
    unint64_t v33 = (uint64_t)(*((void *)__p[0] + 5) - *((void *)__p[0] + 4)) >> 4;
    if (__p[1]) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p[1]);
    }
    uint64_t v34 = 0;
    unint64_t v35 = 0;
    uint64_t v36 = 0x676E696E69617274;
    while (1)
    {
      [(ETTaskDefinition *)v22 trainingGraphNetPtr];
      uint64_t v37 = *((void *)__p[0] + 4);
      uint64_t v38 = *((void *)__p[0] + 5);
      if (__p[1]) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p[1]);
      }
      if (v35 >= (v38 - v37) >> 4) {
        break;
      }
      uint64_t v22 = v209;
      [(ETTaskDefinition *)v209 trainingGraphNetPtr];
      uint64_t v39 = *(void *)(*((void *)__p[0] + 4) + v34);
      id v40 = (void *)(v39 + 16);
      int v41 = *(char *)(v39 + 39);
      if (v41 < 0)
      {
        if (*(void *)(v39 + 24) != 11)
        {
LABEL_49:
          int v45 = 0;
          goto LABEL_50;
        }
        id v40 = (void *)*v40;
      }
      else if (v41 != 11)
      {
        goto LABEL_49;
      }
      int8x8_t v42 = (void *)*v40;
      uint64_t v43 = *(void *)((char *)v40 + 3);
      BOOL v44 = v42 == (void *)0x6E696172745F7369 && v43 == 0x676E696E69617274;
      int v45 = v44;
LABEL_50:
      if (__p[1]) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p[1]);
      }
      if (v45) {
        unint64_t v32 = v35;
      }
      [(ETTaskDefinition *)v209 trainingGraphNetPtr];
      uint64_t v46 = *(void *)(*((void *)__p[0] + 4) + v34);
      std::string v47 = (uint64_t *)(v46 + 16);
      int v48 = *(char *)(v46 + 39);
      if (v48 < 0)
      {
        if (*(void *)(v46 + 24) != 12)
        {
LABEL_65:
          BOOL v52 = 0;
          goto LABEL_66;
        }
        std::string v47 = (uint64_t *)*v47;
      }
      else if (v48 != 12)
      {
        goto LABEL_65;
      }
      unint64_t v49 = (uint64_t *)*v47;
      int v50 = *((_DWORD *)v47 + 2);
      BOOL v52 = v49 == (uint64_t *)0x696172745F646E65 && v50 == 1735289198;
LABEL_66:
      if (__p[1]) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p[1]);
      }
      if (v52) {
        unint64_t v33 = v35;
      }
      ++v35;
      v34 += 16;
    }
    [(ETTaskDefinition *)v209 trainingGraphNetPtr];
    unint64_t v53 = (uint64_t)(*((void *)__p[0] + 5) - *((void *)__p[0] + 4)) >> 4;
    if (__p[1]) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p[1]);
    }
    if (v53 > (v32 < v33))
    {
      if (v32 == v33)
      {
        BOOL v54 = 0;
        int v55 = v210;
      }
      else
      {
        [(ETTaskDefinition *)v209 trainingGraphNetPtr];
        BOOL v54 = *((void *)__p[0] + 5) != *((void *)__p[0] + 4);
        int v55 = v210;
        if (__p[1]) {
          nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p[1]);
        }
      }
      if (!v54 && ((v55 ^ 1) & 1) == 0)
      {
        if (a8)
        {
          long long v58 = (void *)MEMORY[0x1E4F28C58];
          v392 = *MEMORY[0x1E4F28568];
          v393 = @"Found Espresso network (model_updatable.espresso.net) has no training graph";
          char v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v393 forKeys:&v392 count:1];
          *a8 = [v58 errorWithDomain:@"EspressoError" code:1 userInfo:v59];
        }
        goto LABEL_85;
      }
      if ((v55 & v54) == 1)
      {
        [(ETTaskDefinition *)v209 trainingGraphNetPtr];
        std::string::basic_string[abi:ne180100]<0>(__p, "globals_container_net");
        v355 = __p;
        uint64_t v60 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::net>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v316 + 984, (unsigned __int8 *)__p, (long long **)&v355);
        uint64_t v61 = *((void *)v60 + 5);
        uint64_t v62 = (std::__shared_weak_count *)*((void *)v60 + 6);
        if (v62) {
          atomic_fetch_add_explicit(&v62->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if ((v379[7] & 0x80000000) != 0) {
          operator delete(__p[0]);
        }
        if (v317) {
          nitro::nitro_function::nitro_function(v317);
        }
        v365[1] = 0;
        v365[0] = 0;
        [(ETTaskDefinition *)v209 trainingGraphNetPtr];
        Espresso::net::setup_script(v61, v365, *(unsigned int *)(**((void **)__p[0] + 4) + 12));
        if (__p[1]) {
          nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p[1]);
        }
        uint64_t v63 = *(void (****)(uint64_t *__return_ptr, void))(v61 + 16);
        v363[0] = MEMORY[0x1E4F143A8];
        v363[1] = 3321888768;
        v363[2] = __117__ETTaskDefinition_initWithModelDefinition_lossDefinition_variablesDefinition_optimizerDefinition_forPlatform_error___block_invoke;
        v363[3] = &__block_descriptor_48_ea8_32c41_ZTSNSt3__110shared_ptrIN8Espresso3netEEE_e10_v16__0r_v8l;
        v363[4] = v61;
        v364 = v62;
        if (v62) {
          atomic_fetch_add_explicit(&v62->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        Espresso::abstract_context::compute_batch_sync(v63, v363);
        uint64_t v64 = (void *)MEMORY[0x1E4F1CA48];
        [(ETTaskDefinition *)v209 inferenceGraphNetPtr];
        v65 = [v64 arrayWithCapacity:*((void *)__p[0] + 34)];
        if (__p[1]) {
          nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p[1]);
        }
        [(ETTaskDefinition *)v209 inferenceGraphNetPtr];
        uint64_t v66 = __p[0];
        if (__p[1]) {
          nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p[1]);
        }
        long long v67 = (void *)v66[32];
        char v68 = v66 + 33;
        if (v67 != v68)
        {
          do
          {
            v69 = v67 + 4;
            if (*((char *)v67 + 55) < 0) {
              v69 = (void *)*v69;
            }
            char v70 = [NSString stringWithUTF8String:v69];
            [v65 addObject:v70];

            v71 = (void *)v67[1];
            if (v71)
            {
              do
              {
                uint64_t v72 = v71;
                v71 = (void *)*v71;
              }
              while (v71);
            }
            else
            {
              do
              {
                uint64_t v72 = (void *)v67[2];
                BOOL v44 = *v72 == (void)v67;
                long long v67 = v72;
              }
              while (!v44);
            }
            long long v67 = v72;
          }
          while (v72 != v68);
        }
        uint64_t v73 = [v205 lossOutputName];
        [v65 addObject:v73];

        objc_storeStrong((id *)&v209->optimizer_control_name, v65);
        objc_storeStrong((id *)&v209->optimizer_control_name.__r_.__value_.var0.__l + 2, v209->optimizer_control_name.__r_.__value_.var0.__l.__data_);
        v362 = 0;
        [(ETTaskDefinition *)v209 setupInputOutputShapes:&v362];
        uint64_t v74 = v362;
        if (v74)
        {
          if (a8)
          {
LABEL_405:
            uint64_t v74 = v74;
            id v25 = 0;
            *a8 = v74;
            goto LABEL_431;
          }
LABEL_406:
          id v25 = 0;
        }
        else
        {
          v361 = 0;
          [(ETTaskDefinition *)v209 reloadOnRuntimePlatform:&v361];
          uint64_t v74 = v361;
          if (v74)
          {
            if (a8) {
              goto LABEL_405;
            }
            goto LABEL_406;
          }
          id v25 = v209;
          uint64_t v74 = 0;
        }
LABEL_431:

        if (v364) {
          nitro::nitro_function::nitro_function(v364);
        }
        if (v62)
        {
          v196 = v62;
          goto LABEL_425;
        }
        goto LABEL_426;
      }
    }
    v360 = 1;
    [(ETTaskDefinition *)v209 trainingGraphNetPtr];
    Espresso::gradient_builder::gradient_builder((uint64_t)&v355, &v353, &v360);
    if (v354) {
      nitro::nitro_function::nitro_function(v354);
    }
    Espresso::gradient_builder::preprocess_network((std::__shared_weak_count **)&v355, &v351);
    if (v352) {
      nitro::nitro_function::nitro_function(v352);
    }
    v349 = 0u;
    v348 = 0u;
    v350 = 1.0;
    v346 = 0u;
    *(_OWORD *)v345 = 0u;
    v347 = 1065353216;
    *(void *)v343 = 0;
    v342 = 0;
    v344 = 0;
    uint64_t v75 = [*p_varsDef layerNames];
    v76 = v75 == 0;

    if (v76)
    {
      uint64_t v105 = v209;
      Espresso::gradient_builder::net_training_transform((const Espresso::net **)&v355, (uint64_t)__p);
      v347 = *(_DWORD *)&v379[16];
      std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,void *> *>>(v345, *(uint64_t **)v379);
      std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>>>::__deallocate_node(*(void **)v379);
      goto LABEL_199;
    }
    v77 = v355[4];
    uint64_t v78 = v355[5];
    *(_OWORD *)v379 = 0u;
    *(_OWORD *)std::string __p = 0u;
    *(_DWORD *)&v379[16] = 1065353216;
    uint64_t v79 = v78 - v77;
    if (v78 != v77)
    {
      v80 = 0;
      uint64_t v81 = 0;
      do
      {
        v316 = (void *)(*(void *)&v77[v80] + 16);
        *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)__p, (unsigned __int8 *)v316, (uint64_t)&std::piecewise_construct, (long long **)&v316)+ 10) = v81++;
        v77 = v355[4];
        v80 += 16;
      }
      while (v81 < ((unsigned char *)v355[5] - v77) >> 4);
    }
    v341 = 0u;
    v340 = 0u;
    v339 = 0u;
    v338 = 0u;
    obuint64_t j = [*p_varsDef layerNames];
    long long v82 = [obj countByEnumeratingWithState:&v338 objects:v391 count:16];
    v83 = v79 >> 4;
    if (v82)
    {
      v211 = *(void *)v339;
      uint64_t v84 = -1;
      uint64_t v85 = obj;
      while (1)
      {
        for (unint64_t i = 0; i != v82; ++i)
        {
          if (*(void *)v339 != v211) {
            objc_enumerationMutation(v85);
          }
          v87 = *(id *)(*((void *)&v338 + 1) + 8 * i);
          std::string::basic_string[abi:ne180100]<0>(&v316, (char *)[v87 UTF8String]);
          v388.__r_.__value_.__r.__words[0] = (std::string::size_type)&v316;
          v88 = *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)__p, (unsigned __int8 *)&v316, (uint64_t)&std::piecewise_construct, (long long **)&v388)+ 10);
          if (v88 < (int)v83) {
            LODWORD(v83) = v88;
          }
          if (v88 > v84) {
            uint64_t v84 = v88;
          }
          std::string::basic_string[abi:ne180100]<0>(&v388, (char *)[v87 UTF8String]);
          v89 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v388);
          v90 = v89;
          uint64_t v91 = *((void *)&v348 + 1);
          if (*((void *)&v348 + 1))
          {
            uint64_t v92 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v348 + 8));
            v92.i16[0] = vaddlv_u8(v92);
            uint64_t v93 = v92.u32[0];
            if (v92.u32[0] > 1uLL)
            {
              uint64_t v36 = v89;
              if (v89 >= *((void *)&v348 + 1)) {
                uint64_t v36 = v89 % *((void *)&v348 + 1);
              }
            }
            else
            {
              uint64_t v36 = (*((void *)&v348 + 1) - 1) & v89;
            }
            v94 = *(void ***)(v348 + 8 * v36);
            if (v94)
            {
              v95 = (char *)*v94;
              if (*v94)
              {
                while (1)
                {
                  char v96 = *((void *)v95 + 1);
                  if (v96 == v90)
                  {
                    if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v95 + 16, (unsigned __int8 *)&v388))
                    {
                      uint64_t v85 = obj;
                      goto LABEL_169;
                    }
                  }
                  else
                  {
                    if (v93 > 1)
                    {
                      if (v96 >= v91) {
                        v96 %= v91;
                      }
                    }
                    else
                    {
                      v96 &= v91 - 1;
                    }
                    if (v96 != v36)
                    {
LABEL_146:
                      uint64_t v85 = obj;
                      break;
                    }
                  }
                  v95 = *(char **)v95;
                  if (!v95) {
                    goto LABEL_146;
                  }
                }
              }
            }
          }
          v95 = (char *)operator new(0x30uLL);
          *(void *)v95 = 0;
          *((void *)v95 + 1) = v90;
          *(std::string *)(v95 + 16) = v388;
          memset(&v388, 0, sizeof(v388));
          v95[40] = 0;
          v97 = (float)(unint64_t)(*((void *)&v349 + 1) + 1);
          if (!v91 || (float)(v350 * (float)v91) < v97)
          {
            unint64_t v98 = (v91 & (v91 - 1)) != 0;
            if (v91 < 3) {
              unint64_t v98 = 1;
            }
            uint64_t v99 = v98 | (2 * v91);
            uint64_t v100 = vcvtps_u32_f32(v97 / v350);
            if (v99 <= v100) {
              uint64_t v101 = v100;
            }
            else {
              uint64_t v101 = v99;
            }
            std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__rehash<true>((uint64_t)&v348, v101);
            uint64_t v91 = *((void *)&v348 + 1);
            if ((*((void *)&v348 + 1) & (*((void *)&v348 + 1) - 1)) != 0)
            {
              if (v90 >= *((void *)&v348 + 1)) {
                uint64_t v36 = v90 % *((void *)&v348 + 1);
              }
              else {
                uint64_t v36 = v90;
              }
            }
            else
            {
              uint64_t v36 = (*((void *)&v348 + 1) - 1) & v90;
            }
          }
          v102 = v348;
          v103 = *(void **)(v348 + 8 * v36);
          if (v103)
          {
            *(void *)v95 = *v103;
LABEL_167:
            uint64_t *v103 = v95;
            goto LABEL_168;
          }
          *(void *)v95 = v349;
          *(void *)&v349 = v95;
          *(void *)(v102 + 8 * v36) = &v349;
          if (*(void *)v95)
          {
            v104 = *(void *)(*(void *)v95 + 8);
            if ((v91 & (v91 - 1)) != 0)
            {
              if (v104 >= v91) {
                v104 %= v91;
              }
            }
            else
            {
              v104 &= v91 - 1;
            }
            v103 = (void *)(v348 + 8 * v104);
            goto LABEL_167;
          }
LABEL_168:
          ++*((void *)&v349 + 1);
LABEL_169:
          v95[40] = 1;
          if (SHIBYTE(v388.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v388.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v318[0]) < 0) {
            operator delete(v316);
          }
        }
        long long v82 = [v85 countByEnumeratingWithState:&v338 objects:v391 count:16];
        if (!v82)
        {

          uint64_t v105 = v209;
          goto LABEL_176;
        }
      }
    }

    uint64_t v105 = v209;
    if ((v83 & 0x80000000) == 0)
    {
LABEL_196:
      Espresso::gradient_builder::net_training_transform((const Espresso::net **)&v355, &v348, (uint64_t)&v316);
      v347 = v319;
      std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,void *> *>>(v345, v318[0]);
      std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>>>::__deallocate_node(v318[0]);
      v116 = v316;
      v316 = 0;
      if (v116) {
        operator delete(v116);
      }
      std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::__deallocate_node(*(void ***)v379);
LABEL_199:
      v117 = __p[0];
      __p[0] = 0;
      if (v117) {
        operator delete(v117);
      }
      for (uint64_t j = (uint64_t **)v346; j; uint64_t j = (uint64_t **)*j)
        std::vector<std::string>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::string const*>,std::__wrap_iter<std::string const*>>((void **)&v342, *(uint64_t *)v343, (std::string *)j[5], (std::string *)j[6], 0xAAAAAAAAAAAAAAABLL * (j[6] - j[5]));
      v336 = v355;
      v337 = v356;
      if (v356) {
        atomic_fetch_add_explicit(&v356->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [(ETTaskDefinition *)v105 setTrainingGraphNetPtr:&v336];
      if (v337) {
        nitro::nitro_function::nitro_function(v337);
      }
      v335[1] = 0;
      v335[0] = 0;
      v334 = v335;
      [(ETTaskDefinition *)v105 trainingGraphNetPtr];
      v119 = (char *)__p[0];
      if (__p[1]) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p[1]);
      }
      [(ETTaskDefinition *)v105 trainingGraphNetPtr];
      uint64_t v120 = __p[0];
      if (__p[1]) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p[1]);
      }
      v121 = (unsigned __int8 *)v120[29];
      long long v122 = (unsigned __int8 *)(v120 + 30);
      if (v121 != v122)
      {
        uint64_t v123 = v119 + 136;
        do
        {
          v124 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(v123, v121 + 32);
          if (!v124) {
            std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
          }
          long long v125 = *((void *)v124 + 5);
          uint64_t v126 = *(void *)(v125 + 8);
          v127 = *(_DWORD *)(v125 + 16);
          unint64_t batchSize = v105->batchSize;
          v316 = v121 + 32;
          v129 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v334, (void *)v121 + 4, (long long **)&v316);
          *((void *)v129 + 7) = v126;
          *((_DWORD *)v129 + 16) = v127;
          *((_DWORD *)v129 + 17) = batchSize;
          *((void *)v129 + 9) = 0xFFFFFFFF00000001;
          *((void *)v129 + 10) = 0;
          *((void *)v129 + 11) = 0;
          v131 = v129 + 96;
          long long v130 = (void *)*((void *)v129 + 12);
          if (v130)
          {
            *((void *)v129 + 13) = v130;
            operator delete(v130);
            uint64_t *v131 = 0;
            v131[1] = 0;
            v131[2] = 0;
          }
          uint64_t *v131 = 0;
          v131[1] = 0;
          v131[2] = 0;
          v132 = (unsigned __int8 *)*((void *)v121 + 1);
          if (v132)
          {
            do
            {
              long long v133 = v132;
              v132 = *(unsigned __int8 **)v132;
            }
            while (v132);
          }
          else
          {
            do
            {
              long long v133 = (unsigned __int8 *)*((void *)v121 + 2);
              BOOL v44 = *(void *)v133 == (void)v121;
              v121 = v133;
            }
            while (!v44);
          }
          v121 = v133;
        }
        while (v133 != v122);
      }
      [(ETTaskDefinition *)v105 trainingGraphNetPtr];
      Espresso::compute_network_shape_starting_from_data_shapes(&v329, (uint64_t)&v334, (uint64_t)v331);
      if (v330) {
        nitro::nitro_function::nitro_function(v330);
      }
      [(ETTaskDefinition *)v105 trainingGraphNetPtr];
      Espresso::shape_network_recursive(v327, (Espresso::net *)v331, 0, 0);
      if (v328) {
        nitro::nitro_function::nitro_function(v328);
      }
      [(ETTaskDefinition *)v105 trainingGraphNetPtr];
      std::string v134 = v373;
      v313[0] = v372;
      v313[1] = (uint64_t)v373;
      if (v373) {
        atomic_fetch_add_explicit(&v373->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      precision = v105->precision;
      v312[1] = 0;
      v312[0] = 0;
      Espresso::sequential_builder::sequential_builder((Espresso::sequential_builder *)&v316, &v314, v313, precision, v312);
      if (v134) {
        nitro::nitro_function::nitro_function(v134);
      }
      if (v315) {
        nitro::nitro_function::nitro_function(v315);
      }
      v136 = [v205 lossOutputName];
      std::string::basic_string[abi:ne180100]<0>(&v310, (char *)[v136 UTF8String]);

      v137 = (void *)MEMORY[0x1E4F1CA48];
      [(ETTaskDefinition *)v209 trainingGraphNetPtr];
      v138 = [v137 arrayWithCapacity:*((void *)__p[0] + 34)];
      if (__p[1]) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p[1]);
      }
      p_inferenceModel = (uint64_t *)&v209->_inferenceModel;
      Espresso::mark_block_start((uint64_t *)&v209->_inferenceModel, p_training_control_name, 1);
      v140 = [v205 mode];
      switch(v140)
      {
        case 1:
          v151 = [v205 inputName];
          std::string::basic_string[abi:ne180100]<0>(&v251, (char *)[v151 UTF8String]);

          v152 = [v205 targetInputName];
          std::string::basic_string[abi:ne180100]<0>(&__s, (char *)[v152 UTF8String]);

          if (v252 >= 0) {
            v153 = HIBYTE(v252);
          }
          else {
            v153 = *((void *)&v251 + 1);
          }
          std::string::basic_string[abi:ne180100]((uint64_t)&__sz, v153 + 17);
          if ((__sz.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            p_sz = &__sz;
          }
          else {
            p_sz = (std::string *)__sz.__r_.__value_.__r.__words[0];
          }
          if (v153)
          {
            if (v252 >= 0) {
              v155 = &v251;
            }
            else {
              v155 = (long long *)v251;
            }
            memmove(p_sz, v155, v153);
          }
          strcpy((char *)p_sz + v153, "_auxiliary_output");
          *(_OWORD *)&v255.__r_.__value_.__l.__data_ = xmmword_192DCA290;
          v255.__r_.__value_.__r.__words[2] = 1;
          v256 = 257;
          [(ETTaskDefinition *)v209 trainingGraphNetPtr];
          v296.__r_.__value_.__r.__words[0] = (std::string::size_type)&v251;
          v156 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v388.__r_.__value_.__r.__words[0] + 136, (unsigned __int8 *)&v251, (long long **)&v296);
          Espresso::abstract_blob_container::shape((char *)__p, *((void *)v156 + 5));
          HIDWORD(v255.__r_.__value_.__r.__words[0]) = __p[1];
          if (v380)
          {
            *(void *)&v381[0] = v380;
            operator delete(v380);
          }
          if (v388.__r_.__value_.__l.__size_) {
            nitro::nitro_function::nitro_function((std::__shared_weak_count *)v388.__r_.__value_.__l.__size_);
          }
          v157 = v209->batchSize;
          v302 = 0;
          v303 = 0;
          v298 = 0x100000001;
          v299 = 1;
          v300 = v157;
          v301 = 0xFFFFFFFF00000001;
          v306 = 0;
          v304 = 0;
          v305 = 0;
          if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
            std::string::__init_copy_ctor_external(&v297, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
          }
          else {
            v297 = __s;
          }
          Espresso::sequential_builder::placeholder((Espresso::sequential_builder *)&v316, (char *)&v298, (std::string::size_type)&v297, (uint64_t)&v307);
          if (v308 < 0) {
            operator delete(v307);
          }
          if (SHIBYTE(v297.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v297.__r_.__value_.__l.__data_);
          }
          if (v304)
          {
            v305 = v304;
            operator delete(v304);
          }
          std::string::basic_string[abi:ne180100]<0>(&v296, "softmax");
          std::string::basic_string[abi:ne180100]<0>(&v293, "s");
          if (SHIBYTE(v252) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)__p, (const std::string::value_type *)v251, *((std::string::size_type *)&v251 + 1));
          }
          else
          {
            *(_OWORD *)std::string __p = v251;
            *(void *)v379 = v252;
          }
          if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)&v379[8], __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
          }
          else
          {
            *(_OWORD *)&v379[8] = *(_OWORD *)&__s.__r_.__value_.__l.__data_;
            v380 = (void *)__s.__r_.__value_.__r.__words[2];
          }
          v291 = 0;
          v290 = 0;
          v292 = 0;
          v388.__r_.__value_.__r.__words[0] = (std::string::size_type)&v290;
          v388.__r_.__value_.__s.__data_[8] = 0;
          v290 = (std::string *)operator new(0x30uLL);
          v291 = v290;
          v292 = v290 + 2;
          v291 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v292, (long long *)__p, v381, v290);
          if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0) {
            std::string::__init_copy_ctor_external(&v388, __sz.__r_.__value_.__l.__data_, __sz.__r_.__value_.__l.__size_);
          }
          else {
            v388 = __sz;
          }
          if (SHIBYTE(v311) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)&v389, (const std::string::value_type *)v310, *((std::string::size_type *)&v310 + 1));
          }
          else
          {
            v389 = v310;
            v390[0] = v311;
          }
          v288 = 0;
          v287 = 0;
          v289 = 0;
          v284 = (std::string *)&v287;
          LOBYTE(v285) = 0;
          v287 = (std::string *)operator new(0x30uLL);
          v288 = v287;
          v289 = v287 + 2;
          v288 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v289, (long long *)&v388, (long long *)&v390[1], v287);
          Espresso::sequential_builder::add<Espresso::softmax_params>((uint64_t *)&v281, (uint64_t *)&v316, (uint64_t)&v296, (uint64_t)&v293, (uint64_t)&v255, (uint64_t)v290, (uint64_t)v291, (uint64_t *)&v287);
          v284 = (std::string *)&v287;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v284);
          for (k = 0; k != -6; k -= 3)
          {
            if (SHIBYTE(v390[k]) < 0) {
              operator delete(*(void **)((char *)&v388 + k * 8 + 24));
            }
          }
          v388.__r_.__value_.__r.__words[0] = (std::string::size_type)&v290;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v388);
          for (m = 0; m != -48; m -= 24)
          {
            if (*((char *)&v380 + m + 7) < 0) {
              operator delete(*(void **)&v379[m + 8]);
            }
          }
          if (SHIBYTE(v295) < 0) {
            operator delete(v293);
          }
          if (SHIBYTE(v296.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v296.__r_.__value_.__l.__data_);
          }
          if (v282) {
            nitro::nitro_function::nitro_function((std::__shared_weak_count *)v282);
          }
          if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__sz.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__s.__r_.__value_.__l.__data_);
          }
          if ((SHIBYTE(v252) & 0x80000000) == 0) {
            goto LABEL_379;
          }
          v166 = (void *)v251;
          break;
        case 2:
          v149 = [v205 inputName];
          std::string::basic_string[abi:ne180100]<0>(&__sz, (char *)[v149 UTF8String]);

          v150 = [v205 targetInputName];
          std::string::basic_string[abi:ne180100]<0>(&v296, (char *)[v150 UTF8String]);

          if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)__p, __sz.__r_.__value_.__l.__data_, __sz.__r_.__value_.__l.__size_);
          }
          else
          {
            *(_OWORD *)std::string __p = *(_OWORD *)&__sz.__r_.__value_.__l.__data_;
            *(void *)v379 = *((void *)&__sz.__r_.__value_.__l + 2);
          }
          v294 = 0;
          v293 = 0;
          v295 = 0;
          v388.__r_.__value_.__r.__words[0] = (std::string::size_type)&v293;
          v388.__r_.__value_.__s.__data_[8] = 0;
          v293 = operator new(0x18uLL);
          v294 = v293;
          v295 = (char *)v293 + 24;
          v294 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v295, (long long *)__p, (long long *)&v379[8], (std::string *)v293);
          if ((v379[7] & 0x80000000) != 0) {
            operator delete(__p[0]);
          }
          std::string::basic_string[abi:ne180100]<0>(__p, "_mse-int1");
          v285 = 0;
          v284 = 0;
          p_data = 0;
          v388.__r_.__value_.__r.__words[0] = (std::string::size_type)&v284;
          v388.__r_.__value_.__s.__data_[8] = 0;
          v284 = (std::string *)operator new(0x18uLL);
          v285 = v284;
          p_data = (void **)&v284[1].__r_.__value_.__l.__data_;
          v285 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&p_data, (long long *)__p, (long long *)&v379[8], v284);
          if ((v379[7] & 0x80000000) != 0) {
            operator delete(__p[0]);
          }
          if (SHIBYTE(v284->__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)__p, v284->__r_.__value_.__l.__data_, v284->__r_.__value_.__l.__size_);
          }
          else
          {
            v161 = *(_OWORD *)&v284->__r_.__value_.__l.__data_;
            *(void *)v379 = *((void *)&v284->__r_.__value_.__l + 2);
            *(_OWORD *)std::string __p = v161;
          }
          if (SHIBYTE(v296.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)&v379[8], v296.__r_.__value_.__l.__data_, v296.__r_.__value_.__l.__size_);
          }
          else
          {
            *(_OWORD *)&v379[8] = *(_OWORD *)&v296.__r_.__value_.__l.__data_;
            v380 = (void *)v296.__r_.__value_.__r.__words[2];
          }
          v282 = 0;
          v281 = 0;
          v283 = 0;
          v388.__r_.__value_.__r.__words[0] = (std::string::size_type)&v281;
          v388.__r_.__value_.__s.__data_[8] = 0;
          v281 = (std::__shared_weak_count *)operator new(0x30uLL);
          v282 = (std::string *)v281;
          v283 = (std::string *)&v281[2];
          v162 = 0;
          v282 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v283, (long long *)__p, v381, (std::string *)v281);
          do
          {
            if (*((char *)&v380 + v162 + 7) < 0) {
              operator delete(*(void **)&v379[v162 + 8]);
            }
            v162 -= 24;
          }
          while (v162 != -48);
          std::string::basic_string[abi:ne180100]<0>(__p, "_mse-int2");
          v279 = 0;
          v278 = 0;
          v280 = 0;
          v388.__r_.__value_.__r.__words[0] = (std::string::size_type)&v278;
          v388.__r_.__value_.__s.__data_[8] = 0;
          v278 = (std::string *)operator new(0x18uLL);
          v279 = v278;
          v280 = v278 + 1;
          v279 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v280, (long long *)__p, (long long *)&v379[8], v278);
          if ((v379[7] & 0x80000000) != 0) {
            operator delete(__p[0]);
          }
          if (SHIBYTE(v278->__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)__p, v278->__r_.__value_.__l.__data_, v278->__r_.__value_.__l.__size_);
          }
          else
          {
            v163 = *(_OWORD *)&v278->__r_.__value_.__l.__data_;
            *(void *)v379 = *((void *)&v278->__r_.__value_.__l + 2);
            *(_OWORD *)std::string __p = v163;
          }
          v276 = 0;
          v275 = 0;
          v277 = 0;
          v388.__r_.__value_.__r.__words[0] = (std::string::size_type)&v275;
          v388.__r_.__value_.__s.__data_[8] = 0;
          v275 = (std::string *)operator new(0x18uLL);
          v276 = v275;
          v277 = v275 + 1;
          v276 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v277, (long long *)__p, (long long *)&v379[8], v275);
          if ((v379[7] & 0x80000000) != 0) {
            operator delete(__p[0]);
          }
          std::string::basic_string[abi:ne180100]<0>(__p, "_mse-int3");
          v273 = 0;
          v272 = 0;
          v274 = 0;
          v388.__r_.__value_.__r.__words[0] = (std::string::size_type)&v272;
          v388.__r_.__value_.__s.__data_[8] = 0;
          v272 = (std::string *)operator new(0x18uLL);
          v273 = v272;
          v274 = v272 + 1;
          v273 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v274, (long long *)__p, (long long *)&v379[8], v272);
          if ((v379[7] & 0x80000000) != 0) {
            operator delete(__p[0]);
          }
          if (SHIBYTE(v272->__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)__p, v272->__r_.__value_.__l.__data_, v272->__r_.__value_.__l.__size_);
          }
          else
          {
            v167 = *(_OWORD *)&v272->__r_.__value_.__l.__data_;
            *(void *)v379 = *((void *)&v272->__r_.__value_.__l + 2);
            *(_OWORD *)std::string __p = v167;
          }
          v270 = 0;
          v269 = 0;
          v271 = 0;
          v388.__r_.__value_.__r.__words[0] = (std::string::size_type)&v269;
          v388.__r_.__value_.__s.__data_[8] = 0;
          v269 = (std::string *)operator new(0x18uLL);
          v270 = v269;
          v271 = v269 + 1;
          v270 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v271, (long long *)__p, (long long *)&v379[8], v269);
          if ((v379[7] & 0x80000000) != 0) {
            operator delete(__p[0]);
          }
          if (SHIBYTE(v311) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)__p, (const std::string::value_type *)v310, *((std::string::size_type *)&v310 + 1));
          }
          else
          {
            *(_OWORD *)std::string __p = v310;
            *(void *)v379 = v311;
          }
          v267 = 0;
          v266 = 0;
          v268 = 0;
          v388.__r_.__value_.__r.__words[0] = (std::string::size_type)&v266;
          v388.__r_.__value_.__s.__data_[8] = 0;
          v266 = (std::string *)operator new(0x18uLL);
          v267 = v266;
          v268 = v266 + 1;
          v267 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v268, (long long *)__p, (long long *)&v379[8], v266);
          if ((v379[7] & 0x80000000) != 0) {
            operator delete(__p[0]);
          }
          [(ETTaskDefinition *)v209 trainingGraphNetPtr];
          v255.__r_.__value_.__r.__words[0] = (std::string::size_type)&__sz;
          v168 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v388.__r_.__value_.__r.__words[0] + 136, (unsigned __int8 *)&__sz, (long long **)&v255);
          Espresso::abstract_blob_container::shape((char *)__p, *((void *)v168 + 5));
          if (v388.__r_.__value_.__l.__size_) {
            nitro::nitro_function::nitro_function((std::__shared_weak_count *)v388.__r_.__value_.__l.__size_);
          }
          v259[0] = *(_OWORD *)__p;
          v259[1] = *(_OWORD *)v379;
          v260 = *(void *)&v379[16];
          v261 = 0;
          v263 = 0;
          v262 = 0;
          std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v261, v380, *(uint64_t *)&v381[0], (uint64_t)(*(void *)&v381[0] - (void)v380) >> 2);
          if (SHIBYTE(v296.__r_.__value_.__r.__words[2]) < 0) {
            std::string::__init_copy_ctor_external(&v258, v296.__r_.__value_.__l.__data_, v296.__r_.__value_.__l.__size_);
          }
          else {
            v258 = v296;
          }
          Espresso::sequential_builder::placeholder((Espresso::sequential_builder *)&v316, (char *)v259, (std::string::size_type)&v258, (uint64_t)&v264);
          if (v265 < 0) {
            operator delete(v264);
          }
          if (SHIBYTE(v258.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v258.__r_.__value_.__l.__data_);
          }
          if (v261)
          {
            v262 = v261;
            operator delete(v261);
          }
          v388.__r_.__value_.__r.__words[2] = 897988541;
          LOBYTE(v389) = 0;
          *(void *)((char *)v390 + 4) = 0;
          v388.__r_.__value_.__r.__words[0] = 1;
          v388.__r_.__value_.__l.__size_ = 3212836864;
          v255.__r_.__value_.__r.__words[2] = 897988541;
          LOBYTE(v256) = 0;
          v257 = 0;
          v252 = 897988541;
          v253 = 0;
          v254 = 0;
          v255.__r_.__value_.__l.__size_ = 1065353216;
          v255.__r_.__value_.__r.__words[0] = 0;
          *(void *)&v251 = 13;
          *((void *)&v251 + 1) = 0x40000000;
          v248 = 0;
          v249 = 0xFFFFFFFF00000000;
          v250 = 0;
          __s.__r_.__value_.__r.__words[0] = 0x358637BD00000001;
          *(_OWORD *)&__s.__r_.__value_.__r.__words[1] = 0x10000001FuLL;
          std::string::basic_string[abi:ne180100]<0>(v243, "elementwise");
          std::string::basic_string[abi:ne180100]<0>(v241, "_l2/mse-sub");
          v238 = 0;
          v239 = 0;
          v240 = 0;
          std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v238, (uint64_t)v293, (uint64_t)v294, 0xAAAAAAAAAAAAAAABLL * ((v294 - (unsigned char *)v293) >> 3));
          memset(v237, 0, sizeof(v237));
          std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v237, (uint64_t)v284, (uint64_t)v285, 0xAAAAAAAAAAAAAAABLL * (((char *)v285 - (char *)v284) >> 3));
          Espresso::sequential_builder::add<Espresso::elementwise_params>(&v245, (uint64_t *)&v316, (uint64_t)v243, (uint64_t)v241, (uint64_t)&v388, v238, v239, v237);
          if (v246) {
            nitro::nitro_function::nitro_function(v246);
          }
          v375 = (void **)v237;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v375);
          v375 = (void **)&v238;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v375);
          if (v242 < 0) {
            operator delete(v241[0]);
          }
          if (v244 < 0) {
            operator delete(v243[0]);
          }
          std::string::basic_string[abi:ne180100]<0>(v243, "elementwise");
          std::string::basic_string[abi:ne180100]<0>(v241, "_l2/mse-add");
          v232 = 0;
          v233 = 0;
          v234 = 0;
          std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v232, (uint64_t)v281, (uint64_t)v282, 0xAAAAAAAAAAAAAAABLL * (((char *)v282 - (char *)v281) >> 3));
          memset(v231, 0, sizeof(v231));
          std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v231, (uint64_t)v278, (uint64_t)v279, 0xAAAAAAAAAAAAAAABLL * (((char *)v279 - (char *)v278) >> 3));
          Espresso::sequential_builder::add<Espresso::elementwise_params>(&v235, (uint64_t *)&v316, (uint64_t)v243, (uint64_t)v241, (uint64_t)&v255, v232, v233, v231);
          if (v236) {
            nitro::nitro_function::nitro_function(v236);
          }
          v375 = (void **)v231;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v375);
          v375 = (void **)&v232;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v375);
          if (v242 < 0) {
            operator delete(v241[0]);
          }
          if (v244 < 0) {
            operator delete(v243[0]);
          }
          std::string::basic_string[abi:ne180100]<0>(v243, "elementwise");
          std::string::basic_string[abi:ne180100]<0>(v241, "_l2/mse-pow");
          v226 = 0;
          v227 = 0;
          v228 = 0;
          std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v226, (uint64_t)v275, (uint64_t)v276, 0xAAAAAAAAAAAAAAABLL * (((char *)v276 - (char *)v275) >> 3));
          memset(v225, 0, sizeof(v225));
          std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v225, (uint64_t)v272, (uint64_t)v273, 0xAAAAAAAAAAAAAAABLL * (((char *)v273 - (char *)v272) >> 3));
          Espresso::sequential_builder::add<Espresso::elementwise_params>(&v229, (uint64_t *)&v316, (uint64_t)v243, (uint64_t)v241, (uint64_t)&v251, v226, v227, v225);
          if (v230) {
            nitro::nitro_function::nitro_function(v230);
          }
          v375 = (void **)v225;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v375);
          v375 = (void **)&v226;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v375);
          if (v242 < 0) {
            operator delete(v241[0]);
          }
          if (v244 < 0) {
            operator delete(v243[0]);
          }
          std::string::basic_string[abi:ne180100]<0>(v243, "reduce");
          std::string::basic_string[abi:ne180100]<0>(v241, "_l2/mse-reduce");
          v220 = 0;
          v221 = 0;
          v222 = 0;
          std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v220, (uint64_t)v269, (uint64_t)v270, 0xAAAAAAAAAAAAAAABLL * (((char *)v270 - (char *)v269) >> 3));
          memset(v219, 0, sizeof(v219));
          std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v219, (uint64_t)v266, (uint64_t)v267, 0xAAAAAAAAAAAAAAABLL * (((char *)v267 - (char *)v266) >> 3));
          Espresso::sequential_builder::add<Espresso::reduce_params_t>(&v223, (uint64_t *)&v316, (uint64_t)v243, (uint64_t)v241, (uint64_t)&__s, v220, v221, v219);
          if (v224) {
            nitro::nitro_function::nitro_function(v224);
          }
          v375 = (void **)v219;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v375);
          v375 = (void **)&v220;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v375);
          if (v242 < 0) {
            operator delete(v241[0]);
          }
          if (v244 < 0) {
            operator delete(v243[0]);
          }
          if (v380)
          {
            *(void *)&v381[0] = v380;
            operator delete(v380);
          }
          __p[0] = &v266;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
          __p[0] = &v269;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
          __p[0] = &v272;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
          __p[0] = &v275;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
          __p[0] = &v278;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
          __p[0] = &v281;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
          __p[0] = &v284;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
          __p[0] = &v293;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
          if (SHIBYTE(v296.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v296.__r_.__value_.__l.__data_);
          }
          if ((SHIBYTE(__sz.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_379;
          }
          v166 = (void *)__sz.__r_.__value_.__r.__words[0];
          break;
        case 3:
          v141 = v322;
          std::string v142 = [v205 lossOutputName];
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v142 UTF8String]);
          v143 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::find<std::string>((void *)(v141 + 136), (unsigned __int8 *)__p);
          if ((v379[7] & 0x80000000) != 0) {
            operator delete(__p[0]);
          }

          if (!v143)
          {
            if (a8)
            {
              v144 = (void *)MEMORY[0x1E4F28C58];
              v386 = *MEMORY[0x1E4F28568];
              uint64_t v145 = NSString;
              v146 = [v205 lossOutputName];
              v147 = [v145 stringWithFormat:@"loss name %@ does not exist", v146];
              v387 = v147;
              v148 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v387 forKeys:&v386 count:1];
              *a8 = [v144 errorWithDomain:@"EspressoError" code:1 userInfo:v148];
            }
LABEL_263:
            id v25 = 0;
LABEL_408:

            if (SHIBYTE(v311) < 0) {
              operator delete((void *)v310);
            }
            std::deque<std::pair<std::shared_ptr<Espresso::abstract_context>,Espresso::compute_path>>::~deque[abi:ne180100]((uint64_t)&v326);
            if (v325) {
              nitro::nitro_function::nitro_function(v325);
            }
            if (v324) {
              nitro::nitro_function::nitro_function(v324);
            }
            if (v323) {
              nitro::nitro_function::nitro_function(v323);
            }
            if (v321 < 0) {
              operator delete(v320);
            }
            std::__tree<std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::__map_value_compare<Espresso::AOT::BackendIdentifier,std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::less<Espresso::AOT::BackendIdentifier>,true>,std::allocator<std::__value_type<Espresso::AOT::BackendIdentifier,double>>>::destroy((uint64_t)v318, v318[1]);
            if (v317) {
              nitro::nitro_function::nitro_function(v317);
            }
            std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)v333, v333[1]);
            std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)v331, v332);
            std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v334, v335[0]);
            __p[0] = &v342;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
            std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>>>::__deallocate_node((void *)v346);
            v195 = v345[0];
            v345[0] = 0;
            if (v195) {
              operator delete(v195);
            }
            std::__hash_table<std::__hash_value_type<std::string,Espresso::training_transform_options>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::training_transform_options>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::training_transform_options>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::training_transform_options>>>::~__hash_table((uint64_t)&v348);
            std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)&v359);
            std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v358, v358[1]);
            if (v357) {
              nitro::nitro_function::nitro_function(v357);
            }
            v196 = v356;
            if (v356) {
LABEL_425:
            }
              nitro::nitro_function::nitro_function(v196);
LABEL_426:

            goto LABEL_427;
          }
LABEL_379:
          Espresso::sequential_builder::build_from_shapes((uint64_t)&v316, (uint64_t)v316, 1, &v217);
          if (v218) {
            nitro::nitro_function::nitro_function(v218);
          }
          if (a7 == 4) {
            Espresso::mark_block_start(p_inferenceModel, p_var0, 1);
          }
          memset(&v388, 0, sizeof(v388));
          memset(v216, 0, sizeof(v216));
          std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v216, v342, *(uint64_t *)v343, 0xAAAAAAAAAAAAAAABLL * ((*(void *)v343 - v342) >> 3));
          Espresso::gradient_builder::build_gradient((uint64_t)&v355, &v310, v216, __p);
          std::vector<std::string>::__vdeallocate((std::vector<std::string> *)&v388);
          *(_OWORD *)&v388.__r_.__value_.__l.__data_ = *(_OWORD *)__p;
          v388.__r_.__value_.__r.__words[2] = *(void *)v379;
          *(void *)v379 = 0;
          __p[1] = 0;
          __p[0] = 0;
          v255.__r_.__value_.__r.__words[0] = (std::string::size_type)__p;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v255);
          v255.__r_.__value_.__r.__words[0] = (std::string::size_type)v216;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v255);
          if (a7 == 4)
          {
            Espresso::mark_block_end(p_inferenceModel, p_var0);
            Espresso::guard_block_with_if (*p_inferenceModel, p_var0);
          }
          if ([v207 type])
          {
            if ([v207 type] != 1)
            {
              if (a8)
              {
                v193 = (void *)MEMORY[0x1E4F28C58];
                v376 = *MEMORY[0x1E4F28568];
                v377 = @"Invalid optimizer type, optimizer must be of type SGD or Adam";
                v194 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v377 forKeys:&v376 count:1];
                [v193 errorWithDomain:@"EspressoError" code:1 userInfo:v194];
                id v25 = 0;
                *a8 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                id v25 = 0;
              }
              __p[0] = &v388;
              std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
              goto LABEL_408;
            }
            [(ETTaskDefinition *)v209 trainingGraphNetPtr];
            v169 = [v207 optimizationParameters];
            v170 = [v169 objectForKeyedSubscript:@"learningRate"];
            [v170 floatValue];
            v172 = v171;
            v173 = [v207 optimizationParameters];
            v174 = [v173 objectForKeyedSubscript:@"beta1"];
            [v174 floatValue];
            v176 = v175;
            v177 = [v207 optimizationParameters];
            v178 = [v177 objectForKeyedSubscript:@"beta2"];
            [v178 floatValue];
            v180 = v179;
            v181 = [v207 optimizationParameters];
            v182 = [v181 objectForKeyedSubscript:@"epsilon"];
            [v182 floatValue];
            v184 = v183;
            std::string::basic_string[abi:ne180100]<0>(&v255, (char *)[@"learningRate" UTF8String]);
            Espresso::adam_optimizer_builder::adam_optimizer_builder((uint64_t)__p, v212, v213, (uint64_t)&v342, (uint64_t)&v388, &v255, v172, v176, v180, v184);
            if (SHIBYTE(v255.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v255.__r_.__value_.__l.__data_);
            }

            if (v213) {
              nitro::nitro_function::nitro_function(v213);
            }
            Espresso::adam_optimizer_builder::build_single_layer_optimizer((Espresso::adam_optimizer_builder *)__p);
            Espresso::adam_optimizer_builder::~adam_optimizer_builder(__p);
          }
          else
          {
            [(ETTaskDefinition *)v209 trainingGraphNetPtr];
            v185 = [v207 optimizationParameters];
            v186 = [v185 objectForKeyedSubscript:@"learningRate"];
            [v186 floatValue];
            v188 = v187;
            v189 = [v207 optimizationParameters];
            v190 = [v189 objectForKeyedSubscript:@"momentum"];
            [v190 floatValue];
            v192 = v191;
            std::string::basic_string[abi:ne180100]<0>(&v255, (char *)[@"learningRate" UTF8String]);
            Espresso::sgd_optimizer_builder::sgd_optimizer_builder((uint64_t)__p, v214, v215, (uint64_t)&v342, (uint64_t)&v388, &v255, v188, v192);
            if (SHIBYTE(v255.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v255.__r_.__value_.__l.__data_);
            }

            if (v215) {
              nitro::nitro_function::nitro_function(v215);
            }
            Espresso::sgd_optimizer_builder::build_single_layer_optimizer((Espresso::sgd_optimizer_builder *)__p);
            __p[0] = &unk_1EE357088;
            if (v383 < 0) {
              operator delete(v382);
            }
            Espresso::optimizer_builder::~optimizer_builder(__p);
          }
          Espresso::mark_block_end(p_inferenceModel, p_training_control_name);
          Espresso::guard_block_with_if (*p_inferenceModel, p_training_control_name);
        default:
          if (a8)
          {
            v158 = (void *)MEMORY[0x1E4F28C58];
            v384 = *MEMORY[0x1E4F28568];
            v159 = objc_msgSend(NSString, "stringWithFormat:", @"loss type not supported: %d", objc_msgSend(v205, "mode"));
            v385 = v159;
            v160 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v385 forKeys:&v384 count:1];
            *a8 = [v158 errorWithDomain:@"EspressoError" code:1 userInfo:v160];
          }
          goto LABEL_263;
      }
      operator delete(v166);
      goto LABEL_379;
    }
    uint64_t v84 = -1;
LABEL_176:
    std::string::size_type v106 = v84 - v83 + 1;
    int v107 = 16 * (int)v83;
    while (1)
    {
      uint64_t v108 = (uint64_t *)((char *)v355[4] + v107);
      v109 = *v108;
      uint64_t v110 = (std::__shared_weak_count *)v108[1];
      if (v110) {
        atomic_fetch_add_explicit(&v110->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v111 = (uint64_t *)(v109 + 40);
      v112 = *(char *)(v109 + 63);
      if (v112 < 0)
      {
        if (*(void *)(v109 + 48) == 9)
        {
          v111 = (uint64_t *)*v111;
LABEL_184:
          v113 = (uint64_t *)*v111;
          v114 = *((unsigned __int8 *)v111 + 8);
          if (v113 == (uint64_t *)0x726F6E6863746162 && v114 == 109)
          {
            v316 = (void *)(v109 + 16);
            std::__hash_table<std::__hash_value_type<std::string,Espresso::training_transform_options>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::training_transform_options>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::training_transform_options>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::training_transform_options>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v348, (unsigned __int8 *)(v109 + 16), (long long **)&v316)[40] = 1;
          }
        }
      }
      else if (v112 == 9)
      {
        goto LABEL_184;
      }
      if (v110) {
        nitro::nitro_function::nitro_function(v110);
      }
      v107 += 16;
      if (!--v106) {
        goto LABEL_196;
      }
    }
  }
  if (a8)
  {
    char v26 = (void *)MEMORY[0x1E4F28C58];
    v396 = *MEMORY[0x1E4F28568];
    v397 = @"No network made from call to load_network";
    v201 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v397 forKeys:&v396 count:1];
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", @"EspressoError", 1);
    id v25 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v25 = 0;
  }
LABEL_427:
  if (v373) {
    nitro::nitro_function::nitro_function(v373);
  }
LABEL_429:

  return v25;
}

void __117__ETTaskDefinition_initWithModelDefinition_lossDefinition_variablesDefinition_optimizerDefinition_forPlatform_error___block_invoke(uint64_t a1, void *a2)
{
}

- (id)description
{
  id v46 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v46 appendFormat:@"Training Graph:\n"];
  for (unint64_t i = 0; ; ++i)
  {
    [(ETTaskDefinition *)self trainingGraphNetPtr];
    uint64_t v3 = *(void *)(v50 + 32);
    uint64_t v2 = *(void *)(v50 + 40);
    if (v51) {
      nitro::nitro_function::nitro_function(v51);
    }
    if ((v2 - v3) >> 4 <= i) {
      break;
    }
    [(ETTaskDefinition *)self trainingGraphNetPtr];
    BOOL v4 = (uint64_t *)(*(void *)(v50 + 32) + 16 * i);
    uint64_t v6 = *v4;
    uint64_t v5 = (std::__shared_weak_count *)v4[1];
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v40 = v5;
    if (v51) {
      nitro::nitro_function::nitro_function(v51);
    }
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    std::string v47 = (void *)(v6 + 16);
    uint64_t v45 = v6;
    while (1)
    {
      Espresso::layer_data::shapes((Espresso::layer_data *)&v50, *(uint64_t **)(v6 + 80), *(uint64_t **)(v6 + 88));
      uint64_t v9 = (uint64_t)v51 - v50;
      v52[0] = (void **)&v50;
      std::vector<Espresso::layer_shape>::__destroy_vector::operator()[abi:ne180100](v52);
      if (v8 >= v9 >> 6) {
        break;
      }
      unint64_t v10 = (uint64_t *)(*(void *)(v6 + 80) + v7);
      uint64_t v12 = *v10;
      unint64_t v11 = (std::__shared_weak_count *)v10[1];
      if (v11) {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      BOOL v13 = v47;
      if (*(char *)(v6 + 39) < 0) {
        BOOL v13 = (void *)*v47;
      }
      int v48 = [NSString stringWithUTF8String:v13];
      uint64_t v43 = v11;
      uint64_t v14 = *(unsigned int *)(v12 + 8);
      uint64_t v15 = *(unsigned int *)(v12 + 12);
      uint64_t v17 = *(unsigned int *)(v12 + 16);
      uint64_t v16 = *(unsigned int *)(v12 + 20);
      uint64_t v19 = *(unsigned int *)(v12 + 24);
      uint64_t v18 = *(unsigned int *)(v12 + 28);
      uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)v12 + 24))(v12);
      [v46 appendFormat:@"Src[%d]: %@ (layer[%d]) [w:%d,h:%d,k:%d,n:%d,seq:%d,rank:%d,platform:%d,computePath:%d]... \t\tdata at 0: %f\n", v8, v48, i, v14, v15, v17, v16, v19, v18, v20, (*(uint64_t (**)(uint64_t))(*(void *)v12 + 32))(v12), **(float **)(*(void *)(v12 + 160) + 24)];

      uint64_t v6 = v45;
      if (v43) {
        nitro::nitro_function::nitro_function(v43);
      }
      ++v8;
      v7 += 16;
    }
    int v21 = v47;
    if (*(char *)(v6 + 39) < 0) {
      int v21 = (void *)*v47;
    }
    uint64_t v22 = [NSString stringWithUTF8String:v21];
    uint64_t v23 = (void *)(v6 + 40);
    if (*(char *)(v6 + 63) < 0) {
      uint64_t v23 = (void *)*v23;
    }
    uint64_t v24 = [NSString stringWithUTF8String:v23];
    [v46 appendFormat:@"%@: layer[%d], kernel type: %@, layerPlatform: %d, layerComputePlatform: %d\n", v22, i, v24, *(unsigned int *)(v6 + 8), *(unsigned int *)(v6 + 12)];

    uint64_t v25 = 0;
    for (unint64_t j = 0; ; ++j)
    {
      Espresso::layer_data::shapes((Espresso::layer_data *)&v50, *(uint64_t **)(v6 + 104), *(uint64_t **)(v6 + 112));
      uint64_t v27 = (uint64_t)v51 - v50;
      v52[0] = (void **)&v50;
      std::vector<Espresso::layer_shape>::__destroy_vector::operator()[abi:ne180100](v52);
      if (j >= v27 >> 6) {
        break;
      }
      id v28 = (uint64_t *)(*(void *)(v6 + 104) + v25);
      uint64_t v30 = *v28;
      id v29 = (std::__shared_weak_count *)v28[1];
      if (v29) {
        atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v31 = v47;
      if (*(char *)(v6 + 39) < 0) {
        uint64_t v31 = (void *)*v47;
      }
      unint64_t v49 = [NSString stringWithUTF8String:v31];
      BOOL v44 = v29;
      uint64_t v32 = *(unsigned int *)(v30 + 8);
      uint64_t v33 = *(unsigned int *)(v30 + 12);
      uint64_t v35 = *(unsigned int *)(v30 + 16);
      uint64_t v34 = *(unsigned int *)(v30 + 20);
      uint64_t v37 = *(unsigned int *)(v30 + 24);
      uint64_t v36 = *(unsigned int *)(v30 + 28);
      uint64_t v38 = (*(uint64_t (**)(uint64_t))(*(void *)v30 + 24))(v30);
      [v46 appendFormat:@"Dst[%d]: %@ (layer[%d]) [w:%d,h:%d,k:%d,n:%d,seq:%d,rank:%d,platform:%d,computePath:%d]... \t\tdata at 0: %f\n", j, v49, i, v32, v33, v35, v34, v37, v36, v38, (*(uint64_t (**)(uint64_t))(*(void *)v30 + 32))(v30), **(float **)(*(void *)(v30 + 160) + 24)];

      uint64_t v6 = v45;
      if (v44) {
        nitro::nitro_function::nitro_function(v44);
      }
      v25 += 16;
    }
    [v46 appendFormat:@"\n"];
    if (v40) {
      nitro::nitro_function::nitro_function(v40);
    }
  }

  return v46;
}

- (void)checkShapes:(const void *)a3 withSample:(const void *)a4 withError:(id *)a5
{
  v48[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = *((void *)a3 + 3);
  if (v5 <= *((void *)a4 + 3))
  {
    unint64_t v11 = (char *)a3 + 16;
    uint64_t v36 = *MEMORY[0x1E4F28568];
    while (1)
    {
      unint64_t v11 = *(char **)v11;
      if (!v11) {
        return;
      }
      uint64_t v12 = v11 + 16;
      BOOL v13 = v11 + 16;
      if (v11[39] < 0) {
        BOOL v13 = *(char **)v12;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"tensor of name %s not provided by data provider", v13);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(a4, (unsigned __int8 *)v11 + 16);
      if (v14) {
        BOOL v15 = 1;
      }
      else {
        BOOL v15 = a5 == 0;
      }
      if (!v15)
      {
        uint64_t v34 = (void *)MEMORY[0x1E4F28C58];
        v43[0] = v36;
        v45.i64[0] = (uint64_t)v7;
        uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:v43 count:1];
        *a5 = [v34 errorWithDomain:@"EspressoError" code:1 userInfo:v35];

        goto LABEL_46;
      }
      BOOL v16 = v14 != 0;

      if (!v16) {
        return;
      }
      uint64_t v17 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(a4, (unsigned __int8 *)v11 + 16);
      if (!v17) {
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      }
      uint64_t v18 = *((void *)v17 + 5);
      uint64_t v19 = (std::__shared_weak_count *)*((void *)v17 + 6);
      if (v19) {
        atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      int32x4_t v37 = *(int32x4_t *)(v18 + 8);
      int8x16_t v20 = (int8x16_t)vrev64q_s32(v37);
      int8x16_t v45 = vextq_s8(v20, v20, 8uLL);
      uint64_t v46 = 0x400000000;
      Espresso::layer_nd_shape::layer_nd_shape((uint64_t)v43, (const Espresso::layer_shape *)(v11 + 40), 0);
      if (v44 == 4) {
        break;
      }
      if (a5) {
        goto LABEL_29;
      }
LABEL_40:
      int v25 = 1;
LABEL_41:
      if (v19) {
        nitro::nitro_function::nitro_function(v19);
      }
      if (v25) {
        return;
      }
    }
    if (LODWORD(v43[0]) == v37.i32[3])
    {
      unint64_t v21 = 0;
      while (v44 - 1 != v21)
      {
        int v22 = *((_DWORD *)v43 + v21 + 1);
        __int32 v23 = v45.i32[++v21];
        if (v22 != v23) {
          goto LABEL_26;
        }
      }
      unint64_t v21 = v44;
LABEL_26:
      BOOL v24 = v21 >= v44;
    }
    else
    {
      BOOL v24 = 0;
    }
    int v25 = !v24;
    if (!a5 || v24) {
      goto LABEL_41;
    }
LABEL_29:
    if (v11[39] < 0) {
      uint64_t v12 = *(char **)v12;
    }
    char v26 = NSString;
    Espresso::layer_nd_shape::repr(&v40, (uint64_t)v43);
    int v27 = SHIBYTE(v40.__r_.__value_.__r.__words[2]);
    std::string::size_type v28 = v40.__r_.__value_.__r.__words[0];
    Espresso::layer_nd_shape::repr(&__p, (uint64_t)&v45);
    id v29 = &v40;
    if (v27 < 0) {
      id v29 = (std::string *)v28;
    }
    p_p = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    uint64_t v31 = objc_msgSend(v26, "stringWithFormat:", @"inconsistent shape of tensor %s between tensor in network and tensor provided by data loader: %s vs %s", v12, v29, p_p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v40.__r_.__value_.__l.__data_);
    }
    uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = v36;
    int8x8_t v42 = v31;
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    *a5 = [v32 errorWithDomain:@"EspressoError" code:1 userInfo:v33];

    goto LABEL_40;
  }
  if (a5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"number tensors from data provider == %lu < number of requested tensors == %lu", *((void *)a4 + 3), v5);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    v48[0] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    *a5 = [v8 errorWithDomain:@"EspressoError" code:1 userInfo:v9];

LABEL_46:
  }
}

- (void)setupInputOutputShapes:(id *)a3
{
  data = self->optimizer_control_name.__r_.__value_.var0.__l.__data_;
  id v13 = 0;
  [(ETTaskDefinition *)self setupShapes:&self->infInputBlobShapes.__table_.__p3_ forBlobs:data withError:&v13];
  id v6 = v13;
  if (v6) {
    goto LABEL_5;
  }
  uint64_t v7 = *((void *)&self->optimizer_control_name.__r_.__value_.var0.__l + 2);
  id v12 = 0;
  [(ETTaskDefinition *)self setupShapes:&self->trainInputBlobShapes.__table_.__p3_ forBlobs:v7 withError:&v12];
  id v6 = v12;
  if (v6) {
    goto LABEL_5;
  }
  int64_t var0 = self->gradient_control_name.var0;
  id v11 = 0;
  [(ETTaskDefinition *)self setupShapes:&self->optimizer_control_name.__r_.var0 forBlobs:var0 withError:&v11];
  id v6 = v11;
  if (v6
    || (unint64_t size = self->optimizer_control_name.__r_.__value_.var0.__l.__size_,
        id v10 = 0,
        [(ETTaskDefinition *)self setupShapes:&self->trainOutputNames forBlobs:size withError:&v10], (id v6 = v10) != 0))
  {
LABEL_5:
    if (a3)
    {
      id v6 = v6;
      *a3 = v6;
    }
  }
}

- (void)setupShapes:(void *)a3 forBlobs:(id)a4 withError:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obunint64_t j = a4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        std::string::basic_string[abi:ne180100]<0>(v24, (char *)[*(id *)(*((void *)&v26 + 1) + 8 * i) UTF8String]);
        if (v25 >= 0) {
          id v11 = v24;
        }
        else {
          id v11 = (void **)v24[0];
        }
        id v12 = objc_msgSend(NSString, "stringWithFormat:", @"Queried tensor '%s' not found in network", v11);
        [(ETTaskDefinition *)self trainingGraphNetPtr];
        BOOL v13 = find_or_create_error<std::string,std::shared_ptr<Espresso::abstract_blob_container>>((void *)(*(void *)&v20[0] + 136), (unsigned __int8 *)v24, a5, v12);
        if (*((void *)&v20[0] + 1)) {
          nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v20[0] + 1));
        }

        if (!v13)
        {
          if (v25 < 0) {
            operator delete(v24[0]);
          }
          goto LABEL_25;
        }
        [(ETTaskDefinition *)self trainingGraphNetPtr];
        uint64_t v30 = v24;
        uint64_t v14 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)(v18 + 17), (unsigned __int8 *)v24, (long long **)&v30);
        Espresso::abstract_blob_container::shape((char *)v20, *((void *)v14 + 5));
        if (v19) {
          nitro::nitro_function::nitro_function(v19);
        }
        uint64_t v18 = v24;
        BOOL v15 = std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a3, (unsigned __int8 *)v24, (long long **)&v18);
        long long v16 = v20[1];
        *(_OWORD *)(v15 + 40) = v20[0];
        *(_OWORD *)(v15 + 56) = v16;
        *((void *)v15 + 9) = v21;
        if (v15 + 40 != (char *)v20) {
          std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>(v15 + 80, (char *)__p, (uint64_t)v23, (v23 - (unsigned char *)__p) >> 2);
        }
        if (__p)
        {
          __int32 v23 = __p;
          operator delete(__p);
        }
        if (v25 < 0) {
          operator delete(v24[0]);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_25:
}

- (void)shareWeights
{
  uint64_t v3 = [(ETVariablesDefinition *)self->varsDef layerNames];

  if (v3)
  {
    [(ETTaskDefinition *)self trainingGraphNetPtr];
    if (v14) {
      nitro::nitro_function::nitro_function(v14);
    }
    BOOL v4 = *(uint64_t **)(v13 + 32);
    for (uint64_t i = *(uint64_t **)(v13 + 40); v4 != i; v4 += 2)
    {
      uint64_t v7 = *v4;
      id v6 = (std::__shared_weak_count *)v4[1];
      if (v6) {
        atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v8 = [(ETVariablesDefinition *)self->varsDef layerNames];
      uint64_t v9 = v7 + 16;
      if (*(char *)(v7 + 39) < 0) {
        uint64_t v9 = *(void *)(v7 + 16);
      }
      id v10 = [NSString stringWithUTF8String:v9];
      char v11 = [v8 containsObject:v10];

      if ((v11 & 1) == 0)
      {
        id v12 = std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::find<std::string>(&self->inference_layer_index.__table_.__bucket_list_.__ptr_.__value_, v7 + 16);
        if (v12)
        {
          [(ETTaskDefinition *)self inferenceGraphNetPtr];
          (*(void (**)(uint64_t, uint64_t))(*(void *)v7 + 16))(v7, *(void *)(v13 + 32) + 16 * v12[5]);
          if (v14) {
            nitro::nitro_function::nitro_function(v14);
          }
        }
      }
      if (v6) {
        nitro::nitro_function::nitro_function(v6);
      }
    }
  }
}

- (void)reloadOnRuntimePlatform:(id *)a3
{
  [(ETTaskDefinition *)self context_for_runtime_platform:a3];
  [(ETTaskDefinition *)self trainingGraphNetPtr];
  Espresso::reload_network_on_context(&v6, (uint64_t)v10, self->precision, (uint64_t)v8);
  [(ETTaskDefinition *)self setTrainingGraphNetPtr:v8];
  if (v9) {
    nitro::nitro_function::nitro_function(v9);
  }
  if (v7) {
    nitro::nitro_function::nitro_function(v7);
  }
  [(ETTaskDefinition *)self inferenceGraphNetPtr];
  Espresso::reload_network_on_context(&v6, (uint64_t)v10, self->precision, (uint64_t)&v4);
  [(ETTaskDefinition *)self setInferenceGraphNetPtr:&v4];
  if (v5) {
    nitro::nitro_function::nitro_function(v5);
  }
  if (v7) {
    nitro::nitro_function::nitro_function(v7);
  }
  [(ETTaskDefinition *)self inferenceGraphNetPtr];
  update_layer_index(&v6, (uint64_t)&self->inference_layer_index);
  if (v7) {
    nitro::nitro_function::nitro_function(v7);
  }
  [(ETTaskDefinition *)self shareWeights];
  if (v11) {
    nitro::nitro_function::nitro_function(v11);
  }
}

- (shared_ptr<Espresso::abstract_context>)context_for_runtime_platform:(id *)a3
{
  uint64_t v4 = v3;
  v20[1] = *MEMORY[0x1E4F143B8];
  unint64_t runtimePlatform = self->runtimePlatform;
  if (runtimePlatform == 2 || runtimePlatform == 4)
  {
    int v13 = 50000;
    Espresso::abstract_engine_factory::shared(&v17);
    Espresso::abstract_engine_factory::engine_for_platform((uint64_t)v17, &v13, &v14);
    if (v18) {
      nitro::nitro_function::nitro_function(v18);
    }
    uint64_t v7 = Espresso::select_metal_device((Espresso *)0xFFFFFFFFLL);
    std::allocate_shared[abi:ne180100]<Espresso::MPSEngine::context,std::allocator<Espresso::MPSEngine::context>,std::shared_ptr<Espresso::abstract_engine>,objc_object  {objcproto9MTLDevice}* {__strong},void>(v16, &v14, v7);
    uint64_t v9 = (unsigned char *)v16[0];
    uint64_t v8 = (std::__shared_weak_count *)v16[1];

    if (v15) {
      nitro::nitro_function::nitro_function(v15);
    }
    v9[56] = 1;
    self = (ETTaskDefinition *)(*(uint64_t (**)(unsigned char *))(*(void *)v9 + 96))(v9);
    goto LABEL_16;
  }
  if (runtimePlatform != 3)
  {
    LODWORD(v16[0]) = 100;
    Espresso::create_context((int *)v16, &v17);
    uint64_t v9 = v17;
    uint64_t v8 = v18;
LABEL_16:
    void *v4 = v9;
    v4[1] = v8;
    goto LABEL_17;
  }
  if (a3)
  {
    char v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"Unimplemented: unable to load updatable model w/ context: ANE";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    *a3 = [v11 errorWithDomain:@"EspressoError" code:1 userInfo:v12];
  }
  void *v4 = 0;
  v4[1] = 0;
LABEL_17:
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (abstract_context *)self;
  return result;
}

@end