uint64_t __libplatform_init(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __pfz_setup(a3);
  return __libkernel_platform_init();
}

uint64_t _simple_getenv(uint64_t *a1, unsigned __int8 *a2)
{
  unint64_t v4 = _platform_strlen((uint64_t)a2);
  for (i = a1; ; ++i)
  {
    BOOL v3 = 0;
    if (i) {
      BOOL v3 = *i != 0;
    }
    if (!v3) {
      break;
    }
    if (_platform_strlen(*i) >= v4
      && !_simple_memcmp((unsigned __int8 *)*i, a2, v4)
      && *(unsigned char *)(*i + v4) == 61)
    {
      return *i + v4 + 1;
    }
  }
  return 0;
}

uint64_t _simple_memcmp(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v8 = a3;
  if (a3)
  {
    while (1)
    {
      BOOL v3 = a1++;
      unint64_t v4 = a2++;
      if (*v3 != *v4) {
        break;
      }
      if (!--v8) {
        return 0;
      }
    }
    return (*(a1 - 1) - *(a2 - 1));
  }
  else
  {
    return 0;
  }
}

vm_address_t *_simple_asl_msg_new()
{
  vm_address_t v7 = _simple_salloc();
  if (!v7) {
    return 0;
  }
  if (!_simple_sprintf(v7, "         0", v0, v1, v2, v3, v4, v5, v7)) {
    return v8;
  }
  _simple_sfree(v8);
  return 0;
}

uint64_t _simple_asl_msg_set(uint64_t result, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v35 = (uint64_t *)result;
  if (result)
  {
    if (a2)
    {
      result = _simple_sprintf(result, " [", a3, a4, a5, a6, a7, a8, v30);
      if (!result)
      {
        result = _simple_esprintf((uint64_t)v35, (uint64_t (*)(void))_simple_asl_escape_key, "%s", v8, v9, v10, v11, v12, a2);
        if (!result)
        {
          if (a3)
          {
            result = _simple_esprintf((uint64_t)v35, (uint64_t (*)(void))_simple_asl_escape_val, " %s", v13, v14, v15, v16, v17, a3);
            if (result) {
              return result;
            }
            if (!_platform_strcmp_0(a2, (uint64_t)"Message", v18, v19, v20, v21, v22, v23))
            {
              uint64_t v31 = _simple_string((unsigned char **)v35);
              for (i = (unsigned char *)(v31 + _platform_strlen(v31)); ; unsigned char *i = 0)
              {
                i -= 2;
                if (_platform_strcmp_0((uint64_t)i, (uint64_t)"\\n", v24, v25, v26, v27, v28, v29)) {
                  break;
                }
              }
              _simple_sresize(v35);
            }
          }
          return _simple_sappend((uint64_t)v35, "]");
        }
      }
    }
  }
  return result;
}

const char *_simple_asl_escape_key(char a1)
{
  switch(a1)
  {
    case 10:
      return "\\n";
    case 32:
      return "\\s";
    case 91:
      return "\\[";
    case 92:
      return "\\\\"";
    case 93:
      return "\\]";
  }
  return 0;
}

const char *_simple_asl_escape_val(char a1)
{
  switch(a1)
  {
    case 10:
      return "\\n";
    case 91:
      return "\\[";
    case 92:
      return "\\\\"";
    case 93:
      return "\\]";
  }
  return 0;
}

uint64_t _simple_asl_send(unsigned char **a1)
{
  uint64_t v2 = _simple_string(a1);
  _platform_strlen(v2);
  return log_data_as_kernel();
}

vm_address_t *_simple_asl_log_prog(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  result = _simple_asl_msg_new();
  uint64_t v16 = result;
  if (result)
  {
    if (a4) {
      _simple_asl_msg_set((uint64_t)result, (unint64_t)"Sender", a4, v5, v6, v7, v8, v9);
    }
    _simple_asl_msg_set((uint64_t)v16, (unint64_t)"Facility", a2, v5, v6, v7, v8, v9);
    _simple_asl_msg_set((uint64_t)v16, (unint64_t)"Message", a3, v10, v11, v12, v13, v14);
    uint64_t v15 = _simple_string((unsigned char **)v16);
    _platform_strlen(v15);
    log_data_as_kernel();
    return _simple_sfree(v16);
  }
  return result;
}

vm_address_t *_simple_asl_log(unsigned int a1, unint64_t a2, unint64_t a3)
{
  return _simple_asl_log_prog(a1, a2, a3, 0);
}

uint64_t _simple_vdprintf(int a1, unsigned __int8 *a2, unint64_t *a3)
{
  int v8 = a1;
  uint64_t v7 = a2;
  uint64_t v6 = a3;
  memset(__b, 0, sizeof(__b));
  __b[0] = v4;
  LODWORD(__b[3]) = v8;
  __b[1] = v4;
  __b[2] = __b;
  __b[4] = _flush_reset;
  __simple_bprintf((uint64_t)__b, 0, v7, v6);
  return _flush((uint64_t)__b);
}

uint64_t _flush_reset(void *a1)
{
  uint64_t result = _flush((uint64_t)a1);
  a1[1] = *a1;
  return result;
}

uint64_t __simple_bprintf(uint64_t result, uint64_t (*a2)(void), unsigned __int8 *a3, unint64_t *a4)
{
  uint64_t v51 = result;
  while (*a3)
  {
    v37 = _platform_strchr((uint64_t)a3, 0x25u);
    if (!v37) {
      return put_s(v51, a2, a3);
    }
    put_n(v51, a2, a3, v37 - a3);
    v49 = v37 + 1;
    if (v37[1] == 37)
    {
      uint64_t result = put_c(v51, a2, 0x25u);
      a3 = v37 + 2;
    }
    else
    {
      int v39 = 0;
      int v43 = 0;
      int v46 = 0;
      while (2)
      {
        uint64_t result = _platform_strncmp_0((uint64_t)v49, (uint64_t)".*s", 3, v4, v5, v6, v7, v8);
        if (result)
        {
          unsigned int v12 = (char)*v49;
          BOOL v13 = v12 > 0x30;
          uint64_t v14 = v12 - 48;
          if (v13)
          {
            uint64_t v16 = v14;
            char v15 = 1;
          }
          else
          {
            uint64_t v16 = v14;
            char v15 = 0;
          }
          if ((v15 & 1) == 0)
          {
            switch(v16)
            {
              case 0:
                ++v43;
                ++v49;
                goto LABEL_19;
              case 1:
              case 2:
              case 3:
              case 4:
              case 5:
              case 6:
              case 7:
              case 8:
              case 9:
                while (1)
                {
LABEL_19:
                  BOOL v36 = 0;
                  if ((char)*v49 >= 48) {
                    BOOL v36 = (char)*v49 <= 57;
                  }
                  if (!v36) {
                    break;
                  }
                  uint64_t v17 = v49++;
                  int v39 = 10 * v39 + (char)*v17 - 48;
                }
                continue;
              case 10:
              case 11:
              case 12:
              case 13:
              case 14:
              case 15:
              case 16:
              case 17:
              case 18:
              case 19:
              case 20:
              case 21:
              case 22:
              case 23:
              case 24:
              case 25:
              case 26:
              case 27:
              case 28:
              case 29:
              case 30:
              case 31:
              case 32:
              case 33:
              case 34:
              case 35:
              case 36:
              case 37:
              case 38:
              case 39:
              case 41:
              case 42:
              case 43:
              case 44:
              case 45:
              case 46:
              case 47:
              case 48:
              case 49:
              case 50:
              case 53:
              case 54:
              case 55:
              case 56:
              case 58:
              case 59:
              case 61:
              case 62:
              case 65:
              case 66:
              case 68:
              case 70:
              case 71:
                break;
              case 40:
              case 72:
                if (v46)
                {
                  unint64_t v32 = *a4++;
                  uint64_t result = hex(v51, a2, v32, v39, v43, *v49 == 88, 0);
                }
                else
                {
                  unsigned int v31 = *(_DWORD *)a4++;
                  uint64_t result = hex(v51, a2, v31, v39, v43, *v49 == 88, 0);
                }
                goto LABEL_59;
              case 51:
                if (v43) {
                  char v18 = 48;
                }
                else {
                  char v18 = 32;
                }
                unsigned __int8 v44 = v18;
                int v41 = v39 - 1;
                while (1)
                {
                  int v19 = v41--;
                  if (v19 <= 0) {
                    break;
                  }
                  put_c(v51, a2, v44);
                }
                int v20 = *(_DWORD *)a4++;
                uint64_t result = put_c(v51, a2, v20);
                goto LABEL_59;
              case 52:
              case 57:
                if (v46)
                {
                  uint64_t v22 = *a4++;
                  uint64_t result = dec(v51, a2, v22, v39, v43);
                }
                else
                {
                  int v21 = *(_DWORD *)a4++;
                  uint64_t result = dec(v51, a2, v21, v39, v43);
                }
                goto LABEL_59;
              case 60:
                ++v46;
                ++v49;
                continue;
              case 63:
                if (v46)
                {
                  unint64_t v24 = *a4++;
                  uint64_t result = oct(v51, a2, v24, v39, v43);
                }
                else
                {
                  int v23 = *(_DWORD *)a4++;
                  uint64_t result = oct(v51, a2, v23, v39, v43);
                }
                goto LABEL_59;
              case 64:
                unint64_t v25 = *a4++;
                uint64_t result = hex(v51, a2, v25, v39, v43, 0, 1);
                goto LABEL_59;
              case 67:
                uint64_t v26 = (unsigned __int8 *)*a4++;
                if (v26) {
                  v35 = v26;
                }
                else {
                  v35 = "(null)";
                }
                int v42 = v39 - _platform_strlen((uint64_t)v35);
                if (v43) {
                  char v27 = 48;
                }
                else {
                  char v27 = 32;
                }
                for (unsigned __int8 i = v27; ; put_c(v51, a2, i))
                {
                  int v28 = v42--;
                  if (v28 <= 0) {
                    break;
                  }
                }
                uint64_t result = put_s(v51, a2, v35);
                goto LABEL_59;
              case 69:
                if (v46)
                {
                  unint64_t v30 = *a4++;
                  uint64_t result = udec(v51, a2, v30, v39, v43);
                }
                else
                {
                  unsigned int v29 = *(_DWORD *)a4++;
                  uint64_t result = udec(v51, a2, v29, v39, v43);
                }
                goto LABEL_59;
              case 73:
                if (v46)
                {
                  unint64_t v34 = *a4++;
                  uint64_t result = ydec(v51, a2, v34, v39, v43);
                }
                else
                {
                  unsigned int v33 = *(_DWORD *)a4++;
                  uint64_t result = ydec(v51, a2, v33, v39, v43);
                }
                goto LABEL_59;
              default:
                JUMPOUT(0);
            }
          }
          uint64_t result = put_c(v51, a2, *v49);
        }
        else
        {
          int v40 = *(_DWORD *)a4;
          unint64_t v9 = a4[1];
          a4 += 2;
          for (j = (unsigned __int8 *)v9; ; ++j)
          {
            int v10 = v40--;
            if (v10 <= 0) {
              break;
            }
            uint64_t v11 = j;
            uint64_t result = put_c(v51, a2, *v11);
          }
          v49 += 2;
        }
        break;
      }
LABEL_59:
      a3 = v49 + 1;
    }
  }
  return result;
}

uint64_t _flush(uint64_t result)
{
  uint64_t v3 = result;
  __buf = *(char **)result;
  uint64_t __nbyte = *(void *)(result + 8) - *(void *)result;
  while (__nbyte > 0)
  {
    uint64_t result = write(*(_DWORD *)(v3 + 24), __buf, __nbyte);
    if (result >= 0)
    {
      __nbyte -= result;
      __buf += __nbyte;
    }
    else
    {
      uint64_t result = (uint64_t)__error();
      if (*(_DWORD *)result != 4)
      {
        uint64_t result = (uint64_t)__error();
        if (*(_DWORD *)result != 35) {
          return result;
        }
      }
    }
  }
  return result;
}

uint64_t _simple_dprintf(int a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  return _simple_vdprintf(a1, a2, &a9);
}

vm_address_t _simple_salloc()
{
  vm_address_t address = 0;
  if (vm_allocate(mach_task_self_, &address, vm_page_size, 1)) {
    return 0;
  }
  vm_address_t v0 = address + 40;
  *(void *)vm_address_t address = address + 40;
  *(void *)(address + 8) = v0;
  *(void *)(address + 16) = address + vm_page_size - 1;
  *(void *)(address + 32) = _enlarge;
  return address;
}

char *_enlarge(uint64_t a1)
{
  kern_return_t v2;
  vm_address_t v3;
  vm_size_t size;
  unint64_t v5;
  vm_address_t address;
  uint64_t v7;

  uint64_t v7 = a1;
  vm_address_t address = 0;
  vm_address_t address = *(void *)(a1 + 16) + 1;
  uint64_t result = (char *)vm_allocate(mach_task_self_, &address, vm_page_size, 0);
  if (result)
  {
    uint64_t v5 = *(void *)(v7 + 16) - *(void *)v7 + 1;
    size = (v5 + vm_page_size) & -(uint64_t)vm_page_size;
    uint64_t v2 = vm_allocate(mach_task_self_, &address, size, 1);
    if (v2)
    {
      qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Failed to allocate memory for buffer";
      qword_14038 = v2;
      __break(1u);
      JUMPOUT(0x25E8);
    }
    uint64_t v3 = address - *(void *)v7;
    uint64_t result = _platform_memmove((char *)address, *(char **)v7, v5);
    if ((*(void *)v7 & (vm_page_size - 1)) != 0)
    {
      v5 &= -(uint64_t)vm_page_size;
      *(void *)uint64_t v7 = (*(void *)v7 + vm_page_size) & -(uint64_t)vm_page_size;
      *(void *)(v7 + 16) = address + size - 1;
    }
    else
    {
      *(void *)(v7 + 16) += v3 + vm_page_size;
    }
    if (v5) {
      uint64_t result = (char *)vm_deallocate(mach_task_self_, *(void *)v7, v5);
    }
    *(void *)uint64_t v7 = address;
    *(void *)(v7 + 8) += v3;
  }
  else
  {
    *(void *)(v7 + 16) += vm_page_size;
  }
  return result;
}

uint64_t _simple_vsprintf(uint64_t a1, unsigned __int8 *a2, unint64_t *a3)
{
  return _simple_vesprintf(a1, 0, a2, a3);
}

uint64_t _simple_vesprintf(uint64_t a1, uint64_t (*a2)(void), unsigned __int8 *a3, unint64_t *a4)
{
  return 0;
}

