__n128 sub_21041C840()
{
  long long v0;
  long long v1;
  __n128 result;
  long long v3;

  v0 = *(_OWORD *)(MEMORY[0x263EF8988] + 48);
  xmmword_26AA45980 = *(_OWORD *)(MEMORY[0x263EF8988] + 32);
  unk_26AA45990 = v0;
  v1 = *(_OWORD *)(MEMORY[0x263EF8988] + 80);
  xmmword_26AA459A0 = *(_OWORD *)(MEMORY[0x263EF8988] + 64);
  unk_26AA459B0 = v1;
  result = *(__n128 *)MEMORY[0x263EF8988];
  v3 = *(_OWORD *)(MEMORY[0x263EF8988] + 16);
  xmmword_26AA45960 = *MEMORY[0x263EF8988];
  *(_OWORD *)algn_26AA45970 = v3;
  return result;
}

uint64_t sub_21041C86C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t sub_21041C874(uint64_t a1)
{
  return (2 * *(_DWORD *)(a1 + 32));
}

uint64_t sub_21041C880(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t sub_21041C888(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t sub_21041C890(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

BOOL sub_21041C898(uint64_t a1)
{
  return *(void *)(a1 + 64) == 0;
}

uint64_t sub_21041C8A8()
{
  return 1;
}

uint64_t sub_21041C8B0()
{
  return 1;
}

void sub_21041C8B8(void *a1)
{
  *a1 = &unk_26C2849E0;
  v2 = (void (**)(void, void, void, void, void))a1[1];
  if (v2)
  {
    v3 = (void (**)(void, void, void, void, void))a1[2];
    v4 = (void *)a1[1];
    if (v3 != v2)
    {
      v5 = v3 - 4;
      do
      {
        if (*v5) {
          (*v5)(0, v5, 0, 0, 0);
        }
        BOOL v6 = v5 == v2;
        v5 -= 4;
      }
      while (!v6);
      v4 = (void *)a1[1];
    }
    a1[2] = v2;
    operator delete(v4);
  }
  JUMPOUT(0x21056E760);
}

void *sub_21041C984(void *a1)
{
  *a1 = &unk_26C2849E0;
  v2 = (void (**)(void, void, void, void, void))a1[1];
  if (v2)
  {
    v3 = (void (**)(void, void, void, void, void))a1[2];
    v4 = (void *)a1[1];
    if (v3 != v2)
    {
      v5 = v3 - 4;
      do
      {
        if (*v5) {
          (*v5)(0, v5, 0, 0, 0);
        }
        BOOL v6 = v5 == v2;
        v5 -= 4;
      }
      while (!v6);
      v4 = (void *)a1[1];
    }
    a1[2] = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_21041CA30(uint64_t a1, unint64_t a2)
{
  v5 = *(unsigned char **)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  if (a2 <= (v4 - (uint64_t)v5) >> 3)
  {
    *(void *)(a1 + 8) = &v5[8 * a2];
  }
  else
  {
    BOOL v6 = *(unsigned char **)a1;
    uint64_t v7 = (uint64_t)&v5[-*(void *)a1];
    uint64_t v8 = v7 >> 3;
    unint64_t v9 = (v7 >> 3) + a2;
    if (v9 >> 61) {
      sub_21041CBAC();
    }
    uint64_t v10 = v4 - (void)v6;
    if (v10 >> 2 > v9) {
      unint64_t v9 = v10 >> 2;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      if (v11 >> 61) {
        sub_21041CBC4();
      }
      v12 = (char *)operator new(8 * v11);
    }
    else
    {
      v12 = 0;
    }
    v13 = &v12[8 * v8];
    v14 = &v13[8 * a2];
    if (v5 != v6)
    {
      unint64_t v15 = v5 - v6 - 8;
      if (v15 < 0x58) {
        goto LABEL_29;
      }
      if ((unint64_t)(v5 - &v12[v7]) < 0x20) {
        goto LABEL_29;
      }
      uint64_t v16 = (v15 >> 3) + 1;
      v17 = &v12[8 * v8 - 16];
      v18 = (long long *)(v5 - 16);
      uint64_t v19 = v16 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v20 = *v18;
        *((_OWORD *)v17 - 1) = *(v18 - 1);
        *(_OWORD *)v17 = v20;
        v17 -= 32;
        v18 -= 2;
        v19 -= 4;
      }
      while (v19);
      v13 -= 8 * (v16 & 0x3FFFFFFFFFFFFFFCLL);
      v5 -= 8 * (v16 & 0x3FFFFFFFFFFFFFFCLL);
      if (v16 != (v16 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_29:
        do
        {
          uint64_t v21 = *((void *)v5 - 1);
          v5 -= 8;
          *((void *)v13 - 1) = v21;
          v13 -= 8;
        }
        while (v5 != v6);
      }
    }
    *(void *)a1 = v13;
    *(void *)(a1 + 8) = v14;
    *(void *)(a1 + 16) = &v12[8 * v11];
    if (v6)
    {
      operator delete(v6);
    }
  }
}

void sub_21041CBAC()
{
}

void sub_21041CBC4()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_21041CBF8(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_21041CC54(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264130720, MEMORY[0x263F8C060]);
}

void sub_21041CC40(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_21041CC54(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_21041CC90(void *a1)
{
}

uint64_t sub_21041CCA4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 64))();
}

uint64_t sub_21041CCC8(uint64_t a1)
{
  return 2 * *(void *)(a1 + 32);
}

uint64_t sub_21041CCD4()
{
  return 1;
}

uint64_t sub_21041CCDC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 40))();
}

uint64_t sub_21041CD00(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

BOOL sub_21041CD08(uint64_t a1)
{
  return *(void *)(a1 + 40) == 0;
}

uint64_t sub_21041CD18()
{
  return 1;
}

uint64_t sub_21041CD20()
{
  return 0;
}

void sub_21041CD28(void *a1)
{
  *a1 = &unk_26C2849E0;
  v2 = (void (**)(void, void, void, void, void))a1[1];
  if (v2)
  {
    v3 = (void (**)(void, void, void, void, void))a1[2];
    uint64_t v4 = (void *)a1[1];
    if (v3 != v2)
    {
      v5 = v3 - 4;
      do
      {
        if (*v5) {
          (*v5)(0, v5, 0, 0, 0);
        }
        BOOL v6 = v5 == v2;
        v5 -= 4;
      }
      while (!v6);
      uint64_t v4 = (void *)a1[1];
    }
    a1[2] = v2;
    operator delete(v4);
  }
  JUMPOUT(0x21056E760);
}

void *sub_21041CDF4(void *a1)
{
  *a1 = &unk_26C2849E0;
  v2 = (void (**)(void, void, void, void, void))a1[1];
  if (v2)
  {
    v3 = (void (**)(void, void, void, void, void))a1[2];
    uint64_t v4 = (void *)a1[1];
    if (v3 != v2)
    {
      v5 = v3 - 4;
      do
      {
        if (*v5) {
          (*v5)(0, v5, 0, 0, 0);
        }
        BOOL v6 = v5 == v2;
        v5 -= 4;
      }
      while (!v6);
      uint64_t v4 = (void *)a1[1];
    }
    a1[2] = v2;
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_21041CEA0(uint64_t a1, char *a2)
{
  v3 = *(void **)(a1 + 48);
  if (!v3) {
    goto LABEL_12;
  }
  uint64_t v4 = (void *)(a1 + 48);
  do
  {
    unint64_t v5 = v3[4];
    BOOL v6 = v5 >= (unint64_t)a2;
    if (v5 >= (unint64_t)a2) {
      uint64_t v7 = v3;
    }
    else {
      uint64_t v7 = v3 + 1;
    }
    if (v6) {
      uint64_t v4 = v3;
    }
    v3 = (void *)*v7;
  }
  while (*v7);
  if (v4 != (void *)(a1 + 48) && v4[4] <= (unint64_t)a2)
  {
    uint64_t v10 = *((unsigned int *)v4 + 80);
    if (v10 == -1) {
      sub_21041CF6C();
    }
    v12 = &v11;
    return ((uint64_t (*)(char **, void *, uint64_t))*(&off_26C285330 + v10))(&v12, v4 + 5, a1);
  }
  else
  {
LABEL_12:
    v12 = a2;
    uint64_t v8 = *(void *)(a1 + 32);
    if (!v8) {
      sub_21041CFB8();
    }
    return (*(uint64_t (**)(uint64_t, char **, uint64_t))(*(void *)v8 + 48))(v8, &v12, a1);
  }
}

void sub_21041CF6C()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3A8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C1F8], (void (*)(void *))std::exception::~exception);
}

void sub_21041CFB8()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &unk_26C285318;
  __cxa_throw(exception, (struct type_info *)&unk_26C284840, (void (*)(void *))std::exception::~exception);
}

void sub_21041D008(std::exception *a1)
{
  std::exception::~exception(a1);
  JUMPOUT(0x21056E760);
}

uint64_t sub_21041D040(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_21041D048(uint64_t a1, uint64_t a2)
{
  return a2;
}

char *sub_21041D054(uint64_t a1, unint64_t a2)
{
  memset(v12, 0, sizeof(v12));
  unint64_t v5 = (uint64_t **)(a1 + 48);
  uint64_t v4 = *(uint64_t **)(a1 + 48);
  if (v4)
  {
    while (1)
    {
      while (1)
      {
        BOOL v6 = (uint64_t **)v4;
        unint64_t v7 = v4[4];
        if (v7 <= a2) {
          break;
        }
        uint64_t v4 = *v6;
        unint64_t v5 = v6;
        if (!*v6) {
          goto LABEL_8;
        }
      }
      if (v7 >= a2) {
        break;
      }
      uint64_t v4 = v6[1];
      if (!v4)
      {
        unint64_t v5 = v6 + 1;
        goto LABEL_8;
      }
    }
    uint64_t v8 = (char *)v6;
  }
  else
  {
    BOOL v6 = (uint64_t **)(a1 + 48);
LABEL_8:
    uint64_t v8 = (char *)operator new(0x148uLL);
    *((void *)v8 + 6) = 0;
    *((void *)v8 + 4) = a2;
    *((void *)v8 + 5) = &unk_26C2849E0;
    *((void *)v8 + 7) = 0;
    *((void *)v8 + 8) = 0;
    sub_21041D328((void *)v8 + 6, 0, 0, 0);
    *(_OWORD *)(v8 + 200) = *(_OWORD *)&v12[136];
    *(_OWORD *)(v8 + 216) = *(_OWORD *)&v12[152];
    *(_OWORD *)(v8 + 232) = *(_OWORD *)&v12[168];
    *(_OWORD *)(v8 + 248) = *(_OWORD *)&v12[184];
    *(_OWORD *)(v8 + 136) = *(_OWORD *)&v12[72];
    *(_OWORD *)(v8 + 152) = *(_OWORD *)&v12[88];
    *(_OWORD *)(v8 + 168) = *(_OWORD *)&v12[104];
    *(_OWORD *)(v8 + 184) = *(_OWORD *)&v12[120];
    *(_OWORD *)(v8 + 72) = *(_OWORD *)&v12[8];
    *(_OWORD *)(v8 + 88) = *(_OWORD *)&v12[24];
    *(_OWORD *)(v8 + 104) = *(_OWORD *)&v12[40];
    *(_OWORD *)(v8 + 120) = *(_OWORD *)&v12[56];
    *(_OWORD *)(v8 + 264) = *(_OWORD *)&v12[200];
    *((void *)v8 + 5) = &unk_26C284AE8;
    *((void *)v8 + 39) = 0;
    *(_OWORD *)(v8 + 280) = *(_OWORD *)&v12[216];
    *(_OWORD *)(v8 + 296) = *(_OWORD *)&v12[232];
    *((_DWORD *)v8 + 80) = 1;
    *(void *)uint64_t v8 = 0;
    *((void *)v8 + 1) = 0;
    *((void *)v8 + 2) = v6;
    unsigned char *v5 = (uint64_t *)v8;
    unint64_t v9 = (uint64_t *)v8;
    uint64_t v10 = **(void **)(a1 + 40);
    if (v10)
    {
      *(void *)(a1 + 40) = v10;
      unint64_t v9 = *v5;
    }
    sub_21041D454(*(uint64_t **)(a1 + 48), v9);
    ++*(void *)(a1 + 56);
  }
  if (*((_DWORD *)v8 + 80) != 1) {
    sub_21041CF6C();
  }
  return v8 + 40;
}

void sub_21041D300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  operator delete(v10);
  sub_21041C984(&a10);
  _Unwind_Resume(a1);
}

void *sub_21041D328(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    if (a4 >> 59) {
      sub_21041CBAC();
    }
    unint64_t v7 = result;
    result = operator new(32 * a4);
    uint64_t v8 = result;
    *unint64_t v7 = result;
    v7[1] = result;
    v7[2] = &result[4 * a4];
    if (a2 != a3)
    {
      unint64_t v9 = 0;
      do
      {
        uint64_t v10 = &v8[v9 / 8];
        *uint64_t v10 = 0;
        v10[1] = 0;
        char v11 = *(uint64_t (**)(uint64_t))(a2 + v9);
        if (v11) {
          result = (void *)v11(1);
        }
        v9 += 32;
      }
      while (a2 + v9 != a3);
      uint64_t v8 = (void *)((char *)v8 + v9);
    }
    v7[1] = v8;
  }
  return result;
}

void sub_21041D3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

uint64_t *sub_21041D454(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = a2[2];
      if (*(unsigned char *)(v2 + 24)) {
        break;
      }
      v3 = *(uint64_t **)(v2 + 16);
      uint64_t v4 = *v3;
      if (*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if (*(uint64_t **)v2 == a2)
          {
            unint64_t v9 = (uint64_t *)a2[2];
          }
          else
          {
            unint64_t v9 = *(uint64_t **)(v2 + 8);
            uint64_t v10 = *v9;
            *(void *)(v2 + 8) = *v9;
            if (v10)
            {
              *(void *)(v10 + 16) = v2;
              v3 = *(uint64_t **)(v2 + 16);
            }
            v9[2] = (uint64_t)v3;
            *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = v9;
            *unint64_t v9 = v2;
            *(void *)(v2 + 16) = v9;
            v3 = (uint64_t *)v9[2];
            uint64_t v2 = *v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v14 = *(void *)(v2 + 8);
          uint64_t *v3 = v14;
          if (v14) {
            *(void *)(v14 + 16) = v3;
          }
          *(void *)(v2 + 16) = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          *(void *)(v2 + 8) = v3;
          v3[2] = v2;
          return result;
        }
      }
      else if (!v4 || (int v6 = *(unsigned __int8 *)(v4 + 24), v5 = (unsigned char *)(v4 + 24), v6))
      {
        if (*(uint64_t **)v2 == a2)
        {
          uint64_t v11 = a2[1];
          *(void *)uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            v3 = *(uint64_t **)(v2 + 16);
          }
          a2[2] = (uint64_t)v3;
          *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = a2;
          a2[1] = v2;
          *(void *)(v2 + 16) = a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        v12 = (uint64_t *)v3[1];
        uint64_t v13 = *v12;
        v3[1] = *v12;
        if (v13) {
          *(void *)(v13 + 16) = v3;
        }
        v12[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v12;
        uint64_t *v12 = (uint64_t)v3;
        v3[2] = (uint64_t)v12;
        return result;
      }
      *(unsigned char *)(v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void ***sub_21041D5F4(void ***a1)
{
  if (!*((unsigned char *)a1 + 8))
  {
    uint64_t v2 = *a1;
    v3 = (void (**)(void, void, void, void, void))**a1;
    if (v3)
    {
      uint64_t v4 = (void (**)(void, void, void, void, void))v2[1];
      unint64_t v5 = **a1;
      if (v4 != v3)
      {
        int v6 = v4 - 4;
        do
        {
          if (*v6) {
            (*v6)(0, v6, 0, 0, 0);
          }
          BOOL v7 = v6 == v3;
          v6 -= 4;
        }
        while (!v7);
        unint64_t v5 = **a1;
      }
      v2[1] = v3;
      operator delete(v5);
    }
  }
  return a1;
}

char *sub_21041D694(uint64_t a1, unint64_t a2)
{
  memset(v12, 0, sizeof(v12));
  unint64_t v5 = (uint64_t **)(a1 + 48);
  uint64_t v4 = *(uint64_t **)(a1 + 48);
  if (!v4)
  {
    int v6 = (uint64_t **)(a1 + 48);
    goto LABEL_8;
  }
  do
  {
    while (1)
    {
      int v6 = (uint64_t **)v4;
      unint64_t v7 = v4[4];
      if (v7 <= a2) {
        break;
      }
      uint64_t v4 = *v6;
      unint64_t v5 = v6;
      if (!*v6) {
        goto LABEL_8;
      }
    }
    if (v7 >= a2)
    {
      int v8 = (char *)v6;
      if (!*((_DWORD *)v6 + 80)) {
        return v8 + 40;
      }
LABEL_13:
      sub_21041CF6C();
    }
    uint64_t v4 = v6[1];
  }
  while (v4);
  unint64_t v5 = v6 + 1;
LABEL_8:
  int v8 = (char *)operator new(0x148uLL);
  *((void *)v8 + 6) = 0;
  *((void *)v8 + 4) = a2;
  *((void *)v8 + 5) = &unk_26C2849E0;
  *((void *)v8 + 7) = 0;
  *((void *)v8 + 8) = 0;
  sub_21041D328((void *)v8 + 6, 0, 0, 0);
  *(_OWORD *)(v8 + 88) = 0u;
  *(_OWORD *)(v8 + 104) = 0u;
  *(_OWORD *)(v8 + 120) = 0u;
  *(_OWORD *)(v8 + 136) = 0u;
  *((void *)v8 + 5) = &unk_26C284A40;
  *(_OWORD *)(v8 + 72) = *(_OWORD *)&v12[8];
  *((_DWORD *)v8 + 80) = 0;
  *(void *)int v8 = 0;
  *((void *)v8 + 1) = 0;
  *((void *)v8 + 2) = v6;
  void *v5 = (uint64_t *)v8;
  uint64_t v9 = **(void **)(a1 + 40);
  uint64_t v10 = (uint64_t *)v8;
  if (v9)
  {
    *(void *)(a1 + 40) = v9;
    uint64_t v10 = *v5;
  }
  sub_21041D454(*(uint64_t **)(a1 + 48), v10);
  ++*(void *)(a1 + 56);
  if (*((_DWORD *)v8 + 80)) {
    goto LABEL_13;
  }
  return v8 + 40;
}

void sub_21041D8A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  operator delete(v9);
  sub_21041CDF4(&a9);
  _Unwind_Resume(a1);
}

void sub_21041D8D0(uint64_t a1)
{
  *(void *)a1 = &unk_26C2849A8;
  sub_21041D99C(*(void **)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 == a1 + 8)
  {
    (*(void (**)(uint64_t))(*(void *)(a1 + 8) + 32))(a1 + 8);
  }
  else if (v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 40))(v2);
  }
  JUMPOUT(0x21056E760);
}

void sub_21041D99C(void *a1)
{
  if (a1)
  {
    sub_21041D99C(*a1);
    sub_21041D99C(a1[1]);
    uint64_t v2 = *((unsigned int *)a1 + 80);
    if (v2 != -1) {
      ((void (*)(char *, void *))*(&off_26C285340 + v2))(&v3, a1 + 5);
    }
    operator delete(a1);
  }
}

void sub_21041DA08(uint64_t a1, void *a2)
{
  *a2 = &unk_26C2849E0;
  uint64_t v2 = (void (**)(void, void, void, void, void))a2[1];
  if (v2)
  {
    uint64_t v4 = (void (**)(void, void, void, void, void))a2[2];
    unint64_t v5 = (void *)a2[1];
    if (v4 != v2)
    {
      int v6 = v4 - 4;
      do
      {
        if (*v6) {
          (*v6)(0, v6, 0, 0, 0);
        }
        BOOL v7 = v6 == v2;
        v6 -= 4;
      }
      while (!v7);
      unint64_t v5 = (void *)a2[1];
    }
    a2[2] = v2;
    operator delete(v5);
  }
}

void sub_21041DACC(uint64_t a1, void *a2)
{
  *a2 = &unk_26C2849E0;
  uint64_t v2 = (void (**)(void, void, void, void, void))a2[1];
  if (v2)
  {
    uint64_t v4 = (void (**)(void, void, void, void, void))a2[2];
    unint64_t v5 = (void *)a2[1];
    if (v4 != v2)
    {
      int v6 = v4 - 4;
      do
      {
        if (*v6) {
          (*v6)(0, v6, 0, 0, 0);
        }
        BOOL v7 = v6 == v2;
        v6 -= 4;
      }
      while (!v7);
      unint64_t v5 = (void *)a2[1];
    }
    a2[2] = v2;
    operator delete(v5);
  }
}

uint64_t sub_21041DB90(uint64_t a1)
{
  *(void *)a1 = &unk_26C2849A8;
  sub_21041D99C(*(void **)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 == a1 + 8)
  {
    (*(void (**)(uint64_t))(*(void *)(a1 + 8) + 32))(a1 + 8);
  }
  else if (v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 40))(v2);
  }
  return a1;
}

void HVF::PartTransform::~PartTransform(HVF::PartTransform *this)
{
  uint64_t v2 = (char *)this + 160;
  char v3 = (char *)*((void *)this + 23);
  if (v3 == v2)
  {
    (*(void (**)(char *))(*(void *)v2 + 32))(v2);
  }
  else if (v3)
  {
    (*(void (**)(char *))(*(void *)v3 + 40))(v3);
  }
  uint64_t v4 = (HVF::PartTransform *)*((void *)this + 19);
  if (v4 == (HVF::PartTransform *)((char *)this + 128))
  {
    (*(void (**)(char *))(*((void *)this + 16) + 32))((char *)this + 128);
  }
  else if (v4)
  {
    (*(void (**)(HVF::PartTransform *))(*(void *)v4 + 40))(v4);
  }
  unint64_t v5 = (char *)this + 64;
  int v6 = (HVF::PartTransform *)*((void *)this + 15);
  if (v6 == (HVF::PartTransform *)((char *)this + 96))
  {
    (*(void (**)(char *))(*((void *)this + 12) + 32))((char *)this + 96);
  }
  else if (v6)
  {
    (*(void (**)(HVF::PartTransform *))(*(void *)v6 + 40))(v6);
  }
  BOOL v7 = (char *)*((void *)this + 11);
  if (v7 == v5)
  {
    (*(void (**)(char *))(*(void *)v5 + 32))((char *)this + 64);
  }
  else if (v7)
  {
    (*(void (**)(char *))(*(void *)v7 + 40))(v7);
  }
  int v8 = (HVF::PartTransform *)*((void *)this + 7);
  if (v8 == (HVF::PartTransform *)((char *)this + 32))
  {
    (*(void (**)(char *))(*((void *)this + 4) + 32))((char *)this + 32);
  }
  else if (v8)
  {
    (*(void (**)(HVF::PartTransform *))(*(void *)v8 + 40))(v8);
  }
  uint64_t v9 = (HVF::PartTransform *)*((void *)this + 3);
  if (v9 == this)
  {
    (*(void (**)(HVF::PartTransform *))(*(void *)this + 32))(this);
  }
  else if (v9)
  {
    (*(void (**)(HVF::PartTransform *))(*(void *)v9 + 40))(v9);
  }
}

