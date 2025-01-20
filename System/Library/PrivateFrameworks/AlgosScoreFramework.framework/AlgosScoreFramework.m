void sub_21560DDE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21560E048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32)
{
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void **std::vector<AlgosScoreStreamFrameRow>::push_back[abi:ne180100](uint64_t *a1, AlgosScoreStreamFrameRow *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - *a1) >> 6;
    if ((unint64_t)(v10 + 1) >> 58) {
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - *a1;
    uint64_t v12 = v11 >> 5;
    if (v11 >> 5 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v19 = v4;
    if (v13) {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AlgosScoreConnectionFrameRow>>(v4, v13);
    }
    else {
      v14 = 0;
    }
    v15 = v14;
    v16 = (AlgosScoreStreamFrameRow *)&v14[64 * v10];
    v18 = &v14[64 * v13];
    AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow(v16, a2);
    v17 = (char *)v16 + 64;
    std::vector<AlgosScoreStreamFrameRow>::__swap_out_circular_buffer(a1, &v15);
    uint64_t v9 = a1[1];
    result = std::__split_buffer<AlgosScoreStreamFrameRow>::~__split_buffer(&v15);
  }
  else
  {
    result = (void **)AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow(*(AlgosScoreStreamFrameRow **)(v4 - 8), a2);
    uint64_t v9 = v7 + 64;
    a1[1] = v7 + 64;
  }
  a1[1] = v9;
  return result;
}

void sub_21560E218(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<AlgosScoreStreamFrameRow>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<AlgosScoreStreamFrameRow>,std::reverse_iterator<AlgosScoreStreamFrameRow*>,std::reverse_iterator<AlgosScoreStreamFrameRow*>,std::reverse_iterator<AlgosScoreStreamFrameRow*>>((uint64_t)(a1 + 2), a1[1], (const AlgosScoreStreamFrameRow *)a1[1], *a1, (const AlgosScoreStreamFrameRow *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<AlgosScoreStreamFrameRow>,std::reverse_iterator<AlgosScoreStreamFrameRow*>,std::reverse_iterator<AlgosScoreStreamFrameRow*>,std::reverse_iterator<AlgosScoreStreamFrameRow*>>(uint64_t a1, uint64_t a2, const AlgosScoreStreamFrameRow *a3, uint64_t a4, const AlgosScoreStreamFrameRow *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  char v13 = 0;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v9 = a3;
    do
    {
      uint64_t v9 = (const AlgosScoreStreamFrameRow *)((char *)v9 - 64);
      AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow((AlgosScoreStreamFrameRow *)(v7 - 64), v9);
      uint64_t v7 = *((void *)&v15 + 1) - 64;
      *((void *)&v15 + 1) -= 64;
    }
    while (v9 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamFrameRow>,std::reverse_iterator<AlgosScoreStreamFrameRow*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

void sub_21560E358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamFrameRow>,std::reverse_iterator<AlgosScoreStreamFrameRow*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamFrameRow>,std::reverse_iterator<AlgosScoreStreamFrameRow*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<AlgosScoreConnectionFrameRow>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(a2 << 6);
}

void **std::__split_buffer<AlgosScoreStreamFrameRow>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<AlgosScoreStreamFrameRow>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 64;
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(i - 24, *(void **)(i - 16));
  }
}

uint64_t AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow(uint64_t a1, int a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 40) = a1 + 48;
  *(void *)(a1 + 56) = 0;
  *(_DWORD *)a1 = a2;
  *(double *)(a1 + 8) = a4;
  *(double *)(a1 + 16) = a5;
  *(double *)(a1 + 24) = a6;
  *(double *)(a1 + 32) = a7;
  if (a1 + 40 != a3) {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,std::string>,std::__tree_node<std::__value_type<std::string,std::string>,void *> *,long>>((uint64_t **)(a1 + 40), *(long long **)a3, (long long *)(a3 + 8));
  }
  return a1;
}

void sub_21560E4BC(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v1, *v2);
  _Unwind_Resume(a1);
}

void AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow(AlgosScoreStreamFrameRow *this, const AlgosScoreStreamFrameRow *a2)
{
  *((void *)this + 6) = 0;
  *((void *)this + 5) = (char *)this + 48;
  *((void *)this + 7) = 0;
  AlgosScoreStreamFrameRow::operator=((uint64_t)this, (uint64_t)a2);
}

void sub_21560E508(_Unwind_Exception *a1)
{
  v3 = v2;
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v1, *v3);
  _Unwind_Resume(a1);
}

uint64_t AlgosScoreStreamFrameRow::operator=(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  if (a1 != a2) {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,std::string>,std::__tree_node<std::__value_type<std::string,std::string>,void *> *,long>>((uint64_t **)(a1 + 40), *(long long **)(a2 + 40), (long long *)(a2 + 48));
  }
  return a1;
}

uint64_t **std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,std::string>,std::__tree_node<std::__value_type<std::string,std::string>,void *> *,long>>(uint64_t **result, long long *a2, long long *a3)
{
  uint64_t v5 = result;
  if (result[2])
  {
    uint64_t v6 = *result;
    uint64_t v7 = result[1];
    *uint64_t result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      uint64_t v8 = (uint64_t *)v6[1];
    }
    else {
      uint64_t v8 = v6;
    }
    long long v15 = result;
    v16 = v8;
    v17 = (const void **)v8;
    if (v8)
    {
      v16 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      if (a2 != a3)
      {
        uint64_t v9 = a2;
        do
        {
          std::string::operator=((std::string *)(v8 + 4), (const std::string *)(v9 + 2));
          std::string::operator=((std::string *)(v8 + 7), (const std::string *)((char *)v9 + 56));
          leaf_high = (uint64_t **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_leaf_high((uint64_t)v5, &v18, v17 + 4);
          std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__insert_node_at(v5, v18, leaf_high, (uint64_t *)v17);
          v17 = (const void **)v16;
          if (v16) {
            v16 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::_DetachedTreeCache::__detach_next((uint64_t)v16);
          }
          uint64_t v11 = (long long *)*((void *)v9 + 1);
          if (v11)
          {
            do
            {
              a2 = v11;
              uint64_t v11 = *(long long **)v11;
            }
            while (v11);
          }
          else
          {
            do
            {
              a2 = (long long *)*((void *)v9 + 2);
              BOOL v12 = *(void *)a2 == (void)v9;
              uint64_t v9 = a2;
            }
            while (!v12);
          }
          uint64_t v8 = (uint64_t *)v17;
          if (v17) {
            BOOL v12 = a2 == a3;
          }
          else {
            BOOL v12 = 1;
          }
          uint64_t v9 = a2;
        }
        while (!v12);
      }
    }
    uint64_t result = (uint64_t **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v15);
  }
  if (a2 != a3)
  {
    do
    {
      uint64_t result = (uint64_t **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_multi<std::pair<std::string const,std::string> const&>(v5, a2 + 2);
      char v13 = (long long *)*((void *)a2 + 1);
      if (v13)
      {
        do
        {
          long long v14 = v13;
          char v13 = *(long long **)v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          long long v14 = (long long *)*((void *)a2 + 2);
          BOOL v12 = *(void *)v14 == (void)a2;
          a2 = v14;
        }
        while (!v12);
      }
      a2 = v14;
    }
    while (v14 != a3);
  }
  return result;
}

void sub_21560E6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void std::vector<AlgosScoreStreamFrameRow>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = v4 - 64;
        std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)(v4 - 24), *((void **)v4 - 2));
        uint64_t v4 = v6;
      }
      while (v6 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_21560E8BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21560E9AC(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_21560F2E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *__p,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41)
{
  if (__p) {
    operator delete(__p);
  }
  if (a37) {
    operator delete(a37);
  }
  if (a40) {
    operator delete(a40);
  }

  _Unwind_Resume(a1);
}

uint64_t std::vector<AlgosScoreConnectionFrameRow>::__push_back_slow_path<AlgosScoreConnectionFrameRow>(uint64_t a1, const AlgosScoreConnectionFrameRow *a2)
{
  v3 = *(const AlgosScoreConnectionFrameRow **)a1;
  uint64_t v4 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 6;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 58) {
    std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = a1 + 16;
  uint64_t v8 = *(void *)(a1 + 16) - (void)v3;
  if (v8 >> 5 > v5) {
    unint64_t v5 = v8 >> 5;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFC0) {
    unint64_t v9 = 0x3FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v17 = a1 + 16;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AlgosScoreConnectionFrameRow>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  __p = v10;
  long long v14 = (AlgosScoreConnectionFrameRow *)&v10[64 * v4];
  v16 = &v10[64 * v9];
  AlgosScoreConnectionFrameRow::AlgosScoreConnectionFrameRow(v14, a2);
  long long v15 = (AlgosScoreConnectionFrameRow *)((char *)v14 + 64);
  std::vector<AlgosScoreConnectionFrameRow>::__swap_out_circular_buffer((const AlgosScoreConnectionFrameRow **)a1, &__p);
  uint64_t v11 = *(void *)(a1 + 8);
  if (v15 != v14) {
    long long v15 = (AlgosScoreConnectionFrameRow *)((char *)v15 + ((v14 - v15 + 63) & 0xFFFFFFFFFFFFFFC0));
  }
  if (__p) {
    operator delete(__p);
  }
  return v11;
}

void sub_21560F4B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<AlgosScoreConnectionFrameRow>::__swap_out_circular_buffer(const AlgosScoreConnectionFrameRow **a1, void *a2)
{
  unint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v6 = (const AlgosScoreConnectionFrameRow *)a2[1];
  while (v4 != v5)
  {
    uint64_t v4 = (const AlgosScoreConnectionFrameRow *)((char *)v4 - 64);
    AlgosScoreConnectionFrameRow::AlgosScoreConnectionFrameRow((const AlgosScoreConnectionFrameRow *)((char *)v6 - 64), v4);
  }
  a2[1] = v6;
  uint64_t v7 = *a1;
  *a1 = v6;
  a2[1] = v7;
  uint64_t v8 = a1[1];
  a1[1] = (const AlgosScoreConnectionFrameRow *)a2[2];
  a2[2] = v8;
  unint64_t v9 = a1[2];
  a1[2] = (const AlgosScoreConnectionFrameRow *)a2[3];
  a2[3] = v9;
  *a2 = a2[1];
}

void std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264253228, MEMORY[0x263F8C060]);
}

void sub_21560F5D4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

uint64_t AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(uint64_t a1, const std::string *a2, char a3, int a4, double a5, double a6, double a7, double a8, double a9)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  std::string::operator=((std::string *)a1, a2);
  *(double *)(a1 + 24) = a5;
  *(double *)(a1 + 32) = a6;
  *(double *)(a1 + 40) = a7;
  *(double *)(a1 + 48) = a8;
  *(double *)(a1 + 56) = a9;
  *(unsigned char *)(a1 + 64) = a3;
  *(_DWORD *)(a1 + 68) = a4;
  return a1;
}

void sub_21560F708(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  std::string::operator=((std::string *)a1, (const std::string *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a2 + 68);
  return a1;
}

void sub_21560F784(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AlgosScoreStreamCSVFrameRow::operator=(uint64_t a1, uint64_t a2)
{
  std::string::operator=((std::string *)a1, (const std::string *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a2 + 68);
  return a1;
}

void *AlgosScoreStreamCSVFrameRow::GetDescription@<X0>(AlgosScoreStreamCSVFrameRow *this@<X0>, void *a2@<X8>)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = (const char *)this;
  if (*((char *)this + 23) < 0) {
    v3 = *(const char **)this;
  }
  uint64_t v4 = "Yes";
  if (!*((unsigned char *)this + 64)) {
    uint64_t v4 = "No ";
  }
  snprintf(__str, 0x100uLL, "%s: %1.2f: duration: %1.2f, deltaT: %1.2f, weight: %1.2f, quality: %1.2f, wifi: %s, failed: %d", v3, *((double *)this + 5), *((double *)this + 4), *((double *)this + 3), *((double *)this + 6), *((double *)this + 7), v4, *((_DWORD *)this + 17));
  return std::string::basic_string[abi:ne180100]<0>(a2, __str);
}

void *AlgosScoreStreamCSVFrameRow::GetHeaderDescription@<X0>(void *a1@<X8>)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x100uLL, "     %-10s %-10s %-10s %-10s %-7s %-7s %-10s %-10s", "deltaT", "event", "duration", "quality", "wifi", "failed", "rel_time", "weight");
  return std::string::basic_string[abi:ne180100]<0>(a1, __str);
}

void *AlgosScoreStreamCSVFrameRow::GetRawDescription@<X0>(AlgosScoreStreamCSVFrameRow *this@<X0>, void *a2@<X8>)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = (const char *)this;
  if (*((char *)this + 23) < 0) {
    v3 = *(const char **)this;
  }
  uint64_t v4 = "True";
  if (*((unsigned char *)this + 64)) {
    uint64_t v5 = "True";
  }
  else {
    uint64_t v5 = "False";
  }
  if (!*((_DWORD *)this + 17)) {
    uint64_t v4 = "False";
  }
  snprintf(__str, 0x100uLL, "%-10.3f %-10s %-10.3f %-10.3f %-7s %-7s %-10.3f %-10.3f", *((double *)this + 3), v3, *((double *)this + 4), *((double *)this + 7), v5, v4, *((double *)this + 5), *((double *)this + 6));
  return std::string::basic_string[abi:ne180100]<0>(a2, __str);
}

void AlgosScoreStreamCSVFrame::DebugPrint(AlgosScoreStreamCSVFrame *this, int a2)
{
  AlgosScoreStreamCSVFrameRow::GetHeaderDescription(__p);
  if (v13 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  puts((const char *)v4);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v5 = *(void *)this;
  uint64_t v6 = *((void *)this + 1);
  if (*(void *)this != v6)
  {
    int v7 = 0;
    do
    {
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((uint64_t)__p, v5);
      if (a2 >= 1)
      {
        AlgosScoreStreamCSVFrameRow::GetRawDescription((AlgosScoreStreamCSVFrameRow *)__p, v10);
        if (v11 >= 0) {
          uint64_t v8 = v10;
        }
        else {
          uint64_t v8 = (void **)v10[0];
        }
        printf("%3d: %s\n", v7, (const char *)v8);
        if (v11 < 0) {
          operator delete(v10[0]);
        }
        ++v7;
      }
      if (v13 < 0) {
        operator delete(__p[0]);
      }
      BOOL v9 = __OFSUB__(a2--, 1);
      if (a2 < 0 != v9) {
        break;
      }
      v5 += 72;
    }
    while (v5 != v6);
  }
}

void sub_21560FB48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void sub_21560FCDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_21560FE88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21)
{
  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow(&a21);
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }

  _Unwind_Resume(a1);
}

void **std::vector<AlgosScoreCombinerFrameRow>::push_back[abi:ne180100](uint64_t *a1, AlgosScoreCombinerFrameRow *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - *a1) >> 6;
    if ((unint64_t)(v10 + 1) >> 58) {
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - *a1;
    uint64_t v12 = v11 >> 5;
    if (v11 >> 5 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v19 = v4;
    if (v13) {
      long long v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AlgosScoreConnectionFrameRow>>(v4, v13);
    }
    else {
      long long v14 = 0;
    }
    long long v15 = v14;
    v16 = (AlgosScoreCombinerFrameRow *)&v14[64 * v10];
    uint64_t v18 = &v14[64 * v13];
    AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow(v16, a2);
    uint64_t v17 = (char *)v16 + 64;
    std::vector<AlgosScoreCombinerFrameRow>::__swap_out_circular_buffer(a1, &v15);
    uint64_t v9 = a1[1];
    uint64_t result = std::__split_buffer<AlgosScoreCombinerFrameRow>::~__split_buffer(&v15);
  }
  else
  {
    uint64_t result = (void **)AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow(*(AlgosScoreCombinerFrameRow **)(v4 - 8), a2);
    uint64_t v9 = v7 + 64;
    a1[1] = v7 + 64;
  }
  a1[1] = v9;
  return result;
}

void sub_21560FFD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

void AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow(void **this)
{
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

void sub_2156101A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow((void **)va);
  _Unwind_Resume(a1);
}

void sub_2156106F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, char a11)
{
  a10 = (void **)&a11;
  std::vector<AlgosScoreCombinerFrameRow>::__destroy_vector::operator()[abi:ne180100](&a10);

  _Unwind_Resume(a1);
}

double amean(const AlgosScoreCombinerFrameRow **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1 == v2) {
    return 0.0;
  }
  double v3 = (double)(unint64_t)((v2 - v1) >> 6);
  double v4 = 0.0;
  do
  {
    AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v7, v1);
    double v5 = v11;
    if (v10 < 0) {
      operator delete(__p);
    }
    if (v8 < 0) {
      operator delete(v7);
    }
    double v4 = v4 + v5 / v3;
    uint64_t v1 = (const AlgosScoreCombinerFrameRow *)((char *)v1 + 64);
  }
  while (v1 != v2);
  return v4;
}

double stddev(const AlgosScoreCombinerFrameRow **a1)
{
  if ((unint64_t)(a1[1] - *a1) > 0x7F)
  {
    double v3 = amean(a1);
    double v4 = *a1;
    double v5 = a1[1];
    if (*a1 == v5)
    {
      double v7 = 0.0;
      uint64_t v9 = *a1;
    }
    else
    {
      double v6 = v3;
      double v7 = 0.0;
      do
      {
        AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v10, v4);
        double v8 = v14;
        if (v13 < 0) {
          operator delete(__p);
        }
        if (v11 < 0) {
          operator delete(v10);
        }
        double v7 = v7 + (v8 - v6) * (v8 - v6);
        double v4 = (const AlgosScoreCombinerFrameRow *)((char *)v4 + 64);
      }
      while (v4 != v5);
      double v4 = *a1;
      uint64_t v9 = a1[1];
    }
    return sqrt(v7 / (double)(unint64_t)(((v9 - v4) >> 6) - 1));
  }
  else
  {
    return nan("stddev");
  }
}

BOOL compareScores(AlgosScoreCombinerFrameRow *a1, AlgosScoreCombinerFrameRow *a2)
{
  return *((double *)a1 + 7) < *((double *)a2 + 7);
}

AlgosScoreCombinerFrameRow *std::vector<AlgosScoreCombinerFrameRow>::__init_with_size[abi:ne180100]<AlgosScoreCombinerFrameRow*,AlgosScoreCombinerFrameRow*>(AlgosScoreCombinerFrameRow *result, AlgosScoreCombinerFrameRow *a2, AlgosScoreCombinerFrameRow *a3, unint64_t a4)
{
  if (a4)
  {
    double v6 = result;
    std::vector<AlgosScoreCombinerFrameRow>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<AlgosScoreCombinerFrameRow>,AlgosScoreCombinerFrameRow*,AlgosScoreCombinerFrameRow*,AlgosScoreCombinerFrameRow*>((uint64_t)v6 + 16, a2, a3, *((AlgosScoreCombinerFrameRow **)v6 + 1));
    *((void *)v6 + 1) = result;
  }
  return result;
}

void sub_2156109A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<AlgosScoreCombinerFrameRow>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<AlgosScoreCombinerFrameRow>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 58) {
    std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AlgosScoreConnectionFrameRow>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[64 * v4];
  return result;
}

AlgosScoreCombinerFrameRow *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<AlgosScoreCombinerFrameRow>,AlgosScoreCombinerFrameRow*,AlgosScoreCombinerFrameRow*,AlgosScoreCombinerFrameRow*>(uint64_t a1, AlgosScoreCombinerFrameRow *a2, AlgosScoreCombinerFrameRow *a3, AlgosScoreCombinerFrameRow *this)
{
  uint64_t v4 = this;
  uint64_t v10 = this;
  char v11 = this;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    double v6 = a2;
    do
    {
      AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow(v4, v6);
      double v6 = (const AlgosScoreCombinerFrameRow *)((char *)v6 + 64);
      uint64_t v4 = (AlgosScoreCombinerFrameRow *)((char *)v11 + 64);
      char v11 = (AlgosScoreCombinerFrameRow *)((char *)v11 + 64);
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,AlgosScoreCombinerFrameRow*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_215610A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,AlgosScoreCombinerFrameRow*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,AlgosScoreCombinerFrameRow*>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,AlgosScoreCombinerFrameRow*>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = (uint64_t *)a1[1];
  uint64_t v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v4 = *v2;
  if (*v1 != *v2)
  {
    uint64_t v5 = *a1;
    do
    {
      v3 -= 64;
      std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100](v5, v3);
    }
    while (v3 != v4);
  }
}

void std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 47) < 0) {
    operator delete(*(void **)(a2 + 24));
  }
  if (*(char *)(a2 + 23) < 0)
  {
    uint64_t v3 = *(void **)a2;
    operator delete(v3);
  }
}

void std::vector<AlgosScoreCombinerFrameRow>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 64;
        std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*,false>(AlgosScoreCombinerFrameRow *a1, std::string *a2, uint64_t (**a3)(std::string *, const AlgosScoreCombinerFrameRow *), uint64_t a4, char a5)
{
  char v9 = (const AlgosScoreCombinerFrameRow *)a2;
  uint64_t v10 = a1;
  v25 = a2;
  v26 = a1;
LABEL_2:
  for (uint64_t i = 1 - a4; ; ++i)
  {
    uint64_t v12 = v9 - v10;
    unint64_t v13 = (v9 - v10) >> 6;
    if (!(!v6 & v5))
    {
      switch(v13)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          v23 = *a3;
          v25 = (std::string *)((char *)v9 - 64);
          if (((unsigned int (*)(void))v23)()) {
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v26, &v25);
          }
          break;
        case 3uLL:
          v25 = (std::string *)((char *)v9 - 64);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(v10, (std::string *)((char *)v10 + 64), (std::string *)((char *)v9 - 64), a3);
          break;
        case 4uLL:
          v25 = (std::string *)((char *)v9 - 64);
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(v10, (std::string *)((char *)v10 + 64), (std::string *)((char *)v10 + 128), (std::string *)((char *)v9 - 64), a3);
          break;
        case 5uLL:
          v25 = (std::string *)((char *)v9 - 64);
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(v10, (std::string *)((char *)v10 + 64), (std::string *)((char *)v10 + 128), (std::string *)v10 + 8, (std::string *)((char *)v9 - 64), a3);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v12 <= 1535)
    {
      if (a5) {
        std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(v10, v9, (uint64_t (**)(std::string *, uint64_t))a3);
      }
      else {
        std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((uint64_t)v10, v9, a3);
      }
      return;
    }
    if (i == 1) {
      break;
    }
    unint64_t v14 = v13 >> 1;
    long long v15 = (std::string *)((char *)v9 - 64);
    if ((unint64_t)v12 > 0x2000)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(v10, (std::string *)((char *)v10 + 64 * (v13 >> 1)), v15, a3);
      v16 = v25;
      uint64_t v17 = (v14 << 6) - 64;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((AlgosScoreCombinerFrameRow *)((char *)v26 + 64), (std::string *)((char *)v26 + v17), (std::string *)((char *)v25 - 128), a3);
      uint64_t v18 = (v14 << 6) + 64;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((AlgosScoreCombinerFrameRow *)((char *)v26 + 128), (std::string *)((char *)v26 + v18), v16 - 8, a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((AlgosScoreCombinerFrameRow *)((char *)v26 + v17), (std::string *)((char *)v26 + 64 * v14), (std::string *)((char *)v26 + v18), a3);
      v24 = (std::string *)((char *)v26 + 64 * v14);
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *>(&v26, &v24);
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((const AlgosScoreCombinerFrameRow *)((char *)v10 + 64 * (v13 >> 1)), (std::string *)v10, v15, a3);
      if (a5)
      {
LABEL_13:
        char v9 = (const AlgosScoreCombinerFrameRow *)v25;
        goto LABEL_14;
      }
    }
    char v19 = ((uint64_t (*)(char *))*a3)((char *)v26 - 64);
    char v9 = (const AlgosScoreCombinerFrameRow *)v25;
    if ((v19 & 1) == 0)
    {
      uint64_t v10 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,AlgosScoreCombinerFrameRow *,BOOL (*&)(AlgosScoreCombinerFrameRow&,AlgosScoreCombinerFrameRow&)>(v26, v25, (unsigned int (**)(std::string *))a3);
LABEL_22:
      a5 = 0;
      v26 = v10;
      a4 = -i;
      goto LABEL_2;
    }
LABEL_14:
    v20 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,AlgosScoreCombinerFrameRow *,BOOL (*&)(AlgosScoreCombinerFrameRow&,AlgosScoreCombinerFrameRow&)>(v26, (std::string *)v9, (uint64_t (**)(void))a3);
    if ((v21 & 1) == 0) {
      goto LABEL_21;
    }
    BOOL v22 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((uint64_t)v26, v20, a3);
    uint64_t v10 = (const AlgosScoreCombinerFrameRow *)&v20[2].__r_.__value_.__r.__words[2];
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((uint64_t)&v20[2].__r_.__value_.__r.__words[2], (std::string *)v9, a3))
    {
      if (v22) {
        return;
      }
      v25 = v20;
      uint64_t v10 = v26;
      char v9 = (const AlgosScoreCombinerFrameRow *)v20;
    }
    else
    {
      if (!v22)
      {
LABEL_21:
        std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*,false>(v26, v20, a3, -i, a5 & 1);
        uint64_t v10 = (const AlgosScoreCombinerFrameRow *)&v20[2].__r_.__value_.__r.__words[2];
        goto LABEL_22;
      }
      v26 = (AlgosScoreCombinerFrameRow *)&v20[2].__r_.__value_.__r.__words[2];
    }
  }
  if (v10 != v9) {
    std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*,AlgosScoreCombinerFrameRow*>(v10, v9, v9, (uint64_t (**)(const std::string *, const AlgosScoreCombinerFrameRow *))a3);
  }
}

void std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(const AlgosScoreCombinerFrameRow **a1, std::string **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v4, *a1);
  AlgosScoreCombinerFrameRow::operator=((std::string *)v2, v3);
  AlgosScoreCombinerFrameRow::operator=(v3, &v4);
  if (v6 < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
}

void sub_215610F78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(const AlgosScoreCombinerFrameRow *a1, const AlgosScoreCombinerFrameRow *a2, uint64_t (**a3)(std::string *, uint64_t))
{
  if (a1 != a2)
  {
    char v5 = (const AlgosScoreCombinerFrameRow *)((char *)a1 + 64);
    if ((const AlgosScoreCombinerFrameRow *)((char *)a1 + 64) != a2)
    {
      uint64_t v7 = 0;
      double v8 = a1;
      do
      {
        char v9 = v8;
        double v8 = v5;
        if ((*a3)((std::string *)v5, (uint64_t)v9))
        {
          AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v13, v8);
          uint64_t v10 = v7;
          while (1)
          {
            AlgosScoreCombinerFrameRow::operator=((std::string *)((char *)a1 + v10 + 64), (const std::string *)((char *)a1 + v10));
            if (!v10) {
              break;
            }
            char v11 = (*a3)(&v13, (uint64_t)a1 + v10 - 64);
            v10 -= 64;
            if ((v11 & 1) == 0)
            {
              uint64_t v12 = (std::string *)((char *)a1 + v10 + 64);
              goto LABEL_10;
            }
          }
          uint64_t v12 = (std::string *)a1;
LABEL_10:
          AlgosScoreCombinerFrameRow::operator=(v12, &v13);
          if (v15 < 0) {
            operator delete(__p);
          }
          if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v13.__r_.__value_.__l.__data_);
          }
        }
        char v5 = (const AlgosScoreCombinerFrameRow *)((char *)v8 + 64);
        v7 += 64;
      }
      while ((const AlgosScoreCombinerFrameRow *)((char *)v8 + 64) != a2);
    }
  }
}

void sub_215611094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(uint64_t a1, const AlgosScoreCombinerFrameRow *a2, uint64_t (**a3)(std::string *, const AlgosScoreCombinerFrameRow *))
{
  if ((const AlgosScoreCombinerFrameRow *)a1 != a2)
  {
    std::string v4 = (const AlgosScoreCombinerFrameRow *)a1;
    char v5 = (const AlgosScoreCombinerFrameRow *)(a1 + 64);
    if ((const AlgosScoreCombinerFrameRow *)(a1 + 64) != a2)
    {
      do
      {
        uint64_t v7 = v5;
        if ((*a3)((std::string *)v5, v4))
        {
          AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v8, v7);
          do
          {
            AlgosScoreCombinerFrameRow::operator=((std::string *)((char *)v4 + 64), (const std::string *)v4);
            std::string v4 = (const AlgosScoreCombinerFrameRow *)((char *)v4 - 64);
          }
          while (((*a3)(&v8, v4) & 1) != 0);
          AlgosScoreCombinerFrameRow::operator=((std::string *)((char *)v4 + 64), &v8);
          if (v10 < 0) {
            operator delete(__p);
          }
          if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v8.__r_.__value_.__l.__data_);
          }
        }
        char v5 = (const AlgosScoreCombinerFrameRow *)((char *)v7 + 64);
        std::string v4 = v7;
      }
      while ((const AlgosScoreCombinerFrameRow *)((char *)v7 + 64) != a2);
    }
  }
}

void sub_21561117C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(const AlgosScoreCombinerFrameRow *a1, std::string *a2, std::string *a3, uint64_t (**a4)(std::string *, const AlgosScoreCombinerFrameRow *))
{
  uint64_t v12 = a2;
  std::string v13 = a1;
  char v11 = a3;
  char v7 = (*a4)(a2, a1);
  uint64_t result = (*a4)(a3, (const AlgosScoreCombinerFrameRow *)a2);
  if ((v7 & 1) == 0)
  {
    if (!result) {
      return result;
    }
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>((const AlgosScoreCombinerFrameRow **)&v12, &v11);
    if (!(*a4)(v12, v13)) {
      return 1;
    }
    char v9 = &v13;
    char v10 = &v12;
    goto LABEL_9;
  }
  if (!result)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v13, &v12);
    if (!(*a4)(v11, (const AlgosScoreCombinerFrameRow *)v12)) {
      return 1;
    }
    char v9 = (const AlgosScoreCombinerFrameRow **)&v12;
    char v10 = &v11;