uint64_t _simple_sprintf(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  return _simple_vesprintf(a1, 0, a2, &a9);
}

uint64_t _simple_esprintf(uint64_t a1, uint64_t (*a2)(void), unsigned __int8 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  return _simple_vesprintf(a1, a2, a3, &a9);
}

uint64_t _simple_string(unsigned char **a1)
{
  *a1[1] = 0;
  return (uint64_t)*a1;
}

unint64_t _simple_sresize(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t result = _platform_strlen(*a1);
  a1[1] = v2 + result;
  return result;
}

uint64_t _simple_sappend(uint64_t a1, unsigned __int8 *a2)
{
  return _simple_esappend(a1, 0, a2);
}

uint64_t _simple_esappend(uint64_t a1, uint64_t (*a2)(void), unsigned __int8 *a3)
{
  return 0;
}

uint64_t put_s(uint64_t result, uint64_t (*a2)(void), unsigned __int8 *a3)
{
  uint64_t v6 = result;
  while (*a3)
  {
    uint64_t v3 = a3++;
    unint64_t result = put_c(v6, a2, *v3);
  }
  return result;
}

uint64_t _simple_put(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 24) = a2;
  return _flush(a1);
}

uint64_t _simple_putline(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 24) = a2;
  uint64_t v2 = *(unsigned char **)(a1 + 8);
  *(void *)(a1 + 8) = v2 + 1;
  *uint64_t v2 = 10;
  uint64_t result = _flush(a1);
  --*(void *)(a1 + 8);
  return result;
}

vm_address_t *_simple_sfree(vm_address_t *result)
{
  vm_address_t address = (vm_address_t)result;
  if (result)
  {
    if ((*result & (vm_page_size - 1)) != 0)
    {
      return (vm_address_t *)vm_deallocate(mach_task_self_, (vm_address_t)result, result[2] - (void)result + 1);
    }
    else
    {
      vm_deallocate(mach_task_self_, *result, result[2] - *result + 1);
      return (vm_address_t *)vm_deallocate(mach_task_self_, address, vm_page_size);
    }
  }
  return result;
}

uint64_t put_n(uint64_t result, uint64_t (*a2)(void), unsigned __int8 *a3, uint64_t a4)
{
  for (i = result; ; uint64_t result = put_c(i, a2, *v5))
  {
    uint64_t v4 = a4--;
    if (v4 <= 0) {
      break;
    }
    uint64_t v5 = a3++;
  }
  return result;
}

uint64_t put_c(uint64_t result, uint64_t (*a2)(void), unsigned __int8 a3)
{
  uint64_t v5 = result;
  if (a2)
  {
    uint64_t result = a2(a3);
    if (result) {
      return put_s(v5, 0, result);
    }
  }
  if (*(void *)(v5 + 8) >= *(void *)(v5 + 16)) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(v5 + 32))(v5);
  }
  uint64_t v3 = *(unsigned __int8 **)(v5 + 8);
  *(void *)(v5 + 8) = v3 + 1;
  *uint64_t v3 = a3;
  return result;
}

uint64_t dec(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, int a4, int a5)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v16 = a3;
  int v15 = a4;
  int i = a5;
  BOOL v13 = (unsigned __int8 *)&i;
  uint64_t v12 = 0;
  int v11 = 0;
  uint64_t v10 = a3;
  unint64_t v9 = 0;
  if (a3 < 0)
  {
    ++v11;
    --v15;
    uint64_t v10 = -v10;
  }
  *--BOOL v13 = 0;
  if (v10)
  {
    while (v10)
    {
      uint64_t v10 = udiv10(v10, &v9);
      *--BOOL v13 = v9 + 48;
    }
  }
  else
  {
    *--BOOL v13 = 48;
  }
  if (v11 && i)
  {
    put_c(v18, v17, 0x2Du);
    int v11 = 0;
  }
  uint64_t v8 = v15;
  uint64_t v12 = v8 - _platform_strlen((uint64_t)v13);
  if (i) {
    int v5 = 48;
  }
  else {
    int v5 = 32;
  }
  for (int i = v5; ; put_c(v18, v17, i))
  {
    uint64_t v6 = v12--;
    if (v6 <= 0) {
      break;
    }
  }
  if (v11) {
    put_c(v18, v17, 0x2Du);
  }
  return put_s(v18, v17, v13);
}

uint64_t oct(uint64_t a1, uint64_t (*a2)(void), unint64_t a3, int a4, int a5)
{
  uint64_t v17 = a1;
  uint64_t v16 = a2;
  unint64_t v15 = a3;
  int v14 = a4;
  int i = a5;
  uint64_t v10 = (unsigned __int8 *)&v12;
  char v12 = 0;
  if (a3)
  {
    while (v15)
    {
      *--uint64_t v10 = v15 % 8 + 48;
      v15 /= 8uLL;
    }
  }
  else
  {
    uint64_t v10 = (unsigned __int8 *)&v11;
    char v11 = 48;
  }
  uint64_t v8 = v14;
  uint64_t v9 = v8 - _platform_strlen((uint64_t)v10);
  if (i) {
    int v5 = 48;
  }
  else {
    int v5 = 32;
  }
  for (int i = v5; ; put_c(v17, v16, i))
  {
    uint64_t v6 = v9--;
    if (v6 <= 0) {
      break;
    }
  }
  return put_s(v17, v16, v10);
}

uint64_t hex(uint64_t a1, uint64_t (*a2)(void), unint64_t a3, int a4, int a5, int a6, int a7)
{
  uint64_t v21 = a1;
  int v20 = a2;
  unint64_t v19 = a3;
  int v18 = a4;
  int i = a5;
  int v16 = a6;
  int v15 = a7;
  uint64_t v7 = "0123456789ABCDEF";
  if (!a6) {
    uint64_t v7 = "0123456789abcdef";
  }
  char v12 = (unsigned __int8 *)&v14;
  char v14 = 0;
  if (v19)
  {
    while (v19)
    {
      *--char v12 = v7[v19 & 0xF];
      v19 >>= 4;
    }
  }
  else
  {
    char v12 = (unsigned __int8 *)&v13;
    char v13 = 48;
  }
  if (v15)
  {
    v18 -= 2;
    if (i)
    {
      put_s(v21, v20, "0x");
      int v15 = 0;
    }
  }
  int v8 = _platform_strlen((uint64_t)v12);
  v18 -= v8;
  if (i) {
    int v9 = 48;
  }
  else {
    int v9 = 32;
  }
  for (int i = v9; ; put_c(v21, v20, i))
  {
    int v10 = v18--;
    if (v10 <= 0) {
      break;
    }
  }
  if (v15) {
    put_s(v21, v20, "0x");
  }
  return put_s(v21, v20, v12);
}

uint64_t udec(uint64_t a1, uint64_t (*a2)(void), unint64_t a3, int a4, int a5)
{
  uint64_t v17 = a1;
  int v16 = a2;
  unint64_t v15 = a3;
  int v14 = a4;
  int i = a5;
  unint64_t v10 = 0;
  char v11 = (unsigned __int8 *)&v12;
  char v12 = 0;
  if (a3)
  {
    while (v15)
    {
      unint64_t v15 = udiv10(v15, &v10);
      *--char v11 = v10 + 48;
    }
  }
  else
  {
    *--char v11 = 48;
  }
  uint64_t v8 = v14;
  uint64_t v9 = v8 - _platform_strlen((uint64_t)v11);
  if (i) {
    int v5 = 48;
  }
  else {
    int v5 = 32;
  }
  for (int i = v5; ; put_c(v17, v16, i))
  {
    uint64_t v6 = v9--;
    if (v6 <= 0) {
      break;
    }
  }
  return put_s(v17, v16, v11);
}

uint64_t ydec(uint64_t a1, uint64_t (*a2)(void), unint64_t a3, int a4, int a5)
{
  if (a3 < 0xA00000)
  {
    if (a3 < 0x2800)
    {
      udec(a1, a2, a3, a4, a5);
      return put_s(a1, a2, "b");
    }
    else
    {
      udec(a1, a2, (a3 + 512) >> 10, a4, a5);
      return put_s(a1, a2, "KB");
    }
  }
  else
  {
    udec(a1, a2, (a3 + 0x80000) >> 20, a4, a5);
    return put_s(a1, a2, "MB");
  }
}

unint64_t udiv10(unint64_t a1, unint64_t *a2)
{
  *a2 = a1 % 0xA;
  return a1 / 0xA;
}

unsigned char *__pfz_setup(uint64_t *a1)
{
  uint64_t result = (unsigned char *)_simple_getenv(a1, "pfz");
  if (result)
  {
    if (*result == 48 && result[1] == 120 && (char v2 = result[2]) != 0)
    {
      uint64_t v3 = 0;
      uint64_t v4 = result + 3;
      do
      {
        int v5 = v2;
        if ((v2 - 48) >= 0xAu)
        {
          int v6 = -87;
          if ((v5 - 97) >= 6u)
          {
            if ((v5 - 65) > 5u) {
              goto LABEL_13;
            }
            int v6 = -55;
          }
        }
        else
        {
          int v6 = -48;
        }
        uint64_t v3 = (v6 + v5) + 16 * v3;
        int v7 = *v4++;
        char v2 = v7;
      }
      while (v7);
    }
    else
    {
LABEL_13:
      uint64_t v3 = 0;
    }
    uint64_t v8 = (int8x16_t *)(result - 4);
    unint64_t v9 = _platform_strlen((uint64_t)result);
    uint64_t result = _platform_bzero(v8, v9 + 4, v10);
    if (v3) {
      commpage_pfz_base = v3;
    }
  }
  return result;
}

void OSAtomicFifoEnqueue(OSFifoQueueHead *__list, void *__new, size_t a3)
{
  uint64_t v3 = (void (*)(OSFifoQueueHead *, void *, size_t))commpage_pfz_base;
  if (!commpage_pfz_base) {
    OSAtomicFifoEnqueue_cold_1();
  }

  v3(__list, __new, a3);
}

void *__cdecl OSAtomicFifoDequeue(OSFifoQueueHead *__list, size_t a2)
{
  if (!commpage_pfz_base) {
    OSAtomicFifoEnqueue_cold_1();
  }
  char v2 = (uint64_t (*)(OSFifoQueueHead *, size_t))(commpage_pfz_base + 4);

  return (void *)v2(__list, a2);
}

uint64_t sys_cache_control(int a1, uint64_t a2, uint64_t a3)
{
  if (a1 == 2)
  {
    sys_dcache_flush();
    return 0;
  }
  if (a1 == 1)
  {
    sys_icache_invalidate(a2, a3);
    return 0;
  }
  return 45;
}

uint64_t sys_icache_invalidate(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = result & 0xFFFFFFFFFFFFFFC0;
    unint64_t v3 = ~((a2 + (unint64_t)(result & 0x3F) - 1) >> 6);
    __dsb(0xBu);
    uint64_t v4 = 20;
    uint64_t v5 = 0;
    do
    {
      __asm { IC              IVAU, X9 }
      v2 += 64;
      if (!--v4)
      {
        if (v5)
        {
LABEL_5:
          __dsb(0xBu);
          uint64_t v4 = 20;
        }
        else
        {
          int8x16_t v10 = &cpus_that_need_dsb_for_ic_ivau;
          while (1)
          {
            unsigned int v11 = *v10++;
            uint64_t v5 = v11;
            if (!v11) {
              break;
            }
            if (v5 == MEMORY[0xFFFFFC080]) {
              goto LABEL_5;
            }
          }
          uint64_t v4 = 0;
          uint64_t v5 = 1;
        }
      }
      ++v3;
    }
    while (v3);
    __dsb(0xBu);
    __isb(0xFu);
  }
  return result;
}

void sys_dcache_flush()
{
}

uint64_t os_lock_lock(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

uint64_t os_lock_trylock(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
}

uint64_t os_lock_unlock(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
}

unsigned int *_OSSpinLockLockSlow(unsigned int *result)
{
  for (int i = 100; ; --i)
  {
    while (1)
    {
      signed int v2 = __ldxr(result);
      if (v2) {
        break;
      }
      __clrex();
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)result, (unsigned int *)&v2, 0xFFFFFFFF, memory_order_acquire, memory_order_acquire);
      if (!v2) {
        return result;
      }
    }
    if (v2 != -1)
    {
      __clrex();
      _os_lock_corruption_abort((uint64_t)result, v2);
    }
    if (!i) {
      break;
    }
    __wfe();
  }
  __clrex();

  return (unsigned int *)_OSSpinLockLockYield((atomic_uint *)result);
}

unint64_t _OSSpinLockLockYield(atomic_uint *a1)
{
  mach_timebase_info info = 0;
  unint64_t result = mach_timebase_info(&info);
  if (result)
  {
    unint64_t v3 = -1;
  }
  else
  {
    unint64_t v4 = 1000000 * (unint64_t)info.denom / info.numer;
    unint64_t result = mach_absolute_time();
    unint64_t v3 = result + v4;
  }
  mach_msg_timeout_t v5 = 1;
  int v6 = 1;
  while (1)
  {
    int v7 = *(_DWORD *)a1;
    if (!*(_DWORD *)a1)
    {
      atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v7, 0xFFFFFFFF, memory_order_acquire, memory_order_acquire);
      if (!v7) {
        break;
      }
    }
    if (v7 != -1) {
      _os_lock_corruption_abort(result, v7);
    }
    unint64_t result = thread_switch(0, v6, v5);
    if (v6 == 2)
    {
      ++v5;
    }
    else
    {
      unint64_t result = mach_absolute_time();
      if (result < v3) {
        int v6 = 1;
      }
      else {
        int v6 = 2;
      }
    }
  }
  return result;
}

void spin_lock(OSSpinLock *__lock)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)__lock, (unsigned int *)&v1, 0xFFFFFFFF, memory_order_acquire, memory_order_acquire);
  if (v1) {
    _OSSpinLockLockSlow((unsigned int *)__lock);
  }
}

BOOL OSSpinLockTry(OSSpinLock *__lock)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)__lock, (unsigned int *)&v1, 0xFFFFFFFF, memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

BOOL spin_lock_try(atomic_uint *a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v1, 0xFFFFFFFF, memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

void spin_unlock(OSSpinLock *__lock)
{
}

unsigned int *_os_lock_spin_lock(uint64_t a1)
{
  int v1 = 0;
  unint64_t result = (unsigned int *)(a1 + 8);
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)result, (unsigned int *)&v1, 0xFFFFFFFF, memory_order_acquire, memory_order_acquire);
  if (v1) {
    return _OSSpinLockLockSlow(result);
  }
  return result;
}

