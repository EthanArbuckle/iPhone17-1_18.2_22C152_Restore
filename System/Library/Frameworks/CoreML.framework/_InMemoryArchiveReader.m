@interface _InMemoryArchiveReader
+ (id)modelName;
+ (id)readerFromArchiver:(void *)a3 error:(id *)a4;
- (NSArray)layerInfos;
- (NSString)modelPath;
- (_InMemoryArchiveReader)initWithNetwork:(shared_ptr<Espresso::net>)a3;
- (id).cxx_construct;
- (id)loadUpdatableParams:(id *)a3;
- (id)transformParams;
- (void)copyLayerShapesToContainer:(id)a3;
@end

@implementation _InMemoryArchiveReader

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerInfos, 0);
  cntrl = self->_network.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (NSArray)layerInfos
{
  return self->_layerInfos;
}

- (void)copyLayerShapesToContainer:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  memset(v49, 0, sizeof(v49));
  int v50 = 1065353216;
  ptr = self->_network.__ptr_;
  uint64_t v5 = *((void *)ptr + 4);
  if (*((void *)ptr + 5) != v5)
  {
    unint64_t v6 = 0;
    do
    {
      v7 = (uint64_t *)(v5 + 16 * v6);
      uint64_t v8 = *v7;
      v9 = (std::__shared_weak_count *)v7[1];
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      Espresso::layer_data::shapes((Espresso::layer_data *)&__p, *(uint64_t **)(v8 + 104), *(uint64_t **)(v8 + 112));
      v10 = (char *)__p;
      if (v52 != __p)
      {
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        unint64_t v13 = 0;
        v14 = (void *)((char *)ptr + 96);
        do
        {
          v15 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::find<unsigned long>(v14, v6);
          if (!v15) {
            std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
          }
          v54 = (unsigned __int8 *)(v15[3] + v11);
          v16 = std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v49, v54, (long long **)&v54);
          long long v17 = *(_OWORD *)&v10[v12];
          long long v18 = *(_OWORD *)&v10[v12 + 16];
          *((void *)v16 + 9) = *(void *)&v10[v12 + 32];
          *(_OWORD *)(v16 + 56) = v18;
          *(_OWORD *)(v16 + 40) = v17;
          if (&v10[v12] != (char *)(v16 + 40)) {
            std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>((char *)v16 + 80, *(char **)&v10[v12 + 40], *(void *)&v10[v12 + 48], (uint64_t)(*(void *)&v10[v12 + 48] - *(void *)&v10[v12 + 40]) >> 2);
          }
          ++v13;
          v10 = (char *)__p;
          v12 += 64;
          v11 += 24;
        }
        while (v13 < (v52 - (unsigned char *)__p) >> 6);
      }
      p_p = &__p;
      std::vector<Espresso::layer_shape>::__destroy_vector::operator()[abi:ne180100](&p_p);
      if (v9) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      }
      v19 = self->_network.__ptr_;
      v20 = (uint64_t *)(*((void *)v19 + 4) + 16 * v6);
      uint64_t v21 = *v20;
      v22 = (std::__shared_weak_count *)v20[1];
      if (v22) {
        atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      Espresso::layer_data::shapes((Espresso::layer_data *)&__p, *(uint64_t **)(v21 + 80), *(uint64_t **)(v21 + 88));
      v23 = (char *)__p;
      if (v52 != __p)
      {
        uint64_t v24 = 0;
        uint64_t v25 = 0;
        unint64_t v26 = 0;
        v27 = (void *)((char *)v19 + 56);
        do
        {
          v28 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::find<unsigned long>(v27, v6);
          if (!v28) {
            std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
          }
          v54 = (unsigned __int8 *)(v28[3] + v24);
          v29 = std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v49, v54, (long long **)&v54);
          long long v30 = *(_OWORD *)&v23[v25];
          long long v31 = *(_OWORD *)&v23[v25 + 16];
          *((void *)v29 + 9) = *(void *)&v23[v25 + 32];
          *(_OWORD *)(v29 + 56) = v31;
          *(_OWORD *)(v29 + 40) = v30;
          if (&v23[v25] != (char *)(v29 + 40)) {
            std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>((char *)v29 + 80, *(char **)&v23[v25 + 40], *(void *)&v23[v25 + 48], (uint64_t)(*(void *)&v23[v25 + 48] - *(void *)&v23[v25 + 40]) >> 2);
          }
          ++v26;
          v23 = (char *)__p;
          v25 += 64;
          v24 += 24;
        }
        while (v26 < (v52 - (unsigned char *)__p) >> 6);
      }
      p_p = &__p;
      std::vector<Espresso::layer_shape>::__destroy_vector::operator()[abi:ne180100](&p_p);
      if (v22) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v22);
      }
      ++v6;
      ptr = self->_network.__ptr_;
      uint64_t v5 = *((void *)ptr + 4);
    }
    while (v6 < (*((void *)ptr + 5) - v5) >> 4);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  objc_msgSend(v42, "inputLayerNames", v42);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v46 != v33) {
          objc_enumerationMutation(obj);
        }
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[*(id *)(*((void *)&v45 + 1) + 8 * i) UTF8String]);
        p_p = &__p;
        v35 = std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v49, (unsigned __int8 *)&__p, (long long **)&p_p);
        int v36 = *((_DWORD *)v35 + 10);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v43 + 1, &__p, (long long **)&p_p)+ 14) = v36;
        int v37 = *((_DWORD *)v35 + 11);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v43 + 4, &__p, (long long **)&p_p)+ 14) = v37;
        int v38 = *((_DWORD *)v35 + 12);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v43 + 7, &__p, (long long **)&p_p)+ 14) = v38;
        int v39 = *((_DWORD *)v35 + 13);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v43 + 10, &__p, (long long **)&p_p)+ 14) = v39;
        int v40 = *((_DWORD *)v35 + 14);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v43 + 13, &__p, (long long **)&p_p)+ 14) = v40;
        int v41 = *((_DWORD *)v35 + 15);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v43 + 16, &__p, (long long **)&p_p)+ 14) = v41;
        if (v53 < 0) {
          operator delete(__p);
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
    }
    while (v32);
  }

  std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::~__hash_table((uint64_t)v49);
}

