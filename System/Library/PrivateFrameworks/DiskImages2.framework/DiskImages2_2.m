void sub_21E387E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  std::__shared_weak_count *v11;
  std::__shared_weak_count *v12;

  sg_vec_ns::details::sg_vec_iterator::~sg_vec_iterator((sg_vec_ns::details::sg_vec_iterator *)&a9);
  v11 = *(std::__shared_weak_count **)(v9 + 120);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  v12 = *(std::__shared_weak_count **)(v9 + 8);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  _Unwind_Resume(a1);
}

uint64_t sg_vec_ns::details::sg_vec_iterator::get_cow(sg_vec_ns::details::sg_vec_iterator *this)
{
  return *(unsigned __int8 *)(*((void *)this + 6) + 200);
}

void sg_vec_ns::generate_vec_ref(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, sg_vec_ref *a6@<X8>)
{
  unint64_t v6 = *(void *)(a2 + 144) - a3;
  if (v6 <= a4) {
    unint64_t v6 = a4;
  }
  if (v6 < a5) {
    a5 = v6;
  }
  sg_vec_ref::sg_vec_ref(a6, (const sg_vec_ns::details::buffer_iterator *)(a1 + 56), (const sg_vec_ns::details::buffer_iterator *)(a2 + 56), a3, a5, *(unsigned char *)(*(void *)(a1 + 48) + 200));
}

BOOL sg_vec_ns::should_create_new_sg_vec_ref(sg_vec_ns *this, const sg_vec_ns::details::sg_vec_iterator *a2, const sg_vec_ns::details::sg_vec_iterator *a3, unint64_t a4)
{
  unint64_t v4 = *((void *)this + 18);
  return v4 > (unint64_t)a3 || *((void *)a2 + 18) - v4 < a4;
}

void *sg_vec_ns::make@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  v11[15] = *MEMORY[0x263EF8340];
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  v9 = v11;
  v11[0] = v5;
  v11[1] = v4;
  v11[2] = v7;
  long long v10 = xmmword_21E39B4E0;
  sg_vec::sg_vec(a2, &v9, v6, a1[2]);
  return boost::container::vector<std::pair<std::shared_ptr<char>,unsigned long>,boost::container::small_vector_allocator<std::pair<std::shared_ptr<char>,unsigned long>,boost::container::new_allocator<void>,void>,void>::~vector(&v9);
}

void sub_21E387FF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  boost::container::vector<std::pair<std::shared_ptr<char>,unsigned long>,boost::container::small_vector_allocator<std::pair<std::shared_ptr<char>,unsigned long>,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t *)va);
  _Unwind_Resume(a1);
}

__n128 std::pair<sg_vec_ns::details::sg_vec_iterator,sg_vec_ns::details::sg_vec_iterator>::pair[abi:ne180100]<sg_vec_ns::details::sg_vec_iterator,sg_vec_ns::details::sg_vec_iterator,0>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  long long v4 = *(_OWORD *)(a2 + 72);
  long long v5 = *(_OWORD *)(a2 + 88);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v5;
  *(_OWORD *)(a1 + 72) = v4;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(void *)(a2 + 112) = 0;
  *(void *)(a2 + 120) = 0;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  uint64_t v6 = *(void *)(a2 + 144);
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  *(void *)(a1 + 144) = v6;
  *(_OWORD *)(a1 + 160) = *(_OWORD *)a3;
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  long long v7 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a1 + 185) = *(_OWORD *)(a3 + 25);
  *(_OWORD *)(a1 + 176) = v7;
  *(void *)(a1 + 208) = *(void *)(a3 + 48);
  *(void *)(a1 + 216) = *(void *)(a3 + 56);
  *(void *)(a1 + 224) = *(void *)(a3 + 64);
  long long v8 = *(_OWORD *)(a3 + 72);
  long long v9 = *(_OWORD *)(a3 + 88);
  *(unsigned char *)(a1 + 264) = *(unsigned char *)(a3 + 104);
  *(_OWORD *)(a1 + 248) = v9;
  *(_OWORD *)(a1 + 232) = v8;
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a3 + 112);
  *(void *)(a3 + 112) = 0;
  *(void *)(a3 + 120) = 0;
  __n128 result = *(__n128 *)(a3 + 128);
  *(__n128 *)(a1 + 288) = result;
  uint64_t v11 = *(void *)(a3 + 144);
  *(unsigned char *)(a1 + 312) = *(unsigned char *)(a3 + 152);
  *(void *)(a1 + 304) = v11;
  return result;
}

uint64_t zero_sg_entry(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *trim_sg_to_interval@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v3 = result[3];
  unsigned int v4 = *(unsigned __int8 *)(a2 + 16);
  unint64_t v5 = *(void *)(a2 + 8);
  if (v3 > (v4 & 1) + v5 - 1
    || ((uint64_t v6 = result[2], v7 = v6 + v3, v8 = *(void *)a2, (v4 & 2) != 0) ? (v9 = *(void *)a2) : (v9 = v8 + 1),
        v7 <= v9))
  {
    *(_OWORD *)(a3 + 25) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return result;
  }
  unint64_t v10 = v9 - v3;
  if (v9 >= v3)
  {
    if (*(unsigned char *)(a2 + 16))
    {
      if (v4 == 3)
      {
        if (v5 < v8) {
          goto LABEL_30;
        }
      }
      else if (v8 >= v5)
      {
LABEL_30:
        unint64_t v16 = boost::icl::identity_element<unsigned long long>::value(void)::_value;
        goto LABEL_31;
      }
    }
    else if (v8 >= v5 || v8 + 1 >= v5)
    {
      goto LABEL_30;
    }
    unint64_t v16 = v5 + (v4 & 1) + (int)(((v4 >> 1) & 1) - 1) - v8;
LABEL_31:
    if (v6 - v10 < v16) {
      unint64_t v16 = v6 - v10;
    }
    uint64_t v17 = result[4];
    uint64_t v18 = result[1];
    *(void *)a3 = *result + v10;
    *(void *)(a3 + 8) = v18;
    if (v18) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v18 + 8), 1uLL, memory_order_relaxed);
    }
    *(void *)(a3 + 16) = v16;
    *(void *)(a3 + 24) = v9;
    *(void *)(a3 + 32) = v17 - v10;
    goto LABEL_36;
  }
  if (*(unsigned char *)(a2 + 16))
  {
    if (v4 == 3)
    {
      if (v5 < v8) {
        goto LABEL_20;
      }
    }
    else if (v8 >= v5)
    {
LABEL_20:
      uint64_t v11 = boost::icl::identity_element<unsigned long long>::value(void)::_value;
      goto LABEL_21;
    }
  }
  else if (v8 >= v5 || v8 + 1 >= v5)
  {
    goto LABEL_20;
  }
  uint64_t v11 = v5 + (v4 & 1) + (int)(((v4 >> 1) & 1) - 1) - v8;
LABEL_21:
  unint64_t v12 = v11 + v9;
  if (v12 >= v7) {
    unint64_t v12 = v6 + v3;
  }
  unint64_t v13 = v12 - v3;
  uint64_t v14 = result[4];
  uint64_t v15 = result[1];
  *(void *)a3 = *result;
  *(void *)(a3 + 8) = v15;
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a3 + 16) = v13;
  *(void *)(a3 + 24) = v3;
  *(void *)(a3 + 32) = v14;
LABEL_36:
  *(unsigned char *)(a3 + 40) = 0;
  return result;
}

gcd::gcd_group *gcd::gcd_group::gcd_group(gcd::gcd_group *this)
{
  *(void *)this = dispatch_group_create();
  return this;
}

void gcd::gcd_group::~gcd_group(NSObject **this)
{
  v1 = *this;
  if (v1) {
    dispatch_release(v1);
  }
}

intptr_t gcd::gcd_group::wait(dispatch_group_t *this, dispatch_time_t a2)
{
  return dispatch_group_wait(*this, a2);
}

dispatch_queue_t *gcd::gcd_queue::gcd_queue(dispatch_queue_t *a1, char *label, int a3)
{
  switch(a3)
  {
    case 2:
      uint64_t v6 = MEMORY[0x263EF83A8];
      unint64_t v5 = label;
      goto LABEL_6;
    case 1:
      global_queue = dispatch_get_global_queue(21, 0);
      dispatch_queue_t v7 = dispatch_queue_create_with_target_V2(label, 0, global_queue);
      goto LABEL_8;
    case 0:
      unint64_t v5 = label;
      uint64_t v6 = 0;
LABEL_6:
      dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
LABEL_8:
      *a1 = v7;
      break;
  }
  return a1;
}

void *gcd::gcd_queue::gcd_queue(void *result, void *a2)
{
  *__n128 result = *a2;
  *a2 = 0;
  return result;
}

void gcd::gcd_queue::async(dispatch_queue_t *a1, void *a2)
{
}

void gcd::gcd_queue::async(dispatch_queue_t *a1, dispatch_group_t *a2, void *a3)
{
}

void gcd::gcd_queue::async(NSObject **a1, void **a2, uint64_t a3)
{
  unsigned int v4 = *a2;
  if (v4)
  {
    if (a3)
    {
      dispatch_time_t v6 = dispatch_time(0, 1000 * a3);
      dispatch_queue_t v7 = *a1;
      unint64_t v8 = *a2;
      dispatch_after(v6, v7, v8);
    }
    else
    {
      unint64_t v9 = *a1;
      dispatch_async(v9, v4);
    }
  }
}

void gcd::gcd_queue::sync(dispatch_queue_t *a1, void *a2)
{
}

void gcd::gcd_queue::barrier_async(dispatch_queue_t *a1, void *a2)
{
}

void gcd::gcd_queue::barrier_sync(dispatch_queue_t *a1, void *a2)
{
}

void gcd::gcd_queue::suspend(dispatch_object_t *this)
{
}

void gcd::gcd_queue::resume(dispatch_object_t *this)
{
}

uint64_t gcd::gcd_queue::set_target_priority(dispatch_object_t *a1, int a2)
{
  if ((a2 - 1) > 2) {
    intptr_t v3 = 5;
  }
  else {
    intptr_t v3 = *(void *)&asc_21E3A7588[8 * a2 - 8];
  }
  global_queue = dispatch_get_global_queue(v3, 0);
  if (!global_queue) {
    return 22;
  }
  dispatch_set_target_queue(*a1, global_queue);
  return 0;
}

gcd::gcd_semaphore *gcd::gcd_semaphore::gcd_semaphore(gcd::gcd_semaphore *this, intptr_t value)
{
  *(void *)this = dispatch_semaphore_create(value);
  return this;
}

intptr_t gcd::gcd_semaphore::wait(dispatch_semaphore_t *this, dispatch_time_t a2)
{
  return dispatch_semaphore_wait(*this, a2);
}

intptr_t gcd::gcd_semaphore::signal(dispatch_semaphore_t *this)
{
  return dispatch_semaphore_signal(*this);
}

dispatch_block_t *gcd::gcd_block::gcd_block(dispatch_block_t *a1, void *a2)
{
  *a1 = dispatch_block_create((dispatch_block_flags_t)0, a2);
  return a1;
}

void gcd::gcd_block::cancel(void **this)
{
  v1 = *this;
  if (v1) {
    dispatch_block_cancel(v1);
  }
}

void gcd::gcd_block::~gcd_block(const void **this)
{
  v2 = (void *)*this;
  if (v2)
  {
    dispatch_block_cancel(v2);
    if (*this) {
      _Block_release(*this);
    }
  }
}

std::string *workqueue::workqueue::workqueue(std::string *this, long long *a2, unint64_t a3)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&this[1].__r_.__value_.__r.__words[2] = 0u;
  this[2].__r_.__value_.__s.__data_[8] = a3 != 0;
  if (a3)
  {
    std::vector<gcd::gcd_queue>::reserve(this[1].__r_.__value_.__r.__words, a3);
    do
    {
      dispatch_time_t v6 = this;
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
        dispatch_time_t v6 = (std::string *)this->__r_.__value_.__r.__words[0];
      }
      gcd::gcd_queue::gcd_queue(&v9, v6, 0);
      std::vector<gcd::gcd_queue>::emplace_back<gcd::gcd_queue>(this[1].__r_.__value_.__r.__words, &v9);
      gcd::gcd_group::~gcd_group(&v9);
      --a3;
    }
    while (a3);
  }
  else
  {
    dispatch_queue_t v7 = this;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      dispatch_queue_t v7 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    gcd::gcd_queue::gcd_queue(&v9, v7, 2);
    std::vector<gcd::gcd_queue>::emplace_back<gcd::gcd_queue>(this[1].__r_.__value_.__r.__words, &v9);
    gcd::gcd_group::~gcd_group(&v9);
  }
  return this;
}

void sub_21E388668(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  gcd::gcd_group::~gcd_group((NSObject **)va);
  std::vector<gcd::gcd_queue>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  if (*(char *)(v2 + 23) < 0) {
    operator delete(*(void **)v2);
  }
  _Unwind_Resume(a1);
}

uint64_t std::vector<gcd::gcd_queue>::reserve(void *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<iovec>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::allocator<std::unique_ptr<diskimage_uio::stack_image_node const>>::allocate_at_least[abi:ne180100](result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 8 * v6;
    std::vector<gcd::gcd_queue>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<gcd::gcd_queue>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_21E38872C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<gcd::gcd_queue>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

unint64_t std::vector<gcd::gcd_queue>::emplace_back<gcd::gcd_queue>(void *a1, void *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v9 = (uint64_t)(v7 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<iovec>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - *a1;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    uint64_t v19 = v4;
    if (v12) {
      unint64_t v13 = (char *)std::allocator<std::unique_ptr<diskimage_uio::stack_image_node const>>::allocate_at_least[abi:ne180100](v4, v12);
    }
    else {
      unint64_t v13 = 0;
    }
    uint64_t v15 = v13;
    unint64_t v16 = &v13[8 * v9];
    uint64_t v18 = &v13[8 * v12];
    gcd::gcd_queue::gcd_queue(v16, a2);
    uint64_t v17 = v16 + 8;
    std::vector<gcd::gcd_queue>::__swap_out_circular_buffer(a1, &v15);
    unint64_t v8 = a1[1];
    std::__split_buffer<gcd::gcd_queue>::~__split_buffer((uint64_t)&v15);
  }
  else
  {
    gcd::gcd_queue::gcd_queue(*(void **)(v4 - 8), a2);
    unint64_t v8 = v7 + 8;
    a1[1] = v7 + 8;
  }
  a1[1] = v8;
  return v8 - 8;
}

void sub_21E388834(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<gcd::gcd_queue>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t workqueue::workqueue::set_target_priority(uint64_t result, int a2)
{
  uint64_t v2 = *(dispatch_object_t **)(result + 24);
  for (i = *(dispatch_object_t **)(result + 32); v2 != i; ++v2)
    uint64_t result = gcd::gcd_queue::set_target_priority(v2, a2);
  return result;
}

void workqueue::concurrent_limit::get(std::condition_variable *this)
{
  v5.__m_ = (std::unique_lock<std::mutex>::mutex_type *)&this[1];
  v5.__owns_ = 1;
  std::mutex::lock((std::mutex *)&this[1]);
  uint64_t v2 = *(void *)&this[2].__cv_.__opaque[8];
  if (v2)
  {
    *(void *)&this[2].__cv_.__opaque[8] = v2 - 1;
LABEL_5:
    std::mutex::unlock(v5.__m_);
    return;
  }
  do
  {
    std::condition_variable::wait(this, &v5);
    uint64_t v3 = *(void *)&this[2].__cv_.__opaque[8];
  }
  while (!v3);
  BOOL owns = v5.__owns_;
  *(void *)&this[2].__cv_.__opaque[8] = v3 - 1;
  if (owns) {
    goto LABEL_5;
  }
}

void workqueue::concurrent_limit::put(std::condition_variable *this)
{
  uint64_t v2 = (std::mutex *)&this[1];
  std::mutex::lock((std::mutex *)&this[1]);
  ++*(void *)&this[2].__cv_.__opaque[8];
  std::condition_variable::notify_one(this);
  std::mutex::unlock(v2);
}

void workqueue::transaction::add(dispatch_group_t *a1, void *a2)
{
  if (*((unsigned char *)a1 + 136))
  {
    workqueue::concurrent_limit::get((std::condition_variable *)(a1 + 2));
    dispatch_group_t v4 = *a1;
    unint64_t add = atomic_fetch_add((atomic_ullong *volatile)&(*a1)[6], 1uLL);
    unint64_t v7 = v4 + 3;
    Class isa = v4[3].isa;
    unint64_t v8 = add % ((v7[1].isa - isa) >> 3);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 0x40000000;
    v11[2] = ___ZN9workqueue11transaction3addEU13block_pointerFvvE_block_invoke;
    v11[3] = &unk_2644A2D58;
    v11[4] = a2;
    v11[5] = a1;
    gcd::gcd_queue::async((dispatch_queue_t *)isa + v8, a1 + 1, v11);
  }
  else
  {
    dispatch_group_t v9 = *a1;
    uint64_t v10 = (dispatch_queue_t *)((char *)v9[3].isa
                             + 8
                             * (atomic_fetch_add((atomic_ullong *volatile)&(*a1)[6], 1uLL)
                              % ((v9[4].isa - v9[3].isa) >> 3)));
    gcd::gcd_queue::async(v10, a1 + 1, a2);
  }
}

void ___ZN9workqueue11transaction3addEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  workqueue::concurrent_limit::put((std::condition_variable *)(v1 + 16));
}

intptr_t workqueue::transaction::flush(dispatch_group_t *this, dispatch_time_t a2)
{
  return gcd::gcd_group::wait(this + 1, a2);
}

void workqueue::transaction::~transaction(dispatch_group_t *this)
{
  uint64_t v2 = this + 1;
  gcd::gcd_group::wait(this + 1, 0xFFFFFFFFFFFFFFFFLL);
  std::__optional_destruct_base<workqueue::concurrent_limit,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)(this + 2));
  gcd::gcd_group::~gcd_group(v2);
}

uint64_t workqueue::transaction::transaction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = a2;
  gcd::gcd_group::gcd_group((gcd::gcd_group *)(a1 + 8));
  *(unsigned char *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 136) = 0;
  if (a3)
  {
    std::__optional_destruct_base<workqueue::concurrent_limit,false>::reset[abi:ne180100](a1 + 16);
    *(void *)(a1 + 16) = 1018212795;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 64) = 850045863;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 88) = 0u;
    *(_OWORD *)(a1 + 104) = 0u;
    *(void *)(a1 + 120) = 0;
    *(void *)(a1 + 128) = a3;
    *(unsigned char *)(a1 + 136) = 1;
  }
  return a1;
}

uint64_t workqueue::workqueue::create_transaction@<X0>(workqueue::workqueue *this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return workqueue::transaction::transaction(a3, (uint64_t)this, a2);
}

uint64_t workqueue::workqueue::create_recurrent_block@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return workqueue::recurrent_block::recurrent_block(a4, a1, a2, a3);
}

uint64_t workqueue::recurrent_block::recurrent_block(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a2[3] + 8 * (atomic_fetch_add(a2 + 6, 1uLL) % ((uint64_t)(a2[4] - a2[3]) >> 3));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  v8[2] = ___ZN9workqueue15recurrent_blockC2ERNS_9workqueueEU13block_pointerFvvEy_block_invoke;
  v8[3] = &unk_2644A2D80;
  unint64_t v6 = (void **)(a1 + 16);
  v8[4] = a3;
  v8[5] = a1;
  v8[6] = a4;
  gcd::gcd_block::gcd_block((dispatch_block_t *)(a1 + 16), v8);
  if (*(void *)(a1 + 16) && *(unsigned char *)(*(void *)a1 + 56)) {
    gcd::gcd_queue::async(*(NSObject ***)(a1 + 8), v6, a4);
  }
  return a1;
}

void sub_21E388C8C(_Unwind_Exception *a1)
{
  gcd::gcd_block::~gcd_block(v1);
  _Unwind_Resume(a1);
}

void ___ZN9workqueue15recurrent_blockC2ERNS_9workqueueEU13block_pointerFvvEy_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  (*(void (**)(void))(a1[4] + 16))();
  uint64_t v3 = *(NSObject ***)(v2 + 8);
  uint64_t v4 = a1[6];
  gcd::gcd_queue::async(v3, (void **)(v2 + 16), v4);
}

void workqueue::recurrent_block::~recurrent_block(workqueue::recurrent_block *this)
{
}

void workqueue::recurrent_block::cancel(workqueue::recurrent_block *this)
{
  if (*((void *)this + 2))
  {
    if (*(unsigned char *)(*(void *)this + 56))
    {
      uint64_t v2 = (dispatch_queue_t *)*((void *)this + 1);
      v3[0] = MEMORY[0x263EF8330];
      v3[1] = 0x40000000;
      v3[2] = ___ZN9workqueue15recurrent_block6cancelEv_block_invoke;
      v3[3] = &__block_descriptor_tmp_2_0;
      v3[4] = this;
      gcd::gcd_queue::async(v2, v3);
      gcd::gcd_queue::sync(*((dispatch_queue_t **)this + 1), &__block_literal_global_10);
    }
  }
}

void ___ZN9workqueue15recurrent_block6cancelEv_block_invoke(uint64_t a1)
{
}

void *std::vector<gcd::gcd_queue>::__swap_out_circular_buffer(void *a1, void *a2)
{
  std::unique_lock<std::mutex> v5 = (void *)*a1;
  uint64_t v4 = (void *)a1[1];
  uint64_t result = (void *)a2[1];
  while (v4 != v5)
    uint64_t result = gcd::gcd_queue::gcd_queue(result - 1, --v4);
  a2[1] = result;
  unint64_t v7 = (void *)*a1;
  *a1 = result;
  a2[1] = v7;
  uint64_t v8 = a1[1];
  a1[1] = a2[2];
  a2[2] = v8;
  uint64_t v9 = a1[2];
  a1[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<gcd::gcd_queue>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    gcd::gcd_group::~gcd_group((NSObject **)(i - 8));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::__optional_destruct_base<workqueue::concurrent_limit,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 120))
  {
    std::mutex::~mutex((std::mutex *)(a1 + 48));
    std::condition_variable::~condition_variable((std::condition_variable *)a1);
  }
  return a1;
}

void std::__optional_destruct_base<workqueue::concurrent_limit,false>::reset[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 120))
  {
    std::mutex::~mutex((std::mutex *)(a1 + 48));
    std::condition_variable::~condition_variable((std::condition_variable *)a1);
    *(unsigned char *)(a1 + 120) = 0;
  }
}

void waitForDevCB(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = [[DIIOIterator alloc] initWithIOIterator:a2 retain:1];
  uint64_t v3 = [[DIIOObject alloc] initWithIteratorNext:v9];
  if (v3)
  {
    uint64_t v4 = v3;
    std::unique_lock<std::mutex> v5 = 0;
    do
    {
      id v6 = [(DIIOObject *)v4 newIteratorWithOptions:3 error:0];
      if (v6)
      {
        while (1)
        {
          unint64_t v7 = v5;
          std::unique_lock<std::mutex> v5 = [[DIIOObject alloc] initWithIteratorNext:v6];

          if (!v5 || IOObjectConformsTo([(DIIOObject *)v5 ioObj], "IOMedia")) {
            break;
          }
          if (IOObjectIsEqualTo([(DIIOObject *)v5 ioObj], *(_DWORD *)(a1 + 8)))
          {
            **(unsigned char **)a1 = 1;

            goto LABEL_9;
          }
        }
      }

      uint64_t v8 = [[DIIOObject alloc] initWithIteratorNext:v9];
      uint64_t v4 = v8;
    }
    while (v8);
LABEL_9:
  }
}

uint64_t DiskImages2_Attach(uint64_t a1, void *a2, void *a3)
{
  id v11 = 0;
  id v12 = 0;
  BOOL v5 = +[DICommonAttach defaultDiskImageAttach:a1 BSDName:&v12 error:&v11];
  id v6 = v12;
  id v7 = v11;
  uint64_t v8 = v7;
  if (v5)
  {
    uint64_t v9 = 0;
    if (a2) {
      *a2 = v6;
    }
  }
  else
  {
    if (a3) {
      *a3 = v7;
    }
    uint64_t v9 = [v8 code];
  }

  return v9;
}

void *diskimage_uio::small_vector_ns::llvm::safe_malloc(size_t this)
{
  while (1)
  {
    size_t v1 = this;
    uint64_t result = malloc_type_malloc(this, 0xEFF1C82EuLL);
    if (result) {
      break;
    }
    this = 1;
    if (v1) {
      abort();
    }
  }
  return result;
}