HVF::PartTransformRenderer *HVF::PartTransformRenderer::PartTransformRenderer(HVF::PartTransformRenderer *this, unint64_t a2, void *a3, char a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *(void *)this = &unk_26C284E48;
  *((void *)this + 1) = this;
  *((void *)this + 3) = this;
  *((void *)this + 4) = &unk_26C284EA0;
  *((void *)this + 5) = this;
  *((void *)this + 7) = (char *)this + 32;
  *((void *)this + 8) = &unk_26C284EF8;
  *((void *)this + 9) = this;
  *((void *)this + 11) = (char *)this + 64;
  *((void *)this + 12) = &unk_26C284F50;
  *((void *)this + 13) = this;
  *((void *)this + 15) = (char *)this + 96;
  *((void *)this + 16) = &unk_26C284FA8;
  *((void *)this + 17) = this;
  *((void *)this + 19) = (char *)this + 128;
  *((void *)this + 20) = &unk_26C285000;
  *((void *)this + 21) = this;
  *((void *)this + 23) = (char *)this + 160;
  BOOL v7 = (void *)a3[3];
  if (!v7) {
    goto LABEL_4;
  }
  if (v7 != a3)
  {
    BOOL v7 = (void *)(*(uint64_t (**)(void *))(*v7 + 16))(v7);
LABEL_4:
    uint64_t v10 = v7;
    goto LABEL_6;
  }
  uint64_t v10 = v9;
  (*(void (**)(void *, void *))(*a3 + 24))(a3, v9);
  BOOL v7 = v10;
LABEL_6:
  *((void *)this + 24) = &unk_26C2849A8;
  if (!v7)
  {
LABEL_9:
    *((void *)this + 28) = v7;
    goto LABEL_11;
  }
  if (v7 != v9)
  {
    BOOL v7 = (void *)(*(uint64_t (**)(void *))(*v7 + 16))(v7);
    goto LABEL_9;
  }
  *((void *)this + 28) = (char *)this + 200;
  (*(void (**)(void *))(v9[0] + 24))(v9);
LABEL_11:
  *((void *)this + 30) = 0;
  *((void *)this + 31) = 0;
  *((void *)this + 29) = (char *)this + 240;
  if (v10 == v9)
  {
    (*(void (**)(void *))(v9[0] + 32))(v9);
  }
  else if (v10)
  {
    (*(void (**)(void))(*v10 + 40))();
  }
  *((unsigned char *)this + 256) = a4;
  *((void *)this + 34) = a2;
  *(_OWORD *)((char *)this + 280) = 0u;
  *(_OWORD *)((char *)this + 296) = 0u;
  *(_OWORD *)((char *)this + 312) = 0u;
  *(_OWORD *)((char *)this + 328) = 0u;
  *(_OWORD *)((char *)this + 344) = 0u;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 392) = 0u;
  *(_OWORD *)((char *)this + 408) = 0u;
  HVF::PartTransformRenderer::setRenderPart(this, a2);
  return this;
}

void sub_21041E1AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_21041E874((uint64_t *)va);
  HVF::PartTransform::~PartTransform(v2);
  _Unwind_Resume(a1);
}

void HVF::PartTransformRenderer::setRenderPart(HVF::PartTransformRenderer *this, unint64_t a2)
{
  char v3 = (char *)this + 240;
  uint64_t v4 = (void *)*((void *)this + 30);
  *((void *)this + 34) = a2;
  if (!v4) {
    goto LABEL_12;
  }
  unint64_t v5 = (char *)this + 240;
  do
  {
    unint64_t v6 = v4[4];
    BOOL v7 = v6 >= a2;
    if (v6 >= a2) {
      int v8 = v4;
    }
    else {
      int v8 = v4 + 1;
    }
    if (v7) {
      unint64_t v5 = (char *)v4;
    }
    uint64_t v4 = (void *)*v8;
  }
  while (*v8);
  if (v5 != v3 && *((void *)v5 + 4) <= a2)
  {
    uint64_t v19 = *((unsigned int *)v5 + 80);
    if (v19 == -1) {
      sub_21041CF6C();
    }
    *(void *)&long long v79 = (char *)&v78 + 7;
    uint64_t v10 = ((uint64_t (*)(long long *, char *))*(&off_26C285330 + v19))(&v79, v5 + 40);
  }
  else
  {
LABEL_12:
    *(void *)&long long v79 = a2;
    uint64_t v9 = *((void *)this + 28);
    if (!v9) {
      sub_21041CFB8();
    }
    uint64_t v10 = (*(uint64_t (**)(uint64_t, long long *, char *))(*(void *)v9 + 48))(v9, &v79, v3 - 48);
  }
  *((void *)this + 33) = v10;
  if (v10)
  {
    unint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 72))(v10);
    v12 = (unsigned char *)*((void *)this + 47);
    if (v11 <= (uint64_t)(*((void *)this + 49) - (void)v12) >> 3) {
      goto LABEL_29;
    }
    if (v11 >> 61) {
      sub_21041CBAC();
    }
    uint64_t v13 = (unsigned char *)*((void *)this + 48);
    uint64_t v14 = 8 * v11;
    unint64_t v15 = (char *)operator new(8 * v11);
    uint64_t v16 = v13 - v12;
    v17 = &v15[(v13 - v12) & 0xFFFFFFFFFFFFFFF8];
    v18 = v17;
    if (v13 != v12)
    {
      if ((unint64_t)(v16 - 8) < 0x58)
      {
        v18 = &v15[(v13 - v12) & 0xFFFFFFFFFFFFFFF8];
        do
        {
LABEL_26:
          uint64_t v26 = *((void *)v13 - 1);
          v13 -= 8;
          *((void *)v18 - 1) = v26;
          v18 -= 8;
        }
        while (v13 != v12);
        goto LABEL_27;
      }
      v18 = &v15[(v13 - v12) & 0xFFFFFFFFFFFFFFF8];
      if ((unint64_t)(&v13[-(v16 & 0xFFFFFFFFFFFFFFF8)] - v15) < 0x20) {
        goto LABEL_26;
      }
      uint64_t v20 = v16 >> 3;
      unint64_t v21 = ((unint64_t)(v16 - 8) >> 3) + 1;
      v22 = &v15[8 * v20 - 16];
      v23 = (long long *)(v13 - 16);
      uint64_t v24 = v21 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v25 = *v23;
        *((_OWORD *)v22 - 1) = *(v23 - 1);
        *(_OWORD *)v22 = v25;
        v22 -= 32;
        v23 -= 2;
        v24 -= 4;
      }
      while (v24);
      v18 = &v17[-8 * (v21 & 0x3FFFFFFFFFFFFFFCLL)];
      v13 -= 8 * (v21 & 0x3FFFFFFFFFFFFFFCLL);
      if (v21 != (v21 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_26;
      }
    }
LABEL_27:
    *((void *)this + 47) = v18;
    *((void *)this + 48) = v17;
    *((void *)this + 49) = &v15[v14];
    if (v12) {
      operator delete(v12);
    }
LABEL_29:
    if (*((unsigned char *)this + 256))
    {
      unint64_t v27 = (*(uint64_t (**)(void))(**((void **)this + 33) + 48))(*((void *)this + 33));
      uint64_t v28 = *((void *)this + 41);
      unint64_t v29 = (*((void *)this + 42) - v28) >> 3;
      if (v27 <= v29)
      {
        if (v27 < v29) {
          *((void *)this + 42) = v28 + 8 * v27;
        }
      }
      else
      {
        sub_21041CA30((uint64_t)this + 328, v27 - v29);
      }
      unint64_t v30 = (*(uint64_t (**)(void))(**((void **)this + 33) + 56))(*((void *)this + 33));
      v32 = (unsigned char *)*((void *)this + 44);
      v31 = (char *)*((void *)this + 45);
      unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * ((v31 - v32) >> 5);
      unint64_t v34 = v30 - v33;
      if (v30 > v33)
      {
        uint64_t v35 = *((void *)this + 46);
        if (0xAAAAAAAAAAAAAAABLL * ((v35 - (uint64_t)v31) >> 5) < v34)
        {
          if (v30 > 0x2AAAAAAAAAAAAAALL) {
            sub_21041CBAC();
          }
          unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * ((v35 - (uint64_t)v32) >> 5);
          uint64_t v37 = 2 * v36;
          if (2 * v36 <= v30) {
            uint64_t v37 = v30;
          }
          if (v36 >= 0x155555555555555) {
            unint64_t v38 = 0x2AAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v38 = v37;
          }
          if (v38 > 0x2AAAAAAAAAAAAAALL) {
            sub_21041CBC4();
          }
          uint64_t v39 = 96 * v38;
          v40 = (char *)operator new(96 * v38);
          v41 = &v40[32 * ((v31 - v32) >> 5)];
          v42 = &v40[v39];
          bzero(v41, 96 * ((96 * v34 - 96) / 0x60) + 96);
          v43 = &v41[96 * ((96 * v34 - 96) / 0x60) + 96];
          if (v31 != v32)
          {
            do
            {
              long long v44 = *((_OWORD *)v31 - 5);
              *((_OWORD *)v41 - 6) = *((_OWORD *)v31 - 6);
              *((_OWORD *)v41 - 5) = v44;
              long long v45 = *((_OWORD *)v31 - 4);
              long long v46 = *((_OWORD *)v31 - 3);
              long long v47 = *((_OWORD *)v31 - 1);
              *((_OWORD *)v41 - 2) = *((_OWORD *)v31 - 2);
              *((_OWORD *)v41 - 1) = v47;
              *((_OWORD *)v41 - 4) = v45;
              *((_OWORD *)v41 - 3) = v46;
              v41 -= 96;
              v31 -= 96;
            }
            while (v31 != v32);
            v31 = (char *)*((void *)this + 44);
          }
          *((void *)this + 44) = v41;
          *((void *)this + 45) = v43;
          *((void *)this + 46) = v42;
          if (v31) {
            operator delete(v31);
          }
          goto LABEL_52;
        }
        bzero(*((void **)this + 45), 96 * ((96 * v34 - 96) / 0x60) + 96);
        v48 = &v31[96 * ((96 * v34 - 96) / 0x60) + 96];
        goto LABEL_51;
      }
      if (v30 < v33)
      {
        v48 = &v32[96 * v30];
LABEL_51:
        *((void *)this + 45) = v48;
      }
    }
LABEL_52:
    unint64_t v49 = (*(uint64_t (**)(void))(**((void **)this + 33) + 48))(*((void *)this + 33));
    v50 = (double *)*((void *)this + 35);
    v51 = (double *)*((void *)this + 36);
    unint64_t v52 = v51 - v50;
    if (v49 <= v52)
    {
      if (v49 < v52)
      {
        v51 = &v50[v49];
        *((void *)this + 36) = v51;
      }
    }
    else
    {
      sub_21041CA30((uint64_t)this + 280, v49 - v52);
      v50 = (double *)*((void *)this + 35);
      v51 = (double *)*((void *)this + 36);
    }
    vDSP_vclrD(v50, 1, v51 - v50);
    *((void *)this + 39) = *((void *)this + 38);
    unint64_t v53 = (*(uint64_t (**)(void))(**((void **)this + 33) + 56))(*((void *)this + 33));
    unint64_t v54 = v53;
    long long vars0 = xmmword_26AA45980;
    long long v82 = unk_26AA45990;
    long long v83 = xmmword_26AA459A0;
    float64x2_t v84 = qword_26AA459B0;
    long long v79 = xmmword_26AA45960;
    long long v80 = *(_OWORD *)algn_26AA45970;
    v56 = (char *)*((void *)this + 38);
    v55 = (char *)*((void *)this + 39);
    unint64_t v57 = 0xAAAAAAAAAAAAAAABLL * ((v55 - v56) >> 5);
    unint64_t v58 = v53 - v57;
    if (v53 <= v57)
    {
      if (v53 < v57) {
        *((void *)this + 39) = &v56[96 * v53];
      }
    }
    else
    {
      uint64_t v59 = *((void *)this + 40);
      if (0xAAAAAAAAAAAAAAABLL * ((v59 - (uint64_t)v55) >> 5) >= v58)
      {
        v72 = &v55[96 * v58];
        uint64_t v73 = -32 * ((v55 - v56) >> 5) + 96 * v53;
        do
        {
          long long v74 = *(_OWORD *)algn_26AA45970;
          *(_OWORD *)v55 = xmmword_26AA45960;
          *((_OWORD *)v55 + 1) = v74;
          long long v75 = xmmword_26AA45980;
          long long v76 = unk_26AA45990;
          float64x2_t v77 = qword_26AA459B0;
          *((_OWORD *)v55 + 4) = xmmword_26AA459A0;
          *((float64x2_t *)v55 + 5) = v77;
          *((_OWORD *)v55 + 2) = v75;
          *((_OWORD *)v55 + 3) = v76;
          v55 += 96;
          v73 -= 96;
        }
        while (v73);
        *((void *)this + 39) = v72;
      }
      else
      {
        if (v53 > 0x2AAAAAAAAAAAAAALL) {
          sub_21041CBAC();
        }
        unint64_t v60 = 0xAAAAAAAAAAAAAAABLL * ((v59 - (uint64_t)v56) >> 5);
        unint64_t v61 = 0x5555555555555556 * ((v59 - (uint64_t)v56) >> 5);
        if (v61 <= v53) {
          unint64_t v61 = v53;
        }
        if (v60 >= 0x155555555555555) {
          unint64_t v62 = 0x2AAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v62 = v61;
        }
        if (v62 > 0x2AAAAAAAAAAAAAALL) {
          sub_21041CBC4();
        }
        v63 = (char *)operator new(96 * v62);
        v64 = (long long *)&v63[32 * ((v55 - v56) >> 5)];
        uint64_t v65 = 96 * v54 - 32 * ((v55 - v56) >> 5);
        v66 = v64;
        do
        {
          v66[2] = vars0;
          v66[3] = v82;
          v66[4] = v83;
          v66[5] = (__int128)v84;
          long long v67 = v80;
          long long *v66 = v79;
          v66[1] = v67;
          v66 += 6;
          v65 -= 96;
        }
        while (v65);
        if (v55 != v56)
        {
          do
          {
            long long v68 = *((_OWORD *)v55 - 5);
            *(v64 - 6) = *((_OWORD *)v55 - 6);
            *(v64 - 5) = v68;
            long long v69 = *((_OWORD *)v55 - 4);
            long long v70 = *((_OWORD *)v55 - 3);
            long long v71 = *((_OWORD *)v55 - 1);
            *(v64 - 2) = *((_OWORD *)v55 - 2);
            *(v64 - 1) = v71;
            *(v64 - 4) = v69;
            *(v64 - 3) = v70;
            v64 -= 6;
            v55 -= 96;
          }
          while (v55 != v56);
          v55 = (char *)*((void *)this + 38);
        }
        *((void *)this + 38) = v64;
        *((void *)this + 39) = &v63[96 * v54];
        *((void *)this + 40) = &v63[96 * v62];
        if (v55) {
          operator delete(v55);
        }
      }
    }
  }
}

void *sub_21041E874(void *a1)
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

uint64_t sub_21041E8F8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 72);
  if (v2)
  {
    *(void *)(a1 + 80) = v2;
    operator delete(v2);
  }
  char v3 = *(void **)(a1 + 48);
  if (v3)
  {
    *(void *)(a1 + 56) = v3;
    operator delete(v3);
  }
  uint64_t v4 = *(void **)(a1 + 24);
  if (v4)
  {
    *(void *)(a1 + 32) = v4;
    operator delete(v4);
  }
  unint64_t v5 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v5;
    operator delete(v5);
  }
  return a1;
}

void *sub_21041E95C()
{
  return &unk_26C284908;
}

uint64_t sub_21041E968(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_5"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_5" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_5")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_5" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_21041E9C0@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v4 = *a2;
  *a3 = &unk_26C2852C0;
  a3[1] = v3;
  a3[2] = v4;
  a3[3] = a3;
  a3[4] = &unk_26C285268;
  a3[5] = v3;
  a3[6] = v4;
  a3[7] = a3 + 4;
  return result;
}

void *sub_21041EA10()
{
  return &unk_26C284978;
}

uint64_t sub_21041EA1C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlRK"
                     "NS_13PartTransformEE_"
    || ((v3 & (unint64_t)"ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$"
                                "_5clEmEUlRKNS_13PartTransformEE_" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlRKNS_13PartTransformEE_")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlRKNS_13PartTransformEE_" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void sub_21041EA74()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  memset(v0, 0, sizeof(v0));
  HVF::PartTransform::~PartTransform((HVF::PartTransform *)v0);
}

__n128 sub_21041EAE8(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C285268;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 sub_21041EB10(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C285268;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void sub_21041EB5C()
{
}

void *sub_21041EB74()
{
  return &unk_26C284988;
}

uint64_t sub_21041EB80(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlvE_"
    || ((v3 & (unint64_t)"ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlvE_" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlvE_")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlvE_" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

double sub_21041EBD8@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

__n128 sub_21041EC00(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C2852C0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 sub_21041EC28(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C2852C0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void sub_21041EC74()
{
}

uint64_t sub_21041EC94(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C285000;
  a2[1] = v2;
  return result;
}

void *sub_21041ECB8(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26C285000;
  result[1] = v3;
  return result;
}

void sub_21041ED00()
{
}

void *sub_21041ED18()
{
  return &unk_26C2848F8;
}

uint64_t sub_21041ED24(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_4"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_4" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_4")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_4" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_21041ED7C@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v4 = *a2;
  *a3 = &unk_26C285210;
  a3[1] = v3;
  a3[2] = v4;
  a3[3] = a3;
  a3[4] = &unk_26C2851B8;
  a3[5] = v3;
  a3[6] = v4;
  a3[7] = a3 + 4;
  return result;
}

void *sub_21041EDCC()
{
  return &unk_26C284958;
}

uint64_t sub_21041EDD8(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlRKdE_"
    || ((v3 & (unint64_t)"ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlRKdE_" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlRKdE_")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlRKdE_" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

double sub_21041EE30(uint64_t a1, double *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  unint64_t v3 = *(void *)(a1 + 16);
  if ((*(uint64_t (**)(void))(**(void **)(v4 + 264) + 40))(*(void *)(v4 + 264)) > v3)
  {
    uint64_t v6 = *(void *)(v4 + 280);
    if (v3 < (*(void *)(v4 + 288) - v6) >> 3)
    {
      double result = *a2;
      *(double *)(v6 + 8 * v3) = *a2;
    }
  }
  return result;
}

__n128 sub_21041EEAC(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C2851B8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 sub_21041EED4(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C2851B8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void sub_21041EF20()
{
}

void *sub_21041EF38()
{
  return &unk_26C284968;
}

uint64_t sub_21041EF44(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlvE_"
    || ((v3 & (unint64_t)"ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlvE_" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlvE_")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlvE_" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

double sub_21041EF9C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  unint64_t v1 = *(void *)(a1 + 16);
  unint64_t v3 = (*(uint64_t (**)(void))(**(void **)(v2 + 264) + 40))(*(void *)(v2 + 264));
  double result = 0.0;
  if (v3 > v1)
  {
    uint64_t v5 = *(void *)(v2 + 280);
    if (v1 < (*(void *)(v2 + 288) - v5) >> 3) {
      return *(double *)(v5 + 8 * v1);
    }
  }
  return result;
}

__n128 sub_21041F00C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C285210;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 sub_21041F034(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C285210;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void sub_21041F080()
{
}

uint64_t sub_21041F0A0(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C284FA8;
  a2[1] = v2;
  return result;
}

void *sub_21041F0C4(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26C284FA8;
  result[1] = v3;
  return result;
}

void sub_21041F10C()
{
}

void *sub_21041F124()
{
  return &unk_26C2848E8;
}

uint64_t sub_21041F130(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_3"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_3" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_3")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_3" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void sub_21041F188(uint64_t a1, double *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(float64x2_t **)(v4 + 304);
  if (*(float64x2_t **)(v4 + 312) == v5)
  {
    __break(1u);
  }
  else
  {
    v2.f64[0] = v5[1].f64[0];
    v3.f64[0] = v5[3].f64[0];
    if (*a2 == 0.0)
    {
      float64x2_t v6 = (float64x2_t)xmmword_26AA45960;
      float64x2_t v7 = *(float64x2_t *)algn_26AA45970;
      float64x2_t v9 = (float64x2_t)xmmword_26AA459A0;
      float64x2_t v8 = qword_26AA459B0;
      float64x2_t v10 = (float64x2_t)xmmword_26AA459A0;
      float64x2_t v11 = qword_26AA459B0;
      float64x2_t v12 = (float64x2_t)xmmword_26AA45980;
      float64x2_t v13 = (float64x2_t)unk_26AA45990;
      float64x2_t v14 = (float64x2_t)xmmword_26AA45980;
      float64x2_t v15 = (float64x2_t)unk_26AA45990;
      float64x2_t v16 = (float64x2_t)xmmword_26AA45960;
      float64x2_t v17 = *(float64x2_t *)algn_26AA45970;
    }
    else
    {
      float64x2_t v29 = v3;
      float64x2_t v30 = v2;
      __double2 v18 = __sincos_stret(*a2 * 0.5);
      v15.f64[0] = v18.__cosval;
      v11.f64[0] = v18.__sinval;
      double v19 = vmuld_n_f64(0.0, 0.0);
      double v20 = vmuld_lane_f64(0.0, (float64x2_t)0, 1);
      float64_t v21 = v11.f64[0] * v11.f64[0];
      float64_t v22 = v15.f64[0] * v15.f64[0];
      v16.f64[0] = v15.f64[0] * v15.f64[0] - (v11.f64[0] * v11.f64[0] + v20) + v19;
      v17.f64[0] = v20;
      v14.f64[0] = v17.f64[0] + v11.f64[0] * v15.f64[0] + v17.f64[0] + v11.f64[0] * v15.f64[0];
      double v23 = vmuld_lane_f64(v18.__cosval, (float64x2_t)0, 1);
      v10.f64[0] = v11.f64[0] * 0.0 - v23 + v11.f64[0] * 0.0 - v23;
      float64_t v24 = v17.f64[0] - v11.f64[0] * v15.f64[0] + v17.f64[0] - v11.f64[0] * v15.f64[0];
      double v25 = v20 + v15.f64[0] * v15.f64[0] - (v19 + v11.f64[0] * v11.f64[0]);
      v11.f64[0] = vmuld_lane_f64(v18.__sinval, (float64x2_t)0, 1);
      v15.f64[0] = v18.__cosval * 0.0;
      float64_t v26 = v11.f64[0] + v15.f64[0] + v11.f64[0] + v15.f64[0];
      v17.f64[0] = v18.__sinval * 0.0 + v23;
      float64x2_t v3 = v29;
      float64x2_t v2 = v30;
      v17.f64[0] = v17.f64[0] + v17.f64[0];
      v15.f64[0] = v11.f64[0] - v15.f64[0] + v11.f64[0] - v15.f64[0];
      v11.f64[0] = v21 + v22 - (v20 + v19);
      v16.f64[1] = v24;
      v14.f64[1] = v25;
      v10.f64[1] = v26;
      float64x2_t v6 = (float64x2_t)xmmword_26AA45960;
      float64x2_t v7 = *(float64x2_t *)algn_26AA45970;
      float64x2_t v12 = (float64x2_t)xmmword_26AA45980;
      float64x2_t v13 = (float64x2_t)unk_26AA45990;
      float64x2_t v9 = (float64x2_t)xmmword_26AA459A0;
      float64x2_t v8 = qword_26AA459B0;
    }
    float64x2_t v27 = vaddq_f64(v7, v2);
    float64x2_t v28 = vaddq_f64(v13, v3);
    float64x2_t *v5 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v16, v6.f64[0]), v14, v6, 1), v10, v27.f64[0]);
    v5[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v17, v6), v15, v6, 1), v27, v11);
    v5[2] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v16, v12.f64[0]), v14, v12, 1), v10, v28.f64[0]);
    v5[3] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v17, v12), v15, v12, 1), v28, v11);
    v5[4] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v16, v9.f64[0]), v14, v9, 1), v10, v8.f64[0]);
    v5[5] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v17, v9), v15, v9, 1), v8, v11);
  }
}