LABEL_9:
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(v9, v10);
    return 2;
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v13, &v11);
  return 1;
}

void std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *>(const AlgosScoreCombinerFrameRow **a1, std::string **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v4, *a1);
  AlgosScoreCombinerFrameRow::operator=((std::string *)v2, v3);
  AlgosScoreCombinerFrameRow::operator=(v3, &v4);
  if (v6 < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
}

void sub_2156112E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>((uint64_t)&a9);
  _Unwind_Resume(a1);
}

const AlgosScoreCombinerFrameRow *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,AlgosScoreCombinerFrameRow *,BOOL (*&)(AlgosScoreCombinerFrameRow&,AlgosScoreCombinerFrameRow&)>(AlgosScoreCombinerFrameRow *a1, std::string *a2, unsigned int (**a3)(std::string *))
{
  char v15 = a2;
  v16 = a1;
  AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v12, a1);
  if (((uint64_t (*)(std::string *, std::string::size_type *))*a3)(&v12, &a2[-3].__r_.__value_.__l.__size_))
  {
    char v6 = a1;
    do
    {
      char v6 = (const AlgosScoreCombinerFrameRow *)((char *)v6 + 64);
      v16 = v6;
    }
    while ((((uint64_t (*)(std::string *, const AlgosScoreCombinerFrameRow *))*a3)(&v12, v6) & 1) == 0);
  }
  else
  {
    char v7 = (AlgosScoreCombinerFrameRow *)((char *)a1 + 64);
    do
    {
      char v6 = v7;
      v16 = v7;
      if (v7 >= (const AlgosScoreCombinerFrameRow *)v15) {
        break;
      }
      int v8 = ((uint64_t (*)(std::string *, const AlgosScoreCombinerFrameRow *))*a3)(&v12, v7);
      char v7 = (const AlgosScoreCombinerFrameRow *)((char *)v6 + 64);
    }
    while (!v8);
  }
  char v9 = v15;
  if (v6 < (const AlgosScoreCombinerFrameRow *)v15)
  {
    do
    {
      char v9 = (std::string *)((char *)v9 - 64);
      char v15 = v9;
    }
    while ((((uint64_t (*)(std::string *, std::string *))*a3)(&v12, v9) & 1) != 0);
    char v6 = v16;
  }
  if (v6 < (const AlgosScoreCombinerFrameRow *)v9)
  {
    do
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v16, &v15);
      do
        v16 = (const AlgosScoreCombinerFrameRow *)((char *)v16 + 64);
      while (!(*a3)(&v12));
      do
        char v15 = (std::string *)((char *)v15 - 64);
      while ((((uint64_t (*)(std::string *))*a3)(&v12) & 1) != 0);
      char v6 = v16;
    }
    while (v16 < (const AlgosScoreCombinerFrameRow *)v15);
  }
  if ((const AlgosScoreCombinerFrameRow *)((char *)v6 - 64) != a1) {
    AlgosScoreCombinerFrameRow::operator=((std::string *)a1, (const std::string *)((char *)v6 - 64));
  }
  AlgosScoreCombinerFrameRow::operator=((std::string *)((char *)v6 - 64), &v12);
  char v10 = v16;
  if (v14 < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  return v10;
}

void sub_215611484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

std::string *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,AlgosScoreCombinerFrameRow *,BOOL (*&)(AlgosScoreCombinerFrameRow&,AlgosScoreCombinerFrameRow&)>(AlgosScoreCombinerFrameRow *a1, std::string *a2, uint64_t (**a3)(void))
{
  uint64_t v17 = a2;
  AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v14, a1);
  uint64_t v5 = 0;
  do
  {
    uint64_t v18 = (AlgosScoreCombinerFrameRow *)((char *)a1 + v5 + 64);
    v5 += 64;
  }
  while (((*a3)() & 1) != 0);
  char v6 = v17;
  if (v5 == 64)
  {
    char v9 = (AlgosScoreCombinerFrameRow *)((char *)a1 + 64);
    do
    {
      if (v9 >= (const AlgosScoreCombinerFrameRow *)v6) {
        break;
      }
      char v10 = *a3;
      char v6 = (std::string *)((char *)v6 - 64);
      uint64_t v17 = v6;
    }
    while ((((uint64_t (*)(std::string *, std::string *))v10)(v6, &v14) & 1) == 0);
  }
  else
  {
    char v7 = (std::string *)((char *)v17 - 64);
    do
    {
      uint64_t v17 = v7;
      int v8 = ((uint64_t (*)(std::string *, std::string *))*a3)(v7, &v14);
      char v7 = (std::string *)((char *)v7 - 64);
    }
    while (!v8);
    char v9 = v18;
  }
  char v11 = v9;
  if (v9 < (const AlgosScoreCombinerFrameRow *)v17)
  {
    do
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v18, &v17);
      do
        uint64_t v18 = (const AlgosScoreCombinerFrameRow *)((char *)v18 + 64);
      while (((*a3)() & 1) != 0);
      do
        uint64_t v17 = (std::string *)((char *)v17 - 64);
      while (!(*a3)());
      char v11 = v18;
    }
    while (v18 < (const AlgosScoreCombinerFrameRow *)v17);
  }
  std::string v12 = (std::string *)((char *)v11 - 64);
  if ((const AlgosScoreCombinerFrameRow *)((char *)v11 - 64) != a1) {
    AlgosScoreCombinerFrameRow::operator=((std::string *)a1, (const std::string *)((char *)v11 - 64));
  }
  AlgosScoreCombinerFrameRow::operator=(v12, &v14);
  if (v16 < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  return v12;
}

void sub_215611628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(uint64_t a1, std::string *a2, uint64_t (**a3)(std::string *, const AlgosScoreCombinerFrameRow *))
{
  uint64_t v18 = (const AlgosScoreCombinerFrameRow *)a1;
  uint64_t v17 = a2;
  uint64_t v6 = ((uint64_t)a2 - a1) >> 6;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      int v8 = *a3;
      uint64_t v17 = (std::string *)((char *)a2 - 64);
      if (((unsigned int (*)(void))v8)()) {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v18, &v17);
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((const AlgosScoreCombinerFrameRow *)a1, (std::string *)(a1 + 64), (std::string *)((char *)a2 - 64), a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((const AlgosScoreCombinerFrameRow *)a1, (std::string *)(a1 + 64), (std::string *)(a1 + 128), (std::string *)((char *)a2 - 64), a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((const AlgosScoreCombinerFrameRow *)a1, (std::string *)(a1 + 64), (std::string *)(a1 + 128), (std::string *)(a1 + 192), (std::string *)((char *)a2 - 64), a3);
      return 1;
    default:
      char v9 = (const AlgosScoreCombinerFrameRow *)(a1 + 128);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((const AlgosScoreCombinerFrameRow *)a1, (std::string *)(a1 + 64), (std::string *)(a1 + 128), a3);
      char v10 = (const AlgosScoreCombinerFrameRow *)(a1 + 192);
      if (v10 == (const AlgosScoreCombinerFrameRow *)a2) {
        return 1;
      }
      int v11 = 0;
      break;
  }
  do
  {
    if ((*a3)((std::string *)v10, v9))
    {
      AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v14, v10);
      do
      {
        std::string v12 = (std::string *)v9;
        AlgosScoreCombinerFrameRow::operator=((std::string *)((char *)v9 + 64), (const std::string *)v9);
        if (v9 == v18) {
          break;
        }
        char v9 = (const AlgosScoreCombinerFrameRow *)((char *)v9 - 64);
      }
      while (((*a3)(&v14, (const AlgosScoreCombinerFrameRow *)&v12[-3].__r_.__value_.__r.__words[1]) & 1) != 0);
      AlgosScoreCombinerFrameRow::operator=(v12, &v14);
      std::string v13 = v17;
      if (v16 < 0) {
        operator delete(__p);
      }
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v14.__r_.__value_.__l.__data_);
      }
      if (++v11 == 8) {
        return (std::string *)((char *)v10 + 64) == v13;
      }
    }
    else
    {
      std::string v13 = v17;
    }
    char v9 = v10;
    char v10 = (const AlgosScoreCombinerFrameRow *)((char *)v10 + 64);
  }
  while (v10 != (const AlgosScoreCombinerFrameRow *)v13);
  return 1;
}

void sub_215611834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(const AlgosScoreCombinerFrameRow *a1, std::string *a2, std::string *a3, std::string *a4, uint64_t (**a5)(std::string *, const AlgosScoreCombinerFrameRow *))
{
  std::string v12 = a2;
  std::string v13 = a1;
  char v10 = a4;
  int v11 = a3;
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(a1, a2, a3, a5);
  if ((*a5)(a4, (const AlgosScoreCombinerFrameRow *)a3))
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>((const AlgosScoreCombinerFrameRow **)&v11, &v10);
    if ((*a5)(v11, (const AlgosScoreCombinerFrameRow *)a2))
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>((const AlgosScoreCombinerFrameRow **)&v12, &v11);
      if ((*a5)(v12, a1)) {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v13, &v12);
      }
    }
  }
}

void std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(const AlgosScoreCombinerFrameRow *a1, std::string *a2, std::string *a3, std::string *a4, std::string *a5, uint64_t (**a6)(std::string *, const AlgosScoreCombinerFrameRow *))
{
  char v15 = a2;
  char v16 = a1;
  std::string v13 = a4;
  std::string v14 = a3;
  std::string v12 = a5;
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(a1, a2, a3, a4, a6);
  if ((*a6)(a5, (const AlgosScoreCombinerFrameRow *)a4))
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>((const AlgosScoreCombinerFrameRow **)&v13, &v12);
    if ((*a6)(v13, (const AlgosScoreCombinerFrameRow *)a3))
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>((const AlgosScoreCombinerFrameRow **)&v14, &v13);
      if ((*a6)(v14, (const AlgosScoreCombinerFrameRow *)a2))
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>((const AlgosScoreCombinerFrameRow **)&v15, &v14);
        if ((*a6)(v15, a1)) {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v16, &v15);
        }
      }
    }
  }
}

const AlgosScoreCombinerFrameRow *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*,AlgosScoreCombinerFrameRow*>(AlgosScoreCombinerFrameRow *a1, const AlgosScoreCombinerFrameRow *a2, const AlgosScoreCombinerFrameRow *a3, uint64_t (**a4)(const std::string *, const AlgosScoreCombinerFrameRow *))
{
  uint64_t v18 = a1;
  if (a1 != a2)
  {
    uint64_t v6 = a2;
    char v7 = a1;
    uint64_t v8 = a2 - a1;
    uint64_t v9 = (a2 - a1) >> 6;
    if (a2 - a1 >= 65)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      std::string v12 = (AlgosScoreCombinerFrameRow *)((char *)a1 + 64 * v10);
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((uint64_t)v7, a4, v9, v12);
        std::string v12 = (const AlgosScoreCombinerFrameRow *)((char *)v12 - 64);
        --v11;
      }
      while (v11);
    }
    uint64_t v17 = v6;
    if (v6 == a3)
    {
      a3 = v6;
    }
    else
    {
      std::string v13 = v6;
      do
      {
        if ((*a4)((const std::string *)v13, v18))
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v17, (std::string **)&v18);
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((uint64_t)v18, a4, v9, v18);
        }
        std::string v13 = (const AlgosScoreCombinerFrameRow *)((char *)v17 + 64);
        uint64_t v17 = v13;
      }
      while (v13 != a3);
      char v7 = v18;
      uint64_t v8 = v6 - v18;
    }
    if (v8 >= 65)
    {
      unint64_t v14 = (unint64_t)v8 >> 6;
      do
      {
        std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(v7, (uint64_t)v6, (unsigned int (**)(uint64_t, uint64_t))a4, v14);
        uint64_t v6 = (const AlgosScoreCombinerFrameRow *)((char *)v6 - 64);
      }
      while (v14-- > 2);
      return v17;
    }
  }
  return a3;
}

void std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(uint64_t a1, uint64_t (**a2)(const std::string *, const AlgosScoreCombinerFrameRow *), uint64_t a3, const AlgosScoreCombinerFrameRow *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v5 = a4;
    uint64_t v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - a1) >> 6)
    {
      uint64_t v10 = ((uint64_t)a4 - a1) >> 5;
      uint64_t v11 = v10 + 1;
      std::string v12 = (const std::string *)(a1 + ((v10 + 1) << 6));
      uint64_t v13 = v10 + 2;
      if (v10 + 2 < a3
        && (*a2)(v12, (const AlgosScoreCombinerFrameRow *)&v12[2].__r_.__value_.__r.__words[2]))
      {
        std::string v12 = (const std::string *)((char *)v12 + 64);
        uint64_t v11 = v13;
      }
      if (((*a2)(v12, v5) & 1) == 0)
      {
        AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v16, v5);
        do
        {
          unint64_t v14 = (std::string *)v12;
          AlgosScoreCombinerFrameRow::operator=((std::string *)v5, v12);
          if (v7 < v11) {
            break;
          }
          uint64_t v15 = (2 * v11) | 1;
          std::string v12 = (const std::string *)(a1 + (v15 << 6));
          uint64_t v11 = 2 * v11 + 2;
          if (v11 >= a3)
          {
            uint64_t v11 = v15;
          }
          else if ((*a2)((const std::string *)(a1 + (v15 << 6)), (const AlgosScoreCombinerFrameRow *)&v12[2].__r_.__value_.__r.__words[2]))
          {
            std::string v12 = (const std::string *)((char *)v12 + 64);
          }
          else
          {
            uint64_t v11 = v15;
          }
          uint64_t v5 = (const AlgosScoreCombinerFrameRow *)v14;
        }
        while (!(*a2)(v12, (const AlgosScoreCombinerFrameRow *)&v16));
        AlgosScoreCombinerFrameRow::operator=(v14, &v16);
        if (v18 < 0) {
          operator delete(__p);
        }
        if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v16.__r_.__value_.__l.__data_);
        }
      }
    }
  }
}

void sub_215611C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(AlgosScoreCombinerFrameRow *a1, uint64_t a2, unsigned int (**a3)(uint64_t, uint64_t), uint64_t a4)
{
  if (a4 >= 2)
  {
    AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v11, a1);
    uint64_t v8 = (std::string *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((std::string *)a1, a3, a4);
    uint64_t v9 = v8;
    uint64_t v10 = (std::string *)(a2 - 64);
    if (v8 == v10)
    {
      AlgosScoreCombinerFrameRow::operator=(v8, &v11);
    }
    else
    {
      AlgosScoreCombinerFrameRow::operator=(v8, v10);
      AlgosScoreCombinerFrameRow::operator=(v10, &v11);
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((uint64_t)a1, (uint64_t)&v9[2].__r_.__value_.__r.__words[2], (uint64_t (**)(const std::string *, std::string *))a3, ((char *)&v9[2].__r_.__value_.__r.__words[2] - (char *)a1) >> 6);
    }
    if (v13 < 0) {
      operator delete(__p);
    }
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v11.__r_.__value_.__l.__data_);
    }
  }
}

void sub_215611D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

const std::string *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(std::string *a1, unsigned int (**a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    uint64_t v9 = (std::string *)((char *)a1 + 64 * v6 + 64);
    uint64_t v10 = (2 * v6) | 1;
    uint64_t v11 = 2 * v6 + 2;
    if (v11 < a3
      && (*a2)((uint64_t)&a1[2].__r_.__value_.__r.__words[8 * v6 + 2], (uint64_t)(&a1[5].__r_.__value_.__l.__size_ + 8 * v6)))
    {
      uint64_t v9 = (const std::string *)((char *)v9 + 64);
      uint64_t v10 = v11;
    }
    AlgosScoreCombinerFrameRow::operator=(a1, v9);
    a1 = (std::string *)v9;
    uint64_t v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(uint64_t a1, uint64_t a2, uint64_t (**a3)(const std::string *, std::string *), uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v7 = v4 >> 1;
    uint64_t v8 = (const std::string *)(a1 + (v4 >> 1 << 6));
    uint64_t v9 = (const AlgosScoreCombinerFrameRow *)(a2 - 64);
    if ((*a3)(v8, (std::string *)(a2 - 64)))
    {
      AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v11, v9);
      do
      {
        uint64_t v10 = (std::string *)v8;
        AlgosScoreCombinerFrameRow::operator=((std::string *)v9, v8);
        if (!v7) {
          break;
        }
        unint64_t v7 = (v7 - 1) >> 1;
        uint64_t v8 = (const std::string *)(a1 + (v7 << 6));
        uint64_t v9 = (const AlgosScoreCombinerFrameRow *)v10;
      }
      while (((*a3)(v8, &v11) & 1) != 0);
      AlgosScoreCombinerFrameRow::operator=(v10, &v11);
      if (v13 < 0) {
        operator delete(__p);
      }
      if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v11.__r_.__value_.__l.__data_);
      }
    }
  }
}

void sub_215611F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

double standard_moment(const AlgosScoreCombinerFrameRow **a1, int a2)
{
  uint64_t v2 = a1[1] - *a1;
  if ((unint64_t)v2 > 0xBF)
  {
    double v6 = amean(a1);
    double v7 = stddev(a1);
    double v8 = (double)a2;
    double v9 = pow(v7, (double)a2);
    uint64_t v10 = *a1;
    std::string v11 = a1[1];
    if (v10 == v11) {
      return 0.0;
    }
    double v12 = v9 * (double)(unint64_t)((v2 >> 6) - 1);
    double v13 = 0.0;
    do
    {
      AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v15, v10);
      double v14 = pow(v19 - v6, v8);
      if (v18 < 0) {
        operator delete(__p);
      }
      if (v16 < 0) {
        operator delete(v15);
      }
      double v13 = v13 + v14 / v12;
      uint64_t v10 = (const AlgosScoreCombinerFrameRow *)((char *)v10 + 64);
    }
    while (v10 != v11);
    return v13;
  }
  else
  {
    return nan("standard_moment");
  }
}

uint64_t std::vector<AlgosScoreCombinerFrameRow>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<AlgosScoreCombinerFrameRow>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>>((uint64_t)(a1 + 2), a1[1], (const AlgosScoreCombinerFrameRow *)a1[1], *a1, (const AlgosScoreCombinerFrameRow *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<AlgosScoreCombinerFrameRow>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>>(uint64_t a1, uint64_t a2, const AlgosScoreCombinerFrameRow *a3, uint64_t a4, const AlgosScoreCombinerFrameRow *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  char v13 = 0;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    double v9 = a3;
    do
    {
      double v9 = (const AlgosScoreCombinerFrameRow *)((char *)v9 - 64);
      AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)(v7 - 64), v9);
      uint64_t v7 = *((void *)&v15 + 1) - 64;
      *((void *)&v15 + 1) -= 64;
    }
    while (v9 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

void sub_215612184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100](v3, v1);
      v1 += 64;
    }
    while (v1 != v2);
  }
}

void **std::__split_buffer<AlgosScoreCombinerFrameRow>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<AlgosScoreCombinerFrameRow>::clear[abi:ne180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 64;
    std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100](v4, i - 64);
  }
}

void sub_21561234C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2156128A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::locale a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::~basic_regex(std::locale *this)
{
  locale = (std::__shared_weak_count *)this[6].__locale_;
  if (locale) {
    std::__shared_weak_count::__release_shared[abi:ne180100](locale);
  }
  std::locale::~locale(this);
}

void sub_215612BCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21561347C()
{
  objc_end_catch();
  JUMPOUT(0x21561356CLL);
}

void sub_215613490()
{
  _Unwind_Resume(v3);
}

void sub_2156134A8()
{
  _Unwind_Resume(v1);
}

void sub_21561351C()
{
}

void sub_215613528()
{
}

void sub_215613530()
{
  JUMPOUT(0x215613544);
}

void sub_215613554()
{
  JUMPOUT(0x215613564);
}

void sub_215613560()
{
  JUMPOUT(0x21561356CLL);
}

void sub_215613620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::vector<AlgosScoreStreamCSVFrameRow>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 72)
  {
    if (*(char *)(i - 49) < 0) {
      operator delete(*(void **)(i - 72));
    }
  }
  a1[1] = v2;
}

void std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](std::regex_traits<char> *a1, const char *a2, int a3)
{
  uint64_t v5 = std::regex_traits<char>::regex_traits(a1);
  LODWORD(v5[1].__loc_.__locale_) = a3;
  *(_OWORD *)((char *)&v5[1].__loc_.__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v5[1].__col_ + 4) = 0u;
  HIDWORD(v5[2].__ct_) = 0;
  strlen(a2);
  std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>();
}

void sub_215613858(_Unwind_Exception *a1)
{
  locale = (std::__shared_weak_count *)v1[6].__locale_;
  if (locale) {
    std::__shared_weak_count::__release_shared[abi:ne180100](locale);
  }
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::regex_traits<char> *__cdecl std::regex_traits<char>::regex_traits(std::regex_traits<char> *this)
{
  uint64_t v2 = (const std::locale *)MEMORY[0x2166BEFE0]();
  this->__ct_ = (const std::ctype<char> *)std::locale::use_facet(v2, MEMORY[0x263F8C108]);
  this->__col_ = (const std::collate<char> *)std::locale::use_facet(&this->__loc_, MEMORY[0x263F8C130]);
  return this;
}

void sub_2156138C4(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>()
{
}

void sub_215613A98(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2166BEEB0](exception, 17);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_215613B10(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::shared_ptr<std::__empty_state<char>>::reset[abi:ne180100]<std::__empty_state<char>,void>(uint64_t a1, uint64_t a2)
{
  std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(&v2, a2);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, char *a3)
{
  end = a1->__end_;
  uint64_t v7 = a2;
  do
  {
    uint64_t v8 = v7;
    uint64_t v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(a1, (char *)v7, a3);
  }
  while (v7 != v8);
  if (v8 == a2) {
    operator new();
  }
  while (v8 != (unsigned __int8 *)a3)
  {
    if (*v8 != 124) {
      return (char *)v8;
    }
    double v9 = a1->__end_;
    uint64_t v10 = v8 + 1;
    std::string v11 = v8 + 1;
    do
    {
      uint64_t v8 = v11;
      std::string v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(a1, (char *)v11, a3);
    }
    while (v11 != v8);
    if (v8 == v10) {
      operator new();
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v9);
  }
  return a3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(std::basic_regex<char> *this, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return (char *)a2;
  }
  uint64_t v4 = (char *)a3;
  if (*a2 == 94)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_l_anchor(this);
    ++v3;
  }
  if (v3 != (unsigned __int8 *)v4)
  {
    do
    {
      uint64_t v6 = v3;
      uint64_t v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>(this, (char *)v3, v4);
    }
    while (v3 != v6);
    if (v6 != (unsigned __int8 *)v4)
    {
      if (v6 + 1 != (unsigned __int8 *)v4 || *v6 != 36) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_r_anchor(this);
    }
  }
  return v4;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  uint64_t v3 = a3;
  end = a1->__end_;
  uint64_t v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>(a1, a2, a3);
  if (v7 == (unsigned __int8 *)a2) {
LABEL_9:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  uint64_t v8 = v7;
  while (v8 != (unsigned __int8 *)v3)
  {
    if (*v8 != 124) {
      return (std::basic_regex<char> *)v8;
    }
    double v9 = a1->__end_;
    uint64_t v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>(a1, (std::basic_regex<char> *)(v8 + 1), v3);
    if (v10 == v8 + 1) {
      goto LABEL_9;
    }
    uint64_t v8 = v10;
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v9);
  }
  return v3;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_grep<char const*>(std::basic_regex<char> *a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  end = a1->__end_;
  uint64_t v7 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  if (v8 == __s) {
    operator new();
  }
  std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, __s, v8);
  while (1)
  {
    std::string v11 = v8 == a3 ? v8 : v8 + 1;
    if (v11 == a3) {
      break;
    }
    double v9 = (unsigned __int8 *)memchr(v11, 10, a3 - v11);
    if (v9) {
      uint64_t v8 = v9;
    }
    else {
      uint64_t v8 = a3;
    }
    uint64_t v10 = a1->__end_;
    if (v8 == v11) {
      operator new();
    }
    std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, v11, v8);
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v10);
  }
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *__s, std::basic_regex<char> *a3)
{
  end = a1->__end_;
  uint64_t v7 = (std::basic_regex<char> *)memchr(__s, 10, (char *)a3 - (char *)__s);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  if (v8 == __s) {
    operator new();
  }
  std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, __s, v8);
  while (1)
  {
    std::string v11 = v8 == a3 ? v8 : (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    if (v11 == a3) {
      break;
    }
    double v9 = (std::basic_regex<char> *)memchr(v11, 10, (char *)a3 - (char *)v11);
    if (v9) {
      uint64_t v8 = v9;
    }
    else {
      uint64_t v8 = a3;
    }
    uint64_t v10 = a1->__end_;
    if (v8 == v11) {
      operator new();
    }
    std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, v11, v8);
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v10);
  }
  return a3;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2166BEEB0](exception, 14);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_215614134(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__end_state<char>::~__end_state()
{
}

void std::__end_state<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_2156141DC(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2166BF060);
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void (__cdecl ***std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }
  JUMPOUT(0x2166BF060);
}

void std::__empty_state<char>::__exec(const std::__empty_state<char> *this, std::__empty_state<char>::__state *a2)
{
  a2->__do_ = -994;
  a2->__node_ = this->__first_;
}

void std::__owns_one_state<char>::~__owns_one_state(std::__owns_one_state<char> *this)
{
  first = this->__first_;
  if (first) {
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  }
}

{
  std::__node<char> *first;
  uint64_t vars8;

  first = this->__first_;
  if (first) {
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  }
  JUMPOUT(0x2166BF060);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_alternation(std::basic_regex<char> *this, std::__owns_one_state<char> *__sa, std::__owns_one_state<char> *__sb)
{
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  uint64_t result = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    end = a1->__end_;
    unsigned int marked_count = a1->__marked_count_;
    double v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(a1, a2, a3);
    uint64_t result = (unsigned __int8 *)a2;
    if (v9 != (unsigned __int8 *)a2)
    {
      size_t v10 = a1->__marked_count_ + 1;
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)a1, v9, (unsigned __int8 *)a3, end, marked_count + 1, v10);
    }
  }
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(std::basic_regex<char> *this, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v6 = *a2;
  if (v6 <= 91)
  {
    if (v6 != 36)
    {
      BOOL v8 = v6 == 40;
      uint64_t v7 = a2 + 1;
      BOOL v8 = !v8 || v7 == a3;
      if (!v8)
      {
        BOOL v8 = *v7 == 63;
        double v9 = a2 + 2;
        if (v8 && v9 != a3)
        {
          int v11 = *v9;
          if (v11 == 33)
          {
            std::regex_traits<char>::regex_traits(&v18.__traits_);
            memset(&v18.__flags_, 0, 40);
            v18.__flags_ = this->__flags_;
            double v12 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v18, v3 + 3, a3);
            unsigned int marked_count = v18.__marked_count_;
            std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(this, &v18, 1, this->__marked_count_);
            this->__marked_count_ += marked_count;
            if (v12 == a3 || *v12 != 41) {
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
            }
            goto LABEL_31;
          }
          if (v11 == 61)
          {
            std::regex_traits<char>::regex_traits(&v18.__traits_);
            memset(&v18.__flags_, 0, 40);
            v18.__flags_ = this->__flags_;
            double v12 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v18, v3 + 3, a3);
            unsigned int v13 = v18.__marked_count_;
            std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(this, &v18, 0, this->__marked_count_);
            this->__marked_count_ += v13;
            if (v12 == a3 || *v12 != 41) {
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
            }
LABEL_31:
            uint64_t v3 = v12 + 1;
            std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&v18.__traits_.__loc_);
            return v3;
          }
        }
      }
      return v3;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_r_anchor(this);
    return ++v3;
  }
  if (v6 != 92)
  {
    if (v6 != 94) {
      return v3;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_l_anchor(this);
    return ++v3;
  }
  if (a2 + 1 != a3)
  {
    int v15 = a2[1];
    if (v15 == 66)
    {
      BOOL v16 = 1;
    }
    else
    {
      if (v15 != 98) {
        return v3;
      }
      BOOL v16 = 0;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(this, v16);
    v3 += 2;
  }
  return v3;
}

void sub_215614898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(std::basic_regex<char> *this, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return (unsigned __int8 *)v3;
  }
  int v6 = *a2;
  if (v6 <= 62)
  {
    if (v6 != 40)
    {
      if (v6 == 46) {
        operator new();
      }
      if ((v6 - 42) >= 2) {
        goto LABEL_28;
      }
LABEL_34:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
    }
    if (a2 + 1 != a3)
    {
      if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
      {
        p_open_count = &this->__open_count_;
        ++this->__open_count_;
        double v9 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, a2 + 3, a3);
        if (v9 == a3) {
          goto LABEL_35;
        }
        size_t v10 = v9;
        if (*v9 != 41) {
          goto LABEL_35;
        }
        goto LABEL_25;
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(this);
      unsigned int marked_count = this->__marked_count_;
      p_open_count = &this->__open_count_;
      ++this->__open_count_;
      double v12 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, v3 + 1, a3);
      if (v12 != a3)
      {
        size_t v10 = v12;
        if (*v12 == 41)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(this, marked_count);
LABEL_25:
          --*p_open_count;
          return (unsigned __int8 *)(v10 + 1);
        }
      }
    }
