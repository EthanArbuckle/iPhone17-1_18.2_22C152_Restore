@interface ETTask
- (BOOL)dumpData;
- (BOOL)fit:(id)a3 numberOfBatches:(unsigned int)a4 outputNames:(id)a5 batchCallback:(id)a6;
- (BOOL)fit:(id)a3 numberOfEpochs:(int)a4 outputNames:(id)a5 batchCallback:(id)a6;
- (BOOL)moveToGPU:(int)a3 error:(id *)a4;
- (BOOL)runBatches:(id)a3 numberOfBatches:(unsigned int)a4 outputNames:(id)a5 batchCallback:(id)a6;
- (BOOL)runInference:(id)a3 outputNames:(id)a4 batchCallback:(id)a5;
- (ETImageDescriptorExtractor)extractor;
- (ETModelDef)model;
- (ETOptimizerDef)optimizer;
- (ETTask)init;
- (ETTask)initWithModelDef:(id)a3 optimizerDef:(id)a4 extractor:(id)a5;
- (ETTask)initWithModelDef:(id)a3 optimizerDef:(id)a4 extractor:(id)a5 needWeightsInitialization:(BOOL)a6;
- (ETTask)initWithModelDef:(id)a3 optimizerDef:(id)a4 lossConfig:(id)a5;
- (ETTask)initWithModelDef:(id)a3 optimizerDef:(id)a4 lossConfig:(id)a5 extractor:(id)a6;
- (float)fit:(id)a3 numberOfBatches:(unsigned int)a4 withProgress:(id)a5;
- (float)fit:(id)a3 numberOfEpochs:(int)a4 withProgress:(id)a5;
- (id).cxx_construct;
- (id)evaluate:(id)a3;
- (vector<std::string,)reinitializeVariables;
- (void)saveNetwork:(id)a3;
- (void)saveNetwork:(id)a3 revertToInferenceMode:(BOOL)a4;
- (void)setDumpData:(BOOL)a3;
- (void)setExtractor:(id)a3;
- (void)setModel:(id)a3;
- (void)setOptimizer:(id)a3;
@end

@implementation ETTask

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_optimizer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  cntrl = self->network.__cntrl_;
  if (cntrl)
  {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
}

- (void)setDumpData:(BOOL)a3
{
  self->_dumpData = a3;
}

- (BOOL)dumpData
{
  return self->_dumpData;
}

- (void)setExtractor:(id)a3
{
}

- (ETImageDescriptorExtractor)extractor
{
  return self->_extractor;
}

- (void)setOptimizer:(id)a3
{
}

- (ETOptimizerDef)optimizer
{
  return self->_optimizer;
}

- (void)setModel:(id)a3
{
}

- (ETModelDef)model
{
  return self->_model;
}

- (BOOL)moveToGPU:(int)a3 error:(id *)a4
{
  v5 = NSTemporaryDirectory();
  v6 = [MEMORY[0x1E4F29128] UUID];
  v7 = [v6 UUIDString];
  v8 = [v5 stringByAppendingFormat:@"/%@.espresso.net", v7];

  [(ETTask *)self saveNetwork:v8 revertToInferenceMode:0];
  LODWORD(v32) = 50000;
  Espresso::create_context((int *)&v32, &v29);
  if (!v29)
  {
    v9 = 0;
    goto LABEL_6;
  }
  if (!v9)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v10 = v30;
  if (v30) {
    atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v30) {
    nitro::nitro_function::nitro_function(v30);
  }
  (*(void (**)(unsigned char *))(*(void *)v9 + 96))(v9);
  v9[56] = 1;
  id v11 = v8;
  v12 = std::string::basic_string[abi:ne180100]<0>(&v29, (char *)[v11 UTF8String]);
  v28[0] = v9;
  v28[1] = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  Espresso::load_network((uint64_t)v12, v28, 0, 0, (uint64_t *)&v32);
  if (v10) {
    nitro::nitro_function::nitro_function(v10);
  }
  if (v31 < 0) {
    operator delete(v29);
  }
  v13 = v32;
  v27[0] = 0;
  v27[1] = 0;
  Espresso::net::setup_script((uint64_t)v32, v27, 0);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3321888768;
  v23[2] = __26__ETTask_moveToGPU_error___block_invoke;
  v23[3] = &unk_1EE38F008;
  v23[4] = self;
  v23[5] = v9;
  v24 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v14 = v33;
  v25 = v13;
  v26 = v33;
  if (v33) {
    atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  Espresso::abstract_context::compute_batch_sync((void (***)(uint64_t *__return_ptr, void))v9, v23);
  model = self->_model;
  v21 = v13;
  v22 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(ETModelDef *)model setNetwork:&v21];
  if (v22) {
    nitro::nitro_function::nitro_function(v22);
  }
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  cntrl = self->network.__cntrl_;
  self->network.__ptr_ = v13;
  self->network.__cntrl_ = (__shared_weak_count *)v14;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  v17 = self->_model;
  if (v17)
  {
    [(ETModelDef *)v17 gb];
    v18 = (net **)v29;
    if (!v14) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  v18 = 0;
  v29 = 0;
  v30 = 0;
  if (v14) {
LABEL_29:
  }
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_30:
  v19 = (std::__shared_weak_count *)v18[1];
  *v18 = v13;
  v18[1] = (net *)v14;
  if (v19) {
    nitro::nitro_function::nitro_function(v19);
  }
  if (v30) {
    nitro::nitro_function::nitro_function(v30);
  }
  if (v26) {
    nitro::nitro_function::nitro_function(v26);
  }
  if (v24) {
    nitro::nitro_function::nitro_function(v24);
  }
  if (v14) {
    nitro::nitro_function::nitro_function(v14);
  }
  if (v10) {
    nitro::nitro_function::nitro_function(v10);
  }

  return 1;
}

void __26__ETTask_moveToGPU_error___block_invoke(void *a1, uint64_t a2)
{
  Espresso::net::all_globals((Espresso::net *)&v17, *(void *)(a1[4] + 8));
  v4 = v18;
  if (v18)
  {
    do
    {
      std::pair<std::string const,std::shared_ptr<Espresso::blob<float,4>>>::pair[abi:ne180100](&__p, v4 + 1);
      uint64_t v5 = a1[5];
      uint64_t v7 = *(void *)(v5 + 224);
      v6 = *(std::__shared_weak_count **)(v5 + 232);
      uint64_t v8 = *(void *)(v7 + 8);
      id v11 = v6;
      if (v6) {
        atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      (*(void (**)(uint64_t *__return_ptr))(*(void *)v8 + 24))(&v12);
      if (v11) {
        nitro::nitro_function::nitro_function(v11);
      }
      Espresso::blobcpy(a2, &v12, &v15);
      Espresso::net::set_global(a1[7], (long long *)&__p, &v12);
      if (v13) {
        nitro::nitro_function::nitro_function(v13);
      }
      if (v16) {
        nitro::nitro_function::nitro_function(v16);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      v4 = *(long long **)v4;
    }
    while (v4);
    v9 = v18;
  }
  else
  {
    v9 = 0;
  }
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node(v9);
  v10 = v17;
  v17 = 0;
  if (v10) {
    operator delete(v10);
  }
}

- (void)saveNetwork:(id)a3 revertToInferenceMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    Espresso::net::transform_transfer_global_parameters((Espresso::net *)self->network.__ptr_);
  }
  ptr = self->network.__ptr_;
  cntrl = self->network.__cntrl_;
  v15[0] = (uint64_t)ptr;
  v15[1] = (uint64_t)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  id v9 = v6;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v9 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(v12, "");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  Espresso::dump_network(v15, &__str, (uint64_t)v12, (uint64_t)__p);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
}

- (void)saveNetwork:(id)a3
{
}

- (BOOL)runInference:(id)a3 outputNames:(id)a4 batchCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  ptr = self->network.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(__p, "is_training");
  Espresso::net::get_global(&v18, (uint64_t)ptr, (unsigned __int8 *)__p);
  Espresso::fill_bc(&v18, 0.0);
  if (v19) {
    nitro::nitro_function::nitro_function(v19);
  }
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v12 = [(ETTask *)self optimizer];
  unsigned int v13 = objc_msgSend(v12, "batch_size");

  BOOL v14 = -[ETTask runBatches:numberOfBatches:outputNames:batchCallback:](self, "runBatches:numberOfBatches:outputNames:batchCallback:", v8, ([v8 numberOfDataPoints] - 1) / v13 + 1, v9, v10);
  return v14;
}