uint64_t sub_21041F320(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C284F50;
  a2[1] = v2;
  return result;
}

void *sub_21041F344(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26C284F50;
  result[1] = v3;
  return result;
}

void sub_21041F38C()
{
}

void *sub_21041F3A4()
{
  return &unk_26C2848D8;
}

uint64_t sub_21041F3B0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_2"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_2" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_2")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_2" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

double sub_21041F408(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = *(long double **)(v1 + 304);
  if (*(long double **)(v1 + 312) != v2) {
    return atan2(v2[4], *v2);
  }
  __break(1u);
  return result;
}

uint64_t sub_21041F430(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C284EF8;
  a2[1] = v2;
  return result;
}

void *sub_21041F454(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26C284EF8;
  result[1] = v3;
  return result;
}

void sub_21041F49C()
{
}

void *sub_21041F4B4()
{
  return &unk_26C2848C8;
}

uint64_t sub_21041F4C0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_1"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_1" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_1")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_21041F518(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  uint64_t v3 = *(void *)(v2 + 304);
  if (*(void *)(v2 + 312) == v3)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = *a2;
    *(void *)(v3 + 48) = a2[1];
  }
  return result;
}

uint64_t sub_21041F548(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C284EA0;
  a2[1] = v2;
  return result;
}

void *sub_21041F56C(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26C284EA0;
  result[1] = v3;
  return result;
}

void sub_21041F5B4()
{
}

void *sub_21041F5CC()
{
  return &unk_26C2848B8;
}

uint64_t sub_21041F5D8(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_0"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_21041F630(uint64_t result)
{
  if (*(void *)(*(void *)(result + 8) + 312) == *(void *)(*(void *)(result + 8) + 304)) {
    __break(1u);
  }
  return result;
}

uint64_t sub_21041F658(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C284E48;
  a2[1] = v2;
  return result;
}

void *sub_21041F67C(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26C284E48;
  result[1] = v3;
  return result;
}

void sub_21041F6C4()
{
}

uint64_t HVF::PartTransformRenderer::PartTransformRenderer(uint64_t a1, void *a2, char a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  *(void *)a1 = &unk_26C284C38;
  *(void *)(a1 + 8) = a1;
  *(void *)(a1 + 24) = a1;
  *(void *)(a1 + 32) = &unk_26C284C90;
  *(void *)(a1 + 40) = a1;
  *(void *)(a1 + 56) = a1 + 32;
  *(void *)(a1 + 64) = &unk_26C284CE8;
  *(void *)(a1 + 72) = a1;
  *(void *)(a1 + 88) = a1 + 64;
  *(void *)(a1 + 96) = &unk_26C284D40;
  *(void *)(a1 + 104) = a1;
  *(void *)(a1 + 120) = a1 + 96;
  *(void *)(a1 + 128) = &unk_26C284D98;
  *(void *)(a1 + 136) = a1;
  *(void *)(a1 + 152) = a1 + 128;
  *(void *)(a1 + 160) = &unk_26C284DF0;
  *(void *)(a1 + 168) = a1;
  *(void *)(a1 + 184) = a1 + 160;
  uint64_t v5 = (void *)a2[3];
  if (!v5) {
    goto LABEL_4;
  }
  if (v5 != a2)
  {
    uint64_t v5 = (void *)(*(uint64_t (**)(void *))(*v5 + 16))(v5);
LABEL_4:
    float64x2_t v8 = v5;
    goto LABEL_6;
  }
  float64x2_t v8 = v7;
  (*(void (**)(void *, void *))(*a2 + 24))(a2, v7);
  uint64_t v5 = v8;
LABEL_6:
  *(void *)(a1 + 192) = &unk_26C2849A8;
  if (!v5)
  {
LABEL_9:
    *(void *)(a1 + 224) = v5;
    goto LABEL_11;
  }
  if (v5 != v7)
  {
    uint64_t v5 = (void *)(*(uint64_t (**)(void *))(*v5 + 16))(v5);
    goto LABEL_9;
  }
  *(void *)(a1 + 224) = a1 + 200;
  (*(void (**)(void *))(v7[0] + 24))(v7);
LABEL_11:
  *(void *)(a1 + 240) = 0;
  *(void *)(a1 + 248) = 0;
  *(void *)(a1 + 232) = a1 + 240;
  if (v8 == v7)
  {
    (*(void (**)(void *))(v7[0] + 32))(v7);
  }
  else if (v8)
  {
    (*(void (**)(void))(*v8 + 40))();
  }
  *(unsigned char *)(a1 + 256) = a3;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  return a1;
}

void sub_21041F9A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_21041E874((uint64_t *)va);
  HVF::PartTransform::~PartTransform(v2);
  _Unwind_Resume(a1);
}

void *sub_21041F9C8()
{
  return &unk_26C2848A8;
}

uint64_t sub_21041F9D4(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_5"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_5" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_5")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_5" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_21041FA2C@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v4 = *a2;
  *a3 = &unk_26C285160;
  a3[1] = v3;
  a3[2] = v4;
  a3[3] = a3;
  a3[4] = &unk_26C285108;
  a3[5] = v3;
  a3[6] = v4;
  a3[7] = a3 + 4;
  return result;
}

void *sub_21041FA7C()
{
  return &unk_26C284938;
}

uint64_t sub_21041FA88(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlRKN"
                     "S_13PartTransformEE_"
    || ((v3 & (unint64_t)"ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_"
                                "5clEmEUlRKNS_13PartTransformEE_" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlRKNS_13PartTransformEE_")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlRKNS_13PartTransformEE_" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void sub_21041FAE0()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  memset(v0, 0, sizeof(v0));
  HVF::PartTransform::~PartTransform((HVF::PartTransform *)v0);
}

__n128 sub_21041FB54(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C285108;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 sub_21041FB7C(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C285108;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void sub_21041FBC8()
{
}

void *sub_21041FBE0()
{
  return &unk_26C284948;
}

uint64_t sub_21041FBEC(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlvE_"
    || ((v3 & (unint64_t)"ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlvE_" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlvE_")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlvE_" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

double sub_21041FC44@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

__n128 sub_21041FC6C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C285160;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 sub_21041FC94(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C285160;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void sub_21041FCE0()
{
}

uint64_t sub_21041FD00(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C284DF0;
  a2[1] = v2;
  return result;
}

void *sub_21041FD24(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26C284DF0;
  result[1] = v3;
  return result;
}

void sub_21041FD6C()
{
}

void *sub_21041FD84()
{
  return &unk_26C284898;
}

uint64_t sub_21041FD90(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_4"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_4" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_4")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_4" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_21041FDE8@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v4 = *a2;
  *a3 = &unk_26C2850B0;
  a3[1] = v3;
  a3[2] = v4;
  a3[3] = a3;
  a3[4] = &unk_26C285058;
  a3[5] = v3;
  a3[6] = v4;
  a3[7] = a3 + 4;
  return result;
}

void *sub_21041FE38()
{
  return &unk_26C284918;
}

uint64_t sub_21041FE44(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlRKdE_"
    || ((v3 & (unint64_t)"ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlRKdE_" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlRKdE_")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlRKdE_" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

double sub_21041FE9C(uint64_t a1, double *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  unint64_t v3 = *(void *)(a1 + 16);
  if ((*(uint64_t (**)(void))(**(void **)(v4 + 264) + 40))(*(void *)(v4 + 264)) > v3)
  {
    uint64_t v6 = *(void *)(v4 + 280);
    if (v3 < (*(void *)(v4 + 288) - v6) >> 3)
    {
      double result = *a2;
      *(double *)(v6 + 8 * v3) = *a2;
    }
  }
  return result;
}

__n128 sub_21041FF18(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C285058;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 sub_21041FF40(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C285058;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void sub_21041FF8C()
{
}

void *sub_21041FFA4()
{
  return &unk_26C284928;
}

uint64_t sub_21041FFB0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlvE_"
    || ((v3 & (unint64_t)"ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlvE_" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlvE_")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlvE_" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

double sub_210420008(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  unint64_t v1 = *(void *)(a1 + 16);
  unint64_t v3 = (*(uint64_t (**)(void))(**(void **)(v2 + 264) + 40))(*(void *)(v2 + 264));
  double result = 0.0;
  if (v3 > v1)
  {
    uint64_t v5 = *(void *)(v2 + 280);
    if (v1 < (*(void *)(v2 + 288) - v5) >> 3) {
      return *(double *)(v5 + 8 * v1);
    }
  }
  return result;
}

__n128 sub_210420078(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26C2850B0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 sub_2104200A0(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26C2850B0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

void sub_2104200EC()
{
}

uint64_t sub_21042010C(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C284D98;
  a2[1] = v2;
  return result;
}

void *sub_210420130(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26C284D98;
  result[1] = v3;
  return result;
}

void sub_210420178()
{
}

void *sub_210420190()
{
  return &unk_26C284888;
}

uint64_t sub_21042019C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_3"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_3" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_3")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_3" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void sub_2104201F4(uint64_t a1, double *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(float64x2_t **)(v4 + 304);
  if (*(float64x2_t **)(v4 + 312) == v5)
  {
    __break(1u);
  }
  else
  {
    v2.f64[0] = v5[1].f64[0];
    v3.f64[0] = v5[3].f64[0];
    if (*a2 == 0.0)
    {
      float64x2_t v6 = (float64x2_t)xmmword_26AA45960;
      float64x2_t v7 = *(float64x2_t *)algn_26AA45970;
      float64x2_t v9 = (float64x2_t)xmmword_26AA459A0;
      float64x2_t v8 = qword_26AA459B0;
      float64x2_t v10 = (float64x2_t)xmmword_26AA459A0;
      float64x2_t v11 = qword_26AA459B0;
      float64x2_t v12 = (float64x2_t)xmmword_26AA45980;
      float64x2_t v13 = (float64x2_t)unk_26AA45990;
      float64x2_t v14 = (float64x2_t)xmmword_26AA45980;
      float64x2_t v15 = (float64x2_t)unk_26AA45990;
      float64x2_t v16 = (float64x2_t)xmmword_26AA45960;
      float64x2_t v17 = *(float64x2_t *)algn_26AA45970;
    }
    else
    {
      float64x2_t v29 = v3;
      float64x2_t v30 = v2;
      __double2 v18 = __sincos_stret(*a2 * 0.5);
      v15.f64[0] = v18.__cosval;
      v11.f64[0] = v18.__sinval;
      double v19 = vmuld_n_f64(0.0, 0.0);
      double v20 = vmuld_lane_f64(0.0, (float64x2_t)0, 1);
      float64_t v21 = v11.f64[0] * v11.f64[0];
      float64_t v22 = v15.f64[0] * v15.f64[0];
      v16.f64[0] = v15.f64[0] * v15.f64[0] - (v11.f64[0] * v11.f64[0] + v20) + v19;
      v17.f64[0] = v20;
      v14.f64[0] = v17.f64[0] + v11.f64[0] * v15.f64[0] + v17.f64[0] + v11.f64[0] * v15.f64[0];
      double v23 = vmuld_lane_f64(v18.__cosval, (float64x2_t)0, 1);
      v10.f64[0] = v11.f64[0] * 0.0 - v23 + v11.f64[0] * 0.0 - v23;
      float64_t v24 = v17.f64[0] - v11.f64[0] * v15.f64[0] + v17.f64[0] - v11.f64[0] * v15.f64[0];
      double v25 = v20 + v15.f64[0] * v15.f64[0] - (v19 + v11.f64[0] * v11.f64[0]);
      v11.f64[0] = vmuld_lane_f64(v18.__sinval, (float64x2_t)0, 1);
      v15.f64[0] = v18.__cosval * 0.0;
      float64_t v26 = v11.f64[0] + v15.f64[0] + v11.f64[0] + v15.f64[0];
      v17.f64[0] = v18.__sinval * 0.0 + v23;
      float64x2_t v3 = v29;
      float64x2_t v2 = v30;
      v17.f64[0] = v17.f64[0] + v17.f64[0];
      v15.f64[0] = v11.f64[0] - v15.f64[0] + v11.f64[0] - v15.f64[0];
      v11.f64[0] = v21 + v22 - (v20 + v19);
      v16.f64[1] = v24;
      v14.f64[1] = v25;
      v10.f64[1] = v26;
      float64x2_t v6 = (float64x2_t)xmmword_26AA45960;
      float64x2_t v7 = *(float64x2_t *)algn_26AA45970;
      float64x2_t v12 = (float64x2_t)xmmword_26AA45980;
      float64x2_t v13 = (float64x2_t)unk_26AA45990;
      float64x2_t v9 = (float64x2_t)xmmword_26AA459A0;
      float64x2_t v8 = qword_26AA459B0;
    }
    float64x2_t v27 = vaddq_f64(v7, v2);
    float64x2_t v28 = vaddq_f64(v13, v3);
    float64x2_t *v5 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v16, v6.f64[0]), v14, v6, 1), v10, v27.f64[0]);
    v5[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v17, v6), v15, v6, 1), v27, v11);
    v5[2] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v16, v12.f64[0]), v14, v12, 1), v10, v28.f64[0]);
    v5[3] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v17, v12), v15, v12, 1), v28, v11);
    v5[4] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v16, v9.f64[0]), v14, v9, 1), v10, v8.f64[0]);
    v5[5] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v17, v9), v15, v9, 1), v8, v11);
  }
}

uint64_t sub_21042038C(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C284D40;
  a2[1] = v2;
  return result;
}

void *sub_2104203B0(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26C284D40;
  result[1] = v3;
  return result;
}

void sub_2104203F8()
{
}

void *sub_210420410()
{
  return &unk_26C284878;
}

uint64_t sub_21042041C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_2"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_2" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_2")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_2" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

double sub_210420474(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = *(long double **)(v1 + 304);
  if (*(long double **)(v1 + 312) != v2) {
    return atan2(v2[4], *v2);
  }
  __break(1u);
  return result;
}

uint64_t sub_21042049C(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C284CE8;
  a2[1] = v2;
  return result;
}

void *sub_2104204C0(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26C284CE8;
  result[1] = v3;
  return result;
}

void sub_210420508()
{
}

void *sub_210420520()
{
  return &unk_26C284868;
}

uint64_t sub_21042052C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_1"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_1" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_1")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_210420584(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  uint64_t v3 = *(void *)(v2 + 304);
  if (*(void *)(v2 + 312) == v3)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = *a2;
    *(void *)(v3 + 48) = a2[1];
  }
  return result;
}

uint64_t sub_2104205B4(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C284C90;
  a2[1] = v2;
  return result;
}

void *sub_2104205D8(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26C284C90;
  result[1] = v3;
  return result;
}

void sub_210420620()
{
}

void *sub_210420638()
{
  return &unk_26C284858;
}

uint64_t sub_210420644(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_0"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_0")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_21042069C(uint64_t result)
{
  if (*(void *)(*(void *)(result + 8) + 312) == *(void *)(*(void *)(result + 8) + 304)) {
    __break(1u);
  }
  return result;
}

uint64_t sub_2104206C4(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C284C38;
  a2[1] = v2;
  return result;
}

void *sub_2104206E8(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26C284C38;
  result[1] = v3;
  return result;
}

void sub_210420730()
{
}

uint64_t HVF::PartTransformRenderer::getPartTranslation(uint64_t this)
{
  if (*(void *)(this + 312) == *(void *)(this + 304)) {
    __break(1u);
  }
  return this;
}

uint64_t HVF::PartTransformRenderer::setPartTranslation(uint64_t this, const CGVector *a2)
{
  uint64_t v2 = *(void *)(this + 304);
  if (*(void *)(this + 312) == v2)
  {
    __break(1u);
  }
  else
  {
    *(CGFloat *)(v2 + 16) = a2->dx;
    *(CGFloat *)(v2 + 48) = a2->dy;
  }
  return this;
}

long double HVF::PartTransformRenderer::getPartRotation(HVF::PartTransformRenderer *this)
{
  uint64_t v1 = (long double *)*((void *)this + 38);
  if (*((long double **)this + 39) != v1) {
    return atan2(v1[4], *v1);
  }
  __break(1u);
  return result;
}

void HVF::PartTransformRenderer::setPartRotation(HVF::PartTransformRenderer *this, const double *a2)
{
  uint64_t v4 = (float64x2_t *)*((void *)this + 38);
  if (*((float64x2_t **)this + 39) == v4)
  {
    __break(1u);
  }
  else
  {
    v2.f64[0] = v4[1].f64[0];
    v3.f64[0] = v4[3].f64[0];
    if (*a2 == 0.0)
    {
      float64x2_t v5 = (float64x2_t)xmmword_26AA45960;
      float64x2_t v6 = *(float64x2_t *)algn_26AA45970;
      float64x2_t v8 = (float64x2_t)xmmword_26AA459A0;
      float64x2_t v7 = qword_26AA459B0;
      float64x2_t v9 = (float64x2_t)xmmword_26AA459A0;
      float64x2_t v10 = qword_26AA459B0;
      float64x2_t v11 = (float64x2_t)xmmword_26AA45980;
      float64x2_t v12 = (float64x2_t)unk_26AA45990;
      float64x2_t v13 = (float64x2_t)xmmword_26AA45980;
      float64x2_t v14 = (float64x2_t)unk_26AA45990;
      float64x2_t v15 = (float64x2_t)xmmword_26AA45960;
      float64x2_t v16 = *(float64x2_t *)algn_26AA45970;
    }
    else
    {
      float64x2_t v28 = v3;
      float64x2_t v29 = v2;
      __double2 v17 = __sincos_stret(*a2 * 0.5);
      v14.f64[0] = v17.__cosval;
      v10.f64[0] = v17.__sinval;
      double v18 = vmuld_n_f64(0.0, 0.0);
      double v19 = vmuld_lane_f64(0.0, (float64x2_t)0, 1);
      float64_t v20 = v10.f64[0] * v10.f64[0];
      float64_t v21 = v14.f64[0] * v14.f64[0];
      v15.f64[0] = v14.f64[0] * v14.f64[0] - (v19 + v10.f64[0] * v10.f64[0]) + v18;
      v16.f64[0] = v19;
      v13.f64[0] = v16.f64[0] + v10.f64[0] * v14.f64[0] + v16.f64[0] + v10.f64[0] * v14.f64[0];
      double v22 = vmuld_lane_f64(v17.__cosval, (float64x2_t)0, 1);
      v9.f64[0] = v10.f64[0] * 0.0 - v22 + v10.f64[0] * 0.0 - v22;
      float64_t v23 = v16.f64[0] - v10.f64[0] * v14.f64[0] + v16.f64[0] - v10.f64[0] * v14.f64[0];
      double v24 = v19 + v14.f64[0] * v14.f64[0] - (v10.f64[0] * v10.f64[0] + v18);
      v10.f64[0] = vmuld_lane_f64(v17.__sinval, (float64x2_t)0, 1);
      v14.f64[0] = v17.__cosval * 0.0;
      float64_t v25 = v10.f64[0] + v14.f64[0] + v10.f64[0] + v14.f64[0];
      v16.f64[0] = v17.__sinval * 0.0 + v22;
      float64x2_t v3 = v28;
      float64x2_t v2 = v29;
      v16.f64[0] = v16.f64[0] + v16.f64[0];
      v14.f64[0] = v10.f64[0] - v14.f64[0] + v10.f64[0] - v14.f64[0];
      v10.f64[0] = v20 + v21 - (v18 + v19);
      v15.f64[1] = v23;
      v13.f64[1] = v24;
      v9.f64[1] = v25;
      float64x2_t v5 = (float64x2_t)xmmword_26AA45960;
      float64x2_t v6 = *(float64x2_t *)algn_26AA45970;
      float64x2_t v11 = (float64x2_t)xmmword_26AA45980;
      float64x2_t v12 = (float64x2_t)unk_26AA45990;
      float64x2_t v8 = (float64x2_t)xmmword_26AA459A0;
      float64x2_t v7 = qword_26AA459B0;
    }
    float64x2_t v26 = vaddq_f64(v6, v2);
    float64x2_t v27 = vaddq_f64(v12, v3);
    float64x2_t *v4 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v15, v5.f64[0]), v13, v5, 1), v9, v26.f64[0]);
    v4[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v5, v16), v14, v5, 1), v26, v10);
    v4[2] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v15, v11.f64[0]), v13, v11, 1), v9, v27.f64[0]);
    v4[3] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v11, v16), v14, v11, 1), v27, v10);
    v4[4] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v15, v8.f64[0]), v13, v8, 1), v9, v7.f64[0]);
    v4[5] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v8, v16), v14, v8, 1), v7, v10);
  }
}

