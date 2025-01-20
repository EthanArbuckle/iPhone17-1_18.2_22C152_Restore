uint64_t std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(uint64_t a1, std::sub_match<const char *> *a2, std::sub_match<const char *> *a3, std::vector<std::csub_match> *this, int a5)
{
  int v9;
  int v10;
  const std::vector<std::csub_match>::value_type *v11;
  int v12;
  const char *i;
  std::vector<std::csub_match>::pointer begin;
  std::sub_match<const char *> *first;
  std::sub_match<const char *> *second;
  uint64_t result;

  if ((a5 & 0x80) != 0) {
    v9 = a5 & 0xFFA;
  }
  else {
    v9 = a5;
  }
  v10 = *(_DWORD *)(a1 + 28);
  this[1].__begin_ = a3;
  v11 = (const std::vector<std::csub_match>::value_type *)&this[1];
  this[1].__end_ = a3;
  LOBYTE(this[1].__end_cap_.__value_) = 0;
  std::vector<std::sub_match<char const*>>::assign(this, (v10 + 1), (std::vector<std::csub_match>::const_reference)&this[1]);
  this[2].__begin_ = a2;
  this[2].__end_ = a2;
  LOBYTE(this[2].__end_cap_.__value_) = 0;
  *(std::pair<const char *, const char *> *)&this[3].__begin_ = v11->std::pair<const char *, const char *>;
  LOBYTE(this[3].__end_cap_.__value_) = this[1].__end_cap_.__value_;
  if ((v9 & 0x800) == 0) {
    this[4].__end_ = a2;
  }
  LOBYTE(this[4].__begin_) = 1;
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0)
  {
    if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a2, (const char *)a3, (uint64_t *)this, v9, (v9 & 0x800) == 0))goto LABEL_28; {
    goto LABEL_13;
    }
  }
  if (*(_DWORD *)(a1 + 28))
  {
    if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a2, (const char *)a3, (uint64_t *)this, v9, (v9 & 0x800) == 0))goto LABEL_28; {
LABEL_13:
    }
    if (a2 != a3 && (v9 & 0x40) == 0)
    {
      v12 = v9 | 0x80;
      for (i = (char *)&a2->first + 1; i != (const char *)a3; ++i)
      {
        std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3), v11);
        if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0)
        {
          if (*(_DWORD *)(a1 + 28))
          {
            if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, i, (const char *)a3, (uint64_t *)this, v12, 0))goto LABEL_28; {
          }
            }
          else if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)i, (uint64_t)a3, (uint64_t *)this, v12, 0))
          {
            goto LABEL_28;
          }
        }
        else if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, i, (const char *)a3, (uint64_t *)this, v12, 0))
        {
          goto LABEL_28;
        }
        std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3), v11);
      }
      std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3), v11);
      if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0)
      {
        if (*(_DWORD *)(a1 + 28))
        {
          if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a3, (const char *)a3, (uint64_t *)this, v12, 0))goto LABEL_28; {
        }
          }
        else if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)a3, (uint64_t)a3, (uint64_t *)this, v12, 0))
        {
          goto LABEL_28;
        }
      }
      else if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a3, (const char *)a3, (uint64_t *)this, v12, 0))
      {
        goto LABEL_28;
      }
    }
    result = 0;
    this->__end_ = this->__begin_;
    return result;
  }
  if ((std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)a2, (uint64_t)a3, (uint64_t *)this, v9, (v9 & 0x800) == 0) & 1) == 0)goto LABEL_13; {
LABEL_28:
  }
  if (this->__end_ == this->__begin_) {
    begin = (std::vector<std::csub_match>::pointer)v11;
  }
  else {
    begin = this->__begin_;
  }
  first = (std::sub_match<const char *> *)begin->first;
  this[2].__end_ = (std::vector<std::csub_match>::pointer)begin->first;
  LOBYTE(this[2].__end_cap_.__value_) = this[2].__begin_ != first;
  second = (std::sub_match<const char *> *)begin->second;
  this[3].__begin_ = second;
  LOBYTE(this[3].__end_cap_.__value_) = second != this[3].__end_;
  return 1;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  v46 = 0;
  v47 = 0;
  unint64_t v48 = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    __x.second = a3;
    *(void *)&__x.matched = 0xAAAAAAAAAAAAAA00;
    __x.first = a3;
    *(_DWORD *)v44 = 0;
    memset(&v44[8], 0, 85);
    v13 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v46, (uint64_t)v44);
    v47 = v13;
    if (*(void *)&v44[56]) {
      operator delete(*(void **)&v44[56]);
    }
    if (*(void *)&v44[32]) {
      operator delete(*(void **)&v44[32]);
    }
    uint64_t v14 = *((void *)v13 - 8);
    *((_DWORD *)v13 - 24) = 0;
    *((void *)v13 - 11) = a2;
    *((void *)v13 - 10) = a2;
    *((void *)v13 - 9) = a3;
    unint64_t v15 = *(unsigned int *)(a1 + 28);
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v13 - 7) - v14) >> 3);
    if (v15 <= v16)
    {
      if (v15 < v16) {
        *((void *)v13 - 7) = v14 + 24 * v15;
      }
    }
    else
    {
      std::vector<std::sub_match<char const*>>::__append((std::vector<std::csub_match> *)(v13 - 64), v15 - v16, &__x);
    }
    uint64_t v17 = *((void *)v13 - 5);
    unint64_t v18 = *(unsigned int *)(a1 + 32);
    unint64_t v19 = (*((void *)v13 - 4) - v17) >> 4;
    if (v18 <= v19)
    {
      if (v18 < v19) {
        *((void *)v13 - 4) = v17 + 16 * v18;
      }
    }
    else
    {
      std::vector<std::pair<unsigned long,char const*>>::__append((std::vector<std::pair<unsigned long, const char *>> *)(v13 - 40), v18 - v19);
    }
    *((void *)v13 - 2) = v6;
    *((_DWORD *)v13 - 2) = a5;
    *(v13 - 4) = a6;
    unsigned int v20 = 1;
    while (2)
    {
      if ((v20 & 0xFFF) == 0 && (int)(v20 >> 12) >= (int)a3 - (int)a2) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      }
      uint64_t v22 = *((void *)v13 - 2);
      if (v22) {
        (*(void (**)(uint64_t, char *))(*(void *)v22 + 16))(v22, v13 - 96);
      }
      switch(*((_DWORD *)v13 - 24))
      {
        case 0xFFFFFC18:
          v23 = (const char *)*((void *)v13 - 10);
          if ((a5 & 0x20) != 0 && v23 == a2 || (a5 & 0x1000) != 0 && v23 != a3) {
            goto LABEL_26;
          }
          uint64_t v35 = *a4;
          *(void *)uint64_t v35 = a2;
          *(void *)(v35 + 8) = v23;
          *(unsigned char *)(v35 + 16) = 1;
          uint64_t v36 = *((void *)v13 - 8);
          uint64_t v37 = *((void *)v13 - 7) - v36;
          if (v37)
          {
            unint64_t v38 = 0xAAAAAAAAAAAAAAABLL * (v37 >> 3);
            v39 = (unsigned char *)(v36 + 16);
            unsigned int v40 = 1;
            do
            {
              uint64_t v41 = v35 + 24 * v40;
              *(_OWORD *)uint64_t v41 = *((_OWORD *)v39 - 1);
              char v42 = *v39;
              v39 += 24;
              *(unsigned char *)(v41 + 16) = v42;
            }
            while (v38 > v40++);
          }
          uint64_t v6 = 1;
          v21 = v46;
          if (!v46) {
            return v6;
          }
          goto LABEL_37;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_16;
        case 0xFFFFFC1F:
LABEL_26:
          v24 = v47;
          v25 = (void *)*((void *)v47 - 5);
          if (v25)
          {
            *((void *)v47 - 4) = v25;
            operator delete(v25);
          }
          v26 = (void *)*((void *)v24 - 8);
          if (v26)
          {
            *((void *)v24 - 7) = v26;
            operator delete(v26);
          }
          v47 = v24 - 96;
          goto LABEL_16;
        case 0xFFFFFC20:
          *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)&v44[64] = v27;
          *(_OWORD *)&v44[80] = v27;
          *(_OWORD *)&v44[32] = v27;
          *(_OWORD *)&v44[48] = v27;
          *(_OWORD *)v44 = v27;
          *(_OWORD *)&v44[16] = v27;
          std::__state<char>::__state((uint64_t)v44, (long long *)v13 - 6);
          (*(void (**)(void, uint64_t, char *))(**((void **)v13 - 2) + 24))(*((void *)v13 - 2), 1, v13 - 96);
          (*(void (**)(void, void, unsigned char *))(**(void **)&v44[80] + 24))(*(void *)&v44[80], 0, v44);
          v28 = v47;
          if ((unint64_t)v47 >= v48)
          {
            v47 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v46, (uint64_t)v44);
            if (*(void *)&v44[56])
            {
              *(void *)&v44[64] = *(void *)&v44[56];
              operator delete(*(void **)&v44[56]);
            }
          }
          else
          {
            long long v29 = *(_OWORD *)&v44[16];
            *(_OWORD *)v47 = *(_OWORD *)v44;
            *((_OWORD *)v28 + 1) = v29;
            *((void *)v28 + 4) = 0;
            *((void *)v28 + 5) = 0;
            *((void *)v28 + 6) = 0;
            *((void *)v28 + 7) = 0;
            *((_OWORD *)v28 + 2) = *(_OWORD *)&v44[32];
            *((void *)v28 + 6) = *(void *)&v44[48];
            memset(&v44[32], 0, 24);
            *((void *)v28 + 8) = 0;
            *((void *)v28 + 9) = 0;
            *(_OWORD *)(v28 + 56) = *(_OWORD *)&v44[56];
            *((void *)v28 + 9) = *(void *)&v44[72];
            memset(&v44[56], 0, 24);
            uint64_t v30 = *(void *)&v44[80];
            *(void *)(v28 + 85) = *(void *)&v44[85];
            *((void *)v28 + 10) = v30;
            v47 = v28 + 96;
          }
          if (*(void *)&v44[32])
          {
            *(void *)&v44[40] = *(void *)&v44[32];
            operator delete(*(void **)&v44[32]);
          }
LABEL_16:
          v21 = v46;
          v13 = v47;
          ++v20;
          if (v46 != v47) {
            continue;
          }
          uint64_t v6 = 0;
          if (v46)
          {
LABEL_37:
            for (i = v47; i != v21; i -= 96)
            {
              v32 = (void *)*((void *)i - 5);
              if (v32)
              {
                *((void *)i - 4) = v32;
                operator delete(v32);
              }
              v33 = (void *)*((void *)i - 8);
              if (v33)
              {
                *((void *)i - 7) = v33;
                operator delete(v33);
              }
            }
            operator delete(v21);
          }
          break;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  return v6;
}

void sub_21D82CA50(_Unwind_Exception *a1)
{
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_21D82CA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::__state<char>::~__state((uint64_t *)va);
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_21D82CAAC(_Unwind_Exception *a1)
{
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_21D82CAC0(_Unwind_Exception *a1)
{
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__exec(const std::__bracket_expression<char, std::regex_traits<char>> *this, std::__bracket_expression<char, std::regex_traits<char>>::__state *a2)
{
  v2 = a2;
  current = a2->__current_;
  last = a2->__last_;
  if (current == last)
  {
    uint64_t v11 = 0;
    BOOL negate = this->__negate_;
    goto LABEL_264;
  }
  if (!this->__might_have_digraph_ || current + 1 == last) {
    goto LABEL_42;
  }
  char v6 = *current;
  LOBYTE(__src) = *current;
  char v7 = current[1];
  HIBYTE(__src) = v7;
  if (this->__icase_)
  {
    LOBYTE(__src) = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v6);
    HIBYTE(__src) = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v7);
  }
  __s.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[2] = 0x2AAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAA00AAAALL;
  LOWORD(__s.__r_.__value_.__l.__data_) = __src;
  std::__get_collation_name(&v141, (const char *)&__s);
  std::string __p = v141;
  std::string::size_type size = HIBYTE(v141.__r_.__value_.__r.__words[2]);
  int v9 = SHIBYTE(v141.__r_.__value_.__r.__words[2]);
  if ((v141.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v141.__r_.__value_.__l.__size_;
  }
  if (size) {
    goto LABEL_9;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    v10 = (void *)__s.__r_.__value_.__r.__words[0];
    if (__s.__r_.__value_.__l.__size_ >= 3)
    {
LABEL_11:
      operator delete(v10);
      goto LABEL_15;
    }
    goto LABEL_168;
  }
  if (HIBYTE(__s.__r_.__value_.__r.__words[2]) < 3u)
  {
LABEL_168:
    (*(void (**)(std::string *__return_ptr))(*(void *)this->__traits_.__col_ + 32))(&v141);
    if (v9 < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::string __p = v141;
    if (SHIBYTE(v141.__r_.__value_.__r.__words[2]) < 0)
    {
      if (__p.__r_.__value_.__l.__size_ == 1 || __p.__r_.__value_.__l.__size_ == 12)
      {
        if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_s = &__s;
        }
        else {
          p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
        }
        if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          size_t v92 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
        }
        else {
          size_t v92 = __s.__r_.__value_.__l.__size_;
        }
        std::string::__assign_no_alias<false>((void **)&__p.__r_.__value_.__l.__data_, p_s, v92);
      }
      else
      {
        *__p.__r_.__value_.__l.__data_ = 0;
        __p.__r_.__value_.__l.__size_ = 0;
      }
    }
    else if (HIBYTE(v141.__r_.__value_.__r.__words[2]) == 1 || HIBYTE(v141.__r_.__value_.__r.__words[2]) == 12)
    {
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__assign_no_alias<true>(&__p, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
      }
      else {
        std::string __p = __s;
      }
    }
    else
    {
      __p.__r_.__value_.__s.__data_[0] = 0;
      *((unsigned char *)&__p.__r_.__value_.__s + 23) = 0;
    }
LABEL_9:
    if ((SHIBYTE(__s.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_15;
    }
    v10 = (void *)__s.__r_.__value_.__r.__words[0];
    goto LABEL_11;
  }
LABEL_15:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type v29 = __p.__r_.__value_.__l.__size_;
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v29) {
      goto LABEL_17;
    }
LABEL_42:
    BOOL negate = 0;
    uint64_t v11 = 1;
    unsigned __int8 v30 = *v2->__current_;
    __p.__r_.__value_.__s.__data_[0] = v30;
    if (!this->__icase_) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  if (!*((unsigned char *)&__p.__r_.__value_.__s + 23)) {
    goto LABEL_42;
  }
LABEL_17:
  std::vector<std::pair<char, char>>::pointer begin = this->__digraphs_.__begin_;
  uint64_t v14 = (char *)this->__digraphs_.__end_ - (char *)begin;
  if (v14)
  {
    uint64_t v15 = v14 >> 1;
    if ((unint64_t)(v14 >> 1) <= 1) {
      uint64_t v15 = 1;
    }
    p_second = &begin->second;
    while (__src != *(p_second - 1) || HIBYTE(__src) != *p_second)
    {
      p_second += 2;
      if (!--v15) {
        goto LABEL_26;
      }
    }
    goto LABEL_261;
  }
LABEL_26:
  if (!this->__collate_ || this->__ranges_.__begin_ == this->__ranges_.__end_)
  {
    BOOL negate = 0;
    goto LABEL_199;
  }
  memset(&v141, 170, sizeof(v141));
  __s.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[2] = 0x2AAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAA00AAAALL;
  LOWORD(__s.__r_.__value_.__l.__data_) = __src;
  (*(void (**)(std::string *__return_ptr))(*(void *)this->__traits_.__col_ + 32))(&v141);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
  std::vector<std::pair<std::string, std::string>>::pointer v18 = this->__ranges_.__begin_;
  char v19 = HIBYTE(v141.__r_.__value_.__r.__words[2]);
  int64_t v20 = (char *)this->__ranges_.__end_ - (char *)v18;
  if (!v20)
  {
    BOOL v28 = 0;
    int v71 = 0;
    BOOL negate = 0;
    goto LABEL_196;
  }
  v131 = v2;
  uint64_t v21 = 0;
  unint64_t v22 = v20 / 48;
  if ((v141.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v23 = &v141;
  }
  else {
    v23 = (std::string *)v141.__r_.__value_.__r.__words[0];
  }
  char v24 = HIBYTE(v141.__r_.__value_.__r.__words[2]);
  if ((v141.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v25 = HIBYTE(v141.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v25 = v141.__r_.__value_.__l.__size_;
  }
  if (v22 <= 1) {
    uint64_t v26 = 1;
  }
  else {
    uint64_t v26 = v20 / 48;
  }
  long long v27 = (unsigned __int8 *)&v18->second.__r_.__value_.__r.__words[2] + 7;
  BOOL v28 = 1;
  do
  {
    int v61 = (char)*(v27 - 24);
    if (v61 >= 0) {
      v62 = (char *)(v27 - 47);
    }
    else {
      v62 = *(char **)(v27 - 47);
    }
    if (v61 >= 0) {
      size_t v63 = *(v27 - 24);
    }
    else {
      size_t v63 = *(void *)(v27 - 39);
    }
    if (v25 >= v63) {
      size_t v64 = v63;
    }
    else {
      size_t v64 = v25;
    }
    int v65 = memcmp(v62, v23, v64);
    if (v65)
    {
      if ((v65 & 0x80000000) == 0) {
        goto LABEL_106;
      }
    }
    else if (v63 > v25)
    {
      goto LABEL_106;
    }
    int v66 = (char)*v27;
    if (v66 >= 0) {
      v67 = (char *)(v27 - 23);
    }
    else {
      v67 = *(char **)(v27 - 23);
    }
    if (v66 >= 0) {
      size_t v68 = *v27;
    }
    else {
      size_t v68 = *(void *)(v27 - 15);
    }
    if (v68 >= v25) {
      size_t v69 = v25;
    }
    else {
      size_t v69 = v68;
    }
    int v70 = memcmp(v23, v67, v69);
    if (v70)
    {
      if (v70 < 0)
      {
LABEL_131:
        BOOL negate = 1;
        int v71 = 5;
        goto LABEL_185;
      }
    }
    else if (v25 <= v68)
    {
      goto LABEL_131;
    }
LABEL_106:
    BOOL v28 = ++v21 < v22;
    v27 += 48;
  }
  while (v26 != v21);
  int v71 = 0;
  BOOL negate = 0;
LABEL_185:
  v2 = v131;
  char v19 = v24;
LABEL_196:
  if (v19 < 0) {
    operator delete(v141.__r_.__value_.__l.__data_);
  }
  if (v28) {
    goto LABEL_240;
  }
LABEL_199:
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_) {
    goto LABEL_243;
  }
  v93 = v2;
  memset(&__s, 170, sizeof(__s));
  std::regex_traits<char>::__transform_primary<char *>(&__s, (uint64_t)&this->__traits_, &__src, &v141);
  std::vector<std::string>::pointer v94 = this->__equivalences_.__begin_;
  int v95 = SHIBYTE(__s.__r_.__value_.__r.__words[2]);
  int64_t v96 = (char *)this->__equivalences_.__end_ - (char *)v94;
  if (!v96)
  {
    BOOL v102 = 0;
    int v71 = 0;
    v2 = v93;
    goto LABEL_237;
  }
  BOOL v138 = negate;
  unint64_t v97 = v96 / 24;
  size_t v98 = __s.__r_.__value_.__l.__size_;
  std::string::size_type v99 = (__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
      ? HIBYTE(__s.__r_.__value_.__r.__words[2])
      : __s.__r_.__value_.__l.__size_;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    int v136 = SHIBYTE(__s.__r_.__value_.__r.__words[2]);
    uint64_t v108 = 0;
    v109 = (const void *)__s.__r_.__value_.__r.__words[0];
    uint64_t v110 = v97 <= 1 ? 1 : v96 / 24;
    BOOL v102 = 1;
    do
    {
      std::string::size_type v111 = HIBYTE(v94->__r_.__value_.__r.__words[2]);
      int v112 = (char)v111;
      if ((v111 & 0x80u) != 0) {
        std::string::size_type v111 = v94->__r_.__value_.__l.__size_;
      }
      if (v99 == v111)
      {
        std::vector<std::string>::pointer v113 = v112 >= 0 ? v94 : (std::vector<std::string>::pointer)v94->__r_.__value_.__r.__words[0];
        if (!memcmp(v109, v113, v98))
        {
          BOOL negate = 1;
          int v71 = 5;
          v2 = v93;
          goto LABEL_236;
        }
      }
      BOOL v102 = ++v108 < v97;
      ++v94;
    }
    while (v110 != v108);
    int v71 = 0;
    v2 = v93;
    BOOL negate = v138;
LABEL_236:
    int v95 = v136;
  }
  else
  {
    if (*((unsigned char *)&__s.__r_.__value_.__s + 23))
    {
      uint64_t v100 = 0;
      if (v97 <= 1) {
        uint64_t v101 = 1;
      }
      else {
        uint64_t v101 = v96 / 24;
      }
      BOOL v102 = 1;
      do
      {
        v103 = &v94[v100];
        std::string::size_type v104 = HIBYTE(v103->__r_.__value_.__r.__words[2]);
        int v105 = (char)v104;
        if ((v104 & 0x80u) != 0) {
          std::string::size_type v104 = v103->__r_.__value_.__l.__size_;
        }
        if (v99 == v104)
        {
          if (v105 < 0) {
            v103 = (std::string *)v103->__r_.__value_.__r.__words[0];
          }
          v106 = &__s;
          uint64_t v107 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
          while (v106->__r_.__value_.__s.__data_[0] == v103->__r_.__value_.__s.__data_[0])
          {
            v106 = (std::string *)((char *)v106 + 1);
            v103 = (std::string *)((char *)v103 + 1);
            if (!--v107)
            {
              BOOL negate = 1;
              int v71 = 5;
              v2 = v93;
              goto LABEL_237;
            }
          }
        }
        BOOL v102 = ++v100 < v97;
      }
      while (v100 != v101);
      BOOL v102 = 0;
      int v71 = 0;
      v2 = v93;
      BOOL negate = v138;
      goto LABEL_237;
    }
    std::string::size_type v121 = HIBYTE(v94->__r_.__value_.__r.__words[2]);
    if ((v121 & 0x80u) != 0) {
      std::string::size_type v121 = v94->__r_.__value_.__l.__size_;
    }
    if (v121 == HIBYTE(__s.__r_.__value_.__r.__words[2]))
    {
      BOOL negate = 1;
      v2 = v93;
      goto LABEL_263;
    }
    unint64_t v122 = 0;
    uint64_t v123 = v97 <= 1 ? 1 : v97;
    uint64_t v124 = v123 - 1;
    v125 = &v94[1].__r_.__value_.__s.__data_[8];
    v2 = v93;
    while (v124 != v122)
    {
      ++v122;
      uint64_t v126 = v125[15];
      uint64_t v128 = *(void *)v125;
      v125 += 24;
      uint64_t v127 = v128;
      if ((v126 & 0x80u) != 0) {
        uint64_t v126 = v127;
      }
      if (v99 == v126)
      {
        BOOL v102 = v122 < v97;
        BOOL negate = 1;
        int v71 = 5;
        goto LABEL_237;
      }
    }
    BOOL v102 = 0;
    int v71 = 0;
    BOOL negate = v138;
  }
LABEL_237:
  if (v95 < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
  if (!v102)
  {
LABEL_243:
    if ((char)__src < 0)
    {
      neg_std::regex_traits<char>::char_class_type mask = this->__neg_mask_;
    }
    else
    {
      std::regex_traits<char>::char_class_type mask = this->__mask_;
      tab = this->__traits_.__ct_->__tab_;
      std::ctype_base::mask v116 = tab[__src];
      if (((v116 & mask) != 0 || __src == 95 && (mask & 0x80) != 0)
        && (SHIBYTE(__src) & 0x80000000) == 0
        && ((tab[HIBYTE(__src)] & mask) != 0 || (mask & 0x80) != 0 && HIBYTE(__src) == 95))
      {
        goto LABEL_261;
      }
      neg_std::regex_traits<char>::char_class_type mask = this->__neg_mask_;
      if ((neg_mask & v116) != 0 || __src == 95 && (neg_mask & 0x80) != 0)
      {
LABEL_260:
        int v118 = negate;
LABEL_262:
        BOOL negate = v118;
        goto LABEL_263;
      }
    }
    if ((SHIBYTE(__src) & 0x80000000) == 0)
    {
      if ((this->__traits_.__ct_->__tab_[HIBYTE(__src)] & neg_mask) == 0)
      {
        int v118 = 1;
        if (HIBYTE(__src) != 95 || (neg_mask & 0x80) == 0) {
          goto LABEL_262;
        }
      }
      goto LABEL_260;
    }
LABEL_261:
    int v118 = 1;
    goto LABEL_262;
  }
LABEL_240:
  if (v71)
  {
LABEL_263:
    uint64_t v11 = 2;
    goto LABEL_264;
  }
  uint64_t v11 = 2;
  unsigned __int8 v30 = *v2->__current_;
  __p.__r_.__value_.__s.__data_[0] = v30;
  if (this->__icase_)
  {
LABEL_43:
    unsigned __int8 v30 = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, (char)v30);
    __p.__r_.__value_.__s.__data_[0] = v30;
  }
LABEL_44:
  std::vector<char>::pointer v31 = this->__chars_.__begin_;
  unint64_t v32 = this->__chars_.__end_ - v31;
  if (v32)
  {
    if (v32 <= 1) {
      unint64_t v32 = 1;
    }
    while (1)
    {
      int v33 = *v31++;
      if (v33 == v30) {
        break;
      }
      if (!--v32) {
        goto LABEL_49;
      }
    }
LABEL_183:
    BOOL negate = 1;
    goto LABEL_264;
  }
LABEL_49:
  std::regex_traits<char>::char_class_type v34 = this->__neg_mask_;
  if (v34 || this->__neg_chars_.__begin_ != this->__neg_chars_.__end_)
  {
    if ((v30 & 0x80) != 0 || (this->__traits_.__ct_->__tab_[v30] & v34) == 0)
    {
      int v36 = (v34 >> 7) & 1;
      char v35 = v30 == 95 ? v36 : 0;
    }
    else
    {
      char v35 = 1;
    }
    std::vector<char>::pointer end = this->__neg_chars_.__end_;
    std::vector<char>::pointer v38 = (std::vector<char>::pointer)memchr(this->__neg_chars_.__begin_, (char)v30, end - this->__neg_chars_.__begin_);
    v39 = v38 ? v38 : end;
    if ((v35 & 1) == 0 && v39 == end) {
      goto LABEL_183;
    }
  }
  std::vector<std::pair<std::string, std::string>>::pointer v40 = this->__ranges_.__begin_;
  std::vector<std::pair<std::string, std::string>>::pointer v41 = this->__ranges_.__end_;
  if (v40 == v41) {
    goto LABEL_136;
  }
  memset(&v141, 170, sizeof(v141));
  BOOL v137 = negate;
  if (!this->__collate_)
  {
    unsigned int v42 = 1;
    *((unsigned char *)&v141.__r_.__value_.__s + 23) = 1;
    LOWORD(v141.__r_.__value_.__l.__data_) = v30;
    int64_t v43 = (char *)v41 - (char *)v40;
    if (v43) {
      goto LABEL_67;
    }
LABEL_163:
    BOOL v50 = 0;
    if ((v42 & 0x80) != 0) {
      goto LABEL_134;
    }
    goto LABEL_135;
  }
  __s.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[2] = 0x1AAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAA00AALL;
  __s.__r_.__value_.__s.__data_[0] = v30;
  (*(void (**)(std::string *__return_ptr))(*(void *)this->__traits_.__col_ + 32))(&v141);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
  std::vector<std::pair<std::string, std::string>>::pointer v40 = this->__ranges_.__begin_;
  unsigned int v42 = HIBYTE(v141.__r_.__value_.__r.__words[2]);
  int64_t v43 = (char *)this->__ranges_.__end_ - (char *)v40;
  if (!v43) {
    goto LABEL_163;
  }
LABEL_67:
  v132 = v2;
  uint64_t v134 = v11;
  uint64_t v44 = 0;
  unint64_t v45 = v43 / 48;
  char v129 = v42;
  if ((v42 & 0x80u) == 0) {
    v46 = &v141;
  }
  else {
    v46 = (std::string *)v141.__r_.__value_.__r.__words[0];
  }
  if ((v42 & 0x80u) == 0) {
    std::string::size_type v47 = v42;
  }
  else {
    std::string::size_type v47 = v141.__r_.__value_.__l.__size_;
  }
  if (v45 <= 1) {
    uint64_t v48 = 1;
  }
  else {
    uint64_t v48 = v43 / 48;
  }
  v49 = (unsigned __int8 *)&v40->second.__r_.__value_.__r.__words[2] + 7;
  BOOL v50 = 1;
  while (2)
  {
    int v51 = (char)*(v49 - 24);
    if (v51 >= 0) {
      v52 = (char *)(v49 - 47);
    }
    else {
      v52 = *(char **)(v49 - 47);
    }
    if (v51 >= 0) {
      size_t v53 = *(v49 - 24);
    }
    else {
      size_t v53 = *(void *)(v49 - 39);
    }
    if (v47 >= v53) {
      size_t v54 = v53;
    }
    else {
      size_t v54 = v47;
    }
    int v55 = memcmp(v52, v46, v54);
    if (v55)
    {
      if (v55 < 0) {
        goto LABEL_92;
      }
    }
    else if (v53 <= v47)
    {
LABEL_92:
      int v56 = (char)*v49;
      if (v56 >= 0) {
        v57 = (char *)(v49 - 23);
      }
      else {
        v57 = *(char **)(v49 - 23);
      }
      if (v56 >= 0) {
        size_t v58 = *v49;
      }
      else {
        size_t v58 = *(void *)(v49 - 15);
      }
      if (v58 >= v47) {
        size_t v59 = v47;
      }
      else {
        size_t v59 = v58;
      }
      int v60 = memcmp(v46, v57, v59);
      if (v60)
      {
        if (v60 < 0)
        {
LABEL_103:
          BOOL negate = 1;
          v2 = v132;
          uint64_t v11 = v134;
          if ((v129 & 0x80) == 0) {
            goto LABEL_135;
          }
          goto LABEL_134;
        }
      }
      else if (v47 <= v58)
      {
        goto LABEL_103;
      }
    }
    BOOL v50 = ++v44 < v45;
    v49 += 48;
    if (v48 != v44) {
      continue;
    }
    break;
  }
  v2 = v132;
  uint64_t v11 = v134;
  BOOL negate = v137;
  if ((v129 & 0x80) == 0) {
    goto LABEL_135;
  }
LABEL_134:
  operator delete(v141.__r_.__value_.__l.__data_);
LABEL_135:
  if (v50) {
    goto LABEL_264;
  }
LABEL_136:
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
  {
LABEL_178:
    if ((v30 & 0x80) != 0) {
      goto LABEL_264;
    }
    std::regex_traits<char>::char_class_type v89 = this->__mask_;
    if ((this->__traits_.__ct_->__tab_[v30] & v89) == 0)
    {
      int v90 = (v89 >> 7) & 1;
      if (v30 != 95) {
        int v90 = 0;
      }
      if (v90 != 1) {
        goto LABEL_264;
      }
    }
    goto LABEL_183;
  }
  uint64_t v135 = v11;
  memset(&__s, 170, sizeof(__s));
  std::regex_traits<char>::__transform_primary<char *>(&__s, (uint64_t)&this->__traits_, &__p, &__p.__r_.__value_.__s.__data_[1]);
  std::vector<std::string>::pointer v72 = this->__equivalences_.__begin_;
  uint64_t v73 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  int64_t v74 = (char *)this->__equivalences_.__end_ - (char *)v72;
  if (!v74)
  {
    if ((*((unsigned char *)&__s.__r_.__value_.__s + 23) & 0x80) != 0) {
      operator delete(__s.__r_.__value_.__l.__data_);
    }
LABEL_177:
    unsigned __int8 v30 = __p.__r_.__value_.__s.__data_[0];
    goto LABEL_178;
  }
  v133 = v2;
  unint64_t v75 = 0;
  unint64_t v76 = v74 / 24;
  size_t v78 = __s.__r_.__value_.__l.__size_;
  v77 = (const void *)__s.__r_.__value_.__r.__words[0];
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v79 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v79 = __s.__r_.__value_.__l.__size_;
  }
  if (v76 <= 1) {
    uint64_t v80 = 1;
  }
  else {
    uint64_t v80 = v74 / 24;
  }
  BOOL v81 = 1;
  while (2)
  {
    v82 = &v72[v75];
    std::string::size_type v83 = HIBYTE(v82->__r_.__value_.__r.__words[2]);
    int v84 = (char)v83;
    if ((v83 & 0x80u) != 0) {
      std::string::size_type v83 = v82->__r_.__value_.__l.__size_;
    }
    if (v79 != v83)
    {
LABEL_157:
      if (++v75 == v80)
      {
        if ((v73 & 0x80) != 0) {
LABEL_275:
        }
          operator delete(__s.__r_.__value_.__l.__data_);
        v2 = v133;
        uint64_t v11 = v135;
        goto LABEL_177;
      }
      goto LABEL_161;
    }
    if (v84 >= 0) {
      v85 = &v72[v75];
    }
    else {
      v85 = (std::string *)v82->__r_.__value_.__r.__words[0];
    }
    if ((v73 & 0x80) == 0)
    {
      if (!v73)
      {
LABEL_165:
        BOOL negate = 1;
        v2 = v133;
        uint64_t v11 = v135;
        if (!v81) {
          goto LABEL_177;
        }
        goto LABEL_264;
      }
      uint64_t v86 = 0;
      while (__s.__r_.__value_.__s.__data_[v86] == v85->__r_.__value_.__s.__data_[v86])
      {
        if (v73 == ++v86) {
          goto LABEL_165;
        }
      }
      goto LABEL_157;
    }
    BOOL v130 = v81;
    v87 = v77;
    size_t v88 = v78;
    if (memcmp(v77, v85, v78))
    {
      ++v75;
      size_t v78 = v88;
      v77 = v87;
      if (v75 == v80) {
        goto LABEL_275;
      }
LABEL_161:
      BOOL v81 = v75 < v76;
      continue;
    }
    break;
  }
  operator delete(__s.__r_.__value_.__l.__data_);
  BOOL negate = 1;
  v2 = v133;
  uint64_t v11 = v135;
  if (!v130) {
    goto LABEL_177;
  }
LABEL_264:
  if (negate == this->__negate_)
  {
    first = 0;
    int v120 = -993;
  }
  else
  {
    v2->__current_ += v11;
    first = this->__first_;
    int v120 = -995;
  }
  v2->__do_ = v120;
  v2->__node_ = first;
}

void sub_21D82D760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a18 < 0)
  {
    operator delete(__p);
    if (a28 < 0)
    {
LABEL_5:
      operator delete(a23);
      _Unwind_Resume(a1);
    }
  }
  else if (a28 < 0)
  {
    goto LABEL_5;
  }
  _Unwind_Resume(a1);
}

uint64_t std::__loop<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(result + 40);
  uint64_t v3 = *(void *)(a2 + 56);
  v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 != -991)
  {
    unint64_t *v4 = 0;
    if (!*(void *)(result + 32))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_28;
    }
    if (*(void *)(result + 24))
    {
      *(_DWORD *)a2 = -994;
      *(void *)(a2 + 80) = *(void *)(result + 8);
      *(void *)(v3 + 16 * v2 + 8) = *(void *)(a2 + 16);
      int v20 = *(_DWORD *)(result + 44);
      int v21 = *(_DWORD *)(result + 48);
      if (v20 == v21) {
        return result;
      }
      uint64_t v22 = (v21 - 1);
      uint64_t v23 = (v20 - 1);
      uint64_t v24 = *(void *)(a2 + 24);
      uint64_t v25 = *(void *)(a2 + 32);
      uint64_t v26 = v22 - v23;
      if ((unint64_t)(v22 - v23) >= 2)
      {
        uint64_t v27 = (v26 & 0xFFFFFFFFFFFFFFFELL) + v23;
        uint64_t v28 = v25 + 24 * v23 + 24;
        unint64_t v29 = v26 & 0xFFFFFFFFFFFFFFFELL;
        do
        {
          *(void *)(v28 - 24) = v24;
          *(void *)(v28 - 16) = v24;
          *(void *)uint64_t v28 = v24;
          *(void *)(v28 + 8) = v24;
          *(unsigned char *)(v28 - 8) = 0;
          *(unsigned char *)(v28 + 16) = 0;
          v28 += 48;
          v29 -= 2;
        }
        while (v29);
        if (v26 == (v26 & 0xFFFFFFFFFFFFFFFELL)) {
          return result;
        }
      }
      else
      {
        uint64_t v27 = v23;
      }
      uint64_t v30 = v22 - v27;
      std::vector<char>::pointer v31 = (unsigned char *)(v25 + 24 * v27 + 16);
      do
      {
        *((void *)v31 - 2) = v24;
        *((void *)v31 - 1) = v24;
        *std::vector<char>::pointer v31 = 0;
        v31 += 24;
        --v30;
      }
      while (v30);
      return result;
    }
LABEL_26:
    *(_DWORD *)a2 = -992;
    return result;
  }
  unint64_t v5 = *v4 + 1;
  unint64_t *v4 = v5;
  unint64_t v6 = *(void *)(result + 24);
  unint64_t v7 = *(void *)(result + 32);
  BOOL v8 = v5 < v7;
  if (v5 < v7 && v5 >= v6) {
    BOOL v8 = v5 < v7 && *(void *)(v3 + 16 * v2 + 8) != *(void *)(a2 + 16);
  }
  if (v8 && v5 >= v6) {
    goto LABEL_26;
  }
  *(_DWORD *)a2 = -994;
  if (!v8)
  {
LABEL_28:
    *(void *)(a2 + 80) = *(void *)(result + 16);
    return result;
  }
  *(void *)(a2 + 80) = *(void *)(result + 8);
  *(void *)(v3 + 16 * v2 + 8) = *(void *)(a2 + 16);
  int v12 = *(_DWORD *)(result + 44);
  int v13 = *(_DWORD *)(result + 48);
  if (v12 == v13) {
    return result;
  }
  uint64_t v14 = (v13 - 1);
  uint64_t v15 = (v12 - 1);
  uint64_t v16 = *(void *)(a2 + 24);
  uint64_t v17 = *(void *)(a2 + 32);
  uint64_t v18 = v14 - v15;
  if ((unint64_t)(v14 - v15) < 2)
  {
    uint64_t v19 = v15;
LABEL_39:
    uint64_t v34 = v14 - v19;
    char v35 = (unsigned char *)(v17 + 24 * v19 + 16);
    do
    {
      *((void *)v35 - 2) = v16;
      *((void *)v35 - 1) = v16;
      *char v35 = 0;
      v35 += 24;
      --v34;
    }
    while (v34);
    return result;
  }
  uint64_t v19 = (v18 & 0xFFFFFFFFFFFFFFFELL) + v15;
  uint64_t v32 = v17 + 24 * v15 + 24;
  unint64_t v33 = v18 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    *(void *)(v32 - 24) = v16;
    *(void *)(v32 - 16) = v16;
    *(void *)uint64_t v32 = v16;
    *(void *)(v32 + 8) = v16;
    *(unsigned char *)(v32 - 8) = 0;
    *(unsigned char *)(v32 + 16) = 0;
    v32 += 48;
    v33 -= 2;
  }
  while (v33);
  if (v18 != (v18 & 0xFFFFFFFFFFFFFFFELL)) {
    goto LABEL_39;
  }
  return result;
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

void std::vector<std::sub_match<char const*>>::assign(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __u)
{
  value = this->__end_cap_.__value_;
  std::vector<std::pair<char, char>>::pointer begin = this->__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3) < __n)
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
      goto LABEL_26;
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)value >> 3);
    std::vector<std::csub_match>::size_type v9 = 2 * v8;
    if (2 * v8 <= __n) {
      std::vector<std::csub_match>::size_type v9 = __n;
    }
    unint64_t v10 = v8 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v9;
    if (v10 > 0xAAAAAAAAAAAAAAALL) {
LABEL_26:
    }
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    uint64_t v11 = v10;
    int v12 = (std::sub_match<const char *> *)operator new(24 * v10);
    this->__begin_ = v12;
    this->__end_ = v12;
    this->__end_cap_.__value_ = &v12[v11];
    std::vector<std::csub_match>::size_type v13 = 24 * __n;
    uint64_t v14 = &v12[__n];
    do
    {
      v12->std::pair<const char *, const char *> = __u->std::pair<const char *, const char *>;
      *(void *)&v12->matched = *(void *)&__u->matched;
      ++v12;
      v13 -= 24;
    }
    while (v13);
    goto LABEL_25;
  }
  std::vector<std::csub_match>::pointer end = this->__end_;
  unint64_t v16 = end - begin;
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
    uint64_t v14 = &begin[__n];
LABEL_25:
    this->__end_ = v14;
    return;
  }
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

void std::__alternate<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t std::__repeat_one_loop<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void std::vector<std::pair<unsigned long,char const*>>::__append(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __n)
{
  std::vector<std::csub_match>::pointer end = this->__end_;
  value = this->__end_cap_.__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      std::vector<std::pair<unsigned long, const char *>>::size_type v12 = 16 * __n;
      bzero(this->__end_, 16 * __n);
      std::vector<std::csub_match>::pointer end = (std::pair<unsigned long, const char *> *)((char *)end + v12);
    }
    this->__end_ = end;
  }
  else
  {
    std::vector<std::pair<unsigned long, const char *>>::pointer begin = this->__begin_;
    uint64_t v7 = end - this->__begin_;
    unint64_t v8 = v7 + __n;
    if ((v7 + __n) >> 60) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v9 = (char *)value - (char *)begin;
    if (v9 >> 3 > v8) {
      unint64_t v8 = v9 >> 3;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      if (v10 >> 60) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v11 = (char *)operator new(16 * v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    std::vector<std::csub_match>::size_type v13 = (std::pair<unsigned long, const char *> *)&v11[16 * v7];
    size_t v14 = __n;
    uint64_t v15 = (std::pair<unsigned long, const char *> *)&v11[16 * v10];
    bzero(v13, v14 * 16);
    unint64_t v16 = &v13[v14];
    if (end != begin)
    {
      do
      {
        v13[-1] = end[-1];
        --v13;
        --end;
      }
      while (end != begin);
      std::vector<std::csub_match>::pointer end = this->__begin_;
    }
    this->__begin_ = v13;
    this->__end_ = v16;
    this->__end_cap_.__value_ = v15;
    if (end)
    {
      operator delete(end);
    }
  }
}

void std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  uint64_t v1 = std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(a1);
  operator delete(v1);
}

void std::__empty_state<char>::~__empty_state(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  operator delete(__p);
}

void std::__alternate<char>::~__alternate(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  *std::string __p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26CE32AD0;
  uint64_t v2 = __p[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  uint64_t v3 = __p[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }
  operator delete(__p);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  std::vector<std::csub_match>::pointer end = a1->__end_;
  uint64_t v7 = a2;
  do
  {
    unint64_t v8 = v7;
    uint64_t v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>((uint64_t)a1, v7, a3);
    if (v7 != v8) {
      continue;
    }
    uint64_t v9 = a1->__end_;
    unsigned int marked_count = a1->__marked_count_;
    uint64_t v11 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(a1);
    if (v11 == (std::basic_regex<char> *)v8) {
      break;
    }
    uint64_t v7 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)a1, v11, (std::basic_regex<char> *)a3, v9, marked_count + 1, a1->__marked_count_ + 1);
  }
  while (v7 != v8);
  if (v8 == a2)
  {
    std::vector<std::pair<unsigned long, const char *>>::size_type v12 = (std::__node<char> *)operator new(0x10uLL);
    std::vector<std::csub_match>::size_type v13 = a1->__end_;
    first = v13->__first_;
    v12[1].__vftable = (std::__node<char>_vtbl *)first;
    v13->__first_ = v12;
    uint64_t v15 = (std::__owns_one_state<char> *)a1->__end_->__first_;
    goto LABEL_8;
  }
LABEL_9:
  if (v8 != a3)
  {
    if (*v8 == 124)
    {
      unint64_t v16 = a1->__end_;
      std::vector<std::csub_match>::size_type v17 = v8 + 1;
      uint64_t v18 = v8 + 1;
      while (1)
      {
        unint64_t v8 = v18;
        uint64_t v18 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>((uint64_t)a1, v18, a3);
        if (v18 == v8)
        {
          uint64_t v19 = a1->__end_;
          unsigned int v20 = a1->__marked_count_;
          std::pair<const char *, const char *> v21 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(a1);
          if (v21 == (std::basic_regex<char> *)v8)
          {
LABEL_16:
            if (v8 == v17)
            {
              uint64_t v22 = (std::__node<char> *)operator new(0x10uLL);
              uint64_t v23 = a1->__end_;
              uint64_t v24 = v23->__first_;
              v22[1].__vftable = (std::__node<char>_vtbl *)v24;
              v23->__first_ = v22;
              a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
            }
            uint64_t v25 = (std::__node<char> *)operator new(0x18uLL);
            uint64_t v26 = v16->__first_;
            v25[1].__vftable = (std::__node<char>_vtbl *)end->__first_;
            v25[2].__vftable = (std::__node<char>_vtbl *)v26;
            v25->__vftable = (std::__node<char>_vtbl *)&unk_26CE32B48;
            end->__first_ = v25;
            v16->__first_ = 0;
            uint64_t v27 = (std::__node<char> *)operator new(0x10uLL);
            uint64_t v28 = a1->__end_->__first_;
            v27[1].__vftable = (std::__node<char>_vtbl *)v28;
            v16->__first_ = v27;
            a1->__end_->__first_ = 0;
            unint64_t v29 = (std::__node<char> *)operator new(0x10uLL);
            uint64_t v30 = v16->__first_;
            v29->__vftable = (std::__node<char>_vtbl *)&unk_26CE32B90;
            v29[1].__vftable = (std::__node<char>_vtbl *)v30;
            a1->__end_->__first_ = v29;
            uint64_t v15 = (std::__owns_one_state<char> *)v16->__first_;
LABEL_8:
            a1->__end_ = v15;
            goto LABEL_9;
          }
          uint64_t v18 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)a1, v21, (std::basic_regex<char> *)a3, v19, v20 + 1, a1->__marked_count_ + 1);
        }
        if (v18 == v8) {
          goto LABEL_16;
        }
      }
    }
    return v8;
  }
  return a3;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3) {
      goto LABEL_178;
    }
    int v5 = a2[1];
    char v6 = v5 == 94;
    uint64_t v7 = (uint64_t)(v5 == 94 ? a2 + 2 : a2 + 1);
    unint64_t v8 = operator new(0xB0uLL);
    std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v8, a1, *(void *)(*(void *)(a1 + 56) + 8), v6, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
    *(void *)(*(void *)(a1 + 56) + 8) = v8;
    *(void *)(a1 + 56) = v8;
    if ((std::basic_regex<char>::value_type *)v7 == a3) {
      goto LABEL_178;
    }
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *(unsigned char *)v7 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 93);
      ++v7;
    }
    if ((std::basic_regex<char>::value_type *)v7 == a3) {
      goto LABEL_178;
    }
    size_t v59 = a3 - 4;
    while (1)
    {
      uint64_t v9 = (std::basic_regex<char>::value_type *)v7;
      unint64_t v10 = a3;
      if ((std::basic_regex<char>::value_type *)v7 == a3) {
        goto LABEL_14;
      }
      int v11 = *(unsigned __int8 *)v7;
      unint64_t v10 = (std::basic_regex<char>::value_type *)v7;
      if (v11 == 93) {
        goto LABEL_14;
      }
      __p[0] = 0;
      __p[1] = 0;
      unint64_t v63 = 0;
      unint64_t v10 = (std::basic_regex<char>::value_type *)v7;
      if ((std::basic_regex<char>::value_type *)(v7 + 1) == a3 || v11 != 91) {
        goto LABEL_60;
      }
      int v12 = *(unsigned __int8 *)(v7 + 1);
      if (v12 != 46)
      {
        if (v12 == 58)
        {
          if ((uint64_t)&a3[-v7 - 2] < 2) {
            goto LABEL_177;
          }
          size_t v18 = 0;
          uint64_t v19 = v7;
          if (*(unsigned char *)(v7 + 2) == 58) {
            goto LABEL_36;
          }
          do
          {
            do
            {
              if (&v59[-v7] == (std::basic_regex<char>::value_type *)v18) {
                goto LABEL_177;
              }
              ++v18;
              uint64_t v19 = v7 + v18;
            }
            while (*(unsigned char *)(v7 + v18 + 2) != 58);
LABEL_36:
            ;
          }
          while (*(unsigned char *)(v19 + 3) != 93);
          if ((std::basic_regex<char>::value_type *)(v7 + v18 + 2) == a3) {
            goto LABEL_177;
          }
          int v20 = *(_DWORD *)(a1 + 24);
          memset(__dst, 170, 24);
          if (v18 >= 0x7FFFFFFFFFFFFFF8) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          if (v18 >= 0x17)
          {
            uint64_t v34 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v18 | 7) != 0x17) {
              uint64_t v34 = v18 | 7;
            }
            uint64_t v35 = v34 + 1;
            std::pair<const char *, const char *> v21 = operator new(v34 + 1);
            *((void *)&__dst[0] + 1) = v18;
            *(void *)&__dst[1] = v35 | 0x8000000000000000;
            *(void *)&__dst[0] = v21;
          }
          else
          {
            BYTE7(__dst[1]) = v18;
            std::pair<const char *, const char *> v21 = __dst;
            if (!v18)
            {
LABEL_75:
              unsigned char *v21 = 0;
              uint64_t v36 = BYTE7(__dst[1]);
              if ((SBYTE7(__dst[1]) & 0x80u) == 0) {
                uint64_t v37 = (char *)__dst;
              }
              else {
                uint64_t v37 = *(char **)&__dst[0];
              }
              if (SBYTE7(__dst[1]) < 0) {
                uint64_t v36 = *((void *)&__dst[0] + 1);
              }
              (*(void (**)(void, char *, char *))(**(void **)(a1 + 8) + 48))(*(void *)(a1 + 8), v37, &v37[v36]);
              if ((SBYTE7(__dst[1]) & 0x80u) == 0) {
                std::vector<char>::pointer v38 = (const char *)__dst;
              }
              else {
                std::vector<char>::pointer v38 = *(const char **)&__dst[0];
              }
              std::regex_traits<char>::char_class_type classname = std::__get_classname(v38, v20 & 1);
              if (SBYTE7(__dst[1]) < 0) {
                operator delete(*(void **)&__dst[0]);
              }
              if (!classname) {
                std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
              }
              char v40 = 0;
              *((_DWORD *)v8 + 40) |= classname;
              uint64_t v7 = (uint64_t)&v9[v18 + 4];
              std::vector<std::pair<std::string, std::string>>::pointer v41 = v9;
              if ((SHIBYTE(v63) & 0x80000000) == 0)
              {
LABEL_138:
                unint64_t v10 = v41;
                if ((v40 & 1) == 0) {
                  goto LABEL_15;
                }
                goto LABEL_14;
              }
              goto LABEL_151;
            }
          }
          memcpy(v21, v9 + 2, v18);
          v21 += v18;
          goto LABEL_75;
        }
        if (v12 == 61)
        {
          if ((uint64_t)&a3[-v7 - 2] < 2) {
            goto LABEL_177;
          }
          std::vector<std::csub_match>::size_type v13 = 0;
          uint64_t v14 = v7;
          if (*(unsigned char *)(v7 + 2) == 61) {
            goto LABEL_27;
          }
          do
          {
            do
            {
              if (&v59[-v7] == v13) {
LABEL_177:
              }
                std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
              ++v13;
              uint64_t v14 = (uint64_t)&v13[v7];
            }
            while (v13[v7 + 2] != 61);
LABEL_27:
            ;
          }
          while (*(unsigned char *)(v14 + 3) != 93);
          uint64_t v15 = &v13[v7 + 2];
          if (v15 == a3) {
            goto LABEL_177;
          }
          memset(__dst, 170, 24);
          std::regex_traits<char>::__lookup_collatename<char const*>((uint64_t)__dst, a1, (unsigned char *)(v7 + 2), v15);
          if (SBYTE7(__dst[1]) < 0)
          {
            uint64_t v16 = *((void *)&__dst[0] + 1);
            if (!*((void *)&__dst[0] + 1)) {
LABEL_180:
            }
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
            memset(__s, 170, 24);
            std::vector<std::csub_match>::size_type v17 = *(char **)&__dst[0];
          }
          else
          {
            uint64_t v16 = BYTE7(__dst[1]);
            if (!BYTE7(__dst[1])) {
              goto LABEL_180;
            }
            std::vector<std::csub_match>::size_type v17 = (char *)__dst;
            memset(__s, 170, 24);
          }
          std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(__s, a1, (uint64_t)v17, &v17[v16]);
          unsigned int v42 = (std::string::value_type *)HIBYTE(__s[2]);
          if (SHIBYTE(__s[2]) < 0) {
            unsigned int v42 = __s[1];
          }
          if (v42)
          {
            unint64_t v43 = *((void *)v8 + 18);
            if (v43 >= *((void *)v8 + 19))
            {
              *((void *)v8 + 18) = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)v8 + 17, (uint64_t)__s);
              if (SHIBYTE(__s[2]) < 0) {
                goto LABEL_157;
              }
            }
            else
            {
              if (SHIBYTE(__s[2]) < 0)
              {
                std::string::__init_copy_ctor_external(*((std::string **)v8 + 18), __s[0], (std::string::size_type)__s[1]);
              }
              else
              {
                long long v44 = *(_OWORD *)__s;
                *(std::string::value_type **)(v43 + 16) = __s[2];
                *(_OWORD *)unint64_t v43 = v44;
              }
              *((void *)v8 + 18) = v43 + 24;
              *((void *)v8 + 18) = v43 + 24;
              if (SHIBYTE(__s[2]) < 0) {
                goto LABEL_157;
              }
            }
LABEL_149:
            if ((SBYTE7(__dst[1]) & 0x80000000) == 0) {
              goto LABEL_150;
            }
          }
          else
          {
            uint64_t v45 = BYTE7(__dst[1]);
            if (SBYTE7(__dst[1]) < 0) {
              uint64_t v45 = *((void *)&__dst[0] + 1);
            }
            if (v45 == 2)
            {
              if ((SBYTE7(__dst[1]) & 0x80u) == 0) {
                v57 = (char *)__dst;
              }
              else {
                v57 = *(char **)&__dst[0];
              }
              std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)v8, *v57, v57[1]);
            }
            else
            {
              if (v45 != 1) {
                std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
              }
              if ((SBYTE7(__dst[1]) & 0x80u) == 0) {
                v46 = (char *)__dst;
              }
              else {
                v46 = *(char **)&__dst[0];
              }
              std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, *v46);
            }
            if ((SHIBYTE(__s[2]) & 0x80000000) == 0) {
              goto LABEL_149;
            }
LABEL_157:
            operator delete(__s[0]);
            if ((SBYTE7(__dst[1]) & 0x80000000) == 0)
            {
LABEL_150:
              char v40 = 0;
              v7 += (uint64_t)(v13 + 4);
              std::vector<std::pair<std::string, std::string>>::pointer v41 = v9;
              if ((SHIBYTE(v63) & 0x80000000) == 0) {
                goto LABEL_138;
              }
              goto LABEL_151;
            }
          }
          operator delete(*(void **)&__dst[0]);
          goto LABEL_150;
        }
        unint64_t v10 = (std::basic_regex<char>::value_type *)v7;
LABEL_60:
        uint64_t v7 = *(_DWORD *)(a1 + 24) & 0x1F0;
        int v29 = 0;
        goto LABEL_61;
      }
      uint64_t v22 = (unsigned char *)(v7 + 2);
      if ((uint64_t)&a3[-v7 - 2] < 2) {
        goto LABEL_177;
      }
      uint64_t v23 = &v59[-v7];
      uint64_t v24 = (std::basic_regex<char>::value_type *)(v7 + 2);
      uint64_t v25 = (std::basic_regex<char>::value_type *)(v7 + 3);
      if (*v22 != 46) {
        break;
      }
LABEL_46:
      if (*v25 != 93) {
        goto LABEL_44;
      }
      if (v24 == a3) {
        goto LABEL_177;
      }
      std::regex_traits<char>::__lookup_collatename<char const*>((uint64_t)__dst, a1, v22, v24);
      if (SHIBYTE(v63) < 0) {
        operator delete(__p[0]);
      }
      *(_OWORD *)std::string __p = __dst[0];
      unint64_t v63 = *(void *)&__dst[1];
      unint64_t v27 = *((void *)&__dst[0] + 1);
      if ((SBYTE7(__dst[1]) & 0x80u) == 0) {
        uint64_t v28 = (char *)HIBYTE(v63);
      }
      else {
        uint64_t v28 = (char *)__p[1];
      }
      if ((unint64_t)(v28 - 1) >= 2) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
      }
      unint64_t v10 = v24 + 2;
      uint64_t v7 = *(_DWORD *)(a1 + 24) & 0x1F0;
      int v29 = SBYTE7(__dst[1]);
      if ((SBYTE7(__dst[1]) & 0x80u) == 0) {
        unint64_t v27 = HIBYTE(v63);
      }
      if (v27)
      {
        if (v10 == a3) {
          goto LABEL_109;
        }
        goto LABEL_108;
      }
LABEL_61:
      if ((v7 | 0x40) == 0x40)
      {
        int v30 = *v10;
        if (v30 == 92)
        {
          std::vector<char>::pointer v31 = v10 + 1;
          if (v7) {
            uint64_t v32 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v31, a3, (uint64_t *)__p);
          }
          else {
            uint64_t v32 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)v31, (unsigned __int8 *)a3, (uint64_t)__p, (uint64_t)v8);
          }
          unint64_t v10 = v32;
          if (v32 == a3) {
            goto LABEL_109;
          }
          goto LABEL_108;
        }
      }
      else
      {
        LOBYTE(v30) = *v10;
      }
      if (v29 < 0)
      {
        unint64_t v33 = __p[0];
        __p[1] = (void *)1;
        *(unsigned char *)__p[0] = v30;
        v33[1] = 0;
        if (++v10 == a3) {
          goto LABEL_109;
        }
      }
      else
      {
        HIBYTE(v63) = 1;
        LOWORD(__p[0]) = v30;
        if (++v10 == a3) {
          goto LABEL_109;
        }
      }
LABEL_108:
      int v47 = *v10;
      if (v47 != 93)
      {
        v49 = v10 + 1;
        if (v10 + 1 != a3 && v47 == 45 && *v49 != 93)
        {
          memset(__s, 0, 24);
          std::vector<std::pair<std::string, std::string>>::pointer v41 = v10 + 2;
          if (v10 + 2 == a3 || *v49 != 91 || *v41 != 46)
          {
            if ((v7 | 0x40) == 0x40)
            {
              LODWORD(v49) = *v49;
              if (v49 == 92)
              {
                if (v7) {
                  int v56 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v10 + 2, a3, (uint64_t *)__s);
                }
                else {
                  int v56 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)v10 + 2, (unsigned __int8 *)a3, (uint64_t)__s, (uint64_t)v8);
                }
                std::vector<std::pair<std::string, std::string>>::pointer v41 = v56;
                goto LABEL_161;
              }
            }
            else
            {
              LOBYTE(v49) = *v49;
            }
            HIBYTE(__s[2]) = 1;
            LOWORD(__s[0]) = v49;
            goto LABEL_161;
          }
          BOOL v50 = v10 + 3;
          if (a3 - (v10 + 3) < 2) {
            goto LABEL_179;
          }
          int64_t v51 = a3 - 5 - v10;
          v52 = v10 + 3;
          size_t v53 = v50 + 1;
          if (*v50 == 46) {
            goto LABEL_127;
          }
          do
          {
            do
            {
              if (!v51) {
                goto LABEL_179;
              }
              --v51;
              v52 = v53;
              int v54 = *v53++;
            }
            while (v54 != 46);
LABEL_127:
            ;
          }
          while (*v53 != 93);
          if (v52 == a3) {
LABEL_179:
          }
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
          std::regex_traits<char>::__lookup_collatename<char const*>((uint64_t)__dst, a1, v50, v52);
          if (SHIBYTE(__s[2]) < 0) {
            operator delete(__s[0]);
          }
          __s[2] = *(std::string::value_type **)&__dst[1];
          *(_OWORD *)std::string __s = __dst[0];
          int v55 = (std::string::value_type *)HIBYTE(*(void *)&__dst[1]);
          if (SBYTE7(__dst[1]) < 0) {
            int v55 = __s[1];
          }
          if ((unint64_t)(v55 - 1) >= 2) {
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
          }
          std::vector<std::pair<std::string, std::string>>::pointer v41 = v52 + 2;
LABEL_161:
          __dst[0] = *(_OWORD *)__p;
          *(void *)&__dst[1] = v63;
          __p[1] = 0;
          unint64_t v63 = 0;
          __p[0] = 0;
          *(_OWORD *)int v60 = *(_OWORD *)__s;
          int v61 = __s[2];
          memset(__s, 0, 24);
          std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100]((uint64_t)v8, (char *)__dst, (uint64_t)v60);
          if (SHIBYTE(v61) < 0)
          {
            operator delete(v60[0]);
            if (SBYTE7(__dst[1]) < 0) {
              goto LABEL_167;
            }
LABEL_163:
            if ((SHIBYTE(__s[2]) & 0x80000000) == 0) {
              goto LABEL_164;
            }
LABEL_168:
            operator delete(__s[0]);
            char v40 = 1;
            if ((SHIBYTE(v63) & 0x80000000) == 0) {
              goto LABEL_138;
            }
          }
          else
          {
            if ((SBYTE7(__dst[1]) & 0x80000000) == 0) {
              goto LABEL_163;
            }
LABEL_167:
            operator delete(*(void **)&__dst[0]);
            if (SHIBYTE(__s[2]) < 0) {
              goto LABEL_168;
            }
LABEL_164:
            char v40 = 1;
            if ((SHIBYTE(v63) & 0x80000000) == 0) {
              goto LABEL_138;
            }
          }
LABEL_151:
          operator delete(__p[0]);
          unint64_t v10 = v41;
          if ((v40 & 1) == 0) {
            goto LABEL_15;
          }
          goto LABEL_14;
        }
      }
LABEL_109:
      if (SHIBYTE(v63) < 0)
      {
        if (__p[1])
        {
          if (__p[1] == (void *)1)
          {
            uint64_t v48 = (void **)__p[0];
LABEL_116:
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, *(char *)v48);
LABEL_137:
            char v40 = 1;
            std::vector<std::pair<std::string, std::string>>::pointer v41 = v10;
            if ((SHIBYTE(v63) & 0x80000000) == 0) {
              goto LABEL_138;
            }
            goto LABEL_151;
          }
          uint64_t v48 = (void **)__p[0];
LABEL_136:
          std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)v8, *(char *)v48, *((char *)v48 + 1));
          goto LABEL_137;
        }
        operator delete(__p[0]);
      }
      else if (HIBYTE(v63))
      {
        uint64_t v48 = __p;
        if (HIBYTE(v63) == 1) {
          goto LABEL_116;
        }
        goto LABEL_136;
      }
LABEL_14:
      uint64_t v7 = (uint64_t)v10;
LABEL_15:
      if ((std::basic_regex<char>::value_type *)v7 == v9)
      {
        if (v9 != a3)
        {
          if (*v9 == 45)
          {
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 45);
            ++v9;
          }
          if (v9 != a3 && *v9 == 93) {
            return v9 + 1;
          }
        }
LABEL_178:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
      }
    }
    do
    {
LABEL_44:
      if (!v23) {
        goto LABEL_177;
      }
      --v23;
      uint64_t v24 = v25;
      int v26 = *v25++;
    }
    while (v26 != 46);
    goto LABEL_46;
  }
  return a2;
}

void sub_21D82EA44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  *(void *)(v32 + 144) = v33;
  if (a32 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v34 - 89) < 0) {
    operator delete(*(void **)(v34 - 112));
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  _Unwind_Resume(exception_object);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(uint64_t a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  if (this == a3) {
    return this;
  }
  int v6 = *(_DWORD *)(a1 + 24) & 0x1F0;
  int locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low <= 62)
  {
    if (locale_low == 42)
    {
      unint64_t v8 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (v6) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v8 == a3;
      }
      if (!v20 && LOBYTE(v8->__traits_.__loc_.__locale_) == 63)
      {
        uint64_t v9 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_std::vector<std::pair<unsigned long, const char *>>::pointer begin = __mexp_begin;
        __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
        size_t v10 = 0;
        goto LABEL_35;
      }
      __mexp_std::vector<std::pair<unsigned long, const char *>>::pointer begin = __mexp_begin;
      __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
      size_t v24 = 0;
      goto LABEL_44;
    }
    if (locale_low == 43)
    {
      unint64_t v8 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (!v6 && v8 != a3 && LOBYTE(v8->__traits_.__loc_.__locale_) == 63)
      {
        uint64_t v9 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_std::vector<std::pair<unsigned long, const char *>>::pointer begin = __mexp_begin;
        __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
        size_t v10 = 1;
LABEL_35:
        std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v10, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 0);
        return (std::basic_regex<char> *)v9;
      }
      __mexp_std::vector<std::pair<unsigned long, const char *>>::pointer begin = __mexp_begin;
      __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
      size_t v24 = 1;
      goto LABEL_44;
    }
    return this;
  }
  if (locale_low == 63)
  {
    std::pair<const char *, const char *> v21 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
    if (v6) {
      BOOL v22 = 1;
    }
    else {
      BOOL v22 = v21 == a3;
    }
    if (v22 || LOBYTE(v21->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 1);
      return v21;
    }
    else
    {
      uint64_t v23 = (char *)&this->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v23;
    }
  }
  else
  {
    if (locale_low != 123) {
      return this;
    }
    int v11 = (char *)&this->__traits_.__loc_.__locale_ + 1;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3) {
      goto LABEL_71;
    }
    int v12 = *v11;
    if ((v12 & 0xF8) != 0x30 && (v12 & 0xFE) != 0x38) {
      goto LABEL_71;
    }
    int v13 = v12 - 48;
    uint64_t v14 = (char *)&this->__traits_.__loc_.__locale_ + 2;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2) == a3)
    {
LABEL_19:
      uint64_t v14 = (char *)a3;
    }
    else
    {
      while (1)
      {
        int v15 = *v14;
        if ((v15 & 0xF8) != 0x30 && (v15 & 0xFE) != 0x38) {
          break;
        }
        if (v13 >= 214748364) {
          goto LABEL_71;
        }
        int v13 = v15 + 10 * v13 - 48;
        if (++v14 == (char *)a3) {
          goto LABEL_19;
        }
      }
    }
    if (v14 == v11) {
      goto LABEL_71;
    }
    if (v14 == (char *)a3) {
      goto LABEL_72;
    }
    int v16 = *v14;
    if (v16 != 44)
    {
      if (v16 == 125)
      {
        std::vector<std::csub_match>::size_type v17 = (std::basic_regex<char> *)(v14 + 1);
        if (v6 || v17 == a3 || LOBYTE(v17->__traits_.__loc_.__locale_) != 63)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v13, v13, a4, __mexp_begin, __mexp_end, 1);
          return v17;
        }
        else
        {
          size_t v18 = (unsigned __int8 *)(v14 + 2);
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v13, v13, a4, __mexp_begin, __mexp_end, 0);
          return (std::basic_regex<char> *)v18;
        }
      }
LABEL_71:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
    }
    uint64_t v25 = (std::basic_regex<char> *)(v14 + 1);
    if (v14 + 1 == (char *)a3) {
      goto LABEL_71;
    }
    int v26 = LOBYTE(v25->__traits_.__loc_.__locale_);
    if (v26 == 125)
    {
      unint64_t v8 = (std::basic_regex<char> *)(v14 + 2);
      if (!v6 && v8 != a3 && LOBYTE(v8->__traits_.__loc_.__locale_) == 63)
      {
        size_t v10 = v13;
        uint64_t v9 = v14 + 3;
        __mexp_std::vector<std::pair<unsigned long, const char *>>::pointer begin = __mexp_begin;
        __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
        goto LABEL_35;
      }
      size_t v24 = v13;
      __mexp_std::vector<std::pair<unsigned long, const char *>>::pointer begin = __mexp_begin;
      __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
LABEL_44:
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v24, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
      return v8;
    }
    if ((v26 & 0xF8) != 0x30 && (v26 & 0xFE) != 0x38) {
      goto LABEL_72;
    }
    int v27 = v26 - 48;
    uint64_t v28 = (std::basic_regex<char> *)(v14 + 2);
    if (v28 == a3)
    {
LABEL_60:
      uint64_t v28 = a3;
    }
    else
    {
      while (1)
      {
        int v29 = LOBYTE(v28->__traits_.__loc_.__locale_);
        if ((v29 & 0xF8) != 0x30 && (v29 & 0xFE) != 0x38) {
          break;
        }
        if (v27 >= 214748364) {
          goto LABEL_71;
        }
        int v27 = v29 + 10 * v27 - 48;
        uint64_t v28 = (std::basic_regex<char> *)((char *)v28 + 1);
        if (v28 == a3) {
          goto LABEL_60;
        }
      }
    }
    if (v28 == v25 || v28 == a3 || LOBYTE(v28->__traits_.__loc_.__locale_) != 125) {
LABEL_72:
    }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    if (v27 < v13) {
      goto LABEL_71;
    }
    int v30 = (std::basic_regex<char> *)((char *)&v28->__traits_.__loc_.__locale_ + 1);
    if (v6 || v30 == a3 || LOBYTE(v30->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v13, v27, a4, __mexp_begin, __mexp_end, 1);
      return v30;
    }
    else
    {
      std::vector<char>::pointer v31 = (char *)&v28->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v13, v27, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v31;
    }
  }
}

void std::basic_regex<char,std::regex_traits<char>>::__push_loop(std::basic_regex<char> *this, size_t __min, size_t __max, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end, BOOL __greedy)
{
  int v8 = __mexp_end;
  int v9 = __mexp_begin;
  uint64_t v14 = operator new(0x10uLL);
  std::vector<std::csub_match>::pointer end = this->__end_;
  first = end->__first_;
  v14[1] = first;
  end->__first_ = 0;
  std::vector<std::csub_match>::size_type v17 = operator new(0x38uLL);
  unsigned int loop_count = this->__loop_count_;
  *((void *)v17 + 1) = __s->__first_;
  *((void *)v17 + 2) = v14;
  *(void *)std::vector<std::csub_match>::size_type v17 = &unk_26CE32A70;
  *((void *)v17 + 3) = __min;
  *((void *)v17 + 4) = __max;
  *((_DWORD *)v17 + 10) = loop_count;
  *((_DWORD *)v17 + 11) = v9;
  *((_DWORD *)v17 + 12) = v8;
  *((unsigned char *)v17 + 52) = __greedy;
  __s->__first_ = 0;
  uint64_t v19 = (std::__node<char> *)operator new(0x10uLL);
  v19->__vftable = (std::__node<char>_vtbl *)&unk_26CE32B00;
  v19[1].__vftable = (std::__node<char>_vtbl *)v17;
  this->__end_->__first_ = v19;
  this->__end_ = (std::__owns_one_state<char> *)*((void *)v17 + 2);
  __s->__first_ = (std::__node<char> *)v17;
  this->__loop_count_ = loop_count + 1;
}

void sub_21D82F034(_Unwind_Exception *a1)
{
  std::__loop<char>::~__loop(v1);
  _Unwind_Resume(a1);
}

void sub_21D82F048(_Unwind_Exception *a1)
{
  std::__empty_state<char>::~__empty_state(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(uint64_t a1, char *a2, char *a3)
{
  if (a2 == a3) {
    return a2;
  }
  int v6 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 != a3)
      {
        int v14 = a2[1];
        if (v14 == 66)
        {
          int v15 = (char *)operator new(0x30uLL);
          uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
          *(void *)int v15 = &unk_26CE32710;
          *((void *)v15 + 1) = v23;
          std::locale::locale((std::locale *)v15 + 2, (const std::locale *)a1);
          *(_OWORD *)(v15 + 24) = *(_OWORD *)(a1 + 8);
          v15[40] = 1;
        }
        else
        {
          if (v14 != 98) {
            return a2;
          }
          int v15 = (char *)operator new(0x30uLL);
          uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
          *(void *)int v15 = &unk_26CE32710;
          *((void *)v15 + 1) = v16;
          std::locale::locale((std::locale *)v15 + 2, (const std::locale *)a1);
          *(_OWORD *)(v15 + 24) = *(_OWORD *)(a1 + 8);
          v15[40] = 0;
        }
        *(void *)(*(void *)(a1 + 56) + 8) = v15;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
        return a2 + 2;
      }
      return a2;
    }
    if (v6 != 94) {
      return a2;
    }
    size_t v10 = operator new(0x18uLL);
    BOOL v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v12 = *(void *)(a1 + 56);
    v10[1] = *(void *)(v12 + 8);
    int v13 = &unk_26CE32680;
LABEL_14:
    void *v10 = v13;
    *((unsigned char *)v10 + 16) = v11;
    *(void *)(v12 + 8) = v10;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    return a2 + 1;
  }
  if (v6 == 36)
  {
    size_t v10 = operator new(0x18uLL);
    BOOL v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v12 = *(void *)(a1 + 56);
    v10[1] = *(void *)(v12 + 8);
    int v13 = &unk_26CE326C8;
    goto LABEL_14;
  }
  BOOL v8 = v6 == 40;
  uint64_t v7 = a2 + 1;
  BOOL v8 = !v8 || v7 == a3;
  if (v8) {
    return a2;
  }
  BOOL v8 = *v7 == 63;
  std::vector<std::csub_match>::size_type v17 = a2 + 2;
  if (!v8 || v17 == a3) {
    return a2;
  }
  int v19 = *v17;
  if (v19 == 33)
  {
    *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v26.__loop_count_ = v24;
    *(_OWORD *)&v26.__start_.__cntrl_ = v24;
    *(_OWORD *)&v26.__traits_.__loc_.__locale_ = v24;
    *(_OWORD *)&v26.__traits_.__col_ = v24;
    std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v26);
    v26.__flags_ = *(_DWORD *)(a1 + 24);
    std::pair<const char *, const char *> v21 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v26, a2 + 3, a3);
    unsigned int marked_count = v26.__marked_count_;
    std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v26, 1, *(_DWORD *)(a1 + 28));
    *(_DWORD *)(a1 + 28) += marked_count;
    if (v21 == a3 || *v21 != 41) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    goto LABEL_32;
  }
  if (v19 != 61) {
    return a2;
  }
  *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v26.__loop_count_ = v20;
  *(_OWORD *)&v26.__start_.__cntrl_ = v20;
  *(_OWORD *)&v26.__traits_.__loc_.__locale_ = v20;
  *(_OWORD *)&v26.__traits_.__col_ = v20;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v26);
  v26.__flags_ = *(_DWORD *)(a1 + 24);
  std::pair<const char *, const char *> v21 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v26, a2 + 3, a3);
  unsigned int v22 = v26.__marked_count_;
  std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v26, 0, *(_DWORD *)(a1 + 28));
  *(_DWORD *)(a1 + 28) += v22;
  if (v21 == a3 || *v21 != 41) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
  }
LABEL_32:
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&v26.__traits_.__loc_);
  return v21 + 1;
}

void sub_21D82F398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_21D82F3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_21D82F3C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_21D82F3D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(std::basic_regex<char> *this, std::basic_regex<char>::value_type *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return a2;
  }
  int v5 = *a2;
  uint64_t v7 = a2;
  switch(*a2)
  {
    case '$':
    case ')':
    case ']':
    case '^':
    case '|':
    case '}':
      return v7;
    case '(':
      if (a2 + 1 == a3) {
        goto LABEL_58;
      }
      if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
      {
        p_open_count = &this->__open_count_;
        ++this->__open_count_;
        int v13 = std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, a2 + 3, a3);
        if (v13 == a3) {
          goto LABEL_58;
        }
        uint64_t v3 = v13;
        if (*v13 != 41) {
          goto LABEL_58;
        }
      }
      else
      {
        if ((this->__flags_ & 2) != 0)
        {
          unsigned int marked_count = this->__marked_count_;
        }
        else
        {
          std::vector<std::csub_match>::size_type v17 = (std::__node<char> *)operator new(0x18uLL);
          unsigned int marked_count = this->__marked_count_ + 1;
          this->__marked_count_ = marked_count;
          std::vector<std::csub_match>::pointer end = this->__end_;
          first = end->__first_;
          v17->__vftable = (std::__node<char>_vtbl *)&unk_26CE329E0;
          v17[1].__vftable = (std::__node<char>_vtbl *)first;
          LODWORD(v17[2].__vftable) = marked_count;
          end->__first_ = v17;
          this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
        }
        p_open_count = &this->__open_count_;
        ++this->__open_count_;
        std::pair<const char *, const char *> v21 = std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, v3 + 1, a3);
        if (v21 == a3 || (uint64_t v3 = v21, *v21 != 41)) {
LABEL_58:
        }
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
        if ((this->__flags_ & 2) == 0)
        {
          unsigned int v22 = (std::__node<char> *)operator new(0x18uLL);
          uint64_t v23 = this->__end_;
          long long v24 = v23->__first_;
          v22->__vftable = (std::__node<char>_vtbl *)&unk_26CE32A28;
          v22[1].__vftable = (std::__node<char>_vtbl *)v24;
          LODWORD(v22[2].__vftable) = marked_count;
          v23->__first_ = v22;
          this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
        }
      }
      --*p_open_count;
      return v3 + 1;
    case '*':
    case '+':
    case '?':
    case '{':
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
    case '.':
      int v9 = (std::__node<char> *)operator new(0x10uLL);
      size_t v10 = this->__end_;
      BOOL v11 = v10->__first_;
      v9->__vftable = (std::__node<char>_vtbl *)&unk_26CE327A0;
      v9[1].__vftable = (std::__node<char>_vtbl *)v11;
      v10->__first_ = v9;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      return v3 + 1;
    case '[':
      return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
    case '\\':
      if (v5 != 92) {
        return a2;
      }
      int v14 = (unsigned __int8 *)(a2 + 1);
      if (a2 + 1 == a3) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
      }
      int v15 = *v14;
      unsigned int v16 = v15 - 48;
      if (v15 != 48)
      {
        if ((v15 - 49) <= 8)
        {
          uint64_t v7 = v3 + 2;
          if (v3 + 2 == a3)
          {
            uint64_t v7 = a3;
          }
          else
          {
            while (1)
            {
              int v25 = *v7;
              if ((v25 - 48) > 9) {
                break;
              }
              if (v16 >= 0x19999999) {
                goto LABEL_59;
              }
              ++v7;
              unsigned int v16 = v25 + 10 * v16 - 48;
              if (v7 == a3)
              {
                uint64_t v7 = a3;
                break;
              }
            }
            if (!v16) {
LABEL_59:
            }
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
          }
          if (v16 > this->__marked_count_) {
            goto LABEL_59;
          }
          std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, v16);
          if (v7 != (char *)v14) {
            return v7;
          }
          LOBYTE(v15) = *v14;
        }
        switch((char)v15)
        {
          case 'D':
            std::basic_regex<char> v26 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v26, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_50;
          case 'S':
            std::basic_regex<char> v26 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v26, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_54;
          case 'W':
            uint64_t v28 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v28, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_52;
          case 'd':
            std::basic_regex<char> v26 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v26, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_50:
            this->__end_->__first_ = v26;
            this->__end_ = v26;
            int v29 = LODWORD(v26[10].__vftable) | 0x400;
            goto LABEL_55;
          case 's':
            std::basic_regex<char> v26 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v26, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_54:
            this->__end_->__first_ = v26;
            this->__end_ = v26;
            int v29 = LODWORD(v26[10].__vftable) | 0x4000;
LABEL_55:
            LODWORD(v26[10].__vftable) = v29;
            break;
          case 'w':
            uint64_t v28 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v28, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_52:
            this->__end_->__first_ = v28;
            this->__end_ = v28;
            LODWORD(v28[10].__vftable) |= 0x500u;
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v28, 95);
            break;
          default:
            int v27 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(this, (unsigned __int8 *)v3 + 1, (unsigned __int8 *)a3, 0);
            if (v27 == v14) {
              return v3;
            }
            else {
              return (std::basic_regex<char>::value_type *)v27;
            }
        }
        return v3 + 2;
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v16);
      return v3 + 2;
    default:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v5);
      return v3 + 1;
  }
}

void sub_21D82F91C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21D82F930(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21D82F944(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21D82F958(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21D82F96C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21D82F980(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void Timestamp::Timestamp(Timestamp *this)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  *((void *)this + 1) = 0;
  uint64_t v2 = (void *)((char *)this + 8);
  *((void *)this + 2) = 0;
  *(void *)this = (char *)this + 8;
  unsigned long long v12 = 0uLL;
  if ((gettimeofday((timeval *)&v12, 0) & 0x80000000) == 0
    || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *v2;
    v4 = v2;
    if (*v2) {
      goto LABEL_4;
    }
LABEL_10:
    uint64_t v7 = (char *)operator new(0x38uLL);
    *((_DWORD *)v7 + 8) = 0;
    *((void *)v7 + 5) = 0;
    *((void *)v7 + 6) = 0;
    *(void *)uint64_t v7 = 0;
    *((void *)v7 + 1) = 0;
    *((void *)v7 + 2) = v4;
    void *v2 = v7;
    uint64_t v8 = **(void **)this;
    int v9 = (uint64_t *)v7;
    if (v8)
    {
      *(void *)this = v8;
      int v9 = (uint64_t *)*v2;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)this + 1), v9);
    ++*((void *)this + 2);
    goto LABEL_13;
  }
  size_t v10 = __error();
  BOOL v11 = strerror(*v10);
  *(_DWORD *)buf = 136315138;
  int v14 = v11;
  _os_log_error_impl(&dword_21D82B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to get current time. Error: %s\n", buf, 0xCu);
  uint64_t v3 = *v2;
  v4 = v2;
  if (!*v2) {
    goto LABEL_10;
  }
LABEL_4:
  uint64_t v5 = v3;
  while (1)
  {
    while (1)
    {
      v4 = (void *)v5;
      int v6 = *(_DWORD *)(v5 + 32);
      if (v6 < 1) {
        break;
      }
      uint64_t v5 = *v4;
      uint64_t v2 = v4;
      if (!*v4) {
        goto LABEL_10;
      }
    }
    if ((v6 & 0x80000000) == 0) {
      break;
    }
    uint64_t v5 = v4[1];
    if (!v5)
    {
      uint64_t v2 = v4 + 1;
      goto LABEL_10;
    }
  }
  uint64_t v7 = (char *)v4;
LABEL_13:
  *(_OWORD *)(v7 + 40) = v12;
}

void sub_21D82FB24(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

void sub_21D82FB3C(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v1);
  _Unwind_Resume(a1);
}

void Timestamp::Timestamp(Timestamp *this, const Timestamp *a2)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = (char *)this + 8;
  std::map<Timestamp::TimeDomain,timeval>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<Timestamp::TimeDomain,timeval>,std::__tree_node<std::__value_type<Timestamp::TimeDomain,timeval>,void *> *,long>>>((uint64_t *)this, *(void **)a2, (void *)a2 + 1);
}

{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = (char *)this + 8;
  std::map<Timestamp::TimeDomain,timeval>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<Timestamp::TimeDomain,timeval>,std::__tree_node<std::__value_type<Timestamp::TimeDomain,timeval>,void *> *,long>>>((uint64_t *)this, *(void **)a2, (void *)a2 + 1);
}

void sub_21D82FB94(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

void sub_21D82FBE8(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

void *Timestamp::Timestamp(void *a1, _OWORD *a2, int a3)
{
  a1[2] = 0;
  a1[1] = 0;
  int v6 = a1 + 1;
  *a1 = a1 + 1;
  uint64_t v7 = (char *)operator new(0x38uLL);
  *((_DWORD *)v7 + 8) = a3;
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = v6;
  *int v6 = v7;
  *a1 = v7;
  v7[24] = 1;
  a1[2] = 1;
  *(_OWORD *)(v7 + 40) = *a2;
  return a1;
}

{
  void *v6;
  char *v7;

  a1[2] = 0;
  a1[1] = 0;
  int v6 = a1 + 1;
  *a1 = a1 + 1;
  uint64_t v7 = (char *)operator new(0x38uLL);
  *((_DWORD *)v7 + 8) = a3;
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = v6;
  *int v6 = v7;
  *a1 = v7;
  v7[24] = 1;
  a1[2] = 1;
  *(_OWORD *)(v7 + 40) = *a2;
  return a1;
}

__n128 Timestamp::set(uint64_t **a1, __n128 *a2, int a3)
{
  uint64_t v7 = a1 + 1;
  int v6 = (char *)a1[1];
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v8 = v6;
        int v9 = *((_DWORD *)v6 + 8);
        if (v9 <= a3) {
          break;
        }
        int v6 = *(char **)v8;
        uint64_t v7 = (uint64_t **)v8;
        if (!*(void *)v8) {
          goto LABEL_8;
        }
      }
      if (v9 >= a3) {
        break;
      }
      int v6 = (char *)*((void *)v8 + 1);
      if (!v6)
      {
        uint64_t v7 = (uint64_t **)(v8 + 8);
        goto LABEL_8;
      }
    }
  }
  else
  {
    uint64_t v8 = (char *)(a1 + 1);
LABEL_8:
    size_t v10 = v8;
    uint64_t v8 = (char *)operator new(0x38uLL);
    *((_DWORD *)v8 + 8) = a3;
    *((void *)v8 + 5) = 0;
    *((void *)v8 + 6) = 0;
    *(void *)uint64_t v8 = 0;
    *((void *)v8 + 1) = 0;
    *((void *)v8 + 2) = v10;
    *uint64_t v7 = (uint64_t *)v8;
    BOOL v11 = (uint64_t *)**a1;
    unsigned long long v12 = (uint64_t *)v8;
    if (v11)
    {
      *a1 = v11;
      unsigned long long v12 = *v7;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  __n128 result = *a2;
  *(__n128 *)(v8 + 40) = *a2;
  return result;
}

void *Timestamp::Timestamp(void *a1, uint64_t a2, int a3)
{
  a1[2] = 0;
  a1[1] = 0;
  int v6 = a1 + 1;
  *a1 = a1 + 1;
  uint64_t v7 = operator new(0x38uLL);
  v7[8] = a3;
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = v6;
  *int v6 = v7;
  *a1 = v7;
  *((unsigned char *)v7 + 24) = 1;
  a1[2] = 1;
  *((void *)v7 + 5) = a2;
  *((void *)v7 + 6) = 0xAAAAAAAAAAAAAAAALL;
  return a1;
}

{
  void *v6;
  _DWORD *v7;

  a1[2] = 0;
  a1[1] = 0;
  int v6 = a1 + 1;
  *a1 = a1 + 1;
  uint64_t v7 = operator new(0x38uLL);
  v7[8] = a3;
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = v6;
  *int v6 = v7;
  *a1 = v7;
  *((unsigned char *)v7 + 24) = 1;
  a1[2] = 1;
  *((void *)v7 + 5) = a2;
  *((void *)v7 + 6) = 0xAAAAAAAAAAAAAAAALL;
  return a1;
}

uint64_t **Timestamp::Timestamp(uint64_t **a1, char *a2, char a3, int a4)
{
  uint64_t v5 = a2;
  uint64_t v29 = *MEMORY[0x263EF8340];
  a1[1] = 0;
  uint64_t v7 = a1 + 1;
  a1[2] = 0;
  *a1 = (uint64_t *)(a1 + 1);
  __p[2] = (void *)0x11AAAAAAAAAA0053;
  *(_OWORD *)std::string __p = *(_OWORD *)"%Y-%m-%d-%H-%M-%S";
  if ((a3 & 0x10) != 0)
  {
    HIBYTE(__p[2]) = 19;
    strcpy((char *)__p, "%Y.%m.%d_%H-%M-%S%z");
  }
  *((void *)&v24 + 1) = 0xAAAAAAAA00000000;
  memset(&v25, 0, sizeof(v25));
  if (a2[23] < 0) {
    uint64_t v5 = *(const char **)a2;
  }
  if (strptime(v5, (const char *)__p, &v25))
  {
    v25.tm_isdst = -1;
    *(void *)&unsigned long long v24 = mktime(&v25);
    if ((void)v24 != -1) {
      goto LABEL_15;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      long long v20 = __error();
      std::pair<const char *, const char *> v21 = strerror(*v20);
      *(_DWORD *)buf = 136315138;
      uint64_t v28 = v21;
      _os_log_error_impl(&dword_21D82B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to convert to absolute time. Error: %s\n", buf, 0xCu);
      unsigned long long v24 = 0uLL;
      if ((gettimeofday((timeval *)&v24, 0) & 0x80000000) == 0) {
        goto LABEL_15;
      }
    }
    else
    {
      unsigned long long v24 = 0uLL;
      if ((gettimeofday((timeval *)&v24, 0) & 0x80000000) == 0) {
        goto LABEL_15;
      }
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v8 = __error();
    int v9 = strerror(*v8);
    *(_DWORD *)buf = 136315138;
    uint64_t v28 = v9;
    size_t v10 = &_os_log_internal;
    BOOL v11 = "Failed to get current time after absolute time conversion failed. Error: %s\n";
    goto LABEL_32;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D82B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed to convert time from string format\n", buf, 2u);
  }
  unsigned long long v24 = 0uLL;
  if (gettimeofday((timeval *)&v24, 0) < 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    unsigned int v22 = __error();
    uint64_t v23 = strerror(*v22);
    *(_DWORD *)buf = 136315138;
    uint64_t v28 = v23;
    size_t v10 = &_os_log_internal;
    BOOL v11 = "Failed to get current time after conversion failure. Error: %s\n";
LABEL_32:
    _os_log_error_impl(&dword_21D82B000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
  }
LABEL_15:
  unsigned long long v12 = *v7;
  int v13 = v7;
  int v14 = v7;
  if (*v7)
  {
    while (1)
    {
      while (1)
      {
        int v14 = v12;
        int v15 = *((_DWORD *)v12 + 8);
        if (v15 <= a4) {
          break;
        }
        unsigned long long v12 = (uint64_t *)*v14;
        int v13 = (uint64_t **)v14;
        if (!*v14) {
          goto LABEL_22;
        }
      }
      if (v15 >= a4) {
        break;
      }
      unsigned long long v12 = (uint64_t *)v14[1];
      if (!v12)
      {
        int v13 = (uint64_t **)(v14 + 1);
        goto LABEL_22;
      }
    }
    *(_OWORD *)(v14 + 5) = v24;
    if (SHIBYTE(__p[2]) < 0) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_22:
    unsigned int v16 = (char *)operator new(0x38uLL);
    *((_DWORD *)v16 + 8) = a4;
    *((void *)v16 + 5) = 0;
    *((void *)v16 + 6) = 0;
    *(void *)unsigned int v16 = 0;
    *((void *)v16 + 1) = 0;
    *((void *)v16 + 2) = v14;
    char *v13 = (uint64_t *)v16;
    std::vector<std::csub_match>::size_type v17 = (uint64_t *)**a1;
    size_t v18 = (uint64_t *)v16;
    if (v17)
    {
      *a1 = v17;
      size_t v18 = *v13;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v18);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    *(_OWORD *)(v16 + 40) = v24;
    if (SHIBYTE(__p[2]) < 0) {
LABEL_25:
    }
      operator delete(__p[0]);
  }
  return a1;
}

void sub_21D830204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(*v24);
  _Unwind_Resume(a1);
}

uint64_t Timestamp::get(uint64_t a1, void *a2, int a3)
{
  *a2 = 0;
  a2[1] = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v3 = a1 + 8;
  uint64_t v4 = v5;
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v3;
  do
  {
    int v7 = *(_DWORD *)(v4 + 32);
    BOOL v8 = v7 < a3;
    if (v7 >= a3) {
      int v9 = (uint64_t *)v4;
    }
    else {
      int v9 = (uint64_t *)(v4 + 8);
    }
    if (!v8) {
      uint64_t v6 = v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 == v3 || *(_DWORD *)(v6 + 32) > a3) {
    return 0;
  }
  *(_OWORD *)a2 = *(_OWORD *)(v6 + 40);
  return 1;
}

uint64_t Timestamp::now(timeval *this, timeval *a2)
{
  return gettimeofday(this, 0);
}

uint64_t Timestamp::asString@<X0>(uint64_t a1@<X0>, int a2@<W1>, char a3@<W2>, unsigned char *a4@<X8>)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v62 = v6;
  long long v61 = v6;
  long long v60 = v6;
  long long v59 = v6;
  long long v58 = v6;
  long long v57 = v6;
  long long v56 = v6;
  long long v55 = v6;
  long long v54 = v6;
  unint64_t v52 = 0xAAAAAAAAAAAAAAAALL;
  long long v51 = v6;
  long long __p = v6;
  long long v49 = v6;
  long long v48 = v6;
  long long v47 = v6;
  long long v46 = v6;
  unint64_t v44 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = MEMORY[0x263F8C328] + 104;
  uint64_t v53 = MEMORY[0x263F8C328] + 104;
  uint64_t v8 = MEMORY[0x263F8C328] + 64;
  uint64_t v45 = MEMORY[0x263F8C328] + 64;
  int v9 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v10 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v43 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(uint64_t *)((char *)&v43 + *(void *)(v43 - 24)) = v10;
  unint64_t v44 = 0;
  BOOL v11 = (std::ios_base *)((char *)&v43 + *(void *)(v43 - 24));
  std::ios_base::init(v11, &v46);
  uint64_t v12 = MEMORY[0x263F8C328] + 24;
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  uint64_t v13 = v9[5];
  uint64_t v45 = v9[4];
  *(uint64_t *)((char *)&v45 + *(void *)(v45 - 24)) = v13;
  uint64_t v43 = v9[1];
  *(uint64_t *)((char *)&v43 + *(void *)(v43 - 24)) = v9[6];
  uint64_t v53 = v7;
  uint64_t v43 = v12;
  uint64_t v45 = v8;
  std::streambuf::basic_streambuf();
  uint64_t v14 = MEMORY[0x263F8C318] + 16;
  *(void *)&long long v46 = MEMORY[0x263F8C318] + 16;
  long long __p = 0u;
  long long v51 = 0u;
  LODWORD(v52) = 24;
  uint64_t v17 = *(void *)(a1 + 8);
  uint64_t v16 = a1 + 8;
  uint64_t v15 = v17;
  if (!v17) {
    goto LABEL_13;
  }
  uint64_t v18 = v16;
  do
  {
    int v19 = *(_DWORD *)(v15 + 32);
    BOOL v20 = v19 < a2;
    if (v19 >= a2) {
      std::pair<const char *, const char *> v21 = (uint64_t *)v15;
    }
    else {
      std::pair<const char *, const char *> v21 = (uint64_t *)(v15 + 8);
    }
    if (!v20) {
      uint64_t v18 = v15;
    }
    uint64_t v15 = *v21;
  }
  while (*v21);
  if (v18 == v16)
  {
LABEL_13:
    time_t v24 = 0;
    unsigned int v22 = a4;
    char v23 = a3;
    if ((a3 & 0x11) != 0) {
      goto LABEL_14;
    }
    goto LABEL_22;
  }
  unsigned int v22 = a4;
  char v23 = a3;
  if (*(_DWORD *)(v18 + 32) <= a2)
  {
    time_t v24 = *(void *)(v18 + 40);
    if ((a3 & 0x11) != 0) {
      goto LABEL_14;
    }
LABEL_22:
    std::ostream::operator<<();
    if ((v23 & 4) != 0 || (v23 & 8) != 0)
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v45, (uint64_t)".", 1);
      std::ostream::operator<<();
    }
    goto LABEL_25;
  }
  time_t v24 = 0;
  if ((a3 & 0x11) == 0) {
    goto LABEL_22;
  }
LABEL_14:
  v41.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  time_t v42 = v24;
  *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v41.tm_mon = v25;
  *(_OWORD *)&v41.tm_isdst = v25;
  *(_OWORD *)&v41.tm_sec = v25;
  localtime_r(&v42, &v41);
  long long v66 = 0u;
  long long v67 = 0u;
  *(_OWORD *)std::string __s = 0u;
  long long v65 = 0u;
  if ((v23 & 0x10) != 0) {
    std::basic_regex<char> v26 = "%Y.%m.%d_%H-%M-%S%z";
  }
  else {
    std::basic_regex<char> v26 = "%Y-%m-%d-%H-%M-%S";
  }
  strftime(__s, 0x40uLL, v26, &v41);
  size_t v27 = strlen(__s);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v45, (uint64_t)__s, v27);
  if ((v23 & 8) != 0)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v45, (uint64_t)"-", 1);
    uint64_t v28 = v45;
    uint64_t v29 = (char *)&v45 + *(void *)(v45 - 24);
    if (*((_DWORD *)v29 + 36) == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)&v45 + *(void *)(v45 - 24)));
      int v30 = std::locale::use_facet(&v63, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v30->__vftable[2].~facet_0)(v30, 32);
      std::locale::~locale(&v63);
      uint64_t v28 = v45;
    }
    *((_DWORD *)v29 + 36) = 48;
    *(void *)((char *)&v47 + *(void *)(v28 - 24)) = 3;
    std::ostream::operator<<();
  }
LABEL_25:
  if ((v52 & 0x10) != 0)
  {
    uint64_t v32 = *((void *)&v51 + 1);
    if (*((void *)&v51 + 1) < (unint64_t)v49)
    {
      *((void *)&v51 + 1) = v49;
      uint64_t v32 = v49;
    }
    uint64_t v33 = (const void *)*((void *)&v48 + 1);
    size_t v31 = v32 - *((void *)&v48 + 1);
    if ((unint64_t)(v32 - *((void *)&v48 + 1)) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_42;
    }
  }
  else
  {
    if ((v52 & 8) == 0)
    {
      size_t v31 = 0;
      v22[23] = 0;
      goto LABEL_38;
    }
    uint64_t v33 = (const void *)v47;
    size_t v31 = v48 - v47;
    if ((void)v48 - (void)v47 >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_42:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v31 >= 0x17)
  {
    uint64_t v34 = (v31 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v31 | 7) != 0x17) {
      uint64_t v34 = v31 | 7;
    }
    uint64_t v35 = v34 + 1;
    uint64_t v36 = operator new(v34 + 1);
    *((void *)v22 + 1) = v31;
    *((void *)v22 + 2) = v35 | 0x8000000000000000;
    *(void *)unsigned int v22 = v36;
    unsigned int v22 = v36;
    goto LABEL_37;
  }
  v22[23] = v31;
  if (v31) {
LABEL_37:
  }
    memmove(v22, v33, v31);
LABEL_38:
  v22[v31] = 0;
  uint64_t v43 = *MEMORY[0x263F8C2B8];
  uint64_t v37 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(uint64_t *)((char *)&v43 + *(void *)(v43 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  uint64_t v45 = v37;
  *(void *)&long long v46 = v14;
  if (SBYTE7(v51) < 0) {
    operator delete((void *)__p);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x223C087A0](&v53);
}

void sub_21D8309C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21D8309DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  std::locale::~locale((std::locale *)(v13 - 184));
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21D8309F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21D830A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
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
  MEMORY[0x223C087A0](a1 + 128);
  return a1;
}

uint64_t *Timestamp::convert(uint64_t a1)
{
  memset(v11, 170, sizeof(v11));
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string __p = *(std::string *)a1;
  }
  Timestamp::Timestamp(v11, (char *)&__p, 9, 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    uint64_t v1 = v11[1];
    if (!v11[1])
    {
LABEL_18:
      std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v1);
      return 0;
    }
  }
  else
  {
    uint64_t v1 = v11[1];
    if (!v11[1]) {
      goto LABEL_18;
    }
  }
  uint64_t v2 = &v11[1];
  uint64_t v3 = v1;
  do
  {
    uint64_t v4 = (uint64_t **)v3;
    uint64_t v5 = v2;
    int v6 = *((_DWORD *)v3 + 8);
    if (v6 >= 0) {
      uint64_t v2 = (uint64_t **)v3;
    }
    else {
      ++v3;
    }
    uint64_t v3 = (uint64_t *)*v3;
  }
  while (v3);
  if (v2 == &v11[1]) {
    goto LABEL_18;
  }
  uint64_t v7 = v6 >= 0 ? v4 : v5;
  if (*((int *)v7 + 8) > 0) {
    goto LABEL_18;
  }
  if (v6 < 0) {
    uint64_t v4 = v5;
  }
  int v9 = v4[5];
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v1);
  return v9;
}

void sub_21D830CB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264461388, MEMORY[0x263F8C060]);
}

void sub_21D830D34(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void __clang_call_terminate(void *a1)
{
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
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
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(*a1);
    std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 == result) {
    return result;
  }
  while (1)
  {
    uint64_t v2 = a2[2];
    if (*(unsigned char *)(v2 + 24)) {
      return result;
    }
    uint64_t v3 = *(uint64_t **)(v2 + 16);
    uint64_t v4 = *v3;
    if (*v3 != v2) {
      break;
    }
    uint64_t v7 = v3[1];
    if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(unsigned char *)(v2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        *uint64_t v3 = v11;
        if (v11) {
          goto LABEL_15;
        }
      }
      else
      {
        int v9 = *(uint64_t **)(v2 + 8);
        uint64_t v10 = *v9;
        *(void *)(v2 + 8) = *v9;
        if (v10)
        {
          *(void *)(v10 + 16) = v2;
          uint64_t v3 = *(uint64_t **)(v2 + 16);
        }
        v9[2] = (uint64_t)v3;
        *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = v9;
        *int v9 = v2;
        *(void *)(v2 + 16) = v9;
        uint64_t v3 = (uint64_t *)v9[2];
        uint64_t v2 = *v3;
        *((unsigned char *)v9 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        *uint64_t v3 = v11;
        if (v11) {
LABEL_15:
        }
          *(void *)(v11 + 16) = v3;
      }
      *(void *)(v2 + 16) = v3[2];
      *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
      *(void *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(unsigned char *)(v2 + 24) = 1;
    a2 = v3;
    *((unsigned char *)v3 + 24) = v3 == result;
    *uint64_t v5 = 1;
    if (v3 == result) {
      return result;
    }
  }
  if (v4)
  {
    int v6 = *(unsigned __int8 *)(v4 + 24);
    uint64_t v5 = (unsigned char *)(v4 + 24);
    if (!v6) {
      goto LABEL_3;
    }
  }
  if (*(uint64_t **)v2 == a2)
  {
    uint64_t v12 = a2[1];
    *(void *)uint64_t v2 = v12;
    if (v12)
    {
      *(void *)(v12 + 16) = v2;
      uint64_t v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(void *)(v2 + 16) = a2;
    uint64_t v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((unsigned char *)a2 + 24) = 1;
  *((unsigned char *)v3 + 24) = 0;
  uint64_t v13 = (uint64_t *)v3[1];
  uint64_t v14 = *v13;
  v3[1] = *v13;
  if (v14) {
    *(void *)(v14 + 16) = v3;
  }
  v13[2] = v3[2];
  *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v13;
  uint64_t *v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

uint64_t *std::map<Timestamp::TimeDomain,timeval>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<Timestamp::TimeDomain,timeval>,std::__tree_node<std::__value_type<Timestamp::TimeDomain,timeval>,void *> *,long>>>(uint64_t *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    uint64_t v4 = a2;
    uint64_t v5 = result;
    int v6 = result + 1;
    do
    {
      int v7 = *((_DWORD *)v4 + 8);
      int v8 = (uint64_t *)v5[1];
      int v9 = v6;
      if ((uint64_t *)*v5 == v6) {
        goto LABEL_10;
      }
      uint64_t v10 = v5[1];
      uint64_t v11 = v6;
      if (v8)
      {
        do
        {
          int v9 = (uint64_t *)v10;
          uint64_t v10 = *(void *)(v10 + 8);
        }
        while (v10);
      }
      else
      {
        do
        {
          int v9 = (uint64_t *)v11[2];
          BOOL v12 = *v9 == (void)v11;
          uint64_t v11 = v9;
        }
        while (v12);
      }
      if (*((_DWORD *)v9 + 8) < v7)
      {
LABEL_10:
        if (v8) {
          uint64_t v13 = (uint64_t **)v9;
        }
        else {
          uint64_t v13 = (uint64_t **)v6;
        }
        if (v8) {
          uint64_t v14 = (uint64_t **)(v9 + 1);
        }
        else {
          uint64_t v14 = (uint64_t **)v6;
        }
        if (*v14) {
          goto LABEL_29;
        }
      }
      else
      {
        uint64_t v14 = (uint64_t **)v6;
        uint64_t v13 = (uint64_t **)v6;
        if (v8)
        {
          while (1)
          {
            while (1)
            {
              uint64_t v13 = (uint64_t **)v8;
              int v15 = *((_DWORD *)v8 + 8);
              if (v15 <= v7) {
                break;
              }
              int v8 = *v13;
              uint64_t v14 = v13;
              if (!*v13) {
                goto LABEL_25;
              }
            }
            if (v15 >= v7) {
              goto LABEL_29;
            }
            int v8 = v13[1];
            if (!v8)
            {
              uint64_t v14 = v13 + 1;
              break;
            }
          }
        }
      }
LABEL_25:
      uint64_t v16 = operator new(0x38uLL);
      uint64_t v17 = v4[6];
      v16[2] = *((_OWORD *)v4 + 2);
      *((void *)v16 + 6) = v17;
      *(void *)uint64_t v16 = 0;
      *((void *)v16 + 1) = 0;
      *((void *)v16 + 2) = v13;
      *uint64_t v14 = (uint64_t *)v16;
      uint64_t v18 = *(void *)*v5;
      if (v18)
      {
        *uint64_t v5 = v18;
        int v19 = *v14;
      }
      else
      {
        int v19 = (uint64_t *)v16;
      }
      __n128 result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v5[1], v19);
      ++v5[2];
LABEL_29:
      BOOL v20 = (void *)v4[1];
      if (v20)
      {
        do
        {
          std::pair<const char *, const char *> v21 = v20;
          BOOL v20 = (void *)*v20;
        }
        while (v20);
      }
      else
      {
        do
        {
          std::pair<const char *, const char *> v21 = (void *)v4[2];
          BOOL v12 = *v21 == (void)v4;
          uint64_t v4 = v21;
        }
        while (!v12);
      }
      uint64_t v4 = v21;
    }
    while (v21 != a3);
  }
  return result;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  v24[0] = 0xAAAAAAAAAAAAAAAALL;
  v24[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x223C08690](v24, a1);
  if (LOBYTE(v24[0]))
  {
    int v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      BOOL v12 = std::locale::use_facet(__b, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 32);
      std::locale::~locale(__b);
      *((_DWORD *)v6 + 36) = v9;
      uint64_t v10 = a2 + a3;
      if ((v8 & 0xB0) == 0x20) {
        uint64_t v11 = a2 + a3;
      }
      else {
        uint64_t v11 = a2;
      }
      if (!v7) {
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v10 = a2 + a3;
      if ((*((_DWORD *)v6 + 2) & 0xB0) == 0x20) {
        uint64_t v11 = a2 + a3;
      }
      else {
        uint64_t v11 = a2;
      }
      if (!v7) {
        goto LABEL_34;
      }
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    size_t v15 = v13 - a3;
    if (v14) {
      size_t v16 = 0;
    }
    else {
      size_t v16 = v15;
    }
    if (v11 - a2 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v11 - a2) == v11 - a2)
    {
      if ((uint64_t)v16 >= 1)
      {
        memset(__b, 170, sizeof(__b));
        if (v16 >= 0x7FFFFFFFFFFFFFF8) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v16 >= 0x17)
        {
          uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v16 | 7) != 0x17) {
            uint64_t v18 = v16 | 7;
          }
          uint64_t v19 = v18 + 1;
          uint64_t v17 = (std::locale::__imp *)operator new(v18 + 1);
          __b[1].__locale_ = (std::locale::__imp *)v16;
          __b[2].__locale_ = (std::locale::__imp *)(v19 | 0x8000000000000000);
          __b[0].__locale_ = v17;
        }
        else
        {
          HIBYTE(__b[2].__locale_) = v16;
          uint64_t v17 = (std::locale::__imp *)__b;
        }
        memset(v17, v9, v16);
        *((unsigned char *)v17 + v16) = 0;
        if (SHIBYTE(__b[2].__locale_) >= 0) {
          locale = __b;
        }
        else {
          locale = __b[0].__locale_;
        }
        uint64_t v21 = (*(uint64_t (**)(uint64_t, void *, size_t))(*(void *)v7 + 96))(v7, locale, v16);
        uint64_t v22 = v21;
        if (SHIBYTE(__b[2].__locale_) < 0)
        {
          operator delete(__b[0].__locale_);
          if (v22 != v16) {
            goto LABEL_34;
          }
        }
        else if (v21 != v16)
        {
          goto LABEL_34;
        }
      }
      if (v10 - v11 < 1
        || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v11, v10 - v11) == v10 - v11)
      {
        *((void *)v6 + 3) = 0;
        goto LABEL_35;
      }
    }
LABEL_34:
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
  }
LABEL_35:
  MEMORY[0x223C086A0](v24);
  return a1;
}

void sub_21D83149C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x223C086A0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21D83146CLL);
}

void sub_21D831508(_Unwind_Exception *a1)
{
}

uint64_t *GetOsLogContext(void)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AA8FCE8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AA8FCE8))
  {
    qword_26AA8FD08 = 0;
    qword_26AA8FD00 = 0;
    __cxa_atexit(MEMORY[0x263F8BDA8], &qword_26AA8FD00, &dword_21D82B000);
    __cxa_guard_release(&qword_26AA8FCE8);
  }
  if (_MergedGlobals != -1) {
    dispatch_once(&_MergedGlobals, &__block_literal_global);
  }
  return &qword_26AA8FD00;
}

void ___Z15GetOsLogContextv_block_invoke()
{
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v0, "com.apple.telephony.abm", "global");
  ctu::OsLogContext::operator=();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v0);
}

void *GetGlobalLogger(void *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AA8FCF8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AA8FCF8))
  {
    MEMORY[0x223C08520](&unk_26AA8FD10);
    __cxa_atexit(MEMORY[0x263F8BDB0], &unk_26AA8FD10, &dword_21D82B000);
    __cxa_guard_release(&qword_26AA8FCF8);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1174405120;
  v5[2] = ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v5[3] = &__block_descriptor_tmp_3;
  uint64_t v2 = (std::__shared_weak_count *)a1[1];
  v5[4] = *a1;
  int v6 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (qword_26AA8FCF0 == -1)
  {
    uint64_t v3 = v6;
    if (!v6) {
      return &unk_26AA8FD10;
    }
  }
  else
  {
    dispatch_once(&qword_26AA8FCF0, v5);
    uint64_t v3 = v6;
    if (!v6) {
      return &unk_26AA8FD10;
    }
  }
  if (atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return &unk_26AA8FD10;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return &unk_26AA8FD10;
}

void sub_21D831790(_Unwind_Exception *a1)
{
}

void ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke(uint64_t a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AA8FCE8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AA8FCE8))
  {
    qword_26AA8FD08 = 0;
    qword_26AA8FD00 = 0;
    __cxa_atexit(MEMORY[0x263F8BDA8], &qword_26AA8FD00, &dword_21D82B000);
    __cxa_guard_release(&qword_26AA8FCE8);
  }
  if (_MergedGlobals != -1) {
    dispatch_once(&_MergedGlobals, &__block_literal_global);
  }
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v5, (const ctu::OsLogContext *)&qword_26AA8FD00);
  MEMORY[0x223C08510](v6, v5, a1 + 32);
  ctu::LoggerCommonBase::operator=();
  uint64_t v3 = v7;
  uint64_t v2 = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = (std::__shared_weak_count *)qword_26AA8FD48;
  qword_26AA8FD40 = v3;
  qword_26AA8FD48 = v2;
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  MEMORY[0x223C08530](v6);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v5);
}

void sub_21D8318F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t __copy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

const char *diag::config::toString(unsigned int a1)
{
  if (a1 > 4) {
    return "Unknown";
  }
  else {
    return off_264461420[a1];
  }
}

{
  if (a1 > 2) {
    return "Unknown";
  }
  else {
    return off_264461448[a1];
  }
}

{
  if (a1 > 2) {
    return "Unknown";
  }
  else {
    return off_264461460[a1];
  }
}

const char *diag::config::toStringCompact(unsigned int a1)
{
  if (a1 > 2) {
    return "unknown";
  }
  else {
    return off_264461478[a1];
  }
}

BOOL diag::config::equal_nocase(const char *a1, const char *a2)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  return strcasecmp(a1, a2) == 0;
}

uint64_t diag::config::asEnum(uint64_t a1, _DWORD *a2)
{
  char v7 = 4;
  strcpy(v6, "none");
  if (*(char *)(a1 + 23) >= 0) {
    uint64_t v3 = (const char *)a1;
  }
  else {
    uint64_t v3 = *(const char **)a1;
  }
  if (!strcasecmp(v3, v6))
  {
    *a2 = 0;
    return 1;
  }
  else
  {
    char v7 = 5;
    strcpy(v6, "reset");
    if (!strcasecmp(v3, v6))
    {
      *a2 = 1;
      return 1;
    }
    else
    {
      char v7 = 11;
      strcpy(v6, "reconfigure");
      int v4 = strcasecmp(v3, v6);
      uint64_t result = 0;
      if (!v4)
      {
        *a2 = 2;
        return 1;
      }
    }
  }
  return result;
}

uint64_t diag::config::getShouldAlwaysFilter(diag::config *this)
{
  int IsCarrierBuild = TelephonyUtilIsCarrierBuild();
  int IsInternalBuild = TelephonyUtilIsInternalBuild();
  return (IsCarrierBuild | IsInternalBuild | TelephonyUtilIsVendorBuild()) ^ 1;
}

const char *ABMGetProjectVersion(void)
{
  return "AppleBasebandManager-AppleBasebandServices_Manager-1211";
}

uint64_t support::fs::toString@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  if (result == 1)
  {
    a2[23] = 9;
    strcpy(a2, "_wireless");
  }
  else if (result)
  {
    a2[23] = 0;
    *a2 = 0;
  }
  else
  {
    a2[23] = 6;
    strcpy(a2, "mobile");
  }
  return result;
}

uint64_t support::fs::updateOwner(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&__dst.st_blkstd::string::size_type size = v6;
  *(timespec *)__dst.st_qspare = v6;
  __dst.st_birthtimespec = v6;
  *(timespec *)&__dst.st_std::string::size_type size = v6;
  __dst.st_mtimespec = v6;
  __dst.st_ctimespec = v6;
  *(timespec *)&__dst.st_uid = v6;
  __dst.st_atimespec = v6;
  *(timespec *)&__dst.st_dev = v6;
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  if (!stat(a1, &__dst))
  {
    uint64_t v17 = v5[23] >= 0 ? v5 : *(const char **)v5;
    uint64_t v18 = opendir(v17);
    if (v18)
    {
      uint64_t v19 = v18;
      BOOL v20 = readdir(v18);
      closedir(v19);
      if (v20)
      {
        long long v61 = 0;
        long long v62 = 0;
        uint64_t v63 = 0;
        support::fs::readDir(v5, (uint64_t)&v61);
        uint64_t v21 = (char *)v61;
        long long v57 = v62;
        if (v61 == v62)
        {
          uint64_t updated = 0;
          if (v61) {
            goto LABEL_105;
          }
          return updated;
        }
        uint64_t v22 = (const std::string::value_type **)((char *)v61 + 24);
        while (1)
        {
          memset(&v60, 170, sizeof(v60));
          if (*((char *)v22 - 1) < 0)
          {
            std::string::__init_copy_ctor_external(&v60, *(v22 - 3), (std::string::size_type)*(v22 - 2));
          }
          else
          {
            long long v24 = *(_OWORD *)(v22 - 3);
            v60.__r_.__value_.__r.__words[2] = (std::string::size_type)*(v22 - 1);
            *(_OWORD *)&v60.__r_.__value_.__l.__data_ = v24;
          }
          memset(&__p, 170, sizeof(__p));
          int v25 = v5[23];
          if (v25 >= 0) {
            size_t v26 = *((unsigned __int8 *)v5 + 23);
          }
          else {
            size_t v26 = *((void *)v5 + 1);
          }
          unint64_t v27 = v26 + 1;
          memset(&__dst, 170, 24);
          if (v26 + 1 > 0x7FFFFFFFFFFFFFF7) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          if (v27 >= 0x17)
          {
            uint64_t v29 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v27 | 7) != 0x17) {
              uint64_t v29 = v27 | 7;
            }
            uint64_t v30 = v29 + 1;
            p_dst = (char *)operator new(v29 + 1);
            __dst.st_ino = v26 + 1;
            *(void *)&__dst.st_uid = v30 | 0x8000000000000000;
            *(void *)&__dst.st_dev = p_dst;
          }
          else
          {
            memset(&__dst, 0, 24);
            p_dst = (char *)&__dst;
            HIBYTE(__dst.st_gid) = v26 + 1;
            if (!v26) {
              goto LABEL_47;
            }
          }
          if (v25 >= 0) {
            size_t v31 = v5;
          }
          else {
            size_t v31 = *(const char **)v5;
          }
          memmove(p_dst, v31, v26);
LABEL_47:
          *(_WORD *)&p_dst[v26] = 47;
          if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v32 = &v60;
          }
          else {
            uint64_t v32 = (std::string *)v60.__r_.__value_.__r.__words[0];
          }
          if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type size = HIBYTE(v60.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type size = v60.__r_.__value_.__l.__size_;
          }
          uint64_t v34 = std::string::append((std::string *)&__dst, (const std::string::value_type *)v32, size);
          long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
          __p.__r_.__value_.__r.__words[2] = v34->__r_.__value_.__r.__words[2];
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v35;
          v34->__r_.__value_.__l.__size_ = 0;
          v34->__r_.__value_.__r.__words[2] = 0;
          v34->__r_.__value_.__r.__words[0] = 0;
          if (SHIBYTE(__dst.st_gid) < 0) {
            operator delete(*(void **)&__dst.st_dev);
          }
          std::string::size_type v36 = HIBYTE(v60.__r_.__value_.__r.__words[2]);
          if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            std::string::size_type v36 = v60.__r_.__value_.__l.__size_;
          }
          if (v36 == 2)
          {
            std::vector<char>::pointer v38 = &v60;
            if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              std::vector<char>::pointer v38 = (std::string *)v60.__r_.__value_.__r.__words[0];
            }
            if (LOWORD(v38->__r_.__value_.__l.__data_) == 11822)
            {
LABEL_70:
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                p_p = &__p;
              }
              else {
                p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
              }
              size_t v42 = strlen((const char *)p_p);
              if (v42 > 0x7FFFFFFFFFFFFFF7) {
                std::string::__throw_length_error[abi:ne180100]();
              }
              __darwin_ino64_t v43 = v42;
              if (v42 >= 0x17)
              {
                uint64_t v45 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v42 | 7) != 0x17) {
                  uint64_t v45 = v42 | 7;
                }
                uint64_t v46 = v45 + 1;
                unint64_t v44 = operator new(v45 + 1);
                __dst.st_ino = v43;
                *(void *)&__dst.st_uid = v46 | 0x8000000000000000;
                *(void *)&__dst.st_dev = v44;
              }
              else
              {
                HIBYTE(__dst.st_gid) = v42;
                unint64_t v44 = &__dst;
                if (!v42)
                {
LABEL_81:
                  v44[v43] = 0;
                  int st_gid_high = SHIBYTE(__dst.st_gid);
                  long long v48 = *(void **)&__dst.st_dev;
                  if ((__dst.st_gid & 0x80000000) == 0) {
                    long long v49 = &__dst;
                  }
                  else {
                    long long v49 = *(stat **)&__dst.st_dev;
                  }
                  uint64_t updated = chown((const char *)v49, a2, a3) == 0;
                  if (st_gid_high < 0)
                  {
                    BOOL v50 = v48;
LABEL_86:
                    operator delete(v50);
                    goto LABEL_87;
                  }
                  goto LABEL_87;
                }
              }
              memmove(v44, p_p, v43);
              goto LABEL_81;
            }
          }
          else if (v36 == 1)
          {
            uint64_t v37 = &v60;
            if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              uint64_t v37 = (std::string *)v60.__r_.__value_.__r.__words[0];
            }
            if (v37->__r_.__value_.__s.__data_[0] == 46) {
              goto LABEL_70;
            }
          }
          v39.tv_sec = 0xAAAAAAAAAAAAAAAALL;
          v39.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
          *(timespec *)&__dst.st_blkstd::string::size_type size = v39;
          *(timespec *)__dst.st_qspare = v39;
          __dst.st_birthtimespec = v39;
          *(timespec *)&__dst.st_std::string::size_type size = v39;
          __dst.st_mtimespec = v39;
          __dst.st_ctimespec = v39;
          *(timespec *)&__dst.st_uid = v39;
          __dst.st_atimespec = v39;
          *(timespec *)&__dst.st_dev = v39;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            char v40 = &__p;
          }
          else {
            char v40 = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          if (stat((const char *)v40, &__dst)) {
            goto LABEL_70;
          }
          long long v51 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
              ? &__p
              : (std::string *)__p.__r_.__value_.__r.__words[0];
          unint64_t v52 = opendir((const char *)v51);
          uint64_t v53 = v52;
          if (!v52) {
            goto LABEL_70;
          }
          long long v54 = readdir(v52);
          closedir(v53);
          if (!v54) {
            goto LABEL_70;
          }
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            std::string::__init_copy_ctor_external(&v58, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          }
          else {
            std::string v58 = __p;
          }
          uint64_t updated = support::fs::updateOwner(&v58, a2, a3);
          if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
          {
            BOOL v50 = (void *)v58.__r_.__value_.__r.__words[0];
            goto LABEL_86;
          }
LABEL_87:
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(__p.__r_.__value_.__l.__data_);
            if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
LABEL_91:
            }
              operator delete(v60.__r_.__value_.__l.__data_);
          }
          else if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
          {
            goto LABEL_91;
          }
          if (v22 == (const std::string::value_type **)v57) {
            char v23 = 0;
          }
          else {
            char v23 = updated;
          }
          v22 += 3;
          if ((v23 & 1) == 0)
          {
            uint64_t v21 = (char *)v61;
            if (!v61) {
              return updated;
            }
LABEL_105:
            long long v55 = (void **)v62;
            size_t v16 = v21;
            if (v62 != v21)
            {
              do
              {
                if (*((char *)v55 - 1) < 0) {
                  operator delete(*(v55 - 3));
                }
                v55 -= 3;
              }
              while (v55 != (void **)v21);
              size_t v16 = v61;
            }
            long long v62 = v21;
LABEL_112:
            operator delete(v16);
            return updated;
          }
        }
      }
    }
  }
  if (v5[23] < 0) {
    uint64_t v5 = *(const char **)v5;
  }
  size_t v7 = strlen(v5);
  if (v7 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  __darwin_ino64_t v8 = v7;
  if (v7 >= 0x17)
  {
    uint64_t v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v10 = v7 | 7;
    }
    uint64_t v11 = v10 + 1;
    int v9 = operator new(v10 + 1);
    __dst.st_ino = v8;
    *(void *)&__dst.st_uid = v11 | 0x8000000000000000;
    *(void *)&__dst.st_dev = v9;
    goto LABEL_13;
  }
  HIBYTE(__dst.st_gid) = v7;
  int v9 = &__dst;
  if (v7) {
LABEL_13:
  }
    memmove(v9, v5, v8);
  *((unsigned char *)v9 + v8) = 0;
  int v12 = SHIBYTE(__dst.st_gid);
  uint64_t v13 = *(void **)&__dst.st_dev;
  if ((__dst.st_gid & 0x80000000) == 0) {
    BOOL v14 = &__dst;
  }
  else {
    BOOL v14 = *(stat **)&__dst.st_dev;
  }
  uint64_t updated = chown((const char *)v14, a2, a3) == 0;
  if (v12 < 0)
  {
    size_t v16 = v13;
    goto LABEL_112;
  }
  return updated;
}

void sub_21D83219C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31)
{
}

void sub_21D8321CC()
{
}

DIR *support::fs::isDir(const char *a1)
{
  uint64_t v1 = a1;
  v2.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v2.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v7.st_blkstd::string::size_type size = v2;
  *(timespec *)v7.st_qspare = v2;
  v7.st_birthtimespec = v2;
  *(timespec *)&v7.st_std::string::size_type size = v2;
  v7.st_mtimespec = v2;
  v7.st_ctimespec = v2;
  *(timespec *)&v7.st_uid = v2;
  v7.st_atimespec = v2;
  *(timespec *)&v7.st_dev = v2;
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  if (stat(a1, &v7)) {
    return 0;
  }
  if (v1[23] >= 0) {
    int v4 = v1;
  }
  else {
    int v4 = *(const char **)v1;
  }
  uint64_t result = opendir(v4);
  if (result)
  {
    uint64_t v5 = result;
    timespec v6 = readdir(result);
    closedir(v5);
    return (DIR *)(v6 != 0);
  }
  return result;
}

BOOL support::fs::chown(const char *a1, uid_t a2, gid_t a3)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  return chown(a1, a2, a3) == 0;
}

DIR *support::fs::readDir(const char *a1, uint64_t a2)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  uint64_t result = opendir(a1);
  if (result)
  {
    int v4 = result;
    uint64_t v5 = readdir(result);
    if (v5)
    {
      timespec v6 = v5;
      do
      {
        memset(__dst, 170, sizeof(__dst));
        size_t d_namlen = v6->d_namlen;
        if (d_namlen >= 0x17)
        {
          if ((d_namlen | 7) == 0x17) {
            uint64_t v11 = ((unsigned __int16)d_namlen & 0xFFF8) + 8;
          }
          else {
            uint64_t v11 = d_namlen | 7;
          }
          __darwin_ino64_t v8 = operator new(v11 + 1);
          *(void *)&__dst[8] = d_namlen;
          *(void *)&__dst[16] = v11 - 0x7FFFFFFFFFFFFFFFLL;
          *(void *)stat __dst = v8;
        }
        else
        {
          __dst[23] = v6->d_namlen;
          __darwin_ino64_t v8 = __dst;
          if (!d_namlen)
          {
            __dst[d_namlen] = 0;
            int v9 = *(std::string **)(a2 + 8);
            if ((unint64_t)v9 < *(void *)(a2 + 16)) {
              goto LABEL_10;
            }
            goto LABEL_17;
          }
        }
        memmove(v8, v6->d_name, d_namlen);
        v8[d_namlen] = 0;
        int v9 = *(std::string **)(a2 + 8);
        if ((unint64_t)v9 < *(void *)(a2 + 16))
        {
LABEL_10:
          char v10 = __dst[23];
          if ((__dst[23] & 0x80000000) != 0)
          {
            std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)__dst, *(std::string::size_type *)&__dst[8]);
          }
          else
          {
            *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)__dst;
            v9->__r_.__value_.__r.__words[2] = *(void *)&__dst[16];
          }
          *(void *)(a2 + 8) = v9 + 1;
          *(void *)(a2 + 8) = v9 + 1;
          if ((v10 & 0x80) == 0) {
            goto LABEL_6;
          }
LABEL_21:
          operator delete(*(void **)__dst);
          goto LABEL_6;
        }
LABEL_17:
        int v12 = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)a2, (uint64_t)__dst);
        char v13 = __dst[23];
        *(void *)(a2 + 8) = v12;
        if (v13 < 0) {
          goto LABEL_21;
        }
LABEL_6:
        timespec v6 = readdir(v4);
      }
      while (v6);
    }
    return (DIR *)closedir(v4);
  }
  return result;
}

void sub_21D832490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  *(void *)(v15 + 8) = v16;
  operator delete(__p);
  _Unwind_Resume(a1);
}

void **std::vector<std::string>::~vector[abi:ne180100](void **a1)
{
  timespec v2 = (void **)*a1;
  if (*a1)
  {
    uint64_t v3 = (void **)a1[1];
    int v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*(v3 - 3));
        }
        v3 -= 3;
      }
      while (v3 != v2);
      int v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

uint64_t support::fs::getUidGid(int a1, uid_t *a2, gid_t *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(__p, 170, sizeof(__p));
  if (a1 == 1)
  {
    HIBYTE(__p[2]) = 9;
    strcpy((char *)__p, "_wireless");
    uint64_t v5 = getpwnam((const char *)__p);
    if (v5) {
      goto LABEL_4;
    }
LABEL_6:
    stat v7 = GetOsLogContext()[1];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      char v10 = __p;
      _os_log_error_impl(&dword_21D82B000, v7, OS_LOG_TYPE_ERROR, "Getting uid and gid: failed to get passwd for %s", buf, 0xCu);
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
    }
    return 0;
  }
  if (!a1)
  {
    HIBYTE(__p[2]) = 6;
    strcpy((char *)__p, "mobile");
    uint64_t v5 = getpwnam((const char *)__p);
    if (v5)
    {
LABEL_4:
      *a2 = v5->pw_uid;
      *a3 = v5->pw_gid;
      return 1;
    }
    goto LABEL_6;
  }
  return 0;
}

BOOL support::fs::writeToCompletion(support::fs *this, char *__buf, size_t __nbyte)
{
  int v4 = (int)this;
  do
  {
    size_t v5 = __nbyte;
    if (!__nbyte) {
      break;
    }
    ssize_t v6 = write(v4, __buf, __nbyte);
    __nbyte = v5 - v6;
    __buf += v6;
  }
  while ((v6 & 0x8000000000000000) == 0);
  return v5 == 0;
}

BOOL support::fs::writeToCompletion(FILE *__stream, __sFILE *__ptr, size_t __nitems)
{
  while (1)
  {
    size_t v5 = __nitems;
    if (!__nitems) {
      break;
    }
    size_t v6 = fwrite(__ptr, 1uLL, __nitems, __stream);
    __nitems = v5 - v6;
    __ptr = (__sFILE *)((char *)__ptr + v6);
    if (!v6) {
      return v5 == 0;
    }
  }
  fflush(__stream);
  return 1;
}

uint64_t support::fs::openFile(const char *a1, int a2, unsigned int a3)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  return open(a1, a2, a3);
}

BOOL support::fs::closeFile(support::fs *this)
{
  int v1 = (int)this;
  do
    int v2 = close(v1);
  while (v2 && *__error() == 4);
  return v2 == 0;
}

BOOL support::fs::copyFile(const char *a1, const char *a2, int a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (a1[23] >= 0) {
    size_t v6 = a1;
  }
  else {
    size_t v6 = *(const char **)a1;
  }
  size_t v7 = strlen(v6);
  if (v7 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v8 = v7;
  if (v7 >= 0x17)
  {
    uint64_t v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v10 = v7 | 7;
    }
    uint64_t v11 = v10 + 1;
    int v9 = operator new(v10 + 1);
    *(void *)&__dst[8] = v8;
    *(void *)&__dst[16] = v11 | 0x8000000000000000;
    *(void *)stat __dst = v9;
    goto LABEL_11;
  }
  __dst[23] = v7;
  int v9 = __dst;
  if (v7) {
LABEL_11:
  }
    memmove(v9, v6, v8);
  v9[v8] = 0;
  if (__dst[23] >= 0) {
    int v12 = __dst;
  }
  else {
    int v12 = *(const char **)__dst;
  }
  int v13 = open(v12, 0, 420);
  int v14 = v13;
  if ((__dst[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)__dst);
    if ((v14 & 0x80000000) == 0)
    {
LABEL_17:
      if (a2[23] >= 0) {
        uint64_t v15 = a2;
      }
      else {
        uint64_t v15 = *(const char **)a2;
      }
      size_t v16 = strlen(v15);
      if (v16 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      size_t v17 = v16;
      if (v16 >= 0x17)
      {
        uint64_t v21 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17) {
          uint64_t v21 = v16 | 7;
        }
        uint64_t v22 = v21 + 1;
        uint64_t v18 = operator new(v21 + 1);
        *(void *)&__dst[8] = v17;
        *(void *)&__dst[16] = v22 | 0x8000000000000000;
        *(void *)stat __dst = v18;
      }
      else
      {
        __dst[23] = v16;
        uint64_t v18 = __dst;
        if (!v16)
        {
LABEL_31:
          v18[v17] = 0;
          if (__dst[23] >= 0) {
            char v23 = __dst;
          }
          else {
            char v23 = *(const char **)__dst;
          }
          int v24 = open(v23, 1541, 420);
          int v25 = v24;
          if ((__dst[23] & 0x80000000) != 0)
          {
            operator delete(*(void **)__dst);
            if ((v25 & 0x80000000) == 0) {
              goto LABEL_36;
            }
          }
          else if ((v24 & 0x80000000) == 0)
          {
LABEL_36:
            memset(__dst, 170, sizeof(__dst));
            ssize_t v26 = read(v14, __dst, 0x400uLL);
            if (v26 < 1)
            {
LABEL_42:
              BOOL v20 = v26 == 0;
              if (!v26 && a3)
              {
                *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
                *(_OWORD *)&__dst[112] = v29;
                *(_OWORD *)&__dst[128] = v29;
                *(_OWORD *)&__dst[80] = v29;
                *(_OWORD *)&__dst[96] = v29;
                *(_OWORD *)&__dst[48] = v29;
                *(_OWORD *)&__dst[64] = v29;
                *(_OWORD *)&__dst[16] = v29;
                *(_OWORD *)&__dst[32] = v29;
                *(_OWORD *)stat __dst = v29;
                if (fstat(v14, (stat *)__dst)) {
                  BOOL v20 = 0;
                }
                else {
                  BOOL v20 = fchmod(v25, *(mode_t *)&__dst[4]) == 0;
                }
              }
            }
            else
            {
              unint64_t v27 = __dst;
              do
              {
                while (!v26)
                {
                  memset(__dst, 170, sizeof(__dst));
                  ssize_t v26 = read(v14, __dst, 0x400uLL);
                  unint64_t v27 = __dst;
                  if (v26 <= 0) {
                    goto LABEL_42;
                  }
                }
                ssize_t v28 = write(v25, v27, v26);
                v26 -= v28;
                v27 += v28;
              }
              while ((v28 & 0x8000000000000000) == 0);
              BOOL v20 = 0;
            }
            while (close(v25) && *__error() == 4)
              ;
            goto LABEL_52;
          }
          uint64_t v30 = GetOsLogContext()[1];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            if (a2[23] >= 0) {
              uint64_t v33 = a2;
            }
            else {
              uint64_t v33 = *(const char **)a2;
            }
            *(_DWORD *)stat __dst = 136315138;
            *(void *)&__dst[4] = v33;
            _os_log_error_impl(&dword_21D82B000, v30, OS_LOG_TYPE_ERROR, "Failed to open the destination file(%s)", __dst, 0xCu);
          }
          BOOL v20 = 0;
LABEL_52:
          while (close(v14) && *__error() == 4)
            ;
          return v20;
        }
      }
      memmove(v18, v15, v17);
      goto LABEL_31;
    }
  }
  else if ((v13 & 0x80000000) == 0)
  {
    goto LABEL_17;
  }
  uint64_t v19 = GetOsLogContext()[1];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    if (a1[23] >= 0) {
      uint64_t v32 = a1;
    }
    else {
      uint64_t v32 = *(const char **)a1;
    }
    *(_DWORD *)stat __dst = 136315138;
    *(void *)&__dst[4] = v32;
    _os_log_error_impl(&dword_21D82B000, v19, OS_LOG_TYPE_ERROR, "Failed to open the source file(%s)", __dst, 0xCu);
  }
  return 0;
}

void sub_21D832BD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

BOOL support::fs::loadFile(uint64_t a1, uint64_t a2)
{
  __b[89] = *MEMORY[0x263EF8340];
  memset(__b, 170, 0x240uLL);
  std::ifstream::basic_ifstream(__b);
  if (!__b[17]
    || (std::istream::tellg(), std::istream::seekg(), std::istream::tellg(), unint64_t v3 = __b[88], std::istream::seekg(), !v3)
    || *(_DWORD *)((char *)&__b[4] + *(void *)(__b[0] - 24)))
  {
    BOOL v4 = 0;
    goto LABEL_5;
  }
  size_t v7 = *(char **)a2;
  size_t v6 = *(char **)(a2 + 8);
  unint64_t v8 = (unint64_t)&v6[-*(void *)a2];
  unint64_t v9 = v3 - v8;
  if (v3 <= v8)
  {
    if (v3 < v8) {
      *(void *)(a2 + 8) = &v7[v3];
    }
    goto LABEL_36;
  }
  uint64_t v10 = *(void *)(a2 + 16);
  if (v10 - (uint64_t)v6 < v9)
  {
    if ((v3 & 0x8000000000000000) != 0) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = v10 - (void)v7;
    uint64_t v12 = 2 * v11;
    if (2 * v11 <= v3) {
      uint64_t v12 = v3;
    }
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v13 = v12;
    }
    int v14 = (char *)operator new(v13);
    uint64_t v15 = &v14[v8];
    size_t v16 = &v14[v13];
    bzero(&v14[v8], v3 - v8);
    if (v6 == v7) {
      goto LABEL_34;
    }
    if (v8 >= 8 && (unint64_t)(v7 - v14) >= 0x20)
    {
      if (v8 < 0x20)
      {
        unint64_t v17 = 0;
        goto LABEL_26;
      }
      unint64_t v17 = v8 & 0xFFFFFFFFFFFFFFE0;
      uint64_t v18 = v6 - 16;
      uint64_t v19 = &v14[v6 - 16 - v7];
      unint64_t v20 = v8 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        long long v21 = *(_OWORD *)v18;
        *((_OWORD *)v19 - 1) = *((_OWORD *)v18 - 1);
        *(_OWORD *)uint64_t v19 = v21;
        v19 -= 32;
        v18 -= 32;
        v20 -= 32;
      }
      while (v20);
      if (v8 == v17) {
        goto LABEL_33;
      }
      if ((v8 & 0x18) != 0)
      {
LABEL_26:
        v15 -= v8 & 0xFFFFFFFFFFFFFFF8;
        uint64_t v22 = &v6[-v17 - 8];
        char v23 = (char *)(v22 - v7);
        unint64_t v24 = v17 - (v8 & 0xFFFFFFFFFFFFFFF8);
        do
        {
          uint64_t v25 = *(void *)v22;
          v22 -= 8;
          *(void *)&v23[(void)v14] = v25;
          v23 -= 8;
          v24 += 8;
        }
        while (v24);
        v6 -= v8 & 0xFFFFFFFFFFFFFFF8;
        if (v8 == (v8 & 0xFFFFFFFFFFFFFFF8)) {
          goto LABEL_33;
        }
        goto LABEL_31;
      }
      v15 -= v17;
      v6 -= v17;
    }
LABEL_31:
    ssize_t v26 = v15 - 1;
    do
    {
      char v27 = *--v6;
      *v26-- = v27;
    }
    while (v6 != v7);
LABEL_33:
    size_t v6 = v7;
    uint64_t v15 = v14;
LABEL_34:
    *(void *)a2 = v15;
    *(void *)(a2 + 8) = &v14[v3];
    *(void *)(a2 + 16) = v16;
    if (v6) {
      operator delete(v6);
    }
    goto LABEL_36;
  }
  bzero(*(void **)(a2 + 8), v3 - v8);
  *(void *)(a2 + 8) = &v6[v9];
LABEL_36:
  std::istream::read();
  BOOL v4 = __b[1] == (int)v3;
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)((char *)__b + *(void *)(__b[0] - 24)), *(_DWORD *)((char *)&__b[4] + *(void *)(__b[0] - 24)) | 4);
  }
LABEL_5:
  __b[0] = *MEMORY[0x263F8C2A8];
  *(uint64_t *)((char *)__b + *(void *)(__b[0] - 24)) = *(void *)(MEMORY[0x263F8C2A8] + 24);
  MEMORY[0x223C08620](&__b[2]);
  std::istream::~istream();
  MEMORY[0x223C087A0](&__b[53]);
  return v4;
}

void sub_21D832F98(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::ifstream::~ifstream((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *std::ifstream::basic_ifstream(uint64_t *a1)
{
  uint64_t v2 = MEMORY[0x263F8C308] + 64;
  a1[53] = MEMORY[0x263F8C308] + 64;
  unint64_t v3 = a1 + 2;
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2A8] + 16);
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2A8] + 8);
  *a1 = v5;
  *(uint64_t *)((char *)a1 + *(void *)(v5 - 24)) = v4;
  a1[1] = 0;
  size_t v6 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v6, a1 + 2);
  uint64_t v7 = MEMORY[0x263F8C308] + 24;
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *a1 = v7;
  a1[53] = v2;
  MEMORY[0x223C08610](v3);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 4);
  }
  return a1;
}

void sub_21D833144(_Unwind_Exception *a1)
{
  std::istream::~istream();
  MEMORY[0x223C087A0](v1);
  _Unwind_Resume(a1);
}

BOOL support::fs::getFileSize(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 136);
  if (v2)
  {
    std::istream::tellg();
    std::istream::seekg();
    std::istream::tellg();
    *a2 = v5;
    std::istream::seekg();
  }
  return v2 != 0;
}

{
  uint64_t v2;
  BOOL v4;
  uint64_t v6[90];

  v6[89] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 23);
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *(void *)(a1 + 8);
  }
  if (!v2) {
    return 0;
  }
  memset(v6, 170, 0x240uLL);
  std::ifstream::basic_ifstream(v6);
  uint64_t v4 = v6[17] != 0;
  if (v6[17])
  {
    std::istream::tellg();
    std::istream::seekg();
    std::istream::tellg();
    *a2 = v6[88];
    std::istream::seekg();
    if (!std::filebuf::close()) {
      std::ios_base::clear((std::ios_base *)((char *)v6 + *(void *)(v6[0] - 24)), *(_DWORD *)((char *)&v6[4] + *(void *)(v6[0] - 24)) | 4);
    }
  }
  v6[0] = *MEMORY[0x263F8C2A8];
  *(uint64_t *)((char *)v6 + *(void *)(v6[0] - 24)) = *(void *)(MEMORY[0x263F8C2A8] + 24);
  MEMORY[0x223C08620](&v6[2]);
  std::istream::~istream();
  MEMORY[0x223C087A0](&v6[53]);
  return v4;
}

void *std::ifstream::~ifstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2A8];
  uint64_t v3 = *MEMORY[0x263F8C2A8];
  *a1 = *MEMORY[0x263F8C2A8];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x223C08620](a1 + 2);
  std::istream::~istream();
  MEMORY[0x223C087A0](a1 + 53);
  return a1;
}

uint64_t support::fs::loadFile(const char *a1, uint64_t a2)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  uint64_t v3 = fopen(a1, "rb");
  if (v3)
  {
    uint64_t v4 = v3;
    fseek(v3, 0, 2);
    unint64_t v5 = MEMORY[0x223C089C0](v4);
    if (v5 != -1)
    {
      size_t v6 = v5;
      unint64_t v8 = *(char **)a2;
      uint64_t v7 = *(char **)(a2 + 8);
      unint64_t v9 = (unint64_t)&v7[-*(void *)a2];
      size_t v10 = v5 - v9;
      if (v5 <= v9)
      {
        if (v5 < v9) {
          *(void *)(a2 + 8) = &v8[v5];
        }
        goto LABEL_36;
      }
      uint64_t v11 = *(void *)(a2 + 16);
      if (v11 - (uint64_t)v7 >= v10)
      {
        bzero(*(void **)(a2 + 8), v10);
        *(void *)(a2 + 8) = &v7[v10];
LABEL_36:
        rewind(v4);
        uint64_t v30 = *(char **)a2;
        uint64_t v19 = 1;
        fread(v30, v6, 1uLL, v4);
        fclose(v4);
        return v19;
      }
      if ((v5 & 0x8000000000000000) != 0) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v12 = v11 - (void)v8;
      uint64_t v13 = 2 * v12;
      if (2 * v12 <= v5) {
        uint64_t v13 = v5;
      }
      if (v12 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v14 = v13;
      }
      uint64_t v15 = (char *)operator new(v14);
      size_t v16 = &v15[v9];
      unint64_t v17 = &v15[v14];
      bzero(&v15[v9], v10);
      if (v7 == v8)
      {
LABEL_34:
        *(void *)a2 = v16;
        *(void *)(a2 + 8) = &v15[v6];
        *(void *)(a2 + 16) = v17;
        if (v7) {
          operator delete(v7);
        }
        goto LABEL_36;
      }
      if (v9 >= 8 && (unint64_t)(v8 - v15) >= 0x20)
      {
        if (v9 < 0x20)
        {
          unint64_t v18 = 0;
          goto LABEL_26;
        }
        unint64_t v18 = v9 & 0xFFFFFFFFFFFFFFE0;
        unint64_t v20 = v7 - 16;
        long long v21 = &v15[v7 - 16 - v8];
        unint64_t v22 = v9 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v23 = *(_OWORD *)v20;
          *((_OWORD *)v21 - 1) = *((_OWORD *)v20 - 1);
          *(_OWORD *)long long v21 = v23;
          v21 -= 32;
          v20 -= 32;
          v22 -= 32;
        }
        while (v22);
        if (v9 == v18) {
          goto LABEL_33;
        }
        if ((v9 & 0x18) != 0)
        {
LABEL_26:
          v16 -= v9 & 0xFFFFFFFFFFFFFFF8;
          unint64_t v24 = &v7[-v18 - 8];
          uint64_t v25 = (char *)(v24 - v8);
          unint64_t v26 = v18 - (v9 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            uint64_t v27 = *(void *)v24;
            v24 -= 8;
            *(void *)&v25[(void)v15] = v27;
            v25 -= 8;
            v26 += 8;
          }
          while (v26);
          v7 -= v9 & 0xFFFFFFFFFFFFFFF8;
          if (v9 == (v9 & 0xFFFFFFFFFFFFFFF8)) {
            goto LABEL_33;
          }
          goto LABEL_31;
        }
        v16 -= v18;
        v7 -= v18;
      }
LABEL_31:
      ssize_t v28 = v16 - 1;
      do
      {
        char v29 = *--v7;
        *v28-- = v29;
      }
      while (v7 != v8);
LABEL_33:
      uint64_t v7 = v8;
      size_t v16 = v15;
      goto LABEL_34;
    }
  }
  return 0;
}

BOOL support::fs::fileExists(const char *a1)
{
  v1.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v1.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v3.st_blkstd::string::size_type size = v1;
  *(timespec *)v3.st_qspare = v1;
  v3.st_birthtimespec = v1;
  *(timespec *)&v3.st_std::string::size_type size = v1;
  v3.st_mtimespec = v1;
  v3.st_ctimespec = v1;
  *(timespec *)&v3.st_uid = v1;
  v3.st_atimespec = v1;
  *(timespec *)&v3.st_dev = v1;
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  return stat(a1, &v3) == 0;
}

void support::fs::createUniqueFilename(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v154[32] = v3;
  *(_OWORD *)v154 = v3;
  *(_OWORD *)&v154[16] = v3;
  *(_OWORD *)&v153[0].__locale_ = v3;
  MEMORY[0x223C08750](v153);
  v153[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v153, MEMORY[0x263F8C108]);
  *(void *)v154 = std::locale::use_facet(v153, MEMORY[0x263F8C130]);
  memset(&v154[8], 0, 40);
  if (std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>((uint64_t)v153, (std::basic_regex<char> *)"^([/_\\-[:alnum:]]*)(.*)", "") != "")std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>(); {
  memset(&v152, 170, sizeof(v152));
  }
  uint64_t v4 = a1;
  uint64_t v143 = a2;
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v152, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v152 = *(std::string *)a1;
  }
  unsigned int v5 = 0;
  p_tv_nsec = &v155.st_mtimespec.tv_nsec;
LABEL_6:
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v155.st_blksize_t size = v6;
  *(timespec *)v155.st_qspare = v6;
  v155.st_birthtimespec = v6;
  *(timespec *)&v155.st_size_t size = v6;
  v155.st_mtimespec = v6;
  v155.st_ctimespec = v6;
  *(timespec *)&v155.st_uid = v6;
  v155.st_atimespec = v6;
  *(timespec *)&v155.st_dev = v6;
  if ((v152.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v7 = &v152;
  }
  else {
    uint64_t v7 = (std::string *)v152.__r_.__value_.__r.__words[0];
  }
  if (stat((const char *)v7, &v155))
  {
    *(std::string *)uint64_t v143 = v152;
  }
  else
  {
    uint64_t v8 = *(unsigned __int8 *)(v4 + 23);
    if ((v8 & 0x80u) == 0) {
      unint64_t v9 = (std::sub_match<const char *> *)v4;
    }
    else {
      unint64_t v9 = *(std::sub_match<const char *> **)v4;
    }
    if ((v8 & 0x80u) != 0) {
      uint64_t v8 = *(void *)(v4 + 8);
    }
    uint64_t v10 = (uint64_t)v9 + v8;
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v162 = v11;
    unint64_t v159 = 0xAAAAAAAAAAAAAA00;
    v156[1].__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v157 = 0;
    uint64_t v158 = 0;
    uint64_t v160 = 0;
    uint64_t v161 = 0;
    LOBYTE(v162) = 0;
    BYTE8(v162) = 0;
    uint64_t v163 = 0;
    memset(v156, 0, 41);
    *(_OWORD *)&v155.st_birthtimespec.tv_nsec = v11;
    v155.st_ctimespec.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v155.st_atimespec.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    memset(&v155.st_mtimespec, 0, 17);
    memset(&v155.st_ctimespec.tv_nsec, 0, 17);
    LOBYTE(v155.st_size) = 0;
    v155.st_blocks = 0;
    memset(&v155, 0, 41);
    int v12 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v153, v9, (std::sub_match<const char *> *)((char *)v9 + v8), (std::vector<std::csub_match> *)&v155, 4160);
    std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((uint64_t)v156, (uint64_t)v9, v10, (uint64_t *)&v155.st_dev, 0);
    if (*(void *)&v155.st_dev) {
      operator delete(*(void **)&v155.st_dev);
    }
    if ((_BYTE)v162) {
      int v13 = v12 ^ 1;
    }
    else {
      int v13 = 1;
    }
    if (v156[0].__r_.__value_.__r.__words[0]) {
      operator delete(v156[0].__r_.__value_.__l.__data_);
    }
    if ((v12 & v13) != 0)
    {
      unsigned int v14 = v5 + 1;
      memset(__p, 170, 24);
      std::to_string(v156, v14);
      uint64_t v15 = std::string::insert(v156, 0, "$1-", 3uLL);
      long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      *(void *)&v155.st_uid = *((void *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)&v155.st_dev = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      unint64_t v17 = std::string::append((std::string *)&v155, "$2", 2uLL);
      long long v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
      __p[2] = (void *)v17->__r_.__value_.__r.__words[2];
      *(_OWORD *)std::string __p = v18;
      v17->__r_.__value_.__l.__size_ = 0;
      v17->__r_.__value_.__r.__words[2] = 0;
      v17->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v155.st_gid) < 0)
      {
        operator delete(*(void **)&v155.st_dev);
        if ((SHIBYTE(v156[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_25;
        }
      }
      else if ((SHIBYTE(v156[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_25:
        memset(&v150, 0, sizeof(v150));
        int v19 = *(char *)(v4 + 23);
        if (v19 >= 0) {
          unint64_t v20 = (std::sub_match<const char *> *)v4;
        }
        else {
          unint64_t v20 = *(std::sub_match<const char *> **)v4;
        }
        if (v19 >= 0) {
          uint64_t v21 = *(unsigned __int8 *)(v4 + 23);
        }
        else {
          uint64_t v21 = *(void *)(v4 + 8);
        }
        unint64_t v22 = __p;
        if (SHIBYTE(__p[2]) < 0) {
          unint64_t v22 = (void **)__p[0];
        }
        std::string __s = (char *)v22;
        *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v155.st_gen = v23;
        v155.st_size_t size = 0xAAAAAAAAAAAAAAAALL;
        v155.st_ctimespec.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
        *(&v155.st_rdev + 1) = -1431655766;
        *(void *)&v155.st_dev = v20;
        v155.st_ino = (__darwin_ino64_t)v20 + v21;
        *(void *)&v155.st_uid = v153;
        v155.dev_t st_rdev = 0;
        memset(&v155.st_birthtimespec, 0, 17);
        memset(&v155.st_blocks, 0, 17);
        LOBYTE(v155.st_qspare[0]) = 0;
        v155.st_qspare[1] = 0;
        memset(&v155.st_atimespec, 0, 41);
        long long v162 = v23;
        unint64_t v159 = 0xAAAAAAAAAAAAAA00;
        v156[1].__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v157 = 0;
        uint64_t v158 = 0;
        uint64_t v160 = 0;
        uint64_t v161 = 0;
        LOBYTE(v162) = 0;
        BYTE8(v162) = 0;
        uint64_t v163 = 0;
        memset(v156, 0, 41);
        std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v153, v20, (std::sub_match<const char *> *)((char *)v20 + v21), (std::vector<std::csub_match> *)v156, 0);
        std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((uint64_t)&v155.st_atimespec, (uint64_t)v20, (uint64_t)v20 + v21, (uint64_t *)v156, 0);
        unsigned int v145 = v14;
        if (v156[0].__r_.__value_.__r.__words[0]) {
          operator delete(v156[0].__r_.__value_.__l.__data_);
        }
        tv_nsec = (void *)v155.st_atimespec.tv_nsec;
        if (v155.st_atimespec.tv_nsec != v155.st_atimespec.tv_sec)
        {
          size_t v147 = strlen(__s);
          uint64_t v25 = (unsigned __int8 *)&__s[v147];
          while (1)
          {
            tv_sec = (char *)v155.st_birthtimespec.tv_sec;
            uint64_t v27 = v155.st_birthtimespec.tv_nsec;
            while (tv_sec != (char *)v27)
            {
              char v31 = *tv_sec;
              if ((SHIBYTE(v150.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
                if (HIBYTE(v150.__r_.__value_.__r.__words[2]) != 22)
                {
                  size_t size = HIBYTE(v150.__r_.__value_.__r.__words[2]);
                  *((unsigned char *)&v150.__r_.__value_.__s + 23) = (*((unsigned char *)&v150.__r_.__value_.__s + 23) + 1) & 0x7F;
                  char v29 = &v150;
                  goto LABEL_41;
                }
                uint64_t v32 = &v150;
                size_t size = 22;
LABEL_49:
                if (size + 1 > 2 * size) {
                  unint64_t v34 = size + 1;
                }
                else {
                  unint64_t v34 = 2 * size;
                }
                uint64_t v35 = (v34 & 0x7FFFFFFFFFFFFFF8) + 8;
                if ((v34 | 7) != 0x17) {
                  uint64_t v35 = v34 | 7;
                }
                if (v34 >= 0x17) {
                  size_t v33 = v35 + 1;
                }
                else {
                  size_t v33 = 23;
                }
LABEL_57:
                std::string::size_type v36 = (std::string *)operator new(v33);
                char v29 = v36;
                if (!size || (memmove(v36, v32, size), size != 22)) {
                  operator delete(v32);
                }
                v150.__r_.__value_.__r.__words[0] = (std::string::size_type)v29;
                v150.__r_.__value_.__r.__words[2] = v33 | 0x8000000000000000;
                goto LABEL_62;
              }
              size_t size = (v150.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
              if (v150.__r_.__value_.__l.__size_ == size)
              {
                if ((v150.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8) {
                  std::string::__throw_length_error[abi:ne180100]();
                }
                uint64_t v32 = (std::string *)v150.__r_.__value_.__r.__words[0];
                size_t v33 = 0x7FFFFFFFFFFFFFF7;
                if (size < 0x3FFFFFFFFFFFFFF3) {
                  goto LABEL_49;
                }
                goto LABEL_57;
              }
              size_t size = v150.__r_.__value_.__l.__size_;
              char v29 = (std::string *)v150.__r_.__value_.__r.__words[0];
LABEL_62:
              v150.__r_.__value_.__l.__size_ = size + 1;
LABEL_41:
              uint64_t v30 = (char *)v29 + size;
              *uint64_t v30 = v31;
              v30[1] = 0;
              ++tv_sec;
            }
            if (v147) {
              break;
            }
LABEL_201:
            st_blocks = (char *)v155.st_blocks;
            v148 = *(char **)&v155.st_blksize;
            dev_t st_rdev = v155.st_rdev;
            int v112 = v155.st_rdev | 0x800;
            v155.st_rdev |= 0x800u;
            tv_nsec = (void *)v155.st_atimespec.tv_sec;
            std::vector<std::string>::pointer v113 = p_tv_nsec;
            if (v155.st_atimespec.tv_nsec != v155.st_atimespec.tv_sec) {
              std::vector<std::string>::pointer v113 = (void *)v155.st_atimespec.tv_sec;
            }
            p_st_ctimespec = (timespec *)(v155.st_atimespec.tv_sec + 8);
            if (v155.st_atimespec.tv_nsec == v155.st_atimespec.tv_sec) {
              p_st_ctimespec = &v155.st_ctimespec;
            }
            v115 = (std::sub_match<const char *> *)p_st_ctimespec->tv_sec;
            st_ino = (std::sub_match<const char *> *)v155.st_ino;
            if (*v113 != p_st_ctimespec->tv_sec)
            {
LABEL_206:
              v155.dev_t st_rdev = v112 | 0x80;
              *(void *)&long long v117 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v117 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v162 = v117;
              unint64_t v159 = 0xAAAAAAAAAAAAAA00;
              v156[1].__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAAAALL;
              uint64_t v157 = 0;
              uint64_t v158 = 0;
              uint64_t v160 = 0;
              uint64_t v161 = 0;
              LOBYTE(v162) = 0;
              BYTE8(v162) = 0;
              uint64_t v163 = 0;
              memset(v156, 0, 41);
              char v118 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(*(uint64_t *)&v155.st_uid, v115, st_ino, (std::vector<std::csub_match> *)v156, v112 | 0x80u);
              std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((uint64_t)&v155.st_atimespec, (uint64_t)v115, (uint64_t)st_ino, (uint64_t *)v156, (v112 & 0x800) != 0);
              if (v156[0].__r_.__value_.__r.__words[0]) {
                operator delete(v156[0].__r_.__value_.__l.__data_);
              }
              tv_nsec = (void *)v155.st_atimespec.tv_sec;
              if (v118) {
                goto LABEL_38;
              }
              goto LABEL_215;
            }
            if ((std::sub_match<const char *> *)v155.st_ino == v115)
            {
LABEL_215:
              if (tv_nsec) {
                operator delete(tv_nsec);
              }
              tv_nsec = 0;
              LOBYTE(v155.st_qspare[0]) = 0;
              memset(&v155.st_atimespec, 0, 41);
              memset(&v155.st_birthtimespec, 0, 17);
              memset(&v155.st_blocks, 0, 17);
              v155.st_qspare[1] = 0;
              goto LABEL_38;
            }
            *(void *)&long long v119 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v119 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v162 = v119;
            unint64_t v159 = 0xAAAAAAAAAAAAAA00;
            v156[1].__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAAAALL;
            uint64_t v157 = 0;
            uint64_t v158 = 0;
            uint64_t v160 = 0;
            uint64_t v161 = 0;
            LOBYTE(v162) = 0;
            BYTE8(v162) = 0;
            uint64_t v163 = 0;
            memset(v156, 0, 41);
            int v120 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(*(uint64_t *)&v155.st_uid, v115, (std::sub_match<const char *> *)v155.st_ino, (std::vector<std::csub_match> *)v156, st_rdev | 0x860u);
            std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((uint64_t)&v155.st_atimespec, (uint64_t)v115, (uint64_t)st_ino, (uint64_t *)v156, 1);
            if (v156[0].__r_.__value_.__r.__words[0]) {
              operator delete(v156[0].__r_.__value_.__l.__data_);
            }
            if (!v120)
            {
              v115 = (std::sub_match<const char *> *)((char *)v115 + 1);
              int v112 = v155.st_rdev;
              st_ino = (std::sub_match<const char *> *)v155.st_ino;
              goto LABEL_206;
            }
            tv_nsec = (void *)v155.st_atimespec.tv_sec;
LABEL_38:
            if ((void *)v155.st_atimespec.tv_nsec == tv_nsec)
            {
              std::string::size_type v121 = v148;
              while (1)
              {
                if (st_blocks == v121) {
                  goto LABEL_272;
                }
                char v125 = *st_blocks;
                if ((SHIBYTE(v150.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                  break;
                }
                size_t v122 = (v150.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
                if (v150.__r_.__value_.__l.__size_ == v122)
                {
                  if ((v150.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8) {
                    std::string::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v126 = (std::string *)v150.__r_.__value_.__r.__words[0];
                  size_t v127 = 0x7FFFFFFFFFFFFFF7;
                  if (v122 < 0x3FFFFFFFFFFFFFF3) {
                    goto LABEL_228;
                  }
                  goto LABEL_236;
                }
                size_t v122 = v150.__r_.__value_.__l.__size_;
                uint64_t v123 = (std::string *)v150.__r_.__value_.__r.__words[0];
LABEL_241:
                v150.__r_.__value_.__l.__size_ = v122 + 1;
LABEL_220:
                uint64_t v124 = (char *)v123 + v122;
                *uint64_t v124 = v125;
                v124[1] = 0;
                ++st_blocks;
              }
              if (HIBYTE(v150.__r_.__value_.__r.__words[2]) != 22)
              {
                size_t v122 = HIBYTE(v150.__r_.__value_.__r.__words[2]);
                *((unsigned char *)&v150.__r_.__value_.__s + 23) = (*((unsigned char *)&v150.__r_.__value_.__s + 23) + 1) & 0x7F;
                uint64_t v123 = &v150;
                goto LABEL_220;
              }
              uint64_t v126 = &v150;
              size_t v122 = 22;
LABEL_228:
              if (v122 + 1 > 2 * v122) {
                unint64_t v128 = v122 + 1;
              }
              else {
                unint64_t v128 = 2 * v122;
              }
              uint64_t v129 = (v128 & 0x7FFFFFFFFFFFFFF8) + 8;
              if ((v128 | 7) != 0x17) {
                uint64_t v129 = v128 | 7;
              }
              if (v128 >= 0x17) {
                size_t v127 = v129 + 1;
              }
              else {
                size_t v127 = 23;
              }
LABEL_236:
              BOOL v130 = (std::string *)operator new(v127);
              uint64_t v123 = v130;
              if (!v122 || (memmove(v130, v126, v122), v122 != 22)) {
                operator delete(v126);
              }
              v150.__r_.__value_.__r.__words[0] = (std::string::size_type)v123;
              v150.__r_.__value_.__r.__words[2] = v127 | 0x8000000000000000;
              std::string::size_type v121 = v148;
              goto LABEL_241;
            }
          }
          uint64_t v37 = __s;
          while (1)
          {
            int v41 = *v37;
            if (v41 != 36) {
              goto LABEL_134;
            }
            size_t v42 = (unsigned __int8 *)(v37 + 1);
            if (v37 + 1 == (char *)v25) {
              goto LABEL_133;
            }
            int v43 = (char)*v42;
            int v41 = *v42;
            if (v43 > 38) {
              break;
            }
            if (v43 == 36)
            {
              ++v37;
              unsigned __int8 v80 = HIBYTE(v150.__r_.__value_.__r.__words[2]);
              if (SHIBYTE(v150.__r_.__value_.__r.__words[2]) < 0)
              {
LABEL_160:
                size_t v38 = (v150.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
                if (v150.__r_.__value_.__l.__size_ == v38)
                {
                  if ((v150.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8) {
LABEL_281:
                  }
                    std::string::__throw_length_error[abi:ne180100]();
                  BOOL v81 = (std::string *)v150.__r_.__value_.__r.__words[0];
                  size_t v93 = 0x7FFFFFFFFFFFFFF7;
                  if (v38 < 0x3FFFFFFFFFFFFFF3)
                  {
LABEL_163:
                    if (v38 + 1 > 2 * v38) {
                      unint64_t v94 = v38 + 1;
                    }
                    else {
                      unint64_t v94 = 2 * v38;
                    }
                    uint64_t v95 = (v94 & 0x7FFFFFFFFFFFFFF8) + 8;
                    if ((v94 | 7) != 0x17) {
                      uint64_t v95 = v94 | 7;
                    }
                    if (v94 >= 0x17) {
                      size_t v93 = v95 + 1;
                    }
                    else {
                      size_t v93 = 23;
                    }
                  }
                  int64_t v96 = (std::string *)operator new(v93);
                  timespec v39 = v96;
                  if (!v38 || (memmove(v96, v81, v38), v38 != 22)) {
                    operator delete(v81);
                  }
                  v150.__r_.__value_.__r.__words[0] = (std::string::size_type)v39;
                  v150.__r_.__value_.__r.__words[2] = v93 | 0x8000000000000000;
                }
                else
                {
                  size_t v38 = v150.__r_.__value_.__l.__size_;
                  timespec v39 = (std::string *)v150.__r_.__value_.__r.__words[0];
                }
                v150.__r_.__value_.__l.__size_ = v38 + 1;
                goto LABEL_66;
              }
LABEL_135:
              if (v80 == 22)
              {
                BOOL v81 = &v150;
                size_t v38 = 22;
                goto LABEL_163;
              }
              size_t v38 = v80;
              *((unsigned char *)&v150.__r_.__value_.__s + 23) = (v80 + 1) & 0x7F;
              timespec v39 = &v150;
LABEL_66:
              char v40 = (char *)v39 + v38;
              *char v40 = v41;
              v40[1] = 0;
              if (++v37 == (char *)v25) {
                goto LABEL_201;
              }
            }
            else
            {
              if (v43 != 38) {
                goto LABEL_122;
              }
              unint64_t v44 = *(char **)v155.st_atimespec.tv_sec;
              uint64_t v45 = *(char **)(v155.st_atimespec.tv_sec + 8);
              if (*(char **)v155.st_atimespec.tv_sec != v45)
              {
                while (1)
                {
                  while (1)
                  {
                    char v47 = *v44;
                    unsigned __int8 v48 = HIBYTE(v150.__r_.__value_.__r.__words[2]);
                    if (SHIBYTE(v150.__r_.__value_.__r.__words[2]) < 0) {
                      break;
                    }
                    if (HIBYTE(v150.__r_.__value_.__r.__words[2]) == 22)
                    {
                      long long v49 = &v150;
                      size_t v50 = 22;
                      goto LABEL_81;
                    }
                    *((unsigned char *)&v150.__r_.__value_.__s + 23) = (*((unsigned char *)&v150.__r_.__value_.__s + 23) + 1) & 0x7F;
                    uint64_t v46 = (char *)&v150 + v48;
                    char *v46 = v47;
                    v46[1] = 0;
                    if (++v44 == v45) {
                      goto LABEL_200;
                    }
                  }
                  size_t v50 = (v150.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
                  if (v150.__r_.__value_.__l.__size_ == v50) {
                    break;
                  }
                  size_t v50 = v150.__r_.__value_.__l.__size_;
                  std::string::size_type v55 = v150.__r_.__value_.__r.__words[0];
LABEL_94:
                  v150.__r_.__value_.__l.__size_ = v50 + 1;
                  long long v56 = (char *)(v55 + v50);
                  *long long v56 = v47;
                  v56[1] = 0;
                  if (++v44 == v45) {
                    goto LABEL_200;
                  }
                }
                if ((v150.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8) {
                  goto LABEL_281;
                }
                long long v49 = (std::string *)v150.__r_.__value_.__r.__words[0];
                size_t v51 = 0x7FFFFFFFFFFFFFF7;
                if (v50 < 0x3FFFFFFFFFFFFFF3)
                {
LABEL_81:
                  if (v50 + 1 > 2 * v50) {
                    unint64_t v52 = v50 + 1;
                  }
                  else {
                    unint64_t v52 = 2 * v50;
                  }
                  uint64_t v53 = (v52 & 0x7FFFFFFFFFFFFFF8) + 8;
                  if ((v52 | 7) != 0x17) {
                    uint64_t v53 = v52 | 7;
                  }
                  if (v52 >= 0x17) {
                    size_t v51 = v53 + 1;
                  }
                  else {
                    size_t v51 = 23;
                  }
                }
                long long v54 = operator new(v51);
                std::string::size_type v55 = (std::string::size_type)v54;
                if (!v50 || (memmove(v54, v49, v50), v50 != 22)) {
                  operator delete(v49);
                }
                v150.__r_.__value_.__r.__words[0] = v55;
                v150.__r_.__value_.__r.__words[2] = v51 | 0x8000000000000000;
                goto LABEL_94;
              }
LABEL_200:
              uint64_t v37 = (char *)(v42 + 1);
              if (v42 + 1 == v25) {
                goto LABEL_201;
              }
            }
          }
          if (v43 == 39)
          {
            unint64_t v97 = (char *)v155.st_blocks;
            size_t v98 = *(char **)&v155.st_blksize;
            if (v155.st_blocks == *(void *)&v155.st_blksize) {
              goto LABEL_200;
            }
            while (2)
            {
              while (2)
              {
                char v100 = *v97;
                unsigned __int8 v101 = HIBYTE(v150.__r_.__value_.__r.__words[2]);
                if (SHIBYTE(v150.__r_.__value_.__r.__words[2]) < 0)
                {
                  size_t v103 = (v150.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
                  if (v150.__r_.__value_.__l.__size_ == v103)
                  {
                    if ((v150.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8) {
                      goto LABEL_281;
                    }
                    BOOL v102 = (std::string *)v150.__r_.__value_.__r.__words[0];
                    size_t v104 = 0x7FFFFFFFFFFFFFF7;
                    if (v103 < 0x3FFFFFFFFFFFFFF3) {
                      goto LABEL_186;
                    }
                    goto LABEL_194;
                  }
                  size_t v103 = v150.__r_.__value_.__l.__size_;
                  std::string::size_type v108 = v150.__r_.__value_.__r.__words[0];
                }
                else
                {
                  if (HIBYTE(v150.__r_.__value_.__r.__words[2]) != 22)
                  {
                    *((unsigned char *)&v150.__r_.__value_.__s + 23) = (*((unsigned char *)&v150.__r_.__value_.__s + 23) + 1) & 0x7F;
                    std::string::size_type v99 = (char *)&v150 + v101;
                    *std::string::size_type v99 = v100;
                    v99[1] = 0;
                    if (++v97 == v98) {
                      goto LABEL_200;
                    }
                    continue;
                  }
                  BOOL v102 = &v150;
                  size_t v103 = 22;
LABEL_186:
                  if (v103 + 1 > 2 * v103) {
                    unint64_t v105 = v103 + 1;
                  }
                  else {
                    unint64_t v105 = 2 * v103;
                  }
                  uint64_t v106 = (v105 & 0x7FFFFFFFFFFFFFF8) + 8;
                  if ((v105 | 7) != 0x17) {
                    uint64_t v106 = v105 | 7;
                  }
                  if (v105 >= 0x17) {
                    size_t v104 = v106 + 1;
                  }
                  else {
                    size_t v104 = 23;
                  }
LABEL_194:
                  uint64_t v107 = operator new(v104);
                  std::string::size_type v108 = (std::string::size_type)v107;
                  if (!v103 || (memmove(v107, v102, v103), v103 != 22)) {
                    operator delete(v102);
                  }
                  v150.__r_.__value_.__r.__words[0] = v108;
                  v150.__r_.__value_.__r.__words[2] = v104 | 0x8000000000000000;
                }
                break;
              }
              v150.__r_.__value_.__l.__size_ = v103 + 1;
              v109 = (char *)(v108 + v103);
              char *v109 = v100;
              v109[1] = 0;
              if (++v97 == v98) {
                goto LABEL_200;
              }
              continue;
            }
          }
          if (v43 == 96)
          {
            long long v57 = (char *)v155.st_birthtimespec.tv_sec;
            uint64_t v58 = v155.st_birthtimespec.tv_nsec;
            if (v155.st_birthtimespec.tv_sec == v155.st_birthtimespec.tv_nsec) {
              goto LABEL_200;
            }
            while (2)
            {
              while (2)
              {
                char v60 = *v57;
                unsigned __int8 v61 = HIBYTE(v150.__r_.__value_.__r.__words[2]);
                if (SHIBYTE(v150.__r_.__value_.__r.__words[2]) < 0)
                {
                  size_t v63 = (v150.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
                  if (v150.__r_.__value_.__l.__size_ == v63)
                  {
                    if ((v150.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8) {
                      goto LABEL_281;
                    }
                    long long v62 = (std::string *)v150.__r_.__value_.__r.__words[0];
                    size_t v64 = 0x7FFFFFFFFFFFFFF7;
                    if (v63 < 0x3FFFFFFFFFFFFFF3) {
                      goto LABEL_107;
                    }
                    goto LABEL_115;
                  }
                  size_t v63 = v150.__r_.__value_.__l.__size_;
                  std::string::size_type v68 = v150.__r_.__value_.__r.__words[0];
                }
                else
                {
                  if (HIBYTE(v150.__r_.__value_.__r.__words[2]) != 22)
                  {
                    *((unsigned char *)&v150.__r_.__value_.__s + 23) = (*((unsigned char *)&v150.__r_.__value_.__s + 23) + 1) & 0x7F;
                    long long v59 = (char *)&v150 + v61;
                    *long long v59 = v60;
                    v59[1] = 0;
                    if (++v57 == (char *)v58) {
                      goto LABEL_200;
                    }
                    continue;
                  }
                  long long v62 = &v150;
                  size_t v63 = 22;
LABEL_107:
                  if (v63 + 1 > 2 * v63) {
                    unint64_t v65 = v63 + 1;
                  }
                  else {
                    unint64_t v65 = 2 * v63;
                  }
                  uint64_t v66 = (v65 & 0x7FFFFFFFFFFFFFF8) + 8;
                  if ((v65 | 7) != 0x17) {
                    uint64_t v66 = v65 | 7;
                  }
                  if (v65 >= 0x17) {
                    size_t v64 = v66 + 1;
                  }
                  else {
                    size_t v64 = 23;
                  }
LABEL_115:
                  long long v67 = operator new(v64);
                  std::string::size_type v68 = (std::string::size_type)v67;
                  if (!v63 || (memmove(v67, v62, v63), v63 != 22)) {
                    operator delete(v62);
                  }
                  v150.__r_.__value_.__r.__words[0] = v68;
                  v150.__r_.__value_.__r.__words[2] = v64 | 0x8000000000000000;
                }
                break;
              }
              v150.__r_.__value_.__l.__size_ = v63 + 1;
              size_t v69 = (char *)(v68 + v63);
              *size_t v69 = v60;
              v69[1] = 0;
              if (++v57 == (char *)v58) {
                goto LABEL_200;
              }
              continue;
            }
          }
LABEL_122:
          if ((v41 - 48) <= 9)
          {
            unint64_t v70 = *v42 - 48;
            if (v37 + 2 != (char *)v25)
            {
              uint64_t v71 = v37[2];
              unsigned int v72 = v71 - 48;
              uint64_t v73 = v71 + 10 * (int)v70 - 48;
              if (v72 > 9)
              {
                size_t v42 = (unsigned __int8 *)(v37 + 1);
              }
              else
              {
                unint64_t v70 = v73;
                size_t v42 = (unsigned __int8 *)(v37 + 2);
              }
            }
            __darwin_time_t v74 = v155.st_atimespec.tv_sec + 24 * (int)v70;
            BOOL v75 = 0xAAAAAAAAAAAAAAABLL * ((v155.st_atimespec.tv_nsec - v155.st_atimespec.tv_sec) >> 3) > v70;
            unint64_t v76 = (char **)p_tv_nsec;
            if (v75) {
              unint64_t v76 = (char **)v74;
            }
            v77 = *v76;
            size_t v78 = (timespec *)(v74 + 8);
            if (!v75) {
              size_t v78 = &v155.st_ctimespec;
            }
            std::string::size_type v79 = (char *)v78->tv_sec;
            if (v77 == (char *)v78->tv_sec) {
              goto LABEL_200;
            }
            while (2)
            {
              while (2)
              {
                char v83 = *v77;
                unsigned __int8 v84 = HIBYTE(v150.__r_.__value_.__r.__words[2]);
                if (SHIBYTE(v150.__r_.__value_.__r.__words[2]) < 0)
                {
                  size_t v86 = (v150.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
                  if (v150.__r_.__value_.__l.__size_ == v86)
                  {
                    if ((v150.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8) {
                      goto LABEL_281;
                    }
                    v85 = (std::string *)v150.__r_.__value_.__r.__words[0];
                    size_t v87 = 0x7FFFFFFFFFFFFFF7;
                    if (v86 < 0x3FFFFFFFFFFFFFF3) {
                      goto LABEL_144;
                    }
                    goto LABEL_152;
                  }
                  size_t v86 = v150.__r_.__value_.__l.__size_;
                  std::string::size_type v91 = v150.__r_.__value_.__r.__words[0];
                }
                else
                {
                  if (HIBYTE(v150.__r_.__value_.__r.__words[2]) != 22)
                  {
                    *((unsigned char *)&v150.__r_.__value_.__s + 23) = (*((unsigned char *)&v150.__r_.__value_.__s + 23) + 1) & 0x7F;
                    v82 = (char *)&v150 + v84;
                    char *v82 = v83;
                    v82[1] = 0;
                    if (++v77 == v79) {
                      goto LABEL_200;
                    }
                    continue;
                  }
                  v85 = &v150;
                  size_t v86 = 22;
LABEL_144:
                  if (v86 + 1 > 2 * v86) {
                    unint64_t v88 = v86 + 1;
                  }
                  else {
                    unint64_t v88 = 2 * v86;
                  }
                  uint64_t v89 = (v88 & 0x7FFFFFFFFFFFFFF8) + 8;
                  if ((v88 | 7) != 0x17) {
                    uint64_t v89 = v88 | 7;
                  }
                  if (v88 >= 0x17) {
                    size_t v87 = v89 + 1;
                  }
                  else {
                    size_t v87 = 23;
                  }
LABEL_152:
                  int v90 = operator new(v87);
                  std::string::size_type v91 = (std::string::size_type)v90;
                  if (!v86 || (memmove(v90, v85, v86), v86 != 22)) {
                    operator delete(v85);
                  }
                  v150.__r_.__value_.__r.__words[0] = v91;
                  v150.__r_.__value_.__r.__words[2] = v87 | 0x8000000000000000;
                }
                break;
              }
              v150.__r_.__value_.__l.__size_ = v86 + 1;
              size_t v92 = (char *)(v91 + v86);
              *size_t v92 = v83;
              v92[1] = 0;
              if (++v77 == v79) {
                goto LABEL_200;
              }
              continue;
            }
          }
LABEL_133:
          LOBYTE(v41) = 36;
LABEL_134:
          unsigned __int8 v80 = HIBYTE(v150.__r_.__value_.__r.__words[2]);
          if (SHIBYTE(v150.__r_.__value_.__r.__words[2]) < 0) {
            goto LABEL_160;
          }
          goto LABEL_135;
        }
        if (!v21)
        {
          if (!v155.st_atimespec.tv_nsec) {
            goto LABEL_247;
          }
          goto LABEL_246;
        }
        while (1)
        {
          while (1)
          {
            char first = (char)v20->first;
            unsigned __int8 v133 = HIBYTE(v150.__r_.__value_.__r.__words[2]);
            if (SHIBYTE(v150.__r_.__value_.__r.__words[2]) < 0) {
              break;
            }
            if (HIBYTE(v150.__r_.__value_.__r.__words[2]) == 22)
            {
              uint64_t v134 = &v150;
              size_t v135 = 22;
              goto LABEL_258;
            }
            *((unsigned char *)&v150.__r_.__value_.__s + 23) = (*((unsigned char *)&v150.__r_.__value_.__s + 23) + 1) & 0x7F;
            v131 = (char *)&v150 + v133;
            char *v131 = first;
            v131[1] = 0;
            unint64_t v20 = (std::sub_match<const char *> *)((char *)v20 + 1);
            if (!--v21) {
              goto LABEL_272;
            }
          }
          size_t v135 = (v150.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
          if (v150.__r_.__value_.__l.__size_ == v135) {
            break;
          }
          size_t v135 = v150.__r_.__value_.__l.__size_;
          std::string::size_type v140 = v150.__r_.__value_.__r.__words[0];
LABEL_271:
          v150.__r_.__value_.__l.__size_ = v135 + 1;
          std::string v141 = (char *)(v140 + v135);
          *std::string v141 = first;
          v141[1] = 0;
          unint64_t v20 = (std::sub_match<const char *> *)((char *)v20 + 1);
          if (!--v21)
          {
LABEL_272:
            uint64_t v4 = a1;
            if (!tv_nsec)
            {
LABEL_247:
              if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v152.__r_.__value_.__l.__data_);
              }
              std::string v152 = v150;
              unsigned int v5 = v145;
              if (SHIBYTE(__p[2]) < 0) {
                operator delete(__p[0]);
              }
              goto LABEL_6;
            }
LABEL_246:
            operator delete(tv_nsec);
            goto LABEL_247;
          }
        }
        if ((v150.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        uint64_t v134 = (std::string *)v150.__r_.__value_.__r.__words[0];
        size_t v136 = 0x7FFFFFFFFFFFFFF7;
        if (v135 < 0x3FFFFFFFFFFFFFF3)
        {
LABEL_258:
          if (v135 + 1 > 2 * v135) {
            unint64_t v137 = v135 + 1;
          }
          else {
            unint64_t v137 = 2 * v135;
          }
          uint64_t v138 = (v137 & 0x7FFFFFFFFFFFFFF8) + 8;
          if ((v137 | 7) != 0x17) {
            uint64_t v138 = v137 | 7;
          }
          if (v137 >= 0x17) {
            size_t v136 = v138 + 1;
          }
          else {
            size_t v136 = 23;
          }
        }
        v139 = operator new(v136);
        std::string::size_type v140 = (std::string::size_type)v139;
        if (!v135 || (memmove(v139, v134, v135), v135 != 22)) {
          operator delete(v134);
        }
        v150.__r_.__value_.__r.__words[0] = v140;
        v150.__r_.__value_.__r.__words[2] = v136 | 0x8000000000000000;
        goto LABEL_271;
      }
      operator delete(v156[0].__r_.__value_.__l.__data_);
      goto LABEL_25;
    }
    *(unsigned char *)(v143 + 23) = 0;
    *(unsigned char *)uint64_t v143 = 0;
    if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v152.__r_.__value_.__l.__data_);
    }
  }
  v142 = *(std::__shared_weak_count **)&v154[32];
  if (*(void *)&v154[32]
    && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v154[32] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v142->__on_zero_shared)(v142);
    std::__shared_weak_count::__release_weak(v142);
  }
  std::locale::~locale(v153);
}

void sub_21D8346FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,std::locale a39)
{
}

void sub_21D834710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,std::locale a39)
{
  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](v39);
  std::locale::~locale(&a39);
  _Unwind_Resume(a1);
}

void sub_21D83472C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,std::locale a39)
{
}

void sub_21D834740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46,uint64_t a47,std::locale a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *__p,uint64_t a57,int a58,__int16 a59,char a60,char a61,uint64_t a62,void *a63)
{
  if (a61 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v63 - 185) < 0) {
    operator delete(*(void **)(v63 - 208));
  }
  if (a46 < 0) {
    operator delete(a41);
  }
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a48);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::~basic_regex(std::locale *this)
{
  timespec v1 = this;
  locale = (std::__shared_weak_count *)this[6].__locale_;
  if (locale && !atomic_fetch_add(&locale->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
    std::__shared_weak_count::__release_weak(locale);
    this = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  std::locale::~locale(this);
}

void support::fs::createUniquePath(const char *a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v2 = a1;
  uint64_t v29 = *MEMORY[0x263EF8340];
  v4.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v4.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&__src.st_blksize_t size = v4;
  *(timespec *)__src.st_qspare = v4;
  __src.st_birthtimespec = v4;
  *(timespec *)&__src.st_size_t size = v4;
  __src.st_mtimespec = v4;
  __src.st_ctimespec = v4;
  *(timespec *)&__src.st_uid = v4;
  __src.st_atimespec = v4;
  *(timespec *)&__src.st_dev = v4;
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  if (!stat(a1, &__src))
  {
    v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    timespec v27 = v5;
    timespec v28 = v5;
    timespec v25 = v5;
    timespec v26 = v5;
    timespec v23 = v5;
    timespec v24 = v5;
    *(timespec *)__src.st_qspare = v5;
    timespec v22 = v5;
    *(timespec *)&__src.st_size_t size = v5;
    *(timespec *)&__src.st_blksize_t size = v5;
    __src.st_ctimespec = v5;
    __src.st_birthtimespec = v5;
    __src.st_atimespec = v5;
    __src.st_mtimespec = v5;
    *(timespec *)&__src.st_dev = v5;
    *(timespec *)&__src.st_uid = v5;
    snprintf((char *)&__src, 0x100uLL, "-%u", 1);
    memset(a2, 170, sizeof(std::string));
    size_t v6 = strlen((const char *)&__src);
    if (v6 > 0x7FFFFFFFFFFFFFF7) {
LABEL_32:
    }
      std::string::__throw_length_error[abi:ne180100]();
    __darwin_ino64_t v7 = v6;
    int v8 = 2;
    while (v7 < 0x17)
    {
      HIBYTE(__dst.st_gid) = v7;
      p_dst = &__dst;
      if (v7) {
        goto LABEL_15;
      }
LABEL_16:
      *((unsigned char *)&p_dst->st_dev + v7) = 0;
      int v13 = v2[23];
      if (v13 >= 0) {
        unsigned int v14 = v2;
      }
      else {
        unsigned int v14 = *(const std::string::value_type **)v2;
      }
      if (v13 >= 0) {
        std::string::size_type v15 = *((unsigned __int8 *)v2 + 23);
      }
      else {
        std::string::size_type v15 = *((void *)v2 + 1);
      }
      long long v16 = std::string::insert((std::string *)&__dst, 0, v14, v15);
      long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
      a2->__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
      *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v17;
      v16->__r_.__value_.__l.__size_ = 0;
      v16->__r_.__value_.__r.__words[2] = 0;
      v16->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(__dst.st_gid) < 0) {
        operator delete(*(void **)&__dst.st_dev);
      }
      v18.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v18.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&__dst.st_blksize_t size = v18;
      *(timespec *)__dst.st_qspare = v18;
      __dst.st_birthtimespec = v18;
      *(timespec *)&__dst.st_size_t size = v18;
      __dst.st_mtimespec = v18;
      __dst.st_ctimespec = v18;
      *(timespec *)&__dst.st_uid = v18;
      __dst.st_atimespec = v18;
      *(timespec *)&__dst.st_dev = v18;
      if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v19 = (const char *)a2;
      }
      else {
        int v19 = (const char *)a2->__r_.__value_.__r.__words[0];
      }
      if (stat(v19, &__dst)) {
        return;
      }
      if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0) {
        operator delete(a2->__r_.__value_.__l.__data_);
      }
      v9.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v9.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      timespec v27 = v9;
      timespec v28 = v9;
      timespec v25 = v9;
      timespec v26 = v9;
      timespec v23 = v9;
      timespec v24 = v9;
      *(timespec *)__src.st_qspare = v9;
      timespec v22 = v9;
      *(timespec *)&__src.st_size_t size = v9;
      *(timespec *)&__src.st_blksize_t size = v9;
      __src.st_ctimespec = v9;
      __src.st_birthtimespec = v9;
      __src.st_atimespec = v9;
      __src.st_mtimespec = v9;
      *(timespec *)&__src.st_dev = v9;
      *(timespec *)&__src.st_uid = v9;
      snprintf((char *)&__src, 0x100uLL, "-%u", v8);
      memset(a2, 170, sizeof(std::string));
      __darwin_ino64_t v7 = strlen((const char *)&__src);
      ++v8;
      if (v7 > 0x7FFFFFFFFFFFFFF7) {
        goto LABEL_32;
      }
    }
    uint64_t v11 = (v7 & 0x7FFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v11 = v7 | 7;
    }
    uint64_t v12 = v11 + 1;
    p_dst = (stat *)operator new(v11 + 1);
    __dst.st_ino = v7;
    *(void *)&__dst.st_uid = v12 | 0x8000000000000000;
    *(void *)&__dst.st_dev = p_dst;
LABEL_15:
    memcpy(p_dst, &__src, v7);
    goto LABEL_16;
  }
  if (v2[23] < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)v2, *((void *)v2 + 1));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)v2;
    a2->__r_.__value_.__r.__words[2] = *((void *)v2 + 2);
  }
}

void sub_21D834B94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

BOOL support::fs::createDir(const char *a1, mode_t a2, int a3)
{
  timespec v5 = a1;
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v29.st_blksize_t size = v6;
  *(timespec *)v29.st_qspare = v6;
  v29.st_birthtimespec = v6;
  *(timespec *)&v29.st_size_t size = v6;
  v29.st_mtimespec = v6;
  v29.st_ctimespec = v6;
  *(timespec *)&v29.st_uid = v6;
  v29.st_atimespec = v6;
  *(timespec *)&v29.st_dev = v6;
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  if (!stat(a1, &v29)) {
    return 1;
  }
  if (!a3)
  {
    if (v5[23] >= 0) {
      uint64_t v21 = v5;
    }
    else {
      uint64_t v21 = *(const char **)v5;
    }
    return mkdir(v21, a2) == 0;
  }
  v27[1] = (void *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v28 = 0x1AAAAAAAAAAAAAALL;
  v27[0] = (void *)0xAAAAAAAAAAAA002FLL;
  memset(&__p[32], 170, 24);
  ctu::tokenize();
  memset(__p, 0, 24);
  if (v5[23] >= 0) {
    __darwin_ino64_t v7 = v5;
  }
  else {
    __darwin_ino64_t v7 = *(const char **)v5;
  }
  if (*v7 == 47)
  {
    *(_OWORD *)std::string __p = *(_OWORD *)v27;
    *(void *)&__p[16] = v28;
  }
  uint64_t v8 = *(void *)&__p[32];
  if (*(void *)&__p[40] != *(void *)&__p[32])
  {
    unint64_t v9 = 0;
    unsigned int v10 = 1;
    while (1)
    {
      if (v10 != 1)
      {
        if (v28 >= 0) {
          uint64_t v11 = v27;
        }
        else {
          uint64_t v11 = (void **)v27[0];
        }
        if (v28 >= 0) {
          std::string::size_type v12 = HIBYTE(v28);
        }
        else {
          std::string::size_type v12 = (std::string::size_type)v27[1];
        }
        std::string::append((std::string *)__p, (const std::string::value_type *)v11, v12);
        uint64_t v8 = *(void *)&__p[32];
      }
      uint64_t v13 = v8 + 24 * v9;
      int v14 = *(char *)(v13 + 23);
      std::string::size_type v15 = v14 >= 0 ? (const std::string::value_type *)v13 : *(const std::string::value_type **)v13;
      std::string::size_type v16 = v14 >= 0 ? *(unsigned __int8 *)(v13 + 23) : *(void *)(v13 + 8);
      std::string::append((std::string *)__p, v15, v16);
      v17.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v17.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&v29.st_blksize_t size = v17;
      *(timespec *)v29.st_qspare = v17;
      v29.st_birthtimespec = v17;
      *(timespec *)&v29.st_size_t size = v17;
      v29.st_mtimespec = v17;
      v29.st_ctimespec = v17;
      *(timespec *)&v29.st_uid = v17;
      v29.st_atimespec = v17;
      *(timespec *)&v29.st_dev = v17;
      timespec v18 = __p[23] >= 0 ? __p : *(const char **)__p;
      if (stat(v18, &v29))
      {
        int v19 = __p[23] >= 0 ? __p : *(const char **)__p;
        if (mkdir(v19, a2)) {
          break;
        }
      }
      unint64_t v9 = v10;
      uint64_t v8 = *(void *)&__p[32];
      ++v10;
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&__p[40] - *(void *)&__p[32]) >> 3) <= v9) {
        goto LABEL_42;
      }
    }
    uint64_t v20 = 0;
    if ((__p[23] & 0x80000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v20 = 1;
  if ((__p[23] & 0x80000000) != 0) {
LABEL_43:
  }
    operator delete(*(void **)__p);
LABEL_44:
  uint64_t v22 = *(void *)&__p[32];
  if (*(void *)&__p[32])
  {
    uint64_t v23 = *(void *)&__p[40];
    timespec v24 = *(void **)&__p[32];
    if (*(void *)&__p[40] != *(void *)&__p[32])
    {
      do
      {
        if (*(char *)(v23 - 1) < 0) {
          operator delete(*(void **)(v23 - 24));
        }
        v23 -= 24;
      }
      while (v23 != v22);
      timespec v24 = *(void **)&__p[32];
    }
    *(void *)&__p[40] = v22;
    operator delete(v24);
  }
  if (SHIBYTE(v28) < 0) {
    operator delete(v27[0]);
  }
  return v20;
}

void sub_21D834E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a14 < 0)
  {
    operator delete(__p);
    std::vector<std::string>::~vector[abi:ne180100](&a16);
    if ((a24 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(a1);
  }
  else
  {
    std::vector<std::string>::~vector[abi:ne180100](&a16);
    if ((a24 & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  operator delete(a19);
  _Unwind_Resume(a1);
}

BOOL support::fs::rename(const std::__fs::filesystem::path *a1, const std::__fs::filesystem::path *a2, std::error_code *a3)
{
  if ((a1->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    a1 = (const std::__fs::filesystem::path *)a1->__pn_.__r_.__value_.__r.__words[0];
  }
  if ((a2->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    a2 = (const std::__fs::filesystem::path *)a2->__pn_.__r_.__value_.__r.__words[0];
  }
  rename(a1, a2, a3);
  return v3 == 0;
}

BOOL support::fs::chmod(const char *a1, mode_t a2)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  return chmod(a1, a2) == 0;
}

uint64_t support::fs::removeDir(const char *a1)
{
  timespec v1 = (const std::__fs::filesystem::path *)a1;
  v46[2] = *MEMORY[0x263EF8340];
  v2.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v2.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&__dst.st_blkstd::string::size_type size = v2;
  *(timespec *)__dst.st_qspare = v2;
  __dst.st_birthtimespec = v2;
  *(timespec *)&__dst.st_std::string::size_type size = v2;
  __dst.st_mtimespec = v2;
  __dst.st_ctimespec = v2;
  *(timespec *)&__dst.st_uid = v2;
  __dst.st_atimespec = v2;
  *(timespec *)&__dst.st_dev = v2;
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  if (stat(a1, &__dst)) {
    return 1;
  }
  size_t v42 = 0;
  int v43 = 0;
  uint64_t v44 = 0;
  support::fs::readDir((const char *)v1, (uint64_t)&v42);
  unsigned int v5 = 0;
  while (1)
  {
    unsigned int v6 = v5;
    unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * (((char *)v43 - (unsigned char *)v42) >> 3);
    BOOL v3 = v7 <= v5;
    if (v7 <= v5) {
      break;
    }
    uint64_t v8 = (char *)v42 + 24 * v5;
    memset(&__p, 170, sizeof(__p));
    if (v8[23] < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v8, *((void *)v8 + 1));
    }
    else
    {
      long long v9 = *(_OWORD *)v8;
      __p.__r_.__value_.__r.__words[2] = *((void *)v8 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
    }
    int v10 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    if (size == 2)
    {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      if (LOWORD(p_p->__r_.__value_.__l.__data_) == 11822)
      {
LABEL_58:
        char v30 = 1;
        if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_7;
        }
        goto LABEL_6;
      }
    }
    else if (size == 1)
    {
      std::string::size_type v12 = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v12 = &__p;
      }
      if (v12->__r_.__value_.__s.__data_[0] == 46) {
        goto LABEL_58;
      }
    }
    int v14 = SHIBYTE(v1->__pn_.__r_.__value_.__r.__words[2]);
    if (v14 >= 0) {
      size_t v15 = HIBYTE(v1->__pn_.__r_.__value_.__r.__words[2]);
    }
    else {
      size_t v15 = v1->__pn_.__r_.__value_.__l.__size_;
    }
    unint64_t v16 = v15 + 1;
    memset(&__dst, 170, 24);
    if (v15 + 1 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v16 >= 0x17)
    {
      uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v16 | 7) != 0x17) {
        uint64_t v18 = v16 | 7;
      }
      uint64_t v19 = v18 + 1;
      p_dst = (char *)operator new(v18 + 1);
      __dst.st_ino = v15 + 1;
      *(void *)&__dst.st_uid = v19 | 0x8000000000000000;
      *(void *)&__dst.st_dev = p_dst;
    }
    else
    {
      memset(&__dst, 0, 24);
      p_dst = (char *)&__dst;
      HIBYTE(__dst.st_gid) = v15 + 1;
      if (!v15) {
        goto LABEL_38;
      }
    }
    if (v14 >= 0) {
      uint64_t v20 = v1;
    }
    else {
      uint64_t v20 = (const std::__fs::filesystem::path *)v1->__pn_.__r_.__value_.__r.__words[0];
    }
    memmove(p_dst, v20, v15);
LABEL_38:
    *(_WORD *)&p_dst[v15] = 47;
    if (v10 >= 0) {
      uint64_t v21 = &__p;
    }
    else {
      uint64_t v21 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    uint64_t v22 = std::string::append((std::string *)&__dst, (const std::string::value_type *)v21, size);
    std::string::size_type v23 = v22->__r_.__value_.__r.__words[0];
    v46[0] = v22->__r_.__value_.__l.__size_;
    *(void *)((char *)v46 + 7) = *(std::string::size_type *)((char *)&v22->__r_.__value_.__r.__words[1] + 7);
    char v24 = HIBYTE(v22->__r_.__value_.__r.__words[2]);
    v22->__r_.__value_.__l.__size_ = 0;
    v22->__r_.__value_.__r.__words[2] = 0;
    v22->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    __p.__r_.__value_.__r.__words[0] = v23;
    __p.__r_.__value_.__l.__size_ = v46[0];
    *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v46 + 7);
    *((unsigned char *)&__p.__r_.__value_.__s + 23) = v24;
    if (SHIBYTE(__dst.st_gid) < 0)
    {
      operator delete(*(void **)&__dst.st_dev);
      char v24 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      std::string::size_type v23 = __p.__r_.__value_.__r.__words[0];
    }
    v25.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v25.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&__dst.st_blkstd::string::size_type size = v25;
    *(timespec *)__dst.st_qspare = v25;
    __dst.st_birthtimespec = v25;
    *(timespec *)&__dst.st_std::string::size_type size = v25;
    __dst.st_mtimespec = v25;
    __dst.st_ctimespec = v25;
    *(timespec *)&__dst.st_uid = v25;
    __dst.st_atimespec = v25;
    if (v24 >= 0) {
      timespec v26 = &__p;
    }
    else {
      timespec v26 = (std::string *)v23;
    }
    *(timespec *)&__dst.st_dev = v25;
    if (!stat((const char *)v26, &__dst)
      && ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? (char v31 = &__p)
        : (char v31 = (std::string *)__p.__r_.__value_.__r.__words[0]),
          (uint64_t v32 = opendir((const char *)v31), (v33 = v32) != 0) && (v34 = readdir(v32), closedir(v33), v34)))
    {
      std::string::append(&__p, "/", 1uLL);
      char v30 = support::fs::removeDir(&__p);
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_7;
      }
    }
    else
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v28 = (const std::__fs::filesystem::path *)&__p;
      }
      else {
        uint64_t v28 = (const std::__fs::filesystem::path *)__p.__r_.__value_.__r.__words[0];
      }
      if (!remove(v28, v27)) {
        goto LABEL_58;
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        stat v29 = &__p;
      }
      else {
        stat v29 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      char v30 = unlink((const char *)v29) == 0;
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_7;
      }
    }
LABEL_6:
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_7:
    unsigned int v5 = v6 + 1;
    if ((v30 & 1) == 0) {
      goto LABEL_75;
    }
  }
  if ((v1->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v35 = v1;
  }
  else {
    uint64_t v35 = (const std::__fs::filesystem::path *)v1->__pn_.__r_.__value_.__r.__words[0];
  }
  if (remove(v35, v4))
  {
    if ((v1->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v36 = (const char *)v1;
    }
    else {
      std::string::size_type v36 = (const char *)v1->__pn_.__r_.__value_.__r.__words[0];
    }
    unlink(v36);
  }
LABEL_75:
  uint64_t v37 = (void **)v42;
  if (v42)
  {
    size_t v38 = v43;
    uint64_t v39 = v42;
    if (v43 != v42)
    {
      do
      {
        if (*((char *)v38 - 1) < 0) {
          operator delete(*(v38 - 3));
        }
        v38 -= 3;
      }
      while (v38 != v37);
      uint64_t v39 = v42;
    }
    int v43 = v37;
    operator delete(v39);
  }
  return v3;
}

void sub_21D835344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::vector<std::string>::~vector[abi:ne180100]((void **)va);
  _Unwind_Resume(a1);
}

void sub_21D83535C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if ((a16 & 0x80000000) == 0)
  {
    std::vector<std::string>::~vector[abi:ne180100](&a17);
    _Unwind_Resume(a1);
  }
  operator delete(__p);
  std::vector<std::string>::~vector[abi:ne180100](&a17);
  _Unwind_Resume(a1);
}

BOOL support::fs::removeFile(const std::__fs::filesystem::path *a1, std::error_code *a2)
{
  timespec v2 = a1;
  if ((a1->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    a1 = (const std::__fs::filesystem::path *)a1->__pn_.__r_.__value_.__r.__words[0];
  }
  if (!remove(a1, a2)) {
    return 1;
  }
  if ((v2->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    BOOL v3 = (const char *)v2;
  }
  else {
    BOOL v3 = (const char *)v2->__pn_.__r_.__value_.__r.__words[0];
  }
  return unlink(v3) == 0;
}

uint64_t support::fs::removeDirContents(const char *a1, unint64_t a2)
{
  BOOL v3 = a1;
  long long v62 = 0;
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  support::fs::readDir(a1, (uint64_t)&v62);
  time_t v56 = time(0);
  unsigned int v5 = (void **)v62;
  timespec v4 = v63;
  if (v62 == v63)
  {
    char v52 = 1;
    if (v62) {
      goto LABEL_105;
    }
    return v52 & 1;
  }
  double v6 = (double)a2;
  char v57 = 1;
  while (1)
  {
    memset(&v61, 170, sizeof(v61));
    if (*((char *)v5 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v61, (const std::string::value_type *)*v5, (std::string::size_type)v5[1]);
    }
    else
    {
      long long v7 = *(_OWORD *)v5;
      v61.__r_.__value_.__r.__words[2] = (std::string::size_type)v5[2];
      *(_OWORD *)&v61.__r_.__value_.__l.__data_ = v7;
    }
    int v8 = SHIBYTE(v61.__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = (v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
       ? HIBYTE(v61.__r_.__value_.__r.__words[2])
       : v61.__r_.__value_.__l.__size_;
    if (v9 == 2) {
      break;
    }
    if (v9 == 1)
    {
      int v10 = (std::string *)v61.__r_.__value_.__r.__words[0];
      if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v10 = &v61;
      }
      if (v10->__r_.__value_.__s.__data_[0] == 46) {
        goto LABEL_95;
      }
    }
LABEL_19:
    memset(__p, 170, 24);
    int v12 = v3[23];
    if (v12 >= 0) {
      size_t v13 = *((unsigned __int8 *)v3 + 23);
    }
    else {
      size_t v13 = *((void *)v3 + 1);
    }
    unint64_t v14 = v13 + 1;
    memset(&__dst, 170, 24);
    if (v13 + 1 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v14 >= 0x17)
    {
      int v58 = SHIBYTE(v61.__r_.__value_.__r.__words[2]);
      std::string::size_type v16 = v9;
      timespec v17 = v5;
      uint64_t v18 = v4;
      uint64_t v19 = v3;
      unint64_t v20 = a2;
      uint64_t v21 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v14 | 7) != 0x17) {
        uint64_t v21 = v14 | 7;
      }
      uint64_t v22 = v21 + 1;
      p_dst = (stat *)operator new(v21 + 1);
      __dst.st_ino = v13 + 1;
      *(void *)&__dst.st_uid = v22 | 0x8000000000000000;
      *(void *)&__dst.st_dev = p_dst;
      a2 = v20;
      BOOL v3 = v19;
      timespec v4 = v18;
      unsigned int v5 = v17;
      std::string::size_type v9 = v16;
      int v8 = v58;
    }
    else
    {
      memset(&__dst, 0, 24);
      p_dst = &__dst;
      HIBYTE(__dst.st_gid) = v13 + 1;
      if (!v13) {
        goto LABEL_33;
      }
    }
    if (v12 >= 0) {
      std::string::size_type v23 = v3;
    }
    else {
      std::string::size_type v23 = *(const char **)v3;
    }
    memmove(p_dst, v23, v13);
LABEL_33:
    *(_WORD *)((char *)&p_dst->st_dev + v13) = 47;
    if (v8 >= 0) {
      char v24 = &v61;
    }
    else {
      char v24 = (std::string *)v61.__r_.__value_.__r.__words[0];
    }
    timespec v25 = std::string::append((std::string *)&__dst, (const std::string::value_type *)v24, v9);
    long long v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
    __p[2] = (void *)v25->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v26;
    v25->__r_.__value_.__l.__size_ = 0;
    v25->__r_.__value_.__r.__words[2] = 0;
    v25->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(__dst.st_gid) < 0)
    {
      operator delete(*(void **)&__dst.st_dev);
      if (!a2) {
        goto LABEL_47;
      }
    }
    else if (!a2)
    {
      goto LABEL_47;
    }
    v27.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v27.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&__dst.st_blkstd::string::size_type size = v27;
    *(timespec *)__dst.st_qspare = v27;
    __dst.st_birthtimespec = v27;
    *(timespec *)&__dst.st_std::string::size_type size = v27;
    __dst.st_mtimespec = v27;
    __dst.st_ctimespec = v27;
    __dst.st_atimespec = v27;
    *(timespec *)&__dst.st_dev = v27;
    *(timespec *)&__dst.st_uid = v27;
    if (SHIBYTE(__p[2]) >= 0) {
      uint64_t v28 = __p;
    }
    else {
      uint64_t v28 = (void **)__p[0];
    }
    if (!stat((const char *)v28, &__dst) && difftime(v56, __dst.st_ctimespec.tv_sec) >= v6)
    {
LABEL_47:
      v31.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v31.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&__dst.st_blkstd::string::size_type size = v31;
      *(timespec *)__dst.st_qspare = v31;
      __dst.st_birthtimespec = v31;
      *(timespec *)&__dst.st_std::string::size_type size = v31;
      __dst.st_mtimespec = v31;
      __dst.st_ctimespec = v31;
      __dst.st_atimespec = v31;
      *(timespec *)&__dst.st_dev = v31;
      *(timespec *)&__dst.st_uid = v31;
      if (SHIBYTE(__p[2]) >= 0) {
        uint64_t v32 = __p;
      }
      else {
        uint64_t v32 = (void **)__p[0];
      }
      if (stat((const char *)v32, &__dst)
        || (SHIBYTE(__p[2]) >= 0 ? (std::string::size_type v36 = __p) : (std::string::size_type v36 = (void **)__p[0]),
            (uint64_t v37 = opendir((const char *)v36), (v38 = v37) == 0) || (v39 = readdir(v37), closedir(v38), !v39)))
      {
        if (SHIBYTE(__p[2]) >= 0) {
          unint64_t v34 = (const std::__fs::filesystem::path *)__p;
        }
        else {
          unint64_t v34 = (const std::__fs::filesystem::path *)__p[0];
        }
        if (!remove(v34, v33)
          || (SHIBYTE(__p[2]) >= 0 ? (uint64_t v35 = __p) : (uint64_t v35 = (void **)__p[0]), !unlink((const char *)v35)))
        {
LABEL_89:
          int v30 = 0;
          char v57 = 1;
          char v29 = 1;
          if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
            goto LABEL_91;
          }
          goto LABEL_90;
        }
        goto LABEL_59;
      }
      int v40 = v3[23];
      if (v40 >= 0) {
        size_t v41 = *((unsigned __int8 *)v3 + 23);
      }
      else {
        size_t v41 = *((void *)v3 + 1);
      }
      unint64_t v42 = v41 + 1;
      memset(&v59, 170, sizeof(v59));
      if (v41 + 1 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v42 >= 0x17)
      {
        uint64_t v44 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v42 | 7) != 0x17) {
          uint64_t v44 = v42 | 7;
        }
        uint64_t v45 = v44 + 1;
        int v43 = (char *)operator new(v44 + 1);
        v59.__r_.__value_.__l.__size_ = v41 + 1;
        v59.__r_.__value_.__r.__words[2] = v45 | 0x8000000000000000;
        v59.__r_.__value_.__r.__words[0] = (std::string::size_type)v43;
      }
      else
      {
        memset(&v59, 0, sizeof(v59));
        int v43 = (char *)&v59;
        *((unsigned char *)&v59.__r_.__value_.__s + 23) = v41 + 1;
        if (!v41) {
          goto LABEL_80;
        }
      }
      if (v40 >= 0) {
        uint64_t v46 = v3;
      }
      else {
        uint64_t v46 = *(const char **)v3;
      }
      memmove(v43, v46, v41);
LABEL_80:
      *(_WORD *)&v43[v41] = 47;
      if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        char v47 = &v61;
      }
      else {
        char v47 = (std::string *)v61.__r_.__value_.__r.__words[0];
      }
      if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v61.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v61.__r_.__value_.__l.__size_;
      }
      long long v49 = std::string::append(&v59, (const std::string::value_type *)v47, size);
      long long v50 = *(_OWORD *)&v49->__r_.__value_.__l.__data_;
      *(void *)&__dst.st_uid = *((void *)&v49->__r_.__value_.__l + 2);
      *(_OWORD *)&__dst.st_dev = v50;
      v49->__r_.__value_.__l.__size_ = 0;
      v49->__r_.__value_.__r.__words[2] = 0;
      v49->__r_.__value_.__r.__words[0] = 0;
      char v51 = support::fs::removeDir((const char *)&__dst);
      if (SHIBYTE(__dst.st_gid) < 0)
      {
        operator delete(*(void **)&__dst.st_dev);
        if ((SHIBYTE(v59.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_88;
        }
      }
      else if ((SHIBYTE(v59.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_88:
        if (v51) {
          goto LABEL_89;
        }
LABEL_59:
        char v57 = 0;
        char v29 = 0;
        int v30 = 2;
        if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
          goto LABEL_91;
        }
        goto LABEL_90;
      }
      operator delete(v59.__r_.__value_.__l.__data_);
      if (v51) {
        goto LABEL_89;
      }
      goto LABEL_59;
    }
    char v29 = 0;
    int v30 = 3;
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
      goto LABEL_91;
    }
LABEL_90:
    operator delete(__p[0]);
LABEL_91:
    if (v29) {
      goto LABEL_95;
    }
    if ((SHIBYTE(v61.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_93;
    }
LABEL_96:
    operator delete(v61.__r_.__value_.__l.__data_);
    if (v30 != 3) {
      goto LABEL_97;
    }
LABEL_3:
    v5 += 3;
    if (v5 == v4) {
      goto LABEL_102;
    }
  }
  uint64_t v11 = (std::string *)v61.__r_.__value_.__r.__words[0];
  if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v11 = &v61;
  }
  if (LOWORD(v11->__r_.__value_.__l.__data_) != 11822) {
    goto LABEL_19;
  }
LABEL_95:
  int v30 = 0;
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_96;
  }
LABEL_93:
  if (v30 == 3) {
    goto LABEL_3;
  }
LABEL_97:
  if (!v30) {
    goto LABEL_3;
  }
LABEL_102:
  unsigned int v5 = (void **)v62;
  char v52 = v57;
  if (!v62) {
    return v52 & 1;
  }
LABEL_105:
  uint64_t v53 = v63;
  long long v54 = v5;
  if (v63 != v5)
  {
    do
    {
      if (*((char *)v53 - 1) < 0) {
        operator delete(*(v53 - 3));
      }
      v53 -= 3;
    }
    while (v53 != v5);
    long long v54 = v62;
  }
  uint64_t v63 = v5;
  operator delete(v54);
  return v52 & 1;
}

void sub_21D8359A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a30 < 0) {
    operator delete(a25);
  }
  std::vector<std::string>::~vector[abi:ne180100](&a31);
  _Unwind_Resume(a1);
}

void support::fs::moveDirUnique(const char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  timespec v4 = (const std::__fs::filesystem::path *)a1;
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v16.st_blkstd::string::size_type size = v6;
  *(timespec *)v16.st_qspare = v6;
  v16.st_birthtimespec = v6;
  *(timespec *)&v16.st_std::string::size_type size = v6;
  v16.st_mtimespec = v6;
  v16.st_ctimespec = v6;
  *(timespec *)&v16.st_uid = v6;
  v16.st_atimespec = v6;
  *(timespec *)&v16.st_dev = v6;
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  if (stat(a1, &v16)) {
    goto LABEL_4;
  }
  long long v7 = (v4->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
     ? (const char *)v4
     : (const char *)v4->__pn_.__r_.__value_.__r.__words[0];
  int v8 = opendir(v7);
  if (!v8) {
    goto LABEL_4;
  }
  std::string::size_type v9 = v8;
  int v10 = readdir(v8);
  closedir(v9);
  if (!v10) {
    goto LABEL_4;
  }
  memset((void *)a3, 170, 24);
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  support::fs::createUniquePath((const char *)&__p, (std::string *)a3);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if ((v4->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v12 = v4;
  }
  else {
    int v12 = (const std::__fs::filesystem::path *)v4->__pn_.__r_.__value_.__r.__words[0];
  }
  if (*(char *)(a3 + 23) >= 0) {
    size_t v13 = (const std::__fs::filesystem::path *)a3;
  }
  else {
    size_t v13 = *(const std::__fs::filesystem::path **)a3;
  }
  rename(v12, v13, v11);
  if (v14)
  {
    if (*(char *)(a3 + 23) < 0) {
      operator delete(*(void **)a3);
    }
LABEL_4:
    *(unsigned char *)(a3 + 23) = 0;
    *(unsigned char *)a3 = 0;
  }
}

void sub_21D835BB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void support::fs::getFileName(std::string *a1@<X8>)
{
  memset(__p, 170, sizeof(__p));
  ctu::tokenize();
  if (*((char *)__p[1] - 1) < 0)
  {
    std::string::__init_copy_ctor_external(a1, *((const std::string::value_type **)__p[1] - 3), *((void *)__p[1] - 2));
  }
  else
  {
    long long v2 = *(_OWORD *)((char *)__p[1] - 24);
    a1->__r_.__value_.__r.__words[2] = *((void *)__p[1] - 1);
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = v2;
  }
  if (__p[0])
  {
    BOOL v3 = (void **)__p[1];
    timespec v4 = __p[0];
    if (__p[1] != __p[0])
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*(v3 - 3));
        }
        v3 -= 3;
      }
      while (v3 != __p[0]);
      timespec v4 = __p[0];
    }
    operator delete(v4);
  }
}

void sub_21D835C88(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::vector<std::string>::~vector[abi:ne180100]((void **)va);
  _Unwind_Resume(a1);
}

uint64_t support::fs::lockDir(const char *a1)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  uint64_t v1 = open(a1, 0);
  if ((v1 & 0x80000000) != 0) {
    return v1;
  }
  int v5 = 1;
  v3[0] = 0;
  v3[1] = 0;
  pid_t v4 = getpid();
  if ((fcntl(v1, 9, v3) & 0x80000000) == 0) {
    return v1;
  }
  close(v1);
  return 0xFFFFFFFFLL;
}

BOOL support::fs::unlockDir(support::fs *this)
{
  int v1 = (int)this;
  int v6 = 2;
  v4[0] = 0;
  v4[1] = 0;
  pid_t v5 = getpid();
  BOOL v2 = fcntl(v1, 9, v4) == 0;
  close(v1);
  return v2;
}

BOOL support::fs::getFilteredFiles(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  *__error() = 0;
  if (a1[23] < 0)
  {
    long long v7 = opendir(*(const char **)a1);
    if (v7) {
      goto LABEL_3;
    }
LABEL_78:
    uint64_t v45 = GetOsLogContext()[1];
    BOOL result = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (result)
    {
      if (a1[23] < 0) {
        a1 = *(const char **)a1;
      }
      char v47 = __error();
      unsigned __int8 v48 = strerror(*v47);
      v58.st_dev = 136315394;
      *(void *)&v58.st_mode = a1;
      WORD2(v58.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v58.st_ino + 6) = (__darwin_ino64_t)v48;
      _os_log_error_impl(&dword_21D82B000, v45, OS_LOG_TYPE_ERROR, "Error %s (%s)\n", (uint8_t *)&v58, 0x16u);
      return 0;
    }
    return result;
  }
  long long v7 = opendir(a1);
  if (!v7) {
    goto LABEL_78;
  }
LABEL_3:
  int v8 = v7;
  std::string::size_type v9 = readdir(v7);
  if (v9)
  {
    char v51 = a1;
    char v49 = 0;
    while (1)
    {
      d_name = v9->d_name;
      memset(__dst, 170, sizeof(__dst));
      size_t v11 = strlen(v9->d_name);
      if (v11 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      size_t v12 = v11;
      if (v11 >= 0x17) {
        break;
      }
      __dst[23] = v11;
      size_t v13 = __dst;
      if (v11) {
        goto LABEL_12;
      }
LABEL_13:
      v13[v12] = 0;
      uint64_t v16 = __dst[23];
      int v17 = __dst[23];
      uint64_t v18 = *(void *)&__dst[8];
      if (__dst[23] >= 0) {
        std::string::size_type v19 = __dst[23];
      }
      else {
        std::string::size_type v19 = *(void *)&__dst[8];
      }
      if (v19 == 2)
      {
        uint64_t v21 = *(_WORD **)__dst;
        if (__dst[23] >= 0) {
          uint64_t v21 = __dst;
        }
        if (*v21 == 11822) {
          goto LABEL_73;
        }
      }
      else if (v19 == 1)
      {
        unint64_t v20 = *(unsigned char **)__dst;
        if (__dst[23] >= 0) {
          unint64_t v20 = __dst;
        }
        if (*v20 == 46) {
          goto LABEL_73;
        }
      }
      if (a4) {
        goto LABEL_53;
      }
      uint64_t v22 = v8;
      uint64_t v23 = a4;
      uint64_t v24 = a3;
      v25.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v25.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&v58.st_blkstd::string::size_type size = v25;
      *(timespec *)v58.st_qspare = v25;
      v58.st_birthtimespec = v25;
      *(timespec *)&v58.st_std::string::size_type size = v25;
      v58.st_mtimespec = v25;
      v58.st_ctimespec = v25;
      *(timespec *)&v58.st_uid = v25;
      v58.st_atimespec = v25;
      *(timespec *)&v58.st_dev = v25;
      int v26 = v51[23];
      if (v26 >= 0) {
        size_t v27 = *((unsigned __int8 *)v51 + 23);
      }
      else {
        size_t v27 = *((void *)v51 + 1);
      }
      unint64_t v28 = v27 + 1;
      memset(&v52, 170, sizeof(v52));
      if (v27 + 1 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v28 >= 0x17)
      {
        uint64_t v30 = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v28 | 7) != 0x17) {
          uint64_t v30 = v28 | 7;
        }
        uint64_t v31 = v30 + 1;
        char v29 = (char *)operator new(v30 + 1);
        v52.__r_.__value_.__l.__size_ = v27 + 1;
        v52.__r_.__value_.__r.__words[2] = v31 | 0x8000000000000000;
        v52.__r_.__value_.__r.__words[0] = (std::string::size_type)v29;
      }
      else
      {
        memset(&v52, 0, sizeof(v52));
        char v29 = (char *)&v52;
        *((unsigned char *)&v52.__r_.__value_.__s + 23) = v27 + 1;
        if (!v27) {
          goto LABEL_40;
        }
      }
      if (v26 >= 0) {
        uint64_t v32 = v51;
      }
      else {
        uint64_t v32 = *(const char **)v51;
      }
      memmove(v29, v32, v27);
LABEL_40:
      a3 = v24;
      *(_WORD *)&v29[v27] = 47;
      if (v17 >= 0) {
        size_t v33 = __dst;
      }
      else {
        size_t v33 = *(const std::string::value_type **)__dst;
      }
      unint64_t v34 = std::string::append(&v52, v33, v19);
      a4 = v23;
      long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
      v55[0] = *((void *)&v34->__r_.__value_.__l + 2);
      *(_OWORD *)std::string __p = v35;
      v34->__r_.__value_.__l.__size_ = 0;
      v34->__r_.__value_.__r.__words[2] = 0;
      v34->__r_.__value_.__r.__words[0] = 0;
      if (v55[0] >= 0) {
        std::string::size_type v36 = __p;
      }
      else {
        std::string::size_type v36 = (void **)__p[0];
      }
      lstat((const char *)v36, &v58);
      int v8 = v22;
      if (SHIBYTE(v55[0]) < 0)
      {
        operator delete(__p[0]);
        if ((SHIBYTE(v52.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_48:
          if ((v58.st_mode & 0xF000) != 0xA000) {
            goto LABEL_52;
          }
          goto LABEL_73;
        }
      }
      else if ((SHIBYTE(v52.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_48;
      }
      operator delete(v52.__r_.__value_.__l.__data_);
      if ((v58.st_mode & 0xF000) != 0xA000)
      {
LABEL_52:
        uint64_t v16 = __dst[23];
        uint64_t v18 = *(void *)&__dst[8];
        LOBYTE(v17) = __dst[23];
LABEL_53:
        if ((v17 & 0x80u) == 0) {
          uint64_t v37 = (std::sub_match<const char *> *)__dst;
        }
        else {
          uint64_t v37 = *(std::sub_match<const char *> **)__dst;
        }
        if ((v17 & 0x80u) != 0) {
          uint64_t v16 = v18;
        }
        uint64_t v38 = (uint64_t)v37 + v16;
        *(void *)&long long v39 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v56 = v39;
        v55[6] = 0xAAAAAAAAAAAAAA00;
        v55[3] = 0xAAAAAAAAAAAAAAAALL;
        v55[4] = 0;
        v55[5] = 0;
        v55[7] = 0;
        v55[8] = 0;
        LOBYTE(v56) = 0;
        BYTE8(v56) = 0;
        uint64_t v57 = 0;
        *(_OWORD *)std::string __p = 0u;
        memset(v55, 0, 25);
        *(_OWORD *)&v58.st_birthtimespec.tv_nsec = v39;
        v58.st_ctimespec.tv_sec = 0xAAAAAAAAAAAAAAAALL;
        v58.st_atimespec.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
        memset(&v58.st_mtimespec, 0, 17);
        memset(&v58.st_ctimespec.tv_nsec, 0, 17);
        LOBYTE(v58.st_size) = 0;
        v58.st_blocks = 0;
        memset(&v58, 0, 41);
        int v40 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(a2, v37, (std::sub_match<const char *> *)((char *)v37 + v16), (std::vector<std::csub_match> *)&v58, 4160);
        std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((uint64_t)__p, (uint64_t)v37, v38, (uint64_t *)&v58.st_dev, 0);
        if (*(void *)&v58.st_dev) {
          operator delete(*(void **)&v58.st_dev);
        }
        if ((_BYTE)v56) {
          int v41 = v40 ^ 1;
        }
        else {
          int v41 = 1;
        }
        if (__p[0]) {
          operator delete(__p[0]);
        }
        if ((v40 & v41) != 0)
        {
          unint64_t v42 = *(void *)(a3 + 8);
          if (v42 >= *(void *)(a3 + 16))
          {
            uint64_t v44 = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)a3, (uint64_t)__dst);
          }
          else
          {
            if ((__dst[23] & 0x80000000) != 0)
            {
              std::string::__init_copy_ctor_external(*(std::string **)(a3 + 8), *(const std::string::value_type **)__dst, *(std::string::size_type *)&__dst[8]);
            }
            else
            {
              long long v43 = *(_OWORD *)__dst;
              *(void *)(v42 + 16) = *(void *)&__dst[16];
              *(_OWORD *)unint64_t v42 = v43;
            }
            uint64_t v44 = (std::string *)(v42 + 24);
            *(void *)(a3 + 8) = v42 + 24;
          }
          *(void *)(a3 + 8) = v44;
          char v49 = 1;
        }
      }
LABEL_73:
      if ((__dst[23] & 0x80000000) != 0) {
        operator delete(*(void **)__dst);
      }
      std::string::size_type v9 = readdir(v8);
      if (!v9) {
        goto LABEL_83;
      }
    }
    uint64_t v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v14 = v11 | 7;
    }
    uint64_t v15 = v14 + 1;
    size_t v13 = operator new(v14 + 1);
    *(void *)&__dst[8] = v12;
    *(void *)&__dst[16] = v15 | 0x8000000000000000;
    *(void *)stat __dst = v13;
LABEL_12:
    memmove(v13, d_name, v12);
    goto LABEL_13;
  }
  char v49 = 0;
LABEL_83:
  closedir(v8);
  return v49 & 1;
}

void sub_21D836300(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,void *a48)
{
  *(void *)(v48 + 8) = v49;
  if (a30 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21D836584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void support::fs::getBasePath(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = a1;
  if (((char)a1[23] & 0x80000000) == 0)
  {
    if (!a1[23])
    {
      *(_OWORD *)a2 = *(_OWORD *)a1;
      *(void *)(a2 + 16) = *((void *)a1 + 2);
      return;
    }
LABEL_6:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    memset(&__p, 170, sizeof(__p));
    support::fs::getFileName(&__p);
    size_t v4 = *((void *)v2 + 1);
    if ((v2[23] & 0x80u) == 0)
    {
      size_t v5 = v2[23];
    }
    else
    {
      BOOL v2 = *(unsigned __int8 **)v2;
      size_t v5 = v4;
    }
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    char v7 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    std::string::size_type v9 = &v2[v5];
    if (v5) {
      BOOL v10 = size == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      uint64_t v15 = &v2[v5];
    }
    else
    {
      uint64_t v14 = v2;
      uint64_t v15 = &v2[v5];
      do
      {
        if (*v14 == p_p->__r_.__value_.__s.__data_[0])
        {
          uint64_t v16 = 1;
          while (size != v16)
          {
            if (&v14[v16] == v9) {
              goto LABEL_20;
            }
            int v17 = v14[v16];
            int v18 = p_p->__r_.__value_.__s.__data_[v16++];
            if (v17 != v18) {
              goto LABEL_37;
            }
          }
          uint64_t v15 = v14;
        }
LABEL_37:
        ++v14;
      }
      while (v14 != v9);
    }
LABEL_20:
    BOOL v11 = v15 != v9 || size == 0;
    if (!v11 || v15 - v2 == -1) {
      goto LABEL_34;
    }
    if (v5 >= v15 - v2) {
      size_t v12 = v15 - v2;
    }
    else {
      size_t v12 = v5;
    }
    if (v12 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v12 >= 0x17)
    {
      uint64_t v19 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v12 | 7) != 0x17) {
        uint64_t v19 = v12 | 7;
      }
      uint64_t v20 = v19 + 1;
      size_t v13 = (long long *)operator new(v19 + 1);
      *((void *)&v22 + 1) = v12;
      unint64_t v23 = v20 | 0x8000000000000000;
      *(void *)&long long v22 = v13;
    }
    else
    {
      HIBYTE(v23) = v12;
      size_t v13 = &v22;
      if (!v12)
      {
        LOBYTE(v22) = 0;
        if ((*(char *)(a2 + 23) & 0x80000000) == 0)
        {
LABEL_33:
          *(_OWORD *)a2 = v22;
          *(void *)(a2 + 16) = v23;
          char v7 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
LABEL_34:
          if (v7 < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          return;
        }
LABEL_49:
        operator delete(*(void **)a2);
        goto LABEL_33;
      }
    }
    memmove(v13, v2, v12);
    *((unsigned char *)v13 + v12) = 0;
    if ((*(char *)(a2 + 23) & 0x80000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_49;
  }
  if (*((void *)a1 + 1)) {
    goto LABEL_6;
  }
  uint64_t v21 = *(const std::string::value_type **)a1;
  std::string::__init_copy_ctor_external((std::string *)a2, v21, 0);
}

void sub_21D8367DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void support::fs::getLastNumberDir(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  memset(&v71, 170, sizeof(v71));
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v71, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v71 = *(std::string *)a1;
  }
  size_t v4 = (std::string *)v71.__r_.__value_.__r.__words[0];
  if ((v71.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t v5 = &v71;
  }
  else {
    size_t v5 = (std::string *)v71.__r_.__value_.__r.__words[0];
  }
  if ((v71.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v71.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v71.__r_.__value_.__l.__size_;
  }
  std::string::size_type v7 = size + 1;
  do
  {
    std::string::size_type v8 = v7 - 1;
    if (v7 == 1) {
      goto LABEL_20;
    }
    int v9 = v5->__r_.__value_.__s.__data_[v7-- - 2];
  }
  while (v9 == 47);
  if (v8)
  {
    std::string::size_type v10 = v8 - 1;
    if ((*((unsigned char *)&v71.__r_.__value_.__s + 23) & 0x80) != 0)
    {
      if (v71.__r_.__value_.__l.__size_ > v10)
      {
        v71.__r_.__value_.__l.__size_ = v8;
        goto LABEL_19;
      }
    }
    else if (v10 < HIBYTE(v71.__r_.__value_.__r.__words[2]))
    {
      *((unsigned char *)&v71.__r_.__value_.__s + 23) = v8 & 0x7F;
      size_t v4 = &v71;
LABEL_19:
      v4->__r_.__value_.__s.__data_[v8] = 0;
      goto LABEL_20;
    }
    std::string::__throw_out_of_range[abi:ne180100]();
  }
LABEL_20:
  memset(&v70, 170, sizeof(v70));
  support::fs::getBasePath((unsigned __int8 *)&v71, (uint64_t)&v70);
  std::string::size_type v11 = HIBYTE(v71.__r_.__value_.__r.__words[2]);
  if ((v71.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v11 = v71.__r_.__value_.__l.__size_;
  }
  if (!v11) {
    goto LABEL_33;
  }
  std::string::size_type v12 = HIBYTE(v70.__r_.__value_.__r.__words[2]);
  if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v12 = v70.__r_.__value_.__l.__size_;
  }
  if (!v12)
  {
LABEL_33:
    if ((*(char *)(a1 + 23) & 0x80000000) == 0)
    {
      *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
      a2->__r_.__value_.__r.__words[2] = *(void *)(a1 + 16);
      if ((SHIBYTE(v70.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_131;
      }
      goto LABEL_136;
    }
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
    goto LABEL_130;
  }
  memset(&v69, 170, sizeof(v69));
  support::fs::getFileName(&v69);
  int v13 = SHIBYTE(v69.__r_.__value_.__r.__words[2]);
  if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t v14 = HIBYTE(v69.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t v14 = v69.__r_.__value_.__l.__size_;
  }
  unint64_t v15 = v14 + 13;
  memset(__dst, 170, sizeof(__dst));
  if (v14 + 13 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v15 >= 0x17)
  {
    uint64_t v17 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v17 = v15 | 7;
    }
    uint64_t v18 = v17 + 1;
    uint64_t v16 = (void **)operator new(v17 + 1);
    __dst[1] = (void *)(v14 + 13);
    _OWORD __dst[2] = (void *)(v18 | 0x8000000000000000);
    __dst[0] = v16;
  }
  else
  {
    memset(__dst, 0, sizeof(__dst));
    uint64_t v16 = __dst;
    HIBYTE(__dst[2]) = v14 + 13;
    if (!v14) {
      goto LABEL_44;
    }
  }
  if (v13 >= 0) {
    uint64_t v19 = &v69;
  }
  else {
    uint64_t v19 = (std::string *)v69.__r_.__value_.__r.__words[0];
  }
  memmove(v16, v19, v14);
LABEL_44:
  strcpy((char *)v16 + v14, "-[[:alnum:]]*");
  *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v67[4].__locale_ = v20;
  *(_OWORD *)&v67[6].__locale_ = v20;
  *(_OWORD *)&v67[0].__locale_ = v20;
  *(_OWORD *)&v67[2].__locale_ = v20;
  MEMORY[0x223C08750](v67);
  v67[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v67, MEMORY[0x263F8C108]);
  uint64_t v21 = (std::locale::__imp *)std::locale::use_facet(v67, MEMORY[0x263F8C130]);
  memset(&v67[3], 0, 40);
  v67[2].__locale_ = v21;
  long long v22 = (char *)HIBYTE(__dst[2]);
  if (SHIBYTE(__dst[2]) >= 0) {
    unint64_t v23 = (std::basic_regex<char>::value_type *)__dst;
  }
  else {
    unint64_t v23 = (std::basic_regex<char>::value_type *)__dst[0];
  }
  if (SHIBYTE(__dst[2]) < 0) {
    long long v22 = (char *)__dst[1];
  }
  if (&v22[(void)v23] != std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>((uint64_t)v67, v23, &v22[(void)v23]))std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>(); {
  uint64_t v64 = 0;
  }
  unint64_t v65 = 0;
  uint64_t v66 = 0;
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v63, v70.__r_.__value_.__l.__data_, v70.__r_.__value_.__l.__size_);
  }
  else {
    std::string v63 = v70;
  }
  std::locale::locale(&v57, v67);
  long long v58 = *(_OWORD *)&v67[1].__locale_;
  long long v59 = *(_OWORD *)&v67[3].__locale_;
  locale = v67[5].__locale_;
  std::string v61 = v67[6].__locale_;
  if (v67[6].__locale_) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v67[6].__locale_ + 1, 1uLL, memory_order_relaxed);
  }
  long long v62 = v67[7].__locale_;
  if (!support::fs::getFilteredFiles((const char *)&v63, (uint64_t)&v57, (uint64_t)&v64, 0))
  {
    size_t v27 = (std::__shared_weak_count *)v61;
    if (v61 && !atomic_fetch_add((atomic_ullong *volatile)v61 + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
    std::locale::~locale(&v57);
    if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v63.__r_.__value_.__l.__data_);
    }
    goto LABEL_90;
  }
  uint64_t v24 = (void **)v64;
  timespec v25 = v65;
  int v26 = (std::__shared_weak_count *)v61;
  if (v61 && !atomic_fetch_add((atomic_ullong *volatile)v61 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
  }
  std::locale::~locale(&v57);
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v63.__r_.__value_.__l.__data_);
    if (v24 == v25)
    {
LABEL_90:
      if ((*(char *)(a1 + 23) & 0x80000000) == 0)
      {
        *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
        a2->__r_.__value_.__r.__words[2] = *(void *)(a1 + 16);
        uint64_t v37 = (void **)v64;
        if (!v64) {
          goto LABEL_126;
        }
        goto LABEL_119;
      }
      std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
LABEL_118:
      uint64_t v37 = (void **)v64;
      if (!v64) {
        goto LABEL_126;
      }
      goto LABEL_119;
    }
  }
  else if (v24 == v25)
  {
    goto LABEL_90;
  }
  unint64_t v28 = (char *)v64;
  char v29 = (char *)v65;
  if (v64 != v65)
  {
    unsigned int v30 = 0;
    while (1)
    {
      memset(&__p, 170, sizeof(__p));
      ctu::tokenize();
      memset(&v55, 170, sizeof(v55));
      if (*(char *)(__p.__r_.__value_.__l.__size_ - 1) < 0)
      {
        std::string::__init_copy_ctor_external(&v55, *(const std::string::value_type **)(__p.__r_.__value_.__l.__size_ - 24), *(void *)(__p.__r_.__value_.__l.__size_ - 16));
      }
      else
      {
        long long v32 = *(_OWORD *)(__p.__r_.__value_.__l.__size_ - 24);
        v55.__r_.__value_.__r.__words[2] = *(void *)(__p.__r_.__value_.__l.__size_ - 8);
        *(_OWORD *)&v55.__r_.__value_.__l.__data_ = v32;
      }
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        size_t v33 = &v55;
      }
      else {
        size_t v33 = (std::string *)v55.__r_.__value_.__r.__words[0];
      }
      unsigned int v34 = strtol((const char *)v33, 0, 0);
      if (v30 <= v34) {
        unsigned int v30 = v34;
      }
      if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v55.__r_.__value_.__l.__data_);
        std::string::size_type v35 = __p.__r_.__value_.__r.__words[0];
        if (__p.__r_.__value_.__r.__words[0])
        {
LABEL_85:
          std::string::size_type v36 = __p.__r_.__value_.__l.__size_;
          uint64_t v31 = (void *)v35;
          if (__p.__r_.__value_.__l.__size_ != v35)
          {
            do
            {
              if (*(char *)(v36 - 1) < 0) {
                operator delete(*(void **)(v36 - 24));
              }
              v36 -= 24;
            }
            while (v36 != v35);
            uint64_t v31 = (void *)__p.__r_.__value_.__r.__words[0];
          }
          __p.__r_.__value_.__l.__size_ = v35;
          operator delete(v31);
        }
      }
      else
      {
        std::string::size_type v35 = __p.__r_.__value_.__r.__words[0];
        if (__p.__r_.__value_.__r.__words[0]) {
          goto LABEL_85;
        }
      }
      v28 += 24;
      if (v28 == v29) {
        goto LABEL_95;
      }
    }
  }
  unsigned int v30 = 0;
LABEL_95:
  int v38 = SHIBYTE(v71.__r_.__value_.__r.__words[2]);
  if ((v71.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t v39 = HIBYTE(v71.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t v39 = v71.__r_.__value_.__l.__size_;
  }
  unint64_t v40 = v39 + 1;
  memset(&v55, 170, sizeof(v55));
  if (v39 + 1 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v40 >= 0x17)
  {
    uint64_t v42 = (v40 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v40 | 7) != 0x17) {
      uint64_t v42 = v40 | 7;
    }
    uint64_t v43 = v42 + 1;
    int v41 = (char *)operator new(v42 + 1);
    v55.__r_.__value_.__l.__size_ = v39 + 1;
    v55.__r_.__value_.__r.__words[2] = v43 | 0x8000000000000000;
    v55.__r_.__value_.__r.__words[0] = (std::string::size_type)v41;
  }
  else
  {
    memset(&v55, 0, sizeof(v55));
    int v41 = (char *)&v55;
    *((unsigned char *)&v55.__r_.__value_.__s + 23) = v39 + 1;
    if (!v39) {
      goto LABEL_109;
    }
  }
  if (v38 >= 0) {
    uint64_t v44 = &v71;
  }
  else {
    uint64_t v44 = (std::string *)v71.__r_.__value_.__r.__words[0];
  }
  memmove(v41, v44, v39);
LABEL_109:
  *(_WORD *)&v41[v39] = 45;
  std::to_string(&v54, v30);
  if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v45 = &v54;
  }
  else {
    uint64_t v45 = (std::string *)v54.__r_.__value_.__r.__words[0];
  }
  if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v46 = HIBYTE(v54.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v46 = v54.__r_.__value_.__l.__size_;
  }
  char v47 = std::string::append(&v55, (const std::string::value_type *)v45, v46);
  long long v48 = *(_OWORD *)&v47->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v47->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v48;
  v47->__r_.__value_.__l.__size_ = 0;
  v47->__r_.__value_.__r.__words[2] = 0;
  v47->__r_.__value_.__r.__words[0] = 0;
  uint64_t v49 = std::string::append(&__p, "/", 1uLL);
  long long v50 = *(_OWORD *)&v49->__r_.__value_.__l.__data_;
  a2->__r_.__value_.__r.__words[2] = v49->__r_.__value_.__r.__words[2];
  *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v50;
  v49->__r_.__value_.__l.__size_ = 0;
  v49->__r_.__value_.__r.__words[2] = 0;
  v49->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v54.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_117:
      if ((SHIBYTE(v55.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_118;
      }
      goto LABEL_140;
    }
  }
  else if ((SHIBYTE(v54.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_117;
  }
  operator delete(v54.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v55.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_118;
  }
LABEL_140:
  operator delete(v55.__r_.__value_.__l.__data_);
  uint64_t v37 = (void **)v64;
  if (!v64) {
    goto LABEL_126;
  }
LABEL_119:
  char v51 = v65;
  std::string v52 = v37;
  if (v65 != v37)
  {
    do
    {
      if (*((char *)v51 - 1) < 0) {
        operator delete(*(v51 - 3));
      }
      v51 -= 3;
    }
    while (v51 != v37);
    std::string v52 = v64;
  }
  unint64_t v65 = v37;
  operator delete(v52);
LABEL_126:
  uint64_t v53 = (std::__shared_weak_count *)v67[6].__locale_;
  if (v67[6].__locale_ && !atomic_fetch_add((atomic_ullong *volatile)v67[6].__locale_ + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
    std::__shared_weak_count::__release_weak(v53);
    std::locale::~locale(v67);
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
    {
LABEL_129:
      if ((SHIBYTE(v69.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_130;
      }
      goto LABEL_135;
    }
  }
  else
  {
    std::locale::~locale(v67);
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0) {
      goto LABEL_129;
    }
  }
  operator delete(__dst[0]);
  if ((SHIBYTE(v69.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_130:
    if ((SHIBYTE(v70.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_131;
    }
    goto LABEL_136;
  }
LABEL_135:
  operator delete(v69.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v70.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_131:
    if ((SHIBYTE(v71.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return;
    }
LABEL_137:
    operator delete(v71.__r_.__value_.__l.__data_);
    return;
  }
LABEL_136:
  operator delete(v70.__r_.__value_.__l.__data_);
  if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_137;
  }
}

void sub_21D836FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,std::locale a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,void *a44,uint64_t a45,uint64_t a46,std::locale a47)
{
  if (a28 < 0)
  {
    operator delete(__p);
    if ((a15 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a21 & 0x80000000) == 0)
      {
LABEL_8:
        std::vector<std::string>::~vector[abi:ne180100](&a44);
        std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a47);
        if (*(char *)(v47 - 161) < 0)
        {
          operator delete(*(void **)(v47 - 184));
          if ((*(char *)(v47 - 137) & 0x80000000) == 0)
          {
LABEL_10:
            if ((*(char *)(v47 - 113) & 0x80000000) == 0) {
              goto LABEL_11;
            }
            goto LABEL_15;
          }
        }
        else if ((*(char *)(v47 - 137) & 0x80000000) == 0)
        {
          goto LABEL_10;
        }
        operator delete(*(void **)(v47 - 160));
        if ((*(char *)(v47 - 113) & 0x80000000) == 0)
        {
LABEL_11:
          if ((*(char *)(v47 - 89) & 0x80000000) == 0) {
            goto LABEL_12;
          }
          goto LABEL_16;
        }
LABEL_15:
        operator delete(*(void **)(v47 - 136));
        if ((*(char *)(v47 - 89) & 0x80000000) == 0) {
LABEL_12:
        }
          _Unwind_Resume(a1);
LABEL_16:
        operator delete(*(void **)(v47 - 112));
        _Unwind_Resume(a1);
      }
LABEL_7:
      operator delete(a16);
      goto LABEL_8;
    }
  }
  else if ((a15 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a10);
  if ((a21 & 0x80000000) == 0) {
    goto LABEL_8;
  }
  goto LABEL_7;
}

BOOL support::fs::getPartitionInfo(uint64_t a1, void *a2, void *a3, unint64_t *a4)
{
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    if (*(unsigned char *)(a1 + 23))
    {
      memset(&v11, 0, sizeof(v11));
      int v7 = statvfs((const char *)a1, &v11);
      BOOL result = v7 == 0;
      if (v7) {
        return result;
      }
LABEL_7:
      *a4 = v11.f_frsize;
      uint64_t f_bavail = v11.f_bavail;
      *a2 = v11.f_blocks;
      *a3 = f_bavail;
      return result;
    }
    return 0;
  }
  if (!*(void *)(a1 + 8)) {
    return 0;
  }
  memset(&v11, 0, sizeof(v11));
  int v9 = statvfs(*(const char **)a1, &v11);
  BOOL result = v9 == 0;
  if (!v9) {
    goto LABEL_7;
  }
  return result;
}

void support::fs::readCurrentLine(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  std::istream::tellg();
  uint64_t v4 = v13;
  if (v13 >= 2)
  {
    do
    {
      std::istream::seekg();
      if (std::istream::peek() == 10) {
        break;
      }
    }
    while (v4-- > 1);
  }
  std::istream::seekg();
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
  int v6 = std::locale::use_facet(v12, MEMORY[0x263F8C108]);
  unsigned __int8 v7 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 10);
  std::locale::~locale(v12);
  LOBYTE(v12[0].__locale_) = -86;
  MEMORY[0x223C08670](v12, a1, 1);
  if (!LOBYTE(v12[0].__locale_)) {
    return;
  }
  uint64_t v8 = 0;
  *(unsigned char *)a2 = 0;
  *(unsigned char *)(a2 + 23) = 0;
  while (1)
  {
    int v9 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    std::string::size_type v10 = (unsigned char *)v9[3];
    if (v10 != (unsigned char *)v9[4])
    {
      v9[3] = v10 + 1;
      LOBYTE(v9) = *v10;
      goto LABEL_10;
    }
    LODWORD(v9) = (*(uint64_t (**)(void *))(*v9 + 80))(v9);
    if (v9 == -1) {
      break;
    }
LABEL_10:
    if (v7 == v9)
    {
      int v11 = 0;
      goto LABEL_18;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v9);
    --v8;
    if (*(char *)(a2 + 23) < 0 && *(void *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      int v11 = 4;
      goto LABEL_18;
    }
  }
  if (v8) {
    int v11 = 2;
  }
  else {
    int v11 = 6;
  }
LABEL_18:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v11);
}

void sub_21D837484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_21D837498(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    __cxa_begin_catch(exception_object);
    uint64_t v3 = *v2;
    *(_DWORD *)((char *)v2 + *(void *)(*v2 - 24) + 32) |= 1u;
    if ((*((unsigned char *)v2 + *(void *)(v3 - 24) + 36) & 1) == 0)
    {
      __cxa_end_catch();
      JUMPOUT(0x21D83742CLL);
    }
    __cxa_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

std::string *std::vector<std::string>::__push_back_slow_path<std::string const&>(char **a1, uint64_t a2)
{
  BOOL v2 = *a1;
  uint64_t v3 = a1[1];
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * ((a1[2] - v2) >> 3) > v5) {
    unint64_t v5 = 0x5555555555555556 * ((a1[2] - v2) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - v2) >> 3) >= 0x555555555555555) {
    unint64_t v8 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v8 = v5;
  }
  if (v8)
  {
    if (v8 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int v9 = (char *)operator new(24 * v8);
  }
  else
  {
    int v9 = 0;
  }
  std::string::size_type v10 = (std::string *)&v9[24 * v4];
  uint64_t v16 = v10;
  uint64_t v17 = v10;
  uint64_t v18 = &v9[24 * v8];
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    BOOL v2 = *a1;
    uint64_t v3 = a1[1];
    std::string::size_type v10 = v16;
    int v11 = v17 + 1;
    if (v3 == *a1)
    {
LABEL_17:
      uint64_t v13 = v2;
      goto LABEL_18;
    }
  }
  else
  {
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    v10->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
    int v11 = v10 + 1;
    if (v3 == v2) {
      goto LABEL_17;
    }
  }
  do
  {
    long long v12 = *(_OWORD *)(v3 - 24);
    v10[-1].__r_.__value_.__r.__words[2] = *((void *)v3 - 1);
    *(_OWORD *)&v10[-1].__r_.__value_.__l.__data_ = v12;
    --v10;
    *((void *)v3 - 2) = 0;
    *((void *)v3 - 1) = 0;
    *((void *)v3 - 3) = 0;
    v3 -= 24;
  }
  while (v3 != v2);
  uint64_t v13 = *a1;
  BOOL v2 = a1[1];
LABEL_18:
  *a1 = (char *)v10;
  a1[1] = (char *)v11;
  a1[2] = v18;
  if (v2 != v13)
  {
    uint64_t v14 = (void **)(v2 - 24);
    do
    {
      if (*((char *)v14 + 23) < 0) {
        operator delete(*v14);
      }
      v14 -= 3;
    }
    while (v14 + 3 != (void **)v13);
    BOOL v2 = v13;
  }
  if (v2) {
    operator delete(v2);
  }
  return v11;
}

void sub_21D837758(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer begin = this->__begin_;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  if (end != begin)
  {
    do
    {
      std::__split_buffer<std::string>::pointer v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        std::__split_buffer<std::string>::pointer v4 = this->__end_;
      }
      std::__split_buffer<std::string>::pointer end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::vector<std::string>::__throw_length_error[abi:ne180100]()
{
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_264461390, MEMORY[0x263F8C068]);
}

void sub_21D83783C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1)
{
  BOOL result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

uint64_t std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1 = result;
  BOOL v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

void *std::string::__assign_no_alias<true>(void *__dst, void *__src, size_t __len)
{
  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v7 = 44;
    if (__len > 0x2C) {
      size_t v7 = __len;
    }
    size_t v8 = (v7 | 7) + 1;
    int v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    _OWORD __dst[2] = v8 | 0x8000000000000000;
    *stat __dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    int v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      int v6 = __dst;
    }
  }
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void **std::string::__assign_no_alias<false>(void **a1, void *__src, size_t __len)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) > __len)
  {
    size_t v8 = *a1;
    a1[1] = (void *)__len;
    if (__len) {
      memmove(v8, __src, __len);
    }
    goto LABEL_12;
  }
  size_t v9 = 0x7FFFFFFFFFFFFFF7;
  if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  unint64_t v10 = v7 - 1;
  int v11 = a1;
  if ((v6 & 0x8000000000000000) == 0)
  {
    if (v10 > 0x3FFFFFFFFFFFFFF2) {
      goto LABEL_7;
    }
LABEL_14:
    unint64_t v13 = 2 * v10;
    if (__len > 2 * v10) {
      unint64_t v13 = __len;
    }
    uint64_t v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v14 = v13 | 7;
    }
    if (v13 >= 0x17) {
      size_t v9 = v14 + 1;
    }
    else {
      size_t v9 = 23;
    }
    size_t v8 = operator new(v9);
    if (!__len) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  int v11 = *a1;
  if (v10 <= 0x3FFFFFFFFFFFFFF2) {
    goto LABEL_14;
  }
LABEL_7:
  size_t v8 = operator new(0x7FFFFFFFFFFFFFF7uLL);
  if (__len) {
LABEL_8:
  }
    memcpy(v8, __src, __len);
LABEL_9:
  if (v10 != 22) {
    operator delete(v11);
  }
  a1[1] = (void *)__len;
  a1[2] = (void *)(v9 | 0x8000000000000000);
  *a1 = v8;
LABEL_12:
  *((unsigned char *)v8 + __len) = 0;
  return a1;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(uint64_t a1, std::basic_regex<char> *a2, char *a3)
{
  unint64_t v6 = operator new(8uLL);
  *unint64_t v6 = &unk_26CE32530;
  uint64_t v7 = operator new(0x10uLL);
  v7[1] = v6;
  size_t v8 = operator new(0x20uLL);
  *size_t v8 = &unk_26CE32588;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = v7;
  size_t v9 = *(std::__shared_weak_count **)(a1 + 48);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
    uint64_t v10 = *(void *)(a1 + 40);
    *(void *)(a1 + 56) = v10;
    unsigned int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
    if (v11 <= 0x3F) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    *(void *)(a1 + 56) = v10;
    unsigned int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
    if (v11 <= 0x3F)
    {
LABEL_4:
      if (!v11)
      {
        uint64_t v16 = (char *)a2;
        while (1)
        {
          uint64_t v17 = v16;
          uint64_t v16 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(a1, v16, a3);
          if (v16 == v17)
          {
            uint64_t v18 = *(std::__owns_one_state<char> **)(a1 + 56);
            int v19 = *(_DWORD *)(a1 + 28);
            long long v20 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>((std::basic_regex<char> *)a1, v17, a3);
            if (v20 == (std::basic_regex<char> *)v17)
            {
LABEL_41:
              if (v17 == (std::basic_regex<char>::value_type *)a2)
              {
                uint64_t v24 = operator new(0x10uLL);
                uint64_t v25 = *(void *)(a1 + 56);
                uint64_t v26 = *(void *)(v25 + 8);
                v24[1] = v26;
                *(void *)(v25 + 8) = v24;
                uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
                goto LABEL_74;
              }
LABEL_75:
              if (v17 != a3)
              {
                if (*v17 == 124)
                {
                  uint64_t v54 = *(void *)(a1 + 56);
                  std::string v55 = v17 + 1;
                  long long v56 = v17 + 1;
                  while (1)
                  {
                    uint64_t v17 = v56;
                    long long v56 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(a1, v56, a3);
                    if (v56 == v17)
                    {
                      std::locale v57 = *(std::__owns_one_state<char> **)(a1 + 56);
                      int v58 = *(_DWORD *)(a1 + 28);
                      long long v59 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>((std::basic_regex<char> *)a1, v17, a3);
                      if (v59 == (std::basic_regex<char> *)v17)
                      {
LABEL_82:
                        if (v17 == v55)
                        {
                          char v60 = operator new(0x10uLL);
                          uint64_t v61 = *(void *)(a1 + 56);
                          uint64_t v62 = *(void *)(v61 + 8);
                          v60[1] = v62;
                          *(void *)(v61 + 8) = v60;
                          *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
                        }
                        std::string v63 = operator new(0x18uLL);
                        uint64_t v64 = *(void *)(v54 + 8);
                        v63[1] = *(void *)(v10 + 8);
                        v63[2] = v64;
                        *std::string v63 = &unk_26CE32B48;
                        *(void *)(v10 + 8) = v63;
                        *(void *)(v54 + 8) = 0;
                        unint64_t v65 = operator new(0x10uLL);
                        uint64_t v66 = *(void *)(*(void *)(a1 + 56) + 8);
                        v65[1] = v66;
                        *(void *)(v54 + 8) = v65;
                        *(void *)(*(void *)(a1 + 56) + 8) = 0;
                        long long v67 = operator new(0x10uLL);
                        uint64_t v68 = *(void *)(v54 + 8);
                        void *v67 = &unk_26CE32B90;
                        v67[1] = v68;
                        *(void *)(*(void *)(a1 + 56) + 8) = v67;
                        uint64_t v27 = *(void *)(v54 + 8);
LABEL_74:
                        *(void *)(a1 + 56) = v27;
                        goto LABEL_75;
                      }
                      long long v56 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(a1, v59, (std::basic_regex<char> *)a3, v57, (v58 + 1), (*(_DWORD *)(a1 + 28) + 1));
                    }
                    if (v56 == v17) {
                      goto LABEL_82;
                    }
                  }
                }
                return v17;
              }
              return a3;
            }
            uint64_t v16 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(a1, v20, (std::basic_regex<char> *)a3, v18, (v19 + 1), (*(_DWORD *)(a1 + 28) + 1));
          }
          if (v16 == v17) {
            goto LABEL_41;
          }
        }
      }
      if (v11 != 16)
      {
        if (v11 != 32) {
LABEL_73:
        }
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>();
        goto LABEL_21;
      }
      return std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, a2, a3);
    }
  }
  switch(v11)
  {
    case 0x40u:
LABEL_21:
      return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>((std::basic_regex<char> *)a1, (std::basic_regex<char>::value_type *)a2, a3);
    case 0x80u:
      uint64_t v21 = (std::basic_regex<char>::value_type *)memchr(a2, 10, a3 - (char *)a2);
      if (v21) {
        long long v22 = v21;
      }
      else {
        long long v22 = a3;
      }
      if (v22 == (std::basic_regex<char>::value_type *)a2)
      {
        int v41 = operator new(0x10uLL);
        uint64_t v42 = *(void *)(v10 + 8);
        v41[1] = v42;
        *(void *)(v10 + 8) = v41;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
        if (v22 == a3) {
          unint64_t v23 = (std::basic_regex<char> *)v22;
        }
        else {
          unint64_t v23 = (std::basic_regex<char> *)(v22 + 1);
        }
        if (v23 == (std::basic_regex<char> *)a3) {
          return a3;
        }
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, a2, v22);
        if (v22 == a3) {
          unint64_t v23 = (std::basic_regex<char> *)v22;
        }
        else {
          unint64_t v23 = (std::basic_regex<char> *)(v22 + 1);
        }
        if (v23 == (std::basic_regex<char> *)a3) {
          return a3;
        }
      }
      uint64_t v43 = *(void *)(a1 + 56);
      do
      {
        std::string v52 = (std::basic_regex<char>::value_type *)memchr(v23, 10, a3 - (char *)v23);
        if (v52) {
          uint64_t v53 = v52;
        }
        else {
          uint64_t v53 = a3;
        }
        if (v53 == (std::basic_regex<char>::value_type *)v23)
        {
          uint64_t v44 = operator new(0x10uLL);
          uint64_t v45 = *(void *)(v43 + 8);
          v44[1] = v45;
          *(void *)(v43 + 8) = v44;
          *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, v23, v53);
        }
        std::string::size_type v46 = operator new(0x18uLL);
        uint64_t v47 = *(void *)(v43 + 8);
        v46[1] = *(void *)(v10 + 8);
        v46[2] = v47;
        void *v46 = &unk_26CE32B48;
        *(void *)(v10 + 8) = v46;
        *(void *)(v43 + 8) = 0;
        long long v48 = operator new(0x10uLL);
        uint64_t v49 = *(void *)(*(void *)(a1 + 56) + 8);
        v48[1] = v49;
        *(void *)(v43 + 8) = v48;
        *(void *)(*(void *)(a1 + 56) + 8) = 0;
        long long v50 = operator new(0x10uLL);
        uint64_t v51 = *(void *)(v43 + 8);
        *long long v50 = &unk_26CE32B90;
        v50[1] = v51;
        *(void *)(*(void *)(a1 + 56) + 8) = v50;
        uint64_t v43 = *(void *)(v43 + 8);
        *(void *)(a1 + 56) = v43;
        if (v53 == a3) {
          unint64_t v23 = (std::basic_regex<char> *)v53;
        }
        else {
          unint64_t v23 = (std::basic_regex<char> *)(v53 + 1);
        }
      }
      while (v23 != (std::basic_regex<char> *)a3);
      break;
    case 0x100u:
      long long v12 = (std::basic_regex<char>::value_type *)memchr(a2, 10, a3 - (char *)a2);
      if (v12) {
        unint64_t v13 = v12;
      }
      else {
        unint64_t v13 = a3;
      }
      if (v13 == (std::basic_regex<char>::value_type *)a2)
      {
        unint64_t v28 = operator new(0x10uLL);
        uint64_t v29 = *(void *)(v10 + 8);
        v28[1] = v29;
        *(void *)(v10 + 8) = v28;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
        if (v13 == a3) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = v13 + 1;
        }
        if (v14 == a3) {
          return a3;
        }
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>((std::basic_regex<char> *)a1, (std::basic_regex<char>::value_type *)a2, v13);
        if (v13 == a3) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = v13 + 1;
        }
        if (v14 == a3) {
          return a3;
        }
      }
      uint64_t v30 = *(void *)(a1 + 56);
      do
      {
        size_t v39 = (std::basic_regex<char>::value_type *)memchr(v14, 10, a3 - v14);
        if (v39) {
          unint64_t v40 = v39;
        }
        else {
          unint64_t v40 = a3;
        }
        if (v40 == v14)
        {
          uint64_t v31 = operator new(0x10uLL);
          uint64_t v32 = *(void *)(v30 + 8);
          v31[1] = v32;
          *(void *)(v30 + 8) = v31;
          *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>((std::basic_regex<char> *)a1, v14, v40);
        }
        size_t v33 = operator new(0x18uLL);
        uint64_t v34 = *(void *)(v30 + 8);
        v33[1] = *(void *)(v10 + 8);
        v33[2] = v34;
        void *v33 = &unk_26CE32B48;
        *(void *)(v10 + 8) = v33;
        *(void *)(v30 + 8) = 0;
        std::string::size_type v35 = operator new(0x10uLL);
        uint64_t v36 = *(void *)(*(void *)(a1 + 56) + 8);
        v35[1] = v36;
        *(void *)(v30 + 8) = v35;
        *(void *)(*(void *)(a1 + 56) + 8) = 0;
        uint64_t v37 = operator new(0x10uLL);
        uint64_t v38 = *(void *)(v30 + 8);
        *uint64_t v37 = &unk_26CE32B90;
        v37[1] = v38;
        *(void *)(*(void *)(a1 + 56) + 8) = v37;
        uint64_t v30 = *(void *)(v30 + 8);
        *(void *)(a1 + 56) = v30;
        if (v40 == a3) {
          uint64_t v14 = v40;
        }
        else {
          uint64_t v14 = v40 + 1;
        }
      }
      while (v14 != a3);
      break;
    default:
      goto LABEL_73;
  }
  return a3;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C085B0](exception, 17);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21D83831C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char>::value_type *a3)
{
  uint64_t v3 = a2;
  if (a2 == (std::basic_regex<char> *)a3) {
    return (std::basic_regex<char>::value_type *)a2;
  }
  if (LOBYTE(a2->__traits_.__loc_.__locale_) == 94)
  {
    unint64_t v6 = operator new(0x18uLL);
    BOOL v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(v8 + 8);
    *unint64_t v6 = &unk_26CE32680;
    v6[1] = v9;
    *((unsigned char *)v6 + 16) = v7;
    *(void *)(v8 + 8) = v6;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v3 = (std::basic_regex<char> *)((char *)v3 + 1);
  }
  if (v3 != (std::basic_regex<char> *)a3)
  {
    while (v3 != (std::basic_regex<char> *)a3)
    {
      uint64_t v10 = (std::basic_regex<char>::value_type *)v3;
      unsigned int v11 = *(std::__owns_one_state<char> **)(a1 + 56);
      int v12 = *(_DWORD *)(a1 + 28);
      unint64_t v13 = std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(a1, v10, a3);
      if (v13 != (unsigned __int8 *)v10)
      {
        uint64_t v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)v13, (std::basic_regex<char> *)a3, v11, (v12 + 1), (*(_DWORD *)(a1 + 28) + 1));
        if (v3 != (std::basic_regex<char> *)v10) {
          continue;
        }
      }
      if (v10 + 1 != a3 || *v10 != 36) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      }
      uint64_t v14 = operator new(0x18uLL);
      BOOL v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v16 = *(void *)(a1 + 56);
      uint64_t v17 = *(void *)(v16 + 8);
      *uint64_t v14 = &unk_26CE326C8;
      v14[1] = v17;
      *((unsigned char *)v14 + 16) = v15;
      *(void *)(v16 + 8) = v14;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      return a3;
    }
  }
  return a3;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(std::basic_regex<char> *a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  std::__split_buffer<std::string>::pointer end = a1->__end_;
  BOOL v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, a2, a3);
  if (v7 == (std::basic_regex<char> *)a2) {
    goto LABEL_12;
  }
  do
  {
    uint64_t v8 = v7;
    BOOL v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, (std::basic_regex<char>::value_type *)v7, a3);
  }
  while (v7 != v8);
  if (v8 == (std::basic_regex<char> *)a2) {
LABEL_12:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  if (v8 == (std::basic_regex<char> *)a3) {
    return a3;
  }
  while (LOBYTE(v8->__traits_.__loc_.__locale_) == 124)
  {
    uint64_t v9 = a1->__end_;
    uint64_t v10 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    unsigned int v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, (std::basic_regex<char>::value_type *)&v8->__traits_.__loc_.__locale_ + 1, a3);
    if (v11 == (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1)) {
      goto LABEL_12;
    }
    do
    {
      uint64_t v8 = v11;
      unsigned int v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, (std::basic_regex<char>::value_type *)v11, a3);
    }
    while (v11 != v8);
    if (v8 == v10) {
      goto LABEL_12;
    }
    int v12 = (std::__node<char> *)operator new(0x18uLL);
    char first = v9->__first_;
    v12[1].__vftable = (std::__node<char>_vtbl *)end->__first_;
    v12[2].__vftable = (std::__node<char>_vtbl *)first;
    v12->__vftable = (std::__node<char>_vtbl *)&unk_26CE32B48;
    end->__first_ = v12;
    v9->__first_ = 0;
    uint64_t v14 = (std::__node<char> *)operator new(0x10uLL);
    BOOL v15 = a1->__end_->__first_;
    v14[1].__vftable = (std::__node<char>_vtbl *)v15;
    v9->__first_ = v14;
    a1->__end_->__first_ = 0;
    uint64_t v16 = (std::__node<char> *)operator new(0x10uLL);
    uint64_t v17 = v9->__first_;
    v16->__vftable = (std::__node<char>_vtbl *)&unk_26CE32B90;
    v16[1].__vftable = (std::__node<char>_vtbl *)v17;
    a1->__end_->__first_ = v16;
    a1->__end_ = (std::__owns_one_state<char> *)v9->__first_;
    if (v8 == (std::basic_regex<char> *)a3) {
      return a3;
    }
  }
  return (std::basic_regex<char>::value_type *)v8;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C085B0](exception, 14);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21D8386A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__end_state<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
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
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021D8464E1) {
    return a1 + 24;
  }
  if (((v3 & 0x800000021D8464E1 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000021D8464E1)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021D8464E1 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void (__cdecl ***std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  BOOL v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__empty_state<char>::__exec(const std::__empty_state<char> *this, std::__empty_state<char>::__state *a2)
{
  a2->__do_ = -994;
  a2->__node_ = this->__first_;
}

void std::__owns_one_state<char>::~__owns_one_state(std::__owns_one_state<char> *this)
{
  char first = this->__first_;
  if (first) {
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  }
}

{
  std::__node<char> *first;
  uint64_t vars8;

  char first = this->__first_;
  if (first) {
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  }
  operator delete(this);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](uint64_t a1)
{
  BOOL v2 = (const std::locale *)MEMORY[0x223C08750]();
  *(void *)(a1 + 8) = std::locale::use_facet(v2, MEMORY[0x263F8C108]);
  *(void *)(a1 + 16) = std::locale::use_facet((const std::locale *)a1, MEMORY[0x263F8C130]);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 56) = 0;
  return a1;
}

void sub_21D838BA8(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(std::basic_regex<char> *this, const std::basic_regex<char> *a2, BOOL a3, unsigned int a4)
{
  uint64_t v8 = (char *)operator new(0x58uLL);
  char first = this->__end_->__first_;
  *(void *)uint64_t v8 = &unk_26CE32758;
  *((void *)v8 + 1) = first;
  std::locale::locale((std::locale *)v8 + 2, &a2->__traits_.__loc_);
  *(_OWORD *)(v8 + 24) = *(_OWORD *)&a2->__traits_.__ct_;
  *(_OWORD *)(v8 + 40) = *(_OWORD *)&a2->__flags_;
  cntrl = a2->__start_.__cntrl_;
  *((void *)v8 + 7) = a2->__start_.__ptr_;
  *((void *)v8 + 8) = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit(&cntrl->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *((void *)v8 + 9) = a2->__end_;
  *((_DWORD *)v8 + 20) = a4;
  v8[84] = a3;
  this->__end_->__first_ = (std::__node<char> *)v8;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C085B0](exception, 6);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21D838CC0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  BOOL v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  BOOL v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  operator delete(__p);
}

uint64_t std::__l_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 92))
  {
    if (!*(unsigned char *)(result + 16)) {
      goto LABEL_12;
    }
    int v2 = *(unsigned __int8 *)(*(void *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10) {
      goto LABEL_12;
    }
LABEL_11:
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 80) = *(void *)(result + 8);
    return result;
  }
  if (*(void *)(a2 + 16) == *(void *)(a2 + 8) && (*(unsigned char *)(a2 + 88) & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:
  *(_DWORD *)a2 = -993;
  *(void *)(a2 + 80) = 0;
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

void std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  int v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  operator delete(__p);
}

uint64_t std::__r_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  int v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(unsigned char *)(a2 + 88) & 2) == 0
    || *(unsigned char *)(result + 16) && ((int v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
  else
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  return result;
}

std::locale *std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CE32710;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CE32710;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  operator delete(a1);
}

uint64_t std::__word_boundary<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  int v2 = *(unsigned __int8 **)(a2 + 8);
  int v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3) {
    goto LABEL_19;
  }
  BOOL v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 != v3)
  {
    if (v4 == v2)
    {
      int v5 = *(_DWORD *)(a2 + 88);
      if ((v5 & 0x80) == 0)
      {
        if ((v5 & 4) == 0)
        {
          uint64_t v6 = *v2;
          if (v6 == 95) {
            goto LABEL_17;
          }
          goto LABEL_15;
        }
        goto LABEL_19;
      }
    }
    uint64_t v7 = *(v4 - 1);
    uint64_t v8 = *v4;
    if (v7 == 95
      || (v7 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v7) & 0x500) != 0)
    {
      int v9 = 1;
      if (v8 == 95) {
        goto LABEL_24;
      }
    }
    else
    {
      int v9 = 0;
      if (v8 == 95) {
        goto LABEL_24;
      }
    }
    if ((v8 & 0x80) != 0 || (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v8) & 0x500) == 0)
    {
      if (*(unsigned char *)(result + 40) == (v9 != 0)) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
LABEL_24:
    if (*(unsigned char *)(result + 40) != (v9 != 1)) {
      goto LABEL_27;
    }
    goto LABEL_20;
  }
  if ((*(unsigned char *)(a2 + 88) & 8) == 0)
  {
    uint64_t v6 = *(v3 - 1);
    if (v6 == 95) {
      goto LABEL_17;
    }
LABEL_15:
    if ((v6 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
    {
LABEL_17:
      if (*(unsigned char *)(result + 40) != 1) {
        goto LABEL_27;
      }
LABEL_20:
      *(_DWORD *)a2 = -993;
      *(void *)(a2 + 80) = 0;
      return result;
    }
  }
LABEL_19:
  if (!*(unsigned char *)(result + 40)) {
    goto LABEL_20;
  }
LABEL_27:
  uint64_t v10 = *(void *)(result + 8);
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = v10;
  return result;
}

std::locale *std::__lookahead<char,std::regex_traits<char>>::~__lookahead(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CE32758;
  int v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale && !atomic_fetch_add(&locale->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
    std::__shared_weak_count::__release_weak(locale);
    std::locale::~locale(v2);
    BOOL v4 = a1[1].__locale_;
    if (!v4) {
      return a1;
    }
    goto LABEL_4;
  }
  std::locale::~locale(a1 + 2);
  BOOL v4 = a1[1].__locale_;
  if (v4) {
LABEL_4:
  }
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
  return a1;
}

void std::__lookahead<char,std::regex_traits<char>>::~__lookahead(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CE32758;
  int v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (!locale || atomic_fetch_add(&locale->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    std::locale::~locale(a1 + 2);
    BOOL v4 = a1[1].__locale_;
    if (!v4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
  std::__shared_weak_count::__release_weak(locale);
  std::locale::~locale(v2);
  BOOL v4 = a1[1].__locale_;
  if (v4) {
LABEL_4:
  }
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
LABEL_5:
  operator delete(a1);
}

void std::__lookahead<char,std::regex_traits<char>>::__exec(uint64_t a1, uint64_t a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v20 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v22 = 0xAAAAAAAAAAAAAA00;
  long long v24 = v4;
  uint64_t v21 = 0;
  long long v23 = 0uLL;
  LOBYTE(v24) = 0;
  BYTE8(v24) = 0;
  uint64_t v25 = 0;
  memset(&__p, 0, sizeof(__p));
  std::vector<std::csub_match>::size_type v5 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)&long long v19 = *(void *)(a2 + 24);
  *((void *)&v19 + 1) = v19;
  LOBYTE(v20) = 0;
  std::vector<std::sub_match<char const*>>::assign(&__p, v5, (std::vector<std::csub_match>::const_reference)&v19);
  *((void *)&v20 + 1) = v6;
  uint64_t v21 = v6;
  LOBYTE(v22) = 0;
  long long v23 = v19;
  LOBYTE(v24) = v20;
  uint64_t v25 = v6;
  BYTE8(v24) = 1;
  uint64_t v7 = *(const char **)(a2 + 16);
  if (*(unsigned char *)(a2 + 92)) {
    BOOL v8 = v7 == *(const char **)(a2 + 8);
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1 + 16, v7, *(const char **)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v9))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    std::vector<std::csub_match>::pointer begin = __p.__begin_;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(a1 + 8);
  std::vector<std::csub_match>::pointer begin = __p.__begin_;
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__end_ - (char *)__p.__begin_) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!begin) {
      return;
    }
    goto LABEL_14;
  }
  int v12 = 0;
  int v13 = *(_DWORD *)(a1 + 80);
  uint64_t v14 = *(void *)(a2 + 32);
  unint64_t v15 = 1;
  do
  {
    uint64_t v16 = &begin[v15];
    uint64_t v17 = v14 + 24 * (v13 + v12);
    *(std::pair<const char *, const char *> *)uint64_t v17 = v16->std::pair<const char *, const char *>;
    *(unsigned char *)(v17 + 16) = v16->matched;
    unint64_t v15 = (v12 + 2);
    ++v12;
  }
  while (v11 > v15);
LABEL_14:
  operator delete(begin);
}

void sub_21D8395A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
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

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C085B0](exception, 12);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21D839670(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C085B0](exception, 16);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21D8396C8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void **std::vector<std::__state<char>>::~vector[abi:ne180100](void **a1)
{
  int v2 = (char *)*a1;
  if (*a1)
  {
    int v3 = (char *)a1[1];
    long long v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        std::vector<std::csub_match>::size_type v5 = (void *)*((void *)v3 - 5);
        if (v5)
        {
          *((void *)v3 - 4) = v5;
          operator delete(v5);
        }
        uint64_t v6 = (void *)*((void *)v3 - 8);
        if (v6)
        {
          *((void *)v3 - 7) = v6;
          operator delete(v6);
        }
        v3 -= 96;
      }
      while (v3 != v2);
      long long v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

char *std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(void **a1, uint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 5);
  unint64_t v3 = v2 + 1;
  if (v2 + 1 > 0x2AAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5) > v3) {
    unint64_t v3 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5) >= 0x155555555555555) {
    unint64_t v6 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v6 = v3;
  }
  if (v6)
  {
    if (v6 > 0x2AAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v7 = (char *)operator new(96 * v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  long long v8 = *(_OWORD *)(a2 + 16);
  char v9 = &v7[96 * v2];
  *(_OWORD *)char v9 = *(_OWORD *)a2;
  *((_OWORD *)v9 + 1) = v8;
  uint64_t v10 = &v7[96 * v6];
  *((_OWORD *)v9 + 2) = *(_OWORD *)(a2 + 32);
  *((void *)v9 + 6) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(v9 + 85) = *(void *)(a2 + 85);
  uint64_t v11 = *(void *)(a2 + 72);
  uint64_t v12 = *(void *)(a2 + 80);
  *((void *)v9 + 9) = 0;
  *((void *)v9 + 10) = v12;
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(a2 + 56);
  *((void *)v9 + 9) = v11;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  int v13 = v9 + 96;
  uint64_t v14 = (char *)*a1;
  unint64_t v15 = (char *)a1[1];
  if (v15 == *a1)
  {
    *a1 = v9;
    a1[1] = v13;
    a1[2] = v10;
  }
  else
  {
    uint64_t v16 = 0;
    do
    {
      uint64_t v17 = &v9[v16];
      uint64_t v18 = &v15[v16];
      long long v19 = *(_OWORD *)&v15[v16 - 80];
      *((_OWORD *)v17 - 6) = *(_OWORD *)&v15[v16 - 96];
      *((_OWORD *)v17 - 5) = v19;
      *((void *)v17 - 7) = 0;
      *((void *)v17 - 6) = 0;
      *((_OWORD *)v17 - 4) = *(_OWORD *)&v15[v16 - 64];
      *((void *)v17 - 6) = *(void *)&v15[v16 - 48];
      *((void *)v18 - 8) = 0;
      *((void *)v18 - 7) = 0;
      *((void *)v18 - 6) = 0;
      *((void *)v17 - 4) = 0;
      *((void *)v17 - 3) = 0;
      *(_OWORD *)(v17 - 40) = *(_OWORD *)&v15[v16 - 40];
      *((void *)v17 - 3) = *(void *)&v15[v16 - 24];
      *((void *)v18 - 5) = 0;
      *((void *)v18 - 4) = 0;
      *((void *)v18 - 3) = 0;
      uint64_t v20 = *(void *)&v15[v16 - 16];
      *(void *)(v17 - 11) = *(void *)&v15[v16 - 11];
      *((void *)v17 - 2) = v20;
      v16 -= 96;
    }
    while (&v15[v16] != v14);
    unint64_t v15 = (char *)*a1;
    uint64_t v21 = (char *)a1[1];
    *a1 = &v9[v16];
    a1[1] = v13;
    a1[2] = v10;
    while (v21 != v15)
    {
      unint64_t v22 = (void *)*((void *)v21 - 5);
      if (v22)
      {
        *((void *)v21 - 4) = v22;
        operator delete(v22);
      }
      long long v23 = (void *)*((void *)v21 - 8);
      if (v23)
      {
        *((void *)v21 - 7) = v23;
        operator delete(v23);
      }
      v21 -= 96;
    }
  }
  if (v15) {
    operator delete(v15);
  }
  return v13;
}

void std::vector<std::sub_match<char const*>>::__append(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __x)
{
  std::vector<std::csub_match>::pointer end = this->__end_;
  value = this->__end_cap_.__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)end) >> 3) >= __n)
  {
    if (__n)
    {
      int v13 = &end[__n];
      std::vector<std::csub_match>::size_type v14 = 24 * __n;
      do
      {
        std::pair<const char *, const char *> v15 = __x->std::pair<const char *, const char *>;
        *(void *)&end->matched = *(void *)&__x->matched;
        end->std::pair<const char *, const char *> = v15;
        ++end;
        v14 -= 24;
      }
      while (v14);
      std::vector<std::csub_match>::pointer end = v13;
    }
    this->__end_ = end;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
    unint64_t v9 = v8 + __n;
    if (v8 + __n > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)this->__begin_) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      if (v11 > 0xAAAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v12 = (char *)operator new(24 * v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v16 = (std::sub_match<const char *> *)&v12[24 * v8];
    std::vector<std::csub_match>::size_type v17 = 24 * __n;
    uint64_t v18 = &v16[__n];
    long long v19 = v16;
    do
    {
      std::pair<const char *, const char *> v20 = __x->std::pair<const char *, const char *>;
      v19[1].char first = *(const char **)&__x->matched;
      *long long v19 = v20;
      long long v19 = (std::pair<const char *, const char *> *)((char *)v19 + 24);
      v17 -= 24;
    }
    while (v17);
    std::vector<std::csub_match>::pointer begin = this->__begin_;
    if (end != this->__begin_)
    {
      do
      {
        std::pair<const char *, const char *> v22 = end[-1].std::pair<const char *, const char *>;
        *(void *)&v16[-1].matched = *(void *)&end[-1].matched;
        v16[-1].std::pair<const char *, const char *> = v22;
        --v16;
        --end;
      }
      while (end != begin);
      std::vector<std::csub_match>::pointer end = this->__begin_;
    }
    this->__begin_ = v16;
    this->__end_ = v18;
    this->__end_cap_.__value_ = (std::sub_match<const char *> *)&v12[24 * v11];
    if (end)
    {
      operator delete(end);
    }
  }
}

uint64_t std::__state<char>::__state(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  long long v5 = a2[1];
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  uint64_t v7 = (unsigned char *)*((void *)a2 + 4);
  unint64_t v6 = (unsigned char *)*((void *)a2 + 5);
  int64_t v8 = v6 - v7;
  if (v6 != v7)
  {
    if (0xAAAAAAAAAAAAAAABLL * (v8 >> 3) >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = (char *)operator new(v8);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v9;
    *(void *)(a1 + 48) = &v9[8 * (v8 >> 3)];
    size_t v10 = 24 * ((v8 - 24) / 0x18uLL) + 24;
    memcpy(v9, v7, v10);
    *(void *)(a1 + 40) = &v9[v10];
  }
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  uint64_t v12 = (unsigned char *)*((void *)a2 + 7);
  unint64_t v11 = (unsigned char *)*((void *)a2 + 8);
  uint64_t v13 = v11 - v12;
  if (v11 != v12)
  {
    if (v13 < 0) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    std::vector<std::csub_match>::size_type v14 = (char *)operator new(v11 - v12);
    *(void *)(a1 + 56) = v14;
    *(void *)(a1 + 64) = v14;
    *(void *)(a1 + 72) = &v14[16 * (v13 >> 4)];
    size_t v15 = v13 & 0xFFFFFFFFFFFFFFF0;
    memcpy(v14, v12, v15);
    *(void *)(a1 + 64) = &v14[v15];
  }
  uint64_t v16 = *((void *)a2 + 10);
  *(void *)(a1 + 85) = *(void *)((char *)a2 + 85);
  *(void *)(a1 + 80) = v16;
  return a1;
}

void sub_21D839C20(_Unwind_Exception *exception_object)
{
  long long v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 64) = v5;
    operator delete(v5);
  }
  unint64_t v6 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 40) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C085B0](exception, 11);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21D839C98(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  unint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  operator delete(__p);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C085B0](exception, 3);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21D839DD8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  long long v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  uint64_t v5 = *a2;
  std::basic_regex<char>::value_type v6 = v5;
  switch((char)v5)
  {
    case '0':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 0;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 0);
        return v4 + 1;
      }
    case 'c':
      if (v4 + 1 == a3) {
        goto LABEL_81;
      }
      unsigned __int8 v8 = v4[1];
      if (((v8 & 0xDF) - 65) > 0x19u) {
        goto LABEL_81;
      }
      std::basic_regex<char>::value_type v9 = v8 & 0x1F;
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v9;
        *((unsigned char *)a4 + 1) = 0;
        return v4 + 2;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v9);
        return v4 + 2;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return v4 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return v4 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return v4 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return v4 + 1;
      }
    case 'u':
      if (v4 + 1 != a3)
      {
        int v10 = v4[1];
        if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38 || (v10 | 0x20u) - 97 < 6)
        {
          v4 += 2;
          if (v4 != a3)
          {
            int v11 = *v4;
            if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38 || (v11 | 0x20u) - 97 < 6) {
              goto LABEL_38;
            }
          }
        }
      }
      goto LABEL_81;
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char>::value_type v6 = 11;
LABEL_65:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v6);
        return v4 + 1;
      }
    case 'x':
LABEL_38:
      if (v4 + 1 == a3) {
        goto LABEL_81;
      }
      unsigned __int8 v12 = v4[1];
      char v13 = -48;
      if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38) {
        goto LABEL_43;
      }
      v12 |= 0x20u;
      if ((v12 - 97) >= 6u) {
        goto LABEL_81;
      }
      char v13 = -87;
LABEL_43:
      if (v4 + 2 == a3) {
        goto LABEL_81;
      }
      unsigned __int8 v14 = v4[2];
      char v15 = -48;
      if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38)
      {
        v14 |= 0x20u;
        if ((v14 - 97) >= 6u) {
LABEL_81:
        }
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
        char v15 = -87;
      }
      std::basic_regex<char>::value_type v16 = v14 + 16 * (v12 + v13) + v15;
      if (!a4)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v16);
        v4 += 3;
        return v4;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v16;
      *((unsigned char *)a4 + 1) = 0;
      uint64_t result = v4 + 3;
      break;
    default:
      if ((char)v5 == 95 || ((char)v5 & 0x80000000) == 0 && (a1->__traits_.__ct_->__tab_[v5] & 0x500) != 0) {
        goto LABEL_81;
      }
      if (!a4) {
        goto LABEL_65;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v5;
      *((unsigned char *)a4 + 1) = 0;
      return v4 + 1;
  }
  return result;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_char(std::basic_regex<char> *this, std::basic_regex<char>::value_type __c)
{
  uint64_t v2 = __c;
  std::basic_regex<_CharT, _Traits>::flag_type flags = this->__flags_;
  if (flags)
  {
    unsigned __int8 v8 = (char *)operator new(0x30uLL);
    char first = this->__end_->__first_;
    *(void *)unsigned __int8 v8 = &unk_26CE327E8;
    *((void *)v8 + 1) = first;
    std::locale::locale((std::locale *)v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    v8[40] = ((uint64_t (*)(const std::ctype<char> *, uint64_t))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v2);
LABEL_6:
    this->__end_->__first_ = (std::__node<char> *)v8;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    unsigned __int8 v8 = (char *)operator new(0x30uLL);
    int v10 = this->__end_->__first_;
    *(void *)unsigned __int8 v8 = &unk_26CE32830;
    *((void *)v8 + 1) = v10;
    std::locale::locale((std::locale *)v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    v8[40] = v2;
    goto LABEL_6;
  }
  uint64_t v5 = (std::__node<char> *)operator new(0x18uLL);
  std::vector<std::csub_match>::pointer end = this->__end_;
  uint64_t v7 = end->__first_;
  v5->__vftable = (std::__node<char>_vtbl *)&unk_26CE32878;
  v5[1].__vftable = (std::__node<char>_vtbl *)v7;
  LOBYTE(v5[2].__vftable) = v2;
  end->__first_ = v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void sub_21D83A524(_Unwind_Exception *a1)
{
  std::locale::~locale(v2);
  long long v4 = v1[1];
  if (v4) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  }
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C085B0](exception, 4);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21D83A5D0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(std::basic_regex<char> *this, int __i)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags = this->__flags_;
  if (flags)
  {
    unsigned __int8 v8 = (std::locale *)operator new(0x30uLL);
    std::basic_regex<char>::value_type v9 = v8;
    v8[1].__locale_ = (std::locale::__imp *)this->__end_->__first_;
    int v10 = (std::locale::__imp *)&unk_26CE328C0;
LABEL_6:
    v8->__locale_ = v10;
    std::locale::locale(v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)&this->__traits_.__ct_;
    LODWORD(v9[5].__locale_) = __i;
    this->__end_->__first_ = (std::__node<char> *)v9;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    unsigned __int8 v8 = (std::locale *)operator new(0x30uLL);
    std::basic_regex<char>::value_type v9 = v8;
    v8[1].__locale_ = (std::locale::__imp *)this->__end_->__first_;
    int v10 = (std::locale::__imp *)&unk_26CE32908;
    goto LABEL_6;
  }
  uint64_t v5 = (std::__node<char> *)operator new(0x18uLL);
  std::vector<std::csub_match>::pointer end = this->__end_;
  char first = end->__first_;
  v5->__vftable = (std::__node<char>_vtbl *)&unk_26CE32950;
  v5[1].__vftable = (std::__node<char>_vtbl *)first;
  LODWORD(v5[2].__vftable) = __i;
  end->__first_ = v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

std::locale *std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CE327E8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CE327E8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  operator delete(a1);
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unint64_t v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (uint64_t v4 = result,
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(result + 24) + 40))(*(void *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(void *)(a2 + 16);
    *(void *)(a2 + 80) = *(void *)(v4 + 8);
  }
  return result;
}

std::locale *std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CE32830;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CE32830;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  operator delete(a1);
}

uint64_t std::__match_char_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
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

void std::__match_char<char>::~__match_char(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  operator delete(__p);
}

uint64_t std::__match_char<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
  return result;
}

std::locale *std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CE328C0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CE328C0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  operator delete(a1);
}

uint64_t std::__back_ref_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (!*(unsigned char *)(v3 + 16)
    || (v4 = *(void *)(v3 + 8) - *(void *)v3, uint64_t v5 = *(void *)(a2 + 16), *(void *)(a2 + 24) - v5 < v4))
  {
LABEL_3:
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    return result;
  }
  uint64_t v6 = result;
  if (v4 >= 1)
  {
    uint64_t v7 = 0;
    while (1)
    {
      int v8 = (*(uint64_t (**)(void, void))(**(void **)(v6 + 24) + 40))(*(void *)(v6 + 24), *(char *)(*(void *)v3 + v7));
      uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(v6 + 24) + 40))(*(void *)(v6 + 24), *(char *)(*(void *)(a2 + 16) + v7));
      if (v8 != result) {
        goto LABEL_3;
      }
      if (v4 == ++v7)
      {
        uint64_t v5 = *(void *)(a2 + 16);
        break;
      }
    }
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 16) = v5 + v4;
  *(void *)(a2 + 80) = *(void *)(v6 + 8);
  return result;
}

std::locale *std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CE32908;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CE32908;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  operator delete(a1);
}

uint64_t std::__back_ref_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(result + 40) - 1;
  uint64_t v3 = *(void *)(a2 + 32);
  if (!*(unsigned char *)(v3 + 24 * v2 + 16)
    || (uint64_t v4 = (unsigned __int8 **)(v3 + 24 * v2),
        uint64_t v5 = *v4,
        uint64_t v6 = v4[1] - *v4,
        uint64_t v7 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v7 < v6))
  {
LABEL_3:
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    return result;
  }
  if (v6 >= 1)
  {
    uint64_t v8 = v6;
    std::basic_regex<char>::value_type v9 = *(unsigned __int8 **)(a2 + 16);
    do
    {
      int v11 = *v5++;
      int v10 = v11;
      int v12 = *v9++;
      if (v10 != v12) {
        goto LABEL_3;
      }
    }
    while (--v8);
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 16) = v7 + v6;
  *(void *)(a2 + 80) = *(void *)(result + 8);
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

void std::__back_ref<char>::~__back_ref(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  unsigned int v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  operator delete(__p);
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
    *(void *)(a2 + 80) = *((void *)v6 + 1);
  }
  else
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  return result;
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
      uint64_t v6 = *(unsigned char **)(a1 + 40);
      unint64_t v7 = v5 - v6;
      uint64_t v8 = v5 - v6 + 1;
      if (v8 >= 0)
      {
        unint64_t v9 = v4 - (void)v6;
        if (2 * v9 > v8) {
          uint64_t v8 = 2 * v9;
        }
        if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v10 = v8;
        }
        if (v10)
        {
          int v11 = operator new(v10);
          int v12 = &v11[v7];
          char v13 = &v11[v10];
          v11[v7] = v2;
          uint64_t v14 = (uint64_t)&v11[v7 + 1];
          if (v5 == v6) {
            goto LABEL_49;
          }
        }
        else
        {
          int v11 = 0;
          int v12 = (char *)(v5 - v6);
          char v13 = 0;
          *(unsigned char *)unint64_t v7 = v2;
          uint64_t v14 = v7 + 1;
          if (v5 == v6) {
            goto LABEL_49;
          }
        }
        if (v7 < 8 || (unint64_t)(v6 - v11) < 0x20) {
          goto LABEL_76;
        }
        if (v7 < 0x20)
        {
          unint64_t v21 = 0;
          goto LABEL_55;
        }
        unint64_t v21 = v7 & 0xFFFFFFFFFFFFFFE0;
        uint64_t v29 = (long long *)(v5 - 16);
        uint64_t v30 = &v11[v5 - 16 - v6];
        unint64_t v31 = v7 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v32 = *v29;
          *(v30 - 1) = *(v29 - 1);
          *uint64_t v30 = v32;
          v30 -= 2;
          v29 -= 2;
          v31 -= 32;
        }
        while (v31);
        if (v7 != v21)
        {
          if ((v7 & 0x18) == 0)
          {
            v12 -= v21;
            v5 -= v21;
            goto LABEL_76;
          }
LABEL_55:
          v12 -= v7 & 0xFFFFFFFFFFFFFFF8;
          size_t v33 = &v5[-v21 - 8];
          uint64_t v34 = &v11[v33 - v6];
          unint64_t v35 = v21 - (v7 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            uint64_t v36 = *(void *)v33;
            v33 -= 8;
            *v34-- = v36;
            v35 += 8;
          }
          while (v35);
          v5 -= v7 & 0xFFFFFFFFFFFFFFF8;
          if (v7 == (v7 & 0xFFFFFFFFFFFFFFF8)) {
            goto LABEL_86;
          }
LABEL_76:
          uint64_t v53 = v12 - 1;
          do
          {
            char v54 = *--v5;
            *v53-- = v54;
          }
          while (v5 != v6);
        }
LABEL_86:
        unsigned int v5 = *(unsigned char **)(a1 + 40);
        *(void *)(a1 + 40) = v11;
        *(void *)(a1 + 48) = v14;
        *(void *)(a1 + 56) = v13;
        if (!v5) {
          goto LABEL_50;
        }
        goto LABEL_87;
      }
LABEL_88:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
LABEL_24:
    *unsigned int v5 = v2;
    *(void *)(a1 + 48) = v5 + 1;
    return;
  }
  unsigned int v5 = *(unsigned char **)(a1 + 48);
  unint64_t v15 = *(void *)(a1 + 56);
  if (*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v5 < v15) {
      goto LABEL_24;
    }
    std::basic_regex<char>::value_type v16 = *(unsigned char **)(a1 + 40);
    unint64_t v17 = v5 - v16;
    uint64_t v18 = v5 - v16 + 1;
    if (v18 < 0) {
      goto LABEL_88;
    }
    unint64_t v19 = v15 - (void)v16;
    if (2 * v19 > v18) {
      uint64_t v18 = 2 * v19;
    }
    if (v19 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v20 = v18;
    }
    if (v20)
    {
      int v11 = operator new(v20);
      int v12 = &v11[v17];
      char v13 = &v11[v20];
      v11[v17] = v2;
      uint64_t v14 = (uint64_t)&v11[v17 + 1];
      if (v5 == v16) {
        goto LABEL_49;
      }
    }
    else
    {
      int v11 = 0;
      int v12 = (char *)(v5 - v16);
      char v13 = 0;
      *(unsigned char *)unint64_t v17 = a2;
      uint64_t v14 = v17 + 1;
      if (v5 == v16) {
        goto LABEL_49;
      }
    }
    if (v17 >= 8 && (unint64_t)(v16 - v11) >= 0x20)
    {
      if (v17 >= 0x20)
      {
        unint64_t v27 = v17 & 0xFFFFFFFFFFFFFFE0;
        uint64_t v37 = (long long *)(v5 - 16);
        uint64_t v38 = &v11[v5 - 16 - v16];
        unint64_t v39 = v17 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v40 = *v37;
          *(v38 - 1) = *(v37 - 1);
          *uint64_t v38 = v40;
          v38 -= 2;
          v37 -= 2;
          v39 -= 32;
        }
        while (v39);
        if (v17 == v27) {
          goto LABEL_86;
        }
        if ((v17 & 0x18) == 0)
        {
          v12 -= v27;
          v5 -= v27;
          goto LABEL_80;
        }
      }
      else
      {
        unint64_t v27 = 0;
      }
      v12 -= v17 & 0xFFFFFFFFFFFFFFF8;
      int v41 = &v5[-v27 - 8];
      uint64_t v42 = &v11[v41 - v16];
      unint64_t v43 = v27 - (v17 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v44 = *(void *)v41;
        v41 -= 8;
        *v42-- = v44;
        v43 += 8;
      }
      while (v43);
      v5 -= v17 & 0xFFFFFFFFFFFFFFF8;
      if (v17 == (v17 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_86;
      }
    }
LABEL_80:
    std::string v55 = v12 - 1;
    do
    {
      char v56 = *--v5;
      *v55-- = v56;
    }
    while (v5 != v16);
    goto LABEL_86;
  }
  if ((unint64_t)v5 < v15) {
    goto LABEL_24;
  }
  std::pair<const char *, const char *> v22 = *(unsigned char **)(a1 + 40);
  unint64_t v23 = v5 - v22;
  uint64_t v24 = v5 - v22 + 1;
  if (v24 < 0) {
    goto LABEL_88;
  }
  unint64_t v25 = v15 - (void)v22;
  if (2 * v25 > v24) {
    uint64_t v24 = 2 * v25;
  }
  if (v25 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v26 = v24;
  }
  if (!v26)
  {
    int v11 = 0;
    int v12 = (char *)(v5 - v22);
    char v13 = 0;
    *(unsigned char *)unint64_t v23 = a2;
    uint64_t v14 = v23 + 1;
    if (v5 == v22) {
      goto LABEL_49;
    }
LABEL_45:
    if (v23 < 8 || (unint64_t)(v22 - v11) < 0x20) {
      goto LABEL_84;
    }
    if (v23 >= 0x20)
    {
      unint64_t v28 = v23 & 0xFFFFFFFFFFFFFFE0;
      uint64_t v45 = (long long *)(v5 - 16);
      std::string::size_type v46 = &v11[v5 - 16 - v22];
      unint64_t v47 = v23 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        long long v48 = *v45;
        *(v46 - 1) = *(v45 - 1);
        _OWORD *v46 = v48;
        v46 -= 2;
        v45 -= 2;
        v47 -= 32;
      }
      while (v47);
      if (v23 == v28) {
        goto LABEL_86;
      }
      if ((v23 & 0x18) == 0)
      {
        v12 -= v28;
        v5 -= v28;
        goto LABEL_84;
      }
    }
    else
    {
      unint64_t v28 = 0;
    }
    v12 -= v23 & 0xFFFFFFFFFFFFFFF8;
    uint64_t v49 = &v5[-v28 - 8];
    long long v50 = &v11[v49 - v22];
    unint64_t v51 = v28 - (v23 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      uint64_t v52 = *(void *)v49;
      v49 -= 8;
      *v50-- = v52;
      v51 += 8;
    }
    while (v51);
    v5 -= v23 & 0xFFFFFFFFFFFFFFF8;
    if (v23 == (v23 & 0xFFFFFFFFFFFFFFF8)) {
      goto LABEL_86;
    }
LABEL_84:
    std::locale v57 = v12 - 1;
    do
    {
      char v58 = *--v5;
      *v57-- = v58;
    }
    while (v5 != v22);
    goto LABEL_86;
  }
  int v11 = operator new(v26);
  int v12 = &v11[v23];
  char v13 = &v11[v26];
  v11[v23] = v2;
  uint64_t v14 = (uint64_t)&v11[v23 + 1];
  if (v5 != v22) {
    goto LABEL_45;
  }
LABEL_49:
  *(void *)(a1 + 40) = v12;
  *(void *)(a1 + 48) = v14;
  *(void *)(a1 + 56) = v13;
  if (!v5)
  {
LABEL_50:
    *(void *)(a1 + 48) = v14;
    return;
  }
LABEL_87:
  operator delete(v5);
  *(void *)(a1 + 48) = v14;
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  *(void *)(a1 + 8) = a3;
  int v11 = (const std::locale *)(a1 + 16);
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
  std::locale::locale(&v16, v11);
  std::locale::name(&v17, &v16);
  std::string::size_type size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v17.__r_.__value_.__l.__size_;
  }
  if (size == 1)
  {
    char v13 = (std::string *)v17.__r_.__value_.__r.__words[0];
    if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      char v13 = &v17;
    }
    BOOL v14 = v13->__r_.__value_.__s.__data_[0] != 67;
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v14 = 1;
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
LABEL_9:
    }
      operator delete(v17.__r_.__value_.__l.__data_);
  }
  std::locale::~locale(&v16);
  *(unsigned char *)(a1 + 171) = v14;
  return a1;
}

void sub_21D83B700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::locale::~locale(&a9);
  std::vector<std::string>::~vector[abi:ne180100]((void **)(v9 + 136));
  unint64_t v15 = *(void **)(v9 + 112);
  if (v15)
  {
    *(void *)(v9 + 120) = v15;
    operator delete(v15);
    std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](v12);
    std::locale v16 = *(void **)(v9 + 64);
    if (!v16)
    {
LABEL_3:
      std::string v17 = *v13;
      if (!*v13) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else
  {
    std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](v12);
    std::locale v16 = *(void **)(v9 + 64);
    if (!v16) {
      goto LABEL_3;
    }
  }
  *(void *)(v9 + 72) = v16;
  operator delete(v16);
  std::string v17 = *v13;
  if (!*v13)
  {
LABEL_4:
    std::locale::~locale(v11);
    *(void *)uint64_t v9 = v10;
    uint64_t v18 = *(void *)(v9 + 8);
    if (!v18) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_8:
  *(void *)(v9 + 48) = v17;
  operator delete(v17);
  std::locale::~locale(v11);
  *(void *)uint64_t v9 = v10;
  uint64_t v18 = *(void *)(v9 + 8);
  if (!v18) {
LABEL_5:
  }
    _Unwind_Resume(a1);
LABEL_9:
  (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  _Unwind_Resume(a1);
}

void **std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](void **a1)
{
  char v2 = (void **)*a1;
  if (*a1)
  {
    uint64_t v3 = (void **)a1[1];
    unint64_t v4 = *a1;
    if (v3 == v2)
    {
LABEL_11:
      a1[1] = v2;
      operator delete(v4);
      return a1;
    }
    while (1)
    {
      if (*((char *)v3 - 1) < 0)
      {
        operator delete(*(v3 - 3));
        if (*((char *)v3 - 25) < 0) {
LABEL_9:
        }
          operator delete(*(v3 - 6));
      }
      else if (*((char *)v3 - 25) < 0)
      {
        goto LABEL_9;
      }
      v3 -= 6;
      if (v3 == v2)
      {
        unint64_t v4 = *a1;
        goto LABEL_11;
      }
    }
  }
  return a1;
}

uint64_t std::pair<std::string,std::string>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
  {
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      return a1;
    }
  }
  else if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    return a1;
  }
  operator delete(*(void **)a1);
  return a1;
}

std::locale *std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  locale = a1[17].__locale_;
  if (locale)
  {
    uint64_t v3 = a1[18].__locale_;
    unint64_t v4 = a1[17].__locale_;
    if (v3 != locale)
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*((void **)v3 - 3));
        }
        uint64_t v3 = (std::locale::__imp *)((char *)v3 - 24);
      }
      while (v3 != locale);
      unint64_t v4 = a1[17].__locale_;
    }
    a1[18].__locale_ = locale;
    operator delete(v4);
  }
  unsigned int v5 = a1[14].__locale_;
  if (v5)
  {
    a1[15].__locale_ = v5;
    operator delete(v5);
  }
  uint64_t v6 = a1[11].__locale_;
  if (v6)
  {
    unint64_t v7 = a1[12].__locale_;
    uint64_t v8 = a1[11].__locale_;
    if (v7 == v6)
    {
LABEL_21:
      a1[12].__locale_ = v6;
      operator delete(v8);
      goto LABEL_22;
    }
    while (1)
    {
      if (*((char *)v7 - 1) < 0)
      {
        operator delete(*((void **)v7 - 3));
        if (*((char *)v7 - 25) < 0) {
LABEL_19:
        }
          operator delete(*((void **)v7 - 6));
      }
      else if (*((char *)v7 - 25) < 0)
      {
        goto LABEL_19;
      }
      unint64_t v7 = (std::locale::__imp *)((char *)v7 - 48);
      if (v7 == v6)
      {
        uint64_t v8 = a1[11].__locale_;
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v9 = a1[8].__locale_;
  if (v9)
  {
    a1[9].__locale_ = v9;
    operator delete(v9);
  }
  uint64_t v10 = a1[5].__locale_;
  if (v10)
  {
    a1[6].__locale_ = v10;
    operator delete(v10);
  }
  std::locale::~locale(a1 + 2);
  int v11 = a1[1].__locale_;
  if (v11) {
    (*(void (**)(std::locale::__imp *))(*(void *)v11 + 8))(v11);
  }
  return a1;
}

void std::regex_traits<char>::__transform_primary<char *>(void *a1, uint64_t a2, unsigned char *__src, unsigned char *a4)
{
  size_t v4 = a4 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a4 - __src) >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v4 <= 0x16)
  {
    HIBYTE(__dst[2]) = (_BYTE)a4 - (_BYTE)__src;
    uint64_t v9 = __dst;
    if (__src == a4) {
      goto LABEL_9;
    }
LABEL_8:
    memcpy(v9, __src, v4);
    uint64_t v9 = (void **)((char *)v9 + v4);
    goto LABEL_9;
  }
  uint64_t v10 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v4 | 7) != 0x17) {
    uint64_t v10 = v4 | 7;
  }
  uint64_t v11 = v10 + 1;
  uint64_t v9 = (void **)operator new(v10 + 1);
  __dst[1] = (void *)v4;
  _OWORD __dst[2] = (void *)(v11 | 0x8000000000000000);
  __dst[0] = v9;
  if (__src != a4) {
    goto LABEL_8;
  }
LABEL_9:
  *(unsigned char *)uint64_t v9 = 0;
  memset(a1, 170, 24);
  int v12 = (char *)HIBYTE(__dst[2]);
  if (SHIBYTE(__dst[2]) >= 0) {
    char v13 = __dst;
  }
  else {
    char v13 = (void **)__dst[0];
  }
  if (SHIBYTE(__dst[2]) < 0) {
    int v12 = (char *)__dst[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a2 + 16) + 32))(*(void *)(a2 + 16), v13, &v12[(void)v13]);
  uint64_t v14 = *((unsigned __int8 *)a1 + 23);
  int v15 = (char)v14;
  if ((v14 & 0x80u) != 0) {
    uint64_t v14 = a1[1];
  }
  if (v14 == 1)
  {
LABEL_25:
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0) {
      return;
    }
    goto LABEL_26;
  }
  if (v14 == 12)
  {
    if (v15 >= 0) {
      std::locale v16 = a1;
    }
    else {
      std::locale v16 = (unsigned char *)*a1;
    }
    v16[11] = v16[3];
    if (SHIBYTE(__dst[2]) < 0) {
      goto LABEL_26;
    }
    return;
  }
  if ((v15 & 0x80000000) == 0)
  {
    *(unsigned char *)a1 = 0;
    *((unsigned char *)a1 + 23) = 0;
    goto LABEL_25;
  }
  *(unsigned char *)*a1 = 0;
  a1[1] = 0;
  if (SHIBYTE(__dst[2]) < 0) {
LABEL_26:
  }
    operator delete(__dst[0]);
}

void sub_21D83BBD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C085B0](exception, 5);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21D83BC34(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  if (a2 == a3) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  }
  switch(*a2)
  {
    case 'D':
      *(_DWORD *)(a5 + 164) |= 0x400u;
      uint64_t result = a2 + 1;
      break;
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'T':
    case 'U':
    case 'V':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '_':
    case 'a':
    case 'c':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
    case 't':
    case 'u':
    case 'v':
      goto LABEL_8;
    case 'S':
      *(_DWORD *)(a5 + 164) |= 0x4000u;
      uint64_t result = a2 + 1;
      break;
    case 'W':
      *(_DWORD *)(a5 + 164) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](a5);
      uint64_t result = a2 + 1;
      break;
    case 'b':
      if (*(char *)(a4 + 23) < 0)
      {
        *(void *)(a4 + 8) = 1;
        a4 = *(void *)a4;
      }
      else
      {
        *(unsigned char *)(a4 + 23) = 1;
      }
      *(_WORD *)a4 = 8;
      uint64_t result = a2 + 1;
      break;
    case 'd':
      *(_DWORD *)(a5 + 160) |= 0x400u;
      uint64_t result = a2 + 1;
      break;
    case 's':
      *(_DWORD *)(a5 + 160) |= 0x4000u;
      uint64_t result = a2 + 1;
      break;
    case 'w':
      *(_DWORD *)(a5 + 160) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
      uint64_t result = a2 + 1;
      break;
    default:
      if (*a2)
      {
LABEL_8:
        uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, a2, a3, (uint64_t *)a4);
      }
      else
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(void *)(a4 + 8) = 1;
          a4 = *(void *)a4;
        }
        else
        {
          *(unsigned char *)(a4 + 23) = 1;
        }
        *(unsigned char *)a4 = 0;
        *(unsigned char *)(a4 + 1) = 0;
        uint64_t result = a2 + 1;
      }
      break;
  }
  return result;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>(std::basic_regex<char> *a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3, uint64_t *a4)
{
  if (a2 == a3) {
LABEL_70:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  std::basic_regex<char>::value_type v5 = *a2;
  switch(*a2)
  {
    case '""':
    case '/':
    case '\\':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v5;
        *((unsigned char *)a4 + 1) = 0;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
        return a2 + 1;
      }
    case 'a':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 7;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 7);
        return a2 + 1;
      }
    case 'b':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 8);
        return a2 + 1;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return a2 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return a2 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return a2 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return a2 + 1;
      }
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 11);
        return a2 + 1;
      }
    default:
      if ((v5 & 0xF8) != 0x30) {
        goto LABEL_70;
      }
      std::basic_regex<char>::value_type v7 = *a2 - 48;
      uint64_t v8 = a2 + 1;
      if (a2 + 1 == a3)
      {
        uint64_t v8 = a3;
LABEL_42:
        if (a4) {
          goto LABEL_43;
        }
LABEL_69:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
        return v8;
      }
      if ((*v8 & 0xF8) != 0x30) {
        goto LABEL_42;
      }
      std::basic_regex<char>::value_type v7 = *v8 + 8 * v7 - 48;
      if (a2 + 2 == a3)
      {
        uint64_t v8 = a3;
        if (a4) {
          goto LABEL_43;
        }
        goto LABEL_69;
      }
      std::basic_regex<char>::value_type v9 = a2[2];
      int v10 = v9 & 0xF8;
      std::basic_regex<char>::value_type v11 = v9 + 8 * v7 - 48;
      if (v10 == 48) {
        uint64_t v8 = a2 + 3;
      }
      else {
        uint64_t v8 = a2 + 2;
      }
      if (v10 == 48) {
        std::basic_regex<char>::value_type v7 = v11;
      }
      if (!a4) {
        goto LABEL_69;
      }
LABEL_43:
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v7;
      *((unsigned char *)a4 + 1) = 0;
      return v8;
  }
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100](uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = (uint64_t)a2;
  if (!*(unsigned char *)(a1 + 170))
  {
    uint64_t v16 = a2[23];
    if (a2[23] < 0)
    {
      if (*((void *)a2 + 1) != 1) {
        goto LABEL_78;
      }
    }
    else if (v16 != 1)
    {
LABEL_78:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>();
    }
    if (*(char *)(a3 + 23) < 0)
    {
      if (*(void *)(a3 + 8) != 1) {
        goto LABEL_78;
      }
    }
    else if (*(unsigned char *)(a3 + 23) != 1)
    {
      goto LABEL_78;
    }
    if (!*(unsigned char *)(a1 + 169))
    {
LABEL_71:
      *(_OWORD *)std::vector<std::csub_match> __p = *(_OWORD *)v4;
      uint64_t v49 = *(void *)(v4 + 16);
      *(void *)(v4 + 8) = 0;
      *(void *)(v4 + 16) = 0;
      *(void *)uint64_t v4 = 0;
      *(_OWORD *)long long v50 = *(_OWORD *)v3;
      uint64_t v51 = *(void *)(v3 + 16);
      *(void *)(v3 + 8) = 0;
      *(void *)(v3 + 16) = 0;
      *(void *)uint64_t v3 = 0;
      unint64_t v39 = *(void *)(a1 + 96);
      if (v39 >= *(void *)(a1 + 104))
      {
        uint64_t v42 = std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>((void **)(a1 + 88), (uint64_t)__p);
        int v43 = SHIBYTE(v51);
        *(void *)(a1 + 96) = v42;
        if (v43 < 0)
        {
          operator delete(v50[0]);
          if ((SHIBYTE(v49) & 0x80000000) == 0) {
            return;
          }
        }
        else if ((SHIBYTE(v49) & 0x80000000) == 0)
        {
          return;
        }
      }
      else
      {
        long long v40 = *(_OWORD *)__p;
        *(void *)(v39 + 16) = v49;
        *(_OWORD *)unint64_t v39 = v40;
        __p[1] = 0;
        uint64_t v49 = 0;
        __p[0] = 0;
        uint64_t v41 = v51;
        *(_OWORD *)(v39 + 24) = *(_OWORD *)v50;
        *(void *)(v39 + 40) = v41;
        *(void *)(a1 + 96) = v39 + 48;
        if ((SHIBYTE(v49) & 0x80000000) == 0) {
          return;
        }
      }
      operator delete(__p[0]);
      return;
    }
    uint64_t v34 = a2;
    if ((v16 & 0x80) != 0) {
      uint64_t v34 = *(char **)a2;
    }
    char v35 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v34);
    if (*(char *)(v4 + 23) < 0)
    {
      **(unsigned char **)uint64_t v4 = v35;
      uint64_t v36 = (char *)v3;
      if ((*(char *)(v3 + 23) & 0x80000000) == 0) {
        goto LABEL_68;
      }
    }
    else
    {
      *(unsigned char *)uint64_t v4 = v35;
      uint64_t v36 = (char *)v3;
      if ((*(char *)(v3 + 23) & 0x80000000) == 0)
      {
LABEL_68:
        char v37 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v36);
        uint64_t v38 = (unsigned char *)v3;
        if (*(char *)(v3 + 23) < 0) {
          uint64_t v38 = *(unsigned char **)v3;
        }
        *uint64_t v38 = v37;
        goto LABEL_71;
      }
    }
    uint64_t v36 = *(char **)v3;
    goto LABEL_68;
  }
  if (*(unsigned char *)(a1 + 169))
  {
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v7 = *(unsigned __int8 *)(v4 + 23);
      if (*(char *)(v4 + 23) < 0)
      {
        if (i >= *(void *)(v4 + 8))
        {
LABEL_13:
          for (unint64_t j = 0; ; ++j)
          {
            unint64_t v12 = *(unsigned __int8 *)(v3 + 23);
            if (*(char *)(v3 + 23) < 0)
            {
              if (j >= *(void *)(v3 + 8)) {
                goto LABEL_44;
              }
            }
            else if (j >= v12)
            {
              goto LABEL_44;
            }
            uint64_t v13 = v3;
            if ((v12 & 0x80) != 0) {
              uint64_t v13 = *(void *)v3;
            }
            char v14 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *(char *)(v13 + j));
            uint64_t v15 = v3;
            if (*(char *)(v3 + 23) < 0) {
              uint64_t v15 = *(void *)v3;
            }
            *(unsigned char *)(v15 + j) = v14;
          }
        }
      }
      else if (i >= v7)
      {
        goto LABEL_13;
      }
      uint64_t v8 = v4;
      if ((v7 & 0x80) != 0) {
        uint64_t v8 = *(void *)v4;
      }
      char v9 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *(char *)(v8 + i));
      uint64_t v10 = v4;
      if (*(char *)(v4 + 23) < 0) {
        uint64_t v10 = *(void *)v4;
      }
      *(unsigned char *)(v10 + i) = v9;
    }
  }
  for (unint64_t k = 0; ; ++k)
  {
    unint64_t v19 = a2[23];
    if (a2[23] < 0) {
      break;
    }
    if (k >= v19) {
      goto LABEL_35;
    }
LABEL_33:
    uint64_t v18 = a2;
    if ((v19 & 0x80) != 0)
    {
      uint64_t v18 = *(char **)a2;
      size_t v20 = *(char **)a2;
    }
    else
    {
      size_t v20 = a2;
    }
    v20[k] = v18[k];
  }
  if (k < *((void *)a2 + 1)) {
    goto LABEL_33;
  }
LABEL_35:
  for (unint64_t m = 0; ; ++m)
  {
    unint64_t v23 = *(unsigned __int8 *)(a3 + 23);
    if (*(char *)(a3 + 23) < 0) {
      break;
    }
    if (m >= v23) {
      goto LABEL_44;
    }
LABEL_42:
    uint64_t v22 = a3;
    if ((v23 & 0x80) != 0)
    {
      uint64_t v22 = *(void *)a3;
      uint64_t v24 = *(void *)a3;
    }
    else
    {
      uint64_t v24 = a3;
    }
    *(unsigned char *)(v24 + m) = *(unsigned char *)(v22 + m);
  }
  if (m < *(void *)(a3 + 8)) {
    goto LABEL_42;
  }
LABEL_44:
  if (*(char *)(v4 + 23) < 0)
  {
    uint64_t v26 = v4;
    uint64_t v4 = *(void *)v4;
    uint64_t v25 = *(void *)(v26 + 8);
  }
  else
  {
    uint64_t v25 = *(unsigned __int8 *)(v4 + 23);
  }
  std::regex_traits<char>::transform<std::__wrap_iter<char *>>((uint64_t)v46, a1 + 16, v4, (char *)(v4 + v25));
  if (*(char *)(v3 + 23) < 0)
  {
    uint64_t v28 = v3;
    uint64_t v3 = *(void *)v3;
    uint64_t v27 = *(void *)(v28 + 8);
  }
  else
  {
    uint64_t v27 = *(unsigned __int8 *)(v3 + 23);
  }
  std::regex_traits<char>::transform<std::__wrap_iter<char *>>((uint64_t)v44, a1 + 16, v3, (char *)(v3 + v27));
  *(_OWORD *)std::vector<std::csub_match> __p = *(_OWORD *)v46;
  uint64_t v49 = v47;
  v46[1] = 0;
  uint64_t v47 = 0;
  *(_OWORD *)long long v50 = *(_OWORD *)v44;
  uint64_t v51 = v45;
  v44[0] = 0;
  v44[1] = 0;
  uint64_t v45 = 0;
  v46[0] = 0;
  unint64_t v29 = *(void *)(a1 + 96);
  if (v29 >= *(void *)(a1 + 104))
  {
    long long v32 = std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>((void **)(a1 + 88), (uint64_t)__p);
    int v33 = SHIBYTE(v51);
    *(void *)(a1 + 96) = v32;
    if (v33 < 0)
    {
      operator delete(v50[0]);
      if ((SHIBYTE(v49) & 0x80000000) == 0) {
        goto LABEL_57;
      }
    }
    else if ((SHIBYTE(v49) & 0x80000000) == 0)
    {
      goto LABEL_57;
    }
LABEL_52:
    operator delete(__p[0]);
    if (SHIBYTE(v45) < 0) {
      goto LABEL_53;
    }
LABEL_58:
    if (SHIBYTE(v47) < 0) {
LABEL_59:
    }
      operator delete(v46[0]);
  }
  else
  {
    long long v30 = *(_OWORD *)__p;
    *(void *)(v29 + 16) = v49;
    *(_OWORD *)unint64_t v29 = v30;
    __p[1] = 0;
    uint64_t v49 = 0;
    __p[0] = 0;
    uint64_t v31 = v51;
    *(_OWORD *)(v29 + 24) = *(_OWORD *)v50;
    *(void *)(v29 + 40) = v31;
    *(void *)(a1 + 96) = v29 + 48;
    if (SHIBYTE(v49) < 0) {
      goto LABEL_52;
    }
LABEL_57:
    if ((SHIBYTE(v45) & 0x80000000) == 0) {
      goto LABEL_58;
    }
LABEL_53:
    operator delete(v44[0]);
    if (SHIBYTE(v47) < 0) {
      goto LABEL_59;
    }
  }
}

void sub_21D83C980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::pair<std::string,std::string>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21D83C994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 169))
  {
    unsigned __int8 v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    __int16 v6 = v5 | (unsigned __int16)((*(unsigned __int16 (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a3) << 8);
    uint64_t v8 = *(char **)(a1 + 120);
    unint64_t v7 = *(void *)(a1 + 128);
    if ((unint64_t)v8 >= v7)
    {
      char v9 = *(char **)(a1 + 112);
      uint64_t v10 = v8 - v9;
      if (v8 - v9 > -3)
      {
        uint64_t v11 = v10 >> 1;
        unint64_t v12 = v7 - (void)v9;
        if (v12 <= (v10 >> 1) + 1) {
          unint64_t v13 = v11 + 1;
        }
        else {
          unint64_t v13 = v12;
        }
        if (v12 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v14 = v13;
        }
        if (!v14)
        {
          uint64_t v15 = 0;
          uint64_t v16 = (_WORD *)(2 * v11);
          std::string v17 = 0;
          *(_WORD *)(2 * v11) = v6;
          uint64_t v18 = 2 * v11 + 2;
          unint64_t v19 = (char *)(v8 - v9);
          if (v8 == v9) {
            goto LABEL_64;
          }
LABEL_30:
          unint64_t v29 = (unint64_t)(v19 - 2);
          if (v29 < 0x1E) {
            goto LABEL_71;
          }
          if (v8 - v15 - (v10 & 0xFFFFFFFFFFFFFFFELL) < 0x20) {
            goto LABEL_71;
          }
          uint64_t v30 = (v29 >> 1) + 1;
          unint64_t v31 = 2 * (v30 & 0xFFFFFFFFFFFFFFF0);
          long long v32 = &v8[-v31];
          uint64_t v16 = (_WORD *)((char *)v16 - v31);
          int v33 = &v15[2 * v11 - 16];
          uint64_t v34 = v8 - 16;
          unint64_t v35 = v30 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            long long v36 = *(_OWORD *)v34;
            *(v33 - 1) = *((_OWORD *)v34 - 1);
            _OWORD *v33 = v36;
            v33 -= 2;
            v34 -= 32;
            v35 -= 16;
          }
          while (v35);
          uint64_t v8 = v32;
          if (v30 != (v30 & 0xFFFFFFFFFFFFFFF0))
          {
LABEL_71:
            do
            {
              __int16 v37 = *((_WORD *)v8 - 1);
              v8 -= 2;
              *--uint64_t v16 = v37;
            }
            while (v8 != v9);
          }
LABEL_63:
          uint64_t v8 = *(char **)(a1 + 112);
          goto LABEL_64;
        }
        if ((v14 & 0x8000000000000000) == 0)
        {
          uint64_t v15 = operator new(2 * v14);
          uint64_t v16 = &v15[2 * v11];
          std::string v17 = &v15[2 * v14];
          *uint64_t v16 = v6;
          uint64_t v18 = (uint64_t)(v16 + 1);
          unint64_t v19 = (char *)(v8 - v9);
          if (v8 == v9) {
            goto LABEL_64;
          }
          goto LABEL_30;
        }
LABEL_68:
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
LABEL_67:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
LABEL_28:
    *(_WORD *)uint64_t v8 = v6;
    uint64_t v18 = (uint64_t)(v8 + 2);
    goto LABEL_66;
  }
  __int16 v6 = a2 | (unsigned __int16)((_WORD)a3 << 8);
  uint64_t v8 = *(char **)(a1 + 120);
  unint64_t v20 = *(void *)(a1 + 128);
  if (*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v8 < v20) {
      goto LABEL_28;
    }
    unint64_t v21 = *(char **)(a1 + 112);
    uint64_t v22 = v8 - v21;
    if (v8 - v21 <= -3) {
      goto LABEL_67;
    }
    uint64_t v23 = v22 >> 1;
    unint64_t v24 = v20 - (void)v21;
    if (v24 <= (v22 >> 1) + 1) {
      unint64_t v25 = v23 + 1;
    }
    else {
      unint64_t v25 = v24;
    }
    if (v24 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v26 = v25;
    }
    if (v26)
    {
      if (v26 < 0) {
        goto LABEL_68;
      }
      uint64_t v27 = operator new(2 * v26);
      uint64_t v16 = &v27[2 * v23];
      std::string v17 = &v27[2 * v26];
      *uint64_t v16 = v6;
      uint64_t v18 = (uint64_t)(v16 + 1);
      uint64_t v28 = (char *)(v8 - v21);
      if (v8 == v21) {
        goto LABEL_64;
      }
    }
    else
    {
      uint64_t v27 = 0;
      uint64_t v16 = (_WORD *)(2 * v23);
      std::string v17 = 0;
      *(_WORD *)(2 * v23) = v6;
      uint64_t v18 = 2 * v23 + 2;
      uint64_t v28 = (char *)(v8 - v21);
      if (v8 == v21) {
        goto LABEL_64;
      }
    }
    unint64_t v46 = (unint64_t)(v28 - 2);
    if (v46 < 0x1E) {
      goto LABEL_72;
    }
    if (v8 - v27 - (v22 & 0xFFFFFFFFFFFFFFFELL) < 0x20) {
      goto LABEL_72;
    }
    uint64_t v47 = (v46 >> 1) + 1;
    unint64_t v48 = 2 * (v47 & 0xFFFFFFFFFFFFFFF0);
    uint64_t v49 = &v8[-v48];
    uint64_t v16 = (_WORD *)((char *)v16 - v48);
    long long v50 = &v27[2 * v23 - 16];
    uint64_t v51 = v8 - 16;
    unint64_t v52 = v47 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      long long v53 = *(_OWORD *)v51;
      *(v50 - 1) = *((_OWORD *)v51 - 1);
      *long long v50 = v53;
      v50 -= 2;
      v51 -= 32;
      v52 -= 16;
    }
    while (v52);
    uint64_t v8 = v49;
    if (v47 != (v47 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_72:
      do
      {
        __int16 v54 = *((_WORD *)v8 - 1);
        v8 -= 2;
        *--uint64_t v16 = v54;
      }
      while (v8 != v21);
    }
    goto LABEL_63;
  }
  if ((unint64_t)v8 < v20) {
    goto LABEL_28;
  }
  uint64_t v38 = *(char **)(a1 + 112);
  uint64_t v39 = v8 - v38;
  if (v8 - v38 <= -3) {
    goto LABEL_67;
  }
  uint64_t v40 = v39 >> 1;
  unint64_t v41 = v20 - (void)v38;
  if (v41 <= (v39 >> 1) + 1) {
    unint64_t v42 = v40 + 1;
  }
  else {
    unint64_t v42 = v41;
  }
  if (v41 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v43 = v42;
  }
  if (!v43)
  {
    uint64_t v44 = 0;
    uint64_t v16 = (_WORD *)(2 * v40);
    std::string v17 = 0;
    *(_WORD *)(2 * v40) = v6;
    uint64_t v18 = 2 * v40 + 2;
    uint64_t v45 = (char *)(v8 - v38);
    if (v8 == v38) {
      goto LABEL_64;
    }
    goto LABEL_57;
  }
  if (v43 < 0) {
    goto LABEL_68;
  }
  uint64_t v44 = operator new(2 * v43);
  uint64_t v16 = &v44[2 * v40];
  std::string v17 = &v44[2 * v43];
  *uint64_t v16 = v6;
  uint64_t v18 = (uint64_t)(v16 + 1);
  uint64_t v45 = (char *)(v8 - v38);
  if (v8 != v38)
  {
LABEL_57:
    unint64_t v55 = (unint64_t)(v45 - 2);
    if (v55 < 0x1E) {
      goto LABEL_73;
    }
    if (v8 - v44 - (v39 & 0xFFFFFFFFFFFFFFFELL) < 0x20) {
      goto LABEL_73;
    }
    uint64_t v56 = (v55 >> 1) + 1;
    unint64_t v57 = 2 * (v56 & 0xFFFFFFFFFFFFFFF0);
    char v58 = &v8[-v57];
    uint64_t v16 = (_WORD *)((char *)v16 - v57);
    long long v59 = &v44[2 * v40 - 16];
    char v60 = v8 - 16;
    unint64_t v61 = v56 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      long long v62 = *(_OWORD *)v60;
      *(v59 - 1) = *((_OWORD *)v60 - 1);
      *long long v59 = v62;
      v59 -= 2;
      v60 -= 32;
      v61 -= 16;
    }
    while (v61);
    uint64_t v8 = v58;
    if (v56 != (v56 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_73:
      do
      {
        __int16 v63 = *((_WORD *)v8 - 1);
        v8 -= 2;
        *--uint64_t v16 = v63;
      }
      while (v8 != v38);
    }
    goto LABEL_63;
  }
LABEL_64:
  *(void *)(a1 + 112) = v16;
  *(void *)(a1 + 120) = v18;
  *(void *)(a1 + 128) = v17;
  if (v8) {
    operator delete(v8);
  }
LABEL_66:
  *(void *)(a1 + 120) = v18;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C085B0](exception, 1);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21D83CE04(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::regex_traits<char>::__lookup_collatename<char const*>(uint64_t a1, uint64_t a2, unsigned char *__src, unsigned char *a4)
{
  size_t v4 = a4 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a4 - __src) >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v4 <= 0x16)
  {
    __dst[23] = (_BYTE)a4 - (_BYTE)__src;
    char v9 = __dst;
    if (__src == a4) {
      goto LABEL_9;
    }
LABEL_8:
    memcpy(v9, __src, v4);
    v9 += v4;
    goto LABEL_9;
  }
  uint64_t v10 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v4 | 7) != 0x17) {
    uint64_t v10 = v4 | 7;
  }
  uint64_t v11 = v10 + 1;
  char v9 = operator new(v10 + 1);
  *(void *)&__dst[8] = v4;
  *(void *)&__dst[16] = v11 | 0x8000000000000000;
  *(void *)stat __dst = v9;
  if (__src != a4) {
    goto LABEL_8;
  }
LABEL_9:
  *char v9 = 0;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  if ((__dst[23] & 0x80000000) != 0)
  {
    unint64_t v12 = *(char **)__dst;
    if (!*(void *)&__dst[8]) {
      goto LABEL_18;
    }
  }
  else
  {
    if (!__dst[23]) {
      return;
    }
    unint64_t v12 = __dst;
  }
  std::__get_collation_name(&v19, v12);
  *(_OWORD *)a1 = *(_OWORD *)&v19.__r_.__value_.__l.__data_;
  unint64_t v13 = v19.__r_.__value_.__r.__words[2];
  *(void *)(a1 + 16) = *((void *)&v19.__r_.__value_.__l + 2);
  unint64_t v14 = HIBYTE(v13);
  if ((v14 & 0x80u) != 0) {
    unint64_t v14 = *(void *)(a1 + 8);
  }
  if (v14) {
    goto LABEL_16;
  }
  if ((__dst[23] & 0x80000000) != 0)
  {
    unint64_t v12 = *(char **)__dst;
    if (*(void *)&__dst[8] < 3uLL)
    {
LABEL_24:
      (*(void (**)(std::string *__return_ptr))(**(void **)(a2 + 16) + 32))(&v19);
      if (*(char *)(a1 + 23) < 0) {
        operator delete(*(void **)a1);
      }
      *(std::string *)a1 = v19;
      if (*(char *)(a1 + 23) < 0)
      {
        uint64_t v16 = *(void *)(a1 + 8);
        if (v16 == 1 || v16 == 12)
        {
          if (__dst != (unsigned char *)a1)
          {
            if (__dst[23] >= 0) {
              std::string v17 = __dst;
            }
            else {
              std::string v17 = *(unsigned char **)__dst;
            }
            if (__dst[23] >= 0) {
              size_t v18 = __dst[23];
            }
            else {
              size_t v18 = *(void *)&__dst[8];
            }
            std::string::__assign_no_alias<false>((void **)a1, v17, v18);
          }
        }
        else
        {
          **(unsigned char **)a1 = 0;
          *(void *)(a1 + 8) = 0;
        }
      }
      else
      {
        int v15 = *(unsigned __int8 *)(a1 + 23);
        if (v15 == 1 || v15 == 12)
        {
          if (__dst != (unsigned char *)a1)
          {
            if ((__dst[23] & 0x80000000) != 0)
            {
              std::string::__assign_no_alias<true>((void *)a1, *(void **)__dst, *(size_t *)&__dst[8]);
            }
            else
            {
              *(_OWORD *)a1 = *(_OWORD *)__dst;
              *(void *)(a1 + 16) = *(void *)&__dst[16];
            }
          }
        }
        else
        {
          *(unsigned char *)a1 = 0;
          *(unsigned char *)(a1 + 23) = 0;
        }
      }
LABEL_16:
      if ((__dst[23] & 0x80000000) == 0) {
        return;
      }
      unint64_t v12 = *(char **)__dst;
    }
LABEL_18:
    operator delete(v12);
    return;
  }
  if (__dst[23] < 3u) {
    goto LABEL_24;
  }
}

void sub_21D83D08C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0)
  {
    operator delete(*(void **)v17);
    if ((a17 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a17 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(unsigned char **a1, uint64_t a2, uint64_t a3, char *a4)
{
  unint64_t v4 = (unint64_t)&a4[-a3];
  memset(__p, 170, sizeof(__p));
  if ((unint64_t)&a4[-a3] >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v4 > 0x16)
  {
    uint64_t v16 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v16 = v4 | 7;
    }
    uint64_t v17 = v16 + 1;
    char v9 = operator new(v16 + 1);
    __p[1] = (void *)v4;
    __p[2] = (void *)(v17 | 0x8000000000000000);
    __p[0] = v9;
    if ((char *)a3 != a4) {
      goto LABEL_4;
    }
LABEL_13:
    uint64_t v10 = v9;
    goto LABEL_16;
  }
  HIBYTE(__p[2]) = (_BYTE)a4 - a3;
  char v9 = __p;
  if ((char *)a3 == a4) {
    goto LABEL_13;
  }
LABEL_4:
  if (v4 < 0x20 || (unint64_t)v9 - a3 < 0x20)
  {
    uint64_t v10 = v9;
    uint64_t v11 = (char *)a3;
  }
  else
  {
    uint64_t v10 = (char *)v9 + (v4 & 0xFFFFFFFFFFFFFFE0);
    uint64_t v11 = (char *)(a3 + (v4 & 0xFFFFFFFFFFFFFFE0));
    unint64_t v12 = (long long *)(a3 + 16);
    unint64_t v13 = v9 + 1;
    unint64_t v14 = v4 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      _OWORD *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 32;
    }
    while (v14);
    if (v4 == (v4 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_16;
    }
  }
  do
  {
    char v18 = *v11++;
    *v10++ = v18;
  }
  while (v11 != a4);
LABEL_16:
  unsigned char *v10 = 0;
  memset(a1, 170, 24);
  std::string v19 = (char *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0) {
    unint64_t v20 = __p;
  }
  else {
    unint64_t v20 = (void **)__p[0];
  }
  if (SHIBYTE(__p[2]) < 0) {
    std::string v19 = (char *)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a2 + 16) + 32))(*(void *)(a2 + 16), v20, &v19[(void)v20]);
  unint64_t v21 = (unsigned char *)*((unsigned __int8 *)a1 + 23);
  int v22 = (char)v21;
  if ((char)v21 < 0) {
    unint64_t v21 = a1[1];
  }
  if (v21 == (unsigned char *)1) {
    goto LABEL_32;
  }
  if (v21 != (unsigned char *)12)
  {
    if (v22 < 0)
    {
      **a1 = 0;
      a1[1] = 0;
      if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
        return;
      }
LABEL_35:
      operator delete(__p[0]);
      return;
    }
    *(unsigned char *)a1 = 0;
    *((unsigned char *)a1 + 23) = 0;
LABEL_32:
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
      return;
    }
    goto LABEL_35;
  }
  if (v22 >= 0) {
    uint64_t v23 = a1;
  }
  else {
    uint64_t v23 = *a1;
  }
  v23[11] = v23[3];
  if (SHIBYTE(__p[2]) < 0) {
    goto LABEL_35;
  }
}

void sub_21D83D2DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C085B0](exception, 2);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21D83D33C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), 95);
    char v3 = v2;
    unsigned __int8 v5 = *(unsigned char **)(a1 + 72);
    unint64_t v4 = *(void *)(a1 + 80);
    if ((unint64_t)v5 < v4)
    {
      *unsigned __int8 v5 = v2;
      *(void *)(a1 + 72) = v5 + 1;
      return;
    }
    unint64_t v14 = *(unsigned char **)(a1 + 64);
    unint64_t v15 = v5 - v14;
    uint64_t v16 = v5 - v14 + 1;
    if (v16 >= 0)
    {
      unint64_t v17 = v4 - (void)v14;
      if (2 * v17 > v16) {
        uint64_t v16 = 2 * v17;
      }
      if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v18 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v18 = v16;
      }
      if (v18)
      {
        std::string v19 = operator new(v18);
        unint64_t v20 = &v19[v15];
        unint64_t v21 = &v19[v18];
        v19[v15] = v3;
        uint64_t v22 = (uint64_t)&v19[v15 + 1];
        if (v5 != v14)
        {
LABEL_22:
          if (v15 < 8 || (unint64_t)(v14 - v19) < 0x20) {
            goto LABEL_78;
          }
          if (v15 >= 0x20)
          {
            unint64_t v23 = v15 & 0xFFFFFFFFFFFFFFE0;
            uint64_t v34 = (long long *)(v5 - 16);
            unint64_t v35 = &v19[v5 - 16 - v14];
            unint64_t v36 = v15 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v37 = *v34;
              *(v35 - 1) = *(v34 - 1);
              *unint64_t v35 = v37;
              v35 -= 2;
              v34 -= 2;
              v36 -= 32;
            }
            while (v36);
            if (v15 == v23)
            {
LABEL_80:
              unsigned __int8 v5 = *(unsigned char **)(a1 + 64);
              *(void *)(a1 + 64) = v19;
              *(void *)(a1 + 72) = v22;
              *(void *)(a1 + 80) = v21;
              if (!v5)
              {
LABEL_82:
                *(void *)(a1 + 72) = v22;
                return;
              }
LABEL_81:
              operator delete(v5);
              goto LABEL_82;
            }
            if ((v15 & 0x18) == 0)
            {
              v20 -= v23;
              v5 -= v23;
              goto LABEL_78;
            }
          }
          else
          {
            unint64_t v23 = 0;
          }
          v20 -= v15 & 0xFFFFFFFFFFFFFFF8;
          uint64_t v38 = &v5[-v23 - 8];
          uint64_t v39 = &v19[v38 - v14];
          unint64_t v40 = v23 - (v15 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            uint64_t v41 = *(void *)v38;
            v38 -= 8;
            *v39-- = v41;
            v40 += 8;
          }
          while (v40);
          v5 -= v15 & 0xFFFFFFFFFFFFFFF8;
          if (v15 == (v15 & 0xFFFFFFFFFFFFFFF8)) {
            goto LABEL_80;
          }
LABEL_78:
          char v58 = v20 - 1;
          do
          {
            char v59 = *--v5;
            *v58-- = v59;
          }
          while (v5 != v14);
          goto LABEL_80;
        }
      }
      else
      {
        std::string v19 = 0;
        unint64_t v20 = (char *)(v5 - v14);
        unint64_t v21 = 0;
        *(unsigned char *)unint64_t v15 = v3;
        uint64_t v22 = v15 + 1;
        if (v5 != v14) {
          goto LABEL_22;
        }
      }
      *(void *)(a1 + 64) = v20;
      *(void *)(a1 + 72) = v22;
      *(void *)(a1 + 80) = v21;
      if (!v5) {
        goto LABEL_82;
      }
      goto LABEL_81;
    }
LABEL_92:
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  unint64_t v7 = *(unsigned char **)(a1 + 72);
  unint64_t v6 = *(void *)(a1 + 80);
  if (!*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v7 < v6) {
      goto LABEL_27;
    }
    unint64_t v24 = *(unsigned char **)(a1 + 64);
    unint64_t v25 = v7 - v24;
    uint64_t v26 = v7 - v24 + 1;
    if (v26 < 0) {
      goto LABEL_92;
    }
    unint64_t v27 = v6 - (void)v24;
    if (2 * v27 > v26) {
      uint64_t v26 = 2 * v27;
    }
    if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v28 = v26;
    }
    if (v28) {
      unint64_t v13 = operator new(v28);
    }
    else {
      unint64_t v13 = 0;
    }
    unint64_t v29 = &v13[v25];
    uint64_t v30 = &v13[v28];
    v13[v25] = 95;
    uint64_t v31 = (uint64_t)&v13[v25 + 1];
    if (v7 == v24) {
      goto LABEL_51;
    }
    if (v25 >= 8 && (unint64_t)(v24 - v13) >= 0x20)
    {
      if (v25 >= 0x20)
      {
        unint64_t v33 = v25 & 0xFFFFFFFFFFFFFFE0;
        long long v50 = (long long *)(v7 - 16);
        uint64_t v51 = &v13[v7 - 16 - v24];
        unint64_t v52 = v25 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v53 = *v50;
          *(v51 - 1) = *(v50 - 1);
          *uint64_t v51 = v53;
          v51 -= 2;
          v50 -= 2;
          v52 -= 32;
        }
        while (v52);
        if (v25 == v33) {
          goto LABEL_90;
        }
        if ((v25 & 0x18) == 0)
        {
          v29 -= v33;
          v7 -= v33;
          goto LABEL_88;
        }
      }
      else
      {
        unint64_t v33 = 0;
      }
      v29 -= v25 & 0xFFFFFFFFFFFFFFF8;
      __int16 v54 = &v7[-v33 - 8];
      unint64_t v55 = &v13[v54 - v24];
      unint64_t v56 = v33 - (v25 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v57 = *(void *)v54;
        v54 -= 8;
        *v55-- = v57;
        v56 += 8;
      }
      while (v56);
      v7 -= v25 & 0xFFFFFFFFFFFFFFF8;
      if (v25 == (v25 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_90;
      }
    }
LABEL_88:
    long long v62 = v29 - 1;
    do
    {
      char v63 = *--v7;
      *v62-- = v63;
    }
    while (v7 != v24);
    goto LABEL_90;
  }
  if ((unint64_t)v7 < v6)
  {
LABEL_27:
    *unint64_t v7 = 95;
    *(void *)(a1 + 72) = v7 + 1;
    return;
  }
  uint64_t v8 = *(unsigned char **)(a1 + 64);
  unint64_t v9 = v7 - v8;
  uint64_t v10 = v7 - v8 + 1;
  if (v10 < 0) {
    goto LABEL_92;
  }
  unint64_t v11 = v6 - (void)v8;
  if (2 * v11 > v10) {
    uint64_t v10 = 2 * v11;
  }
  if (v11 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v12 = v10;
  }
  if (v12) {
    unint64_t v13 = operator new(v12);
  }
  else {
    unint64_t v13 = 0;
  }
  unint64_t v29 = &v13[v9];
  uint64_t v30 = &v13[v12];
  v13[v9] = 95;
  uint64_t v31 = (uint64_t)&v13[v9 + 1];
  if (v7 != v8)
  {
    if (v9 < 8 || (unint64_t)(v8 - v13) < 0x20) {
      goto LABEL_84;
    }
    if (v9 < 0x20)
    {
      unint64_t v32 = 0;
      goto LABEL_65;
    }
    unint64_t v32 = v9 & 0xFFFFFFFFFFFFFFE0;
    unint64_t v42 = (long long *)(v7 - 16);
    uint64_t v43 = &v13[v7 - 16 - v8];
    unint64_t v44 = v9 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v45 = *v42;
      *(v43 - 1) = *(v42 - 1);
      *uint64_t v43 = v45;
      v43 -= 2;
      v42 -= 2;
      v44 -= 32;
    }
    while (v44);
    if (v9 != v32)
    {
      if ((v9 & 0x18) == 0)
      {
        v29 -= v32;
        v7 -= v32;
        goto LABEL_84;
      }
LABEL_65:
      v29 -= v9 & 0xFFFFFFFFFFFFFFF8;
      unint64_t v46 = &v7[-v32 - 8];
      uint64_t v47 = &v13[v46 - v8];
      unint64_t v48 = v32 - (v9 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v49 = *(void *)v46;
        v46 -= 8;
        *v47-- = v49;
        v48 += 8;
      }
      while (v48);
      v7 -= v9 & 0xFFFFFFFFFFFFFFF8;
      if (v9 == (v9 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_90;
      }
LABEL_84:
      char v60 = v29 - 1;
      do
      {
        char v61 = *--v7;
        *v60-- = v61;
      }
      while (v7 != v8);
    }
LABEL_90:
    unint64_t v7 = *(unsigned char **)(a1 + 64);
    *(void *)(a1 + 64) = v13;
    *(void *)(a1 + 72) = v31;
    *(void *)(a1 + 80) = v30;
    if (v7) {
      goto LABEL_91;
    }
LABEL_52:
    *(void *)(a1 + 72) = v31;
    return;
  }
LABEL_51:
  *(void *)(a1 + 64) = v29;
  *(void *)(a1 + 72) = v31;
  *(void *)(a1 + 80) = v30;
  if (!v7) {
    goto LABEL_52;
  }
LABEL_91:
  operator delete(v7);
  *(void *)(a1 + 72) = v31;
}

void std::regex_traits<char>::transform<std::__wrap_iter<char *>>(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  unint64_t v4 = (unint64_t)&a4[-a3];
  memset(__p, 170, sizeof(__p));
  if ((unint64_t)&a4[-a3] >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v4 > 0x16)
  {
    uint64_t v15 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v15 = v4 | 7;
    }
    uint64_t v16 = v15 + 1;
    uint64_t v8 = operator new(v15 + 1);
    __p[1] = (void *)v4;
    __p[2] = (void *)(v16 | 0x8000000000000000);
    __p[0] = v8;
    if ((char *)a3 != a4) {
      goto LABEL_4;
    }
LABEL_13:
    unint64_t v9 = v8;
    goto LABEL_16;
  }
  HIBYTE(__p[2]) = (_BYTE)a4 - a3;
  uint64_t v8 = __p;
  if ((char *)a3 == a4) {
    goto LABEL_13;
  }
LABEL_4:
  if (v4 < 0x20 || (unint64_t)v8 - a3 < 0x20)
  {
    unint64_t v9 = v8;
    uint64_t v10 = (char *)a3;
  }
  else
  {
    unint64_t v9 = (char *)v8 + (v4 & 0xFFFFFFFFFFFFFFE0);
    uint64_t v10 = (char *)(a3 + (v4 & 0xFFFFFFFFFFFFFFE0));
    unint64_t v11 = (long long *)(a3 + 16);
    size_t v12 = v8 + 1;
    unint64_t v13 = v4 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v14 = *v11;
      *(v12 - 1) = *(v11 - 1);
      *size_t v12 = v14;
      v11 += 2;
      v12 += 2;
      v13 -= 32;
    }
    while (v13);
    if (v4 == (v4 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_16;
    }
  }
  do
  {
    char v17 = *v10++;
    *v9++ = v17;
  }
  while (v10 != a4);
LABEL_16:
  *unint64_t v9 = 0;
  size_t v18 = (char *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0) {
    std::string v19 = __p;
  }
  else {
    std::string v19 = (void **)__p[0];
  }
  if (SHIBYTE(__p[2]) < 0) {
    size_t v18 = (char *)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a2 + 16) + 32))(*(void *)(a2 + 16), v19, &v18[(void)v19]);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
}

void sub_21D83D9C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C085B0](exception, 9);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21D83DA20(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>(void **a1, uint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 4);
  unint64_t v3 = v2 + 1;
  if (v2 + 1 > 0x555555555555555) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4) > v3) {
    unint64_t v3 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v6 = 0x555555555555555;
  }
  else {
    unint64_t v6 = v3;
  }
  if (v6)
  {
    if (v6 > 0x555555555555555) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    unint64_t v7 = (char *)operator new(48 * v6);
  }
  else
  {
    unint64_t v7 = 0;
  }
  uint64_t v8 = &v7[48 * v2];
  *((void *)v8 + 2) = *(void *)(a2 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)a2;
  unint64_t v9 = &v7[48 * v6];
  long long v10 = *(_OWORD *)(a2 + 24);
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_OWORD *)(v8 + 24) = v10;
  *((void *)v8 + 5) = *(void *)(a2 + 40);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  unint64_t v11 = v8 + 48;
  size_t v12 = (void **)*a1;
  unint64_t v13 = (void **)a1[1];
  if (v13 != *a1)
  {
    do
    {
      long long v14 = *((_OWORD *)v13 - 3);
      *((void *)v8 - 4) = *(v13 - 4);
      *((_OWORD *)v8 - 3) = v14;
      *(v13 - 5) = 0;
      *(v13 - 4) = 0;
      *(v13 - 6) = 0;
      long long v15 = *(_OWORD *)(v13 - 3);
      *((void *)v8 - 1) = *(v13 - 1);
      *(_OWORD *)(v8 - 24) = v15;
      v8 -= 48;
      *(v13 - 2) = 0;
      *(v13 - 1) = 0;
      *(v13 - 3) = 0;
      v13 -= 6;
    }
    while (v13 != v12);
    unint64_t v13 = (void **)*a1;
    uint64_t v16 = (void **)a1[1];
    *a1 = v8;
    a1[1] = v11;
    a1[2] = v9;
    while (1)
    {
      if (v16 == v13) {
        goto LABEL_22;
      }
      if (*((char *)v16 - 1) < 0)
      {
        operator delete(*(v16 - 3));
        if ((*((char *)v16 - 25) & 0x80000000) == 0) {
          goto LABEL_14;
        }
      }
      else if ((*((char *)v16 - 25) & 0x80000000) == 0)
      {
        goto LABEL_14;
      }
      operator delete(*(v16 - 6));
LABEL_14:
      v16 -= 6;
    }
  }
  *a1 = v8;
  a1[1] = v11;
  a1[2] = v9;
LABEL_22:
  if (v13) {
    operator delete(v13);
  }
  return v11;
}

void (__cdecl ***std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  unint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  operator delete(__p);
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
  unint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  unint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  operator delete(__p);
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

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C085B0](exception, 8);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21D83DE4C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C085B0](exception, 7);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21D83DEA4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26CE32AD0;
  uint64_t v2 = a1[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  unint64_t v3 = a1[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }
  return a1;
}

void std::__loop<char>::~__loop(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  *std::vector<std::csub_match> __p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26CE32AD0;
  uint64_t v2 = __p[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  unint64_t v3 = __p[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }
  operator delete(__p);
}

uint64_t std::__loop<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  if (*(unsigned __int8 *)(result + 52) == a2)
  {
    *(void *)(a3 + 80) = *(void *)(result + 16);
    return result;
  }
  *(void *)(a3 + 80) = *(void *)(result + 8);
  int v3 = *(_DWORD *)(result + 44);
  *(void *)(*(void *)(a3 + 56) + 16 * *(unsigned int *)(result + 40) + 8) = *(void *)(a3 + 16);
  int v4 = *(_DWORD *)(result + 48);
  if (v3 != v4)
  {
    uint64_t v5 = (v4 - 1);
    uint64_t v6 = (v3 - 1);
    uint64_t v7 = *(void *)(a3 + 24);
    uint64_t v8 = *(void *)(a3 + 32);
    uint64_t v9 = v5 - v6;
    if ((unint64_t)(v5 - v6) < 2)
    {
      uint64_t v10 = v6;
LABEL_9:
      uint64_t v13 = v5 - v10;
      long long v14 = (unsigned char *)(v8 + 24 * v10 + 16);
      do
      {
        *((void *)v14 - 2) = v7;
        *((void *)v14 - 1) = v7;
        *long long v14 = 0;
        v14 += 24;
        --v13;
      }
      while (v13);
      return result;
    }
    uint64_t v10 = (v9 & 0xFFFFFFFFFFFFFFFELL) + v6;
    uint64_t v11 = v8 + 24 * v6 + 24;
    unint64_t v12 = v9 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      *(void *)(v11 - 24) = v7;
      *(void *)(v11 - 16) = v7;
      *(void *)uint64_t v11 = v7;
      *(void *)(v11 + 8) = v7;
      *(unsigned char *)(v11 - 8) = 0;
      *(unsigned char *)(v11 + 16) = 0;
      v11 += 48;
      v12 -= 2;
    }
    while (v12);
    if (v9 != (v9 & 0xFFFFFFFFFFFFFFFELL)) {
      goto LABEL_9;
    }
  }
  return result;
}

void (__cdecl ***std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26CE32AD0;
  uint64_t v2 = a1[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  int v3 = a1[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }
  return a1;
}

void std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  *std::vector<std::csub_match> __p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26CE32AD0;
  uint64_t v2 = __p[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  int v3 = __p[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }
  operator delete(__p);
}

void (__cdecl ***std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26CE32AD0;
  uint64_t v2 = a1[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  int v3 = a1[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }
  return a1;
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
  MEMORY[0x223C085B0](exception, 15);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21D83E384(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  if (a2 != a3)
  {
    uint64_t v7 = a2 + 1;
    int v6 = *a2;
    if (a2 + 1 != a3 || v6 != 36)
    {
      if ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v6);
        return (unsigned __int8 *)(a2 + 1);
      }
      if (v7 == a3 || v6 != 92)
      {
        if (v6 == 46)
        {
          char v17 = operator new(0x10uLL);
          uint64_t v18 = *(void *)(a1 + 56);
          uint64_t v19 = *(void *)(v18 + 8);
          *char v17 = &unk_26CE32BD8;
          v17[1] = v19;
LABEL_39:
          *(void *)(v18 + 8) = v17;
          *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
          return (unsigned __int8 *)v7;
        }
      }
      else
      {
        int v16 = *v7;
        if ((v16 - 36) <= 0x3A && ((1 << (v16 - 36)) & 0x580000000000441) != 0)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v16);
          return (unsigned __int8 *)(a2 + 2);
        }
      }
    }
  }
  uint64_t v8 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>(a1, a2, a3);
  uint64_t v7 = v8;
  if (v8 != a2 || v8 == a3) {
    return (unsigned __int8 *)v7;
  }
  if (a2 + 1 == a3 || *a2 != 92) {
    return (unsigned __int8 *)a2;
  }
  int v9 = a2[1];
  if (v9 != 40)
  {
    if (((v9 & 0xF8) == 0x30 || (v9 & 0xFE) == 0x38) && (v9 - 49) <= 8)
    {
      if ((v9 - 48) > *(_DWORD *)(a1 + 28)) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_back_ref((std::basic_regex<char> *)a1, v9 - 48);
      return (unsigned __int8 *)(a2 + 2);
    }
    return (unsigned __int8 *)a2;
  }
  uint64_t v10 = (std::basic_regex<char> *)(a2 + 2);
  if ((*(unsigned char *)(a1 + 24) & 2) != 0)
  {
    int v12 = *(_DWORD *)(a1 + 28);
  }
  else
  {
    uint64_t v11 = operator new(0x18uLL);
    int v12 = *(_DWORD *)(a1 + 28) + 1;
    *(_DWORD *)(a1 + 28) = v12;
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v14 = *(void *)(v13 + 8);
    *uint64_t v11 = &unk_26CE329E0;
    v11[1] = v14;
    *((_DWORD *)v11 + 4) = v12;
    *(void *)(v13 + 8) = v11;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
  }
  do
  {
    if (v10 == (std::basic_regex<char> *)a3) {
      goto LABEL_41;
    }
    unint64_t v21 = v10;
    uint64_t v22 = *(std::__owns_one_state<char> **)(a1 + 56);
    int v23 = *(_DWORD *)(a1 + 28);
    unint64_t v24 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(a1, v21, a3);
    if (v24 == v21) {
      break;
    }
    uint64_t v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>((std::basic_regex<char> *)a1, v24, (std::basic_regex<char> *)a3, v22, (v23 + 1), (*(_DWORD *)(a1 + 28) + 1));
  }
  while (v10 != v21);
  if ((char *)&v21->__traits_.__loc_.__locale_ + 1 == a3
    || LOBYTE(v21->__traits_.__loc_.__locale_) != 92
    || BYTE1(v21->__traits_.__loc_.__locale_) != 41)
  {
LABEL_41:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
  }
  uint64_t v7 = (char *)v21 + 2 * (BYTE1(v21->__traits_.__loc_.__locale_) == 41);
  if ((*(unsigned char *)(a1 + 24) & 2) == 0)
  {
    char v17 = operator new(0x18uLL);
    uint64_t v18 = *(void *)(a1 + 56);
    uint64_t v25 = *(void *)(v18 + 8);
    *char v17 = &unk_26CE32A28;
    v17[1] = v25;
    *((_DWORD *)v17 + 4) = v12;
    goto LABEL_39;
  }
  return (unsigned __int8 *)v7;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  int v6 = this;
  if (this == a3) {
    return v6;
  }
  int locale_low = LOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low == 42)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, 0, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
    return (std::basic_regex<char> *)((char *)v6 + 1);
  }
  if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3
    || locale_low != 92
    || BYTE1(this->__traits_.__loc_.__locale_) != 123)
  {
    return v6;
  }
  int v9 = (std::basic_regex<char> *)((char *)this + 2 * (BYTE1(this->__traits_.__loc_.__locale_) == 123));
  if (v9 == a3) {
    goto LABEL_43;
  }
  int v10 = LOBYTE(v9->__traits_.__loc_.__locale_);
  if ((v10 & 0xF8) != 0x30 && (v10 & 0xFE) != 0x38) {
    goto LABEL_43;
  }
  int v11 = v10 - 48;
  int v12 = (std::basic_regex<char> *)((char *)&v9->__traits_.__loc_.__locale_ + 1);
  if ((std::basic_regex<char> *)((char *)&v9->__traits_.__loc_.__locale_ + 1) == a3)
  {
LABEL_16:
    int v12 = a3;
  }
  else
  {
    while (1)
    {
      int v13 = LOBYTE(v12->__traits_.__loc_.__locale_);
      if ((v13 & 0xF8) != 0x30 && (v13 & 0xFE) != 0x38) {
        break;
      }
      if (v11 >= 214748364) {
        goto LABEL_43;
      }
      int v11 = v13 + 10 * v11 - 48;
      int v12 = (std::basic_regex<char> *)((char *)v12 + 1);
      if (v12 == a3) {
        goto LABEL_16;
      }
    }
  }
  if (v12 == v9) {
    goto LABEL_43;
  }
  if (v12 == a3) {
    goto LABEL_41;
  }
  uint64_t v14 = (std::basic_regex<char> *)((char *)&v12->__traits_.__loc_.__locale_ + 1);
  int v15 = LOBYTE(v12->__traits_.__loc_.__locale_);
  if (v15 != 44)
  {
    if (v14 != a3 && v15 == 92 && LOBYTE(v14->__traits_.__loc_.__locale_) == 125)
    {
      uint64_t v19 = (unsigned __int8 *)&v12->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v11, v11, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v19;
    }
    goto LABEL_41;
  }
  if (v14 == a3) {
    goto LABEL_41;
  }
  int v16 = LOBYTE(v14->__traits_.__loc_.__locale_);
  if ((v16 & 0xF8) == 0x30 || (v16 & 0xFE) == 0x38)
  {
    uint64_t v14 = (std::basic_regex<char> *)((char *)&v12->__traits_.__loc_.__locale_ + 2);
    if ((std::basic_regex<char> *)((char *)&v12->__traits_.__loc_.__locale_ + 2) == a3) {
      goto LABEL_41;
    }
    int v17 = v16 - 48;
    while (1)
    {
      int v16 = LOBYTE(v14->__traits_.__loc_.__locale_);
      if ((v16 & 0xF8) != 0x30 && (v16 & 0xFE) != 0x38) {
        break;
      }
      if (v17 >= 214748364) {
        goto LABEL_43;
      }
      int v17 = v16 + 10 * v17 - 48;
      uint64_t v14 = (std::basic_regex<char> *)((char *)v14 + 1);
      if (v14 == a3) {
        goto LABEL_41;
      }
    }
  }
  else
  {
    int v17 = -1;
  }
  if (v14 == a3
    || (std::basic_regex<char> *)((char *)&v14->__traits_.__loc_.__locale_ + 1) == a3
    || v16 != 92
    || BYTE1(v14->__traits_.__loc_.__locale_) != 125)
  {
LABEL_41:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
  }
  uint64_t v18 = (unsigned __int8 *)v14 + 2 * (BYTE1(v14->__traits_.__loc_.__locale_) == 125);
  if (v17 != -1)
  {
    if (v17 >= v11)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v11, v17, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v18;
    }
LABEL_43:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v11, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
  return (std::basic_regex<char> *)v18;
}

void (__cdecl ***std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_any<char>::~__match_any(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  operator delete(__p);
}

uint64_t std::__match_any<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned char **)(a2 + 16);
  if (v2 == *(unsigned char **)(a2 + 24) || !*v2)
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
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

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(std::basic_regex<char> *this, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  std::vector<std::csub_match>::pointer end = this->__end_;
  unsigned int marked_count = this->__marked_count_;
  if (a2 != a3)
  {
    int v8 = *a2;
    switch(*a2)
    {
      case '$':
      case '(':
      case '*':
      case '+':
      case '.':
      case '?':
      case '[':
      case '\\':
      case '^':
      case '{':
      case '|':
        goto LABEL_3;
      case ')':
        if (!this->__open_count_) {
          goto LABEL_8;
        }
LABEL_3:
        int v9 = a2 + 1;
        if (a2 + 1 != a3 && v8 == 92)
        {
          std::basic_regex<char>::value_type v10 = *v9;
          switch(*v9)
          {
            case '$':
            case '(':
            case ')':
            case '*':
            case '+':
            case '.':
            case '?':
            case '[':
            case '\\':
            case '^':
            case '{':
            case '|':
            case '}':
              std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v10);
              int v11 = (std::basic_regex<char> *)(a2 + 2);
              goto LABEL_37;
            default:
              if ((this->__flags_ & 0x1F0) == 0x40)
              {
                int v11 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>(this, v9, a3, 0);
              }
              else
              {
                BOOL v12 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(this, v10);
                uint64_t v13 = 2;
                if (!v12) {
                  uint64_t v13 = 0;
                }
                int v11 = (std::basic_regex<char> *)&a2[v13];
              }
              if (v11 != (std::basic_regex<char> *)a2) {
                goto LABEL_19;
              }
              int v8 = *a2;
              break;
          }
        }
        if (v8 != 46) {
          goto LABEL_18;
        }
        uint64_t v14 = (std::__node<char> *)operator new(0x10uLL);
        int v15 = this->__end_;
        char first = v15->__first_;
        v14->__vftable = (std::__node<char>_vtbl *)&unk_26CE32BD8;
        v14[1].__vftable = (std::__node<char>_vtbl *)first;
        v15->__first_ = v14;
        break;
      default:
LABEL_8:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v8);
        int v11 = (std::basic_regex<char> *)(a2 + 1);
        goto LABEL_37;
    }
    goto LABEL_27;
  }
LABEL_18:
  int v11 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
LABEL_19:
  if (v11 != (std::basic_regex<char> *)a2 || v11 == (std::basic_regex<char> *)a3) {
    goto LABEL_36;
  }
  int v17 = *a2;
  if (v17 == 36)
  {
    uint64_t v18 = (std::__node<char> *)operator new(0x18uLL);
    BOOL v19 = (this->__flags_ & 0x5F0) == 1024;
    unint64_t v20 = this->__end_;
    v18[1].__vftable = (std::__node<char>_vtbl *)v20->__first_;
    unint64_t v21 = (std::__node<char>_vtbl *)&unk_26CE326C8;
    goto LABEL_26;
  }
  if (v17 == 40)
  {
    if ((this->__flags_ & 2) != 0)
    {
      unsigned int v23 = this->__marked_count_;
    }
    else
    {
      uint64_t v22 = (std::__node<char> *)operator new(0x18uLL);
      unsigned int v23 = this->__marked_count_ + 1;
      this->__marked_count_ = v23;
      unint64_t v24 = this->__end_;
      uint64_t v25 = v24->__first_;
      v22->__vftable = (std::__node<char>_vtbl *)&unk_26CE329E0;
      v22[1].__vftable = (std::__node<char>_vtbl *)v25;
      LODWORD(v22[2].__vftable) = v23;
      v24->__first_ = v22;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
    }
    ++this->__open_count_;
    uint64_t v26 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(this, a2 + 1, a3);
    if (v26 == a3 || (unint64_t v27 = v26, *v26 != 41)) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    if ((this->__flags_ & 2) == 0)
    {
      size_t v28 = (std::__node<char> *)operator new(0x18uLL);
      unint64_t v29 = this->__end_;
      uint64_t v30 = v29->__first_;
      v28->__vftable = (std::__node<char>_vtbl *)&unk_26CE32A28;
      v28[1].__vftable = (std::__node<char>_vtbl *)v30;
      LODWORD(v28[2].__vftable) = v23;
      v29->__first_ = v28;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
    }
    --this->__open_count_;
    int v11 = (std::basic_regex<char> *)(v27 + 1);
LABEL_36:
    if (v11 != (std::basic_regex<char> *)a2) {
      goto LABEL_37;
    }
    return (std::basic_regex<char> *)a2;
  }
  if (v17 != 94) {
    return (std::basic_regex<char> *)a2;
  }
  uint64_t v18 = (std::__node<char> *)operator new(0x18uLL);
  BOOL v19 = (this->__flags_ & 0x5F0) == 1024;
  unint64_t v20 = this->__end_;
  v18[1].__vftable = (std::__node<char>_vtbl *)v20->__first_;
  unint64_t v21 = (std::__node<char>_vtbl *)&unk_26CE32680;
LABEL_26:
  v18->__vftable = v21;
  LOBYTE(v18[2].__vftable) = v19;
  v20->__first_ = v18;
LABEL_27:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  int v11 = (std::basic_regex<char> *)(a2 + 1);
LABEL_37:
  size_t v31 = this->__marked_count_ + 1;
  return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)this, v11, (std::basic_regex<char> *)a3, end, marked_count + 1, v31);
}

void std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5)
{
  char v5 = a5;
  uint64_t v10 = a4[6];
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3);
  uint64_t v13 = *(char **)a1;
  BOOL v12 = *(char **)(a1 + 8);
  unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v12[-*(void *)a1] >> 3);
  unint64_t v15 = v11 - v14;
  if (v11 > v14)
  {
    uint64_t v16 = *(void *)(a1 + 16);
    if (0xAAAAAAAAAAAAAAABLL * ((v16 - (uint64_t)v12) >> 3) >= v15)
    {
      uint64_t v22 = &v12[24 * v15];
      uint64_t v27 = 8 * ((a4[1] - *a4) >> 3) - 8 * ((uint64_t)&v12[-*(void *)a1] >> 3);
      do
      {
        *(void *)BOOL v12 = 0;
        *((void *)v12 + 1) = 0;
        std::locale v12[16] = 0;
        v12 += 24;
        v27 -= 24;
      }
      while (v27);
      *(void *)(a1 + 8) = v22;
      goto LABEL_24;
    }
    if (v11 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((v16 - (uint64_t)v13) >> 3);
    unint64_t v18 = 0x5555555555555556 * ((v16 - (uint64_t)v13) >> 3);
    if (v18 <= v11) {
      unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3);
    }
    if (v17 >= 0x555555555555555) {
      unint64_t v19 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v19 = v18;
    }
    if (v19 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    unint64_t v20 = (char *)operator new(24 * v19);
    unint64_t v21 = &v20[24 * v14];
    uint64_t v22 = &v20[24 * v11];
    uint64_t v23 = 24 * v11 - 24 * v14;
    unint64_t v24 = v21;
    do
    {
      *(void *)unint64_t v24 = 0;
      *((void *)v24 + 1) = 0;
      v24[16] = 0;
      v24 += 24;
      v23 -= 24;
    }
    while (v23);
    uint64_t v25 = &v20[24 * v19];
    if (v12 == v13)
    {
      char v5 = a5;
      *(void *)a1 = v21;
      *(void *)(a1 + 8) = v22;
      *(void *)(a1 + 16) = v25;
      if (!v12)
      {
LABEL_24:
        uint64_t v13 = *(char **)a1;
        BOOL v12 = v22;
        goto LABEL_25;
      }
    }
    else
    {
      char v5 = a5;
      do
      {
        long long v26 = *(_OWORD *)(v12 - 24);
        *((void *)v21 - 1) = *((void *)v12 - 1);
        *(_OWORD *)(v21 - 24) = v26;
        v21 -= 24;
        v12 -= 24;
      }
      while (v12 != v13);
      BOOL v12 = v13;
      *(void *)a1 = v21;
      *(void *)(a1 + 8) = v22;
      *(void *)(a1 + 16) = v25;
      if (!v13) {
        goto LABEL_24;
      }
    }
    operator delete(v12);
    uint64_t v22 = *(char **)(a1 + 8);
    goto LABEL_24;
  }
  if (v11 < v14)
  {
    BOOL v12 = &v13[8 * ((a4[1] - *a4) >> 3)];
    *(void *)(a1 + 8) = v12;
  }
LABEL_25:
  if (v12 != v13)
  {
    unint64_t v28 = 0;
    unint64_t v29 = 0;
    uint64_t v31 = *a4;
    uint64_t v30 = a4[1];
    do
    {
      unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * ((v30 - v31) >> 3);
      unint64_t v33 = (void *)(v31 + v28);
      if (v32 <= v29) {
        uint64_t v34 = a4 + 3;
      }
      else {
        uint64_t v34 = v33;
      }
      *(void *)&v13[v28] = a2 + *v34 - v10;
      if (0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3) <= v29) {
        unint64_t v35 = a4 + 3;
      }
      else {
        unint64_t v35 = (uint64_t *)(*a4 + v28);
      }
      *(void *)(*(void *)a1 + v28 + 8) = a2 + v35[1] - v10;
      uint64_t v31 = *a4;
      uint64_t v30 = a4[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v30 - *a4) >> 3) <= v29) {
        unint64_t v36 = a4 + 3;
      }
      else {
        unint64_t v36 = (uint64_t *)(*a4 + v28);
      }
      uint64_t v13 = *(char **)a1;
      uint64_t v37 = *(void *)(a1 + 8);
      *(unsigned char *)(*(void *)a1 + v28 + 16) = *((unsigned char *)v36 + 16);
      ++v29;
      v28 += 24;
    }
    while (v29 < 0xAAAAAAAAAAAAAAABLL * ((v37 - (uint64_t)v13) >> 3));
  }
  *(void *)(a1 + 24) = a3;
  *(void *)(a1 + 32) = a3;
  *(unsigned char *)(a1 + 40) = 0;
  uint64_t v38 = a2 + a4[6] - v10;
  *(void *)(a1 + 48) = v38;
  *(void *)(a1 + 56) = a2 + a4[7] - v10;
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a4 + 64);
  *(void *)(a1 + 72) = a2 + a4[9] - v10;
  *(void *)(a1 + 80) = a2 + a4[10] - v10;
  *(unsigned char *)(a1 + 88) = *((unsigned char *)a4 + 88);
  if ((v5 & 1) == 0) {
    *(void *)(a1 + 104) = v38;
  }
  *(unsigned char *)(a1 + 96) = *((unsigned char *)a4 + 96);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  long long v164 = 0u;
  long long v165 = 0u;
  long long v163 = 0u;
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6) {
    goto LABEL_152;
  }
  *(_DWORD *)long long v162 = 0;
  memset(&v162[8], 0, 85);
  std::deque<std::__state<char>>::__add_back_capacity((uint64_t)&v163);
  unint64_t v11 = *(void *)(*((void *)&v163 + 1) + 8 * (((void)v165 + *((void *)&v165 + 1)) / 0x2AuLL))
      + 96 * (((void)v165 + *((void *)&v165 + 1)) % 0x2AuLL);
  long long v12 = *(_OWORD *)&v162[16];
  *(_OWORD *)unint64_t v11 = *(_OWORD *)v162;
  *(_OWORD *)(v11 + 16) = v12;
  *(void *)(v11 + 40) = 0;
  *(void *)(v11 + 48) = 0;
  *(void *)(v11 + 32) = 0;
  memset(&v162[32], 0, 24);
  *(void *)(v11 + 56) = 0;
  *(void *)(v11 + 64) = 0;
  *(void *)(v11 + 72) = 0;
  memset(&v162[56], 0, 24);
  uint64_t v13 = *(void *)&v162[80];
  *(void *)(v11 + 85) = *(void *)&v162[85];
  *(void *)(v11 + 80) = v13;
  uint64_t v15 = *((void *)&v165 + 1);
  uint64_t v14 = v165;
  uint64_t v16 = ++*((void *)&v165 + 1);
  uint64_t v17 = *((void *)&v163 + 1);
  unint64_t v18 = *(unsigned int *)(a1 + 32);
  unint64_t v19 = v165 + v15;
  unint64_t v20 = 8 * (v19 / 0x2A);
  unint64_t v21 = 96 * (v19 % 0x2A);
  unint64_t v22 = *(void *)(*((void *)&v163 + 1) + v20) + v21;
  *(_DWORD *)unint64_t v22 = 0;
  *(void *)(v22 + 8) = a2;
  *(void *)(*(void *)(v17 + v20) + v21 + 16) = a2;
  *(void *)(*(void *)(v17 + v20) + v21 + 24) = a3;
  unint64_t v23 = *(void *)(v17 + v20) + v21;
  uint64_t v26 = *(void *)(v23 + 56);
  unint64_t v24 = (std::vector<std::pair<unsigned long, const char *>> *)(v23 + 56);
  uint64_t v25 = v26;
  unint64_t v27 = ((uint64_t)v24->__end_ - v26) >> 4;
  std::string v152 = a4;
  if (v18 <= v27)
  {
    if (v18 < v27) {
      v24->__end_ = (std::vector<std::pair<unsigned long, const char *>>::pointer)(v25 + 16 * v18);
    }
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append(v24, v18 - v27);
    uint64_t v16 = *((void *)&v165 + 1);
    uint64_t v14 = v165;
    uint64_t v17 = *((void *)&v163 + 1);
  }
  uint64_t v155 = 0;
  char v156 = 0;
  unsigned int v28 = 0;
  unint64_t v29 = v14 + v16 - 1;
  unint64_t v30 = 8 * (v29 / 0x2A);
  unint64_t v31 = 96 * (v29 % 0x2A);
  *(void *)(*(void *)(v17 + v30) + v31 + 80) = v6;
  uint64_t v154 = a3;
  uint64_t v161 = a3 - a2;
  unint64_t v32 = *(void *)(v17 + v30) + v31;
  *(_DWORD *)(v32 + 88) = a5;
  *(unsigned char *)(v32 + 92) = a6;
  while (2)
  {
    if ((++v28 & 0xFFF) == 0 && (int)(v28 >> 12) >= (int)v161) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    }
    unint64_t v34 = v16 + v165 - 1;
    uint64_t v35 = *(void *)(*((void *)&v163 + 1) + 8 * (v34 / 0x2A));
    unint64_t v36 = v34 % 0x2A;
    uint64_t v37 = v35 + 96 * (v34 % 0x2A);
    uint64_t v39 = (void *)(v37 + 80);
    uint64_t v38 = *(void *)(v37 + 80);
    if (v38) {
      (*(void (**)(uint64_t, unint64_t))(*(void *)v38 + 16))(v38, v35 + 96 * v36);
    }
    switch(*(_DWORD *)v37)
    {
      case 0xFFFFFC18:
        uint64_t v40 = *(void *)(v35 + 96 * v36 + 16);
        if ((a5 & 0x20) != 0 && v40 == a2 || (a5 & 0x1000) != 0 && v40 != v154)
        {
          unint64_t v41 = *((void *)&v165 + 1) + v165 - 1;
          uint64_t v42 = *(void *)(*((void *)&v163 + 1) + 8 * (v41 / 0x2A));
          unint64_t v43 = v41 % 0x2A;
          unint64_t v44 = *(void **)(v42 + 96 * (v41 % 0x2A) + 56);
          if (v44) {
            goto LABEL_24;
          }
LABEL_25:
          unint64_t v46 = *(void **)(v42 + 96 * v43 + 32);
          if (v46)
          {
            *(void *)(v42 + 96 * v43 + 40) = v46;
            operator delete(v46);
          }
          uint64_t v47 = 42 * ((uint64_t)(v164 - *((void *)&v163 + 1)) >> 3) - 1;
          long long v48 = v165;
          --*((void *)&v165 + 1);
          if ((void)v164 == *((void *)&v163 + 1)) {
            uint64_t v47 = 0;
          }
          if ((unint64_t)(v47 - (*((void *)&v48 + 1) + v48) + 1) >= 0x54)
          {
            operator delete(*(void **)(v164 - 8));
            *(void *)&long long v164 = v164 - 8;
          }
          goto LABEL_8;
        }
        uint64_t v64 = v40 - *(void *)(v35 + 96 * v36 + 8);
        uint64_t v65 = v155;
        if ((v156 & (v155 >= v64)) == 0) {
          uint64_t v65 = v64;
        }
        if (v65 == v161)
        {
          uint64_t v66 = (void **)*((void *)&v163 + 1);
          uint64_t v67 = v164;
          if ((void)v164 == *((void *)&v163 + 1))
          {
            *((void *)&v165 + 1) = 0;
            unint64_t v88 = 0;
          }
          else
          {
            uint64_t v68 = (void *)(*((void *)&v163 + 1) + 8 * ((unint64_t)v165 / 0x2A));
            std::string v69 = (void *)(*v68 + 96 * ((unint64_t)v165 % 0x2A));
            unint64_t v70 = *(void *)(*((void *)&v163 + 1) + 8 * ((*((void *)&v165 + 1) + (void)v165) / 0x2AuLL))
                + 96 * ((*((void *)&v165 + 1) + (void)v165) % 0x2AuLL);
            if (v69 != (void *)v70)
            {
              do
              {
                std::string v71 = (void *)v69[7];
                if (v71)
                {
                  v69[8] = v71;
                  operator delete(v71);
                }
                unsigned int v72 = (void *)v69[4];
                if (v72)
                {
                  v69[5] = v72;
                  operator delete(v72);
                }
                v69 += 12;
                if ((void *)((char *)v69 - *v68) == (void *)4032)
                {
                  uint64_t v73 = (void *)v68[1];
                  ++v68;
                  std::string v69 = v73;
                }
              }
              while (v69 != (void *)v70);
              uint64_t v66 = (void **)*((void *)&v163 + 1);
              uint64_t v67 = v164;
            }
            *((void *)&v165 + 1) = 0;
            unint64_t v88 = v67 - (void)v66;
            if (v88 >= 0x11)
            {
              do
              {
                operator delete(*v66);
                uint64_t v66 = (void **)(*((void *)&v163 + 1) + 8);
                *((void *)&v163 + 1) = v66;
                unint64_t v88 = v164 - (void)v66;
              }
              while ((void)v164 - (void)v66 > 0x10uLL);
            }
          }
          if (v88 >> 3 == 1)
          {
            uint64_t v89 = 21;
LABEL_91:
            *(void *)&long long v165 = v89;
          }
          else if (v88 >> 3 == 2)
          {
            uint64_t v89 = 42;
            goto LABEL_91;
          }
          char v156 = 1;
          uint64_t v155 = v161;
          goto LABEL_8;
        }
        uint64_t v155 = v65;
        unint64_t v74 = *((void *)&v165 + 1) + v165 - 1;
        uint64_t v75 = *(void *)(*((void *)&v163 + 1) + 8 * (v74 / 0x2A));
        unint64_t v76 = v74 % 0x2A;
        v77 = *(void **)(v75 + 96 * (v74 % 0x2A) + 56);
        if (v77)
        {
          *(void *)(v75 + 96 * v76 + 64) = v77;
          operator delete(v77);
        }
        size_t v78 = *(void **)(v75 + 96 * v76 + 32);
        if (v78)
        {
          *(void *)(v75 + 96 * v76 + 40) = v78;
          operator delete(v78);
        }
        uint64_t v79 = 42 * ((uint64_t)(v164 - *((void *)&v163 + 1)) >> 3) - 1;
        long long v80 = v165;
        --*((void *)&v165 + 1);
        if ((void)v164 == *((void *)&v163 + 1)) {
          uint64_t v79 = 0;
        }
        if ((unint64_t)(v79 - (*((void *)&v80 + 1) + v80) + 1) >= 0x54)
        {
          operator delete(*(void **)(v164 - 8));
          *(void *)&long long v164 = v164 - 8;
        }
        char v156 = 1;
LABEL_8:
        uint64_t v16 = *((void *)&v165 + 1);
        if (*((void *)&v165 + 1)) {
          continue;
        }
        if ((v156 & 1) == 0)
        {
          uint64_t v6 = 0;
          unsigned int v145 = (void **)*((void *)&v163 + 1);
          v146 = (void **)v164;
          *((void *)&v165 + 1) = 0;
          unint64_t v147 = v164 - *((void *)&v163 + 1);
          if ((void)v164 - *((void *)&v163 + 1) < 0x11uLL) {
            goto LABEL_154;
          }
          goto LABEL_153;
        }
        uint64_t v144 = *v152;
        *(void *)uint64_t v144 = a2;
        *(void *)(v144 + 8) = a2 + v155;
        uint64_t v6 = 1;
        *(unsigned char *)(v144 + 16) = 1;
LABEL_152:
        unsigned int v145 = (void **)*((void *)&v163 + 1);
        v146 = (void **)v164;
        *((void *)&v165 + 1) = 0;
        unint64_t v147 = v164 - *((void *)&v163 + 1);
        if ((void)v164 - *((void *)&v163 + 1) < 0x11uLL) {
          goto LABEL_154;
        }
        do
        {
LABEL_153:
          operator delete(*v145);
          v146 = (void **)v164;
          unsigned int v145 = (void **)(*((void *)&v163 + 1) + 8);
          *((void *)&v163 + 1) = v145;
          unint64_t v147 = v164 - (void)v145;
        }
        while ((void)v164 - (void)v145 > 0x10uLL);
LABEL_154:
        unint64_t v148 = v147 >> 3;
        if (v148 == 1)
        {
          uint64_t v149 = 21;
          goto LABEL_158;
        }
        if (v148 == 2)
        {
          uint64_t v149 = 42;
LABEL_158:
          *(void *)&long long v165 = v149;
        }
        if (v145 != v146)
        {
          do
          {
            std::string v150 = *v145++;
            operator delete(v150);
          }
          while (v145 != v146);
          if ((void)v164 != *((void *)&v163 + 1)) {
            *(void *)&long long v164 = v164 + ((*((void *)&v163 + 1) - v164 + 7) & 0xFFFFFFFFFFFFFFF8);
          }
        }
        if ((void)v163) {
          operator delete((void *)v163);
        }
        return v6;
      case 0xFFFFFC19:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        goto LABEL_8;
      case 0xFFFFFC1D:
        unint64_t v56 = v165;
        uint64_t v57 = (char *)*((void *)&v163 + 1);
        char v58 = (char *)v164;
        if ((void)v165) {
          goto LABEL_118;
        }
        unint64_t v59 = (uint64_t)(v164 - *((void *)&v163 + 1)) >> 3;
        uint64_t v60 = 42 * v59 - 1;
        if ((void)v164 == *((void *)&v163 + 1)) {
          uint64_t v60 = 0;
        }
        if ((unint64_t)(v60 - *((void *)&v165 + 1)) >= 0x2A)
        {
          *(void *)&long long v165 = 42;
          long long v62 = (char *)(v164 - 8);
          uint64_t v61 = *(void *)(v164 - 8);
          *(void *)&long long v164 = v164 - 8;
          if (*((void *)&v163 + 1) == (void)v163)
          {
            if ((unint64_t)v62 >= *((void *)&v164 + 1))
            {
              if (*((void *)&v164 + 1) == *((void *)&v163 + 1)) {
                unint64_t v91 = 1;
              }
              else {
                unint64_t v91 = (uint64_t)(*((void *)&v164 + 1) - *((void *)&v163 + 1)) >> 2;
              }
              if (v91 >> 61) {
                goto LABEL_170;
              }
              size_t v92 = (char *)operator new(8 * v91);
              unint64_t v93 = (v91 + 3) >> 2;
              char v63 = &v92[8 * v93];
              unint64_t v94 = v63;
              int64_t v95 = v62 - v57;
              if (v62 != v57)
              {
                unint64_t v94 = &v63[v95 & 0xFFFFFFFFFFFFFFF8];
                unint64_t v96 = v95 - 8;
                unint64_t v97 = &v92[8 * v93];
                size_t v98 = v57;
                if (v96 < 0x38) {
                  goto LABEL_173;
                }
                uint64_t v99 = 8 * v93;
                unint64_t v97 = &v92[8 * v93];
                size_t v98 = v57;
                if ((unint64_t)(v97 - v57) < 0x20) {
                  goto LABEL_173;
                }
                uint64_t v100 = (v96 >> 3) + 1;
                uint64_t v101 = 8 * (v100 & 0x3FFFFFFFFFFFFFFCLL);
                unint64_t v97 = &v63[v101];
                size_t v98 = &v57[v101];
                BOOL v102 = (long long *)(v57 + 16);
                size_t v103 = &v92[v99 + 16];
                uint64_t v104 = v100 & 0x3FFFFFFFFFFFFFFCLL;
                do
                {
                  long long v105 = *v102;
                  *((_OWORD *)v103 - 1) = *(v102 - 1);
                  *(_OWORD *)size_t v103 = v105;
                  v102 += 2;
                  v103 += 32;
                  v104 -= 4;
                }
                while (v104);
                if (v100 != (v100 & 0x3FFFFFFFFFFFFFFCLL))
                {
LABEL_173:
                  do
                  {
                    uint64_t v106 = *(void *)v98;
                    v98 += 8;
                    *(void *)unint64_t v97 = v106;
                    v97 += 8;
                  }
                  while (v97 != v94);
                }
              }
              *(void *)&long long v163 = v92;
              *((void *)&v163 + 1) = v63;
              *(void *)&long long v164 = v94;
              *((void *)&v164 + 1) = &v92[8 * v91];
              if (v57)
              {
                operator delete(v57);
                char v63 = (char *)*((void *)&v163 + 1);
              }
            }
            else
            {
              uint64_t v84 = (uint64_t)(*((void *)&v164 + 1) - (void)v62) >> 3;
              if (v84 >= -1) {
                uint64_t v85 = v84 + 1;
              }
              else {
                uint64_t v85 = v84 + 2;
              }
              uint64_t v86 = v85 >> 1;
              size_t v87 = &v62[8 * (v85 >> 1)];
              char v63 = (char *)(v87 - &v62[-*((void *)&v163 + 1)]);
              if (v62 != *((char **)&v163 + 1))
              {
                memmove((void *)(v87 - &v62[-*((void *)&v163 + 1)]), *((const void **)&v163 + 1), (size_t)&v62[-*((void *)&v163 + 1)]);
                uint64_t v57 = (char *)v164;
              }
              *((void *)&v163 + 1) = v63;
              *(void *)&long long v164 = &v57[8 * v86];
            }
          }
          else
          {
            char v63 = (char *)*((void *)&v163 + 1);
          }
          *((void *)v63 - 1) = v61;
          uint64_t v57 = (char *)(*((void *)&v163 + 1) - 8);
          *((void *)&v163 + 1) -= 8;
          goto LABEL_117;
        }
        if (v59 < (uint64_t)(*((void *)&v164 + 1) - v163) >> 3)
        {
          if (*((void *)&v163 + 1) == (void)v163)
          {
            *(void *)long long v162 = operator new(0xFC0uLL);
            std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back((char **)&v163, v162);
            *(void *)long long v162 = *(void *)(v164 - 8);
            *(void *)&long long v164 = v164 - 8;
          }
          else
          {
            *(void *)long long v162 = operator new(0xFC0uLL);
          }
          std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((void **)&v163, v162);
          uint64_t v57 = (char *)*((void *)&v163 + 1);
          uint64_t v90 = 21;
          if ((void)v164 - *((void *)&v163 + 1) != 8) {
            uint64_t v90 = v165 + 42;
          }
          *(void *)&long long v165 = v90;
LABEL_117:
          unint64_t v56 = v165;
          char v58 = (char *)v164;
LABEL_118:
          std::string::size_type v111 = &v57[8 * (v56 / 0x2A)];
          uint64_t v112 = *(void *)v111 + 96 * (v56 % 0x2A);
          if (v58 == v57) {
            uint64_t v112 = 0;
          }
          if (v112 == *(void *)v111) {
            uint64_t v112 = *((void *)v111 - 1) + 4032;
          }
          long long v113 = *(_OWORD *)(v37 + 16);
          *(_OWORD *)(v112 - 96) = *(_OWORD *)v37;
          *(_OWORD *)(v112 - 80) = v113;
          uint64_t v114 = v35 + 96 * v36;
          *(void *)(v112 - 56) = 0;
          *(void *)(v112 - 48) = 0;
          *(void *)(v112 - 64) = 0;
          *(_OWORD *)(v112 - 64) = *(_OWORD *)(v114 + 32);
          *(void *)(v112 - 48) = *(void *)(v114 + 48);
          *(void *)(v114 + 32) = 0;
          *(void *)(v114 + 40) = 0;
          *(void *)(v114 + 48) = 0;
          *(void *)(v112 - 40) = 0;
          *(void *)(v112 - 32) = 0;
          *(void *)(v112 - 24) = 0;
          *(_OWORD *)(v112 - 40) = *(_OWORD *)(v114 + 56);
          *(void *)(v112 - 24) = *(void *)(v114 + 72);
          *(void *)(v114 + 56) = 0;
          *(void *)(v114 + 64) = 0;
          *(void *)(v114 + 72) = 0;
          uint64_t v115 = *v39;
          *(void *)(v112 - 11) = *(void *)(v37 + 85);
          *(void *)(v112 - 16) = v115;
          uint64_t v116 = *((void *)&v165 + 1);
          *(void *)&long long v165 = v165 - 1;
          ++*((void *)&v165 + 1);
          uint64_t v117 = v116 + v165;
          unint64_t v118 = (v116 + (uint64_t)v165) / 0x2AuLL;
          uint64_t v42 = *(void *)(*((void *)&v163 + 1) + 8 * v118);
          unint64_t v43 = v117 - 42 * v118;
          unint64_t v44 = *(void **)(v42 + 96 * v43 + 56);
          if (v44)
          {
LABEL_24:
            *(void *)(v42 + 96 * v43 + 64) = v44;
            operator delete(v44);
          }
          goto LABEL_25;
        }
        if (*((void *)&v164 + 1) == (void)v163) {
          unint64_t v81 = 1;
        }
        else {
          unint64_t v81 = (uint64_t)(*((void *)&v164 + 1) - v163) >> 2;
        }
        if (v81 >> 61) {
LABEL_170:
        }
          std::__throw_bad_array_new_length[abi:ne180100]();
        v82 = (char *)operator new(8 * v81);
        uint64_t v157 = operator new(0xFC0uLL);
        if (v81)
        {
          char v83 = &v82[8 * v81];
        }
        else
        {
          uint64_t v107 = (char *)operator new(8uLL);
          char v83 = v107 + 8;
          operator delete(v82);
          uint64_t v57 = (char *)*((void *)&v163 + 1);
          char v58 = (char *)v164;
          v82 = v107;
        }
        *(void *)v82 = v157;
        std::string::size_type v108 = v82 + 8;
        uint64_t v158 = v82;
        uint64_t v153 = v35;
        if (v57 == v58)
        {
LABEL_113:
          v109 = (void *)v163;
          *(void *)&long long v163 = v158;
          *((void *)&v163 + 1) = v82;
          *(void *)&long long v164 = v108;
          *((void *)&v164 + 1) = v83;
          uint64_t v110 = v165 + 42;
          if (v108 - v82 == 8) {
            uint64_t v110 = 21;
          }
          *(void *)&long long v165 = v110;
          uint64_t v57 = v82;
          if (v109)
          {
            operator delete(v109);
            uint64_t v57 = (char *)*((void *)&v163 + 1);
          }
          goto LABEL_117;
        }
        break;
      case 0xFFFFFC1F:
        unint64_t v45 = *((void *)&v165 + 1) + v165 - 1;
        uint64_t v42 = *(void *)(*((void *)&v163 + 1) + 8 * (v45 / 0x2A));
        unint64_t v43 = v45 % 0x2A;
        unint64_t v44 = *(void **)(v42 + 96 * (v45 % 0x2A) + 56);
        if (v44) {
          goto LABEL_24;
        }
        goto LABEL_25;
      case 0xFFFFFC20:
        *(void *)&long long v49 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v49 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v162[64] = v49;
        *(_OWORD *)&v162[80] = v49;
        *(_OWORD *)&v162[32] = v49;
        *(_OWORD *)&v162[48] = v49;
        *(_OWORD *)long long v162 = v49;
        *(_OWORD *)&v162[16] = v49;
        std::__state<char>::__state((uint64_t)v162, (long long *)(v35 + 96 * v36));
        (*(void (**)(void, uint64_t, unint64_t))(*(void *)*v39 + 24))(*v39, 1, v35 + 96 * v36);
        (*(void (**)(void, void, unsigned char *))(**(void **)&v162[80] + 24))(*(void *)&v162[80], 0, v162);
        uint64_t v50 = *((void *)&v163 + 1);
        if ((void)v164 == *((void *)&v163 + 1)) {
          uint64_t v51 = 0;
        }
        else {
          uint64_t v51 = 42 * ((uint64_t)(v164 - *((void *)&v163 + 1)) >> 3) - 1;
        }
        unint64_t v52 = *((void *)&v165 + 1) + v165;
        if (v51 == *((void *)&v165 + 1) + (void)v165)
        {
          std::deque<std::__state<char>>::__add_back_capacity((uint64_t)&v163);
          uint64_t v50 = *((void *)&v163 + 1);
          unint64_t v52 = *((void *)&v165 + 1) + v165;
        }
        unint64_t v53 = *(void *)(v50 + 8 * (v52 / 0x2A)) + 96 * (v52 % 0x2A);
        long long v54 = *(_OWORD *)&v162[16];
        *(_OWORD *)unint64_t v53 = *(_OWORD *)v162;
        *(_OWORD *)(v53 + 16) = v54;
        *(void *)(v53 + 40) = 0;
        *(void *)(v53 + 48) = 0;
        *(void *)(v53 + 32) = 0;
        *(_OWORD *)(v53 + 32) = *(_OWORD *)&v162[32];
        *(void *)(v53 + 48) = *(void *)&v162[48];
        memset(&v162[32], 0, 24);
        *(void *)(v53 + 56) = 0;
        *(void *)(v53 + 64) = 0;
        *(void *)(v53 + 72) = 0;
        *(_OWORD *)(v53 + 56) = *(_OWORD *)&v162[56];
        *(void *)(v53 + 72) = *(void *)&v162[72];
        memset(&v162[56], 0, 24);
        uint64_t v55 = *(void *)&v162[80];
        *(void *)(v53 + 85) = *(void *)&v162[85];
        *(void *)(v53 + 80) = v55;
        ++*((void *)&v165 + 1);
        if (*(void *)&v162[56])
        {
          *(void *)&v162[64] = *(void *)&v162[56];
          operator delete(*(void **)&v162[56]);
        }
        if (*(void *)&v162[32])
        {
          *(void *)&v162[40] = *(void *)&v162[32];
          operator delete(*(void **)&v162[32]);
        }
        goto LABEL_8;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
    break;
  }
  while (v108 != v83)
  {
    long long v119 = v82;
LABEL_125:
    uint64_t v120 = *(void *)v57;
    v57 += 8;
    *(void *)std::string::size_type v108 = v120;
    v108 += 8;
    v82 = v119;
    if (v57 == (char *)v164) {
      goto LABEL_113;
    }
  }
  if (v82 > v158)
  {
    uint64_t v121 = (v82 - v158) >> 3;
    if (v121 >= -1) {
      uint64_t v122 = v121 + 1;
    }
    else {
      uint64_t v122 = v121 + 2;
    }
    uint64_t v123 = v122 >> 1;
    uint64_t v124 = &v82[-8 * (v122 >> 1)];
    char v125 = v108;
    if (v108 != v82)
    {
      memmove(v124, v82, v108 - v82);
      char v125 = v82;
    }
    uint64_t v126 = -v123;
    char v83 = v108;
    std::string::size_type v108 = &v124[v108 - v82];
    long long v119 = &v125[8 * v126];
    uint64_t v35 = v153;
    goto LABEL_125;
  }
  if (v108 == v158) {
    unint64_t v127 = 1;
  }
  else {
    unint64_t v127 = (v108 - v158) >> 2;
  }
  if (v127 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  unint64_t v128 = (char *)operator new(8 * v127);
  unint64_t v129 = v127 >> 2;
  long long v119 = &v128[8 * (v127 >> 2)];
  int64_t v131 = v108 - v82;
  BOOL v130 = v108 == v82;
  std::string::size_type v108 = v119;
  if (!v130)
  {
    std::string::size_type v108 = &v119[v131 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v132 = v131 - 8;
    if (v132 >= 0x38 && (uint64_t v133 = 8 * v129, (unint64_t)(&v128[8 * v129] - v82) >= 0x20))
    {
      uint64_t v138 = (v132 >> 3) + 1;
      uint64_t v139 = 8 * (v138 & 0x3FFFFFFFFFFFFFFCLL);
      uint64_t v134 = &v119[v139];
      size_t v135 = &v82[v139];
      std::string::size_type v140 = (long long *)(v82 + 16);
      std::string v141 = &v128[v133 + 16];
      uint64_t v142 = v138 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v143 = *v140;
        *((_OWORD *)v141 - 1) = *(v140 - 1);
        *(_OWORD *)std::string v141 = v143;
        v140 += 2;
        v141 += 32;
        v142 -= 4;
      }
      while (v142);
      if (v138 == (v138 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_143;
      }
    }
    else
    {
      uint64_t v134 = &v128[8 * (v127 >> 2)];
      size_t v135 = v82;
    }
    do
    {
      uint64_t v136 = *(void *)v135;
      v135 += 8;
      *(void *)uint64_t v134 = v136;
      v134 += 8;
    }
    while (v134 != v108);
  }
LABEL_143:
  char v83 = &v128[8 * v127];
  if (v158)
  {
    unint64_t v137 = v128;
    operator delete(v158);
    uint64_t v158 = v137;
  }
  else
  {
    uint64_t v158 = v128;
  }
  goto LABEL_125;
}

void sub_21D840220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p)
{
  operator delete(__p);
  operator delete(v17);
  std::deque<std::__state<char>>::~deque[abi:ne180100](v18 - 144);
  _Unwind_Resume(a1);
}

void sub_21D840248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  operator delete(v17);
  std::deque<std::__state<char>>::~deque[abi:ne180100](v18 - 144);
  _Unwind_Resume(a1);
}

void sub_21D840268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  std::deque<std::__state<char>>::~deque[abi:ne180100](v21 - 144);
  _Unwind_Resume(a1);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  unint64_t v129 = 0;
  BOOL v130 = 0;
  unint64_t v131 = 0;
  *(_DWORD *)&v128[36] = -1431655766;
  *(void *)uint64_t v126 = 0xAAAAAAAA00000000;
  memset(&v126[8], 0, 32);
  *(_OWORD *)unint64_t v127 = 0u;
  memset(v128, 0, 36);
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6)
  {
    uint64_t v16 = 0;
    uint64_t v17 = *(void **)v128;
    if (!*(void *)v128) {
      goto LABEL_151;
    }
    goto LABEL_150;
  }
  __x.second = a3;
  *(void *)&__x.matched = 0xAAAAAAAAAAAAAA00;
  __x.char first = a3;
  *(_DWORD *)uint64_t v124 = 0;
  memset(&v124[8], 0, 85);
  long long v12 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v129, (uint64_t)v124);
  BOOL v130 = v12;
  if (*(void *)&v124[56]) {
    operator delete(*(void **)&v124[56]);
  }
  if (*(void *)&v124[32]) {
    operator delete(*(void **)&v124[32]);
  }
  uint64_t v13 = *((void *)v12 - 8);
  *((_DWORD *)v12 - 24) = 0;
  *((void *)v12 - 11) = a2;
  *((void *)v12 - 10) = a2;
  *((void *)v12 - 9) = a3;
  unint64_t v14 = *(unsigned int *)(a1 + 28);
  unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v12 - 7) - v13) >> 3);
  if (v14 <= v15)
  {
    if (v14 < v15) {
      *((void *)v12 - 7) = v13 + 24 * v14;
    }
  }
  else
  {
    std::vector<std::sub_match<char const*>>::__append((std::vector<std::csub_match> *)(v12 - 64), v14 - v15, &__x);
  }
  uint64_t v18 = *((void *)v12 - 5);
  unint64_t v19 = *(unsigned int *)(a1 + 32);
  unint64_t v20 = (*((void *)v12 - 4) - v18) >> 4;
  if (v19 <= v20)
  {
    if (v19 < v20) {
      *((void *)v12 - 4) = v18 + 16 * v19;
    }
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append((std::vector<std::pair<unsigned long, const char *>> *)(v12 - 40), v19 - v20);
  }
  uint64_t v21 = 0;
  char v22 = 0;
  unsigned int v23 = 0;
  unint64_t v24 = (const char *)(a3 - a2);
  *((void *)v12 - 2) = v6;
  *((_DWORD *)v12 - 2) = a5;
  *(v12 - 4) = a6;
  uint64_t v122 = a3;
  uint64_t v121 = a4;
  while (2)
  {
    BOOL v25 = (++v23 & 0xFFF) != 0 || (int)(v23 >> 12) < (int)v24;
    if (!v25) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    }
    unint64_t v27 = v12 - 16;
    uint64_t v26 = *((void *)v12 - 2);
    unsigned int v28 = v12 - 96;
    if (v26) {
      (*(void (**)(uint64_t, char *))(*(void *)v26 + 16))(v26, v12 - 96);
    }
    switch(*(_DWORD *)v28)
    {
      case 0xFFFFFC18:
        unint64_t v29 = (const char *)*((void *)v12 - 10);
        if ((a5 & 0x20) != 0 && v29 == a2 || (a5 & 0x1000) != 0 && v29 != v122) {
          goto LABEL_31;
        }
        uint64_t v37 = &v29[-*((void *)v12 - 11)];
        if ((v22 & ((uint64_t)v21 >= (uint64_t)v37)) != 0) {
          goto LABEL_97;
        }
        long long v38 = *((_OWORD *)v12 - 5);
        *(_OWORD *)uint64_t v126 = *(_OWORD *)v28;
        *(_OWORD *)&v126[16] = v38;
        if (v126 == v28) {
          goto LABEL_96;
        }
        uint64_t v39 = (char *)*((void *)v12 - 8);
        uint64_t v40 = (char *)*((void *)v12 - 7);
        unint64_t v41 = 0xAAAAAAAAAAAAAAABLL * ((v40 - v39) >> 3);
        uint64_t v42 = (uint64_t)v127[1];
        unint64_t v43 = *(char **)&v126[32];
        if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v127[1] - *(void *)&v126[32]) >> 3) >= v41)
        {
          long long v48 = (char *)v127[0];
          if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v127[0] - *(void *)&v126[32]) >> 3) >= v41)
          {
            uint64_t v56 = *(void *)&v126[32];
            if (v39 != v40)
            {
              uint64_t v57 = *(void *)&v126[32];
              do
              {
                *(_OWORD *)uint64_t v57 = *(_OWORD *)v39;
                *(unsigned char *)(v57 + 16) = v39[16];
                v56 += 24;
                v39 += 24;
                v57 += 24;
              }
              while (v39 != v40);
            }
            uint64_t v51 = v56 - (void)v43;
            long long v48 = v43;
          }
          else
          {
            unint64_t v52 = &v39[8 * (((uint64_t)v127[0] - *(void *)&v126[32]) >> 3)];
            if (v127[0] != *(void **)&v126[32])
            {
              do
              {
                *(_OWORD *)unint64_t v43 = *(_OWORD *)v39;
                v43[16] = v39[16];
                v39 += 24;
                v43 += 24;
              }
              while (v39 != v52);
            }
            unint64_t v53 = v48;
            if (v52 != v40)
            {
              long long v54 = v48;
              do
              {
                long long v55 = *(_OWORD *)v52;
                *((void *)v54 + 2) = *((void *)v52 + 2);
                *(_OWORD *)long long v54 = v55;
                v54 += 24;
                v52 += 24;
                v53 += 24;
              }
              while (v52 != v40);
            }
            uint64_t v51 = v53 - v48;
          }
        }
        else
        {
          uint64_t v120 = v37;
          if (*(void *)&v126[32])
          {
            v127[0] = *(void **)&v126[32];
            operator delete(*(void **)&v126[32]);
            uint64_t v42 = 0;
            *(void *)&v126[32] = 0;
            *(_OWORD *)unint64_t v127 = 0uLL;
          }
          if (v41 > 0xAAAAAAAAAAAAAAALL) {
            goto LABEL_158;
          }
          unint64_t v44 = 0xAAAAAAAAAAAAAAABLL * (v42 >> 3);
          uint64_t v45 = 2 * v44;
          if (2 * v44 <= v41) {
            uint64_t v45 = 0xAAAAAAAAAAAAAAABLL * ((v40 - v39) >> 3);
          }
          unint64_t v46 = v44 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v45;
          if (v46 > 0xAAAAAAAAAAAAAAALL) {
LABEL_158:
          }
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          uint64_t v47 = (char *)operator new(24 * v46);
          long long v48 = v47;
          *(void *)&v126[32] = v47;
          v127[0] = v47;
          v127[1] = &v47[24 * v46];
          long long v49 = v47;
          if (v39 != v40)
          {
            size_t v50 = 24 * ((v40 - v39 - 24) / 0x18uLL) + 24;
            memcpy(v47, v39, v50);
            long long v49 = &v48[v50];
          }
          uint64_t v51 = v49 - v48;
          uint64_t v37 = v120;
        }
        v127[0] = &v48[v51];
        char v58 = (char *)*((void *)v12 - 5);
        unint64_t v59 = (char *)*((void *)v12 - 4);
        int64_t v60 = v59 - v58;
        unint64_t v61 = (v59 - v58) >> 4;
        uint64_t v62 = *(void *)&v128[16];
        char v63 = *(char **)v128;
        if (v61 <= (uint64_t)(*(void *)&v128[16] - *(void *)v128) >> 4)
        {
          uint64_t v68 = *(char **)&v128[8];
          uint64_t v71 = *(void *)&v128[8] - *(void *)v128;
          unint64_t v72 = (uint64_t)(*(void *)&v128[8] - *(void *)v128) >> 4;
          if (v72 < v61)
          {
            uint64_t v73 = &v58[16 * v72];
            if (*(void *)&v128[8] != *(void *)v128)
            {
              unint64_t v74 = v71 - 16;
              if ((unint64_t)(v71 - 16) < 0xD0) {
                goto LABEL_161;
              }
              unint64_t v87 = v71 & 0xFFFFFFFFFFFFFFF0;
              unint64_t v88 = *(void *)v128 + 8 + v87 - 16;
              unint64_t v89 = (unint64_t)&v58[v87 - 8];
              BOOL v90 = *(void *)v128 + 8 >= (unint64_t)&v58[v87]
                 || (unint64_t)(v58 + 8) >= *(void *)v128 + v87;
              BOOL v91 = !v90;
              if ((unint64_t)v58 < v88 && *(void *)v128 < v89) {
                goto LABEL_161;
              }
              if (v91) {
                goto LABEL_161;
              }
              uint64_t v93 = (v74 >> 4) + 1;
              uint64_t v94 = 16 * (v93 & 0x1FFFFFFFFFFFFFFCLL);
              int64_t v95 = (char *)(*(void *)v128 + v94);
              unint64_t v96 = &v58[v94];
              unint64_t v97 = (const double *)(v58 + 32);
              size_t v98 = (double *)(*(void *)v128 + 32);
              uint64_t v99 = v93 & 0x1FFFFFFFFFFFFFFCLL;
              do
              {
                uint64_t v100 = v97 - 4;
                float64x2x2_t v132 = vld2q_f64(v100);
                float64x2x2_t v134 = vld2q_f64(v97);
                uint64_t v101 = v98 - 4;
                vst2q_f64(v101, v132);
                vst2q_f64(v98, v134);
                v97 += 8;
                v98 += 8;
                v99 -= 4;
              }
              while (v99);
              char v63 = v95;
              char v58 = v96;
              if (v93 != (v93 & 0x1FFFFFFFFFFFFFFCLL))
              {
LABEL_161:
                do
                {
                  *(void *)char v63 = *(void *)v58;
                  *((void *)v63 + 1) = *((void *)v58 + 1);
                  v58 += 16;
                  v63 += 16;
                }
                while (v58 != v73);
              }
            }
            uint64_t v75 = v68;
            if (v73 != v59)
            {
              unint64_t v76 = v68;
              do
              {
                long long v77 = *(_OWORD *)v73;
                v73 += 16;
                *(_OWORD *)unint64_t v76 = v77;
                v76 += 16;
                v75 += 16;
              }
              while (v73 != v59);
            }
            int64_t v70 = v75 - v68;
            goto LABEL_95;
          }
          if (v58 == v59)
          {
            uint64_t v79 = *(char **)v128;
          }
          else
          {
            unint64_t v78 = v60 - 16;
            if ((unint64_t)(v60 - 16) >= 0xD0)
            {
              BOOL v103 = *(void *)v128 + 8 < (unint64_t)&v58[(v78 & 0xFFFFFFFFFFFFFFF0) + 16]
                  && (unint64_t)(v58 + 8) < *(void *)v128 + (v78 & 0xFFFFFFFFFFFFFFF0) + 16;
              uint64_t v79 = *(char **)v128;
              if (((unint64_t)v58 >= *(void *)v128 + 8 + (v78 & 0xFFFFFFFFFFFFFFF0)
                 || *(void *)v128 >= (unint64_t)&v58[(v78 & 0xFFFFFFFFFFFFFFF0) + 8])
                && !v103)
              {
                uint64_t v105 = (v78 >> 4) + 1;
                uint64_t v106 = 16 * (v105 & 0x1FFFFFFFFFFFFFFCLL);
                uint64_t v79 = (char *)(*(void *)v128 + v106);
                uint64_t v107 = &v58[v106];
                std::string::size_type v108 = (const double *)(v58 + 32);
                v109 = (double *)(*(void *)v128 + 32);
                uint64_t v110 = v105 & 0x1FFFFFFFFFFFFFFCLL;
                do
                {
                  std::string::size_type v111 = v108 - 4;
                  float64x2x2_t v133 = vld2q_f64(v111);
                  float64x2x2_t v135 = vld2q_f64(v108);
                  uint64_t v112 = v109 - 4;
                  vst2q_f64(v112, v133);
                  vst2q_f64(v109, v135);
                  v108 += 8;
                  v109 += 8;
                  v110 -= 4;
                }
                while (v110);
                char v58 = v107;
                if (v105 == (v105 & 0x1FFFFFFFFFFFFFFCLL)) {
                  goto LABEL_94;
                }
              }
            }
            else
            {
              uint64_t v79 = *(char **)v128;
            }
            do
            {
              *(void *)uint64_t v79 = *(void *)v58;
              *((void *)v79 + 1) = *((void *)v58 + 1);
              v79 += 16;
              v58 += 16;
            }
            while (v58 != v59);
          }
LABEL_94:
          int64_t v70 = v79 - v63;
          uint64_t v68 = v63;
          goto LABEL_95;
        }
        uint64_t v64 = v37;
        if (*(void *)v128)
        {
          *(void *)&v128[8] = *(void *)v128;
          operator delete(*(void **)v128);
          uint64_t v62 = 0;
          memset(v128, 0, 24);
        }
        if (v60 < 0) {
          goto LABEL_157;
        }
        uint64_t v65 = v62 >> 3;
        if (v62 >> 3 <= v61) {
          uint64_t v65 = (v59 - v58) >> 4;
        }
        unint64_t v66 = (unint64_t)v62 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v65;
        if (v66 >> 60) {
LABEL_157:
        }
          std::vector<std::string>::__throw_length_error[abi:ne180100]();
        uint64_t v67 = (char *)operator new(16 * v66);
        uint64_t v68 = v67;
        *(void *)unint64_t v128 = v67;
        *(void *)&v128[8] = v67;
        *(void *)&v128[16] = &v67[16 * v66];
        std::string v69 = v67;
        if (v58 != v59)
        {
          memcpy(v67, v58, v60 & 0xFFFFFFFFFFFFFFF0);
          std::string v69 = &v68[v60 & 0xFFFFFFFFFFFFFFF0];
        }
        int64_t v70 = v69 - v68;
        uint64_t v37 = v64;
LABEL_95:
        *(void *)&v128[8] = &v68[v70];
LABEL_96:
        uint64_t v80 = *(void *)v27;
        *(void *)&v128[29] = *(void *)(v27 + 5);
        *(void *)&v128[24] = v80;
        uint64_t v21 = v37;
LABEL_97:
        unint64_t v81 = v130;
        if (v21 == v24)
        {
          v82 = v129;
          while (v81 != v82)
          {
            char v83 = (void *)*((void *)v81 - 5);
            if (v83)
            {
              *((void *)v81 - 4) = v83;
              operator delete(v83);
            }
            uint64_t v84 = (void *)*((void *)v81 - 8);
            if (v84)
            {
              *((void *)v81 - 7) = v84;
              operator delete(v84);
            }
            v81 -= 96;
          }
          BOOL v130 = v82;
          char v22 = 1;
          uint64_t v21 = v24;
        }
        else
        {
          uint64_t v85 = (void *)*((void *)v130 - 5);
          if (v85)
          {
            *((void *)v130 - 4) = v85;
            operator delete(v85);
          }
          uint64_t v86 = (void *)*((void *)v81 - 8);
          if (v86)
          {
            *((void *)v81 - 7) = v86;
            operator delete(v86);
          }
          BOOL v130 = v81 - 96;
          char v22 = 1;
        }
LABEL_18:
        uint64_t v16 = v129;
        long long v12 = v130;
        if (v129 != v130) {
          continue;
        }
        if ((v22 & 1) == 0)
        {
          uint64_t v6 = 0;
          uint64_t v17 = *(void **)v128;
          if (!*(void *)v128) {
            goto LABEL_151;
          }
          goto LABEL_150;
        }
        uint64_t v113 = *v121;
        *(void *)uint64_t v113 = a2;
        *(void *)(v113 + 8) = &v21[(void)a2];
        *(unsigned char *)(v113 + 16) = 1;
        if (v127[0] != *(void **)&v126[32])
        {
          unint64_t v114 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v127[0] - *(void *)&v126[32]) >> 3);
          uint64_t v115 = (unsigned char *)(*(void *)&v126[32] + 16);
          unsigned int v116 = 1;
          do
          {
            uint64_t v117 = v113 + 24 * v116;
            *(_OWORD *)uint64_t v117 = *((_OWORD *)v115 - 1);
            char v118 = *v115;
            v115 += 24;
            *(unsigned char *)(v117 + 16) = v118;
            BOOL v25 = v114 > v116++;
          }
          while (v25);
        }
        uint64_t v6 = 1;
        uint64_t v17 = *(void **)v128;
        if (*(void *)v128)
        {
LABEL_150:
          *(void *)&v128[8] = v17;
          operator delete(v17);
        }
LABEL_151:
        if (*(void *)&v126[32])
        {
          v127[0] = *(void **)&v126[32];
          operator delete(*(void **)&v126[32]);
        }
        if (v16) {
          operator delete(v16);
        }
        return v6;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        goto LABEL_18;
      case 0xFFFFFC1F:
LABEL_31:
        unint64_t v30 = v130;
        unint64_t v31 = (void *)*((void *)v130 - 5);
        if (v31)
        {
          *((void *)v130 - 4) = v31;
          operator delete(v31);
        }
        unint64_t v32 = (void *)*((void *)v30 - 8);
        if (v32)
        {
          *((void *)v30 - 7) = v32;
          operator delete(v32);
        }
        BOOL v130 = v30 - 96;
        goto LABEL_18;
      case 0xFFFFFC20:
        *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v124[64] = v33;
        *(_OWORD *)&v124[80] = v33;
        *(_OWORD *)&v124[32] = v33;
        *(_OWORD *)&v124[48] = v33;
        *(_OWORD *)uint64_t v124 = v33;
        *(_OWORD *)&v124[16] = v33;
        std::__state<char>::__state((uint64_t)v124, (long long *)v12 - 6);
        (*(void (**)(void, uint64_t, char *))(**(void **)v27 + 24))(*(void *)v27, 1, v12 - 96);
        (*(void (**)(void, void, unsigned char *))(**(void **)&v124[80] + 24))(*(void *)&v124[80], 0, v124);
        unint64_t v34 = v130;
        if ((unint64_t)v130 >= v131)
        {
          BOOL v130 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v129, (uint64_t)v124);
          if (*(void *)&v124[56])
          {
            *(void *)&v124[64] = *(void *)&v124[56];
            operator delete(*(void **)&v124[56]);
          }
        }
        else
        {
          long long v35 = *(_OWORD *)&v124[16];
          *(_OWORD *)BOOL v130 = *(_OWORD *)v124;
          *((_OWORD *)v34 + 1) = v35;
          *((void *)v34 + 4) = 0;
          *((void *)v34 + 5) = 0;
          *((void *)v34 + 6) = 0;
          *((void *)v34 + 7) = 0;
          *((_OWORD *)v34 + 2) = *(_OWORD *)&v124[32];
          *((void *)v34 + 6) = *(void *)&v124[48];
          memset(&v124[32], 0, 24);
          *((void *)v34 + 8) = 0;
          *((void *)v34 + 9) = 0;
          *(_OWORD *)(v34 + 56) = *(_OWORD *)&v124[56];
          *((void *)v34 + 9) = *(void *)&v124[72];
          memset(&v124[56], 0, 24);
          uint64_t v36 = *(void *)&v124[80];
          *(void *)(v34 + 85) = *(void *)&v124[85];
          *((void *)v34 + 10) = v36;
          BOOL v130 = v34 + 96;
        }
        if (*(void *)&v124[32])
        {
          *(void *)&v124[40] = *(void *)&v124[32];
          operator delete(*(void **)&v124[32]);
        }
        goto LABEL_18;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
  }
}

void sub_21D840CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  std::__state<char>::~__state(&a35);
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v35 - 120));
  _Unwind_Resume(a1);
}

uint64_t std::deque<std::__state<char>>::~deque[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 8);
  int v3 = *(void ***)(a1 + 16);
  if (v3 == v2)
  {
    int v3 = *(void ***)(a1 + 8);
    *(void *)(a1 + 40) = 0;
    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v4 = *(void *)(a1 + 32);
    char v5 = &v2[v4 / 0x2A];
    uint64_t v6 = (char *)*v5 + 96 * (v4 % 0x2A);
    unint64_t v7 = (unint64_t)v2[(*(void *)(a1 + 40) + v4) / 0x2A] + 96 * ((*(void *)(a1 + 40) + v4) % 0x2A);
    if (v6 != (char *)v7)
    {
      do
      {
        int v8 = (void *)*((void *)v6 + 7);
        if (v8)
        {
          *((void *)v6 + 8) = v8;
          operator delete(v8);
        }
        int v9 = (void *)*((void *)v6 + 4);
        if (v9)
        {
          *((void *)v6 + 5) = v9;
          operator delete(v9);
        }
        v6 += 96;
        if (v6 - (unsigned char *)*v5 == 4032)
        {
          uint64_t v10 = (char *)v5[1];
          ++v5;
          uint64_t v6 = v10;
        }
      }
      while (v6 != (char *)v7);
      uint64_t v2 = *(void ***)(a1 + 8);
      int v3 = *(void ***)(a1 + 16);
    }
    *(void *)(a1 + 40) = 0;
    unint64_t v11 = (char *)v3 - (char *)v2;
    if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
    {
      do
      {
        operator delete(*v2);
        int v3 = *(void ***)(a1 + 16);
        uint64_t v2 = (void **)(*(void *)(a1 + 8) + 8);
        *(void *)(a1 + 8) = v2;
        unint64_t v11 = (char *)v3 - (char *)v2;
      }
      while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
    }
  }
  unint64_t v12 = v11 >> 3;
  if (v12 == 1)
  {
    uint64_t v13 = 21;
    goto LABEL_19;
  }
  if (v12 == 2)
  {
    uint64_t v13 = 42;
LABEL_19:
    *(void *)(a1 + 32) = v13;
  }
  if (v2 != v3)
  {
    do
    {
      unint64_t v14 = *v2++;
      operator delete(v14);
    }
    while (v2 != v3);
    uint64_t v16 = *(void *)(a1 + 8);
    uint64_t v15 = *(void *)(a1 + 16);
    if (v15 != v16) {
      *(void *)(a1 + 16) = v15 + ((v16 - v15 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::deque<std::__state<char>>::__add_back_capacity(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = v2 >= 0x2A;
  unint64_t v4 = v2 - 42;
  if (v3)
  {
    *(void *)(a1 + 32) = v4;
    uint64_t v6 = *(void **)(a1 + 8);
    char v5 = *(char **)(a1 + 16);
    unint64_t v7 = (char *)(v6 + 1);
    uint64_t v8 = *v6;
    *(void *)(a1 + 8) = v6 + 1;
    if (v5 != *(char **)(a1 + 24))
    {
LABEL_78:
      *(void *)char v5 = v8;
      *(void *)(a1 + 16) += 8;
      return;
    }
    int v9 = *(char **)a1;
    uint64_t v10 = (uint64_t)&v7[-*(void *)a1];
    if ((unint64_t)v7 <= *(void *)a1)
    {
      unint64_t v32 = (v5 - v9) >> 2;
      if (v5 == v9) {
        unint64_t v32 = 1;
      }
      if (!(v32 >> 61))
      {
        unint64_t v33 = v32 >> 2;
        uint64_t v34 = 8 * v32;
        uint64_t v35 = (char *)operator new(8 * v32);
        uint64_t v36 = &v35[8 * v33];
        uint64_t v37 = &v35[v34];
        int64_t v39 = v5 - v7;
        BOOL v38 = v5 == v7;
        char v5 = v36;
        if (!v38)
        {
          char v5 = &v36[v39 & 0xFFFFFFFFFFFFFFF8];
          unint64_t v40 = v39 - 8;
          if ((unint64_t)(v39 - 8) >= 0x38)
          {
            uint64_t v73 = &v35[8 * v33];
            unint64_t v41 = v73;
            if ((unint64_t)(v73 - v7) >= 0x20)
            {
              uint64_t v74 = (v40 >> 3) + 1;
              uint64_t v75 = 8 * (v74 & 0x3FFFFFFFFFFFFFFCLL);
              unint64_t v41 = &v36[v75];
              v7 += v75;
              unint64_t v76 = (long long *)(v6 + 3);
              long long v77 = v73 + 16;
              uint64_t v78 = v74 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v79 = *v76;
                *(v77 - 1) = *(v76 - 1);
                _OWORD *v77 = v79;
                v76 += 2;
                v77 += 2;
                v78 -= 4;
              }
              while (v78);
              if (v74 == (v74 & 0x3FFFFFFFFFFFFFFCLL)) {
                goto LABEL_76;
              }
            }
          }
          else
          {
            unint64_t v41 = &v35[8 * v33];
          }
          do
          {
            uint64_t v80 = *(void *)v7;
            v7 += 8;
            *(void *)unint64_t v41 = v80;
            v41 += 8;
          }
          while (v41 != v5);
        }
        goto LABEL_76;
      }
LABEL_87:
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
LABEL_5:
    uint64_t v11 = v10 >> 3;
    if (v11 >= -1) {
      uint64_t v12 = v11 + 1;
    }
    else {
      uint64_t v12 = v11 + 2;
    }
    uint64_t v13 = v12 >> 1;
    uint64_t v14 = -v13;
    uint64_t v15 = &v7[-8 * v13];
    int64_t v16 = v5 - v7;
    if (v5 != v7)
    {
      memmove(&v7[-8 * v13], v7, v5 - v7);
      unint64_t v7 = *(char **)(a1 + 8);
    }
    char v5 = &v15[v16];
    *(void *)(a1 + 8) = &v7[8 * v14];
    *(void *)(a1 + 16) = &v15[v16];
    goto LABEL_78;
  }
  uint64_t v18 = *(void *)(a1 + 16);
  uint64_t v17 = *(void *)(a1 + 24);
  uint64_t v19 = *(void *)(a1 + 8);
  uint64_t v20 = v18 - v19;
  uint64_t v21 = (v18 - v19) >> 3;
  uint64_t v22 = v17 - *(void *)a1;
  if (v21 < (unint64_t)(v22 >> 3))
  {
    if (v17 != v18)
    {
      unint64_t v89 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back((char **)a1, &v89);
      return;
    }
    unint64_t v89 = operator new(0xFC0uLL);
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((void **)a1, &v89);
    uint64_t v42 = *(void **)(a1 + 8);
    char v5 = *(char **)(a1 + 16);
    unint64_t v7 = (char *)(v42 + 1);
    uint64_t v8 = *v42;
    *(void *)(a1 + 8) = v42 + 1;
    if (v5 != *(char **)(a1 + 24)) {
      goto LABEL_78;
    }
    int v9 = *(char **)a1;
    uint64_t v10 = (uint64_t)&v7[-*(void *)a1];
    if ((unint64_t)v7 <= *(void *)a1)
    {
      unint64_t v43 = (v5 - v9) >> 2;
      if (v5 == v9) {
        unint64_t v43 = 1;
      }
      if (!(v43 >> 61))
      {
        unint64_t v44 = v43 >> 2;
        uint64_t v45 = 8 * v43;
        uint64_t v35 = (char *)operator new(8 * v43);
        uint64_t v36 = &v35[8 * v44];
        uint64_t v37 = &v35[v45];
        int64_t v46 = v5 - v7;
        BOOL v38 = v5 == v7;
        char v5 = v36;
        if (!v38)
        {
          char v5 = &v36[v46 & 0xFFFFFFFFFFFFFFF8];
          unint64_t v47 = v46 - 8;
          if ((unint64_t)(v46 - 8) >= 0x38)
          {
            unint64_t v81 = &v35[8 * v44];
            long long v48 = v81;
            if ((unint64_t)(v81 - v7) >= 0x20)
            {
              uint64_t v82 = (v47 >> 3) + 1;
              uint64_t v83 = 8 * (v82 & 0x3FFFFFFFFFFFFFFCLL);
              long long v48 = &v36[v83];
              v7 += v83;
              uint64_t v84 = (long long *)(v42 + 3);
              uint64_t v85 = v81 + 16;
              uint64_t v86 = v82 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v87 = *v84;
                *(v85 - 1) = *(v84 - 1);
                _OWORD *v85 = v87;
                v84 += 2;
                v85 += 2;
                v86 -= 4;
              }
              while (v86);
              if (v82 == (v82 & 0x3FFFFFFFFFFFFFFCLL)) {
                goto LABEL_76;
              }
            }
          }
          else
          {
            long long v48 = &v35[8 * v44];
          }
          do
          {
            uint64_t v88 = *(void *)v7;
            v7 += 8;
            *(void *)long long v48 = v88;
            v48 += 8;
          }
          while (v48 != v5);
        }
LABEL_76:
        *(void *)a1 = v35;
        *(void *)(a1 + 8) = v36;
        *(void *)(a1 + 16) = v5;
        *(void *)(a1 + 24) = v37;
        if (v9)
        {
          operator delete(v9);
          char v5 = *(char **)(a1 + 16);
        }
        goto LABEL_78;
      }
      goto LABEL_87;
    }
    goto LABEL_5;
  }
  uint64_t v23 = v22 >> 2;
  if (v17 == *(void *)a1) {
    unint64_t v24 = 1;
  }
  else {
    unint64_t v24 = v23;
  }
  if (v24 >> 61) {
    goto LABEL_87;
  }
  BOOL v25 = (char *)operator new(8 * v24);
  uint64_t v26 = operator new(0xFC0uLL);
  unint64_t v27 = &v25[8 * v21];
  unsigned int v28 = &v25[8 * v24];
  if (v21 == v24)
  {
    unint64_t v30 = v26;
    if (v20 < 1)
    {
      if (v18 == v19) {
        unint64_t v49 = 1;
      }
      else {
        unint64_t v49 = v20 >> 2;
      }
      if (v49 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v27 = (char *)operator new(8 * v49);
      unsigned int v28 = &v27[8 * v49];
      operator delete(v25);
      uint64_t v50 = *(void *)(a1 + 8);
      uint64_t v18 = *(void *)(a1 + 16);
      BOOL v25 = v27;
      *(void *)unint64_t v27 = v30;
      unint64_t v29 = v27 + 8;
      if (v18 == v50) {
        goto LABEL_45;
      }
    }
    else
    {
      unint64_t v31 = v21 + 2;
      if (v21 >= -1) {
        unint64_t v31 = v21 + 1;
      }
      v27 -= 8 * (v31 >> 1);
      *(void *)unint64_t v27 = v26;
      unint64_t v29 = v27 + 8;
      if (v18 == v19) {
        goto LABEL_45;
      }
    }
    goto LABEL_51;
  }
  *(void *)unint64_t v27 = v26;
  unint64_t v29 = v27 + 8;
  if (v18 != v19)
  {
    do
    {
LABEL_51:
      if (v27 == v25)
      {
        if (v29 >= v28)
        {
          if (v28 == v25) {
            unint64_t v57 = 1;
          }
          else {
            unint64_t v57 = (v28 - v25) >> 2;
          }
          if (v57 >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          char v58 = (char *)operator new(8 * v57);
          unint64_t v59 = v58;
          unint64_t v60 = (v57 + 3) >> 2;
          unint64_t v27 = &v58[8 * v60];
          int64_t v61 = v29 - v25;
          BOOL v38 = v29 == v25;
          unint64_t v29 = v27;
          if (!v38)
          {
            unint64_t v29 = &v27[v61 & 0xFFFFFFFFFFFFFFF8];
            unint64_t v62 = v61 - 8;
            char v63 = &v58[8 * v60];
            uint64_t v64 = v25;
            if (v62 < 0x38) {
              goto LABEL_91;
            }
            uint64_t v65 = 8 * v60;
            char v63 = &v58[8 * v60];
            uint64_t v64 = v25;
            if ((unint64_t)(v63 - v25) < 0x20) {
              goto LABEL_91;
            }
            uint64_t v66 = (v62 >> 3) + 1;
            uint64_t v67 = 8 * (v66 & 0x3FFFFFFFFFFFFFFCLL);
            char v63 = &v27[v67];
            uint64_t v64 = &v25[v67];
            uint64_t v68 = (long long *)(v25 + 16);
            std::string v69 = &v58[v65 + 16];
            uint64_t v70 = v66 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v71 = *v68;
              *((_OWORD *)v69 - 1) = *(v68 - 1);
              *(_OWORD *)std::string v69 = v71;
              v68 += 2;
              v69 += 32;
              v70 -= 4;
            }
            while (v70);
            if (v66 != (v66 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_91:
              do
              {
                uint64_t v72 = *(void *)v64;
                v64 += 8;
                *(void *)char v63 = v72;
                v63 += 8;
              }
              while (v63 != v29);
            }
          }
          unsigned int v28 = &v58[8 * v57];
          operator delete(v25);
          BOOL v25 = v59;
        }
        else
        {
          uint64_t v53 = (v28 - v29) >> 3;
          if (v53 >= -1) {
            uint64_t v54 = v53 + 1;
          }
          else {
            uint64_t v54 = v53 + 2;
          }
          uint64_t v55 = v54 >> 1;
          unint64_t v27 = &v25[8 * (v54 >> 1)];
          uint64_t v56 = v25;
          if (v29 != v25)
          {
            memmove(v27, v25, v29 - v25);
            uint64_t v56 = v29;
          }
          unint64_t v29 = (char *)v56 + 8 * v55;
        }
      }
      uint64_t v52 = *(void *)(v18 - 8);
      v18 -= 8;
      *((void *)v27 - 1) = v52;
      v27 -= 8;
    }
    while (v18 != *(void *)(a1 + 8));
  }
LABEL_45:
  uint64_t v51 = *(char **)a1;
  *(void *)a1 = v25;
  *(void *)(a1 + 8) = v27;
  *(void *)(a1 + 16) = v29;
  *(void *)(a1 + 24) = v28;
  if (v51)
  {
    operator delete(v51);
  }
}

void sub_21D841484(_Unwind_Exception *a1)
{
  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(char **a1, void *a2)
{
  unint64_t v4 = a1[2];
  if (v4 != a1[3]) {
    goto LABEL_22;
  }
  char v5 = *a1;
  uint64_t v6 = a1[1];
  if (v6 > *a1)
  {
    uint64_t v7 = (v6 - *a1) >> 3;
    if (v7 >= -1) {
      uint64_t v8 = v7 + 1;
    }
    else {
      uint64_t v8 = v7 + 2;
    }
    uint64_t v9 = v8 >> 1;
    uint64_t v10 = -v9;
    uint64_t v11 = &v6[-8 * v9];
    int64_t v12 = v4 - v6;
    if (v4 != v6)
    {
      memmove(&v6[-8 * v9], a1[1], v4 - v6);
      unint64_t v4 = a1[1];
    }
    uint64_t v13 = &v4[8 * v10];
    unint64_t v4 = &v11[v12];
    a1[1] = v13;
    a1[2] = &v11[v12];
    goto LABEL_22;
  }
  unint64_t v14 = (v4 - v5) >> 2;
  if (v4 == v5) {
    unint64_t v14 = 1;
  }
  if (v14 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  unint64_t v15 = v14 >> 2;
  uint64_t v16 = 8 * v14;
  uint64_t v17 = (char *)operator new(8 * v14);
  uint64_t v18 = &v17[8 * v15];
  int64_t v20 = v4 - v6;
  BOOL v19 = v4 == v6;
  unint64_t v4 = v18;
  if (!v19)
  {
    unint64_t v4 = &v18[v20 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v21 = v20 - 8;
    if ((unint64_t)(v20 - 8) < 0x38)
    {
      uint64_t v22 = &v17[8 * v15];
      do
      {
LABEL_19:
        uint64_t v31 = *(void *)v6;
        v6 += 8;
        *(void *)uint64_t v22 = v31;
        v22 += 8;
      }
      while (v22 != v4);
      goto LABEL_20;
    }
    uint64_t v23 = &v17[8 * v15];
    uint64_t v22 = v23;
    if ((unint64_t)(v23 - v6) < 0x20) {
      goto LABEL_19;
    }
    uint64_t v24 = (v21 >> 3) + 1;
    uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
    uint64_t v22 = &v18[v25];
    uint64_t v26 = &v6[v25];
    unint64_t v27 = (long long *)(v6 + 16);
    unsigned int v28 = v23 + 16;
    uint64_t v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v30 = *v27;
      *(v28 - 1) = *(v27 - 1);
      _OWORD *v28 = v30;
      v27 += 2;
      v28 += 2;
      v29 -= 4;
    }
    while (v29);
    uint64_t v6 = v26;
    if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL)) {
      goto LABEL_19;
    }
  }
LABEL_20:
  *a1 = v17;
  a1[1] = v18;
  a1[2] = v4;
  a1[3] = &v17[v16];
  if (v5)
  {
    operator delete(v5);
    unint64_t v4 = a1[2];
  }
LABEL_22:
  *(void *)unint64_t v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front(void **a1, void *a2)
{
  unint64_t v4 = (char *)a1[1];
  if (v4 == *a1)
  {
    uint64_t v7 = a1[2];
    uint64_t v6 = a1[3];
    if (v7 >= v6)
    {
      uint64_t v13 = v6 - v4;
      BOOL v12 = v13 == 0;
      unint64_t v14 = v13 >> 2;
      if (v12) {
        unint64_t v14 = 1;
      }
      if (v14 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v15 = (v14 + 3) >> 2;
      uint64_t v16 = 8 * v14;
      uint64_t v17 = (char *)operator new(8 * v14);
      char v5 = &v17[8 * v15];
      uint64_t v18 = v5;
      uint64_t v19 = v7 - v4;
      if (v7 != v4)
      {
        uint64_t v18 = &v5[v19 & 0xFFFFFFFFFFFFFFF8];
        unint64_t v20 = v19 - 8;
        unint64_t v21 = &v17[8 * v15];
        uint64_t v22 = v4;
        if (v20 < 0x38) {
          goto LABEL_27;
        }
        uint64_t v23 = &v17[8 * v15];
        unint64_t v21 = v23;
        uint64_t v22 = v4;
        if ((unint64_t)(v23 - v4) < 0x20) {
          goto LABEL_27;
        }
        uint64_t v24 = (v20 >> 3) + 1;
        uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
        unint64_t v21 = &v5[v25];
        uint64_t v22 = &v4[v25];
        uint64_t v26 = (long long *)(v4 + 16);
        unint64_t v27 = v23 + 16;
        uint64_t v28 = v24 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v29 = *v26;
          *(v27 - 1) = *(v26 - 1);
          *unint64_t v27 = v29;
          v26 += 2;
          v27 += 2;
          v28 -= 4;
        }
        while (v28);
        if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_27:
          do
          {
            uint64_t v30 = *(void *)v22;
            v22 += 8;
            *(void *)unint64_t v21 = v30;
            v21 += 8;
          }
          while (v21 != v18);
        }
      }
      *a1 = v17;
      a1[1] = v5;
      a1[2] = v18;
      a1[3] = &v17[v16];
      if (v4)
      {
        operator delete(v4);
        char v5 = (char *)a1[1];
      }
    }
    else
    {
      uint64_t v8 = (v6 - v7) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v11 = &v7[8 * (v9 >> 1)];
      char v5 = &v11[-(v7 - v4)];
      if (v7 != v4)
      {
        memmove(&v11[-(v7 - v4)], v4, v7 - v4);
        unint64_t v4 = (char *)a1[2];
      }
      a1[1] = v5;
      a1[2] = &v4[8 * v10];
    }
  }
  else
  {
    char v5 = (char *)a1[1];
  }
  *((void *)v5 - 1) = *a2;
  a1[1] = (char *)a1[1] - 8;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  uint64_t v6 = operator new(8uLL);
  *uint64_t v6 = &unk_26CE32530;
  uint64_t v7 = operator new(0x10uLL);
  v7[1] = v6;
  uint64_t v8 = operator new(0x20uLL);
  *uint64_t v8 = &unk_26CE32588;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = v7;
  uint64_t v9 = *(std::__shared_weak_count **)(a1 + 48);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  if (!v9 || atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    *(void *)(a1 + 56) = v10;
    unsigned int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
    if (v11 <= 0x3F) {
      goto LABEL_4;
    }
LABEL_9:
    switch(v11)
    {
      case 0x40u:
LABEL_20:
        return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
      case 0x80u:
        uint64_t v17 = (std::basic_regex<char>::value_type *)memchr(a2, 10, a3 - a2);
        if (v17) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = a3;
        }
        if (v18 == a2)
        {
          uint64_t v19 = operator new(0x10uLL);
          uint64_t v20 = *(void *)(v10 + 8);
          v19[1] = v20;
          *(void *)(v10 + 8) = v19;
          *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
          if (v18 != a3) {
            ++v18;
          }
          if (v18 == a3) {
            return a3;
          }
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)a2, v18);
          if (v18 != a3) {
            ++v18;
          }
          if (v18 == a3) {
            return a3;
          }
        }
        uint64_t v32 = *(void *)(a1 + 56);
        do
        {
          unint64_t v41 = (std::basic_regex<char>::value_type *)memchr(v18, 10, a3 - v18);
          if (v41) {
            uint64_t v42 = v41;
          }
          else {
            uint64_t v42 = a3;
          }
          if (v42 == v18)
          {
            unint64_t v33 = operator new(0x10uLL);
            uint64_t v34 = *(void *)(v32 + 8);
            v33[1] = v34;
            *(void *)(v32 + 8) = v33;
            *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)v18, v42);
          }
          uint64_t v35 = operator new(0x18uLL);
          uint64_t v36 = *(void *)(v32 + 8);
          v35[1] = *(void *)(v10 + 8);
          v35[2] = v36;
          *uint64_t v35 = &unk_26CE32B48;
          *(void *)(v10 + 8) = v35;
          *(void *)(v32 + 8) = 0;
          uint64_t v37 = operator new(0x10uLL);
          uint64_t v38 = *(void *)(*(void *)(a1 + 56) + 8);
          v37[1] = v38;
          *(void *)(v32 + 8) = v37;
          *(void *)(*(void *)(a1 + 56) + 8) = 0;
          int64_t v39 = operator new(0x10uLL);
          uint64_t v40 = *(void *)(v32 + 8);
          void *v39 = &unk_26CE32B90;
          v39[1] = v40;
          *(void *)(*(void *)(a1 + 56) + 8) = v39;
          uint64_t v32 = *(void *)(v32 + 8);
          *(void *)(a1 + 56) = v32;
          if (v42 == a3) {
            uint64_t v18 = v42;
          }
          else {
            uint64_t v18 = v42 + 1;
          }
        }
        while (v18 != a3);
        break;
      case 0x100u:
        BOOL v12 = (std::basic_regex<char>::value_type *)memchr(a2, 10, a3 - a2);
        if (v12) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = a3;
        }
        if (v13 == a2)
        {
          unint64_t v14 = operator new(0x10uLL);
          uint64_t v15 = *(void *)(v10 + 8);
          v14[1] = v15;
          *(void *)(v10 + 8) = v14;
          *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
          if (v13 != a3) {
            ++v13;
          }
          if (v13 == a3) {
            return a3;
          }
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, v13);
          if (v13 != a3) {
            ++v13;
          }
          if (v13 == a3) {
            return a3;
          }
        }
        uint64_t v21 = *(void *)(a1 + 56);
        do
        {
          uint64_t v30 = (std::basic_regex<char>::value_type *)memchr(v13, 10, a3 - v13);
          if (v30) {
            uint64_t v31 = v30;
          }
          else {
            uint64_t v31 = a3;
          }
          if (v31 == v13)
          {
            uint64_t v22 = operator new(0x10uLL);
            uint64_t v23 = *(void *)(v21 + 8);
            v22[1] = v23;
            *(void *)(v21 + 8) = v22;
            *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v13, v31);
          }
          uint64_t v24 = operator new(0x18uLL);
          uint64_t v25 = *(void *)(v21 + 8);
          v24[1] = *(void *)(v10 + 8);
          void v24[2] = v25;
          void *v24 = &unk_26CE32B48;
          *(void *)(v10 + 8) = v24;
          *(void *)(v21 + 8) = 0;
          uint64_t v26 = operator new(0x10uLL);
          uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
          v26[1] = v27;
          *(void *)(v21 + 8) = v26;
          *(void *)(*(void *)(a1 + 56) + 8) = 0;
          uint64_t v28 = operator new(0x10uLL);
          uint64_t v29 = *(void *)(v21 + 8);
          void *v28 = &unk_26CE32B90;
          v28[1] = v29;
          *(void *)(*(void *)(a1 + 56) + 8) = v28;
          uint64_t v21 = *(void *)(v21 + 8);
          *(void *)(a1 + 56) = v21;
          if (v31 == a3) {
            uint64_t v13 = v31;
          }
          else {
            uint64_t v13 = v31 + 1;
          }
        }
        while (v13 != a3);
        break;
      default:
        goto LABEL_66;
    }
    return a3;
  }
  ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
  std::__shared_weak_count::__release_weak(v9);
  uint64_t v10 = *(void *)(a1 + 40);
  *(void *)(a1 + 56) = v10;
  unsigned int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v11 > 0x3F) {
    goto LABEL_9;
  }
LABEL_4:
  if (v11)
  {
    if (v11 != 16)
    {
      if (v11 != 32) {
LABEL_66:
      }
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>();
      goto LABEL_20;
    }
    return std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)a2, a3);
  }
  else
  {
    return std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
  }
}

void sub_21D841D4C(_Unwind_Exception *a1)
{
  std::__empty_state<char>::~__empty_state(v2);
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  std::vector<std::csub_match>::pointer end = a1->__end_;
  uint64_t v7 = a2;
  while (1)
  {
    uint64_t v8 = v7;
    uint64_t v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>((uint64_t)a1, v7, a3);
    if (v8 == v7) {
      break;
    }
LABEL_2:
    if (v7 == v8) {
      goto LABEL_6;
    }
  }
  uint64_t v9 = a1->__end_;
  unsigned int marked_count = a1->__marked_count_;
  unsigned int v11 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(a1, v8, a3);
  if (v8 != (std::basic_regex<char>::value_type *)v11)
  {
    uint64_t v7 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v11, (std::basic_regex<char> *)a3, v9, marked_count + 1, a1->__marked_count_ + 1);
    goto LABEL_2;
  }
LABEL_6:
  if (v8 == a2)
  {
    BOOL v12 = (std::__node<char> *)operator new(0x10uLL);
    uint64_t v13 = a1->__end_;
    char first = v13->__first_;
    v12[1].__vftable = (std::__node<char>_vtbl *)first;
    v13->__first_ = v12;
    uint64_t v15 = (std::__owns_one_state<char> *)a1->__end_->__first_;
    goto LABEL_8;
  }
LABEL_9:
  if (v8 == a3) {
    return a3;
  }
  if (*v8 == 124)
  {
    uint64_t v16 = a1->__end_;
    uint64_t v17 = v8 + 1;
    uint64_t v18 = v8 + 1;
    while (1)
    {
      uint64_t v8 = v18;
      uint64_t v18 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>((uint64_t)a1, v18, a3);
      if (v8 == v18)
      {
        uint64_t v19 = a1->__end_;
        unsigned int v20 = a1->__marked_count_;
        uint64_t v21 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(a1, v8, a3);
        if (v8 == (std::basic_regex<char>::value_type *)v21)
        {
LABEL_16:
          if (v8 == v17)
          {
            uint64_t v22 = (std::__node<char> *)operator new(0x10uLL);
            uint64_t v23 = a1->__end_;
            uint64_t v24 = v23->__first_;
            v22[1].__vftable = (std::__node<char>_vtbl *)v24;
            v23->__first_ = v22;
            a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
          }
          uint64_t v25 = (std::__node<char> *)operator new(0x18uLL);
          uint64_t v26 = v16->__first_;
          v25[1].__vftable = (std::__node<char>_vtbl *)end->__first_;
          v25[2].__vftable = (std::__node<char>_vtbl *)v26;
          v25->__vftable = (std::__node<char>_vtbl *)&unk_26CE32B48;
          end->__first_ = v25;
          v16->__first_ = 0;
          uint64_t v27 = (std::__node<char> *)operator new(0x10uLL);
          uint64_t v28 = a1->__end_->__first_;
          v27[1].__vftable = (std::__node<char>_vtbl *)v28;
          v16->__first_ = v27;
          a1->__end_->__first_ = 0;
          uint64_t v29 = (std::__node<char> *)operator new(0x10uLL);
          uint64_t v30 = v16->__first_;
          v29->__vftable = (std::__node<char>_vtbl *)&unk_26CE32B90;
          v29[1].__vftable = (std::__node<char>_vtbl *)v30;
          a1->__end_->__first_ = v29;
          uint64_t v15 = (std::__owns_one_state<char> *)v16->__first_;
LABEL_8:
          a1->__end_ = v15;
          goto LABEL_9;
        }
        uint64_t v18 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v21, (std::basic_regex<char> *)a3, v19, v20 + 1, a1->__marked_count_ + 1);
      }
      if (v18 == v8) {
        goto LABEL_16;
      }
    }
  }
  return v8;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char>::value_type *a3)
{
  BOOL v3 = a2;
  if (a2 == (std::basic_regex<char> *)a3) {
    return (std::basic_regex<char>::value_type *)a2;
  }
  if (LOBYTE(a2->__traits_.__loc_.__locale_) == 94)
  {
    uint64_t v6 = operator new(0x18uLL);
    BOOL v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(v8 + 8);
    *uint64_t v6 = &unk_26CE32680;
    v6[1] = v9;
    *((unsigned char *)v6 + 16) = v7;
    *(void *)(v8 + 8) = v6;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    BOOL v3 = (std::basic_regex<char> *)((char *)v3 + 1);
  }
  if (v3 != (std::basic_regex<char> *)a3)
  {
    while (v3 != (std::basic_regex<char> *)a3)
    {
      uint64_t v10 = (std::basic_regex<char>::value_type *)v3;
      unsigned int v11 = *(std::__owns_one_state<char> **)(a1 + 56);
      int v12 = *(_DWORD *)(a1 + 28);
      uint64_t v13 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(a1, v10, a3);
      if (v10 != (std::basic_regex<char>::value_type *)v13)
      {
        BOOL v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v13, (std::basic_regex<char> *)a3, v11, (v12 + 1), (*(_DWORD *)(a1 + 28) + 1));
        if (v10 != (std::basic_regex<char>::value_type *)v3) {
          continue;
        }
      }
      if (v10 + 1 != a3 || *v10 != 36) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      }
      unint64_t v14 = operator new(0x18uLL);
      BOOL v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v16 = *(void *)(a1 + 56);
      uint64_t v17 = *(void *)(v16 + 8);
      *unint64_t v14 = &unk_26CE326C8;
      v14[1] = v17;
      *((unsigned char *)v14 + 16) = v15;
      *(void *)(v16 + 8) = v14;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      return a3;
    }
  }
  return a3;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  std::vector<std::csub_match>::pointer end = a1->__end_;
  BOOL v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (v7 == (std::basic_regex<char> *)a2) {
    goto LABEL_12;
  }
  do
  {
    uint64_t v8 = v7;
    BOOL v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char>::value_type *)v7, a3);
  }
  while (v8 != v7);
  if (v8 == (std::basic_regex<char> *)a2) {
LABEL_12:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  if (v8 == (std::basic_regex<char> *)a3) {
    return a3;
  }
  while (LOBYTE(v8->__traits_.__loc_.__locale_) == 124)
  {
    uint64_t v9 = a1->__end_;
    uint64_t v10 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    unsigned int v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char>::value_type *)&v8->__traits_.__loc_.__locale_ + 1, a3);
    if ((std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1) == v11) {
      goto LABEL_12;
    }
    do
    {
      uint64_t v8 = v11;
      unsigned int v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char>::value_type *)v11, a3);
    }
    while (v8 != v11);
    if (v8 == v10) {
      goto LABEL_12;
    }
    int v12 = (std::__node<char> *)operator new(0x18uLL);
    char first = v9->__first_;
    v12[1].__vftable = (std::__node<char>_vtbl *)end->__first_;
    v12[2].__vftable = (std::__node<char>_vtbl *)first;
    v12->__vftable = (std::__node<char>_vtbl *)&unk_26CE32B48;
    end->__first_ = v12;
    v9->__first_ = 0;
    unint64_t v14 = (std::__node<char> *)operator new(0x10uLL);
    BOOL v15 = a1->__end_->__first_;
    v14[1].__vftable = (std::__node<char>_vtbl *)v15;
    v9->__first_ = v14;
    a1->__end_->__first_ = 0;
    uint64_t v16 = (std::__node<char> *)operator new(0x10uLL);
    uint64_t v17 = v9->__first_;
    v16->__vftable = (std::__node<char>_vtbl *)&unk_26CE32B90;
    v16[1].__vftable = (std::__node<char>_vtbl *)v17;
    a1->__end_->__first_ = v16;
    a1->__end_ = (std::__owns_one_state<char> *)v9->__first_;
    if (v8 == (std::basic_regex<char> *)a3) {
      return a3;
    }
  }
  return (std::basic_regex<char>::value_type *)v8;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  BOOL v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v6 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 != a3)
      {
        int v16 = a2[1];
        if (v16 == 66)
        {
          uint64_t v17 = (char *)operator new(0x30uLL);
          uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
          *(void *)uint64_t v17 = &unk_26CE32710;
          *((void *)v17 + 1) = v19;
          std::locale::locale((std::locale *)v17 + 2, (const std::locale *)a1);
          *(_OWORD *)(v17 + 24) = *(_OWORD *)(a1 + 8);
          v17[40] = 1;
        }
        else
        {
          if (v16 != 98) {
            return v3;
          }
          uint64_t v17 = (char *)operator new(0x30uLL);
          uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
          *(void *)uint64_t v17 = &unk_26CE32710;
          *((void *)v17 + 1) = v18;
          std::locale::locale((std::locale *)v17 + 2, (const std::locale *)a1);
          *(_OWORD *)(v17 + 24) = *(_OWORD *)(a1 + 8);
          v17[40] = 0;
        }
        *(void *)(*(void *)(a1 + 56) + 8) = v17;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
        return v3 + 2;
      }
      return v3;
    }
    if (v6 != 94) {
      return v3;
    }
    unsigned int v11 = operator new(0x18uLL);
    BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v13 = *(void *)(a1 + 56);
    v11[1] = *(void *)(v13 + 8);
    unint64_t v14 = &unk_26CE32680;
LABEL_17:
    *unsigned int v11 = v14;
    *((unsigned char *)v11 + 16) = v12;
    *(void *)(v13 + 8) = v11;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    return ++v3;
  }
  if (v6 == 36)
  {
    unsigned int v11 = operator new(0x18uLL);
    BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v13 = *(void *)(a1 + 56);
    v11[1] = *(void *)(v13 + 8);
    unint64_t v14 = &unk_26CE326C8;
    goto LABEL_17;
  }
  if (v6 != 40 || a2 + 1 == a3 || a2[1] != 63 || a2 + 2 == a3) {
    return v3;
  }
  int v7 = a2[2];
  if (v7 == 33)
  {
    *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v22.__loop_count_ = v20;
    *(_OWORD *)&v22.__start_.__cntrl_ = v20;
    *(_OWORD *)&v22.__traits_.__loc_.__locale_ = v20;
    *(_OWORD *)&v22.__traits_.__col_ = v20;
    std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v22);
    v22.__flags_ = *(_DWORD *)(a1 + 24);
    uint64_t v9 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v22, v3 + 3, a3);
    unsigned int marked_count = v22.__marked_count_;
    std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v22, 1, *(_DWORD *)(a1 + 28));
    *(_DWORD *)(a1 + 28) += marked_count;
    if (v9 == a3 || *v9 != 41) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    goto LABEL_27;
  }
  if (v7 != 61) {
    return v3;
  }
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v22.__loop_count_ = v8;
  *(_OWORD *)&v22.__start_.__cntrl_ = v8;
  *(_OWORD *)&v22.__traits_.__loc_.__locale_ = v8;
  *(_OWORD *)&v22.__traits_.__col_ = v8;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v22);
  v22.__flags_ = *(_DWORD *)(a1 + 24);
  uint64_t v9 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v22, v3 + 3, a3);
  unsigned int v10 = v22.__marked_count_;
  std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v22, 0, *(_DWORD *)(a1 + 28));
  *(_DWORD *)(a1 + 28) += v10;
  if (v9 == a3 || *v9 != 41) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
  }
LABEL_27:
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&v22.__traits_.__loc_);
  return v9 + 1;
}

void sub_21D84264C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_21D842660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_21D842674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_21D842688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  BOOL v3 = a2;
  if (a2 == a3) {
    return a2;
  }
  int v5 = *a2;
  int v7 = a2;
  switch(*a2)
  {
    case '$':
    case ')':
    case ']':
    case '^':
    case '|':
    case '}':
      return v7;
    case '(':
      if (a2 + 1 == a3) {
        goto LABEL_57;
      }
      if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
      {
        ++this->__open_count_;
        BOOL v12 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(this, a2 + 3, a3);
        if (v12 != a3 && *v12 == 41)
        {
          --this->__open_count_;
          return v12 + 1;
        }
LABEL_57:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      }
      if ((this->__flags_ & 2) != 0)
      {
        unsigned int marked_count = this->__marked_count_;
      }
      else
      {
        int v16 = (std::__node<char> *)operator new(0x18uLL);
        unsigned int marked_count = this->__marked_count_ + 1;
        this->__marked_count_ = marked_count;
        std::vector<std::csub_match>::pointer end = this->__end_;
        char first = end->__first_;
        v16->__vftable = (std::__node<char>_vtbl *)&unk_26CE329E0;
        v16[1].__vftable = (std::__node<char>_vtbl *)first;
        LODWORD(v16[2].__vftable) = marked_count;
        end->__first_ = v16;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      ++this->__open_count_;
      long long v20 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(this, v3 + 1, a3);
      if (v20 == a3) {
        goto LABEL_57;
      }
      BOOL v3 = v20;
      if (*v20 != 41) {
        goto LABEL_57;
      }
      if ((this->__flags_ & 2) == 0)
      {
        uint64_t v21 = (std::__node<char> *)operator new(0x18uLL);
        std::basic_regex<char> v22 = this->__end_;
        uint64_t v23 = v22->__first_;
        v21->__vftable = (std::__node<char>_vtbl *)&unk_26CE32A28;
        v21[1].__vftable = (std::__node<char>_vtbl *)v23;
        LODWORD(v21[2].__vftable) = marked_count;
        v22->__first_ = v21;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      --this->__open_count_;
      return v3 + 1;
    case '*':
    case '+':
    case '?':
    case '{':
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
    case '.':
      uint64_t v9 = (std::__node<char> *)operator new(0x10uLL);
      unsigned int v10 = this->__end_;
      unsigned int v11 = v10->__first_;
      v9->__vftable = (std::__node<char>_vtbl *)&unk_26CE327A0;
      v9[1].__vftable = (std::__node<char>_vtbl *)v11;
      v10->__first_ = v9;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      return v3 + 1;
    case '[':
      return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, a2, a3);
    case '\\':
      int v7 = a2;
      if (v5 != 92) {
        return v7;
      }
      uint64_t v13 = (unsigned __int8 *)(a2 + 1);
      if (a2 + 1 == a3) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
      }
      int v14 = *v13;
      unsigned int v15 = v14 - 48;
      if (v14 != 48)
      {
        if ((v14 - 49) <= 8)
        {
          int v7 = v3 + 2;
          if (v3 + 2 == a3)
          {
            int v7 = a3;
          }
          else
          {
            while (1)
            {
              int v24 = *v7;
              if ((v24 - 48) > 9) {
                break;
              }
              if (v15 >= 0x19999999) {
                goto LABEL_58;
              }
              ++v7;
              unsigned int v15 = v24 + 10 * v15 - 48;
              if (v7 == a3)
              {
                int v7 = a3;
                break;
              }
            }
            if (!v15) {
LABEL_58:
            }
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
          }
          if (v15 > this->__marked_count_) {
            goto LABEL_58;
          }
          std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, v15);
          if (v7 != (std::basic_regex<char>::value_type *)v13) {
            return v7;
          }
          LOBYTE(v14) = *v13;
        }
        switch((char)v14)
        {
          case 'D':
            uint64_t v25 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v25, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_49;
          case 'S':
            uint64_t v25 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v25, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_53;
          case 'W':
            uint64_t v27 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v27, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_51;
          case 'd':
            uint64_t v25 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v25, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_49:
            this->__end_->__first_ = v25;
            this->__end_ = v25;
            int v28 = LODWORD(v25[10].__vftable) | 0x400;
            goto LABEL_54;
          case 's':
            uint64_t v25 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v25, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_53:
            this->__end_->__first_ = v25;
            this->__end_ = v25;
            int v28 = LODWORD(v25[10].__vftable) | 0x4000;
LABEL_54:
            LODWORD(v25[10].__vftable) = v28;
            break;
          case 'w':
            uint64_t v27 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v27, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_51:
            this->__end_->__first_ = v27;
            this->__end_ = v27;
            LODWORD(v27[10].__vftable) |= 0x500u;
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v27, 95);
            break;
          default:
            uint64_t v26 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(this, (unsigned __int8 *)v3 + 1, (unsigned __int8 *)a3, 0);
            if (v13 == v26) {
              return v3;
            }
            else {
              return (std::basic_regex<char>::value_type *)v26;
            }
        }
        return v3 + 2;
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v15);
      return v3 + 2;
    default:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v5);
      return v3 + 1;
  }
}

void sub_21D842BE0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21D842BF4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21D842C08(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21D842C1C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21D842C30(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21D842C44(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  if (this == a3) {
    return this;
  }
  int v6 = *(_DWORD *)(a1 + 24) & 0x1F0;
  int locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low <= 62)
  {
    if (locale_low == 42)
    {
      uint64_t v9 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (v6) {
        BOOL v21 = 1;
      }
      else {
        BOOL v21 = v9 == a3;
      }
      if (!v21 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        unsigned int v10 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_std::vector<std::csub_match>::pointer begin = __mexp_begin;
        __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
        size_t v11 = 0;
        goto LABEL_36;
      }
      __mexp_std::vector<std::csub_match>::pointer begin = __mexp_begin;
      __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
      size_t v25 = 0;
      goto LABEL_45;
    }
    long long v8 = this;
    if (locale_low == 43)
    {
      uint64_t v9 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (!v6 && v9 != a3 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        unsigned int v10 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_std::vector<std::csub_match>::pointer begin = __mexp_begin;
        __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
        size_t v11 = 1;
LABEL_36:
        std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v11, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 0);
        return (std::basic_regex<char> *)v10;
      }
      __mexp_std::vector<std::csub_match>::pointer begin = __mexp_begin;
      __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
      size_t v25 = 1;
      goto LABEL_45;
    }
    return v8;
  }
  if (locale_low == 63)
  {
    std::basic_regex<char> v22 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
    if (v6) {
      BOOL v23 = 1;
    }
    else {
      BOOL v23 = v22 == a3;
    }
    if (v23 || LOBYTE(v22->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 1);
      return v22;
    }
    else
    {
      int v24 = (char *)&this->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v24;
    }
  }
  else
  {
    long long v8 = this;
    if (locale_low != 123) {
      return v8;
    }
    uint64_t v13 = (char *)&this->__traits_.__loc_.__locale_ + 1;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3) {
      goto LABEL_72;
    }
    int v14 = *v13;
    if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38) {
      goto LABEL_72;
    }
    int v15 = v14 - 48;
    int v16 = (char *)&this->__traits_.__loc_.__locale_ + 2;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2) == a3)
    {
LABEL_21:
      int v16 = (char *)a3;
    }
    else
    {
      while (1)
      {
        int v17 = *v16;
        if ((v17 & 0xF8) != 0x30 && (v17 & 0xFE) != 0x38) {
          break;
        }
        if (v15 >= 214748364) {
          goto LABEL_72;
        }
        int v15 = v17 + 10 * v15 - 48;
        if (++v16 == (char *)a3) {
          goto LABEL_21;
        }
      }
    }
    if (v16 == v13) {
      goto LABEL_72;
    }
    if (v16 == (char *)a3) {
      goto LABEL_73;
    }
    int v18 = *v16;
    if (v18 != 44)
    {
      if (v18 == 125)
      {
        uint64_t v19 = (std::basic_regex<char> *)(v16 + 1);
        if (v6 || v19 == a3 || LOBYTE(v19->__traits_.__loc_.__locale_) != 63)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v15, a4, __mexp_begin, __mexp_end, 1);
          return v19;
        }
        else
        {
          long long v20 = (unsigned __int8 *)(v16 + 2);
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v15, a4, __mexp_begin, __mexp_end, 0);
          return (std::basic_regex<char> *)v20;
        }
      }
LABEL_72:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
    }
    uint64_t v26 = (std::basic_regex<char> *)(v16 + 1);
    if (v16 + 1 == (char *)a3) {
      goto LABEL_72;
    }
    int v27 = LOBYTE(v26->__traits_.__loc_.__locale_);
    if (v27 == 125)
    {
      uint64_t v9 = (std::basic_regex<char> *)(v16 + 2);
      if (!v6 && v9 != a3 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        size_t v11 = v15;
        unsigned int v10 = v16 + 3;
        __mexp_std::vector<std::csub_match>::pointer begin = __mexp_begin;
        __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
        goto LABEL_36;
      }
      size_t v25 = v15;
      __mexp_std::vector<std::csub_match>::pointer begin = __mexp_begin;
      __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
LABEL_45:
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v25, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
      return v9;
    }
    if ((v27 & 0xF8) != 0x30 && (v27 & 0xFE) != 0x38) {
      goto LABEL_73;
    }
    int v28 = v27 - 48;
    uint64_t v29 = (std::basic_regex<char> *)(v16 + 2);
    if (v29 == a3)
    {
LABEL_61:
      uint64_t v29 = a3;
    }
    else
    {
      while (1)
      {
        int v30 = LOBYTE(v29->__traits_.__loc_.__locale_);
        if ((v30 & 0xF8) != 0x30 && (v30 & 0xFE) != 0x38) {
          break;
        }
        if (v28 >= 214748364) {
          goto LABEL_72;
        }
        int v28 = v30 + 10 * v28 - 48;
        uint64_t v29 = (std::basic_regex<char> *)((char *)v29 + 1);
        if (v29 == a3) {
          goto LABEL_61;
        }
      }
    }
    if (v29 == v26 || v29 == a3 || LOBYTE(v29->__traits_.__loc_.__locale_) != 125) {
LABEL_73:
    }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    if (v28 < v15) {
      goto LABEL_72;
    }
    uint64_t v31 = (std::basic_regex<char> *)((char *)&v29->__traits_.__loc_.__locale_ + 1);
    if (v6 || v31 == a3 || LOBYTE(v31->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v28, a4, __mexp_begin, __mexp_end, 1);
      return v31;
    }
    else
    {
      uint64_t v32 = (char *)&v29->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v28, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v32;
    }
  }
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3) {
      goto LABEL_192;
    }
    int v5 = a2[1];
    char v6 = v5 == 94;
    uint64_t v7 = (uint64_t)(v5 == 94 ? a2 + 2 : a2 + 1);
    long long v8 = operator new(0xB0uLL);
    std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v8, a1, *(void *)(*(void *)(a1 + 56) + 8), v6, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
    *(void *)(*(void *)(a1 + 56) + 8) = v8;
    *(void *)(a1 + 56) = v8;
    if ((std::basic_regex<char>::value_type *)v7 == a3) {
      goto LABEL_192;
    }
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *(unsigned char *)v7 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 93);
      ++v7;
    }
    if ((std::basic_regex<char>::value_type *)v7 == a3) {
      goto LABEL_192;
    }
    uint64_t v68 = 4 - (void)a3;
    while (1)
    {
      uint64_t v9 = (std::basic_regex<char>::value_type *)v7;
      if ((std::basic_regex<char>::value_type *)v7 == a3)
      {
        uint64_t v7 = (uint64_t)a3;
        goto LABEL_15;
      }
      int v10 = *(unsigned __int8 *)v7;
      size_t v11 = (std::basic_regex<char>::value_type *)v7;
      if (v10 == 93) {
        goto LABEL_14;
      }
      __p[0] = 0;
      __p[1] = 0;
      unint64_t v72 = 0;
      size_t v11 = (std::basic_regex<char>::value_type *)v7;
      if ((std::basic_regex<char>::value_type *)(v7 + 1) == a3 || v10 != 91) {
        goto LABEL_60;
      }
      int v12 = *(unsigned __int8 *)(v7 + 1);
      if (v12 != 46)
      {
        if (v12 == 58)
        {
          uint64_t v19 = (char *)(v7 + 2);
          if ((uint64_t)&a3[-v7 - 2] < 2) {
            goto LABEL_190;
          }
          uint64_t v20 = v7 - (void)a3;
          uint64_t v21 = 2;
          while (1)
          {
            unint64_t v22 = v21 - 2;
            while (*(unsigned char *)(v7 + v22 + 2) != 58)
            {
              ++v22;
              if (v20 + v22 == -3) {
                goto LABEL_190;
              }
            }
            if (*(unsigned char *)(v7 + v22 + 3) == 93) {
              break;
            }
            uint64_t v21 = v22 + 3;
            if (v20 + v22 == -4) {
              goto LABEL_190;
            }
          }
          uint64_t v34 = v7 + v22 + 2;
          if ((std::basic_regex<char>::value_type *)v34 == a3) {
            goto LABEL_190;
          }
          int v35 = *(_DWORD *)(a1 + 24);
          memset(v74, 170, 24);
          if (v22 >= 0x7FFFFFFFFFFFFFF8) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          if (v22 >= 0x17)
          {
            uint64_t v39 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v22 | 7) != 0x17) {
              uint64_t v39 = v22 | 7;
            }
            uint64_t v40 = v39 + 1;
            uint64_t v36 = operator new(v39 + 1);
            *((void *)&v74[0] + 1) = v22;
            *(void *)&v74[1] = v40 | 0x8000000000000000;
            *(void *)&v74[0] = v36;
          }
          else
          {
            BYTE7(v74[1]) = v22;
            uint64_t v36 = v74;
            if (!v22)
            {
              uint64_t v37 = v74;
              goto LABEL_144;
            }
          }
          if (v22 < 0x20)
          {
            uint64_t v37 = v36;
          }
          else if ((unint64_t)((char *)v36 - v19) < 0x20)
          {
            uint64_t v37 = v36;
          }
          else
          {
            uint64_t v37 = (char *)v36 + (v22 & 0xFFFFFFFFFFFFFFE0);
            v19 += v22 & 0xFFFFFFFFFFFFFFE0;
            unint64_t v41 = (long long *)(v9 + 18);
            uint64_t v42 = v36 + 1;
            unint64_t v43 = v22 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v44 = *v41;
              *(v42 - 1) = *(v41 - 1);
              *uint64_t v42 = v44;
              v41 += 2;
              v42 += 2;
              v43 -= 32;
            }
            while (v43);
            if (v22 == (v22 & 0x7FFFFFFFFFFFFFE0)) {
              goto LABEL_144;
            }
          }
          do
          {
            char v61 = *v19++;
            *v37++ = v61;
          }
          while (v19 != (char *)v34);
LABEL_144:
          *uint64_t v37 = 0;
          uint64_t v62 = BYTE7(v74[1]);
          if ((SBYTE7(v74[1]) & 0x80u) == 0) {
            char v63 = (char *)v74;
          }
          else {
            char v63 = *(char **)&v74[0];
          }
          if (SBYTE7(v74[1]) < 0) {
            uint64_t v62 = *((void *)&v74[0] + 1);
          }
          (*(void (**)(void, char *, char *))(**(void **)(a1 + 8) + 48))(*(void *)(a1 + 8), v63, &v63[v62]);
          if ((SBYTE7(v74[1]) & 0x80u) == 0) {
            uint64_t v64 = (const char *)v74;
          }
          else {
            uint64_t v64 = *(const char **)&v74[0];
          }
          std::regex_traits<char>::char_class_type classname = std::__get_classname(v64, v35 & 1);
          if (SBYTE7(v74[1]) < 0) {
            operator delete(*(void **)&v74[0]);
          }
          if (!classname) {
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
          }
          char v59 = 0;
          *((_DWORD *)v8 + 40) |= classname;
          uint64_t v7 = (uint64_t)&v9[v22 + 4];
          uint64_t v53 = v9;
          if ((SHIBYTE(v72) & 0x80000000) == 0)
          {
LABEL_135:
            size_t v11 = v53;
            if ((v59 & 1) == 0) {
              goto LABEL_15;
            }
            goto LABEL_14;
          }
          goto LABEL_164;
        }
        if (v12 == 61)
        {
          if ((uint64_t)&a3[-v7 - 2] < 2) {
            goto LABEL_190;
          }
          uint64_t v13 = 0;
          uint64_t v14 = v7;
          uint64_t v15 = v68 + v7;
          if (*(unsigned char *)(v7 + 2) == 61) {
            goto LABEL_27;
          }
          do
          {
            do
            {
              if (!v15) {
LABEL_190:
              }
                std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
              ++v13;
              uint64_t v14 = v7 + v13;
              uint64_t v15 = v68 + v7 + v13;
            }
            while (*(unsigned char *)(v7 + v13 + 2) != 61);
LABEL_27:
            ;
          }
          while (*(unsigned char *)(v14 + 3) != 93);
          int v16 = (char *)(v7 + v13 + 2);
          if (v16 == a3) {
            goto LABEL_190;
          }
          memset(v74, 170, 24);
          std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>((uint64_t)v74, a1, v7 + 2, v16);
          if (SBYTE7(v74[1]) < 0)
          {
            uint64_t v17 = *((void *)&v74[0] + 1);
            if (!*((void *)&v74[0] + 1)) {
LABEL_194:
            }
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
            memset(__s, 170, 24);
            int v18 = *(char **)&v74[0];
          }
          else
          {
            uint64_t v17 = BYTE7(v74[1]);
            if (!BYTE7(v74[1])) {
              goto LABEL_194;
            }
            int v18 = (char *)v74;
            memset(__s, 170, 24);
          }
          std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(__s, a1, (uint64_t)v18, &v18[v17]);
          uint64_t v45 = (std::string::value_type *)HIBYTE(__s[2]);
          if (SHIBYTE(__s[2]) < 0) {
            uint64_t v45 = __s[1];
          }
          if (v45)
          {
            unint64_t v46 = *((void *)v8 + 18);
            if (v46 >= *((void *)v8 + 19))
            {
              *((void *)v8 + 18) = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)v8 + 17, (uint64_t)__s);
              if (SHIBYTE(__s[2]) < 0) {
                goto LABEL_170;
              }
            }
            else
            {
              if (SHIBYTE(__s[2]) < 0)
              {
                std::string::__init_copy_ctor_external(*((std::string **)v8 + 18), __s[0], (std::string::size_type)__s[1]);
              }
              else
              {
                long long v47 = *(_OWORD *)__s;
                *(std::string::value_type **)(v46 + 16) = __s[2];
                *(_OWORD *)unint64_t v46 = v47;
              }
              *((void *)v8 + 18) = v46 + 24;
              *((void *)v8 + 18) = v46 + 24;
              if (SHIBYTE(__s[2]) < 0) {
                goto LABEL_170;
              }
            }
LABEL_162:
            if ((SBYTE7(v74[1]) & 0x80000000) == 0) {
              goto LABEL_163;
            }
          }
          else
          {
            uint64_t v48 = BYTE7(v74[1]);
            if (SBYTE7(v74[1]) < 0) {
              uint64_t v48 = *((void *)&v74[0] + 1);
            }
            if (v48 == 2)
            {
              if ((SBYTE7(v74[1]) & 0x80u) == 0) {
                uint64_t v66 = (char *)v74;
              }
              else {
                uint64_t v66 = *(char **)&v74[0];
              }
              std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)v8, *v66, v66[1]);
            }
            else
            {
              if (v48 != 1) {
                std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
              }
              if ((SBYTE7(v74[1]) & 0x80u) == 0) {
                unint64_t v49 = (char *)v74;
              }
              else {
                unint64_t v49 = *(char **)&v74[0];
              }
              std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, *v49);
            }
            if ((SHIBYTE(__s[2]) & 0x80000000) == 0) {
              goto LABEL_162;
            }
LABEL_170:
            operator delete(__s[0]);
            if ((SBYTE7(v74[1]) & 0x80000000) == 0)
            {
LABEL_163:
              char v59 = 0;
              v7 += v13 + 4;
              uint64_t v53 = v9;
              if ((SHIBYTE(v72) & 0x80000000) == 0) {
                goto LABEL_135;
              }
              goto LABEL_164;
            }
          }
          operator delete(*(void **)&v74[0]);
          goto LABEL_163;
        }
        size_t v11 = (std::basic_regex<char>::value_type *)v7;
LABEL_60:
        uint64_t v7 = *(_DWORD *)(a1 + 24) & 0x1F0;
        int v30 = 0;
        goto LABEL_61;
      }
      BOOL v23 = (unsigned char *)(v7 + 2);
      if ((uint64_t)&a3[-v7 - 2] < 2) {
        goto LABEL_191;
      }
      int v24 = (std::basic_regex<char>::value_type *)v7;
      size_t v25 = (std::basic_regex<char>::value_type *)(v7 + 2);
      uint64_t v26 = (std::basic_regex<char>::value_type *)(v7 + 3);
      if (*v23 != 46) {
        break;
      }
LABEL_46:
      if (*v26 != 93) {
        goto LABEL_44;
      }
      if (v25 == a3) {
LABEL_191:
      }
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
      std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>((uint64_t)v74, a1, (uint64_t)v23, v24 + 2);
      if (SHIBYTE(v72) < 0) {
        operator delete(__p[0]);
      }
      *(_OWORD *)std::vector<std::csub_match> __p = v74[0];
      unint64_t v72 = *(void *)&v74[1];
      unint64_t v28 = *((void *)&v74[0] + 1);
      if ((SBYTE7(v74[1]) & 0x80u) == 0) {
        uint64_t v29 = (char *)HIBYTE(v72);
      }
      else {
        uint64_t v29 = (char *)__p[1];
      }
      if ((unint64_t)(v29 - 1) >= 2) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
      }
      size_t v11 = v25 + 2;
      uint64_t v7 = *(_DWORD *)(a1 + 24) & 0x1F0;
      int v30 = SBYTE7(v74[1]);
      if ((SBYTE7(v74[1]) & 0x80u) == 0) {
        unint64_t v28 = HIBYTE(v72);
      }
      if (v28)
      {
        if (v11 == a3) {
          goto LABEL_106;
        }
        goto LABEL_105;
      }
LABEL_61:
      if ((v7 | 0x40) == 0x40)
      {
        int v31 = *v11;
        if (v31 == 92)
        {
          uint64_t v32 = v11 + 1;
          if (v7) {
            unint64_t v33 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v32, a3, (uint64_t *)__p);
          }
          else {
            unint64_t v33 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)v32, (unsigned __int8 *)a3, (uint64_t)__p, (uint64_t)v8);
          }
          size_t v11 = v33;
          if (v33 == a3) {
            goto LABEL_106;
          }
          goto LABEL_105;
        }
      }
      else
      {
        LOBYTE(v31) = *v11;
      }
      if (v30 < 0)
      {
        uint64_t v38 = __p[0];
        __p[1] = (void *)1;
        *(unsigned char *)__p[0] = v31;
        v38[1] = 0;
        if (++v11 == a3) {
          goto LABEL_106;
        }
      }
      else
      {
        HIBYTE(v72) = 1;
        LOWORD(__p[0]) = v31;
        if (++v11 == a3) {
          goto LABEL_106;
        }
      }
LABEL_105:
      int v50 = *v11;
      if (v50 != 93)
      {
        uint64_t v52 = v11 + 1;
        if (v11 + 1 != a3 && v50 == 45 && *v52 != 93)
        {
          memset(__s, 0, 24);
          uint64_t v53 = v11 + 2;
          if (v11 + 2 == a3 || *v52 != 91 || *v53 != 46)
          {
            if ((v7 | 0x40) == 0x40)
            {
              LODWORD(v52) = *v52;
              if (v52 == 92)
              {
                if (v7) {
                  unint64_t v60 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v11 + 2, a3, (uint64_t *)__s);
                }
                else {
                  unint64_t v60 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)v11 + 2, (unsigned __int8 *)a3, (uint64_t)__s, (uint64_t)v8);
                }
                uint64_t v53 = v60;
                goto LABEL_174;
              }
            }
            else
            {
              LOBYTE(v52) = *v52;
            }
            HIBYTE(__s[2]) = 1;
            LOWORD(__s[0]) = v52;
            goto LABEL_174;
          }
          uint64_t v54 = v11 + 3;
          if (a3 - (v11 + 3) < 2) {
            goto LABEL_193;
          }
          uint64_t v55 = v11 + 3;
          uint64_t v56 = v11 + 4;
          if (*v54 == 46) {
            goto LABEL_124;
          }
          do
          {
            do
            {
              if (a3 - 5 == v11) {
                goto LABEL_193;
              }
              ++v11;
              uint64_t v55 = v56;
              int v57 = *v56++;
            }
            while (v57 != 46);
LABEL_124:
            ;
          }
          while (*v56 != 93);
          if (v55 == a3) {
LABEL_193:
          }
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
          std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>((uint64_t)v74, a1, (uint64_t)v54, v11 + 3);
          if (SHIBYTE(__s[2]) < 0) {
            operator delete(__s[0]);
          }
          __s[2] = *(std::string::value_type **)&v74[1];
          *(_OWORD *)std::string __s = v74[0];
          char v58 = (std::string::value_type *)HIBYTE(*(void *)&v74[1]);
          if (SBYTE7(v74[1]) < 0) {
            char v58 = __s[1];
          }
          if ((unint64_t)(v58 - 1) >= 2) {
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
          }
          uint64_t v53 = v55 + 2;
LABEL_174:
          v74[0] = *(_OWORD *)__p;
          *(void *)&v74[1] = v72;
          __p[1] = 0;
          unint64_t v72 = 0;
          __p[0] = 0;
          *(_OWORD *)std::string v69 = *(_OWORD *)__s;
          uint64_t v70 = __s[2];
          memset(__s, 0, 24);
          std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100]((uint64_t)v8, (char *)v74, (uint64_t)v69);
          if (SHIBYTE(v70) < 0)
          {
            operator delete(v69[0]);
            if (SBYTE7(v74[1]) < 0) {
              goto LABEL_180;
            }
LABEL_176:
            if ((SHIBYTE(__s[2]) & 0x80000000) == 0) {
              goto LABEL_177;
            }
LABEL_181:
            operator delete(__s[0]);
            char v59 = 1;
            if ((SHIBYTE(v72) & 0x80000000) == 0) {
              goto LABEL_135;
            }
          }
          else
          {
            if ((SBYTE7(v74[1]) & 0x80000000) == 0) {
              goto LABEL_176;
            }
LABEL_180:
            operator delete(*(void **)&v74[0]);
            if (SHIBYTE(__s[2]) < 0) {
              goto LABEL_181;
            }
LABEL_177:
            char v59 = 1;
            if ((SHIBYTE(v72) & 0x80000000) == 0) {
              goto LABEL_135;
            }
          }
LABEL_164:
          operator delete(__p[0]);
          size_t v11 = v53;
          if ((v59 & 1) == 0) {
            goto LABEL_15;
          }
          goto LABEL_14;
        }
      }
LABEL_106:
      if (SHIBYTE(v72) < 0)
      {
        if (__p[1])
        {
          if (__p[1] == (void *)1)
          {
            uint64_t v51 = (void **)__p[0];
LABEL_113:
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, *(char *)v51);
LABEL_134:
            char v59 = 1;
            uint64_t v53 = v11;
            if ((SHIBYTE(v72) & 0x80000000) == 0) {
              goto LABEL_135;
            }
            goto LABEL_164;
          }
          uint64_t v51 = (void **)__p[0];
LABEL_133:
          std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)v8, *(char *)v51, *((char *)v51 + 1));
          goto LABEL_134;
        }
        operator delete(__p[0]);
      }
      else if (HIBYTE(v72))
      {
        uint64_t v51 = __p;
        if (HIBYTE(v72) == 1) {
          goto LABEL_113;
        }
        goto LABEL_133;
      }
LABEL_14:
      uint64_t v7 = (uint64_t)v11;
LABEL_15:
      if (v9 == (std::basic_regex<char>::value_type *)v7)
      {
        if (v9 != a3)
        {
          if (*v9 == 45)
          {
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 45);
            ++v9;
          }
          if (v9 != a3 && *v9 == 93) {
            return v9 + 1;
          }
        }
LABEL_192:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
      }
    }
    do
    {
LABEL_44:
      if (a3 - 4 == v24) {
        goto LABEL_191;
      }
      ++v24;
      size_t v25 = v26;
      int v27 = *v26++;
    }
    while (v27 != 46);
    goto LABEL_46;
  }
  return a2;
}

void sub_21D843CC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  unint64_t v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  uint64_t v5 = *a2;
  std::basic_regex<char>::value_type v6 = v5;
  switch((char)v5)
  {
    case '0':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 0;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 0);
        return v4 + 1;
      }
    case 'c':
      if (v4 + 1 == a3 || (char)v4[1] < 65) {
        goto LABEL_85;
      }
      unsigned int v8 = v4[1];
      if (v8 >= 0x5B && (v8 - 97) > 0x19u) {
        goto LABEL_85;
      }
      std::basic_regex<char>::value_type v10 = v8 & 0x1F;
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v10;
        *((unsigned char *)a4 + 1) = 0;
        return v4 + 2;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v10);
        return v4 + 2;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return v4 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return v4 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return v4 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return v4 + 1;
      }
    case 'u':
      if (v4 + 1 != a3)
      {
        int v11 = v4[1];
        if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38 || (v11 | 0x20u) - 97 < 6)
        {
          v4 += 2;
          if (v4 != a3)
          {
            int v12 = *v4;
            if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38 || (v12 | 0x20u) - 97 < 6) {
              goto LABEL_42;
            }
          }
        }
      }
      goto LABEL_85;
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char>::value_type v6 = 11;
LABEL_68:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v6);
        return v4 + 1;
      }
    case 'x':
LABEL_42:
      if (v4 + 1 == a3) {
        goto LABEL_85;
      }
      unsigned __int8 v13 = v4[1];
      char v14 = -48;
      if ((v13 & 0xF8) == 0x30 || (v13 & 0xFE) == 0x38) {
        goto LABEL_47;
      }
      v13 |= 0x20u;
      if ((v13 - 97) >= 6u) {
        goto LABEL_85;
      }
      char v14 = -87;
LABEL_47:
      if (v4 + 2 == a3) {
        goto LABEL_85;
      }
      unsigned __int8 v15 = v4[2];
      char v16 = -48;
      if ((v15 & 0xF8) != 0x30 && (v15 & 0xFE) != 0x38)
      {
        v15 |= 0x20u;
        if ((v15 - 97) >= 6u) {
LABEL_85:
        }
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
        char v16 = -87;
      }
      std::basic_regex<char>::value_type v17 = v15 + 16 * (v13 + v14) + v16;
      if (!a4)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v17);
        v4 += 3;
        return v4;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v17;
      *((unsigned char *)a4 + 1) = 0;
      uint64_t result = v4 + 3;
      break;
    default:
      if ((char)v5 == 95 || ((char)v5 & 0x80000000) == 0 && (a1->__traits_.__ct_->__tab_[v5] & 0x500) != 0) {
        goto LABEL_85;
      }
      if (!a4) {
        goto LABEL_68;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v5;
      *((unsigned char *)a4 + 1) = 0;
      return v4 + 1;
  }
  return result;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  if (a2 == a3) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  }
  switch(*a2)
  {
    case 'D':
      *(_DWORD *)(a5 + 164) |= 0x400u;
      uint64_t result = a2 + 1;
      break;
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'T':
    case 'U':
    case 'V':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '_':
    case 'a':
    case 'c':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
    case 't':
    case 'u':
    case 'v':
      goto LABEL_8;
    case 'S':
      *(_DWORD *)(a5 + 164) |= 0x4000u;
      uint64_t result = a2 + 1;
      break;
    case 'W':
      *(_DWORD *)(a5 + 164) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](a5);
      uint64_t result = a2 + 1;
      break;
    case 'b':
      if (*(char *)(a4 + 23) < 0)
      {
        *(void *)(a4 + 8) = 1;
        a4 = *(void *)a4;
      }
      else
      {
        *(unsigned char *)(a4 + 23) = 1;
      }
      *(_WORD *)a4 = 8;
      uint64_t result = a2 + 1;
      break;
    case 'd':
      *(_DWORD *)(a5 + 160) |= 0x400u;
      uint64_t result = a2 + 1;
      break;
    case 's':
      *(_DWORD *)(a5 + 160) |= 0x4000u;
      uint64_t result = a2 + 1;
      break;
    case 'w':
      *(_DWORD *)(a5 + 160) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
      uint64_t result = a2 + 1;
      break;
    default:
      if (*a2)
      {
LABEL_8:
        uint64_t result = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, a2, a3, (uint64_t *)a4);
      }
      else
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(void *)(a4 + 8) = 1;
          a4 = *(void *)a4;
        }
        else
        {
          *(unsigned char *)(a4 + 23) = 1;
        }
        *(unsigned char *)a4 = 0;
        *(unsigned char *)(a4 + 1) = 0;
        uint64_t result = a2 + 1;
      }
      break;
  }
  return result;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3, uint64_t *a4)
{
  if (a2 == a3) {
LABEL_70:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  std::basic_regex<char>::value_type v5 = *a2;
  switch(*a2)
  {
    case '""':
    case '/':
    case '\\':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v5;
        *((unsigned char *)a4 + 1) = 0;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
        return a2 + 1;
      }
    case 'a':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 7;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 7);
        return a2 + 1;
      }
    case 'b':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 8);
        return a2 + 1;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return a2 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return a2 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return a2 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return a2 + 1;
      }
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 11);
        return a2 + 1;
      }
    default:
      if ((v5 & 0xF8) != 0x30) {
        goto LABEL_70;
      }
      std::basic_regex<char>::value_type v7 = *a2 - 48;
      unsigned int v8 = a2 + 1;
      if (a2 + 1 == a3)
      {
        unsigned int v8 = a3;
LABEL_42:
        if (a4) {
          goto LABEL_43;
        }
LABEL_69:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
        return v8;
      }
      if ((*v8 & 0xF8) != 0x30) {
        goto LABEL_42;
      }
      std::basic_regex<char>::value_type v7 = *v8 + 8 * v7 - 48;
      if (a2 + 2 == a3)
      {
        unsigned int v8 = a3;
        if (a4) {
          goto LABEL_43;
        }
        goto LABEL_69;
      }
      std::basic_regex<char>::value_type v9 = a2[2];
      int v10 = v9 & 0xF8;
      std::basic_regex<char>::value_type v11 = v9 + 8 * v7 - 48;
      if (v10 == 48) {
        unsigned int v8 = a2 + 3;
      }
      else {
        unsigned int v8 = a2 + 2;
      }
      if (v10 == 48) {
        std::basic_regex<char>::value_type v7 = v11;
      }
      if (!a4) {
        goto LABEL_69;
      }
LABEL_43:
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v7;
      *((unsigned char *)a4 + 1) = 0;
      return v8;
  }
}

void std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  unint64_t v4 = (unint64_t)&a4[-a3];
  memset(__s, 170, sizeof(__s));
  if ((unint64_t)&a4[-a3] >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v4 <= 0x16)
  {
    __s[23] = (_BYTE)a4 - a3;
    std::basic_regex<char>::value_type v9 = __s;
    if ((char *)a3 != a4) {
      goto LABEL_4;
    }
LABEL_13:
    int v10 = v9;
    goto LABEL_16;
  }
  uint64_t v16 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v4 | 7) != 0x17) {
    uint64_t v16 = v4 | 7;
  }
  uint64_t v17 = v16 + 1;
  std::basic_regex<char>::value_type v9 = (char *)operator new(v16 + 1);
  *(void *)&__s[8] = v4;
  *(void *)&char __s[16] = v17 | 0x8000000000000000;
  *(void *)std::string __s = v9;
  if ((char *)a3 == a4) {
    goto LABEL_13;
  }
LABEL_4:
  if (v4 < 0x20 || (unint64_t)&v9[-a3] < 0x20)
  {
    int v10 = v9;
    std::basic_regex<char>::value_type v11 = (char *)a3;
    do
    {
LABEL_15:
      char v18 = *v11++;
      *v10++ = v18;
    }
    while (v11 != a4);
    goto LABEL_16;
  }
  int v10 = &v9[v4 & 0xFFFFFFFFFFFFFFE0];
  std::basic_regex<char>::value_type v11 = (char *)(a3 + (v4 & 0xFFFFFFFFFFFFFFE0));
  int v12 = (long long *)(a3 + 16);
  unsigned __int8 v13 = v9 + 16;
  unint64_t v14 = v4 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    long long v15 = *v12;
    *(v13 - 1) = *(v12 - 1);
    _OWORD *v13 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 32;
  }
  while (v14);
  if (v4 != (v4 & 0xFFFFFFFFFFFFFFE0)) {
    goto LABEL_15;
  }
LABEL_16:
  char *v10 = 0;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  if (__s[23] < 0)
  {
    uint64_t v19 = *(char **)__s;
    if (!*(void *)&__s[8]) {
      goto LABEL_29;
    }
  }
  else
  {
    if (!__s[23]) {
      return;
    }
    uint64_t v19 = __s;
  }
  std::__get_collation_name(&v26, v19);
  *(_OWORD *)a1 = *(_OWORD *)&v26.__r_.__value_.__l.__data_;
  unint64_t v20 = v26.__r_.__value_.__r.__words[2];
  *(void *)(a1 + 16) = *((void *)&v26.__r_.__value_.__l + 2);
  unint64_t v21 = HIBYTE(v20);
  if ((v21 & 0x80u) != 0) {
    unint64_t v21 = *(void *)(a1 + 8);
  }
  if (v21)
  {
LABEL_23:
    if ((__s[23] & 0x80000000) == 0) {
      return;
    }
    uint64_t v19 = *(char **)__s;
LABEL_29:
    operator delete(v19);
    return;
  }
  if (__s[23] < 0)
  {
    uint64_t v19 = *(char **)__s;
    if (*(void *)&__s[8] >= 3uLL) {
      goto LABEL_29;
    }
    goto LABEL_31;
  }
  if (__s[23] < 3u)
  {
LABEL_31:
    (*(void (**)(std::string *__return_ptr))(**(void **)(a2 + 16) + 32))(&v26);
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    *(std::string *)a1 = v26;
    if (*(char *)(a1 + 23) < 0)
    {
      uint64_t v23 = *(void *)(a1 + 8);
      if (v23 == 1 || v23 == 12)
      {
        if (__s != (char *)a1)
        {
          if (__s[23] >= 0) {
            int v24 = __s;
          }
          else {
            int v24 = *(char **)__s;
          }
          if (__s[23] >= 0) {
            size_t v25 = __s[23];
          }
          else {
            size_t v25 = *(void *)&__s[8];
          }
          std::string::__assign_no_alias<false>((void **)a1, v24, v25);
        }
      }
      else
      {
        **(unsigned char **)a1 = 0;
        *(void *)(a1 + 8) = 0;
      }
    }
    else
    {
      int v22 = *(unsigned __int8 *)(a1 + 23);
      if (v22 == 1 || v22 == 12)
      {
        if (__s != (char *)a1)
        {
          if (__s[23] < 0)
          {
            std::string::__assign_no_alias<true>((void *)a1, *(void **)__s, *(size_t *)&__s[8]);
          }
          else
          {
            *(_OWORD *)a1 = *(_OWORD *)__s;
            *(void *)(a1 + 16) = *(void *)&__s[16];
          }
        }
      }
      else
      {
        *(unsigned char *)a1 = 0;
        *(unsigned char *)(a1 + 23) = 0;
      }
    }
    goto LABEL_23;
  }
}

void sub_21D844EA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0)
  {
    operator delete(*(void **)v17);
    if ((a17 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a17 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  if (a2 == a3) {
    goto LABEL_4;
  }
  std::basic_regex<char>::value_type v7 = a2 + 1;
  int v6 = *a2;
  if (a2 + 1 == a3 && v6 == 36) {
    goto LABEL_4;
  }
  if ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v6);
  }
  else
  {
    if (v7 != a3 && v6 == 92)
    {
      int v15 = *v7;
      if ((v15 - 36) <= 0x3A && ((1 << (v15 - 36)) & 0x580000000000441) != 0)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v15);
        std::basic_regex<char>::value_type v7 = a2 + 2;
        goto LABEL_5;
      }
LABEL_4:
      std::basic_regex<char>::value_type v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(a1, a2, a3);
      goto LABEL_5;
    }
    if (v6 != 46) {
      goto LABEL_4;
    }
    uint64_t v16 = operator new(0x10uLL);
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v18 = *(void *)(v17 + 8);
    *uint64_t v16 = &unk_26CE32BD8;
    v16[1] = v18;
    *(void *)(v17 + 8) = v16;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
  }
LABEL_5:
  if (a2 == a3 || a2 != v7 || a2 + 1 == a3 || *a2 != 92) {
    return v7;
  }
  int v8 = a2[1];
  if (v8 == 40)
  {
    std::basic_regex<char>::value_type v9 = (std::basic_regex<char> *)(a2 + 2);
    if ((*(unsigned char *)(a1 + 24) & 2) != 0)
    {
      int v11 = *(_DWORD *)(a1 + 28);
    }
    else
    {
      int v10 = operator new(0x18uLL);
      int v11 = *(_DWORD *)(a1 + 28) + 1;
      *(_DWORD *)(a1 + 28) = v11;
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(v12 + 8);
      void *v10 = &unk_26CE329E0;
      v10[1] = v13;
      *((_DWORD *)v10 + 4) = v11;
      *(void *)(v12 + 8) = v10;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    do
    {
      if (v9 == (std::basic_regex<char> *)a3) {
        goto LABEL_39;
      }
      unint64_t v20 = v9;
      unint64_t v21 = *(std::__owns_one_state<char> **)(a1 + 56);
      int v22 = *(_DWORD *)(a1 + 28);
      uint64_t v23 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(a1, v20, a3);
      if (v20 == v23) {
        break;
      }
      std::basic_regex<char>::value_type v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v23, (std::basic_regex<char> *)a3, v21, (v22 + 1), (*(_DWORD *)(a1 + 28) + 1));
    }
    while (v20 != v9);
    if ((char *)&v20->__traits_.__loc_.__locale_ + 1 == a3
      || LOBYTE(v20->__traits_.__loc_.__locale_) != 92
      || BYTE1(v20->__traits_.__loc_.__locale_) != 41)
    {
LABEL_39:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    std::basic_regex<char>::value_type v7 = (char *)v20 + 2 * (BYTE1(v20->__traits_.__loc_.__locale_) == 41);
    if ((*(unsigned char *)(a1 + 24) & 2) == 0)
    {
      int v24 = operator new(0x18uLL);
      uint64_t v25 = *(void *)(a1 + 56);
      uint64_t v26 = *(void *)(v25 + 8);
      void *v24 = &unk_26CE32A28;
      v24[1] = v26;
      *((_DWORD *)v24 + 4) = v11;
      *(void *)(v25 + 8) = v24;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    return v7;
  }
  if ((v8 & 0xF8) != 0x30 && (v8 & 0xFE) != 0x38 || (v8 - 49) > 8) {
    return v7;
  }
  if ((v8 - 48) > *(_DWORD *)(a1 + 28)) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref((std::basic_regex<char> *)a1, v8 - 48);
  return a2 + 2;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  if (this == a3) {
    return this;
  }
  int locale_low = LOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low == 42)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, 0, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
    return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
  }
  std::basic_regex<char>::value_type v9 = (unsigned __int8 *)a3;
  if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3
    || locale_low != 92
    || BYTE1(this->__traits_.__loc_.__locale_) != 123)
  {
    return this;
  }
  int v10 = (std::basic_regex<char> *)((char *)this + 2 * (BYTE1(this->__traits_.__loc_.__locale_) == 123));
  if (v10 == a3) {
    goto LABEL_45;
  }
  int v11 = LOBYTE(v10->__traits_.__loc_.__locale_);
  if ((v11 & 0xF8) != 0x30 && (v11 & 0xFE) != 0x38) {
    goto LABEL_45;
  }
  int v12 = v11 - 48;
  uint64_t v13 = (std::basic_regex<char> *)((char *)&v10->__traits_.__loc_.__locale_ + 1);
  if ((std::basic_regex<char> *)((char *)&v10->__traits_.__loc_.__locale_ + 1) == a3)
  {
LABEL_15:
    uint64_t v13 = a3;
  }
  else
  {
    while (1)
    {
      int v14 = LOBYTE(v13->__traits_.__loc_.__locale_);
      if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38) {
        break;
      }
      if (v12 >= 214748364) {
        goto LABEL_45;
      }
      int v12 = v14 + 10 * v12 - 48;
      uint64_t v13 = (std::basic_regex<char> *)((char *)v13 + 1);
      if (v13 == a3) {
        goto LABEL_15;
      }
    }
  }
  if (v13 == v10) {
    goto LABEL_45;
  }
  if (v13 == a3) {
LABEL_46:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
  int v15 = (std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 1);
  int v16 = LOBYTE(v13->__traits_.__loc_.__locale_);
  if (v16 != 44)
  {
    if (v15 != a3 && v16 == 92 && LOBYTE(v15->__traits_.__loc_.__locale_) == 125)
    {
      uint64_t v19 = (unsigned __int8 *)&v13->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, v12, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v19;
    }
    goto LABEL_46;
  }
  if (v15 == a3) {
    goto LABEL_46;
  }
  int v17 = LOBYTE(v15->__traits_.__loc_.__locale_);
  if ((v17 & 0xF8) == 0x30 || (v17 & 0xFE) == 0x38)
  {
    int v18 = v17 - 48;
    int v15 = (std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 2);
    if ((std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 2) == a3)
    {
LABEL_37:
      int v15 = a3;
      goto LABEL_40;
    }
    while (1)
    {
      int v17 = LOBYTE(v15->__traits_.__loc_.__locale_);
      if ((v17 & 0xF8) != 0x30 && (v17 & 0xFE) != 0x38) {
        break;
      }
      if (v18 >= 214748364) {
        goto LABEL_45;
      }
      int v18 = v17 + 10 * v18 - 48;
      int v15 = (std::basic_regex<char> *)((char *)v15 + 1);
      if (v15 == a3) {
        goto LABEL_37;
      }
    }
  }
  else
  {
    int v18 = -1;
  }
  if (v15 == a3)
  {
    unint64_t v20 = (unsigned __int8 *)v15;
    int v15 = a3;
    std::basic_regex<char>::value_type v9 = v20;
  }
  else if ((std::basic_regex<char> *)((char *)&v15->__traits_.__loc_.__locale_ + 1) == a3 || v17 != 92)
  {
    std::basic_regex<char>::value_type v9 = (unsigned __int8 *)v15;
  }
  else
  {
    std::basic_regex<char>::value_type v9 = (unsigned __int8 *)v15 + 2 * (BYTE1(v15->__traits_.__loc_.__locale_) == 125);
  }
LABEL_40:
  if (v15 == (std::basic_regex<char> *)v9) {
    goto LABEL_46;
  }
  if (v18 != -1)
  {
    if (v18 >= v12)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, v18, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v9;
    }
LABEL_45:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
  return (std::basic_regex<char> *)v9;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  std::vector<std::csub_match>::pointer end = this->__end_;
  unsigned int marked_count = this->__marked_count_;
  if (a2 != a3)
  {
    int v8 = *a2;
    switch(*a2)
    {
      case '$':
      case '(':
      case '*':
      case '+':
      case '.':
      case '?':
      case '[':
      case '\\':
      case '^':
      case '{':
      case '|':
        goto LABEL_3;
      case ')':
        if (!this->__open_count_) {
          goto LABEL_8;
        }
LABEL_3:
        std::basic_regex<char>::value_type v9 = (std::basic_regex<char> *)(a2 + 1);
        if (a2 + 1 != a3 && v8 == 92)
        {
          std::basic_regex<char>::value_type locale = (std::basic_regex<char>::value_type)v9->__traits_.__loc_.__locale_;
          switch(LOBYTE(v9->__traits_.__loc_.__locale_))
          {
            case '$':
            case '(':
            case ')':
            case '*':
            case '+':
            case '.':
            case '?':
            case '[':
            case '\\':
            case '^':
            case '{':
            case '|':
            case '}':
              std::basic_regex<char,std::regex_traits<char>>::__push_char(this, locale);
              std::basic_regex<char>::value_type v9 = (std::basic_regex<char> *)(a2 + 2);
              goto LABEL_36;
            default:
              if ((this->__flags_ & 0x1F0) == 0x40)
              {
                int v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>(this, a2 + 1, a3, 0);
              }
              else
              {
                BOOL v12 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(this, locale);
                uint64_t v13 = 2;
                if (!v12) {
                  uint64_t v13 = 0;
                }
                int v11 = &a2[v13];
              }
              if (v11 != a2) {
                goto LABEL_19;
              }
              int v8 = *a2;
              break;
          }
        }
        if (v8 != 46) {
          goto LABEL_18;
        }
        int v14 = (std::__node<char> *)operator new(0x10uLL);
        int v15 = this->__end_;
        char first = v15->__first_;
        v14->__vftable = (std::__node<char>_vtbl *)&unk_26CE32BD8;
        v14[1].__vftable = (std::__node<char>_vtbl *)first;
        v15->__first_ = v14;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
        break;
      default:
LABEL_8:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v8);
        std::basic_regex<char>::value_type v9 = (std::basic_regex<char> *)(a2 + 1);
        goto LABEL_36;
    }
    goto LABEL_36;
  }
LABEL_18:
  int v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, a2, a3);
LABEL_19:
  if (v11 != a2 || v11 == a3)
  {
LABEL_35:
    std::basic_regex<char>::value_type v9 = (std::basic_regex<char> *)v11;
    if (v11 != a2) {
      goto LABEL_36;
    }
    return (std::basic_regex<char> *)a2;
  }
  int v17 = *a2;
  if (v17 == 36)
  {
    int v18 = (std::__node<char> *)operator new(0x18uLL);
    BOOL v19 = (this->__flags_ & 0x5F0) == 1024;
    unint64_t v20 = this->__end_;
    v18[1].__vftable = (std::__node<char>_vtbl *)v20->__first_;
    unint64_t v21 = (std::__node<char>_vtbl *)&unk_26CE326C8;
    goto LABEL_26;
  }
  if (v17 == 40)
  {
    if ((this->__flags_ & 2) != 0)
    {
      unsigned int v23 = this->__marked_count_;
    }
    else
    {
      int v22 = (std::__node<char> *)operator new(0x18uLL);
      unsigned int v23 = this->__marked_count_ + 1;
      this->__marked_count_ = v23;
      int v24 = this->__end_;
      uint64_t v25 = v24->__first_;
      v22->__vftable = (std::__node<char>_vtbl *)&unk_26CE329E0;
      v22[1].__vftable = (std::__node<char>_vtbl *)v25;
      LODWORD(v22[2].__vftable) = v23;
      v24->__first_ = v22;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
    }
    ++this->__open_count_;
    uint64_t v26 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(this, a2 + 1, a3);
    if (v26 == a3 || (int v27 = v26, *v26 != 41)) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    if ((this->__flags_ & 2) == 0)
    {
      unint64_t v28 = (std::__node<char> *)operator new(0x18uLL);
      uint64_t v29 = this->__end_;
      int v30 = v29->__first_;
      v28->__vftable = (std::__node<char>_vtbl *)&unk_26CE32A28;
      v28[1].__vftable = (std::__node<char>_vtbl *)v30;
      LODWORD(v28[2].__vftable) = v23;
      v29->__first_ = v28;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
    }
    --this->__open_count_;
    int v11 = v27 + 1;
    goto LABEL_35;
  }
  if (v17 != 94) {
    return (std::basic_regex<char> *)a2;
  }
  int v18 = (std::__node<char> *)operator new(0x18uLL);
  BOOL v19 = (this->__flags_ & 0x5F0) == 1024;
  unint64_t v20 = this->__end_;
  v18[1].__vftable = (std::__node<char>_vtbl *)v20->__first_;
  unint64_t v21 = (std::__node<char>_vtbl *)&unk_26CE32680;
LABEL_26:
  v18->__vftable = v21;
  LOBYTE(v18[2].__vftable) = v19;
  v20->__first_ = v18;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  std::basic_regex<char>::value_type v9 = (std::basic_regex<char> *)(a2 + 1);
LABEL_36:
  size_t v31 = this->__marked_count_ + 1;
  return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)this, v9, (std::basic_regex<char> *)a3, end, marked_count + 1, v31);
}

void *Capabilities::create_default_global@<X0>(void *a1@<X8>)
{
  BOOL v3 = operator new(1uLL);
  *a1 = v3;
  uint64_t result = operator new(0x20uLL);
  *uint64_t result = &unk_26CE32C20;
  result[1] = 0;
  result[2] = 0;
  result[3] = v3;
  a1[1] = result;
  return result;
}

void sub_21D845B74(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t Capabilities::isCMHandDetectionSupported(Capabilities *this)
{
  capabilities::abs::supportsCMHandDetection(this);
  uint64_t v1 = (void *)MEMORY[0x263F01718];
  return [v1 isCallHandednessAvailable];
}

void std::__shared_ptr_pointer<Capabilities *,std::shared_ptr<Capabilities>::__shared_ptr_default_delete<Capabilities,Capabilities>,std::allocator<Capabilities>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<Capabilities *,std::shared_ptr<Capabilities>::__shared_ptr_default_delete<Capabilities,Capabilities>,std::allocator<Capabilities>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1) {
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<Capabilities *,std::shared_ptr<Capabilities>::__shared_ptr_default_delete<Capabilities,Capabilities>,std::allocator<Capabilities>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021D846904) {
    return a1 + 24;
  }
  if (((v3 & 0x800000021D846904 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000021D846904)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021D846904 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

uint64_t TelephonyUtilIsCarrierBuild()
{
  return MEMORY[0x270F971A0]();
}

uint64_t TelephonyUtilIsInternalBuild()
{
  return MEMORY[0x270F971A8]();
}

uint64_t TelephonyUtilIsVendorBuild()
{
  return MEMORY[0x270F971B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t capabilities::abs::supportsCMHandDetection(capabilities::abs *this)
{
  return MEMORY[0x270F96B90](this);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F972D8](this, a2, a3);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const ctu::OsLogContext *a2)
{
  return MEMORY[0x270F972E0](this, a2);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
}

uint64_t ctu::OsLogContext::operator=()
{
  return MEMORY[0x270F972F0]();
}

uint64_t ctu::StaticLogger::StaticLogger()
{
  return MEMORY[0x270F97300]();
}

uint64_t ctu::StaticLogger::StaticLogger(ctu::StaticLogger *this)
{
  return MEMORY[0x270F97308](this);
}

void ctu::StaticLogger::~StaticLogger(ctu::StaticLogger *this)
{
}

uint64_t ctu::LoggerCommonBase::operator=()
{
  return MEMORY[0x270F97448]();
}

uint64_t ctu::tokenize()
{
  return MEMORY[0x270F97708]();
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x270F982D8](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x270F98440](this, *(void *)&__ecode);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x270F98640]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::istream::peek()
{
  return MEMORY[0x270F98670]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x270F98678]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x270F98690]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x270F98698]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B8]();
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

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
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

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED8EC8](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270ED8ED0](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

double difftime(time_t a1, time_t a2)
{
  MEMORY[0x270ED9180](a1, a2);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x270ED98A0](*(void *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x270ED9D28](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
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

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x270EDA588](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x270EDB1E8](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

void rewind(FILE *a1)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int statvfs(const char *a1, statvfs *a2)
{
  return MEMORY[0x270EDB578](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x270EDB670](a1, a2, a3);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}