LABEL_35:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
  }
  if (v6 <= 91)
  {
    if (v6 == 91)
    {
      return (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
    }
    if (v6 == 63) {
      goto LABEL_34;
    }
LABEL_28:
    return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(this, a2, a3);
  }
  if (v6 != 92)
  {
    if (v6 == 123) {
      goto LABEL_34;
    }
    goto LABEL_28;
  }
  return std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<char const*>(this, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, std::__owns_one_state<char> *__s, size_t a5, size_t a6)
{
  if (a2 == a3) {
    return a2;
  }
  unsigned int v6 = a6;
  unsigned int v7 = a5;
  uint64_t v10 = a1;
  int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  int v12 = (char)*a2;
  if (v12 > 62)
  {
    if (v12 == 63)
    {
      unsigned int v13 = a2 + 1;
      if (v11) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v13 == a3;
      }
      if (!v20 && *v13 == 63)
      {
        unsigned int v13 = a2 + 2;
        a5 = a5;
        a6 = a6;
        size_t v14 = 0;
        size_t v18 = 1;
        goto LABEL_33;
      }
      a5 = a5;
      a6 = a6;
      size_t v14 = 0;
      size_t v18 = 1;
      goto LABEL_45;
    }
    if (v12 != 123) {
      return a2;
    }
    int v15 = a2 + 1;
    BOOL v16 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(a1, a2 + 1, a3, (int *)&__max);
    if (v16 != v15)
    {
      if (v16 != a3)
      {
        int v17 = (char)*v16;
        if (v17 != 44)
        {
          if (v17 == 125)
          {
            unsigned int v13 = v16 + 1;
            if (!v11 && v13 != a3 && *v13 == 63)
            {
              unsigned int v13 = v16 + 2;
              size_t v14 = (int)__max;
              a5 = v7;
              a6 = v6;
              a1 = v10;
              size_t v18 = (int)__max;
LABEL_33:
              char v21 = __s;
              BOOL v22 = 0;
LABEL_46:
              std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v14, v18, v21, a5, a6, v22);
              return v13;
            }
            size_t v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            size_t v18 = (int)__max;
LABEL_45:
            char v21 = __s;
            BOOL v22 = 1;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
        v23 = v16 + 1;
        if (v16 + 1 == a3) {
          goto LABEL_58;
        }
        if (*v23 == 125)
        {
          unsigned int v13 = v16 + 2;
          if (!v11 && v13 != a3 && *v13 == 63)
          {
            unsigned int v13 = v16 + 3;
            size_t v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            goto LABEL_26;
          }
          size_t v14 = (int)__max;
          a5 = v7;
          a6 = v6;
          a1 = v10;
LABEL_36:
          size_t v18 = -1;
          goto LABEL_45;
        }
        int v27 = -1;
        v25 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(v10, v23, a3, &v27);
        if (v25 != v23 && v25 != a3 && *v25 == 125)
        {
          size_t v18 = v27;
          size_t v14 = (int)__max;
          if (v27 >= (int)__max)
          {
            unsigned int v13 = v25 + 1;
            BOOL v22 = 1;
            if (!v11 && v13 != a3)
            {
              int v26 = v25[1];
              BOOL v22 = v26 != 63;
              if (v26 == 63) {
                unsigned int v13 = v25 + 2;
              }
            }
            a5 = v7;
            a6 = v6;
            a1 = v10;
            char v21 = __s;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
LABEL_58:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  if (v12 == 42)
  {
    unsigned int v13 = a2 + 1;
    if (v11) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v13 == a3;
    }
    if (!v19 && *v13 == 63)
    {
      unsigned int v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      size_t v14 = 0;
      goto LABEL_26;
    }
    a5 = a5;
    a6 = a6;
    size_t v14 = 0;
    goto LABEL_36;
  }
  if (v12 == 43)
  {
    unsigned int v13 = a2 + 1;
    if (!v11 && v13 != a3 && *v13 == 63)
    {
      unsigned int v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      size_t v14 = 1;
LABEL_26:
      size_t v18 = -1;
      goto LABEL_33;
    }
    a5 = a5;
    a6 = a6;
    size_t v14 = 1;
    goto LABEL_36;
  }
  return a2;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_l_anchor(std::basic_regex<char> *this)
{
}

void std::basic_regex<char,std::regex_traits<char>>::__push_r_anchor(std::basic_regex<char> *this)
{
}

void std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(std::basic_regex<char> *this, BOOL a2)
{
}

void std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(std::basic_regex<char> *this, const std::basic_regex<char> *a2, BOOL a3, unsigned int a4)
{
}

void sub_215615024(_Unwind_Exception *a1)
{
  MEMORY[0x2166BF060](v1, 0x10E1C4030FC3181);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2166BEEB0](exception, 6);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21561508C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }
  JUMPOUT(0x2166BF060);
}

uint64_t std::__l_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 92))
  {
    if (*(void *)(a2 + 16) != *(void *)(a2 + 8) || (*(unsigned char *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      uint64_t v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(unsigned char *)(result + 16)) {
      goto LABEL_12;
    }
    int v2 = *(unsigned __int8 *)(*(void *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10) {
      goto LABEL_12;
    }
  }
  *(_DWORD *)a2 = -994;
  uint64_t v4 = *(void *)(result + 8);
LABEL_13:
  *(void *)(a2 + 80) = v4;
  return result;
}

void (__cdecl ***std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }
  JUMPOUT(0x2166BF060);
}

uint64_t std::__r_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  int v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(unsigned char *)(a2 + 88) & 2) == 0
    || *(unsigned char *)(result + 16) && ((v3 = *v2, v3 != 13) ? (BOOL v4 = v3 == 10) : (BOOL v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    uint64_t v5 = *(void *)(result + 8);
  }
  else
  {
    uint64_t v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 80) = v5;
  return result;
}

std::locale *std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C636E90;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C636E90;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  JUMPOUT(0x2166BF060);
}

uint64_t std::__word_boundary<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  int v2 = *(unsigned __int8 **)(a2 + 8);
  int v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3) {
    goto LABEL_17;
  }
  BOOL v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(unsigned char *)(a2 + 88) & 8) == 0)
    {
      uint64_t v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    int v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    int v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        uint64_t v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          int v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  uint64_t v7 = *(v4 - 1);
  uint64_t v8 = *v4;
  int v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  int v11 = v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  int v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    uint64_t v12 = 0;
    int v13 = -993;
  }
  else
  {
    uint64_t v12 = *(void *)(result + 8);
    int v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(void *)(a2 + 80) = v12;
  return result;
}

uint64_t std::__lookahead<char,std::regex_traits<char>>::__lookahead[abi:ne180100](uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  *(void *)a1 = &unk_26C636DD0;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 40);
  *(void *)(a1 + 64) = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 72) = *(void *)(a2 + 56);
  *(_DWORD *)(a1 + 80) = a5;
  *(unsigned char *)(a1 + 84) = a3;
  return a1;
}

void (__cdecl ***std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26C636DD0;
  int v2 = (std::locale *)(a1 + 2);
  int v3 = (std::__shared_weak_count *)a1[8];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  std::locale::~locale(v2);
  BOOL v4 = a1[1];
  if (v4) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  }
  return a1;
}

void std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26C636DD0;
  int v2 = (std::locale *)(a1 + 2);
  int v3 = (std::__shared_weak_count *)a1[8];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  std::locale::~locale(v2);
  BOOL v4 = a1[1];
  if (v4) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  }
  JUMPOUT(0x2166BF060);
}

void std::__lookahead<char,std::regex_traits<char>>::__exec(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  char v21 = 0;
  memset(&v22, 0, 17);
  char v23 = 0;
  uint64_t v24 = 0;
  memset(&__p, 0, sizeof(__p));
  std::vector<std::csub_match>::size_type v4 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v5 = *(void *)(a2 + 16);
  v18.first = *(const char **)(a2 + 24);
  v18.second = v18.first;
  v18.matched = 0;
  std::vector<std::sub_match<char const*>>::assign(&__p, v4, &v18);
  uint64_t v19 = v5;
  uint64_t v20 = v5;
  char v21 = 0;
  std::vector<std::csub_match>::value_type v22 = v18;
  uint64_t v24 = v5;
  char v23 = 1;
  uint64_t v6 = *(const char **)(a2 + 16);
  if (*(unsigned char *)(a2 + 92)) {
    BOOL v7 = v6 == *(const char **)(a2 + 8);
  }
  else {
    BOOL v7 = 0;
  }
  char v8 = v7;
  if (*(unsigned __int8 *)(a1 + 84) == std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1 + 16, v6, *(const char **)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v8))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    begin = __p.__begin_;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(a1 + 8);
  begin = __p.__begin_;
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__end_ - (char *)__p.__begin_) >> 3);
  if (v10 < 2)
  {
LABEL_13:
    if (!begin) {
      return;
    }
    goto LABEL_14;
  }
  int v11 = 0;
  int v12 = *(_DWORD *)(a1 + 80);
  uint64_t v13 = *(void *)(a2 + 32);
  unint64_t v14 = 1;
  do
  {
    int v15 = &begin[v14];
    uint64_t v16 = v13 + 24 * (v12 + v11);
    *(std::pair<const char *, const char *> *)uint64_t v16 = v15->std::pair<const char *, const char *>;
    *(unsigned char *)(v16 + 16) = v15->matched;
    unint64_t v14 = (v11 + 2);
    ++v11;
  }
  while (v10 > v14);
LABEL_14:
  __p.__end_ = begin;
  operator delete(begin);
}

void sub_2156158E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::match_results<char const*>::__init(std::match_results<const char *> *this, unsigned int __s, const char *__f, const char *__l, BOOL __no_update_pos)
{
  this->__unmatched_.first = __l;
  p_unmatched = &this->__unmatched_;
  this->__unmatched_.second = __l;
  this->__unmatched_.matched = 0;
  std::vector<std::sub_match<char const*>>::assign(&this->__matches_, __s, &this->__unmatched_);
  this->__prefix_.first = __f;
  this->__prefix_.second = __f;
  this->__prefix_.matched = 0;
  this->__suffix_ = *p_unmatched;
  if (!__no_update_pos) {
    this->__position_start_ = __f;
  }
  this->__ready_ = 1;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  v41 = 0;
  v42 = 0;
  unint64_t v43 = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    __x.first = a3;
    __x.second = a3;
    __x.matched = 0;
    *(_DWORD *)v37 = 0;
    memset(&v37[8], 0, 48);
    *(_OWORD *)std::vector<std::csub_match> __p = 0u;
    memset(v39, 0, 21);
    v42 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v41, (uint64_t)v37);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(void *)&v37[32])
    {
      *(void *)&v37[40] = *(void *)&v37[32];
      operator delete(*(void **)&v37[32]);
    }
    v35 = a4;
    int v12 = v42;
    *((_DWORD *)v42 - 24) = 0;
    *((void *)v12 - 11) = a2;
    *((void *)v12 - 10) = a2;
    *((void *)v12 - 9) = a3;
    std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v12 - 4), *(unsigned int *)(a1 + 28), &__x);
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)((char *)v42 - 40), *(unsigned int *)(a1 + 32));
    uint64_t v13 = v42;
    *((void *)v42 - 2) = v6;
    *((_DWORD *)v13 - 2) = a5;
    *((unsigned char *)v13 - 4) = a6;
    unsigned int v14 = 1;
    while (2)
    {
      if ((v14 & 0xFFF) == 0 && (int)(v14 >> 12) >= (int)a3 - (int)a2) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      }
      uint64_t v16 = v13 - 1;
      uint64_t v15 = *((void *)v13 - 2);
      int v17 = v13 - 6;
      if (v15) {
        (*(void (**)(uint64_t, _OWORD *))(*(void *)v15 + 16))(v15, v13 - 6);
      }
      switch(*(_DWORD *)v17)
      {
        case 0xFFFFFC18:
          std::vector<std::csub_match>::value_type v18 = (const char *)*((void *)v13 - 10);
          if ((a5 & 0x20) != 0 && v18 == a2 || (a5 & 0x1000) != 0 && v18 != a3) {
            goto LABEL_16;
          }
          uint64_t v26 = *v35;
          *(void *)uint64_t v26 = a2;
          *(void *)(v26 + 8) = v18;
          *(unsigned char *)(v26 + 16) = 1;
          uint64_t v27 = *((void *)v13 - 8);
          uint64_t v28 = *((void *)v13 - 7) - v27;
          if (v28)
          {
            unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * (v28 >> 3);
            v30 = (unsigned char *)(v27 + 16);
            unsigned int v31 = 1;
            do
            {
              uint64_t v32 = v26 + 24 * v31;
              *(_OWORD *)uint64_t v32 = *((_OWORD *)v30 - 1);
              char v33 = *v30;
              v30 += 24;
              *(unsigned char *)(v32 + 16) = v33;
            }
            while (v29 > v31++);
          }
          uint64_t v6 = 1;
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_23;
        case 0xFFFFFC1F:
LABEL_16:
          uint64_t v19 = v42 - 6;
          std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)&v43, (void *)v42 - 12);
          v42 = v19;
          goto LABEL_23;
        case 0xFFFFFC20:
          long long v20 = *(v13 - 5);
          *(_OWORD *)v37 = *v17;
          *(_OWORD *)&v37[16] = v20;
          memset(&v37[32], 0, 24);
          std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v37[32], *((long long **)v13 - 8), *((long long **)v13 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v13 - 7) - *((void *)v13 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v39[0] = 0;
          std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *((long long **)v13 - 5), *((long long **)v13 - 4), (uint64_t)(*((void *)v13 - 4) - *((void *)v13 - 5)) >> 4);
          uint64_t v21 = *v16;
          *(void *)((char *)&v39[1] + 5) = *(void *)((char *)v13 - 11);
          v39[1] = v21;
          (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v16 + 24))(*v16, 1, v13 - 6);
          (*(void (**)(void, void, unsigned char *))(*(void *)v39[1] + 24))(v39[1], 0, v37);
          std::vector<std::csub_match>::value_type v22 = v42;
          if ((unint64_t)v42 >= v43)
          {
            v42 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v41, (uint64_t)v37);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            long long v23 = *(_OWORD *)&v37[16];
            _OWORD *v42 = *(_OWORD *)v37;
            v22[1] = v23;
            *((void *)v22 + 4) = 0;
            *((void *)v22 + 5) = 0;
            *((void *)v22 + 6) = 0;
            *((void *)v22 + 7) = 0;
            v22[2] = *(_OWORD *)&v37[32];
            *((void *)v22 + 6) = *(void *)&v37[48];
            memset(&v37[32], 0, 24);
            *((void *)v22 + 8) = 0;
            *((void *)v22 + 9) = 0;
            *(_OWORD *)((char *)v22 + 56) = *(_OWORD *)__p;
            *((void *)v22 + 9) = v39[0];
            __p[0] = 0;
            __p[1] = 0;
            v39[0] = 0;
            uint64_t v24 = v39[1];
            *(void *)((char *)v22 + 85) = *(void *)((char *)&v39[1] + 5);
            *((void *)v22 + 10) = v24;
            v42 = v22 + 6;
          }
          if (*(void *)&v37[32])
          {
            *(void *)&v37[40] = *(void *)&v37[32];
            operator delete(*(void **)&v37[32]);
          }
LABEL_23:
          uint64_t v13 = v42;
          ++v14;
          if (v41 != v42) {
            continue;
          }
          uint64_t v6 = 0;
          break;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  *(void *)v37 = &v41;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v37);
  return v6;
}

void sub_215615D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  std::__state<char>::~__state(&a13);
  a13 = v18 - 112;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a13);
  _Unwind_Resume(a1);
}

void std::vector<std::sub_match<char const*>>::assign(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __u)
{
  value = this->__end_cap_.__value_;
  begin = this->__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3) >= __n)
  {
    std::vector<std::csub_match>::pointer end = this->__end_;
    std::vector<std::csub_match>::size_type v16 = end - begin;
    if (v16 >= __n) {
      std::vector<std::csub_match>::size_type v17 = __n;
    }
    else {
      std::vector<std::csub_match>::size_type v17 = end - begin;
    }
    if (v17)
    {
      uint64_t v18 = begin;
      do
      {
        *v18++ = *__u;
        --v17;
      }
      while (v17);
    }
    if (__n <= v16)
    {
      this->__end_ = &begin[__n];
    }
    else
    {
      uint64_t v19 = &end[__n - v16];
      std::vector<std::csub_match>::size_type v20 = 24 * __n - 24 * v16;
      do
      {
        std::pair<const char *, const char *> v21 = __u->std::pair<const char *, const char *>;
        *(void *)&end->matched = *(void *)&__u->matched;
        end->std::pair<const char *, const char *> = v21;
        ++end;
        v20 -= 24;
      }
      while (v20);
      this->__end_ = v19;
    }
  }
  else
  {
    if (begin)
    {
      this->__end_ = begin;
      operator delete(begin);
      value = 0;
      this->__begin_ = 0;
      this->__end_ = 0;
      this->__end_cap_.__value_ = 0;
    }
    if (__n > 0xAAAAAAAAAAAAAAALL) {
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)value >> 3);
    std::vector<std::csub_match>::size_type v9 = 2 * v8;
    if (2 * v8 <= __n) {
      std::vector<std::csub_match>::size_type v9 = __n;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v9;
    }
    std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](this, v10);
    std::vector<std::csub_match>::pointer v11 = this->__end_;
    int v12 = &v11[__n];
    std::vector<std::csub_match>::size_type v13 = 24 * __n;
    do
    {
      std::pair<const char *, const char *> v14 = __u->std::pair<const char *, const char *>;
      *(void *)&v11->matched = *(void *)&__u->matched;
      v11->std::pair<const char *, const char *> = v14;
      ++v11;
      v13 -= 24;
    }
    while (v13);
    this->__end_ = v12;
  }
}

char *std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void *std::__state<char>::~__state(void *a1)
{
  int v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  int v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void std::vector<std::sub_match<char const*>>::resize(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __sz, std::vector<std::csub_match>::const_reference __x)
{
  std::vector<std::csub_match>::size_type v3 = 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3);
  BOOL v4 = __sz >= v3;
  std::vector<std::csub_match>::size_type v5 = __sz - v3;
  if (v5 != 0 && v4)
  {
    std::vector<std::sub_match<char const*>>::__append(this, v5, __x);
  }
  else if (!v4)
  {
    this->__end_ = &this->__begin_[__sz];
  }
}

void std::vector<std::pair<unsigned long,char const*>>::resize(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __sz)
{
  std::vector<std::pair<unsigned long, const char *>>::size_type v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2) {
      this->__end_ = &this->__begin_[__sz];
    }
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append(this, __sz - v2);
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2166BEEB0](exception, 12);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_2156160F4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2166BEEB0](exception, 16);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21561614C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL) {
    std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x155555555555555) {
    unint64_t v9 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  v16[4] = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char>>>(v7, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  std::vector<std::csub_match>::pointer v11 = &v10[96 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[96 * v9];
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)std::vector<std::csub_match>::pointer v11 = *(_OWORD *)a2;
  *((_OWORD *)v11 + 1) = v12;
  *((void *)v11 + 5) = 0;
  *((void *)v11 + 6) = 0;
  *((void *)v11 + 4) = 0;
  *((_OWORD *)v11 + 2) = *(_OWORD *)(a2 + 32);
  *((void *)v11 + 6) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *((void *)v11 + 7) = 0;
  *((void *)v11 + 8) = 0;
  *((void *)v11 + 9) = 0;
  *(_OWORD *)(v11 + 56) = *(_OWORD *)(a2 + 56);
  *((void *)v11 + 9) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v13 = *(void *)(a2 + 80);
  *(void *)(v11 + 85) = *(void *)(a2 + 85);
  *((void *)v11 + 10) = v13;
  v16[2] = v11 + 96;
  std::vector<std::__state<char>>::__swap_out_circular_buffer(a1, v16);
  uint64_t v14 = a1[1];
  std::__split_buffer<std::__state<char>>::~__split_buffer(v16);
  return v14;
}

void sub_21561629C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::__state<char>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::__state<char>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(96 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    do
    {
      long long v8 = *(_OWORD *)(a3 - 80);
      *(_OWORD *)(v7 - 96) = *(_OWORD *)(a3 - 96);
      *(_OWORD *)(v7 - 80) = v8;
      *(void *)(v7 - 56) = 0;
      *(void *)(v7 - 48) = 0;
      *(void *)(v7 - 64) = 0;
      *(_OWORD *)(v7 - 64) = *(_OWORD *)(a3 - 64);
      *(void *)(v7 - 48) = *(void *)(a3 - 48);
      *(void *)(a3 - 64) = 0;
      *(void *)(a3 - 56) = 0;
      *(void *)(a3 - 48) = 0;
      *(void *)(v7 - 40) = 0;
      *(void *)(v7 - 32) = 0;
      *(void *)(v7 - 24) = 0;
      *(_OWORD *)(v7 - 40) = *(_OWORD *)(a3 - 40);
      *(void *)(v7 - 24) = *(void *)(a3 - 24);
      *(void *)(a3 - 40) = 0;
      *(void *)(a3 - 32) = 0;
      *(void *)(a3 - 24) = 0;
      uint64_t v9 = *(void *)(a3 - 16);
      *(void *)(v7 - 11) = *(void *)(a3 - 11);
      *(void *)(v7 - 16) = v9;
      uint64_t v7 = *((void *)&v15 + 1) - 96;
      *((void *)&v15 + 1) -= 96;
      a3 -= 96;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *(void **)(a1[2] + 8);
  std::vector<std::pair<unsigned long, const char *>>::size_type v2 = *(void **)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      std::allocator<std::__state<char>>::destroy[abi:ne180100](v3, v1);
      v1 += 12;
    }
    while (v1 != v2);
  }
}

void std::allocator<std::__state<char>>::destroy[abi:ne180100](uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)a2[7];
  if (v3)
  {
    a2[8] = v3;
    operator delete(v3);
  }
  unint64_t v4 = (void *)a2[4];
  if (v4)
  {
    a2[5] = v4;
    operator delete(v4);
  }
}

void **std::__split_buffer<std::__state<char>>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<std::__state<char>>::clear[abi:ne180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 96;
    std::allocator<std::__state<char>>::destroy[abi:ne180100](v4, (void *)(i - 96));
  }
}

void std::vector<std::sub_match<char const*>>::__append(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __x)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  uint64_t v7 = value;
  uint64_t v9 = p_end_cap[-1].__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)v9) >> 3) >= __n)
  {
    if (__n)
    {
      long long v15 = &v9[__n];
      std::vector<std::csub_match>::size_type v16 = 24 * __n;
      do
      {
        std::pair<const char *, const char *> v17 = __x->std::pair<const char *, const char *>;
        *(void *)&v9->matched = *(void *)&__x->matched;
        v9->std::pair<const char *, const char *> = v17;
        ++v9;
        v16 -= 24;
      }
      while (v16);
      uint64_t v9 = v15;
    }
    this->__end_ = v9;
  }
  else
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (char *)this->__begin_) >> 3);
    unint64_t v11 = v10 + __n;
    if (v10 + __n > 0xAAAAAAAAAAAAAAALL) {
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (char *)this->__begin_) >> 3);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x555555555555555) {
      unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13) {
      long long v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((uint64_t)p_end_cap, v13);
    }
    else {
      long long v14 = 0;
    }
    uint64_t v18 = (std::sub_match<const char *> *)&v14[24 * v10];
    uint64_t v19 = &v18[__n];
    std::vector<std::csub_match>::size_type v20 = 24 * __n;
    std::pair<const char *, const char *> v21 = v18;
    do
    {
      std::pair<const char *, const char *> v22 = __x->std::pair<const char *, const char *>;
      v21[1].first = *(const char **)&__x->matched;
      std::pair<const char *, const char *> *v21 = v22;
      std::pair<const char *, const char *> v21 = (std::pair<const char *, const char *> *)((char *)v21 + 24);
      v20 -= 24;
    }
    while (v20);
    long long v23 = (std::sub_match<const char *> *)&v14[24 * v13];
    std::vector<std::csub_match>::pointer begin = this->__begin_;
    std::vector<std::csub_match>::pointer end = this->__end_;
    if (end != this->__begin_)
    {
      do
      {
        std::pair<const char *, const char *> v26 = end[-1].std::pair<const char *, const char *>;
        *(void *)&v18[-1].matched = *(void *)&end[-1].matched;
        v18[-1].std::pair<const char *, const char *> = v26;
        --v18;
        --end;
      }
      while (end != begin);
      std::vector<std::csub_match>::pointer end = this->__begin_;
    }
    this->__begin_ = v18;
    this->__end_ = v19;
    this->__end_cap_.__value_ = v23;
    if (end)
    {
      operator delete(end);
    }
  }
}

void std::vector<std::pair<unsigned long,char const*>>::__append(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __n)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  uint64_t v5 = value;
  uint64_t v7 = p_end_cap[-1].__value_;
  if (__n <= value - v7)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 16 * __n);
      v7 += __n;
    }
    this->__end_ = v7;
  }
  else
  {
    uint64_t v8 = (char *)v7 - (char *)this->__begin_;
    unint64_t v9 = __n + (v8 >> 4);
    if (v9 >> 60) {
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = (char *)v5 - (char *)this->__begin_;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      unint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>((uint64_t)p_end_cap, v12);
    }
    else {
      unint64_t v13 = 0;
    }
    long long v14 = (std::pair<unsigned long, const char *> *)&v13[16 * v10];
    long long v15 = (std::pair<unsigned long, const char *> *)&v13[16 * v12];
    bzero(v14, 16 * __n);
    std::vector<std::csub_match>::size_type v16 = &v14[__n];
    std::vector<std::pair<unsigned long, const char *>>::pointer begin = this->__begin_;
    std::vector<std::csub_match>::pointer end = this->__end_;
    if (end != this->__begin_)
    {
      do
      {
        v14[-1] = end[-1];
        --v14;
        --end;
      }
      while (end != begin);
      std::vector<std::csub_match>::pointer end = this->__begin_;
    }
    this->__begin_ = v14;
    this->__end_ = v16;
    this->__end_cap_.__value_ = v15;
    if (end)
    {
      operator delete(end);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

char *std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = *((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2;
      *(void *)(v7 + 16) = *((void *)a2 + 2);
      *(_OWORD *)uint64_t v7 = v8;
      v7 += 24;
      a2 = (long long *)((char *)a2 + 24);
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_2156168F8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = (_OWORD *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2++;
      *v7++ = v8;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_21561696C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3 || *a2 != 92) {
    return a2;
  }
  uint64_t v5 = a2 + 1;
  if (a2 + 1 == a3) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  }
  uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_decimal_escape<char const*>(a1, a2 + 1, a3);
  if (result == v5)
  {
    uint64_t result = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<char const*>(a1, (char *)a2 + 1, (char *)a3);
    if (result == v5)
    {
      uint64_t result = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, (std::basic_regex<char> *)(a2 + 1), (std::basic_regex<char> *)a3, 0);
      if (result == v5) {
        return a2;
      }
    }
  }
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3) {
      goto LABEL_20;
    }
    uint64_t v5 = a2[1] == 94 ? a2 + 2 : a2 + 1;
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list((std::basic_regex<char> *)a1, a2[1] == 94);
    if (v5 == a3) {
      goto LABEL_20;
    }
    uint64_t v7 = (uint64_t *)started;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v5 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)started, 93);
      ++v5;
    }
    if (v5 == a3) {
      goto LABEL_20;
    }
    do
    {
      long long v8 = v5;
      uint64_t v5 = std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<char const*>(a1, v5, a3, v7);
    }
    while (v5 != v8);
    if (v8 == a3) {
      goto LABEL_20;
    }
    if (*v8 == 45)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v7, 45);
      ++v8;
    }
    if (v8 == a3 || *v8 != 93) {
LABEL_20:
    }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
    return v8 + 1;
  }
  return a2;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(std::basic_regex<char> *this)
{
  if ((this->__flags_ & 2) == 0) {
    operator new();
  }
}

void std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(std::basic_regex<char> *this, unsigned int a2)
{
  if ((this->__flags_ & 2) == 0) {
    operator new();
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2166BEEB0](exception, 11);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_215616D60(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned char *std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(std::basic_regex<char> *a1, unsigned char *a2, unsigned char *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3)
  {
    int v4 = (char)*a2;
    BOOL v5 = (v4 - 36) > 0x3A || ((1 << (*a2 - 36)) & 0x7800000080004F1) == 0;
    if (v5 && (v4 - 123) >= 3)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v4);
      ++v3;
    }
  }
  return v3;
}

void (__cdecl ***std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }
  JUMPOUT(0x2166BF060);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2166BEEB0](exception, 3);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_215616F24(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_decimal_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    return a2;
  }
  int v4 = *a2;
  unsigned int v5 = v4 - 48;
  if (v4 == 48)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
    return a2 + 1;
  }
  if ((v4 - 49) > 8) {
    return a2;
  }
  uint64_t v6 = a3;
  uint64_t v7 = a2 + 1;
  if (a2 + 1 != a3)
  {
    while (1)
    {
      int v8 = *v7;
      if ((v8 - 48) > 9) {
        break;
      }
      if (v5 >= 0x19999999) {
        goto LABEL_16;
      }
      ++v7;
      unsigned int v5 = v8 + 10 * v5 - 48;
      if (v7 == a3) {
        goto LABEL_12;
      }
    }
    uint64_t v6 = v7;
LABEL_12:
    if (!v5) {
      goto LABEL_16;
    }
  }
  if (v5 > a1->__marked_count_) {
LABEL_16:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(a1, v5);
  return v6;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v4 = *a2;
  if (v4 > 99)
  {
    if (v4 == 119)
    {
      BOOL v5 = 0;
      goto LABEL_15;
    }
    if (v4 == 115)
    {
      BOOL v9 = 0;
      goto LABEL_17;
    }
    if (v4 != 100) {
      return v3;
    }
    BOOL v6 = 0;
LABEL_12:
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v6);
    int v8 = started->__mask_ | 0x400;
LABEL_18:
    started->__mask_ = v8;
    goto LABEL_19;
  }
  switch(v4)
  {
    case 'D':
      BOOL v6 = 1;
      goto LABEL_12;
    case 'S':
      BOOL v9 = 1;
LABEL_17:
      started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v9);
      int v8 = started->__mask_ | 0x4000;
      goto LABEL_18;
    case 'W':
      BOOL v5 = 1;
LABEL_15:
      uint64_t v10 = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v5);
      v10->__mask_ |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v10, 95);