BOOL _os_lock_spin_trylock(uint64_t a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v1, 0xFFFFFFFF, memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

uint64_t _os_lock_spin_unlock(uint64_t result)
{
  return result;
}

void _os_lock_handoff_lock(uint64_t a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  if (v1) {
    _os_lock_handoff_lock_slow(a1);
  }
}

BOOL _os_lock_handoff_trylock(uint64_t a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

uint64_t _os_lock_handoff_unlock(uint64_t result)
{
  return result;
}

void _os_lock_handoff_lock_slow(uint64_t a1)
{
  char v2 = 0;
  unsigned int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  int v4 = 4;
  int v5 = 100;
  mach_msg_timeout_t v6 = 1;
LABEL_2:
  int v7 = 1 - v5;
  while (1)
  {
    int v8 = v7;
    mach_port_name_t v9 = *(_DWORD *)(a1 + 8);
    if (!v9)
    {
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), &v9, v3, memory_order_acquire, memory_order_acquire);
      if (!v9) {
        break;
      }
    }
    if (v9 == v3) {
      _os_lock_recursive_abort(v3);
    }
    ++v7;
    if (v8 == 1)
    {
      thread_switch(v9, 5, v6);
LABEL_8:
      ++v6;
      int v5 = -v8;
      int v4 = 5;
      char v2 = 1;
      goto LABEL_2;
    }
    thread_switch(v9, v4, v6);
    if (v2) {
      goto LABEL_8;
    }
  }
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  int v1 = 0;
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v1, v2, memory_order_acquire, memory_order_acquire);
  if (v1) {
    _os_unfair_lock_lock_slow((atomic_uint *)lock, 0, 0, v2);
  }
}

uint64_t _os_unfair_lock_lock_slow(atomic_uint *a1, int a2, uint64_t a3, unsigned int a4)
{
  if ((a2 & 0xFCFAFFFF) != 0)
  {
    qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Invalid options";
    qword_14038 = a2 & 0xFEFFFFFF;
    __break(1u);
LABEL_30:
    _os_unfair_lock_recursive_abort(v4);
  }
  unsigned int v4 = a4;
  int v7 = 0;
  do
  {
    while (1)
    {
      while (1)
      {
        do
        {
          unsigned int v8 = *(_DWORD *)a1;
          if (!*(_DWORD *)a1)
          {
            atomic_compare_exchange_strong_explicit(a1, &v8, v4 & ~v7, memory_order_acquire, memory_order_acquire);
            if (!v8) {
              return 1;
            }
          }
          int v9 = v8 | 1;
          BOOL v10 = (a2 & 0x1000000) != 0 && v9 == -1;
          int v11 = !v10;
          if (v9 == v4 && v11 != 0) {
            goto LABEL_30;
          }
          if (v8 == (v8 & 0xFFFFFFFE)) {
            break;
          }
          unsigned int v13 = v8;
          atomic_compare_exchange_strong_explicit(a1, &v13, v8 & 0xFFFFFFFE, memory_order_relaxed, memory_order_relaxed);
          BOOL v10 = v13 == v8;
          v8 &= ~1u;
        }
        while (!v10);
        uint64_t result = __ulock_wait2();
        if ((result & 0x80000000) != 0) {
          break;
        }
        if (result) {
          int v7 = 1;
        }
      }
      uint64_t v15 = -(int)result;
      if ((int)v15 > 13) {
        break;
      }
      if (v15 != 4) {
        goto LABEL_34;
      }
    }
  }
  while (v15 == 14);
  uint64_t result = 0;
  if (v15 != 60)
  {
    if (v15 == 105) {
      _os_unfair_lock_corruption_abort(v8);
    }
LABEL_34:
    qword_14008 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait2 failure";
    qword_14038 = v15;
    __break(1u);
  }
  return result;
}

atomic_uint *os_unfair_lock_lock_with_options(atomic_uint *result, int a2)
{
  int v2 = 0;
  unsigned int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v2, v3, memory_order_acquire, memory_order_acquire);
  if (v2) {
    return (atomic_uint *)_os_unfair_lock_lock_slow(result, a2, 0, v3);
  }
  return result;
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

uint64_t os_unfair_lock_trylock_with_options(atomic_uint *a1, int a2, uint64_t a3)
{
  int v3 = 0;
  unsigned int v4 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v3, v4, memory_order_acquire, memory_order_acquire);
  if (v3) {
    return _os_unfair_lock_trylock_with_options_slow(a1, a2, a3, v4);
  }
  else {
    return 1;
  }
}

uint64_t _os_unfair_lock_trylock_with_options_slow(atomic_uint *a1, int a2, uint64_t a3, unsigned int a4)
{
  if ((a2 & 0x2000000) == 0)
  {
    if (a3)
    {
      mach_timebase_info info = 0;
      mach_timebase_info(&info);
      unint64_t v8 = info.denom * a3 / info.numer;
      uint64_t v9 = mach_absolute_time();
      return _os_unfair_lock_lock_slow(a1, a2 | 0x2000000u, v9 + v8, a4);
    }
    return 0;
  }
  if (mach_absolute_time() > a3) {
    return 0;
  }

  return _os_unfair_lock_lock_slow(a1, a2, a3, a4);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  unsigned int v2 = atomic_exchange_explicit((atomic_uint *volatile)lock, 0, memory_order_release);
  if (v2 != v1) {
    _os_unfair_lock_unlock_slow((uint64_t)lock, v1, v2);
  }
}

uint64_t _os_unfair_lock_unlock_slow(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t result = a3 | 1;
  if (result != a2) {
    _os_unfair_lock_unowned_abort(result);
  }
  if (a3)
  {
    uint64_t v4 = a3;
    qword_14008 = (uint64_t)"BUG IN LIBPLATFORM: unlock_slow with no waiters";
    qword_14038 = a3;
    __break(1u);
LABEL_9:
    qword_14008 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wake failure";
    qword_14038 = v4;
    __break(1u);
  }
  else
  {
    while (1)
    {
      uint64_t result = __ulock_wake();
      if ((result & 0x80000000) == 0) {
        break;
      }
      if (result != -4)
      {
        uint64_t v4 = -(int)result;
        if (v4 != 2) {
          goto LABEL_9;
        }
        return result;
      }
    }
  }
  return result;
}

atomic_uint *os_unfair_lock_lock_no_tsd(atomic_uint *result, int a2, unsigned int a3)
{
  int v3 = 0;
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v3, a3, memory_order_acquire, memory_order_acquire);
  if (v3) {
    return (atomic_uint *)_os_unfair_lock_lock_slow(result, a2, 0, a3);
  }
  return result;
}

atomic_uint *os_unfair_lock_unlock_no_tsd(atomic_uint *result, int a2)
{
  unsigned int v2 = atomic_exchange_explicit(result, 0, memory_order_release);
  if (v2 != a2) {
    return (atomic_uint *)_os_unfair_lock_unlock_slow((uint64_t)result, a2, v2);
  }
  return result;
}

atomic_uint *os_unfair_lock_lock_with_flags(atomic_uint *result, int a2)
{
  int v2 = 0;
  unsigned int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v2, v3, memory_order_acquire, memory_order_acquire);
  if (v2) {
    return (atomic_uint *)_os_unfair_lock_lock_slow(result, a2, 0, v3);
  }
  return result;
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  uint32_t os_unfair_lock_opaque = lock->_os_unfair_lock_opaque;
  if ((os_unfair_lock_opaque | 1) != v1) {
    os_unfair_lock_assert_owner_cold_1(os_unfair_lock_opaque);
  }
}

void os_unfair_lock_assert_not_owner(os_unfair_lock_t lock)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  uint32_t os_unfair_lock_opaque = lock->_os_unfair_lock_opaque;
  if ((os_unfair_lock_opaque | 1) == v1) {
    os_unfair_lock_assert_not_owner_cold_1(os_unfair_lock_opaque);
  }
}

BOOL os_unfair_recursive_lock_owned(_DWORD *a1)
{
  int v1 = *a1 | 1;
  return v1 == *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
}

uint64_t os_unfair_recursive_lock_lock_with_options(uint64_t result, int a2)
{
  int v3 = 0;
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)result, (unsigned int *)&v3, v2, memory_order_acquire, memory_order_acquire);
  if (v3)
  {
    if ((v3 | 1) == v2) {
      ++*(_DWORD *)(result + 4);
    }
    else {
      return _os_unfair_lock_lock_slow((atomic_uint *)result, a2, 0, v2);
    }
  }
  return result;
}

uint64_t os_unfair_recursive_lock_trylock(uint64_t a1)
{
  int v2 = 0;
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a1, (unsigned int *)&v2, v1, memory_order_acquire, memory_order_acquire);
  if (!v2) {
    return 1;
  }
  if ((v2 | 1) == v1)
  {
    ++*(_DWORD *)(a1 + 4);
    return 1;
  }
  return 0;
}

uint64_t os_unfair_recursive_lock_unlock(uint64_t result)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  int v2 = *(_DWORD *)(result + 4);
  if (v2)
  {
    if ((*(_DWORD *)result | 1) != v1) {
      _os_unfair_lock_unowned_abort(*(_DWORD *)result | 1);
    }
    *(_DWORD *)(result + 4) = v2 - 1;
  }
  else
  {
    unsigned int v3 = atomic_exchange_explicit((atomic_uint *volatile)result, 0, memory_order_release);
    if (v3 != v1)
    {
      return _os_unfair_lock_unlock_slow(result, v1, v3);
    }
  }
  return result;
}

BOOL os_unfair_recursive_lock_tryunlock4objc(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 | 1;
  int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  if (v1 == v2)
  {
    int v3 = *(_DWORD *)(a1 + 4);
    if (v3)
    {
      if ((*(_DWORD *)a1 | 1) != v1) {
        _os_unfair_lock_unowned_abort(*(_DWORD *)a1 | 1);
      }
      *(_DWORD *)(a1 + 4) = v3 - 1;
    }
    else
    {
      unsigned int v4 = atomic_exchange_explicit((atomic_uint *volatile)a1, 0, memory_order_release);
      if (v4 != v1) {
        _os_unfair_lock_unlock_slow(a1, v1, v4);
      }
    }
  }
  return v1 == v2;
}

_DWORD *os_unfair_recursive_lock_unlock_forked_child(_DWORD *result)
{
  if (!*result) {
    os_unfair_recursive_lock_unlock_forked_child_cold_1();
  }
  int v1 = result[1];
  if (v1)
  {
    int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    result[1] = v1 - 1;
  }
  else
  {
    int v2 = 0;
  }
  unsigned int *result = v2;
  return result;
}

atomic_uint *_os_lock_unfair_lock(uint64_t a1)
{
  int v1 = 0;
  uint64_t result = (atomic_uint *)(a1 + 8);
  unsigned int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v1, v3, memory_order_acquire, memory_order_acquire);
  if (v1) {
    return (atomic_uint *)_os_unfair_lock_lock_slow(result, 0, 0, v3);
  }
  return result;
}

BOOL _os_lock_unfair_trylock(uint64_t a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

atomic_uint *_os_lock_unfair_unlock(uint64_t a1)
{
  uint64_t result = (atomic_uint *)(a1 + 8);
  int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  unsigned int v3 = atomic_exchange_explicit(result, 0, memory_order_release);
  if (v3 != v2) {
    return (atomic_uint *)_os_unfair_lock_unlock_slow((uint64_t)result, v2, v3);
  }
  return result;
}

uint64_t _os_nospin_lock_lock(uint64_t result)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)result, (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  if (v1) {
    return _os_nospin_lock_lock_slow(result);
  }
  return result;
}

uint64_t _os_nospin_lock_lock_slow(uint64_t result)
{
  int v1 = (atomic_uint *)result;
  int v2 = 0;
  int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  int v4 = 1;
  while (1)
  {
    int v5 = *(_DWORD *)v1;
    if (!*(_DWORD *)v1)
    {
      atomic_compare_exchange_strong_explicit(v1, (unsigned int *)&v5, v3 & ~v2, memory_order_acquire, memory_order_acquire);
      if (!v5) {
        break;
      }
    }
    unsigned int v6 = v5 & 0xFFFFFFFE;
    if (v5 != (v5 & 0xFFFFFFFE) && v6 != 0)
    {
      int v8 = v5;
      atomic_compare_exchange_strong_explicit(v1, (unsigned int *)&v8, v6, memory_order_relaxed, memory_order_relaxed);
      if (v8 != v5) {
        continue;
      }
    }
    uint64_t result = __ulock_wait();
    if ((result & 0x80000000) != 0)
    {
      int v9 = -(int)result;
      if (result != -4 && v9 != 14)
      {
        if (v9 != 60)
        {
          qword_14008 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait failure";
          qword_14038 = -(int)result;
          __break(1u);
          return result;
        }
        ++v4;
      }
    }
    else if (result)
    {
      int v2 = 1;
    }
  }
  return result;
}

BOOL _os_nospin_lock_trylock(atomic_uint *a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

void _os_nospin_lock_unlock(atomic_uint *a1)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  unsigned int v2 = atomic_exchange_explicit(a1, 0, memory_order_release);
  if (v2 != v1) {
    _os_nospin_lock_unlock_slow((uint64_t)a1, v2);
  }
}

void _os_nospin_lock_unlock_slow(uint64_t a1, unsigned int a2)
{
  if ((a2 | 1) == *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24))
  {
    if (a2)
    {
      uint64_t v3 = a2;
      qword_14008 = (uint64_t)"BUG IN LIBPLATFORM: unlock_slow with no waiters";
      qword_14038 = a2;
      __break(1u);
LABEL_8:
      qword_14008 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wake failure";
      qword_14038 = v3;
      __break(1u);
    }
    else
    {
      while (1)
      {
        int v2 = __ulock_wake();
        if ((v2 & 0x80000000) == 0) {
          break;
        }
        if (v2 != -4)
        {
          uint64_t v3 = -v2;
          if (v3 != 2) {
            goto LABEL_8;
          }
          return;
        }
      }
    }
  }
}

atomic_uint *_os_lock_nospin_lock(uint64_t a1)
{
  int v1 = 0;
  uint64_t result = (atomic_uint *)(a1 + 8);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  if (v1) {
    return (atomic_uint *)_os_nospin_lock_lock_slow((uint64_t)result);
  }
  return result;
}