- (BOOL)fit:(id)a3 numberOfEpochs:(int)a4 outputNames:(id)a5 batchCallback:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  ptr = self->network.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(__p, "is_training");
  Espresso::net::get_global(&v20, (uint64_t)ptr, (unsigned __int8 *)__p);
  Espresso::fill_bc(&v20, 1.0);
  if (v21) {
    nitro::nitro_function::nitro_function(v21);
  }
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  BOOL v14 = [(ETTask *)self optimizer];
  unsigned int v15 = objc_msgSend(v14, "batch_size");

  BOOL v16 = -[ETTask runBatches:numberOfBatches:outputNames:batchCallback:](self, "runBatches:numberOfBatches:outputNames:batchCallback:", v10, a4 + a4 * (([v10 numberOfDataPoints] - 1) / v15), v11, v12);
  return v16;
}

- (BOOL)fit:(id)a3 numberOfBatches:(unsigned int)a4 outputNames:(id)a5 batchCallback:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  ptr = self->network.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(__p, "is_training");
  Espresso::net::get_global(&v18, (uint64_t)ptr, (unsigned __int8 *)__p);
  Espresso::fill_bc(&v18, 1.0);
  if (v19) {
    nitro::nitro_function::nitro_function(v19);
  }
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  BOOL v14 = [(ETTask *)self runBatches:v10 numberOfBatches:v8 outputNames:v11 batchCallback:v12];

  return v14;
}

- (BOOL)runBatches:(id)a3 numberOfBatches:(unsigned int)a4 outputNames:(id)a5 batchCallback:(id)a6
{
  void (***v32)(uint64_t *__return_ptr, void);
  ETDataSourceBuf *v33;
  ETDataSourceBuf *v34;
  int v35;
  void *v36;
  void *v37;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t (**v42)(id, void, id);
  void v43[5];
  id v44;
  ETDataSourceBuf *v45;
  void *v46[5];
  void v47[2];
  uint64_t v48;
  std::__shared_weak_count *v49;
  char **v50;
  int v51;
  void *__p;
  void *v53;
  void *v54[2];
  std::string::size_type v55;
  long long v56;
  long long v57;
  long long v58;
  long long v59;
  char *v60;
  std::string *v61;
  unint64_t v62;
  char **v63;
  char *v64[2];
  void **v65;
  void v66[2];
  void *v67;
  char *v68[16];

  v68[13] = *(char **)MEMORY[0x1E4F143B8];
  id v10 = a3;
  v40 = a5;
  v42 = (uint64_t (**)(id, void, id))a6;
  cntrl = self->network.__cntrl_;
  v47[0] = self->network.__ptr_;
  v47[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  et_data_source::et_data_source((uint64_t)v66, v10, (uint64_t)v47);
  std::allocate_shared[abi:ne180100]<et_data_source,std::allocator<et_data_source>,et_data_source,void>(&v48, (uint64_t)v66);
  v66[0] = &unk_1EE318948;
  std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)v68, v68[1]);

  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  id v12 = [(ETTask *)self optimizer];
  uint64_t v13 = objc_msgSend(v12, "batch_size");

  id v14 = v40;
  v64[0] = 0;
  v64[1] = 0;
  v62 = 0;
  v63 = v64;
  v60 = 0;
  v61 = 0;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v57 != v17) {
          objc_enumerationMutation(v15);
        }
        std::string::basic_string[abi:ne180100]<0>(v54, (char *)[*(id *)(*((void *)&v56 + 1) + 8 * i) UTF8String]);
        char v19 = (char *)self->network.__ptr_ + 136;
        v65 = v54;
        uint64_t v20 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v19, (unsigned __int8 *)v54, (long long **)&v65);
        Espresso::abstract_blob_container::shape((char *)&v50, *((void *)v20 + 5));
        if (v51 == v13)
        {
          uint64_t v21 = Espresso::layer_shape::total_dim((Espresso::layer_shape *)&v50);
          v65 = v54;
          *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v63, v54, (long long **)&v65)+ 14) = v21 / (int)v13;
        }
        else
        {
          if (v51 != 1) {
            Espresso::throw_exception_selector<Espresso::generic_error>("only support blob whose n dimension == batch size or 1");
          }
          int v22 = Espresso::layer_shape::total_dim((Espresso::layer_shape *)&v50);
          v65 = v54;
          *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v63, v54, (long long **)&v65)+ 14) = v22;
          v23 = v61;
          if ((unint64_t)v61 >= v62)
          {
            v25 = std::vector<std::string>::__push_back_slow_path<std::string const&>(&v60, (uint64_t)v54);
          }
          else
          {
            if (SHIBYTE(v55) < 0)
            {
              std::string::__init_copy_ctor_external(v61, (const std::string::value_type *)v54[0], (std::string::size_type)v54[1]);
            }
            else
            {
              long long v24 = *(_OWORD *)v54;
              v61->__r_.__value_.__r.__words[2] = v55;
              *(_OWORD *)&v23->__r_.__value_.__l.__data_ = v24;
            }
            v25 = v23 + 1;
          }
          v61 = v25;
        }
        if (__p)
        {
          v53 = __p;
          operator delete(__p);
        }
        if (SHIBYTE(v55) < 0) {
          operator delete(v54[0]);
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v56 objects:v66 count:16];
    }
    while (v16);
  }

  v26 = objc_alloc_init(ETDataSourceBuf);
  [(ETDataSourceBuf *)v26 setBlobs:&v63 numberOfDataPoints:v13 nonBatches:&v60];
  v50 = &v60;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v50);
  std::__tree<std::string>::destroy((uint64_t)&v63, v64[0]);

  if (a4)
  {
    uint64_t v27 = 0;
    BOOL v28 = 0;
    v41 = v13;
    unint64_t v29 = a4;
    uint64_t v30 = v48;
    do
    {
      char v31 = (void *)MEMORY[0x192FF2020]();
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t, uint64_t))(*(void *)v30 + 8))(v66, v30, v27, v41);
      v32 = (void (***)(uint64_t *__return_ptr, void))*((void *)self->network.__ptr_ + 2);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3321888768;
      v43[2] = __63__ETTask_runBatches_numberOfBatches_outputNames_batchCallback___block_invoke;
      v43[3] = &unk_1EE38F310;
      std::unordered_map<std::string,std::shared_ptr<Espresso::blob<float,4>>>::unordered_map((uint64_t)v46, (uint64_t)v66);
      v43[4] = self;
      v44 = v15;
      v33 = v26;
      v34 = v26;
      v45 = v34;
      Espresso::abstract_context::compute_batch_sync(v32, v43);
      v35 = v42[2](v42, v27, v34);

      v26 = v33;
      std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node((void *)v46[2]);
      v36 = v46[0];
      v46[0] = 0;
      if (v36) {
        operator delete(v36);
      }
      std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__deallocate_node(v67);
      v37 = (void *)v66[0];
      v66[0] = 0;
      if (v37) {
        operator delete(v37);
      }
      if (v35) {
        break;
      }
      BOOL v28 = ++v27 >= v29;
    }
    while (v29 != v27);
  }
  else
  {
    BOOL v28 = 1;
  }

  if (v49) {
    nitro::nitro_function::nitro_function(v49);
  }

  return v28;
}

