@interface ETModelDef
- (ETModelDef)initWithNetwork:(id)a3;
- (NSMutableArray)all_variables;
- (id).cxx_construct;
- (id)layerNames;
- (id)variableForLayer:(id)a3 kind:(unint64_t)a4;
- (id)variableNameForLayer:(id)a3 kind:(unint64_t)a4;
- (id)variables;
- (int)configureLayersToTrain:(id)a3 reinitializeVariables:(BOOL)a4;
- (shared_ptr<Espresso::blob<float,)biasesForLayer:(id)a3;
- (shared_ptr<Espresso::blob<float,)weightsForLayer:(id)a3;
- (shared_ptr<Espresso::gradient_builder>)gb;
- (shared_ptr<Espresso::net>)network;
- (shared_ptr<std::string>)topNamesForLayerIndex:(int)a3;
- (void)layerForName:(id)a3;
- (void)randomizeWeightsForLayer:(id)a3 withSeed:(float)a4;
- (void)setAll_variables:(id)a3;
- (void)setGb:(shared_ptr<Espresso::gradient_builder>)a3;
- (void)setNetwork:(shared_ptr<Espresso::net>)a3;
- (void)transformForTraining:(shared_ptr<Espresso::net>)a3;
- (void)updateLayer:(id)a3 withBiases:(shared_ptr<float>)a4 length:(unint64_t)a5;
- (void)updateLayer:(id)a3 withWeights:(shared_ptr<float>)a4 length:(unint64_t)a5;
@end

@implementation ETModelDef

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 1) = (char *)self + 16;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_gb.__cntrl_;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_network.__cntrl_;
  if (v4) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v4);
  }
  objc_storeStrong((id *)&self->_all_variables, 0);
  left = (char *)self->layer_variable_names.__tree_.__pair1_.__value_.__left_;

  std::__tree<std::__value_type<std::string,std::vector<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::string>>>>::destroy((uint64_t)&self->layer_variable_names, left);
}

- (void)setGb:(shared_ptr<Espresso::gradient_builder>)a3
{
}

- (shared_ptr<Espresso::gradient_builder>)gb
{
  objc_copyCppObjectAtomic(v2, &self->_gb, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__94);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setAll_variables:(id)a3
{
}

- (NSMutableArray)all_variables
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNetwork:(shared_ptr<Espresso::net>)a3
{
}

- (shared_ptr<Espresso::net>)network
{
  objc_copyCppObjectAtomic(v2, &self->_network, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__13490);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (id)layerNames
{
  v3 = objc_opt_new();
  uint64_t v4 = *((void *)self->_network.__ptr_ + 4);
  if (*((void *)self->_network.__ptr_ + 5) != v4)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = v4 + v5;
      uint64_t v8 = *(void *)(v4 + v5);
      v9 = *(std::__shared_weak_count **)(v7 + 8);
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v10 = (void *)(v8 + 16);
      if (*(char *)(v8 + 39) < 0) {
        v10 = (void *)*v10;
      }
      v11 = [NSString stringWithUTF8String:v10];
      [v3 addObject:v11];

      if (v9) {
        nitro::nitro_function::nitro_function(v9);
      }
      ++v6;
      uint64_t v4 = *((void *)self->_network.__ptr_ + 4);
      v5 += 16;
    }
    while (v6 < (*((void *)self->_network.__ptr_ + 5) - v4) >> 4);
  }

  return v3;
}