BOOL _os_lock_nospin_trylock(uint64_t a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

void _os_lock_nospin_unlock(uint64_t a1)
{
  int v1 = (atomic_uint *)(a1 + 8);
  int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  unsigned int v3 = atomic_exchange_explicit(v1, 0, memory_order_release);
  if (v3 != v2) {
    _os_nospin_lock_unlock_slow((uint64_t)v1, v3);
  }
}

atomic_ullong *__os_once_reset(atomic_ullong *result)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  unsigned int v2 = atomic_exchange_explicit(result, 0, memory_order_release);
  if (v1 != v2) {
    return (atomic_ullong *)_os_once_gate_broadcast((uint64_t)result, v2, v1);
  }
  return result;
}

uint64_t _os_once_gate_broadcast(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result = a2 | 1;
  if (result != a3) {
    _os_once_gate_unowned_abort(result);
  }
  if (a2)
  {
    uint64_t v4 = a2;
    qword_14008 = (uint64_t)"BUG IN LIBPLATFORM: unlock_slow with no waiters";
    qword_14038 = a2;
    __break(1u);
LABEL_9:
    qword_14008 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wake failure";
    qword_14038 = v4;
    __break(1u);
  }
  else
  {
    while (1)
    {
      uint64_t result = __ulock_wake();
      if ((result & 0x80000000) == 0) {
        break;
      }
      if (result != -4)
      {
        uint64_t v4 = -(int)result;
        if (v4 != 2) {
          goto LABEL_9;
        }
        return result;
      }
    }
  }
  return result;
}

atomic_ullong *_os_once(atomic_ullong *result, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  unint64_t explicit = atomic_load_explicit(result, memory_order_acquire);
  if ((explicit & 3) == 1)
  {
    if (4 * MEMORY[0xFFFFFC180] - explicit - 15 <= 0xFFFFFFFFFFFFFFEFLL) {
      *(void *)uint64_t result = -1;
    }
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    atomic_compare_exchange_strong_explicit(result, (unint64_t *)&v4, v5, memory_order_acquire, memory_order_acquire);
    if (v4) {
      return (atomic_ullong *)_os_once_gate_wait((uint64_t)result, a2, a3, v5);
    }
    else {
      return (atomic_ullong *)_os_once_callout(result, a2, a3, v5);
    }
  }
  return result;
}

uint64_t _os_once_callout(atomic_ullong *a1, uint64_t a2, uint64_t (*a3)(uint64_t), int a4)
{
  uint64_t result = a3(a2);
  unsigned int v7 = atomic_exchange_explicit(a1, (4 * MEMORY[0xFFFFFC180]) | 1, memory_order_release);
  if (v7 != a4)
  {
    return _os_once_gate_broadcast((uint64_t)a1, v7, a4);
  }
  return result;
}

uint64_t _os_once_gate_wait(uint64_t result, uint64_t a2, uint64_t (*a3)(uint64_t), unsigned int a4)
{
  uint64_t v4 = *(void *)result;
  if (*(void *)result != -1)
  {
    int v8 = (atomic_ullong *)result;
    unint64_t v9 = a4;
    while ((v4 & 3) != 1)
    {
      if (v4)
      {
        if ((v4 & 0xFFFFFFFFFFFFFFFELL) == v4
          || (uint64_t v10 = v4,
              atomic_compare_exchange_strong_explicit(v8, (unint64_t *)&v10, v4 & 0xFFFFFFFFFFFFFFFELL, memory_order_relaxed, memory_order_relaxed), v10 == v4))
        {
          if ((v4 | 1) == a4) {
            _os_once_gate_recursive_abort(a4);
          }
          uint64_t result = __ulock_wait();
          if ((result & 0x80000000) != 0 && result != -4 && -(int)result != 14)
          {
            if (-(int)result == 105) {
              _os_once_gate_corruption_abort(v4);
            }
            qword_14008 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait failure";
            qword_14038 = -(int)result;
            __break(1u);
            return result;
          }
          uint64_t v4 = *(void *)v8;
        }
        else
        {
          uint64_t v4 = v10;
        }
      }
      else
      {
        uint64_t v11 = 0;
        atomic_compare_exchange_strong_explicit(v8, (unint64_t *)&v11, v9, memory_order_relaxed, memory_order_relaxed);
        if (!v11)
        {
          __dmb(9u);
          return _os_once_callout(v8, a2, a3, a4);
        }
        uint64_t v4 = v11;
      }
      if (v4 == -1) {
        return result;
      }
    }
    __dmb(9u);
    if ((unint64_t)(4 * MEMORY[0xFFFFFC180] - v4 - 15) <= 0xFFFFFFFFFFFFFFEFLL) {
      *(void *)int v8 = -1;
    }
  }
  return result;
}

uint64_t os_sync_wait_on_address_with_deadline(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6)
{
  if (a4 <= 1 && (a3 == 8 || a3 == 4))
  {
    int v6 = 22;
    if (a6 && a5 == 32)
    {
      uint64_t result = __ulock_wait2();
      if ((result & 0x80000000) == 0) {
        return result;
      }
      int v6 = -(int)result;
    }
  }
  else
  {
    int v6 = 22;
  }
  *__error() = v6;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wait_on_address_with_timeout(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6)
{
  if (a4 <= 1 && (a3 == 8 || a3 == 4))
  {
    int v6 = 22;
    if (a6 && a5 == 32)
    {
      uint64_t result = __ulock_wait2();
      if ((result & 0x80000000) == 0) {
        return result;
      }
      int v6 = -(int)result;
    }
  }
  else
  {
    int v6 = 22;
  }
  *__error() = v6;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wait_on_address(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4 <= 1 && (a3 == 8 || a3 == 4))
  {
    uint64_t result = __ulock_wait2();
    if ((result & 0x80000000) == 0) {
      return result;
    }
    int v5 = -(int)result;
  }
  else
  {
    int v5 = 22;
  }
  *__error() = v5;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wake_by_address_any(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 <= 1 && (a2 == 8 || a2 == 4))
  {
    uint64_t result = __ulock_wake();
    if ((result & 0x80000000) == 0) {
      return result;
    }
    int v4 = -(int)result;
  }
  else
  {
    int v4 = 22;
  }
  *__error() = v4;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wake_by_address_all(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 <= 1 && (a2 == 8 || a2 == 4))
  {
    uint64_t result = __ulock_wake();
    if ((result & 0x80000000) == 0) {
      return result;
    }
    int v4 = -(int)result;
  }
  else
  {
    int v4 = 22;
  }
  *__error() = v4;
  return 0xFFFFFFFFLL;
}

uint64_t _os_alloc_once(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = a1;
  v5[1] = a2;
  v5[2] = a3;
  _os_once((atomic_ullong *)a1, (uint64_t)v5, _os_alloc);
  return *(void *)(a1 + 8);
}

uint64_t _os_alloc(uint64_t a1)
{
  unint64_t v1 = (*(_DWORD *)(a1 + 8) + 15) & 0xFFFFFFF0;
  if (v1 - 1 >= 2 * vm_page_size - 16) {
    _os_alloc_cold_1((*(_DWORD *)(a1 + 8) + 15) & 0xFFFFFFF0);
  }
  unsigned int v3 = (atomic_ullong *)_os_alloc_heap;
  if (_os_alloc_heap
    && (add_unint64_t explicit = atomic_fetch_add_explicit((atomic_ullong *volatile)_os_alloc_heap, v1, memory_order_relaxed),
        add_explicit + v1 <= 2 * vm_page_size - 16))
  {
    uint64_t result = (uint64_t)v3 + add_explicit + 16;
  }
  else
  {
    uint64_t result = _os_alloc_slow(v3, v1);
  }
  *(void *)(*(void *)a1 + 8) = result;
  int v6 = *(uint64_t (**)(void))(a1 + 16);
  if (v6)
  {
    return v6();
  }
  return result;
}

uint64_t _os_alloc_slow(atomic_ullong *a1, unint64_t a2)
{
  mach_vm_address_t v4 = vm_page_size;
  while (1)
  {
    mach_vm_address_t address = v4;
    uint64_t result = mach_vm_map(mach_task_self_, &address, 2 * v4, 0, 1224736769, 0, 0, 0, 3, 7, 1u);
    if (result) {
      break;
    }
    mach_vm_address_t v6 = address;
    unsigned int v7 = a1;
    atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&_os_alloc_heap, (unint64_t *)&v7, address, memory_order_relaxed, memory_order_relaxed);
    if (v7 == a1)
    {
      *(void *)(v6 + 8) = a1;
      a1 = (atomic_ullong *)v6;
LABEL_6:
      add_unint64_t explicit = atomic_fetch_add_explicit(a1, a2, memory_order_relaxed);
      mach_vm_address_t v4 = vm_page_size;
      if (add_explicit + a2 <= 2 * vm_page_size - 16) {
        return (uint64_t)a1 + add_explicit + 16;
      }
    }
    else
    {
      mach_vm_deallocate(mach_task_self_, v6, 2 * vm_page_size);
      a1 = (atomic_ullong *)_os_alloc_heap;
      if (_os_alloc_heap) {
        goto LABEL_6;
      }
      mach_vm_address_t v4 = vm_page_size;
    }
  }
  qword_14008 = (uint64_t)"BUG IN LIBPLATFORM: Failed to allocate in os_alloc_once";
  qword_14038 = (int)result;
  __break(1u);
  return result;
}

uint64_t _os_semaphore_create()
{
  kern_return_t v0;
  semaphore_t semaphore;

  semaphore = 0;
  vm_address_t v0 = semaphore_create(mach_task_self_, &semaphore, 0, 0);
  if (v0)
  {
    if (v0 == -301) {
      _os_semaphore_create_cold_2();
    }
    _os_semaphore_create_cold_1(v0);
  }
  return semaphore;
}

uint64_t _os_semaphore_dispose(semaphore_t semaphore)
{
  uint64_t result = semaphore_destroy(mach_task_self_, semaphore);
  if (result) {
    _os_semaphore_dispose_cold_1(result);
  }
  return result;
}

uint64_t _os_semaphore_signal(semaphore_t a1)
{
  uint64_t result = semaphore_signal(a1);
  if (result) {
    _os_semaphore_signal_cold_1(result);
  }
  return result;
}

uint64_t _os_semaphore_wait(semaphore_t semaphore)
{
  while (1)
  {
    uint64_t result = semaphore_wait(semaphore);
    if (!result) {
      break;
    }
    if (result != 14) {
      _os_semaphore_wait_cold_1(result);
    }
  }
  return result;
}

int32_t OSAtomicAdd32(int32_t __theAmount, int32_t *__theValue)
{
  return atomic_fetch_add_explicit((atomic_uint *volatile)__theValue, __theAmount, memory_order_relaxed) + __theAmount;
}

int32_t OSAtomicAdd32Barrier(int32_t __theAmount, int32_t *__theValue)
{
  return atomic_fetch_add((atomic_uint *volatile)__theValue, __theAmount) + __theAmount;
}

int32_t OSAtomicIncrement32(int32_t *__theValue)
{
  return atomic_fetch_add_explicit((atomic_uint *volatile)__theValue, 1u, memory_order_relaxed) + 1;
}

int32_t OSAtomicIncrement32Barrier(int32_t *__theValue)
{
  return atomic_fetch_add((atomic_uint *volatile)__theValue, 1u) + 1;
}

int32_t OSAtomicDecrement32(int32_t *__theValue)
{
  return atomic_fetch_add_explicit((atomic_uint *volatile)__theValue, 0xFFFFFFFF, memory_order_relaxed) - 1;
}

int32_t OSAtomicDecrement32Barrier(int32_t *__theValue)
{
  return atomic_fetch_add((atomic_uint *volatile)__theValue, 0xFFFFFFFF) - 1;
}

int64_t OSAtomicAdd64(int64_t __theAmount, OSAtomic_int64_aligned64_t *__theValue)
{
  return atomic_fetch_add_explicit((atomic_ullong *volatile)__theValue, __theAmount, memory_order_relaxed) + __theAmount;
}

int64_t OSAtomicAdd64Barrier(int64_t __theAmount, OSAtomic_int64_aligned64_t *__theValue)
{
  return atomic_fetch_add((atomic_ullong *volatile)__theValue, __theAmount) + __theAmount;
}

int64_t OSAtomicIncrement64(OSAtomic_int64_aligned64_t *__theValue)
{
  return atomic_fetch_add_explicit((atomic_ullong *volatile)__theValue, 1uLL, memory_order_relaxed) + 1;
}

int64_t OSAtomicIncrement64Barrier(OSAtomic_int64_aligned64_t *__theValue)
{
  return atomic_fetch_add((atomic_ullong *volatile)__theValue, 1uLL) + 1;
}

int64_t OSAtomicDecrement64(OSAtomic_int64_aligned64_t *__theValue)
{
  return atomic_fetch_add_explicit((atomic_ullong *volatile)__theValue, 0xFFFFFFFFFFFFFFFFLL, memory_order_relaxed) - 1;
}

int64_t OSAtomicDecrement64Barrier(OSAtomic_int64_aligned64_t *__theValue)
{
  return atomic_fetch_add((atomic_ullong *volatile)__theValue, 0xFFFFFFFFFFFFFFFFLL) - 1;
}

int32_t OSAtomicAnd32(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_and_explicit((atomic_uint *volatile)__theValue, __theMask, memory_order_relaxed) & __theMask;
}

int32_t OSAtomicAnd32Barrier(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_and((atomic_uint *volatile)__theValue, __theMask) & __theMask;
}

int32_t OSAtomicAnd32Orig(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_and_explicit((atomic_uint *volatile)__theValue, __theMask, memory_order_relaxed);
}

int32_t OSAtomicAnd32OrigBarrier(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_and((atomic_uint *volatile)__theValue, __theMask);
}

int32_t OSAtomicOr32(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_or_explicit((atomic_uint *volatile)__theValue, __theMask, memory_order_relaxed) | __theMask;
}

int32_t OSAtomicOr32Barrier(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_or((atomic_uint *volatile)__theValue, __theMask) | __theMask;
}

int32_t OSAtomicOr32Orig(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_or_explicit((atomic_uint *volatile)__theValue, __theMask, memory_order_relaxed);
}

int32_t OSAtomicOr32OrigBarrier(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_or((atomic_uint *volatile)__theValue, __theMask);
}

int32_t OSAtomicXor32(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_xor_explicit((atomic_uint *volatile)__theValue, __theMask, memory_order_relaxed) ^ __theMask;
}

int32_t OSAtomicXor32Barrier(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_xor((atomic_uint *volatile)__theValue, __theMask) ^ __theMask;
}

int32_t OSAtomicXor32Orig(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_xor_explicit((atomic_uint *volatile)__theValue, __theMask, memory_order_relaxed);
}