void *diskimage_uio::small_vector_ns::llvm::safe_calloc(diskimage_uio::small_vector_ns::llvm *this, size_t a2)
{
  uint64_t result = malloc_type_calloc((size_t)this, a2, 0x888F9946uLL);
  if (!result && (this && a2 || (uint64_t result = malloc_type_malloc(1uLL, 0xEFF1C82EuLL)) == 0)) {
    abort();
  }
  return result;
}

void *diskimage_uio::small_vector_ns::llvm::safe_realloc(diskimage_uio::small_vector_ns::llvm *this, size_t a2)
{
  uint64_t result = malloc_type_realloc(this, a2, 0x78369460uLL);
  if (!result && (a2 || (uint64_t result = malloc_type_malloc(1uLL, 0xEFF1C82EuLL)) == 0)) {
    abort();
  }
  return result;
}

void diskimage_uio::small_vector_ns::report_size_overflow(diskimage_uio::small_vector_ns *this, unint64_t a2)
{
  std::to_string(&v15, (unint64_t)this);
  uint64_t v3 = std::string::insert(&v15, 0, "SmallVector unable to grow. Requested capacity (", 0x30uLL);
  long long v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  v16.__r_.__value_.__r.__words[2] = v3->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v4;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  BOOL v5 = std::string::append(&v16, ") is larger than maximum value for size type (", 0x2EuLL);
  long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v17.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, a2);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  uint64_t v9 = std::string::append(&v17, (const std::string::value_type *)p_p, size);
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v18.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v18.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  id v11 = std::string::append(&v18, ")", 1uLL);
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v19.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::logic_error::logic_error(exception, &v19);
  exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  __cxa_throw(exception, (struct type_info *)off_2644A1FA8, MEMORY[0x263F8C060]);
}

void sub_21E38B880(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v33 - 25) < 0) {
    operator delete(*(void **)(v33 - 48));
  }
  _Unwind_Resume(exception_object);
}

void diskimage_uio::small_vector_ns::report_at_maximum_capacity(diskimage_uio::small_vector_ns *this)
{
  std::to_string(&v4, (unint64_t)this);
  size_t v1 = std::string::insert(&v4, 0, "SmallVector capacity unable to grow. Already at maximum size ", 0x3DuLL);
  long long v2 = *(_OWORD *)&v1->__r_.__value_.__l.__data_;
  v5.__r_.__value_.__r.__words[2] = v1->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v5.__r_.__value_.__l.__data_ = v2;
  v1->__r_.__value_.__l.__size_ = 0;
  v1->__r_.__value_.__r.__words[2] = 0;
  v1->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::logic_error::logic_error(exception, &v5);
  exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  __cxa_throw(exception, (struct type_info *)off_2644A1FA8, MEMORY[0x263F8C060]);
}

void sub_21E38B9D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL check_mntfromname(const char *a1)
{
  return !strcmp(a1, "lifs") || strcmp(a1, "fskit") == 0;
}

uint64_t _FSGetLocationFromStatfs(uint64_t a1, char *a2, size_t a3)
{
  long long v6 = malloc_type_calloc(1uLL, 0x400uLL, 0x1359B406uLL);
  if (v6)
  {
    id v7 = v6;
    if (check_mntfromname((const char *)(a1 + 72)))
    {
      uint64_t v8 = strstr((char *)(a1 + 1112), "://");
      if (!v8 || (v9 = v8 + 3, (long long v10 = strchr(v8 + 3, 47)) == 0))
      {
        uint64_t v12 = 22;
LABEL_17:
        free(v7);
        return v12;
      }
      if (v10 - v9 >= 1023) {
        uint64_t v11 = 1023;
      }
      else {
        uint64_t v11 = v10 - v9;
      }
      __memcpy_chk();
      *((unsigned char *)v7 + v11) = 0;
      if (!a2)
      {
LABEL_16:
        uint64_t v12 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      if (strncmp((const char *)(a1 + 1112), "/dev/disk", 9uLL)) {
        strncmp((const char *)(a1 + 1112), "/dev/rdisk", 0xAuLL);
      }
      __strlcpy_chk();
      if (!a2) {
        goto LABEL_16;
      }
    }
    strlcpy(a2, (const char *)v7, a3);
    goto LABEL_16;
  }
  return 12;
}

uint64_t aaS3ContextClone(uint64_t a1)
{
  long long v2 = malloc(0xAF8uLL);
  uint64_t v3 = (uint64_t)v2;
  if (!v2)
  {
    __int16 v7 = 192;
LABEL_36:
    uint64_t v33 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Context.c", (uint64_t)"aaS3ContextClone", v7, 80, *v33, "malloc", v34, v35, v46);
    AAS3ContextDestroy(v3);
    return 0;
  }
  memset_s(v2, 0xAF8uLL, 0, 0xAF8uLL);
  if (*(_DWORD *)a1)
  {
    *(_DWORD *)uint64_t v3 = 1;
    memcpy((void *)(v3 + 4), (const void *)(a1 + 4), 0xAC4uLL);
  }
  std::string v4 = *(const void **)(a1 + 2760);
  if (v4)
  {
    size_t v5 = strlen(*(const char **)(a1 + 2760));
    size_t v6 = v5 + 1;
    if (v5 + 1 >= 0x2000000001)
    {
      *__error() = 12;
LABEL_13:
      unint64_t v13 = (void *)(v3 + 2760);
      __int16 v7 = 198;
LABEL_35:
      *unint64_t v13 = 0;
      goto LABEL_36;
    }
    uint64_t v8 = malloc(v5 + 1);
    if (!v8) {
      goto LABEL_13;
    }
    uint64_t v9 = v8;
    memcpy(v8, v4, v6);
    *(void *)(v3 + 2760) = v9;
  }
  long long v10 = *(const void **)(a1 + 2768);
  if (v10)
  {
    size_t v11 = strlen(*(const char **)(a1 + 2768));
    size_t v12 = v11 + 1;
    if (v11 + 1 >= 0x2000000001)
    {
      *__error() = 12;
LABEL_19:
      unint64_t v13 = (void *)(v3 + 2768);
      __int16 v7 = 199;
      goto LABEL_35;
    }
    uint64_t v14 = malloc(v11 + 1);
    if (!v14) {
      goto LABEL_19;
    }
    std::string v15 = v14;
    memcpy(v14, v10, v12);
    *(void *)(v3 + 2768) = v15;
  }
  std::string v16 = *(const void **)(a1 + 2776);
  if (v16)
  {
    size_t v17 = strlen(*(const char **)(a1 + 2776));
    size_t v18 = v17 + 1;
    if (v17 + 1 >= 0x2000000001)
    {
      *__error() = 12;
LABEL_25:
      unint64_t v13 = (void *)(v3 + 2776);
      __int16 v7 = 200;
      goto LABEL_35;
    }
    std::string v19 = malloc(v17 + 1);
    if (!v19) {
      goto LABEL_25;
    }
    v20 = v19;
    memcpy(v19, v16, v18);
    *(void *)(v3 + 2776) = v20;
  }
  v21 = *(const void **)(a1 + 2784);
  if (v21)
  {
    size_t v22 = strlen(*(const char **)(a1 + 2784));
    size_t v23 = v22 + 1;
    if (v22 + 1 >= 0x2000000001)
    {
      *__error() = 12;
LABEL_34:
      unint64_t v13 = (void *)(v3 + 2784);
      __int16 v7 = 201;
      goto LABEL_35;
    }
    v24 = malloc(v22 + 1);
    if (!v24) {
      goto LABEL_34;
    }
    v25 = v24;
    memcpy(v24, v21, v23);
    *(void *)(v3 + 2784) = v25;
  }
  uint64_t v26 = *(void *)(a1 + 2792);
  if (v26)
  {
    list = 0;
    p_list = &list;
    while (1)
    {
      v28 = (curl_slist *)malloc(0x10uLL);
      if (!v28) {
        break;
      }
      p_data = &v28->data;
      v28->data = 0;
      v28->next = 0;
      *p_list = v28;
      v30 = strdup(*(const char **)v26);
      *p_data = v30;
      if (!v30) {
        break;
      }
      p_list = (curl_slist **)(p_data + 1);
      uint64_t v26 = *(void *)(v26 + 8);
      if (!v26)
      {
        BOOL v31 = 1;
        v32 = list;
        goto LABEL_39;
      }
    }
    curl_slist_free_all(list);
    v32 = 0;
    BOOL v31 = *(void *)(a1 + 2792) != 0;
LABEL_39:
    *(void *)(v3 + 2792) = v32;
    if (v31 && v32 == 0)
    {
      __int16 v7 = 202;
      goto LABEL_36;
    }
  }
  else
  {
    *(void *)(v3 + 2792) = 0;
  }
  uint64_t v38 = *(void *)(a1 + 2800);
  if (!v38)
  {
    *(void *)(v3 + 2800) = 0;
    return v3;
  }
  list = 0;
  v39 = &list;
  while (1)
  {
    v40 = (curl_slist *)malloc(0x10uLL);
    if (!v40) {
      break;
    }
    v41 = &v40->data;
    v40->data = 0;
    v40->next = 0;
    *v39 = v40;
    v42 = strdup(*(const char **)v38);
    *v41 = v42;
    if (!v42) {
      break;
    }
    v39 = (curl_slist **)(v41 + 1);
    uint64_t v38 = *(void *)(v38 + 8);
    if (!v38)
    {
      BOOL v43 = 1;
      v44 = list;
      goto LABEL_53;
    }
  }
  curl_slist_free_all(list);
  v44 = 0;
  BOOL v43 = *(void *)(a1 + 2800) != 0;
LABEL_53:
  *(void *)(v3 + 2800) = v44;
  if (v43 && v44 == 0)
  {
    __int16 v7 = 203;
    goto LABEL_36;
  }
  return v3;
}

void AAS3ContextDestroy(uint64_t a1)
{
  if (a1)
  {
    free(*(void **)(a1 + 2760));
    free(*(void **)(a1 + 2768));
    free(*(void **)(a1 + 2776));
    free(*(void **)(a1 + 2784));
    curl_slist_free_all(*(curl_slist **)(a1 + 2792));
    curl_slist_free_all(*(curl_slist **)(a1 + 2800));
    memset_s((void *)a1, 0xAF8uLL, 0, 0xAF8uLL);
    free((void *)a1);
  }
}

void *AAS3ContextCreate()
{
  v0 = malloc(0xAF8uLL);
  size_t v1 = v0;
  if (!v0)
  {
    uint64_t v9 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Context.c", (uint64_t)"AAS3ContextCreate", 355, 80, *v9, "malloc", v10, v11, v13);
    goto LABEL_5;
  }
  memset_s(v0, 0xAF8uLL, 0, 0xAF8uLL);
  if ((AAS3ContextSetFieldString((uint64_t)v1, 5, "Not A Ninja/1.0", v2, v3, v4, v5, v6) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Context.c", (uint64_t)"AAS3ContextCreate", 358, 80, 0, "set context", v7, v8, v13);
    memset_s(v1, 0xAF8uLL, 0, 0xAF8uLL);
LABEL_5:
    free(v1);
    return 0;
  }
  return v1;
}

uint64_t AAS3ContextSetFieldString(uint64_t a1, int a2, char *__s, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(a2)
  {
    case 0:
      uint64_t v9 = (void **)(a1 + 2760);
      if (__s) {
        goto LABEL_17;
      }
      goto LABEL_20;
    case 1:
      uint64_t v9 = (void **)(a1 + 2768);
      if (!__s) {
        goto LABEL_20;
      }
      goto LABEL_17;
    case 2:
      uint64_t v9 = (void **)(a1 + 2776);
      if (!__s) {
        goto LABEL_20;
      }
      goto LABEL_17;
    case 3:
      uint64_t v10 = (curl_slist **)(a1 + 2792);
      if (!__s) {
        return 0;
      }
      goto LABEL_12;
    case 4:
      uint64_t v10 = (curl_slist **)(a1 + 2800);
      if (!__s) {
        return 0;
      }
LABEL_12:
      if (!*__s) {
        return 0;
      }
      uint64_t v11 = curl_slist_append(*v10, __s);
      if (v11)
      {
        size_t v12 = v11;
        uint64_t result = 0;
        *uint64_t v10 = v12;
        return result;
      }
      int v18 = *__error();
      __int16 v21 = 407;
      goto LABEL_26;
    case 5:
      uint64_t v9 = (void **)(a1 + 2784);
      if (!__s) {
        goto LABEL_20;
      }
LABEL_17:
      if (!*__s)
      {
LABEL_20:
        std::string v16 = 0;
LABEL_21:
        free(*v9);
        uint64_t result = 0;
        int *v9 = v16;
        return result;
      }
      size_t v14 = strlen(__s);
      size_t v15 = v14 + 1;
      if (v14 + 1 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_24;
      }
      size_t v17 = malloc(v14 + 1);
      if (v17)
      {
        std::string v16 = v17;
        memcpy(v17, __s, v15);
        goto LABEL_21;
      }
LABEL_24:
      int v18 = *__error();
      __int16 v21 = 399;
LABEL_26:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Context.c", (uint64_t)"AAS3ContextSetFieldString", v21, 80, v18, "malloc", v19, v20, v22);
      return 0xFFFFFFFFLL;
    default:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Context.c", (uint64_t)"AAS3ContextSetFieldString", 391, 80, 0, "invalid field %u", a7, a8, a2);
      return 0xFFFFFFFFLL;
  }
}

uint64_t downloadStreamClose_curl(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)a1 >> 62)
    {
      v10.tv_sec = 0;
      *(void *)&v10.tv_usec = 0;
      gettimeofday(&v10, 0);
      double v2 = (double)v10.tv_sec + (double)v10.tv_usec * 0.000001 - *(double *)(a1 + 40);
      uint64_t v3 = (FILE **)MEMORY[0x263EF8348];
      fwrite("AAS3DownloadStream (curl)\n", 0x1AuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      uint64_t v4 = *v3;
      unint64_t v5 = atomic_load((unint64_t *)(a1 + 32));
      unint64_t v6 = atomic_load((unint64_t *)(a1 + 32));
      fprintf(v4, "%12llu bytes downloaded (%.2f MB)\n", v5, (double)v6 * 0.000000953674316);
      uint64_t v7 = *v3;
      unint64_t v8 = atomic_load((unint64_t *)(a1 + 32));
      fprintf(v7, "%12.2f MB/s download speed\n", (double)v8 / v2 * 0.000000953674316);
    }
    s3StreamBaseRelease(a1);
    memset_s((void *)a1, 0x30uLL, 0, 0x30uLL);
    free((void *)a1);
  }
  return 0;
}