double HVF::PartTransformRenderer::getPartAxisValueAtIndex(HVF::PartTransformRenderer *this, unint64_t a2)
{
  unint64_t v4 = (*(uint64_t (**)(void))(**((void **)this + 33) + 40))(*((void *)this + 33));
  double result = 0.0;
  if (v4 > a2)
  {
    uint64_t v6 = *((void *)this + 35);
    if (a2 < (*((void *)this + 36) - v6) >> 3) {
      return *(double *)(v6 + 8 * a2);
    }
  }
  return result;
}

double HVF::PartTransformRenderer::setPartAxisValueAtIndex(HVF::PartTransformRenderer *this, unint64_t a2, double *a3)
{
  if ((*(uint64_t (**)(void))(**((void **)this + 33) + 40))(*((void *)this + 33)) > a2)
  {
    uint64_t v7 = *((void *)this + 35);
    if (a2 < (*((void *)this + 36) - v7) >> 3)
    {
      double result = *a3;
      *(double *)(v7 + 8 * a2) = *a3;
    }
  }
  return result;
}

double HVF::PartTransformRenderer::getSubpartTranslationAtIndex(HVF::PartTransformRenderer *this, unint64_t a2)
{
  uint64_t v2 = *((void *)this + 38);
  if (0xAAAAAAAAAAAAAAABLL * ((*((void *)this + 39) - v2) >> 5) <= a2) {
    return 0.0;
  }
  else {
    return *(double *)(v2 + 96 * a2 + 16);
  }
}

CGFloat HVF::PartTransformRenderer::setSubpartTranslationAtIndex(HVF::PartTransformRenderer *this, unint64_t a2, const CGVector *a3)
{
  uint64_t v3 = *((void *)this + 38);
  if (0xAAAAAAAAAAAAAAABLL * ((*((void *)this + 39) - v3) >> 5) > a2)
  {
    uint64_t v4 = v3 + 96 * a2;
    *(CGFloat *)(v4 + 16) = a3->dx;
    CGFloat result = a3->dy;
    *(CGFloat *)(v4 + 48) = result;
  }
  return result;
}

double HVF::PartTransformRenderer::getBlendedTranslationAtIndex(HVF::PartTransformRenderer *this, unint64_t a2)
{
  if (*((unsigned char *)this + 256))
  {
    uint64_t v2 = *((void *)this + 44);
    uint64_t v3 = *((void *)this + 45);
  }
  else
  {
    uint64_t v2 = *((void *)this + 38);
    uint64_t v3 = *((void *)this + 39);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((v3 - v2) >> 5) <= a2) {
    return 0.0;
  }
  else {
    return *(double *)(v2 + 96 * a2 + 16);
  }
}

long double HVF::PartTransformRenderer::getSubpartRotationAtIndex(HVF::PartTransformRenderer *this, unint64_t a2)
{
  uint64_t v2 = *((void *)this + 38);
  if (0xAAAAAAAAAAAAAAABLL * ((*((void *)this + 39) - v2) >> 5) <= a2) {
    return 0.0;
  }
  else {
    return atan2(*(long double *)(v2 + 96 * a2 + 32), *(long double *)(v2 + 96 * a2));
  }
}

void HVF::PartTransformRenderer::setSubpartRotationAtIndex(HVF::PartTransformRenderer *this, unint64_t a2, const double *a3)
{
  uint64_t v5 = *((void *)this + 38);
  if (0xAAAAAAAAAAAAAAABLL * ((*((void *)this + 39) - v5) >> 5) > a2)
  {
    uint64_t v6 = (float64x2_t *)(v5 + 96 * a2);
    v3.f64[0] = v6[1].f64[0];
    v4.f64[0] = v6[3].f64[0];
    if (*a3 == 0.0)
    {
      float64x2_t v7 = (float64x2_t)xmmword_26AA45960;
      float64x2_t v8 = *(float64x2_t *)algn_26AA45970;
      float64x2_t v10 = (float64x2_t)xmmword_26AA459A0;
      float64x2_t v9 = qword_26AA459B0;
      float64x2_t v11 = (float64x2_t)xmmword_26AA459A0;
      float64x2_t v12 = qword_26AA459B0;
      float64x2_t v13 = (float64x2_t)xmmword_26AA45980;
      float64x2_t v14 = (float64x2_t)unk_26AA45990;
      float64x2_t v15 = (float64x2_t)xmmword_26AA45980;
      float64x2_t v16 = (float64x2_t)unk_26AA45990;
      float64x2_t v17 = (float64x2_t)xmmword_26AA45960;
      float64x2_t v18 = *(float64x2_t *)algn_26AA45970;
    }
    else
    {
      float64x2_t v30 = v4;
      float64x2_t v31 = v3;
      __double2 v19 = __sincos_stret(*a3 * 0.5);
      v16.f64[0] = v19.__cosval;
      v12.f64[0] = v19.__sinval;
      double v20 = vmuld_n_f64(0.0, 0.0);
      double v21 = vmuld_lane_f64(0.0, (float64x2_t)0, 1);
      float64_t v22 = v12.f64[0] * v12.f64[0];
      float64_t v23 = v16.f64[0] * v16.f64[0];
      v17.f64[0] = v16.f64[0] * v16.f64[0] - (v21 + v12.f64[0] * v12.f64[0]) + v20;
      v18.f64[0] = v21;
      v15.f64[0] = v18.f64[0] + v12.f64[0] * v16.f64[0] + v18.f64[0] + v12.f64[0] * v16.f64[0];
      double v24 = vmuld_lane_f64(v19.__cosval, (float64x2_t)0, 1);
      v11.f64[0] = v12.f64[0] * 0.0 - v24 + v12.f64[0] * 0.0 - v24;
      float64_t v25 = v18.f64[0] - v12.f64[0] * v16.f64[0] + v18.f64[0] - v12.f64[0] * v16.f64[0];
      double v26 = v21 + v16.f64[0] * v16.f64[0] - (v12.f64[0] * v12.f64[0] + v20);
      v12.f64[0] = vmuld_lane_f64(v19.__sinval, (float64x2_t)0, 1);
      v16.f64[0] = v19.__cosval * 0.0;
      float64_t v27 = v12.f64[0] + v16.f64[0] + v12.f64[0] + v16.f64[0];
      v18.f64[0] = v19.__sinval * 0.0 + v24;
      float64x2_t v4 = v30;
      float64x2_t v3 = v31;
      v18.f64[0] = v18.f64[0] + v18.f64[0];
      v16.f64[0] = v12.f64[0] - v16.f64[0] + v12.f64[0] - v16.f64[0];
      v12.f64[0] = v22 + v23 - (v20 + v21);
      v17.f64[1] = v25;
      v15.f64[1] = v26;
      v11.f64[1] = v27;
      float64x2_t v7 = (float64x2_t)xmmword_26AA45960;
      float64x2_t v8 = *(float64x2_t *)algn_26AA45970;
      float64x2_t v13 = (float64x2_t)xmmword_26AA45980;
      float64x2_t v14 = (float64x2_t)unk_26AA45990;
      float64x2_t v10 = (float64x2_t)xmmword_26AA459A0;
      float64x2_t v9 = qword_26AA459B0;
    }
    float64x2_t v28 = vaddq_f64(v8, v3);
    float64x2_t v29 = vaddq_f64(v14, v4);
    *uint64_t v6 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v17, v7.f64[0]), v15, v7, 1), v11, v28.f64[0]);
    v6[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v7, v18), v16, v7, 1), v28, v12);
    v6[2] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v17, v13.f64[0]), v15, v13, 1), v11, v29.f64[0]);
    v6[3] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v13, v18), v16, v13, 1), v29, v12);
    v6[4] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v17, v10.f64[0]), v15, v10, 1), v11, v9.f64[0]);
    v6[5] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, v18), v16, v10, 1), v9, v12);
  }
}

long double HVF::PartTransformRenderer::getBlendedRotationAtIndex(HVF::PartTransformRenderer *this, unint64_t a2)
{
  if (*((unsigned char *)this + 256))
  {
    uint64_t v2 = *((void *)this + 44);
    uint64_t v3 = *((void *)this + 45);
  }
  else
  {
    uint64_t v2 = *((void *)this + 38);
    uint64_t v3 = *((void *)this + 39);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((v3 - v2) >> 5) <= a2) {
    return 0.0;
  }
  else {
    return atan2(*(long double *)(v2 + 96 * a2 + 32), *(long double *)(v2 + 96 * a2));
  }
}

double HVF::PartTransformRenderer::getSubpartAxisValueAtIndex(HVF::PartTransformRenderer *this, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *((void *)this + 35);
  if (a3 + a2 >= (unint64_t)((*((void *)this + 36) - v3) >> 3)) {
    return 0.0;
  }
  else {
    return *(double *)(v3 + 8 * (a3 + a2));
  }
}

double HVF::PartTransformRenderer::setSubpartAxisValueAtIndex(HVF::PartTransformRenderer *this, uint64_t a2, uint64_t a3, double *a4)
{
  uint64_t v4 = *((void *)this + 35);
  if (a3 + a2 < (unint64_t)((*((void *)this + 36) - v4) >> 3))
  {
    double result = *a4;
    *(double *)(v4 + 8 * (a3 + a2)) = *a4;
  }
  return result;
}

double HVF::PartTransformRenderer::getBlendedAxisValueAtIndex(HVF::PartTransformRenderer *this, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a3 + a2;
  if (*((unsigned char *)this + 256))
  {
    uint64_t v4 = *((void *)this + 41);
    uint64_t v5 = *((void *)this + 42);
  }
  else
  {
    uint64_t v4 = *((void *)this + 35);
    uint64_t v5 = *((void *)this + 36);
  }
  if (v3 >= (v5 - v4) >> 3) {
    return 0.0;
  }
  else {
    return *(double *)(v4 + 8 * v3);
  }
}

double HVF::PartTransformRenderer::blendedAxisValueBounds(HVF::PartTransformRenderer *this)
{
  uint64_t v1 = 328;
  if (!*((unsigned char *)this + 256)) {
    uint64_t v1 = 280;
  }
  uint64_t v2 = *(double **)((char *)this + v1);
  if (*((unsigned char *)this + 256)) {
    unint64_t v3 = (char *)this + 328;
  }
  else {
    unint64_t v3 = (char *)this + 280;
  }
  uint64_t v4 = (double *)*((void *)v3 + 1);
  uint64_t v5 = (char *)v4 - (char *)v2;
  BOOL v7 = v4 == v2;
  uint64_t v6 = (double *)((char *)v2 + (((char *)v4 - (char *)v2) & 0xFFFFFFFFFFFFFFF8));
  BOOL v7 = v7 || v5 == 8;
  if (v7)
  {
    float64x2_t v8 = v2;
  }
  else
  {
    float64x2_t v9 = v2 + 1;
    double v10 = v2[1];
    if (v10 >= *v2) {
      float64x2_t v8 = v2;
    }
    else {
      float64x2_t v8 = v2 + 1;
    }
    if (v10 < *v2) {
      float64x2_t v9 = v2;
    }
    if (v5 != 16)
    {
      uint64_t v11 = v5 >> 3;
      float64x2_t v12 = v2 + 2;
      double v13 = fmin(v10, *v2);
      float64x2_t v14 = v2 + 3;
      uint64_t v15 = 8 * v11 - 24;
      while (1)
      {
        float64x2_t v18 = v12;
        if (!v15) {
          break;
        }
        double v20 = *(v14 - 1);
        double v19 = *v14;
        if (*v14 >= v20)
        {
          float64x2_t v16 = v2 + 3;
          BOOL v17 = v20 < v13;
          double v13 = fmin(v20, v13);
          if (v17) {
            float64x2_t v8 = v14 - 1;
          }
          if (v19 >= *v9) {
            float64x2_t v9 = v16;
          }
        }
        else
        {
          double v13 = fmin(v19, *v8);
          if (v19 < *v8) {
            float64x2_t v8 = v14;
          }
          if (v20 >= *v9) {
            float64x2_t v9 = v14 - 1;
          }
        }
        v12 += 2;
        v14 += 2;
        v15 -= 16;
        uint64_t v2 = v18;
        if (v15 == -8) {
          goto LABEL_33;
        }
      }
      if (*(v14 - 1) < *v8) {
        float64x2_t v8 = v14 - 1;
      }
    }
  }
LABEL_33:
  double result = 0.0;
  if (v8 != v6) {
    return *v8;
  }
  return result;
}

uint64_t HVF::PartTransformRenderer::partIndexAtSubpartIndex(HVF::PartTransformRenderer *this, char *a2, unint64_t a3)
{
  uint64_t v4 = (char *)this + 240;
  uint64_t v5 = (void *)*((void *)this + 30);
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = (char *)this + 240;
  do
  {
    unint64_t v7 = v5[4];
    BOOL v8 = v7 >= (unint64_t)a2;
    if (v7 >= (unint64_t)a2) {
      float64x2_t v9 = v5;
    }
    else {
      float64x2_t v9 = v5 + 1;
    }
    if (v8) {
      uint64_t v6 = (char *)v5;
    }
    uint64_t v5 = (void *)*v9;
  }
  while (*v9);
  if (v6 != v4 && *((void *)v6 + 4) <= (unint64_t)a2)
  {
    uint64_t v14 = *((unsigned int *)v6 + 80);
    if (v14 == -1) {
      sub_21041CF6C();
    }
    float64x2_t v16 = &v15;
    uint64_t v11 = ((uint64_t (*)(char **, char *))*(&off_26C285330 + v14))(&v16, v6 + 40);
  }
  else
  {
LABEL_12:
    float64x2_t v16 = a2;
    uint64_t v10 = *((void *)this + 28);
    if (!v10) {
      sub_21041CFB8();
    }
    uint64_t v11 = (*(uint64_t (**)(uint64_t, char **, char *))(*(void *)v10 + 48))(v10, &v16, v4 - 48);
  }
  uint64_t v12 = v11;
  if ((*(unsigned int (**)(uint64_t))(*(void *)v11 + 16))(v11) && *(void *)(v12 + 64) > a3) {
    return *(unsigned int *)(*(void *)(v12 + 56) + 8 * a3);
  }
  else {
    return 0;
  }
}

uint64_t HVF::PartTransformRenderer::nestixAtSubpartIndex(HVF::PartTransformRenderer *this, char *a2, unint64_t a3)
{
  uint64_t v4 = (char *)this + 240;
  uint64_t v5 = (void *)*((void *)this + 30);
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = (char *)this + 240;
  do
  {
    unint64_t v7 = v5[4];
    BOOL v8 = v7 >= (unint64_t)a2;
    if (v7 >= (unint64_t)a2) {
      float64x2_t v9 = v5;
    }
    else {
      float64x2_t v9 = v5 + 1;
    }
    if (v8) {
      uint64_t v6 = (char *)v5;
    }
    uint64_t v5 = (void *)*v9;
  }
  while (*v9);
  if (v6 != v4 && *((void *)v6 + 4) <= (unint64_t)a2)
  {
    uint64_t v14 = *((unsigned int *)v6 + 80);
    if (v14 == -1) {
      sub_21041CF6C();
    }
    float64x2_t v16 = &v15;
    uint64_t v11 = ((uint64_t (*)(char **, char *))*(&off_26C285330 + v14))(&v16, v6 + 40);
  }
  else
  {
LABEL_12:
    float64x2_t v16 = a2;
    uint64_t v10 = *((void *)this + 28);
    if (!v10) {
      sub_21041CFB8();
    }
    uint64_t v11 = (*(uint64_t (**)(uint64_t, char **, char *))(*(void *)v10 + 48))(v10, &v16, v4 - 48);
  }
  uint64_t v12 = v11;
  if ((*(unsigned int (**)(uint64_t))(*(void *)v11 + 16))(v11) && *(void *)(v12 + 64) > a3) {
    return *(unsigned __int16 *)(*(void *)(v12 + 56) + 8 * a3 + 4) + 1;
  }
  else {
    return 0;
  }
}

uint64_t HVF::PartTransformRenderer::treeAxixAtSubpartIndex(HVF::PartTransformRenderer *this, char *a2, unint64_t a3)
{
  uint64_t v4 = (char *)this + 240;
  uint64_t v5 = (void *)*((void *)this + 30);
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = (char *)this + 240;
  do
  {
    unint64_t v7 = v5[4];
    BOOL v8 = v7 >= (unint64_t)a2;
    if (v7 >= (unint64_t)a2) {
      float64x2_t v9 = v5;
    }
    else {
      float64x2_t v9 = v5 + 1;
    }
    if (v8) {
      uint64_t v6 = (char *)v5;
    }
    uint64_t v5 = (void *)*v9;
  }
  while (*v9);
  if (v6 != v4 && *((void *)v6 + 4) <= (unint64_t)a2)
  {
    uint64_t v14 = *((unsigned int *)v6 + 80);
    if (v14 == -1) {
      sub_21041CF6C();
    }
    float64x2_t v16 = &v15;
    uint64_t v11 = ((uint64_t (*)(char **, char *))*(&off_26C285330 + v14))(&v16, v6 + 40);
  }
  else
  {
LABEL_12:
    float64x2_t v16 = a2;
    uint64_t v10 = *((void *)this + 28);
    if (!v10) {
      sub_21041CFB8();
    }
    uint64_t v11 = (*(uint64_t (**)(uint64_t, char **, char *))(*(void *)v10 + 48))(v10, &v16, v4 - 48);
  }
  uint64_t v12 = v11;
  if ((*(unsigned int (**)(uint64_t))(*(void *)v11 + 16))(v11) && *(void *)(v12 + 64) > a3) {
    return *(_DWORD *)(v12 + 32) + *(unsigned __int16 *)(*(void *)(v12 + 56) + 8 * a3 + 6);
  }
  else {
    return 0;
  }
}

uint64_t HVF::PartTransformRenderer::renderToContext(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 264)) {
    return 0;
  }
  if (os_signpost_enabled(0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21041B000, 0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "renderPart", "", buf, 2u);
  }
  uint64_t v4 = *(void *)(a1 + 280);
  uint64_t v5 = (*(void *)(a1 + 288) - v4) >> 3;
  if (*(unsigned char *)(a1 + 256))
  {
    cblas_dcopy_NEWLAPACK_ILP64();
    uint64_t v6 = *(unsigned char **)(a1 + 304);
    unint64_t v7 = *(unsigned char **)(a1 + 312);
    BOOL v8 = (void **)(a1 + 352);
    if (v7 != v6) {
      memmove(*v8, v6, v7 - v6);
    }
    uint64_t v4 = *(void *)(a1 + 328);
    uint64_t v5 = (*(void *)(a1 + 336) - v4) >> 3;
    float64x2_t v9 = (void *)(a1 + 360);
  }
  else
  {
    BOOL v8 = (void **)(a1 + 304);
    float64x2_t v9 = (void *)(a1 + 312);
  }
  uint64_t v11 = *v8;
  unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v9 - (void)*v8) >> 5);
  v17[0] = v4;
  v17[1] = v5;
  v17[2] = v11;
  v17[3] = v12;
  uint64_t v14 = *(void **)(a1 + 264);
  uint64_t v13 = *(void *)(a1 + 272);
  long long v20 = 0u;
  long long v21 = 0u;
  *(void *)buf = v13;
  uint64_t v19 = 0;
  int v15 = (*(uint64_t (**)(uint64_t, void, uint8_t *))(a2 + 16))(a2, 0, buf);
  if (v15 != 2)
  {
    if (v15 || ((*(uint64_t (**)(void *))(*v14 + 32))(v14) & 1) != 0) {
      goto LABEL_15;
    }
    if ((*(unsigned int (**)(void *))(*v14 + 16))(v14))
    {
      if (HVF::PartTransformRenderer::renderComposite(a1, v14, v17, a2))
      {
LABEL_15:
        (*(void (**)(uint64_t, uint64_t, uint8_t *))(a2 + 16))(a2, 8, buf);
        uint64_t v10 = 1;
        goto LABEL_18;
      }
    }
    else if (HVF::PartTransformRenderer::renderShape((void *)a1, v14, (uint64_t)v17, a2))
    {
      goto LABEL_15;
    }
  }
  uint64_t v10 = 0;
LABEL_18:
  if (os_signpost_enabled(0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21041B000, 0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "renderPart", "", buf, 2u);
  }
  return v10;
}