int32_t OSAtomicXor32OrigBarrier(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_xor((atomic_uint *volatile)__theValue, __theMask);
}

BOOL OSAtomicCompareAndSwap32(int32_t __oldValue, int32_t __newValue, int32_t *__theValue)
{
  int32_t v3 = __oldValue;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)__theValue, (unsigned int *)&v3, __newValue, memory_order_relaxed, memory_order_relaxed);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwap32Barrier(int32_t __oldValue, int32_t __newValue, int32_t *__theValue)
{
  int32_t v3 = __oldValue;
  atomic_compare_exchange_strong((atomic_uint *volatile)__theValue, (unsigned int *)&v3, __newValue);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwapPtr(void *__oldValue, void *__newValue, void **__theValue)
{
  int32_t v3 = __oldValue;
  atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)__theValue, (unint64_t *)&v3, (unint64_t)__newValue, memory_order_relaxed, memory_order_relaxed);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwapPtrBarrier(void *__oldValue, void *__newValue, void **__theValue)
{
  int32_t v3 = __oldValue;
  atomic_compare_exchange_strong((atomic_ullong *volatile)__theValue, (unint64_t *)&v3, (unint64_t)__newValue);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwapInt(int __oldValue, int __newValue, int *__theValue)
{
  int v3 = __oldValue;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)__theValue, (unsigned int *)&v3, __newValue, memory_order_relaxed, memory_order_relaxed);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwapIntBarrier(int __oldValue, int __newValue, int *__theValue)
{
  int v3 = __oldValue;
  atomic_compare_exchange_strong((atomic_uint *volatile)__theValue, (unsigned int *)&v3, __newValue);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwapLong(uint64_t __oldValue, uint64_t __newValue, uint64_t *__theValue)
{
  uint64_t v3 = __oldValue;
  atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)__theValue, (unint64_t *)&v3, __newValue, memory_order_relaxed, memory_order_relaxed);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwapLongBarrier(uint64_t __oldValue, uint64_t __newValue, uint64_t *__theValue)
{
  uint64_t v3 = __oldValue;
  atomic_compare_exchange_strong((atomic_ullong *volatile)__theValue, (unint64_t *)&v3, __newValue);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwap64(int64_t __oldValue, int64_t __newValue, OSAtomic_int64_aligned64_t *__theValue)
{
  int64_t v3 = __oldValue;
  atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)__theValue, (unint64_t *)&v3, __newValue, memory_order_relaxed, memory_order_relaxed);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwap64Barrier(int64_t __oldValue, int64_t __newValue, OSAtomic_int64_aligned64_t *__theValue)
{
  int64_t v3 = __oldValue;
  atomic_compare_exchange_strong((atomic_ullong *volatile)__theValue, (unint64_t *)&v3, __newValue);
  return v3 == __oldValue;
}

BOOL OSAtomicTestAndSet(uint32_t __n, void *__theAddress)
{
  unint64_t v2 = (unint64_t)__theAddress & 0xFFFFFFFFFFFFFFFCLL;
  if ((__theAddress & 3) == 0) {
    unint64_t v2 = (unint64_t)__theAddress;
  }
  return (atomic_fetch_or_explicit((atomic_uint *volatile)(v2 + (((__n + 8 * (__theAddress & 3)) >> 3) & 0x1FFFFFFC)), 0x80u >> (__n & 7) << ((__n + 8 * (__theAddress & 3)) & 0x18), memory_order_relaxed) & (0x80u >> (__n & 7) << ((__n + 8 * (__theAddress & 3)) & 0x18))) != 0;
}

BOOL OSAtomicTestAndSetBarrier(uint32_t __n, void *__theAddress)
{
  unint64_t v2 = (unint64_t)__theAddress & 0xFFFFFFFFFFFFFFFCLL;
  if ((__theAddress & 3) == 0) {
    unint64_t v2 = (unint64_t)__theAddress;
  }
  return (atomic_fetch_or((atomic_uint *volatile)(v2 + (((__n + 8 * (__theAddress & 3)) >> 3) & 0x1FFFFFFC)), 0x80u >> (__n & 7) << ((__n + 8 * (__theAddress & 3)) & 0x18)) & (0x80u >> (__n & 7) << ((__n + 8 * (__theAddress & 3)) & 0x18))) != 0;
}

BOOL OSAtomicTestAndClear(uint32_t __n, void *__theAddress)
{
  unint64_t v2 = (unint64_t)__theAddress & 0xFFFFFFFFFFFFFFFCLL;
  if ((__theAddress & 3) == 0) {
    unint64_t v2 = (unint64_t)__theAddress;
  }
  return (atomic_fetch_and_explicit((atomic_uint *volatile)(v2 + (((__n + 8 * (__theAddress & 3)) >> 3) & 0x1FFFFFFC)), ~(0x80u >> (__n & 7) << ((__n + 8 * (__theAddress & 3)) & 0x18)), memory_order_relaxed) & (0x80u >> (__n & 7) << ((__n + 8 * (__theAddress & 3)) & 0x18))) != 0;
}

BOOL OSAtomicTestAndClearBarrier(uint32_t __n, void *__theAddress)
{
  unint64_t v2 = (unint64_t)__theAddress & 0xFFFFFFFFFFFFFFFCLL;
  if ((__theAddress & 3) == 0) {
    unint64_t v2 = (unint64_t)__theAddress;
  }
  return (atomic_fetch_and((atomic_uint *volatile)(v2 + (((__n + 8 * (__theAddress & 3)) >> 3) & 0x1FFFFFFC)), ~(0x80u >> (__n & 7) << ((__n + 8 * (__theAddress & 3)) & 0x18))) & (0x80u >> (__n & 7) << ((__n + 8 * (__theAddress & 3)) & 0x18))) != 0;
}

void OSAtomicEnqueue(OSQueueHead *__list, void *__new, size_t a3)
{
  _X4 = __new;
  if ((__list & 0xF) != 0)
  {
    _OSAtomicEnqueue_misalign((unint64_t *)__list, (unint64_t)__new, a3);
  }
  else
  {
    opaque1 = __list->opaque1;
    uint64_t opaque2 = __list->opaque2;
    do
    {
      *(void *)((char *)__new + a3) = opaque1;
      _X9 = opaque2;
      __asm { CASPL           X8, X9, X4, X5, [X0] }
      _ZF = _X8 == opaque1;
      opaque1 = _X8;
    }
    while (!_ZF);
  }
}

unint64_t *_OSAtomicEnqueue_misalign(unint64_t *result, unint64_t a2, uint64_t a3)
{
  unint64_t v3 = *result;
  do
  {
    do
    {
      *(void *)(a2 + a3) = v3;
      unint64_t v4 = __ldxr(result);
      BOOL v5 = v3 == v4;
      unint64_t v3 = v4;
    }
    while (!v5);
    unint64_t v3 = v4;
  }
  while (__stlxr(a2, result));
  return result;
}

void *__cdecl OSAtomicDequeue(OSQueueHead *__list, size_t a2)
{
  if ((__list & 0xF) != 0) {
    return (void *)_OSAtomicDequeue_misalign((unint64_t *)__list, a2);
  }
  unint64_t explicit = (char *)atomic_load_explicit((atomic_ullong *volatile)__list, memory_order_acquire);
  if (explicit)
  {
    do
    {
      _X4 = *(void *)&explicit[a2];
      _X7 = __list->opaque2;
      __asm { CASPA           X6, X7, X4, X5, [X0] }
      BOOL v10 = _X6 == explicit;
      if (_X6 != explicit) {
        unint64_t explicit = _X6;
      }
    }
    while (!v10 && explicit);
  }
  return explicit;
}

unint64_t _OSAtomicDequeue_misalign(unint64_t *a1, uint64_t a2)
{
  while (1)
  {
    unint64_t result = __ldaxr(a1);
    if (!result) {
      break;
    }
    if (!__stxr(*(void *)(result + a2), a1)) {
      return result;
    }
  }
  __clrex();
  return result;
}

void OSMemoryBarrier(void)
{
}

uint64_t _sigunaltstack()
{
  return __sigreturn();
}

void _sigtramp(void (*a1)(void, uint64_t, uint64_t), uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  __in_sigtramp = a3;
  a1(a3, a4, a5);
  __in_sigtramp = 0;
  __sigreturn();
  __break(1u);
}

uint64_t __platform_sigaction(int a1)
{
  if (a1 <= 0 || a1 >= 32 || a1 == 9 || a1 == 17)
  {
    *__error() = 22;
    return -1;
  }
  else
  {
    return __sigaction();
  }
}

int _setjmp(jmp_buf a1)
{
  uint64_t v21 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 56);
  *(void *)a1 = v1;
  *((void *)a1 + 1) = v2;
  *((void *)a1 + 2) = v3;
  *((void *)a1 + 3) = v4;
  *((void *)a1 + 4) = v5;
  *((void *)a1 + 5) = v6;
  *((void *)a1 + 6) = v7;
  *((void *)a1 + 7) = v8;
  *((void *)a1 + 8) = v9;
  *((void *)a1 + 9) = v10;
  *((void *)a1 + 10) = v11 ^ v21;
  *((void *)a1 + 11) = v12 ^ v21;
  *((void *)a1 + 12) = (unint64_t)&v23 ^ v21;
  *((void *)a1 + 14) = v13;
  *((void *)a1 + 15) = v14;
  *((void *)a1 + 16) = v15;
  *((void *)a1 + 17) = v16;
  *((void *)a1 + 18) = v17;
  *((void *)a1 + 19) = v18;
  *((void *)a1 + 20) = v19;
  *((void *)a1 + 21) = v20;
  return 0;
}

void _longjmp(jmp_buf a1, int a2)
{
}

int sigsetjmp(sigjmp_buf a1, int a2)
{
  a1[46] = a2;
  if (a2) {
    return setjmp(a1);
  }
  else {
    return _setjmp(a1);
  }
}

int setjmp(jmp_buf a1)
{
  *(void *)a1 = v1;
  *((void *)a1 + 1) = v2;
  sigprocmask(1, 0, (sigset_t *)a1 + 44);
  return _setjmp(a1);
}

void siglongjmp(sigjmp_buf a1, int a2)
{
  if (!a1[46]) {
    _longjmp(a1, a2);
  }
  longjmp(a1, a2);
}

void longjmp(jmp_buf a1, int a2)
{
  *(void *)uint64_t v4 = *((void *)a1 + 22);
  sigprocmask(3, v4, 0);
  _sigunaltstack();
  _longjmp(a1, a2);
}

uint64_t _platform_strstr(uint64_t a1, char *a2)
{
  uint64_t v12 = (uint64_t)(a2 + 1);
  char v11 = *a2;
  if (*a2)
  {
    unint64_t v10 = _platform_strlen(v12);
    do
    {
      uint64_t v7 = (char *)a1++;
      int v8 = *v7;
      if (!v8) {
        return 0;
      }
    }
    while ((char)v8 != v11 || _platform_strncmp_0(a1, v12, v10, v2, v3, v4, v5, v6));
    --a1;
  }
  return a1;
}

char *_platform_strcpy(char *a1, char *a2)
{
  unint64_t v3 = _platform_strlen((uint64_t)a2);
  _platform_memmove(a1, a2, v3 + 1);
  return a1;
}

unint64_t _platform_strlcpy(char *a1, char *a2, unint64_t a3)
{
  unint64_t v4 = _platform_strlen((uint64_t)a2);
  if (v4 >= a3)
  {
    if (a3)
    {
      _platform_memmove(a1, a2, a3 - 1);
      a1[a3 - 1] = 0;
    }
  }
  else
  {
    _platform_memmove(a1, a2, v4 + 1);
  }
  return v4;
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _platform_memset((int64x2_t *)__b, __c, __len);
}

char *_platform_memccpy(char *a1, char *a2, unsigned int a3, unint64_t a4)
{
  if (!a4) {
    return 0;
  }
  unint64_t v5 = _platform_memchr((uint64_t)a2, a3, a4);
  if (v5)
  {
    _platform_memmove(a1, a2, v5 - (void)a2 + 1);
    return &a1[v5 - (void)a2 + 1];
  }
  else
  {
    _platform_memmove(a1, a2, a4);
    return 0;
  }
}

char *_platform_strncpy(char *a1, char *a2, unint64_t a3)
{
  unint64_t v4 = _platform_strnlen((uint64_t)a2, a3);
  if (v4 >= a3)
  {
    _platform_memmove(a1, a2, a3);
  }
  else
  {
    _platform_memmove(a1, a2, v4);
    _platform_memset((int64x2_t *)&a1[v4], 0, a3 - v4);
  }
  return a1;
}

unint64_t _platform_strlcat(uint64_t a1, char *a2, uint64_t a3)
{
  unint64_t v5 = _platform_strlen((uint64_t)a2);
  unint64_t v4 = _platform_strnlen(a1, a3);
  if (v4 == a3) {
    return a3 + v5;
  }
  if (v5 >= a3 - v4)
  {
    _platform_memmove((char *)(a1 + v4), a2, a3 - v4 - 1);
    *(unsigned char *)(a1 + a3 - 1) = 0;
  }
  else
  {
    _platform_memmove((char *)(a1 + v4), a2, v5 + 1);
  }
  return v4 + v5;
}