AAByteStream_impl *s3DownloadStreamOpen_curl(char *a1, uint64_t a2, uint64_t a3)
{
  curl_global_init(3);
  unint64_t v6 = AACustomByteStreamOpen();
  uint64_t v7 = (double *)malloc(0x30uLL);
  if (!v7 || (unint64_t v8 = v7, memset_s(v7, 0x30uLL, 0, 0x30uLL), !v6))
  {
    perror("malloc");
    goto LABEL_7;
  }
  if ((s3StreamBaseInit(v8, a1, a2, a3) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamCurl.c", (uint64_t)"s3DownloadStreamOpen_curl", 132, 83, 0, "s3StreamBaseInit", v9, v10, v12.tv_sec);
LABEL_7:
    AAByteStreamClose(v6);
    return 0;
  }
  v12.tv_sec = 0;
  *(void *)&v12.tv_usec = 0;
  gettimeofday(&v12, 0);
  v8[5] = (double)v12.tv_sec + (double)v12.tv_usec * 0.000001;
  AACustomByteStreamSetData(v6, v8);
  AACustomByteStreamSetCloseProc(v6, (AAByteStreamCloseProc)downloadStreamClose_curl);
  AACustomByteStreamSetPReadProc(v6, (AAByteStreamPReadProc)downloadStreamPRead);
  AACustomByteStreamSetReadProc(v6, (AAByteStreamReadProc)downloadStreamRead);
  return v6;
}

uint64_t downloadStreamPRead(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  *(void *)&long long v19 = a2;
  *((void *)&v19 + 1) = a3;
  uint64_t v20 = 0;
  uint64_t v5 = a2;
  if (a3)
  {
    uint64_t v16 = a2;
    uint64_t v6 = a4 + a3;
    uint64_t v7 = a4 + a3 - 1;
    while (1)
    {
      snprintf(__str, 0xC8uLL, "Range: bytes=%llu-%llu", v6 - a3, v7);
      unsigned int v11 = 0;
      v21[0] = __str;
      v21[1] = 0;
      long long v17 = v19;
      uint64_t v18 = v20;
      useconds_t v12 = 125000;
      do
      {
        if (v11)
        {
          pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamCurl.c", (uint64_t)"downloadStreamPRead", 65, 83, "s3Perform retry after %u ms", v8, v9, v10, v12 / 0x3E8);
          usleep(v12);
          v12 *= 2;
        }
        long long v19 = v17;
        uint64_t v20 = v18;
        int v13 = s3Perform(1u, *(char **)(a1 + 8), a1, 0, &v19, 0, v21);
        if ((v13 & 0x80000000) == 0) {
          break;
        }
      }
      while (v11++ < 3);
      if (v13 < 0) {
        break;
      }
      a3 = *((void *)&v19 + 1);
      if (!*((void *)&v19 + 1))
      {
        uint64_t v5 = v19;
        a2 = v16;
        goto LABEL_12;
      }
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamCurl.c", (uint64_t)"downloadStreamPRead", 81, 83, 0, "s3Perform failed (after retry), %s", v9, v10, (char)__str);
    return -1;
  }
  else
  {
LABEL_12:
    uint64_t result = v5 - a2;
    atomic_fetch_add_explicit((atomic_ullong *volatile)(a1 + 32), v5 - a2, memory_order_relaxed);
  }
  return result;
}

uint64_t downloadStreamRead(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return downloadStreamPRead(a1, a2, a3, atomic_fetch_add((atomic_ullong *volatile)(a1 + 24), a3));
}

uint64_t s3HMAC_SHA256(_DWORD *a1, unsigned int *a2, const void *a3, size_t a4)
{
  memset(&v8, 0, sizeof(v8));
  CCHmacInit(&v8, 2u, a2 + 1, *a2);
  CCHmacUpdate(&v8, a3, a4);
  CCHmacFinal(&v8, a1 + 1);
  *a1 = 32;
  memset_s(a1 + 9, 0xE0uLL, 0, 0xE0uLL);
  memset_s(&v8, 0x180uLL, 0, 0x180uLL);
  return 0;
}

uint64_t s3SHA256(uint64_t a1, const void *a2, CC_LONG a3)
{
  memset(&v7, 0, sizeof(v7));
  CC_SHA256_Init(&v7);
  CC_SHA256_Update(&v7, a2, a3);
  CC_SHA256_Final((unsigned __int8 *)(a1 + 4), &v7);
  *(_DWORD *)a1 = 32;
  memset_s((void *)(a1 + 36), 0xE0uLL, 0, 0xE0uLL);
  return memset_s(&v7, 0x68uLL, 0, 0x68uLL);
}

size_t s3BufWrite(char *__src, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = __src;
  size_t v5 = a3 * a2;
  uint64_t v6 = *(void *)(a4 + 16);
  if (v6)
  {
    if (*(void *)(v6 + 24))
    {
      uint64_t v7 = 0;
      if (v5)
      {
        while (1)
        {
          uint64_t v8 = (*(uint64_t (**)(void, char *, size_t))(v6 + 24))(*(void *)v6, v4, v5);
          if (v8 < 1) {
            break;
          }
          v4 += v8;
          v7 += v8;
          v5 -= v8;
          if (!v5) {
            return v7 & ~(v7 >> 63);
          }
        }
        uint64_t v7 = v8;
      }
    }
    else
    {
      uint64_t v7 = -1;
    }
    return v7 & ~(v7 >> 63);
  }
  else
  {
    if (v5 >= *(void *)(a4 + 8)) {
      size_t v5 = *(void *)(a4 + 8);
    }
    memcpy(*(void **)a4, __src, v5);
    size_t v10 = *(void *)(a4 + 8) - v5;
    *(void *)a4 += v5;
    *(void *)(a4 + 8) = v10;
    return v5;
  }
}

size_t s3BufRead(char *__dst, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = __dst;
  size_t v5 = a3 * a2;
  uint64_t v6 = *(void *)(a4 + 16);
  if (v6)
  {
    if (*(void *)(v6 + 16))
    {
      uint64_t v7 = 0;
      if (v5)
      {
        while (1)
        {
          uint64_t v8 = (*(uint64_t (**)(void, char *, size_t))(v6 + 16))(*(void *)v6, v4, v5);
          if (v8 < 0) {
            break;
          }
          if (v8)
          {
            v4 += v8;
            v7 += v8;
            v5 -= v8;
            if (v5) {
              continue;
            }
          }
          return v7 & ~(v7 >> 63);
        }
        uint64_t v7 = v8;
      }
    }
    else
    {
      uint64_t v7 = -1;
    }
    return v7 & ~(v7 >> 63);
  }
  else
  {
    if (v5 >= *(void *)(a4 + 8)) {
      size_t v5 = *(void *)(a4 + 8);
    }
    memcpy(__dst, *(const void **)a4, v5);
    size_t v10 = *(void *)(a4 + 8) - v5;
    *(void *)a4 += v5;
    *(void *)(a4 + 8) = v10;
    return v5;
  }
}

uint64_t s3HeaderAppendWithFormat(curl_slist **a1, char *__format, ...)
{
  va_start(va, __format);
  int v4 = vsnprintf(0, 0, __format, va);
  if (v4 < 0)
  {
    unsigned int v11 = 0;
LABEL_8:
    useconds_t v12 = "vsnprintf";
    __int16 v13 = 156;
    int v14 = 0;
LABEL_12:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3HeaderAppendWithFormat", v13, 84, v14, v12, v5, v6, v20);
    uint64_t v18 = 0xFFFFFFFFLL;
    uint64_t v7 = v11;
  }
  else
  {
    uint64_t v7 = 0;
    char v8 = 1;
    while ((v8 & 1) != 0)
    {
      size_t v9 = (v4 + 1);
      size_t v10 = (char *)realloc(v7, v9);
      unsigned int v11 = v10;
      if (!v10)
      {
        free(v7);
        int v14 = *__error();
        useconds_t v12 = "malloc";
        __int16 v13 = 161;
        goto LABEL_12;
      }
      int v4 = vsnprintf(v10, v9, __format, va);
      char v8 = 0;
      uint64_t v7 = v11;
      if (v4 < 0) {
        goto LABEL_8;
      }
    }
    size_t v15 = curl_slist_append(*a1, v7);
    if (v15)
    {
      uint64_t v18 = 0;
      *a1 = v15;
    }
    else
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3HeaderAppendWithFormat", 168, 84, 0, "curl_slist_append failed\n", v16, v17, v20);
      uint64_t v18 = 0xFFFFFFFFLL;
    }
  }
  free(v7);
  return v18;
}

uint64_t s3HeaderAppend(curl_slist **a1, const char *a2)
{
  uint64_t v3 = curl_slist_append(*a1, a2);
  uint64_t v6 = v3;
  if (v3) {
    *a1 = v3;
  }
  else {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3HeaderAppend", 182, 84, 0, "curl_slist_append failed\n", v4, v5, v8);
  }
  if (v6) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

unint64_t curlWriteData(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6 = a3 * a2;
  if ((*(_DWORD *)(a4 + 8) & 0x80000000) != 0)
  {
    uint64_t v11 = 499;
    curl_easy_getinfo(*(CURL **)a4, CURLINFO_RESPONSE_CODE, &v11);
    int v7 = v11;
    *(_DWORD *)(a4 + 8) = v11;
    if (v7 == 200)
    {
      if (*(_DWORD *)(a4 + 12)) {
        *(void *)(a4 + 24) = *(void *)(a4 + 16);
      }
    }
  }
  unint64_t v8 = *(void *)(a4 + 24);
  uint64_t v9 = v6 - v8;
  if (v6 >= v8)
  {
    if (v8)
    {
      a1 += v8;
      *(void *)(a4 + 24) = 0;
    }
    else
    {
      uint64_t v9 = v6;
    }
    s3BufWrite(a1, v9, 1, *(void *)(a4 + 32));
  }
  else
  {
    *(void *)(a4 + 24) = v8 - v6;
  }
  return v6;
}

uint64_t s3Perform(unsigned int a1, char *a2, uint64_t a3, uint64_t a4, long long *a5, uint64_t a6, const char **a7)
{
  uint64_t v14 = *(void *)(a3 + 16);
  v61 = 0;
  if (a4) {
    uint64_t v15 = *(void *)(a4 + 8);
  }
  else {
    uint64_t v15 = -1;
  }
  long long v59 = 0uLL;
  uint64_t v60 = 0;
  if (a5)
  {
    long long v59 = *a5;
    uint64_t v60 = *((void *)a5 + 2);
  }
  v58 = 0;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v16 = curl_easy_init();
  if (!v16)
  {
    uint64_t v26 = (FILE *)*MEMORY[0x263EF8348];
    v27 = "curl_easy_init failed\n";
    size_t v28 = 22;
LABEL_42:
    fwrite(v27, v28, 1uLL, v26);
    goto LABEL_43;
  }
  if ((s3HeaderAppend(&v61, "Content-Type:") & 0x80000000) != 0
    || (s3HeaderAppend(&v61, "Transfer-Encoding:") & 0x80000000) != 0
    || (s3HeaderAppend(&v61, "Accept: application/xml") & 0x80000000) != 0
    || (v15 & 0x8000000000000000) == 0
    && (s3HeaderAppendWithFormat(&v61, "Content-Length: %zd", v15) & 0x80000000) != 0)
  {
    goto LABEL_43;
  }
  uint64_t v17 = *(void *)(*(void *)(a3 + 16) + 2792);
  if (v17)
  {
    while ((s3HeaderAppend(&v61, *(const char **)v17) & 0x80000000) == 0)
    {
      uint64_t v17 = *(void *)(v17 + 8);
      if (!v17) {
        goto LABEL_15;
      }
    }
    goto LABEL_43;
  }
LABEL_15:
  if (a7)
  {
    uint64_t v18 = *a7;
    if (*a7)
    {
      long long v19 = a7 + 1;
      while ((s3HeaderAppend(&v61, v18) & 0x80000000) == 0)
      {
        char v20 = *v19++;
        uint64_t v18 = v20;
        if (!v20) {
          goto LABEL_20;
        }
      }
      goto LABEL_43;
    }
  }
LABEL_20:
  if (*(_DWORD *)v14 && (s3Sign(&v61, a1, a2, v14, a4) & 0x80000000) != 0)
  {
    uint64_t v26 = (FILE *)*MEMORY[0x263EF8348];
    v27 = "Failed to sign request\n";
    size_t v28 = 23;
    goto LABEL_42;
  }
  CURLcode v21 = curl_easy_setopt(v16, CURLOPT_URL, a2);
  CURLcode v22 = curl_easy_setopt(v16, CURLOPT_HTTPHEADER, v61);
  CURLcode v23 = curl_easy_setopt(v16, CURLOPT_BUFFERSIZE, 102400);
  BOOL v24 = (curl_easy_setopt(v16, CURLOPT_TCP_KEEPALIVE, 1) | v23 | v22 | v21) == 0;
  if (*(void *)(v14 + 2784) && curl_easy_setopt(v16, CURLOPT_USERAGENT, *(void *)(v14 + 2784))) {
    BOOL v24 = 0;
  }
  if (*(void *)(v14 + 2760) && curl_easy_setopt(v16, CURLOPT_PROXY, *(void *)(v14 + 2760))) {
    BOOL v24 = 0;
  }
  if (*(void *)(v14 + 2768) && curl_easy_setopt(v16, CURLOPT_PINNEDPUBLICKEY, *(void *)(v14 + 2768))) {
    BOOL v24 = 0;
  }
  if (*(void *)(v14 + 2776) && curl_easy_setopt(v16, CURLOPT_PROXY_PINNEDPUBLICKEY, *(void *)(v14 + 2776))) {
    BOOL v24 = 0;
  }
  if (*(void *)(v14 + 2800) && curl_easy_setopt(v16, CURLOPT_PROXYHEADER, *(void *)(v14 + 2800))) {
    BOOL v24 = 0;
  }
  if (a1 != 2)
  {
    if (a1 == 1)
    {
      CURLcode v33 = curl_easy_setopt(v16, CURLOPT_CUSTOMREQUEST, "GET");
      BOOL v25 = (curl_easy_setopt(v16, CURLOPT_FOLLOWLOCATION, 1) | v33) == 0;
    }
    else
    {
      if (a1) {
        goto LABEL_53;
      }
      BOOL v25 = curl_easy_setopt(v16, CURLOPT_PUT, 1) == CURLE_OK;
    }
    if (!v25) {
      BOOL v24 = 0;
    }
LABEL_53:
    if (!a4) {
      goto LABEL_57;
    }
    goto LABEL_54;
  }
  if (curl_easy_setopt(v16, CURLOPT_POST, 1)) {
    BOOL v24 = 0;
  }
  if (!a4)
  {
    CURLcode v31 = curl_easy_setopt(v16, CURLOPT_POSTFIELDS, "");
    unsigned __int32 v32 = curl_easy_setopt(v16, CURLOPT_POSTFIELDSIZE, 0) | v31;
    goto LABEL_55;
  }
LABEL_54:
  CURLcode v34 = curl_easy_setopt(v16, CURLOPT_READFUNCTION, s3BufRead);
  unsigned __int32 v32 = curl_easy_setopt(v16, CURLOPT_READDATA, a4) | v34;
LABEL_55:
  if (v32) {
    BOOL v24 = 0;
  }
LABEL_57:
  if (a5)
  {
    *(void *)&long long v56 = v16;
    v58 = a5;
    DWORD2(v56) = -1;
    if (a7)
    {
      uint64_t v35 = *a7;
      if (*a7)
      {
        uint64_t v36 = 0;
        uint64_t v37 = MEMORY[0x263EF8318];
        do
        {
          if (!strncmp(v35, "Range:", 6uLL))
          {
            int v40 = *((unsigned __int8 *)v35 + 6);
            v39 = v35 + 6;
            char v38 = v40;
            if (v40)
            {
              do
              {
                if (v38 < 0)
                {
                  if (!__maskrune(v38, 0x4000uLL)) {
                    break;
                  }
                }
                else if ((*(_DWORD *)(v37 + 4 * v38 + 60) & 0x4000) == 0)
                {
                  break;
                }
                int v41 = *(unsigned __int8 *)++v39;
                char v38 = v41;
              }
              while (v41);
            }
            if (!strncmp(v39, "bytes=", 6uLL))
            {
              int v44 = *((unsigned __int8 *)v39 + 6);
              BOOL v43 = v39 + 6;
              char v42 = v44;
              if (v44)
              {
                do
                {
                  if (v42 < 0)
                  {
                    if (!__maskrune(v42, 0x4000uLL)) {
                      break;
                    }
                  }
                  else if ((*(_DWORD *)(v37 + 4 * v42 + 60) & 0x4000) == 0)
                  {
                    break;
                  }
                  int v45 = *(unsigned __int8 *)++v43;
                  char v42 = v45;
                }
                while (v45);
              }
              HIDWORD(v56) = 1;
              *(void *)&long long v57 = strtoull(v43, 0, 0);
            }
          }
          uint64_t v35 = a7[++v36];
        }
        while (v35);
      }
    }
    CURLcode v46 = curl_easy_setopt(v16, CURLOPT_WRITEFUNCTION, curlWriteData);
    if (curl_easy_setopt(v16, CURLOPT_WRITEDATA, &v56) | v46) {
      BOOL v24 = 0;
    }
  }
  if (a6)
  {
    if (curl_easy_setopt(v16, CURLOPT_HEADERFUNCTION, s3BufWrite)) {
      BOOL v24 = 0;
    }
    if (curl_easy_setopt(v16, CURLOPT_HEADERDATA, a6)) {
      goto LABEL_86;
    }
  }
  if (!v24)
  {
LABEL_86:
    uint64_t v26 = (FILE *)*MEMORY[0x263EF8348];
    v27 = "curl_easy_setopt failed\n";
    size_t v28 = 24;
    goto LABEL_42;
  }
  CURLcode v47 = curl_easy_perform(v16);
  if (v47 == CURLE_OK)
  {
    uint64_t v55 = 499;
    curl_easy_getinfo(v16, CURLINFO_RESPONSE_CODE, &v55);
    if ((unint64_t)(v55 - 400) <= 0xC7)
    {
      if (a1 != 1 || v55 != 416)
      {
        pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3Perform", 401, 84, "HTTP %u\n", v52, v53, v54, v55);
        goto LABEL_43;
      }
      if (a5)
      {
        uint64_t v29 = 0;
        *a5 = v59;
        *((void *)a5 + 2) = v60;
        goto LABEL_44;
      }
    }
    uint64_t v29 = 0;
    goto LABEL_44;
  }
  char v48 = v47;
  curl_easy_strerror(v47);
  pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3Perform", 379, 84, "> %d %s\n", v49, v50, v51, v48);
LABEL_43:
  uint64_t v29 = 0xFFFFFFFFLL;
LABEL_44:
  curl_slist_free_all(v61);
  curl_easy_cleanup(v16);
  return v29;
}

uint64_t s3Sign(curl_slist **a1, unsigned int a2, char *__s, uint64_t a4, uint64_t a5)
{
  uint64_t v142 = *MEMORY[0x263EF8340];
  v119[0] = 0;
  v119[1] = 0;
  v120 = 0;
  v117[0] = 0;
  v117[1] = 0;
  v118 = 0;
  v115[0] = 0;
  v115[1] = 0;
  v116 = 0;
  v113[0] = 0;
  v113[1] = 0;
  v114 = 0;
  int v124 = 0;
  memset(__sa, 0, sizeof(__sa));
  size_t v10 = strlen(__s);
  if (v10 < 7) {
    goto LABEL_8;
  }
  if (*(_DWORD *)__s == 1886680168 && *(_DWORD *)(__s + 3) == 791624304)
  {
    uint64_t v19 = 7;
  }
  else
  {
    if (v10 < 8 || *(void *)__s != 0x2F2F3A7370747468)
    {
LABEL_8:
      uint64_t v14 = "Invalid URL";
      __int16 v15 = 486;
LABEL_9:
      int v16 = 0;
LABEL_10:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3Sign", v15, 84, v16, v14, v11, v12, v101);
LABEL_11:
      BOOL v17 = 0;
      goto LABEL_12;
    }
    uint64_t v19 = 8;
  }
  char v20 = &__s[v19];
  CURLcode v21 = strchr(&__s[v19], 47);
  if (!v21)
  {
    uint64_t v14 = "Invalid URL";
    __int16 v15 = 488;
    goto LABEL_9;
  }
  CURLcode v22 = v21;
  v111 = v20;
  unsigned int v109 = a2;
  CURLcode v23 = strchr(v21, 63);
  BOOL v24 = "/";
  v110 = v22;
  if (!v23)
  {
    size_t v30 = strlen(v22);
    if (v30 <= 1) {
      uint64_t v29 = 1;
    }
    else {
      uint64_t v29 = v30;
    }
    if (v30) {
      BOOL v24 = v22;
    }
    goto LABEL_32;
  }
  BOOL v25 = v23;
  uint64_t v26 = v23 + 1;
  size_t v27 = strlen(v23 + 1);
  BOOL v28 = v25 == v22;
  if (v25 == v22) {
    uint64_t v29 = 1;
  }
  else {
    uint64_t v29 = v25 - v22;
  }
  if (!v28) {
    BOOL v24 = v22;
  }
  if (!v27)
  {
LABEL_32:
    size_t v27 = 0;
    uint64_t v26 = "";
  }
  size_t __n = v27;
  v108 = (char *)v26;
  if ((s3HeaderAppendWithFormat(a1, "X-Amz-Date: %s", (const char *)(a4 + 68)) & 0x80000000) != 0
    || *(unsigned char *)(a4 + 452)
    && (s3HeaderAppendWithFormat(a1, "X-Amz-Security-Token: %s", (const char *)(a4 + 452)) & 0x80000000) != 0)
  {
    goto LABEL_11;
  }
  __src = (char *)v24;
  if (a5)
  {
    CURLcode v31 = *(const void **)a5;
    uint64_t v32 = *(void *)(a5 + 8);
    int v141 = 0;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    s3SHA256((uint64_t)&v125, v31, v32);
    if (v125)
    {
      uint64_t v33 = v29;
      CURLcode v34 = (unsigned __int8 *)&v125 + 4;
      uint64_t v35 = 2 * v125;
      size_t v36 = v35 | 1;
      uint64_t v37 = __str;
      do
      {
        int v38 = *v34++;
        snprintf(v37, v36, "%02x", v38);
        v36 -= 2;
        v37 += 2;
      }
      while (v36 != 1);
LABEL_44:
      uint64_t v29 = v33;
      goto LABEL_46;
    }
  }
  else
  {
    int v141 = 0;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    s3SHA256((uint64_t)&v125, 0, 0);
    if (v125)
    {
      uint64_t v33 = v29;
      v39 = (unsigned __int8 *)&v125 + 4;
      uint64_t v35 = 2 * v125;
      size_t v40 = v35 | 1;
      int v41 = __str;
      do
      {
        int v42 = *v39++;
        snprintf(v41, v40, "%02x", v42);
        v40 -= 2;
        v41 += 2;
      }
      while (v40 != 1);
      goto LABEL_44;
    }
  }
  uint64_t v35 = 0;
LABEL_46:
  __str[v35] = 0;
  memset_s(&v125, 0x104uLL, 0, 0x104uLL);
  if ((s3HeaderAppendWithFormat(a1, "X-Amz-Content-Sha256: %s", __str) & 0x80000000) != 0) {
    goto LABEL_11;
  }
  BOOL v43 = *a1;
  if (*a1)
  {
    uint64_t v44 = 0;
    do
    {
      ++v44;
      BOOL v43 = v43->next;
    }
    while (v43);
  }
  else
  {
    uint64_t v44 = 0;
  }
  v112 = calloc(v44 + 1, 8uLL);
  if (!v112)
  {
    int v16 = *__error();
    uint64_t v14 = "malloc";
    __int16 v15 = 520;
    goto LABEL_10;
  }
  v104 = (char *)(a4 + 68);
  size_t v105 = v29;
  v102 = a1;
  uint64_t v103 = a4;
  int v45 = *a1;
  if (!v45)
  {
    uint64_t v46 = 0;
LABEL_77:
    size_t v56 = v22 - v111;
    size_t v57 = v110 - v111 + 6;
    if (v57 >= 0x2000000001)
    {
      *__error() = 12;
LABEL_82:
      int v61 = *__error();
      __int16 v64 = 554;
      goto LABEL_85;
    }
    v58 = (char *)malloc(v57);
    if (!v58) {
      goto LABEL_82;
    }
    long long v59 = &v58[v56];
    v112[v46] = v58;
    v58[4] = 58;
    *(_DWORD *)v58 = 1953722216;
    memcpy(v58 + 5, v111, v56);
    v59[5] = 0;
    qsort(v112, v46 + 1, 8uLL, (int (__cdecl *)(const void *, const void *))s3StringCompare);
    if (v109 > 3) {
      uint64_t v60 = "???";
    }
    else {
      uint64_t v60 = off_2644A2DE0[v109];
    }
    size_t v65 = strlen(v60);
    if ((s3StringBufferAppend(v119, v60, v65) & 0x80000000) == 0
      && (s3StringBufferAppend(v119, "\n", 1uLL) & 0x80000000) == 0
      && (s3StringBufferAppend(v119, __src, v105) & 0x80000000) == 0
      && (s3StringBufferAppend(v119, "\n", 1uLL) & 0x80000000) == 0
      && (s3StringBufferAppend(v119, v108, __n) & 0x80000000) == 0
      && (s3StringBufferAppend(v119, "\n", 1uLL) & 0x80000000) == 0)
    {
      if (v46 == -1)
      {
LABEL_102:
        if ((s3StringBufferAppend(v119, "\n", 1uLL) & 0x80000000) == 0)
        {
          v73 = v118;
          size_t v74 = strlen(v118);
          if ((s3StringBufferAppend(v119, v118, v74) & 0x80000000) == 0
            && (s3StringBufferAppend(v119, "\n", 1uLL) & 0x80000000) == 0)
          {
            size_t v75 = strlen(__str);
            if ((s3StringBufferAppend(v119, __str, v75) & 0x80000000) == 0
              && (s3StringBufferAppend(v115, "AWS4-HMAC-SHA256\n", 0x11uLL) & 0x80000000) == 0)
            {
              size_t v76 = strlen(v104);
              if ((s3StringBufferAppend(v115, v104, v76) & 0x80000000) == 0
                && (s3StringBufferAppend(v115, "\n", 1uLL) & 0x80000000) == 0)
              {
                v77 = (char *)(v103 + 4);
                size_t v78 = strlen((const char *)(v103 + 4));
                if ((s3StringBufferAppend(v115, (void *)(v103 + 4), v78) & 0x80000000) == 0
                  && (s3StringBufferAppend(v115, "/", 1uLL) & 0x80000000) == 0)
                {
                  v79 = (char *)(v103 + 132);
                  size_t v80 = strlen((const char *)(v103 + 132));
                  if ((s3StringBufferAppend(v115, (void *)(v103 + 132), v80) & 0x80000000) == 0
                    && (s3StringBufferAppend(v115, "/s3/aws4_request\n", 0x11uLL) & 0x80000000) == 0)
                  {
                    int v141 = 0;
                    long long v139 = 0u;
                    long long v140 = 0u;
                    long long v137 = 0u;
                    long long v138 = 0u;
                    long long v135 = 0u;
                    long long v136 = 0u;
                    long long v133 = 0u;
                    long long v134 = 0u;
                    long long v131 = 0u;
                    long long v132 = 0u;
                    long long v129 = 0u;
                    long long v130 = 0u;
                    long long v127 = 0u;
                    long long v128 = 0u;
                    long long v125 = 0u;
                    long long v126 = 0u;
                    CC_LONG v81 = strlen(v120);
                    s3SHA256((uint64_t)&v125, v120, v81);
                    if (v125)
                    {
                      v82 = (unsigned __int8 *)&v125 + 4;
                      uint64_t v83 = 2 * v125;
                      size_t v84 = v83 | 1;
                      v85 = v121;
                      do
                      {
                        int v86 = *v82++;
                        snprintf(v85, v84, "%02x", v86);
                        v84 -= 2;
                        v85 += 2;
                      }
                      while (v84 != 1);
                    }
                    else
                    {
                      uint64_t v83 = 0;
                    }
                    v121[v83] = 0;
                    memset_s(&v125, 0x104uLL, 0, 0x104uLL);
                    size_t v89 = strlen(v121);
                    if ((s3StringBufferAppend(v115, v121, v89) & 0x80000000) == 0)
                    {
                      size_t v90 = strlen(v116);
                      s3HMAC_SHA256(__sa, (unsigned int *)(v103 + 2500), v116, v90);
                      if (LODWORD(__sa[0]))
                      {
                        v91 = (unsigned __int8 *)__sa + 4;
                        uint64_t v92 = 2 * LODWORD(__sa[0]);
                        size_t v93 = v92 | 1;
                        v94 = v121;
                        do
                        {
                          int v95 = *v91++;
                          snprintf(v94, v93, "%02x", v95);
                          v93 -= 2;
                          v94 += 2;
                        }
                        while (v93 != 1);
                      }
                      else
                      {
                        uint64_t v92 = 0;
                      }
                      v121[v92] = 0;
                      if ((s3StringBufferAppend(v113, "AWS4-HMAC-SHA256 Credential=", 0x1CuLL) & 0x80000000) == 0)
                      {
                        size_t v96 = strlen((const char *)(v103 + 196));
                        if ((s3StringBufferAppend(v113, (void *)(v103 + 196), v96) & 0x80000000) == 0
                          && (s3StringBufferAppend(v113, "/", 1uLL) & 0x80000000) == 0)
                        {
                          size_t v97 = strlen(v77);
                          if ((s3StringBufferAppend(v113, v77, v97) & 0x80000000) == 0
                            && (s3StringBufferAppend(v113, "/", 1uLL) & 0x80000000) == 0)
                          {
                            size_t v98 = strlen(v79);
                            if ((s3StringBufferAppend(v113, v79, v98) & 0x80000000) == 0
                              && (s3StringBufferAppend(v113, "/s3/aws4_request,SignedHeaders=", 0x1FuLL) & 0x80000000) == 0)
                            {
                              size_t v99 = strlen(v73);
                              if ((s3StringBufferAppend(v113, v73, v99) & 0x80000000) == 0
                                && (s3StringBufferAppend(v113, ",Signature=", 0xBuLL) & 0x80000000) == 0)
                              {
                                size_t v100 = strlen(v121);
                                if ((s3StringBufferAppend(v113, v121, v100) & 0x80000000) == 0)
                                {
                                  BOOL v17 = (int)s3HeaderAppendWithFormat(v102, "Authorization: %s", v114) >= 0;
                                  goto LABEL_119;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      else
      {
        uint64_t v66 = 0;
        while (1)
        {
          v67 = (char *)v112[v66];
          v68 = strchr(v67, 58);
          if (!v68) {
            break;
          }
          v71 = v68;
          size_t v72 = strlen(v67);
          if ((s3StringBufferAppend(v119, v67, v72) & 0x80000000) != 0
            || (s3StringBufferAppend(v119, "\n", 1uLL) & 0x80000000) != 0
            || v66 && (s3StringBufferAppend(v117, ";", 1uLL) & 0x80000000) != 0
            || (s3StringBufferAppend(v117, v67, v71 - v67) & 0x80000000) != 0)
          {
            goto LABEL_118;
          }
          if (v46 + 1 == ++v66) {
            goto LABEL_102;
          }
        }
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3Sign", 580, 84, 0, "Invalid header: %s", v69, v70, (char)v67);
      }
    }
LABEL_118:
    BOOL v17 = 0;
LABEL_119:
    ++v46;
    goto LABEL_120;
  }
  uint64_t v46 = 0;
  uint64_t v47 = MEMORY[0x263EF8318];
  while (1)
  {
    data = v45->data;
    if (strncasecmp(v45->data, "x-amz-", 6uLL)) {
      goto LABEL_73;
    }
    size_t v49 = strlen(data);
    if (v49 + 1 >= 0x2000000001) {
      break;
    }
    uint64_t v50 = malloc(v49 + 1);
    if (!v50) {
      goto LABEL_84;
    }
    uint64_t v51 = v50;
    v112[v46] = v50;
    if (v49)
    {
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      int v54 = 1;
      while (1)
      {
        unsigned int v55 = v45->data[v52];
        if ((v55 & 0x80000000) != 0)
        {
          if (!__maskrune(v45->data[v52], 0x4000uLL))
          {
LABEL_64:
            if (v55 == 58) {
              int v54 = 0;
            }
            if (v54) {
              LOBYTE(v55) = __tolower(v55);
            }
            v51[v53++] = v55;
          }
        }
        else if ((*(_DWORD *)(v47 + 4 * v55 + 60) & 0x4000) == 0)
        {
          goto LABEL_64;
        }
        if (v49 == ++v52) {
          goto LABEL_72;
        }
      }
    }
    uint64_t v53 = 0;
LABEL_72:
    ++v46;
    v51[v53] = 0;
LABEL_73:
    int v45 = v45->next;
    if (!v45) {
      goto LABEL_77;
    }
  }
  *__error() = 12;
LABEL_84:
  int v61 = *__error();
  __int16 v64 = 538;
LABEL_85:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3Sign", v64, 84, v61, "malloc", v62, v63, v101);
  BOOL v17 = 0;
LABEL_120:
  if (v46)
  {
    v87 = (void **)v112;
    do
    {
      v88 = *v87++;
      free(v88);
      --v46;
    }
    while (v46);
  }
  free(v112);
LABEL_12:
  memset_s(__sa, 0x104uLL, 0, 0x104uLL);
  memset_s(v121, 0x80uLL, 0, 0x80uLL);
  memset_s(__str, 0x80uLL, 0, 0x80uLL);
  s3StringBufferFree((uint64_t)v119);
  s3StringBufferFree((uint64_t)v117);
  s3StringBufferFree((uint64_t)v115);
  s3StringBufferFree((uint64_t)v113);
  if (v17) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t s3StringCompare(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

uint64_t s3StringBufferAppend(unint64_t *a1, void *__src, size_t __n)
{
  unint64_t v7 = *a1;
  unint64_t v6 = a1[1];
  size_t v8 = v6 + __n + 1;
  BOOL v9 = v8 >= *a1;
  size_t v10 = v8 - *a1;
  if (!v9) {
    size_t v10 = 0;
  }
  unint64_t v11 = (v10 + 255) & 0xFFFFFFFFFFFFFF00;
  unint64_t v12 = v7 + v11;
  __int16 v13 = (char *)a1[2];
  if (v7 + v11 <= v7) {
    goto LABEL_8;
  }
  if (v12 < 0x2000000001)
  {
    uint64_t v14 = (char *)realloc((void *)a1[2], v7 + v11);
    if (!v14)
    {
      free(v13);
      goto LABEL_10;
    }
    a1[2] = (unint64_t)v14;
    *a1 = v12;
    __int16 v13 = v14;
    unint64_t v6 = a1[1];
LABEL_8:
    memcpy(&v13[v6], __src, __n);
    uint64_t result = 0;
    unint64_t v16 = a1[2];
    uint64_t v17 = a1[1] + __n;
    a1[1] = v17;
    *(unsigned char *)(v16 + v17) = 0;
    return result;
  }
  *__error() = 12;
LABEL_10:
  a1[2] = 0;
  uint64_t v18 = __error();
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3StringBufferAppend", 431, 84, *v18, "malloc", v19, v20, v21);
  *a1 = 0;
  a1[1] = 0;
  return 0xFFFFFFFFLL;
}

void s3StringBufferFree(uint64_t a1)
{
  size_t v1 = *(void **)(a1 + 16);
  if (v1) {
    memset_s(*(void **)(a1 + 16), *(void *)a1, 0, *(void *)a1);
  }
  free(v1);
}

uint64_t s3StreamBaseInit(void *__s, char *a2, uint64_t a3, uint64_t a4)
{
  if (__s) {
    memset_s(__s, 0x18uLL, 0, 0x18uLL);
  }
  *__s = a4;
  if (a2)
  {
    size_t v8 = strlen(a2);
    size_t v9 = v8 + 1;
    if (v8 + 1 >= 0x2000000001)
    {
      *__error() = 12;
LABEL_10:
      __s[1] = 0;
      int v13 = *__error();
      unint64_t v16 = "strdup";
      __int16 v17 = 653;
      goto LABEL_15;
    }
    size_t v10 = malloc(v8 + 1);
    if (!v10) {
      goto LABEL_10;
    }
    unint64_t v11 = v10;
    memcpy(v10, a2, v9);
    __s[1] = v11;
  }
  if (a3) {
    uint64_t v12 = aaS3ContextClone(a3);
  }
  else {
    uint64_t v12 = (uint64_t)AAS3ContextCreate();
  }
  __s[2] = v12;
  if (v12) {
    return 0;
  }
  int v13 = *__error();
  unint64_t v16 = "malloc";
  __int16 v17 = 656;
LABEL_15:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3StreamBaseInit", v17, 84, v13, v16, v14, v15, v19);
  s3StreamBaseRelease((uint64_t)__s);
  return 0xFFFFFFFFLL;
}

uint64_t s3StreamBaseRelease(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  AAS3ContextDestroy(*(void *)(a1 + 16));
  return memset_s((void *)a1, 0x18uLL, 0, 0x18uLL);
}

AAByteStream_impl *AAS3DownloadStreamOpen(char *a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a2 && *(_DWORD *)a2) {
    return s3DownloadStreamOpen_curl(a1, a2, a3);
  }
  else {
    return s3DownloadStreamOpen_urlsession(a1, a2, a3, a4);
  }
}

void sub_21E38E42C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32w(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32w(uint64_t a1)
{
}

uint64_t downloadStreamClose_urlsession(void *a1)
{
  if (a1)
  {
    double v2 = (void *)a1[3];
    if (v2)
    {
      a1[3] = 0;
      atomic_store([v2 bytesDownloaded], a1 + 5);
      [v2 invalidateAndCancel];
    }
    if (*a1 >> 62)
    {
      v11.tv_sec = 0;
      *(void *)&v11.tv_usec = 0;
      gettimeofday(&v11, 0);
      double v3 = (double)v11.tv_sec + (double)v11.tv_usec * 0.000001 - *((double *)a1 + 6);
      uint64_t v4 = (FILE **)MEMORY[0x263EF8348];
      fwrite("AAS3DownloadStream (NSURLSession)\n", 0x22uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      fprintf(*v4, "%12u max attempts for a request\n", *((_DWORD *)a1 + 14));
      fprintf(*v4, "%12u max requests in flight\n", *((_DWORD *)a1 + 16));
      fprintf(*v4, "%12.2f initial interval between retries (s)\n", *((float *)a1 + 15));
      uint64_t v5 = *v4;
      unint64_t v6 = atomic_load(a1 + 5);
      unint64_t v7 = atomic_load(a1 + 5);
      fprintf(v5, "%12llu bytes downloaded (%.2f MB)\n", v6, (double)v7 * 0.000000953674316);
      size_t v8 = *v4;
      unint64_t v9 = atomic_load(a1 + 5);
      fprintf(v8, "%12.2f MB/s download speed\n", (double)v9 / v3 * 0.000000953674316);
    }
    s3StreamBaseRelease((uint64_t)a1);
    memset_s(a1, 0x48uLL, 0, 0x48uLL);
    free(a1);
  }
  return 0;
}

AAByteStream s3DownloadStreamOpen_urlsession(char *a1, uint64_t a2, uint64_t a3, int a4)
{
  AAByteStream v8 = AACustomByteStreamOpen();
  unint64_t v9 = (double *)malloc(0x48uLL);
  size_t v10 = v9;
  if (!v9 || (memset_s(v9, 0x48uLL, 0, 0x48uLL), !v8))
  {
    perror("malloc");
    goto LABEL_12;
  }
  if ((s3StreamBaseInit(v10, a1, a2, a3) & 0x80000000) != 0)
  {
    uint64_t v20 = "s3StreamBaseInit";
    __int16 v21 = 697;
LABEL_11:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"s3DownloadStreamOpen_urlsession", v21, 121, 0, v20, v11, v12, v23.tv_sec);
LABEL_12:
    free(v8);
    downloadStreamClose_urlsession(v10);
    return 0;
  }
  v23.tv_sec = 0;
  *(void *)&v23.tv_usec = 0;
  gettimeofday(&v23, 0);
  v10[6] = (double)v23.tv_sec + (double)v23.tv_usec * 0.000001;
  v10[7] = 32.0;
  if (a4) {
    int v13 = a4;
  }
  else {
    int v13 = 16;
  }
  *((_DWORD *)v10 + 16) = v13;
  uint64_t v14 = [AAS3DownloadSession alloc];
  uint64_t v15 = NSURL;
  id v16 = (id)[NSString stringWithUTF8String:a1];
  id v17 = (id)[v15 URLWithString:v16];
  LODWORD(v18) = *((_DWORD *)v10 + 15);
  uint64_t v19 = [(AAS3DownloadSession *)v14 initWithURL:v17 streamBase:v10 maxAttempts:*((unsigned int *)v10 + 14) pauseInterval:*((unsigned int *)v10 + 16) maxRequestsInFlight:v18];

  if (!v19)
  {
    uint64_t v20 = "creating session";
    __int16 v21 = 710;
    goto LABEL_11;
  }
  *((void *)v10 + 3) = v19;
  *(void *)AAByteStream v8 = v10;
  *((void *)v8 + 1) = downloadStreamClose_urlsession;
  *((void *)v8 + 4) = downloadStreamPRead_0;
  *((void *)v8 + 2) = downloadStreamRead_0;
  *((void *)v8 + 10) = downloadStreamPReadAsync;
  return v8;
}

uint64_t downloadStreamPRead_0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*a1 >> 62 == 3) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "NSURLSession read to buffer nbyte=%zx offset=%llx\n", a3, a4);
  }
  AAByteStream v8 = (void *)a1[3];
  return [v8 readToBuffer:a2 size:a3 atOffset:a4];
}

uint64_t downloadStreamRead_0(void *a1, uint64_t a2, unint64_t a3)
{
  return downloadStreamPRead_0(a1, a2, a3, atomic_fetch_add(a1 + 4, a3));
}

uint64_t downloadStreamPReadAsync(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*a1 >> 62 == 3) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "NSURLSession read to stream nbyte=%zx offset=%llx\n", a3, a4);
  }
  AAByteStream v8 = (void *)a1[3];
  return [v8 readToAsyncByteStream:a2 size:a3 atOffset:a4];
}

uint64_t contextCreate(char **a1, uint64_t a2)
{
  uint64_t v4 = malloc(0x58uLL);
  uint64_t v5 = (uint64_t)v4;
  if (!v4)
  {
    int v7 = *__error();
    size_t v10 = "malloc";
    __int16 v11 = 308;
LABEL_12:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextCreate", v11, 125, v7, v10, v8, v9, v16);
    goto LABEL_13;
  }
  memset_s(v4, 0x58uLL, 0, 0x58uLL);
  *(void *)(v5 + 80) = a2;
  if (a1)
  {
    if ((contextSetString(v5, 0, *a1, "KNOX_APPLECONNECT_ACCOUNT") & 0x80000000) != 0
      || (contextSetString(v5, 1u, a1[1], "KNOX_KEYTAB_FILE") & 0x80000000) != 0
      || (contextSetString(v5, 2u, a1[2], "KNOX_DAW_TOKEN") & 0x80000000) != 0
      || (contextSetString(v5, 3u, a1[3], "KNOX_DAW_TOKEN_FILE") & 0x80000000) != 0
      || (contextSetString(v5, 4u, a1[4], "KNOX_WESTGATE_TOKEN") & 0x80000000) != 0
      || (contextSetString(v5, 5u, a1[5], "KNOX_WESTGATE_TOKEN_FILE") & 0x80000000) != 0
      || (contextSetString(v5, 8u, a1[6], "KNOX_USER_AGENT") & 0x80000000) != 0)
    {
      goto LABEL_13;
    }
    unint64_t v6 = a1[7];
  }
  else
  {
    if ((contextSetString(v5, 0, 0, "KNOX_APPLECONNECT_ACCOUNT") & 0x80000000) != 0) {
      goto LABEL_13;
    }
    if ((contextSetString(v5, 1u, 0, "KNOX_KEYTAB_FILE") & 0x80000000) != 0) {
      goto LABEL_13;
    }
    if ((contextSetString(v5, 2u, 0, "KNOX_DAW_TOKEN") & 0x80000000) != 0) {
      goto LABEL_13;
    }
    if ((contextSetString(v5, 3u, 0, "KNOX_DAW_TOKEN_FILE") & 0x80000000) != 0) {
      goto LABEL_13;
    }
    if ((contextSetString(v5, 4u, 0, "KNOX_WESTGATE_TOKEN") & 0x80000000) != 0) {
      goto LABEL_13;
    }
    if ((contextSetString(v5, 5u, 0, "KNOX_WESTGATE_TOKEN_FILE") & 0x80000000) != 0) {
      goto LABEL_13;
    }
    int v13 = contextSetString(v5, 8u, 0, "KNOX_USER_AGENT");
    unint64_t v6 = 0;
    if (v13 < 0) {
      goto LABEL_13;
    }
  }
  if ((contextSetString(v5, 9u, v6, "KNOX_PROXY") & 0x80000000) != 0)
  {
LABEL_13:
    contextDestroy((char *)v5);
    return 0;
  }
  if (!*(void *)(v5 + 16))
  {
    uint64_t v15 = *(char **)(v5 + 24);
    if (v15)
    {
      if ((contextLoadString(v5, 2u, v15) & 0x80000000) != 0)
      {
        size_t v10 = "loading daw token";
        __int16 v11 = 324;
        goto LABEL_31;
      }
    }
  }
  if (!*(void *)(v5 + 32))
  {
    uint64_t v14 = *(char **)(v5 + 40);
    if (v14)
    {
      if ((contextLoadString(v5, 4u, v14) & 0x80000000) != 0)
      {
        size_t v10 = "loading westgate token";
        __int16 v11 = 327;
LABEL_31:
        int v7 = 0;
        goto LABEL_12;
      }
    }
  }
  return v5;
}

uint64_t contextResolveWestgateToken(uint64_t a1, char *__s)
{
  v123[2] = *(const char **)MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32)) {
    return 0;
  }
  uint64_t v5 = *(const char **)(a1 + 16);
  if (v5) {
    goto LABEL_4;
  }
  size_t v11 = strlen(__s);
  size_t v12 = v11 + 200;
  if (v11 + 200 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_72:
    size_t v65 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetServiceName", 345, 125, *v65, "malloc", v66, v67, v117);
    size_t v27 = 0;
    int v38 = 0;
    size_t v30 = 0;
LABEL_101:
    AAJSONInputStreamClose(v38);
    AAByteStreamClose(v30);
    free(v27);
    BOOL v24 = "getting service name and realm";
    __int16 v25 = 649;
    goto LABEL_102;
  }
  uint64_t v26 = malloc(v11 + 200);
  if (!v26) {
    goto LABEL_72;
  }
  size_t v27 = v26;
  size_t v30 = (AAByteStream_impl *)AATempStreamOpen();
  if (!v30)
  {
    v88 = "AATempStreamOpen";
    __int16 v89 = 348;
LABEL_94:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetServiceName", v89, 125, 0, v88, v28, v29, v117);
    int v38 = 0;
    goto LABEL_101;
  }
  snprintf((char *)v27, v12, "https://%s/westgate/appinfo", __s);
  if ((knoxRequest(a1, 1u, (char *)v27, 0, (uint64_t)v30) & 0x80000000) != 0)
  {
    char v117 = (char)v27;
    v88 = "Knox request failed: %s";
    __int16 v89 = 351;
    goto LABEL_94;
  }
  AAByteStreamSeek(v30, 0, 0);
  CURLcode v31 = (void **)AAJSONInputStreamOpen((uint64_t)v30);
  int v38 = v31;
  if (!v31)
  {
    size_t v100 = "AAJSONInputStreamOpen";
    __int16 v101 = 356;
    goto LABEL_100;
  }
  uint64_t v122 = 0;
  *(_OWORD *)__sa = 0u;
  long long v121 = 0u;
  *(_OWORD *)__s1 = 0u;
  if ((AAJSONInputStreamRead((uint64_t)v31, (int *)__s1, v32, v33, v34, v35, v36, v37) & 0x80000000) != 0)
  {
LABEL_95:
    size_t v100 = "parsing JSON";
    __int16 v101 = 363;
    goto LABEL_100;
  }
  int v43 = 0;
  int v44 = 0;
  while (1)
  {
    if (LODWORD(__s1[0]) < 2)
    {
      if (v44 == 1 && __s1[1] && !strcmp(__s1[1], "idms")) {
        int v43 = 1;
      }
      ++v44;
      goto LABEL_41;
    }
    if (LODWORD(__s1[0]) != 2)
    {
      if (LODWORD(__s1[0]) == 3)
      {
        if (v43)
        {
          int v45 = __s1[1];
          if (__s1[1])
          {
            if (strcmp(__s1[1], "realm"))
            {
LABEL_33:
              if (!strcmp(v45, "serviceName") && (contextSetString(a1, 7u, __sa[0], 0) & 0x80000000) != 0)
              {
                size_t v100 = "serviceName";
                __int16 v101 = 378;
                goto LABEL_100;
              }
              goto LABEL_41;
            }
            if ((contextSetString(a1, 6u, __sa[0], 0) & 0x80000000) == 0)
            {
              int v45 = __s1[1];
              goto LABEL_33;
            }
            size_t v100 = "realm";
            __int16 v101 = 377;
LABEL_100:
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetServiceName", v101, 125, 0, v100, v36, v37, v118);
            goto LABEL_101;
          }
        }
      }
LABEL_41:
      if (!v44) {
        break;
      }
      goto LABEL_42;
    }
    int v43 = 0;
    if (!--v44) {
      break;
    }
LABEL_42:
    uint64_t v122 = 0;
    *(_OWORD *)__sa = 0u;
    long long v121 = 0u;
    *(_OWORD *)__s1 = 0u;
    if ((AAJSONInputStreamRead((uint64_t)v38, (int *)__s1, v39, v40, v41, v42, v36, v37) & 0x80000000) != 0) {
      goto LABEL_95;
    }
  }
  if (!*(void *)(a1 + 48) || !*(void *)(a1 + 56))
  {
    size_t v100 = "could not parse service name and realm";
    __int16 v101 = 389;
    goto LABEL_100;
  }
  AAJSONInputStreamClose(v38);
  AAByteStreamClose(v30);
  free(v27);
  __s1[0] = 0;
  __s1[1] = 0;
  __sa[0] = 0;
  char v48 = *(const char **)(a1 + 48);
  if (!v48 || (size_t v49 = *(const char **)(a1 + 56)) == 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDAWToken", 411, 125, 0, "missing service name or realm", v46, v47, v118);
    uint64_t v53 = 0;
LABEL_111:
    int v94 = 0;
    unsigned int v55 = 0;
    goto LABEL_156;
  }
  uint64_t v50 = *(void *)(a1 + 80) >> 62;
  if (v50)
  {
    uint64_t v51 = (FILE **)MEMORY[0x263EF8348];
    fwrite("  obtaining a DAW token from the appleconnect CLI\n", 0x32uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    fprintf(*v51, "  - realm: %s\n", v48);
    fprintf(*v51, "  - service name: %s\n", v49);
  }
  uint64_t v52 = (char *)malloc(0x4000uLL);
  uint64_t v53 = v52;
  if (!v52)
  {
    __s1[0] = 0;
    __s1[1] = 0;
    __sa[0] = 0;
    v91 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDAWToken", 420, 125, *v91, "malloc", v92, v93, v118);
    goto LABEL_111;
  }
  __s1[1] = (char *)0x4000;
  __sa[0] = v52;
  int v54 = (char *)malloc(0x4000uLL);
  unsigned int v55 = v54;
  if (!v54)
  {
    int v95 = *__error();
    size_t v98 = "malloc";
    __int16 v99 = 422;
LABEL_115:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDAWToken", v99, 125, v95, v98, v96, v97, v118);
    int v94 = 0;
    goto LABEL_156;
  }
  snprintf(v54, 0x4000uLL, "/usr/local/bin/appleconnect serviceTicket --show-signIn-dialog --dawToken --realm %s --serviceName %s", v48, v49);
  if (*(void *)a1)
  {
    if (v50) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "  - account: %s\n", *(const char **)a1);
    }
    __strlcat_chk();
    __strlcat_chk();
  }
  if (*(void *)(a1 + 8))
  {
    if (v50) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "  - keytab file: %s\n", *(const char **)(a1 + 8));
    }
    __strlcat_chk();
    __strlcat_chk();
  }
  size_t v56 = popen(v55, "r");
  if (!v56)
  {
    int v95 = *__error();
    char v118 = (char)v55;
    size_t v98 = "%s";
    __int16 v99 = 444;
    goto LABEL_115;
  }
  size_t v57 = v56;
  v58 = 0;
  while (1)
  {
    size_t v59 = fread(&v58[(void)v53], 1uLL, 0x4000 - (void)v58, v57);
    if (v59)
    {
      unint64_t v62 = (unint64_t)&v58[v59];
      if (__CFADD__(v58, v59) || v62 > 0x4000)
      {
        __s1[0] = v58;
        uint64_t v63 = "invalid read";
        __int16 v64 = 454;
        goto LABEL_153;
      }
      goto LABEL_70;
    }
    if (feof(v57)) {
      break;
    }
    if (ferror(v57))
    {
      __s1[0] = v58;
      int v111 = *__error();
      uint64_t v63 = "fread";
      __int16 v64 = 452;
      goto LABEL_154;
    }
    unint64_t v62 = (unint64_t)v58;
LABEL_70:
    v58 = (char *)v62;
    if (v62 == 0x4000)
    {
      __s1[0] = (char *)0x4000;
      uint64_t v63 = "token is too long";
      __int16 v64 = 447;
      goto LABEL_153;
    }
  }
  __s1[0] = v58;
  if (v58)
  {
    v102 = (char *)v53 - 1;
    uint64_t v103 = MEMORY[0x263EF8318];
    do
    {
      uint64_t v104 = v58[(void)v102];
      if (v58[(void)v102] < 0) {
        int v105 = __maskrune(v104, 0x4000uLL);
      }
      else {
        int v105 = *(_DWORD *)(v103 + 4 * v104 + 60) & 0x4000;
      }
      if (!v105) {
        break;
      }
      --v58;
    }
    while (v58);
    __s1[0] = v58;
  }
  unint64_t v106 = (unint64_t)(v58 + 1);
  uint64_t v107 = v58 == (char *)-1;
  uint64_t v108 = v107 << 63 >> 63;
  if (v108 != v107 || v108 < 0 || (v106 & 0x8000000000000000) != 0) {
    goto LABEL_152;
  }
  if (v106 <= 0x4000)
  {
    v112 = __sa[0];
LABEL_140:
    __s1[0] = v58 + 1;
    v58[(void)v53] = 0;
    if ((unint64_t)(v58 + 1) >= 6
      && (*(_DWORD *)v112 == 1415004484 ? (BOOL v114 = *((unsigned __int16 *)v112 + 2) == 20043) : (BOOL v114 = 0), v114))
    {
      if ((contextSetString(a1, 2u, v112, 0) & 0x80000000) == 0)
      {
        int v94 = 1;
        goto LABEL_147;
      }
      v115 = "daw token";
      __int16 v116 = 463;
    }
    else
    {
      v115 = "invalid token format";
      __int16 v116 = 460;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDAWToken", v116, 125, 0, v115, v60, v61, v117);
    int v94 = 0;
LABEL_147:
    uint64_t v53 = v112;
    goto LABEL_155;
  }
  for (size_t i = 0x4000; i < v106; i += v110)
  {
    size_t v110 = i >> 1;
    if ((i & (i >> 1)) != 0) {
      size_t v110 = i & (i >> 1);
    }
  }
  if (i >= 0x2000000001)
  {
    *__error() = 12;
    goto LABEL_151;
  }
  v113 = (char *)realloc(v53, i);
  if (v113)
  {
    v112 = v113;
    __s1[1] = (char *)i;
    __sa[0] = v113;
    uint64_t v53 = v113;
    goto LABEL_140;
  }
  free(v53);
LABEL_151:
  uint64_t v53 = 0;
  __s1[0] = 0;
  __s1[1] = 0;
  __sa[0] = 0;
LABEL_152:
  uint64_t v63 = "token is too long";
  __int16 v64 = 459;
LABEL_153:
  int v111 = 0;
LABEL_154:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDAWToken", v64, 125, v111, v63, v60, v61, v117);
  int v94 = 0;
LABEL_155:
  pclose(v57);
LABEL_156:
  free(v55);
  free(v53);
  memset_s(__s1, 0x18uLL, 0, 0x18uLL);
  if (!v94)
  {
    BOOL v24 = "getting DAW token";
    __int16 v25 = 650;
    goto LABEL_102;
  }
  if (*(void *)(a1 + 32)) {
    return 0;
  }
  uint64_t v5 = *(const char **)(a1 + 16);
  if (!v5)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetWestgateToken", 486, 125, 0, "missing host or DAW token", v22, v23, v117);
    uint64_t v20 = 0;
    uint64_t v8 = 0;
LABEL_17:
    __int16 v21 = 0;
    id v17 = 0;
LABEL_18:
    AAJSONInputStreamClose(v20);
    AAByteStreamClose(v8);
    free(v17);
    free(v21);
    BOOL v24 = "getting Westgate token";
    __int16 v25 = 655;
LABEL_102:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextResolveWestgateToken", v25, 125, 0, v24, v22, v23, v117);
    return 0xFFFFFFFFLL;
  }
LABEL_4:
  if (*(void *)(a1 + 80) >> 62) {
    fwrite("  requesting Westgate token from the Knox server\n", 0x31uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  }
  uint64_t v8 = (AAByteStream_impl *)AATempStreamOpen();
  if (!v8)
  {
    int v13 = "AATempStreamOpen";
    __int16 v14 = 491;
    int v15 = 0;
LABEL_16:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetWestgateToken", v14, 125, v15, v13, v6, v7, v117);
    uint64_t v20 = 0;
    goto LABEL_17;
  }
  size_t v9 = strlen(__s);
  size_t v10 = v9 + 200;
  if (v9 + 200 >= 0x2000000001)
  {
    *__error() = 12;
    goto LABEL_15;
  }
  char v16 = malloc(v9 + 200);
  if (!v16)
  {
LABEL_15:
    int v15 = *__error();
    int v13 = "malloc";
    __int16 v14 = 495;
    goto LABEL_16;
  }
  id v17 = v16;
  size_t v18 = strlen(v5);
  size_t v19 = v18 + 200;
  if (v18 + 200 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_91:
    v85 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetWestgateToken", 498, 125, *v85, "malloc", v86, v87, v117);
    uint64_t v20 = 0;
    __int16 v21 = 0;
    goto LABEL_18;
  }
  v68 = (char *)malloc(v18 + 200);
  if (!v68) {
    goto LABEL_91;
  }
  __int16 v21 = v68;
  snprintf(v68, v19, "Authorization: Bearer %s", v5);
  v123[0] = v21;
  v123[1] = 0;
  snprintf((char *)v17, v10, "https://%s/westgate/token", __s);
  if ((knoxRequest(a1, 2u, (char *)v17, v123, (uint64_t)v8) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetWestgateToken", 505, 125, 0, "Knox request failed: %s", v69, v70, (char)v17);
    uint64_t v20 = 0;
    goto LABEL_18;
  }
  AAByteStreamSeek(v8, 0, 0);
  v71 = (void **)AAJSONInputStreamOpen((uint64_t)v8);
  uint64_t v20 = v71;
  if (!v71)
  {
    uint64_t v83 = "AAJSONInputStreamOpen";
    __int16 v84 = 510;
    goto LABEL_106;
  }
  uint64_t v122 = 0;
  *(_OWORD *)__sa = 0u;
  long long v121 = 0u;
  *(_OWORD *)__s1 = 0u;
  if ((AAJSONInputStreamRead((uint64_t)v71, (int *)__s1, v72, v73, v74, v75, v76, v77) & 0x80000000) != 0)
  {
LABEL_90:
    uint64_t v83 = "parsing JSON";
    __int16 v84 = 516;
LABEL_106:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetWestgateToken", v84, 125, 0, v83, v76, v77, v117);
    goto LABEL_18;
  }
  int v82 = 0;
  while (1)
  {
    if (LODWORD(__s1[0]) < 2)
    {
      ++v82;
      goto LABEL_88;
    }
    if (LODWORD(__s1[0]) == 2) {
      break;
    }
    if (LODWORD(__s1[0]) != 3 || v82 != 1 || !__s1[1]) {
      goto LABEL_88;
    }
    if (!strcasecmp(__s1[1], "password") && (contextSetString(a1, 4u, __sa[0], 0) & 0x80000000) != 0)
    {
      uint64_t v83 = "password";
      __int16 v84 = 529;
      goto LABEL_106;
    }
    int v82 = 1;
LABEL_89:
    uint64_t v122 = 0;
    *(_OWORD *)__sa = 0u;
    long long v121 = 0u;
    *(_OWORD *)__s1 = 0u;
    if ((AAJSONInputStreamRead((uint64_t)v20, (int *)__s1, v78, v79, v80, v81, v76, v77) & 0x80000000) != 0) {
      goto LABEL_90;
    }
  }
  --v82;
LABEL_88:
  if (v82) {
    goto LABEL_89;
  }
  size_t v90 = *(const char **)(a1 + 32);
  if (!v90 || strncmp(v90, "WGTKN", 5uLL))
  {
    uint64_t v83 = "invalid/missing token";
    __int16 v84 = 537;
    goto LABEL_106;
  }
  AAJSONInputStreamClose(v20);
  AAByteStreamClose(v8);
  free(v17);
  free(v21);
  if (!*(void *)(a1 + 32))
  {
    BOOL v24 = "invalid Westgate token";
    __int16 v25 = 658;
    goto LABEL_102;
  }
  return 0;
}

void contextDestroy(char *a1)
{
  if (a1)
  {
    for (uint64_t i = 0; i != 80; i += 8)
      free(*(void **)&a1[i]);
    free(a1);
  }
}

uint64_t knoxRequest(uint64_t a1, unsigned int a2, char *a3, const char **a4, uint64_t a5)
{
  v77[0] = 0;
  v77[1] = 0;
  long long v75 = 0uLL;
  uint64_t v76 = 0;
  uint64_t v72 = 0;
  uint64_t v73 = 0;
  uint64_t v74 = 0;
  size_t v10 = AAS3ContextCreate();
  uint64_t v78 = (uint64_t)v10;
  if (!v10)
  {
    size_t v57 = "AAS3ContextCreate";
    __int16 v58 = 189;
LABEL_41:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxRequest", v58, 125, 0, v57, v11, v12, v68);
    uint64_t v22 = 0;
LABEL_42:
    uint64_t v29 = 0;
    uint64_t v28 = 0;
LABEL_43:
    uint64_t v59 = 0xFFFFFFFFLL;
    goto LABEL_44;
  }
  uint64_t v13 = (uint64_t)v10;
  __int16 v14 = malloc(0x18uLL);
  int v15 = v14;
  if (!v14)
  {
    uint64_t v22 = (uint64_t (**)(int *))calloc(1uLL, 0x68uLL);
    goto LABEL_40;
  }
  memset_s(v14, 0x18uLL, 0, 0x18uLL);
  char v16 = (uint64_t (**)(int *))calloc(1uLL, 0x68uLL);
  uint64_t v22 = v16;
  if (!v16)
  {
LABEL_40:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxPageStreamOpen", 165, 125, 0, "malloc", v20, v21, v68);
    free(v15);
    free(v22);
    size_t v57 = "open page stream";
    __int16 v58 = 192;
    goto LABEL_41;
  }
  *int v15 = a5;
  *char v16 = (uint64_t (*)(int *))v15;
  v16[1] = knoxPageStreamClose;
  v16[3] = (uint64_t (*)(int *))knoxPageStreamWrite;
  if ((AAS3ContextSetFieldString(v13, 5, *(char **)(a1 + 64), v17, v18, v19, v20, v21) & 0x80000000) != 0)
  {
    __int16 v61 = 194;
LABEL_47:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxRequest", v61, 125, 0, "setup context", v26, v27, v68);
    goto LABEL_42;
  }
  if ((AAS3ContextSetFieldString(v13, 0, *(char **)(a1 + 72), v23, v24, v25, v26, v27) & 0x80000000) != 0)
  {
    __int16 v61 = 195;
    goto LABEL_47;
  }
  uint64_t v28 = (char *)malloc(0x800uLL);
  if (!v28)
  {
    int v62 = *__error();
    __int16 v63 = 200;
LABEL_53:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxRequest", v63, 125, v62, "malloc", v55, v56, v68);
    uint64_t v29 = 0;
    goto LABEL_43;
  }
  uint64_t v29 = 0;
  size_t v30 = "link:";
  uint64_t v70 = a3;
  v71 = a4;
  while (2)
  {
    memset_s(v28, 0x800uLL, 0, 0x800uLL);
    long long v75 = 0uLL;
    uint64_t v76 = v22;
    uint64_t v72 = v28;
    uint64_t v73 = 2047;
    uint64_t v33 = a3;
    uint64_t v74 = 0;
    if (v29)
    {
      if (v22[1] == knoxPageStreamClose)
      {
        uint64_t v34 = *v22;
        if (*((int *)*v22 + 2) < 1 || !*((_DWORD *)v34 + 4)) {
          goto LABEL_15;
        }
        if (!*((_DWORD *)v34 + 5) || AAByteStreamWrite(*(AAByteStream *)v34, ",", 1uLL) == 1)
        {
          *(void *)((char *)v34 + 12) = 1;
LABEL_15:
          *((_DWORD *)v34 + 5) = 0;
          uint64_t v33 = v29;
          goto LABEL_16;
        }
        __int16 v64 = "writing ','";
        __int16 v65 = 146;
      }
      else
      {
        __int16 v64 = "invalid stream";
        __int16 v65 = 132;
      }
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxPageStreamEndPage", v65, 125, 0, v64, v31, v32, v68);
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxRequest", 209, 125, 0, "page stream next page", v66, v67, v69);
      goto LABEL_43;
    }
LABEL_16:
    if ((s3Perform(a2, v33, (uint64_t)v77, 0, &v75, (uint64_t)&v72, a4) & 0x80000000) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxRequest", 212, 125, 0, "request: %s", v35, v36, (char)v33);
      goto LABEL_43;
    }
    free(v29);
    size_t v37 = strlen(v28);
    if (v37)
    {
      unint64_t v38 = v37;
      uint64_t v29 = 0;
      unint64_t v39 = 0;
      do
      {
        if (v38 <= v39 + 1) {
          unint64_t v40 = v39 + 1;
        }
        else {
          unint64_t v40 = v38;
        }
        unint64_t v41 = v39;
        while (v28[v41] != 10)
        {
          if (v40 == ++v41)
          {
            unint64_t v41 = v40;
            break;
          }
        }
        v28[v41] = 0;
        if (v41 - v39 >= 5)
        {
          uint64_t v42 = &v28[v39];
          if (!strncmp(&v28[v39], v30, 5uLL))
          {
            int v43 = v30;
            int v44 = strchr(v42, 60);
            int v45 = strrchr(v42, 62);
            if (!v44 || (char v48 = v45) == 0 || v45 <= v44)
            {
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxRequest", 231, 125, 0, "invalid link header (1): %s", v46, v47, (char)v42);
              goto LABEL_43;
            }
            if (!strstr(v45, "rel=\"next\""))
            {
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxRequest", 233, 125, 0, "invalid link header (2): %s", v49, v50, (char)v42);
              goto LABEL_43;
            }
            *char v48 = 0;
            uint64_t v51 = v44 + 1;
            size_t v52 = strlen(v51);
            size_t v53 = v52 + 1;
            if (v52 + 1 >= 0x2000000001)
            {
              *__error() = 12;
LABEL_52:
              __int16 v63 = 236;
              int v62 = 0;
              goto LABEL_53;
            }
            int v54 = (char *)malloc(v52 + 1);
            if (!v54) {
              goto LABEL_52;
            }
            uint64_t v29 = v54;
            memcpy(v54, v51, v53);
            size_t v30 = v43;
          }
        }
        unint64_t v39 = v41 + 1;
      }
      while (v41 + 1 < v38);
      a3 = v70;
      a4 = v71;
      if (v29) {
        continue;
      }
    }
    else
    {
      uint64_t v29 = 0;
    }
    break;
  }
  uint64_t v59 = 0;
LABEL_44:
  free(v29);
  free(v28);
  AAByteStreamClose((AAByteStream)v22);
  AAS3ContextDestroy(v78);
  return v59;
}

uint64_t contextGetDecryptionComponents(uint64_t a1, const char *a2, const char *a3, const char *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  v76[2] = *(const char **)MEMORY[0x263EF8340];
  uint64_t v8 = *(char **)(a1 + 32);
  unint64_t v9 = *(void *)(a1 + 80);
  *a5 = 0;
  *a6 = 0;
  if (!v8)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDecryptionComponents", 568, 125, 0, "missing Westgate token", a7, a8, v64);
    uint64_t v21 = 0;
    uint64_t v18 = 0;
LABEL_14:
    uint64_t v27 = 0;
    goto LABEL_15;
  }
  if (v9 >> 62) {
    fwrite("  requesting decryption components from the Knox server\n", 0x38uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  }
  uint64_t v18 = (AAByteStream_impl *)AATempStreamOpen();
  if (!v18)
  {
    uint64_t v22 = "AATempStreamOpen";
    __int16 v23 = 573;
    int v24 = 0;
LABEL_13:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDecryptionComponents", v23, 125, v24, v22, v16, v17, v64);
    uint64_t v21 = 0;
    uint64_t v8 = 0;
    goto LABEL_14;
  }
  size_t v19 = strlen(a2);
  size_t v20 = v19 + 200;
  if (v19 + 200 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_12:
    int v24 = *__error();
    uint64_t v22 = "malloc";
    __int16 v23 = 577;
    goto LABEL_13;
  }
  __str = (char *)malloc(v19 + 200);
  if (!__str) {
    goto LABEL_12;
  }
  size_t v25 = strlen(v8);
  size_t v26 = v25 + 200;
  if (v25 + 200 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_54:
    uint64_t v59 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDecryptionComponents", 580, 125, *v59, "malloc", v60, v61, v64);
    uint64_t v21 = 0;
    uint64_t v8 = 0;
    uint64_t v28 = 0xFFFFFFFFLL;
    uint64_t v27 = __str;
    goto LABEL_16;
  }
  size_t v30 = (char *)malloc(v25 + 200);
  if (!v30) {
    goto LABEL_54;
  }
  __int16 v65 = v8;
  uint64_t v8 = v30;
  snprintf(v30, v26, "Authorization: Bearer %s", v65);
  v76[0] = v8;
  v76[1] = 0;
  uint64_t v67 = a4;
  uint64_t v27 = __str;
  snprintf(__str, v20, "https://%s/spaces/%s/files/%s/decryption-components", a2, a3, v67);
  if ((knoxRequest(a1, 2u, __str, v76, (uint64_t)v18) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDecryptionComponents", 587, 125, 0, "Knox request failed: %s", v31, v32, (char)__str);
    uint64_t v21 = 0;
    goto LABEL_15;
  }
  AAByteStreamSeek(v18, 0, 0);
  uint64_t v33 = (void **)AAJSONInputStreamOpen((uint64_t)v18);
  uint64_t v21 = v33;
  if (!v33)
  {
    int v62 = "AAJSONInputStreamOpen";
    __int16 v63 = 592;
    goto LABEL_62;
  }
  uint64_t v75 = 0;
  *(_OWORD *)__s = 0u;
  long long v74 = 0u;
  *(_OWORD *)__s1 = 0u;
  if ((AAJSONInputStreamRead((uint64_t)v33, (int *)__s1, v34, v35, v36, v37, v38, v39) & 0x80000000) != 0)
  {
LABEL_56:
    int v62 = "parsing JSON";
    __int16 v63 = 600;
    goto LABEL_62;
  }
  int v44 = 0;
  int v45 = 0;
  int v46 = 0;
  uint64_t v70 = v8;
  while (LODWORD(__s1[0]) >= 2)
  {
    if (LODWORD(__s1[0]) == 2)
    {
      int v45 = 0;
      int v44 = 0;
      --v46;
      goto LABEL_47;
    }
    if (LODWORD(__s1[0]) != 3) {
      goto LABEL_47;
    }
    uint64_t v47 = __s1[1];
    if (v46 == 2 && v45 && __s1[1] && !strcmp(__s1[1], "key"))
    {
      int v68 = v44;
      char v48 = __s[0];
      if (!__s[0]) {
        goto LABEL_64;
      }
      size_t v49 = strlen(__s[0]);
      size_t v50 = v49 + 1;
      if (v49 + 1 >= 0x2000000001)
      {
        *__error() = 12;
LABEL_64:
        *a6 = 0;
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDecryptionComponents", 618, 125, 0, "key", v38, v39, v66);
        uint64_t v8 = v70;
        uint64_t v27 = __str;
        goto LABEL_15;
      }
      uint64_t v51 = malloc(v49 + 1);
      if (!v51) {
        goto LABEL_64;
      }
      size_t v52 = v51;
      memcpy(v51, v48, v50);
      *a6 = v52;
      uint64_t v27 = __str;
      int v44 = v68;
    }
    if (v46 != 2 || !v44 || !v47)
    {
      uint64_t v8 = v70;
      goto LABEL_47;
    }
    if (!strcmp(v47, "uri"))
    {
      int v69 = v44;
      int v54 = __s[0];
      uint64_t v8 = v70;
      if (!__s[0]) {
        goto LABEL_66;
      }
      size_t v55 = strlen(__s[0]);
      size_t v56 = v55 + 1;
      if (v55 + 1 >= 0x2000000001)
      {
        *__error() = 12;
LABEL_66:
        *a5 = 0;
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDecryptionComponents", 623, 125, 0, "uri", v38, v39, v66);
        uint64_t v27 = __str;
        goto LABEL_15;
      }
      size_t v57 = malloc(v55 + 1);
      if (!v57) {
        goto LABEL_66;
      }
      __int16 v58 = v57;
      memcpy(v57, v54, v56);
      *a5 = v58;
      int v46 = 2;
      uint64_t v27 = __str;
      int v44 = v69;
    }
    else
    {
      int v46 = 2;
      uint64_t v8 = v70;
    }
LABEL_48:
    uint64_t v75 = 0;
    *(_OWORD *)__s = 0u;
    long long v74 = 0u;
    *(_OWORD *)__s1 = 0u;
    if ((AAJSONInputStreamRead((uint64_t)v21, (int *)__s1, v40, v41, v42, v43, v38, v39) & 0x80000000) != 0) {
      goto LABEL_56;
    }
  }
  if (v46 == 1)
  {
    size_t v53 = __s1[1];
    if (__s1[1])
    {
      if (!strcmp(__s1[1], "encryption")) {
        int v45 = 1;
      }
      if (!strcmp(v53, "location")) {
        int v44 = 1;
      }
    }
  }
  ++v46;
LABEL_47:
  if (v46) {
    goto LABEL_48;
  }
  if (*a5 && *a6)
  {
    uint64_t v28 = 0;
    goto LABEL_16;
  }
  int v62 = "invalid/missing decryption components";
  __int16 v63 = 631;
LABEL_62:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDecryptionComponents", v63, 125, 0, v62, v38, v39, v66);
LABEL_15:
  uint64_t v28 = 0xFFFFFFFFLL;
LABEL_16:
  AAJSONInputStreamClose(v21);
  AAByteStreamClose(v18);
  free(v27);
  free(v8);
  return v28;
}

uint64_t AAS3KnoxResolveURL(uint64_t a1, char **a2, void *a3, size_t a4, unsigned char *a5, size_t *a6, unint64_t a7)
{
  __s = 0;
  if (strncmp((const char *)a1, "knox://", 7uLL))
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"AAS3KnoxResolveURL", 854, 125, 0, "invalid Knox scheme: %s", v14, v15, a1);
LABEL_13:
    __int16 v23 = 0;
    int v24 = 0;
    size_t v20 = 0;
    goto LABEL_14;
  }
  uint64_t v16 = a1 + 7;
  uint64_t v17 = strchr((char *)(a1 + 7), 47);
  size_t v20 = v17;
  if (!v17)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"AAS3KnoxResolveURL", 859, 125, 0, "invalid Knox host: %s", v18, v19, a1);
    __int16 v23 = 0;
    int v24 = 0;
LABEL_14:
    uint64_t v32 = 0;
    size_t v26 = 0;
    goto LABEL_15;
  }
  uint64_t v21 = &v17[-v16];
  size_t v22 = (size_t)&v17[-v16 + 1];
  if (v22 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_12:
    int v33 = *__error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"AAS3KnoxResolveURL", 863, 125, v33, "malloc", v34, v35, v72);
    goto LABEL_13;
  }
  uint64_t v73 = a6;
  size_t v25 = (char *)malloc(v22);
  if (!v25) {
    goto LABEL_12;
  }
  size_t v26 = v25;
  memcpy(v25, (const void *)(a1 + 7), (size_t)&v20[-v16]);
  v21[(void)v26] = 0;
  if (strncmp(v20 + 1, "download/", 9uLL))
  {
    char v72 = a1;
    uint64_t v29 = "invalid Knox action: %s";
    __int16 v30 = 869;
LABEL_10:
    int v31 = 0;
LABEL_11:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"AAS3KnoxResolveURL", v30, 125, v31, v29, v27, v28, v72);
    __int16 v23 = 0;
    int v24 = 0;
    size_t v20 = 0;
    uint64_t v32 = 0;
    goto LABEL_15;
  }
  uint64_t v38 = v20 + 10;
  uint64_t v39 = strchr(v38, 47);
  if (!v39)
  {
    char v72 = a1;
    uint64_t v29 = "invalid Knox space: %s";
    __int16 v30 = 874;
    goto LABEL_10;
  }
  uint64_t v40 = v39;
  size_t v41 = v39 - v38;
  size_t v42 = v39 - v38 + 1;
  if (v42 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_37:
    int v31 = *__error();
    uint64_t v29 = "malloc";
    __int16 v30 = 878;
    goto LABEL_11;
  }
  uint64_t v43 = (char *)malloc(v42);
  if (!v43) {
    goto LABEL_37;
  }
  uint64_t v32 = v43;
  memcpy(v43, v38, v41);
  size_t v44 = 0;
  v32[v41] = 0;
  int v45 = v40 + 1;
  int v46 = v40 + 1;
  do
  {
    size_t v47 = v44;
    unsigned int v48 = (char)v45[v44];
    if (!v45[v44]) {
      break;
    }
    if ((v48 & 0x80000000) != 0)
    {
      int v49 = __maskrune((char)v45[v44], 0x4000uLL);
      int v45 = v46;
    }
    else
    {
      int v49 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v48 + 60) & 0x4000;
    }
    if ((v48 - 127) < 0xA1u) {
      break;
    }
    if (v48 == 47 || (v48 - 37) < 2u) {
      break;
    }
    if (v48 == 35) {
      break;
    }
    size_t v44 = v47 + 1;
  }
  while (!v49);
  if (v47 + 1 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_48:
    uint64_t v67 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"AAS3KnoxResolveURL", 895, 125, *v67, "malloc", v68, v69, v72);
    __int16 v23 = 0;
    int v24 = 0;
    size_t v20 = 0;
    goto LABEL_15;
  }
  uint64_t v51 = (char *)malloc(v47 + 1);
  if (!v51) {
    goto LABEL_48;
  }
  size_t v20 = v51;
  memcpy(v51, v46, v47);
  v20[v47] = 0;
  if (a7 >> 62)
  {
    size_t v52 = (FILE **)MEMORY[0x263EF8348];
    fwrite("Knox resolve URL\n", 0x11uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    fprintf(*v52, "  host: %s\n", v26);
    fprintf(*v52, "  space: %s\n", v32);
    fprintf(*v52, "  file digest: %s\n", v20);
  }
  uint64_t v53 = contextCreate(a2, a7);
  int v24 = (char *)v53;
  if (!v53)
  {
    uint64_t v70 = "contextInit failed";
    __int16 v71 = 909;
LABEL_51:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"AAS3KnoxResolveURL", v71, 125, 0, v70, v54, v55, v72);
    __int16 v23 = 0;
    goto LABEL_15;
  }
  if ((contextResolveWestgateToken(v53, v26) & 0x80000000) != 0)
  {
    uint64_t v70 = "getting Westgate token";
    __int16 v71 = 912;
    goto LABEL_51;
  }
  if ((contextGetDecryptionComponents((uint64_t)v24, v26, v32, v20, a3, &__s, v54, v55) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"AAS3KnoxResolveURL", 915, 125, 0, "getting decryption credentials", v56, v57, v72);
    uint64_t v36 = 0xFFFFFFFFLL;
    __int16 v23 = __s;
    goto LABEL_16;
  }
  __int16 v23 = __s;
  size_t v58 = strlen(__s);
  if (!v58 || (v58 & 1) != 0)
  {
    char v72 = v58;
    __int16 v65 = "invalid key length: %zu";
    __int16 v66 = 919;
  }
  else
  {
    size_t v64 = v58 >> 1;
    if (v58 >> 1 <= a4)
    {
      if ((aaParseHexString(v58 >> 1, a5, (uint64_t)__s, v59, v60, v61, v62, v63) & 0x80000000) == 0)
      {
        uint64_t v36 = 0;
        size_t *v73 = v64;
        goto LABEL_16;
      }
      __int16 v65 = "invalid hex key";
      __int16 v66 = 922;
    }
    else
    {
      __int16 v65 = "key_capacity is too low";
      __int16 v66 = 921;
    }
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"AAS3KnoxResolveURL", v66, 125, 0, v65, v62, v63, v72);
LABEL_15:
  uint64_t v36 = 0xFFFFFFFFLL;
LABEL_16:
  free(v26);
  free(v32);
  free(v20);
  free(v23);
  contextDestroy(v24);
  return v36;
}

uint64_t contextSetString(uint64_t a1, unsigned int a2, char *__s, char *a4)
{
  uint64_t v4 = __s;
  if (!__s)
  {
    if (a4) {
      uint64_t v4 = getenv(a4);
    }
  }
  if (!v4)
  {
    uint64_t result = 0;
    *(void *)(a1 + 8 * a2) = 0;
    return result;
  }
  size_t v7 = strlen(v4);
  size_t v8 = v7 + 1;
  if (v7 + 1 < 0x2000000001)
  {
    size_t v10 = malloc(v7 + 1);
    if (v10)
    {
      uint64_t v11 = v10;
      memcpy(v10, v4, v8);
      uint64_t result = 0;
      *(void *)(a1 + 8 * a2) = v11;
      return result;
    }
  }
  else
  {
    *__error() = 12;
  }
  *(void *)(a1 + 8 * a2) = 0;
  uint64_t v12 = __error();
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextSetString", 259, 125, *v12, "malloc", v13, v14, v15);
  return 0xFFFFFFFFLL;
}

uint64_t contextLoadString(uint64_t a1, unsigned int a2, char *a3)
{
  memset(&v33, 0, sizeof(v33));
  int v6 = open(a3, 0);
  if ((v6 & 0x80000000) == 0)
  {
    int v7 = v6;
    if (fstat(v6, &v33) < 0
      || ((st_size = v33.st_size, (v33.st_mode & 0xF000) == 0x8000) ? (BOOL v11 = v33.st_size == 0) : (BOOL v11 = 1), v11))
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextLoadString", 274, 125, 0, "invalid file: %s", v8, v9, (char)a3);
    }
    else
    {
      if ((unint64_t)(v33.st_size + 1) < 0x2000000001)
      {
        uint64_t v16 = malloc(v33.st_size + 1);
        if (v16)
        {
          uint64_t v17 = v16;
          ssize_t v18 = read(v7, v16, st_size);
          if (v18 < 0)
          {
            int v29 = *__error();
            __int16 v30 = 280;
            int v31 = a3;
          }
          else
          {
            if (v18 == st_size)
            {
              uint64_t v21 = MEMORY[0x263EF8318];
              do
              {
                off_t v22 = st_size;
                if (!st_size) {
                  break;
                }
                unsigned int v23 = (char)v17[st_size - 1];
                int v24 = (v23 & 0x80000000) != 0 ? __maskrune(v23, 0x4000uLL) : *(_DWORD *)(v21 + 4 * v23 + 60) & 0x4000;
                --st_size;
              }
              while (v24);
              uint64_t v15 = 0;
              v17[v22] = 0;
              *(void *)(a1 + 8 * a2) = v17;
              goto LABEL_25;
            }
            int v31 = "truncated read";
            __int16 v30 = 281;
            int v29 = 0;
          }
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextLoadString", v30, 125, v29, v31, v19, v20, v32);
LABEL_24:
          free(v17);
          uint64_t v15 = 0xFFFFFFFFLL;
LABEL_25:
          close(v7);
          return v15;
        }
      }
      else
      {
        *__error() = 12;
      }
      int v25 = *__error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextLoadString", 277, 125, v25, "malloc", v26, v27, v32);
    }
    uint64_t v17 = 0;
    goto LABEL_24;
  }
  uint64_t v12 = __error();
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextLoadString", 273, 125, *v12, a3, v13, v14, v32);
  return 0xFFFFFFFFLL;
}

