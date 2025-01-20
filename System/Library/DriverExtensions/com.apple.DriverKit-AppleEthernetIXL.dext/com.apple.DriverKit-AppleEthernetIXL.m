void sub_100001738(_WORD *a1, int a2)
{
  if (a2)
  {
    *a1 = a2;
    operator new[]();
  }
  sub_10001C718();
}

uint64_t sub_100001788(unsigned __int16 *a1, int a2, uint64_t a3)
{
  if (!a2 || !a3) {
    sub_10001C744();
  }
  uint64_t v3 = 3758097115;
  if (*a1)
  {
    unsigned int v4 = 0;
    unsigned int v5 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
    unsigned int v6 = v5 | (v5 >> 4) | ((v5 | (v5 >> 4)) >> 8);
    int v7 = (v6 | HIWORD(v6)) + 1;
    v8 = (unsigned __int8 *)*((void *)a1 + 1);
    uint64_t v9 = *a1;
    do
    {
      int v10 = *v8;
      v8 += 5;
      if (!v10) {
        ++v4;
      }
      --v9;
    }
    while (v9);
    if (v4 >= (unsigned __int16)v7)
    {
      uint64_t v11 = 0;
      unsigned int v12 = 0;
      int v13 = 0;
      BOOL v14 = 0;
      v15 = (unsigned __int8 *)*((void *)a1 + 1);
      do
      {
        int v16 = *v15;
        v15 += 5;
        BOOL v17 = v16 == 0;
        if (v16)
        {
          int v13 = 0;
        }
        else
        {
          if (!v14) {
            unsigned int v12 = v11;
          }
          if (++v13 == (unsigned __int16)v7)
          {
            if ((v12 & 0x80000000) == 0)
            {
              if ((_WORD)v7)
              {
                v19 = (unsigned char *)(*((void *)a1 + 1) + 5 * v12);
                int v20 = v12;
                do
                {
                  unsigned char *v19 = 1;
                  v19 += 5;
                  ++v20;
                }
                while ((int)(v12 + (unsigned __int16)v7) > v20);
              }
              uint64_t v3 = 0;
              *(_OWORD *)(a3 + 8) = 0u;
              *(void *)(a3 + 40) = 0;
              *(_OWORD *)(a3 + 24) = 0u;
              *(void *)a3 = a1;
              *(_WORD *)(a3 + 12) = v12;
              *(_WORD *)(a3 + 44) = v7;
              *(_WORD *)(a3 + 46) = a2;
            }
            return v3;
          }
        }
        ++v11;
        BOOL v14 = v17;
      }
      while (*a1 != v11);
    }
  }
  return v3;
}

unint64_t sub_1000018B0(unint64_t result)
{
  uint64_t v1 = *(unsigned __int16 *)result;
  if (!*(_WORD *)result) {
    return 0;
  }
  unint64_t v2 = result;
  LODWORD(result) = 0;
  uint64_t v3 = *(unsigned __int8 **)(v2 + 8);
  do
  {
    int v4 = *v3;
    v3 += 5;
    if (v4) {
      result = result;
    }
    else {
      result = (result + 1);
    }
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_1000018E4(uint64_t result, int a2)
{
  uint64_t v2 = *(unsigned __int16 *)result;
  if (*(_WORD *)result)
  {
    uint64_t v3 = result;
    uint64_t v4 = 0;
    LODWORD(result) = 0;
    int v5 = 0;
    BOOL v6 = 0;
    int v7 = *(unsigned __int8 **)(v3 + 8);
    do
    {
      int v8 = *v7;
      v7 += 5;
      BOOL v9 = v8 == 0;
      if (v8)
      {
        int v5 = 0;
      }
      else
      {
        if (v6) {
          result = result;
        }
        else {
          result = v4;
        }
        if (++v5 == a2) {
          return result;
        }
      }
      ++v4;
      BOOL v6 = v9;
    }
    while (v2 != v4);
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100001948(unsigned __int16 *a1, int a2, uint64_t a3)
{
  if (!a3 || (a2 - 17) <= 0xFFFFFFEF) {
    sub_10001C770();
  }
  unsigned int v3 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
  unsigned int v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
  int v5 = (v4 | HIWORD(v4)) + 1;
  uint64_t v6 = *a1;
  if (*a1)
  {
    int v7 = 0;
    int v8 = (unsigned __int8 *)*((void *)a1 + 1);
    do
    {
      int v9 = *v8;
      v8 += 5;
      if (!v9) {
        ++v7;
      }
      --v6;
    }
    while (v6);
  }
  else
  {
    int v7 = 0;
  }
  if (v7 < (unsigned __int16)v5) {
    return 3758097115;
  }
  *(_OWORD *)(a3 + 8) = 0u;
  *(void *)(a3 + 40) = 0;
  *(_OWORD *)(a3 + 24) = 0u;
  *(void *)a3 = a1;
  *(_DWORD *)(a3 + 8) = 1;
  *(_WORD *)(a3 + 46) = a2;
  *(_WORD *)(a3 + 44) = v5;
  unsigned int v11 = *a1;
  if (!*a1) {
LABEL_18:
  }
    sub_10001C79C();
  uint64_t v12 = 0;
  unint64_t v13 = 0;
  int v14 = 0;
  uint64_t v15 = *((void *)a1 + 1);
  while (*(unsigned char *)(v15 + v12))
  {
LABEL_17:
    ++v13;
    v12 += 5;
    if (v13 >= v11) {
      goto LABEL_18;
    }
  }
  *(_WORD *)(a3 + 12 + 2 * v14++) = v13;
  uint64_t v15 = *((void *)a1 + 1);
  *(unsigned char *)(v15 + v12) = 1;
  if (v14 != (unsigned __int16)v5)
  {
    unsigned int v11 = *a1;
    goto LABEL_17;
  }
  return 0;
}

uint64_t sub_100001A4C(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    sub_10001C7C8();
  }
  if (*(_DWORD *)(a2 + 8) == 1)
  {
    if (*(_WORD *)(a2 + 44))
    {
      unint64_t v2 = 0;
      do
      {
        uint64_t v3 = *(void *)(a1 + 8) + 5 * *(unsigned __int16 *)(a2 + 12 + 2 * v2);
        *(unsigned char *)(v3 + 4) = 0;
        *(_DWORD *)uint64_t v3 = 0;
        ++v2;
      }
      while (v2 < *(unsigned __int16 *)(a2 + 44));
    }
  }
  else if (*(_WORD *)(a2 + 44))
  {
    int v4 = *(unsigned __int16 *)(a2 + 12);
    int v5 = v4;
    do
    {
      uint64_t v6 = *(void *)(a1 + 8) + 5 * (unsigned __int16)v5;
      *(unsigned char *)(v6 + 4) = 0;
      *(_DWORD *)uint64_t v6 = 0;
      ++v5;
    }
    while (*(unsigned __int16 *)(a2 + 44) + v4 > (unsigned __int16)v5);
  }
  *(void *)a2 = 0;
  return 0;
}

uint64_t sub_100001AF8(unsigned __int16 *a1)
{
  return *a1;
}

uint64_t sub_100001B00(unsigned __int16 *a1, unsigned int a2)
{
  uint64_t v2 = *a1;
  if (v2 <= a2) {
    sub_10001C7F4();
  }
  uint64_t v3 = *((void *)a1 + 1);
  uint64_t result = a2;
  int v5 = (unsigned __int8 *)(v3 + 5 * a2);
  while (1)
  {
    int v6 = *v5;
    v5 += 5;
    if (!v6) {
      break;
    }
    if (v2 == ++result) {
      return 3758097115;
    }
  }
  return result;
}

uint64_t sub_100001B54(uint64_t result, unsigned int a2, int a3)
{
  if (!result) {
    sub_10001C820();
  }
  if (*(unsigned __int16 *)(result + 44) <= a2) {
    sub_10001C84C();
  }
  uint64_t v3 = (_WORD *)(result + 12);
  if (*(_DWORD *)(result + 8)) {
    unsigned __int16 v4 = v3[a2];
  }
  else {
    unsigned __int16 v4 = *v3 + a2;
  }
  if (a3) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  *(unsigned char *)(*(void *)(*(void *)result + 8) + 5 * v4 + v5) = 1;
  return result;
}

uint64_t sub_100001BC4(uint64_t result, unsigned int a2, int a3)
{
  if (!result) {
    sub_10001C878();
  }
  if (*(unsigned __int16 *)(result + 44) <= a2) {
    sub_10001C84C();
  }
  uint64_t v3 = (_WORD *)(result + 12);
  if (*(_DWORD *)(result + 8)) {
    unsigned __int16 v4 = v3[a2];
  }
  else {
    unsigned __int16 v4 = *v3 + a2;
  }
  uint64_t v5 = *(void *)(*(void *)result + 8) + 5 * v4;
  uint64_t v6 = 1;
  if (!a3) {
    uint64_t v6 = 2;
  }
  *(unsigned char *)(v5 + v6) = 0;
  return result;
}

uint64_t sub_100001C34(uint64_t result, unsigned int a2, int a3)
{
  if (!result) {
    sub_10001C8A4();
  }
  if (*(unsigned __int16 *)(result + 44) <= a2) {
    sub_10001C84C();
  }
  uint64_t v3 = (_WORD *)(result + 12);
  if (*(_DWORD *)(result + 8)) {
    unsigned __int16 v4 = v3[a2];
  }
  else {
    unsigned __int16 v4 = *v3 + a2;
  }
  uint64_t v5 = *(void *)(*(void *)result + 8) + 5 * v4;
  uint64_t v6 = 3;
  if (!a3) {
    uint64_t v6 = 4;
  }
  *(unsigned char *)(v5 + v6) = 1;
  return result;
}

BOOL sub_100001CA8(uint64_t a1, unsigned int a2, int a3)
{
  if (!a1) {
    sub_10001C8D0();
  }
  if (*(unsigned __int16 *)(a1 + 44) <= a2) {
    sub_10001C84C();
  }
  uint64_t v3 = (_WORD *)(a1 + 12);
  if (*(_DWORD *)(a1 + 8)) {
    unsigned __int16 v4 = v3[a2];
  }
  else {
    unsigned __int16 v4 = *v3 + a2;
  }
  uint64_t v5 = *(void *)(*(void *)a1 + 8) + 5 * v4;
  uint64_t v6 = 1;
  if (!a3) {
    uint64_t v6 = 2;
  }
  return *(unsigned char *)(v5 + v6) != 0;
}

BOOL sub_100001D20(uint64_t a1, unsigned int a2, int a3)
{
  if (!a1) {
    sub_10001C8FC();
  }
  if (*(unsigned __int16 *)(a1 + 44) <= a2) {
    sub_10001C84C();
  }
  uint64_t v3 = (_WORD *)(a1 + 12);
  if (*(_DWORD *)(a1 + 8)) {
    unsigned __int16 v4 = v3[a2];
  }
  else {
    unsigned __int16 v4 = *v3 + a2;
  }
  uint64_t v5 = *(void *)(*(void *)a1 + 8) + 5 * v4;
  uint64_t v6 = 3;
  if (!a3) {
    uint64_t v6 = 4;
  }
  return *(unsigned char *)(v5 + v6) != 0;
}

uint64_t sub_100001D98(uint64_t result)
{
  if (!result) {
    sub_10001C928();
  }
  uint64_t v1 = *(unsigned __int16 *)(result + 44);
  if (*(_WORD *)(result + 44))
  {
    uint64_t v2 = 0;
    int v3 = *(_DWORD *)(result + 8);
    unsigned __int16 v4 = (_WORD *)(result + 12);
    uint64_t v5 = *(void *)(*(void *)result + 8);
    do
    {
      if (v3) {
        unsigned __int16 v6 = v4[v2];
      }
      else {
        unsigned __int16 v6 = *v4 + v2;
      }
      ++v2;
      *(_DWORD *)(v5 + 5 * v6 + 1) = 0;
    }
    while (v1 != v2);
  }
  return result;
}

uint64_t sub_100001E04(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 256);
  unsigned int v3 = *(_DWORD *)(a2 + 128);
  if (v3 != *(_DWORD *)(a2 + 132))
  {
    uint64_t v5 = result;
    int v6 = v2 - 1;
    do
    {
      uint64_t v7 = *(void *)(*(void *)(a2 + 264) + 8 * v3);
      if (v7) {
        v9[6] = v7 - 8;
      }
      uint64_t result = (*(uint64_t (**)(void, void *))(**(void **)(v5 + 8) + 64))(*(void *)(v5 + 8), v9);
      int v8 = *(_DWORD *)(a2 + 132);
      unsigned int v3 = (*(_DWORD *)(a2 + 128) + 1) & v6;
      *(_DWORD *)(a2 + 128) = v3;
    }
    while (v3 != v8);
  }
  return result;
}

void sub_100001F04(int *a1)
{
  int v2 = a1 + 8408;
  if ((dword_100028548 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    uint64_t v9 = qword_100028550;
    __int16 v10 = 2080;
    unsigned int v11 = "update_link_status";
    __int16 v12 = 1024;
    int v13 = 12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): <==\n", (uint8_t *)&v8, 0x1Cu);
  }
  if (*((unsigned char *)v2 + 1856))
  {
    uint64_t v3 = *v2;
    if (v3 > 0x31)
    {
      uint64_t v5 = 0;
      unsigned int v4 = 1048608;
    }
    else
    {
      unsigned int v4 = dword_100021728[v3];
      uint64_t v5 = qword_1000217F0[v3];
    }
    if ((*((unsigned char *)v2 + 9) & 0x60) != 0) {
      uint64_t v7 = v4 | 0x400000;
    }
    else {
      uint64_t v7 = v4;
    }
    if ((dword_100028548 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316162;
      uint64_t v9 = qword_100028550;
      __int16 v10 = 2080;
      unsigned int v11 = "update_link_status";
      __int16 v12 = 1024;
      int v13 = 172;
      __int16 v14 = 1024;
      int v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): setting Link mode=0%08x, baud=%lld\n", (uint8_t *)&v8, 0x2Cu);
    }
    (*(void (**)(void, uint64_t, uint64_t))(**(void **)a1 + 128))(*(void *)a1, 3, v7);
    int v6 = *(void (**)(void))(**(void **)a1 + 136);
  }
  else
  {
    if ((dword_100028548 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      uint64_t v9 = qword_100028550;
      __int16 v10 = 2080;
      unsigned int v11 = "update_link_status";
      __int16 v12 = 1024;
      int v13 = 178;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Link is Down\n", (uint8_t *)&v8, 0x1Cu);
    }
    (*(void (**)(void, uint64_t, uint64_t))(**(void **)a1 + 128))(*(void *)a1, 1, 34);
    int v6 = *(void (**)(void))(**(void **)a1 + 136);
  }
  v6();
  if ((dword_100028548 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    uint64_t v9 = qword_100028550;
    __int16 v10 = 2080;
    unsigned int v11 = "update_link_status";
    __int16 v12 = 1024;
    int v13 = 184;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): ==>\n", (uint8_t *)&v8, 0x1Cu);
  }
}

uint64_t sub_100002260(uint64_t a1, void *a2, unsigned int *a3)
{
  if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    uint64_t v10 = qword_100028550;
    __int16 v11 = 2080;
    __int16 v12 = "getSupportedMediaArray";
    __int16 v13 = 1024;
    int v14 = 189;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): <==\n", (uint8_t *)&v9, 0x1Cu);
  }
  *a2 = 0x2000000022;
  uint64_t v6 = *(void *)(*(void *)(a1 + 24) + 72);
  if ((v6 & 0x20000) != 0)
  {
    a2[1] = 0x10002600200026;
    unsigned int v7 = 4;
  }
  else
  {
    unsigned int v7 = 2;
  }
  if ((v6 & 0x40000) != 0)
  {
    *((_DWORD *)a2 + v7) = 1048624;
    v7 |= 1u;
    if ((v6 & 0x8000000) == 0)
    {
LABEL_7:
      if ((v6 & 0x10000000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_43;
    }
  }
  else if ((v6 & 0x8000000) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a2 + v7++) = 1048619;
  if ((v6 & 0x10000000) == 0)
  {
LABEL_8:
    if ((v6 & 0x4000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a2 + v7++) = 1048622;
  if ((v6 & 0x4000000000) == 0)
  {
LABEL_9:
    if ((v6 & 0x8000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_44:
  *((_DWORD *)a2 + v7++) = 1048630;
  if ((v6 & 0x8000000000) != 0) {
LABEL_10:
  }
    *((_DWORD *)a2 + v7++) = 1048631;
LABEL_11:
  if ((v6 & 0x400060) != 0) {
    *((_DWORD *)a2 + v7++) = 1114145;
  }
  if ((v6 & 0x100000) != 0)
  {
    *((_DWORD *)a2 + v7++) = 1048626;
    if ((v6 & 0x200000) == 0)
    {
LABEL_15:
      if ((v6 & 0x80000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((v6 & 0x200000) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)a2 + v7++) = 1048626;
  if ((v6 & 0x80000) != 0) {
LABEL_16:
  }
    *((_DWORD *)a2 + v7++) = 1048629;
LABEL_17:
  if ((v6 & 0x1002510) != 0) {
    *((_DWORD *)a2 + v7++) = 1114149;
  }
  if ((v6 & 0x2000000) != 0)
  {
    *((_DWORD *)a2 + v7++) = 1114150;
    if ((v6 & 0x4000000) == 0)
    {
LABEL_21:
      if ((v6 & 2) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((v6 & 0x4000000) == 0)
  {
    goto LABEL_21;
  }
  *((_DWORD *)a2 + v7++) = 1114156;
  if ((v6 & 2) != 0) {
LABEL_22:
  }
    *((_DWORD *)a2 + v7++) = 1048633;
LABEL_23:
  if ((v6 & 0x800800) != 0) {
    *((_DWORD *)a2 + v7++) = 1048636;
  }
  if ((v6 & 0x1000) != 0)
  {
    *((_DWORD *)a2 + v7++) = 1114171;
    if ((v6 & 0x80) == 0)
    {
LABEL_27:
      if ((v6 & 4) == 0) {
        goto LABEL_28;
      }
      goto LABEL_54;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_27;
  }
  *((_DWORD *)a2 + v7++) = 1114154;
  if ((v6 & 4) == 0)
  {
LABEL_28:
    if ((v6 & 8) == 0) {
      goto LABEL_29;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)a2 + v7++) = 1048634;
  if ((v6 & 8) == 0)
  {
LABEL_29:
    if ((v6 & 0x40000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a2 + v7++) = 1048635;
  if ((v6 & 0x40000000) == 0)
  {
LABEL_30:
    if ((v6 & 0x10) == 0) {
      goto LABEL_31;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)a2 + v7++) = 1048638;
  if ((v6 & 0x10) == 0)
  {
LABEL_31:
    if ((v6 & 0x200) == 0) {
      goto LABEL_32;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)a2 + v7++) = 1114157;
  if ((v6 & 0x200) == 0)
  {
LABEL_32:
    if ((v6 & 0x100000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)a2 + v7++) = 1114155;
  if ((v6 & 0x100000000) == 0)
  {
LABEL_33:
    if ((v6 & 0x200000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)a2 + v7++) = 1114166;
  if ((v6 & 0x200000000) == 0)
  {
LABEL_34:
    if ((v6 & 0x400000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)a2 + v7++) = 1114165;
  if ((v6 & 0x400000000) == 0)
  {
LABEL_35:
    if ((v6 & 0x800000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)a2 + v7++) = 1114167;
  if ((v6 & 0x800000000) == 0)
  {
LABEL_36:
    if ((v6 & 0x1000000000) == 0) {
      goto LABEL_37;
    }
LABEL_63:
    *((_DWORD *)a2 + v7++) = 1114173;
    if ((v6 & 0x2000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_62:
  *((_DWORD *)a2 + v7++) = 1114170;
  if ((v6 & 0x1000000000) != 0) {
    goto LABEL_63;
  }
LABEL_37:
  if ((v6 & 0x2000000000) != 0) {
LABEL_38:
  }
    *((_DWORD *)a2 + v7++) = 1114172;
LABEL_39:
  *a3 = v7;
  if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    uint64_t v10 = qword_100028550;
    __int16 v11 = 2080;
    __int16 v12 = "getSupportedMediaArray";
    __int16 v13 = 1024;
    int v14 = 292;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): ==>\n", (uint8_t *)&v9, 0x1Cu);
  }
  return 0;
}

uint64_t sub_100002614(uint64_t a1, int a2)
{
  if ((dword_100028548 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315906;
    uint64_t v5 = qword_100028550;
    __int16 v6 = 2080;
    unsigned int v7 = "selMed";
    __int16 v8 = 1024;
    int v9 = 298;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): for type=0%08x\n", (uint8_t *)&v4, 0x22u);
  }
  return 1;
}

uint64_t sub_1000026D0(BOOL a1, int a2)
{
  if ((dword_100028548 & 4) != 0)
  {
    a1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (a1)
    {
      int v4 = 136315906;
      uint64_t v5 = qword_100028550;
      __int16 v6 = 2080;
      unsigned int v7 = "handleChosenMedia";
      __int16 v8 = 1024;
      int v9 = 305;
      __int16 v10 = 1024;
      int v11 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): <== (%x)\n", (uint8_t *)&v4, 0x22u);
    }
  }
  sub_100002614(a1, a2);
  if ((dword_100028548 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315650;
    uint64_t v5 = qword_100028550;
    __int16 v6 = 2080;
    unsigned int v7 = "handleChosenMedia";
    __int16 v8 = 1024;
    int v9 = 311;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): ==>\n", (uint8_t *)&v4, 0x1Cu);
  }
  return 0;
}

uint64_t sub_100002818(uint64_t a1, unsigned int a2)
{
  __int16 v2 = a2;
  uint64_t v4 = 3758097098;
  if (!i40e_aq_set_vsi_unicast_promiscuous(*(void *)(a1 + 24), *(_WORD *)(a1 + 50), (a2 >> 8) & 1, 0, 1))
  {
    if (i40e_aq_set_vsi_multicast_promiscuous(*(void *)(a1 + 24), *(_WORD *)(a1 + 50), (v2 & 0x300) != 0, 0))return 3758097098; {
    else
    }
      return 0;
  }
  return v4;
}

void sub_10000288C(uint64_t a1, int a2)
{
  uint64_t v3 = (int *)(a1 + 34524);
  uint64_t v4 = a1 + 33616;
  int phy_capabilities = i40e_aq_get_phy_capabilities(a1 + 33616, 0, 1, (unsigned __int8 *)&v35, 0);
  if (phy_capabilities)
  {
    int v6 = phy_capabilities;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v7 = *v3;
    *(_DWORD *)buf = 136316162;
    uint64_t v26 = qword_100028550;
    __int16 v27 = 2080;
    v28 = "setLink";
    __int16 v29 = 1024;
    int v30 = 339;
    __int16 v31 = 1024;
    int v32 = v6;
    __int16 v33 = 1024;
    int v34 = v7;
    __int16 v8 = "ixl:(%s): %s(%d): Error getting phy capabilities %d, aq error: %d\n";
    goto LABEL_22;
  }
  int v9 = v35;
  char v10 = v41;
  int v11 = i40e_aq_get_phy_capabilities(v4, 0, 0, (unsigned __int8 *)&v35, 0);
  if (v11)
  {
    int v12 = v11;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v13 = *v3;
    *(_DWORD *)buf = 136316162;
    uint64_t v26 = qword_100028550;
    __int16 v27 = 2080;
    v28 = "setLink";
    __int16 v29 = 1024;
    int v30 = 349;
    __int16 v31 = 1024;
    int v32 = v12;
    __int16 v33 = 1024;
    int v34 = v13;
    __int16 v8 = "ixl:(%s): %s(%d): Error getting phy capabilities %d, aq error: %d\n";
    goto LABEL_22;
  }
  WORD2(v24) = v36;
  char v14 = v37;
  WORD3(v24) = v38;
  DWORD2(v24) = v39;
  WORD6(v24) = v40;
  HIWORD(v24) = v42 & 0x1F;
  LODWORD(v24) = 0;
  char v15 = v37 & 0xFC;
  int v16 = v3[243];
  if (v16 == 1)
  {
    char v17 = v15 | 2;
  }
  else if (v16 == 2)
  {
    char v17 = v15 | 1;
  }
  else
  {
    if (v16 != 3) {
      v3[243] = 3;
    }
    char v17 = v14 | 3;
  }
  BYTE5(v24) = v17;
  if (a2)
  {
    LODWORD(v24) = v9;
    BYTE13(v24) = v10;
  }
  int v18 = i40e_aq_set_phy_config(v4, &v24, 0);
  if (v18)
  {
    int v19 = v18;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v20 = *v3;
    *(_DWORD *)buf = 136316162;
    uint64_t v26 = qword_100028550;
    __int16 v27 = 2080;
    v28 = "setLink";
    __int16 v29 = 1024;
    int v30 = 388;
    __int16 v31 = 1024;
    int v32 = v19;
    __int16 v33 = 1024;
    int v34 = v20;
    __int16 v8 = "ixl:(%s): %s(%d): Error setting new phy config %d, aq error: %d\n";
    goto LABEL_22;
  }
  int restarted = i40e_aq_set_link_restart_an(v4, a2, 0);
  if (restarted)
  {
    int v22 = restarted;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = *v3;
      *(_DWORD *)buf = 136316162;
      uint64_t v26 = qword_100028550;
      __int16 v27 = 2080;
      v28 = "setLink";
      __int16 v29 = 1024;
      int v30 = 394;
      __int16 v31 = 1024;
      int v32 = v22;
      __int16 v33 = 1024;
      int v34 = v23;
      __int16 v8 = "ixl:(%s): %s(%d): Error set link config %d, aq error: %d\n";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, buf, 0x28u);
    }
  }
}

uint64_t sub_100002BE4(uint64_t a1)
{
  uint64_t v2 = a1 + 33680;
  uint64_t v3 = a1 + 33616;
  unsigned int v4 = *(unsigned __int16 *)(a1 + 34508);
  if (v4 == 4)
  {
    if (*(unsigned __int16 *)(a1 + 34510) >= 0x21u)
    {
LABEL_8:
      *(unsigned char *)uint64_t v2 = 1;
      i40e_get_link_status(v3, (unsigned char *)(a1 + 35488));
      uint64_t v5 = 0;
      if (*(_DWORD *)(v2 + 1816) == -1) {
        *(_DWORD *)(v2 + 1816) = *(_DWORD *)(v2 + 104);
      }
      return v5;
    }
  }
  else if (v4 > 3)
  {
    goto LABEL_8;
  }
  IODelay(0x124F8uLL);
  if (!i40e_aq_set_link_restart_an(v3, 1, 0)) {
    goto LABEL_8;
  }
  uint64_t v5 = 3758097098;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(_DWORD *)(v2 + 844);
    int v8 = 136315906;
    uint64_t v9 = qword_100028550;
    __int16 v10 = 2080;
    int v11 = "getLinkStatus";
    __int16 v12 = 1024;
    int v13 = 404;
    __int16 v14 = 1024;
    int v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): link restart failed, aq_err=%d\n", (uint8_t *)&v8, 0x22u);
  }
  return v5;
}

uint64_t sub_100002D34(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a1 + 312 * a2;
  unsigned int v3 = *(_DWORD *)(v2 + 184);
  if (v3 == atomic_load_explicit((atomic_uint *volatile)(v2 + 188), memory_order_acquire)) {
    return 0;
  }
  uint64_t v4 = v2 + 56;
  int v5 = *(_DWORD *)(*(void *)(v2 + 56) + 0x2000);
  if (v3 == v5) {
    return 0;
  }
  do
  {
    uint64_t v7 = *(void *)(*(void *)(v4 + 264) + 8 * v3);
    if (v7)
    {
      int v8 = *(IODataQueueDispatchSource **)(v4 + 288);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 0x40000000;
      v9[2] = sub_100002FAC;
      v9[3] = &unk_1000242F8;
      v9[4] = v7;
      BOOL sendDataAvailable = 0;
      if (IODataQueueDispatchSource::EnqueueWithCoalesce(v8, 0x68u, &sendDataAvailable, v9)) {
        sub_10001C954();
      }
    }
    unsigned int v3 = (v3 + 1) & 0x1FF;
  }
  while (v3 != v5);
  *(_DWORD *)(v4 + 128) = v5;
  return 1;
}

void sub_100002E44(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a1 + 312 * a2;
  unsigned int v3 = *(_DWORD *)(v2 + 188);
  memset(v20, 0, 512);
  int v4 = *(_DWORD *)(v2 + 184) + ~v3;
  if ((v4 & 0x1FF) != 0)
  {
    uint64_t v7 = *(void *)(a1 + 312 * a2 + 352);
    unsigned int v8 = (*(uint64_t (**)(uint64_t, _OWORD *, void))(*(void *)v7 + 104))(v7, v20, v4 & 0x1FF);
    if (v8)
    {
      uint64_t v9 = v8 - 1;
      __int16 v10 = (uint64_t *)v20;
      uint64_t v11 = v8;
      do
      {
        uint64_t v12 = *v10++;
        uint64_t v13 = *(void *)(v12 + 48);
        *(void *)(*(void *)(v2 + 320) + 8 * v3) = v13 + 8;
        uint64_t v14 = *(void *)(v13 + 24);
        uint64_t v16 = v13 + 72;
        uint64_t v15 = *(unsigned int *)(v13 + 72);
        uint64_t v17 = v14 + *(unsigned int *)(v16 + 4);
        if (v9) {
          uint64_t v18 = 80;
        }
        else {
          uint64_t v18 = 112;
        }
        int v19 = (void *)(*(void *)(v2 + 56) + 16 * v3);
        void *v19 = v17;
        v19[1] = v18 | (v15 << 34);
        unsigned int v3 = (v3 + 1) & 0x1FF;
        --v9;
        --v11;
      }
      while (v11);
      atomic_store(v3, (unsigned int *)(v2 + 188));
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(**(IOPCIDevice ***)(a1 + 24), 0, 4 * a2 + 1081344, v3);
    }
  }
}

uint64_t sub_100002FAC(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(*(void *)(result + 32) + 40);
  return result;
}

void sub_100002FBC(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 33616), 0, (4 * *(_DWORD *)(a1 + 34212) + 557484), &readData);
  __dmb(1u);
  uint32_t v4 = readData;
  sub_100003078(a1);
  sub_100003128(a1, &v4, 1);
  int v2 = 9;
  do
  {
    sub_100003288(a1, &v4);
    IODelay(4uLL);
    sub_100003354(a1, &v4);
    IODelay(5uLL);
    --v2;
  }
  while (v2);
  sub_100003078(a1);
  sub_1000033DC(a1);
}

void sub_100003078(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 33616), 0, (4 * *(_DWORD *)(a1 + 34212) + 557484), &readData);
  __dmb(1u);
  uint32_t v3 = readData;
  sub_100003128(a1, &v3, 1);
  sub_100003288(a1, &v3);
  IODelay(5uLL);
  sub_100003128(a1, &v3, 0);
  IODelay(4uLL);
  sub_100003354(a1, &v3);
  IODelay(5uLL);
}

uint64_t sub_100003128(uint64_t a1, uint32_t *a2, int a3)
{
  uint64_t v5 = a1 + 33616;
  if (a3) {
    int v6 = 1024;
  }
  else {
    int v6 = 0;
  }
  *a2 = *a2 & 0xFFFFF3FF | v6;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 33616), 0, (4 * *(_DWORD *)(a1 + 34212) + 557484), *a2);
  uint32_t v9 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v5, 0, 0xB612CuLL, &v9);
  __dmb(1u);
  IODelay(3uLL);
  uint32_t v9 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v5, 0, (4 * *(_DWORD *)(v5 + 596) + 557484), &v9);
  uint64_t result = 0;
  __dmb(1u);
  __int16 v8 = v9;
  *a2 = v9;
  if (a3 != (unsigned __int16)(v8 & 0x1000) >> 12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v9 = 136315906;
      uint64_t v10 = qword_100028550;
      __int16 v11 = 2080;
      uint64_t v12 = "i2cSetData";
      __int16 v13 = 1024;
      int v14 = 239;
      __int16 v15 = 1024;
      int v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Error - I2C data was not set to %X.", (uint8_t *)&v9, 0x22u);
    }
    return 4294967293;
  }
  return result;
}

void sub_100003288(uint64_t a1, uint32_t *a2)
{
  uint64_t v3 = a1 + 33616;
  int v4 = 499;
  do
  {
    int v5 = v4;
    *a2 = *a2 & 0xFFFFDDFF | 0x200;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)v3, 0, (4 * *(_DWORD *)(v3 + 596) + 557484), *a2);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v3, 0, 0xB612CuLL, &readData);
    __dmb(1u);
    IODelay(1uLL);
    uint32_t v6 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v3, 0, (4 * *(_DWORD *)(v3 + 596) + 557484), &v6);
    __dmb(1u);
    if ((v6 & 0x4000) != 0) {
      break;
    }
    int v4 = v5 - 1;
  }
  while (v5);
}

void sub_100003354(uint64_t a1, uint32_t *a2)
{
  int v2 = (IOPCIDevice **)(a1 + 33616);
  *a2 &= 0xFFFFDDFF;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 33616), 0, (4 * *(_DWORD *)(a1 + 34212) + 557484), *a2);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*v2, 0, 0xB612CuLL, &readData);
  __dmb(1u);
  IODelay(1uLL);
}

void sub_1000033DC(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 33616), 0, (4 * *(_DWORD *)(a1 + 34212) + 557484), &readData);
  __dmb(1u);
  uint32_t v3 = readData;
  sub_100003128(a1, &v3, 0);
  sub_100003288(a1, &v3);
  IODelay(4uLL);
  sub_100003128(a1, &v3, 1);
  IODelay(5uLL);
}

uint64_t sub_100003478(uint64_t a1)
{
  uint64_t v2 = a1 + 33616;
  uint32_t v7 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 33616), 0, (4 * *(_DWORD *)(a1 + 34212) + 557484), &v7);
  __dmb(1u);
  uint32_t v13 = v7;
  sub_100003288(a1, &v13);
  IODelay(4uLL);
  uint32_t v7 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v2, 0, (4 * *(_DWORD *)(v2 + 596) + 557484), &v7);
  __dmb(1u);
  uint32_t v3 = v7 | 0x800;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)v2, 0, (4 * *(_DWORD *)(v2 + 596) + 557484), v3);
  uint32_t v7 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v2, 0, 0xB612CuLL, &v7);
  __dmb(1u);
  int v4 = 10;
  do
  {
    uint32_t v7 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v2, 0, (4 * *(_DWORD *)(v2 + 596) + 557484), &v7);
    __dmb(1u);
    uint32_t v5 = v7;
    IODelay(1uLL);
    if ((v5 & 0x1000) == 0)
    {
      uint32_t v13 = v5;
      sub_100003354(a1, &v13);
      IODelay(5uLL);
      return 0;
    }
    --v4;
  }
  while (v4);
  uint32_t v13 = v5;
  sub_100003354(a1, &v13);
  IODelay(5uLL);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v7 = 136315650;
    uint64_t v8 = qword_100028550;
    __int16 v9 = 2080;
    uint64_t v10 = "i2cGetAck";
    __int16 v11 = 1024;
    int v12 = 120;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): I2C ack was not received.", (uint8_t *)&v7, 0x1Cu);
  }
  return 4294967293;
}

uint64_t sub_10000364C(uint64_t a1, int a2)
{
  uint32_t v5 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 33616), 0, (4 * *(_DWORD *)(a1 + 34212) + 557484), &v5);
  __dmb(1u);
  uint32_t v13 = v5;
  if (sub_100003128(a1, &v13, a2))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v5 = 136315906;
      uint64_t v6 = qword_100028550;
      __int16 v7 = 2080;
      uint64_t v8 = "i2cClockOutBit";
      __int16 v9 = 1024;
      int v10 = 143;
      __int16 v11 = 1024;
      int v12 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): I2C data was not set to %#x", (uint8_t *)&v5, 0x22u);
    }
    return 4294967293;
  }
  else
  {
    sub_100003288(a1, &v13);
    IODelay(4uLL);
    sub_100003354(a1, &v13);
    IODelay(5uLL);
    return 0;
  }
}

uint64_t sub_100003778(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = a1 + 33616;
  int v5 = 7;
  do
  {
    uint64_t v6 = sub_10000364C(a1, (a2 >> v5) & 1);
    if (v6) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v5 == 0;
    }
    --v5;
  }
  while (!v7);
  uint64_t v8 = v6;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v4, 0, (4 * *(_DWORD *)(v4 + 596) + 557484), &readData);
  __dmb(1u);
  uint32_t v9 = readData & 0xFFFFF3FF | 0x400;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)v4, 0, (4 * *(_DWORD *)(v4 + 596) + 557484), v9);
  uint32_t v11 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v4, 0, 0xB612CuLL, &v11);
  __dmb(1u);
  return v8;
}

uint64_t sub_100003854(uint64_t a1, int a2, unsigned int a3, unsigned char *a4)
{
  uint64_t v6 = a1 + 33616;
  *a4 = 0;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 33616), 0, (4 * *(_DWORD *)(a1 + 34212) + 557536), (a2 << 16) & 0xF8FFFFFF | (((a3 >> 1) & 7) << 24) | 0x8000000);
  uint64_t v7 = sub_10000397C(a1, *(unsigned __int8 *)(v6 + 596));
  uint32_t v9 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v6, 0, (4 * *(_DWORD *)(v6 + 596) + 557536), &v9);
  __dmb(1u);
  *a4 = v9;
  if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v9 = 136315650;
    uint64_t v10 = qword_100028550;
    __int16 v11 = 2080;
    int v12 = "i2cReadByte_reg";
    __int16 v13 = 1024;
    int v14 = 426;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): I2C byte read error", (uint8_t *)&v9, 0x1Cu);
  }
  return v7;
}

uint64_t sub_10000397C(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = (IOPCIDevice **)(a1 + 33616);
  uint64_t v3 = 4 * a2 + 557536;
  int v4 = 101;
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*v2, 0, v3, &readData);
    __dmb(1u);
    if ((readData & 0x20000000) != 0) {
      break;
    }
    IODelay(0xAuLL);
    if (!--v4) {
      return 0;
    }
  }
  if (v4 == 1) {
    return 4294967259;
  }
  else {
    return 0;
  }
}

uint64_t sub_100003A08(uint64_t a1, int a2, unsigned int a3, int a4)
{
  uint64_t v8 = a1 + 33616;
  unsigned __int8 v19 = 0;
  sub_100003854(a1, (a2 + 1), a3, &v19);
  int v9 = a4 | (v19 << 8);
  uint32_t v13 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v8, 0, (4 * *(_DWORD *)(v8 + 596) + 557536), &v13);
  __dmb(1u);
  uint32_t v10 = v13 & 0xF0000000 | (((a3 >> 1) & 7) << 24) | (a2 << 16) | v9;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)v8, 0, (4 * *(_DWORD *)(v8 + 596) + 557536), v10);
  uint64_t v11 = sub_10000397C(a1, *(unsigned __int8 *)(v8 + 596));
  if (v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v13 = 136315650;
    uint64_t v14 = qword_100028550;
    __int16 v15 = 2080;
    int v16 = "i2cWriteByte_reg";
    __int16 v17 = 1024;
    int v18 = 458;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): I2C byte write error", (uint8_t *)&v13, 0x1Cu);
  }
  return v11;
}

uint64_t sub_100003B58(uint64_t a1, int a2, char a3, unsigned char *a4)
{
  int v22 = 0;
  uint64_t v6 = a1 + 33616;
  uint64_t phy_register_ext = i40e_aq_get_phy_register_ext(a1 + 33616, 2, a3, 0, 0, 0, a2, &v22, 0);
  if (phy_register_ext)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = qword_100028550;
      int v9 = i40e_stat_str(v6, phy_register_ext);
      uint32_t v10 = i40e_aq_str(v6, *(_DWORD *)(a1 + 34524));
      *(_DWORD *)buf = 136316162;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      __int16 v15 = "i2cReadByte_aq";
      __int16 v16 = 1024;
      int v17 = 489;
      __int16 v18 = 2080;
      unsigned __int8 v19 = v9;
      __int16 v20 = 2080;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): I2C byte read status %s, error %s", buf, 0x30u);
    }
  }
  else
  {
    *a4 = v22;
  }
  return phy_register_ext;
}

uint64_t sub_100003C84(uint64_t a1, int a2, char a3, int a4)
{
  uint64_t v5 = a1 + 33616;
  uint64_t v6 = i40e_aq_set_phy_register_ext(a1 + 33616, 2, a3, 0, 0, 0, a2, a4, 0);
  if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = qword_100028550;
    uint64_t v8 = i40e_stat_str(v5, v6);
    int v9 = i40e_aq_str(v5, *(_DWORD *)(a1 + 34524));
    *(_DWORD *)buf = 136316162;
    uint64_t v12 = v7;
    __int16 v13 = 2080;
    __int16 v14 = "i2cWriteByte_aq";
    __int16 v15 = 1024;
    int v16 = 507;
    __int16 v17 = 2080;
    __int16 v18 = v8;
    __int16 v19 = 2080;
    __int16 v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): I2C byte write status %s, error %s", buf, 0x30u);
  }
  return v6;
}

uint64_t sub_100003D9C(uint64_t a1, unsigned int a2, char a3, unsigned char *a4)
{
  switch(*(_DWORD *)(a1 + 35504))
  {
    case 0:
      if ((*(unsigned char *)(a1 + 35304) & 4) != 0) {
        goto LABEL_6;
      }
      goto LABEL_3;
    case 1:
      uint64_t result = sub_100003ED4(a1, a2, a3, a4);
      break;
    case 2:
LABEL_3:
      uint64_t result = sub_100003854(a1, a2, a3, a4);
      break;
    case 3:
LABEL_6:
      uint64_t result = sub_100003B58(a1, a2, a3, a4);
      break;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315650;
        uint64_t v6 = qword_100028550;
        __int16 v7 = 2080;
        uint64_t v8 = "i2cReadByte";
        __int16 v9 = 1024;
        int v10 = 532;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Error setting I2C access functions", (uint8_t *)&v5, 0x1Cu);
      }
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_100003ED4(uint64_t a1, unsigned int a2, unsigned int a3, unsigned char *a4)
{
  uint64_t v7 = a1 + 33616;
  *a4 = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 33616), 0, (4 * *(_DWORD *)(a1 + 34212) + 557484), &readData);
  __dmb(1u);
  uint32_t v8 = readData | 0x100;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)v7, 0, (4 * *(_DWORD *)(v7 + 596) + 557484), v8);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v7, 0, 0xB612CuLL, &readData);
  int v9 = 0;
  __dmb(1u);
  while (1)
  {
    sub_100003078(a1);
    uint64_t v10 = sub_100003778(a1, a3);
    if (v10)
    {
      uint64_t v11 = v10;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      uint32_t readData = 136315650;
      uint64_t v22 = qword_100028550;
      __int16 v23 = 2080;
      long long v24 = "i2cReadByte_bb";
      __int16 v25 = 1024;
      int v26 = 285;
      uint64_t v12 = "ixl:(%s): %s(%d): dev_addr clock out error";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&readData, 0x1Cu);
      goto LABEL_15;
    }
    uint64_t v13 = sub_100003478(a1);
    if (v13)
    {
      uint64_t v11 = v13;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      uint32_t readData = 136315650;
      uint64_t v22 = qword_100028550;
      __int16 v23 = 2080;
      long long v24 = "i2cReadByte_bb";
      __int16 v25 = 1024;
      int v26 = 291;
      uint64_t v12 = "ixl:(%s): %s(%d): dev_addr i2c ack error";
      goto LABEL_14;
    }
    uint64_t v14 = sub_100003778(a1, a2);
    if (v14)
    {
      uint64_t v11 = v14;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      uint32_t readData = 136315650;
      uint64_t v22 = qword_100028550;
      __int16 v23 = 2080;
      long long v24 = "i2cReadByte_bb";
      __int16 v25 = 1024;
      int v26 = 297;
      uint64_t v12 = "ixl:(%s): %s(%d): byte_offset clock out error";
      goto LABEL_14;
    }
    uint64_t v15 = sub_100003478(a1);
    if (v15)
    {
      uint64_t v11 = v15;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      uint32_t readData = 136315650;
      uint64_t v22 = qword_100028550;
      __int16 v23 = 2080;
      long long v24 = "i2cReadByte_bb";
      __int16 v25 = 1024;
      int v26 = 303;
      uint64_t v12 = "ixl:(%s): %s(%d): byte_offset i2c ack error";
      goto LABEL_14;
    }
    sub_100003078(a1);
    uint64_t v11 = sub_100003778(a1, a3 | 1);
    if (!v11)
    {
      uint64_t v11 = sub_100003478(a1);
      if (!v11)
      {
        for (int i = 7; i != -1; --i)
        {
          LOBYTE(readData) = 0;
          sub_1000046C0(a1, (BOOL *)&readData);
          *a4 |= (_BYTE)readData << i;
        }
        uint64_t v11 = sub_10000364C(a1, 1);
        if (!v11)
        {
          sub_1000033DC(a1);
          goto LABEL_26;
        }
      }
    }
LABEL_15:
    sub_100002FBC(a1);
    IODelay(0x186A0uLL);
    BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v9 == 9) {
      break;
    }
    ++v9;
    if (v16)
    {
      uint32_t readData = 136315650;
      uint64_t v22 = qword_100028550;
      __int16 v23 = 2080;
      long long v24 = "i2cReadByte_bb";
      __int16 v25 = 1024;
      int v26 = 329;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): I2C byte read error - Retrying", (uint8_t *)&readData, 0x1Cu);
    }
  }
  if (v16)
  {
    uint32_t readData = 136315650;
    uint64_t v22 = qword_100028550;
    __int16 v23 = 2080;
    long long v24 = "i2cReadByte_bb";
    __int16 v25 = 1024;
    int v26 = 331;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): I2C byte read error", (uint8_t *)&readData, 0x1Cu);
  }
LABEL_26:
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v7, 0, (4 * *(_DWORD *)(v7 + 596) + 557484), &readData);
  __dmb(1u);
  uint32_t v18 = readData & 0xFFFFFEFF;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)v7, 0, (4 * *(_DWORD *)(v7 + 596) + 557484), v18);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v7, 0, 0xB612CuLL, &readData);
  __dmb(1u);
  return v11;
}

uint64_t sub_100004364(uint64_t a1, unsigned int a2, char a3, unsigned int a4)
{
  switch(*(_DWORD *)(a1 + 35504))
  {
    case 0:
      if ((*(unsigned char *)(a1 + 35304) & 4) != 0) {
        goto LABEL_6;
      }
      goto LABEL_3;
    case 1:
      uint64_t result = sub_10000449C(a1, a2, a3, a4);
      break;
    case 2:
LABEL_3:
      uint64_t result = sub_100003A08(a1, a2, a3, a4);
      break;
    case 3:
LABEL_6:
      uint64_t result = sub_100003C84(a1, a2, a3, a4);
      break;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315650;
        uint64_t v6 = qword_100028550;
        __int16 v7 = 2080;
        uint32_t v8 = "i2cWriteByte";
        __int16 v9 = 1024;
        int v10 = 557;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Error setting I2C access functions", (uint8_t *)&v5, 0x1Cu);
      }
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_10000449C(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v8 = a1 + 33616;
  uint32_t v13 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 33616), 0, (4 * *(_DWORD *)(a1 + 34212) + 557484), &v13);
  __dmb(1u);
  uint32_t v9 = v13 | 0x100;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)v8, 0, (4 * *(_DWORD *)(v8 + 596) + 557484), v9);
  uint32_t v13 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v8, 0, 0xB612CuLL, &v13);
  __dmb(1u);
  sub_100003078(a1);
  uint64_t v10 = sub_100003778(a1, a3);
  if (v10
    || (uint64_t v10 = sub_100003478(a1), v10)
    || (uint64_t v10 = sub_100003778(a1, a2), v10)
    || (uint64_t v10 = sub_100003478(a1), v10)
    || (uint64_t v10 = sub_100003778(a1, a4), v10)
    || (uint64_t v10 = sub_100003478(a1), v10))
  {
    sub_100002FBC(a1);
    IODelay(0x186A0uLL);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v13 = 136315650;
      uint64_t v14 = qword_100028550;
      __int16 v15 = 2080;
      BOOL v16 = "i2cWriteByte_bb";
      __int16 v17 = 1024;
      int v18 = 392;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): I2C byte write error", (uint8_t *)&v13, 0x1Cu);
    }
  }
  else
  {
    sub_1000033DC(a1);
  }
  uint32_t v13 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v8, 0, (4 * *(_DWORD *)(v8 + 596) + 557484), &v13);
  __dmb(1u);
  uint32_t v11 = v13 & 0xFFFFFEFF;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)v8, 0, (4 * *(_DWORD *)(v8 + 596) + 557484), v11);
  uint32_t v13 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v8, 0, 0xB612CuLL, &v13);
  __dmb(1u);
  return v10;
}

uint64_t sub_1000046C0(uint64_t a1, BOOL *a2)
{
  uint64_t v4 = a1 + 33616;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 33616), 0, (4 * *(_DWORD *)(a1 + 34212) + 557484), &readData);
  __dmb(1u);
  sub_100003288(a1, &readData);
  IODelay(4uLL);
  uint32_t v7 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v4, 0, (4 * *(_DWORD *)(v4 + 596) + 557484), &v7);
  __dmb(1u);
  uint32_t v5 = v7 | 0x800;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)v4, 0, (4 * *(_DWORD *)(v4 + 596) + 557484), v5);
  uint32_t v7 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v4, 0, 0xB612CuLL, &v7);
  __dmb(1u);
  uint32_t v7 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v4, 0, (4 * *(_DWORD *)(v4 + 596) + 557484), &v7);
  __dmb(1u);
  uint32_t readData = v7;
  *a2 = (v7 & 0x1000) != 0;
  sub_100003354(a1, &readData);
  IODelay(5uLL);
  return 0;
}

void DriverKit_AppleEthernetIXL::init(DriverKit_AppleEthernetIXL *this)
{
}

void non-virtual thunk to'DriverKit_AppleEthernetIXL::init(DriverKit_AppleEthernetIXL *this)
{
}

void DriverKit_AppleEthernetIXL::free(IOService *this)
{
  uint64_t v2 = this[1].OSObject::OSMetaClassBase::__vftable;
  if (v2)
  {
    IOFree(v2, 0x8AB8uLL);
    this[1].OSObject::OSMetaClassBase::__vftable = 0;
  }
  IOService::free(this);
}

void non-virtual thunk to'DriverKit_AppleEthernetIXL::free(DriverKit_AppleEthernetIXL *this)
{
}

uint64_t DriverKit_AppleEthernetIXL::Start_Impl(DriverKit_AppleEthernetIXL *this, IOService *anObject)
{
  if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)interruptType = 136315650;
    *(void *)&interruptType[4] = qword_100028550;
    __int16 v16 = 2080;
    __int16 v17 = "Start_Impl";
    __int16 v18 = 1024;
    int v19 = 28;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): \n", interruptType, 0x1Cu);
  }
  uint64_t v4 = 3758097084;
  uint32_t v5 = (IOService *)OSMetaClassBase::safeMetaCast(anObject, gIOPCIDeviceMetaClass);
  if (!v5) {
    return 3758097084;
  }
  uint64_t v6 = (IOPCIDevice *)v5;
  *(void *)(*((void *)this + 6) + 35360) = this;
  *(void *)(*((void *)this + 6) + 35368) = v5;
  uint64_t v7 = sub_100005F50(*((void *)this + 6), v5);
  if (!v7)
  {
    if (IOService::Start((IOService *)this, anObject, (OSDispatchMethod)&IOService::_Dispatch)) {
      sub_10001CC98();
    }
    if (OSObject::CopyDispatchQueue((OSObject *)this, "Default", (IODispatchQueue **)(*((void *)this + 6) + 35376), 0))
    {
      sub_10001CC6C();
    }
    if (IODispatchQueue::Create("interrupt", 0, 0, (IODispatchQueue **)(*((void *)this + 6) + 35384))) {
      sub_10001CC40();
    }
    if (OSObject::SetDispatchQueue((OSObject *)this, "interrupt", *(IODispatchQueue **)(*((void *)this + 6) + 35384), 0))
    {
      sub_10001CC14();
    }
    action = 0;
    *(void *)interruptType = 0;
    IOPCIDevice::ConfigureInterrupts(v6, 0x20000u, 2u, 2u, 0, 0);
    if (IOInterruptDispatchSource::GetInterruptType(v6, 0, (uint64_t *)interruptType)) {
      sub_10001CBE8();
    }
    uint64_t v8 = *(void *)interruptType & 0x30000;
    if (IOInterruptDispatchSource::Create(v6, (*(void *)interruptType & 0x30000) == 0, *(IODispatchQueue **)(*((void *)this + 6) + 35384), (IOInterruptDispatchSource **)(*((void *)this + 6) + 35392)))
    {
      sub_10001CBBC();
    }
    if (DriverKit_AppleEthernetIXL::CreateActionOtherInterrupt((OSObject *)this, 8uLL, &action)) {
      sub_10001CB90();
    }
    if (IOInterruptDispatchSource::SetHandler(*(IOInterruptDispatchSource **)(*((void *)this + 6) + 35392), action, 0))
    {
      sub_10001CB64();
    }
    if (IODispatchSource::SetEnable(*(IODispatchSource **)(*((void *)this + 6) + 35392), 1, 0)) {
      sub_10001CB38();
    }
    if (v8) {
      uint32_t v9 = 1;
    }
    else {
      uint32_t v9 = 2;
    }
    if (IOInterruptDispatchSource::Create(v6, v9, *(IODispatchQueue **)(*((void *)this + 6) + 35384), (IOInterruptDispatchSource **)(*((void *)this + 6) + 35400)))
    {
      sub_10001CB0C();
    }
    if (DriverKit_AppleEthernetIXL::CreateActionQueueInterrupt((OSObject *)this, 8uLL, &action)) {
      sub_10001CAE0();
    }
    if (IOInterruptDispatchSource::SetHandler(*(IOInterruptDispatchSource **)(*((void *)this + 6) + 35400), action, 0))
    {
      sub_10001CAB4();
    }
    if (IODispatchSource::SetEnable(*(IODispatchSource **)(*((void *)this + 6) + 35400), 1, 0)) {
      sub_10001CA88();
    }
    if (IOPCIDevice::Open(v6, (IOService *)this, 0)) {
      sub_10001CA5C();
    }
    uint8_t readData = 0;
    IOPCIDevice::ConfigurationRead8(v6, 4uLL, &readData);
    IOPCIDevice::ConfigurationWrite8(v6, 4uLL, readData | 2);
    uint64_t result = 0;
    if (IOService::Create((IOService *)this, (IOService *)this, "NetIf", &result, 0)) {
      sub_10001CA30();
    }
    uint64_t v10 = (OSObject *)OSMetaClassBase::safeMetaCast(result, (const OSMetaClass *)gDriverKit_AppleEthernetIXL_NetIfMetaClass);
    uint32_t v11 = (OSObject **)*((void *)this + 6);
    v10[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)v11;
    *uint32_t v11 = v10;
    if (OSObject::SetDispatchQueue(v10, "Default", *(IODispatchQueue **)(*((void *)this + 6) + 35376), 0)) {
      sub_10001CA04();
    }
    if (OSObject::SetDispatchQueue(v10, "interrupt", *(IODispatchQueue **)(*((void *)this + 6) + 35384), 0)) {
      sub_10001C9D8();
    }
    if (sub_1000062B0(*((void *)this + 6)))
    {
      IOService::Stop((IOService *)this, v6, 0);
    }
    else
    {
      if (IOService::JoinPMTree((IOService *)this, 0)) {
        sub_10001C9AC();
      }
      if (IOService::JoinPMTree(result, 0)) {
        sub_10001C980();
      }
      return 0;
    }
    return v4;
  }
  return v7;
}

uint64_t DriverKit_AppleEthernetIXL::Stop_Impl(IOService *this, IOService *provider)
{
  if ((dword_100028548 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    uint64_t v12 = qword_100028550;
    __int16 v13 = 2080;
    uint64_t v14 = "Stop_Impl";
    __int16 v15 = 1024;
    int v16 = 92;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): \n", (uint8_t *)&v11, 0x1Cu);
  }
  LODWORD(this[1].OSObject::OSMetaClassBase::__vftable[632].isEqualTo) = 3;
  uint64_t v4 = this[1].OSObject::OSMetaClassBase::__vftable;
  if (v4->getMetaClass)
  {
    IOService::Terminate((IOService *)v4->getMetaClass, 0, 0);
    uint64_t v4 = this[1].OSObject::OSMetaClassBase::__vftable;
    if (v4->getMetaClass)
    {
      (*(void (**)(const OSMetaClass *(__cdecl *)(const OSMetaClassBase *__hidden)))(*(void *)v4->getMetaClass
                                                                                              + 16))(v4->getMetaClass);
      this[1].getMetaClass = 0;
      uint64_t v4 = this[1].OSObject::OSMetaClassBase::__vftable;
    }
  }
  getMetaClass = v4[632].getMetaClass;
  if (getMetaClass)
  {
    (*(void (**)(const OSMetaClass *(__cdecl *)(const OSMetaClassBase *__hidden)))(*(void *)getMetaClass
                                                                                            + 16))(getMetaClass);
    this[1].OSObject::OSMetaClassBase::__vftable[632].getMetaClass = 0;
    uint64_t v4 = this[1].OSObject::OSMetaClassBase::__vftable;
  }
  retain = v4[632].retain;
  if (retain)
  {
    (*(void (**)(void (__cdecl *)(const OSObject *__hidden)))(*(void *)retain + 16))(retain);
    this[1].OSObject::OSMetaClassBase::__vftable[632].retain = 0;
    uint64_t v4 = this[1].OSObject::OSMetaClassBase::__vftable;
  }
  release = v4[632].release;
  if (release)
  {
    (*(void (**)(void (__cdecl *)(const OSObject *__hidden)))(*(void *)release + 16))(release);
    this[1].OSObject::OSMetaClassBase::__vftable[632].release = 0;
    uint64_t v4 = this[1].OSObject::OSMetaClassBase::__vftable;
  }
  free = v4[631].free;
  if (free)
  {
    (*(void (**)(void (__cdecl *)(IOService *__hidden)))(*(void *)free + 16))(free);
    this[1].OSObject::OSMetaClassBase::__vftable[631].free = 0;
    uint64_t v4 = this[1].OSObject::OSMetaClassBase::__vftable;
  }
  Dispatch = (IOPCIDevice *)v4[631].Dispatch;
  if (Dispatch)
  {
    LOBYTE(v11) = 0;
    IOPCIDevice::ConfigurationRead8(Dispatch, 4uLL, (uint8_t *)&v11);
    IOPCIDevice::ConfigurationWrite8((IOPCIDevice *)this[1].OSObject::OSMetaClassBase::__vftable[631].Dispatch, 4uLL, v11 & 0xFB);
    IOPCIDevice::Close((IOPCIDevice *)this[1].OSObject::OSMetaClassBase::__vftable[631].Dispatch, this, 0);
  }
  return IOService::Stop(this, provider, (OSDispatchMethod)&IOService::_Dispatch);
}

uint64_t DriverKit_AppleEthernetIXL::SetPowerState_Impl(DriverKit_AppleEthernetIXL *this, uint32_t a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315906;
    uint64_t v8 = qword_100028550;
    __int16 v9 = 2080;
    uint64_t v10 = "SetPowerState_Impl";
    __int16 v11 = 1024;
    int v12 = 114;
    __int16 v13 = 1024;
    uint32_t v14 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): powerState=%x\n", (uint8_t *)&v7, 0x22u);
  }
  uint64_t v4 = (_DWORD *)(*((void *)this + 6) + 35416);
  if (a2)
  {
    if (*v4 != 1)
    {
      BOOL v5 = *v4 == 0;
      *uint64_t v4 = 1;
      LOBYTE(v7) = 0;
      IOPCIDevice::ConfigurationRead8(*(IOPCIDevice **)(*((void *)this + 6) + 35368), 4uLL, (uint8_t *)&v7);
      IOPCIDevice::ConfigurationWrite8(*(IOPCIDevice **)(*((void *)this + 6) + 35368), 4uLL, v7 | 4);
      if (sub_1000067A8(*((void *)this + 6), v5)) {
        sub_10001CCC4();
      }
    }
  }
  else
  {
    *uint64_t v4 = 2;
    sub_100007CF0(*((void *)this + 6));
    LOBYTE(v7) = 0;
    IOPCIDevice::ConfigurationRead8(*(IOPCIDevice **)(*((void *)this + 6) + 35368), 4uLL, (uint8_t *)&v7);
    IOPCIDevice::ConfigurationWrite8(*(IOPCIDevice **)(*((void *)this + 6) + 35368), 4uLL, v7 & 0xFB);
  }
  return IOService::SetPowerState((IOService *)this, a2, (OSDispatchMethod)&IOService::_Dispatch);
}

void DriverKit_AppleEthernetIXL::LegacyInterrupt_Impl(DriverKit_AppleEthernetIXL *this, OSAction *a2)
{
}

void DriverKit_AppleEthernetIXL::OtherInterrupt_Impl(DriverKit_AppleEthernetIXL *this, OSAction *a2)
{
}

void DriverKit_AppleEthernetIXL::QueueInterrupt_Impl(DriverKit_AppleEthernetIXL *this, OSAction *a2)
{
}

uint64_t DriverKit_AppleEthernetIXL_NetIf::SetInterfaceEnable_Impl(DriverKit_AppleEthernetIXL_NetIf *this, int a2)
{
  if ((dword_100028548 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v16 = qword_100028550;
    if (a2) {
      int v7 = "enable";
    }
    else {
      int v7 = "disable";
    }
    __int16 v17 = 2080;
    __int16 v18 = "SetInterfaceEnable_Impl";
    __int16 v19 = 1024;
    int v20 = 158;
    __int16 v21 = 2080;
    uint64_t v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): <== (%s)\n", buf, 0x26u);
  }
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2000000000;
  int v14 = -1;
  if (*(_DWORD *)(*(void *)(*((void *)this + 8) + 32) + 35416) == 1)
  {
    uint64_t v4 = *(IODispatchQueue **)(*(void *)(*((void *)this + 8) + 32) + 35384);
    block[0] = _NSConcreteStackBlock;
    block[1] = 1107296256;
    block[2] = sub_100005390;
    block[4] = &v11;
    block[5] = this;
    char v10 = a2;
    block[3] = &unk_100024318;
    IODispatchQueue::DispatchSync(v4, block);
  }
  if ((dword_100028548 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *((_DWORD *)v12 + 6);
    *(_DWORD *)buf = 136315906;
    uint64_t v16 = qword_100028550;
    __int16 v17 = 2080;
    __int16 v18 = "SetInterfaceEnable_Impl";
    __int16 v19 = 1024;
    int v20 = 169;
    __int16 v21 = 1024;
    LODWORD(v22) = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): ==> 0x%08x\n", buf, 0x22u);
  }
  uint64_t v5 = *((unsigned int *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t sub_100005390(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 40);
  if (*(unsigned char *)(result + 48))
  {
    uint64_t result = sub_10001B0D4(*(void *)(v2 + 64));
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = result;
  }
  if (*(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24)) {
    uint64_t result = sub_10001B23C(*(void *)(v2 + 64));
  }
  if (!*(unsigned char *)(v1 + 48)) {
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = 0;
  }
  return result;
}

void sub_1000053FC(uint64_t a1, uint64_t a2)
{
}

void sub_10000540C(uint64_t a1)
{
}

uint64_t DriverKit_AppleEthernetIXL_NetIf::SetPromiscuousModeEnable_Impl(DriverKit_AppleEthernetIXL_NetIf *this, int a2)
{
  return sub_10000A3B4(*((void *)this + 8), a2);
}

uint64_t DriverKit_AppleEthernetIXL_NetIf::SetAllMulticastModeEnable_Impl(DriverKit_AppleEthernetIXL_NetIf *this, int a2)
{
  if ((dword_100028548 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315906;
    uint64_t v7 = qword_100028550;
    if (a2) {
      uint64_t v5 = "enable";
    }
    else {
      uint64_t v5 = "disable";
    }
    __int16 v8 = 2080;
    __int16 v9 = "SetAllMulticastModeEnable_Impl";
    __int16 v10 = 1024;
    int v11 = 182;
    __int16 v12 = 2080;
    uint64_t v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): - %s\n", (uint8_t *)&v6, 0x26u);
  }
  return sub_10000A3C4(*((void *)this + 8), a2);
}

uint64_t DriverKit_AppleEthernetIXL_NetIf::setMulticastAddresses(DriverKit_AppleEthernetIXL_NetIf *this, const ether_addr *a2, int a3)
{
  return sub_10000A3D4(*((void *)this + 8), (uint64_t)a2, a3);
}

uint64_t non-virtual thunk to'DriverKit_AppleEthernetIXL_NetIf::setMulticastAddresses(DriverKit_AppleEthernetIXL_NetIf *this, const ether_addr *a2, int a3)
{
  return sub_10000A3D4(*((void *)this + 2), (uint64_t)a2, a3);
}

uint64_t DriverKit_AppleEthernetIXL_NetIf::SelectMediaType_Impl(DriverKit_AppleEthernetIXL_NetIf *this, int a2)
{
  if ((dword_100028548 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315906;
    uint64_t v5 = qword_100028550;
    __int16 v6 = 2080;
    uint64_t v7 = "SelectMediaType_Impl";
    __int16 v8 = 1024;
    int v9 = 195;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): type 0x%08x\n", (uint8_t *)&v4, 0x22u);
  }
  return 0;
}

void DriverKit_AppleEthernetIXL_NetIf::TxSubmit_Impl(DriverKit_AppleEthernetIXL_NetIf *this, OSAction *a2)
{
  uint64_t v2 = *((void *)this + 8);
  if (*(_DWORD *)(v2 + 16) != 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315650;
    uint64_t v5 = qword_100028550;
    __int16 v6 = 2080;
    uint64_t v7 = "TxSubmit_Impl";
    __int16 v8 = 1024;
    int v9 = 209;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): called with state != DEV_NET_STATE_ACTIVATED\n", (uint8_t *)&v4, 0x1Cu);
    uint64_t v2 = *((void *)this + 8);
  }
  if (*(_DWORD *)(*(void *)(v2 + 32) + 35416) == 1) {
    sub_100002E44(v2, 0);
  }
}

void DriverKit_AppleEthernetIXL_NetIf::RxSubmit_Impl(DriverKit_AppleEthernetIXL_NetIf *this, OSAction *a2)
{
  uint64_t v3 = *((void *)this + 8);
  if (*(_DWORD *)(v3 + 16) != 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315650;
    uint64_t v5 = qword_100028550;
    __int16 v6 = 2080;
    uint64_t v7 = "RxSubmit_Impl";
    __int16 v8 = 1024;
    int v9 = 217;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): called with state != DEV_NET_STATE_ACTIVATED\n", (uint8_t *)&v4, 0x1Cu);
    uint64_t v3 = *((void *)this + 8);
  }
  if (*(_DWORD *)(*(void *)(v3 + 32) + 35416) == 1 && sub_100010668(v3, 0) >= 0x10000) {
    IODataQueueDispatchSource::SendDataAvailable(*(IODataQueueDispatchSource **)(*((void *)this + 8) + 656));
  }
}

uint64_t DriverKit_AppleEthernetIXL_NetIf::GetMaxTransferUnit_Impl(DriverKit_AppleEthernetIXL_NetIf *this, unsigned int *a2)
{
  *a2 = 2034;
  return 0;
}

uint64_t DriverKit_AppleEthernetIXL_NetIf::GetHardwareAssists_Impl(DriverKit_AppleEthernetIXL_NetIf *this, unsigned int *a2)
{
  *a2 = 0x20000;
  return 0;
}

uint64_t DriverKit_AppleEthernetIXL_NetIf::SetWakeOnMagicPacketEnable_Impl(DriverKit_AppleEthernetIXL_NetIf *this, int a2)
{
  if ((dword_100028548 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315906;
    uint64_t v6 = qword_100028550;
    if (a2) {
      int v4 = "enable";
    }
    else {
      int v4 = "disable";
    }
    __int16 v7 = 2080;
    __int16 v8 = "SetWakeOnMagicPacketEnable_Impl";
    __int16 v9 = 1024;
    int v10 = 242;
    __int16 v11 = 2080;
    __int16 v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): - %s\n", (uint8_t *)&v5, 0x26u);
  }
  return 0;
}

uint64_t DriverKit_AppleEthernetIXL_NetIf::SetMTU_Impl(IOUserNetworkEthernet *this, uint32_t a2)
{
  return IOUserNetworkEthernet::SetMTU(this, a2, (OSDispatchMethod)&IOUserNetworkEthernet::_Dispatch);
}

uint64_t i40e_add_sd_table_entry(IOService **a1, uint64_t a2, unsigned int a3, int a4, uint64_t a5)
{
  uint64_t v5 = *(void *)(a2 + 56);
  if (v5)
  {
    if (*(_DWORD *)(a2 + 48) <= a3)
    {
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): %s\n", "i40e_add_sd_table_entry", 37, "i40e_add_sd_table_entry: bad sd_index\n");
      }
      return 4294967251;
    }
    else
    {
      uint64_t v9 = v5 + 80 * a3;
      if (*(unsigned char *)(v9 + 4))
      {
LABEL_4:
        uint64_t dma_mem = 0;
        if (*(_DWORD *)v9 == 2) {
          ++*(_DWORD *)(v5 + 80 * a3 + 60);
        }
        return dma_mem;
      }
      if (a4 == 1) {
        int v12 = 5;
      }
      else {
        int v12 = 7;
      }
      if (a4 == 1) {
        uint64_t v13 = 4096;
      }
      else {
        uint64_t v13 = a5;
      }
      uint64_t dma_mem = i40e_allocate_dma_mem(a1, (uint64_t)v17, v12, v13);
      if (!dma_mem)
      {
        if (a4 == 1) {
          i40e_allocate_virt_mem();
        }
        long long v15 = v17[0];
        long long v16 = v17[1];
        *(void *)(v5 + 80 * a3 + 48) = v18;
        *(_OWORD *)(v5 + 80 * a3 + 32) = v16;
        *(_OWORD *)(v5 + 80 * a3 + 16) = v15;
        *(_DWORD *)(v5 + 80 * a3 + 56) = a3;
        *(_DWORD *)(*(void *)(a2 + 56) + 80 * a3) = a4;
        ++*(_DWORD *)(a2 + 52);
        goto LABEL_4;
      }
    }
  }
  else
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): %s\n", "i40e_add_sd_table_entry", 31, "i40e_add_sd_table_entry: bad sd_entry\n");
    }
    return 4294967277;
  }
  return dma_mem;
}

uint64_t i40e_add_pd_table_entry(IOService **a1, uint64_t a2, unsigned int a3, unsigned char *a4)
{
  unsigned int v4 = a3 >> 9;
  if (a3 >> 9 >= *(_DWORD *)(a2 + 48))
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): %s\n", "i40e_add_pd_table_entry", 125, "i40e_add_pd_table_entry: bad pd_index\n");
    }
    return 4294967250;
  }
  else
  {
    uint64_t v5 = *(void *)(a2 + 56);
    if (*(_DWORD *)(v5 + 80 * v4) == 1)
    {
      uint64_t v7 = a3 & 0x1FF;
      uint64_t v8 = v5 + 80 * v4;
      uint64_t v9 = *(void *)(v8 + 48);
      uint64_t v10 = v9 + (v7 << 6);
      if (*(unsigned char *)(v10 + 61))
      {
LABEL_6:
        uint64_t result = 0;
        ++*(_DWORD *)(v10 + 52);
        return result;
      }
      __int16 v11 = a4;
      char v12 = 1;
      if (a4)
      {
LABEL_5:
        uint64_t v13 = v9 + (v7 << 6);
        *(unsigned char *)(v13 + 60) = v12;
        long long v14 = *(_OWORD *)v11;
        long long v15 = *((_OWORD *)v11 + 1);
        *(void *)(v10 + 40) = *((void *)v11 + 4);
        *(_OWORD *)(v10 + 24) = v15;
        *(_OWORD *)(v10 + 8) = v14;
        *(_DWORD *)(v10 + 48) = a3;
        *(_DWORD *)uint64_t v10 = 1;
        *(void *)(*(void *)(v8 + 8) + 8 * v7) = *((void *)v11 + 1) | 1;
        *(_DWORD *)(v13 + 56) = v4;
        *(unsigned char *)(v10 + 61) = 1;
        ++*(_DWORD *)(v8 + 72);
        goto LABEL_6;
      }
      __int16 v11 = v17;
      uint64_t result = i40e_allocate_dma_mem(a1, (uint64_t)v17, 6, 0x1000uLL);
      if (!result)
      {
        char v12 = 0;
        goto LABEL_5;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t i40e_remove_pd_bp(IOPCIDevice **a1, uint64_t a2, unsigned int a3)
{
  unsigned int v3 = a3 >> 9;
  if (a3 >> 9 >= *(_DWORD *)(a2 + 48))
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): %s\n", "i40e_remove_pd_bp", 206, "i40e_remove_pd_bp: bad idx\n");
    }
    return 4294967250;
  }
  else
  {
    uint64_t v4 = *(void *)(a2 + 56);
    if (*(_DWORD *)(v4 + 80 * v3) == 1)
    {
      uint64_t v5 = a3 & 0x1FF;
      uint64_t v6 = v4 + 80 * v3;
      uint64_t v7 = *(void *)(v6 + 48) + (v5 << 6);
      int v8 = *(_DWORD *)(v7 + 52) - 1;
      *(_DWORD *)(v7 + 52) = v8;
      if (v8) {
        return 0;
      }
      uint64_t v10 = v6 + 8;
      *(unsigned char *)(v7 + 61) = 0;
      --*(_DWORD *)(v6 + 72);
      *(void *)(*(void *)(v6 + 8) + 8 * v5) = 0;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, 0xC0300uLL, v3 | (a3 << 16));
      if (*(unsigned char *)(v7 + 60) || (uint64_t result = i40e_free_dma_mem((uint64_t)a1, v7 + 8), !result))
      {
        if (!*(_DWORD *)(v10 + 64)) {
          i40e_free_virt_mem((uint64_t)a1, (void *)(v10 + 48));
        }
        return 0;
      }
    }
    else
    {
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): %s\n", "i40e_remove_pd_bp", 212, "i40e_remove_pd_bp: wrong sd_entry type\n");
      }
      return 4294967249;
    }
  }
  return result;
}

uint64_t i40e_prep_remove_sd_bp(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = v2 + 80 * a2;
  int v4 = *(_DWORD *)(v3 + 60) - 1;
  *(_DWORD *)(v3 + 60) = v4;
  if (v4) {
    return 4294967233;
  }
  uint64_t result = 0;
  --*(_DWORD *)(a1 + 52);
  *(unsigned char *)(v2 + 80 * a2 + 4) = 0;
  return result;
}

uint64_t i40e_remove_sd_bp_new(IOPCIDevice **a1, uint64_t a2, unsigned int a3, int a4)
{
  if (!a4) {
    return 4294967232;
  }
  uint64_t v6 = *(void *)(a2 + 56);
  uint32_t v7 = a3 | 0x80000000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xC0200uLL, 0);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xC0100uLL, 0x802u);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xC0000uLL, v7);
  return i40e_free_dma_mem((uint64_t)a1, v6 + 80 * a3 + 16);
}

uint64_t i40e_prep_remove_pd_page(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (*(_DWORD *)(v2 + 80 * a2 + 72)) {
    return 4294967233;
  }
  uint64_t result = 0;
  *(unsigned char *)(v2 + 80 * a2 + 4) = 0;
  --*(_DWORD *)(a1 + 52);
  return result;
}

uint64_t i40e_remove_pd_page_new(IOPCIDevice **a1, uint64_t a2, unsigned int a3, int a4)
{
  if (!a4) {
    return 4294967232;
  }
  uint64_t v6 = *(void *)(a2 + 56);
  uint32_t v7 = a3 | 0x80000000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xC0200uLL, 0);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xC0100uLL, 0x800u);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xC0000uLL, v7);
  return i40e_free_dma_mem((uint64_t)a1, v6 + 80 * a3 + 8);
}

uint64_t sub_100005F50(uint64_t a1, IOService *a2)
{
  int v9 = 1;
  IOParseBootArgNumber("ixl", &v9, 4);
  if (v9)
  {
    properties = 0;
    if (IOService::CopyProperties(a2, &properties, 0)) {
      sub_10001CD1C();
    }
    Object = OSDictionary::getObject(properties, "device-id");
    int v4 = (const OSData *)OSMetaClassBase::safeMetaCast(Object, gOSDataMetaClass);
    uint64_t v5 = 0;
    int v6 = *(_DWORD *)OSData::getBytesNoCopy(v4);
    do
    {
      if (dword_100024348[v5] == v6) {
        operator new[]();
      }
      v5 += 4;
    }
    while (v5 != 84);
    if (properties) {
      ((void (*)(OSDictionary *))properties->release)(properties);
    }
  }
  return 3758097084;
}

uint64_t sub_1000062B0(uint64_t a1)
{
  uint64_t v2 = a1 + 33616;
  *(void *)(a1 + 24) = a1 + 33616;
  *(void *)(a1 + 32) = a1;
  i40e_clear_hw((IOPCIDevice **)(a1 + 33616));
  i40e_set_mac_type(v2);
  uint64_t v3 = sub_1000063DC(a1);
  if (!v3)
  {
    int inited = i40e_init_shared_code(v2);
    if (inited)
    {
      int v6 = inited;
      uint64_t v3 = 3758097084;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315906;
        uint64_t v8 = qword_100028550;
        __int16 v9 = 2080;
        uint64_t v10 = "start";
        __int16 v11 = 1024;
        int v12 = 110;
        __int16 v13 = 2080;
        long long v14 = i40e_stat_str(v2, v6);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Unable to initialize shared code, %s.\n", (uint8_t *)&v7, 0x26u);
      }
    }
    else
    {
      uint64_t v3 = 0;
      *(void *)(a1 + 34500) = 0x1000100001000100;
      *(_DWORD *)(a1 + 35496) = 3;
    }
  }
  return v3;
}

uint64_t sub_1000063DC(uint64_t a1)
{
  if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    uint64_t v14 = qword_100028550;
    __int16 v15 = 2080;
    long long v16 = "reset_hw";
    __int16 v17 = 1024;
    int v18 = 446;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): <==\n", (uint8_t *)&v13, 0x1Cu);
  }
  int v2 = sub_100007FAC(a1);
  if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315906;
    uint64_t v14 = qword_100028550;
    __int16 v15 = 2080;
    long long v16 = "reset_hw";
    __int16 v17 = 1024;
    int v18 = 449;
    __int16 v19 = 1024;
    LODWORD(v20) = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): before PF reset FW mode: 0x%08x\n", (uint8_t *)&v13, 0x22u);
  }
  if (v2 == 1) {
    goto LABEL_10;
  }
  uint64_t v3 = a1 + 33616;
  int v4 = i40e_pf_reset((IOPCIDevice **)(a1 + 33616));
  if (!v4) {
    goto LABEL_10;
  }
  int v5 = v4;
  int v6 = sub_100007FAC(a1);
  if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315906;
    uint64_t v14 = qword_100028550;
    __int16 v15 = 2080;
    long long v16 = "reset_hw";
    __int16 v17 = 1024;
    int v18 = 458;
    __int16 v19 = 1024;
    LODWORD(v20) = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): after PF reset FW mode: 0x%08x\n", (uint8_t *)&v13, 0x22u);
  }
  if (v6 == 1)
  {
LABEL_10:
    uint64_t v7 = 0;
  }
  else if (v6 == 2)
  {
    uint64_t v7 = 3758097084;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      uint64_t v14 = qword_100028550;
      __int16 v15 = 2080;
      long long v16 = "reset_hw";
      __int16 v17 = 1024;
      int v18 = 463;
      uint64_t v8 = "ixl:(%s): %s(%d): Entering recovery mode due to repeated FW resets. This may take several minutes. Refer to t"
           "he Intel(R) Ethernet Adapters and Devices User Guide.\n";
      uint32_t v9 = 28;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v9);
    }
  }
  else
  {
    uint64_t v7 = 3758097084;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = qword_100028550;
      int v12 = i40e_stat_str(v3, v5);
      int v13 = 136315906;
      uint64_t v14 = v11;
      __int16 v15 = 2080;
      long long v16 = "reset_hw";
      __int16 v17 = 1024;
      int v18 = 465;
      __int16 v19 = 2080;
      int v20 = v12;
      uint64_t v8 = "ixl:(%s): %s(%d): PF reset failure %s\n";
      uint32_t v9 = 38;
      goto LABEL_15;
    }
  }
  if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315906;
    uint64_t v14 = qword_100028550;
    __int16 v15 = 2080;
    long long v16 = "reset_hw";
    __int16 v17 = 1024;
    int v18 = 469;
    __int16 v19 = 1024;
    LODWORD(v20) = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): ==> 0x%08x\n", (uint8_t *)&v13, 0x22u);
  }
  return v7;
}

uint64_t sub_1000067A8(uint64_t a1, int a2)
{
  int v53 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = sub_1000063DC(a1);
    if (v4) {
      return v4;
    }
  }
  int inited = i40e_init_adminq(a1 + 33616);
  int v6 = inited;
  uint64_t v4 = 3758097084;
  if (inited != -65 && inited != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v25 = qword_100028550;
      __int16 v26 = 2080;
      __int16 v27 = "load";
      __int16 v28 = 1024;
      int v29 = 138;
      __int16 v30 = 2080;
      *(void *)__int16 v31 = i40e_stat_str(a1 + 33616, v6);
      __int16 v17 = "ixl:(%s): %s(%d): Unable to initialize Admin Queue, %s\n";
      uint32_t v18 = 38;
      goto LABEL_18;
    }
    return v4;
  }
  if (!a2) {
    goto LABEL_34;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *(unsigned __int16 *)(a1 + 34508);
    int v9 = *(unsigned __int16 *)(a1 + 34510);
    int v10 = *(_DWORD *)(a1 + 34512);
    int v11 = *(unsigned __int16 *)(a1 + 34516);
    int v12 = *(unsigned __int16 *)(a1 + 34518);
    int v13 = *(unsigned __int16 *)(a1 + 33768) >> 12;
    int v14 = *(_WORD *)(a1 + 33768);
    int v15 = *(_DWORD *)(a1 + 33772);
    unsigned int v16 = *(_DWORD *)(a1 + 33776);
    *(_DWORD *)buf = 136318466;
    uint64_t v25 = qword_100028550;
    __int16 v26 = 2080;
    __int16 v27 = "load";
    __int16 v28 = 1024;
    int v29 = 150;
    __int16 v30 = 1024;
    *(_DWORD *)__int16 v31 = v8;
    *(_WORD *)&v31[4] = 1024;
    *(_DWORD *)&v31[6] = v9;
    __int16 v32 = 1024;
    int v33 = v10;
    __int16 v34 = 1024;
    int v35 = v11;
    __int16 v36 = 1024;
    int v37 = v12;
    __int16 v38 = 1024;
    int v39 = v13;
    __int16 v40 = 1024;
    int v41 = v14;
    __int16 v42 = 1024;
    int v43 = v15;
    __int16 v44 = 1024;
    unsigned int v45 = HIBYTE(v16);
    __int16 v46 = 1024;
    unsigned int v47 = HIWORD(v16);
    __int16 v48 = 1024;
    int v49 = v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): fw %d.%d.%05d api %d.%d nvm %x.%02x etid %08x oem %d.%d.%d\n", buf, 0x5Eu);
  }
  if (v6 != -65)
  {
    if (*(_WORD *)(a1 + 34516) != 1) {
      goto LABEL_34;
    }
    unsigned int v20 = *(unsigned __int16 *)(a1 + 34518);
    if (*(_DWORD *)(a1 + 33696) == 1) {
      unsigned int v21 = 14;
    }
    else {
      unsigned int v21 = 12;
    }
    if (v21 >= v20)
    {
      if (v20 <= 3)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v25 = qword_100028550;
          __int16 v26 = 2080;
          __int16 v27 = "load";
          __int16 v28 = 1024;
          int v29 = 162;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): The driver for the device detected an older version of the NVM image than expected.\n", buf, 0x1Cu);
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v25 = qword_100028550;
          __int16 v26 = 2080;
          __int16 v27 = "load";
          __int16 v28 = 1024;
          int v29 = 163;
          uint64_t v22 = "ixl:(%s): %s(%d): Please update the NVM image.\n";
          goto LABEL_33;
        }
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v25 = qword_100028550;
        __int16 v26 = 2080;
        __int16 v27 = "load";
        __int16 v28 = 1024;
        int v29 = 159;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): The driver for the device detected a newer version of the NVM image than expected.\n", buf, 0x1Cu);
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v25 = qword_100028550;
        __int16 v26 = 2080;
        __int16 v27 = "load";
        __int16 v28 = 1024;
        int v29 = 160;
        uint64_t v22 = "ixl:(%s): %s(%d): Please install the most recent version of the network driver.\n";
LABEL_33:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v22, buf, 0x1Cu);
      }
    }
LABEL_34:
    i40e_clear_pxe_mode((IOPCIDevice **)(a1 + 33616));
    sub_10000741C();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v25 = qword_100028550;
    __int16 v26 = 2080;
    __int16 v27 = "load";
    __int16 v28 = 1024;
    int v29 = 153;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): The driver for the device stopped because the NVM image is newer than expected.\n", buf, 0x1Cu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v25 = qword_100028550;
    __int16 v26 = 2080;
    __int16 v27 = "load";
    __int16 v28 = 1024;
    int v29 = 154;
    __int16 v17 = "ixl:(%s): %s(%d): You must install the most recent version of the network driver.\n";
    uint32_t v18 = 28;
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v17, buf, v18);
  }
  return v4;
}

void sub_10000741C()
{
  __int16 v0 = 0;
  operator new[]();
}

void sub_1000076F8(uint64_t a1)
{
}

void sub_10000788C(uint64_t a1)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 33616), 0, 0x38800uLL, 0);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 33616), 0, 0x38780uLL, &readData);
  __dmb(1u);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 33616), 0, 0x38800uLL, 0x74390000u);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 33616), 0, 0x38500uLL, 0x7FFu);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 33616), 0, 0x38000uLL, 0x3Eu);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 33616), 0, 0x38480uLL, 0x86000000);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 33616), 0, 0x38400uLL, 0);
}

void sub_10000797C(uint64_t a1)
{
}

uint64_t sub_10000799C(uint64_t a1)
{
  memset(v33, 0, 512);
  unsigned __int16 v32 = 0;
  int switch_config = i40e_aq_get_switch_config(a1 + 33616, v33, 0x200u, (__int16 *)&v32, 0);
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (switch_config)
  {
    uint64_t v4 = 3758097098;
    if (v3)
    {
      int v5 = *(_DWORD *)(a1 + 34524);
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = qword_100028550;
      __int16 v16 = 2080;
      __int16 v17 = "switch_config";
      __int16 v18 = 1024;
      int v19 = 481;
      __int16 v20 = 1024;
      int v21 = switch_config;
      __int16 v22 = 1024;
      int v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): aq_get_switch_config() failed, error %d, aq_error %d\n", buf, 0x28u);
    }
  }
  else
  {
    if (v3)
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = qword_100028550;
      __int16 v16 = 2080;
      __int16 v17 = "switch_config";
      __int16 v18 = 1024;
      int v19 = 487;
      __int16 v20 = 1024;
      int v21 = LOWORD(v33[0]);
      __int16 v22 = 1024;
      int v23 = WORD1(v33[0]);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Switch config: header reported: %d in structure, %d total\n", buf, 0x28u);
    }
    unsigned int v6 = LOWORD(v33[0]);
    if (LOWORD(v33[0]))
    {
      unint64_t v7 = 0;
      int v8 = (unsigned __int16 *)&v33[1] + 3;
      do
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = *((unsigned __int8 *)v8 - 6);
          int v10 = *(v8 - 2);
          int v11 = *(v8 - 1);
          int v12 = *v8;
          *(_DWORD *)buf = 136317186;
          uint64_t v15 = qword_100028550;
          __int16 v16 = 2080;
          __int16 v17 = "switch_config";
          __int16 v18 = 1024;
          int v19 = 493;
          __int16 v20 = 1024;
          int v21 = v7;
          __int16 v22 = 1024;
          int v23 = v9;
          __int16 v24 = 1024;
          int v25 = v10;
          __int16 v26 = 1024;
          int v27 = v11;
          __int16 v28 = 1024;
          int v29 = v12;
          __int16 v30 = 1024;
          int v31 = v32;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): -> %d: type=%d seid=%d uplink=%d downlink=%d next=%d\n", buf, 0x40u);
          unsigned int v6 = LOWORD(v33[0]);
        }
        ++v7;
        v8 += 8;
      }
      while (v7 < v6);
    }
    uint64_t v4 = 0;
    *(_WORD *)(a1 + 54) = WORD3(v33[1]);
    *(_DWORD *)(a1 + 50) = *(_DWORD *)((char *)&v33[1] + 2);
  }
  return v4;
}

void sub_100007C80(uint64_t a1)
{
  *(void *)(a1 + 688) = 0;
  *(_WORD *)(a1 + 698) = 0;
  i40e_aq_set_vsi_broadcast(*(void *)(a1 + 24), *(_WORD *)(a1 + 50), 1, 0);
  sub_10000AB1C(a1);
  sub_10000AC9C(a1, (unsigned __int8 *)(*(void *)(a1 + 24) + 84), -1);
  uint64_t v2 = *(void *)(a1 + 24);
  int v3 = *(unsigned __int16 *)(a1 + 50);
  i40e_add_filter_to_drop_tx_flow_control_frames(v2, v3);
}

uint64_t sub_100007CF0(uint64_t a1)
{
  sub_100007E20(a1);
  sub_100007EF8(a1);
  int v2 = i40e_shutdown_adminq(a1 + 33616);
  if (v2)
  {
    if (dword_100028548)
    {
      int v4 = v2;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315906;
        uint64_t v6 = qword_100028550;
        __int16 v7 = 2080;
        int v8 = "unload";
        __int16 v9 = 1024;
        int v10 = 323;
        __int16 v11 = 2080;
        int v12 = i40e_stat_str(a1 + 33616, v4);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): i40e_shutdown_adminq() failed with status %s\n", (uint8_t *)&v5, 0x26u);
      }
    }
  }
  sub_100001A4C(a1 + 35424, a1 + 35440);
  uint64_t result = *(void *)(a1 + 688);
  if (result) {
    operator delete();
  }
  *(void *)(a1 + 688) = 0;
  return result;
}

void sub_100007E20(uint64_t a1)
{
  uint64_t v1 = a1 + 33616;
  if (*(void *)(a1 + 34640))
  {
    int v2 = i40e_shutdown_lan_hmc(a1 + 33616);
    if (v2)
    {
      int v3 = v2;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 136315906;
        uint64_t v5 = qword_100028550;
        __int16 v6 = 2080;
        __int16 v7 = "shutdown_hmc";
        __int16 v8 = 1024;
        int v9 = 438;
        __int16 v10 = 2080;
        __int16 v11 = i40e_stat_str(v1, v3);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Shutdown LAN HMC failed with code %s\n", (uint8_t *)&v4, 0x26u);
      }
    }
  }
}

void sub_100007EF8(uint64_t a1)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 33616), 0, 0x38480uLL, 0x18u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 33616), 0, 0xB612CuLL, &readData);
  __dmb(1u);
}

uint64_t sub_100007F60(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result) {
    operator delete();
  }
  *a1 = 0;
  return result;
}

uint64_t sub_100007FAC(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 33616), 0, 0x83048uLL, &readData);
  __dmb(1u);
  uint32_t v1 = readData & 0xFF0000;
  uint64_t result = 1;
  if ((readData & 0xFF0000) - 3145728 > 0x30000 && v1 != 720896 && v1 != 786432) {
    return 2 * (v1 - 2097153 < 0xA0000);
  }
  return result;
}

uint64_t sub_100008028(uint64_t a1)
{
  if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v65 = 136315650;
    *(void *)&v65[4] = qword_100028550;
    *(_WORD *)&v65[12] = 2080;
    *(void *)&v65[14] = "up";
    *(_WORD *)&v65[22] = 1024;
    *(_DWORD *)&v65[24] = 506;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): <==\n", v65, 0x1Cu);
  }
  if ((i40e_check_asq_alive(*(void *)(a1 + 24)) & 1) == 0) {
    sub_10001CD48();
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v66 = 0u;
  memset(v65, 0, sizeof(v65));
  *(_WORD *)v65 = *(_WORD *)(a1 + 50);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_WORD *)(v2 + 35508)) {
    *(_WORD *)&v65[2] = *(_WORD *)(v2 + 35508);
  }
  uint64_t v3 = *(void *)(a1 + 24);
  v65[12] = *(unsigned char *)(v3 + 642);
  int vsi_params = i40e_aq_get_vsi_params(v3, (__int16 *)v65);
  if (vsi_params)
  {
    int v5 = vsi_params;
    uint64_t v6 = 3758097084;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(_DWORD *)(*(void *)(a1 + 24) + 908);
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = qword_100028550;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "up";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 530;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v5;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v7;
      __int16 v8 = "ixl:(%s): %s(%d): i40e_aq_get_vsi_params() failed, error %d aq_error %d\n";
LABEL_17:
      uint32_t v21 = 40;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, buf, v21);
    }
  }
  else
  {
    if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136318210;
      *(void *)&uint8_t buf[4] = qword_100028550;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "up";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 539;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = *(unsigned __int16 *)v65;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = *(unsigned __int16 *)&v65[2];
      *(_WORD *)&buf[40] = 1024;
      *(_DWORD *)&buf[42] = *(unsigned __int16 *)&v65[4];
      *(_WORD *)&buf[46] = 1024;
      int v52 = *(unsigned __int16 *)&v65[6];
      __int16 v53 = 1024;
      int v54 = *(unsigned __int16 *)&v65[8];
      __int16 v55 = 1024;
      int v56 = *(unsigned __int16 *)&v65[10];
      __int16 v57 = 1024;
      int v58 = v65[12];
      __int16 v59 = 1024;
      int v60 = v65[13];
      __int16 v61 = 1024;
      int v62 = (unsigned __int16)v72;
      __int16 v63 = 1024;
      int v64 = BYTE2(v70);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): get_vsi_params: seid: %d, uplinkseid: %d, vsi_number: %d, vsis_allocated: %d, vsis_unallocated: %d, flags: 0x%x, pfnum: %d, vfnum: %d, stat idx: %d, enabled: %d\n", buf, 0x58u);
    }
    __int16 v9 = 64;
    strcpy((char *)&v65[16], "@");
    HIWORD(v66) = 0;
    unsigned int v10 = *(unsigned __int16 *)(v2 + 35484);
    unsigned int v11 = __clz(v10) ^ 0x1F;
    if (*(_WORD *)(v2 + 35484)) {
      int v12 = v11;
    }
    else {
      int v12 = -1;
    }
    int v13 = *(unsigned __int16 *)(v2 + 35452);
    HIWORD(v68) = v13 & 0x1FF | ((v12 & 7) << 9);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = qword_100028550;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "up";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 559;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v13;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v10;
      *(_WORD *)&buf[40] = 1024;
      *(_DWORD *)&buf[42] = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): pf->qtag.first_qidx=%d, pf->qtag.num_allocated=%d, tc_queues=%d\n", buf, 0x2Eu);
      __int16 v9 = *(_WORD *)&v65[16];
    }
    *(_WORD *)&v65[16] = v9 | 4;
    v65[28] = 27;
    *(_WORD *)(a1 + 48) = *(_WORD *)&v65[4];
    long long v14 = v70;
    *(_OWORD *)(a1 + 764) = v69;
    *(_OWORD *)(a1 + 780) = v14;
    long long v15 = v72;
    *(_OWORD *)(a1 + 796) = v71;
    *(_OWORD *)(a1 + 812) = v15;
    long long v16 = v66;
    *(_OWORD *)(a1 + 700) = *(_OWORD *)&v65[16];
    *(_OWORD *)(a1 + 716) = v16;
    long long v17 = v68;
    *(_OWORD *)(a1 + 732) = v67;
    *(_OWORD *)(a1 + 748) = v17;
    *(_WORD *)&v65[10] = 2;
    int updated = i40e_aq_update_vsi_params(*(void *)(a1 + 24), (uint64_t)v65, 0);
    if (!updated)
    {
      char v23 = 1;
      if (*(unsigned char *)(a1 + 680))
      {
        unint64_t v24 = 0;
        int v25 = (uint64_t *)(a1 + 64);
        uint64_t v26 = 1064960;
        while (1)
        {
          memset(buf, 0, sizeof(buf));
          buf[2] = 1;
          uint64_t v27 = *v25;
          *(void *)&buf[8] = (unint64_t)*v25 >> 7;
          *(_WORD *)&buf[24] = 512;
          *(_WORD *)&buf[44] = *(_WORD *)(a1 + 796);
          buf[23] = 1;
          *(void *)&buf[32] = v27 + 0x2000;
          if (i40e_clear_lan_tx_queue_context(*(void *)(a1 + 24), (unsigned __int16)v24))
          {
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_31;
            }
            uint32_t v43 = 136315650;
            uint64_t v44 = qword_100028550;
            __int16 v45 = 2080;
            __int16 v46 = "up";
            __int16 v47 = 1024;
            int v48 = 614;
            int v29 = "ixl:(%s): %s(%d): Unable to clear TX context\n";
            goto LABEL_30;
          }
          if (i40e_set_lan_tx_queue_context(*(void *)(a1 + 24), (unsigned __int16)v24, (uint64_t)buf)) {
            break;
          }
          v25 += 39;
          uint32_t v28 = (4 * (*(unsigned char *)(*(void *)(a1 + 24) + 642) & 0xF)) | 2;
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(**(IOPCIDevice ***)(a1 + 24), 0, v26, v28);
          uint32_t v43 = 0;
          IOPCIDevice::MemoryRead32(**(IOPCIDevice ***)(a1 + 24), 0, 0xB612CuLL, &v43);
          __dmb(1u);
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(**(IOPCIDevice ***)(a1 + 24), 0, v26 + 0x4000, 0);
          ++v24;
          v26 += 4;
          if (v24 >= *(unsigned __int8 *)(a1 + 680))
          {
            char v23 = 1;
            goto LABEL_32;
          }
        }
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_31;
        }
        uint32_t v43 = 136315650;
        uint64_t v44 = qword_100028550;
        __int16 v45 = 2080;
        __int16 v46 = "up";
        __int16 v47 = 1024;
        int v48 = 619;
        int v29 = "ixl:(%s): %s(%d): Unable to set TX context\n";
LABEL_30:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&v43, 0x1Cu);
LABEL_31:
        char v23 = 0;
      }
LABEL_32:
      if (*(unsigned char *)(a1 + 681))
      {
        unint64_t v30 = 0;
        int v31 = (void *)(a1 + 376);
        uint64_t v32 = 1212416;
        while (1)
        {
          memset(buf, 0, sizeof(buf));
          uint64_t v33 = *(void *)(a1 + 24);
          if (((*(unsigned __int8 *)(v33 + 604) << 11) & 0xF800) != 0) {
            int v34 = 2048;
          }
          else {
            int v34 = 0;
          }
          *(_DWORD *)&buf[32] = v34;
          *(void *)&buf[8] = *v31 >> 7;
          *(_DWORD *)&buf[16] = 1049088;
          *(_WORD *)&buf[36] = 257;
          buf[39] = 0;
          *(_WORD *)&buf[40] = 1;
          *(_DWORD *)&buf[24] = 65537;
          buf[42] = 1;
          if (i40e_clear_lan_rx_queue_context(v33, (unsigned __int16)v30))
          {
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            uint32_t v43 = 136315906;
            uint64_t v44 = qword_100028550;
            __int16 v45 = 2080;
            __int16 v46 = "up";
            __int16 v47 = 1024;
            int v48 = 660;
            __int16 v49 = 1024;
            int v50 = v30;
            int v35 = "ixl:(%s): %s(%d): Unable to clear RX context %d\n";
            goto LABEL_48;
          }
          if (i40e_set_lan_rx_queue_context(*(void *)(a1 + 24), (unsigned __int16)v30, (uint64_t)buf)) {
            break;
          }
          v31 += 39;
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(**(IOPCIDevice ***)(a1 + 24), 0, v32, 0);
          ++v30;
          v32 += 4;
          if (v30 >= *(unsigned __int8 *)(a1 + 681)) {
            goto LABEL_42;
          }
        }
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_49;
        }
        uint32_t v43 = 136315906;
        uint64_t v44 = qword_100028550;
        __int16 v45 = 2080;
        __int16 v46 = "up";
        __int16 v47 = 1024;
        int v48 = 665;
        __int16 v49 = 1024;
        int v50 = v30;
        int v35 = "ixl:(%s): %s(%d): Unable to set RX context %d\n";
LABEL_48:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v35, (uint8_t *)&v43, 0x22u);
      }
      else if (v23)
      {
LABEL_42:
        sub_10000288C(v2, 1);
        if (*(void *)(v2 + 35400))
        {
          sub_100008B00(v2);
          sub_10000A11C(v2);
        }
        else
        {
          sub_100008C0C(v2);
        }
        if (*(unsigned char *)(a1 + 680))
        {
          unsigned int v36 = 0;
          do
            sub_100008CD0(v2, v2 + 35440, (unsigned __int16)v36++);
          while (v36 < *(unsigned __int8 *)(a1 + 680));
        }
        if (*(unsigned char *)(a1 + 681))
        {
          unsigned int v37 = 0;
          do
            sub_100008EF8(v2, v2 + 35440, (unsigned __int16)v37++);
          while (v37 < *(unsigned __int8 *)(a1 + 681));
        }
        int v38 = i40e_aq_set_default_vsi(*(void *)(a1 + 24), *(_WORD *)(a1 + 50), 0);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v39 = *(unsigned __int16 *)(a1 + 50);
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = qword_100028550;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "up";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 691;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v38;
          *(_WORD *)&buf[34] = 1024;
          *(_DWORD *)&buf[36] = v39;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): i40e_aq_set_default_vsi returned %d, for vsi seid %d\n", buf, 0x28u);
        }
        sub_100009110(a1);
        if (*(unsigned char *)(a1 + 681))
        {
          unint64_t v40 = 0;
          uint64_t v41 = 215040;
          do
          {
            __int16 v42 = *(IOPCIDevice ***)(a1 + 24);
            __dmb(2u);
            IOPCIDevice::MemoryWrite32(*v42, 0, v41, 0x1Bu);
            ++v40;
            v41 += 4;
          }
          while (v40 < *(unsigned __int8 *)(a1 + 681));
        }
        if (dword_100028548)
        {
          uint64_t v6 = 0;
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            return v6;
          }
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = qword_100028550;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "up";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 717;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): ==> 0x%08x\n", buf, 0x22u);
        }
        return 0;
      }
LABEL_49:
      uint64_t v6 = 3758097084;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return v6;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = qword_100028550;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "up";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 672;
      __int16 v8 = "ixl:(%s): %s(%d): initialize vsi failed!!\n";
      uint32_t v21 = 28;
      goto LABEL_18;
    }
    int v19 = updated;
    uint64_t v6 = 3758097084;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = *(_DWORD *)(*(void *)(a1 + 24) + 908);
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = qword_100028550;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "up";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 584;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v19;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v20;
      __int16 v8 = "ixl:(%s): %s(%d): i40e_aq_update_vsi_params() failed, error %d, aq_error %d\n";
      goto LABEL_17;
    }
  }
  return v6;
}

void sub_100008B00(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 681) | *(unsigned __int8 *)(a1 + 680))
  {
    uint64_t v2 = 0;
    int v3 = 0;
    uint64_t v4 = 0;
    int v5 = (IOPCIDevice **)(a1 + 33616);
    do
    {
      unint64_t v6 = v4 + 1;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*v5, 0, v2 + 215040, 0);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*v5, 0, v2 + 217088, v4);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*v5, 0, v2 + 237568, v3 | (v4 + 1) | 0x48000000);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*v5, 0, v2 + 245760, (v4 + 1) | 0x47FF0800);
      if (*(unsigned __int8 *)(a1 + 681) <= *(unsigned __int8 *)(a1 + 680)) {
        unint64_t v7 = *(unsigned __int8 *)(a1 + 680);
      }
      else {
        unint64_t v7 = *(unsigned __int8 *)(a1 + 681);
      }
      v3 += 0x10000;
      v2 += 4;
      ++v4;
    }
    while (v6 < v7);
  }
}

void sub_100008C0C(uint64_t a1)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 33616), 0, 0x38800uLL, 0x74390000u);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 33616), 0, 0x38400uLL, 0xCu);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 33616), 0, 0x38500uLL, 0);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 33616), 0, 0x3A000uLL, 0x48000000u);
  __dmb(2u);
  uint64_t v2 = *(IOPCIDevice **)(a1 + 33616);
  IOPCIDevice::MemoryWrite32(v2, 0, 0x3C000uLL, 0x47FF0800u);
}

uint64_t sub_100008CD0(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (*(unsigned __int16 *)(a2 + 44) <= a3) {
    sub_10001C84C();
  }
  int v5 = (_WORD *)(a2 + 12);
  if (*(_DWORD *)(a2 + 8)) {
    unsigned __int16 v6 = v5[a3];
  }
  else {
    unsigned __int16 v6 = *v5 + a3;
  }
  if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v14 = 136316162;
    uint64_t v15 = qword_100028550;
    __int16 v16 = 2080;
    long long v17 = "enableTxRing";
    __int16 v18 = 1024;
    int v19 = 725;
    __int16 v20 = 1024;
    int v21 = v6;
    __int16 v22 = 1024;
    unsigned int v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Enabling PF TX ring %4d / VSI TX ring %4d...\n", (uint8_t *)&v14, 0x28u);
  }
  unint64_t v7 = (IOPCIDevice **)(a1 + 33616);
  int v8 = v6;
  i40e_pre_tx_queue_cfg((uint64_t)v7, v6, 1);
  uint32_t v14 = 0;
  uint64_t v9 = (4 * v6) | 0x100000u;
  IOPCIDevice::MemoryRead32(*v7, 0, v9, &v14);
  __dmb(1u);
  uint32_t v10 = v14 | 5;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*v7, 0, v9, v10);
  int v11 = 10;
  do
  {
    uint32_t v14 = 0;
    IOPCIDevice::MemoryRead32(*v7, 0, v9, &v14);
    __dmb(1u);
    if ((v14 & 4) != 0) {
      return 0;
    }
    IODelay(0xAuLL);
    --v11;
  }
  while (v11);
  uint64_t v12 = 3758097110;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v14 = 136315906;
    uint64_t v15 = qword_100028550;
    __int16 v16 = 2080;
    long long v17 = "enableTxRing";
    __int16 v18 = 1024;
    int v19 = 739;
    __int16 v20 = 1024;
    int v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): TX queue %d still disabled!\n", (uint8_t *)&v14, 0x22u);
  }
  return v12;
}

uint64_t sub_100008EF8(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (*(unsigned __int16 *)(a2 + 44) <= a3) {
    sub_10001C84C();
  }
  int v5 = (_WORD *)(a2 + 12);
  if (*(_DWORD *)(a2 + 8)) {
    unsigned __int16 v6 = v5[a3];
  }
  else {
    unsigned __int16 v6 = *v5 + a3;
  }
  if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v15 = 136316162;
    uint64_t v16 = qword_100028550;
    __int16 v17 = 2080;
    __int16 v18 = "enableRxRing";
    __int16 v19 = 1024;
    int v20 = 750;
    __int16 v21 = 1024;
    int v22 = v6;
    __int16 v23 = 1024;
    unsigned int v24 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Enabling PF RX ring %4d / VSI RX ring %4d...\n", (uint8_t *)&v15, 0x28u);
  }
  uint32_t v15 = 0;
  unint64_t v7 = (IOPCIDevice **)(a1 + 33616);
  int v8 = *(IOPCIDevice **)(a1 + 33616);
  int v9 = v6;
  uint64_t v10 = 4 * v6 + 1179648;
  IOPCIDevice::MemoryRead32(v8, 0, v10, &v15);
  __dmb(1u);
  uint32_t v11 = v15 | 5;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*v7, 0, v10, v11);
  int v12 = 10;
  do
  {
    uint32_t v15 = 0;
    IOPCIDevice::MemoryRead32(*v7, 0, v10, &v15);
    __dmb(1u);
    if ((v15 & 4) != 0) {
      return 0;
    }
    IODelay(0xAuLL);
    --v12;
  }
  while (v12);
  uint64_t v13 = 3758097110;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v15 = 136315906;
    uint64_t v16 = qword_100028550;
    __int16 v17 = 2080;
    __int16 v18 = "enableRxRing";
    __int16 v19 = 1024;
    int v20 = 762;
    __int16 v21 = 1024;
    int v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): RX queue %d still disabled!\n", (uint8_t *)&v15, 0x22u);
  }
  return v13;
}

void sub_100009110(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v6 = qword_100028550;
    __int16 v7 = 2080;
    int v8 = "reconfigure_filters";
    __int16 v9 = 1024;
    int v10 = 1449;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): <==\n", buf, 0x1Cu);
  }
  uint64_t v2 = *(void *)(a1 + 688);
  uint64_t v4 = v2;
  if (v2)
  {
    *(void *)(v2 + 8) = &v4;
    *(void *)(a1 + 688) = 0;
  }
  int v3 = *(unsigned __int16 *)(a1 + 698);
  *(_WORD *)(a1 + 698) = 0;
  sub_10000AECC(a1, &v4, v3);
  sub_10000AC9C(a1, (unsigned __int8 *)(*(void *)(a1 + 24) + 84), -1);
  sub_10000B414(a1, (unsigned __int8 *)(*(void *)(a1 + 24) + 84));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v6 = qword_100028550;
    __int16 v7 = 2080;
    int v8 = "reconfigure_filters";
    __int16 v9 = 1024;
    int v10 = 1473;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): ==>\n", buf, 0x1Cu);
  }
}

void sub_100009270(IOPCIDevice **a1, int a2)
{
}

uint64_t sub_100009294(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (*(unsigned __int16 *)(a2 + 44) <= a3) {
    sub_10001C84C();
  }
  int v5 = (_WORD *)(a2 + 12);
  if (*(_DWORD *)(a2 + 8)) {
    unsigned __int16 v6 = v5[a3];
  }
  else {
    unsigned __int16 v6 = *v5 + a3;
  }
  if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v14 = 136316162;
    uint64_t v15 = qword_100028550;
    __int16 v16 = 2080;
    __int16 v17 = "disableTxRing";
    __int16 v18 = 1024;
    int v19 = 773;
    __int16 v20 = 1024;
    int v21 = v6;
    __int16 v22 = 1024;
    unsigned int v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Disabling PF TX ring %4d / VSI TX ring %4d...\n", (uint8_t *)&v14, 0x28u);
  }
  __int16 v7 = (IOPCIDevice **)(a1 + 33616);
  int v8 = v6;
  i40e_pre_tx_queue_cfg((uint64_t)v7, v6, 0);
  IODelay(0x1F4uLL);
  uint32_t v14 = 0;
  uint64_t v9 = (4 * v6) | 0x100000u;
  IOPCIDevice::MemoryRead32(*v7, 0, v9, &v14);
  __dmb(1u);
  uint32_t v10 = v14 & 0xFFFFFFFE;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*v7, 0, v9, v10);
  int v11 = 10;
  do
  {
    uint32_t v14 = 0;
    IOPCIDevice::MemoryRead32(*v7, 0, v9, &v14);
    __dmb(1u);
    if ((v14 & 4) == 0) {
      return 0;
    }
    IODelay(0x2710uLL);
    --v11;
  }
  while (v11);
  uint64_t v12 = 3758097110;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v14 = 136315906;
    uint64_t v15 = qword_100028550;
    __int16 v16 = 2080;
    __int16 v17 = "disableTxRing";
    __int16 v18 = 1024;
    int v19 = 788;
    __int16 v20 = 1024;
    int v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): TX queue %d still enabled!\n", (uint8_t *)&v14, 0x22u);
  }
  return v12;
}

uint64_t sub_1000094C0(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (*(unsigned __int16 *)(a2 + 44) <= a3) {
    sub_10001C84C();
  }
  int v5 = (_WORD *)(a2 + 12);
  if (*(_DWORD *)(a2 + 8)) {
    unsigned __int16 v6 = v5[a3];
  }
  else {
    unsigned __int16 v6 = *v5 + a3;
  }
  if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v15 = 136316162;
    uint64_t v16 = qword_100028550;
    __int16 v17 = 2080;
    __int16 v18 = "disableRxRing";
    __int16 v19 = 1024;
    int v20 = 799;
    __int16 v21 = 1024;
    int v22 = v6;
    __int16 v23 = 1024;
    unsigned int v24 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Disabling PF RX ring %4d / VSI RX ring %4d...\n", (uint8_t *)&v15, 0x28u);
  }
  uint32_t v15 = 0;
  __int16 v7 = (IOPCIDevice **)(a1 + 33616);
  int v8 = *(IOPCIDevice **)(a1 + 33616);
  int v9 = v6;
  uint64_t v10 = 4 * v6 + 1179648;
  IOPCIDevice::MemoryRead32(v8, 0, v10, &v15);
  __dmb(1u);
  uint32_t v11 = v15 & 0xFFFFFFFE;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*v7, 0, v10, v11);
  int v12 = 10;
  do
  {
    uint32_t v15 = 0;
    IOPCIDevice::MemoryRead32(*v7, 0, v10, &v15);
    __dmb(1u);
    if ((v15 & 4) == 0) {
      return 0;
    }
    IODelay(0x2710uLL);
    --v12;
  }
  while (v12);
  uint64_t v13 = 3758097110;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v15 = 136315906;
    uint64_t v16 = qword_100028550;
    __int16 v17 = 2080;
    __int16 v18 = "disableRxRing";
    __int16 v19 = 1024;
    int v20 = 811;
    __int16 v21 = 1024;
    int v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): RX queue %d still enabled!\n", (uint8_t *)&v15, 0x22u);
  }
  return v13;
}

uint64_t sub_1000096D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a2 + 680))
  {
    unsigned int v6 = 0;
    do
      sub_100009294(a1, a3, (unsigned __int16)v6++);
    while (v6 < *(unsigned __int8 *)(a2 + 680));
  }
  if (*(unsigned char *)(a2 + 681))
  {
    unsigned int v7 = 0;
    do
      sub_1000094C0(a1, a3, (unsigned __int16)v7++);
    while (v7 < *(unsigned __int8 *)(a2 + 681));
  }
  return 0;
}

uint64_t sub_100009760(uint64_t a1, _WORD *a2)
{
  uint64_t v4 = (unsigned char *)(a1 + 33640);
  bzero(v18, 0x1000uLL);
  unsigned int v5 = 0;
  __int16 v21 = 4096;
  int v22 = v18;
  do
  {
    uint64_t v6 = i40e_clean_arq_element(a1 + 33616, (uint64_t)v19, a2);
    if (v6) {
      break;
    }
    int v7 = v20;
    if ((dword_100028548 & 0x100000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v11 = qword_100028550;
      __int16 v12 = 2080;
      uint64_t v13 = "process_adminq";
      __int16 v14 = 1024;
      int v15 = 843;
      __int16 v16 = 1024;
      int v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Admin Queue event: %#06x\n", buf, 0x22u);
    }
    if (v7 == 1543)
    {
      v4[40] = 1;
      i40e_get_link_status(a1 + 33616, (unsigned char *)(a1 + 35488));
      if ((*v4 & 0x40) != 0
        && (*v4 & 1) == 0
        && ((char)v4[1] & 0x80000000) == 0
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v11 = qword_100028550;
        __int16 v12 = 2080;
        uint64_t v13 = "process_adminq";
        __int16 v14 = 1024;
        int v15 = 866;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Link failed because an unqualified module was detected!\n", buf, 0x1Cu);
      }
      sub_100001F04((int *)a1);
    }
    if (!*a2) {
      break;
    }
  }
  while (v5++ < 2);
  return v6;
}

void sub_100009978(uint64_t a1)
{
  uint64_t v1 = a1 + 33616;
  uint32_t v11 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 33616), 0, 0xE6480uLL, &v11);
  __dmb(1u);
  uint32_t v2 = v11;
  if ((v11 & 0x80000000) != 0)
  {
    uint32_t v3 = v11 & 0xFFF;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)v1, 0, 0xE6480uLL, 0xFFFFFFFF);
    uint32_t v11 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v1, 0, 0xE6400uLL, &v11);
    __dmb(1u);
    char v4 = v11;
    if (v11)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)v1, 0, 0xE6400uLL, 0xFFFFu);
      int v5 = *(unsigned __int8 *)(v1 + 642);
    }
    else
    {
      int v5 = 255;
    }
    int v6 = (v2 >> 21) & 0xF;
    int v7 = (v2 >> 25) & 0x1F;
    uint32_t v11 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v1, 0, 0xE6000uLL, &v11);
    __dmb(1u);
    if (v11)
    {
      int v10 = (v2 >> 12) & 0x1FF;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)v1, 0, 0xE6000uLL, 0xFFFFu);
      if (v4)
      {
        if ((dword_100028548 & 0x100000) == 0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        uint32_t v11 = 136317186;
        uint64_t v12 = qword_100028550;
        __int16 v13 = 2080;
        __int16 v14 = "handle_tx_mdd_event";
        __int16 v15 = 1024;
        int v16 = 941;
        __int16 v17 = 1024;
        int v18 = v7;
        __int16 v19 = 1024;
        int v20 = v3;
        __int16 v21 = 1024;
        int v22 = v6;
        __int16 v23 = 1024;
        int v24 = v5;
        __int16 v25 = 1024;
        int v26 = v10;
        __int16 v27 = 1024;
        int v28 = 0;
        int v8 = "ixl:(%s): %s(%d): Malicious Driver Detection event %d on TX queue %d, pf number %d (PF-%d), vf number %d (VF-%d)\n";
        uint32_t v9 = 64;
      }
      else
      {
        if ((dword_100028548 & 0x100000) == 0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        uint32_t v11 = 136316930;
        uint64_t v12 = qword_100028550;
        __int16 v13 = 2080;
        __int16 v14 = "handle_tx_mdd_event";
        __int16 v15 = 1024;
        int v16 = 945;
        __int16 v17 = 1024;
        int v18 = v7;
        __int16 v19 = 1024;
        int v20 = v3;
        __int16 v21 = 1024;
        int v22 = v6;
        __int16 v23 = 1024;
        int v24 = v10;
        __int16 v25 = 1024;
        int v26 = 0;
        int v8 = "ixl:(%s): %s(%d): Malicious Driver Detection event %d on TX queue %d, pf number %d, vf number %d (VF-%d)\n";
        uint32_t v9 = 58;
      }
    }
    else if (v4)
    {
      if ((dword_100028548 & 0x100000) == 0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint32_t v11 = 136316674;
      uint64_t v12 = qword_100028550;
      __int16 v13 = 2080;
      __int16 v14 = "handle_tx_mdd_event";
      __int16 v15 = 1024;
      int v16 = 948;
      __int16 v17 = 1024;
      int v18 = (v2 >> 25) & 0x1F;
      __int16 v19 = 1024;
      int v20 = v2 & 0xFFF;
      __int16 v21 = 1024;
      int v22 = (v2 >> 21) & 0xF;
      __int16 v23 = 1024;
      int v24 = v5;
      int v8 = "ixl:(%s): %s(%d): Malicious Driver Detection event %d on TX queue %d, pf number %d (PF-%d)\n";
      uint32_t v9 = 52;
    }
    else
    {
      if ((dword_100028548 & 0x100000) == 0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint32_t v11 = 136315650;
      uint64_t v12 = qword_100028550;
      __int16 v13 = 2080;
      __int16 v14 = "handle_tx_mdd_event";
      __int16 v15 = 1024;
      int v16 = 951;
      int v8 = "ixl:(%s): %s(%d): TX Malicious Driver Detection event (unknown)\n";
      uint32_t v9 = 28;
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v9);
  }
}

void sub_100009D28(uint64_t a1)
{
  uint64_t v1 = a1 + 33616;
  uint32_t v7 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 33616), 0, 0x12A510uLL, &v7);
  __dmb(1u);
  uint32_t v2 = v7;
  if ((v7 & 0x80000000) != 0)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)v1, 0, 0x12A510uLL, 0xFFFFFFFF);
    uint32_t v7 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v1, 0, 0x12A400uLL, &v7);
    __dmb(1u);
    char v3 = v7;
    if (v7)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)v1, 0, 0x12A400uLL, 0xFFFFu);
      int v4 = *(unsigned __int8 *)(v1 + 642);
    }
    else
    {
      int v4 = 255;
    }
    uint32_t v7 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v1, 0, 0x12A000uLL, &v7);
    __dmb(1u);
    if (v7)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)v1, 0, 0x12A000uLL, 0xFFFFu);
      if (v3)
      {
        if ((dword_100028548 & 0x100000) == 0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        uint32_t v7 = 136316930;
        uint64_t v8 = qword_100028550;
        __int16 v9 = 2080;
        int v10 = "handle_rx_mdd_event";
        __int16 v11 = 1024;
        int v12 = 1000;
        __int16 v13 = 1024;
        int v14 = BYTE1(v2);
        __int16 v15 = 1024;
        int v16 = (v2 >> 17) & 0x3FFF;
        __int16 v17 = 1024;
        int v18 = v2;
        __int16 v19 = 1024;
        int v20 = v4;
        __int16 v21 = 1024;
        int v22 = 0;
        int v5 = "ixl:(%s): %s(%d): Malicious Driver Detection event %d on RX queue %d, pf number %d (PF-%d), (VF-%d)\n";
        uint32_t v6 = 58;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, v6);
        return;
      }
      if ((dword_100028548 & 0x100000) == 0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint32_t v7 = 136316674;
      uint64_t v8 = qword_100028550;
      __int16 v9 = 2080;
      int v10 = "handle_rx_mdd_event";
      __int16 v11 = 1024;
      int v12 = 1003;
      __int16 v13 = 1024;
      int v14 = BYTE1(v2);
      __int16 v15 = 1024;
      int v16 = (v2 >> 17) & 0x3FFF;
      __int16 v17 = 1024;
      int v18 = v2;
      __int16 v19 = 1024;
      int v20 = 0;
      int v5 = "ixl:(%s): %s(%d): Malicious Driver Detection event %d on RX queue %d, pf number %d, (VF-%d)\n";
    }
    else
    {
      if ((v3 & 1) == 0)
      {
        if ((dword_100028548 & 0x100000) == 0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        uint32_t v7 = 136315650;
        uint64_t v8 = qword_100028550;
        __int16 v9 = 2080;
        int v10 = "handle_rx_mdd_event";
        __int16 v11 = 1024;
        int v12 = 1009;
        int v5 = "ixl:(%s): %s(%d): RX Malicious Driver Detection event (unknown)\n";
        uint32_t v6 = 28;
        goto LABEL_22;
      }
      if ((dword_100028548 & 0x100000) == 0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint32_t v7 = 136316674;
      uint64_t v8 = qword_100028550;
      __int16 v9 = 2080;
      int v10 = "handle_rx_mdd_event";
      __int16 v11 = 1024;
      int v12 = 1006;
      __int16 v13 = 1024;
      int v14 = BYTE1(v2);
      __int16 v15 = 1024;
      int v16 = (v2 >> 17) & 0x3FFF;
      __int16 v17 = 1024;
      int v18 = v2;
      __int16 v19 = 1024;
      int v20 = v4;
      int v5 = "ixl:(%s): %s(%d): Malicious Driver Detection event %d on RX queue %d, pf number %d (PF-%d)\n";
    }
    uint32_t v6 = 52;
    goto LABEL_22;
  }
}

void sub_10000A0C0(uint64_t a1)
{
  sub_100009978(a1);
  sub_100009D28(a1);
}

void sub_10000A0F8(IOPCIDevice **a1, int a2)
{
}

void sub_10000A11C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 680))
  {
    unint64_t v2 = 0;
    char v3 = (IOPCIDevice **)(a1 + 33616);
    uint64_t v4 = 198656;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*v3, 0, v4, 0x3Eu);
      ++v2;
      v4 += 4;
    }
    while (v2 < *(unsigned __int8 *)(a1 + 680));
  }
}

void sub_10000A18C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 681))
  {
    unint64_t v2 = 0;
    char v3 = (IOPCIDevice **)(a1 + 33616);
    uint64_t v4 = 196608;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*v3, 0, v4, 0x7Au);
      ++v2;
      v4 += 4;
    }
    while (v2 < *(unsigned __int8 *)(a1 + 681));
  }
}

uint64_t sub_10000A1F8(uint64_t a1)
{
  if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    uint64_t v8 = qword_100028550;
    __int16 v9 = 2080;
    int v10 = "down";
    __int16 v11 = 1024;
    int v12 = 1201;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): <==\n", (uint8_t *)&v7, 0x1Cu);
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 681))
  {
    unint64_t v3 = 0;
    uint64_t v4 = 215040;
    do
    {
      int v5 = *(IOPCIDevice ***)(a1 + 24);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*v5, 0, v4, 0x18u);
      ++v3;
      v4 += 4;
    }
    while (v3 < *(unsigned __int8 *)(a1 + 681));
  }
  sub_1000096D4(v2, a1, v2 + 35440);
  *(unsigned char *)(v2 + 35488) = 0;
  sub_100001F04((int *)v2);
  if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315906;
    uint64_t v8 = qword_100028550;
    __int16 v9 = 2080;
    int v10 = "down";
    __int16 v11 = 1024;
    int v12 = 1212;
    __int16 v13 = 1024;
    int v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): ==> 0x%08x\n", (uint8_t *)&v7, 0x22u);
  }
  return 0;
}

uint64_t sub_10000A3B4(uint64_t a1, int a2)
{
  if (a2) {
    unsigned int v2 = 256;
  }
  else {
    unsigned int v2 = 0;
  }
  return sub_100002818(a1, v2);
}

uint64_t sub_10000A3C4(uint64_t a1, int a2)
{
  if (a2) {
    unsigned int v2 = 512;
  }
  else {
    unsigned int v2 = 0;
  }
  return sub_100002818(a1, v2);
}

uint64_t sub_10000A3D4(uint64_t a1, uint64_t a2, int a3)
{
  if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315906;
    uint64_t v7 = qword_100028550;
    __int16 v8 = 2080;
    __int16 v9 = "setMcastAddresses";
    __int16 v10 = 1024;
    int v11 = 1229;
    __int16 v12 = 1024;
    int v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): <== mcnt=%d\n", (uint8_t *)&v6, 0x22u);
  }
  if (*(_DWORD *)(a1 + 16) == 2)
  {
    if (*(void *)(a1 + 33600)) {
      operator delete[]();
    }
    operator new[]();
  }
  if ((dword_100028548 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    uint64_t v7 = qword_100028550;
    __int16 v8 = 2080;
    __int16 v9 = "setMcastAddresses";
    __int16 v10 = 1024;
    int v11 = 1247;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): ==>\n", (uint8_t *)&v6, 0x1Cu);
  }
  return 0;
}

void sub_10000A5D0(uint64_t a1, int a2)
{
  int v6 = 0;
  unsigned int v2 = *(uint64_t **)(a1 + 688);
  if (v2)
  {
    signed int v3 = 0;
    do
    {
      uint64_t v4 = v2;
      unsigned int v2 = (uint64_t *)*v2;
      if ((v4[3] & 2) != 0 && a2)
      {
        if (v2) {
          v2[1] = v4[1];
        }
        *(void *)v4[1] = v2;
        int v5 = v6;
        *uint64_t v4 = (uint64_t)v6;
        if (v5) {
          v5[1] = (uint64_t)v4;
        }
        int v6 = v4;
        v4[1] = (uint64_t)&v6;
        ++v3;
      }
    }
    while (v2);
    if (v3 >= 1) {
      sub_10000B6E0(a1, &v6, v3);
    }
  }
}

void sub_10000A658(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 33600);
  uint64_t v6 = 0;
  unint64_t v2 = *(unsigned int *)(a1 + 33608);
  if (v2)
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = (uint64_t **)(a1 + 688);
    do
    {
      if (sub_10000B6A0(v5, *v1 + v3, 0xFFFFu)) {
        operator new();
      }
      ++v4;
      v3 += 6;
    }
    while (v4 < v2);
  }
}

void sub_10000A764(uint64_t a1)
{
  uint64_t v2 = a1 + 33616;
  if (*(_DWORD *)(a1 + 33696) == 3)
  {
    int v29 = 0;
    v28[0] = xmmword_1000219F0;
    v28[1] = unk_100021A00;
    v28[2] = xmmword_100021A10;
    int v3 = i40e_aq_set_rss_key(a1 + 33616, *(_WORD *)(a1 + 48), v28);
    if (v3)
    {
      int v4 = v3;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = qword_100028550;
        uint64_t v6 = i40e_stat_str(v2, v4);
        uint64_t v7 = i40e_aq_str(v2, *(_DWORD *)(v2 + 908));
        *(_DWORD *)buf = 136316162;
        uint64_t v31 = v5;
        __int16 v32 = 2080;
        uint64_t v33 = "config_rss";
        __int16 v34 = 1024;
        int v35 = 1280;
        __int16 v36 = 2080;
        unsigned int v37 = v6;
        __int16 v38 = 2080;
        int v39 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): i40e_aq_set_rss_key status %s, error %s\n", buf, 0x30u);
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 2377728;
    do
    {
      i40e_write_rx_ctl(v2, v9, *(_DWORD *)((char *)&xmmword_1000219F0 + v8));
      uint64_t v9 = (v9 + 128);
      v8 += 4;
    }
    while (v8 != 52);
  }
  if (*(_DWORD *)(v2 + 80) == 3) {
    unint64_t v10 = 0x80007F9FE0000000;
  }
  else {
    unint64_t v10 = 0x80007A1E80000000;
  }
  uint64_t rx_ctl = i40e_read_rx_ctl(v2, 0x245900uLL);
  uint64_t v12 = rx_ctl | (i40e_read_rx_ctl(v2, 0x245980uLL) << 32) | v10;
  i40e_write_rx_ctl(v2, 0x245900uLL, v12);
  i40e_write_rx_ctl(v2, 0x245980uLL, HIDWORD(v12));
  uint64_t v13 = *(unsigned int *)(v2 + 480);
  if (v13)
  {
    uint64_t v14 = 0;
    unsigned int v15 = *(unsigned __int8 *)(a1 + 681);
    int v16 = ~(-1 << *(_DWORD *)(v2 + 484));
    int64x2_t v17 = (int64x2_t)xmmword_1000219E0;
    uint64x2_t v18 = (uint64x2_t)vdupq_n_s64(v13 - 1);
    int64x2_t v19 = vdupq_n_s64(2uLL);
    do
    {
      int32x2_t v20 = vmovn_s64((int64x2_t)vcgeq_u64(v18, (uint64x2_t)v17));
      if (v20.i8[0]) {
        *((unsigned char *)v28 + v14) = (v14 % v15) & v16;
      }
      if (v20.i8[4]) {
        *((unsigned char *)v28 + v14 + 1) = (((int)v14 + 1) % v15) & v16;
      }
      v14 += 2;
      int64x2_t v17 = vaddq_s64(v17, v19);
    }
    while (((v13 + 1) & 0x1FFFFFFFELL) != v14);
    if (*(_DWORD *)(v2 + 80) != 3)
    {
      if (v13 >= 4)
      {
        unint64_t v21 = 0;
        int v22 = 2359296;
        do
        {
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)v2, 0, v22 & 0xFFFFFF80, *((_DWORD *)v28 + v21++));
          v22 += 128;
        }
        while (v21 < (unint64_t)*(unsigned int *)(v2 + 480) >> 2);
      }
      goto LABEL_26;
    }
  }
  else if (*(_DWORD *)(v2 + 80) != 3)
  {
LABEL_26:
    *(_DWORD *)buf = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v2, 0, 0xB612CuLL, (uint32_t *)buf);
    __dmb(1u);
    return;
  }
  int v23 = i40e_aq_set_rss_lut(v2, *(_WORD *)(a1 + 48), 1, v28, 0x200u);
  if (v23)
  {
    int v24 = v23;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = qword_100028550;
      int v26 = i40e_stat_str(v2, v24);
      __int16 v27 = i40e_aq_str(v2, *(_DWORD *)(v2 + 908));
      *(_DWORD *)buf = 136316162;
      uint64_t v31 = v25;
      __int16 v32 = 2080;
      uint64_t v33 = "config_rss";
      __int16 v34 = 1024;
      int v35 = 1345;
      __int16 v36 = 2080;
      unsigned int v37 = v26;
      __int16 v38 = 2080;
      int v39 = v27;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): i40e_aq_set_rss_lut status %s, error %s\n", buf, 0x30u);
    }
  }
}

void sub_10000AB1C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v9 = qword_100028550;
    __int16 v10 = 2080;
    int v11 = "del_default_hw_filters";
    __int16 v12 = 1024;
    int v13 = 1378;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): <==\n", buf, 0x1Cu);
  }
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v7 = 0;
  int v4 = *(_DWORD *)(v2 + 90);
  __int16 v5 = *(_WORD *)(v2 + 94);
  __int16 v6 = 0;
  LOBYTE(v7) = 1;
  i40e_aq_remove_macvlan(v2, *(_WORD *)(a1 + 50), &v4, 1, 0);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v7 = 0;
  int v4 = *(_DWORD *)(v3 + 90);
  __int16 v5 = *(_WORD *)(v3 + 94);
  __int16 v6 = 0;
  LOBYTE(v7) = 9;
  i40e_aq_remove_macvlan(v3, *(_WORD *)(a1 + 50), &v4, 1, 0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v9 = qword_100028550;
    __int16 v10 = 2080;
    int v11 = "del_default_hw_filters";
    __int16 v12 = 1024;
    int v13 = 1391;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): ==>\n", buf, 0x1Cu);
  }
}

uint64_t *sub_10000AC9C(uint64_t a1, unsigned __int8 *a2, int a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *a2;
    int v7 = a2[1];
    int v8 = a2[2];
    int v9 = a2[3];
    int v10 = a2[4];
    int v11 = a2[5];
    buf[0] = 136317442;
    *(void *)&buf[1] = qword_100028550;
    __int16 v14 = 2080;
    unsigned int v15 = "add_filter";
    __int16 v16 = 1024;
    int v17 = 1487;
    __int16 v18 = 1024;
    int v19 = v6;
    __int16 v20 = 1024;
    int v21 = v7;
    __int16 v22 = 1024;
    int v23 = v8;
    __int16 v24 = 1024;
    int v25 = v9;
    __int16 v26 = 1024;
    int v27 = v10;
    __int16 v28 = 1024;
    int v29 = v11;
    __int16 v30 = 1024;
    int v31 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): %02x:%02x:%02x:%02x:%02x:%02x, vlan %4d\n", (uint8_t *)buf, 0x46u);
  }
  uint64_t result = sub_10000B6A0((uint64_t **)(a1 + 688), (uint64_t)a2, a3);
  if (!result) {
    operator new();
  }
  return result;
}

void sub_10000AECC(uint64_t a1, uint64_t *a2, int a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v57 = qword_100028550;
    __int16 v58 = 2080;
    __int16 v59 = "add_hw_filters";
    __int16 v60 = 1024;
    int v61 = 1669;
    __int16 v62 = 1024;
    int v63 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): cnt: %d\n", buf, 0x22u);
  }
  if (a3 >= 1)
  {
    uint64_t v6 = 0;
    unsigned __int16 v38 = a3;
    uint64_t v7 = a3;
    int v8 = (__int16 *)&v57 + 2;
    int v39 = (uint64_t **)a2;
    while (1)
    {
      a2 = (uint64_t *)*a2;
      if (!a2) {
        break;
      }
      int v9 = *((_DWORD *)a2 + 4);
      *(v8 - 2) = *((_WORD *)a2 + 10);
      *((_DWORD *)v8 - 2) = v9;
      int v10 = *((unsigned __int16 *)a2 + 11);
      if (v10 == 0xFFFF)
      {
        LOWORD(v10) = 0;
        __int16 v11 = 5;
      }
      else
      {
        __int16 v11 = 1;
      }
      *(v8 - 1) = v10;
      __int16 *v8 = v11;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = *((unsigned __int8 *)a2 + 16);
        int v13 = *((unsigned __int8 *)a2 + 17);
        int v14 = *((unsigned __int8 *)a2 + 18);
        int v15 = *((unsigned __int8 *)a2 + 19);
        int v16 = *((unsigned __int8 *)a2 + 20);
        int v17 = *((unsigned __int8 *)a2 + 21);
        *(_DWORD *)unint64_t v40 = 136317186;
        uint64_t v41 = qword_100028550;
        __int16 v42 = 2080;
        uint32_t v43 = "add_hw_filters";
        __int16 v44 = 1024;
        int v45 = 1686;
        __int16 v46 = 1024;
        *(_DWORD *)__int16 v47 = v12;
        *(_WORD *)&v47[4] = 1024;
        *(_DWORD *)&v47[6] = v13;
        LOWORD(v48) = 1024;
        *(_DWORD *)((char *)&v48 + 2) = v14;
        HIWORD(v48) = 1024;
        int v49 = v15;
        __int16 v50 = 1024;
        int v51 = v16;
        __int16 v52 = 1024;
        int v53 = v17;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): %02x:%02x:%02x:%02x:%02x:%02x\n", v40, 0x40u);
      }
      ++v6;
      v8 += 8;
      if (v7 == v6) {
        goto LABEL_14;
      }
    }
    if (v7 == v6)
    {
LABEL_14:
      int v18 = i40e_aq_add_macvlan(*(void *)(a1 + 24), *(_WORD *)(a1 + 50), buf, v38, 0);
      if (v18)
      {
        int v19 = v18;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = qword_100028550;
          int v21 = i40e_stat_str(*(void *)(a1 + 24), v19);
          __int16 v22 = i40e_aq_str(*(void *)(a1 + 24), *(_DWORD *)(*(void *)(a1 + 24) + 908));
          *(_DWORD *)unint64_t v40 = 136316162;
          uint64_t v41 = v20;
          __int16 v42 = 2080;
          uint32_t v43 = "add_hw_filters";
          __int16 v44 = 1024;
          int v45 = 1705;
          __int16 v46 = 2080;
          *(void *)__int16 v47 = v21;
          *(_WORD *)&v47[8] = 2080;
          int v48 = v22;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): i40e_aq_add_macvlan status %s, error %s\n", v40, 0x30u);
        }
        int v23 = *v39;
        if (*v39)
        {
          __int16 v24 = (uint64_t *)(a1 + 688);
          int v25 = &v58;
          do
          {
            __int16 v26 = (uint64_t *)*v23;
            if (*v23) {
              v26[1] = v23[1];
            }
            *(void *)v23[1] = v26;
            if (*(unsigned __int8 *)v25 == 255)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                int v28 = *((unsigned __int8 *)v23 + 16);
                int v29 = *((unsigned __int8 *)v23 + 17);
                int v30 = *((unsigned __int8 *)v23 + 18);
                int v31 = *((unsigned __int8 *)v23 + 19);
                int v32 = *((unsigned __int8 *)v23 + 20);
                int v33 = *((unsigned __int8 *)v23 + 21);
                int v34 = *((__int16 *)v23 + 11);
                *(_DWORD *)unint64_t v40 = 136317442;
                uint64_t v41 = qword_100028550;
                __int16 v42 = 2080;
                uint32_t v43 = "add_hw_filters";
                __int16 v44 = 1024;
                int v45 = 1713;
                __int16 v46 = 1024;
                *(_DWORD *)__int16 v47 = v28;
                *(_WORD *)&v47[4] = 1024;
                *(_DWORD *)&v47[6] = v29;
                LOWORD(v48) = 1024;
                *(_DWORD *)((char *)&v48 + 2) = v30;
                HIWORD(v48) = 1024;
                int v49 = v31;
                __int16 v50 = 1024;
                int v51 = v32;
                __int16 v52 = 1024;
                int v53 = v33;
                __int16 v54 = 1024;
                int v55 = v34;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): filter %02x:%02x:%02x:%02x:%02x:%02x VTAG: %d not added\n", v40, 0x46u);
              }
              operator delete();
            }
            uint64_t v27 = *v24;
            *int v23 = *v24;
            if (v27) {
              *(void *)(v27 + 8) = v23;
            }
            *(void *)(a1 + 688) = v23;
            v23[1] = (uint64_t)v24;
            ++*(_WORD *)(a1 + 698);
            v25 += 8;
            int v23 = v26;
          }
          while (v26);
        }
        return;
      }
      int v35 = *(void **)(a1 + 688);
      __int16 v36 = *v39;
      if (v35)
      {
        if (v36)
        {
          do
          {
            unsigned int v37 = v35;
            int v35 = (void *)*v35;
          }
          while (v35);
          *unsigned int v37 = v36;
          goto LABEL_41;
        }
      }
      else
      {
        unsigned int v37 = (void *)(a1 + 688);
        *(void *)(a1 + 688) = v36;
        if (v36)
        {
          __int16 v36 = *v39;
LABEL_41:
          v36[1] = (uint64_t)v37;
          *int v39 = 0;
        }
      }
      *(_WORD *)(a1 + 698) += v38;
      return;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unint64_t v40 = 136316162;
      uint64_t v41 = qword_100028550;
      __int16 v42 = 2080;
      uint32_t v43 = "add_hw_filters";
      __int16 v44 = 1024;
      int v45 = 1692;
      __int16 v46 = 1024;
      *(_DWORD *)__int16 v47 = v7;
      *(_WORD *)&v47[4] = 1024;
      *(_DWORD *)&v47[6] = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): ERROR: list of filters to short expected: %d, found: %d\n", v40, 0x28u);
    }
    if (*v39) {
      operator delete();
    }
    *int v39 = 0;
  }
}

void sub_10000B414(uint64_t a1, unsigned __int8 *a2)
{
  if (*(unsigned __int16 *)(a1 + 33592) - 257 > 0xFFFFFEFF)
  {
    uint64_t v19 = 0;
    if (!sub_10000B6A0((uint64_t **)(a1 + 688), (uint64_t)a2, 0)) {
      operator new();
    }
    uint64_t v4 = 0;
    uint64_t v5 = 832;
    while (1)
    {
      unint64_t v6 = *(void *)(a1 + v5);
      if (v6) {
        break;
      }
      v4 -= 64;
      v5 += 8;
      if (v4 == -4096) {
        goto LABEL_33;
      }
    }
    uint64_t v7 = __clz(__rbit64(v6)) - v4;
    if (v7 > 0xFFF)
    {
LABEL_33:
      sub_10000AECC(a1, &v19, 0);
      return;
    }
    unint64_t v8 = v7;
    while (1)
    {
      if (!sub_10000B6A0((uint64_t **)(a1 + 688), (uint64_t)a2, v8)) {
        operator new();
      }
      if (v8 == 4095) {
        goto LABEL_33;
      }
      unint64_t v9 = (v8 + 1) >> 6;
      uint64_t v10 = (v9 << 6);
      __int16 v11 = (unint64_t *)(a1 + 832 + 8 * v9);
      if (((v8 + 1) & 0x3F) == 0) {
        break;
      }
      unint64_t v12 = *v11 & ~(0xFFFFFFFFFFFFFFFFLL >> -((v8 + 1) & 0x3F));
      if (v12)
      {
        unint64_t v8 = v10 | __clz(__rbit64(v12));
      }
      else
      {
        if ((unint64_t)(v10 - 4032) < 0x41) {
          goto LABEL_33;
        }
        uint64_t v10 = (v10 + 64);
        ++v11;
        unint64_t v13 = 4096 - v10;
        if (v9 <= 0x3E) {
          goto LABEL_22;
        }
LABEL_26:
        if (v13)
        {
          unint64_t v16 = *v11 & (0xFFFFFFFFFFFFFFFFLL >> -(char)v13);
          BOOL v15 = v16 == 0;
          int v17 = v10 + v13;
          int v18 = v10 + __clz(__rbit64(v16));
          if (v15) {
            LODWORD(v10) = v17;
          }
          else {
            LODWORD(v10) = v18;
          }
        }
        unint64_t v8 = (int)v10;
      }
LABEL_32:
      if (v8 >= 0x1000) {
        goto LABEL_33;
      }
    }
    unint64_t v13 = 4096 - v10;
LABEL_22:
    int v14 = -(int)v10;
    while (!*v11)
    {
      v13 -= 64;
      ++v11;
      v14 -= 64;
      if (v13 <= 0x3F)
      {
        LODWORD(v10) = -v14;
        goto LABEL_26;
      }
    }
    unint64_t v8 = (int)(__clz(__rbit64(*v11)) - v14);
    goto LABEL_32;
  }
  sub_10000AC9C(a1, a2, -1);
}

uint64_t *sub_10000B6A0(uint64_t **a1, uint64_t a2, unsigned __int16 a3)
{
  for (uint64_t result = *a1; result; uint64_t result = (uint64_t *)*result)
  {
    BOOL v4 = *((_DWORD *)result + 4) == *(_DWORD *)a2 && *((unsigned __int16 *)result + 10) == *(unsigned __int16 *)(a2 + 4);
    if (v4 && *((unsigned __int16 *)result + 11) == a3) {
      break;
    }
  }
  return result;
}

void sub_10000B6E0(uint64_t a1, uint64_t **a2, unsigned int a3)
{
  uint64_t v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v51 = qword_100028550;
    __int16 v52 = 2080;
    int v53 = "del_hw_filters";
    __int16 v54 = 1024;
    int v55 = 1734;
    __int16 v56 = 1024;
    unsigned int v57 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): cnt: %d\n", buf, 0x22u);
  }
  int v33 = a3;
  unint64_t v6 = *a2;
  if (*a2)
  {
    uint64_t v7 = *v6;
    int v8 = *((_DWORD *)v6 + 4);
    LOWORD(v51) = *((_WORD *)v6 + 10);
    *(_DWORD *)buf = v8;
    BYTE4(v51) = 1;
    int v9 = *((unsigned __int16 *)v6 + 11);
    if (v9 == 0xFFFF) {
      char v10 = 9;
    }
    else {
      char v10 = 1;
    }
    BYTE4(v51) = v10;
    if (v9 == 0xFFFF) {
      LOWORD(v9) = 0;
    }
    WORD1(v51) = v9;
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    uint64_t v12 = v7;
    if (v11)
    {
      int v13 = *((unsigned __int8 *)v6 + 16);
      int v14 = *((unsigned __int8 *)v6 + 17);
      int v15 = *((unsigned __int8 *)v6 + 18);
      int v16 = *((unsigned __int8 *)v6 + 19);
      int v17 = *((unsigned __int8 *)v6 + 20);
      int v18 = *((unsigned __int8 *)v6 + 21);
      *(_DWORD *)int v34 = 136317186;
      uint64_t v35 = qword_100028550;
      __int16 v36 = 2080;
      unsigned int v37 = "del_hw_filters";
      __int16 v38 = 1024;
      int v39 = 1749;
      __int16 v40 = 1024;
      *(_DWORD *)uint64_t v41 = v13;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)&v41[6] = v14;
      LOWORD(v42) = 1024;
      *(_DWORD *)((char *)&v42 + 2) = v15;
      HIWORD(v42) = 1024;
      int v43 = v16;
      __int16 v44 = 1024;
      int v45 = v17;
      __int16 v46 = 1024;
      int v47 = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): %02x:%02x:%02x:%02x:%02x:%02x\n", v34, 0x40u);
      uint64_t v12 = *v6;
    }
    if (v12) {
      *(void *)(v12 + 8) = v6[1];
    }
    *(void *)v6[1] = v12;
    operator delete();
  }
  if (v5 || *a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v34 = 136316162;
      uint64_t v35 = qword_100028550;
      __int16 v36 = 2080;
      unsigned int v37 = "del_hw_filters";
      __int16 v38 = 1024;
      int v39 = 1758;
      __int16 v40 = 1024;
      *(_DWORD *)uint64_t v41 = a3;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)&v41[6] = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): ERROR: wrong size of list of filters, expected: %d, found: %d\n", v34, 0x28u);
    }
    if (*a2) {
      operator delete();
    }
    *a2 = 0;
  }
  else
  {
    int v19 = i40e_aq_remove_macvlan(*(void *)(a1 + 24), *(_WORD *)(a1 + 50), buf, (unsigned __int16)a3, 0);
    if (v19)
    {
      int v20 = v19;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = qword_100028550;
        __int16 v22 = i40e_stat_str(*(void *)(a1 + 24), v20);
        int v23 = i40e_aq_str(*(void *)(a1 + 24), *(_DWORD *)(*(void *)(a1 + 24) + 908));
        *(_DWORD *)int v34 = 136316162;
        uint64_t v35 = v21;
        __int16 v36 = 2080;
        unsigned int v37 = "del_hw_filters";
        __int16 v38 = 1024;
        int v39 = 1765;
        __int16 v40 = 2080;
        *(void *)uint64_t v41 = v22;
        *(_WORD *)&v41[8] = 2080;
        __int16 v42 = v23;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): i40e_aq_remove_macvlan status %s, error %s\n", v34, 0x30u);
      }
      if (v33 >= 1)
      {
        __int16 v24 = (unsigned __int16 *)&v51 + 1;
        do
        {
          if (*((unsigned char *)v24 + 6) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            int v25 = *((unsigned __int8 *)v24 - 6);
            int v26 = *((unsigned __int8 *)v24 - 5);
            int v27 = *((unsigned __int8 *)v24 - 4);
            int v28 = *((unsigned __int8 *)v24 - 3);
            int v29 = *((unsigned __int8 *)v24 - 2);
            int v30 = *((unsigned __int8 *)v24 - 1);
            int v31 = *v24;
            *(_DWORD *)int v34 = 136317442;
            uint64_t v35 = qword_100028550;
            __int16 v36 = 2080;
            unsigned int v37 = "del_hw_filters";
            __int16 v38 = 1024;
            int v39 = 1769;
            __int16 v40 = 1024;
            *(_DWORD *)uint64_t v41 = v25;
            *(_WORD *)&v41[4] = 1024;
            *(_DWORD *)&v41[6] = v26;
            LOWORD(v42) = 1024;
            *(_DWORD *)((char *)&v42 + 2) = v27;
            HIWORD(v42) = 1024;
            int v43 = v28;
            __int16 v44 = 1024;
            int v45 = v29;
            __int16 v46 = 1024;
            int v47 = v30;
            __int16 v48 = 1024;
            int v49 = v31;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Filter does not exist %02x:%02x:%02x:%02x:%02x:%02x VTAG: %d\n", v34, 0x46u);
          }
          v24 += 8;
          --v5;
        }
        while (v5);
      }
    }
    *(_WORD *)(a1 + 698) -= v33;
  }
}

void sub_10000BBD4(uint64_t a1, unsigned __int8 *a2, int a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *a2;
    int v7 = a2[1];
    int v8 = a2[2];
    int v9 = a2[3];
    int v10 = a2[4];
    int v11 = a2[5];
    *(_DWORD *)int v19 = 136317442;
    *(void *)&v19[4] = qword_100028550;
    __int16 v20 = 2080;
    uint64_t v21 = "del_filter";
    __int16 v22 = 1024;
    int v23 = 1588;
    __int16 v24 = 1024;
    int v25 = v6;
    __int16 v26 = 1024;
    int v27 = v7;
    __int16 v28 = 1024;
    int v29 = v8;
    __int16 v30 = 1024;
    int v31 = v9;
    __int16 v32 = 1024;
    int v33 = v10;
    __int16 v34 = 1024;
    int v35 = v11;
    __int16 v36 = 1024;
    int v37 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): %02x:%02x:%02x:%02x:%02x:%02x, vlan %4d\n", v19, 0x46u);
  }
  uint64_t v12 = sub_10000B6A0((uint64_t **)(a1 + 688), (uint64_t)a2, a3);
  if (v12)
  {
    int v13 = v12;
    uint64_t v14 = *v12;
    if (*v12) {
      *(void *)(v14 + 8) = v12[1];
    }
    *(void *)v12[1] = v14;
    *uint64_t v12 = 0;
    v12[1] = (uint64_t)v19;
    *(void *)int v19 = v12;
    if (*((__int16 *)v12 + 11) == -1 && (v12[3] & 1) != 0) {
      --*(_WORD *)(a1 + 696);
    }
    if (a3 == -1 || *(_WORD *)(a1 + 33592))
    {
      sub_10000B6E0(a1, (uint64_t **)v19, 1u);
    }
    else
    {
      int v15 = sub_10000B6A0((uint64_t **)(a1 + 688), (uint64_t)a2, 0);
      if (v15)
      {
        uint64_t v16 = *v15;
        if (*v15) {
          *(void *)(v16 + 8) = v15[1];
        }
        *(void *)v15[1] = v16;
        uint64_t v17 = *v13;
        uint64_t *v15 = *v13;
        if (v17) {
          *(void *)(*v13 + 8) = v15;
        }
        *int v13 = (uint64_t)v15;
        v15[1] = (uint64_t)v13;
        unsigned int v18 = 2;
      }
      else
      {
        unsigned int v18 = 1;
      }
      sub_10000B6E0(a1, (uint64_t **)v19, v18);
      sub_10000AC9C(a1, a2, -1);
    }
  }
}

void sub_10000BDD4(uint64_t a1, unsigned __int8 *a2)
{
  int v35 = 0;
  BOOL v4 = *(void **)(a1 + 688);
  if (v4)
  {
    signed int v5 = 0;
    do
    {
      while (1)
      {
        int v6 = v4;
        BOOL v4 = (void *)*v4;
        if ((v6[3] & 2) == 0
          && *((_DWORD *)v6 + 4) == *(_DWORD *)a2
          && *((unsigned __int16 *)v6 + 10) == *((unsigned __int16 *)a2 + 2))
        {
          break;
        }
        if (!v4) {
          goto LABEL_17;
        }
      }
      if (v4) {
        v4[1] = v6[1];
      }
      *(void *)v6[1] = v4;
      int v8 = v35;
      *int v6 = v35;
      if (v8) {
        v8[1] = (uint64_t)v6;
      }
      int v35 = v6;
      v6[1] = &v35;
      ++v5;
    }
    while (v4);
  }
  else
  {
    signed int v5 = 0;
  }
LABEL_17:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *a2;
    int v10 = a2[1];
    int v11 = a2[2];
    int v12 = a2[3];
    int v13 = a2[4];
    int v14 = a2[5];
    int v15 = 136317442;
    uint64_t v16 = qword_100028550;
    __int16 v17 = 2080;
    unsigned int v18 = "del_all_vlan_filters";
    __int16 v19 = 1024;
    int v20 = 1638;
    __int16 v21 = 1024;
    int v22 = v9;
    __int16 v23 = 1024;
    int v24 = v10;
    __int16 v25 = 1024;
    int v26 = v11;
    __int16 v27 = 1024;
    int v28 = v12;
    __int16 v29 = 1024;
    int v30 = v13;
    __int16 v31 = 1024;
    int v32 = v14;
    __int16 v33 = 1024;
    signed int v34 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): %02x:%02x:%02x:%02x:%02x:%02x, to_del_cnt: %d\n", (uint8_t *)&v15, 0x46u);
  }
  if (v5 >= 1) {
    sub_10000B6E0(a1, &v35, v5);
  }
}

void i40e_allocate_virt_mem()
{
}

uint64_t i40e_free_virt_mem(uint64_t a1, void *a2)
{
  if (*a2) {
    operator delete[]();
  }
  *a2 = 0;
  return 0;
}

uint64_t i40e_allocate_dma_mem(IOService **a1, uint64_t a2, int a3, uint64_t capacity)
{
  int v6 = *a1;
  uint32_t segmentsCount = 1;
  uint64_t flags = 0;
  int v7 = (IOBufferMemoryDescriptor **)(a2 + 24);
  if (IOBufferMemoryDescriptor::Create(3uLL, capacity, IOVMPageSize, (IOBufferMemoryDescriptor **)(a2 + 24))) {
    goto LABEL_5;
  }
  if (IOBufferMemoryDescriptor::GetAddressRange(*v7, &range)) {
    sub_10001CDF0();
  }
  *(void *)a2 = range.address;
  specification.options = 0;
  memset(specification._resv, 0, sizeof(specification._resv));
  specification.maxAddressBits = 64;
  if (IODMACommand::Create(v6, 0, &specification, (IODMACommand **)(a2 + 16))
    || (uint64_t result = IODMACommand::PrepareForDMA(*(IODMACommand **)(a2 + 16), 0, *v7, 0, 0, &flags, &segmentsCount, &range, 0), result))
  {
LABEL_5:
    int v9 = *(IODMACommand **)(a2 + 16);
    if (v9)
    {
      IODMACommand::CompleteDMA(v9, 0, 0);
      uint64_t v10 = *(void *)(a2 + 16);
      if (v10)
      {
        (*(void (**)(uint64_t))(*(void *)v10 + 16))(v10);
        *(void *)(a2 + 16) = 0;
      }
    }
    if (*v7)
    {
      ((void (*)(IOBufferMemoryDescriptor *))(*v7)->release)(*v7);
      *int v7 = 0;
    }
    uint64_t result = 4294967278;
  }
  else
  {
    *(void *)(a2 + 8) = range.address;
  }
  *(void *)(a2 + 32) = capacity;
  return result;
}

uint64_t i40e_free_dma_mem(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(IODMACommand **)(a2 + 16);
  if (v3)
  {
    IODMACommand::CompleteDMA(v3, 0, 0);
    uint64_t v4 = *(void *)(a2 + 16);
    if (v4)
    {
      (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
      *(void *)(a2 + 16) = 0;
    }
  }
  uint64_t v5 = *(void *)(a2 + 24);
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
    *(void *)(a2 + 24) = 0;
  }
  return 0;
}

uint64_t i40e_calculate_l2fpm_size(int a1, int a2, int a3, int a4)
{
  return ((a4 << 6)
        + (((a3 << 6)
          + (((32 * a2) + (((a1 << 7) + 511) & 0x1FFFFFE00) + 511) & 0x3FFFFFE00)
          + 511) & 0x7FFFFFE00)
        + 511) & 0xFFFFFFE00;
}

void i40e_init_lan_hmc(uint64_t a1)
{
  *(_DWORD *)(a1 + 1016) = 1213027143;
  *(unsigned char *)(a1 + 1020) = *(unsigned char *)(a1 + 642);
  i40e_allocate_virt_mem();
}

uint64_t i40e_create_lan_hmc_object(IOService **a1, uint64_t a2)
{
  if (!a2)
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): %s\n", "i40e_create_lan_hmc_object", 294, "i40e_create_lan_hmc_object: bad info ptr\n");
    }
    return 4294967277;
  }
  uint64_t v3 = *(void *)a2;
  if (!*(void *)a2)
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): %s\n", "i40e_create_lan_hmc_object", 299, "i40e_create_lan_hmc_object: bad hmc_info ptr\n");
    }
    return 4294967277;
  }
  if (*(_DWORD *)v3 != 1213027143)
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): %s\n", "i40e_create_lan_hmc_object", 304, "i40e_create_lan_hmc_object: bad signature\n");
    }
    return 4294967277;
  }
  uint64_t v4 = *(void *)(v3 + 8);
  unsigned int v6 = *(_DWORD *)(a2 + 8);
  uint64_t v5 = *(unsigned int *)(a2 + 12);
  uint64_t v7 = v4 + 24 * v6;
  unsigned int v8 = *(_DWORD *)(v7 + 12);
  if (v5 < v8)
  {
    uint64_t v9 = *(unsigned int *)(a2 + 16);
    if ((int)v9 + (int)v5 > v8)
    {
      uint64_t v10 = 4294967246;
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): i40e_create_lan_hmc_object: returns error %d\n\n", "i40e_create_lan_hmc_object", 318, -50);
      }
      return v10;
    }
    uint64_t v12 = *(void *)(v4 + 24 * v6 + 16);
    unint64_t v13 = *(void *)v7 + v12 * v5;
    unint64_t v14 = v13 + v12 * v9 - 1;
    unsigned int v15 = (v14 >> 21) + 1;
    unsigned int v16 = *(_DWORD *)(v3 + 48);
    if (v16 <= (v13 >> 21) || v15 > v16) {
      return 4294967251;
    }
    uint64_t v18 = *(void *)(a2 + 24);
    if (!v18) {
      uint64_t v18 = 0x200000;
    }
    uint64_t v46 = v18;
    if (v15 <= (v13 >> 21)) {
      return 0;
    }
    unint64_t v42 = v13 >> 21;
    uint64_t v20 = 0;
    unint64_t v44 = v13 >> 12;
    uint64_t v45 = (v14 >> 21) + 1;
    unsigned int v43 = (v14 >> 12) + 1;
    uint64_t v21 = (v13 >> 21);
    while (1)
    {
      uint64_t v22 = i40e_add_sd_table_entry(a1, *(void *)a2, v21, *(_DWORD *)(a2 + 20), v46);
      if (v22)
      {
        uint64_t v10 = v22;
        if (v21 > v42)
        {
          do
          {
            uint64_t v37 = *(void *)a2;
            uint64_t v38 = v21 - 1;
            int v39 = *(_DWORD *)(*(void *)(*(void *)a2 + 56) + 80 * (v21 - 1));
            if (v39 == 2)
            {
              sub_10000CC04((IOPCIDevice **)a1, v37, v21 - 1);
            }
            else if (v39 == 1)
            {
              if (v44 <= v38 << 9) {
                unsigned int v40 = v38 << 9;
              }
              else {
                unsigned int v40 = v44;
              }
              if (v43 >= v21 << 9) {
                unsigned int v41 = v21 << 9;
              }
              else {
                unsigned int v41 = v43;
              }
              if (v40 < v41)
              {
                do
                  i40e_remove_pd_bp((IOPCIDevice **)a1, *(void *)a2, v40++);
                while (v40 < v41);
                uint64_t v37 = *(void *)a2;
              }
              sub_10000CB90((IOPCIDevice **)a1, v37, v38);
            }
            else
            {
              uint64_t v10 = 4294967249;
            }
            uint64_t v21 = v38;
          }
          while (v38 > v42);
        }
        return v10;
      }
      uint64_t v23 = *(void *)(*(void *)a2 + 56);
      int v24 = (_DWORD *)(v23 + 80 * v21);
      if (*v24 != 1)
      {
        uint64_t v10 = 0;
        uint64_t v29 = v20;
        goto LABEL_48;
      }
      if (v44 <= v21 << 9) {
        unsigned int v25 = v21 << 9;
      }
      else {
        unsigned int v25 = v44;
      }
      if (v43 >= (v21 << 9) + 512) {
        unsigned int v26 = (v21 << 9) + 512;
      }
      else {
        unsigned int v26 = v43;
      }
      unsigned int v27 = v25;
      if (v25 >= v26)
      {
LABEL_41:
        uint64_t v10 = 0;
        uint64_t v29 = 0;
        if ((v20 & 1) == 0) {
          goto LABEL_48;
        }
      }
      else
      {
        while (1)
        {
          uint64_t v28 = i40e_add_pd_table_entry(a1, *(void *)a2, v27, 0);
          if (v28) {
            break;
          }
          if (++v27 >= v26) {
            goto LABEL_41;
          }
        }
        uint64_t v10 = v28;
      }
      while (v27 > v25)
        i40e_remove_pd_bp((IOPCIDevice **)a1, *(void *)a2, --v27);
      uint64_t v29 = 1;
LABEL_48:
      uint64_t v30 = v23 + 80 * v21;
      int v32 = *(unsigned __int8 *)(v30 + 4);
      __int16 v31 = (unsigned char *)(v30 + 4);
      if (!v32)
      {
        *__int16 v31 = 1;
        if (*v24 == 2)
        {
          uint32_t v35 = *(_DWORD *)(v23 + 80 * v21 + 28);
          uint32_t v36 = *(_DWORD *)(v23 + 80 * v21 + 24) | 0x803;
          __dmb(2u);
          IOPCIDevice::MemoryWrite32((IOPCIDevice *)*a1, 0, 0xC0200uLL, v35);
          __dmb(2u);
          IOPCIDevice::MemoryWrite32((IOPCIDevice *)*a1, 0, 0xC0100uLL, v36);
          __dmb(2u);
        }
        else
        {
          if (*v24 != 1) {
            return 4294967249;
          }
          uint32_t v33 = *(_DWORD *)(v23 + 80 * v21 + 20);
          uint32_t v34 = *(_DWORD *)(v23 + 80 * v21 + 16) | 0x801;
          __dmb(2u);
          IOPCIDevice::MemoryWrite32((IOPCIDevice *)*a1, 0, 0xC0200uLL, v33);
          __dmb(2u);
          IOPCIDevice::MemoryWrite32((IOPCIDevice *)*a1, 0, 0xC0100uLL, v34);
          __dmb(2u);
        }
        IOPCIDevice::MemoryWrite32((IOPCIDevice *)*a1, 0, 0xC0000uLL, v21 | 0x80000000);
      }
      ++v21;
      uint64_t v20 = v29;
      if (v21 == v45) {
        return v10;
      }
    }
  }
  uint64_t v10 = 4294967247;
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): i40e_create_lan_hmc_object: returns error %d\n\n", "i40e_create_lan_hmc_object", 311, -49);
  }
  return v10;
}

uint64_t sub_10000CB90(IOPCIDevice **a1, uint64_t a2, unsigned int a3)
{
  if (i40e_prep_remove_pd_page(a2, a3)) {
    return 0;
  }
  return i40e_remove_pd_page_new(a1, a2, a3, 1);
}

uint64_t sub_10000CC04(IOPCIDevice **a1, uint64_t a2, unsigned int a3)
{
  if (i40e_prep_remove_sd_bp(a2, a3)) {
    return 0;
  }
  return i40e_remove_sd_bp_new(a1, a2, a3, 1);
}

uint64_t i40e_configure_lan_hmc(uint64_t a1, unsigned int a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 1020);
  v12[0] = a1 + 1016;
  v12[1] = 0;
  uint64_t v14 = *(void *)(*(void *)(a1 + 1024) + 16);
  if (a2 >= 2)
  {
    if (a2 != 2)
    {
      uint64_t v6 = 4294967249;
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): i40e_configure_lan_hmc: Unknown SD type: %d\n\n", "i40e_configure_lan_hmc", 480, -47);
      }
      return v6;
    }
  }
  else
  {
    uint64_t v13 = 0x200000001;
    uint64_t lan_hmc_object = i40e_create_lan_hmc_object((IOService **)a1, (uint64_t)v12);
    uint64_t v6 = lan_hmc_object;
    if (a2 || !lan_hmc_object)
    {
      if (!lan_hmc_object) {
        goto LABEL_8;
      }
      return v6;
    }
  }
  uint64_t v13 = 0x100000001;
  uint64_t v6 = i40e_create_lan_hmc_object((IOService **)a1, (uint64_t)v12);
  if (!v6)
  {
LABEL_8:
    uint64_t v7 = *(void *)(a1 + 1024);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (4 * v3 + 811520), (*(_DWORD *)(v7 + 24) >> 9) & 0x7FFF);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (4 * v3 + 811776), *(_DWORD *)(v7 + 36));
    uint64_t v8 = *(void *)(a1 + 1024);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (4 * v3 + 812032), (*(_DWORD *)(v8 + 48) >> 9) & 0x7FFF);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (4 * v3 + 812288), *(_DWORD *)(v8 + 60));
    uint64_t v9 = *(void *)(a1 + 1024);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (4 * v3 + 812544), (*(_DWORD *)(v9 + 72) >> 9) & 0x7FFF);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (4 * v3 + 812800), *(_DWORD *)(v9 + 84));
    uint64_t v10 = *(void *)(a1 + 1024);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (4 * v3 + 813056), (*(_DWORD *)(v10 + 96) >> 9) & 0x7FFF);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (4 * v3 + 813312), *(_DWORD *)(v10 + 108));
    return 0;
  }
  return v6;
}

uint64_t i40e_delete_lan_hmc_object(IOPCIDevice **a1, _DWORD *a2)
{
  if (!a2)
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): %s\n", "i40e_delete_lan_hmc_object", 535, "i40e_delete_hmc_object: bad info ptr\n");
    }
    return 4294967277;
  }
  uint64_t v3 = *(void *)a2;
  if (!*(void *)a2)
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): %s\n", "i40e_delete_lan_hmc_object", 540, "i40e_delete_hmc_object: bad info->hmc_info ptr\n");
    }
    return 4294967277;
  }
  if (*(_DWORD *)v3 != 1213027143)
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): %s\n", "i40e_delete_lan_hmc_object", 545, "i40e_delete_hmc_object: bad hmc_info->signature\n");
    }
    return 4294967277;
  }
  if (!*(void *)(v3 + 56))
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): %s\n", "i40e_delete_lan_hmc_object", 551, "i40e_delete_hmc_object: bad sd_entry\n");
    }
    return 4294967277;
  }
  uint64_t v4 = *(void *)(v3 + 8);
  if (!v4)
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): %s\n", "i40e_delete_lan_hmc_object", 557, "i40e_delete_hmc_object: bad hmc_info->hmc_obj\n");
    }
    return 4294967277;
  }
  unsigned int v6 = a2[2];
  uint64_t v5 = a2[3];
  uint64_t v7 = v4 + 24 * v6;
  unsigned int v8 = *(_DWORD *)(v7 + 12);
  if (v5 >= v8)
  {
    uint64_t v10 = 4294967247;
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): i40e_delete_hmc_object: returns error %d\n\n", "i40e_delete_lan_hmc_object", 563, -49);
    }
  }
  else
  {
    uint64_t v9 = a2[4];
    if ((int)v9 + (int)v5 <= v8)
    {
      uint64_t v13 = *(void *)(v4 + 24 * v6 + 16);
      unint64_t v14 = *(void *)v7 + v13 * v5;
      uint64_t v15 = v13 * v9;
      unint64_t v16 = v14 >> 12;
      unsigned int v17 = ((v13 * v9 + v14 - 1) >> 12) + 1;
      if (v17 <= (v14 >> 12))
      {
LABEL_30:
        unint64_t v22 = v14 >> 21;
        unsigned int v23 = ((v15 + v14 - 1) >> 21) + 1;
        unsigned int v24 = *(_DWORD *)(v3 + 48);
        if (v24 <= (v14 >> 21) || v23 > v24)
        {
          return 4294967251;
        }
        else
        {
          if (v23 > v22)
          {
            for (uint64_t i = 80 * (v14 >> 21); ; i += 80)
            {
              uint64_t v27 = *(void *)a2;
              uint64_t v28 = *(void *)(*(void *)a2 + 56);
              if (*(unsigned char *)(v28 + i + 4))
              {
                int v29 = *(_DWORD *)(v28 + i);
                if (v29 == 1)
                {
                  uint64_t v19 = sub_10000CB90(a1, v27, v22);
                  if (v19) {
                    return v19;
                  }
                }
                else if (v29 == 2)
                {
                  uint64_t v19 = sub_10000CC04(a1, v27, v22);
                  if (v19) {
                    return v19;
                  }
                }
              }
              uint64_t v10 = 0;
              LODWORD(v22) = v22 + 1;
              if (v23 == v22) {
                return v10;
              }
            }
          }
          return 0;
        }
      }
      else
      {
        while (1)
        {
          uint64_t v18 = *(void *)(*(void *)a2 + 56);
          if (*(_DWORD *)(v18 + 80 * (v16 >> 9)) == 1)
          {
            if (*(unsigned char *)(*(void *)(v18 + 80 * (v16 >> 9) + 48) + ((v16 & 0x1FF) << 6) + 61))
            {
              uint64_t v19 = i40e_remove_pd_bp(a1, *(void *)a2, v16);
              if (v19) {
                return v19;
              }
            }
          }
          LODWORD(v16) = v16 + 1;
          if (v17 == v16)
          {
            uint64_t v3 = *(void *)a2;
            uint64_t v20 = (void *)(*(void *)(*(void *)a2 + 8) + 24 * a2[2]);
            uint64_t v21 = v20[2];
            unint64_t v14 = *v20 + v21 * a2[3];
            uint64_t v15 = v21 * a2[4];
            goto LABEL_30;
          }
        }
      }
    }
    else
    {
      uint64_t v10 = 4294967246;
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): i40e_delete_hmc_object: returns error %d\n\n", "i40e_delete_lan_hmc_object", 571, -50);
      }
    }
  }
  return v10;
}

uint64_t i40e_shutdown_lan_hmc(uint64_t a1)
{
  v4[0] = a1 + 1016;
  v4[1] = 0;
  int v5 = 1;
  uint64_t v2 = i40e_delete_lan_hmc_object((IOPCIDevice **)a1, v4);
  i40e_free_virt_mem(a1, (void *)(a1 + 1048));
  *(_DWORD *)(a1 + 1064) = 0;
  *(void *)(a1 + 1072) = 0;
  i40e_free_virt_mem(a1, (void *)(a1 + 1032));
  *(void *)(a1 + 1024) = 0;
  return v2;
}

uint64_t i40e_get_lan_tx_queue_context(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v4 = sub_10000D280(a1, &v6, 1u, a2);
  if ((v4 & 0x80000000) == 0) {
    sub_10000D41C(v6, (uint64_t)&unk_100028000, a3);
  }
  return v4;
}

uint64_t sub_10000D280(uint64_t a1, uint64_t *a2, unsigned int a3, unsigned int a4)
{
  uint64_t v4 = *(void *)(a1 + 1024);
  if (!v4)
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): %s\n", "i40e_hmc_get_object_va", 1216, "i40e_hmc_get_object_va: bad hmc_info->hmc_obj ptr\n");
    }
    return 4294967277;
  }
  if (!a2)
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): %s\n", "i40e_hmc_get_object_va", 1221, "i40e_hmc_get_object_va: bad object_base ptr\n");
    }
    return 4294967277;
  }
  if (*(_DWORD *)(a1 + 1016) != 1213027143)
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): %s\n", "i40e_hmc_get_object_va", 1226, "i40e_hmc_get_object_va: bad hmc_info->signature\n");
    }
    return 4294967277;
  }
  if (*(_DWORD *)(v4 + 24 * a3 + 12) <= a4)
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): i40e_hmc_get_object_va: returns error %d\n\n", "i40e_hmc_get_object_va", 1231, 0);
    }
    return 4294967247;
  }
  else
  {
    unint64_t v5 = *(void *)(v4 + 24 * a3) + *(void *)(v4 + 24 * a3 + 16) * a4;
    uint64_t v6 = *(void *)(a1 + 1072);
    unsigned int v7 = v5 >> 21;
    uint64_t result = 0;
    if (*(_DWORD *)(v6 + 80 * v7) == 1) {
      uint64_t v9 = *(void *)(*(void *)(v6 + 80 * v7 + 48) + (((v5 >> 12) & 0x1FF) << 6) + 8) + (v5 & 0xFFF);
    }
    else {
      uint64_t v9 = *(void *)(v6 + 80 * v7 + 16) + (v5 & 0x1FFFFF);
    }
    *a2 = v9;
  }
  return result;
}

uint64_t sub_10000D41C(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(unsigned __int16 *)(a2 + 4);
  if (*(_WORD *)(a2 + 4))
  {
    uint64_t v4 = (unsigned __int16 *)(a2 + 6);
    do
    {
      switch(*(v4 - 2))
      {
        case 1u:
          *(unsigned char *)(a3 + *(v4 - 3)) = (*(unsigned __int8 *)(result + ((unint64_t)*v4 >> 3)) & ~(~(-1 << v3) << (*v4 & 7))) >> (*v4 & 7);
          break;
        case 2u:
          *(_WORD *)(a3 + *(v4 - 3)) = (*(unsigned __int16 *)(result + ((unint64_t)*v4 >> 3)) & ~(~(-1 << v3) << (*v4 & 7))) >> (*v4 & 7);
          break;
        case 4u:
          if (v3 < 0x20) {
            unsigned int v5 = ~(-1 << v3);
          }
          else {
            unsigned int v5 = -1;
          }
          *(_DWORD *)(a3 + *(v4 - 3)) = (*(_DWORD *)(result + ((unint64_t)*v4 >> 3)) & ~(v5 << (*v4 & 7))) >> (*v4 & 7);
          break;
        case 8u:
          if (v3 < 0x40) {
            uint64_t v6 = ~(-1 << v3);
          }
          else {
            uint64_t v6 = -1;
          }
          *(void *)(a3 + *(v4 - 3)) = (*(void *)(result + ((unint64_t)*v4 >> 3)) & (unint64_t)~(v6 << (*v4 & 7))) >> (*v4 & 7);
          break;
        default:
          break;
      }
      unsigned int v3 = v4[3];
      v4 += 4;
    }
    while (v3);
  }
  return result;
}

uint64_t i40e_clear_lan_tx_queue_context(uint64_t a1, unsigned int a2)
{
  unsigned int v5 = 0;
  uint64_t v3 = sub_10000D280(a1, (uint64_t *)&v5, 1u, a2);
  if ((v3 & 0x80000000) == 0) {
    bzero(v5, *(unsigned int *)(*(void *)(a1 + 1024) + 40));
  }
  return v3;
}

uint64_t i40e_set_lan_tx_queue_context(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v4 = sub_10000D280(a1, &v6, 1u, a2);
  if ((v4 & 0x80000000) == 0) {
    sub_10000D608(v6, (uint64_t)&unk_100028000, a3);
  }
  return v4;
}

uint64_t sub_10000D608(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(unsigned __int16 *)(a2 + 4);
  if (*(_WORD *)(a2 + 4))
  {
    uint64_t v4 = (unsigned __int16 *)(a2 + 6);
    do
    {
      switch(*(v4 - 2))
      {
        case 1u:
          unint64_t v5 = *v4;
          *(unsigned char *)(result + (v5 >> 3)) = *(unsigned char *)(result + (v5 >> 3)) & ~(~(-1 << v3) << (v5 & 7)) | ((*(unsigned char *)(a3 + *(v4 - 3)) & ~(-1 << v3)) << (v5 & 7));
          break;
        case 2u:
          unint64_t v6 = *v4;
          *(_WORD *)(result + (v6 >> 3)) = *(_WORD *)(result + (v6 >> 3)) & ~(~(unsigned __int16)(-1 << v3) << (v6 & 7)) | ((*(_WORD *)(a3 + *(v4 - 3)) & (unsigned __int16)~(unsigned __int16)(-1 << v3)) << (v6 & 7));
          break;
        case 4u:
          if (v3 < 0x20) {
            unsigned int v7 = ~(-1 << v3);
          }
          else {
            unsigned int v7 = -1;
          }
          *(_DWORD *)(result + ((unint64_t)*v4 >> 3)) = *(_DWORD *)(result + ((unint64_t)*v4 >> 3)) & ~(v7 << (*v4 & 7)) | ((v7 & *(_DWORD *)(a3 + *(v4 - 3))) << (*v4 & 7));
          break;
        case 8u:
          if (v3 < 0x40) {
            uint64_t v8 = ~(-1 << v3);
          }
          else {
            uint64_t v8 = -1;
          }
          *(void *)(result + ((unint64_t)*v4 >> 3)) = *(void *)(result + ((unint64_t)*v4 >> 3)) & ~(v8 << (*v4 & 7)) | ((v8 & *(void *)(a3 + *(v4 - 3))) << (*v4 & 7));
          break;
        default:
          break;
      }
      unsigned int v3 = v4[3];
      v4 += 4;
    }
    while (v3);
  }
  return result;
}

uint64_t i40e_get_lan_rx_queue_context(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v4 = sub_10000D280(a1, &v6, 2u, a2);
  if ((v4 & 0x80000000) == 0) {
    sub_10000D41C(v6, (uint64_t)&unk_100028098, a3);
  }
  return v4;
}

uint64_t i40e_clear_lan_rx_queue_context(uint64_t a1, unsigned int a2)
{
  unint64_t v5 = 0;
  uint64_t v3 = sub_10000D280(a1, (uint64_t *)&v5, 2u, a2);
  if ((v3 & 0x80000000) == 0) {
    bzero(v5, *(unsigned int *)(*(void *)(a1 + 1024) + 64));
  }
  return v3;
}

uint64_t i40e_set_lan_rx_queue_context(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v4 = sub_10000D280(a1, &v6, 2u, a2);
  if ((v4 & 0x80000000) == 0) {
    sub_10000D608(v6, (uint64_t)&unk_100028098, a3);
  }
  return v4;
}

uint64_t i40e_get_dcbx_status(IOPCIDevice **a1, _WORD *a2)
{
  if (!a2) {
    return 4294967291;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x83020uLL, &readData);
  uint64_t result = 0;
  __dmb(1u);
  *a2 = readData & 7;
  return result;
}

uint64_t i40e_lldp_to_dcb_config(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 4294967291;
  if (a1 && a2)
  {
    unsigned int v5 = *(unsigned __int16 *)(a1 + 14);
    uint64_t v3 = a1 + 14;
    unsigned int v4 = v5;
    unsigned int v6 = __rev16(v5);
    if (v6 >= 0x200)
    {
      LOWORD(v7) = v6 & 0x1FF;
      unsigned __int16 v8 = (v6 & 0x1FF) + 2;
      do
      {
        if ((unsigned __int16)((unsigned __int16)v6 >> 9) >= 0x7Fu)
        {
          unsigned int v9 = *(_DWORD *)(v3 + 2);
          unsigned int v10 = bswap32(v9 & 0xFFFFFF) >> 8;
          if (v10 == 6945)
          {
            BOOL v16 = HIBYTE(v9) == 2;
            unsigned int v17 = bswap32(v4 & 0xFFFFFF01) >> 16;
            BOOL v18 = v16 && v17 >= 0x13;
            if (v18)
            {
              unsigned int v19 = 0;
              uint64_t v20 = (unsigned char *)(v3 + 18);
              do
              {
                unsigned int v21 = *(unsigned __int16 *)v20;
                unsigned int v22 = bswap32(v21);
                unsigned int v23 = v22 >> 25;
                if (v22 >> 25 == 4)
                {
                  unsigned int v28 = bswap32(v21 & 0xFFFFFF01) >> 16;
                  LODWORD(v29) = (10923 * v28) >> 16;
                  *(_DWORD *)(a2 + 4) = v29;
                  if (v28 >= 6)
                  {
                    if (v28 >= 0xC6)
                    {
                      LODWORD(v29) = 32;
                      *(_DWORD *)(a2 + 4) = 32;
                    }
                    uint64_t v30 = 0;
                    uint64_t v31 = 0;
                    int v32 = v20 + 6;
                    if (v29 <= 1) {
                      uint64_t v29 = 1;
                    }
                    else {
                      uint64_t v29 = v29;
                    }
                    do
                    {
                      uint64_t v33 = 0;
                      uint32_t v34 = (unsigned __int16 *)&v32[v30];
                      do
                      {
                        if (((unint64_t)v32[v30 + 5] >> v33)) {
                          break;
                        }
                        ++v33;
                      }
                      while (v33 != 8);
                      uint64_t v35 = a2 + 4 * v31;
                      *(unsigned char *)(v35 + 70) = v33;
                      int v36 = v34[1] & 3;
                      if ((v34[1] & 3) != 0)
                      {
                        if (v36 == 1) {
                          LOBYTE(v36) = 2;
                        }
                      }
                      else
                      {
                        LOBYTE(v36) = 1;
                      }
                      *(unsigned char *)(v35 + 71) = v36;
                      *(_WORD *)(v35 + 72) = bswap32(*v34) >> 16;
                      v30 += 6;
                      ++v31;
                    }
                    while (v31 != v29);
                  }
                }
                else if (v23 == 3)
                {
                  if ((v20[4] & 0x40) != 0) {
                    *(unsigned char *)(a2 + 66) = 1;
                  }
                  *(unsigned char *)(a2 + 69) = v20[6];
                  *(unsigned char *)(a2 + 68) = v20[7];
                }
                else
                {
                  if (v23 != 2) {
                    break;
                  }
                  if ((v20[4] & 0x40) != 0) {
                    *(unsigned char *)(a2 + 12) = 1;
                  }
                  uint64_t v24 = 0;
                  unsigned int v25 = v20 + 6;
                  *(unsigned char *)(a2 + 13) = 0;
                  unsigned int v26 = (unsigned char *)(a2 + 16);
                  do
                  {
                    *(v26 - 1) = v25[v24] >> 4;
                    *unsigned int v26 = v25[v24] & 0xF;
                    v26 += 2;
                    ++v24;
                  }
                  while (v24 != 4);
                  for (uint64_t i = 0; i != 8; ++i)
                  {
                    *(unsigned char *)(a2 + i + 23) = v20[i + 10];
                    *(unsigned char *)(a2 + i + 31) = 2 * (*(unsigned char *)(a2 + i + 15) != 15);
                  }
                  *(unsigned char *)(a2 + 14) = v20[18];
                }
                v20 += (HIWORD(v22) & 0x1FF) + 2;
                BOOL v18 = v19++ >= 2;
              }
              while (!v18);
            }
          }
          else if (v10 == 32962)
          {
            switch(HIBYTE(v9))
            {
              case 9u:
                uint64_t v11 = 0;
                *(unsigned char *)(a2 + 12) = *(unsigned char *)(v3 + 6) >> 7;
                *(unsigned char *)(a2 + 13) = (*(unsigned char *)(v3 + 6) & 0x40) != 0;
                *(unsigned char *)(a2 + 14) = *(unsigned char *)(v3 + 6) & 7;
                uint64_t v12 = v3 + 7;
                uint64_t v13 = (unsigned char *)(a2 + 16);
                do
                {
                  *(v13 - 1) = (*(unsigned char *)(v12 + v11) >> 4) & 7;
                  *uint64_t v13 = *(unsigned char *)(v12 + v11) & 7;
                  v13 += 2;
                  ++v11;
                }
                while (v11 != 4);
                for (uint64_t j = 0; j != 8; ++j)
                  *(unsigned char *)(a2 + 23 + j) = *(unsigned char *)(v3 + 11 + j);
                for (uint64_t k = 0; k != 8; ++k)
                  *(unsigned char *)(a2 + 31 + k) = *(unsigned char *)(v3 + 19 + k);
                break;
              case 0xAu:
                uint64_t v37 = 0;
                uint64_t v38 = v3 + 7;
                int v39 = (unsigned char *)(a2 + 43);
                do
                {
                  *(v39 - 1) = (*(unsigned char *)(v38 + v37) >> 4) & 7;
                  *int v39 = *(unsigned char *)(v38 + v37) & 7;
                  v39 += 2;
                  ++v37;
                }
                while (v37 != 4);
                for (uint64_t m = 0; m != 8; ++m)
                  *(unsigned char *)(a2 + 50 + m) = *(unsigned char *)(v3 + 11 + m);
                for (uint64_t n = 0; n != 8; ++n)
                  *(unsigned char *)(a2 + 58 + n) = *(unsigned char *)(v3 + 19 + n);
                break;
              case 0xBu:
                *(unsigned char *)(a2 + 66) = *(unsigned char *)(v3 + 6) >> 7;
                *(unsigned char *)(a2 + 67) = (*(unsigned char *)(v3 + 6) & 0x40) != 0;
                *(unsigned char *)(a2 + 68) = *(unsigned char *)(v3 + 6) & 0xF;
                *(unsigned char *)(a2 + 69) = *(unsigned char *)(v3 + 7);
                break;
              case 0xCu:
                uint64_t v42 = 0;
                uint64_t v43 = 0;
                unint64_t v44 = (unsigned __int16)((bswap32(v4 & 0xFFFFFF01) >> 16) - 5);
                uint64_t v45 = v3 + 7;
                uint64_t v46 = (_WORD *)(a2 + 72);
                do
                {
                  if (v42 + 1 >= v44) {
                    break;
                  }
                  *((unsigned char *)v46 - 2) = *(unsigned char *)(v45 + v42) >> 5;
                  *((unsigned char *)v46 - 1) = *(unsigned char *)(v45 + v42) & 7;
                  *uint64_t v46 = bswap32(*(unsigned __int16 *)(v45 + v42 + 1)) >> 16;
                  v46 += 2;
                  ++v43;
                  v42 += 3;
                }
                while (v43 != 32);
                *(_DWORD *)(a2 + 4) = v43;
                break;
              default:
                break;
            }
          }
        }
        uint64_t v2 = 0;
        uint64_t v47 = v3 + (unsigned __int16)v7;
        unsigned int v48 = *(unsigned __int16 *)(v47 + 2);
        uint64_t v3 = v47 + 2;
        unsigned int v4 = v48;
        unsigned int v6 = __rev16(v48);
        if (v6 < 0x200) {
          break;
        }
        unsigned int v7 = (bswap32(v4) >> 16) & 0x1FF;
        v8 += v7 + 2;
      }
      while (v8 < 0x5DDuLL);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void i40e_aq_get_dcb_config()
{
}

uint64_t i40e_get_dcb_config(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 80) != 1) {
    goto LABEL_19;
  }
  unsigned int v2 = *(unsigned __int16 *)(a1 + 892);
  if (v2 != 4)
  {
    if (v2 > 3) {
      goto LABEL_19;
    }
LABEL_16:
    sub_10000E134(a1);
  }
  unsigned int v3 = *(unsigned __int16 *)(a1 + 894);
  if (v3 < 0x21) {
    goto LABEL_16;
  }
  if (v3 == 33)
  {
    uint64_t result = i40e_aq_get_cee_dcb_config(a1, &v28, 0x18u, 0);
    if (!result)
    {
      uint64_t v5 = 0;
      *(unsigned char *)(a1 + 1084) = 1;
      unsigned __int16 v6 = v32;
      *(_DWORD *)(a1 + 1092) = v32;
      unsigned int v7 = HIWORD(v31);
      char v8 = v29[0];
      *(unsigned char *)(a1 + 1098) = v29[0];
      unsigned int v9 = (unsigned char *)(a1 + 1100);
      do
      {
        unsigned int v10 = v29[v5 + 1];
        *(v9 - 1) = v10 & 0xF;
        *unsigned int v9 = v10 >> 4;
        v9 += 2;
        ++v5;
      }
      while (v5 != 4);
      uint64_t v11 = 0;
      *(void *)(a1 + 1107) = *(void *)&v30[2];
      char v12 = v8 - 1;
      do
      {
        uint64_t v13 = a1 + v11;
        if (*(unsigned char *)(a1 + v11 + 1099) == 15)
        {
          char v14 = 0;
          *(unsigned char *)(v13 + 1099) = v12;
        }
        else
        {
          char v14 = 2;
        }
        *(unsigned char *)(v13 + 1115) = v14;
        ++v11;
      }
      while (v11 != 8);
      *(unsigned char *)(a1 + 1153) = v30[10];
      *(unsigned char *)(a1 + 1152) = 8;
      uint64_t result = 0;
      if ((v6 & 0x400) == 0)
      {
        *(_DWORD *)(a1 + 1088) = 3;
        *(unsigned char *)(a1 + 1154) = v7 & 7;
        *(_WORD *)(a1 + 1156) = -30458;
        *(unsigned char *)(a1 + 1158) = (v7 >> 3) & 7;
        *(unsigned char *)(a1 + 1159) = 2;
        *(_WORD *)(a1 + 1160) = 3260;
        *(unsigned char *)(a1 + 1155) = 1;
        *(unsigned char *)(a1 + 1162) = BYTE1(v7) & 7;
        *(unsigned char *)(a1 + 1163) = 1;
        *(_WORD *)(a1 + 1164) = -30444;
      }
    }
    goto LABEL_35;
  }
LABEL_19:
  uint64_t result = i40e_aq_get_cee_dcb_config(a1, &v28, 0x20u, 0);
  if (!result)
  {
    uint64_t v15 = 0;
    *(unsigned char *)(a1 + 1084) = 1;
    int v16 = v31;
    *(_DWORD *)(a1 + 1092) = v31;
    unsigned int v17 = *(unsigned __int16 *)&v30[9];
    char v18 = v28;
    *(unsigned char *)(a1 + 1098) = v28;
    unsigned int v19 = (unsigned char *)(a1 + 1100);
    do
    {
      unsigned int v20 = v29[v15];
      *(v19 - 1) = v20 & 0xF;
      unsigned char *v19 = v20 >> 4;
      v19 += 2;
      ++v15;
    }
    while (v15 != 4);
    uint64_t v21 = 0;
    *(void *)(a1 + 1107) = *(void *)v30;
    char v22 = v18 - 1;
    do
    {
      uint64_t v23 = a1 + v21;
      if (*(unsigned char *)(a1 + v21 + 1099) == 15)
      {
        char v24 = 0;
        *(unsigned char *)(v23 + 1099) = v22;
      }
      else
      {
        char v24 = 2;
      }
      *(unsigned char *)(v23 + 1115) = v24;
      ++v21;
    }
    while (v21 != 8);
    *(unsigned char *)(a1 + 1153) = v30[8];
    *(unsigned char *)(a1 + 1152) = 8;
    if ((v16 & 0x700) == 0x300)
    {
      *(unsigned char *)(a1 + 1154) = v17 & 7;
      unsigned int v25 = 1;
      *(unsigned char *)(a1 + 1155) = 1;
      *(_WORD *)(a1 + 1156) = -30458;
    }
    else
    {
      unsigned int v25 = 0;
    }
    if ((v16 & 0x3800) == 0x1800)
    {
      uint64_t v26 = a1 + 4 * v25;
      *(unsigned char *)(v26 + 1154) = (v17 >> 3) & 7;
      *(unsigned char *)(v26 + 1155) = 2;
      *(_WORD *)(v26 + 1156) = 3260;
      ++v25;
    }
    if ((v16 & 0x70000) == 0x30000)
    {
      uint64_t v27 = a1 + 4 * v25;
      *(unsigned char *)(v27 + 1154) = BYTE1(v17) & 7;
      *(unsigned char *)(v27 + 1155) = 1;
      *(_WORD *)(v27 + 1156) = -30444;
      ++v25;
    }
    uint64_t result = 0;
    *(_DWORD *)(a1 + 1088) = v25;
  }
LABEL_35:
  if (*(_DWORD *)(a1 + 908) == 2) {
    sub_10000E134(a1);
  }
  if (!result) {
    i40e_aq_get_dcb_config();
  }
  return result;
}

void sub_10000E134(uint64_t a1)
{
  *(unsigned char *)(a1 + 1084) = 2;
  i40e_aq_get_dcb_config();
}

uint64_t i40e_init_dcb(uint64_t a1, int a2)
{
  if (!*(unsigned char *)(a1 + 444)) {
    return 4294967232;
  }
  if ((*(unsigned char *)(a1 + 1688) & 0x20) != 0)
  {
    int v4 = *(_DWORD *)(a1 + 80);
    if (v4 == 1)
    {
      __int16 v5 = 43;
LABEL_10:
      if (i40e_read_nvm_module_data(a1, 0x48u, v5, 1, 1, v9)) {
        return 4294967233;
      }
      goto LABEL_11;
    }
    if (v4 == 3)
    {
      __int16 v5 = 49;
      goto LABEL_10;
    }
    return 4294967232;
  }
  if (i40e_read_lldp_cfg(a1, v8)) {
    return 4294967233;
  }
LABEL_11:
  if (((v9[0] >> (4 * *(unsigned char *)(a1 + 185))) & 0xF) == 0)
  {
    *(_WORD *)(a1 + 1080) = 7;
    return 4294967233;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x83020uLL, &readData);
  __dmb(1u);
  uint32_t v7 = readData & 7;
  *(_WORD *)(a1 + 1080) = v7;
  if (v7 - 1 >= 2)
  {
    if (v7 != 7)
    {
      if (!a2) {
        return 0;
      }
      return i40e_aq_cfg_lldp_mib_change_event(a1, 1, 0);
    }
    return 4294967233;
  }
  uint64_t result = i40e_get_dcb_config(a1);
  if (!result && (a2 & 1) != 0) {
    return i40e_aq_cfg_lldp_mib_change_event(a1, 1, 0);
  }
  return result;
}

uint64_t i40e_read_lldp_cfg(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967291;
  }
  uint64_t v4 = i40e_acquire_nvm(a1, 1);
  if (!v4)
  {
    int v8 = 0;
    uint64_t v4 = i40e_aq_read_nvm(a1, 0, 0, 4u, &v8, 1, 0);
    i40e_release_nvm(a1);
    if (!v4)
    {
      if ((v8 & 0x1000) != 0)
      {
        int v5 = 72;
        int v6 = 49;
      }
      else
      {
        int v5 = 15;
        int v6 = 6;
      }
      return sub_10000E774(a1, a2, v5, v6);
    }
  }
  return v4;
}

uint64_t i40e_get_fw_lldp_status(uint64_t a1, uint64_t a2)
{
  if (a2) {
    i40e_allocate_virt_mem();
  }
  return 4294967291;
}

void i40e_set_dcb_config()
{
}

uint64_t i40e_dcb_config_to_lldp(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  unsigned __int16 v3 = 0;
  for (unsigned int i = 3; ; ++i)
  {
    switch(i)
    {
      case 3u:
        uint64_t v5 = 0;
        *(_WORD *)a1 = 6654;
        *(_DWORD *)(a1 + 2) = 163741696;
        *(unsigned char *)(a1 + 6) = *(unsigned char *)(a3 + 14) & 7 | ((*(unsigned char *)(a3 + 12) != 0) << 7);
        int v6 = (char *)(a3 + 16);
        do
        {
          char v7 = *(v6 - 1);
          char v8 = *v6;
          v6 += 2;
          *(unsigned char *)(a1 + 7 + v5++) = v8 & 0xF | (16 * v7);
        }
        while (v5 != 4);
        for (uint64_t j = 0; j != 8; ++j)
          *(unsigned char *)(a1 + 11 + j) = *(unsigned char *)(a3 + 23 + j);
        for (uint64_t k = 0; k != 8; ++k)
          *(unsigned char *)(a1 + 19 + k) = *(unsigned char *)(a3 + 31 + k);
        break;
      case 4u:
        uint64_t v11 = 0;
        *(_WORD *)a1 = 6654;
        *(_DWORD *)(a1 + 2) = 180518912;
        char v12 = (char *)(a3 + 43);
        do
        {
          char v13 = *(v12 - 1);
          char v14 = *v12;
          v12 += 2;
          *(unsigned char *)(a1 + 7 + v11++) = v14 & 0xF | (16 * v13);
        }
        while (v11 != 4);
        for (uint64_t m = 0; m != 8; ++m)
          *(unsigned char *)(a1 + 11 + m) = *(unsigned char *)(a3 + 50 + m);
        for (uint64_t n = 0; n != 8; ++n)
          *(unsigned char *)(a1 + 19 + n) = *(unsigned char *)(a3 + 58 + n);
        break;
      case 5u:
        *(_WORD *)a1 = 1790;
        *(_DWORD *)(a1 + 2) = 197296128;
        if (*(unsigned char *)(a3 + 66))
        {
          char v17 = 0x80;
          *(unsigned char *)(a1 + 6) = 0x80;
        }
        else
        {
          char v17 = *(unsigned char *)(a1 + 6);
        }
        if (*(unsigned char *)(a3 + 67))
        {
          v17 |= 0x40u;
          *(unsigned char *)(a1 + 6) = v17;
        }
        *(unsigned char *)(a1 + 6) = *(unsigned char *)(a3 + 68) & 0xF | v17;
        *(unsigned char *)(a1 + 7) = *(unsigned char *)(a3 + 69);
        break;
      case 6u:
        if (*(_DWORD *)(a3 + 4))
        {
          uint64_t v18 = 0;
          *(_DWORD *)(a1 + 2) = 214073344;
          unsigned int v19 = (unsigned char *)(a1 + 9);
          unsigned int v20 = (char *)(a3 + 72);
          while (*(_DWORD *)(a3 + 4) > v18)
          {
            *(v19 - 2) = *(v20 - 1) & 7 | (32 * *(v20 - 2));
            *(v19 - 1) = v20[1];
            char v21 = *v20;
            v20 += 4;
            unsigned char *v19 = v21;
            v19 += 3;
            if (++v18 == 32) {
              goto LABEL_29;
            }
          }
          LODWORD(v18) = v18;
LABEL_29:
          *(_WORD *)a1 = __rev16((3 * v18 + 5) | 0xFE00);
        }
        break;
      default:
        break;
    }
    unsigned int v22 = *(_WORD *)a1 & 0xFF01;
    unsigned int v23 = bswap32(v22) >> 16;
    __int16 v24 = v23 + 2;
    if (!v22) {
      __int16 v24 = 0;
    }
    v3 += v24;
    if (i > 5 || v3 > 0x5DCu) {
      break;
    }
    uint64_t v25 = a1 + v23 + 2;
    if ((_WORD)v22) {
      a1 = v25;
    }
  }
  *a2 = v3;
  return 0;
}

uint64_t sub_10000E774(uint64_t a1, void *a2, int a3, int a4)
{
  nvuint64_t m = i40e_acquire_nvm(a1, 1);
  if (!nvm)
  {
    unsigned __int16 v12 = 0;
    nvuint64_t m = i40e_aq_read_nvm(a1, 0, 2 * a3, 2u, &v12, 1, 0);
    i40e_release_nvm(a1);
    if (!nvm)
    {
      if ((v12 & 0x8000u) == 0) {
        int v9 = 2 * (v12 & 0x7FFF);
      }
      else {
        int v9 = (v12 & 0x7FFF) << 12;
      }
      nvuint64_t m = i40e_acquire_nvm(a1, 1);
      if (!nvm)
      {
        nvuint64_t m = i40e_aq_read_nvm(a1, a3, 2 * a4, 2u, &v12, 1, 0);
        i40e_release_nvm(a1);
        if (!nvm)
        {
          int v10 = v12;
          nvuint64_t m = i40e_acquire_nvm(a1, 1);
          if (!nvm)
          {
            nvuint64_t m = i40e_aq_read_nvm(a1, 0, v9 + 2 * (v10 + a4), 0xEu, a2, 1, 0);
            i40e_release_nvm(a1);
          }
        }
      }
    }
  }
  return nvm;
}

void sub_10000E8A8(uint64_t a1)
{
  uint32_t v3 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 33616), 0, 0x38780uLL, &v3);
  __dmb(1u);
  uint32_t v2 = v3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v3 = 136315906;
    uint64_t v4 = qword_100028550;
    __int16 v5 = 2080;
    int v6 = "legacyIntrHandler";
    __int16 v7 = 1024;
    int v8 = 15;
    __int16 v9 = 1024;
    uint32_t v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): icr0=%x\n", (uint8_t *)&v3, 0x22u);
  }
  sub_10000797C(a1);
}

void sub_10000E980(uint64_t a1)
{
  uint32_t v9 = 0;
  uint32_t v2 = (IOPCIDevice **)(a1 + 33616);
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 33616), 0, 0x38780uLL, &v9);
  __dmb(1u);
  uint32_t v3 = v9;
  uint32_t v9 = 0;
  IOPCIDevice::MemoryRead32(*v2, 0, 0x38800uLL, &v9);
  __dmb(1u);
  uint32_t v4 = v9;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v9 = 136316162;
    uint64_t v10 = qword_100028550;
    __int16 v11 = 2080;
    unsigned __int16 v12 = "otherIntrHandler";
    __int16 v13 = 1024;
    int v14 = 42;
    __int16 v15 = 1024;
    LODWORD(v16[0]) = v3;
    WORD2(v16[0]) = 1024;
    *(_DWORD *)((char *)v16 + 6) = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): reg=%x, mask=%x\n", (uint8_t *)&v9, 0x28u);
    if ((v3 & 0x40000000) == 0)
    {
LABEL_3:
      if ((v3 & 0x80000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((v3 & 0x40000000) == 0)
  {
    goto LABEL_3;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v9 = 136315650;
    uint64_t v10 = qword_100028550;
    __int16 v11 = 2080;
    unsigned __int16 v12 = "otherIntrHandler";
    __int16 v13 = 1024;
    int v14 = 47;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Admin queue interrupt\n", (uint8_t *)&v9, 0x1Cu);
  }
  LOWORD(v9) = 0;
  sub_100009760(a1, &v9);
  if ((v3 & 0x80000) == 0)
  {
LABEL_4:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_13;
  }
LABEL_10:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v9 = 136315650;
    uint64_t v10 = qword_100028550;
    __int16 v11 = 2080;
    unsigned __int16 v12 = "otherIntrHandler";
    __int16 v13 = 1024;
    int v14 = 56;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Malicious programming\n", (uint8_t *)&v9, 0x1Cu);
  }
  sub_10000A0C0(a1);
  if ((v3 & 0x100000) != 0)
  {
LABEL_13:
    uint32_t v9 = 0;
    IOPCIDevice::MemoryRead32(*v2, 0, 0xB8188uLL, &v9);
    __dmb(1u);
    unint64_t v5 = (((unint64_t)v9 >> 2) & 3) - 1;
    if (v5 > 2) {
      int v6 = "POR";
    }
    else {
      int v6 = off_100024498[v5];
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v9 = 136315906;
      uint64_t v10 = qword_100028550;
      __int16 v11 = 2080;
      unsigned __int16 v12 = "otherIntrHandler";
      __int16 v13 = 1024;
      int v14 = 81;
      __int16 v15 = 2080;
      v16[0] = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Reset Requested! (%s)\n", (uint8_t *)&v9, 0x26u);
    }
  }
LABEL_18:
  if ((v3 & 0x10000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v9 = 136315650;
    uint64_t v10 = qword_100028550;
    __int16 v11 = 2080;
    unsigned __int16 v12 = "otherIntrHandler";
    __int16 v13 = 1024;
    int v14 = 92;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): ECC Error detected!\n", (uint8_t *)&v9, 0x1Cu);
  }
  if ((v3 & 0x200000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v9 = 136315650;
    uint64_t v10 = qword_100028550;
    __int16 v11 = 2080;
    unsigned __int16 v12 = "otherIntrHandler";
    __int16 v13 = 1024;
    int v14 = 94;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): PCI Exception detected!\n", (uint8_t *)&v9, 0x1Cu);
  }
  if ((v3 & 0x10000000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v9 = 136315650;
    uint64_t v10 = qword_100028550;
    __int16 v11 = 2080;
    unsigned __int16 v12 = "otherIntrHandler";
    __int16 v13 = 1024;
    int v14 = 96;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Critical Protocol Engine Error detected!\n", (uint8_t *)&v9, 0x1Cu);
  }
  if ((v3 & 0x4000000) != 0)
  {
    uint32_t v9 = 0;
    IOPCIDevice::MemoryRead32(*v2, 0, 0xC0400uLL, &v9);
    __dmb(1u);
    uint32_t v7 = v9;
    if ((v9 & 0x80000000) != 0)
    {
      uint32_t v9 = 0;
      IOPCIDevice::MemoryRead32(*v2, 0, 0xC0500uLL, &v9);
      __dmb(1u);
      uint32_t v8 = v9;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*v2, 0, 0xC0400uLL, 0);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v9 = 136316162;
        uint64_t v10 = qword_100028550;
        __int16 v11 = 2080;
        unsigned __int16 v12 = "otherIntrHandler";
        __int16 v13 = 1024;
        int v14 = 109;
        __int16 v15 = 1024;
        LODWORD(v16[0]) = v7;
        WORD2(v16[0]) = 1024;
        *(_DWORD *)((char *)v16 + 6) = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): HMC Error detected! INFO 0x%08x DATA 0x%08x\n", (uint8_t *)&v9, 0x28u);
      }
    }
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*v2, 0, 0x38800uLL, v4);
  sub_10000797C(a1);
}

void sub_10000EF14(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16) == 2)
  {
    char v2 = 0;
    char v3 = 0;
    do
    {
      __dmb(1u);
      int v4 = sub_100010668(a1, 0);
      int v5 = sub_100002D34(a1, 0);
      v2 |= v4 != 0;
      v3 |= v5 != 0;
    }
    while (v4 | v5);
    if (v2) {
      IODataQueueDispatchSource::SendDataAvailable(*(IODataQueueDispatchSource **)(a1 + 656));
    }
    if (v3) {
      IODataQueueDispatchSource::SendDataAvailable(*(IODataQueueDispatchSource **)(a1 + 344));
    }
    sub_100009270((IOPCIDevice **)(a1 + 33616), 0);
  }
}

uint64_t i40e_alloc_adminq_asq_ring(uint64_t a1)
{
  uint64_t dma_mem = i40e_allocate_dma_mem((IOService **)a1, a1 + 784, 4, 32 * *(unsigned __int16 *)(a1 + 886));
  if (!dma_mem) {
    i40e_allocate_virt_mem();
  }
  return dma_mem;
}

uint64_t i40e_alloc_adminq_arq_ring(uint64_t a1)
{
  return i40e_allocate_dma_mem((IOService **)a1, a1 + 672, 3, 32 * *(unsigned __int16 *)(a1 + 884));
}

uint64_t i40e_free_adminq_asq(uint64_t a1)
{
  i40e_free_virt_mem(a1, (void *)(a1 + 824));
  return i40e_free_dma_mem(a1, a1 + 784);
}

uint64_t i40e_free_adminq_arq(uint64_t a1)
{
  return i40e_free_dma_mem(a1, a1 + 672);
}

uint64_t i40e_init_asq(uint64_t a1)
{
  if (*(_WORD *)(a1 + 848)) {
    return 4294967233;
  }
  if (!*(_WORD *)(a1 + 886) || !*(_WORD *)(a1 + 890)) {
    return 4294967292;
  }
  *(_DWORD *)(a1 + 852) = 0;
  uint64_t v1 = i40e_alloc_adminq_asq_ring(a1);
  if (!v1) {
    i40e_allocate_virt_mem();
  }
  return v1;
}

uint64_t sub_10000F20C(uint64_t a1)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 856), 0);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 860), 0);
  int v2 = *(_DWORD *)(a1 + 80);
  if (v2 != 2 && v2 != 4)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 864), *(unsigned __int16 *)(a1 + 886) | 0x80000000);
    int v2 = *(_DWORD *)(a1 + 80);
  }
  if (v2 == 4 || v2 == 2)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 864), *(unsigned __int16 *)(a1 + 886) | 0x80000000);
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 872), *(_DWORD *)(a1 + 792));
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 868), *(_DWORD *)(a1 + 796));
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 872), &readData);
  __dmb(1u);
  if (readData == *(_DWORD *)(a1 + 792)) {
    return 0;
  }
  else {
    return 4294967243;
  }
}

uint64_t sub_10000F31C(uint64_t a1)
{
  unsigned int v2 = *(unsigned __int16 *)(a1 + 886);
  if (*(_WORD *)(a1 + 886))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = *(void *)(a1 + 840) + v3;
      if (*(void *)(v5 + 8))
      {
        i40e_free_dma_mem(a1, v5);
        unsigned int v2 = *(unsigned __int16 *)(a1 + 886);
      }
      ++v4;
      v3 += 40;
    }
    while (v4 < v2);
  }
  i40e_free_virt_mem(a1, (void *)(a1 + 824));
  i40e_free_dma_mem(a1, a1 + 784);
  return i40e_free_virt_mem(a1, (void *)(a1 + 768));
}

uint64_t i40e_init_arq(uint64_t a1)
{
  if (*(_WORD *)(a1 + 736)) {
    return 4294967233;
  }
  uint64_t v2 = *(unsigned __int16 *)(a1 + 884);
  if (!*(_WORD *)(a1 + 884) || !*(_WORD *)(a1 + 888)) {
    return 4294967292;
  }
  *(_DWORD *)(a1 + 740) = 0;
  uint64_t dma_mem = i40e_allocate_dma_mem((IOService **)a1, a1 + 672, 3, 32 * v2);
  if (!dma_mem) {
    i40e_allocate_virt_mem();
  }
  return dma_mem;
}

uint64_t sub_10000F574(uint64_t a1)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 744), 0);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 748), 0);
  int v2 = *(_DWORD *)(a1 + 80);
  if (v2 != 2 && v2 != 4)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 752), *(unsigned __int16 *)(a1 + 884) | 0x80000000);
    int v2 = *(_DWORD *)(a1 + 80);
  }
  if (v2 == 4 || v2 == 2)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 752), *(unsigned __int16 *)(a1 + 884) | 0x80000000);
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 760), *(_DWORD *)(a1 + 680));
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 756), *(_DWORD *)(a1 + 684));
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 748), *(unsigned __int16 *)(a1 + 884) - 1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 760), &readData);
  __dmb(1u);
  if (readData == *(_DWORD *)(a1 + 680)) {
    return 0;
  }
  else {
    return 4294967243;
  }
}

uint64_t i40e_shutdown_asq(uint64_t a1)
{
  uint64_t v2 = a1 + 904;
  i40e_acquire_spinlock(a1 + 904);
  if (*(_WORD *)(a1 + 848))
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 856), 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 860), 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 864), 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 872), 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 868), 0);
    *(_WORD *)(a1 + 848) = 0;
    sub_10000F31C(a1);
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 4294967233;
  }
  i40e_release_spinlock(v2);
  return v3;
}

uint64_t i40e_shutdown_arq(uint64_t a1)
{
  uint64_t v2 = a1 + 905;
  i40e_acquire_spinlock(a1 + 905);
  if (*(_WORD *)(a1 + 736))
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 744), 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 748), 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 752), 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 760), 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 756), 0);
    *(_WORD *)(a1 + 736) = 0;
    if (*(_WORD *)(a1 + 884))
    {
      uint64_t v3 = 0;
      unint64_t v4 = 0;
      do
      {
        i40e_free_dma_mem(a1, *(void *)(a1 + 728) + v3);
        ++v4;
        v3 += 40;
      }
      while (v4 < *(unsigned __int16 *)(a1 + 884));
    }
    i40e_free_dma_mem(a1, a1 + 672);
    i40e_free_virt_mem(a1, (void *)(a1 + 656));
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 4294967233;
  }
  i40e_release_spinlock(v2);
  return v5;
}

uint64_t i40e_init_adminq(uint64_t a1)
{
  int v13 = 0;
  int v14 = 0;
  __int16 v12 = 0;
  if (!*(_WORD *)(a1 + 884) || !*(_WORD *)(a1 + 886) || !*(_WORD *)(a1 + 888) || !*(_WORD *)(a1 + 890)) {
    return 4294967292;
  }
  i40e_init_spinlock(a1 + 904);
  i40e_init_spinlock(a1 + 905);
  long long v2 = xmmword_100021A30;
  long long v3 = xmmword_100021A40;
  int v4 = *(_DWORD *)(a1 + 80);
  int v5 = 27648;
  int v6 = 31744;
  if (v4 != 2 && v4 != 4)
  {
    long long v2 = xmmword_100021A50;
    long long v3 = xmmword_100021A60;
    int v5 = 524416;
    int v6 = 0x80000;
  }
  *(_DWORD *)(a1 + 872) = v6;
  *(_OWORD *)(a1 + 856) = v2;
  *(_DWORD *)(a1 + 760) = v5;
  *(_OWORD *)(a1 + 744) = v3;
  *(_DWORD *)(a1 + 880) = 250000;
  uint64_t inited = i40e_init_asq(a1);
  if (inited) {
    goto LABEL_11;
  }
  uint64_t inited = i40e_init_arq(a1);
  if (inited)
  {
LABEL_10:
    i40e_shutdown_asq(a1);
LABEL_11:
    i40e_destroy_spinlock(a1 + 904);
    i40e_destroy_spinlock(a1 + 905);
    return inited;
  }
  int v9 = *(_DWORD *)(a1 + 80);
  if (v9 != 2 && v9 != 4)
  {
    int v10 = 10;
    while (1)
    {
      firmware_versiouint64_t n = i40e_aq_get_firmware_version(a1, (_WORD *)(a1 + 892), (_WORD *)(a1 + 894), (_DWORD *)(a1 + 896), (_WORD *)(a1 + 900), (unsigned __int16 *)(a1 + 902), 0);
      if (firmware_version != -54) {
        break;
      }
      IODelay(0x186A0uLL);
      *(_DWORD *)(a1 + 852) = 0;
      sub_10000F20C(a1);
      *(_DWORD *)(a1 + 740) = 0;
      sub_10000F574(a1);
      if (!--v10)
      {
        uint64_t inited = 4294967242;
LABEL_23:
        i40e_shutdown_arq(a1);
        goto LABEL_10;
      }
    }
    uint64_t inited = firmware_version;
    if (firmware_version) {
      goto LABEL_23;
    }
    sub_10000FB2C(a1);
    i40e_read_nvm_word(a1, 0x18u, (_WORD *)(a1 + 152));
    i40e_read_nvm_word(a1, 0x2Du, &v13);
    i40e_read_nvm_word(a1, 0x2Eu, (_WORD *)&v13 + 1);
    *(_DWORD *)(a1 + 156) = (unsigned __int16)v13 | (HIWORD(v13) << 16);
    i40e_read_nvm_word(a1, 0x17u, &v12);
    i40e_read_nvm_word(a1, (unsigned __int16)(v12 + 131), (_WORD *)&v14 + 1);
    i40e_read_nvm_word(a1, (unsigned __int16)(v12 + 132), &v14);
    *(_DWORD *)(a1 + 160) = (unsigned __int16)v14 | (HIWORD(v14) << 16);
    if (*(unsigned __int16 *)(a1 + 900) > 1u)
    {
      uint64_t inited = 4294967231;
      goto LABEL_23;
    }
    i40e_aq_release_resource(a1, 1, 0, 0);
    uint64_t inited = 0;
    *(unsigned char *)(a1 + 1008) = 0;
    *(_DWORD *)(a1 + 920) = 0;
  }
  return inited;
}

uint64_t sub_10000FB2C(uint64_t result)
{
  *(void *)(result + 1688) = 0;
  int v1 = *(_DWORD *)(result + 80);
  if (v1 == 1)
  {
    unsigned int v2 = *(unsigned __int16 *)(result + 900);
    if (v2 > 1) {
      goto LABEL_6;
    }
    if (v2 != 1) {
      return result;
    }
    if (*(unsigned __int16 *)(result + 902) >= 7u)
    {
LABEL_6:
      uint64_t v3 = 22;
      goto LABEL_7;
    }
    uint64_t v3 = 0;
    goto LABEL_13;
  }
  if (v1 == 3)
  {
    *(void *)(result + 1688) = 9;
    unsigned int v2 = *(unsigned __int16 *)(result + 900);
    if (v2 > 1)
    {
LABEL_4:
      uint64_t v3 = 285;
LABEL_7:
      *(void *)(result + 1688) = v3;
      goto LABEL_9;
    }
    if (v2 != 1) {
      return result;
    }
    unsigned int v6 = *(unsigned __int16 *)(result + 902);
    if (v6 < 6)
    {
      uint64_t v3 = 9;
    }
    else
    {
      uint64_t v3 = 25;
      *(void *)(result + 1688) = 25;
      if (v6 >= 9)
      {
        uint64_t v3 = 29;
        *(void *)(result + 1688) = 29;
        if (v6 != 9) {
          goto LABEL_4;
        }
      }
    }
LABEL_13:
    unsigned int v5 = *(unsigned __int16 *)(result + 902);
    if (v5 >= 5)
    {
      *(void *)(result + 1688) = v3 | 8;
      if (v5 >= 8)
      {
        uint64_t v4 = v3 | 0xA8;
        *(void *)(result + 1688) = v4;
        if (v5 != 8) {
          goto LABEL_11;
        }
      }
    }
    return result;
  }
  uint64_t v3 = 0;
  unsigned int v2 = *(unsigned __int16 *)(result + 900);
LABEL_9:
  if (v2 >= 2)
  {
    uint64_t v4 = v3 | 0xA8;
LABEL_11:
    *(void *)(result + 1688) = v4 | 0x40;
    return result;
  }
  if (v2 == 1) {
    goto LABEL_13;
  }
  return result;
}

uint64_t i40e_shutdown_adminq(uint64_t a1)
{
  if (i40e_check_asq_alive(a1)) {
    i40e_aq_queue_shutdown(a1, 1);
  }
  i40e_shutdown_asq(a1);
  i40e_shutdown_arq(a1);
  i40e_destroy_spinlock(a1 + 904);
  i40e_destroy_spinlock(a1 + 905);
  if (*(void *)(a1 + 992)) {
    i40e_free_virt_mem(a1, (void *)(a1 + 992));
  }
  return 0;
}

uint64_t i40e_clean_asq(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int16 *)(a1 + 854);
  uint64_t v3 = *(void *)(a1 + 784);
  uint64_t v4 = *(void *)(a1 + 824);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 856), &readData);
  __dmb(1u);
  if (readData != v2)
  {
    uint64_t v5 = v4 + 32 * v2;
    unsigned int v6 = (_OWORD *)(v3 + 32 * v2);
    int v7 = v2;
    do
    {
      if ((dword_100028548 & 0x100000) != 0)
      {
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 856), &readData);
        __dmb(1u);
        IOLog("ixl:%s(%d): ntc %d head %d.\n\n", "i40e_clean_asq", 758, v7, readData);
      }
      uint32_t v8 = *(void (**)(uint64_t, _OWORD *))v5;
      if (*(void *)v5)
      {
        long long v9 = v6[1];
        v14[0] = *v6;
        v14[1] = v9;
        v8(a1, v14);
      }
      *unsigned int v6 = 0u;
      v6[1] = 0u;
      *(_OWORD *)uint64_t v5 = 0u;
      *(_OWORD *)(v5 + 16) = 0u;
      if (*(unsigned __int16 *)(a1 + 848) == (unsigned __int16)(v2 + 1)) {
        LOWORD(v2) = 0;
      }
      else {
        LOWORD(v2) = v2 + 1;
      }
      unsigned int v6 = (_OWORD *)(*(void *)(a1 + 784) + 32 * (unsigned __int16)v2);
      uint64_t v5 = *(void *)(a1 + 824) + 32 * (unsigned __int16)v2;
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 856), &readData);
      __dmb(1u);
      int v7 = (unsigned __int16)v2;
    }
    while (readData != (unsigned __int16)v2);
  }
  *(_WORD *)(a1 + 854) = v2;
  unsigned int v10 = *(unsigned __int16 *)(a1 + 852);
  if (v10 >= (unsigned __int16)v2) {
    __int16 v11 = *(_WORD *)(a1 + 848);
  }
  else {
    __int16 v11 = 0;
  }
  return (unsigned __int16)(v2 + v11 + ~(_WORD)v10);
}

BOOL i40e_asq_done(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 856), &readData);
  __dmb(1u);
  return readData == *(unsigned __int16 *)(a1 + 852);
}

uint64_t i40e_asq_send_command(uint64_t a1, uint64_t a2, void *a3, unsigned int a4, _OWORD *a5)
{
  uint64_t v10 = a1 + 904;
  i40e_acquire_spinlock(a1 + 904);
  *(_DWORD *)(a1 + 908) = 0;
  if (*(_WORD *)(a1 + 848))
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 856), &readData);
    __dmb(1u);
    if (readData >= *(unsigned __int16 *)(a1 + 886))
    {
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): AQTX: head overrun at %d\n\n");
      }
      goto LABEL_11;
    }
    uint64_t v11 = *(void *)(a1 + 824);
    uint64_t v12 = *(unsigned __int16 *)(a1 + 852);
    uint64_t v13 = v11 + 32 * v12;
    if (a5)
    {
      long long v14 = a5[1];
      *(_OWORD *)uint64_t v13 = *a5;
      *(_OWORD *)(v13 + 16) = v14;
      uint64_t v15 = *(void *)(v13 + 8);
      if (v15) {
        *(void *)(a2 + 8) = __ROR8__(v15, 32);
      }
    }
    else
    {
      *(_OWORD *)uint64_t v13 = 0u;
      *(_OWORD *)(v13 + 16) = 0u;
    }
    uint64_t v17 = v11 + 32 * v12;
    *(_WORD *)a2 = *(_WORD *)(v17 + 16) | *(_WORD *)a2 & ~*(_WORD *)(v17 + 18);
    if (*(unsigned __int16 *)(a1 + 890) < a4)
    {
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): AQTX: Invalid buffer size: %d.\n\n", "i40e_asq_send_command", 872, a4);
      }
      uint64_t v16 = 4294967270;
      goto LABEL_17;
    }
    int v20 = *(unsigned __int8 *)(v17 + 21);
    unsigned int v19 = (unsigned char *)(v17 + 21);
    if (!v20 || *(unsigned char *)(v11 + 32 * v12 + 20))
    {
      if (i40e_clean_asq(a1))
      {
        uint64_t v21 = *(void *)(a1 + 784) + 32 * *(unsigned __int16 *)(a1 + 852);
        long long v22 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)uint64_t v21 = *(_OWORD *)a2;
        *(_OWORD *)(v21 + 16) = v22;
        if (a3)
        {
          uint64_t v23 = *(void *)(a1 + 840) + 40 * *(unsigned __int16 *)(a1 + 852);
          memcpy(*(void **)v23, a3, a4);
          *(_WORD *)(v21 + 4) = a4;
          *(_DWORD *)(v21 + 24) = *(_DWORD *)(v23 + 12);
          unsigned __int16 v32 = (const void **)v23;
          *(_DWORD *)(v21 + 28) = *(void *)(v23 + 8);
        }
        else
        {
          unsigned __int16 v32 = 0;
        }
        if ((dword_100028548 & 0x100000) != 0) {
          IOLog("ixl:%s(%d): AQTX: desc and buffer:\n\n", "i40e_asq_send_command", 925);
        }
        i40e_debug_aq(a1, 100663296, (unsigned __int16 *)v21, (uint64_t)a3, a4);
        __int16 v24 = *(_WORD *)(a1 + 852);
        if (*(unsigned __int16 *)(a1 + 848) == (unsigned __int16)(v24 + 1)) {
          __int16 v25 = 0;
        }
        else {
          __int16 v25 = v24 + 1;
        }
        *(_WORD *)(a1 + 852) = v25;
        if (!*v19)
        {
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 860), *(unsigned __int16 *)(a1 + 852));
        }
        uint64_t v33 = (unsigned char *)(v11 + 32 * v12 + 20);
        if (!*v33 && !*v19)
        {
          unsigned int v26 = 0;
          do
          {
            uint32_t readData = 0;
            IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 856), &readData);
            __dmb(1u);
            if (readData == *(unsigned __int16 *)(a1 + 852)) {
              break;
            }
            IODelay(0x32uLL);
            v26 += 50;
          }
          while (v26 < *(_DWORD *)(a1 + 880));
        }
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 856), &readData);
        uint64_t v16 = 0;
        __dmb(1u);
        int v34 = *(unsigned __int16 *)(a1 + 852);
        uint32_t v35 = readData;
        if (readData != v34) {
          goto LABEL_55;
        }
        long long v27 = *(_OWORD *)(v21 + 16);
        *(_OWORD *)a2 = *(_OWORD *)v21;
        *(_OWORD *)(a2 + 16) = v27;
        if (a3) {
          memcpy(a3, *v32, a4);
        }
        int v28 = *(unsigned __int16 *)(a2 + 6);
        if (*(_WORD *)(a2 + 6))
        {
          if ((dword_100028548 & 0x100000) != 0) {
            IOLog("ixl:%s(%d): AQTX: Command completed with error 0x%X.\n\n", "i40e_asq_send_command", 963, v28);
          }
          int v29 = v28;
          if (v28 == 12) {
            uint64_t v16 = 4294967233;
          }
          else {
            uint64_t v16 = 4294967243;
          }
          if (v29) {
            goto LABEL_54;
          }
        }
        else
        {
          int v29 = 0;
        }
        uint64_t v16 = 0;
LABEL_54:
        *(_DWORD *)(a1 + 908) = v29;
LABEL_55:
        if ((dword_100028548 & 0x100000) != 0) {
          IOLog("ixl:%s(%d): AQTX: desc and buffer writeback:\n\n", "i40e_asq_send_command", 979);
        }
        i40e_debug_aq(a1, 100663296, (unsigned __int16 *)a2, (uint64_t)a3, a4);
        uint64_t v30 = *(_OWORD **)(v11 + 32 * v12 + 24);
        if (v30)
        {
          long long v31 = *(_OWORD *)(v21 + 16);
          *uint64_t v30 = *(_OWORD *)v21;
          v30[1] = v31;
        }
        if (v35 != v34 && !*v33 && !*v19)
        {
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 864), &readData);
          __dmb(1u);
          if ((readData & 0x40000000) != 0)
          {
            if ((dword_100028548 & 0x100000) != 0) {
              IOLog("ixl:%s(%d): AQTX: AQ Critical error.\n\n", "i40e_asq_send_command", 992);
            }
            uint64_t v16 = 4294967230;
          }
          else
          {
            if ((dword_100028548 & 0x100000) != 0) {
              IOLog("ixl:%s(%d): AQTX: Writeback timeout.\n\n", "i40e_asq_send_command", 996);
            }
            uint64_t v16 = 4294967242;
          }
        }
        goto LABEL_17;
      }
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): AQTX: Error queue is full.\n\n");
      }
LABEL_11:
      uint64_t v16 = 4294967240;
      goto LABEL_17;
    }
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): AQTX: Async flag not set along with postpone flag\n", "i40e_asq_send_command", 880);
    }
    uint64_t v16 = 4294967291;
  }
  else
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): AQTX: Admin queue not initialized.\n\n", "i40e_asq_send_command", 828);
    }
    uint64_t v16 = 4294967264;
  }
LABEL_17:
  i40e_release_spinlock(v10);
  return v16;
}

uint64_t i40e_fill_default_direct_cmd_desc(uint64_t result, __int16 a2)
{
  *(void *)(result + 12) = 0;
  *(void *)(result + 4) = 0;
  *(_DWORD *)(result + 28) = 0;
  *(void *)(result + 20) = 0;
  *(_WORD *)(result + 2) = a2;
  *(_WORD *)uint64_t result = 0x2000;
  return result;
}

uint64_t i40e_clean_arq_element(uint64_t a1, uint64_t a2, _WORD *a3)
{
  uint64_t v6 = *(unsigned __int16 *)(a1 + 742);
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  uint64_t v7 = a1 + 905;
  i40e_acquire_spinlock(a1 + 905);
  if (*(_WORD *)(a1 + 736))
  {
    int v8 = *(_DWORD *)(a1 + 80);
    if (v8 == 2 || v8 == 4)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 744), &readData);
      __dmb(1u);
      __int16 v11 = readData;
    }
    else
    {
      uint32_t v30 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 744), &v30);
      __dmb(1u);
      __int16 v11 = v30;
    }
    unsigned int v12 = v11 & 0x3FF;
    if (v12 == v6)
    {
      uint64_t v10 = 4294967239;
      if (!a3) {
        goto LABEL_38;
      }
      goto LABEL_34;
    }
    uint64_t v13 = *(void *)(a1 + 672);
    uint64_t v14 = v13 + 32 * v6;
    uint64_t v15 = v14;
    int v16 = *(unsigned __int16 *)(v14 + 6);
    *(_DWORD *)(a1 + 912) = v16;
    if ((*(unsigned char *)v14 & 4) != 0)
    {
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): AQRX: Event received with error 0x%X.\n\n", "i40e_clean_arq_element", 1082, v16);
      }
      uint64_t v10 = 4294967243;
    }
    else
    {
      uint64_t v10 = 0;
    }
    long long v17 = *(_OWORD *)(v14 + 16);
    *(_OWORD *)a2 = *(_OWORD *)v14;
    *(_OWORD *)(a2 + 16) = v17;
    unsigned int v20 = *(unsigned __int16 *)(v14 + 4);
    unsigned int v19 = (_WORD *)(v14 + 4);
    unsigned int v18 = v20;
    if (v20 >= *(unsigned __int16 *)(a2 + 34)) {
      size_t v21 = *(unsigned __int16 *)(a2 + 34);
    }
    else {
      size_t v21 = v18;
    }
    *(_WORD *)(a2 + 32) = v21;
    long long v22 = *(void **)(a2 + 40);
    if (v22 && v21)
    {
      memcpy(v22, *(const void **)(*(void *)(a1 + 728) + 40 * v6), v21);
      uint64_t v10 = v10;
    }
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): AQRX: desc and buffer:\n\n", "i40e_clean_arq_element", 1094);
    }
    i40e_debug_aq(a1, 100663296, (unsigned __int16 *)v15, *(void *)(a2 + 40), *(unsigned __int16 *)(a1 + 888));
    uint64_t v23 = *(void *)(a1 + 728);
    *(void *)(v15 + 10) = 0;
    *(void *)(v15 + 2) = 0;
    *(void *)(v15 + 24) = 0;
    *(void *)(v15 + 18) = 0;
    if (*(unsigned __int16 *)(a1 + 888) <= 0x200u) {
      __int16 v24 = 4096;
    }
    else {
      __int16 v24 = 4608;
    }
    *(_WORD *)uint64_t v15 = v24;
    uint64_t v25 = v23 + 40 * v6;
    _WORD *v19 = *(void *)(v25 + 32);
    uint64_t v26 = v13 + 32 * v6;
    *(_DWORD *)(v26 + 24) = *(_DWORD *)(v25 + 12);
    *(_DWORD *)(v26 + 28) = *(void *)(v25 + 8);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(a1 + 748), v6);
    if (*(unsigned __int16 *)(a1 + 884) == (unsigned __int16)(v6 + 1)) {
      LOWORD(v6) = 0;
    }
    else {
      LOWORD(v6) = v6 + 1;
    }
    *(_WORD *)(a1 + 742) = v6;
    *(_WORD *)(a1 + 740) = v12;
    i40e_nvmupd_check_wait_event(a1, *(unsigned __int16 *)(a2 + 2), (_OWORD *)a2);
    if (a3)
    {
LABEL_34:
      if (v12 >= (unsigned __int16)v6) {
        __int16 v27 = 0;
      }
      else {
        __int16 v27 = *(_WORD *)(a1 + 736);
      }
      *a3 = v12 - v6 + v27;
    }
  }
  else
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): AQRX: Admin queue not initialized.\n\n", "i40e_clean_arq_element", 1054);
    }
    uint64_t v10 = 4294967264;
  }
LABEL_38:
  i40e_release_spinlock(v7);
  return v10;
}

uint64_t sub_100010668(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = a1 + 312 * a2;
  uint64_t v5 = v4 + 368;
  unsigned int v6 = *(_DWORD *)(v4 + 496);
  uint32_t v7 = *(_DWORD *)(v4 + 500);
  if (v7 == v6) {
    goto LABEL_9;
  }
  unsigned int v8 = *(_DWORD *)(v4 + 496);
  do
  {
    if (v8 == 511) {
      unsigned int v9 = 0;
    }
    else {
      unsigned int v9 = v8 + 1;
    }
    if ((*(void *)(*(void *)v5 + 16 * v8 + 8) & 1) == 0) {
      break;
    }
    unsigned int v8 = v9;
  }
  while (v7 != v9);
  if (v8 == v6)
  {
LABEL_9:
    uint64_t v10 = 0;
  }
  else
  {
    __dmb(1u);
    do
    {
      uint64_t v11 = *(void *)(*(void *)(v5 + 264) + 8 * v6);
      *(_DWORD *)(v11 + 64) = (*(void *)(*(void *)v5 + 16 * v6 + 8) >> 38) & 0x3FFF;
      unsigned int v12 = *(IODataQueueDispatchSource **)(v5 + 288);
      *(void *)&long long v21 = _NSConcreteStackBlock;
      *((void *)&v21 + 1) = 0x40000000;
      *(void *)&long long v22 = sub_1000108D0;
      *((void *)&v22 + 1) = &unk_1000244B0;
      *(void *)&long long v23 = v11;
      BOOL sendDataAvailable = 0;
      if (IODataQueueDispatchSource::EnqueueWithCoalesce(v12, 0x68u, &sendDataAvailable, &v21)) {
        sub_10001C954();
      }
      if (v6 == 511) {
        unsigned int v6 = 0;
      }
      else {
        ++v6;
      }
    }
    while (v8 != v6);
    *(_DWORD *)(v5 + 128) = v8;
    uint64_t v10 = 1;
    LOWORD(v6) = v8;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  if ((((_WORD)v6 + ~(_WORD)v7) & 0x1FF) != 0)
  {
    uint64_t v13 = *(void *)(a1 + 312 * a2 + 664);
    unsigned int v14 = (*(uint64_t (**)(uint64_t, long long *, void))(*(void *)v13 + 104))(v13, &v21, ((_WORD)v6 + ~(_WORD)v7) & 0x1FF);
    if (v14)
    {
      uint64_t v15 = v14;
      int v16 = (uint64_t *)&v21;
      do
      {
        uint64_t v17 = *v16++;
        unsigned int v18 = (void *)(*(void *)v5 + 16 * v7);
        uint64_t v19 = *(void *)(v17 + 48);
        *(void *)(*(void *)(v5 + 264) + 8 * v7) = v19 + 8;
        *unsigned int v18 = *(void *)(v19 + 24);
        v18[1] = 0;
        uint32_t v7 = (v7 + 1) & 0x1FF;
        --v15;
      }
      while (v15);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(**(IOPCIDevice ***)(a1 + 24), 0, 4 * a2 + 1212416, v7);
      *(_DWORD *)(v5 + 132) = v7;
    }
  }
  return v10;
}

uint64_t sub_1000108D0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(v2 + 40);
  *(unsigned char *)(a2 + 73) = *(unsigned char *)(v2 + 73);
  *(_DWORD *)(a2 + 64) = *(_DWORD *)(v2 + 64);
  return result;
}

uint64_t i40e_set_mac_type(uint64_t a1)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_set_mac_type", 18, "i40e_set_mac_type\n");
  }
  if (*(unsigned __int16 *)(a1 + 178) != 32902)
  {
    uint64_t v5 = 4294967285;
    goto LABEL_26;
  }
  unsigned int v2 = *(unsigned __int16 *)(a1 + 176);
  int v3 = 1;
  if (v2 > 0x15FE)
  {
    if (*(unsigned __int16 *)(a1 + 176) <= 0x37CDu)
    {
      switch(v2)
      {
        case 0x15FFu:
          goto LABEL_25;
        case 0x1889u:
LABEL_23:
          int v3 = 2;
          goto LABEL_25;
        case 0x37CDu:
          int v3 = 4;
          goto LABEL_25;
      }
    }
    else if (v2 - 14286 <= 5)
    {
      int v3 = 3;
      goto LABEL_25;
    }
LABEL_24:
    int v3 = 5;
    goto LABEL_25;
  }
  if (*(unsigned __int16 *)(a1 + 176) <= 0x154Bu)
  {
    if (v2 - 4127 <= 0x30 && ((1 << (v2 - 31)) & 0x1800000000001) != 0 || v2 == 3320 || v2 == 3416) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  unsigned int v4 = v2 - 5452;
  if (v4 > 0x3F) {
    goto LABEL_24;
  }
  if (((1 << v4) & 0xFFB0014000000000) == 0)
  {
    if (((1 << v4) & 0x2000000001) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_25:
  uint64_t v5 = 0;
  *(_DWORD *)(a1 + 80) = v3;
LABEL_26:
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): i40e_set_mac_type found mac: %d, returns: %d\n\n", "i40e_set_mac_type", 68, *(_DWORD *)(a1 + 80), v5);
  }
  return v5;
}

char *i40e_aq_str(uint64_t a1, unsigned int a2)
{
  if (a2 < 0x17) {
    return off_1000244D0[a2];
  }
  uint64_t v2 = a1 + 1724;
  snprintf((char *)(a1 + 1724), 0x10uLL, "%d", a2);
  return (char *)v2;
}

char *i40e_stat_str(uint64_t a1, int a2)
{
  if ((a2 + 66) < 0x43) {
    return off_100024588[a2 + 66];
  }
  uint64_t v2 = a1 + 1724;
  snprintf((char *)(a1 + 1724), 0x10uLL, "%d", a2);
  return (char *)v2;
}

uint64_t i40e_debug_aq(uint64_t result, int a2, unsigned __int16 *a3, uint64_t a4, unsigned int a5)
{
  if (a3)
  {
    int v5 = *(_DWORD *)(result + 1720) & a2;
    if (v5)
    {
      unsigned int v9 = a3[2];
      if ((dword_100028548 & 0x100000) != 0)
      {
        uint64_t result = IOLog("ixl:%s(%d): AQ CMD: opcode 0x%04X, flags 0x%04X, datalen 0x%04X, retval 0x%04X\n\n", "i40e_debug_aq", 309, a3[1], *a3, a3[2], a3[3]);
        if ((dword_100028548 & 0x100000) != 0)
        {
          uint64_t result = IOLog("ixl:%s(%d): \tcookie (h,l) 0x%08X 0x%08X\n\n", "i40e_debug_aq", 313, *((_DWORD *)a3 + 2), *((_DWORD *)a3 + 3));
          if ((dword_100028548 & 0x100000) != 0)
          {
            uint64_t result = IOLog("ixl:%s(%d): \tparam (0,1)  0x%08X 0x%08X\n\n", "i40e_debug_aq", 317, *((_DWORD *)a3 + 4), *((_DWORD *)a3 + 5));
            if ((dword_100028548 & 0x100000) != 0) {
              uint64_t result = IOLog("ixl:%s(%d): \taddr (h,l)   0x%08X 0x%08X\n\n", "i40e_debug_aq", 321, *((_DWORD *)a3 + 6), *((_DWORD *)a3 + 7));
            }
          }
        }
      }
      if ((v5 & 0x4000000) != 0 && a4 && a5 && v9)
      {
        if ((dword_100028548 & 0x100000) != 0) {
          uint64_t result = IOLog("ixl:%s(%d): AQ CMD Buffer:\n\n", "i40e_debug_aq", 325);
        }
        if (v9 >= a5) {
          unsigned int v10 = a5;
        }
        else {
          unsigned int v10 = v9;
        }
        if (v10 < 0x11)
        {
          unsigned __int16 v14 = 0;
          LODWORD(v11) = 0;
        }
        else
        {
          uint64_t v11 = 0;
          unsigned int v21 = v10;
          int v12 = v10 - 16;
          int v13 = dword_100028548;
          do
          {
            if ((v13 & 0x100000) != 0)
            {
              uint64_t result = IOLog("ixl:%s(%d): \t0x%04X  %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X\n\n", "i40e_debug_aq", 335, v11, *(unsigned __int8 *)(a4 + v11), *(unsigned __int8 *)(a4 + (v11 | 1)), *(unsigned __int8 *)(a4 + (v11 | 2)), *(unsigned __int8 *)(a4 + (v11 | 3)), *(unsigned __int8 *)(a4 + (v11 | 4)), *(unsigned __int8 *)(a4 + (v11 | 5)), *(unsigned __int8 *)(a4 + (v11 | 6)), *(unsigned __int8 *)(a4 + (v11 | 7)), *(unsigned __int8 *)(a4 + (v11 | 8)), *(unsigned __int8 *)(a4 + (v11 | 9)), *(unsigned __int8 *)(a4 + (v11 | 0xALL)), *(unsigned __int8 *)(a4 + (v11 | 0xBLL)), *(unsigned __int8 *)(a4 + (v11 | 0xCLL)), *(unsigned __int8 *)(a4 + (v11 | 0xDLL)), *(unsigned __int8 *)(a4 + (v11 | 0xELL)),
                         *(unsigned __int8 *)(a4 + (v11 | 0xFLL)));
              int v13 = dword_100028548;
            }
            v11 += 16;
          }
          while (v12 > (int)v11);
          unsigned __int16 v14 = v11;
          unsigned int v10 = v21;
        }
        if (v10 > v14)
        {
          uint64_t v15 = (const void *)(a4 + v14);
          unsigned __int16 v16 = v10 + ~v14;
          unsigned int v17 = v16;
          size_t v18 = v16 + 1;
          uint64_t v19 = 15 - v16;
          if (v17 <= 0xE) {
            size_t v20 = v19;
          }
          else {
            size_t v20 = 0;
          }
          bzero(&__dst[v18], v20);
          uint64_t result = (uint64_t)memcpy(__dst, v15, v18);
          if ((dword_100028548 & 0x100000) != 0) {
            return IOLog("ixl:%s(%d): \t0x%04X  %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X\n\n", "i40e_debug_aq", 350, v11, __dst[0], __dst[1], __dst[2], __dst[3], __dst[4], __dst[5], __dst[6], __dst[7], __dst[8], __dst[9], __dst[10], __dst[11], __dst[12], __dst[13], __dst[14],
          }
                     __dst[15]);
        }
      }
    }
  }
  return result;
}

uint64_t i40e_check_asq_alive(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 864);
  if (!v1) {
    return 0;
  }
  int v2 = *(_DWORD *)(a1 + 80);
  if (v2 == 2 || v2 == 4)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v1, &readData);
    __dmb(1u);
    uint32_t v5 = readData;
  }
  else
  {
    uint32_t v7 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v1, &v7);
    __dmb(1u);
    uint32_t v5 = v7;
  }
  return v5 >> 31;
}

uint64_t i40e_aq_queue_shutdown(uint64_t a1, int a2)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v5, 3);
  if (a2) {
    v5[4] = 1;
  }
  return i40e_asq_send_command(a1, (uint64_t)v5, 0, 0, 0);
}

uint64_t i40e_aq_get_rss_lut(uint64_t a1, __int16 a2, int a3, void *a4, unsigned int a5)
{
  return sub_100010F8C(a1, a2, a3, a4, a5, 0);
}

uint64_t sub_100010F8C(uint64_t a1, __int16 a2, int a3, void *a4, unsigned int a5, int a6)
{
  if (a6) {
    __int16 v11 = 2819;
  }
  else {
    __int16 v11 = 2821;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v13, v11);
  v13[0] |= 0x1400u;
  v13[8] = a2 & 0x3FF | 0x8000;
  if (a3) {
    v14 |= 1u;
  }
  return i40e_asq_send_command(a1, (uint64_t)v13, a4, a5, 0);
}

uint64_t i40e_aq_set_rss_lut(uint64_t a1, __int16 a2, int a3, void *a4, unsigned int a5)
{
  return sub_100010F8C(a1, a2, a3, a4, a5, 1);
}

uint64_t i40e_aq_get_rss_key(uint64_t a1, __int16 a2, void *a3)
{
  return sub_100011040(a1, a2, a3, 0);
}

uint64_t sub_100011040(uint64_t a1, __int16 a2, void *a3, int a4)
{
  if (a4) {
    __int16 v7 = 2818;
  }
  else {
    __int16 v7 = 2820;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, v7);
  v9[0] |= 0x1400u;
  v9[8] = a2 & 0x3FF | 0x8000;
  return i40e_asq_send_command(a1, (uint64_t)v9, a3, 0x34u, 0);
}

uint64_t i40e_aq_set_rss_key(uint64_t a1, __int16 a2, void *a3)
{
  return sub_100011040(a1, a2, a3, 1);
}

uint64_t i40e_validate_mac_addr(unsigned __int8 *a1)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_validate_mac_addr", 934, "i40e_validate_mac_addr");
  }
  if ((*a1 & 1) == 0 && (*a1 || a1[1] || a1[2] || a1[3] || a1[4] || a1[5])) {
    return 0;
  }
  else {
    return 4294967286;
  }
}

uint64_t i40e_init_shared_code(uint64_t a1)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_init_shared_code", 965, "i40e_init_shared_code");
  }
  i40e_set_mac_type(a1);
  if ((*(_DWORD *)(a1 + 80) | 2) != 3) {
    return 4294967285;
  }
  *(unsigned char *)(a1 + 64) = 1;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x1C0480uLL, &readData);
  __dmb(1u);
  *(unsigned char *)(a1 + 185) = readData & 3;
  uint32_t v6 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0xBE4A8uLL, &v6);
  __dmb(1u);
  char v2 = v6;
  uint32_t v5 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x9C000uLL, &v5);
  __dmb(1u);
  char v3 = v5;
  if ((v2 & 0x10) == 0) {
    char v3 = v5 & 7;
  }
  *(unsigned char *)(a1 + 642) = v3;
  *(_DWORD *)(a1 + 1702) = 1052160;
  *(void *)(a1 + 1706) = 0;
  *(_DWORD *)(a1 + 1714) = 0;
  return i40e_init_nvm(a1);
}

uint64_t i40e_aq_mac_address_write(uint64_t a1, __int16 a2, unsigned __int16 *a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, 264);
  v9[8] = a2;
  v9[9] = bswap32(*a3) >> 16;
  unsigned int v10 = bswap32(*(_DWORD *)(a3 + 1));
  return i40e_asq_send_command(a1, (uint64_t)v9, 0, 0, a4);
}

uint64_t i40e_get_mac_addr(uint64_t a1, uint64_t a2)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 263);
  v7[0] |= 0x1000u;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v7, &v5, 0x18u, 0);
  if ((v8 & 0x10) != 0)
  {
    *(_DWORD *)a2 = v5;
    *(_WORD *)(a2 + 4) = v6;
  }
  return result;
}

uint64_t i40e_get_port_mac_addr(uint64_t a1, uint64_t a2)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v8, 263);
  v8[0] |= 0x1000u;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v8, v5, 0x18u, 0);
  if (!result)
  {
    if ((v9 & 0x40) != 0)
    {
      uint64_t result = 0;
      *(_DWORD *)a2 = v6;
      *(_WORD *)(a2 + 4) = v7;
    }
    else
    {
      return 4294967286;
    }
  }
  return result;
}

void i40e_pre_tx_queue_cfg(uint64_t a1, int a2, int a3)
{
  unsigned int v5 = *(_DWORD *)(a1 + 576) + a2;
  if (v5 <= 0x7F) {
    uint64_t v6 = 943360;
  }
  else {
    uint64_t v6 = 4 * (v5 >> 7) + 943360;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v6, &readData);
  __dmb(1u);
  uint32_t v7 = readData & 0xFFFFF800;
  if (a3) {
    unsigned int v8 = 0x80000000;
  }
  else {
    unsigned int v8 = 0x40000000;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v6, v8 & 0xFFFFFF80 | v5 & 0x7F | v7);
}

uint64_t i40e_read_pba_string(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v16 = 0;
  unsigned __int16 v15 = 0;
  uint64_t nvm_word = i40e_read_nvm_word(a1, 0x15u, (_WORD *)&v16 + 1);
  if (nvm_word || HIWORD(v16) != 64250)
  {
    if ((dword_100028548 & 0x100000) != 0) {
LABEL_7:
    }
      IOLog("ixl:%s(%d): %s\n");
  }
  else
  {
    uint64_t v7 = i40e_read_nvm_word(a1, 0x16u, &v15);
    if (v7)
    {
      uint64_t nvm_word = v7;
      if ((dword_100028548 & 0x100000) != 0) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v9 = i40e_read_nvm_word(a1, v15, &v16);
      if (v9)
      {
        uint64_t nvm_word = v9;
        if ((dword_100028548 & 0x100000) == 0) {
          return nvm_word;
        }
        goto LABEL_7;
      }
      LOWORD(v16) = v16 - 1;
      if (((2 * (unsigned __int16)v16) | 1u) <= a3)
      {
        if ((_WORD)v16)
        {
          int v10 = 0;
          uint64_t v11 = a2 + 1;
          while (1)
          {
            unsigned int v12 = v10 + 1;
            uint64_t v13 = i40e_read_nvm_word(a1, (unsigned __int16)(v15 + v10 + 1), (_WORD *)&v16 + 1);
            if (v13) {
              break;
            }
            *(_WORD *)(v11 - 1) = bswap32(HIWORD(v16)) >> 16;
            v11 += 2;
            ++v10;
            if (v12 >= (unsigned __int16)v16)
            {
              uint64_t v14 = 2 * (unsigned __int16)v16;
              goto LABEL_22;
            }
          }
          uint64_t nvm_word = v13;
          if ((dword_100028548 & 0x100000) != 0) {
            IOLog("ixl:%s(%d): Failed to read PBA Block word %d.\n\n");
          }
        }
        else
        {
          uint64_t v14 = 0;
LABEL_22:
          uint64_t nvm_word = 0;
          *(unsigned char *)(a2 + v14) = 0;
        }
      }
      else
      {
        if ((dword_100028548 & 0x100000) != 0) {
          IOLog("ixl:%s(%d): %s\n", "i40e_read_pba_string", 1184, "Buffer to small for PBA data.\n");
        }
        return 4294967291;
      }
    }
  }
  return nvm_word;
}

uint64_t i40e_pf_reset(IOPCIDevice **a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0xB8180uLL, &readData);
  __dmb(1u);
  int v2 = 0;
  if (20 * (readData & 0x3F) >= 0xA0) {
    uint32_t v3 = 160;
  }
  else {
    uint32_t v3 = 20 * (readData & 0x3F);
  }
  if (!v3) {
    goto LABEL_12;
  }
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 0xB8188uLL, &readData);
    __dmb(1u);
    uint32_t v4 = readData & 3;
    if ((readData & 3) == 0) {
      break;
    }
    IODelay(0x186A0uLL);
    if (v3 == ++v2)
    {
      int v2 = 1;
      break;
    }
  }
  if (v4)
  {
    if ((dword_100028548 & 0x100000) != 0) {
LABEL_10:
    }
      IOLog("ixl:%s(%d): %s\n");
    return 4294967281;
  }
  else
  {
LABEL_12:
    for (int i = 0; i != 1000; ++i)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, 0xB6008uLL, &readData);
      __dmb(1u);
      uint32_t v7 = readData & 0x18;
      if (v7 == 24)
      {
        if ((dword_100028548 & 0x100000) != 0) {
          IOLog("ixl:%s(%d): Core and Global modules ready %d\n\n", "i40e_pf_reset", 1328, i);
        }
        goto LABEL_21;
      }
      IODelay(0x2710uLL);
    }
    if (!v7)
    {
      if ((dword_100028548 & 0x100000) != 0)
      {
        IOLog("ixl:%s(%d): %s\n", "i40e_pf_reset", 1335, "wait for FW Reset complete timedout\n");
        if ((dword_100028548 & 0x100000) != 0) {
          IOLog("ixl:%s(%d): I40E_GLNVM_ULD = 0x%x\n\n");
        }
      }
      return 4294967281;
    }
LABEL_21:
    if (!v2)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, 0x92400uLL, &readData);
      __dmb(1u);
      uint32_t v8 = readData;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, 0x92400uLL, v8 | 1);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, 0x92400uLL, &readData);
      __dmb(1u);
      if (readData)
      {
        int v9 = 1000;
        while (1)
        {
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*a1, 0, 0xB8188uLL, &readData);
          __dmb(1u);
          char v10 = readData;
          if ((readData & 3) != 0) {
            break;
          }
          IODelay(0x3E8uLL);
          if (!--v9)
          {
            if ((dword_100028548 & 0x100000) == 0) {
              return 4294967281;
            }
            goto LABEL_10;
          }
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*a1, 0, 0x92400uLL, &readData);
          __dmb(1u);
          if ((readData & 1) == 0)
          {
            if ((v10 & 3) == 0) {
              goto LABEL_23;
            }
            break;
          }
        }
        if (!v3)
        {
LABEL_36:
          if ((dword_100028548 & 0x100000) != 0)
          {
            IOLog("ixl:%s(%d): %s\n", "i40e_poll_globr", 1279, "Global reset failed.\n");
            if ((dword_100028548 & 0x100000) != 0) {
              IOLog("ixl:%s(%d): I40E_GLGEN_RSTAT = 0x%x\n\n");
            }
          }
          return 4294967281;
        }
        while (1)
        {
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*a1, 0, 0xB8188uLL, &readData);
          __dmb(1u);
          if ((readData & 3) == 0) {
            break;
          }
          IODelay(0x186A0uLL);
          if (!--v3) {
            goto LABEL_36;
          }
        }
      }
    }
LABEL_23:
    uint64_t result = i40e_check_asq_alive((uint64_t)a1);
    if (result)
    {
      i40e_aq_clear_pxe_mode(a1, 0);
      return 0;
    }
  }
  return result;
}

uint64_t i40e_clear_pxe_mode(IOPCIDevice **a1)
{
  uint64_t result = i40e_check_asq_alive((uint64_t)a1);
  if (result)
  {
    return i40e_aq_clear_pxe_mode(a1, 0);
  }
  return result;
}

void i40e_clear_hw(IOPCIDevice **a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0xBE494uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  uint32_t v3 = (readData >> 2) & 0x7FF;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x1C0400uLL, &readData);
  __dmb(1u);
  signed int v4 = readData;
  uint32_t v5 = readData & 0x7FF;
  uint32_t v6 = (HIWORD(readData) & 0x7FF) - v5 + 1;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x1C0500uLL, &readData);
  __dmb(1u);
  if ((readData & 0x80000000) != 0) {
    uint64_t v7 = BYTE1(readData) - readData + 1;
  }
  else {
    uint64_t v7 = 0;
  }
  int v8 = 174080;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x38800uLL, 0);
  uint64_t v9 = v3 - 2;
  if (v9)
  {
    int v10 = 215040;
    uint64_t v11 = v9;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, v10 & 0xFFFFFFFC, 0x18u);
      v10 += 4;
      --v11;
    }
    while (v11);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0x38500uLL, 0x7FFu);
    uint64_t v12 = 0;
    uint64_t v13 = 4 * v9;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, (v12 + 217088) & 0xFFFFFFFC, 0x7FFu);
      v12 += 4;
    }
    while (v13 != v12);
  }
  else
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0x38500uLL, 0x7FFu);
  }
  int v14 = (v2 >> 13) & 0x7FF;
  unsigned int v15 = v6 & (v4 >> 31);
  if (v7)
  {
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, v8 & 0xFFFFFFFC, 0x7FFu);
      v8 += 4;
      --v7;
    }
    while (v7);
  }
  unsigned int v16 = v14 - 2;
  if (v14 != 2)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 4 * v16;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, (v17 + 151552) & 0xFFFFFFFC, 0x7FFu);
      v17 += 4;
    }
    while (v18 != v17);
  }
  if (v15)
  {
    unsigned int v19 = v15;
    do
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, 4 * (v5 >> 7) + 943360, &readData);
      __dmb(1u);
      uint32_t v20 = v5 & 0x7F | readData & 0xFFFFF800 | 0x40000000;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, 4 * (v5++ >> 7) + 943360, v20);
      --v19;
    }
    while (v19);
    IODelay(0x190uLL);
    uint64_t v21 = 0;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, (v21 + 245760), 0);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, (v21 + 0x100000), 0);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, (v21 + 237568), 0);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, (v21 + 1179648), 0);
      v21 += 4;
    }
    while (4 * v15 != v21);
  }
  else
  {
    IODelay(0x190uLL);
  }
  IODelay(0x32uLL);
}

uint64_t i40e_aq_clear_pxe_mode(IOPCIDevice **a1, _OWORD *a2)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v6, 272);
  v6[16] = 2;
  uint64_t v4 = i40e_asq_send_command((uint64_t)a1, (uint64_t)v6, 0, 0, a2);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x12A500uLL, 1u);
  return v4;
}

uint64_t i40e_led_get(uint64_t a1)
{
  int v2 = 22;
  while (1)
  {
    unsigned int v3 = sub_100011E9C(a1, v2);
    if (v3) {
      break;
    }
    if (++v2 == 30) {
      return 0;
    }
  }
  return (v3 >> 12) & 0x1F;
}

uint64_t sub_100011E9C(uint64_t a1, int a2)
{
  int v3 = *(unsigned __int16 *)(a1 + 176);
  BOOL v4 = v3 == 4127 || v3 == 5631;
  if (!v4 && !*(unsigned char *)(a1 + a2 + 488)) {
    return 0;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 4 * a2 + 557312, &readData);
  uint64_t result = 0;
  __dmb(1u);
  if ((readData & 8) == 0)
  {
    if ((readData & 3) == *(unsigned char *)(a1 + 185)) {
      return readData;
    }
    else {
      return 0;
    }
  }
  return result;
}

void i40e_led_set(uint64_t a1, unsigned int a2, int a3)
{
  if (a2 > 0x1F)
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): invalid mode passed in %X\n\n", "i40e_led_set", 1567, a2);
    }
  }
  else
  {
    int v6 = 22;
    for (uint64_t i = 557400; ; i += 4)
    {
      unsigned int v8 = sub_100011E9C(a1, v6);
      if (v8) {
        break;
      }
      if (++v6 == 30) {
        return;
      }
    }
    int v9 = *(unsigned __int16 *)(a1 + 176);
    BOOL v10 = v9 == 5631 || v9 == 4127;
    unsigned int v11 = (v8 & 0xFFFFFC7F | (((a2 >> 4) & 1) << 7)) ^ 0x80;
    if (!v10) {
      unsigned int v11 = v8;
    }
    unsigned int v12 = v11 & 0xFFFE07FF;
    if (a3) {
      int v13 = 2048;
    }
    else {
      int v13 = 0;
    }
    __dmb(2u);
    int v14 = *(IOPCIDevice **)a1;
    IOPCIDevice::MemoryWrite32(v14, 0, i, v13 & 0xFFFE0FFF | ((a2 & 0x1F) << 12) | v12);
  }
}

uint64_t i40e_aq_get_phy_capabilities(uint64_t a1, int a2, int a3, unsigned __int8 *a4, _OWORD *a5)
{
  if (!a4) {
    return 4294967291;
  }
  unsigned int v10 = 0;
  while (1)
  {
    i40e_fill_default_direct_cmd_desc((uint64_t)v14, 1536);
    v14[0] |= 0x1200u;
    if (a2) {
      v15 |= 1u;
    }
    if (a3) {
      v15 |= 2u;
    }
    uint64_t result = i40e_asq_send_command(a1, (uint64_t)v14, a4, 0x218u, a5);
    int v12 = *(_DWORD *)(a1 + 908);
    if (v12 != 8) {
      break;
    }
    IODelay(0x3E8uLL);
    uint64_t result = 4294967259;
    if (*(_DWORD *)(a1 + 908) == 8 && v10++ < 0x1F3) {
      continue;
    }
    return result;
  }
  if (v12 == 5) {
    return 4294967289;
  }
  if (!result && a3)
  {
    if (*(_DWORD *)(a1 + 80) == 1 && *(_WORD *)(a1 + 900) == 1 && *(unsigned __int16 *)(a1 + 902) >= 7u) {
      uint64_t result = i40e_aq_get_link_info(a1, 1, 0, 0);
    }
    else {
      uint64_t result = 0;
    }
    *(void *)(a1 + 72) = *(unsigned int *)a4 | ((unint64_t)a4[13] << 32);
  }
  return result;
}

uint64_t i40e_aq_get_link_info(uint64_t a1, int a2, uint64_t a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v19, 1543);
  if (a2) {
    __int16 v8 = 3;
  }
  else {
    __int16 v8 = 2;
  }
  __int16 v20 = v8;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v19, 0, 0, a4);
  if (result) {
    return result;
  }
  unsigned int v10 = (_DWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a1 + 16);
  *(void *)(a1 + 56) = *(void *)(a1 + 32);
  int v11 = v21;
  *(_DWORD *)(a1 + 16) = v21;
  if ((v11 - 1) > 0x30) {
    int v12 = 0;
  }
  else {
    int v12 = dword_100021A70[(char)(v11 - 1)];
  }
  *(_DWORD *)(a1 + 68) = v12;
  *(_DWORD *)(a1 + 20) = v22;
  *(unsigned char *)(a1 + 24) = v23;
  unsigned int v13 = v24;
  char v14 = v28;
  *(unsigned char *)(a1 + 27) = v28 & 3;
  *(unsigned char *)(a1 + 28) = v25;
  *(unsigned char *)(a1 + 29) = v26 & 7;
  *(_WORD *)(a1 + 32) = v27;
  *(unsigned char *)(a1 + 25) = v13;
  *(unsigned char *)(a1 + 35) = v14 & 0x78;
  if (((v13 >> 5) & 1 & ((v13 & 0x40) >> 6)) != 0)
  {
    int v15 = 3;
  }
  else if ((v13 & 0x20) != 0)
  {
    int v15 = 2;
  }
  else
  {
    if ((v13 & 0x40) == 0)
    {
      *(_DWORD *)(a1 + 168) = 0;
      goto LABEL_16;
    }
    int v15 = 1;
  }
  *(_DWORD *)(a1 + 168) = v15;
LABEL_16:
  *(unsigned char *)(a1 + 34) = (v14 & 4) != 0;
  *(unsigned char *)(a1 + 30) = v20 & 1;
  int v16 = *(_DWORD *)(a1 + 80);
  if (v16 != 1) {
    goto LABEL_24;
  }
  unsigned int v17 = *(unsigned __int16 *)(a1 + 892);
  if (v17 >= 4)
  {
    if (v17 != 4 || v11 != 14 || *(unsigned __int16 *)(a1 + 894) >= 0x28u) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (v11 == 14) {
LABEL_23:
  }
    *unsigned int v10 = 22;
LABEL_24:
  if (v16 != 3 && (*(void *)(a1 + 1688) & 4) != 0) {
    *(void *)(a1 + 72) = v29 | ((unint64_t)v30 << 32);
  }
  if (a3)
  {
    long long v18 = *(_OWORD *)v10;
    *(void *)(a3 + 16) = *(void *)(a1 + 32);
    *(_OWORD *)a3 = v18;
  }
  *(unsigned char *)(a1 + 64) = 0;
  return result;
}

uint64_t i40e_aq_set_phy_config(uint64_t a1, _OWORD *a2, _OWORD *a3)
{
  if (!a2) {
    return 4294967291;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 1537);
  v7[1] = *a2;
  return i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, a3);
}

uint64_t i40e_set_fc(uint64_t a1, unsigned char *a2, int a3)
{
  unsigned int v6 = *(_DWORD *)(a1 + 172);
  *a2 = 0;
  uint64_t result = i40e_aq_get_phy_capabilities(a1, 0, 0, (unsigned __int8 *)&v18, 0);
  if (result)
  {
    char v8 = 1;
LABEL_3:
    *a2 |= v8;
    return result;
  }
  unsigned int v9 = 0x3010200u >> (8 * v6);
  if (v6 >= 4) {
    LOBYTE(v9) = 0;
  }
  char v10 = v20 & 0xFC | v9;
  if (v20 != v10)
  {
    if (a3) {
      char v11 = v10 | 0x20;
    }
    else {
      char v11 = v10;
    }
    int v12 = v18;
    char v13 = v19;
    __int16 v14 = v21;
    int v15 = v22;
    __int16 v16 = v23;
    char v17 = v24 & 0x1F;
    i40e_fill_default_direct_cmd_desc((uint64_t)v25, 1537);
    int v26 = v12;
    char v27 = v13;
    char v28 = v11;
    __int16 v29 = v14;
    int v30 = v15;
    __int16 v31 = v16;
    char v32 = v17;
    char v33 = 0;
    if (i40e_asq_send_command(a1, (uint64_t)v25, 0, 0, 0)) {
      *a2 |= 2u;
    }
  }
  uint64_t result = i40e_update_link_info(a1);
  if (result)
  {
    IODelay(0xF4240uLL);
    uint64_t result = i40e_update_link_info(a1);
    if (result)
    {
      char v8 = 4;
      goto LABEL_3;
    }
  }
  return result;
}

uint64_t i40e_update_link_info(uint64_t a1)
{
  uint64_t result = i40e_aq_get_link_info(a1, 1, 0, 0);
  if (!result)
  {
    if ((*(unsigned char *)(a1 + 24) & 0x40) != 0 && ((*(unsigned char *)(a1 + 24) & 1) != 0 || (*(unsigned char *)(a1 + 48) & 1) == 0)
      || *(_DWORD *)(a1 + 80) == 3)
    {
      uint64_t result = i40e_aq_get_phy_capabilities(a1, 0, *(_DWORD *)(a1 + 80) == 3, v4, 0);
      if (!result)
      {
        if ((v5 & 0x10) != 0) {
          char v3 = 12;
        }
        else {
          char v3 = v5 & 0xC;
        }
        *(unsigned char *)(a1 + 26) = v3;
        *(_WORD *)(a1 + 37) = v6;
        *(unsigned char *)(a1 + 39) = v7;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t i40e_aq_set_mac_config(uint64_t a1, int a2, int a3, char a4, int a5, _OWORD *a6)
{
  if (!a2) {
    return 4294967291;
  }
  __int16 v10 = a2;
  i40e_fill_default_direct_cmd_desc((uint64_t)v14, 1539);
  __int16 v15 = v10;
  char v12 = 8 * (a4 & 0xF);
  if (a3) {
    char v12 = (8 * (a4 & 0xF)) | 4;
  }
  char v16 = v12;
  if (a5)
  {
    if ((*(unsigned char *)(a1 + 1688) & 0x80) != 0)
    {
      char v16 = v12 | 0x80;
    }
    else if ((dword_100028548 & 0x100000) != 0)
    {
      IOLog("ixl:%s(%d): This FW api version does not support drop mode.\n\n", "i40e_aq_set_mac_config", 1852);
    }
  }
  __int16 v17 = 0x7FFF;
  return i40e_asq_send_command(a1, (uint64_t)v14, 0, 0, a6);
}

uint64_t i40e_aq_set_link_restart_an(uint64_t a1, int a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v8, 1541);
  if (a2) {
    char v6 = 6;
  }
  else {
    char v6 = 2;
  }
  v8[16] = v6;
  return i40e_asq_send_command(a1, (uint64_t)v8, 0, 0, a3);
}

uint64_t i40e_aq_set_phy_int_mask(uint64_t a1, __int16 a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 1555);
  v7[12] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, a3);
}

uint64_t i40e_aq_get_local_advt_reg(uint64_t a1, unint64_t *a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 1556);
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, a3);
  if (!result) {
    *a2 = v7[4] | ((unint64_t)v8 << 32);
  }
  return result;
}

uint64_t i40e_aq_set_local_advt_reg(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 1556);
  v7[4] = a2;
  __int16 v8 = WORD2(a2);
  return i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, a3);
}

uint64_t i40e_aq_get_partner_advt(uint64_t a1, unint64_t *a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 1558);
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, a3);
  if (!result) {
    *a2 = v7[4] | ((unint64_t)v8 << 32);
  }
  return result;
}

uint64_t i40e_aq_set_lb_modes(uint64_t a1, char a2, char a3, int a4, _OWORD *a5)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v11, 1560);
  v11[16] = a2;
  v11[17] = a3;
  v11[18] = a4;
  if (a4) {
    v11[19] = 1;
  }
  return i40e_asq_send_command(a1, (uint64_t)v11, 0, 0, a5);
}

uint64_t i40e_aq_set_phy_debug(uint64_t a1, char a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 1570);
  _WORD v7[16] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, a3);
}

uint64_t i40e_aq_add_vsi(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 528);
  __int16 v8 = *(_WORD *)(a2 + 2);
  LOBYTE(v9) = *(unsigned char *)(a2 + 14);
  LOBYTE(v10) = *(unsigned char *)(a2 + 13);
  HIWORD(v10) = *(_WORD *)(a2 + 10);
  v7[0] |= 0x1400u;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v7, (void *)(a2 + 16), 0x80u, a3);
  if (!result)
  {
    *(_WORD *)a2 = v8;
    *(_WORD *)(a2 + 4) = v9;
    *(_DWORD *)(a2 + 6) = v10;
  }
  return result;
}

uint64_t i40e_aq_set_default_vsi(uint64_t a1, __int16 a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 596);
  v7[4] = 524296;
  __int16 v8 = a2;
  return i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, a3);
}

uint64_t i40e_aq_clear_default_vsi(uint64_t a1, __int16 a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 596);
  v7[4] = 0x80000;
  __int16 v8 = a2;
  return i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, a3);
}

uint64_t i40e_aq_set_vsi_unicast_promiscuous(uint64_t a1, __int16 a2, int a3, _OWORD *a4, int a5)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v13, 596);
  if (!a3 || !a5)
  {
    unsigned int v11 = *(unsigned __int16 *)(a1 + 900);
    LOWORD(v14) = a3;
    HIWORD(v14) = 1;
    if (v11 > 1) {
      goto LABEL_15;
    }
LABEL_13:
    if (v11 != 1) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  unsigned int v10 = *(unsigned __int16 *)(a1 + 900);
  if (v10 >= 2)
  {
    int v14 = 98305;
LABEL_15:
    HIWORD(v14) = -32767;
    goto LABEL_16;
  }
  if (v10 != 1)
  {
    unsigned int v11 = 0;
LABEL_12:
    int v14 = 65537;
    goto LABEL_13;
  }
  if (*(unsigned __int16 *)(a1 + 902) < 5u)
  {
    unsigned int v11 = 1;
    goto LABEL_12;
  }
  int v14 = 98305;
LABEL_14:
  if (*(unsigned __int16 *)(a1 + 902) >= 5u) {
    goto LABEL_15;
  }
LABEL_16:
  __int16 v15 = a2;
  return i40e_asq_send_command(a1, (uint64_t)v13, 0, 0, a4);
}

uint64_t i40e_aq_set_vsi_multicast_promiscuous(uint64_t a1, __int16 a2, int a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v10, 596);
  if (a3) {
    __int16 v8 = 2;
  }
  else {
    __int16 v8 = 0;
  }
  v10[8] = v8;
  v10[9] = 2;
  v10[10] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v10, 0, 0, a4);
}

uint64_t i40e_aq_set_vsi_full_promiscuous(uint64_t a1, __int16 a2, int a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v10, 596);
  if (a3) {
    __int16 v8 = 7;
  }
  else {
    __int16 v8 = 0;
  }
  v10[8] = v8;
  v10[9] = 7;
  v10[10] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v10, 0, 0, a4);
}

uint64_t i40e_aq_set_vsi_mc_promisc_on_vlan(uint64_t a1, __int16 a2, int a3, __int16 a4, _OWORD *a5)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v12, 596);
  if (a3) {
    __int16 v10 = 2;
  }
  else {
    __int16 v10 = 0;
  }
  v12[8] = v10;
  v12[9] = 2;
  v12[10] = a2;
  v12[11] = a4 | 0x8000;
  return i40e_asq_send_command(a1, (uint64_t)v12, 0, 0, a5);
}

uint64_t i40e_aq_set_vsi_uc_promisc_on_vlan(uint64_t a1, __int16 a2, int a3, __int16 a4, _OWORD *a5)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v12, 596);
  unsigned int v10 = *(unsigned __int16 *)(a1 + 900);
  if (!a3)
  {
    int v13 = 0x10000;
    if (v10 > 1) {
      goto LABEL_14;
    }
LABEL_12:
    if (v10 != 1) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v10 >= 2)
  {
    int v13 = 98305;
LABEL_14:
    HIWORD(v13) = -32767;
    goto LABEL_15;
  }
  if (v10 != 1)
  {
    unsigned int v10 = 0;
LABEL_11:
    int v13 = 65537;
    goto LABEL_12;
  }
  if (*(unsigned __int16 *)(a1 + 902) < 5u)
  {
    unsigned int v10 = 1;
    goto LABEL_11;
  }
  int v13 = 98305;
LABEL_13:
  if (*(unsigned __int16 *)(a1 + 902) >= 5u) {
    goto LABEL_14;
  }
LABEL_15:
  __int16 v14 = a2;
  __int16 v15 = a4 | 0x8000;
  return i40e_asq_send_command(a1, (uint64_t)v12, 0, 0, a5);
}

uint64_t i40e_aq_set_vsi_bc_promisc_on_vlan(uint64_t a1, __int16 a2, int a3, __int16 a4, _OWORD *a5)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v12, 596);
  if (a3) {
    __int16 v10 = 4;
  }
  else {
    __int16 v10 = 0;
  }
  v12[8] = v10;
  v12[9] = 4;
  v12[10] = a2;
  v12[11] = a4 | 0x8000;
  return i40e_asq_send_command(a1, (uint64_t)v12, 0, 0, a5);
}

uint64_t i40e_aq_set_vsi_broadcast(uint64_t a1, __int16 a2, int a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v10, 596);
  if (a3) {
    __int16 v8 = 4;
  }
  else {
    __int16 v8 = 0;
  }
  __int16 v11 = v11 & 0xFFFB | v8;
  __int16 v12 = 4;
  __int16 v13 = a2;
  return i40e_asq_send_command(a1, (uint64_t)v10, 0, 0, a4);
}

uint64_t i40e_aq_set_vsi_vlan_promisc(uint64_t a1, __int16 a2, int a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v10, 596);
  if (a3) {
    __int16 v8 = 16;
  }
  else {
    __int16 v8 = 0;
  }
  v10[8] = v8;
  v10[9] = 16;
  v10[10] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v10, 0, 0, a4);
}

uint64_t i40e_aq_get_vsi_params(uint64_t a1, __int16 *a2)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v5, 530);
  __int16 v6 = *a2;
  v5[0] |= 0x1000u;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v5, a2 + 8, 0x80u, 0);
  if (!result)
  {
    *a2 = v6;
    a2[2] = v7;
    *(_DWORD *)(a2 + 3) = v8;
  }
  return result;
}

uint64_t i40e_aq_update_vsi_params(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 529);
  _WORD v7[8] = *(_WORD *)a2;
  v7[0] |= 0x1400u;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v7, (void *)(a2 + 16), 0x80u, a3);
  *(_DWORD *)(a2 + 6) = v8;
  return result;
}

uint64_t i40e_aq_get_switch_config(uint64_t a1, void *a2, unsigned int a3, __int16 *a4, _OWORD *a5)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v12, 512);
  if (a3 <= 0x200) {
    __int16 v10 = 4096;
  }
  else {
    __int16 v10 = 4608;
  }
  v12[0] |= v10;
  __int16 v13 = *a4;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v12, a2, a3, a5);
  *a4 = v13;
  return result;
}

uint64_t i40e_aq_set_switch_config(uint64_t a1, __int16 a2, __int16 a3, char a4, _OWORD *a5)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v11, 517);
  v11[8] = a2;
  v11[9] = a3;
  char v13 = a4;
  if ((*(unsigned char *)(a1 + 1688) & 2) != 0)
  {
    v11[10] = *(_WORD *)(a1 + 1696);
    int v12 = *(_DWORD *)(a1 + 1698);
  }
  return i40e_asq_send_command(a1, (uint64_t)v11, 0, 0, a5);
}

uint64_t i40e_aq_get_firmware_version(uint64_t a1, _WORD *a2, _WORD *a3, _DWORD *a4, _WORD *a5, unsigned __int16 *a6, _OWORD *a7)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v17, 1);
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v17, 0, 0, a7);
  if (!result)
  {
    if (a2) {
      *a2 = v18;
    }
    if (a3) {
      *a3 = v19;
    }
    if (a4) {
      *a4 = v17[5];
    }
    if (a5) {
      *a5 = v20;
    }
    if (a6)
    {
      int v15 = v21;
      *a6 = v21;
      if (a3)
      {
        if (a2 && a5 && *a5 == 1 && v15 == 1)
        {
          unsigned int v16 = (unsigned __int16)*a2;
          if (v16 == 4)
          {
            if ((unsigned __int16)*a3 > 1u) {
              goto LABEL_21;
            }
          }
          else if (v16 >= 5)
          {
LABEL_21:
            *a6 = 2;
          }
        }
      }
    }
  }
  return result;
}

uint64_t i40e_aq_send_driver_version(uint64_t a1, int *a2, _OWORD *a3)
{
  if (!a2) {
    return 4294967291;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v8, 2);
  uint64_t v6 = 0;
  v8[0] |= 0x1400u;
  int v9 = *a2;
  do
  {
    if (*((char *)a2 + v6 + 4) < 1) {
      break;
    }
    ++v6;
  }
  while (v6 != 32);
  return i40e_asq_send_command(a1, (uint64_t)v8, a2 + 1, (unsigned __int16)v6, a3);
}

uint64_t i40e_get_link_status(uint64_t a1, unsigned char *a2)
{
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t updated = i40e_update_link_info(a1);
    uint64_t v5 = updated;
    if (updated && (dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): get link failed: status %d\n\n", "i40e_get_link_status", 2853, updated);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = *(unsigned char *)(a1 + 24) & 1;
  return v5;
}

uint64_t i40e_get_link_speed(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64) && i40e_aq_get_link_info(a1, 1, 0, 0)) {
    return 0;
  }
  else {
    return *(unsigned int *)(a1 + 20);
  }
}

uint64_t i40e_aq_add_veb(uint64_t a1, int a2, int a3, char a4, int a5, _WORD *a6, int a7, _OWORD *a8)
{
  if ((a2 != 0) == (a3 == 0)) {
    return 4294967291;
  }
  uint64_t v25 = v8;
  uint64_t v26 = v9;
  __int16 v15 = a3;
  __int16 v16 = a2;
  __int16 v18 = a2 == 0;
  i40e_fill_default_direct_cmd_desc((uint64_t)v22, 560);
  v22[8] = v16;
  v22[9] = v15;
  char v23 = a4;
  if (a5) {
    __int16 v19 = 2;
  }
  else {
    __int16 v19 = 4;
  }
  __int16 v20 = v19 | v18;
  if (!a7) {
    v20 |= 0x10u;
  }
  v22[10] = v20;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v22, 0, 0, a8);
  if (a6)
  {
    if (!result) {
      *a6 = v24;
    }
  }
  return result;
}

uint64_t i40e_aq_get_veb_parameters(uint64_t a1, int a2, _WORD *a3, unsigned char *a4, _WORD *a5, _WORD *a6, _WORD *a7, _OWORD *a8)
{
  if (!a2) {
    return 4294967291;
  }
  __int16 v14 = a2;
  i40e_fill_default_direct_cmd_desc((uint64_t)v17, 562);
  v17[8] = v14;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v17, 0, 0, a8);
  if (!result)
  {
    if (a3) {
      *a3 = v17[9];
    }
    if (a5) {
      *a5 = v19;
    }
    if (a6) {
      *a6 = v20;
    }
    if (a7) {
      *a7 = v21;
    }
    uint64_t result = 0;
    if (a4) {
      *a4 = v18 & 1;
    }
  }
  return result;
}

uint64_t i40e_aq_add_macvlan(uint64_t a1, __int16 a2, unsigned char *a3, unsigned int a4, _OWORD *a5)
{
  uint64_t result = 4294967291;
  if (a1 && a3 && a4)
  {
    i40e_fill_default_direct_cmd_desc((uint64_t)v14, 592);
    uint64_t v11 = 0;
    _WORD v14[8] = a4;
    v14[9] = a2 | 0x8000;
    int v15 = 0;
    do
    {
      if (a3[v11]) {
        *(_WORD *)&a3[v11 + 8] |= 0x10u;
      }
      v11 += 16;
    }
    while (16 * a4 != v11);
    unsigned int v12 = 16 * (a4 & 0xFFF);
    if (v12 <= 0x200) {
      __int16 v13 = 5120;
    }
    else {
      __int16 v13 = 5632;
    }
    v14[0] |= v13;
    return i40e_asq_send_command(a1, (uint64_t)v14, a3, v12, a5);
  }
  return result;
}

uint64_t i40e_aq_remove_macvlan(uint64_t a1, __int16 a2, void *a3, int a4, _OWORD *a5)
{
  uint64_t result = 4294967291;
  if (a1)
  {
    if (a3)
    {
      __int16 v8 = a4;
      if (a4)
      {
        unsigned int v11 = 16 * (a4 & 0xFFF);
        i40e_fill_default_direct_cmd_desc((uint64_t)v13, 593);
        v13[8] = v8;
        _WORD v13[9] = a2 | 0x8000;
        int v14 = 0;
        if (v11 <= 0x200) {
          __int16 v12 = 5120;
        }
        else {
          __int16 v12 = 5632;
        }
        v13[0] |= v12;
        return i40e_asq_send_command(a1, (uint64_t)v13, a3, 16 * (v8 & 0xFFFu), a5);
      }
    }
  }
  return result;
}

uint64_t i40e_aq_add_mirrorrule(uint64_t a1, __int16 a2, __int16 a3, __int16 a4, int a5, void *a6, _OWORD *a7, _WORD *a8, _WORD *a9, _WORD *a10)
{
  if ((a3 & 0xFFFE) == 4 || a5 && a6) {
    return sub_1000138C0(a1, 608, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  }
  else {
    return 4294967291;
  }
}

uint64_t sub_1000138C0(uint64_t a1, __int16 a2, __int16 a3, char a4, __int16 a5, __int16 a6, void *a7, _OWORD *a8, _WORD *a9, _WORD *a10, _WORD *a11)
{
  unsigned __int16 v18 = 2 * a6;
  i40e_fill_default_direct_cmd_desc((uint64_t)v21, a2);
  v21[8] = a3;
  __int16 v22 = a4 & 7;
  __int16 v23 = a6;
  __int16 v24 = a5;
  if (a7)
  {
    __int16 v19 = v21[0];
    v21[0] |= 0x1400u;
    if (v18 >= 0x201u) {
      v21[0] = v19 | 0x1600;
    }
  }
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v21, a7, v18, a8);
  if (!result || *(_DWORD *)(a1 + 908) == 16)
  {
    if (a9) {
      *a9 = v22;
    }
    if (a10) {
      *a10 = v23;
    }
    if (a11) {
      *a11 = v24;
    }
  }
  return result;
}

uint64_t i40e_aq_delete_mirrorrule(uint64_t a1, __int16 a2, int a3, __int16 a4, int a5, void *a6, _OWORD *a7, _WORD *a8, _WORD *a9)
{
  if (a3 != 3 || a5 && a6) {
    return sub_1000138C0(a1, 609, a2, a3, a4, a5, a6, a7, 0, a8, a9);
  }
  else {
    return 4294967291;
  }
}

uint64_t i40e_aq_add_vlan(uint64_t a1, __int16 a2, void *a3, unsigned int a4, _OWORD *a5)
{
  uint64_t result = 4294967291;
  if (a1 && a3 && a4)
  {
    i40e_fill_default_direct_cmd_desc((uint64_t)v12, 594);
    _WORD v12[8] = a4;
    v12[9] = a2 | 0x8000;
    int v13 = 0;
    if (a4 <= 0x40) {
      __int16 v11 = 5120;
    }
    else {
      __int16 v11 = 5632;
    }
    v12[0] |= v11;
    return i40e_asq_send_command(a1, (uint64_t)v12, a3, 8 * a4, a5);
  }
  return result;
}

uint64_t i40e_aq_remove_vlan(uint64_t a1, __int16 a2, void *a3, unsigned int a4, _OWORD *a5)
{
  uint64_t result = 4294967291;
  if (a1 && a3 && a4)
  {
    i40e_fill_default_direct_cmd_desc((uint64_t)v12, 595);
    _WORD v12[8] = a4;
    v12[9] = a2 | 0x8000;
    int v13 = 0;
    if (a4 <= 0x40) {
      __int16 v11 = 5120;
    }
    else {
      __int16 v11 = 5632;
    }
    v12[0] |= v11;
    return i40e_asq_send_command(a1, (uint64_t)v12, a3, 8 * a4, a5);
  }
  return result;
}

uint64_t i40e_aq_send_msg_to_vf(uint64_t a1, int a2, int a3, int a4, void *a5, unsigned int a6, _OWORD *a7)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v17, 2050);
  int v19 = a4;
  int v20 = a2;
  int v18 = a3;
  __int16 v14 = v17[0];
  v17[0] |= 0x2000u;
  if (a6)
  {
    if (a6 <= 0x200) {
      __int16 v15 = 13312;
    }
    else {
      __int16 v15 = 13824;
    }
    v17[0] = v14 | v15;
    _OWORD v17[2] = a6;
  }
  return i40e_asq_send_command(a1, (uint64_t)v17, a5, a6, a7);
}

uint64_t i40e_aq_debug_read_register(uint64_t a1, int a2, unint64_t *a3, _OWORD *a4)
{
  if (!a3) {
    return 4294967291;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, 65283);
  void v9[5] = a2;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v9, 0, 0, a4);
  if (!result) {
    *a3 = v9[7] | ((unint64_t)v9[6] << 32);
  }
  return result;
}

uint64_t i40e_aq_debug_write_register(uint64_t a1, int a2, uint64_t a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, 65284);
  void v9[5] = a2;
  _WORD v9[6] = HIDWORD(a3);
  void v9[7] = a3;
  return i40e_asq_send_command(a1, (uint64_t)v9, 0, 0, a4);
}

uint64_t i40e_aq_request_resource(uint64_t a1, __int16 a2, __int16 a3, int a4, void *a5, _OWORD *a6)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_aq_request_resource", 3466, "i40e_aq_request_resource");
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v13, 8);
  __int16 v14 = a2;
  __int16 v15 = a3;
  int v17 = a4;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v13, 0, 0, a6);
  if (!result || *(_DWORD *)(a1 + 908) == 12) {
    *a5 = v16;
  }
  return result;
}

uint64_t i40e_aq_release_resource(uint64_t a1, __int16 a2, int a3, _OWORD *a4)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_aq_release_resource", 3506, "i40e_aq_release_resource");
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, 9);
  __int16 v10 = a2;
  int v11 = a3;
  return i40e_asq_send_command(a1, (uint64_t)v9, 0, 0, a4);
}

uint64_t i40e_aq_read_nvm(uint64_t a1, char a2, unsigned int a3, unsigned int a4, void *a5, int a6, _OWORD *a7)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_aq_read_nvm", 3540, "i40e_aq_read_nvm");
  }
  if (HIBYTE(a3)) {
    return 4294967291;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v16, 1793);
  if (a6) {
    v17 |= 1u;
  }
  char v18 = a2;
  unsigned int v20 = a3;
  __int16 v19 = a4;
  if (a4 <= 0x200) {
    __int16 v14 = 4096;
  }
  else {
    __int16 v14 = 4608;
  }
  v16[0] |= v14;
  return i40e_asq_send_command(a1, (uint64_t)v16, a5, a4, a7);
}

uint64_t i40e_aq_read_nvm_config(uint64_t a1, __int16 a2, int a3, void *a4, unsigned int a5, _WORD *a6, _OWORD *a7)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v16, 1796);
  if (a5 <= 0x200) {
    __int16 v14 = 4096;
  }
  else {
    __int16 v14 = 4608;
  }
  v16[0] |= v14;
  _WORD v16[8] = a2;
  v16[10] = a3;
  v16[11] = ((__int16)(a2 << 14) >> 15) & HIWORD(a3);
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v16, a4, a5, a7);
  if (a6)
  {
    if (!result) {
      *a6 = v16[9];
    }
  }
  return result;
}

uint64_t i40e_aq_write_nvm_config(uint64_t a1, __int16 a2, void *a3, unsigned int a4, __int16 a5, _OWORD *a6)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v14, 1797);
  if (a4 <= 0x200) {
    __int16 v12 = 5120;
  }
  else {
    __int16 v12 = 5632;
  }
  v14[0] |= v12;
  v14[9] = a5;
  _WORD v14[8] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v14, a3, a4, a6);
}

uint64_t i40e_aq_nvm_update_in_process(uint64_t a1, char a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 1798);
  _WORD v7[16] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, a3);
}

uint64_t i40e_aq_min_rollback_rev_update(uint64_t a1, char a2, char a3, int a4, _OWORD *a5)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v11, 1799);
  v11[16] = a2;
  v11[17] = a3;
  int v12 = a4;
  return i40e_asq_send_command(a1, (uint64_t)v11, 0, 0, a5);
}

uint64_t i40e_aq_oem_post_update(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v8, 1824);
  LODWORD(result) = i40e_asq_send_command(a1, (uint64_t)v8, 0, 0, a4);
  if (v8[3] != 3 || result == 0) {
    return result;
  }
  else {
    return 4294967236;
  }
}

uint64_t i40e_aq_erase_nvm(uint64_t a1, char a2, unsigned int a3, __int16 a4, int a5, _OWORD *a6)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_aq_erase_nvm", 3739, "i40e_aq_erase_nvm");
  }
  if (HIBYTE(a3)) {
    return 4294967291;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v13, 1794);
  if (a5) {
    v14 |= 1u;
  }
  char v15 = a2;
  unsigned int v17 = a3;
  __int16 v16 = a4;
  return i40e_asq_send_command(a1, (uint64_t)v13, 0, 0, a6);
}

uint64_t i40e_aq_discover_capabilities(uint64_t a1, _WORD *a2, unsigned int a3, _WORD *a4, int a5, _OWORD *a6)
{
  if ((a5 - 12) < 0xFFFFFFFE) {
    return 4294967291;
  }
  uint64_t v32 = v6;
  uint64_t v33 = v7;
  i40e_fill_default_direct_cmd_desc((uint64_t)v28, a5);
  if (a3 <= 0x200) {
    __int16 v15 = 4096;
  }
  else {
    __int16 v15 = 4608;
  }
  v28[0] |= v15;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v28, a2, a3, a6);
  *a4 = v28[2];
  if (!result)
  {
    int v16 = v29;
    __int16 v31 = 0;
    if (a5 == 10)
    {
      uint64_t v17 = a1 + 416;
    }
    else
    {
      if (a5 != 11) {
        return 0;
      }
      uint64_t v17 = a1 + 192;
    }
    if (v29)
    {
      do
      {
        unsigned int v18 = (unsigned __int16)*a2;
        uint64_t v19 = *((unsigned int *)a2 + 1);
        uint64_t v20 = *((unsigned int *)a2 + 2);
        uint64_t v21 = *((unsigned int *)a2 + 3);
        unsigned int v22 = *((unsigned __int8 *)a2 + 2);
        if (v18 <= 0x3F)
        {
          switch(*a2)
          {
            case 1:
              *(_DWORD *)uint64_t v17 = v19;
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: Switch mode = %d\n\n");
              }
              break;
            case 2:
              *(_DWORD *)(v17 + 4) = v19;
              if (v22 < 2)
              {
                *(_DWORD *)(v17 + 8) = 0;
              }
              else
              {
                *(_DWORD *)(v17 + 8) = v20;
                if ((dword_100028548 & 0x100000) != 0) {
                  IOLog("ixl:%s(%d): HW Capability: Protocols over MCTP = %d\n\n", "i40e_parse_discover_capabilities", 3813, v20);
                }
              }
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: Management Mode = %d\n\n");
              }
              break;
            case 3:
              *(_DWORD *)(v17 + 12) = v19;
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: NPAR enable = %d\n\n");
              }
              break;
            case 4:
              *(_DWORD *)(v17 + 16) = v19;
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: OS2BMC = %d\n\n");
              }
              break;
            case 5:
              *(_DWORD *)(v17 + 20) = v19;
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: Valid Functions = %d\n\n");
              }
              break;
            case 8:
              *(_WORD *)(a1 + 1684) = v19;
              *(_WORD *)(a1 + 1686) = v20;
              *(unsigned char *)(v17 + 209) = v21 & 1;
              *(_DWORD *)(v17 + 212) = (v21 >> 1) & 1;
              *(unsigned char *)(v17 + 216) = (v21 & 4) != 0;
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: WOL proxy filters = %d\n\n");
              }
              break;
            case 0x12:
              if (v19 == 1) {
                *(unsigned char *)(v17 + 24) = 1;
              }
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: SR-IOV = %d\n\n");
              }
              break;
            case 0x13:
              *(_DWORD *)(v17 + 140) = v19;
              *(_DWORD *)(v17 + 144) = v20;
              if ((dword_100028548 & 0x100000) != 0)
              {
                IOLog("ixl:%s(%d): HW Capability: VF count = %d\n\n", "i40e_parse_discover_capabilities", 3850, v19);
                if ((dword_100028548 & 0x100000) != 0) {
                  IOLog("ixl:%s(%d): HW Capability: VF base_id = %d\n\n");
                }
              }
              break;
            case 0x14:
              if (v19 == 1) {
                *(unsigned char *)(v17 + 25) = 1;
              }
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: VMDQ = %d\n\n");
              }
              break;
            case 0x15:
              if (v19 == 1) {
                *(unsigned char *)(v17 + 26) = 1;
              }
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: 802.1Qbg = %d\n\n");
              }
              break;
            case 0x16:
              if (v19 == 1) {
                *(unsigned char *)(v17 + 27) = 1;
              }
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: 802.1Qbh = %d\n\n");
              }
              break;
            case 0x17:
              *(_DWORD *)(v17 + 148) = v19;
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: VSI count = %d\n\n");
              }
              break;
            case 0x18:
              if (v19 == 1)
              {
                *(unsigned char *)(v17 + 28) = 1;
                *(_DWORD *)(v17 + 192) = v20;
                *(_DWORD *)(v17 + 196) = v21;
              }
              if ((dword_100028548 & 0x100000) != 0)
              {
                IOLog("ixl:%s(%d): HW Capability: DCB = %d\n\n", "i40e_parse_discover_capabilities", 3886, *(unsigned __int8 *)(v17 + 28));
                if ((dword_100028548 & 0x100000) != 0)
                {
                  IOLog("ixl:%s(%d): HW Capability: TC Mapping = %d\n\n", "i40e_parse_discover_capabilities", 3889, v20);
                  if ((dword_100028548 & 0x100000) != 0) {
                    IOLog("ixl:%s(%d): HW Capability: TC Max = %d\n\n");
                  }
                }
              }
              break;
            case 0x21:
              if (v19 == 1) {
                *(unsigned char *)(v17 + 29) = 1;
              }
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: FCOE = %d\n\n");
              }
              break;
            case 0x22:
              if (v19 == 1) {
                *(unsigned char *)(v17 + 30) = 1;
              }
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: iSCSI = %d\n\n");
              }
              break;
            default:
              goto LABEL_132;
          }
          goto LABEL_132;
        }
        if ((unsigned __int16)*a2 > 0x60u)
        {
          if ((unsigned __int16)*a2 > 0x7Fu)
          {
            switch(v18)
            {
              case 0x80u:
                if (v19) {
                  *(unsigned char *)(v17 + 44) = 1;
                }
                if ((v19 & 2) != 0) {
                  *(unsigned char *)(v17 + 45) = 1;
                }
                break;
              case 0xF1u:
                if (v22 == 1)
                {
                  if (v19 == 1)
                  {
                    *(unsigned char *)(v17 + 31) = 1;
                    goto LABEL_128;
                  }
                }
                else
                {
                  if (v19) {
                    *(unsigned char *)(v17 + 31) = 1;
                  }
                  if ((v19 & 2) != 0) {
LABEL_128:
                  }
                    *(unsigned char *)(v17 + 32) = 1;
                }
                *(_DWORD *)(v17 + 36) = v20;
                *(_DWORD *)(v17 + 40) = v21;
                if ((dword_100028548 & 0x100000) != 0)
                {
                  IOLog("ixl:%s(%d): HW Capability: Flex10 mode = %d\n\n", "i40e_parse_discover_capabilities", 3965, v20);
                  if ((dword_100028548 & 0x100000) != 0) {
                    IOLog("ixl:%s(%d): HW Capability: Flex10 status = %d\n\n");
                  }
                }
                break;
              case 0xF2u:
                if (v19 == 1) {
                  *(unsigned char *)(v17 + 46) = 1;
                }
                if ((dword_100028548 & 0x100000) != 0) {
                  IOLog("ixl:%s(%d): HW Capability: CEM = %d\n\n");
                }
                break;
            }
          }
          else
          {
            switch(*a2)
            {
              case 'a':
                if (v21 <= 0x1D) {
                  *(unsigned char *)(v17 + v21 + 72) = 1;
                }
                if ((dword_100028548 & 0x100000) != 0) {
                  IOLog("ixl:%s(%d): HW Capability: LED - PIN %d\n\n");
                }
                break;
              case 'b':
                if (v21 <= 0x1D) {
                  *(unsigned char *)(v17 + v21 + 102) = 1;
                }
                if ((dword_100028548 & 0x100000) != 0) {
                  IOLog("ixl:%s(%d): HW Capability: SDP - PIN %d\n\n");
                }
                break;
              case 'c':
                if (v19 == 1)
                {
                  *(_DWORD *)(v17 + 180) = v21;
                  *(_DWORD *)(v17 + 184) = v20;
                }
                if ((dword_100028548 & 0x100000) != 0)
                {
                  IOLog("ixl:%s(%d): HW Capability: MDIO port number = %d\n\n", "i40e_parse_discover_capabilities", 4001, *(_DWORD *)(v17 + 180));
                  if ((dword_100028548 & 0x100000) != 0) {
                    IOLog("ixl:%s(%d): HW Capability: MDIO port mode = %d\n\n");
                  }
                }
                break;
              case 'd':
                *(void *)(v17 + 200) = v19 | (v20 << 32);
                if ((dword_100028548 & 0x100000) != 0) {
                  IOLog("ixl:%s(%d): HW Capability: wr_csr_prot = 0x%llX\n\n\n");
                }
                break;
              case 'g':
                *(unsigned char *)(v17 + 208) = v19 != 0;
                if ((dword_100028548 & 0x100000) != 0) {
                  IOLog("ixl:%s(%d): HW Capability: dis_unused_ports = %d\n\n\n");
                }
                break;
              default:
                break;
            }
          }
        }
        else
        {
          switch(*a2)
          {
            case '@':
              *(unsigned char *)(v17 + 60) = 1;
              *(_DWORD *)(v17 + 64) = v19;
              *(_DWORD *)(v17 + 68) = v20;
              if ((dword_100028548 & 0x100000) != 0)
              {
                IOLog("ixl:%s(%d): HW Capability: RSS = %d\n\n", "i40e_parse_discover_capabilities", 3910, 1);
                if ((dword_100028548 & 0x100000) != 0)
                {
                  IOLog("ixl:%s(%d): HW Capability: RSS table size = %d\n\n", "i40e_parse_discover_capabilities", 3913, *(_DWORD *)(v17 + 64));
                  if ((dword_100028548 & 0x100000) != 0) {
                    IOLog("ixl:%s(%d): HW Capability: RSS table width = %d\n\n");
                  }
                }
              }
              break;
            case 'A':
              *(_DWORD *)(v17 + 152) = v19;
              *(_DWORD *)(v17 + 160) = v21;
              if ((dword_100028548 & 0x100000) != 0)
              {
                IOLog("ixl:%s(%d): HW Capability: Rx QP = %d\n\n", "i40e_parse_discover_capabilities", 3922, v19);
                if ((dword_100028548 & 0x100000) != 0) {
                  goto LABEL_40;
                }
              }
              break;
            case 'B':
              *(_DWORD *)(v17 + 156) = v19;
              *(_DWORD *)(v17 + 160) = v21;
              if ((dword_100028548 & 0x100000) != 0)
              {
                IOLog("ixl:%s(%d): HW Capability: Tx QP = %d\n\n", "i40e_parse_discover_capabilities", 3931, v19);
                if ((dword_100028548 & 0x100000) != 0) {
LABEL_40:
                }
                  IOLog("ixl:%s(%d): HW Capability: base_queue = %d\n\n");
              }
              break;
            case 'C':
              *(_DWORD *)(v17 + 164) = v19;
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: MSIX vector count = %d\n\n");
              }
              break;
            case 'D':
              *(_DWORD *)(v17 + 168) = v19;
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: MSIX VF vector count = %d\n\n");
              }
              break;
            case 'E':
              *(unsigned char *)(v17 + 49) = 1;
              *(_DWORD *)(v17 + 52) = v19;
              *(_DWORD *)(v17 + 56) = v20;
              if ((dword_100028548 & 0x100000) != 0)
              {
                IOLog("ixl:%s(%d): HW Capability: Flow Director = 1\n\n", "i40e_parse_discover_capabilities", 4018);
                if ((dword_100028548 & 0x100000) != 0) {
                  IOLog("ixl:%s(%d): HW Capability: Guaranteed FD filters = %d\n\n");
                }
              }
              break;
            case 'F':
              if (v19 == 1) {
                *(unsigned char *)(v17 + 47) = 1;
              }
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: IEEE 1588 = %d\n\n");
              }
              break;
            case 'Q':
              if (v19 == 1) {
                *(unsigned char *)(v17 + 48) = 1;
              }
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): HW Capability: iWARP = %d\n\n");
              }
              break;
            default:
              break;
          }
        }
LABEL_132:
        a2 += 16;
        --v16;
      }
      while (v16);
    }
    if (*(unsigned char *)(v17 + 29) && (dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): device is FCoE capable\n\n", "i40e_parse_discover_capabilities", 4061);
    }
    int v23 = 0;
    *(unsigned char *)(v17 + 29) = 0;
    *(_WORD *)(a1 + 650) = 0;
    do
    {
      unint64_t v30 = 0;
      i40e_aq_debug_read_register(a1, v23 + 753952, &v30, 0);
      if ((v30 & 1) == 0) {
        ++*(_WORD *)(a1 + 650);
      }
      v23 += 4;
    }
    while (v23 != 16);
    if (*(_DWORD *)(a1 + 80) == 3 && !i40e_acquire_nvm(a1, 1))
    {
      if (!i40e_aq_read_nvm(a1, 72, 0x56u, 2u, &v31, 1, 0) && v31 < 0) {
        *(_WORD *)(a1 + 650) = 4;
      }
      i40e_release_nvm(a1);
    }
    unsigned int v24 = *(_DWORD *)(v17 + 20);
    if (v24)
    {
      unsigned int v25 = 0;
      do
      {
        v25 += v24 & 1;
        BOOL v26 = v24 > 1;
        v24 >>= 1;
      }
      while (v26);
    }
    else
    {
      unsigned int v25 = 0;
    }
    unsigned int v27 = *(unsigned __int16 *)(a1 + 650);
    if (*(_WORD *)(a1 + 650))
    {
      *(_WORD *)(a1 + 646) = *(unsigned __int8 *)(a1 + 642) / *(_WORD *)(a1 + 650) + 1;
      *(_WORD *)(a1 + 648) = v25 / v27;
    }
    *(unsigned char *)(v17 + 188) = 5;
    return 0;
  }
  return result;
}

uint64_t i40e_aq_update_nvm(uint64_t a1, char a2, unsigned int a3, unsigned int a4, void *a5, int a6, int a7, _OWORD *a8)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_aq_update_nvm", 4192, "i40e_aq_update_nvm");
  }
  if (HIBYTE(a3)) {
    return 4294967291;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v19, 1795);
  if (a6) {
    v20 |= 1u;
  }
  if (*(_DWORD *)(a1 + 80) == 3)
  {
    if (a7 == 1)
    {
      char v16 = 6;
      goto LABEL_12;
    }
    if (a7 == 2)
    {
      char v16 = 2;
LABEL_12:
      v20 |= v16;
    }
  }
  char v21 = a2;
  unsigned int v23 = a3;
  __int16 v22 = a4;
  if (a4 <= 0x200) {
    __int16 v18 = 5120;
  }
  else {
    __int16 v18 = 5632;
  }
  v19[0] |= v18;
  return i40e_asq_send_command(a1, (uint64_t)v19, a5, a4, a8);
}

uint64_t i40e_aq_get_lldp_mib(uint64_t a1, char a2, char a3, void *a4, unsigned int a5, _WORD *a6, _WORD *a7, _OWORD *a8)
{
  uint64_t result = 4294967291;
  if (a4 && a5)
  {
    i40e_fill_default_direct_cmd_desc((uint64_t)v18, 2560);
    char v19 = a3 & 3 | (4 * (a2 & 3));
    v18[2] = a5;
    __int16 v17 = a5 <= 0x200 ? 4096 : 4608;
    v18[0] |= v17;
    uint64_t result = i40e_asq_send_command(a1, (uint64_t)v18, a4, a5, a8);
    if (!result)
    {
      if (a6) {
        *a6 = v20;
      }
      uint64_t result = 0;
      if (a7) {
        *a7 = v21;
      }
    }
  }
  return result;
}

uint64_t i40e_aq_set_lldp_mib(uint64_t a1, char a2, void *a3, unsigned int a4, _OWORD *a5)
{
  uint64_t result = 4294967291;
  if (a3 && a4)
  {
    i40e_fill_default_direct_cmd_desc((uint64_t)v12, 2568);
    if (a4 <= 0x200) {
      __int16 v11 = 5120;
    }
    else {
      __int16 v11 = 5632;
    }
    v12[0] |= v11;
    void v12[2] = a4;
    char v13 = a2;
    __int16 v14 = a4;
    int v15 = HIDWORD(a3);
    int v16 = (int)a3;
    return i40e_asq_send_command(a1, (uint64_t)v12, a3, a4, a5);
  }
  return result;
}

uint64_t i40e_aq_cfg_lldp_mib_change_event(uint64_t a1, char a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 2561);
  if ((a2 & 1) == 0) {
    v8 |= 1u;
  }
  return i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, a3);
}

uint64_t i40e_aq_restore_lldp(uint64_t a1, unsigned char *a2, int a3, _OWORD *a4)
{
  if ((*(unsigned char *)(a1 + 1688) & 0x20) != 0)
  {
    i40e_fill_default_direct_cmd_desc((uint64_t)v9, 2570);
    if (a3) {
      v10 |= 1u;
    }
    uint64_t result = i40e_asq_send_command(a1, (uint64_t)v9, 0, 0, a4);
    if (a2) {
      *a2 = v10 & 1;
    }
  }
  else
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): Restore LLDP not supported by current FW version.\n\n", "i40e_aq_restore_lldp", 4370);
    }
    return 4294967285;
  }
  return result;
}

uint64_t i40e_aq_stop_lldp(uint64_t a1, int a2, int a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, 2565);
  if (a2) {
    v10 |= 1u;
  }
  if (a3)
  {
    if ((*(unsigned char *)(a1 + 1688) & 0x20) != 0)
    {
      v10 |= 2u;
    }
    else if ((dword_100028548 & 0x100000) != 0)
    {
      IOLog("ixl:%s(%d): Persistent Stop LLDP not supported by current FW version.\n\n", "i40e_aq_stop_lldp", 4415);
    }
  }
  return i40e_asq_send_command(a1, (uint64_t)v9, 0, 0, a4);
}

uint64_t i40e_aq_start_lldp(uint64_t a1, int a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 2566);
  char v8 = 1;
  if (a2)
  {
    if ((*(unsigned char *)(a1 + 1688) & 0x20) != 0)
    {
      char v8 = 3;
    }
    else if ((dword_100028548 & 0x100000) != 0)
    {
      IOLog("ixl:%s(%d): Persistent Start LLDP not supported by current FW version.\n\n", "i40e_aq_start_lldp", 4449);
    }
  }
  return i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, a3);
}

uint64_t i40e_aq_set_dcb_parameters(uint64_t a1, int a2, _OWORD *a3)
{
  if ((*(unsigned char *)(a1 + 1688) & 0x10) == 0) {
    return 4294967285;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 771);
  if (a2) {
    _WORD v7[8] = 257;
  }
  return i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, a3);
}

uint64_t i40e_aq_get_cee_dcb_config(uint64_t a1, void *a2, unsigned int a3, _OWORD *a4)
{
  uint64_t result = 4294967291;
  if (a2)
  {
    if (a3)
    {
      i40e_fill_default_direct_cmd_desc((uint64_t)v9, 2567);
      v9[0] |= 0x1000u;
      return i40e_asq_send_command(a1, (uint64_t)v9, a2, a3, a4);
    }
  }
  return result;
}

uint64_t i40e_aq_start_stop_dcbx(uint64_t a1, int a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 2569);
  if (a2) {
    _WORD v7[16] = 1;
  }
  return i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, a3);
}

uint64_t i40e_aq_add_udp_tunnel(uint64_t a1, __int16 a2, char a3, unsigned char *a4, _OWORD *a5)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v11, 2816);
  v11[8] = a2;
  char v13 = a3;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v11, 0, 0, a5);
  if (a4)
  {
    if (!result) {
      *a4 = v12;
    }
  }
  return result;
}

uint64_t i40e_aq_del_udp_tunnel(uint64_t a1, char a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 2817);
  v7[18] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, a3);
}

uint64_t i40e_aq_get_switch_resource_alloc(uint64_t a1, unsigned char *a2, void *a3, __int16 a4, _OWORD *a5)
{
  unsigned int v9 = 16 * (a4 & 0xFFF);
  i40e_fill_default_direct_cmd_desc((uint64_t)v12, 516);
  if (v9 <= 0x200) {
    __int16 v10 = 4096;
  }
  else {
    __int16 v10 = 4608;
  }
  v12[0] |= v10;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v12, a3, v9, a5);
  if (a2)
  {
    if (!result) {
      *a2 = v13;
    }
  }
  return result;
}

uint64_t i40e_aq_delete_element(uint64_t a1, int a2, _OWORD *a3)
{
  if (!a2) {
    return 4294967291;
  }
  __int16 v4 = a2;
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 579);
  _WORD v7[8] = v4;
  return i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, a3);
}

uint64_t i40e_aq_add_pvirt(uint64_t a1, __int16 a2, __int16 a3, int a4, _WORD *a5)
{
  if (!a4) {
    return 4294967291;
  }
  __int16 v6 = a4;
  i40e_fill_default_direct_cmd_desc((uint64_t)v11, 544);
  __int16 v12 = a2;
  __int16 v13 = a3;
  __int16 v14 = v6;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v11, 0, 0, 0);
  if (a5)
  {
    if (!result) {
      *a5 = v12;
    }
  }
  return result;
}

uint64_t i40e_aq_add_tag(uint64_t a1, int a2, int a3, __int16 a4, __int16 a5, _WORD *a6, _WORD *a7, _OWORD *a8)
{
  if (!a3) {
    return 4294967291;
  }
  __int16 v13 = a3;
  i40e_fill_default_direct_cmd_desc((uint64_t)v17, 597);
  v17[9] = v13;
  _WORD v17[10] = a4;
  if (a2)
  {
    v17[8] = 1;
    v17[11] = a5;
  }
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v17, 0, 0, a8);
  if (!result)
  {
    if (a6) {
      *a6 = v17[14];
    }
    uint64_t result = 0;
    if (a7) {
      *a7 = v17[15];
    }
  }
  return result;
}

uint64_t i40e_aq_remove_tag(uint64_t a1, int a2, __int16 a3, _WORD *a4, _WORD *a5, _OWORD *a6)
{
  if (!a2) {
    return 4294967291;
  }
  __int16 v10 = a2;
  i40e_fill_default_direct_cmd_desc((uint64_t)v13, 598);
  v13[8] = v10;
  _WORD v13[9] = a3;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v13, 0, 0, a6);
  if (!result)
  {
    if (a4) {
      *a4 = v13[14];
    }
    uint64_t result = 0;
    if (a5) {
      *a5 = v13[15];
    }
  }
  return result;
}

uint64_t i40e_aq_add_mcast_etag(uint64_t a1, int a2, __int16 a3, int a4, void *a5, _WORD *a6, _WORD *a7, _OWORD *a8)
{
  uint64_t result = 4294967291;
  if (a4)
  {
    __int16 v10 = a2;
    if (a2)
    {
      if (a5)
      {
        i40e_fill_default_direct_cmd_desc((uint64_t)v17, 599);
        v17[8] = v10;
        v17[9] = a3;
        LOBYTE(v18) = a4;
        v17[0] |= 0x1400u;
        uint64_t result = i40e_asq_send_command(a1, (uint64_t)v17, a5, 2 * a4, a8);
        if (!result)
        {
          if (a6) {
            *a6 = v18;
          }
          uint64_t result = 0;
          if (a7) {
            *a7 = v19;
          }
        }
      }
    }
  }
  return result;
}

uint64_t i40e_aq_remove_mcast_etag(uint64_t a1, int a2, __int16 a3, _WORD *a4, _WORD *a5, _OWORD *a6)
{
  if (!a2) {
    return 4294967291;
  }
  __int16 v10 = a2;
  i40e_fill_default_direct_cmd_desc((uint64_t)v13, 600);
  v13[8] = v10;
  _WORD v13[9] = a3;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v13, 0, 0, a6);
  if (!result)
  {
    if (a4) {
      *a4 = v13[10];
    }
    uint64_t result = 0;
    if (a5) {
      *a5 = v13[11];
    }
  }
  return result;
}

uint64_t i40e_aq_update_tag(uint64_t a1, int a2, __int16 a3, __int16 a4, _WORD *a5, _WORD *a6, _OWORD *a7)
{
  if (!a2) {
    return 4294967291;
  }
  __int16 v12 = a2;
  i40e_fill_default_direct_cmd_desc((uint64_t)v15, 601);
  v15[8] = v12;
  v15[9] = a3;
  v15[10] = a4;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v15, 0, 0, a7);
  if (!result)
  {
    if (a5) {
      *a5 = v15[14];
    }
    uint64_t result = 0;
    if (a6) {
      *a6 = v15[15];
    }
  }
  return result;
}

uint64_t i40e_aq_dcb_ignore_pfc(uint64_t a1, char a2, int a3, unsigned char *a4, _OWORD *a5)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v11, 769);
  if (a3) {
    char v13 = 0x80;
  }
  char v12 = a2;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v11, 0, 0, a5);
  if (a4)
  {
    if (!result) {
      *a4 = v12;
    }
  }
  return result;
}

uint64_t i40e_aq_dcb_updated(uint64_t a1, _OWORD *a2)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v5, 770);
  return i40e_asq_send_command(a1, (uint64_t)v5, 0, 0, a2);
}

uint64_t i40e_aq_add_statistics(uint64_t a1, int a2, __int16 a3, _WORD *a4, _OWORD *a5)
{
  uint64_t result = 4294967291;
  if (a2 && a4)
  {
    __int16 v10 = a2;
    i40e_fill_default_direct_cmd_desc((uint64_t)v11, 513);
    v11[8] = v10;
    _WORD v11[9] = a3;
    uint64_t result = i40e_asq_send_command(a1, (uint64_t)v11, 0, 0, a5);
    if (!result) {
      *a4 = v11[10];
    }
  }
  return result;
}

uint64_t i40e_aq_remove_statistics(uint64_t a1, int a2, __int16 a3, __int16 a4, _OWORD *a5)
{
  if (!a2) {
    return 4294967291;
  }
  __int16 v8 = a2;
  i40e_fill_default_direct_cmd_desc((uint64_t)v11, 514);
  v11[8] = v8;
  _WORD v11[9] = a3;
  v11[10] = a4;
  return i40e_asq_send_command(a1, (uint64_t)v11, 0, 0, a5);
}

uint64_t i40e_aq_set_port_parameters(uint64_t a1, __int16 a2, __int16 a3, int a4, int a5, _OWORD *a6)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v14, 515);
  v14[9] = a2;
  __int16 v12 = a3 | 2;
  if (!a4) {
    __int16 v12 = a3;
  }
  if (a5) {
    v12 |= 4u;
  }
  _WORD v14[8] = v12;
  return i40e_asq_send_command(a1, (uint64_t)v14, 0, 0, a6);
}

uint64_t i40e_aq_config_vsi_bw_limit(uint64_t a1, __int16 a2, __int16 a3, char a4, _OWORD *a5)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v11, 1024);
  v11[8] = a2;
  v11[10] = a3;
  char v12 = a4;
  return i40e_asq_send_command(a1, (uint64_t)v11, 0, 0, a5);
}

uint64_t i40e_aq_config_switch_comp_bw_limit(uint64_t a1, __int16 a2, __int16 a3, char a4, _OWORD *a5)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v11, 1040);
  v11[8] = a2;
  v11[10] = a3;
  char v12 = a4;
  return i40e_asq_send_command(a1, (uint64_t)v11, 0, 0, a5);
}

uint64_t i40e_aq_config_vsi_ets_sla_bw_limit(uint64_t a1, __int16 a2, void *a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, 1030);
  v9[0] |= 0x1400u;
  v9[2] = 64;
  _DWORD v9[8] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v9, a3, 0x40u, a4);
}

uint64_t i40e_aq_config_vsi_tc_bw(uint64_t a1, __int16 a2, void *a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, 1031);
  v9[0] |= 0x1400u;
  v9[2] = 32;
  _DWORD v9[8] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v9, a3, 0x20u, a4);
}

uint64_t i40e_aq_config_switch_comp_ets_bw_limit(uint64_t a1, __int16 a2, void *a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, 1046);
  v9[0] |= 0x1400u;
  v9[2] = 64;
  _DWORD v9[8] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v9, a3, 0x40u, a4);
}

uint64_t i40e_aq_query_vsi_bw_config(uint64_t a1, __int16 a2, void *a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, 1032);
  v9[0] |= 0x1000u;
  v9[2] = 64;
  _DWORD v9[8] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v9, a3, 0x40u, a4);
}

uint64_t i40e_aq_query_vsi_ets_sla_config(uint64_t a1, __int16 a2, void *a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, 1034);
  v9[0] |= 0x1000u;
  v9[2] = 32;
  _DWORD v9[8] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v9, a3, 0x20u, a4);
}

uint64_t i40e_aq_query_switch_comp_ets_config(uint64_t a1, __int16 a2, void *a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, 1048);
  v9[0] |= 0x1000u;
  v9[2] = 64;
  _DWORD v9[8] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v9, a3, 0x40u, a4);
}

uint64_t i40e_aq_query_port_ets_config(uint64_t a1, __int16 a2, void *a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, 1049);
  v9[0] |= 0x1000u;
  v9[2] = 68;
  _DWORD v9[8] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v9, a3, 0x44u, a4);
}

uint64_t i40e_aq_query_switch_comp_bw_config(uint64_t a1, __int16 a2, void *a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, 1050);
  v9[0] |= 0x1000u;
  v9[2] = 32;
  _DWORD v9[8] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v9, a3, 0x20u, a4);
}

uint64_t i40e_set_filter_control(IOPCIDevice **a1, uint64_t a2)
{
  if (!a2) {
    return 4294967291;
  }
  unsigned int v3 = *(_DWORD *)(a2 + 8);
  if (v3 > 5) {
    return 4294967291;
  }
  unsigned int v4 = *(_DWORD *)(a2 + 12);
  if (v4 > 3 || *(_DWORD *)a2 > 0xAu || *(_DWORD *)(a2 + 4) > 9u) {
    return 4294967291;
  }
  int v6 = 1024 << v3;
  int v7 = 512 << v4;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0xC20D0uLL, &readData);
  __dmb(1u);
  if (v7 + v6 > (unsigned __int16)readData) {
    return 4294967270;
  }
  uint32_t v9 = i40e_read_rx_ctl((uint64_t)a1, 0x1C0AC0uLL) & 0xFFFE0000 | *(_DWORD *)a2 & 0x1F | (32 * (*(_WORD *)(a2 + 4) & 0x1F)) & 0x3FF | ((*(_WORD *)(a2 + 8) & 0xF) << 10) & 0x3FFF | ((*(_DWORD *)(a2 + 12) & 3) << 14) | ((*(_DWORD *)(a2 + 16) == 1) << 16);
  if (*(unsigned char *)(a2 + 20)) {
    v9 |= 0x20000u;
  }
  if (*(unsigned char *)(a2 + 21)) {
    v9 |= 0x40000u;
  }
  if (*(unsigned char *)(a2 + 22)) {
    uint32_t v10 = v9 | 0x80000;
  }
  else {
    uint32_t v10 = v9;
  }
  i40e_write_rx_ctl((uint64_t)a1, 0x1C0AC0uLL, v10);
  return 0;
}

uint64_t i40e_read_rx_ctl(uint64_t a1, uint64_t offset)
{
  unsigned int v2 = offset;
  unsigned int v9 = 0;
  if ((*(_WORD *)(a1 + 900) != 1 || *(unsigned __int16 *)(a1 + 902) >= 5u) && *(_DWORD *)(a1 + 80) != 3)
  {
    int v4 = i40e_aq_rx_ctl_read_register(a1, offset, &v9, 0);
    if (*(_DWORD *)(a1 + 908) == 8)
    {
      int v5 = -4;
      do
      {
        IODelay(0x3E8uLL);
        int v4 = i40e_aq_rx_ctl_read_register(a1, v2, &v9, 0);
      }
      while (*(_DWORD *)(a1 + 908) == 8 && v5++ != 0);
    }
    if (!v4) {
      return v9;
    }
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v2, &readData);
  __dmb(1u);
  return readData;
}

void i40e_write_rx_ctl(uint64_t a1, uint64_t offset, uint32_t data)
{
  unsigned int v4 = offset;
  if (*(_WORD *)(a1 + 900) == 1 && *(unsigned __int16 *)(a1 + 902) < 5u || *(_DWORD *)(a1 + 80) == 3) {
    goto LABEL_12;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, 519);
  unsigned int v10 = v4;
  uint32_t v11 = data;
  int v6 = i40e_asq_send_command(a1, (uint64_t)v9, 0, 0, 0);
  if (*(_DWORD *)(a1 + 908) == 8)
  {
    int v7 = -4;
    do
    {
      IODelay(0x3E8uLL);
      i40e_fill_default_direct_cmd_desc((uint64_t)v9, 519);
      unsigned int v10 = v4;
      uint32_t v11 = data;
      int v6 = i40e_asq_send_command(a1, (uint64_t)v9, 0, 0, 0);
    }
    while (*(_DWORD *)(a1 + 908) == 8 && v7++ != 0);
  }
  if (v6)
  {
LABEL_12:
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v4, data);
  }
}

double i40e_aq_add_rem_control_packet_filter(uint64_t a1, uint64_t a2, __int16 a3, __int16 a4, int a5, __int16 a6, int a7, double *a8, _OWORD *a9)
{
  if (!a5) {
    return result;
  }
  __int16 v10 = a5;
  if (!a7)
  {
    i40e_fill_default_direct_cmd_desc((uint64_t)v18, 603);
    if (!a2) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v18, 602);
  __int16 v22 = a6;
  if (a2)
  {
LABEL_7:
    LODWORD(v19) = *(_DWORD *)a2;
    WORD2(v19) = *(_WORD *)(a2 + 4);
  }
LABEL_8:
  HIWORD(v19) = a3;
  __int16 v20 = a4;
  __int16 v21 = v10;
  int v16 = i40e_asq_send_command(a1, (uint64_t)v18, 0, 0, a9);
  if (a8)
  {
    if (!v16)
    {
      double result = v19;
      *a8 = v19;
    }
  }
  return result;
}

void i40e_add_filter_to_drop_tx_flow_control_frames(uint64_t a1, int a2)
{
  i40e_aq_add_rem_control_packet_filter(a1, 0, 34824, 11, a2, 0, 1, 0, 0);
  if (v2)
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): %s\n", "i40e_add_filter_to_drop_tx_flow_control_frames", 5631, "Ethtype Filter Add failed: Error pruning Tx flow control frames\n");
    }
  }
}

uint64_t i40e_aq_add_cloud_filters(uint64_t a1, __int16 a2, _DWORD *a3, unsigned int a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v11, 604);
  v11[2] = (_WORD)a4 << 6;
  v11[0] |= 0x1400u;
  char v12 = a4;
  __int16 v13 = a2;
  if (a4)
  {
    uint64_t v8 = a4;
    unsigned int v9 = a3 + 8;
    do
    {
      if ((*((_WORD *)v9 - 1) & 0x1E00) == 0x400) {
        *v9 <<= 8;
      }
      v9 += 16;
      --v8;
    }
    while (v8);
  }
  return i40e_asq_send_command(a1, (uint64_t)v11, a3, a4 << 6, 0);
}

uint64_t i40e_aq_add_cloud_filters_bb(uint64_t a1, __int16 a2, _DWORD *a3, unsigned int a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v11, 604);
  v11[2] = (_WORD)a4 << 7;
  v11[0] |= 0x1400u;
  char v12 = a4;
  __int16 v13 = a2;
  char v14 = 1;
  if (a4)
  {
    uint64_t v8 = a4;
    unsigned int v9 = a3 + 8;
    do
    {
      if ((*((_WORD *)v9 - 1) & 0x1E00) == 0x400) {
        *v9 <<= 8;
      }
      v9 += 32;
      --v8;
    }
    while (v8);
  }
  return i40e_asq_send_command(a1, (uint64_t)v11, a3, a4 << 7, 0);
}

uint64_t i40e_aq_rem_cloud_filters(uint64_t a1, __int16 a2, _DWORD *a3, unsigned int a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v11, 605);
  v11[2] = (_WORD)a4 << 6;
  v11[0] |= 0x1400u;
  char v12 = a4;
  __int16 v13 = a2;
  if (a4)
  {
    uint64_t v8 = a4;
    unsigned int v9 = a3 + 8;
    do
    {
      if ((*((_WORD *)v9 - 1) & 0x1E00) == 0x400) {
        *v9 <<= 8;
      }
      v9 += 16;
      --v8;
    }
    while (v8);
  }
  return i40e_asq_send_command(a1, (uint64_t)v11, a3, a4 << 6, 0);
}

uint64_t i40e_aq_rem_cloud_filters_bb(uint64_t a1, __int16 a2, _DWORD *a3, unsigned int a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v11, 605);
  v11[2] = (_WORD)a4 << 7;
  v11[0] |= 0x1400u;
  char v12 = a4;
  __int16 v13 = a2;
  char v14 = 1;
  if (a4)
  {
    uint64_t v8 = a4;
    unsigned int v9 = a3 + 8;
    do
    {
      if ((*((_WORD *)v9 - 1) & 0x1E00) == 0x400) {
        *v9 <<= 8;
      }
      v9 += 32;
      --v8;
    }
    while (v8);
  }
  return i40e_asq_send_command(a1, (uint64_t)v11, a3, a4 << 7, 0);
}

__n128 i40e_aq_replace_cloud_filters(uint64_t a1, int *a2, __n128 *a3)
{
  if (*(_DWORD *)(a1 + 80) != 3 && *(unsigned __int16 *)(a1 + 892) >= 6u)
  {
    i40e_fill_default_direct_cmd_desc((uint64_t)v8, 607);
    unsigned char v8[2] = 32;
    v8[0] |= 0x1400u;
    int v9 = *a2;
    char v10 = *((unsigned char *)a2 + 4);
    i40e_asq_send_command(a1, (uint64_t)v8, a3, 0x40u, 0);
    __n128 result = *a3;
    __n128 v7 = a3[1];
    a3[2] = *a3;
    a3[3] = v7;
  }
  return result;
}

uint64_t i40e_aq_alternate_write(uint64_t a1, int a2, int a3, int a4, int a5)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v11, 2304);
  v11[4] = a2;
  v11[5] = a3;
  v11[6] = a4;
  v11[7] = a5;
  return i40e_asq_send_command(a1, (uint64_t)v11, 0, 0, 0);
}

uint64_t i40e_aq_alternate_write_indirect(uint64_t a1, int a2, unsigned int a3, void *a4)
{
  if (!a4) {
    return 4294967291;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v10, 2305);
  if (a3 <= 0x80) {
    __int16 v8 = 5120;
  }
  else {
    __int16 v8 = 5632;
  }
  v10[0] |= v8;
  int v11 = a2;
  unsigned int v12 = a3;
  return i40e_asq_send_command(a1, (uint64_t)v10, a4, 4 * (a3 & 0x3FFF), 0);
}

uint64_t i40e_aq_alternate_read(uint64_t a1, int a2, _DWORD *a3, int a4, _DWORD *a5)
{
  if (!a3) {
    return 4294967291;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v11, 2306);
  v11[4] = a2;
  v11[6] = a4;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v11, 0, 0, 0);
  if (!result)
  {
    *a3 = v11[5];
    uint64_t result = 0;
    if (a5) {
      *a5 = v11[7];
    }
  }
  return result;
}

uint64_t i40e_aq_alternate_read_indirect(uint64_t a1, int a2, unsigned int a3, void *a4)
{
  if (!a4) {
    return 4294967291;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v10, 2307);
  if (a3 <= 0x80) {
    __int16 v8 = 5120;
  }
  else {
    __int16 v8 = 5632;
  }
  v10[0] |= v8;
  int v11 = a2;
  unsigned int v12 = a3;
  return i40e_asq_send_command(a1, (uint64_t)v10, a4, 4 * (a3 & 0x3FFF), 0);
}

uint64_t i40e_aq_alternate_clear(uint64_t a1)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v3, 2310);
  return i40e_asq_send_command(a1, (uint64_t)v3, 0, 0, 0);
}

uint64_t i40e_aq_alternate_write_done(uint64_t a1, __int16 a2, BOOL *a3)
{
  if (!a3) {
    return 4294967291;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 2308);
  __int16 v8 = a2;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, 0);
  if (!result) {
    *a3 = (v8 & 2) != 0;
  }
  return result;
}

uint64_t i40e_aq_set_oem_mode(uint64_t a1, __int16 a2)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v5, 2309);
  _WORD v5[8] = a2;
  return i40e_asq_send_command(a1, (uint64_t)v5, 0, 0, 0);
}

uint64_t i40e_aq_resume_port_tx(uint64_t a1, _OWORD *a2)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v5, 1052);
  return i40e_asq_send_command(a1, (uint64_t)v5, 0, 0, a2);
}

_DWORD *i40e_set_pci_config_data(_DWORD *result, __int16 a2)
{
  result[30] = 3;
  unsigned int v2 = (a2 & 0x3F0) - 16;
  if (v2 > 0x7F) {
    int v3 = 0;
  }
  else {
    int v3 = dword_100021B34[v2 >> 4];
  }
  result[29] = v3;
  uint64_t v4 = (a2 & 0xF) - 1;
  if (v4 > 2) {
    int v5 = 0;
  }
  else {
    int v5 = dword_100021B54[v4];
  }
  result[28] = v5;
  return result;
}

uint64_t i40e_aq_debug_dump(uint64_t a1, char a2, char a3, int a4, unsigned int a5, void *a6, _WORD *a7, unsigned char *a8, _DWORD *a9, _OWORD *a10)
{
  uint64_t result = 4294967291;
  if (a5 && a6)
  {
    i40e_fill_default_direct_cmd_desc((uint64_t)v20, 65288);
    __int16 v19 = a5 <= 0x200 ? 4096 : 4608;
    v20[0] |= v19;
    char v22 = a2;
    char v23 = a3;
    int v24 = a4;
    __int16 v21 = a5;
    uint64_t result = i40e_asq_send_command(a1, (uint64_t)v20, a6, a5, a10);
    if (!result)
    {
      if (a7) {
        *a7 = v21;
      }
      if (a8) {
        *a8 = v23;
      }
      uint64_t result = 0;
      if (a9) {
        *a9 = v24;
      }
    }
  }
  return result;
}

uint64_t i40e_enable_eee(uint64_t a1, int a2)
{
  uint64_t result = i40e_aq_get_phy_capabilities(a1, 0, 1, (unsigned __int8 *)&v15, 0);
  if (!result)
  {
    __int16 v5 = v18;
    if (v18)
    {
      uint64_t result = i40e_aq_get_phy_capabilities(a1, 0, 0, (unsigned __int8 *)&v15, 0);
      if (!result)
      {
        int v6 = v15;
        char v7 = v16;
        char v8 = v17 | 0x20;
        __int16 v9 = v20;
        char v10 = v21 & 0x1F;
        BOOL v11 = a2 == 0;
        if (a2) {
          __int16 v12 = v5;
        }
        else {
          __int16 v12 = 0;
        }
        if (v11) {
          int v13 = 0;
        }
        else {
          int v13 = 0x10000;
        }
        unsigned int v14 = v19 & 0xFFFEFFFF | v13;
        i40e_fill_default_direct_cmd_desc((uint64_t)v22, 1537);
        int v23 = v6;
        char v24 = v7;
        char v25 = v8;
        __int16 v26 = v12;
        unsigned int v27 = v14;
        __int16 v28 = v9;
        char v29 = v10;
        return i40e_asq_send_command(a1, (uint64_t)v22, 0, 0, 0);
      }
    }
    else
    {
      return 4294967292;
    }
  }
  return result;
}

uint64_t i40e_read_bw_from_alt_ram(uint64_t a1, int *a2, int *a3, BOOL *a4, BOOL *a5)
{
  uint64_t result = i40e_aq_alternate_read(a1, (*(unsigned __int8 *)(a1 + 642) << 6) | 0xFu, a2, (*(unsigned __int8 *)(a1 + 642) << 6) | 0xEu, a3);
  *a4 = *a3 < 0;
  *a5 = *a2 < 0;
  return result;
}

uint64_t i40e_aq_configure_partition_bw(uint64_t a1, void *a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 1053);
  v7[0] |= 0x1400u;
  _OWORD v7[2] = 34;
  return i40e_asq_send_command(a1, (uint64_t)v7, a2, 0x22u, a3);
}

uint64_t i40e_read_phy_register_clause22(uint64_t a1, int a2, int a3, _WORD *a4)
{
  int v6 = *(_DWORD *)(a1 + 596);
  __dmb(2u);
  int v7 = 4 * v6;
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v7 + 557452), (a2 << 16) | (a3 << 21) | 0x58000000);
  int v8 = 1000;
  do
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (v7 + 557452), &readData);
    __dmb(1u);
    if ((readData & 0x40000000) == 0)
    {
      uint32_t v10 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (v7 + 557468), &v10);
      uint64_t result = 0;
      __dmb(1u);
      *a4 = HIWORD(v10);
      return result;
    }
    IODelay(0xAuLL);
    --v8;
  }
  while ((_WORD)v8);
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): PHY: Can't write command to external PHY.\n\n", "i40e_read_phy_register_clause22", 6436);
  }
  return 4294967259;
}

uint64_t i40e_write_phy_register_clause22(uint64_t a1, int a2, int a3, uint32_t a4)
{
  unsigned __int8 v7 = *(_DWORD *)(a1 + 596);
  __dmb(2u);
  int v8 = 4 * v7 + 557056;
  uint64_t v9 = (v8 + 396);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v8 + 412), a4);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v9, (a2 << 16) | (a3 << 21) | 0x54000000);
  int v10 = 1000;
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v9, &readData);
    __dmb(1u);
    if ((readData & 0x40000000) == 0) {
      break;
    }
    IODelay(0xAuLL);
    if (!(_WORD)--v10) {
      return 4294967259;
    }
  }
  return 0;
}

uint64_t i40e_read_phy_register_clause45(uint64_t a1, int a2, int a3, int a4, _WORD *a5)
{
  int v7 = *(_DWORD *)(a1 + 596);
  int v8 = a2 << 16;
  int v9 = a4 << 21;
  __dmb(2u);
  int v10 = 4 * v7;
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v10 + 557452), a3 & 0xFF00FFFF | (a2 << 16) | (a4 << 21) | 0xC0000000);
  int v11 = 1000;
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (v10 + 557452), &readData);
    __dmb(1u);
    if ((readData & 0x40000000) == 0) {
      break;
    }
    IODelay(0xAuLL);
    if (!(_WORD)--v11)
    {
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): PHY: Can't write command to external PHY.\n\n");
      }
      return 4294967259;
    }
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v10 + 557452), v9 | v8 | 0xCC000000);
  int v12 = 1000;
  do
  {
    uint32_t v15 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (v10 + 557452), &v15);
    __dmb(1u);
    if ((v15 & 0x40000000) == 0)
    {
      uint32_t v14 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (v10 + 557468), &v14);
      uint64_t result = 0;
      __dmb(1u);
      *a5 = HIWORD(v14);
      return result;
    }
    IODelay(0xAuLL);
    --v12;
  }
  while ((_WORD)v12);
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): PHY: Can't read register value from external PHY.\n\n");
  }
  return 4294967259;
}

uint64_t i40e_write_phy_register_clause45(uint64_t a1, int a2, int a3, int a4, uint32_t a5)
{
  int v7 = *(_DWORD *)(a1 + 596);
  int v8 = a2 << 16;
  int v9 = a4 << 21;
  __dmb(2u);
  int v10 = 4 * v7;
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v10 + 557452), a3 & 0xFF00FFFF | (a2 << 16) | (a4 << 21) | 0xC0000000);
  int v11 = 1000;
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (v10 + 557452), &readData);
    __dmb(1u);
    if ((readData & 0x40000000) == 0) {
      break;
    }
    IODelay(0xAuLL);
    if (!(_WORD)--v11)
    {
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): PHY: Can't write command to external PHY.\n\n", "i40e_write_phy_register_clause45", 6597);
      }
      return 4294967259;
    }
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v10 + 557468), a5);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v10 + 557452), v9 | v8 | 0xC4000000);
  int v12 = 1000;
  while (1)
  {
    uint32_t v14 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (v10 + 557452), &v14);
    __dmb(1u);
    if ((v14 & 0x40000000) == 0) {
      break;
    }
    IODelay(0xAuLL);
    if (!(_WORD)--v12) {
      return 4294967259;
    }
  }
  return 0;
}

uint64_t i40e_write_phy_register(uint64_t a1, int a2, int a3, int a4, uint32_t a5)
{
  unsigned int v5 = *(unsigned __int16 *)(a1 + 176);
  if (v5 <= 0x15FE)
  {
    if ((v5 - 5510 > 5 || ((1 << (v5 + 122)) & 0x39) == 0) && v5 != 4127) {
      return 4294967289;
    }
    return i40e_write_phy_register_clause45(a1, a2, a3, a4, a5);
  }
  if (v5 == 5631 || v5 == 14290) {
    return i40e_write_phy_register_clause45(a1, a2, a3, a4, a5);
  }
  if (v5 == 14289) {
    return i40e_write_phy_register_clause22(a1, a3, a4, a5);
  }
  return 4294967289;
}

uint64_t i40e_read_phy_register(uint64_t a1, int a2, int a3, int a4, _WORD *a5)
{
  unsigned int v5 = *(unsigned __int16 *)(a1 + 176);
  if (v5 <= 0x15FE)
  {
    if ((v5 - 5510 > 5 || ((1 << (v5 + 122)) & 0x39) == 0) && v5 != 4127) {
      return 4294967289;
    }
    return i40e_read_phy_register_clause45(a1, a2, a3, a4, a5);
  }
  if (v5 == 5631 || v5 == 14290) {
    return i40e_read_phy_register_clause45(a1, a2, a3, a4, a5);
  }
  if (v5 == 14289) {
    return i40e_read_phy_register_clause22(a1, a3, a4, a5);
  }
  return 4294967289;
}

uint64_t i40e_get_phy_address(uint64_t a1, char a2)
{
  unsigned __int8 v3 = *(_DWORD *)(a1 + 596);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 4 * v3 + 557504, &readData);
  __dmb(1u);
  return (readData >> (5 * a2 + 5)) & 0x1F;
}

uint64_t i40e_blink_phy_link_led(IOPCIDevice **a1, int a2, int a3)
{
  unsigned __int16 v15 = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x1C0480uLL, &readData);
  __dmb(1u);
  int phy_address = i40e_get_phy_address((uint64_t)a1, readData & 3);
  unsigned int v7 = 0;
  unsigned __int16 v8 = -15312;
  while (1)
  {
    uint64_t result = i40e_read_phy_register_clause45((uint64_t)a1, 30, v8, phy_address, &v15);
    if (result) {
      return result;
    }
    uint32_t v10 = v15;
    if ((v15 & 0xF0) != 0)
    {
      unsigned __int16 v15 = 0;
      uint64_t result = i40e_write_phy_register_clause45((uint64_t)a1, 30, v8, phy_address, 0);
      if (result) {
        return result;
      }
      goto LABEL_8;
    }
    ++v8;
    if (v7++ >= 2)
    {
      unsigned __int16 v8 = -15309;
LABEL_8:
      if (a2 && a3 && 1000 * a2)
      {
        unsigned int v12 = 0;
        do
        {
          if (i40e_read_phy_register_clause45((uint64_t)a1, 30, v8, phy_address, &v15)) {
            break;
          }
          uint32_t v13 = ~v15 & 0x100;
          unsigned __int16 v15 = ~v15 & 0x100;
          if (i40e_write_phy_register_clause45((uint64_t)a1, 30, v8, phy_address, v13)) {
            break;
          }
          IODelay((1000 * a3));
          v12 += a3;
        }
        while (v12 < 1000 * a2);
      }
      return i40e_write_phy_register_clause45((uint64_t)a1, 30, v8, phy_address, v10);
    }
  }
}

uint64_t i40e_led_get_reg(uint64_t a1, int a2, _DWORD *a3)
{
  *a3 = 0;
  if ((*(unsigned char *)(a1 + 1688) & 4) != 0) {
    return i40e_aq_get_phy_register_ext(a1, 1, 30, 1, 0, 0, 50224, a3, 0);
  }
  int phy_address = i40e_get_phy_address(a1, *(unsigned char *)(a1 + 185));
  return i40e_read_phy_register_clause45(a1, 30, a2, phy_address, a3);
}

uint64_t i40e_aq_get_phy_register_ext(uint64_t a1, char a2, char a3, char a4, int a5, char a6, int a7, _DWORD *a8, _OWORD *a9)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v18, 1577);
  v19[0] = a2;
  v19[1] = a3;
  int v20 = a7;
  if ((a4 & 1) == 0) {
    unsigned char v19[2] = 1;
  }
  sub_100018208(a1, a5, a6, v19);
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v18, 0, 0, a9);
  if (!result) {
    *a8 = v21;
  }
  return result;
}

uint64_t i40e_led_set_reg(uint64_t a1, int a2, unsigned __int16 a3)
{
  if ((*(unsigned char *)(a1 + 1688) & 4) != 0) {
    return i40e_aq_set_phy_register_ext(a1, 1, 30, 1, 0, 0, 50224, a3, 0);
  }
  int phy_address = i40e_get_phy_address(a1, *(unsigned char *)(a1 + 185));
  return i40e_write_phy_register_clause45(a1, 30, a2, phy_address, a3);
}

uint64_t i40e_aq_set_phy_register_ext(uint64_t a1, char a2, char a3, char a4, int a5, char a6, int a7, int a8, _OWORD *a9)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v18, 1576);
  v19[0] = a2;
  v19[1] = a3;
  int v20 = a7;
  int v21 = a8;
  if ((a4 & 1) == 0) {
    unsigned char v19[2] = 1;
  }
  sub_100018208(a1, a5, a6, v19);
  return i40e_asq_send_command(a1, (uint64_t)v18, 0, 0, a9);
}

uint64_t i40e_led_get_phy(uint64_t a1, unsigned __int16 *a2, _WORD *a3)
{
  if ((*(unsigned char *)(a1 + 1688) & 4) != 0)
  {
    int v13 = 0;
    uint64_t result = i40e_aq_get_phy_register_ext(a1, 1, 30, 1, 0, 0, 50224, &v13, 0);
    if (!result) {
      *a3 = v13;
    }
  }
  else
  {
    __int16 v12 = 0;
    int phy_address = i40e_get_phy_address(a1, *(unsigned char *)(a1 + 185));
    unsigned int v7 = 0;
    for (unsigned __int16 i = -15312; ; ++i)
    {
      uint64_t result = i40e_read_phy_register_clause45(a1, 30, i, phy_address, &v12);
      if (result) {
        break;
      }
      char v10 = v12;
      *a3 = v12;
      if ((v10 & 0xF0) != 0)
      {
        uint64_t result = 0;
        *a2 = i;
        return result;
      }
      if (v7++ >= 2) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t i40e_led_set_phy(uint64_t a1, int a2, int a3, int a4)
{
  int v11 = 0;
  uint64_t result = i40e_led_get_reg(a1, a3, &v11);
  if (!result)
  {
    unsigned __int16 v9 = v11;
    if ((v11 & 0xF0) == 0 || (uint64_t result = i40e_led_set_reg(a1, a3, 0), !result))
    {
      if (!i40e_led_get_reg(a1, a3, &v11))
      {
        unsigned __int16 v10 = a2 ? 256 : 0;
        if (!i40e_led_set_reg(a1, a3, v10))
        {
          if ((a4 & 0x80000000) == 0) {
            return 0;
          }
          unsigned __int16 v9 = a4;
        }
      }
      return i40e_led_set_reg(a1, a3, v9);
    }
  }
  return result;
}

uint64_t i40e_get_phy_lpi_status(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 696) = 0;
  int v3 = *(unsigned __int16 *)(a1 + 176);
  if (v3 != 4127)
  {
    if (v3 == 14289) {
      goto LABEL_9;
    }
    if (v3 != 5631)
    {
LABEL_11:
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x1E4320uLL, &readData);
      __dmb(1u);
      uint32_t v9 = readData;
      *(_DWORD *)(a2 + 700) = (readData >> 30) & 1;
      uint32_t v8 = v9 >> 31;
      goto LABEL_12;
    }
  }
  int v4 = *(_DWORD *)(a1 + 20);
  if (v4 != 128 && v4 != 1) {
    goto LABEL_11;
  }
LABEL_9:
  unsigned int v11 = 0;
  uint64_t result = i40e_aq_get_phy_register_ext(a1, 1, 3, 1, 0, 0, 1, &v11, 0);
  if (result) {
    return result;
  }
  unsigned int v7 = v11;
  *(_DWORD *)(a2 + 700) = (v11 >> 8) & 1;
  uint32_t v8 = (v7 >> 9) & 1;
LABEL_12:
  uint64_t result = 0;
  *(_DWORD *)(a2 + 696) = v8;
  return result;
}

uint64_t i40e_get_lpi_counters(uint64_t a1, uint32_t *a2, uint32_t *a3, unsigned char *a4)
{
  int v7 = *(unsigned __int16 *)(a1 + 176);
  BOOL v8 = v7 == 5631 || v7 == 4127;
  if (v8 && *(_DWORD *)(a1 + 20) != 4)
  {
    int v13 = 0;
    *a4 = 0;
    LODWORD(result) = i40e_aq_run_phy_activity(a1, 16, 32795, &v13, a2, a3, 0);
    if (v13 != 4 && result == 0) {
      return 4294967243;
    }
    else {
      return result;
    }
  }
  else
  {
    *a4 = 1;
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x1E43C0uLL, &readData);
    __dmb(1u);
    *a2 = readData;
    uint32_t v11 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x1E43A0uLL, &v11);
    uint64_t result = 0;
    __dmb(1u);
    *a3 = v11;
  }
  return result;
}

uint64_t i40e_aq_run_phy_activity(uint64_t a1, __int16 a2, int a3, _DWORD *a4, _DWORD *a5, _DWORD *a6, _OWORD *a7)
{
  uint64_t result = 4294967291;
  if (a4 && a5 && a6)
  {
    i40e_fill_default_direct_cmd_desc((uint64_t)v16, 1574);
    *(_WORD *)&v16[17] = a2;
    int v17 = a3;
    uint64_t result = i40e_asq_send_command(a1, (uint64_t)v16, 0, 0, a7);
    if (!result)
    {
      int v15 = v18;
      *a4 = v17;
      *a5 = v15;
      *a6 = v19;
    }
  }
  return result;
}

uint64_t i40e_get_lpi_duration(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  int v4 = *(unsigned __int16 *)(a1 + 176);
  if (v4 != 5631 && v4 != 4127) {
    return 4294967236;
  }
  uint64_t v14 = 0;
  int v13 = 0;
  uint64_t result = i40e_aq_run_phy_activity(a1, 16, 98331, &v13, (_DWORD *)&v14 + 1, &v14, 0);
  if (!result)
  {
    if ((unsigned __int16)v13 == 4)
    {
      unsigned int v10 = v14;
      unsigned int v11 = HIDWORD(v14);
      if (*(_DWORD *)(a1 + 20) != 4 || v14) {
        goto LABEL_16;
      }
      unsigned int v10 = *(_DWORD *)(a2 + 696);
      if (!v10 || (unsigned int v10 = *(_DWORD *)(a2 + 700)) == 0)
      {
LABEL_15:
        unsigned int v11 = 0;
LABEL_16:
        uint64_t result = 0;
        *a3 = v11;
        *a4 = v10;
        return result;
      }
      uint64_t result = i40e_aq_run_phy_activity(a1, 16, 32794, &v13, (_DWORD *)&v14 + 1, &v14, 0);
      if (result) {
        return result;
      }
      if ((unsigned __int16)v13 == 4)
      {
        unsigned int v10 = 0;
        goto LABEL_15;
      }
    }
    return 4294967243;
  }
  return result;
}

uint64_t i40e_lpi_stat_update(uint64_t a1, char a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v16 = 0;
  char v15 = 0;
  uint64_t result = i40e_get_lpi_counters(a1, (uint32_t *)&v16 + 1, (uint32_t *)&v16, &v15);
  if (!result)
  {
    int v12 = HIDWORD(v16);
    if (v15)
    {
      *a4 += HIDWORD(v16);
      uint64_t v13 = *a6 + v16;
    }
    else
    {
      uint64_t v14 = v16;
      if ((a2 & 1) == 0)
      {
        *a3 = HIDWORD(v16);
        *a5 = v14;
      }
      *a4 = (v12 - *(_DWORD *)a3);
      uint64_t v13 = (v14 - *(_DWORD *)a5);
    }
    *a6 = v13;
  }
  return result;
}

uint64_t i40e_aq_rx_ctl_read_register(uint64_t a1, int a2, _DWORD *a3, _OWORD *a4)
{
  if (!a3) {
    return 4294967291;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, 518);
  void v9[5] = a2;
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v9, 0, 0, a4);
  if (!result) {
    *a3 = v9[7];
  }
  return result;
}

uint64_t i40e_aq_rx_ctl_write_register(uint64_t a1, int a2, int a3, _OWORD *a4)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v9, 519);
  void v9[5] = a2;
  void v9[7] = a3;
  return i40e_asq_send_command(a1, (uint64_t)v9, 0, 0, a4);
}

uint64_t sub_100018208(uint64_t result, int a2, char a3, unsigned char *a4)
{
  if (a2 && *a4 == 1)
  {
    if ((*(unsigned char *)(result + 1688) & 0x40) != 0)
    {
      a4[2] |= (4 * (a3 & 3)) | 2;
    }
    else if ((dword_100028548 & 0x100000) != 0)
    {
      return IOLog("ixl:%s(%d): MDIO I/F number selection not supported by current FW version.\n\n", "i40e_mdio_if_number_selection", 7288);
    }
  }
  return result;
}

uint64_t i40e_aq_send_msg_to_pf(uint64_t a1, int a2, int a3, void *a4, unsigned int a5, long long *a6)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v17, 2049);
  __int16 v12 = v17[0];
  v17[0] |= 0x2000u;
  int v18 = a2;
  int v19 = a3;
  if (a5)
  {
    if (a5 <= 0x200) {
      __int16 v13 = 13312;
    }
    else {
      __int16 v13 = 13824;
    }
    v17[0] = v12 | v13;
    _OWORD v17[2] = a5;
  }
  if (!a6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    BYTE4(v16) = 1;
    a6 = &v15;
  }
  return i40e_asq_send_command(a1, (uint64_t)v17, a4, a5, a6);
}

uint64_t i40e_vf_parse_hw_config(uint64_t result, unsigned __int16 *a2)
{
  unsigned int v2 = *a2;
  *(_DWORD *)(result + 340) = v2;
  int v3 = a2[1];
  *(_DWORD *)(result + 344) = v3;
  *(_DWORD *)(result + 348) = v3;
  *(_DWORD *)(result + 360) = a2[2];
  LOBYTE(v3) = *((unsigned char *)a2 + 8);
  *(unsigned char *)(result + 220) = v3 & 1;
  *(unsigned char *)(result + 240) = (v3 & 2) != 0;
  if (v2)
  {
    unsigned int v4 = 0;
    unsigned int v5 = a2 + 15;
    do
    {
      if (*(_DWORD *)(v5 - 3) == 6)
      {
        int v6 = *(_DWORD *)v5;
        *(_WORD *)(result + 94) = v5[2];
        *(_DWORD *)(result + 90) = v6;
        int v7 = *(_DWORD *)v5;
        *(_WORD *)(result + 88) = v5[2];
        *(_DWORD *)(result + 84) = v7;
        unsigned int v2 = *a2;
      }
      v5 += 8;
      ++v4;
    }
    while (v4 < v2);
  }
  return result;
}

uint64_t i40e_vf_reset(uint64_t a1)
{
  return i40e_aq_send_msg_to_pf(a1, 2, 0, 0, 0, 0);
}

uint64_t i40e_aq_set_arp_proxy_config(uint64_t a1, void *a2, _OWORD *a3)
{
  if (!a2) {
    return 4294967291;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 260);
  v7[0] |= 0x1400u;
  int v8 = HIDWORD(a2);
  int v9 = (int)a2;
  _OWORD v7[2] = 20;
  return i40e_asq_send_command(a1, (uint64_t)v7, a2, 0x14u, a3);
}

uint64_t i40e_aq_set_ns_proxy_table_entry(uint64_t a1, void *a2, _OWORD *a3)
{
  if (!a2) {
    return 4294967291;
  }
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 261);
  v7[0] |= 0x1400u;
  int v8 = HIDWORD(a2);
  int v9 = (int)a2;
  _OWORD v7[2] = 60;
  return i40e_asq_send_command(a1, (uint64_t)v7, a2, 0x3Cu, a3);
}

uint64_t i40e_aq_set_clear_wol_filter(uint64_t a1, unsigned int a2, void *a3, int a4, int a5, int a6, int a7, _OWORD *a8)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v19, 288);
  if (a2 > 7) {
    return 4294967291;
  }
  _WORD v19[8] = a2;
  if (a4)
  {
    if (!a3) {
      return 4294967291;
    }
    __int16 v17 = -24576;
  }
  else
  {
    __int16 v17 = 0;
  }
  if (a5) {
    v17 |= 0x4000u;
  }
  v19[9] = v17;
  if (a6) {
    __int16 v18 = 0x8000;
  }
  else {
    __int16 v18 = 0;
  }
  if (a7) {
    v18 |= 0x4000u;
  }
  v19[10] = v18;
  unsigned char v19[2] = 144;
  v19[0] |= 0x1400u;
  int v20 = HIDWORD(a3);
  int v21 = (int)a3;
  return i40e_asq_send_command(a1, (uint64_t)v19, a3, 0x90u, a8);
}

uint64_t i40e_aq_get_wake_event_reason(uint64_t a1, _WORD *a2, _OWORD *a3)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v7, 289);
  uint64_t result = i40e_asq_send_command(a1, (uint64_t)v7, 0, 0, a3);
  if (!result) {
    *a2 = v7[9];
  }
  return result;
}

uint64_t i40e_aq_clear_all_wol_filters(uint64_t a1, _OWORD *a2)
{
  i40e_fill_default_direct_cmd_desc((uint64_t)v5, 606);
  return i40e_asq_send_command(a1, (uint64_t)v5, 0, 0, a2);
}

uint64_t i40e_init_nvm(uint64_t a1)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_init_nvm", 20, "i40e_init_nvm");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0xB6100uLL, &readData);
  __dmb(1u);
  *(_WORD *)(a1 + 148) = 512 << (readData >> 5);
  uint32_t v3 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0xB6108uLL, &v3);
  __dmb(1u);
  if ((v3 & 0x40) != 0)
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 144) = 18000;
    *(unsigned char *)(a1 + 150) = 0;
  }
  else
  {
    *(unsigned char *)(a1 + 150) = 1;
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): NVM init error: unsupported blank mode.\n\n", "i40e_init_nvm", 40);
    }
    return 4294967237;
  }
  return result;
}

uint64_t i40e_acquire_nvm(uint64_t a1, int a2)
{
  uint64_t v14 = 0;
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_acquire_nvm", 61, "i40e_acquire_nvm");
  }
  if (*(unsigned char *)(a1 + 150)) {
    return 0;
  }
  uint64_t v4 = i40e_aq_request_resource(a1, 1, a2, 0, &v14, 0);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x881BCuLL, &readData);
  __dmb(1u);
  uint64_t v6 = readData;
  uint64_t v7 = v14;
  *(void *)(a1 + 136) = readData + 1000 * v14;
  if (v4)
  {
    if ((dword_100028548 & 0x100000) != 0)
    {
      IOLog("ixl:%s(%d): NVM acquire type %d failed time_left=%llu ret=%d aq_err=%d\n\n", "i40e_acquire_nvm", 78, a2, v7, v4, *(_DWORD *)(a1 + 908));
      uint64_t v7 = v14;
    }
    if (v7)
    {
      unint64_t v8 = v6 + 18000000;
      do
      {
        IODelay(0x2710uLL);
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x881BCuLL, &readData);
        __dmb(1u);
        unint64_t v9 = readData;
        uint64_t v10 = i40e_aq_request_resource(a1, 1, a2, 0, &v14, 0);
        uint64_t v4 = v10;
        if (!v10)
        {
          *(void *)(a1 + 136) = v9 + 1000 * v14;
          return v4;
        }
        uint64_t v11 = v14;
      }
      while (v8 > v9 && v14 != 0);
      *(void *)(a1 + 136) = 0;
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): NVM acquire timed out, wait %llu ms before trying again. status=%d aq_err=%d\n\n", "i40e_acquire_nvm", 101, v11, v10, *(_DWORD *)(a1 + 908));
      }
    }
  }
  return v4;
}

uint64_t i40e_release_nvm(uint64_t result)
{
  uint64_t v1 = result;
  if ((dword_100028548 & 0x100000) != 0) {
    uint64_t result = IOLog("ixl:%s(%d): %s\n", "i40e_release_nvm", 120, "i40e_release_nvm");
  }
  if (!*(unsigned char *)(v1 + 150))
  {
    uint64_t result = i40e_aq_release_resource(v1, 1, 0, 0);
    if (result == -54)
    {
      int v2 = -1;
      do
      {
        if (++v2 >= *(_DWORD *)(v1 + 880)) {
          break;
        }
        IODelay(0x3E8uLL);
        uint64_t result = i40e_aq_release_resource(v1, 1, 0, 0);
      }
      while (result == -54);
    }
  }
  return result;
}

uint64_t i40e_read_nvm_word_srctl(uint64_t a1, unsigned int a2, _WORD *a3)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_read_nvm_word_srctl", 180, "i40e_read_nvm_word_srctl");
  }
  unsigned int v6 = *(unsigned __int16 *)(a1 + 148);
  if (v6 <= a2)
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): NVM read error: Offset %d beyond Shadow RAM limit %d\n\n", "i40e_read_nvm_word_srctl", 185, a2, v6);
    }
    return 4294967291;
  }
  else
  {
    uint64_t v7 = sub_100018B68((IOPCIDevice **)a1);
    if (v7
      || (__dmb(2u),
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0xB6110uLL, (a2 << 14) | 0x40000000),
          uint64_t v7 = sub_100018B68((IOPCIDevice **)a1),
          v7))
    {
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): NVM read error: Couldn't access Shadow RAM address: 0x%x\n\n", "i40e_read_nvm_word_srctl", 210, a2);
      }
    }
    else
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0xB6114uLL, &readData);
      __dmb(1u);
      *a3 = HIWORD(readData);
    }
  }
  return v7;
}

uint64_t sub_100018B68(IOPCIDevice **a1)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_poll_sr_srctl_done_bit", 150, "i40e_poll_sr_srctl_done_bit");
  }
  int v2 = 100000;
  do
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 0xB6110uLL, &readData);
    __dmb(1u);
    if ((readData & 0x80000000) != 0) {
      return 0;
    }
    IODelay(5uLL);
    --v2;
  }
  while (v2);
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): Done bit in GLNVM_SRCTL not set\n", "i40e_poll_sr_srctl_done_bit", 162);
  }
  return 4294967259;
}

uint64_t __i40e_read_nvm_word(uint64_t a1, unsigned int a2, _WORD *a3)
{
  if (*(unsigned char *)(a1 + 1688))
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): %s\n", "i40e_read_nvm_word_aq", 282, "i40e_read_nvm_word_aq");
    }
    return sub_10001A618(a1, a2, 1u, a3, 1);
  }
  else
  {
    return i40e_read_nvm_word_srctl(a1, a2, a3);
  }
}

uint64_t i40e_read_nvm_word(uint64_t a1, unsigned int a2, _WORD *a3)
{
  if ((*(unsigned char *)(a1 + 1688) & 8) == 0 || (uint64_t nvm_word = i40e_acquire_nvm(a1, 1), !nvm_word))
  {
    uint64_t nvm_word = __i40e_read_nvm_word(a1, a2, a3);
    if ((*(unsigned char *)(a1 + 1688) & 8) != 0) {
      i40e_release_nvm(a1);
    }
  }
  return nvm_word;
}

uint64_t i40e_read_nvm_module_data(uint64_t a1, unsigned int a2, __int16 a3, __int16 a4, __int16 a5, _WORD *a6)
{
  __int16 v18 = a5;
  __int16 v17 = 0;
  __int16 v16 = 0;
  if (a2)
  {
    int v10 = i40e_read_nvm_word(a1, a2, &v16);
    if (v10)
    {
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): Reading nvm word failed.Error code: %d.\n\n", "i40e_read_nvm_module_data", 360, v10);
      }
      return 0xFFFFFFFFLL;
    }
    __int16 v11 = v16;
    if ((~v16 & 0x7FFF) == 0)
    {
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): Pointer not initialized.\n\n", "i40e_read_nvm_module_data", 370);
      }
      return 4294967277;
    }
    if (v16 < 0)
    {
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): Reading nvm data failed. Pointer points outside of the Shared RAM mapped area.\n\n", "i40e_read_nvm_module_data", 378);
      }
      return 4294967291;
    }
  }
  else
  {
    __int16 v11 = 0;
  }
  int v12 = i40e_read_nvm_word(a1, (unsigned __int16)(v11 + a3), &v17);
  if (v12)
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): Reading nvm word failed.Error code: %d.\n\n", "i40e_read_nvm_module_data", 389, v12);
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t v15 = i40e_read_nvm_buffer(a1, a4 + a3 + v16 + v17, &v18, a6);
  uint64_t v13 = v15;
  if (v15 && (dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): Reading nvm buffer failed.Error code: %d.\n\n", "i40e_read_nvm_module_data", 401, v15);
  }
  return v13;
}

uint64_t i40e_read_nvm_buffer(uint64_t a1, __int16 a2, _WORD *a3, _WORD *a4)
{
  if (*(unsigned char *)(a1 + 1688))
  {
    uint64_t result = i40e_acquire_nvm(a1, 1);
    if (!result)
    {
      uint64_t v9 = sub_100018FD4(a1, a2, a3, (uint64_t)a4);
      i40e_release_nvm(a1);
      return v9;
    }
  }
  else
  {
    return sub_1000190D4(a1, a2, a3, a4);
  }
  return result;
}

uint64_t __i40e_read_nvm_buffer(uint64_t a1, __int16 a2, _WORD *a3, _WORD *a4)
{
  if (*(unsigned char *)(a1 + 1688)) {
    return sub_100018FD4(a1, a2, a3, (uint64_t)a4);
  }
  else {
    return sub_1000190D4(a1, a2, a3, a4);
  }
}

uint64_t sub_100018FD4(uint64_t a1, unsigned __int16 a2, _WORD *a3, uint64_t a4)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_read_nvm_buffer_aq", 461, "i40e_read_nvm_buffer_aq");
  }
  int v8 = 0;
  unsigned int v9 = 0;
  do
  {
    unsigned int v10 = (unsigned __int16)*a3;
    if ((a2 & 0x7FF) != 0)
    {
      if (v10 >= 2048 - (a2 & 0x7FFu)) {
        int v11 = 2048 - (a2 & 0x7FF);
      }
      else {
        int v11 = (unsigned __int16)*a3;
      }
    }
    else if (v10 - v9 >= 0x800)
    {
      int v11 = 2048;
    }
    else
    {
      int v11 = v10 - v9;
    }
    unsigned __int16 v12 = v11 + v9;
    v8 |= v11 + v9 >= v10;
    uint64_t result = sub_10001A618(a1, a2, (unsigned __int16)v11, (void *)(a4 + 2 * v9), v8 & 1);
    if (result) {
      break;
    }
    unsigned int v9 = (unsigned __int16)(v11 + v9);
    a2 += v11;
  }
  while (v12 < (unsigned __int16)*a3);
  *a3 = v9;
  return result;
}

uint64_t sub_1000190D4(uint64_t a1, __int16 a2, _WORD *a3, _WORD *a4)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_read_nvm_buffer_srctl", 425, "i40e_read_nvm_buffer_srctl");
  }
  if (*a3)
  {
    unint64_t v8 = 0;
    while (1)
    {
      uint64_t result = i40e_read_nvm_word_srctl(a1, (unsigned __int16)(v8 + a2), a4);
      if (result) {
        break;
      }
      ++v8;
      ++a4;
      if (v8 >= (unsigned __int16)*a3) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    LOWORD(v8) = 0;
LABEL_9:
    uint64_t result = 0;
  }
  *a3 = v8;
  return result;
}

uint64_t i40e_write_nvm_aq(uint64_t a1, char a2, int a3, unsigned int a4, void *a5, int a6)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_write_nvm_aq", 568, "i40e_write_nvm_aq");
  }
  long long v13 = 0uLL;
  uint64_t v14 = 0;
  uint64_t v15 = a1 + 924;
  if (a4 + a3 <= *(unsigned __int16 *)(a1 + 148))
  {
    if (a4 < 0x801)
    {
      if (((a3 + a4 - 1) ^ a3) < 0x800) {
        return i40e_aq_update_nvm(a1, a2, 2 * a3, 2 * (a4 & 0x7FFF), a5, a6, 0, &v13);
      }
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): %s\n", "i40e_write_nvm_aq", 586, "NVM write error: cannot spread over two sectors in a single write.\n");
      }
    }
    else if ((dword_100028548 & 0x100000) != 0)
    {
      IOLog("ixl:%s(%d): %s\n", "i40e_write_nvm_aq", 582, "NVM write fail error: cannot write more than 4KB in a single write.\n");
    }
  }
  else if ((dword_100028548 & 0x100000) != 0)
  {
    IOLog("ixl:%s(%d): %s\n", "i40e_write_nvm_aq", 579, "NVM write error: offset beyond Shadow RAM limit.\n");
  }
  return 0xFFFFFFFFLL;
}

uint64_t __i40e_write_nvm_word(uint64_t a1, int a2, void *a3)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "__i40e_write_nvm_word", 611, "i40e_write_nvm_word");
  }
  return i40e_write_nvm_aq(a1, 0, a2, 1u, a3, 0);
}

uint64_t __i40e_write_nvm_buffer(uint64_t a1, char a2, int a3, unsigned int a4, void *a5)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "__i40e_write_nvm_buffer", 640, "i40e_write_nvm_buffer");
  }
  return i40e_write_nvm_aq(a1, a2, a3, a4, a5, 0);
}

void i40e_calc_nvm_checksum()
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_calc_nvm_checksum", 672, "i40e_calc_nvm_checksum");
  }
  i40e_allocate_virt_mem();
}

void i40e_update_nvm_checksum()
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_update_nvm_checksum", 750, "i40e_update_nvm_checksum");
  }
  i40e_calc_nvm_checksum();
}

uint64_t i40e_validate_nvm_checksum(uint64_t a1)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_validate_nvm_checksum", 777, "i40e_validate_nvm_checksum");
  }
  uint64_t v2 = i40e_acquire_nvm(a1, 1);
  if (!v2) {
    i40e_calc_nvm_checksum();
  }
  return v2;
}

uint64_t i40e_nvmupd_command(uint64_t a1, _DWORD *a2, unsigned char *a3, int *a4)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_nvmupd_command", 888, "i40e_nvmupd_command");
  }
  *a4 = 0;
  int v8 = sub_10001A320(a2, a4);
  int v9 = v8;
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s state %d nvm_release_on_hold %d opc 0x%04x cmd 0x%08x config 0x%08x offset 0x%08x data_size 0x%08x\n\n", "i40e_nvmupd_command", 900, off_1000247A0[v8], *(_DWORD *)(a1 + 920), *(unsigned __int8 *)(a1 + 1008), *(unsigned __int16 *)(a1 + 1010), *a2, a2[1], a2[2], a2[3]);
  }
  switch(v9)
  {
    case 17:
      unsigned int v12 = a2[3];
      uint64_t v13 = *(unsigned __int16 *)(a1 + 1704);
      if (v12 >= v13)
      {
        if (v12 > v13)
        {
          bzero(&a3[v13], v12 - v13);
          LODWORD(v13) = *(unsigned __int16 *)(a1 + 1704);
        }
        memcpy(a3, (const void *)(a1 + 1702), v13);
        return 0;
      }
LABEL_27:
      *a4 = -11;
      return 4294967241;
    case 13:
      if (a2[3])
      {
        *a3 = *(_DWORD *)(a1 + 920);
        if (a2[3] >= 4u)
        {
          a3[1] = 0;
          *((_WORD *)a3 + 1) = *(_WORD *)(a1 + 1010);
        }
        if (*(_DWORD *)(a1 + 920) == 5)
        {
          uint64_t v11 = 0;
          *(_DWORD *)(a1 + 920) = 0;
          return v11;
        }
        return 0;
      }
      goto LABEL_27;
    case 0:
      *a4 = -11;
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): i40e_nvmupd_validate_command returns %d errno %d\n\n", "i40e_nvmupd_command", 906, 0, -11);
      }
      break;
  }
  if (*(_DWORD *)(a1 + 920) == 5)
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): Clearing I40E_NVMUPD_STATE_ERROR state without reading\n\n", "i40e_nvmupd_command", 960);
    }
    *(_DWORD *)(a1 + 920) = 0;
  }
  uint64_t v10 = a1 + 905;
  i40e_acquire_spinlock(a1 + 905);
  switch(*(_DWORD *)(a1 + 920))
  {
    case 0:
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): %s\n", "i40e_nvmupd_state_init", 1031, "i40e_nvmupd_state_init");
      }
      int v14 = sub_10001A320(a2, a4);
      switch(v14)
      {
        case 2:
          uint64_t v15 = i40e_acquire_nvm(a1, 1);
          if (v15) {
            goto LABEL_96;
          }
          uint64_t v11 = sub_10001A76C(a1, (uint64_t)a2, a3, a4);
          if (v11) {
            goto LABEL_165;
          }
          int v16 = 1;
          goto LABEL_130;
        case 4:
          uint64_t v15 = i40e_acquire_nvm(a1, 1);
          if (v15) {
            goto LABEL_96;
          }
          uint64_t v11 = sub_10001A76C(a1, (uint64_t)a2, a3, a4);
          goto LABEL_165;
        case 5:
          uint64_t v15 = i40e_acquire_nvm(a1, 2);
          if (v15) {
            goto LABEL_96;
          }
          unsigned int v25 = a2[1];
          unsigned int v24 = a2[2];
          long long readData = 0uLL;
          uint64_t v51 = 0;
          uint64_t v52 = a1 + 924;
          uint64_t v11 = i40e_aq_erase_nvm(a1, v25, v24, *((_WORD *)a2 + 6), (v25 >> 9) & 1, &readData);
          if (!v11)
          {
            *(unsigned char *)(a1 + 1008) = 1;
            LOWORD(v39) = 1794;
            goto LABEL_129;
          }
          if ((dword_100028548 & 0x100000) != 0)
          {
            IOLog("ixl:%s(%d): i40e_nvmupd_nvm_erase mod 0x%x  off 0x%x len 0x%x\n\n", "i40e_nvmupd_nvm_erase", 1743, v25, a2[2], a2[3]);
            if ((dword_100028548 & 0x100000) != 0) {
              IOLog("ixl:%s(%d): i40e_nvmupd_nvm_erase status %d aq %d\n\n", "i40e_nvmupd_nvm_erase", 1746, v11, *(_DWORD *)(a1 + 908));
            }
          }
          if (v11 == -54)
          {
            int v38 = -8;
          }
          else
          {
            uint64_t v26 = *(unsigned int *)(a1 + 908);
            if (v26 > 0x16) {
              int v38 = -18;
            }
            else {
              int v38 = dword_100021B60[v26];
            }
          }
          *a4 = v38;
LABEL_165:
          i40e_release_nvm(a1);
          goto LABEL_166;
        case 7:
          uint64_t v15 = i40e_acquire_nvm(a1, 2);
          if (v15) {
            goto LABEL_96;
          }
          uint64_t v11 = sub_10001A87C(a1, (uint64_t)a2, a3, a4);
          if (!v11) {
            goto LABEL_91;
          }
          goto LABEL_165;
        case 9:
          uint64_t v15 = i40e_acquire_nvm(a1, 2);
          if (v15) {
            goto LABEL_96;
          }
          uint64_t v11 = sub_10001A87C(a1, (uint64_t)a2, a3, a4);
          if (!v11) {
            goto LABEL_128;
          }
          goto LABEL_165;
        case 11:
          uint64_t v15 = i40e_acquire_nvm(a1, 2);
          if (!v15) {
            i40e_update_nvm_checksum();
          }
LABEL_96:
          uint64_t v11 = v15;
          goto LABEL_97;
        case 14:
          if ((dword_100028548 & 0x100000) != 0) {
            IOLog("ixl:%s(%d): NVMUPD: %s\n\n", "i40e_nvmupd_exec_aq", 1506, "i40e_nvmupd_exec_aq");
          }
          if (a2[2] == 0xFFFF) {
            goto LABEL_17;
          }
          long long readData = 0uLL;
          uint64_t v51 = 0;
          uint64_t v52 = a1 + 924;
          *(_OWORD *)(a1 + 924) = 0u;
          *(_OWORD *)(a1 + 940) = 0u;
          unsigned int v29 = a2[3];
          if (v29 <= 0x1F)
          {
            if ((dword_100028548 & 0x100000) != 0) {
              IOLog("ixl:%s(%d): NVMUPD: not enough aq desc bytes for exec, size %d < %d\n\n");
            }
            goto LABEL_112;
          }
          size_t v40 = v29 - 32;
          if (v40 <= *((unsigned __int16 *)a3 + 2)) {
            unsigned int v41 = *((unsigned __int16 *)a3 + 2);
          }
          else {
            unsigned int v41 = v29 - 32;
          }
          if (v41)
          {
            long long v42 = *(void **)(a1 + 992);
            if (!v42) {
              i40e_allocate_virt_mem();
            }
            memcpy(v42, a3 + 32, v40);
          }
          else
          {
            long long v42 = 0;
          }
          if (a2[2])
          {
            *(_OWORD *)(a1 + 956) = 0u;
            *(_OWORD *)(a1 + 972) = 0u;
          }
          uint64_t v46 = i40e_asq_send_command(a1, (uint64_t)a3, v42, (unsigned __int16)v41, &readData);
          if (v46)
          {
            uint64_t v11 = v46;
            if ((dword_100028548 & 0x100000) != 0)
            {
              long long v47 = i40e_stat_str(a1, v46);
              long long v48 = i40e_aq_str(a1, *(_DWORD *)(a1 + 908));
              IOLog("ixl:%s(%d): i40e_nvmupd_exec_aq err %s aq_err %s\n\n", "i40e_nvmupd_exec_aq", 1556, v47, v48);
            }
LABEL_97:
            if (v11 == -54)
            {
              int v27 = -8;
            }
            else
            {
              uint64_t v28 = *(unsigned int *)(a1 + 908);
              if (v28 > 0x16) {
                int v27 = -18;
              }
              else {
                int v27 = dword_100021B60[v28];
              }
            }
            *a4 = v27;
            goto LABEL_166;
          }
          int v39 = a2[2];
          if (!v39) {
            goto LABEL_17;
          }
          uint64_t v11 = 0;
          goto LABEL_129;
        case 15:
          if ((dword_100028548 & 0x100000) != 0) {
            IOLog("ixl:%s(%d): NVMUPD: %s\n\n", "i40e_nvmupd_get_aq_result", 1588, "i40e_nvmupd_get_aq_result");
          }
          unsigned int v30 = *(unsigned __int16 *)(a1 + 928) + 32;
          unsigned int v31 = a2[2];
          unsigned int v32 = v30 - v31;
          if (v30 >= v31)
          {
            if (a2[3] <= v32)
            {
              unsigned int v32 = a2[3];
            }
            else
            {
              if ((dword_100028548 & 0x100000) != 0)
              {
                IOLog("ixl:%s(%d): %s: copy length %d too big, trimming to %d\n\n", "i40e_nvmupd_get_aq_result", 1606, "i40e_nvmupd_get_aq_result", a2[3], v32);
                unsigned int v31 = a2[2];
              }
              a2[3] = v32;
            }
            if (v31 > 0x1F)
            {
              long long v44 = *(char **)(a1 + 992);
              long long v45 = &v44[v31 - 32];
            }
            else
            {
              if (32 - v31 >= v32) {
                size_t v43 = v32;
              }
              else {
                size_t v43 = 32 - v31;
              }
              if ((dword_100028548 & 0x100000) != 0)
              {
                IOLog("ixl:%s(%d): %s: aq_desc bytes %d to %d\n\n", "i40e_nvmupd_get_aq_result", 1616, "i40e_nvmupd_get_aq_result", v31, v43 + v31);
                unsigned int v31 = a2[2];
              }
              memcpy(a3, (const void *)(a1 + 924 + v31), v43);
              a3 += v43;
              v32 -= v43;
              long long v44 = *(char **)(a1 + 992);
              long long v45 = v44;
            }
            if ((int)v32 >= 1)
            {
              if ((dword_100028548 & 0x100000) != 0) {
                IOLog("ixl:%s(%d): %s: databuf bytes %d to %d\n\n", "i40e_nvmupd_get_aq_result", 1632, "i40e_nvmupd_get_aq_result", v45 - v44, v32 + v45 - v44);
              }
              size_t v36 = v32;
              long long v37 = a3;
              long long v35 = v45;
LABEL_151:
              memcpy(v37, v35, v36);
            }
            goto LABEL_17;
          }
          if ((dword_100028548 & 0x100000) != 0) {
            IOLog("ixl:%s(%d): %s: offset too big %d > %d\n\n");
          }
LABEL_112:
          *a4 = -14;
          uint64_t v11 = 4294967291;
          break;
        case 16:
          if ((dword_100028548 & 0x100000) != 0) {
            IOLog("ixl:%s(%d): NVMUPD: %s\n\n", "i40e_nvmupd_get_aq_event", 1655, "i40e_nvmupd_get_aq_event");
          }
          unsigned int v33 = *(unsigned __int16 *)(a1 + 960) + 32;
          unsigned int v34 = a2[3];
          if (v34 > v33)
          {
            if ((dword_100028548 & 0x100000) != 0) {
              IOLog("ixl:%s(%d): %s: copy length %d too big, trimming to %d\n\n", "i40e_nvmupd_get_aq_event", 1664, "i40e_nvmupd_get_aq_event", a2[3], v33);
            }
            a2[3] = v33;
            unsigned int v34 = v33;
          }
          long long v35 = (char *)(a1 + 956);
          size_t v36 = v34;
          long long v37 = a3;
          goto LABEL_151;
        default:
          if ((dword_100028548 & 0x100000) != 0) {
            IOLog("ixl:%s(%d): NVMUPD: bad cmd %s in init state\n\n", "i40e_nvmupd_state_init", 1147, off_1000247A0[v14]);
          }
          *a4 = -3;
          uint64_t v11 = 0xFFFFFFFFLL;
          goto LABEL_166;
      }
      goto LABEL_166;
    case 1:
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): %s\n", "i40e_nvmupd_state_reading", 1172, "i40e_nvmupd_state_reading");
      }
      int v17 = sub_10001A320(a2, a4);
      switch(v17)
      {
        case 4:
          goto LABEL_42;
        case 3:
          uint64_t v11 = sub_10001A76C(a1, (uint64_t)a2, a3, a4);
          i40e_release_nvm(a1);
          *(_DWORD *)(a1 + 920) = 0;
          break;
        case 1:
LABEL_42:
          uint64_t v11 = sub_10001A76C(a1, (uint64_t)a2, a3, a4);
          break;
        default:
          if ((dword_100028548 & 0x100000) != 0) {
            IOLog("ixl:%s(%d): NVMUPD: bad cmd %s in reading state.\n\n");
          }
LABEL_76:
          *a4 = -3;
          uint64_t v11 = 4294967232;
          break;
      }
      goto LABEL_166;
    case 2:
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): %s\n", "i40e_nvmupd_state_writing", 1217, "i40e_nvmupd_state_writing");
      }
      char v18 = 0;
      uint64_t v19 = sub_10001A320(a2, a4);
      break;
    case 3:
    case 4:
      if (a2[2] == 0xFFFF)
      {
        i40e_nvmupd_clear_wait_state(a1);
LABEL_17:
        uint64_t v11 = 0;
      }
      else
      {
        *a4 = -12;
        uint64_t v11 = 4294967233;
      }
      goto LABEL_166;
    default:
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): NVMUPD: no such state %d\n\n");
      }
      goto LABEL_76;
  }
  while (2)
  {
    switch((int)v19)
    {
      case 6:
        uint64_t v11 = sub_10001A87C(a1, (uint64_t)a2, a3, a4);
        if (v11) {
          goto LABEL_64;
        }
LABEL_91:
        *(_WORD *)(a1 + 1010) = 1795;
        int v16 = 4;
        goto LABEL_130;
      case 8:
        uint64_t v20 = sub_10001A87C(a1, (uint64_t)a2, a3, a4);
        uint64_t v11 = v20;
        if (v20)
        {
          uint64_t v21 = *(unsigned int *)(a1 + 908);
          if (v21)
          {
            if (v20 == -54)
            {
              int v22 = -8;
            }
            else if (v21 > 0x16)
            {
              int v22 = -18;
            }
            else
            {
              int v22 = dword_100021B60[v21];
            }
          }
          else
          {
            int v22 = -5;
          }
          *a4 = v22;
          *(_DWORD *)(a1 + 920) = 0;
LABEL_64:
          if (v18 & 1 | (*(_DWORD *)(a1 + 908) != 12)) {
            goto LABEL_166;
          }
          LODWORD(readData) = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x881BCuLL, (uint32_t *)&readData);
          __dmb(1u);
          unint64_t v23 = *(void *)(a1 + 136);
          if (v23 > readData) {
            goto LABEL_166;
          }
          if ((dword_100028548 & 0x100000) != 0) {
            IOLog("ixl:%s(%d): NVMUPD: write semaphore expired (%d >= %lld), retrying\n\n", "i40e_nvmupd_state_writing", 1306, readData, v23);
          }
          i40e_release_nvm(a1);
          char v18 = 1;
          if (i40e_acquire_nvm(a1, 2))
          {
            if ((dword_100028548 & 0x100000) != 0) {
              IOLog("ixl:%s(%d): NVMUPD: write semaphore reacquire failed aq_err = %d\n\n", "i40e_nvmupd_state_writing", 1312, *(_DWORD *)(a1 + 908));
            }
            *(_DWORD *)(a1 + 908) = 12;
            goto LABEL_166;
          }
          continue;
        }
LABEL_128:
        *(unsigned char *)(a1 + 1008) = 1;
        LOWORD(v39) = 1795;
LABEL_129:
        *(_WORD *)(a1 + 1010) = v39;
        int v16 = 3;
LABEL_130:
        *(_DWORD *)(a1 + 920) = v16;
LABEL_166:
        i40e_release_spinlock(v10);
        return v11;
      case 10:
        i40e_update_nvm_checksum();
      case 12:
        i40e_update_nvm_checksum();
      default:
        if ((dword_100028548 & 0x100000) != 0) {
          IOLog("ixl:%s(%d): NVMUPD: bad cmd %s in writing state.\n\n", "i40e_nvmupd_state_writing", 1280, off_1000247A0[v19]);
        }
        *a4 = -3;
        uint64_t v11 = 4294967232;
        goto LABEL_64;
    }
  }
}

uint64_t sub_10001A320(_DWORD *a1, _DWORD *a2)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_nvmupd_validate_command", 1393, "i40e_nvmupd_validate_command\n");
  }
  if ((a1[3] - 4097) > 0xFFFFEFFF)
  {
    int v5 = (a1[1] >> 8) & 0xF;
    int v6 = a1[1];
    if (*a1 == 12)
    {
      uint64_t result = 0;
      switch(v5)
      {
        case 0:
          uint64_t result = 6;
          break;
        case 1:
          uint64_t result = 7;
          break;
        case 2:
          uint64_t result = 8;
          break;
        case 3:
          uint64_t result = 9;
          break;
        case 4:
          uint64_t result = 5;
          break;
        case 8:
          uint64_t result = 10;
          break;
        case 10:
          uint64_t result = 12;
          break;
        case 11:
          uint64_t result = 11;
          break;
        case 15:
          if (a1[1]) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = 14;
          }
          break;
        default:
          return result;
      }
    }
    else if (*a1 == 11)
    {
      switch(v5)
      {
        case 0:
          uint64_t result = 1;
          break;
        case 1:
          uint64_t result = 2;
          break;
        case 2:
          uint64_t result = 3;
          break;
        case 3:
          uint64_t result = 4;
          break;
        default:
          if (v5 == 14)
          {
            uint64_t result = 16;
          }
          else
          {
            if (v5 != 15) {
              return 0;
            }
            if (a1[1])
            {
              if (v6 == 15)
              {
                uint64_t result = 13;
              }
              else
              {
                if (v6 != 14) {
                  goto LABEL_6;
                }
                uint64_t result = 17;
              }
            }
            else
            {
              uint64_t result = 15;
            }
          }
          break;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if ((dword_100028548 & 0x100000) != 0) {
      IOLog("ixl:%s(%d): i40e_nvmupd_validate_command data_size %d\n\n", "i40e_nvmupd_validate_command", 1406, a1[3]);
    }
LABEL_6:
    uint64_t result = 0;
    *a2 = -11;
  }
  return result;
}

uint64_t i40e_nvmupd_clear_wait_state(uint64_t result)
{
  uint64_t v1 = result;
  if ((dword_100028548 & 0x100000) != 0) {
    uint64_t result = IOLog("ixl:%s(%d): NVMUPD: clearing wait on opcode 0x%04x\n\n", "i40e_nvmupd_clear_wait_state", 1333, *(unsigned __int16 *)(result + 1010));
  }
  if (*(unsigned char *)(v1 + 1008))
  {
    uint64_t result = i40e_release_nvm(v1);
    *(unsigned char *)(v1 + 1008) = 0;
  }
  *(_WORD *)(v1 + 1010) = 0;
  if (*(_DWORD *)(v1 + 912))
  {
    int v2 = 5;
LABEL_7:
    *(_DWORD *)(v1 + 920) = v2;
    return result;
  }
  int v3 = *(_DWORD *)(v1 + 920);
  if (v3 == 3)
  {
    int v2 = 0;
    goto LABEL_7;
  }
  if (v3 == 4)
  {
    int v2 = 2;
    goto LABEL_7;
  }
  return result;
}

uint64_t i40e_nvmupd_check_wait_event(uint64_t result, int a2, _OWORD *a3)
{
  if (*(unsigned __int16 *)(result + 1010) == a2)
  {
    long long v3 = a3[1];
    *(_OWORD *)(result + 956) = *a3;
    *(_OWORD *)(result + 972) = v3;
    return i40e_nvmupd_clear_wait_state(result);
  }
  return result;
}

uint64_t sub_10001A618(uint64_t a1, int a2, unsigned int a3, void *a4, int a5)
{
  if ((dword_100028548 & 0x100000) != 0) {
    IOLog("ixl:%s(%d): %s\n", "i40e_read_nvm_aq", 235, "i40e_read_nvm_aq");
  }
  long long v11 = 0uLL;
  uint64_t v12 = 0;
  uint64_t v13 = a1 + 924;
  if (a3 + a2 <= *(unsigned __int16 *)(a1 + 148))
  {
    if (a3 < 0x801)
    {
      if (((a2 + a3 - 1) ^ a2) < 0x800) {
        return i40e_aq_read_nvm(a1, 0, 2 * a2, 2 * (a3 & 0x7FFF), a4, a5, &v11);
      }
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): NVM write error: cannot spread over two sectors in a single write offset=%d words=%d\n\n");
      }
    }
    else if ((dword_100028548 & 0x100000) != 0)
    {
      IOLog("ixl:%s(%d): NVM write fail error: tried to write %d words, limit is %d.\n\n");
    }
  }
  else if ((dword_100028548 & 0x100000) != 0)
  {
    IOLog("ixl:%s(%d): NVM write error: offset %d beyond Shadow RAM limit %d\n\n");
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_10001A76C(uint64_t a1, uint64_t a2, void *a3, int *a4)
{
  int v9 = *(_DWORD *)(a2 + 4);
  unsigned int v8 = *(_DWORD *)(a2 + 8);
  long long v14 = 0uLL;
  uint64_t v15 = 0;
  uint64_t v16 = a1 + 924;
  uint64_t v10 = i40e_aq_read_nvm(a1, v9, v8, *(unsigned __int16 *)(a2 + 12), a3, (v9 & 0xE00) == 512, &v14);
  if (v10)
  {
    if ((dword_100028548 & 0x100000) != 0)
    {
      IOLog("ixl:%s(%d): i40e_nvmupd_nvm_read mod 0x%x  off 0x%x  len 0x%x\n\n", "i40e_nvmupd_nvm_read", 1704, v9, *(_DWORD *)(a2 + 8), *(_DWORD *)(a2 + 12));
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): i40e_nvmupd_nvm_read status %d aq %d\n\n", "i40e_nvmupd_nvm_read", 1707, v10, *(_DWORD *)(a1 + 908));
      }
    }
    if (v10 == -54)
    {
      int v11 = -8;
    }
    else
    {
      uint64_t v12 = *(unsigned int *)(a1 + 908);
      if (v12 > 0x16) {
        int v11 = -18;
      }
      else {
        int v11 = dword_100021B60[v12];
      }
    }
    *a4 = v11;
  }
  return v10;
}

uint64_t sub_10001A87C(uint64_t a1, uint64_t a2, void *a3, int *a4)
{
  unsigned int v9 = *(_DWORD *)(a2 + 4);
  unsigned int v8 = *(_DWORD *)(a2 + 8);
  long long v14 = 0uLL;
  uint64_t v15 = 0;
  uint64_t v16 = a1 + 924;
  uint64_t updated = i40e_aq_update_nvm(a1, v9, v8, *(unsigned __int16 *)(a2 + 12), a3, (v9 >> 9) & 1, (v9 >> 12) & 3, &v14);
  if (updated)
  {
    if ((dword_100028548 & 0x100000) != 0)
    {
      IOLog("ixl:%s(%d): i40e_nvmupd_nvm_write mod 0x%x off 0x%x len 0x%x\n\n", "i40e_nvmupd_nvm_write", 1786, v9, *(_DWORD *)(a2 + 8), *(_DWORD *)(a2 + 12));
      if ((dword_100028548 & 0x100000) != 0) {
        IOLog("ixl:%s(%d): i40e_nvmupd_nvm_write status %d aq %d\n\n", "i40e_nvmupd_nvm_write", 1789, updated, *(_DWORD *)(a1 + 908));
      }
    }
    if (updated == -54)
    {
      int v11 = -8;
    }
    else
    {
      uint64_t v12 = *(unsigned int *)(a1 + 908);
      if (v12 > 0x16) {
        int v11 = -18;
      }
      else {
        int v11 = dword_100021B60[v12];
      }
    }
    *a4 = v11;
  }
  return updated;
}

uint64_t sub_10001A988(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 681)) {
    sub_10001AA04(*(IOService **)(*(void *)(a1 + 32) + 35368), a1 + 368, 0x2000uLL);
  }
  return 0;
}

void sub_10001AA04(IOService *a1, uint64_t a2, uint64_t capacity)
{
  *(_DWORD *)(a2 + 256) = 512;
  uint32_t segmentsCount = 1;
  uint64_t flags = 0;
  int v5 = (IOBufferMemoryDescriptor **)(a2 + 24);
  if (!IOBufferMemoryDescriptor::Create(3uLL, capacity, IOVMPageSize, (IOBufferMemoryDescriptor **)(a2 + 24)))
  {
    if (IOBufferMemoryDescriptor::GetAddressRange(*v5, &range)) {
      sub_10001CDF0();
    }
    *(void *)a2 = range.address;
    specification.options = 0;
    memset(specification._resv, 0, sizeof(specification._resv));
    specification.maxAddressBits = 64;
    if (!IODMACommand::Create(a1, 0, &specification, (IODMACommand **)(a2 + 16))
      && !IODMACommand::PrepareForDMA(*(IODMACommand **)(a2 + 16), 0, *v5, 0, 0, &flags, &segmentsCount, &range, 0))
    {
      *(void *)(a2 + 8) = range.address;
      operator new[]();
    }
  }
  unsigned int v8 = *(IODMACommand **)(a2 + 16);
  uint64_t v7 = (uint64_t *)(a2 + 16);
  int v6 = v8;
  if (v8) {
    sub_10001CE1C(v6, v7);
  }
  if (*v5)
  {
    ((void (*)(IOBufferMemoryDescriptor *))(*v5)->release)(*v5);
    *int v5 = 0;
  }
  __assert_rtn("operator()", "en_main.cpp", 12, "!allocate_dma_mem(pciDev, &ring, sz)");
}

uint64_t sub_10001AB7C(uint64_t result)
{
  if (*(unsigned char *)(result + 681))
  {
    uint64_t v1 = result;
    unint64_t v2 = 0;
    long long v3 = (uint64_t *)(result + 320);
    do
    {
      uint64_t v4 = (IODMACommand *)v3[8];
      if (v4)
      {
        IODMACommand::CompleteDMA(v4, 0, 0);
        uint64_t v5 = v3[8];
        if (v5)
        {
          (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
          v3[8] = 0;
        }
      }
      uint64_t v6 = v3[9];
      if (v6)
      {
        (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
        v3[9] = 0;
      }
      if (v3[39]) {
        operator delete[]();
      }
      v3[39] = 0;
      v3[22] = 0;
      uint64_t v7 = (IODMACommand *)*(v3 - 31);
      if (v7)
      {
        IODMACommand::CompleteDMA(v7, 0, 0);
        uint64_t v8 = *(v3 - 31);
        if (v8)
        {
          (*(void (**)(uint64_t))(*(void *)v8 + 16))(v8);
          *(v3 - 31) = 0;
        }
      }
      uint64_t v9 = *(v3 - 30);
      if (v9)
      {
        (*(void (**)(uint64_t))(*(void *)v9 + 16))(v9);
        *(v3 - 30) = 0;
      }
      uint64_t result = *v3;
      if (*v3) {
        operator delete[]();
      }
      *long long v3 = 0;
      *(v3 - 17) = 0;
      ++v2;
      v3 += 39;
    }
    while (v2 < *(unsigned __int8 *)(v1 + 681));
  }
  return result;
}

uint64_t sub_10001ACF8(IOUserNetworkPacketBufferPool **a1, uint32_t a2, unsigned int *a3)
{
  memset(__str, 0, sizeof(__str));
  snprintf((char *)__str, 0x20uLL, "ixl:%s:%s", (const char *)qword_100028550, "");
  options.packetCount = *((unsigned __int8 *)a1 + 681) << 11;
  options.bufferCount = options.packetCount;
  *(void *)&options.maxBuffersPerPacket = 1;
  options.bufferSize = a2;
  options.poolFlags = 0x20000000;
  options.dmaSpecification.maxAddressBits = 64;
  if (IOUserNetworkPacketBufferPool::CreateWithOptions((IOService *)a1[4][631].ivars, (const char *)__str, &options, a1 + 1))
  {
    sub_10001D138();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  if (*((unsigned char *)a1 + 681))
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    uint64_t v8 = (IODispatchQueue *)a1[4][631].IOUserNetworkPacketBufferPoolInterface::__vftable;
    uint64_t v9 = (IOUserNetworkRxSubmissionQueue **)&v18;
    do
    {
      uint64_t v10 = (IOUserNetworkTxSubmissionQueue **)&a1[v6 + 44];
      if (IOUserNetworkTxSubmissionQueue::Create(a1[1], *a1, 0x200u, 0, v8, v10)) {
        sub_10001D10C();
      }
      if (DriverKit_AppleEthernetIXL_NetIf::CreateActionTxSubmit(*a1, 8uLL, (OSAction **)&a1[v6 + 41])) {
        sub_10001D0E0();
      }
      if (((unsigned int (*)(IOUserNetworkTxSubmissionQueue *, IOUserNetworkPacketBufferPool **))(*v10)->CopyDataQueue)(*v10, &a1[v6 + 42]))
      {
        sub_10001D0B4();
      }
      *(v9 - 2) = (IOUserNetworkRxSubmissionQueue *)*v10;
      if (IODataQueueDispatchSource::SetDataAvailableHandler((IODataQueueDispatchSource *)a1[v6 + 42], (OSAction *)a1[v6 + 41], 0))
      {
        sub_10001D088();
      }
      int v11 = (IOUserNetworkTxCompletionQueue **)&a1[v6 + 45];
      if (IOUserNetworkTxCompletionQueue::Create(a1[1], *a1, 0x200u, 0, v8, v11)) {
        sub_10001D05C();
      }
      if (((unsigned int (*)(IOUserNetworkTxCompletionQueue *, IOUserNetworkPacketBufferPool **))(*v11)->CopyDataQueue)(*v11, &a1[v6 + 43]))
      {
        sub_10001D030();
      }
      *(v9 - 1) = (IOUserNetworkRxSubmissionQueue *)*v11;
      uint64_t v12 = (IOUserNetworkRxSubmissionQueue **)&a1[v6 + 83];
      if (IOUserNetworkRxSubmissionQueue::Create(a1[1], *a1, 0x200u, 0, v8, v12)) {
        sub_10001D004();
      }
      if (DriverKit_AppleEthernetIXL_NetIf::CreateActionRxSubmit(*a1, 8uLL, (OSAction **)&a1[v6 + 80])) {
        sub_10001CFD8();
      }
      if (((unsigned int (*)(IOUserNetworkRxSubmissionQueue *, IOUserNetworkPacketBufferPool **))(*v12)->CopyDataQueue)(*v12, &a1[v6 + 81]))
      {
        sub_10001CFAC();
      }
      *uint64_t v9 = *v12;
      if (IODataQueueDispatchSource::SetDataAvailableHandler((IODataQueueDispatchSource *)a1[v6 + 81], (OSAction *)a1[80], 0))
      {
        sub_10001CF80();
      }
      uint64_t v13 = (IOUserNetworkRxCompletionQueue **)&a1[v6 + 84];
      if (IOUserNetworkRxCompletionQueue::Create(a1[1], *a1, 0x200u, 0, v8, v13)) {
        sub_10001CF54();
      }
      if (((unsigned int (*)(IOUserNetworkRxCompletionQueue *, IOUserNetworkPacketBufferPool **))(*v13)->CopyDataQueue)(*v13, &a1[v6 + 82]))
      {
        sub_10001CF28();
      }
      v9[1] = (IOUserNetworkRxSubmissionQueue *)*v13;
      ++v7;
      v6 += 39;
      v9 += 4;
    }
    while (v7 < *((unsigned __int8 *)a1 + 681));
  }
  unsigned int v16 = 256;
  if (sub_100002260((uint64_t)a1, v15, &v16)) {
    sub_10001CEFC();
  }
  if (((unsigned int (*)(IOUserNetworkPacketBufferPool *, void *, void))(*a1)->DeallocatePackets)(*a1, v15, v16))
  {
    sub_10001CED0();
  }
  if (((unsigned int (*)(IOUserNetworkPacketBufferPool *, unint64_t, IOUserNetworkPacketBufferPool *, long long *, void))(*a1)->OSObject::OSMetaClassBase::__vftable[3].Dispatch)(*a1, *a3 | ((unint64_t)*((unsigned __int16 *)a3 + 2) << 32), a1[1], &v17, 4 * *((unsigned __int8 *)a1 + 681)))
  {
    sub_10001CEA4();
  }
  uint64_t result = IOService::RegisterService((IOService *)*a1, 0);
  if (result) {
    sub_10001CE78();
  }
  return result;
}

uint64_t sub_10001B0D4(uint64_t a1)
{
  sub_10001A988(a1);
  uint64_t v2 = sub_100008028(a1);
  if (!v2)
  {
    sub_100001F04(*(int **)(a1 + 32));
    if (*(unsigned char *)(a1 + 681))
    {
      unint64_t v3 = 0;
      uint64_t v4 = (IOUserNetworkPacketQueue **)(a1 + 352);
      while (1)
      {
        uint64_t v5 = IOUserNetworkPacketQueue::SetEnable(v4[40], 1, 0);
        if (v5) {
          break;
        }
        uint64_t v5 = IOUserNetworkPacketQueue::SetEnable(v4[39], 1, 0);
        if (v5) {
          break;
        }
        uint64_t v5 = IOUserNetworkPacketQueue::SetEnable(v4[1], 1, 0);
        if (v5) {
          break;
        }
        uint64_t v5 = IOUserNetworkPacketQueue::SetEnable(*v4, 1, 0);
        if (v5) {
          break;
        }
        ++v3;
        v4 += 39;
        if (v3 >= *(unsigned __int8 *)(a1 + 681)) {
          goto LABEL_9;
        }
      }
      uint64_t v2 = v5;
    }
    else
    {
LABEL_9:
      uint64_t v2 = 0;
      *(_DWORD *)(a1 + 16) = 2;
    }
  }
  if ((dword_100028548 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315906;
    uint64_t v8 = qword_100028550;
    __int16 v9 = 2080;
    uint64_t v10 = "enable";
    __int16 v11 = 1024;
    int v12 = 111;
    __int16 v13 = 1024;
    int v14 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): ==> 0x%08x\n", (uint8_t *)&v7, 0x22u);
  }
  return v2;
}

uint64_t sub_10001B23C(uint64_t a1)
{
  *(_DWORD *)(a1 + 16) = 0;
  sub_10000A1F8(a1);
  if (*(unsigned char *)(a1 + 681))
  {
    unint64_t v2 = 0;
    unint64_t v3 = (IOUserNetworkPacketQueue **)(a1 + 352);
    do
    {
      IOUserNetworkPacketQueue::SetEnable(v3[39], 0, 0);
      sub_100001E04(a1, (uint64_t)(v3 + 2));
      IOUserNetworkPacketQueue::SetEnable(v3[40], 0, 0);
      IOUserNetworkPacketQueue::SetEnable(*v3, 0, 0);
      sub_100001E04(a1, (uint64_t)(v3 - 37));
      IOUserNetworkPacketQueue::SetEnable(v3[1], 0, 0);
      ++v2;
      v3 += 39;
    }
    while (v2 < *(unsigned __int8 *)(a1 + 681));
  }
  return sub_10001AB7C(a1);
}

uint64_t sub_10001B310(void *a1)
{
  *a1 = off_100024AC0;
  return 0;
}

uint64_t DriverKit_AppleEthernetIXLMetaClass::New(DriverKit_AppleEthernetIXLMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100024B00;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_100024B48;
  return 0;
}

uint64_t DriverKit_AppleEthernetIXL::Dispatch(IOService *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return DriverKit_AppleEthernetIXL::_Dispatch(this, &v4, a3);
}

uint64_t DriverKit_AppleEthernetIXL::_Dispatch(IOService *this, IORPC *a2, IORPC *a3)
{
  int64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid > 0x36830F16A087820)
  {
    switch(msgid)
    {
      case 0x36830F16A087821:
        if (OSMetaClassBase::IsRemote(this))
        {
          long long v14 = *(_OWORD *)&a2->message;
          uint64_t v15 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v14;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        long long v12 = *(_OWORD *)&a2->message;
        uint64_t v13 = *(void *)&a2->sendSize;
        uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetIXL_LegacyInterruptMetaClass;
        __int16 v9 = DriverKit_AppleEthernetIXL::LegacyInterrupt_Impl;
        uint64_t v10 = (IORPC *)&v12;
        break;
      case 0x60F1C40F6D29E480:
        if (OSMetaClassBase::IsRemote(this))
        {
          IORPC invoke = *a2;
          p_IORPC invoke = &invoke;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        IORPC v16 = *a2;
        uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetIXL_OtherInterruptMetaClass;
        __int16 v9 = DriverKit_AppleEthernetIXL::OtherInterrupt_Impl;
        uint64_t v10 = &v16;
        break;
      case 0x7F95632F46386C47:
        if (OSMetaClassBase::IsRemote(this))
        {
          long long v20 = *(_OWORD *)&a2->message;
          uint64_t v21 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v20;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        long long v18 = *(_OWORD *)&a2->message;
        uint64_t v19 = *(void *)&a2->sendSize;
        uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetIXL_QueueInterruptMetaClass;
        __int16 v9 = DriverKit_AppleEthernetIXL::QueueInterrupt_Impl;
        uint64_t v10 = (IORPC *)&v18;
        break;
      default:
LABEL_14:
        IORPC v11 = *a2;
        return IOService::_Dispatch(this, &v11);
    }
    return IOInterruptDispatchSource::InterruptOccurred_Invoke(v10, this, (IOInterruptDispatchSource::InterruptOccurred_Handler)v9, v8);
  }
  if (msgid == 0x98E715041C459FA5)
  {
    IORPC v23 = *a2;
    return IOService::Stop_Invoke(&v23, this, (IOService::Stop_Handler)DriverKit_AppleEthernetIXL::Stop_Impl);
  }
  if (msgid != 0xAB6F76DDE6D693F2)
  {
    if (msgid == 0xD200FDE7D57ECCA6)
    {
      IORPC rpc = *a2;
      return IOService::SetPowerState_Invoke(&rpc, this, (IOService::SetPowerState_Handler)DriverKit_AppleEthernetIXL::SetPowerState_Impl);
    }
    goto LABEL_14;
  }
  IORPC v24 = *a2;
  return IOService::Start_Invoke(&v24, this, (IOService::Start_Handler)DriverKit_AppleEthernetIXL::Start_Impl);
}

uint64_t DriverKit_AppleEthernetIXLMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t DriverKit_AppleEthernetIXL::CreateActionQueueInterrupt(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetIXL_QueueInterrupt");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x7F95632F46386C47uLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetIXL::CreateActionOtherInterrupt(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetIXL_OtherInterrupt");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x60F1C40F6D29E480uLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetIXL::CreateActionLegacyInterrupt(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetIXL_LegacyInterrupt");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x36830F16A087821uLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t sub_10001B8D8(void *a1)
{
  *a1 = off_100024B68;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_QueueInterruptMetaClass::New(OSAction_DriverKit_AppleEthernetIXL_QueueInterruptMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100024BA8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100024BF0;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_QueueInterrupt::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_QueueInterrupt::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_QueueInterruptMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001BA38(void *a1)
{
  *a1 = off_100024C10;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_OtherInterruptMetaClass::New(OSAction_DriverKit_AppleEthernetIXL_OtherInterruptMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100024C50;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100024C98;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_OtherInterrupt::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_OtherInterrupt::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_OtherInterruptMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001BB98(void *a1)
{
  *a1 = off_100024CB8;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_LegacyInterruptMetaClass::New(OSAction_DriverKit_AppleEthernetIXL_LegacyInterruptMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100024CF8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100024D40;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_LegacyInterrupt::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_LegacyInterrupt::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_LegacyInterruptMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001BCF8()
{
  return gOSAction_DriverKit_AppleEthernetIXL_QueueInterruptMetaClass;
}

uint64_t sub_10001BD04()
{
  return gOSAction_DriverKit_AppleEthernetIXL_OtherInterruptMetaClass;
}

uint64_t sub_10001BD10()
{
  return gOSAction_DriverKit_AppleEthernetIXL_LegacyInterruptMetaClass;
}

uint64_t sub_10001BD1C(void *a1)
{
  *a1 = off_100024F40;
  return 0;
}

uint64_t DriverKit_AppleEthernetIXL_NetIfMetaClass::New(DriverKit_AppleEthernetIXL_NetIfMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100024F80;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_100025110;
  *(void *)&a2[1].refcount = &off_100025130;
  return 0;
}

uint64_t DriverKit_AppleEthernetIXL_NetIf::Dispatch(IOUserNetworkEthernet *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return DriverKit_AppleEthernetIXL_NetIf::_Dispatch(this, &v4, a3);
}

uint64_t DriverKit_AppleEthernetIXL_NetIf::_Dispatch(IOUserNetworkEthernet *this, IORPC *a2, IORPC *a3)
{
  int64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid <= (uint64_t)0xE77A9AA5DB9C706BLL)
  {
    if (msgid <= (uint64_t)0xC3E63AC546EBD1FDLL)
    {
      if (msgid == 0xA49568F23EE8EFD5)
      {
        IORPC v23 = *a2;
        return IOUserNetworkEthernet::GetMaxTransferUnit_Invoke(&v23, this, (IOUserNetworkEthernet::GetMaxTransferUnit_Handler)DriverKit_AppleEthernetIXL_NetIf::GetMaxTransferUnit_Impl);
      }
      if (msgid == 0xB23EE0228705FB95)
      {
        if (OSMetaClassBase::IsRemote(this))
        {
          long long v20 = *(_OWORD *)&a2->message;
          uint64_t v21 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v20;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        IORPC v19 = *a2;
        return IOUserNetworkEthernet::SetWakeOnMagicPacketEnable_Invoke(&v19, this, (IOUserNetworkEthernet::SetWakeOnMagicPacketEnable_Handler)DriverKit_AppleEthernetIXL_NetIf::SetWakeOnMagicPacketEnable_Impl);
      }
    }
    else
    {
      switch(msgid)
      {
        case 0xC3E63AC546EBD1FELL:
          if (OSMetaClassBase::IsRemote(this))
          {
            long long v25 = *(_OWORD *)&a2->message;
            uint64_t v26 = *(void *)&a2->sendSize;
            p_IORPC invoke = (IORPC *)&v25;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          IORPC v24 = *a2;
          return IOUserNetworkEthernet::SelectMediaType_Invoke(&v24, this, (IOUserNetworkEthernet::SelectMediaType_Handler)DriverKit_AppleEthernetIXL_NetIf::SelectMediaType_Impl);
        case 0xE042A87972611225:
          if (OSMetaClassBase::IsRemote(this))
          {
            long long v28 = *(_OWORD *)&a2->message;
            uint64_t v29 = *(void *)&a2->sendSize;
            p_IORPC invoke = (IORPC *)&v28;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          IORPC v27 = *a2;
          return IOUserNetworkEthernet::SetAllMulticastModeEnable_Invoke(&v27, this, (IOUserNetworkEthernet::SetAllMulticastModeEnable_Handler)DriverKit_AppleEthernetIXL_NetIf::SetAllMulticastModeEnable_Impl);
        case 0xE072FCC26CF639ACLL:
          if (OSMetaClassBase::IsRemote(this))
          {
            long long v31 = *(_OWORD *)&a2->message;
            uint64_t v32 = *(void *)&a2->sendSize;
            p_IORPC invoke = (IORPC *)&v31;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          IORPC v30 = *a2;
          return IOUserNetworkEthernet::SetPromiscuousModeEnable_Invoke(&v30, this, (IOUserNetworkEthernet::SetPromiscuousModeEnable_Handler)DriverKit_AppleEthernetIXL_NetIf::SetPromiscuousModeEnable_Impl);
      }
    }
LABEL_32:
    IORPC v11 = *a2;
    return IOUserNetworkEthernet::_Dispatch(this, &v11);
  }
  if (msgid <= (uint64_t)0xF421A9D80F9A1FD9)
  {
    if (msgid == 0xE77A9AA5DB9C706CLL)
    {
      IORPC v22 = *a2;
      return IOUserNetworkEthernet::GetHardwareAssists_Invoke(&v22, this, (IOUserNetworkEthernet::GetHardwareAssists_Handler)DriverKit_AppleEthernetIXL_NetIf::GetHardwareAssists_Impl);
    }
    if (msgid == 0xED7CE2CA0DF8ED0ELL)
    {
      IORPC rpc = *a2;
      return IOUserNetworkEthernet::SetMTU_Invoke(&rpc, this, (IOUserNetworkEthernet::SetMTU_Handler)DriverKit_AppleEthernetIXL_NetIf::SetMTU_Impl);
    }
    goto LABEL_32;
  }
  if (msgid == 0x7D9CD4150B21446BLL)
  {
    if (OSMetaClassBase::IsRemote(this))
    {
      long long v16 = *(_OWORD *)&a2->message;
      uint64_t v17 = *(void *)&a2->sendSize;
      p_IORPC invoke = (IORPC *)&v16;
      return OSMetaClassBase::Dispatch(this, p_invoke);
    }
    long long v14 = *(_OWORD *)&a2->message;
    uint64_t v15 = *(void *)&a2->sendSize;
    uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetIXL_NetIf_TxSubmitMetaClass;
    __int16 v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetIXL_NetIf::TxSubmit_Impl;
    uint64_t v10 = (IORPC *)&v14;
    return IODataQueueDispatchSource::DataAvailable_Invoke(v10, this, v9, v8);
  }
  if (msgid == 0x5F5A9D5C2A76B1B2)
  {
    if (OSMetaClassBase::IsRemote(this))
    {
      IORPC invoke = *a2;
      p_IORPC invoke = &invoke;
      return OSMetaClassBase::Dispatch(this, p_invoke);
    }
    IORPC v12 = *a2;
    uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetIXL_NetIf_RxSubmitMetaClass;
    __int16 v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetIXL_NetIf::RxSubmit_Impl;
    uint64_t v10 = &v12;
    return IODataQueueDispatchSource::DataAvailable_Invoke(v10, this, v9, v8);
  }
  if (msgid != 0xF421A9D80F9A1FDALL) {
    goto LABEL_32;
  }
  if (OSMetaClassBase::IsRemote(this))
  {
    long long v34 = *(_OWORD *)&a2->message;
    uint64_t v35 = *(void *)&a2->sendSize;
    p_IORPC invoke = (IORPC *)&v34;
    return OSMetaClassBase::Dispatch(this, p_invoke);
  }
  IORPC v33 = *a2;
  return IOUserNetworkEthernet::SetInterfaceEnable_Invoke(&v33, this, (IOUserNetworkEthernet::SetInterfaceEnable_Handler)DriverKit_AppleEthernetIXL_NetIf::SetInterfaceEnable_Impl);
}

uint64_t DriverKit_AppleEthernetIXL_NetIfMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t DriverKit_AppleEthernetIXL_NetIf::CreateActionTxSubmit(OSObject *this, size_t a2, OSAction **a3)
{
  IORPC v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetIXL_NetIf_TxSubmit");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x7D9CD4150B21446BuLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetIXL_NetIf::CreateActionRxSubmit(OSObject *this, size_t a2, OSAction **a3)
{
  IORPC v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetIXL_NetIf_RxSubmit");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x5F5A9D5C2A76B1B2uLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t sub_10001C440(void *a1)
{
  *a1 = off_100025288;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_NetIf_TxSubmitMetaClass::New(OSAction_DriverKit_AppleEthernetIXL_NetIf_TxSubmitMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000252C8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100025310;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_NetIf_TxSubmit::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_NetIf_TxSubmit::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_NetIf_TxSubmitMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001C5A0(void *a1)
{
  *a1 = off_100025330;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_NetIf_RxSubmitMetaClass::New(OSAction_DriverKit_AppleEthernetIXL_NetIf_RxSubmitMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100025370;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_1000253B8;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_NetIf_RxSubmit::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_NetIf_RxSubmit::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetIXL_NetIf_RxSubmitMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001C700()
{
  return gOSAction_DriverKit_AppleEthernetIXL_NetIf_TxSubmitMetaClass;
}

uint64_t sub_10001C70C()
{
  return gOSAction_DriverKit_AppleEthernetIXL_NetIf_RxSubmitMetaClass;
}

void sub_10001C718()
{
}

void sub_10001C744()
{
}

void sub_10001C770()
{
  __assert_rtn("alloc_scattered", "ixl_pf_qmgr.cpp", 64, "qtag && num && (num <= 16)");
}

void sub_10001C79C()
{
}

void sub_10001C7C8()
{
}

void sub_10001C7F4()
{
  __assert_rtn("get_first_free", "ixl_pf_qmgr.cpp", 135, "start <= (num_queues - 1)");
}

void sub_10001C820()
{
}

void sub_10001C84C()
{
}

void sub_10001C878()
{
}

void sub_10001C8A4()
{
}

void sub_10001C8D0()
{
}

void sub_10001C8FC()
{
}

void sub_10001C928()
{
}

void sub_10001C954()
{
}

void sub_10001C980()
{
}

void sub_10001C9AC()
{
}

void sub_10001C9D8()
{
}

void sub_10001CA04()
{
}

void sub_10001CA30()
{
}

void sub_10001CA5C()
{
}

void sub_10001CA88()
{
}

void sub_10001CAB4()
{
}

void sub_10001CAE0()
{
}

void sub_10001CB0C()
{
}

void sub_10001CB38()
{
}

void sub_10001CB64()
{
}

void sub_10001CB90()
{
}

void sub_10001CBBC()
{
}

void sub_10001CBE8()
{
}

void sub_10001CC14()
{
}

void sub_10001CC40()
{
}

void sub_10001CC6C()
{
}

void sub_10001CC98()
{
}

void sub_10001CCC4()
{
}

void sub_10001CCF0()
{
}

void sub_10001CD1C()
{
}

void sub_10001CD48()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v0 = 136315650;
    uint64_t v1 = qword_100028550;
    __int16 v2 = 2080;
    unint64_t v3 = "up";
    __int16 v4 = 1024;
    int v5 = 516;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixl:(%s): %s(%d): Admin Queue is down; resetting...\n",
      (uint8_t *)&v0,
      0x1Cu);
  }
  __assert_rtn("up", "AppleEthernetIXL.cpp", 517, "0");
}

void sub_10001CDF0()
{
}

uint64_t sub_10001CE1C(IODMACommand *a1, uint64_t *a2)
{
  IODMACommand::CompleteDMA(a1, 0, 0);
  uint64_t result = *a2;
  if (*a2)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 16))(result);
    *a2 = 0;
  }
  return result;
}

void sub_10001CE78()
{
}

void sub_10001CEA4()
{
}

void sub_10001CED0()
{
}

void sub_10001CEFC()
{
}

void sub_10001CF28()
{
}

void sub_10001CF54()
{
}

void sub_10001CF80()
{
}

void sub_10001CFAC()
{
}

void sub_10001CFD8()
{
}

void sub_10001D004()
{
}

void sub_10001D030()
{
}

void sub_10001D05C()
{
}

void sub_10001D088()
{
}

void sub_10001D0B4()
{
}

void sub_10001D0E0()
{
}

void sub_10001D10C()
{
}

void sub_10001D138()
{
}

void IODelay(uint64_t us)
{
}

void IOFree(void *address, size_t length)
{
}

int IOLog(const char *format, ...)
{
  return _IOLog(format);
}

uint64_t IOMallocZeroTyped()
{
  return _IOMallocZeroTyped();
}

BOOL IOParseBootArgNumber(const char *arg_string, void *arg_ptr, int max_len)
{
  return _IOParseBootArgNumber(arg_string, arg_ptr, max_len);
}

IORPCMessage *__cdecl IORPCMessageFromMach(IORPCMessageMach *msg, BOOL reply)
{
  return _IORPCMessageFromMach(msg, reply);
}

OSDictionaryPtr OSDictionaryCreate(void)
{
  return _OSDictionaryCreate();
}

void OSDictionarySetStringValue(OSDictionaryPtr obj, const char *key, const char *value)
{
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void IOPCIDevice::MemoryRead32(IOPCIDevice *this, uint8_t memoryIndex, uint64_t offset, uint32_t *readData)
{
}

void IOPCIDevice::MemoryWrite32(IOPCIDevice *this, uint8_t memoryIndex, uint64_t offset, uint32_t data)
{
}

void IOPCIDevice::ConfigurationRead8(IOPCIDevice *this, uint64_t offset, uint8_t *readData)
{
}

void IOPCIDevice::ConfigurationWrite8(IOPCIDevice *this, uint64_t offset, uint8_t data)
{
}

uint64_t IOPCIDevice::ConfigureInterrupts(IOPCIDevice *this, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, int (*a6)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  return IOPCIDevice::ConfigureInterrupts(this, a2, a3, a4, a5, a6);
}

kern_return_t IOPCIDevice::GetBusDeviceFunction(IOPCIDevice *this, uint8_t *returnBusNumber, uint8_t *returnDeviceNumber, uint8_t *returnFunctionNumber, OSDispatchMethod supermethod)
{
  return IOPCIDevice::GetBusDeviceFunction(this, returnBusNumber, returnDeviceNumber, returnFunctionNumber, supermethod);
}

kern_return_t IOPCIDevice::Open(IOPCIDevice *this, IOService *forClient, IOOptionBits options)
{
  return IOPCIDevice::Open(this, forClient, options);
}

void IOPCIDevice::Close(IOPCIDevice *this, IOService *forClient, IOOptionBits options)
{
}

kern_return_t IODMACommand::CompleteDMA(IODMACommand *this, uint64_t options, OSDispatchMethod supermethod)
{
  return IODMACommand::CompleteDMA(this, options, supermethod);
}

kern_return_t IODMACommand::PrepareForDMA(IODMACommand *this, uint64_t options, IOMemoryDescriptor *memory, uint64_t offset, uint64_t length, uint64_t *flags, uint32_t *segmentsCount, IOAddressSegment *segments, OSDispatchMethod supermethod)
{
  return IODMACommand::PrepareForDMA(this, options, memory, offset, length, flags, segmentsCount, segments, supermethod);
}

kern_return_t IODMACommand::Create(IOService *device, uint64_t options, const IODMACommandSpecification *specification, IODMACommand **command)
{
  return IODMACommand::Create(device, options, specification, command);
}

void IODispatchQueue::DispatchSync(IODispatchQueue *this, IODispatchBlock block)
{
}

kern_return_t IODispatchQueue::Create(const IODispatchQueueName name, uint64_t options, uint64_t priority, IODispatchQueue **queue)
{
  return IODispatchQueue::Create(name, options, priority, queue);
}

OSMetaClassBase *__cdecl OSMetaClassBase::safeMetaCast(const OSMetaClassBase *anObject, const OSMetaClass *toMeta)
{
  return OSMetaClassBase::safeMetaCast(anObject, toMeta);
}

kern_return_t OSMetaClassBase::Dispatch(OSMetaClassBase *this, IORPC *invoke)
{
  return OSMetaClassBase::Dispatch(this, invoke);
}

BOOL OSMetaClassBase::IsRemote(OSMetaClassBase *this)
{
  return OSMetaClassBase::IsRemote(this);
}

kern_return_t IODispatchSource::SetEnable(IODispatchSource *this, BOOL enable, OSDispatchMethod supermethod)
{
  return IODispatchSource::SetEnable(this, enable, supermethod);
}

kern_return_t IOUserNetworkEthernet::SetMTU_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SetMTU_Handler func)
{
  return IOUserNetworkEthernet::SetMTU_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::SelectMediaType_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SelectMediaType_Handler func)
{
  return IOUserNetworkEthernet::SelectMediaType_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::GetHardwareAssists_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::GetHardwareAssists_Handler func)
{
  return IOUserNetworkEthernet::GetHardwareAssists_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::GetMaxTransferUnit_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::GetMaxTransferUnit_Handler func)
{
  return IOUserNetworkEthernet::GetMaxTransferUnit_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::SetInterfaceEnable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SetInterfaceEnable_Handler func)
{
  return IOUserNetworkEthernet::SetInterfaceEnable_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::SetPromiscuousModeEnable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SetPromiscuousModeEnable_Handler func)
{
  return IOUserNetworkEthernet::SetPromiscuousModeEnable_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::SetAllMulticastModeEnable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SetAllMulticastModeEnable_Handler func)
{
  return IOUserNetworkEthernet::SetAllMulticastModeEnable_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::SetWakeOnMagicPacketEnable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SetWakeOnMagicPacketEnable_Handler func)
{
  return IOUserNetworkEthernet::SetWakeOnMagicPacketEnable_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::SetMTU(IOUserNetworkEthernet *this, uint32_t mtu, OSDispatchMethod supermethod)
{
  return IOUserNetworkEthernet::SetMTU(this, mtu, supermethod);
}

kern_return_t IOUserNetworkEthernet::_Dispatch(IOUserNetworkEthernet *self, const IORPC *rpc)
{
  return IOUserNetworkEthernet::_Dispatch(self, rpc);
}

kern_return_t IOBufferMemoryDescriptor::GetAddressRange(IOBufferMemoryDescriptor *this, IOAddressSegment *range)
{
  return IOBufferMemoryDescriptor::GetAddressRange(this, range);
}

kern_return_t IOBufferMemoryDescriptor::Create(uint64_t options, uint64_t capacity, uint64_t alignment, IOBufferMemoryDescriptor **memory)
{
  return IOBufferMemoryDescriptor::Create(options, capacity, alignment, memory);
}

kern_return_t IOUserNetworkPacketQueue::SetEnable(IOUserNetworkPacketQueue *this, BOOL isEnable, OSDispatchMethod supermethod)
{
  return IOUserNetworkPacketQueue::SetEnable(this, isEnable, supermethod);
}

void IODataQueueDispatchSource::SendDataAvailable(IODataQueueDispatchSource *this)
{
}

kern_return_t IODataQueueDispatchSource::EnqueueWithCoalesce(IODataQueueDispatchSource *this, uint32_t dataSize, BOOL *sendDataAvailable, IODataQueueClientEnqueueEntryBlock callback)
{
  return IODataQueueDispatchSource::EnqueueWithCoalesce(this, dataSize, sendDataAvailable, callback);
}

kern_return_t IODataQueueDispatchSource::DataAvailable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODataQueueDispatchSource::DataAvailable_Handler func, const OSMetaClass *targetActionClass)
{
  return IODataQueueDispatchSource::DataAvailable_Invoke(rpc, target, func, targetActionClass);
}

kern_return_t IODataQueueDispatchSource::SetDataAvailableHandler(IODataQueueDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  return IODataQueueDispatchSource::SetDataAvailableHandler(this, action, supermethod);
}

kern_return_t IOInterruptDispatchSource::SetHandler(IOInterruptDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  return IOInterruptDispatchSource::SetHandler(this, action, supermethod);
}

kern_return_t IOInterruptDispatchSource::GetInterruptType(IOService *provider, uint32_t index, uint64_t *interruptType)
{
  return IOInterruptDispatchSource::GetInterruptType(provider, index, interruptType);
}

kern_return_t IOInterruptDispatchSource::InterruptOccurred_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOInterruptDispatchSource::InterruptOccurred_Handler func, const OSMetaClass *targetActionClass)
{
  return IOInterruptDispatchSource::InterruptOccurred_Invoke(rpc, target, func, targetActionClass);
}

kern_return_t IOInterruptDispatchSource::Create(IOService *provider, uint32_t index, IODispatchQueue *queue, IOInterruptDispatchSource **source)
{
  return IOInterruptDispatchSource::Create(provider, index, queue, source);
}

kern_return_t IOUserNetworkPacketBufferPool::CreateWithOptions(IOService *device, const char *name, const IOUserNetworkPacketBufferPoolOptions *options, IOUserNetworkPacketBufferPool **pool)
{
  return IOUserNetworkPacketBufferPool::CreateWithOptions(device, name, options, pool);
}

kern_return_t IOUserNetworkRxCompletionQueue::Create(IOUserNetworkPacketBufferPool *pool, OSObject *owner, uint32_t capacity, uint32_t queueId, IODispatchQueue *dispatchQueue, IOUserNetworkRxCompletionQueue **queue)
{
  return IOUserNetworkRxCompletionQueue::Create(pool, owner, capacity, queueId, dispatchQueue, queue);
}

kern_return_t IOUserNetworkRxSubmissionQueue::Create(IOUserNetworkPacketBufferPool *pool, OSObject *owner, uint32_t capacity, uint32_t queueId, IODispatchQueue *dispatchQueue, IOUserNetworkRxSubmissionQueue **queue)
{
  return IOUserNetworkRxSubmissionQueue::Create(pool, owner, capacity, queueId, dispatchQueue, queue);
}

kern_return_t IOUserNetworkTxCompletionQueue::Create(IOUserNetworkPacketBufferPool *pool, OSObject *owner, uint32_t capacity, uint32_t queueId, IODispatchQueue *dispatchQueue, IOUserNetworkTxCompletionQueue **queue)
{
  return IOUserNetworkTxCompletionQueue::Create(pool, owner, capacity, queueId, dispatchQueue, queue);
}

kern_return_t IOUserNetworkTxSubmissionQueue::Create(IOUserNetworkPacketBufferPool *pool, OSObject *owner, uint32_t capacity, uint32_t queueId, IODispatchQueue *dispatchQueue, IOUserNetworkTxSubmissionQueue **queue)
{
  return IOUserNetworkTxSubmissionQueue::Create(pool, owner, capacity, queueId, dispatchQueue, queue);
}

kern_return_t OSAction::CreateWithTypeName(OSObject *target, uint64_t targetmsgid, uint64_t msgid, size_t referenceSize, OSString *typeName, OSAction **action)
{
  return OSAction::CreateWithTypeName(target, targetmsgid, msgid, referenceSize, typeName, action);
}

kern_return_t OSAction::_Dispatch(OSAction *self, const IORPC *rpc)
{
  return OSAction::_Dispatch(self, rpc);
}

kern_return_t OSObject::SetDispatchQueue(OSObject *this, const IODispatchQueueName name, IODispatchQueue *queue, OSDispatchMethod supermethod)
{
  return OSObject::SetDispatchQueue(this, name, queue, supermethod);
}

kern_return_t OSObject::CopyDispatchQueue(OSObject *this, const IODispatchQueueName name, IODispatchQueue **queue, OSDispatchMethod supermethod)
{
  return OSObject::CopyDispatchQueue(this, name, queue, supermethod);
}

OSStringPtr OSString::withCString(const char *cString)
{
  return OSString::withCString(cString);
}

uint64_t IOService::JoinPMTree(IOService *this, int (*a2)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  return IOService::JoinPMTree(this, a2);
}

kern_return_t IOService::Stop_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::Stop_Handler func)
{
  return IOService::Stop_Invoke(rpc, target, func);
}

kern_return_t IOService::Start_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::Start_Handler func)
{
  return IOService::Start_Invoke(rpc, target, func);
}

kern_return_t IOService::SetPowerState(IOService *this, uint32_t powerFlags, OSDispatchMethod supermethod)
{
  return IOService::SetPowerState(this, powerFlags, supermethod);
}

kern_return_t IOService::SetProperties(IOService *this, OSDictionary *properties, OSDispatchMethod supermethod)
{
  return IOService::SetProperties(this, properties, supermethod);
}

kern_return_t IOService::CopyProperties(IOService *this, OSDictionary **properties, OSDispatchMethod supermethod)
{
  return IOService::CopyProperties(this, properties, supermethod);
}

kern_return_t IOService::RegisterService(IOService *this, OSDispatchMethod supermethod)
{
  return IOService::RegisterService(this, supermethod);
}

kern_return_t IOService::SetPowerState_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::SetPowerState_Handler func)
{
  return IOService::SetPowerState_Invoke(rpc, target, func);
}

kern_return_t IOService::Stop(IOService *this, IOService *provider, OSDispatchMethod supermethod)
{
  return IOService::Stop(this, provider, supermethod);
}

void IOService::free(IOService *this)
{
}

BOOL IOService::init(IOService *this)
{
  return IOService::init(this);
}

kern_return_t IOService::Start(IOService *this, IOService *provider, OSDispatchMethod supermethod)
{
  return IOService::Start(this, provider, supermethod);
}

kern_return_t IOService::Create(IOService *this, IOService *provider, const IOPropertyName propertiesKey, IOService **result, OSDispatchMethod supermethod)
{
  return IOService::Create(this, provider, propertiesKey, result, supermethod);
}

kern_return_t IOService::Terminate(IOService *this, uint64_t options, OSDispatchMethod supermethod)
{
  return IOService::Terminate(this, options, supermethod);
}

kern_return_t IOService::_Dispatch(IOService *self, const IORPC *rpc)
{
  return IOService::_Dispatch(self, rpc);
}

OSObject *__cdecl OSDictionary::getObject(const OSDictionary *this, const char *aKey)
{
  return OSDictionary::getObject(this, aKey);
}

const void *__cdecl OSData::getBytesNoCopy(const OSData *this)
{
  return OSData::getBytesNoCopy(this);
}

const char *__cdecl OSString::getCStringNoCopy(const OSString *this)
{
  return OSString::getCStringNoCopy(this);
}

void operator delete[]()
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

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}