- (id)variableForLayer:(id)a3 kind:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [(ETModelDef *)self all_variables];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = [v11 layerName];
        if ([v12 isEqualToString:v6])
        {
          BOOL v13 = [v11 kind] == a4;

          if (v13)
          {
            id v14 = v11;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  id v14 = 0;
LABEL_13:

  return v14;
}

- (id)variables
{
  return self->_all_variables;
}

- (int)configureLayersToTrain:(id)a3 reinitializeVariables:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [(ETModelDef *)self variables];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    if (v4) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        BOOL v13 = [v12 layerName];
        int v14 = [v6 containsObject:v13];

        if (v14) {
          [v12 setInitializationMode:v10];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return 0;
}

- (id)variableNameForLayer:(id)a3 kind:(unint64_t)a4
{
  BOOL v4 = [(ETModelDef *)self variableForLayer:a3 kind:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 name];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)randomizeWeightsForLayer:(id)a3 withSeed:(float)a4
{
  void (***v38)(uint64_t *__return_ptr, void);
  uint64_t v39;
  std::__shared_weak_count *v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  void v43[5];
  std::__shared_weak_count *v44;
  uint64_t v45;
  std::__shared_weak_count *v46;

  id v6 = a3;
  uint64_t v7 = [(ETModelDef *)self layerForName:v6];
  uint64_t v8 = v7;
  if (!v7)
  {
    v43[0] = [v6 UTF8String];
    Espresso::throw_exception_selector<Espresso::generic_error,char const*&>("layer with name %s not found", v43);
  }
  uint64_t v9 = (const void *)v7[8];
  if (v9)
  {
    if (v10)
    {
      v11 = v10;
      v12 = (std::__shared_weak_count *)v8[9];
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      BOOL v13 = operator new(0x20uLL);
      int v14 = v13;
      v13[1] = 0;
      v13[2] = 0;
      *BOOL v13 = &unk_1EE386C10;
      unsigned int v15 = (int)a4 + (((int)a4 / 0x7FFFFFFFu) | (((int)a4 / 0x7FFFFFFFu) << 31));
      if (v15 <= 1) {
        unsigned int v15 = 1;
      }
      *((_DWORD *)v13 + 6) = v15;
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      (*(void (**)(uint64_t *__return_ptr, const void *, uint64_t))(*(void *)v11 + 320))(&v41, v11, 1);
      (*(void (**)(uint64_t *__return_ptr))(*(void *)v41 + 56))(&v39);
      if (v16)
      {
        long long v17 = v16;
        if (v12) {
          atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        int v18 = *(_DWORD *)((*(uint64_t (**)(void *))(*(void *)v16 + 384))(v16) + 48);
        int v19 = *(_DWORD *)((*(uint64_t (**)(void *))(*(void *)v17 + 384))(v17) + 52);
        float v20 = (float)(v19 * v18 * *(_DWORD *)((*(uint64_t (**)(void *))(*(void *)v17 + 384))(v17) + 44));
        if (v12) {
          nitro::nitro_function::nitro_function(v12);
        }
      }
      else
      {
        float v20 = 1.0;
      }
      if (v21)
      {
        if (v12) {
          atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        float v20 = (float)*(unsigned int *)((*(uint64_t (**)(void *))(*(void *)v21 + 384))(v21) + 4);
        if (v12) {
          nitro::nitro_function::nitro_function(v12);
        }
      }
      printf("[xavier] fan_in=%f %f %f\n", v20, 1.0, 0.0);
      unint64_t v22 = 0;
      uint64_t v23 = v39;
      double v24 = sqrtf(3.0 / v20);
      while (1)
      {
        unint64_t v25 = *(int *)(v23 + 8);
        for (uint64_t i = 12; i != 24; i += 4)
          v25 *= *(int *)(v23 + i);
        if (v25 <= v22) {
          break;
        }
        unsigned int v27 = *((_DWORD *)v14 + 6);
        unsigned int v28 = v27 / 0xADC8;
        unsigned int v29 = 48271 * (v27 % 0xADC8);
        v28 *= 3399;
        BOOL v30 = v29 >= v28;
        unsigned int v31 = v29 - v28;
        if (v30) {
          int v32 = 0;
        }
        else {
          int v32 = 0x7FFFFFFF;
        }
        unsigned int v33 = v32 + v31;
        *((_DWORD *)v14 + 6) = v33;
        double v34 = ((float)((float)((float)(v33 - 1) * 4.6566e-10) + 0.0) + -0.5) * v24;
        *(float *)&double v34 = v34 + v34 + 0.0;
        *(_DWORD *)(*(void *)(v23 + 24) + 4 * v22++) = LODWORD(v34);
      }
      uint64_t v35 = v41;
      v36 = v42;
      if (v42) {
        atomic_fetch_add_explicit(&v42->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v37 = v40;
      if (v40) {
        atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v38 = *(void (****)(uint64_t *__return_ptr, void))(v35 + 72);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3321888768;
      v43[2] = ___ZN8Espresso19sync_copy_from_hostENSt3__110shared_ptrINS_23abstract_blob_containerEEENS1_INS_4blobIfLi4EEEEE_block_invoke_13442;
      v43[3] = &__block_descriptor_64_ea8_32c62_ZTSNSt3__110shared_ptrIN8Espresso23abstract_blob_containerEEE48c49_ZTSNSt3__110shared_ptrIN8Espresso4blobIfLi4EEEEE_e10_v16__0r_v8l;
      v43[4] = v35;
      v44 = v36;
      if (v36) {
        atomic_fetch_add_explicit(&v36->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v45 = v23;
      v46 = v37;
      if (v37) {
        atomic_fetch_add_explicit(&v37->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      Espresso::abstract_context::compute_batch_sync(v38, v43);
      if (v46) {
        nitro::nitro_function::nitro_function(v46);
      }
      if (v44) {
        nitro::nitro_function::nitro_function(v44);
      }
      if (v37) {
        nitro::nitro_function::nitro_function(v37);
      }
      if (v36) {
        nitro::nitro_function::nitro_function(v36);
      }
      if (v40) {
        nitro::nitro_function::nitro_function(v40);
      }
      if (v42) {
        nitro::nitro_function::nitro_function(v42);
      }
      if (v12)
      {
        nitro::nitro_function::nitro_function(v12);
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)v14);
      }
      else
      {
        v12 = (std::__shared_weak_count *)v14;
      }
      nitro::nitro_function::nitro_function(v12);
    }
  }
}

- (void)updateLayer:(id)a3 withBiases:(shared_ptr<float>)a4 length:(unint64_t)a5
{
  var1 = a4.var1;
  var0 = a4.var0;
  -[ETModelDef variableForLayer:kind:](self, "variableForLayer:kind:", a3, 2, a4.var1, a5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:*(void *)var0 length:var1];
  [v8 updateWithData:v7];
}

- (void)updateLayer:(id)a3 withWeights:(shared_ptr<float>)a4 length:(unint64_t)a5
{
  var1 = a4.var1;
  var0 = a4.var0;
  -[ETModelDef variableForLayer:kind:](self, "variableForLayer:kind:", a3, 1, a4.var1, a5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:*(void *)var0 length:var1];
  [v8 updateWithData:v7];
}

- (shared_ptr<Espresso::blob<float,)biasesForLayer:(id)a3
{
  uint64_t v5 = v3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(ETModelDef *)self layerForName:v6])
  {
    id v8 = v6;
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v8 UTF8String]);
    Espresso::get_layer_parameter_name((const void **)&__p, 2, &buf);
    if (v31 < 0) {
      operator delete(__p);
    }
    [(ETModelDef *)self network];
    uint64_t v9 = v32;
    [(ETModelDef *)self network];
    uint64_t v10 = (unsigned __int8 *)Espresso::net::loaded_global_name((void *)v27[2], (uint64_t)&buf);
    Espresso::net::get_global(&__p, v9, v10);
    if (v28) {
      nitro::nitro_function::nitro_function(v28);
    }
    v12 = (Espresso *)*((void *)&v32 + 1);
    if (*((void *)&v32 + 1)) {
      nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v32 + 1));
    }
    BOOL v13 = __p;
    if (__p)
    {
      long long v32 = 0uLL;
      int v14 = v30;
      v27[0] = __p;
      v27[1] = v30;
      if (v30) {
        atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      Espresso::sync_copy_to_host(v27, (uint64_t)&v32);
      if (v14) {
        nitro::nitro_function::nitro_function(v14);
      }
      uint64_t v15 = v32;
      int v16 = v13[2];
      int v17 = v13[3];
      int v19 = v13[4];
      int v18 = v13[5];
      float v20 = (char *)operator new(0x58uLL);
      *((void *)v20 + 1) = 0;
      *((void *)v20 + 2) = 0;
      *(void *)float v20 = &unk_1EE389920;
      uint64_t v21 = *(void *)(v15 + 24);
      *((void *)v20 + 3) = &unk_1EE36BEB0;
      *(_OWORD *)(v20 + 72) = 0u;
      *(_OWORD *)(v20 + 56) = 0u;
      *((_DWORD *)v20 + 8) = v17 * v16 * v19 * v18;
      *((void *)v20 + 5) = v21;
      *uint64_t v5 = v20 + 24;
      v5[1] = v20;
      v20[48] = 1;
      *(unsigned char *)(v15 + 32) = 0;
      *(void *)(v15 + 24) = 0;
      if (*((void *)&v32 + 1)) {
        nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v32 + 1));
      }
      if (!v14) {
        goto LABEL_17;
      }
    }
    else
    {
      unint64_t v25 = Espresso::espresso_os_log_subsystem(v12, v11);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = [v8 UTF8String];
        LODWORD(v32) = 136315138;
        *(void *)((char *)&v32 + 4) = v26;
        _os_log_debug_impl(&dword_1920CB000, v25, OS_LOG_TYPE_DEBUG, "biases not found for layer name %s passed to biasesForLayer; returning nullptr.",
          (uint8_t *)&v32,
          0xCu);
      }

      *uint64_t v5 = 0;
      v5[1] = 0;
      int v14 = v30;
      if (!v30) {
        goto LABEL_17;
      }
    }
    nitro::nitro_function::nitro_function(v14);
LABEL_17:
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    goto LABEL_22;
  }
  unint64_t v22 = Espresso::espresso_os_log_subsystem(0, v7);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = [v6 UTF8String];
    _os_log_debug_impl(&dword_1920CB000, v22, OS_LOG_TYPE_DEBUG, "Invalid layer name %s passed to weightsForLayer; returning nullptr.",
      (uint8_t *)&buf,
      0xCu);
  }

  *uint64_t v5 = 0;
  v5[1] = 0;