void __63__ETTask_runBatches_numberOfBatches_outputNames_batchCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  for (uint64_t i = *(unsigned __int8 **)(a1 + 72); i; uint64_t i = *(unsigned __int8 **)i)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    if ((void *)(v5 + 240) != std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::find<std::string>(v5 + 232, (void *)i + 2))
    {
      Espresso::blob<float,4>::copy(&v17, *((void *)i + 5));
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8) + 136;
      v23[0] = i + 16;
      uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v6, i + 16, (long long **)v23);
      (*(void (**)(void, void *, void ***))(**((void **)v7 + 5) + 48))(*((void *)v7 + 5), a2, &v17);
      if (v18) {
        nitro::nitro_function::nitro_function(v18);
      }
    }
  }
  Espresso::net::__forward(*(void *)(*(void *)(a1 + 32) + 8), a2, 0, 0xFFFFFFFFLL);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v8; ++j)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        std::string::basic_string[abi:ne180100]<0>(v23, (char *)[*(id *)(*((void *)&v25 + 1) + 8 * j) UTF8String]);
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8) + 136;
        uint64_t v17 = v23;
        id v12 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v11, (unsigned __int8 *)v23, (long long **)&v17);
        uint64_t v13 = [*(id *)(a1 + 48) dataAtIndex:0 key:v23];
        Espresso::abstract_blob_container::shape((char *)&v17, *((void *)v12 + 5));
        int v14 = Espresso::layer_shape::total_dim((Espresso::layer_shape *)&v17);
        id v15 = (char *)operator new(0x60uLL);
        *((void *)v15 + 1) = 0;
        *((void *)v15 + 2) = 0;
        *(void *)id v15 = &unk_1EE3899C8;
        *((void *)v15 + 3) = &unk_1EE36BF10;
        *((_OWORD *)v15 + 4) = 0u;
        *((_OWORD *)v15 + 5) = 0u;
        *((_DWORD *)v15 + 8) = v14;
        *(void *)(v15 + 36) = 0x100000001;
        *((_DWORD *)v15 + 11) = 1;
        *((void *)v15 + 6) = v13;
        v15[56] = 0;
        uint64_t v21 = v15 + 24;
        int v22 = (std::__shared_weak_count *)v15;
        if (__p)
        {
          uint64_t v20 = __p;
          operator delete(__p);
        }
        (*(void (**)(void, void *, char **))(**((void **)v12 + 5) + 40))(*((void *)v12 + 5), a2, &v21);
        if (v22) {
          nitro::nitro_function::nitro_function(v22);
        }
        if (v24 < 0) {
          operator delete(v23[0]);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }
}

- (id)evaluate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ETTask *)self extractor];

  if (v5)
  {
    uint64_t v6 = [ETDataSourceWithExtractor alloc];
    uint64_t v7 = [(ETTask *)self extractor];
    uint64_t v8 = [(ETDataSourceWithExtractor *)v6 initWithDataSource:v4 extractor:v7];

    uint64_t v9 = [[ETDataSourceWithCache alloc] initWithDataSource:v8];
    cntrl = self->network.__cntrl_;
    v57[0] = self->network.__ptr_;
    v57[1] = cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    et_data_source::et_data_source((uint64_t)&v45, v9, (uint64_t)v57);
    std::allocate_shared[abi:ne180100]<et_data_source,std::allocator<et_data_source>,et_data_source,void>(__p, (uint64_t)&v45);
    uint64_t v11 = (std::__shared_weak_count *)__p[1];
    id v12 = (long long *)__p[0];
    v45 = &unk_1EE318948;
    std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v47 + 12, *(char **)((char *)&v48 + 4));

    if (cntrl) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
    }
  }
  else
  {
    uint64_t v13 = self->network.__cntrl_;
    v56[0] = self->network.__ptr_;
    v56[1] = v13;
    if (v13) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v13 + 1, 1uLL, memory_order_relaxed);
    }
    et_data_source::et_data_source((uint64_t)&v45, v4, (uint64_t)v56);
    std::allocate_shared[abi:ne180100]<et_data_source,std::allocator<et_data_source>,et_data_source,void>(__p, (uint64_t)&v45);
    uint64_t v11 = (std::__shared_weak_count *)__p[1];
    id v12 = (long long *)__p[0];
    v45 = &unk_1EE318948;
    std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v47 + 12, *(char **)((char *)&v48 + 4));

    if (v13) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)v13);
    }
  }
  if ([(ETTask *)self dumpData])
  {
    std::string::basic_string[abi:ne180100]<0>(v54, "/tmp/descriptors/test/");
    et_data_source::dump_blobs(v12, v54);
    if (v55 < 0) {
      operator delete((void *)v54[0]);
    }
  }
  v45 = 0;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  int v46 = 1;
  int v53 = 0;
  int v14 = [(ETTask *)self optimizer];
  int v46 = objc_msgSend(v14, "batch_size");

  ptr = self->network.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(__p, "is_training");
  Espresso::net::get_global(&v43, (uint64_t)ptr, (unsigned __int8 *)__p);
  Espresso::fill_bc(&v43, 0.0);
  if (v44) {
    nitro::nitro_function::nitro_function(v44);
  }
  if (SBYTE7(v28) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v16 = self->network.__cntrl_;
  v40[0] = self->network.__ptr_;
  v40[1] = v16;
  if (v16) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v16 + 1, 1uLL, memory_order_relaxed);
  }
  v39[0] = v12;
  v39[1] = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  Espresso::validation_options::validation_options((uint64_t)v30, (uint64_t)&v45);
  memset(v29, 0, sizeof(v29));
  Espresso::run_validation(v40, (uint64_t)v39, v30, v29, (uint64_t)&v41, v17);
  __p[0] = v29;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  if (v38 < 0) {
    operator delete(v37);
  }
  if (v36 < 0) {
    operator delete(v35);
  }
  if (v34 < 0) {
    operator delete(v33);
  }
  if (v32 < 0) {
    operator delete(v31);
  }
  if (v11) {
    nitro::nitro_function::nitro_function(v11);
  }
  if (v16) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v16);
  }
  uint64_t v18 = objc_opt_new();
  char v19 = v41;
  if (v41 != v42)
  {
    do
    {
      if (*((char *)v19 + 55) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)__p, v19[4], (std::string::size_type)v19[5]);
      }
      else
      {
        *(_OWORD *)std::string __p = *((_OWORD *)v19 + 2);
        *(void *)&long long v28 = v19[6];
      }
      DWORD2(v28) = *((_DWORD *)v19 + 14);
      uint64_t v20 = objc_msgSend(NSNumber, "numberWithFloat:", *(_OWORD *)__p, v28);
      if ((SBYTE7(v28) & 0x80u) == 0) {
        uint64_t v21 = __p;
      }
      else {
        uint64_t v21 = (void **)__p[0];
      }
      int v22 = [NSString stringWithUTF8String:v21];
      [v18 setObject:v20 forKeyedSubscript:v22];

      if (SBYTE7(v28) < 0) {
        operator delete(__p[0]);
      }
      v23 = v19[1];
      if (v23)
      {
        do
        {
          char v24 = (char **)v23;
          v23 = *(char **)v23;
        }
        while (v23);
      }
      else
      {
        do
        {
          char v24 = (char **)v19[2];
          BOOL v25 = *v24 == (char *)v19;
          char v19 = v24;
        }
        while (!v25);
      }
      char v19 = v24;
    }
    while (v24 != v42);
  }
  std::__tree<std::__value_type<std::string,std::pair<int,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<int,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<int,int>>>>::destroy(v42[0]);
  if (v11) {
    nitro::nitro_function::nitro_function(v11);
  }

  return v18;
}

