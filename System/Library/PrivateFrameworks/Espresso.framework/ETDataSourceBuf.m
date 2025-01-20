@interface ETDataSourceBuf
- (float)dataAtIndex:(unint64_t)a3 key:(const void *)a4;
- (id).cxx_construct;
- (id)dataPointAtIndex:(int)a3;
- (int)numberOfDataPoints;
- (void)setBlobs:(const void *)a3 numberOfDataPoints:(int)a4 nonBatches:(const void *)a5;
@end

@implementation ETDataSourceBuf

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

- (float)dataAtIndex:(unint64_t)a3 key:(const void *)a4
{
  v6 = std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->blobs, a4, (uint64_t)a4);
  v8 = v6[7];
  v7 = (std::__shared_weak_count *)v6[8];
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v9 = *((int *)v8 + 2);
  if (v9 == 1)
  {
    if (a3)
    {
      if (*((char *)a4 + 23) >= 0) {
        v12 = (const char *)a4;
      }
      else {
        v12 = *(const char **)a4;
      }
      Espresso::throw_exception_selector<Espresso::generic_error,char const*,unsigned long &>(v12, a3);
    }
    v10 = (float *)v8[2];
    if (!v7) {
      return v10;
    }
LABEL_9:
    nitro::nitro_function::nitro_function(v7);
    return v10;
  }
  if (v9 <= a3)
  {
    if (*((char *)a4 + 23) >= 0) {
      v13 = (const char *)a4;
    }
    else {
      v13 = *(const char **)a4;
    }
    Espresso::throw_exception_selector<Espresso::generic_error,char const*,unsigned long &>(v13, a3);
  }
  v10 = (float *)(v8[2] + 4 * *((int *)v8 + 3) * a3);
  if (v7) {
    goto LABEL_9;
  }
  return v10;
}

- (void)setBlobs:(const void *)a3 numberOfDataPoints:(int)a4 nonBatches:(const void *)a5
{
  self->int number_of_data_points = a4;
  v5 = (unsigned __int8 **)((char *)a3 + 8);
  v6 = *(unsigned __int8 ***)a3;
  if (*(const void **)a3 != (char *)a3 + 8)
  {
    p_blobs = (uint64_t **)&self->blobs;
    do
    {
      uint64_t v9 = *((void *)a5 + 1);
      uint64_t v10 = std::__find_impl[abi:ne180100]<std::string const*,std::string const*,std::string,std::__identity>(*(void *)a5, v9, v6 + 4);
      v11 = (char *)operator new(0x58uLL);
      v12 = v11;
      *((void *)v11 + 1) = 0;
      *((void *)v11 + 2) = 0;
      *(void *)v11 = &unk_1EE389958;
      v13 = v11 + 24;
      if (v10 == v9)
      {
        int number_of_data_points = self->number_of_data_points;
        int v18 = *((_DWORD *)v6 + 14);
        *((void *)v11 + 3) = &unk_1EE36BED0;
        *(_OWORD *)(v11 + 56) = 0u;
        *(_OWORD *)(v11 + 72) = 0u;
        *((_DWORD *)v11 + 8) = number_of_data_points;
        *((_DWORD *)v11 + 9) = v18;
        v15 = (Espresso *)(4 * number_of_data_points * (uint64_t)v18);
        v16 = Espresso::kern_alloc_uninitialized(v15);
      }
      else
      {
        uint64_t v14 = *((int *)v6 + 14);
        *((void *)v11 + 3) = &unk_1EE36BED0;
        *(_OWORD *)(v11 + 56) = 0u;
        *(_OWORD *)(v11 + 72) = 0u;
        *((_DWORD *)v11 + 8) = 1;
        *((_DWORD *)v11 + 9) = v14;
        v15 = (Espresso *)(4 * v14);
        v16 = Espresso::kern_alloc_uninitialized((Espresso *)(4 * v14));
      }
      bzero(v16, (size_t)v15);
      *((void *)v12 + 5) = v16;
      v12[48] = 1;
      v19 = std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_blobs, v6 + 4, (uint64_t)(v6 + 4));
      *(void *)&long long v20 = v13;
      *((void *)&v20 + 1) = v12;
      v21 = (std::__shared_weak_count *)v19[8];
      *(_OWORD *)(v19 + 7) = v20;
      if (v21) {
        nitro::nitro_function::nitro_function(v21);
      }
      v22 = v6[1];
      if (v22)
      {
        do
        {
          v23 = (unsigned __int8 **)v22;
          v22 = *(unsigned __int8 **)v22;
        }
        while (v22);
      }
      else
      {
        do
        {
          v23 = (unsigned __int8 **)v6[2];
          BOOL v24 = *v23 == (unsigned __int8 *)v6;
          v6 = v23;
        }
        while (!v24);
      }
      v6 = v23;
    }
    while (v23 != v5);
  }
}

- (id)dataPointAtIndex:(int)a3
{
  v5 = objc_opt_new();
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 2>>>, void *>>> *)self->blobs.__tree_.__begin_node_;
  p_pair1 = &self->blobs.__tree_.__pair1_;
  if (begin_node != &self->blobs.__tree_.__pair1_)
  {
    do
    {
      if (SHIBYTE(begin_node[6].__value_.__left_) < 0) {
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)begin_node[4].__value_.__left_, (std::string::size_type)begin_node[5].__value_.__left_);
      }
      else {
        std::string __p = *(std::string *)&begin_node[4].__value_.__left_;
      }
      left = (int *)begin_node[7].__value_.__left_;
      uint64_t v9 = (std::__shared_weak_count *)begin_node[8].__value_.__left_;
      v21 = left;
      v22 = v9;
      if (v9)
      {
        char v10 = 1;
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
        left = v21;
        v11 = v22;
        if (v22)
        {
          char v10 = 0;
          atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
        }
      }
      else
      {
        v11 = 0;
        char v10 = 1;
      }
      uint64_t v12 = left[3];
      if (left[2] == 1) {
        a3 = 0;
      }
      uint64_t v13 = *((void *)left + 2);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      v15 = objc_msgSend(NSString, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
      [v5 setData:v13 + 4 * a3 * (int)v12 size:v12 forKey:v15 freeWhenDone:0];

      if ((v10 & 1) == 0) {
        nitro::nitro_function::nitro_function(v11);
      }
      if (v22) {
        nitro::nitro_function::nitro_function(v22);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 2>>>, void *>>> *)begin_node[1].__value_.__left_;
      if (v16)
      {
        do
        {
          v17 = v16;
          v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 2>>>, void *>>> *)v16->__value_.__left_;
        }
        while (v16);
      }
      else
      {
        do
        {
          v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 2>>>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v18 = v17->__value_.__left_ == begin_node;
          begin_node = v17;
        }
        while (!v18);
      }
      begin_node = v17;
    }
    while (v17 != p_pair1);
  }

  return v5;
}

- (int)numberOfDataPoints
{
  return self->number_of_data_points;
}

@end