uint64_t knoxPageStreamClose(int *a1)
{
  if (!a1) {
    return 0;
  }
  if (a1[2] >= 1 && a1[4] && AAByteStreamWrite(*(AAByteStream *)a1, "]\n", 2uLL) != 2)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxPageStreamClose", 67, 125, 0, "writing final ']'", v2, v3, v6);
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v4 = 0;
  }
  free(a1);
  return v4;
}

uint64_t knoxPageStreamWrite(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a3;
  uint64_t v9 = a2;
  int v11 = *(_DWORD *)(a1 + 8);
  if (v11)
  {
    if (v11 < 1)
    {
      uint64_t v12 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    if (!a3 || *a2 != 91)
    {
      uint64_t v12 = 0;
      *(_DWORD *)(a1 + 8) = -1;
      goto LABEL_28;
    }
    *(_DWORD *)(a1 + 8) = 1;
  }
  uint64_t v12 = 0;
  if (a3 && *(_DWORD *)(a1 + 12))
  {
    if (*a2 != 91)
    {
      uint64_t v14 = "expected '['";
      __int16 v15 = 93;
LABEL_41:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxPageStreamWrite", v15, 125, 0, v14, a7, a8, v23);
      return -1;
    }
    *(_DWORD *)(a1 + 12) = 0;
    uint64_t v9 = a2 + 1;
    uint64_t v8 = a3 - 1;
    uint64_t v12 = 1;
  }
  if (!v8) {
    goto LABEL_35;
  }
  if (!*(_DWORD *)(a1 + 16))
  {
    uint64_t v13 = 0;
    goto LABEL_18;
  }
  if (AAByteStreamWrite(*(AAByteStream *)a1, "]", 1uLL) != 1)
  {
    uint64_t v14 = "writing ']'";
    __int16 v15 = 105;
    goto LABEL_41;
  }
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v13 = 1;
LABEL_18:
  uint64_t v16 = v12 + 1;
  uint64_t v17 = v8 - 1;
  uint64_t v18 = MEMORY[0x263EF8318];
  while (1)
  {
    unsigned int v19 = (char)v9[v17];
    if ((v19 & 0x80000000) != 0) {
      break;
    }
    if ((*(_DWORD *)(v18 + 4 * v19 + 60) & 0x4000) == 0) {
      goto LABEL_25;
    }
LABEL_23:
    ++v16;
    if (--v17 == -1) {
      goto LABEL_27;
    }
  }
  if (__maskrune(v19, 0x4000uLL)) {
    goto LABEL_23;
  }
LABEL_25:
  if (v9[v17] == 93)
  {
    *(_DWORD *)(a1 + 16) = 1;
    uint64_t v12 = v16;
    uint64_t v8 = v17;
  }
LABEL_27:
  if (v8)
  {
LABEL_28:
    *(_DWORD *)(a1 + 20) = 1;
    AAByteStream v20 = *(AAByteStream *)a1;
    if (*((void *)v20 + 3))
    {
      if (v8)
      {
        uint64_t v13 = 0;
        while (1)
        {
          uint64_t v21 = (*((uint64_t (**)(void, unsigned char *, uint64_t))v20 + 3))(*(void *)v20, v9, v8);
          if (v21 < 1) {
            break;
          }
          v9 += v21;
          v13 += v21;
          v8 -= v21;
          if (!v8)
          {
            if ((v13 & 0x8000000000000000) == 0) {
              goto LABEL_39;
            }
            goto LABEL_37;
          }
        }
        uint64_t v13 = v21;
        if (v21 < 0) {
          goto LABEL_37;
        }
        goto LABEL_39;
      }
LABEL_35:
      uint64_t v13 = 0;
      goto LABEL_39;
    }
    uint64_t v13 = -1;
LABEL_37:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxPageStreamWrite", 124, 125, 0, "write", a7, a8, v23);
  }
  else
  {
LABEL_39:
    v13 += v12;
  }
  return v13;
}

size_t pc_log_error(uint64_t a1, uint64_t a2, __int16 a3, int a4, int a5, const char *a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  bzero(__str, 0x400uLL);
  uint64_t v13 = (_WORD *)(((a3 & 0x3FFF) << 10) | (a4 << 24) | a5 & 0x3FF | 0x80000000);
  if (a5 >= 1)
  {
    uint64_t v14 = strerror(a5);
    snprintf(__str, 0x400uLL, "%s: ", v14);
  }
  size_t v15 = strlen(__str);
  vsnprintf(&__str[v15], 1024 - v15, a6, &a9);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    pc_log_error_cold_1((uint64_t)__str, (int)v13);
  }
  return ParallelCompressionUpdateError(v13, (size_t)__str);
}