char *_platform_memmove(char *result, char *a2, unint64_t a3)
{
  if (result - a2 < a3)
  {
    if (result != a2)
    {
      unint64_t v34 = &result[a3];
      v35 = &a2[a3];
      if (a3 < 0x40)
      {
        while (1)
        {
          BOOL v31 = a3 >= 8;
          a3 -= 8;
          if (!v31) {
            break;
          }
          uint64_t v50 = *((void *)v35 - 1);
          v35 -= 8;
          *((void *)v34 - 1) = v50;
          v34 -= 8;
        }
        for (unint64_t i = a3 + 8; i; --i)
        {
          char v52 = *--v35;
          *--unint64_t v34 = v52;
        }
      }
      else
      {
        if (a3 < 0x4000)
        {
          long long v47 = *((_OWORD *)v35 - 2);
          long long v48 = *((_OWORD *)v35 - 1);
          unint64_t v38 = (unint64_t)(v34 - 1) & 0xFFFFFFFFFFFFFFE0;
          uint64_t v49 = v35 - &v34[-v38];
          long long v40 = *(_OWORD *)(v49 - 32);
          long long v41 = *(_OWORD *)(v49 - 16);
          *((_OWORD *)v34 - 2) = v47;
          *((_OWORD *)v34 - 1) = v48;
          uint64_t v42 = v49 - 32;
          unint64_t v43 = v38 - (void)result - 64;
          if (v38 - (unint64_t)result > 0x40)
          {
            do
            {
              *(_OWORD *)(v38 - 32) = v40;
              *(_OWORD *)(v38 - 16) = v41;
              v38 -= 32;
              long long v40 = *(_OWORD *)(v42 - 32);
              long long v41 = *(_OWORD *)(v42 - 16);
              v42 -= 32;
              BOOL v12 = v43 > 0x20;
              v43 -= 32;
            }
            while (v12);
          }
        }
        else
        {
          long long v36 = *((_OWORD *)v35 - 2);
          long long v37 = *((_OWORD *)v35 - 1);
          unint64_t v38 = (unint64_t)(v34 - 1) & 0xFFFFFFFFFFFFFFE0;
          uint64_t v39 = v35 - &v34[-v38];
          long long v40 = *(_OWORD *)(v39 - 32);
          long long v41 = *(_OWORD *)(v39 - 16);
          *((_OWORD *)v34 - 2) = v36;
          *((_OWORD *)v34 - 1) = v37;
          uint64_t v42 = v39 - 32;
          unint64_t v43 = v38 - (void)result - 64;
          if (v38 - (unint64_t)result > 0x40)
          {
            do
            {
              *(_OWORD *)(v38 - 32) = v40;
              *(_OWORD *)(v38 - 16) = v41;
              v38 -= 32;
              long long v40 = *(_OWORD *)(v42 - 32);
              long long v41 = *(_OWORD *)(v42 - 16);
              v42 -= 32;
              BOOL v12 = v43 > 0x20;
              v43 -= 32;
            }
            while (v12);
          }
        }
        uint64_t v44 = v42 - v43;
        long long v45 = *(_OWORD *)(v44 - 32);
        long long v46 = *(_OWORD *)(v44 - 16);
        *(_OWORD *)(v38 - 32) = v40;
        *(_OWORD *)(v38 - 16) = v41;
        *(_OWORD *)unint64_t result = v45;
        *((_OWORD *)result + 1) = v46;
      }
    }
  }
  else
  {
    unint64_t v3 = result;
    if (a3 < 0x40)
    {
      while (1)
      {
        BOOL v31 = a3 >= 8;
        a3 -= 8;
        if (!v31) {
          break;
        }
        uint64_t v30 = *(void *)a2;
        a2 += 8;
        *v3++ = v30;
      }
      for (unint64_t j = a3 + 8; j; --j)
      {
        char v33 = *a2++;
        *(unsigned char *)unint64_t v3 = v33;
        unint64_t v3 = (void *)((char *)v3 + 1);
      }
    }
    else
    {
      if (a2 - result < a3)
      {
        if (a3 < 0x4000)
        {
          unint64_t v4 = (char *)((unint64_t)(result + 32) & 0xFFFFFFFFFFFFFFE0);
          long long v22 = *(_OWORD *)a2;
          long long v23 = *((_OWORD *)a2 + 1);
          unint64_t v24 = (long long *)&a2[v4 - result];
          long long v8 = *v24;
          long long v9 = v24[1];
          unint64_t v10 = v24 + 2;
          unint64_t v25 = a3 - (v4 - result);
          *(_OWORD *)unint64_t result = v22;
          *((_OWORD *)result + 1) = v23;
          BOOL v12 = v25 > 0x40;
          for (unint64_t k = v25 - 64; v12; k -= 32)
          {
            *(_OWORD *)unint64_t v4 = v8;
            *((_OWORD *)v4 + 1) = v9;
            v4 += 32;
            long long v8 = *v10;
            long long v9 = v10[1];
            v10 += 2;
            BOOL v12 = k > 0x20;
          }
        }
        else
        {
          unint64_t v4 = (char *)((unint64_t)(result + 32) & 0xFFFFFFFFFFFFFFE0);
          long long v18 = *(_OWORD *)a2;
          long long v19 = *((_OWORD *)a2 + 1);
          uint64_t v20 = (long long *)&a2[v4 - result];
          long long v8 = *v20;
          long long v9 = v20[1];
          unint64_t v10 = v20 + 2;
          unint64_t v21 = a3 - (v4 - result);
          *(_OWORD *)unint64_t result = v18;
          *((_OWORD *)result + 1) = v19;
          BOOL v12 = v21 > 0x40;
          for (unint64_t k = v21 - 64; v12; k -= 32)
          {
            *(_OWORD *)unint64_t v4 = v8;
            *((_OWORD *)v4 + 1) = v9;
            v4 += 32;
            long long v8 = *v10;
            long long v9 = v10[1];
            v10 += 2;
            BOOL v12 = k > 0x20;
          }
        }
      }
      else if (a3 < 0x4000)
      {
        unint64_t v4 = (char *)((unint64_t)(result + 32) & 0xFFFFFFFFFFFFFFE0);
        long long v14 = *(_OWORD *)a2;
        long long v15 = *((_OWORD *)a2 + 1);
        uint64_t v16 = (long long *)&a2[v4 - result];
        long long v8 = *v16;
        long long v9 = v16[1];
        unint64_t v10 = v16 + 2;
        unint64_t v17 = a3 - (v4 - result);
        *(_OWORD *)unint64_t result = v14;
        *((_OWORD *)result + 1) = v15;
        BOOL v12 = v17 > 0x40;
        for (unint64_t k = v17 - 64; v12; k -= 32)
        {
          *(_OWORD *)unint64_t v4 = v8;
          *((_OWORD *)v4 + 1) = v9;
          v4 += 32;
          long long v8 = *v10;
          long long v9 = v10[1];
          v10 += 2;
          BOOL v12 = k > 0x20;
        }
      }
      else
      {
        unint64_t v4 = (char *)((unint64_t)(result + 32) & 0xFFFFFFFFFFFFFFE0);
        long long v5 = *(_OWORD *)a2;
        long long v6 = *((_OWORD *)a2 + 1);
        uint64_t v7 = (long long *)&a2[v4 - result];
        long long v8 = *v7;
        long long v9 = v7[1];
        unint64_t v10 = v7 + 2;
        unint64_t v11 = a3 - (v4 - result);
        *(_OWORD *)unint64_t result = v5;
        *((_OWORD *)result + 1) = v6;
        BOOL v12 = v11 > 0x40;
        for (unint64_t k = v11 - 64; v12; k -= 32)
        {
          *(_OWORD *)unint64_t v4 = v8;
          *((_OWORD *)v4 + 1) = v9;
          v4 += 32;
          long long v8 = *v10;
          long long v9 = v10[1];
          v10 += 2;
          BOOL v12 = k > 0x20;
        }
      }
      uint64_t v26 = (long long *)((char *)v10 + k);
      long long v27 = *v26;
      long long v28 = v26[1];
      *(_OWORD *)unint64_t v4 = v8;
      *((_OWORD *)v4 + 1) = v9;
      unsigned int v29 = &v4[k];
      *((_OWORD *)v29 + 2) = v27;
      *((_OWORD *)v29 + 3) = v28;
    }
  }
  return result;
}

unint64_t _platform_strcmp_VARIANT_Base(int8x16_t *a1, int8x16_t *a2)
{
  while ((a1 & 0xF) != 0)
  {
    unsigned int v3 = a1->u8[0];
    a1 = (int8x16_t *)((char *)a1 + 1);
    uint64_t v2 = v3;
    unsigned int v4 = a2->u8[0];
    a2 = (int8x16_t *)((char *)a2 + 1);
    uint64_t v5 = v2 - v4;
    if (v2 != v4 || v2 == 0) {
      return v5;
    }
  }
  if ((a2 & 0xF) != 0)
  {
    uint64_t v8 = -(uint64_t)a2 & 0xFF0;
    if (!v8) {
      goto LABEL_12;
    }
LABEL_10:
    while (1)
    {
      int8x16_t v9 = *a1++;
      int8x16_t v10 = v9;
      int8x16_t v11 = *a2++;
      int8x16_t v13 = vceqq_s8(v10, v11);
      uint8x16_t v12 = (uint8x16_t)vandq_s8(v10, v13);
      v13.i8[0] = vminvq_u8(v12);
      if (!v13.i32[0]) {
        break;
      }
      v8 -= 16;
      if (!v8)
      {
LABEL_12:
        while (1)
        {
          unsigned int v15 = a1->u8[0];
          a1 = (int8x16_t *)((char *)a1 + 1);
          uint64_t v14 = v15;
          unsigned int v16 = a2->u8[0];
          a2 = (int8x16_t *)((char *)a2 + 1);
          uint64_t v5 = v14 - v16;
          if (v14 != v16 || v14 == 0) {
            return v5;
          }
          if ((a1 & 0xF) == 0)
          {
            uint64_t v8 = 4080;
            goto LABEL_10;
          }
        }
      }
    }
  }
  else
  {
    do
    {
      int8x16_t v18 = *a1++;
      int8x16_t v19 = v18;
      int8x16_t v20 = *a2++;
      int8x16_t v13 = vceqq_s8(v19, v20);
      uint8x16_t v12 = (uint8x16_t)vandq_s8(v19, v13);
      v13.i8[0] = vminvq_u8(v12);
    }
    while (v13.i32[0]);
  }
  uint8x16_t v21 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v12, (uint8x16_t)veorq_s8(v13, v13)), (int8x16_t)xmmword_6860);
  v21.i8[0] = vminvq_u8(v21);
  return a1[-1].u8[v21.u32[0]] - (unint64_t)a2[-1].u8[v21.u32[0]];
}

int ffs(int a1)
{
  return 32 - __clz(a1 & -a1);
}

int ffsll(uint64_t a1)
{
  return 64 - __clz(a1 & -a1);
}

int fls(int a1)
{
  return 32 - __clz(a1);
}

int flsll(uint64_t a1)
{
  return 64 - __clz(a1);
}

unint64_t _platform_memchr(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a3) {
    return 0;
  }
  if (a3 < 0)
  {
    int8x16_t v13 = vdupq_n_s8(a2);
    uint64_t v14 = a1 & 0xF;
    unint64_t v15 = a1 & 0xFFFFFFFFFFFFFFF0;
    int8x16_t v16 = *(int8x16_t *)&algn_69B0[-v14];
    for (uint8x16_t i = (uint8x16_t)vorrq_s8(vsubq_s8(*(int8x16_t *)v15, v13), v16); ; uint8x16_t i = (uint8x16_t)vsubq_s8(v18, v13))
    {
      v16.i8[0] = vminvq_u8(i);
      if (!v16.i32[0]) {
        break;
      }
      int8x16_t v18 = *(int8x16_t *)(v15 + 16);
      v15 += 16;
    }
    uint8x16_t v19 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(i, (uint8x16_t)veorq_s8(v13, v13)), (int8x16_t)xmmword_69A0);
    v19.i8[0] = vminvq_u8(v19);
    return v15 + v19.u32[0];
  }
  else
  {
    int8x16_t v3 = vdupq_n_s8(a2);
    uint64_t v4 = a1 & 0xF;
    unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFF0;
    int8x16_t v6 = *(int8x16_t *)&algn_69B0[-v4];
    uint8x16_t v7 = (uint8x16_t)vorrq_s8(vsubq_s8(*(int8x16_t *)v5, v3), v6);
    unint64_t v8 = a3 + v4;
    while (1)
    {
      v6.i8[0] = vminvq_u8(v7);
      if (!v6.i32[0]) {
        break;
      }
      BOOL v10 = v8 > 0x10;
      v8 -= 16;
      if (!v10) {
        return 0;
      }
      int8x16_t v9 = *(int8x16_t *)(v5 + 16);
      v5 += 16;
      uint8x16_t v7 = (uint8x16_t)vsubq_s8(v9, v3);
    }
    uint8x16_t v12 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v7, (uint8x16_t)veorq_s8(v3, v3)), (int8x16_t)xmmword_69A0);
    v12.i8[0] = vminvq_u8(v12);
    unint64_t result = v5 + v12.u32[0];
    if (v12.u32[0] >= v8) {
      return 0;
    }
  }
  return result;
}

unint64_t _platform_memcmp(unint64_t *a1, unint64_t *a2, unint64_t a3)
{
  BOOL v3 = a3 >= 0x10;
  unint64_t v4 = a3 - 16;
  if (!v3)
  {
    BOOL v3 = __CFADD__(v4, 8);
    unint64_t v17 = v4 + 8;
    if (v3)
    {
      unint64_t v19 = *a1++;
      unint64_t v18 = v19;
      unint64_t v21 = *a2++;
      unint64_t v20 = v21;
      unint64_t v22 = v18 - v21;
      if (v18 != v21) {
        goto LABEL_18;
      }
      v17 -= 8;
    }
    BOOL v3 = __CFADD__(v17, 4);
    unint64_t v23 = v17 + 4;
    if (!v3)
    {
      v23 += 4;
      unint64_t v22 = 0;
      goto LABEL_20;
    }
    unsigned int v24 = *(_DWORD *)a1;
    a1 = (unint64_t *)((char *)a1 + 4);
    unint64_t v18 = v24;
    unsigned int v25 = *(_DWORD *)a2;
    a2 = (unint64_t *)((char *)a2 + 4);
    unint64_t v20 = v25;
    unint64_t v22 = v18 - v25;
    if (v18 == v25)
    {
      do
      {
LABEL_20:
        BOOL v3 = v23-- != 0;
        if (!v3) {
          break;
        }
        unsigned int v28 = *(unsigned __int8 *)a1;
        a1 = (unint64_t *)((char *)a1 + 1);
        uint64_t v27 = v28;
        unsigned int v29 = *(unsigned __int8 *)a2;
        a2 = (unint64_t *)((char *)a2 + 1);
        unint64_t v22 = v27 - v29;
      }
      while (v27 == v29);
      return v22;
    }
LABEL_18:
    unint64_t v26 = __clz(bswap64(v22)) & 0xFFFFFFFFFFFFFFF8;
    return (v18 >> v26) - (unint64_t)(v20 >> v26);
  }
  if (v4)
  {
    unint64_t v5 = (unint64_t *)((char *)a1 + v4);
    int8x16_t v6 = (unint64_t *)((char *)a2 + v4);
    while (1)
    {
      int8x16_t v7 = *(int8x16_t *)a1;
      a1 += 2;
      int8x16_t v8 = v7;
      int8x16_t v9 = *(int8x16_t *)a2;
      a2 += 2;
      int8x16_t v10 = vceqq_s8(v8, v9);
      v8.i8[0] = vminvq_u8((uint8x16_t)v10);
      if (!v8.i32[0]) {
        break;
      }
      BOOL v11 = v4 > 0x10;
      v4 -= 16;
      if (!v11)
      {
        a1 = v5;
        a2 = v6;
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    int8x16_t v12 = *(int8x16_t *)a1;
    a1 += 2;
    int8x16_t v13 = v12;
    int8x16_t v14 = *(int8x16_t *)a2;
    a2 += 2;
    int8x16_t v10 = vceqq_s8(v13, v14);
    v13.i8[0] = vminvq_u8((uint8x16_t)v10);
    if (v13.i32[0]) {
      return 0;
    }
  }
  uint8x16_t v16 = (uint8x16_t)vorrq_s8(v10, (int8x16_t)xmmword_6AC0);
  v16.i8[0] = vminvq_u8(v16);
  return *((unsigned __int8 *)a1 + v16.u32[0] - 16) - (unint64_t)*((unsigned __int8 *)a2 + v16.u32[0] - 16);
}

unint64_t _platform_strnlen(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    return _platform_strlen(a1);
  }
  if (!a2) {
    return 0;
  }
  unint64_t v3 = a1 & 0xFFFFFFFFFFFFFFF0;
  unint64_t v4 = (int8x16_t *)&algn_6C10[-(a1 & 0xF)];
  int8x16_t v5 = *v4;
  uint8x16_t v6 = (uint8x16_t)vorrq_s8(*(int8x16_t *)(a1 & 0xFFFFFFFFFFFFFFF0), *v4);
  unint64_t v7 = a2 + (a1 & 0xF);
  while (1)
  {
    v5.i8[0] = vminvq_u8(v6);
    if (!v5.i32[0]) {
      break;
    }
    BOOL v9 = v7 > 0x10;
    v7 -= 16;
    if (!v9) {
      return v3 - a1 + v7 + 16;
    }
    uint8x16_t v8 = *(uint8x16_t *)(v3 + 16);
    v3 += 16;
    uint8x16_t v6 = v8;
  }
  uint8x16_t v10 = (uint8x16_t)veorq_s8(v5, v5);
  v10.i8[0] = vminvq_u8((uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v6, v10), (int8x16_t)xmmword_6C00));
  unint64_t v11 = v3 - a1;
  if (v7 >= v10.u32[0]) {
    unint64_t v7 = v10.u32[0];
  }
  return v11 + v7;
}