uint64_t HVF::PartTransformRenderer::renderComposite(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  unint64_t v7 = (void *)a1;
  HVF::PartTransformRenderer::blendComposite(a1, (uint64_t)a2, (uint64_t)a3);
  if (a2[8])
  {
    unint64_t v8 = 0;
    float64x2_t v9 = v7 + 24;
    uint64_t v10 = v7 + 30;
    unint64_t v53 = v7 + 30;
    unint64_t v52 = v7 + 24;
    do
    {
      uint64_t v11 = (unsigned int *)(a2[7] + 8 * v8);
      unint64_t v12 = *v11;
      unint64_t v13 = *((unsigned __int16 *)v11 + 2);
      uint64_t v14 = *((unsigned __int16 *)v11 + 3);
      int v15 = (void *)*v10;
      if (!*v10) {
        goto LABEL_17;
      }
      float64x2_t v16 = v10;
      do
      {
        unint64_t v17 = v15[4];
        BOOL v18 = v17 >= v12;
        if (v17 >= v12) {
          uint64_t v19 = v15;
        }
        else {
          uint64_t v19 = v15 + 1;
        }
        if (v18) {
          float64x2_t v16 = v15;
        }
        int v15 = (void *)*v19;
      }
      while (*v19);
      if (v16 != v10 && v16[4] <= v12)
      {
        uint64_t v31 = *((unsigned int *)v16 + 80);
        if (v31 == -1) {
          sub_21041CF6C();
        }
        v55[0] = v54;
        long long v21 = (void *)((uint64_t (*)(void *, void *))*(&off_26C285330 + v31))(v55, v16 + 5);
        if (!v21) {
          return 0;
        }
      }
      else
      {
LABEL_17:
        v55[0] = v12;
        uint64_t v20 = v7[28];
        if (!v20) {
          goto LABEL_50;
        }
        long long v21 = (void *)(*(uint64_t (**)(uint64_t, void *, void *))(*(void *)v20 + 48))(v20, v55, v9);
        if (!v21) {
          return 0;
        }
      }
      if (((*(uint64_t (**)(void *))(*v21 + 32))(v21) & 1) == 0)
      {
        uint64_t v22 = (*(uint64_t (**)(void *))(*a2 + 40))(a2);
        if (a3[3] <= v13) {
          return 0;
        }
        float64_t v23 = v7;
        uint64_t v24 = a4;
        unint64_t v25 = v13 + 1;
        unint64_t v26 = v22 + v14;
        BOOL v27 = (*(uint64_t (**)(void *))(*v21 + 56))(v21) + v13 + 1 > a3[3] || v26 > a3[1];
        if (v27 || (*(uint64_t (**)(void *))(*v21 + 48))(v21) + v26 > a3[1]) {
          return 0;
        }
        unint64_t v28 = (*(uint64_t (**)(void *))(*v21 + 48))(v21);
        unint64_t v29 = a3[1];
        BOOL v18 = v29 >= v26;
        unint64_t v30 = v29 - v26;
        if (!v18) {
          goto LABEL_49;
        }
        if (v28 == -1)
        {
          unint64_t v28 = v30;
        }
        else if (v30 < v28)
        {
          goto LABEL_49;
        }
        v54[0] = *a3 + 8 * v26;
        v54[1] = v28;
        unint64_t v32 = (*(uint64_t (**)(void *))(*v21 + 56))(v21);
        unint64_t v33 = a3[3];
        if (v33 <= v13) {
          goto LABEL_49;
        }
        unint64_t v34 = v33 - v25;
        if (v32 == -1)
        {
          unint64_t v32 = v34;
        }
        else if (v34 < v32)
        {
          goto LABEL_49;
        }
        uint64_t v35 = (float64x2_t *)a3[2];
        unint64_t v36 = &v35[6 * v25];
        v54[2] = v36;
        v54[3] = v32;
        if (!v32)
        {
LABEL_49:
          __break(1u);
LABEL_50:
          sub_21041CFB8();
        }
        float64x2_t v37 = v36[1];
        float64x2_t v39 = v36[2];
        float64x2_t v38 = v36[3];
        float64x2_t v40 = v36[4];
        float64x2_t v41 = v36[5];
        float64x2_t v42 = v35[1];
        float64x2_t v44 = v35[2];
        float64x2_t v43 = v35[3];
        float64x2_t v46 = v35[4];
        float64x2_t v45 = v35[5];
        float64x2_t v47 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(*v35, v37), v38, *v35, 1), v42, v41);
        float64x2_t v48 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*v36, v44.f64[0]), v39, v44, 1), v40, v43.f64[0]);
        float64x2_t v49 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*v36, v46.f64[0]), v39, v46, 1), v40, v45.f64[0]);
        *unint64_t v36 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*v36, v35->f64[0]), v39, *v35, 1), v40, v42.f64[0]);
        v36[1] = v47;
        v36[2] = v48;
        v36[3] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v44, v37), v38, v44, 1), v43, v41);
        v36[4] = v49;
        v36[5] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v46, v37), v38, v46, 1), v45, v41);
        long long v56 = 0u;
        long long v57 = 0u;
        v55[0] = v12;
        v55[1] = 0;
        a4 = v24;
        int v50 = (*(uint64_t (**)(uint64_t, void, void *))(v24 + 16))(v24, 0, v55);
        if (v50)
        {
          unint64_t v7 = v23;
          float64x2_t v9 = v52;
          if (v50 == 2) {
            return 0;
          }
        }
        else
        {
          unint64_t v7 = v23;
          float64x2_t v9 = v52;
          if (((*(uint64_t (**)(void *))(*v21 + 32))(v21) & 1) == 0)
          {
            if ((*(unsigned int (**)(void *))(*v21 + 16))(v21))
            {
              if ((HVF::PartTransformRenderer::renderComposite(v7, v21, v54, a4) & 1) == 0) {
                return 0;
              }
            }
            else if (!HVF::PartTransformRenderer::renderShape(v7, v21, (uint64_t)v54, a4))
            {
              return 0;
            }
          }
        }
        (*(void (**)(uint64_t, uint64_t, void *))(a4 + 16))(a4, 8, v55);
      }
      ++v8;
      uint64_t v10 = v53;
    }
    while (v8 < a2[8]);
  }
  return 1;
}

BOOL HVF::PartTransformRenderer::renderShape(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  HVF::PartTransformRenderer::blendShape(a1, a2, a3);
  uint64_t v7 = a2[7];
  if (v7)
  {
    int v8 = 0;
    float64x2_t v9 = (_WORD *)a2[6];
    uint64_t v10 = (long long *)a1[50];
    uint64_t v11 = v9;
    while (1)
    {
      unint64_t v12 = (unsigned __int16)*v11;
      if (v12 > 2)
      {
        if ((*(unsigned int (**)(uint64_t, uint64_t, void))(a4 + 16))(a4, 1, 0) == 2) {
          return 0;
        }
        uint64_t v13 = *(void *)v10;
        uint64_t v14 = *((void *)v10 + 1);
        *(void *)&long long v21 = *(void *)v10;
        *((void *)&v21 + 1) = v14;
        int v8 = (*(uint64_t (**)(uint64_t, uint64_t, long long *))(a4 + 16))(a4, 2, &v21);
        int v15 = v10 + 1;
        unsigned int v16 = (unsigned __int16)*v11;
        if (v16 >= 2 && v8 != 2)
        {
          unint64_t v18 = 2;
          do
          {
            long long v21 = *v15;
            long long v22 = v15[1];
            if (!v8)
            {
              int v8 = (*(uint64_t (**)(uint64_t, uint64_t, long long *))(a4 + 16))(a4, 4, &v21);
              LOWORD(v16) = *v11;
            }
            v15 += 2;
            if (v18 >= (unsigned __int16)v16) {
              break;
            }
            ++v18;
          }
          while (v8 != 2);
          uint64_t v10 = v15 - 1;
        }
        uint64_t v19 = *((void *)v10 + 3);
        *(void *)&long long v21 = *(void *)v15;
        *((void *)&v21 + 1) = v19;
        *(void *)&long long v22 = v13;
        *((void *)&v22 + 1) = v14;
        if (!v8)
        {
          int v8 = (*(uint64_t (**)(uint64_t, uint64_t, long long *))(a4 + 16))(a4, 4, &v21);
          if (!v8) {
            int v8 = (*(uint64_t (**)(uint64_t, uint64_t, void))(a4 + 16))(a4, 6, 0);
          }
        }
        if (v8 == 2) {
          return v8 != 2;
        }
        v10 += 2;
        int v8 = (*(uint64_t (**)(uint64_t, uint64_t, void))(a4 + 16))(a4, 7, 0);
        float64x2_t v9 = (_WORD *)a2[6];
        uint64_t v7 = a2[7];
      }
      else
      {
        v10 += 2 * v12;
      }
      if (++v11 == &v9[v7] || v8 == 2) {
        return v8 != 2;
      }
    }
  }
  int v8 = 0;
  return v8 != 2;
}

void HVF::PartTransformRenderer::blendShape(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 8);
  uint64_t v7 = (double *)a1[47];
  unint64_t v8 = (uint64_t)(a1[48] - (void)v7) >> 3;
  if (2 * v6 <= v8)
  {
    if (2 * v6 < v8) {
      a1[48] = &v7[2 * v6];
    }
  }
  else
  {
    sub_21041CA30((uint64_t)(a1 + 47), 2 * v6 - v8);
    uint64_t v7 = (double *)a1[47];
    uint64_t v6 = *(void *)(a3 + 8);
  }
  if (v6)
  {
    float64x2_t v9 = *(double **)a3;
    uint64_t v10 = 8 * v6;
    do
    {
      if (*v9 >= 0.0)
      {
        *uint64_t v7 = 0.0;
        double v11 = *v9;
      }
      else
      {
        *uint64_t v7 = -*v9;
        double v11 = 0.0;
      }
      v7[1] = v11;
      v7 += 2;
      ++v9;
      v10 -= 8;
    }
    while (v10);
  }
  unint64_t v12 = a2[11];
  uint64_t v13 = a1[50];
  unint64_t v14 = (a1[51] - v13) >> 3;
  if (v12 <= v14)
  {
    if (v12 < v14) {
      a1[51] = v13 + 8 * v12;
    }
  }
  else
  {
    sub_21041CA30((uint64_t)(a1 + 50), v12 - v14);
  }
  cblas_dcopy_NEWLAPACK_ILP64();
  uint64_t v15 = cblas_dgemv_NEWLAPACK_ILP64();
  if (a2[7])
  {
    unsigned int v16 = (unsigned __int16 *)a2[6];
    unint64_t v17 = (unsigned __int8 *)a2[8];
    unint64_t v18 = (float64x2_t *)a1[50];
    do
    {
      uint64_t v19 = (unsigned __int8 *)*v16;
      v29[0] = v18;
      v29[1] = (float64x2_t *)(4 * (void)v19);
      v28[0] = v17;
      v28[1] = v19;
      HVF::PartTransformRenderer::adjustShapePoints(v15, v29, v28);
      unsigned int v20 = *v16++;
      v18 += 2 * (void)v19;
      v17 += v20;
    }
    while (v16 != (unsigned __int16 *)(a2[6] + 2 * a2[7]));
  }
  if (*(void *)(a3 + 24))
  {
    long long v21 = (double *)a1[50];
    long long v22 = (double *)a1[51];
    if (v21 != v22)
    {
      float64_t v23 = *(int64x2_t **)(a3 + 16);
      int64x2_t v24 = v23[2];
      float64x2_t v25 = (float64x2_t)vzip1q_s64(*v23, v24);
      float64x2_t v26 = (float64x2_t)vzip2q_s64(*v23, v24);
      float64x2_t v27 = (float64x2_t)vzip1q_s64(v23[1], v23[3]);
      *(void *)&v25.f64[1] = vextq_s8((int8x16_t)v25, (int8x16_t)v25, 8uLL).u64[0];
      *(void *)&v26.f64[1] = vextq_s8((int8x16_t)v26, (int8x16_t)v26, 8uLL).u64[0];
      *(void *)&v27.f64[1] = vextq_s8((int8x16_t)v27, (int8x16_t)v27, 8uLL).u64[0];
      do
      {
        *(float64x2_t *)long long v21 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v25, *v21), v26, v21[1]), v27);
        v21 += 2;
      }
      while (v21 != v22);
    }
  }
  else
  {
    __break(1u);
  }
}

void HVF::PartTransformRenderer::adjustShapePoints(uint64_t a1, float64x2_t **a2, unsigned __int8 **a3)
{
  unint64_t v3 = a3[1];
  if (!v3) {
    return;
  }
  uint64_t v4 = v3 - 1;
  unint64_t v5 = (unint64_t)a2[1];
  unint64_t v6 = (4 * (void)(v3 - 1)) | 2;
  if (v5 <= v6 || v5 <= ((4 * (void)v4) | 3uLL)) {
    goto LABEL_71;
  }
  uint64_t v7 = *a2;
  unint64_t v8 = *a3;
  float64x2_t v9 = *(float64x2_t *)((char *)*a2 + 8 * v6);
  float64x2_t v10 = (*a2)[1];
  int v11 = **a3;
  if (!**a3)
  {
    double v18 = 1.0;
    if (v7->f64[0] <= 1.0) {
      double v18 = v7->f64[0];
    }
    if (v7->f64[0] >= 0.0) {
      double v19 = v18;
    }
    else {
      double v19 = 0.0;
    }
    float64x2_t v9 = vmlaq_n_f64(v9, vsubq_f64(v10, v9), v19);
    goto LABEL_23;
  }
  if (v11 == 2)
  {
    double v20 = vpmaxq_f64(vabdq_f64(v10, v9));
    if (v20 != 0.0)
    {
      float64x2_t v21 = vsubq_f64(v10, v9);
      float64x2_t v22 = vdivq_f64(v21, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v20, 0));
      float64x2_t v23 = vmulq_n_f64(v22, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v22, v22))));
      double v24 = vaddvq_f64(vmulq_f64(vsubq_f64(*v7, v9), v23));
      double v25 = fmin(sqrt(vaddvq_f64(vmulq_f64(v21, v21))), v24);
      if (v24 < 0.0) {
        double v25 = 0.0;
      }
      float64x2_t v9 = vmlaq_n_f64(v9, v23, v25);
    }
LABEL_23:
    *uint64_t v7 = v9;
    goto LABEL_24;
  }
  if (v11 == 3)
  {
    unint64_t v12 = 4 * (v3 != (unsigned __int8 *)1);
    if (v5 > v12 && v5 > (v12 | 1))
    {
      uint64_t v13 = v12 | 2;
      if (v5 > (v12 | 2) && v5 > (v12 | 3))
      {
        unint64_t v14 = &v7[2 * (v3 != (unsigned __int8 *)1)];
        float64x2_t v15 = *(float64x2_t *)((char *)v7 + 8 * v13);
        double v16 = vpmaxq_f64(vabdq_f64(v15, v9));
        if (v16 == 0.0)
        {
          float64x2_t v17 = v9;
        }
        else
        {
          float64x2_t v26 = vsubq_f64(v15, v9);
          float64x2_t v27 = vdivq_f64(v26, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v16, 0));
          float64x2_t v28 = vmulq_n_f64(v27, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v27, v27))));
          double v29 = vaddvq_f64(vmulq_f64(v28, vsubq_f64(*v7, v9)));
          double v30 = sqrt(vaddvq_f64(vmulq_f64(v26, v26)));
          double v31 = fmin(v30, v29);
          BOOL v32 = v29 < 0.0;
          double v33 = 0.0;
          if (v32) {
            double v34 = 0.0;
          }
          else {
            double v34 = v31;
          }
          float64x2_t v35 = vsubq_f64(*v14, v9);
          float64x2_t v36 = v9;
          float64x2_t v9 = vmlaq_n_f64(v9, v28, v34);
          v35.f64[0] = vaddvq_f64(vmulq_f64(v28, v35));
          double v37 = fmin(v30, v35.f64[0]);
          if (v35.f64[0] >= 0.0) {
            double v33 = v37;
          }
          float64x2_t v17 = vmlaq_n_f64(v36, v28, v33);
        }
        *uint64_t v7 = v9;
        float64x2_t *v14 = v17;
        if (v3 != (unsigned __int8 *)1) {
          goto LABEL_33;
        }
        return;
      }
    }
LABEL_71:
    __break(1u);
    return;
  }
LABEL_24:
  if (v3 != (unsigned __int8 *)1)
  {
LABEL_33:
    float64x2_t v38 = v8 + 1;
    float64x2_t v39 = v7 + 2;
    uint64_t v40 = 8;
    do
    {
      if (v5 <= v40 - 6 || v5 <= v40 - 5 || v5 <= v40 - 2 || v5 <= v40 - 1) {
        goto LABEL_71;
      }
      float64x2_t v42 = v39[-1];
      int v43 = *v38;
      if (v43 == 3)
      {
        if (v4 == (unsigned __int8 *)1) {
          unint64_t v47 = 0;
        }
        else {
          unint64_t v47 = v40;
        }
        if (v5 <= v47) {
          goto LABEL_71;
        }
        if (v5 <= (v47 | 1)) {
          goto LABEL_71;
        }
        uint64_t v48 = v47 | 2;
        if (v5 <= (v47 | 2) || v5 <= (v47 | 3)) {
          goto LABEL_71;
        }
        float64x2_t v49 = (float64x2_t *)((char *)v7 + 8 * v47);
        float64x2_t v50 = *(float64x2_t *)((char *)v7 + 8 * v48);
        double v51 = vpmaxq_f64(vabdq_f64(v50, v42));
        if (v51 == 0.0)
        {
          float64x2_t v52 = v39[-1];
        }
        else
        {
          float64x2_t v58 = vsubq_f64(v50, v42);
          float64x2_t v59 = vdivq_f64(v58, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v51, 0));
          float64x2_t v60 = vmulq_n_f64(v59, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v59, v59))));
          double v61 = vaddvq_f64(vmulq_f64(v60, vsubq_f64(*v39, v42)));
          double v62 = sqrt(vaddvq_f64(vmulq_f64(v58, v58)));
          double v63 = fmin(v62, v61);
          if (v61 >= 0.0) {
            double v64 = v63;
          }
          else {
            double v64 = 0.0;
          }
          float64x2_t v65 = vsubq_f64(*v49, v42);
          float64x2_t v42 = vmlaq_n_f64(v42, v60, v64);
          double v66 = vaddvq_f64(vmulq_f64(v60, v65));
          double v67 = fmin(v62, v66);
          if (v66 >= 0.0) {
            double v68 = v67;
          }
          else {
            double v68 = 0.0;
          }
          float64x2_t v52 = vmlaq_n_f64(v39[-1], v60, v68);
        }
        *float64x2_t v39 = v42;
        *float64x2_t v49 = v52;
      }
      else
      {
        float64x2_t v44 = v39[1];
        if (v43 == 2)
        {
          double v41 = vpmaxq_f64(vabdq_f64(v44, v42));
          if (v41 != 0.0)
          {
            float64x2_t v53 = vsubq_f64(v44, v42);
            float64x2_t v54 = vdivq_f64(v53, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v41, 0));
            float64x2_t v55 = vmulq_n_f64(v54, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v54, v54))));
            double v56 = vaddvq_f64(vmulq_f64(vsubq_f64(*v39, v42), v55));
            double v57 = fmin(sqrt(vaddvq_f64(vmulq_f64(v53, v53))), v56);
            if (v56 < 0.0) {
              double v57 = 0.0;
            }
            float64x2_t v42 = vmlaq_n_f64(v42, v55, v57);
          }
        }
        else
        {
          if (*v38) {
            goto LABEL_36;
          }
          if (v39->f64[0] <= 1.0) {
            double v45 = v39->f64[0];
          }
          else {
            double v45 = 1.0;
          }
          if (v39->f64[0] >= 0.0) {
            double v46 = v45;
          }
          else {
            double v46 = 0.0;
          }
          float64x2_t v42 = vmlaq_n_f64(v42, vsubq_f64(v44, v42), v46);
        }
        *float64x2_t v39 = v42;
      }
LABEL_36:
      ++v38;
      v40 += 4;
      v39 += 2;
      --v4;
    }
    while (v4);
  }
}

void HVF::PartTransformRenderer::blendComposite(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = *(unsigned int *)(a2 + 32);
  if (*(void *)(a3 + 8) < v3) {
    goto LABEL_31;
  }
  uint64_t v7 = *(double **)a3;
  unint64_t v8 = (double **)(a1 + 376);
  float64x2_t v9 = *(double **)(a1 + 376);
  unint64_t v10 = (uint64_t)(*(void *)(a1 + 384) - (void)v9) >> 3;
  if (2 * v3 <= v10)
  {
    if (2 * v3 < v10) {
      *(void *)(a1 + 384) = &v9[2 * v3];
    }
  }
  else
  {
    sub_21041CA30(a1 + 376, 2 * v3 - v10);
    float64x2_t v9 = *v8;
  }
  if (v3)
  {
    uint64_t v11 = 8 * v3;
    do
    {
      if (*v7 >= 0.0)
      {
        *float64x2_t v9 = 0.0;
        double v12 = *v7;
      }
      else
      {
        *float64x2_t v9 = -*v7;
        double v12 = 0.0;
      }
      v9[1] = v12;
      v9 += 2;
      ++v7;
      v11 -= 8;
    }
    while (v11);
  }
  unint64_t v13 = *(unsigned int *)(a2 + 32);
  unint64_t v14 = *(void *)(a3 + 8);
  unint64_t v15 = v14 - v13;
  if (v14 < v13
    || (unint64_t v16 = (*(_DWORD *)(a2 + 44) - v13), v15 < v16)
    || (uint64_t v17 = *(void *)(a3 + 24)) == 0
    || (unint64_t v18 = (*(_DWORD *)(a2 + 40) - 1), v17 - 1 < v18))
  {
LABEL_31:
    __break(1u);
    return;
  }
  uint64_t v19 = *(void *)a3 + 8 * v13;
  v39[0] = *(void *)(a3 + 16) + 96;
  v39[1] = v18;
  uint64_t v20 = *(void *)(a2 + 96);
  if (v20)
  {
    float64x2_t v21 = *(unsigned __int16 **)(a2 + 88);
    float64x2_t v22 = *(float **)(a2 + 120);
    uint64_t v23 = 2 * v20;
    do
    {
      unint64_t v24 = *v21;
      if (v24 >= v16) {
        goto LABEL_31;
      }
      ++v21;
      float v25 = *v22++;
      *(double *)(v19 + 8 * v24) = *(double *)(v19 + 8 * v24) + v25;
      v23 -= 2;
    }
    while (v23);
  }
  uint64_t v26 = *(void *)(a2 + 112);
  if (v26)
  {
    float64x2_t v27 = *(float **)(a2 + 136);
    float64x2_t v28 = *(unsigned __int16 **)(a2 + 104);
    double v29 = &v28[v26];
    double v30 = *(unsigned __int16 **)(a2 + 72);
    double v31 = *v8;
    double v32 = 0.0;
    double v33 = v27;
    double v34 = v28;
    do
    {
      if (*v30 == v34 - v28)
      {
        ++v30;
        double v37 = *v31++;
        double v32 = v37;
        if (v37 == 0.0)
        {
          uint64_t v38 = *v30;
          double v34 = &v28[v38];
          double v33 = &v27[v38];
        }
      }
      else
      {
        unint64_t v35 = *v34;
        if (v35 >= v16) {
          goto LABEL_31;
        }
        ++v34;
        float v36 = *v33++;
        *(double *)(v19 + 8 * v35) = *(double *)(v19 + 8 * v35) + v32 * v36;
      }
    }
    while (v34 != v29);
  }
  if (*(void *)(a2 + 192) | *(void *)(a2 + 256)) {
    HVF::PartTransformRenderer::blendTransforms(a1, (void *)a2, v39);
  }
  else {
    HVF::PartTransformRenderer::blendTranslations(a1, (void *)a2, v39);
  }
}