uint64_t pc_log_warning(uint64_t a1, uint64_t a2, __int16 a3, int a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  bzero(__s, 0x400uLL);
  uint64_t v12 = ((a3 & 0x3FFF) << 10) | (a4 << 24) | 0x80000000;
  size_t v13 = strlen(__s);
  vsnprintf(&__s[v13], 1024 - v13, a5, &a9);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v16 = v12;
    __int16 v17 = 2080;
    uint64_t v18 = __s;
    _os_log_impl(&dword_21E237000, &_os_log_internal, OS_LOG_TYPE_INFO, "[0x%08x](warning) %s", buf, 0x12u);
  }
  return ParallelCompressionUpdateWarning(v12, __s);
}

void pc_log_error_cold_1(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_21E237000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[0x%08x] %s", (uint8_t *)v2, 0x12u);
}

size_t appendThreadErrorContextString(size_t result)
{
  if (result)
  {
    size_t v1 = (const void *)result;
    uint64_t result = strlen((const char *)result);
    if (result - 8193 >= 0xFFFFFFFFFFFFE000)
    {
      size_t v2 = result;
      pthread_key_t ErrorContextKey = getErrorContextKey();
      uint64_t result = (size_t)pthread_getspecific(ErrorContextKey);
      if (result)
      {
        size_t v4 = result;
        __int16 v5 = v2 + 3;
        uint64_t v6 = *(unsigned __int16 *)(result + 72);
        if (v6 + (unsigned __int16)(v2 + 3) <= *(unsigned __int16 *)(result + 74))
        {
          size_t v7 = result + v6;
          *(_WORD *)(v7 + 76) = v5;
          size_t v8 = v7 + 78;
          uint64_t result = (size_t)memcpy((void *)(v7 + 78), v1, v2);
          *(unsigned char *)(v8 + v2) = 0;
          *(_WORD *)(v4 + 72) += v5;
        }
      }
    }
  }
  return result;
}

