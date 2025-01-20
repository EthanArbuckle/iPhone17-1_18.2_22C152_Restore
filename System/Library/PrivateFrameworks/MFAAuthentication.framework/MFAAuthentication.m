void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_14(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_0_1@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2080;
  *(void *)(a2 + 14) = result;
  return result;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x14u);
}

double OUTLINED_FUNCTION_2_0()
{
  return 2.0542726e-289;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_3_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x2Cu);
}

void OUTLINED_FUNCTION_6(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  v12[3] = *MEMORY[0x263EF8340];
  memset(v12, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!result)
  {
    if (v12[0] == 0x2000000000000010) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v32 = 0;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if (result) {
        break;
      }
      if (a2 <= v13) {
        return 2;
      }
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3) {
          goto LABEL_58;
        }
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24 * v13 + 8)) {
          break;
        }
        uint64_t result = 2;
        if (v18)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1)) {
            continue;
          }
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4) {
          goto LABEL_59;
        }
        *(_OWORD *)v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }
    if (result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        v25 = (__int16 *)(a3 + 24 * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  v10[2] = *MEMORY[0x263EF8340];
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  uint64_t v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  v5 = &v4[v3];
  v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    unint64_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      unint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            uint64_t result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          unint64_t v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    unint64_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  v8[3] = *MEMORY[0x263EF8340];
  memset(v8, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  v9[2] = *MEMORY[0x263EF8340];
  v9[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4) {
    goto LABEL_13;
  }
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  char v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if (result) {
      break;
    }
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if (result) {
      break;
    }
    if (v7) {
      return 0;
    }
  }
  if (result <= 1) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, v4);
  if (!result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unint64_t v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t ascii_to_hex(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (a3 >= 2)
  {
    uint64_t v3 = 0;
    unint64_t v4 = a3 >> 1;
    do
    {
      uint64_t v5 = 0;
      __int16 v13 = -21846;
      char v6 = 1;
      do
      {
        char v7 = v6;
        int v8 = *(unsigned __int8 *)(a2 + (v5 | (2 * v3)));
        unsigned int v9 = v8 - 48;
        unsigned int v10 = v8 - 65;
        if ((v8 - 97) >= 6) {
          char v11 = 0;
        }
        else {
          char v11 = v8 - 87;
        }
        char v12 = v8 - 55;
        if (v10 > 5) {
          char v12 = v11;
        }
        if (v9 < 0xA) {
          char v12 = v9;
        }
        *((unsigned char *)&v13 + v5) = v12;
        uint64_t v5 = 1;
        char v6 = 0;
      }
      while ((v7 & 1) != 0);
      *(unsigned char *)(result + v3++) = HIBYTE(v13) | (16 * v13);
    }
    while (v3 != v4);
  }
  return result;
}

unsigned __int8 *printBytes(unsigned __int8 *result, uint64_t a2, char *a3, int a4)
{
  if (result)
  {
    uint64_t v4 = a2;
    if (a2)
    {
      char v7 = result;
      do
      {
        unsigned int v8 = *v7++;
        uint64_t result = (unsigned __int8 *)printf(a3, v8);
        --v4;
      }
      while (v4);
      if (a4)
      {
        return (unsigned __int8 *)putchar(10);
      }
    }
  }
  return result;
}

const char *removeNewline(const char *a1)
{
  size_t v2 = strlen(a1);
  if (v2 && a1[v2 - 1] == 10) {
    a1[v2 - 1] = 0;
  }
  return a1;
}

char *createHexString(uint64_t a1, unint64_t a2, int a3)
{
  if (a1 && a2)
  {
    if ((a2 & 0x8000000000000000) == 0)
    {
      if (!a3)
      {
        size_t v5 = (2 * a2) | 1;
LABEL_10:
        char v7 = (char *)malloc_type_malloc(v5, 0xA799D077uLL);
        if (v7)
        {
          unint64_t v8 = 0;
          unsigned int v9 = v7;
          unint64_t v14 = v7;
          unsigned int v10 = v7;
          size_t v11 = v5;
          while (a3)
          {
            if (v8 >= a2 - 1)
            {
              char v12 = v10;
              size_t v13 = v11;
              goto LABEL_17;
            }
            snprintf(v10, v11, "%02X ");
LABEL_18:
            ++v8;
            v11 -= 3;
            v10 += 3;
            v9 += 2;
            v5 -= 2;
            if (a2 == v8) {
              return v14;
            }
          }
          char v12 = v9;
          size_t v13 = v5;
LABEL_17:
          snprintf(v12, v13, "%02X");
          goto LABEL_18;
        }
        goto LABEL_21;
      }
      if (is_mul_ok(a2, 3uLL))
      {
        size_t v5 = 3 * a2;
        goto LABEL_10;
      }
    }
    do
LABEL_21:
      uint64_t result = (char *)malloc_type_malloc(0xEuLL, 0xD85E358FuLL);
    while (!result);
    strcpy(result, "<print error>");
    return result;
  }
  uint64_t result = (char *)malloc_type_malloc(7uLL, 0x55AA73BCuLL);
  if (result) {
    strcpy(result, "(null)");
  }
  return result;
}

uint64_t obfuscatedPointer(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = obfuscatedPointer_salt;
    if (!obfuscatedPointer_salt)
    {
      uint64_t v2 = random();
      obfuscatedPointer_salt = v2;
    }
    return v1 + v2;
  }
  return result;
}

BOOL getMemoryUse(void *a1, void *a2, void *a3)
{
  kern_return_t v7;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  long long v11;
  long long v12;
  long long v13;
  long long v14;
  long long v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  int v33;

  unint64_t v33 = -1431655766;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31 = v6;
  unint64_t v32 = v6;
  v29 = v6;
  v30 = v6;
  unint64_t v27 = v6;
  unint64_t v28 = v6;
  BOOL v25 = v6;
  char v26 = v6;
  unint64_t v23 = v6;
  unsigned int v24 = v6;
  uint64_t v21 = v6;
  unint64_t v22 = v6;
  unint64_t v19 = v6;
  v20 = v6;
  unint64_t v18 = v6;
  unint64_t v16 = v6;
  unint64_t v17 = v6;
  unint64_t v14 = v6;
  unint64_t v15 = v6;
  char v12 = v6;
  size_t v13 = v6;
  *(_OWORD *)task_info_out = v6;
  size_t v11 = v6;
  task_info_outCnt = 93;
  char v7 = task_info(*MEMORY[0x263EF8960], 0x16u, task_info_out, &task_info_outCnt);
  if (!v7)
  {
    if (a1) {
      *a1 = v11;
    }
    if (a2) {
      *a2 = *(void *)task_info_out;
    }
    if (a3) {
      *a3 = v19;
    }
  }
  return v7 == 0;
}

void sub_21DC563F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL mfaa_verify_veridian_signature(void *a1, uint64_t a2, const __CFData *a3, uint64_t a4)
{
  CertificateRefWithData = (__SecCertificate *)createCertificateRefWithData(a1, 1);
  if (!CertificateRefWithData) {
    return 0;
  }
  unint64_t v8 = CertificateRefWithData;
  SecKeyRef v9 = SecCertificateCopyKey(CertificateRefWithData);
  if (v9)
  {
    uint64_t v10 = v9;
    size_t v11 = [MEMORY[0x263EFF990] dataWithData:a2];
    [v11 appendData:a4];
    SecSHA256DigestCreateFromData();
    id v12 = objc_claimAutoreleasedReturnValue();
    uint64_t v13 = (const uint8_t *)[v12 bytes];
    size_t v14 = [v12 length];
    BytePtr = CFDataGetBytePtr(a3);
    size_t Length = CFDataGetLength(a3);
    uint64_t v17 = SecKeyRawVerify(v10, 0x4000u, v13, v14, BytePtr, Length);
    BOOL v18 = v17 == 0;
    if (v17) {
      NSLog(&cfstr_Seckeyrawverif.isa, v17);
    }
    else {
      NSLog(&cfstr_Authpassed.isa);
    }
    CFRelease(v10);
  }
  else
  {
    BOOL v18 = 0;
  }
  CFRelease(v8);
  return v18;
}

uint64_t getNumRevokedAuthICBatches()
{
  return 65;
}

void *getRevokedAuthICBatches()
{
  return &prefix;
}

SecKeyRef CreateKeyForAuthFeature(int a1, void *a2)
{
  if (a1) {
    return 0;
  }
  else {
    return _CreateKeyForMFi4UserPublicKey(a2, 0, 0);
  }
}

SecKeyRef _CreateKeyForMFi4UserPublicKey(void *a1, int a2, void *a3)
{
  v31[4] = *MEMORY[0x263EF8340];
  size_t v5 = a1;
  id v6 = a3;
  char v7 = [v5 dataUsingEncoding:4];
  uint64_t v8 = *MEMORY[0x263F16FB8];
  uint64_t v9 = *MEMORY[0x263F16F98];
  v30[0] = *MEMORY[0x263F16FA8];
  v30[1] = v9;
  v31[0] = v8;
  v31[1] = &unk_26CE91DB8;
  uint64_t v10 = *MEMORY[0x263F16E90];
  v31[2] = *MEMORY[0x263F16E98];
  uint64_t v11 = *MEMORY[0x263F174B8];
  v30[2] = v10;
  v30[3] = v11;
  uint64_t v12 = *MEMORY[0x263F16EE8];
  v28[0] = *MEMORY[0x263F16F50];
  v28[1] = v12;
  v29[0] = MEMORY[0x263EFFA88];
  v29[1] = v7;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  unint64_t v31[3] = v13;
  size_t v14 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];

  unint64_t v15 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v14];
  unint64_t v16 = v15;
  if (a2)
  {
    [v15 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F170B0]];
    if (v6) {
      [v16 setObject:v6 forKey:*MEMORY[0x263F170A8]];
    }
    [v16 setObject:@"com.apple.mfiaccessory" forKey:*MEMORY[0x263F16E80]];
  }
  CFErrorRef error = 0;
  SecKeyRef v17 = SecKeyCreateRandomKey((CFDictionaryRef)v16, &error);
  if (v17)
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      BOOL v18 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      BOOL v18 = MEMORY[0x263EF8438];
      id v20 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v25 = v5;
      _os_log_impl(&dword_21DC52000, v18, OS_LOG_TYPE_DEFAULT, "Successfully generated key pair for featureTag %@", buf, 0xCu);
    }
  }
  else
  {
    BOOL v18 = error;
    if (gLogObjects && gNumLogObjects >= 5)
    {
      unint64_t v19 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      unint64_t v19 = MEMORY[0x263EF8438];
      id v21 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      BOOL v25 = v18;
      __int16 v26 = 2112;
      unint64_t v27 = v5;
      _os_log_impl(&dword_21DC52000, v19, OS_LOG_TYPE_DEFAULT, "error %@, unable to generate key for featureTag %@", buf, 0x16u);
    }
  }
  return v17;
}

CFTypeRef CopyKeyForAuthFeature(int a1, void *a2)
{
  if (a1) {
    return 0;
  }
  else {
    return _CopyKeyForMFi4UserPublicKey(a2, 0, 0);
  }
}

CFTypeRef _CopyKeyForMFi4UserPublicKey(void *a1, int a2, void *a3)
{
  v35[5] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a3;
  char v7 = [v5 dataUsingEncoding:4];
  uint64_t v8 = *MEMORY[0x263F171E0];
  uint64_t v9 = *MEMORY[0x263F16EE8];
  v34[0] = *MEMORY[0x263F171B8];
  v34[1] = v9;
  v35[0] = v8;
  v35[1] = v7;
  uint64_t v10 = *MEMORY[0x263F16FB8];
  uint64_t v11 = *MEMORY[0x263F16E90];
  v34[2] = *MEMORY[0x263F16FA8];
  v34[3] = v11;
  uint64_t v12 = *MEMORY[0x263F16E98];
  v35[2] = v10;
  v35[3] = v12;
  v34[4] = *MEMORY[0x263F17530];
  v35[4] = MEMORY[0x263EFFA88];
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:5];
  size_t v14 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v13];
  unint64_t v15 = v14;
  if (a2)
  {
    [v14 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F170B0]];
    if (v6) {
      [v15 setObject:v6 forKey:*MEMORY[0x263F170A8]];
    }
    [v15 setObject:@"com.apple.mfiaccessory" forKey:*MEMORY[0x263F16E80]];
  }
  CFTypeRef result = 0;
  OSStatus v16 = SecItemCopyMatching((CFDictionaryRef)v15, &result);
  if (gLogObjects) {
    BOOL v17 = gNumLogObjects <= 4;
  }
  else {
    BOOL v17 = 1;
  }
  int v18 = !v17;
  if (!v16)
  {
    if (v18)
    {
      id v20 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      id v20 = MEMORY[0x263EF8438];
      id v25 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 138412290;
    id v33 = v5;
    __int16 v26 = "found valid key for featureTag %@ with access group check";
    goto LABEL_48;
  }
  if (v18)
  {
    unint64_t v19 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    unint64_t v19 = MEMORY[0x263EF8438];
    id v21 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v5;
    _os_log_impl(&dword_21DC52000, v19, OS_LOG_TYPE_DEFAULT, "Unable to fetch key for featureTag %@ with access group check", buf, 0xCu);
  }

  if (a2)
  {
    [v15 removeObjectForKey:*MEMORY[0x263F16E80]];
    OSStatus v22 = SecItemCopyMatching((CFDictionaryRef)v15, &result);
    if (gLogObjects) {
      BOOL v23 = gNumLogObjects <= 4;
    }
    else {
      BOOL v23 = 1;
    }
    int v24 = !v23;
    if (v22)
    {
      if (v24)
      {
        id v20 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        id v20 = MEMORY[0x263EF8438];
        id v27 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_49;
      }
      *(_DWORD *)buf = 138412290;
      id v33 = v5;
      __int16 v26 = "Unable to fetch key for featureTag %@ without access group check";
    }
    else
    {
      if (v24)
      {
        id v20 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        id v20 = MEMORY[0x263EF8438];
        id v28 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_49;
      }
      *(_DWORD *)buf = 138412290;
      id v33 = v5;
      __int16 v26 = "found valid key for featureTag %@ without access group check";
    }
LABEL_48:
    _os_log_impl(&dword_21DC52000, v20, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
LABEL_49:
  }
  CFTypeRef v29 = result;

  return v29;
}

void DeleteKeyForAuthFeature(int a1, void *a2)
{
  if (!a1) {
    _DeleteKeyForMFi4UserPublicKey(a2, 0, 0);
  }
}

void _DeleteKeyForMFi4UserPublicKey(void *a1, int a2, void *a3)
{
  v37[4] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a3;
  char v7 = [v5 dataUsingEncoding:4];
  uint64_t v8 = *MEMORY[0x263F171E0];
  uint64_t v9 = *MEMORY[0x263F16EE8];
  v36[0] = *MEMORY[0x263F171B8];
  v36[1] = v9;
  v37[0] = v8;
  v37[1] = v7;
  uint64_t v10 = *MEMORY[0x263F16FB8];
  uint64_t v11 = *MEMORY[0x263F17530];
  v36[2] = *MEMORY[0x263F16FA8];
  v36[3] = v11;
  v37[2] = v10;
  v37[3] = MEMORY[0x263EFFA88];
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];
  uint64_t v13 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v12];
  size_t v14 = v13;
  if (a2)
  {
    [v13 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F170B0]];
    if (v6) {
      [v14 setObject:v6 forKey:*MEMORY[0x263F170A8]];
    }
    [v14 setObject:@"com.apple.mfiaccessory" forKey:*MEMORY[0x263F16E80]];
  }
  OSStatus v15 = SecItemDelete((CFDictionaryRef)v14);
  if (gLogObjects) {
    BOOL v16 = gNumLogObjects <= 4;
  }
  else {
    BOOL v16 = 1;
  }
  int v17 = !v16;
  if (!v15)
  {
    if (v17)
    {
      id v20 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      id v20 = MEMORY[0x263EF8438];
      id v26 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_50;
    }
    *(_DWORD *)buf = 138412290;
    id v33 = v5;
    id v27 = "Deleted key for featureTag %@ with access group";
    goto LABEL_48;
  }
  OSStatus v18 = v15;
  if (v17)
  {
    unint64_t v19 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    unint64_t v19 = MEMORY[0x263EF8438];
    id v21 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v5;
    __int16 v34 = 1024;
    OSStatus v35 = v18;
    _os_log_impl(&dword_21DC52000, v19, OS_LOG_TYPE_DEFAULT, "Unable to delete key for featureTag %@, status = %d", buf, 0x12u);
  }

  if (a2)
  {
    [v14 removeObjectForKey:*MEMORY[0x263F16E80]];
    OSStatus v22 = SecItemDelete((CFDictionaryRef)v14);
    if (gLogObjects) {
      BOOL v23 = gNumLogObjects <= 4;
    }
    else {
      BOOL v23 = 1;
    }
    int v24 = !v23;
    if (v22)
    {
      OSStatus v25 = v22;
      if (v24)
      {
        id v20 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        id v20 = MEMORY[0x263EF8438];
        id v28 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_50;
      }
      *(_DWORD *)buf = 138412546;
      id v33 = v5;
      __int16 v34 = 1024;
      OSStatus v35 = v25;
      id v27 = "Unable to delete key for featureTag %@, without access group, status = %d";
      CFTypeRef v29 = v20;
      uint32_t v30 = 18;
LABEL_49:
      _os_log_impl(&dword_21DC52000, v29, OS_LOG_TYPE_DEFAULT, v27, buf, v30);
LABEL_50:

      goto LABEL_51;
    }
    if (v24)
    {
      id v20 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      id v20 = MEMORY[0x263EF8438];
      id v31 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_50;
    }
    *(_DWORD *)buf = 138412290;
    id v33 = v5;
    id v27 = "Deleted key for featureTag %@ without access group";
LABEL_48:
    CFTypeRef v29 = v20;
    uint32_t v30 = 12;
    goto LABEL_49;
  }
LABEL_51:
}

SecKeyRef CopyPublicKeyForAuthFeature(int a1, void *a2)
{
  if (a1) {
    return 0;
  }
  else {
    return _CopyPublicKeyForMFi4UserPublicKey(a2, 0, 0);
  }
}

SecKeyRef _CopyPublicKeyForMFi4UserPublicKey(void *a1, int a2, void *a3)
{
  v44[5] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a3;
  char v7 = [v5 dataUsingEncoding:4];
  uint64_t v8 = *MEMORY[0x263F171E0];
  uint64_t v9 = *MEMORY[0x263F16EE8];
  v43[0] = *MEMORY[0x263F171B8];
  v43[1] = v9;
  v44[0] = v8;
  v44[1] = v7;
  uint64_t v10 = *MEMORY[0x263F16FB8];
  uint64_t v11 = *MEMORY[0x263F16E90];
  v43[2] = *MEMORY[0x263F16FA8];
  v43[3] = v11;
  uint64_t v12 = *MEMORY[0x263F16E98];
  v44[2] = v10;
  v44[3] = v12;
  v43[4] = *MEMORY[0x263F17530];
  v44[4] = MEMORY[0x263EFFA88];
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:5];
  size_t v14 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v13];
  OSStatus v15 = v14;
  if (a2)
  {
    [v14 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F170B0]];
    if (v6) {
      [v15 setObject:v6 forKey:*MEMORY[0x263F170A8]];
    }
    [v15 setObject:@"com.apple.mfiaccessory" forKey:*MEMORY[0x263F16E80]];
  }
  v37 = v6;
  CFTypeRef result = 0;
  OSStatus v16 = SecItemCopyMatching((CFDictionaryRef)v15, &result);
  if (gLogObjects) {
    BOOL v17 = gNumLogObjects <= 4;
  }
  else {
    BOOL v17 = 1;
  }
  int v18 = !v17;
  if (v16)
  {
    OSStatus v19 = v16;
    if (v18)
    {
      id v20 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      id v20 = MEMORY[0x263EF8438];
      id v22 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v5;
      __int16 v41 = 1024;
      OSStatus v42 = v19;
      _os_log_impl(&dword_21DC52000, v20, OS_LOG_TYPE_DEFAULT, "Unable to fetch key for featureTag %@ with access group check, status=%d", buf, 0x12u);
    }

    if (!a2) {
      goto LABEL_61;
    }
    objc_msgSend(v15, "removeObjectForKey:", *MEMORY[0x263F16E80], v6);
    OSStatus v23 = SecItemCopyMatching((CFDictionaryRef)v15, &result);
    if (gLogObjects) {
      BOOL v24 = gNumLogObjects <= 4;
    }
    else {
      BOOL v24 = 1;
    }
    int v25 = !v24;
    if (v23)
    {
      if (v25)
      {
        id v26 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        id v26 = MEMORY[0x263EF8438];
        id v29 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_60;
      }
      *(_DWORD *)buf = 138412290;
      id v40 = v5;
      uint32_t v30 = "Unable to fetch private key for featureTag %@ without access group check";
      id v31 = v26;
      uint32_t v32 = 12;
LABEL_59:
      _os_log_impl(&dword_21DC52000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
LABEL_60:

LABEL_61:
      SecKeyRef v34 = 0;
      goto LABEL_62;
    }
    if (v25)
    {
      id v21 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      id v21 = MEMORY[0x263EF8438];
      id v33 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v5;
      id v28 = "found valid private key for featureTag %@ without access group check";
      goto LABEL_48;
    }
  }
  else
  {
    if (v18)
    {
      id v21 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      id v21 = MEMORY[0x263EF8438];
      id v27 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v5;
      id v28 = "found private valid key for featureTag %@ with access group check";
LABEL_48:
      _os_log_impl(&dword_21DC52000, v21, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
    }
  }

  if (!result || (SecKeyRef v34 = SecKeyCopyPublicKey((SecKeyRef)result)) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      id v26 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      id v26 = MEMORY[0x263EF8438];
      id v35 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_60;
    }
    *(_WORD *)buf = 0;
    uint32_t v30 = "ERROR: No publicKey for Private Key!";
    id v31 = v26;
    uint32_t v32 = 2;
    goto LABEL_59;
  }
LABEL_62:

  return v34;
}

BOOL _UpdateMFi4FeatureKeyAttributes(void *a1, int a2, void *a3)
{
  v38[4] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a3;
  char v7 = [v5 dataUsingEncoding:4];
  uint64_t v8 = *MEMORY[0x263F171E0];
  uint64_t v9 = *MEMORY[0x263F16EE8];
  v37[0] = *MEMORY[0x263F171B8];
  v37[1] = v9;
  v38[0] = v8;
  v38[1] = v7;
  uint64_t v10 = *MEMORY[0x263F16FB8];
  uint64_t v11 = *MEMORY[0x263F17530];
  v37[2] = *MEMORY[0x263F16FA8];
  v37[3] = v11;
  v38[2] = v10;
  v38[3] = MEMORY[0x263EFFA88];
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];
  uint64_t v13 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v12];
  size_t v14 = v13;
  if (a2)
  {
    [v13 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F170B0]];
    if (v6) {
      [v14 setObject:v6 forKey:*MEMORY[0x263F170A8]];
    }
  }
  CFTypeRef result = 0;
  OSStatus v15 = SecItemCopyMatching((CFDictionaryRef)v14, &result);
  if (gLogObjects) {
    BOOL v16 = gNumLogObjects <= 4;
  }
  else {
    BOOL v16 = 1;
  }
  int v17 = !v16;
  if (v15)
  {
    if (v17)
    {
      int v18 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      int v18 = MEMORY[0x263EF8438];
      id v20 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v5;
      _os_log_impl(&dword_21DC52000, v18, OS_LOG_TYPE_DEFAULT, "Unable to fetch key for featureTag %@, unable to update", buf, 0xCu);
    }
    BOOL v21 = 0;
  }
  else
  {
    if (v17)
    {
      OSStatus v19 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      OSStatus v19 = MEMORY[0x263EF8438];
      id v22 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v5;
      _os_log_impl(&dword_21DC52000, v19, OS_LOG_TYPE_DEFAULT, "found private valid key for featureTag %@, update to support new attributes", buf, 0xCu);
    }

    int v18 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v14];
    [v18 setObject:*MEMORY[0x263F16E98] forKey:*MEMORY[0x263F16E90]];
    if (gLogObjects && gNumLogObjects >= 5)
    {
      OSStatus v23 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      OSStatus v23 = MEMORY[0x263EF8438];
      id v24 = MEMORY[0x263EF8438];
    }
    id v33 = v6;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      _UpdateMFi4FeatureKeyAttributes_cold_3((uint64_t)v18, v23);
    }

    OSStatus v25 = SecItemUpdate((CFDictionaryRef)v14, (CFDictionaryRef)v18);
    BOOL v21 = v25 == 0;
    if (gLogObjects) {
      BOOL v26 = gNumLogObjects <= 4;
    }
    else {
      BOOL v26 = 1;
    }
    int v27 = !v26;
    if (v25)
    {
      OSStatus v28 = v25;
      if (v27)
      {
        id v29 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        id v29 = MEMORY[0x263EF8438];
        id v30 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v36) = v28;
        _os_log_impl(&dword_21DC52000, v29, OS_LOG_TYPE_DEFAULT, "Unable to update attributes, status=%d", buf, 8u);
      }
      id v6 = v33;
    }
    else
    {
      if (v27)
      {
        id v29 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        id v29 = MEMORY[0x263EF8438];
        id v31 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DC52000, v29, OS_LOG_TYPE_DEFAULT, "Updated attributes for key", buf, 2u);
      }
    }

    if (result) {
      CFRelease(result);
    }
  }

  return v21;
}

void _DeleteAllSynchronizableKeysForMFi4(void *a1, char a2)
{
  v24[2] = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = *MEMORY[0x263F16FA8];
  v23[0] = *MEMORY[0x263F171B8];
  v23[1] = v4;
  uint64_t v5 = *MEMORY[0x263F16FB8];
  v24[0] = *MEMORY[0x263F171E0];
  v24[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  char v7 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v6];
  [v7 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F170B0]];
  if (v3)
  {
    [v7 setObject:v3 forKey:*MEMORY[0x263F170A8]];
    if ((a2 & 1) == 0) {
      [v7 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F175A0]];
    }
    OSStatus v8 = SecItemDelete((CFDictionaryRef)v7);
    if (gLogObjects) {
      BOOL v9 = gNumLogObjects <= 4;
    }
    else {
      BOOL v9 = 1;
    }
    int v10 = !v9;
    if (v8)
    {
      OSStatus v11 = v8;
      if (v10)
      {
        uint64_t v12 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        uint64_t v12 = MEMORY[0x263EF8438];
        id v13 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412546;
        id v20 = v3;
        __int16 v21 = 1024;
        OSStatus v22 = v11;
        size_t v14 = "Unable to delete key for all authFeatureGroup %@, status=%d";
        OSStatus v15 = v12;
        uint32_t v16 = 18;
LABEL_33:
        _os_log_impl(&dword_21DC52000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, v16);
      }
    }
    else
    {
      if (v10)
      {
        uint64_t v12 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        uint64_t v12 = MEMORY[0x263EF8438];
        id v18 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        id v20 = v3;
        size_t v14 = "Deleted keys for authFeatureGroup %@";
        OSStatus v15 = v12;
        uint32_t v16 = 12;
        goto LABEL_33;
      }
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      uint64_t v12 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[MFAATokenManager _init]();
      }
      uint64_t v12 = MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      size_t v14 = "NO authFeatureGroup, returning without deleting!";
      OSStatus v15 = v12;
      uint32_t v16 = 2;
      goto LABEL_33;
    }
  }
}

SecKeyRef CreateSynchronizableKeyForAuthFeature(int a1, void *a2, void *a3)
{
  if (a1) {
    return 0;
  }
  else {
    return _CreateKeyForMFi4UserPublicKey(a2, 1, a3);
  }
}

CFTypeRef CopySynchronizableKeyForAuthFeature(int a1, void *a2, void *a3)
{
  if (a1) {
    return 0;
  }
  else {
    return _CopyKeyForMFi4UserPublicKey(a2, 1, a3);
  }
}

void DeleteSynchronizableKeyForAuthFeature(int a1, void *a2, void *a3)
{
  if (!a1) {
    _DeleteKeyForMFi4UserPublicKey(a2, 1, a3);
  }
}

SecKeyRef CopyPublicKeyForSynchronizableAuthFeature(int a1, void *a2, void *a3)
{
  if (a1) {
    return 0;
  }
  else {
    return _CopyPublicKeyForMFi4UserPublicKey(a2, 1, a3);
  }
}

void DeleteAllSynchronizableFeatureKeysForFeature(int a1, void *a2, char a3)
{
  if (!a1) {
    _DeleteAllSynchronizableKeysForMFi4(a2, a3);
  }
}

uint64_t MFi4AuthFeatureGroup()
{
  return *MEMORY[0x263F17120];
}

void *MFAACreateCertificateCache(CFStringRef theString)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  if (MFAACreateCertificateCache_onceToken != -1) {
    dispatch_once(&MFAACreateCertificateCache_onceToken, &__block_literal_global);
  }
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2000000000;
  uint64_t v61 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2000000000;
  uint64_t v57 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2000000000;
  uint64_t v53 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2000000000;
  uint64_t v49 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2000000000;
  uint64_t v45 = 0;
  if (theString && CFStringGetCStringPtr(theString, 0x8000100u))
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
    v55[3] = (uint64_t)MutableCopy;
    CFMutableStringRef v3 = CFStringCreateMutableCopy(0, 0, theString);
    v51[3] = (uint64_t)v3;
    CFMutableStringRef v4 = CFStringCreateMutableCopy(0, 0, theString);
    v47[3] = (uint64_t)v4;
    CFMutableStringRef v5 = CFStringCreateMutableCopy(0, 0, theString);
    __int16 v6 = (__int16)v5;
    v43[3] = (uint64_t)v5;
    char v7 = (__CFString *)v55[3];
    if (v7 && v51[3] && v47[3] && v5)
    {
      CFStringAppend(v7, @".authCertCache");
      CFStringAppend((CFMutableStringRef)v51[3], @".authSyncQueue");
      CFStringAppend((CFMutableStringRef)v47[3], @".authRefsCount");
      CFStringAppend((CFMutableStringRef)v43[3], @".authCertChainCache");
      OSStatus v8 = malloc_type_malloc(0x50uLL, 0x106004047A38092uLL);
      v59[3] = (uint64_t)v8;
      if (v8)
      {
        int v9 = MFAAIsDevelopmentHW();
        int v10 = MFAAIsInternalBuild();
        int v11 = MFAAIsDesenseBuild();
        uint64_t v12 = (_OWORD *)v59[3];
        *uint64_t v12 = 0u;
        v12[1] = 0u;
        v12[2] = 0u;
        v12[3] = 0u;
        unint64_t v12[4] = 0u;
        CFTypeRef v13 = CFRetain(theString);
        *(void *)v59[3] = v13;
        CFTypeRef v14 = CFRetain((CFTypeRef)v51[3]);
        *(void *)(v59[3] + 8) = v14;
        CFTypeRef v15 = CFRetain((CFTypeRef)v47[3]);
        uint32_t v16 = v59;
        *(void *)(v59[3] + 16) = v15;
        *(void *)(v16[3] + 24) = 0;
        CFTypeRef v17 = CFRetain((CFTypeRef)v55[3]);
        id v18 = v59;
        *(void *)(v59[3] + 32) = v17;
        *(void *)(v18[3] + 40) = 0;
        *(unsigned char *)(v18[3] + 48) = 0;
        CFTypeRef v19 = CFRetain((CFTypeRef)v43[3]);
        id v20 = v59;
        *(void *)(v59[3] + 56) = v19;
        *(void *)(v20[3] + 64) = 0;
        *(unsigned char *)(v20[3] + 72) = 0;
        if (v9)
        {
          if (v10 | v11)
          {
            int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AuthCertNotCached", @"com.apple.accessoryd", 0);
            *(unsigned char *)(v59[3] + 48) = AppBooleanValue != 0;
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109120;
              int v63 = AppBooleanValue != 0;
              _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Auth flag bCertNotCached:%d\n", buf, 8u);
            }
          }
        }
      }
      else
      {
        BOOL v31 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
        if (v31) {
          MFAACreateCertificateCache_cold_3(v31, v32, v33, v34, v35, v36, v37, v38);
        }
      }
      goto LABEL_25;
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      int v39 = v51[3] & 0xFFF;
      int v40 = v47[3] & 0xFFF;
      *(_DWORD *)buf = 67109888;
      int v63 = (unsigned __int16)v7 & 0xFFF;
      __int16 v64 = 1024;
      int v65 = v6 & 0xFFF;
      __int16 v66 = 1024;
      int v67 = v39;
      __int16 v68 = 1024;
      int v69 = v40;
      _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "CFStringCreateMutableCopy fail pCFStrCacheNameKey:%04X, pCFStrChainCacheNameKey:%04X, pCFStrSyncQueueKey:%04X, pCFStrRefsCountKey:%04X\n", buf, 0x1Au);
      char v7 = (__CFString *)v55[3];
      if (!v7) {
        goto LABEL_19;
      }
    }
    else if (!v7)
    {
LABEL_19:
      OSStatus v22 = (const void *)v43[3];
      if (v22)
      {
        CFRelease(v22);
        v43[3] = 0;
      }
      OSStatus v23 = (const void *)v51[3];
      if (v23)
      {
        CFRelease(v23);
        v51[3] = 0;
      }
      id v24 = (const void *)v47[3];
      if (v24)
      {
        CFRelease(v24);
        v47[3] = 0;
      }
      goto LABEL_25;
    }
    CFRelease(v7);
    v55[3] = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    MFAACreateCertificateCache_cold_2((__int16)theString);
  }
LABEL_25:
  if (gCertCacheDomainList && v59[3])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __MFAACreateCertificateCache_block_invoke_20;
    block[3] = &unk_264479230;
    block[4] = &v54;
    block[5] = &v46;
    block[6] = &v50;
    block[7] = &v58;
    block[8] = &v42;
    dispatch_sync((dispatch_queue_t)gCertCacheDomainQueue, block);
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    MFAACreateCertificateCache_cold_1();
  }
  OSStatus v25 = (const void *)v55[3];
  if (v25)
  {
    CFRelease(v25);
    v55[3] = 0;
  }
  BOOL v26 = (const void *)v51[3];
  if (v26)
  {
    CFRelease(v26);
    v51[3] = 0;
  }
  int v27 = (const void *)v47[3];
  if (v27)
  {
    CFRelease(v27);
    v47[3] = 0;
  }
  OSStatus v28 = (const void *)v43[3];
  if (v28)
  {
    CFRelease(v28);
    v43[3] = 0;
  }
  id v29 = (void *)v59[3];
  if (v29 && (!*v29 || !v29[4] || !v29[1] || !v29[2] || !v29[5] || !v29[3]))
  {
    MFAADeallocCertificateCache(v59[3]);
    id v29 = 0;
    v59[3] = 0;
  }
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);
  return v29;
}

void __MFAACreateCertificateCache_block_invoke()
{
  v0 = dispatch_queue_create("com.apple.accessoryd.certCacheDomainQueue", 0);
  gCertCacheDomainQueue = (uint64_t)v0;
  if (v0)
  {
    dispatch_sync(v0, &__block_literal_global_3);
  }
  else
  {
    BOOL v1 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v1) {
      __MFAACreateCertificateCache_block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
}

void __MFAACreateCertificateCache_block_invoke_2()
{
  gCertCacheDomainList = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!gCertCacheDomainList)
  {
    BOOL v0 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v0) {
      __MFAACreateCertificateCache_block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }
}

void __MFAACreateCertificateCache_block_invoke_20(void *a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  Value = CFDictionaryGetValue((CFDictionaryRef)gCertCacheDomainList, *(const void **)(*(void *)(a1[4] + 8) + 24));
  uint64_t v3 = CFDictionaryGetValue((CFDictionaryRef)gCertCacheDomainList, *(const void **)(*(void *)(a1[5] + 8) + 24));
  if (Value)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v31 = "MFAACreateCertificateCache_block_invoke";
      __int16 v32 = 1024;
      int v33 = (unsigned __int16)Value & 0xFFF;
      _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s CertCacheDomainList contains existing pCFCacheCertDict:%04X", buf, 0x12u);
    }
    CFRetain(Value);
    if (!v3) {
      goto LABEL_15;
    }
LABEL_13:
    CFRetain(v3);
    goto LABEL_16;
  }
  CFDictionaryRef v4 = (const __CFDictionary *)CFPreferencesCopyValue(*(CFStringRef *)(*(void *)(a1[4] + 8) + 24), @"com.apple.accessoryd", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v31 = "MFAACreateCertificateCache_block_invoke";
    __int16 v32 = 1024;
    int v33 = (unsigned __int16)v4 & 0xFFF;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s CFPreferencesCopyValue returned pkCFDictCertCache:%04X", buf, 0x12u);
  }
  if (!v4)
  {
    Value = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (!v3) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  Value = CFDictionaryCreateMutableCopy(0, 0, v4);
  if (!Value)
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v5) {
      __MFAACreateCertificateCache_block_invoke_20_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  CFRelease(v4);
  if (v3) {
    goto LABEL_13;
  }
LABEL_15:
  uint64_t v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &_block_invoke_kRefsCountCache);
  if (v3)
  {
LABEL_16:
    *(_DWORD *)buf = 0;
    int v13 = CFNumberGetValue((CFNumberRef)v3, kCFNumberIntType, buf);
    CFRelease(v3);
    if (v13)
    {
      int valuePtr = *(_DWORD *)buf + 1;
      uint64_t v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(*(void *)(a1[6] + 8) + 24), 0x8000100u);
  if (CStringPtr) {
    dispatch_queue_t v15 = dispatch_queue_create(CStringPtr, 0);
  }
  else {
    dispatch_queue_t v15 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1[7] + 8) + 24) + 40) = Value;
  *(void *)(*(void *)(*(void *)(a1[7] + 8) + 24) + 24) = v15;
  uint32_t v16 = (__CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)gCertCacheDomainList, *(const void **)(*(void *)(a1[8] + 8) + 24));
  if (v16)
  {
    CFMutableDictionaryRef MutableCopy = v16;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v31 = "MFAACreateCertificateCache_block_invoke";
      __int16 v32 = 1024;
      int v33 = (unsigned __int16)MutableCopy & 0xFFF;
      _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s CertChainCacheDomainList contains existing pCFCacheCertChainDict:%04X", buf, 0x12u);
    }
    CFRetain(MutableCopy);
  }
  else
  {
    CFDictionaryRef v18 = (const __CFDictionary *)CFPreferencesCopyValue(*(CFStringRef *)(*(void *)(a1[8] + 8) + 24), @"com.apple.accessoryd", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v31 = "MFAACreateCertificateCache_block_invoke";
      __int16 v32 = 1024;
      int v33 = (unsigned __int16)v18 & 0xFFF;
      _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s CFPreferencesCopyValue returned pkCFDictCertChainCache:%04X", buf, 0x12u);
    }
    if (v18)
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v18);
      if (!MutableCopy)
      {
        BOOL v19 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
        if (v19) {
          __MFAACreateCertificateCache_block_invoke_20_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
        }
      }
      CFRelease(v18);
    }
    else
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
  }
  *(void *)(*(void *)(*(void *)(a1[7] + 8) + 24) + 64) = MutableCopy;
  if (Value && v3 && v15)
  {
    if (CFDictionaryGetCount((CFDictionaryRef)Value)) {
      BOOL v27 = ValidateCertificateCache((const __CFDictionary *)Value) == 0;
    }
    else {
      BOOL v27 = 0;
    }
    CFDictionarySetValue((CFMutableDictionaryRef)gCertCacheDomainList, *(const void **)(*(void *)(a1[4] + 8) + 24), Value);
    CFDictionarySetValue((CFMutableDictionaryRef)gCertCacheDomainList, *(const void **)(*(void *)(a1[5] + 8) + 24), v3);
    CertCacheReferenceCountUpdate(*(void *)(*(void *)(a1[7] + 8) + 24), 1);
    PrintCertCacheContents(@"Single", *(CFTypeRef *)(*(void *)(*(void *)(a1[7] + 8) + 24) + 40));
    PrintCertCacheContents(@"Chain", *(CFTypeRef *)(*(void *)(*(void *)(a1[7] + 8) + 24) + 64));
    if (!v27)
    {
      uint64_t v28 = *(void *)(*(void *)(a1[7] + 8) + 24);
      SyncCertCacheContentsToPreferencesFile(*(void *)(v28 + 32), *(const void **)(v28 + 40));
    }
    goto LABEL_44;
  }
  if (v3) {
LABEL_44:
  }
    CFRelease(v3);
}

uint64_t ValidateCertificateCache(const __CFDictionary *a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  CFTypeID TypeID = CFStringGetTypeID();
  CFTypeID v28 = CFDataGetTypeID();
  CFTypeID v3 = CFArrayGetTypeID();
  CFTypeID v27 = CFNumberGetTypeID();
  CFIndex Count = CFDictionaryGetCount(a1);
  size_t v5 = 8 * Count;
  unint64_t v6 = (8 * Count + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = (CFTypeRef *)((char *)&v26 - v6);
  if (((uint64_t (*)(void))MEMORY[0x270FA5388])())
  {
    uint64_t v8 = memset((char *)&v26 - v6, 170, v5);
    MEMORY[0x270FA5388](v8);
    uint64_t v9 = (const void **)((char *)&v26 - v6);
    memset((char *)&v26 - v6, 170, v5);
    CFDictionaryGetKeysAndValues(a1, (const void **)((char *)&v26 - v6), (const void **)((char *)&v26 - v6));
    if (Count >= 1)
    {
      uint64_t v11 = 0;
      *(void *)&long long v10 = 136315650;
      long long v26 = v10;
      while (1)
      {
        CFDataRef v12 = (const __CFData *)*v7;
        int v13 = *v9;
        if (*v7) {
          BOOL v14 = v13 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (v14)
        {
          CFTypeID v15 = 0;
          CFTypeID v16 = 0;
        }
        else
        {
          CFTypeID v15 = CFGetTypeID(*v7);
          CFTypeID v16 = CFGetTypeID(v13);
        }
        if (v15 != TypeID || v16 != v3 || (uint64_t valuePtr = 0, CFDataGetLength(v12), CFArrayGetCount((CFArrayRef)v13) != 2))
        {
LABEL_34:
          CFDictionaryRemoveValue(a1, *v7);
          ++v11;
          goto LABEL_35;
        }
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v13, 0);
        CFNumberRef v18 = ValueAtIndex;
        if (ValueAtIndex)
        {
          CFTypeID v19 = CFGetTypeID(ValueAtIndex);
          if (v19 == v27) {
            LODWORD(v18) = CFNumberGetValue(v18, kCFNumberLongType, &valuePtr);
          }
          else {
            LODWORD(v18) = 0;
          }
        }
        uint64_t Length = (uint64_t)CFArrayGetValueAtIndex((CFArrayRef)v13, 1);
        CFDataRef v21 = (const __CFData *)Length;
        if (!Length) {
          goto LABEL_20;
        }
        CFTypeID v22 = CFGetTypeID((CFTypeRef)Length);
        if (v22 == v28) {
          break;
        }
        uint64_t Length = 0;
        if (!v18) {
          goto LABEL_34;
        }
LABEL_23:
        if (!valuePtr || Length < 512 || Length > 2048) {
          goto LABEL_34;
        }
        CFDataRef v23 = (const __CFData *)MFAACreateCertificateSerialNumber((uint64_t)v21);
        CFDataRef v24 = MFAACreateSerialNumberStringFromData(v23);
        if (v24
          && CFStringCompare((CFStringRef)v12, (CFStringRef)v24, 1uLL)
          && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v26;
          __int16 v32 = "ValidateCertificateCache";
          __int16 v33 = 2112;
          CFDataRef v34 = v12;
          __int16 v35 = 2112;
          CFDataRef v36 = v24;
          _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "%s: key and cert serial doesn't match but allow, key %@, certSerial %@", buf, 0x20u);
        }
        if (v23) {
          CFRelease(v23);
        }
        if (!v24) {
          goto LABEL_34;
        }
        CFRelease(v24);
LABEL_35:
        ++v9;
        ++v7;
        if (!--Count) {
          return v11;
        }
      }
      uint64_t Length = CFDataGetLength(v21);
LABEL_20:
      if (!v18) {
        goto LABEL_34;
      }
      goto LABEL_23;
    }
  }
  else
  {
    CFDictionaryGetKeysAndValues(a1, (const void **)((char *)&v26 - v6), (const void **)&values);
  }
  return 0;
}

uint64_t CertCacheReferenceCountUpdate(uint64_t a1, int a2)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  int v10 = 0;
  if (a1 && (uint64_t v2 = *(NSObject **)(a1 + 24)) != 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __CertCacheReferenceCountUpdate_block_invoke;
    block[3] = &unk_264479390;
    block[4] = &v7;
    block[5] = a1;
    int v6 = a2;
    dispatch_sync(v2, block);
    uint64_t v3 = *((unsigned int *)v8 + 6);
  }
  else
  {
    uint64_t v3 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

void PrintCertCacheContents(uint64_t a1, CFTypeRef cf)
{
  CFIndex Count = 0;
  uint64_t v58 = *MEMORY[0x263EF8340];
  CFIndex v5 = 0;
  if (a1 && cf)
  {
    CFIndex v5 = CFGetRetainCount(cf);
    if (v5 < 1)
    {
      CFIndex Count = 0;
    }
    else
    {
      CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)cf);
      if (Count >= 1)
      {
        CFTypeID TypeID = CFStringGetTypeID();
        CFTypeID v46 = CFDataGetTypeID();
        CFTypeID v47 = CFArrayGetTypeID();
        CFTypeID v41 = CFNumberGetTypeID();
        int v40 = &v38;
        MEMORY[0x270FA5388](v41);
        int v6 = (char *)&v38 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v7 = memset(v6, 170, 8 * Count);
        MEMORY[0x270FA5388](v7);
        memset(v6, 170, 8 * Count);
        uint64_t v50 = (const void **)v6;
        bzero(v6, 8 * Count);
        uint64_t v49 = (const void **)v6;
        bzero(v6, 8 * Count);
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v53 = "PrintCertCacheContents";
          __int16 v54 = 2112;
          uint64_t v55 = a1;
          __int16 v56 = 1024;
          *(_DWORD *)uint64_t v57 = (unsigned __int16)cf & 0xFFF;
          *(_WORD *)&v57[4] = 2048;
          *(void *)&v57[6] = v5;
          *(_WORD *)&v57[14] = 2048;
          *(void *)&v57[16] = Count;
          _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s (%@) pkCertCacheDict:%04X, dictRetainCount:%02lX, dictEntryCount:%02lX", buf, 0x30u);
        }
        CFDictionaryGetKeysAndValues((CFDictionaryRef)cf, v50, v49);
        uint64_t v8 = 0;
        uint64_t v9 = MEMORY[0x263EF8438];
        *(void *)&long long v10 = 136316674;
        long long v44 = v10;
        *(void *)&long long v10 = 136316418;
        long long v45 = v10;
        *(void *)&long long v10 = 136315906;
        long long v43 = v10;
        *(void *)&long long v10 = 136316162;
        long long v42 = v10;
        *(void *)&long long v10 = 136315394;
        long long v38 = v10;
        *(void *)&long long v10 = 136315650;
        long long v39 = v10;
        while (1)
        {
          CFStringRef v11 = (const __CFString *)v50[v8];
          CFDataRef v12 = v49[v8];
          if (v11)
          {
            CFIndex v13 = CFGetRetainCount(v50[v8]);
            if (v12) {
              goto LABEL_10;
            }
          }
          else
          {
            CFIndex v13 = 0;
            if (v12)
            {
LABEL_10:
              CFIndex v14 = CFGetRetainCount(v12);
              goto LABEL_13;
            }
          }
          CFIndex v14 = 0;
LABEL_13:
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v44;
            uint64_t v53 = "PrintCertCacheContents";
            __int16 v54 = 2112;
            uint64_t v55 = a1;
            __int16 v56 = 2048;
            *(void *)uint64_t v57 = v8;
            *(_WORD *)&v57[8] = 1024;
            *(_DWORD *)&v57[10] = (unsigned __int16)v11 & 0xFFF;
            *(_WORD *)&v57[14] = 2048;
            *(void *)&v57[16] = v13;
            *(_WORD *)&v57[24] = 1024;
            *(_DWORD *)&v57[26] = (unsigned __int16)v12 & 0xFFF;
            *(_WORD *)&v57[30] = 2048;
            *(void *)&v57[32] = v14;
            _os_log_impl(&dword_21DC52000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) [%02lX] pkKey:%04X, keyRetainCount:%02lX, pkVal:%04X, valRetainCount:%02lX", buf, 0x40u);
          }
          if (v11 && v13 >= 1)
          {
            CFTypeID v15 = CFGetTypeID(v11);
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v45;
              uint64_t v53 = "PrintCertCacheContents";
              __int16 v54 = 2112;
              uint64_t v55 = a1;
              __int16 v56 = 1024;
              *(_DWORD *)uint64_t v57 = (unsigned __int16)v11 & 0xFFF;
              *(_WORD *)&v57[4] = 2048;
              *(void *)&v57[6] = v13;
              *(_WORD *)&v57[14] = 2048;
              *(void *)&v57[16] = v15;
              *(_WORD *)&v57[24] = 2048;
              *(void *)&v57[26] = TypeID;
              _os_log_impl(&dword_21DC52000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) pkKey:%04X, keyRetainCount:%02lX, typeID:%02lX (strID:%02lX)", buf, 0x3Au);
            }
            if (v15 == TypeID && os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              CStringPtr = CFStringGetCStringPtr(v11, 0x8000100u);
              *(_DWORD *)buf = v43;
              uint64_t v53 = "PrintCertCacheContents";
              __int16 v54 = 2112;
              uint64_t v55 = a1;
              __int16 v56 = 2048;
              *(void *)uint64_t v57 = v8;
              *(_WORD *)&v57[8] = 2080;
              *(void *)&v57[10] = CStringPtr;
              _os_log_impl(&dword_21DC52000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) pkDictKeys [%02lX] str:[%s]", buf, 0x2Au);
            }
            if (v15 == v46)
            {
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v43;
                uint64_t v53 = "PrintCertCacheContents";
                __int16 v54 = 2112;
                uint64_t v55 = a1;
                __int16 v56 = 2048;
                *(void *)uint64_t v57 = v8;
                *(_WORD *)&v57[8] = 2112;
                *(void *)&v57[10] = v11;
                _os_log_impl(&dword_21DC52000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) pkDictKeys [%02lX] hash:[%@]", buf, 0x2Au);
                if (!v12) {
                  goto LABEL_65;
                }
                goto LABEL_30;
              }
LABEL_29:
              if (!v12) {
                goto LABEL_65;
              }
              goto LABEL_30;
            }
            if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
              goto LABEL_29;
            }
            *(_DWORD *)buf = v42;
            uint64_t v53 = "PrintCertCacheContents";
            __int16 v54 = 2112;
            uint64_t v55 = a1;
            __int16 v56 = 2048;
            *(void *)uint64_t v57 = v8;
            *(_WORD *)&v57[8] = 2048;
            *(void *)&v57[10] = v15;
            *(_WORD *)&v57[18] = 2048;
            *(void *)&v57[20] = TypeID;
            CFTypeRef v17 = v9;
            CFNumberRef v18 = "%s (%@) ERROR pkDictKeys [%02lX] typeID:%02lX, expectID:%02lX";
            uint32_t v19 = 52;
          }
          else
          {
            if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
              goto LABEL_29;
            }
            *(_DWORD *)buf = v42;
            uint64_t v53 = "PrintCertCacheContents";
            __int16 v54 = 2112;
            uint64_t v55 = a1;
            __int16 v56 = 2048;
            *(void *)uint64_t v57 = v8;
            *(_WORD *)&v57[8] = 1024;
            *(_DWORD *)&v57[10] = (unsigned __int16)v11 & 0xFFF;
            *(_WORD *)&v57[14] = 2048;
            *(void *)&v57[16] = v13;
            CFTypeRef v17 = v9;
            CFNumberRef v18 = "%s (%@) ERROR pkDictKeys [%02lX]:%04X, keyRetainCount:%02lX";
            uint32_t v19 = 48;
          }
          _os_log_error_impl(&dword_21DC52000, v17, OS_LOG_TYPE_ERROR, v18, buf, v19);
          if (!v12)
          {
LABEL_65:
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v42;
              uint64_t v53 = "PrintCertCacheContents";
              __int16 v54 = 2112;
              uint64_t v55 = a1;
              __int16 v56 = 2048;
              *(void *)uint64_t v57 = v8;
              *(_WORD *)&v57[8] = 1024;
              *(_DWORD *)&v57[10] = (unsigned __int16)v12 & 0xFFF;
              *(_WORD *)&v57[14] = 2048;
              *(void *)&v57[16] = v14;
              CFTypeID v28 = v9;
              id v29 = "%s (%@) ERROR pkDictVals [%02lX]:%04X, valRetainCount:%02lX";
              goto LABEL_69;
            }
            goto LABEL_66;
          }
LABEL_30:
          if (v14 < 1) {
            goto LABEL_65;
          }
          CFTypeID v20 = CFGetTypeID(v12);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v45;
            uint64_t v53 = "PrintCertCacheContents";
            __int16 v54 = 2112;
            uint64_t v55 = a1;
            __int16 v56 = 1024;
            *(_DWORD *)uint64_t v57 = (unsigned __int16)v12 & 0xFFF;
            *(_WORD *)&v57[4] = 2048;
            *(void *)&v57[6] = v14;
            *(_WORD *)&v57[14] = 2048;
            *(void *)&v57[16] = v20;
            *(_WORD *)&v57[24] = 2048;
            *(void *)&v57[26] = v47;
            _os_log_impl(&dword_21DC52000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) pkVal:%04X valRetainCount:%02lX, typeID:%02lX (arrayID:%02lX)", buf, 0x3Au);
          }
          if (v20 == v47)
          {
            CFIndex v21 = CFArrayGetCount((CFArrayRef)v12);
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v43;
              uint64_t v53 = "PrintCertCacheContents";
              __int16 v54 = 2112;
              uint64_t v55 = a1;
              __int16 v56 = 2048;
              *(void *)uint64_t v57 = v8;
              *(_WORD *)&v57[8] = 2048;
              *(void *)&v57[10] = v21;
              _os_log_impl(&dword_21DC52000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) pkDictVals [%02lX] arrayCount:[%02lX]", buf, 0x2Au);
            }
            if (v21 != 2)
            {
              if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v42;
                uint64_t v53 = "PrintCertCacheContents";
                __int16 v54 = 2112;
                uint64_t v55 = a1;
                __int16 v56 = 2048;
                *(void *)uint64_t v57 = v8;
                *(_WORD *)&v57[8] = 2048;
                *(void *)&v57[10] = v21;
                *(_WORD *)&v57[18] = 1024;
                *(_DWORD *)&v57[20] = 2;
                CFTypeID v28 = v9;
                id v29 = "%s (%@) ERROR pkDictVals [%02lX] arrayCount:%02lX, arrayCountExpect:%02X";
LABEL_69:
                uint32_t v30 = 48;
                goto LABEL_70;
              }
              goto LABEL_66;
            }
            CFNumberRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v12, 0);
            CFDataRef v23 = CFArrayGetValueAtIndex((CFArrayRef)v12, 1);
            if (ValueAtIndex)
            {
              CFTypeID v24 = CFGetTypeID(ValueAtIndex);
              CFIndex v25 = CFGetRetainCount(ValueAtIndex);
              CFIndex v26 = v25;
              if (v24 == v41 && v25 >= 1)
              {
                uint64_t valuePtr = 0;
                int Value = CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberLongType, &valuePtr);
                if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v45;
                  uint64_t v53 = "PrintCertCacheContents";
                  __int16 v54 = 2112;
                  uint64_t v55 = a1;
                  __int16 v56 = 2048;
                  *(void *)uint64_t v57 = v41;
                  *(_WORD *)&v57[8] = 2048;
                  *(void *)&v57[10] = v26;
                  *(_WORD *)&v57[18] = 1024;
                  *(_DWORD *)&v57[20] = Value;
                  *(_WORD *)&v57[24] = 2048;
                  *(void *)&v57[26] = valuePtr;
                  _os_log_impl(&dword_21DC52000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) usageTypeID:%02lX, usageRetainCount:%02lX, bUsageValid:%d, certUsage:%02lX", buf, 0x3Au);
                  if (!v23) {
                    goto LABEL_73;
                  }
                  goto LABEL_52;
                }
LABEL_51:
                if (!v23) {
                  goto LABEL_73;
                }
LABEL_52:
                CFTypeID v34 = CFGetTypeID(v23);
                CFIndex v35 = CFGetRetainCount(v23);
                CFIndex v36 = v35;
                if (v34 == v46 && v35 >= 1)
                {
                  CFIndex Length = CFDataGetLength((CFDataRef)v23);
                  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = v43;
                    uint64_t v53 = "PrintCertCacheContents";
                    __int16 v54 = 2112;
                    uint64_t v55 = a1;
                    __int16 v56 = 2048;
                    *(void *)uint64_t v57 = v46;
                    *(_WORD *)&v57[8] = 2048;
                    *(void *)&v57[10] = v36;
                    _os_log_impl(&dword_21DC52000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) certTypeID:%02lX, certRetainCount:%02lX", buf, 0x2Au);
                  }
                  if ((unint64_t)(Length - 512) <= 0x600)
                  {
                    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = v39;
                      uint64_t v53 = "PrintCertCacheContents";
                      __int16 v54 = 2112;
                      uint64_t v55 = a1;
                      __int16 v56 = 2048;
                      *(void *)uint64_t v57 = Length;
                      _os_log_impl(&dword_21DC52000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) Valid certDataLen:%02lX", buf, 0x20u);
                    }
                    goto LABEL_66;
                  }
                  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = v39;
                    uint64_t v53 = "PrintCertCacheContents";
                    __int16 v54 = 2112;
                    uint64_t v55 = a1;
                    __int16 v56 = 2048;
                    *(void *)uint64_t v57 = Length;
                    CFTypeID v28 = v9;
                    id v29 = "%s (%@) ERROR invalid certDataLen:%02lX";
                    uint32_t v30 = 32;
                    goto LABEL_70;
                  }
                }
                else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v42;
                  uint64_t v53 = "PrintCertCacheContents";
                  __int16 v54 = 2112;
                  uint64_t v55 = a1;
                  __int16 v56 = 2048;
                  *(void *)uint64_t v57 = v34;
                  *(_WORD *)&v57[8] = 2048;
                  *(void *)&v57[10] = v46;
                  *(_WORD *)&v57[18] = 2048;
                  *(void *)&v57[20] = v36;
                  CFTypeID v28 = v9;
                  id v29 = "%s (%@) ERROR certTypeID:%02lX, expectTypeID:%02lX, certRetainCount:%02lX";
                  goto LABEL_45;
                }
                goto LABEL_66;
              }
              if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
                goto LABEL_51;
              }
              *(_DWORD *)buf = v42;
              uint64_t v53 = "PrintCertCacheContents";
              __int16 v54 = 2112;
              uint64_t v55 = a1;
              __int16 v56 = 2048;
              *(void *)uint64_t v57 = v24;
              *(_WORD *)&v57[8] = 2048;
              *(void *)&v57[10] = v41;
              *(_WORD *)&v57[18] = 2048;
              *(void *)&v57[20] = v26;
              BOOL v31 = v9;
              __int16 v32 = "%s (%@) ERROR usageTypeID:%02lX, expectTypeID:%02lX, usageRetainCount:%02lX";
              uint32_t v33 = 52;
            }
            else
            {
              if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
                goto LABEL_51;
              }
              *(_DWORD *)buf = v38;
              uint64_t v53 = "PrintCertCacheContents";
              __int16 v54 = 2112;
              uint64_t v55 = a1;
              BOOL v31 = v9;
              __int16 v32 = "%s (%@) ERROR pkUsageCount = NULL !";
              uint32_t v33 = 22;
            }
            _os_log_error_impl(&dword_21DC52000, v31, OS_LOG_TYPE_ERROR, v32, buf, v33);
            if (!v23)
            {
LABEL_73:
              if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
                goto LABEL_66;
              }
              *(_DWORD *)buf = v38;
              uint64_t v53 = "PrintCertCacheContents";
              __int16 v54 = 2112;
              uint64_t v55 = a1;
              CFTypeID v28 = v9;
              id v29 = "%s (%@) ERROR pkCertData = NULL !";
              uint32_t v30 = 22;
              goto LABEL_70;
            }
            goto LABEL_52;
          }
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v42;
            uint64_t v53 = "PrintCertCacheContents";
            __int16 v54 = 2112;
            uint64_t v55 = a1;
            __int16 v56 = 2048;
            *(void *)uint64_t v57 = v8;
            *(_WORD *)&v57[8] = 2048;
            *(void *)&v57[10] = v20;
            *(_WORD *)&v57[18] = 2048;
            *(void *)&v57[20] = v47;
            CFTypeID v28 = v9;
            id v29 = "%s (%@) ERROR pkDictVals [%02lX] typeID:%02lX, expectID:%02lX";
LABEL_45:
            uint32_t v30 = 52;
LABEL_70:
            _os_log_error_impl(&dword_21DC52000, v28, OS_LOG_TYPE_ERROR, v29, buf, v30);
          }
LABEL_66:
          if (Count == ++v8) {
            return;
          }
        }
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v53 = "PrintCertCacheContents";
    __int16 v54 = 2112;
    uint64_t v55 = a1;
    __int16 v56 = 1024;
    *(_DWORD *)uint64_t v57 = (unsigned __int16)cf & 0xFFF;
    *(_WORD *)&v57[4] = 2048;
    *(void *)&v57[6] = v5;
    *(_WORD *)&v57[14] = 2048;
    *(void *)&v57[16] = Count;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "%s (%@) Print of cache contents bypassed due to pkCertCacheDict:%04X, dictRetainCount:%02lX, or dictEntryCount:%02lX", buf, 0x30u);
  }
}

BOOL SyncCertCacheContentsToPreferencesFile(uint64_t key, const void *a2)
{
  CFStringRef v2 = (const __CFString *)key;
  LODWORD(key) = 0;
  if (v2)
  {
    if (a2)
    {
      CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE70];
      CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE68];
      CFPreferencesSetValue(v2, a2, @"com.apple.accessoryd", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
      LODWORD(key) = CFPreferencesSynchronize(@"com.apple.accessoryd", v3, v4);
      if (!key)
      {
        key = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
        if (key)
        {
          SyncCertCacheContentsToPreferencesFile_cold_1(key, v5, v6, v7, v8, v9, v10, v11);
          LODWORD(key) = 0;
        }
      }
    }
  }
  return key != 0;
}

void MFAADeallocCertificateCache(uint64_t a1)
{
  if (a1)
  {
    if (gCertCacheDomainList)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = __MFAADeallocCertificateCache_block_invoke;
      block[3] = &__block_descriptor_tmp_28;
      block[4] = a1;
      dispatch_sync((dispatch_queue_t)gCertCacheDomainQueue, block);
    }
    else
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v10) {
        MFAADeallocCertificateCache_cold_2(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    if (*(void *)a1)
    {
      CFRelease(*(CFTypeRef *)a1);
      *(void *)a1 = 0;
    }
    CFNumberRef v18 = *(const void **)(a1 + 32);
    if (v18)
    {
      CFRelease(v18);
      *(void *)(a1 + 32) = 0;
    }
    uint32_t v19 = *(const void **)(a1 + 8);
    if (v19)
    {
      CFRelease(v19);
      *(void *)(a1 + 8) = 0;
    }
    CFTypeID v20 = *(const void **)(a1 + 16);
    if (v20)
    {
      CFRelease(v20);
      *(void *)(a1 + 16) = 0;
    }
    CFIndex v21 = *(const void **)(a1 + 40);
    if (v21)
    {
      CFRelease(v21);
      *(void *)(a1 + 40) = 0;
    }
    CFTypeID v22 = *(NSObject **)(a1 + 24);
    if (v22) {
      dispatch_release(v22);
    }
    free((void *)a1);
  }
  else
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v2) {
      MFAADeallocCertificateCache_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __MFAADeallocCertificateCache_block_invoke(uint64_t a1)
{
  if ((int)CertCacheReferenceCountUpdate(*(void *)(a1 + 32), -1) <= 0)
  {
    if ((BOOL v2 = *(void **)(a1 + 32), (v3 = (const void *)v2[5]) != 0) && v2[4] || v2[8] && v2[7])
    {
      PrintCertCacheContents(@"Single", v3);
      PrintCertCacheContents(@"Chain", *(CFTypeRef *)(*(void *)(a1 + 32) + 64));
      uint64_t v4 = *(uint64_t **)(a1 + 32);
      uint64_t v5 = (const void *)v4[5];
      if (v5)
      {
        if (!SyncCertCacheContentsToPreferencesFile(v4[4], v5))
        {
          BOOL v6 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (v6) {
            SyncCertCacheContentsToPreferencesFile_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
          }
        }
        uint64_t v4 = *(uint64_t **)(a1 + 32);
        uint64_t v14 = (const void *)v4[4];
        if (v14)
        {
          int Value = CFDictionaryGetValue((CFDictionaryRef)gCertCacheDomainList, v14);
          uint64_t v4 = *(uint64_t **)(a1 + 32);
          if (Value)
          {
            CFDictionaryRemoveValue((CFMutableDictionaryRef)gCertCacheDomainList, (const void *)v4[4]);
            uint64_t v4 = *(uint64_t **)(a1 + 32);
            uint64_t v16 = (const void *)v4[5];
            if (v16)
            {
              CFRelease(v16);
              *(void *)(*(void *)(a1 + 32) + 40) = 0;
              uint64_t v4 = *(uint64_t **)(a1 + 32);
            }
          }
        }
      }
      uint64_t v17 = (const void *)v4[8];
      if (v17)
      {
        if (!SyncCertCacheContentsToPreferencesFile(v4[7], v17))
        {
          BOOL v18 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (v18) {
            __MFAADeallocCertificateCache_block_invoke_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
          }
        }
        CFIndex v26 = *(const void **)(*(void *)(a1 + 32) + 56);
        if (v26 && CFDictionaryGetValue((CFDictionaryRef)gCertCacheDomainList, v26))
        {
          CFDictionaryRemoveValue((CFMutableDictionaryRef)gCertCacheDomainList, *(const void **)(*(void *)(a1 + 32) + 56));
          CFTypeID v27 = *(const void **)(*(void *)(a1 + 32) + 64);
          if (v27)
          {
            CFRelease(v27);
            *(void *)(*(void *)(a1 + 32) + 64) = 0;
          }
        }
      }
    }
  }
}

uint64_t MFAACreateCertDataFromSerialNumber(uint64_t a1, uint64_t a2)
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2000000000;
  void v10[3] = a1;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  uint64_t v9 = 0;
  if (a1 && a2 && !*(unsigned char *)(a1 + 48))
  {
    uint64_t v4 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __MFAACreateCertDataFromSerialNumber_block_invoke;
    block[3] = &unk_264479278;
    block[4] = v10;
    void block[5] = &v6;
    void block[6] = a2;
    dispatch_sync(v4, block);
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    MFAACreateCertDataFromSerialNumber_cold_1();
  }
  uint64_t v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v2;
}

uint64_t MFAAAddCertDataEntryToCache(uint64_t a1, uint64_t a2)
{
  CFDataRef v4 = (const __CFData *)MFAACreateCertificateSerialNumber(a2);
  if (v4)
  {
    CFDataRef v5 = v4;
    CFDataRef v6 = MFAACreateSerialNumberStringFromData(v4);
    uint64_t v7 = MFAAAddCertDataEntryToCacheForSerialNumber(a1, a2, (uint64_t)v6);
    CFRelease(v5);
    if (v6) {
      CFRelease(v6);
    }
    return v7;
  }
  else
  {
    return MFAAAddCertDataEntryToCacheForSerialNumber(a1, a2, 0);
  }
}

CFDataRef MFAACreateSerialNumberStringFromData(const __CFData *result)
{
  v11[1] = *MEMORY[0x263EF8340];
  if (result)
  {
    CFDataRef v1 = result;
    CFIndex Length = CFDataGetLength(result);
    MEMORY[0x270FA5388]();
    unint64_t v5 = (v4 + 19) & 0xFFFFFFFFFFFFFFF0;
    CFDataRef v6 = (char *)v11 - v5;
    if (v3) {
      memset((char *)v11 - v5, 170, v3);
    }
    BytePtr = CFDataGetBytePtr(v1);
    if (Length >= 1)
    {
      uint64_t v8 = BytePtr;
      uint64_t v9 = (char *)v6;
      do
      {
        int v10 = *v8++;
        sprintf(v9, "%02X", v10);
        v9 += 2;
        --Length;
      }
      while (Length);
    }
    return (const __CFData *)CFStringCreateWithCString(0, v6, 0x8000100u);
  }
  return result;
}

uint64_t MFAAAddCertDataEntryToCacheForSerialNumber(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2000000000;
  v12[3] = a1;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000;
  char v11 = 0;
  if (a1 && a2 && a3 && !*(unsigned char *)(a1 + 48))
  {
    CFDataRef v6 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __MFAAAddCertDataEntryToCacheForSerialNumber_block_invoke;
    block[3] = &unk_2644792A0;
    void block[6] = a3;
    void block[7] = a2;
    block[4] = v12;
    void block[5] = &v8;
    block[8] = a1;
    dispatch_sync(v6, block);
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    MFAAAddCertDataEntryToCacheForSerialNumber_cold_1();
  }
  uint64_t v4 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(v12, 8);
  return v4;
}

void __MFAAAddCertDataEntryToCacheForSerialNumber_block_invoke(uint64_t a1)
{
  valuePtr[1] = *MEMORY[0x263EF8340];
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 40), *(const void **)(a1 + 48)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = IncrementCertEntryUsageCount(*(void *)(a1 + 64), *(void **)(a1 + 48));
LABEL_25:
    uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SyncCertCacheContentsToPreferencesFile(*(void *)(v31 + 32), *(const void **)(v31 + 40));
    return;
  }
  CFNumberRef v2 = CFNumberCreate(0, kCFNumberLongType, &_block_invoke_2_kAuthUsageInitialCount);
  Mutable = CFArrayCreateMutable(0, 2, MEMORY[0x263EFFF70]);
  uint64_t v4 = Mutable;
  if (Mutable)
  {
    CFArraySetValueAtIndex(Mutable, 0, v2);
    CFArraySetValueAtIndex(v4, 1, *(const void **)(a1 + 56));
    CFIndex Count = CFDictionaryGetCount(*(CFDictionaryRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 40));
    if (Count >= 16)
    {
      CFIndex v6 = Count;
      size_t v7 = 8 * Count;
      MEMORY[0x270FA5388](Count);
      uint64_t v8 = (const void **)((char *)valuePtr - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v9 = memset(v8, 170, v7);
      MEMORY[0x270FA5388](v9);
      uint64_t v10 = (CFArrayRef *)v8;
      memset(v8, 170, v7);
      valuePtr[0] = 0xAAAAAAAAAAAAAAAALL;
      CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 40), v8, v8);
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      do
      {
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*v10, 0);
        valuePtr[0] = 0;
        if (CFNumberGetValue(ValueAtIndex, kCFNumberLongType, valuePtr)) {
          BOOL v14 = valuePtr[0] < 1;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14 && (v11 < 1 || valuePtr[0] < v11))
        {
          uint64_t v12 = *v8;
          uint64_t v11 = valuePtr[0];
        }
        ++v8;
        ++v10;
        --v6;
      }
      while (v6);
      if (v12)
      {
        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 40), v12);
      }
      else
      {
        BOOL v23 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
        if (v23) {
          __MFAAAddCertDataEntryToCacheForSerialNumber_block_invoke_cold_2(v23, v24, v25, v26, v27, v28, v29, v30);
        }
      }
    }
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 40), *(const void **)(a1 + 48), v4);
  }
  else
  {
    BOOL v15 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v15) {
      __MFAAAddCertDataEntryToCacheForSerialNumber_block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  if (v2) {
    CFRelease(v2);
  }
  if (v4)
  {
    CFRelease(v4);
    goto LABEL_25;
  }
}

uint64_t IncrementCertEntryUsageCount(uint64_t a1, void *key)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!a1 || !key || *(unsigned char *)(a1 + 48))
  {
    uint64_t result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    IncrementCertEntryUsageCount_cold_2();
    return 0;
  }
  uint64_t valuePtr = 0;
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), key);
  CFArrayRef v6 = Value;
  if (!Value)
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    CFIndex Count = 0;
LABEL_16:
    IncrementCertEntryUsageCount_cold_1((__int16)v6, buf, Count);
    return 0;
  }
  if (CFArrayGetCount(Value) != 2)
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    CFIndex Count = CFArrayGetCount(v6);
    goto LABEL_16;
  }
  uint64_t result = (uint64_t)CFArrayGetValueAtIndex(v6, 0);
  if (result)
  {
    uint64_t result = CFNumberGetValue((CFNumberRef)result, kCFNumberLongType, &valuePtr);
    if (result)
    {
      *(void *)buf = valuePtr + 1;
      uint64_t result = (uint64_t)CFNumberCreate(0, kCFNumberLongType, buf);
      if (result)
      {
        size_t v7 = (const void *)result;
        CFArraySetValueAtIndex(v6, 0, (const void *)result);
        CFRelease(v7);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), key, v6);
        return 1;
      }
    }
  }
  return result;
}

uint64_t MFAARemoveCertDataEntryFromCache(uint64_t a1, uint64_t a2)
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2000000000;
  void v10[3] = a1;
  uint64_t v6 = 0;
  size_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  char v9 = 0;
  if (a1 && a2 && !*(unsigned char *)(a1 + 48))
  {
    uint64_t v4 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __MFAARemoveCertDataEntryFromCache_block_invoke;
    block[3] = &unk_2644792C8;
    block[4] = v10;
    void block[5] = &v6;
    void block[6] = a2;
    dispatch_sync(v4, block);
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    MFAARemoveCertDataEntryFromCache_cold_1();
  }
  uint64_t v2 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v2;
}

BOOL __MFAARemoveCertDataEntryFromCache_block_invoke(uint64_t a1)
{
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 40), *(const void **)(a1 + 48));
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  BOOL result = SyncCertCacheContentsToPreferencesFile(*(void *)(v2 + 32), *(const void **)(v2 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t MFAACreateMatchingHashForCertChainFromHashLSB(uint64_t a1, CFStringRef theString)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2000000000;
  uint64_t v16 = a1;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000;
  uint64_t v12 = 0;
  if (a1 && theString && CFStringGetLength(theString) == 2 && (uint64_t v3 = v14[3], !*(unsigned char *)(v3 + 48)))
  {
    uint64_t v6 = *(NSObject **)(v3 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __MFAACreateMatchingHashForCertChainFromHashLSB_block_invoke;
    block[3] = &unk_2644792F0;
    block[4] = &v13;
    void block[5] = &v9;
    void block[6] = theString;
    dispatch_sync(v6, block);
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v10[3];
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v7;
      __int16 v19 = 2112;
      CFStringRef v20 = theString;
      _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Found hash %@ for LSB %@\n", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    MFAACreateMatchingHashForCertChainFromHashLSB_cold_1();
  }
  uint64_t v4 = v10[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v4;
}

uint64_t __MFAACreateMatchingHashForCertChainFromHashLSB_block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t result = CFDictionaryGetCount(*(CFDictionaryRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 64));
  if (result >= 1)
  {
    uint64_t v3 = result;
    MEMORY[0x270FA5388](result);
    unint64_t v5 = (CFStringRef *)((char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    memset(v5, 170, v4);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 64), (const void **)v5, 0);
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    while (1)
    {
      CFStringRef v7 = *v5;
      uint64_t result = CFStringGetLength(*v5);
      if (result >= 2)
      {
        v9.length = 2;
        v9.location = result - 2;
        uint64_t result = (uint64_t)CFStringCreateWithSubstring(v6, v7, v9);
        if (result)
        {
          uint64_t result = CFStringCompare((CFStringRef)result, *(CFStringRef *)(a1 + 48), 1uLL);
          if (!result) {
            break;
          }
        }
      }
      ++v5;
      if (!--v3) {
        return result;
      }
    }
    uint64_t result = (uint64_t)CFStringCreateCopy(v6, v7);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t MFAACreateCertChainDataFromHash(uint64_t a1, uint64_t a2)
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2000000000;
  void v10[3] = a1;
  uint64_t v6 = 0;
  CFStringRef v7 = &v6;
  uint64_t v8 = 0x2000000000;
  uint64_t v9 = 0;
  if (a1 && a2 && !*(unsigned char *)(a1 + 48))
  {
    size_t v4 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __MFAACreateCertChainDataFromHash_block_invoke;
    block[3] = &unk_264479318;
    block[4] = v10;
    void block[5] = &v6;
    void block[6] = a2;
    dispatch_sync(v4, block);
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    MFAACreateCertChainDataFromHash_cold_1();
  }
  uint64_t v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v2;
}

uint64_t MFAAAddCertChainDataEntryToCacheForHash(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2000000000;
  v12[3] = a1;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000;
  char v11 = 0;
  if (a1 && a2 && a3 && !*(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __MFAAAddCertChainDataEntryToCacheForHash_block_invoke;
    block[3] = &unk_264479340;
    void block[6] = a3;
    void block[7] = a2;
    block[4] = v12;
    void block[5] = &v8;
    block[8] = a1;
    dispatch_sync(v6, block);
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    MFAAAddCertChainDataEntryToCacheForHash_cold_1();
  }
  uint64_t v4 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(v12, 8);
  return v4;
}

void __MFAAAddCertChainDataEntryToCacheForHash_block_invoke(uint64_t a1)
{
  valuePtr[1] = *MEMORY[0x263EF8340];
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 64), *(const void **)(a1 + 48)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = IncrementCertEntryUsageCount(*(void *)(a1 + 64), *(void **)(a1 + 48));
LABEL_25:
    uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SyncCertCacheContentsToPreferencesFile(*(void *)(v31 + 56), *(const void **)(v31 + 64));
    return;
  }
  CFNumberRef v2 = CFNumberCreate(0, kCFNumberLongType, &_block_invoke_3_kAuthUsageInitialCount);
  Mutable = CFArrayCreateMutable(0, 2, MEMORY[0x263EFFF70]);
  uint64_t v4 = Mutable;
  if (Mutable)
  {
    CFArraySetValueAtIndex(Mutable, 0, v2);
    CFArraySetValueAtIndex(v4, 1, *(const void **)(a1 + 56));
    CFIndex Count = CFDictionaryGetCount(*(CFDictionaryRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 64));
    if (Count >= 16)
    {
      CFIndex v6 = Count;
      size_t v7 = 8 * Count;
      MEMORY[0x270FA5388](Count);
      uint64_t v8 = (const void **)((char *)valuePtr - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v9 = memset(v8, 170, v7);
      MEMORY[0x270FA5388](v9);
      uint64_t v10 = (CFArrayRef *)v8;
      memset(v8, 170, v7);
      valuePtr[0] = 0xAAAAAAAAAAAAAAAALL;
      CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 64), v8, v8);
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      do
      {
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*v10, 0);
        valuePtr[0] = 0;
        if (CFNumberGetValue(ValueAtIndex, kCFNumberLongType, valuePtr)) {
          BOOL v14 = valuePtr[0] < 1;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14 && (v11 < 1 || valuePtr[0] < v11))
        {
          uint64_t v12 = *v8;
          uint64_t v11 = valuePtr[0];
        }
        ++v8;
        ++v10;
        --v6;
      }
      while (v6);
      if (v12)
      {
        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 64), v12);
      }
      else
      {
        BOOL v23 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
        if (v23) {
          __MFAAAddCertDataEntryToCacheForSerialNumber_block_invoke_cold_2(v23, v24, v25, v26, v27, v28, v29, v30);
        }
      }
    }
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 64), *(const void **)(a1 + 48), v4);
  }
  else
  {
    BOOL v15 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v15) {
      __MFAAAddCertDataEntryToCacheForSerialNumber_block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  if (v2) {
    CFRelease(v2);
  }
  if (v4)
  {
    CFRelease(v4);
    goto LABEL_25;
  }
}

uint64_t MFAARemoveCertChainDataEntryFromCache(uint64_t a1, uint64_t a2)
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2000000000;
  void v10[3] = a1;
  uint64_t v6 = 0;
  size_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  char v9 = 0;
  if (a1 && a2 && !*(unsigned char *)(a1 + 48))
  {
    uint64_t v4 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __MFAARemoveCertChainDataEntryFromCache_block_invoke;
    block[3] = &unk_264479368;
    block[4] = v10;
    void block[5] = &v6;
    void block[6] = a2;
    dispatch_sync(v4, block);
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    MFAARemoveCertChainDataEntryFromCache_cold_1();
  }
  uint64_t v2 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v2;
}

BOOL __MFAARemoveCertChainDataEntryFromCache_block_invoke(uint64_t a1)
{
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 64), *(const void **)(a1 + 48));
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  BOOL result = SyncCertCacheContentsToPreferencesFile(*(void *)(v2 + 56), *(const void **)(v2 + 64));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

CFDataRef MFAACreateSerialNumberDataFromString(const __CFString *a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  char v52 = -86;
  *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v50 = v1;
  long long v51 = v1;
  *(_OWORD *)buffer = v1;
  long long v49 = v1;
  v47[0] = v1;
  v47[1] = v1;
  if (!a1)
  {
    BOOL v31 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v31) {
      MFAACreateSerialNumberDataFromString_cold_1(v31, v32, v33, v34, v35, v36, v37, v38);
    }
    return 0;
  }
  CFIndex Length = CFStringGetLength(a1);
  unint64_t v4 = Length;
  if (Length < 1 || (unint64_t)Length > 0x40 || (Length & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      MFAACreateSerialNumberDataFromString_cold_4(v4);
    }
    return 0;
  }
  if (!CFStringGetCString(a1, buffer, 65, 0x600u))
  {
    BOOL v39 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v39) {
      MFAACreateSerialNumberDataFromString_cold_2(v39, v40, v41, v42, v43, v44, v45, v46);
    }
    return 0;
  }
  unint64_t v5 = v4 >> 1;
  if (v4 >= 2)
  {
    if (v5 <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v4 >> 1;
    }
    size_t v7 = &buffer[1];
    uint64_t v8 = v47;
    do
    {
      int v9 = *(v7 - 1);
      unsigned int v10 = v9 - 48;
      unsigned int v11 = v9 - 97;
      if ((v9 - 65) >= 6) {
        char v12 = 0;
      }
      else {
        char v12 = v9 - 55;
      }
      char v13 = v9 - 87;
      if (v11 > 5) {
        char v13 = v12;
      }
      if (v10 < 0xA) {
        char v13 = v10;
      }
      char v14 = 16 * v13;
      int v16 = *v7;
      v7 += 2;
      char v15 = v16;
      unsigned int v17 = v16 - 48;
      unsigned int v18 = v16 - 97;
      char v19 = v16 - 55;
      if ((v16 - 65) >= 6) {
        char v20 = 0;
      }
      else {
        char v20 = v19;
      }
      char v21 = v15 - 87;
      if (v18 > 5) {
        char v21 = v20;
      }
      if (v17 < 0xA) {
        char v21 = v17;
      }
      *v8++ = v21 + v14;
      --v6;
    }
    while (v6);
  }
  CFDataRef result = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v47, v5);
  if (!result)
  {
    BOOL v23 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v23) {
      MFAACreateSerialNumberDataFromString_cold_3(v23, v24, v25, v26, v27, v28, v29, v30);
    }
    return 0;
  }
  return result;
}

void __CertCacheReferenceCountUpdate_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (!*(void *)(v1 + 40)) {
    return;
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)gCertCacheDomainList, *(const void **)(v1 + 16));
  if (Value)
  {
    if (CFNumberGetValue(Value, kCFNumberIntType, (void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += *(_DWORD *)(a1 + 48);
      CFNumberRef v4 = CFNumberCreate(0, kCFNumberIntType, (const void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
      if (v4)
      {
        CFNumberRef v5 = v4;
        CFDictionarySetValue((CFMutableDictionaryRef)gCertCacheDomainList, *(const void **)(*(void *)(a1 + 40) + 16), v4);
        CFRelease(v5);
        return;
      }
      BOOL v22 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v22) {
        __CertCacheReferenceCountUpdate_block_invoke_cold_3(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
    else
    {
      BOOL v14 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v14) {
        __CertCacheReferenceCountUpdate_block_invoke_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    return;
  }
  BOOL v6 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  if (v6) {
    __CertCacheReferenceCountUpdate_block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
}

uint64_t *MFAACreateCapsFromAuthCert(const __CFData *a1)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v2 = (uint64_t *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
  if (!v2)
  {
    BOOL v14 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v14) {
      MFAACreateCapsFromAuthCert_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    return 0;
  }
  uint64_t v3 = v2;
  *(_OWORD *)uint64_t v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  if (!a1)
  {
    BOOL v22 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v22) {
      MFAACreateCapsFromAuthCert_cold_3(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_36;
  }
  uint64_t v4 = MFAACreateSecurityCertificateReference(a1);
  if (!v4)
  {
    BOOL v30 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v30) {
      MFAACreateCapsFromAuthCert_cold_4(v30, v31, v32, v33, v34, v35, v36, v37);
    }
    goto LABEL_36;
  }
  CFNumberRef v5 = (const void *)v4;
  int v6 = SecCertificateGetiAuthVersion();
  int v7 = v6;
  if (v6 == 5 || v6 == 3)
  {
    CFDataRef v38 = (const __CFData *)SecCertificateCopyiAPAuthCapabilities();
    if (v38)
    {
      CFDataRef v39 = v38;
      BytePtr = (unint64_t *)CFDataGetBytePtr(v38);
      if (CFDataGetLength(v39) == 32)
      {
        unint64_t v41 = bswap64(*BytePtr);
        unint64_t v42 = bswap64(BytePtr[1]);
        unint64_t v43 = bswap64(BytePtr[2]);
        unint64_t v44 = bswap64(BytePtr[3]);
        unint64_t v45 = v44 & 0xFFFFFFFFFFFFD0F9;
        if ((v44 & 0xC000) == 0) {
          unint64_t v45 = v44;
        }
        uint64_t v46 = v45 | 0x2F00;
        if ((v45 & 4) == 0) {
          uint64_t v46 = v45;
        }
        if ((v45 & 2) != 0) {
          uint64_t v47 = v45 | 0xF00;
        }
        else {
          uint64_t v47 = v46;
        }
        CFRelease(v39);
        *uint64_t v3 = v47;
        v3[1] = v43;
        v3[2] = v42;
        v3[3] = v41;
        if (v7 != 3 || !os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO)) {
          goto LABEL_29;
        }
        int v57 = 134218240;
        *(void *)uint64_t v58 = v44;
        *(_WORD *)&v58[8] = 2048;
        *(void *)&v58[10] = v47;
        uint64_t v11 = MEMORY[0x263EF8438];
        uint64_t v12 = "AuthV3 orig authCertCaps0:%08llX -> final authCertCaps0:%08llX\n";
        uint32_t v13 = 22;
        goto LABEL_28;
      }
      CFRelease(v39);
    }
    else
    {
      BOOL v48 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v48) {
        MFAACreateCapsFromAuthCert_cold_6(v48, v49, v50, v51, v52, v53, v54, v55);
      }
    }
    goto LABEL_35;
  }
  if (v6 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      MFAACreateCapsFromAuthCert_cold_5((unsigned __int16)v5, v7);
    }
    goto LABEL_35;
  }
  unsigned int v8 = MFAACertificateAuthV2Class((uint64_t)a1);
  if (v8 >= 0xD)
  {
LABEL_35:
    CFRelease(v5);
LABEL_36:
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      MFAACreateCapsFromAuthCert_cold_2();
    }
    free(v3);
    return 0;
  }
  unsigned int v9 = v8;
  uint64_t v10 = GetAccessoryCaps_kCertAccessoryCaps[v8];
  *uint64_t v3 = v10;
  v3[2] = 0;
  v3[3] = 0;
  v3[1] = 0;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    int v57 = 67109376;
    *(_DWORD *)uint64_t v58 = v9;
    *(_WORD *)&v58[4] = 2048;
    *(void *)&v58[6] = v10;
    uint64_t v11 = MEMORY[0x263EF8438];
    uint64_t v12 = "AuthV2 authCertClass:%02X -> authCertCaps0:%08llX\n";
    uint32_t v13 = 18;
LABEL_28:
    _os_log_impl(&dword_21DC52000, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v57, v13);
  }
LABEL_29:
  CFRelease(v5);
  return v3;
}

void MFAADeallocAuthCertCaps(void *a1)
{
  if (a1)
  {
    free(a1);
  }
  else
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v2) {
      MFAADeallocAuthCertCaps_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

uint64_t MFAACanChargeHighVoltage(uint64_t result)
{
  if (result) {
    return *(unsigned char *)(result + 1) & 1;
  }
  return result;
}

uint64_t MFAACanChargeInductive(uint64_t result)
{
  if (result) {
    return (*(unsigned __int8 *)(result + 1) >> 1) & 1;
  }
  return result;
}

void *MFAACanUseAccPwrUHPM(void *result)
{
  if (result)
  {
    if ((*result & 0x400) != 0) {
      return (void *)((*result >> 10) & 1);
    }
    else {
      return (void *)((*result & 0x410) != 0);
    }
  }
  return result;
}

unsigned __int8 *MFAAIsAppleMFiAccessory(unsigned __int8 *result)
{
  if (result) {
    return (unsigned __int8 *)((*result >> 4) & 1);
  }
  return result;
}

uint64_t MFAACanUseAccPwrLoV(uint64_t result)
{
  if (result) {
    return (*(unsigned __int8 *)(result + 1) >> 3) & 1;
  }
  return result;
}

uint64_t MFAAIsMagSafeAccessory(uint64_t result)
{
  if (result) {
    return (*(unsigned __int8 *)(result + 1) >> 4) & 1;
  }
  return result;
}

uint64_t MFAACanReceiveInductivePower(uint64_t result)
{
  if (result) {
    return (*(unsigned __int8 *)(result + 1) >> 5) & 1;
  }
  return result;
}

unsigned char *MFAAIsAppleAccessory(unsigned char *result)
{
  if (result) {
    return (unsigned char *)((*result & 0x18) == 0);
  }
  return result;
}

unsigned __int8 *MFAAIsAppleHWModule(unsigned __int8 *result)
{
  if (result) {
    return (unsigned __int8 *)((*result >> 3) & 1);
  }
  return result;
}

uint64_t MFAAIsAppleBatteryModule(uint64_t result)
{
  if (result) {
    return *(unsigned __int8 *)(result + 1) >> 7;
  }
  return result;
}

uint64_t MFAAIsAppleTouchControllerModule(uint64_t result)
{
  if (result) {
    return (*(unsigned __int8 *)(result + 1) >> 6) & 1;
  }
  return result;
}

uint64_t mfaa_certificateManager_SWAuthCertType(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  init_logging();
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 2;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    uint64_t v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v4 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_21DC52000, v4, OS_LOG_TYPE_INFO, "Checking SW Auth cert type...", (uint8_t *)&v17, 2u);
  }

  if (a1)
  {
    uint64_t v5 = (void *)SecCertificateCopyIssuerSummary();
    char v6 = [v5 isEqualToString:@"Test Accessories Software Authentication Root CA"];

    if (v6)
    {
      uint64_t v13 = 3;
    }
    else
    {
      uint64_t v7 = (void *)SecCertificateCopyiAPSWAuthCapabilities();
      if (gLogObjects && gNumLogObjects >= 2)
      {
        uint64_t v8 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[MFAATokenManager _init]();
        }
        uint64_t v8 = MEMORY[0x263EF8438];
        id v9 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        uint64_t v18 = v7;
        _os_log_impl(&dword_21DC52000, v8, OS_LOG_TYPE_INFO, "generalData: %@", (uint8_t *)&v17, 0xCu);
      }

      if (v7
        && (unint64_t)[v7 length] >= 2
        && (id v10 = v7, *(unsigned __int8 *)[v10 bytes] == 255)
        && (id v11 = v10, !*(unsigned char *)([v11 bytes] + 1))
        && (unint64_t)[v11 length] >= 3)
      {
        id v12 = v11;
        if (*(unsigned char *)([v12 bytes] + 2) == 1) {
          uint64_t v13 = 1;
        }
        else {
          uint64_t v13 = 2 * (*(unsigned char *)([v12 bytes] + 2) == 0);
        }
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    BOOL v14 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    BOOL v14 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 67109120;
    LODWORD(v18) = v13;
    _os_log_impl(&dword_21DC52000, v14, OS_LOG_TYPE_DEFAULT, "certType: %{coreacc:MFAACertificateManager_SWAuth_CertType_t}d", (uint8_t *)&v17, 8u);
  }

  return v13;
}

id logObjectForModule(int a1)
{
  if (a1 < 0 || (gLogObjects ? (BOOL v1 = gNumLogObjects <= a1) : (BOOL v1 = 1), v1))
  {
    if (a1 != -1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      logObjectForModule_cold_1();
    }
    id v2 = (id)MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    id v2 = *(id *)(gLogObjects + 8 * a1);
  }
  return v2;
}

__CFArray *_createCertificateArrayForCert(const void *a1)
{
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  CFArrayAppendValue(Mutable, a1);
  return Mutable;
}

id _anchorCertsForComponentAuth()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (_anchorCertsForComponentAuth_onceToken != -1) {
    dispatch_once(&_anchorCertsForComponentAuth_onceToken, &__block_literal_global_210);
  }
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 2;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[MFAATokenManager _init]();
    }
    id v2 = MEMORY[0x263EF8438];
    id v1 = MEMORY[0x263EF8438];
  }
  else
  {
    id v2 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    uint64_t v6 = [(id)_anchorCertsForComponentAuth_anchorCerts count];
    _os_log_impl(&dword_21DC52000, v2, OS_LOG_TYPE_INFO, "%lu anchor cert(s) returned for Component Auth", (uint8_t *)&v5, 0xCu);
  }

  id v3 = (void *)_anchorCertsForComponentAuth_anchorCerts;
  return v3;
}

void sub_21DC650A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_21DC65610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t ___anchorCertsForMFi2_block_invoke()
{
  _anchorCertsForMFi2_anchorCerts = +[MFAACertificateManager anchorCertificatesForTypes:1];
  return MEMORY[0x270F9A758]();
}

uint64_t ___anchorCertsForMFi3_block_invoke()
{
  _anchorCertsForMFi3_anchorCerts = +[MFAACertificateManager anchorCertificatesForTypes:2];
  return MEMORY[0x270F9A758]();
}

uint64_t ___anchorCertsForSWAuth_block_invoke()
{
  _anchorCertsForSWAuth_anchorCerts = +[MFAACertificateManager anchorCertificatesForTypes:4];
  return MEMORY[0x270F9A758]();
}

uint64_t ___anchorCertsForComponentAuth_block_invoke()
{
  _anchorCertsForComponentAuth_anchorCerts = +[MFAACertificateManager anchorCertificatesForTypes:8];
  return MEMORY[0x270F9A758]();
}

uint64_t ___anchorCertsForBAAUser_block_invoke()
{
  _anchorCertsForBAAUser_anchorCerts = +[MFAACertificateManager anchorCertificatesForTypes:16];
  return MEMORY[0x270F9A758]();
}

uint64_t ___anchorCertsForDEVN_block_invoke()
{
  _anchorCertsForDEVN_anchorCerts = +[MFAACertificateManager anchorCertificatesForTypes:32];
  return MEMORY[0x270F9A758]();
}

uint64_t ___anchorCertsForProvenance_block_invoke()
{
  _anchorCertsForProvenance_anchorCerts = +[MFAACertificateManager anchorCertificatesForTypes:64];
  return MEMORY[0x270F9A758]();
}

uint64_t ___anchorCertsForWPC_block_invoke()
{
  _anchorCertsForWPC_anchorCerts = +[MFAACertificateManager anchorCertificatesForTypes:128];
  return MEMORY[0x270F9A758]();
}

__CFString *errorDescription(void *a1, unint64_t a2)
{
  id v3 = a1;
  if (![v3 isEqualToString:@"MFAACertificateManagerErrorDomain"]
    && ![v3 isEqualToString:@"MFAATokenManagerErrorDomain"])
  {
    if (![v3 isEqualToString:@"MFAAPairingManagerErrorDomain"])
    {
      int v5 = @"An unknown error has occurred.";
      goto LABEL_11;
    }
    if (a2 > 0xFFFFFFFFFFFFFFFBLL)
    {
      uint64_t v4 = &off_264479638[a2 + 4];
      goto LABEL_5;
    }
LABEL_9:
    int v5 = 0;
    goto LABEL_11;
  }
  if (a2 <= 0xFFFFFFFFFFFFFFF9) {
    goto LABEL_9;
  }
  uint64_t v4 = &off_264479608[a2 + 6];
LABEL_5:
  int v5 = *v4;
LABEL_11:

  return v5;
}

uint64_t MFAAVerifyPublicCertificate(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    MFAAVerifyPublicCertificate_cold_4();
    if (a1) {
      goto LABEL_3;
    }
LABEL_18:
    BOOL v20 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v20) {
      MFAAVerifyPublicCertificate_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    id v3 = 0;
    uint64_t v18 = 0;
    goto LABEL_14;
  }
  if (!a1) {
    goto LABEL_18;
  }
LABEL_3:
  id v2 = +[MFAACertificateManager sharedManager];
  id v3 = (void *)[v2 copyParsedCertificateChainInfo:a1];

  if (v3)
  {
    uint64_t v4 = +[MFAACertificateManager sharedManager];
    int v5 = (void *)[v4 copyEvaluatedCertificateChainInfo:v3];

    if (v5)
    {
      id v6 = v5;

      BOOL v7 = +[MFAACertificateManager isMFi2_3CertInfo:v6];
      id v3 = v6;
    }
    else
    {
      BOOL v7 = 0;
    }
    uint64_t v16 = [v3 objectForKey:@"LeafCertData"];

    if (v7)
    {
      uint64_t v17 = 1;
      uint64_t v18 = (void *)v16;
      goto LABEL_14;
    }
    a1 = v16;
  }
  else
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v8) {
      MFAAVerifyPublicCertificate_cold_3(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    uint64_t v16 = 0;
    id v3 = 0;
  }
  uint64_t v18 = (void *)v16;
  MFAAPrintCertSerialNumber(a1);
  uint64_t v17 = 0;
  uint64_t v16 = a1;
LABEL_14:
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
    MFAAVerifyPublicCertificate_cold_1(v16, v17);
  }

  return v17;
}

uint64_t MFAAVerifyPublicCertificateChain(const __CFArray *a1)
{
  SecTrustRef trust = 0;
  int v50 = 0;
  if (!a1) {
    return 0;
  }
  CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(a1, 0);
  int v3 = MFAACertificateAuthVersionNumber(ValueAtIndex);
  uint64_t v4 = SecPolicyCreateiAP();
  if (!v4)
  {
    BOOL v17 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v17) {
      MFAAVerifyPublicCertificateChain_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    return 0;
  }
  int v5 = (const void *)v4;
  CFIndex Count = CFArrayGetCount(a1);
  Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x263EFFF70]);
  if (!Mutable)
  {
    BOOL v25 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v25) {
      MFAAVerifyPublicCertificateChain_cold_2(v25, v26, v27, v28, v29, v30, v31, v32);
    }
    goto LABEL_34;
  }
  if (CFArrayGetCount(a1) >= 1)
  {
    CFIndex v8 = 0;
    do
    {
      CFDataRef v9 = (const __CFData *)CFArrayGetValueAtIndex(a1, v8);
      if (v9)
      {
        uint64_t v10 = (const void *)MFAACreateSecurityCertificateReference(v9);
        if (v10)
        {
          uint64_t v11 = v10;
          CFArrayAppendValue(Mutable, v10);
          CFRelease(v11);
        }
      }
      ++v8;
    }
    while (CFArrayGetCount(a1) > v8);
  }
  SecTrustCreateWithCertificates(Mutable, v5, &trust);
  if (!trust)
  {
    BOOL v33 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v33) {
      -[MFAACertificateManager verifyNonceSignature:nonce:signature:]2(v33, v34, v35, v36, v37, v38, v39, v40);
    }
    goto LABEL_34;
  }
  uint64_t v12 = MFAACreateAnchorCertificateAuthorityArray(v3);
  if (!v12)
  {
    BOOL v41 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v41) {
      MFAAVerifyPublicCertificateChain_cold_4(v41, v42, v43, v44, v45, v46, v47, v48);
    }
LABEL_34:
    uint64_t v13 = 0;
    goto LABEL_17;
  }
  uint64_t v13 = v12;
  SecTrustSetAnchorCertificates(trust, v12);
  int v14 = MEMORY[0x223C170E0](trust, &v50);
  if (v14)
  {
    int v49 = v14;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      MFAAVerifyPublicCertificateChain_cold_6(v49);
    }
  }
  else
  {
    uint64_t v15 = 1;
    if (v50 == 1 || v50 == 4) {
      goto LABEL_18;
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      MFAAVerifyPublicCertificateChain_cold_5(&v50);
    }
  }
LABEL_17:
  uint64_t v15 = 0;
LABEL_18:
  CFRelease(v5);
  if (trust) {
    CFRelease(trust);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v13) {
    CFRelease(v13);
  }
  return v15;
}

uint64_t MFAAVerifyCertificateSerialNumber(uint64_t a1)
{
  if (a1)
  {
    id v2 = +[MFAACertificateManager sharedManager];
    uint64_t v3 = [v2 copyParsedCertificateChainInfo:a1];
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      char v5 = [v2 verifyCertificateChainInfoSerialNumber:v3];

      if (v5) {
        return 1;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
        MFAAVerifyCertificateSerialNumber_cold_2();
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    MFAAVerifyCertificateSerialNumber_cold_1();
  }
  MFAAPrintCertSerialNumber(a1);
  return 0;
}

uint64_t MFAAVerifyCertificateSerialNumberBySerialNumber(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v4 = +[MFAACertificateManager sharedManager];
    uint64_t v5 = [v4 verifyCertificateSerialNumberBySerialNumber:a1 authVer:a2];

    return v5;
  }
  else
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v7) {
      -[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    return 0;
  }
}

uint64_t MFAAVerifyNonceSignature(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = +[MFAACertificateManager sharedManager];
  BOOL v7 = v6;
  if (!a1)
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v11) {
      MFAAVerifyNonceSignature_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_15;
  }
  if (!a2)
  {
    BOOL v19 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v19) {
      MFAAVerifyNonceSignature_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    goto LABEL_15;
  }
  if (!a3)
  {
    BOOL v27 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v27) {
      MFAAVerifyNonceSignature_cold_3(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    goto LABEL_15;
  }
  uint64_t v8 = [v6 copyParsedCertificateChainInfo:a1];
  if (!v8)
  {
    BOOL v35 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v35) {
      MFAAVerifyNonceSignature_cold_4(v35, v36, v37, v38, v39, v40, v41, v42);
    }
LABEL_15:
    uint64_t v9 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = (void *)v8;
  if (([v7 verifyNonceSignature:v8 nonce:a2 signature:a3] & 1) == 0)
  {
LABEL_16:
    MFAAPrintCertSerialNumber(a1);
    uint64_t v10 = 0;
    goto LABEL_17;
  }
  uint64_t v10 = 1;
LABEL_17:

  return v10;
}

uint64_t MFAACreateCertificateSerialNumber(uint64_t a1)
{
  if (a1)
  {
    id v2 = +[MFAACertificateManager sharedManager];
    uint64_t v3 = (void *)[v2 copyParsedCertificateChainInfo:a1];

    if (!v3
      || (+[MFAACertificateManager sharedManager],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          uint64_t v5 = [v4 copyLeafCertificateSerialNumber:v3],
          v4,
          !v5))
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v6) {
        MFAACreateCertificateSerialNumber_cold_2(v6, v7, v8, v9, v10, v11, v12, v13);
      }
      uint64_t v5 = 0;
    }
  }
  else
  {
    BOOL v14 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v14) {
      MFAACreateCertificateSerialNumber_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    return 0;
  }
  return v5;
}

CFDataRef MFAACreateRandomNonce(const __CFData *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    BOOL v6 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v6) {
      MFAACreateCertificateSerialNumber_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    return 0;
  }
  uint64_t v1 = MFAACreateSecurityCertificateReference(a1);
  if (!v1) {
    return 0;
  }
  id v2 = (const void *)v1;
  uint64_t v3 = SecCertificateGetiAuthVersion();
  if (v3 == 2)
  {
    size_t v15 = 20;
  }
  else
  {
    int v4 = v3;
    if (v3 != 3)
    {
      uint64_t v5 = (const void *)SecCertificateCopyComponentType();
      if (v5)
      {
        CFRelease(v5);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v28 = v4;
          _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "SecCertificateGetiAuthVersion invalid auth version: %{coreacc:SeciAuthVersion}d, and no SecCertificateCopyComponentType", buf, 8u);
        }
        uint64_t v3 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT);
        if (v3)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Using AUTH_V300_LENGTH_KEY_256 for default length", buf, 2u);
        }
      }
    }
    size_t v15 = 32;
  }
  MEMORY[0x270FA5388](v3);
  uint64_t v17 = &buf[-v16];
  memset(&buf[-v16], 170, v15);
  arc4random_buf(v17, v15);
  CFDataRef v14 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v17, v15);
  if (!v14)
  {
    BOOL v18 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v18) {
      MFAACreateRandomNonce_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  CFRelease(v2);
  return v14;
}

uint64_t MFAAComponentAuthCreateSignature(uint64_t a1, const __CFData *a2, void *a3, int a4, uint64_t a5)
{
  kern_return_t v11;
  int v12;
  CFDataRef v13;
  int v14;
  CFDataRef v15;
  int v16;
  uint64_t v17;
  NSObject *v19;
  const char *v20;
  kern_return_t v21;
  int v22;
  uint32_t v23;
  int v24;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  int v28;
  uint64_t v29;
  io_connect_t connect;
  CFDataRef v31;
  CFDataRef v32;
  CFDataRef v33;
  uint8_t buf[8];
  uint64_t v35;

  CFDataRef v8 = a2;
  BOOL v35 = *MEMORY[0x263EF8340];
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v31 = 0;
  connect = 0;
  uint64_t v29 = 0;
  if (a5 == 2)
  {
    if (!a2)
    {
      *(void *)buf = 0;
      CFDataRef v8 = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:8];
      CFDataRef v9 = v8;
      goto LABEL_6;
    }
  }
  else if (!a2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "!challenge\n", buf, 2u);
    }
    uint64_t v17 = 0;
    uint64_t v13 = 0;
    size_t v15 = 0;
    CFDataRef v9 = 0;
    goto LABEL_19;
  }
  CFDataRef v9 = 0;
LABEL_6:
  if (!a3)
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    uint64_t v19 = MEMORY[0x263EF8438];
    uint64_t v20 = "!response\n";
LABEL_36:
    uint64_t v23 = 2;
    goto LABEL_37;
  }
  io_service_t AuthCP = __findAuthCP();
  if (!AuthCP)
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    uint64_t v19 = MEMORY[0x263EF8438];
    uint64_t v20 = "!moduleAuthService\n";
    goto LABEL_36;
  }
  uint64_t v11 = IOServiceOpen(AuthCP, *MEMORY[0x263EF8960], 0, &connect);
  if (v11)
  {
    uint64_t v21 = v11;
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v21;
    uint64_t v19 = MEMORY[0x263EF8438];
    uint64_t v20 = "IOServiceOpen failed: 0x%x\n";
LABEL_33:
    uint64_t v23 = 8;
LABEL_37:
    _os_log_impl(&dword_21DC52000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v23);
    goto LABEL_38;
  }
  if (!connect)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "!connect\n", buf, 2u);
    }
    uint64_t v13 = 0;
    size_t v15 = 0;
    goto LABEL_18;
  }
  uint64_t v12 = cpCreateFormattedChallengeFromServerRequest(connect, v8, &v33);
  if (v12)
  {
    uint64_t v22 = v12;
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v22;
    uint64_t v19 = MEMORY[0x263EF8438];
    uint64_t v20 = "cpCreateFormattedChallengeFromServerRequest failed: 0x%x\n";
    goto LABEL_33;
  }
  uint64_t v13 = v33;
  if (!v33)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v19 = MEMORY[0x263EF8438];
      uint64_t v20 = "formattedChallengeCF==NULL\n";
      goto LABEL_36;
    }
LABEL_38:
    uint64_t v17 = 0;
    uint64_t v13 = 0;
LABEL_45:
    size_t v15 = 0;
    goto LABEL_19;
  }
  if (![(__CFData *)v33 length]) {
    goto LABEL_44;
  }
  CFDataRef v14 = cpCreateSignatureWithIndexAndToken(connect, v13, &v32, &v29, a4);
  if (v14)
  {
    uint64_t v24 = v14;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v24;
      uint64_t v25 = MEMORY[0x263EF8438];
      uint64_t v26 = "cpCreateSignatureWithIndexAndToken failed: 0x%x\n";
      BOOL v27 = 8;
LABEL_43:
      _os_log_impl(&dword_21DC52000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
    }
LABEL_44:
    uint64_t v17 = 0;
    goto LABEL_45;
  }
  size_t v15 = v32;
  if (!v32)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v25 = MEMORY[0x263EF8438];
      uint64_t v26 = "signatureCF==NULL\n";
      BOOL v27 = 2;
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  uint64_t v16 = cpCreateFormattedResponseForServerResponse(connect, v32, &v31, a5);
  if (!v16)
  {
    if (v31) {
      *a3 = v31;
    }
LABEL_18:
    uint64_t v17 = 1;
    goto LABEL_19;
  }
  int v28 = v16;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v28;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "cpCreateFormattedResponseForServerResponse failed: 0x%x\n", buf, 8u);
  }
  uint64_t v17 = 0;
LABEL_19:
  if (connect) {
    IOServiceClose(connect);
  }

  return v17;
}

uint64_t __findAuthCP()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  *(void *)existing = 0;
  CFDictionaryRef v0 = IOServiceMatching("AppleAuthCP");
  if (!v0)
  {
    uint64_t v1 = 0;
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      return v1;
    }
    *(_WORD *)buf = 0;
    uint64_t v7 = MEMORY[0x263EF8438];
    CFDataRef v8 = "!matchingDict\n";
LABEL_25:
    _os_log_impl(&dword_21DC52000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
    return 0;
  }
  if (IOServiceGetMatchingServices(*MEMORY[0x263F0EC88], v0, &existing[1]))
  {
    uint64_t v1 = 0;
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      return v1;
    }
    *(_WORD *)buf = 0;
    uint64_t v7 = MEMORY[0x263EF8438];
    CFDataRef v8 = "IOServiceGetMatchingServices failed\n";
    goto LABEL_25;
  }
  if (!existing[1])
  {
    uint64_t v1 = 0;
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      return v1;
    }
    *(_WORD *)buf = 0;
    uint64_t v7 = MEMORY[0x263EF8438];
    CFDataRef v8 = "!iter\n";
    goto LABEL_25;
  }
  uint64_t v1 = IOIteratorNext(existing[1]);
  if (!v1) {
    goto LABEL_17;
  }
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v3 = MEMORY[0x263EF8438];
  while (1)
  {
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v1, @"flags", v2, 0);
    if (!CFProperty)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DC52000, v3, OS_LOG_TYPE_DEFAULT, "numberref is NULL\n", buf, 2u);
      }
      goto LABEL_14;
    }
    CFNumberRef v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, existing))
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        io_iterator_t v11 = existing[0];
        _os_log_impl(&dword_21DC52000, v3, OS_LOG_TYPE_DEFAULT, "tmpAuthFlags=%d\n", buf, 8u);
      }
      if (BYTE2(existing[0]) << 16 == 0x40000) {
        break;
      }
    }
    CFRelease(v5);
LABEL_14:
    IOObjectRelease(v1);
    uint64_t v1 = IOIteratorNext(existing[1]);
    if (!v1) {
      goto LABEL_17;
    }
  }
  CFRelease(v5);
LABEL_17:
  IOObjectRelease(existing[1]);
  return v1;
}

id convertNSDataToNSString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v3;
    uint64_t v6 = [v5 bytes];
    id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
    if ([v5 length])
    {
      unint64_t v8 = 0;
      do
        objc_msgSend(v7, "appendFormat:", v4, *(unsigned __int8 *)(v6 + v8++));
      while (v8 < [v5 length]);
    }
    CFDataRef v9 = [NSString stringWithString:v7];
  }
  else
  {
    CFDataRef v9 = 0;
  }

  return v9;
}

id trimBidirectionalUnicodeCharacters(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F08708];
  id v2 = a1;
  id v3 = [v1 characterSetWithCharactersInString:@"\u202A\u202B\u202C\u202D"];
  id v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return v4;
}

id removeBidirectionalUnicodeCharacters(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F08708];
  id v2 = a1;
  id v3 = [v1 characterSetWithCharactersInString:@"\u202A\u202B\u202C\u202D"];
  id v4 = [v2 componentsSeparatedByCharactersInSet:v3];

  id v5 = [v4 componentsJoinedByString:&stru_26CE90750];

  return v5;
}

id convertNSStringToNSData(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = [MEMORY[0x263F08708] hexadecimalCharacterSet];
    id v3 = [v2 invertedSet];
    id v4 = [v1 componentsSeparatedByCharactersInSet:v3];
    id v5 = [v4 componentsJoinedByString:&stru_26CE90750];

    id v1 = v5;
    uint64_t v6 = (const char *)[v1 UTF8String];
    size_t v7 = strlen(v6) >> 1;
    unint64_t v8 = malloc_type_malloc(v7, 0x71BB6ACDuLL);
    if (v6 && (unint64_t)[v1 length] >= 2)
    {
      unint64_t v9 = 0;
      int v10 = 0;
      do
      {
        uint64_t v11 = 0;
        __int16 v22 = -21846;
        char v12 = 1;
        do
        {
          char v13 = v12;
          int v14 = v6[v11 | (2 * v10)];
          unsigned int v15 = v14 - 48;
          unsigned int v16 = v14 - 65;
          if ((v14 - 97) >= 6) {
            char v17 = 0;
          }
          else {
            char v17 = v14 - 87;
          }
          char v18 = v14 - 55;
          if (v16 > 5) {
            char v18 = v17;
          }
          if (v15 < 0xA) {
            char v18 = v15;
          }
          *((unsigned char *)&v22 + v11) = v18;
          uint64_t v11 = 1;
          char v12 = 0;
        }
        while ((v13 & 1) != 0);
        v8[v9] = HIBYTE(v22) | (16 * v22);
        unint64_t v9 = (v10 + 1);
        unint64_t v19 = [v1 length];
        int v10 = v9;
      }
      while (v9 < v19 >> 1);
    }
    uint64_t v20 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:v7];
    if (v8) {
      free(v8);
    }
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

uint64_t classImplementsMethodsInProtocol(void *a1, void *a2, BOOL a3, BOOL a4, void *a5)
{
  unint64_t v9 = a2;
  int v10 = [MEMORY[0x263EFF9C0] set];
  outCFIndex Count = 0;
  uint64_t v11 = protocol_copyMethodDescriptionList(v9, a3, a4, &outCount);
  char v12 = v11;
  if (outCount)
  {
    unint64_t v13 = 0;
    p_name = &v11->name;
    do
    {
      if (([a1 instancesRespondToSelector:*p_name] & 1) == 0)
      {
        unsigned int v15 = NSStringFromSelector(*p_name);
        [v10 addObject:v15];
      }
      ++v13;
      p_name += 2;
    }
    while (v13 < outCount);
  }
  free(v12);
  if (outCount && [v10 count])
  {
    uint64_t v16 = 0;
    if (!a5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v16 = 1;
  if (a5)
  {
LABEL_11:
    *a5 = [MEMORY[0x263EFFA08] setWithSet:v10];
  }
LABEL_12:

  return v16;
}

uint64_t isNSObjectNull(void *a1)
{
  if (!a1) {
    return 1;
  }
  id v1 = (void *)MEMORY[0x263EFF9D0];
  id v2 = a1;
  id v3 = [v1 null];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

id NSObjectIfNotNull(void *a1)
{
  id v1 = a1;
  if (isNSObjectNull(v1)) {
    id v2 = 0;
  }
  else {
    id v2 = v1;
  }

  return v2;
}

uint64_t isNSObjectEqual(unint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    return [(id)a1 isEqual:a2];
  }
  else {
    return 1;
  }
}

id castNSObjectToType(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id readJSONFile(uint64_t a1)
{
  if (a1)
  {
    id v1 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:a1];
    if (v1)
    {
      uint64_t v5 = 0;
      id v2 = [MEMORY[0x263F08900] JSONObjectWithData:v1 options:0 error:&v5];
      id v3 = v2;
      if (!v5)
      {
LABEL_6:

        goto LABEL_8;
      }
    }
    id v3 = 0;
    goto LABEL_6;
  }
  id v3 = 0;
LABEL_8:
  return v3;
}

uint64_t writeJSONFile(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v4) {
    goto LABEL_7;
  }
  if (!v3) {
    id v3 = (id)MEMORY[0x263EFFA78];
  }
  if ([MEMORY[0x263F08900] isValidJSONObject:v3])
  {
    uint64_t v9 = 0;
    uint64_t v5 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:1 error:&v9];
    uint64_t v6 = v5;
    if (v9) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = [v5 writeToFile:v4 atomically:1];
    }
  }
  else
  {
LABEL_7:
    uint64_t v7 = 0;
  }

  return v7;
}

id base64EncodeArray(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [MEMORY[0x263EFF980] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "base64EncodedStringWithOptions:", 0, (void)v10);
        if (v8) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

id base64DecodeArray(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = objc_alloc(MEMORY[0x263EFF8F8]);
        long long v10 = objc_msgSend(v9, "initWithBase64EncodedString:options:", v8, 0, (void)v12);
        if (v10) {
          [v2 addObject:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

uint64_t getNumRevokedAuth3Wafers()
{
  return 26;
}

void *getRevokedAuth3Wafers()
{
  return &wafers;
}

uint64_t MFAACreateSecurityCertificateReference(const __CFData *a1)
{
  CFArrayRef v2 = (const __CFArray *)SecCMSCertificatesOnlyMessageCopyCertificates();
  CFArrayRef v3 = v2;
  if (v2 && CFArrayGetCount(v2) >= 1)
  {
    CFIndex Count = CFArrayGetCount(v3);
    CFDataRef ValueAtIndex = CFArrayGetValueAtIndex(v3, Count - 1);
    uint64_t v6 = (uint64_t)ValueAtIndex;
    if (ValueAtIndex) {
      CFRetain(ValueAtIndex);
    }
    goto LABEL_6;
  }
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  uint64_t v6 = SecCertificateCreateWithBytes();
  if (v3) {
LABEL_6:
  }
    CFRelease(v3);
  if (!v6)
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v7) {
      MFAACreateSecurityCertificateReference_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  return v6;
}

uint64_t MFAACreateSecurityCertificateReferenceFromBytes(UInt8 *bytes, CFIndex length)
{
  if (!bytes) {
    return 0;
  }
  if (!length) {
    return 0;
  }
  CFDataRef v2 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  if (!v2) {
    return 0;
  }
  CFDataRef v3 = v2;
  uint64_t v4 = MFAACreateSecurityCertificateReference(v2);
  CFRelease(v3);
  return v4;
}

__CFArray *MFAACreateAnchorCertificateAuthorityArray(int a1)
{
  if (MFAAIsInternalBuild_onceToken != -1) {
    dispatch_once(&MFAAIsInternalBuild_onceToken, &__block_literal_global_1);
  }
  if (MFAAIsDesenseBuild_onceToken != -1) {
    dispatch_once(&MFAAIsDesenseBuild_onceToken, &__block_literal_global_5);
  }
  if (MFAAIsDevelopmentHW_onceToken != -1) {
    dispatch_once(&MFAAIsDevelopmentHW_onceToken, &__block_literal_global_20);
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    switch(a1)
    {
      case 5:
        uint64_t v13 = (const void *)MFAACreateSecurityCertificateReferenceFromBytes(kCertDER_Mfi4_Root, 504);
        if (v13)
        {
          uint64_t v14 = v13;
          CFArrayAppendValue(Mutable, v13);
          CFRelease(v14);
        }
        else
        {
          BOOL v34 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (v34) {
            MFAACreateAnchorCertificateAuthorityArray_cold_12(v34, v35, v36, v37, v38, v39, v40, v41);
          }
        }
        if (gbIsInternalBuild | gbIsDesenseBuild)
        {
          uint64_t v25 = (const void *)MFAACreateSecurityCertificateReferenceFromBytes(kCertDER_Mfi4_Root_Test, 505);
          if (v25) {
            goto LABEL_52;
          }
          BOOL v42 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (v42) {
            MFAACreateAnchorCertificateAuthorityArray_cold_11(v42, v43, v44, v45, v46, v47, v48, v49);
          }
        }
        break;
      case 3:
        long long v15 = (const void *)MFAACreateSecurityCertificateReferenceFromBytes(kiPodAccessoryTestAuth3CA, 667);
        if (v15)
        {
          uint64_t v16 = v15;
          CFArrayAppendValue(Mutable, v15);
          CFRelease(v16);
        }
        else
        {
          BOOL v50 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (v50) {
            MFAACreateAnchorCertificateAuthorityArray_cold_10(v50, v51, v52, v53, v54, v55, v56, v57);
          }
        }
        uint64_t v58 = (const void *)MFAACreateSecurityCertificateReferenceFromBytes(kAuth3ECSSubCADev, 667);
        if (v58)
        {
          uint64_t v59 = v58;
          CFArrayAppendValue(Mutable, v58);
          CFRelease(v59);
        }
        else
        {
          BOOL v60 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (v60) {
            MFAACreateAnchorCertificateAuthorityArray_cold_9(v60, v61, v62, v63, v64, v65, v66, v67);
          }
        }
        __int16 v68 = (const void *)MFAACreateSecurityCertificateReferenceFromBytes(kAuth3ECSSubCAProd, 667);
        if (v68)
        {
          int v69 = v68;
          CFArrayAppendValue(Mutable, v68);
          CFRelease(v69);
        }
        else
        {
          BOOL v70 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (v70) {
            MFAACreateAnchorCertificateAuthorityArray_cold_8(v70, v71, v72, v73, v74, v75, v76, v77);
          }
        }
        if (gbIsInternalBuild | gbIsDesenseBuild)
        {
          v78 = (const void *)MFAACreateSecurityCertificateReferenceFromBytes(kiPodAccessoryTestCAProto, 637);
          if (v78)
          {
            v79 = v78;
            CFArrayAppendValue(Mutable, v78);
            CFRelease(v79);
          }
          else
          {
            BOOL v80 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
            if (v80) {
              MFAACreateAnchorCertificateAuthorityArray_cold_7(v80, v81, v82, v83, v84, v85, v86, v87);
            }
          }
          v88 = (const void *)MFAACreateSecurityCertificateReferenceFromBytes(kAuth3ECSSubCASimu, 667);
          if (v88)
          {
            v89 = v88;
            CFArrayAppendValue(Mutable, v88);
            CFRelease(v89);
          }
          else
          {
            BOOL v90 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
            if (v90) {
              MFAACreateAnchorCertificateAuthorityArray_cold_6(v90, v91, v92, v93, v94, v95, v96, v97);
            }
          }
          uint64_t v25 = (const void *)MFAACreateSecurityCertificateReferenceFromBytes(kAuth3ECSSubCADev0, 667);
          if (v25) {
            goto LABEL_52;
          }
          BOOL v100 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (v100) {
            MFAACreateAnchorCertificateAuthorityArray_cold_5(v100, v101, v102, v103, v104, v105, v106, v107);
          }
        }
        break;
      case 2:
        CFDataRef v3 = (const void *)SecCertificateCreateWithBytes();
        if (v3)
        {
          uint64_t v4 = v3;
          CFArrayAppendValue(Mutable, v3);
          CFRelease(v4);
        }
        else
        {
          BOOL v17 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (v17) {
            MFAACreateAnchorCertificateAuthorityArray_cold_4(v17, v18, v19, v20, v21, v22, v23, v24);
          }
        }
        uint64_t v25 = (const void *)SecCertificateCreateWithBytes();
        if (!v25)
        {
          BOOL v26 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (v26) {
            MFAACreateAnchorCertificateAuthorityArray_cold_3(v26, v27, v28, v29, v30, v31, v32, v33);
          }
          return Mutable;
        }
LABEL_52:
        v98 = v25;
        CFArrayAppendValue(Mutable, v25);
        CFRelease(v98);
        return Mutable;
      default:
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          MFAACreateAnchorCertificateAuthorityArray_cold_2(a1);
        }
        break;
    }
  }
  else
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v5) {
      MFAACreateAnchorCertificateAuthorityArray_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return Mutable;
}

uint64_t MFAAIsInternalBuild()
{
  if (MFAAIsInternalBuild_onceToken != -1) {
    dispatch_once(&MFAAIsInternalBuild_onceToken, &__block_literal_global_1);
  }
  return gbIsInternalBuild;
}

uint64_t MFAAIsDesenseBuild()
{
  if (MFAAIsDesenseBuild_onceToken != -1) {
    dispatch_once(&MFAAIsDesenseBuild_onceToken, &__block_literal_global_5);
  }
  return gbIsDesenseBuild;
}

uint64_t MFAAIsDevelopmentHW()
{
  if (MFAAIsDevelopmentHW_onceToken != -1) {
    dispatch_once(&MFAAIsDevelopmentHW_onceToken, &__block_literal_global_20);
  }
  return gbIsDevelopmentHW;
}

uint64_t MFAACertificateAuthVersionNumber(const __CFData *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = MFAACreateSecurityCertificateReference(a1);
  if (!v1) {
    return 0;
  }
  CFDataRef v2 = (const void *)v1;
  unsigned int v3 = SecCertificateGetiAuthVersion();
  if (v3 - 2 >= 4) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v3;
  }
  CFRelease(v2);
  return v4;
}

uint64_t MFAACertificateAuthV2Class(uint64_t a1)
{
  CFDataRef v1 = (const __CFData *)MFAACreateCertificateSerialNumber(a1);
  if (v1)
  {
    CFDataRef v2 = v1;
    BytePtr = CFDataGetBytePtr(v1);
    CFIndex Length = CFDataGetLength(v2);
    if (BytePtr && Length == 15)
    {
      if (BytePtr[7] <= 0x10u && BytePtr[2] == 170 && BytePtr[6] == 170)
      {
        uint64_t v5 = 0x7FFFFFFFLL;
        if (BytePtr[8] == 170)
        {
          if (BytePtr[11] == 170) {
            uint64_t v5 = BytePtr[7];
          }
          else {
            uint64_t v5 = 0x7FFFFFFFLL;
          }
        }
        goto LABEL_17;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      MFAACertificateAuthV2Class_cold_2();
    }
    uint64_t v5 = 0x7FFFFFFFLL;
LABEL_17:
    CFRelease(v2);
    return v5;
  }
  BOOL v6 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  if (v6) {
    MFAACertificateAuthV2Class_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  return 0x7FFFFFFFLL;
}

void MFAAPrintCertSerialNumber(uint64_t a1)
{
  CFDataRef v1 = (const __CFData *)MFAACreateCertificateSerialNumber(a1);
  if (v1)
  {
    CFDataRef v2 = v1;
    BytePtr = (unsigned __int8 *)CFDataGetBytePtr(v1);
    CFIndex Length = CFDataGetLength(v2);
    MFAAPrintCertSerialNumberBytes(BytePtr, Length);
    CFRelease(v2);
  }
  else
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v5) {
      MFAACertificateAuthV2Class_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

void MFAAPrintCertSerialNumberBytes(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  unsigned int v3 = a1;
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a1 && (unint64_t)(a2 - 1) <= 0xF)
  {
    long long v20 = 0u;
    memset(v21, 0, sizeof(v21));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v4 = v7;
    *(_OWORD *)uint64_t v7 = 0u;
    while (1)
    {
      int v5 = sprintf(v4, "%02X", *v3);
      int v6 = v5;
      if (v5 < 1) {
        break;
      }
      ++v3;
      v4 += v5;
      if (!--v2) {
        goto LABEL_11;
      }
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      MFAAPrintCertSerialNumberBytes_cold_2(v6);
    }
LABEL_11:
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      MFAAPrintCertSerialNumberBytes_cold_1((uint64_t)v7);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    MFAAPrintCertSerialNumberBytes_cold_3();
  }
}

uint64_t __MFAAIsInternalBuild_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  gbIsInternalBuild = result;
  return result;
}

uint64_t __MFAAIsDesenseBuild_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  gbIsDesenseBuild = result;
  return result;
}

uint64_t MFAAIsDeveloperBuild()
{
  if (MFAAIsDeveloperBuild_onceToken != -1) {
    dispatch_once(&MFAAIsDeveloperBuild_onceToken, &__block_literal_global_11);
  }
  return gbIsDeveloperBuild;
}

void __MFAAIsDeveloperBuild_block_invoke()
{
  CFDictionaryRef v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    CFDataRef v1 = v0;
    gbIsDeveloperBuild = CFEqual(v0, @"Beta") != 0;
    CFRelease(v1);
  }
}

uint64_t __MFAAIsDevelopmentHW_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  gbIsDevelopmentHW = result ^ 1;
  return result;
}

double MFAACreateDEVNCertCapsForCable()
{
  CFDictionaryRef v0 = malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
  if (v0)
  {
    double result = *(double *)&MFAACreateDEVNCertCapsForCable_kDEVNTempCertCapsForCable;
    _OWORD *v0 = MFAACreateDEVNCertCapsForCable_kDEVNTempCertCapsForCable;
    v0[1] = unk_21DCE8458;
  }
  return result;
}

uint64_t MFAAPrefixesBinarySearch(uint64_t a1, unint64_t a2, int a3)
{
  int v3 = a3 - 1;
  if (a3 >= 1)
  {
    int v4 = 0;
    do
    {
      uint64_t v5 = ((v4 + v3) / 2);
      unint64_t v6 = *(void *)(a1 + 24 * (int)v5);
      if (v6 <= a2)
      {
        if (v6 >= a2) {
          return v5;
        }
        int v4 = v5 + 1;
      }
      else
      {
        int v3 = v5 - 1;
      }
    }
    while (v4 <= v3);
  }
  return 0xFFFFFFFFLL;
}

BOOL MFAABatchBinarySearch(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3 = 0;
LABEL_2:
  uint64_t v4 = v3;
  do
  {
    uint64_t v3 = v4;
    if ((int)v4 >= a3) {
      break;
    }
    int v5 = ((int)v4 + a3 - 1) / 2;
    unsigned int v6 = (*(unsigned __int8 *)(a1 + 3 * v5) << 16) | (*(unsigned __int8 *)(a1 + 3 * v5 + 1) << 8) | *(unsigned __int8 *)(a1 + 3 * v5 + 2);
    if (v6 > a2)
    {
      a3 = v5;
      goto LABEL_2;
    }
    uint64_t v4 = (v5 + 1);
  }
  while (v6 < a2);
  return (int)v3 < a3;
}

BOOL MFAAWaferBinarySearch(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v3 = 0;
LABEL_2:
  uint64_t v4 = v3;
  do
  {
    uint64_t v3 = v4;
    if ((int)v4 >= a3) {
      break;
    }
    int v5 = ((int)v4 + a3 - 1) / 2;
    unint64_t v6 = *(void *)(a1 + 8 * v5);
    if (v6 > a2)
    {
      a3 = v5;
      goto LABEL_2;
    }
    uint64_t v4 = (v5 + 1);
  }
  while (v6 < a2);
  return (int)v3 < a3;
}

uint64_t MFAADeviceIdentityRequestCertificate(const void *a1, int a2, void *a3, void *a4)
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  long long v131 = 0u;
  long long v132 = 0u;
  dispatch_semaphore_t v92 = dispatch_semaphore_create(0);
  uint64_t v118 = 0;
  v119 = &v118;
  uint64_t v120 = 0x3032000000;
  v121 = __Block_byref_object_copy__0;
  v122 = __Block_byref_object_dispose__0;
  id v123 = 0;
  uint64_t v112 = 0;
  v113 = &v112;
  uint64_t v114 = 0x3032000000;
  v115 = __Block_byref_object_copy__0;
  v116 = __Block_byref_object_dispose__0;
  id v117 = 0;
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x2020000000;
  uint64_t v111 = 0;
  uint64_t v104 = 0;
  uint64_t v105 = &v104;
  uint64_t v106 = 0x2020000000;
  char v107 = 0;
  if (!DeviceIdentityFrameworkAvailable_available)
  {
    if (DeviceIdentityLibraryCore())
    {
      uint64_t DeviceIdentityIssueClientCertificateWithCompletionSymbolLoc = getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc();
      DeviceIdentityFrameworkAvailable_available = DeviceIdentityIssueClientCertificateWithCompletionSymbolLoc != 0;
      if (DeviceIdentityIssueClientCertificateWithCompletionSymbolLoc) {
        goto LABEL_2;
      }
    }
    else
    {
      DeviceIdentityFrameworkAvailable_available = 0;
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      MFAADeviceIdentityRequestCertificate_cold_1();
    }
    uint64_t v93 = 0;
    id v68 = 0;
    uint64_t v74 = 1;
    goto LABEL_85;
  }
LABEL_2:
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v5 = (void *)v119[5];
  v119[5] = (uint64_t)v4;

  HIWORD(v132) = 770;
  uint64_t v93 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v131 length:32];
  CFTypeRef v103 = 0;
  unint64_t v6 = (const void *)SecAccessControlCreate();
  if (v6)
  {
    uint64_t v7 = *MEMORY[0x263F16EB8];
    if (SecAccessControlSetProtection())
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "MFAADeviceIdentityRequestCertificate";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 93;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v6;
        _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s:%d localAccessControl %@", buf, 0x1Cu);
      }
      long long v8 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v124 = 0;
      v125 = &v124;
      uint64_t v126 = 0x2020000000;
      long long v9 = (id *)getkMAOptionsBAAKeychainLabelSymbolLoc_ptr;
      uint64_t v127 = getkMAOptionsBAAKeychainLabelSymbolLoc_ptr;
      if (!getkMAOptionsBAAKeychainLabelSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getkMAOptionsBAAKeychainLabelSymbolLoc_block_invoke;
        *(void *)&uint8_t buf[24] = &unk_264479720;
        v134 = &v124;
        long long v10 = (void *)DeviceIdentityLibrary();
        long long v11 = dlsym(v10, "kMAOptionsBAAKeychainLabel");
        *(void *)(v134[1] + 24) = v11;
        getkMAOptionsBAAKeychainLabelSymbolLoc_ptr = *(void *)(v134[1] + 24);
        long long v9 = (id *)v125[3];
      }
      uint64_t v87 = v8;
      _Block_object_dispose(&v124, 8);
      if (v9)
      {
        id v12 = *v9;
        v129[0] = v12;
        v130[0] = a1;
        uint64_t v124 = 0;
        v125 = &v124;
        uint64_t v126 = 0x2020000000;
        long long v13 = (id *)getkMAOptionsBAAKeychainAccessGroupSymbolLoc_ptr;
        uint64_t v127 = getkMAOptionsBAAKeychainAccessGroupSymbolLoc_ptr;
        if (!getkMAOptionsBAAKeychainAccessGroupSymbolLoc_ptr)
        {
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getkMAOptionsBAAKeychainAccessGroupSymbolLoc_block_invoke;
          *(void *)&uint8_t buf[24] = &unk_264479720;
          v134 = &v124;
          long long v14 = (void *)DeviceIdentityLibrary();
          long long v15 = dlsym(v14, "kMAOptionsBAAKeychainAccessGroup");
          *(void *)(v134[1] + 24) = v15;
          getkMAOptionsBAAKeychainAccessGroupSymbolLoc_ptr = *(void *)(v134[1] + 24);
          long long v13 = (id *)v125[3];
        }
        uint64_t v86 = v12;
        _Block_object_dispose(&v124, 8);
        if (v13)
        {
          id v16 = *v13;
          v129[1] = v16;
          v130[1] = @"com.apple.mfiaccessory";
          uint64_t v124 = 0;
          v125 = &v124;
          uint64_t v126 = 0x2020000000;
          long long v17 = (id *)getkMAOptionsResuseExistingKeySymbolLoc_ptr;
          uint64_t v127 = getkMAOptionsResuseExistingKeySymbolLoc_ptr;
          if (!getkMAOptionsResuseExistingKeySymbolLoc_ptr)
          {
            *(void *)buf = MEMORY[0x263EF8330];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getkMAOptionsResuseExistingKeySymbolLoc_block_invoke;
            *(void *)&uint8_t buf[24] = &unk_264479720;
            v134 = &v124;
            long long v18 = (void *)DeviceIdentityLibrary();
            long long v19 = dlsym(v18, "kMAOptionsResuseExistingKey");
            *(void *)(v134[1] + 24) = v19;
            getkMAOptionsResuseExistingKeySymbolLoc_ptr = *(void *)(v134[1] + 24);
            long long v17 = (id *)v125[3];
          }
          uint64_t v85 = v16;
          _Block_object_dispose(&v124, 8);
          if (v17)
          {
            id v20 = *v17;
            uint64_t v21 = MEMORY[0x263EFFA88];
            id v84 = v20;
            v129[2] = v20;
            if (a2) {
              uint64_t v22 = MEMORY[0x263EFFA80];
            }
            else {
              uint64_t v22 = MEMORY[0x263EFFA88];
            }
            v130[2] = v22;
            uint64_t v124 = 0;
            v125 = &v124;
            uint64_t v126 = 0x2020000000;
            uint64_t v23 = (id *)getkMAOptionsBAAAccessControlsSymbolLoc_ptr;
            uint64_t v127 = getkMAOptionsBAAAccessControlsSymbolLoc_ptr;
            if (!getkMAOptionsBAAAccessControlsSymbolLoc_ptr)
            {
              *(void *)buf = MEMORY[0x263EF8330];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __getkMAOptionsBAAAccessControlsSymbolLoc_block_invoke;
              *(void *)&uint8_t buf[24] = &unk_264479720;
              v134 = &v124;
              uint64_t v24 = (void *)DeviceIdentityLibrary();
              uint64_t v25 = dlsym(v24, "kMAOptionsBAAAccessControls");
              *(void *)(v134[1] + 24) = v25;
              getkMAOptionsBAAAccessControlsSymbolLoc_ptr = *(void *)(v134[1] + 24);
              uint64_t v23 = (id *)v125[3];
            }
            _Block_object_dispose(&v124, 8);
            if (v23)
            {
              id v83 = *v23;
              v129[3] = v83;
              v130[3] = v6;
              uint64_t v124 = 0;
              v125 = &v124;
              uint64_t v126 = 0x2020000000;
              BOOL v26 = (id *)getkMAOptionsBAASkipNetworkRequestSymbolLoc_ptr;
              uint64_t v127 = getkMAOptionsBAASkipNetworkRequestSymbolLoc_ptr;
              if (!getkMAOptionsBAASkipNetworkRequestSymbolLoc_ptr)
              {
                *(void *)buf = MEMORY[0x263EF8330];
                *(void *)&buf[8] = 3221225472;
                *(void *)&buf[16] = __getkMAOptionsBAASkipNetworkRequestSymbolLoc_block_invoke;
                *(void *)&uint8_t buf[24] = &unk_264479720;
                v134 = &v124;
                uint64_t v27 = (void *)DeviceIdentityLibrary();
                uint64_t v28 = dlsym(v27, "kMAOptionsBAASkipNetworkRequest");
                *(void *)(v134[1] + 24) = v28;
                getkMAOptionsBAASkipNetworkRequestSymbolLoc_ptr = *(void *)(v134[1] + 24);
                BOOL v26 = (id *)v125[3];
              }
              _Block_object_dispose(&v124, 8);
              if (v26)
              {
                id v82 = *v26;
                v129[4] = v82;
                v130[4] = v22;
                uint64_t v124 = 0;
                v125 = &v124;
                uint64_t v126 = 0x2020000000;
                uint64_t v29 = (id *)getkMAOptionsBAASCRTAttestationSymbolLoc_ptr;
                uint64_t v127 = getkMAOptionsBAASCRTAttestationSymbolLoc_ptr;
                if (!getkMAOptionsBAASCRTAttestationSymbolLoc_ptr)
                {
                  *(void *)buf = MEMORY[0x263EF8330];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&buf[16] = __getkMAOptionsBAASCRTAttestationSymbolLoc_block_invoke;
                  *(void *)&uint8_t buf[24] = &unk_264479720;
                  v134 = &v124;
                  uint64_t v30 = (void *)DeviceIdentityLibrary();
                  uint64_t v31 = dlsym(v30, "kMAOptionsBAASCRTAttestation");
                  *(void *)(v134[1] + 24) = v31;
                  getkMAOptionsBAASCRTAttestationSymbolLoc_ptr = *(void *)(v134[1] + 24);
                  uint64_t v29 = (id *)v125[3];
                }
                _Block_object_dispose(&v124, 8);
                if (v29)
                {
                  id v32 = *v29;
                  v129[5] = v32;
                  v130[5] = v21;
                  uint64_t v124 = 0;
                  v125 = &v124;
                  uint64_t v126 = 0x2020000000;
                  uint64_t v33 = (id *)getkMAOptionsBAAValiditySymbolLoc_ptr;
                  uint64_t v127 = getkMAOptionsBAAValiditySymbolLoc_ptr;
                  if (!getkMAOptionsBAAValiditySymbolLoc_ptr)
                  {
                    *(void *)buf = MEMORY[0x263EF8330];
                    *(void *)&buf[8] = 3221225472;
                    *(void *)&buf[16] = __getkMAOptionsBAAValiditySymbolLoc_block_invoke;
                    *(void *)&uint8_t buf[24] = &unk_264479720;
                    v134 = &v124;
                    BOOL v34 = (void *)DeviceIdentityLibrary();
                    uint64_t v35 = dlsym(v34, "kMAOptionsBAAValidity");
                    *(void *)(v134[1] + 24) = v35;
                    getkMAOptionsBAAValiditySymbolLoc_ptr = *(void *)(v134[1] + 24);
                    uint64_t v33 = (id *)v125[3];
                  }
                  uint64_t v81 = v32;
                  _Block_object_dispose(&v124, 8);
                  if (v33)
                  {
                    id v36 = *v33;
                    v129[6] = v36;
                    v130[6] = &unk_26CE91E48;
                    uint64_t v124 = 0;
                    v125 = &v124;
                    uint64_t v126 = 0x2020000000;
                    uint64_t v37 = (id *)getkMAOptionsBAACertTypeSymbolLoc_ptr;
                    uint64_t v127 = getkMAOptionsBAACertTypeSymbolLoc_ptr;
                    if (!getkMAOptionsBAACertTypeSymbolLoc_ptr)
                    {
                      *(void *)buf = MEMORY[0x263EF8330];
                      *(void *)&buf[8] = 3221225472;
                      *(void *)&buf[16] = __getkMAOptionsBAACertTypeSymbolLoc_block_invoke;
                      *(void *)&uint8_t buf[24] = &unk_264479720;
                      v134 = &v124;
                      uint64_t v38 = (void *)DeviceIdentityLibrary();
                      uint64_t v39 = dlsym(v38, "kMAOptionsBAACertType");
                      *(void *)(v134[1] + 24) = v39;
                      getkMAOptionsBAACertTypeSymbolLoc_ptr = *(void *)(v134[1] + 24);
                      uint64_t v37 = (id *)v125[3];
                    }
                    _Block_object_dispose(&v124, 8);
                    if (v37)
                    {
                      id v40 = *v37;
                      v129[7] = v40;
                      uint64_t v41 = NSNumber;
                      uint64_t v124 = 0;
                      v125 = &v124;
                      uint64_t v126 = 0x2020000000;
                      BOOL v42 = (unsigned int *)getkMAOptionsBAACertTypeMFiSymbolLoc_ptr;
                      uint64_t v127 = getkMAOptionsBAACertTypeMFiSymbolLoc_ptr;
                      if (!getkMAOptionsBAACertTypeMFiSymbolLoc_ptr)
                      {
                        *(void *)buf = MEMORY[0x263EF8330];
                        *(void *)&buf[8] = 3221225472;
                        *(void *)&buf[16] = __getkMAOptionsBAACertTypeMFiSymbolLoc_block_invoke;
                        *(void *)&uint8_t buf[24] = &unk_264479720;
                        v134 = &v124;
                        uint64_t v43 = (void *)DeviceIdentityLibrary();
                        uint64_t v44 = dlsym(v43, "kMAOptionsBAACertTypeMFi");
                        *(void *)(v134[1] + 24) = v44;
                        getkMAOptionsBAACertTypeMFiSymbolLoc_ptr = *(void *)(v134[1] + 24);
                        BOOL v42 = (unsigned int *)v125[3];
                      }
                      _Block_object_dispose(&v124, 8);
                      if (v42)
                      {
                        uint64_t v45 = [v41 numberWithUnsignedInt:*v42];
                        v130[7] = v45;
                        uint64_t v124 = 0;
                        v125 = &v124;
                        uint64_t v126 = 0x2020000000;
                        uint64_t v46 = (id *)getkMAOptionsBAAMFiPropertiesSymbolLoc_ptr;
                        uint64_t v127 = getkMAOptionsBAAMFiPropertiesSymbolLoc_ptr;
                        if (!getkMAOptionsBAAMFiPropertiesSymbolLoc_ptr)
                        {
                          *(void *)buf = MEMORY[0x263EF8330];
                          *(void *)&buf[8] = 3221225472;
                          *(void *)&buf[16] = __getkMAOptionsBAAMFiPropertiesSymbolLoc_block_invoke;
                          *(void *)&uint8_t buf[24] = &unk_264479720;
                          v134 = &v124;
                          uint64_t v47 = (void *)DeviceIdentityLibrary();
                          uint64_t v48 = dlsym(v47, "kMAOptionsBAAMFiProperties");
                          *(void *)(v134[1] + 24) = v48;
                          getkMAOptionsBAAMFiPropertiesSymbolLoc_ptr = *(void *)(v134[1] + 24);
                          uint64_t v46 = (id *)v125[3];
                        }
                        _Block_object_dispose(&v124, 8);
                        if (v46)
                        {
                          id v49 = *v46;
                          v129[8] = v49;
                          v130[8] = v93;
                          uint64_t v124 = 0;
                          v125 = &v124;
                          uint64_t v126 = 0x2020000000;
                          BOOL v50 = (id *)getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr;
                          uint64_t v127 = getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr;
                          if (!getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr)
                          {
                            *(void *)buf = MEMORY[0x263EF8330];
                            *(void *)&buf[8] = 3221225472;
                            *(void *)&buf[16] = __getkMAOptionsBAAOIDSToIncludeSymbolLoc_block_invoke;
                            *(void *)&uint8_t buf[24] = &unk_264479720;
                            v134 = &v124;
                            uint64_t v51 = (void *)DeviceIdentityLibrary();
                            uint64_t v52 = dlsym(v51, "kMAOptionsBAAOIDSToInclude");
                            *(void *)(v134[1] + 24) = v52;
                            getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr = *(void *)(v134[1] + 24);
                            BOOL v50 = (id *)v125[3];
                          }
                          _Block_object_dispose(&v124, 8);
                          if (v50)
                          {
                            id v53 = *v50;
                            v129[9] = v53;
                            uint64_t v124 = 0;
                            v125 = &v124;
                            uint64_t v126 = 0x2020000000;
                            uint64_t v54 = (id *)getkMAOptionsBAAOIDMFiAccessoryPropertiesSymbolLoc_ptr;
                            uint64_t v127 = getkMAOptionsBAAOIDMFiAccessoryPropertiesSymbolLoc_ptr;
                            if (!getkMAOptionsBAAOIDMFiAccessoryPropertiesSymbolLoc_ptr)
                            {
                              *(void *)buf = MEMORY[0x263EF8330];
                              *(void *)&buf[8] = 3221225472;
                              *(void *)&buf[16] = __getkMAOptionsBAAOIDMFiAccessoryPropertiesSymbolLoc_block_invoke;
                              *(void *)&uint8_t buf[24] = &unk_264479720;
                              v134 = &v124;
                              uint64_t v55 = (void *)DeviceIdentityLibrary();
                              uint64_t v56 = dlsym(v55, "kMAOptionsBAAOIDMFiAccessoryProperties");
                              *(void *)(v134[1] + 24) = v56;
                              getkMAOptionsBAAOIDMFiAccessoryPropertiesSymbolLoc_ptr = *(void *)(v134[1] + 24);
                              uint64_t v54 = (id *)v125[3];
                            }
                            _Block_object_dispose(&v124, 8);
                            if (v54)
                            {
                              id v57 = *v54;
                              id v128 = v57;
                              uint64_t v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v128 count:1];
                              v130[9] = v58;
                              uint64_t v59 = [NSDictionary dictionaryWithObjects:v130 forKeys:v129 count:10];
                              BOOL v60 = [v87 dictionaryWithDictionary:v59];

                              CFRelease(v6);
                              if (!a2)
                              {
LABEL_50:
                                CFRetain(a1);
                                uint64_t v65 = [MEMORY[0x263EFF910] date];
                                if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_DWORD *)buf = 136315650;
                                  *(void *)&uint8_t buf[4] = "MFAADeviceIdentityRequestCertificate";
                                  *(_WORD *)&buf[12] = 2112;
                                  *(void *)&buf[14] = a1;
                                  *(_WORD *)&buf[22] = 2112;
                                  *(void *)&uint8_t buf[24] = v60;
                                  _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: %@, options %@\n\n", buf, 0x20u);
                                }
                                v94[0] = MEMORY[0x263EF8330];
                                v94[1] = 3221225472;
                                v94[2] = __MFAADeviceIdentityRequestCertificate_block_invoke;
                                v94[3] = &unk_2644796E0;
                                uint64_t v97 = &v112;
                                v98 = &v108;
                                v99 = &v118;
                                id v66 = v65;
                                char v102 = a2;
                                id v95 = v66;
                                BOOL v100 = &v104;
                                uint64_t v101 = a1;
                                uint64_t v67 = v92;
                                uint64_t v96 = v67;
                                id v68 = v60;
                                int v69 = v94;
                                BOOL v70 = (void (*)(void, id, void *))getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc();
                                if (v70)
                                {
                                  v70(0, v68, v69);

                                  dispatch_semaphore_wait(v67, 0xFFFFFFFFFFFFFFFFLL);
                                  if (*((unsigned char *)v105 + 24))
                                  {
                                    if (v113[5])
                                    {
                                      uint64_t v71 = MEMORY[0x263EF8438];
                                      id v72 = MEMORY[0x263EF8438];
                                      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                                      {
                                        id v73 = [(id)v113[5] description];
                                        MFAADeviceIdentityRequestCertificate_cold_4([v73 UTF8String], buf, v73);
                                      }
                                    }
                                    if (a3) {
                                      *a3 = (id)v119[5];
                                    }
                                    uint64_t v74 = 0;
                                    if (a4) {
                                      *a4 = v109[3];
                                    }
                                  }
                                  else
                                  {
                                    uint64_t v76 = MEMORY[0x263EF8438];
                                    id v77 = MEMORY[0x263EF8438];
                                    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                                    {
                                      id v78 = [(id)v113[5] description];
                                      MFAADeviceIdentityRequestCertificate_cold_3([v78 UTF8String], buf, v78);
                                    }

                                    v79 = (const void *)v109[3];
                                    if (v79)
                                    {
                                      CFRelease(v79);
                                      v109[3] = 0;
                                    }
                                    uint64_t v74 = 1;
                                  }

                                  goto LABEL_85;
                                }
                                dlerror();
                                abort_report_np();
LABEL_88:
                                __break(1u);
                              }
                              uint64_t v124 = 0;
                              v125 = &v124;
                              uint64_t v126 = 0x2020000000;
                              uint64_t v61 = (id *)getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr;
                              uint64_t v127 = getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr;
                              if (!getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr)
                              {
                                *(void *)buf = MEMORY[0x263EF8330];
                                *(void *)&buf[8] = 3221225472;
                                *(void *)&buf[16] = __getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_block_invoke;
                                *(void *)&uint8_t buf[24] = &unk_264479720;
                                v134 = &v124;
                                uint64_t v62 = (void *)DeviceIdentityLibrary();
                                uint64_t v63 = dlsym(v62, "kMAOptionsBAAIgnoreExistingKeychainItems");
                                *(void *)(v134[1] + 24) = v63;
                                getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr = *(void *)(v134[1] + 24);
                                uint64_t v61 = (id *)v125[3];
                              }
                              _Block_object_dispose(&v124, 8);
                              if (v61)
                              {
                                id v64 = *v61;
                                [v60 setValue:MEMORY[0x263EFFA88] forKey:v64];

                                goto LABEL_50;
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
      dlerror();
      abort_report_np();
      goto LABEL_88;
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      MFAADeviceIdentityRequestCertificate_cold_5(v7, (uint64_t *)&v103);
    }
    if (v103) {
      CFRelease(v103);
    }
    id v68 = 0;
    uint64_t v74 = 14;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      MFAADeviceIdentityRequestCertificate_cold_2((uint64_t *)&v103);
    }
    if (v103) {
      CFRelease(v103);
    }
    id v68 = 0;
    uint64_t v74 = 12;
  }
LABEL_85:
  _Block_object_dispose(&v104, 8);
  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v112, 8);

  _Block_object_dispose(&v118, 8);
  return v74;
}

void sub_21DC6A810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __MFAADeviceIdentityRequestCertificate_block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObjectsFromArray:v7];
  uint64_t v23 = [MEMORY[0x263EFF910] date];
  [v23 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v10 = v9;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 80);
    *(_DWORD *)buf = 136316162;
    BOOL v26 = "MFAADeviceIdentityRequestCertificate_block_invoke";
    __int16 v27 = 1024;
    *(_DWORD *)uint64_t v28 = 132;
    *(_WORD *)&v28[4] = 2112;
    *(void *)&v28[6] = v11;
    *(_WORD *)&v28[14] = 2048;
    *(double *)&v28[16] = v10;
    __int16 v29 = 2112;
    uint64_t v30 = (uint64_t)v8;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s:%d %@, got IssueClientCertificate response in %f seconds. error %@", buf, 0x30u);
  }
  uint64_t v24 = v8;
  if (v10 > 0.05 && *(unsigned char *)(a1 + 88) && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT))
  {
    __MFAADeviceIdentityRequestCertificate_block_invoke_cold_1(a1, v10);
    if (!v7) {
      goto LABEL_17;
    }
  }
  else if (!v7)
  {
    goto LABEL_17;
  }
  if ([v7 count] == 2 && objc_msgSend(v7, "count"))
  {
    unint64_t v12 = 0;
    long long v13 = MEMORY[0x263EF8438];
    do
    {
      long long v14 = [v7 objectAtIndexedSubscript:v12];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        long long v15 = [v7 objectAtIndexedSubscript:v12];
        id v16 = [v15 description];
        uint64_t v17 = [v16 UTF8String];
        *(_DWORD *)buf = 136315650;
        BOOL v26 = "MFAADeviceIdentityRequestCertificate_block_invoke";
        __int16 v27 = 2048;
        *(void *)uint64_t v28 = v12;
        *(_WORD *)&v28[8] = 2080;
        *(void *)&v28[10] = v17;
        _os_log_impl(&dword_21DC52000, v13, OS_LOG_TYPE_DEFAULT, "%s[%lu]: desc: %s\n\n", buf, 0x20u);
      }
      CFDataRef v18 = SecCertificateCopyData((SecCertificateRef)v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [(__CFData *)v18 length];
        int v20 = [(__CFData *)v18 length];
        uint64_t v21 = [(__CFData *)v18 bytes];
        *(_DWORD *)buf = 136316162;
        BOOL v26 = "MFAADeviceIdentityRequestCertificate_block_invoke";
        __int16 v27 = 2048;
        *(void *)uint64_t v28 = v12;
        *(_WORD *)&v28[8] = 2048;
        *(void *)&v28[10] = v19;
        *(_WORD *)&v28[18] = 1040;
        *(_DWORD *)&v28[20] = v20;
        __int16 v29 = 2096;
        uint64_t v30 = v21;
        _os_log_impl(&dword_21DC52000, v13, OS_LOG_TYPE_DEFAULT, "%s[%lu]: data: (%zu bytes)\n%{coreacc:bytes}.*P", buf, 0x30u);
      }
      if (v12 == [v7 count] - 1) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      }

      ++v12;
    }
    while (v12 < [v7 count]);
  }
LABEL_17:
  uint64_t v22 = *(const void **)(a1 + 80);
  if (v22) {
    CFRelease(v22);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t DeviceIdentityLibraryCore()
{
  if (!DeviceIdentityLibraryCore_frameworkLibrary) {
    DeviceIdentityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return DeviceIdentityLibraryCore_frameworkLibrary;
}

uint64_t getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr;
  uint64_t v6 = getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr;
  if (!getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr)
  {
    CFDataRef v1 = (void *)DeviceIdentityLibrary();
    v4[3] = (uint64_t)dlsym(v1, "DeviceIdentityIssueClientCertificateWithCompletion");
    getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21DC6AE08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __DeviceIdentityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DeviceIdentityLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "DeviceIdentityIssueClientCertificateWithCompletion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

uint64_t DeviceIdentityLibrary()
{
  uint64_t v0 = DeviceIdentityLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getkMAOptionsBAAKeychainLabelSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAAKeychainLabel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAAKeychainLabelSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAAKeychainAccessGroupSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAAKeychainAccessGroup");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAAKeychainAccessGroupSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsResuseExistingKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsResuseExistingKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsResuseExistingKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAAAccessControlsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAAAccessControls");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAAAccessControlsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAASkipNetworkRequestSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAASkipNetworkRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAASkipNetworkRequestSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAASCRTAttestationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAASCRTAttestation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAASCRTAttestationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAAValiditySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAAValidity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAAValiditySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAACertTypeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAACertType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAACertTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAACertTypeMFiSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAACertTypeMFi");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAACertTypeMFiSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAAMFiPropertiesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAAMFiProperties");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAAMFiPropertiesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAAOIDSToIncludeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAAOIDSToInclude");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAAOIDMFiAccessoryPropertiesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAAOIDMFiAccessoryProperties");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAAOIDMFiAccessoryPropertiesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceIdentityLibrary();
  uint64_t result = dlsym(v2, "kMAOptionsBAAIgnoreExistingKeychainItems");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t createCertificateRefWithData(void *a1, int a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    int v13 = 134218240;
    uint64_t v14 = [v3 length];
    __int16 v15 = 1024;
    int v16 = a2;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "_createCertificateRefWithData (certData.length: %lu, optimize: %{coreacc:CertificateType_t}d)", (uint8_t *)&v13, 0x12u);
  }
  if (!v3)
  {
    uint64_t v7 = 0;
    int v8 = 0;
    goto LABEL_16;
  }
  if (a2 != 2)
  {
    id v9 = v3;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = SecCertificateCreateWithBytes();
    if (v10)
    {
      uint64_t v7 = v10;
      int v8 = 1;
      goto LABEL_16;
    }
    uint64_t v11 = (void *)SecCMSCertificatesOnlyMessageCopyCertificates();
    uint64_t v5 = v11;
    if (!v11 || ![v11 count])
    {
      uint64_t v7 = 0;
      int v8 = 0;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  id v4 = (void *)SecCMSCertificatesOnlyMessageCopyCertificates();
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
LABEL_13:
    uint64_t v7 = [v5 objectAtIndexedSubscript:0];
    int v8 = 2;
    goto LABEL_15;
  }
  id v6 = v3;
  [v6 bytes];
  [v6 length];
  uint64_t v7 = SecCertificateCreateWithBytes();
  int v8 = v7 != 0;
LABEL_15:

LABEL_16:
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    int v13 = 67109120;
    LODWORD(v14) = v8;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "certType: %{coreacc:CertificateType_t}d", (uint8_t *)&v13, 8u);
  }

  return v7;
}

uint64_t createCertificateRefWithBytes(uint64_t a1, uint64_t a2, int a3)
{
  if (!a1 || !a2) {
    return 0;
  }
  id v4 = [MEMORY[0x263EFF8F8] dataWithBytes:a1 length:a2];
  uint64_t CertificateRefWithData = createCertificateRefWithData(v4, a3);

  return CertificateRefWithData;
}

char *MFAACreateSignatureContext(int a1)
{
  uint64_t v2 = (char *)malloc_type_malloc(0x64uLL, 0x100004093FC706DuLL);
  id v3 = v2;
  if (v2)
  {
    *(_DWORD *)uint64_t v2 = a1;
    CC_SHA1_Init((CC_SHA1_CTX *)(v2 + 4));
  }
  return v3;
}

BOOL MFAAUpdateDataSignature(uint64_t a1, CFDataRef theData)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a1)
  {
    BytePtr = CFDataGetBytePtr(theData);
    unint64_t Length = CFDataGetLength(theData);
    if (HIDWORD(Length) && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      int v7 = 134217984;
      unint64_t v8 = Length;
      _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Losing integer precision on dataSignLen 0x%08lX\n", (uint8_t *)&v7, 0xCu);
    }
    CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 4), BytePtr, Length);
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    MFAAUpdateDataSignature_cold_1();
  }
  return a1 != 0;
}

uint64_t MFAAFinalizeDataSignature(int *a1, void **a2, size_t *a3)
{
  uint64_t ConnectionToAuthDaemon = 0;
  if (a1 && a2 && a3)
  {
    int v7 = *a1;
    if (*a1 == 1)
    {
      uint64_t ConnectionToAuthDaemon = GetConnectionToAuthDaemon();
      if (ConnectionToAuthDaemon)
      {
        xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v8, "requestType", "finalTagging");
        xpc_dictionary_set_data(v8, "signingContext", a1 + 1, 0x60uLL);
        xpc_object_t v15 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)ConnectionToAuthDaemon, v8);
        if (v15)
        {
          uint64_t v10 = v15;
          size_t length = 0;
          if (xpc_dictionary_get_BOOL(v15, "isValid"))
          {
            data = xpc_dictionary_get_data(v10, "signedTagData", &length);
            unint64_t v12 = *a2;
            if (!*a2)
            {
              size_t v13 = length;
              malloc_type_id_t v14 = 3864207848;
LABEL_28:
              unint64_t v12 = malloc_type_malloc(v13, v14);
              *a2 = v12;
              size_t v16 = length;
              *a3 = length;
              if (v12)
              {
LABEL_29:
                memcpy(v12, data, v16);
                *a3 = length;
                uint64_t ConnectionToAuthDaemon = 1;
                goto LABEL_30;
              }
LABEL_26:
              uint64_t ConnectionToAuthDaemon = 0;
LABEL_30:
              xpc_release(v10);
              goto LABEL_31;
            }
LABEL_15:
            size_t v16 = length;
            if (*a3 >= length) {
              goto LABEL_29;
            }
            goto LABEL_26;
          }
          if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO)) {
            goto LABEL_26;
          }
          *(_WORD *)uint64_t v19 = 0;
          uint64_t v17 = MEMORY[0x263EF8438];
LABEL_25:
          _os_log_impl(&dword_21DC52000, v17, OS_LOG_TYPE_INFO, "isValid from authd is false!", v19, 2u);
          goto LABEL_26;
        }
LABEL_20:
        uint64_t ConnectionToAuthDaemon = 0;
LABEL_31:
        xpc_release(v8);
      }
    }
    else if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        MFAAFinalizeDataSignature_cold_1(v7);
      }
      return 0;
    }
    else
    {
      uint64_t ConnectionToAuthDaemon = GetConnectionToAuthDaemon();
      if (ConnectionToAuthDaemon)
      {
        xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v8, "requestType", "finalSports");
        xpc_dictionary_set_data(v8, "signingContext", a1 + 1, 0x60uLL);
        xpc_object_t v9 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)ConnectionToAuthDaemon, v8);
        if (v9)
        {
          uint64_t v10 = v9;
          size_t length = 0;
          if (xpc_dictionary_get_BOOL(v9, "isValid"))
          {
            data = xpc_dictionary_get_data(v10, "signedSportsData", &length);
            unint64_t v12 = *a2;
            if (!*a2)
            {
              size_t v13 = length;
              malloc_type_id_t v14 = 1734000561;
              goto LABEL_28;
            }
            goto LABEL_15;
          }
          if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO)) {
            goto LABEL_26;
          }
          *(_WORD *)uint64_t v19 = 0;
          uint64_t v17 = MEMORY[0x263EF8438];
          goto LABEL_25;
        }
        goto LABEL_20;
      }
    }
  }
  return ConnectionToAuthDaemon;
}

void MFAADeallocSignatureContext(void *a1)
{
  if (a1) {
    free(a1);
  }
}

uint64_t GetConnectionToAuthDaemon()
{
  if (!gAuthdXPCConnection)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.authd.xpc", 0, 0);
    gAuthdXPCConnection = (uint64_t)mach_service;
    if (mach_service)
    {
      xpc_connection_set_event_handler(mach_service, &__block_literal_global_2);
      xpc_connection_resume((xpc_connection_t)gAuthdXPCConnection);
    }
    else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      GetConnectionToAuthDaemon_cold_1();
    }
  }
  return gAuthdXPCConnection;
}

void __GetConnectionToAuthDaemon_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = MEMORY[0x223C178F0](a2);
  uint64_t v4 = MEMORY[0x263EF8720];
  if (v3 == MEMORY[0x263EF8720])
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __GetConnectionToAuthDaemon_block_invoke_cold_1(a2);
    }
  }
  else if (MEMORY[0x223C178F0](a2) == v4)
  {
    if ((a2 == (void *)MEMORY[0x263EF86A8] || a2 == (void *)MEMORY[0x263EF86A0]) && gAuthdXPCConnection != 0)
    {
      xpc_connection_cancel((xpc_connection_t)gAuthdXPCConnection);
      xpc_release((xpc_object_t)gAuthdXPCConnection);
      gAuthdXPCConnection = 0;
    }
  }
  else if (a2)
  {
    size_t length = 0;
    unsigned __int16 data = (unsigned __int16)xpc_dictionary_get_data(a2, "certData", &length);
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v10 = data;
      _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "data from authd pData:%04lX", buf, 0xCu);
    }
  }
}

uint64_t acc_userDefaults_BOOLForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyStringForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyArrayForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyDictionaryForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyIntegerForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaults_copyDoubleForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

void acc_userDefaults_setArrayForKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setObject:a2 forKey:a1];
}

void acc_userDefaults_setIntegerForKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setInteger:a2 forKey:a1];
}

void acc_userDefaults_setDoubleForKey(uint64_t a1, double a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setDouble:a1 forKey:a2];
}

uint64_t acc_userDefaultsIapd_BOOLForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyStringForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyArrayForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyDictionaryForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyIntegerForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaultsIapd_copyDoubleForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

uint64_t acc_userDefaultsLogging_BOOLForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsLogging];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t MFAADeviceIdentityInitCertStates()
{
  if (__initMFAADeviceIdentity_onceToken != -1) {
    dispatch_once(&__initMFAADeviceIdentity_onceToken, &__block_literal_global_17);
  }
  dispatch_async((dispatch_queue_t)gSerialQueue, &__block_literal_global_4);
  return 0;
}

void __MFAADeviceIdentityInitCertStates_block_invoke()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  if ((_certsExist() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v0 = 136315138;
      CFDataRef v1 = "MFAADeviceIdentityInitCertStates_block_invoke";
      _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: no valid certs, schedule refresh", (uint8_t *)&v0, 0xCu);
    }
    _scheduleRefreshCertificates(@"mfi-baa");
  }
}

uint64_t _certsExist()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v0 = (gCertificateRefreshState != 0) & ~acc_userDefaults_BOOLForKey(@"PretendNoDeviceIdentityCerts");
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315394;
    uint64_t v3 = "_certsExist";
    __int16 v4 = 1024;
    int v5 = v0;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: deviceIdentityCertsExist %d", (uint8_t *)&v2, 0x12u);
  }
  return v0;
}

void _scheduleRefreshCertificates(uint64_t a1)
{
  uint64_t v2 = 0;
  int64_t v3 = 10000000000;
  do
  {
    dispatch_time_t v4 = dispatch_time(0, v3);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = ___scheduleRefreshCertificates_block_invoke;
    v5[3] = &__block_descriptor_tmp_14;
    int v6 = v2;
    v5[4] = a1;
    dispatch_after(v4, (dispatch_queue_t)gSerialQueue, v5);
    v3 += 10000000000;
    ++v2;
  }
  while (v2 != 4);
}

uint64_t MFAADeviceIdentityCertsExist()
{
  uint64_t v3 = 0;
  dispatch_time_t v4 = &v3;
  uint64_t v5 = 0x2000000000;
  char v6 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __MFAADeviceIdentityCertsExist_block_invoke;
  block[3] = &unk_264479CC8;
  block[4] = &v3;
  dispatch_sync((dispatch_queue_t)gSerialQueue, block);
  uint64_t v0 = *((unsigned __int8 *)v4 + 24);
  _Block_object_dispose(&v3, 8);
  return v0;
}

uint64_t __MFAADeviceIdentityCertsExist_block_invoke(uint64_t a1)
{
  uint64_t result = _certsExist();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFDataRef MFAACreateDeviceDataCertificate(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  lLcAnSGNpbJv(*MEMORY[0x263EFFB08], 318767107 - a1);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  CFDataRef v3 = SecCertificateCopyData(v1);
  CFRelease(v2);
  return v3;
}

CFDataRef MFAACreateDeviceNonceSignature(const __CFData *a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = fukQllQ9ln(*MEMORY[0x263EFFB08], 318767105);
    if (v2)
    {
      CFDataRef v3 = (__SecKey *)v2;
      BytePtr = CFDataGetBytePtr(a1);
      size_t Length = CFDataGetLength(a1);
      uint64_t v6 = Length;
      if (BytePtr && Length)
      {
        size_t sigLen = 256;
        *(_OWORD *)sig = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        OSStatus v7 = SecKeyRawSign(v3, 0x8002u, BytePtr, Length, sig, &sigLen);
        size_t v8 = sigLen;
        if (v7) {
          BOOL v9 = 1;
        }
        else {
          BOOL v9 = sigLen == 0;
        }
        if (!v9)
        {
          CFDataRef v27 = CFDataCreate(0, sig, sigLen);
LABEL_20:
          CFRelease(v3);
          return v27;
        }
        int v10 = v7;
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          MFAACreateDeviceNonceSignature_cold_3(v10, v8);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        MFAACreateDeviceNonceSignature_cold_4((unsigned __int16)BytePtr, v6);
      }
      CFDataRef v27 = 0;
      goto LABEL_20;
    }
    BOOL v19 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v19) {
      MFAACreateDeviceNonceSignature_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  else
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v11) {
      MFAACreateDeviceNonceSignature_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  return 0;
}

uint64_t MFAADeviceIdentityCopyCertificate(__CFString *a1, uint64_t a2, int a3, CFTypeRef *a4, CFTypeRef *a5)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v18 = 0;
  BOOL v19 = &v18;
  uint64_t v20 = 0x2000000000;
  char v21 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2000000000;
  char v17 = 1;
  if (!a1 || (BOOL v9 = a1, !CFEqual(a1, @"mfi-baa"))) {
    BOOL v9 = @"mfi-baa";
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v23 = "MFAADeviceIdentityCopyCertificate";
    __int16 v24 = 2112;
    uint64_t v25 = v9;
    __int16 v26 = 1024;
    int v27 = a3;
    __int16 v28 = 2112;
    uint64_t v29 = a2;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: label %@, requestNew %d, refreshPolicy %@\n", buf, 0x26u);
  }
  if (a2 && a5 && a4)
  {
    if (__initMFAADeviceIdentity_onceToken != -1) {
      dispatch_once(&__initMFAADeviceIdentity_onceToken, &__block_literal_global_17);
    }
    *a4 = 0;
    *a5 = 0;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 0x40000000;
    v15[2] = __MFAADeviceIdentityCopyCertificate_block_invoke;
    v15[3] = &unk_264479CF0;
    v15[6] = a2;
    v15[7] = v9;
    v15[4] = v16;
    v15[5] = &v18;
    v15[8] = a4;
    v15[9] = a5;
    dispatch_sync((dispatch_queue_t)gSerialQueue, v15);
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "MFAADeviceIdentityCopyCertificate";
      __int16 v24 = 2112;
      uint64_t v25 = v9;
      _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: _scheduleRefreshCertificates %@", buf, 0x16u);
    }
    _scheduleRefreshCertificates((uint64_t)v9);
  }
  if (a4 && a5 && !*((unsigned char *)v19 + 24))
  {
    if (*a4)
    {
      CFRelease(*a4);
      *a4 = 0;
    }
    if (*a5)
    {
      CFRelease(*a5);
      *a5 = 0;
    }
  }
  BOOL v10 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT);
  BOOL v11 = v19;
  if (v10)
  {
    int v12 = *((unsigned __int8 *)v19 + 24);
    *(_DWORD *)buf = 136315394;
    uint64_t v23 = "MFAADeviceIdentityCopyCertificate";
    __int16 v24 = 1024;
    LODWORD(v25) = v12;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: success:%d\n", buf, 0x12u);
    BOOL v11 = v19;
  }
  uint64_t v13 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);
  return v13;
}

void __MFAADeviceIdentityCopyCertificate_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (gCertificateRefreshPolicy) {
    CFRelease((CFTypeRef)gCertificateRefreshPolicy);
  }
  gCertificateRefreshPolicy = (uint64_t)CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 2, *(CFDictionaryRef *)(a1 + 48));
  uint64_t valuePtr = 4;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), @"Count");
  CFTypeID TypeID = CFNumberGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) == TypeID)
    {
      CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
      uint64_t v4 = valuePtr;
      if (valuePtr != 4 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __MFAADeviceIdentityCopyCertificate_block_invoke_cold_2(v4);
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "MFAADeviceIdentityCopyCertificate_block_invoke";
    __int16 v17 = 2048;
    *(void *)uint64_t v18 = valuePtr;
    *(_WORD *)&v18[8] = 2112;
    uint64_t v19 = gCertificateRefreshPolicy;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: count %lld, gCertificateRefreshPolicy %@\n", buf, 0x20u);
  }
  CFNumberRef v5 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)gCertificateRefreshPolicy, @"RefreshInterval");
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CFNumberGetTypeID())
    {
      double v13 = 0.0;
      CFNumberGetValue(v6, kCFNumberDoubleType, &v13);
      double v8 = v13;
      if (v13 != 0.0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v16 = "MFAADeviceIdentityCopyCertificate_block_invoke";
        __int16 v17 = 2048;
        *(double *)uint64_t v18 = v8;
        _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: interval:%f\n", buf, 0x16u);
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "MFAADeviceIdentityCopyCertificate_block_invoke";
    __int16 v17 = 2112;
    *(void *)uint64_t v18 = v9;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: call _storeRefreshStateToDisk label %@", buf, 0x16u);
  }
  _storeRefreshStateToDisk();
  uint64_t v10 = 0;
  while (!*((unsigned char *)&gCertificateRefreshState + v10))
  {
    if (++v10 == 4) {
      goto LABEL_22;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
LABEL_22:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    _fetchAllCertificates(*(const __CFString **)(a1 + 56));
  }
  int ValidIndex = _findValidIndex();
  gCertificateIndex = ValidIndex;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "MFAADeviceIdentityCopyCertificate_block_invoke";
    __int16 v17 = 1024;
    *(_DWORD *)uint64_t v18 = ValidIndex;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: request cert: %d\n", buf, 0x12u);
    int ValidIndex = gCertificateIndex;
  }
  CFTypeRef v12 = 0;
  double v13 = 0.0;
  if (_copyCertificateForIndex(*(const __CFString **)(a1 + 56), ValidIndex, 0, 0, (CFTypeRef *)&v13, &v12))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __MFAADeviceIdentityCopyCertificate_block_invoke_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = "MFAADeviceIdentityCopyCertificate_block_invoke";
      __int16 v17 = 1024;
      *(_DWORD *)uint64_t v18 = *(void *)&v13 != 0;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = v12 != 0;
      _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: cert:%d, key:%d", buf, 0x18u);
    }
    **(double **)(a1 + 64) = v13;
    **(void **)(a1 + 72) = v12;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

BOOL _storeRefreshStateToDisk()
{
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _storeRefreshStateToDisk\n", v14, 2u);
  }
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 4, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    for (CFIndex i = 0; i != 4; ++i)
    {
      CFNumberRef v3 = CFNumberCreate(v0, kCFNumberSInt8Type, (char *)&gCertificateRefreshState + i);
      if (v3)
      {
        CFNumberRef v4 = v3;
        CFArraySetValueAtIndex(Mutable, i, v3);
        CFRelease(v4);
      }
    }
    acc_userDefaults_setArrayForKey(@"IdentityCertRefreshState", (uint64_t)Mutable);
    CFRelease(Mutable);
  }
  else
  {
    BOOL v6 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v6) {
      _storeRefreshStateToDisk_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return Mutable != 0;
}

uint64_t _fetchAllCertificates(const __CFString *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "_fetchAllCertificates";
    __int16 v12 = 2112;
    *(void *)uint64_t v13 = a1;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: %@, ENTER", buf, 0x16u);
  }
  uint64_t v2 = 0;
  char v3 = 0;
  CFNumberRef v4 = MEMORY[0x263EF8438];
  do
  {
    CFTypeRef v8 = 0;
    CFTypeRef cf = 0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v11 = "_fetchAllCertificates";
      __int16 v12 = 1024;
      *(_DWORD *)uint64_t v13 = v2;
      *(_WORD *)&v13[4] = 2112;
      *(void *)&v13[6] = a1;
      _os_log_impl(&dword_21DC52000, v4, OS_LOG_TYPE_DEFAULT, "%s: i %d, call _copyCertificateForIndex %@", buf, 0x1Cu);
    }
    int v5 = _copyCertificateForIndex(a1, v2, 1, 0, &cf, &v8);
    if (v5)
    {
      int v6 = v5;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v11 = "_fetchAllCertificates";
        __int16 v12 = 1024;
        *(_DWORD *)uint64_t v13 = v6;
        _os_log_error_impl(&dword_21DC52000, v4, OS_LOG_TYPE_ERROR, "%s: _copyCertificateForIndex: error %d\n", buf, 0x12u);
      }
      *((unsigned char *)&gCertificateRefreshState + v2) = 0;
      char v3 = 1;
    }
    else if (!*((unsigned char *)&gCertificateRefreshState + v2))
    {
      char v3 = 1;
      *((unsigned char *)&gCertificateRefreshState + v2) = 1;
    }
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    if (v8) {
      CFRelease(v8);
    }
    ++v2;
  }
  while (v2 != 4);
  if (v3) {
    _storeRefreshStateToDisk();
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v11 = "_fetchAllCertificates";
    __int16 v12 = 1024;
    *(_DWORD *)uint64_t v13 = 584;
    *(_WORD *)&v13[4] = 2112;
    *(void *)&v13[6] = a1;
    __int16 v14 = 1024;
    int v15 = 1;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s:%d %@, EXIT success %d", buf, 0x22u);
  }
  return 1;
}

uint64_t _findValidIndex()
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v0 = gCertificateIndex;
  double valuePtr = NAN;
  if (gCertificateRefreshPolicy)
  {
    CFTypeID v1 = CFGetTypeID((CFTypeRef)gCertificateRefreshPolicy);
    if (v1 == CFDictionaryGetTypeID())
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)gCertificateRefreshPolicy, @"RefreshInterval");
      if (Value)
      {
        CFNumberRef v3 = Value;
        CFTypeID v4 = CFGetTypeID(Value);
        if (v4 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v3, kCFNumberDoubleType, &valuePtr);
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            int v30 = 667;
            __int16 v31 = 1024;
            int v32 = gCertificateIndex;
            _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _findValidIndex:%d: start index: %d\n", buf, 0xEu);
          }
          unsigned int v5 = 0;
          CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          BOOL v7 = 1;
          CFTypeRef v8 = MEMORY[0x263EF8438];
          while (1)
          {
            if ((int)(v5 + gCertificateIndex) <= 0) {
              uint64_t v0 = -(-(v5 + gCertificateIndex) & 3);
            }
            else {
              uint64_t v0 = (v5 + gCertificateIndex) & 3;
            }
            int v9 = *((unsigned __int8 *)&gCertificateRefreshState + (int)v0);
            if (v9 == 2)
            {
              CFAbsoluteTime v10 = *(double *)&gCertificateUseTimestamp[(int)v0];
              CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
              CFDateRef v12 = CFDateCreate(v6, Current);
              CFDateRef v13 = CFDateCreate(v6, v10);
              double TimeIntervalSinceDate = CFDateGetTimeIntervalSinceDate(v12, v13);
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109888;
                int v30 = 685;
                __int16 v31 = 1024;
                int v32 = v0;
                __int16 v33 = 2048;
                double v34 = TimeIntervalSinceDate;
                __int16 v35 = 2048;
                double v36 = valuePtr;
                _os_log_impl(&dword_21DC52000, v8, OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _findValidIndex:%d: %d: elapsed: %f <? %f\n", buf, 0x22u);
              }
              if (TimeIntervalSinceDate < valuePtr)
              {
                if ((int)(gCertificateIndex + v5) <= 0) {
                  uint64_t v0 = -(-(gCertificateIndex + v5) & 3);
                }
                else {
                  uint64_t v0 = (gCertificateIndex + v5) & 3;
                }
LABEL_25:
                if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  int v30 = 704;
                  __int16 v31 = 1024;
                  int v32 = v0;
                  _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _findValidIndex:%d: %d\n", buf, 0xEu);
                }
                uint64_t v15 = 0;
                while (*((unsigned char *)&gCertificateRefreshState + v15) != 4)
                {
                  if (++v15 == 4)
                  {
                    if (v7) {
                      goto LABEL_52;
                    }
                    goto LABEL_33;
                  }
                }
                *((unsigned char *)&gCertificateRefreshState + v15) = 3;
                if (v7) {
                  goto LABEL_52;
                }
LABEL_33:
                int v16 = 0;
                __int16 v17 = MEMORY[0x263EF8438];
                while (1)
                {
                  if (v16 + gCertificateIndex <= 0) {
                    int v18 = -(-(v16 + gCertificateIndex) & 3);
                  }
                  else {
                    int v18 = (v16 + gCertificateIndex) & 3;
                  }
                  if (*((unsigned char *)&gCertificateRefreshState + v18) == 4)
                  {
                    CFAbsoluteTime v19 = *(double *)&gCertificateUseTimestamp[v18];
                    CFAbsoluteTime v20 = CFAbsoluteTimeGetCurrent();
                    CFDateRef v21 = CFDateCreate(v6, v20);
                    CFDateRef v22 = CFDateCreate(v6, v19);
                    double v23 = CFDateGetTimeIntervalSinceDate(v21, v22);
                    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 67109888;
                      int v30 = 741;
                      __int16 v31 = 1024;
                      int v32 = v18;
                      __int16 v33 = 2048;
                      double v34 = v23;
                      __int16 v35 = 2048;
                      double v36 = valuePtr;
                      _os_log_impl(&dword_21DC52000, v17, OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _findValidIndex:%d: %d: elapsed: %f <? %f\n", buf, 0x22u);
                    }
                    if (v23 < valuePtr)
                    {
LABEL_46:
                      if (gCertificateIndex + v16 <= 0) {
                        uint64_t v0 = -(-(gCertificateIndex + v16) & 3);
                      }
                      else {
                        uint64_t v0 = (gCertificateIndex + v16) & 3;
                      }
                      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 67109376;
                        int v30 = 755;
                        __int16 v31 = 1024;
                        int v32 = v0;
                        __int16 v24 = MEMORY[0x263EF8438];
                        uint64_t v25 = "MFAADeviceIdentity: _findValidIndex:%d: %d\n";
                        uint32_t v26 = 14;
                        goto LABEL_51;
                      }
                      goto LABEL_52;
                    }
                    *((unsigned char *)&gCertificateRefreshState + v18) = 3;
                  }
                  else
                  {
                    if (*((unsigned char *)&gCertificateRefreshState + v18)) {
                      goto LABEL_46;
                    }
                    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 67109376;
                      int v30 = 728;
                      __int16 v31 = 1024;
                      int v32 = v18;
                      _os_log_impl(&dword_21DC52000, v17, OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _findValidIndex:%d: %d: skip invalid cert\n", buf, 0xEu);
                    }
                  }
                  if (++v16 == 4) {
                    goto LABEL_46;
                  }
                }
              }
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                int v30 = 693;
                __int16 v31 = 1024;
                int v32 = v0;
                _os_log_impl(&dword_21DC52000, v8, OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _findValidIndex:%d: %d: expired\n", buf, 0xEu);
              }
              *((unsigned char *)&gCertificateRefreshState + (int)v0) = 3;
            }
            else if (v9 == 1)
            {
              gCertificateUseTimestamp[(int)v0] = 0;
              goto LABEL_25;
            }
            BOOL v7 = v5++ < 3;
            if (v5 == 4) {
              goto LABEL_33;
            }
          }
        }
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    __int16 v24 = MEMORY[0x263EF8438];
    uint64_t v25 = "MFAADeviceIdentity: _findValidIndex: error\n";
    uint32_t v26 = 2;
LABEL_51:
    _os_log_impl(&dword_21DC52000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
  }
LABEL_52:
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v30 = v0;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _findValidIndex: %d\n", buf, 8u);
  }
  return v0;
}

uint64_t _copyCertificateForIndex(const __CFString *a1, int a2, int a3, int a4, CFTypeRef *a5, CFTypeRef *a6)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex Length = CFStringGetLength(a1);
  CFMutableDictionaryRef MutableCopy = CFStringCreateMutableCopy(v12, Length + 1, a1);
  uint64_t v15 = MutableCopy;
  if (MutableCopy)
  {
    double v23 = a6;
    CFStringAppendFormat(MutableCopy, 0, @"%d", (a2 + 1));
    if (*((unsigned char *)&gCertificateRefreshState + a2))
    {
      if (gCertificateDeviceIdentityCerts[a2]) {
        BOOL v16 = gCertificateDeviceIdentityKeyRefs[a2] == 0;
      }
      else {
        BOOL v16 = 1;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v25 = "_copyCertificateForIndex";
      __int16 v26 = 1024;
      int v27 = 478;
      __int16 v28 = 2112;
      *(void *)uint64_t v29 = v15;
      *(_WORD *)&v29[8] = 1024;
      *(_DWORD *)int v30 = a3;
      *(_WORD *)&void v30[4] = 1024;
      *(_DWORD *)&v30[6] = a4;
      __int16 v31 = 1024;
      int v32 = v16;
      _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s:%d %@, requestInit %d, requestNew %d, needInitCertKeyCache %d\n", buf, 0x2Eu);
    }
    __int16 v17 = (CFTypeRef *)&gCertificateDeviceIdentityCerts[a2];
    CFTypeRef v18 = *v17;
    if ((a3 | a4 | v16) != 1)
    {
      if (!v18 || !gCertificateDeviceIdentityKeyRefs[a2]) {
        goto LABEL_25;
      }
      goto LABEL_19;
    }
    if (v18)
    {
      CFRelease(v18);
      *__int16 v17 = 0;
    }
    CFAbsoluteTime v19 = &gCertificateDeviceIdentityKeyRefs[a2];
    if (*v19)
    {
      CFRelease(*v19);
      *CFAbsoluteTime v19 = 0;
    }
    uint64_t v20 = MFAADeviceIdentityRequestCertificate(v15, a4, v17, &gCertificateDeviceIdentityKeyRefs[a2]);
    if (!v20)
    {
      if (!*((unsigned char *)&gCertificateRefreshState + a2))
      {
        *((unsigned char *)&gCertificateRefreshState + a2) = 1;
        _storeRefreshStateToDisk();
      }
LABEL_19:
      if (*v17 && gCertificateDeviceIdentityKeyRefs[a2])
      {
        if (a5) {
          *a5 = CFRetain(*v17);
        }
        uint64_t v20 = 0;
        if (v23) {
          *double v23 = CFRetain(gCertificateDeviceIdentityKeyRefs[a2]);
        }
        goto LABEL_26;
      }
LABEL_25:
      uint64_t v20 = 96;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _copyCertificateForIndex_cold_1();
    }
    uint64_t v20 = 0xFFFFFFFFLL;
  }
LABEL_26:
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    if (v15) {
      CFStringRef v21 = v15;
    }
    else {
      CFStringRef v21 = a1;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v25 = "_copyCertificateForIndex";
    __int16 v26 = 1024;
    int v27 = 529;
    __int16 v28 = 1024;
    *(_DWORD *)uint64_t v29 = a2;
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)&v29[6] = a4;
    *(_WORD *)int v30 = 2112;
    *(void *)&v30[2] = v21;
    __int16 v31 = 1024;
    int v32 = v20;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s:%d index %d, requestNew %d, %@, error %d\n", buf, 0x2Eu);
  }
  if (v15) {
    CFRelease(v15);
  }
  return v20;
}

uint64_t MFAADeviceIdentityCreateSignature(__CFString *cf1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = 0;
  CFTypeRef v18 = &v17;
  uint64_t v19 = 0x2000000000;
  uint64_t v20 = 0;
  if (a3)
  {
    unsigned int v5 = cf1;
    if (!cf1 || !CFEqual(cf1, @"mfi-baa")) {
      unsigned int v5 = @"mfi-baa";
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 0x40000000;
    v16[2] = __MFAADeviceIdentityCreateSignature_block_invoke;
    void v16[3] = &unk_264479D18;
    v16[4] = &v17;
    v16[5] = a2;
    v16[6] = a3;
    v16[7] = v5;
    dispatch_sync((dispatch_queue_t)gSerialQueue, v16);
  }
  else
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v8) {
      MFAADeviceIdentityCreateSignature_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  uint64_t v6 = v18[3];
  _Block_object_dispose(&v17, 8);
  return v6;
}

void __MFAADeviceIdentityCreateSignature_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentityCreateSignature: SecKeyCreateSignature\n", buf, 2u);
  }
  CFErrorRef error = 0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = SecKeyCreateSignature(*(SecKeyRef *)(a1 + 40), (SecKeyAlgorithm)*MEMORY[0x263F17300], *(CFDataRef *)(a1 + 48), &error);
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    LODWORD(v2) = gCertificateIndex;
    int v3 = *((unsigned __int8 *)&gCertificateRefreshState + gCertificateIndex);
    if (v3 == 3)
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        int v16 = gCertificateIndex;
        __int16 v17 = 2048;
        CFAbsoluteTime v18 = Current;
        _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _storeStateToDisk[%d]: %f\n", buf, 0x12u);
      }
      char v5 = 4;
    }
    else
    {
      if (v3 != 1)
      {
LABEL_13:
        _storeStateToDisk(*(void *)(a1 + 56), v2);
        return;
      }
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        int v16 = gCertificateIndex;
        __int16 v17 = 2048;
        CFAbsoluteTime v18 = Current;
        _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _storeStateToDisk[%d]: %f\n", buf, 0x12u);
      }
      char v5 = 2;
    }
    uint64_t v2 = gCertificateIndex;
    *((unsigned char *)&gCertificateRefreshState + gCertificateIndex) = v5;
    *(CFAbsoluteTime *)&gCertificateUseTimestamp[v2] = Current;
    goto LABEL_13;
  }
  if (error)
  {
    CFRelease(error);
    CFErrorRef error = 0;
  }
  BOOL v6 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  if (v6) {
    __MFAADeviceIdentityCreateSignature_block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
}

uint64_t _storeStateToDisk(uint64_t a1, int a2)
{
  return 1;
}

void ___scheduleRefreshCertificates_block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(int *)(a1 + 40);
  int v2 = *((unsigned __int8 *)&gCertificateRefreshState + v1);
  if (v2 == 3 || v2 == 0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v13 = 606;
      __int16 v14 = 1024;
      int v15 = v1;
      _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _scheduleRefreshCertificates:%d: refresh: %d\n", buf, 0xEu);
      LODWORD(v1) = *(_DWORD *)(a1 + 40);
    }
    CFTypeRef v10 = 0;
    CFTypeRef cf = 0;
    int v5 = _copyCertificateForIndex(*(const __CFString **)(a1 + 32), v1, 0, 1, &cf, &v10);
    BOOL v6 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v6)
      {
        int v7 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 67109376;
        int v13 = 626;
        __int16 v14 = 1024;
        int v15 = v7;
        _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _scheduleRefreshCertificates:%d: error refreshing: %d\n", buf, 0xEu);
      }
    }
    else
    {
      if (v6)
      {
        int v8 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 67109376;
        int v13 = 615;
        __int16 v14 = 1024;
        int v15 = v8;
        _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _scheduleRefreshCertificates:%d: refreshed: %d\n", buf, 0xEu);
      }
      *((unsigned char *)&gCertificateRefreshState + *(int *)(a1 + 40)) = 1;
      uint64_t v9 = *(int *)(a1 + 40);
      gCertificateUseTimestamp[v9] = 0;
      gCertificateIsClassD[v9] = 1;
      _storeRefreshStateToDisk();
      _storeUseTimeToDisk();
      _storeIsClassDToDisk();
    }
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    if (v10) {
      CFRelease(v10);
    }
  }
}

BOOL _storeUseTimeToDisk()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 4, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    CFIndex v2 = 0;
    int v3 = (char *)&gCertificateUseTimestamp;
    do
    {
      CFNumberRef v4 = CFNumberCreate(v0, kCFNumberDoubleType, v3);
      if (v4)
      {
        CFNumberRef v5 = v4;
        CFArraySetValueAtIndex(Mutable, v2, v4);
        CFRelease(v5);
      }
      ++v2;
      v3 += 8;
    }
    while (v2 != 4);
    acc_userDefaults_setArrayForKey(@"IdentityCertUseTime", (uint64_t)Mutable);
    CFRelease(Mutable);
  }
  else
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v7) {
      _storeUseTimeToDisk_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  return Mutable != 0;
}

BOOL _storeIsClassDToDisk()
{
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 0;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _storeIsClassDToDisk\n", (uint8_t *)v14, 2u);
  }
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 4, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    for (CFIndex i = 0; i != 4; ++i)
    {
      CFNumberRef v3 = CFNumberCreate(v0, kCFNumberSInt8Type, &gCertificateIsClassD[i]);
      if (v3)
      {
        CFNumberRef v4 = v3;
        CFArraySetValueAtIndex(Mutable, i, v3);
        CFRelease(v4);
      }
    }
    acc_userDefaults_setArrayForKey(@"IdentityCertIsClassD", (uint64_t)Mutable);
    CFRelease(Mutable);
  }
  else
  {
    BOOL v6 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v6) {
      _storeIsClassDToDisk_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return Mutable != 0;
}

uint64_t _storeIndexToDisk(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _storeIndexToDisk: %d\n", (uint8_t *)v4, 8u);
  }
  acc_userDefaults_setIntegerForKey(@"IdentityCertUseIndex", a2);
  return 1;
}

uint64_t _readStateFromDisk()
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  CFArrayRef v0 = (const __CFArray *)acc_userDefaults_copyArrayForKey(@"IdentityCertUseTime");
  CFArrayRef v1 = (const __CFArray *)acc_userDefaults_copyArrayForKey(@"IdentityCertRefreshState");
  CFArrayRef v2 = (const __CFArray *)acc_userDefaults_copyArrayForKey(@"IdentityCertIsClassD");
  unsigned int v3 = acc_userDefaults_copyIntegerForKey(@"IdentityCertUseIndex");
  if (v3 <= 3) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  gCertificateIndex = v4;
  if (v0 && CFArrayGetCount(v0) <= 4)
  {
    *(_OWORD *)values = 0u;
    long long v25 = 0u;
    v27.size_t length = CFArrayGetCount(v0);
    v27.location = 0;
    CFArrayGetValues(v0, v27, (const void **)values);
    for (uint64_t i = 0; i != 4; ++i)
      CFNumberGetValue((CFNumberRef)values[i], kCFNumberDoubleType, &gCertificateUseTimestamp[i]);
    uint64_t v6 = 0;
    uint64_t v7 = MEMORY[0x263EF8438];
    do
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = gCertificateUseTimestamp[v6];
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = "_readStateFromDisk";
        __int16 v20 = 1024;
        int v21 = v6;
        __int16 v22 = 2048;
        uint64_t v23 = v8;
        _os_log_impl(&dword_21DC52000, v7, OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: %s: gCertificateUseTimestamp[%d]:%f\n", buf, 0x1Cu);
      }
      ++v6;
    }
    while (v6 != 4);
    CFRelease(v0);
  }
  if (v1 && CFArrayGetCount(v1) <= 4)
  {
    *(_OWORD *)values = 0u;
    long long v25 = 0u;
    v28.size_t length = CFArrayGetCount(v1);
    v28.location = 0;
    CFArrayGetValues(v1, v28, (const void **)values);
    for (uint64_t j = 0; j != 4; ++j)
      CFNumberGetValue((CFNumberRef)values[j], kCFNumberSInt8Type, (char *)&gCertificateRefreshState + j);
    uint64_t v10 = 0;
    uint64_t v11 = MEMORY[0x263EF8438];
    do
    {
      unsigned int v12 = *((unsigned __int8 *)&gCertificateRefreshState + v10);
      if (v12 >= 5)
      {
        unsigned int v12 = 0;
        *((unsigned char *)&gCertificateRefreshState + v10) = 0;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = "_readStateFromDisk";
        __int16 v20 = 1024;
        int v21 = v10;
        __int16 v22 = 1024;
        LODWORD(v23) = v12;
        _os_log_impl(&dword_21DC52000, v11, OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: %s: gCertificateRefreshState[%d]:%d\n", buf, 0x18u);
      }
      ++v10;
    }
    while (v10 != 4);
    CFRelease(v1);
  }
  if (v2 && CFArrayGetCount(v2) <= 4)
  {
    *(_OWORD *)values = 0u;
    long long v25 = 0u;
    v29.size_t length = CFArrayGetCount(v2);
    v29.location = 0;
    CFArrayGetValues(v2, v29, (const void **)values);
    for (uint64_t k = 0; k != 4; ++k)
      CFNumberGetValue((CFNumberRef)values[k], kCFNumberSInt8Type, &gCertificateIsClassD[k]);
    uint64_t v14 = 0;
    int v15 = MEMORY[0x263EF8438];
    do
    {
      if (gCertificateIsClassD[v14])
      {
        int v16 = 1;
        gCertificateIsClassD[v14] = 1;
      }
      else
      {
        int v16 = 0;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = "_readStateFromDisk";
        __int16 v20 = 1024;
        int v21 = v14;
        __int16 v22 = 1024;
        LODWORD(v23) = v16;
        _os_log_impl(&dword_21DC52000, v15, OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: %s: gCertificateIsClassD[%d]:%d\n", buf, 0x18u);
      }
      ++v14;
    }
    while (v14 != 4);
    CFRelease(v2);
  }
  return 1;
}

void ____initMFAADeviceIdentity_block_invoke()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v0 = 136315138;
    CFArrayRef v1 = "__initMFAADeviceIdentity_block_invoke";
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: do once", (uint8_t *)&v0, 0xCu);
  }
  gSerialQueue = (uint64_t)dispatch_queue_create("MFAADeviceIdentity", 0);
  _readStateFromDisk();
  dispatch_async((dispatch_queue_t)gSerialQueue, &__block_literal_global_22);
}

uint64_t ____initMFAADeviceIdentity_block_invoke_19()
{
  return _fetchAllCertificates(@"mfi-baa");
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 5, (uint64_t)_kLoggingModuleEntries);
  init_logging_signposts();
}

unint64_t systemInfo_getCurrentUnixTime()
{
  int v0 = [MEMORY[0x263EFF910] date];
  [v0 timeIntervalSince1970];
  double v2 = v1;

  unint64_t v3 = vcvtad_u64_f64(v2);
  if (v2 <= 0.0) {
    return 0;
  }
  else {
    return v3;
  }
}

unint64_t systemInfo_getCurrentUnixTimeMS()
{
  int v0 = [MEMORY[0x263EFF910] date];
  [v0 timeIntervalSince1970];
  double v2 = v1;

  unint64_t v3 = vcvtad_u64_f64(v2 * 1000.0);
  if (v2 <= 0.0) {
    return 0;
  }
  else {
    return v3;
  }
}

uint64_t systemInfo_isInternalBuild()
{
  if (systemInfo_isInternalBuild_onceToken != -1) {
    dispatch_once(&systemInfo_isInternalBuild_onceToken, &__block_literal_global_5);
  }
  return systemInfo_isInternalBuild_internalBuild;
}

uint64_t __systemInfo_isInternalBuild_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  systemInfo_isInternalBuild_internalBuild = result;
  return result;
}

uint64_t systemInfo_isDeveloperBuild()
{
  if (systemInfo_isDeveloperBuild_onceToken != -1) {
    dispatch_once(&systemInfo_isDeveloperBuild_onceToken, &__block_literal_global_3_0);
  }
  return systemInfo_isDeveloperBuild_developerBuild;
}

void __systemInfo_isDeveloperBuild_block_invoke()
{
  int v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    double v1 = v0;
    systemInfo_isDeveloperBuild_developerBuild = CFEqual(v0, @"Beta") != 0;
    CFRelease(v1);
  }
  else
  {
    systemInfo_isDeveloperBuild_developerBuild = 0;
  }
}

uint64_t systemInfo_systemSupportsPearl()
{
  if (systemInfo_systemSupportsPearl_onceToken != -1) {
    dispatch_once(&systemInfo_systemSupportsPearl_onceToken, &__block_literal_global_11_0);
  }
  return systemInfo_systemSupportsPearl_supportsPearl;
}

uint64_t __systemInfo_systemSupportsPearl_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  systemInfo_systemSupportsPearl_supportsPearl = result;
  return result;
}

uint64_t systemInfo_systemSupportsWAPI()
{
  if (systemInfo_systemSupportsWAPI_onceToken != -1) {
    dispatch_once(&systemInfo_systemSupportsWAPI_onceToken, &__block_literal_global_16);
  }
  return systemInfo_systemSupportsWAPI_supportsWAPI;
}

uint64_t __systemInfo_systemSupportsWAPI_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  systemInfo_systemSupportsWAPI_supportsWAPI = result;
  return result;
}

uint64_t systemInfo_copyDeviceClass()
{
  return MGCopyAnswer();
}

uint64_t systemInfo_isHomePod()
{
  int v0 = (void *)MGCopyAnswer();
  uint64_t v1 = [v0 isEqualToString:@"AudioAccessory"];

  return v1;
}

uint64_t systemInfo_copyRegionCode()
{
  if (systemInfo_copyRegionCode_onceToken != -1) {
    dispatch_once(&systemInfo_copyRegionCode_onceToken, &__block_literal_global_24);
  }
  if (systemInfo_copyRegionCode_regionCode)
  {
    CFTypeID v0 = CFGetTypeID((CFTypeRef)systemInfo_copyRegionCode_regionCode);
    if (v0 == CFStringGetTypeID()) {
      return systemInfo_copyRegionCode_regionCode;
    }
  }
  uint64_t result = 0;
  systemInfo_copyRegionCode_regionCode = 0;
  return result;
}

uint64_t __systemInfo_copyRegionCode_block_invoke()
{
  uint64_t result = MGCopyAnswer();
  systemInfo_copyRegionCode_regionCode = result;
  return result;
}

const void *systemInfo_copyProductType()
{
  uint64_t result = (const void *)MGCopyAnswer();
  if (result)
  {
    uint64_t v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *systemInfo_copyProductVersion()
{
  uint64_t result = (const void *)MGCopyAnswer();
  if (result)
  {
    uint64_t v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_3;
  char v4 = a2;
  block[4] = a3;
  void block[5] = a1;
  if (init_logging_modules_onceToken != -1) {
    dispatch_once(&init_logging_modules_onceToken, block);
  }
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFTypeID v2 = &loc_21DC8F000;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    uint64_t v6 = MEMORY[0x263EF8438];
    do
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        uint64_t v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_21DC52000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          uint64_t v7 = *(void *)(a1 + 32);
          uint64_t v8 = "<Undefined>";
        }
      }
      uint64_t v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        uint64_t v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v16, v4, &v17);
          uint64_t v9 = "<Undefined>";
        }
      }
      os_log_t v10 = os_log_create(v8, v9);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v13 = v8;
          __int16 v14 = 2080;
          int v15 = v9;
          _os_log_debug_impl(&dword_21DC52000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        int v15 = v9;
        _os_log_error_impl(&dword_21DC52000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    CFTypeID v2 = (void *)&loc_21DC8F000;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = v2[459];
    LODWORD(v13) = v5;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v11;
}

void init_logging_signposts()
{
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __init_logging_signpost_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_4;
  char v4 = a2;
  block[4] = a3;
  void block[5] = a1;
  if (init_logging_signpost_modules_onceToken != -1) {
    dispatch_once(&init_logging_signpost_modules_onceToken, block);
  }
}

void __init_logging_signpost_modules_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFTypeID v2 = &loc_21DC8F000;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    uint64_t v6 = MEMORY[0x263EF8438];
    do
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        uint64_t v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_21DC52000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
          uint64_t v7 = *(void *)(a1 + 32);
          uint64_t v8 = "<Undefined>";
        }
      }
      uint64_t v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        uint64_t v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v16, v4, &v17);
          uint64_t v9 = "<Undefined>";
        }
      }
      os_log_t v10 = os_log_create(v8, v9);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v13 = v8;
          __int16 v14 = 2080;
          int v15 = v9;
          _os_log_debug_impl(&dword_21DC52000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        int v15 = v9;
        _os_log_error_impl(&dword_21DC52000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    CFTypeID v2 = (void *)&loc_21DC8F000;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = v2[459];
    LODWORD(v13) = v5;
    _os_log_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(void *)(a1 + 40);
  gNumLogSignpostObjects = v11;
}

uint64_t mfaa_certificateManager_validateCertificate(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = +[MFAACertificateManager sharedManager];
  uint64_t v5 = [v4 validateCertificate:a1 realtime:a2 error:0];

  return v5;
}

uint64_t mfaa_certificateManager_copyAnchorCertificates(uint64_t a1)
{
  return objc_claimAutoreleasedReturnValue();
}

void *sub_21DC6F4DC(void *result)
{
  *uint64_t result = ++qword_267D208B0;
  return result;
}

void sub_21DC6F4F8(uint64_t a1)
{
  int v1 = *(_DWORD *)(*(void *)(a1 + 24) + 4);
  if (v1 + 1916468129 < 0) {
    int v2 = *(_DWORD *)(*(void *)(a1 + 24) + 4);
  }
  else {
    int v2 = 462031038 - v1;
  }
  __asm { BRAA            X11, X13 }
}

uint64_t sub_21DC6F60C@<X0>(uint64_t a1@<X2>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  int v15 = v13 + 948253587;
  *((_DWORD *)&a11 + v11 + a2) = *(_DWORD *)(*(void *)(a1 + 8) + 4 * (v11 + a2));
  BOOL v16 = v11 + 726240035 < v15;
  if (v15 < -968214542 != v11 + 726240035 < -968214542) {
    BOOL v16 = v15 < -968214542;
  }
  return (*(uint64_t (**)(void))(v14 + 8 * (v16 + v12)))();
}

void sub_21DC6F684()
{
}

uint64_t sub_21DC6F690(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4 + 1458300621 < -458167508 != v4 + 1236287068 < -458167508) {
    BOOL v7 = a4 + 1458300621 < -458167508;
  }
  else {
    BOOL v7 = v4 + 1236287068 < a4 + 1458300621;
  }
  return (*(uint64_t (**)(void))(v6 + 8 * (v7 + v5)))();
}

uint64_t sub_21DC6F6FC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  BOOL v16 = v12 < v10;
  *(_DWORD *)(a9 + 4 * (v9 + a1)) = v14;
  int v17 = v11 + v9 + 1;
  int v18 = v16 ^ (v17 < v10);
  BOOL v19 = v17 < v12;
  if (!v18) {
    BOOL v16 = v19;
  }
  return (*(uint64_t (**)(void))(v15 + 8 * (v16 + v13)))();
}

uint64_t sub_21DC6F758(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if ((a4 + a2) <= 0x80000000) {
    int v6 = v4;
  }
  else {
    int v6 = v4 + 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8 * v6))(a1, a2);
}

uint64_t sub_21DC6F798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, _DWORD *a17)
{
  int v20 = (*(_DWORD *)(*(void *)(a12 + 32) + 16) - 1262982400) * (*a17 - 897970625);
  int v21 = 704005591 * ((v19 - 128) ^ 0xF7D78CF0);
  *(_DWORD *)(v19 - 112) = (v18 + 3) ^ v21;
  *(_DWORD *)(v19 - 108) = (v20 ^ 0xE7DE97B5) - v21 + ((2 * v20) & 0xCFBD2F6A) + 1602222208;
  *(void *)(v19 - 120) = &a16;
  *(_DWORD *)(v19 - 128) = 231015519 - v21;
  *(void *)(v19 - 104) = a13;
  uint64_t v22 = ((uint64_t (*)(uint64_t))qword_26CE8FAB0[v18 + 22])(v19 - 128);
  BOOL v23 = a11 + 1242427381 > 1473442901;
  if (a11 + 1242427381 < -674040748) {
    BOOL v23 = 1;
  }
  return (*(uint64_t (**)(uint64_t))(v17 + 8 * (v18 + 8 * !v23)))(v22);
}

uint64_t sub_21DC6FC3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15)
{
  int v23 = 520147679 * ((v22 - 128) ^ 0xD061A127);
  *(_DWORD *)(v22 - 112) = v17 - v23 - 13;
  *(void *)(v22 - 120) = &a13;
  *(_DWORD *)(v22 - 128) = ((v15 ^ 0x5DF9FFF2) + ((2 * v15) & 0xBBF3FFE4) - 404771650) ^ v23;
  (*(void (**)(uint64_t))(v19 + 8 * (v17 + 12)))(v22 - 128);
  *(_DWORD *)(v22 - 112) = v17 - 2 - ((v22 - 128) ^ v21) * v20 - 11;
  *(void *)(v22 - 128) = a12;
  *(void *)(v22 - 120) = &a15;
  uint64_t v24 = (*(uint64_t (**)(uint64_t))(v19 + 8 * (v17 + 22)))(v22 - 128);
  return (*(uint64_t (**)(uint64_t))(v18
                                            + 8
                                            * (int)(((*(_DWORD *)(v22 - 108) + v16) >> 31) + v17 - 2)))(v24);
}

uint64_t sub_21DC6FD98@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  int v10 = a1 + 11;
  *(void *)(v9 - 120) = &a6;
  *(void *)(v9 - 112) = v7;
  *(_DWORD *)(v9 - 128) = (a1 - 1) ^ (56516261 * ((v9 - 128) ^ 0x15EBF17D));
  uint64_t v11 = ((uint64_t (*)(uint64_t))qword_26CE8FAB0[a1 + 47])(v9 - 128);
  return (*(uint64_t (**)(uint64_t))(v8 + 8 * (v10 + 2 * (v6 != 1))))(v11);
}

uint64_t sub_21DC6FE2C@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1 + 8 * (a1 + 2)))();
}

uint64_t sub_21DC6FEDC(uint64_t a1)
{
  int v1 = 1638185881 * (a1 ^ 0x11FD620);
  int v2 = *(_DWORD *)(a1 + 12) + v1;
  int v3 = *(_DWORD *)(a1 + 16) ^ v1;
  int v4 = *(_DWORD *)(*(void *)(a1 + 24) + 4);
  if (v4 + 1916468129 >= 0) {
    int v4 = 462031038 - v4;
  }
  return (*(uint64_t (**)(void))(qword_264479F60[v2 + 23]
                              - 6
                              + 8
                              * (v2
                               + 4
                               * ((v3 - 158609094) >= 4 * (unint64_t)(v4 - 231015519)))))();
}

uint64_t sub_21DC6FF78()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (v2 + ((v0 != 158609094) | (4 * (v0 != 158609094))))))();
}

uint64_t sub_21DC6FFA8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 8 * (v3 - v4 + 3)))(a1, 897970625, v1);
}

uint64_t sub_21DC6FFE4@<X0>(void *a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W8>)
{
  *(unsigned char *)(*a1 + (a3 + a4)) = (a2 - 897970625) >> v6;
  if (a3 - 1 == v5) {
    int v8 = v7 + 1;
  }
  else {
    int v8 = v7;
  }
  return (*(uint64_t (**)(void))(v4 + 8 * v8))();
}

uint64_t sub_21DC70020(uint64_t a1, uint64_t a2, char a3, int a4)
{
  int v8 = (a4 & 0xFFFFFFFD | (2 * (a3 & 1))) + v7;
  if (v6 == 24) {
    int v9 = v8 + 1;
  }
  else {
    int v9 = v8;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 8 * v9))(a1, a2, v4);
}

uint64_t sub_21DC7004C(uint64_t a1)
{
  if (v1 + 755559108 < -1160909021 != v4 + 494530915 < -1160909021) {
    BOOL v6 = v1 + 755559108 < -1160909021;
  }
  else {
    BOOL v6 = v4 + 494530915 < v1 + 755559108;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 8 * (v5 + 2 * v6)))(a1, 897970625, v2);
}

uint64_t sub_21DC700BC@<X0>(void *a1@<X0>, int a2@<W8>)
{
  return sub_21DC6FFE4(a1, *(_DWORD *)(*(void *)(v2 + 8) + 4 * (v4 - 492043712)), v3, a2);
}

uint64_t sub_21DC700E4(uint64_t result)
{
  *(_DWORD *)(result + 8) = v1;
  return result;
}

uint64_t sub_21DC700EC()
{
  return off_26CE8FBD8();
}

uint64_t sub_21DC701A4(uint64_t a1)
{
  int v1 = *(_DWORD *)(*(void *)(a1 + 8) + 4);
  if (v1 + 1916468129 >= 0) {
    int v1 = 462031038 - v1;
  }
  if ((v1 + 1916468129) <= 0x80000000) {
    int v2 = *(_DWORD *)(a1 + 4) + 520147679 * (a1 ^ 0xD061A127) - 3;
  }
  else {
    int v2 = *(_DWORD *)(a1 + 4) + 520147679 * (a1 ^ 0xD061A127) - 2;
  }
  return (*(uint64_t (**)(void))(qword_264479F60[(int)(*(_DWORD *)(a1 + 4) + 520147679 * (a1 ^ 0xD061A127) - 1)]
                              - 10
                              + 8 * v2))();
}

uint64_t sub_21DC70244@<X0>(int a1@<W1>, int a2@<W2>, int a3@<W3>, int a4@<W8>)
{
  return (*(uint64_t (**)(void))(v6 + 8
                                   * (3 * a3 + v5 + 2 * (*(_DWORD *)(*(void *)(v4 + 8) + 4 * (a4 + a1)) != a2))))();
}

void sub_21DC7027C()
{
}

_DWORD *sub_21DC70284(_DWORD *result)
{
  *uint64_t result = 1657939070;
  return result;
}

uint64_t sub_21DC70294(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v5 + 8 * (int)(2 * ((a4 - 897970625) >> 31) + v4)))();
}

_DWORD *sub_21DC702F4@<X0>(_DWORD *result@<X0>, int a2@<W8>)
{
  *uint64_t result = v2 + 32 * a2 - 1439590273;
  return result;
}

void sub_21DC7030C()
{
  uint64_t v0 = MEMORY[0x270FA5390]();
  int v1 = *(_DWORD *)(v0 + 8) ^ (601157143 * (v0 ^ 0x5103A544));
  if (*(_DWORD *)(*(void *)(v0 + 32) + 4) == 231015519) {
    int v2 = v1 + 1;
  }
  else {
    int v2 = *(_DWORD *)(v0 + 8) ^ (601157143 * (v0 ^ 0x5103A544));
  }
  __asm { BRAA            X10, X11 }
}

uint64_t sub_21DC7043C()
{
  *(_DWORD *)(v3 + 4) = v0;
  *(void *)(v6 - 144) = &v8;
  *(void *)(v6 - 136) = v3;
  *(_DWORD *)(v6 - 128) = v4 + 1 + ((v6 - 144) ^ v2) * v1 - 14;
  return (*(uint64_t (**)(uint64_t))(v5 + 8 * (v4 + 48)))(v6 - 144);
}

void sub_21DC71524(_DWORD *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unsigned int v1 = a1[2] ^ (2145031067 * (a1 ^ 0x1E282685));
  uint64_t v2 = *(void *)a1;
  int v3 = *(_DWORD *)(*(void *)a1 + 4);
  if (v3 + 1916468129 < 0) {
    int v4 = *(_DWORD *)(*(void *)a1 + 4);
  }
  else {
    int v4 = 462031038 - v3;
  }
  unsigned int v7 = v1 - 1748787863 * (&v6 ^ 0x81BAC106) - 2;
  uint64_t v6 = v2;
  ((void (*)(uint64_t *))qword_26CE8FAB0[v1 + 12])(&v6);
  if ((v4 + 1916468129) <= 0x80000000) {
    unsigned int v5 = v1;
  }
  else {
    unsigned int v5 = v1 + 1;
  }
  __asm { BRAA            X9, X10 }
}

uint64_t sub_21DC71624@<X0>(uint64_t a1@<X8>)
{
  int v5 = v2 + 10 * v1;
  if (((v4 + v3) & 0x1F) != 0xC) {
    int v6 = v5;
  }
  else {
    int v6 = v5 + 1;
  }
  return (*(uint64_t (**)(void))(a1 + 8 * v6))();
}

uint64_t sub_21DC71694@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v4 + 8) + 4 * (v6 + v2 + v1 + 1917526983)) = *(_DWORD *)(*(void *)(v4 + 8)
                                                                                   + 4 * (v6 - 231015520));
  if ((v5 + v6 - 1) >= 0x80000001) {
    int v7 = v3;
  }
  else {
    int v7 = v3 + 1;
  }
  return (*(uint64_t (**)(void))(a1 + 8 * v7))();
}

uint64_t sub_21DC716F8@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v6 + 8) + 4 * v5) = *(_DWORD *)(*(void *)(v6 + 8) + 4 * v4);
  if (v1 >= v3) {
    int v7 = v2;
  }
  else {
    int v7 = v2 + 1;
  }
  return (*(uint64_t (**)(void))(a1 + 8 * v7))();
}

uint64_t sub_21DC7172C@<X0>(uint64_t a1@<X8>)
{
  if ((v1 + 1058855) <= 0x80000000) {
    int v3 = v2;
  }
  else {
    int v3 = v2 + 1;
  }
  return (*(uint64_t (**)(void))(a1 + 8 * v3))();
}

void sub_21DC71A54(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 56) ^ (1685429429 * (a1 ^ 0x377F83D5));
  if (*(void *)(a1 + 24)) {
    int v2 = v1 + 1;
  }
  else {
    int v2 = *(_DWORD *)(a1 + 56) ^ (1685429429 * (a1 ^ 0x377F83D5));
  }
  __asm { BRAA            X12, X13 }
}

uint64_t sub_21DC71B2C()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (((*(_DWORD *)(v3 + 40) + v0 == 2060361180) | (*(void *)(v3 + 32) == 0x18F01F70FA2C9FA2) & (*(void *)(v3 + 8) == 0x250197BA3C001668))
                               + v1
                               - v2)))();
}

uint64_t sub_21DC71B98()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((v1 ^ 1)
                               + v0
                               + v1
                               + 6 * ((v2[6] != 0) & (v2[2] != 0 || v2[8] != 0x79046D8DC0A979F1)))))();
}

uint64_t sub_21DC71BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (v15 == 0x250197BA3C001668) {
    int v20 = v16 + 4 * v17 + 1;
  }
  else {
    int v20 = v16 + 4 * v17;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 8 * v20))(a1, a2, a3, a4, a5, a6, a7, a8, v18, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_21DC71C78@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char *a17, char *a18, uint64_t a19, char a20,uint64_t a21,char a22,uint64_t a23,char a24,uint64_t a25,char a26,uint64_t a27,char a28)
{
  int v35 = a1 + 7;
  int v36 = 1836812333 * ((v34 - 144) ^ 0x4065F266);
  *(_DWORD *)(v34 - 128) = v36 + v29 - 526058002;
  *(void *)(v34 - 136) = v28;
  *(_DWORD *)(v34 - 112) = v36 + a1 + 9;
  *(void *)(v34 - 120) = &a20;
  (*(void (**)(uint64_t))(v30 + 8 * (a1 + 16)))(v34 - 144);
  a17 = &a28;
  a18 = &a22;
  *(void *)(v34 - 128) = v32;
  *(void *)(v34 - 144) = &a17;
  int v48 = v35 - 5 + 520147679 * ((v34 - 144) ^ 0xD061A127);
  *(_DWORD *)(v34 - 136) = v48;
  uint64_t v47 = *(void (**)(uint64_t))(v30 + 8 * (v35 + 45));
  v47(v34 - 144);
  int v46 = (v35 - 2) ^ (940831517 * ((v34 - 144) ^ 0xA299CC3C));
  *(_DWORD *)(v34 - 144) = v46;
  *(void *)(v34 - 136) = v32;
  *(void *)(v34 - 128) = &a24;
  *(void *)(v34 - 120) = &a20;
  *(void *)(v34 - 112) = &a17;
  long long v45 = *(void (**)(uint64_t))(v30 + 8 * (v35 + 5));
  v45(v34 - 144);
  uint64_t v37 = a18;
  *(void *)(v34 - 120) = v32;
  *(void *)(v34 - 112) = v37;
  *(void *)(v34 - 136) = &a24;
  *(void *)(v34 - 128) = &a24;
  int v44 = v35 - 704005591 * ((v34 - 144) ^ 0xF7D78CF0) + 17;
  *(_DWORD *)(v34 - 104) = v44;
  *(void *)(v34 - 144) = &a17;
  long long v43 = (void (*)(uint64_t))qword_26CE8FAB0[v35 + 37];
  v43(v34 - 144);
  *(void *)(v34 - 128) = &a24;
  *(void *)(v34 - 120) = a13;
  *(void *)(v34 - 144) = v32;
  *(void *)(v34 - 112) = &a24;
  *(void *)(v34 - 104) = &a17;
  int v42 = (v35 + 8) ^ (601157143 * ((v34 - 144) ^ 0x5103A544));
  *(_DWORD *)(v34 - 136) = v42;
  long long v38 = (void (*)(uint64_t))qword_26CE8FAB0[v35 + 14];
  v38(v34 - 144);
  *(void *)(v34 - 128) = v33;
  *(_DWORD *)(v34 - 136) = v48;
  *(void *)(v34 - 144) = &a17;
  v47(v34 - 144);
  *(void *)(v34 - 136) = v33;
  *(void *)(v34 - 128) = &a26;
  *(_DWORD *)(v34 - 144) = v46;
  *(void *)(v34 - 120) = &a20;
  *(void *)(v34 - 112) = &a17;
  v45(v34 - 144);
  long long v39 = a18;
  *(void *)(v34 - 144) = &a17;
  *(void *)(v34 - 136) = &a26;
  *(_DWORD *)(v34 - 104) = v44;
  *(void *)(v34 - 120) = v33;
  *(void *)(v34 - 112) = v39;
  *(void *)(v34 - 128) = &a26;
  v43(v34 - 144);
  *(void *)(v34 - 128) = &a26;
  *(void *)(v34 - 120) = a11;
  *(void *)(v34 - 144) = v33;
  *(void *)(v34 - 112) = &a26;
  *(void *)(v34 - 104) = &a17;
  *(_DWORD *)(v34 - 136) = v42;
  v38(v34 - 144);
  *(void *)(v34 - 136) = &a24;
  *(void *)(v34 - 128) = &a26;
  *(_DWORD *)(v34 - 144) = (v35 - 5) ^ (56516261 * ((v34 - 144) ^ 0x15EBF17D));
  ((void (*)(uint64_t))qword_26CE8FAB0[v35 + 43])(v34 - 144);
  *(_DWORD *)(v34 - 132) = v35 - 1748787863 * ((v34 - 144) ^ 0x81BAC106) - 7;
  *(void *)(v34 - 144) = &a26;
  uint64_t v40 = ((uint64_t (*)(uint64_t))qword_26CE8FAB0[v35 + 7])(v34 - 144);
  return (*(uint64_t (**)(uint64_t))(v31 + 8 * ((*(_DWORD *)(v34 - 136) + 1406450678 >= 0) + v35)))(v40);
}

uint64_t sub_21DC7204C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,char a33)
{
  *(void *)(v38 - 136) = v37;
  *(void *)(v38 - 128) = v36;
  *(_DWORD *)(v38 - 144) = (v34 - 3) ^ (191237807 * ((v38 - 144) ^ 0xDBC9B6B1));
  (*(void (**)(uint64_t))(v33 + 8 * (v34 + 36)))(v38 - 144);
  uint64_t v39 = a25;
  int v40 = v34 - 704005591 * ((v38 - 144) ^ 0xF7D78CF0) + 19;
  *(_DWORD *)(v38 - 104) = v40;
  *(void *)(v38 - 120) = v37;
  *(void *)(v38 - 112) = v39;
  *(void *)(v38 - 136) = &a33;
  *(void *)(v38 - 128) = &a33;
  *(void *)(v38 - 144) = &a24;
  long long v41 = *(void (**)(uint64_t))(v33 + 8 * (v34 + 39));
  v41(v38 - 144);
  *(void *)(v38 - 128) = a19;
  *(void *)(v38 - 120) = v37;
  *(_DWORD *)(v38 - 104) = v40;
  *(void *)(v38 - 144) = &a24;
  *(void *)(v38 - 136) = &a33;
  *(void *)(v38 - 112) = &a33;
  v41(v38 - 144);
  *(void *)(v38 - 144) = a20;
  *(void *)(v38 - 128) = &a33;
  *(_DWORD *)(v38 - 136) = (v34 - 191875503) ^ (520147679 * ((v38 - 144) ^ 0xD061A127));
  ((void (*)(uint64_t))qword_26CE8FAB0[v34 + 42])(v38 - 144);
  *(_DWORD *)(v38 - 144) = (v34 - 3) ^ (191237807 * ((v38 - 144) ^ 0xDBC9B6B1));
  *(void *)(v38 - 136) = &a31;
  *(void *)(v38 - 128) = &a33;
  ((void (*)(uint64_t))qword_26CE8FAB0[v34 + 36])(v38 - 144);
  *(void *)(v38 - 144) = &a33;
  *(void *)(v38 - 136) = &a31;
  *(_DWORD *)(v38 - 128) = v34 - 4 + 523995289 * ((v38 - 144) ^ 0x98567068);
  uint64_t v42 = ((uint64_t (*)(uint64_t))qword_26CE8FAB0[v34 + 57])(v38 - 144);
  if (a21 == 0x79046D8DC0A979F1) {
    int v43 = v34 - 3;
  }
  else {
    int v43 = v34 - 4;
  }
  return (*(uint64_t (**)(uint64_t))(v35 + 8 * v43))(v42);
}

uint64_t sub_21DC72288@<X0>(int a1@<W8>)
{
  int v5 = 1638185881 * ((v4 - 144) ^ 0x11FD620);
  *(void *)(v4 - 144) = v7;
  *(void *)(v4 - 120) = v3;
  *(_DWORD *)(v4 - 132) = a1 - v5 - 2;
  *(_DWORD *)(v4 - 128) = (v9 - 1901752086) ^ v5;
  uint64_t result = (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 + 14)))(v4 - 144);
  *uint64_t v8 = v9;
  *int v1 = 344250259;
  return result;
}

void sub_21DC72398(_DWORD *a1)
{
  unsigned int v1 = 523995289 * (a1 ^ 0x98567068);
  int v2 = a1[4] ^ v1;
  if (*a1 - v1 + 1623440039 <= 0x80000000) {
    int v3 = a1[4] ^ v1;
  }
  else {
    int v3 = v2 + 1;
  }
  __asm { BRAA            X12, X13 }
}

uint64_t sub_21DC7243C@<X0>(int a1@<W8>)
{
  unsigned int v4 = 520147679 * (&v6 ^ 0xD061A127);
  int v8 = v4 + a1 + 1;
  int v6 = v2 + v4 - ((v3 + 1099396430) & 0x50B9411A) + 153115444;
  uint64_t v7 = v1;
  return ((uint64_t (*)(int *))qword_26CE8FAB0[a1 + 25])(&v6);
}

void sub_21DC72558(uint64_t a1)
{
  __asm { BRAA            X9, X10 }
}

uint64_t sub_21DC72594@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  int v3 = 1383034093 * a2;
  int v4 = ((uint64_t (*)(void))qword_26CE8FAB0[1383034093 * a2 + 10])();
  if (v4 == 16) {
    unsigned int v5 = -42029;
  }
  else {
    unsigned int v5 = -42030;
  }
  if (v4) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  ((void (*)(uint64_t))qword_26CE8FAB0[v3])(a1);
  return v6;
}

void pbx7(uint64_t a1, int a2)
{
  if ((a2 & 0x3F000000) == 0x13000000) {
    int v2 = 8;
  }
  else {
    int v2 = 7;
  }
  __asm { BRAA            X10, X9 }
}

uint64_t sub_21DC726B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9
                                                                                                  + 8 * (v8 - 16 + (((((2 * (int)a2) & 0x8A6FBE | 0x2000000) + (a2 & 0xFFFFFF ^ 0x7C4537DF) + 45795361) & 0x3000000) == 0x1000000) * a8)))(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_21DC72770()
{
  return v0();
}

uint64_t sub_21DC72778()
{
  return (*(uint64_t (**)(void))(v0 + 8 * (11 * (v1 == 1321577070) + 7)))();
}

uint64_t sub_21DC73504(uint64_t a1, char a2)
{
  return ((uint64_t (*)(void))qword_26CE8FAB0[(((((char)(((16 * a2 * a2) ^ 0x30) + 32) >> 6)
                                              % 0x19u
                                              + 37) >> 1) & 0x30 | 0x44)
                                           - 27])();
}

uint64_t sub_21DC7357C()
{
  return off_26CE8FB80();
}

uint64_t sub_21DC735E4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = *(_DWORD *)(a1 + 8) ^ (520147679 * (a1 ^ 0xD061A127));
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)a1;
  uint64_t v4 = v2;
  unsigned int v5 = v1 + 191875505 - 191237807 * (&v4 ^ 0xDBC9B6B1);
  return ((uint64_t (*)(uint64_t *))qword_26CE8FAB0[v1 + 191875529])(&v4);
}

uint64_t fukQllQ9ln(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = a2;
  BOOL v2 = (((char)a2 >> 5) * a2) > 0xB7u;
  int v3 = (32
                       * ((((char)(((-2114445439 * (unint64_t)(v2 | 0x20u)) >> 37)
                                                                + (-2114445439 * (v2 | 0x20u) < 0)) >> 5) ^ 0x94u) > 0xC0)
                       / -76) >> 1;
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t))qword_26CE8FAB0[(((4 * v3 + 83) ^ 0x88888888) & 0xFD)
                                                                                            - 211];
  unsigned int v5 = -((((((v3 + 45) >> 7) ^ 0x3D) + 18) / 0x53) & ((((v3 + 45) >> 7) ^ 0x3D) + 18));
  return v4(a1, qword_264479F60[(((((((v5 & 0x40) - 72 * ((v5 & 0xC0) / 0x48)) & 0x10 | 0xA0) % 0xA9 % 0x1B) ^ 0xB9) / 0x6F- 97) & 0xBF)- 106]- 14, &v7, 8, 100);
}

void sub_21DC73890(uint64_t a1)
{
  if (a1) {
    int v1 = 2;
  }
  else {
    int v1 = 1;
  }
  __asm { BRAA            X9, X10 }
}

uint64_t sub_21DC738E0@<X0>(int a1@<W8>)
{
  int v2 = 235968479 * a1 + 1;
  uint64_t v3 = ((uint64_t (*)(uint64_t))qword_26CE8FAB0[v2])(200);
  return (*(uint64_t (**)(void))(v1 + 8 * (v2 + 2 * (v3 != 0))))();
}

uint64_t sub_21DC73948@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  int v9 = (*(uint64_t (**)(uint64_t, void))(v5 + 8 * (v7 + a2 * v6 - 235968469)))(a1, 0);
  if (v9 == 16)
  {
    int v3 = 1398708801;
    goto LABEL_7;
  }
  if (v9 == 12)
  {
LABEL_7:
    (*(void (**)(uint64_t))(v5 + 8 * (v4 - 235968480)))(a1);
    return (1293967099 * v3 - 1334165480);
  }
  if (v9)
  {
    int v3 = 1234411022;
    goto LABEL_7;
  }
  *int v2 = a1;
  int v3 = 362650424;
  return (1293967099 * v3 - 1334165480);
}

void sub_21DC73A10(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 ^ (56516261 * (a1 ^ 0x15EBF17D));
  if (*(_DWORD *)(*(void *)(a1 + 8) + 4) == 231015519) {
    int v2 = v1 + 1;
  }
  else {
    int v2 = *(_DWORD *)a1 ^ (56516261 * (a1 ^ 0x15EBF17D));
  }
  __asm { BRAA            X15, X16 }
}

uint64_t sub_21DC73A90(uint64_t a1)
{
  int v5 = v3 - 2 * v4;
  if (*(_DWORD *)(*(void *)(a1 + 16) + 4) == v2) {
    ++v5;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * v5))();
}

uint64_t sub_21DC73AC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = a1;
  uint64_t v5 = v2;
  unsigned int v6 = v1 + 523995289 * (&v4 ^ 0x98567068) - 2;
  uint64_t result = ((uint64_t (*)(uint64_t *))qword_26CE8FAB0[v1 + 59])(&v4);
  *(_DWORD *)(v2 + 4) = 462031038 - *(_DWORD *)(v2 + 4);
  return result;
}

uint64_t sub_21DC73C30(uint64_t a1)
{
  int v1 = 523995289 * (a1 ^ 0x98567068);
  int v2 = *(_DWORD *)(a1 + 8) - v1;
  int v3 = *(_DWORD *)(a1 + 12) ^ v1;
  int v4 = *(_DWORD *)(*(void *)(a1 + 24) + 4);
  if (v4 + 1916468129 >= 0) {
    int v4 = 462031038 - v4;
  }
  if ((v3 - 1430439603) < 4 * (unint64_t)(v4 - 231015519)) {
    int v5 = v2;
  }
  else {
    int v5 = v2 + 1;
  }
  return (*(uint64_t (**)(void))(qword_264479F60[v2 + 37] - 6 + 8 * v5))();
}

uint64_t sub_21DC73CC8()
{
  return (*(uint64_t (**)(void))(v0 + 8 * (v2 + 4 * (v1 != 1430439603))))();
}

uint64_t sub_21DC73CF0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v1 + 8 * (v3 - v4 + 4)))(a1, (v3 - v4 + 3), 897970625, v2);
}

uint64_t sub_21DC73E64(uint64_t result)
{
  *(_DWORD *)(result + 16) = v1;
  return result;
}

void sub_21DC73E6C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) - 520147679 * (a1 ^ 0xD061A127);
  __asm { BRAA            X11, X2 }
}

uint64_t sub_21DC7444C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11)
{
  if ((a11 - 1866192792) <= 0x80000001) {
    int v13 = v12;
  }
  else {
    int v13 = v12 + 1;
  }
  return (*(uint64_t (**)(void))(v11 + 8 * v13))();
}

uint64_t sub_21DC74498(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(void *)(v18 - 112) = a13;
  *(void *)(v18 - 104) = v15;
  *(_DWORD *)(v18 - 120) = v14 + 1836812333 * ((v18 - 136) ^ 0x4065F266) + 29;
  *(void *)(v18 - 136) = v15;
  *(void *)(v18 - 128) = a11;
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(v17 + 8 * (v14 + 18)))(v18 - 136);
  int v20 = v13 - 1865143816;
  if (v13 - 1865143816 < 0) {
    int v20 = v13 - 1865143815;
  }
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8
                                            * (v14
                                             + 19
                                             * ((((v20 & 0xDE77AF30) + ((v20 >> 1) ^ 0xEF3BD798) + 281290856) & a10) != 0))))(v19);
}

uint64_t sub_21DC74598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  int v21 = 520147679 * ((v20 - 136) ^ 0xD061A127);
  *(_DWORD *)(v20 - 120) = v18 - v21;
  *(_DWORD *)(v20 - 136) = v21 ^ 0x45D9ACB1;
  *(void *)(v20 - 128) = v16;
  (*(void (**)(uint64_t))(v19 + 8 * (v18 + 25)))(v20 - 136);
  *(void *)(v20 - 136) = a12;
  *(void *)(v20 - 128) = &a13;
  *(_DWORD *)(v20 - 120) = v18 + 523995289 * ((v20 - 136) ^ 0x98567068) + 1;
  (*(void (**)(uint64_t))(v19 + 8 * (v18 + 62)))(v20 - 136);
  *(void *)(v20 - 136) = a12;
  *(void *)(v20 - 128) = v16;
  *(_DWORD *)(v20 - 120) = v18 - ((v20 - 136) ^ v14) * v15;
  uint64_t v22 = (*(uint64_t (**)(uint64_t))(v19 + 8 * (v18 + 35)))(v20 - 136);
  return (*(uint64_t (**)(uint64_t))(v17
                                            + 8 * (int)(((*(_DWORD *)(v20 - 116) + v13) >> 31) + v18)))(v22);
}

uint64_t sub_21DC746BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  int v19 = 520147679 * ((v18 - 136) ^ 0xD061A127);
  *(_DWORD *)(v18 - 120) = v17 - 7 - v19;
  *(_DWORD *)(v18 - 136) = ((v15 ^ 0xF5DFADF2) + ((2 * v15) & 0xEBBF5BE4) + 1341783742) ^ v19;
  *(void *)(v18 - 128) = &a13;
  (*(void (**)(uint64_t))(v16 + 8 * (v17 + 18)))(v18 - 136);
  *(_DWORD *)(v18 - 120) = v17 - 7 - 1638185881 * ((v18 - 136) ^ 0x11FD620);
  *(void *)(v18 - 136) = a12;
  *(void *)(v18 - 128) = v13;
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(v16 + 8 * (v17 + 28)))(v18 - 136);
  return (*(uint64_t (**)(uint64_t))(v14
                                            + 8
                                            * (int)(((*(_DWORD *)(v18 - 116) + 556127643) >> 31) + v17 - 7)))(v20);
}

uint64_t sub_21DC747D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  *(_DWORD *)(v20 - 120) = v18 - ((v20 - 136) ^ v14) * v15 - 20;
  *(void *)(v20 - 136) = &a13;
  *(void *)(v20 - 128) = v16;
  uint64_t v21 = (*(uint64_t (**)(uint64_t))(v19 + 8 * (v18 + 15)))(v20 - 136);
  return (*(uint64_t (**)(uint64_t))(v17
                                            + 8 * (int)(v18 + ((*(_DWORD *)(v20 - 116) + v13) >> 31))))(v21);
}

uint64_t sub_21DC7485C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  int v11 = a1 - 12;
  *(void *)(v10 - 128) = &a6;
  *(void *)(v10 - 120) = v6;
  *(_DWORD *)(v10 - 136) = (a1 - 18) ^ (56516261 * ((v10 - 136) ^ 0x15EBF17D));
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(v9 + 8 * (a1 + 30)))(v10 - 136);
  if (v8 == 1) {
    int v13 = v11 + 1;
  }
  else {
    int v13 = v11;
  }
  return (*(uint64_t (**)(uint64_t))(v7 + 8 * v13))(v12);
}

uint64_t sub_21DC748E4@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1 + 8 * a1))();
}

uint64_t sub_21DC74914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  *(_DWORD *)(v19 - 120) = v17 - ((v19 - 136) ^ v13) * v15 - 7;
  *(void *)(v19 - 136) = a12;
  *(void *)(v19 - 128) = &a13;
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(v18 + 8 * (v17 + 28)))(v19 - 136);
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8
                                            * (v17 + 2 * ((*(_DWORD *)(v19 - 116) + v14) > 0x80000000))))(v20);
}

uint64_t sub_21DC74990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  int v21 = 520147679 * ((v20 - 136) ^ 0xD061A127);
  *(_DWORD *)(v20 - 120) = v19 - v21 - 25;
  *(void *)(v20 - 128) = &a13;
  *(_DWORD *)(v20 - 136) = ((v13 ^ 0x47DDBFF2) + ((2 * v13) & 0x8FBB7FE4) - 33821506) ^ v21;
  (*(void (**)(uint64_t))(v18 + 8 * v19))(v20 - 136);
  int v22 = v19 - 20;
  *(_DWORD *)(v20 - 120) = v22 - ((v20 - 136) ^ 0x11FD620) * v14 - 5;
  *(void *)(v20 - 136) = a12;
  *(void *)(v20 - 128) = v17;
  uint64_t v23 = (*(uint64_t (**)(uint64_t))(v18 + 8 * (v22 + 30)))(v20 - 136);
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8 * (int)(((*(_DWORD *)(v20 - 116) + v15) >> 31) + v22)))(v23);
}

uint64_t sub_21DC74A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  *(_DWORD *)(v20 - 120) = v18 - ((v20 - 136) ^ v13) * v14 - 3;
  *(void *)(v20 - 136) = &a13;
  *(void *)(v20 - 128) = v17;
  uint64_t v21 = (*(uint64_t (**)(uint64_t))(v19 + 8 * (v18 + 32)))(v20 - 136);
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8 * (int)(((*(_DWORD *)(v20 - 116) + v15) >> 31) + v18)))(v21);
}

uint64_t sub_21DC74AFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  *(void *)(v18 - 128) = &a13;
  *(void *)(v18 - 120) = v15;
  *(_DWORD *)(v18 - 136) = v17 ^ (56516261 * ((v18 - 136) ^ 0x15EBF17D));
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(v16 + 8 * (v17 + 48)))(v18 - 136);
  if (v13 == 1) {
    int v20 = v17 + 1;
  }
  else {
    int v20 = v17;
  }
  return (*(uint64_t (**)(uint64_t))(v14 + 8 * (v20 + 11)))(v19);
}

uint64_t sub_21DC74B84()
{
  return (*(uint64_t (**)(void))(v0 + 8 * (v1 + 11)))();
}

uint64_t sub_21DC74BBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  *(_DWORD *)(v19 - 120) = v17 - ((v19 - 136) ^ v13) * v14 - 14;
  *(void *)(v19 - 136) = a12;
  *(void *)(v19 - 128) = &a13;
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(v18 + 8 * (v17 + 21)))(v19 - 136);
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8
                                            * (v17 + 11 * ((*(_DWORD *)(v19 - 116) + v15) < 0x80000001))))(v20);
}

uint64_t sub_21DC74C40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  int v19 = 520147679 * ((v18 - 136) ^ 0xD061A127);
  *(_DWORD *)(v18 - 136) = ((v13 ^ 0xDFF9AFBC) + ((2 * v13) & 0xBFF35F78) + 1709178100) ^ v19;
  *(void *)(v18 - 128) = &a13;
  *(_DWORD *)(v18 - 120) = v16 - v19 - 10;
  (*(void (**)(uint64_t))(v17 + 8 * (v16 + 15)))(v18 - 136);
  *(_DWORD *)(v18 - 120) = v16 + 1 - 1638185881 * ((v18 - 136) ^ 0x11FD620) - 11;
  *(void *)(v18 - 136) = a12;
  *(void *)(v18 - 128) = v14;
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(v17 + 8 * (v16 + 25)))(v18 - 136);
  return (*(uint64_t (**)(uint64_t))(v15
                                            + 8
                                            * (int)(((*(_DWORD *)(v18 - 116) + 556127643) >> 31) + v16 + 1)))(v20);
}

uint64_t sub_21DC74D60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  *(void *)(v20 - 136) = &a13;
  *(void *)(v20 - 128) = v16;
  *(_DWORD *)(v20 - 120) = v19 - ((v20 - 136) ^ v13) * v15 - 17;
  uint64_t v21 = (*(uint64_t (**)(uint64_t))(v18 + 8 * (v19 + 18)))(v20 - 136);
  return (*(uint64_t (**)(uint64_t))(v17
                                            + 8 * (int)(v19 + ((*(_DWORD *)(v20 - 116) + v14) >> 31))))(v21);
}

uint64_t sub_21DC74DD4@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  int v11 = a1 + 6;
  *(_DWORD *)(v10 - 136) = (a1 - 15) ^ (56516261 * ((v10 - 136) ^ 0x15EBF17D));
  *(void *)(v10 - 128) = &a6;
  *(void *)(v10 - 120) = v7;
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(v9 + 8 * (a1 + 33)))(v10 - 136);
  if (v6 == 1) {
    int v13 = v11 + 1;
  }
  else {
    int v13 = v11;
  }
  return (*(uint64_t (**)(uint64_t))(v8 + 8 * v13))(v12);
}

void lLcAnSGNpbJv(uint64_t a1, int a2)
{
  if ((a2 & 0x3F000000) == 0x13000000) {
    int v2 = 4;
  }
  else {
    int v2 = 3;
  }
  __asm { BRAA            X9, X10 }
}

uint64_t sub_21DC74F98@<X0>(int a1@<W1>, int a2@<W8>, uint64_t a3)
{
  int v4 = (-1936509884 * a2) | 3;
  int v5 = a1 & 0xFFFFFF | 0x1000000;
  HIDWORD(a3) = (v4 + 1166996050) ^ (704005591 * (&a3 ^ 0xF7D78CF0));
  uint64_t v6 = ((uint64_t (*)(uint64_t *))qword_26CE8FAB0[v4 + 1936509941])(&a3);
  if (v5 <= 16781312)
  {
    switch(v5)
    {
      case 16777217:
        uint64_t v7 = 5;
        goto LABEL_17;
      case 16777218:
        uint64_t v7 = 7;
        goto LABEL_17;
      case 16777219:
        uint64_t v7 = 9;
        goto LABEL_17;
    }
    return (*(uint64_t (**)(uint64_t))(v3 + 24))(v6);
  }
  if (v5 > 16785409)
  {
    if (v5 == 16785410)
    {
      uint64_t v7 = 2;
      goto LABEL_17;
    }
    if (v5 == 16785411)
    {
      uint64_t v7 = 3;
      goto LABEL_17;
    }
    return (*(uint64_t (**)(uint64_t))(v3 + 24))(v6);
  }
  uint64_t v7 = 0;
  if (v5 != 16781313)
  {
    if (v5 == 16781314)
    {
      uint64_t v7 = 1;
      goto LABEL_17;
    }
    return (*(uint64_t (**)(uint64_t))(v3 + 24))(v6);
  }
LABEL_17:
  uint64_t v8 = qword_26CE8FAB8((*((_DWORD *)&unk_264479E68 + 6 * v7 + 4) - 1302691225));
  return (*(uint64_t (**)(uint64_t))(v3 + 8 * (4 * (v8 != 0) + 8)))(v8);
}

uint64_t sub_21DC752AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W8>)
{
  int v11 = a3 + v4 * (v9 + 14);
  unsigned int v12 = v10 - 1302691229;
  if (!v3) {
    unsigned int v12 = -4;
  }
  if (v5 == v8) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 4294967292;
  }
  if (v6 + 4 <= v6) {
    int v14 = v11;
  }
  else {
    int v14 = v11 + 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 8 * v14))(a1, a2, v13);
}

uint64_t sub_21DC75320()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (v0 + ((v2 != v1) | (4 * (v2 != v1))))))();
}

uint64_t sub_21DC75350()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (v2 + 8 * (v0 > 0x1F))))();
}

uint64_t sub_21DC75384()
{
  long long v4 = *(_OWORD *)((char *)v2 + 20);
  *int v2 = *(_OWORD *)((char *)v2 + 4);
  v2[1] = v4;
  if ((v0 & 0xFFFFFFE0) == 0x20) {
    ++v1;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * v1))();
}

uint64_t sub_21DC753BC()
{
  long long v4 = *(_OWORD *)((char *)v1 + 4);
  *(v1 - 1) = *(_OWORD *)((char *)v1 - 12);
  *int v1 = v4;
  if (v2) {
    int v5 = v0;
  }
  else {
    int v5 = v0 + 1;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * v5))();
}

uint64_t sub_21DC753EC()
{
  if (v1 == v0) {
    int v4 = v2 + 1;
  }
  else {
    int v4 = v2;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * v4))();
}

uint64_t sub_21DC75414@<X0>(uint64_t a1@<X8>)
{
  *(unsigned char *)(v3 + v2) = *(unsigned char *)(a1 + v2);
  return (*(uint64_t (**)(void))(v4 + 8 * (((v2 + 1 != v1) | (2 * (v2 + 1 != v1))) + v5 - 3)))();
}

uint64_t sub_21DC75450@<X0>(uint64_t a1@<X8>)
{
  *(unsigned char *)(v4 + v2) = *(unsigned char *)(a1 + v2);
  return (*(uint64_t (**)(void))(v5 + 8 * (((v2 + 1 != v1) | (2 * (v2 + 1 != v1))) + v3)))();
}

uint64_t sub_21DC75488()
{
  return 0;
}

uint64_t sub_21DC755DC(uint64_t a1, uint64_t a2, char a3)
{
  signed int v3 = ((char)((((char)((a3 - 83) * (a3 - 112)
                                                  - 110
                                                  * (((unint64_t)(156180629 * (char)((a3 - 83) * (a3 - 112))) >> 34)
                                                   + (156180629 * (char)((a3 - 83) * (a3 - 112)) < 0))) >> 2) & 0xE0)
                           - 64) >> 3) & 0x70 | 0xFFFFFF80;
  return ((uint64_t (*)(void))qword_26CE8FAB0[((((char)(((int)(((unint64_t)(2004318071 * v3) >> 32)
                                                                          - v3) >> 5)
                                                                   + ((int)(((unint64_t)(2004318071 * v3) >> 32)
                                                                          - v3) < 0)
                                                                   - 28)
                                                            % 88) >> 2) & 3 | 0xBC)
                                           - 151])();
}

uint64_t sub_21DC75734(uint64_t a1)
{
  return off_26CE8FC58(a1);
}

uint64_t sub_21DC757FC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 523995289 * (a1 ^ 0x98567068);
  if (*(void *)a1 == *(void *)(a1 + 8)) {
    int v2 = v1 + 1;
  }
  else {
    int v2 = *(_DWORD *)(a1 + 16) - 523995289 * (a1 ^ 0x98567068);
  }
  return (*(uint64_t (**)(void))(qword_264479F60[v1 + 57] - 2 + 8 * v2))();
}

uint64_t sub_21DC75848@<X0>(uint64_t a1@<X8>)
{
  int v4 = *(_DWORD *)(a1 + 4);
  if (v4 + 1916468129 < 0) {
    int v5 = *(_DWORD *)(a1 + 4);
  }
  else {
    int v5 = 462031038 - v4;
  }
  *(_DWORD *)(v1 + 4) = v4;
  if (v5 == 231015519) {
    int v6 = v3;
  }
  else {
    int v6 = v3 + 1;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * v6))();
}

uint64_t sub_21DC75894@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v1 + 8) + 4 * (v6 - 231015520)) = *(_DWORD *)(*(void *)(a1 + 8) + 4 * (v6 - 231015520));
  return (*(uint64_t (**)(void))(v2 + 8 * (v4 - v7 - 2 * v5 + 2 * (v6 - 1 == v3))))();
}

uint64_t sub_21DC758DC@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v1 + 8) + 4 * (v5 + v4)) = *(_DWORD *)(*(void *)(a1 + 8) + 4 * (v5 + v4));
  return (*(uint64_t (**)(void))(v2 + 8 * (v6 + 2 * (v5 - 1 == v3))))();
}

void Xzz3XGhEjs(uint64_t a1, int a2)
{
  __asm { BRAA            X8, X9 }
}

uint64_t sub_21DC759AC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, unsigned int a12)
{
  int v16 = a2 & 0xFFFFFF | 0x1000000;
  a12 = (v15 - 1036443534) ^ (704005591 * (&a11 ^ 0xF7D78CF0));
  uint64_t v17 = (*(uint64_t (**)(char *))(v12 + 8 * (v15 - 266929643)))(&a11);
  if (v16 <= 16781312)
  {
    switch(v16)
    {
      case 16777217:
        uint64_t v18 = 5;
        goto LABEL_17;
      case 16777218:
        uint64_t v18 = 7;
        goto LABEL_17;
      case 16777219:
        uint64_t v18 = 9;
        goto LABEL_17;
    }
    return (*(uint64_t (**)(uint64_t))(v13 + 136))(v17);
  }
  if (v16 > 16785409)
  {
    if (v16 == 16785410)
    {
      uint64_t v18 = 2;
      goto LABEL_17;
    }
    if (v16 == 16785411)
    {
      uint64_t v18 = 3;
      goto LABEL_17;
    }
    return (*(uint64_t (**)(uint64_t))(v13 + 136))(v17);
  }
  uint64_t v18 = 0;
  if (v16 != 16781313)
  {
    if (v16 == 16781314)
    {
      uint64_t v18 = 1;
      goto LABEL_17;
    }
    return (*(uint64_t (**)(uint64_t))(v13 + 136))(v17);
  }
LABEL_17:
  uint64_t v19 = (*(uint64_t (**)(void))(v12 + 8 * (v14 - 266929702)))((*(_DWORD *)(qword_264479F60[v14 - 266929642] - 11 + 24 * v18 + 16)
                                                                                         - 1302691225));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13
                                                              + 8
                                                              * (v14 - 266929702 + ((v19 != 0) | (2 * (v19 != 0))) + 14)))(v19, v20, v21);
}

void sub_21DC760A8(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = *(_DWORD *)(a1 + 12) + 1748787863 * (a1 ^ 0x81BAC106);
  uint64_t v4 = *(void *)a1;
  v3[0] = (523995289 * (v3 ^ 0x98567068)) ^ (v1 + 1);
  ((void (*)(_DWORD *))qword_26CE8FAB0[v1 + 39])(v3);
  if (v3[1] == 851002806) {
    int v2 = v1 + 1;
  }
  else {
    int v2 = v1;
  }
  __asm { BRAA            X8, X9 }
}

void sub_21DC76184()
{
  if ((*(_DWORD *)(v2 + 4) + 1916468129) <= 0x80000000) {
    int v3 = v1;
  }
  else {
    int v3 = v1 + 2;
  }
  *(_DWORD *)(v0 + 8) = v3;
}

void sub_21DC761E4(uint64_t a1)
{
  __asm { BRAA            X11, X13 }
}

uint64_t sub_21DC76250@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  if (v9 == 1534303178) {
    int v10 = v7 - 6 * v8 + 1;
  }
  else {
    int v10 = v7 - 6 * v8;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a7 + 8 * v10))(a1, a2, a3, a4, a5, a6, 897970625, 231015519);
}

uint64_t sub_21DC762B8@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8 * (v1 - 5)))();
}

uint64_t sub_21DC763AC@<X0>(int a1@<W4>, int a2@<W7>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(void))(a3 + 8 * (a2 + (v4 != v3) * a1)))();
}

uint64_t sub_21DC763D4@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8 * (v1 + 4 * (v2 != 0))))();
}

void sub_21DC763F8(int a1@<W6>, int a2@<W7>, uint64_t a3@<X8>)
{
  int v6 = a2 + v4;
  int v7 = a2 + 1;
  *(_DWORD *)(*(void *)(v3 + 8) + 4 * v6) = a1;
  int v8 = v5 - 8;
  *(_DWORD *)(v3 + 4) = v7;
  int v9 = 462031038 - v7;
  if (v7 + 1916468129 < 0) {
    int v9 = v7;
  }
  __asm { BRAA            X2, X3 }
}

uint64_t sub_21DC76470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v8 = *(_DWORD *)(*(void *)(v2 + 8) + 4 * (v3 + v5 - 1));
  return (*(uint64_t (**)(uint64_t, void))(a2 + 8 * (v7 + 2 * (v8 == v4))))(a1, v7 + (v8 != v4) * v6);
}

uint64_t sub_21DC764A0@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, void))(a3 + 8 * (int)(a2 + ((v3 - 1 + v4) >> 31))))(a1, a2 + 6 * (v3 - 1 + v4 >= 0));
}

uint64_t sub_21DC764CC@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  if (v2 <= 0x80000000) {
    int v3 = a1;
  }
  else {
    int v3 = a1 + 1;
  }
  return (*(uint64_t (**)(void))(a2 + 8 * v3))();
}

void sub_21DC76510(_DWORD *a1)
{
  unsigned int v1 = a1[4] - 1836812333 * (a1 ^ 0x4065F266);
  if (*(_DWORD *)(*(void *)a1 + 4) == 231015519) {
    unsigned int v2 = v1 + 1;
  }
  else {
    unsigned int v2 = a1[4] - 1836812333 * (a1 ^ 0x4065F266);
  }
  __asm { BRAA            X13, X14 }
}

void sub_21DC765EC()
{
  *(_DWORD *)(v1 + 4) = v0;
}

void sub_21DC773AC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) ^ (704005591 * (a1 ^ 0xF7D78CF0));
  int v2 = *(_DWORD *)(*(void *)(a1 + 24) + 4);
  int v3 = 462031038 - v2;
  if (v2 + 1916468129 < 0) {
    int v3 = *(_DWORD *)(*(void *)(a1 + 24) + 4);
  }
  uint64_t v4 = qword_264479F60[v1 + 37];
  if ((v3 + 1916468129) > 0x80000000) {
    ++v1;
  }
  __asm { BRAA            X10, X2 }
}

uint64_t sub_21DC774A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  int v14 = v13 - 7;
  int v15 = a11 + 1709098632;
  if (a11 + 1709098632 < -207369497 != v11 + 1709098632 < -207369497) {
    BOOL v16 = v15 < -207369497;
  }
  else {
    BOOL v16 = v11 + 1709098632 < v15;
  }
  return (*(uint64_t (**)(void))(v12 + 8 * (v14 + 8 * v16)))();
}

uint64_t sub_21DC775B4(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  int v21 = v20 + 1;
  BOOL v22 = a3 < a8;
  int v23 = v11 + a2 + *(_DWORD *)(v12 + 4 * v8) + v9 + (*(_DWORD *)(*(void *)(v13 + 8) + 4 * v17) + v9) * a6;
  *(_DWORD *)(v12 + 4 * v8) = (v23 ^ v14) + (v15 & (2 * v23)) + v16;
  if (v22 == v17 + 1 > v19) {
    BOOL v22 = v17 + v18 < a3;
  }
  return (*(uint64_t (**)(void))(v10 + 8 * (v21 + 6 * v22)))();
}

void sub_21DC77654()
{
}

uint64_t sub_21DC7765C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v6
                                                                                                 + 8
                                                                                                 * (7 * (v7 != 0x3054D7EAF180A5CELL)
                                                                                                  + v8)))(a1, a2, a3, a4, a5, a6, ((v7 == 0x3054D7EAF180A5CELL) | (4 * (v7 == 0x3054D7EAF180A5CELL)))+ v8- (v7 != 0x3054D7EAF180A5CELL));
}

uint64_t sub_21DC7769C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  int v13 = a7 + 5;
  BOOL v14 = a11 + 403333195 < -1513134934;
  if (v14 == v11 + 403333195 < -1513134934) {
    BOOL v14 = v11 + 403333195 < a11 + 403333195;
  }
  return (*(uint64_t (**)(void))(v12 + 8 * (v13 + 6 * v14)))();
}

uint64_t sub_21DC77758(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  int v17 = v14 - 5;
  int v18 = *(_DWORD *)(v8 + 4 * v15);
  *(_DWORD *)(v8 + 4 * v15) = ((v11 + 243227186 + v18 + v9) ^ a4) + (a5 & (2 * (v11 + 243227186 + v18 + v9))) + a6;
  if ((a8 ^ ((v11 - 0x3054D7EAF180A5CELL + (unint64_t)(v18 + v9)) >> 32))
     + (v12 & ((v11 - 0x3054D7EAF180A5CELL + (unint64_t)(v18 + v9)) >> 31))
     + v13 == v16)
    int v19 = v17 + 1;
  else {
    int v19 = v17;
  }
  return (*(uint64_t (**)(void))(v10 + 8 * v19))();
}

uint64_t sub_21DC777D8@<X0>(int a1@<W6>, uint64_t a2@<X8>)
{
  int v4 = *(_DWORD *)(a2 + 4) + 813804453;
  int v5 = (v2 + 813804453 < -1102663676) ^ (v4 < -1102663676);
  BOOL v6 = v2 + 813804453 > v4;
  if (v5) {
    BOOL v6 = v2 + 813804453 < -1102663676;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * (v6 + a1)))();
}

void sub_21DC77850(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v1 = *(_DWORD *)a1 + 1638185881 * (a1 ^ 0x11FD620);
  int v2 = *(_DWORD *)(*(void *)(a1 + 24) + 4);
  if (v2 + 1916468129 < 0) {
    int v3 = *(_DWORD *)(*(void *)(a1 + 24) + 4);
  }
  else {
    int v3 = 462031038 - v2;
  }
  int v4 = *(_DWORD *)(*(void *)(a1 + 8) + 4);
  if (v4 + 1916468129 < 0) {
    int v5 = *(_DWORD *)(*(void *)(a1 + 8) + 4);
  }
  else {
    int v5 = 462031038 - v4;
  }
  uint64_t v8 = *(void *)(a1 + 24);
  unsigned int v9 = v1 - 1748787863 * (&v8 ^ 0x81BAC106) - 6;
  ((void (*)(uint64_t *))qword_26CE8FAB0[v1 + 8])(&v8);
  BOOL v6 = v3 + 1283520354 < v5 + 1283520354;
  if (v3 + 1283520354 < -632947775 != v5 + 1283520354 < -632947775) {
    BOOL v6 = v5 + 1283520354 < -632947775;
  }
  if (v6) {
    int v7 = v3;
  }
  else {
    int v7 = v5;
  }
  __asm { BRAA            X13, X15 }
}

uint64_t sub_21DC77A00()
{
  int v8 = v2 + 1564212715;
  int v9 = v3 - 1;
  BOOL v10 = v8 < -352255414;
  uint64_t v11 = 4 * (v5 + v4);
  int v12 = *(_DWORD *)(*(void *)(v7 + 8) + v11) - *(_DWORD *)(*(void *)(v6 + 8) + v11);
  *(_DWORD *)(*(void *)(v0 + 8) + v11) = (v12 ^ 0xBF8FFBF5) + ((2 * v12) & 0x7F1FF7EA) + 1979053516;
  if (v10 == v5 + 514330435 < -352255414) {
    BOOL v10 = v5 + 514330435 < v8;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(v1 + 8 * (v10 + v9)))(3213884405, 2132801514, 1979053516, 0xB3FFFF7FE99EEFEBLL, 0x1D33DDFD6, 0x5D578FCB9EFFFBF8, 514330435);
}

uint64_t sub_21DC77B28()
{
  BOOL v4 = v3 - 60981110 < -1977449239;
  if (v4 == v2 - 1110863391 < -1977449239) {
    BOOL v4 = v2 - 1110863391 < v3 - 60981110;
  }
  return (*(uint64_t (**)(void))(v0 + 8 * (v4 + v1)))();
}

uint64_t sub_21DC77B90(uint64_t a1, uint64_t a2, int a3)
{
  int v14 = v6 & ~__ROR4__(v10, 18);
  int v15 = a3 - 14;
  int v16 = *(_DWORD *)(*(void *)(v13 + 8) + 4 * (v12 + v11));
  *(_DWORD *)(*(void *)(v3 + 8) + 4 * (v12 + v11)) = ((v6 + 2002850844 + v16 - 897970625) ^ 0x7DDDF3E9)
                                                       + ((2 * (v6 + 2002850844 + v16 - 897970625)) & 0xFBBBE7D2)
                                                       - 1213727272;
  int v17 = v5 + v12 + 1;
  int v18 = (v14 < v7) ^ (v17 < v7);
  BOOL v19 = v17 < v14;
  if (v18) {
    BOOL v19 = v14 < v7;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v4 + 8 * (v15 + v19 * v8)))(3396996671, 2111697897, v15 + !v19 * v9, 4223395794, 3081240024, 0x3B7F8FEBAE9EEFF7, 0x15D3DDFEELL, 0xD5D7FF5FD9FFFBECLL);
}

uint64_t sub_21DC77C84(uint64_t a1, uint64_t a2, int a3)
{
  BOOL v6 = v4 - 943241842 < v5 + 106640439;
  if (v5 + 106640439 < -1809827690 != v4 - 943241842 < -1809827690) {
    BOOL v6 = v5 + 106640439 < -1809827690;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * (a3 + 4 * v6)))();
}

uint64_t sub_21DC77CEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  __asm { SUBG            X29, X12, #0x2E0, #5 }
  int v22 = a7 - 1;
  int v23 = *(_DWORD *)(*(void *)(v16 + 8) + 4 * (v15 + v14));
  *(_DWORD *)(*(void *)(v7 + 8) + 4 * (v15 + v14)) = ((_X12 + v9 - v23 + 2002850845) ^ 0xF7CFFBF5)
                                                       + ((2 * (_X12 + v9 - v23 + 2002850845)) & 0xEF9FF7EA)
                                                       + 1035335116;
  int v24 = v11 + v15 + 1;
  int v25 = (v13 < v12) ^ (v24 < v12);
  BOOL v26 = v24 < v13;
  if (v25) {
    BOOL v26 = v13 < v12;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v8 + 8 * (v26 + v22)))(4020238314, 1035335116, 0x757FBFDBF89EFFEFLL, 0x1F13DFFDELL, 0x9BD7CF6F8FFFEBF4);
}

void sub_21DC78088(_DWORD *a1)
{
  unsigned int v1 = 520147679 * (a1 ^ 0xD061A127);
  unsigned int v2 = a1[4] + v1;
  if ((*a1 ^ v1) + 975590224 <= 0x80000000) {
    unsigned int v3 = a1[4] + v1;
  }
  else {
    unsigned int v3 = v2 + 1;
  }
  __asm { BRAA            X13, X14 }
}

uint64_t sub_21DC7812C@<X0>(int a1@<W8>)
{
  int v4 = (v3 + 1951180448) & 0x6D359F58;
  unsigned int v5 = 2145031067 * (&v7 ^ 0x1E282685);
  int v8 = a1 ^ v5;
  int v9 = v2 - v5 - v4 - 255778052;
  uint64_t v7 = v1;
  return ((uint64_t (*)(uint64_t *))qword_26CE8FAB0[a1 + 22])(&v7);
}

uint64_t sub_21DC7824C()
{
  return 128;
}

void sub_21DC78254(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v1 = *(_DWORD *)(a1 + 16) - 520147679 * (a1 ^ 0xD061A127);
  uint64_t v2 = *(void *)(a1 + 8);
  v4[0] = (523995289 * (v4 ^ 0x98567068)) ^ (v1 - 2);
  uint64_t v5 = v2;
  ((void (*)(_DWORD *))qword_26CE8FAB0[v1 + 36])(v4);
  if (v4[1] == 851002806) {
    int v3 = v1 + 1;
  }
  else {
    int v3 = v1;
  }
  __asm { BRAA            X9, X10 }
}

uint64_t sub_21DC7835C@<X0>(uint64_t a1@<X8>)
{
  signed int v6 = (((v5 - v4) >> 4) & 0xE6DBAFA ^ 0x2058A08)
     + (((v5 - v4) >> 5) ^ 0xEE743879)
     - 1931757750;
  if (v2 + 1850577000 < -65891129 != v6 < -65891129) {
    BOOL v7 = v2 + 1850577000 < -65891129;
  }
  else {
    BOOL v7 = v2 + 1850577000 > v6;
  }
  return (*(uint64_t (**)(void))(a1 + 8 * (v3 + 6 * v1 + v7)))();
}

uint64_t sub_21DC783E4@<X0>(uint64_t a1@<X8>)
{
  int v4 = -6 * (v3 ^ 1) - 2 * v3 + v2;
  if ((v1 & 0x1F) != 0xD) {
    int v5 = v4;
  }
  else {
    int v5 = v4 + 1;
  }
  return (*(uint64_t (**)(void))(a1 + 8 * v5))();
}

uint64_t sub_21DC78440@<X0>(uint64_t a1@<X8>)
{
  int v6 = v1 + 1005582247;
  int v7 = *(_DWORD *)(v4 + 4);
  if (v7 + v5 < 0) {
    int v6 = 442348193 - v1;
  }
  *(_DWORD *)(v4 + 4) = v7 + v6 - 723965220;
  int v8 = v2 + 923521478;
  BOOL v9 = v8 < -992946651;
  **(_DWORD **)(v4 + 8) = *(_DWORD *)(*(void *)(v4 + 8) + 4 * (v1 + 281617027));
  if (v8 >= -992946651) {
    BOOL v9 = v8 > 1154536998;
  }
  return (*(uint64_t (**)(BOOL))(a1 + 8 * (!v9 + v3)))(v8 > 1154536998);
}

void sub_21DC78504()
{
}

void sub_21DC7850C()
{
  *(_DWORD *)(v0 + 4) = 231015519;
}

void nvIb10An(uint64_t a1, int a2)
{
  if ((a2 & 0x3F000000) == 0x13000000) {
    int v2 = 10;
  }
  else {
    int v2 = 9;
  }
  __asm { BRAA            X10, X11 }
}

uint64_t sub_21DC78780@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8
                                                                                         + 8
                                                                                         * (11 * v7
                                                                                          + 1602850950 * a7
                                                                                          + 1
                                                                                          + 15
                                                                                          * (((((2 * (int)a2) & 0xE27FB6 | 0x2000000)
                                                                                             + (a2 & 0xFFFFFF ^ 0x4C713FDB)
                                                                                             + 42909733) & 0x3000000) == 0x1000000))))(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_21DC78864()
{
  return v0();
}

uint64_t sub_21DC7886C()
{
  return (*(uint64_t (**)(void))(v4 + 8 * (v1 + 14 * (v3 == v0) + v2)))();
}

void sub_21DC793C4(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 16) + 4);
  if (v2 + 1916468129 < 0) {
    int v3 = *(_DWORD *)(*(void *)(a1 + 16) + 4);
  }
  else {
    int v3 = 462031038 - v2;
  }
  int v4 = *(_DWORD *)(*(void *)a1 + 4);
  if (v4 + 1916468129 < 0) {
    int v5 = *(_DWORD *)(*(void *)a1 + 4);
  }
  else {
    int v5 = 462031038 - v4;
  }
  int v1 = *(_DWORD *)(a1 + 8) + 191237807 * (a1 ^ 0xDBC9B6B1);
  __asm { BRAA            X14, X16 }
}

void sub_21DC794A8()
{
  *(_DWORD *)(v1 + 4) = v0;
}

uint64_t sub_21DC79894@<X0>(int a1@<W2>, uint64_t a2@<X8>)
{
  if (*(_DWORD *)(*(void *)(a2 + 8) + 4 * (v5 + 1 + v4)) != v3) {
    ++a1;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * a1))();
}

uint64_t sub_21DC798D0(uint64_t a1, int a2)
{
  if ((v3 + v4) <= 0x80000000) {
    int v5 = a2;
  }
  else {
    int v5 = a2 + 1;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * v5))();
}

uint64_t sub_21DC7990C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v17 = 4 * (v15 + v14);
  int v18 = (**(_DWORD **)(v16 + 8) - 897970625) * (a4 - 897970625) + *(_DWORD *)(a12 + v17) - 897970625;
  *(_DWORD *)(a12 + v17) = (v18 ^ 0xF7EFFBDB) + ((2 * v18) & 0xEFDFF7B6) + 1033237990;
  BOOL v19 = v13 + 260720805 > 491736325;
  if (v13 + 260720805 < -1655747324) {
    BOOL v19 = 1;
  }
  return (*(uint64_t (**)(void))(v12 + 8 * (v19 + a5 - 1)))();
}

void sub_21DC799E8()
{
}

void sub_21DC799F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(_DWORD *)(a12 + 4 * a1) = 897970625;
  JUMPOUT(0x21DC79A4CLL);
}

void sub_21DC79AA0(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 8) + 4) + 980327533;
  int v3 = *(_DWORD *)(*(void *)a1 + 4) + 980327533;
  int v4 = (v2 < -936140596) ^ (v3 < -936140596);
  BOOL v5 = v2 > v3;
  if (v4) {
    BOOL v6 = v2 < -936140596;
  }
  else {
    BOOL v6 = v5;
  }
  int v1 = *(_DWORD *)(a1 + 16) + 1638185881 * (a1 ^ 0x11FD620);
  __asm { BRAA            X15, X16 }
}

uint64_t sub_21DC79B38(uint64_t a1, int a2)
{
  int v6 = (v5 ^ 1) + v3;
  int v7 = v4 + 222474386;
  BOOL v8 = v7 < -1693993743;
  BOOL v9 = a2 + 222474386 < v7;
  if (a2 + 222474386 < -1693993743 != v8) {
    BOOL v9 = v8;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * (int)(v6 + (!v9 & 0xFFFFFFFB | (4 * !v9)))))();
}

uint64_t sub_21DC79BA0(uint64_t a1, int a2)
{
  if (a2 + 1916468129 < 0) {
    int v6 = a2;
  }
  else {
    int v6 = 462031038 - a2;
  }
  return (*(uint64_t (**)(uint64_t, void, void))(v2
                                                            + 8
                                                            * (int)(2 * v5
                                                                  - v4
                                                                  + v3
                                                                  - 2
                                                                  + ((v6 + 1916468128) >> 31))))(a1, (v6 - 1), (2 * v5 - v4 + v3 - 2 + (~(v6 + 1916468128) >> 31)));
}

uint64_t sub_21DC79C20(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v9 = 4 * (a4 - 231015520);
  unsigned int v10 = *(_DWORD *)(*(void *)(v5 + 8) + v9) + v8;
  unsigned int v11 = *(_DWORD *)(*(void *)(v4 + 8) + v9) + v8;
  BOOL v12 = v10 < v7;
  BOOL v13 = v10 > v11;
  if (v12 != v11 < v7) {
    BOOL v14 = v12;
  }
  else {
    BOOL v14 = v13;
  }
  return (*(uint64_t (**)(void))(v6 + 8 * (int)((!v14 & 0xFFFFFFFD | (2 * !v14)) + a3)))();
}

uint64_t sub_21DC79C8C(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  int v11 = a3 - a7 + 2 * a8;
  unsigned int v12 = a4 + v10;
  unsigned int v13 = a6 + v10;
  BOOL v14 = a6 + v10 < v9;
  int v15 = (v12 < v9) ^ v14;
  BOOL v16 = v12 < v13;
  if (v15) {
    BOOL v16 = v14;
  }
  return (*(uint64_t (**)(void))(v8 + 8 * (v11 + 2 * v16)))();
}

uint64_t sub_21DC79CD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, int a5@<W8>)
{
  return (*(uint64_t (**)(uint64_t, void, void, uint64_t, void))(v5
                                                                             + 8
                                                                             * (int)(a3
                                                                                   - 2 * (a4 + (a4 ^ 1))
                                                                                   + ((a2 + v6) >> 31))))(a1, (a2 - 1), a3 - 2 * (a4 + (a4 ^ 1u)) + (~((int)a2 + v6) >> 31), a2, (a5 + 1));
}

uint64_t sub_21DC79D08(uint64_t result)
{
  *(_DWORD *)(result + 20) = -1112255286 - v1;
  return result;
}

uint64_t sub_21DC79D20(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8);
  **(_DWORD **)(v1 + 8) = 897970626;
  *(_DWORD *)(v1 + 4) = 231015520;
  return result;
}

uint64_t sub_21DC79D44()
{
  return 1;
}

uint64_t sub_21DC79D4C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return off_26CE8F3D8[(a2 != 0 && a3 == 8) & (a4 == 100)]();
}

uint64_t sub_21DC79D84(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 0;
  **(_DWORD **)(a1 + 24) = *a2 - ((2 * *a2) & 0x8224C6E8) + 1091724148;
  return result;
}

uint64_t sub_21DC79DB8()
{
  return 4294967246;
}

uint64_t sub_21DC79DC0(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 8) + 4);
  if (v2 + 1916468129 < 0) {
    int v3 = *(_DWORD *)(*(void *)(a1 + 8) + 4);
  }
  else {
    int v3 = 462031038 - v2;
  }
  int v1 = (*(_DWORD *)a1 ^ (523995289 * (a1 ^ 0x98567068))) - 1;
  return (*(uint64_t (**)(void))(qword_264479F60[v1 + 34]
                              - 10
                              + 8 * (v1 + 2 * ((v3 + 1916468129) > 0x80000000))))();
}

uint64_t sub_21DC79E64()
{
  if (*(_DWORD *)(*(void *)(v0 + 8) + 4 * v1) == 897970625) {
    ++v2;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * v2))();
}

uint64_t sub_21DC79E94()
{
  return (*(uint64_t (**)(void))(*(void *)(v1 + 8 * (v2 + 34))
                              - 10
                              + 8 * (v2 + 2 * ((v0 - 1) > 0x80000000))))();
}

uint64_t sub_21DC79ED4(uint64_t result)
{
  *(_DWORD *)(result + 4) = v1;
  return result;
}

void sub_21DC79EE0(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 ^ (191237807 * (a1 ^ 0xDBC9B6B1));
  if (*(_DWORD *)(*(void *)(a1 + 8) + 4) == 231015519) {
    int v2 = *(_DWORD *)a1 ^ (191237807 * (a1 ^ 0xDBC9B6B1));
  }
  else {
    int v2 = v1 + 1;
  }
  __asm { BRAA            X14, X15 }
}

uint64_t sub_21DC79F5C(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(a1 + 16) + 4) == v3) {
    int v5 = v1 + 2 * v4 + 1;
  }
  else {
    int v5 = v1 + 2 * v4;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * v5))();
}

uint64_t sub_21DC79F8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = a1;
  uint64_t v5 = v1;
  unsigned int v6 = v2 + 523995289 * (&v4 ^ 0x98567068) - 1;
  return ((uint64_t (*)(uint64_t *))qword_26CE8FAB0[v2 + 60])(&v4);
}

uint64_t sub_21DC7A0CC(_DWORD *a1)
{
  unsigned int v1 = 1748787863 * (a1 ^ 0x81BAC106);
  unsigned int v2 = a1[2] - v1;
  int v3 = a1[3] ^ v1;
  if (v3 + 1219647055 >= 0) {
    int v3 = 1855673186 - v3;
  }
  int v4 = *(_DWORD *)(*(void *)a1 + 4);
  if (v4 + 1916468129 >= 0) {
    int v4 = 462031038 - v4;
  }
  return (*(uint64_t (**)(void))(qword_264479F60[v2 + 41]
                              + 8
                              * (int)((v4 + 1498491483 < -417976646
                                    || (int)(((v3 - 927836593) >> 5) + 1729507002) < v4 + 1498491483)
                                    + v2)
                              - 7))();
}

uint64_t sub_21DC7A1A0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(result + 16) = (((*(_DWORD *)(*(void *)(a2 + 8) + 4 * v3) - 897970625) >> (v2 + 15)) & 1 | 0x43DF7EBC)
                           - 1132724272;
  return result;
}

uint64_t sub_21DC7A1DC(uint64_t result)
{
  *(_DWORD *)(result + 16) = 5996172;
  return result;
}

void sub_21DC7A1F0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40) + 704005591 * (a1 ^ 0xF7D78CF0);
  if ((*(_DWORD *)(*(void *)(a1 + 32) + 4) - 231015519) * (*(_DWORD *)(*(void *)(a1 + 16) + 4) - 231015519)) {
    int v2 = *(_DWORD *)(a1 + 40) + 704005591 * (a1 ^ 0xF7D78CF0);
  }
  else {
    int v2 = v1 + 1;
  }
  __asm { BRAA            X17, X1 }
}

void sub_21DC7A2E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)(a4 + 4) = v4;
}

uint64_t sub_21DC7B124(uint64_t result)
{
  **(_DWORD **)(result + 24) = 1091724148;
  return result;
}

int *sub_21DC7B138(int *result)
{
  if (((result[2] ^ (520147679 * (result ^ 0x5061A127))) & 0x40000000) != 0) {
    int v1 = 335071851;
  }
  else {
    int v1 = 335071852;
  }
  *uint64_t result = v1;
  return result;
}

void sub_21DC7B170(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v1 = *(_DWORD *)(a1 + 24) + 56516261 * (a1 ^ 0x15EBF17D);
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = *(_DWORD *)(v2 + 4);
  if (v3 + 1916468129 < 0) {
    int v4 = *(_DWORD *)(v2 + 4);
  }
  else {
    int v4 = 462031038 - v3;
  }
  int v5 = *(_DWORD *)(*(void *)(a1 + 16) + 4);
  if (v5 + 1916468129 < 0) {
    int v6 = *(_DWORD *)(*(void *)(a1 + 16) + 4);
  }
  else {
    int v6 = 462031038 - v5;
  }
  int v11 = v1 - 1748787863 * (&v10 ^ 0x81BAC106);
  uint64_t v10 = v2;
  ((void (*)(uint64_t *))qword_26CE8FAB0[v1 + 14])(&v10);
  BOOL v7 = v4 + 1832243934 < v6 + 1832243934;
  if (v4 + 1832243934 < -84224195 != v6 + 1832243934 < -84224195) {
    BOOL v7 = v6 + 1832243934 < -84224195;
  }
  if (v7) {
    int v8 = v4;
  }
  else {
    int v8 = v6;
  }
  if ((v8 + 1916468129) <= 0x80000000) {
    int v9 = v1;
  }
  else {
    int v9 = v1 + 1;
  }
  __asm { BRAA            X13, X15 }
}

uint64_t sub_21DC7B328()
{
  int v11 = v3 + 494334512;
  int v12 = v4 - 6;
  BOOL v13 = v11 < -1422133617;
  uint64_t v14 = 4 * (v9 + v5);
  int v15 = v6 - 1954314156 + *(_DWORD *)(*(void *)(v10 + 8) + v14) + v7 + *(_DWORD *)(*(void *)(v8 + 8) + v14) + v7;
  *(_DWORD *)(*(void *)(v0 + 8) + v14) = (v15 ^ 0x3587F7E5) + ((2 * v15) & 0x6B0FEFCA) - 132644;
  if (v13 == v9 - 889120180 < -1422133617) {
    BOOL v13 = v9 - 889120180 < v11;
  }
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(v1 + 8 * (v12 + v13 * v2)))(4294834652, 0xDFFFEF2E9FC3BE5ELL, 0x13F877CBCLL, 0x23D29DDDEBBFC9F6, 3405847116);
}

void sub_21DC7B434()
{
  atomic_load_explicit((atomic_uint *volatile)(v0 - 116), memory_order_acquire);
  JUMPOUT(0x21DC7B3A0);
}

uint64_t sub_21DC7B43C()
{
  if (v3 + 1611036276 < -305431853 != v2 + 227581583 < -305431853) {
    BOOL v4 = v3 + 1611036276 < -305431853;
  }
  else {
    BOOL v4 = v2 + 227581583 < v3 + 1611036276;
  }
  return (*(uint64_t (**)(void))(v0 + 8 * (v1 + 8 * v4)))();
}

uint64_t sub_21DC7B49C()
{
  BOOL v12 = v6 < v4;
  int v13 = v5 + v10 + 1;
  int v14 = v12 ^ (v13 < v4);
  BOOL v15 = v13 < v6;
  if (!v14) {
    BOOL v12 = v15;
  }
  uint64_t v16 = 4 * (v10 + v7);
  int v17 = v2 + v8 + *(_DWORD *)(*(void *)(v11 + 8) + v16) + v9;
  *(_DWORD *)(*(void *)(v0 + 8) + v16) = (v17 ^ 0xFD9FF9C3) + ((2 * v17) & 0xFB3FF386) + 937818110;
  return (*(uint64_t (**)(void))(v1 + 8 * (v3 + v12 + 2)))();
}

uint64_t sub_21DC7B574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v8 = v6 - 1250431509 < v7 + 133023184;
  if (v7 + 133023184 < -1783444945 != v6 - 1250431509 < -1783444945) {
    BOOL v8 = v7 + 133023184 < -1783444945;
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, void))(v4
                                                                              + 8
                                                                              * (int)((v8 & 0xFFFFFFFD | (2 * v8)) + v5)))((v8 + v5), a2, a3, a4, v8 + v5 + 4 * !v8);
}

uint64_t sub_21DC7B5D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v16 = a5 - 1;
  int v17 = *(_DWORD *)(*(void *)(v14 + 8) + 4 * (v15 + v11));
  *(_DWORD *)(*(void *)(v5 + 8) + 4 * (v15 + v11)) = ((v7 + v12 + v17 + v13) ^ 0x7FD5FDC1)
                                                       + ((2 * (v7 + v12 + v17 + v13)) & 0xFFABFB82)
                                                       - 1246759936;
  int v18 = v8 + v15 + 1;
  int v19 = (v10 < v9) ^ (v18 < v9);
  BOOL v20 = v18 < v10;
  if (v19) {
    BOOL v20 = v10 < v9;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v6 + 8 * (v20 + v16)))(0x17F78FEF9F87C957, 0x13F0F92AELL, 0xEBDAFD1CEBFBBEFDLL);
}

uint64_t sub_21DC7B6B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (v6 == 0x3D28D0C8B838854) {
    int v7 = a5 + 1;
  }
  else {
    int v7 = a5;
  }
  return (*(uint64_t (**)(void))(v5 + 8 * v7))();
}

void sub_21DC7B6D4(int a1@<W8>)
{
  *(_DWORD *)(v1 + 4) = (((v3 + v2) * (a1 - 741032970)) ^ 0x2DC51DFF)
                      + ((2 * (v3 + v2) * (a1 - 741032970)) & 0x5B8A3BFE)
                      - 536877472;
}

void sub_21DC7B798(uint64_t a1)
{
  __asm { BRAA            X11, X13 }
}

uint64_t sub_21DC7B804@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  if (v8 == 1281732227) {
    signed int v9 = (v7 & 0xFFFFFFF7 | (8 * (v7 & 1))) + v6;
  }
  else {
    signed int v9 = (v7 & 0xFFFFFFF7 | (8 * (v7 & 1))) + v6 + 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 8 * v9))(a1, a2, a3, a4, a5, 897970625, 231015519);
}

uint64_t sub_21DC7B864@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8 * (v1 - 2)))();
}

uint64_t sub_21DC7B95C@<X0>(int a1@<W6>, int a2@<W7>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(void))(a3 + 8 * (a1 + ((a2 == v3) | (2 * (a2 == v3))))))();
}

uint64_t sub_21DC7B988@<X0>(uint64_t a1@<X8>)
{
  if (v2) {
    int v3 = v1 + 1;
  }
  else {
    int v3 = v1;
  }
  return (*(uint64_t (**)(void))(a1 + 8 * v3))();
}

void sub_21DC7B9A4(int a1@<W5>, int a2@<W6>, uint64_t a3@<X8>)
{
  int v6 = a2 + v4;
  int v7 = a2 + 1;
  *(_DWORD *)(*(void *)(v3 + 8) + 4 * v6) = a1;
  int v8 = v5 - 6;
  *(_DWORD *)(v3 + 4) = v7;
  int v9 = 462031038 - v7;
  if (v7 + 1916468129 < 0) {
    int v9 = v7;
  }
  __asm { BRAA            X2, X3 }
}

uint64_t sub_21DC7BA1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v8 = *(_DWORD *)(*(void *)(v2 + 8) + 4 * (v3 + v5 - 1));
  return (*(uint64_t (**)(uint64_t, void))(a2 + 8 * (v7 + 2 * (v8 == v4))))(a1, v7 + (v8 != v4) * v6);
}

uint64_t sub_21DC7BA4C@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, void))(a3 + 8 * (int)(a2 + ((v3 - 1 + v4) >> 31))))(a1, a2 + 10 * (v3 - 1 + v4 >= 0));
}

uint64_t sub_21DC7BA78@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  if (v2 <= 0x80000000) {
    int v3 = a1;
  }
  else {
    int v3 = a1 + 1;
  }
  return (*(uint64_t (**)(void))(a2 + 8 * v3))();
}

_DWORD *sub_21DC7BA98(_DWORD *result)
{
  *(_DWORD *)(v1 + 4) = v3;
  *uint64_t result = v2;
  return result;
}

void sub_21DC7BAA0()
{
  *(_DWORD *)(v0 + 4) = v1 - v2;
  JUMPOUT(0x21DC7BAA8);
}

void sub_21DC7BAB8(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = a4;
  int v12 = a2;
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = (((unint64_t)&v9[0xFE0588DFA92FB4DFLL] + 6) * (unsigned __int128)0x2492492492492493uLL) >> 64;
  uint64_t v14 = 16
      * (void)((char *)&v9[0xFE0588DFA92FB4DFLL]
               - 7 * ((v4 + (((unint64_t)&v9[0xFE0588DFA92FB4DFLL] - v4 + 6) >> 1)) >> 2)
               + 6);
  int v5 = **(_DWORD **)(a1 + 24);
  if ((v5 & 0x3E000000 | 0x1000000) != 0x13000000) {
    __asm { BRAA            X11, X12 }
  }
  v9[40] = 0x250197BA3C001668;
  LODWORD(v10) = 1302691225;
  v15[1] = (704005591 * (v15 ^ 0xF7D78CF0)) ^ 0xD2222699;
  off_26CE8FC90(v15);
  int v6 = v5 ^ 0x41126374;
  int v13 = v5;
  if ((v5 ^ 0x41126374) > 16785409)
  {
    if (v6 <= 318767104)
    {
      if (v6 == 16785410)
      {
        uint64_t v7 = 2;
      }
      else
      {
        if (v6 != 16785411) {
          goto LABEL_27;
        }
        uint64_t v7 = 3;
      }
    }
    else
    {
      switch(v6)
      {
        case 318767105:
          uint64_t v7 = 4;
          break;
        case 318767106:
          uint64_t v7 = 6;
          break;
        case 318767107:
          uint64_t v7 = 8;
          break;
        default:
          goto LABEL_27;
      }
    }
  }
  else if (v6 <= 16777218)
  {
    if (v6 == 16777217)
    {
      uint64_t v7 = 5;
    }
    else
    {
      if (v6 != 16777218) {
        goto LABEL_27;
      }
      uint64_t v7 = 7;
    }
  }
  else if (v6 == 16777219)
  {
    uint64_t v7 = 9;
  }
  else
  {
    if (v6 != 16781313)
    {
      if (v6 == 16781314)
      {
        uint64_t v7 = 1;
        goto LABEL_26;
      }
LABEL_27:
      __asm { BRAA            X8, X11 }
    }
    uint64_t v7 = 0;
  }
LABEL_26:
  uint64_t v8 = qword_26CE8F520[35
                     * (qword_26CE8FAB8((*((_DWORD *)&unk_264479E68 + 6 * v7 + 4) - 1302691225)) != 0)
                     + 23];
  __asm { BRAA            X8, X11 }
}

uint64_t sub_21DC7FA68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,int a55)
{
  int v60 = v55 + v56 * (v59 - 1);
  if (*v57 < (unint64_t)(((2 * (8 * a55 - 1848124152)) & 0xF5DD3FF0)
                               + ((8 * a55 - 1848124152) ^ 0x7AEE9FFE)
                               - 2062458878))
    ++v60;
  return (*(uint64_t (**)(void))(v58 + 8 * v60))();
}

uint64_t sub_21DC8019C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (v1 + 28 * (a1 != v2))))();
}

uint64_t sub_21DC801D4(uint64_t a1, int a2)
{
  *(unsigned char *)(v7 + a1) = (31 * (a1 & 0xF)) ^ *(unsigned char *)(v4 + (a1 & 0xF)) ^ *(unsigned char *)((a1 & 0xF) + v3 + 4) ^ *(unsigned char *)((a1 & 0xF) + v5 + 1) ^ ((*(unsigned char *)(v2 + a1) ^ 0x82) + ((2 * *(unsigned char *)(v2 + a1)) & 4) + 14);
  return (*(uint64_t (**)(void))(v8 + 8 * (a2 - 67 + 67 * (a1 + 1 != v6))))();
}

uint64_t cpGetDeviceInfo(io_registry_entry_t entry, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v11 = 3758097084;
  int v12 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (a2)
  {
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"DeviceVersion", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (!CFProperty) {
      return 3758097136;
    }
    CFNumberRef v15 = CFProperty;
    int Value = CFNumberGetValue(CFProperty, kCFNumberSInt8Type, a2);
    CFRelease(v15);
    if (!Value) {
      return v11;
    }
  }
  if (a3)
  {
    CFNumberRef v17 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"FirmwareVersion", *v12, 0);
    if (!v17) {
      return 3758097136;
    }
    CFNumberRef v18 = v17;
    int v19 = CFNumberGetValue(v17, kCFNumberSInt8Type, a3);
    CFRelease(v18);
    if (!v19) {
      return v11;
    }
  }
  if (a4)
  {
    CFNumberRef v20 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"AuthMajorVersion", *v12, 0);
    if (!v20) {
      return 3758097136;
    }
    CFNumberRef v21 = v20;
    int v22 = CFNumberGetValue(v20, kCFNumberSInt8Type, a4);
    CFRelease(v21);
    if (!v22) {
      return v11;
    }
  }
  if (a5)
  {
    CFNumberRef v23 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"AuthMinorVersion", *v12, 0);
    if (!v23) {
      return 3758097136;
    }
    CFNumberRef v24 = v23;
    int v25 = CFNumberGetValue(v23, kCFNumberSInt8Type, a5);
    CFRelease(v24);
    if (!v25) {
      return v11;
    }
  }
  if (!a6) {
    return 0;
  }
  CFNumberRef v26 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"DeviceID", *v12, 0);
  if (!v26) {
    return 3758097136;
  }
  CFNumberRef v27 = v26;
  int v28 = CFNumberGetValue(v26, kCFNumberSInt32Type, a6);
  CFRelease(v27);
  if (v28) {
    return 0;
  }
  return v11;
}

uint64_t cpGetDeviceIDSN(io_registry_entry_t a1, UInt8 **a2, CFIndex *a3)
{
  uint64_t v3 = 3758097090;
  if (a2)
  {
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a1, @"IDSN", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      CFDataRef v7 = CFProperty;
      CFIndex Length = CFDataGetLength(CFProperty);
      int v9 = (UInt8 *)malloc_type_malloc(Length, 0xC0846878uLL);
      if (v9)
      {
        uint64_t v10 = v9;
        v12.location = 0;
        v12.size_t length = Length;
        CFDataGetBytes(v7, v12, v9);
        uint64_t v3 = 0;
        *a2 = v10;
        *a3 = Length;
      }
      else
      {
        uint64_t v3 = 3758097115;
      }
      CFRelease(v7);
    }
    else
    {
      return 3758097136;
    }
  }
  return v3;
}

CFTypeRef cpCopyCertificate(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"AccessoryCertificate", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

uint64_t cpClearCertificate(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 0xDu, 0, 0, 0, 0);
}

CFTypeRef cpCopyCertificateSerialNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"AccessoryCertificateSerialNumber", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

uint64_t cpGetChallengeSignatureLengths(mach_port_t a1, uint64_t *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t output = 0;
  uint64_t v10 = 0;
  uint32_t outputCnt = 2;
  puts("cpGetChallengeSignatureLengths");
  uint64_t result = IOConnectCallScalarMethod(a1, 0x14u, 0, 0, &output, &outputCnt);
  uint64_t v7 = v10;
  *a2 = output;
  *a3 = v7;
  return result;
}

uint64_t cpCreateFormattedChallengeFromServerRequest(mach_port_t a1, const __CFData *a2, CFDataRef *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  puts("cpCreateFormattedChallengeFromServerRequest");
  memset(outputStruct, 0, sizeof(outputStruct));
  size_t outputStructCnt = 128;
  BytePtr = CFDataGetBytePtr(a2);
  size_t Length = CFDataGetLength(a2);
  uint64_t v8 = IOConnectCallStructMethod(a1, 0x15u, BytePtr, Length, outputStruct, &outputStructCnt);
  if (!v8 && outputStructCnt) {
    *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)outputStruct, outputStructCnt);
  }
  return v8;
}

uint64_t cpCreateFormattedResponseForServerResponse(mach_port_t a1, const __CFData *a2, CFDataRef *a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t input = a4;
  puts("cpCreateFormattedResponseForServerResponse");
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  *(_OWORD *)bytes = 0u;
  long long v14 = 0u;
  CFIndex length = 128;
  BytePtr = CFDataGetBytePtr(a2);
  size_t v8 = CFDataGetLength(a2);
  uint64_t v9 = IOConnectCallMethod(a1, 0x16u, &input, 1u, BytePtr, v8, 0, 0, bytes, (size_t *)&length);
  if (!v9) {
    *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length);
  }
  return v9;
}

uint64_t cpCreateSignature(mach_port_t a1, CFDataRef theData, CFDataRef *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  CFIndex length = 128;
  BytePtr = CFDataGetBytePtr(theData);
  size_t v7 = CFDataGetLength(theData);
  uint64_t v8 = IOConnectCallStructMethod(a1, 0, BytePtr, v7, outputStruct, (size_t *)&length);
  if (!v8) {
    *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], outputStruct, length);
  }
  return v8;
}

uint64_t cpCreateSignatureWithIndexAndToken(mach_port_t a1, const __CFData *a2, CFDataRef *a3, uint64_t *a4, int a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  puts("cpCreateSignatureWithIndexAndToken");
  if (a2)
  {
    CFIndex v10 = CFDataGetLength(a2);
    if (v10) {
      CFDataGetBytePtr(a2);
    }
  }
  else
  {
    CFIndex v10 = 0;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  *(_OWORD *)bytes = 0u;
  long long v19 = 0u;
  input[0] = a5;
  input[1] = v10;
  input[2] = 128;
  uint32_t outputCnt = 1;
  CFIndex length = 128;
  BytePtr = CFDataGetBytePtr(a2);
  size_t v12 = CFDataGetLength(a2);
  uint64_t v13 = IOConnectCallMethod(a1, 0x13u, input, 3u, BytePtr, v12, a4, &outputCnt, bytes, (size_t *)&length);
  if (!v13) {
    *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length);
  }
  return v13;
}

CFTypeRef cpCopyDeviceNonce(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceNonce", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

uint64_t cpSetAuthStatus(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 4u, &input, 1u, 0, 0);
}

uint64_t cpSetTrustStatus(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 8u, &input, 1u, 0, 0);
}

uint64_t cpSetTrustStatusForUI(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 9u, &input, 1u, 0, 0);
}

uint64_t cpSetFdrValidationStatus(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 5u, &input, 1u, 0, 0);
}

uint64_t cpSetAuthFullPass(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0xAu, &input, 1u, 0, 0);
}

uint64_t cpSetAuthErrorDescription(mach_port_t a1, CFStringRef theString)
{
  uint64_t v4 = 3758097085;
  CFIndex v5 = CFStringGetLength(theString) + 1;
  uint64_t v6 = (char *)malloc_type_malloc(v5, 0x100004077774924uLL);
  if (v6)
  {
    size_t v7 = v6;
    if (CFStringGetCString(theString, v6, v5, 0x8000100u)) {
      uint64_t v4 = IOConnectCallStructMethod(a1, 0xBu, v7, v5, 0, 0);
    }
    else {
      uint64_t v4 = 3758097090;
    }
    free(v7);
  }
  return v4;
}

uint64_t cpSetAuthError(mach_port_t a1, unsigned int a2)
{
  uint64_t v3 = a2;
  printf("cpSetAuthError %d\n", a2);
  uint64_t input = v3;
  return IOConnectCallScalarMethod(a1, 0xCu, &input, 1u, 0, 0);
}

uint64_t cpCopyDownstreamCertificateSerialNumber(mach_port_t a1, CFStringRef *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  size_t outputStructCnt = 33;
  uint64_t v3 = IOConnectCallStructMethod(a1, 1u, 0, 0, outputStruct, &outputStructCnt);
  CFStringRef v4 = 0;
  if (!v3) {
    CFStringRef v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], outputStruct, 0x600u);
  }
  *a2 = v4;
  return v3;
}

uint64_t cpSetDownstreamRevokeStatus(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 2u, &input, 1u, 0, 0);
}

uint64_t cpGetDownstreamAuthMajorVer(mach_port_t a1, unsigned char *a2)
{
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallScalarMethod(a1, 3u, 0, 0, &output, &outputCnt);
  *a2 = output;
  return result;
}

uint64_t cpClearAuthState(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 6u, 0, 0, 0, 0);
}

uint64_t cpRequestAuthRestart(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 7u, 0, 0, 0, 0);
}

uint64_t cpSetExpectedPairedCertSN(mach_port_t a1, CFStringRef theString)
{
  uint64_t v4 = 3758097085;
  CFIndex v5 = CFStringGetLength(theString) + 1;
  uint64_t v6 = (char *)malloc_type_malloc(v5, 0x100004077774924uLL);
  if (v6)
  {
    size_t v7 = v6;
    if (CFStringGetCString(theString, v6, v5, 0x8000100u))
    {
      uint64_t v4 = IOConnectCallStructMethod(a1, 0x11u, v7, v5, 0, 0);
    }
    else
    {
      puts("cpSetExpectedPairedCertSN: !CFStringGetCString");
      uint64_t v4 = 3758097090;
    }
    free(v7);
  }
  return v4;
}

uint64_t cpSetActualPairedCertSN(mach_port_t a1, CFStringRef theString)
{
  uint64_t v4 = 3758097085;
  CFIndex v5 = CFStringGetLength(theString) + 1;
  uint64_t v6 = (char *)malloc_type_malloc(v5, 0x100004077774924uLL);
  if (v6)
  {
    size_t v7 = v6;
    if (CFStringGetCString(theString, v6, v5, 0x8000100u))
    {
      uint64_t v4 = IOConnectCallStructMethod(a1, 0x12u, v7, v5, 0, 0);
    }
    else
    {
      puts("cpSetActualPairedCertSN: !CFStringGetCString");
      uint64_t v4 = 3758097090;
    }
    free(v7);
  }
  return v4;
}

uint64_t cpGetTransportEntryId(mach_port_t a1, uint64_t *a2)
{
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t v3 = IOConnectCallScalarMethod(a1, 0x10u, 0, 0, &output, &outputCnt);
  uint64_t v4 = v3;
  if (v3) {
    printf("cpGetTransportEntryId: IOConnectCallScalarMethod failed: 0x%x\n", v3);
  }
  else {
    *a2 = output;
  }
  return v4;
}

uint64_t cpGetUpstreamAccessoryManager(io_registry_entry_t a1)
{
  io_registry_entry_t parent = 0;
  if (IORegistryEntryGetParentEntry(a1, "IOAccessory", &parent)) {
    return 0;
  }
  else {
    return parent;
  }
}

uint64_t cpGetInternalComponents(__CFArray **a1)
{
  kern_return_t RegistryEntryID;
  CFNumberRef v12;
  CFNumberRef v13;
  CFTypeRef v14;
  int v15;
  int v16;
  __CFString *v17;
  CFTypeRef v18;
  CFTypeRef v19;
  CFTypeRef v20;
  const void *v21;
  CFTypeRef v22;
  __CFDictionary *v23;
  __CFArray **v25;
  __CFArray *theArray;
  CFAllocatorRef v27;
  CFBooleanRef cf;
  io_iterator_t existing;
  uint64_t entryID;
  int valuePtr;

  uint64_t v1 = 3758097090;
  if (a1)
  {
    existing = 0;
    uint64_t v3 = IOServiceMatching("AppleAuthCP");
    CFDictionarySetValue(v3, @"InternalComponent", (const void *)*MEMORY[0x263EFFB40]);
    uint64_t MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x263F0EC90], v3, &existing);
    if (MatchingServices)
    {
      return MatchingServices;
    }
    else
    {
      long long v25 = a1;
      CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      io_object_t v6 = IOIteratorNext(existing);
      if (v6)
      {
        io_registry_entry_t v7 = v6;
        CFNumberRef v27 = v5;
        do
        {
          CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v7, @"InternalComponent", v5, 0);
          if (!CFProperty)
          {
            long long v23 = 0;
LABEL_38:
            long long v16 = -536870206;
            goto LABEL_40;
          }
          CFBooleanRef v9 = CFProperty;
          double valuePtr = 0;
          entryID = 0;
          if (!CFBooleanGetValue(CFProperty))
          {
            long long v23 = 0;
            Mutable = 0;
            long long v22 = v9;
            long long v16 = -536870206;
            goto LABEL_34;
          }
          Mutable = CFDictionaryCreateMutable(v5, 5, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          if (!Mutable) {
            goto LABEL_45;
          }
          RegistryEntryID = IORegistryEntryGetRegistryEntryID(v7, &entryID);
          if (RegistryEntryID)
          {
            long long v16 = RegistryEntryID;
            long long v23 = 0;
LABEL_49:
            long long v22 = v9;
LABEL_34:
            CFRelease(v22);
            goto LABEL_35;
          }
          size_t v12 = CFNumberCreate(v5, kCFNumberSInt64Type, &entryID);
          if (!v12)
          {
LABEL_45:
            long long v23 = 0;
            long long v16 = -536870181;
            goto LABEL_49;
          }
          uint64_t v13 = v12;
          CFDictionaryAddValue(Mutable, @"IORegistryEntryID", v12);
          long long v14 = IORegistryEntryCreateCFProperty(v7, @"flags", v5, 0);
          if (v14) {
            CFDictionaryAddValue(Mutable, @"flags", v14);
          }
          CFNumberGetValue((CFNumberRef)v14, kCFNumberSInt32Type, &valuePtr);
          long long v15 = BYTE2(valuePtr) << 16;
          long long v16 = -536870201;
          CFTypeRef cf = v9;
          if (v15 == 0x10000)
          {
            long long v17 = @"Battery";
          }
          else
          {
            if (v15 != 196608)
            {
              long long v23 = 0;
              long long v19 = 0;
              long long v21 = 0;
              long long v22 = 0;
              long long v18 = 0;
              goto LABEL_25;
            }
            long long v17 = @"TouchController";
          }
          CFDictionaryAddValue(Mutable, @"ComponentName", v17);
          long long v18 = IORegistryEntryCreateCFProperty(v7, @"authErrorDescription", v5, 0);
          if (v18)
          {
            CFDictionaryAddValue(Mutable, @"authErrorDescription", v18);
            long long v19 = IORegistryEntryCreateCFProperty(v7, @"AuthPassed", v5, 0);
            if (v19) {
              CFDictionaryAddValue(Mutable, @"AuthPassed", v19);
            }
            long long v20 = IORegistryEntryCreateCFProperty(v7, @"isTrusted", v5, 0);
            long long v21 = v20;
            if (v20) {
              CFDictionaryAddValue(Mutable, @"isTrusted", v20);
            }
            long long v22 = IORegistryEntryCreateCFProperty(v7, @"isTrustedForUI", v5, 0);
            if (v22) {
              CFDictionaryAddValue(Mutable, @"isTrustedForUI", v22);
            }
            long long v16 = 0;
            long long v23 = Mutable;
          }
          else
          {
            long long v23 = 0;
            long long v19 = 0;
            long long v21 = 0;
            long long v22 = 0;
          }
LABEL_25:
          CFRelease(cf);
          CFRelease(v13);
          if (v14) {
            CFRelease(v14);
          }
          if (v18) {
            CFRelease(v18);
          }
          if (v19) {
            CFRelease(v19);
          }
          if (v21) {
            CFRelease(v21);
          }
          if (v22) {
            goto LABEL_34;
          }
LABEL_35:
          if (Mutable)
          {
            CFAllocatorRef v5 = v27;
            if (!v16) {
              goto LABEL_40;
            }
            CFRelease(Mutable);
            goto LABEL_38;
          }
          CFAllocatorRef v5 = v27;
LABEL_40:
          IOObjectRelease(v7);
          if (v23 && !v16)
          {
            CFArrayAppendValue(theArray, v23);
            CFRelease(v23);
          }
          io_registry_entry_t v7 = IOIteratorNext(existing);
        }
        while (v7);
      }
      IOObjectRelease(existing);
      uint64_t v1 = 0;
      const char *v25 = theArray;
    }
  }
  return v1;
}

uint64_t AuthCPI2CRead(mach_port_t a1, char a2, unsigned int a3, void *outputStruct)
{
  LOBYTE(input) = a2;
  size_t outputStructCnt = a3;
  return IOConnectCallMethod(a1, 0xEu, &input, 1u, 0, 0, 0, 0, outputStruct, &outputStructCnt);
}

uint64_t AuthCPI2CWrite(mach_port_t a1, char a2, size_t inputStructCnt, void *inputStruct)
{
  LOBYTE(input) = a2;
  return IOConnectCallMethod(a1, 0xFu, &input, 1u, inputStruct, inputStructCnt, 0, 0, 0, 0);
}

uint64_t CTParseFlagsForAccessoryCerts(uint64_t result)
{
  uint64_t v1 = result;
  if (!result || (uint64_t result = *(void *)(result + 240)) == 0)
  {
    uint64_t v3 = v1 + 136;
    uint64_t v2 = *(unsigned __int8 **)(v1 + 136);
    if (*(void *)(v3 + 8) != 15 || v2 == 0) {
      return 0;
    }
    if ((unint64_t)v2 < 0xFFFFFFFFFFFFFFFELL)
    {
      if (v2[2] != 170) {
        return 0;
      }
      if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF9)
      {
        if (v2[6] != 170) {
          return 0;
        }
        if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF7)
        {
          if (v2[8] == 170)
          {
            if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF4)
            {
              if (v2[11] == 170) {
                return 0x8000000;
              }
              return 0;
            }
            goto LABEL_17;
          }
          return 0;
        }
      }
    }
LABEL_17:
    __break(0x5513u);
  }
  return result;
}

uint64_t CTParseAccessoryCerts(unsigned __int8 *a1, uint64_t a2, void *a3, void *a4, unsigned __int8 **a5, unint64_t *a6, uint64_t *a7)
{
  v47[0] = *MEMORY[0x263EF8340];
  bzero(v46, 0x4C0uLL);
  uint64_t v45 = 0;
  long long v44 = 0u;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  v38[0] = 4;
  v38[1] = (unint64_t)v46;
  long long v14 = &a1[a2];
  unint64_t v37 = 0;
  uint64_t result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v38, 1);
  if (result)
  {
    memset(v36, 170, sizeof(v36));
    if (__CFADD__(a1, a2)) {
      goto LABEL_65;
    }
    v36[0] = (unint64_t)a1;
    v36[1] = (unint64_t)&a1[a2];
    uint64_t result = (uint64_t)X509ChainParseCertificateSet(v36, (unint64_t)v46, 4, &v36[2], &v37);
    if (result) {
      return result;
    }
    if (v36[0] != v36[1]) {
      return 327690;
    }
  }
  else
  {
    unint64_t v37 = v39;
  }
  if (!v46[265])
  {
    if (v37 < 2)
    {
      char v20 = 0;
      unint64_t v17 = 0;
      long long v16 = v46;
      goto LABEL_19;
    }
    uint64_t v18 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_67:
      __break(0x5515u);
      return result;
    }
    unint64_t v17 = 0;
    long long v16 = v46;
    char v20 = 1;
    uint64_t v19 = 1;
    goto LABEL_20;
  }
  long long v16 = v46;
  if (!v37)
  {
    char v20 = 0;
    unint64_t v17 = 0;
    goto LABEL_19;
  }
  if (v37 > 5)
  {
LABEL_66:
    __break(0x5512u);
    goto LABEL_67;
  }
  unint64_t v17 = 304 * v37 - 304;
  if (__CFADD__(v46, v17))
  {
LABEL_65:
    __break(0x5513u);
    goto LABEL_66;
  }
  long long v16 = &v46[v17];
  uint64_t v18 = v37 - 2;
  if (v37 < 2)
  {
    char v20 = 0;
LABEL_19:
    uint64_t v18 = -1;
    uint64_t v19 = -1;
    goto LABEL_20;
  }
  uint64_t v19 = 0;
  char v20 = 1;
LABEL_20:
  if (a5 && a6)
  {
    char v21 = v20 ^ 1;
    if (v18 < 0) {
      char v21 = 1;
    }
    if (v21)
    {
      CFNumberRef v27 = 0;
      unint64_t v26 = 0;
LABEL_47:
      *a5 = v27;
      *a6 = v26;
      goto LABEL_48;
    }
    long long v22 = (unint64_t *)&v46[304 * (int)v19];
    if (v22 >= v47 || v22 < (unint64_t *)v46) {
      goto LABEL_63;
    }
    unint64_t v23 = 304 * (int)v19;
    if (v23 > 0x4BF) {
      goto LABEL_64;
    }
    unint64_t v24 = v23 | 8;
    if ((v23 | 8) > 0x4C0) {
      goto LABEL_64;
    }
    unint64_t v25 = *v22;
    if (v19 <= v18)
    {
      unint64_t v26 = 0;
      while (1)
      {
        if (&v46[v24 - 8] >= (unsigned char *)v47 || &v46[v24 - 8] < v46) {
          goto LABEL_63;
        }
        if (v24 > 0x4C0) {
          goto LABEL_64;
        }
        uint64_t v29 = *(void *)&v46[v24];
        BOOL v30 = __CFADD__(v26, v29);
        v26 += v29;
        if (v30) {
          break;
        }
        uint64_t v31 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          break;
        }
        v24 += 304;
        ++v19;
        if (v31 > v18) {
          goto LABEL_41;
        }
      }
      __break(0x5500u);
      goto LABEL_63;
    }
    unint64_t v26 = 0;
LABEL_41:
    uint64_t v32 = v25 - (void)a1;
    BOOL v33 = v25 >= (unint64_t)a1;
    BOOL v34 = v25 < (unint64_t)a1;
    if (v32 < 0) {
      BOOL v33 = v34;
    }
    if (v33)
    {
      CFNumberRef v27 = &a1[v32];
      if (v14 < v27 || v27 < a1 || v26 > v14 - v27) {
        goto LABEL_63;
      }
      goto LABEL_47;
    }
    goto LABEL_65;
  }
LABEL_48:
  if (a7 && v16)
  {
    if (v16 >= (unsigned char *)v47 || v16 < v46) {
      goto LABEL_63;
    }
    *a7 = CTParseFlagsForAccessoryCerts((uint64_t)v16);
  }
  uint64_t result = 0;
  if (a3 && a4 && v16)
  {
    if (v46 <= v16 && v16 + 304 <= (unsigned char *)v47)
    {
      if (v17 <= 0x4BF && (v17 | 8) <= 0x4C0)
      {
        uint64_t result = 0;
        uint64_t v35 = *((void *)v16 + 1);
        *a3 = *(void *)v16;
        *a4 = v35;
        return result;
      }
LABEL_64:
      __break(1u);
    }
LABEL_63:
    __break(0x5519u);
    goto LABEL_64;
  }
  return result;
}

uint64_t CTEvaluateAccessoryCert(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9, void *a10, void *a11)
{
  v56[42] = *MEMORY[0x263EF8340];
  bzero(v51, 0x390uLL);
  uint64_t v47 = 0;
  int v48 = 0;
  memset(v46, 170, sizeof(v46));
  if (__CFADD__(a1, a2)) {
    goto LABEL_56;
  }
  if (a1 + a2 < a1) {
    goto LABEL_57;
  }
  v46[0] = a1;
  v46[1] = a1 + a2;
  uint64_t result = X509CertificateParse(v51, v46);
  if (result) {
    return result;
  }
  uint64_t v20 = (uint64_t)v47;
  char v21 = &v48;
  if (v47) {
    char v21 = (uint64_t **)(v47 + 35);
  }
  const void *v21 = v52;
  uint64_t v47 = v51;
  v52[0] = v20;
  v52[1] = &v47;
  unint64_t v44 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v45 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a5, a6)) {
    goto LABEL_56;
  }
  if (a5 + a6 < a5) {
    goto LABEL_57;
  }
  unint64_t v44 = a5;
  unint64_t v45 = a5 + a6;
  if ((unint64_t *)((char *)v53 + 1) != 0 && (unint64_t)v51 >= 0xFFFFFFFFFFFFFECFLL) {
    goto LABEL_56;
  }
  uint64_t result = X509CertificateParse(v53, &v44);
  if (result) {
    return result;
  }
  v56[0] = 0;
  v56[1] = v48;
  *int v48 = (uint64_t)v53;
  int v48 = v56;
  bzero(v49, 0x390uLL);
  if (!a3 || !a4)
  {
LABEL_22:
    uint64_t result = X509ChainBuildPath(v51, (uint64_t *)&v47, &v46[2]);
    if (result) {
      return result;
    }
    unint64_t v26 = 0;
    char v27 = 0;
    char v28 = 28;
    uint64_t result = 327700;
    if (a7 <= 0x1FFFFFFF)
    {
      if (a7 <= 0x7FFFFFF)
      {
        if (a7)
        {
          char v29 = 0;
          if (a7 != 4) {
            return result;
          }
        }
        else
        {
          char v27 = 0;
          unint64_t v26 = 0;
          char v29 = 1;
        }
        goto LABEL_44;
      }
      if (a7 == 0x8000000)
      {
        unint64_t v26 = 0;
        char v29 = 0;
        char v28 = 29;
        char v27 = 1;
        goto LABEL_44;
      }
      if (a7 != 0x10000000) {
        return result;
      }
    }
    else
    {
      if (a7 > 0x3FFFFFFFFLL)
      {
        if (a7 == 0x400000000 || a7 == 0x800000000)
        {
          char v29 = 0;
        }
        else
        {
          char v29 = 0;
          if (a7 != 0x1000000000) {
            return result;
          }
        }
        goto LABEL_44;
      }
      if (a7 != 0x20000000)
      {
        if (a7 != 0x40000000) {
          return result;
        }
        char v27 = 0;
        char v29 = 0;
        unint64_t v26 = 3;
        goto LABEL_44;
      }
      char v27 = 1;
    }
    char v29 = v27;
    unint64_t v26 = 2;
    char v27 = 0;
LABEL_44:
    if (!v55) {
      uint64_t v55 = a7;
    }
    memset(v43, 170, sizeof(v43));
    v42[0] = 0xAAAAAAAAAAAAAAAALL;
    v42[1] = 0xAAAAAAAAAAAAAAAALL;
    X509CertificateParseSPKI(v54, &v43[2], v42, v43);
    unint64_t v32 = v26;
    unint64_t v33 = a7;
    int v37 = -1431655766;
    uint64_t v38 = v43;
    __int16 v34 = 0;
    char v35 = v29;
    char v36 = v27;
    long long v39 = &v43[2];
    long long v40 = v42;
    uint64_t v41 = 0;
    uint64_t result = X509ChainCheckPath(v28, (uint64_t *)&v46[2], (uint64_t)&v32);
    if (!result)
    {
      unint64_t v30 = v46[2];
      if (!a8 || !a9 || !v46[2] || (uint64_t result = X509CertificateParseKey(v46[2], a8, a9), !result))
      {
        uint64_t result = 0;
        if (a10 && a11)
        {
          if (v30)
          {
            uint64_t result = 0;
            uint64_t v31 = *(void *)(v30 + 256);
            *a10 = *(void *)(v30 + 248);
            *a11 = v31;
          }
        }
      }
    }
    return result;
  }
  if (__CFADD__(a3, a4))
  {
LABEL_56:
    __break(0x5513u);
LABEL_57:
    __break(0x5519u);
  }
  if (a3 + a4 < a3) {
    goto LABEL_57;
  }
  unint64_t v32 = a3;
  unint64_t v33 = a3 + a4;
  if (a3 + a4 <= a3) {
    goto LABEL_22;
  }
  unint64_t v22 = 0;
  unint64_t v23 = &v50;
  while (1)
  {
    uint64_t result = X509CertificateParse((unint64_t *)v23 - 34, &v32);
    if (result) {
      return result;
    }
    unint64_t v24 = v48;
    *unint64_t v23 = 0;
    v23[1] = (uint64_t)v24;
    *unint64_t v24 = (uint64_t)(v23 - 34);
    int v48 = v23;
    BOOL v25 = v32 >= v33 || v22++ > 1;
    v23 += 38;
    if (v25) {
      goto LABEL_22;
    }
  }
}

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  _DWORD v4[2] = *MEMORY[0x263EF8340];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v4);
  if (!result)
  {
    uint64_t result = compare_octet_string((uint64_t)&iPhoneCAName, (uint64_t)v4);
    if (result)
    {
      uint64_t result = compare_octet_string((uint64_t)&CodeSigningCAName, (uint64_t)v4);
      if (result)
      {
        uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v4);
        if (result)
        {
          uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)v4);
          if (result)
          {
            uint64_t result = compare_octet_string_partial((uint64_t)&MFi4ProvisioningCAName, (uint64_t)v4);
            if (result) {
              return result;
            }
            uint64_t v3 = 0x1000000000;
          }
          else
          {
            uint64_t v3 = 0x800000000;
          }
        }
        else
        {
          uint64_t v3 = 0x400000000;
        }
      }
      else
      {
        uint64_t v3 = 8;
      }
    }
    else
    {
      uint64_t v3 = 3840;
    }
    *(void *)(a1 + 240) |= v3;
  }
  return result;
}

double X509PolicySetFlagsForMFI(uint64_t a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  if (!X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v6))
  {
    if (compare_octet_string_partial((uint64_t)&MFICommonNamePrefix, (uint64_t)v6)) {
      goto LABEL_3;
    }
    time_t v5 = 0;
    if (!X509CertificateGetNotBefore(a1, &v5))
    {
      memset(&v4, 0, sizeof(v4));
      strptime("2006-05-31", "%F", &v4);
      time_t v3 = timegm(&v4);
      double result = difftime(v3, v5);
      if (result < 0.0)
      {
        *(void *)(a1 + 240) |= 0x8000000uLL;
LABEL_3:
        if (!compare_octet_string_partial((uint64_t)&MFi4ProvisioningHostNamePrefix, (uint64_t)v6)) {
          *(void *)(a1 + 240) |= 0x1000000000uLL;
        }
      }
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForRoots(uint64_t result, uint64_t a2)
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (*(unsigned char *)(result + 16))
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootCASPKI);
    if (!result
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG2SPKI), !result)
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG3SPKI), !result))
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x58E30653FFF8;
      goto LABEL_11;
    }
  }
  uint64_t v4 = *(void *)(v3 + 8);
  if ((v4 & 0x1000000) != 0)
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&UcrtRootSpki);
    if (!result)
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x1000000;
      goto LABEL_11;
    }
LABEL_13:
    if (*(unsigned char *)(v3 + 17)) {
      double result = X509PolicySetFlagsForTestAnchor((void *)v3, a2);
    }
    goto LABEL_15;
  }
  if ((v4 & 0x1C00000000) == 0) {
    goto LABEL_15;
  }
  double result = compare_octet_string(a2 + 88, (uint64_t)&MFi4RootSpki);
  if (result) {
    goto LABEL_13;
  }
  uint64_t v5 = *(void *)(a2 + 240) | 0x1C00000000;
LABEL_11:
  *(void *)(a2 + 240) = v5;
LABEL_15:
  if (*(unsigned char *)(v3 + 16))
  {
    if (*(unsigned char *)(v3 + 17))
    {
      double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootCASPKI);
      if (!result
        || (double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG2SPKI), !result)
        || (double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG3SPKI), !result))
      {
        *(void *)(a2 + 240) |= 0x58E30653FFF8uLL;
      }
    }
    if (*(unsigned char *)(v3 + 16) && *(unsigned char *)(v3 + 17))
    {
      double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootECCSPKI);
      if (!result) {
        *(void *)(a2 + 240) |= 0x6400000uLL;
      }
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForTestAnchor(void *a1, uint64_t a2)
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = 0;
  v6[1] = 0;
  v5[0] = 0;
  v5[1] = 0;
  uint64_t result = X509CertificateParseSPKI((unint64_t *)(a2 + 88), v6, 0, v5);
  if (!result)
  {
    uint64_t result = compare_octet_string(a1[4], (uint64_t)v6);
    if (!result)
    {
      uint64_t result = compare_octet_string(a1[3], (uint64_t)v5);
      if (!result) {
        *(void *)(a2 + 240) |= a1[1];
      }
    }
  }
  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!result) {
    *(void *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  }
  return result;
}

int *find_digest(uint64_t a1)
{
  unint64_t v2 = 0;
  while (1)
  {
    uint64_t result = (int *)compare_octet_string_raw((uint64_t)&digests[v2 / 4 + 2], *(const void **)a1, *(void *)(a1 + 8));
    if (!result) {
      break;
    }
    v2 += 32;
    if (v2 == 160) {
      return 0;
    }
  }
  if (v2 <= ~(unint64_t)digests) {
    return &digests[v2 / 4];
  }
  __break(0x5513u);
  return result;
}

int *find_digest_by_type(int *result)
{
  unint64_t v1 = 0;
  while (digests[v1 / 4] != result)
  {
    v1 += 32;
    if (v1 == 160) {
      return 0;
    }
  }
  if (v1 <= ~(unint64_t)digests) {
    return &digests[v1 / 4];
  }
  __break(0x5513u);
  return result;
}

uint64_t find_digestOID_for_signingOID(uint64_t a1, void *a2)
{
  if (!compare_octet_string_raw(a1, &sha1WithRSA_oid, 9uLL)
    || !compare_octet_string_raw(a1, &sha1WithECDSA_oid, 7uLL))
  {
    io_object_t v6 = &CTOidSha1;
    uint64_t v4 = 5;
    goto LABEL_11;
  }
  uint64_t v4 = 9;
  if (!compare_octet_string_raw(a1, &sha256WithRSA_oid, 9uLL))
  {
    io_object_t v6 = &CTOidSha256;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha256WithECDSA_oid, 8uLL))
  {
    io_object_t v6 = &CTOidSha256;
LABEL_18:
    uint64_t v4 = 9;
    goto LABEL_11;
  }
  uint64_t v4 = 9;
  if (!compare_octet_string_raw(a1, &sha384WithRSA_oid, 9uLL))
  {
    io_object_t v6 = &CTOidSha384;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha384WithECDSA_oid, 8uLL))
  {
    io_object_t v6 = &CTOidSha384;
    goto LABEL_18;
  }
  uint64_t v4 = 9;
  if (compare_octet_string_raw(a1, &sha512WithRSA_oid, 9uLL))
  {
    if (compare_octet_string_raw(a1, &sha512WithECDSA_oid, 8uLL)) {
      return 0;
    }
    io_object_t v6 = &CTOidSha512;
    goto LABEL_18;
  }
  io_object_t v6 = &CTOidSha512;
LABEL_11:
  *a2 = v6;
  a2[1] = v4;
  return 1;
}

unint64_t validateSignatureRSA(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t result = 0;
  uint64_t v27 = *MEMORY[0x263EF8340];
  char v23 = 0;
  if (a1)
  {
    if (a2)
    {
      unint64_t result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            unint64_t result = compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)(a5 + 7));
            if (!result
              || (unint64_t result = validateOIDs((uint64_t)&rsaAlgs, (uint64_t)(a5 + 3), (uint64_t)(a5 + 7)), result))
            {
              unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v10 = a5[9];
              uint64_t v9 = a5[10];
              if (__CFADD__(v10, v9)) {
                goto LABEL_31;
              }
              if (v10 > v10 + v9) {
                goto LABEL_32;
              }
              unint64_t v21 = a5[9];
              unint64_t v22 = v10 + v9;
              if (!v9 || (unint64_t result = ccder_blob_check_null(), result))
              {
                if (!__CFADD__(a1, a2))
                {
                  if (a1 + a2 >= a1)
                  {
                    unint64_t result = ccder_decode_rsa_pub_n();
                    if (!result) {
                      return result;
                    }
                    unint64_t v11 = result;
                    if (result >> 58)
                    {
LABEL_33:
                      __break(0x550Cu);
                      return result;
                    }
                    unint64_t v12 = result << 6;
                    if (result << 6 < 0x400) {
                      return 0;
                    }
                    unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
                    __int16 v26 = -21846;
                    char v24 = 6;
                    if (&vars0 != (uint64_t *)82)
                    {
                      unint64_t v13 = a5[4];
                      LOBYTE(v25) = v13;
                      if ((unint64_t)&v24 <= 0xFFFFFFFFFFFFFFFDLL)
                      {
                        if (v13 <= 9)
                        {
                          uint64_t v14 = __memcpy_chk();
                          if (v12 > 0x1068) {
                            return 0;
                          }
                          unint64_t result = MEMORY[0x270FA5388](v14);
                          long long v16 = (unint64_t *)((char *)&v20 - v15);
                          unint64_t v17 = 0;
                          *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
                          *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          do
                          {
                            uint64_t v19 = &v16[v17 / 8];
                            *(_OWORD *)uint64_t v19 = v18;
                            *((_OWORD *)v19 + 1) = v18;
                            v17 += 32;
                          }
                          while (v15 != v17);
                          if (v15 >= 1)
                          {
                            *long long v16 = v11;
                            if (ccrsa_import_pub()) {
                              return 0;
                            }
                            if (!ccrsa_verify_pkcs1v15_allowshortsigs()) {
                              return v23 != 0;
                            }
                            unint64_t result = 0;
                            char v23 = 0;
                            return result;
                          }
                        }
                        goto LABEL_32;
                      }
                    }
                    goto LABEL_31;
                  }
LABEL_32:
                  __break(0x5519u);
                  goto LABEL_33;
                }
LABEL_31:
                __break(0x5513u);
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL validateOIDs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = 0;
  BOOL v7 = 1;
  do
  {
    if (!compare_octet_string(a1, a2) && !compare_octet_string(a1 + 16, a3)) {
      break;
    }
    BOOL v7 = v6 < 3;
    a1 += 32;
    ++v6;
  }
  while (v6 != 4);
  return v7;
}

_UNKNOWN **oidForPubKeyLength()
{
  uint64_t v0 = ccec_x963_import_pub_size();
  int is_supported = ccec_keysize_is_supported();
  unint64_t v2 = &CTOidSECP256r1;
  uint64_t v3 = &CTOidSECP521r1;
  uint64_t v4 = &CTOidSECP384r1;
  if (v0 != 384) {
    uint64_t v4 = 0;
  }
  if (v0 != 521) {
    uint64_t v3 = v4;
  }
  if (v0 != 256) {
    unint64_t v2 = v3;
  }
  if (is_supported) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t validateSignatureEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0;
  uint64_t v18 = *MEMORY[0x263EF8340];
  HIBYTE(v17) = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (!compare_octet_string((uint64_t)&ecPublicKey, a5 + 56)
              || (uint64_t result = validateOIDs((uint64_t)&ecAlgs, a5 + 24, a5 + 56), result))
            {
              uint64_t result = ccec_cp_for_oid((int **)(a5 + 72));
              if (result)
              {
                uint64_t v8 = *(void *)result;
                if (*(void *)result >> 61 || !is_mul_ok(8 * v8, 3uLL))
                {
                  __break(0x550Cu);
                }
                else
                {
                  uint64_t v9 = 24 * v8;
                  BOOL v10 = __CFADD__(v9, 16);
                  unint64_t v11 = v9 + 16;
                  if (!v10 && v11 < 0xFFFFFFFFFFFFFFF0)
                  {
                    uint64_t result = MEMORY[0x270FA5388](result);
                    uint64_t v14 = (uint64_t *)((char *)&v17 - v12);
                    unint64_t v15 = 0;
                    do
                    {
                      long long v16 = &v14[v15 / 8];
                      *long long v16 = 0xAAAAAAAAAAAAAAAALL;
                      v16[1] = 0xAAAAAAAAAAAAAAAALL;
                      v15 += 16;
                    }
                    while (v12 != v15);
                    if (v13 >= 0x10)
                    {
                      *uint64_t v14 = result;
                      if (v12 >= 1)
                      {
                        if (!MEMORY[0x223C17300]())
                        {
                          uint64_t result = ccec_x963_import_pub_size();
                          if (result == 256 && *(void *)(a5 + 96) == 64)
                          {
                            if (*(void *)(a5 + 88) < 0xFFFFFFFFFFFFFFE0)
                            {
                              if (!ccec_verify_composite()) {
                                return HIBYTE(v17) != 0;
                              }
                              goto LABEL_24;
                            }
LABEL_31:
                            __break(0x5513u);
                            return result;
                          }
                          if (ccec_verify()) {
LABEL_24:
                          }
                            HIBYTE(v17) = 0;
                        }
                        return HIBYTE(v17) != 0;
                      }
LABEL_30:
                      __break(0x5519u);
                      goto LABEL_31;
                    }
LABEL_29:
                    __break(1u);
                    goto LABEL_30;
                  }
                }
                __break(0x5500u);
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t ccec_cp_for_oid(int **a1)
{
  if (!a1) {
    return 0;
  }
  unint64_t v1 = a1[1];
  if (v1 != (int *)7)
  {
    if (v1 == (int *)10 && *(void *)*a1 == 0x33DCE48862A0806 && *((_WORD *)*a1 + 4) == 1793) {
      JUMPOUT(0x223C172C0);
    }
    return 0;
  }
  uint64_t v3 = *a1;
  if (**a1 == -2127887098 && *(int *)((char *)*a1 + 3) == 570426497) {
    JUMPOUT(0x223C172D0);
  }
  int v5 = *v3;
  int v6 = *(int *)((char *)v3 + 3);
  if (v5 != -2127887098 || v6 != 587203713) {
    return 0;
  }
  return MEMORY[0x270ED8AA8]();
}

uint64_t compressECPublicKey(void *a1, int **a2, uint64_t a3, uint64_t a4)
{
  v19[1] = *MEMORY[0x263EF8340];
  BOOL v7 = (void *)ccec_cp_for_oid(a2);
  if (!v7) {
    return 655366;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *v7;
  if (*v7 >> 61 || !is_mul_ok(8 * v9, 3uLL))
  {
    __break(0x550Cu);
    goto LABEL_19;
  }
  uint64_t v10 = 24 * v9;
  BOOL v11 = __CFADD__(v10, 16);
  unint64_t v12 = v10 + 16;
  if (v11 || v12 >= 0xFFFFFFFFFFFFFFF0) {
LABEL_19:
  }
    __break(0x5500u);
  uint64_t result = MEMORY[0x270FA5388](v7);
  long long v16 = (void *)((char *)v19 - v14);
  unint64_t v17 = 0;
  do
  {
    uint64_t v18 = &v16[v17 / 8];
    *uint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
    v18[1] = 0xAAAAAAAAAAAAAAAALL;
    v17 += 16;
  }
  while (v14 != v17);
  if (v15 < 0x10) {
    goto LABEL_21;
  }
  *long long v16 = v8;
  if (v14 < 1)
  {
LABEL_20:
    __break(0x5519u);
LABEL_21:
    __break(1u);
    return result;
  }
  uint64_t result = MEMORY[0x223C17300](v8, a1[1], *a1, (char *)v19 - v14);
  if (!result)
  {
    uint64_t result = ccec_compressed_x962_export_pub_size();
    if (result == a4)
    {
      if (!a3 || a4) {
        return ccec_compressed_x962_export_pub();
      }
      goto LABEL_20;
    }
    return 393220;
  }
  return result;
}

unint64_t decompressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  v18[1] = *MEMORY[0x263EF8340];
  int v6 = (uint64_t *)ccec_cp_for_oid(a2);
  if (!v6) {
    return 655366;
  }
  uint64_t v7 = *v6;
  if ((unint64_t)*v6 >> 61 || !is_mul_ok(8 * v7, 3uLL)) {
LABEL_22:
  }
    __break(0x550Cu);
  uint64_t v8 = 24 * v7;
  BOOL v9 = __CFADD__(v8, 16);
  unint64_t v10 = v8 + 16;
  if (v9 || v10 >= 0xFFFFFFFFFFFFFFF0)
  {
LABEL_21:
    __break(0x5500u);
    goto LABEL_22;
  }
  unint64_t result = MEMORY[0x270FA5388](v6);
  uint64_t v14 = (void *)((char *)v18 - v12);
  unint64_t v15 = 0;
  do
  {
    long long v16 = &v14[v15 / 8];
    *long long v16 = 0xAAAAAAAAAAAAAAAALL;
    v16[1] = 0xAAAAAAAAAAAAAAAALL;
    v15 += 16;
  }
  while (v12 != v15);
  if (v13 < 0x10) {
    goto LABEL_24;
  }
  *uint64_t v14 = result;
  if (v12 >= 1)
  {
    uint64_t v17 = ccec_compressed_x962_import_pub();
    if (!v17)
    {
      unint64_t result = cczp_bitlen();
      if (result < 0xFFFFFFFFFFFFFFF9)
      {
        if (!a3 || a4)
        {
          if ((((result + 7) >> 2) | 1) == a4) {
            uint64_t v17 = 0;
          }
          else {
            uint64_t v17 = 393220;
          }
          ccec_export_pub();
          return v17;
        }
        goto LABEL_23;
      }
      goto LABEL_21;
    }
    return v17;
  }
LABEL_23:
  __break(0x5519u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t CMSParseContentInfoSignedDataWithOptions(unsigned __int8 *a1, uint64_t a2, unint64_t *a3, char a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  char v28 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  char v29 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_114;
  }
  if (&a1[a2] < a1) {
    goto LABEL_112;
  }
  int v4 = 65537;
  char v28 = a1;
  char v29 = &a1[a2];
  __int16 v27 = 0;
  size_t v26 = 0xAAAAAAAAAAAAAAAALL;
  int v7 = ccder_blob_decode_ber_tl(&v28, 0x2000000000000010, (unsigned char *)&v27 + 1, &v26);
  uint64_t result = 65537;
  if (v7)
  {
    char v24 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v25 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v28, v26)) {
      goto LABEL_114;
    }
    if (v28 > &v28[v26] || &v28[v26] > v29) {
      goto LABEL_112;
    }
    char v24 = v28;
    unint64_t v25 = &v28[v26];
    if (ccder_blob_decode_tl())
    {
      if (v25 < v24 || v26 > v25 - v24) {
        goto LABEL_112;
      }
      if (compare_octet_string_raw((uint64_t)&pkcs7_signedData_oid, v24, v26)) {
        return 65539;
      }
      if (__CFADD__(v24, v26)) {
        goto LABEL_114;
      }
      if (v24 > &v24[v26] || &v24[v26] > v25) {
        goto LABEL_112;
      }
      v24 += v26;
      if (!ccder_blob_decode_ber_tl(&v24, 0xA000000000000000, &v27, &v26)) {
        return 65540;
      }
      unint64_t v22 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      char v23 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v24, v26)) {
        goto LABEL_114;
      }
      if (v24 > &v24[v26] || &v24[v26] > v25) {
        goto LABEL_112;
      }
      unint64_t v22 = v24;
      char v23 = &v24[v26];
      __int16 v31 = 0;
      memset(v30, 170, sizeof(v30));
      if ((ccder_blob_decode_ber_tl(&v22, 0x2000000000000010, (unsigned char *)&v31 + 1, v30) & 1) == 0) {
        return 131073;
      }
      if (__CFADD__(v22, v30[0])) {
        goto LABEL_114;
      }
      uint64_t v9 = 131080;
      if (&v22[v30[0]] != v23) {
        return 131082;
      }
      unint64_t v10 = a3 + 11;
      if (!ccder_blob_decode_uint64()) {
        return 131074;
      }
      uint64_t result = 131092;
      if (*v10 <= 4uLL && ((1 << *v10) & 0x1A) != 0)
      {
        if (!ccder_blob_eat_ber_inner(&v22, 0x2000000000000011, 0, 125)) {
          return 131075;
        }
        unsigned __int8 v35 = 0;
        size_t v34 = 0;
        if ((ccder_blob_decode_ber_tl(&v22, 0x2000000000000010, &v35, &v34) & 1) == 0) {
          return 131076;
        }
        unint64_t v32 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        unint64_t v33 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v22, v34)) {
          goto LABEL_114;
        }
        if (v22 > &v22[v34] || &v22[v34] > v23) {
          goto LABEL_112;
        }
        unint64_t v32 = v22;
        unint64_t v33 = &v22[v34];
        if (!ccder_blob_decode_tl()) {
          return 131077;
        }
        if (v33 < v32 || v34 > v33 - v32) {
          goto LABEL_112;
        }
        if (compare_octet_string_raw((uint64_t)&pkcs7_data_oid, v32, v34)) {
          return 131078;
        }
        if (__CFADD__(v32, v34)) {
          goto LABEL_114;
        }
        BOOL v11 = &v32[v34];
        if (v32 > &v32[v34] || v11 > v33) {
          goto LABEL_112;
        }
        v32 += v34;
        int v12 = v35;
        if (v11 != v33 || v35)
        {
          unsigned __int8 v40 = 0;
          uint64_t v38 = v33;
          unint64_t v39 = 0;
          int v37 = v11;
          if (ccder_blob_decode_ber_tl(&v37, 0xA000000000000000, &v40, &v39))
          {
            if (!v12)
            {
              if (__CFADD__(v37, v39)) {
                goto LABEL_114;
              }
              if (&v37[v39] != v33) {
                return v9;
              }
            }
            if (v37 > v38) {
              goto LABEL_112;
            }
            unint64_t v32 = v37;
            unint64_t v33 = v38;
            unsigned __int8 v36 = 0;
            int v16 = v40;
            if (v40 && !ccder_blob_decode_ber_tl(&v32, 0x2000000000000004, &v36, &v39)) {
              return 131079;
            }
            unint64_t v41 = 0;
            if (!ccder_blob_decode_tl()) {
              return 131090;
            }
            uint64_t v17 = v32;
            uint64_t v18 = v33;
            if (v33 < v32) {
              goto LABEL_112;
            }
            unint64_t v19 = v41;
            if (v41 > v33 - v32) {
              goto LABEL_112;
            }
            a3[9] = (unint64_t)v32;
            a3[10] = v19;
            if (__CFADD__(v17, v19))
            {
LABEL_114:
              __break(0x5513u);
              return 0;
            }
            uint64_t v20 = &v17[v19];
            if (v20 > v18 || v17 > v20) {
              goto LABEL_112;
            }
            unint64_t v32 = v20;
            if ((ccder_blob_decode_eoc((unint64_t *)&v32, v36) & 1) == 0) {
              return 131089;
            }
          }
          else
          {
            if (!v12) {
              return v9;
            }
            int v16 = v40;
          }
          if ((ccder_blob_decode_eoc((unint64_t *)&v32, v16 != 0) & 1) == 0) {
            return 131088;
          }
          BOOL v11 = v32;
        }
        if (v11 > v23 || v22 > v11) {
          goto LABEL_112;
        }
        unint64_t v22 = v11;
        if ((ccder_blob_decode_eoc((unint64_t *)&v22, v12 != 0) & 1) == 0) {
          return 131081;
        }
        int v37 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        uint64_t v38 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (v22 > v23) {
          goto LABEL_112;
        }
        int v37 = v22;
        uint64_t v38 = v23;
        if ((ccder_blob_decode_ber_tl(&v37, 0xA000000000000000, &v31, v30) & 1) == 0)
        {
          unint64_t v13 = v22;
          unint64_t v15 = v23;
          goto LABEL_86;
        }
        unint64_t v32 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        unint64_t v33 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (!__CFADD__(v37, v30[0]))
        {
          if (v37 > &v37[v30[0]] || &v37[v30[0]] > v38) {
            goto LABEL_112;
          }
          unint64_t v32 = v37;
          unint64_t v33 = &v37[v30[0]];
          if (!CMSParseImplicitCertificateSet(&v32, a3[1], *a3, a3 + 3, a3 + 2)) {
            return 131085;
          }
          if (!ccder_blob_decode_eoc((unint64_t *)&v32, v31)) {
            return 131086;
          }
          unint64_t v13 = v32;
          if (v32 - v37 >= 0 ? v32 >= v37 : v32 < v37)
          {
            if (v37 > v32) {
              goto LABEL_112;
            }
            unint64_t v15 = v38;
            if (v32 > v38) {
              goto LABEL_112;
            }
            unint64_t v22 = v32;
            char v23 = v38;
LABEL_86:
            if (v13 <= v15)
            {
              int v37 = v13;
              uint64_t v38 = v15;
              if (ccder_blob_eat_ber_inner(&v37, 0xA000000000000001, 0, 125))
              {
                if (v37 > v38) {
                  goto LABEL_112;
                }
                unint64_t v22 = v37;
                char v23 = v38;
              }
              if (!ccder_blob_eat_ber_inner(&v22, 0x2000000000000011, (unsigned __int8 **)&v30[1], 125)) {
                return 131083;
              }
              if (v30[2] >= v30[1])
              {
                unint64_t v21 = &v22[-v30[1]];
                if ((unint64_t)&v22[-v30[1]] <= v30[2] - v30[1])
                {
                  a3[5] = v30[1];
                  a3[6] = (unint64_t)v21;
                  if ((ccder_blob_decode_eoc((unint64_t *)&v22, HIBYTE(v31)) & 1) == 0) {
                    return 131084;
                  }
                  if (!ccder_blob_decode_eoc((unint64_t *)&v22, v27)) {
                    return 65541;
                  }
                  if (v22 <= v25 && v24 <= v22)
                  {
                    char v24 = v22;
                    if (ccder_blob_decode_eoc((unint64_t *)&v24, HIBYTE(v27)))
                    {
                      if ((a4 & 1) == 0 && v24 != v29) {
                        return 65543;
                      }
                      return 0;
                    }
                    return (v4 + 5);
                  }
                }
              }
            }
LABEL_112:
            __break(0x5519u);
            return (v4 + 5);
          }
        }
        goto LABEL_114;
      }
    }
    else
    {
      return 65538;
    }
  }
  return result;
}

uint64_t ccder_blob_decode_ber_tl(unsigned __int8 **a1, uint64_t a2, unsigned char *a3, unint64_t *a4)
{
  int v8 = ccder_blob_decode_tag();
  uint64_t result = 0;
  if (v8)
  {
    if (a2 == 0xAAAAAAAAAAAAAAAALL) {
      return ccder_blob_decode_ber_len(a1, a3, a4);
    }
  }
  return result;
}

uint64_t ccder_blob_decode_eoc(unint64_t *a1, int a2)
{
  if (!a2) {
    return 1;
  }
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return result;
  }
  unint64_t v4 = *a1;
  if (*a1 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_12:
    __break(0x5519u);
    return result;
  }
  unint64_t v5 = v4 - 0x5555555555555556;
  if (v4 > v4 - 0x5555555555555556 || v5 > a1[1]) {
    goto LABEL_12;
  }
  *a1 = v5;
  return 1;
}

uint64_t CMSParseContentInfoSignedData(unsigned __int8 *a1, uint64_t a2, unint64_t *a3)
{
  return CMSParseContentInfoSignedDataWithOptions(a1, a2, a3, 0);
}

uint64_t CMSParseSignerInfos(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, long long *))
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v84 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v85 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  if (__CFADD__(v4, v3)) {
    goto LABEL_93;
  }
  if (v4 > v4 + v3) {
    goto LABEL_92;
  }
  id v84 = *(unsigned __int8 **)(a1 + 40);
  uint64_t v85 = (unsigned __int8 *)(v4 + v3);
  unint64_t v72 = 0xAAAAAAAAAAAAAAAALL;
  if (v4 >= v4 + v3)
  {
    unsigned int v48 = 0;
    uint64_t result = 0;
    if (v3) {
      return (v48 << 8) | 0x30008;
    }
    return result;
  }
  unsigned int v6 = 0;
  unsigned __int8 v60 = 0;
  int v7 = 256;
  while (1)
  {
    unsigned __int8 v71 = 0;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    DWORD2(v83) = 327681;
    LOBYTE(v82) = v6 + 1;
    if ((ccder_blob_decode_ber_tl(&v84, 0x2000000000000010, &v71, &v72) & 1) == 0)
    {
      int v49 = 196609;
      return v7 | v49;
    }
    int v69 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    BOOL v70 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v84, v72)) {
      goto LABEL_93;
    }
    if (v84 > &v84[v72] || &v84[v72] > v85) {
      goto LABEL_92;
    }
    int v69 = v84;
    BOOL v70 = &v84[v72];
    if ((ccder_blob_decode_uint64() & 1) == 0)
    {
      int v49 = 196610;
      return v7 | v49;
    }
    uint64_t v9 = v69;
    int v8 = v70;
    uint64_t v67 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v68 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70) {
      goto LABEL_92;
    }
    uint64_t v67 = v69;
    unint64_t v68 = (unint64_t)v70;
    uint64_t v65 = v69;
    id v66 = v70;
    if (!ccder_blob_decode_tl()) {
      break;
    }
    unint64_t v10 = v69;
LABEL_19:
    if (__CFADD__(v72, v10 - v9)) {
      goto LABEL_94;
    }
    if (v72 + v10 - v9 > v8 - v9) {
      goto LABEL_92;
    }
    *((void *)&v73 + 1) = v9;
    *(void *)&long long v74 = v72 + v10 - v9;
    if (__CFADD__(v10, v72)) {
      goto LABEL_93;
    }
    if (v10 > &v10[v72] || &v10[v72] > v70) {
      goto LABEL_92;
    }
    int v69 = &v10[v72];
    if (!ccder_blob_decode_AlgorithmIdentifierNULL((unint64_t *)&v69, (unint64_t *)&v74 + 1))
    {
      int v49 = 196612;
      return v7 | v49;
    }
    uint64_t v63 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    id v64 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70) {
      goto LABEL_92;
    }
    uint64_t v63 = v69;
    id v64 = v70;
    if (ccder_blob_decode_tl())
    {
      if (v64 < v63 || v72 > v64 - v63) {
        goto LABEL_92;
      }
      *((void *)&v75 + 1) = v63;
      *(void *)&long long v76 = v72;
      if (__CFADD__(v63, v72)) {
        goto LABEL_93;
      }
      if (v63 > &v63[v72] || &v63[v72] > v64) {
        goto LABEL_92;
      }
      int v69 = &v63[v72];
      BOOL v70 = v64;
    }
    else
    {
      *((void *)&v75 + 1) = 0;
      *(void *)&long long v76 = 0;
    }
    if ((ccder_blob_decode_AlgorithmIdentifierNULL((unint64_t *)&v69, (unint64_t *)&v76 + 1) & 1) == 0)
    {
      int v49 = 196613;
      return v7 | v49;
    }
    if ((ccder_blob_decode_tl() & 1) == 0)
    {
      int v49 = 196614;
      return v7 | v49;
    }
    if (v70 < v69 || v72 > v70 - v69) {
      goto LABEL_92;
    }
    *((void *)&v78 + 1) = v69;
    *(void *)&long long v79 = v72;
    if (__CFADD__(v69, v72)) {
      goto LABEL_93;
    }
    int v12 = &v69[v72];
    if (v69 > &v69[v72] || v12 > v70) {
      goto LABEL_92;
    }
    v69 += v72;
    uint64_t v63 = v12;
    id v64 = v70;
    if (ccder_blob_eat_ber_inner(&v63, 0xA000000000000001, 0, 125))
    {
      if (v63 > v64) {
        goto LABEL_92;
      }
      int v69 = v63;
      BOOL v70 = v64;
    }
    if ((ccder_blob_decode_eoc((unint64_t *)&v69, v71) & 1) == 0)
    {
      int v49 = 196615;
      return v7 | v49;
    }
    digest = find_digest((uint64_t)&v74 + 8);
    if (digest)
    {
      uint64_t v14 = digest;
      unsigned int v15 = *(_DWORD *)(a1 + 96);
      if (!v15 || *digest <= v15)
      {
        uint64_t result = a3(a2, a1, &v73);
        if (result != 327710)
        {
          if (result) {
            return result;
          }
          unint64_t v17 = *(void *)(a1 + 64);
          if (v17 <= v60)
          {
            if (v17)
            {
              int v29 = v60 - 1;
              unint64_t v30 = *(void *)(a1 + 56);
              uint64_t v31 = 176 * v29;
              if (__CFADD__(v30, v31)) {
                goto LABEL_93;
              }
              unint64_t v32 = v30 + 176 * v29;
              if (v32 >= v30 + 176 * v17 || v32 < v30) {
                goto LABEL_92;
              }
              unint64_t v33 = find_digest(v30 + 176 * v29 + 24);
              if (v33)
              {
                if (*v14 > *v33)
                {
                  unsigned int v34 = *(_DWORD *)(a1 + 96);
                  if (!v34 || *v14 <= v34)
                  {
                    unint64_t v35 = *(void *)(a1 + 56);
                    if (__CFADD__(v35, v31)) {
                      goto LABEL_93;
                    }
                    unsigned __int8 v36 = (_OWORD *)(v35 + 176 * v29);
                    unint64_t v37 = v35 + 176 * *(void *)(a1 + 64);
                    BOOL v38 = v37 >= (unint64_t)v36;
                    unint64_t v39 = v37 - (void)v36;
                    if (!v38 || v35 > (unint64_t)v36 || v39 < 0xB0) {
                      goto LABEL_92;
                    }
                    long long v40 = v73;
                    long long v41 = v75;
                    v36[1] = v74;
                    v36[2] = v41;
                    *unsigned __int8 v36 = v40;
                    long long v42 = v76;
                    long long v43 = v77;
                    long long v44 = v79;
                    v36[5] = v78;
                    v36[6] = v44;
                    v36[3] = v42;
                    unint64_t v36[4] = v43;
                    long long v45 = v80;
                    long long v46 = v81;
                    long long v47 = v83;
                    v36[9] = v82;
                    v36[10] = v47;
                    v36[7] = v45;
                    v36[8] = v46;
                  }
                }
              }
            }
          }
          else
          {
            unsigned int v18 = *(_DWORD *)(a1 + 96);
            if (!v18 || *v14 <= v18)
            {
              uint64_t v19 = *(void *)(a1 + 56);
              if (__CFADD__(v19, 176 * (char)v60)) {
                goto LABEL_93;
              }
              uint64_t v20 = (_OWORD *)(v19 + 176 * v60);
              if (176 * v17 - 176 * v60 < 0xB0) {
                goto LABEL_92;
              }
              long long v21 = v73;
              long long v22 = v75;
              v20[1] = v74;
              v20[2] = v22;
              *uint64_t v20 = v21;
              long long v23 = v76;
              long long v24 = v77;
              long long v25 = v79;
              v20[5] = v78;
              v20[6] = v25;
              v20[3] = v23;
              v20[4] = v24;
              long long v26 = v80;
              long long v27 = v81;
              long long v28 = v83;
              v20[9] = v82;
              v20[10] = v28;
              v20[7] = v26;
              v20[8] = v27;
              if (v60 == 0xFF)
              {
                __break(0x5507u);
                return result;
              }
              ++v60;
            }
          }
        }
      }
    }
    if (v69 > v85 || v84 > v69) {
      goto LABEL_92;
    }
    id v84 = v69;
    unsigned int v48 = v6 + 1;
    if (v6 <= 6)
    {
      v7 += 256;
      ++v6;
      if (v69 < v85) {
        continue;
      }
    }
    if (v69 == v85)
    {
      if (v60) {
        return 0;
      }
      uint64_t v50 = *(void *)(a1 + 64);
      if (!v50) {
        return 0;
      }
      if ((unint64_t)(176 * v50) >= 0xB0)
      {
        uint64_t result = 0;
        uint64_t v51 = *(_OWORD **)(a1 + 56);
        long long v52 = v73;
        long long v53 = v75;
        v51[1] = v74;
        v51[2] = v53;
        _OWORD *v51 = v52;
        long long v54 = v76;
        long long v55 = v77;
        long long v56 = v79;
        v51[5] = v78;
        v51[6] = v56;
        v51[3] = v54;
        v51[4] = v55;
        long long v57 = v80;
        long long v58 = v81;
        long long v59 = v83;
        v51[9] = v82;
        v51[10] = v59;
        v51[7] = v57;
        v51[8] = v58;
        return result;
      }
LABEL_92:
      __break(0x5519u);
LABEL_93:
      __break(0x5513u);
LABEL_94:
      __break(0x5500u);
    }
    return (v48 << 8) | 0x30008;
  }
  if (ccder_blob_decode_tl())
  {
    unint64_t v10 = v67;
    BOOL v11 = (unsigned __int8 *)v68;
LABEL_17:
    if (v10 > v11) {
      goto LABEL_92;
    }
    int v69 = v10;
    BOOL v70 = v11;
    goto LABEL_19;
  }
  if (ccder_blob_decode_tl())
  {
    unint64_t v10 = v65;
    BOOL v11 = v66;
    goto LABEL_17;
  }
  int v49 = 196611;
  return v7 | v49;
}

uint64_t CMSBuildPath(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v3 = *(void *)(a3 + 8);
  uint64_t v4 = *(void *)(a3 + 16);
  if (__CFADD__(v3, v4)) {
LABEL_49:
  }
    __break(0x5513u);
  unint64_t v5 = v3 + v4;
  if (v3 > v5) {
    goto LABEL_48;
  }
  unint64_t v20 = *(void *)(a3 + 8);
  unint64_t v21 = v5;
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  if (*(void *)a3 != 3)
  {
    if (*(void *)a3 != 1) {
      return 524289;
    }
    uint64_t v8 = 524293;
    if (!ccder_blob_decode_tl()) {
      return 524290;
    }
    if (!ccder_blob_decode_tl()) {
      return 524291;
    }
    if (v21 >= v20 && v19 <= v21 - v20)
    {
      unint64_t v15 = v20;
      unint64_t v16 = v19;
      if (__CFADD__(v20, v19)) {
        goto LABEL_49;
      }
      if (v20 <= v20 + v19 && v20 + v19 <= v21)
      {
        v20 += v19;
        if (!ccder_blob_decode_tl()) {
          return 524292;
        }
        if (v21 >= v20 && v19 <= v21 - v20)
        {
          unint64_t v17 = v20;
          unint64_t v18 = v19;
          if (__CFADD__(v20, v19)) {
            goto LABEL_49;
          }
          if (v20 <= v20 + v19 && v20 + v19 <= v21)
          {
            v20 += v19;
            uint64_t v9 = *(void **)(a2 + 24);
            if (!v9) {
              return v8;
            }
            while (compare_octet_string((uint64_t)&v15, (uint64_t)(v9 + 15))
                 || compare_octet_string((uint64_t)&v17, (uint64_t)(v9 + 17)))
            {
              uint64_t v9 = (void *)v9[34];
              if (!v9) {
                return v8;
              }
            }
            goto LABEL_36;
          }
        }
      }
    }
    goto LABEL_48;
  }
  if (*(void *)(a2 + 88) == 1) {
    return 524298;
  }
  unint64_t v15 = v3;
  unint64_t v16 = v5;
  if (ccder_blob_decode_tl())
  {
    unint64_t v11 = v20;
    unint64_t v10 = v21;
    goto LABEL_29;
  }
  uint64_t v8 = 524294;
  if (!ccder_blob_decode_tl() || !ccder_blob_decode_tl()) {
    return v8;
  }
  unint64_t v11 = v15;
  unint64_t v10 = v16;
  if (v15 > v16)
  {
LABEL_48:
    __break(0x5519u);
    goto LABEL_49;
  }
  unint64_t v20 = v15;
  unint64_t v21 = v16;
LABEL_29:
  if (v10 < v11 || v19 > v10 - v11) {
    goto LABEL_48;
  }
  unint64_t v17 = v11;
  unint64_t v18 = v19;
  if (__CFADD__(v11, v19)) {
    goto LABEL_49;
  }
  if (v11 > v11 + v19 || v11 + v19 > v10) {
    goto LABEL_48;
  }
  unint64_t v20 = v11 + v19;
  uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier((uint64_t *)(a2 + 24), (uint64_t)&v17);
  if (!CertificateUsingKeyIdentifier) {
    return 524295;
  }
  uint64_t v9 = (void *)CertificateUsingKeyIdentifier;
LABEL_36:
  if (v20 != v21) {
    return 524543;
  }
  uint64_t v13 = X509ChainBuildPath(v9, (uint64_t *)(a2 + 24), (void *)(a3 + 152));
  uint64_t v8 = v13;
  if (*(_DWORD *)(a3 + 168) == 327681) {
    *(_DWORD *)(a3 + 168) = v13;
  }
  return v8;
}

uint64_t validateSignerInfo(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  uint64_t v6 = a3 + 24;
  digest = find_digest(a3 + 24);
  if (!digest) {
    return 327682;
  }
  uint64_t v8 = (unint64_t *)(*((uint64_t (**)(void))digest + 3))();
  uint64_t v9 = v8;
  memset(v86, 0, sizeof(v86));
  unint64_t v10 = (_OWORD *)a2[13];
  unint64_t v11 = a2[14];
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (a2[9] && a2[10])
    {
      unint64_t v10 = v86;
      uint64_t v13 = ccdigest();
      unint64_t v11 = *v9;
      if (*v9 >= 0x41) {
        goto LABEL_180;
      }
      goto LABEL_16;
    }
    if (!v10) {
      goto LABEL_144;
    }
  }
  if (*v8 != v11)
  {
LABEL_144:
    *(_DWORD *)(a3 + 168) = 327710;
    return 327710;
  }
  if (v11 > 0x40) {
    goto LABEL_180;
  }
  uint64_t v13 = __memcpy_chk();
LABEL_16:
  *(void *)(a3 + 128) = v10;
  *(void *)(a3 + 136) = v11;
  unint64_t v15 = (void *)(a3 + 128);
  uint64_t v16 = *(void *)(a3 + 48);
  if (!v16) {
    goto LABEL_159;
  }
  uint64_t v71 = a1;
  long long v79 = (char *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v80 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = *(void *)(a3 + 40);
  if (__CFADD__(v17, v16)) {
    goto LABEL_181;
  }
  unint64_t v18 = v17 + v16;
  if (v17 > v18)
  {
LABEL_180:
    __break(0x5519u);
    goto LABEL_181;
  }
  long long v79 = *(char **)(a3 + 40);
  unint64_t v80 = v18;
  unint64_t v78 = 0xAAAAAAAAAAAAAAAALL;
  if (v17 < v18)
  {
    int v19 = 0;
    uint64_t v74 = 0x2000000000000010;
    unsigned int v70 = 262146;
    unsigned int v73 = 262147;
    unsigned int v72 = 262148;
    do
    {
      if (!ccder_blob_decode_tl())
      {
        uint64_t result = 262145;
        goto LABEL_176;
      }
      if (__CFADD__(v79, v78)) {
        goto LABEL_181;
      }
      unint64_t v20 = &v79[v78];
      long long v77 = (char *)0xAAAAAAAAAAAAAAAALL;
      long long v76 = (char *)0xAAAAAAAAAAAAAAAALL;
      if (v79 > &v79[v78] || (unint64_t)v20 > v80) {
        goto LABEL_180;
      }
      long long v76 = v79;
      long long v77 = &v79[v78];
      if (!ccder_blob_decode_tl())
      {
        uint64_t result = v70;
        goto LABEL_176;
      }
      uint64_t v22 = v76;
      if (__CFADD__(v76, v78)) {
        goto LABEL_181;
      }
      if (v76 > &v76[v78] || &v76[v78] > v77) {
        goto LABEL_180;
      }
      v76 += v78;
      if (v78 != 9) {
        goto LABEL_147;
      }
      if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 3)
      {
        if (v19) {
          goto LABEL_149;
        }
        *(void *)id v84 = 0xAAAAAAAAAAAAAAAALL;
        int v33 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v33)
        {
          if (CMSAttributeParseContentType(&v76)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 1u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 4)
      {
        if ((v19 & 2) != 0) {
          goto LABEL_149;
        }
        *(void *)id v84 = 0xAAAAAAAAAAAAAAAALL;
        int v36 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v36)
        {
          if (CMSAttributeParseMessageDigest((uint64_t)&v76, v34, v35, a3)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 2u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x96463F78648862ALL && v22[8] == 2)
      {
        if ((v19 & 0x10) != 0) {
          goto LABEL_149;
        }
        unint64_t v83 = 0xAAAAAAAAAAAAAAAALL;
        int v37 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v37)
        {
          BOOL v38 = v76;
          unint64_t v39 = v77;
          if (v76 >= v77)
          {
LABEL_111:
            if (v38 == v39) {
              uint64_t result = 0;
            }
            else {
              uint64_t result = 262155;
            }
          }
          else
          {
            while (1)
            {
              if (!ccder_blob_decode_tl())
              {
                uint64_t result = 262157;
                goto LABEL_134;
              }
              memset(v84, 170, 16);
              if (__CFADD__(v76, v83)) {
                goto LABEL_181;
              }
              if (v76 > &v76[v83] || &v76[v83] > v77) {
                goto LABEL_180;
              }
              *(void *)id v84 = v76;
              *(void *)&v84[8] = &v76[v83];
              if ((ccder_blob_decode_tl() & 1) == 0)
              {
                uint64_t result = 262151;
                goto LABEL_134;
              }
              long long v81 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
              long long v82 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
              if (*(void *)&v84[8] < *(void *)v84 || v83 > *(void *)&v84[8] - *(void *)v84) {
                goto LABEL_180;
              }
              long long v81 = *(unsigned char **)v84;
              long long v82 = (unsigned char *)v83;
              if (__CFADD__(*(void *)v84, v83)) {
                goto LABEL_181;
              }
              if (*(void *)v84 > *(void *)v84 + v83 || *(void *)v84 + v83 > *(void *)&v84[8]) {
                goto LABEL_180;
              }
              *(void *)v84 += v83;
              if (!ccder_blob_decode_tl())
              {
                uint64_t result = 262152;
                goto LABEL_134;
              }
              uint64_t v41 = *(void *)v84;
              if (__CFADD__(*(void *)v84, v83)) {
                goto LABEL_181;
              }
              unint64_t v42 = *(void *)v84 + v83;
              if (*(void *)v84 > *(void *)v84 + v83) {
                goto LABEL_180;
              }
              uint64_t v43 = *(void *)&v84[8];
              if (v42 > *(void *)&v84[8]) {
                goto LABEL_180;
              }
              *(void *)v84 += v83;
              if (v42 != *(void *)&v84[8]) {
                break;
              }
              long long v44 = find_digest((uint64_t)&v81);
              if (v44)
              {
                unsigned int v45 = *v44;
                if (*v44 > *(_DWORD *)(a3 + 104))
                {
                  unsigned int v46 = *(_DWORD *)(v71 + 8);
                  if (!v46 || v45 <= v46)
                  {
                    *(_DWORD *)(a3 + 104) = v45;
                    unint64_t v47 = v83;
                    if (v83 > v43 - v41) {
                      goto LABEL_180;
                    }
                    *(void *)(a3 + 112) = v41;
                    *(void *)(a3 + 120) = v47;
                  }
                }
              }
              BOOL v38 = *(char **)v84;
              unint64_t v39 = v77;
              if (*(void *)v84 > (unint64_t)v77 || (unint64_t)v76 > *(void *)v84) {
                goto LABEL_180;
              }
              long long v76 = *(char **)v84;
              if (*(void *)v84 >= (unint64_t)v77) {
                goto LABEL_111;
              }
            }
            uint64_t result = 262153;
          }
        }
LABEL_134:
        v19 |= 0x10u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 5)
      {
        if ((v19 & 4) != 0) {
          goto LABEL_149;
        }
        *(void *)id v84 = 0xAAAAAAAAAAAAAAAALL;
        int v48 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v48)
        {
          if (CMSAttributeParseSigningTime((unint64_t *)&v76)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 4u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x96463F78648862ALL && v22[8] == 1)
      {
        if ((v19 & 8) != 0) {
          goto LABEL_149;
        }
        *(void *)id v84 = 0xAAAAAAAAAAAAAAAALL;
        int v51 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v51)
        {
          if (CMSAttributeParseAppleHashAgility((unint64_t *)&v76, v49, v50, a3)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 8u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 52)
      {
        if ((v19 & 0x20) != 0)
        {
LABEL_149:
          uint64_t result = 262149;
          goto LABEL_176;
        }
        v19 |= 0x20u;
      }
      else
      {
        uint64_t v29 = *(void *)v22;
        int v30 = v22[8];
        if (v29 != 0x9010DF78648862ALL || v30 != 15)
        {
LABEL_147:
          uint64_t result = 262150;
          goto LABEL_176;
        }
        if ((v19 & 0x40) != 0) {
          goto LABEL_149;
        }
        *(void *)id v84 = 0xAAAAAAAAAAAAAAAALL;
        int v32 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v32)
        {
          if (CMSAttributeParseSMIMECapabilities(&v76)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 0x40u;
        if (result) {
          goto LABEL_176;
        }
      }
      if ((unint64_t)v20 > v80 || v79 > v20) {
        goto LABEL_180;
      }
      long long v79 = v20;
    }
    while ((unint64_t)v20 < v80);
    if ((~v19 & 3) == 0)
    {
      uint64_t v53 = ccder_sizeof_tag();
      uint64_t v54 = ccder_sizeof_len();
      BOOL v55 = __CFADD__(v53, v54);
      unint64_t v56 = v53 + v54;
      if (v55) {
        goto LABEL_182;
      }
      if (v56 > 0x14)
      {
        uint64_t result = 327689;
        goto LABEL_176;
      }
      memset(v84, 170, sizeof(v84));
      long long v81 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
      long long v82 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
      if (!__CFADD__(v84, v56))
      {
        if (&v84[v56] <= (unsigned char *)&v85 && v84 <= &v84[v56])
        {
          long long v81 = v84;
          long long v82 = &v84[v56];
          uint64_t v57 = ccder_blob_encode_tl();
          if (!v57)
          {
            uint64_t result = 327688;
            goto LABEL_176;
          }
          unint64_t v58 = v9[1];
          BOOL v55 = __CFADD__(v58, 8);
          unint64_t v59 = v58 + 8;
          if (!v55)
          {
            unint64_t v60 = v9[2];
            BOOL v55 = __CFADD__(v59, v60);
            unint64_t v61 = v59 + v60;
            if (!v55)
            {
              BOOL v55 = __CFADD__(v61, 4);
              unint64_t v62 = v61 + 4;
              if (!v55 && v62 < 0xFFFFFFFFFFFFFFF8)
              {
                MEMORY[0x270FA5388](v57);
                id v64 = (char *)&v69 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
                memset(v64, 170, ((v65 - 9) & 0xFFFFFFFFFFFFFFF8) + 8);
                ccdigest_init();
                ccdigest_update();
                ccdigest_update();
                uint64_t v13 = ((uint64_t (*)(unint64_t *, char *, _OWORD *))v9[7])(v9, v64, v86);
LABEL_159:
                uint64_t result = CMSBuildPath(v13, (uint64_t)a2, a3);
                switch((int)result)
                {
                  case 524293:
                  case 524295:
                    *(_DWORD *)(a3 + 168) = result;
                    return 0;
                  case 524294:
                    goto LABEL_176;
                  case 524296:
                    if (*(_DWORD *)(a3 + 168) != 458753) {
                      goto LABEL_167;
                    }
                    int v66 = 524296;
LABEL_166:
                    *(_DWORD *)(a3 + 168) = v66;
LABEL_167:
                    unint64_t v67 = *v9;
                    if (*v9 > 0x40) {
                      goto LABEL_180;
                    }
                    v75[0] = v86;
                    v75[1] = v67;
                    uint64_t result = X509CertificateCheckSignatureDigest(29, *(void *)(a3 + 152), v75, v6);
                    if (!result || result == 655648 || result == 655632)
                    {
                      int v68 = *(_DWORD *)(a3 + 168);
                      if (!v68 || v68 == 458753 || v68 == 327681) {
                        *(_DWORD *)(a3 + 168) = result;
                      }
                      uint64_t result = 0;
                    }
                    break;
                  case 524297:
                    int v66 = 524297;
                    goto LABEL_166;
                  default:
                    if (result) {
                      goto LABEL_176;
                    }
                    goto LABEL_167;
                }
                goto LABEL_176;
              }
            }
          }
LABEL_182:
          __break(0x5500u);
          JUMPOUT(0x21DC84604);
        }
        goto LABEL_180;
      }
LABEL_181:
      __break(0x5513u);
    }
  }
  uint64_t result = 262156;
LABEL_176:
  if ((_OWORD *)*v15 == v86)
  {
    *unint64_t v15 = 0;
    *(void *)(a3 + 136) = 0;
  }
  return result;
}

uint64_t validateSignerInfoAndChain(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = validateSignerInfo((uint64_t)a1, a2, a3);
  if (!v5)
  {
    int v7 = X509ChainCheckPath(29, (uint64_t *)(a3 + 152), *a1);
    if (v7)
    {
      if (!*(_DWORD *)(a3 + 168)) {
        *(_DWORD *)(a3 + 168) = v7;
      }
    }
  }
  return v5;
}

uint64_t CMSVerifySignedDataWithLeaf(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  v9[0] = 0;
  return CMSVerify(a1, a2, a3, a4, a5, a6, a7, &v8, v9);
}

uint64_t CMSVerify(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v29 = 0;
  v30[0] = 0;
  memset(v28, 0, sizeof(v28));
  uint64_t v26 = 0;
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = (char *)&v23 + 8;
  v30[1] = 0;
  memset(__b, 170, sizeof(__b));
  v22[0] = 4;
  v22[1] = (unint64_t)__b;
  long long v20 = 0u;
  long long v21 = 0u;
  memset(v19, 0, sizeof(v19));
  long long v27 = v19;
  *(void *)&v28[0] = 1;
  DWORD2(v21) = 327681;
  if (a2 < 0) {
    goto LABEL_19;
  }
  uint64_t result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v22, 0);
  if (result) {
    return result;
  }
  if (!a4) {
    goto LABEL_7;
  }
  uint64_t result = 131091;
  if (*(_OWORD *)((char *)v28 + 8) != 0) {
    return result;
  }
  if (a4 < 0) {
LABEL_19:
  }
    __break(0x5519u);
  *((void *)&v28[0] + 1) = a3;
  *(void *)&v28[1] = a4;
LABEL_7:
  v30[0] = a5;
  DWORD2(v21) = 458753;
  uint64_t result = CMSParseSignerInfos((uint64_t)v22, (uint64_t)v30, (uint64_t (*)(uint64_t, uint64_t, long long *))validateSignerInfoAndChain);
  if (!result)
  {
    uint64_t result = DWORD2(v21);
    if (!DWORD2(v21))
    {
      if (a6 && a7) {
        uint64_t result = X509CertificateParseKey(*((uint64_t *)&v20 + 1), a6, a7);
      }
      if (!a4)
      {
        if (a8)
        {
          if (a9)
          {
            uint64_t v18 = *(void *)&v28[1];
            if (*(void *)&v28[1])
            {
              if (*((void *)&v28[0] + 1))
              {
                *a8 = *((void *)&v28[0] + 1);
                *a9 = v18;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t CMSVerifySignedData(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  v9[0] = 0;
  uint64_t v8 = 0;
  return CMSVerify(a1, a2, a3, a4, a5, &v6, &v7, &v8, v9);
}

uint64_t CMSVerifyAndReturnSignedData(unsigned __int8 *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  v7[0] = 0;
  return CMSVerify(a1, a2, 0, 0, a5, &v6, v7, a3, a4);
}

uint64_t ccder_blob_decode_ber_len(unsigned __int8 **a1, unsigned char *a2, unint64_t *a3)
{
  *a2 = 0;
  unint64_t v3 = *a1;
  if (!*a1) {
    return 0;
  }
  unint64_t v4 = (unint64_t)a1[1];
  if ((unint64_t)v3 >= v4) {
    return 0;
  }
  if (v3 == (unsigned __int8 *)-1)
  {
LABEL_42:
    __break(0x5513u);
    JUMPOUT(0x21DC84B40);
  }
  uint64_t v5 = v3 + 1;
  if (v3 >= v3 + 1 || (unint64_t)v5 > v4)
  {
LABEL_41:
    __break(0x5519u);
    goto LABEL_42;
  }
  *a1 = v5;
  unint64_t v7 = *v3;
  if ((char)*v3 < 0)
  {
    switch(*v3)
    {
      case 0x80u:
        unint64_t v7 = v4 - (void)v5;
        *a2 = 1;
        break;
      case 0x81u:
        if ((uint64_t)(v4 - (void)v5) < 1) {
          return 0;
        }
        if (v3 == (unsigned __int8 *)-2) {
          goto LABEL_42;
        }
        uint64_t v9 = v3 + 2;
        if (v5 > v9 || (unint64_t)v9 > v4) {
          goto LABEL_41;
        }
        *a1 = v9;
        unint64_t v7 = *v5;
        uint64_t v5 = v9;
        break;
      case 0x82u:
        if ((uint64_t)(v4 - (void)v5) < 2) {
          return 0;
        }
        if ((unint64_t)v5 >= v4) {
          goto LABEL_41;
        }
        if (v3 == (unsigned __int8 *)-2) {
          goto LABEL_42;
        }
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4) {
          goto LABEL_41;
        }
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_42;
        }
        unint64_t v10 = v3 + 3;
        if (v5 > v3 + 3 || (unint64_t)v10 > v4) {
          goto LABEL_41;
        }
        unint64_t v11 = (unint64_t)v3[1] << 8;
        uint64_t v12 = v3[2];
        goto LABEL_40;
      case 0x83u:
        if ((uint64_t)(v4 - (void)v5) < 3) {
          return 0;
        }
        if ((unint64_t)v5 >= v4) {
          goto LABEL_41;
        }
        if (v3 == (unsigned __int8 *)-2) {
          goto LABEL_42;
        }
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4) {
          goto LABEL_41;
        }
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_42;
        }
        if (v3 + 3 < v5 || (unint64_t)(v3 + 3) >= v4) {
          goto LABEL_41;
        }
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFCLL) {
          goto LABEL_42;
        }
        unint64_t v10 = v3 + 4;
        if (v5 > v3 + 4 || (unint64_t)v10 > v4) {
          goto LABEL_41;
        }
        unint64_t v11 = ((unint64_t)v3[1] << 16) | ((unint64_t)v3[2] << 8);
        uint64_t v12 = v3[3];
LABEL_40:
        unint64_t v7 = v11 | v12;
        *a1 = v10;
        uint64_t v5 = v10;
        break;
      default:
        return 0;
    }
  }
  if (v4 - (unint64_t)v5 < v7) {
    return 0;
  }
  *a3 = v7;
  return 1;
}

uint64_t CMSParseImplicitCertificateSet(unsigned __int8 **a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  *a4 = 0;
  a4[1] = 0;
  int v30 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = *a1;
  unint64_t v6 = (unint64_t)a1[1];
  if ((unint64_t)*a1 > v6)
  {
LABEL_43:
    __break(0x5519u);
LABEL_44:
    __break(0x5513u);
  }
  int v30 = *a1;
  unint64_t v31 = v6;
  BOOL v7 = (unint64_t)v5 >= v6 || a3 == 0;
  if (v7)
  {
    unint64_t v12 = 0;
LABEL_8:
    if (a5) {
      *a5 = v12;
    }
    return 1;
  }
  else
  {
    unint64_t v12 = 0;
    unint64_t v13 = 304 * a3;
    unint64_t v14 = a2 + 304 * a3;
    unint64_t v25 = ~a2;
    long long v27 = (unint64_t **)(a4 + 1);
    long long v23 = (unint64_t *)(a2 + 272);
    unint64_t v15 = a2;
    while (1)
    {
      char v29 = 0;
      if (!ccder_blob_decode_tag()) {
        return 0;
      }
      if (!v32) {
        goto LABEL_8;
      }
      if (!ccder_blob_decode_ber_len(&v30, &v29, &v28) || v29 || v32 != 0x2000000000000010) {
        return 0;
      }
      if ((unsigned __int128)((uint64_t)v12 * (__int128)304) >> 64 != (uint64_t)(304 * v12) >> 63 || 304 * v12 > v25) {
        goto LABEL_44;
      }
      if (v15 > v14) {
        goto LABEL_43;
      }
      if (v15 < a2) {
        goto LABEL_43;
      }
      BOOL v16 = v13 >= 0x130;
      v13 -= 304;
      if (!v16) {
        goto LABEL_43;
      }
      *(_OWORD *)(v15 + 272) = 0u;
      *(_OWORD *)(v15 + 288) = 0u;
      *(_OWORD *)(v15 + 240) = 0u;
      *(_OWORD *)(v15 + 256) = 0u;
      *(_OWORD *)(v15 + 208) = 0u;
      *(_OWORD *)(v15 + 224) = 0u;
      *(_OWORD *)(v15 + 176) = 0u;
      *(_OWORD *)(v15 + 192) = 0u;
      *(_OWORD *)(v15 + 144) = 0u;
      *(_OWORD *)(v15 + 160) = 0u;
      *(_OWORD *)(v15 + 112) = 0u;
      *(_OWORD *)(v15 + 128) = 0u;
      *(_OWORD *)(v15 + 80) = 0u;
      *(_OWORD *)(v15 + 96) = 0u;
      *(_OWORD *)(v15 + 48) = 0u;
      *(_OWORD *)(v15 + 64) = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      *(_OWORD *)(v15 + 32) = 0u;
      *(_OWORD *)unint64_t v15 = 0u;
      if (v12)
      {
        if (v15 + 304 > v14) {
          goto LABEL_43;
        }
        *(void *)(v15 + 272) = 0;
        unint64_t v17 = *v27;
        *(void *)(v15 + 280) = *v27;
        if (v15)
        {
          if (v15 >= v14) {
            goto LABEL_43;
          }
        }
        *unint64_t v17 = v15;
        *long long v27 = (unint64_t *)(v15 + 272);
      }
      else
      {
        if (v15 + 304 > v14) {
          goto LABEL_43;
        }
        unint64_t v18 = *a4;
        *long long v23 = *a4;
        int v19 = (unint64_t **)(v18 + 280);
        BOOL v7 = v18 == 0;
        long long v20 = v27;
        if (!v7) {
          long long v20 = v19;
        }
        *long long v20 = v23;
        if (v15)
        {
          if (v15 >= v14) {
            goto LABEL_43;
          }
        }
        *a4 = v15;
        *(void *)(a2 + 280) = a4;
      }
      if (X509CertificateParseImplicit(v15, (unint64_t *)&v30, 0, 0)) {
        return 0;
      }
      if (v6 < (unint64_t)v5) {
        goto LABEL_43;
      }
      long long v21 = v30;
      uint64_t v22 = (unsigned __int8 *)(v30 - v5);
      if (v30 - v5 > v6 - (unint64_t)v5) {
        goto LABEL_43;
      }
      if (v15 + 304 > v14) {
        goto LABEL_43;
      }
      *(void *)unint64_t v15 = v5;
      *(void *)(v15 + 8) = v22;
      unint64_t v6 = v31;
      if ((unint64_t)v21 > v31) {
        goto LABEL_43;
      }
      *a1 = v21;
      a1[1] = (unsigned __int8 *)v6;
      ++v12;
      if ((unint64_t)v21 < v6)
      {
        v15 += 304;
        uint64_t v5 = v21;
        if (v12 < a3) {
          continue;
        }
      }
      goto LABEL_8;
    }
  }
}

uint64_t ccder_blob_eat_ber_inner(unsigned __int8 **a1, uint64_t a2, unsigned __int8 **a3, int a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v15 = 0;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = ccder_blob_decode_tag();
  uint64_t result = 0;
  if (v8 && v14 == a2)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t result = ccder_blob_decode_ber_len(a1, &v15, &v13);
    if ((result & 1) == 0) {
      return 0;
    }
    if (a3)
    {
      unint64_t v10 = a1[1];
      if (*a1 > v10) {
        goto LABEL_18;
      }
      *a3 = *a1;
      a3[1] = v10;
    }
    if (v15)
    {
      if (a4 >= 1)
      {
        uint64_t result = ccder_blob_eat_ber_inner(a1, 0, 0, (char)(a4 - 1));
        if (!result) {
          return result;
        }
        return (ccder_blob_decode_eoc((unint64_t *)a1, 1) & 1) != 0;
      }
      return 0;
    }
    unint64_t v11 = *a1;
    if (__CFADD__(*a1, v13))
    {
LABEL_19:
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = &v11[v13];
    if (v11 <= &v11[v13] && v12 <= a1[1])
    {
      *a1 = v12;
      return 1;
    }
LABEL_18:
    __break(0x5519u);
    goto LABEL_19;
  }
  return result;
}

uint64_t CMSAttributeParseContentType(char **a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    if ((unint64_t)*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      if (v3 - 0x5555555555555556 != a1[1]) {
        return 0;
      }
      if (v3 <= v3 - 0x5555555555555556) {
        return compare_octet_string_raw((uint64_t)&pkcs7_data_oid, v3, 0xAAAAAAAAAAAAAAAALL) == 0;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t CMSAttributeParseMessageDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*(void *)a1 >= 0x5555555555555556uLL)
    {
      __break(0x5513u);
    }
    else if (*(void *)a1 - 0x5555555555555556 == *(void *)(a1 + 8))
    {
      uint64_t result = (uint64_t)find_digest(a4 + 24);
      if (result)
      {
        if (*(void *)(a4 + 136) != 0xAAAAAAAAAAAAAAAALL
          || *(void *)(*(uint64_t (**)(void))(result + 24))() != 0xAAAAAAAAAAAAAAAALL
          || memcmp(*(const void **)(a4 + 128), *(const void **)a1, 0xAAAAAAAAAAAAAAAALL))
        {
          *(_DWORD *)(a4 + 168) = 458754;
        }
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CMSAttributeParseSigningTime(unint64_t *a1)
{
  if (*a1 > a1[1]) {
    goto LABEL_10;
  }
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    goto LABEL_7;
  }
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return result;
  }
  unint64_t v3 = v4;
  if (v4 > v5) {
LABEL_10:
  }
    __break(0x5519u);
  *a1 = v4;
  a1[1] = v5;
LABEL_7:
  if (v3 < 0x5555555555555556) {
    return v3 - 0x5555555555555556 == a1[1];
  }
  __break(0x5513u);
  return result;
}

uint64_t CMSAttributeParseAppleHashAgility(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      if (v7 - 0x5555555555555556 != a1[1]) {
        return 0;
      }
      if (*(_DWORD *)(a4 + 104)) {
        return 1;
      }
      if (v7 <= v7 - 0x5555555555555556)
      {
        *(void *)(a4 + 112) = v7;
        *(void *)(a4 + 120) = 0xAAAAAAAAAAAAAAAALL;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t CMSAttributeParseSMIMECapabilities(void *a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*a1 >= 0x5555555555555556uLL) {
      __break(0x5513u);
    }
    else {
      return *a1 - 0x5555555555555556 == a1[1];
    }
  }
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  size_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  }
  if (v2 > v3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3 = *(void *)(a1 + 8);
  if (v3 == a3) {
    return memcmp(*(const void **)a1, a2, a3);
  }
  if (v3 > a3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t compare_octet_string_partial(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  if (v2 <= *(void *)(a2 + 8)) {
    return memcmp(*(const void **)a2, *(const void **)a1, v2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*a1 > a1[1]) {
      goto LABEL_20;
    }
    unint64_t v5 = *a1;
    unint64_t v6 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (a2)
    {
      if (v6 < v5) {
        goto LABEL_20;
      }
      *a2 = v5;
      a2[1] = 0;
    }
    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
    else if (v5 <= v6)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (!result) {
        return result;
      }
      if (v5 != v6) {
        return 0;
      }
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
LABEL_20:
    __break(0x5519u);
  }
  return result;
}

uint64_t ccder_blob_decode_Time(void *a1)
{
  if (*a1 > a1[1]) {
    goto LABEL_6;
  }
  if (ccder_blob_decode_tl()) {
    return 0;
  }
  if (*a1 > a1[1]) {
LABEL_6:
  }
    __break(0x5519u);
  ccder_blob_decode_tl();
  return 0;
}

uint64_t ccder_blob_decode_GeneralName(unint64_t *a1, int *a2, unint64_t *a3)
{
  uint64_t result = 0;
  if (a2 && a3)
  {
    *a3 = 0;
    a3[1] = 0;
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      *a2 = 0;
LABEL_6:
      unint64_t v7 = v10;
LABEL_16:
      if (v7 <= a1[1] && *a1 <= v7)
      {
        *a1 = v7;
        return 1;
      }
LABEL_42:
      __break(0x5519u);
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v11 = *a1;
    unint64_t v16 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v11;
      if (v16 < v11) {
        goto LABEL_42;
      }
      *a3 = v11;
      a3[1] = 0;
      int v8 = 1;
LABEL_15:
      *a2 = v8;
      goto LABEL_16;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v12 = *a1;
    unint64_t v17 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v12;
      if (v17 < v12) {
        goto LABEL_42;
      }
      *a3 = v12;
      a3[1] = 0;
      int v8 = 2;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      int v9 = 3;
LABEL_23:
      *a2 = v9;
      goto LABEL_6;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v13 = *a1;
    unint64_t v18 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v13;
      if (v18 < v13) {
        goto LABEL_42;
      }
      *a3 = v13;
      a3[1] = 0;
      int v8 = 4;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      int v9 = 5;
      goto LABEL_23;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v14 = *a1;
    unint64_t v19 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v14;
      if (v19 < v14) {
        goto LABEL_42;
      }
      *a3 = v14;
      a3[1] = 0;
      int v8 = 6;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v15 = *a1;
    unint64_t v20 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v15;
      if (v20 < v15) {
        goto LABEL_42;
      }
      *a3 = v15;
      a3[1] = 0;
      int v8 = 7;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      int v9 = 8;
      goto LABEL_23;
    }
  }
  return result;
}

uint64_t ccder_blob_check_null()
{
  return ccder_blob_decode_tl();
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, void *a5)
{
  uint64_t v6 = 0;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a1 < a2 && a4)
  {
    uint64_t v8 = 0;
    uint64_t v9 = a4 - 1;
    unint64_t v10 = a3;
    unint64_t v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      unint64_t v15 = a1;
      unint64_t v16 = a2;
      uint64_t result = X509CertificateParse((unint64_t *)v17, &v15);
      if (result) {
        break;
      }
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3) {
        __break(0x5519u);
      }
      *unint64_t v10 = v17[0];
      uint64_t v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++) {
          continue;
        }
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    uint64_t result = 0;
    if (a5) {
      *a5 = v6;
    }
  }
  return result;
}

uint64_t CTParseExtensionValue(unint64_t a1, uint64_t a2, const void *a3, size_t a4, void *a5, void *a6)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  memset(v11, 0, sizeof(v11));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_11;
  }
  v10[0] = a1;
  v10[1] = a1 + a2;
  uint64_t result = X509CertificateParseWithExtension((unint64_t *)v11, v10, a3, a4);
  if (!result)
  {
    uint64_t result = 720914;
    if (*((void *)&v12 + 1))
    {
      uint64_t v9 = v13;
      if ((void)v13)
      {
        uint64_t result = 0;
        if (a5)
        {
          if (a6)
          {
            uint64_t result = 0;
            *a5 = *((void *)&v12 + 1);
            *a6 = v9;
          }
        }
      }
    }
  }
  return result;
}

uint64_t CTParseKey(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  memset(v8, 0, sizeof(v8));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_7:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_7;
  }
  v7[0] = a1;
  v7[1] = a1 + a2;
  uint64_t result = X509CertificateParse((unint64_t *)v8, v7);
  if (!result) {
    return X509CertificateParseKey((uint64_t)v8, a3, a4);
  }
  return result;
}

uint64_t CTEvaluateSavageCertsWithUID(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, unsigned char *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&X509PolicySavage, 2);
}

uint64_t CTEvaluateCertifiedChip(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, unsigned char *a7, uint64_t a8, const void *a9, size_t a10, BOOL *a11, uint64_t a12, uint64_t a13)
{
  __b[152] = *MEMORY[0x263EF8340];
  uint64_t result = (uint64_t)memset(__b, 170, 0x4C0uLL);
  memset(v33, 170, sizeof(v33));
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v32 = 0;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_34;
  }
  if (a1 + a2 < a1) {
    goto LABEL_35;
  }
  unint64_t v30 = a1;
  unint64_t v31 = a1 + a2;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v30, (unint64_t)__b, 4, &v33[2], &v32);
  if (result) {
    return result;
  }
  uint64_t result = 327690;
  if (v30 != v31) {
    return result;
  }
  if (v32 != 2) {
    return 327692;
  }
  X509ChainResetChain(v33, &v33[2]);
  __b[74] = v33[0];
  uint64_t v22 = v33[0] ? (uint64_t *)(v33[0] + 296) : &v33[1];
  *uint64_t v22 = (uint64_t)&__b[74];
  if ((void *)((char *)&__b[38] + 1) != 0 && (unint64_t)__b >= 0xFFFFFFFFFFFFFECFLL) {
LABEL_34:
  }
    __break(0x5513u);
  v33[0] = (uint64_t)&__b[38];
  __b[75] = v33;
  __b[36] = 0;
  __b[37] = v33[1];
  *(void *)v33[1] = __b;
  v33[1] = (uint64_t)&__b[36];
  uint64_t result = X509ChainCheckPathWithOptions(12, v33, a12, 0);
  if (result) {
    return result;
  }
  uint64_t v23 = **(void **)(v33[1] + 8);
  uint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  if ((a4 & 0x8000000000000000) != 0) {
    goto LABEL_35;
  }
  uint64_t v28 = a3;
  unint64_t v29 = a4;
  long long v24 = oidForPubKeyLength();
  uint64_t result = X509CertificateCheckSignatureWithPublicKey(&v28, (uint64_t)&ecPublicKey, (uint64_t)v24, v23 + 16, v23 + 40);
  if (result) {
    return result;
  }
  if (a9 && a10)
  {
    if ((a10 & 0x8000000000000000) != 0) {
      goto LABEL_35;
    }
    if (compare_octet_string_raw(v23 + 248, a9, a10)) {
      return 590085;
    }
  }
  unint64_t v25 = v33[0];
  LODWORD(result) = X509CertificateParseKey(v33[0], a5, a6);
  int v26 = result;
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 327691;
  }
  if (!v25 || v26) {
    return result;
  }
  if (a11) {
    *a11 = (*(void *)(v25 + 240) & a13) != 0;
  }
  if (!a7 || !a8) {
    return 0;
  }
  v27[0] = 0;
  v27[1] = 0;
  if (v25 >= v25 + 304) {
    goto LABEL_35;
  }
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(v25 + 104), v27);
  if (result) {
    return result;
  }
  if (a8 < 0)
  {
LABEL_35:
    __break(0x5519u);
    return result;
  }
  uint64_t result = CTCopyUID((uint64_t)v27, a7, a8);
  if (!result) {
    return 0;
  }
  return result;
}

uint64_t CTEvaluateSavageCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, BOOL *a7)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, 0, 0, 0, 0, a7, (uint64_t)&X509PolicySavage, 2);
}

uint64_t CTEvaluateYonkersCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, unsigned char *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&X509PolicyYonkers, 0x80000);
}

uint64_t CTEvaluateSensorCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, const void *a5, size_t a6, void *a7, void *a8, unsigned char *a9, uint64_t a10, BOOL *a11)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a7, a8, a9, a10, a5, a6, a11, (uint64_t)&X509PolicySensor, 0x10000000000);
}

uint64_t CTEvaluateCertsForPolicy(unint64_t a1, uint64_t a2, char a3, int a4, void *a5, void *a6, uint64_t a7, uint64_t a8, void *a9, void *a10, long long *a11)
{
  v41[116] = *MEMORY[0x263EF8340];
  memset(v38, 170, sizeof(v38));
  bzero(v39, 0x4C0uLL);
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_42:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_42;
  }
  uint64_t v36 = a1 + a2;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v35 = a1;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v35, (unint64_t)v39, 4, &v38[2], &v37);
  if (result) {
    return result;
  }
  if (v35 != v36) {
    return 327690;
  }
  if ((a4 & 1) == 0 && !v40)
  {
    X509ChainResetChain(v38, &v38[2]);
    uint64_t v20 = v38[0];
    long long v21 = (uint64_t *)(v38[0] + 296);
    if (!v38[0]) {
      long long v21 = &v38[1];
    }
    uint64_t *v21 = (uint64_t)v41;
    v38[0] = (uint64_t)v39;
    v41[0] = v20;
    v41[1] = v38;
LABEL_20:
    v34[0] = a7;
    v34[1] = a8;
    if (a7) {
      BOOL v23 = a8 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v32 = v24;
    *(_OWORD *)&v32[16] = v24;
    long long v31 = *a11;
    v32[0] = *((unsigned char *)a11 + 16);
    if (v23) {
      char v25 = a3;
    }
    else {
      char v25 = 1;
    }
    v32[1] = v25;
    *(_WORD *)&v32[2] = *((_WORD *)a11 + 9);
    if (v23)
    {
      *(_OWORD *)&v32[8] = *(long long *)((char *)a11 + 24);
      long long v27 = (_UNKNOWN **)*((void *)a11 + 5);
    }
    else
    {
      uint64_t v26 = *((void *)a11 + 4);
      *(void *)&v32[8] = v34;
      *(void *)&v32[16] = v26;
      long long v27 = oidForPubKeyLength();
    }
    uint64_t v28 = *((void *)a11 + 6);
    *(void *)&v32[24] = v27;
    uint64_t v33 = v28;
    uint64_t result = X509ChainCheckPathWithOptions(12, v38, (uint64_t)&v31, 0);
    if (!result)
    {
      unint64_t v29 = (void *)v38[0];
      if (!a5 || !a6 || !v38[0] || (uint64_t result = X509CertificateParseKey(v38[0], a5, a6), !result))
      {
        if (a10 && v29)
        {
          uint64_t v30 = v29[32];
          *a10 = v29[31];
          a10[1] = v30;
        }
        uint64_t result = 0;
        if (a9)
        {
          if (v29)
          {
            uint64_t result = 0;
            *a9 = v29[30];
          }
        }
      }
    }
    return result;
  }
  if (v39[265])
  {
    if (v38[2])
    {
      uint64_t v22 = (unsigned char *)v38[2];
      while (v22[265])
      {
        uint64_t v22 = (unsigned char *)*((void *)v22 + 34);
        if (!v22)
        {
          uint64_t v22 = (unsigned char *)v38[2];
          break;
        }
      }
    }
    else
    {
      uint64_t v22 = 0;
    }
  }
  else
  {
    uint64_t v22 = v39;
  }
  uint64_t result = X509ChainBuildPathPartial(v22, &v38[2], v38, a4 ^ 1u);
  if (!result) {
    goto LABEL_20;
  }
  return result;
}

uint64_t CTEvaluateSatori(unint64_t a1, uint64_t a2, char a3, void *a4, void *a5)
{
  return CTEvaluateCertsForPolicy(a1, a2, a3, 1, a4, a5, 0, 0, 0, 0, X509PolicySatori);
}

uint64_t CTEvaluateAcrt(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 0, a3, a4, 0, 0, 0, 0, X509PolicyACRT);
}

uint64_t CTEvaluateUcrt(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, 0, 0, X509PolicyUcrt);
}

uint64_t CTEvaluateUcrtTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  return CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, 0, 0, X509PolicyUcrt);
}

uint64_t CTEvaluatePragueSignatureCMS(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v9 = 0xAAAAAAAA0000AA01;
  long long v8 = xmmword_21DCEDDB0;
  BYTE1(v9) = a5;
  long long v10 = 0u;
  long long v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTEvaluateKDLSignatureCMS(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v9 = 0xAAAAAAAA0000AA01;
  long long v8 = xmmword_21DCEDDC0;
  BYTE1(v9) = a5;
  long long v10 = 0u;
  long long v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTVerifyAppleMarkerExtension(void *a1, uint64_t a2)
{
  uint64_t result = 327700;
  unint64_t v4 = a1[31];
  unint64_t v5 = a1[32];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 327707;
  }
  uint64_t v7 = a1[30];
  if ((v7 & 0x100000000) == 0)
  {
    if ((v7 & 0x200000000) == 0) {
      return result;
    }
    if (!__CFADD__(v4, v5))
    {
      unint64_t v11 = v4 + v5;
      if (v4 + v5 != -1)
      {
        if (v5 > 0x13) {
          return 327704;
        }
        uint64_t v16 = (unsigned __int8 *)(v11 - 1);
        if (v11 - 1 >= v4)
        {
          uint64_t v10 = 0;
          uint64_t v17 = 0;
          while ((unint64_t)v16 < v11)
          {
            int v18 = *v16;
            if ((v18 - 58) < 0xFFFFFFF6) {
              return 327705;
            }
            if (v17 == 20) {
              break;
            }
            if ((v17 & 0x1FFFFFFFFFFFFFFFLL) == 0x14) {
              goto LABEL_39;
            }
            unint64_t v19 = (v18 - 48);
            unint64_t v20 = powersOfTen[v17];
            if (!is_mul_ok(v19, v20)) {
              goto LABEL_40;
            }
            unint64_t v21 = v19 * v20;
            BOOL v15 = __CFADD__(v10, v21);
            v10 += v21;
            if (v15) {
              goto LABEL_38;
            }
            ++v17;
            if ((unint64_t)--v16 < v4) {
              goto LABEL_23;
            }
          }
LABEL_37:
          __break(0x5519u);
LABEL_38:
          __break(0x5500u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(0x550Cu);
          goto LABEL_41;
        }
        goto LABEL_13;
      }
    }
LABEL_41:
    __break(0x5513u);
    return result;
  }
  if (__CFADD__(v4, v5)) {
    goto LABEL_41;
  }
  unint64_t v8 = v4 + v5;
  if (v4 + v5 == -1) {
    goto LABEL_41;
  }
  unint64_t v9 = (unsigned char *)(v8 - 1);
  if (v8 - 1 >= v4)
  {
    char v12 = 0;
    unint64_t v13 = 0;
    uint64_t v10 = 0;
    while ((unint64_t)v9 < v8)
    {
      unint64_t v14 = (unint64_t)(*v9 & 0x7F) << v12;
      BOOL v15 = __CFADD__(v10, v14);
      v10 += v14;
      if (v15) {
        goto LABEL_38;
      }
      if (v13 <= 7)
      {
        ++v13;
        --v9;
        v12 += 7;
        if ((unint64_t)v9 >= v4) {
          continue;
        }
      }
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_13:
  uint64_t v10 = 0;
LABEL_23:
  if (v10 == a2) {
    return 0;
  }
  else {
    return 589829;
  }
}

uint64_t CTVerifyHostname(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = 327702;
  if (*(void *)(a1 + 232) && *(void *)(a1 + 224))
  {
    v7[1] = a3;
    unint64_t v8 = 0xAAAAAAAAAAAAAA00;
    v7[0] = a2;
    unsigned int v4 = X509CertificateParseGeneralNamesContent(a1, (uint64_t (*)(void, int *, uint64_t))CTCompareGeneralNameToHostname, (uint64_t)v7);
    if ((_BYTE)v8) {
      unsigned int v5 = 0;
    }
    else {
      unsigned int v5 = 327706;
    }
    if (v4) {
      return v4;
    }
    else {
      return v5;
    }
  }
  return v3;
}

uint64_t CTCompareGeneralNameToHostname(uint64_t result, void *a2, unint64_t a3)
{
  if (result != 2) {
    return 1;
  }
  unsigned int v4 = *(char **)a3;
  size_t v5 = *(void *)(a3 + 8);
  size_t v6 = ~*(void *)a3;
  if (v5 > v6) {
    goto LABEL_50;
  }
  uint64_t v7 = &v4[v5];
  if (&v4[v5] == (char *)-1) {
    goto LABEL_50;
  }
  unint64_t v8 = v7 - 1;
  if (v7) {
    BOOL v9 = v8 >= v4;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9 || a3 + 24 < a3) {
    goto LABEL_49;
  }
  int v11 = *v8;
  uint64_t result = compare_octet_string((uint64_t)a2, a3);
  if (!result) {
    goto LABEL_48;
  }
  if (v11 != 46) {
    goto LABEL_15;
  }
  size_t v12 = v5 - 1;
  if (v5)
  {
    if (v12 <= v5)
    {
      uint64_t result = compare_octet_string_raw((uint64_t)a2, v4, v12);
      if (result)
      {
LABEL_15:
        unint64_t v13 = a2[1];
        if (v13 < 3) {
          return 1;
        }
        unint64_t v14 = (unsigned char *)*a2;
        if (*(unsigned char *)*a2 != 42) {
          return 1;
        }
        if (v14 != (unsigned char *)-1)
        {
          BOOL v15 = v14 + 1;
          if (v14[1] == 46)
          {
            uint64_t v16 = -2;
            if ((unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL) {
              uint64_t v16 = (uint64_t)v14;
            }
            uint64_t v17 = -v16;
            uint64_t v18 = 2;
            uint64_t result = 1;
            while (v17 != v18)
            {
              if (&v14[v18] < v14) {
                goto LABEL_49;
              }
              if (v14[v18] == 46)
              {
                if (v13 == v18) {
                  return 1;
                }
                size_t v19 = 0;
                if (v5)
                {
                  while (1)
                  {
                    unint64_t v20 = &v4[v19];
                    if (&v4[v19] >= v7 || v20 < v4) {
                      goto LABEL_49;
                    }
                    if (*v20 == 46) {
                      break;
                    }
                    if (v5 == ++v19)
                    {
                      size_t v19 = v5;
                      break;
                    }
                  }
                }
                size_t v22 = v13 - 1;
                BOOL v9 = v5 >= v19;
                size_t v23 = v5 - v19;
                if (!v9) {
                  goto LABEL_51;
                }
                if (v22 == v23)
                {
                  if (v19 > v6) {
                    goto LABEL_50;
                  }
                  uint64_t result = memcmp(v15, &v4[v19], v13 - 1);
                  if (!result) {
                    goto LABEL_48;
                  }
                }
                if (v11 != 46) {
                  return 1;
                }
                if (!v23) {
                  goto LABEL_51;
                }
                if (v22 != v23 - 1) {
                  return 1;
                }
                if (v19 <= v6)
                {
                  if (!memcmp(v15, &v4[v19], v22)) {
                    goto LABEL_48;
                  }
                  return 1;
                }
                goto LABEL_50;
              }
              if (v13 == ++v18) {
                return result;
              }
            }
            goto LABEL_50;
          }
          return 1;
        }
LABEL_50:
        __break(0x5513u);
        goto LABEL_51;
      }
LABEL_48:
      uint64_t result = 0;
      *(unsigned char *)(a3 + 16) = 1;
      return result;
    }
LABEL_49:
    __break(0x5519u);
    goto LABEL_50;
  }
LABEL_51:
  __break(0x5515u);
  return result;
}

uint64_t CTEvaluateAppleSSLWithOptionalTemporalCheck(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v20 = 0xAAAAAAAA00AAAA01;
  unint64_t v21 = &null_octet;
  long long v19 = xmmword_21DCEDDD0;
  BYTE1(v20) = a6;
  BYTE2(v20) = a7;
  size_t v22 = &null_octet;
  size_t v23 = &null_octet;
  long long v24 = &CTOctetServerAuthEKU;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t result = CTEvaluateCertsForPolicy(a1, a2, a6, 1, &v17, &v18, 0, 0, 0, 0, &v19);
  if (!result)
  {
    *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16[17] = v13;
    v16[18] = v13;
    v16[15] = v13;
    v16[16] = v13;
    v16[13] = v13;
    v16[14] = v13;
    v16[11] = v13;
    v16[12] = v13;
    v16[9] = v13;
    v16[10] = v13;
    v16[7] = v13;
    void v16[8] = v13;
    v16[6] = v13;
    uint8_t v16[4] = v13;
    v16[5] = v13;
    v16[2] = v13;
    void v16[3] = v13;
    v16[0] = v13;
    v16[1] = v13;
    memset(v15, 170, sizeof(v15));
    if (__CFADD__(a1, a2))
    {
      __break(0x5513u);
    }
    else
    {
      v14[0] = a1;
      v14[1] = a1 + a2;
      uint64_t result = (uint64_t)X509ChainParseCertificateSet(v14, (unint64_t)v16, 1, &v15[1], v15);
      if (!result)
      {
        uint64_t result = CTVerifyAppleMarkerExtension(v16, a5);
        if (!result) {
          return CTVerifyHostname((uint64_t)v16, a3, a4);
        }
      }
    }
  }
  return result;
}

uint64_t CTEvaluateAppleSSL(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return CTEvaluateAppleSSLWithOptionalTemporalCheck(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t CTGetSEKType(unint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_10:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_10;
  }
  v3[0] = a1;
  v3[1] = a1 + a2;
  if (X509CertificateParse((unint64_t *)v4, v3)) {
    return 0;
  }
  if (compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&SEKTestRootSKID)) {
    return compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&SEKProdRootSKID) == 0;
  }
  return 2;
}

uint64_t CTEvaluateSEK(char a1, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t result = 327712;
  if ((a1 & 3) != 0)
  {
    if ((a1 & 1) == 0
      || (uint64_t result = CTEvaluateCertsForPolicy(a2, a3, 0, 1, a4, a5, 0, 0, 0, 0, X509PolicySEK), result))
    {
      if ((a1 & 2) != 0) {
        return CTEvaluateCertsForPolicy(a2, a3, 0, 1, a4, a5, (uint64_t)&_sek_test_root_public_key, 97, 0, 0, X509PolicySEK);
      }
    }
  }
  return result;
}

uint64_t CTCopyUID(uint64_t result, unsigned char *a2, uint64_t a3)
{
  unint64_t v5 = *(void *)result;
  uint64_t v4 = *(void *)(result + 8);
  if (__CFADD__(*(void *)result, v4)) {
    goto LABEL_31;
  }
  unint64_t v6 = v5 + v4;
  uint64_t v7 = *(unsigned __int8 **)result;
  if (v5 < v6)
  {
    while ((unint64_t)v7 >= v5)
    {
      int v3 = *v7;
      if (v3 != 45 && (unint64_t)++v7 < v6) {
        continue;
      }
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_6:
  if (v7 == (unsigned __int8 *)-1) {
    goto LABEL_31;
  }
  unint64_t v8 = v7 + 1;
  int v3 = 327693;
  uint64_t result = 327693;
  if ((unint64_t)(v7 + 1) >= v6) {
    return result;
  }
  if (a3 < 0 || v5 > (unint64_t)v8)
  {
LABEL_34:
    __break(0x5519u);
    return result;
  }
  if (__CFADD__(v8, v6 - (void)v8)) {
    goto LABEL_31;
  }
  if (v6 - (void)v8 != 2 * a3) {
    return (v3 + 1);
  }
  if (__CFADD__(a2, a3) || v7 == (unsigned __int8 *)-2)
  {
LABEL_31:
    __break(0x5513u);
    return (v3 + 1);
  }
  BOOL v9 = v7 + 2;
  uint64_t v10 = a2;
  while (1)
  {
    uint64_t result = 0;
    if ((unint64_t)v9 >= v6 || v10 >= &a2[a3]) {
      return result;
    }
    int v11 = v9 - 1;
    if ((unint64_t)(v9 - 1) >= v6 || v11 < v8) {
      goto LABEL_34;
    }
    size_t v12 = &asciiNibbleToByte[*v11];
    uint64_t result = (uint64_t)&CTOidAppleImg4Manifest;
    if (v12 >= (unsigned __int8 *)&CTOidAppleImg4Manifest || v12 < asciiNibbleToByte) {
      goto LABEL_34;
    }
    if (v11 < v7) {
      goto LABEL_34;
    }
    unint64_t v14 = &asciiNibbleToByte[*v9];
    uint64_t result = (uint64_t)&CTOidAppleImg4Manifest;
    if (v14 >= (unsigned __int8 *)&CTOidAppleImg4Manifest || v14 < asciiNibbleToByte) {
      goto LABEL_34;
    }
    unsigned int v15 = *v12;
    uint64_t result = 327695;
    if (v15 > 0xF) {
      return result;
    }
    unsigned int v16 = *v14;
    if (v16 > 0xF) {
      return result;
    }
    if (v10 < a2) {
      goto LABEL_34;
    }
    *v10++ = v16 | (16 * v15);
    v9 += 2;
    if (!v9) {
      goto LABEL_31;
    }
  }
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  unint64_t v68 = 0;
  uint64_t v69 = 0;
  unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v67 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (*a2 > v5) {
    goto LABEL_186;
  }
  uint64_t v10 = 720915;
  unint64_t v66 = *a2;
  unint64_t v67 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return v10;
  }
  uint64_t v12 = v69;
  unint64_t v13 = v66;
  unint64_t v14 = v69 + v66 - v4;
  if (__CFADD__(v69, v66 - v4)) {
    goto LABEL_188;
  }
  if (v14 > v5 - v4) {
    goto LABEL_186;
  }
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v14;
  unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12)) {
    goto LABEL_187;
  }
  unint64_t v15 = v13 + v12;
  if (v13 > v15 || v15 > v67) {
    goto LABEL_186;
  }
  unint64_t v64 = v13;
  unint64_t v65 = v15;
  unint64_t v62 = v13;
  unint64_t v63 = v15;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v62, v68)) {
      goto LABEL_187;
    }
    uint64_t v16 = 720916;
    if (ccder_blob_decode_uint64() && v62 == v62 + v68)
    {
      if (v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v64 = v62 + v68;
      unint64_t v65 = v63;
      goto LABEL_14;
    }
    return v16;
  }
LABEL_14:
  if (!ccder_blob_decode_tl()) {
    return 720917;
  }
  unint64_t v18 = v64;
  unint64_t v17 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v19 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 136) = v64;
  *(void *)(a1 + 144) = v19;
  if (__CFADD__(v18, v19)) {
    goto LABEL_187;
  }
  unint64_t v20 = v18 + v19;
  if (v18 > v20 || v20 > v17) {
    goto LABEL_186;
  }
  unint64_t v64 = v20;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v64, (unint64_t *)(a1 + 152))) {
    return 720918;
  }
  if (!ccder_blob_decode_tl()) {
    return 720919;
  }
  unint64_t v22 = v64;
  unint64_t v21 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v23 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 120) = v64;
  *(void *)(a1 + 128) = v23;
  if (__CFADD__(v22, v23)) {
    goto LABEL_187;
  }
  unint64_t v24 = v22 + v23;
  if (v22 > v24 || v24 > v21) {
    goto LABEL_186;
  }
  unint64_t v64 = v24;
  if (!ccder_blob_decode_tl()) {
    return 720920;
  }
  unint64_t v26 = v64;
  unint64_t v25 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v27 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 72) = v64;
  *(void *)(a1 + 80) = v27;
  if (__CFADD__(v26, v27)) {
    goto LABEL_187;
  }
  unint64_t v28 = v26 + v27;
  if (v26 > v28 || v28 > v25) {
    goto LABEL_186;
  }
  unint64_t v64 = v28;
  if (!ccder_blob_decode_tl()) {
    return 720921;
  }
  unint64_t v29 = v64;
  unint64_t v30 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v31 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 104) = v64;
  *(void *)(a1 + 112) = v31;
  if (__CFADD__(v29, v31)) {
    goto LABEL_187;
  }
  unint64_t v32 = v29 + v31;
  if (v29 > v29 + v31 || v32 > v30) {
    goto LABEL_186;
  }
  unint64_t v64 = v29 + v31;
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return 720922;
  }
  unint64_t v33 = v64;
  unint64_t v34 = v68;
  unint64_t v35 = v64 - v32 + v68;
  if (!__CFADD__(v64 - v32, v68))
  {
    if (v35 > v30 - v32) {
      goto LABEL_186;
    }
    *(void *)(a1 + 88) = v32;
    *(void *)(a1 + 96) = v35;
    if (__CFADD__(v33, v34)) {
      goto LABEL_187;
    }
    unint64_t v36 = v33 + v34;
    if (v33 > v36 || v36 > v65) {
      goto LABEL_186;
    }
    unint64_t v63 = v65;
    unint64_t v64 = v36;
    unint64_t v62 = v36;
    if (ccder_blob_decode_tl()) {
      return 720923;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl()) {
      return 720924;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl())
    {
      unint64_t v60 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v62, v68)) {
        goto LABEL_187;
      }
      if (v62 > v62 + v68 || v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v60 = v62;
      unint64_t v61 = v62 + v68;
      if (!ccder_blob_decode_tl() || !v68) {
        return 720925;
      }
      unint64_t v37 = v60;
      if (__CFADD__(v60, v68)) {
LABEL_187:
      }
        __break(0x5513u);
      unint64_t v38 = v60 + v68;
      if (v60 > v60 + v68 || v38 > v61) {
        goto LABEL_186;
      }
      unint64_t v61 = v60 + v68;
      *(unsigned char *)(a1 + 266) = 0;
      memset(&v70[2], 0, 128);
      if (a3) {
        BOOL v39 = a4 == 0;
      }
      else {
        BOOL v39 = 1;
      }
      int v40 = !v39;
      memset(v70, 0, 32);
      if (v37 < v38)
      {
        unsigned __int8 v53 = 0;
        int v41 = 0;
        do
        {
          unint64_t v58 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v59 = 0xAAAAAAAAAAAAAAAALL;
          char v57 = 0;
          uint64_t v56 = 0;
          if ((ccder_blob_decode_tl() & 1) == 0) {
            return 720926;
          }
          unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          if (v60 > v60 + v56 || v60 + v56 > v61) {
            goto LABEL_186;
          }
          unint64_t v54 = v60;
          unint64_t v55 = v60 + v56;
          if (!ccder_blob_decode_tl()) {
            return 720927;
          }
          if (v55 < v54 || v68 > v55 - v54) {
            goto LABEL_186;
          }
          unint64_t v58 = v54;
          unint64_t v59 = v68;
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (!der_get_BOOLean(&v54, 1, &v57)) {
            return 720928;
          }
          if (!ccder_blob_decode_tl()) {
            return 720929;
          }
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v55 != v54 + v68) {
            return 720929;
          }
          if (v40 && !compare_octet_string_raw((uint64_t)&v58, a3, a4))
          {
            if (v55 < v54) {
              goto LABEL_186;
            }
            unint64_t v43 = v68;
            if (v68 > v55 - v54) {
              goto LABEL_186;
            }
            *(void *)(a1 + 248) = v54;
            *(void *)(a1 + 256) = v43;
          }
          if (v59 == 3)
          {
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 15)
            {
              uint64_t v16 = 720930;
              if ((v41 & 1) != 0 || (X509ExtensionParseKeyUsage() & 1) == 0) {
                return v16;
              }
              v41 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 19)
            {
              uint64_t v16 = 720931;
              if ((v41 & 2) != 0
                || (X509ExtensionParseBasicConstraints(&v54, (void *)(a1 + 200), (unsigned char *)(a1 + 265)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 35)
            {
              uint64_t v16 = 720932;
              if ((v41 & 4) != 0
                || (X509ExtensionParseAuthorityKeyIdentifier(&v54, (unint64_t *)(a1 + 168), (void *)(a1 + 176)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 14)
            {
              uint64_t v16 = 720933;
              if ((v41 & 8) != 0
                || (X509ExtensionParseSubjectKeyIdentifier(&v54, (unint64_t *)(a1 + 184), (void *)(a1 + 192)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 37)
            {
              uint64_t v16 = 720934;
              if ((v41 & 0x10) != 0
                || (X509ExtensionParseExtendedKeyUsage(&v54, (unint64_t *)(a1 + 208), (void *)(a1 + 216)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 17)
            {
              uint64_t v16 = 720935;
              if ((v41 & 0x20) != 0
                || (X509ExtensionParseSubjectAltName(&v54, (unint64_t *)(a1 + 224), (void *)(a1 + 232)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v59 >= 8 && *(_DWORD *)v58 == -2042067414 && *(_DWORD *)(v58 + 3) == 1684273030)
          {
            uint64_t v16 = 720936;
            if (!X509CertificateVerifyOnlyOneAppleExtension((uint64_t)&v58, (uint64_t)v70, v53)) {
              return v16;
            }
            uint64_t result = X509ExtensionParseAppleExtension((uint64_t)&v54, v58, v59, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v40);
            if (!result) {
              return v16;
            }
            if (v53 == 0xFF) {
              goto LABEL_189;
            }
            ++v53;
            goto LABEL_155;
          }
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (v57) {
            *(unsigned char *)(a1 + 266) = 1;
          }
LABEL_155:
          if (v54 != v55) {
            return 720926;
          }
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          unint64_t v37 = v60 + v56;
          if (v60 > v60 + v56) {
            goto LABEL_186;
          }
          unint64_t v38 = v61;
          if (v37 > v61) {
            goto LABEL_186;
          }
          v60 += v56;
        }
        while (v37 < v61);
      }
      if (v37 != v38) {
        return 720925;
      }
      if (v37 > v65 || v64 > v37) {
        goto LABEL_186;
      }
      unint64_t v64 = v37;
    }
    if (*(void *)(a1 + 32) < 3uLL)
    {
      uint64_t v16 = 720915;
      if (v64 != v65) {
        return v16;
      }
LABEL_170:
      if (__CFADD__(v66, v69)) {
        goto LABEL_187;
      }
      if (v66 > v66 + v69 || v66 + v69 > v67) {
        goto LABEL_186;
      }
      v66 += v69;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v66, (unint64_t *)(a1 + 40))) {
        return 720937;
      }
      *(void *)&v70[0] = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v70[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v60 = 0;
      uint64_t result = ccder_blob_decode_bitstring();
      if (!result) {
        return 720938;
      }
      if (v60 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((void *)&v70[0] + 1) >= *(void *)&v70[0])
        {
          unint64_t v51 = (v60 + 7) >> 3;
          if (v51 <= *((void *)&v70[0] + 1) - *(void *)&v70[0])
          {
            *(void *)(a1 + 56) = *(void *)&v70[0];
            *(void *)(a1 + 64) = v51;
            unint64_t v52 = v67;
            if (v66 <= v67)
            {
              uint64_t v16 = 0;
              *a2 = v66;
              a2[1] = v52;
              return v16;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v65 <= a2[1] && *a2 <= v65)
    {
      *a2 = v65;
      goto LABEL_170;
    }
LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }
LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t der_get_BOOLean(void *a1, int a2, unsigned char *a3)
{
  if (*a1 > a1[1]) {
    __break(0x5519u);
  }
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2) {
    return 0;
  }
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

uint64_t X509ExtensionParseKeyUsage()
{
  uint64_t result = ccder_blob_decode_bitstring();
  if (result) {
    return 0;
  }
  return result;
}

uint64_t X509ExtensionParseBasicConstraints(void *a1, void *a2, unsigned char *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    uint64_t result = der_get_BOOLean(a1, 1, a3);
    if (result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3) {
          return 0;
        }
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }
      return 1;
    }
  }
  return result;
}

uint64_t X509ExtensionParseAuthorityKeyIdentifier(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_15;
    }
    if (v7 - 0x5555555555555556 != a1[1]) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_16;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
        goto LABEL_16;
      }
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      unint64_t v9 = v8 - 0x5555555555555556;
      if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseSubjectKeyIdentifier(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509ExtensionParseExtendedKeyUsage(unint64_t *a1, unint64_t *a2, void *a3)
{
  int v6 = ccder_blob_decode_tl();
  uint64_t result = 0;
  if (v6)
  {
    if (*a1 > a1[1]) {
      goto LABEL_11;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = a1[1];
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_11;
    }
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v9 = v8 - 0x5555555555555556;
    if (v8 > v8 - 0x5555555555555556 || v9 > a1[1]) {
LABEL_11:
    }
      __break(0x5519u);
    *a1 = v9;
  }
  return result;
}

uint64_t X509ExtensionParseSubjectAltName(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result == 1)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509CertificateVerifyOnlyOneAppleExtension(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 > 9) {
    return 0;
  }
  unint64_t v5 = (void *)result;
  unsigned __int8 v6 = 0;
  unint64_t v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    uint64_t result = compare_octet_string((uint64_t)v5, a2 + 16 * v6);
    if (!result) {
      return result;
    }
    if (a3 <= v6++)
    {
      uint64_t v9 = v5[1];
      unint64_t v10 = (void *)(a2 + 16 * a3);
      *unint64_t v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t X509ExtensionParseAppleExtension(uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (a6) {
    a5 = 0;
  }
  if (a3 == 11)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10301066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x200;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10601066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x800;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11801066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x12401066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x21901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x8000;
      goto LABEL_275;
    }
LABEL_159:
    int v44 = 0;
LABEL_160:
    if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 27)
    {
      return X509ExtensionParseServerAuthMarker(result, a2, a3, a4, a5);
    }
    if (v44)
    {
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v24 = *a4 | 0x400000;
        goto LABEL_275;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 37748736;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4354)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 0x8004000000;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
      {
        return (uint64_t)X509ExtensionParseMFI4Properties((unint64_t *)result, a4, a5);
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
      {
        unint64_t v52 = *(void *)result;
        unint64_t v51 = *(void *)(result + 8);
        if (a5)
        {
          if (v52 > v51) {
            goto LABEL_281;
          }
          *a5 = v52;
          a5[1] = v51 - v52;
        }
        *a4 |= 0x80000000uLL;
LABEL_243:
        if (v52 <= v51)
        {
          *(void *)uint64_t result = v51;
          return 1;
        }
LABEL_281:
        __break(0x5519u);
        return result;
      }
    }
LABEL_242:
    unint64_t v52 = *(void *)result;
    unint64_t v51 = *(void *)(result + 8);
    goto LABEL_243;
  }
  if (a3 == 10)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v54 = *a4;
      uint64_t v55 = 0x58600003F0D0;
LABEL_205:
      uint64_t v24 = v54 | v55;
LABEL_275:
      *a4 = v24;
      return 1;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538) {
      goto LABEL_209;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0xF00;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_209:
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x40;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x1000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
    {
      return X509ExtensionParseMFISWAuth((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x300000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
    {
      return X509ExtensionParseGenericSSLMarker();
    }
    int v44 = 1;
    goto LABEL_160;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA) {
      goto LABEL_242;
    }
    goto LABEL_159;
  }
  if (*(void *)a2 == 0xB6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    return X509ExtensionParseComponentAuth((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 49)
  {
    char v56 = 0;
    uint64_t result = der_get_BOOLean((void *)result, 0, &v56);
    if (result)
    {
      uint64_t v53 = 0x10000080002;
      if (!v56) {
        uint64_t v53 = 0x20000040001;
      }
      *a4 |= v53;
    }
    return result;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 44)
  {
    return X509ExtensionParseCertifiedChipIntermediate((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 36)
  {
    return X509ExtensionParseMFIAuthv3Leaf((unint64_t *)result);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 22)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v54 = *a4;
    uint64_t v55 = 1048584;
    goto LABEL_205;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 19)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x8000000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xA6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    *a4 |= 0x1000000uLL;
    goto LABEL_242;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 29)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x2000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 14)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x4000000;
    goto LABEL_275;
  }
  if (*(void *)a2 != 0x86463F78648862ALL || *(unsigned char *)(a2 + 8) != 3) {
    goto LABEL_242;
  }
  return X509ExtensionParseDeviceAttestationIdentity((unint64_t *)result, a4, a5);
}

uint64_t X509CertificateParseWithExtension(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8 = 720939;
  unint64_t v9 = *a2;
  unint64_t v10 = a2[1];
  if (!ccder_blob_decode_tl()) {
    return v8;
  }
  unint64_t v11 = *a2;
  uint64_t result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  uint64_t v8 = result;
  if (result) {
    return v8;
  }
  if (v11 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  uint64_t v8 = 720939;
  if (*a2 != v11 - 0x5555555555555556) {
    return v8;
  }
  unint64_t v13 = v11 - v9 - 0x5555555555555556;
  if (v11 - v9 >= 0x5555555555555556) {
    goto LABEL_11;
  }
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0;
  }
LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0, 0);
}

uint64_t X509CertificateParseSPKI(unint64_t *a1, unint64_t *a2, unint64_t *a3, void *a4)
{
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  if (__CFADD__(*a1, v5)) {
    goto LABEL_31;
  }
  unint64_t v6 = v4 + v5;
  if (v4 > v6) {
    goto LABEL_30;
  }
  uint64_t v10 = 655361;
  unint64_t v14 = *a1;
  unint64_t v15 = v6;
  if (!ccder_blob_decode_tl()) {
    return v10;
  }
  if (!ccder_blob_decode_tl()) {
    return 655363;
  }
  if (v14 >= 0x5555555555555556) {
LABEL_31:
  }
    __break(0x5513u);
  if (v14 > v14 - 0x5555555555555556 || v14 - 0x5555555555555556 > v15) {
    goto LABEL_30;
  }
  unint64_t v13 = v14 - 0x5555555555555556;
  if (!ccder_blob_decode_tl()) {
    return 655362;
  }
  if (a2)
  {
    if (v13 >= v14)
    {
      *a2 = v14;
      a2[1] = 0xAAAAAAAAAAAAAAAALL;
      goto LABEL_12;
    }
LABEL_30:
    __break(0x5519u);
    goto LABEL_31;
  }
LABEL_12:
  unint64_t v11 = v14 - 0x5555555555555556;
  if (v14 > v14 - 0x5555555555555556 || v11 > v13) {
    goto LABEL_30;
  }
  if (v11 == v13)
  {
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
  }
  else if (a3)
  {
    *a3 = v11;
    a3[1] = v13 - v11;
  }
  if (v13 > v15 || v14 > v13) {
    goto LABEL_30;
  }
  if (!ccder_blob_decode_bitstring()) {
    return 655364;
  }
  *a4 = 0;
  a4[1] = 0;
  if (v13 == v15) {
    return 0;
  }
  else {
    return 655365;
  }
}

uint64_t X509CertificateParseKey(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t result = 327691;
  if (a1)
  {
    if (*(void *)(a1 + 96))
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t result = X509CertificateParseSPKI((unint64_t *)(a1 + 88), 0, 0, &v8);
      if (!result)
      {
        if (a2)
        {
          if (a3)
          {
            uint64_t v7 = v9;
            *a2 = v8;
            *a3 = v7;
          }
        }
      }
    }
  }
  return result;
}

uint64_t X509CertificateCheckSignatureDigest(char a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v16 = 0uLL;
  long long v15 = 0uLL;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v7 = X509CertificateParseSPKI((unint64_t *)(a2 + 88), (unint64_t *)&v16, (unint64_t *)&v15, &v13);
  if (v7) {
    return v7;
  }
  uint64_t v7 = 655632;
  int v9 = compare_octet_string((uint64_t)&v16, (uint64_t)&rsaEncryption);
  uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureRSA;
  if (v9)
  {
    int v11 = compare_octet_string((uint64_t)&v16, (uint64_t)&ecPublicKey);
    uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureEC;
    if (v11) {
      return 655617;
    }
  }
  unint64_t v12 = v10;
  if (((a1 & 1) == 0 || compare_octet_string_raw(a4, &CTOidSha1, 5uLL))
    && ((a1 & 4) == 0 || compare_octet_string_raw(a4, &CTOidSha256, 9uLL))
    && ((a1 & 8) == 0 || compare_octet_string_raw(a4, &CTOidSha384, 9uLL))
    && ((a1 & 0x10) == 0 || compare_octet_string_raw(a4, &CTOidSha512, 9uLL)))
  {
    return v7;
  }
  uint64_t result = v13;
  if ((v14 || !v13) && (a3[1] || !*a3))
  {
    if (v12(v13)) {
      return 0;
    }
    else {
      return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignature(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v10[2] = v6;
  void v10[3] = v6;
  v10[0] = v6;
  v10[1] = v6;
  v9[0] = v10;
  v9[1] = 64;
  v8[0] = 0;
  v8[1] = 0;
  uint64_t result = X509MatchSignatureAlgorithm(a3, a4, (uint64_t)v9, v8);
  if (!result) {
    return X509CertificateCheckSignatureDigest(a1, a2, v9, (uint64_t)v8);
  }
  return result;
}

uint64_t X509MatchSignatureAlgorithm(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = compare_octet_string_raw(a2, &sha1WithRSA_oid, 9uLL);
  if (!result) {
    goto LABEL_8;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha256WithRSA_oid, 9uLL);
  if (!result)
  {
LABEL_10:
    *a4 = &CTOidSha256;
    a4[1] = 9;
    if (*(void *)(a3 + 8) < 0x20uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + 8) = 32;
    ccsha256_di();
    goto LABEL_14;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha384WithRSA_oid, 9uLL);
  if (!result) {
    goto LABEL_12;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha1WithECDSA_oid, 7uLL);
  if (!result)
  {
LABEL_8:
    *a4 = &CTOidSha1;
    a4[1] = 5;
    if (*(void *)(a3 + 8) < 0x14uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + 8) = 20;
    ccsha1_di();
LABEL_14:
    ccdigest();
    return 0;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha256WithECDSA_oid, 8uLL);
  if (!result) {
    goto LABEL_10;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha384WithECDSA_oid, 8uLL);
  if (result) {
    return 656640;
  }
LABEL_12:
  *a4 = &CTOidSha384;
  a4[1] = 9;
  if (*(void *)(a3 + 8) >= 0x30uLL)
  {
    *(void *)(a3 + 8) = 48;
    ccsha384_di();
    goto LABEL_14;
  }
LABEL_15:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignatureWithPublicKey(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v16[2] = v7;
  void v16[3] = v7;
  v16[0] = v7;
  v16[1] = v7;
  uint64_t v14 = v16;
  uint64_t v15 = 64;
  long long v13 = 0uLL;
  uint64_t matched = X509MatchSignatureAlgorithm(a4, a5, (uint64_t)&v14, &v13);
  if (matched) {
    return matched;
  }
  uint64_t matched = 655617;
  int v9 = compare_octet_string(a2, (uint64_t)&rsaEncryption);
  uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureRSA;
  if (v9)
  {
    int v11 = compare_octet_string(a2, (uint64_t)&ecPublicKey);
    uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureEC;
    if (v11) {
      return matched;
    }
  }
  uint64_t result = *a1;
  if ((a1[1] || !result) && (!v14 || v15))
  {
    if (v10(result)) {
      return 0;
    }
    else {
      return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParseGeneralNamesContent(uint64_t a1, uint64_t (*a2)(void, int *, uint64_t), uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v3 = *(void *)(a1 + 224);
  uint64_t v4 = *(void *)(a1 + 232);
  if (__CFADD__(v3, v4))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  unint64_t v5 = v3 + v4;
  if (v3 > v5) {
    goto LABEL_11;
  }
  unint64_t v10 = *(void *)(a1 + 224);
  unint64_t v11 = v5;
  while (1)
  {
    if (v10 >= v11) {
      return 0;
    }
    memset(v9, 170, sizeof(v9));
    if ((ccder_blob_decode_GeneralName(&v10, v9, (unint64_t *)&v9[1]) & 1) == 0) {
      break;
    }
    if ((a2(v9[0], &v9[1], a3) & 1) == 0) {
      return 0;
    }
  }
  return 720912;
}

uint64_t X509CertificateSubjectNameGetCommonName(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  unint64_t v20 = v3;
  if (__CFADD__(*a1, v3)) {
    goto LABEL_59;
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4)
  {
LABEL_58:
    __break(0x5519u);
    goto LABEL_59;
  }
  uint64_t v6 = 720901;
  unint64_t v18 = *a1;
  unint64_t v19 = v4;
  *a2 = 0;
  a2[1] = 0;
  if (v2 < v4)
  {
    while (1)
    {
      if (!ccder_blob_decode_tl() || !v20) {
        return 720898;
      }
      unint64_t v2 = v18;
      if (__CFADD__(v18, v20)) {
        break;
      }
      unint64_t v7 = v18 + v20;
      if (v18 > v18 + v20 || v7 > v19) {
        goto LABEL_58;
      }
      unint64_t v16 = v18;
      unint64_t v17 = v18 + v20;
      while (v2 < v7)
      {
        if (!ccder_blob_decode_tl()) {
          return 720899;
        }
        if (__CFADD__(v16, v20)) {
          goto LABEL_59;
        }
        if (v16 > v16 + v20 || v16 + v20 > v17) {
          goto LABEL_58;
        }
        unint64_t v15 = v16 + v20;
        if (!ccder_blob_decode_tl()) {
          return 720900;
        }
        unint64_t v2 = v16 + v20;
        if (v16 > v15) {
          goto LABEL_58;
        }
        if (__CFADD__(v16, v20)) {
          goto LABEL_59;
        }
        if (v16 > v16 + v20) {
          goto LABEL_58;
        }
        unint64_t v14 = v16 + v20;
        if (v20 == 3 && *(_WORD *)v16 == 1109 && *(unsigned char *)(v16 + 2) == 3)
        {
          unint64_t v12 = v16 + v20;
          unint64_t v13 = v16 + v20;
          if ((ccder_blob_decode_tl() & 1) == 0)
          {
            if (v14 > v15) {
              goto LABEL_58;
            }
            unint64_t v12 = v16 + v20;
            unint64_t v13 = v16 + v20;
            if ((ccder_blob_decode_tl() & 1) == 0)
            {
              if (v14 > v15) {
                goto LABEL_58;
              }
              unint64_t v12 = v16 + v20;
              unint64_t v13 = v16 + v20;
              if (!ccder_blob_decode_tl()) {
                return v6;
              }
            }
          }
          if (__CFADD__(v12, v20)) {
            goto LABEL_59;
          }
          unint64_t v2 = v12 + v20;
          if (v15 != v12 + v20) {
            return 720902;
          }
          if (v13 < v12 || v20 > v13 - v12) {
            goto LABEL_58;
          }
          *a2 = v12;
          a2[1] = v20;
        }
        unint64_t v7 = v18 + v20;
        if (v2 > v17 || v16 > v2) {
          goto LABEL_58;
        }
        unint64_t v16 = v2;
      }
      if (v2 != v7) {
        return 720903;
      }
      unint64_t v4 = v19;
      if (v2 > v19 || v18 > v2) {
        goto LABEL_58;
      }
      unint64_t v18 = v2;
      if (v2 >= v19) {
        goto LABEL_46;
      }
    }
LABEL_59:
    __break(0x5513u);
  }
LABEL_46:
  if (v2 != v4) {
    return 720904;
  }
  if (a2[1] && *a2) {
    return 0;
  }
  *a2 = 0;
  a2[1] = 0;
  return 720905;
}

BOOL X509CertificateValidAtTime(uint64_t a1, time_t a2)
{
  BOOL result = 0;
  v6[1] = *MEMORY[0x263EF8340];
  time_t v5 = 0;
  v6[0] = 0;
  if (a1 && a2 != -1) {
    return !X509CertificateGetNotBefore(a1, v6)
  }
        && !X509CertificateGetNotAfter(a1, &v5)
        && difftime(a2, v6[0]) >= 0.0
        && difftime(a2, v5) <= 0.0;
  return result;
}

uint64_t X509CertificateGetNotBefore(uint64_t a1, time_t *a2)
{
  _DWORD v4[2] = *(const char **)MEMORY[0x263EF8340];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1);
  if (!result) {
    return X509TimeConvert(v4, a2);
  }
  return result;
}

uint64_t X509CertificateGetNotAfter(uint64_t a1, time_t *a2)
{
  _DWORD v4[2] = *(const char **)MEMORY[0x263EF8340];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1);
  if (!result) {
    return X509TimeConvert(v4, a2);
  }
  return result;
}

BOOL X509CertificateIsValid(uint64_t a1)
{
  time_t v2 = time(0);
  return X509CertificateValidAtTime(a1, v2);
}

uint64_t X509CertificateParseValidity(uint64_t result)
{
  time_t v6[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = 720906;
  if (!result) {
    return v1;
  }
  unint64_t v2 = *(void *)(result + 72);
  uint64_t v3 = *(void *)(result + 80);
  if (!v2 || v3 == 0) {
    return v1;
  }
  if (__CFADD__(v2, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v5 = v2 + v3;
    if (v2 <= v5)
    {
      v6[0] = *(void *)(result + 72);
      v6[1] = v5;
      if (!ccder_blob_decode_Time(v6)) {
        return 720907;
      }
      if (ccder_blob_decode_Time(v6)) {
        return 0;
      }
      return 720908;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509TimeConvert(const char **a1, time_t *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = 720909;
  if (!a1) {
    return v2;
  }
  unint64_t v4 = a1[1];
  if (((unint64_t)v4 | 2) != 0xF) {
    return v2;
  }
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v6;
  *(_OWORD *)&v11.tm_isdst = v6;
  *(_OWORD *)&v11.tm_sec = v6;
  unint64_t v7 = *a1;
  if (v4 == (const char *)13)
  {
    uint64_t result = (uint64_t)strptime(v7, "%y%m%d%H%M%SZ", &v11);
    if (result && v11.tm_year >= 150) {
      v11.tm_year -= 100;
    }
  }
  else
  {
    uint64_t result = (uint64_t)strptime(v7, "%Y%m%d%H%M%SZ", &v11);
  }
  int v9 = a1[1];
  if (!__CFADD__(*a1, v9))
  {
    if ((const char *)result != &v9[(void)*a1]) {
      return 720910;
    }
    time_t v10 = timegm(&v11);
    if (v10 == -1) {
      return 720911;
    }
    uint64_t v2 = 0;
    if (a2) {
      *a2 = v10;
    }
    return v2;
  }
  __break(0x5513u);
  return result;
}

BOOL X509ExtensionParseComponentAuth(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v3 = a1[1];
  if (*a1 > v3) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  unint64_t v11 = v3 - *a1;
  if (ccder_blob_decode_tl()) {
    goto LABEL_5;
  }
  if (*a1 > a1[1]) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    unint64_t v8 = v12;
    unint64_t v7 = v13;
    if (v12 > v13) {
      goto LABEL_19;
    }
    *a1 = v12;
    a1[1] = v13;
    unint64_t v9 = v11;
  }
  else
  {
    unint64_t v8 = *a1;
    unint64_t v7 = a1[1];
    unint64_t v9 = v7 - *a1;
  }
  if (__CFADD__(v8, v9)) {
    goto LABEL_20;
  }
  if (v7 == v8 + v9)
  {
    if (!v9) {
      goto LABEL_16;
    }
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }
      goto LABEL_19;
    }
    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v7 == v8 + v9;
}

uint64_t X509ExtensionParseCertifiedChipIntermediate(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      goto LABEL_12;
    }
    unint64_t v8 = v7 - 0x5555555555555556;
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8) {
        goto LABEL_12;
      }
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }
    if (v7 <= v8)
    {
      *a1 = v8;
      return 1;
    }
LABEL_12:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFIAuthv3Leaf(unint64_t *a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556) {
        return 0;
      }
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFISWAuth(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556) {
        return 0;
      }
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL) {
          goto LABEL_13;
        }
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }
      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_13:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseGenericSSLMarker()
{
  return 0;
}

uint64_t X509ExtensionParseServerAuthMarker(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t result = ccder_blob_check_null();
  if (result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6) {
      goto LABEL_26;
    }
    if (__CFADD__(a2, a3)) {
      goto LABEL_26;
    }
    unint64_t v10 = a2 + a3;
    if (a2 + a3 == -1) {
      goto LABEL_26;
    }
    unint64_t v11 = a2 + 9;
    unint64_t v12 = (char *)(a2 + 9);
    while (1)
    {
      BOOL v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      BOOL v14 = v13;
      if ((unint64_t)v12 >= v10 - 1) {
        break;
      }
      if (!v14) {
        goto LABEL_25;
      }
      int v15 = *v12++;
      if ((v15 & 0x80000000) == 0) {
        return 0;
      }
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= 0x100000000uLL;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t X509ExtensionParseDeviceAttestationIdentity(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_17;
    }
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_18;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
            goto LABEL_18;
          }
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }
        *a2 |= 0x240000800000uLL;
        unint64_t v8 = *a1;
        if (*a1 < 0x5555555555555556)
        {
          unint64_t v9 = v8 - 0x5555555555555556;
          if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
          {
            *a1 = v9;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

unint64_t *X509ExtensionParseMFI4Properties(unint64_t *result, void *a2, unint64_t *a3)
{
  unint64_t v4 = *result;
  unint64_t v3 = result[1];
  unint64_t v5 = v3 - *result;
  if (v5 != 32) {
    return (unint64_t *)(v5 == 32);
  }
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }
    *a3 = v4;
    a3[1] = 32;
  }
  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0)
  {
    unint64_t v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *uint64_t result = v6;
      return (unint64_t *)(v5 == 32);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(0x5513u);
  return result;
}

unint64_t *X509ChainParseCertificateSet(unint64_t *result, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v5 = 0;
  *a4 = 0;
  a4[1] = 0;
  BOOL v6 = *result >= result[1] || a3 == 0;
  if (v6)
  {
LABEL_6:
    if (a5)
    {
      uint64_t result = 0;
      *a5 = v5;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    unint64_t v9 = result;
    uint64_t v10 = 0;
    unint64_t v11 = a2 + 304 * a3;
    unint64_t v12 = ~a2;
    BOOL v13 = a4 + 1;
    BOOL v14 = (void *)(a2 + 272);
    uint64_t v15 = a3 - 1;
    unint64_t v21 = a2 + 272;
    while ((unsigned __int128)(v10 * (__int128)304) >> 64 == (304 * v10) >> 63 && 304 * v10 <= v12)
    {
      unint64_t v16 = v14 - 34;
      if (v14 != (void *)272 && ((unint64_t)v16 >= v11 || (unint64_t)v16 < a2))
      {
LABEL_30:
        __break(0x5519u);
        break;
      }
      uint64_t result = (unint64_t *)X509CertificateParse(v14 - 34, v9);
      if (result) {
        return result;
      }
      if (v10)
      {
        if ((unint64_t)v16 < a2) {
          goto LABEL_30;
        }
        if ((unint64_t)(v14 + 4) > v11) {
          goto LABEL_30;
        }
        unint64_t v17 = (void *)*v13;
        *BOOL v14 = 0;
        v14[1] = v17;
        if (v14 != (void *)272 && (unint64_t)v16 >= v11) {
          goto LABEL_30;
        }
        *unint64_t v17 = v16;
        *BOOL v13 = (unint64_t)v14;
      }
      else
      {
        uint64_t v18 = *a4;
        *(void *)(a2 + 272) = *a4;
        if (v18) {
          unint64_t v19 = (unint64_t *)(v18 + 280);
        }
        else {
          unint64_t v19 = v13;
        }
        *unint64_t v19 = v21;
        *a4 = v16;
        *(void *)(a2 + 280) = a4;
      }
      uint64_t v5 = v10 + 1;
      if (*v9 < v9[1])
      {
        v14 += 38;
        BOOL v6 = v15 == v10++;
        if (!v6) {
          continue;
        }
      }
      goto LABEL_6;
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t X509ChainGetCertificateUsingKeyIdentifier(uint64_t *a1, uint64_t a2)
{
  for (uint64_t i = *a1; i; uint64_t i = *(void *)(i + 272))
  {
    if (*(void *)(i + 192) && !compare_octet_string(a2, i + 184)) {
      break;
    }
  }
  return i;
}

void *X509ChainResetChain(void *result, void *a2)
{
  *uint64_t result = 0;
  result[1] = result;
  uint64_t v2 = (void *)*a2;
  if (*a2)
  {
    do
    {
      v2[36] = 0;
      v2[37] = 0;
      uint64_t v2 = (void *)v2[34];
    }
    while (v2);
  }
  return result;
}

uint64_t X509ChainBuildPathPartial(void *a1, uint64_t *a2, void *a3, int a4)
{
  if (!a1) {
    return 327691;
  }
  unint64_t v7 = a1;
  *a3 = a1;
  a3[1] = a1 + 36;
  a1[36] = 0;
  a1[37] = a3;
  uint64_t v8 = (uint64_t)(a1 + 15);
  uint64_t result = compare_octet_string((uint64_t)(a1 + 15), (uint64_t)(a1 + 13));
  if (result)
  {
    while (1)
    {
      uint64_t v10 = (uint64_t)(v7 + 21);
      if (!v7[22]
        || (uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier(a2, (uint64_t)(v7 + 21))) == 0
        || (unint64_t v7 = (void *)CertificateUsingKeyIdentifier,
            compare_octet_string(CertificateUsingKeyIdentifier + 104, v8)))
      {
        unint64_t v7 = (void *)*a2;
        if (!*a2)
        {
LABEL_16:
          if (X509ChainGetAppleRootUsingKeyIdentifier(v10, 1)) {
            return 0;
          }
          uint64_t BAARootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v10);
          if (a4) {
            unsigned int v16 = 0;
          }
          else {
            unsigned int v16 = 524296;
          }
          if (BAARootUsingKeyIdentifier) {
            return 0;
          }
          else {
            return v16;
          }
        }
        while (compare_octet_string(v8, (uint64_t)(v7 + 13)))
        {
          unint64_t v7 = (void *)v7[34];
          if (!v7) {
            goto LABEL_16;
          }
        }
      }
      unint64_t v12 = (void *)*a3;
      if (*a3) {
        break;
      }
LABEL_13:
      BOOL v13 = (void *)a3[1];
      v7[36] = 0;
      v7[37] = v13;
      *BOOL v13 = v7;
      a3[1] = v7 + 36;
      uint64_t v8 = (uint64_t)(v7 + 15);
      int v14 = compare_octet_string((uint64_t)(v7 + 15), (uint64_t)(v7 + 13));
      uint64_t result = 0;
      if (!v14) {
        return result;
      }
    }
    while (v12 != v7)
    {
      unint64_t v12 = (void *)v12[36];
      if (!v12) {
        goto LABEL_13;
      }
    }
    return 524297;
  }
  return result;
}

uint64_t X509ChainGetAppleRootUsingKeyIdentifier(uint64_t result, int a2)
{
  uint64_t v2 = &numAppleRoots;
  if (!a2) {
    uint64_t v2 = &numAppleProdRoots;
  }
  uint64_t v3 = *v2;
  if (*v2)
  {
    uint64_t v4 = result;
    for (uint64_t i = (uint64_t *)&AppleRoots; i < (uint64_t *)&UcrtRootPublicKey && i >= (uint64_t *)&AppleRoots; ++i)
    {
      uint64_t v7 = *i;
      uint64_t result = compare_octet_string(v4, *i + 184);
      if (!result) {
        return v7;
      }
      if (!--v3) {
        return 0;
      }
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainGetBAARootUsingKeyIdentifier(uint64_t result)
{
  uint64_t v1 = numBAARoots;
  if (numBAARoots)
  {
    uint64_t v2 = result;
    for (uint64_t i = (uint64_t *)&BAARoots; i < (uint64_t *)&SEKTestRootPublicKey && i >= (uint64_t *)&BAARoots; ++i)
    {
      uint64_t v5 = *i;
      uint64_t result = compare_octet_string(v2, *i + 184);
      if (!result) {
        return v5;
      }
      if (!--v1) {
        return 0;
      }
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainBuildPath(void *a1, uint64_t *a2, void *a3)
{
  return X509ChainBuildPathPartial(a1, a2, a3, 0);
}

uint64_t X509ChainCheckPathWithOptions(char a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  BOOL v6 = a2;
  v35[4] = *MEMORY[0x263EF8340];
  uint64_t v8 = *a2;
  if (a3)
  {
    uint64_t v9 = *(void *)(a3 + 48);
    if (v9)
    {
      if (*(void *)(v9 + 8))
      {
        if (compare_octet_string(v9, v8 + 208)) {
          return 327701;
        }
        uint64_t v8 = *v6;
      }
    }
  }
  if (v8)
  {
    unint64_t v31 = v6;
    unint64_t v32 = a4;
    unint64_t v11 = 0;
    int v12 = 0;
    char v33 = 0;
    uint64_t v13 = -1;
    while (1)
    {
      unint64_t v14 = *(void *)(v8 + 288);
      unint64_t v15 = v14 + 304;
      if (v14)
      {
LABEL_10:
        char v16 = 0;
        goto LABEL_11;
      }
      if (!compare_octet_string(v8 + 120, v8 + 104))
      {
        char v16 = 0;
        unint64_t v15 = v8 + 304;
        unint64_t v14 = v8;
        goto LABEL_11;
      }
      if (!a3) {
        return v12 | 0x9000Du;
      }
      if (*(unsigned char *)(a3 + 16))
      {
        uint64_t AppleRootUsingKeyIdentifier = X509ChainGetAppleRootUsingKeyIdentifier(v8 + 168, *(unsigned __int8 *)(a3 + 17));
      }
      else
      {
        if (!*(void *)(a3 + 24)) {
          goto LABEL_58;
        }
        uint64_t AppleRootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v8 + 168);
      }
      unint64_t v14 = AppleRootUsingKeyIdentifier;
      v33 |= AppleRootUsingKeyIdentifier != 0;
      unint64_t v15 = AppleRootUsingKeyIdentifier + 304;
      if (AppleRootUsingKeyIdentifier) {
        goto LABEL_10;
      }
LABEL_58:
      if (!*(unsigned char *)(a3 + 19)) {
        return v12 | 0x9000Du;
      }
      unint64_t v14 = 0;
      char v16 = 1;
LABEL_11:
      if (v11 && *(void *)(v8 + 32) >= 2uLL)
      {
        if (!*(unsigned char *)(v8 + 265))
        {
          int v30 = 589825;
          return v12 | v30;
        }
        if ((*(unsigned char *)(v8 + 264) & 4) == 0)
        {
          int v30 = 589826;
          return v12 | v30;
        }
      }
      unint64_t v17 = *(void *)(v8 + 200);
      if (v17) {
        BOOL v18 = v17 >= v11;
      }
      else {
        BOOL v18 = 1;
      }
      if (!v18)
      {
        int v30 = 589827;
        return v12 | v30;
      }
      if (*(unsigned char *)(v8 + 266))
      {
        int v30 = 589831;
        return v12 | v30;
      }
      if (compare_octet_string(v8 + 40, v8 + 152))
      {
        int v30 = 589828;
        return v12 | v30;
      }
      if ((v16 & 1) == 0 && *(void *)(v8 + 168) && *(void *)(v8 + 176))
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
        if (compare_octet_string(v8 + 168, v14 + 184)) {
          return v12 | 0x9000Au;
        }
      }
      if (a3 && v11 && (*(void *)(v8 + 240) & *(void *)(a3 + 8)) == 0) {
        X509PolicySetFlagsForCommonNames(v8);
      }
      if (v14 == v8 && !*(void *)(v8 + 240))
      {
        X509PolicySetFlagsForRoots(a3, v8);
        if (a3)
        {
LABEL_34:
          if (*(unsigned char *)(a3 + 18) && !X509CertificateIsValid(v8)) {
            return v12 | 0x90009u;
          }
          uint64_t v19 = *(void *)(a3 + 8);
          if (!v11 && (*(void *)(v8 + 240) & v19) == 0)
          {
            X509PolicySetFlagsForMFI(v8);
            uint64_t v19 = *(void *)(a3 + 8);
          }
          v13 &= *(void *)(v8 + 240);
          if (v19 && (v19 & v13) == 0)
          {
            int v30 = 589829;
            return v12 | v30;
          }
          goto LABEL_49;
        }
      }
      else if (a3)
      {
        goto LABEL_34;
      }
      v13 &= *(void *)(v8 + 240);
LABEL_49:
      a1 |= v14 == v8;
      if ((v16 & 1) == 0)
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
        uint64_t result = X509CertificateCheckSignature(a1, v14, v8 + 16, v8 + 40);
        if (result) {
          return result;
        }
      }
      unint64_t v21 = v11 + 1;
      if (v11 == -1) {
        goto LABEL_99;
      }
      uint64_t v8 = *(void *)(v8 + 288);
      v12 += 256;
      ++v11;
      if (!v8)
      {
        BOOL v6 = v31;
        a4 = v32;
        LOBYTE(v8) = v33;
        if (a3) {
          goto LABEL_61;
        }
        goto LABEL_87;
      }
    }
  }
  unint64_t v21 = 0;
  uint64_t v13 = -1;
  if (!a3) {
    goto LABEL_87;
  }
LABEL_61:
  if (*(void *)a3)
  {
    unint64_t v22 = v21;
    if (v8)
    {
      unint64_t v22 = v21 + 1;
      if (v21 == -1)
      {
LABEL_99:
        __break(0x5500u);
LABEL_100:
        __break(0x5519u);
      }
    }
    if (*(void *)a3 != v22) {
      return (v22 << 8) | 0x90006u;
    }
  }
  uint64_t v23 = *(void *)(a3 + 24);
  if (!v23 || !*(void *)(v23 + 8))
  {
    if (!*(unsigned char *)(a3 + 16)) {
      goto LABEL_87;
    }
    int v24 = v21 << 8;
    uint64_t v25 = **(void **)(v6[1] + 8);
LABEL_75:
    uint64_t v27 = 184;
    if (v8) {
      uint64_t v27 = 168;
    }
    uint64_t v28 = X509ChainGetAppleRootUsingKeyIdentifier(v25 + v27, *(unsigned __int8 *)(a3 + 17));
    if (!v28) {
      return v24 | 0x9000Bu;
    }
    uint64_t v29 = v28;
    if ((v8 & 1) == 0 && !compare_octet_string(v25 + 88, v28 + 88)
      || !X509CertificateCheckSignature(29, v29, v25 + 16, v25 + 40))
    {
      goto LABEL_87;
    }
    int v26 = 589836;
    return v24 | v26;
  }
  int v24 = v21 << 8;
  uint64_t v25 = **(void **)(v6[1] + 8);
  if (*(unsigned char *)(a3 + 16)) {
    goto LABEL_75;
  }
  memset(v35, 170, 32);
  v34[0] = 0xAAAAAAAAAAAAAAAALL;
  v34[1] = 0xAAAAAAAAAAAAAAAALL;
  if (X509CertificateParseSPKI((unint64_t *)(v25 + 88), &v35[2], v34, v35))
  {
LABEL_72:
    int v26 = 589832;
    return v24 | v26;
  }
  if (compare_octet_string((uint64_t)&v35[2], *(void *)(a3 + 32))
    || compare_octet_string((uint64_t)v35, *(void *)(a3 + 24)))
  {
    if (X509CertificateCheckSignatureWithPublicKey(*(uint64_t **)(a3 + 24), *(void *)(a3 + 32), *(void *)(a3 + 40), v25 + 16, v25 + 40))goto LABEL_72; {
  }
    }
  else if (!compare_octet_string(*(void *)(a3 + 32), (uint64_t)&ecPublicKey))
  {
    compare_octet_string((uint64_t)v34, *(void *)(a3 + 40));
  }
LABEL_87:
  uint64_t result = 0;
  if (a4) {
    *a4 = v13;
  }
  return result;
}

uint64_t X509ChainCheckPath(char a1, uint64_t *a2, uint64_t a3)
{
  return X509ChainCheckPathWithOptions(a1, a2, a3, 0);
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  uint64_t v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_54;
  }
  uint64_t v5 = &v4[v3];
  BOOL v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    int v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_55;
      }
      unint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        BOOL v17 = v16 < v15 && a3 == 0;
        unint64_t v18 = (unint64_t)(v12 + 1);
        if (v17) {
          return 3;
        }
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL)) {
          return 7;
        }
        if (v18 <= v18 + v15)
        {
          uint64_t result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_55;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_56;
        }
        unsigned int v23 = *v14++;
        unint64_t v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (v15 <= v22) {
            char v24 = 1;
          }
          else {
            char v24 = a3;
          }
          uint64_t result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0) {
            goto LABEL_28;
          }
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_54;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_55;
    }
    int v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, unsigned char *a3)
{
  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(result + 8)) {
    return 3;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  if (a1[1] != (unsigned __int8 *)1) {
    return 3;
  }
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3;
  }
  uint64_t result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned int v3 = a1[1];
  if (!v3) {
    goto LABEL_9;
  }
  if (v3 == (unsigned __int8 *)1)
  {
    int v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      uint64_t result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  unint64_t v4[3] = *MEMORY[0x263EF8340];
  memset(v4, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL) {
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    }
    else {
      return 2;
    }
  }
  return result;
}

void _UpdateMFi4FeatureKeyAttributes_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21DC52000, a2, OS_LOG_TYPE_DEBUG, "new attribute dictionary %@", (uint8_t *)&v2, 0xCu);
}

void MFAACreateCertificateCache_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "pCertCacheDomainList:%04X, pCertCacheStruct:%04X", v0, 0xEu);
}

void MFAACreateCertificateCache_cold_2(__int16 a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 67109376;
  v1[1] = a1 & 0xFFF;
  __int16 v2 = 1024;
  int v3 = 0;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Bad parameter pkStrCacheDomain:%04X, pkCacheNamePrefix:%04X", (uint8_t *)v1, 0xEu);
}

void MFAACreateCertificateCache_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __MFAACreateCertificateCache_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "dispatch_queue_create return NULL !\n", a5, a6, a7, a8, 0);
}

void __MFAACreateCertificateCache_block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __MFAACreateCertificateCache_block_invoke_20_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SyncCertCacheContentsToPreferencesFile_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAADeallocCertificateCache_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAADeallocCertificateCache_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __MFAADeallocCertificateCache_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAACreateCertDataFromSerialNumber_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_21DC52000, MEMORY[0x263EF8438], v0, "Bypass due to pkCacheState:%04X, pkStrSerNum:%04X, bCertNotCached:%d\n", v1, v2, v3, v4, v5);
}

void MFAAAddCertDataEntryToCacheForSerialNumber_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Bypass due to pkCacheState:%04X, pkCertData:%04X, pCFStrSerNum:%04X, bCertNotCached:%d\n", v0, 0x1Au);
}

void __MFAAAddCertDataEntryToCacheForSerialNumber_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __MFAAAddCertDataEntryToCacheForSerialNumber_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IncrementCertEntryUsageCount_cold_1(__int16 a1, uint8_t *buf, uint64_t a3)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1 & 0xFFF;
  *((_WORD *)buf + 4) = 2048;
  *(void *)(buf + 10) = a3;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "CFDictionaryGetValue pValueArrayMut:%04X, cfArrayCnt:%02lX\n", buf, 0x12u);
}

void IncrementCertEntryUsageCount_cold_2()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_21DC52000, MEMORY[0x263EF8438], v0, "Bypass due to pkCacheState:%04X, pCFHashSerNum:%04X, bCertNotCached:%d\n", v1, v2, v3, v4, v5);
}

void MFAARemoveCertDataEntryFromCache_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_21DC52000, MEMORY[0x263EF8438], v0, "Parameter failed pkCacheState:%04X, pkStrSerNum:%04X, bCertNotCached:%d\n", v1, v2, v3, v4, v5);
}

void MFAACreateMatchingHashForCertChainFromHashLSB_cold_1()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  __int16 v6 = v1;
  int v7 = v2;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Bypass due to pkCacheState:%04X, pkCertHashLSBStr:%04X (%@), bCertNotCached:%d\n", v3, 0x1Eu);
}

void MFAACreateCertChainDataFromHash_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_21DC52000, MEMORY[0x263EF8438], v0, "Bypass due to pkCacheState:%04X, pkCertHashStr:%04X, bCertNotCached:%d\n", v1, v2, v3, v4, v5);
}

void MFAAAddCertChainDataEntryToCacheForHash_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Bypass due to pkCacheState:%04X, pkCertChain:%04X, pkCertHashStr:%04X, bCertNotCached:%d\n", v0, 0x1Au);
}

void MFAARemoveCertChainDataEntryFromCache_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_21DC52000, MEMORY[0x263EF8438], v0, "Parameter failed pkCacheState:%04X, pkCertHashStr:%04X, bCertNotCached:%d\n", v1, v2, v3, v4, v5);
}

void MFAACreateSerialNumberDataFromString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAACreateSerialNumberDataFromString_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAACreateSerialNumberDataFromString_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "CFDataCreate returned NULL\n", a5, a6, a7, a8, 0);
}

void MFAACreateSerialNumberDataFromString_cold_4(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "pCFStrSerNum strLen = %d is invalid\n", (uint8_t *)v1, 8u);
}

void __CertCacheReferenceCountUpdate_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __CertCacheReferenceCountUpdate_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "CFNumberGetValue bCertRefCountValid = false\n", a5, a6, a7, a8, 0);
}

void __CertCacheReferenceCountUpdate_block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAACreateCapsFromAuthCert_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "Object allocation failed pAccCaps = NULL\n", a5, a6, a7, a8, 0);
}

void MFAACreateCapsFromAuthCert_cold_2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 67109120;
  v0[1] = 0;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "GetAccessoryCaps failed bStatus:%d\n", (uint8_t *)v0, 8u);
}

void MFAACreateCapsFromAuthCert_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "Parameter pCFCertData = NULL\n", a5, a6, a7, a8, 0);
}

void MFAACreateCapsFromAuthCert_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "CreateSecurityCertificateReference pSecCertRef = NULL\n", a5, a6, a7, a8, 0);
}

void MFAACreateCapsFromAuthCert_cold_5(unsigned __int16 a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 67109376;
  v2[1] = a2;
  __int16 v3 = 2048;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unrecognized/unsupported authVerMajor:%02X (pSecCertRef:%04lX)\n", (uint8_t *)v2, 0x12u);
}

void MFAACreateCapsFromAuthCert_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAADeallocAuthCertCaps_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "Parameter pkCertCaps = NULL\n", a5, a6, a7, a8, 0);
}

void logObjectForModule_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_21DC52000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

void MFAAVerifyPublicCertificate_cold_1(uint64_t a1, char a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = 136315906;
  uint64_t v3 = "MFAAVerifyPublicCertificate";
  __int16 v4 = 1024;
  int v5 = 81;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  __int16 v8 = 1024;
  int v9 = a2 & 1;
  _os_log_debug_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "%s:%d pkCertData %@, bValidCert %d", (uint8_t *)&v2, 0x22u);
}

void MFAAVerifyPublicCertificate_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "Invalid parameter pkCertData = NULL\n", a5, a6, a7, a8, 0);
}

void MFAAVerifyPublicCertificate_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAAVerifyPublicCertificate_cold_4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_1_1();
  *(_DWORD *)&v1[7] = 52;
  v1[9] = 2112;
  uint64_t v2 = v0;
  _os_log_debug_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "%s:%d pkCertData %@", (uint8_t *)v1, 0x1Cu);
}

void MFAAVerifyPublicCertificateChain_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "SecPolicyCreate pSecPolicyRef = NULL\n", a5, a6, a7, a8, 0);
}

void MFAAVerifyPublicCertificateChain_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "pArrayAccCert = NULL\n", a5, a6, a7, a8, 0);
}

void MFAAVerifyPublicCertificateChain_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "pArrayAnchorCA = NULL\n", a5, a6, a7, a8, 0);
}

void MFAAVerifyPublicCertificateChain_cold_5(int *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = *a1;
  v2[0] = 67109632;
  v2[1] = 4;
  __int16 v3 = 1024;
  int v4 = 1;
  __int16 v5 = 1024;
  int v6 = v1;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "SecTrustEvaluate wrong result, expect:%02X or %02X, actual:%02X\n", (uint8_t *)v2, 0x14u);
}

void MFAAVerifyPublicCertificateChain_cold_6(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "SecTrustEvaluate failed osStatus:%02X\n", (uint8_t *)v1, 8u);
}

void MFAAVerifyCertificateSerialNumber_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_1_1();
  *(_DWORD *)((char *)&v0[3] + 2) = 206;
  _os_log_debug_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "%s:%d pkCertData = NULL!!", (uint8_t *)v0, 0x12u);
}

void MFAAVerifyCertificateSerialNumber_cold_2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_1_1();
  *(_DWORD *)((char *)&v0[3] + 2) = 201;
  _os_log_debug_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "%s:%d certInfo = NULL!!", (uint8_t *)v0, 0x12u);
}

void MFAAVerifyNonceSignature_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "pkCertData = NULL\n", a5, a6, a7, a8, 0);
}

void MFAAVerifyNonceSignature_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "pkNonceData = NULL\n", a5, a6, a7, a8, 0);
}

void MFAAVerifyNonceSignature_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "pkSignatureData = NULL\n", a5, a6, a7, a8, 0);
}

void MFAAVerifyNonceSignature_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAACreateCertificateSerialNumber_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "Parameter pkCertData = NULL\n", a5, a6, a7, a8, 0);
}

void MFAACreateCertificateSerialNumber_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "pkSerNumData == NULL!", a5, a6, a7, a8, 0);
}

void MFAACreateRandomNonce_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "CFDataCreate fail pRandomNonce = NULL\n", a5, a6, a7, a8, 0);
}

void MFAACreateSecurityCertificateReference_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAACreateAnchorCertificateAuthorityArray_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "CFArrayCreateMutable pArrayAnchorCA = NULL\n", a5, a6, a7, a8, 0);
}

void MFAACreateAnchorCertificateAuthorityArray_cold_2(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unsupported authVerMajor:%02X\n", (uint8_t *)v1, 8u);
}

void MFAACreateAnchorCertificateAuthorityArray_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "SecCertificateCreateWithBytes returned pCertSubCA2:NULL\n", a5, a6, a7, a8, 0);
}

void MFAACreateAnchorCertificateAuthorityArray_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "SecCertificateCreateWithBytes returned pCertSubCA1:NULL\n", a5, a6, a7, a8, 0);
}

void MFAACreateAnchorCertificateAuthorityArray_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAACreateAnchorCertificateAuthorityArray_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAACreateAnchorCertificateAuthorityArray_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAACreateAnchorCertificateAuthorityArray_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAACreateAnchorCertificateAuthorityArray_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAACreateAnchorCertificateAuthorityArray_cold_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAACreateAnchorCertificateAuthorityArray_cold_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAACreateAnchorCertificateAuthorityArray_cold_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MFAACertificateAuthV2Class_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "CreateCertificateSerialNumber pkCertSerNum = NULL\n", a5, a6, a7, a8, 0);
}

void MFAACertificateAuthV2Class_cold_2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Cert serial number pkSerNumBytes:%04lX, serNumLen:%02lX\n", v0, 0x16u);
}

void MFAAPrintCertSerialNumberBytes_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Certificate serial number: [%s]\n", (uint8_t *)&v1, 0xCu);
}

void MFAAPrintCertSerialNumberBytes_cold_2(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "sprintf fail status:%02X\n", (uint8_t *)v1, 8u);
}

void MFAAPrintCertSerialNumberBytes_cold_3()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Bad parameter(s) pkSerNumBytes:%04lX, serNumLen:%02lX\n", v0, 0x16u);
}

void MFAADeviceIdentityRequestCertificate_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  uint64_t v1 = "MFAADeviceIdentityRequestCertificate";
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s: !framework", (uint8_t *)&v0, 0xCu);
}

void MFAADeviceIdentityRequestCertificate_cold_2(uint64_t *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  int v2 = 136315394;
  uint64_t v3 = "MFAADeviceIdentityRequestCertificate";
  __int16 v4 = 2112;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s: Failed to create access control! error %@", (uint8_t *)&v2, 0x16u);
}

void MFAADeviceIdentityRequestCertificate_cold_3(uint64_t a1, _DWORD *a2, void *a3)
{
  *a2 = 136315394;
  OUTLINED_FUNCTION_0_1(a1, (uint64_t)a2, (uint64_t)"MFAADeviceIdentityRequestCertificate");
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s: Failed to obtain valid certificates from server: %s\n", v4, 0x16u);
}

void MFAADeviceIdentityRequestCertificate_cold_4(uint64_t a1, _DWORD *a2, void *a3)
{
  *a2 = 136315394;
  OUTLINED_FUNCTION_0_1(a1, (uint64_t)a2, (uint64_t)"MFAADeviceIdentityRequestCertificate");
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s: error: %s\n", v4, 0x16u);
}

void MFAADeviceIdentityRequestCertificate_cold_5(uint64_t a1, uint64_t *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a2;
  int v3 = 136315650;
  __int16 v4 = "MFAADeviceIdentityRequestCertificate";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s: Failed to set ACL protection to %@! error %@", (uint8_t *)&v3, 0x20u);
}

void __MFAADeviceIdentityRequestCertificate_block_invoke_cold_1(uint64_t a1, double a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 80);
  int v3 = 136315906;
  __int16 v4 = "MFAADeviceIdentityRequestCertificate_block_invoke";
  __int16 v5 = 1024;
  int v6 = 137;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  __int16 v9 = 2048;
  double v10 = a2;
  _os_log_fault_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "%s:%d %@, IssueClientCertificate response took too long!!! %f seconds.", (uint8_t *)&v3, 0x26u);
}

void MFAAUpdateDataSignature_cold_1()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Parameter pAuthSignCtx = NULL\n", v0, 2u);
}

void MFAAFinalizeDataSignature_cold_1(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unsupported authDataType:%02X\n", (uint8_t *)v1, 8u);
}

void GetConnectionToAuthDaemon_cold_1()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Auth daemon connection gAuthdXPCConnection = NULL\n", v0, 2u);
}

void __GetConnectionToAuthDaemon_block_invoke_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x263EF86B0]);
  int v2 = 136315138;
  int v3 = string;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Got unexpected error: %s", (uint8_t *)&v2, 0xCu);
}

void MFAACreateDeviceNonceSignature_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "Parameter pkNonceData = NULL\n", a5, a6, a7, a8, 0);
}

void MFAACreateDeviceNonceSignature_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21DC52000, MEMORY[0x263EF8438], a3, "SecKeyCreateWithSecureKeyVaultID(IAPPrivateKey) pSecKeyRef = NULL\n", a5, a6, a7, a8, 0);
}

void MFAACreateDeviceNonceSignature_cold_3(int a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 2048;
  uint64_t v4 = a2;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "SecKeyRawSign returned error: %d, segSignatureLen: %zu\n", (uint8_t *)v2, 0x12u);
}

void MFAACreateDeviceNonceSignature_cold_4(unsigned __int16 a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Invalid nonce pkNonceBytes:%04lX, nonceLen:%02lX\n", (uint8_t *)&v2, 0x16u);
}

void __MFAADeviceIdentityCopyCertificate_block_invoke_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 67109120;
  v0[1] = 366;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "MFAADeviceIdentityCopyCertificate:%d: _copyCertificateForIndex: error\n", (uint8_t *)v0, 8u);
}

void __MFAADeviceIdentityCopyCertificate_block_invoke_cold_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  int v2 = "MFAADeviceIdentityCopyCertificate_block_invoke";
  __int16 v3 = 2048;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s: unexpected count %lld\n", (uint8_t *)&v1, 0x16u);
}

void _storeRefreshStateToDisk_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _copyCertificateForIndex_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  int v1 = "_copyCertificateForIndex";
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "DeviceIdentity: %s: !numberedLabel\n", (uint8_t *)&v0, 0xCu);
}

void MFAADeviceIdentityCreateSignature_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __MFAADeviceIdentityCreateSignature_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _storeUseTimeToDisk_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _storeIsClassDToDisk_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_21DC52000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
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

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
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

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFTimeInterval CFDateGetTimeIntervalSinceDate(CFDateRef theDate, CFDateRef otherDate)
{
  MEMORY[0x270EE48D0](theDate, otherDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x270EE4A20](cf);
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

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x270EF4A18](*(void *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t SecAccessControlCreate()
{
  return MEMORY[0x270EFD638]();
}

uint64_t SecAccessControlSetProtection()
{
  return MEMORY[0x270EFD678]();
}

uint64_t SecCMSCertificatesOnlyMessageCopyCertificates()
{
  return MEMORY[0x270EFD6C0]();
}

uint64_t SecCertificateCopyComponentType()
{
  return MEMORY[0x270EFD700]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

uint64_t SecCertificateCopyIssuerSequence()
{
  return MEMORY[0x270EFD740]();
}

uint64_t SecCertificateCopyIssuerSummary()
{
  return MEMORY[0x270EFD748]();
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x270EFD758](certificate);
}

uint64_t SecCertificateCopyOrganization()
{
  return MEMORY[0x270EFD770]();
}

CFDataRef SecCertificateCopySerialNumberData(SecCertificateRef certificate, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD7A8](certificate, error);
}

uint64_t SecCertificateCopySubjectString()
{
  return MEMORY[0x270EFD7B8]();
}

uint64_t SecCertificateCopyiAPAuthCapabilities()
{
  return MEMORY[0x270EFD7C8]();
}

uint64_t SecCertificateCopyiAPSWAuthCapabilities()
{
  return MEMORY[0x270EFD7D0]();
}

uint64_t SecCertificateCreateWithBytes()
{
  return MEMORY[0x270EFD7D8]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

uint64_t SecCertificateGetiAuthVersion()
{
  return MEMORY[0x270EFD830]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x270EFD858]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x270EFD860]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x270EFD988](query, attributesToUpdate);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x270EFD9D8](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA40](parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFDA50](key, algorithm, dataToSign, error);
}

OSStatus SecKeyRawSign(SecKeyRef key, SecPadding padding, const uint8_t *dataToSign, size_t dataToSignLen, uint8_t *sig, size_t *sigLen)
{
  return MEMORY[0x270EFDAB0](key, *(void *)&padding, dataToSign, dataToSignLen, sig, sigLen);
}

OSStatus SecKeyRawVerify(SecKeyRef key, SecPadding padding, const uint8_t *signedData, size_t signedDataLen, const uint8_t *sig, size_t sigLen)
{
  return MEMORY[0x270EFDAB8](key, *(void *)&padding, signedData, signedDataLen, sig, sigLen);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x270EFDAC8](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateAppleBasicAttestationUser()
{
  return MEMORY[0x270EFDB10]();
}

uint64_t SecPolicyCreateAppleComponentCertificate()
{
  return MEMORY[0x270EFDB20]();
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x270EFDB48]();
}

uint64_t SecPolicyCreateiAP()
{
  return MEMORY[0x270EFDBC8]();
}

uint64_t SecPolicyCreateiAPSWAuthWithExpiration()
{
  return MEMORY[0x270EFDBD0]();
}

uint64_t SecSHA256DigestCreateFromData()
{
  return MEMORY[0x270EFDC70]();
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x270EFDD30](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x270EFDD50](trust, result);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

uint64_t SecTrustIsExpiredOnly()
{
  return MEMORY[0x270EFDD90]();
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x270EFDDA8](trust, anchorCertificates);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x270ED8888]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x270ED88B0]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x270ED88B8]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x270ED88C0]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x270ED88E8]();
}

uint64_t ccder_decode_rsa_pub_n()
{
  return MEMORY[0x270ED8918]();
}

uint64_t ccder_sizeof_len()
{
  return MEMORY[0x270ED89A0]();
}

uint64_t ccder_sizeof_tag()
{
  return MEMORY[0x270ED89B8]();
}

uint64_t ccdigest()
{
  return MEMORY[0x270ED8A40]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x270ED8A48]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x270ED8A50]();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return MEMORY[0x270ED8A70]();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return MEMORY[0x270ED8A78]();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return MEMORY[0x270ED8A80]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x270ED8A98]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x270ED8AA0]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x270ED8AB8]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x270ED8AD8]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x270ED8AE0]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x270ED8B00]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x270ED8B08]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x270ED8B28]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x270ED8D08]();
}

uint64_t ccrsa_verify_pkcs1v15_allowshortsigs()
{
  return MEMORY[0x270ED8D40]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x270ED8D60]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x270ED8D78]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x270ED8E70]();
}

double difftime(time_t a1, time_t a2)
{
  MEMORY[0x270ED9180](a1, a2);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x270F9AAB0](p, isRequiredMethod, isInstanceMethod, outCount);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x270EDB670](a1, a2, a3);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x270EDB938](a1);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}