- (id)transformParams
{
  if (*((void *)self->_network.__ptr_ + 43)) {
    return (id)MEMORY[0x1E4F1CC08];
  }
  else {
    return 0;
  }
}

- (id)loadUpdatableParams:(id *)a3
{
  return 0;
}

- (NSString)modelPath
{
  return (NSString *)&stru_1EF0E81D0;
}

- (_InMemoryArchiveReader)initWithNetwork:(shared_ptr<Espresso::net>)a3
{
  ptr = a3.__ptr_;
  v41.receiver = self;
  v41.super_class = (Class)_InMemoryArchiveReader;
  v4 = [(_InMemoryArchiveReader *)&v41 init];
  uint64_t v5 = v4;
  if (v4)
  {
    unint64_t v6 = *(net **)ptr;
    uint64_t v7 = *((void *)ptr + 1);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_network.__cntrl_;
    v5->_network.__ptr_ = v6;
    v5->_network.__cntrl_ = (__shared_weak_count *)v7;
    if (cntrl)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
      unint64_t v6 = v5->_network.__ptr_;
    }
    int v38 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(uint64_t)(*((void *)v6 + 5) - *((void *)v6 + 4)) >> 4];
    unint64_t v40 = 0;
    v9 = v5->_network.__ptr_;
    uint64_t v10 = *((void *)v9 + 4);
    if (*((void *)v9 + 5) != v10)
    {
      unint64_t v11 = 0;
      do
      {
        uint64_t v12 = (uint64_t *)(v10 + 16 * v11);
        uint64_t v14 = *v12;
        unint64_t v13 = (std::__shared_weak_count *)v12[1];
        if (v13)
        {
          atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
          v9 = v5->_network.__ptr_;
        }
        v15 = NSString;
        v16 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t *)v9 + 7, v11, &v40);
        memset(&v39, 0, sizeof(v39));
        uint64_t v17 = v16[3];
        if (v16[4] == v17)
        {
          uint64_t v24 = &v39;
        }
        else
        {
          uint64_t v18 = 0;
          unint64_t v19 = 0;
          do
          {
            if (v19)
            {
              std::string::append(&v39, ",");
              uint64_t v17 = v16[3];
            }
            uint64_t v20 = v17 + v18;
            int v21 = *(char *)(v20 + 23);
            if (v21 >= 0) {
              v22 = (const std::string::value_type *)v20;
            }
            else {
              v22 = *(const std::string::value_type **)v20;
            }
            if (v21 >= 0) {
              std::string::size_type v23 = *(unsigned __int8 *)(v20 + 23);
            }
            else {
              std::string::size_type v23 = *(void *)(v20 + 8);
            }
            std::string::append(&v39, v22, v23);
            ++v19;
            uint64_t v17 = v16[3];
            v18 += 24;
          }
          while (v19 < 0xAAAAAAAAAAAAAAABLL * ((v16[4] - v17) >> 3));
          if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v24 = &v39;
          }
          else {
            uint64_t v24 = (std::string *)v39.__r_.__value_.__r.__words[0];
          }
        }
        uint64_t v25 = [v15 stringWithUTF8String:v24];
        if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v39.__r_.__value_.__l.__data_);
        }
        unint64_t v26 = (void *)(v14 + 40);
        v27 = (void *)(v14 + 40);
        if (*(char *)(v14 + 63) < 0) {
          v27 = (void *)*v26;
        }
        v28 = [NSString stringWithUTF8String:v27];
        v29 = [_NNLayerInfo alloc];
        int v30 = *(char *)(v14 + 63);
        if (v30 < 0)
        {
          if (*(void *)(v14 + 48) != 8) {
            goto LABEL_35;
          }
          unint64_t v26 = (void *)*v26;
        }
        else if (v30 != 8)
        {
          goto LABEL_35;
        }
        if (*v26 == 0x686372615F6E6E72)
        {
          uint64_t v33 = *(void *)(v14 + 64);
          v34 = *(std::__shared_weak_count **)(v14 + 72);
          if (v34) {
            atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          int v35 = *(_DWORD *)((*(uint64_t (**)(uint64_t))(*(void *)v33 + 384))(v33) + 148);
          if (v34) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v34);
          }
          if (v35)
          {
            uint64_t v31 = 1;
            goto LABEL_36;
          }
        }