LABEL_19:
      ++v3;
      break;
  }
  return v3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::string *a4)
{
  int v4 = this;
  if (this != a3)
  {
    int locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
    if (locale_low > 109)
    {
      char v6 = 0;
      switch(LOBYTE(this->__traits_.__loc_.__locale_))
      {
        case 'n':
          if (a4)
          {
            uint64_t v7 = a4;
            std::basic_regex<char>::value_type locale = 10;
            goto LABEL_50;
          }
          std::basic_regex<char>::value_type locale = 10;
          goto LABEL_59;
        case 'r':
          if (a4)
          {
            uint64_t v7 = a4;
            std::basic_regex<char>::value_type locale = 13;
            goto LABEL_50;
          }
          std::basic_regex<char>::value_type locale = 13;
          goto LABEL_59;
        case 't':
          if (a4)
          {
            uint64_t v7 = a4;
            std::basic_regex<char>::value_type locale = 9;
            goto LABEL_50;
          }
          std::basic_regex<char>::value_type locale = 9;
          goto LABEL_59;
        case 'u':
          if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3) {
            goto LABEL_64;
          }
          int v9 = BYTE1(this->__traits_.__loc_.__locale_);
          if ((v9 & 0xF8) != 0x30 && (v9 & 0xFE) != 0x38 && (v9 | 0x20u) - 97 >= 6) {
            goto LABEL_64;
          }
          int v4 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2);
          if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2) == a3) {
            goto LABEL_64;
          }
          int v10 = LOBYTE(v4->__traits_.__loc_.__locale_);
          char v11 = -48;
          if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38) {
            goto LABEL_24;
          }
          v10 |= 0x20u;
          if ((v10 - 97) >= 6) {
            goto LABEL_64;
          }
          char v11 = -87;
LABEL_24:
          char v6 = 16 * (v11 + v10);
LABEL_25:
          if ((std::basic_regex<char> *)((char *)&v4->__traits_.__loc_.__locale_ + 1) == a3) {
            goto LABEL_64;
          }
          int v12 = BYTE1(v4->__traits_.__loc_.__locale_);
          char v13 = -48;
          if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38) {
            goto LABEL_30;
          }
          v12 |= 0x20u;
          if ((v12 - 97) >= 6) {
            goto LABEL_64;
          }
          char v13 = -87;
LABEL_30:
          if ((std::basic_regex<char> *)((char *)&v4->__traits_.__loc_.__locale_ + 2) == a3) {
            goto LABEL_64;
          }
          int v14 = BYTE2(v4->__traits_.__loc_.__locale_);
          char v15 = -48;
          if ((v14 & 0xF8) == 0x30 || (v14 & 0xFE) == 0x38) {
            goto LABEL_35;
          }
          v14 |= 0x20u;
          if ((v14 - 97) >= 6) {
            goto LABEL_64;
          }
          char v15 = -87;
LABEL_35:
          std::string::value_type v16 = v15 + v14 + 16 * (v13 + v12 + v6);
          if (a4) {
            std::string::operator=(a4, v16);
          }
          else {
            std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v16);
          }
          return (std::basic_regex<char> *)((char *)v4 + 3);
        case 'v':
          if (a4)
          {
            uint64_t v7 = a4;
            std::basic_regex<char>::value_type locale = 11;
            goto LABEL_50;
          }
          std::basic_regex<char>::value_type locale = 11;
          break;
        case 'x':
          goto LABEL_25;
        default:
          goto LABEL_45;
      }
      goto LABEL_59;
    }
    if (locale_low == 48)
    {
      if (a4)
      {
        uint64_t v7 = a4;
        std::basic_regex<char>::value_type locale = 0;
        goto LABEL_50;
      }
      std::basic_regex<char>::value_type locale = 0;
LABEL_59:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, locale);
      return (std::basic_regex<char> *)((char *)v4 + 1);
    }
    if (locale_low != 99)
    {
      if (locale_low == 102)
      {
        if (a4)
        {
          uint64_t v7 = a4;
          std::basic_regex<char>::value_type locale = 12;
LABEL_50:
          std::string::operator=(v7, locale);
          return (std::basic_regex<char> *)((char *)v4 + 1);
        }
        std::basic_regex<char>::value_type locale = 12;
        goto LABEL_59;
      }
LABEL_45:
      if (LOBYTE(this->__traits_.__loc_.__locale_) != 95
        && ((locale_low & 0x80) != 0
         || (a1->__traits_.__ct_->__tab_[LOBYTE(this->__traits_.__loc_.__locale_)] & 0x500) == 0))
      {
        std::basic_regex<char>::value_type locale = (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_;
        if (a4)
        {
          uint64_t v7 = a4;
          goto LABEL_50;
        }
        goto LABEL_59;
      }
LABEL_64:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
    }
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3) {
      goto LABEL_64;
    }
    char v17 = BYTE1(this->__traits_.__loc_.__locale_);
    if (((v17 & 0xDF) - 65) > 0x19u) {
      goto LABEL_64;
    }
    std::string::value_type v18 = v17 & 0x1F;
    if (a4) {
      std::string::operator=(a4, v18);
    }
    else {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v18);
    }
    return (std::basic_regex<char> *)((char *)v4 + 2);
  }
  return v4;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_char(std::basic_regex<char> *this, std::basic_regex<char>::value_type __c)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags = this->__flags_;
  if ((flags & 1) == 0)
  {
    if ((flags & 8) == 0) {
      operator new();
    }
    operator new();
  }
  operator new();
}

void sub_2156174E8(_Unwind_Exception *a1)
{
  MEMORY[0x2166BF060](v1, 0x10E1C4010F5D982);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2166BEEB0](exception, 4);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_215617550(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(std::basic_regex<char> *this, int __i)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags = this->__flags_;
  if ((flags & 1) == 0)
  {
    if ((flags & 8) == 0) {
      operator new();
    }
    operator new();
  }
  operator new();
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__match_char_icase[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26C636FB0;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 40) = (*(uint64_t (**)(void, uint64_t))(**(void **)(a2 + 8) + 40))(*(void *)(a2 + 8), a3);
  return a1;
}

void sub_215617728(_Unwind_Exception *a1)
{
  std::locale::~locale(v2);
  uint64_t v4 = (uint64_t)v1[1];
  if (v4) {
    std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(v4);
  }
  _Unwind_Resume(a1);
}

std::locale *std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C636FB0;
  std::locale::~locale(a1 + 2);
  std::basic_regex<char>::value_type locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C636FB0;
  std::locale::~locale(a1 + 2);
  std::basic_regex<char>::value_type locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  JUMPOUT(0x2166BF060);
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (uint64_t v4 = result,
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(result + 24) + 40))(*(void *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    uint64_t v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(void *)(a2 + 16);
    uint64_t v5 = *(void *)(v4 + 8);
  }
  *(void *)(a2 + 80) = v5;
  return result;
}

std::locale *std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C637040;
  std::locale::~locale(a1 + 2);
  std::basic_regex<char>::value_type locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C637040;
  std::locale::~locale(a1 + 2);
  std::basic_regex<char>::value_type locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  JUMPOUT(0x2166BF060);
}

uint64_t std::__match_char_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

void (__cdecl ***std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }
  JUMPOUT(0x2166BF060);
}

uint64_t std::__match_char<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

std::locale *std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C636EC0;
  std::locale::~locale(a1 + 2);
  std::basic_regex<char>::value_type locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C636EC0;
  std::locale::~locale(a1 + 2);
  std::basic_regex<char>::value_type locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  JUMPOUT(0x2166BF060);
}

uint64_t std::__back_ref_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(unsigned char *)(v3 + 16))
  {
    uint64_t v4 = *(void *)(v3 + 8) - *(void *)v3;
    uint64_t v5 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v5 >= v4)
    {
      uint64_t v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v5 + v4;
        uint64_t v6 = *(void *)(v7 + 8);
        goto LABEL_10;
      }
      uint64_t v8 = 0;
      while (1)
      {
        int v9 = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)(*(void *)v3 + v8));
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)(*(void *)(a2 + 16) + v8));
        if (v9 != result) {
          break;
        }
        if (v4 == ++v8)
        {
          uint64_t v5 = *(void *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  uint64_t v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(void *)(a2 + 80) = v6;
  return result;
}

std::locale *std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C636F80;
  std::locale::~locale(a1 + 2);
  std::basic_regex<char>::value_type locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C636F80;
  std::locale::~locale(a1 + 2);
  std::basic_regex<char>::value_type locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  JUMPOUT(0x2166BF060);
}

uint64_t std::__back_ref_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(result + 40) - 1;
  uint64_t v3 = *(void *)(a2 + 32);
  if (*(unsigned char *)(v3 + 24 * v2 + 16))
  {
    uint64_t v4 = (unsigned __int8 **)(v3 + 24 * v2);
    uint64_t v5 = *v4;
    uint64_t v6 = v4[1] - *v4;
    uint64_t v7 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v7 + v6;
        uint64_t v8 = *(void *)(result + 8);
        goto LABEL_9;
      }
      int v9 = *(unsigned __int8 **)(a2 + 16);
      uint64_t v10 = v6;
      while (1)
      {
        int v12 = *v5++;
        int v11 = v12;
        int v13 = *v9++;
        if (v11 != v13) {
          break;
        }
        if (!--v10) {
          goto LABEL_8;
        }
      }
    }
  }
  uint64_t v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(void *)(a2 + 80) = v8;
  return result;
}

void (__cdecl ***std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unsigned int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }
  JUMPOUT(0x2166BF060);
}

unsigned int *std::__back_ref<char>::__exec(unsigned int *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) < v2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  unsigned int v5 = v2 - 1;
  if (*(unsigned char *)(v3 + 24 * v5 + 16)
    && (uint64_t v6 = result,
        uint64_t v7 = v3 + 24 * v5,
        uint64_t result = *(unsigned int **)v7,
        int64_t v8 = *(void *)(v7 + 8) - *(void *)v7,
        uint64_t v9 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v9 >= v8)
    && (uint64_t result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !result))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 16) = v9 + v8;
    uint64_t v10 = *((void *)v6 + 1);
  }
  else
  {
    uint64_t v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 80) = v10;
  return result;
}

std::__bracket_expression<char, std::regex_traits<char>> *__cdecl std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(std::basic_regex<char> *this, BOOL __negate)
{
}

void sub_21561823C(_Unwind_Exception *a1)
{
  MEMORY[0x2166BF060](v1, 0x10F1C4061CF1F02);
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    unsigned int v5 = *(unsigned char **)(a1 + 48);
    unint64_t v4 = *(void *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      uint64_t v6 = (unint64_t *)(a1 + 40);
      unint64_t v7 = *(void *)(a1 + 40);
      int64_t v8 = &v5[-v7];
      uint64_t v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        unint64_t v10 = v4 - v7;
        if (2 * v10 > v9) {
          uint64_t v9 = 2 * v10;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v11 = v9;
        }
        if (v11) {
          int v12 = operator new(v11);
        }
        else {
          int v12 = 0;
        }
        std::vector<std::csub_match>::size_type v20 = &v8[(void)v12];
        std::pair<const char *, const char *> v21 = (char *)v12 + v11;
        v8[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v8[(void)v12 + 1];
        if (v5 != (unsigned char *)v7)
        {
          std::pair<const char *, const char *> v22 = &v5[~v7];
          do
          {
            char v23 = *--v5;
            (v22--)[(void)v12] = v23;
          }
          while (v5 != (unsigned char *)v7);
LABEL_45:
          unsigned int v5 = (unsigned char *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    }
    goto LABEL_22;
  }
  uint64_t v6 = (unint64_t *)(a1 + 40);
  unsigned int v5 = *(unsigned char **)(a1 + 48);
  unint64_t v13 = *(void *)(a1 + 56);
  if (!*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      unint64_t v24 = *v6;
      v25 = &v5[-*v6];
      unint64_t v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        unint64_t v27 = v13 - v24;
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          int v12 = operator new(v28);
        }
        else {
          int v12 = 0;
        }
        std::vector<std::csub_match>::size_type v20 = &v25[(void)v12];
        std::pair<const char *, const char *> v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (unsigned char *)v24)
        {
          unsigned int v31 = &v5[~v24];
          do
          {
            char v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }
          while (v5 != (unsigned char *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *unsigned int v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13) {
    goto LABEL_22;
  }
  unint64_t v14 = *v6;
  char v15 = &v5[-*v6];
  unint64_t v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0) {
    goto LABEL_50;
  }
  unint64_t v17 = v13 - v14;
  if (2 * v17 > v16) {
    unint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v18 = v16;
  }
  if (v18) {
    int v12 = operator new(v18);
  }
  else {
    int v12 = 0;
  }
  std::vector<std::csub_match>::size_type v20 = &v15[(void)v12];
  std::pair<const char *, const char *> v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  uint64_t v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (unsigned char *)v14)
  {
    unint64_t v29 = &v5[~v14];
    do
    {
      char v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }
    while (v5 != (unsigned char *)v14);
    goto LABEL_45;
  }
LABEL_46:
  int v12 = v20;
LABEL_47:
  *(void *)(a1 + 40) = v12;
  *(void *)(a1 + 48) = v19;
  *(void *)(a1 + 56) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 48) = v19;
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  *(void *)(a1 + 8) = a3;
  size_t v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(unsigned char *)(a1 + 168) = a4;
  *(unsigned char *)(a1 + 169) = a5;
  *(unsigned char *)(a1 + 170) = a6;
  std::locale::locale(&v14, v11);
  std::locale::name(&v15, &v14);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
  {
    BOOL v12 = v15.__r_.__value_.__l.__size_ != 1 || *v15.__r_.__value_.__l.__data_ != 67;
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  else
  {
    BOOL v12 = SHIBYTE(v15.__r_.__value_.__r.__words[2]) != 1 || v15.__r_.__value_.__s.__data_[0] != 67;
  }
  std::locale::~locale(&v14);
  *(unsigned char *)(a1 + 171) = v12;
  return a1;
}

void sub_2156185F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  std::string v15 = (void *)v10[14];
  if (v15)
  {
    v10[15] = v15;
    operator delete(v15);
  }
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  unint64_t v16 = (void *)v10[8];
  if (v16)
  {
    v10[9] = v16;
    operator delete(v16);
  }
  unint64_t v17 = *v13;
  if (*v13)
  {
    v10[6] = v17;
    operator delete(v17);
  }
  std::locale::~locale(v12);
  *unint64_t v10 = v11;
  uint64_t v18 = v10[1];
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(a1);
  JUMPOUT(0x2166BF060);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__exec(const std::__bracket_expression<char, std::regex_traits<char>> *this, std::__bracket_expression<char, std::regex_traits<char>>::__state *a2)
{
  current = a2->__current_;
  last = a2->__last_;
  if (current == last)
  {
    uint64_t v37 = 0;
    BOOL negate = this->__negate_;
    goto LABEL_221;
  }
  if (!this->__might_have_digraph_ || current + 1 == last) {
    goto LABEL_58;
  }
  signed __int8 v6 = *current;
  unsigned __int8 v125 = *current;
  signed __int8 v7 = current[1];
  unsigned __int8 v126 = v7;
  if (this->__icase_)
  {
    unsigned __int8 v125 = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v6);
    unsigned __int8 v126 = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v7);
  }
  p_traits = &this->__traits_;
  std::regex_traits<char>::__lookup_collatename<char *>((uint64_t)&this->__traits_, (char *)&v125, (char *)&v127, (uint64_t)&__p);
  if ((v124 & 0x80000000) == 0)
  {
    if (v124) {
      goto LABEL_8;
    }
LABEL_58:
    BOOL negate = 0;
    uint64_t v37 = 1;
    goto LABEL_59;
  }
  size_t v38 = v123;
  operator delete(__p);
  if (!v38) {
    goto LABEL_58;
  }
LABEL_8:
  std::vector<std::pair<char, char>>::pointer begin = this->__digraphs_.__begin_;
  uint64_t v10 = (char *)this->__digraphs_.__end_ - (char *)begin;
  if (v10)
  {
    uint64_t v11 = v10 >> 1;
    if ((unint64_t)(v10 >> 1) <= 1) {
      uint64_t v11 = 1;
    }
    p_second = &begin->second;
    do
    {
      if (v125 == *(p_second - 1) && v126 == *p_second) {
        goto LABEL_218;
      }
      p_second += 2;
      --v11;
    }
    while (v11);
  }
  if (!this->__collate_ || this->__ranges_.__begin_ == this->__ranges_.__end_)
  {
    BOOL negate = 0;
  }
  else
  {
    std::regex_traits<char>::transform<char *>((uint64_t)&this->__traits_, (char *)&v125, (char *)&v127);
    std::vector<std::pair<std::string, std::string>>::pointer v14 = this->__ranges_.__begin_;
    char v15 = v124;
    int64_t v16 = (char *)this->__ranges_.__end_ - (char *)v14;
    if (v16)
    {
      uint64_t v17 = 0;
      unint64_t v18 = v16 / 48;
      char v113 = v124;
      if (v124 >= 0) {
        size_t v19 = v124;
      }
      else {
        size_t v19 = v123;
      }
      if (v124 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = __p;
      }
      if (v18 <= 1) {
        uint64_t v21 = 1;
      }
      else {
        uint64_t v21 = v16 / 48;
      }
      BOOL v22 = 1;
      while (1)
      {
        int v23 = SHIBYTE(v14->first.__r_.__value_.__r.__words[2]);
        if (v23 >= 0) {
          size_t size = HIBYTE(v14->first.__r_.__value_.__r.__words[2]);
        }
        else {
          size_t size = v14->first.__r_.__value_.__l.__size_;
        }
        if (v23 >= 0) {
          std::vector<std::pair<std::string, std::string>>::pointer v25 = v14;
        }
        else {
          std::vector<std::pair<std::string, std::string>>::pointer v25 = (std::vector<std::pair<std::string, std::string>>::pointer)v14->first.__r_.__value_.__r.__words[0];
        }
        if (size >= v19) {
          size_t v26 = v19;
        }
        else {
          size_t v26 = size;
        }
        int v27 = memcmp(p_p, v25, v26);
        BOOL v28 = v19 >= size;
        if (v27) {
          BOOL v28 = v27 >= 0;
        }
        if (v28)
        {
          int v29 = SHIBYTE(v14->second.__r_.__value_.__r.__words[2]);
          if (v29 >= 0) {
            size_t v30 = HIBYTE(v14->second.__r_.__value_.__r.__words[2]);
          }
          else {
            size_t v30 = v14->second.__r_.__value_.__l.__size_;
          }
          if (v29 >= 0) {
            data = &v14->second;
          }
          else {
            data = (std::string *)v14->second.__r_.__value_.__l.__data_;
          }
          if (v19 >= v30) {
            size_t v32 = v30;
          }
          else {
            size_t v32 = v19;
          }
          int v33 = memcmp(data, p_p, v32);
          BOOL v34 = v30 >= v19;
          if (v33) {
            BOOL v34 = v33 >= 0;
          }
          if (v34) {
            break;
          }
        }
        BOOL v22 = ++v17 < v18;
        ++v14;
        if (v21 == v17)
        {
          int v35 = 0;
          BOOL negate = 0;
          goto LABEL_162;
        }
      }
      BOOL negate = 1;
      int v35 = 5;
LABEL_162:
      p_traits = &this->__traits_;
      char v15 = v113;
    }
    else
    {
      BOOL v22 = 0;
      int v35 = 0;
      BOOL negate = 0;
    }
    if (v15 < 0) {
      operator delete(__p);
    }
    if (v22) {
      goto LABEL_195;
    }
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_) {
    goto LABEL_200;
  }
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)p_traits, (char *)&v125, (char *)&v127, (uint64_t)&__p);
  std::vector<std::string>::pointer v89 = this->__equivalences_.__begin_;
  uint64_t v90 = v124;
  int64_t v91 = (char *)this->__equivalences_.__end_ - (char *)v89;
  if (v91)
  {
    uint64_t v92 = 0;
    unint64_t v93 = v91 / 24;
    v95 = __p;
    size_t v94 = v123;
    if (v124 >= 0) {
      size_t v96 = v124;
    }
    else {
      size_t v96 = v123;
    }
    if (v93 <= 1) {
      uint64_t v97 = 1;
    }
    else {
      uint64_t v97 = v91 / 24;
    }
    BOOL v98 = 1;
    while (1)
    {
      v99 = &v89[v92];
      std::string::size_type v100 = HIBYTE(v99->__r_.__value_.__r.__words[2]);
      int v101 = (char)v100;
      if ((v100 & 0x80u) != 0) {
        std::string::size_type v100 = v99->__r_.__value_.__l.__size_;
      }
      if (v96 == v100)
      {
        if (v101 >= 0) {
          v102 = &v89[v92];
        }
        else {
          v102 = (std::string *)v99->__r_.__value_.__r.__words[0];
        }
        if ((v90 & 0x80) == 0)
        {
          if (v90)
          {
            v103 = &__p;
            uint64_t v104 = v90;
            do
            {
              if (*(unsigned __int8 *)v103 != v102->__r_.__value_.__s.__data_[0]) {
                goto LABEL_188;
              }
              v103 = (void **)((char *)v103 + 1);
              v102 = (std::string *)((char *)v102 + 1);
              --v104;
            }
            while (v104);
            BOOL negate = 1;
            int v35 = 5;
            goto LABEL_192;
          }
          BOOL negate = 1;
          if (v98) {
            goto LABEL_220;
          }
LABEL_200:
          if ((char)v125 < 0)
          {
            neg_std::regex_traits<char>::char_class_type mask = this->__neg_mask_;
            goto LABEL_213;
          }
          std::regex_traits<char>::char_class_type mask = this->__mask_;
          tab = this->__traits_.__ct_->__tab_;
          std::ctype_base::mask v108 = tab[v125];
          if ((v108 & mask) == 0 && (v125 != 95 || (mask & 0x80) == 0)
            || (char)v126 < 0
            || (tab[v126] & mask) == 0 && ((mask & 0x80) == 0 || v126 != 95))
          {
            neg_std::regex_traits<char>::char_class_type mask = this->__neg_mask_;
            if ((v108 & neg_mask) != 0 || v125 == 95 && (neg_mask & 0x80) != 0)
            {
LABEL_217:
              int v110 = negate;
              goto LABEL_219;
            }
LABEL_213:
            if (((char)v126 & 0x80000000) == 0)
            {
              if ((this->__traits_.__ct_->__tab_[v126] & neg_mask) != 0) {
                goto LABEL_217;
              }
              int v110 = 1;
              if (v126 == 95 && (neg_mask & 0x80) != 0) {
                goto LABEL_217;
              }
LABEL_219:
              BOOL negate = v110;
LABEL_220:
              uint64_t v37 = 2;
              goto LABEL_221;
            }
          }
LABEL_218:
          int v110 = 1;
          goto LABEL_219;
        }
        unint64_t v118 = v93;
        uint64_t v121 = v90;
        int v105 = memcmp(v95, v102, v94);
        unint64_t v93 = v118;
        uint64_t v90 = v121;
        if (!v105) {
          break;
        }
      }
LABEL_188:
      BOOL v98 = ++v92 < v93;
      if (v92 == v97) {
        goto LABEL_191;
      }
    }
    int v35 = 5;
    BOOL negate = 1;
    goto LABEL_193;
  }
  BOOL v98 = 0;
LABEL_191:
  int v35 = 0;
LABEL_192:
  if ((v90 & 0x80) != 0) {
LABEL_193:
  }
    operator delete(__p);
  if (!v98) {
    goto LABEL_200;
  }
LABEL_195:
  if (v35) {
    goto LABEL_220;
  }
  uint64_t v37 = 2;
LABEL_59:
  unsigned __int8 v39 = *a2->__current_;
  unsigned __int8 v125 = v39;
  if (this->__icase_)
  {
    unsigned __int8 v39 = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, (char)v39);
    unsigned __int8 v125 = v39;
  }
  std::vector<char>::pointer v40 = this->__chars_.__begin_;
  unint64_t v41 = this->__chars_.__end_ - v40;
  if (v41)
  {
    if (v41 <= 1) {
      unint64_t v41 = 1;
    }
    while (1)
    {
      int v42 = *v40++;
      if (v42 == v39) {
        break;
      }
      if (!--v41) {
        goto LABEL_66;
      }
    }
LABEL_77:
    BOOL negate = 1;
    goto LABEL_221;
  }
LABEL_66:
  std::regex_traits<char>::char_class_type v43 = this->__neg_mask_;
  if (v43 || this->__neg_chars_.__begin_ != this->__neg_chars_.__end_)
  {
    if ((v39 & 0x80) != 0 || (this->__traits_.__ct_->__tab_[v39] & v43) == 0) {
      int v44 = (v39 == 95) & (v43 >> 7);
    }
    else {
      LOBYTE(v44) = 1;
    }
    std::vector<char>::pointer end = this->__neg_chars_.__end_;
    std::vector<char>::pointer v46 = (std::vector<char>::pointer)memchr(this->__neg_chars_.__begin_, (char)v39, end - this->__neg_chars_.__begin_);
    v47 = v46 ? v46 : end;
    if ((v44 & 1) == 0 && v47 == end) {
      goto LABEL_77;
    }
  }
  std::vector<std::pair<std::string, std::string>>::pointer v49 = this->__ranges_.__begin_;
  std::vector<std::pair<std::string, std::string>>::pointer v48 = this->__ranges_.__end_;
  if (v49 != v48)
  {
    if (this->__collate_)
    {
      std::regex_traits<char>::transform<char *>((uint64_t)&this->__traits_, (char *)&v125, (char *)&v126);
      std::vector<std::pair<std::string, std::string>>::pointer v49 = this->__ranges_.__begin_;
      std::vector<std::pair<std::string, std::string>>::pointer v48 = this->__ranges_.__end_;
    }
    else
    {
      char v124 = 1;
      LOWORD(__p) = v39;
    }
    int64_t v50 = (char *)v48 - (char *)v49;
    if (v50)
    {
      uint64_t v119 = v37;
      BOOL v116 = negate;
      uint64_t v51 = 0;
      unint64_t v52 = v50 / 48;
      char v114 = v124;
      if (v124 >= 0) {
        size_t v53 = v124;
      }
      else {
        size_t v53 = v123;
      }
      if (v124 >= 0) {
        v54 = &__p;
      }
      else {
        v54 = __p;
      }
      if (v52 <= 1) {
        uint64_t v55 = 1;
      }
      else {
        uint64_t v55 = v50 / 48;
      }
      BOOL v56 = 1;
      while (1)
      {
        int v57 = SHIBYTE(v49->first.__r_.__value_.__r.__words[2]);
        if (v57 >= 0) {
          size_t v58 = HIBYTE(v49->first.__r_.__value_.__r.__words[2]);
        }
        else {
          size_t v58 = v49->first.__r_.__value_.__l.__size_;
        }
        if (v57 >= 0) {
          std::vector<std::pair<std::string, std::string>>::pointer v59 = v49;
        }
        else {
          std::vector<std::pair<std::string, std::string>>::pointer v59 = (std::vector<std::pair<std::string, std::string>>::pointer)v49->first.__r_.__value_.__r.__words[0];
        }
        if (v58 >= v53) {
          size_t v60 = v53;
        }
        else {
          size_t v60 = v58;
        }
        int v61 = memcmp(v54, v59, v60);
        BOOL v62 = v53 >= v58;
        if (v61) {
          BOOL v62 = v61 >= 0;
        }
        if (v62)
        {
          int v63 = SHIBYTE(v49->second.__r_.__value_.__r.__words[2]);
          if (v63 >= 0) {
            size_t v64 = HIBYTE(v49->second.__r_.__value_.__r.__words[2]);
          }
          else {
            size_t v64 = v49->second.__r_.__value_.__l.__size_;
          }
          if (v63 >= 0) {
            v65 = &v49->second;
          }
          else {
            v65 = (std::string *)v49->second.__r_.__value_.__l.__data_;
          }
          if (v53 >= v64) {
            size_t v66 = v64;
          }
          else {
            size_t v66 = v53;
          }
          int v67 = memcmp(v65, v54, v66);
          BOOL v68 = v64 >= v53;
          if (v67) {
            BOOL v68 = v67 >= 0;
          }
          if (v68) {
            break;
          }
        }
        BOOL v56 = ++v51 < v52;
        ++v49;
        if (v55 == v51)
        {
          BOOL negate = v116;
          goto LABEL_123;
        }
      }
      BOOL negate = 1;
LABEL_123:
      uint64_t v37 = v119;
      if ((v114 & 0x80) == 0) {
        goto LABEL_125;
      }
    }
    else
    {
      BOOL v56 = 0;
      if ((v124 & 0x80) == 0) {
        goto LABEL_125;
      }
    }
    operator delete(__p);
LABEL_125:
    if (v56) {
      goto LABEL_221;
    }
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_) {
    goto LABEL_154;
  }
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)&this->__traits_, (char *)&v125, (char *)&v126, (uint64_t)&__p);
  std::vector<std::string>::pointer v69 = this->__equivalences_.__begin_;
  uint64_t v70 = v124;
  int64_t v71 = (char *)this->__equivalences_.__end_ - (char *)v69;
  if (v71)
  {
    uint64_t v120 = v37;
    uint64_t v72 = 0;
    unint64_t v73 = v71 / 24;
    v74 = __p;
    size_t v75 = v123;
    if (v124 >= 0) {
      size_t v76 = v124;
    }
    else {
      size_t v76 = v123;
    }
    if (v73 <= 1) {
      uint64_t v77 = 1;
    }
    else {
      uint64_t v77 = v71 / 24;
    }
    BOOL v78 = 1;
    while (1)
    {
      v79 = &v69[v72];
      std::string::size_type v80 = HIBYTE(v79->__r_.__value_.__r.__words[2]);
      int v81 = (char)v80;
      if ((v80 & 0x80u) != 0) {
        std::string::size_type v80 = v79->__r_.__value_.__l.__size_;
      }
      if (v76 == v80)
      {
        if (v81 >= 0) {
          v82 = &v69[v72];
        }
        else {
          v82 = (std::string *)v79->__r_.__value_.__r.__words[0];
        }
        if ((v70 & 0x80) != 0)
        {
          BOOL v117 = negate;
          unint64_t v85 = v73;
          uint64_t v115 = v77;
          int v86 = memcmp(v74, v82, v75);
          uint64_t v77 = v115;
          unint64_t v73 = v85;
          BOOL negate = v117;
          if (!v86)
          {
            BOOL negate = 1;
            uint64_t v37 = v120;
            goto LABEL_152;
          }
        }
        else
        {
          if (!v70)
          {
            BOOL negate = 1;
            uint64_t v37 = v120;
            if (!v78) {
              goto LABEL_154;
            }
            goto LABEL_221;
          }
          v83 = &__p;
          uint64_t v84 = v70;
          while (*(unsigned __int8 *)v83 == v82->__r_.__value_.__s.__data_[0])
          {
            v83 = (void **)((char *)v83 + 1);
            v82 = (std::string *)((char *)v82 + 1);
            if (!--v84)
            {
              BOOL negate = 1;
              goto LABEL_149;
            }
          }
        }
      }
      BOOL v78 = ++v72 < v73;
      if (v72 == v77)
      {
LABEL_149:
        uint64_t v37 = v120;
        if ((v70 & 0x80) == 0) {
          goto LABEL_153;
        }
        goto LABEL_152;
      }
    }
  }
  BOOL v78 = 0;
  if (v124 < 0) {
LABEL_152:
  }
    operator delete(__p);