uint64_t HVF::PartTransformRenderer::blendTranslations(uint64_t result, void *a2, void *a3)
{
  unint64_t v3 = (unsigned __int16 *)a2[19];
  uint64_t v4 = &v3[a2[20]];
  unint64_t v5 = (float32x2_t *)a2[21];
  unint64_t v6 = &v5[a2[22]];
  uint64_t v7 = (unsigned int *)a2[27];
  unint64_t v8 = &v7[a2[28]];
  float64x2_t v9 = (float32x2_t *)a2[29];
  unint64_t v10 = &v9[a2[30]];
  int v45 = -1;
  float64x2_t v12 = (float64x2_t)xmmword_26AA45960;
  float64x2_t v11 = *(float64x2_t *)algn_26AA45970;
  float64x2_t v14 = (float64x2_t)xmmword_26AA45980;
  float64x2_t v13 = (float64x2_t)unk_26AA45990;
  float64x2_t v16 = (float64x2_t)xmmword_26AA459A0;
  float64x2_t v15 = qword_26AA459B0;
  float64x2_t v19 = (float64x2_t)vdupq_lane_s64(xmmword_26AA459A0, 0);
  float64x2_t v17 = (float64x2_t)vextq_s8((int8x16_t)v16, (int8x16_t)v16, 8uLL);
  float64x2_t v20 = (float64x2_t)vdupq_laneq_s64((int64x2_t)xmmword_26AA459A0, 1);
  float64x2_t v21 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&qword_26AA459B0.f64[0], 0);
  int32x2_t v18 = vdup_n_s32(0x7FC00000u);
  *(void *)&v19.f64[1] = vextq_s8((int8x16_t)v19, (int8x16_t)v19, 8uLL).u64[0];
  *(void *)&v20.f64[1] = vextq_s8((int8x16_t)v20, (int8x16_t)v20, 8uLL).u64[0];
  *(void *)&v21.f64[1] = vextq_s8((int8x16_t)v21, (int8x16_t)v21, 8uLL).u64[0];
  while (1)
  {
    LODWORD(v33) = 0xFFFF;
    if (v3 != v4 && v5 != v6) {
      LODWORD(v33) = *v3;
    }
    BOOL v34 = v9 == v10 || v7 == v8;
    unint64_t v35 = v34 ? &v45 : (int *)v7;
    unsigned int v36 = *(unsigned __int16 *)v35;
    unint64_t v33 = v33 >= v36 ? v36 : v33;
    if (a3[1] <= v33) {
      return result;
    }
    if (v3 == v4)
    {
      float64x2_t v37 = 0uLL;
      unint64_t v3 = v4;
    }
    else
    {
      if (v5 != v6)
      {
        float64x2_t v37 = 0uLL;
        if (v33 != *v3) {
          goto LABEL_24;
        }
        float32x2_t v38 = *v5++;
        float32x2_t v39 = v38;
        ++v3;
        goto LABEL_36;
      }
      float64x2_t v37 = 0uLL;
      unint64_t v5 = v6;
    }
    float32x2_t v39 = (float32x2_t)v18;
    if (v33 != 0xFFFF)
    {
LABEL_24:
      if (v7 != v8) {
        goto LABEL_25;
      }
LABEL_30:
      if (v33 == 0xFFFF)
      {
        unsigned int v40 = -1;
        uint64_t v7 = v8;
        goto LABEL_32;
      }
      uint64_t v7 = v8;
      goto LABEL_3;
    }
LABEL_36:
    float64x2_t v37 = vcvtq_f64_f32(v39);
    if (v7 == v8) {
      goto LABEL_30;
    }
LABEL_25:
    while (v9 != v10)
    {
      unsigned int v40 = *v7;
      if (v33 != (unsigned __int16)*v7) {
        goto LABEL_3;
      }
      float32x2_t v41 = *v9++;
      float32x2_t v42 = v41;
      ++v7;
LABEL_33:
      unint64_t v43 = HIWORD(v40);
      uint64_t v44 = *(void *)(result + 376);
      if (v43 >= (*(void *)(result + 384) - v44) >> 3)
      {
        __break(1u);
        return result;
      }
      float64x2_t v37 = vmlaq_n_f64(v37, vcvtq_f64_f32(v42), *(double *)(v44 + 8 * v43));
      if (v7 == v8) {
        goto LABEL_30;
      }
    }
    if (v33 == 0xFFFF)
    {
      unsigned int v40 = -1;
      float64x2_t v9 = v10;
LABEL_32:
      float32x2_t v42 = (float32x2_t)v18;
      goto LABEL_33;
    }
    float64x2_t v9 = v10;
LABEL_3:
    uint64_t v22 = *a3 + 96 * v33;
    float64x2_t v23 = *(float64x2_t *)(v22 + 16);
    float64x2_t v25 = *(float64x2_t *)(v22 + 32);
    float64x2_t v24 = *(float64x2_t *)(v22 + 48);
    float64x2_t v26 = *(float64x2_t *)(v22 + 64);
    float64x2_t v27 = *(float64x2_t *)(v22 + 80);
    float64x2_t v28 = (float64x2_t)vdupq_laneq_s64((int64x2_t)v37, 1);
    float64x2_t v29 = vaddq_f64(v11, v37);
    float64x2_t v30 = vaddq_f64(v13, v28);
    float64x2_t v31 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*(float64x2_t *)v22, v14.f64[0]), v25, v14, 1), v26, v30.f64[0]);
    float64x2_t v32 = vmlaq_f64(vmulq_f64(v19, *(float64x2_t *)v22), v20, v25);
    *(float64x2_t *)uint64_t v22 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*(float64x2_t *)v22, v12.f64[0]), v25, v12, 1), v26, v29.f64[0]);
    *(float64x2_t *)(v22 + 16) = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v12, v23), v24, v12, 1), v29, v27);
    *(float64x2_t *)(v22 + 32) = v31;
    *(float64x2_t *)(v22 + 48) = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v14, v23), v24, v14, 1), v30, v27);
    *(float64x2_t *)(v22 + 64) = vmlaq_f64(v32, v21, v26);
    *(float64x2_t *)(v22 + 80) = vmlaq_f64(vmlaq_f64(vmulq_f64(v16, v23), v17, v24), v15, v27);
  }
}

void HVF::PartTransformRenderer::blendTransforms(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a1;
  unint64_t v5 = (unsigned __int16 *)a2[23];
  unint64_t v6 = &v5[a2[24]];
  uint64_t v7 = (float *)a2[25];
  unint64_t v8 = &v7[a2[26]];
  int v202 = 2143289344;
  v162 = (unsigned __int16 *)a2[19];
  float64x2_t v9 = &v162[a2[20]];
  v161 = (_DWORD *)a2[21];
  v157 = &v161[2 * a2[22]];
  v158 = v8;
  uint64_t v10 = a2[31] + 4 * a2[32];
  v166 = (uint64_t *)a2[31];
  v197 = v166;
  uint64_t v198 = v10;
  uint64_t v11 = a2[33] + 4 * a2[34];
  v165 = (float *)a2[33];
  v199 = v165;
  uint64_t v200 = v11;
  uint64_t v201 = 0x7FC00000FFFFFFFFLL;
  uint64_t v12 = a2[27] + 4 * a2[28];
  v164 = (int *)a2[27];
  uint64_t v13 = a2[29] + 8 * a2[30];
  float64x2_t v14 = (float64x2_t)xmmword_26AA45960;
  float64x2_t v15 = *(float64x2_t *)algn_26AA45970;
  float64x2_t v16 = (float64x2_t)xmmword_26AA45980;
  float64x2_t v17 = (float64x2_t)unk_26AA45990;
  float64x2_t v18 = (float64x2_t)xmmword_26AA459A0;
  float64x2_t v19 = qword_26AA459B0;
  float64x2_t v20 = (float64x2_t)vextq_s8((int8x16_t)v16, (int8x16_t)v16, 8uLL);
  float64x2_t v21 = (float64x2_t)vextq_s8((int8x16_t)v18, (int8x16_t)v18, 8uLL);
  int8x16_t v22 = (int8x16_t)vdupq_lane_s64(xmmword_26AA459A0, 0);
  float64x2_t v23 = (float64x2_t)vextq_s8(v22, v22, 8uLL);
  int8x16_t v24 = (int8x16_t)vdupq_laneq_s64((int64x2_t)xmmword_26AA459A0, 1);
  int8x16_t v25 = vextq_s8(v24, v24, 8uLL);
  int8x16_t v26 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&qword_26AA459B0.f64[0], 0);
  float64x2_t v27 = (float64x2_t)vextq_s8(v26, v26, 8uLL);
  v163 = (float *)a2[29];
  int v195 = -1;
  *(void *)&v28.f64[0] = xmmword_26AA45960;
  *(void *)&v29.f64[0] = xmmword_26AA45980;
  *(void *)&v33.f64[0] = xmmword_26AA459A0;
  *(void *)&v30.f64[0] = v22.i64[0];
  *(void *)&v31.f64[0] = v24.i64[0];
  *(void *)&v32.f64[0] = v26.i64[0];
  int32x2_t v196 = vdup_n_s32(0x7FC00000u);
  *(void *)&v28.f64[1] = vextq_s8((int8x16_t)v14, (int8x16_t)v14, 8uLL).u64[0];
  v29.f64[1] = v20.f64[0];
  float64x2_t v152 = v29;
  float64x2_t v153 = v28;
  v33.f64[1] = v21.f64[0];
  v30.f64[1] = v23.f64[0];
  float64x2_t v150 = v30;
  float64x2_t v151 = v33;
  *(void *)&v31.f64[1] = v25.i64[0];
  v32.f64[1] = v27.f64[0];
  float64x2_t v148 = v32;
  float64x2_t v149 = v31;
  *(void *)&v34.f64[0] = xmmword_26AA459A0;
  v34.f64[1] = v21.f64[0];
  float64_t v176 = v23.f64[0];
  float64_t v177 = *(double *)v22.i64;
  v22.i64[1] = *(void *)&v23.f64[0];
  float64x2_t v169 = (float64x2_t)v22;
  float64x2_t v170 = v34;
  float64x2_t v174 = (float64x2_t)v25;
  float64_t v175 = *(double *)v24.i64;
  v24.i64[1] = v25.i64[0];
  float64_t v172 = v27.f64[0];
  float64_t v173 = *(double *)v26.i64;
  v26.i64[1] = *(void *)&v27.f64[0];
  float64x2_t v167 = (float64x2_t)v26;
  float64x2_t v168 = (float64x2_t)v24;
  v155 = v6;
  v156 = a3;
  v154 = v9;
  float64x2_t v184 = *(float64x2_t *)algn_26AA45970;
  long long v185 = xmmword_26AA45960;
  float64x2_t v182 = (float64x2_t)unk_26AA45990;
  long long v183 = xmmword_26AA45980;
  float64x2_t v180 = qword_26AA459B0;
  long long v181 = xmmword_26AA459A0;
  float64x2_t v178 = v21;
LABEL_3:
  BOOL v43 = v5 == v6 || v7 == v158;
  char v44 = v43;
  if (v43) {
    unsigned int v45 = 0xFFFF;
  }
  else {
    unsigned int v45 = *v5;
  }
  unsigned int v46 = 0xFFFF;
  if (v162 != v9 && v161 != v157) {
    unsigned int v46 = *v162;
  }
  unint64_t v47 = v166;
  if (v165 == (float *)v11 || v166 == (uint64_t *)v10) {
    unint64_t v47 = &v201;
  }
  unsigned int v49 = *(unsigned __int16 *)v47;
  float64x2_t v50 = v164;
  if (v163 == (float *)v13 || v164 == (int *)v12) {
    float64x2_t v50 = &v195;
  }
  unsigned int v52 = *(unsigned __int16 *)v50;
  if (v46 < v45) {
    unsigned int v45 = v46;
  }
  if (v49 < v45) {
    unsigned int v45 = v49;
  }
  if (v45 >= v52) {
    unint64_t v53 = v52;
  }
  else {
    unint64_t v53 = v45;
  }
  if (a3[1] > v53)
  {
    v54.f64[1] = 0.0;
    if (v5 == v6)
    {
      if (v53 != 0xFFFF)
      {
        unint64_t v5 = v6;
        goto LABEL_41;
      }
    }
    else
    {
      if (v7 != v158)
      {
        float64x2_t v55 = v7;
        if (v53 == *v5) {
          goto LABEL_43;
        }
LABEL_41:
        float64x2_t v56 = v14;
        float64x2_t v57 = v15;
        float64x2_t v58 = v16;
        float64x2_t v59 = v17;
        float64x2_t v60 = v18;
        float64x2_t v61 = v19;
        goto LABEL_47;
      }
      if (v53 != 0xFFFF)
      {
        uint64_t v7 = v158;
        goto LABEL_41;
      }
    }
    float64x2_t v55 = (float *)&v202;
LABEL_43:
    float64_t v62 = v172;
    v54.f64[0] = v173;
    v23.f64[0] = v19.f64[0];
    float64_t v63 = v174.f64[0];
    v20.f64[0] = v175;
    v27.f64[0] = v21.f64[0];
    float64_t v65 = v176;
    v64.f64[0] = v177;
    v33.f64[0] = v18.f64[0];
    float64x2_t v66 = v16;
    float64x2_t v67 = v17;
    float64x2_t v68 = v14;
    float64x2_t v69 = v15;
    if (*v55 != 0.0)
    {
      __double2 v70 = __sincos_stret(*v55 * 0.5);
      v20.f64[0] = v70.__cosval;
      v54.f64[0] = v70.__sinval;
      float64x2_t v21 = v178;
      float64x2_t v19 = v180;
      float64x2_t v18 = (float64x2_t)v181;
      float64x2_t v17 = v182;
      float64x2_t v16 = (float64x2_t)v183;
      float64x2_t v15 = v184;
      float64x2_t v14 = (float64x2_t)v185;
      v23.f64[0] = vmuld_n_f64(0.0, 0.0);
      double v71 = vmuld_lane_f64(0.0, (float64x2_t)0, 1);
      v27.f64[0] = v54.f64[0] * v54.f64[0];
      float64_t v72 = v20.f64[0] * v20.f64[0];
      v68.f64[0] = v20.f64[0] * v20.f64[0] - (v71 + v54.f64[0] * v54.f64[0]) + v23.f64[0];
      v67.f64[0] = v71;
      v66.f64[0] = v67.f64[0] + v54.f64[0] * v20.f64[0] + v67.f64[0] + v54.f64[0] * v20.f64[0];
      double v73 = vmuld_lane_f64(v70.__cosval, (float64x2_t)0, 1);
      v64.f64[0] = v54.f64[0] * 0.0 - v73 + v54.f64[0] * 0.0 - v73;
      float64_t v74 = v67.f64[0] - v54.f64[0] * v20.f64[0] + v67.f64[0] - v54.f64[0] * v20.f64[0];
      double v75 = v71 + v20.f64[0] * v20.f64[0] - (v54.f64[0] * v54.f64[0] + v23.f64[0]);
      v54.f64[0] = vmuld_lane_f64(v70.__sinval, (float64x2_t)0, 1);
      v20.f64[0] = v54.f64[0] + v20.f64[0] * 0.0 + v54.f64[0] + v20.f64[0] * 0.0;
      v69.f64[0] = v70.__sinval * 0.0 + v73 + v70.__sinval * 0.0 + v73;
      v67.f64[0] = v54.f64[0] - v70.__cosval * 0.0 + v54.f64[0] - v70.__cosval * 0.0;
      v54.f64[0] = v27.f64[0] + v72 - (v23.f64[0] + v71);
      v68.f64[1] = v74;
      float64_t v62 = v54.f64[0];
      v23.f64[0] = v54.f64[0];
      v66.f64[1] = v75;
      float64_t v63 = v20.f64[0];
      v27.f64[0] = v20.f64[0];
      float64_t v65 = v64.f64[0];
      v33.f64[0] = v64.f64[0];
    }
    float64x2_t v56 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v153, v68.f64[0]), v152, v68, 1), v151, v69.f64[0]);
    float64x2_t v57 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v68, v15), v17, v68, 1), v69, v19);
    float64x2_t v58 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v153, v66.f64[0]), v152, v66, 1), v151, v67.f64[0]);
    float64x2_t v59 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v66, v15), v17, v66, 1), v67, v19);
    v64.f64[1] = v65;
    v20.f64[1] = v63;
    v54.f64[1] = v62;
    float64x2_t v60 = vmlaq_f64(vmlaq_f64(vmulq_f64(v64, v153), v20, v152), v54, v151);
    float64x2_t v61 = vmlaq_f64(vmlaq_f64(vmulq_f64(v33, v15), v27, v17), v23, v19);
    if ((v44 & 1) == 0)
    {
      ++v5;
      ++v7;
    }
LABEL_47:
    v159 = v7;
    v160 = v5;
    if (v162 == v9)
    {
      if (v53 == 0xFFFF)
      {
        LODWORD(v54.f64[0]) = 2143289344;
        LODWORD(v20.f64[0]) = 2143289344;
        v162 = v9;
LABEL_58:
        v20.f64[0] = *(float *)v20.f64;
        float64x2_t v77 = vaddq_f64(v20, v15);
        v54.f64[0] = *(float *)v54.f64;
        float64x2_t v78 = vaddq_f64(v17, v54);
        float64x2_t v79 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v16, v57), v59, v16, 1), v78, v61);
        float64x2_t v80 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v56, v16.f64[0]), v58, v16, 1), v60, v78.f64[0]);
        float64x2_t v81 = vmlaq_f64(vmulq_f64(v18, v57), v21, v59);
        float64x2_t v82 = vmlaq_f64(vmlaq_f64(vmulq_f64(v150, v56), v149, v58), v148, v60);
        float64x2_t v56 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v56, v14.f64[0]), v58, v14, 1), v60, v77.f64[0]);
        float64x2_t v57 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v14, v57), v59, v14, 1), v77, v61);
        float64x2_t v58 = v80;
        float64x2_t v59 = v79;
        float64x2_t v60 = v82;
        float64x2_t v61 = vmlaq_f64(v81, v19, v61);
        goto LABEL_59;
      }
      v162 = v9;
    }
    else if (v161 == v157)
    {
      if (v53 == 0xFFFF)
      {
        LODWORD(v54.f64[0]) = 2143289344;
        LODWORD(v20.f64[0]) = 2143289344;
        long long v76 = v157;
        goto LABEL_57;
      }
      v161 = v157;
    }
    else if (v53 == *v162)
    {
      LODWORD(v20.f64[0]) = *v161;
      LODWORD(v54.f64[0]) = v161[1];
      long long v76 = v161 + 2;
      ++v162;
LABEL_57:
      v161 = v76;
      goto LABEL_58;
    }
LABEL_59:
    long long v83 = v163;
    float64x2_t v84 = v164;
    v86 = v165;
    v85 = v166;
    while (1)
    {
      if (v86 == (float *)v11 || v85 == (uint64_t *)v10) {
        v99 = &v201;
      }
      else {
        v99 = v85;
      }
      if (v53 != *(unsigned __int16 *)v99)
      {
        BOOL v100 = v83 == (float *)v13 || v84 == (int *)v12;
        v101 = v100 ? &v195 : v84;
        if (v53 != *(unsigned __int16 *)v101)
        {
          a3 = v156;
          uint64_t v35 = *v156 + 96 * v53;
          float64x2_t v36 = *(float64x2_t *)(v35 + 16);
          float64x2_t v38 = *(float64x2_t *)(v35 + 32);
          float64x2_t v37 = *(float64x2_t *)(v35 + 48);
          float64x2_t v23 = *(float64x2_t *)(v35 + 64);
          float64x2_t v39 = *(float64x2_t *)(v35 + 80);
          float64x2_t v40 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v56, v36), v37, v56, 1), v57, v39);
          float64x2_t v27 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v58, v36), v37, v58, 1), v59, v39);
          float64x2_t v41 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*(float64x2_t *)v35, v58.f64[0]), v38, v58, 1), v23, v59.f64[0]);
          float64x2_t v42 = vmlaq_laneq_f64(vmulq_n_f64(*(float64x2_t *)v35, v60.f64[0]), v38, v60, 1);
          float64x2_t v20 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v60, v36), v37, v60, 1), v61, v39);
          *(float64x2_t *)uint64_t v35 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*(float64x2_t *)v35, v56.f64[0]), v38, v56, 1), v23, v57.f64[0]);
          *(float64x2_t *)(v35 + 16) = v40;
          *(float64x2_t *)(v35 + 32) = v41;
          *(float64x2_t *)(v35 + 48) = v27;
          *(float64x2_t *)(v35 + 64) = vmlaq_n_f64(v42, v23, v61.f64[0]);
          *(float64x2_t *)(v35 + 80) = v20;
          uint64_t v7 = v159;
          unint64_t v5 = v160;
          float64x2_t v9 = v154;
          unint64_t v6 = v155;
          float64x2_t v21 = v178;
          goto LABEL_3;
        }
      }
      if (v85 == (uint64_t *)v10 || v86 == (float *)v11)
      {
        unsigned int v103 = 0xFFFF;
        v102 = &v201;
        if (v53 != 0xFFFF)
        {
          if (v84 == (int *)v12) {
            goto LABEL_99;
          }
          goto LABEL_86;
        }
      }
      else
      {
        v102 = v85;
        if (v53 != *(unsigned __int16 *)v85)
        {
          unsigned int v103 = 0xFFFF;
          if (v84 == (int *)v12) {
            goto LABEL_99;
          }
          goto LABEL_86;
        }
      }
      unsigned int v103 = *((unsigned __int16 *)v102 + 1);
      if (v84 == (int *)v12) {
        goto LABEL_99;
      }
LABEL_86:
      if (v83 != (float *)v13)
      {
        v104 = v84;
        if (v53 != *(unsigned __int16 *)v84) {
          goto LABEL_100;
        }
        goto LABEL_88;
      }
LABEL_99:
      v104 = &v195;
      if (v53 != 0xFFFF)
      {
LABEL_100:
        if (v85 == (uint64_t *)v10) {
          goto LABEL_91;
        }
        goto LABEL_101;
      }
LABEL_88:
      unsigned int v105 = *((unsigned __int16 *)v104 + 1);
      if (v105 < v103) {
        unsigned int v103 = v105;
      }
      if (v85 == (uint64_t *)v10)
      {
LABEL_91:
        float v106 = 0.0;
        if (v53 == 0xFFFF)
        {
          float v106 = NAN;
          if (v103 != 0xFFFF) {
            float v106 = 0.0;
          }
        }
        v85 = (uint64_t *)v10;
        if (v84 == (int *)v12)
        {
LABEL_95:
          if ((v53 & v103) == 0xFFFF) {
            float v107 = NAN;
          }
          else {
            float v107 = 0.0;
          }
          float64x2_t v84 = (int *)v12;
          float v108 = v107;
          goto LABEL_119;
        }
        goto LABEL_110;
      }
LABEL_101:
      if (v86 == (float *)v11)
      {
        float v106 = NAN;
        if ((v53 & v103) != 0xFFFF) {
          float v106 = 0.0;
        }
        v86 = (float *)v11;
      }
      else
      {
        float v106 = 0.0;
        if (v53 == (unsigned __int16)*(_DWORD *)v85 && v103 == HIWORD(*(_DWORD *)v85))
        {
          float v109 = *v86++;
          float v106 = v109;
          v85 = (uint64_t *)((char *)v85 + 4);
          v197 = v85;
          v199 = v86;
          v165 = v86;
          v166 = v85;
          if (v84 == (int *)v12) {
            goto LABEL_95;
          }
          goto LABEL_110;
        }
      }
      if (v84 == (int *)v12) {
        goto LABEL_95;
      }
LABEL_110:
      if (v83 == (float *)v13)
      {
        if ((v53 & v103) == 0xFFFF) {
          float v107 = NAN;
        }
        else {
          float v107 = 0.0;
        }
        long long v83 = (float *)v13;
        float v108 = v107;
      }
      else
      {
        float v107 = 0.0;
        if (v53 == (unsigned __int16)*v84 && v103 == HIWORD(*v84))
        {
          float v107 = *v83;
          float v108 = v83[1];
          v83 += 2;
          ++v84;
          v163 = v83;
          v164 = v84;
        }
        else
        {
          float v108 = 0.0;
        }
      }