unint64_t _platform_strlen(uint64_t a1)
{
  unint64_t v1 = a1 & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (int8x16_t *)&algn_6C10[-(a1 & 0xF)];
  int8x16_t v3 = *v2;
  for (uint8x16_t i = (uint8x16_t)vorrq_s8(*(int8x16_t *)(a1 & 0xFFFFFFFFFFFFFFF0), *v2); ; uint8x16_t i = v5)
  {
    v3.i8[0] = vminvq_u8(i);
    if (!v3.i32[0]) {
      break;
    }
    uint8x16_t v5 = *(uint8x16_t *)(v1 + 16);
    v1 += 16;
  }
  uint8x16_t v6 = (uint8x16_t)veorq_s8(v3, v3);
  v6.i8[0] = vminvq_u8((uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(i, v6), (int8x16_t)xmmword_6C00));
  return v1 - a1 + v6.u32[0];
}

unint64_t _platform_strncmp_VARIANT_Base(int8x16_t *a1, int8x16_t *a2, unint64_t a3)
{
  uint64_t v3 = 0;
  if (!a3) {
    return v3;
  }
  while ((a1 & 0xF) != 0)
  {
    unsigned int v5 = a1->u8[0];
    a1 = (int8x16_t *)((char *)a1 + 1);
    uint64_t v4 = v5;
    unsigned int v6 = a2->u8[0];
    a2 = (int8x16_t *)((char *)a2 + 1);
    uint64_t v3 = v4 - v6;
    if (v4 == v6 && v4 != 0)
    {
      if (--a3) {
        continue;
      }
    }
    return v3;
  }
  if ((a2 & 0xF) == 0) {
    goto LABEL_30;
  }
  unint64_t v9 = -(uint64_t)a2 & 0xFF0;
  if (!v9) {
    goto LABEL_16;
  }
LABEL_11:
  if (a3 > v9)
  {
    unint64_t v10 = a3 - v9;
    while (1)
    {
      int8x16_t v11 = *a1++;
      int8x16_t v12 = v11;
      int8x16_t v13 = *a2++;
      int8x16_t v15 = vceqq_s8(v12, v13);
      uint8x16_t v14 = (uint8x16_t)vandq_s8(v12, v15);
      v15.i8[0] = vminvq_u8(v14);
      if (!v15.i32[0]) {
        break;
      }
      v9 -= 16;
      if (!v9)
      {
        a3 = v10;
LABEL_16:
        while (1)
        {
          unsigned int v17 = a1->u8[0];
          a1 = (int8x16_t *)((char *)a1 + 1);
          uint64_t v16 = v17;
          unsigned int v18 = a2->u8[0];
          a2 = (int8x16_t *)((char *)a2 + 1);
          uint64_t v3 = v16 - v18;
          if (v16 != v18 || v16 == 0) {
            return v3;
          }
          if (!--a3) {
            return v3;
          }
          if ((a1 & 0xF) == 0)
          {
            unint64_t v9 = 4080;
            goto LABEL_11;
          }
        }
      }
    }
  }
  else
  {
LABEL_30:
    while (1)
    {
      int8x16_t v20 = *a1++;
      int8x16_t v21 = v20;
      int8x16_t v22 = *a2++;
      int8x16_t v15 = vceqq_s8(v21, v22);
      uint8x16_t v14 = (uint8x16_t)vandq_s8(v21, v15);
      v15.i8[0] = vminvq_u8(v14);
      if (!v15.i32[0]) {
        break;
      }
      BOOL v23 = a3 > 0x10;
      a3 -= 16;
      if (!v23) {
        return 0;
      }
    }
  }
  uint8x16_t v24 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v14, (uint8x16_t)veorq_s8(v15, v15)), (int8x16_t)xmmword_6D20);
  v24.i8[0] = vminvq_u8(v24);
  if (v24.u32[0] >= a3) {
    return 0;
  }
  else {
    return a1[-1].u8[v24.u32[0]] - (unint64_t)a2[-1].u8[v24.u32[0]];
  }
}

int8x16_t *_platform_bzero(int8x16_t *result, unint64_t a2, int8x16_t a3)
{
  int8x16_t v3 = veorq_s8(a3, a3);
  if (a2 < 0x40) {
    JUMPOUT(0x6F54);
  }
  if (a2 < 0x8000) {
    JUMPOUT(0x6F0CLL);
  }
  atomic_uint *result = v3;
  result[1] = v3;
  result[2] = v3;
  result[3] = v3;
  unint64_t v4 = (unint64_t)&result[4] & 0xFFFFFFFFFFFFFFC0;
  unint64_t v5 = (unint64_t)result[-4].u64 + a2 - v4;
  if ((unint64_t)result->u64 + a2 > v4 + 64)
  {
    do
    {
      __asm { DC              ZVA, X3 }
      v4 += 64;
      BOOL v10 = v5 > 0x40;
      v5 -= 64;
    }
    while (v10);
  }
  int8x16_t v11 = (int8x16_t *)(v4 + v5);
  *int8x16_t v11 = v3;
  v11[1] = v3;
  v11[2] = v3;
  v11[3] = v3;
  return result;
}

int64x2_t *_platform_memset(int64x2_t *result, unsigned __int8 a2, unint64_t a3)
{
  unint64_t v3 = 0x101010101010101 * a2;
  int64x2_t v4 = vdupq_n_s64(v3);
  unint64_t v5 = (unint64_t *)result;
  if (a3 < 0x40)
  {
    while (1)
    {
      BOOL v15 = a3 >= 8;
      a3 -= 8;
      if (!v15) {
        break;
      }
      *v5++ = v3;
    }
    for (unint64_t i = a3 + 8; i; --i)
    {
      *(unsigned char *)unint64_t v5 = v3;
      unint64_t v5 = (unint64_t *)((char *)v5 + 1);
    }
  }
  else if (a3 < 0x8000)
  {
    atomic_uint *result = v4;
    result[1] = v4;
    result[2] = v4;
    result[3] = v4;
    int8x16_t v11 = (_OWORD *)((unint64_t)&result[4] & 0xFFFFFFFFFFFFFFC0);
    unint64_t v12 = (unint64_t)result->u64 + a3;
    BOOL v8 = v12 > (unint64_t)(v11 + 4);
    for (unint64_t j = v12 - (void)(v11 + 4); v8; j -= 64)
    {
      *int8x16_t v11 = v4;
      v11[1] = v4;
      v11[2] = v4;
      v11[3] = v4;
      v11 += 4;
      BOOL v8 = j > 0x40;
    }
    uint8x16_t v14 = (int64x2_t *)((char *)v11 + j);
    *uint8x16_t v14 = v4;
    v14[1] = v4;
    v14[2] = v4;
    v14[3] = v4;
  }
  else
  {
    if (!v3) {
      JUMPOUT(0x6E60);
    }
    atomic_uint *result = v4;
    result[1] = v4;
    result[2] = v4;
    result[3] = v4;
    unsigned int v6 = (_OWORD *)((unint64_t)&result[4] & 0xFFFFFFFFFFFFFFC0);
    unint64_t v7 = (unint64_t)result->u64 + a3;
    BOOL v8 = v7 > (unint64_t)(v6 + 4);
    for (unint64_t k = v7 - (void)(v6 + 4); v8; k -= 64)
    {
      *unsigned int v6 = v4;
      v6[1] = v4;
      v6[2] = v4;
      v6[3] = v4;
      v6 += 4;
      BOOL v8 = k > 0x40;
    }
    BOOL v10 = (int64x2_t *)((char *)v6 + k);
    *BOOL v10 = v4;
    v10[1] = v4;
    v10[2] = v4;
    v10[3] = v4;
  }
  return result;
}

BOOL _platform_memcmp_zero_aligned8(int8x16_t *a1, unint64_t a2)
{
  if (a2 < 0x40)
  {
    if (a2)
    {
      uint64_t v12 = 0;
      do
      {
        uint64_t v13 = a1->i64[0];
        a1 = (int8x16_t *)((char *)a1 + 8);
        v12 |= v13;
        BOOL v9 = a2 > 8;
        a2 -= 8;
      }
      while (v9);
      return v12 != 0;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v2 = a1;
    unint64_t v3 = (int8x16_t *)((unint64_t)&a1[4] & 0xFFFFFFFFFFFFFFC0);
    int8x16_t v4 = *v2;
    int8x16_t v5 = v2[1];
    int8x16_t v6 = v2[2];
    int8x16_t v7 = v2[3];
    unint64_t v8 = a2 - ((char *)v3 - (char *)v2);
    BOOL v9 = v8 > 0x40;
    for (unint64_t i = v8 - 64; v9; i -= 64)
    {
      int8x16_t v4 = vorrq_s8(v4, *v3);
      int8x16_t v5 = vorrq_s8(v5, v3[1]);
      int8x16_t v6 = vorrq_s8(v6, v3[2]);
      int8x16_t v7 = vorrq_s8(v7, v3[3]);
      v3 += 4;
      BOOL v9 = i > 0x40;
    }
    return vmaxvq_u8((uint8x16_t)vorrq_s8(vorrq_s8(vorrq_s8(v4, *(int8x16_t *)((char *)v3 + i)), vorrq_s8(v5, *(int8x16_t *)((char *)&v3[1] + i))), vorrq_s8(vorrq_s8(v6, *(int8x16_t *)((char *)&v3[2] + i)), vorrq_s8(v7, *(int8x16_t *)((char *)&v3[3] + i))))) != 0;
  }
}

void _platform_memset_pattern4(uint64_t a1, const float *a2, unint64_t a3)
{
  if (a3 >= 0x40)
  {
    if (a3 >= 0x8000) {
      JUMPOUT(0x7094);
    }
    JUMPOUT(0x7110);
  }
  JUMPOUT(0x7190);
}

void _platform_memset_pattern8(uint64_t a1, const double *a2, unint64_t a3)
{
  if (a3 >= 0x40)
  {
    if (a3 >= 0x8000) {
      JUMPOUT(0x7094);
    }
    JUMPOUT(0x7110);
  }
  JUMPOUT(0x7190);
}

int8x16_t *_platform_memset_pattern16(int8x16_t *result, int8x16_t *a2, unint64_t a3)
{
  int8x16_t v3 = *a2;
  if (a3 < 0x40)
  {
    while (1)
    {
      BOOL v14 = a3 >= 0x10;
      a3 -= 16;
      if (!v14) {
        break;
      }
      *result++ = v3;
    }
    unint64_t v15 = a3 + 16;
    if (v15)
    {
      unint64_t v17 = v3.u64[1];
      unint64_t v16 = v3.i64[0];
      do
      {
        result->i8[0] = v16;
        unint64_t result = (int8x16_t *)((char *)result + 1);
        unint64_t v16 = (v16 >> 8) | (v17 << 56);
        v17 >>= 8;
        --v15;
      }
      while (v15);
    }
  }
  else
  {
    if (a3 < 0x8000)
    {
      atomic_uint *result = v3;
      result[1] = v3;
      result[2] = v3;
      result[3] = v3;
      int8x16_t v4 = (_OWORD *)((unint64_t)&result[4] & 0xFFFFFFFFFFFFFFC0);
      unint64_t v12 = (unint64_t)result->u64 + a3;
      BOOL v6 = v12 > (unint64_t)(v4 + 4);
      unint64_t v7 = v12 - (void)(v4 + 4);
      uint64_t v8 = ((_BYTE)v4 - (_BYTE)result) & 0xF;
      if (v6)
      {
        int8x16_t v13 = vqtbl1q_s8(v3, *(int8x16_t *)((char *)qword_71E0 + v8));
        do
        {
          *int8x16_t v4 = v13;
          v4[1] = v13;
          sigset_t v4[2] = v13;
          v4[3] = v13;
          v4 += 4;
          BOOL v6 = v7 > 0x40;
          v7 -= 64;
        }
        while (v6);
      }
    }
    else
    {
      atomic_uint *result = v3;
      result[1] = v3;
      result[2] = v3;
      result[3] = v3;
      int8x16_t v4 = (_OWORD *)((unint64_t)&result[4] & 0xFFFFFFFFFFFFFFC0);
      unint64_t v5 = (unint64_t)result->u64 + a3;
      BOOL v6 = v5 > (unint64_t)(v4 + 4);
      unint64_t v7 = v5 - (void)(v4 + 4);
      uint64_t v8 = ((_BYTE)v4 - (_BYTE)result) & 0xF;
      if (v6)
      {
        int8x16_t v9 = vqtbl1q_s8(v3, *(int8x16_t *)((char *)qword_71E0 + v8));
        do
        {
          *int8x16_t v4 = v9;
          v4[1] = v9;
          sigset_t v4[2] = v9;
          v4[3] = v9;
          v4 += 4;
          BOOL v6 = v7 > 0x40;
          v7 -= 64;
        }
        while (v6);
      }
    }
    int8x16_t v10 = vqtbl1q_s8(v3, *(int8x16_t *)((char *)qword_71E0 + (((_BYTE)v8 + (_BYTE)v7) & 0xF)));
    int8x16_t v11 = (int8x16_t *)((char *)v4 + v7);
    *int8x16_t v11 = v10;
    v11[1] = v10;
    v11[2] = v10;
    v11[3] = v10;
  }
  return result;
}

unint64_t (*_platform_strcmp())(int8x16_t *a1, int8x16_t *a2)
{
  return _platform_strcmp_VARIANT_Base;
}

unint64_t (*_platform_strncmp())(int8x16_t *a1, int8x16_t *a2, unint64_t a3)
{
  return _platform_strncmp_VARIANT_Base;
}

unsigned __int8 *_platform_strchr(uint64_t a1, unsigned __int8 a2)
{
  int8x16_t v2 = vdupq_n_s8(a2);
  uint64_t v3 = a1 & 0xF;
  unint64_t v4 = a1 & 0xFFFFFFFFFFFFFFF0;
  int8x16_t v5 = *(int8x16_t *)&algn_7590[-v3];
  for (uint8x16_t i = (uint8x16_t)vorrq_s8(vbicq_s8(*(int8x16_t *)v4, vceqq_s8(*(int8x16_t *)v4, v2)), v5);
        ;
        uint8x16_t i = (uint8x16_t)vbicq_s8(v7, v5))
  {
    v5.i8[0] = vminvq_u8(i);
    if (!v5.i32[0]) {
      break;
    }
    int8x16_t v7 = *(int8x16_t *)(v4 + 16);
    v4 += 16;
    int8x16_t v5 = vceqq_s8(v7, v2);
  }
  uint8x16_t v8 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(i, (uint8x16_t)veorq_s8(v5, v5)), (int8x16_t)xmmword_7580);
  v8.i8[0] = vminvq_u8(v8);
  unint64_t result = (unsigned __int8 *)(v4 + v8.u32[0]);
  if (a2 != (unint64_t)*result) {
    return 0;
  }
  return result;
}