LABEL_153:
  if (!v78)
  {
LABEL_154:
    if ((char)v125 < 0) {
      goto LABEL_221;
    }
    std::regex_traits<char>::char_class_type v87 = this->__mask_;
    if ((this->__traits_.__ct_->__tab_[v125] & v87) == 0)
    {
      int v88 = (v87 >> 7) & 1;
      if (v125 != 95) {
        int v88 = 0;
      }
      if (v88 != 1) {
        goto LABEL_221;
      }
    }
    goto LABEL_77;
  }
LABEL_221:
  if (negate == this->__negate_)
  {
    first = 0;
    int v112 = -993;
  }
  else
  {
    a2->__current_ += v37;
    first = this->__first_;
    int v112 = -995;
  }
  a2->__do_ = v112;
  a2->__node_ = first;
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  char v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unsigned int v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

std::locale *std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  signed __int8 v7 = a1 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  std::basic_regex<char>::value_type locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  signed __int8 v7 = a1 + 11;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  uint64_t v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  uint64_t v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  unsigned int v5 = a1[1].__locale_;
  if (v5) {
    (*(void (**)(std::locale::__imp *))(*(void *)v5 + 8))(v5);
  }
  return a1;
}

void std::regex_traits<char>::transform<char *>(uint64_t a1, char *a2, char *a3)
{
  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  unint64_t v4 = v7;
  if ((v7 & 0x80u) == 0) {
    unsigned int v5 = __p;
  }
  else {
    unsigned int v5 = (void **)__p[0];
  }
  if ((v7 & 0x80u) != 0) {
    unint64_t v4 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_215619288(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__lookup_collatename<char *>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string::__init_with_size[abi:ne180100]<char *,char *>(&__s, a2, a3, a3 - a2);
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&__s.__r_.__value_.__s + 23)) {
      return;
    }
    p_s = &__s;
  }
  std::__get_collation_name(&v11, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v11.__r_.__value_.__l.__data_;
  unint64_t v7 = v11.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v11.__r_.__value_.__l + 2);
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8) {
    goto LABEL_9;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
  }
  else if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
  {
    return;
  }
  (*(void (**)(std::string *__return_ptr))(**(void **)(a1 + 16) + 32))(&v11);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(std::string *)a4 = v11;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    int v9 = *(unsigned __int8 *)(a4 + 23);
    if (v9 != 12 && v9 != 1)
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)(a4 + 8);
  if (v10 == 1 || v10 == 12)
  {
LABEL_23:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(unsigned char **)a4 = 0;
  *(void *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

void sub_215619420(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::__init_with_size[abi:ne180100]<char *,char *>(void *result, char *a2, char *a3, unint64_t a4)
{
  unint64_t v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *unint64_t v4 = result;
    unint64_t v4 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)unint64_t v4 = v10;
    unint64_t v4 = (void *)((char *)v4 + 1);
  }
  *(unsigned char *)unint64_t v4 = 0;
  return result;
}

void std::regex_traits<char>::__transform_primary<char *>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    unint64_t v7 = __p;
  }
  else {
    unint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v7, (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a4 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        char v10 = (unsigned char *)a4;
      }
      else {
        char v10 = *(unsigned char **)a4;
      }
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(unsigned char **)a4 = 0;
      *(void *)(a4 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
}

void sub_2156195F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2166BEEB0](exception, 5);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_215619650(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned char *std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<char const*>(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  unint64_t v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  int v5 = *a2;
  if (v5 == 93) {
    return v4;
  }
  uint64_t v6 = (uint64_t)a4;
  memset(&v26, 0, sizeof(v26));
  if (a2 + 1 == a3 || v5 != 91)
  {
LABEL_9:
    int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
    goto LABEL_10;
  }
  int v9 = a2[1];
  if (v9 != 46)
  {
    if (v9 == 58)
    {
      uint64_t v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_class<char const*>(a1, a2 + 2, a3, (uint64_t)a4);
      goto LABEL_34;
    }
    if (v9 == 61)
    {
      uint64_t v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<char const*>(a1, a2 + 2, a3, a4);
LABEL_34:
      uint64_t v6 = v10;
      char v20 = 0;
      goto LABEL_38;
    }
    goto LABEL_9;
  }
  uint64_t v18 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(a1, a2 + 2, a3, (uint64_t)&v26);
  unint64_t v4 = (unsigned char *)v18;
  int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  std::string::size_type size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v26.__r_.__value_.__l.__size_;
  }
  std::vector<std::pair<std::string, std::string>>::pointer v14 = (char *)v18;
  if (!size)
  {
LABEL_10:
    if ((v11 | 0x40) == 0x40)
    {
      int v12 = *v4;
      if (v12 == 92)
      {
        unint64_t v13 = v4 + 1;
        if (v11)
        {
          std::vector<std::pair<std::string, std::string>>::pointer v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v13, a3, &v26);
        }
        else
        {
          std::vector<std::pair<std::string, std::string>>::pointer v14 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)v13, (std::basic_regex<char> *)a3, &v26, v6);
          int v11 = 0;
        }
        goto LABEL_16;
      }
    }
    else
    {
      LOBYTE(v12) = *v4;
    }
    std::string::operator=(&v26, v12);
    std::vector<std::pair<std::string, std::string>>::pointer v14 = v4 + 1;
  }
LABEL_16:
  if (v14 == a3
    || (int v15 = *v14, v15 == 93)
    || (int64_t v16 = v14 + 1, v14 + 1 == a3)
    || v15 != 45
    || *v16 == 93)
  {
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v26.__r_.__value_.__l.__size_)
      {
        if (v26.__r_.__value_.__l.__size_ != 1)
        {
          uint64_t v17 = (std::string *)v26.__r_.__value_.__r.__words[0];
LABEL_36:
          std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](v6, v17->__r_.__value_.__s.__data_[0], v17->__r_.__value_.__s.__data_[1]);
          goto LABEL_37;
        }
        uint64_t v17 = (std::string *)v26.__r_.__value_.__r.__words[0];
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)&v26.__r_.__value_.__s + 23))
    {
      uint64_t v17 = &v26;
      if (HIBYTE(v26.__r_.__value_.__r.__words[2]) != 1) {
        goto LABEL_36;
      }
LABEL_28:
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](v6, v17->__r_.__value_.__s.__data_[0]);
    }
LABEL_37:
    char v20 = 1;
    unint64_t v4 = v14;
    goto LABEL_38;
  }
  memset(&v25, 0, sizeof(v25));
  unint64_t v4 = v14 + 2;
  if (v14 + 2 != a3 && *v16 == 91 && *v4 == 46)
  {
    uint64_t v22 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(a1, v14 + 3, a3, (uint64_t)&v25);
LABEL_55:
    unint64_t v4 = (unsigned char *)v22;
    goto LABEL_56;
  }
  if ((v11 | 0x40) == 0x40)
  {
    LODWORD(v16) = *v16;
    if (v16 == 92)
    {
      if (v11) {
        uint64_t v22 = (uint64_t)std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v14 + 2, a3, &v25);
      }
      else {
        uint64_t v22 = (uint64_t)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)(v14 + 2), (std::basic_regex<char> *)a3, &v25, v6);
      }
      goto LABEL_55;
    }
  }
  else
  {
    LOBYTE(v16) = *v16;
  }
  std::string::operator=(&v25, (std::string::value_type)v16);
LABEL_56:
  std::string v24 = v26;
  memset(&v26, 0, sizeof(v26));
  std::string __p = v25;
  memset(&v25, 0, sizeof(v25));
  std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100](v6, (char *)&v24, (char *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
  char v20 = 1;
LABEL_38:
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  if (v20) {
    return v4;
  }
  return (unsigned char *)v6;
}

void sub_2156199B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  if (*(char *)(v28 - 49) < 0) {
    operator delete(*(void **)(v28 - 72));
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<char const*>(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_33;
  }
  for (uint64_t i = 0; a2[i] != 61 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_33;
    }
  }
  if (&a2[i] == a3) {
LABEL_33:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<char const*>(a1, a2, &a2[i], (uint64_t)&v17);
  if (((char)v19 & 0x80000000) == 0)
  {
    uint64_t v8 = v19;
    if (v19)
    {
      int v9 = (char *)&v17;
      goto LABEL_14;
    }
LABEL_34:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  uint64_t v8 = v18;
  if (!v18) {
    goto LABEL_34;
  }
  int v9 = (char *)v17;
LABEL_14:
  std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(a1, v9, &v9[v8], (uint64_t)__p);
  unint64_t v10 = v16;
  if ((v16 & 0x80u) != 0) {
    unint64_t v10 = (unint64_t)__p[1];
  }
  if (v10)
  {
    std::__bracket_expression<char,std::regex_traits<char>>::__add_equivalence[abi:ne180100](a4, (long long *)__p);
  }
  else
  {
    uint64_t v11 = v19;
    if ((v19 & 0x80u) != 0) {
      uint64_t v11 = v18;
    }
    if (v11 == 2)
    {
      unint64_t v13 = (char *)&v17;
      if ((v19 & 0x80u) != 0) {
        unint64_t v13 = (char *)v17;
      }
      std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)a4, *v13, v13[1]);
    }
    else
    {
      if (v11 != 1) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
      }
      int v12 = (char *)&v17;
      if ((v19 & 0x80u) != 0) {
        int v12 = (char *)v17;
      }
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)a4, *v12);
    }
  }
  if ((char)v16 < 0) {
    operator delete(__p[0]);
  }
  if ((char)v19 < 0) {
    operator delete(v17);
  }
  return (uint64_t)&a2[i + 2];
}

void sub_215619BBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__parse_character_class<char const*>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_11;
  }
  for (uint64_t i = 0; a2[i] != 58 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_11;
    }
  }
  if (&a2[i] == a3) {
LABEL_11:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  int v7 = std::regex_traits<char>::__lookup_classname<char const*>(a1, a2, &a2[i], *(unsigned char *)(a1 + 24) & 1);
  if (!v7) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
  }
  *(_DWORD *)(a4 + 160) |= v7;
  return (uint64_t)&a2[i + 2];
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_15;
  }
  for (uint64_t i = 0; a2[i] != 46 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_15;
    }
  }
  if (&a2[i] == a3) {
LABEL_15:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<char const*>(a1, a2, &a2[i], (uint64_t)&v10);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(_OWORD *)a4 = v10;
  unint64_t v7 = v11;
  *(void *)(a4 + 16) = v11;
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 - 1 >= 2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  return (uint64_t)&a2[i + 2];
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::string *a4, uint64_t a5)
{
  if (this == a3) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  }
  int locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low > 97)
  {
    if (locale_low > 114)
    {
      if (locale_low != 115)
      {
        if (locale_low != 119) {
          goto LABEL_25;
        }
        *(_DWORD *)(a5 + 160) |= 0x500u;
        std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
        return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (locale_low == 98)
      {
        long long v10 = a4;
        std::string::value_type v9 = 8;
LABEL_19:
        std::string::operator=(v10, v9);
        return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      }
      if (locale_low != 100) {
        goto LABEL_25;
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 160) = v8;
    return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
  }
  if (locale_low <= 82)
  {
    if (LOBYTE(this->__traits_.__loc_.__locale_))
    {
      if (locale_low == 68)
      {
        int v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_21:
        *(_DWORD *)(a5 + 164) = v7;
        return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      }
      goto LABEL_25;
    }
    std::string::value_type v9 = 0;
    long long v10 = a4;
    goto LABEL_19;
  }
  if (locale_low == 83)
  {
    int v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_21;
  }
  if (locale_low == 87)
  {
    *(_DWORD *)(a5 + 164) |= 0x500u;
    std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](a5, 95);
    return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
  }
LABEL_25:
  return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, this, a3, a4);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>(std::basic_regex<char> *a1, char *a2, char *a3, std::string *this)
{
  if (a2 == a3) {
LABEL_52:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  int v5 = *a2;
  if (v5 > 97)
  {
    switch(v5)
    {
      case 'n':
        if (this)
        {
          uint64_t v6 = this;
          LOBYTE(v5) = 10;
          goto LABEL_16;
        }
        LOBYTE(v5) = 10;
        goto LABEL_49;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_21;
      case 'r':
        if (this)
        {
          uint64_t v6 = this;
          LOBYTE(v5) = 13;
          goto LABEL_16;
        }
        LOBYTE(v5) = 13;
        goto LABEL_49;
      case 't':
        if (this)
        {
          uint64_t v6 = this;
          LOBYTE(v5) = 9;
          goto LABEL_16;
        }
        LOBYTE(v5) = 9;
        goto LABEL_49;
      case 'v':
        if (this)
        {
          uint64_t v6 = this;
          LOBYTE(v5) = 11;
          goto LABEL_16;
        }
        LOBYTE(v5) = 11;
        goto LABEL_49;
      default:
        if (v5 == 98)
        {
          if (this)
          {
            uint64_t v6 = this;
            LOBYTE(v5) = 8;
            goto LABEL_16;
          }
          LOBYTE(v5) = 8;
        }
        else
        {
          if (v5 != 102) {
            goto LABEL_21;
          }
          if (this)
          {
            uint64_t v6 = this;
            LOBYTE(v5) = 12;
            goto LABEL_16;
          }
          LOBYTE(v5) = 12;
        }
        break;
    }
    goto LABEL_49;
  }
  if (v5 > 91)
  {
    if (v5 != 92)
    {
      if (v5 != 97) {
        goto LABEL_21;
      }
      if (this)
      {
        uint64_t v6 = this;
        LOBYTE(v5) = 7;
LABEL_16:
        std::string::operator=(v6, v5);
        return a2 + 1;
      }
      LOBYTE(v5) = 7;
LABEL_49:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
      return a2 + 1;
    }
LABEL_14:
    if (this)
    {
      uint64_t v6 = this;
      goto LABEL_16;
    }
    goto LABEL_49;
  }
  if (v5 == 34 || v5 == 47) {
    goto LABEL_14;
  }
LABEL_21:
  if ((v5 & 0xFFFFFFF8) != 0x30) {
    goto LABEL_52;
  }
  std::string::value_type v7 = v5 - 48;
  int v8 = a2 + 1;
  if (a2 + 1 != a3)
  {
    if ((*v8 & 0xF8) != 0x30) {
      goto LABEL_39;
    }
    std::string::value_type v7 = *v8 + 8 * v7 - 48;
    if (a2 + 2 != a3)
    {
      char v9 = a2[2];
      int v10 = v9 & 0xF8;
      std::string::value_type v11 = v9 + 8 * v7 - 48;
      if (v10 == 48) {
        int v8 = a2 + 3;
      }
      else {
        int v8 = a2 + 2;
      }
      if (v10 == 48) {
        std::string::value_type v7 = v11;
      }
      goto LABEL_39;
    }
  }
  int v8 = a3;
LABEL_39:
  if (this) {
    std::string::operator=(this, v7);
  }
  else {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
  }
  return v8;
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100](uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a3;
  unint64_t v4 = a2;
  if (*(unsigned char *)(a1 + 170))
  {
    if (*(unsigned char *)(a1 + 169))
    {
      for (unint64_t i = 0; ; ++i)
      {
        unint64_t v7 = v4[23] < 0 ? *((void *)v4 + 1) : v4[23];
        if (i >= v7) {
          break;
        }
        int v8 = v4;
        if (v4[23] < 0) {
          int v8 = *(char **)v4;
        }
        char v9 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v8[i]);
        int v10 = v4;
        if (v4[23] < 0) {
          int v10 = *(char **)v4;
        }
        v10[i] = v9;
      }
      for (unint64_t j = 0; ; ++j)
      {
        unint64_t v12 = v3[23] < 0 ? *((void *)v3 + 1) : v3[23];
        if (j >= v12) {
          break;
        }
        unint64_t v13 = v3;
        if (v3[23] < 0) {
          unint64_t v13 = *(char **)v3;
        }
        char v14 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v13[j]);
        int v15 = v3;
        if (v3[23] < 0) {
          int v15 = *(char **)v3;
        }
        v15[j] = v14;
      }
    }
    else
    {
      for (unint64_t k = 0; ; ++k)
      {
        unint64_t v18 = a2[23] < 0 ? *((void *)a2 + 1) : a2[23];
        if (k >= v18) {
          break;
        }
        unsigned __int8 v19 = a2;
        if (a2[23] < 0) {
          unsigned __int8 v19 = *(char **)a2;
        }
        char v20 = a2;
        if (a2[23] < 0) {
          char v20 = *(char **)a2;
        }
        v20[k] = v19[k];
      }
      for (unint64_t m = 0; ; ++m)
      {
        unint64_t v22 = a3[23] < 0 ? *((void *)a3 + 1) : a3[23];
        if (m >= v22) {
          break;
        }
        int v23 = a3;
        if (a3[23] < 0) {
          int v23 = *(char **)a3;
        }
        std::string v24 = a3;
        if (a3[23] < 0) {
          std::string v24 = *(char **)a3;
        }
        v24[m] = v23[m];
      }
    }
    if (v4[23] < 0)
    {
      std::string v26 = v4;
      unint64_t v4 = *(char **)v4;
      uint64_t v25 = *((void *)v26 + 1);
    }
    else
    {
      uint64_t v25 = v4[23];
    }
    std::regex_traits<char>::transform<std::__wrap_iter<char *>>(a1 + 16, v4, &v4[v25]);
    if (v3[23] < 0)
    {
      uint64_t v28 = v3;
      uint64_t v3 = *(char **)v3;
      uint64_t v27 = *((void *)v28 + 1);
    }
    else
    {
      uint64_t v27 = v3[23];
    }
    std::regex_traits<char>::transform<std::__wrap_iter<char *>>(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)std::vector<char>::pointer v40 = v38;
    uint64_t v41 = v39;
    *(_OWORD *)std::string __p = *(_OWORD *)v36;
    uint64_t v43 = v37;
    std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100]((std::vector<std::pair<std::string, std::string>> *)(a1 + 88), (long long *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }
  else
  {
    if (a2[23] < 0) {
      uint64_t v16 = *((void *)a2 + 1);
    }
    else {
      uint64_t v16 = a2[23];
    }
    if (v16 != 1 || (a3[23] < 0 ? (uint64_t v29 = *((void *)a3 + 1)) : (uint64_t v29 = a3[23]), v29 != 1)) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>();
    }
    if (*(unsigned char *)(a1 + 169))
    {
      size_t v30 = a2;
      if (a2[23] < 0) {
        size_t v30 = *(char **)a2;
      }
      char v31 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v30);
      size_t v32 = v4;
      if (v4[23] < 0) {
        size_t v32 = *(unsigned char **)v4;
      }
      *size_t v32 = v31;
      int v33 = v3;
      if (v3[23] < 0) {
        int v33 = *(char **)v3;
      }
      char v34 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v33);
      int v35 = v3;
      if (v3[23] < 0) {
        int v35 = *(unsigned char **)v3;
      }
      unsigned char *v35 = v34;
    }
    *(_OWORD *)std::vector<char>::pointer v40 = *(_OWORD *)v4;
    uint64_t v41 = *((void *)v4 + 2);
    *((void *)v4 + 1) = 0;
    *((void *)v4 + 2) = 0;
    *(void *)unint64_t v4 = 0;
    *(_OWORD *)std::string __p = *(_OWORD *)v3;
    uint64_t v43 = *((void *)v3 + 2);
    *(void *)uint64_t v3 = 0;
    *((void *)v3 + 1) = 0;
    *((void *)v3 + 2) = 0;
    std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100]((std::vector<std::pair<std::string, std::string>> *)(a1 + 88), (long long *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }
}

void sub_21561A4C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21)
{
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a1 + 169))
  {
    uint64_t v18 = a1 + 128;
    unint64_t v19 = *(void *)(a1 + 128);
    int v10 = (char **)(a1 + 112);
    __int16 v8 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    char v9 = *(_WORD **)(a1 + 120);
    if (*(unsigned char *)(a1 + 170))
    {
      if ((unint64_t)v9 < v19) {
        goto LABEL_24;
      }
      uint64_t v20 = (char *)v9 - *v10;
      if (v20 > -3)
      {
        uint64_t v21 = v20 >> 1;
        unint64_t v22 = v19 - (void)*v10;
        if (v22 <= (v20 >> 1) + 1) {
          unint64_t v23 = v21 + 1;
        }
        else {
          unint64_t v23 = v22;
        }
        if (v22 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v24 = v23;
        }
        if (v24) {
          uint64_t v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v18, v24);
        }
        else {
          uint64_t v25 = 0;
        }
        uint64_t v27 = &v25[2 * v21];
        uint64_t v28 = &v25[2 * v24];
        *(_WORD *)uint64_t v27 = v8;
        std::string v26 = v27 + 2;
        long long v38 = *(char **)(a1 + 112);
        uint64_t v29 = *(char **)(a1 + 120);
        if (v29 == v38) {
          goto LABEL_46;
        }
        do
        {
          __int16 v39 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v39;
          v27 -= 2;
        }
        while (v29 != v38);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v9 < v19) {
        goto LABEL_24;
      }
      uint64_t v32 = (char *)v9 - *v10;
      if (v32 > -3)
      {
        uint64_t v33 = v32 >> 1;
        unint64_t v34 = v19 - (void)*v10;
        if (v34 <= (v32 >> 1) + 1) {
          unint64_t v35 = v33 + 1;
        }
        else {
          unint64_t v35 = v34;
        }
        if (v34 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v36 = v35;
        }
        if (v36) {
          uint64_t v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v18, v36);
        }
        else {
          uint64_t v37 = 0;
        }
        uint64_t v27 = &v37[2 * v33];
        uint64_t v28 = &v37[2 * v36];
        *(_WORD *)uint64_t v27 = v8;
        std::string v26 = v27 + 2;
        std::vector<char>::pointer v40 = *(char **)(a1 + 112);
        uint64_t v29 = *(char **)(a1 + 120);
        if (v29 == v40) {
          goto LABEL_46;
        }
        do
        {
          __int16 v41 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v41;
          v27 -= 2;
        }
        while (v29 != v40);
        goto LABEL_45;
      }
    }
LABEL_49:
    std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
  }
  unsigned __int8 v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
  __int16 v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a3);
  unint64_t v7 = *(void *)(a1 + 128);
  __int16 v8 = v5 | (unsigned __int16)(v6 << 8);
  char v9 = *(_WORD **)(a1 + 120);
  if ((unint64_t)v9 < v7)
  {
LABEL_24:
    *char v9 = v8;
    std::string v26 = v9 + 1;
    goto LABEL_48;
  }
  int v10 = (char **)(a1 + 112);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v12 = (uint64_t)v9 - v11;
  if ((uint64_t)v9 - v11 <= -3) {
    goto LABEL_49;
  }
  uint64_t v13 = v12 >> 1;
  unint64_t v14 = v7 - v11;
  if (v14 <= (v12 >> 1) + 1) {
    unint64_t v15 = v13 + 1;
  }
  else {
    unint64_t v15 = v14;
  }
  if (v14 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v16 = v15;
  }
  if (v16) {
    uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(a1 + 128, v16);
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v27 = &v17[2 * v13];
  uint64_t v28 = &v17[2 * v16];
  *(_WORD *)uint64_t v27 = v8;
  std::string v26 = v27 + 2;
  size_t v30 = *(char **)(a1 + 112);
  uint64_t v29 = *(char **)(a1 + 120);
  if (v29 == v30) {
    goto LABEL_46;
  }
  do
  {
    __int16 v31 = *((_WORD *)v29 - 1);
    v29 -= 2;
    *((_WORD *)v27 - 1) = v31;
    v27 -= 2;
  }
  while (v29 != v30);
LABEL_45:
  uint64_t v29 = *v10;
LABEL_46:
  *(void *)(a1 + 112) = v27;
  *(void *)(a1 + 120) = v26;
  *(void *)(a1 + 128) = v28;
  if (v29) {
    operator delete(v29);
  }
LABEL_48:
  *(void *)(a1 + 120) = v26;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2166BEEB0](exception, 1);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21561A7AC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__add_equivalence[abi:ne180100](uint64_t *a1, long long *a2)
{
  uint64_t v3 = a1 + 17;
  unint64_t v4 = a1[18];
  if (v4 >= a1[19])
  {
    uint64_t result = std::vector<std::string>::__push_back_slow_path<std::string const&>(v3, a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v3, a2);
    uint64_t result = v4 + 24;
  }
  a1[18] = result;
  return result;
}

void std::regex_traits<char>::__lookup_collatename<char const*>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string::__init_with_size[abi:ne180100]<char *,char *>(&__s, a2, a3, a3 - a2);
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&__s.__r_.__value_.__s + 23)) {
      return;
    }
    p_s = &__s;
  }
  std::__get_collation_name(&v11, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v11.__r_.__value_.__l.__data_;
  unint64_t v7 = v11.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v11.__r_.__value_.__l + 2);
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8) {
    goto LABEL_9;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
  }
  else if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
  {
    return;
  }
  (*(void (**)(std::string *__return_ptr))(**(void **)(a1 + 16) + 32))(&v11);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(std::string *)a4 = v11;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    int v9 = *(unsigned __int8 *)(a4 + 23);
    if (v9 != 12 && v9 != 1)
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)(a4 + 8);
  if (v10 == 1 || v10 == 12)
  {
LABEL_23:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(unsigned char **)a4 = 0;
  *(void *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

void sub_21561A980(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    unint64_t v7 = __p;
  }
  else {
    unint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v7, (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a4 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        uint64_t v10 = (unsigned char *)a4;
      }
      else {
        uint64_t v10 = *(unsigned char **)a4;
      }
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(unsigned char **)a4 = 0;
      *(void *)(a4 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
}

void sub_21561AAA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, long long *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }
  *(void *)(a1 + 8) = v3 + 24;
}

void sub_21561AB1C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    uint64_t v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  std::__split_buffer<std::string>::pointer end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    std::__split_buffer<std::string>::pointer end = __v.__end_;
  }
  else
  {
    long long v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_21561AC34(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  unint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    unint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    unint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  std::vector<std::pair<char, char>>::pointer begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2166BEEB0](exception, 2);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21561AF54(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::regex_traits<char>::__lookup_classname<char const*>(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    uint64_t v7 = __p;
  }
  else {
    uint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 8) + 48))(*(void *)(a1 + 8), v7, (char *)v7 + v6);
  if ((v12 & 0x80u) == 0) {
    unint64_t v8 = __p;
  }
  else {
    unint64_t v8 = (void **)__p[0];
  }
  uint64_t classname = std::__get_classname((const char *)v8, a4);
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
  return classname;
}

void sub_21561B020(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    unint64_t v5 = *(unsigned char **)(a1 + 72);
    unint64_t v4 = *(void *)(a1 + 80);
    if ((unint64_t)v5 >= v4)
    {
      unint64_t v6 = (unint64_t *)(a1 + 64);
      unint64_t v7 = *(void *)(a1 + 64);
      unint64_t v8 = &v5[-v7];
      uint64_t v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        unint64_t v10 = v4 - v7;
        if (2 * v10 > v9) {
          uint64_t v9 = 2 * v10;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v11 = v9;
        }
        if (v11) {
          unsigned __int8 v12 = operator new(v11);
        }
        else {
          unsigned __int8 v12 = 0;
        }
        uint64_t v20 = &v8[(void)v12];
        uint64_t v21 = (char *)v12 + v11;
        v8[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v8[(void)v12 + 1];
        if (v5 != (unsigned char *)v7)
        {
          unint64_t v22 = &v5[~v7];
          do
          {
            char v23 = *--v5;
            (v22--)[(void)v12] = v23;
          }
          while (v5 != (unsigned char *)v7);
LABEL_45:
          unint64_t v5 = (unsigned char *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    }
    goto LABEL_22;
  }
  unint64_t v6 = (unint64_t *)(a1 + 64);
  unint64_t v5 = *(unsigned char **)(a1 + 72);
  unint64_t v13 = *(void *)(a1 + 80);
  if (!*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      unint64_t v24 = *v6;
      uint64_t v25 = &v5[-*v6];
      unint64_t v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        unint64_t v27 = v13 - v24;
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          unsigned __int8 v12 = operator new(v28);
        }
        else {
          unsigned __int8 v12 = 0;
        }
        uint64_t v20 = &v25[(void)v12];
        uint64_t v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (unsigned char *)v24)
        {
          __int16 v31 = &v5[~v24];
          do
          {
            char v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }
          while (v5 != (unsigned char *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *unint64_t v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13) {
    goto LABEL_22;
  }
  unint64_t v14 = *v6;
  long long v15 = &v5[-*v6];
  unint64_t v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0) {
    goto LABEL_50;
  }
  unint64_t v17 = v13 - v14;
  if (2 * v17 > v16) {
    unint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v18 = v16;
  }
  if (v18) {
    unsigned __int8 v12 = operator new(v18);
  }
  else {
    unsigned __int8 v12 = 0;
  }
  uint64_t v20 = &v15[(void)v12];
  uint64_t v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  uint64_t v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (unsigned char *)v14)
  {
    uint64_t v29 = &v5[~v14];
    do
    {
      char v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }
    while (v5 != (unsigned char *)v14);
    goto LABEL_45;
  }
LABEL_46:
  unsigned __int8 v12 = v20;
LABEL_47:
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v19;
  *(void *)(a1 + 80) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 72) = v19;
}