_WORD *updateThreadErrorContextErrorCode(_WORD *result)
{
  if ((result & 0x80000000) != 0)
  {
    int v1 = (int)result;
    pthread_key_t ErrorContextKey = getErrorContextKey();
    uint64_t result = pthread_getspecific(ErrorContextKey);
    if (result)
    {
      if ((*(_DWORD *)result & 0x80000000) == 0)
      {
        *(_DWORD *)uint64_t result = v1;
        result[3] = 0;
      }
    }
  }
  return result;
}

_DWORD *updateThreadErrorContextWarningCode(_DWORD *result)
{
  if ((result & 0x80000000) != 0)
  {
    int v1 = (int)result;
    pthread_key_t ErrorContextKey = getErrorContextKey();
    uint64_t result = pthread_getspecific(ErrorContextKey);
    if (result)
    {
      if ((*result & 0x80000000) == 0)
      {
        uint64_t v3 = *((unsigned __int16 *)result + 3);
        if (v3 <= 0xF)
        {
          result[v3 + 2] = v1;
          *((_WORD *)result + 3) = v3 + 1;
        }
      }
    }
  }
  return result;
}

size_t ParallelCompressionUpdateError(_WORD *a1, size_t a2)
{
  updateThreadErrorContextErrorCode(a1);
  return appendThreadErrorContextString(a2);
}

uint64_t getErrorContextKey()
{
  if (pthread_once(&getErrorContextKey_errorContextOnce, (void (*)(void))createErrorContextKey))
  {
    v0 = __error();
    pc_log_error("/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/Threads.c", "getErrorContextKey", 53, 5, *v0, "pthread_once");
  }
  return gErrorContextKey;
}

uint64_t createErrorContextKey()
{
  uint64_t result = pthread_key_create((pthread_key_t *)&gErrorContextKey, 0);
  if (result)
  {
    uint64_t v1 = *__error();
    return pc_log_error("/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/Threads.c", "createErrorContextKey", 42, 5, v1, "pthread_key_create");
  }
  return result;
}

uint64_t aaParseHexString(int a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = (2 * a1);
  if (!v8)
  {
LABEL_13:
    int v11 = 0;
    return (v11 << 31 >> 31);
  }
  uint64_t v9 = 0;
  char v10 = 0;
  int v11 = 1;
  while (1)
  {
    int v12 = *(unsigned __int8 *)(a3 + v9);
    if (!*(unsigned char *)(a3 + v9))
    {
      uint64_t v14 = "truncated hex string";
      __int16 v15 = 13;
      goto LABEL_16;
    }
    if ((v12 - 48) >= 0xA) {
      break;
    }
    char v13 = -48;
LABEL_10:
    char v10 = v13 + 16 * v10 + v12;
    if (v9)
    {
      *a2++ = v10;
      char v10 = 0;
    }
    int v11 = ++v9 < v8;
    if (v8 == v9) {
      goto LABEL_13;
    }
  }
  if ((v12 - 97) < 6)
  {
    char v13 = -87;
    goto LABEL_10;
  }
  if ((v12 - 65) < 6)
  {
    char v13 = -55;
    goto LABEL_10;
  }
  uint64_t v14 = "invalid hex string";
  __int16 v15 = 18;
LABEL_16:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AASerialization.c", (uint64_t)"aaParseHexString", v15, 106, 0, v14, a7, a8, v17);
  return (v11 << 31 >> 31);
}

uint64_t jsonPushLabel(uint64_t a1, char a2)
{
  unint64_t v4 = *(void *)(a1 + 72);
  unint64_t v5 = *(void *)(a1 + 80);
  uint64_t v6 = (void *)(a1 + 72);
  if (v5 >= v4)
  {
    if (v4) {
      size_t v8 = v4 + (v4 >> 1);
    }
    else {
      size_t v8 = 256;
    }
    *(void *)(a1 + 72) = v8;
    size_t v7 = reallocf(*(void **)(a1 + 88), v8);
    *(void *)(a1 + 88) = v7;
    if (!v7)
    {
      char v10 = __error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"jsonPushLabel", 358, 109, *v10, "malloc", v11, v12, v14);
      *uint64_t v6 = 0;
      v6[1] = 0;
      return 0xFFFFFFFFLL;
    }
    unint64_t v5 = *(void *)(a1 + 80);
  }
  else
  {
    size_t v7 = *(unsigned char **)(a1 + 88);
  }
  uint64_t v9 = 0;
  *(void *)(a1 + 80) = v5 + 1;
  v7[v5] = a2;
  return v9;
}

uint64_t jsonPushValue(uint64_t a1, char a2)
{
  unint64_t v4 = *(void *)(a1 + 96);
  unint64_t v5 = *(void *)(a1 + 104);
  uint64_t v6 = (void *)(a1 + 96);
  if (v5 >= v4)
  {
    if (v4) {
      size_t v8 = v4 + (v4 >> 1);
    }
    else {
      size_t v8 = 256;
    }
    *(void *)(a1 + 96) = v8;
    size_t v7 = reallocf(*(void **)(a1 + 112), v8);
    *(void *)(a1 + 112) = v7;
    if (!v7)
    {
      char v10 = __error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"jsonPushValue", 372, 109, *v10, "malloc", v11, v12, v14);
      *uint64_t v6 = 0;
      v6[1] = 0;
      return 0xFFFFFFFFLL;
    }
    unint64_t v5 = *(void *)(a1 + 104);
  }
  else
  {
    size_t v7 = *(unsigned char **)(a1 + 112);
  }
  uint64_t v9 = 0;
  *(void *)(a1 + 104) = v5 + 1;
  v7[v5] = a2;
  return v9;
}

void *AAJSONInputStreamOpen(uint64_t a1)
{
  size_t v2 = malloc(0x78uLL);
  uint64_t v3 = v2;
  if (v2)
  {
    memset_s(v2, 0x78uLL, 0, 0x78uLL);
    v3[1] = a1;
    void v3[5] = 0x10000;
    unint64_t v4 = malloc(0x10000uLL);
    v3[8] = v4;
    if (v4)
    {
      *(void *)((char *)v3 + 20) = 32;
      v3[4] = calloc(0x20uLL, 4uLL);
    }
    else
    {
      size_t v8 = __error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamOpen", 387, 109, *v8, "malloc", v9, v10, v12);
      AAJSONInputStreamClose((void **)v3);
      return 0;
    }
  }
  else
  {
    unint64_t v5 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamOpen", 382, 109, *v5, "malloc", v6, v7, v12);
  }
  return v3;
}

void AAJSONInputStreamClose(void **a1)
{
  if (a1)
  {
    free(a1[4]);
    free(a1[11]);
    free(a1[14]);
    free(a1[8]);
    free(a1);
  }
}