LABEL_22:

  result.__cntrl_ = v24;
  result.__ptr_ = v23;
  return result;
}

- (shared_ptr<Espresso::blob<float,)weightsForLayer:(id)a3
{
  uint64_t v5 = v3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(ETModelDef *)self layerForName:v6])
  {
    id v8 = v6;
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v8 UTF8String]);
    Espresso::get_layer_parameter_name((const void **)&__p, 1, &buf);
    if (v31 < 0) {
      operator delete(__p);
    }
    [(ETModelDef *)self network];
    uint64_t v9 = v32;
    [(ETModelDef *)self network];
    uint64_t v10 = (unsigned __int8 *)Espresso::net::loaded_global_name((void *)v27[2], (uint64_t)&buf);
    Espresso::net::get_global(&__p, v9, v10);
    if (v28) {
      nitro::nitro_function::nitro_function(v28);
    }
    v12 = (Espresso *)*((void *)&v32 + 1);
    if (*((void *)&v32 + 1)) {
      nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v32 + 1));
    }
    BOOL v13 = __p;
    if (__p)
    {
      long long v32 = 0uLL;
      int v14 = v30;
      v27[0] = __p;
      v27[1] = v30;
      if (v30) {
        atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      Espresso::sync_copy_to_host(v27, (uint64_t)&v32);
      if (v14) {
        nitro::nitro_function::nitro_function(v14);
      }
      uint64_t v15 = v32;
      int v16 = v13[2];
      int v17 = v13[3];
      int v18 = v13[4];
      int v19 = (char *)operator new(0x58uLL);
      *((void *)v19 + 1) = 0;
      *((void *)v19 + 2) = 0;
      *(void *)int v19 = &unk_1EE389958;
      uint64_t v20 = *(void *)(v15 + 24);
      int v21 = v13[5];
      *((void *)v19 + 3) = &unk_1EE36BED0;
      *(_OWORD *)(v19 + 56) = 0u;
      *(_OWORD *)(v19 + 72) = 0u;
      *((_DWORD *)v19 + 8) = v17 * v16 * v18;
      *((_DWORD *)v19 + 9) = v21;
      *((void *)v19 + 5) = v20;
      *uint64_t v5 = v19 + 24;
      v5[1] = v19;
      v19[48] = 1;
      *(unsigned char *)(v15 + 32) = 0;
      *(void *)(v15 + 24) = 0;
      if (*((void *)&v32 + 1)) {
        nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v32 + 1));
      }
      if (!v14) {
        goto LABEL_17;
      }
    }
    else
    {
      unint64_t v25 = Espresso::espresso_os_log_subsystem(v12, v11);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = [v8 UTF8String];
        LODWORD(v32) = 136315138;
        *(void *)((char *)&v32 + 4) = v26;
        _os_log_debug_impl(&dword_1920CB000, v25, OS_LOG_TYPE_DEBUG, "weights not found for layer name %s passed to weightForLayer; returning nullptr.",
          (uint8_t *)&v32,
          0xCu);
      }

      *uint64_t v5 = 0;
      v5[1] = 0;
      int v14 = v30;
      if (!v30) {
        goto LABEL_17;
      }
    }
    nitro::nitro_function::nitro_function(v14);