void std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100](std::vector<std::pair<std::string, std::string>> *a1, long long *a2)
{
  value = a1->__end_cap_.__value_;
  p_end_cap = (std::allocator<std::pair<std::string, std::string>> *)&a1->__end_cap_;
  unint64_t v5 = value;
  unint64_t v7 = *((void *)p_end_cap - 1);
  if (v7 >= (unint64_t)value)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (unint64_t)a1->__begin_) >> 4);
    unint64_t v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555) {
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (char *)a1->__begin_) >> 4);
    if (2 * v13 > v12) {
      unint64_t v12 = 2 * v13;
    }
    if (v13 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v14 = 0x555555555555555;
    }
    else {
      unint64_t v14 = v12;
    }
    __v.__end_cap_.__value_ = p_end_cap;
    if (v14) {
      long long v15 = (std::pair<std::string, std::string> *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>>((uint64_t)p_end_cap, v14);
    }
    else {
      long long v15 = 0;
    }
    unint64_t v16 = v15 + v11;
    __v.__first_ = v15;
    __v.__begin_ = v16;
    __v.__end_cap_.__value_ = &v15[v14];
    long long v17 = *a2;
    v16->first.__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v16->first.__r_.__value_.__l.__data_ = v17;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    long long v18 = *(long long *)((char *)a2 + 24);
    v16->second.__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&v16->second.__r_.__value_.__l.__data_ = v18;
    *((void *)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
    *((void *)a2 + 3) = 0;
    __v.__end_ = v16 + 1;
    std::vector<std::pair<std::string,std::string>>::__swap_out_circular_buffer(a1, &__v);
    std::__split_buffer<std::string>::pointer end = a1->__end_;
    std::__split_buffer<std::pair<std::string,std::string>>::~__split_buffer(&__v);
  }
  else
  {
    long long v8 = *a2;
    *(void *)(v7 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v7 = v8;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    long long v9 = *(long long *)((char *)a2 + 24);
    *(void *)(v7 + 40) = *((void *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    *((void *)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
    *((void *)a2 + 3) = 0;
    std::__split_buffer<std::string>::pointer end = (std::pair<std::string, std::string> *)(v7 + 48);
    a1->__end_ = (std::vector<std::pair<std::string, std::string>>::pointer)(v7 + 48);
  }
  a1->__end_ = end;
}

void sub_21561B3DC(_Unwind_Exception *a1, std::__split_buffer<std::pair<std::string, std::string>> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::regex_traits<char>::transform<std::__wrap_iter<char *>>(uint64_t a1, char *a2, char *a3)
{
  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  unint64_t v4 = v7;
  if ((v7 & 0x80u) == 0) {
    unint64_t v5 = __p;
  }
  else {
    unint64_t v5 = (void **)__p[0];
  }
  if ((v7 & 0x80u) != 0) {
    unint64_t v4 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_21561B48C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2166BEEB0](exception, 9);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21561B4EC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::vector<std::pair<std::string,std::string>>::__swap_out_circular_buffer(std::vector<std::pair<std::string, std::string>> *this, std::__split_buffer<std::pair<std::string, std::string>> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>,std::reverse_iterator<std::pair<std::string,std::string>*>,std::reverse_iterator<std::pair<std::string,std::string>*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  std::vector<std::pair<char, char>>::pointer begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>,std::reverse_iterator<std::pair<std::string,std::string>*>,std::reverse_iterator<std::pair<std::string,std::string>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 48);
      *(void *)(v9 - 32) = *(void *)(a3 - 32);
      *(_OWORD *)(v9 - 48) = v10;
      *(void *)(a3 - 40) = 0;
      *(void *)(a3 - 32) = 0;
      *(void *)(a3 - 48) = 0;
      long long v11 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v11;
      v9 -= 48;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 48;
      a3 -= 48;
    }
    while (a3 != a5);
    *((void *)&v16 + 1) = v9;
  }
  char v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100](v3, v1);
      v1 += 48;
    }
    while (v1 != v2);
  }
}

void std::__split_buffer<std::pair<std::string,std::string>>::~__split_buffer(std::__split_buffer<std::pair<std::string, std::string>> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::pair<std::string,std::string>>::clear[abi:ne180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 48;
    std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100](v4, i - 48);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a2);
}

void (__cdecl ***std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }
  JUMPOUT(0x2166BF060);
}

uint64_t std::__begin_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(*(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(void *)(a2 + 16);
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void (__cdecl ***std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }
  JUMPOUT(0x2166BF060);
}

uint64_t std::__end_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  uint64_t v2 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(void *)(v2 + 8) = *(void *)(a2 + 16);
  *(unsigned char *)(v2 + 16) = 1;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_loop(std::basic_regex<char> *this, size_t __min, size_t __max, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end, BOOL __greedy)
{
}

void sub_21561BB64(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    if ((v4 & 0xF8) == 0x30 || (v4 & 0xFE) == 0x38)
    {
      int v5 = v4 - 48;
      *a4 = v5;
      if (++a2 == a3)
      {
        return a3;
      }
      else
      {
        while (1)
        {
          int v6 = *a2;
          if ((v6 & 0xF8) != 0x30 && (v6 & 0xFE) != 0x38) {
            break;
          }
          if (v5 >= 214748364) {
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
          }
          int v5 = v6 + 10 * v5 - 48;
          *a4 = v5;
          if (++a2 == a3) {
            return a3;
          }
        }
      }
    }
  }
  return a2;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2166BEEB0](exception, 8);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21561BC80(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2166BEEB0](exception, 7);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21561BCD8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  std::__owns_two_states<char>::~__owns_two_states(a1);
  JUMPOUT(0x2166BF060);
}

unsigned int *std::__loop<char>::__exec(unsigned int *result, void *a2)
{
  uint64_t v2 = result[10];
  uint64_t v3 = a2[7];
  int v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    unint64_t v5 = *v4 + 1;
    *int v4 = v5;
    unint64_t v6 = *((void *)result + 3);
    unint64_t v7 = *((void *)result + 4);
    BOOL v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      uint64_t v10 = *(void *)(v3 + 16 * v2 + 8);
      BOOL v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8) {
        goto LABEL_25;
      }
LABEL_22:
      a2[10] = *((void *)result + 1);
      return std::__loop<char>::__init_repeat[abi:ne180100](result, a2);
    }
    goto LABEL_23;
  }
  *int v4 = 0;
  if (*((void *)result + 4))
  {
    if (*((void *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((void *)result + 2);
  return result;
}

unsigned int *std::__loop<char>::__exec_split(unsigned int *result, int a2, void *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((void *)result + 2);
  }
  else
  {
    a3[10] = *((void *)result + 1);
    return std::__loop<char>::__init_repeat[abi:ne180100](result, a3);
  }
  return result;
}

void std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  std::__owns_two_states<char>::~__owns_two_states(a1);
  JUMPOUT(0x2166BF060);
}

void (__cdecl ***std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26C636F20;
  uint64_t v2 = a1[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  uint64_t v3 = a1[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }
  return a1;
}

unsigned int *std::__loop<char>::__init_repeat[abi:ne180100](unsigned int *result, void *a2)
{
  unsigned int v2 = result[11];
  *(void *)(a2[7] + 16 * result[10] + 8) = a2[2];
  unsigned int v3 = result[12];
  if (v2 != v3)
  {
    uint64_t v4 = v2 - 1;
    uint64_t v5 = a2[3];
    uint64_t v6 = v3 - 1 - v4;
    uint64_t v7 = a2[4] + 24 * v4 + 8;
    do
    {
      *(void *)(v7 - 8) = v5;
      *(void *)uint64_t v7 = v5;
      *(unsigned char *)(v7 + 8) = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

void std::__repeat_one_loop<char>::~__repeat_one_loop()
{
}

uint64_t std::__repeat_one_loop<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  std::__owns_two_states<char>::~__owns_two_states(a1);
  JUMPOUT(0x2166BF060);
}

void std::__alternate<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t std::__alternate<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  uint64_t v3 = 8;
  if (a2) {
    uint64_t v3 = 16;
  }
  *(void *)(a3 + 80) = *(void *)(result + v3);
  return result;
}

void std::__empty_non_own_state<char>::~__empty_non_own_state()
{
}

uint64_t std::__empty_non_own_state<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2166BEEB0](exception, 15);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21561C058(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  if (a2 == a3) {
    return (unsigned __int8 *)a2;
  }
  std::__split_buffer<std::string>::pointer end = a1->__end_;
  unsigned int marked_count = a1->__marked_count_;
  BOOL v8 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(a1, a2, a3);
  if (v8 == (unsigned __int8 *)a2) {
    return (unsigned __int8 *)a2;
  }
  size_t v9 = a1->__marked_count_ + 1;
  return std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>(a1, v8, (unsigned __int8 *)a3, end, marked_count + 1, v9);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  uint64_t v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<char const*>(a1, a2, a3);
  uint64_t v7 = v6;
  if (v6 == a2 && v6 != a3)
  {
    if (a2 + 1 == a3 || *a2 != 92)
    {
      return a2;
    }
    else
    {
      int v8 = a2[1];
      if (v8 == 40)
      {
        uint64_t v9 = (uint64_t)(a2 + 2);
        std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(a1);
        unsigned int marked_count = a1->__marked_count_;
        do
        {
          long long v11 = (char *)v9;
          uint64_t v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>(a1, v9, a3);
        }
        while ((char *)v9 != v11);
        if (v11 == a3 || v11 + 1 == a3 || *v11 != 92 || v11[1] != 41) {
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
        }
        uint64_t v7 = v11 + 2;
        std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(a1, marked_count);
      }
      else
      {
        BOOL v13 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(a1, v8);
        uint64_t v14 = 2;
        if (!v13) {
          uint64_t v14 = 0;
        }
        return &a2[v14];
      }
    }
  }
  return v7;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>(std::basic_regex<char> *this, unsigned __int8 *a2, unsigned __int8 *a3, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end)
{
  uint64_t v6 = a2;
  if (a2 != a3)
  {
    unsigned int v7 = __mexp_end;
    unsigned int v8 = __mexp_begin;
    int v11 = *a2;
    if (v11 == 42)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(this, 0, 0xFFFFFFFFFFFFFFFFLL, __s, __mexp_begin, __mexp_end, 1);
      return ++v6;
    }
    if (a2 + 1 != a3 && v11 == 92 && a2[1] == 123)
    {
      BOOL v13 = a2 + 2;
      int v25 = 0;
      uint64_t v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>((uint64_t)this, a2 + 2, a3, &v25);
      if (v14 == v13) {
        goto LABEL_16;
      }
      if (v14 != a3)
      {
        long long v15 = v14 + 1;
        int v16 = *v14;
        if (v16 == 44)
        {
          int v24 = -1;
          long long v17 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>((uint64_t)this, v15, a3, &v24);
          if (v17 != a3 && v17 + 1 != a3 && *v17 == 92 && v17[1] == 125)
          {
            size_t v19 = v24;
            size_t v18 = v25;
            if (v24 == -1)
            {
              size_t v19 = -1;
            }
            else if (v24 < v25)
            {
LABEL_16:
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
            }
            uint64_t v6 = &v17[2 * (v17[1] == 125)];
            size_t v20 = v8;
            size_t v21 = v7;
            unint64_t v22 = this;
LABEL_23:
            std::basic_regex<char,std::regex_traits<char>>::__push_loop(v22, v18, v19, __s, v20, v21, 1);
            return v6;
          }
        }
        else if (v15 != a3 && v16 == 92 && *v15 == 125)
        {
          uint64_t v6 = v14 + 2;
          size_t v18 = v25;
          size_t v20 = v8;
          size_t v21 = v7;
          unint64_t v22 = this;
          size_t v19 = v25;
          goto LABEL_23;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
  }
  return v6;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<char const*>(std::basic_regex<char> *this, char *a2, char *a3)
{
  if (a2 == a3)
  {
    uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<char const*>(this, a2, a3);
    if (result != a2) {
      return result;
    }
  }
  else
  {
    int v6 = *a2;
    if ((a2 + 1 != a3 || v6 != 36)
      && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v6);
      return a2 + 1;
    }
    uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<char const*>(this, a2, a3);
    if (result != a2) {
      return result;
    }
    if (*a2 == 46) {
      operator new();
    }
  }
  return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
}

unsigned char *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<char const*>(std::basic_regex<char> *a1, unsigned char *a2, unsigned char *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3 && a2 + 1 != a3 && *a2 == 92)
  {
    int v4 = (char)a2[1];
    if ((v4 - 36) <= 0x3A && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v4);
      v3 += 2;
    }
  }
  return v3;
}

void (__cdecl ***std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unsigned int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }
  JUMPOUT(0x2166BF060);
}

uint64_t std::__match_any<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(unsigned char **)(a2 + 16);
  if (v2 == *(unsigned char **)(a2 + 24) || !*v2)
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

BOOL std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(std::basic_regex<char> *this, char a2)
{
  if ((a2 & 0xF8) != 0x30 && (a2 & 0xFE) != 0x38 || a2 - 49 > 8) {
    return 0;
  }
  if (a2 - 48 > this->__marked_count_) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, a2 - 48);
  return 1;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  int v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  }
  do
  {
    unsigned int v7 = v6;
    int v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, (std::basic_regex<char> *)v6, a3);
  }
  while (v6 != v7);
  return v7;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  std::__split_buffer<std::string>::pointer end = a1->__end_;
  unsigned int marked_count = a1->__marked_count_;
  unsigned int v8 = std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_ERE<char const*>(a1, a2, a3);
  uint64_t v9 = (unsigned __int8 *)v8;
  if (v8 != (char *)a2 || v8 == (char *)a3) {
    goto LABEL_12;
  }
  int locale_low = SLOBYTE(a2->__traits_.__loc_.__locale_);
  if (locale_low == 36)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_r_anchor(a1);
    goto LABEL_8;
  }
  if (locale_low == 40)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(a1);
    unsigned int v11 = a1->__marked_count_;
    ++a1->__open_count_;
    unint64_t v12 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, (char *)&a2->__traits_.__loc_.__locale_ + 1, a3);
    if (v12 == a3 || (BOOL v13 = v12, LOBYTE(v12->__traits_.__loc_.__locale_) != 41)) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(a1, v11);
    --a1->__open_count_;
    uint64_t v9 = (unsigned __int8 *)&v13->__traits_.__loc_.__locale_ + 1;
LABEL_12:
    if (v9 != (unsigned __int8 *)a2) {
      goto LABEL_13;
    }
    return (unsigned __int8 *)a2;
  }
  if (locale_low != 94) {
    return (unsigned __int8 *)a2;
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_l_anchor(a1);
LABEL_8:
  uint64_t v9 = (unsigned __int8 *)&a2->__traits_.__loc_.__locale_ + 1;
LABEL_13:
  size_t v14 = a1->__marked_count_ + 1;
  return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)a1, v9, (unsigned __int8 *)a3, end, marked_count + 1, v14);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_ERE<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  uint64_t result = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<char const*>(a1, a2, a3);
  if (result == (char *)a2)
  {
    uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<char const*>((uint64_t)a1, (char *)a2, (char *)a3);
    if (result == (char *)a2)
    {
      if (a2 != a3 && LOBYTE(a2->__traits_.__loc_.__locale_) == 46) {
        operator new();
      }
      return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)a1, (char *)a2, (char *)a3);
    }
  }
  return result;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  uint64_t v3 = this;
  if (this != a3)
  {
    int locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
    uint64_t v5 = (locale_low - 36);
    if (v5 > 0x3A) {
      goto LABEL_8;
    }
    if (((1 << (locale_low - 36)) & 0x5800000080004D1) != 0) {
      return v3;
    }
    if (v5 == 5)
    {
      if (a1->__open_count_) {
        return v3;
      }
    }
    else
    {
LABEL_8:
      if ((locale_low - 123) < 2) {
        return v3;
      }
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_);
    return (std::basic_regex<char> *)((char *)v3 + 1);
  }
  return v3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<char const*>(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v4 = a2 + 1;
  if (v3 + 1 == a3 || *v3 != 92) {
    return v3;
  }
  int v5 = *v4;
  std::basic_regex<char>::value_type v6 = *v4;
  BOOL v7 = (v5 - 36) > 0x3A || ((1 << (*v4 - 36)) & 0x5800000080004F1) == 0;
  if (!v7 || (v5 - 123) < 3)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v6);
    v3 += 2;
    return v3;
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1F0) != 0x40)
  {
    BOOL v9 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref((std::basic_regex<char> *)a1, v6);
    uint64_t v10 = 2;
    if (!v9) {
      uint64_t v10 = 0;
    }
    v3 += v10;
    return v3;
  }
  return std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v4, a3, 0);
}

uint64_t std::regex_match[abi:ne180100]<std::__wrap_iter<char const*>,std::allocator<std::sub_match<std::__wrap_iter<char const*>>>,char,std::regex_traits<char>>(char *__f, char *__l, uint64_t a3, uint64_t a4, int a5)
{
  __int16 v5 = a5;
  memset(&__p.__prefix_, 0, 17);
  memset(&__p.__suffix_, 0, 17);
  __p.__ready_ = 0;
  __p.__position_start_ = 0;
  memset(&__p, 0, 41);
  int v9 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(a4, __f, __l, &__p, a5 | 0x1040u);
  std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((std::vector<std::ssub_match> *)a3, (uint64_t)__f, (std::sub_match<std::__wrap_iter<const char *>> *)__l, (uint64_t *)&__p, (v5 & 0x800) != 0);
  if (__p.__matches_.__begin_)
  {
    __p.__matches_.__end_ = __p.__matches_.__begin_;
    operator delete(__p.__matches_.__begin_);
  }
  if (!v9) {
    return 0;
  }
  if (!*(unsigned char *)(a3 + 88)) {
    return 1;
  }
  uint64_t result = 0;
  *(void *)(a3 + 8) = *(void *)a3;
  return result;
}

void sub_21561CBD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(uint64_t a1, char *__f, char *__l, std::match_results<const char *> *this, int a5)
{
  if ((a5 & 0x80) != 0) {
    int v9 = a5 & 0xFFA;
  }
  else {
    int v9 = a5;
  }
  std::match_results<char const*>::__init(this, *(_DWORD *)(a1 + 28) + 1, __f, __l, (unsigned __int16)(v9 & 0x800) >> 11);
  if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, __f, __l, (uint64_t *)this, v9, (v9 & 0x800) == 0))
  {
    if (this->__matches_.__end_ == this->__matches_.__begin_) {
      p_unmatched = &this->__unmatched_;
    }
    else {
      p_unmatched = this->__matches_.__begin_;
    }
LABEL_8:
    first = p_unmatched->first;
    this->__prefix_.second = p_unmatched->first;
    this->__prefix_.matched = this->__prefix_.first != first;
    second = p_unmatched->second;
    this->__suffix_.first = second;
    this->__suffix_.matched = second != this->__suffix_.second;
    return 1;
  }
  if (__f != __l && (v9 & 0x40) == 0)
  {
    int v14 = v9 | 0x80;
    long long v15 = __f + 1;
    if (v15 != __l)
    {
      while (1)
      {
        std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__matches_.__end_ - (char *)this->__matches_.__begin_) >> 3), &this->__unmatched_);
        int v16 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, v15, __l, (uint64_t *)this, v14, 0);
        std::vector<std::csub_match>::pointer begin = this->__matches_.__begin_;
        std::vector<std::csub_match>::pointer end = this->__matches_.__end_;
        if (v16) {
          break;
        }
        std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3), &this->__unmatched_);
        if (++v15 == __l) {
          goto LABEL_14;
        }
      }
      if (end == begin) {
        p_unmatched = &this->__unmatched_;
      }
      else {
        p_unmatched = this->__matches_.__begin_;
      }
      goto LABEL_8;
    }
LABEL_14:
    std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__matches_.__end_ - (char *)this->__matches_.__begin_) >> 3), &this->__unmatched_);
    if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, __l, __l, (uint64_t *)this, v14, 0))
    {
      if (this->__matches_.__end_ == this->__matches_.__begin_) {
        p_unmatched = &this->__unmatched_;
      }
      else {
        p_unmatched = this->__matches_.__begin_;
      }
      goto LABEL_8;
    }
  }
  uint64_t result = 0;
  this->__matches_.__end_ = this->__matches_.__begin_;
  return result;
}

void std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(std::vector<std::ssub_match> *a1, uint64_t a2, std::sub_match<std::__wrap_iter<const char *>> *a3, uint64_t *a4, char a5)
{
  uint64_t v10 = a4[6];
  std::vector<std::sub_match<std::__wrap_iter<char const*>>>::resize(a1, 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3));
  std::vector<std::ssub_match>::pointer begin = a1->__begin_;
  if (a1->__end_ != a1->__begin_)
  {
    unint64_t v12 = 0;
    unint64_t v13 = 0;
    uint64_t v15 = *a4;
    uint64_t v14 = a4[1];
    do
    {
      unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v14 - v15) >> 3);
      long long v17 = (void *)(v15 + v12 * 24);
      if (v16 <= v13) {
        size_t v18 = a4 + 3;
      }
      else {
        size_t v18 = v17;
      }
      begin[v12].first.__i_ = (std::__wrap_iter<const char *>::iterator_type)(a2 + *v18 - v10);
      if (0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3) <= v13) {
        size_t v19 = a4 + 3;
      }
      else {
        size_t v19 = (uint64_t *)(*a4 + v12 * 24);
      }
      a1->__begin_[v12].second.__i_ = (std::__wrap_iter<const char *>::iterator_type)(a2 + v19[1] - v10);
      uint64_t v15 = *a4;
      uint64_t v14 = a4[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v14 - *a4) >> 3) <= v13) {
        size_t v20 = a4 + 3;
      }
      else {
        size_t v20 = (uint64_t *)(*a4 + v12 * 24);
      }
      char v21 = *((unsigned char *)v20 + 16);
      std::vector<std::ssub_match>::pointer begin = a1->__begin_;
      std::vector<std::ssub_match>::pointer end = a1->__end_;
      a1->__begin_[v12].matched = v21;
      ++v13;
      ++v12;
    }
    while (v13 < 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3));
  }
  a1[1].__begin_ = a3;
  a1[1].__end_ = a3;
  LOBYTE(a1[1].__end_cap_.__value_) = 0;
  char v23 = (std::sub_match<std::__wrap_iter<const char *>> *)(a2 + a4[6] - v10);
  a1[2].__begin_ = v23;
  a1[2].__end_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[7] - v10);
  LOBYTE(a1[2].__end_cap_.__value_) = *((unsigned char *)a4 + 64);
  a1[3].__begin_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[9] - v10);
  a1[3].__end_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[10] - v10);
  LOBYTE(a1[3].__end_cap_.__value_) = *((unsigned char *)a4 + 88);
  if ((a5 & 1) == 0) {
    a1[4].__end_ = v23;
  }
  LOBYTE(a1[4].__begin_) = *((unsigned char *)a4 + 96);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0) {
    return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, a2, a3, a4, a5, a6);
  }
  if (*(_DWORD *)(a1 + 28)) {
    return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, a2, a3, a4, a5, a6);
  }
  return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  long long v62 = 0u;
  long long v63 = 0u;
  long long v61 = 0u;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(_DWORD *)int v57 = 0;
    memset(&v57[8], 0, 32);
    long long v58 = 0uLL;
    *(_OWORD *)std::match_results<const char *> __p = 0uLL;
    memset(v60, 0, 21);
    std::deque<std::__state<char>>::push_back(&v61, (uint64_t)v57);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(void *)&v57[32])
    {
      *(void *)&long long v58 = *(void *)&v57[32];
      operator delete(*(void **)&v57[32]);
    }
    unint64_t v52 = a4;
    uint64_t v12 = *((void *)&v61 + 1);
    unint64_t v13 = *((void *)&v63 + 1) + v63 - 1;
    unint64_t v14 = v13 / 0x2A;
    uint64_t v15 = *(void *)(*((void *)&v61 + 1) + 8 * (v13 / 0x2A));
    unint64_t v16 = 3 * (v13 % 0x2A);
    uint64_t v17 = v15 + 32 * v16;
    *(_DWORD *)uint64_t v17 = 0;
    *(void *)(v17 + 8) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 16) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 24) = a3;
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 56), *(unsigned int *)(a1 + 32));
    char v55 = 0;
    unsigned int v18 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = a2;
    uint64_t v19 = a3 - a2;
    uint64_t v20 = *((void *)&v63 + 1);
    uint64_t v21 = *((void *)&v61 + 1);
    unint64_t v22 = *((void *)&v63 + 1) + v63 - 1;
    unint64_t v23 = v22 / 0x2A;
    unint64_t v24 = 3 * (v22 % 0x2A);
    *(void *)(*(void *)(*((void *)&v61 + 1) + 8 * v23) + 32 * v24 + 80) = v6;
    uint64_t v25 = *(void *)(v21 + 8 * v23) + 32 * v24;
    *(_DWORD *)(v25 + 88) = a5;
    *(unsigned char *)(v25 + 92) = a6;
    while (2)
    {
      if ((++v18 & 0xFFF) == 0 && (int)(v18 >> 12) >= (int)v19) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      }
      unint64_t v27 = v20 + v63 - 1;
      uint64_t v28 = *(void *)(*((void *)&v61 + 1) + 8 * (v27 / 0x2A));
      unint64_t v29 = v27 % 0x2A;
      uint64_t v30 = v28 + 96 * (v27 % 0x2A);
      char v32 = (void *)(v30 + 80);
      uint64_t v31 = *(void *)(v30 + 80);
      if (v31) {
        (*(void (**)(uint64_t, unint64_t))(*(void *)v31 + 16))(v31, v28 + 96 * v29);
      }
      switch(*(_DWORD *)v30)
      {
        case 0xFFFFFC18:
          uint64_t v33 = *(void *)(v28 + 96 * v29 + 16);
          BOOL v35 = (a5 & 0x1000) == 0 || v33 == a3;
          BOOL v36 = v33 != v54 || (a5 & 0x20) == 0;
          if (!v36 || !v35) {
            goto LABEL_37;
          }
          uint64_t v37 = v33 - *(void *)(v28 + 96 * v29 + 8);
          uint64_t v38 = v53;
          if ((v55 & (v53 >= v37)) == 0) {
            uint64_t v38 = v37;
          }
          if (v38 != v19)
          {
            uint64_t v53 = v38;
            std::deque<std::__state<char>>::pop_back(&v61);
            char v55 = 1;
            goto LABEL_38;
          }
          __int16 v39 = (void **)*((void *)&v61 + 1);
          uint64_t v40 = v62;
          if ((void)v62 == *((void *)&v61 + 1))
          {
            uint64_t v40 = *((void *)&v61 + 1);
          }
          else
          {
            __int16 v41 = (void *)(*((void *)&v61 + 1) + 8 * ((unint64_t)v63 / 0x2A));
            int v42 = (void *)(*v41 + 96 * ((unint64_t)v63 % 0x2A));
            unint64_t v43 = *(void *)(*((void *)&v61 + 1) + 8 * ((*((void *)&v63 + 1) + (void)v63) / 0x2AuLL))
                + 96 * ((*((void *)&v63 + 1) + (void)v63) % 0x2AuLL);
            if (v42 != (void *)v43)
            {
              do
              {
                std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)&v63 + 8, v42);
                v42 += 12;
                if ((void *)((char *)v42 - *v41) == (void *)4032)
                {
                  int v44 = (void *)v41[1];
                  ++v41;
                  int v42 = v44;
                }
              }
              while (v42 != (void *)v43);
              __int16 v39 = (void **)*((void *)&v61 + 1);
              uint64_t v40 = v62;
            }
          }
          *((void *)&v63 + 1) = 0;
          unint64_t v47 = v40 - (void)v39;
          if (v47 >= 0x11)
          {
            do
            {
              operator delete(*v39);
              __int16 v39 = (void **)(*((void *)&v61 + 1) + 8);
              *((void *)&v61 + 1) = v39;
              unint64_t v47 = v62 - (void)v39;
            }
            while ((void)v62 - (void)v39 > 0x10uLL);
          }
          if (v47 >> 3 == 1)
          {
            uint64_t v48 = 21;
          }
          else
          {
            if (v47 >> 3 != 2) {
              goto LABEL_53;
            }
            uint64_t v48 = 42;
          }
          *(void *)&long long v63 = v48;
LABEL_53:
          char v55 = 1;
          uint64_t v53 = v19;
LABEL_38:
          uint64_t v20 = *((void *)&v63 + 1);
          if (*((void *)&v63 + 1)) {
            continue;
          }
          if ((v55 & 1) == 0) {
            goto LABEL_56;
          }
          uint64_t v49 = *v52;
          *(void *)uint64_t v49 = v54;
          *(void *)(v49 + 8) = v54 + v53;
          uint64_t v50 = 1;
          *(unsigned char *)(v49 + 16) = 1;
          break;
        case 0xFFFFFC19:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_38;
        case 0xFFFFFC1D:
          std::deque<std::__state<char>>::push_front((uint64_t)&v61, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          std::deque<std::__state<char>>::pop_back(&v61);
          goto LABEL_38;
        case 0xFFFFFC20:
          long long v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)int v57 = *(_OWORD *)v30;
          *(_OWORD *)&v57[16] = v45;
          long long v58 = 0uLL;
          *(void *)&v57[32] = 0;
          std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v57[32], *(long long **)(v28 + 96 * v29 + 32), *(long long **)(v28 + 96 * v29 + 40), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v28 + 96 * v29 + 40) - *(void *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v60[0] = 0;
          std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *(long long **)(v28 + 96 * v29 + 56), *(long long **)(v28 + 96 * v29 + 64), (uint64_t)(*(void *)(v28 + 96 * v29 + 64) - *(void *)(v28 + 96 * v29 + 56)) >> 4);
          uint64_t v46 = *v32;
          *(void *)((char *)&v60[1] + 5) = *(void *)(v30 + 85);
          v60[1] = v46;
          (*(void (**)(void, uint64_t, unint64_t))(*(void *)*v32 + 24))(*v32, 1, v28 + 96 * v29);
          (*(void (**)(void, void, unsigned char *))(*(void *)v60[1] + 24))(v60[1], 0, v57);
          std::deque<std::__state<char>>::push_back(&v61, (uint64_t)v57);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (*(void *)&v57[32])
          {
            *(void *)&long long v58 = *(void *)&v57[32];
            operator delete(*(void **)&v57[32]);
          }
          goto LABEL_38;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  else
  {
LABEL_56:
    uint64_t v50 = 0;
  }
  std::deque<std::__state<char>>::~deque[abi:ne180100](&v61);
  return v50;
}