- (float)fit:(id)a3 numberOfBatches:(unsigned int)a4 withProgress:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  v65[3] = *(char **)MEMORY[0x1E4F143B8];
  id v46 = a3;
  v44 = (void (**)(id, void, void *))a5;
  cntrl = self->network.__cntrl_;
  v57[0] = self->network.__ptr_;
  v57[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  et_data_source::et_data_source((uint64_t)buf, v46, (uint64_t)v57);
  uint64_t v48 = v6;
  std::allocate_shared[abi:ne180100]<et_data_source,std::allocator<et_data_source>,et_data_source,void>(&v58, (uint64_t)buf);
  *(void *)buf = &unk_1EE318948;
  std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)v65, v65[1]);

  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  if ([(ETTask *)self dumpData])
  {
    uint64_t v9 = v58;
    std::string::basic_string[abi:ne180100]<0>(__p, "/tmp/descriptors/train/");
    et_data_source::dump_blobs(v9, (const void **)__p);
    if (v56 < 0) {
      operator delete(__p[0]);
    }
  }
  id v10 = (char *)operator new(0xB0uLL);
  uint64_t v11 = v10;
  *((void *)v10 + 1) = 0;
  *((void *)v10 + 2) = 0;
  *(void *)id v10 = &unk_1EE3814C8;
  ptr = self->network.__ptr_;
  uint64_t v13 = self->network.__cntrl_;
  if (v13) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v13 + 1, 1uLL, memory_order_relaxed);
  }
  int v14 = v58;
  id v15 = v59;
  v45 = v59;
  if (v59)
  {
    atomic_fetch_add_explicit(&v59->__shared_owners_, 1uLL, memory_order_relaxed);
    *((void *)v10 + 3) = 0;
    *((void *)v10 + 4) = v14;
    *((void *)v10 + 5) = v15;
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    *((void *)v10 + 3) = 0;
    *((void *)v10 + 4) = v14;
    *((void *)v10 + 5) = 0;
  }
  *((void *)v10 + 6) = ptr;
  *((void *)v10 + 7) = v13;
  if (v13) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v13 + 1, 1uLL, memory_order_relaxed);
  }
  *((void *)v10 + 20) = 0;
  *((_OWORD *)v10 + 4) = xmmword_192DCA6A0;
  v10[80] = 1;
  *((void *)v10 + 21) = 0;
  *(_OWORD *)(v10 + 84) = 0u;
  *(_OWORD *)(v10 + 100) = 0u;
  *(_OWORD *)(v10 + 116) = 0u;
  *(_OWORD *)(v10 + 132) = 0u;
  *((_DWORD *)v10 + 37) = 0;
  *((void *)v10 + 19) = v10 + 160;
  if (v45) {
    nitro::nitro_function::nitro_function(v45);
  }
  if (v13) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v13);
  }
  uint64_t v16 = [(ETTask *)self optimizer];
  int v17 = objc_msgSend(v16, "batch_size");

  int v18 = [v46 numberOfDataPoints];
  char v19 = [MEMORY[0x1E4F1C9C8] date];
  [v19 timeIntervalSince1970];
  double v21 = v20;

  long long v50 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v47 = [(ETTask *)self optimizer];
  [v47 lr];
  float v23 = v22;
  char v24 = self->network.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(buf, "is_training");
  Espresso::net::get_global(&v53, (uint64_t)v24, buf);
  Espresso::fill_bc(&v53, 1.0);
  if (v54) {
    nitro::nitro_function::nitro_function(v54);
  }
  if ((v64[9] & 0x80000000) == 0)
  {
    if (v48) {
      goto LABEL_23;
    }
LABEL_37:
    uint64_t v49 = 0;
    goto LABEL_38;
  }
  operator delete(*(void **)buf);
  if (!v48) {
    goto LABEL_37;
  }
LABEL_23:
  uint64_t v25 = 0;
  uint64_t v49 = 0;
  unint64_t v26 = (v18 - 1) / (unint64_t)v17 + 1;
  unint64_t v27 = 1;
  do
  {
    long long v28 = (void *)MEMORY[0x192FF2020]();
    Espresso::solver_sgd::step((Espresso::solver_sgd *)(v11 + 24));
    uint64_t v30 = v25 + 1;
    if (!((v25 + 1) % v26))
    {
      objc_msgSend(v47, "lr_decay_epoch");
      float v32 = v31;
      uint64_t v33 = *((void *)v11 + 6);
      std::string::basic_string[abi:ne180100]<0>(buf, "learning_rate");
      Espresso::net::get_global(&v51, v33, buf);
      float v23 = v23 * v32;
      Espresso::fill_bc(&v51, v23);
      v35 = (Espresso *)v52;
      if (v52) {
        nitro::nitro_function::nitro_function(v52);
      }
      if ((v64[9] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      char v36 = Espresso::espresso_os_log_subsystem(v35, v34);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v49;
        __int16 v63 = 2048;
        *(double *)v64 = v23;
        _os_log_debug_impl(&dword_1920CB000, v36, OS_LOG_TYPE_DEBUG, "Epoch:%zu. LR decay lr=%f\n", buf, 0x16u);
      }

      ++v49;
    }
    if (10 * (v27 / 0xA) - 1 == v25) {
      printf("\tLoss: %.4e (%.4e) (%zu/%d/%zu)\n", *((float *)v11 + 23), *((float *)v11 + 22), v25, v48, v26);
    }
    LODWORD(v29) = *((_DWORD *)v11 + 23);
    v37 = [NSNumber numberWithFloat:v29];
    [v50 addObject:v37];

    ++v27;
    ++v25;
  }
  while (v48 != v30);
LABEL_38:
  char v38 = [MEMORY[0x1E4F1C9C8] date];
  [v38 timeIntervalSince1970];
  double v40 = v39;

  printf("%zu epochs in: %.3f s\n", v49, v40 - v21);
  v60 = @"losses";
  v61 = v50;
  v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  v44[2](v44, v48, v41);

  float v42 = *((float *)v11 + 23);
  nitro::nitro_function::nitro_function((std::__shared_weak_count *)v11);
  if (v45) {
    nitro::nitro_function::nitro_function(v45);
  }

  return v42;
}

- (float)fit:(id)a3 numberOfEpochs:(int)a4 withProgress:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(ETTask *)self optimizer];
  int v11 = objc_msgSend(v10, "batch_size");

  int v12 = [v8 numberOfDataPoints];
  uint64_t v13 = [(ETTask *)self extractor];
  unint64_t v14 = a4 * ((v12 - 1) / (unint64_t)v11) + a4;

  if (v13)
  {
    id v15 = [ETDataSourceWithExtractor alloc];
    uint64_t v16 = [(ETTask *)self extractor];
    int v17 = [(ETDataSourceWithExtractor *)v15 initWithDataSource:v8 extractor:v16];

    int v18 = [[ETDataSourceWithCache alloc] initWithDataSource:v17];
    [(ETTask *)self fit:v18 numberOfBatches:v14 withProgress:v9];
    float v20 = v19;
  }
  else
  {
    [(ETTask *)self fit:v8 numberOfBatches:v14 withProgress:v9];
    float v20 = v21;
  }

  return v20;
}