LABEL_35:
        uint64_t v31 = 0;
LABEL_36:
        uint64_t v32 = [(_NNLayerInfo *)v29 initWithType:v28 concatenatedInputNames:v25 bidirectional:v31];
        [(NSArray *)v38 addObject:v32];

        if (v13) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v13);
        }
        unint64_t v11 = v40 + 1;
        unint64_t v40 = v11;
        v9 = v5->_network.__ptr_;
        uint64_t v10 = *((void *)v9 + 4);
      }
      while (v11 < (*((void *)v9 + 5) - v10) >> 4);
    }
    layerInfos = v5->_layerInfos;
    v5->_layerInfos = v38;
  }
  return v5;
}

+ (id)modelName
{
  return @"model";
}

+ (id)readerFromArchiver:(void *)a3 error:(id *)a4
{
  unint64_t v6 = neuralNetworkOutputFromArchive((_MLModelInputArchiver *)a3);
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  [v6 network];
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  if (v13)
  {
    id v8 = objc_alloc((Class)a1);
    [v7 network];
    v9 = (void *)[v8 initWithNetwork:&v11];
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
  }
  else
  {
LABEL_7:
    if (a4)
    {
      +[MLModelErrorUtils IOErrorWithFormat:@"Error in reading in-memory network."];
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

@end