void sub_21561D4B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  std::deque<std::__state<char>>::~deque[abi:ne180100]((void *)(v22 - 144));
  _Unwind_Resume(a1);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v54 = 0;
  char v55 = 0;
  v56[0] = 0;
  *(_DWORD *)uint64_t v51 = 0;
  memset(&v51[8], 0, 32);
  long long v52 = 0u;
  memset(v53, 0, 37);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    __x.first = a3;
    __x.second = a3;
    __x.matched = 0;
    *(_DWORD *)unint64_t v47 = 0;
    memset(&v47[8], 0, 48);
    *(_OWORD *)std::match_results<const char *> __p = 0uLL;
    memset(v49, 0, 21);
    char v55 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v54, (uint64_t)v47);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(void *)&v47[32])
    {
      *(void *)&v47[40] = *(void *)&v47[32];
      operator delete(*(void **)&v47[32]);
    }
    int v42 = a4;
    unsigned int v11 = v55;
    *((_DWORD *)v55 - 24) = 0;
    *((void *)v11 - 11) = a2;
    *((void *)v11 - 10) = a2;
    *((void *)v11 - 9) = a3;
    std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v11 - 4), *(unsigned int *)(a1 + 28), &__x);
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)((char *)v55 - 40), *(unsigned int *)(a1 + 32));
    unint64_t v43 = a3;
    int v44 = 0;
    char v12 = 0;
    unsigned int v13 = 0;
    unint64_t v14 = (const char *)(a3 - a2);
    uint64_t v15 = v55;
    *((void *)v55 - 2) = v6;
    *((_DWORD *)v15 - 2) = a5;
    *((unsigned char *)v15 - 4) = a6;
    do
    {
      BOOL v16 = (++v13 & 0xFFF) != 0 || (int)(v13 >> 12) < (int)v14;
      if (!v16) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      }
      unsigned int v18 = v15 - 1;
      uint64_t v17 = *((void *)v15 - 2);
      uint64_t v19 = v15 - 6;
      if (v17) {
        (*(void (**)(uint64_t, _OWORD *))(*(void *)v17 + 16))(v17, v15 - 6);
      }
      switch(*(_DWORD *)v19)
      {
        case 0xFFFFFC18:
          uint64_t v20 = (const char *)*((void *)v15 - 10);
          if ((a5 & 0x20) != 0 && v20 == a2 || (a5 & 0x1000) != 0 && v20 != v43) {
            goto LABEL_19;
          }
          char v27 = v12;
          uint64_t v28 = &v20[-*((void *)v15 - 11)];
          unint64_t v29 = v44;
          if ((v27 & ((uint64_t)v44 >= (uint64_t)v28)) == 0)
          {
            long long v30 = *(v15 - 5);
            *(_OWORD *)uint64_t v51 = *(_OWORD *)v19;
            *(_OWORD *)&v51[16] = v30;
            if (v51 != v19)
            {
              std::vector<std::sub_match<char const*>>::__assign_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v51[32], *((long long **)v15 - 8), *((long long **)v15 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v15 - 7) - *((void *)v15 - 8)) >> 3));
              std::vector<std::pair<unsigned long,char const*>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(v53, *((uint64_t **)v15 - 5), *((uint64_t **)v15 - 4), (uint64_t)(*((void *)v15 - 4) - *((void *)v15 - 5)) >> 4);
            }
            uint64_t v31 = (void *)*v18;
            *(void **)((char *)&v53[3] + 5) = *(void **)((char *)v15 - 11);
            v53[3] = v31;
            unint64_t v29 = v28;
          }
          char v32 = v55;
          if (v29 == v14)
          {
            uint64_t v33 = (uint64_t)v54;
            while (v32 != (void *)v33)
            {
              v32 -= 12;
              std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)v56, v32);
            }
            char v55 = (_OWORD *)v33;
            char v12 = 1;
            int v44 = v14;
          }
          else
          {
            int v44 = v29;
            unint64_t v34 = v55 - 6;
            std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)v56, (void *)v55 - 12);
            char v55 = v34;
            char v12 = 1;
          }
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          break;
        case 0xFFFFFC1F:
LABEL_19:
          uint64_t v21 = v55 - 6;
          std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)v56, (void *)v55 - 12);
          char v55 = v21;
          break;
        case 0xFFFFFC20:
          long long v22 = *(v15 - 5);
          *(_OWORD *)unint64_t v47 = *(_OWORD *)v19;
          *(_OWORD *)&v47[16] = v22;
          memset(&v47[32], 0, 24);
          std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v47[32], *((long long **)v15 - 8), *((long long **)v15 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v15 - 7) - *((void *)v15 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v49[0] = 0;
          std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *((long long **)v15 - 5), *((long long **)v15 - 4), (uint64_t)(*((void *)v15 - 4) - *((void *)v15 - 5)) >> 4);
          unint64_t v23 = (void *)*v18;
          *(void *)((char *)&v49[1] + 5) = *(void *)((char *)v15 - 11);
          v49[1] = v23;
          (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v18 + 24))(*v18, 1, v15 - 6);
          (*(void (**)(void, void, unsigned char *))(*(void *)v49[1] + 24))(v49[1], 0, v47);
          unint64_t v24 = v55;
          if ((unint64_t)v55 >= v56[0])
          {
            char v55 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v54, (uint64_t)v47);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            long long v25 = *(_OWORD *)&v47[16];
            *char v55 = *(_OWORD *)v47;
            v24[1] = v25;
            *((void *)v24 + 4) = 0;
            *((void *)v24 + 5) = 0;
            *((void *)v24 + 6) = 0;
            *((void *)v24 + 7) = 0;
            v24[2] = *(_OWORD *)&v47[32];
            *((void *)v24 + 6) = *(void *)&v47[48];
            memset(&v47[32], 0, 24);
            *((void *)v24 + 8) = 0;
            *((void *)v24 + 9) = 0;
            *(_OWORD *)((char *)v24 + 56) = *(_OWORD *)__p;
            *((void *)v24 + 9) = v49[0];
            __p[0] = 0;
            __p[1] = 0;
            v49[0] = 0;
            uint64_t v26 = v49[1];
            *(void *)((char *)v24 + 85) = *(void *)((char *)&v49[1] + 5);
            *((void *)v24 + 10) = v26;
            char v55 = v24 + 6;
          }
          if (*(void *)&v47[32])
          {
            *(void *)&v47[40] = *(void *)&v47[32];
            operator delete(*(void **)&v47[32]);
          }
          break;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      uint64_t v15 = v55;
    }
    while (v54 != v55);
    if (v12)
    {
      uint64_t v35 = *v42;
      *(void *)uint64_t v35 = a2;
      *(void *)(v35 + 8) = &v44[(void)a2];
      *(unsigned char *)(v35 + 16) = 1;
      if ((void)v52 != *(void *)&v51[32])
      {
        unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v52 - *(void *)&v51[32]) >> 3);
        uint64_t v37 = (unsigned char *)(*(void *)&v51[32] + 16);
        unsigned int v38 = 1;
        do
        {
          uint64_t v39 = v35 + 24 * v38;
          *(_OWORD *)uint64_t v39 = *((_OWORD *)v37 - 1);
          char v40 = *v37;
          v37 += 24;
          *(unsigned char *)(v39 + 16) = v40;
          BOOL v16 = v36 > v38++;
        }
        while (v16);
      }
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  if (v53[0])
  {
    v53[1] = v53[0];
    operator delete(v53[0]);
  }
  if (*(void *)&v51[32])
  {
    *(void *)&long long v52 = *(void *)&v51[32];
    operator delete(*(void **)&v51[32]);
  }
  *(void *)uint64_t v51 = &v54;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v51);
  return v6;
}

void sub_21561DA6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  std::__state<char>::~__state(&a17);
  std::__state<char>::~__state(&a33);
  a33 = v33 - 120;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a33);
  _Unwind_Resume(a1);
}

__n128 std::deque<std::__state<char>>::push_back(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = 42 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<std::__state<char>>::__add_back_capacity(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  unint64_t v8 = *(void *)(v5 + 8 * (v7 / 0x2A)) + 96 * (v7 % 0x2A);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v8 = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 16) = v9;
  *(void *)(v8 + 40) = 0;
  *(void *)(v8 + 48) = 0;
  *(void *)(v8 + 32) = 0;
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(v8 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(v8 + 56) = 0;
  *(void *)(v8 + 64) = 0;
  *(void *)(v8 + 72) = 0;
  __n128 result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v8 + 56) = result;
  *(void *)(v8 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v11 = *(void *)(a2 + 80);
  *(void *)(v8 + 85) = *(void *)(a2 + 85);
  *(void *)(v8 + 80) = v11;
  ++a1[5];
  return result;
}

uint64_t std::deque<std::__state<char>>::pop_back(void *a1)
{
  unsigned int v2 = a1 + 5;
  unint64_t v3 = a1[5] + a1[4] - 1;
  std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)(a1 + 5), (void *)(*(void *)(a1[1] + 8 * (v3 / 0x2A)) + 96 * (v3 % 0x2A)));
  --*v2;
  return std::deque<std::__state<char>>::__maybe_remove_back_spare[abi:ne180100](a1, 1);
}

int64x2_t std::deque<std::__state<char>>::push_front(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    std::deque<std::__state<char>>::__add_front_capacity((void **)a1);
    unint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = (void *)(v5 + 8 * (v4 / 0x2A));
  uint64_t v7 = *v6 + 96 * (v4 % 0x2A);
  if (*(void *)(a1 + 16) == v5) {
    uint64_t v7 = 0;
  }
  if (v7 == *v6) {
    uint64_t v7 = *(v6 - 1) + 4032;
  }
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 - 96) = *(_OWORD *)a2;
  *(_OWORD *)(v7 - 80) = v8;
  *(void *)(v7 - 56) = 0;
  *(void *)(v7 - 48) = 0;
  *(void *)(v7 - 64) = 0;
  *(_OWORD *)(v7 - 64) = *(_OWORD *)(a2 + 32);
  *(void *)(v7 - 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(v7 - 40) = 0;
  *(void *)(v7 - 32) = 0;
  *(void *)(v7 - 24) = 0;
  *(_OWORD *)(v7 - 40) = *(_OWORD *)(a2 + 56);
  *(void *)(v7 - 24) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(v7 - 11) = *(void *)(a2 + 85);
  *(void *)(v7 - 16) = v9;
  int64x2_t result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_215627040);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void std::deque<std::__state<char>>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x2A;
  unint64_t v4 = v2 - 42;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    long long v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)long long v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      unint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v5, v33);
      uint64_t v35 = &v34[8 * (v33 >> 2)];
      uint64_t v37 = &v34[8 * v36];
      unsigned int v38 = (uint64_t *)a1[1];
      long long v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        long long v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        __int16 v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)__int16 v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    long long v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0xFC0uLL);
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &v54);
    int v44 = (void *)a1[1];
    long long v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      unint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 3), v46);
      uint64_t v35 = &v34[8 * (v46 >> 2)];
      uint64_t v37 = &v34[8 * v47];
      uint64_t v48 = (uint64_t *)a1[1];
      long long v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        long long v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        uint64_t v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)uint64_t v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      unint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        long long v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  BOOL v56 = a1 + 3;
  *(void *)&long long v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  uint64_t v53 = operator new(0xFC0uLL);
  std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(&v54, &v53);
  char v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_front((uint64_t)&v54, v27);
  }
  unint64_t v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_21561E04C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      char v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_front(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

uint64_t std::deque<std::__state<char>>::__maybe_remove_back_spare[abi:ne180100](void *a1, int a2)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  if (v2 == v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 42 * ((v2 - v3) >> 3) - 1;
  }
  unint64_t v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x2A) {
    a2 = 1;
  }
  if (v5 < 0x54) {
    int v7 = a2;
  }
  else {
    int v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

void std::deque<std::__state<char>>::__add_front_capacity(void **a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  unint64_t v4 = (v3 - v2) >> 3;
  if (v3 == v2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 42 * v4 - 1;
  }
  uint64_t v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(void)a1[5]] < 0x2A)
  {
    uint64_t v7 = (uint64_t)(a1 + 3);
    uint64_t v8 = a1[3];
    uint64_t v9 = *a1;
    uint64_t v10 = v8 - (unsigned char *)*a1;
    if (v4 >= v10 >> 3)
    {
      if (v8 == v9) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = v10 >> 2;
      }
      unint64_t v46 = a1 + 3;
      std::match_results<const char *> __p = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v7, v11);
      unint64_t v43 = (char *)__p;
      int v44 = (char *)__p;
      uint64_t v45 = (char *)__p + 8 * v12;
      __int16 v41 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(&__p, &v41);
      uint64_t v13 = (char *)a1[1];
      uint64_t v14 = v44;
      if (v13 == a1[2])
      {
        unint64_t v33 = (char *)a1[1];
      }
      else
      {
        do
        {
          if (v14 == v45)
          {
            int64_t v15 = v43 - (unsigned char *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p) {
                unint64_t v23 = 1;
              }
              else {
                unint64_t v23 = (v14 - (unsigned char *)__p) >> 2;
              }
              uint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)v46, v23);
              uint64_t v26 = v43;
              uint64_t v14 = &v24[8 * (v23 >> 2)];
              uint64_t v27 = v44 - v43;
              if (v44 != v43)
              {
                uint64_t v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8)];
                uint64_t v28 = 8 * (v27 >> 3);
                unint64_t v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  uint64_t v30 = *(void *)v26;
                  v26 += 8;
                  *(void *)unint64_t v29 = v30;
                  v29 += 8;
                  v28 -= 8;
                }
                while (v28);
              }
              long long v31 = __p;
              std::match_results<const char *> __p = v24;
              unint64_t v43 = &v24[8 * (v23 >> 2)];
              int v44 = v14;
              uint64_t v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                uint64_t v14 = v44;
              }
            }
            else
            {
              uint64_t v16 = v15 >> 3;
              BOOL v17 = v15 >> 3 < -1;
              uint64_t v18 = (v15 >> 3) + 2;
              if (v17) {
                uint64_t v19 = v18;
              }
              else {
                uint64_t v19 = v16 + 1;
              }
              uint64_t v20 = &v43[-8 * (v19 >> 1)];
              int64_t v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                uint64_t v14 = v43;
              }
              uint64_t v22 = &v14[-8 * (v19 >> 1)];
              uint64_t v14 = &v20[v21];
              unint64_t v43 = v22;
              int v44 = &v20[v21];
            }
          }
          uint64_t v32 = *(void *)v13;
          v13 += 8;
          *(void *)uint64_t v14 = v32;
          uint64_t v14 = v44 + 8;
          v44 += 8;
        }
        while (v13 != a1[2]);
        unint64_t v33 = (char *)a1[1];
      }
      uint64_t v36 = *a1;
      uint64_t v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      std::match_results<const char *> __p = v36;
      unint64_t v43 = v33;
      unsigned int v38 = (char *)a1[3];
      uint64_t v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      int v44 = v13;
      uint64_t v45 = v38;
      if (v14 - v37 == 8) {
        uint64_t v40 = 21;
      }
      else {
        uint64_t v40 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v40;
      if (v13 != v33) {
        int v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8];
      }
      if (v36) {
        operator delete(v36);
      }
    }
    else
    {
      if (v2 == v9)
      {
        std::match_results<const char *> __p = operator new(0xFC0uLL);
        std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &__p);
        unint64_t v34 = a1[2];
        std::match_results<const char *> __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        std::match_results<const char *> __p = operator new(0xFC0uLL);
      }
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &__p);
      if ((unsigned char *)a1[2] - (unsigned char *)a1[1] == 8) {
        uint64_t v35 = 21;
      }
      else {
        uint64_t v35 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v35;
    }
  }
  else
  {
    a1[4] = v6 + 42;
    std::match_results<const char *> __p = (void *)*((void *)v3 - 1);
    a1[2] = v3 - 8;
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &__p);
  }
}

void sub_21561E84C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  operator delete(v12);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t std::deque<std::__state<char>>::~deque[abi:ne180100](void *a1)
{
  uint64_t v2 = a1 + 5;
  uint64_t v3 = (void **)a1[1];
  unint64_t v4 = (void **)a1[2];
  if (v4 == v3)
  {
    unint64_t v4 = (void **)a1[1];
  }
  else
  {
    unint64_t v5 = a1[4];
    uint64_t v6 = &v3[v5 / 0x2A];
    uint64_t v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    unint64_t v8 = (unint64_t)v3[(a1[5] + v5) / 0x2A] + 96 * ((a1[5] + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)v2, v7);
        v7 += 96;
        if (v7 - (unsigned char *)*v6 == 4032)
        {
          uint64_t v9 = (char *)v6[1];
          ++v6;
          uint64_t v7 = v9;
        }
      }
      while (v7 != (char *)v8);
      uint64_t v3 = (void **)a1[1];
      unint64_t v4 = (void **)a1[2];
    }
  }
  *uint64_t v2 = 0;
  unint64_t v10 = (char *)v4 - (char *)v3;
  if ((unint64_t)((char *)v4 - (char *)v3) >= 0x11)
  {
    do
    {
      operator delete(*v3);
      unint64_t v4 = (void **)a1[2];
      uint64_t v3 = (void **)(a1[1] + 8);
      a1[1] = v3;
      unint64_t v10 = (char *)v4 - (char *)v3;
    }
    while ((unint64_t)((char *)v4 - (char *)v3) > 0x10);
  }
  unint64_t v11 = v10 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 21;
  }
  else
  {
    if (v11 != 2) {
      goto LABEL_16;
    }
    uint64_t v12 = 42;
  }
  a1[4] = v12;
LABEL_16:
  while (v3 != v4)
  {
    uint64_t v13 = *v3++;
    operator delete(v13);
  }
  return std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

char *std::vector<std::sub_match<char const*>>::__assign_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(void *a1, long long *a2, long long *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  int64x2_t result = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= a4)
  {
    uint64_t v19 = (char *)a1[1];
    uint64_t v14 = a1 + 1;
    uint64_t v13 = v19;
    unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((v19 - result) >> 3);
    if (v20 >= a4)
    {
      uint64_t v25 = result;
      if (a2 != a3)
      {
        uint64_t v26 = result;
        do
        {
          *(_OWORD *)uint64_t v26 = *v6;
          v26[16] = *((unsigned char *)v6 + 16);
          v25 += 24;
          uint64_t v6 = (long long *)((char *)v6 + 24);
          v26 += 24;
        }
        while (v6 != a3);
      }
      int64_t v18 = v25 - result;
      uint64_t v13 = result;
    }
    else
    {
      int64_t v21 = (long long *)((char *)a2 + 24 * v20);
      if (v13 != result)
      {
        do
        {
          *(_OWORD *)int64x2_t result = *v6;
          result[16] = *((unsigned char *)v6 + 16);
          uint64_t v6 = (long long *)((char *)v6 + 24);
          result += 24;
        }
        while (v6 != v21);
      }
      uint64_t v22 = v13;
      if (v21 != a3)
      {
        unint64_t v23 = v13;
        do
        {
          long long v24 = *v21;
          *((void *)v23 + 2) = *((void *)v21 + 2);
          *(_OWORD *)unint64_t v23 = v24;
          v23 += 24;
          int64_t v21 = (long long *)((char *)v21 + 24);
          v22 += 24;
        }
        while (v21 != a3);
      }
      int64_t v18 = v22 - v13;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v11;
    }
    int64x2_t result = std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](a1, v12);
    int64_t v15 = (char *)a1[1];
    uint64_t v14 = a1 + 1;
    uint64_t v13 = v15;
    uint64_t v16 = v15;
    if (v6 != a3)
    {
      uint64_t v16 = v13;
      do
      {
        long long v17 = *v6;
        *((void *)v16 + 2) = *((void *)v6 + 2);
        *(_OWORD *)uint64_t v16 = v17;
        v16 += 24;
        uint64_t v6 = (long long *)((char *)v6 + 24);
      }
      while (v6 != a3);
    }
    int64_t v18 = v16 - v13;
  }
  void *v14 = &v13[v18];
  return result;
}

char *std::vector<std::pair<unsigned long,char const*>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(void *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  int64x2_t result = (char *)*a1;
  if (a4 <= (v8 - (uint64_t)result) >> 4)
  {
    int64_t v18 = (char *)a1[1];
    uint64_t v13 = a1 + 1;
    unint64_t v12 = v18;
    unint64_t v19 = (v18 - result) >> 4;
    if (v19 >= a4)
    {
      uint64_t v26 = result;
      if (a2 != a3)
      {
        uint64_t v27 = result;
        do
        {
          uint64_t v28 = *v6;
          uint64_t v29 = v6[1];
          v6 += 2;
          *(void *)uint64_t v27 = v28;
          *((void *)v27 + 1) = v29;
          v27 += 16;
          v26 += 16;
        }
        while (v6 != a3);
      }
      long long v17 = (char *)(v26 - result);
      unint64_t v12 = result;
    }
    else
    {
      unint64_t v20 = (long long *)&a2[2 * v19];
      if (v12 != result)
      {
        do
        {
          uint64_t v21 = *v6;
          uint64_t v22 = v6[1];
          v6 += 2;
          *(void *)int64x2_t result = v21;
          *((void *)result + 1) = v22;
          result += 16;
        }
        while (v6 != (uint64_t *)v20);
      }
      unint64_t v23 = v12;
      if (v20 != (long long *)a3)
      {
        long long v24 = v12;
        do
        {
          long long v25 = *v20++;
          *(_OWORD *)long long v24 = v25;
          v24 += 16;
          v23 += 16;
        }
        while (v20 != (long long *)a3);
      }
      long long v17 = (char *)(v23 - v12);
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 >> 60) {
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 3;
    if (v8 >> 3 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    int64x2_t result = std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](a1, v11);
    uint64_t v14 = (char *)a1[1];
    uint64_t v13 = a1 + 1;
    unint64_t v12 = v14;
    int64_t v15 = v14;
    if (v6 != a3)
    {
      int64_t v15 = v12;
      do
      {
        long long v16 = *(_OWORD *)v6;
        v6 += 2;
        *(_OWORD *)int64_t v15 = v16;
        v15 += 16;
      }
      while (v6 != a3);
    }
    long long v17 = (char *)(v15 - v12);
  }
  *uint64_t v13 = &v17[(void)v12];
  return result;
}

void std::vector<std::sub_match<std::__wrap_iter<char const*>>>::resize(std::vector<std::ssub_match> *this, std::vector<std::ssub_match>::size_type __sz)
{
  std::vector<std::ssub_match>::size_type v2 = 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3);
  BOOL v3 = __sz >= v2;
  std::vector<std::ssub_match>::size_type v4 = __sz - v2;
  if (v4 != 0 && v3)
  {
    std::vector<std::sub_match<std::__wrap_iter<char const*>>>::__append(this, v4);
  }
  else if (!v3)
  {
    this->__end_ = &this->__begin_[__sz];
  }
}

void std::vector<std::sub_match<std::__wrap_iter<char const*>>>::__append(std::vector<std::ssub_match> *this, std::vector<std::ssub_match>::size_type __n)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  unint64_t v5 = value;
  uint64_t v7 = p_end_cap[-1].__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)v7) >> 3) >= __n)
  {
    if (__n)
    {
      uint64_t v13 = &v7[__n];
      std::vector<std::ssub_match>::size_type v14 = 24 * __n;
      do
      {
        v7->first.__i_ = 0;
        v7->second.__i_ = 0;
        v7->matched = 0;
        ++v7;
        v14 -= 24;
      }
      while (v14);
      uint64_t v7 = v13;
    }
    this->__end_ = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (char *)this->__begin_) >> 3);
    unint64_t v9 = v8 + __n;
    if (v8 + __n > 0xAAAAAAAAAAAAAAALL) {
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (char *)this->__begin_) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      unint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((uint64_t)p_end_cap, v11);
    }
    else {
      unint64_t v12 = 0;
    }
    int64_t v15 = (std::sub_match<std::__wrap_iter<const char *>> *)&v12[24 * v8];
    long long v16 = &v15[__n];
    std::vector<std::ssub_match>::size_type v17 = 24 * __n;
    int64_t v18 = v15;
    do
    {
      v18->first.__i_ = 0;
      v18->second.__i_ = 0;
      v18->matched = 0;
      ++v18;
      v17 -= 24;
    }
    while (v17);
    unint64_t v19 = (std::sub_match<std::__wrap_iter<const char *>> *)&v12[24 * v11];
    std::vector<std::ssub_match>::pointer begin = this->__begin_;
    std::vector<std::ssub_match>::pointer end = this->__end_;
    if (end != this->__begin_)
    {
      do
      {
        std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> v22 = end[-1].std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>>;
        *(void *)&v15[-1].matched = *(void *)&end[-1].matched;
        v15[-1].std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> = v22;
        --v15;
        --end;
      }
      while (end != begin);
      std::vector<std::ssub_match>::pointer end = this->__begin_;
    }
    this->__begin_ = v15;
    this->__end_ = v16;
    this->__end_cap_.__value_ = v19;
    if (end)
    {
      operator delete(end);
    }
  }
}

void std::vector<AlgosScoreStreamCSVFrameRow>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  std::vector<std::ssub_match>::size_type v2 = *a1;
  if (*v2)
  {
    std::vector<AlgosScoreStreamCSVFrameRow>::__clear[abi:ne180100]((uint64_t *)v2);
    BOOL v3 = **a1;
    operator delete(v3);
  }
}

void sub_21561F150(_Unwind_Exception *a1)
{
  BOOL v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21561F214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21561F3A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21561F46C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_215620144(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
}

void sub_215620318()
{
  objc_end_catch();
  JUMPOUT(0x215620330);
}

uint64_t std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(uint64_t *a1, const AlgosScoreStreamCSVFrameRow *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0x8E38E38E38E38E39 * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x38E38E38E38E38ELL) {
    std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x8E38E38E38E38E39 * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x1C71C71C71C71C7) {
    unint64_t v9 = 0x38E38E38E38E38ELL;
  }
  else {
    unint64_t v9 = v5;
  }
  std::vector<std::ssub_match>::size_type v17 = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AlgosScoreStreamCSVFrameRow>>(v7, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  uint64_t v13 = v10;
  std::vector<std::ssub_match>::size_type v14 = (AlgosScoreStreamCSVFrameRow *)&v10[72 * v4];
  long long v16 = &v10[72 * v9];
  AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(v14, a2);
  int64_t v15 = (char *)v14 + 72;
  std::vector<AlgosScoreStreamCSVFrameRow>::__swap_out_circular_buffer(a1, &v13);
  uint64_t v11 = a1[1];
  std::__split_buffer<AlgosScoreStreamCSVFrameRow>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_2156204A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<AlgosScoreStreamCSVFrameRow>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<AlgosScoreStreamCSVFrameRow>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<AlgosScoreStreamCSVFrameRow>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>>((uint64_t)(a1 + 2), a1[1], (const AlgosScoreStreamCSVFrameRow *)a1[1], *a1, (const AlgosScoreStreamCSVFrameRow *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<AlgosScoreStreamCSVFrameRow>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x38E38E38E38E38FLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(72 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<AlgosScoreStreamCSVFrameRow>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>>(uint64_t a1, uint64_t a2, const AlgosScoreStreamCSVFrameRow *a3, uint64_t a4, const AlgosScoreStreamCSVFrameRow *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  char v13 = 0;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    unint64_t v9 = a3;
    do
    {
      unint64_t v9 = (const AlgosScoreStreamCSVFrameRow *)((char *)v9 - 72);
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)(v7 - 72), v9);
      uint64_t v7 = *((void *)&v15 + 1) - 72;
      *((void *)&v15 + 1) -= 72;
    }
    while (v9 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamCSVFrameRow>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

void sub_215620628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamCSVFrameRow>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamCSVFrameRow>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamCSVFrameRow>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 72;
  }
}

uint64_t std::__split_buffer<AlgosScoreStreamCSVFrameRow>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<AlgosScoreStreamCSVFrameRow>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 9;
      *(void *)(a1 + 16) = v2 - 9;
      if (*((char *)v2 - 49) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void sub_215620A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33)
{
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&a24, a25);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&a32, a33);

  _Unwind_Resume(a1);
}

void sub_2156214A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,int a42,__int16 a43,char a44,char a45,void *__p,uint64_t a47,int a48,__int16 a49,char a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,void *a58)
{
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v59, a58);

  _Unwind_Resume(a1);
}