uint64_t swapcontext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 && a2)
  {
    *(_DWORD *)a1 &= ~0x80000000;
    uint64_t v10 = *(void *)(a1 + 32);
    unsigned int v11 = getcontext(a1, a2, a3, a4, a5, a6, a7, a8, v9);
    *(void *)(a1 + 32) = v10;
    if (!v11 && *(int *)a1 >= 0)
    {
      *(_DWORD *)a1 |= 0x80000000;
      return setcontext(a2);
    }
    return v11;
  }
  else
  {
    *__error() = 22;
    return -1;
  }
}

uint64_t _ctx_done(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    _exit(0);
  }
  *(void *)(a1 + 40) = 0;
  uint64_t result = setcontext(*(void *)(a1 + 32));
  __break(1u);
  return result;
}

int8x16_t *makecontext(int8x16_t *result, uint64_t a2, int a3, int8x16_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  BOOL v23 = (uint64_t *)result;
  if (result)
  {
    if (result->i64[1] && a3 <= 0x40000)
    {
      result[3].i64[0] = (uint64_t)result[4].i64;
      uint64_t result = _platform_bzero((int8x16_t *)result->i64[1], result[1].u64[0], a4);
      unint64_t v20 = (v23[1] + v23[2]) & 0xFFFFFFFFFFFFFFF0;
      if (a3 >= 8) {
        int v15 = a3;
      }
      else {
        int v15 = 8;
      }
      unint64_t v19 = (_DWORD *)((v20 - 4 * v15) & 0xFFFFFFFFFFFFFFF0);
      unsigned int v18 = (int *)&a10;
      for (int i = 0; i < a3; ++i)
      {
        int v10 = *v18;
        v18 += 2;
        *v19++ = v10;
      }
      uint64_t v16 = v23[6];
      *(_DWORD *)(v16 + 284) &= ~1u;
      if (!v20 || (*(_DWORD *)(v16 + 284) & 1) != 0) {
        unint64_t v14 = v20;
      }
      else {
        unint64_t v14 = v20;
      }
      *(void *)(v16 + 248) = v14;
      if ((v20 - 4 * v15) & 0xFFFFFFFFFFFFFFF0) == 0 || (*(_DWORD *)(v16 + 284)) {
        unint64_t v13 = (v20 - 4 * v15) & 0xFFFFFFFFFFFFFFF0;
      }
      else {
        unint64_t v13 = (v20 - 4 * v15) & 0xFFFFFFFFFFFFFFF0;
      }
      *(void *)(v16 + 264) = v13;
      if (_ctx_start)
      {
        if ((*(_DWORD *)(v16 + 284) & 1) == 0) {
          *(_DWORD *)(v16 + 284) &= ~2u;
        }
        unint64_t v12 = _ctx_start;
      }
      else
      {
        unint64_t v12 = 0;
      }
      *(void *)(v16 + 256) = v12;
      *(_DWORD *)(v16 + 284) &= ~8u;
      *(void *)(v16 + 168) = v23;
      uint64_t v11 = 0;
      if (a2) {
        uint64_t v11 = a2;
      }
      *(void *)(v16 + 176) = v11 ^ *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 56);
    }
    else
    {
      result[2].i64[1] = 0;
    }
  }
  return result;
}

uint64_t populate_signal_stack_context(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  long long v6 = 0uLL;
  uint64_t v7 = 0;
  __sigaltstack();
  *(void *)&long long v6 = v8;
  v5.rlim_cur = 0;
  v5.rlim_max = 0;
  if (!getrlimit(3, &v5)) {
    *((void *)&v6 + 1) = v5.rlim_cur;
  }
  uint64_t v2 = v9;
  *(_OWORD *)(v9 + 8) = v6;
  *(void *)(v2 + 24) = v7;
  sigprocmask(2, 0, (sigset_t *)(v9 + 4));
  uint64_t v4 = v9 + 64;
  *(void *)(v9 + 48) = v9 + 64;
  *(void *)(v9 + 40) = 816;
  *(void *)(v9 + 32) = __in_sigtramp;
  return v4;
}

uint64_t setcontext(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    sigprocmask(3, (const sigset_t *)(a1 + 4), 0);
    return _setcontext();
  }
  else
  {
    *__error() = 22;
    return -1;
  }
}

uint64_t _setcontext()
{
  return 0;
}

void _ctx_start()
{
  ((void (*)(void, void, void, void, void, void, void, void))(v1 ^ *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 56)))(v2, v3, v4, v5, v6, v7, v8, v9);
  _ctx_done(v0);
  __break(0x29Au);
}

uint64_t getcontext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v27 = populate_signal_stack_context(a1, (uint64_t)vars0);
  uint64_t v28 = vars0[1];
  *(void *)(v27 + 248) = vars0[0];
  *(void *)(v27 + 256) = v28;
  *(void *)(v27 + 264) = &a9;
  *(_DWORD *)(v27 + 284) = 2;
  *(void *)(v27 + 168) = v9;
  *(void *)(v27 + 176) = v10;
  *(void *)(v27 + 184) = v11;
  *(void *)(v27 + 192) = v12;
  *(void *)(v27 + 200) = v13;
  *(void *)(v27 + 208) = v14;
  *(void *)(v27 + 216) = v15;
  *(void *)(v27 + 224) = v16;
  *(void *)(v27 + 232) = v17;
  *(void *)(v27 + 240) = v18;
  *(void *)(v27 + 16) = 0;
  *(void *)(v27 + 424) = v19;
  *(void *)(v27 + 440) = v20;
  *(void *)(v27 + 456) = v21;
  *(void *)(v27 + 472) = v22;
  *(void *)(v27 + 488) = v23;
  *(void *)(v27 + 504) = v24;
  *(void *)(v27 + 520) = v25;
  *(void *)(v27 + 536) = v26;
  return 0;
}

BOOL timingsafe_enable_if_supported()
{
  BOOL v7 = 0;
  uint64_t v6 = MEMORY[0xFFFFFC010] & 0x200200000000000;
  if ((MEMORY[0xFFFFFC010] & 0x200200000000000 & 0x200000000000000) != 0)
  {
    BOOL v7 = is_dit_enabled() != 0;
    __asm { MSR             DIT, #1 }
  }
  speculation_barrier(v6);
  return v7;
}

unint64_t is_dit_enabled()
{
  return (_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) >> 24) & 1;
}

void speculation_barrier(uint64_t a1)
{
  if ((a1 & 0x200000000000) != 0)
  {
    sb();
  }
  else
  {
    __dsb(0xFu);
    __isb(0xFu);
  }
}

uint64_t timingsafe_restore_if_supported(uint64_t result)
{
  if ((MEMORY[0xFFFFFC010] & 0x200200000000000 & 0x200000000000000) != 0 && (result & 1) == 0) {
    __asm { MSR             DIT, #0 }
  }
  return result;
}

void sb()
{
  __asm { SB }
}

void OSAtomicFifoEnqueue_cold_1()
{
  qword_14008 = (uint64_t)"BUG IN LIBPLATFORM: Invalid commpage pfz base.";
  qword_14038 = 0;
  __break(1u);
}

void _os_lock_corruption_abort(uint64_t a1, uint64_t a2)
{
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_lock is corrupt";
  qword_14038 = a2;
  __break(1u);
}

void _os_unfair_lock_recursive_abort(unsigned int a1)
{
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Trying to recursively lock an os_unfair_lock";
  qword_14038 = a1;
  __break(1u);
}

void _os_unfair_lock_unowned_abort(unsigned int a1)
{
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Unlock of an os_unfair_lock not owned by current thread";
  qword_14038 = a1;
  __break(1u);
}

void _os_unfair_lock_corruption_abort(unsigned int a1)
{
  if (a1 - 512 <= 0x3FE00)
  {
    qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_unfair_lock is corrupt, or owner thread exited without unlocking";
    qword_14038 = a1;
    __break(1u);
  }
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_unfair_lock is corrupt";
  qword_14038 = a1;
  __break(1u);
}

void _os_once_gate_recursive_abort(unsigned int a1)
{
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Trying to recursively lock an os_once_t";
  qword_14038 = a1;
  __break(1u);
}

void _os_once_gate_unowned_abort(unsigned int a1)
{
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Unlock of an os_once_t not owned by current thread";
  qword_14038 = a1;
  __break(1u);
}

void _os_once_gate_corruption_abort(unsigned int a1)
{
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_once_t is corrupt";
  qword_14038 = a1;
  __break(1u);
}

void _os_lock_recursive_abort(unsigned int a1)
{
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Trying to recursively lock an os_lock";
  qword_14038 = a1;
  __break(1u);
}

void os_unfair_lock_assert_owner_cold_1(unsigned int a1)
{
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Assertion failed: Lock unexpectedly not owned by current thread";
  qword_14038 = a1;
  __break(1u);
}

void os_unfair_lock_assert_not_owner_cold_1(unsigned int a1)
{
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Assertion failed: Lock unexpectedly owned by current thread";
  qword_14038 = a1;
  __break(1u);
}

void os_unfair_recursive_lock_unlock_forked_child_cold_1()
{
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Lock was not held";
  __break(1u);
}

void _os_alloc_cold_1(uint64_t a1)
{
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Requested allocation size is invalid";
  qword_14038 = a1;
  __break(1u);
}

void _os_semaphore_create_cold_1(int a1)
{
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Creating semaphore failed, possible port leak";
  qword_14038 = a1;
  __break(1u);
}

void _os_semaphore_create_cold_2()
{
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Allocating semaphore failed with MIG_REPLY_MISMATCH";
  qword_14038 = -301;
  __break(1u);
}

void _os_semaphore_dispose_cold_1(int a1)
{
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Destroying semaphore failed";
  qword_14038 = a1;
  __break(1u);
}

void _os_semaphore_signal_cold_1(int a1)
{
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Signaling semaphore failed";
  qword_14038 = a1;
  __break(1u);
}

void _os_semaphore_wait_cold_1(int a1)
{
  qword_14008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Waiting on semaphore failed";
  qword_14038 = a1;
  __break(1u);
  _platform_strcmp_0();
}

uint64_t _platform_strcmp_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _platform_strcmp_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _platform_strncmp_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _platform_strncmp_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

int *__error(void)
{
  return ___error();
}

uint64_t __libkernel_platform_init()
{
  return ___libkernel_platform_init();
}

uint64_t __sigaction()
{
  return ___sigaction();
}

uint64_t __sigaltstack()
{
  return ___sigaltstack();
}

uint64_t __sigreturn()
{
  return ___sigreturn();
}

uint64_t __ulock_wait()
{
  return ___ulock_wait();
}

uint64_t __ulock_wait2()
{
  return ___ulock_wait2();
}

uint64_t __ulock_wake()
{
  return ___ulock_wake();
}

void _exit(int a1)
{
}

int getrlimit(int a1, rlimit *a2)
{
  return _getrlimit(a1, a2);
}

uint64_t log_data_as_kernel()
{
  return _log_data_as_kernel();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return _mach_vm_deallocate(target, address, size);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return _mach_vm_map(target_task, address, size, mask, flags, object, offset, copy, cur_protection, max_protection, inheritance);
}

kern_return_t semaphore_create(task_t task, semaphore_t *semaphore, int policy, int value)
{
  return _semaphore_create(task, semaphore, policy, value);
}

kern_return_t semaphore_destroy(task_t task, semaphore_t semaphore)
{
  return _semaphore_destroy(task, semaphore);
}

kern_return_t semaphore_signal(semaphore_t semaphore)
{
  return _semaphore_signal(semaphore);
}

kern_return_t semaphore_wait(semaphore_t semaphore)
{
  return _semaphore_wait(semaphore);
}

int sigprocmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return _sigprocmask(a1, a2, a3);
}

kern_return_t thread_switch(mach_port_name_t thread_name, int option, mach_msg_timeout_t option_time)
{
  return _thread_switch(thread_name, option, option_time);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

uint64_t sub_852C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _platform_strcmp_ptr = (uint64_t (*)())_platform_strcmp();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_platform_strcmp_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_8590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _platform_strncmp_ptr = (uint64_t (*)())_platform_strncmp();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_platform_strncmp_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}