- (ETTask)initWithModelDef:(id)a3 optimizerDef:(id)a4 lossConfig:(id)a5 extractor:(id)a6
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  id v97 = a3;
  id v95 = a4;
  id v99 = a5;
  id v96 = a6;
  LODWORD(v156) = 80000;
  Espresso::create_context((int *)&v156, &v152);
  (*(void (**)(uint64_t))(*(void *)v152 + 96))(v152);
  [(ETTask *)self setOptimizer:v95];
  [(ETTask *)self setModel:v97];
  if (v96) {
    [(ETTask *)self setExtractor:v96];
  }
  [v97 gb];
  id v10 = *(net **)v156;
  uint64_t v9 = *(void *)(v156 + 8);
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->network.__cntrl_;
  self->network.__ptr_ = v10;
  self->network.__cntrl_ = (__shared_weak_count *)v9;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  p_network = (uint64_t *)&self->network;
  if (*((void *)&v156 + 1)) {
    nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v156 + 1));
  }
  uint64_t v12 = *p_network;
  v151[1] = 0;
  v151[0] = 0;
  v150 = v151;
  uint64_t v13 = *(unsigned __int8 **)(v12 + 232);
  unint64_t v14 = (unsigned __int8 *)(v12 + 240);
  if (v13 != (unsigned __int8 *)(v12 + 240))
  {
    id v15 = (void *)(v12 + 136);
    uint64_t v16 = (std::locale::id *)MEMORY[0x1E4FBA258];
    do
    {
      int v17 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(v15, v13 + 32);
      if (!v17) {
        goto LABEL_167;
      }
      uint64_t v18 = *((void *)v17 + 5);
      uint64_t v19 = *(void *)(v18 + 8);
      int v20 = *(_DWORD *)(v18 + 16);
      float v21 = [(ETTask *)self optimizer];
      int v22 = objc_msgSend(v21, "batch_size");
      *(void *)&long long v156 = v13 + 32;
      float v23 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v150, (void *)v13 + 4, (long long **)&v156);
      *((void *)v23 + 7) = v19;
      *((_DWORD *)v23 + 16) = v20;
      *((_DWORD *)v23 + 17) = v22;
      *((void *)v23 + 9) = 0xFFFFFFFF00000001;
      *((void *)v23 + 10) = 0;
      *((void *)v23 + 11) = 0;
      uint64_t v25 = v23 + 96;
      char v24 = (void *)*((void *)v23 + 12);
      if (v24)
      {
        *((void *)v23 + 13) = v24;
        operator delete(v24);
        void *v25 = 0;
        v25[1] = 0;
        v25[2] = 0;
      }
      void *v25 = 0;
      v25[1] = 0;
      v25[2] = 0;

      unint64_t v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x1E4FBA250], (uint64_t)"input_blob: ", 12);
      int v27 = (char)v13[55];
      uint64_t v28 = v27 >= 0 ? (uint64_t)(v13 + 32) : *((void *)v13 + 4);
      uint64_t v29 = v27 >= 0 ? v13[55] : *((void *)v13 + 5);
      uint64_t v30 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, v28, v29);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v30, (uint64_t)", batch_size: ", 14);
      if (!std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(v15, v13 + 32))LABEL_167:std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found"); {
      float v31 = (void *)std::ostream::operator<<();
      }
      std::ios_base::getloc((const std::ios_base *)((char *)v31 + *(void *)(*v31 - 24)));
      float v32 = std::locale::use_facet((const std::locale *)&v156, v16);
      ((void (*)(const std::locale::facet *, uint64_t))v32->__vftable[2].~facet_0)(v32, 10);
      std::locale::~locale((std::locale *)&v156);
      std::ostream::put();
      std::ostream::flush();
      uint64_t v33 = (unsigned __int8 *)*((void *)v13 + 1);
      if (v33)
      {
        do
        {
          char v34 = v33;
          uint64_t v33 = *(unsigned __int8 **)v33;
        }
        while (v33);
      }
      else
      {
        do
        {
          char v34 = (unsigned __int8 *)*((void *)v13 + 2);
          BOOL v35 = *(void *)v34 == (void)v13;
          uint64_t v13 = v34;
        }
        while (!v35);
      }
      uint64_t v13 = v34;
    }
    while (v34 != v14);
    uint64_t v12 = *p_network;
  }
  char v36 = self->network.__cntrl_;
  v148[0] = v12;
  v148[1] = (uint64_t)v36;
  if (v36) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v36 + 1, 1uLL, memory_order_relaxed);
  }
  Espresso::compute_network_shape_starting_from_data_shapes(v148, (uint64_t)&v150, (uint64_t)v149);
  if (v36) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v36);
  }
  ptr = self->network.__ptr_;
  char v38 = self->network.__cntrl_;
  if (v38) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v38 + 1, 1uLL, memory_order_relaxed);
  }
  Espresso::shape_network_recursive((Espresso *)ptr, (Espresso::net *)v149, 0, 0);
  if (v38) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v38);
  }
  double v39 = self->network.__cntrl_;
  v145[0] = (uint64_t)self->network.__ptr_;
  v145[1] = (uint64_t)v39;
  if (v39) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v39 + 1, 1uLL, memory_order_relaxed);
  }
  double v40 = (std::__shared_weak_count *)v153;
  v144[0] = v152;
  v144[1] = v153;
  if (v153) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v153 + 8), 1uLL, memory_order_relaxed);
  }
  v143[1] = 0;
  v143[0] = 0;
  Espresso::sequential_builder::sequential_builder((Espresso::sequential_builder *)&v146, v145, v144, 0, v143);
  if (v40) {
    nitro::nitro_function::nitro_function(v40);
  }
  if (v39) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v39);
  }
  v41 = objc_msgSend(v99, "label_name");
  if (v41)
  {
    objc_msgSend(v99, "label_name");
    double v39 = (__shared_weak_count *) objc_claimAutoreleasedReturnValue();
    float v42 = (char *)[(__shared_weak_count *)v39 UTF8String];
  }
  else
  {
    float v42 = "label";
  }
  std::string::basic_string[abi:ne180100]<0>(&__s, v42);
  if (v41) {

  }
  uint64_t v43 = objc_msgSend(v99, "label_shape");
  BOOL v44 = v43 == 0;

  if (v44)
  {
    if (!std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::find<std::string>((void *)(*p_network + 136), (unsigned __int8 *)&__s))
    {
      v61 = [(ETTask *)self optimizer];
      uint64_t v126 = 0;
      long long v124 = 0u;
      long long v125 = 0u;
      uint64_t v120 = 0x100000001;
      int v121 = 1;
      int v122 = objc_msgSend(v61, "batch_size");
      unint64_t v123 = 0xFFFFFFFF00000001;
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v119, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
      }
      else {
        std::string v119 = __s;
      }
      Espresso::sequential_builder::placeholder((Espresso::sequential_builder *)&v146, (char *)&v120, (std::string::size_type)&v119, (uint64_t)&v127);
      if (v128 < 0) {
        operator delete(v127);
      }
      if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v119.__r_.__value_.__l.__data_);
      }
      if ((void)v125)
      {
        *((void *)&v125 + 1) = v125;
        operator delete((void *)v125);
      }
    }
  }
  else
  {
    long long v115 = 0uLL;
    uint64_t v116 = 0;
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    v45 = objc_msgSend(v99, "label_shape");
    id v46 = 0;
    uint64_t v47 = [v45 countByEnumeratingWithState:&v138 objects:v166 count:16];
    if (v47)
    {
      unint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v50 = *(void *)v139;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v139 != v50) {
            objc_enumerationMutation(v45);
          }
          int v52 = [*(id *)(*((void *)&v138 + 1) + 8 * i) intValue];
          int v53 = v52;
          if ((unint64_t)v49 >= v48)
          {
            uint64_t v54 = (v49 - v46) >> 2;
            unint64_t v55 = v54 + 1;
            if ((unint64_t)(v54 + 1) >> 62) {
              std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
            }
            if ((uint64_t)(v48 - (void)v46) >> 1 > v55) {
              unint64_t v55 = (uint64_t)(v48 - (void)v46) >> 1;
            }
            if (v48 - (unint64_t)v46 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v56 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v56 = v55;
            }
            if (v56) {
              unint64_t v56 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v56);
            }
            else {
              uint64_t v57 = 0;
            }
            v58 = (char *)(v56 + 4 * v54);
            *(_DWORD *)v58 = v53;
            v59 = v58 + 4;
            while (v49 != v46)
            {
              int v60 = *((_DWORD *)v49 - 1);
              v49 -= 4;
              *((_DWORD *)v58 - 1) = v60;
              v58 -= 4;
            }
            unint64_t v48 = v56 + 4 * v57;
            *(void *)&long long v115 = v58;
            *((void *)&v115 + 1) = v59;
            uint64_t v116 = v48;
            if (v46) {
              operator delete(v46);
            }
            id v46 = v58;
            uint64_t v49 = v59;
          }
          else
          {
            *(_DWORD *)uint64_t v49 = v52;
            v49 += 4;
          }
          *((void *)&v115 + 1) = v49;
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v138 objects:v166 count:16];
      }
      while (v47);
      id v46 = (char *)v115;
    }
    else
    {
      uint64_t v49 = 0;
    }

    memset(&v137, 0, sizeof(v137));
    uint64_t v62 = v49 - v46;
    if (v49 != v46)
    {
      uint64_t v63 = v62 >> 2;
      if ((unint64_t)(v62 >> 2) <= 1) {
        uint64_t v63 = 1;
      }
      v64 = &v137;
      v65 = v46;
      do
      {
        int v66 = *(_DWORD *)v65;
        v65 += 4;
        LODWORD(v64->__r_.__value_.__l.__data_) = v66;
        v64 = (std::string *)((char *)v64 + 4);
        --v63;
      }
      while (v63);
    }
    HIDWORD(v137.__r_.__value_.__r.__words[2]) = (unint64_t)v62 >> 2;
    Espresso::layer_nd_shape::to_canonical_5d_shape((Espresso::layer_nd_shape *)&v137, 0, (uint64_t)&v156);
    if (std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::find<std::string>((void *)(*p_network + 136), (unsigned __int8 *)&__s))
    {
      uint64_t v67 = *p_network + 136;
      v118.__r_.__value_.__r.__words[0] = (std::string::size_type)&__s;
      v68 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v67, (unsigned __int8 *)&__s, (long long **)&v118);
      Espresso::abstract_blob_container::shape((char *)&v162, *((void *)v68 + 5));
      BOOL v69 = Espresso::layer_shape::operator==((uint64_t)&v156, (uint64_t)&v162);
      if (v164.__r_.__value_.__r.__words[2])
      {
        *(void *)&long long v165 = *((void *)&v164.__r_.__value_.__l + 2);
        operator delete((void *)v164.__r_.__value_.__r.__words[2]);
      }
      if (!v69)
      {
        p_s = &__s;
        if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
        }
        *(void *)&long long v162 = p_s;
        Espresso::throw_exception_selector<Espresso::generic_error,char const*&>("label blob of name %s already exists with inconsistant shape", &v162);
      }
    }
    else
    {
      v130[0] = v156;
      v130[1] = *(_OWORD *)v157;
      uint64_t v131 = *(void *)&v157[16];
      v132 = 0;
      v133 = 0;
      uint64_t v134 = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v132, v158, *(uint64_t *)&v159[0], (uint64_t)(*(void *)&v159[0] - (void)v158) >> 2);
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v129, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
      }
      else {
        std::string v129 = __s;
      }
      Espresso::sequential_builder::placeholder((Espresso::sequential_builder *)&v146, (char *)v130, (std::string::size_type)&v129, (uint64_t)&v135);
      if (v136 < 0) {
        operator delete(v135);
      }
      if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v129.__r_.__value_.__l.__data_);
      }
      if (v132)
      {
        v133 = v132;
        operator delete(v132);
      }
    }
    if (v158)
    {
      *(void *)&v159[0] = v158;
      operator delete(v158);
    }
    if (v46) {
      operator delete(v46);
    }
  }
  v71 = objc_msgSend(v99, "output_name");
  if (v71)
  {
    objc_msgSend(v99, "output_name");
    id v72 = objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(&v137, (char *)[v72 UTF8String]);
  }
  else
  {
    uint64_t v73 = *(void *)(v147 + 256);
    if (*(char *)(v73 + 55) < 0) {
      std::string::__init_copy_ctor_external(&v137, *(const std::string::value_type **)(v73 + 32), *(void *)(v73 + 40));
    }
    else {
      std::string v137 = *(std::string *)(v73 + 32);
    }
  }

  memset(&v118, 0, sizeof(v118));
  v74 = objc_msgSend(v99, "loss_name");
  BOOL v75 = v74 == 0;

  if (!v75)
  {
    objc_msgSend(v99, "loss_name");
    id v76 = objc_claimAutoreleasedReturnValue();
    MEMORY[0x192FF0F50](&v118, [v76 UTF8String]);
  }
  if ([v99 mode] == 1)
  {
    v77 = objc_msgSend(v99, "loss_name");
    BOOL v78 = v77 == 0;

    if (v78) {
      MEMORY[0x192FF0F50](&v118, "cross_entropy");
    }
    long long v115 = xmmword_192DCA290;
    uint64_t v116 = 1;
    int v117 = 257;
    *(void *)&long long v162 = &v137;
    v79 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v147 + 136, (unsigned __int8 *)&v137, (long long **)&v162);
    Espresso::abstract_blob_container::shape((char *)&v156, *((void *)v79 + 5));
    DWORD1(v115) = DWORD2(v156);
    if (v158)
    {
      *(void *)&v159[0] = v158;
      operator delete(v158);
    }
    std::string::basic_string[abi:ne180100]<0>(v111, "softmax");
    std::string::basic_string[abi:ne180100]<0>(&v110, "s");
    if (SHIBYTE(v137.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v156, v137.__r_.__value_.__l.__data_, v137.__r_.__value_.__l.__size_);
    }
    else
    {
      long long v156 = *(_OWORD *)&v137.__r_.__value_.__l.__data_;
      *(void *)v157 = *((void *)&v137.__r_.__value_.__l + 2);
    }
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v157[8], __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
    }
    else
    {
      *(_OWORD *)&v157[8] = *(_OWORD *)&__s.__r_.__value_.__l.__data_;
      v158 = (void *)__s.__r_.__value_.__r.__words[2];
    }
    v107 = 0;
    v108 = 0;
    v109 = 0;
    *(void *)&long long v162 = &v107;
    BYTE8(v162) = 0;
    v107 = (std::string *)operator new(0x30uLL);
    v108 = v107;
    v109 = v107 + 2;
    v108 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v109, &v156, v159, v107);
    std::string::basic_string[abi:ne180100]<0>(&v162, "prediction");
    if (SHIBYTE(v118.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v164, v118.__r_.__value_.__l.__data_, v118.__r_.__value_.__l.__size_);
    }
    else {
      std::string v164 = v118;
    }
    v104 = 0;
    v105 = 0;
    v106 = 0;
    v154 = &v104;
    LOBYTE(v155) = 0;
    v104 = (std::string *)operator new(0x30uLL);
    v105 = v104;
    v106 = v104 + 2;
    v105 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v106, &v162, &v165, v104);
    Espresso::sequential_builder::add<Espresso::softmax_params>(&v113, &v146, (uint64_t)v111, (uint64_t)&v110, (uint64_t)&v115, (uint64_t)v107, (uint64_t)v108, (uint64_t *)&v104);
    if (v114) {
      nitro::nitro_function::nitro_function(v114);
    }
    v154 = &v104;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v154);
    uint64_t v80 = 0;
    while (1)
    {
      if (SHIBYTE(v164.__r_.__value_.__r.__words[v80 + 2]) < 0) {
        operator delete(*(void **)((char *)&v164.__r_.__value_.__l.__data_ + v80 * 8));
      }
      v80 -= 3;
      if (v80 == -6)
      {
        *(void *)&long long v162 = &v107;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v162);
        uint64_t v81 = 0;
        while (1)
        {
          if (*((char *)&v158 + v81 + 7) < 0) {
            operator delete(*(void **)&v157[v81 + 8]);
          }
          v81 -= 24;
          if (v81 == -48)
          {
            if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v110.__r_.__value_.__l.__data_);
            }
            if (v112 < 0) {
              operator delete(v111[0]);
            }
            Espresso::sequential_builder::build_from_shapes((uint64_t)&v146, v146, 1, &v102);
            if (v103) {
              nitro::nitro_function::nitro_function(v103);
            }
            if (self)
            {
              [(ETTask *)self reinitializeVariables];
            }
            else
            {
              long long v162 = 0uLL;
              uint64_t v163 = 0;
            }
            std::string::basic_string[abi:ne180100]<0>(&v115, "is_training");
            Espresso::mark_block_start(p_network, (uint64_t)&v115, 1);
            [v97 gb];
            uint64_t v82 = v156;
            memset(v101, 0, sizeof(v101));
            std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v101, v162, *((uint64_t *)&v162 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v162 + 1) - v162) >> 3));
            Espresso::gradient_builder::build_gradient(v82, (long long *)&v118, v101, v111);
            v110.__r_.__value_.__r.__words[0] = (std::string::size_type)v101;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v110);
            if (*((void *)&v156 + 1)) {
              nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v156 + 1));
            }
            id v83 = v95;
            v84 = v83;
            v85 = self->network.__ptr_;
            v86 = self->network.__cntrl_;
            if (v86) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)v86 + 1, 1uLL, memory_order_relaxed);
            }
            [v83 lr];
            float v88 = v87;
            [v84 momentum];
            float v90 = v89;
            std::string::basic_string[abi:ne180100]<0>(&v110, "learning_rate");
            Espresso::sgd_optimizer_builder::sgd_optimizer_builder((uint64_t)&v156, (uint64_t)v85, (std::__shared_weak_count *)v86, (uint64_t)&v162, (uint64_t)v111, &v110, v88, v90);
            if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v110.__r_.__value_.__l.__data_);
            }
            if (v86) {
              nitro::nitro_function::nitro_function((std::__shared_weak_count *)v86);
            }
            (*(void (**)(long long *))(v156 + 16))(&v156);
            uint64_t v91 = *v160;
            if (v160[1] != *v160)
            {
              uint64_t v92 = 0;
              unint64_t v93 = 0;
              do
              {
                (*(void (**)(long long *, uint64_t, uint64_t))(v156 + 32))(&v156, v91 + v92, *v161 + v92);
                ++v93;
                uint64_t v91 = *v160;
                v92 += 24;
              }
              while (v93 < 0xAAAAAAAAAAAAAAABLL * ((v160[1] - *v160) >> 3));
            }
            (*(void (**)(long long *))(v156 + 24))(&v156);
            Espresso::sequential_builder::build_from_shapes((uint64_t)&v156 + 8, *((uint64_t *)&v156 + 1), 1, &v110);
            if (v110.__r_.__value_.__l.__size_) {
              nitro::nitro_function::nitro_function((std::__shared_weak_count *)v110.__r_.__value_.__l.__size_);
            }
            Espresso::mark_block_end(p_network, (uint64_t)&v115);
            Espresso::guard_block_with_if (*p_network, (uint64_t)&v115);
          }
        }
      }
    }
  }
  Espresso::throw_exception_selector<Espresso::not_implemented_error,ETLossMode>([v99 mode]);
}

