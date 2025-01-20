void std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:fe180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;
  __int16 v6;
  unint64_t v7;
  char *v8;
  _WORD *v9;
  __int16 v10;
  unint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unsigned char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unsigned char *v26;
  _WORD *v27;
  char *v28;
  _WORD *v29;
  unint64_t v30;
  uint64_t v31;
  _OWORD *v32;
  char *v33;
  unint64_t v34;
  long long v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unsigned char *v42;
  _WORD *v43;
  char *v44;
  unint64_t v45;
  uint64_t v46;
  _OWORD *v47;
  char *v48;
  unint64_t v49;
  long long v50;
  __int16 v51;
  unint64_t v52;
  uint64_t v53;
  _OWORD *v54;
  char *v55;
  unint64_t v56;
  long long v57;
  __int16 v58;

  if (!*(unsigned char *)(a1 + 169))
  {
    v10 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    v12 = *(char **)(a1 + 120);
    v11 = *(void *)(a1 + 128);
    if (*(unsigned char *)(a1 + 170))
    {
      if ((unint64_t)v12 >= v11)
      {
        v13 = *(char **)(a1 + 112);
        v14 = v12 - v13;
        if (v12 - v13 <= -3) {
          goto LABEL_73;
        }
        v15 = v14 >> 1;
        v16 = v11 - (void)v13;
        if (v16 <= (v14 >> 1) + 1) {
          v17 = v15 + 1;
        }
        else {
          v17 = v16;
        }
        if (v16 >= 0x7FFFFFFFFFFFFFFELL) {
          v18 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          v18 = v17;
        }
        if (v18)
        {
          if (v18 < 0) {
            goto LABEL_74;
          }
          v19 = operator new(2 * v18);
        }
        else
        {
          v19 = 0;
        }
        v43 = &v19[2 * v15];
        v44 = &v19[2 * v18];
        *v43 = v10;
        v9 = v43 + 1;
        if (v12 != v13)
        {
          v45 = v12 - v13 - 2;
          if (v45 < 0x1E) {
            goto LABEL_77;
          }
          if (v12 - v19 - (v14 & 0xFFFFFFFFFFFFFFFELL) < 0x20) {
            goto LABEL_77;
          }
          v46 = (v45 >> 1) + 1;
          v47 = &v19[2 * v15 - 16];
          v48 = v12 - 16;
          v49 = v46 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            v50 = *(_OWORD *)v48;
            *(v47 - 1) = *((_OWORD *)v48 - 1);
            *v47 = v50;
            v47 -= 2;
            v48 -= 32;
            v49 -= 16;
          }
          while (v49);
          v43 -= v46 & 0xFFFFFFFFFFFFFFF0;
          v12 -= 2 * (v46 & 0xFFFFFFFFFFFFFFF0);
          if (v46 != (v46 & 0xFFFFFFFFFFFFFFF0))
          {
LABEL_77:
            do
            {
              v51 = *((_WORD *)v12 - 1);
              v12 -= 2;
              *--v43 = v51;
            }
            while (v12 != v13);
LABEL_68:
            v13 = *(char **)(a1 + 112);
            goto LABEL_70;
          }
          goto LABEL_70;
        }
        goto LABEL_69;
      }
    }
    else if ((unint64_t)v12 >= v11)
    {
      v13 = *(char **)(a1 + 112);
      v37 = v12 - v13;
      if (v12 - v13 <= -3) {
        goto LABEL_73;
      }
      v38 = v37 >> 1;
      v39 = v11 - (void)v13;
      if (v39 <= (v37 >> 1) + 1) {
        v40 = v38 + 1;
      }
      else {
        v40 = v39;
      }
      if (v39 >= 0x7FFFFFFFFFFFFFFELL) {
        v41 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        v41 = v40;
      }
      if (v41)
      {
        if (v41 < 0) {
          goto LABEL_74;
        }
        v42 = operator new(2 * v41);
      }
      else
      {
        v42 = 0;
      }
      v43 = &v42[2 * v38];
      v44 = &v42[2 * v41];
      *v43 = v10;
      v9 = v43 + 1;
      if (v12 != v13)
      {
        v52 = v12 - v13 - 2;
        if (v52 < 0x1E) {
          goto LABEL_78;
        }
        if (v12 - v42 - (v37 & 0xFFFFFFFFFFFFFFFELL) < 0x20) {
          goto LABEL_78;
        }
        v53 = (v52 >> 1) + 1;
        v54 = &v42[2 * v38 - 16];
        v55 = v12 - 16;
        v56 = v53 & 0xFFFFFFFFFFFFFFF0;
        do
        {
          v57 = *(_OWORD *)v55;
          *(v54 - 1) = *((_OWORD *)v55 - 1);
          *v54 = v57;
          v54 -= 2;
          v55 -= 32;
          v56 -= 16;
        }
        while (v56);
        v43 -= v53 & 0xFFFFFFFFFFFFFFF0;
        v12 -= 2 * (v53 & 0xFFFFFFFFFFFFFFF0);
        if (v53 != (v53 & 0xFFFFFFFFFFFFFFF0))
        {
LABEL_78:
          do
          {
            v58 = *((_WORD *)v12 - 1);
            v12 -= 2;
            *--v43 = v58;
          }
          while (v12 != v13);
          goto LABEL_68;
        }
LABEL_70:
        *(void *)(a1 + 112) = v43;
        *(void *)(a1 + 120) = v9;
        *(void *)(a1 + 128) = v44;
        if (v13) {
          operator delete(v13);
        }
        goto LABEL_72;
      }
LABEL_69:
      v13 = v12;
      goto LABEL_70;
    }
    *(_WORD *)v12 = v10;
    v9 = v12 + 2;
    goto LABEL_72;
  }
  v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
  v6 = v5 | (unsigned __int16)((*(unsigned __int16 (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a3) << 8);
  v8 = *(char **)(a1 + 120);
  v7 = *(void *)(a1 + 128);
  if ((unint64_t)v8 < v7)
  {
    *(_WORD *)v8 = v6;
    v9 = v8 + 2;
LABEL_72:
    *(void *)(a1 + 120) = v9;
    return;
  }
  v20 = *(char **)(a1 + 112);
  v21 = v8 - v20;
  if (v8 - v20 <= -3) {
LABEL_73:
  }
    std::vector<std::string>::__throw_length_error[abi:fe180100]();
  v22 = v21 >> 1;
  v23 = v7 - (void)v20;
  if (v23 <= (v21 >> 1) + 1) {
    v24 = v22 + 1;
  }
  else {
    v24 = v23;
  }
  if (v23 >= 0x7FFFFFFFFFFFFFFELL) {
    v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    v25 = v24;
  }
  if (!v25)
  {
    v26 = 0;
    goto LABEL_29;
  }
  if (v25 < 0) {
LABEL_74:
  }
    std::__throw_bad_array_new_length[abi:fe180100]();
  v26 = operator new(2 * v25);
LABEL_29:
  v27 = &v26[2 * v22];
  v28 = &v26[2 * v25];
  *v27 = v6;
  v29 = v27 + 1;
  if (v8 == v20)
  {
    v20 = v8;
  }
  else
  {
    v30 = v8 - v20 - 2;
    if (v30 < 0x1E) {
      goto LABEL_79;
    }
    if (v8 - v26 - (v21 & 0xFFFFFFFFFFFFFFFELL) < 0x20) {
      goto LABEL_79;
    }
    v31 = (v30 >> 1) + 1;
    v32 = &v26[2 * v22 - 16];
    v33 = v8 - 16;
    v34 = v31 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      v35 = *(_OWORD *)v33;
      *(v32 - 1) = *((_OWORD *)v33 - 1);
      *v32 = v35;
      v32 -= 2;
      v33 -= 32;
      v34 -= 16;
    }
    while (v34);
    v27 -= v31 & 0xFFFFFFFFFFFFFFF0;
    v8 -= 2 * (v31 & 0xFFFFFFFFFFFFFFF0);
    if (v31 != (v31 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_79:
      do
      {
        v36 = *((_WORD *)v8 - 1);
        v8 -= 2;
        *--v27 = v36;
      }
      while (v8 != v20);
      v20 = *(char **)(a1 + 112);
    }
  }
  *(void *)(a1 + 112) = v27;
  *(void *)(a1 + 120) = v29;
  *(void *)(a1 + 128) = v28;
  if (v20) {
    operator delete(v20);
  }
  *(void *)(a1 + 120) = v29;
}

void std::regex_traits<char>::transform<std::__wrap_iter<char *>>(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  unint64_t v4 = a4 - a3;
  if ((unint64_t)(a4 - a3) >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:fe180100]();
  }
  v6 = a3;
  if (v4 <= 0x16)
  {
    HIBYTE(v22) = (_BYTE)a4 - (_BYTE)a3;
    p_p = &__p;
    if (a3 == a4) {
      goto LABEL_18;
    }
LABEL_8:
    if (v4 < 0x20 || (unint64_t)(p_p - v6) < 0x20)
    {
      v12 = p_p;
    }
    else
    {
      unint64_t v11 = v4 & 0xFFFFFFFFFFFFFFE0;
      v12 = &p_p[v4 & 0xFFFFFFFFFFFFFFE0];
      v13 = (long long *)(v6 + 16);
      v14 = p_p + 16;
      unint64_t v15 = v4 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        long long v16 = *v13;
        *(v14 - 1) = *(v13 - 1);
        _OWORD *v14 = v16;
        v13 += 2;
        v14 += 2;
        v15 -= 32;
      }
      while (v15);
      if (v4 == v11)
      {
        p_p += v4 & 0xFFFFFFFFFFFFFFE0;
        goto LABEL_18;
      }
      v6 += v11;
    }
    p_p = v12;
    do
    {
      char v17 = *v6++;
      *p_p++ = v17;
    }
    while (v6 != a4);
    goto LABEL_18;
  }
  uint64_t v9 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v4 | 7) != 0x17) {
    uint64_t v9 = v4 | 7;
  }
  uint64_t v10 = v9 + 1;
  p_p = operator new(v9 + 1);
  unint64_t v21 = v4;
  int64_t v22 = v10 | 0x8000000000000000;
  __p = p_p;
  if (v6 != a4) {
    goto LABEL_8;
  }
LABEL_18:
  unsigned char *p_p = 0;
  unint64_t v18 = HIBYTE(v22);
  if (v22 >= 0) {
    v19 = (char *)&__p;
  }
  else {
    v19 = (char *)__p;
  }
  if (v22 < 0) {
    unint64_t v18 = v21;
  }
  (*(void (**)(void, char *, char *))(**(void **)(a2 + 16) + 32))(*(void *)(a2 + 16), v19, &v19[v18]);
  if (SHIBYTE(v22) < 0) {
    operator delete(__p);
  }
}

void sub_18DB7B310(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>(void **a1, uint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 4);
  unint64_t v3 = v2 + 1;
  if (v2 + 1 > 0x555555555555555) {
    std::vector<std::string>::__throw_length_error[abi:fe180100]();
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
      std::__throw_bad_array_new_length[abi:fe180100]();
    }
    v7 = (char *)operator new(48 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[48 * v2];
  *((void *)v8 + 2) = *(void *)(a2 + 16);
  *(_OWORD *)v8 = *(_OWORD *)a2;
  uint64_t v9 = &v7[48 * v6];
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
  v12 = (void **)*a1;
  v13 = (void **)a1[1];
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
    v13 = (void **)*a1;
    long long v16 = (void **)a1[1];
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

void std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)9>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x192FA3BA0](exception, 9);
  __cxa_throw(exception, MEMORY[0x1E4FBA2D8], MEMORY[0x1E4FBA200]);
}

void sub_18DB7B50C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)3>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x192FA3BA0](exception, 3);
  __cxa_throw(exception, MEMORY[0x1E4FBA2D8], MEMORY[0x1E4FBA200]);
}

void sub_18DB7B564(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
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

void sub_18DB7B6EC(_Unwind_Exception *a1)
{
  std::locale::~locale(v2);
  unint64_t v4 = v1[1];
  if (v4) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  }
  MEMORY[0x192FA4080](v1, 0x10E1C4010F5D982);
  _Unwind_Resume(a1);
}

uint64_t std::__match_char<char>::__exec(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(unsigned __int8 **)(a2 + 16);
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

void std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }
  JUMPOUT(0x192FA4080);
}

void (__cdecl ***std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

uint64_t std::__match_char_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(unsigned __int8 **)(a2 + 16);
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

void std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_1EDC83920;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  JUMPOUT(0x192FA4080);
}

std::locale *std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_1EDC83920;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unint64_t v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (uint64_t v4 = result,
        result = (*(uint64_t (**)(void, void))(**(void **)(result + 24) + 40))(*(void *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
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

void std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_1EDC83868;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  JUMPOUT(0x192FA4080);
}

std::locale *std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_1EDC83868;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, uint64_t *a4)
{
  uint64_t v4 = this;
  if (this != a3)
  {
    uint64_t locale_low = LOBYTE(this->__traits_.__loc_.__locale_);
    std::basic_regex<char>::value_type v6 = locale_low;
    switch((char)locale_low)
    {
      case '0':
        if (!a4)
        {
          std::basic_regex<char>::value_type v6 = 0;
          goto LABEL_67;
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
        *(_WORD *)a4 = 0;
        break;
      case 'c':
        if ((std::basic_regex<char> *)((char *)&v4->__traits_.__loc_.__locale_ + 1) == a3
          || SBYTE1(v4->__traits_.__loc_.__locale_) < 65)
        {
          goto LABEL_86;
        }
        unsigned int v7 = BYTE1(v4->__traits_.__loc_.__locale_);
        if (v7 >= 0x5B && (v7 - 97) > 0x19u) {
          goto LABEL_86;
        }
        std::basic_regex<char>::value_type v9 = v7 & 0x1F;
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
          return (std::basic_regex<char> *)((char *)v4 + 2);
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v9);
          return (std::basic_regex<char> *)((char *)v4 + 2);
        }
      case 'f':
        if (!a4)
        {
          std::basic_regex<char>::value_type v6 = 12;
          goto LABEL_67;
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
        *(_WORD *)a4 = 12;
        break;
      case 'n':
        if (!a4)
        {
          std::basic_regex<char>::value_type v6 = 10;
          goto LABEL_67;
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
        *(_WORD *)a4 = 10;
        break;
      case 'r':
        if (!a4)
        {
          std::basic_regex<char>::value_type v6 = 13;
          goto LABEL_67;
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
        *(_WORD *)a4 = 13;
        break;
      case 't':
        if (!a4)
        {
          std::basic_regex<char>::value_type v6 = 9;
          goto LABEL_67;
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
        *(_WORD *)a4 = 9;
        break;
      case 'u':
        if ((std::basic_regex<char> *)((char *)&v4->__traits_.__loc_.__locale_ + 1) != a3)
        {
          int v10 = BYTE1(v4->__traits_.__loc_.__locale_);
          if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38 || (v10 | 0x20u) - 97 < 6)
          {
            uint64_t v4 = (std::basic_regex<char> *)((char *)v4 + 2);
            if (v4 != a3)
            {
              int v11 = LOBYTE(v4->__traits_.__loc_.__locale_);
              if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38 || (v11 | 0x20u) - 97 < 6) {
                goto LABEL_42;
              }
            }
          }
        }
        goto LABEL_86;
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
        }
        else
        {
          std::basic_regex<char>::value_type v6 = 11;
LABEL_67:
          std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v6);
        }
        break;
      case 'x':
LABEL_42:
        if ((std::basic_regex<char> *)((char *)&v4->__traits_.__loc_.__locale_ + 1) == a3) {
          goto LABEL_86;
        }
        char v12 = BYTE1(v4->__traits_.__loc_.__locale_);
        char v13 = -48;
        if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38) {
          goto LABEL_47;
        }
        v12 |= 0x20u;
        if ((v12 - 97) >= 6u) {
          goto LABEL_86;
        }
        char v13 = -87;
LABEL_47:
        if ((std::basic_regex<char> *)((char *)&v4->__traits_.__loc_.__locale_ + 2) == a3) {
          goto LABEL_86;
        }
        char v14 = BYTE2(v4->__traits_.__loc_.__locale_);
        char v15 = -48;
        if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38)
        {
          v14 |= 0x20u;
          if ((v14 - 97) >= 6u) {
LABEL_86:
          }
            std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)3>();
          char v15 = -87;
        }
        std::basic_regex<char>::value_type v16 = v15 + v14 + 16 * (v13 + v12);
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
          *(unsigned char *)a4 = v16;
          *((unsigned char *)a4 + 1) = 0;
          return (std::basic_regex<char> *)((char *)v4 + 3);
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v16);
          return (std::basic_regex<char> *)((char *)v4 + 3);
        }
      default:
        if ((char)locale_low == 95
          || ((char)locale_low & 0x80000000) == 0 && (a1->__traits_.__ct_->__tab_[locale_low] & 0x500) != 0)
        {
          goto LABEL_86;
        }
        if (!a4) {
          goto LABEL_67;
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
        *(unsigned char *)a4 = locale_low;
        *((unsigned char *)a4 + 1) = 0;
        break;
    }
    return (std::basic_regex<char> *)((char *)v4 + 1);
  }
  return v4;
}

void std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  unint64_t v4 = a4 - a3;
  if ((unint64_t)(a4 - a3) >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:fe180100]();
  }
  std::basic_regex<char>::value_type v6 = a3;
  if (v4 > 0x16)
  {
    uint64_t v10 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v10 = v4 | 7;
    }
    uint64_t v11 = v10 + 1;
    std::basic_regex<char>::value_type v9 = (char *)operator new(v10 + 1);
    __s[1] = (char *)v4;
    int64_t v28 = v11 | 0x8000000000000000;
    __s[0] = v9;
    if (v6 == a4) {
      goto LABEL_18;
    }
  }
  else
  {
    HIBYTE(v28) = (_BYTE)a4 - (_BYTE)a3;
    std::basic_regex<char>::value_type v9 = (char *)__s;
    if (a3 == a4) {
      goto LABEL_18;
    }
  }
  if (v4 < 0x20 || (unint64_t)(v9 - v6) < 0x20)
  {
    char v13 = v9;
  }
  else
  {
    unint64_t v12 = v4 & 0xFFFFFFFFFFFFFFE0;
    char v13 = &v9[v4 & 0xFFFFFFFFFFFFFFE0];
    char v14 = (long long *)(v6 + 16);
    char v15 = v9 + 16;
    unint64_t v16 = v4 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v17 = *v14;
      *(v15 - 1) = *(v14 - 1);
      *char v15 = v17;
      v14 += 2;
      v15 += 2;
      v16 -= 32;
    }
    while (v16);
    if (v4 == v12)
    {
      v9 += v4 & 0xFFFFFFFFFFFFFFE0;
      goto LABEL_18;
    }
    v6 += v12;
  }
  std::basic_regex<char>::value_type v9 = v13;
  do
  {
    char v18 = *v6++;
    *v9++ = v18;
  }
  while (v6 != a4);
LABEL_18:
  *std::basic_regex<char>::value_type v9 = 0;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  if (SHIBYTE(v28) < 0)
  {
    if (!__s[1]) {
      goto LABEL_26;
    }
    v19 = __s[0];
  }
  else
  {
    if (!HIBYTE(v28)) {
      return;
    }
    v19 = (const char *)__s;
  }
  std::__get_collation_name(&v26, v19);
  *(_OWORD *)a1 = *(_OWORD *)&v26.__r_.__value_.__l.__data_;
  unint64_t v20 = v26.__r_.__value_.__r.__words[2];
  *(void *)(a1 + 16) = *((void *)&v26.__r_.__value_.__l + 2);
  unint64_t v21 = HIBYTE(v20);
  if ((v21 & 0x80u) != 0) {
    unint64_t v21 = *(void *)(a1 + 8);
  }
  if (v21) {
    goto LABEL_26;
  }
  if ((SHIBYTE(v28) & 0x80000000) == 0)
  {
    if (HIBYTE(v28) >= 3u) {
      return;
    }
    goto LABEL_32;
  }
  if (__s[1] < (char *)3)
  {
LABEL_32:
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
        if (__s != (char **)a1)
        {
          if (v28 >= 0) {
            v24 = __s;
          }
          else {
            v24 = (char **)__s[0];
          }
          if (v28 >= 0) {
            size_t v25 = HIBYTE(v28);
          }
          else {
            size_t v25 = (size_t)__s[1];
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
        if (__s != (char **)a1)
        {
          if (SHIBYTE(v28) < 0)
          {
            std::string::__assign_no_alias<true>((void *)a1, __s[0], (size_t)__s[1]);
          }
          else
          {
            *(_OWORD *)a1 = *(_OWORD *)__s;
            *(void *)(a1 + 16) = v28;
          }
        }
      }
      else
      {
        *(unsigned char *)a1 = 0;
        *(unsigned char *)(a1 + 23) = 0;
      }
    }
  }
LABEL_26:
  if (SHIBYTE(v28) < 0) {
    operator delete(__s[0]);
  }
}

void sub_18DB7C398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0)
  {
    operator delete(*(void **)v17);
    if ((a17 & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  else if ((a17 & 0x80000000) == 0)
  {
LABEL_3:
    _Unwind_Resume(a1);
  }
  operator delete(__p);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)1>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x192FA3BA0](exception, 1);
  __cxa_throw(exception, MEMORY[0x1E4FBA2D8], MEMORY[0x1E4FBA200]);
}

void sub_18DB7C420(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)2>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x192FA3BA0](exception, 2);
  __cxa_throw(exception, MEMORY[0x1E4FBA2D8], MEMORY[0x1E4FBA200]);
}

void sub_18DB7C478(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void **std::vector<std::pair<std::string,std::string>>::~vector[abi:fe180100](void **a1)
{
  unint64_t v2 = (void **)*a1;
  if (*a1)
  {
    unint64_t v3 = (void **)a1[1];
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

void std::__bracket_expression<char,std::regex_traits<char>>::__exec(const std::__bracket_expression<char, std::regex_traits<char>> *this, std::__bracket_expression<char, std::regex_traits<char>>::__state *a2)
{
  unint64_t v2 = a2;
  current = a2->__current_;
  last = a2->__last_;
  if (current == last)
  {
    uint64_t v10 = 0;
    BOOL negate = this->__negate_;
    goto LABEL_249;
  }
  if (!this->__might_have_digraph_ || current + 1 == last) {
    goto LABEL_41;
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
  *((unsigned char *)&__s.__r_.__value_.__s + 23) = 2;
  LOWORD(__s.__r_.__value_.__l.__data_) = __src;
  __s.__r_.__value_.__s.__data_[2] = 0;
  std::__get_collation_name(&v124, (const char *)&__s);
  std::string __p = v124;
  std::string::size_type size = HIBYTE(v124.__r_.__value_.__r.__words[2]);
  int v9 = SHIBYTE(v124.__r_.__value_.__r.__words[2]);
  if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v124.__r_.__value_.__l.__size_;
  }
  if (size) {
    goto LABEL_9;
  }
  if ((SHIBYTE(__s.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u) {
      goto LABEL_14;
    }
    goto LABEL_164;
  }
  if (__s.__r_.__value_.__l.__size_ < 3)
  {
LABEL_164:
    (*(void (**)(std::string *__return_ptr))(*(void *)this->__traits_.__col_ + 32))(&v124);
    if (v9 < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::string __p = v124;
    if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0)
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
          size_t v86 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
        }
        else {
          size_t v86 = __s.__r_.__value_.__l.__size_;
        }
        std::string::__assign_no_alias<false>((void **)&__p.__r_.__value_.__l.__data_, p_s, v86);
      }
      else
      {
        *__p.__r_.__value_.__l.__data_ = 0;
        __p.__r_.__value_.__l.__size_ = 0;
      }
    }
    else if (HIBYTE(v124.__r_.__value_.__r.__words[2]) == 1 || HIBYTE(v124.__r_.__value_.__r.__words[2]) == 12)
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
  }
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
LABEL_14:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type v28 = __p.__r_.__value_.__l.__size_;
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v28) {
      goto LABEL_16;
    }
LABEL_41:
    BOOL negate = 0;
    uint64_t v10 = 1;
    goto LABEL_42;
  }
  if (!*((unsigned char *)&__p.__r_.__value_.__s + 23)) {
    goto LABEL_41;
  }
LABEL_16:
  std::vector<std::pair<char, char>>::pointer begin = this->__digraphs_.__begin_;
  uint64_t v13 = (char *)this->__digraphs_.__end_ - (char *)begin;
  if (v13)
  {
    uint64_t v14 = v13 >> 1;
    if ((unint64_t)(v13 >> 1) <= 1) {
      uint64_t v14 = 1;
    }
    p_second = &begin->second;
    while (__src != *(p_second - 1) || HIBYTE(__src) != *p_second)
    {
      p_second += 2;
      if (!--v14) {
        goto LABEL_25;
      }
    }
LABEL_262:
    BOOL negate = 1;
    uint64_t v10 = 2;
    goto LABEL_249;
  }
LABEL_25:
  if (!this->__collate_ || this->__ranges_.__begin_ == this->__ranges_.__end_)
  {
    BOOL negate = 0;
    goto LABEL_188;
  }
  *((unsigned char *)&__s.__r_.__value_.__s + 23) = 2;
  LOWORD(__s.__r_.__value_.__l.__data_) = __src;
  __s.__r_.__value_.__s.__data_[2] = 0;
  (*(void (**)(std::string *__return_ptr))(*(void *)this->__traits_.__col_ + 32))(&v124);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
  std::vector<std::pair<std::string, std::string>>::pointer v17 = this->__ranges_.__begin_;
  char v18 = HIBYTE(v124.__r_.__value_.__r.__words[2]);
  int64_t v19 = (char *)this->__ranges_.__end_ - (char *)v17;
  if (!v19)
  {
    BOOL v27 = 0;
    int v69 = 0;
    BOOL negate = 0;
    goto LABEL_185;
  }
  v118 = v2;
  uint64_t v20 = 0;
  unint64_t v21 = v19 / 48;
  if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v22 = &v124;
  }
  else {
    int v22 = (std::string *)v124.__r_.__value_.__r.__words[0];
  }
  char v23 = HIBYTE(v124.__r_.__value_.__r.__words[2]);
  if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v24 = HIBYTE(v124.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v24 = v124.__r_.__value_.__l.__size_;
  }
  if (v21 <= 1) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = v19 / 48;
  }
  std::string v26 = (unsigned __int8 *)&v17->second.__r_.__value_.__r.__words[2] + 7;
  BOOL v27 = 1;
  do
  {
    int v59 = (char)*(v26 - 24);
    if (v59 >= 0) {
      v60 = (char *)(v26 - 47);
    }
    else {
      v60 = *(char **)(v26 - 47);
    }
    if (v59 >= 0) {
      size_t v61 = *(v26 - 24);
    }
    else {
      size_t v61 = *(void *)(v26 - 39);
    }
    if (v24 >= v61) {
      size_t v62 = v61;
    }
    else {
      size_t v62 = v24;
    }
    int v63 = memcmp(v60, v22, v62);
    if (v63)
    {
      if ((v63 & 0x80000000) == 0) {
        goto LABEL_103;
      }
    }
    else if (v61 > v24)
    {
      goto LABEL_103;
    }
    int v64 = (char)*v26;
    if (v64 >= 0) {
      v65 = (char *)(v26 - 23);
    }
    else {
      v65 = *(char **)(v26 - 23);
    }
    if (v64 >= 0) {
      size_t v66 = *v26;
    }
    else {
      size_t v66 = *(void *)(v26 - 15);
    }
    if (v66 >= v24) {
      size_t v67 = v24;
    }
    else {
      size_t v67 = v66;
    }
    int v68 = memcmp(v22, v65, v67);
    if (v68)
    {
      if (v68 < 0)
      {
LABEL_128:
        BOOL negate = 1;
        int v69 = 5;
        goto LABEL_174;
      }
    }
    else if (v24 <= v66)
    {
      goto LABEL_128;
    }
LABEL_103:
    BOOL v27 = ++v20 < v21;
    v26 += 48;
  }
  while (v25 != v20);
  int v69 = 0;
  BOOL negate = 0;
LABEL_174:
  unint64_t v2 = v118;
  char v18 = v23;
LABEL_185:
  if (v18 < 0) {
    operator delete(v124.__r_.__value_.__l.__data_);
  }
  if (v27) {
    goto LABEL_213;
  }
LABEL_188:
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_) {
    goto LABEL_217;
  }
  std::regex_traits<char>::__transform_primary<char *>(&__s, (uint64_t)&this->__traits_, &__src, &v124);
  std::vector<std::string>::pointer v87 = this->__equivalences_.__begin_;
  uint64_t v88 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  int64_t v89 = (char *)this->__equivalences_.__end_ - (char *)v87;
  if (!v89)
  {
    if ((*((unsigned char *)&__s.__r_.__value_.__s + 23) & 0x80) != 0) {
      operator delete(__s.__r_.__value_.__l.__data_);
    }
    goto LABEL_217;
  }
  BOOL v117 = negate;
  v121 = v2;
  uint64_t v90 = 0;
  unint64_t v91 = v89 / 24;
  long long v92 = *(_OWORD *)&__s.__r_.__value_.__l.__data_;
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v93 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v93 = __s.__r_.__value_.__l.__size_;
  }
  if (v91 <= 1) {
    uint64_t v94 = 1;
  }
  else {
    uint64_t v94 = v89 / 24;
  }
  BOOL v95 = 1;
  while (2)
  {
    v96 = &v87[v90];
    std::string::size_type v97 = HIBYTE(v96->__r_.__value_.__r.__words[2]);
    int v98 = (char)v97;
    if ((v97 & 0x80u) != 0) {
      std::string::size_type v97 = v96->__r_.__value_.__l.__size_;
    }
    if (v93 != v97)
    {
LABEL_198:
      BOOL v95 = ++v90 < v91;
      if (v90 == v94)
      {
        int v69 = 0;
        unint64_t v2 = v121;
        BOOL negate = v117;
        if ((v88 & 0x80) != 0) {
          goto LABEL_211;
        }
        goto LABEL_212;
      }
      continue;
    }
    break;
  }
  if (v98 >= 0) {
    v99 = &v87[v90];
  }
  else {
    v99 = (std::string *)v96->__r_.__value_.__r.__words[0];
  }
  if ((v88 & 0x80) != 0)
  {
    if (!memcmp((const void *)v92, v99, *((size_t *)&v92 + 1)))
    {
      int v69 = 5;
      BOOL negate = 1;
      unint64_t v2 = v121;
      goto LABEL_211;
    }
    goto LABEL_198;
  }
  if (!v88)
  {
    BOOL negate = 1;
    if (v95)
    {
      unint64_t v2 = v121;
      goto LABEL_214;
    }
    unint64_t v2 = v121;
    unsigned __int8 v102 = __src;
    if (((char)__src & 0x80000000) == 0)
    {
LABEL_218:
      std::regex_traits<char>::char_class_type mask = this->__mask_;
      tab = this->__traits_.__ct_->__tab_;
      std::ctype_base::mask v105 = tab[v102];
      if (((v105 & mask) != 0 || v102 == 95 && (mask & 0x80) != 0)
        && (SHIBYTE(__src) & 0x80000000) == 0
        && ((tab[HIBYTE(__src)] & mask) != 0 || (mask & 0x80) != 0 && HIBYTE(__src) == 95))
      {
        goto LABEL_262;
      }
      neg_std::regex_traits<char>::char_class_type mask = this->__neg_mask_;
      if ((v105 & neg_mask) != 0 || v102 == 95 && (neg_mask & 0x80) != 0) {
        goto LABEL_260;
      }
      goto LABEL_256;
    }
LABEL_255:
    neg_std::regex_traits<char>::char_class_type mask = this->__neg_mask_;
LABEL_256:
    if (SHIBYTE(__src) < 0) {
      goto LABEL_262;
    }
    if ((this->__traits_.__ct_->__tab_[HIBYTE(__src)] & neg_mask) == 0)
    {
      int v111 = 1;
      if (HIBYTE(__src) != 95 || (neg_mask & 0x80) == 0)
      {
LABEL_261:
        BOOL negate = v111;
        uint64_t v10 = 2;
        goto LABEL_249;
      }
    }
LABEL_260:
    int v111 = negate;
    goto LABEL_261;
  }
  v100 = &__s;
  uint64_t v101 = v88;
  do
  {
    if (v100->__r_.__value_.__s.__data_[0] != v99->__r_.__value_.__s.__data_[0]) {
      goto LABEL_198;
    }
    v100 = (std::string *)((char *)v100 + 1);
    v99 = (std::string *)((char *)v99 + 1);
    --v101;
  }
  while (v101);
  BOOL negate = 1;
  int v69 = 5;
  unint64_t v2 = v121;
  if ((v88 & 0x80) != 0) {
LABEL_211:
  }
    operator delete(__s.__r_.__value_.__l.__data_);
LABEL_212:
  if (!v95)
  {
LABEL_217:
    unsigned __int8 v102 = __src;
    if (((char)__src & 0x80000000) == 0) {
      goto LABEL_218;
    }
    goto LABEL_255;
  }
LABEL_213:
  if (v69)
  {
LABEL_214:
    uint64_t v10 = 2;
    goto LABEL_249;
  }
  uint64_t v10 = 2;
LABEL_42:
  unsigned __int8 v29 = *v2->__current_;
  __p.__r_.__value_.__s.__data_[0] = v29;
  if (this->__icase_)
  {
    unsigned __int8 v29 = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, (char)v29);
    __p.__r_.__value_.__s.__data_[0] = v29;
  }
  std::vector<char>::pointer v30 = this->__chars_.__begin_;
  unint64_t v31 = this->__chars_.__end_ - v30;
  if (v31)
  {
    if (v31 <= 1) {
      unint64_t v31 = 1;
    }
    do
    {
      int v32 = *v30++;
      if (v32 == v29) {
        goto LABEL_248;
      }
      --v31;
    }
    while (v31);
  }
  std::regex_traits<char>::char_class_type v33 = this->__neg_mask_;
  if (v33 || this->__neg_chars_.__begin_ != this->__neg_chars_.__end_)
  {
    if ((v29 & 0x80) != 0 || (this->__traits_.__ct_->__tab_[v29] & v33) == 0) {
      int v34 = (v29 == 95) & (v33 >> 7);
    }
    else {
      LOBYTE(v34) = 1;
    }
    std::vector<char>::pointer end = this->__neg_chars_.__end_;
    std::vector<char>::pointer v36 = (std::vector<char>::pointer)memchr(this->__neg_chars_.__begin_, (char)v29, end - this->__neg_chars_.__begin_);
    v37 = v36 ? v36 : end;
    if ((v34 & 1) == 0 && v37 == end)
    {
LABEL_248:
      BOOL negate = 1;
      goto LABEL_249;
    }
  }
  std::vector<std::pair<std::string, std::string>>::pointer v38 = this->__ranges_.__begin_;
  std::vector<std::pair<std::string, std::string>>::pointer v39 = this->__ranges_.__end_;
  if (v38 == v39) {
    goto LABEL_134;
  }
  if (!this->__collate_)
  {
    unsigned int v40 = 1;
    *((unsigned char *)&v124.__r_.__value_.__s + 23) = 1;
    LOWORD(v124.__r_.__value_.__l.__data_) = v29;
    int64_t v41 = (char *)v39 - (char *)v38;
    if (v41) {
      goto LABEL_65;
    }
LABEL_161:
    BOOL v48 = 0;
    if ((v40 & 0x80) != 0) {
      goto LABEL_132;
    }
    goto LABEL_133;
  }
  *((unsigned char *)&__s.__r_.__value_.__s + 23) = 1;
  LOWORD(__s.__r_.__value_.__l.__data_) = v29;
  (*(void (**)(std::string *__return_ptr))(*(void *)this->__traits_.__col_ + 32))(&v124);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
  std::vector<std::pair<std::string, std::string>>::pointer v38 = this->__ranges_.__begin_;
  unsigned int v40 = HIBYTE(v124.__r_.__value_.__r.__words[2]);
  int64_t v41 = (char *)this->__ranges_.__end_ - (char *)v38;
  if (!v41) {
    goto LABEL_161;
  }
LABEL_65:
  uint64_t v113 = v10;
  BOOL v115 = negate;
  v119 = v2;
  uint64_t v42 = 0;
  unint64_t v43 = v41 / 48;
  char v112 = v40;
  if ((v40 & 0x80u) == 0) {
    v44 = &v124;
  }
  else {
    v44 = (std::string *)v124.__r_.__value_.__r.__words[0];
  }
  if ((v40 & 0x80u) == 0) {
    std::string::size_type v45 = v40;
  }
  else {
    std::string::size_type v45 = v124.__r_.__value_.__l.__size_;
  }
  if (v43 <= 1) {
    uint64_t v46 = 1;
  }
  else {
    uint64_t v46 = v41 / 48;
  }
  v47 = (unsigned __int8 *)&v38->second.__r_.__value_.__r.__words[2] + 7;
  BOOL v48 = 1;
  while (2)
  {
    int v49 = (char)*(v47 - 24);
    if (v49 >= 0) {
      v50 = (char *)(v47 - 47);
    }
    else {
      v50 = *(char **)(v47 - 47);
    }
    if (v49 >= 0) {
      size_t v51 = *(v47 - 24);
    }
    else {
      size_t v51 = *(void *)(v47 - 39);
    }
    if (v45 >= v51) {
      size_t v52 = v51;
    }
    else {
      size_t v52 = v45;
    }
    int v53 = memcmp(v50, v44, v52);
    if (v53)
    {
      if (v53 < 0) {
        goto LABEL_90;
      }
    }
    else if (v51 <= v45)
    {
LABEL_90:
      int v54 = (char)*v47;
      if (v54 >= 0) {
        v55 = (char *)(v47 - 23);
      }
      else {
        v55 = *(char **)(v47 - 23);
      }
      if (v54 >= 0) {
        size_t v56 = *v47;
      }
      else {
        size_t v56 = *(void *)(v47 - 15);
      }
      if (v56 >= v45) {
        size_t v57 = v45;
      }
      else {
        size_t v57 = v56;
      }
      int v58 = memcmp(v44, v55, v57);
      if (v58)
      {
        if (v58 < 0)
        {
LABEL_101:
          BOOL negate = 1;
          unint64_t v2 = v119;
          goto LABEL_131;
        }
      }
      else if (v45 <= v56)
      {
        goto LABEL_101;
      }
    }
    BOOL v48 = ++v42 < v43;
    v47 += 48;
    if (v46 != v42) {
      continue;
    }
    break;
  }
  unint64_t v2 = v119;
  BOOL negate = v115;
LABEL_131:
  uint64_t v10 = v113;
  if (v112 < 0) {
LABEL_132:
  }
    operator delete(v124.__r_.__value_.__l.__data_);
LABEL_133:
  if (!v48)
  {
LABEL_134:
    if (this->__equivalences_.__begin_ != this->__equivalences_.__end_)
    {
      BOOL v116 = negate;
      std::regex_traits<char>::__transform_primary<char *>(&__s, (uint64_t)&this->__traits_, &__p, &__p.__r_.__value_.__s.__data_[1]);
      std::vector<std::string>::pointer v70 = this->__equivalences_.__begin_;
      uint64_t v71 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
      int64_t v72 = (char *)this->__equivalences_.__end_ - (char *)v70;
      if (v72)
      {
        uint64_t v114 = v10;
        v120 = v2;
        uint64_t v73 = 0;
        unint64_t v74 = v72 / 24;
        long long v75 = *(_OWORD *)&__s.__r_.__value_.__l.__data_;
        if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v76 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v76 = __s.__r_.__value_.__l.__size_;
        }
        if (v74 <= 1) {
          uint64_t v77 = 1;
        }
        else {
          uint64_t v77 = v72 / 24;
        }
        BOOL v78 = 1;
        do
        {
          v79 = &v70[v73];
          std::string::size_type v80 = HIBYTE(v79->__r_.__value_.__r.__words[2]);
          int v81 = (char)v80;
          if ((v80 & 0x80u) != 0) {
            std::string::size_type v80 = v79->__r_.__value_.__l.__size_;
          }
          if (v76 == v80)
          {
            if (v81 >= 0) {
              v82 = &v70[v73];
            }
            else {
              v82 = (std::string *)v79->__r_.__value_.__r.__words[0];
            }
            if ((v71 & 0x80) != 0)
            {
              if (!memcmp((const void *)v75, v82, *((size_t *)&v75 + 1)))
              {
                BOOL negate = 1;
                unint64_t v2 = v120;
                uint64_t v10 = v114;
                goto LABEL_241;
              }
            }
            else
            {
              if (!v71)
              {
                BOOL negate = 1;
                unint64_t v2 = v120;
                uint64_t v10 = v114;
                if (!v78) {
                  goto LABEL_242;
                }
                goto LABEL_249;
              }
              v83 = &__s;
              uint64_t v84 = v71;
              while (v83->__r_.__value_.__s.__data_[0] == v82->__r_.__value_.__s.__data_[0])
              {
                v83 = (std::string *)((char *)v83 + 1);
                v82 = (std::string *)((char *)v82 + 1);
                if (!--v84)
                {
                  BOOL negate = 1;
                  goto LABEL_157;
                }
              }
            }
          }
          BOOL v78 = ++v73 < v74;
        }
        while (v73 != v77);
        BOOL negate = v116;
LABEL_157:
        unint64_t v2 = v120;
        uint64_t v10 = v114;
        if ((v71 & 0x80) == 0)
        {
          if (!v78) {
            goto LABEL_242;
          }
          goto LABEL_249;
        }
LABEL_241:
        operator delete(__s.__r_.__value_.__l.__data_);
        if (v78) {
          goto LABEL_249;
        }
      }
      else
      {
        BOOL negate = v116;
        if ((*((unsigned char *)&__s.__r_.__value_.__s + 23) & 0x80) != 0) {
          operator delete(__s.__r_.__value_.__l.__data_);
        }
      }
LABEL_242:
      unsigned __int8 v29 = __p.__r_.__value_.__s.__data_[0];
    }
    if ((v29 & 0x80) == 0)
    {
      std::regex_traits<char>::char_class_type v107 = this->__mask_;
      if ((this->__traits_.__ct_->__tab_[v29] & v107) != 0) {
        goto LABEL_248;
      }
      int v108 = (v107 >> 7) & 1;
      if (v29 != 95) {
        int v108 = 0;
      }
      if (v108 == 1) {
        goto LABEL_248;
      }
    }
  }
LABEL_249:
  if (negate == this->__negate_)
  {
    first = 0;
    int v110 = -993;
  }
  else
  {
    v2->__current_ += v10;
    first = this->__first_;
    int v110 = -995;
  }
  v2->__do_ = v110;
  v2->__node_ = first;
}

void sub_18DB7D058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
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

void std::regex_traits<char>::__transform_primary<char *>(unsigned char *a1, uint64_t a2, unsigned char *__src, unsigned char *a4)
{
  size_t v4 = a4 - __src;
  if ((unint64_t)(a4 - __src) >= 0x7FFFFFFFFFFFFFF8) {
LABEL_34:
  }
    std::string::__throw_length_error[abi:fe180100]();
  if (v4 <= 0x16)
  {
    HIBYTE(v18) = (_BYTE)a4 - (_BYTE)__src;
    p_dst = (void **)&__dst;
    if (__src == a4) {
      goto LABEL_9;
    }
LABEL_8:
    memcpy(p_dst, __src, v4);
    p_dst = (void **)((char *)p_dst + v4);
    goto LABEL_9;
  }
  uint64_t v10 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v4 | 7) != 0x17) {
    uint64_t v10 = v4 | 7;
  }
  uint64_t v11 = v10 + 1;
  p_dst = (void **)operator new(v10 + 1);
  size_t v17 = v4;
  int64_t v18 = v11 | 0x8000000000000000;
  __dst = p_dst;
  if (__src != a4) {
    goto LABEL_8;
  }
LABEL_9:
  *(unsigned char *)p_dst = 0;
  size_t v12 = HIBYTE(v18);
  if (v18 >= 0) {
    uint64_t v13 = (void **)&__dst;
  }
  else {
    uint64_t v13 = __dst;
  }
  if (v18 < 0) {
    size_t v12 = v17;
  }
  (*(void (**)(void, void **, char *))(**(void **)(a2 + 16) + 32))(*(void *)(a2 + 16), v13, (char *)v13 + v12);
  unsigned int v14 = a1[23];
  if ((v14 & 0x80u) == 0) {
    uint64_t v15 = a1[23];
  }
  else {
    uint64_t v15 = *((void *)a1 + 1);
  }
  if (v15 == 1) {
    goto LABEL_28;
  }
  if (v15 == 12)
  {
    if ((v14 & 0x80) != 0)
    {
      if (*((void *)a1 + 1) <= 0xAuLL)
      {
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
      a1 = *(unsigned char **)a1;
    }
    else if (v14 <= 0xA)
    {
      goto LABEL_33;
    }
    a1[11] = a1[3];
LABEL_28:
    if ((SHIBYTE(v18) & 0x80000000) == 0) {
      return;
    }
    goto LABEL_29;
  }
  if ((v14 & 0x80) == 0)
  {
    *a1 = 0;
    a1[23] = 0;
    if ((SHIBYTE(v18) & 0x80000000) == 0) {
      return;
    }
    goto LABEL_29;
  }
  **(unsigned char **)a1 = 0;
  *((void *)a1 + 1) = 0;
  if (SHIBYTE(v18) < 0) {
LABEL_29:
  }
    operator delete(__dst);
}

void sub_18DB7D26C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(a1);
  JUMPOUT(0x192FA4080);
}

std::locale *std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  locale = a1[17].__locale_;
  if (locale)
  {
    unint64_t v3 = a1[18].__locale_;
    size_t v4 = a1[17].__locale_;
    if (v3 != locale)
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*((void **)v3 - 3));
        }
        unint64_t v3 = (std::locale::__imp *)((char *)v3 - 24);
      }
      while (v3 != locale);
      size_t v4 = a1[17].__locale_;
    }
    a1[18].__locale_ = locale;
    operator delete(v4);
  }
  uint64_t v5 = a1[14].__locale_;
  if (v5)
  {
    a1[15].__locale_ = v5;
    operator delete(v5);
  }
  char v6 = a1[11].__locale_;
  if (v6)
  {
    char v7 = a1[12].__locale_;
    v8 = a1[11].__locale_;
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
      char v7 = (std::locale::__imp *)((char *)v7 - 48);
      if (v7 == v6)
      {
        v8 = a1[11].__locale_;
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  int v9 = a1[8].__locale_;
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
  uint64_t v11 = a1[1].__locale_;
  if (v11) {
    (*(void (**)(std::locale::__imp *))(*(void *)v11 + 8))(v11);
  }
  return a1;
}

uint64_t std::__match_any<char>::__exec(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(unsigned char **)(a2 + 16);
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

void std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }
  JUMPOUT(0x192FA4080);
}

void (__cdecl ***std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

BOOL std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(std::basic_regex<char> *this, char a2)
{
  if ((a2 & 0xF8) != 0x30 && (a2 & 0xFE) != 0x38 || a2 - 49 > 8) {
    return 0;
  }
  if (a2 - 48 > this->__marked_count_) {
    std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)4>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, a2 - 48);
  return 1;
}

void std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)4>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x192FA3BA0](exception, 4);
  __cxa_throw(exception, MEMORY[0x1E4FBA2D8], MEMORY[0x1E4FBA200]);
}

void sub_18DB7D618(_Unwind_Exception *a1)
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

unsigned int *std::__back_ref<char>::__exec(unsigned int *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  uint64_t v3 = *(void *)(a2 + 32);
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3);
  if (v4 < v2) {
LABEL_10:
  }
    std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)4>();
  unint64_t v5 = (v2 - 1);
  if (v4 <= v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned char *)(v3 + 24 * v5 + 16)
    && (char v7 = result,
        uint64_t v8 = v3 + 24 * v5,
        result = *(unsigned int **)v8,
        int64_t v9 = *(void *)(v8 + 8) - *(void *)v8,
        uint64_t v10 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v10 >= v9)
    && (result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v9), !result))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 16) = v10 + v9;
    uint64_t v11 = *((void *)v7 + 1);
  }
  else
  {
    uint64_t v11 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 80) = v11;
  return result;
}

void std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }
  JUMPOUT(0x192FA4080);
}

void (__cdecl ***std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

uint64_t std::__back_ref_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unint64_t v2 = (*(_DWORD *)(result + 40) - 1);
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) <= v2)
  {
    __break(1u);
  }
  else
  {
    if (!*(unsigned char *)(v3 + 24 * v2 + 16)
      || (unint64_t v4 = (unsigned __int8 **)(v3 + 24 * v2),
          unint64_t v5 = *v4,
          uint64_t v6 = v4[1] - *v4,
          uint64_t v7 = *(void *)(a2 + 16),
          *(void *)(a2 + 24) - v7 < v6))
    {
LABEL_4:
      *(_DWORD *)a2 = -993;
      *(void *)(a2 + 80) = 0;
      return result;
    }
    if (v6 >= 1)
    {
      uint64_t v8 = v6;
      int64_t v9 = *(unsigned __int8 **)(a2 + 16);
      do
      {
        int v11 = *v5++;
        int v10 = v11;
        int v12 = *v9++;
        if (v10 != v12) {
          goto LABEL_4;
        }
      }
      while (--v8);
    }
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 16) = v7 + v6;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
  return result;
}

void std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_1EDC83838;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  JUMPOUT(0x192FA4080);
}

std::locale *std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_1EDC83838;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

uint64_t std::__back_ref_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unint64_t v2 = (*(_DWORD *)(result + 40) - 1);
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) > v2)
  {
    uint64_t v5 = v3 + 24 * v2;
    if (*(unsigned char *)(v5 + 16))
    {
      uint64_t v6 = *(void *)(v5 + 8) - *(void *)v5;
      uint64_t v7 = *(void *)(a2 + 16);
      if (*(void *)(a2 + 24) - v7 >= v6)
      {
        uint64_t v9 = result;
        if (v6 < 1)
        {
LABEL_10:
          *(_DWORD *)a2 = -994;
          *(void *)(a2 + 16) = v7 + v6;
          uint64_t v8 = *(void *)(v9 + 8);
          goto LABEL_11;
        }
        uint64_t v10 = 0;
        while (1)
        {
          int v11 = (*(uint64_t (**)(void, void))(**(void **)(v9 + 24) + 40))(*(void *)(v9 + 24), *(char *)(*(void *)v5 + v10));
          result = (*(uint64_t (**)(void, void))(**(void **)(v9 + 24) + 40))(*(void *)(v9 + 24), *(char *)(*(void *)(a2 + 16) + v10));
          if (v11 != result) {
            break;
          }
          if (v6 == ++v10)
          {
            uint64_t v7 = *(void *)(a2 + 16);
            goto LABEL_10;
          }
        }
      }
    }
    uint64_t v8 = 0;
    *(_DWORD *)a2 = -993;
LABEL_11:
    *(void *)(a2 + 80) = v8;
    return result;
  }
  __break(1u);
  return result;
}

void std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_1EDC83750;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  JUMPOUT(0x192FA4080);
}

std::locale *std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_1EDC83750;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    goto LABEL_15;
  }
  uint64_t v7 = a2 + 1;
  int v6 = *a2;
  if (a2 + 1 == a3 && v6 == 36) {
    goto LABEL_15;
  }
  if ((v6 - 46) <= 0x2E && ((1 << (v6 - 46)) & 0x600000000001) != 0)
  {
    if (v7 != a3 && v6 == 92)
    {
      int v9 = (char)*v7;
      if ((v9 - 36) <= 0x3A && ((1 << (v9 - 36)) & 0x580000000000441) != 0)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v9);
        uint64_t v10 = a2 + 2;
        goto LABEL_16;
      }
    }
    if (*a2 == 46) {
      operator new();
    }
LABEL_15:
    uint64_t v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(a1, a2, a3);
LABEL_16:
    if (a2 != v10) {
      return v10;
    }
    goto LABEL_17;
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v6);
  uint64_t v10 = a2 + 1;
  if (a2 != v7) {
    return v10;
  }
LABEL_17:
  if (a2 != a3 && a2 + 1 != a3 && *a2 == 92)
  {
    uint64_t v11 = 2 * (a2[1] == 40);
    if (v11)
    {
      int v12 = &a2[v11];
      if ((*(unsigned char *)(a1 + 24) & 2) == 0) {
        operator new();
      }
      do
      {
        if (v12 == a3) {
          goto LABEL_39;
        }
        unsigned int v14 = v12;
        uint64_t v15 = *(std::__owns_one_state<char> **)(a1 + 56);
        int v16 = *(_DWORD *)(a1 + 28);
        size_t v17 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(a1, v14, a3);
        if (v14 == v17) {
          break;
        }
        int v12 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v17, a3, v15, (v16 + 1), (*(_DWORD *)(a1 + 28) + 1));
      }
      while (v14 != v12);
      if (v14 + 1 == a3 || *v14 != 92 || v14[1] != 41) {
LABEL_39:
      }
        std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)6>();
      uint64_t v10 = &v14[2 * (v14[1] == 41)];
      if ((*(unsigned char *)(a1 + 24) & 2) == 0) {
        operator new();
      }
    }
    else
    {
      int v13 = a2[1];
      if (((v13 & 0xF8) == 0x30 || (v13 & 0xFE) == 0x38) && (v13 - 49) <= 8)
      {
        if ((v13 - 48) > *(_DWORD *)(a1 + 28)) {
          std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)4>();
        }
        std::basic_regex<char,std::regex_traits<char>>::__push_back_ref((std::basic_regex<char> *)a1, v13 - 48);
        return a2 + 2;
      }
    }
  }
  return v10;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  if (a2 == a3) {
    return a2;
  }
  int v7 = *a2;
  if (v7 != 42)
  {
    uint64_t v8 = a3;
    if (a2 + 1 != a3 && v7 == 92 && a2[1] == 123)
    {
      int v9 = &a2[2 * (a2[1] == 123)];
      if (v9 == a3) {
        goto LABEL_47;
      }
      int v10 = *v9;
      if ((v10 & 0xF8) != 0x30 && (v10 & 0xFE) != 0x38) {
        goto LABEL_47;
      }
      int v11 = v10 - 48;
      int v12 = v9 + 1;
      if (v9 + 1 == a3)
      {
LABEL_15:
        int v12 = a3;
      }
      else
      {
        while (1)
        {
          int v13 = *v12;
          if ((v13 & 0xF8) != 0x30 && (v13 & 0xFE) != 0x38) {
            break;
          }
          if (v11 >= 214748364) {
            goto LABEL_47;
          }
          int v11 = v13 + 10 * v11 - 48;
          if (++v12 == a3) {
            goto LABEL_15;
          }
        }
      }
      if (v12 == v9) {
        goto LABEL_47;
      }
      if (v12 == a3) {
LABEL_48:
      }
        std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)7>();
      unsigned int v14 = v12 + 1;
      int v15 = *v12;
      if (v15 != 44)
      {
        if (v14 != a3 && v15 == 92 && *v14 == 125)
        {
          size_t v19 = v11;
          uint64_t v8 = v12 + 2;
          __mexp_std::vector<std::pair<char, char>>::pointer begin = __mexp_begin;
          __mexp_std::vector<char>::pointer end = __mexp_end;
          size_t v20 = v11;
LABEL_46:
          std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v19, v20, a4, __mexp_begin, __mexp_end, 1);
          return v8;
        }
        goto LABEL_48;
      }
      if (v14 == a3) {
        goto LABEL_48;
      }
      int v16 = *v14;
      if ((v16 & 0xF8) == 0x30 || (v16 & 0xFE) == 0x38)
      {
        int v17 = v16 - 48;
        unsigned int v14 = v12 + 2;
        if (v12 + 2 == a3)
        {
LABEL_38:
          unsigned int v14 = a3;
          goto LABEL_41;
        }
        while (1)
        {
          int v16 = *v14;
          if ((v16 & 0xF8) != 0x30 && (v16 & 0xFE) != 0x38) {
            break;
          }
          if (v17 >= 214748364) {
            goto LABEL_47;
          }
          int v17 = v16 + 10 * v17 - 48;
          if (++v14 == a3) {
            goto LABEL_38;
          }
        }
      }
      else
      {
        int v17 = -1;
      }
      if (v14 == a3)
      {
        unint64_t v21 = v14;
        unsigned int v14 = a3;
        uint64_t v8 = v21;
      }
      else if (v14 + 1 == a3 || v16 != 92)
      {
        uint64_t v8 = v14;
      }
      else
      {
        uint64_t v8 = &v14[2 * (v14[1] == 125)];
      }
LABEL_41:
      if (v14 != v8)
      {
        if (v17 == -1)
        {
          size_t v19 = v11;
          __mexp_std::vector<std::pair<char, char>>::pointer begin = __mexp_begin;
          __mexp_std::vector<char>::pointer end = __mexp_end;
          size_t v20 = -1;
          goto LABEL_46;
        }
        if (v17 >= v11)
        {
          size_t v19 = v11;
          size_t v20 = v17;
          __mexp_std::vector<std::pair<char, char>>::pointer begin = __mexp_begin;
          __mexp_std::vector<char>::pointer end = __mexp_end;
          goto LABEL_46;
        }
LABEL_47:
        std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)8>();
      }
      goto LABEL_48;
    }
    return a2;
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, 0, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
  return a2 + 1;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3)
  {
    int v6 = *a2;
    if (v6 > 91)
    {
      if (v6 == 92)
      {
        if (a2 + 1 != a3)
        {
          int v11 = a2[1];
          if (v11 == 66) {
            operator new();
          }
          if (v11 == 98) {
            operator new();
          }
        }
      }
      else if (v6 == 94)
      {
        operator new();
      }
    }
    else
    {
      if (v6 == 36) {
        operator new();
      }
      if (v6 == 40 && a2 + 1 != a3 && a2[1] == 63 && a2 + 2 != a3)
      {
        int v7 = a2[2];
        if (v7 == 33)
        {
          std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:fe180100]((uint64_t)&v13);
          v13.__flags_ = a1->__flags_;
          uint64_t v8 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v13, v3 + 3, a3);
          unsigned int marked_count = v13.__marked_count_;
          std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(a1, &v13, 1, a1->__marked_count_);
          a1->__marked_count_ += marked_count;
          if (v8 == a3 || *v8 != 41) {
            std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)6>();
          }
          goto LABEL_25;
        }
        if (v7 == 61)
        {
          std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:fe180100]((uint64_t)&v13);
          v13.__flags_ = a1->__flags_;
          uint64_t v8 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v13, v3 + 3, a3);
          unsigned int v9 = v13.__marked_count_;
          std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(a1, &v13, 0, a1->__marked_count_);
          a1->__marked_count_ += v9;
          if (v8 == a3 || *v8 != 41) {
            std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)6>();
          }
LABEL_25:
          uint64_t v3 = v8 + 1;
          std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&v13.__traits_.__loc_);
        }
      }
    }
  }
  return v3;
}

void sub_18DB7E648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return (std::basic_regex<char> *)v3;
  }
  int v5 = *a2;
  switch(*a2)
  {
    case '$':
    case ')':
    case ']':
    case '^':
    case '|':
    case '}':
      return (std::basic_regex<char> *)v3;
    case '(':
      if (a2 + 1 == a3) {
        goto LABEL_48;
      }
      if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
      {
        ++*(_DWORD *)(a1 + 36);
        unsigned int v9 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(a1, a2 + 3, a3);
        if (v9 != a3 && *v9 == 41)
        {
          --*(_DWORD *)(a1 + 36);
          return (std::basic_regex<char> *)(v9 + 1);
        }
LABEL_48:
        std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)6>();
      }
      if ((*(unsigned char *)(a1 + 24) & 2) == 0) {
        operator new();
      }
      ++*(_DWORD *)(a1 + 36);
      std::basic_regex<char> v13 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(a1, a2 + 1, a3);
      if (v13 == a3 || *v13 != 41) {
        goto LABEL_48;
      }
      if ((*(unsigned char *)(a1 + 24) & 2) == 0) {
        operator new();
      }
      --*(_DWORD *)(a1 + 36);
      return (std::basic_regex<char> *)(v13 + 1);
    case '*':
    case '+':
    case '?':
    case '{':
      std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)11>();
    case '.':
      operator new();
    case '[':
      return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(a1, a2, a3);
    case '\\':
      int v7 = (std::basic_regex<char> *)a2;
      if (v5 != 92) {
        return v7;
      }
      int v10 = (std::basic_regex<char> *)(a2 + 1);
      if (a2 + 1 == a3) {
        std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)3>();
      }
      int locale_low = LOBYTE(v10->__traits_.__loc_.__locale_);
      unsigned int v12 = locale_low - 48;
      if (locale_low == 48)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v12);
        return (std::basic_regex<char> *)(v3 + 2);
      }
      if ((locale_low - 49) > 8) {
        goto LABEL_37;
      }
      int v7 = (std::basic_regex<char> *)(v3 + 2);
      if (v3 + 2 == a3)
      {
        int v7 = (std::basic_regex<char> *)a3;
      }
      else
      {
        while (1)
        {
          int v14 = LOBYTE(v7->__traits_.__loc_.__locale_);
          if ((v14 - 48) > 9) {
            break;
          }
          if (v12 >= 0x19999999) {
            goto LABEL_49;
          }
          int v7 = (std::basic_regex<char> *)((char *)v7 + 1);
          unsigned int v12 = v14 + 10 * v12 - 48;
          if (v7 == (std::basic_regex<char> *)a3)
          {
            int v7 = (std::basic_regex<char> *)a3;
            break;
          }
        }
        if (!v12) {
LABEL_49:
        }
          std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)4>();
      }
      if (v12 > *(_DWORD *)(a1 + 28)) {
        goto LABEL_49;
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_back_ref((std::basic_regex<char> *)a1, v12);
      if (v10 != v7) {
        return v7;
      }
LABEL_37:
      switch(LOBYTE(v10->__traits_.__loc_.__locale_))
      {
        case 'D':
          operator new();
        case 'S':
          operator new();
        case 'W':
          operator new();
        case 'd':
          operator new();
        case 's':
          operator new();
        case 'w':
          operator new();
        default:
          int v15 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)(v3 + 1), (std::basic_regex<char> *)a3, 0);
          if (v10 == v15) {
            int v7 = (std::basic_regex<char> *)v3;
          }
          else {
            int v7 = v15;
          }
          break;
      }
      break;
    default:
      std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v5);
      return (std::basic_regex<char> *)++v3;
  }
  return v7;
}

void sub_18DB7EBD0(_Unwind_Exception *a1)
{
  MEMORY[0x192FA4080](v1, 0x10F1C4061CF1F02);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:fe180100]<(std::regex_constants::error_type)11>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x192FA3BA0](exception, 11);
  __cxa_throw(exception, MEMORY[0x1E4FBA2D8], MEMORY[0x1E4FBA200]);
}

void sub_18DB7EE84(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }
  JUMPOUT(0x192FA4080);
}

void (__cdecl ***std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:fe180100](uint64_t a1)
{
  unint64_t v2 = (const std::locale *)MEMORY[0x192FA3F40]();
  *(void *)(a1 + 8) = std::locale::use_facet(v2, MEMORY[0x1E4FBA258]);
  *(void *)(a1 + 16) = std::locale::use_facet((const std::locale *)a1, MEMORY[0x1E4FBA280]);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 56) = 0;
  return a1;
}

void sub_18DB7EFEC(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(std::basic_regex<char> *this, const std::basic_regex<char> *a2, BOOL a3, unsigned int a4)
{
}

void std::__lookahead<char,std::regex_traits<char>>::__exec(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  char v24 = 0;
  memset(&v25, 0, 17);
  char v26 = 0;
  uint64_t v27 = 0;
  memset(&__p, 0, sizeof(__p));
  std::vector<std::csub_match>::size_type v4 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v5 = *(void *)(a2 + 16);
  v21.first = *(const char **)(a2 + 24);
  v21.second = v21.first;
  v21.matched = 0;
  std::vector<std::sub_match<char const*>>::assign(&__p, v4, &v21);
  uint64_t v22 = v5;
  uint64_t v23 = v5;
  char v24 = 0;
  std::vector<std::csub_match>::value_type v25 = v21;
  uint64_t v27 = v5;
  char v26 = 1;
  uint64_t v6 = *(void *)(a2 + 16);
  if (*(unsigned char *)(a2 + 92)) {
    BOOL v7 = v6 == *(void *)(a2 + 8);
  }
  else {
    BOOL v7 = 0;
  }
  char v8 = v7;
  std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1 + 16, v6, *(const char **)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40, v8);
  if (*(unsigned __int8 *)(a1 + 84) == v9)
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    std::vector<std::csub_match>::pointer begin = __p.__begin_;
    goto LABEL_14;
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(a1 + 8);
  std::vector<std::csub_match>::pointer begin = __p.__begin_;
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__end_ - (char *)__p.__begin_) >> 3);
  if (v11 < 2)
  {
LABEL_14:
    if (begin)
    {
LABEL_15:
      operator delete(begin);
    }
    return;
  }
  int v12 = *(_DWORD *)(a1 + 80);
  uint64_t v13 = *(void *)(a2 + 32);
  unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v13) >> 3);
  unsigned int v15 = 2;
  unint64_t v16 = 1;
  while (1)
  {
    unint64_t v17 = v12 + v15 - 2;
    if (v14 <= v17) {
      break;
    }
    int64_t v18 = &begin[v16];
    uint64_t v19 = v13 + 24 * v17;
    *(std::pair<const char *, const char *> *)uint64_t v19 = v18->std::pair<const char *, const char *>;
    *(unsigned char *)(v19 + 16) = v18->matched;
    unint64_t v16 = v15++;
    if (v11 <= v16) {
      goto LABEL_15;
    }
  }
  __break(1u);
}

void sub_18DB7F274(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_1EDC83660;
  unint64_t v2 = (std::locale *)(a1 + 2);
  uint64_t v3 = (std::__shared_weak_count *)a1[8];
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  std::locale::~locale(v2);
  std::vector<std::csub_match>::size_type v4 = a1[1];
  if (v4) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  }
  JUMPOUT(0x192FA4080);
}

void (__cdecl ***std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_1EDC83660;
  unint64_t v2 = (std::locale *)(a1 + 2);
  uint64_t v3 = (std::__shared_weak_count *)a1[8];
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  std::locale::~locale(v2);
  std::vector<std::csub_match>::size_type v4 = a1[1];
  if (v4) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  }
  return a1;
}

uint64_t std::__word_boundary<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(unsigned __int8 **)(a2 + 8);
  uint64_t v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3) {
    goto LABEL_18;
  }
  std::vector<std::csub_match>::size_type v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(unsigned char *)(a2 + 88) & 8) == 0)
    {
      uint64_t v6 = *(v3 - 1);
      if (v6 != 95)
      {
LABEL_15:
        if ((v6 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v6) & 0x500) != 0) {
          goto LABEL_17;
        }
        goto LABEL_18;
      }
LABEL_17:
      int v10 = 1;
      goto LABEL_25;
    }
LABEL_18:
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
        if (v6 != 95) {
          goto LABEL_15;
        }
        goto LABEL_17;
      }
      goto LABEL_18;
    }
  }
  uint64_t v7 = *(v4 - 1);
  uint64_t v8 = *v4;
  if (v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v7) & 0x500) != 0)
  {
    int v9 = 1;
    if (v8 == 95) {
      goto LABEL_22;
    }
  }
  else
  {
    int v9 = 0;
    if (v8 == 95) {
      goto LABEL_22;
    }
  }
  if ((v8 & 0x80) != 0 || (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v8) & 0x500) == 0)
  {
    int v11 = 0;
    goto LABEL_24;
  }
LABEL_22:
  int v11 = 1;
LABEL_24:
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

void std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_1EDC83720;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  JUMPOUT(0x192FA4080);
}

std::locale *std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_1EDC83720;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000018DDF2FBBLL
    || ((v3 & 0x800000018DDF2FBBLL & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x800000018DDF2FBBLL)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000018DDF2FBBLL & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FA4080);
}

void std::__empty_state<char>::__exec(const std::__empty_state<char> *this, std::__empty_state<char>::__state *a2)
{
  a2->__do_ = -994;
  a2->__node_ = this->__first_;
}

void std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }
  JUMPOUT(0x192FA4080);
}

void (__cdecl ***std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__end_state<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void std::__end_state<char>::~__end_state()
{
}

void std::__shared_ptr_emplace<AMSCore::EncodeHTTPRequestTask::Options>::__on_zero_shared(uint64_t a1)
{
}

void std::__shared_ptr_emplace<AMSCore::EncodeHTTPRequestTask::Options>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDC83EF8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FA4080);
}

void std::__shared_ptr_emplace<AMSCore::EncodeHTTPRequestTask::Options>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDC83EF8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<AMSCore::ExecuteHTTPRequestTask::Options>::__on_zero_shared(uint64_t a1)
{
}

void std::__shared_ptr_emplace<AMSCore::ExecuteHTTPRequestTask::Options>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDC84010;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FA4080);
}

void std::__shared_ptr_emplace<AMSCore::ExecuteHTTPRequestTask::Options>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDC84010;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void AMSCore::ExecuteHTTPRequestTask::IHandler::handleResponse(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = operator new(0x240uLL);
  void *v7 = AMSCore::ExecuteHTTPRequestTask::IHandler::handleResponse;
  v7[1] = AMSCore::ExecuteHTTPRequestTask::IHandler::handleResponse;
  v7[68] = a2[1];
  *a2 = 0;
  a2[1] = 0;
  v7[69] = a3[1];
  *a3 = 0;
  a3[1] = 0;
  v7[70] = a4[1];
  *a4 = 0;
  a4[1] = 0;
  atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 1u);
  *((unsigned char *)v7 + 24) = 0;
  *((unsigned char *)v7 + 488) = 0;
  v7[62] = 0;
  v7[66] = 0;
  std::shared_ptr<AMSCore::Task<AMSCore::HTTPResponseAction,void>::Promise>::shared_ptr[abi:fe180100]<AMSCore::Task<AMSCore::HTTPResponseAction,void>::Promise,AMSCore::Task<AMSCore::HTTPResponseAction,void>::Promise::get_return_object(void)::DetachPromise,void>(v8, (uint64_t)(v7 + 2));
}

void sub_18DB7FAF8(void *a1)
{
}

void AMSCore::ExecuteHTTPRequestTask::IHandler::handleResponse(void *__p)
{
  unint64_t v2 = (char *)(__p + 63);
  uint64_t v3 = (char *)__p[66];
  if (v3 == v2)
  {
    (*(void (**)(char *))(*(void *)v2 + 32))(v2);
    if (*((unsigned char *)__p + 488)) {
LABEL_5:
    }
      AMSCore::HTTPResponseAction::~HTTPResponseAction((AMSCore::HTTPResponseAction *)(__p + 3));
  }
  else
  {
    if (v3) {
      (*(void (**)(char *))(*(void *)v3 + 40))(v3);
    }
    if (*((unsigned char *)__p + 488)) {
      goto LABEL_5;
    }
  }
  uint64_t v4 = __p[70];
  if (atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 0xFFFFFFFF) == 1) {
    MEMORY[0x192FA3E80](AMSCore::TaskCounter::getCount(void)::count);
  }
  if (v4 && !atomic_fetch_add((atomic_ullong *volatile)(__p[70] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    int v5 = (std::__shared_weak_count *)__p[70];
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  uint64_t v6 = __p[69];
  if (v6 && !atomic_fetch_add((atomic_ullong *volatile)(v6 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v7 = (std::__shared_weak_count *)__p[69];
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  uint64_t v8 = __p[68];
  if (v8 && !atomic_fetch_add((atomic_ullong *volatile)(v8 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    int v9 = (std::__shared_weak_count *)__p[68];
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  operator delete(__p);
}

void AMSCore::ExecuteHTTPRequestTask::anonymous namespace'::handleRedirect(AMSCore::ExecuteHTTPRequestTask::_anonymous_namespace_ *this, const AMSCore::HTTPResponse *a2)
{
  if (*((unsigned __int16 *)a2 + 76) - 300 >= 0x64)
  {
    *(unsigned char *)this = 0;
    *((unsigned char *)this + 24) = 0;
    *((unsigned char *)this + 32) = 0;
    *((unsigned char *)this + 48) = 0;
    *((unsigned char *)this + 56) = 0;
    *((unsigned char *)this + 128) = 0;
    *((unsigned char *)this + 136) = 0;
    *((unsigned char *)this + 288) = 0;
    *((unsigned char *)this + 296) = 0;
    *((unsigned char *)this + 300) = 0;
    *((unsigned char *)this + 304) = 0;
    *((unsigned char *)this + 336) = 0;
    *((_WORD *)this + 172) = 0;
    *((unsigned char *)this + 352) = 0;
    *((unsigned char *)this + 376) = 0;
    *((unsigned char *)this + 384) = 0;
    *((unsigned char *)this + 408) = 0;
    *((unsigned char *)this + 416) = 0;
    *((unsigned char *)this + 448) = 0;
    *((unsigned char *)this + 456) = 1;
    return;
  }
  HIBYTE(v48) = 8;
  strcpy((char *)__p, "Location");
  AMSCore::IHTTPHeaderMap::getSingleValueOrNone(&v44, (void *)a2 + 20, (char *)__p);
  if (SHIBYTE(v48) < 0)
  {
    operator delete(__p[0]);
    if (v45) {
      goto LABEL_4;
    }
  }
  else if (v45)
  {
LABEL_4:
    if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v3 = &v44;
    }
    else {
      uint64_t v3 = (std::string *)v44.__r_.__value_.__r.__words[0];
    }
    if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v44.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v44.__r_.__value_.__l.__size_;
    }
    AMSCore::URL::parse((uint64_t)v3, size, (uint64_t)__p);
    if (v63)
    {
      LOBYTE(v14) = 0;
      char v16 = 0;
      if (v49)
      {
        long long v14 = *(_OWORD *)__p;
        uint64_t v15 = v48;
        __p[1] = 0;
        uint64_t v48 = 0;
        __p[0] = 0;
        char v16 = 1;
      }
      LOBYTE(v17) = 0;
      char v19 = 0;
      if (v52)
      {
        long long v17 = v50;
        uint64_t v18 = v51;
        uint64_t v51 = 0;
        long long v50 = 0uLL;
        char v19 = 1;
      }
      LOBYTE(v20) = 0;
      char v22 = 0;
      if (v55)
      {
        long long v20 = v53;
        uint64_t v21 = v54;
        uint64_t v54 = 0;
        long long v53 = 0uLL;
        char v22 = 1;
      }
      int v23 = v57;
      v24[0] = v24;
      v24[1] = v24;
      uint64_t v25 = 0;
      uint64_t v5 = v60;
      if (v60)
      {
        uint64_t v7 = v58;
        uint64_t v6 = v59;
        uint64_t v8 = *v59;
        *(void *)(v8 + 8) = *(void *)(v58 + 8);
        **(void **)(v7 + 8) = v8;
        uint64_t v9 = v24[0];
        *(void *)(v24[0] + 8) = v6;
        void *v6 = v9;
        v24[0] = v7;
        *(void *)(v7 + 8) = v24;
        uint64_t v25 = v5;
        uint64_t v60 = 0;
      }
      long long v26 = v61;
      uint64_t v27 = v62;
      uint64_t v62 = 0;
      long long v61 = 0uLL;
      char v28 = 0;
      char v29 = 0;
      v30[0] = 0;
      char v32 = 0;
      __int16 v33 = 0;
      char v34 = 0;
      char v37 = 0;
      AMSCore::HTTPResponseAction::createRedirectAction((uint64_t)this, (uint64_t)&v14);
      if (v37)
      {
        int v10 = v36;
        if (v36 && !atomic_fetch_add(&v36->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
        int v11 = v35;
        if (v35 && !atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      if (v32)
      {
        if (v31 != -1) {
          ((void (*)(std::system_error *, unsigned char *))off_1EDCA64B8[v31])(&v38, v30);
        }
        int v31 = -1;
      }
      AMSCore::URL::~URL((AMSCore::URL *)&v14);
      if (v63) {
        goto LABEL_31;
      }
    }
    else
    {
      AMSCore::StringUtils::join<char [43]>("The redirect location could not be parsed.", &__what_arg);
      v65.__cat_ = (const std::error_category *)&AMSCore::Error::Category::network(void)::instance;
      *(void *)&v65.__val_ = 311;
      std::system_error::system_error(&v38, v65, &__what_arg);
      if (SHIBYTE(__what_arg.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__what_arg.__r_.__value_.__l.__data_);
      }
      unsigned int v40 = 0;
      uint64_t v41 = 0;
      v38.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
      std::vector<std::pair<std::string, std::string>>::pointer v39 = &v40;
      uint64_t v42 = 0;
      unint64_t v43 = 0;
      AMSCore::HTTPResponseAction::createCancelAction(this, &v38);
      v38.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
      int v13 = v43;
      if (v43 && !atomic_fetch_add(&v43->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
      std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v39, v40);
      MEMORY[0x192FA3C30](&v38);
      if (v63)
      {
LABEL_31:
        AMSCore::URL::~URL((AMSCore::URL *)__p);
        if (!v45) {
          return;
        }
        goto LABEL_51;
      }
    }
    (*(void (**)(void **))__p[0])(__p);
    if (!v45) {
      return;
    }
LABEL_51:
    if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v44.__r_.__value_.__l.__data_);
    }
    return;
  }
  std::ostringstream::basic_ostringstream[abi:fe180100]((uint64_t)__p);
  std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(__p, (uint64_t)"The response did not include a redirect location.", 49);
  std::stringbuf::str[abi:fe180100]((uint64_t)&__p[1], &__what_arg);
  __p[0] = *(void **)MEMORY[0x1E4FBA418];
  *(void **)((char *)__p + *((void *)__p[0] - 3)) = *(void **)(MEMORY[0x1E4FBA418] + 24);
  __p[1] = (void *)(MEMORY[0x1E4FBA470] + 16);
  if (v56 < 0) {
    operator delete(*((void **)&v53 + 1));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x192FA3FD0](&v59);
  v64.__cat_ = (const std::error_category *)&AMSCore::Error::Category::network(void)::instance;
  *(void *)&v64.__val_ = 314;
  std::system_error::system_error(&v38, v64, &__what_arg);
  if (SHIBYTE(__what_arg.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__what_arg.__r_.__value_.__l.__data_);
  }
  unsigned int v40 = 0;
  uint64_t v41 = 0;
  v38.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
  std::vector<std::pair<std::string, std::string>>::pointer v39 = &v40;
  uint64_t v42 = 0;
  unint64_t v43 = 0;
  AMSCore::HTTPResponseAction::createCancelAction(this, &v38);
  v38.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
  uint64_t v12 = v43;
  if (v43 && !atomic_fetch_add(&v43->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v39, v40);
  MEMORY[0x192FA3C30](&v38);
  if (v45) {
    goto LABEL_51;
  }
}

void sub_18DB80310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *__p,uint64_t a50,int a51,__int16 a52,char a53,char a54,char a55,void *a56,uint64_t a57,uint64_t a58,uint64_t a59)
{
  if (a55)
  {
    if (a54 < 0) {
      operator delete(__p);
    }
  }
  _Unwind_Resume(a1);
}

void AMSCore::ExecuteHTTPRequestTask::IHandlerBase::handleDialog(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = operator new(0x1D0uLL);
  *uint64_t v3 = AMSCore::ExecuteHTTPRequestTask::IHandlerBase::handleDialog;
  v3[1] = AMSCore::ExecuteHTTPRequestTask::IHandlerBase::handleDialog;
  AMSCore::DialogRequest::DialogRequest((uint64_t)(v3 + 19), a2);
  atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 1u);
  *((unsigned char *)v3 + 24) = 0;
  *((unsigned char *)v3 + 104) = 0;
  v3[14] = 0;
  v3[18] = 0;
  operator new();
}

void sub_18DB8095C(uint64_t a1, int a2)
{
  if (a2)
  {
    __cxa_end_catch();
    JUMPOUT(0x18DB808D4);
  }
  JUMPOUT(0x18DB8097CLL);
}

void AMSCore::ExecuteHTTPRequestTask::IHandlerBase::handleDialog(char *a1)
{
  unint64_t v2 = (AMSCore::DialogRequest *)(a1 + 152);
  AMSCore::Task<AMSCore::DialogResult,AMSCore::Error>::Promise::~Promise((uint64_t)(a1 + 16));
  AMSCore::DialogRequest::~DialogRequest(v2);
  operator delete(a1);
}

void AMSCore::Task<AMSCore::DialogResult,AMSCore::Error>::Promise::unhandled_exception()
{
  AMSCore::Error::makeFromCurrentException((AMSCore::Error *)&v0);
}

uint64_t sub_18DB809F0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::runtime_error a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  AMSCore::Unexpected<AMSCore::Error,AMSCore::Error>((uint64_t)v36, (uint64_t)v33);
  std::optional<std::expected<std::shared_ptr<AMSCore::IBag>,AMSCore::Error>>::emplace[abi:fe180100]<std::unexpected<AMSCore::Error>,void>(v29, v36);
  v36[0].__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
  std::vector<char>::pointer v30 = v38;
  if (v38 && !atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
  }
  std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)v37, v37[1]);
  MEMORY[0x192FA3C30](v36);
  v33[0] = &unk_1EDC827D8;
  int v31 = v35;
  if (v35 && !atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
    std::__shared_weak_count::__release_weak(v31);
  }
  std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)v34, v34[1]);
  return MEMORY[0x192FA3C30](v33);
}

uint64_t AMSCore::Task<AMSCore::DialogResult,AMSCore::Error>::Promise::~Promise(uint64_t a1)
{
  uint64_t v2 = a1 + 104;
  uint64_t v3 = *(void *)(a1 + 128);
  if (v3 == v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
    if (!*(unsigned char *)(a1 + 88)) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
  }
  if (*(unsigned char *)(a1 + 88))
  {
LABEL_7:
    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v4 = *(std::__shared_weak_count **)(a1 + 16);
      if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    else
    {
      (**(void (***)(void))(a1 + 8))();
    }
  }
LABEL_12:
  if (atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 0xFFFFFFFF) == 1) {
    MEMORY[0x192FA3E80](AMSCore::TaskCounter::getCount(void)::count);
  }
  return a1;
}

uint64_t std::__shared_ptr_pointer<AMSCore::Task<AMSCore::DialogResult,AMSCore::Error>::Promise *,AMSCore::Task<AMSCore::DialogResult,AMSCore::Error>::Promise::get_return_object(void)::DetachPromise,std::allocator<AMSCore::Task<AMSCore::DialogResult,AMSCore::Error>::Promise>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN7AMSCore4TaskINS_12DialogResultENS_5ErrorEE7Promise17get_return_objectEvE13DetachPromise"
    || ((v3 & (unint64_t)"ZN7AMSCore4TaskINS_12DialogResultENS_5ErrorEE7Promise17get_return_objectEvE13DetachPromise" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN7AMSCore4TaskINS_12DialogResultENS_5ErrorEE7Promise17get_return_objectEvE13DetachPromise")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN7AMSCore4TaskINS_12DialogResultENS_5ErrorEE7Promise17get_return_objectEvE13DetachPromise" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<AMSCore::Task<AMSCore::DialogResult,AMSCore::Error>::Promise *,AMSCore::Task<AMSCore::DialogResult,AMSCore::Error>::Promise::get_return_object(void)::DetachPromise,std::allocator<AMSCore::Task<AMSCore::DialogResult,AMSCore::Error>::Promise>>::__on_zero_shared(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 24);
  if (atomic_exchange((atomic_ullong *volatile)(v1 + 96), 2uLL)) {
    return (*(uint64_t (**)(uint64_t))(v1 - 8))(v1 - 16);
  }
  return result;
}

void std::__shared_ptr_pointer<AMSCore::Task<AMSCore::DialogResult,AMSCore::Error>::Promise *,AMSCore::Task<AMSCore::DialogResult,AMSCore::Error>::Promise::get_return_object(void)::DetachPromise,std::allocator<AMSCore::Task<AMSCore::DialogResult,AMSCore::Error>::Promise>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FA4080);
}

void AMSCore::ExecuteHTTPRequestTask::IHandler::encodeRetryRequest(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = operator new(0x748uLL);
  *uint64_t v5 = AMSCore::ExecuteHTTPRequestTask::IHandler::encodeRetryRequest;
  v5[1] = AMSCore::ExecuteHTTPRequestTask::IHandler::encodeRetryRequest;
  AMSCore::HTTPResponseAction::HTTPResponseAction((uint64_t)(v5 + 58), a2);
  *a3 = 0;
  a3[1] = 0;
  atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 1u);
  *((unsigned char *)v5 + 24) = 0;
  *((unsigned char *)v5 + 416) = 0;
  v5[53] = 0;
  v5[57] = 0;
  std::shared_ptr<AMSCore::Task<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>::Promise>::shared_ptr[abi:fe180100]<AMSCore::Task<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>::Promise,AMSCore::Task<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>::Promise::get_return_object(void)::DetachPromise,void>(&v6, (uint64_t)(v5 + 2));
}

std::runtime_error *AMSCore::ExecuteHTTPRequestTask::IHandler::encodeRetryRequest(std::runtime_error *result)
{
  imp = result[114].__imp_.__imp_;
  if (!imp[400])
  {
    __break(1u);
    return result;
  }
  uint64_t v2 = result;
  unint64_t v3 = result + 87;
  uint64_t v4 = (const std::runtime_error *)(imp + 8);
  char v5 = imp[392];
  if (v5)
  {
    AMSCore::EncodeHTTPRequestTask::Options::Options((uint64_t)&result[87], (uint64_t)v4);
    long long v6 = imp + 376;
    v2[110].__vftable = (std::runtime_error_vtbl *)*((void *)imp + 47);
    p_imp = &v2[110].__imp_.__imp_;
    uint64_t v8 = imp + 384;
  }
  else
  {
    std::runtime_error::runtime_error(result + 87, v4);
    v2[88] = *(std::runtime_error *)(imp + 24);
    v2[87].__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
    uint64_t v9 = imp + 48;
    uint64_t v10 = *((void *)imp + 6);
    v2[89].__vftable = (std::runtime_error_vtbl *)*((void *)imp + 5);
    int v11 = (std::runtime_error_vtbl *)&v2[89].__imp_;
    v2[89].__imp_.__imp_ = (const char *)v10;
    uint64_t v12 = (std::runtime_error_vtbl *)*((void *)imp + 7);
    v2[90].__vftable = v12;
    if (v12)
    {
      *(void *)(v10 + 16) = v11;
      *((void *)imp + 5) = v9;
      *uint64_t v9 = 0;
      *((void *)imp + 7) = 0;
    }
    else
    {
      v2[89].__vftable = v11;
    }
    int v13 = v2[114].__imp_.__imp_;
    long long v14 = (const char *)*((void *)v13 + 8);
    long long v6 = v13 + 64;
    v2[90].__imp_.__imp_ = v14;
    p_imp = &v2[91].__vftable;
    uint64_t v8 = v6 + 1;
  }
  void *p_imp = *v8;
  void *v6 = 0;
  v6[1] = 0;
  LOBYTE(v2[111].__vftable) = v5;
  std::optional<std::expected<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>>::emplace[abi:fe180100]<std::expected<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>,void>((std::runtime_error *)((char *)v2 + 24), v3);
  if (LOBYTE(v2[111].__vftable))
  {
    uint64_t v15 = (std::__shared_weak_count *)v2[110].__imp_.__imp_;
    if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
    AMSCore::EncodeHTTPRequestTask::Options::~Options((void **)&v3->__vftable);
    char v16 = v2[115].__vftable;
    if (!v16) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  ((void (*)(std::runtime_error *))v3->~runtime_error)(v3);
  char v16 = v2[115].__vftable;
  if (v16)
  {
LABEL_15:
    if (!atomic_fetch_add((atomic_ullong *volatile)&v16->~runtime_error_0, 0xFFFFFFFFFFFFFFFFLL))
    {
      long long v17 = (std::__shared_weak_count *)v2[115].__vftable;
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
LABEL_17:
  uint64_t v18 = (std::__shared_weak_count *)v2[112].__vftable;
  if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  char v19 = (std::__shared_weak_count *)v2[114].__vftable;
  if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
  AMSCore::HTTPResponseAction::~HTTPResponseAction((AMSCore::HTTPResponseAction *)&v2[58]);
  v2[115].__imp_.__imp_ = 0;
  v2[87].__vftable = (std::runtime_error_vtbl *)&v2[1];
  v2->__vftable = 0;
  return (std::runtime_error *)AMSCore::Task<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>::Promise::Awaiter::await_suspend((uint64_t)v3);
}

void AMSCore::ExecuteHTTPRequestTask::IHandler::encodeRetryRequest(void *a1)
{
  uint64_t v2 = (uint64_t)(a1 + 2);
  if (*a1)
  {
    uint64_t v3 = a1[230];
    if (v3 && !atomic_fetch_add((atomic_ullong *volatile)(v3 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v4 = (std::__shared_weak_count *)a1[230];
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    char v5 = (std::__shared_weak_count *)a1[224];
    if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    long long v6 = (std::__shared_weak_count *)a1[228];
    if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    AMSCore::HTTPResponseAction::~HTTPResponseAction((AMSCore::HTTPResponseAction *)(a1 + 116));
    AMSCore::Task<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>::Promise::~Promise(v2);
  }
  else
  {
    uint64_t v7 = a1[231];
    AMSCore::Task<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>::Promise::~Promise((uint64_t)(a1 + 2));
    if (v7 && !atomic_fetch_add((atomic_ullong *volatile)(a1[231] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v8 = (std::__shared_weak_count *)a1[231];
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  AMSCore::HTTPResponseAction::~HTTPResponseAction((AMSCore::HTTPResponseAction *)(a1 + 58));
  operator delete(a1);
}

void AMSCore::ExecuteHTTPRequestTask::IHandlerBase::encodeRetryRequest(uint64_t a1, uint64_t a2, void *a3)
{
  char v5 = operator new(0x780uLL);
  *char v5 = AMSCore::ExecuteHTTPRequestTask::IHandlerBase::encodeRetryRequest;
  v5[1] = AMSCore::ExecuteHTTPRequestTask::IHandlerBase::encodeRetryRequest;
  AMSCore::HTTPResponseAction::HTTPResponseAction((uint64_t)(v5 + 58), a2);
  v5[236] = a3[1];
  *a3 = 0;
  a3[1] = 0;
  atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 1u);
  *((unsigned char *)v5 + 24) = 0;
  *((unsigned char *)v5 + 416) = 0;
  v5[53] = 0;
  v5[57] = 0;
  std::shared_ptr<AMSCore::Task<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>::Promise>::shared_ptr[abi:fe180100]<AMSCore::Task<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>::Promise,AMSCore::Task<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>::Promise::get_return_object(void)::DetachPromise,void>(&v6, (uint64_t)(v5 + 2));
}

void sub_18DB81B50(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, int a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  if (a13 != -1) {
    ((void (*)(uint64_t, char *))off_1EDCA64B8[a13])(v34 - 81, &a10);
  }
  if (a34) {
    AMSCore::URL::~URL((AMSCore::URL *)&a15);
  }
  __cxa_begin_catch(a1);
  AMSCore::Task<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>::Promise::unhandled_exception();
}

void sub_18DB81BA8()
{
}

std::runtime_error *AMSCore::ExecuteHTTPRequestTask::IHandlerBase::encodeRetryRequest(std::runtime_error *result)
{
  imp = result[118].__imp_.__imp_;
  if (!imp[400])
  {
    __break(1u);
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 58;
  uint64_t v4 = (const std::runtime_error *)(imp + 8);
  char v5 = imp[392];
  if (v5)
  {
    AMSCore::EncodeHTTPRequestTask::Options::Options((uint64_t)&result[58], (uint64_t)v4);
    std::string v6 = imp + 376;
    v2[81].__vftable = (std::runtime_error_vtbl *)*((void *)imp + 47);
    p_imp = &v2[81].__imp_.__imp_;
    uint64_t v8 = imp + 384;
  }
  else
  {
    std::runtime_error::runtime_error(result + 58, v4);
    v2[59] = *(std::runtime_error *)(imp + 24);
    v2[58].__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
    uint64_t v9 = imp + 48;
    uint64_t v10 = *((void *)imp + 6);
    v2[60].__vftable = (std::runtime_error_vtbl *)*((void *)imp + 5);
    int v11 = (std::runtime_error_vtbl *)&v2[60].__imp_;
    v2[60].__imp_.__imp_ = (const char *)v10;
    uint64_t v12 = (std::runtime_error_vtbl *)*((void *)imp + 7);
    v2[61].__vftable = v12;
    if (v12)
    {
      *(void *)(v10 + 16) = v11;
      *((void *)imp + 5) = v9;
      *uint64_t v9 = 0;
      *((void *)imp + 7) = 0;
    }
    else
    {
      v2[60].__vftable = v11;
    }
    int v13 = v2[118].__imp_.__imp_;
    long long v14 = (const char *)*((void *)v13 + 8);
    std::string v6 = v13 + 64;
    v2[61].__imp_.__imp_ = v14;
    p_imp = &v2[62].__vftable;
    uint64_t v8 = v6 + 1;
  }
  void *p_imp = *v8;
  void *v6 = 0;
  v6[1] = 0;
  LOBYTE(v2[82].__vftable) = v5;
  std::optional<std::expected<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>>::emplace[abi:fe180100]<std::expected<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>,void>((std::runtime_error *)((char *)v2 + 24), v3);
  if (LOBYTE(v2[82].__vftable))
  {
    uint64_t v15 = (std::__shared_weak_count *)v2[81].__imp_.__imp_;
    if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
    AMSCore::EncodeHTTPRequestTask::Options::~Options((void **)&v3->__vftable);
    char v16 = v2[119].__vftable;
    if (!v16) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  ((void (*)(std::runtime_error *))v3->~runtime_error)(v3);
  char v16 = v2[119].__vftable;
  if (v16)
  {
LABEL_15:
    if (!atomic_fetch_add((atomic_ullong *volatile)&v16->~runtime_error_0, 0xFFFFFFFFFFFFFFFFLL))
    {
      long long v17 = (std::__shared_weak_count *)v2[119].__vftable;
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
LABEL_17:
  uint64_t v18 = (std::__shared_weak_count *)v2[117].__imp_.__imp_;
  if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  AMSCore::EncodeHTTPRequestTask::Options::~Options((void **)&v2[82].__imp_);
  v2[58].__vftable = (std::runtime_error_vtbl *)&v2[1];
  v2->__vftable = 0;
  return (std::runtime_error *)AMSCore::Task<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>::Promise::Awaiter::await_suspend((uint64_t)v3);
}

void AMSCore::ExecuteHTTPRequestTask::IHandlerBase::encodeRetryRequest(char *a1)
{
  uint64_t v2 = (uint64_t)(a1 + 16);
  if (*(void *)a1)
  {
    uint64_t v3 = *((void *)a1 + 238);
    if (v3 && !atomic_fetch_add((atomic_ullong *volatile)(v3 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v4 = (std::__shared_weak_count *)*((void *)a1 + 238);
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    char v5 = (std::__shared_weak_count *)*((void *)a1 + 235);
    if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    AMSCore::EncodeHTTPRequestTask::Options::~Options((void **)a1 + 165);
  }
  uint64_t v6 = *((void *)a1 + 236);
  AMSCore::Task<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>::Promise::~Promise(v2);
  if (v6 && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)a1 + 236) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v7 = (std::__shared_weak_count *)*((void *)a1 + 236);
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  AMSCore::HTTPResponseAction::~HTTPResponseAction((AMSCore::HTTPResponseAction *)(a1 + 464));
  operator delete(a1);
}

void AMSCore::ExecuteHTTPRequestTask::AnonymousHandler::handleResponse(uint64_t a1, void *a2, void *a3)
{
  char v5 = operator new(0x238uLL);
  *char v5 = AMSCore::ExecuteHTTPRequestTask::AnonymousHandler::handleResponse;
  v5[1] = AMSCore::ExecuteHTTPRequestTask::AnonymousHandler::handleResponse;
  v5[68] = a2[1];
  *a2 = 0;
  a2[1] = 0;
  v5[69] = a3[1];
  *a3 = 0;
  a3[1] = 0;
  atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 1u);
  *((unsigned char *)v5 + 24) = 0;
  *((unsigned char *)v5 + 488) = 0;
  v5[62] = 0;
  v5[66] = 0;
  std::shared_ptr<AMSCore::Task<AMSCore::HTTPResponseAction,void>::Promise>::shared_ptr[abi:fe180100]<AMSCore::Task<AMSCore::HTTPResponseAction,void>::Promise,AMSCore::Task<AMSCore::HTTPResponseAction,void>::Promise::get_return_object(void)::DetachPromise,void>(v6, (uint64_t)(v5 + 2));
}

void sub_18DB82058(void *a1)
{
}

void AMSCore::ExecuteHTTPRequestTask::AnonymousHandler::handleResponse(void *__p)
{
  uint64_t v2 = (char *)(__p + 63);
  uint64_t v3 = (char *)__p[66];
  if (v3 == v2)
  {
    (*(void (**)(char *))(*(void *)v2 + 32))(v2);
    if (*((unsigned char *)__p + 488)) {
LABEL_5:
    }
      AMSCore::HTTPResponseAction::~HTTPResponseAction((AMSCore::HTTPResponseAction *)(__p + 3));
  }
  else
  {
    if (v3) {
      (*(void (**)(char *))(*(void *)v3 + 40))(v3);
    }
    if (*((unsigned char *)__p + 488)) {
      goto LABEL_5;
    }
  }
  uint64_t v4 = __p[69];
  if (atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 0xFFFFFFFF) == 1) {
    MEMORY[0x192FA3E80](AMSCore::TaskCounter::getCount(void)::count);
  }
  if (v4 && !atomic_fetch_add((atomic_ullong *volatile)(__p[69] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    char v5 = (std::__shared_weak_count *)__p[69];
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  uint64_t v6 = __p[68];
  if (v6 && !atomic_fetch_add((atomic_ullong *volatile)(v6 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v7 = (std::__shared_weak_count *)__p[68];
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  operator delete(__p);
}

void AMSCore::ExecuteHTTPRequestTask::AnonymousHandler::handleCompletion(uint64_t a1, void *a2, void *a3)
{
  char v5 = operator new(0x238uLL);
  *char v5 = AMSCore::ExecuteHTTPRequestTask::AnonymousHandler::handleCompletion;
  v5[1] = AMSCore::ExecuteHTTPRequestTask::AnonymousHandler::handleCompletion;
  v5[68] = a2[1];
  *a2 = 0;
  a2[1] = 0;
  v5[69] = a3[1];
  *a3 = 0;
  a3[1] = 0;
  atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 1u);
  *((unsigned char *)v5 + 24) = 0;
  *((unsigned char *)v5 + 488) = 0;
  v5[62] = 0;
  v5[66] = 0;
  std::shared_ptr<AMSCore::Task<AMSCore::HTTPResponseAction,void>::Promise>::shared_ptr[abi:fe180100]<AMSCore::Task<AMSCore::HTTPResponseAction,void>::Promise,AMSCore::Task<AMSCore::HTTPResponseAction,void>::Promise::get_return_object(void)::DetachPromise,void>(&v6, (uint64_t)(v5 + 2));
}

void AMSCore::ExecuteHTTPRequestTask::AnonymousHandler::handleCompletion(void *__p)
{
  uint64_t v2 = (char *)(__p + 63);
  uint64_t v3 = (char *)__p[66];
  if (v3 == v2)
  {
    (*(void (**)(char *))(*(void *)v2 + 32))(v2);
    if (*((unsigned char *)__p + 488)) {
LABEL_5:
    }
      AMSCore::HTTPResponseAction::~HTTPResponseAction((AMSCore::HTTPResponseAction *)(__p + 3));
  }
  else
  {
    if (v3) {
      (*(void (**)(char *))(*(void *)v3 + 40))(v3);
    }
    if (*((unsigned char *)__p + 488)) {
      goto LABEL_5;
    }
  }
  uint64_t v4 = __p[69];
  if (atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 0xFFFFFFFF) == 1) {
    MEMORY[0x192FA3E80](AMSCore::TaskCounter::getCount(void)::count);
  }
  if (v4 && !atomic_fetch_add((atomic_ullong *volatile)(__p[69] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    char v5 = (std::__shared_weak_count *)__p[69];
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  uint64_t v6 = __p[68];
  if (v6 && !atomic_fetch_add((atomic_ullong *volatile)(v6 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v7 = (std::__shared_weak_count *)__p[68];
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  operator delete(__p);
}

void AMSCore::ExecuteHTTPRequestTask::AnonymousHandler::~AnonymousHandler(AMSCore::ExecuteHTTPRequestTask::AnonymousHandler *this)
{
}

void *_ZNKSt3__110__function6__funcIPDoFNS_8expectedIN7AMSCore25LoadURLMetricsEventConfigENS3_5ErrorEEERKNS3_22ExecuteHTTPRequestTask7OptionsERKNS2_INS3_12HTTPResponseENS3_9HTTPErrorEEEENS_9allocatorISH_EEFS6_SA_SF_EE11target_typeEv()
{
  return &_ZTIPDoFNSt3__18expectedIN7AMSCore25LoadURLMetricsEventConfigENS1_5ErrorEEERKNS1_22ExecuteHTTPRequestTask7OptionsERKNS0_INS1_12HTTPResponseENS1_9HTTPErrorEEEE;
}

uint64_t _ZNKSt3__110__function6__funcIPDoFNS_8expectedIN7AMSCore25LoadURLMetricsEventConfigENS3_5ErrorEEERKNS3_22ExecuteHTTPRequestTask7OptionsERKNS2_INS3_12HTTPResponseENS3_9HTTPErrorEEEENS_9allocatorISH_EEFS6_SA_SF_EE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "PDoFNSt3__18expectedIN7AMSCore25LoadURLMetricsEventConfigENS1_5ErrorEEERKNS1_22ExecuteHTTPRequestTa"
                     "sk7OptionsERKNS0_INS1_12HTTPResponseENS1_9HTTPErrorEEEE"
    || ((v3 & (unint64_t)"PDoFNSt3__18expectedIN7AMSCore25LoadURLMetricsEventConfigENS1_5ErrorEEERKNS1_22ExecuteHT"
                                "TPRequestTask7OptionsERKNS0_INS1_12HTTPResponseENS1_9HTTPErrorEEEE" & 0x8000000000000000) != 0) != __OFSUB__(v3, "PDoFNSt3__18expectedIN7AMSCore25LoadURLMetricsEventConfigENS1_5ErrorEEERKNS1_22ExecuteHTTPRequestTask7OptionsERKNS0_INS1_12HTTPResponseENS1_9HTTPErrorEEEE")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"PDoFNSt3__18expectedIN7AMSCore25LoadURLMetricsEventConfigENS1_5ErrorEEERKNS1_22ExecuteHTTPRequestTask7OptionsERKNS0_INS1_12HTTPResponseENS1_9HTTPErrorEEEE" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t _ZNSt3__110__function6__funcIPDoFNS_8expectedIN7AMSCore25LoadURLMetricsEventConfigENS3_5ErrorEEERKNS3_22ExecuteHTTPRequestTask7OptionsERKNS2_INS3_12HTTPResponseENS3_9HTTPErrorEEEENS_9allocatorISH_EEFS6_SA_SF_EEclESA_SF_(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(a2, a3);
}

uint64_t _ZNKSt3__110__function6__funcIPDoFNS_8expectedIN7AMSCore25LoadURLMetricsEventConfigENS3_5ErrorEEERKNS3_22ExecuteHTTPRequestTask7OptionsERKNS2_INS3_12HTTPResponseENS3_9HTTPErrorEEEENS_9allocatorISH_EEFS6_SA_SF_EE7__cloneEPNS0_6__baseISK_EE(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDC82AA8;
  a2[1] = v2;
  return result;
}

void *_ZNKSt3__110__function6__funcIPDoFNS_8expectedIN7AMSCore25LoadURLMetricsEventConfigENS3_5ErrorEEERKNS3_22ExecuteHTTPRequestTask7OptionsERKNS2_INS3_12HTTPResponseENS3_9HTTPErrorEEEENS_9allocatorISH_EEFS6_SA_SF_EE7__cloneEv(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EDC82AA8;
  result[1] = v3;
  return result;
}

void _ZNSt3__110__function6__funcIPDoFNS_8expectedIN7AMSCore25LoadURLMetricsEventConfigENS3_5ErrorEEERKNS3_22ExecuteHTTPRequestTask7OptionsERKNS2_INS3_12HTTPResponseENS3_9HTTPErrorEEEENS_9allocatorISH_EEFS6_SA_SF_EED0Ev()
{
}

void AMSCore::ExecuteHTTPRequestTask::Options::getDefaultLoadURLMetricsEventConfig(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3)
  {
    AMSCore::StringUtils::join<char [61]>((std::string *)__what_arg, "No bag provided for default LoadURL metrics option creation.");
    v46.__cat_ = (const std::error_category *)&AMSCore::Error::Category::generic(void)::instance;
    *(void *)&v46.__val_ = 5;
    std::system_error::system_error(&v23, v46, (const std::string *)__what_arg);
    if ((__what_arg[23] & 0x80000000) != 0) {
      operator delete(*(void **)__what_arg);
    }
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    v23.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
    char v24 = (unsigned int **)&v25;
    long long v27 = 0uLL;
    std::runtime_error::runtime_error((std::runtime_error *)__what_arg, &v23);
    *(std::error_code *)&__what_arg[16] = v23.__ec_;
    char v5 = (unsigned int *)v25;
    *(void *)std::string __what_arg = &unk_1EDC827D8;
    uint64_t v41 = v24;
    uint64_t v42 = (unsigned int *)v25;
    uint64_t v43 = v26;
    if (v26)
    {
      *(void *)(v25 + 16) = &v42;
      char v5 = 0;
      char v24 = (unsigned int **)&v25;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
    }
    else
    {
      uint64_t v41 = &v42;
    }
    long long v44 = v27;
    long long v27 = 0uLL;
    v23.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
    std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v24, v5);
    MEMORY[0x192FA3C30](&v23);
    std::runtime_error::runtime_error((std::runtime_error *)a2, (const std::runtime_error *)__what_arg);
    *(_OWORD *)(a2 + 16) = *(_OWORD *)&__what_arg[16];
    *(void *)a2 = &unk_1EDC827D8;
    uint64_t v12 = v42;
    *(void *)(a2 + 32) = v41;
    *(void *)(a2 + 40) = v12;
    uint64_t v13 = a2 + 40;
    uint64_t v14 = v43;
    *(void *)(a2 + 48) = v43;
    if (v14)
    {
      *((void *)v12 + 2) = v13;
      uint64_t v12 = 0;
      uint64_t v41 = &v42;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
    }
    else
    {
      *(void *)(a2 + 32) = v13;
    }
    *(_OWORD *)(a2 + 56) = v44;
    long long v44 = 0uLL;
    *(unsigned char *)(a2 + 120) = 0;
    *(void *)std::string __what_arg = &unk_1EDC827D8;
    std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v41, v12);
    MEMORY[0x192FA3C30](__what_arg);
    return;
  }
  *(void *)std::string __what_arg = 0;
  unsigned __int8 v45 = 1;
  v38[0] = 0;
  v38[1] = 0;
  uint64_t v39 = 0;
  std::vector<std::csub_match> __p = operator new(0x38uLL);
  *(_OWORD *)__int16 v33 = xmmword_18DDE9C20;
  strcpy((char *)__p, "metrics/performance/samplingPercentageCachedResponses");
  (*(void (**)(std::system_error *__return_ptr, uint64_t, void **))(*(void *)v3 + 32))(&v23, v3, &__p);
  if ((v33[15] & 0x80000000) == 0)
  {
    if (v28) {
      goto LABEL_4;
    }
LABEL_11:
    AMSCore::Unexpected<AMSCore::Error,AMSCore::Error>((uint64_t)&__p, (uint64_t)&v23);
    if (v45)
    {
      std::runtime_error::runtime_error((std::runtime_error *)__what_arg, (const std::runtime_error *)&__p);
      *(_OWORD *)&__what_arg[16] = *(_OWORD *)&v33[8];
      *(void *)std::string __what_arg = &unk_1EDC827D8;
      uint64_t v41 = v34;
      uint64_t v42 = v35;
      uint64_t v43 = v36;
      if (v36)
      {
        *((void *)v35 + 2) = &v42;
        uint64_t v34 = &v35;
        v35 = 0;
        uint64_t v36 = 0;
      }
      else
      {
        uint64_t v41 = &v42;
      }
      long long v44 = v37;
      long long v37 = 0uLL;
      unsigned __int8 v45 = 0;
      std::vector<std::csub_match> __p = &unk_1EDC827D8;
    }
    else
    {
      AMSCore::Error::operator=((uint64_t)__what_arg, (uint64_t)&__p);
      char v16 = (std::__shared_weak_count *)*((void *)&v37 + 1);
      std::vector<std::csub_match> __p = &unk_1EDC827D8;
      if (*((void *)&v37 + 1)
        && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v37 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v34, v35);
    MEMORY[0x192FA3C30](&__p);
    if (!v28) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  operator delete(__p);
  if (!v28) {
    goto LABEL_11;
  }
LABEL_4:
  if (v45)
  {
    uint64_t v4 = v23.__vftable;
  }
  else
  {
    (**(void (***)(unsigned char *))__what_arg)(__what_arg);
    uint64_t v4 = v23.__vftable;
    unsigned __int8 v45 = 1;
  }
  *(void *)std::string __what_arg = v4;
  if (!v28) {
LABEL_16:
  }
    ((void (*)(std::system_error *))v23.~system_error)(&v23);
LABEL_17:
  std::vector<std::csub_match> __p = operator new(0x30uLL);
  *(_OWORD *)__int16 v33 = xmmword_18DDE9C30;
  strcpy((char *)__p, "metrics/performance/samplingPercentageUsers");
  (*(void (**)(std::system_error *__return_ptr, uint64_t, void **))(*(void *)v3 + 32))(&v23, v3, &__p);
  if ((v33[15] & 0x80000000) != 0)
  {
    operator delete(__p);
    if (!v28) {
      goto LABEL_33;
    }
  }
  else if (!v28)
  {
LABEL_33:
    AMSCore::Unexpected<AMSCore::Error,AMSCore::Error>((uint64_t)&__p, (uint64_t)&v23);
    std::runtime_error::runtime_error((std::runtime_error *)a2, (const std::runtime_error *)&__p);
    *(_OWORD *)(a2 + 16) = *(_OWORD *)&v33[8];
    *(void *)a2 = &unk_1EDC827D8;
    uint64_t v9 = v35;
    *(void *)(a2 + 32) = v34;
    *(void *)(a2 + 40) = v9;
    uint64_t v10 = a2 + 40;
    uint64_t v11 = v36;
    *(void *)(a2 + 48) = v36;
    if (v11)
    {
      *((void *)v9 + 2) = v10;
      uint64_t v34 = &v35;
      v35 = 0;
      uint64_t v36 = 0;
      uint64_t v9 = 0;
    }
    else
    {
      *(void *)(a2 + 32) = v10;
    }
    *(_OWORD *)(a2 + 56) = v37;
    long long v37 = 0uLL;
    *(unsigned char *)(a2 + 120) = 0;
    std::vector<std::csub_match> __p = &unk_1EDC827D8;
    std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v34, v9);
    MEMORY[0x192FA3C30](&__p);
    if (v28) {
      goto LABEL_64;
    }
    goto LABEL_37;
  }
  uint64_t v6 = v23.__vftable;
  std::vector<std::csub_match> __p = operator new(0x28uLL);
  *(_OWORD *)__int16 v33 = xmmword_18DDE9BC0;
  strcpy((char *)__p, "metrics/performance/sessionDuration");
  (*(void (**)(std::system_error *__return_ptr, uint64_t, void **))(*(void *)v3 + 40))(&v23, v3, &__p);
  if ((v33[15] & 0x80000000) != 0)
  {
    operator delete(__p);
    if (!v28) {
      goto LABEL_33;
    }
  }
  else if (!v28)
  {
    goto LABEL_33;
  }
  uint64_t v7 = v23.__vftable;
  std::vector<std::csub_match> __p = operator new(0x28uLL);
  *(_OWORD *)__int16 v33 = xmmword_18DDE9AB0;
  strcpy((char *)__p, "metrics/performance/loadUrlTopic");
  (*(void (**)(std::system_error *__return_ptr, uint64_t, void **))(*(void *)v3 + 56))(&v23, v3, &__p);
  if ((v33[15] & 0x80000000) != 0) {
    operator delete(__p);
  }
  if (!v28)
  {
    if (SHIBYTE(v39) < 0)
    {
      v38[1] = (void *)17;
      uint64_t v15 = (char *)v38[0];
    }
    else
    {
      HIBYTE(v39) = 17;
      uint64_t v15 = (char *)v38;
    }
    strcpy(v15, "xp_amp_clientperf");
    if (v28) {
      goto LABEL_29;
    }
LABEL_56:
    ((void (*)(std::system_error *))v23.~system_error)(&v23);
    int v8 = v45;
    if (v45) {
      goto LABEL_31;
    }
    goto LABEL_57;
  }
  if (SHIBYTE(v39) < 0) {
    operator delete(v38[0]);
  }
  *(std::runtime_error *)std::system_error v38 = v23.std::runtime_error;
  uint64_t v39 = *(void *)&v23.__ec_.__val_;
  *((unsigned char *)&v23.__ec_.__val_ + 7) = 0;
  LOBYTE(v23.__vftable) = 0;
  if (!v28) {
    goto LABEL_56;
  }
LABEL_29:
  if (*((char *)&v23.__ec_.__val_ + 7) < 0)
  {
    operator delete(v23.__vftable);
    int v8 = v45;
    if (v45) {
      goto LABEL_31;
    }
LABEL_57:
    AMSCore::Error::Error(&v23, (const std::runtime_error *)__what_arg);
    goto LABEL_58;
  }
  int v8 = v45;
  if (!v45) {
    goto LABEL_57;
  }
LABEL_31:
  v23.__vftable = *(std::system_error_vtbl **)__what_arg;
LABEL_58:
  unsigned __int8 v28 = v8;
  *(void *)&long long v29 = v6;
  *((void *)&v29 + 1) = v7;
  long long v30 = *(_OWORD *)v38;
  uint64_t v31 = v39;
  v38[0] = 0;
  v38[1] = 0;
  uint64_t v39 = 0;
  if (v8)
  {
    *(void *)a2 = v23.__vftable;
    *(unsigned char *)(a2 + 72) = v8;
    long long v17 = v30;
    *(_OWORD *)(a2 + 80) = v29;
    *(_OWORD *)(a2 + 96) = v17;
    *(void *)(a2 + 112) = v31;
    long long v30 = 0uLL;
    uint64_t v31 = 0;
    *(unsigned char *)(a2 + 120) = 1;
    goto LABEL_64;
  }
  std::runtime_error::runtime_error((std::runtime_error *)a2, &v23);
  *(std::error_code *)(a2 + 16) = v23.__ec_;
  *(void *)a2 = &unk_1EDC827D8;
  uint64_t v18 = v25;
  *(void *)(a2 + 32) = v24;
  *(void *)(a2 + 40) = v18;
  uint64_t v19 = a2 + 40;
  uint64_t v20 = v26;
  *(void *)(a2 + 48) = v26;
  if (v20)
  {
    *(void *)(v18 + 16) = v19;
    char v24 = (unsigned int **)&v25;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
  }
  else
  {
    *(void *)(a2 + 32) = v19;
  }
  *(_OWORD *)(a2 + 56) = v27;
  long long v27 = 0uLL;
  int v21 = v28;
  *(unsigned char *)(a2 + 72) = 0;
  long long v22 = v30;
  *(_OWORD *)(a2 + 80) = v29;
  *(_OWORD *)(a2 + 96) = v22;
  *(void *)(a2 + 112) = v31;
  long long v30 = 0uLL;
  uint64_t v31 = 0;
  *(unsigned char *)(a2 + 120) = 1;
  if (v21) {
    goto LABEL_64;
  }
LABEL_37:
  ((void (*)(std::system_error *))v23.~system_error)(&v23);
LABEL_64:
  if ((SHIBYTE(v39) & 0x80000000) == 0)
  {
    if (v45) {
      return;
    }
LABEL_68:
    (**(void (***)(unsigned char *))__what_arg)(__what_arg);
    return;
  }
  operator delete(v38[0]);
  if (!v45) {
    goto LABEL_68;
  }
}

void sub_18DB82EC4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  if (a38 < 0) {
    operator delete(__p);
  }
  if (!*(unsigned char *)(v38 - 120)) {
    (**(void (***)(uint64_t))(v38 - 192))(v38 - 192);
  }
  __clang_call_terminate(a1);
}

uint64_t std::__shared_ptr_emplace<AMSCore::FinanceRequestHandler>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<AMSCore::FinanceRequestHandler>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDC83FA0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FA4080);
}

void std::__shared_ptr_emplace<AMSCore::FinanceRequestHandler>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDC83FA0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t AMSCore::ExecuteHTTPRequestTask::OptionsBuilder::OptionsBuilder(uint64_t a1, long long *a2, long long *a3)
{
  long long v4 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  long long v5 = *a3;
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)a1 = a1 + 8;
  uint64_t v8 = v4;
  *(_OWORD *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 80) = 0;
  uint64_t v6 = operator new(0x28uLL);
  v6[1] = 0;
  v6[2] = 0;
  void *v6 = &unk_1EDC83FA0;
  v6[3] = &unk_1EDC82398;
  v6[4] = 0;
  *(void *)(a1 + 88) = v6 + 3;
  *(void *)(a1 + 96) = v6;
  *(_DWORD *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 60000;
  *(unsigned char *)(a1 + 120) = 1;
  *(_DWORD *)(a1 + 128) = 65795;
  *(void *)(a1 + 136) = &unk_1EDC82AA8;
  *(void *)(a1 + 144) = AMSCore::ExecuteHTTPRequestTask::Options::getDefaultLoadURLMetricsEventConfig;
  *(void *)(a1 + 160) = a1 + 136;
  if (!v8) {
    std::terminate();
  }
  return a1;
}

void sub_18DB830F8(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  if (v3)
  {
    long long v5 = (std::__shared_weak_count *)v3;
    if (!atomic_fetch_add(v3 + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(atomic_ullong *))(*v3 + 16))(v3);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  uint64_t v6 = *(std::__shared_weak_count **)(v1 + 32);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy(v1, *(unsigned int **)(v1 + 8));
  _Unwind_Resume(a1);
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8fe180100IOZNS0_12__assignmentINS0_8__traitsIJNS_10shared_ptrIN7AMSCore22ExecuteHTTPRequestTask8IHandlerEEENS8_INSA_16AnonymousHandlerEEEEEEE16__generic_assignB8fe180100INS0_17__move_assignmentISF_LNS0_6_TraitE1EEEEEvOT_EUlRSL_OT0_E_JRNS0_6__baseILSJ_1EJSC_SE_EEEOST_EEEDcSL_DpT0_(__n128 **a1, __n128 *a2, __n128 *a3)
{
  long long v4 = *a1;
  uint64_t v5 = (*a1)[1].n128_u32[0];
  if (v5 == -1) {
    goto LABEL_9;
  }
  if (v5 != 1)
  {
    ((void (*)(char *, __n128 *))off_1EDCA6558[v5])(&v8, v4);
LABEL_9:
    __n128 result = *a3;
    *long long v4 = *a3;
    a3->n128_u64[0] = 0;
    a3->n128_u64[1] = 0;
    v4[1].n128_u32[0] = 1;
    return result;
  }
  __n128 result = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  uint64_t v7 = (std::__shared_weak_count *)a2->n128_u64[1];
  *a2 = result;
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0ELm0EEE10__dispatchB8fe180100IOZNS0_12__assignmentINS0_8__traitsIJNS_10shared_ptrIN7AMSCore22ExecuteHTTPRequestTask8IHandlerEEENS8_INSA_16AnonymousHandlerEEEEEEE16__generic_assignB8fe180100INS0_17__move_assignmentISF_LNS0_6_TraitE1EEEEEvOT_EUlRSL_OT0_E_JRNS0_6__baseILSJ_1EJSC_SE_EEEOST_EEEDcSL_DpT0_(__n128 **a1, __n128 *a2, __n128 *a3)
{
  long long v4 = *a1;
  uint64_t v5 = (*a1)[1].n128_u32[0];
  if (v5 == -1) {
    goto LABEL_9;
  }
  if (v5)
  {
    ((void (*)(char *, __n128 *))off_1EDCA6558[v5])(&v8, v4);
LABEL_9:
    __n128 result = *a3;
    *long long v4 = *a3;
    a3->n128_u64[0] = 0;
    a3->n128_u64[1] = 0;
    v4[1].n128_u32[0] = 0;
    return result;
  }
  __n128 result = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  uint64_t v7 = (std::__shared_weak_count *)a2->n128_u64[1];
  *a2 = result;
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  return result;
}

void AMSCore::ExecuteHTTPRequestTask::internal::makeOptionsBuilder(AMSCore::ExecuteHTTPRequestTask::Options *a1, long long *a2)
{
  v16[4] = *MEMORY[0x1E4F143B8];
  long long v3 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  uint64_t v5 = v6;
  memset(v6, 0, sizeof(v6));
  long long v7 = v3;
  char v8 = 0;
  char v9 = 0;
  long long v4 = operator new(0x28uLL);
  v4[1] = 0;
  v4[2] = 0;
  *long long v4 = &unk_1EDC83FA0;
  v4[3] = &unk_1EDC82398;
  v4[4] = 0;
  uint64_t v10 = v4 + 3;
  uint64_t v11 = v4;
  int v12 = 0;
  uint64_t v13 = 60000;
  char v14 = 1;
  int v15 = 65795;
  v16[0] = &unk_1EDC82AA8;
  v16[1] = AMSCore::ExecuteHTTPRequestTask::Options::getDefaultLoadURLMetricsEventConfig;
  v16[3] = v16;
  AMSCore::ExecuteHTTPRequestTask::Options::Options(a1, (const AMSCore::ExecuteHTTPRequestTask::Options *)&v5);
  AMSCore::ExecuteHTTPRequestTask::Options::~Options((AMSCore::ExecuteHTTPRequestTask::Options *)&v5);
}

void sub_18DB8349C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t AMSCore::ExecuteHTTPRequestTask::Result::Result(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  AMSCore::ExecuteHTTPRequestTask::Options::Options(a1 + 16, a3);
  uint64_t v6 = operator new(0x2A8uLL);
  v6[1] = 0;
  v6[2] = 0;
  void *v6 = &unk_1EDC83AD0;
  *(void *)(a1 + 184) = AMSCore::HTTPResponse::HTTPResponse((uint64_t)(v6 + 3), a4);
  *(void *)(a1 + 192) = v6;
  return a1;
}

void sub_18DB83560(_Unwind_Exception *a1)
{
  AMSCore::ExecuteHTTPRequestTask::Options::~Options(v2);
  long long v4 = *(std::__shared_weak_count **)(v1 + 8);
  if (v4)
  {
    if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  _Unwind_Resume(a1);
}

void AMSCore::ExecuteHTTPRequestTask::anonymous namespace'::performInternal(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v7 = (char *)operator new(0x1390uLL);
  AMSCore::EncodeHTTPRequestTask::Options::Options((uint64_t)(v7 + 3640), a2);
  long long v8 = *(_OWORD *)(a2 + 368);
  *(void *)(a2 + 368) = 0;
  *(void *)(a2 + 376) = 0;
  *(_OWORD *)(v7 + 4472) = *(_OWORD *)a3;
  *(_OWORD *)(v7 + 4008) = v8;
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  uint64_t v9 = *(void *)(a3 + 16);
  unint64_t v10 = *(void *)(a3 + 24);
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *((void *)v7 + 561) = v9;
  *((void *)v7 + 562) = v10;
  uint64_t v11 = *(void *)(a3 + 32);
  *((void *)v7 + 563) = v11;
  uint64_t v12 = *(void *)(a3 + 40);
  *((void *)v7 + 564) = v12;
  *((_DWORD *)v7 + 1130) = *(_DWORD *)(a3 + 48);
  if (v12)
  {
    unint64_t v13 = *(void *)(v11 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v13 >= v10) {
        v13 %= v10;
      }
    }
    else
    {
      v13 &= v10 - 1;
    }
    *(void *)(v9 + 8 * v13) = v7 + 4504;
    *(void *)(a3 + 32) = 0;
    *(void *)(a3 + 40) = 0;
  }
  *((_WORD *)v7 + 2264) = *(_WORD *)(a3 + 56);
  char v14 = (void *)a4[3];
  if (v14)
  {
    if (v14 == a4)
    {
      *((void *)v7 + 582) = v7 + 4632;
      (*(void (**)(void *, char *))(*a4 + 24))(a4, v7 + 4632);
    }
    else
    {
      *((void *)v7 + 582) = v14;
      a4[3] = 0;
    }
  }
  else
  {
    *((void *)v7 + 582) = 0;
  }
  atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 1u);
  v7[24] = 0;
  v7[448] = 0;
  *((void *)v7 + 57) = 0;
  *((void *)v7 + 61) = 0;
  std::shared_ptr<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise>::shared_ptr[abi:fe180100]<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise,AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise::get_return_object(void)::DetachPromise,void>(&v15, (uint64_t)(v7 + 16));
}

void sub_18DB87B08(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void *std::function<AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask ()(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount>,AMSCore::LoadURLMetricsHandler::Options &&)>::~function(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void AMSCore::ExecuteHTTPRequestTask::Context::~Context(AMSCore::ExecuteHTTPRequestTask::Context *this)
{
  uint64_t v2 = (void **)*((void *)this + 4);
  if (v2)
  {
    do
    {
      uint64_t v5 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v5;
    }
    while (v5);
  }
  long long v3 = (void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    operator delete(v3);
  }
  long long v4 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v4)
  {
    if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

void AMSCore::ExecuteHTTPRequestTask::anonymous namespace'::performInternal(unint64_t a1)
{
  uint64_t v1 = (unsigned char *)(a1 + 5000);
  unint64_t v109 = a1 + 2344;
  uint64_t v114 = (AMSCore::HTTPResponseAction *)(a1 + 1816);
  BOOL v115 = (AMSCore::HTTPResponse *)(a1 + 496);
  uint64_t v2 = (AMSCore::HTTPResponseAction *)(a1 + 2288);
  char v112 = (AMSCore::HTTPResponseAction *)(a1 + 2752);
  v106 = (AMSCore::HTTPResponse *)(a1 + 1160);
  std::regex_traits<char>::char_class_type v107 = (uint64_t *)(a1 + 4472);
  unint64_t v108 = a1 + 4600;
  unint64_t v3 = a1 + 4664;
  unint64_t v4 = a1 + 4680;
  unint64_t v5 = a1 + 4696;
  unint64_t v6 = a1 + 4712;
  unint64_t v7 = a1 + 4728;
  unint64_t v8 = a1 + 4744;
  unint64_t v9 = a1 + 4760;
  unint64_t v10 = a1 + 4776;
  unint64_t v11 = a1 + 4792;
  unint64_t v12 = a1 + 4808;
  unint64_t v13 = a1 + 4824;
  uint64_t v113 = (std::runtime_error *)(a1 + 3216);
  int v111 = (void **)(a1 + 4024);
  unint64_t v110 = a1 + 16;
  switch(*(unsigned char *)(a1 + 5000))
  {
    case 1:
      goto LABEL_90;
    case 2:
      goto LABEL_122;
    case 3:
      goto LABEL_32;
    case 4:
      goto LABEL_65;
    case 5:
      uint64_t v75 = *(void *)v4;
      if (!*(unsigned char *)(*(void *)v4 + 432)) {
        goto LABEL_230;
      }
      std::string::size_type v76 = (void *)(v75 + 8);
      int v77 = *(unsigned __int8 *)(v75 + 424);
      if (*(unsigned char *)(v75 + 424))
      {
        *(_OWORD *)(a1 + 3216) = *(_OWORD *)(v75 + 8);
        *std::string::size_type v76 = 0;
        *(void *)(v75 + 16) = 0;
        AMSCore::ExecuteHTTPRequestTask::Options::Options(a1 + 3232, v75 + 24);
        unint64_t v78 = v109;
        *(_OWORD *)(v109 + 1056) = *(_OWORD *)(v75 + 192);
        *(void *)(v75 + 192) = 0;
        *(void *)(v75 + 200) = 0;
        v79 = v113;
      }
      else
      {
        v79 = (std::runtime_error *)(a1 + 3216);
        std::__expected_base<AMSCore::HTTPResponse,AMSCore::HTTPError>::__union_t::__union_t[abi:fe180100]<AMSCore::HTTPError>(v113, (uint64_t)v76);
        unint64_t v78 = v109;
      }
      *(unsigned char *)(a1 + 3632) = v77;
      if (*(unsigned char *)(a1 + 448))
      {
        std::__expected_base<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::__repr::__destroy_union_member[abi:fe180100](a1 + 24);
        *(unsigned char *)(a1 + 448) = 0;
        int v77 = *(unsigned __int8 *)(a1 + 3632);
      }
      if (v77)
      {
        *(_OWORD *)(a1 + 24) = *(_OWORD *)(a1 + 3216);
        std::runtime_error *v79 = 0u;
        AMSCore::ExecuteHTTPRequestTask::Options::Options(a1 + 40, a1 + 3232);
        *(_OWORD *)(a1 + 208) = *(_OWORD *)(v78 + 1056);
        *(_OWORD *)(v78 + 1056) = 0u;
      }
      else
      {
        std::__expected_base<AMSCore::HTTPResponse,AMSCore::HTTPError>::__union_t::__union_t[abi:fe180100]<AMSCore::HTTPError>((std::runtime_error *)(a1 + 24), (uint64_t)v79);
      }
      *(unsigned char *)(a1 + 440) = v77;
      *(unsigned char *)(a1 + 448) = 1;
      std::__expected_base<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::__repr::__destroy_union_member[abi:fe180100]((uint64_t)v79);
      std::string::size_type v80 = *(std::__shared_weak_count **)(a1 + 4688);
      if (v80 && !atomic_fetch_add(&v80->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
        std::__shared_weak_count::__release_weak(v80);
      }
      int v81 = *(std::__shared_weak_count **)(a1 + 4864);
      if (v81 && !atomic_fetch_add(&v81->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
        std::__shared_weak_count::__release_weak(v81);
      }
      uint64_t v82 = *(void *)(a1 + 4624);
      if (v82 == v108)
      {
        (*(void (**)(unint64_t))(*(void *)v108 + 32))(v108);
        v83 = *(void ***)(a1 + 4440);
        if (!v83) {
          goto LABEL_169;
        }
      }
      else
      {
        if (v82) {
          (*(void (**)(uint64_t))(*(void *)v82 + 40))(v82);
        }
        v83 = *(void ***)(a1 + 4440);
        if (!v83)
        {
LABEL_169:
          uint64_t v84 = *(void **)(a1 + 4424);
          *(void *)(a1 + 4424) = 0;
          if (v84) {
            operator delete(v84);
          }
          v85 = *(std::__shared_weak_count **)(a1 + 4416);
          if (v85 && !atomic_fetch_add(&v85->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v85->__on_zero_shared)(v85);
            std::__shared_weak_count::__release_weak(v85);
          }
          size_t v86 = *(std::__shared_weak_count **)(a1 + 4400);
          if (v86 && !atomic_fetch_add(&v86->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
            std::__shared_weak_count::__release_weak(v86);
          }
          AMSCore::EncodeHTTPRequestTask::Options::~Options(v111);
          AMSCore::HTTPResponseAction::~HTTPResponseAction(v112);
LABEL_203:
          if (*(unsigned char *)(a1 + 2745))
          {
            AMSCore::HTTPResponseAction::~HTTPResponseAction(v2);
            if (!*(unsigned char *)(a1 + 2280)) {
              goto LABEL_212;
            }
          }
          else
          {
            (**(void (***)(AMSCore::HTTPResponseAction *))v2)(v2);
            if (!*(unsigned char *)(a1 + 2280)) {
              goto LABEL_212;
            }
          }
          if (!*(unsigned char *)(a1 + 2273))
          {
            (**(void (***)(AMSCore::HTTPResponseAction *))v114)(v114);
            std::string::size_type v97 = *(std::__shared_weak_count **)(a1 + 4880);
            if (!v97) {
              goto LABEL_216;
            }
            goto LABEL_213;
          }
          AMSCore::HTTPResponseAction::~HTTPResponseAction(v114);
LABEL_212:
          std::string::size_type v97 = *(std::__shared_weak_count **)(a1 + 4880);
          if (!v97) {
            goto LABEL_216;
          }
LABEL_213:
          if (!atomic_fetch_add(&v97->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
            std::__shared_weak_count::__release_weak(v97);
          }
LABEL_216:
          if (*(unsigned char *)(a1 + 1152))
          {
            AMSCore::HTTPResponse::~HTTPResponse(v115);
            int v98 = *(std::__shared_weak_count **)(a1 + 4928);
            if (!v98)
            {
LABEL_222:
              v99 = *(std::__shared_weak_count **)(a1 + 4960);
              if (v99 && !atomic_fetch_add(&v99->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v99->__on_zero_shared)(v99);
                std::__shared_weak_count::__release_weak(v99);
              }
              *(void *)(a1 + 496) = v110;
              *(void *)a1 = 0;
              unsigned char *v1 = 7;
              AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise::Awaiter::await_suspend((uint64_t)v115);
              return;
            }
          }
          else
          {
            (**(void (***)(AMSCore::HTTPResponse *))v115)(v115);
            int v98 = *(std::__shared_weak_count **)(a1 + 4928);
            if (!v98) {
              goto LABEL_222;
            }
          }
          if (!atomic_fetch_add(&v98->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
            std::__shared_weak_count::__release_weak(v98);
          }
          goto LABEL_222;
        }
      }
      do
      {
        std::vector<std::string>::pointer v87 = (void **)*v83;
        if (*((char *)v83 + 39) < 0) {
          operator delete(v83[2]);
        }
        operator delete(v83);
        v83 = v87;
      }
      while (v87);
      goto LABEL_169;
    case 6:
      uint64_t v88 = *(void *)v4;
      if (!*(unsigned char *)(*(void *)v4 + 208)) {
        goto LABEL_230;
      }
      *(_OWORD *)(a1 + 3216) = *(_OWORD *)(v88 + 8);
      *(void *)(v88 + 8) = 0;
      *(void *)(v88 + 16) = 0;
      AMSCore::ExecuteHTTPRequestTask::Options::Options(a1 + 3232, v88 + 24);
      *(_OWORD *)(v109 + 1056) = *(_OWORD *)(v88 + 192);
      *(void *)(v88 + 192) = 0;
      *(void *)(v88 + 200) = 0;
      if (*(unsigned char *)(a1 + 448))
      {
        std::__expected_base<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::__repr::__destroy_union_member[abi:fe180100](a1 + 24);
        *(unsigned char *)(a1 + 448) = 0;
      }
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a1 + 3216);
      v113->__vftable = 0;
      v113->__imp_.__imp_ = 0;
      AMSCore::ExecuteHTTPRequestTask::Options::Options(a1 + 40, a1 + 3232);
      *(_OWORD *)(a1 + 208) = *(_OWORD *)(v109 + 1056);
      *(void *)(v109 + 1056) = 0;
      *(void *)(v109 + 1064) = 0;
      *(unsigned char *)(a1 + 440) = 1;
      *(unsigned char *)(a1 + 448) = 1;
      AMSCore::ExecuteHTTPRequestTask::Options::~Options((AMSCore::ExecuteHTTPRequestTask::Options *)(a1 + 3232));
      int64_t v89 = *(std::__shared_weak_count **)(a1 + 3224);
      if (v89 && !atomic_fetch_add(&v89->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
        std::__shared_weak_count::__release_weak(v89);
      }
      uint64_t v90 = *(std::__shared_weak_count **)(a1 + 4688);
      if (v90 && !atomic_fetch_add(&v90->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v90->__on_zero_shared)(v90);
        std::__shared_weak_count::__release_weak(v90);
      }
      unint64_t v91 = *(std::__shared_weak_count **)(a1 + 4864);
      if (v91 && !atomic_fetch_add(&v91->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v91->__on_zero_shared)(v91);
        std::__shared_weak_count::__release_weak(v91);
      }
      long long v92 = *(void ***)(a1 + 4568);
      if (v92)
      {
        do
        {
          v96 = (void **)*v92;
          if (*((char *)v92 + 39) < 0) {
            operator delete(v92[2]);
          }
          operator delete(v92);
          long long v92 = v96;
        }
        while (v96);
      }
      std::string::size_type v93 = *(void **)(a1 + 4552);
      *(void *)(a1 + 4552) = 0;
      if (v93) {
        operator delete(v93);
      }
      uint64_t v94 = *(std::__shared_weak_count **)(a1 + 4544);
      if (v94 && !atomic_fetch_add(&v94->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v94->__on_zero_shared)(v94);
        std::__shared_weak_count::__release_weak(v94);
      }
      BOOL v95 = *(std::__shared_weak_count **)(a1 + 4944);
      if (v95 && !atomic_fetch_add(&v95->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
        std::__shared_weak_count::__release_weak(v95);
      }
      AMSCore::HTTPResponse::~HTTPResponse(v106);
      goto LABEL_203;
    default:
      unint64_t v104 = a1 + 4680;
      std::ctype_base::mask v105 = (unsigned char *)(a1 + 5000);
      uint64_t v15 = *(void *)(a1 + 4968);
      if (!*(unsigned char *)(v15 + 672)) {
        goto LABEL_230;
      }
      unint64_t v102 = a1 + 4696;
      unint64_t v103 = a1 + 4808;
      unint64_t v100 = a1 + 4728;
      unint64_t v101 = a1 + 4712;
      uint64_t v16 = (long long *)(v15 + 8);
      char v17 = *(unsigned char *)(v15 + 664);
      if (v17) {
        AMSCore::HTTPResponse::HTTPResponse((uint64_t)v115, v16);
      }
      else {
        __n128 v18 = std::__expected_base<AMSCore::HTTPResponse,AMSCore::HTTPError>::__union_t::__union_t[abi:fe180100]<AMSCore::HTTPError>((std::runtime_error *)v115, (uint64_t)v16);
      }
      *(unsigned char *)(a1 + 1152) = v17;
      uint64_t v19 = *(void *)(a1 + 4976);
      if (v19 && !atomic_fetch_add((atomic_ullong *volatile)(v19 + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        uint64_t v20 = *(std::__shared_weak_count **)(a1 + 4976);
        ((void (*)(std::__shared_weak_count *, __n128))v20->__on_zero_shared)(v20, v18);
        std::__shared_weak_count::__release_weak(v20);
      }
      int v21 = *(std::__shared_weak_count **)(a1 + 2296);
      if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *, __n128))v21->__on_zero_shared)(v21, v18);
        std::__shared_weak_count::__release_weak(v21);
      }
      long long v22 = *(std::__shared_weak_count **)(a1 + 4912);
      if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *, __n128))v22->__on_zero_shared)(v22, v18);
        std::__shared_weak_count::__release_weak(v22);
      }
      std::system_error v23 = *(std::__shared_weak_count **)(a1 + 1824);
      if (v23 && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *, __n128))v23->__on_zero_shared)(v23, v18);
        std::__shared_weak_count::__release_weak(v23);
      }
      if (!*(unsigned char *)(a1 + 1152))
      {
        uint64_t v35 = *(unsigned __int8 *)(v109 + 2185);
        if (!*(unsigned char *)(a1 + 864)) {
          *(unsigned char *)(a1 + 864) = 1;
        }
        *(void *)(a1 + 856) = v35;
        AMSCore::LoadURLMetricsHandler::OptionsBuilder::make((uint64_t)&v116, *(void *)(a1 + 4472));
        *(void *)(a1 + 4888) = *(void *)(a1 + 4952);
        uint64_t v36 = *(void *)(a1 + 4960);
        *(void *)(a1 + 4896) = v36;
        if (v36) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v36 + 8), 1uLL, memory_order_relaxed);
        }
        uint64_t v37 = *(void *)(a1 + 4656);
        if (v37)
        {
          (*(void (**)(std::runtime_error *__return_ptr))(*(void *)v37 + 48))(&v119);
          AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask::uploadMetrics();
        }
        std::__throw_bad_function_call[abi:fe180100]();
      }
      char v24 = operator new(0x2A8uLL);
      v24[1] = 0;
      void v24[2] = 0;
      *char v24 = &unk_1EDC83AD0;
      AMSCore::HTTPResponse::HTTPResponse((uint64_t)(v24 + 3), (long long *)v115);
      *(void *)(a1 + 4872) = v24 + 3;
      *(void *)(a1 + 4880) = v24;
      uint64_t v25 = *(unsigned __int8 *)(v109 + 2185);
      if (!*((unsigned char *)v24 + 544)) {
        *((unsigned char *)v24 + 544) = 1;
      }
      v24[67] = v25;
      AMSCore::ServiceProvider<AMSCore::Logger>::getDefault(&v117);
      AMSCore::Logger::log<char [39],AMSCore::HTTPResponse>(v117, (uint64_t)(v24 + 3));
      uint64_t v26 = v118;
      if (v118 && !atomic_fetch_add(&v118->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
      *(unsigned char *)(a1 + 1816) = 0;
      *(unsigned char *)(a1 + 2280) = 0;
      uint64_t v27 = *(void *)(a1 + 4472);
      unsigned __int8 v28 = (uint64_t *)(v27 + 88);
      *(void *)(a1 + 4984) = v27 + 88;
      if (*(_DWORD *)(v27 + 104))
      {
        *(void *)(a1 + 4992) = v28;
        uint64_t v1 = v105;
        if (*(_DWORD *)(v27 + 104) != 1) {
          std::terminate();
        }
        uint64_t v29 = *v28;
        *(void *)(a1 + 4760) = *(void *)(a1 + 4872);
        uint64_t v30 = *(void *)(a1 + 4880);
        *(void *)(a1 + 4768) = v30;
        if (v30)
        {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v30 + 8), 1uLL, memory_order_relaxed);
          uint64_t v27 = *v107;
        }
        *(void *)(a1 + 4776) = v27;
        uint64_t v31 = *(void *)(a1 + 4480);
        *(void *)(a1 + 4784) = v31;
        if (v31) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v31 + 8), 1uLL, memory_order_relaxed);
        }
        (*(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)v29 + 40))(v29, v9, v10);
        std::runtime_error v32 = *(std::runtime_error *)v104;
        *(void *)unint64_t v104 = 0;
        *(void *)(v104 + 8) = 0;
        *uint64_t v113 = v32;
        unint64_t v4 = v104;
        unint64_t v12 = v103;
        if (atomic_load_explicit((atomic_ullong *volatile)&v32.__vftable[20], memory_order_acquire)
          || (*std::ctype_base::mask v105 = 3, atomic_exchange((atomic_ullong *volatile)(*(void *)(a1 + 3216) + 480), a1)))
        {
LABEL_32:
          __int16 v33 = (std::runtime_error *)v4;
          if (LOBYTE(v113->__vftable[19].what))
          {
            unint64_t v34 = v12;
            AMSCore::HTTPResponseAction::HTTPResponseAction((uint64_t)v2, (uint64_t)&v113->~runtime_error_0);
            if (*(unsigned char *)(a1 + 2280))
            {
              if (*(unsigned char *)(a1 + 2273))
              {
                AMSCore::HTTPResponseAction::operator=((uint64_t)v114, (uint64_t)v2);
              }
              else
              {
                (**(void (***)(AMSCore::HTTPResponseAction *))(a1 + 1816))(v114);
                AMSCore::HTTPResponseAction::HTTPResponseAction((uint64_t)v114, (uint64_t)v2);
                *(unsigned char *)(a1 + 2273) = 1;
              }
            }
            else
            {
              AMSCore::HTTPResponseAction::HTTPResponseAction((uint64_t)v114, (uint64_t)v2);
              *(unsigned char *)(a1 + 2273) = 1;
              *(unsigned char *)(a1 + 2280) = 1;
            }
            AMSCore::HTTPResponseAction::~HTTPResponseAction(v2);
            uint64_t v38 = *(std::__shared_weak_count **)(a1 + 3224);
            if (v38 && !atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
              std::__shared_weak_count::__release_weak(v38);
            }
            uint64_t v39 = *(std::__shared_weak_count **)(a1 + 4688);
            if (v39 && !atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
              std::__shared_weak_count::__release_weak(v39);
            }
            unsigned int v40 = *(std::__shared_weak_count **)(a1 + 4784);
            if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
              std::__shared_weak_count::__release_weak(v40);
            }
            uint64_t v41 = *(std::__shared_weak_count **)(a1 + 4768);
            if (v41 && !atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
              std::__shared_weak_count::__release_weak(v41);
            }
            if (!*(unsigned char *)(a1 + 2280) || !*(unsigned char *)(a1 + 2273) || *(unsigned char *)(a1 + 2272) != 1) {
              goto LABEL_143;
            }
            uint64_t v42 = **(void **)(a1 + 4992);
            *(void *)(a1 + 4808) = *(void *)(a1 + 4872);
            uint64_t v43 = *(void *)(a1 + 4880);
            *(void *)(a1 + 4816) = v43;
            if (v43) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v43 + 8), 1uLL, memory_order_relaxed);
            }
            *(void *)(a1 + 4824) = *(void *)(a1 + 4472);
            uint64_t v44 = *(void *)(a1 + 4480);
            *(void *)(a1 + 4832) = v44;
            if (v44) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v44 + 8), 1uLL, memory_order_relaxed);
            }
            (*(void (**)(uint64_t, unint64_t, unint64_t))(*(void *)v42 + 32))(v42, v34, v13);
            std::runtime_error v45 = *v33;
            v33->__vftable = 0;
            v33->__imp_.__imp_ = 0;
            *uint64_t v113 = v45;
            if (!atomic_load_explicit((atomic_ullong *volatile)&v45.__vftable[20], memory_order_acquire))
            {
              unsigned char *v1 = 4;
              if (!atomic_exchange((atomic_ullong *volatile)(*(void *)(a1 + 3216) + 480), a1)) {
                return;
              }
            }
LABEL_65:
            if (LOBYTE(v113->__vftable[19].what))
            {
              AMSCore::HTTPResponseAction::HTTPResponseAction((uint64_t)v2, (uint64_t)&v113->~runtime_error_0);
              if (*(unsigned char *)(a1 + 2280))
              {
                if (*(unsigned char *)(a1 + 2273))
                {
                  AMSCore::HTTPResponseAction::operator=((uint64_t)v114, (uint64_t)v2);
                }
                else
                {
                  (**(void (***)(AMSCore::HTTPResponseAction *))(a1 + 1816))(v114);
                  AMSCore::HTTPResponseAction::HTTPResponseAction((uint64_t)v114, (uint64_t)v2);
                  *(unsigned char *)(a1 + 2273) = 1;
                }
              }
              else
              {
                AMSCore::HTTPResponseAction::HTTPResponseAction((uint64_t)v114, (uint64_t)v2);
                *(unsigned char *)(a1 + 2273) = 1;
                *(unsigned char *)(a1 + 2280) = 1;
              }
              AMSCore::HTTPResponseAction::~HTTPResponseAction(v2);
              std::error_code v46 = *(std::__shared_weak_count **)(a1 + 3224);
              if (v46 && !atomic_fetch_add(&v46->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
                std::__shared_weak_count::__release_weak(v46);
              }
              v47 = *(std::__shared_weak_count **)(a1 + 4688);
              if (v47 && !atomic_fetch_add(&v47->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
                std::__shared_weak_count::__release_weak(v47);
              }
              uint64_t v48 = *(std::__shared_weak_count **)(a1 + 4832);
              if (v48 && !atomic_fetch_add(&v48->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
                std::__shared_weak_count::__release_weak(v48);
              }
              char v49 = *(std::__shared_weak_count **)(a1 + 4816);
              if (!v49) {
                goto LABEL_143;
              }
LABEL_141:
              if (!atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
                std::__shared_weak_count::__release_weak(v49);
              }
LABEL_143:
              if (*(unsigned char *)(a1 + 1152))
              {
                AMSCore::HTTPResponse::operator=((uint64_t)v115, *(void *)(a1 + 4872));
                *(void *)(a1 + 4840) = *(void *)(a1 + 4952);
                uint64_t v73 = *(void *)(a1 + 4960);
                *(void *)(a1 + 4848) = v73;
                if (v73) {
                  atomic_fetch_add_explicit((atomic_ullong *volatile)(v73 + 8), 1uLL, memory_order_relaxed);
                }
                AMSCore::LoadURLMetricsHandler::OptionsBuilder::make((uint64_t)&v117, *v107);
                uint64_t v74 = *(void *)(a1 + 4656);
                if (v74)
                {
                  (*(void (**)(std::runtime_error *__return_ptr))(*(void *)v74 + 48))(&v119);
                  AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask::uploadMetrics();
                }
                std::__throw_bad_function_call[abi:fe180100]();
              }
              goto LABEL_230;
            }
          }
          goto LABEL_230;
        }
      }
      else
      {
        uint64_t v50 = *v28;
        *(void *)(a1 + 4792) = *(void *)(a1 + 4872);
        uint64_t v51 = *(void *)(a1 + 4880);
        *(void *)(a1 + 4800) = v51;
        uint64_t v1 = v105;
        if (v51) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v51 + 8), 1uLL, memory_order_relaxed);
        }
        *(void *)(a1 + 4744) = *(void *)(a1 + 4952);
        uint64_t v52 = *(void *)(a1 + 4960);
        *(void *)(a1 + 4752) = v52;
        if (v52) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v52 + 8), 1uLL, memory_order_relaxed);
        }
        *(void *)(a1 + 4664) = *(void *)(a1 + 4472);
        uint64_t v53 = *(void *)(a1 + 4480);
        *(void *)(a1 + 4672) = v53;
        if (v53) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v53 + 8), 1uLL, memory_order_relaxed);
        }
        (*(void (**)(uint64_t, unint64_t, unint64_t, unint64_t))(*(void *)v50 + 40))(v50, v11, v8, v3);
        std::runtime_error v54 = *v113;
        v113->__vftable = 0;
        v113->__imp_.__imp_ = 0;
        unint64_t v4 = v104;
        *(std::runtime_error *)unint64_t v104 = v54;
        unint64_t v6 = v101;
        unint64_t v5 = v102;
        unint64_t v7 = v100;
        if (atomic_load_explicit((atomic_ullong *volatile)&v54.__vftable[20], memory_order_acquire)
          || (*std::ctype_base::mask v105 = 1, atomic_exchange((atomic_ullong *volatile)(*(void *)(a1 + 4680) + 480), a1)))
        {
LABEL_90:
          char v55 = (std::runtime_error *)v4;
          if (*(unsigned char *)(*(void *)v4 + 472))
          {
            unint64_t v56 = v7;
            unint64_t v57 = v6;
            unint64_t v58 = v5;
            AMSCore::HTTPResponseAction::HTTPResponseAction((uint64_t)v2, *(void *)v4 + 8);
            if (*(unsigned char *)(a1 + 2280))
            {
              if (*(unsigned char *)(a1 + 2273))
              {
                AMSCore::HTTPResponseAction::operator=((uint64_t)v114, (uint64_t)v2);
              }
              else
              {
                (**(void (***)(AMSCore::HTTPResponseAction *))(a1 + 1816))(v114);
                AMSCore::HTTPResponseAction::HTTPResponseAction((uint64_t)v114, (uint64_t)v2);
                *(unsigned char *)(a1 + 2273) = 1;
              }
            }
            else
            {
              AMSCore::HTTPResponseAction::HTTPResponseAction((uint64_t)v114, (uint64_t)v2);
              *(unsigned char *)(a1 + 2273) = 1;
              *(unsigned char *)(a1 + 2280) = 1;
            }
            AMSCore::HTTPResponseAction::~HTTPResponseAction(v2);
            int v59 = *(std::__shared_weak_count **)(a1 + 4688);
            if (v59 && !atomic_fetch_add(&v59->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
              std::__shared_weak_count::__release_weak(v59);
            }
            uint64_t v60 = *(std::__shared_weak_count **)(a1 + 3224);
            if (v60 && !atomic_fetch_add(&v60->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
              std::__shared_weak_count::__release_weak(v60);
            }
            long long v61 = *(std::__shared_weak_count **)(a1 + 4672);
            if (v61 && !atomic_fetch_add(&v61->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
              std::__shared_weak_count::__release_weak(v61);
            }
            uint64_t v62 = *(std::__shared_weak_count **)(a1 + 4752);
            if (v62 && !atomic_fetch_add(&v62->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
              std::__shared_weak_count::__release_weak(v62);
            }
            char v63 = *(std::__shared_weak_count **)(a1 + 4800);
            if (v63 && !atomic_fetch_add(&v63->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
              std::__shared_weak_count::__release_weak(v63);
            }
            if (!*(unsigned char *)(a1 + 2280) || !*(unsigned char *)(a1 + 2273) || *(unsigned char *)(a1 + 2272) != 1) {
              goto LABEL_143;
            }
            uint64_t v64 = **(void **)(a1 + 4984);
            *(void *)(a1 + 4696) = *(void *)(a1 + 4872);
            uint64_t v65 = *(void *)(a1 + 4880);
            *(void *)(a1 + 4704) = v65;
            if (v65) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v65 + 8), 1uLL, memory_order_relaxed);
            }
            *(void *)(a1 + 4712) = *(void *)(a1 + 4952);
            uint64_t v66 = *(void *)(a1 + 4960);
            *(void *)(a1 + 4720) = v66;
            if (v66) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v66 + 8), 1uLL, memory_order_relaxed);
            }
            *(void *)(a1 + 4728) = *(void *)(a1 + 4472);
            uint64_t v67 = *(void *)(a1 + 4480);
            *(void *)(a1 + 4736) = v67;
            if (v67) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v67 + 8), 1uLL, memory_order_relaxed);
            }
            (*(void (**)(uint64_t, unint64_t, unint64_t, unint64_t))(*(void *)v64 + 32))(v64, v58, v57, v56);
            std::runtime_error v68 = *v55;
            v55->__vftable = 0;
            v55->__imp_.__imp_ = 0;
            *uint64_t v113 = v68;
            if (!atomic_load_explicit((atomic_ullong *volatile)&v68.__vftable[20], memory_order_acquire))
            {
              unsigned char *v1 = 2;
              if (!atomic_exchange((atomic_ullong *volatile)(*(void *)(a1 + 3216) + 480), a1)) {
                return;
              }
            }
LABEL_122:
            if (LOBYTE(v113->__vftable[19].what))
            {
              AMSCore::HTTPResponseAction::HTTPResponseAction((uint64_t)v2, (uint64_t)&v113->~runtime_error_0);
              if (*(unsigned char *)(a1 + 2280))
              {
                if (*(unsigned char *)(a1 + 2273))
                {
                  AMSCore::HTTPResponseAction::operator=((uint64_t)v114, (uint64_t)v2);
                }
                else
                {
                  (**(void (***)(AMSCore::HTTPResponseAction *))(a1 + 1816))(v114);
                  AMSCore::HTTPResponseAction::HTTPResponseAction((uint64_t)v114, (uint64_t)v2);
                  *(unsigned char *)(a1 + 2273) = 1;
                }
              }
              else
              {
                AMSCore::HTTPResponseAction::HTTPResponseAction((uint64_t)v114, (uint64_t)v2);
                *(unsigned char *)(a1 + 2273) = 1;
                *(unsigned char *)(a1 + 2280) = 1;
              }
              AMSCore::HTTPResponseAction::~HTTPResponseAction(v2);
              int v69 = *(std::__shared_weak_count **)(a1 + 3224);
              if (v69 && !atomic_fetch_add(&v69->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
                std::__shared_weak_count::__release_weak(v69);
              }
              std::vector<std::string>::pointer v70 = *(std::__shared_weak_count **)(a1 + 4688);
              if (v70 && !atomic_fetch_add(&v70->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
                std::__shared_weak_count::__release_weak(v70);
              }
              uint64_t v71 = *(std::__shared_weak_count **)(a1 + 4736);
              if (v71 && !atomic_fetch_add(&v71->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
                std::__shared_weak_count::__release_weak(v71);
              }
              int64_t v72 = *(std::__shared_weak_count **)(a1 + 4720);
              if (v72 && !atomic_fetch_add(&v72->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
                std::__shared_weak_count::__release_weak(v72);
              }
              char v49 = *(std::__shared_weak_count **)(a1 + 4704);
              if (!v49) {
                goto LABEL_143;
              }
              goto LABEL_141;
            }
          }
LABEL_230:
          __break(1u);
        }
      }
      return;
  }
}

void sub_18DB8A0C0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,AMSCore::HTTPError *a30,AMSCore::EncodeHTTPRequestTask::Result *a31,AMSCore::HTTPResponseAction *a32,uint64_t a33,AMSCore::HTTPResponseAction *a34,AMSCore::HTTPResponse *a35)
{
  std::shared_ptr<AMSCore::AppleSchedulingProvider>::~shared_ptr[abi:fe180100](v35);
  std::shared_ptr<AMSCore::AppleSchedulingProvider>::~shared_ptr[abi:fe180100](v37);
  std::shared_ptr<AMSCore::AppleSchedulingProvider>::~shared_ptr[abi:fe180100](v36);
  std::optional<std::expected<AMSCore::HTTPResponseAction,AMSCore::Error>>::~optional(a34);
  std::shared_ptr<AMSCore::AppleSchedulingProvider>::~shared_ptr[abi:fe180100](a16);
  std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError>::~expected[abi:fe180100](a35);
  std::shared_ptr<AMSCore::AppleSchedulingProvider>::~shared_ptr[abi:fe180100](a18);
  std::shared_ptr<AMSCore::AppleSchedulingProvider>::~shared_ptr[abi:fe180100](a17);
  __cxa_begin_catch(a1);
  AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise::unhandled_exception(a30);
}

void sub_18DB8A2B4()
{
}

void sub_18DB8A2C0(_Unwind_Exception *a1)
{
  void *v1 = 0;
  *uint64_t v2 = 7;
  _Unwind_Resume(a1);
}

void AMSCore::ExecuteHTTPRequestTask::anonymous namespace'::performInternal(uint64_t a1)
{
  uint64_t v1 = (AMSCore::HTTPResponse *)(a1 + 496);
  uint64_t v2 = (AMSCore::HTTPResponse *)(a1 + 1160);
  unint64_t v3 = (AMSCore::HTTPResponseAction *)(a1 + 1816);
  unint64_t v4 = (AMSCore::HTTPResponseAction *)(a1 + 2288);
  unint64_t v5 = (AMSCore::HTTPResponseAction *)(a1 + 2752);
  unint64_t v6 = (void **)(a1 + 4024);
  uint64_t v7 = a1 + 4600;
  uint64_t v8 = a1 + 4632;
  switch(*(unsigned char *)(a1 + 5000))
  {
    case 1:
      uint64_t v16 = *(std::__shared_weak_count **)(a1 + 4688);
      if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
      char v17 = *(std::__shared_weak_count **)(a1 + 3224);
      if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
      __n128 v18 = *(std::__shared_weak_count **)(a1 + 4672);
      if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
      uint64_t v19 = *(std::__shared_weak_count **)(a1 + 4752);
      if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
      uint64_t v20 = *(std::__shared_weak_count **)(a1 + 4800);
      if (v20) {
        goto LABEL_64;
      }
      goto LABEL_93;
    case 2:
      int v21 = *(std::__shared_weak_count **)(a1 + 3224);
      if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
      long long v22 = *(std::__shared_weak_count **)(a1 + 4688);
      if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
      std::system_error v23 = *(std::__shared_weak_count **)(a1 + 4736);
      if (v23 && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
      char v24 = *(std::__shared_weak_count **)(a1 + 4720);
      if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
      uint64_t v20 = *(std::__shared_weak_count **)(a1 + 4704);
      if (!v20) {
        goto LABEL_93;
      }
      goto LABEL_64;
    case 3:
      uint64_t v25 = *(std::__shared_weak_count **)(a1 + 3224);
      if (v25 && !atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
      uint64_t v26 = *(std::__shared_weak_count **)(a1 + 4688);
      if (v26 && !atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
      uint64_t v27 = *(std::__shared_weak_count **)(a1 + 4784);
      if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
      uint64_t v20 = *(std::__shared_weak_count **)(a1 + 4768);
      if (!v20) {
        goto LABEL_93;
      }
      goto LABEL_64;
    case 4:
      unsigned __int8 v28 = *(std::__shared_weak_count **)(a1 + 3224);
      if (v28 && !atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
      uint64_t v29 = *(std::__shared_weak_count **)(a1 + 4688);
      if (v29 && !atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
      uint64_t v30 = *(std::__shared_weak_count **)(a1 + 4832);
      if (v30 && !atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
        std::__shared_weak_count::__release_weak(v30);
      }
      uint64_t v20 = *(std::__shared_weak_count **)(a1 + 4816);
      if (!v20) {
        goto LABEL_93;
      }
LABEL_64:
      if (atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_93;
      }
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
      if (!*(unsigned char *)(a1 + 2280)) {
        goto LABEL_100;
      }
      goto LABEL_94;
    case 5:
      uint64_t v31 = *(std::__shared_weak_count **)(a1 + 4688);
      if (v31 && !atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
      std::runtime_error v32 = *(std::__shared_weak_count **)(a1 + 4864);
      if (v32 && !atomic_fetch_add(&v32->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
      uint64_t v33 = *(void *)(a1 + 4624);
      if (v33 == v7)
      {
        (*(void (**)(uint64_t))(*(void *)v7 + 32))(v7);
      }
      else if (v33)
      {
        (*(void (**)(uint64_t))(*(void *)v33 + 40))(v33);
      }
      uint64_t v50 = *(void ***)(a1 + 4440);
      if (v50)
      {
        do
        {
          std::runtime_error v54 = (void **)*v50;
          if (*((char *)v50 + 39) < 0) {
            operator delete(v50[2]);
          }
          operator delete(v50);
          uint64_t v50 = v54;
        }
        while (v54);
      }
      uint64_t v51 = *(void **)(a1 + 4424);
      *(void *)(a1 + 4424) = 0;
      if (v51) {
        operator delete(v51);
      }
      uint64_t v52 = *(std::__shared_weak_count **)(a1 + 4416);
      if (v52 && !atomic_fetch_add(&v52->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
        std::__shared_weak_count::__release_weak(v52);
      }
      uint64_t v53 = *(std::__shared_weak_count **)(a1 + 4400);
      if (v53 && !atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
        std::__shared_weak_count::__release_weak(v53);
      }
      AMSCore::EncodeHTTPRequestTask::Options::~Options(v6);
      AMSCore::HTTPResponseAction::~HTTPResponseAction(v5);
      if (!*(unsigned char *)(a1 + 2745)) {
        goto LABEL_153;
      }
      goto LABEL_92;
    case 6:
      unint64_t v34 = *(std::__shared_weak_count **)(a1 + 4688);
      if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
      }
      uint64_t v35 = *(std::__shared_weak_count **)(a1 + 4864);
      if (v35 && !atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
      uint64_t v36 = *(void ***)(a1 + 4568);
      if (v36)
      {
        do
        {
          unsigned int v40 = (void **)*v36;
          if (*((char *)v36 + 39) < 0) {
            operator delete(v36[2]);
          }
          operator delete(v36);
          uint64_t v36 = v40;
        }
        while (v40);
      }
      uint64_t v37 = *(void **)(a1 + 4552);
      *(void *)(a1 + 4552) = 0;
      if (v37) {
        operator delete(v37);
      }
      uint64_t v38 = *(std::__shared_weak_count **)(a1 + 4544);
      if (v38 && !atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
      uint64_t v39 = *(std::__shared_weak_count **)(a1 + 4944);
      if (v39 && !atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
        std::__shared_weak_count::__release_weak(v39);
      }
      AMSCore::HTTPResponse::~HTTPResponse(v2);
      if (!*(unsigned char *)(a1 + 2745))
      {
LABEL_153:
        (**(void (***)(AMSCore::HTTPResponseAction *))v4)(v4);
        if (!*(unsigned char *)(a1 + 2280)) {
          goto LABEL_100;
        }
        goto LABEL_94;
      }
LABEL_92:
      AMSCore::HTTPResponseAction::~HTTPResponseAction(v4);
LABEL_93:
      if (*(unsigned char *)(a1 + 2280))
      {
LABEL_94:
        if (*(unsigned char *)(a1 + 2273)) {
          AMSCore::HTTPResponseAction::~HTTPResponseAction(v3);
        }
        else {
          (**(void (***)(AMSCore::HTTPResponseAction *))v3)(v3);
        }
      }
LABEL_100:
      uint64_t v41 = *(std::__shared_weak_count **)(a1 + 4880);
      if (v41 && !atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
        std::__shared_weak_count::__release_weak(v41);
        if (*(unsigned char *)(a1 + 1152)) {
          goto LABEL_103;
        }
LABEL_107:
        (**(void (***)(AMSCore::HTTPResponse *))v1)(v1);
        uint64_t v15 = *(std::__shared_weak_count **)(a1 + 4928);
        if (!v15) {
          goto LABEL_110;
        }
        goto LABEL_108;
      }
      if (!*(unsigned char *)(a1 + 1152)) {
        goto LABEL_107;
      }
LABEL_103:
      AMSCore::HTTPResponse::~HTTPResponse(v1);
LABEL_104:
      uint64_t v15 = *(std::__shared_weak_count **)(a1 + 4928);
      if (v15)
      {
LABEL_108:
        if (!atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
LABEL_110:
      uint64_t v42 = *(std::__shared_weak_count **)(a1 + 4960);
      if (v42 && !atomic_fetch_add(&v42->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
LABEL_113:
      uint64_t v43 = *(void *)(a1 + 488);
      if (v43 == a1 + 464)
      {
        (*(void (**)(uint64_t))(*(void *)(a1 + 464) + 32))(a1 + 464);
        if (!*(unsigned char *)(a1 + 448)) {
          goto LABEL_120;
        }
        goto LABEL_119;
      }
      if (v43) {
        (*(void (**)(uint64_t))(*(void *)v43 + 40))(v43);
      }
      if (*(unsigned char *)(a1 + 448)) {
LABEL_119:
      }
        std::__expected_base<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::__repr::__destroy_union_member[abi:fe180100](a1 + 24);
LABEL_120:
      if (atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 0xFFFFFFFF) == 1) {
        MEMORY[0x192FA3E80](AMSCore::TaskCounter::getCount(void)::count);
      }
      uint64_t v44 = *(void *)(a1 + 4656);
      if (v44 == v8)
      {
        (*(void (**)(uint64_t))(*(void *)v8 + 32))(v8);
        std::runtime_error v45 = *(void ***)(a1 + 4504);
        if (!v45) {
          goto LABEL_128;
        }
        goto LABEL_140;
      }
      if (v44) {
        (*(void (**)(uint64_t))(*(void *)v44 + 40))(v44);
      }
      std::runtime_error v45 = *(void ***)(a1 + 4504);
      if (v45)
      {
        do
        {
LABEL_140:
          char v49 = (void **)*v45;
          if (*((char *)v45 + 39) < 0) {
            operator delete(v45[2]);
          }
          operator delete(v45);
          std::runtime_error v45 = v49;
        }
        while (v49);
      }
LABEL_128:
      std::error_code v46 = *(void **)(a1 + 4488);
      *(void *)(a1 + 4488) = 0;
      if (v46) {
        operator delete(v46);
      }
      v47 = *(std::__shared_weak_count **)(a1 + 4480);
      if (v47 && !atomic_fetch_add(&v47->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
        std::__shared_weak_count::__release_weak(v47);
      }
      uint64_t v48 = *(std::__shared_weak_count **)(a1 + 4016);
      if (v48 && !atomic_fetch_add(&v48->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
        std::__shared_weak_count::__release_weak(v48);
      }
      AMSCore::EncodeHTTPRequestTask::Options::~Options((void **)(a1 + 3640));
      operator delete((void *)a1);
      return;
    case 7:
      goto LABEL_113;
    default:
      uint64_t v10 = *(void *)(a1 + 4976);
      if (v10 && !atomic_fetch_add((atomic_ullong *volatile)(v10 + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        unint64_t v11 = *(std::__shared_weak_count **)(a1 + 4976);
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
      unint64_t v12 = *(std::__shared_weak_count **)(a1 + 2296);
      if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
      unint64_t v13 = *(std::__shared_weak_count **)(a1 + 4912);
      if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
      char v14 = *(std::__shared_weak_count **)(a1 + 1824);
      if (!v14 || atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_104;
      }
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
      uint64_t v15 = *(std::__shared_weak_count **)(a1 + 4928);
      if (!v15) {
        goto LABEL_110;
      }
      goto LABEL_108;
  }
}

void std::shared_ptr<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise>::shared_ptr[abi:fe180100]<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise,AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise::get_return_object(void)::DetachPromise,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_18DB8B084(void *a1)
{
  __cxa_begin_catch(a1);
  if (atomic_exchange((atomic_ullong *volatile)(v1 + 440), 2uLL)) {
    (*(void (**)(uint64_t))(v1 - 8))(v1 - 16);
  }
  __cxa_rethrow();
}

void sub_18DB8B0B0(_Unwind_Exception *a1)
{
}

uint64_t AMSCore::Unexpected<AMSCore::Error,AMSCore::BagErrorCode,char const(&)[33]>(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = a2;
  AMSCore::StringUtils::join<char [33]>(&__what_arg, "Trusted domains were not loaded.");
  *(void *)&v14.__val_ = v3;
  v14.__cat_ = (const std::error_category *)&AMSCore::Error::Category::bag(void)::instance;
  std::system_error::system_error(&v8, v14, &__what_arg);
  if (SHIBYTE(__what_arg.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__what_arg.__r_.__value_.__l.__data_);
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  v8.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
  unint64_t v9 = &v10;
  long long v12 = 0uLL;
  std::runtime_error::runtime_error((std::runtime_error *)a1, &v8);
  *(std::error_code *)(a1 + 16) = v8.__ec_;
  *(void *)a1 = &unk_1EDC827D8;
  uint64_t v4 = v10;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = a1 + 40;
  uint64_t v6 = v11;
  *(void *)(a1 + 48) = v11;
  if (v6)
  {
    *(void *)(v4 + 16) = v5;
    uint64_t v4 = 0;
    unint64_t v9 = &v10;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    *(void *)(a1 + 32) = v5;
  }
  *(_OWORD *)(a1 + 56) = v12;
  long long v12 = 0uLL;
  v8.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
  std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v9, (unsigned int *)v4);
  return MEMORY[0x192FA3C30](&v8);
}

void sub_18DB8B1FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AMSCore::Logger::log<char [34],AMSCore::HTTPError>(uint64_t result, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)(result + 8) <= 4u)
  {
    uint64_t v3 = result;
    std::ostringstream::basic_ostringstream[abi:fe180100]((uint64_t)v8);
    uint64_t v4 = *(void *)(v8[0] - 24);
    {
    }
    std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v8, (uint64_t)"The HTTP request failed. error = ", 33);
    AMSCore::operator<<(v8, a2);
    uint64_t v5 = v8[6];
    uint64_t v6 = (char *)v8 + *(void *)(v8[0] - 24);
    if ((v6[32] & 5) != 0)
    {
      uint64_t v7 = -1;
    }
    else
    {
      (*(void (**)(std::chrono::duration<long long, std::ratio<1, 1000000>>::rep *__return_ptr))(**((void **)v6 + 5) + 32))(&rep);
      uint64_t v7 = v15;
    }
    std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
    char v12 = 4;
    uint64_t v13 = v5;
    uint64_t v14 = v7;
    (*(void (**)(void, const char *, uint64_t, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep *))(**(void **)(v3 + 16) + 16))(*(void *)(v3 + 16), "networking", 10, &rep);
    v8[0] = *MEMORY[0x1E4FBA418];
    *(void *)((char *)v8 + *(void *)(v8[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
    v8[1] = MEMORY[0x1E4FBA470] + 16;
    if (v9 < 0) {
      operator delete((void *)v8[9]);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    return MEMORY[0x192FA3FD0](&v10);
  }
  return result;
}

void sub_18DB8B4BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void AMSCore::Unexpected<AMSCore::HTTPError,AMSCore::HTTPError&>(std::runtime_error *a1, const std::runtime_error *a2)
{
  AMSCore::Error::Error(v4, a2);
  v4[0].__vftable = (std::runtime_error_vtbl *)&unk_1EDC828C8;
  AMSCore::HTTPTransactionMetrics::HTTPTransactionMetrics(v5, (const AMSCore::HTTPTransactionMetrics *)&a2[4].__imp_);
  std::__expected_base<AMSCore::HTTPResponse,AMSCore::HTTPError>::__union_t::__union_t[abi:fe180100]<AMSCore::HTTPError>(a1, (uint64_t)v4);
  AMSCore::HTTPError::~HTTPError((AMSCore::HTTPError *)v4);
}

void sub_18DB8B56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned int *a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  a9 = &unk_1EDC827D8;
  __n128 v18 = a17;
  if (a17)
  {
    if (!atomic_fetch_add(&a17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&a13, a14);
  MEMORY[0x192FA3C30](&a9);
  _Unwind_Resume(a1);
}

uint64_t AMSCore::Logger::log<char [39],AMSCore::HTTPResponse>(uint64_t result, uint64_t a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)(result + 8) <= 2u)
  {
    uint64_t v3 = result;
    std::ostringstream::basic_ostringstream[abi:fe180100]((uint64_t)v36);
    uint64_t v4 = *(void *)(v36[0] - 24);
    {
    }
    std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v36, (uint64_t)"Received an HTTP response. response = ", 38);
    v46.__r_.__value_.__s.__data_[0] = 123;
    uint64_t v5 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v36, (uint64_t)&v46, 1);
    std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v5, (uint64_t)"\"status\": ", 10);
    uint64_t v6 = (void *)std::ostream::operator<<();
    v46.__r_.__value_.__s.__data_[0] = 44;
    uint64_t v7 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v6, (uint64_t)&v46, 1);
    std::system_error v8 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v7, (uint64_t)"\"statusText\": \"\",", 17);
    char v9 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v8, (uint64_t)"\"headersSize\": -1,", 18);
    uint64_t v10 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v9, (uint64_t)"\"bodySize\": -1,", 15);
    uint64_t v11 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v10, (uint64_t)"\"headers\": ", 11);
    AMSCore::operator<<(v11, a2 + 160);
    uint64_t v12 = *(void *)(v36[0] - 24);
    {
    }
    {
      uint64_t v13 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v36, (uint64_t)",\"content\":{", 12);
      uint64_t v14 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v13, (uint64_t)"\"size\": -1,", 11);
      uint64_t v15 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v14, (uint64_t)"\"mimeType\": \"\",", 15);
      uint64_t v16 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v15, (uint64_t)"\"comment\": \"Response body redacted.\"", 36);
      std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v16, (uint64_t)"}", 1);
    }
    else
    {
      char v40 = 12;
      strcpy((char *)__p, "Content-Type");
      AMSCore::IHTTPHeaderMap::getSingleValueOrNone(&v41, (void *)(a2 + 160), (char *)__p);
      int v44 = 0;
      if (v42)
      {
        std::string v46 = v41;
        memset(&v41, 0, sizeof(v41));
        LODWORD(v47) = 5;
        AMSCore::Any::operator=((uint64_t)v43, (uint64_t)&v46);
        if (v47 != -1) {
          ((void (*)(char *, std::string *))off_1EDCA6378[v47])(&v45, &v46);
        }
      }
      if (v40 < 0) {
        operator delete(__p[0]);
      }
      char v17 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v36, (uint64_t)",\"content\":{", 12);
      std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v17, (uint64_t)"\"size\":", 7);
      __n128 v18 = (void *)std::ostream::operator<<();
      v46.__r_.__value_.__s.__data_[0] = 44;
      uint64_t v19 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v18, (uint64_t)&v46, 1);
      uint64_t v20 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v19, (uint64_t)"\"mimeType\":", 11);
      v46.__r_.__value_.__s.__data_[0] = 44;
      long long v22 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v21, (uint64_t)&v46, 1);
      std::system_error v23 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v22, (uint64_t)"\"text\":\"", 8);
      int v24 = *(char *)(a2 + 223);
      if (v24 >= 0) {
        uint64_t v25 = a2 + 200;
      }
      else {
        uint64_t v25 = *(void *)(a2 + 200);
      }
      if (v24 >= 0) {
        uint64_t v26 = *(unsigned __int8 *)(a2 + 223);
      }
      else {
        uint64_t v26 = *(void *)(a2 + 208);
      }
      AMSCore::Base64::encode(v25, v26, &v46);
      if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v27 = &v46;
      }
      else {
        uint64_t v27 = (std::string *)v46.__r_.__value_.__r.__words[0];
      }
      if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v46.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v46.__r_.__value_.__l.__size_;
      }
      uint64_t v29 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v23, (uint64_t)v27, size);
      LOBYTE(__p[0]) = 34;
      uint64_t v30 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v29, (uint64_t)__p, 1);
      LOBYTE(__p[0]) = 44;
      uint64_t v31 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v30, (uint64_t)__p, 1);
      std::runtime_error v32 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v31, (uint64_t)"\"encoding\": \"base64\"", 20);
      LOBYTE(__p[0]) = 125;
      std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v32, (uint64_t)__p, 1);
      if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v46.__r_.__value_.__l.__data_);
      }
      if (v44 != -1) {
        ((void (*)(std::string *, unsigned __int8 *))off_1EDCA6378[v44])(&v46, v43);
      }
    }
    v46.__r_.__value_.__s.__data_[0] = 125;
    std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v36, (uint64_t)&v46, 1);
    std::string::size_type v33 = v36[6];
    unint64_t v34 = (char *)v36 + *(void *)(v36[0] - 24);
    if ((v34[32] & 5) != 0)
    {
      uint64_t v35 = -1;
    }
    else
    {
      (*(void (**)(std::string *__return_ptr))(**((void **)v34 + 5) + 32))(&v46);
      uint64_t v35 = v48;
    }
    v46.__r_.__value_.__l.__data_ = (std::string::pointer)std::chrono::system_clock::now().__d_.__rep_;
    v46.__r_.__value_.__s.__data_[8] = 2;
    v46.__r_.__value_.__r.__words[2] = v33;
    uint64_t v47 = v35;
    (*(void (**)(void, const char *, uint64_t, std::string *))(**(void **)(v3 + 16) + 16))(*(void *)(v3 + 16), "networking", 10, &v46);
    v36[0] = *MEMORY[0x1E4FBA418];
    *(void *)((char *)v36 + *(void *)(v36[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
    v36[1] = MEMORY[0x1E4FBA470] + 16;
    if (v37 < 0) {
      operator delete((void *)v36[9]);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    return MEMORY[0x192FA3FD0](&v38);
  }
  return result;
}

void sub_18DB8BBEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t std::optional<std::expected<AMSCore::HTTPResponseAction,AMSCore::Error>>::operator=[abi:fe180100]<AMSCore::HTTPResponseAction,void>(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 464))
  {
    if (*(unsigned char *)(a1 + 457))
    {
      AMSCore::HTTPResponseAction::operator=(a1, a2);
    }
    else
    {
      (**(void (***)(uint64_t))a1)(a1);
      AMSCore::HTTPResponseAction::HTTPResponseAction(a1, a2);
      *(unsigned char *)(a1 + 457) = 1;
    }
  }
  else
  {
    AMSCore::HTTPResponseAction::HTTPResponseAction(a1, a2);
    *(unsigned char *)(a1 + 457) = 1;
    *(unsigned char *)(a1 + 464) = 1;
  }
  return a1;
}

void AMSCore::ExecuteHTTPRequestTask::anonymous namespace'::handleRetryAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v9 = operator new(0xD00uLL);
  AMSCore::HTTPResponseAction::HTTPResponseAction((uint64_t)(v9 + 62), a2);
  AMSCore::EncodeHTTPRequestTask::Options::Options((uint64_t)(v9 + 280), a3);
  *((_OWORD *)v9 + 163) = *(_OWORD *)(a3 + 368);
  *(void *)(a3 + 368) = 0;
  *(void *)(a3 + 376) = 0;
  *((_OWORD *)v9 + 188) = *(_OWORD *)a4;
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  uint64_t v10 = *(void *)(a4 + 16);
  unint64_t v11 = *(void *)(a4 + 24);
  *(void *)(a4 + 16) = 0;
  *(void *)(a4 + 24) = 0;
  v9[378] = v10;
  v9[379] = v11;
  uint64_t v12 = *(void *)(a4 + 32);
  v9[380] = v12;
  uint64_t v13 = *(void *)(a4 + 40);
  v9[381] = v13;
  *((_DWORD *)v9 + 764) = *(_DWORD *)(a4 + 48);
  if (v13)
  {
    unint64_t v14 = *(void *)(v12 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v14 >= v11) {
        v14 %= v11;
      }
    }
    else
    {
      v14 &= v11 - 1;
    }
    *(void *)(v10 + 8 * v14) = v9 + 380;
    *(void *)(a4 + 32) = 0;
    *(void *)(a4 + 40) = 0;
  }
  *((_WORD *)v9 + 1532) = *(_WORD *)(a4 + 56);
  uint64_t v15 = (void *)a5[3];
  if (v15)
  {
    if (v15 == a5)
    {
      v9[395] = v9 + 392;
      (*(void (**)(void *, void *))(*a5 + 24))(a5, v9 + 392);
    }
    else
    {
      v9[395] = v15;
      a5[3] = 0;
    }
  }
  else
  {
    v9[395] = 0;
  }
  atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 1u);
  *((unsigned char *)v9 + 24) = 0;
  *((unsigned char *)v9 + 448) = 0;
  v9[57] = 0;
  v9[61] = 0;
  std::shared_ptr<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise>::shared_ptr[abi:fe180100]<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise,AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise::get_return_object(void)::DetachPromise,void>(&v16, (uint64_t)(v9 + 2));
}

void sub_18DB8D640(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void AMSCore::ExecuteHTTPRequestTask::anonymous namespace'::handleCancelAction(AMSCore::ExecuteHTTPRequestTask::_anonymous_namespace_ *this, const AMSCore::HTTPResponseAction *a2)
{
  AMSCore::StringUtils::join<char [42]>(&__what_arg, "A request was cancelled without an error.");
  v15.__cat_ = (const std::error_category *)&AMSCore::Error::Category::generic(void)::instance;
  *(void *)&v15.__val_ = 1;
  std::system_error::system_error(&v9, v15, &__what_arg);
  if (SHIBYTE(__what_arg.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__what_arg.__r_.__value_.__l.__data_);
  }
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  v9.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
  uint64_t v10 = &v11;
  long long v13 = 0uLL;
  if (*((unsigned char *)a2 + 128))
  {
    AMSCore::Error::Error((std::runtime_error *)this, (const std::runtime_error *)((char *)a2 + 56));
    uint64_t v4 = (std::__shared_weak_count *)*((void *)&v13 + 1);
    v9.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
    if (*((void *)&v13 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v13 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  else
  {
    std::runtime_error::runtime_error((std::runtime_error *)this, &v9);
    *((_OWORD *)this + 1) = v9.__ec_;
    *(void *)this = &unk_1EDC827D8;
    uint64_t v5 = v11;
    *((void *)this + 4) = v10;
    *((void *)this + 5) = v5;
    uint64_t v6 = (char *)this + 40;
    uint64_t v7 = v12;
    *((void *)this + 6) = v12;
    if (v7)
    {
      *((void *)v5 + 2) = v6;
      uint64_t v10 = &v11;
      unint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      *((void *)this + 4) = v6;
    }
    *(_OWORD *)((char *)this + 56) = v13;
    long long v13 = 0uLL;
    v9.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
  }
  std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v10, v11);
  MEMORY[0x192FA3C30](&v9);
  AMSCore::ServiceProvider<AMSCore::Logger>::getDefault(&v9);
  AMSCore::Logger::log<char [31],AMSCore::Error>((uint64_t)v9.__vftable, 2u, (uint64_t)"networking", 10, "Cancelling a request. error = ", (uint64_t)this);
  imp = (std::__shared_weak_count *)v9.__imp_.__imp_;
  if (v9.__imp_.__imp_)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)v9.__imp_.__imp_ + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))imp->__on_zero_shared)(imp);
      std::__shared_weak_count::__release_weak(imp);
    }
  }
}

void sub_18DB8DBF0(void *a1)
{
}

void sub_18DB8DBFC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_18DB8DC10(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  __clang_call_terminate(a1);
}

void AMSCore::ExecuteHTTPRequestTask::anonymous namespace'::handleProceedAction(uint64_t a1, long long *a2, void *a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = operator new(0x488uLL);
  AMSCore::HTTPResponse::HTTPResponse((uint64_t)(v7 + 34), a2);
  uint64_t v8 = a3[1];
  v7[134] = *a3;
  v7[135] = v8;
  *a3 = 0;
  a3[1] = 0;
  *((_OWORD *)v7 + 63) = *(_OWORD *)a4;
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  uint64_t v9 = *(void *)(a4 + 16);
  unint64_t v10 = *(void *)(a4 + 24);
  *(void *)(a4 + 16) = 0;
  *(void *)(a4 + 24) = 0;
  v7[128] = v9;
  uint64_t v11 = *(void *)(a4 + 32);
  v7[129] = v10;
  v7[130] = v11;
  uint64_t v12 = *(void *)(a4 + 40);
  v7[131] = v12;
  *((_DWORD *)v7 + 264) = *(_DWORD *)(a4 + 48);
  if (v12)
  {
    unint64_t v13 = *(void *)(v11 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v13 >= v10) {
        v13 %= v10;
      }
    }
    else
    {
      v13 &= v10 - 1;
    }
    *(void *)(v9 + 8 * v13) = v7 + 130;
    *(void *)(a4 + 32) = 0;
    *(void *)(a4 + 40) = 0;
  }
  *((_WORD *)v7 + 532) = *(_WORD *)(a4 + 56);
  atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 1u);
  *((unsigned char *)v7 + 24) = 0;
  *((unsigned char *)v7 + 224) = 0;
  v7[29] = 0;
  v7[33] = 0;
  operator new();
}

void sub_18DB8E510(uint64_t a1, int a2)
{
  if (a2)
  {
    __cxa_end_catch();
    JUMPOUT(0x18DB8E534);
  }
  JUMPOUT(0x18DB8E52CLL);
}

void sub_18DB8E524(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

AMSCore::HTTPResponseAction *std::expected<AMSCore::HTTPResponseAction,AMSCore::Error>::~expected[abi:fe180100](AMSCore::HTTPResponseAction *this)
{
  if (*((unsigned char *)this + 457)) {
    AMSCore::HTTPResponseAction::~HTTPResponseAction(this);
  }
  else {
    (**(void (***)(AMSCore::HTTPResponseAction *))this)(this);
  }
  return this;
}

AMSCore::HTTPResponseAction *std::optional<std::expected<AMSCore::HTTPResponseAction,AMSCore::Error>>::~optional(AMSCore::HTTPResponseAction *this)
{
  if (*((unsigned char *)this + 464))
  {
    if (*((unsigned char *)this + 457)) {
      AMSCore::HTTPResponseAction::~HTTPResponseAction(this);
    }
    else {
      (**(void (***)(AMSCore::HTTPResponseAction *))this)(this);
    }
  }
  return this;
}

AMSCore::HTTPResponse *std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError>::~expected[abi:fe180100](AMSCore::HTTPResponse *this)
{
  if (*((unsigned char *)this + 656)) {
    AMSCore::HTTPResponse::~HTTPResponse(this);
  }
  else {
    (**(void (***)(AMSCore::HTTPResponse *))this)(this);
  }
  return this;
}

void AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise::unhandled_exception(AMSCore::HTTPError *a1)
{
}

void sub_18DB8E68C()
{
  AMSCore::Unexpected<AMSCore::HTTPError,AMSCore::HTTPError>(v2, v3);
  if (*(unsigned char *)(v0 + 432))
  {
    std::__expected_base<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::__repr::__destroy_union_member[abi:fe180100]((uint64_t)v1);
    *(unsigned char *)(v0 + 432) = 0;
  }
  std::__expected_base<AMSCore::HTTPResponse,AMSCore::HTTPError>::__union_t::__union_t[abi:fe180100]<AMSCore::HTTPError>(v1, (uint64_t)v3);
  *(unsigned char *)(v0 + 424) = 0;
  *(unsigned char *)(v0 + 432) = 1;
  AMSCore::HTTPError::~HTTPError((AMSCore::HTTPError *)v3);
  AMSCore::HTTPError::~HTTPError((AMSCore::HTTPError *)v2);
}

uint64_t AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise::Awaiter::await_suspend(uint64_t result)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void (**)(void))atomic_exchange((atomic_ullong *volatile)(*(void *)result + 440), 1uLL);
  if (v1)
  {
    uint64_t v2 = result;
    if (v1 == (void (**)(void))2) {
      return (*(uint64_t (**)(uint64_t))(*(void *)result - 8))(*(void *)result - 16);
    }
    uint64_t v3 = *(void *)result;
    __n128 result = *(void *)(*(void *)result + 472);
    if (result)
    {
      if (result == v3 + 448)
      {
        unint64_t v10 = v9;
        __n128 result = (*(uint64_t (**)(uint64_t, void *))(*(void *)result + 24))(result, v9);
      }
      else
      {
        unint64_t v10 = (void *)result;
        *(void *)(v3 + 472) = 0;
      }
    }
    else
    {
      unint64_t v10 = 0;
    }
    if (v10)
    {
      uint64_t v4 = *(void *)v2;
      if (!*(unsigned char *)(*(void *)v2 + 432))
      {
        __break(1u);
        return result;
      }
      uint64_t v5 = (void *)(v4 + 8);
      char v6 = *(unsigned char *)(v4 + 424);
      if (v6)
      {
        std::runtime_error v7 = *(std::runtime_error *)(v4 + 8);
        *uint64_t v5 = 0;
        *(void *)(v4 + 16) = 0;
        AMSCore::ExecuteHTTPRequestTask::Options::Options((uint64_t)v8, v4 + 24);
        *(_OWORD *)&v8[168] = *(_OWORD *)(v4 + 192);
        *(void *)(v4 + 192) = 0;
        *(void *)(v4 + 200) = 0;
      }
      else
      {
        std::__expected_base<AMSCore::HTTPResponse,AMSCore::HTTPError>::__union_t::__union_t[abi:fe180100]<AMSCore::HTTPError>(&v7, (uint64_t)v5);
      }
      v8[400] = v6;
      if (!v10) {
        std::__throw_bad_function_call[abi:fe180100]();
      }
      (*(void (**)(void *, std::runtime_error *))(*v10 + 48))(v10, &v7);
      std::__expected_base<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::__repr::__destroy_union_member[abi:fe180100]((uint64_t)&v7);
    }
    else
    {
      (*v1)(v1);
    }
    __n128 result = (uint64_t)v10;
    if (v10 == v9)
    {
      return (*(uint64_t (**)(void *))(v9[0] + 32))(v9);
    }
    else if (v10)
    {
      return (*(uint64_t (**)(void *))(*v10 + 40))(v10);
    }
  }
  return result;
}

void sub_18DB8E8E8(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::ValuePromise::~ValuePromise(uint64_t a1)
{
  uint64_t v2 = a1 + 448;
  uint64_t v3 = *(void *)(a1 + 472);
  if (v3 == v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
    if (!*(unsigned char *)(a1 + 432)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
  }
  if (*(unsigned char *)(a1 + 432)) {
LABEL_7:
  }
    std::__expected_base<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::__repr::__destroy_union_member[abi:fe180100](a1 + 8);
LABEL_8:
  if (atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 0xFFFFFFFF) == 1) {
    MEMORY[0x192FA3E80](AMSCore::TaskCounter::getCount(void)::count);
  }
  return a1;
}

uint64_t AMSCore::ExecuteHTTPRequestTask::anonymous namespace'::handleProceedAction(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 1136);
  if (!*(unsigned char *)(v1 + 88)) {
    __break(1u);
  }
  uint64_t v3 = (void (***)(void))(a1 + 928);
  char v4 = *(unsigned char *)(v1 + 80);
  if (!v4)
  {
    std::runtime_error::runtime_error((std::runtime_error *)(a1 + 928), (const std::runtime_error *)(v1 + 8));
    *(_OWORD *)(a1 + 944) = *(_OWORD *)(v1 + 24);
    *(void *)(a1 + 928) = &unk_1EDC827D8;
    uint64_t v5 = (void *)(v1 + 48);
    uint64_t v6 = *(void *)(v1 + 48);
    *(void *)(a1 + 960) = *(void *)(v1 + 40);
    uint64_t v7 = a1 + 968;
    *(void *)(a1 + 968) = v6;
    uint64_t v8 = *(void *)(v1 + 56);
    *(void *)(a1 + 976) = v8;
    if (v8)
    {
      *(void *)(v6 + 16) = v7;
      *(void *)(v1 + 40) = v5;
      *uint64_t v5 = 0;
      *(void *)(v1 + 56) = 0;
    }
    else
    {
      *(void *)(a1 + 960) = v7;
    }
    uint64_t v9 = *(void *)(a1 + 1136);
    *(_OWORD *)(a1 + 984) = *(_OWORD *)(v9 + 64);
    *(void *)(v9 + 64) = 0;
    *(void *)(v9 + 72) = 0;
  }
  *(unsigned char *)(a1 + 1000) = v4;
  uint64_t v10 = *(void *)(a1 + 1144);
  if (v10 && !atomic_fetch_add((atomic_ullong *volatile)(v10 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v11 = *(std::__shared_weak_count **)(a1 + 1144);
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  uint64_t v12 = *(std::__shared_weak_count **)(a1 + 1096);
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  unint64_t v13 = *(std::__shared_weak_count **)(a1 + 1128);
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  uint64_t v14 = *(std::__shared_weak_count **)(a1 + 1112);
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
    if (*(unsigned char *)(a1 + 1000)) {
      goto LABEL_26;
    }
  }
  else if (*(unsigned char *)(a1 + 1000))
  {
    goto LABEL_26;
  }
  AMSCore::ServiceProvider<AMSCore::Logger>::getDefault(&v19);
  AMSCore::Logger::log<char [37],AMSCore::Error>(v19, (uint64_t)"networking", 10, "Failed to save the account. error = ", (uint64_t)v3);
  std::error_code v15 = v20;
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
    if (*(unsigned char *)(a1 + 1000)) {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
  if (!*(unsigned char *)(a1 + 1000)) {
LABEL_22:
  }
    (**v3)(v3);
LABEL_26:
  AMSCore::ExecuteHTTPRequestTask::Options::Options((uint64_t)v23, *(void *)(a1 + 1008));
  AMSCore::ExecuteHTTPRequestTask::Result::Result((uint64_t)&v19, a1 + 1072, (uint64_t)v23, (long long *)(a1 + 272));
  std::optional<AMSCore::ExecuteHTTPRequestTask::Result>::emplace[abi:fe180100]<AMSCore::ExecuteHTTPRequestTask::Result,void>(a1 + 24, (uint64_t)&v19);
  std::system_error v16 = v22;
  if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  AMSCore::ExecuteHTTPRequestTask::Options::~Options((AMSCore::ExecuteHTTPRequestTask::Options *)&v21);
  uint64_t v17 = v20;
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  AMSCore::ExecuteHTTPRequestTask::Options::~Options((AMSCore::ExecuteHTTPRequestTask::Options *)v23);
  *(void *)(a1 + 928) = a1 + 16;
  *(void *)a1 = 0;
  return AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,void>::Promise::Awaiter::await_suspend((uint64_t)v3);
}

void sub_18DB8EDA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  if (a2)
  {
    std::shared_ptr<AMSCore::AppleSchedulingProvider>::~shared_ptr[abi:fe180100]((uint64_t)&a10);
    if (!*(unsigned char *)(v36 + 1000)) {
      (**v35)(v35);
    }
    __cxa_begin_catch(exception_object);
    std::terminate();
  }
  _Unwind_Resume(exception_object);
}

void AMSCore::ExecuteHTTPRequestTask::anonymous namespace'::handleProceedAction(char *a1)
{
  if (*(void *)a1)
  {
    uint64_t v2 = *((void *)a1 + 143);
    if (v2 && !atomic_fetch_add((atomic_ullong *volatile)(v2 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v3 = (std::__shared_weak_count *)*((void *)a1 + 143);
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
    char v4 = (std::__shared_weak_count *)*((void *)a1 + 137);
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    uint64_t v5 = (std::__shared_weak_count *)*((void *)a1 + 141);
    if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v6 = (std::__shared_weak_count *)*((void *)a1 + 139);
    if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  uint64_t v7 = (char *)*((void *)a1 + 33);
  if (v7 == a1 + 240)
  {
    (*(void (**)(char *))(*((void *)a1 + 30) + 32))(a1 + 240);
    if (!a1[224]) {
      goto LABEL_26;
    }
    goto LABEL_20;
  }
  if (v7) {
    (*(void (**)(char *))(*(void *)v7 + 40))(v7);
  }
  if (a1[224])
  {
LABEL_20:
    uint64_t v8 = (std::__shared_weak_count *)*((void *)a1 + 27);
    if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
    AMSCore::ExecuteHTTPRequestTask::Options::~Options((AMSCore::ExecuteHTTPRequestTask::Options *)(a1 + 40));
    uint64_t v9 = (std::__shared_weak_count *)*((void *)a1 + 4);
    if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
LABEL_26:
  if (atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 0xFFFFFFFF) == 1) {
    MEMORY[0x192FA3E80](AMSCore::TaskCounter::getCount(void)::count);
  }
  uint64_t v10 = (void **)*((void *)a1 + 130);
  if (v10)
  {
    do
    {
      uint64_t v14 = (void **)*v10;
      if (*((char *)v10 + 39) < 0) {
        operator delete(v10[2]);
      }
      operator delete(v10);
      uint64_t v10 = v14;
    }
    while (v14);
  }
  uint64_t v11 = (void *)*((void *)a1 + 128);
  *((void *)a1 + 128) = 0;
  if (v11) {
    operator delete(v11);
  }
  uint64_t v12 = (std::__shared_weak_count *)*((void *)a1 + 127);
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  unint64_t v13 = (std::__shared_weak_count *)*((void *)a1 + 135);
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  AMSCore::HTTPResponse::~HTTPResponse((AMSCore::HTTPResponse *)(a1 + 272));
  operator delete(a1);
}

uint64_t std::optional<AMSCore::ExecuteHTTPRequestTask::Result>::emplace[abi:fe180100]<AMSCore::ExecuteHTTPRequestTask::Result,void>(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 200))
  {
    char v4 = *(std::__shared_weak_count **)(a1 + 192);
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    AMSCore::ExecuteHTTPRequestTask::Options::~Options((AMSCore::ExecuteHTTPRequestTask::Options *)(a1 + 16));
    uint64_t v5 = *(std::__shared_weak_count **)(a1 + 8);
    if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    *(unsigned char *)(a1 + 200) = 0;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  AMSCore::ExecuteHTTPRequestTask::Options::Options(a1 + 16, a2 + 16);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(void *)(a2 + 184) = 0;
  *(void *)(a2 + 192) = 0;
  *(unsigned char *)(a1 + 200) = 1;
  return a1;
}

uint64_t AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,void>::Promise::Awaiter::await_suspend(uint64_t result)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void (**)(void))atomic_exchange((atomic_ullong *volatile)(*(void *)result + 216), 1uLL);
  if (v1)
  {
    uint64_t v2 = result;
    if (v1 == (void (**)(void))2) {
      return (*(uint64_t (**)(uint64_t))(*(void *)result - 8))(*(void *)result - 16);
    }
    uint64_t v3 = (uint64_t *)(*(void *)result + 248);
    __n128 result = *v3;
    if (*v3)
    {
      if (result == *(void *)v2 + 224)
      {
        uint64_t v11 = v10;
        __n128 result = (*(uint64_t (**)(uint64_t, void *))(*(void *)result + 24))(result, v10);
      }
      else
      {
        uint64_t v11 = *(void **)(*(void *)v2 + 248);
        *uint64_t v3 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    if (v11)
    {
      uint64_t v4 = *(void *)v2;
      if (!*(unsigned char *)(*(void *)v2 + 208))
      {
        __break(1u);
        return result;
      }
      long long v7 = *(_OWORD *)(v4 + 8);
      *(void *)(v4 + 8) = 0;
      *(void *)(v4 + 16) = 0;
      AMSCore::ExecuteHTTPRequestTask::Options::Options((uint64_t)v8, v4 + 24);
      long long v9 = *(_OWORD *)(v4 + 192);
      *(void *)(v4 + 192) = 0;
      *(void *)(v4 + 200) = 0;
      if (!v11) {
        std::__throw_bad_function_call[abi:fe180100]();
      }
      (*(void (**)(void *, long long *))(*v11 + 48))(v11, &v7);
      uint64_t v5 = (std::__shared_weak_count *)*((void *)&v9 + 1);
      if (*((void *)&v9 + 1)
        && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v9 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
      AMSCore::ExecuteHTTPRequestTask::Options::~Options((AMSCore::ExecuteHTTPRequestTask::Options *)v8);
      uint64_t v6 = (std::__shared_weak_count *)*((void *)&v7 + 1);
      if (*((void *)&v7 + 1)
        && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    else
    {
      (*v1)(v1);
    }
    __n128 result = (uint64_t)v11;
    if (v11 == v10)
    {
      return (*(uint64_t (**)(void *))(v10[0] + 32))(v10);
    }
    else if (v11)
    {
      return (*(uint64_t (**)(void *))(*v11 + 40))(v11);
    }
  }
  return result;
}

void sub_18DB8F504(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_pointer<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,void>::Promise *,AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,void>::Promise::get_return_object(void)::DetachPromise,std::allocator<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,void>::Promise>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN7AMSCore4TaskINS_22ExecuteHTTPRequestTask6ResultEvE7Promise17get_return_objectEvE13DetachPromise"
    || ((v3 & (unint64_t)"ZN7AMSCore4TaskINS_22ExecuteHTTPRequestTask6ResultEvE7Promise17get_return_objectEvE13DetachPromise" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN7AMSCore4TaskINS_22ExecuteHTTPRequestTask6ResultEvE7Promise17get_return_objectEvE13DetachPromise")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN7AMSCore4TaskINS_22ExecuteHTTPRequestTask6ResultEvE7Promise17get_return_objectEvE13DetachPromise" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,void>::Promise *,AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,void>::Promise::get_return_object(void)::DetachPromise,std::allocator<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,void>::Promise>>::__on_zero_shared(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 24);
  if (atomic_exchange((atomic_ullong *volatile)(v1 + 216), 2uLL)) {
    return (*(uint64_t (**)(uint64_t))(v1 - 8))(v1 - 16);
  }
  return result;
}

void std::__shared_ptr_pointer<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,void>::Promise *,AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,void>::Promise::get_return_object(void)::DetachPromise,std::allocator<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,void>::Promise>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FA4080);
}

void AMSCore::ExecuteHTTPRequestTask::anonymous namespace'::handleRetryAction(unint64_t a1)
{
  uint64_t v2 = (unsigned char *)(a1 + 3320);
  unint64_t v3 = a1 + 1608;
  uint64_t v4 = (std::runtime_error *)(a1 + 1424);
  uint64_t v5 = (std::runtime_error *)(a1 + 1848);
  uint64_t v6 = (void **)(a1 + 2624);
  unint64_t v7 = a1 + 3168;
  unint64_t v8 = a1 + 16;
  if (*(unsigned char *)(a1 + 3320)) {
    goto LABEL_2;
  }
  uint64_t v12 = *(void *)(a1 + 3288);
  if (!*(unsigned char *)(v12 + 400)) {
    goto LABEL_99;
  }
  unint64_t v13 = (const std::runtime_error *)(v12 + 8);
  char v14 = *(unsigned char *)(v12 + 392);
  if (v14)
  {
    AMSCore::EncodeHTTPRequestTask::Options::Options(a1 + 1848, (uint64_t)v13);
    std::error_code v15 = (void *)(v12 + 376);
    *(void *)(a1 + 2216) = *(void *)(v12 + 376);
    std::system_error v16 = (void *)(a1 + 2224);
    uint64_t v17 = (void *)(v12 + 384);
  }
  else
  {
    std::runtime_error::runtime_error((std::runtime_error *)(a1 + 1848), v13);
    *(_OWORD *)(a1 + 1864) = *(_OWORD *)(v12 + 24);
    *(void *)(a1 + 1848) = &unk_1EDC827D8;
    uint64_t v30 = (void *)(v12 + 48);
    uint64_t v31 = *(void *)(v12 + 48);
    *(void *)(a1 + 1880) = *(void *)(v12 + 40);
    unint64_t v32 = a1 + 1888;
    *(void *)(a1 + 1888) = v31;
    uint64_t v33 = *(void *)(v12 + 56);
    *(void *)(a1 + 1896) = v33;
    if (v33)
    {
      *(void *)(v31 + 16) = v32;
      *(void *)(v12 + 40) = v30;
      *uint64_t v30 = 0;
      *(void *)(v12 + 56) = 0;
    }
    else
    {
      *(void *)(a1 + 1880) = v32;
    }
    uint64_t v34 = *(void *)(a1 + 3288);
    uint64_t v35 = *(void *)(v34 + 64);
    std::error_code v15 = (void *)(v34 + 64);
    *(void *)(a1 + 1904) = v35;
    std::system_error v16 = (void *)(a1 + 1912);
    uint64_t v17 = v15 + 1;
  }
  *std::system_error v16 = *v17;
  *std::error_code v15 = 0;
  v15[1] = 0;
  *(unsigned char *)(a1 + 2232) = v14;
  uint64_t v36 = *(void *)(a1 + 3296);
  if (v36 && !atomic_fetch_add((atomic_ullong *volatile)(v36 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    char v37 = *(std::__shared_weak_count **)(a1 + 3296);
    ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
    std::__shared_weak_count::__release_weak(v37);
  }
  uint64_t v38 = *(std::__shared_weak_count **)(a1 + 1432);
  if (v38 && !atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
    std::__shared_weak_count::__release_weak(v38);
  }
  uint64_t v39 = *(std::__shared_weak_count **)(a1 + 3232);
  if (v39 && !atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
    std::__shared_weak_count::__release_weak(v39);
  }
  AMSCore::HTTPResponseAction::~HTTPResponseAction((AMSCore::HTTPResponseAction *)(a1 + 960));
  if (*(unsigned char *)(a1 + 2232))
  {
    LOBYTE(v52[0]) = *(unsigned char *)(a1 + 3064);
    AMSCore::ServiceProvider<AMSCore::Logger>::getDefault(v51);
    AMSCore::Logger::log<char [36],unsigned char>((uint64_t)v51[0].__vftable, v52);
    imp = (std::__shared_weak_count *)v51[0].__imp_.__imp_;
    if (v51[0].__imp_.__imp_
      && !atomic_fetch_add((atomic_ullong *volatile)v51[0].__imp_.__imp_ + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))imp->__on_zero_shared)(imp);
      std::__shared_weak_count::__release_weak(imp);
    }
    if (!*(unsigned char *)(a1 + 2232)) {
      goto LABEL_99;
    }
    AMSCore::EncodeHTTPRequestTask::Options::Options((uint64_t)v6, (uint64_t)v5);
    *(_OWORD *)(a1 + 2992) = *(_OWORD *)(v3 + 608);
    *(_OWORD *)(v3 + 608) = 0u;
    *(_OWORD *)(a1 + 3072) = *(_OWORD *)(a1 + 3008);
    *(void *)(a1 + 3008) = 0;
    *(void *)(a1 + 3016) = 0;
    uint64_t v41 = *(void *)(a1 + 3024);
    unint64_t v42 = *(void *)(a1 + 3032);
    *(void *)(a1 + 3032) = 0;
    *(void *)(a1 + 3024) = 0;
    *(void *)(a1 + 3088) = v41;
    *(void *)(a1 + 3096) = v42;
    uint64_t v43 = *(void *)(a1 + 3040);
    *(void *)(a1 + 3104) = v43;
    uint64_t v44 = *(void *)(a1 + 3048);
    *(void *)(a1 + 3112) = v44;
    *(_DWORD *)(a1 + 3120) = *(_DWORD *)(a1 + 3056);
    if (v44)
    {
      unint64_t v45 = *(void *)(v43 + 8);
      if ((v42 & (v42 - 1)) != 0)
      {
        if (v45 >= v42) {
          v45 %= v42;
        }
      }
      else
      {
        v45 &= v42 - 1;
      }
      *(void *)(v41 + 8 * v45) = a1 + 3104;
      *(void *)(a1 + 3040) = 0;
      *(void *)(a1 + 3048) = 0;
    }
    *(_WORD *)(a1 + 3128) = *(_WORD *)(a1 + 3064);
    uint64_t v48 = *(void *)(a1 + 3160);
    if (v48)
    {
      if (v48 == a1 + 3136)
      {
        *(void *)(a1 + 3192) = v7;
        (*(void (**)(unint64_t, unint64_t))(*(void *)(a1 + 3136) + 24))(a1 + 3136, v7);
        goto LABEL_96;
      }
      uint64_t v49 = (void *)(a1 + 3160);
      *(void *)(a1 + 3192) = v48;
    }
    else
    {
      uint64_t v49 = (void *)(a1 + 3192);
    }
    *uint64_t v49 = 0;
LABEL_96:
    uint64_t v50 = *(void *)(a1 + 3240);
    *(void *)(a1 + 3304) = v50;
    *(void *)(a1 + 3312) = *(void *)(a1 + 3248);
    *(void *)(a1 + 3240) = 0;
    *(void *)(a1 + 3248) = 0;
    if (!atomic_load_explicit((atomic_ullong *volatile)(v50 + 440), memory_order_acquire))
    {
      *uint64_t v2 = 1;
      if (!atomic_exchange((atomic_ullong *volatile)(*(void *)(a1 + 3304) + 440), a1)) {
        return;
      }
    }
LABEL_2:
    uint64_t v9 = *(void *)(a1 + 3304);
    if (*(unsigned char *)(v9 + 432))
    {
      uint64_t v10 = (void *)(v9 + 8);
      int v11 = *(unsigned __int8 *)(v9 + 424);
      if (*(unsigned char *)(v9 + 424))
      {
        *(_OWORD *)(a1 + 1424) = *(_OWORD *)(v9 + 8);
        *uint64_t v10 = 0;
        *(void *)(v9 + 16) = 0;
        AMSCore::ExecuteHTTPRequestTask::Options::Options(a1 + 1440, v9 + 24);
        *(_OWORD *)unint64_t v3 = *(_OWORD *)(v9 + 192);
        *(void *)(v9 + 192) = 0;
        *(void *)(v9 + 200) = 0;
      }
      else
      {
        std::__expected_base<AMSCore::HTTPResponse,AMSCore::HTTPError>::__union_t::__union_t[abi:fe180100]<AMSCore::HTTPError>(v4, (uint64_t)v10);
      }
      *(unsigned char *)(a1 + 1840) = v11;
      if (*(unsigned char *)(a1 + 448))
      {
        std::__expected_base<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::__repr::__destroy_union_member[abi:fe180100](a1 + 24);
        *(unsigned char *)(a1 + 448) = 0;
        int v11 = *(unsigned __int8 *)(a1 + 1840);
      }
      if (v11)
      {
        *(_OWORD *)(a1 + 24) = *(_OWORD *)(a1 + 1424);
        v4->__vftable = 0;
        v4->__imp_.__imp_ = 0;
        AMSCore::ExecuteHTTPRequestTask::Options::Options(a1 + 40, a1 + 1440);
        *(_OWORD *)(a1 + 208) = *(_OWORD *)v3;
        *(void *)unint64_t v3 = 0;
        *(void *)(v3 + 8) = 0;
      }
      else
      {
        std::__expected_base<AMSCore::HTTPResponse,AMSCore::HTTPError>::__union_t::__union_t[abi:fe180100]<AMSCore::HTTPError>((std::runtime_error *)(a1 + 24), (uint64_t)v4);
      }
      *(unsigned char *)(a1 + 440) = v11;
      *(unsigned char *)(a1 + 448) = 1;
      std::__expected_base<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::__repr::__destroy_union_member[abi:fe180100]((uint64_t)v4);
      uint64_t v18 = *(void *)(a1 + 3312);
      if (v18 && !atomic_fetch_add((atomic_ullong *volatile)(v18 + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        uint64_t v19 = *(std::__shared_weak_count **)(a1 + 3312);
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
      uint64_t v20 = *(std::__shared_weak_count **)(a1 + 3248);
      if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
      uint64_t v21 = *(void *)(a1 + 3192);
      if (v21 == v7)
      {
        (*(void (**)(unint64_t))(*(void *)v7 + 32))(v7);
        long long v22 = *(void ***)(a1 + 3104);
        if (!v22)
        {
LABEL_26:
          std::system_error v23 = *(void **)(a1 + 3088);
          *(void *)(a1 + 3088) = 0;
          if (v23) {
            operator delete(v23);
          }
          uint64_t v24 = *(std::__shared_weak_count **)(a1 + 3080);
          if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
            std::__shared_weak_count::__release_weak(v24);
          }
          uint64_t v25 = *(std::__shared_weak_count **)(a1 + 3000);
          if (v25 && !atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
            std::__shared_weak_count::__release_weak(v25);
          }
          AMSCore::EncodeHTTPRequestTask::Options::~Options(v6);
          goto LABEL_35;
        }
      }
      else
      {
        if (v21) {
          (*(void (**)(uint64_t))(*(void *)v21 + 40))(v21);
        }
        long long v22 = *(void ***)(a1 + 3104);
        if (!v22) {
          goto LABEL_26;
        }
      }
      do
      {
        unsigned __int8 v28 = (void **)*v22;
        if (*((char *)v22 + 39) < 0) {
          operator delete(v22[2]);
        }
        operator delete(v22);
        long long v22 = v28;
      }
      while (v28);
      goto LABEL_26;
    }
LABEL_99:
    __break(1u);
    return;
  }
  LOBYTE(v52[0]) = 0;
  char v54 = 0;
  char v55 = 0;
  char v56 = 0;
  char v57 = 0;
  char v58 = 0;
  char v59 = 0;
  char v60 = 0;
  char v61 = 0;
  char v62 = 0;
  char v63 = 0;
  char v64 = 0;
  char v65 = 0;
  char v66 = 0;
  char v71 = 0;
  char v72 = 0;
  char v73 = 0;
  char v74 = 0;
  char v75 = 0;
  char v76 = 0;
  char v77 = 0;
  char v78 = 0;
  char v79 = 0;
  char v80 = 0;
  char v81 = 0;
  char v82 = 0;
  char v83 = 0;
  char v84 = 0;
  char v85 = 0;
  char v87 = 0;
  char v88 = 0;
  __int16 v89 = 0;
  LOBYTE(__p) = 0;
  char v92 = 0;
  std::runtime_error v68 = 0;
  uint64_t v67 = 0;
  char v70 = 0;
  uint64_t v69 = 0;
  int v86 = 0;
  AMSCore::Unexpected<AMSCore::HTTPError,AMSCore::HTTPTransactionMetrics,AMSCore::Error &>(v51, (uint64_t)v52, v5);
  if (*(unsigned char *)(a1 + 448))
  {
    std::__expected_base<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::__repr::__destroy_union_member[abi:fe180100](a1 + 24);
    *(unsigned char *)(a1 + 448) = 0;
  }
  std::__expected_base<AMSCore::HTTPResponse,AMSCore::HTTPError>::__union_t::__union_t[abi:fe180100]<AMSCore::HTTPError>((std::runtime_error *)(a1 + 24), (uint64_t)v51);
  *(unsigned char *)(a1 + 440) = 0;
  *(unsigned char *)(a1 + 448) = 1;
  AMSCore::HTTPError::~HTTPError((AMSCore::HTTPError *)v51);
  if (v92 && v91 < 0) {
    operator delete(__p);
  }
  std::string v46 = (void **)v67;
  if (v67)
  {
    for (i = v68; i != v46; i -= 3)
    {
      if (*((char *)i - 1) < 0) {
        operator delete(*(i - 3));
      }
    }
    operator delete(v46);
  }
  if (v54 && v53 < 0) {
    operator delete(v52[0]);
  }
LABEL_35:
  if (*(unsigned char *)(a1 + 2232))
  {
    uint64_t v26 = *(std::__shared_weak_count **)(a1 + 2224);
    if (v26 && !atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
    AMSCore::EncodeHTTPRequestTask::Options::~Options((void **)&v5->__vftable);
    uint64_t v27 = *(std::__shared_weak_count **)(a1 + 3264);
    if (!v27) {
      goto LABEL_47;
    }
    goto LABEL_45;
  }
  ((void (*)(std::runtime_error *))v5->~runtime_error)(v5);
  uint64_t v27 = *(std::__shared_weak_count **)(a1 + 3264);
  if (v27)
  {
LABEL_45:
    if (!atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
LABEL_47:
  uint64_t v29 = *(std::__shared_weak_count **)(a1 + 3280);
  if (v29)
  {
    if (!atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  *(void *)(a1 + 1424) = v8;
  *(void *)a1 = 0;
  *uint64_t v2 = 2;
  AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise::Awaiter::await_suspend((uint64_t)v4);
}

void sub_18DB8FED8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,void *a61)
{
  AMSCore::HTTPTransactionMetrics::~HTTPTransactionMetrics(&a61);
  std::expected<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>::~expected[abi:fe180100](v63);
  std::shared_ptr<AMSCore::AppleSchedulingProvider>::~shared_ptr[abi:fe180100](v61 + 3256);
  std::shared_ptr<AMSCore::AppleSchedulingProvider>::~shared_ptr[abi:fe180100](v61 + 3272);
  __cxa_begin_catch(a1);
  AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise::unhandled_exception(v62);
}

void sub_18DB8FF44()
{
}

void sub_18DB8FF4C(_Unwind_Exception *a1)
{
  void *v1 = 0;
  *uint64_t v2 = 2;
  _Unwind_Resume(a1);
}

void AMSCore::ExecuteHTTPRequestTask::anonymous namespace'::handleRetryAction(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 3320);
  if (v2 == 2) {
    goto LABEL_49;
  }
  if (v2 != 1)
  {
    uint64_t v9 = *(void *)(a1 + 3296);
    if (v9 && !atomic_fetch_add((atomic_ullong *volatile)(v9 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v10 = *(std::__shared_weak_count **)(a1 + 3296);
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    int v11 = *(std::__shared_weak_count **)(a1 + 1432);
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    uint64_t v12 = *(std::__shared_weak_count **)(a1 + 3232);
    if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    AMSCore::HTTPResponseAction::~HTTPResponseAction((AMSCore::HTTPResponseAction *)(a1 + 960));
    unint64_t v13 = *(std::__shared_weak_count **)(a1 + 3264);
    if (!v13) {
      goto LABEL_46;
    }
    goto LABEL_44;
  }
  uint64_t v3 = *(void *)(a1 + 3312);
  if (v3 && !atomic_fetch_add((atomic_ullong *volatile)(v3 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v4 = *(std::__shared_weak_count **)(a1 + 3312);
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  uint64_t v5 = a1 + 3168;
  uint64_t v6 = *(std::__shared_weak_count **)(a1 + 3248);
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  uint64_t v7 = *(void *)(a1 + 3192);
  if (v7 == v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 32))(a1 + 3168);
    unint64_t v8 = *(void ***)(a1 + 3104);
    if (!v8) {
      goto LABEL_26;
    }
    goto LABEL_41;
  }
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 40))(v7);
  }
  unint64_t v8 = *(void ***)(a1 + 3104);
  if (v8)
  {
    do
    {
LABEL_41:
      uint64_t v18 = (void **)*v8;
      if (*((char *)v8 + 39) < 0) {
        operator delete(v8[2]);
      }
      operator delete(v8);
      unint64_t v8 = v18;
    }
    while (v18);
  }
LABEL_26:
  char v14 = *(void **)(a1 + 3088);
  *(void *)(a1 + 3088) = 0;
  if (v14) {
    operator delete(v14);
  }
  std::error_code v15 = *(std::__shared_weak_count **)(a1 + 3080);
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
  std::system_error v16 = *(std::__shared_weak_count **)(a1 + 3000);
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  AMSCore::EncodeHTTPRequestTask::Options::~Options((void **)(a1 + 2624));
  if (*(unsigned char *)(a1 + 2232))
  {
    uint64_t v17 = *(std::__shared_weak_count **)(a1 + 2224);
    if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
    AMSCore::EncodeHTTPRequestTask::Options::~Options((void **)(a1 + 1848));
    unint64_t v13 = *(std::__shared_weak_count **)(a1 + 3264);
    if (!v13) {
      goto LABEL_46;
    }
    goto LABEL_44;
  }
  (**(void (***)(uint64_t))(a1 + 1848))(a1 + 1848);
  unint64_t v13 = *(std::__shared_weak_count **)(a1 + 3264);
  if (v13)
  {
LABEL_44:
    if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
LABEL_46:
  uint64_t v19 = *(std::__shared_weak_count **)(a1 + 3280);
  if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
LABEL_49:
  uint64_t v20 = *(void *)(a1 + 488);
  if (v20 == a1 + 464)
  {
    (*(void (**)(uint64_t))(*(void *)(a1 + 464) + 32))(a1 + 464);
    if (!*(unsigned char *)(a1 + 448)) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 40))(v20);
  }
  if (*(unsigned char *)(a1 + 448)) {
LABEL_55:
  }
    std::__expected_base<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::__repr::__destroy_union_member[abi:fe180100](a1 + 24);
LABEL_56:
  if (atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 0xFFFFFFFF) == 1) {
    MEMORY[0x192FA3E80](AMSCore::TaskCounter::getCount(void)::count);
  }
  uint64_t v21 = *(void *)(a1 + 3160);
  if (v21 == a1 + 3136)
  {
    (*(void (**)(uint64_t))(*(void *)(a1 + 3136) + 32))(a1 + 3136);
    long long v22 = *(void ***)(a1 + 3040);
    if (!v22) {
      goto LABEL_64;
    }
    goto LABEL_76;
  }
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 40))(v21);
  }
  long long v22 = *(void ***)(a1 + 3040);
  if (v22)
  {
    do
    {
LABEL_76:
      uint64_t v26 = (void **)*v22;
      if (*((char *)v22 + 39) < 0) {
        operator delete(v22[2]);
      }
      operator delete(v22);
      long long v22 = v26;
    }
    while (v26);
  }
LABEL_64:
  std::system_error v23 = *(void **)(a1 + 3024);
  *(void *)(a1 + 3024) = 0;
  if (v23) {
    operator delete(v23);
  }
  uint64_t v24 = *(std::__shared_weak_count **)(a1 + 3016);
  if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
    std::__shared_weak_count::__release_weak(v24);
  }
  uint64_t v25 = *(std::__shared_weak_count **)(a1 + 2616);
  if (v25 && !atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
    std::__shared_weak_count::__release_weak(v25);
  }
  AMSCore::EncodeHTTPRequestTask::Options::~Options((void **)(a1 + 2240));
  AMSCore::HTTPResponseAction::~HTTPResponseAction((AMSCore::HTTPResponseAction *)(a1 + 496));
  operator delete((void *)a1);
}

void AMSCore::Unexpected<AMSCore::HTTPError,AMSCore::HTTPTransactionMetrics,AMSCore::Error &>(std::runtime_error *a1, uint64_t a2, const std::runtime_error *a3)
{
  LOBYTE(__p[0]) = 0;
  int v4 = *(unsigned __int8 *)(a2 + 24);
  if (*(unsigned char *)(a2 + 24))
  {
    *(_OWORD *)std::vector<std::csub_match> __p = *(_OWORD *)a2;
    uint64_t v10 = *(void *)(a2 + 16);
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    *(void *)a2 = 0;
  }
  long long v13 = *(_OWORD *)(a2 + 64);
  long long v14 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)std::error_code v15 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)&v15[9] = *(_OWORD *)(a2 + 105);
  long long v11 = *(_OWORD *)(a2 + 32);
  long long v12 = *(_OWORD *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 128);
  uint64_t v6 = *(void *)(a2 + 136);
  uint64_t v7 = *(void *)(a2 + 144);
  *(void *)(a2 + 136) = 0;
  *(void *)(a2 + 144) = 0;
  *(void *)(a2 + 128) = 0;
  long long v23 = *(_OWORD *)(a2 + 264);
  *(_OWORD *)uint64_t v24 = *(_OWORD *)(a2 + 280);
  *(_OWORD *)&v24[10] = *(_OWORD *)(a2 + 290);
  long long v22 = *(_OWORD *)(a2 + 248);
  long long v18 = *(_OWORD *)(a2 + 184);
  long long v19 = *(_OWORD *)(a2 + 200);
  long long v20 = *(_OWORD *)(a2 + 216);
  long long v21 = *(_OWORD *)(a2 + 232);
  long long v16 = *(_OWORD *)(a2 + 152);
  long long v17 = *(_OWORD *)(a2 + 168);
  LOBYTE(v25) = 0;
  int v8 = *(unsigned __int8 *)(a2 + 336);
  if (*(unsigned char *)(a2 + 336))
  {
    uint64_t v26 = *(void *)(a2 + 328);
    long long v25 = *(_OWORD *)(a2 + 312);
    *(void *)(a2 + 320) = 0;
    *(void *)(a2 + 328) = 0;
    *(void *)(a2 + 312) = 0;
  }
  AMSCore::Error::Error(v27, a3);
  v27[0].__vftable = (std::runtime_error_vtbl *)&unk_1EDC828C8;
  LOBYTE(v28) = 0;
  char v30 = 0;
  if (v4)
  {
    long long v28 = *(_OWORD *)__p;
    uint64_t v29 = v10;
    HIBYTE(v10) = 0;
    __p[0] = 0;
    char v30 = 1;
  }
  long long v33 = v13;
  long long v34 = v14;
  v35[0] = *(_OWORD *)v15;
  *(_OWORD *)((char *)v35 + 9) = *(_OWORD *)&v15[9];
  long long v31 = v11;
  long long v32 = v12;
  uint64_t v36 = v5;
  uint64_t v37 = v6;
  uint64_t v38 = v7;
  *(_OWORD *)((char *)v47 + 10) = *(_OWORD *)&v24[10];
  long long v39 = v16;
  long long v40 = v17;
  long long v43 = v20;
  long long v44 = v21;
  long long v41 = v18;
  long long v42 = v19;
  long long v46 = v23;
  v47[0] = *(_OWORD *)v24;
  long long v45 = v22;
  LOBYTE(v48) = 0;
  char v50 = 0;
  if (v8)
  {
    long long v48 = v25;
    uint64_t v49 = v26;
    char v50 = 1;
  }
  std::__expected_base<AMSCore::HTTPResponse,AMSCore::HTTPError>::__union_t::__union_t[abi:fe180100]<AMSCore::HTTPError>(a1, (uint64_t)v27);
  AMSCore::HTTPError::~HTTPError((AMSCore::HTTPError *)v27);
  if (v4)
  {
    if (SHIBYTE(v10) < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_18DB907F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

uint64_t AMSCore::Logger::log<char [36],unsigned char>(uint64_t result, unsigned char *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)(result + 8) <= 2u)
  {
    uint64_t v3 = result;
    std::ostringstream::basic_ostringstream[abi:fe180100]((uint64_t)v8);
    uint64_t v4 = *(void *)(v8[0] - 24);
    {
    }
    std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v8, (uint64_t)"Retrying the request. retryCount = ", 35);
    LOBYTE(rep) = *a2;
    std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v8, (uint64_t)&rep, 1);
    uint64_t v5 = v8[6];
    uint64_t v6 = (char *)v8 + *(void *)(v8[0] - 24);
    if ((v6[32] & 5) != 0)
    {
      uint64_t v7 = -1;
    }
    else
    {
      (*(void (**)(std::chrono::duration<long long, std::ratio<1, 1000000>>::rep *__return_ptr))(**((void **)v6 + 5) + 32))(&rep);
      uint64_t v7 = v15;
    }
    std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
    char v12 = 2;
    uint64_t v13 = v5;
    uint64_t v14 = v7;
    (*(void (**)(void, const char *, uint64_t, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep *))(**(void **)(v3 + 16) + 16))(*(void *)(v3 + 16), "networking", 10, &rep);
    v8[0] = *MEMORY[0x1E4FBA418];
    *(void *)((char *)v8 + *(void *)(v8[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
    v8[1] = MEMORY[0x1E4FBA470] + 16;
    if (v9 < 0) {
      operator delete((void *)v8[9]);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    return MEMORY[0x192FA3FD0](&v10);
  }
  return result;
}

void sub_18DB90ABC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:fe180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AMSCore::ExecuteHTTPRequestTask::anonymous namespace'::handleRetryAction(AMSCore::HTTPResponseAction,AMSCore::EncodeHTTPRequestTask::Result,AMSCore::ExecuteHTTPRequestTask::Context,std::function<AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask ()(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount>,AMSCore::LoadURLMetricsHandler::Options &&)>)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,std::shared_ptr<AMSCore::ExecuteHTTPRequestTask::IHandler>,std::shared_ptr<AMSCore::ExecuteHTTPRequestTask::AnonymousHandler>> const&>(uint64_t *a1@<X1>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  *a2 = v3;
  a2[1] = v2;
}

void std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:fe180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AMSCore::ExecuteHTTPRequestTask::anonymous namespace'::handleRetryAction(AMSCore::HTTPResponseAction,AMSCore::EncodeHTTPRequestTask::Result,AMSCore::ExecuteHTTPRequestTask::Context,std::function<AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask ()(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount>,AMSCore::LoadURLMetricsHandler::Options &&)>)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,std::shared_ptr<AMSCore::ExecuteHTTPRequestTask::IHandler>,std::shared_ptr<AMSCore::ExecuteHTTPRequestTask::AnonymousHandler>> const&>(uint64_t *a1@<X1>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  *a2 = v3;
  a2[1] = v2;
}

void std::__shared_ptr_emplace<AMSCore::EncodeHTTPRequestTask::OptionsBuilder>::__on_zero_shared(uint64_t a1)
{
}

void std::__shared_ptr_emplace<AMSCore::EncodeHTTPRequestTask::OptionsBuilder>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDC83EC0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FA4080);
}

void std::__shared_ptr_emplace<AMSCore::EncodeHTTPRequestTask::OptionsBuilder>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDC83EC0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t std::__shared_ptr_pointer<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise *,AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise::get_return_object(void)::DetachPromise,std::allocator<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN7AMSCore4TaskINS_22ExecuteHTTPRequestTask6ResultENS_9HTTPErrorEE7Promise17get_return_objectEvE13DetachPromise"
    || ((v3 & (unint64_t)"ZN7AMSCore4TaskINS_22ExecuteHTTPRequestTask6ResultENS_9HTTPErrorEE7Promise17get_return_o"
                                "bjectEvE13DetachPromise" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN7AMSCore4TaskINS_22ExecuteHTTPRequestTask6ResultENS_9HTTPErrorEE7Promise17get_return_objectEvE13DetachPromise")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN7AMSCore4TaskINS_22ExecuteHTTPRequestTask6ResultENS_9HTTPErrorEE7Promise17get_return_objectEvE13DetachPromise" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise *,AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise::get_return_object(void)::DetachPromise,std::allocator<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise>>::__on_zero_shared(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 24);
  if (atomic_exchange((atomic_ullong *volatile)(v1 + 440), 2uLL)) {
    return (*(uint64_t (**)(uint64_t))(v1 - 8))(v1 - 16);
  }
  return result;
}

void std::__shared_ptr_pointer<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise *,AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise::get_return_object(void)::DetachPromise,std::allocator<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FA4080);
}

void AMSCore::ExecuteHTTPRequestTask::perform(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  AMSCore::EncodeHTTPRequestTask::Options::Options((uint64_t)v7, a2);
  long long v8 = *(_OWORD *)(a2 + 368);
  *(void *)(a2 + 368) = 0;
  *(void *)(a2 + 376) = 0;
  AMSCore::ExecuteHTTPRequestTask::Options::Options((uint64_t)v25, a3);
  v23[0] = &unk_1EDC82B58;
  v23[1] = AMSCore::LoadURLMetricsHandler::handleURLMetrics;
  uint64_t v24 = v23;
  AMSCore::ExecuteHTTPRequestTask::Options::Options((uint64_t)v28, (uint64_t)v25);
  uint64_t v6 = operator new(0xC0uLL);
  v6[1] = 0;
  v6[2] = 0;
  void *v6 = &unk_1EDC84010;
  *(void *)&long long v18 = AMSCore::ExecuteHTTPRequestTask::Options::Options((uint64_t)(v6 + 3), (uint64_t)v28);
  *((void *)&v18 + 1) = v6;
  *(_OWORD *)long long v19 = 0u;
  *(_OWORD *)long long v20 = 0u;
  int v21 = 1065353216;
  __int16 v22 = 0;
  AMSCore::ExecuteHTTPRequestTask::Options::~Options((AMSCore::ExecuteHTTPRequestTask::Options *)v28);
  AMSCore::EncodeHTTPRequestTask::Options::Options((uint64_t)v16, (uint64_t)v7);
  long long v17 = v8;
  long long v8 = 0uLL;
  long long v9 = v18;
  v19[1] = 0;
  v19[0] = 0;
  long long v18 = 0uLL;
  std::vector<std::csub_match> __p = 0;
  uint64_t v11 = 0;
  char v12 = 0;
  uint64_t v13 = 0;
  int v14 = 1065353216;
  __int16 v15 = v22;
  if (v24)
  {
    if (v24 == v23)
    {
      uint64_t v27 = v26;
      (*(void (**)(void *, void *))(v23[0] + 24))(v23, v26);
    }
    else
    {
      uint64_t v27 = v24;
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v27 = 0;
  }
}

{
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  long long v20[27];

  uint64_t v5 = (char *)operator new(0x818uLL);
  uint64_t v6 = v5;
  *(void *)uint64_t v5 = AMSCore::ExecuteHTTPRequestTask::perform;
  *((void *)v5 + 1) = AMSCore::ExecuteHTTPRequestTask::perform;
  uint64_t v7 = v5 + 920;
  long long v8 = (uint64_t)(v5 + 1696);
  long long v9 = (uint64_t)(v5 + 16);
  uint64_t v10 = *(unsigned char *)(a2 + 384);
  if (v10)
  {
    AMSCore::EncodeHTTPRequestTask::Options::Options((uint64_t)(v5 + 920), a2);
    uint64_t v11 = *(void *)(a2 + 368);
    char v12 = (void *)(a2 + 376);
    uint64_t v13 = (void *)(a2 + 368);
    *((void *)v6 + 161) = v11;
    int v14 = v6 + 1296;
  }
  else
  {
    std::runtime_error::runtime_error((std::runtime_error *)(v5 + 920), (const std::runtime_error *)a2);
    __int16 v15 = (void *)(a2 + 40);
    uint64_t v16 = *(void *)(a2 + 40);
    *((_OWORD *)v7 + 1) = *(_OWORD *)(a2 + 16);
    *((void *)v6 + 115) = &unk_1EDC827D8;
    *((void *)v6 + 119) = *(void *)(a2 + 32);
    long long v17 = v6 + 960;
    *((void *)v6 + 120) = v16;
    long long v18 = *(void *)(a2 + 48);
    *((void *)v6 + 121) = v18;
    if (v18)
    {
      *(void *)(v16 + 16) = v17;
      *(void *)(a2 + 32) = v15;
      *__int16 v15 = 0;
      *(void *)(a2 + 48) = 0;
    }
    else
    {
      *((void *)v6 + 119) = v17;
    }
    long long v19 = *(void *)(a2 + 56);
    uint64_t v13 = (void *)(a2 + 56);
    *((void *)v6 + 122) = v19;
    int v14 = v6 + 984;
    char v12 = v13 + 1;
  }
  void *v14 = *v12;
  std::__shared_weak_count *v13 = 0;
  v13[1] = 0;
  v6[1304] = v10;
  AMSCore::ExecuteHTTPRequestTask::Options::Options(v8, a3);
  atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 1u);
  v6[24] = 0;
  v6[448] = 0;
  *((void *)v6 + 57) = 0;
  *((void *)v6 + 61) = 0;
  std::shared_ptr<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise>::shared_ptr[abi:fe180100]<AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise,AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise::get_return_object(void)::DetachPromise,void>(v20, v9);
}

void sub_18DB910EC(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void *std::__function::__func<AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask (*)(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount const> const&,AMSCore::LoadURLMetricsHandler::Options &&),std::allocator<AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask ()(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount const> const&,AMSCore::LoadURLMetricsHandler::Options &&)>,AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask ()(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount>,AMSCore::LoadURLMetricsHandler::Options &)>::target_type()
{
}

uint64_t std::__function::__func<AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask (*)(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount const> const&,AMSCore::LoadURLMetricsHandler::Options &&),std::allocator<AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask ()(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount const> const&,AMSCore::LoadURLMetricsHandler::Options &&)>,AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask ()(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount>,AMSCore::LoadURLMetricsHandler::Options &)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "PFN7AMSCore21LoadURLMetricsHandler25LoadURLMetricsHandlerTaskERKNS_11HTTPRequestERKNSt3__18expected"
                     "INS_12HTTPResponseENS_9HTTPErrorEEERKNS5_10shared_ptrIKNS_13IMediaAccountEEEONS0_7OptionsEE"
    || ((v3 & (unint64_t)"PFN7AMSCore21LoadURLMetricsHandler25LoadURLMetricsHandlerTaskERKNS_11HTTPRequestERKNSt3_"
                                "_18expectedINS_12HTTPResponseENS_9HTTPErrorEEERKNS5_10shared_ptrIKNS_13IMediaAccountEEEONS0_7OptionsEE" & 0x8000000000000000) != 0) != __OFSUB__(v3, "PFN7AMSCore21LoadURLMetricsHandler25LoadURLMetricsHandlerTaskERKNS_11HTTPRequestERKNSt3__18expectedINS_12HTTPResponseENS_9HTTPErrorEEERKNS5_10shared_ptrIKNS_13IMediaAccountEEEONS0_7OptionsEE")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"PFN7AMSCore21LoadURLMetricsHandler25LoadURLMetricsHandlerTaskERKNS_11HTTPRequestERKNSt3__18expectedINS_12HTTPResponseENS_9HTTPErrorEEERKNS5_10shared_ptrIKNS_13IMediaAccountEEEONS0_7OptionsEE" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask (*)(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount const> const&,AMSCore::LoadURLMetricsHandler::Options &&),std::allocator<AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask ()(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount const> const&,AMSCore::LoadURLMetricsHandler::Options &&)>,AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask ()(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount>,AMSCore::LoadURLMetricsHandler::Options &)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4, uint64_t a5)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, long long *, uint64_t))(a1 + 8);
  long long v7 = *a4;
  *(void *)a4 = 0;
  *((void *)a4 + 1) = 0;
  v5(a2, a3, &v7, a5);
  uint64_t v6 = (std::__shared_weak_count *)*((void *)&v7 + 1);
  if (*((void *)&v7 + 1))
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_18DB91244(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10)
  {
    if (!atomic_fetch_add(&a10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
      std::__shared_weak_count::__release_weak(a10);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask (*)(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount const> const&,AMSCore::LoadURLMetricsHandler::Options &&),std::allocator<AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask ()(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount const> const&,AMSCore::LoadURLMetricsHandler::Options &&)>,AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask ()(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount>,AMSCore::LoadURLMetricsHandler::Options &)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDC82B58;
  a2[1] = v2;
  return result;
}

void *std::__function::__func<AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask (*)(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount const> const&,AMSCore::LoadURLMetricsHandler::Options &&),std::allocator<AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask ()(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount const> const&,AMSCore::LoadURLMetricsHandler::Options &&)>,AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask ()(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount>,AMSCore::LoadURLMetricsHandler::Options &)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_1EDC82B58;
  result[1] = v3;
  return result;
}

void std::__function::__func<AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask (*)(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount const> const&,AMSCore::LoadURLMetricsHandler::Options &&),std::allocator<AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask ()(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount const> const&,AMSCore::LoadURLMetricsHandler::Options &&)>,AMSCore::LoadURLMetricsHandler::LoadURLMetricsHandlerTask ()(AMSCore::HTTPRequest const&,std::expected<AMSCore::HTTPResponse,AMSCore::HTTPError> const&,std::shared_ptr<AMSCore::IMediaAccount>,AMSCore::LoadURLMetricsHandler::Options &)>::~__func()
{
}

void sub_18DB91840(void *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  AMSCore::HTTPTransactionMetrics::~HTTPTransactionMetrics((void **)va);
  __cxa_begin_catch(a1);
  AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise::unhandled_exception(v2);
}

void sub_18DB91880()
{
}

void sub_18DB91888(_Unwind_Exception *a1)
{
  AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::ValuePromise::~ValuePromise(v4);
  AMSCore::ExecuteHTTPRequestTask::Options::~Options(v3);
  std::expected<AMSCore::EncodeHTTPRequestTask::Result,AMSCore::Error>::~expected[abi:fe180100](v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

std::runtime_error *AMSCore::ExecuteHTTPRequestTask::perform(std::runtime_error *result)
{
  uint64_t v1 = result[128].__vftable;
  if (LOBYTE(v1[18].~runtime_error))
  {
    uint64_t v2 = result;
    p_imp = &result[42].__imp_;
    uint64_t v4 = &result[31].__vftable;
    uint64_t v5 = &v1->~runtime_error_0;
    int what_low = LOBYTE(v1[17].what);
    if (LOBYTE(v1[17].what))
    {
      result[31] = *(std::runtime_error *)&v1->~runtime_error_0;
      *uint64_t v5 = 0;
      v1->what = 0;
      AMSCore::ExecuteHTTPRequestTask::Options::Options((uint64_t)&result[32], (uint64_t)&v1[1]);
      *(_OWORD *)&p_imp->__imp_ = *(_OWORD *)&v1[8].~runtime_error;
      v1[8].~runtime_error = 0;
      v1[8].~runtime_error_0 = 0;
    }
    else
    {
      std::__expected_base<AMSCore::HTTPResponse,AMSCore::HTTPError>::__union_t::__union_t[abi:fe180100]<AMSCore::HTTPError>(result + 31, (uint64_t)v5);
    }
    LOBYTE(v2[57].__vftable) = what_low;
    if (LOBYTE(v2[28].__vftable))
    {
      std::__expected_base<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::__repr::__destroy_union_member[abi:fe180100]((uint64_t)&v2[1].__imp_);
      LOBYTE(v2[28].__vftable) = 0;
      int what_low = LOBYTE(v2[57].__vftable);
    }
    if (what_low)
    {
      *(std::runtime_error *)((char *)v2 + 24) = v2[31];
      *uint64_t v4 = 0;
      v4[1] = 0;
      AMSCore::ExecuteHTTPRequestTask::Options::Options((uint64_t)&v2[2].__imp_, (uint64_t)&v2[32]);
      v2[13] = *(std::runtime_error *)&p_imp->__imp_;
      p_imp->__imp_ = 0;
      p_imp[1].__imp_ = 0;
    }
    else
    {
      std::__expected_base<AMSCore::HTTPResponse,AMSCore::HTTPError>::__union_t::__union_t[abi:fe180100]<AMSCore::HTTPError>((std::runtime_error *)((char *)v2 + 24), (uint64_t)v4);
    }
    LOBYTE(v2[27].__imp_.__imp_) = what_low;
    LOBYTE(v2[28].__vftable) = 1;
    std::__expected_base<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::__repr::__destroy_union_member[abi:fe180100]((uint64_t)v4);
    imp = v2[128].__imp_.__imp_;
    if (imp && !atomic_fetch_add((atomic_ullong *volatile)imp + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      long long v8 = (std::__shared_weak_count *)v2[128].__imp_.__imp_;
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
    long long v9 = (std::__shared_weak_count *)v2[127].__imp_.__imp_;
    if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
    AMSCore::ExecuteHTTPRequestTask::Options::~Options((AMSCore::ExecuteHTTPRequestTask::Options *)&v2[116].__imp_);
    uint64_t v10 = (std::__shared_weak_count *)v2[105].__imp_.__imp_;
    if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    AMSCore::EncodeHTTPRequestTask::Options::~Options((void **)&v2[82].__vftable);
    v2[31].__vftable = (std::runtime_error_vtbl *)&v2[1];
    v2->__vftable = 0;
    LOBYTE(v2[129].__vftable) = 1;
    return (std::runtime_error *)AMSCore::Task<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::Promise::Awaiter::await_suspend((uint64_t)v4);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void AMSCore::ExecuteHTTPRequestTask::perform(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 2064) & 1) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 2056);
    if (v2 && !atomic_fetch_add((atomic_ullong *volatile)(v2 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v3 = *(std::__shared_weak_count **)(a1 + 2056);
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
    uint64_t v4 = *(std::__shared_weak_count **)(a1 + 2040);
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    AMSCore::ExecuteHTTPRequestTask::Options::~Options((AMSCore::ExecuteHTTPRequestTask::Options *)(a1 + 1864));
    uint64_t v5 = *(std::__shared_weak_count **)(a1 + 1688);
    if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    AMSCore::EncodeHTTPRequestTask::Options::~Options((void **)(a1 + 1312));
  }
  uint64_t v6 = *(void *)(a1 + 488);
  if (v6 == a1 + 464)
  {
    (*(void (**)(uint64_t))(*(void *)(a1 + 464) + 32))(a1 + 464);
    if (!*(unsigned char *)(a1 + 448)) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 40))(v6);
  }
  if (*(unsigned char *)(a1 + 448)) {
LABEL_18:
  }
    std::__expected_base<AMSCore::ExecuteHTTPRequestTask::Result,AMSCore::HTTPError>::__repr::__destroy_union_member[abi:fe180100](a1 + 24);
LABEL_19:
  if (atomic_fetch_add(AMSCore::TaskCounter::getCount(void)::count, 0xFFFFFFFF) == 1) {
    MEMORY[0x192FA3E80](AMSCore::TaskCounter::getCount(void)::count);
  }
  AMSCore::ExecuteHTTPRequestTask::Options::~Options((AMSCore::ExecuteHTTPRequestTask::Options *)(a1 + 1696));
  if (*(unsigned char *)(a1 + 1304))
  {
    long long v7 = *(std::__shared_weak_count **)(a1 + 1296);
    if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    AMSCore::EncodeHTTPRequestTask::Options::~Options((void **)(a1 + 920));
  }
  else
  {
    (**(void (***)(uint64_t))(a1 + 920))(a1 + 920);
  }
  operator delete((void *)a1);
}

void *std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:fe180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AMSCore::overloaded<AMSCore::ExecuteHTTPRequestTask::operator<<(std::ostream &,AMSCore::ExecuteHTTPRequestTask::HandlerType const&)::$_0,AMSCore::ExecuteHTTPRequestTask::operator<<(std::ostream &,AMSCore::ExecuteHTTPRequestTask::HandlerType const&)::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,std::shared_ptr<AMSCore::ExecuteHTTPRequestTask::IHandler>,std::__variant_detail::_Trait<AMSCore::ExecuteHTTPRequestTask::AnonymousHandler>> const&>(uint64_t a1)
{
  return std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(*(void **)(*(void *)a1 + 8), (uint64_t)"AnonymousHandler", 16);
}

void *std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:fe180100]<std::__variant_detail::__visitation::__variant::__value_visitor<AMSCore::overloaded<AMSCore::ExecuteHTTPRequestTask::operator<<(std::ostream &,AMSCore::ExecuteHTTPRequestTask::HandlerType const&)::$_0,AMSCore::ExecuteHTTPRequestTask::operator<<(std::ostream &,AMSCore::ExecuteHTTPRequestTask::HandlerType const&)::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,std::shared_ptr<AMSCore::ExecuteHTTPRequestTask::IHandler>,std::__variant_detail::_Trait<AMSCore::ExecuteHTTPRequestTask::AnonymousHandler>> const&>(void ***a1)
{
  return std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(**a1, (uint64_t)"IHandler::SPtr", 14);
}

uint64_t AMSCore::URL::decode(std::string *a1, uint64_t a2, unint64_t a3)
{
  uint64_t result = std::ostringstream::basic_ostringstream[abi:fe180100]((uint64_t)&v30);
  if (a3)
  {
    unint64_t v6 = 0;
    while (1)
    {
      int v7 = *(unsigned __int8 *)(a2 + v6);
      if (v7 == 43)
      {
        LOBYTE(v24.__vftable) = 32;
        uint64_t result = (uint64_t)std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(&v30, (uint64_t)&v24, 1);
        goto LABEL_4;
      }
      if (a3 - v6 >= 3 && v7 == 37) {
        break;
      }
LABEL_57:
      if (a3 <= v6)
      {
        __break(1u);
        return result;
      }
      LOBYTE(v24.__vftable) = *(unsigned char *)(a2 + v6);
      uint64_t result = (uint64_t)std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(&v30, (uint64_t)&v24, 1);
LABEL_4:
      if (++v6 >= a3) {
        goto LABEL_60;
      }
    }
    long long v8 = (unsigned __int8 *)(a2 + v6 + 1);
    uint64_t v9 = 2;
    if (a3 - (v6 + 1) < 2) {
      uint64_t v9 = a3 - (v6 + 1);
    }
    v40[0] = a2 + v6 + 1;
    v40[1] = v9;
    uint64_t v10 = &v8[v9];
    if (v9)
    {
      int v11 = *v8;
      if (v11 == 48)
      {
        if (v9 == 1) {
          goto LABEL_24;
        }
        char v12 = v8 + 1;
        int v11 = v8[1];
        if (v11 == 48)
        {
          char v12 = v10;
          goto LABEL_15;
        }
      }
      else
      {
        char v12 = (unsigned __int8 *)(a2 + v6 + 1);
      }
      if (v12 != v10)
      {
        unsigned __int8 v13 = v11 - 48;
        if ((v11 - 48) >= 0xA)
        {
          if ((v11 - 65) > 0x25 || ((1 << (v11 - 65)) & 0x3F0000003FLL) == 0)
          {
LABEL_15:
            if (v12 == v8) {
              goto LABEL_47;
            }
LABEL_25:
            char v14 = 0;
            if (v10 == v12) {
              goto LABEL_53;
            }
            goto LABEL_47;
          }
          if ((v11 - 97) > 5) {
            unsigned __int8 v13 = v11 - 55;
          }
          else {
            unsigned __int8 v13 = v11 - 87;
          }
        }
        __int16 v15 = v12 + 1;
        if (v12 + 1 == v10)
        {
          unsigned __int8 v18 = 0;
          __int16 v15 = v10;
          unsigned __int8 v19 = v13;
        }
        else
        {
          int v16 = *v15;
          unsigned __int8 v17 = v16 - 48;
          if ((v16 - 48) >= 0xA)
          {
            if ((v16 - 97) > 5)
            {
              if ((v16 - 65) > 5)
              {
                unsigned __int8 v18 = 0;
                unsigned __int8 v19 = v13;
                goto LABEL_40;
              }
              unsigned __int8 v18 = v16 - 55;
            }
            else
            {
              unsigned __int8 v18 = v16 - 87;
            }
          }
          else
          {
            unsigned __int8 v18 = v16 - 48;
          }
          unsigned __int8 v19 = 16 * v13;
          long long v20 = v12 + 2;
          if ((v13 & 0xF0) == 0) {
            __int16 v15 = v20;
          }
          if (v15 != v10)
          {
            int v16 = *v15;
            unsigned __int8 v17 = v16 - 48;
LABEL_40:
            if (v17 < 0xAu
              || (v16 - 97) < 6u
              || (v16 - 65) < 6
              || (((v19 + v18) >> 8) & 1) != 0)
            {
              goto LABEL_47;
            }
            goto LABEL_46;
          }
          __int16 v15 = v10;
          if ((((16 * v13) + v18) & 0x100) != 0) {
            goto LABEL_47;
          }
        }
LABEL_46:
        char v14 = v18 + v19;
        if (v10 == v15)
        {
LABEL_53:
          LOBYTE(v24.__vftable) = v14;
          char v29 = 1;
          goto LABEL_54;
        }
LABEL_47:
        AMSCore::Unexpected<AMSCore::Error,AMSCore::ErrorCode,char const(&)[42],std::string_view &>((uint64_t)&v34, 3u, "Failed to parse value as number. value = ", v40);
        std::runtime_error::runtime_error(&v24, &v34);
        long long v25 = v35;
        int v21 = (unsigned int *)v37;
        v24.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
        uint64_t v26 = v36;
        v27[0] = v37;
        v27[1] = v38;
        if (v38)
        {
          *(void *)(v37 + 16) = v27;
          int v21 = 0;
          uint64_t v36 = &v37;
          uint64_t v37 = 0;
          uint64_t v38 = 0;
        }
        else
        {
          uint64_t v26 = v27;
        }
        long long v28 = v39;
        long long v39 = 0uLL;
        char v29 = 0;
        v34.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
        std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v36, v21);
        MEMORY[0x192FA3C30](&v34);
        if (!v29)
        {
          int v22 = 1;
LABEL_56:
          uint64_t result = ((uint64_t (*)(std::runtime_error *))v24.~runtime_error)(&v24);
          if (!v22) {
            goto LABEL_4;
          }
          goto LABEL_57;
        }
        char v14 = (char)v24.__vftable;
LABEL_54:
        LOBYTE(v34.__vftable) = v14;
        uint64_t result = (uint64_t)std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(&v30, (uint64_t)&v34, 1);
        v6 += 2;
        if (v29) {
          goto LABEL_4;
        }
        int v22 = 0;
        goto LABEL_56;
      }
    }
LABEL_24:
    char v12 = v10;
    if (v10 == v8) {
      goto LABEL_47;
    }
    goto LABEL_25;
  }
LABEL_60:
  std::stringbuf::str[abi:fe180100]((uint64_t)v31, a1);
  uint64_t v30 = *MEMORY[0x1E4FBA418];
  *(void *)((char *)&v31[-1] + *(void *)(v30 - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v31[0] = MEMORY[0x1E4FBA470] + 16;
  if (v32 < 0) {
    operator delete((void *)v31[8]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x192FA3FD0](&v33);
}

void AMSCore::URL::encode(void *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = std::locale::classic();
  int v7 = std::locale::use_facet(v6, MEMORY[0x1E4FBA258]);
  if (a3)
  {
    long long v8 = v7;
    uint64_t v9 = (std::string::value_type *)a2;
    do
    {
      if ((*v9 & 0x80000000) == 0 && (*((_DWORD *)&v8[1].~facet + *v9) & 0x500) != 0
        || (int v10 = *v9, (v10 - 45) < 2)
        || v10 == 126
        || v10 == 95)
      {
        __p.__r_.__value_.__s.__data_[0] = *v9;
        std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(a1, (uint64_t)&__p, 1);
      }
      else
      {
        __p.__r_.__value_.__s.__data_[0] = 37;
        int v11 = std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(a1, (uint64_t)&__p, 1);
        AMSCore::StringUtils::toHexString(&__p, a2, 1);
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
        std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v11, (uint64_t)p_p, size);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
      ++v9;
      ++a2;
      --a3;
    }
    while (a3);
  }
}

void AMSCore::URL::getLastPathComponent(AMSCore::URL *this, uint64_t a2)
{
  v15.__r_.__value_.__s.__data_[0] = 0;
  char v16 = 0;
  if (!*(unsigned char *)(a2 + 88))
  {
    *(unsigned char *)this = 0;
    *((unsigned char *)this + 24) = 0;
    return;
  }
  if (*(char *)(a2 + 87) < 0) {
    std::string::__init_copy_ctor_external(&v15, *(const std::string::value_type **)(a2 + 64), *(void *)(a2 + 72));
  }
  else {
    std::string v15 = *(std::string *)(a2 + 64);
  }
  char v16 = 1;
  if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v3 = &v15;
  }
  else {
    uint64_t v3 = (std::string *)v15.__r_.__value_.__r.__words[0];
  }
  if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v15.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v15.__r_.__value_.__l.__size_;
  }
  AMSCore::StringUtils::split(&v13, (uint64_t)v3, size, "/", 1, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v5 = v13;
  if (v13 != v14)
  {
    size_t v6 = *((void *)v14 - 1);
    if (v6 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:fe180100]();
    }
    int v7 = (const void *)*((void *)v14 - 2);
    if (v6 >= 0x17)
    {
      uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v6 | 7) != 0x17) {
        uint64_t v9 = v6 | 7;
      }
      uint64_t v10 = v9 + 1;
      long long v8 = (long long *)operator new(v9 + 1);
      *((void *)&v11 + 1) = v6;
      unint64_t v12 = v10 | 0x8000000000000000;
      *(void *)&long long v11 = v8;
    }
    else
    {
      HIBYTE(v12) = *((void *)v14 - 1);
      long long v8 = &v11;
      if (!v6)
      {
LABEL_23:
        *((unsigned char *)v8 + v6) = 0;
        *(_OWORD *)this = v11;
        uint64_t v5 = v13;
        *((void *)this + 2) = v12;
        *((unsigned char *)this + 24) = 1;
        if (!v5) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
    }
    memmove(v8, v7, v6);
    goto LABEL_23;
  }
  *(unsigned char *)this = 0;
  *((unsigned char *)this + 24) = 0;
  if (v5) {
LABEL_24:
  }
    operator delete(v5);
LABEL_25:
  if (v16)
  {
    if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v15.__r_.__value_.__l.__data_);
    }
  }
}

void sub_18DB924F8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  if (a21)
  {
    if (a20 < 0)
    {
      operator delete(__p);
      __clang_call_terminate(a1);
    }
  }
  __clang_call_terminate(a1);
}

uint64_t AMSCore::URL::getStringRepresentation@<X0>(AMSCore::URL *this@<X0>, std::string *a2@<X8>)
{
  std::ostringstream::basic_ostringstream[abi:fe180100]((uint64_t)&v5);
  AMSCore::operator<<(&v5, (uint64_t)this);
  std::stringbuf::str[abi:fe180100]((uint64_t)v6, a2);
  uint64_t v5 = *MEMORY[0x1E4FBA418];
  *(void *)((char *)&v6[-1] + *(void *)(v5 - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v6[0] = MEMORY[0x1E4FBA470] + 16;
  if (v7 < 0) {
    operator delete((void *)v6[8]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x192FA3FD0](&v8);
}

void sub_18DB9265C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL AMSCore::URL::isInDomain(uint64_t a1, char *a2, unint64_t a3)
{
  if (!*(unsigned char *)(a1 + 56)) {
    return 0;
  }
  if (*(char *)(a1 + 55) < 0)
  {
    uint64_t v5 = *(char **)(a1 + 32);
    unint64_t v6 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v5 = (char *)(a1 + 32);
    unint64_t v6 = *(unsigned __int8 *)(a1 + 55);
  }
  unint64_t v8 = v6;
  do
  {
    if (!v8)
    {
      std::string::size_type v10 = 0;
      long long v11 = 0;
      goto LABEL_18;
    }
    int v9 = v5[--v8];
  }
  while (v9 == 46);
  if (v6 >= v8 + 1) {
    unint64_t v6 = v8 + 1;
  }
  if (v8 == -1) {
    std::string::size_type v10 = 0;
  }
  else {
    std::string::size_type v10 = v6;
  }
  if (v8 == -1) {
    long long v11 = 0;
  }
  else {
    long long v11 = v5;
  }
LABEL_18:
  AMSCore::StringUtils::lowercase((uint64_t)&__p, v11, v10);
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*((unsigned char *)&__p.__r_.__value_.__s + 23))
    {
      p_p = &__p;
      goto LABEL_23;
    }
LABEL_24:
    AMSCore::StringUtils::join<char [2],std::string>(&v30, ".", (uint64_t)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::string __p = v30;
    goto LABEL_27;
  }
  if (!__p.__r_.__value_.__l.__size_) {
    goto LABEL_24;
  }
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
LABEL_23:
  if (p_p->__r_.__value_.__s.__data_[0] != 46) {
    goto LABEL_24;
  }
LABEL_27:
  unint64_t v13 = a3;
  do
  {
    if (!v13)
    {
      std::string::size_type v16 = 0;
      unsigned __int8 v17 = 0;
      goto LABEL_40;
    }
    int v14 = a2[--v13];
  }
  while (v14 == 46);
  if (a3 >= v13 + 1) {
    std::string::size_type v15 = v13 + 1;
  }
  else {
    std::string::size_type v15 = a3;
  }
  if (v13 == -1) {
    std::string::size_type v16 = 0;
  }
  else {
    std::string::size_type v16 = v15;
  }
  if (v13 == -1) {
    unsigned __int8 v17 = 0;
  }
  else {
    unsigned __int8 v17 = a2;
  }
LABEL_40:
  AMSCore::StringUtils::lowercase((uint64_t)&v28, v17, v16);
  LOBYTE(v18) = *((unsigned char *)&v28.__r_.__value_.__s + 23);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
  {
    if (v28.__r_.__value_.__l.__size_)
    {
      unsigned __int8 v19 = (std::string *)v28.__r_.__value_.__r.__words[0];
LABEL_45:
      if (v19->__r_.__value_.__s.__data_[0] == 46) {
        goto LABEL_49;
      }
    }
  }
  else if (*((unsigned char *)&v28.__r_.__value_.__s + 23))
  {
    unsigned __int8 v19 = &v28;
    goto LABEL_45;
  }
  AMSCore::StringUtils::join<char [2],std::string>(&v30, ".", (uint64_t)&v28);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28.__r_.__value_.__l.__data_);
  }
  std::string v28 = v30;
  std::string::size_type v18 = HIBYTE(v30.__r_.__value_.__r.__words[2]);
LABEL_49:
  if ((v18 & 0x80u) == 0) {
    size_t size = v18;
  }
  else {
    size_t size = v28.__r_.__value_.__l.__size_;
  }
  std::string::size_type v21 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  char v22 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v21 = __p.__r_.__value_.__l.__size_;
  }
  BOOL v23 = v21 >= size;
  std::string::size_type v24 = v21 - size;
  if (v23)
  {
    long long v25 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      long long v25 = &__p;
    }
    if ((v18 & 0x80u) == 0) {
      uint64_t v26 = &v28;
    }
    else {
      uint64_t v26 = (std::string *)v28.__r_.__value_.__r.__words[0];
    }
    BOOL v7 = memcmp((char *)v25 + v24, v26, size) == 0;
    if ((v18 & 0x80) == 0) {
      goto LABEL_64;
    }
  }
  else
  {
    BOOL v7 = 0;
    if ((v18 & 0x80) == 0) {
      goto LABEL_64;
    }
  }
  operator delete(v28.__r_.__value_.__l.__data_);
  char v22 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
LABEL_64:
  if (v22 < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v7;
}

void sub_18DB92B50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void AMSCore::URL::parse(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v202[2] = *MEMORY[0x1E4F143B8];
  memset(&v171, 0, sizeof(v171));
  AMSCore::StringUtils::split((char **)&__p, a1, a2, "://", 3, 1uLL);
  unint64_t v6 = (uint64_t *)__p;
  unint64_t v7 = v170 - (void)__p;
  uint64_t v8 = (uint64_t)(v170 - (void)__p) >> 4;
  if (v8 == 1)
  {
    char v9 = 5;
    *((unsigned char *)&v171.__r_.__value_.__s + 23) = 5;
    strcpy((char *)&v171, "https");
    if ((void *)v170 == __p) {
      goto LABEL_269;
    }
  }
  else
  {
    if (v8 != 2)
    {
      std::ostringstream::basic_ostringstream[abi:fe180100]((uint64_t)v184);
      std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v184, (uint64_t)"Failed to parse the URL. url = ", 31);
      std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v184, a1, a2);
      std::stringbuf::str[abi:fe180100]((uint64_t)&v184[8], (std::string *)__what_arg);
      *(void *)v184 = *MEMORY[0x1E4FBA418];
      *(void *)&v184[*(void *)(*(void *)v184 - 24)] = *(void *)(MEMORY[0x1E4FBA418] + 24);
      *(void *)&v184[8] = MEMORY[0x1E4FBA470] + 16;
      if (v190 < 0) {
        operator delete(v188);
      }
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x192FA3FD0](v192);
      v203.__cat_ = (const std::error_category *)&AMSCore::Error::Category::generic(void)::instance;
      *(void *)&v203.__val_ = 3;
      std::system_error::system_error((std::system_error *)v184, v203, (const std::string *)__what_arg);
      if ((__what_arg[23] & 0x80000000) != 0) {
        operator delete(*(void **)__what_arg);
      }
      uint64_t v186 = 0;
      v185 = 0;
      *(void *)v184 = &unk_1EDC827D8;
      *(void *)&v184[32] = &v185;
      long long v187 = 0uLL;
      std::runtime_error::runtime_error(&v152, (const std::runtime_error *)v184);
      long long v153 = *(_OWORD *)&v184[16];
      long long v35 = v185;
      v152.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
      v154 = *(unsigned int ***)&v184[32];
      v155 = v185;
      uint64_t v156 = v186;
      if (v186)
      {
        *((void *)v185 + 2) = &v155;
        long long v35 = 0;
        *(void *)&v184[32] = &v185;
        v185 = 0;
        uint64_t v186 = 0;
      }
      else
      {
        v154 = &v155;
      }
      long long v157 = v187;
      long long v187 = 0uLL;
      *(void *)v184 = &unk_1EDC827D8;
      std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v184[32], v35);
      MEMORY[0x192FA3C30](v184);
      std::runtime_error::runtime_error(&v130, &v152);
      long long v131 = v153;
      uint64_t v36 = v155;
      v130.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
      v132 = v154;
      v133 = v155;
      uint64_t v134 = v156;
      if (v156)
      {
        *((void *)v155 + 2) = &v133;
        uint64_t v36 = 0;
        v154 = &v155;
        v155 = 0;
        uint64_t v156 = 0;
      }
      else
      {
        v132 = &v133;
      }
      long long v135 = v157;
      long long v157 = 0uLL;
      char v151 = 0;
      v152.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
      std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v154, v36);
      MEMORY[0x192FA3C30](&v152);
      if (v6) {
        goto LABEL_172;
      }
      goto LABEL_173;
    }
    std::string::__assign_external(&v171, *(const std::string::value_type **)__p, *((void *)__p + 1));
    if (v7 <= 0x10) {
      goto LABEL_269;
    }
    v6 += 2;
    char v9 = HIBYTE(v171.__r_.__value_.__r.__words[2]);
  }
  uint64_t v10 = *v6;
  unint64_t v11 = v6[1];
  v184[0] = 0;
  LOBYTE(v188) = 0;
  v189[0] = 0;
  char v191 = 0;
  v192[0] = 0;
  v192[24] = 0;
  v192[32] = 0;
  v192[56] = 0;
  v192[64] = 0;
  v192[66] = 0;
  v193[0] = v193;
  v193[1] = v193;
  *(void *)v194 = v171.__r_.__value_.__l.__size_;
  std::string::size_type v12 = v171.__r_.__value_.__r.__words[0];
  *(void *)&v194[7] = *(std::string::size_type *)((char *)&v171.__r_.__value_.__r.__words[1] + 7);
  memset(&v171, 0, sizeof(v171));
  v193[2] = 0;
  v193[3] = v12;
  char v195 = v9;
  std::__optional_move_base<AMSCore::Error,false>::__optional_move_base[abi:fe180100]((AMSCore::Error *)&v152, (uint64_t)v184);
  AMSCore::URL::URL(&v159, (const AMSCore::URL *)v189);
  AMSCore::URL::~URL((AMSCore::URL *)v189);
  if ((_BYTE)v188)
  {
    *(void *)v184 = &unk_1EDC827D8;
    unint64_t v13 = (std::__shared_weak_count *)*((void *)&v187 + 1);
    if (*((void *)&v187 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v187 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
    std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v184[32], v185);
    MEMORY[0x192FA3C30](v184);
  }
  int v14 = (char)v168;
  std::string::size_type v15 = (char *)v167[0];
  if ((v168 & 0x80u) == 0) {
    std::string::size_type v16 = (char *)v167;
  }
  else {
    std::string::size_type v16 = (char *)v167[0];
  }
  if ((v168 & 0x80u) == 0) {
    uint64_t v17 = v168;
  }
  else {
    uint64_t v17 = v167[1];
  }
  std::string::size_type v18 = std::locale::classic();
  unsigned __int8 v19 = std::locale::use_facet(v18, MEMORY[0x1E4FBA258]);
  if (v17 != 4) {
    goto LABEL_33;
  }
  long long v20 = v19;
  int v21 = ((uint64_t (*)(const std::locale::facet *, void))v19->__vftable[1].__on_zero_shared)(v19, *v16);
  if (v21 != ((unsigned int (*)(const std::locale::facet *, uint64_t))v20->__vftable[1].__on_zero_shared)(v20, 102))goto LABEL_33; {
  char v22 = (char *)v167 + 1;
  }
  if (v14 < 0) {
    char v22 = v15 + 1;
  }
  int v23 = ((uint64_t (*)(const std::locale::facet *, void))v20->__vftable[1].__on_zero_shared)(v20, *v22);
  if (v23 != ((unsigned int (*)(const std::locale::facet *, uint64_t))v20->__vftable[1].__on_zero_shared)(v20, 105))goto LABEL_33; {
  std::string::size_type v24 = v15 + 2;
  }
  if (v14 >= 0) {
    std::string::size_type v24 = (char *)v167 + 2;
  }
  int v25 = ((uint64_t (*)(const std::locale::facet *, void))v20->__vftable[1].__on_zero_shared)(v20, *v24);
  if (v25 != ((unsigned int (*)(const std::locale::facet *, uint64_t))v20->__vftable[1].__on_zero_shared)(v20, 108))goto LABEL_33; {
  uint64_t v26 = v15 + 3;
  }
  if (v14 >= 0) {
    uint64_t v26 = (char *)v167 + 3;
  }
  int v27 = ((uint64_t (*)(const std::locale::facet *, void))v20->__vftable[1].__on_zero_shared)(v20, *v26);
  if (v27 != ((unsigned int (*)(const std::locale::facet *, uint64_t))v20->__vftable[1].__on_zero_shared)(v20, 101))
  {
LABEL_33:
    AMSCore::StringUtils::split((char **)v184, v10, v11, "#", 1, 1uLL);
    if (__p)
    {
      *(void *)&long long v170 = __p;
      operator delete(__p);
    }
    uint64_t v31 = *(void *)v184;
    uint64_t v32 = *(void *)&v184[8];
    std::string __p = *(void **)v184;
    if (*(void *)&v184[8] - *(void *)v184 == 32)
    {
      AMSCore::URL::decode((std::string *)v184, *(void *)(*(void *)v184 + 16), *(void *)(*(void *)v184 + 24));
      std::string::size_type v33 = *(void *)v184;
      v202[0] = *(void *)&v184[8];
      *(void *)((char *)v202 + 7) = *(void *)&v184[15];
      char v34 = v184[23];
      memset(v184, 0, 24);
      if (v160)
      {
        if (SHIBYTE(v159.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v159.__r_.__value_.__l.__data_);
          v159.__r_.__value_.__r.__words[0] = v33;
          v159.__r_.__value_.__l.__size_ = v202[0];
          *(std::string::size_type *)((char *)&v159.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v202 + 7);
          *((unsigned char *)&v159.__r_.__value_.__s + 23) = v34;
          if ((v184[23] & 0x80000000) != 0) {
            operator delete(*(void **)v184);
          }
        }
        else
        {
          v159.__r_.__value_.__r.__words[0] = v33;
          v159.__r_.__value_.__l.__size_ = v202[0];
          *(std::string::size_type *)((char *)&v159.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v202 + 7);
          *((unsigned char *)&v159.__r_.__value_.__s + 23) = v34;
        }
      }
      else
      {
        v159.__r_.__value_.__r.__words[0] = v33;
        v159.__r_.__value_.__l.__size_ = v202[0];
        *(std::string::size_type *)((char *)&v159.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v202 + 7);
        *((unsigned char *)&v159.__r_.__value_.__s + 23) = v34;
        v202[0] = 0;
        *(void *)((char *)v202 + 7) = 0;
        char v160 = 1;
      }
    }
    if (v32 == v31) {
      goto LABEL_269;
    }
    AMSCore::StringUtils::split((char **)v184, *(void *)v31, *(void *)(v31 + 8), "?", 1, 1uLL);
    operator delete((void *)v31);
    uint64_t v37 = *(uint64_t **)v184;
    std::string __p = *(void **)v184;
    long long v170 = *(_OWORD *)&v184[8];
    uint64_t v38 = *(uint64_t **)&v184[8];
    if (*(void *)&v184[8] - *(void *)v184 == 32)
    {
      uint64_t v39 = *(void *)(*(void *)v184 + 16);
      unint64_t v40 = *(void *)(*(void *)v184 + 24);
      AMSCore::StringUtils::split((char **)&v181, v39, v40, "&", 1, 0xFFFFFFFFFFFFFFFFLL);
      long long v41 = (void **)v181;
      long long v42 = v182;
      if (v181 != v182)
      {
        *(void *)v176 = v176;
        *(_OWORD *)&v176[8] = (unint64_t)v176;
        while (1)
        {
          AMSCore::StringUtils::split((char **)&v174, (uint64_t)*v41, (unint64_t)v41[1], "=", 1, 1uLL);
          long long v43 = v174;
          unint64_t v44 = v175 - (unsigned char *)v174;
          if (v175 == v174) {
            goto LABEL_269;
          }
          AMSCore::URL::decode(&__sz, *(void *)v174, *((void *)v174 + 1));
          *(_DWORD *)((char *)v172 + 3) = 0;
          v172[0] = 0;
          if (v44 < 0x11)
          {
            char v47 = 0;
            std::string::size_type v46 = 0;
            long long v45 = 0;
            if ((SHIBYTE(__sz.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_62:
              *(std::string *)v184 = __sz;
              goto LABEL_65;
            }
          }
          else
          {
            AMSCore::URL::decode((std::string *)v184, v43[2], v43[3]);
            long long v45 = *(std::string::value_type **)v184;
            std::string::size_type v46 = *(void *)&v184[8];
            char v47 = v184[23];
            v172[0] = *(_DWORD *)&v184[16];
            *(_DWORD *)((char *)v172 + 3) = *(_DWORD *)&v184[19];
            if ((SHIBYTE(__sz.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
              goto LABEL_62;
            }
          }
          std::string::__init_copy_ctor_external((std::string *)v184, __sz.__r_.__value_.__l.__data_, __sz.__r_.__value_.__l.__size_);
LABEL_65:
          if (v47 < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)&v184[24], v45, v46);
          }
          else
          {
            *(void *)&v184[24] = v45;
            *(void *)&v184[32] = v46;
            LODWORD(v185) = v172[0];
            *(_DWORD *)((char *)&v185 + 3) = *(_DWORD *)((char *)v172 + 3);
            HIBYTE(v185) = v47;
          }
          _ZNSt3__14listINS_4pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES7_EENS5_IS8_EEE9remove_ifIZN7AMSCore10OrderedMapIS7_S7_E5eraseERKS7_EUlRT_E_EEmSH_(v176, (unsigned __int8 **)v184);
          long long v48 = operator new(0x40uLL);
          v48[1] = *(_OWORD *)v184;
          *((void *)v48 + 4) = *(void *)&v184[16];
          memset(v184, 0, 24);
          *(_OWORD *)((char *)v48 + 40) = *(_OWORD *)&v184[24];
          *((void *)v48 + 7) = v185;
          *(void *)&v184[24] = 0;
          *(void *)&v184[32] = 0;
          v185 = 0;
          uint64_t v49 = *(void *)v176;
          *(void *)long long v48 = *(void *)v176;
          *((void *)v48 + 1) = v176;
          *(void *)(v49 + 8) = v48;
          *(void *)v176 = v48;
          ++*(void *)&v176[16];
          if (SHIBYTE(v185) < 0)
          {
            operator delete(*(void **)&v184[24]);
            if ((v184[23] & 0x80000000) == 0)
            {
LABEL_70:
              if ((v47 & 0x80) == 0) {
                goto LABEL_71;
              }
              goto LABEL_76;
            }
          }
          else if ((v184[23] & 0x80000000) == 0)
          {
            goto LABEL_70;
          }
          operator delete(*(void **)v184);
          if ((v47 & 0x80) == 0)
          {
LABEL_71:
            if ((SHIBYTE(__sz.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
              goto LABEL_72;
            }
            goto LABEL_77;
          }
LABEL_76:
          operator delete(v45);
          if ((SHIBYTE(__sz.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
LABEL_72:
            char v50 = v174;
            if (!v174) {
              goto LABEL_58;
            }
LABEL_78:
            operator delete(v50);
            goto LABEL_58;
          }
LABEL_77:
          operator delete(__sz.__r_.__value_.__l.__data_);
          char v50 = v174;
          if (v174) {
            goto LABEL_78;
          }
LABEL_58:
          v41 += 2;
          if (v41 == v42)
          {
            *(void *)std::string __what_arg = __what_arg;
            *(void *)&__what_arg[8] = __what_arg;
            *(void *)&__what_arg[16] = 0;
            uint64_t v51 = *(void *)&v176[16];
            if (*(void *)&v176[16])
            {
              uint64_t v52 = *(void **)&v176[8];
              uint64_t v53 = *(void *)v176;
              uint64_t v54 = **(void **)&v176[8];
              *(void *)(v54 + 8) = *(void *)(*(void *)v176 + 8);
              **(void **)(v53 + 8) = v54;
              uint64_t v55 = *(void *)__what_arg;
              *(void *)(*(void *)__what_arg + 8) = v52;
              *uint64_t v52 = v55;
              *(void *)(v53 + 8) = __what_arg;
              *(void *)std::string __what_arg = v53;
              *(void *)&__what_arg[16] = v51;
            }
            unsigned __int8 v201 = 1;
            long long v41 = (void **)v181;
            if (v181) {
              goto LABEL_82;
            }
            goto LABEL_83;
          }
        }
      }
      std::ostringstream::basic_ostringstream[abi:fe180100]((uint64_t)v184);
      std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v184, (uint64_t)"Received invalid query parameters. parameters = ", 48);
      std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v184, v39, v40);
      std::stringbuf::str[abi:fe180100]((uint64_t)&v184[8], (std::string *)v176);
      *(void *)v184 = *MEMORY[0x1E4FBA418];
      *(void *)&v184[*(void *)(*(void *)v184 - 24)] = *(void *)(MEMORY[0x1E4FBA418] + 24);
      *(void *)&v184[8] = MEMORY[0x1E4FBA470] + 16;
      if (v190 < 0) {
        operator delete(v188);
      }
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x192FA3FD0](v192);
      v204.__cat_ = (const std::error_category *)&AMSCore::Error::Category::generic(void)::instance;
      *(void *)&v204.__val_ = 3;
      std::system_error::system_error((std::system_error *)v184, v204, (const std::string *)v176);
      if ((v176[23] & 0x80000000) != 0) {
        operator delete(*(void **)v176);
      }
      uint64_t v186 = 0;
      v185 = 0;
      *(void *)v184 = &unk_1EDC827D8;
      *(void *)&v184[32] = &v185;
      long long v187 = 0uLL;
      std::runtime_error::runtime_error((std::runtime_error *)v176, (const std::runtime_error *)v184);
      *(_OWORD *)&v176[16] = *(_OWORD *)&v184[16];
      char v65 = v185;
      *(void *)v176 = &unk_1EDC827D8;
      v177 = *(unsigned int ***)&v184[32];
      v178 = v185;
      uint64_t v179 = v186;
      if (v186)
      {
        *((void *)v185 + 2) = &v178;
        char v65 = 0;
        *(void *)&v184[32] = &v185;
        v185 = 0;
        uint64_t v186 = 0;
      }
      else
      {
        v177 = &v178;
      }
      long long v180 = v187;
      long long v187 = 0uLL;
      *(void *)v184 = &unk_1EDC827D8;
      std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v184[32], v65);
      MEMORY[0x192FA3C30](v184);
      std::runtime_error::runtime_error((std::runtime_error *)__what_arg, (const std::runtime_error *)v176);
      *(_OWORD *)&__what_arg[16] = *(_OWORD *)&v176[16];
      uint64_t v67 = v178;
      *(void *)std::string __what_arg = &unk_1EDC827D8;
      v197 = v177;
      v198 = v178;
      uint64_t v199 = v179;
      if (v179)
      {
        *((void *)v178 + 2) = &v198;
        uint64_t v67 = 0;
        v177 = &v178;
        v178 = 0;
        uint64_t v179 = 0;
      }
      else
      {
        v197 = &v198;
      }
      long long v200 = v180;
      long long v180 = 0uLL;
      unsigned __int8 v201 = 0;
      *(void *)v176 = &unk_1EDC827D8;
      std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v177, v67);
      MEMORY[0x192FA3C30](v176);
      if (v41) {
LABEL_82:
      }
        operator delete(v41);
LABEL_83:
      int v56 = v201;
      if (v201)
      {
        v181 = &v181;
        v182 = &v181;
        uint64_t v183 = 0;
        uint64_t v57 = *(void *)&__what_arg[16];
        if (*(void *)&__what_arg[16])
        {
          long long v58 = *(_OWORD *)__what_arg;
          uint64_t v59 = **(void **)&__what_arg[8];
          *(void *)(v59 + 8) = *(void *)(*(void *)__what_arg + 8);
          **(void **)(v58 + 8) = v59;
          char v60 = v181;
          *((void *)v181 + 1) = *((void *)&v58 + 1);
          **((void **)&v58 + 1) = v60;
          *(void *)(v58 + 8) = &v181;
          v181 = (void *)v58;
          uint64_t v183 = v57;
          *(void *)&__what_arg[16] = 0;
        }
        std::list<std::pair<std::string,std::string>>::__move_assign(v166, (char *)&v181);
        if (v183)
        {
          uint64_t v61 = v182;
          char v62 = (void **)v181;
          char v63 = *v182;
          v63[1] = *((void *)v181 + 1);
          *v62[1] = v63;
          uint64_t v183 = 0;
          if (v61 != &v181)
          {
            do
            {
              char v64 = (void **)v61[1];
              if (*((char *)v61 + 63) < 0)
              {
                operator delete(v61[5]);
                if (*((char *)v61 + 39) < 0) {
                  goto LABEL_93;
                }
              }
              else if (*((char *)v61 + 39) < 0)
              {
LABEL_93:
                operator delete(v61[2]);
              }
              operator delete(v61);
              uint64_t v61 = v64;
            }
            while (v64 != &v181);
          }
        }
      }
      else
      {
        AMSCore::Unexpected<AMSCore::Error,AMSCore::Error&>((uint64_t)v184, (const std::runtime_error *)__what_arg);
        std::runtime_error::runtime_error(&v130, (const std::runtime_error *)v184);
        long long v131 = *(_OWORD *)&v184[16];
        char v66 = v185;
        v130.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
        v132 = *(unsigned int ***)&v184[32];
        v133 = v185;
        uint64_t v134 = v186;
        if (v186)
        {
          *((void *)v185 + 2) = &v133;
          *(void *)&v184[32] = &v185;
          v185 = 0;
          uint64_t v186 = 0;
          char v66 = 0;
        }
        else
        {
          v132 = &v133;
        }
        long long v135 = v187;
        long long v187 = 0uLL;
        char v151 = 0;
        *(void *)v184 = &unk_1EDC827D8;
        std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v184[32], v66);
        MEMORY[0x192FA3C30](v184);
      }
      std::__expected_base<AMSCore::OrderedMap<std::string,std::string>,AMSCore::Error>::__repr::__destroy_union_member[abi:fe180100]((void (***)(void))__what_arg);
      if (!v56) {
        goto LABEL_166;
      }
      uint64_t v37 = (uint64_t *)__p;
      uint64_t v38 = (uint64_t *)v170;
    }
    if (v38 == v37) {
      goto LABEL_269;
    }
    uint64_t v68 = *v37;
    unint64_t v69 = v37[1];
    AMSCore::StringUtils::split((char **)v184, *v37, v69, "/", 1, 1uLL);
    operator delete(v37);
    uint64_t v70 = *(void *)v184;
    std::string __p = *(void **)v184;
    long long v170 = *(_OWORD *)&v184[8];
    uint64_t v71 = *(void *)&v184[8];
    uint64_t v72 = (uint64_t)(*(void *)&v184[8] - *(void *)v184) >> 4;
    if (v72 == 2)
    {
      unint64_t v73 = *(void *)(*(void *)v184 + 24);
      if (!v73) {
        goto LABEL_133;
      }
      char v74 = *(unsigned char **)(*(void *)v184 + 16);
      uint64_t v75 = *(void *)(*(void *)v184 + 24);
      char v76 = v74;
      while (*v76 == 47)
      {
        ++v76;
        if (!--v75) {
          goto LABEL_127;
        }
      }
      char v77 = (unsigned char *)(v76 - v74);
      if (v77 == (unsigned char *)-1)
      {
LABEL_127:
        unint64_t v78 = 0;
        char v79 = 0;
        goto LABEL_128;
      }
      BOOL v121 = v73 >= (unint64_t)v77;
      unint64_t v78 = v73 - (void)v77;
      if (!v121) {
        std::__throw_out_of_range[abi:fe180100]("string_view::substr");
      }
      char v79 = &v77[(void)v74];
LABEL_128:
      *(void *)std::string __what_arg = v79;
      *(void *)&__what_arg[8] = v78;
    }
    else
    {
      if (v72 != 1) {
        goto LABEL_133;
      }
      if (!v69) {
        goto LABEL_269;
      }
      if (*(unsigned char *)(v69 + v68 - 1) != 47) {
        goto LABEL_133;
      }
      *(_OWORD *)std::string __what_arg = 0uLL;
    }
    AMSCore::StringUtils::join<char [2],std::string_view>((std::string *)v184, (uint64_t *)__what_arg);
    if (!v163)
    {
      long long v161 = *(_OWORD *)v184;
      uint64_t v162 = *(void *)&v184[16];
      char v163 = 1;
      if (v71 == v70) {
        goto LABEL_269;
      }
      goto LABEL_134;
    }
    if (SHIBYTE(v162) < 0) {
      operator delete((void *)v161);
    }
    long long v161 = *(_OWORD *)v184;
    uint64_t v162 = *(void *)&v184[16];
LABEL_133:
    if (v71 == v70) {
      goto LABEL_269;
    }
LABEL_134:
    AMSCore::StringUtils::split((char **)&v174, *(void *)v70, *(void *)(v70 + 8), ":", 1, 1uLL);
    char v80 = v174;
    char v81 = v175;
    if (v174 == v175 || (size_t v82 = *((void *)v174 + 1)) == 0)
    {
      std::ostringstream::basic_ostringstream[abi:fe180100]((uint64_t)v184);
      std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v184, (uint64_t)"Failed to parse the URL host. host = ", 37);
      std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v184, *(void *)v70, *(void *)(v70 + 8));
      std::stringbuf::str[abi:fe180100]((uint64_t)&v184[8], (std::string *)v176);
      *(void *)v184 = *MEMORY[0x1E4FBA418];
      *(void *)&v184[*(void *)(*(void *)v184 - 24)] = *(void *)(MEMORY[0x1E4FBA418] + 24);
      *(void *)&v184[8] = MEMORY[0x1E4FBA470] + 16;
      if (v190 < 0) {
        operator delete(v188);
      }
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x192FA3FD0](v192);
      v205.__cat_ = (const std::error_category *)&AMSCore::Error::Category::generic(void)::instance;
      *(void *)&v205.__val_ = 3;
      std::system_error::system_error((std::system_error *)v184, v205, (const std::string *)v176);
      if ((v176[23] & 0x80000000) != 0) {
        operator delete(*(void **)v176);
      }
      uint64_t v186 = 0;
      v185 = 0;
      *(void *)v184 = &unk_1EDC827D8;
      *(void *)&v184[32] = &v185;
      long long v187 = 0uLL;
      std::runtime_error::runtime_error((std::runtime_error *)__what_arg, (const std::runtime_error *)v184);
      *(_OWORD *)&__what_arg[16] = *(_OWORD *)&v184[16];
      int v86 = v185;
      *(void *)std::string __what_arg = &unk_1EDC827D8;
      v197 = *(unsigned int ***)&v184[32];
      v198 = v185;
      uint64_t v199 = v186;
      if (v186)
      {
        *((void *)v185 + 2) = &v198;
        int v86 = 0;
        *(void *)&v184[32] = &v185;
        v185 = 0;
        uint64_t v186 = 0;
      }
      else
      {
        v197 = &v198;
      }
      long long v200 = v187;
      long long v187 = 0uLL;
      *(void *)v184 = &unk_1EDC827D8;
      std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v184[32], v86);
      MEMORY[0x192FA3C30](v184);
      std::runtime_error::runtime_error(&v130, (const std::runtime_error *)__what_arg);
      long long v131 = *(_OWORD *)&__what_arg[16];
      char v87 = v198;
      v130.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
      v132 = v197;
      v133 = v198;
      uint64_t v134 = v199;
      if (v199)
      {
        *((void *)v198 + 2) = &v133;
        char v87 = 0;
        v197 = &v198;
        v198 = 0;
        uint64_t v199 = 0;
      }
      else
      {
        v132 = &v133;
      }
      long long v135 = v200;
      long long v200 = 0uLL;
      char v151 = 0;
      *(void *)std::string __what_arg = &unk_1EDC827D8;
      std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v197, v87);
      MEMORY[0x192FA3C30](__what_arg);
      int v88 = 1;
      goto LABEL_151;
    }
    uint64_t v83 = *(void *)v174;
    char v84 = (char *)memchr(*(void **)v174, 64, v82);
    if (v84 && &v84[-v83] != (char *)-1)
    {
      AMSCore::Unexpected<AMSCore::Error,AMSCore::ErrorCode,char const(&)[42],std::string_view &>((uint64_t)v184, 3u, "Received an unsupported URL host. host = ", (uint64_t *)v70);
      std::runtime_error::runtime_error(&v130, (const std::runtime_error *)v184);
      long long v131 = *(_OWORD *)&v184[16];
      char v85 = v185;
      v130.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
      v132 = *(unsigned int ***)&v184[32];
      v133 = v185;
      uint64_t v134 = v186;
      if (v186)
      {
        *((void *)v185 + 2) = &v133;
        *(void *)&v184[32] = &v185;
        v185 = 0;
        uint64_t v186 = 0;
        char v85 = 0;
      }
      else
      {
        v132 = &v133;
      }
      long long v135 = v187;
      long long v187 = 0uLL;
      char v151 = 0;
      *(void *)v184 = &unk_1EDC827D8;
      std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v184[32], v85);
      MEMORY[0x192FA3C30](v184);
      int v88 = 1;
      goto LABEL_164;
    }
    if (v81 - (unsigned char *)v80 != 32)
    {
LABEL_246:
      *(_OWORD *)v176 = *(_OWORD *)v80;
      size_t v122 = *(void *)&v176[8];
      if (!*(void *)&v176[8])
      {
        AMSCore::Unexpected<AMSCore::Error,AMSCore::ErrorCode,char const(&)[15]>((uint64_t)v184, 3u);
LABEL_262:
        std::expected<AMSCore::URLBuilder,AMSCore::Error>::expected[abi:fe180100]<AMSCore::Error>(&v130, (uint64_t)v184);
        std::unexpected<AMSCore::Error>::~unexpected((uint64_t)v184);
        goto LABEL_263;
      }
      uint64_t v123 = 0;
      std::string v124 = *(unsigned __int8 **)v176;
      v125 = (std::locale::id *)MEMORY[0x1E4FBA258];
      do
      {
        uint64_t v126 = v124[v123];
        v127 = std::locale::classic();
        v128 = std::locale::use_facet(v127, v125);
        if ((v126 & 0x80) != 0 || (*((_DWORD *)&v128[1].~facet + v126) & 0x500) == 0)
        {
          int v129 = v124[v123];
          if ((v129 - 45) >= 2 && v129 != 126 && v129 != 95)
          {
            AMSCore::Unexpected<AMSCore::Error,AMSCore::ErrorCode,char const(&)[35],std::string_view &>((uint64_t)v184, 3u, (uint64_t *)v176);
            goto LABEL_262;
          }
        }
        ++v123;
      }
      while (v122 != v123);
      std::string::basic_string<std::string_view,0>(__what_arg, v124, v122);
      *(_OWORD *)v184 = *(_OWORD *)__what_arg;
      *(void *)&v184[16] = *(void *)&__what_arg[16];
      memset(__what_arg, 0, 24);
      v184[24] = 1;
      AMSCore::URLBuilder::withHost((uint64_t)&v152, (long long *)v184);
      if (v184[24] && (v184[23] & 0x80000000) != 0) {
        operator delete(*(void **)v184);
      }
      if ((__what_arg[23] & 0x80000000) != 0) {
        operator delete(*(void **)__what_arg);
      }
      int v88 = 0;
LABEL_151:
      if (!v80)
      {
        if (v88) {
          goto LABEL_166;
        }
        goto LABEL_165;
      }
LABEL_164:
      operator delete(v80);
      if (v88) {
        goto LABEL_166;
      }
      goto LABEL_165;
    }
    __int16 v89 = (unsigned __int8 *)v80[2];
    uint64_t v90 = v80[3];
    *(void *)v176 = v89;
    *(void *)&v176[8] = v90;
    char v91 = &v89[v90];
    if (!v90) {
      goto LABEL_196;
    }
    char v92 = v89;
    while (1)
    {
      unsigned int v93 = *v92 - 48;
      if (*v92 != 48) {
        break;
      }
      ++v92;
      if (!--v90) {
        goto LABEL_196;
      }
    }
    if (v92 == v91)
    {
LABEL_196:
      char v92 = v91;
    }
    else if (v93 < 0xA)
    {
      unint64_t v103 = v92 + 1;
      *(_DWORD *)&__what_arg[16] = *v92 - 48;
      if (v92 + 1 == v91)
      {
        uint64_t v105 = 4;
        unint64_t v103 = v91;
        unsigned int v106 = v93;
        goto LABEL_230;
      }
      int v104 = *v103;
      if ((v104 - 58) < 0xFFFFFFF6)
      {
        uint64_t v105 = 4;
        unsigned int v106 = v93;
LABEL_230:
        unint64_t v117 = *(unsigned int *)((char *)&std::__itoa::__pow10_32 + ((0x400000000 - (v105 << 32)) >> 30))
             * (unint64_t)v93;
        v118 = &v103[-((v117 & 0xFFFFFFFF00000000) != 0)];
        unsigned int v119 = HIWORD(v106);
        if (v118 == v91)
        {
          if (v119 || 0xFFFF - v106 < v117) {
            goto LABEL_199;
          }
        }
        else
        {
          BOOL v121 = *v118 - 48 >= 0xA && v119 == 0 && 0xFFFF - v106 >= v117;
          if (!v121)
          {
LABEL_199:
            AMSCore::Unexpected<AMSCore::Error,AMSCore::ErrorCode,char const(&)[42],std::string_view &>((uint64_t)__what_arg, 3u, "Failed to parse value as number. value = ", (uint64_t *)v176);
            std::runtime_error::runtime_error((std::runtime_error *)v184, (const std::runtime_error *)__what_arg);
            *(_OWORD *)&v184[16] = *(_OWORD *)&__what_arg[16];
            unint64_t v108 = v198;
            *(void *)v184 = &unk_1EDC827D8;
            *(void *)&v184[32] = v197;
            v185 = v198;
            uint64_t v186 = v199;
            if (v199)
            {
              *((void *)v198 + 2) = &v185;
              v197 = &v198;
              v198 = 0;
              uint64_t v199 = 0;
              unint64_t v108 = 0;
            }
            else
            {
              *(void *)&v184[32] = &v185;
            }
            long long v187 = v200;
            long long v200 = 0uLL;
            LOBYTE(v188) = 0;
            *(void *)std::string __what_arg = &unk_1EDC827D8;
            std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v197, v108);
            unint64_t v109 = (std::runtime_error *)MEMORY[0x192FA3C30](__what_arg);
            if (!(_BYTE)v188)
            {
              std::runtime_error::runtime_error(v109, (const std::runtime_error *)v184);
              *(_OWORD *)&__what_arg[16] = *(_OWORD *)&v184[16];
              *(void *)std::string __what_arg = &unk_1EDC827D8;
              v197 = *(unsigned int ***)&v184[32];
              v198 = v185;
              uint64_t v199 = v186;
              if (v186)
              {
                *((void *)v185 + 2) = &v198;
                *(void *)&v184[32] = &v185;
                v185 = 0;
                uint64_t v186 = 0;
              }
              else
              {
                v197 = &v198;
              }
              long long v200 = v187;
              long long v187 = 0uLL;
              unsigned __int8 v201 = 1;
              AMSCore::Unexpected<AMSCore::Error,AMSCore::Error>((uint64_t)v176, (uint64_t)__what_arg);
              std::expected<AMSCore::URLBuilder,AMSCore::Error>::expected[abi:fe180100]<AMSCore::Error>(&v130, (uint64_t)v176);
              std::unexpected<AMSCore::Error>::~unexpected((uint64_t)v176);
              std::optional<AMSCore::Error>::~optional((uint64_t)__what_arg);
              if (!(_BYTE)v188) {
                (**(void (***)(unsigned char *))v184)(v184);
              }
LABEL_263:
              int v88 = 1;
              goto LABEL_151;
            }
            goto LABEL_244;
          }
        }
        __int16 v107 = v117 + v106;
        if (v91 != v118) {
          goto LABEL_199;
        }
LABEL_243:
        *(_WORD *)v184 = v107;
        LOBYTE(v188) = 1;
LABEL_244:
        __what_arg[0] = 0;
        unsigned __int8 v201 = 0;
        std::optional<AMSCore::Error>::~optional((uint64_t)__what_arg);
        if (!(_BYTE)v188) {
          goto LABEL_269;
        }
        char v165 = 1;
        __int16 v164 = *(_WORD *)v184;
        goto LABEL_246;
      }
      unint64_t v103 = v92 + 2;
      unsigned int v106 = v104 - 48;
      *(_DWORD *)&__what_arg[12] = v106;
      if (v92 + 2 == v91)
      {
        uint64_t v105 = 3;
        unint64_t v103 = v91;
        goto LABEL_230;
      }
      int v111 = *v103;
      if ((v111 - 58) < 0xFFFFFFF6)
      {
        uint64_t v105 = 3;
        goto LABEL_230;
      }
      unint64_t v103 = v92 + 3;
      unsigned int v106 = v111 - 48;
      *(_DWORD *)&__what_arg[8] = v111 - 48;
      if (v92 + 3 == v91)
      {
        unint64_t v103 = v91;
      }
      else
      {
        int v112 = *v103;
        if ((v112 - 58) >= 0xFFFFFFF6)
        {
          unint64_t v103 = v92 + 4;
          int v113 = v112 - 48;
          *(_DWORD *)&__what_arg[4] = v112 - 48;
          if (v92 + 4 == v91)
          {
            uint64_t v105 = 1;
            unint64_t v103 = v91;
          }
          else
          {
            int v114 = *v103;
            if ((v114 - 58) >= 0xFFFFFFF6)
            {
              uint64_t v105 = 0;
              unint64_t v103 = v92 + 5;
              int v113 = v114 - 48;
              *(_DWORD *)std::string __what_arg = v114 - 48;
            }
            else
            {
              uint64_t v105 = 1;
            }
          }
          unsigned int v106 = v113 + 10 * *(_DWORD *)&__what_arg[4 * v105 + 4] + 100 * *(_DWORD *)&__what_arg[4 * (v105 | 2)];
          if ((v105 | 2) == 3) {
            goto LABEL_230;
          }
          uint64_t v116 = v105 + 3;
          int v115 = 1000;
          goto LABEL_229;
        }
      }
      int v115 = 10;
      uint64_t v105 = 2;
      uint64_t v116 = 3;
LABEL_229:
      v106 += *(_DWORD *)&__what_arg[4 * v116] * v115;
      goto LABEL_230;
    }
    if (v92 == v89) {
      goto LABEL_199;
    }
    __int16 v107 = 0;
    if (v91 != v92) {
      goto LABEL_199;
    }
    goto LABEL_243;
  }
  if (!v11) {
    goto LABEL_208;
  }
  unint64_t v28 = v11;
  char v29 = (unsigned char *)v10;
  while (*v29 == 47)
  {
    ++v29;
    if (!--v28)
    {
      unint64_t v30 = 0;
      goto LABEL_209;
    }
  }
  unint64_t v110 = &v29[-v10];
  if (&v29[-v10] == (unsigned char *)-1)
  {
LABEL_208:
    unint64_t v30 = 0;
    unint64_t v28 = 0;
  }
  else
  {
    unint64_t v30 = v11 - (void)v110;
    if (v11 < (unint64_t)v110) {
      std::__throw_out_of_range[abi:fe180100]("string_view::substr");
    }
    unint64_t v28 = (unint64_t)&v110[v10];
  }
LABEL_209:
  *(void *)std::string __what_arg = v28;
  *(void *)&__what_arg[8] = v30;
  AMSCore::StringUtils::join<char [2],std::string_view>((std::string *)v184, (uint64_t *)__what_arg);
  if (v163)
  {
    if (SHIBYTE(v162) < 0) {
      operator delete((void *)v161);
    }
    long long v161 = *(_OWORD *)v184;
    uint64_t v162 = *(void *)&v184[16];
  }
  else
  {
    long long v161 = *(_OWORD *)v184;
    uint64_t v162 = *(void *)&v184[16];
    char v163 = 1;
  }
LABEL_165:
  AMSCore::URLBuilder::URLBuilder(&v130, &v152);
  char v151 = 1;
LABEL_166:
  AMSCore::URL::~URL((AMSCore::URL *)&v159);
  if (v158)
  {
    v152.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
    uint64_t v94 = (std::__shared_weak_count *)*((void *)&v157 + 1);
    if (*((void *)&v157 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v157 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v94->__on_zero_shared)(v94);
      std::__shared_weak_count::__release_weak(v94);
    }
    std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v154, v155);
    MEMORY[0x192FA3C30](&v152);
  }
  unint64_t v6 = (uint64_t *)__p;
  if (__p) {
LABEL_172:
  }
    operator delete(v6);
LABEL_173:
  if ((SHIBYTE(v171.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (v151) {
      goto LABEL_175;
    }
LABEL_186:
    AMSCore::Unexpected<AMSCore::Error,AMSCore::Error&>((uint64_t)v184, &v130);
    std::runtime_error::runtime_error((std::runtime_error *)a3, (const std::runtime_error *)v184);
    *(_OWORD *)(a3 + 16) = *(_OWORD *)&v184[16];
    *(void *)a3 = &unk_1EDC827D8;
    unint64_t v100 = v185;
    *(void *)(a3 + 32) = *(void *)&v184[32];
    *(void *)(a3 + 40) = v100;
    uint64_t v101 = a3 + 40;
    uint64_t v102 = v186;
    *(void *)(a3 + 48) = v186;
    if (v102)
    {
      *((void *)v100 + 2) = v101;
      *(void *)&v184[32] = &v185;
      v185 = 0;
      uint64_t v186 = 0;
      unint64_t v100 = 0;
    }
    else
    {
      *(void *)(a3 + 32) = v101;
    }
    *(_OWORD *)(a3 + 56) = v187;
    long long v187 = 0uLL;
    *(unsigned char *)(a3 + 152) = 0;
    *(void *)v184 = &unk_1EDC827D8;
    std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v184[32], v100);
    MEMORY[0x192FA3C30](v184);
    goto LABEL_190;
  }
  operator delete(v171.__r_.__value_.__l.__data_);
  if (!v151) {
    goto LABEL_186;
  }
LABEL_175:
  *(unsigned char *)a3 = 0;
  *(unsigned char *)(a3 + 24) = 0;
  if (v138)
  {
    *(_OWORD *)a3 = v136;
    *(void *)(a3 + 16) = v137;
    uint64_t v137 = 0;
    long long v136 = 0uLL;
    *(unsigned char *)(a3 + 24) = 1;
  }
  *(unsigned char *)(a3 + 32) = 0;
  *(unsigned char *)(a3 + 56) = 0;
  if (v141)
  {
    *(_OWORD *)(a3 + 32) = v139;
    *(void *)(a3 + 48) = v140;
    uint64_t v140 = 0;
    long long v139 = 0uLL;
    *(unsigned char *)(a3 + 56) = 1;
  }
  *(unsigned char *)(a3 + 64) = 0;
  *(unsigned char *)(a3 + 88) = 0;
  if (v144)
  {
    *(_OWORD *)(a3 + 64) = v142;
    *(void *)(a3 + 80) = v143;
    uint64_t v143 = 0;
    long long v142 = 0uLL;
    *(unsigned char *)(a3 + 88) = 1;
  }
  *(_DWORD *)(a3 + 96) = v145;
  *(void *)(a3 + 104) = a3 + 104;
  *(void *)(a3 + 112) = a3 + 104;
  *(void *)(a3 + 120) = 0;
  if (&v136 != (long long *)a3)
  {
    uint64_t v95 = v148;
    if (v148)
    {
      uint64_t v97 = v146;
      v96 = v147;
      uint64_t v98 = *v147;
      *(void *)(v98 + 8) = *(void *)(v146 + 8);
      **(void **)(v97 + 8) = v98;
      uint64_t v99 = *(void *)(a3 + 104);
      *(void *)(v99 + 8) = v96;
      void *v96 = v99;
      *(void *)(a3 + 104) = v97;
      *(void *)(v97 + 8) = a3 + 104;
      *(void *)(a3 + 120) = v95;
      uint64_t v148 = 0;
    }
    *(_OWORD *)(a3 + 128) = v149;
    *(void *)(a3 + 144) = v150;
    uint64_t v150 = 0;
    long long v149 = 0uLL;
    *(unsigned char *)(a3 + 152) = 1;
LABEL_190:
    std::__expected_base<AMSCore::URLBuilder,AMSCore::Error>::__repr::__destroy_union_member[abi:fe180100]((uint64_t)&v130);
    return;
  }
LABEL_269:
  __break(1u);
}

void sub_18DB9489C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (v70) {
    operator delete(v70);
  }
  AMSCore::URLBuilder::~URLBuilder((AMSCore::URLBuilder *)&a41);
  if (a70)
  {
    operator delete(a70);
    if ((SLOBYTE(STACK[0x217]) & 0x80000000) == 0) {
      goto LABEL_8;
    }
  }
  else if ((SLOBYTE(STACK[0x217]) & 0x80000000) == 0)
  {
LABEL_8:
    _Unwind_Resume(a1);
  }
  operator delete((void *)STACK[0x200]);
  _Unwind_Resume(a1);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = this->__r_.__value_.__r.__words[2];
    unint64_t v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__n > v8)
    {
      size_t v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __n - v8)
      {
        char v9 = (std::string *)this->__r_.__value_.__r.__words[0];
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          unint64_t v7 = operator new(v11);
          memcpy(v7, __s, __n);
          if (v8 != 22) {
            operator delete(v9);
          }
          this->__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
          this->__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
LABEL_23:
          this->__r_.__value_.__l.__size_ = __n;
          goto LABEL_24;
        }
LABEL_8:
        std::string::size_type v12 = 2 * v8;
        if (__n > 2 * v8) {
          std::string::size_type v12 = __n;
        }
        uint64_t v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v13 = v12 | 7;
        }
        if (v12 >= 0x17) {
          size_t v11 = v13 + 1;
        }
        else {
          size_t v11 = 23;
        }
        goto LABEL_15;
      }
LABEL_25:
      std::string::__throw_length_error[abi:fe180100]();
    }
    unint64_t v6 = HIBYTE(v10);
    unint64_t v7 = (void *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    unint64_t v7 = this;
    if (__n > 0x16)
    {
      if (__n - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        unint64_t v8 = 22;
        char v9 = this;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    goto LABEL_23;
  }
  *((unsigned char *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
LABEL_24:
  *((unsigned char *)v7 + __n) = 0;
  return this;
}

uint64_t AMSCore::StringUtils::join<char [2],std::string_view>(std::string *a1, uint64_t *a2)
{
  std::ostringstream::basic_ostringstream[abi:fe180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(&v5, (uint64_t)"/", 1);
  std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(&v5, *a2, a2[1]);
  std::stringbuf::str[abi:fe180100]((uint64_t)v6, a1);
  uint64_t v5 = *MEMORY[0x1E4FBA418];
  *(void *)((char *)&v6[-1] + *(void *)(v5 - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v6[0] = MEMORY[0x1E4FBA470] + 16;
  if (v7 < 0) {
    operator delete((void *)v6[8]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x192FA3FD0](&v8);
}

void std::__expected_base<AMSCore::OrderedMap<std::string,std::string>,AMSCore::Error>::__repr::__destroy_union_member[abi:fe180100](void (***a1)(void))
{
  if (*((unsigned char *)a1 + 72))
  {
    if (!a1[2]) {
      return;
    }
    uint64_t v2 = *a1;
    uint64_t v3 = (void (***)(void))a1[1];
    uint64_t v4 = *v3;
    v4[1] = (*a1)[1];
    *(void *)v2[1] = v4;
    a1[2] = 0;
    if (v3 == a1) {
      return;
    }
    while (1)
    {
      uint64_t v5 = (void (***)(void))v3[1];
      if (*((char *)v3 + 63) < 0)
      {
        operator delete(v3[5]);
        if (*((char *)v3 + 39) < 0) {
LABEL_10:
        }
          operator delete(v3[2]);
      }
      else if (*((char *)v3 + 39) < 0)
      {
        goto LABEL_10;
      }
      operator delete(v3);
      uint64_t v3 = v5;
      if (v5 == a1) {
        return;
      }
    }
  }
  unint64_t v6 = **a1;
  v6();
}

__n128 std::expected<AMSCore::URLBuilder,AMSCore::Error>::expected[abi:fe180100]<AMSCore::Error>(std::runtime_error *a1, uint64_t a2)
{
  uint64_t v3 = std::runtime_error::runtime_error(a1, (const std::runtime_error *)a2);
  v3->__vftable = (std::runtime_error_vtbl *)(MEMORY[0x1E4FBA448] + 16);
  v3[1] = *(std::runtime_error *)(a2 + 16);
  v3->__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
  v3[2].__vftable = *(std::runtime_error_vtbl **)(a2 + 32);
  uint64_t v4 = (void *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 40);
  v3[2].__imp_.__imp_ = (const char *)v5;
  p_imp = (std::runtime_error_vtbl *)&v3[2].__imp_;
  char v7 = *(std::runtime_error_vtbl **)(a2 + 48);
  v3[3].__vftable = v7;
  if (v7)
  {
    *(void *)(v5 + 16) = p_imp;
    *(void *)(a2 + 32) = v4;
    *uint64_t v4 = 0;
    *(void *)(a2 + 48) = 0;
  }
  else
  {
    v3[2].__vftable = p_imp;
  }
  __n128 result = *(__n128 *)(a2 + 56);
  *(__n128 *)((char *)v3 + 56) = result;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  LOBYTE(v3[14].__imp_.__imp_) = 0;
  return result;
}

uint64_t AMSCore::Unexpected<AMSCore::Error,AMSCore::ErrorCode,char const(&)[15]>(uint64_t a1, unsigned int a2)
{
  std::ostringstream::basic_ostringstream[abi:fe180100]((uint64_t)&v9);
  std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(&v9, (uint64_t)"Host is empty.", 14);
  std::stringbuf::str[abi:fe180100]((uint64_t)&v9.__imp_, &v8);
  v9.__vftable = (std::system_error_vtbl *)*MEMORY[0x1E4FBA418];
  *(std::system_error_vtbl **)((char *)&v9.__vftable + (unint64_t)v9.__vftable[-1].~system_error) = *(std::system_error_vtbl **)(MEMORY[0x1E4FBA418] + 24);
  v9.__imp_.__imp_ = (const char *)(MEMORY[0x1E4FBA470] + 16);
  if (v15 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x192FA3FD0](&v16);
  *(void *)&v17.__val_ = a2;
  v17.__cat_ = (const std::error_category *)&AMSCore::Error::Category::generic(void)::instance;
  std::system_error::system_error(&v9, v17, &v8);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  v9.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
  unint64_t v10 = &v11;
  long long v13 = 0uLL;
  std::runtime_error::runtime_error((std::runtime_error *)a1, &v9);
  *(std::error_code *)(a1 + 16) = v9.__ec_;
  *(void *)a1 = &unk_1EDC827D8;
  uint64_t v4 = v11;
  *(void *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = a1 + 40;
  uint64_t v6 = v12;
  *(void *)(a1 + 48) = v12;
  if (v6)
  {
    *(void *)(v4 + 16) = v5;
    uint64_t v4 = 0;
    unint64_t v10 = &v11;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  else
  {
    *(void *)(a1 + 32) = v5;
  }
  *(_OWORD *)(a1 + 56) = v13;
  long long v13 = 0uLL;
  v9.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
  std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v10, (unsigned int *)v4);
  return MEMORY[0x192FA3C30](&v9);
}

void sub_18DB95128(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AMSCore::Unexpected<AMSCore::Error,AMSCore::ErrorCode,char const(&)[35],std::string_view &>(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  std::ostringstream::basic_ostringstream[abi:fe180100]((uint64_t)&v11);
  std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(&v11, (uint64_t)"Invalid character in host. host = ", 34);
  std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(&v11, *a3, a3[1]);
  std::stringbuf::str[abi:fe180100]((uint64_t)&v11.__imp_, &v10);
  v11.__vftable = (std::system_error_vtbl *)*MEMORY[0x1E4FBA418];
  *(std::system_error_vtbl **)((char *)&v11.__vftable + (unint64_t)v11.__vftable[-1].~system_error) = *(std::system_error_vtbl **)(MEMORY[0x1E4FBA418] + 24);
  v11.__imp_.__imp_ = (const char *)(MEMORY[0x1E4FBA470] + 16);
  if (v17 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x192FA3FD0](&v18);
  *(void *)&v19.__val_ = a2;
  v19.__cat_ = (const std::error_category *)&AMSCore::Error::Category::generic(void)::instance;
  std::system_error::system_error(&v11, v19, &v10);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v11.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
  uint64_t v12 = &v13;
  long long v15 = 0uLL;
  std::runtime_error::runtime_error((std::runtime_error *)a1, &v11);
  *(std::error_code *)(a1 + 16) = v11.__ec_;
  *(void *)a1 = &unk_1EDC827D8;
  uint64_t v6 = v13;
  *(void *)(a1 + 32) = v12;
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = a1 + 40;
  uint64_t v8 = v14;
  *(void *)(a1 + 48) = v14;
  if (v8)
  {
    *(void *)(v6 + 16) = v7;
    uint64_t v6 = 0;
    uint64_t v12 = &v13;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  else
  {
    *(void *)(a1 + 32) = v7;
  }
  *(_OWORD *)(a1 + 56) = v15;
  long long v15 = 0uLL;
  v11.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
  std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v12, (unsigned int *)v6);
  return MEMORY[0x192FA3C30](&v11);
}

void sub_18DB95394(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string<std::string_view,0>(void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:fe180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    uint64_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

uint64_t AMSCore::URLBuilder::withHost(uint64_t a1, long long *a2)
{
  uint64_t v4 = a1 + 112;
  if (*(unsigned __int8 *)(a1 + 136) == *((unsigned __int8 *)a2 + 24))
  {
    if (*(unsigned char *)(a1 + 136))
    {
      if (*(char *)(a1 + 135) < 0) {
        operator delete(*(void **)v4);
      }
      long long v5 = *a2;
      *(void *)(v4 + 16) = *((void *)a2 + 2);
      *(_OWORD *)uint64_t v4 = v5;
      *((unsigned char *)a2 + 23) = 0;
      *(unsigned char *)a2 = 0;
    }
  }
  else if (*(unsigned char *)(a1 + 136))
  {
    if (*(char *)(a1 + 135) < 0) {
      operator delete(*(void **)v4);
    }
    *(unsigned char *)(a1 + 136) = 0;
  }
  else
  {
    long long v6 = *a2;
    *(void *)(a1 + 128) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v4 = v6;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    *(unsigned char *)(a1 + 136) = 1;
  }
  return a1;
}

void _ZNSt3__14listINS_4pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES7_EENS5_IS8_EEE9remove_ifIZN7AMSCore10OrderedMapIS7_S7_E5eraseERKS7_EUlRT_E_EEmSH_(void *a1, unsigned __int8 **a2)
{
  uint64_t v26 = &v26;
  int v27 = &v26;
  uint64_t v28 = 0;
  uint64_t v2 = (void *)a1[1];
  if (v2 != a1)
  {
    uint64_t v5 = 0;
    long long v6 = &v26;
    while (1)
    {
      uint64_t v8 = *((unsigned __int8 *)v2 + 39);
      if ((v8 & 0x80u) == 0) {
        std::system_error v9 = (unsigned __int8 *)*((unsigned __int8 *)v2 + 39);
      }
      else {
        std::system_error v9 = (unsigned __int8 *)v2[3];
      }
      std::string v10 = (unsigned __int8 *)*((unsigned __int8 *)a2 + 23);
      int v11 = (char)v10;
      if ((char)v10 < 0) {
        std::string v10 = a2[1];
      }
      if (v9 != v10) {
        goto LABEL_4;
      }
      if (v11 >= 0) {
        uint64_t v12 = (unsigned __int8 *)a2;
      }
      else {
        uint64_t v12 = *a2;
      }
      if ((v8 & 0x80) != 0)
      {
        if (memcmp((const void *)v2[2], v12, v2[3])) {
          goto LABEL_4;
        }
      }
      else if (*((unsigned char *)v2 + 39))
      {
        uint64_t v13 = 0;
        while (*((unsigned __int8 *)v2 + v13 + 16) == v12[v13])
        {
          if (v8 == ++v13) {
            goto LABEL_21;
          }
        }
LABEL_4:
        i = v2;
LABEL_5:
        i = (void *)i[1];
        goto LABEL_6;
      }
LABEL_21:
      for (i = (void *)v2[1]; ; i = (void *)i[1])
      {
        if (i == a1)
        {
          char v17 = 1;
          i = a1;
          if (v2 == a1) {
            goto LABEL_36;
          }
          goto LABEL_39;
        }
        uint64_t v14 = *((unsigned __int8 *)i + 39);
        if ((v14 & 0x80u) == 0) {
          long long v15 = (unsigned __int8 *)*((unsigned __int8 *)i + 39);
        }
        else {
          long long v15 = (unsigned __int8 *)i[3];
        }
        if (v15 != v9) {
          goto LABEL_35;
        }
        if ((v14 & 0x80) == 0) {
          break;
        }
        if (memcmp((const void *)i[2], v12, i[3])) {
          goto LABEL_35;
        }
LABEL_23:
        ;
      }
      if (!*((unsigned char *)i + 39)) {
        goto LABEL_23;
      }
      uint64_t v16 = 0;
      while (*((unsigned __int8 *)i + v16 + 16) == v12[v16])
      {
        if (v14 == ++v16) {
          goto LABEL_23;
        }
      }
LABEL_35:
      char v17 = 0;
      if (v2 == i)
      {
LABEL_36:
        if ((v17 & 1) == 0) {
          goto LABEL_5;
        }
        goto LABEL_6;
      }
LABEL_39:
      long long v6 = (void *)*i;
      if (&v26 != a1)
      {
        if (v6 == v2)
        {
          uint64_t v20 = 1;
        }
        else
        {
          uint64_t v18 = -1;
          std::error_code v19 = v2;
          do
          {
            std::error_code v19 = (void *)v19[1];
            ++v18;
          }
          while (v19 != v6);
          uint64_t v20 = v18 + 2;
        }
        a1[2] -= v20;
        v5 += v20;
        uint64_t v28 = v5;
      }
      uint64_t v21 = *v2;
      *(void *)(v21 + 8) = v6[1];
      *(void *)v6[1] = v21;
      char v22 = v26;
      v26[1] = v2;
      *uint64_t v2 = v22;
      uint64_t v26 = v6;
      v6[1] = &v26;
      if ((v17 & 1) == 0) {
        goto LABEL_5;
      }
LABEL_6:
      uint64_t v2 = i;
      if (i == a1)
      {
        if (!v5) {
          return;
        }
        int v23 = v27;
        uint64_t v24 = *v27;
        *(void *)(v24 + 8) = v6[1];
        *(void *)v6[1] = v24;
        uint64_t v28 = 0;
        if (v23 == &v26) {
          return;
        }
        while (2)
        {
          int v25 = (void *)v23[1];
          if (*((char *)v23 + 63) < 0)
          {
            operator delete((void *)v23[5]);
            if (*((char *)v23 + 39) < 0) {
              goto LABEL_55;
            }
          }
          else if (*((char *)v23 + 39) < 0)
          {
LABEL_55:
            operator delete((void *)v23[2]);
          }
          operator delete(v23);
          int v23 = v25;
          if (v25 == &v26) {
            return;
          }
          continue;
        }
      }
    }
  }
}

uint64_t AMSCore::URLBuilder::withPathSegment(uint64_t a1, unsigned char *a2, unint64_t a3)
{
  if (!a3) {
    return a1;
  }
  uint64_t v4 = (void **)(a1 + 144);
  unint64_t v5 = a3;
  long long v6 = a2;
  while (*v6 == 47)
  {
    ++v6;
    if (!--v5) {
      goto LABEL_9;
    }
  }
  size_t v7 = (unsigned char *)(v6 - a2);
  if (v7 == (unsigned char *)-1)
  {
LABEL_9:
    size_t v8 = 0;
    std::system_error v9 = 0;
  }
  else
  {
    size_t v8 = a3 - (void)v7;
    if (a3 < (unint64_t)v7) {
      goto LABEL_54;
    }
    std::system_error v9 = &v7[(void)a2];
  }
  v21[0] = (uint64_t)v9;
  v21[1] = v8;
  if (*(unsigned char *)(a1 + 168))
  {
    uint64_t v10 = *(unsigned __int8 *)(a1 + 167);
    if (*(char *)(a1 + 167) < 0)
    {
      std::string::size_type v12 = *(void *)(a1 + 152);
      if (v12)
      {
        if (*((char *)*v4 + v12 - 1) == 47)
        {
          std::string::size_type v11 = (*(void *)(a1 + 160) & 0x7FFFFFFFFFFFFFFFLL) - 1;
LABEL_22:
          if (v11 - v12 >= v8)
          {
            if (v8)
            {
              if ((v10 & 0x80) != 0) {
                uint64_t v4 = (void **)*v4;
              }
              memmove((char *)v4 + v12, v9, v8);
              std::string::size_type v17 = v12 + v8;
              if (*(char *)(a1 + 167) < 0) {
                *(void *)(a1 + 152) = v17;
              }
              else {
                *(unsigned char *)(a1 + 167) = v17 & 0x7F;
              }
              *((unsigned char *)v4 + v17) = 0;
            }
          }
          else
          {
            std::string::__grow_by_and_replace((std::string *)(a1 + 144), v11, v8 - v11 + v12, v12, v12, 0, v8, v9);
          }
          return a1;
        }
LABEL_24:
        AMSCore::StringUtils::join<char [2],std::string_view>(&__p, v21);
        if (*(unsigned char *)(a1 + 168))
        {
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            p_p = &__p;
          }
          else {
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            size_t size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          }
          else {
            size_t size = __p.__r_.__value_.__l.__size_;
          }
          if (*(char *)(a1 + 167) < 0)
          {
            std::string::size_type v16 = *(void *)(a1 + 152);
            std::string::size_type v15 = (*(void *)(a1 + 160) & 0x7FFFFFFFFFFFFFFFLL) - 1;
          }
          else
          {
            std::string::size_type v15 = 22;
            std::string::size_type v16 = *(unsigned __int8 *)(a1 + 167);
          }
          if (v15 - v16 >= size)
          {
            if (size)
            {
              if ((*(unsigned char *)(a1 + 167) & 0x80) != 0) {
                uint64_t v4 = (void **)*v4;
              }
              memmove((char *)v4 + v16, p_p, size);
              std::string::size_type v18 = v16 + size;
              if (*(char *)(a1 + 167) < 0)
              {
                *(void *)(a1 + 152) = v18;
                *((unsigned char *)v4 + v18) = 0;
                if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                  return a1;
                }
                goto LABEL_49;
              }
              *(unsigned char *)(a1 + 167) = v18 & 0x7F;
              *((unsigned char *)v4 + v18) = 0;
            }
          }
          else
          {
            std::string::__grow_by_and_replace((std::string *)(a1 + 144), v15, size - v15 + v16, v16, v16, 0, size, (const std::string::value_type *)p_p);
          }
          if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            return a1;
          }
LABEL_49:
          operator delete(__p.__r_.__value_.__l.__data_);
          return a1;
        }
      }
    }
    else if (*(unsigned char *)(a1 + 167))
    {
      if (*((unsigned char *)v4 + v10 - 1) == 47)
      {
        std::string::size_type v11 = 22;
        std::string::size_type v12 = *(unsigned __int8 *)(a1 + 167);
        goto LABEL_22;
      }
      goto LABEL_24;
    }
    __break(1u);
LABEL_54:
    std::__throw_out_of_range[abi:fe180100]("string_view::substr");
  }
  AMSCore::StringUtils::join<char [2],std::string_view>(&__p, v21);
  if (*(unsigned char *)(a1 + 168))
  {
    if (*(char *)(a1 + 167) < 0) {
      operator delete(*v4);
    }
    *(_OWORD *)uint64_t v4 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(void *)(a1 + 160) = *((void *)&__p.__r_.__value_.__l + 2);
  }
  else
  {
    *(_OWORD *)uint64_t v4 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(void *)(a1 + 160) = *((void *)&__p.__r_.__value_.__l + 2);
    *(unsigned char *)(a1 + 168) = 1;
  }
  return a1;
}

void sub_18DB95A24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AMSCore::URLBuilder::withQueryParameter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)size_t v8 = *(_OWORD *)a2;
  uint64_t v4 = a1 + 184;
  uint64_t v9 = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  *(_OWORD *)std::string __p = *(_OWORD *)a3;
  uint64_t v11 = *(void *)(a3 + 16);
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  _ZNSt3__14listINS_4pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES7_EENS5_IS8_EEE9remove_ifIZN7AMSCore10OrderedMapIS7_S7_E5eraseERKS7_EUlRT_E_EEmSH_((void *)(a1 + 184), (unsigned __int8 **)v8);
  unint64_t v5 = operator new(0x40uLL);
  v5[1] = *(_OWORD *)v8;
  *((void *)v5 + 4) = v9;
  v8[1] = 0;
  uint64_t v9 = 0;
  v8[0] = 0;
  *(_OWORD *)((char *)v5 + 40) = *(_OWORD *)__p;
  *((void *)v5 + 7) = v11;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v11 = 0;
  uint64_t v6 = *(void *)(a1 + 184);
  *(void *)unint64_t v5 = v6;
  *((void *)v5 + 1) = v4;
  *(void *)(v6 + 8) = v5;
  *(void *)(a1 + 184) = v5;
  ++*(void *)(a1 + 200);
  if (SHIBYTE(v11) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v9) & 0x80000000) == 0) {
      return a1;
    }
LABEL_5:
    operator delete(v8[0]);
    return a1;
  }
  if (SHIBYTE(v9) < 0) {
    goto LABEL_5;
  }
  return a1;
}

void AMSCore::getValueByKey(uint64_t a1, uint64_t a2, void *__s1, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a2 + 8;
  uint64_t v9 = *(uint64_t ***)(a2 + 8);
  if (!v9) {
    goto LABEL_32;
  }
  uint64_t v10 = a2 + 8;
  do
  {
    while (1)
    {
      int v11 = *((char *)v9 + 55);
      std::string::size_type v12 = v11 >= 0 ? (uint64_t *)(v9 + 4) : v9[4];
      unint64_t v13 = v11 >= 0 ? *((unsigned __int8 *)v9 + 55) : (unint64_t)v9[5];
      size_t v14 = v13 >= a4 ? a4 : v13;
      int v15 = memcmp(__s1, v12, v14);
      if (v15) {
        break;
      }
      if (a4 <= v13) {
        goto LABEL_17;
      }
LABEL_3:
      uint64_t v9 = (uint64_t **)v9[1];
      if (!v9) {
        goto LABEL_18;
      }
    }
    if ((v15 & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v10 = (uint64_t)v9;
    uint64_t v9 = (uint64_t **)*v9;
  }
  while (v9);
LABEL_18:
  if (v10 != v8)
  {
    int v16 = *(char *)(v10 + 55);
    if (v16 >= 0) {
      std::string::size_type v17 = (const void *)(v10 + 32);
    }
    else {
      std::string::size_type v17 = *(const void **)(v10 + 32);
    }
    if (v16 >= 0) {
      size_t v18 = *(unsigned __int8 *)(v10 + 55);
    }
    else {
      size_t v18 = *(void *)(v10 + 40);
    }
    if (v18 >= a4) {
      size_t v19 = a4;
    }
    else {
      size_t v19 = v18;
    }
    int v20 = memcmp(__s1, v17, v19);
    if (v20)
    {
      if ((v20 & 0x80000000) == 0)
      {
LABEL_30:
        *(void *)a1 = v10 + 56;
        *(unsigned char *)(a1 + 72) = 1;
        return;
      }
    }
    else if (a4 >= v18)
    {
      goto LABEL_30;
    }
  }
LABEL_32:
  char v47 = (std::runtime_error *)a1;
  AMSCore::StringUtils::split(&v56, (uint64_t)__s1, a4, "/", 1, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v49 = v56;
  if (v56 == v57) {
    goto LABEL_75;
  }
  uint64_t v21 = 0;
  unint64_t v22 = (v57 - v56) >> 4;
  unint64_t v23 = v22 - 1;
  if (v22 <= 1) {
    unint64_t v22 = 1;
  }
  unint64_t v48 = v22;
  while (2)
  {
    uint64_t v26 = *(uint64_t ***)(v6 + 8);
    uint64_t v24 = v6 + 8;
    int v25 = v26;
    if (!v26) {
      break;
    }
    int v27 = &v49[16 * v21];
    char v29 = *(const void **)v27;
    size_t v28 = *((void *)v27 + 1);
    uint64_t v30 = v24;
    while (2)
    {
      while (2)
      {
        int v31 = *((char *)v25 + 55);
        if (v31 >= 0) {
          uint64_t v32 = (uint64_t *)(v25 + 4);
        }
        else {
          uint64_t v32 = v25[4];
        }
        if (v31 >= 0) {
          size_t v33 = *((unsigned __int8 *)v25 + 55);
        }
        else {
          size_t v33 = (size_t)v25[5];
        }
        if (v33 >= v28) {
          size_t v34 = v28;
        }
        else {
          size_t v34 = v33;
        }
        int v35 = memcmp(v29, v32, v34);
        if (v35)
        {
          if ((v35 & 0x80000000) == 0) {
            break;
          }
          goto LABEL_38;
        }
        if (v28 <= v33)
        {
LABEL_38:
          uint64_t v30 = (uint64_t)v25;
          int v25 = (uint64_t **)*v25;
          if (!v25) {
            goto LABEL_55;
          }
          continue;
        }
        break;
      }
      int v25 = (uint64_t **)v25[1];
      if (v25) {
        continue;
      }
      break;
    }
LABEL_55:
    if (v30 == v24) {
      break;
    }
    int v36 = *(char *)(v30 + 55);
    if (v36 >= 0) {
      uint64_t v37 = (const void *)(v30 + 32);
    }
    else {
      uint64_t v37 = *(const void **)(v30 + 32);
    }
    if (v36 >= 0) {
      size_t v38 = *(unsigned __int8 *)(v30 + 55);
    }
    else {
      size_t v38 = *(void *)(v30 + 40);
    }
    if (v38 >= v28) {
      size_t v39 = v28;
    }
    else {
      size_t v39 = v38;
    }
    int v40 = memcmp(v29, v37, v39);
    if (v40)
    {
      if (v40 < 0) {
        break;
      }
    }
    else if (v28 < v38)
    {
      break;
    }
    if (v21 == v23)
    {
      v47->__vftable = (std::runtime_error_vtbl *)(v30 + 56);
      LOBYTE(v47[4].__imp_.__imp_) = 1;
      std::string::size_type v46 = v49;
      if (v49) {
        goto LABEL_86;
      }
      return;
    }
    if (*(_DWORD *)(v30 + 80) == 8)
    {
      uint64_t v6 = *(_DWORD *)(v30 + 80) == 8 ? v30 + 56 : 0;
      if (++v21 != v48) {
        continue;
      }
    }
    break;
  }
LABEL_75:
  std::ostringstream::basic_ostringstream[abi:fe180100]((uint64_t)&v59);
  std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(&v59, (uint64_t)"Unable to find value from key path \"", 36);
  std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(&v59, (uint64_t)__s1, a4);
  std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(&v59, (uint64_t)"\"", 1);
  std::stringbuf::str[abi:fe180100]((uint64_t)&v59.__imp_, &__what_arg);
  v59.__vftable = (std::system_error_vtbl *)*MEMORY[0x1E4FBA418];
  *(std::system_error_vtbl **)((char *)&v59.__vftable + (unint64_t)v59.__vftable[-1].~system_error) = *(std::system_error_vtbl **)(MEMORY[0x1E4FBA418] + 24);
  v59.__imp_.__imp_ = (const char *)(MEMORY[0x1E4FBA470] + 16);
  if (v65 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x192FA3FD0](&v66);
  v67.__cat_ = (const std::error_category *)&AMSCore::Error::Category::generic(void)::instance;
  *(void *)&v67.__val_ = 12;
  std::system_error::system_error(&v59, v67, &__what_arg);
  if (SHIBYTE(__what_arg.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__what_arg.__r_.__value_.__l.__data_);
  }
  uint64_t v61 = 0;
  char v62 = 0;
  v59.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
  char v60 = (std::runtime_error_vtbl *)&v61;
  long long v63 = 0uLL;
  std::runtime_error::runtime_error(&v50, &v59);
  std::error_code ec = v59.__ec_;
  long long v41 = (unsigned int *)v61;
  v50.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
  uint64_t v52 = v60;
  uint64_t v53 = v61;
  uint64_t v54 = v62;
  if (v62)
  {
    *(void *)(v61 + 16) = &v53;
    long long v41 = 0;
    char v60 = (std::runtime_error_vtbl *)&v61;
    uint64_t v61 = 0;
    char v62 = 0;
  }
  else
  {
    uint64_t v52 = (std::runtime_error_vtbl *)&v53;
  }
  long long v55 = v63;
  long long v63 = 0uLL;
  v59.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
  std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v60, v41);
  MEMORY[0x192FA3C30](&v59);
  long long v42 = std::runtime_error::runtime_error(v47, &v50);
  v42[1] = (std::runtime_error)ec;
  v42->__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
  uint64_t v43 = v53;
  v42[2].__vftable = v52;
  v42[2].__imp_.__imp_ = (const char *)v43;
  p_imp = (std::runtime_error_vtbl *)&v42[2].__imp_;
  long long v45 = v54;
  v42[3].__vftable = v54;
  if (v45)
  {
    *(void *)(v43 + 16) = p_imp;
    uint64_t v43 = 0;
    uint64_t v52 = (std::runtime_error_vtbl *)&v53;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
  }
  else
  {
    v42[2].__vftable = p_imp;
  }
  std::string::size_type v46 = v49;
  *(_OWORD *)&v42[3].__imp_.__imp_ = v55;
  long long v55 = 0uLL;
  LOBYTE(v42[4].__imp_.__imp_) = 0;
  v50.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
  std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v52, (unsigned int *)v43);
  MEMORY[0x192FA3C30](&v50);
  if (v49) {
LABEL_86:
  }
    operator delete(v46);
}

void sub_18DB960A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a29 < 0)
  {
    operator delete(__p);
    if (a11) {
      goto LABEL_3;
    }
  }
  else if (a11)
  {
LABEL_3:
    operator delete(a11);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

void AMSCore::getValueByKey(uint64_t a1, uint64_t a2, void *a3, unint64_t a4)
{
  AMSCore::getValueByKey((uint64_t)v14, a2, a3, a4);
  if (v15)
  {
    *(void *)a1 = v14[0].__vftable;
    *(unsigned char *)(a1 + 72) = 1;
  }
  else
  {
    AMSCore::Unexpected<AMSCore::Error,AMSCore::Error&>((uint64_t)&v8, v14);
    std::runtime_error::runtime_error((std::runtime_error *)a1, &v8);
    *(_OWORD *)(a1 + 16) = v9;
    *(void *)a1 = &unk_1EDC827D8;
    uint64_t v5 = v11;
    *(void *)(a1 + 32) = v10;
    *(void *)(a1 + 40) = v5;
    uint64_t v6 = a1 + 40;
    uint64_t v7 = v12;
    *(void *)(a1 + 48) = v12;
    if (v7)
    {
      *(void *)(v5 + 16) = v6;
      uint64_t v10 = &v11;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v5 = 0;
    }
    else
    {
      *(void *)(a1 + 32) = v6;
    }
    *(_OWORD *)(a1 + 56) = v13;
    long long v13 = 0uLL;
    *(unsigned char *)(a1 + 72) = 0;
    v8.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
    std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v10, (unsigned int *)v5);
    MEMORY[0x192FA3C30](&v8);
    if (!v15) {
      ((void (*)(std::runtime_error *))v14[0].~runtime_error)(v14);
    }
  }
}

void sub_18DB96220(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void (**a19)(void), uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  if (!a28) {
    (*a19)(&a19);
  }
  _Unwind_Resume(exception_object);
}

void AMSCore::ServiceProvider<AMSCore::IAnisetteProvider>::getDefault(void *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_17IAnisetteProviderEEERDavE9singleton, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_17IAnisetteProviderEEERDavE9singleton))
  {
    std::__shared_mutex_base::__shared_mutex_base(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_17IAnisetteProviderEEERDavE9singleton);
    xmmword_1EB38C988 = 0uLL;
    byte_1EB38C998 = 0;
    __cxa_guard_release(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_17IAnisetteProviderEEERDavE9singleton);
  }
  std::__shared_mutex_base::lock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_17IAnisetteProviderEEERDavE9singleton);
  if (!byte_1EB38C998) {
    std::terminate();
  }
  uint64_t v2 = *((void *)&xmmword_1EB38C988 + 1);
  *a1 = xmmword_1EB38C988;
  a1[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  std::__shared_mutex_base::unlock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_17IAnisetteProviderEEERDavE9singleton);
}

void sub_18DB96314(void *a1)
{
}

void AMSCore::ServiceProvider<AMSCore::ICancellationContextProvider>::getDefault(void *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_28ICancellationContextProviderEEERDavE9singleton, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_28ICancellationContextProviderEEERDavE9singleton))
  {
    std::__shared_mutex_base::__shared_mutex_base(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_28ICancellationContextProviderEEERDavE9singleton);
    xmmword_1EB38BFE0 = 0uLL;
    byte_1EB38BFF0 = 0;
    __cxa_guard_release(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_28ICancellationContextProviderEEERDavE9singleton);
  }
  std::__shared_mutex_base::lock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_28ICancellationContextProviderEEERDavE9singleton);
  if (!byte_1EB38BFF0) {
    std::terminate();
  }
  uint64_t v2 = *((void *)&xmmword_1EB38BFE0 + 1);
  *a1 = xmmword_1EB38BFE0;
  a1[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  std::__shared_mutex_base::unlock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_28ICancellationContextProviderEEERDavE9singleton);
}

void sub_18DB963E8(void *a1)
{
}

void AMSCore::ServiceProvider<AMSCore::IKeybagProvider>::getDefault(void *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_15IKeybagProviderEEERDavE9singleton, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_15IKeybagProviderEEERDavE9singleton))
  {
    std::__shared_mutex_base::__shared_mutex_base(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_15IKeybagProviderEEERDavE9singleton);
    xmmword_1EB38C688 = 0uLL;
    byte_1EB38C698 = 0;
    __cxa_guard_release(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_15IKeybagProviderEEERDavE9singleton);
  }
  std::__shared_mutex_base::lock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_15IKeybagProviderEEERDavE9singleton);
  if (!byte_1EB38C698) {
    std::terminate();
  }
  uint64_t v2 = *((void *)&xmmword_1EB38C688 + 1);
  *a1 = xmmword_1EB38C688;
  a1[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  std::__shared_mutex_base::unlock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_15IKeybagProviderEEERDavE9singleton);
}

void sub_18DB964BC(void *a1)
{
}

void AMSCore::ServiceProvider<AMSCore::IHTTPProvider>::getDefaultOrNull(void *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_13IHTTPProviderEEERDavE9singleton, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_13IHTTPProviderEEERDavE9singleton))
  {
    std::__shared_mutex_base::__shared_mutex_base(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_13IHTTPProviderEEERDavE9singleton);
    xmmword_1EB38C448 = 0uLL;
    byte_1EB38C458 = 0;
    __cxa_guard_release(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_13IHTTPProviderEEERDavE9singleton);
  }
  std::__shared_mutex_base::lock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_13IHTTPProviderEEERDavE9singleton);
  uint64_t v2 = *((void *)&xmmword_1EB38C448 + 1);
  *a1 = xmmword_1EB38C448;
  a1[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  std::__shared_mutex_base::unlock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_13IHTTPProviderEEERDavE9singleton);
}

void sub_18DB96580(void *a1)
{
}

void AMSCore::ServiceProvider<AMSCore::IMetricsSamplingProvider>::getDefault(void *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_24IMetricsSamplingProviderEEERDavE9singleton, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_24IMetricsSamplingProviderEEERDavE9singleton))
  {
    std::__shared_mutex_base::__shared_mutex_base(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_24IMetricsSamplingProviderEEERDavE9singleton);
    xmmword_1EB38CC88 = 0uLL;
    byte_1EB38CC98 = 0;
    __cxa_guard_release(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_24IMetricsSamplingProviderEEERDavE9singleton);
  }
  std::__shared_mutex_base::lock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_24IMetricsSamplingProviderEEERDavE9singleton);
  if (!byte_1EB38CC98) {
    std::terminate();
  }
  uint64_t v2 = *((void *)&xmmword_1EB38CC88 + 1);
  *a1 = xmmword_1EB38CC88;
  a1[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  std::__shared_mutex_base::unlock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_24IMetricsSamplingProviderEEERDavE9singleton);
}

void sub_18DB96654(void *a1)
{
}

void AMSCore::ServiceProvider<AMSCore::IOpenURLProvider>::getDefault(void *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_16IOpenURLProviderEEERDavE9singleton, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_16IOpenURLProviderEEERDavE9singleton))
  {
    std::__shared_mutex_base::__shared_mutex_base(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_16IOpenURLProviderEEERDavE9singleton);
    xmmword_1EB38C808 = 0uLL;
    byte_1EB38C818 = 0;
    __cxa_guard_release(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_16IOpenURLProviderEEERDavE9singleton);
  }
  std::__shared_mutex_base::lock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_16IOpenURLProviderEEERDavE9singleton);
  if (!byte_1EB38C818) {
    std::terminate();
  }
  uint64_t v2 = *((void *)&xmmword_1EB38C808 + 1);
  *a1 = xmmword_1EB38C808;
  a1[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  std::__shared_mutex_base::unlock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_16IOpenURLProviderEEERDavE9singleton);
}

void sub_18DB96728(void *a1)
{
}

void AMSCore::ServiceProvider<AMSCore::ISchedulingProvider>::getDefault(void *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_19ISchedulingProviderEEERDavE9singleton, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_19ISchedulingProviderEEERDavE9singleton))
  {
    std::__shared_mutex_base::__shared_mutex_base(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_19ISchedulingProviderEEERDavE9singleton);
    xmmword_1EB38CBC8 = 0uLL;
    byte_1EB38CBD8 = 0;
    __cxa_guard_release(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_19ISchedulingProviderEEERDavE9singleton);
  }
  std::__shared_mutex_base::lock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_19ISchedulingProviderEEERDavE9singleton);
  if (!byte_1EB38CBD8) {
    std::terminate();
  }
  uint64_t v2 = *((void *)&xmmword_1EB38CBC8 + 1);
  *a1 = xmmword_1EB38CBC8;
  a1[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  std::__shared_mutex_base::unlock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_19ISchedulingProviderEEERDavE9singleton);
}

void sub_18DB967FC(void *a1)
{
}

void AMSCore::ServiceProvider<AMSCore::ISchedulingProvider>::getDefaultOrNull(void *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_19ISchedulingProviderEEERDavE9singleton, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_19ISchedulingProviderEEERDavE9singleton))
  {
    std::__shared_mutex_base::__shared_mutex_base(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_19ISchedulingProviderEEERDavE9singleton);
    xmmword_1EB38CBC8 = 0uLL;
    byte_1EB38CBD8 = 0;
    __cxa_guard_release(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_19ISchedulingProviderEEERDavE9singleton);
  }
  std::__shared_mutex_base::lock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_19ISchedulingProviderEEERDavE9singleton);
  uint64_t v2 = *((void *)&xmmword_1EB38CBC8 + 1);
  *a1 = xmmword_1EB38CBC8;
  a1[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  std::__shared_mutex_base::unlock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_19ISchedulingProviderEEERDavE9singleton);
}

void sub_18DB968C0(void *a1)
{
}

void AMSCore::ServiceProvider<AMSCore::StructuredData::IStructuredDataProvider>::getDefault(void *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_14StructuredData23IStructuredDataProviderEEERDavE9singleton, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_14StructuredData23IStructuredDataProviderEEERDavE9singleton))
  {
    std::__shared_mutex_base::__shared_mutex_base(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_14StructuredData23IStructuredDataProviderEEERDavE9singleton);
    xmmword_1EB38C5C8 = 0uLL;
    byte_1EB38C5D8 = 0;
    __cxa_guard_release(&_ZGVZN7AMSCore12_GLOBAL__N_18getStateINS_14StructuredData23IStructuredDataProviderEEERDavE9singleton);
  }
  std::__shared_mutex_base::lock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_14StructuredData23IStructuredDataProviderEEERDavE9singleton);
  if (!byte_1EB38C5D8) {
    std::terminate();
  }
  uint64_t v2 = *((void *)&xmmword_1EB38C5C8 + 1);
  *a1 = xmmword_1EB38C5C8;
  a1[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  std::__shared_mutex_base::unlock_shared(&_ZZN7AMSCore12_GLOBAL__N_18getStateINS_14StructuredData23IStructuredDataProviderEEERDavE9singleton);
}

void sub_18DB96994(void *a1)
{
}

BOOL AMSCore::StringUtils::CaseInsensitiveEqualTo::operator()(uint64_t a1, char *a2, uint64_t a3, char *a4, uint64_t a5)
{
  long long v9 = std::locale::classic();
  uint64_t v10 = std::locale::use_facet(v9, MEMORY[0x1E4FBA258]);
  if (a3 != a5) {
    return 0;
  }
  if (a3)
  {
    uint64_t v11 = v10;
    uint64_t v12 = a3 - 1;
    long long v13 = a2;
    size_t v14 = a4;
    while (1)
    {
      uint64_t v15 = v12;
      uint64_t v16 = *v14;
      int v17 = ((uint64_t (*)(const std::locale::facet *, void))v11->__vftable[1].__on_zero_shared)(v11, *v13);
      if (v17 != ((unsigned int (*)(const std::locale::facet *, uint64_t))v11->__vftable[1].__on_zero_shared)(v11, v16))break; {
      ++v13;
      }
      ++v14;
      uint64_t v12 = v15 - 1;
      if (!v15) {
        return v13 == &a2[a3] && v14 == &a4[a3];
      }
    }
    return 0;
  }
  size_t v14 = a4;
  long long v13 = a2;
  return v13 == &a2[a3] && v14 == &a4[a3];
}

uint64_t AMSCore::StringUtils::CaseInsensitiveHash::operator()(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v5 = std::locale::classic();
  uint64_t v6 = std::locale::use_facet(v5, MEMORY[0x1E4FBA258]);
  if (!a3) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  do
  {
    v8 ^= 2
        * ((int (*)(const std::locale::facet *, void))v7->__vftable[1].__on_zero_shared)(v7, *a2++);
    --a3;
  }
  while (a3);
  return v8;
}

const std::locale::facet *AMSCore::StringUtils::lowercase(uint64_t a1, char *a2, std::string::size_type a3)
{
  uint64_t v6 = std::locale::classic();
  __n128 result = std::locale::use_facet(v6, MEMORY[0x1E4FBA258]);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = 0;
  if (a3)
  {
    uint64_t v8 = result;
    std::string::append((std::string *)a1, a3, 0);
    if (*(char *)(a1 + 23) >= 0) {
      long long v9 = (unsigned char *)a1;
    }
    else {
      long long v9 = *(unsigned char **)a1;
    }
    do
    {
      __n128 result = (const std::locale::facet *)((uint64_t (*)(const std::locale::facet *, void))v8->__vftable[1].__on_zero_shared)(v8, *a2);
      *v9++ = (_BYTE)result;
      ++a2;
      --a3;
    }
    while (a3);
  }
  return result;
}

void sub_18DB96C20(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void AMSCore::StringUtils::split(char **a1, uint64_t a2, unint64_t a3, char *a4, int64_t a5, unint64_t a6)
{
  if (a3)
  {
    uint64_t v9 = a2;
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
    if (a5 && a6)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      long long v13 = (char *)(a2 + a3);
LABEL_5:
      size_t v14 = *a1;
      unint64_t v44 = (v11 - *a1) >> 4;
      if (v44 < a6)
      {
        uint64_t v15 = &v12[v9];
        int64_t v16 = v13 - &v12[v9];
        if (v16 >= a5)
        {
          int v17 = *a4;
          size_t v18 = v15;
          do
          {
            uint64_t v19 = v16 - a5;
            if (v19 == -1) {
              break;
            }
            int v20 = (char *)memchr(v18, v17, v19 + 1);
            if (!v20) {
              break;
            }
            uint64_t v21 = v20;
            if (!memcmp(v20, a4, a5))
            {
              if (v21 == v13) {
                break;
              }
              unint64_t v22 = &v21[-a2];
              if (&v21[-a2] == (char *)-1) {
                break;
              }
              if (v22 == v12)
              {
                unint64_t v23 = a3;
              }
              else
              {
                if (a3 - (unint64_t)v12 >= v22 - v12) {
                  uint64_t v24 = (char *)(v22 - v12);
                }
                else {
                  uint64_t v24 = (char *)(a3 - (void)v12);
                }
                unint64_t v25 = (unint64_t)a1[2];
                if ((unint64_t)v11 >= v25)
                {
                  unint64_t v27 = v44 + 1;
                  if ((v44 + 1) >> 60) {
                    std::vector<std::string>::__throw_length_error[abi:fe180100]();
                  }
                  uint64_t v28 = v25 - (void)v14;
                  if (v28 >> 3 > v27) {
                    unint64_t v27 = v28 >> 3;
                  }
                  if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0) {
                    unint64_t v29 = 0xFFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v29 = v27;
                  }
                  if (v29)
                  {
                    if (v29 >> 60) {
                      std::__throw_bad_array_new_length[abi:fe180100]();
                    }
                    uint64_t v30 = (char *)operator new(16 * v29);
                  }
                  else
                  {
                    uint64_t v30 = 0;
                  }
                  int v31 = &v30[16 * v44];
                  *(void *)int v31 = v15;
                  *((void *)v31 + 1) = v24;
                  uint64_t v32 = v31;
                  if (v11 == v14)
                  {
                    unint64_t v23 = a3;
                  }
                  else
                  {
                    unint64_t v23 = a3;
                    do
                    {
                      *((_OWORD *)v32 - 1) = *((_OWORD *)v11 - 1);
                      v32 -= 16;
                      v11 -= 16;
                    }
                    while (v11 != v14);
                    uint64_t v11 = *a1;
                  }
                  uint64_t v26 = v31 + 16;
                  *a1 = v32;
                  a1[1] = v31 + 16;
                  a1[2] = &v30[16 * v29];
                  if (v11) {
                    operator delete(v11);
                  }
                }
                else
                {
                  *(void *)uint64_t v11 = v15;
                  *((void *)v11 + 1) = v24;
                  uint64_t v26 = v11 + 16;
                  unint64_t v23 = a3;
                }
                a1[1] = v26;
                uint64_t v11 = v26;
              }
              uint64_t v12 = &v22[a5];
              BOOL v33 = (unint64_t)&v22[a5] >= v23;
              uint64_t v9 = a2;
              if (v33) {
                return;
              }
              goto LABEL_5;
            }
            size_t v18 = v21 + 1;
            int64_t v16 = v13 - (v21 + 1);
          }
          while (v16 >= a5);
        }
      }
      int v35 = &v12[a2];
      unint64_t v36 = a3 - (void)v12;
      unint64_t v37 = (unint64_t)a1[2];
      if ((unint64_t)v11 >= v37)
      {
        unint64_t v39 = v44 + 1;
        if ((v44 + 1) >> 60) {
          std::vector<std::string>::__throw_length_error[abi:fe180100]();
        }
        uint64_t v40 = v37 - (void)v14;
        if (v40 >> 3 > v39) {
          unint64_t v39 = v40 >> 3;
        }
        if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v41 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v41 = v39;
        }
        if (v41)
        {
          if (v41 >> 60) {
            std::__throw_bad_array_new_length[abi:fe180100]();
          }
          long long v42 = (char *)operator new(16 * v41);
        }
        else
        {
          long long v42 = 0;
        }
        uint64_t v43 = &v42[16 * v44];
        *(void *)uint64_t v43 = v35;
        *((void *)v43 + 1) = v36;
        size_t v38 = v43 + 16;
        if (v11 != v14)
        {
          do
          {
            *((_OWORD *)v43 - 1) = *((_OWORD *)v11 - 1);
            v43 -= 16;
            v11 -= 16;
          }
          while (v11 != v14);
          uint64_t v11 = *a1;
        }
        *a1 = v43;
        a1[1] = v38;
        a1[2] = &v42[16 * v41];
        if (v11) {
          operator delete(v11);
        }
      }
      else
      {
        *(void *)uint64_t v11 = v35;
        *((void *)v11 + 1) = v36;
        size_t v38 = v11 + 16;
      }
      a1[1] = v38;
    }
    else
    {
      size_t v34 = (char *)operator new(0x10uLL);
      a1[1] = v34 + 16;
      a1[2] = v34 + 16;
      *(void *)size_t v34 = v9;
      *((void *)v34 + 1) = a3;
      *a1 = v34;
    }
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void sub_18DB96F5C(_Unwind_Exception *exception_object)
{
  if (v2)
  {
    *(void *)(v1 + 8) = v2;
    operator delete(v2);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AMSCore::StringUtils::toHexString(std::string *a1, uint64_t a2, uint64_t a3)
{
  std::ostringstream::basic_ostringstream[abi:fe180100]((uint64_t)&v12);
  uint64_t v6 = v12;
  *(_DWORD *)((char *)v13 + *(void *)(v12 - 24)) = *(_DWORD *)((unsigned char *)v13 + *(void *)(v12 - 24)) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)v13 + *(void *)(v6 - 24)) |= 0x4000u;
  if (a3)
  {
    uint64_t v7 = (std::locale::id *)MEMORY[0x1E4FBA258];
    do
    {
      uint64_t v8 = v12;
      *(void *)((char *)&v13[2] + *(void *)(v12 - 24)) = 2;
      uint64_t v9 = (char *)&v13[-1] + *(void *)(v8 - 24);
      if (*((_DWORD *)v9 + 36) == -1)
      {
        std::ios_base::getloc((const std::ios_base *)((char *)&v13[-1] + *(void *)(v8 - 24)));
        uint64_t v10 = std::locale::use_facet(&v16, v7);
        ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
        std::locale::~locale(&v16);
      }
      *((_DWORD *)v9 + 36) = 48;
      std::ostream::operator<<();
      ++a2;
      --a3;
    }
    while (a3);
  }
  std::stringbuf::str[abi:fe180100]((uint64_t)v13, a1);
  uint64_t v12 = *MEMORY[0x1E4FBA418];
  *(void *)((char *)&v13[-1] + *(void *)(v12 - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v13[0] = MEMORY[0x1E4FBA470] + 16;
  if (v14 < 0) {
    operator delete((void *)v13[8]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x192FA3FD0](&v15);
}

void sub_18DB97204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t AMSCore::Unexpected<AMSCore::Error,AMSCore::ErrorCode,char const(&)[54]>(uint64_t a1, unsigned int a2)
{
  std::ostringstream::basic_ostringstream[abi:fe180100]((uint64_t)&v9);
  std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(&v9, (uint64_t)"This TimePoint could not be represented as struct tm.", 53);
  std::stringbuf::str[abi:fe180100]((uint64_t)&v9.__imp_, &v8);
  v9.__vftable = (std::system_error_vtbl *)*MEMORY[0x1E4FBA418];
  *(std::system_error_vtbl **)((char *)&v9.__vftable + (unint64_t)v9.__vftable[-1].~system_error) = *(std::system_error_vtbl **)(MEMORY[0x1E4FBA418] + 24);
  v9.__imp_.__imp_ = (const char *)(MEMORY[0x1E4FBA470] + 16);
  if (v15 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x192FA3FD0](&v16);
  *(void *)&v17.__val_ = a2;
  v17.__cat_ = (const std::error_category *)&AMSCore::Error::Category::generic(void)::instance;
  std::system_error::system_error(&v9, v17, &v8);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  v9.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
  uint64_t v10 = &v11;
  long long v13 = 0uLL;
  std::runtime_error::runtime_error((std::runtime_error *)a1, &v9);
  *(std::error_code *)(a1 + 16) = v9.__ec_;
  *(void *)a1 = &unk_1EDC827D8;
  uint64_t v4 = v11;
  *(void *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = a1 + 40;
  uint64_t v6 = v12;
  *(void *)(a1 + 48) = v12;
  if (v6)
  {
    *(void *)(v4 + 16) = v5;
    uint64_t v4 = 0;
    uint64_t v10 = &v11;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  else
  {
    *(void *)(a1 + 32) = v5;
  }
  *(_OWORD *)(a1 + 56) = v13;
  long long v13 = 0uLL;
  v9.__vftable = (std::system_error_vtbl *)&unk_1EDC827D8;
  std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v10, (unsigned int *)v4);
  return MEMORY[0x192FA3C30](&v9);
}

void sub_18DB97468(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

tm *AMSCore::localTimeSecondsFromUTC(uint64_t a1, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep a2)
{
  __t.__d_.__rep_ = a2;
  time_t v3 = std::chrono::system_clock::to_time_t(&__t);
  time_t v30 = v3;
  memset(&v15, 0, sizeof(v15));
  if (localtime_r(&v30, &v15))
  {
    std::runtime_error v23 = *(std::runtime_error *)&v15.tm_sec;
    long long v24 = *(_OWORD *)&v15.tm_mon;
    long long v25 = *(_OWORD *)&v15.tm_isdst;
    tm_zone = v15.tm_zone;
    char v28 = 1;
  }
  else
  {
    AMSCore::Unexpected<AMSCore::Error,AMSCore::ErrorCode,char const(&)[54]>((uint64_t)&v17, 3u);
    std::runtime_error::runtime_error(&v23, &v17);
    long long v24 = v18;
    uint64_t v4 = (unsigned int *)*((void *)&v19 + 1);
    v23.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
    long long v25 = v19;
    tm_zone = v20;
    if (v20)
    {
      *(void *)(*((void *)&v19 + 1) + 16) = (char *)&v25 + 8;
      *(void *)&long long v19 = (char *)&v19 + 8;
      *((void *)&v19 + 1) = 0;
      int v20 = 0;
      uint64_t v4 = 0;
    }
    else
    {
      *(void *)&long long v25 = (char *)&v25 + 8;
    }
    long long v27 = v21;
    long long v21 = 0uLL;
    char v28 = 0;
    v17.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
    std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v19, v4);
    MEMORY[0x192FA3C30](&v17);
    if (!v28)
    {
      AMSCore::Unexpected<AMSCore::Error,AMSCore::Error&>((uint64_t)&v17, &v23);
      std::runtime_error::runtime_error((std::runtime_error *)a1, &v17);
      *(_OWORD *)(a1 + 16) = v18;
      *(void *)a1 = &unk_1EDC827D8;
      uint64_t v12 = *((void *)&v19 + 1);
      *(void *)(a1 + 32) = v19;
      *(void *)(a1 + 40) = v12;
      uint64_t v13 = a1 + 40;
      char v14 = v20;
      *(void *)(a1 + 48) = v20;
      if (v14)
      {
        *(void *)(v12 + 16) = v13;
        *(void *)&long long v19 = (char *)&v19 + 8;
        *((void *)&v19 + 1) = 0;
        int v20 = 0;
        uint64_t v12 = 0;
      }
      else
      {
        *(void *)(a1 + 32) = v13;
      }
      *(_OWORD *)(a1 + 56) = v21;
      long long v21 = 0uLL;
      *(unsigned char *)(a1 + 72) = 0;
      v17.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
      std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v19, (unsigned int *)v12);
      __n128 result = (tm *)MEMORY[0x192FA3C30](&v17);
      if (v28) {
        return result;
      }
      return (tm *)((uint64_t (*)(std::runtime_error *))v23.~runtime_error)(&v23);
    }
  }
  if (!v22)
  {
    AMSCore::Unexpected<AMSCore::Error,AMSCore::Error&>((uint64_t)&v15, &v17);
    std::runtime_error::runtime_error((std::runtime_error *)a1, (const std::runtime_error *)&v15);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)&v15.tm_mon;
    *(void *)a1 = &unk_1EDC827D8;
    uint64_t tm_gmtoff = v15.tm_gmtoff;
    *(void *)(a1 + 32) = *(void *)&v15.tm_isdst;
    *(void *)(a1 + 40) = tm_gmtoff;
    uint64_t v10 = a1 + 40;
    uint64_t v11 = v15.tm_zone;
    *(void *)(a1 + 48) = v15.tm_zone;
    if (v11)
    {
      *(void *)(tm_gmtoff + 16) = v10;
      *(void *)&v15.tm_isdst = &v15.tm_gmtoff;
      v15.uint64_t tm_gmtoff = 0;
      v15.tm_zone = 0;
      uint64_t tm_gmtoff = 0;
    }
    else
    {
      *(void *)(a1 + 32) = v10;
    }
    *(_OWORD *)(a1 + 56) = v16;
    long long v16 = 0uLL;
    *(unsigned char *)(a1 + 72) = 0;
    *(void *)&v15.tm_sstd::error_code ec = &unk_1EDC827D8;
    std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v15.tm_isdst, (unsigned int *)tm_gmtoff);
    __n128 result = (tm *)MEMORY[0x192FA3C30](&v15);
    if (!v22) {
      __n128 result = (tm *)((uint64_t (*)(std::runtime_error *))v17.~runtime_error)(&v17);
    }
    if (v28) {
      return result;
    }
    return (tm *)((uint64_t (*)(std::runtime_error *))v23.~runtime_error)(&v23);
  }
  if (!v28)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 60
     * (60 * (SLODWORD(v23.__imp_.__imp_) - (uint64_t)SLODWORD(v17.__imp_.__imp_))
      - SHIDWORD(v17.__vftable)
      + SHIDWORD(v23.__vftable))
     - SLODWORD(v17.__vftable)
     + SLODWORD(v23.__vftable);
  int v7 = HIDWORD(v23.__imp_.__imp_) - HIDWORD(v17.__imp_.__imp_);
  if (HIDWORD(v23.__imp_.__imp_) - HIDWORD(v17.__imp_.__imp_) == 1 || v7 <= -2)
  {
    v6 += 86400;
  }
  else if (v7 > 1 || v7 == -1)
  {
    v6 -= 86400;
  }
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 72) = 1;
  if (!v28) {
    return (tm *)((uint64_t (*)(void))v23.~runtime_error)(&v23);
  }
  return result;
}

tm *AMSCore::anonymous namespace'::toUTC(AMSCore::_anonymous_namespace_ *this, time_t a2)
{
  time_t v15 = a2;
  memset(&v14, 0, sizeof(v14));
  __n128 result = gmtime_r(&v15, &v14);
  if (result)
  {
    long long v4 = *(_OWORD *)&v14.tm_mon;
    *(_OWORD *)this = *(_OWORD *)&v14.tm_sec;
    *((_OWORD *)this + 1) = v4;
    *((_OWORD *)this + 2) = *(_OWORD *)&v14.tm_isdst;
    *((void *)this + 6) = v14.tm_zone;
    *((unsigned char *)this + 72) = 1;
  }
  else
  {
    AMSCore::Unexpected<AMSCore::Error,AMSCore::ErrorCode,char const(&)[54]>((uint64_t)&v8, 3u);
    std::runtime_error::runtime_error((std::runtime_error *)this, &v8);
    *((_OWORD *)this + 1) = v9;
    *(void *)this = &unk_1EDC827D8;
    uint64_t v5 = v11;
    *((void *)this + 4) = v10;
    *((void *)this + 5) = v5;
    uint64_t v6 = (char *)this + 40;
    uint64_t v7 = v12;
    *((void *)this + 6) = v12;
    if (v7)
    {
      *(void *)(v5 + 16) = v6;
      uint64_t v10 = &v11;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v5 = 0;
    }
    else
    {
      *((void *)this + 4) = v6;
    }
    *(_OWORD *)((char *)this + 56) = v13;
    long long v13 = 0uLL;
    *((unsigned char *)this + 72) = 0;
    v8.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
    std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v10, (unsigned int *)v5);
    return (tm *)MEMORY[0x192FA3C30](&v8);
  }
  return result;
}

void AMSCore::stringify_time_s(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = 2147483647000000;
  if (a2 < 2147483647000000) {
    uint64_t v5 = a2;
  }
  __t.__d_.__rep_ = v5 & ~(v5 >> 63);
  time_t v6 = std::chrono::system_clock::to_time_t(&__t);
  if (v51)
  {
    uint64_t v7 = off_1E559E248[a3];
    std::ostringstream::basic_ostringstream[abi:fe180100]((uint64_t)&v28);
    if (v51)
    {
      MEMORY[0x192FA3C50](&__dst, &v28);
      if (LOBYTE(__dst.__vftable))
      {
        std::ios_base::getloc((const std::ios_base *)((char *)&v28 + (unint64_t)v28.__vftable[-1].~runtime_error));
        std::locale::use_facet(&v53, MEMORY[0x1E4FBA2B0]);
        std::locale::~locale(&v53);
        std::runtime_error v8 = (char *)&v28 + (unint64_t)v28.__vftable[-1].~runtime_error;
        if (*((_DWORD *)v8 + 36) == -1)
        {
          std::ios_base::getloc((const std::ios_base *)((char *)&v28 + (unint64_t)v28.__vftable[-1].~runtime_error));
          long long v9 = std::locale::use_facet(&v53, MEMORY[0x1E4FBA258]);
          int v10 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v9->__vftable[2].~facet_0)(v9, 32);
          std::locale::~locale(&v53);
          *((_DWORD *)v8 + 36) = v10;
        }
        strlen(v7);
        if (!std::time_put<char,std::ostreambuf_iterator<char>>::put()) {
          std::ios_base::clear((std::ios_base *)((char *)&v28 + (unint64_t)v28.__vftable[-1].~runtime_error), *(_DWORD *)((char *)&v30 + (unint64_t)v28.__vftable[-1].~runtime_error) | 1);
        }
      }
      MEMORY[0x192FA3C60](&__dst);
      if ((v37 & 0x10) != 0)
      {
        unint64_t v13 = v36;
        if (v36 < (unint64_t)v33)
        {
          unint64_t v36 = v33;
          unint64_t v13 = v33;
        }
        tm v14 = __src;
        size_t v11 = v13 - (void)__src;
        if ((uint64_t)(v13 - (void)__src) >= 0) {
          goto LABEL_20;
        }
      }
      else
      {
        if ((v37 & 8) == 0)
        {
          size_t v11 = 0;
          BYTE7(v40) = 0;
          p_dst = (std::runtime_error_vtbl *)&__dst;
          goto LABEL_28;
        }
        tm v14 = (void *)*((void *)&v29 + 1);
        size_t v11 = (size_t)v31 - *((void *)&v29 + 1);
        if ((uint64_t)v31 - *((void *)&v29 + 1) >= 0)
        {
LABEL_20:
          if (v11 >= 0x7FFFFFFFFFFFFFF8) {
            std::string::__throw_length_error[abi:fe180100]();
          }
          if (v11 >= 0x17)
          {
            uint64_t v15 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v11 | 7) != 0x17) {
              uint64_t v15 = v11 | 7;
            }
            uint64_t v16 = v15 + 1;
            p_dst = (std::runtime_error_vtbl *)operator new(v15 + 1);
            __dst.__imp_.__imp_ = (const char *)v11;
            *(void *)&long long v40 = v16 | 0x8000000000000000;
            __dst.__vftable = p_dst;
          }
          else
          {
            BYTE7(v40) = v11;
            p_dst = (std::runtime_error_vtbl *)&__dst;
            if (!v11) {
              goto LABEL_28;
            }
          }
          memmove(p_dst, v14, v11);
LABEL_28:
          *((unsigned char *)&p_dst->~runtime_error + v11) = 0;
          *(std::runtime_error *)char v22 = __dst;
          *(void *)&long long v23 = v40;
          char v27 = 1;
          v28.__vftable = (std::runtime_error_vtbl *)*MEMORY[0x1E4FBA418];
          *(std::runtime_error_vtbl **)((char *)&v28.__vftable + (unint64_t)v28.__vftable[-1].~runtime_error) = *(std::runtime_error_vtbl **)(MEMORY[0x1E4FBA418] + 24);
          v28.__imp_.__imp_ = (const char *)(MEMORY[0x1E4FBA470] + 16);
          if (v35 < 0) {
            operator delete(__p);
          }
          std::streambuf::~streambuf();
          std::ostream::~ostream();
          MEMORY[0x192FA3FD0](&v38);
          goto LABEL_40;
        }
      }
    }
    __break(1u);
    return;
  }
  std::runtime_error::runtime_error(&v28, &v45);
  long long v29 = v46;
  v28.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
  time_t v30 = v47;
  int v31 = (unsigned int *)v48;
  __int16 __src = v49;
  if (v49)
  {
    *(void *)(v48 + 16) = &v31;
    char v47 = (unsigned int **)&v48;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
  }
  else
  {
    time_t v30 = &v31;
  }
  long long v33 = v50;
  long long v50 = 0uLL;
  LOBYTE(__p) = 1;
  AMSCore::Unexpected<AMSCore::Error,AMSCore::Error>((uint64_t)&__dst, (uint64_t)&v28);
  std::runtime_error::runtime_error((std::runtime_error *)v22, &__dst);
  long long v23 = v40;
  std::runtime_error v17 = (unsigned int *)v42;
  v22[0] = &unk_1EDC827D8;
  long long v24 = v41;
  v25[0] = v42;
  v25[1] = v43;
  if (v43)
  {
    *(void *)(v42 + 16) = v25;
    unint64_t v41 = &v42;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    std::runtime_error v17 = 0;
  }
  else
  {
    long long v24 = v25;
  }
  long long v26 = v44;
  long long v44 = 0uLL;
  char v27 = 0;
  __dst.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
  std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v41, v17);
  MEMORY[0x192FA3C30](&__dst);
  if ((_BYTE)__p)
  {
    v28.__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
    long long v18 = (std::__shared_weak_count *)*((void *)&v33 + 1);
    if (*((void *)&v33 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v33 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
    std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v30, v31);
    MEMORY[0x192FA3C30](&v28);
  }
LABEL_40:
  if (v51)
  {
    if (v27) {
      goto LABEL_42;
    }
LABEL_45:
    (*(void (**)(void **))v22[0])(v22);
    if (a3 == 2)
    {
      long long v19 = (char *)operator new(0x20uLL);
      *(void *)a1 = v19;
      long long v20 = xmmword_18DDE9BA0;
      long long v21 = "Thu, 01 Jan 1970 00:00:00 GMT";
    }
    else
    {
      if (a3 != 1)
      {
        *(unsigned char *)(a1 + 23) = 20;
        strcpy((char *)a1, "1970-01-01T00:00:00Z");
        return;
      }
      long long v19 = (char *)operator new(0x20uLL);
      *(void *)a1 = v19;
      long long v20 = xmmword_18DDE9BA0;
      long long v21 = "Thu, 01-Jan-1970 00:00:00 GMT";
    }
    *(_OWORD *)(a1 + 8) = v20;
    *(_OWORD *)long long v19 = *(_OWORD *)v21;
    *(_OWORD *)(v19 + 13) = *(_OWORD *)(v21 + 13);
    v19[29] = 0;
    return;
  }
  ((void (*)(std::runtime_error *))v45.~runtime_error)(&v45);
  if (!v27) {
    goto LABEL_45;
  }
LABEL_42:
  if (SBYTE7(v23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)a1, (const std::string::value_type *)v22[0], (std::string::size_type)v22[1]);
    if (v27)
    {
      if (SBYTE7(v23) < 0) {
        operator delete(v22[0]);
      }
    }
    else
    {
      (*(void (**)(void **))v22[0])(v22);
    }
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)v22;
    *(void *)(a1 + 16) = v23;
  }
}

void sub_18DB9804C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  MEMORY[0x192FA3C60](v19 - 248);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)&a19 + *(void *)(a19 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x18DB97B54);
}

void sub_18DB980B8(void *a1)
{
}

uint64_t AMSCore::parseDateString(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:fe180100]((uint64_t)v25);
  std::__put_character_sequence[abi:fe180100]<char,std::char_traits<char>>(v26, a2, a3);
  memset(&v24, 0, sizeof(v24));
  std::runtime_error v8 = (std::ios_base *)((char *)v25 + *(void *)(v25[0] - 24));
  MEMORY[0x192FA3F40](&__loc);
  std::ios_base::getloc(v8);
  std::ios_base::imbue(v8, &__loc);
  std::locale::~locale((std::locale *)v17);
  rdbuf = (std::locale *)v8->__rdbuf_;
  if (rdbuf)
  {
    (*((void (**)(std::locale *, std::locale *))rdbuf->__locale_ + 2))(rdbuf, &__loc);
    int v10 = rdbuf + 1;
    std::locale::locale(&v29, v10);
    std::locale::operator=(v10, &__loc);
    std::locale::~locale(&v29);
  }
  std::locale::~locale(&v23);
  std::locale::~locale(&__loc);
  if (a4[23] < 0) {
    a4 = *(const char **)a4;
  }
  MEMORY[0x192FA3C40](&__loc, v25, 0);
  if (LOBYTE(__loc.__locale_))
  {
    LODWORD(v29.__locale_) = 0;
    std::ios_base::getloc((const std::ios_base *)((char *)v25 + *(void *)(v25[0] - 24)));
    std::locale::use_facet((const std::locale *)v17, MEMORY[0x1E4FBA2A8]);
    std::locale::~locale((std::locale *)v17);
    strlen(a4);
    std::time_get<char,std::istreambuf_iterator<char>>::get();
    std::ios_base::clear((std::ios_base *)((char *)v25 + *(void *)(v25[0] - 24)), *(_DWORD *)((char *)&v26[2] + *(void *)(v25[0] - 24)) | LODWORD(v29.__locale_));
  }
  if ((*((unsigned char *)&v26[2] + *(void *)(v25[0] - 24)) & 5) != 0 || (time_t v14 = timegm(&v24), v14 == -1))
  {
    AMSCore::Unexpected<AMSCore::Error,AMSCore::ErrorCode,char const(&)[28]>((uint64_t)v17, 3u, "Unable to parse time string");
    std::runtime_error::runtime_error((std::runtime_error *)a1, v17);
    *(std::runtime_error *)(a1 + 16) = v17[1];
    *(void *)a1 = &unk_1EDC827D8;
    uint64_t v11 = v19;
    *(void *)(a1 + 32) = v18;
    *(void *)(a1 + 40) = v11;
    uint64_t v12 = a1 + 40;
    uint64_t v13 = v20;
    *(void *)(a1 + 48) = v20;
    if (v13)
    {
      *(void *)(v11 + 16) = v12;
      long long v18 = &v19;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v11 = 0;
    }
    else
    {
      *(void *)(a1 + 32) = v12;
    }
    *(_OWORD *)(a1 + 56) = v21;
    long long v21 = 0uLL;
    *(unsigned char *)(a1 + 72) = 0;
    v17[0].__vftable = (std::runtime_error_vtbl *)&unk_1EDC827D8;
    std::__tree<std::__value_type<std::string,AMSCore::Any>,std::__map_value_compare<std::string,std::__value_type<std::string,AMSCore::Any>,std::less<void>,true>,std::allocator<std::__value_type<std::string,AMSCore::Any>>>::destroy((uint64_t)&v18, (unsigned int *)v11);
    MEMORY[0x192FA3C30](v17);
  }
  else
  {
    *(std::chrono::system_clock::time_point *)a1 = std::chrono::system_clock::from_time_t(v14);
    *(unsigned char *)(a1 + 72) = 1;
  }
  v25[0] = *MEMORY[0x1E4FBA408];
  uint64_t v15 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)v25 + *(void *)(v25[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  v26[0] = v15;
  v26[1] = MEMORY[0x1E4FBA470] + 16;
  if (v27 < 0) {
    operator delete((void *)v26[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x192FA3FD0](&v28);
}

void sub_18DB984F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, std::locale a19, std::locale a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA408];
  uint64_t v3 = *MEMORY[0x1E4FBA408];
  *(void *)a1 = *MEMORY[0x1E4FBA408];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x192FA3FD0](a1 + 128);
  return a1;
}

void AMSCore::toStringVector(std::vector<std::string> *a1, long long **a2)
{
  a1->__begin_ = 0;
  a1->__end_ = 0;
  a1->__end_cap_.__value_ = 0;
  std::vector<std::string>::reserve(a1, ((char *)a2[1] - (char *)*a2) >> 5);
  uint64_t v5 = *a2;
  for (i = a2[1]; v5 != i; v5 += 2)
  {
    if (*((_DWORD *)v5 + 6) == 5) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = 0;
    }
    if (*((_DWORD *)v5 + 6) == 5)
    {
      if (*((char *)v7 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v7, *((void *)v7 + 1));
      }
      else
      {
        long long v8 = *v7;
        __p.__r_.__value_.__r.__words[2] = *((void *)v7 + 2);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v8;
      }
      char v13 = 1;
      std::vector<std::string>::pointer end = a1->__end_;
      if (end < a1->__end_cap_.__value_)
      {
        long long v6 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        end->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
        *(_OWORD *)&end->__r_.__value_.__l.__data_ = v6;
        a1->__end_ = end + 1;
      }
      else
      {
        int v10 = std::vector<std::string>::__emplace_back_slow_path<std::string>((void **)&a1->__begin_, (uint64_t)&__p);
        int v11 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
        a1->__end_ = (std::vector<std::string>::pointer)v10;
        if (v13)
        {
          if (v11 < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
        }
      }
    }
  }
}

void sub_18DB9A92C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __destructor_8_s0_s8_s16((uint64_t)va);
  _Unwind_Resume(a1);
}

void __destructor_8_s0_s8_s16(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
}

void sub_18DB9DE70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBA30A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DBA42E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18DBA63B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

AMSPromise *AMSCookieDatabasePath(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(AMSPromise);
  id v3 = v1;
  uint64_t v4 = +[AMSCookieService sharedService];
  uint64_t v5 = [(AMSPromise *)v2 completionHandlerAdapter];
  [v4 getCookieDatabasePathForAccount:v3 withCompletion:v5];

  return v2;
}

void sub_18DBA844C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DBAA9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

AMSMutableBinaryPromise *AMSSaveAccount(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = objc_alloc_init(AMSMutableBinaryPromise);
  long long v8 = [(AMSBinaryPromise *)v7 completionHandlerAdapter];
  [v5 saveAccount:v6 withDataclassActions:0 doVerify:a3 completion:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __AMSSaveAccount_block_invoke;
  v12[3] = &unk_1E559E7E8;
  id v13 = v5;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  [(AMSBinaryPromise *)v7 addErrorBlock:v12];

  return v7;
}

void __AMSSaveAccount_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = (objc_class *)objc_opt_class();
  AMSCheckErrorForUnitTestAccess(v5, v4);
  id v6 = +[AMSLogConfig sharedAccountsConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    long long v8 = AMSLogKey();
    id v9 = NSString;
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = v10;
    if (v8)
    {
      uint64_t v2 = AMSLogKey();
      [v9 stringWithFormat:@"%@: [%@] ", v11, v2];
    }
    else
    {
      [v9 stringWithFormat:@"%@: ", v10];
    uint64_t v12 = };
    id v13 = AMSHashIfNeeded(*(void **)(a1 + 40));
    id v14 = AMSLogableError(v4);
    *(_DWORD *)buf = 138543874;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    long long v18 = v13;
    __int16 v19 = 2114;
    uint64_t v20 = v14;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to save an account. account = %{public}@ | error = %{public}@", buf, 0x20u);
    if (v8)
    {

      uint64_t v12 = (void *)v2;
    }
  }
}

uint64_t AMSSaveVerifiedAccount(void *a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v22 = 0;
  uint64_t v7 = [v5 saveVerifiedAccount:v6 error:&v22];
  id v8 = v22;
  if ((v7 & 1) == 0)
  {
    id v9 = (objc_class *)objc_opt_class();
    AMSCheckErrorForUnitTestAccess(v9, v8);
    uint64_t v10 = +[AMSLogConfig sharedAccountsConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = a3;
      uint64_t v12 = AMSLogKey();
      id v13 = NSString;
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = v14;
      if (v12)
      {
        uint64_t v20 = AMSLogKey();
        [v13 stringWithFormat:@"%@: [%@] ", v15, v20];
      }
      else
      {
        [v13 stringWithFormat:@"%@: ", v14];
      uint64_t v16 = };
      __int16 v17 = AMSHashIfNeeded(v6);
      long long v18 = AMSLogableError(v8);
      *(_DWORD *)buf = 138543874;
      tm v24 = v16;
      __int16 v25 = 2114;
      long long v26 = v17;
      __int16 v27 = 2114;
      uint64_t v28 = v18;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to save a verified account. account = %{public}@ | error = %{public}@", buf, 0x20u);
      if (v12)
      {

        uint64_t v16 = (void *)v20;
      }

      a3 = v21;
    }

    if (a3) {
      *a3 = v8;
    }
  }

  return v7;
}

AMSMutablePromise *AMSFetchAccountWithIdentifier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init(AMSMutablePromise);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __AMSFetchAccountWithIdentifier_block_invoke;
  v12[3] = &unk_1E559EB80;
  id v6 = v5;
  id v13 = v6;
  id v14 = v4;
  id v15 = v3;
  id v7 = v3;
  id v8 = v4;
  [v7 accountWithIdentifier:v8 completion:v12];
  id v9 = v15;
  uint64_t v10 = v6;

  return v10;
}

void __AMSFetchAccountWithIdentifier_block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v11 = (id)v5;
  if (a2 | v5)
  {
    id v9 = (void *)[(id)a2 copy];
    [v6 finishWithResult:v9 error:v11];

    uint64_t v10 = (objc_class *)objc_opt_class();
    AMSCheckErrorForUnitTestAccess(v10, v11);
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"ACAccountStore+AMS: No account was found for identifier %@. No error returned either", *(void *)(a1 + 40)];
    id v8 = AMSError(7, v7, 0, 0);
    [v6 finishWithError:v8];
  }
}

id AMSAccountWithIdentifier(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = (void *)MEMORY[0x192FA47D0]();
  id v13 = 0;
  id v8 = [v5 accountWithIdentifier:v6 error:&v13];
  id v9 = v13;
  uint64_t v10 = (void *)[v8 copy];
  id v11 = (objc_class *)objc_opt_class();
  AMSCheckErrorForUnitTestAccess(v11, v9);

  if (a3 && !v10) {
    *a3 = v9;
  }

  return v10;
}

uint64_t __OnBoardingKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_18DBAF308(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18DBB0F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAppleIDAuthenticationAppleIDSettingsTokenIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!qword_1EB38D618)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __AppleIDSSOAuthenticationLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E559EDE0;
    uint64_t v7 = 0;
    qword_1EB38D618 = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_1EB38D618;
    if (qword_1EB38D618)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_1EB38D618;
LABEL_5:
  uint64_t result = dlsym(v2, "AppleIDAuthenticationAppleIDSettingsTokenIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB38D610 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppleIDSSOAuthenticationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB38D618 = result;
  return result;
}

void sub_18DBB83DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DBBF498(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_18DBC04DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBC1A14(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_18DBC1F84(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18DBC76E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  _Block_object_dispose(&a25, 8);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DBC88DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DBC89F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DBC8A58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DBC8DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_18DBC8F84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DBC9018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18DBC90D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DBC91F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 40));

  _Unwind_Resume(a1);
}

void sub_18DBC93D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DBC967C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DBC9748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18DBC98FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DBC9C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_18DBC9D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DBCA0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBCA778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DBCA86C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DBCA9B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18DBCAACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DBCB484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBCB600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AMSBagKeySetCacheKey(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"%@:%@", a1, a2];
}

__CFString *NSStringFromBagValueType(unint64_t a1)
{
  if (a1 > 6) {
    return 0;
  }
  else {
    return off_1E559FFD0[a1];
  }
}

__CFString *AMSBagKeyForPurchaseType(unint64_t a1)
{
  if (a1 > 5) {
    return 0;
  }
  else {
    return off_1E55A0008[a1];
  }
}

void sub_18DBCC344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DBCC52C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DBCC650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_18DBCC78C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DBCC82C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18DBCC954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18DBCCA00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18DBCCA88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DBCCD34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

id getBiometricKitClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getBiometricKitClass_softClass;
  uint64_t v7 = getBiometricKitClass_softClass;
  if (!getBiometricKitClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getBiometricKitClass_block_invoke;
    v3[3] = &unk_1E559EC70;
    v3[4] = &v4;
    __getBiometricKitClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18DBCD738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBiometricKitIdentityClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getBiometricKitIdentityClass_softClass;
  uint64_t v7 = getBiometricKitIdentityClass_softClass;
  if (!getBiometricKitIdentityClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getBiometricKitIdentityClass_block_invoke;
    v3[3] = &unk_1E559EC70;
    v3[4] = &v4;
    __getBiometricKitIdentityClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18DBCDDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBD1BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBD1E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getBiometricKitClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BiometricKit");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBiometricKitClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    BiometricKitLibrary();
  }
}

void BiometricKitLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!BiometricKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __BiometricKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E55A05F0;
    uint64_t v3 = 0;
    BiometricKitLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (BiometricKitLibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __BiometricKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiometricKitLibraryCore_frameworkLibrary = result;
  return result;
}

AMSBiometricsDisableTask *__getBiometricKitIdentityClass_block_invoke(uint64_t a1)
{
  BiometricKitLibrary();
  uint64_t result = (AMSBiometricsDisableTask *)objc_getClass("BiometricKitIdentity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBiometricKitIdentityClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (AMSBiometricsDisableTask *)abort_report_np();
    return [(AMSBiometricsDisableTask *)v3 initWithAccount:v5];
  }
  return result;
}

void sub_18DBD3A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBD3DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBD419C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBD4404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBD6190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBD6BE4(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_18DBD8820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBD946C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18DBDA13C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    uint64_t v12 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v12)
    {
      uint64_t v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = AMSHashIfNeeded(v11);
      LODWORD(buf) = 138543618;
      *(void *)((char *)&buf + 4) = v15;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v16;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@Error parsing buyParams string: %@", (uint8_t *)&buf, 0x16u);
    }
    objc_end_catch();
    JUMPOUT(0x18DBDA058);
  }
  _Unwind_Resume(a1);
}

void sub_18DBDABD8(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v4 = objc_begin_catch(exception_object);
    BOOL v5 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v6 = *(void **)(v2 + 136);
    if (v5)
    {
      uint64_t v7 = [v6 sharedPurchaseConfig];
      if (!v7)
      {
        uint64_t v7 = [*(id *)(v2 + 136) sharedConfig];
      }
      uint64_t v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v11 = AMSHashIfNeeded(v4);
        *(_DWORD *)(v3 - 128) = 138543618;
        uint64_t v12 = v3 - 128;
        *(void *)(v12 + 4) = v10;
        *(_WORD *)(v3 - 116) = 2112;
        *(void *)(v12 + 14) = v11;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Exception parsing buyParams string: %@", (uint8_t *)(v3 - 128), 0x16u);
      }
      id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v14 = [*(id *)(v2 + 136) sharedPurchaseConfig];
      [v13 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v14 userInfo:0];
    }
    else
    {
      id v13 = [v6 sharedPurchaseConfig];
      if (!v13)
      {
        id v13 = [*(id *)(v2 + 136) sharedConfig];
      }
      id v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        id v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = AMSHashIfNeeded(v4);
        *(_DWORD *)(v3 - 128) = 138543618;
        uint64_t v18 = v3 - 128;
        *(void *)(v18 + 4) = v16;
        *(_WORD *)(v3 - 116) = 2112;
        *(void *)(v18 + 14) = v17;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_FAULT, "%{public}@: Exception parsing buyParams string: %@", (uint8_t *)(v3 - 128), 0x16u);
      }
    }

    objc_end_catch();
    JUMPOUT(0x18DBDAB94);
  }
  _Unwind_Resume(exception_object);
}

id AMSBagKeyBuyProductOverrideForProductType(void *a1)
{
  id v1 = a1;
  if (qword_1EB38D6F0 != -1) {
    dispatch_once(&qword_1EB38D6F0, &__block_literal_global_273);
  }
  uint64_t v2 = [(id)qword_1EB38D6F8 objectForKeyedSubscript:v1];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void __AMSBagKeyBuyProductOverrideForProductType_block_invoke()
{
  v3[12] = *MEMORY[0x1E4F143B8];
  v2[0] = @"A";
  v2[1] = @"ASB";
  v3[0] = @"buyAddOn";
  v3[1] = @"buyAppSalableBundle";
  v2[2] = @"C";
  v2[3] = @"B";
  v3[2] = @"buyApplication";
  v3[3] = @"buyBooklet";
  v2[4] = @"W";
  v2[5] = @"P";
  v3[4] = @"buyPiece";
  void v3[5] = @"buyPlayList";
  v2[6] = @"PUB";
  v2[7] = @"PC";
  v3[6] = @"buyPublication";
  v3[7] = @"buyPublicationChapter";
  v2[8] = @"Q";
  v2[9] = @"G";
  v3[8] = @"buySeasonPass";
  v3[9] = @"buySoftware";
  v2[10] = @"S";
  v2[11] = @"V";
  v3[10] = @"buySong";
  v3[11] = @"buyVideo";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:12];
  id v1 = (void *)qword_1EB38D6F8;
  qword_1EB38D6F8 = v0;
}

void sub_18DBDD008(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18DBDDCC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18DBDE1B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initPKPaymentRequest()
{
  if (qword_1E91C8A88 != -1) {
    dispatch_once(&qword_1E91C8A88, &__block_literal_global_23);
  }
  Class result = objc_getClass("PKPaymentRequest");
  _MergedGlobals_4 = (uint64_t)result;
  _MergedGlobals_3[0] = (uint64_t (*)())PKPaymentRequestFunction;
  return result;
}

id PKPaymentRequestFunction()
{
  return (id)_MergedGlobals_4;
}

void *__PassKitCoreLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/PassKitCore.framework/PassKitCore", 2);
  PassKitCoreLibrary_sLib = (uint64_t)result;
  return result;
}

Class initPKPaymentMerchantSession()
{
  if (qword_1E91C8A88 != -1) {
    dispatch_once(&qword_1E91C8A88, &__block_literal_global_23);
  }
  Class result = objc_getClass("PKPaymentMerchantSession");
  qword_1E91C8A90 = (uint64_t)result;
  off_1EB38A950[0] = (uint64_t (*)())PKPaymentMerchantSessionFunction;
  return result;
}

id PKPaymentMerchantSessionFunction()
{
  return (id)qword_1E91C8A90;
}

Class initPKPaymentSummaryItem()
{
  if (qword_1E91C8A88 != -1) {
    dispatch_once(&qword_1E91C8A88, &__block_literal_global_23);
  }
  Class result = objc_getClass("PKPaymentSummaryItem");
  qword_1E91C8A98 = (uint64_t)result;
  off_1EB38A958 = (uint64_t (*)())PKPaymentSummaryItemFunction;
  return result;
}

id PKPaymentSummaryItemFunction()
{
  return (id)qword_1E91C8A98;
}

Class initPKPaymentAuthorizationController()
{
  if (qword_1E91C8AA8 != -1) {
    dispatch_once(&qword_1E91C8AA8, &__block_literal_global_292);
  }
  Class result = objc_getClass("PKPaymentAuthorizationController");
  qword_1E91C8AA0 = (uint64_t)result;
  getPKPaymentAuthorizationControllerClass = (uint64_t (*)())PKPaymentAuthorizationControllerFunction;
  return result;
}

id PKPaymentAuthorizationControllerFunction()
{
  return (id)qword_1E91C8AA0;
}

void *__PassKitUILibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/PassKitUI.framework/PassKitUI", 2);
  PassKitUILibrary_sLib = (uint64_t)result;
  return result;
}

Class initPKPaymentAuthorizationResult()
{
  if (qword_1E91C8A88 != -1) {
    dispatch_once(&qword_1E91C8A88, &__block_literal_global_23);
  }
  Class result = objc_getClass("PKPaymentAuthorizationResult");
  qword_1E91C8AB0 = (uint64_t)result;
  getPKPaymentAuthorizationResultClass_0 = (uint64_t (*)())PKPaymentAuthorizationResultFunction;
  return result;
}

id PKPaymentAuthorizationResultFunction()
{
  return (id)qword_1E91C8AB0;
}

void sub_18DBE2594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBE2B1C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18DBE2DC8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18DBE3044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBE3494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBE3B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKAuthenticatorClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1EB38D728)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __PassKitUIFoundationLibraryCore_block_invoke;
    std::runtime_error v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E55A0BA0;
    uint64_t v6 = 0;
    qword_1EB38D728 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_1EB38D728)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PKAuthenticator");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  _MergedGlobals_90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitUIFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB38D728 = result;
  return result;
}

void __getPKInAppPaymentServiceClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PKInAppPaymentService");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKInAppPaymentServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    PassKitCoreLibrary();
  }
}

void PassKitCoreLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __PassKitCoreLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E55A0BB8;
    uint64_t v3 = 0;
    PassKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (PassKitCoreLibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __PassKitCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore_frameworkLibrary = result;
  return result;
}

AMSCardEnrollmentEligibilityTask *__getPKPaymentServiceClass_block_invoke(uint64_t a1)
{
  PassKitCoreLibrary();
  uint64_t result = (AMSCardEnrollmentEligibilityTask *)objc_getClass("PKPaymentService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKPaymentServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (AMSCardEnrollmentEligibilityTask *)abort_report_np();
    return [(AMSCardEnrollmentEligibilityTask *)v3 initWithBag:v5];
  }
  return result;
}

void sub_18DBE5E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPKPassLibraryClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PKPassLibrary");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_1_4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    PassKitCoreLibrary_0();
  }
}

void PassKitCoreLibrary_0()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!PassKitCoreLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __PassKitCoreLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E55A0CE0;
    uint64_t v3 = 0;
    PassKitCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (PassKitCoreLibraryCore_frameworkLibrary_0)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __PassKitCoreLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getPKPaymentPassClass_block_invoke(uint64_t a1)
{
  PassKitCoreLibrary_0();
  Class result = objc_getClass("PKPaymentPass");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1EB38D098 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)abort_report_np();
    return (Class)+[AMSCardEnrollmentPaymentSessionService performSilentEnrollmentWithRequest:v5 logKey:v6];
  }
  return result;
}

void sub_18DBE7B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBE8AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBE8CB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18DBE8E38(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18DBE91CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void __getSSSilentEnrollmentContextClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SSSilentEnrollmentContext");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSSilentEnrollmentContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    StoreServicesLibrary();
  }
}

void StoreServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!StoreServicesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __StoreServicesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E55A0D48;
    uint64_t v3 = 0;
    StoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (StoreServicesLibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __StoreServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  StoreServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSSSilentEnrollmentPaymentSessionClass_block_invoke(uint64_t a1)
{
  StoreServicesLibrary();
  Class result = objc_getClass("SSSilentEnrollmentPaymentSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSSilentEnrollmentPaymentSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return __getPKPaymentMerchantSessionClass_block_invoke(v3);
  }
  return result;
}

Class __getPKPaymentMerchantSessionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1EB38D738)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __PassKitCoreLibraryCore_block_invoke_1;
    std::runtime_error v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E55A0D60;
    uint64_t v6 = 0;
    qword_1EB38D738 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!qword_1EB38D738)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PKPaymentMerchantSession");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  _MergedGlobals_91 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitCoreLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  qword_1EB38D738 = result;
  return result;
}

void sub_18DBEA6D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBEA7E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18DBEA96C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void __getSSSilentEnrollmentContextClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SSSilentEnrollmentContext");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSSilentEnrollmentContextClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    StoreServicesLibrary_0();
  }
}

void StoreServicesLibrary_0()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!StoreServicesLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __StoreServicesLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E55A0D78;
    uint64_t v3 = 0;
    StoreServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (StoreServicesLibraryCore_frameworkLibrary_0)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __StoreServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  StoreServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

AMSCardMetadataRegistrationResult *__getSSSilentEnrollmentVerificationClass_block_invoke(uint64_t a1)
{
  StoreServicesLibrary_0();
  uint64_t result = (AMSCardMetadataRegistrationResult *)objc_getClass("SSSilentEnrollmentVerification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSSSilentEnrollmentVerificationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (AMSCardMetadataRegistrationResult *)abort_report_np();
    return [(AMSCardMetadataRegistrationResult *)v3 init];
  }
  return result;
}

void sub_18DBEB754(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18DBEBA78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18DBEBC04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initPKInAppPaymentService()
{
  if (qword_1EB38D3B0 != -1) {
    dispatch_once(&qword_1EB38D3B0, &__block_literal_global_26);
  }
  Class result = objc_getClass("PKInAppPaymentService");
  _MergedGlobals_3_2 = (uint64_t)result;
  getPKInAppPaymentServiceClass = (uint64_t (*)())PKInAppPaymentServiceFunction;
  return result;
}

id PKInAppPaymentServiceFunction()
{
  return (id)_MergedGlobals_3_2;
}

void *__PassKitCoreLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/PassKitCore.framework/PassKitCore", 2);
  PassKitCoreLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void sub_18DBF1CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DBF46F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBF7180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18DBF72C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBF73F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBF74F0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_18DBF7728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBF7AC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18DBF9A60(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18DBFB770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBFB9E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DBFBEB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  _Unwind_Resume(a1);
}

void sub_18DBFEBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC0008C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_18DC0139C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

uint64_t AMSCookieDatabaseColumnForNSHTTPCookiePropertyKey(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4F18C28]])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F18C58]])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F18C30]])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F18C60]])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F18C10]])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F18C38]])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F18C50]])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F18C18]])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F18BF8]])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F18C00]])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F18C08]])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F18C20]])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F18C40]])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F18C48]])
  {
    uint64_t v2 = 10;
  }
  else
  {
    uint64_t v2 = 14;
  }

  return v2;
}

__CFString *AMSTypeForAMSCookieDatabaseColumn(unint64_t a1)
{
  if (a1 >= 0xE) {
    return 0;
  }
  else {
    return @"TEXT";
  }
}

uint64_t AMSCookieDatabaseColumnIsPrimaryKey(unint64_t a1)
{
  return (a1 < 9) & (0x148u >> a1);
}

uint64_t AMSCookieDatabaseColumnIsNullable(unint64_t a1)
{
  return (a1 > 8) | (0xB7u >> a1) & 1;
}

void sub_18DC02114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initTapToRadarService()
{
  if (qword_1EB38D3C0 != -1) {
    dispatch_once(&qword_1EB38D3C0, &__block_literal_global_163);
  }
  Class result = objc_getClass("TapToRadarService");
  _MergedGlobals_3_3 = (uint64_t)result;
  _MergedGlobals_72[0] = (uint64_t (*)())TapToRadarServiceFunction;
  return result;
}

id TapToRadarServiceFunction()
{
  return (id)_MergedGlobals_3_3;
}

void *__TapToRadarKitLibrary_block_invoke()
{
  Class result = dlopen("/AppleInternal/Library/Frameworks/TapToRadarKit.framework/TapToRadarKit", 2);
  TapToRadarKitLibrary_sLib = (uint64_t)result;
  return result;
}

Class initRadarComponent()
{
  if (qword_1EB38D3C0 != -1) {
    dispatch_once(&qword_1EB38D3C0, &__block_literal_global_163);
  }
  Class result = objc_getClass("RadarComponent");
  qword_1EB38D3C8 = (uint64_t)result;
  off_1EB38A9E8[0] = (uint64_t (*)())RadarComponentFunction;
  return result;
}

id RadarComponentFunction()
{
  return (id)qword_1EB38D3C8;
}

Class initRadarDraft()
{
  if (qword_1EB38D3C0 != -1) {
    dispatch_once(&qword_1EB38D3C0, &__block_literal_global_163);
  }
  Class result = objc_getClass("RadarDraft");
  qword_1EB38D3D0 = (uint64_t)result;
  off_1EB38A9F0[0] = (uint64_t (*)())RadarDraftFunction;
  return result;
}

id RadarDraftFunction()
{
  return (id)qword_1EB38D3D0;
}

void sub_18DC0412C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
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

void std::__shared_ptr_emplace<AMS::DeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDC839B8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<AMS::DeviceInfo>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDC839B8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FA4080);
}

uint64_t std::__shared_ptr_emplace<AMS::DeviceInfo>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__function::__func<AMS::initAMSCore(void)::$_0,std::allocator<AMS::initAMSCore(void)::$_0>,AMSCore::BagService ()(void)>::~__func()
{
}

void *std::__function::__func<AMS::initAMSCore(void)::$_0,std::allocator<AMS::initAMSCore(void)::$_0>,AMSCore::BagService ()(void)>::__clone()
{
  Class result = operator new(0x10uLL);
  *Class result = &unk_1EDC82BB0;
  return result;
}

void std::__function::__func<AMS::initAMSCore(void)::$_0,std::allocator<AMS::initAMSCore(void)::$_0>,AMSCore::BagService ()(void)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1EDC82BB0;
}

uint64_t std::__function::__func<AMS::initAMSCore(void)::$_0,std::allocator<AMS::initAMSCore(void)::$_0>,AMSCore::BagService ()(void)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3AMS11initAMSCoreEvE3$_0"
    || ((v3 & (unint64_t)"ZN3AMS11initAMSCoreEvE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3AMS11initAMSCoreEvE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3AMS11initAMSCoreEvE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<AMS::initAMSCore(void)::$_0,std::allocator<AMS::initAMSCore(void)::$_0>,AMSCore::BagService ()(void)>::target_type()
{
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:fe180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E559C9A0, MEMORY[0x1E4FBA1C8]);
}

void sub_18DC04CC0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<AMSCore::StaticBundleInfoProvider>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDC840B8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<AMSCore::StaticBundleInfoProvider>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDC840B8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FA4080);
}

uint64_t std::__shared_ptr_emplace<AMSCore::StaticBundleInfoProvider>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void sub_18DC053A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _handleNotification(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = [a2 observerBlock];
    if (v2)
    {
      unint64_t v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

BOOL AMSDefaultsNewFeaturesEnabled()
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.AppleMediaServices");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AMSNewFeaturesEnabled", @"com.apple.AppleMediaServices", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = AppBooleanValue == 0;
  }
  else {
    BOOL v1 = 0;
  }
  return !v1;
}

void sub_18DC0D920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DC0DFF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18DC0F64C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18DC11178(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18DC141F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC15858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC192E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

id getNFHardwareManagerClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getNFHardwareManagerClass_softClass;
  uint64_t v7 = getNFHardwareManagerClass_softClass;
  if (!getNFHardwareManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getNFHardwareManagerClass_block_invoke;
    v3[3] = &unk_1E559EC70;
    v3[4] = &v4;
    __getNFHardwareManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18DC193D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __UIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB38D7E8 = result;
  return result;
}

void __getNFSecureElementClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("NFSecureElement");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNFSecureElementClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    NearFieldLibrary();
  }
}

void NearFieldLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!NearFieldLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __NearFieldLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E55A1D00;
    uint64_t v3 = 0;
    NearFieldLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (NearFieldLibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __NearFieldLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NearFieldLibraryCore_frameworkLibrary = result;
  return result;
}

AMSDeviceAccountPrivacyAcknowledgementTask *__getNFHardwareManagerClass_block_invoke(uint64_t a1)
{
  NearFieldLibrary();
  uint64_t result = (AMSDeviceAccountPrivacyAcknowledgementTask *)objc_getClass("NFHardwareManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNFHardwareManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (AMSDeviceAccountPrivacyAcknowledgementTask *)abort_report_np();
    return [(AMSDeviceAccountPrivacyAcknowledgementTask *)v3 initWithAccount:v5 bag:v6];
  }
  return result;
}

void sub_18DC1C244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DC1CB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DC1E4F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18DC22A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC25AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC264FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!qword_1EB38D818)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __MobileKeyBagLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E55A21D8;
    uint64_t v7 = 0;
    qword_1EB38D818 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_1EB38D818;
    if (qword_1EB38D818)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_1EB38D818;
LABEL_5:
  uint64_t result = dlsym(v2, "MKBDeviceUnlockedSinceBoot");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_100 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileKeyBagLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB38D818 = result;
  return result;
}

void sub_18DC2CC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC2DAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC328F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC32D54(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_18DC32E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC332D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC337A4(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_18DC33AB4(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_18DC33C78(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_18DC34B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _handleClearCachesNotification()
{
  uint64_t v0 = +[AMSEngagementClientData _sharedQueue];
  dispatch_async(v0, &__block_literal_global_75_0);
}

void ___handleClearCachesNotification_block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[AMSLogConfig sharedEngagementConfig];
  if (!v0)
  {
    uint64_t v0 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v1 = [v0 OSLogObject];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 138543362;
    uint64_t v4 = objc_opt_class();
    _os_log_impl(&dword_18D554000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: Client data changed", (uint8_t *)&v3, 0xCu);
  }

  uint64_t v2 = (void *)kSharedInstance;
  kSharedInstance = 0;
}

id AMSCustomCodableError(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = a1;
  id v16 = objc_opt_class();
  uint64_t v17 = AMSCustomSubclassedError(v15, a2, v14, v13, v12, v11, v16);

  return v17;
}

id AMSErrorWithMultipleUnderlyingErrors(uint64_t a1, void *a2, void *a3, void *a4)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = *MEMORY[0x1E4F28750];
  v15[0] = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = [v7 dictionaryWithObjects:v15 forKeys:&v14 count:1];

  id v12 = AMSCustomError(@"AMSErrorDomain", a1, v10, v9, v11, 0);

  return v12;
}

id AMSErrorWithUserInfo(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  return AMSCustomError(@"AMSErrorDomain", a1, a2, a3, a4, a5);
}

uint64_t __AMSCustomSubclassedError_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

void sub_18DC40660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC40A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC40F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC412E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC41554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC41E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18DC43324(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, int a12, __int16 a13, __int16 a14, uint64_t a15, __int16 a16, long long a17)
{
  if (a2 == 1)
  {
    id v17 = objc_begin_catch(a1);
    uint64_t v18 = AMSSetLogKeyIfNeeded();
    __int16 v19 = +[AMSLogConfig sharedConfig];
    if (!v19)
    {
      __int16 v19 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_opt_class();
      LODWORD(buf) = 138544386;
      *(void *)((char *)&buf + 4) = v21;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v18;
      a14 = 2114;
      a16 = 2114;
      WORD1(a17) = 2114;
      *(void *)((char *)&a17 + 4) = v17;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error fetching state for feature flag %{public}@/%{public}@: %{public}@", (uint8_t *)&buf, 0x34u);
    }

    objc_end_catch();
    JUMPOUT(0x18DC432D4);
  }
  _Unwind_Resume(a1);
}

void sub_18DC434F8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, int a12, __int16 a13, __int16 a14, uint64_t a15, __int16 a16, long long a17)
{
  uint64_t v24 = v17;
  if (a2 == 1)
  {
    id v18 = objc_begin_catch(a1);
    __int16 v19 = AMSSetLogKeyIfNeeded();
    uint64_t v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      uint64_t v20 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_opt_class();
      std::locale v23 = [MEMORY[0x1E4F28ED0] numberWithInteger:v24];
      LODWORD(buf) = 138544642;
      *(void *)((char *)&buf + 4) = v22;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v19;
      a14 = 2114;
      a16 = 2114;
      WORD1(a17) = 2114;
      *(void *)((char *)&a17 + 4) = v23;
      WORD6(a17) = 2114;
      *(void *)((char *)&a17 + 14) = v18;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error fetching state for feature flag and level %{public}@/%{public}@/%{public}@: %{public}@", (uint8_t *)&buf, 0x3Eu);
    }
    objc_end_catch();
    JUMPOUT(0x18DC434A4);
  }
  _Unwind_Resume(a1);
}

void sub_18DC50388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAPRequestHandlerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1EB38D8E0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AskPermissionLibraryCore_block_invoke;
    std::runtime_error v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E55A2CA8;
    uint64_t v6 = 0;
    qword_1EB38D8E0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_1EB38D8E0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("APRequestHandler");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  _MergedGlobals_107 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AskPermissionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB38D8E0 = result;
  return result;
}

void sub_18DC57FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC5F964(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getFLFollowUpControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1EB38D900)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CoreFollowUpLibraryCore_block_invoke;
    std::runtime_error v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E55A3080;
    uint64_t v6 = 0;
    qword_1EB38D900 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_1EB38D900)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("FLFollowUpController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  _MergedGlobals_109 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreFollowUpLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB38D900 = result;
  return result;
}

void sub_18DC62038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC62228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC6239C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC62510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC62734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC62890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC62A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC62F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC63710(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

Class __getFLFollowUpActionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1EB38D910)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CoreFollowUpLibraryCore_block_invoke_0;
    std::runtime_error v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E55A30C0;
    uint64_t v6 = 0;
    qword_1EB38D910 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_1EB38D910)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("FLFollowUpAction");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  _MergedGlobals_110 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreFollowUpLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  qword_1EB38D910 = result;
  return result;
}

id getFLUserInfoPropertyDontDisplayDate()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getFLUserInfoPropertyDontDisplayDateSymbolLoc_ptr;
  uint64_t v8 = getFLUserInfoPropertyDontDisplayDateSymbolLoc_ptr;
  if (!getFLUserInfoPropertyDontDisplayDateSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)CoreFollowUpLibrary();
    v6[3] = (uint64_t)dlsym(v1, "FLUserInfoPropertyDontDisplayDate");
    getFLUserInfoPropertyDontDisplayDateSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    uint64_t v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;
  return v2;
}

void sub_18DC64BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC64FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC654C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC6566C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC65804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC66504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getFLUserInfoPropertyDontDisplayDateSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  uint64_t result = dlsym(v2, "FLUserInfoPropertyDontDisplayDate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLUserInfoPropertyDontDisplayDateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreFollowUpLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreFollowUpLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CoreFollowUpLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E55A30F0;
    uint64_t v5 = 0;
    CoreFollowUpLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v1 = (void *)v3[0];
    uint64_t v0 = CoreFollowUpLibraryCore_frameworkLibrary;
    if (CoreFollowUpLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      uint64_t v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return CoreFollowUpLibraryCore_frameworkLibrary;
}

uint64_t __CoreFollowUpLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  CoreFollowUpLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getFLGroupIdentifierNoGroupSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  uint64_t result = dlsym(v2, "FLGroupIdentifierNoGroup");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB38D928 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getFLGroupIdentifierAppleServicesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  uint64_t result = dlsym(v2, "FLGroupIdentifierAppleServices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB38D930 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getFLGroupIdentifierNewDeviceOutreachSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  uint64_t result = dlsym(v2, "FLGroupIdentifierNewDeviceOutreach");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB38D938 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getFLGroupIdentifierAccountSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  uint64_t result = dlsym(v2, "FLGroupIdentifierAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB38D940 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getFLGroupIdentifierDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary();
  uint64_t result = dlsym(v2, "FLGroupIdentifierDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB38D948 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getFLFollowUpItemClass_block_invoke(uint64_t a1)
{
  CoreFollowUpLibrary();
  Class result = objc_getClass("FLFollowUpItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFLFollowUpItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    int v3 = (void *)abort_report_np();
    return (Class)+[AMSFollowUpMetricsEvent eventFromMetricsDictionary:v5];
  }
  return result;
}

void sub_18DC67490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getFLNotificationOptionLockscreen()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getFLNotificationOptionLockscreenSymbolLoc_ptr;
  uint64_t v8 = getFLNotificationOptionLockscreenSymbolLoc_ptr;
  if (!getFLNotificationOptionLockscreenSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)CoreFollowUpLibrary_0();
    v6[3] = (uint64_t)dlsym(v1, "FLNotificationOptionLockscreen");
    getFLNotificationOptionLockscreenSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    SEL v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;
  return v2;
}

id getFLNotificationOptionNotificationCenter()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getFLNotificationOptionNotificationCenterSymbolLoc_ptr;
  uint64_t v8 = getFLNotificationOptionNotificationCenterSymbolLoc_ptr;
  if (!getFLNotificationOptionNotificationCenterSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)CoreFollowUpLibrary_0();
    v6[3] = (uint64_t)dlsym(v1, "FLNotificationOptionNotificationCenter");
    getFLNotificationOptionNotificationCenterSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    SEL v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;
  return v2;
}

id getFLNotificationOptionBannerAlert()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getFLNotificationOptionBannerAlertSymbolLoc_ptr;
  uint64_t v8 = getFLNotificationOptionBannerAlertSymbolLoc_ptr;
  if (!getFLNotificationOptionBannerAlertSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)CoreFollowUpLibrary_0();
    v6[3] = (uint64_t)dlsym(v1, "FLNotificationOptionBannerAlert");
    getFLNotificationOptionBannerAlertSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    SEL v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;
  return v2;
}

void sub_18DC67A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFLFollowUpNotificationClass_block_invoke(uint64_t a1)
{
  CoreFollowUpLibrary_0();
  Class result = objc_getClass("FLFollowUpNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFLFollowUpNotificationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)CoreFollowUpLibrary_0();
  }
  return result;
}

uint64_t CoreFollowUpLibrary_0()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreFollowUpLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CoreFollowUpLibraryCore_block_invoke_2;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E55A3108;
    uint64_t v5 = 0;
    CoreFollowUpLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v1 = (void *)v3[0];
    uint64_t v0 = CoreFollowUpLibraryCore_frameworkLibrary_0;
    if (CoreFollowUpLibraryCore_frameworkLibrary_0)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      uint64_t v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return CoreFollowUpLibraryCore_frameworkLibrary_0;
}

uint64_t __CoreFollowUpLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  CoreFollowUpLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getFLNotificationOptionLockscreenSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary_0();
  uint64_t result = dlsym(v2, "FLNotificationOptionLockscreen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLNotificationOptionLockscreenSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getFLNotificationOptionNotificationCenterSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary_0();
  uint64_t result = dlsym(v2, "FLNotificationOptionNotificationCenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLNotificationOptionNotificationCenterSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getFLNotificationOptionBannerAlertSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary_0();
  uint64_t result = dlsym(v2, "FLNotificationOptionBannerAlert");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLNotificationOptionBannerAlertSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getFLNotificationOptionKeepOnLockscreenSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreFollowUpLibrary_0();
  uint64_t result = dlsym(v2, "FLNotificationOptionKeepOnLockscreen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFLNotificationOptionKeepOnLockscreenSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id AMSFraudReportAddDeviceIdentityCertificateAndSignatureToRequest(void *a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = v5;
  id v9 = v6;
  id v10 = v7;
  id v11 = "PromiseEZNS7_17get_return_objectEvE13DetachPromiseNS_9allocatorIS7_EEEE";
  if (MGGetBoolAnswer())
  {
    id v12 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = AMSLogKey();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_INFO, "AMSFraudReport [%{public}@] Attempting to sign with host certificate because we're in VM", (uint8_t *)&buf, 0xCu);
    }
    id v15 = AMSFraudReportGetSignatureForRequestAfterAddingDeviceIdentityCertificatesOnVM(v8, v9);
  }
  else
  {
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    __int16 v19 = v18;
    if (v16 && v17 && v18)
    {
      uint64_t v20 = [[AMSDeviceIdentityCertificateTask alloc] initWithBag:v18];
      uint64_t v21 = [(AMSDeviceIdentityCertificateTask *)v20 performDeviceIdentityRequestForFraudReport];
      uint64_t v22 = AMSLogKey();
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      time_t v30 = __AMSFraudReportGetSignatureForRequestAfterAddingDeviceIdentityCertificatesOnDevice_block_invoke;
      int v31 = &unk_1E55A3178;
      id v32 = v16;
      id v33 = v17;
      id v34 = v22;
      id v23 = v22;
      id v15 = [v21 thenWithBlock:&buf];

      id v11 = "NSt3__120__shared_ptr_pointerIPN7AMSCore4TaskINS1_22ExecuteHTTPRequestTask6ResultENS1_9HTTPErrorEE7PromiseEZ"
            "NS7_17get_return_objectEvE13DetachPromiseNS_9allocatorIS7_EEEE"
          + 99;
    }
    else
    {
      uint64_t v20 = +[AMSOptional optionalWithNil];
      id v15 = +[AMSPromise promiseWithResult:v20];
    }
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = *((void *)v11 + 293);
  void v27[2] = __AMSFraudReportAddDeviceIdentityCertificateAndSignatureToRequest_block_invoke;
  v27[3] = &unk_1E55A0F28;
  id v28 = v8;
  id v24 = v8;
  __int16 v25 = [v15 thenWithBlock:v27];

  return v25;
}

id __AMSFraudReportAddDeviceIdentityCertificateAndSignatureToRequest_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = [v3 value];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 value];
    id v7 = [v6 base64EncodedStringWithOptions:0];
    [v5 setValue:v7 forHTTPHeaderField:@"X-Apple-FSR-Signature"];

    id v8 = +[AMSDevice deviceGUID];
    if (v8) {
      [*(id *)(a1 + 32) setValue:v8 forHTTPHeaderField:@"X-Mme-Device-Id"];
    }
  }
  id v9 = +[AMSPromise promiseWithResult:*(void *)(a1 + 32)];

  return v9;
}

id AMSFraudReportGetSignatureForRequestAfterAddingDeviceIdentityCertificatesOnVM(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 && v4)
  {
    id v6 = AMSLogKey();
    if (DeviceIdentityIsSupported())
    {
      id v7 = objc_opt_new();
      id v8 = dispatch_get_global_queue(21, 0);
      id v9 = objc_opt_new();
      id v16 = v7;
      id v17 = v5;
      id v18 = v3;
      id v19 = v6;
      id v10 = v8;
      DeviceIdentityCreateHostSignatureWithCompletion();

      id v11 = v16;
    }
    else
    {
      id v13 = +[AMSLogConfig sharedFraudReportConfig];
      if (!v13)
      {
        id v13 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        uint64_t v21 = v6;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error signing the fraud report score payload. DeviceIdentity is not supported on this platform.", buf, 0xCu);
      }

      id v10 = +[AMSOptional optionalWithNil];
      id v11 = +[AMSPromise promiseWithResult:v10];
    }
  }
  else
  {
    id v12 = +[AMSOptional optionalWithNil];
    id v11 = +[AMSPromise promiseWithResult:v12];
  }
  return v11;
}

void __AMSFraudReportGetSignatureForRequestAfterAddingDeviceIdentityCertificatesOnVM_block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if ((unint64_t)[v8 count] <= 1)
    {
      id v11 = a1[4];
      id v12 = [NSString stringWithFormat:@"Expected at least 2 certificates (leaf BAA + intermediate), but only got %lu", objc_msgSend(v8, "count")];
      id v13 = AMSError(12, @"Fewer host certificates than expected", v12, 0);
      [v11 finishWithError:v13];

LABEL_15:
      goto LABEL_23;
    }
    id v15 = [v8 objectAtIndexedSubscript:0];

    id v16 = [v8 objectAtIndexedSubscript:1];

    CFDataRef v17 = SecCertificateCopyData((SecCertificateRef)v15);
    CFDataRef v18 = SecCertificateCopyData((SecCertificateRef)v16);
    id v19 = (void *)[a1[5] mutableCopy];
    [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"is_vm"];
    id v20 = a1[6];
    id v40 = 0;
    char v21 = AMSSetRequestBodyWithParametersAndCertificates(v20, v19, v17, v18, (uint64_t)&v40);
    id v33 = v40;
    if (v21)
    {
      uint64_t v22 = [a1[6] HTTPBody];
      if (v22)
      {
        id v34 = a1[7];
        id v35 = a1[4];
        CFDataRef v36 = v17;
        CFDataRef v37 = v18;
        id v38 = a1[6];
        id v39 = a1[5];
        DeviceIdentityCreateHostSignatureWithCompletion();

        id v23 = v34;
      }
      else
      {
        uint64_t v29 = +[AMSLogConfig sharedFraudReportConfig];
        if (!v29)
        {
          uint64_t v29 = +[AMSLogConfig sharedConfig];
        }
        time_t v30 = [v29 OSLogObject];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          id v31 = a1[7];
          *(_DWORD *)long long buf = 138543362;
          id v42 = v31;
          _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error signing the fraud report score payload. No data to sign, request body is nil.", buf, 0xCu);
        }

        id v32 = a1[4];
        id v23 = +[AMSOptional optionalWithNil];
        [v32 finishWithResult:v23];
      }

      long long v26 = v33;
    }
    else
    {
      id v24 = +[AMSLogConfig sharedFraudReportConfig];
      if (!v24)
      {
        id v24 = +[AMSLogConfig sharedConfig];
      }
      __int16 v25 = [v24 OSLogObject];
      long long v26 = v33;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v27 = a1[7];
        *(_DWORD *)long long buf = 138543618;
        id v42 = v27;
        __int16 v43 = 2114;
        id v44 = v33;
        _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error signing the fraud report score payload. Unable to set request body: %{public}@.", buf, 0x16u);
      }

      id v28 = a1[4];
      uint64_t v22 = +[AMSOptional optionalWithNil];
      [v28 finishWithResult:v22];
    }
  }
  else
  {
    id v14 = a1[4];
    if (!v9)
    {
      id v12 = AMSError(12, @"Unable to retrieve host certificates", @"DeviceIdentity didn't return host certificates nor error", 0);
      [v14 finishWithError:v12];
      goto LABEL_15;
    }
    [a1[4] finishWithError:v9];
  }
LABEL_23:
}

uint64_t AMSSetRequestBodyWithParametersAndCertificates(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  if (!a1 || !a2 || !a3 || !a4) {
    return 0;
  }
  id v9 = (objc_class *)MEMORY[0x1E4F1CA58];
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  id v13 = a1;
  id v14 = (void *)[[v9 alloc] initWithData:v11];

  [v14 appendData:v10];
  id v15 = [v14 base64EncodedStringWithOptions:0];
  id v16 = (void *)[v12 mutableCopy];

  [v16 setObject:v15 forKeyedSubscript:@"baa_cert"];
  uint64_t v17 = objc_msgSend(v13, "ams_setBodyParameters:encoding:compressBody:error:", v16, 3, 0, a5);

  return v17;
}

void __AMSFraudReportGetSignatureForRequestAfterAddingDeviceIdentityCertificatesOnVM_block_invoke_26(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v7)
  {
    id v10 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    int v34 = 138543618;
    uint64_t v35 = v14;
    __int16 v36 = 2114;
    uint64_t v37 = (uint64_t)v9;
    id v13 = "AMSFraudReport [%{public}@] Error signing the fraud report score payload. Cannot create signature: %{public}@";
    goto LABEL_16;
  }
  if (!v8)
  {
    id v10 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    uint64_t v15 = *(void *)(a1 + 32);
    int v34 = 138543618;
    uint64_t v35 = v15;
    __int16 v36 = 2114;
    uint64_t v37 = (uint64_t)v9;
    id v13 = "AMSFraudReport [%{public}@] Error signing the fraud report score payload. Cannot get certificates: %{public}@";
    goto LABEL_16;
  }
  if ((unint64_t)[v8 count] > 1)
  {
    CFDataRef v18 = [v8 objectAtIndexedSubscript:0];

    id v19 = [v8 objectAtIndexedSubscript:1];

    uint64_t v17 = SecCertificateCopyData((SecCertificateRef)v18);
    CFDataRef v20 = SecCertificateCopyData((SecCertificateRef)v19);
    if ([*(id *)(a1 + 48) isEqualToData:v17]
      && ([*(id *)(a1 + 56) isEqualToData:v20] & 1) != 0)
    {
      char v21 = *(void **)(a1 + 40);
      uint64_t v22 = [[AMSOptional alloc] initWithValue:v7];
    }
    else
    {
      int v23 = *(unsigned __int8 *)(a1 + 80);
      uint64_t v24 = +[AMSLogConfig sharedFraudReportConfig];
      __int16 v25 = (void *)v24;
      if (!v23)
      {
        if (!v24)
        {
          __int16 v25 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v29 = [v25 OSLogObject];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = *(void *)(a1 + 32);
          int v34 = 138543362;
          uint64_t v35 = v30;
          _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_DEFAULT, "AMSFraudReport [%{public}@] Certificate data when signing differs from initial certificate data, retrying signing once.", (uint8_t *)&v34, 0xCu);
        }

        id v31 = AMSSetLogKey(*(void **)(a1 + 32));
        id v32 = *(void **)(a1 + 40);
        id v33 = AMSFraudReportGetSignatureForRequestAfterAddingDeviceIdentityCertificatesOnVM(*(void *)(a1 + 64), *(void *)(a1 + 72), 1);
        [v32 finishWithPromise:v33];

        goto LABEL_34;
      }
      if (!v24)
      {
        __int16 v25 = +[AMSLogConfig sharedConfig];
      }
      long long v26 = [v25 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = *(void *)(a1 + 32);
        int v34 = 138543362;
        uint64_t v35 = v27;
        _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error signing the fraud report score payload. Certificate data when signing differs even after retry.", (uint8_t *)&v34, 0xCu);
      }

      char v21 = *(void **)(a1 + 40);
      uint64_t v22 = +[AMSOptional optionalWithNil];
    }
    id v28 = v22;
    [v21 finishWithResult:v22];

LABEL_34:
    goto LABEL_18;
  }
  id v10 = +[AMSLogConfig sharedFraudReportConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    goto LABEL_17;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  int v34 = 138543618;
  uint64_t v35 = v12;
  __int16 v36 = 2048;
  uint64_t v37 = [v8 count];
  id v13 = "AMSFraudReport [%{public}@] Error signing the fraud report score payload. Too few certificates returned, expecte"
        "d at least 2, but received %lu";
LABEL_16:
  _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v34, 0x16u);
LABEL_17:

  id v16 = *(void **)(a1 + 40);
  uint64_t v17 = +[AMSOptional optionalWithNil];
  [v16 finishWithResult:v17];
LABEL_18:
}

id __AMSFraudReportGetSignatureForRequestAfterAddingDeviceIdentityCertificatesOnDevice_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = [v3 BAACert];
  id v7 = [v3 IntermediateRootCert];
  id v22 = 0;
  LODWORD(v5) = AMSSetRequestBodyWithParametersAndCertificates(v4, v5, v6, v7, (uint64_t)&v22);
  id v8 = v22;

  if (!v5)
  {
    id v9 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v9 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)error = 138543618;
      *(void *)&error[4] = v14;
      __int16 v24 = 2114;
      __int16 v25 = v8;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error signing the fraud report score payload. Unable to set request body: %{public}@.", error, 0x16u);
    }
    goto LABEL_22;
  }
  id v9 = [*(id *)(a1 + 32) HTTPBody];
  if (!v9)
  {
    id v13 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v13)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v15 = [v13 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 48);
      *(_DWORD *)error = 138543362;
      *(void *)&error[4] = v16;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error signing the fraud report score payload. No data to sign, request body is nil.", error, 0xCu);
    }
    goto LABEL_21;
  }
  id v10 = (__SecKey *)[v3 BIKKeyRef];
  if (v10)
  {
    *(void *)error = 0;
    CFDataRef Signature = SecKeyCreateSignature(v10, (SecKeyAlgorithm)*MEMORY[0x1E4F3BA70], (CFDataRef)v9, (CFErrorRef *)error);
    id v12 = 0;
    if (!Signature)
    {
      id v12 = *(id *)error;
    }
  }
  else
  {
    id v12 = 0;
    CFDataRef Signature = 0;
  }
  id v13 = v12;
  if (!Signature)
  {
    uint64_t v15 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v15)
    {
      uint64_t v15 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v17 = [v15 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 48);
      *(_DWORD *)error = 138543618;
      *(void *)&error[4] = v18;
      __int16 v24 = 2114;
      __int16 v25 = v13;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error signing the fraud report score payload. Cannot create signature: %{public}@", error, 0x16u);
    }

LABEL_21:
LABEL_22:
    CFDataRef Signature = 0;
  }

  id v19 = [[AMSOptional alloc] initWithValue:Signature];
  CFDataRef v20 = +[AMSPromise promiseWithResult:v19];

  return v20;
}

id AMSFraudReportHandleResponseDefaultRefreshScoreBlock_block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AMSFraudReportTask performFraudReportRefreshWithOptions:a2];
}

AMSPromise *__AMSFraudReportIsFeatureSupportedForBag_block_invoke_2()
{
  return +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC28]];
}

id AMSFraudReportCallURL(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a5;
  id v11 = a4;
  id v12 = a2;
  id v13 = AMSSetLogKeyIfNeeded();
  uint64_t v14 = [[AMSURLRequestEncoder alloc] initWithBag:v10];

  [(AMSURLRequestEncoder *)v14 setDialogOptions:1];
  [(AMSURLRequestEncoder *)v14 setUrlKnownToBeTrusted:1];
  [(AMSURLRequestEncoder *)v14 setLogUUID:v13];
  uint64_t v15 = [(AMSURLRequestEncoder *)v14 requestWithMethod:a3 URL:v12 headers:v11 parameters:0];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __AMSFraudReportCallURL_block_invoke;
  v19[3] = &unk_1E559E9C0;
  id v20 = v9;
  id v16 = v9;
  uint64_t v17 = [v15 thenWithBlock:v19];

  return v17;
}

void __AMSFraudReportHandleInitURLFraudReportResponse_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[AMSLogConfig sharedFraudReportConfig];
  id v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_INFO, "AMSFraudReport [%{public}@] Successfully called init URL.", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (!v6)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = AMSLogableError(v5);
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Failed to call init URL: %{public}@.", (uint8_t *)&v12, 0x16u);
    }
  }
}

void __AMSFraudReportShouldCallInitURL_block_invoke(uint64_t a1)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) absoluteString];
  id v3 = (void *)v2;
  if (v2)
  {
    v13[0] = v2;
    v12[0] = @"initURL";
    v12[1] = @"date";
    id v4 = objc_opt_new();
    v13[1] = v4;
    v12[2] = @"requestInterval";
    id v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 64)];
    v13[2] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:*(void *)(a1 + 48)];
  }
  else
  {
    id v7 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 56);
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "AMSFraudReport: [%{public}@] Unable to get init URL string, deleting persisted state for current key.", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 40) setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
  }
}

uint64_t __AMSFraudReportCallURL_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) dataTaskPromiseWithRequest:a2];
}

id AMSFraudReportGetFSRHeadersForFraudReportResponse(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  id v9 = a4;
  id v10 = a2;
  uint64_t v11 = AMSSetLogKeyIfNeeded();
  int v12 = [AMSFraudReportOptions alloc];
  uint64_t v13 = objc_msgSend(v7, "ams_fsrTransactionID");
  __int16 v14 = objc_msgSend(v7, "ams_fsrNameSpace");
  uint64_t v15 = objc_msgSend(v7, "ams_fsrData");
  uint64_t v16 = [(AMSFraudReportOptions *)v12 initWithTransactionIdentifier:v13 nameSpace:v14 fsrData:v15];

  [(AMSFraudReportOptions *)v16 setAccount:v10];
  uint64_t v17 = objc_msgSend(v7, "ams_fsrKeyID");
  [(AMSFraudReportOptions *)v16 setKeyIdentifier:v17];

  if (v8)
  {
    uint64_t v18 = [v8 integerForKey:@"fsr-auth-token-type"];
    id v19 = [v18 valuePromise];
  }
  else
  {
    id v19 = +[AMSPromise promiseWithResult:&unk_1EDD01318];
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __AMSFraudReportGetFSRHeadersForFraudReportResponse_block_invoke;
  void v26[3] = &unk_1E55A3280;
  id v27 = v11;
  id v28 = v16;
  id v29 = v7;
  id v30 = v9;
  id v20 = v7;
  id v21 = v9;
  id v22 = v16;
  id v23 = v11;
  __int16 v24 = [v19 continueWithBlock:v26];

  return v24;
}

id __AMSFraudReportHandleRetryFraudReportResponse_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = +[AMSURLAction retryAction];
    [v7 setReason:@"fraud report score updated"];
    [v7 setRetryIdentifier:0x1EDCC3B48];
    [v7 setUpdatedHeaders:v5];
    id v8 = +[AMSOptional optionalWithValue:v7];
    id v9 = +[AMSPromise promiseWithResult:v8];
  }
  else
  {
    id v10 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = AMSLogableError(v6);
      int v17 = 138543618;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      id v20 = v13;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error fetching a new fraud report score: %{public}@.", (uint8_t *)&v17, 0x16u);
    }
    __int16 v14 = +[AMSURLAction actionWithError:v6];
    uint64_t v15 = +[AMSOptional optionalWithValue:v14];
    id v9 = +[AMSPromise promiseWithResult:v15];
  }
  return v9;
}

id __AMSFraudReportGetFSRHeadersForFraudReportResponse_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    unint64_t v7 = [v5 integerValue];
    if (v7 < 2)
    {
      [*(id *)(a1 + 40) setAuthenticationTokenType:v7];
    }
    else
    {
      id v8 = +[AMSLogConfig sharedFraudReportConfig];
      if (!v8)
      {
        id v8 = +[AMSLogConfig sharedConfig];
      }
      id v9 = [v8 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v21 = v10;
        __int16 v22 = 2048;
        unint64_t v23 = v7;
        _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "AMSFraudReport: [%{public}@] Unexpected value %lu for authentication token type in bag, using v2.", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v11 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v11)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v21 = v13;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "AMSFraudReport: [%{public}@] Authentication token type is missing in bag, using v2.", buf, 0xCu);
    }
  }
  __int16 v14 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  std::runtime_error v17[2] = __AMSFraudReportGetFSRHeadersForFraudReportResponse_block_invoke_42;
  v17[3] = &unk_1E55A3258;
  id v18 = *(id *)(a1 + 32);
  id v19 = *(id *)(a1 + 48);
  uint64_t v15 = [v14 thenWithBlock:v17];

  return v15;
}

id __AMSFraudReportGetFSRHeadersForFraudReportResponse_block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedFraudReportConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v24 = v6;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_INFO, "AMSFraudReport [%{public}@] Successfully fetched a new fraud report score.", buf, 0xCu);
  }

  objc_msgSend(NSString, "stringWithFormat:", @"rs=%hhu;ns=%hhu",
    [v3 reportedScore],
  unint64_t v7 = [v3 newScore]);
  v22[0] = v7;
  v21[0] = @"X-Apple-FSR-Data";
  v21[1] = @"X-Apple-FSR-AID";
  id v8 = objc_msgSend(*(id *)(a1 + 40), "ams_fsrAnonymousID");
  v22[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  uint64_t v10 = (void *)[v9 mutableCopy];

  uint64_t v11 = [v3 finalizedElement];
  if (!v11)
  {
    uint64_t v12 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v12)
    {
      uint64_t v12 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v24 = v14;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "AMSFraudReport: [%{public}@] finalizedElement is unexpectedly nil.", buf, 0xCu);
    }
  }
  [v10 setObject:v11 forKeyedSubscript:@"X-Apple-FSR-Token"];
  uint64_t v15 = [v3 nameSpace];
  if (!v15)
  {
    uint64_t v16 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v16)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    int v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v24 = v18;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "AMSFraudReport: [%{public}@] namespace is unexpectedly nil.", buf, 0xCu);
    }
  }
  [v10 setObject:v15 forKeyedSubscript:@"X-Apple-FSR-NameSpace"];
  id v19 = +[AMSPromise promiseWithResult:v10];

  return v19;
}

id __AMSFraudReportHandleCallbackFraudReportResponse_block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
    id v8 = objc_msgSend(a1[5], "ams_fsrCallbackUrl");
    id v9 = [v7 URLWithString:v8];

    if (v9)
    {
      uint64_t v10 = AMSFraudReportCallURL(a1[6], v9, 5, v5, a1[7]);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      void v22[2] = __AMSFraudReportHandleCallbackFraudReportResponse_block_invoke_47;
      v22[3] = &unk_1E55A0F50;
      id v23 = a1[4];
      [v10 resultWithCompletion:v22];

      uint64_t v11 = v23;
    }
    else
    {
      uint64_t v11 = +[AMSLogConfig sharedFraudReportConfig];
      if (!v11)
      {
        uint64_t v11 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v18 = [v11 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = a1[4];
        *(_DWORD *)long long buf = 138543362;
        id v25 = v19;
        _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "AMSFraudReport: [%{public}@] Failed to create callback URL, not calling.", buf, 0xCu);
      }
    }
    uint64_t v16 = +[AMSURLAction proceedAction];
    id v20 = +[AMSOptional optionalWithValue:v16];
    int v17 = +[AMSPromise promiseWithResult:v20];
  }
  else
  {
    uint64_t v12 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v12)
    {
      uint64_t v12 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = a1[4];
      uint64_t v15 = AMSLogableError(v6);
      *(_DWORD *)long long buf = 138543618;
      id v25 = v14;
      __int16 v26 = 2114;
      id v27 = v15;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "AMSFraudReport [%{public}@] Error fetching a new fraud report score: %{public}@.", buf, 0x16u);
    }
    id v9 = +[AMSURLAction actionWithError:v6];
    uint64_t v16 = +[AMSOptional optionalWithValue:v9];
    int v17 = +[AMSPromise promiseWithResult:v16];
  }

  return v17;
}

void __AMSFraudReportHandleCallbackFraudReportResponse_block_invoke_47(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[AMSLogConfig sharedFraudReportConfig];
  unint64_t v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      unint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_INFO, "AMSFraudReport [%{public}@] Successfully reported the new fraud score to the callback url.", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (!v6)
    {
      unint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = AMSLogableError(v5);
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "AMSFraudReport [%{public}@] Failed reporting the new fraud score to the callback url: %{public}@.", (uint8_t *)&v12, 0x16u);
    }
  }
}

void sub_18DC6C58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC6ED9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC6F00C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _AMSHTTPArchiveControllerUpdateHarURLFilters()
{
  return +[AMSHTTPArchiveController _updateHarFileFilters];
}

void sub_18DC71460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18DC72238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC72604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DC726B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t AMSSecItemCopyMatchingWithTimeFault(void *a1, uint64_t a2)
{
  *(void *)&v44[13] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = +[AMSLogConfig sharedKeychainConfig];
  if (!v6)
  {
    uint64_t v6 = +[AMSLogConfig sharedConfig];
  }
  unint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = AMSLogKey();
    uint64_t v9 = NSString;
    objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = v10;
    if (v8)
    {
      uint64_t v2 = AMSLogKey();
      [v9 stringWithFormat:@"%@: [%@] ", v11, v2];
    }
    else
    {
      [v9 stringWithFormat:@"%@: ", v10];
    id v3 = };
    int v12 = AMSHashIfNeeded(a1);
    *(_DWORD *)long long buf = 138543618;
    id v42 = v3;
    __int16 v43 = 2114;
    *(void *)id v44 = v12;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_INFO, "%{public}@Beginning keychain query: %{public}@", buf, 0x16u);
    if (v8)
    {

      id v3 = (void *)v2;
    }
  }
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v14 = _secItemCopyMatchingFunc(a1, a2);
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
  [v15 timeIntervalSinceDate:v13];
  double v17 = v16;
  uint64_t v18 = +[AMSLogConfig sharedKeychainConfig];
  if (!v18)
  {
    uint64_t v18 = +[AMSLogConfig sharedConfig];
  }
  id v19 = [v18 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = AMSLogKey();
    uint64_t v21 = NSString;
    objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = v22;
    if (v20)
    {
      id v3 = AMSLogKey();
      [v21 stringWithFormat:@"%@: [%@] ", v23, v3];
    }
    else
    {
      [v21 stringWithFormat:@"%@: ", v22];
    uint64_t v24 = };
    *(_DWORD *)long long buf = 138543874;
    id v42 = v24;
    __int16 v43 = 1024;
    *(_DWORD *)id v44 = v14;
    v44[2] = 2048;
    *(double *)&v44[3] = v17;
    _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_INFO, "%{public}@Keychain query finished with status: %d elapsedTime: %f", buf, 0x1Cu);
    if (v20)
    {

      uint64_t v24 = v3;
    }
  }
  if (os_variant_has_internal_content() && v17 > 2.0)
  {
    BOOL v25 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v26 = +[AMSLogConfig sharedKeychainConfig];
    id v27 = (void *)v26;
    if (v25)
    {
      if (!v26)
      {
        id v27 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v28 = [v27 OSLogObject];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v29 = AMSLogKey();
        id v30 = NSString;
        objc_opt_class();
        uint64_t v31 = objc_opt_class();
        uint64_t v32 = v31;
        if (v29)
        {
          id v3 = AMSLogKey();
          [v30 stringWithFormat:@"%@: [%@] ", v32, v3];
        }
        else
        {
          [v30 stringWithFormat:@"%@: ", v31];
        id v33 = };
        *(_DWORD *)long long buf = 138543618;
        id v42 = v33;
        __int16 v43 = 2048;
        *(double *)id v44 = v17;
        _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_ERROR, "%{public}@Keychain query exceeded expected duration. Took %f seconds.", buf, 0x16u);
        if (v29)
        {

          id v33 = v3;
        }
      }
      id v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
      int v34 = +[AMSLogConfig sharedKeychainConfig];
      [v27 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v34 userInfo:0];
    }
    else
    {
      if (!v26)
      {
        id v27 = +[AMSLogConfig sharedConfig];
      }
      int v34 = [v27 OSLogObject];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        uint64_t v35 = AMSLogKey();
        __int16 v36 = NSString;
        objc_opt_class();
        uint64_t v37 = objc_opt_class();
        uint64_t v38 = v37;
        if (v35)
        {
          id v3 = AMSLogKey();
          [v36 stringWithFormat:@"%@: [%@] ", v38, v3];
        }
        else
        {
          [v36 stringWithFormat:@"%@: ", v37];
        id v39 = };
        *(_DWORD *)long long buf = 138543618;
        id v42 = v39;
        __int16 v43 = 2048;
        *(double *)id v44 = v17;
        _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_FAULT, "%{public}@Keychain query exceeded expected duration. Took %f seconds.", buf, 0x16u);
        if (v35)
        {

          id v39 = v3;
        }
      }
    }
  }
  return v14;
}

id AMSKeychainError(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (a2)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a2];
    [v4 setObject:v5 forKeyedSubscript:@"AMSStatusCode"];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v6 = AMSCustomError(@"AMSErrorDomain", 600, @"Keychain Error", v3, v4, 0);

  return v6;
}

void sub_18DC7BF04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL AMSIsEntitledForDirectKeychainAccess()
{
  return +[AMSProcessInfo hasValue:@"apple" inArrayForEntitlement:@"keychain-access-groups"];
}

id _AMSDescriptionForError(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v2 appendString:@"{ "];
  id v3 = [v1 domain];
  [v2 appendFormat:@"Error domain=%@, code=%ld", v3, objc_msgSend(v1, "code")];

  id v4 = objc_msgSend(v1, "ams_underlyingError");

  if (v4)
  {
    [v2 appendString:@", underlyingError={ "];
    id v5 = objc_msgSend(v1, "ams_underlyingError");
    uint64_t v6 = ((void (*)(void))_AMSDescriptionForError)();
    [v2 appendString:v6];

    [v2 appendString:@" }"];
  }
  unint64_t v7 = objc_msgSend(v1, "ams_multipleUnderlyingErrors");
  uint64_t v8 = [v7 count];

  if (v8)
  {
    [v2 appendString:@", multipleUnderlyingErrors=[ "];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = objc_msgSend(v1, "ams_multipleUnderlyingErrors");
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = _AMSDescriptionForError(*(void *)(*((void *)&v16 + 1) + 8 * i));
          [v2 appendString:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [v2 appendString:@" ]"];
  }

  return v2;
}

id AMSHash(void *a1)
{
  return AMSHashAndLogCacheMisses(a1, 1);
}

id AMSHashAndLogCacheMisses(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (v3)
  {
    if (_MergedGlobals_117 != -1) {
      dispatch_once(&_MergedGlobals_117, &__block_literal_global_68);
    }
    id v4 = (id)qword_1EB38D9C8;
    id v5 = [v4 objectForKey:v3 canLogCacheMisses:a2];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      uint64_t v8 = objc_msgSend(v3, "ams_sha512HashStringUsingEncoding:error:", 10, 0);
      if (v8)
      {
        id v7 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"H:"];
        uint64_t v9 = [v8 substringToIndex:5];
        [v7 appendString:v9];

        uint64_t v10 = objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v8, "length") - 5);
        [v7 appendString:v10];

        [v4 setObject:v7 forKey:v3];
      }
      else
      {
        id v7 = 0;
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __AMSHashAndLogCacheMisses_block_invoke()
{
  qword_1EB38D9C8 = [[AMSLRUCache alloc] initWithMaxSize:25];
  return MEMORY[0x1F41817F8]();
}

__CFString *AMSLogableErrors(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    id v2 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"[\n"];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          [(__CFString *)v2 appendString:@"\t", (void)v11];
          uint64_t v9 = AMSLogableError(v8);
          [(__CFString *)v2 appendString:v9];

          [(__CFString *)v2 appendString:@"\n"];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    [(__CFString *)v2 appendString:@"]"];
  }
  else
  {
    id v2 = @"(null)";
  }

  return v2;
}

void sub_18DC81BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  for (uint64_t i = 72; i != -24; i -= 24)
    __destructor_8_s0_s16((uint64_t)(&a14 + i));
  _Unwind_Resume(a1);
}

void __destructor_8_s0_s16(uint64_t a1)
{
  id v2 = *(void **)(a1 + 16);
}

void sub_18DC82450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AMSAttributesAvailableIntervalKeyPath(uint64_t a1)
{
  id v1 = [NSString stringWithFormat:@"%@.%@", @"availableInterval", a1];
  id v2 = [NSString stringWithFormat:@"%@.%@", @"attributes", v1];

  return v2;
}

uint64_t AMSAttributesKeyPath(uint64_t a1)
{
  return [NSString stringWithFormat:@"%@.%@", @"attributes", a1];
}

id AMSAttributesOffersKeyPath(uint64_t a1)
{
  id v1 = [NSString stringWithFormat:@"%@.%@", @"offers", a1];
  id v2 = [NSString stringWithFormat:@"%@.%@", @"attributes", v1];

  return v2;
}

uint64_t AMSOffersKeyPath(uint64_t a1)
{
  return [NSString stringWithFormat:@"%@.%@", @"offers", a1];
}

uint64_t AMSRelationshipsContentDataKeyPath()
{
  return [NSString stringWithFormat:@"%@.%@.%@", @"relationships", @"contents", @"data"];
}

void sub_18DC891B0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t soft_MKBDeviceUnlockedSinceBoot()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))_MergedGlobals_123;
  id v7 = _MergedGlobals_123;
  if (!_MergedGlobals_123)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke_0;
    v3[3] = &unk_1E559EC70;
    v3[4] = &v4;
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (uint64_t (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    id v2 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v2);
  }
  return v0();
}

void *__getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!qword_1EB38DCE8)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __MobileKeyBagLibraryCore_block_invoke_0;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E55A3D20;
    uint64_t v7 = 0;
    qword_1EB38DCE8 = _sl_dlopen();
    id v3 = (void *)v5[0];
    id v2 = (void *)qword_1EB38DCE8;
    if (qword_1EB38DCE8)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)qword_1EB38DCE8;
LABEL_5:
  uint64_t result = dlsym(v2, "MKBDeviceUnlockedSinceBoot");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_123 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileKeyBagLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  qword_1EB38DCE8 = result;
  return result;
}

void sub_18DC8C1A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DC915D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DC917AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18DC9294C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18DC92E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC932C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_18DC93F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC94314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC947C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_18DC94984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC94E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC9549C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC95CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC9604C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC966C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC96DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC971E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC9751C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC9789C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC98308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC9853C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC9875C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC9B07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_18DC9F618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DC9FA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCA011C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18DCA1AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_18DCA259C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_18DCA54D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCA984C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DCA98E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18DCA9A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DCA9C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DCA9D88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DCA9EBC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v2 - 40));

  _Unwind_Resume(a1);
}

void sub_18DCA9F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18DCAA1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCAA330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCAA6B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCAAB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCABE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCACCE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_18DCAD390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCAD4AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18DCADC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCAF238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCB0230(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18DCB0B3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18DCB3248(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DCB3358(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DCB346C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18DCB3ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCB44CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCB4CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCB5264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCB83BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id AMSNormalisedCountryCodeForPaymentRequest(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1CA20] ISOCountryCodes];
  id v3 = AMSMaybeUpperCaseNormalisedStringIfFoundInList(v1, v2);

  if (!v3)
  {
    BOOL v4 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v5 = +[AMSLogConfig sharedConfig];
    long long v6 = (void *)v5;
    if (v4)
    {
      if (!v5)
      {
        long long v6 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v7 = [v6 OSLogObject];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = AMSLogKey();
        int v12 = 138543618;
        uint64_t v13 = v8;
        __int16 v14 = 2114;
        id v15 = v1;
        _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "AMSNormalisedCountryCodeForPaymentRequest: [%{public}@] invalid country code: %{public}@", (uint8_t *)&v12, 0x16u);
      }
      long long v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v9 = +[AMSLogConfig sharedConfig];
      [v6 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v9 userInfo:0];
    }
    else
    {
      if (!v5)
      {
        long long v6 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v9 = [v6 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        uint64_t v10 = AMSLogKey();
        int v12 = 138543618;
        uint64_t v13 = v10;
        __int16 v14 = 2114;
        id v15 = v1;
        _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_FAULT, "AMSNormalisedCountryCodeForPaymentRequest: [%{public}@] invalid country code: %{public}@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  return v3;
}

void sub_18DCB9644(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18DCB97E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initPKPaymentSetupConfiguration()
{
  if (qword_1EB38D3E0 != -1) {
    dispatch_once(&qword_1EB38D3E0, &__block_literal_global_104);
  }
  Class result = objc_getClass("PKPaymentSetupConfiguration");
  _MergedGlobals_3_4 = (uint64_t)result;
  _MergedGlobals_73[0] = (uint64_t (*)())PKPaymentSetupConfigurationFunction;
  return result;
}

id PKPaymentSetupConfigurationFunction()
{
  return (id)_MergedGlobals_3_4;
}

void *__PassKitCoreLibrary_block_invoke_1()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/PassKitCore.framework/PassKitCore", 2);
  PassKitCoreLibrary_sLib_1 = (uint64_t)result;
  return result;
}

Class initPKPaymentSetupViewController()
{
  if (qword_1EB38D3F0 != -1) {
    dispatch_once(&qword_1EB38D3F0, &__block_literal_global_31_1);
  }
  Class result = objc_getClass("PKPaymentSetupViewController");
  qword_1EB38D3E8 = (uint64_t)result;
  off_1EB38AA00 = (uint64_t (*)())PKPaymentSetupViewControllerFunction;
  return result;
}

id PKPaymentSetupViewControllerFunction()
{
  return (id)qword_1EB38D3E8;
}

void *__PassKitUILibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/PassKitUI.framework/PassKitUI", 2);
  PassKitUILibrary_sLib_0 = (uint64_t)result;
  return result;
}

id getPKPaymentSummaryItemClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPKPaymentSummaryItemClass_softClass;
  uint64_t v7 = getPKPaymentSummaryItemClass_softClass;
  if (!getPKPaymentSummaryItemClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPKPaymentSummaryItemClass_block_invoke;
    v3[3] = &unk_1E559EC70;
    v3[4] = &v4;
    __getPKPaymentSummaryItemClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18DCBD5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPKPaymentContentItemClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPKPaymentContentItemClass_softClass;
  uint64_t v7 = getPKPaymentContentItemClass_softClass;
  if (!getPKPaymentContentItemClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPKPaymentContentItemClass_block_invoke;
    v3[3] = &unk_1E559EC70;
    v3[4] = &v4;
    __getPKPaymentContentItemClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18DCBD90C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCBFA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCC0290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCC0D0C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_18DCC191C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCC35B0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v3 + 16))(v3);
  (*(void (**)(uint64_t))(v2 + 16))(v2);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void __getPKPaymentSummaryItemClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PKPaymentSummaryItem");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKPaymentSummaryItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    PassKitCoreLibrary_1();
  }
}

void PassKitCoreLibrary_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!PassKitCoreLibraryCore_frameworkLibrary_1)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __PassKitCoreLibraryCore_block_invoke_2;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E55A5220;
    uint64_t v3 = 0;
    PassKitCoreLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (PassKitCoreLibraryCore_frameworkLibrary_1)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __PassKitCoreLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore_frameworkLibrary_1 = result;
  return result;
}

AMSPaymentSheetRequest *__getPKPaymentContentItemClass_block_invoke(uint64_t a1)
{
  PassKitCoreLibrary_1();
  uint64_t result = (AMSPaymentSheetRequest *)objc_getClass("PKPaymentContentItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKPaymentContentItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (AMSPaymentSheetRequest *)abort_report_np();
    return [(AMSPaymentSheetRequest *)v3 init];
  }
  return result;
}

void sub_18DCC95E4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18DCC9FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_18DCCC91C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18DCCDC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPKPaymentRequestClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PKPaymentRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKPaymentRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    PassKitCoreLibrary_2();
  }
}

void PassKitCoreLibrary_2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!PassKitCoreLibraryCore_frameworkLibrary_2)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __PassKitCoreLibraryCore_block_invoke_3;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E55A54A0;
    uint64_t v3 = 0;
    PassKitCoreLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (PassKitCoreLibraryCore_frameworkLibrary_2)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __PassKitCoreLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore_frameworkLibrary_2 = result;
  return result;
}

Class __getPKPaymentMerchantSessionClass_block_invoke_0(uint64_t a1)
{
  PassKitCoreLibrary_2();
  Class result = objc_getClass("PKPaymentMerchantSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKPaymentMerchantSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getPKPaymentAuthorizationControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getPKPaymentAuthorizationControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1EB38D1E8)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __PassKitUILibraryCore_block_invoke;
    std::runtime_error v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E55A54B8;
    uint64_t v6 = 0;
    qword_1EB38D1E8 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!qword_1EB38D1E8)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PKPaymentAuthorizationController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  _MergedGlobals_1_15 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB38D1E8 = result;
  return result;
}

Class __getPKPaymentAuthorizationResultClass_block_invoke(uint64_t a1)
{
  PassKitCoreLibrary_2();
  Class result = objc_getClass("PKPaymentAuthorizationResult");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKPaymentAuthorizationResultClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getPKPaymentRequestPaymentMethodUpdateClass_block_invoke(v3);
  }
  return result;
}

Class __getPKPaymentRequestPaymentMethodUpdateClass_block_invoke(uint64_t a1)
{
  PassKitCoreLibrary_2();
  Class result = objc_getClass("PKPaymentRequestPaymentMethodUpdate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKPaymentRequestPaymentMethodUpdateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)abort_report_np();
    return (Class)+[AMSPaymentValidationService _isEntitledForDirectAccess];
  }
  return result;
}

void sub_18DCD023C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getOBPrivacyAppleIDIdentifier()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)_MergedGlobals_137;
  uint64_t v8 = _MergedGlobals_137;
  if (!_MergedGlobals_137)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getOBPrivacyAppleIDIdentifierSymbolLoc_block_invoke;
    v4[3] = &unk_1E559EC70;
    std::runtime_error v4[4] = &v5;
    __getOBPrivacyAppleIDIdentifierSymbolLoc_block_invoke((uint64_t)v4);
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    uint64_t v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  uint64_t v1 = *v0;
  return v1;
}

void *__getOBPrivacyAppleIDIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!qword_1EB38DEB8)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __OnBoardingKitLibraryCore_block_invoke_0;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E55A5570;
    uint64_t v7 = 0;
    qword_1EB38DEB8 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    long long v2 = (void *)qword_1EB38DEB8;
    if (qword_1EB38DEB8)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  long long v2 = (void *)qword_1EB38DEB8;
LABEL_5:
  Class result = dlsym(v2, "OBPrivacyAppleIDIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_137 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __OnBoardingKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  qword_1EB38DEB8 = result;
  return result;
}

void sub_18DCD2D50(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t initBYSetupAssistantNeedsToRun()
{
  if (qword_1EB38DF00 != -1) {
    dispatch_once(&qword_1EB38DF00, &__block_literal_global_228);
  }
  uint64_t v0 = (uint64_t (*)())dlsym((void *)qword_1EB38DF08, "BYSetupAssistantNeedsToRun");
  softLinkBYSetupAssistantNeedsToRun = v0;
  return v0();
}

void *__SetupAssistantLibrary_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/SetupAssistant.framework/SetupAssistant", 2);
  qword_1EB38DF08 = (uint64_t)result;
  return result;
}

void sub_18DCD8818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_18DCDBB14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18DCDD808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCDDA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCDDCA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCE4AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DCE5C98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18DCE8090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
}

void sub_18DCF0B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCF6630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCF80C0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void *__getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke_1(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!qword_1EB38D208)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __MobileKeyBagLibraryCore_block_invoke_1;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E55A62E0;
    uint64_t v7 = 0;
    qword_1EB38D208 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_1EB38D208;
    if (qword_1EB38D208)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_1EB38D208;
LABEL_5:
  uint64_t result = dlsym(v2, "MKBDeviceUnlockedSinceBoot");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1EB38D200 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileKeyBagLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  qword_1EB38D208 = result;
  return result;
}

void sub_18DCFA6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DCFAB60(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_18DCFEE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSimulateCrashSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!qword_1EB38DF68)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __CrashReporterSupportLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E55A65B0;
    uint64_t v7 = 0;
    qword_1EB38DF68 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_1EB38DF68;
    if (qword_1EB38DF68)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_1EB38DF68;
LABEL_5:
  uint64_t result = dlsym(v2, "SimulateCrash");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_142 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CrashReporterSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB38DF68 = result;
  return result;
}

void sub_18DD013B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DD014A0(_Unwind_Exception *a1)
{
  SEL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18DD01504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DD016A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DD01874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DD0195C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DD01A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void AMSSQLiteBindFoundationValue(void *a1, uint64_t a2, void *a3)
{
  id v9 = a1;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 bindString:v5 atPosition:a2];
    goto LABEL_16;
  }
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v9 bindNullAtPosition:a2];
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 timeIntervalSinceReferenceDate];
LABEL_8:
    objc_msgSend(v9, "bindDouble:atPosition:", a2);
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 bindData:v5 atPosition:a2];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v6 = [v5 absoluteString];
      [v9 bindString:v6 atPosition:a2];
    }
    else
    {
      id v7 = v5;
      uint64_t v8 = (const char *)[v7 objCType];
      if (!strcmp(v8, "d") || !strcmp(v8, "f"))
      {
        [v7 doubleValue];
        goto LABEL_8;
      }
      objc_msgSend(v9, "bindInt64:atPosition:", objc_msgSend(v7, "longLongValue"), a2);
    }
  }
LABEL_16:
}

void sub_18DD01DA4(_Unwind_Exception *a1)
{
}

id AMSSQLiteCopyFoundationValue(void *a1, uint64_t a2)
{
  id v3 = a1;
  SEL v4 = 0;
  switch([v3 _columnTypeForColumnIndex:a2])
  {
    case 1u:
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v3, "int64ForColumnIndex:", a2));
      goto LABEL_6;
    case 2u:
      long long v6 = (void *)MEMORY[0x1E4F28ED0];
      [v3 doubleForColumnIndex:a2];
      uint64_t v5 = objc_msgSend(v6, "numberWithDouble:");
      goto LABEL_6;
    case 3u:
      uint64_t v5 = [v3 stringForColumnIndex:a2];
      goto LABEL_6;
    case 5u:
      goto LABEL_7;
    default:
      uint64_t v5 = [v3 dataForColumnIndex:a2];
LABEL_6:
      SEL v4 = (void *)v5;
LABEL_7:

      return v4;
  }
}

void sub_18DD02DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD030CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD033C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD03C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD040B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id AMSSQLiteCreateError(uint64_t a1, void *a2, uint64_t a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  long long v11 = @"AMSSQLiteErrorCode";
  uint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = a2;
  id v7 = [v5 numberWithInt:a3];
  v12[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = AMSCustomError(@"AMSSQLiteErrorDomain", a1, v6, 0, v8, 0);

  return v9;
}

void sub_18DD06F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD0732C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD07A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD08500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD088E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD08B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD08D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD08F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD0915C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD093D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AMSSQLiteGetCurrentError(sqlite3 *a1)
{
  int v2 = sqlite3_errcode(a1);
  if (v2)
  {
    int v3 = v2;
    SEL v4 = (char *)sqlite3_errmsg(a1);
    if (v4)
    {
      uint64_t v5 = (void *)[[NSString alloc] initWithUTF8String:v4];
      id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      SEL v4 = (char *)objc_msgSend(v6, "initWithObjectsAndKeys:", v5, *MEMORY[0x1E4F28568], 0);
    }
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:0x1EDCC2228 code:v3 userInfo:v4];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

void AMSSQLiteCloseDatabase(sqlite3 *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v1 = sqlite3_close(a1);
    if (v1)
    {
      int v2 = v1;
      int v3 = +[AMSLogConfig sharedConfig];
      if (!v3)
      {
        int v3 = +[AMSLogConfig sharedConfig];
      }
      SEL v4 = [v3 OSLogObject];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5[0] = 67109120;
        v5[1] = v2;
        _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "Error closing database. closeResult = %d", (uint8_t *)v5, 8u);
      }
    }
  }
}

BOOL AMSSQLiteTruncateDatabase(void *a1)
{
  ppDb = 0;
  if (sqlite3_open_v2((const char *)[a1 fileSystemRepresentation], &ppDb, 2, 0))
  {
    return 0;
  }
  int v3 = 129;
  BOOL v1 = sqlite3_file_control(ppDb, 0, 101, &v3) == 0;
  sqlite3_close(ppDb);
  return v1;
}

void sub_18DD0B390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18DD0BEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD0C22C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18DD0C774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18DD0CE64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

void sub_18DD0DAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_18DD0E730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _AMSHTTPArchiveControllerShouldSaveToDisk()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[AMSLogConfig sharedConfig];
  if (!v0)
  {
    uint64_t v0 = +[AMSLogConfig sharedConfig];
  }
  BOOL v1 = [v0 OSLogObject];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = AMSLogKey();
    int v4 = 138543362;
    uint64_t v5 = v2;
    _os_log_impl(&dword_18D554000, v1, OS_LOG_TYPE_DEFAULT, "%{public}@: [AMSStreamHTTPArchiveEntryController] Received should save HAR to disk", (uint8_t *)&v4, 0xCu);
  }
  return +[AMSStreamHTTPArchiveEntryController ams_streamEntriesToDisk];
}

uint64_t _AMSHTTPArchiveControllerShouldSaveToDiskDecompressed()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[AMSLogConfig sharedConfig];
  if (!v0)
  {
    uint64_t v0 = +[AMSLogConfig sharedConfig];
  }
  BOOL v1 = [v0 OSLogObject];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = AMSLogKey();
    int v4 = 138543362;
    uint64_t v5 = v2;
    _os_log_impl(&dword_18D554000, v1, OS_LOG_TYPE_DEFAULT, "%{public}@: [AMSStreamHTTPArchiveEntryController] Received should save HAR to disk decompressed", (uint8_t *)&v4, 0xCu);
  }
  return +[AMSStreamHTTPArchiveEntryController ams_streamEntriesToDisk];
}

void sub_18DD10D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AMSMaybeUpperCaseNormalisedStringIfFoundInList(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v4 containsObject:v3])
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [v3 uppercaseString];
    if ([v4 containsObject:v6]) {
      id v5 = v6;
    }
    else {
      id v5 = 0;
    }
  }
  return v5;
}

id getASDSubscriptionEntitlementsClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)_MergedGlobals_145;
  uint64_t v7 = _MergedGlobals_145;
  if (!_MergedGlobals_145)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getASDSubscriptionEntitlementsClass_block_invoke;
    v3[3] = &unk_1E559EC70;
    v3[4] = &v4;
    __getASDSubscriptionEntitlementsClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18DD15050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD157D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getASDSubscriptionEntitlementsClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1EB38DF98)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AppStoreDaemonLibraryCore_block_invoke;
    std::runtime_error v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E55A6D38;
    uint64_t v6 = 0;
    qword_1EB38DF98 = _sl_dlopen();
    int v2 = (void *)v4[0];
    if (!qword_1EB38DF98)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("ASDSubscriptionEntitlements");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    int v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  _MergedGlobals_145 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppStoreDaemonLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB38DF98 = result;
  return result;
}

void __getICMusicSubscriptionStatusControllerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("ICMusicSubscriptionStatusController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1EB38DFA0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    iTunesCloudLibrary();
  }
}

void iTunesCloudLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!iTunesCloudLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __iTunesCloudLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E55A6D50;
    uint64_t v3 = 0;
    iTunesCloudLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (iTunesCloudLibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __iTunesCloudLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  iTunesCloudLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getICStoreRequestContextClass_block_invoke(uint64_t a1)
{
  iTunesCloudLibrary();
  Class result = objc_getClass("ICStoreRequestContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1EB38DFA8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getICUserIdentityClass_block_invoke(v3);
  }
  return result;
}

Class __getICUserIdentityClass_block_invoke(uint64_t a1)
{
  iTunesCloudLibrary();
  Class result = objc_getClass("ICUserIdentity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1EB38DFB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getICMusicSubscriptionStatusRequestClass_block_invoke(v3);
  }
  return result;
}

AMSSyncAccountFlagsResult *__getICMusicSubscriptionStatusRequestClass_block_invoke(uint64_t a1)
{
  iTunesCloudLibrary();
  Class result = (AMSSyncAccountFlagsResult *)objc_getClass("ICMusicSubscriptionStatusRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1EB38DFB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (AMSSyncAccountFlagsResult *)abort_report_np();
    return [(AMSSyncAccountFlagsResult *)v3 initWithAccountFlags:v5];
  }
  return result;
}

void sub_18DD18D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DD19078(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18DD1D4F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DD1F1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD20764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD208F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD20FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD210C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD211F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD235FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DD23A28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18DD23B08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18DD23E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DD24378(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18DD2445C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18DD246BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18DD249AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DD24DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18DD24FBC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18DD251BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD25A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD25D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD25F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD263BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_18DD26908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD26AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD34100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DD3415C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DD341CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18DD3424C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18DD3BDB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_18DD3D088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18DD3ECA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18DD3F5BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void AMS::BundleInfo::getAccountClientIdentifier(id *this@<X0>, void *a2@<X8>)
{
  uint64_t v3 = [this[2] accountMediaType];
  if (AMSAccountMediaTypeAppStoreSandbox == v3) {
    SEL v4 = "com.apple.AppleMediaServicesCore.IMediaAccount.appStoreSandbox";
  }
  else {
    SEL v4 = "com.apple.AppleMediaServicesCore.IMediaAccount.appStore";
  }
  uint64_t v6 = v3;
  if (AMSAccountMediaTypeAppStoreBeta == v3) {
    id v5 = "com.apple.AppleMediaServicesCore.IMediaAccount.appStoreBeta";
  }
  else {
    id v5 = (char *)v4;
  }
  std::string::basic_string[abi:ne180100]<0>(a2, v5);
}

void sub_18DD430B8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __clang_call_terminate(a1);
}

void AMS::BundleInfo::getIdentifier(id *this@<X0>, void *a2@<X8>)
{
  id v3 = [this[2] bundleIdentifier];
  std::string::basic_string[abi:ne180100]<0>(a2, (char *)[v3 UTF8String]);
}

void sub_18DD43140(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void AMS::BundleInfo::getIssuingBundleInfo(id *this@<X0>, uint64_t a2@<X8>)
{
  SEL v4 = [this[2] proxyAppBundleID];
  if (v4)
  {
    uint64_t v7 = v4;
    id v5 = [[AMSProcessInfo alloc] initWithBundleIdentifier:v4];
    uint64_t v6 = +[AMSMappedBundleInfo bundleInfoForProcessInfo:v5];
    std::allocate_shared[abi:ne180100]<AMS::BundleInfo,std::allocator<AMS::BundleInfo>,AMSProcessInfo * const {__strong}&,AMSMappedBundleInfo * {__strong}&,void>(&v8, this[1], v6);
    *(_OWORD *)a2 = v8;

    SEL v4 = v7;
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + _Block_object_dispose(&a9, 8) = 0;
  }
}

void sub_18DD43210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void AMS::BundleInfo::getMappedAccountClientIdentifierBundleInfo(AMS::BundleInfo *this@<X0>, uint64_t a2@<X8>)
{
  SEL v4 = +[AMSMappedBundleInfo accountMediaTypeInfoForProcessInfo:*((void *)this + 1)];
  if (v4)
  {
    id v5 = v4;
    std::allocate_shared[abi:ne180100]<AMS::BundleInfo,std::allocator<AMS::BundleInfo>,AMSProcessInfo * const {__strong}&,AMSMappedBundleInfo * {__strong}&,void>(&v6, *((void **)this + 1), v4);
    *(_OWORD *)a2 = v6;
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + _Block_object_dispose(&a9, 8) = 0;
  }
}

void AMS::BundleInfo::~BundleInfo(id *this)
{
}

{
  uint64_t vars8;

  JUMPOUT(0x192FA4080);
}

id std::allocate_shared[abi:ne180100]<AMS::BundleInfo,std::allocator<AMS::BundleInfo>,AMSProcessInfo * const {__strong}&,AMSMappedBundleInfo * {__strong}&,void>(void *a1, void *a2, void *a3)
{
  long long v6 = operator new(0x30uLL);
  v6[1] = 0;
  v6[2] = 0;
  void *v6 = &unk_1EDC83980;
  id v7 = a2;
  id result = a3;
  v6[3] = &unk_1EDC818E0;
  void v6[4] = v7;
  v6[5] = result;
  *a1 = v6 + 3;
  a1[1] = v6;
  return result;
}

void std::__shared_ptr_emplace<AMS::BundleInfo>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDC83980;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<AMS::BundleInfo>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDC83980;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x192FA4080);
}

uint64_t std::__shared_ptr_emplace<AMS::BundleInfo>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t AMS::DeviceInfo::getBuildType(AMS::DeviceInfo *this)
{
  return os_variant_has_internal_content();
}

void AMS::DeviceInfo::getUniqueIdentifier(uint64_t a1@<X8>)
{
  id v3 = +[AMSDevice deviceGUID];
  if ([v3 length])
  {
    id v4 = v3;
    std::string::basic_string[abi:ne180100]<0>(&v5, (char *)[v4 UTF8String]);

    *(_OWORD *)a1 = v5;
    *(void *)(a1 + 16) = v6;
    *(unsigned char *)(a1 + 24) = 1;
  }
  else
  {
    *(unsigned char *)a1 = 0;
    *(unsigned char *)(a1 + 24) = 0;
  }
}

void sub_18DD43538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void AMS::DeviceInfo::getLanguageCode(void *a1@<X8>)
{
  id v3 = +[AMSDevice language];
  std::string::basic_string[abi:ne180100]<0>(a1, (char *)[v3 UTF8String]);
}

void sub_18DD435C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void AMS::DeviceInfo::getName(void *a1@<X8>)
{
  id v3 = +[AMSDevice name];
  std::string::basic_string[abi:ne180100]<0>(a1, (char *)[v3 UTF8String]);
}

void sub_18DD43650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void AMS::DeviceInfo::getBrowserVersion(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

void AMS::DeviceInfo::~DeviceInfo(AMS::DeviceInfo *this)
{
}

void sub_18DD4391C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18DD43B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AMSLocalizedString(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = objc_msgSend(v3, "ams_AppleMediaServicesBundle");
  id v7 = +[AMSLocalizations localizedStringForKey:v5 bundle:v6 table:@"Localizable" bag:v4];

  return v7;
}

void *__copy_constructor_8_8_s0_s8_s16(void *result)
{
  *id result = 0;
  result[1] = 0;
  result[2] = 0;
  return result;
}

void sub_18DD464B4(_Unwind_Exception *a1)
{
  __destructor_8_s0_s8_s16(v1);
  _Unwind_Resume(a1);
}

void sub_18DD4739C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _handleClearCachesNotification_0()
{
  uint64_t v0 = dispatch_get_global_queue(0, 0);
  dispatch_async(v0, &__block_literal_global_154);
}

void ___handleClearCachesNotification_block_invoke_0()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v0 = AMSSetLogKey(0);
  uint64_t v1 = +[AMSLogConfig sharedConfig];
  if (!v1)
  {
    uint64_t v1 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v2 = [v1 OSLogObject];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = AMSLogKey();
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_18D554000, v2, OS_LOG_TYPE_DEFAULT, "NSURLSessionConfiguration+AppleMediaServices: [%{public}@] Received clear caches notification", (uint8_t *)&v6, 0xCu);
  }
  id v4 = [MEMORY[0x1E4F18DD0] _URLBagCache];
  [v4 removeAllCachedResponses];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:0x1EDCAACA8 object:0];
}

void AMSSetCountryCodeOnPaymentRequest(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = AMSNormalisedCountryCodeForPaymentRequest(v3);
  if (v5)
  {
    [v4 setCountryCode:v5];
  }
  else
  {
    BOOL v6 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v7 = +[AMSLogConfig sharedConfig];
    uint64_t v8 = (void *)v7;
    if (v6)
    {
      if (!v7)
      {
        uint64_t v8 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v9 = [v8 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138543362;
        id v12 = v3;
        _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "AMSSetCountryCodeOnPaymentRequest: Attempting to set an invalid country code: %{public}@", (uint8_t *)&v11, 0xCu);
      }

      uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v10 = +[AMSLogConfig sharedConfig];
      [v8 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v10 userInfo:0];
    }
    else
    {
      if (!v7)
      {
        uint64_t v8 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v10 = [v8 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        int v11 = 138543362;
        id v12 = v3;
        _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_FAULT, "AMSSetCountryCodeOnPaymentRequest: Attempting to set an invalid country code: %{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

void std::__function::__func<AMSCore::AppleHTTPProvider::submitRequest(std::shared_ptr<AMSCore::HTTPRequest const>,std::optional<std::chrono::duration<long long,std::ratio<1l,1000l>>>)::$_0,std::allocator<AMSCore::AppleHTTPProvider::submitRequest(std::shared_ptr<AMSCore::HTTPRequest const>,std::optional<std::chrono::duration<long long,std::ratio<1l,1000l>>>)::$_0>,void ()(AMSCore::Task<AMSCore::HTTPResponse,AMSCore::HTTPError>::Completion)>::operator()(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 8);
  if (v1)
  {
    if (!atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

uint64_t std::__function::__func<AMSCore::AppleHTTPProvider::submitRequest(std::shared_ptr<AMSCore::HTTPRequest const>,std::optional<std::chrono::duration<long long,std::ratio<1l,1000l>>>)::$_0,std::allocator<AMSCore::AppleHTTPProvider::submitRequest(std::shared_ptr<AMSCore::HTTPRequest const>,std::optional<std::chrono::duration<long long,std::ratio<1l,1000l>>>)::$_0>,void ()(AMSCore::Task<AMSCore::HTTPResponse,AMSCore::HTTPError>::Completion)>::operator()(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 40))(result);
  }
  return result;
}

void std::__function::__func<AMSCore::AppleHTTPProvider::submitRequest(std::shared_ptr<AMSCore::HTTPRequest const>,std::optional<std::chrono::duration<long long,std::ratio<1l,1000l>>>)::$_0,std::allocator<AMSCore::AppleHTTPProvider::submitRequest(std::shared_ptr<AMSCore::HTTPRequest const>,std::optional<std::chrono::duration<long long,std::ratio<1l,1000l>>>)::$_0>,void ()(AMSCore::Task<AMSCore::HTTPResponse,AMSCore::HTTPError>::Completion)>::operator()(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::unordered_set<std::string,AMSCore::StringUtils::CaseInsensitiveHash,AMSCore::StringUtils::CaseInsensitiveEqualTo,std::allocator<std::string>>::unordered_set(void **a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2) {
    operator delete(v2);
  }
}

void std::unordered_set<std::string,AMSCore::StringUtils::CaseInsensitiveHash,AMSCore::StringUtils::CaseInsensitiveEqualTo,std::allocator<std::string>>::unordered_set(void **__p)
{
  do
  {
    uint64_t v2 = (void **)*__p;
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
    operator delete(__p);
    std::string __p = v2;
  }
  while (v2);
}

uint64_t sub_18DD4D220()
{
  return MEMORY[0x1F40E2D28]();
}

uint64_t sub_18DD4D230()
{
  return MEMORY[0x1F40E2D88]();
}

uint64_t sub_18DD4D240()
{
  return MEMORY[0x1F40E2DA0]();
}

uint64_t sub_18DD4D250()
{
  return MEMORY[0x1F40E2DF0]();
}

uint64_t sub_18DD4D260()
{
  return MEMORY[0x1F40E2E08]();
}

uint64_t sub_18DD4D270()
{
  return MEMORY[0x1F40E2E68]();
}

uint64_t sub_18DD4D280()
{
  return MEMORY[0x1F40E2EA8]();
}

uint64_t sub_18DD4D290()
{
  return MEMORY[0x1F40E2EB8]();
}

uint64_t sub_18DD4D2A0()
{
  return MEMORY[0x1F40E2ED8]();
}

uint64_t sub_18DD4D2B0()
{
  return MEMORY[0x1F40E2EE8]();
}

uint64_t sub_18DD4D2C0()
{
  return MEMORY[0x1F40E2F00]();
}

uint64_t sub_18DD4D2D0()
{
  return MEMORY[0x1F40E2F28]();
}

uint64_t sub_18DD4D2E0()
{
  return MEMORY[0x1F40E2F30]();
}

uint64_t sub_18DD4D2F0()
{
  return MEMORY[0x1F40E2F40]();
}

uint64_t sub_18DD4D300()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_18DD4D310()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_18DD4D320()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_18DD4D330()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_18DD4D340()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_18DD4D350()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_18DD4D360()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_18DD4D370()
{
  return MEMORY[0x1F40E3308]();
}

uint64_t sub_18DD4D380()
{
  return MEMORY[0x1F40E33C0]();
}

uint64_t sub_18DD4D390()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_18DD4D3A0()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_18DD4D3B0()
{
  return MEMORY[0x1F40E35C0]();
}

uint64_t sub_18DD4D3C0()
{
  return MEMORY[0x1F40E35C8]();
}

uint64_t sub_18DD4D3D0()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_18DD4D3E0()
{
  return MEMORY[0x1F40E35F0]();
}

uint64_t sub_18DD4D3F0()
{
  return MEMORY[0x1F40E3618]();
}

uint64_t sub_18DD4D410()
{
  return MEMORY[0x1F40E3668]();
}

uint64_t sub_18DD4D420()
{
  return MEMORY[0x1F40E3670]();
}

uint64_t sub_18DD4D430()
{
  return MEMORY[0x1F40E36C8]();
}

uint64_t sub_18DD4D440()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_18DD4D450()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_18DD4D460()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_18DD4D470()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_18DD4D480()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t sub_18DD4D490()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_18DD4D4A0()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_18DD4D4B0()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_18DD4D4C0()
{
  return MEMORY[0x1F40E3860]();
}

uint64_t sub_18DD4D4D0()
{
  return MEMORY[0x1F40E3908]();
}

uint64_t sub_18DD4D4E0()
{
  return MEMORY[0x1F40E3958]();
}

uint64_t sub_18DD4D4F0()
{
  return MEMORY[0x1F40E3978]();
}

uint64_t sub_18DD4D500()
{
  return MEMORY[0x1F40E3990]();
}

uint64_t sub_18DD4D510()
{
  return MEMORY[0x1F40E39B8]();
}

uint64_t sub_18DD4D520()
{
  return MEMORY[0x1F40E39D8]();
}

uint64_t sub_18DD4D530()
{
  return MEMORY[0x1F40E3A10]();
}

uint64_t sub_18DD4D540()
{
  return MEMORY[0x1F40E3A28]();
}

uint64_t sub_18DD4D550()
{
  return MEMORY[0x1F40E3A50]();
}

uint64_t sub_18DD4D560()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_18DD4D570()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_18DD4D580()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_18DD4D590()
{
  return MEMORY[0x1F40E3AB0]();
}

uint64_t sub_18DD4D5A0()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_18DD4D5B0()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_18DD4D5C0()
{
  return MEMORY[0x1F40E3F90]();
}

uint64_t sub_18DD4D5D0()
{
  return MEMORY[0x1F40E4008]();
}

uint64_t sub_18DD4D5E0()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_18DD4D5F0()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_18DD4D600()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_18DD4D610()
{
  return MEMORY[0x1F40E4228]();
}

uint64_t sub_18DD4D620()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t sub_18DD4D630()
{
  return MEMORY[0x1F40E4248]();
}

uint64_t sub_18DD4D640()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t sub_18DD4D650()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t sub_18DD4D6A0()
{
  return MEMORY[0x1F40E44C8]();
}

uint64_t sub_18DD4D6D0()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_18DD4D6E0()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_18DD4D6F0()
{
  return MEMORY[0x1F40E4898]();
}

uint64_t sub_18DD4D700()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_18DD4D710()
{
  return MEMORY[0x1F40E48E8]();
}

uint64_t sub_18DD4D720()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_18DD4D730()
{
  return MEMORY[0x1F40E4918]();
}

uint64_t sub_18DD4D740()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_18DD4D750()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_18DD4D760()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_18DD4D770()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_18DD4D780()
{
  return MEMORY[0x1F40E4A90]();
}

uint64_t sub_18DD4D790()
{
  return MEMORY[0x1F40E4AA0]();
}

uint64_t sub_18DD4D7A0()
{
  return MEMORY[0x1F40E4AA8]();
}

uint64_t sub_18DD4D7B0()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_18DD4D7C0()
{
  return MEMORY[0x1F40E4AE0]();
}

uint64_t sub_18DD4D7D0()
{
  return MEMORY[0x1F40E4B00]();
}

uint64_t sub_18DD4D7E0()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_18DD4D7F0()
{
  return MEMORY[0x1F40E4B38]();
}

uint64_t sub_18DD4D800()
{
  return MEMORY[0x1F40E4B48]();
}

uint64_t sub_18DD4D810()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_18DD4D820()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_18DD4D830()
{
  return MEMORY[0x1F40E4BB0]();
}

uint64_t sub_18DD4D840()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_18DD4D850()
{
  return MEMORY[0x1F40E4BD8]();
}

uint64_t sub_18DD4D860()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_18DD4D870()
{
  return MEMORY[0x1F40E4C08]();
}

uint64_t sub_18DD4D880()
{
  return MEMORY[0x1F40E4C18]();
}

uint64_t sub_18DD4D890()
{
  return MEMORY[0x1F40E4C78]();
}

uint64_t sub_18DD4D8A0()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_18DD4D8B0()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_18DD4D8C0()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_18DD4D8D0()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t sub_18DD4D8E0()
{
  return MEMORY[0x1F40E50A8]();
}

uint64_t sub_18DD4D8F0()
{
  return MEMORY[0x1F40E50C8]();
}

uint64_t sub_18DD4D900()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_18DD4D910()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_18DD4D920()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_18DD4D930()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_18DD4D940()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_18DD4D950()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_18DD4D960()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_18DD4D970()
{
  return MEMORY[0x1F40E5320]();
}

uint64_t sub_18DD4D980()
{
  return MEMORY[0x1F40E5338]();
}

uint64_t sub_18DD4D990()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_18DD4D9A0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_18DD4D9B0()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_18DD4D9C0()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_18DD4D9D0()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_18DD4D9E0()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_18DD4D9F0()
{
  return MEMORY[0x1F40E58B0]();
}

uint64_t sub_18DD4DA00()
{
  return MEMORY[0x1F40E5978]();
}

uint64_t sub_18DD4DA10()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_18DD4DA20()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_18DD4DA30()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_18DD4DA40()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_18DD4DA50()
{
  return MEMORY[0x1F40E5D20]();
}

uint64_t sub_18DD4DA60()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_18DD4DA70()
{
  return MEMORY[0x1F4187480]();
}

uint64_t sub_18DD4DA80()
{
  return MEMORY[0x1F4187490]();
}

uint64_t sub_18DD4DA90()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_18DD4DAA0()
{
  return MEMORY[0x1F4116F48]();
}

uint64_t sub_18DD4DAB0()
{
  return MEMORY[0x1F4116F50]();
}

uint64_t sub_18DD4DAC0()
{
  return MEMORY[0x1F4116F58]();
}

uint64_t sub_18DD4DAD0()
{
  return MEMORY[0x1F4116F60]();
}

uint64_t sub_18DD4DAE0()
{
  return MEMORY[0x1F4188358]();
}

uint64_t sub_18DD4DAF0()
{
  return MEMORY[0x1F41883D8]();
}

uint64_t sub_18DD4DB00()
{
  return MEMORY[0x1F4112860]();
}

uint64_t sub_18DD4DB10()
{
  return MEMORY[0x1F4112868]();
}

uint64_t sub_18DD4DB20()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_18DD4DB30()
{
  return MEMORY[0x1F4188560]();
}

uint64_t sub_18DD4DB40()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_18DD4DB50()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_18DD4DB60()
{
  return MEMORY[0x1F41885A0]();
}

uint64_t sub_18DD4DB70()
{
  return MEMORY[0x1F41885A8]();
}

uint64_t sub_18DD4DB80()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_18DD4DB90()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_18DD4DBA0()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_18DD4DBB0()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_18DD4DBC0()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_18DD4DBD0()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_18DD4DBE0()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_18DD4DBF0()
{
  return MEMORY[0x1F41884A8]();
}

uint64_t sub_18DD4DC00()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_18DD4DC10()
{
  return MEMORY[0x1F4186C80]();
}

uint64_t sub_18DD4DC20()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_18DD4DC30()
{
  return MEMORY[0x1F4186CC0]();
}

uint64_t sub_18DD4DC40()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_18DD4DC50()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_18DD4DC60()
{
  return MEMORY[0x1F4186D28]();
}

uint64_t sub_18DD4DC70()
{
  return MEMORY[0x1F4186D48]();
}

uint64_t sub_18DD4DC80()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_18DD4DC90()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_18DD4DCA0()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_18DD4DCB0()
{
  return MEMORY[0x1F4186E98]();
}

uint64_t sub_18DD4DCC0()
{
  return MEMORY[0x1F4186ED8]();
}

uint64_t sub_18DD4DCD0()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t sub_18DD4DCE0()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_18DD4DCF0()
{
  return MEMORY[0x1F40DFF38]();
}

uint64_t sub_18DD4DD00()
{
  return MEMORY[0x1F40DFF40]();
}

uint64_t sub_18DD4DD10()
{
  return MEMORY[0x1F40DFF58]();
}

uint64_t sub_18DD4DD20()
{
  return MEMORY[0x1F40DFF70]();
}

uint64_t sub_18DD4DD30()
{
  return MEMORY[0x1F40DFF90]();
}

uint64_t sub_18DD4DD40()
{
  return MEMORY[0x1F40E0498]();
}

uint64_t sub_18DD4DD50()
{
  return MEMORY[0x1F40E04A8]();
}

uint64_t sub_18DD4DD60()
{
  return MEMORY[0x1F40E04D0]();
}

uint64_t sub_18DD4DD70()
{
  return MEMORY[0x1F4187BE8]();
}

uint64_t sub_18DD4DD80()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_18DD4DD90()
{
  return MEMORY[0x1F40E6018]();
}

uint64_t sub_18DD4DDA0()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_18DD4DDB0()
{
  return MEMORY[0x1F4183338]();
}

uint64_t sub_18DD4DDC0()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_18DD4DDD0()
{
  return MEMORY[0x1F4183460]();
}

uint64_t sub_18DD4DDE0()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_18DD4DDF0()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_18DD4DE00()
{
  return MEMORY[0x1F4183648]();
}

uint64_t sub_18DD4DE10()
{
  return MEMORY[0x1F4188418]();
}

uint64_t sub_18DD4DE20()
{
  return MEMORY[0x1F4188430]();
}

uint64_t sub_18DD4DE30()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_18DD4DE40()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_18DD4DE50()
{
  return MEMORY[0x1F4183820]();
}

uint64_t sub_18DD4DE60()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_18DD4DE70()
{
  return MEMORY[0x1F40E6050]();
}

uint64_t sub_18DD4DE80()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_18DD4DE90()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_18DD4DEA0()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_18DD4DEB0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_18DD4DEC0()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_18DD4DED0()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_18DD4DEE0()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_18DD4DEF0()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_18DD4DF00()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_18DD4DF10()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_18DD4DF20()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_18DD4DF30()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_18DD4DF40()
{
  return MEMORY[0x1F4183900]();
}

uint64_t sub_18DD4DF50()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_18DD4DF60()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_18DD4DF70()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_18DD4DF80()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_18DD4DF90()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_18DD4DFA0()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_18DD4DFB0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_18DD4DFC0()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_18DD4DFD0()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_18DD4DFF0()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_18DD4E000()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_18DD4E010()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_18DD4E020()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_18DD4E030()
{
  return MEMORY[0x1F4183B50]();
}

uint64_t sub_18DD4E040()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_18DD4E050()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_18DD4E060()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_18DD4E070()
{
  return MEMORY[0x1F4183BB8]();
}

uint64_t sub_18DD4E080()
{
  return MEMORY[0x1F4183C40]();
}

uint64_t sub_18DD4E090()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_18DD4E0A0()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_18DD4E0B0()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_18DD4E0C0()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_18DD4E0D0()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_18DD4E0E0()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_18DD4E0F0()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_18DD4E100()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_18DD4E110()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_18DD4E120()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_18DD4E130()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_18DD4E140()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_18DD4E150()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_18DD4E160()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_18DD4E170()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_18DD4E180()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_18DD4E190()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_18DD4E1A0()
{
  return MEMORY[0x1F4187C18]();
}

uint64_t sub_18DD4E1B0()
{
  return MEMORY[0x1F4187C38]();
}

uint64_t sub_18DD4E1D0()
{
  return MEMORY[0x1F4187C68]();
}

uint64_t sub_18DD4E210()
{
  return MEMORY[0x1F4187CC0]();
}

uint64_t sub_18DD4E220()
{
  return MEMORY[0x1F4187CE0]();
}

uint64_t sub_18DD4E230()
{
  return MEMORY[0x1F4187CE8]();
}

uint64_t sub_18DD4E240()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_18DD4E250()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_18DD4E260()
{
  return MEMORY[0x1F4187D08]();
}

uint64_t sub_18DD4E270()
{
  return MEMORY[0x1F4187D18]();
}

uint64_t sub_18DD4E280()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_18DD4E290()
{
  return MEMORY[0x1F4187D40]();
}

uint64_t sub_18DD4E2A0()
{
  return MEMORY[0x1F4187D48]();
}

uint64_t sub_18DD4E2B0()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_18DD4E2D0()
{
  return MEMORY[0x1F4187D78]();
}

uint64_t sub_18DD4E2E0()
{
  return MEMORY[0x1F4187DD0]();
}

uint64_t sub_18DD4E2F0()
{
  return MEMORY[0x1F4187DD8]();
}

uint64_t sub_18DD4E300()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_18DD4E310()
{
  return MEMORY[0x1F4187F10]();
}

uint64_t sub_18DD4E320()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_18DD4E330()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_18DD4E340()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_18DD4E350()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_18DD4E370()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_18DD4E380()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_18DD4E390()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_18DD4E3A0()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_18DD4E3B0()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_18DD4E3C0()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_18DD4E3D0()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_18DD4E3E0()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_18DD4E3F0()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_18DD4E400()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_18DD4E410()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_18DD4E420()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_18DD4E430()
{
  return MEMORY[0x1F4188718]();
}

uint64_t sub_18DD4E440()
{
  return MEMORY[0x1F41872A0]();
}

uint64_t sub_18DD4E450()
{
  return MEMORY[0x1F41872A8]();
}

uint64_t sub_18DD4E460()
{
  return MEMORY[0x1F41872F0]();
}

uint64_t sub_18DD4E470()
{
  return MEMORY[0x1F40E6858]();
}

uint64_t sub_18DD4E480()
{
  return MEMORY[0x1F40E6860]();
}

uint64_t sub_18DD4E490()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_18DD4E4A0()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_18DD4E4B0()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_18DD4E4C0()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_18DD4E4D0()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_18DD4E4E0()
{
  return MEMORY[0x1F41846D8]();
}

uint64_t sub_18DD4E4F0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_18DD4E500()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_18DD4E510()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_18DD4E520()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_18DD4E530()
{
  return MEMORY[0x1F40E6C98]();
}

uint64_t sub_18DD4E540()
{
  return MEMORY[0x1F40E6CB8]();
}

uint64_t sub_18DD4E550()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_18DD4E560()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_18DD4E580()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_18DD4E590()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_18DD4E5A0()
{
  return MEMORY[0x1F4184B28]();
}

uint64_t sub_18DD4E5B0()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_18DD4E5C0()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_18DD4E5D0()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_18DD4E5E0()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_18DD4E5F0()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_18DD4E600()
{
  return MEMORY[0x1F40E6DB8]();
}

uint64_t sub_18DD4E610()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_18DD4E620()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_18DD4E630()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_18DD4E640()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_18DD4E650()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_18DD4E660()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_18DD4E670()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_18DD4E680()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_18DD4E690()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_18DD4E6A0()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_18DD4E6B0()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_18DD4E6C0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_18DD4E6E0()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_18DD4E6F0()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_18DD4E700()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_18DD4E710()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_18DD4E720()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_18DD4E730()
{
  return MEMORY[0x1F4184FF8]();
}

uint64_t sub_18DD4E740()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_18DD4E750()
{
  return MEMORY[0x1F4188000]();
}

uint64_t sub_18DD4E760()
{
  return MEMORY[0x1F41850B0]();
}

uint64_t sub_18DD4E770()
{
  return MEMORY[0x1F41850C0]();
}

uint64_t sub_18DD4E780()
{
  return MEMORY[0x1F4185180]();
}

uint64_t sub_18DD4E790()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_18DD4E7A0()
{
  return MEMORY[0x1F41851B8]();
}

uint64_t sub_18DD4E7B0()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_18DD4E7C0()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_18DD4E7D0()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_18DD4E7E0()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_18DD4E7F0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_18DD4E800()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_18DD4E820()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_18DD4E830()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_18DD4E840()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_18DD4E850()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_18DD4E860()
{
  return MEMORY[0x1F4188038]();
}

uint64_t sub_18DD4E870()
{
  return MEMORY[0x1F41853A8]();
}

uint64_t sub_18DD4E890()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_18DD4E8A0()
{
  return MEMORY[0x1F4188088]();
}

uint64_t sub_18DD4E8B0()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_18DD4E8C0()
{
  return MEMORY[0x1F4185500]();
}

uint64_t sub_18DD4E8D0()
{
  return MEMORY[0x1F4185508]();
}

uint64_t sub_18DD4E8E0()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_18DD4E8F0()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_18DD4E900()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_18DD4E910()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_18DD4E920()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_18DD4E930()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_18DD4E940()
{
  return MEMORY[0x1F41855D8]();
}

uint64_t sub_18DD4E950()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_18DD4E960()
{
  return MEMORY[0x1F4185630]();
}

uint64_t sub_18DD4E980()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_18DD4E990()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_18DD4E9A0()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_18DD4E9B0()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_18DD4E9C0()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_18DD4E9D0()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_18DD4E9E0()
{
  return MEMORY[0x1F4185700]();
}

uint64_t sub_18DD4E9F0()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_18DD4EA00()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_18DD4EA20()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_18DD4EA30()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_18DD4EA40()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_18DD4EA70()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_18DD4EA80()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_18DD4EA90()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_18DD4EAA0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_18DD4EAE0()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_18DD4EAF0()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_18DD4EB00()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_18DD4EB10()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_18DD4EB20()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_18DD4EB30()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_18DD4EB40()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_18DD4EB50()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_18DD4EB60()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_18DD4EB70()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_18DD4EB80()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_18DD4EB90()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_18DD4EBA0()
{
  return MEMORY[0x1F4185F40]();
}

uint64_t sub_18DD4EBB0()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_18DD4EBC0()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_18DD4EBD0()
{
  return MEMORY[0x1F40E6ED8]();
}

uint64_t sub_18DD4EBE0()
{
  return MEMORY[0x1F40E6EE8]();
}

uint64_t sub_18DD4EBF0()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_18DD4EC00()
{
  return MEMORY[0x1F4185FE8]();
}

uint64_t sub_18DD4EC10()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_18DD4EC20()
{
  return MEMORY[0x1F4186128]();
}

uint64_t sub_18DD4EC50()
{
  return MEMORY[0x1F4186318]();
}

uint64_t BKSProcessAssertionSetExpirationHandler()
{
  return MEMORY[0x1F410ABD0]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x1F40C94F8]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x1F40C9500]();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1F40C96C8](bytes, count);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C97B0](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1F40D7240](alloc, str, attributes);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7450](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7578](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D18]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1F40D7EB8](applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return MEMORY[0x1F40D8550](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t CFURLResponseCopyPeerAddress()
{
  return MEMORY[0x1F40D54D0]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1F40D89E8](uuid);
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

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1F40D8A20](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return (CFDictionaryRef)MEMORY[0x1F40D8A58](userNotification);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DA870](image);
}

CGImageRef CGImageCreateWithJPEGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA8A0](source, decode, shouldInterpolate, *(void *)&intent);
}

CGImageRef CGImageCreateWithMask(CGImageRef image, CGImageRef mask)
{
  return (CGImageRef)MEMORY[0x1F40DA8A8](image, mask);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA8B8](source, decode, shouldInterpolate, *(void *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x1F40DA9E8](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x1F40DAC50](url);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x1F40DAC90](document, pageNumber);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x1F40DAD80](page, *(void *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGAffineTransform *__cdecl CGPDFPageGetDrawingTransform(CGAffineTransform *__return_ptr retstr, CGPDFPageRef page, CGPDFBox box, CGRect rect, int rotate, BOOL preserveAspectRatio)
{
  return (CGAffineTransform *)MEMORY[0x1F40DAD98](retstr, page, *(void *)&box, *(void *)&rotate, preserveAspectRatio, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return MEMORY[0x1F40DADB8](page);
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB010](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGMutablePathRef CGPathCreateMutableCopy(CGPathRef path)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB070](path);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0B0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t CSArchitectureIs64Bit()
{
  return MEMORY[0x1F41155C0]();
}

uint64_t CSIsNull()
{
  return MEMORY[0x1F4115608]();
}

uint64_t CSSourceInfoGetFilename()
{
  return MEMORY[0x1F4115690]();
}

uint64_t CSSourceInfoGetLineNumber()
{
  return MEMORY[0x1F41156A0]();
}

uint64_t CSSymbolGetName()
{
  return MEMORY[0x1F41156D0]();
}

uint64_t CSSymbolGetRange()
{
  return MEMORY[0x1F41156E0]();
}

uint64_t CSSymbolOwnerGetName()
{
  return MEMORY[0x1F4115780]();
}

uint64_t CSSymbolOwnerGetSourceInfoWithAddress()
{
  return MEMORY[0x1F41157A8]();
}

uint64_t CSSymbolicatorCreateWithTaskFlagsAndNotification()
{
  return MEMORY[0x1F41158A8]();
}

uint64_t CSSymbolicatorGetArchitecture()
{
  return MEMORY[0x1F4115918]();
}

uint64_t CSSymbolicatorGetSymbolOwnerWithAddressAtTime()
{
  return MEMORY[0x1F4115980]();
}

uint64_t CSSymbolicatorGetSymbolWithAddressAtTime()
{
  return MEMORY[0x1F4115998]();
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x1F40DF370](*(void *)&uiType, language, size);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1F40DF390](name, matrix, size);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x1F40DF6E8](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  MEMORY[0x1F40DF700](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.height = v6;
  result.width = v5;
  return result;
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

uint64_t DeviceIdentityCreateHostSignatureWithCompletion()
{
  return MEMORY[0x1F4117538]();
}

uint64_t DeviceIdentityIsSupported()
{
  return MEMORY[0x1F4117540]();
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return MEMORY[0x1F4117548]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86C8](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1F40E9188](*(void *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MAECopyActivationRecordWithError()
{
  return MEMORY[0x1F412F538]();
}

uint64_t MAEPerformCollectionWithCompletion()
{
  return MEMORY[0x1F412F548]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1F417CDE8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1F417CE10]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x1F417CE30]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t OSAWriteLogForSubmission()
{
  return MEMORY[0x1F4116EA8]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t SBSGetScreenLockStatus()
{
  return MEMORY[0x1F415C380]();
}

uint64_t SBSRequestPasscodeUnlockUI()
{
  return MEMORY[0x1F415C408]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x1F40F6A18](allocator, protection, flags, error);
}

uint64_t SecAccessControlGetConstraints()
{
  return MEMORY[0x1F40F6A28]();
}

CFTypeID SecAccessControlGetTypeID(void)
{
  return MEMORY[0x1F40F6A40]();
}

uint64_t SecAccessControlSetConstraints()
{
  return MEMORY[0x1F40F6A58]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1F40F6AD0](certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1F40F6B10](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x1F40F6D68](*(void *)&status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x1F40F6E38](key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6E40](key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1F40F6E70](key);
}

uint64_t SecKeyCopySystemKey()
{
  return MEMORY[0x1F40F6E88]();
}

uint64_t SecKeyCreateAttestation()
{
  return MEMORY[0x1F40F6E90]();
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6EF8](key, algorithm, dataToSign, error);
}

OSStatus SecKeyGeneratePair(CFDictionaryRef parameters, SecKeyRef *publicKey, SecKeyRef *privateKey)
{
  return MEMORY[0x1F40F6F30](parameters, publicKey, privateKey);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

uint64_t SecTrustCopyInfo()
{
  return MEMORY[0x1F40F71B0]();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1F40F7210](trust, error);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x1F40F7220](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x1F40F7228](trust);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x1F40F7258](trust, anchorCertificates);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
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

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  double v1 = (const std::string_view::value_type *)MEMORY[0x1F417E3D8](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x1F417E400](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

uint64_t std::time_get<char,std::istreambuf_iterator<char>>::get()
{
  return MEMORY[0x1F417E420]();
}

uint64_t std::time_put<char,std::ostreambuf_iterator<char>>::put()
{
  return MEMORY[0x1F417E428]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4E0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::operator=(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4F8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x1F417E550](this, *(void *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1F417E5D0](this, __n, __c);
}

std::string::iterator std::string::insert(std::string *this, std::string::const_iterator __pos, std::string::value_type __c)
{
  return (std::string::iterator)MEMORY[0x1F417E5F8](this, __pos.__i_, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x1F417E628](this, __pos, __n1, __s, __n2);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::system_error *__cdecl std::system_error::system_error(std::system_error *this, std::error_code __ec, const std::string *__what_arg)
{
  return (std::system_error *)MEMORY[0x1F417E710](this, *(void *)&__ec.__val_, __ec.__cat_, __what_arg);
}

void std::system_error::~system_error(std::system_error *this)
{
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1F417E7A0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E868]();
}

{
  return MEMORY[0x1F417E870]();
}

{
  return MEMORY[0x1F417E878]();
}

{
  return MEMORY[0x1F417E880]();
}

{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8A0]();
}

{
  return MEMORY[0x1F417E8A8]();
}

{
  return MEMORY[0x1F417E8B0]();
}

{
  return MEMORY[0x1F417E8C0]();
}

{
  return MEMORY[0x1F417E8C8]();
}

{
  return MEMORY[0x1F417E8D0]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x1F417E908](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x1F417E918](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

void std::error_category::~error_category(std::error_category *this)
{
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x1F417E960](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x1F417E9E0]();
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__shared_mutex_base::lock_shared(std::__shared_mutex_base *this)
{
}

void std::__shared_mutex_base::unlock_shared(std::__shared_mutex_base *this)
{
}

void std::__shared_mutex_base::lock(std::__shared_mutex_base *this)
{
}

void std::__shared_mutex_base::unlock(std::__shared_mutex_base *this)
{
}

std::__shared_mutex_base *__cdecl std::__shared_mutex_base::__shared_mutex_base(std::__shared_mutex_base *this)
{
  return (std::__shared_mutex_base *)MEMORY[0x1F417EA80](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x1F417EAA8](retstr, __s);
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
  return MEMORY[0x1F417EAD8](a1);
}

BOOL std::__fs::filesystem::__remove(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return MEMORY[0x1F417EBB8](a1, __ec);
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
  return (std::chrono::steady_clock::time_point)MEMORY[0x1F417EC90]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::from_time_t(time_t __t)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x1F417EC98](__t);
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x1F417ECA0]();
}

time_t std::chrono::system_clock::to_time_t(const std::chrono::system_clock::time_point *__t)
{
  return MEMORY[0x1F417ECA8](__t);
}

const std::locale *std::locale::classic(void)
{
  return (const std::locale *)MEMORY[0x1F417ECD0]();
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x1F417ECE0](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x1F417ECE8](this);
}

void std::locale::~locale(std::locale *this)
{
}

const std::locale *__cdecl std::locale::operator=(std::locale *this, const std::locale *a2)
{
  return (const std::locale *)MEMORY[0x1F417ECF8](this, a2);
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

std::locale std::ios_base::imbue(std::ios_base *this, const std::locale *__loc)
{
  return (std::locale)MEMORY[0x1F417EDB8](this, __loc);
}

uint64_t *__cdecl std::ios_base::iword(std::ios_base *this, int __index)
{
  return (uint64_t *)MEMORY[0x1F417EDC0](this, *(void *)&__index);
}

int std::ios_base::xalloc(void)
{
  return MEMORY[0x1F417EDC8]();
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x1F417EE78](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE88](retstr, __val);
}

{
  return (std::string *)MEMORY[0x1F417EE98](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE90](retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x1F417EF08]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
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
  return MEMORY[0x1F417EF80](a1);
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
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1F40CA660](__count, __size);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
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
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

double drand48(void)
{
  MEMORY[0x1F40CBDE8]();
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1F40CC410](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1F40CC4F0](*(void *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC5B0](a1, a2);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x1F40CC670](*(void *)&a1.s_addr);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1F40CC678](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40CCD70]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x1F40F2878]();
}

uint64_t nw_activity_complete_with_reason_and_underlying_error()
{
  return MEMORY[0x1F40F2880]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1F40F2898]();
}

uint64_t nw_activity_is_activated()
{
  return MEMORY[0x1F40F28D0]();
}

uint64_t nw_activity_is_complete()
{
  return MEMORY[0x1F40F28D8]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x1F40F28E8]();
}

uint32_t nw_data_transfer_report_get_path_count(nw_data_transfer_report_t report)
{
  return MEMORY[0x1F40F2E00](report);
}

nw_interface_radio_type_t nw_data_transfer_report_get_path_radio_type(nw_data_transfer_report_t report, uint32_t path_index)
{
  return MEMORY[0x1F40F2E08](report, *(void *)&path_index);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1F40F2F08](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x1F40F2F38](endpoint);
}

nw_endpoint_t nw_establishment_report_copy_proxy_endpoint(nw_establishment_report_t report)
{
  return (nw_endpoint_t)MEMORY[0x1F40F2F78](report);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

uint64_t os_eligibility_force_domain_set_answers()
{
  return MEMORY[0x1F40CD2A8]();
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1F40CD2B0]();
}

uint64_t os_eligibility_reset_all_domains()
{
  return MEMORY[0x1F40CD2B8]();
}

uint64_t os_eligibility_set_input()
{
  return MEMORY[0x1F40CD2C0]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40CD5E8]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int res_9_getservers(res_9_state a1, res_9_sockaddr_union *a2, int a3)
{
  return MEMORY[0x1F4181E90](a1, a2, *(void *)&a3);
}

void res_9_ndestroy(res_9_state a1)
{
}

int res_9_ninit(res_9_state a1)
{
  return MEMORY[0x1F4181EA0](a1);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

int scanf(const char *a1, ...)
{
  return MEMORY[0x1F40CDEB0](a1);
}

int sched_yield(void)
{
  return MEMORY[0x1F40CDEC8]();
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F98](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1F4181FD0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_bind_text16(sqlite3_stmt *a1, int a2, const void *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FF0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_bind_text64(sqlite3_stmt *a1, int a2, const char *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *), unsigned __int8 encoding)
{
  return MEMORY[0x1F4181FF8](a1, *(void *)&a2, a3, a4, a5, encoding);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1F4182048](a1, *(void *)&ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1F4182050](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4182058](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_compileoption_get(int N)
{
  return (const char *)MEMORY[0x1F41820F0](*(void *)&N);
}

int sqlite3_db_config(sqlite3 *a1, int op, ...)
{
  return MEMORY[0x1F4182148](a1, *(void *)&op);
}

sqlite3_mutex *__cdecl sqlite3_db_mutex(sqlite3 *a1)
{
  return (sqlite3_mutex *)MEMORY[0x1F4182160](a1);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1F4182190](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1F41821A0](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1F41821C8](a1, *(void *)&onoff);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1F41821D0](a1, zDbName, *(void *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

int sqlite3_initialize(void)
{
  return MEMORY[0x1F4182208]();
}

const char *sqlite3_libversion(void)
{
  return (const char *)MEMORY[0x1F4182238]();
}

void sqlite3_mutex_enter(sqlite3_mutex *a1)
{
}

void sqlite3_mutex_leave(sqlite3_mutex *a1)
{
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return (sqlite3_stmt *)MEMORY[0x1F4182270](pDb, pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_prepare_v3(sqlite3 *db, const char *zSql, int nByte, unsigned int prepFlags, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182298](db, zSql, *(void *)&nByte, *(void *)&prepFlags, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

const char *sqlite3_sourceid(void)
{
  return (const char *)MEMORY[0x1F4182398]();
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1F41823A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int sqlite3_stmt_readonly(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41823C0](pStmt);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x1F4182490](db, zDb, *(void *)&eMode, pnLog, pnCkpt);
}

void *__cdecl sqlite3_wal_hook(sqlite3 *a1, int (__cdecl *a2)(void *, sqlite3 *, const char *, int), void *a3)
{
  return (void *)MEMORY[0x1F4182498](a1, a2, a3);
}

void srand48(uint64_t a1)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x1F4186788]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_taskGroup_addPending()
{
  return MEMORY[0x1F4188248]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1F40CE3B8](*(void *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x1F40CE4E8](*(void *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x1F40CE4F8](*(void *)&a1, *(void *)&a2, a3);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1F40CE590](a1);
}

int uname(utsname *a1)
{
  return MEMORY[0x1F40CE5C8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void uuid_generate_random(uuid_t out)
{
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x1F40CED30]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}