@interface ETDataSourceBlobF4
- (id).cxx_construct;
- (id)dataPointAtIndex:(int)a3;
- (int)numberOfDataPoints;
- (void)addBlob:(id)a3 forKey:(id)a4;
@end

@implementation ETDataSourceBlobF4

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

- (void).cxx_destruct
{
}

- (int)numberOfDataPoints
{
  return *(_DWORD *)(*((void *)self->blobs.__tree_.__begin_node_ + 7) + 20);
}

- (id)dataPointAtIndex:(int)a3
{
  v5 = objc_opt_new();
  begin_node = (long long *)self->blobs.__tree_.__begin_node_;
  p_pair1 = &self->blobs.__tree_.__pair1_;
  if (begin_node != (long long *)&self->blobs.__tree_.__pair1_)
  {
    do
    {
      std::pair<std::string const,std::shared_ptr<Espresso::blob<float,4>>>::pair[abi:ne180100](&__p, begin_node + 2);
      uint64_t v8 = v21;
      v9 = v22;
      if (v22) {
        atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      int v11 = *(_DWORD *)(v8 + 8);
      int v10 = *(_DWORD *)(v8 + 12);
      int v12 = *(_DWORD *)(v8 + 16);
      uint64_t v13 = *(void *)(v8 + 24);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      v15 = [NSString stringWithUTF8String:p_p];
      objc_msgSend(v5, "setData:size:forKey:freeWhenDone:", v13 + 4 * v10 * v11 * v12 * a3);

      if (v9) {
        nitro::nitro_function::nitro_function(v9);
      }
      if (v22) {
        nitro::nitro_function::nitro_function(v22);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 4>>>, void *>>> *)*((void *)begin_node + 1);
      if (left)
      {
        do
        {
          v17 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 4>>>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 4>>>, void *>>> *)*((void *)begin_node + 2);
          BOOL v18 = v17->__value_.__left_ == begin_node;
          begin_node = (long long *)v17;
        }
        while (!v18);
      }
      begin_node = (long long *)v17;
    }
    while (v17 != p_pair1);
  }

  return v5;
}

- (void)addBlob:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  std::string::basic_string[abi:ne180100]<0>(v19, (char *)[v8 UTF8String]);
  if (v20 >= 0) {
    v9 = v19;
  }
  else {
    v9 = (void **)v19[0];
  }
  int v10 = fopen((const char *)v9, "rb");
  Espresso::debug::read_blob_f4((Espresso::debug *)&v21, v10);
  fclose(v10);
  id v11 = v7;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v11 UTF8String]);
  int v12 = (void **)std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__find_equal<std::string>((uint64_t)&self->blobs, &v24, __p);
  uint64_t v13 = (char *)*v12;
  if (!*v12)
  {
    v14 = (uint64_t **)v12;
    uint64_t v13 = (char *)operator new(0x48uLL);
    v22[1] = &self->blobs.__tree_.__pair1_;
    *((_OWORD *)v13 + 2) = *(_OWORD *)__p;
    uint64_t v15 = v18;
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v18 = 0;
    *((void *)v13 + 7) = 0;
    *((void *)v13 + 8) = 0;
    *((void *)v13 + 6) = v15;
    char v23 = 1;
    std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__insert_node_at((uint64_t **)&self->blobs, v24, v14, (uint64_t *)v13);
    v22[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,void *>>>>::reset[abi:ne180100]((uint64_t)v22);
  }
  v16 = (std::__shared_weak_count *)*((void *)v13 + 8);
  *(_OWORD *)(v13 + 56) = v21;
  if (v16) {
    nitro::nitro_function::nitro_function(v16);
  }
  if (SHIBYTE(v18) < 0) {
    operator delete(__p[0]);
  }
  if (v20 < 0) {
    operator delete(v19[0]);
  }
}

@end