uint64_t AAJSONInputStreamRead(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (atomic_load((unsigned int *)a1)) {
    return 0xFFFFFFFFLL;
  }
  int v10 = *(_DWORD *)(a1 + 16);
  if (v10 == 9 || v10 == -1)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamRead", 418, 109, 0, "unexpected read call", a7, a8, v46);
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 104) = 0;
  uint64_t v14 = MEMORY[0x263EF8318];
  while (2)
  {
    unint64_t v15 = *(void *)(a1 + 56);
    int v16 = *(unsigned __int8 **)(a1 + 64);
    if (v15 >= *(void *)(a1 + 48))
    {
      ssize_t v17 = AAByteStreamRead(*(AAByteStream *)(a1 + 8), v16, *(void *)(a1 + 40));
      if (v17 < 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamRead", 430, 109, 0, "read error: %zd", a7, a8, v17);
LABEL_104:
        uint64_t result = 0xFFFFFFFFLL;
        *(_DWORD *)(a1 + 16) = -1;
        return result;
      }
      if (!v17)
      {
        __int16 v30 = "EOF reached";
        __int16 v31 = 431;
        goto LABEL_103;
      }
      unint64_t v15 = 0;
      *(void *)(a1 + 48) = v17;
      int v16 = *(unsigned __int8 **)(a1 + 64);
    }
    *(void *)(a1 + 56) = v15 + 1;
    int v18 = v16[v15];
    char v19 = v16[v15];
    switch(*(_DWORD *)(a1 + 16))
    {
      case 0:
        *(void *)(a1 + 104) = 0;
        if ((char)v18 < 0)
        {
          if (__maskrune((char)v18, 0x4000uLL)) {
            continue;
          }
        }
        else if ((*(_DWORD *)(v14 + 4 * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }
        if (v18 == 34) {
          goto LABEL_68;
        }
        if (v18 == 43 || v18 == 45 || ((char)v18 - 48) <= 9)
        {
          if ((jsonPushValue(a1, v18) & 0x80000000) == 0)
          {
            int v23 = 3;
            goto LABEL_69;
          }
          __int16 v30 = "jsonPushValue";
          __int16 v31 = 451;
          goto LABEL_103;
        }
        if (v18 == 123)
        {
          uint64_t v32 = *(unsigned int *)(a1 + 24);
          if (v32 == *(_DWORD *)(a1 + 20))
          {
            __int16 v30 = "max level reached";
            __int16 v31 = 465;
            goto LABEL_103;
          }
          int v27 = 0;
          uint64_t v44 = *(void *)(a1 + 32);
          *(_DWORD *)(a1 + 24) = v32 + 1;
          *(_DWORD *)(v44 + 4 * v32) = 0;
          int v37 = 6;
          goto LABEL_125;
        }
        if (v18 == 91)
        {
          uint64_t v33 = *(unsigned int *)(a1 + 24);
          if (v33 == *(_DWORD *)(a1 + 20))
          {
            __int16 v30 = "max level reached";
            __int16 v31 = 457;
            goto LABEL_103;
          }
          int v37 = 0;
          uint64_t v45 = *(void *)(a1 + 32);
          *(_DWORD *)(a1 + 24) = v33 + 1;
          int v27 = 1;
          *(_DWORD *)(v45 + 4 * v33) = 1;
          goto LABEL_125;
        }
        if (((char)v18 - 97) <= 0x19)
        {
          if ((jsonPushValue(a1, v18) & 0x80000000) == 0)
          {
            int v23 = 4;
            goto LABEL_69;
          }
          __int16 v30 = "jsonPushValue";
          __int16 v31 = 473;
          goto LABEL_103;
        }
        unsigned int v25 = *(_DWORD *)(a1 + 24) - 1;
        BOOL v34 = (*(_DWORD *)(*(void *)(a1 + 32) + 4 * v25) & 1) == 0 || (char)v18 != 93;
        BOOL v35 = (*(_DWORD *)(*(void *)(a1 + 32) + 4 * v25) & 1) == 0 && (char)v18 == 125;
        if (v34 && !v35) {
          goto LABEL_102;
        }
        goto LABEL_121;
      case 1:
        if (v18 == 92)
        {
          int v23 = 2;
          goto LABEL_69;
        }
        if (v18 == 34)
        {
          *(_DWORD *)(a1 + 16) = 5;
          if ((jsonPushValue(a1, 0) & 0x80000000) == 0)
          {
            int v27 = 3;
            goto LABEL_126;
          }
          __int16 v30 = "jsonPushValue";
          __int16 v31 = 499;
          goto LABEL_103;
        }
        if ((jsonPushValue(a1, v18) & 0x80000000) != 0)
        {
          __int16 v30 = "jsonPushValue";
          __int16 v31 = 503;
          goto LABEL_103;
        }
        continue;
      case 2:
        HIDWORD(v21) = (char)v18;
        LODWORD(v21) = ((char)v18 << 24) - 1644167168;
        unsigned __int8 v20 = v21 >> 25;
        if (v20 < 0xAu && ((0x341u >> v20) & 1) != 0)
        {
          char v22 = asc_21E3A75D0[(char)v20];
        }
        else if ((char)v18 == 102)
        {
          char v22 = 12;
        }
        else
        {
          char v22 = v19;
        }
        if ((jsonPushValue(a1, v22) & 0x80000000) != 0)
        {
          __int16 v30 = "jsonPushValue";
          __int16 v31 = 512;
          goto LABEL_103;
        }
LABEL_68:
        int v23 = 1;
        goto LABEL_69;
      case 3:
        if (((char)v18 - 48) > 9)
        {
          *(_DWORD *)(a1 + 16) = 5;
          *(void *)(a1 + 56) = v15;
          if ((jsonPushValue(a1, 0) & 0x80000000) == 0)
          {
            int v27 = 4;
            goto LABEL_126;
          }
          __int16 v30 = "jsonPushValue";
          __int16 v31 = 539;
          goto LABEL_103;
        }
        if ((jsonPushValue(a1, v18) & 0x80000000) != 0)
        {
          __int16 v30 = "jsonPushValue";
          __int16 v31 = 533;
          goto LABEL_103;
        }
        continue;
      case 4:
        if (((char)v18 - 97) > 0x19)
        {
          *(_DWORD *)(a1 + 16) = 5;
          *(void *)(a1 + 56) = v15;
          if ((jsonPushValue(a1, 0) & 0x80000000) == 0)
          {
            uint64_t v28 = *(const char **)(a1 + 112);
            if (!strcmp(v28, "false") || !strcmp(v28, "true"))
            {
              int v27 = 6;
            }
            else
            {
              if (strcmp(v28, "null")) {
                goto LABEL_102;
              }
              int v27 = 7;
            }
            goto LABEL_126;
          }
          __int16 v30 = "jsonPushValue";
          __int16 v31 = 524;
          goto LABEL_103;
        }
        if ((jsonPushValue(a1, v18) & 0x80000000) != 0)
        {
          __int16 v30 = "jsonPushValue";
          __int16 v31 = 519;
          goto LABEL_103;
        }
        continue;
      case 5:
        if ((char)v18 < 0)
        {
          if (__maskrune((char)v18, 0x4000uLL)) {
            continue;
          }
        }
        else if ((*(_DWORD *)(v14 + 4 * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }
        int v24 = *(_DWORD *)(a1 + 24);
        if (!v24)
        {
          __int16 v30 = "invalid JSON state";
          __int16 v31 = 546;
          goto LABEL_103;
        }
        unsigned int v25 = v24 - 1;
        int v26 = *(_DWORD *)(*(void *)(a1 + 32) + 4 * v25);
        if (v18 != 44)
        {
          if (v18 == 93)
          {
            if (v26) {
              goto LABEL_121;
            }
            char v19 = 93;
          }
          else if (v18 == 125)
          {
            goto LABEL_91;
          }
LABEL_102:
          char v46 = v19;
          __int16 v30 = "invalid char %c %s";
          __int16 v31 = 610;
          goto LABEL_103;
        }
        if (v26) {
          int v23 = 0;
        }
        else {
          int v23 = 6;
        }
LABEL_69:
        *(_DWORD *)(a1 + 16) = v23;
        continue;
      case 6:
        *(void *)(a1 + 80) = 0;
        if (((char)v18 & 0x80000000) == 0)
        {
          if ((*(_DWORD *)(v14 + 4 * (char)v18 + 60) & 0x4000) == 0) {
            goto LABEL_61;
          }
          continue;
        }
        if (__maskrune((char)v18, 0x4000uLL)) {
          continue;
        }
LABEL_61:
        if (v18 == 34)
        {
          int v23 = 7;
          goto LABEL_69;
        }
        if (v18 != 125) {
          goto LABEL_102;
        }
        int v29 = *(_DWORD *)(a1 + 24);
        if (!v29) {
          goto LABEL_92;
        }
        unsigned int v25 = v29 - 1;
        int v26 = *(_DWORD *)(*(void *)(a1 + 32) + 4 * v25);
LABEL_91:
        if (v26)
        {
LABEL_92:
          char v19 = 125;
          goto LABEL_102;
        }
LABEL_121:
        *(_DWORD *)(a1 + 24) = v25;
        if (v25) {
          int v37 = 5;
        }
        else {
          int v37 = 9;
        }
        int v27 = 2;
LABEL_125:
        *(_DWORD *)(a1 + 16) = v37;
LABEL_126:
        if (a2) {
          memset_s(a2, 0x38uLL, 0, 0x38uLL);
        }
        *a2 = v27;
        uint64_t v38 = *(void *)(a1 + 80);
        if (v38) {
          uint64_t v38 = *(void *)(a1 + 88);
        }
        *((void *)a2 + 1) = v38;
        a2[12] = *(_DWORD *)(a1 + 24);
        if (v27 == 6)
        {
          int v39 = strcmp(*(const char **)(a1 + 112), "true");
          uint64_t result = 0;
          a2[9] = v39 == 0;
        }
        else if (v27 == 4)
        {
          uint64_t v40 = *(const char **)(a1 + 112);
          if (*v40 == 45)
          {
            unint64_t v41 = strtoull(v40 + 1, 0, 10);
            uint64_t result = 0;
            *((void *)a2 + 3) = v41;
            int v42 = -1;
          }
          else
          {
            unint64_t v43 = strtoull(v40, 0, 0);
            uint64_t result = 0;
            *((void *)a2 + 3) = v43;
            int v42 = v43 != 0;
          }
          a2[8] = v42;
        }
        else
        {
          uint64_t result = 0;
          if (v27 == 3) {
            *((void *)a2 + 2) = *(void *)(a1 + 112);
          }
        }
        return result;
      case 7:
        if ((char)v18 == 34)
        {
          if ((jsonPushLabel(a1, 0) & 0x80000000) == 0)
          {
            int v23 = 8;
            goto LABEL_69;
          }
          __int16 v30 = "jsonPushLabel";
          __int16 v31 = 587;
LABEL_103:
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamRead", v31, 109, 0, v30, a7, a8, v46);
          goto LABEL_104;
        }
        if ((jsonPushLabel(a1, v18) & 0x80000000) != 0)
        {
          __int16 v30 = "jsonPushLabel";
          __int16 v31 = 591;
          goto LABEL_103;
        }
        continue;
      case 8:
        if ((char)v18 < 0)
        {
          if (__maskrune((char)v18, 0x4000uLL)) {
            continue;
          }
        }
        else if ((*(_DWORD *)(v14 + 4 * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }
        if ((char)v18 != 58) {
          goto LABEL_102;
        }
        int v23 = 0;
        goto LABEL_69;
      default:
        goto LABEL_102;
    }
  }
}

id frk_unwrapped_symmetric_key_with_shipping_private_key(void *a1, void *a2, void *a3)
{
  v44[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = [a1 objectForKey:@"com.apple.wkms.fcs-response"];
  uint64_t v7 = (void *)v6;
  if (!v5)
  {
    __int16 v31 = a3;
    int v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v43 = *MEMORY[0x263F08320];
    v44[0] = @"ERROR: Shipping private key is NULL.";
    char v12 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
    char v19 = v18;
    uint64_t v20 = 26;
LABEL_14:
    id v15 = [v19 errorWithDomain:@"com.apple.internal.fetchrestorekeys" code:v20 userInfo:v12];
    size_t v8 = 0;
    int v10 = 0;
    uint64_t v11 = 0;
LABEL_16:
    uint64_t v14 = 0;
    int v16 = 0;
    goto LABEL_17;
  }
  if (!v6)
  {
    __int16 v31 = a3;
    unint64_t v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v41 = *MEMORY[0x263F08320];
    int v42 = @"ERROR: This archive does not contain a shipping key response.";
    char v12 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    char v19 = v21;
    uint64_t v20 = 25;
    goto LABEL_14;
  }
  id v34 = 0;
  size_t v8 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v34];
  id v9 = v34;
  if (!v8)
  {
    int v10 = 0;
    uint64_t v11 = 0;
    uint64_t v14 = 0;
    int v16 = 0;
    if (!a3) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  int v10 = [v8 objectForKey:@"wrapped-key"];
  uint64_t v11 = [v8 objectForKey:@"enc-request"];
  __int16 v31 = a3;
  if (!v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || !v11
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    uint64_t v40 = @"ERROR: Response dictionary is missing required keys. Will fail";
    char v12 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    id v15 = [v22 errorWithDomain:@"com.apple.internal.fetchrestorekeys" code:23 userInfo:v12];

    goto LABEL_16;
  }
  char v12 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v10 options:0];
  uint64_t v13 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v11 options:0];
  __int16 v30 = (void *)v13;
  if (!v12)
  {
    unsigned int v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v37 = *MEMORY[0x263F08320];
    uint64_t v38 = @"ERROR: shipping key wrapped-key failed base64 decode";
    int v26 = NSDictionary;
    int v27 = &v38;
    uint64_t v28 = &v37;
LABEL_24:
    objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1, v30);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [v25 errorWithDomain:@"com.apple.internal.fetchrestorekeys" code:19 userInfo:v15];

    id v17 = (id)v29;
    uint64_t v14 = 0;
    int v16 = 0;
    goto LABEL_25;
  }
  if (!v13)
  {
    unsigned int v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = *MEMORY[0x263F08320];
    uint64_t v36 = @"ERROR: shipping key enc-request failed base64 decode";
    int v26 = NSDictionary;
    int v27 = &v36;
    uint64_t v28 = &v35;
    goto LABEL_24;
  }
  id v33 = v9;
  uint64_t v14 = +[CryptoKitWrapper convertPrivateKeyTox963WithPemPrivateKey:v5 error:&v33];
  id v15 = v33;

  if (!v14)
  {
    int v16 = 0;
    goto LABEL_26;
  }
  id v32 = v15;
  int v16 = +[CryptoKitWrapper unwrapEncryptionKeyWithWrappedKey:v12 encapsulatedKey:v30 privateKey:v14 error:&v32];
  id v17 = v32;
LABEL_25:

  id v15 = v17;
LABEL_26:

LABEL_17:
  id v9 = v15;
  a3 = v31;
  if (v31) {
LABEL_18:
  }
    *a3 = v9;
LABEL_19:
  id v23 = v16;

  return v23;
}

id frk_metadata_from_aea_auth_data(AEAAuthData_impl *a1, void *a2)
{
  v42[1] = *MEMORY[0x263EF8340];
  unint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  uint32_t EntryCount = AEAAuthDataGetEntryCount(a1);
  if (!EntryCount)
  {
LABEL_12:
    int v16 = (void *)[v4 copy];
    id v17 = 0;
    if (a2) {
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  uint32_t v6 = EntryCount;
  uint32_t v7 = 0;
  while (1)
  {
    data_std::string::size_type size = 0;
    size_t key_length = 0;
    if (AEAAuthDataGetEntry(a1, v7, 0, 0, &key_length, 0, 0, &data_size))
    {
      int v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = *MEMORY[0x263F08320];
      __int16 v30 = @"Failed to parse auth data blob.";
      char v19 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      id v17 = [v18 errorWithDomain:@"com.apple.internal.fetchrestorekeys" code:17 userInfo:v19];

      goto LABEL_22;
    }
    if (!key_length)
    {
      uint64_t v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v41 = *MEMORY[0x263F08320];
      v42[0] = @"Failed to parse key in KVS (zero size key).";
      unint64_t v21 = NSDictionary;
      char v22 = (__CFString **)v42;
      id v23 = &v41;
LABEL_20:
      uint64_t v13 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:1];
      id v17 = [v20 errorWithDomain:@"com.apple.internal.fetchrestorekeys" code:17 userInfo:v13];
      goto LABEL_21;
    }
    size_t v8 = ++key_length;
    if (!data_size)
    {
      uint64_t v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v39 = *MEMORY[0x263F08320];
      uint64_t v40 = @"Failed to parse key in KVS (zero size data).";
      unint64_t v21 = NSDictionary;
      char v22 = &v40;
      id v23 = &v39;
      goto LABEL_20;
    }
    id v9 = malloc_type_calloc(1uLL, v8, 0xA4E106D4uLL);
    if (!v9)
    {
      uint64_t v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v37 = *MEMORY[0x263F08320];
      uint64_t v38 = @"KVS keyBuffer allocation failure.";
      unint64_t v21 = NSDictionary;
      char v22 = &v38;
      id v23 = &v37;
      goto LABEL_20;
    }
    int v10 = v9;
    uint64_t v11 = (uint8_t *)malloc_type_calloc(1uLL, data_size, 0xE9F1B555uLL);
    if (!v11)
    {
      free(v10);
      uint64_t v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v35 = *MEMORY[0x263F08320];
      uint64_t v36 = @"KVS dataBuffer allocation failure.";
      unint64_t v21 = NSDictionary;
      char v22 = &v36;
      id v23 = &v35;
      goto LABEL_20;
    }
    char v12 = v11;
    if (AEAAuthDataGetEntry(a1, v7, key_length, (char *)v10, &key_length, data_size, v11, &data_size))
    {
      free(v10);
      free(v12);
      uint64_t v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v33 = *MEMORY[0x263F08320];
      id v34 = @"KVS data fetch failure.";
      unint64_t v21 = NSDictionary;
      char v22 = &v34;
      id v23 = &v33;
      goto LABEL_20;
    }
    uint64_t v13 = (void *)[[NSString alloc] initWithUTF8String:v10];
    id v14 = objc_alloc(MEMORY[0x263EFF8F8]);
    id v15 = (void *)[v14 initWithBytesNoCopy:v12 length:data_size freeWhenDone:1];
    free(v10);
    if (!v13 || !v15) {
      break;
    }
    [v4 setObject:v15 forKey:v13];

    if (v6 == ++v7) {
      goto LABEL_12;
    }
  }
  unsigned int v25 = (void *)MEMORY[0x263F087E8];
  uint64_t v31 = *MEMORY[0x263F08320];
  id v32 = @"KVS key value - parse failure.";
  int v26 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  id v17 = [v25 errorWithDomain:@"com.apple.internal.fetchrestorekeys" code:17 userInfo:v26];

LABEL_21:
LABEL_22:
  int v16 = 0;
  if (a2) {
LABEL_23:
  }
    *a2 = v17;
LABEL_24:

  return v16;
}

void *sub_21E393E30(uint64_t a1, void *a2)
{
  return sub_21E3946E0(a1, a2);
}

unint64_t sub_21E393E48(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2B060);
  uint64_t v2 = sub_21E396AC8();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_21E396074(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_21E394584(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_21E3960DC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21E393F74(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D2B058);
  uint64_t v2 = (void *)sub_21E396AC8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_21E394584(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    _DWORD v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void *sub_21E3940B0()
{
  return sub_21E394A08();
}

id sub_21E3940E0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t (*a5)(uint64_t, unint64_t))
{
  id v6 = a3;
  uint64_t v7 = sub_21E396938();
  unint64_t v9 = v8;

  uint64_t v10 = a5(v7, v9);
  unint64_t v12 = v11;
  sub_21E395F2C(v7, v9);
  uint64_t v13 = (void *)sub_21E396918();
  sub_21E395F2C(v10, v12);
  return v13;
}

id sub_21E3941E0(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, void *a5, unint64_t a6)
{
  return sub_21E394CD4(a1, a2, a3, a4, a5, a6);
}

char *sub_21E394380(uint64_t a1, unint64_t a2, __SecCertificate *a3)
{
  return sub_21E3952F0(a1, a2, a3);
}

id sub_21E3944A8()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id sub_21E3944DC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CryptoKitWrapper();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_21E394550()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CryptoKitWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_21E394584(uint64_t a1, uint64_t a2)
{
  sub_21E396AE8();
  sub_21E396AB8();
  uint64_t v4 = sub_21E396AF8();
  return sub_21E3945FC(a1, a2, v4);
}

unint64_t sub_21E3945FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21E396AD8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_21E396AD8() & 1) == 0);
    }
  }
  return v6;
}

void *sub_21E3946E0(uint64_t a1, void *a2)
{
  uint64_t v5 = sub_21E396AA8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = &v20[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_21E396A38();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = a1;
  char v22 = a2;
  sub_21E39601C(a1, (unint64_t)a2);
  sub_21E396A28();
  if (!v2)
  {
    uint64_t v23 = v10;
    sub_21E396A08();
    sub_21E396A98();
    a2 = (void *)sub_21E396A78();
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
    if (v14 >> 60 == 15)
    {
      sub_21E396A68();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D2B040);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21E3A75E0;
      *(void *)(inited + 32) = sub_21E396A68();
      *(void *)(inited + 40) = v16;
      *(void *)(inited + 72) = MEMORY[0x263F8D310];
      *(void *)(inited + 48) = 0xD000000000000017;
      *(void *)(inited + 56) = 0x800000021E3C8330;
      sub_21E393E48(inited);
      id v17 = objc_allocWithZone(MEMORY[0x263F087E8]);
      int v18 = (void *)sub_21E396A58();
      swift_bridgeObjectRelease();
      a2 = (void *)sub_21E396A48();
      swift_bridgeObjectRelease();
      objc_msgSend(v17, sel_initWithDomain_code_userInfo_, v18, 31, a2);

      swift_willThrow();
      (*(void (**)(unsigned char *, uint64_t))(v23 + 8))(v12, v9);
    }
    else
    {
      (*(void (**)(unsigned char *, uint64_t))(v23 + 8))(v12, v9);
    }
  }
  return a2;
}

void *sub_21E394A08()
{
  id v1 = v0;
  uint64_t v2 = sub_21E396AA8();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_21E396A38();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_21E396A98();
  uint64_t v7 = sub_21E396A88();
  if (v8)
  {
    MEMORY[0x270FA5388](v7);
    sub_21E3969F8();
    if (!v0)
    {
      uint64_t v13 = (*(uint64_t (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 32))(&v15[-v6], &v15[-v6], v3);
      id v1 = (void *)MEMORY[0x223C23B40](v13);
      (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(&v15[-v6], v3);
    }
  }
  else
  {
    sub_21E396A68();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2B040);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21E3A75E0;
    *(void *)(inited + 32) = sub_21E396A68();
    *(void *)(inited + 40) = v10;
    *(void *)(inited + 72) = MEMORY[0x263F8D310];
    *(void *)(inited + 48) = 0xD000000000000017;
    *(void *)(inited + 56) = 0x800000021E3C8330;
    sub_21E393E48(inited);
    id v11 = objc_allocWithZone(MEMORY[0x263F087E8]);
    uint64_t v12 = (void *)sub_21E396A58();
    swift_bridgeObjectRelease();
    id v1 = (void *)sub_21E396A48();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel_initWithDomain_code_userInfo_, v12, 31, v1);

    swift_willThrow();
  }
  return v1;
}

id sub_21E394CD4(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, id a5, unint64_t a6)
{
  if (MEMORY[0x263F04738]) {
    BOOL v7 = MEMORY[0x263F04748] == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7 || MEMORY[0x263F04740] == 0)
  {
    sub_21E396A68();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2B040);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21E3A75E0;
    *(void *)(inited + 32) = sub_21E396A68();
    *(void *)(inited + 40) = v15;
    *(void *)(inited + 72) = MEMORY[0x263F8D310];
    *(void *)(inited + 48) = 0xD000000000000027;
    *(void *)(inited + 56) = 0x800000021E3C8300;
    sub_21E393E48(inited);
    a5 = objc_allocWithZone(MEMORY[0x263F087E8]);
    uint64_t v16 = (void *)sub_21E396A58();
    swift_bridgeObjectRelease();
    id v17 = (void *)sub_21E396A48();
    swift_bridgeObjectRelease();
    objc_msgSend(a5, sel_initWithDomain_code_userInfo_, v16, 12, v17);

    swift_willThrow();
  }
  else
  {
    unint64_t v45 = a2;
    unint64_t v46 = a4;
    uint64_t v44 = a1;
    uint64_t v12 = sub_21E396A38();
    uint64_t v49 = *(void *)(v12 - 8);
    uint64_t v13 = *(void *)(v49 + 64);
    MEMORY[0x270FA5388](v12);
    id v47 = a5;
    unint64_t v48 = a6;
    sub_21E39601C((uint64_t)a5, a6);
    sub_21E396A28();
    if (!v6)
    {
      uint64_t v41 = &v32;
      uint64_t v43 = sub_21E396958();
      uint64_t v36 = &v32;
      uint64_t v19 = *(void *)(v43 - 8);
      uint64_t v20 = *(void *)(v19 + 64);
      MEMORY[0x270FA5388](v43);
      uint64_t v42 = a3;
      sub_21E396948();
      uint64_t v21 = sub_21E3969C8();
      uint64_t v35 = &v32;
      uint64_t v32 = v21;
      uint64_t v33 = *(void *)(v21 - 8);
      uint64_t v22 = MEMORY[0x270FA5388](v21);
      int v24 = (char *)&v32 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v39 = &v32;
      MEMORY[0x270FA5388](v22);
      unsigned int v25 = *(uint64_t (**)(char *))(v49 + 16);
      uint64_t v38 = v26;
      uint64_t v27 = v25((char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v37 = &v32;
      MEMORY[0x270FA5388](v27);
      uint64_t v40 = v19;
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))((char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v43);
      sub_21E39601C(v42, v46);
      id v34 = v24;
      sub_21E3969A8();
      uint64_t v28 = v49;
      uint64_t v29 = v33;
      unint64_t v46 = (unint64_t)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v30 = v40;
      uint64_t v31 = v38;
      id v47 = v44;
      unint64_t v48 = v45;
      sub_21E3960EC();
      a5 = (id)sub_21E3969B8();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v34, v32);
      (*(void (**)(unint64_t, uint64_t))(v30 + 8))(v46, v43);
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v31, v12);
    }
  }
  return a5;
}

char *sub_21E3952F0(uint64_t a1, unint64_t a2, SecCertificateRef certificate)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  if (MEMORY[0x263F04738]) {
    BOOL v4 = MEMORY[0x263F04748] == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4 || MEMORY[0x263F04740] == 0)
  {
    sub_21E396A68();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D2B040);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21E3A75E0;
    *(void *)(inited + 32) = sub_21E396A68();
    *(void *)(inited + 40) = v16;
    *(void *)(inited + 72) = MEMORY[0x263F8D310];
    *(void *)(inited + 48) = 0xD000000000000027;
    *(void *)(inited + 56) = 0x800000021E3C8300;
    sub_21E393E48(inited);
    id v17 = objc_allocWithZone(MEMORY[0x263F087E8]);
    int v18 = (void *)sub_21E396A58();
    swift_bridgeObjectRelease();
    uint64_t v12 = (char *)sub_21E396A48();
    swift_bridgeObjectRelease();
    objc_msgSend(v17, sel_initWithDomain_code_userInfo_, v18, 12, v12);

    swift_willThrow();
    return v12;
  }
  unint64_t v89 = a2;
  uint64_t v88 = a1;
  uint64_t v6 = SecCertificateCopyKey(certificate);
  if (!v6)
  {
    __break(1u);
    goto LABEL_47;
  }
  BOOL v7 = v6;
  CFDataRef v8 = SecKeyCopyExternalRepresentation(v6, 0);
  if (!v8)
  {
LABEL_47:
    __break(1u);
    JUMPOUT(0x21E395EF8);
  }
  CFDataRef v9 = v8;
  uint64_t v10 = sub_21E3969E8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(char **)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (unint64_t)(v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v92 = (void *)sub_21E396938();
  uint64_t v93 = v14;
  sub_21E3969D8();
  if (v3)
  {

    return v12;
  }
  CFDataRef v78 = v9;
  uint64_t v79 = v7;
  __int16 v84 = &v73;
  uint64_t v20 = sub_21E396958();
  int v82 = 0;
  uint64_t v21 = (uint64_t *)v20;
  uint64_t v86 = &v73;
  uint64_t v87 = *(void *)(v20 - 8);
  uint64_t v22 = *(void *)(v87 + 64);
  MEMORY[0x270FA5388](v20);
  uint64_t v90 = v10;
  uint64_t v23 = (char *)&v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E396948();
  uint64_t v24 = sub_21E396998();
  uint64_t v83 = &v73;
  uint64_t v77 = v24;
  uint64_t v76 = *(void *)(v24 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v73 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = &v73;
  MEMORY[0x270FA5388](v25);
  uint64_t v12 = (char *)&v73 - v13;
  uint64_t v28 = *(uint64_t (**)(char *, char *, uint64_t))(v11 + 16);
  v85 = (char *)&v73 - v13;
  uint64_t v29 = v28((char *)&v73 - v13, (char *)&v73 - v13, v90);
  uint64_t v80 = &v73;
  MEMORY[0x270FA5388](v29);
  uint64_t v30 = v90;
  uint64_t v31 = v87;
  (*(void (**)(char *, char *, uint64_t *))(v87 + 16))(v23, v23, v21);
  uint64_t v32 = v82;
  sub_21E396968();
  if (v32)
  {

    (*(void (**)(char *, uint64_t *))(v31 + 8))(v23, v21);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v85, v30);
    return v12;
  }
  int v82 = v27;
  long long v74 = (char *)&v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = v11;
  switch(v89 >> 62)
  {
    case 1uLL:
      uint64_t v81 = v21;
      uint64_t v34 = v88;
      uint64_t v35 = (int)v88;
      uint64_t v36 = (v34 >> 32) - (int)v34;
      if (v34 >> 32 < (int)v34)
      {
        __break(1u);
LABEL_43:
        __break(1u);
        goto LABEL_44;
      }
      sub_21E39601C(v88, v89);
      uint64_t v37 = sub_21E3968D8();
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = sub_21E3968F8();
        if (!__OFSUB__(v35, v39))
        {
          uint64_t v40 = (void *)(v38 + v35 - v39);
          goto LABEL_34;
        }
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
      }
      uint64_t v40 = 0;
LABEL_34:
      uint64_t v57 = sub_21E3968E8();
      if (v57 >= v36) {
        uint64_t v58 = v36;
      }
      else {
        uint64_t v58 = v57;
      }
      uint64_t v59 = (char *)v40 + v58;
      if (!v40) {
        uint64_t v59 = 0;
      }
      uint64_t v92 = v40;
      uint64_t v93 = v59;
      sub_21E395FC8();
      uint64_t v52 = sub_21E396988();
      unint64_t v54 = v61;
      sub_21E395F2C(v88, v89);
      CFDataRef v55 = v78;
LABEL_40:
      uint64_t v33 = v82;
LABEL_41:
      unint64_t v89 = sub_21E396928();
      uint64_t v88 = v62;
      unint64_t v63 = v54;
      uint64_t v64 = v52;
      uint64_t v65 = sub_21E396978();
      unint64_t v67 = v66;
      uint64_t v68 = sub_21E396928();
      uint64_t v70 = v69;
      sub_21E395F2C(v65, v67);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D2B050);
      uint64_t v71 = swift_initStackObject();
      *(_OWORD *)(v71 + 16) = xmmword_21E3A75F0;
      *(void *)(v71 + 32) = 0x2D64657070617277;
      *(void *)(v71 + 40) = 0xEB0000000079656BLL;
      uint64_t v72 = v88;
      *(void *)(v71 + 48) = v89;
      *(void *)(v71 + 56) = v72;
      *(void *)(v71 + 64) = 0x757165722D636E65;
      *(void *)(v71 + 72) = 0xEB00000000747365;
      *(void *)(v71 + 80) = v68;
      *(void *)(v71 + 88) = v70;
      uint64_t v12 = (char *)sub_21E393F74(v71);
      sub_21E395F2C(v64, v63);

      (*(void (**)(char *, uint64_t *))(v87 + 8))(v74, v81);
      (*(void (**)(char *, uint64_t))(v75 + 8))(v85, v90);
      (*(void (**)(char *, uint64_t))(v76 + 8))(v33, v77);
      return v12;
    case 2uLL:
      uint64_t v41 = *(void *)(v88 + 16);
      uint64_t v42 = *(void *)(v88 + 24);
      swift_retain();
      swift_retain();
      uint64_t v43 = sub_21E3968D8();
      if (!v43) {
        goto LABEL_25;
      }
      uint64_t v44 = sub_21E3968F8();
      if (__OFSUB__(v41, v44)) {
        goto LABEL_45;
      }
      v43 += v41 - v44;