LABEL_119:
      uint64_t v110 = *(void *)(v4 + 376);
      if (v103 >= (unint64_t)((*(void *)(v4 + 384) - v110) >> 3))
      {
        __break(1u);
        return;
      }
      float64x2_t v91 = v18;
      float64x2_t v92 = v19;
      float64x2_t v93 = v16;
      float64x2_t v90 = v17;
      float64x2_t v94 = v14;
      float64x2_t v89 = v15;
      if (*(double *)(v110 + 8 * v103) != 0.0)
      {
        double v188 = *(double *)(v110 + 8 * v103);
        float64x2_t v189 = v56;
        float64x2_t v190 = v57;
        float64x2_t v191 = v60;
        float64x2_t v192 = v58;
        float64x2_t v193 = v59;
        float64x2_t v194 = v61;
        double v111 = remainder(v106, 6.28318531);
        if (fabs(v111) <= 2.22044605e-10)
        {
          v87.f64[1] = v108;
          v87.f64[0] = v107;
          float64x2_t v88 = vmulq_n_f64(v87, v188);
          float64x2_t v16 = (float64x2_t)v183;
          float64x2_t v15 = v184;
          float64x2_t v89 = vaddq_f64(v88, v184);
          float64x2_t v18 = (float64x2_t)v181;
          float64x2_t v17 = v182;
          float64x2_t v90 = vaddq_f64(v182, (float64x2_t)vdupq_laneq_s64((int64x2_t)v88, 1));
          float64x2_t v91 = (float64x2_t)v181;
          float64x2_t v19 = v180;
          float64x2_t v92 = v180;
          float64x2_t v93 = (float64x2_t)v183;
          float64x2_t v14 = (float64x2_t)v185;
          float64x2_t v94 = (float64x2_t)v185;
        }
        else
        {
          double v186 = v107;
          double v187 = v108;
          __double2 v112 = __sincos_stret(v111);
          int v113 = -(int)logb(fmax(vabdd_f64(1.0, v112.__cosval), fabs(v112.__sinval)));
          double v114 = scalbn(1.0 - v112.__cosval, v113);
          double v115 = scalbn(-v112.__sinval, v113);
          double v116 = v114 * v114 + v115 * v115;
          v117.f64[0] = scalbn((v114 * v186 + v115 * v187) / v116, v113);
          float64x2_t v179 = v117;
          long double v118 = scalbn(-(v115 * v186 - v114 * v187) / v116, v113);
          float64x2_t v119 = v179;
          float64x2_t v19 = v180;
          v3.f64[0] = v118;
          float64_t v120 = v179.f64[0];
          v123.f64[1] = v3.f64[0];
          float64x2_t v16 = (float64x2_t)v183;
          float64x2_t v15 = v184;
          float64x2_t v121 = vsubq_f64(v184, v123);
          float64x2_t v18 = (float64x2_t)v181;
          float64x2_t v17 = v182;
          float64x2_t v122 = vaddq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)vnegq_f64(v123), 1), v182);
          float64_t v124 = v172;
          v123.f64[0] = v173;
          v125.f64[0] = v180.f64[0];
          float64x2_t v33 = v174;
          v126.f64[0] = v175;
          v127.f64[0] = v177;
          float64x2_t v128 = v178;
          v129.f64[0] = v178.f64[0];
          float64_t v130 = v176;
          *(void *)&v131.f64[0] = v181;
          float64x2_t v132 = (float64x2_t)v183;
          float64x2_t v133 = v182;
          float64x2_t v14 = (float64x2_t)v185;
          float64x2_t v134 = (float64x2_t)v185;
          float64x2_t v135 = v184;
          if (v111 * v188 != 0.0)
          {
            __double2 v136 = __sincos_stret(v111 * v188 * 0.5);
            v126.f64[0] = v136.__cosval;
            v123.f64[0] = v136.__sinval;
            float64x2_t v119 = v179;
            float64x2_t v19 = v180;
            float64x2_t v128 = v178;
            float64x2_t v18 = (float64x2_t)v181;
            float64x2_t v17 = v182;
            float64x2_t v16 = (float64x2_t)v183;
            float64x2_t v15 = v184;
            float64x2_t v14 = (float64x2_t)v185;
            v125.f64[0] = vmuld_n_f64(0.0, 0.0);
            double v137 = vmuld_lane_f64(0.0, (float64x2_t)0, 1);
            float64_t v138 = v123.f64[0] * v123.f64[0];
            float64_t v139 = v126.f64[0] * v126.f64[0];
            v134.f64[0] = v126.f64[0] * v126.f64[0] - (v123.f64[0] * v123.f64[0] + v137) + v125.f64[0];
            v133.f64[0] = v137;
            v132.f64[0] = v133.f64[0] + v123.f64[0] * v126.f64[0] + v133.f64[0] + v123.f64[0] * v126.f64[0];
            v135.f64[0] = vmuld_lane_f64(v136.__cosval, (float64x2_t)0, 1);
            v127.f64[0] = v123.f64[0] * 0.0 - v135.f64[0] + v123.f64[0] * 0.0 - v135.f64[0];
            v129.f64[0] = v133.f64[0] - v123.f64[0] * v126.f64[0] + v133.f64[0] - v123.f64[0] * v126.f64[0];
            v131.f64[0] = v137 + v126.f64[0] * v126.f64[0] - (v125.f64[0] + v123.f64[0] * v123.f64[0]);
            v123.f64[0] = vmuld_lane_f64(v136.__sinval, (float64x2_t)0, 1);
            v126.f64[0] = v123.f64[0] + v126.f64[0] * 0.0 + v123.f64[0] + v126.f64[0] * 0.0;
            v135.f64[0] = v136.__sinval * 0.0 + v135.f64[0] + v136.__sinval * 0.0 + v135.f64[0];
            v133.f64[0] = v123.f64[0] - v136.__cosval * 0.0 + v123.f64[0] - v136.__cosval * 0.0;
            v123.f64[0] = v138 + v139 - (v137 + v125.f64[0]);
            v134.f64[1] = v129.f64[0];
            float64_t v124 = v123.f64[0];
            v125.f64[0] = v123.f64[0];
            v132.f64[1] = v131.f64[0];
            v33.f64[0] = v126.f64[0];
            v129.f64[0] = v126.f64[0];
            float64_t v130 = v127.f64[0];
            v131.f64[0] = v127.f64[0];
          }
          float64x2_t v140 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v134, v121), v122, v134, 1), v135, v19);
          float64x2_t v141 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v14, v134.f64[0]), v16, v134, 1), v170, v135.f64[0]);
          float64x2_t v142 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v14, v132.f64[0]), v16, v132, 1), v170, v133.f64[0]);
          float64x2_t v143 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v132, v121), v122, v132, 1), v133, v19);
          v127.f64[1] = v130;
          v126.f64[1] = v33.f64[0];
          v123.f64[1] = v124;
          float64x2_t v144 = vmlaq_f64(vmlaq_f64(vmulq_f64(v127, v14), v126, v16), v123, v170);
          float64x2_t v145 = vmlaq_f64(vmlaq_f64(vmulq_f64(v131, v121), v129, v122), v125, v19);
          float64x2_t v146 = vaddq_f64(v119, v15);
          float64x2_t v147 = vaddq_f64(v3, v17);
          float64x2_t v94 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v141, v14.f64[0]), v142, v14, 1), v144, v146.f64[0]);
          float64x2_t v89 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v140, v14), v143, v14, 1), v146, v145);
          float64x2_t v93 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v141, v16.f64[0]), v142, v16, 1), v144, v147.f64[0]);
          float64x2_t v90 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v140, v16), v143, v16, 1), v147, v145);
          float64x2_t v91 = vmlaq_f64(vmlaq_f64(vmulq_f64(v141, v169), v168, v142), v167, v144);
          float64x2_t v92 = vmlaq_f64(vmlaq_f64(vmulq_f64(v140, v18), v128, v143), v19, v145);
          uint64_t v4 = a1;
        }
        float64x2_t v59 = v193;
        float64x2_t v61 = v194;
        float64x2_t v60 = v191;
        float64x2_t v58 = v192;
        float64x2_t v56 = v189;
        float64x2_t v57 = v190;
      }
      float64x2_t v95 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v56, v89), v90, v56, 1), v57, v92);
      float64x2_t v96 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v58, v89), v90, v58, 1), v59, v92);
      float64x2_t v56 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v94, v56.f64[0]), v93, v56, 1), v91, v57.f64[0]);
      float64x2_t v57 = v95;
      float64x2_t v97 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v60, v89), v90, v60, 1), v61, v92);
      float64x2_t v58 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v94, v58.f64[0]), v93, v58, 1), v91, v59.f64[0]);
      float64x2_t v59 = v96;
      float64x2_t v60 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v94, v60.f64[0]), v93, v60, 1), v91, v61.f64[0]);
      float64x2_t v61 = v97;
    }
  }
}

BOOL HVF::PartTransformRenderer::render(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  long long v13 = 0u;
  long long v14 = 0u;
  v12[0] = a2;
  v12[1] = a6;
  int v10 = (*(uint64_t (**)(uint64_t, void, void *))(a5 + 16))(a5, 0, v12);
  if (v10 == 2) {
    return 0;
  }
  if (!v10 && ((*(uint64_t (**)(void *))(*a3 + 32))(a3) & 1) == 0)
  {
    if ((*(unsigned int (**)(void *))(*a3 + 16))(a3))
    {
      if ((HVF::PartTransformRenderer::renderComposite((uint64_t)a1, a3, a4, a5) & 1) == 0) {
        return 0;
      }
    }
    else
    {
      BOOL result = HVF::PartTransformRenderer::renderShape(a1, a3, (uint64_t)a4, a5);
      if (!result) {
        return result;
      }
    }
  }
  (*(void (**)(uint64_t, uint64_t, void *))(a5 + 16))(a5, 8, v12);
  return 1;
}

void HVF::PartTransformRenderer::~PartTransformRenderer(HVF::PartTransformRenderer *this)
{
  uint64_t v2 = (void *)*((void *)this + 50);
  if (v2)
  {
    *((void *)this + 51) = v2;
    operator delete(v2);
  }
  float64x2_t v3 = (void *)*((void *)this + 47);
  if (v3)
  {
    *((void *)this + 48) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 44);
  if (v4)
  {
    *((void *)this + 45) = v4;
    operator delete(v4);
  }
  unint64_t v5 = (void *)*((void *)this + 41);
  if (v5)
  {
    *((void *)this + 42) = v5;
    operator delete(v5);
  }
  unint64_t v6 = (void *)*((void *)this + 38);
  if (v6)
  {
    *((void *)this + 39) = v6;
    operator delete(v6);
  }
  uint64_t v7 = (void *)*((void *)this + 35);
  if (v7)
  {
    *((void *)this + 36) = v7;
    operator delete(v7);
  }
  *((void *)this + 24) = &unk_26C2849A8;
  sub_21041D99C(*((void **)this + 30));
  unint64_t v8 = (HVF::PartTransformRenderer *)*((void *)this + 28);
  if (v8 == (HVF::PartTransformRenderer *)((char *)this + 200))
  {
    (*(void (**)(char *))(*((void *)this + 25) + 32))((char *)this + 200);
  }
  else if (v8)
  {
    (*(void (**)(HVF::PartTransformRenderer *))(*(void *)v8 + 40))(v8);
  }
  HVF::PartTransform::~PartTransform(this);
}