LABEL_17:
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    goto LABEL_22;
  }
  unint64_t v22 = Espresso::espresso_os_log_subsystem(0, v7);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = [v6 UTF8String];
    _os_log_debug_impl(&dword_1920CB000, v22, OS_LOG_TYPE_DEBUG, "Invalid layer name %s passed to weightsForLayer; returning nullptr.",
      (uint8_t *)&buf,
      0xCu);
  }

  *uint64_t v5 = 0;
  v5[1] = 0;
LABEL_22:

  result.__cntrl_ = v24;
  result.__ptr_ = v23;
  return result;
}

- (void)layerForName:(id)a3
{
  id v4 = a3;
  [(ETModelDef *)self network];
  uint64_t v5 = *(uint64_t **)(v9 + 32);
  if (v10) {
    nitro::nitro_function::nitro_function(v10);
  }
  while (1)
  {
    [(ETModelDef *)self network];
    id v6 = *(uint64_t **)(v9 + 40);
    if (v10) {
      nitro::nitro_function::nitro_function(v10);
    }
    if (v5 == v6) {
      break;
    }
    uint64_t v7 = *v5;
    if (*v5
      && !std::string::compare((const std::string *)(v7 + 16), (const std::string::value_type *)[v4 UTF8String]))
    {
      goto LABEL_10;
    }
    v5 += 2;
  }
  uint64_t v7 = 0;
LABEL_10:

  return (void *)v7;
}