LABEL_25:
      BOOL v45 = __OFSUB__(v42, v41);
      uint64_t v46 = v42 - v41;
      if (v45) {
        goto LABEL_43;
      }
      uint64_t v47 = sub_21E3968E8();
      if (v47 >= v46) {
        uint64_t v48 = v46;
      }
      else {
        uint64_t v48 = v47;
      }
      uint64_t v49 = (char *)(v43 + v48);
      if (!v43) {
        uint64_t v49 = 0;
      }
      uint64_t v92 = (void *)v43;
      uint64_t v93 = v49;
      sub_21E395FC8();
      uint64_t v50 = sub_21E396988();
      CFDataRef v55 = v78;
      uint64_t v52 = v50;
      unint64_t v54 = v60;
      swift_release();
      swift_release();
      uint64_t v81 = v21;
      goto LABEL_40;
    case 3uLL:
      uint64_t v81 = v21;
      memset(v91, 0, 14);
      uint64_t v92 = v91;
      uint64_t v93 = (char *)v91;
      sub_21E395FC8();
      uint64_t v33 = v82;
      uint64_t v51 = sub_21E396988();
      unint64_t v54 = v56;
      CFDataRef v55 = v78;
      uint64_t v52 = v51;
      goto LABEL_41;
    default:
      uint64_t v81 = v21;
      v91[0] = v88;
      LODWORD(v91[1]) = v89;
      WORD2(v91[1]) = WORD2(v89);
      uint64_t v92 = v91;
      uint64_t v93 = (char *)v91 + BYTE6(v89);
      sub_21E395FC8();
      uint64_t v33 = v82;
      uint64_t v52 = sub_21E396988();
      unint64_t v54 = v53;
      CFDataRef v55 = v78;
      goto LABEL_41;
  }
}

uint64_t type metadata accessor for CryptoKitWrapper()
{
  return self;
}

uint64_t sub_21E395F2C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_21E395FC8()
{
  unint64_t result = qword_267D2B048;
  if (!qword_267D2B048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2B048);
  }
  return result;
}

uint64_t sub_21E39601C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_21E396074(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2B068);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_21E3960DC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_21E3960EC()
{
  unint64_t result = qword_267D2B070;
  if (!qword_267D2B070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D2B070);
  }
  return result;
}

void std::__function::__func<di_hybrid_subscriber_t::di_hybrid_subscriber_t(io_rings_desc_t *,diskimage_uio::details::diskimage_impl &)::$_0,std::allocator<di_hybrid_subscriber_t::di_hybrid_subscriber_t(io_rings_desc_t *,diskimage_uio::details::diskimage_impl &)::$_0>,diskimage_uio::expected_ns::std::experimental::fundamentals_v3::expected<std::unique_ptr<DiskImage::Context>,std::error_code> ()(void)>::operator()(void *a1, uint64_t a2, uint64_t a3)
{
  int v4 = *((_DWORD *)__cxa_begin_catch(a1) + 2);
  uint64_t v5 = std::generic_category();
  *(_DWORD *)a3 = v4;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  __cxa_end_catch();
}

uint64_t diskimage_uio::details::extents_db_impl::begin()
{
  OUTLINED_FUNCTION_1();
  return (*(uint64_t (**)(void))(v0 + 24))();
}

void diskimage_uio::diskimage_open_params::create(void *a1)
{
  id v1 = __cxa_begin_catch(a1);
  OUTLINED_FUNCTION_0(v1);
}

void diskimage_uio::diskimage::create(void *a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a3 = *(_OWORD *)__cxa_begin_catch(a1);
  *(unsigned char *)(a3 + 16) = 0;
  __cxa_end_catch();
}

uint64_t diskimage_uio::details::diskimage_impl::create_context(uint64_t *a1)
{
  uint64_t result = *a1;
  *a1 = 0;
  if (result)
  {
    OUTLINED_FUNCTION_1();
    return (*(uint64_t (**)(void))(v3 + 40))();
  }
  return result;
}

void diskimage_uio::details::diskimage_open_params_impl::crypto_ctx_t::crypto_ctx_t(std::__shared_weak_count **a1, std::__shared_weak_count **a2)
{
  uint64_t v3 = *a1;
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  if (*a2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*a2);
  }
}

void diskimage_uio::details::diskimage_open_params_impl::diskimage_open_params_impl(std::__shared_weak_count **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  if (*(char *)(a2 + 23) < 0)
  {
    int v4 = *(void **)a2;
    operator delete(v4);
  }
}

void diskimage_uio::details::diskimage_impl::create_context_impl(void *a1, uint64_t a2, uint64_t a3)
{
  int v4 = *((_DWORD *)__cxa_begin_catch(a1) + 2);
  uint64_t v5 = std::generic_category();
  *(_DWORD *)a3 = v4;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  __cxa_end_catch();
}

uint64_t std::__function::__func<info::DiskImageInfoSparseBundle::count_mapped_bytes(DiskImageSparseBundle const&)::$_0,std::allocator<info::DiskImageInfoSparseBundle::count_mapped_bytes(DiskImageSparseBundle const&)::$_0>,void ()(std::string const&,unsigned long long)>::operator()(uint64_t *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = *a1;
  *a1 = 0;
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
  return result;
}

uint64_t std::__function::__func<info::DiskImageInfoSparseBundle::count_mapped_bytes(DiskImageSparseBundle const&)::$_0,std::allocator<info::DiskImageInfoSparseBundle::count_mapped_bytes(DiskImageSparseBundle const&)::$_0>,void ()(std::string const&,unsigned long long)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

uint64_t std::__function::__func<info::DiskImageInfoSparseBundle::count_mapped_bytes(DiskImageSparseBundle const&)::$_0,std::allocator<info::DiskImageInfoSparseBundle::count_mapped_bytes(DiskImageSparseBundle const&)::$_0>,void ()(std::string const&,unsigned long long)>::operator()(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x223C24910](a2 + 112);
}

void std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

uint64_t ContextAllocator<locks::Std,std::unique_ptr<DiskImageUDIFRead<UDIFReader<locks::None>,DiskImageUDIF>::ContextUDIF,std::default_delete<DiskImageUDIFRead<UDIFReader<locks::None>,DiskImageUDIF>::ContextUDIF>>,std::shared_ptr<BackendSG>>::allocate(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  *a2 = 0;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 40))(result);
  }
  return result;
}

uint64_t DiskImageASIF::set_size(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 40))();
}

void (***std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ref::details::ref_cnt_set_handle>,std::reverse_iterator<ref::details::ref_cnt_set_handle*>,std::reverse_iterator<ref::details::ref_cnt_set_handle*>,std::reverse_iterator<ref::details::ref_cnt_set_handle*>>())(void)
{
  OUTLINED_FUNCTION_0_0();
  do
  {
    uint64_t v3 = *v2;
    v2 += 4;
    (*v3)();
    v1 += 32;
    uint64_t result = v2;
  }
  while (v2 != v0);
  return result;
}

void (***boost::container::uninitialized_move_and_insert_alloc<boost::container::small_vector_allocator<ref::details::ref_cnt_handle,boost::container::new_allocator<void>,void>,ref::details::ref_cnt_handle*,ref::details::ref_cnt_handle*,boost::container::dtl::insert_emplace_proxy<boost::container::small_vector_allocator<ref::details::ref_cnt_handle,boost::container::new_allocator<void>,void>,ref::details::ref_cnt_handle*,ref::details::ref_cnt_handle>>())(void)
{
  OUTLINED_FUNCTION_0_0();
  do
  {
    uint64_t v3 = *v2;
    v2 += 3;
    (*v3)();
    v1 += 24;
    uint64_t result = v2;
  }
  while (v2 != v0);
  return result;
}

uint64_t DiskImage::const_extents_iterator_t::operator++(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 24))();
}

uint64_t DiskImageStackable::flush_caches()
{
  OUTLINED_FUNCTION_1();
  return (*(uint64_t (**)(void))(v0 + 40))();
}

uint64_t std::shared_ptr<boost::error_info<boost::algorithm::bad_char_,char>>::shared_ptr[abi:ne180100]<boost::error_info<boost::algorithm::bad_char_,char>,void>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 24))();
}

uint64_t sparse_bundles::mapped_blocks_t::mapped_blocks_t()
{
  OUTLINED_FUNCTION_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void AEA_backend::AEA_backend(uint64_t a1, std::__shared_weak_count **a2)
{
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 64);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  int v4 = *a2;
  if (*a2)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void boost::container::uninitialized_move_alloc<boost::container::small_vector_allocator<CompressedBackend::promise_io_t,boost::container::new_allocator<void>,void>,CompressedBackend::promise_io_t*,CompressedBackend::promise_io_t*>(std::__shared_weak_count **a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CFDataRef v8 = *a1;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  __cxa_begin_catch(a2);
  for (; a5 != a4; a5 += 104)
  {
    uint64_t v9 = *(void *)(a5 + 48);
    if (v9) {
      *(void *)(v9 + 32) = 0;
    }
    uint64_t v10 = *(std::__shared_weak_count **)(a5 + 8);
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
  }
}

void SparseBundleBackend::SparseBundleBackend(uint64_t a1)
{
  long long v2 = *(std::__shared_weak_count **)(a1 + 104);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 88);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

uint64_t SparseBundleBackend::SparseBundleBackend(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void readSynchronizer::readSynchronizer(uint64_t a1)
{
  long long v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

uint64_t sub_21E3968D8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_21E3968E8()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_21E3968F8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_21E396908()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_21E396918()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_21E396928()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_21E396938()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_21E396948()
{
  return MEMORY[0x270EEAD80]();
}

uint64_t sub_21E396958()
{
  return MEMORY[0x270EEADA8]();
}

uint64_t sub_21E396968()
{
  return MEMORY[0x270EEADE8]();
}

uint64_t sub_21E396978()
{
  return MEMORY[0x270EEADF0]();
}

uint64_t sub_21E396988()
{
  return MEMORY[0x270EEAE10]();
}

uint64_t sub_21E396998()
{
  return MEMORY[0x270EEAE18]();
}

uint64_t sub_21E3969A8()
{
  return MEMORY[0x270EEAE40]();
}

uint64_t sub_21E3969B8()
{
  return MEMORY[0x270EEAE58]();
}

uint64_t sub_21E3969C8()
{
  return MEMORY[0x270EEAE70]();
}

uint64_t sub_21E3969D8()
{
  return MEMORY[0x270EEAEA8]();
}

uint64_t sub_21E3969E8()
{
  return MEMORY[0x270EEAEE0]();
}

uint64_t sub_21E3969F8()
{
  return MEMORY[0x270EEAF00]();
}

uint64_t sub_21E396A08()
{
  return MEMORY[0x270EEAF08]();
}

uint64_t sub_21E396A18()
{
  return MEMORY[0x270EEAF28]();
}

uint64_t sub_21E396A28()
{
  return MEMORY[0x270EEAF38]();
}

uint64_t sub_21E396A38()
{
  return MEMORY[0x270EEAF58]();
}

uint64_t sub_21E396A48()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_21E396A58()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21E396A68()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21E396A78()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_21E396A88()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_21E396A98()
{
  return MEMORY[0x270EF1AB8]();
}

uint64_t sub_21E396AA8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_21E396AB8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21E396AC8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_21E396AD8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21E396AE8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21E396AF8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AAAsyncByteStreamProcess()
{
  return MEMORY[0x270F90C68]();
}

int AAByteStreamClose(AAByteStream s)
{
  return MEMORY[0x270F90C80](s);
}

ssize_t AAByteStreamPRead(AAByteStream s, void *buf, size_t nbyte, off_t offset)
{
  return MEMORY[0x270F90C88](s, buf, nbyte, offset);
}

ssize_t AAByteStreamRead(AAByteStream s, void *buf, size_t nbyte)
{
  return MEMORY[0x270F90C98](s, buf, nbyte);
}

off_t AAByteStreamSeek(AAByteStream s, off_t offset, int whence)
{
  return MEMORY[0x270F90CA0](s, offset, *(void *)&whence);
}

ssize_t AAByteStreamWrite(AAByteStream s, const void *buf, size_t nbyte)
{
  return MEMORY[0x270F90CB0](s, buf, nbyte);
}

AAByteStream AACustomByteStreamOpen(void)
{
  return (AAByteStream)MEMORY[0x270F90D08]();
}

void AACustomByteStreamSetCloseProc(AAByteStream s, AAByteStreamCloseProc proc)
{
}

void AACustomByteStreamSetData(AAByteStream s, void *data)
{
}

void AACustomByteStreamSetPReadProc(AAByteStream s, AAByteStreamPReadProc proc)
{
}

void AACustomByteStreamSetReadProc(AAByteStream s, AAByteStreamReadProc proc)
{
}

AAByteStream AAFileStreamOpenWithFD(int fd, int automatic_close)
{
  return (AAByteStream)MEMORY[0x270F90EA0](*(void *)&fd, *(void *)&automatic_close);
}

uint64_t AATempStreamOpen()
{
  return MEMORY[0x270F90FA8]();
}

AEAAuthData AEAAuthDataCreateWithContext(AEAContext context)
{
  return (AEAAuthData)MEMORY[0x270F90FB0](context);
}

void AEAAuthDataDestroy(AEAAuthData auth_data)
{
}

int AEAAuthDataGetEntry(AEAAuthData auth_data, uint32_t i, size_t key_capacity, char *key, size_t *key_length, size_t data_capacity, uint8_t *data, size_t *data_size)
{
  return MEMORY[0x270F90FC0](auth_data, *(void *)&i, key_capacity, key, key_length, data_capacity, data, data_size);
}

uint32_t AEAAuthDataGetEntryCount(AEAAuthData auth_data)
{
  return MEMORY[0x270F90FC8](auth_data);
}

AEAContext AEAContextCreateWithEncryptedStream(AAByteStream encrypted_stream)
{
  return (AEAContext)MEMORY[0x270F90FD8](encrypted_stream);
}

void AEAContextDestroy(AEAContext context)
{
}

int AEAContextGetFieldBlob(AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, size_t buf_capacity, uint8_t *buf, size_t *buf_size)
{
  return MEMORY[0x270F91010](context, *(void *)&field, *(void *)&representation, buf_capacity, buf, buf_size);
}

uint64_t AEAContextGetFieldUInt(AEAContext context, AEAContextField field)
{
  return MEMORY[0x270F91020](context, *(void *)&field);
}

int AEAContextSetFieldBlob(AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, const uint8_t *buf, size_t buf_size)
{
  return MEMORY[0x270F91028](context, *(void *)&field, *(void *)&representation, buf, buf_size);
}

AAByteStream AEADecryptionRandomAccessInputStreamOpen(AAByteStream encrypted_stream, AEAContext context, size_t alloc_limit, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x270F91048](encrypted_stream, context, alloc_limit, flags, *(void *)&n_threads);
}

int BZ2_bzBuffToBuffCompress(char *dest, unsigned int *destLen, char *source, unsigned int sourceLen, int blockSize100k, int verbosity, int workFactor)
{
  return MEMORY[0x270F98198](dest, destLen, source, *(void *)&sourceLen, *(void *)&blockSize100k, *(void *)&verbosity, *(void *)&workFactor);
}

int BZ2_bzBuffToBuffDecompress(char *dest, unsigned int *destLen, char *source, unsigned int sourceLen, int small, int verbosity)
{
  return MEMORY[0x270F981A0](dest, destLen, source, *(void *)&sourceLen, *(void *)&small, *(void *)&verbosity);
}

unsigned int CCCalibratePBKDF(CCPBKDFAlgorithm algorithm, size_t passwordLen, size_t saltLen, CCPseudoRandomAlgorithm prf, size_t derivedKeyLen, uint32_t msec)
{
  return MEMORY[0x270ED7890](*(void *)&algorithm, passwordLen, saltLen, *(void *)&prf, derivedKeyLen, *(void *)&msec);
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED78A0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x270ED78C8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x270ED7940](cryptorRef);
}

CCCryptorStatus CCCryptorReset(CCCryptorRef cryptorRef, const void *iv)
{
  return MEMORY[0x270ED7948](cryptorRef, iv);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED7950](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

int CCKeyDerivationPBKDF(CCPBKDFAlgorithm algorithm, const char *password, size_t passwordLen, const uint8_t *salt, size_t saltLen, CCPseudoRandomAlgorithm prf, unsigned int rounds, uint8_t *derivedKey, size_t derivedKeyLen)
{
  return MEMORY[0x270ED7A38](*(void *)&algorithm, password, passwordLen, salt, saltLen, *(void *)&prf, *(void *)&rounds, derivedKey);
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x270ED7A80](bytes, count);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x270EE5480](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x270EE54A8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return (CFStringRef)MEMORY[0x270EE54F0](userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

CFDictionaryRef DADiskCopyDescription(DADiskRef disk)
{
  return (CFDictionaryRef)MEMORY[0x270F26458](disk);
}

DADiskRef DADiskCreateFromBSDName(CFAllocatorRef allocator, DASessionRef session, const char *name)
{
  return (DADiskRef)MEMORY[0x270F26468](allocator, session, name);
}

DADiskRef DADiskCreateFromVolumePath(CFAllocatorRef allocator, DASessionRef session, CFURLRef path)
{
  return (DADiskRef)MEMORY[0x270F26470](allocator, session, path);
}

void DADiskEject(DADiskRef disk, DADiskEjectOptions options, DADiskEjectCallback callback, void *context)
{
}

void DADiskUnmount(DADiskRef disk, DADiskUnmountOptions options, DADiskUnmountCallback callback, void *context)
{
}

uint64_t DADissenterGetProcessID()
{
  return MEMORY[0x270F26488]();
}

DAReturn DADissenterGetStatus(DADissenterRef dissenter)
{
  return MEMORY[0x270F26490](dissenter);
}

void DARegisterDiskDisappearedCallback(DASessionRef session, CFDictionaryRef match, DADiskDisappearedCallback callback, void *context)
{
}

uint64_t DARegisterIdleCallback()
{
  return MEMORY[0x270F264A0]();
}

DASessionRef DASessionCreate(CFAllocatorRef allocator)
{
  return (DASessionRef)MEMORY[0x270F264A8](allocator);
}

void DASessionScheduleWithRunLoop(DASessionRef session, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

void DASessionUnscheduleFromRunLoop(DASessionRef session, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

void DAUnregisterCallback(DASessionRef session, void *callback, void *context)
{
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF3EE8](*(void *)&mainPort, *(void *)&options, bsdName);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x270EF4788](*(void *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF47D0](notify);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x270EF47F0](*(void *)&object);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return MEMORY[0x270EF4818](*(void *)&object, *(void *)&anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49E0](*(void *)&entry, plane, *(void *)&options, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x270EF4A18](*(void *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4A40](entryID);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return MEMORY[0x270EF4AF0](*(void *)&service, waitTime);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x270EFD758](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B0](key, error);
}

CFDataRef SecKeyCreateDecryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef ciphertext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9F8](key, algorithm, ciphertext, error);
}

CFDataRef SecKeyCreateEncryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFDA10](key, algorithm, plaintext, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x270F98248](this, __s);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return (const char *)MEMORY[0x270F98310](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x270F98338](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983C0](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

std::__sp_mut *__cdecl std::__get_sp_mut(const void *a1)
{
  return (std::__sp_mut *)MEMORY[0x270F98450](a1);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string::iterator std::string::insert(std::string *this, std::string::const_iterator __pos, std::string::value_type __c)
{
  return (std::string::iterator)MEMORY[0x270F984D8](this, __pos.__i_, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x270F98750]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98778]();
}

{
  return MEMORY[0x270F98788]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987B8]();
}

{
  return MEMORY[0x270F987C0]();
}

{
  return MEMORY[0x270F987D0]();
}

{
  return MEMORY[0x270F987E0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

void std::error_category::~error_category(std::error_category *this)
{
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return (std::__thread_struct *)MEMORY[0x270F98898](this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

uint64_t std::stringbuf::basic_stringbuf()
{
  return MEMORY[0x270F988D0]();
}

const std::error_category *std::generic_category(void)
{
  return (const std::error_category *)MEMORY[0x270F98918]();
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::notify_one(std::condition_variable *this)
{
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return (std::__thread_specific_ptr<std::__thread_struct> *)MEMORY[0x270F989F8]();
}

void std::__libcpp_atomic_wait(const void *a1, std::__cxx_contention_t a2)
{
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

void std::__cxx_atomic_notify_all(const void *a1)
{
}

std::__cxx_contention_t std::__libcpp_atomic_monitor(const void *a1)
{
  return MEMORY[0x270F98A28](a1);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x270F98B60](a1, __ec);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x270F98C28]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::thread::join(std::thread *this)
{
}

void std::thread::~thread(std::thread *this)
{
}

void std::__sp_mut::lock(std::__sp_mut *this)
{
}

void std::__sp_mut::unlock(std::__sp_mut *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::move(std::ios_base *this, std::ios_base *a2)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x270F98E58](this);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_cast(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x270F98EE8](lpmangled, lpout, lpoutlen, lpstatus);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x270ED7ED8]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x270ED8480](a1, *(void *)&a2);
}

char *__cdecl basename_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270ED8748](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F48](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x270F98F50](*(void *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F58](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x270F98F60](*(void *)&algorithm);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x270ED8F50](*(void *)&a1, a2, a3);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C690](crc, buf, *(void *)&len);
}

void curl_easy_cleanup(CURL *curl)
{
}

CURLcode curl_easy_getinfo(CURL *curl, CURLINFO info, ...)
{
  return MEMORY[0x270FA5348](curl, *(void *)&info);
}

CURL *curl_easy_init(void)
{
  return (CURL *)MEMORY[0x270FA5350]();
}

CURLcode curl_easy_perform(CURL *curl)
{
  return MEMORY[0x270FA5358](curl);
}

CURLcode curl_easy_setopt(CURL *curl, CURLoption option, ...)
{
  return MEMORY[0x270FA5360](curl, *(void *)&option);
}

const char *__cdecl curl_easy_strerror(CURLcode a1)
{
  return (const char *)MEMORY[0x270FA5368](*(void *)&a1);
}

CURLcode curl_global_init(uint64_t flags)
{
  return MEMORY[0x270FA5370](flags);
}

curl_slist *__cdecl curl_slist_append(curl_slist *list, const char *data)
{
  return (curl_slist *)MEMORY[0x270FA5378](list, data);
}

void curl_slist_free_all(curl_slist *list)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x270ED9678](*(void *)&a1);
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x270ED9888](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4);
}

int fchmodat(int a1, const char *a2, mode_t a3, int a4)
{
  return MEMORY[0x270ED98A8](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fchownat(int a1, const char *a2, uid_t a3, gid_t a4, int a5)
{
  return MEMORY[0x270ED98B8](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x270ED98F0](*(void *)&a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x270ED9918](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

int flock(int a1, int a2)
{
  return MEMORY[0x270ED9998](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x270ED9AF8](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x270ED9B00](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x270ED9B10](*(void *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x270ED9B80](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

group *__cdecl getgrgid(gid_t a1)
{
  return (group *)MEMORY[0x270ED9C18](*(void *)&a1);
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return MEMORY[0x270ED9CA0](a1, *(void *)&a2);
}

int getpagesize(void)
{
  return MEMORY[0x270ED9CC8]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x270ED9EF0](*(void *)&a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA320](a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A8](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x270EDA4B8](__s, __smax, *(void *)&__c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x270EDA520](*(void *)&a1, a2, a3);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x270EDAB10]();
}

int pclose(FILE *a1)
{
  return MEMORY[0x270EDAC08](a1);
}

void perror(const char *a1)
{
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return (FILE *)MEMORY[0x270EDAC48](a1, a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t preadv(int a1, const iovec *a2, int a3, off_t a4)
{
  return MEMORY[0x270EDAD18](*(void *)&a1, a2, *(void *)&a3, a4);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDB0A0](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t pwritev(int a1, const iovec *a2, int a3, off_t a4)
{
  return MEMORY[0x270EDB0A8](*(void *)&a1, a2, *(void *)&a3, a4);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

int raise(int a1)
{
  return MEMORY[0x270EDB0D0](*(void *)&a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

char *__cdecl readpassphrase(const char *a1, char *a2, size_t a3, int a4)
{
  return (char *)MEMORY[0x270EDB148](a1, a2, a3, *(void *)&a4);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB150](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB158](__ptr, __size);
}

int sched_yield(void)
{
  return MEMORY[0x270EDB320]();
}

int seteuid(uid_t a1)
{
  return MEMORY[0x270EDB3E0](*(void *)&a1);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDB620](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x270EDB6A8](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6E8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB718](__str, __endptr, *(void *)&__base);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x270EDB988](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

void uuid_generate_random(uuid_t out)
{
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}