- (ETTask)initWithModelDef:(id)a3 optimizerDef:(id)a4 lossConfig:(id)a5
{
  return [(ETTask *)self initWithModelDef:a3 optimizerDef:a4 lossConfig:a5 extractor:0];
}

- (vector<std::string,)reinitializeVariables
{
  void (***v49)(uint64_t *__return_ptr, void);
  std::__shared_weak_count *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  std::__shared_weak_count *v58;
  void (***v59)(uint64_t *__return_ptr, void);
  void *v60;
  void *v61;
  int v62;
  int v63;
  vector<std::string, std::allocator<std::string>> *result;
  void **v65;
  void **v66;
  uint64_t v67;
  ETTask *v68;
  void *v69;
  vector<std::string, std::allocator<std::string>> *v70;
  uint64_t v71;
  uint64_t v72;
  std::__shared_weak_count *v73;
  void *__p[2];
  unsigned __int8 v75;
  void *v76[2];
  int64_t v77;
  long long v78;
  long long v79;
  long long v80;
  long long v81;
  uint64_t v82;
  std::__shared_weak_count *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void *v87;
  uint64_t v88;
  std::__shared_weak_count *v89;
  uint64_t v90;
  std::__shared_weak_count *v91;
  unsigned char v92[128];
  uint64_t v93;

  v3 = self;
  id v4 = retstr;
  unint64_t v93 = *MEMORY[0x1E4F143B8];
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  BOOL v78 = 0u;
  v79 = 0u;
  uint64_t v80 = 0u;
  uint64_t v81 = 0u;
  uint64_t v5 = [(ETTask *)self model];
  uint64_t v6 = [v5 variables];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v78 objects:v92 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v79;
    unsigned int v9 = 1991;
    BOOL v69 = v6;
    v70 = v4;
    uint64_t v67 = *(void *)v79;
    v68 = v3;
    do
    {
      uint64_t v10 = 0;
      v71 = v7;
      do
      {
        if (*(void *)v79 != v8) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v78 + 1) + 8 * v10);
        objc_msgSend(v11, "name", v67);
        id v12 = objc_claimAutoreleasedReturnValue();
        std::string::basic_string[abi:ne180100]<0>(v76, (char *)[v12 UTF8String]);

        id v13 = [v11 layerName];
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v13 UTF8String]);

        Espresso::net::get_global(&v72, (uint64_t)v3->network.__ptr_, (unsigned __int8 *)v76);
        if (![v11 initializationMode])
        {
          uint64_t v16 = v71;
          goto LABEL_102;
        }
        end = (std::string *)v4->__end_;
        if (end >= v4->__end_cap_.__value_)
        {
          int v17 = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)v4, (uint64_t)v76);
        }
        else
        {
          if (SHIBYTE(v77) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)v4->__end_, (const std::string::value_type *)v76[0], (std::string::size_type)v76[1]);
          }
          else
          {
            long long v15 = *(_OWORD *)v76;
            end->__r_.__value_.__r.__words[2] = v77;
            *(_OWORD *)&end->__r_.__value_.__l.__data_ = v15;
          }
          int v17 = end + 1;
          v4->__end_ = &end[1];
        }
        v4->__end_ = v17;
        if ([v11 initializationMode] == 7
          || [v11 initializationMode] == 1 && objc_msgSend(v11, "kind") == 1)
        {
          ptr = v3->network.__ptr_;
          int v20 = (uint64_t *)*((void *)ptr + 4);
          uint64_t v19 = (uint64_t *)*((void *)ptr + 5);
          unsigned __int8 v21 = v75;
          if (v20 == v19) {
            goto LABEL_113;
          }
          int v22 = (void **)__p[0];
          if ((v75 & 0x80u) == 0) {
            unint64_t v23 = v75;
          }
          else {
            unint64_t v23 = (unint64_t)__p[1];
          }
          if ((v75 & 0x80u) == 0) {
            char v24 = __p;
          }
          else {
            char v24 = (void **)__p[0];
          }
          while (1)
          {
            uint64_t v25 = *v20;
            uint64_t v26 = *(unsigned __int8 *)(*v20 + 39);
            if ((v26 & 0x80u) == 0) {
              int v27 = (void *)*(unsigned __int8 *)(*v20 + 39);
            }
            else {
              int v27 = *(void **)(*v20 + 24);
            }
            if (v27 == (void *)v23)
            {
              uint64_t v28 = (const void **)(v25 + 16);
              if ((v26 & 0x80) != 0)
              {
                if (!memcmp(*v28, v24, *(void *)(*v20 + 24)))
                {
LABEL_35:
                  uint64_t v30 = *(const void **)(v25 + 64);
                  if (v30)
                  {
                    id v4 = v70;
                    if (v31)
                    {
                      float v32 = *(std::__shared_weak_count **)(v25 + 72);
                      uint64_t v8 = v67;
                      if (v32) {
                        atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
                      }
                      v3 = v68;
                      uint64_t v33 = *(unsigned int *)((*(uint64_t (**)(void *))(*(void *)v31 + 384))(v31) + 4);
                      if (v32) {
                        goto LABEL_40;
                      }
                      goto LABEL_41;
                    }
                    if (v60)
                    {
                      v61 = v60;
                      float v32 = *(std::__shared_weak_count **)(v25 + 72);
                      if (v32) {
                        atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
                      }
                      v3 = v68;
                      uint64_t v62 = *(_DWORD *)((*(uint64_t (**)(void *))(*(void *)v60 + 384))(v60) + 48);
                      uint64_t v63 = *(_DWORD *)((*(uint64_t (**)(void *))(*(void *)v61 + 384))(v61) + 52);
                      uint64_t v33 = v63
                          * (uint64_t)v62
                          * *(int *)((*(uint64_t (**)(void *))(*(void *)v61 + 384))(v61) + 44);
                      uint64_t v8 = v67;
                      if (v32) {
LABEL_40:
                      }
                        nitro::nitro_function::nitro_function(v32);
LABEL_41:
                      if (v33)
                      {
                        uint64_t v34 = v72;
                        (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)v72 + 56))(&v82, v72);
                        unint64_t v35 = 0;
                        uint64_t v36 = v82;
                        double v37 = sqrtf(3.0 / (float)(unint64_t)v33);
                        unint64_t v38 = *(int *)(v82 + 8);
                        uint64_t v6 = v69;
                        while (1)
                        {
                          uint64_t v39 = 12;
                          unint64_t v40 = v38;
                          do
                          {
                            v40 *= *(int *)(v36 + v39);
                            v39 += 4;
                          }
                          while (v39 != 24);
                          if (v40 <= v35) {
                            break;
                          }
                          unsigned int v41 = 48271 * (v9 % 0xADC8);
                          unsigned int v42 = 3399 * (v9 / 0xADC8);
                          BOOL v43 = v41 >= v42;
                          unsigned int v44 = v41 - v42;
                          if (v43) {
                            int v45 = 0;
                          }
                          else {
                            int v45 = 0x7FFFFFFF;
                          }
                          unsigned int v9 = v45 + v44;
                          double v46 = ((float)((float)((float)(v45 + v44 - 1) * 4.6566e-10) + 0.0) + -0.5) * v37;
                          *(float *)&double v46 = v46 + v46;
                          *(_DWORD *)(*(void *)(v36 + 24) + 4 * v35++) = LODWORD(v46);
                        }
                        uint64_t v47 = v73;
                        if (v73) {
                          atomic_fetch_add_explicit(&v73->__shared_owners_, 1uLL, memory_order_relaxed);
                        }
                        unint64_t v48 = v83;
                        if (v83) {
                          atomic_fetch_add_explicit(&v83->__shared_owners_, 1uLL, memory_order_relaxed);
                        }
                        uint64_t v49 = *(void (****)(uint64_t *__return_ptr, void))(v34 + 72);
                        v84 = MEMORY[0x1E4F143A8];
                        v85 = 3321888768;
                        v86 = ___ZN8Espresso19sync_copy_from_hostENSt3__110shared_ptrINS_23abstract_blob_containerEEENS1_INS_4blobIfLi4EEEEE_block_invoke_13442;
                        float v87 = &__block_descriptor_64_ea8_32c62_ZTSNSt3__110shared_ptrIN8Espresso23abstract_blob_containerEEE48c49_ZTSNSt3__110shared_ptrIN8Espresso4blobIfLi4EEEEE_e10_v16__0r_v8l;
                        float v88 = v34;
                        float v89 = v47;
                        if (v47) {
                          atomic_fetch_add_explicit(&v47->__shared_owners_, 1uLL, memory_order_relaxed);
                        }
                        float v90 = v36;
                        uint64_t v91 = v48;
                        if (v48) {
                          atomic_fetch_add_explicit(&v48->__shared_owners_, 1uLL, memory_order_relaxed);
                        }
                        Espresso::abstract_context::compute_batch_sync(v49, &v84);
                        if (v91) {
                          nitro::nitro_function::nitro_function(v91);
                        }
                        if (v89) {
                          nitro::nitro_function::nitro_function(v89);
                        }
                        if (v48) {
                          nitro::nitro_function::nitro_function(v48);
                        }
                        if (v47) {
                          nitro::nitro_function::nitro_function(v47);
                        }
                        uint64_t v50 = v83;
                        uint64_t v16 = v71;
                        if (!v83) {
                          goto LABEL_102;
                        }
LABEL_93:
                        nitro::nitro_function::nitro_function(v50);
                        goto LABEL_102;
                      }
                      unsigned __int8 v21 = v75;
                    }
                  }
LABEL_113:
                  int v22 = (void **)__p[0];
LABEL_114:
                  if ((v21 & 0x80u) == 0) {
                    v65 = __p;
                  }
                  else {
                    v65 = v22;
                  }
                  if (v77 >= 0) {
                    int v66 = v76;
                  }
                  else {
                    int v66 = (void **)v76[0];
                  }
                  Espresso::throw_exception_selector<Espresso::generic_error,char const*,char const*>("Layer %s for variable %s cannot be found", (uint64_t)v65, (uint64_t)v66);
                }
              }
              else
              {
                if (!*(unsigned char *)(*v20 + 39)) {
                  goto LABEL_35;
                }
                uint64_t v29 = v24;
                while (*(unsigned __int8 *)v28 == *(unsigned __int8 *)v29)
                {
                  uint64_t v28 = (const void **)((char *)v28 + 1);
                  uint64_t v29 = (void **)((char *)v29 + 1);
                  if (!--v26) {
                    goto LABEL_35;
                  }
                }
              }
            }
            v20 += 2;
            if (v20 == v19) {
              goto LABEL_114;
            }
          }
        }
        if ([v11 initializationMode] != 3
          && ([v11 initializationMode] != 1 || objc_msgSend(v11, "kind") != 2))
        {
          uint64_t v16 = v71;
          if ([v11 initializationMode] != 2) {
            Espresso::throw_exception_selector<Espresso::not_implemented_error,ETVariableInitializationMode>([v11 initializationMode]);
          }
          goto LABEL_102;
        }
        uint64_t v51 = v72;
        (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)v72 + 56))(&v82, v72);
        int v52 = 0;
        int v53 = v82;
        uint64_t v54 = *(int *)(v82 + 8);
        while (1)
        {
          unint64_t v55 = 12;
          unint64_t v56 = v54;
          do
          {
            v56 *= *(int *)(v53 + v55);
            v55 += 4;
          }
          while (v55 != 24);
          if (v56 <= v52) {
            break;
          }
          *(_DWORD *)(*(void *)(v53 + 24) + 4 * v52++) = 0;
        }
        uint64_t v57 = v73;
        if (v73) {
          atomic_fetch_add_explicit(&v73->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        v58 = v83;
        if (v83) {
          atomic_fetch_add_explicit(&v83->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        v59 = *(void (****)(uint64_t *__return_ptr, void))(v51 + 72);
        v84 = MEMORY[0x1E4F143A8];
        v85 = 3321888768;
        v86 = ___ZN8Espresso19sync_copy_from_hostENSt3__110shared_ptrINS_23abstract_blob_containerEEENS1_INS_4blobIfLi4EEEEE_block_invoke_13442;
        float v87 = &__block_descriptor_64_ea8_32c62_ZTSNSt3__110shared_ptrIN8Espresso23abstract_blob_containerEEE48c49_ZTSNSt3__110shared_ptrIN8Espresso4blobIfLi4EEEEE_e10_v16__0r_v8l;
        float v88 = v51;
        float v89 = v57;
        if (v57) {
          atomic_fetch_add_explicit(&v57->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        float v90 = v53;
        uint64_t v91 = v58;
        uint64_t v16 = v71;
        if (v58) {
          atomic_fetch_add_explicit(&v58->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        Espresso::abstract_context::compute_batch_sync(v59, &v84);
        if (v91) {
          nitro::nitro_function::nitro_function(v91);
        }
        if (v89) {
          nitro::nitro_function::nitro_function(v89);
        }
        if (v58) {
          nitro::nitro_function::nitro_function(v58);
        }
        if (v57) {
          nitro::nitro_function::nitro_function(v57);
        }
        uint64_t v50 = v83;
        if (v83) {
          goto LABEL_93;
        }
LABEL_102:
        if (v73) {
          nitro::nitro_function::nitro_function(v73);
        }
        if ((char)v75 < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v77) < 0) {
          operator delete(v76[0]);
        }
        ++v10;
      }
      while (v10 != v16);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v78 objects:v92 count:16];
    }
    while (v7);
  }

  return result;
}

- (ETTask)initWithModelDef:(id)a3 optimizerDef:(id)a4 extractor:(id)a5 needWeightsInitialization:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (ETTask *)objc_opt_new();

  [(ETTask *)v13 setExtractor:v12];
  [(ETTask *)v13 setModel:v10];
  [(ETTask *)v13 setOptimizer:v11];
  if (v6)
  {
    unint64_t v14 = [(ETTask *)v13 model];
    long long v15 = v14;
    if (v14)
    {
      [v14 network];
    }
    else
    {
      uint64_t v30 = 0;
      float v31 = 0;
    }
    Espresso::trainer::initialize_weights((uint64_t)&v30);
    if (v31) {
      nitro::nitro_function::nitro_function(v31);
    }
  }
  char v29 = 1;
  uint64_t v16 = [(ETTask *)v13 model];
  int v17 = v16;
  if (v16)
  {
    [v16 network];
  }
  else
  {
    uint64_t v22 = 0;
    unint64_t v23 = 0;
  }
  Espresso::gradient_builder::gradient_builder((uint64_t)v24, &v22, &v29);
  if (v23) {
    nitro::nitro_function::nitro_function(v23);
  }

  uint64_t v18 = v25;
  if (v25)
  {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v19 = v13;
    nitro::nitro_function::nitro_function(v18);
  }
  else
  {
    int v20 = v13;
  }
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)&v28);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v27, v27[1]);
  if (v26) {
    nitro::nitro_function::nitro_function(v26);
  }
  if (v25) {
    nitro::nitro_function::nitro_function(v25);
  }

  return v13;
}

- (ETTask)initWithModelDef:(id)a3 optimizerDef:(id)a4 extractor:(id)a5
{
  return [(ETTask *)self initWithModelDef:a3 optimizerDef:a4 extractor:a5 needWeightsInitialization:1];
}

- (ETTask)init
{
  v4.receiver = self;
  v4.super_class = (Class)ETTask;
  v2 = [(ETTask *)&v4 init];
  [(ETTask *)v2 setDumpData:0];
  return v2;
}

@end