- (shared_ptr<std::string>)topNamesForLayerIndex:(int)a3
{
  id v6 = v3;
  uint64_t v7 = (std::string *)operator new(0x30uLL);
  uint64_t v8 = 0;
  unint64_t v9 = 0;
  v7[1].__r_.__value_.__r.__words[0] = 0;
  uint64_t v10 = v7 + 1;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_1EE38D3F8;
  v7[1].__r_.__value_.__l.__size_ = 0;
  v7[1].__r_.__value_.__r.__words[2] = 0;
  *id v6 = v7 + 1;
  v6[1] = v7;
  while (1)
  {
    [(ETModelDef *)self network];
    uint64_t v21 = a3;
    v11 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v22 + 96, a3, &v21);
    uint64_t v14 = v11[3];
    uint64_t v13 = v11[4];
    uint64_t v15 = v23;
    if (v23) {
      nitro::nitro_function::nitro_function(v23);
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v13 - v14) >> 3) <= v9) {
      break;
    }
    if (v9) {
      std::string::append(v10, ",");
    }
    [(ETModelDef *)self network];
    uint64_t v21 = a3;
    int v16 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v22 + 96, a3, &v21);
    uint64_t v17 = v16[3] + v8;
    int v18 = *(char *)(v17 + 23);
    if (v18 >= 0) {
      int v19 = (const std::string::value_type *)(v16[3] + v8);
    }
    else {
      int v19 = *(const std::string::value_type **)v17;
    }
    if (v18 >= 0) {
      std::string::size_type v20 = *(unsigned __int8 *)(v17 + 23);
    }
    else {
      std::string::size_type v20 = *(void *)(v17 + 8);
    }
    std::string::append(v10, v19, v20);
    if (v23) {
      nitro::nitro_function::nitro_function(v23);
    }
    ++v9;
    v8 += 24;
  }
  result.var1 = v12;
  result.var0 = v15;
  return result;
}