void *AlgosScoreStreamFrameRow::StringForEvent@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 >= 6) {
    uint64_t v2 = "INVALID EVENT";
  }
  else {
    uint64_t v2 = AlgosScoreStreamFrameRow::event_strings[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void AlgosScoreStreamFrameRow::GetParam(uint64_t a1@<X0>, const void **a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  uint64_t v7 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>(a1 + 40, a2);
  if (a1 + 48 == v7)
  {
    if ((*(char *)(a3 + 23) & 0x80000000) == 0)
    {
      *(_OWORD *)&a4->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
      a4->__r_.__value_.__r.__words[2] = *(void *)(a3 + 16);
      return;
    }
    unint64_t v9 = *(const std::string::value_type **)a3;
    std::string::size_type v10 = *(void *)(a3 + 8);
  }
  else
  {
    if ((*(char *)(v7 + 79) & 0x80000000) == 0)
    {
      long long v8 = *(_OWORD *)(v7 + 56);
      a4->__r_.__value_.__r.__words[2] = *(void *)(v7 + 72);
      *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v8;
      return;
    }
    unint64_t v9 = *(const std::string::value_type **)(v7 + 56);
    std::string::size_type v10 = *(void *)(v7 + 64);
  }
  std::string::__init_copy_ctor_external(a4, v9, v10);
}

void sub_2156218A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_215621B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  _Unwind_Resume(a1);
}

uint64_t std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    BOOL v7 = std::less<std::string>::operator()[abi:ne180100](v5, (const void **)(v3 + 32), a2);
    long long v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      long long v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || std::less<std::string>::operator()[abi:ne180100](v5, a2, (const void **)(v6 + 32))) {
    return v2;
  }
  return v6;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    long long v8 = a3;
  }
  else {
    long long v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

_OWORD *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  uint64_t v6 = (void **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>((uint64_t)a1, &v14, a2);
  size_t v7 = *v6;
  if (!*v6)
  {
    long long v8 = (uint64_t **)v6;
    size_t v7 = operator new(0x50uLL);
    v12[1] = a1 + 1;
    size_t v9 = *a4;
    uint64_t v10 = *((void *)*a4 + 2);
    v7[2] = **a4;
    *((void *)v7 + 6) = v10;
    v9[1] = 0;
    v9[2] = 0;
    *size_t v9 = 0;
    *((void *)v7 + 8) = 0;
    *((void *)v7 + 9) = 0;
    *((void *)v7 + 7) = 0;
    char v13 = 1;
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__insert_node_at(a1, v14, v8, (uint64_t *)v7);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v7;
}

void *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>(uint64_t a1, void *a2, const void **a3)
{
  size_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        long long v8 = (void *)v4;
        size_t v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        size_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3)) {
        break;
      }
      size_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    long long v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  size_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), size_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            size_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            size_t v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *size_t v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), size_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *size_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamFrameRow>,std::reverse_iterator<AlgosScoreStreamFrameRow*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  if (v1 != v2)
  {
    uint64_t v3 = v1 + 40;
    do
    {
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v3, *(void **)(v3 + 8));
      uint64_t v4 = v3 + 24;
      v3 += 64;
    }
    while (v4 != v2);
  }
}

void AlgosScoreConnectionFrameRow::AlgosScoreConnectionFrameRow(AlgosScoreConnectionFrameRow *this, unint64_t a2, double a3, double a4, double a5, double a6, double a7, int a8)
{
  *((double *)this + 1) = a3;
  *((double *)this + 2) = a4;
  *((double *)this + 3) = a5;
  *((double *)this + 4) = a6;
  *((double *)this + 5) = a7;
  *((_DWORD *)this + 14) = a8;
  *(void *)this = a2;
  if (a4 == -1.0)
  {
    *((void *)this + 6) = 0;
    *((_DWORD *)this + 14) = -1;
  }
  else if (a4 == 0.0)
  {
    *((void *)this + 6) = 0x54E6DC186EF9F45CLL;
  }
  else
  {
    *((double *)this + 6) = (double)a2 / a4;
  }
}

void AlgosScoreConnectionFrameRow::AlgosScoreConnectionFrameRow(AlgosScoreConnectionFrameRow *this, const AlgosScoreConnectionFrameRow *a2)
{
  *(_OWORD *)((char *)this + 8) = *(_OWORD *)((char *)a2 + 8);
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)a2 + 24);
  *((_DWORD *)this + 14) = *((_DWORD *)a2 + 14);
  *(_OWORD *)((char *)this + 40) = *(_OWORD *)((char *)a2 + 40);
  *(void *)this = *(void *)a2;
}

void sub_215623284(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21562333C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2156234C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_215623580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

#error "215624494: call analysis failed (funcsize=35)"

void sub_2156244AC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow(uint64_t a1, const std::string *a2, const std::string *a3, double a4, double a5)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  int v8 = (std::string *)(a1 + 24);
  *(_OWORD *)a1 = 0u;
  *(double *)(a1 + 56) = a4;
  std::string::operator=((std::string *)a1, a2);
  *(double *)(a1 + 48) = a5;
  std::string::operator=(v8, a3);
  return a1;
}

void sub_215624570(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 47) < 0) {
    operator delete(*v2);
  }
  AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((void **)v1);
  _Unwind_Resume(a1);
}

void AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow(AlgosScoreCombinerFrameRow *this, const std::string *a2)
{
  uint64_t v4 = (std::string *)((char *)this + 24);
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  *((void *)this + 7) = a2[2].__r_.__value_.__l.__size_;
  std::string::operator=((std::string *)this, a2);
  *((void *)this + 6) = a2[2].__r_.__value_.__l.__data_;
  std::string::operator=(v4, a2 + 1);
}

void sub_2156245F8(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 47) < 0) {
    operator delete(*v2);
  }
  AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((void **)v1);
  _Unwind_Resume(a1);
}

std::string *AlgosScoreCombinerFrameRow::operator=(std::string *a1, const std::string *a2)
{
  a1[2].__r_.__value_.__l.__size_ = a2[2].__r_.__value_.__l.__size_;
  std::string::operator=(a1, a2);
  a1[2].__r_.__value_.__r.__words[0] = a2[2].__r_.__value_.__r.__words[0];
  std::string::operator=(a1 + 1, a2 + 1);
  return a1;
}

void *AlgosScoreCombinerFrameRow::GetHeaderDescription@<X0>(void *a1@<X8>)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x100uLL, "     %-10s %-10s %-10s %-10s", "score", "type", "weight", "label");
  return std::string::basic_string[abi:ne180100]<0>(a1, __str);
}

void *AlgosScoreCombinerFrameRow::GetRawDescription@<X0>(AlgosScoreCombinerFrameRow *this@<X0>, void *a2@<X8>)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = (const char *)this;
  if (*((char *)this + 23) < 0) {
    uint64_t v3 = *(const char **)this;
  }
  uint64_t v4 = (char *)this + 24;
  if (*((char *)this + 47) < 0) {
    uint64_t v4 = *(const char **)v4;
  }
  snprintf(__str, 0x100uLL, "%-10.3f %-10s %-10.3f %-10s", *((double *)this + 7), v3, *((double *)this + 6), v4);
  return std::string::basic_string[abi:ne180100]<0>(a2, __str);
}

void AlgosScoreCombinerFrame::DebugPrint(const std::string **this, int a2)
{
  AlgosScoreCombinerFrameRow::GetHeaderDescription(__p);
  if (v13 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  puts((const char *)v4);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v5 = *this;
  int v6 = this[1];
  if (*this != v6)
  {
    int v7 = 0;
    do
    {
      AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)__p, v5);
      if (a2 >= 1)
      {
        AlgosScoreCombinerFrameRow::GetRawDescription((AlgosScoreCombinerFrameRow *)__p, v10);
        if (v11 >= 0) {
          int v8 = v10;
        }
        else {
          int v8 = (void **)v10[0];
        }
        printf("%3d: %s\n", v7, (const char *)v8);
        if (v11 < 0) {
          operator delete(v10[0]);
        }
        ++v7;
      }
      if (v15 < 0) {
        operator delete(v14);
      }
      if (v13 < 0) {
        operator delete(__p[0]);
      }
      BOOL v9 = __OFSUB__(a2--, 1);
      if (a2 < 0 != v9) {
        break;
      }
      uint64_t v5 = (const std::string *)((char *)v5 + 64);
    }
    while (v5 != v6);
  }
}

void sub_2156248B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow((void **)va);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void **a1)
{
}

void *AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow(void *a1, const std::string *a2)
{
  a1[6] = 0;
  a1[5] = a1 + 6;
  a1[7] = 0;
  if (!AlgosScoreStreamFrameRow::SetCSVRow((uint64_t)a1, a2))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "AlgosScoreStreamFrameRow can't parse the CSV");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C3A0] + 16);
    __cxa_throw(exception, (struct type_info *)off_264253238, MEMORY[0x263F8C080]);
  }
  return a1;
}

void sub_215624974(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v1, *v3);
  _Unwind_Resume(a1);
}

BOOL AlgosScoreStreamFrameRow::SetCSVRow(uint64_t a1, const std::string *a2)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](v38, a2, 24);
  memset(&v37, 0, sizeof(v37));
  unint64_t v34 = 0;
  uint64_t v35 = 0;
  unint64_t v36 = 0;
  while (1)
  {
    uint64_t v3 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v38, (uint64_t)&v37, 0x2Cu);
    uint64_t v4 = v35;
    if ((*((unsigned char *)v3 + *(void *)(*v3 - 24) + 32) & 5) != 0) {
      break;
    }
    if ((unint64_t)v35 >= v36)
    {
      int v6 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v34, (long long *)&v37);
    }
    else
    {
      if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(v35, v37.__r_.__value_.__l.__data_, v37.__r_.__value_.__l.__size_);
      }
      else
      {
        long long v5 = *(_OWORD *)&v37.__r_.__value_.__l.__data_;
        v35->__r_.__value_.__r.__words[2] = v37.__r_.__value_.__r.__words[2];
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
      }
      int v6 = v4 + 1;
    }
    uint64_t v35 = v6;
  }
  int v7 = (std::string::size_type *)MEMORY[0x263F8C2B8];
  if (0xAAAAAAAAAAAAAAABLL * (((char *)v35 - (char *)v34) >> 3) < 6) {
    goto LABEL_21;
  }
  *(_DWORD *)a1 = AlgosScoreStreamFrameRow::EventForString(v34);
  *(double *)(a1 + 8) = std::stod((const std::string *)v34 + 1, 0);
  *(double *)(a1 + 16) = std::stod((const std::string *)v34 + 2, 0);
  *(double *)(a1 + 24) = std::stod((const std::string *)v34 + 3, 0);
  *(double *)(a1 + 32) = std::stod((const std::string *)v34 + 4, 0);
  if (*((char *)v34 + 143) < 0) {
    std::string::__init_copy_ctor_external(&__str, (const std::string::value_type *)v34[15], (std::string::size_type)v34[16]);
  }
  else {
    std::string __str = *(std::string *)((unsigned char *)v34 + 5);
  }
  std::string::size_type v8 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
  {
    if (*__str.__r_.__value_.__l.__data_ != 34) {
      goto LABEL_47;
    }
    std::string::size_type size = __str.__r_.__value_.__l.__size_;
  }
  else
  {
    if (__str.__r_.__value_.__s.__data_[0] != 34)
    {
LABEL_21:
      BOOL v11 = 0;
      goto LABEL_53;
    }
    std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  }
  std::string::size_type v10 = size - 1;
  if ((*((unsigned char *)&__str.__r_.__value_.__s + 23) & 0x80) != 0)
  {
    if (*(unsigned char *)(__str.__r_.__value_.__r.__words[0] + v10) == 34)
    {
      std::string::size_type v8 = __str.__r_.__value_.__l.__size_;
      goto LABEL_24;
    }
LABEL_47:
    BOOL v11 = 0;
LABEL_52:
    operator delete(__str.__r_.__value_.__l.__data_);
    goto LABEL_53;
  }
  if (__str.__r_.__value_.__s.__data_[v10] != 34) {
    goto LABEL_21;
  }
LABEL_24:
  std::string::basic_string(&v28, &__str, 1uLL, v8 - 2, (std::allocator<char> *)&v27);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  std::string __str = v28;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t *)&v28, &__str, 24);
  uint64_t v12 = (uint64_t **)(a1 + 40);
  while (1)
  {
    char v13 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v28, (uint64_t)&v37, 0x20u);
    BOOL v11 = (*(_DWORD *)((unsigned char *)v13 + *(void *)(*v13 - 24) + 32) & 5) != 0;
    if ((*(_DWORD *)((unsigned char *)v13 + *(void *)(*v13 - 24) + 32) & 5) != 0) {
      break;
    }
    int64_t v14 = (v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? HIBYTE(v37.__r_.__value_.__r.__words[2])
        : v37.__r_.__value_.__l.__size_;
    char v15 = (v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &v37
        : (std::string *)v37.__r_.__value_.__r.__words[0];
    if (v14 < 1) {
      break;
    }
    long long v16 = (char *)v15 + v14;
    size_t v17 = v14;
    int64_t v18 = v15;
    while (1)
    {
      unint64_t v19 = memchr(v18, 58, v17);
      if (!v19)
      {
LABEL_48:
        BOOL v11 = 0;
        goto LABEL_49;
      }
      if (*v19 == 58) {
        break;
      }
      int64_t v18 = (std::string *)(v19 + 1);
      size_t v17 = v16 - (unsigned char *)v18;
      if (v16 - (unsigned char *)v18 < 1) {
        goto LABEL_48;
      }
    }
    if (v19 == v16) {
      break;
    }
    std::string::size_type v20 = v19 - (unsigned char *)v15;
    if (v20 == -1) {
      break;
    }
    std::string::basic_string(&v27, &v37, v20 + 1, v14 - 2, (std::allocator<char> *)&v26);
    std::string::basic_string(&v26, &v37, 0, v20, (std::allocator<char> *)v41);
    v41[0] = &v26;
    uint64_t v21 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v12, (const void **)&v26.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, v41);
    std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> v22 = (void **)v21 + 7;
    if (*((char *)v21 + 79) < 0) {
      operator delete(*v22);
    }
    *(std::string *)std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> v22 = v27;
    *((unsigned char *)&v27.__r_.__value_.__s + 23) = 0;
    v27.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v26.__r_.__value_.__l.__data_);
      if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v27.__r_.__value_.__l.__data_);
      }
    }
  }
LABEL_49:
  v28.__r_.__value_.__r.__words[0] = *v7;
  std::string::size_type v23 = v7[9];
  *(std::string::size_type *)((char *)v28.__r_.__value_.__r.__words + *(void *)(v28.__r_.__value_.__r.__words[0] - 24)) = v7[8];
  v28.__r_.__value_.__r.__words[2] = v23;
  uint64_t v29 = MEMORY[0x263F8C318] + 16;
  if (v31 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x2166BF020](&v32);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_52;
  }
LABEL_53:
  v28.__r_.__value_.__r.__words[0] = (std::string::size_type)&v34;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v28);
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  v38[0] = *v7;
  uint64_t v24 = v7[9];
  *(uint64_t *)((char *)v38 + *(void *)(v38[0] - 24)) = v7[8];
  v38[2] = v24;
  v38[3] = MEMORY[0x263F8C318] + 16;
  if (v39 < 0) {
    operator delete((void *)v38[11]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x2166BF020](&v40);
  return v11;
}

void sub_215624F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57,uint64_t a58,int a59,__int16 a60,char a61,char a62,char a63)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a22);
  if (a62 < 0) {
    operator delete(a57);
  }
  a22 = (uint64_t)&a63;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a22);
  if (a71 < 0) {
    operator delete(a66);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a72);
  _Unwind_Resume(a1);
}

void AlgosScoreStreamFrameRow::GetParamString(AlgosScoreStreamFrameRow *this@<X0>, uint64_t a2@<X8>)
{
  v24[2] = *MEMORY[0x263EF8340];
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  uint64_t v3 = (long long *)*((void *)this + 5);
  uint64_t v4 = (char *)this + 48;
  if (v3 != (long long *)((char *)this + 48))
  {
    long long v5 = (void *)(a2 + 8);
    do
    {
      std::pair<std::string const,std::string>::pair[abi:ne180100](&v21, v3 + 2);
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a2, (const void **)&v21.__r_.__value_.__l.__data_, (uint64_t)&v18);
      int v6 = std::string::append(&v18, ":");
      long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
      v19.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v7;
      v6->__r_.__value_.__l.__size_ = 0;
      v6->__r_.__value_.__r.__words[2] = 0;
      v6->__r_.__value_.__r.__words[0] = 0;
      if ((v23 & 0x80u) == 0) {
        std::string::size_type v8 = __p;
      }
      else {
        std::string::size_type v8 = (void **)__p[0];
      }
      if ((v23 & 0x80u) == 0) {
        std::string::size_type v9 = v23;
      }
      else {
        std::string::size_type v9 = (std::string::size_type)__p[1];
      }
      std::string::size_type v10 = std::string::append(&v19, (const std::string::value_type *)v8, v9);
      long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
      v20.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v11;
      v10->__r_.__value_.__l.__size_ = 0;
      v10->__r_.__value_.__r.__words[2] = 0;
      v10->__r_.__value_.__r.__words[0] = 0;
      uint64_t v12 = std::string::append(&v20, " ");
      std::string::size_type v13 = v12->__r_.__value_.__r.__words[0];
      v24[0] = v12->__r_.__value_.__l.__size_;
      *(void *)((char *)v24 + 7) = *(std::string::size_type *)((char *)&v12->__r_.__value_.__r.__words[1] + 7);
      char v14 = HIBYTE(v12->__r_.__value_.__r.__words[2]);
      v12->__r_.__value_.__l.__size_ = 0;
      v12->__r_.__value_.__r.__words[2] = 0;
      v12->__r_.__value_.__r.__words[0] = 0;
      if (*(char *)(a2 + 23) < 0) {
        operator delete(*(void **)a2);
      }
      *(void *)a2 = v13;
      *long long v5 = v24[0];
      *(void *)(a2 + 15) = *(void *)((char *)v24 + 7);
      *(unsigned char *)(a2 + 23) = v14;
      if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v20.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v19.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v18.__r_.__value_.__l.__data_);
      }
      if ((char)v23 < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v21.__r_.__value_.__l.__data_);
      }
      char v15 = (long long *)*((void *)v3 + 1);
      if (v15)
      {
        do
        {
          long long v16 = v15;
          char v15 = *(long long **)v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          long long v16 = (long long *)*((void *)v3 + 2);
          BOOL v17 = *(void *)v16 == (void)v3;
          uint64_t v3 = v16;
        }
        while (!v17);
      }
      uint64_t v3 = v16;
    }
    while (v16 != (long long *)v4);
  }
}

void sub_21562523C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow(&a29);
  if (*(char *)(v29 + 23) < 0) {
    operator delete(*(void **)v29);
  }
  _Unwind_Resume(a1);
}

uint64_t std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  if (*((char *)a1 + 23) >= 0) {
    size_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v5 = (size_t)a1[1];
  }
  if (*((char *)a2 + 23) >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  uint64_t result = std::string::basic_string[abi:ne180100](a3, v6 + v5);
  if (*(char *)(result + 23) >= 0) {
    std::string::size_type v8 = (char *)result;
  }
  else {
    std::string::size_type v8 = *(char **)result;
  }
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0) {
      std::string::size_type v9 = a1;
    }
    else {
      std::string::size_type v9 = *a1;
    }
    uint64_t result = (uint64_t)memmove(v8, v9, v5);
  }
  std::string::size_type v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0) {
      long long v11 = a2;
    }
    else {
      long long v11 = *a2;
    }
    uint64_t result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

std::string *AlgosScoreStreamFrameRow::GetCSVHeader@<X0>(AlgosScoreStreamFrameRow *this@<X0>, std::string *a2@<X8>)
{
  int v2 = (int)this;
  uint64_t result = (std::string *)std::string::basic_string[abi:ne180100]<0>(a2, "Event,Start,End,Weight,Quality,Params");
  if (v2)
  {
    size_t v5 = std::string::append(a2, "\n");
    return std::string::operator=(a2, v5);
  }
  return result;
}

void sub_2156253D0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void AlgosScoreStreamFrameRow::GetCSVRow(AlgosScoreStreamFrameRow *this@<X0>, int a2@<W1>, void *a3@<X8>)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(&v20, "%s,%.17g,%.17g,%.17g,%.17g,\"%s\"");
  if (a2)
  {
    size_t v6 = std::string::append(&v20, "\n");
    std::string::operator=(&v20, v6);
  }
  if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v7 = &v20;
  }
  else {
    long long v7 = (std::string *)v20.__r_.__value_.__r.__words[0];
  }
  AlgosScoreStreamFrameRow::StringForEvent(*(_DWORD *)this, v18);
  int v8 = v19;
  std::string::size_type v9 = (void **)v18[0];
  uint64_t v10 = *((void *)this + 1);
  uint64_t v11 = *((void *)this + 2);
  uint64_t v12 = *((void *)this + 3);
  uint64_t v13 = *((void *)this + 4);
  AlgosScoreStreamFrameRow::GetParamString(this, (uint64_t)__p);
  char v14 = v18;
  if (v8 < 0) {
    char v14 = v9;
  }
  if (v17 >= 0) {
    char v15 = __p;
  }
  else {
    char v15 = (void **)__p[0];
  }
  snprintf(__str, 0x400uLL, (const char *)v7, v14, v10, v11, v12, v13, v15);
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  if (v19 < 0) {
    operator delete(v18[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(a3, __str);
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v20.__r_.__value_.__l.__data_);
  }
}

void sub_215625558(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t *a1, const std::string *a2, int a3)
{
  uint64_t v6 = MEMORY[0x263F8C328] + 104;
  a1[16] = MEMORY[0x263F8C328] + 104;
  long long v7 = a1 + 2;
  uint64_t v8 = MEMORY[0x263F8C328] + 64;
  a1[2] = MEMORY[0x263F8C328] + 64;
  uint64_t v9 = (uint64_t)(a1 + 3);
  uint64_t v10 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v11 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v12 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *a1 = v12;
  *(uint64_t *)((char *)a1 + *(void *)(v12 - 24)) = v11;
  a1[1] = 0;
  uint64_t v13 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v13, a1 + 3);
  uint64_t v14 = MEMORY[0x263F8C328] + 24;
  v13[1].__vftable = 0;
  v13[1].__fmtflags_ = -1;
  uint64_t v15 = v10[5];
  uint64_t v16 = v10[4];
  a1[2] = v16;
  *(void *)((char *)v7 + *(void *)(v16 - 24)) = v15;
  uint64_t v17 = v10[1];
  *a1 = v17;
  *(uint64_t *)((char *)a1 + *(void *)(v17 - 24)) = v10[6];
  *a1 = v14;
  a1[16] = v6;
  a1[2] = v8;
  std::stringbuf::basic_stringbuf[abi:ne180100](v9, a2, a3);
  return a1;
}

void sub_215625834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void *std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, uint64_t a2, unsigned __int8 a3)
{
  MEMORY[0x2166BEF40](&v11, a1, 1);
  if (!v11) {
    return a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    long long v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    uint64_t v8 = (unsigned char *)v7[3];
    if (v8 != (unsigned char *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80))(v7);
    if (v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(void *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_2156259BC(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x21562597CLL);
  }
  __cxa_rethrow();
}

void sub_215625A38(_Unwind_Exception *a1)
{
}

uint64_t AlgosScoreStreamFrameRow::EventForString(const void **a1)
{
  {
    qword_26787A788 = 0;
    qword_26787A780 = 0;
    AlgosScoreStreamFrameRow::EventForString(std::string &)::event_map = (uint64_t)&qword_26787A780;
    __cxa_atexit((void (*)(void *))std::map<std::string,AlgosEventTypes>::~map[abi:ne180100], &AlgosScoreStreamFrameRow::EventForString(std::string &)::event_map, &dword_21560C000);
  }
  if (!qword_26787A788)
  {
    for (uint64_t i = 0; i != 6; ++i)
    {
      std::string::basic_string[abi:ne180100]<0>(&__p, AlgosScoreStreamFrameRow::event_strings[i]);
      v11.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,AlgosEventTypes>,std::__map_value_compare<std::string,std::__value_type<std::string,AlgosEventTypes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,AlgosEventTypes>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&AlgosScoreStreamFrameRow::EventForString(std::string &)::event_map, (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, &v11)+ 14) = i;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
  }
  uint64_t v3 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>((uint64_t)&AlgosScoreStreamFrameRow::EventForString(std::string &)::event_map, a1);
  if ((uint64_t *)v3 == &qword_26787A780)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::operator+<char>();
    uint64_t v6 = std::string::append(&v10, "\"");
    long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    v11.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    uint64_t v8 = std::string::append(&v11, " is not a valid event");
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    __p.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    std::logic_error::logic_error(exception, &__p);
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
    __cxa_throw(exception, (struct type_info *)off_264253230, MEMORY[0x263F8C068]);
  }
  return *(unsigned int *)(v3 + 56);
}

void sub_215625C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v29 & 1) == 0) {
LABEL_10:
    }
      _Unwind_Resume(a1);
  }
  else if (!v29)
  {
    goto LABEL_10;
  }
  __cxa_free_exception(v28);
  goto LABEL_10;
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x2166BF020](a1 + 128);
  return a1;
}

std::string *std::pair<std::string const,std::string>::pair[abi:ne180100](std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  size_t v5 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v6 = *(long long *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  return this;
}

void sub_215625E8C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::map<std::string,AlgosEventTypes>::~map[abi:ne180100](uint64_t a1)
{
  return a1;
}

void std::__tree<std::__value_type<std::string,AlgosEventTypes>,std::__map_value_compare<std::string,std::__value_type<std::string,AlgosEventTypes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,AlgosEventTypes>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,AlgosEventTypes>,std::__map_value_compare<std::string,std::__value_type<std::string,AlgosEventTypes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,AlgosEventTypes>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<std::string,AlgosEventTypes>,std::__map_value_compare<std::string,std::__value_type<std::string,AlgosEventTypes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,AlgosEventTypes>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

_OWORD *std::__tree<std::__value_type<std::string,AlgosEventTypes>,std::__map_value_compare<std::string,std::__value_type<std::string,AlgosEventTypes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,AlgosEventTypes>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  long long v6 = (void **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>((uint64_t)a1, &v12, a2);
  long long v7 = *v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    long long v7 = operator new(0x40uLL);
    long long v9 = *a4;
    uint64_t v10 = *((void *)*a4 + 2);
    v7[2] = **a4;
    *((void *)v7 + 6) = v10;
    v9[1] = 0;
    v9[2] = 0;
    *long long v9 = 0;
    *((_DWORD *)v7 + 14) = 0;
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__insert_node_at(a1, v12, v8, (uint64_t *)v7);
  }
  return v7;
}

void *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_leaf_high(uint64_t a1, void *a2, const void **a3)
{
  size_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        size_t v5 = (void *)v4;
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v5;
        uint64_t result = v5;
        if (!*v5) {
          goto LABEL_9;
        }
      }
      uint64_t v4 = v5[1];
    }
    while (v4);
    uint64_t result = v5 + 1;
  }
  else
  {
    uint64_t result = (void *)(a1 + 8);
  }
LABEL_9:
  *a2 = v5;
  return result;
}

void *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 16);
  if (result)
  {
    uint64_t v3 = (void *)*result;
    if (*result == a1)
    {
      *uint64_t result = 0;
      while (1)
      {
        uint64_t v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          uint64_t result = v4;
          uint64_t v4 = (void *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; uint64_t v3 = (void *)result[1])
      {
        do
        {
          uint64_t result = v3;
          uint64_t v3 = (void *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*(void *)a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        uint64_t v3 = (void *)v3[2];
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*(void *)a1, v2);
  }
  return a1;
}

uint64_t *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_multi<std::pair<std::string const,std::string> const&>(uint64_t **a1, long long *a2)
{
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__construct_node<std::pair<std::string const,std::string> const&>((uint64_t)a1, a2, (uint64_t)v7);
  leaf_high = (uint64_t **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_leaf_high((uint64_t)a1, &v6, (const void **)v7[0] + 4);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__insert_node_at(a1, v6, leaf_high, v7[0]);
  uint64_t v4 = v7[0];
  v7[0] = 0;
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)v7, 0);
  return v4;
}

void sub_215626168(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__construct_node<std::pair<std::string const,std::string> const&>@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x50uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t result = std::pair<std::string const,std::string>::pair[abi:ne180100]((std::string *)(v6 + 32), a2);
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_2156261D4(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    uint64_t v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

uint64_t std::stringbuf::basic_stringbuf[abi:ne180100](uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6 = std::streambuf::basic_streambuf();
  *(void *)uint64_t v6 = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  std::stringbuf::__init_buf_ptrs[abi:ne180100](a1);
  return a1;
}

void sub_2156262F0(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 87) < 0) {
    operator delete(*v2);
  }
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void std::stringbuf::__init_buf_ptrs[abi:ne180100](uint64_t a1)
{
  *(void *)(a1 + 88) = 0;
  uint64_t v2 = (std::string *)(a1 + 64);
  char v3 = *(unsigned char *)(a1 + 87);
  if (v3 < 0)
  {
    uint64_t v4 = *(std::string **)(a1 + 64);
    unint64_t v5 = *(void *)(a1 + 72);
  }
  else
  {
    uint64_t v4 = v2;
    unint64_t v5 = *(unsigned __int8 *)(a1 + 87);
  }
  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    std::string::size_type v7 = v3 < 0 ? (*(void *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    uint64_t v8 = *(char *)(a1 + 87) < 0 ? *(void *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(void *)(a1 + 40) = v4;
    *(void *)(a1 + 48) = v4;
    *(void *)(a1 + 56) = (char *)v4 + v8;
    if ((*(unsigned char *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        uint64_t v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        unint64_t v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        uint64_t v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        unint64_t v5 = v5 - v10 - 0x7FFFFFFF;
        *(void *)(a1 + 48) = v4;
      }
      if (v5) {
        *(void *)(a1 + 48) = (char *)v4 + v5;
      }
    }
  }
}

void std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

uint64_t std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow(void **a1)
{
  if (*((char *)a1 + 23) < 0) {
    OUTLINED_FUNCTION_0(a1);
  }
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x270F982D8](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x270F98338](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x270F98440](this, *(void *)&__ecode);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F98568](this, __c);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x270F98890](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x270F98A00](retstr, __s);
}

double std::stod(const std::string *__str, size_t *__idx)
{
  MEMORY[0x270F98B68](__str, __idx);
  return result;
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x270F98C70](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x270F98C78](this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
}

void std::terminate(void)
{
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

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
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

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

void bzero(void *a1, size_t a2)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

long double log1p(long double __x)
{
  MEMORY[0x270EDA0C0](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

double nan(const char *a1)
{
  MEMORY[0x270EDA600](a1);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}