BOOL sub_2104231F0(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t Util::StackMemResource::do_deallocate(uint64_t this, char *a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(this + 16);
  if (v3)
  {
    if (v3 > (unint64_t)a2) {
      return (*(uint64_t (**)(void))(**(void **)(this + 8) + 24))(*(void *)(this + 8));
    }
  }
  else
  {
    unint64_t v3 = *(void *)(this + 40) + *(void *)(this + 32) - *(void *)(this + 24);
    if (v3 > (unint64_t)a2) {
      return (*(uint64_t (**)(void))(**(void **)(this + 8) + 24))(*(void *)(this + 8));
    }
  }
  if (!a2 || v3 + *(void *)(this + 24) < (unint64_t)a2) {
    return (*(uint64_t (**)(void))(**(void **)(this + 8) + 24))(*(void *)(this + 8));
  }
  if (&a2[a3] == *(char **)(this + 40))
  {
    *(void *)(this + 32) += a3;
    *(void *)(this + 40) = a2;
  }
  return this;
}

char *Util::StackMemResource::do_allocate(size_t *__ptr, size_t __sz, size_t __align)
{
  unint64_t v6 = (void **)(__ptr + 5);
  if (!__ptr[5])
  {
    uint64_t v7 = (void *)__ptr[3];
    if (v7)
    {
      uint64_t v8 = (*(uint64_t (**)(size_t, void *, uint64_t))(*(void *)__ptr[1] + 16))(__ptr[1], v7, 8);
      __ptr[2] = v8;
      __ptr[4] = __ptr[3];
      __ptr[5] = v8;
    }
  }
  BOOL result = (char *)std::align(__align, __sz, v6, __ptr + 4);
  if (!result) {
    return (char *)(*(uint64_t (**)(size_t, size_t, size_t))(*(void *)__ptr[1] + 16))(__ptr[1], __sz, __align);
  }
  *unint64_t v6 = &result[__sz];
  __ptr[4] -= __sz;
  return result;
}

void Util::StackMemResource::~StackMemResource(Util::StackMemResource *this)
{
  *(void *)this = &unk_26C284C00;
  uint64_t v2 = (_OWORD *)((char *)this + 16);
  uint64_t v1 = *((void *)this + 2);
  if (v1) {
    (*(void (**)(void, uint64_t, void, uint64_t))(**((void **)this + 1) + 24))(*((void *)this + 1), v1, *((void *)this + 3), 8);
  }
  *uint64_t v2 = 0u;
  v2[1] = 0u;
  JUMPOUT(0x21056E760);
}

{
  uint64_t v1;
  _OWORD *v2;

  *(void *)this = &unk_26C284C00;
  uint64_t v2 = (_OWORD *)((char *)this + 16);
  uint64_t v1 = *((void *)this + 2);
  if (v1) {
    (*(void (**)(void, uint64_t, void, uint64_t))(**((void **)this + 1) + 24))(*((void *)this + 1), v1, *((void *)this + 3), 8);
  }
  *uint64_t v2 = 0u;
  v2[1] = 0u;
}

{
  uint64_t v1;
  _OWORD *v2;

  *(void *)this = &unk_26C284C00;
  uint64_t v2 = (_OWORD *)((char *)this + 16);
  uint64_t v1 = *((void *)this + 2);
  if (v1) {
    (*(void (**)(void, uint64_t, void, uint64_t))(**((void **)this + 1) + 24))(*((void *)this + 1), v1, *((void *)this + 3), 8);
  }
  *uint64_t v2 = 0u;
  v2[1] = 0u;
}

void Util::MemoryResource::do_deallocate(Util::MemoryResource *this, void *__p)
{
}

void *Util::MemoryResource::do_allocate(Util::MemoryResource *this, size_t __sz)
{
  return operator new(__sz);
}

void Util::MemoryResource::~MemoryResource(Util::MemoryResource *this)
{
}

uint64_t Util::MemoryResource::defaultResource(Util::MemoryResource *this)
{
  if (atomic_load_explicit((atomic_ullong *volatile)&qword_2677377C0, memory_order_acquire) != -1)
  {
    uint64_t v4 = &v2;
    unint64_t v3 = &v4;
    std::__call_once(&qword_2677377C0, &v3, (void (__cdecl *)(void *))sub_210423550);
  }
  return qword_2677377C8;
}

void sub_210423550()
{
}

void *Util::getAllocStats(Util *this)
{
  return &unk_2677377D0;
}

void *Util::AllocStats::Bucket::printStats(void *this)
{
  if (*this)
  {
    uint64_t v1 = this;
    char v2 = (FILE **)MEMORY[0x263EF8348];
    fprintf((FILE *)*MEMORY[0x263EF8348], "allocs %6zd hiwater %6zd", *this, this[3]);
    if (v1[1]) {
      fprintf(*v2, " LEAKED %6zd bytes %6zd", v1[1], v1[2]);
    }
    unint64_t v3 = *v2;
    return (void *)fputc(10, v3);
  }
  return this;
}

double Util::AllocStats::Bucket::reset(Util::AllocStats::Bucket *this)
{
  double result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

uint64_t Util::AllocStats::bucketFor(uint64_t this, unint64_t a2, unint64_t a3)
{
  if (a2 > 0x3FF)
  {
    if (a3 < 5)
    {
      this += 32 * a3 + 81920;
      return this;
    }
  }
  else if (a3 < 5)
  {
    this += (a3 << 14) + 32 * (a2 >> 1);
    return this;
  }
  __break(1u);
  return this;
}

uint64_t Util::AllocStats::allocate(uint64_t this, unint64_t a2, unint64_t a3)
{
  if (a3 >= 2)
  {
    unsigned int v3 = 0;
    do
    {
      ++v3;
      BOOL v4 = a3 > 3;
      a3 >>= 1;
    }
    while (v4);
  }
  else
  {
    unsigned int v3 = 0;
  }
  if (a2 <= 0x3FF)
  {
    if (v3 < 5)
    {
      unint64_t v5 = (int64x2_t *)(this + ((unint64_t)v3 << 14) + 32 * (a2 >> 1));
      goto LABEL_10;
    }
LABEL_13:
    __break(1u);
    return this;
  }
  if (v3 >= 5) {
    goto LABEL_13;
  }
  unint64_t v5 = (int64x2_t *)(this + 32 * v3 + 81920);
LABEL_10:
  int64x2_t *v5 = vaddq_s64(*v5, vdupq_n_s64(1uLL));
  unint64_t v6 = v5[1].u64[1];
  unint64_t v7 = v5[1].i64[0] + a2;
  v5[1].i64[0] = v7;
  if (v6 < v7) {
    v5[1].i64[1] = v7;
  }
  return this;
}

uint64_t Util::AllocStats::deallocate(uint64_t this, unint64_t a2, unint64_t a3)
{
  if (a3 >= 2)
  {
    unsigned int v3 = 0;
    do
    {
      ++v3;
      BOOL v4 = a3 > 3;
      a3 >>= 1;
    }
    while (v4);
  }
  else
  {
    unsigned int v3 = 0;
  }
  if (a2 > 0x3FF)
  {
    if (v3 < 5)
    {
      uint64_t v5 = this + 32 * v3 + 81920;
      goto LABEL_10;
    }
  }
  else if (v3 < 5)
  {
    uint64_t v5 = this + ((unint64_t)v3 << 14) + 32 * (a2 >> 1);
LABEL_10:
    unint64_t v6 = *(void *)(v5 + 16) - a2;
    --*(void *)(v5 + 8);
    *(void *)(v5 + 16) = v6;
    return this;
  }
  __break(1u);
  return this;
}

uint64_t Util::AllocStats::printStats(Util::AllocStats *this)
{
  char v2 = (void *)((char *)this + 81920);
  unsigned int v3 = (void *)((char *)this + 0x8000);
  float64x2_t v16 = (char *)this + 0x8000;
  BOOL v4 = (FILE **)MEMORY[0x263EF8348];
  fwrite("Small sizes:\n", 0xDuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  uint64_t v5 = 0;
  unint64_t v6 = this;
  do
  {
    if (*(void *)v6)
    {
      fprintf(*v4, "align %2d size %6zd: ", 1, v5);
      if (*(void *)v6)
      {
        fprintf(*v4, "allocs %6zd hiwater %6zd", *(void *)v6, *((void *)v6 + 3));
        if (*((void *)v6 + 1)) {
          fprintf(*v4, " LEAKED %6zd bytes %6zd", *((void *)v6 + 1), *((void *)v6 + 2));
        }
        fputc(10, *v4);
      }
    }
    unint64_t v6 = (Util::AllocStats *)((char *)v6 + 32);
    v5 += 2;
  }
  while (v5 != 1024);
  uint64_t v7 = 0;
  uint64_t v8 = (void *)((char *)this + 0x4000);
  do
  {
    if (*v8)
    {
      fprintf(*v4, "align %2d size %6zd: ", 2, v7);
      if (*v8)
      {
        fprintf(*v4, "allocs %6zd hiwater %6zd", *v8, v8[3]);
        if (v8[1]) {
          fprintf(*v4, " LEAKED %6zd bytes %6zd", v8[1], v8[2]);
        }
        fputc(10, *v4);
      }
    }
    v8 += 4;
    v7 += 2;
  }
  while (v7 != 1024);
  for (uint64_t i = 0; i != 1024; i += 2)
  {
    if (*v3)
    {
      fprintf(*v4, "align %2d size %6zd: ", 4, i);
      if (*v3)
      {
        fprintf(*v4, "allocs %6zd hiwater %6zd", *v3, v3[3]);
        if (v3[1]) {
          fprintf(*v4, " LEAKED %6zd bytes %6zd", v3[1], v3[2]);
        }
        fputc(10, *v4);
      }
    }
    v3 += 4;
  }
  uint64_t v10 = 0;
  uint64_t v11 = v16 + 0x4000;
  do
  {
    if (*v11)
    {
      fprintf(*v4, "align %2d size %6zd: ", 8, v10);
      if (*v11)
      {
        fprintf(*v4, "allocs %6zd hiwater %6zd", *v11, v11[3]);
        if (v11[1]) {
          fprintf(*v4, " LEAKED %6zd bytes %6zd", v11[1], v11[2]);
        }
        fputc(10, *v4);
      }
    }
    v11 += 4;
    v10 += 2;
  }
  while (v10 != 1024);
  uint64_t v12 = 0;
  long long v13 = v16 + 0x8000;
  do
  {
    if (*v13)
    {
      fprintf(*v4, "align %2d size %6zd: ", 16, v12);
      if (*v13)
      {
        fprintf(*v4, "allocs %6zd hiwater %6zd", *v13, v13[3]);
        if (v13[1]) {
          fprintf(*v4, " LEAKED %6zd bytes %6zd", v13[1], v13[2]);
        }
        fputc(10, *v4);
      }
    }
    v13 += 4;
    v12 += 2;
  }
  while (v12 != 1024);
  uint64_t result = fprintf(*v4, "Large size (>%d):\n", 1024);
  if (*v2)
  {
    uint64_t result = fprintf(*v4, "align %2d: ", 1);
    if (*v2)
    {
      fprintf(*v4, "allocs %6zd hiwater %6zd", *v2, v2[3]);
      if (v2[1]) {
        fprintf(*v4, " LEAKED %6zd bytes %6zd", v2[1], v2[2]);
      }
      uint64_t result = fputc(10, *v4);
    }
  }
  if (v2[4])
  {
    uint64_t result = fprintf(*v4, "align %2d: ", 2);
    if (v2[4])
    {
      fprintf(*v4, "allocs %6zd hiwater %6zd", v2[4], v2[7]);
      if (v2[5]) {
        fprintf(*v4, " LEAKED %6zd bytes %6zd", v2[5], v2[6]);
      }
      uint64_t result = fputc(10, *v4);
    }
  }
  if (v2[8])
  {
    uint64_t result = fprintf(*v4, "align %2d: ", 4);
    if (v2[8])
    {
      fprintf(*v4, "allocs %6zd hiwater %6zd", v2[8], v2[11]);
      if (v2[9]) {
        fprintf(*v4, " LEAKED %6zd bytes %6zd", v2[9], v2[10]);
      }
      uint64_t result = fputc(10, *v4);
    }
  }
  if (v2[12])
  {
    uint64_t result = fprintf(*v4, "align %2d: ", 8);
    if (v2[12])
    {
      fprintf(*v4, "allocs %6zd hiwater %6zd", v2[12], v2[15]);
      if (v2[13]) {
        fprintf(*v4, " LEAKED %6zd bytes %6zd", v2[13], v2[14]);
      }
      uint64_t result = fputc(10, *v4);
    }
  }
  if (v2[16])
  {
    uint64_t result = fprintf(*v4, "align %2d: ", 16);
    if (v2[16])
    {
      fprintf(*v4, "allocs %6zd hiwater %6zd", v2[16], v2[19]);
      if (v2[17]) {
        fprintf(*v4, " LEAKED %6zd bytes %6zd", v2[17], v2[18]);
      }
      float64x2_t v15 = *v4;
      return fputc(10, v15);
    }
  }
  return result;
}

double Util::StackMemResource::reset(Util::StackMemResource *this)
{
  char v2 = (_OWORD *)((char *)this + 16);
  uint64_t v1 = *((void *)this + 2);
  if (v1) {
    (*(void (**)(void, uint64_t, void, uint64_t))(**((void **)this + 1) + 24))(*((void *)this + 1), v1, *((void *)this + 3), 8);
  }
  double result = 0.0;
  *char v2 = 0u;
  v2[1] = 0u;
  return result;
}

double Util::StackMemResource::reset(Util::StackMemResource *this, Util::MemoryResource *a2)
{
  uint64_t v5 = (_OWORD *)((char *)this + 16);
  uint64_t v4 = *((void *)this + 2);
  if (v4) {
    (*(void (**)(void, uint64_t, void, uint64_t))(**((void **)this + 1) + 24))(*((void *)this + 1), v4, *((void *)this + 3), 8);
  }
  double result = 0.0;
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  *((void *)this + 1) = a2;
  return result;
}

uint64_t Util::StackMemResource::reset(uint64_t this, uint64_t a2, byte *a3)
{
  uint64_t v5 = (void *)this;
  uint64_t v6 = *(void *)(this + 16);
  if (v6) {
    this = (*(uint64_t (**)(void, uint64_t, void, uint64_t))(**(void **)(this + 8) + 24))(*(void *)(this + 8), v6, *(void *)(this + 24), 8);
  }
  v5[2] = 0;
  v5[3] = a2;
  if (a3) {
    uint64_t v7 = a2;
  }
  else {
    uint64_t v7 = 0;
  }
  v5[4] = v7;
  v5[5] = a3;
  return this;
}

unint64_t Util::StackMemResource::owns(Util::StackMemResource *this, unint64_t a2)
{
  unint64_t v2 = *((void *)this + 2);
  if (v2)
  {
    if (v2 > a2) {
      return 0;
    }
  }
  else
  {
    unint64_t v2 = *((void *)this + 5) + *((void *)this + 4) - *((void *)this + 3);
    if (v2 > a2) {
      return 0;
    }
  }
  if (v2 + *((void *)this + 3) >= a2) {
    return a2;
  }
  else {
    return 0;
  }
}

uint64_t sub_210423F74(void *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  if ((*(uint64_t (**)(void *))(*a1 + 32))(a1) <= a2)
  {
LABEL_148:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v129 = a2;
      _os_log_error_impl(&dword_21041B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "HVF font: glyph index %lud out of range", buf, 0xCu);
      return 0;
    }
    return 0;
  }
  unint64_t v6 = a1[7];
  if (v6 <= a2) {
    goto LABEL_147;
  }
  uint64_t v7 = a1[6];
  uint64_t v8 = *(unsigned int *)(v7 + 4 * a2);
  if (v8) {
    return 0;
  }
  if (v6 <= a2 + 1)
  {
LABEL_147:
    __break(1u);
    goto LABEL_148;
  }
  unint64_t v9 = *(unsigned int *)(v7 + 4 * (a2 + 1)) - v8;
  if (v8 < (uint64_t)(4 * v6) || (uint64_t)v9 < 3) {
    return 0;
  }
  unint64_t v11 = v7 + v8;
  uint64_t v12 = a1[1] <= v11 && v9 + v11 <= a1[2] + a1[1] ? (uint16x4_t *)(v7 + v8) : 0;
  if (a1[1] > v11 || v9 + v11 > a1[2] + a1[1]) {
    return 0;
  }
  if ((v12->i16[0] & 1) == 0)
  {
    if (v9 < 8 || (v12 & 7) != 0) {
      return 0;
    }
    unint64_t v14 = a2;
    uint64_t v15 = v12->u16[1];
    uint64_t v16 = v12->u16[2];
    uint64_t v17 = v12->u16[3];
    uint64_t v18 = 2 * v16 + 8;
    uint64_t v19 = ((v18 + v17) & 7) != 0 ? ((v18 + v17) & 0x7FFF8) + 8 : v18 + v17;
    uint64_t v20 = v19 + 32 * v17;
    unint64_t v21 = v12->u16[1] * (unint64_t)(4 * v17);
    if (v20 + 16 * v21 != v9) {
      return 0;
    }
    uint64_t v22 = a3;
    float64x2_t v23 = v12 + 1;
    if (!v12->i16[2])
    {
      uint64_t v25 = 0;
      goto LABEL_106;
    }
    unint64_t v24 = 2 * v16 - 2;
    if (v24 >= 0x1E)
    {
      int64x2_t v75 = 0uLL;
      int64x2_t v76 = 0uLL;
      uint64_t v77 = (v24 >> 1) + 1;
      float64x2_t v78 = v12 + 3;
      unint64_t v79 = v77 & 0xFFFFFFFFFFFFFFF0;
      int64x2_t v80 = 0uLL;
      int64x2_t v81 = 0uLL;
      int64x2_t v82 = 0uLL;
      int64x2_t v83 = 0uLL;
      int64x2_t v84 = 0uLL;
      int64x2_t v85 = 0uLL;
      do
      {
        uint16x8_t v86 = *(uint16x8_t *)v78[-2].i8;
        uint32x4_t v87 = vmovl_u16(*(uint16x4_t *)v86.i8);
        uint32x4_t v88 = vmovl_high_u16(v86);
        uint32x4_t v89 = vmovl_u16(*v78);
        uint32x4_t v90 = vmovl_high_u16(*(uint16x8_t *)v78->i8);
        int64x2_t v81 = (int64x2_t)vaddw_high_u32((uint64x2_t)v81, v88);
        int64x2_t v80 = (int64x2_t)vaddw_u32((uint64x2_t)v80, *(uint32x2_t *)v88.i8);
        int64x2_t v76 = (int64x2_t)vaddw_high_u32((uint64x2_t)v76, v87);
        int64x2_t v75 = (int64x2_t)vaddw_u32((uint64x2_t)v75, *(uint32x2_t *)v87.i8);
        int64x2_t v85 = (int64x2_t)vaddw_high_u32((uint64x2_t)v85, v90);
        int64x2_t v84 = (int64x2_t)vaddw_u32((uint64x2_t)v84, *(uint32x2_t *)v90.i8);
        int64x2_t v83 = (int64x2_t)vaddw_high_u32((uint64x2_t)v83, v89);
        int64x2_t v82 = (int64x2_t)vaddw_u32((uint64x2_t)v82, *(uint32x2_t *)v89.i8);
        v78 += 4;
        v79 -= 16;
      }
      while (v79);
      uint64_t v25 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v82, v75), vaddq_s64(v84, v80)), vaddq_s64(vaddq_s64(v83, v76), vaddq_s64(v85, v81))));
      if (v77 == (v77 & 0xFFFFFFFFFFFFFFF0))
      {
LABEL_106:
        if (v25 == v17)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v22 + 16))(v22, v14);
          *(void *)(result + 32) = v15;
          *(void *)(result + 40) = v17;
          *(void *)(result + 48) = v23;
          *(void *)(result + 56) = v16;
          *(void *)(result + 64) = (char *)v12 + v18;
          *(void *)(result + 72) = v17;
          *(void *)(result + 80) = (char *)v12 + v19;
          *(void *)(result + 88) = 4 * v17;
          *(void *)(result + 96) = (char *)v12 + v20;
          *(void *)(result + 104) = 2 * v21;
          return result;
        }
        return 0;
      }
      int8x16_t v26 = (unsigned __int16 *)v23 + (v77 & 0xFFFFFFFFFFFFFFF0);
    }
    else
    {
      uint64_t v25 = 0;
      int8x16_t v26 = (unsigned __int16 *)&v12[1];
    }
    do
    {
      unsigned int v91 = *v26++;
      v25 += v91;
    }
    while (v26 != (unsigned __int16 *)((char *)v23 + 2 * v16));
    goto LABEL_106;
  }
  uint64_t result = 0;
  if ((v12 & 3) == 0 && v9 >= 0x24)
  {
    uint64_t v28 = v12->u16[1];
    uint64_t v29 = v12->u16[2];
    unsigned int v30 = v12->u16[3];
    uint64_t v31 = v12[1].u16[0];
    if (v28 > v31 || v29 >= v30) {
      return 0;
    }
    unint64_t v33 = 2 * v12->u16[1];
    unint64_t v34 = v31 - v28;
    if (!is_mul_ok(v31 - v28, v33)) {
      return 0;
    }
    uint64_t v35 = a3;
    unint64_t v36 = v12[1].u16[2];
    unint64_t v37 = v12[1].u16[3];
    uint64_t v38 = v12[2].u16[1];
    unint64_t v39 = v12[2].u16[2];
    unint64_t v40 = v12[2].u16[3];
    unint64_t v41 = v30 - 1;
    unint64_t v42 = v41 * (unint64_t)(2 * v28);
    BOOL v43 = v36 <= v34 && (int)v34 * (uint64_t)(2 * (int)v28) >= v37;
    BOOL v44 = v43 && v41 >= v12[2].u16[0];
    BOOL v45 = v44 && v41 >= v38;
    BOOL v46 = v45 && v42 >= v39;
    BOOL v47 = v46 && v42 >= v40;
    if (!v47 || 2 * (int)v31 < v12[1].u16[1]) {
      return 0;
    }
    uint64_t v49 = 8 * v29;
    unint64_t v50 = (unint64_t)v12 + v9;
    if ((unint64_t)&v12[v29] + 4 * v12[3].u16[0] > v50) {
      return 0;
    }
    uint64_t v127 = v12[2].u16[0];
    if (v12->i16[2])
    {
      double v51 = (uint16x4_t *)((char *)v12 + 4 * v12[3].u16[0]);
      do
      {
        unint64_t v52 = (unint64_t)*v51;
        if (a1[4] <= (unint64_t)v51->u32[0]) {
          return 0;
        }
        if (v41 <= WORD2(v52) || HIWORD(v52) >= v34) {
          return 0;
        }
        ++v51;
        v49 -= 8;
      }
      while (v49);
    }
    float64x2_t v54 = (_WORD *)v12 + 2 * v12[3].u16[1];
    unint64_t v55 = (unint64_t)&v54[v33 | 1];
    if (v55 > v50) {
      return 0;
    }
    uint64_t v123 = v33 | 1;
    float64_t v124 = (_WORD *)v12 + 2 * v12[3].u16[0];
    int v125 = v12[1].u16[1];
    uint64_t result = 0;
    if (v55 < (unint64_t)v12) {
      return result;
    }
    uint64_t v56 = 2 * v36;
    if (2 * v36 + v55 > v50) {
      return result;
    }
    uint64_t result = 0;
    unint64_t v57 = v55 + 2 * v36;
    if (v57 < (unint64_t)v12) {
      return result;
    }
    uint64_t v58 = 2 * v37;
    if (2 * v37 + v57 > v50) {
      return result;
    }
    if (v12[1].i16[2])
    {
      float64x2_t v59 = &v54[v33 | 1];
      while (*v59 < v34)
      {
        ++v59;
        v56 -= 2;
        if (!v56) {
          goto LABEL_71;
        }
      }
      return 0;
    }
LABEL_71:
    float64x2_t v60 = (unsigned __int16 *)(v55 + 2 * v36);
    if (v12[1].i16[3])
    {
      while (*v60 < v34)
      {
        ++v60;
        v58 -= 2;
        if (!v58) {
          goto LABEL_74;
        }
      }
      return 0;
    }
LABEL_74:
    if (v12->i16[1])
    {
      unsigned int v61 = 0;
      uint64_t v62 = 4 * v28;
      float64_t v63 = (unsigned __int16 *)v12 + 2 * v12[3].u16[1];
      do
      {
        unsigned int v64 = *v63;
        if (v64 > v37 || v64 < v61) {
          return 0;
        }
        ++v63;
        unsigned int v61 = v64;
        v62 -= 2;
      }
      while (v62);
    }
    if ((unsigned __int16)v54[2 * v12->u16[1]] != v37) {
      return 0;
    }
    if ((unint64_t)v12 + 4 * v12[3].u16[2] + 4 * v36 > v50) {
      return 0;
    }
    if ((unint64_t)v12 + 4 * v12[3].u16[3] + 4 * v37 > v50) {
      return 0;
    }
    unint64_t v66 = (unint64_t)&v12[v127] + 4 * v12[4].u16[0];
    if (v66 > v50) {
      return 0;
    }
    float64x2_t v121 = (_WORD *)v12 + 2 * v12[4].u16[0];
    float64x2_t v122 = (_WORD *)v12 + 2 * v12[3].u16[3];
    uint64_t result = 0;
    unint64_t v67 = v66 + 8 * v39;
    if (v67 < (unint64_t)v12) {
      return result;
    }
    unint64_t v126 = v66 + 8 * v39;
    if (v67 + 4 * v39 > v50) {
      return result;
    }
    float64x2_t v68 = (unsigned __int16 *)(v66 + 8 * v39);
    float64x2_t v69 = (unsigned __int16 *)(v126 + 4 * v39);
    if (v12[2].i16[2])
    {
      unint64_t v70 = 0;
      uint64_t v71 = -1;
      do
      {
        unint64_t v72 = *v68;
        if (v72 >= v41) {
          return 0;
        }
        unint64_t v73 = v68[1];
        if (v73 >= v33) {
          return 0;
        }
        if (v71 >= (uint64_t)v72 && (v71 != v72 || v70 >= v73)) {
          return 0;
        }
        v68 += 2;
        unint64_t v70 = v73;
        uint64_t v71 = v72;
      }
      while (v68 != v69);
    }
    uint64_t result = 0;
    if (v69 < (unsigned __int16 *)v12) {
      return result;
    }
    uint64_t v92 = 2 * v127;
    if ((unint64_t)&v69[v127] > v50) {
      return result;
    }
    if (v12[2].i16[0])
    {
      uint64_t v93 = -1;
      float64x2_t v94 = (unsigned __int16 *)(v126 + 4 * v39);
      do
      {
        uint64_t v95 = v93;
        uint64_t v93 = *v94;
        if (v93 >= v41 || v95 >= v93) {
          return 0;
        }
        ++v94;
        v92 -= 2;
      }
      while (v92);
    }
    float64x2_t v97 = (_WORD *)v12 + 2 * v12[4].u16[1];
    unint64_t v98 = (unint64_t)&v97[2 * v38];
    if (v98 > v50) {
      return 0;
    }
    uint64_t result = 0;
    if (v98 >= (unint64_t)v12 && 4 * v40 + v98 <= v50)
    {
      uint64_t result = 0;
      unint64_t v99 = v98 + 4 * v40;
      if (v99 >= (unint64_t)v12 && 4 * v40 + v99 <= v50)
      {
        unint64_t v120 = v98 + 4 * v40;
        BOOL v100 = (unsigned __int16 *)(v99 + 4 * v40);
        if (v12[2].i16[3])
        {
          unint64_t v101 = 0;
          uint64_t v102 = -1;
          unsigned int v103 = (unsigned __int16 *)(v98 + 4 * v40);
          do
          {
            unint64_t v104 = *v103;
            if (v104 >= v41) {
              return 0;
            }
            unint64_t v105 = v103[1];
            if (v105 >= v33) {
              return 0;
            }
            if (v102 >= (uint64_t)v104 && (v102 != v104 || v101 >= v105)) {
              return 0;
            }
            v103 += 2;
            unint64_t v101 = v105;
            uint64_t v102 = v104;
          }
          while (v103 != v100);
        }
        uint64_t result = 0;
        if (v100 >= (unsigned __int16 *)v12)
        {
          uint64_t v107 = 2 * v38;
          if ((unint64_t)&v100[v38] <= v50)
          {
            if (!v12[2].i16[1])
            {
LABEL_146:
              int v113 = (_WORD *)v12 + 2 * v12[4].u16[1];
              double v114 = &v97[2 * v38];
              uint64_t v115 = (uint64_t)&v12[v127] + 4 * v12[4].u16[0];
              double v116 = (_WORD *)v12 + 2 * v12[3].u16[2];
              float64x2_t v117 = (_WORD *)v12 + 2 * v12[3].u16[1];
              uint64_t v118 = v12[2].u16[1];
              uint64_t v119 = v12[2].u16[3];
              uint64_t v112 = v12->u16[2];
              uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v35 + 24))(v35, a2);
              *(_DWORD *)(result + 32) = v28;
              *(_DWORD *)(result + 36) = v112;
              *(_DWORD *)(result + 40) = v30;
              *(_DWORD *)(result + 44) = v31;
              *(_DWORD *)(result + 48) = v125;
              *(void *)(result + 56) = v124;
              *(void *)(result + 64) = v112;
              *(void *)(result + 72) = v117;
              *(void *)(result + 80) = v123;
              *(void *)(result + 88) = v55;
              *(void *)(result + 96) = v36;
              *(void *)(result + 104) = v55 + 2 * v36;
              *(void *)(result + 112) = v37;
              *(void *)(result + 120) = v116;
              *(void *)(result + 128) = v36;
              *(void *)(result + 136) = v122;
              *(void *)(result + 144) = v37;
              *(void *)(result + 152) = v69;
              *(void *)(result + 160) = v127;
              *(void *)(result + 168) = v121;
              *(void *)(result + 176) = v127;
              *(void *)(result + 184) = v100;
              *(void *)(result + 192) = v118;
              *(void *)(result + 200) = v113;
              *(void *)(result + 208) = v118;
              *(void *)(result + 216) = v126;
              *(void *)(result + 224) = v39;
              *(void *)(result + 232) = v115;
              *(void *)(result + 240) = v39;
              *(void *)(result + 248) = v120;
              *(void *)(result + 256) = v119;
              *(void *)(result + 264) = v114;
              *(void *)(result + 272) = v119;
              return result;
            }
            uint64_t v108 = -1;
            float v109 = v100;
            while (1)
            {
              uint64_t v110 = v108;
              uint64_t v108 = *v109;
              if (v108 >= v41 || v110 >= v108) {
                return 0;
              }
              ++v109;
              v107 -= 2;
              if (!v107) {
                goto LABEL_146;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_210424718(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t sub_210424720(void *a1)
{
  if ((*(unsigned int (**)(void *))(*a1 + 16))(a1)) {
    return a1[4];
  }
  else {
    return 0;
  }
}

uint64_t sub_210424774()
{
  return 196609;
}

BOOL sub_210424780(uint64_t a1)
{
  return *(_WORD *)(a1 + 24) == 3 && *(_WORD *)(a1 + 26) != 0;
}

void sub_2104247A4()
{
}

void HVF::Loader::withTableData(HVF::Loader *this, const void *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (this && a2) {
    operator new();
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)unsigned int v3 = 0;
    _os_log_error_impl(&dword_21041B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not load HVF font; hvgl missing data or bad version",
      v3,
      2u);
  }
  exception = __cxa_allocate_exception(0x10uLL);
  MEMORY[0x21056E6F0](exception, "HVF font not loaded");
  __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_210424A2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2)
  {
    MEMORY[0x21056E760](v9, 0x10D1C403060C5FCLL);
    uint64_t v12 = __cxa_begin_catch(exception_object);
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (a2 == 2)
    {
      if (v13)
      {
        uint64_t v14 = (*(uint64_t (**)(void *))(*(void *)v12 + 16))(v12);
        LODWORD(a9) = 136446210;
        *(void *)((char *)&a9 + 4) = v14;
        _os_log_error_impl(&dword_21041B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not load HVF font; reason: %{public}s",
          (uint8_t *)&a9,
          0xCu);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x21056E6F0](exception, "HVF font not loaded");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    if (v13)
    {
      LOWORD(a9) = 0;
      _os_log_error_impl(&dword_21041B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not load HVF font; reason unknown.",
        (uint8_t *)&a9,
        2u);
    }
    uint64_t v16 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x21056E6F0](v16, "HVF font not loaded");
    __cxa_throw(v16, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  _Unwind_Resume(exception_object);
}

void sub_210424BEC(_Unwind_Exception *a1)
{
}

void sub_210424C10()
{
  __cxa_free_exception(v0);
  JUMPOUT(0x210424C1CLL);
}

void sub_210424C24(void *a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x210424C2CLL);
  }
  sub_21041CC90(a1);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

void *__cdecl std::align(size_t __align, size_t __sz, void **__ptr, size_t *__space)
{
  return (void *)MEMORY[0x270F98B88](__align, __sz, __ptr, __space);
}

void std::exception::~exception(std::exception *this)
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cblas_dcopy_NEWLAPACK_ILP64()
{
  return MEMORY[0x270EDE310]();
}

uint64_t cblas_dgemv_NEWLAPACK_ILP64()
{
  return MEMORY[0x270EDE348]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x270ED9A18](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

long double logb(long double __x)
{
  MEMORY[0x270EDA0E8](__x);
  return result;
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

long double remainder(long double __x, long double __y)
{
  MEMORY[0x270EDB1D8](__x, __y);
  return result;
}

long double scalbn(long double __x, int __y)
{
  MEMORY[0x270EDB2F0](*(void *)&__y, __x);
  return result;
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}