- (ETModelDef)initWithNetwork:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v30 = 80000;
  Espresso::create_context(&v30, &v38);
  (*(void (**)(uint64_t))(*(void *)v38 + 96))(v38);
  uint64_t v5 = v39;
  v29[0] = v38;
  v29[1] = (uint64_t)v39;
  if (v39) {
    atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v28[0] = 0;
  v28[1] = 0;
  Espresso::sequential_builder::sequential_builder((uint64_t)&v30, v29, 0, v28);
  if (v5) {
    nitro::nitro_function::nitro_function(v5);
  }
  id v6 = v4;
  uint64_t v7 = std::string::basic_string[abi:ne180100]<0>(&v42, (char *)[v6 UTF8String]);
  Espresso::load_network((uint64_t)v7, &v38, 0, 0, (uint64_t *)&v26);
  if (SBYTE7(v43) < 0) {
    operator delete((void *)v42);
  }
  uint64_t v8 = v26;
  if (v26)
  {
    if (v26[31] != 1 || v26[34] != 1)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "network should have 1 input and 1 output");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    v25[0] = 0;
    v25[1] = 0;
    double v24 = v25;
    uint64_t v9 = v26[29];
    __p = (void *)(v9 + 32);
    uint64_t v10 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)(v26 + 17), (unsigned __int8 *)(v9 + 32), (long long **)&__p);
    Espresso::abstract_blob_container::shape((char *)&v42, *((void *)v10 + 5));
    std::string::basic_string[abi:ne180100]<0>(&__p, "data");
    p_p = &__p;
    v11 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v24, &__p, (_OWORD **)&p_p);
    v12 = (void *)*((void *)v11 + 12);
    long long v13 = v43;
    *(_OWORD *)((char *)v11 + 56) = v42;
    *(_OWORD *)((char *)v11 + 72) = v13;
    *((void *)v11 + 11) = v44;
    if (v12)
    {
      *((void *)v11 + 13) = v12;
      operator delete(v12);
      *((void *)v11 + 12) = 0;
      *((void *)v11 + 13) = 0;
      *((void *)v11 + 14) = 0;
    }
    v11[6] = v45;
    *((void *)v11 + 14) = v46;
    uint64_t v46 = 0;
    long long v45 = 0uLL;
    if (SHIBYTE(v23) < 0)
    {
      operator delete(__p);
      if ((void)v45)
      {
        *((void *)&v45 + 1) = v45;
        operator delete((void *)v45);
      }
    }
    uint64_t v14 = v27;
    v20[0] = v8;
    v20[1] = v27;
    if (v27) {
      atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (*(char *)(v9 + 55) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v42, *(const std::string::value_type **)(v9 + 32), *(void *)(v9 + 40));
    }
    else
    {
      long long v42 = *(_OWORD *)(v9 + 32);
      *(void *)&long long v43 = *(void *)(v9 + 48);
    }
    std::string::basic_string[abi:ne180100]<0>((void *)&v43 + 1, "data");
    __p = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    p_p = &__p;
    char v41 = 0;
    __p = operator new(0x30uLL);
    uint64_t v22 = (uint64_t)__p;
    uint64_t v23 = (char *)__p + 48;
    uint64_t v22 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>,std::pair<std::string,std::string> const*,std::pair<std::string,std::string> const*,std::pair<std::string,std::string>*>((uint64_t)&v23, (uint64_t)&v42, (uint64_t)&v45 + 8, (uint64_t)__p);
    Espresso::sequential_builder::add_network((uint64_t)&v30, v20, (const std::string **)&__p);
    p_p = &__p;
    std::vector<Espresso::profiler_t::compiler_analytics_entry_t>::__destroy_vector::operator()[abi:ne180100](&p_p);
    if (SBYTE7(v45) < 0) {
      operator delete(*((void **)&v43 + 1));
    }
    if (SBYTE7(v43) < 0) {
      operator delete((void *)v42);
    }
    if (v14) {
      nitro::nitro_function::nitro_function(v14);
    }
    Espresso::sequential_builder::build_from_shapes((uint64_t)&v30, (uint64_t)&v24, &v18);
    [(ETModelDef *)self transformForTraining:&v18];
    if (v19) {
      nitro::nitro_function::nitro_function(v19);
    }
    uint64_t v15 = self;
    std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v24, v25[0]);
    if (v14) {
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v14 = v27;
    if (v27) {
LABEL_31:
    }
      nitro::nitro_function::nitro_function(v14);
  }
  std::deque<std::pair<std::shared_ptr<Espresso::abstract_context>,Espresso::compute_path>>::~deque[abi:ne180100]((uint64_t)&v37);
  if (v36) {
    nitro::nitro_function::nitro_function(v36);
  }
  if (v35) {
    nitro::nitro_function::nitro_function(v35);
  }
  if (v34) {
    nitro::nitro_function::nitro_function(v34);
  }
  if (v33 < 0) {
    operator delete(v32[5]);
  }
  std::__tree<std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::__map_value_compare<Espresso::AOT::BackendIdentifier,std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::less<Espresso::AOT::BackendIdentifier>,true>,std::allocator<std::__value_type<Espresso::AOT::BackendIdentifier,double>>>::destroy((uint64_t)v32, v32[1]);
  if (v31) {
    nitro::nitro_function::nitro_function(v31);
  }
  if (v39) {
    nitro::nitro_function::nitro_function(v39);
  }

  return v15;
}

- (void)transformForTraining:(shared_ptr<Espresso::net>)a3
{
  ptr = a3.__ptr_;
  char v43 = 1;
  uint64_t v5 = (std::__shared_weak_count *)operator new(0x80uLL);
  id v6 = v5;
  v5->__shared_owners_ = 0;
  v5->__shared_weak_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE384830;
  uint64_t v7 = &v5[1].__vftable;
  std::string::size_type v8 = *(void *)ptr;
  uint64_t v9 = (std::__shared_weak_count *)*((void *)ptr + 1);
  __p.__r_.__value_.__r.__words[0] = v8;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  Espresso::gradient_builder::gradient_builder((uint64_t)&v5[1], (uint64_t *)&__p, &v43);
  if (v9) {
    nitro::nitro_function::nitro_function(v9);
  }
  char v41 = v7;
  long long v42 = v6;
  [(ETModelDef *)self setGb:&v41];
  if (v42) {
    nitro::nitro_function::nitro_function(v42);
  }
  [(ETModelDef *)self gb];
  Espresso::gradient_builder::preprocess_network((std::__shared_weak_count **)__p.__r_.__value_.__l.__data_, &v39);
  if (v40) {
    nitro::nitro_function::nitro_function(v40);
  }
  if (__p.__r_.__value_.__l.__size_) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
  }
  [(ETModelDef *)self gb];
  Espresso::gradient_builder::net_training_transform((const Espresso::net **)__p.__r_.__value_.__l.__data_, (uint64_t)&v37);
  if (__p.__r_.__value_.__l.__size_) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
  }
  uint64_t v10 = v38;
  if (v38)
  {
    do
    {
      std::pair<std::string const,Espresso::layer_training_transform_info>::pair[abi:ne180100](&__p, v10 + 1);
      v44[0] = (long long *)&__p;
      v11 = (std::string **)(std::__tree<std::__value_type<std::string,std::vector<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->layer_variable_names, (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, v44)+ 7);
      if (v11 != &v34) {
        std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>((uint64_t)v11, v34, v35, 0xAAAAAAAAAAAAAAABLL * (((char *)v35 - (char *)v34) >> 3));
      }
      v44[0] = (long long *)&v36;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v44);
      v44[0] = (long long *)&v34;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v44);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      uint64_t v10 = *(long long **)v10;
    }
    while (v10);
    v12 = v38;
  }
  else
  {
    v12 = 0;
  }
  std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>>>::__deallocate_node(v12);
  long long v13 = v37;
  uint64_t v37 = 0;
  if (v13) {
    operator delete(v13);
  }
  [(ETModelDef *)self gb];
  uint64_t v14 = *(std::__shared_weak_count **)(__p.__r_.__value_.__r.__words[0] + 8);
  uint64_t v31 = *(void *)__p.__r_.__value_.__l.__data_;
  long long v32 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(ETModelDef *)self setNetwork:&v31];
  if (v32) {
    nitro::nitro_function::nitro_function(v32);
  }
  if (__p.__r_.__value_.__l.__size_) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
  }
  uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
  [(ETModelDef *)self setAll_variables:v15];

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<std::string>>, void *>>> *)self->layer_variable_names.__tree_.__begin_node_;
  p_pair1 = &self->layer_variable_names.__tree_.__pair1_;
  if (begin_node != &self->layer_variable_names.__tree_.__pair1_)
  {
    do
    {
      left = (char *)begin_node[7].__value_.__left_;
      if (begin_node[8].__value_.__left_ != left)
      {
        uint64_t v18 = 0;
        unint64_t v19 = 0;
        do
        {
          std::string::size_type v20 = [[ETVariable alloc] initWithModelDef:self];
          uint64_t v21 = begin_node + 4;
          if (SHIBYTE(begin_node[6].__value_.__left_) < 0) {
            uint64_t v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<std::string>>, void *>>> *)begin_node[4].__value_.__left_;
          }
          uint64_t v22 = objc_msgSend(NSString, "stringWithUTF8String:", v21, p_pair1, v31);
          [(ETVariable *)v20 setLayerName:v22];
          uint64_t v23 = &left[v18];

          if (left[v18 + 23] < 0) {
            uint64_t v23 = *(char **)v23;
          }
          double v24 = [NSString stringWithUTF8String:v23];
          [(ETVariable *)v20 setName:v24];

          if (v19 == 1)
          {
            uint64_t v25 = 2;
          }
          else
          {
            if (v19) {
              Espresso::throw_exception_selector<Espresso::not_implemented_error,unsigned long &>(v19);
            }
            uint64_t v25 = 1;
          }
          [(ETVariable *)v20 setKind:v25];
          [(ETVariable *)v20 setInitializationMode:0];
          uint64_t v26 = [(ETModelDef *)self all_variables];
          [v26 addObject:v20];

          ++v19;
          left = (char *)begin_node[7].__value_.__left_;
          v18 += 24;
        }
        while (v19 < 0xAAAAAAAAAAAAAAABLL * (((char *)begin_node[8].__value_.__left_ - (char *)left) >> 3));
      }
      unsigned int v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<std::string>>, void *>>> *)begin_node[1].__value_.__left_;
      if (v27)
      {
        do
        {
          unsigned int v28 = v27;
          unsigned int v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<std::string>>, void *>>> *)v27->__value_.__left_;
        }
        while (v27);
      }
      else
      {
        do
        {
          unsigned int v28 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<std::string>>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v29 = v28->__value_.__left_ == begin_node;
          begin_node = v28;
        }
        while (!v29);
      }
      begin_node = v28;
    }
    while (v28 != p_pair1);
  }
  [(ETModelDef *)self setupVariablesDef];
}

@end