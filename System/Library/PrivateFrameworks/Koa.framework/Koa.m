uint64_t KVItemTypeFromFieldType(unsigned __int16 a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  result = 0;
  if (a1 > 0x12Bu)
  {
    if (a1 > 0x351u)
    {
      v13 = 24;
      if (a1 - 1100 >= 6) {
        v13 = 0;
      }
      if (a1 - 1150 >= 7) {
        v5 = v13;
      }
      else {
        v5 = 25;
      }
      v14 = 22;
      if (a1 - 1000 >= 2) {
        v14 = 0;
      }
      if (a1 - 1050 >= 6) {
        v7 = v14;
      }
      else {
        v7 = 23;
      }
      v15 = 20;
      if (a1 - 900 >= 2) {
        v15 = 0;
      }
      if (a1 - 850 >= 2) {
        v16 = v15;
      }
      else {
        v16 = 19;
      }
      if (a1 - 950 >= 3) {
        v17 = v16;
      }
      else {
        v17 = 21;
      }
      if (a1 <= 0x3E7u) {
        v7 = v17;
      }
      v8 = a1 <= 0x44Bu;
    }
    else if (a1 <= 0x257u)
    {
      v18 = 13;
      if (a1 != 553) {
        v18 = 0;
      }
      if (a1 - 551 >= 2) {
        v19 = v18;
      }
      else {
        v19 = 12;
      }
      if (a1 - 500 >= 2) {
        v5 = v19;
      }
      else {
        v5 = 11;
      }
      v20 = 10;
      if (a1 != 400) {
        v20 = 0;
      }
      if (a1 - 300 >= 3) {
        v21 = v20;
      }
      else {
        v21 = 8;
      }
      if (a1 - 351 >= 5) {
        v7 = v21;
      }
      else {
        v7 = 9;
      }
      v8 = a1 <= 0x1F3u;
    }
    else
    {
      v3 = 17;
      if (a1 != 750) {
        v3 = 0;
      }
      if (a1 - 700 >= 3) {
        v4 = v3;
      }
      else {
        v4 = 16;
      }
      if (a1 - 800 >= 5) {
        v5 = v4;
      }
      else {
        v5 = 18;
      }
      v6 = 15;
      if (a1 - 650 >= 2) {
        v6 = 0;
      }
      if (a1 - 600 >= 5) {
        v7 = v6;
      }
      else {
        v7 = 14;
      }
      v8 = a1 <= 0x2BBu;
    }
    if (v8) {
      return v7;
    }
    else {
      return v5;
    }
  }
  else if (a1 <= 0x95u)
  {
    v9 = a1 - 50;
    v10 = a1 - 1;
    v11 = a1 - 100 >= 5;
    v12 = 3;
    if (v11) {
      v12 = 0;
    }
    if (v10 < 0x14) {
      v12 = 1;
    }
    if (v9 >= 0x16) {
      return v12;
    }
    else {
      return 2;
    }
  }
  else
  {
    switch(a1)
    {
      case 0x96u:
      case 0x97u:
      case 0x98u:
      case 0x99u:
      case 0x9Au:
      case 0x9Bu:
      case 0x9Cu:
      case 0x9Du:
      case 0x9Eu:
        result = 4;
        break;
      case 0xAAu:
      case 0xABu:
      case 0xACu:
      case 0xADu:
      case 0xAEu:
      case 0xAFu:
        result = 26;
        break;
      case 0xC9u:
      case 0xCAu:
      case 0xCBu:
      case 0xCCu:
      case 0xCDu:
      case 0xCEu:
      case 0xCFu:
      case 0xD0u:
      case 0xD1u:
      case 0xD2u:
      case 0xD3u:
      case 0xD4u:
      case 0xD5u:
      case 0xD6u:
      case 0xD7u:
      case 0xD8u:
      case 0xD9u:
      case 0xDAu:
      case 0xDBu:
      case 0xDCu:
      case 0xDDu:
      case 0xDEu:
      case 0xDFu:
      case 0xE0u:
      case 0xE1u:
      case 0xE2u:
      case 0xE3u:
      case 0xE4u:
      case 0xE5u:
      case 0xE6u:
      case 0xE7u:
      case 0xE8u:
        result = 5;
        break;
      case 0xFAu:
      case 0xFBu:
      case 0xFCu:
      case 0xFDu:
      case 0xFEu:
      case 0xFFu:
        result = 6;
        break;
      case 0x113u:
      case 0x114u:
      case 0x115u:
        result = 7;
        break;
      default:
        return result;
    }
  }
  return result;
}

uint64_t KVAdditionalFieldTypeToNumber(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend_numberWithInt_(NSNumber, a2, a1, a4, a5, a6);
}

uint64_t KVFieldTypeFromNumber(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v6 = objc_msgSend_unsignedShortValue(a1, a2, a3, a4, a5, a6);
  uint64_t v7 = v6;
  if (KVItemTypeFromFieldType(v6)) {
    return v7;
  }
  else {
    return 0;
  }
}

void sub_1BC3B7D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3B7DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3B7EB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1BC3B7F04(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    uint64_t v8 = objc_msgSend_formatOptions(v2, v3, v4, v5, v6, v7);
    objc_msgSend_setFormatOptions_(v2, v9, v8 | 0x800, v10, v11, v12);
    v17 = objc_msgSend_dateFromString_(v2, v13, (uint64_t)v1, v14, v15, v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void sub_1BC3B7F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3B816C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3B83B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1BC3B83C8(unsigned int *a1)
{
  id v2 = [NSString alloc];
  uint64_t v4 = objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v2, v3, (uint64_t)(a1 + 1), *a1, 4, 0);
  return v4;
}

void sub_1BC3B8834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1BC3B8878(uint64_t a1, unint64_t a2)
{
  if ((a2 & 3) != 0 && *(unsigned char *)(a1 + 40)) {
    return 0;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 5 || v2 - 4 < a2) {
    return 0;
  }
  uint64_t v4 = *(unsigned int *)(*(void *)a1 + a2);
  if ((int)v4 < 1) {
    return 0;
  }
  if (v2 - 1 >= v4 + a2) {
    return v4;
  }
  return 0;
}

BOOL sub_1BC3B88C8(uint64_t *a1, int *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = (unint64_t)a2 - *a1;
  if ((v3 & 3) != 0 && *((unsigned char *)a1 + 40)) {
    return 0;
  }
  unint64_t v4 = a1[1];
  BOOL v5 = v4 >= 5 && v4 - 4 >= v3;
  if (!v5) {
    return 0;
  }
  uint64_t v6 = *a2;
  unsigned int v7 = *((_DWORD *)a1 + 5);
  unsigned int v8 = *((_DWORD *)a1 + 4) + 1;
  *((_DWORD *)a1 + 4) = v8;
  unsigned int v9 = *((_DWORD *)a1 + 6) + 1;
  *((_DWORD *)a1 + 6) = v9;
  if (v8 > v7 || v9 > *((_DWORD *)a1 + 7)) {
    return 0;
  }
  unint64_t v10 = v3 - v6;
  if (v10)
  {
    uint64_t v11 = 0;
    if (*((unsigned char *)a1 + 40) || v4 - 2 < v10) {
      return v11;
    }
  }
  else if (v4 - 2 < v10)
  {
    return 0;
  }
  unint64_t v12 = *(unsigned __int16 *)(v2 + v10);
  if ((v12 & 1) != 0 && *((unsigned char *)a1 + 40)) {
    return 0;
  }
  BOOL v5 = v4 >= v12;
  unint64_t v14 = v4 - v12;
  return v14 != 0 && v5 && v14 >= v10;
}

BOOL sub_1BC3B8980(int *a1, void *a2, unsigned int a3)
{
  unint64_t v3 = (unsigned __int16 *)((char *)a1 - *a1);
  return *v3 <= a3
      || (uint64_t v4 = *(unsigned __int16 *)((char *)v3 + a3)) == 0
      || sub_1BC3B8878((uint64_t)a2, (unint64_t)a1 + v4 - *a2) != 0;
}

BOOL sub_1BC3B89D8(void *a1, unsigned int *a2)
{
  if (!a2) {
    return 1;
  }
  unint64_t v6 = 0;
  BOOL result = sub_1BC3B8A54((uint64_t)a1, a2, 1uLL, &v6);
  if (result)
  {
    unint64_t v4 = a1[1];
    return v4 >= 2 && v4 - 1 >= v6 && *(unsigned char *)(*a1 + v6) == 0;
  }
  return result;
}

BOOL sub_1BC3B8A54(uint64_t a1, unsigned int *a2, unint64_t a3, void *a4)
{
  unint64_t v4 = (unint64_t)a2 - *(void *)a1;
  if ((v4 & 3) != 0 && *(unsigned char *)(a1 + 40)) {
    return 0;
  }
  unint64_t v5 = *(void *)(a1 + 8);
  if (v5 < 5 || v5 - 4 < v4) {
    return 0;
  }
  unint64_t v7 = *a2;
  if (0x7FFFFFFF / a3 <= v7) {
    return 0;
  }
  unint64_t v8 = v7 * a3 + 4;
  if (a4)
  {
    *a4 = v8 + v4;
    unint64_t v5 = *(void *)(a1 + 8);
  }
  BOOL v9 = v5 > v8;
  unint64_t v10 = v5 - v8;
  return v9 && v10 >= v4;
}

void sub_1BC3B8D10(_Unwind_Exception *a1, uint64_t a2, void *a3, ...)
{
  va_start(va, a3);

  sub_1BC3B9370((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1BC3B8D60(uint64_t a1, const void *a2, unint64_t a3)
{
  sub_1BC3B8E08(a1);
  sub_1BC3B9628(a1, a3 + 1, 4uLL);
  sub_1BC3B9660((uint64_t *)a1, 1uLL);
  unint64_t v6 = (unsigned char *)(*(void *)(a1 + 48) - 1);
  *(void *)(a1 + 48) = v6;
  *unint64_t v6 = 0;
  if (a3)
  {
    sub_1BC3B9660((uint64_t *)a1, a3);
    unint64_t v7 = (void *)(*(void *)(a1 + 48) - a3);
    *(void *)(a1 + 48) = v7;
    memcpy(v7, a2, a3);
  }
  sub_1BC3B98A8(a1, a3);
  return (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40));
}

uint64_t sub_1BC3B8E08(uint64_t result)
{
  if (*(unsigned char *)(result + 70)) {
    __assert_rtn("NotNested", "flatbuffers.h", 1432, "!nested");
  }
  if (*(_DWORD *)(result + 64)) {
    __assert_rtn("NotNested", "flatbuffers.h", 1434, "!num_field_loc");
  }
  return result;
}

_DWORD *sub_1BC3B8E6C(_DWORD *result, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    unint64_t v4 = (unint64_t)result;
    int v5 = sub_1BC3B9838(result, a3);
    return (_DWORD *)sub_1BC3B9980(v4, a2, v5);
  }
  return result;
}

unint64_t sub_1BC3B8EBC(unint64_t result, uint64_t a2, int a3)
{
  __int16 v3 = a3;
  unint64_t v5 = result;
  if (a3 || *(unsigned char *)(result + 80))
  {
    sub_1BC3B98FC(result, 2uLL);
    sub_1BC3B9660((uint64_t *)v5, 2uLL);
    uint64_t v6 = *(void *)(v5 + 48);
    *(_WORD *)(v6 - 2) = v3;
    v6 -= 2;
    *(void *)(v5 + 48) = v6;
    uint64_t v7 = (*(_DWORD *)(v5 + 32) - v6 + *(_DWORD *)(v5 + 40));
    BOOL result = sub_1BC3B9660((uint64_t *)v5, 8uLL);
    **(void **)(v5 + 56) = v7 | (a2 << 32);
    *(void *)(v5 + 56) += 8;
    ++*(_DWORD *)(v5 + 64);
    unsigned int v8 = *(unsigned __int16 *)(v5 + 68);
    if (v8 <= a2) {
      LOWORD(v8) = a2;
    }
    *(_WORD *)(v5 + 68) = v8;
  }
  return result;
}

uint64_t sub_1BC3B8F6C(uint64_t a1, int a2)
{
  if (!*(unsigned char *)(a1 + 70)) {
    __assert_rtn("EndTable", "flatbuffers.h", 1450, "nested");
  }
  sub_1BC3B98FC(a1, 4uLL);
  sub_1BC3B9660((uint64_t *)a1, 4uLL);
  uint64_t v4 = *(void *)(a1 + 48);
  *(_DWORD *)(v4 - 4) = 0;
  v4 -= 4;
  *(void *)(a1 + 48) = v4;
  uint64_t v5 = *(void *)(a1 + 32) - v4 + *(void *)(a1 + 40);
  if ((unsigned __int16)(*(_WORD *)(a1 + 68) + 2) <= 4u) {
    unint64_t v6 = 4;
  }
  else {
    unint64_t v6 = (unsigned __int16)(*(_WORD *)(a1 + 68) + 2);
  }
  *(_WORD *)(a1 + 68) = v6;
  sub_1BC3B9660((uint64_t *)a1, v6);
  uint64_t v7 = (void *)(*(void *)(a1 + 48) - v6);
  *(void *)(a1 + 48) = v7;
  bzero(v7, v6);
  unsigned __int16 v8 = v5 - a2;
  if ((v5 - a2) >= 0x10000) {
    __assert_rtn("EndTable", "flatbuffers.h", 1465, "table_object_size < 0x10000");
  }
  BOOL v9 = *(unsigned __int16 **)(a1 + 48);
  if (!v9) {
    __assert_rtn("data", "flatbuffers.h", 1016, "cur_");
  }
  v9[1] = v8;
  unsigned __int16 *v9 = *(_WORD *)(a1 + 68);
  unint64_t v10 = *(void *)(a1 + 56);
  if (!v10) {
    __assert_rtn("scratch_end", "flatbuffers.h", 1026, "scratch_");
  }
  uint64_t v11 = *(unsigned int *)(a1 + 64);
  unint64_t v12 = v10 - 8 * v11;
  if (v11)
  {
    v13 = (int *)(v10 - 8 * v11);
    do
    {
      uint64_t v14 = *((unsigned __int16 *)v13 + 2);
      if (*(unsigned __int16 *)((char *)v9 + v14)) {
        __assert_rtn("EndTable", "flatbuffers.h", 1476, "!ReadScalar<voffset_t>(buf_.data() + field_location->id)");
      }
      int v15 = *v13;
      v13 += 2;
      *(unsigned __int16 *)((char *)v9 + v14) = v5 - v15;
    }
    while ((unint64_t)v13 < v10);
  }
  *(void *)(a1 + 56) = v12;
  *(_DWORD *)(a1 + 64) = 0;
  *(_WORD *)(a1 + 68) = 0;
  uint64_t v17 = *(void *)(a1 + 32);
  unint64_t v16 = *(void *)(a1 + 40);
  LODWORD(v18) = v17 - v9 + v16;
  if (*(unsigned char *)(a1 + 81))
  {
    if (!v16) {
      __assert_rtn("scratch_data", "flatbuffers.h", 1021, "buf_");
    }
    if (v16 < v12)
    {
      size_t v19 = *v9;
      uint64_t v20 = v16 + v17;
      v21 = *(unsigned int **)(a1 + 40);
      while (1)
      {
        uint64_t v18 = *v21;
        if (v19 == *(unsigned __int16 *)(v20 - v18) && !memcmp((const void *)(v20 - v18), v9, v19)) {
          break;
        }
        if ((unint64_t)++v21 >= v12)
        {
          LODWORD(v18) = v17 - v9 + v16;
          goto LABEL_21;
        }
      }
      BOOL v9 = (unsigned __int16 *)((char *)v9 + (v17 - v9 + v16 - v5));
      *(void *)(a1 + 48) = v9;
    }
  }
LABEL_21:
  if (v18 == v17 + v16 - v9)
  {
    sub_1BC3B9660((uint64_t *)a1, 4uLL);
    v22 = *(_DWORD **)(a1 + 56);
    _DWORD *v22 = v18;
    *(void *)(a1 + 56) = v22 + 1;
    uint64_t v17 = *(void *)(a1 + 32);
    unint64_t v16 = *(void *)(a1 + 40);
  }
  *(_DWORD *)(v16 + v17 - v5) = v18 - v5;
  *(unsigned char *)(a1 + 70) = 0;
  return v5;
}

uint64_t sub_1BC3B9208(uint64_t a1, unsigned int a2, const char *a3, int a4)
{
  BOOL v8 = a3 != 0;
  sub_1BC3B8E08(a1);
  *(void *)(a1 + 56) = *(void *)(a1 + 40);
  uint64_t v9 = 4;
  if (a4) {
    uint64_t v9 = 8;
  }
  sub_1BC3B9628(a1, v9 + 4 * v8, *(void *)(a1 + 72));
  if (a3)
  {
    if (strlen(a3) != 4) {
      __assert_rtn("Finish", "flatbuffers.h", 2154, "strlen(file_identifier) == kFileIdentifierLength");
    }
    sub_1BC3B9660((uint64_t *)a1, 4uLL);
    uint64_t v10 = *(void *)(a1 + 48);
    *(void *)(a1 + 48) = v10 - 4;
    *(_DWORD *)(v10 - 4) = *(_DWORD *)a3;
  }
  int v11 = sub_1BC3B9838((_DWORD *)a1, a2);
  uint64_t result = sub_1BC3B98A8(a1, v11);
  if (a4) {
    uint64_t result = sub_1BC3B98A8(a1, *(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40));
  }
  *(unsigned char *)(a1 + 71) = 1;
  return result;
}

uint64_t sub_1BC3B930C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 71)) {
    __assert_rtn("Finished", "flatbuffers.h", 1319, "finished");
  }
  uint64_t result = *(void *)(a1 + 48);
  if (!result) {
    __assert_rtn("data", "flatbuffers.h", 1016, "cur_");
  }
  return result;
}

void *sub_1BC3B9370(void *a1)
{
  uint64_t v2 = a1[11];
  if (v2)
  {
    sub_1BC3B947C(*(void **)(v2 + 8));
    MEMORY[0x1C186E6B0](v2, 0x1060C40C2B13FB5);
  }
  uint64_t v3 = a1[5];
  if (v3)
  {
    if (*a1) {
      (*(void (**)(void))(*(void *)*a1 + 24))(*a1);
    }
    else {
      MEMORY[0x1C186E690](v3, 0x1000C8077774924);
    }
  }
  a1[5] = 0;
  if (*((unsigned char *)a1 + 8) && *a1) {
    (*(void (**)(void))(*(void *)*a1 + 8))(*a1);
  }
  *a1 = 0;
  *((unsigned char *)a1 + 8) = 0;
  return a1;
}

void sub_1BC3B947C(void *a1)
{
  if (a1)
  {
    sub_1BC3B947C(*a1);
    sub_1BC3B947C(a1[1]);
    operator delete(a1);
  }
}

void sub_1BC3B94C8(void *a1)
{
}

char *sub_1BC3B94DC(uint64_t a1, char *a2, unint64_t a3, unint64_t a4, size_t a5, size_t a6)
{
  if (a4 <= a3) {
    __assert_rtn("reallocate_downward", "flatbuffers.h", 687, "new_size > old_size");
  }
  unint64_t v12 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(*(void *)a1 + 16))(a1, a4);
  memcpy(&v12[a4 - a5], &a2[a3 - a5], a5);
  memcpy(v12, a2, a6);
  (*(void (**)(uint64_t, char *, unint64_t))(*(void *)a1 + 24))(a1, a2, a3);
  return v12;
}

void sub_1BC3B95D8(uint64_t a1, uint64_t a2)
{
  if (a2) {
    JUMPOUT(0x1C186E690);
  }
}

void sub_1BC3B95F8()
{
}

void sub_1BC3B9610()
{
}

unint64_t sub_1BC3B9628(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (*(void *)(a1 + 72) < a3) {
    *(void *)(a1 + 72) = a3;
  }
  return sub_1BC3B9930((uint64_t *)a1, (a3 - 1) & (-a2 - (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40))));
}

unint64_t sub_1BC3B9660(uint64_t *a1, unint64_t a2)
{
  uint64_t v2 = (char *)a1[6];
  unint64_t v3 = a1[7];
  if ((unint64_t)v2 < v3 || (unint64_t v6 = (char *)a1[5], v7 = v3 - v6, v3 < (unint64_t)v6)) {
    __assert_rtn("ensure_space", "flatbuffers.h", 988, "cur_ >= scratch_ && scratch_ >= buf_");
  }
  unint64_t v8 = a1[4];
  if ((unint64_t)&v2[-v3] < a2)
  {
    unsigned int v9 = v8 - v2 + v6;
    if (v8) {
      unint64_t v10 = v8 >> 1;
    }
    else {
      unint64_t v10 = a1[2];
    }
    if (v10 <= a2) {
      unint64_t v10 = a2;
    }
    unint64_t v11 = (a1[3] + v8 + v10 - 1) & -a1[3];
    a1[4] = v11;
    uint64_t v12 = *a1;
    if (v6)
    {
      if (v12)
      {
        v13 = (char *)(*(uint64_t (**)(uint64_t))(*(void *)v12 + 32))(v12);
      }
      else
      {
        int v15 = &unk_1F15F1880;
        v13 = sub_1BC3B94DC((uint64_t)&v15, v6, v8, v11, v9, (v3 - v6));
      }
    }
    else
    {
      if (!v12)
      {
        int v15 = &unk_1F15F1880;
        operator new[]();
      }
      v13 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v12 + 16))(v12, v11);
    }
    LODWORD(v6) = v13;
    unint64_t v8 = a1[4];
    uint64_t v2 = &v13[v8 - v9];
    a1[5] = (uint64_t)v13;
    a1[6] = (uint64_t)v2;
    a1[7] = (uint64_t)&v13[v7];
  }
  if ((v8 - v2 + v6) >= 0x7FFFFFFF) {
    __assert_rtn("ensure_space", "flatbuffers.h", 992, "size() < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  return a2;
}

uint64_t sub_1BC3B9838(_DWORD *a1, unsigned int a2)
{
  sub_1BC3B98FC((uint64_t)a1, 4uLL);
  if (!a2 || (v4 = a1[8] - a1[12] + a1[10], v5 = v4 >= a2, unsigned int v6 = v4 - a2, !v5)) {
    __assert_rtn("ReferTo", "flatbuffers.h", 1419, "off && off <= GetSize()");
  }
  return v6 + 4;
}

uint64_t sub_1BC3B98A8(uint64_t a1, int a2)
{
  sub_1BC3B98FC(a1, 4uLL);
  sub_1BC3B9660((uint64_t *)a1, 4uLL);
  uint64_t v4 = *(void *)(a1 + 48);
  *(_DWORD *)(v4 - 4) = a2;
  v4 -= 4;
  *(void *)(a1 + 48) = v4;
  return (*(_DWORD *)(a1 + 32) - v4 + *(_DWORD *)(a1 + 40));
}

unint64_t sub_1BC3B98FC(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 72) < a2) {
    *(void *)(a1 + 72) = a2;
  }
  return sub_1BC3B9930((uint64_t *)a1, (a2 - 1) & -(uint64_t)(*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40)));
}

unint64_t sub_1BC3B9930(uint64_t *a1, unint64_t a2)
{
  unint64_t result = sub_1BC3B9660(a1, a2);
  a1[6] -= a2;
  if (a2)
  {
    uint64_t v5 = 0;
    do
      *(unsigned char *)(a1[6] + v5++) = 0;
    while (a2 != v5);
  }
  return result;
}

unint64_t sub_1BC3B9980(unint64_t result, uint64_t a2, int a3)
{
  unint64_t v4 = result;
  if (a3 || *(unsigned char *)(result + 80))
  {
    unsigned int v5 = sub_1BC3B98A8(result, a3);
    unint64_t result = sub_1BC3B9660((uint64_t *)v4, 8uLL);
    **(void **)(v4 + 56) = v5 | (unint64_t)(a2 << 32);
    *(void *)(v4 + 56) += 8;
    ++*(_DWORD *)(v4 + 64);
    unsigned int v6 = *(unsigned __int16 *)(v4 + 68);
    if (v6 <= a2) {
      LOWORD(v6) = a2;
    }
    *(_WORD *)(v4 + 68) = v6;
  }
  return result;
}

void sub_1BC3B9A58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3B9B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3B9C04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3B9C88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3B9E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BC3B9EAC()
{
}

void sub_1BC3BA164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3BA2A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3BA334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3BAA1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3BABE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3BAF70(_Unwind_Exception *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, ...)
{
  va_start(va, a7);

  sub_1BC3B9370((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1BC3BB0AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3BB6E8(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v6 = off_1E62ACD28;
LABEL_5:
    id v7 = objc_alloc(*v6);
    uint64_t v12 = objc_msgSend_initWithDonation_(v7, v8, (uint64_t)v15, v9, v10, v11);
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v6 = off_1E62ACD30;
    goto LABEL_5;
  }
  uint64_t v12 = 0;
LABEL_7:
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = sub_1BC3DC60C(v5);
  (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v12, v14);
}

id sub_1BC3BBDCC(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v7 = objc_msgSend_copy(a1, a2, a3, a4, a5, a6);
  if (objc_msgSend_length(v7, v8, v9, v10, v11, v12))
  {
    id v17 = v7;
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    size_t v19 = objc_msgSend_stringWithFormat_(NSString, v13, @"Invalid userId: \"%@\"", v14, v15, v16, v7, *MEMORY[0x1E4F28568]);
    v29[0] = v19;
    v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)v29, (uint64_t)&v28, 1, v21);
    v25 = objc_msgSend_errorWithDomain_code_userInfo_(v18, v23, @"com.apple.koa.donate", 5, (uint64_t)v22, v24);
    v26 = v25;
    if (a2 && v25) {
      *(void *)a2 = v25;
    }

    id v17 = 0;
  }

  return v17;
}

uint64_t sub_1BC3BBF00(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned __int16 v7 = a1;
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = objc_msgSend_cascadeItemTypeFromItemType_(KVItemConverter, a2, a1, a4, a5, a6);
  if (v11 == (unsigned __int16)*MEMORY[0x1E4F57F78])
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    uint64_t v13 = NSString;
    if (v7 - 1 >= 0x1A) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = v7;
    }
    uint64_t v15 = objc_msgSend_stringWithCString_encoding_(NSString, v8, (uint64_t)off_1E62AD038[v14], 4, v9, v10);
    uint64_t v20 = objc_msgSend_stringWithFormat_(v13, v16, @"KVItemType: %@ not supported by Cascade", v17, v18, v19, v15, v29);
    v30[0] = v20;
    v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)v30, (uint64_t)&v29, 1, v22);
    v26 = objc_msgSend_errorWithDomain_code_userInfo_(v12, v24, @"com.apple.koa.donate", 2, (uint64_t)v23, v25);
    v27 = v26;
    if (a2 && v26) {
      *(void *)a2 = v26;
    }
  }
  return v11;
}

id sub_1BC3BC070(void *a1, void *a2)
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = (id)objc_msgSend_copy(v3, v4, v5, v6, v7, v8);
    if (objc_msgSend_length(v3, v10, v11, v12, v13, v14))
    {
      id v9 = v9;
      uint64_t v19 = v9;
      goto LABEL_10;
    }
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    v27 = objc_msgSend_stringWithFormat_(NSString, v15, @"Invalid originAppId: \"%@\"", v16, v17, v18, v9, *MEMORY[0x1E4F28568]);
    v39 = v27;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v30, (uint64_t)&v39, (uint64_t)&v38, 1, v31);
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    uint64_t v21 = NSString;
    uint64_t v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_stringWithFormat_(v21, v23, @"OriginAppId must be a nonempty NSString. Received: %@", v24, v25, v26, v9);
    v41[0] = v27;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)v41, (uint64_t)&v40, 1, v29);
  v32 = };
  v35 = objc_msgSend_errorWithDomain_code_userInfo_(v20, v33, @"com.apple.koa.donate", 3, (uint64_t)v32, v34);
  v36 = v35;
  if (a2 && v35) {
    *a2 = v35;
  }

  uint64_t v19 = 0;
LABEL_10:

  return v19;
}

void sub_1BC3BC5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1BC3BC5CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1BC3BC5DC(uint64_t a1)
{
}

uint64_t sub_1BC3BC5E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = (void *)MEMORY[0x1C186E860]();
  uint64_t v10 = objc_msgSend_datasetInfo(v3, v5, v6, v7, v8, v9);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v17 = objc_msgSend_originAppId(v10, v12, v13, v14, v15, v16);

  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F57FD0]);
    uint64_t v19 = *MEMORY[0x1E4F57F68];
    uint64_t v25 = objc_msgSend_originAppId(v10, v20, v21, v22, v23, v24);
    uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v26 + 40);
    uint64_t v29 = objc_msgSend_initWithKey_value_error_(v18, v27, v19, (uint64_t)v25, (uint64_t)&obj, v28);
    objc_storeStrong((id *)(v26 + 40), obj);

    if (!v29)
    {
      uint64_t v39 = 0;
      goto LABEL_6;
    }
    objc_msgSend_addObject_(v11, v30, (uint64_t)v29, v31, v32, v33);
  }
  uint64_t v34 = *(void *)(*(void *)(a1 + 48) + 8);
  id v45 = *(id *)(v34 + 40);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = sub_1BC3BC7B0;
  v42[3] = &unk_1E62ACF18;
  id v43 = v11;
  long long v41 = *(_OWORD *)(a1 + 32);
  id v35 = (id)v41;
  long long v44 = v41;
  uint64_t v39 = objc_msgSend_enumerateCascadeItemsWithError_usingBlock_(v3, v36, (uint64_t)&v45, (uint64_t)v42, v37, v38);
  objc_storeStrong((id *)(v34 + 40), v45);

LABEL_6:

  return v39;
}

uint64_t sub_1BC3BC7B0(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F57FB0];
  id v6 = a3;
  id v7 = [v5 alloc];
  uint64_t v8 = a1[4];
  uint64_t v9 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v9 + 40);
  id v11 = objc_msgSend_initWithItemType_descriptors_localInstances_error_(v7, v10, a2, v8, (uint64_t)v6, (uint64_t)&obj);

  objc_storeStrong((id *)(v9 + 40), obj);
  if (v11) {
    uint64_t v12 = (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  else {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t sub_1BC3BC938(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return 1;
}

uint64_t sub_1BC3BCA34(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = objc_msgSend_data(a2, (const char *)a2, a3, a4, a5, a6);
  objc_msgSend_addObject_(v6, v8, (uint64_t)v7, v9, v10, v11);

  return 1;
}

void sub_1BC3BCD10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

BOOL sub_1BC3BCD44(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = objc_msgSend_toCascadeItem_(a2, (const char *)a2, (uint64_t)&obj, a4, a5, a6);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    uint64_t v14 = objc_msgSend_content(v8, v9, v10, v11, v12, v13);
    uint64_t v15 = objc_opt_class();
    uint64_t v21 = objc_msgSend_itemType(v15, v16, v17, v18, v19, v20);

    uint64_t v22 = *(void **)(a1 + 32);
    v27 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v23, v21, v24, v25, v26);
    objc_msgSend_objectForKey_(v22, v28, (uint64_t)v27, v29, v30, v31);
    id v32 = (id)objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
      id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v37 = *(void **)(a1 + 32);
      v42 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v38, v21, v39, v40, v41);
      objc_msgSend_setObject_forKey_(v37, v43, (uint64_t)v32, (uint64_t)v42, v44, v45);
    }
    objc_msgSend_addObject_(v32, v33, (uint64_t)v8, v34, v35, v36);
  }
  return v8 != 0;
}

id KVUserIdHash(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1)
  {
    id v6 = objc_msgSend_stringByAppendingString_(@"UserEx", a2, a1, a4, a5, a6);
    uint64_t v12 = KVHash64String(v6, v7, v8, v9, v10, v11);
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

id KVUserIdHashToString(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1)
  {
    uint64_t v7 = NSString;
    uint64_t v8 = objc_msgSend_unsignedLongLongValue(a1, a2, a3, a4, a5, a6);
    a1 = objc_msgSend_stringWithFormat_(v7, v9, @"%llx", v10, v11, v12, v8);
    uint64_t v6 = vars8;
  }
  return a1;
}

id KVUserIdHashFromString(void *a1)
{
  id v1 = a1;
  uint64_t v11 = KVScanHexString((uint64_t)v1, v2, v3, v4, v5, v6);
  if (v11 || objc_msgSend_isEqual_(v1, v7, @"0", v8, v9, v10))
  {
    uint64_t v12 = objc_msgSend_numberWithLongLong_(NSNumber, v7, v11, v8, v9, v10);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

__CFString *KVUserDescription(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  uint64_t v10 = (void *)v4;
  if (!(v3 | v4))
  {
    uint64_t v19 = @"Default";
    goto LABEL_9;
  }
  if (!v3)
  {
    uint64_t v11 = &stru_1F15F1CC8;
    if (v4) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v18 = &stru_1F15F1CC8;
    goto LABEL_8;
  }
  objc_msgSend_stringWithFormat_(NSString, v5, @"\"%@\"", v7, v8, v9, v3);
  uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v10) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v12 = NSString;
  uint64_t v13 = KVUserIdHashToString(v10, v5, v6, v7, v8, v9);
  objc_msgSend_stringWithFormat_(v12, v14, @"<%@>", v15, v16, v17, v13);
  uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  objc_msgSend_stringWithFormat_(NSString, v5, @"%@:%@%@", v7, v8, v9, @"UserEx", v11, v18);
  uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v19;
}

id KVUserIdHashFromDataSiteURL(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v7 = objc_msgSend_lastPathComponent(v1, v2, v3, v4, v5, v6);
  if ((objc_msgSend_isEqual_(v7, v8, @"Default", v9, v10, v11) & 1) == 0)
  {
    uint64_t v12 = KVUserIdHashFromString(v7);
    if (v12) {
      goto LABEL_6;
    }
    uint64_t v13 = qword_1EB5EE458;
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      uint64_t v16 = "KVUserIdHashFromDataSiteURL";
      __int16 v17 = 2112;
      id v18 = v1;
      _os_log_error_impl(&dword_1BC3B6000, v13, OS_LOG_TYPE_ERROR, "%s Unrecognized dataSiteURL: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  uint64_t v12 = 0;
LABEL_6:

  return v12;
}

uint64_t KVProtectionClassForDataSiteURL(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = objc_msgSend_lastPathComponent(a1, a2, a3, a4, a5, a6);
  if (objc_msgSend_isEqual_(v6, v7, @"Default", v8, v9, v10)) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 6;
  }

  return v11;
}

id KVDataSiteURL(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x1E4F1CB10], v3, @"UserEx", 1, a1, v4);
    uint64_t v12 = KVUserIdHashToString(v5, v7, v8, v9, v10, v11);
    int v15 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x1E4F1CB10], v13, (uint64_t)v12, 1, (uint64_t)v6, v14);
  }
  else
  {
    int v15 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x1E4F1CB10], v3, @"Default", 1, a1, v4);
  }

  return v15;
}

id KVAllDataSites(void *a1)
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v82 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v2, v3, v4, v5, v6);
  unsigned __int8 v88 = 0;
  uint64_t v10 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x1E4F1CB10], v8, @"Default", 1, (uint64_t)v1, v9);
  uint64_t v16 = objc_msgSend_path(v10, v11, v12, v13, v14, v15);
  int isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v7, v17, (uint64_t)v16, (uint64_t)&v88, v18, v19);
  int v21 = v88;

  if (isDirectory) {
    BOOL v26 = v21 == 0;
  }
  else {
    BOOL v26 = 1;
  }
  if (!v26) {
    objc_msgSend_addObject_(v82, v22, (uint64_t)v10, v23, v24, v25);
  }
  v27 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x1E4F1CB10], v22, @"UserEx", 1, (uint64_t)v1, v25);
  uint64_t v33 = objc_msgSend_path(v27, v28, v29, v30, v31, v32);
  int v37 = objc_msgSend_fileExistsAtPath_isDirectory_(v7, v34, (uint64_t)v33, (uint64_t)&v88, v35, v36);
  int v38 = v88;

  if (!v37 || !v38) {
    goto LABEL_22;
  }
  uint64_t v44 = objc_msgSend_path(v27, v39, v40, v41, v42, v43);
  id v87 = 0;
  v48 = objc_msgSend_contentsOfDirectoryAtPath_error_(v7, v45, (uint64_t)v44, (uint64_t)&v87, v46, v47);
  id v49 = v87;

  if (v48)
  {
    v79 = v49;
    v80 = v10;
    id v81 = v1;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v50 = v48;
    uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v83, (uint64_t)v93, 16, v52);
    if (v53)
    {
      uint64_t v56 = v53;
      uint64_t v57 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v84 != v57) {
            objc_enumerationMutation(v50);
          }
          v59 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x1E4F1CB10], v54, *(void *)(*((void *)&v83 + 1) + 8 * i), 1, (uint64_t)v27, v55, v79);
          v65 = objc_msgSend_path(v59, v60, v61, v62, v63, v64);
          int v69 = objc_msgSend_fileExistsAtPath_isDirectory_(v7, v66, (uint64_t)v65, (uint64_t)&v88, v67, v68);
          int v70 = v88;

          if (v69) {
            BOOL v75 = v70 == 0;
          }
          else {
            BOOL v75 = 1;
          }
          if (!v75) {
            objc_msgSend_addObject_(v82, v71, (uint64_t)v59, v72, v73, v74);
          }
        }
        uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v54, (uint64_t)&v83, (uint64_t)v93, 16, v55);
      }
      while (v56);
    }

    uint64_t v10 = v80;
    id v1 = v81;
LABEL_22:
    v76 = qword_1EB5EE458;
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v90 = "_detectDataSites";
      __int16 v91 = 2112;
      id v92 = v82;
      _os_log_debug_impl(&dword_1BC3B6000, v76, OS_LOG_TYPE_DEBUG, "%s Managed data sites: %@", buf, 0x16u);
    }
    goto LABEL_24;
  }
  v78 = qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v93 = 136315394;
    v94 = "_detectDataSites";
    __int16 v95 = 2112;
    id v96 = v49;
    _os_log_error_impl(&dword_1BC3B6000, v78, OS_LOG_TYPE_ERROR, "%s Failed to resolve UserEx data site directories: %@", v93, 0x16u);
  }

LABEL_24:
  return v82;
}

id KVGetOrCreateDirectoryPath(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1)
  {
    objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E4F1CB10], a2, a1, 1, a5, a6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = KVGetOrCreateDirectoryURL(v7, a2);
  }
  else
  {
    uint64_t v9 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], a2, *MEMORY[0x1E4F281F8], -1000, 0, a6);
    id v7 = v9;
    uint64_t v8 = 0;
    if (a2 && v9)
    {
      id v7 = v9;
      uint64_t v8 = 0;
      *(void *)a2 = v7;
    }
  }

  return v8;
}

id KVGetOrCreateDirectoryURL(void *a1, void *a2)
{
  id v8 = a1;
  if (v8)
  {
    uint64_t v9 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v3, v4, v5, v6, v7);
    int DirectoryAtURL_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v9, v10, (uint64_t)v8, 1, 0, (uint64_t)a2);

    id v12 = 0;
    if (DirectoryAtURL_withIntermediateDirectories_attributes_error) {
      id v12 = v8;
    }
  }
  else
  {
    uint64_t v13 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v3, *MEMORY[0x1E4F281F8], -1000, 0, v7);
    uint64_t v14 = v13;
    if (a2 && v13) {
      *a2 = v13;
    }

    id v12 = 0;
  }

  return v12;
}

uint64_t KVRemoveItemIfExistsAtPath(void *a1, void *a2)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (objc_msgSend_length(v3, v4, v5, v6, v7, v8))
  {
    uint64_t v13 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v9, (uint64_t)v3, v10, v11, v12);

    uint64_t v14 = KVRemoveItemIfExistsAtURL(v13, a2);
    return v14;
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F281F8];
    uint64_t v18 = objc_msgSend_stringWithFormat_(NSString, v9, @"Invalid path: \"%@\"", v10, v11, v12, v3, *MEMORY[0x1E4F28568]);

    v27[0] = v18;
    int v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v27, (uint64_t)&v26, 1, v20);
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(v16, v22, v17, -1000, (uint64_t)v21, v23);
    uint64_t v25 = v24;
    if (a2)
    {
      if (v24) {
        *a2 = v24;
      }
    }

    return 0;
  }
}

uint64_t KVRemoveItemIfExistsAtURL(void *a1, void *a2)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = a1;
  if (v8)
  {
    uint64_t v9 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v3, v4, v5, v6, v7);
    id v33 = 0;
    char v13 = objc_msgSend_removeItemAtURL_error_(v9, v10, (uint64_t)v8, (uint64_t)&v33, v11, v12);
    id v14 = v33;
    id v20 = v14;
    if (v13)
    {

LABEL_9:
      uint64_t v30 = 1;
      goto LABEL_10;
    }
    uint64_t v31 = objc_msgSend_code(v14, v15, v16, v17, v18, v19);

    if (v31 == 4) {
      goto LABEL_9;
    }
    uint64_t v30 = 0;
    if (a2 && v20)
    {
      id v20 = v20;
      uint64_t v30 = 0;
      *a2 = v20;
    }
  }
  else
  {
    int v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F281F8];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    objc_msgSend_stringWithFormat_(NSString, v3, @"Invalid item URL: %@", v5, v6, v7, 0);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    v35[0] = v20;
    uint64_t v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v23, (uint64_t)v35, (uint64_t)&v34, 1, v24);
    uint64_t v28 = objc_msgSend_errorWithDomain_code_userInfo_(v21, v26, v22, -1000, (uint64_t)v25, v27);
    uint64_t v29 = v28;
    if (a2 && v28) {
      *a2 = v28;
    }

    uint64_t v30 = 0;
  }
LABEL_10:

  return v30;
}

uint64_t KVWritePropertyList(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v9 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], v8, a1, 200, 0, a4);
  if (objc_msgSend_length(v9, v10, v11, v12, v13, v14))
  {
    objc_msgSend_path(v7, v15, v16, v17, v18, v19);
    id v20 = objc_claimAutoreleasedReturnValue();
    uint64_t v26 = (const char *)objc_msgSend_UTF8String(v20, v21, v22, v23, v24, v25);
    uint64_t v27 = open_dprotected_np(v26, 1538, a3, 0, 384);

    id v28 = objc_alloc(MEMORY[0x1E4F28CB0]);
    uint64_t v32 = objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v28, v29, v27, 1, v30, v31);
    uint64_t v41 = objc_msgSend_writeData_error_(v32, v33, (uint64_t)v9, a4, v34, v35);
    if ((v41 & 1) == 0)
    {
      uint64_t v42 = objc_msgSend_URLByDeletingLastPathComponent(v7, v36, v37, v38, v39, v40);
      v48 = objc_msgSend_path(v42, v43, v44, v45, v46, v47);

      unsigned __int8 v61 = 0;
      v54 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v49, v50, v51, v52, v53);
      char isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v54, v55, (uint64_t)v48, (uint64_t)&v61, v56, v57);

      if ((isDirectory & 1) == 0)
      {
        v59 = qword_1EB5EE458;
        if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v63 = "KVWritePropertyList";
          __int16 v64 = 2112;
          v65 = v48;
          __int16 v66 = 1024;
          int v67 = v61;
          _os_log_error_impl(&dword_1BC3B6000, v59, OS_LOG_TYPE_ERROR, "%s Parent directory: %@ does not exist (isDirectory: %i)", buf, 0x1Cu);
        }
      }
    }
  }
  else
  {
    uint64_t v41 = 0;
  }

  return v41;
}

id KVReadPropertyList(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x1E4F1C9B8], a2, a1, 0, a3, a6);
  if (v9)
  {
    uint64_t v10 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], v8, (uint64_t)v9, (uint64_t)a2, 0, a3);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

BOOL KVInitializeModularFilesystemLayout()
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v0 = sub_1BC3BE110();
  id v53 = 0;
  id v1 = KVGetOrCreateDirectoryURL(v0, &v53);
  id v2 = v53;

  if (v1)
  {
    id v3 = sub_1BC3BE178();
    uint64_t v9 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v4, v5, v6, v7, v8);
    uint64_t v15 = objc_msgSend_path(v3, v10, v11, v12, v13, v14);
    id v52 = v2;
    uint64_t v19 = objc_msgSend_contentsOfDirectoryAtPath_error_(v9, v16, (uint64_t)v15, (uint64_t)&v52, v17, v18);
    id v20 = v52;

    if (v19)
    {
      if ((unint64_t)objc_msgSend_count(v19, v21, v22, v23, v24, v25) >= 2)
      {
        uint64_t v45 = v19;
        uint64_t v46 = v1;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v26 = v19;
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v48, (uint64_t)v60, 16, v28);
        if (v29)
        {
          uint64_t v34 = v29;
          uint64_t v35 = *(void *)v49;
          do
          {
            uint64_t v36 = 0;
            uint64_t v37 = v20;
            do
            {
              if (*(void *)v49 != v35) {
                objc_enumerationMutation(v26);
              }
              uint64_t v38 = *(void **)(*((void *)&v48 + 1) + 8 * v36);
              if (objc_msgSend_isEqual_(v38, v30, @"Modules", v31, v32, v33, v45, v46))
              {
                id v20 = v37;
              }
              else
              {
                uint64_t v39 = objc_msgSend_fileURLWithPath_relativeToURL_(MEMORY[0x1E4F1CB10], v30, (uint64_t)v38, (uint64_t)v3, v32, v33);
                id v47 = v37;
                char v40 = KVRemoveItemIfExistsAtURL(v39, &v47);
                id v20 = v47;

                if ((v40 & 1) == 0)
                {
                  uint64_t v41 = qword_1EB5EE458;
                  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v55 = "KVInitializeModularFilesystemLayout";
                    __int16 v56 = 2112;
                    id v57 = v39;
                    __int16 v58 = 2112;
                    id v59 = v20;
                    _os_log_error_impl(&dword_1BC3B6000, v41, OS_LOG_TYPE_ERROR, "%s Failed to remove file: %@ error: %@", buf, 0x20u);
                  }
                }

                uint64_t v37 = v20;
              }
              ++v36;
            }
            while (v34 != v36);
            uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v30, (uint64_t)&v48, (uint64_t)v60, 16, v33);
          }
          while (v34);
        }

        uint64_t v19 = v45;
        id v1 = v46;
      }
    }
    else
    {
      uint64_t v43 = qword_1EB5EE458;
      if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v55 = "KVInitializeModularFilesystemLayout";
        __int16 v56 = 2112;
        id v57 = v20;
        _os_log_error_impl(&dword_1BC3B6000, v43, OS_LOG_TYPE_ERROR, "%s Failed to read root directory contents: %@", buf, 0x16u);
      }
    }

    id v2 = v20;
  }
  else
  {
    uint64_t v42 = qword_1EB5EE458;
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v55 = "KVInitializeModularFilesystemLayout";
      __int16 v56 = 2112;
      id v57 = v2;
      _os_log_error_impl(&dword_1BC3B6000, v42, OS_LOG_TYPE_ERROR, "%s Modular Filesystem initialization failed: %@", buf, 0x16u);
    }
  }

  return v1 != 0;
}

id sub_1BC3BE110()
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  id v1 = sub_1BC3BE178();
  uint64_t v4 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(v0, v2, @"Modules", 1, (uint64_t)v1, v3);

  return v4;
}

id sub_1BC3BE178()
{
  v0 = (void *)CPSharedResourcesDirectory();
  uint64_t v5 = objc_msgSend_stringByAppendingPathComponent_(v0, v1, @"Library/Assistant/SiriVocabulary", v2, v3, v4);
  uint64_t v9 = objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E4F1CB10], v6, (uint64_t)v5, 1, v7, v8);

  return v9;
}

id KVSetsRootDirectoryURL()
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  id v1 = sub_1BC3BE110();
  uint64_t v4 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(v0, v2, @"Sets", 1, (uint64_t)v1, v3);

  return v4;
}

id KVSnapshotRootDirectoryURL()
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  id v1 = sub_1BC3BE110();
  uint64_t v4 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(v0, v2, @"Snapshot", 1, (uint64_t)v1, v3);

  return v4;
}

id KVTaskManagerRootDirectoryURL()
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  id v1 = sub_1BC3BE110();
  uint64_t v4 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(v0, v2, @"Task", 1, (uint64_t)v1, v3);

  return v4;
}

void sub_1BC3BE414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3BE794(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17)
{
  if (a2 == 2)
  {
    uint64_t v25 = __cxa_begin_catch(a1);
    id v26 = (void *)MEMORY[0x1E4F28C58];
    a16 = *MEMORY[0x1E4F28228];
    uint64_t v27 = NSString;
    uint64_t v33 = KVItemTypeDescription(v17[16], v28, v29, v30, v31, v32);
    uint64_t v34 = NSString;
    uint64_t v35 = (*(uint64_t (**)(void *))(*(void *)v25 + 16))(v25);
    uint64_t v39 = objc_msgSend_stringWithCString_encoding_(v34, v36, v35, 4, v37, v38);
    uint64_t v44 = objc_msgSend_stringWithFormat_(v27, v40, @"Caught exception while encoding item with itemType: %@ itemId: %@ \nCaught %@", v41, v42, v43);
    a17 = v44;
    id v47 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v45, (uint64_t)&a17, (uint64_t)&a16, 1, v46);
    long long v50 = objc_msgSend_errorWithDomain_code_userInfo_(v26, v48, @"com.apple.koa.item.builder", 5, (uint64_t)v47, v49);
    long long v51 = v50;
    if (v18)
    {
      if (v50) {
        *uint64_t v18 = v50;
      }
    }

    objc_msgSend__reset(v17, v52, v53, v54, v55, v56);
    __cxa_end_catch();
  }
  else
  {
    if (a2 != 1) {
      _Unwind_Resume(a1);
    }
    id v57 = objc_begin_catch(a1);
    __int16 v58 = (void *)MEMORY[0x1E4F28C58];
    a14 = *MEMORY[0x1E4F28228];
    id v59 = NSString;
    v65 = KVItemTypeDescription(v17[16], v60, v61, v62, v63, v64);
    int v70 = objc_msgSend_stringWithFormat_(v59, v66, @"Caught Objc exception while encoding item with itemType: %@ itemId: %@ \nCaught %@", v67, v68, v69);
    a15 = v70;
    uint64_t v73 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v71, (uint64_t)&a15, (uint64_t)&a14, 1, v72);
    v76 = objc_msgSend_errorWithDomain_code_userInfo_(v58, v74, @"com.apple.koa.item.builder", 5, (uint64_t)v73, v75);
    v77 = v76;
    if (v18 && v76) {
      *uint64_t v18 = v76;
    }

    objc_msgSend__reset(v17, v78, v79, v80, v81, v82);
    objc_end_catch();
  }
  JUMPOUT(0x1BC3BE574);
}

unint64_t sub_1BC3BEAD0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  sub_1BC3B8E08(a1);
  *(unsigned char *)(a1 + 70) = 1;
  uint64_t v6 = a3 * a2;
  sub_1BC3B9628(a1, v6, 4uLL);
  return sub_1BC3B9628(a1, v6, a3);
}

uint64_t sub_1BC3BEB3C(uint64_t a1, int a2)
{
  if (!*(unsigned char *)(a1 + 70)) {
    __assert_rtn("EndVector", "flatbuffers.h", 1672, "nested");
  }
  *(unsigned char *)(a1 + 70) = 0;
  return sub_1BC3B98A8(a1, a2);
}

void sub_1BC3BF260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3BF378()
{
}

void *sub_1BC3BF390(unint64_t a1)
{
  if (a1 >> 62) {
    sub_1BC3BF3C8();
  }
  return operator new(4 * a1);
}

void sub_1BC3BF3C8()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  id v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void sub_1BC3BF3FC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1BC3BF458(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E62ACE88, MEMORY[0x1E4FBA1C8]);
}

void sub_1BC3BF444(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1BC3BF458(std::logic_error *a1, const char *a2)
{
  unint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void sub_1BC3BF624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3BF828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3BFAC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C0094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1BC3C0384(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t sub_1BC3C0484(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t sub_1BC3C0580(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

void sub_1BC3C0714(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = (void *)qword_1EB5EE458;
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
    {
      int v21 = v5;
      uint64_t v27 = objc_msgSend_clientId(WeakRetained, v22, v23, v24, v25, v26);
      int v28 = 136315650;
      uint64_t v29 = "-[KVXPCClient _errorHandlerWithCompletion:]_block_invoke";
      __int16 v30 = 2112;
      id v31 = v3;
      __int16 v32 = 2112;
      uint64_t v33 = v27;
      _os_log_error_impl(&dword_1BC3B6000, v21, OS_LOG_TYPE_ERROR, "%s XPC request hit error (%@) for client %@", (uint8_t *)&v28, 0x20u);
    }
    uint64_t v11 = objc_msgSend_interruptionCode(WeakRetained, v6, v7, v8, v9, v10);
    objc_msgSend_setFailureCode_(WeakRetained, v12, v11, v13, v14, v15);
    objc_msgSend_setConnection_(WeakRetained, v16, 0, v17, v18, v19);
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v20 = *(void *)(a1 + 32);
  if (v20) {
    (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, v11);
  }
}

void sub_1BC3C0924(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = (void *)qword_1EB5EE458;
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_INFO))
    {
      int v8 = *(unsigned __int16 *)(a1 + 40);
      uint64_t v9 = v3;
      uint64_t v15 = objc_msgSend_clientId(WeakRetained, v10, v11, v12, v13, v14);
      int v20 = 136315650;
      int v21 = "-[KVXPCClient _failureHandlerWithResponse:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = v8;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      _os_log_impl(&dword_1BC3B6000, v9, OS_LOG_TYPE_INFO, "%s XPC connection terminated (%u) for client %@", (uint8_t *)&v20, 0x1Cu);
    }
    objc_msgSend_setFailureCode_(WeakRetained, v4, *(unsigned __int16 *)(a1 + 40), v5, v6, v7);
    objc_msgSend_setConnection_(WeakRetained, v16, 0, v17, v18, v19);
  }
}

void sub_1BC3C0FB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C1238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C131C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C13C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C1474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C1C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C2048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);

  sub_1BC3B9370((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1BC3C21A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C2290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C2330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C2398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C2464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C2540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C2618(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BC3C26C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C2758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C27E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C2864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C2900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C29AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1BC3C2E48(unsigned int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 >= 4)
  {
    uint64_t v6 = objc_msgSend_stringWithFormat_(NSString, a2, @"%u", a4, a5, a6, a1);
  }
  else
  {
    uint64_t v6 = (void *)*((void *)&off_1E62AD000 + a1);
  }
  return v6;
}

id sub_1BC3C2EB0(void *a1)
{
  id v1 = a1;
  int v17 = objc_msgSend_length(v1, v2, v3, v4, v5, v6);
  id v7 = objc_alloc(MEMORY[0x1E4F1CA58]);
  uint64_t v11 = objc_msgSend_initWithBytes_length_(v7, v8, (uint64_t)&v17, 4, v9, v10);
  objc_msgSend_appendData_(v11, v12, (uint64_t)v1, v13, v14, v15);

  return v11;
}

id KVItemTypeToNumber(unsigned __int16 a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if ((unsigned __int16)(a1 - 1) >= 0x1Au) {
    unsigned __int16 v6 = 0;
  }
  else {
    unsigned __int16 v6 = a1;
  }
  id v7 = objc_msgSend_numberWithUnsignedShort_(NSNumber, a2, v6, a4, a5, a6);
  return v7;
}

BOOL KVItemTypeIsValid(unsigned __int16 a1)
{
  return a1 - 1 < 0x1A;
}

uint64_t KVItemTypeFromNumber(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  LODWORD(result) = objc_msgSend_unsignedShortValue(a1, a2, a3, a4, a5, a6);
  if ((result - 1) >= 0x1A) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t KVItemTypeName(unsigned __int16 a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = a1;
  if (a1 - 1 >= 0x1A) {
    uint64_t v6 = 0;
  }
  return objc_msgSend_stringWithCString_encoding_(NSString, a2, (uint64_t)off_1E62AD038[v6], 4, a5, a6);
}

uint64_t KVItemTypeFromName(void *a1)
{
  id v5 = a1;
  if (qword_1E9F96FE8 != -1) {
    dispatch_once(&qword_1E9F96FE8, &unk_1F15F18A8);
  }
  uint64_t v6 = objc_msgSend_objectForKey_((void *)qword_1E9F96FE0, v1, (uint64_t)v5, v2, v3, v4);
  unsigned int v12 = objc_msgSend_unsignedShortValue(v6, v7, v8, v9, v10, v11);
  if (v12 - 1 >= 0x1A) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v12;
  }

  return v13;
}

void sub_1BC3C305C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C3078()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v1 = (void *)qword_1E9F96FE0;
  qword_1E9F96FE0 = (uint64_t)v0;

  for (uint64_t i = 0; i != 27; ++i)
  {
    if ((unsigned __int16)i - 1 <= 0x19)
    {
      uint64_t v11 = objc_msgSend_stringWithCString_encoding_(NSString, v2, (uint64_t)off_1E62AD038[i], 4, v3, v4);
      if (v11)
      {
        unsigned int v12 = (void *)qword_1E9F96FE0;
        uint64_t v13 = KVItemTypeToNumber(i, v6, v7, v8, v9, v10);
        objc_msgSend_setObject_forKey_(v12, v14, (uint64_t)v13, (uint64_t)v11, v15, v16);
      }
    }
  }
}

void sub_1BC3C313C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id KVItemTypeDescription(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = NSString;
  if ((unsigned __int16)a1 - 1 >= 0x1A) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = (unsigned __int16)a1;
  }
  uint64_t v9 = objc_msgSend_stringWithCString_encoding_(NSString, a2, (uint64_t)off_1E62AD038[v8], 4, a5, a6);
  uint64_t v14 = objc_msgSend_numberWithInteger_(NSNumber, v10, a1, v11, v12, v13);
  uint64_t v19 = objc_msgSend_stringWithFormat_(v7, v15, @"%@ (%@)", v16, v17, v18, v9, v14);

  return v19;
}

void sub_1BC3C3214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t KVItemTypeFromCascadeItemType(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend_itemTypeFromCascadeItemType_(KVItemConverter, a2, a1, a4, a5, a6);
}

id KVFieldTypeToNumber(unsigned __int16 a1)
{
  if (KVItemTypeFromFieldType(a1)) {
    unsigned __int16 v6 = a1;
  }
  else {
    unsigned __int16 v6 = 0;
  }
  uint64_t v7 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v2, v6, v3, v4, v5);
  return v7;
}

BOOL KVFieldTypeIsValid(unsigned __int16 a1)
{
  return KVItemTypeFromFieldType(a1) != 0;
}

BOOL KVFieldTypeIsValidForItemType(unsigned __int16 a1, uint64_t a2)
{
  return a2 && KVItemTypeFromFieldType(a1) == a2;
}

uint64_t KVFieldTypeName(unsigned __int16 a1)
{
  if (KVItemTypeFromFieldType(a1)) {
    unsigned __int16 v5 = a1;
  }
  else {
    unsigned __int16 v5 = 0;
  }
  unsigned __int16 v6 = NSString;
  if (v5 <= 0xC8u)
  {
    uint64_t v7 = "Undefined";
    switch(v5)
    {
      case 0u:
        break;
      case 1u:
        uint64_t v7 = "CustomTerm_ContactName";
        break;
      case 2u:
        uint64_t v7 = "CustomTerm_ContactGroupName";
        break;
      case 3u:
        uint64_t v7 = "CustomTerm_PhotoTag";
        break;
      case 4u:
        uint64_t v7 = "CustomTerm_PhotoAlbumName";
        break;
      case 5u:
        uint64_t v7 = "CustomTerm_WorkoutActivityName";
        break;
      case 6u:
        uint64_t v7 = "CustomTerm_CarProfileName";
        break;
      case 7u:
        uint64_t v7 = "CustomTerm_CarName";
        break;
      case 8u:
        uint64_t v7 = "CustomTerm_PaymentsOrganizationName";
        break;
      case 9u:
        uint64_t v7 = "CustomTerm_PaymentsAccountNickname";
        break;
      case 0xAu:
        uint64_t v7 = "CustomTerm_NotebookItemTitle";
        break;
      case 0xBu:
        uint64_t v7 = "CustomTerm_NotebookItemGroupName";
        break;
      case 0xCu:
        uint64_t v7 = "CustomTerm_MediaPlaylistTitle";
        break;
      case 0xDu:
        uint64_t v7 = "CustomTerm_MediaMusicArtistName";
        break;
      case 0xEu:
        uint64_t v7 = "CustomTerm_MediaAudiobookTitle";
        break;
      case 0xFu:
        uint64_t v7 = "CustomTerm_MediaAudiobookAuthorName";
        break;
      case 0x10u:
        uint64_t v7 = "CustomTerm_MediaShowTitle";
        break;
      case 0x11u:
        uint64_t v7 = "CustomTerm_VoiceCommandName";
        break;
      case 0x12u:
        uint64_t v7 = "CustomTerm_PhotoMemoryName";
        break;
      case 0x13u:
        uint64_t v7 = "CustomTerm_MediaUserContext";
        break;
      case 0x14u:
        uint64_t v7 = "CustomTerm_VocabularyId";
        break;
      case 0x15u:
      case 0x16u:
      case 0x17u:
      case 0x18u:
      case 0x19u:
      case 0x1Au:
      case 0x1Bu:
      case 0x1Cu:
      case 0x1Du:
      case 0x1Eu:
      case 0x1Fu:
      case 0x20u:
      case 0x21u:
      case 0x22u:
      case 0x23u:
      case 0x24u:
      case 0x25u:
      case 0x26u:
      case 0x27u:
      case 0x28u:
      case 0x29u:
      case 0x2Au:
      case 0x2Bu:
      case 0x2Cu:
      case 0x2Du:
      case 0x2Eu:
      case 0x2Fu:
      case 0x30u:
      case 0x31u:
      case 0x48u:
      case 0x49u:
      case 0x4Au:
      case 0x4Bu:
      case 0x4Cu:
      case 0x4Du:
      case 0x4Eu:
      case 0x4Fu:
      case 0x50u:
      case 0x51u:
      case 0x52u:
      case 0x53u:
      case 0x54u:
      case 0x55u:
      case 0x56u:
      case 0x57u:
      case 0x58u:
      case 0x59u:
      case 0x5Au:
      case 0x5Bu:
      case 0x5Cu:
      case 0x5Du:
      case 0x5Eu:
      case 0x5Fu:
      case 0x60u:
      case 0x61u:
      case 0x62u:
      case 0x63u:
        goto LABEL_200;
      case 0x32u:
        uint64_t v7 = "Contact_GivenName";
        break;
      case 0x33u:
        uint64_t v7 = "Contact_MiddleName";
        break;
      case 0x34u:
        uint64_t v7 = "Contact_FamilyName";
        break;
      case 0x35u:
        uint64_t v7 = "Contact_PreviousFamilyName";
        break;
      case 0x36u:
        uint64_t v7 = "Contact_Nickname";
        break;
      case 0x37u:
        uint64_t v7 = "Contact_NamePrefix";
        break;
      case 0x38u:
        uint64_t v7 = "Contact_NameSuffix";
        break;
      case 0x39u:
        uint64_t v7 = "Contact_PhoneNumber";
        break;
      case 0x3Au:
        uint64_t v7 = "Contact_EmailAddress";
        break;
      case 0x3Bu:
        uint64_t v7 = "Contact_PostalAddress";
        break;
      case 0x3Cu:
        uint64_t v7 = "Contact_UrlAddress";
        break;
      case 0x3Du:
        uint64_t v7 = "Contact_SocialProfile";
        break;
      case 0x3Eu:
        uint64_t v7 = "Contact_InstantMessageAddress";
        break;
      case 0x3Fu:
        uint64_t v7 = "Contact_Relation";
        break;
      case 0x40u:
        uint64_t v7 = "Contact_OrganizationName";
        break;
      case 0x41u:
        uint64_t v7 = "Contact_DepartmentName";
        break;
      case 0x42u:
        uint64_t v7 = "Contact_JobTitle";
        break;
      case 0x43u:
        uint64_t v7 = "Contact_PhoneticGivenName";
        break;
      case 0x44u:
        uint64_t v7 = "Contact_PhoneticMiddleName";
        break;
      case 0x45u:
        uint64_t v7 = "Contact_PhoneticFamilyName";
        break;
      case 0x46u:
        uint64_t v7 = "Contact_PhoneticOrganizationName";
        break;
      case 0x47u:
        uint64_t v7 = "Contact_SharedUserId";
        break;
      case 0x64u:
        uint64_t v7 = "AppInfo_BundleId";
        break;
      case 0x65u:
        uint64_t v7 = "AppInfo_AppName";
        break;
      case 0x66u:
        uint64_t v7 = "AppInfo_DisplayAppName";
        break;
      case 0x67u:
        uint64_t v7 = "AppInfo_BundleVersion";
        break;
      case 0x68u:
        uint64_t v7 = "AppInfo_AlternativeAppName";
        break;
      default:
        switch(v5)
        {
          case 0x96u:
            uint64_t v7 = "HomeEntity_HomeName";
            break;
          case 0x97u:
            uint64_t v7 = "HomeEntity_ZoneName";
            break;
          case 0x98u:
            uint64_t v7 = "HomeEntity_RoomName";
            break;
          case 0x99u:
            uint64_t v7 = "HomeEntity_ServiceName";
            break;
          case 0x9Au:
            uint64_t v7 = "HomeEntity_ServiceGroupName";
            break;
          case 0x9Bu:
            uint64_t v7 = "HomeEntity_SceneName";
            break;
          case 0x9Cu:
            uint64_t v7 = "HomeEntity_TriggerName";
            break;
          case 0x9Du:
            uint64_t v7 = "HomeEntity_AccessoryName";
            break;
          case 0x9Eu:
            uint64_t v7 = "HomeEntity_AssistantHomeKitId";
            break;
          case 0xAAu:
            uint64_t v7 = "HomeServiceArea_AreaName";
            break;
          case 0xABu:
            uint64_t v7 = "HomeServiceArea_AreaId";
            break;
          case 0xACu:
            uint64_t v7 = "HomeServiceArea_AssociatedMapId";
            break;
          case 0xADu:
            uint64_t v7 = "HomeServiceArea_MapName";
            break;
          case 0xAEu:
            uint64_t v7 = "HomeServiceArea_MapId";
            break;
          case 0xAFu:
            uint64_t v7 = "HomeServiceArea_DeviceIdentifier";
            break;
          default:
            goto LABEL_200;
        }
        break;
    }
  }
  else
  {
    if (v5 <= 0x1F3u)
    {
      switch(v5)
      {
        case 0xC9u:
          uint64_t v7 = "MediaEntity_AlbumArtistId";
          break;
        case 0xCAu:
          uint64_t v7 = "MediaEntity_AlbumArtistName";
          break;
        case 0xCBu:
          uint64_t v7 = "MediaEntity_AlbumId";
          break;
        case 0xCCu:
          uint64_t v7 = "MediaEntity_AlbumName";
          break;
        case 0xCDu:
          uint64_t v7 = "MediaEntity_AudioBookArtistId";
          break;
        case 0xCEu:
          uint64_t v7 = "MediaEntity_AudioBookArtistName";
          break;
        case 0xCFu:
          uint64_t v7 = "MediaEntity_AudioBookId";
          break;
        case 0xD0u:
          uint64_t v7 = "MediaEntity_AudioBookName";
          break;
        case 0xD1u:
          uint64_t v7 = "MediaEntity_GenreId";
          break;
        case 0xD2u:
          uint64_t v7 = "MediaEntity_GenreName";
          break;
        case 0xD3u:
          uint64_t v7 = "MediaEntity_MovieId";
          break;
        case 0xD4u:
          uint64_t v7 = "MediaEntity_MovieName";
          break;
        case 0xD5u:
          uint64_t v7 = "MediaEntity_MusicVideoId";
          break;
        case 0xD6u:
          uint64_t v7 = "MediaEntity_MusicVideoName";
          break;
        case 0xD7u:
          uint64_t v7 = "MediaEntity_PlaylistId";
          break;
        case 0xD8u:
          uint64_t v7 = "MediaEntity_PlaylistName";
          break;
        case 0xD9u:
          uint64_t v7 = "MediaEntity_PodcastArtistId";
          break;
        case 0xDAu:
          uint64_t v7 = "MediaEntity_PodcastArtistName";
          break;
        case 0xDBu:
          uint64_t v7 = "MediaEntity_PodcastEpisodeId";
          break;
        case 0xDCu:
          uint64_t v7 = "MediaEntity_PodcastEpisodeName";
          break;
        case 0xDDu:
          uint64_t v7 = "MediaEntity_PodcastId";
          break;
        case 0xDEu:
          uint64_t v7 = "MediaEntity_PodcastName";
          break;
        case 0xDFu:
          uint64_t v7 = "MediaEntity_PodcastStationId";
          break;
        case 0xE0u:
          uint64_t v7 = "MediaEntity_PodcastStationName";
          break;
        case 0xE1u:
          uint64_t v7 = "MediaEntity_SongArtistId";
          break;
        case 0xE2u:
          uint64_t v7 = "MediaEntity_SongArtistName";
          break;
        case 0xE3u:
          uint64_t v7 = "MediaEntity_SongId";
          break;
        case 0xE4u:
          uint64_t v7 = "MediaEntity_SongName";
          break;
        case 0xE5u:
          uint64_t v7 = "MediaEntity_TVEpisodeId";
          break;
        case 0xE6u:
          uint64_t v7 = "MediaEntity_TVEpisodeName";
          break;
        case 0xE7u:
          uint64_t v7 = "MediaEntity_TVShowId";
          break;
        case 0xE8u:
          uint64_t v7 = "MediaEntity_TVShowName";
          break;
        case 0xE9u:
        case 0xEAu:
        case 0xEBu:
        case 0xECu:
        case 0xEDu:
        case 0xEEu:
        case 0xEFu:
        case 0xF0u:
        case 0xF1u:
        case 0xF2u:
        case 0xF3u:
        case 0xF4u:
        case 0xF5u:
        case 0xF6u:
        case 0xF7u:
        case 0xF8u:
        case 0xF9u:
        case 0x100u:
        case 0x101u:
        case 0x102u:
        case 0x103u:
        case 0x104u:
        case 0x105u:
        case 0x106u:
        case 0x107u:
        case 0x108u:
        case 0x109u:
        case 0x10Au:
        case 0x10Bu:
        case 0x10Cu:
        case 0x10Du:
        case 0x10Eu:
        case 0x10Fu:
        case 0x110u:
        case 0x111u:
        case 0x112u:
        case 0x116u:
        case 0x117u:
        case 0x118u:
        case 0x119u:
        case 0x11Au:
        case 0x11Bu:
        case 0x11Cu:
        case 0x11Du:
        case 0x11Eu:
        case 0x11Fu:
        case 0x120u:
        case 0x121u:
        case 0x122u:
        case 0x123u:
        case 0x124u:
        case 0x125u:
        case 0x126u:
        case 0x127u:
        case 0x128u:
        case 0x129u:
        case 0x12Au:
        case 0x12Bu:
          goto LABEL_200;
        case 0xFAu:
          uint64_t v7 = "LinkStaticTerm_AppEntityTypeName";
          break;
        case 0xFBu:
          uint64_t v7 = "LinkStaticTerm_AppEntityTypeClassName";
          break;
        case 0xFCu:
          uint64_t v7 = "LinkStaticTerm_AppEntityName";
          break;
        case 0xFDu:
          uint64_t v7 = "LinkStaticTerm_AppEntityId";
          break;
        case 0xFEu:
          uint64_t v7 = "LinkStaticTerm_AppSettingName";
          break;
        case 0xFFu:
          uint64_t v7 = "LinkStaticTerm_AppSettingCanonicalName";
          break;
        case 0x113u:
          uint64_t v7 = "LinkDynamicTerm_AppEntityName";
          break;
        case 0x114u:
          uint64_t v7 = "LinkDynamicTerm_AppEntityTypeClassName";
          break;
        case 0x115u:
          uint64_t v7 = "LinkDynamicTerm_AppEntityId";
          break;
        case 0x12Cu:
          uint64_t v7 = "AutoShortcut_Phrase";
          break;
        case 0x12Du:
          uint64_t v7 = "AutoShortcut_BaseTemplate";
          break;
        case 0x12Eu:
          uint64_t v7 = "AutoShortcut_TemplateParameterValue";
          break;
        default:
          switch(v5)
          {
            case 0x228u:
              uint64_t v7 = "RadioEntity_Name";
              break;
            case 0x229u:
              uint64_t v7 = "RadioEntity_CallSign";
              break;
            case 0x22Au:
              uint64_t v7 = "RadioEntity_Frequency";
              break;
            case 0x22Bu:
              uint64_t v7 = "RadioEntity_Channel";
              break;
            case 0x22Cu:
              uint64_t v7 = "RadioEntity_SignalType";
              break;
            default:
              if (v5 != 952) {
                goto LABEL_200;
              }
              uint64_t v7 = "KeyboardWord_DynamicToken";
              break;
          }
          break;
      }
      goto LABEL_207;
    }
    if (v5 <= 0x384u)
    {
      if (v5 > 0x2BBu)
      {
        if (v5 <= 0x31Fu)
        {
          if (v5 <= 0x2BDu)
          {
            if (v5 == 700) {
              uint64_t v7 = "Podcast_Title";
            }
            else {
              uint64_t v7 = "Podcast_ArtistName";
            }
            goto LABEL_207;
          }
          if (v5 == 702)
          {
            uint64_t v7 = "Podcast_PlaylistName";
            goto LABEL_207;
          }
          if (v5 == 750)
          {
            uint64_t v7 = "Fitness_GuestName";
            goto LABEL_207;
          }
LABEL_200:
          uint64_t v7 = "";
          goto LABEL_207;
        }
        if (v5 > 0x351u)
        {
          switch(v5)
          {
            case 0x352u:
              uint64_t v7 = "Health_MedicationName";
              goto LABEL_207;
            case 0x353u:
              uint64_t v7 = "Health_MedicationNickname";
              goto LABEL_207;
            case 0x384u:
              uint64_t v7 = "UserAccount_Username";
              goto LABEL_207;
          }
          goto LABEL_200;
        }
        switch(v5)
        {
          case 0x320u:
            uint64_t v7 = "AppShortcut_EntityInstanceIdentifier";
            break;
          case 0x321u:
            uint64_t v7 = "AppShortcut_EntityTitle";
            break;
          case 0x322u:
            uint64_t v7 = "AppShortcut_EntityTypeIdentifier";
            break;
          case 0x323u:
            uint64_t v7 = "AppShortcut_ProviderClass";
            break;
          case 0x324u:
            uint64_t v7 = "AppShortcut_EntitySynonym";
            break;
          default:
            goto LABEL_200;
        }
      }
      else
      {
        if (v5 <= 0x257u)
        {
          if (v5 <= 0x226u)
          {
            if (v5 == 500)
            {
              uint64_t v7 = "LinkOOVTerm_Phrase";
              goto LABEL_207;
            }
            if (v5 == 501)
            {
              uint64_t v7 = "LinkOOVTerm_CustomPronunciation";
              goto LABEL_207;
            }
          }
          else
          {
            switch(v5)
            {
              case 0x227u:
                uint64_t v7 = "LocationOfInterest_LocationName";
                goto LABEL_207;
              case 0x228u:
                uint64_t v7 = "LocationOfInterest_SpatialLocationName";
                goto LABEL_207;
              case 0x229u:
                uint64_t v7 = "PortraitEntity_NamedEntityName";
                goto LABEL_207;
            }
          }
          goto LABEL_200;
        }
        switch(v5)
        {
          case 0x258u:
            uint64_t v7 = "GlobalTerm_MediaPlaylistTitle";
            break;
          case 0x259u:
            uint64_t v7 = "GlobalTerm_MediaMusicArtistName";
            break;
          case 0x25Au:
            uint64_t v7 = "GlobalTerm_MediaAudiobookTitle";
            break;
          case 0x25Bu:
            uint64_t v7 = "GlobalTerm_MediaAudiobookAuthor";
            break;
          case 0x25Cu:
            uint64_t v7 = "GlobalTerm_MediaShowTitle";
            break;
          default:
            if (v5 == 1250)
            {
              uint64_t v7 = "CalendarEvent_Title";
            }
            else
            {
              if (v5 != 1251) {
                goto LABEL_200;
              }
              uint64_t v7 = "CalendarEvent_LocationName";
            }
            break;
        }
      }
    }
    else
    {
      if (v5 > 0x44Bu)
      {
        switch(v5)
        {
          case 0x47Eu:
            uint64_t v7 = "AppIntentsEnum_TypeIdentifier";
            break;
          case 0x47Fu:
            uint64_t v7 = "AppIntentsEnum_TypeName";
            break;
          case 0x480u:
            uint64_t v7 = "AppIntentsEnum_TypeSynonym";
            break;
          case 0x481u:
            uint64_t v7 = "AppIntentsEnum_CaseIdentifier";
            break;
          case 0x482u:
            uint64_t v7 = "AppIntentsEnum_CaseTitle";
            break;
          case 0x483u:
            uint64_t v7 = "AppIntentsEnum_CaseSubtitle";
            break;
          case 0x484u:
            uint64_t v7 = "AppIntentsEnum_CaseSynonym";
            break;
          default:
            switch(v5)
            {
              case 0x8CAu:
                uint64_t v7 = "AppIntentsEntity_TypeIdentifier";
                break;
              case 0x8CBu:
                uint64_t v7 = "AppIntentsEntity_TypeName";
                break;
              case 0x8CCu:
                uint64_t v7 = "AppIntentsEntity_TypeSynonym";
                break;
              case 0x8CDu:
                uint64_t v7 = "AppIntentsEntity_Title";
                break;
              case 0x8CEu:
                uint64_t v7 = "AppIntentsEntity_Subtitle";
                break;
              case 0x8CFu:
                uint64_t v7 = "AppIntentsEntity_Synonym";
                break;
              default:
                goto LABEL_200;
            }
            break;
        }
        goto LABEL_207;
      }
      if (v5 <= 0x3E7u)
      {
        if (v5 > 0x3B6u)
        {
          if (v5 == 951)
          {
            uint64_t v7 = "FindMy_OwnerFirstName";
            goto LABEL_207;
          }
          if (v5 == 952)
          {
            uint64_t v7 = "FindMy_OwnerLastName";
            goto LABEL_207;
          }
        }
        else
        {
          if (v5 == 901)
          {
            uint64_t v7 = "UserAccount_GivenName";
            goto LABEL_207;
          }
          if (v5 == 950)
          {
            uint64_t v7 = "FindMy_DeviceName";
            goto LABEL_207;
          }
        }
        goto LABEL_200;
      }
      switch(v5)
      {
        case 0x41Au:
          uint64_t v7 = "LearnedMediaEntity_userPhrasedSongName";
          break;
        case 0x41Bu:
          uint64_t v7 = "LearnedMediaEntity_userPhrasedArtistName";
          break;
        case 0x41Cu:
          uint64_t v7 = "LearnedMediaEntity_userPhrasedAlbumName";
          break;
        case 0x41Du:
          uint64_t v7 = "LearnedMediaEntity_userPhrasedVersion";
          break;
        case 0x41Eu:
          uint64_t v7 = "LearnedMediaEntity_userPhrasedEntityName";
          break;
        case 0x41Fu:
          uint64_t v7 = "LearnedMediaEntity_suggestedAdamId";
          break;
        default:
          if (v5 == 2050)
          {
            uint64_t v7 = "LearnedContact_suggestedContactId";
          }
          else
          {
            if (v5 != 2051) {
              goto LABEL_200;
            }
            uint64_t v7 = "LearnedContact_userPhrasedName";
          }
          break;
      }
    }
  }
LABEL_207:
  return objc_msgSend_stringWithCString_encoding_(v6, v2, (uint64_t)v7, 4, v3, v4);
}

uint64_t KVFieldTypeFromName(void *a1)
{
  id v5 = a1;
  if (qword_1E9F96FF8 != -1) {
    dispatch_once(&qword_1E9F96FF8, &unk_1F15F1808);
  }
  unsigned __int16 v6 = objc_msgSend_objectForKey_((void *)qword_1E9F96FF0, v1, (uint64_t)v5, v2, v3, v4);
  unsigned int v12 = objc_msgSend_unsignedShortValue(v6, v7, v8, v9, v10, v11);
  uint64_t v13 = v12;
  if (!KVItemTypeFromFieldType(v12)) {
    uint64_t v13 = 0;
  }

  return v13;
}

void sub_1BC3C4438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C4454()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v1 = (void *)qword_1E9F96FF0;
  qword_1E9F96FF0 = (uint64_t)v0;

  for (uint64_t i = 0; i != 1157; ++i)
  {
    if (KVItemTypeFromFieldType(i))
    {
      uint64_t v3 = KVFieldTypeName(i);
      if (v3)
      {
        uint64_t v4 = (void *)qword_1E9F96FF0;
        id v5 = KVFieldTypeToNumber(i);
        objc_msgSend_setObject_forKey_(v4, v6, (uint64_t)v5, (uint64_t)v3, v7, v8);
      }
    }
  }
}

void sub_1BC3C44F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id KVFieldTypeDescription(uint64_t a1)
{
  uint64_t v2 = NSString;
  uint64_t v3 = KVFieldTypeName(a1);
  uint64_t v8 = objc_msgSend_numberWithInteger_(NSNumber, v4, a1, v5, v6, v7);
  uint64_t v13 = objc_msgSend_stringWithFormat_(v2, v9, @"%@ (%@)", v10, v11, v12, v3, v8);

  return v13;
}

void sub_1BC3C45A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id KVLocaleTypeToNumber(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if ((unint64_t)(a1 - 1) >= 0x2C) {
    unsigned __int8 v6 = 0;
  }
  else {
    unsigned __int8 v6 = a1;
  }
  uint64_t v7 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a2, v6, a4, a5, a6);
  return v7;
}

BOOL KVLocaleTypeIsValid(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0x2C;
}

uint64_t KVLocaleTypeFromNumber(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  LODWORD(result) = objc_msgSend_unsignedShortValue(a1, a2, a3, a4, a5, a6);
  if ((unint64_t)result - 1 >= 0x2C) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t KVLocaleTypeName(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if ((unint64_t)(a1 - 1) >= 0x2C) {
    unsigned __int8 v6 = 0;
  }
  else {
    unsigned __int8 v6 = a1;
  }
  if (v6 <= 0x2Cu) {
    return objc_msgSend_stringWithCString_encoding_(NSString, a2, (uint64_t)off_1E62AD118[v6], 4, a5, a6);
  }
  else {
    return objc_msgSend_stringWithCString_encoding_(NSString, a2, (uint64_t)"", 4, a5, a6);
  }
}

uint64_t KVLocaleTypeFromName(void *a1)
{
  id v5 = a1;
  if (qword_1EB5EE430 != -1) {
    dispatch_once(&qword_1EB5EE430, &unk_1F15F1828);
  }
  unsigned __int8 v6 = objc_msgSend_objectForKey_((void *)qword_1EB5EE438, v1, (uint64_t)v5, v2, v3, v4);
  unsigned int v12 = objc_msgSend_unsignedShortValue(v6, v7, v8, v9, v10, v11);
  if ((unint64_t)v12 - 1 >= 0x2C) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v12;
  }

  return v13;
}

void sub_1BC3C4714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C4730()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v1 = (void *)qword_1EB5EE438;
  qword_1EB5EE438 = (uint64_t)v0;

  for (uint64_t i = 0; i != 45; ++i)
  {
    if ((unint64_t)(i - 1) <= 0x2B)
    {
      uint64_t v11 = objc_msgSend_stringWithCString_encoding_(NSString, v2, (uint64_t)off_1E62AD118[i], 4, v3, v4);
      if (v11)
      {
        unsigned int v12 = (void *)qword_1EB5EE438;
        uint64_t v13 = KVLocaleTypeToNumber(i, v6, v7, v8, v9, v10);
        objc_msgSend_setObject_forKey_(v12, v14, (uint64_t)v13, (uint64_t)v11, v15, v16);
      }
    }
  }
}

void sub_1BC3C47F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id KVLocaleTypeDescription(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = NSString;
  if ((unint64_t)(a1 - 1) >= 0x2C) {
    unsigned __int8 v8 = 0;
  }
  else {
    unsigned __int8 v8 = a1;
  }
  if (v8 <= 0x2Cu) {
    objc_msgSend_stringWithCString_encoding_(NSString, a2, (uint64_t)off_1E62AD118[v8], 4, a5, a6);
  }
  else {
  uint64_t v9 = objc_msgSend_stringWithCString_encoding_(NSString, a2, (uint64_t)"", 4, a5, a6);
  }
  uint64_t v14 = objc_msgSend_numberWithInteger_(NSNumber, v10, a1, v11, v12, v13);
  uint64_t v19 = objc_msgSend_stringWithFormat_(v7, v15, @"%@ (%@)", v16, v17, v18, v9, v14);

  return v19;
}

void sub_1BC3C48DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t KVLocaleTypeFromNSLocale(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned __int8 v6 = objc_msgSend_localeIdentifier(a1, a2, a3, a4, a5, a6);
  uint64_t v7 = KVLocaleTypeFromName(v6);

  return v7;
}

void sub_1BC3C4930(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id KVLocaleTypeToNSLocale(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if ((unint64_t)(a1 - 1) > 0x2B)
  {
    uint64_t v12 = 0;
  }
  else
  {
    unsigned __int8 v6 = (void *)MEMORY[0x1E4F1CA20];
    uint64_t v7 = objc_msgSend_stringWithCString_encoding_(NSString, a2, (uint64_t)off_1E62AD118[a1], 4, a5, a6);
    uint64_t v12 = objc_msgSend_localeWithLocaleIdentifier_(v6, v8, (uint64_t)v7, v9, v10, v11);
  }
  return v12;
}

void sub_1BC3C49CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1BC3C4DB8()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)qword_1E9F96FD8;
  uint64_t v7 = qword_1E9F96FD8;
  if (!qword_1E9F96FD8)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = sub_1BC3C4E9C;
    v3[3] = &unk_1E62AD708;
    v3[4] = &v4;
    sub_1BC3C4E9C((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC3C4E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BC3C4E9C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SEMSpanMatcher");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1E9F96FD8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    sub_1BC3C4F0C();
  }
}

void sub_1BC3C4F0C()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!qword_1E9F96FD0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = sub_1BC3C5018;
    v1[4] = &unk_1E62AD740;
    v1[5] = v1;
    long long v2 = xmmword_1E62AD288;
    uint64_t v3 = 0;
    qword_1E9F96FD0 = _sl_dlopen();
    id v0 = (void *)v1[0];
    if (qword_1E9F96FD0)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      id v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t sub_1BC3C5018()
{
  uint64_t result = _sl_dlopen();
  qword_1E9F96FD0 = result;
  return result;
}

void sub_1BC3C5288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1BC3C52A8(uint64_t a1)
{
  sub_1BC3C4F0C();
  Class result = objc_getClass("SEMTokenizer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1E9F97000 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)abort_report_np();
    return (Class)+[KVSpanMatcher indexMatcher];
  }
  return result;
}

void sub_1BC3C540C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C5550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

Class sub_1BC3C5578(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1E9F97010)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = sub_1BC3C56CC;
    v4[4] = &unk_1E62AD740;
    v4[5] = v4;
    long long v5 = xmmword_1E62AD2A0;
    uint64_t v6 = 0;
    qword_1E9F97010 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!qword_1E9F97010)
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
    Class result = objc_getClass("SEMTokenizer");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_1E9F97008 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1BC3C56CC()
{
  uint64_t result = _sl_dlopen();
  qword_1E9F97010 = result;
  return result;
}

uint64_t sub_1BC3C5A88(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  SEL v4 = [KVDataset alloc];
  uint64_t v9 = objc_msgSend_initWithReader_(v4, v5, (uint64_t)v3, v6, v7, v8);

  uint64_t v10 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v9);
  return v10;
}

void sub_1BC3C6098(_Unwind_Exception *a1)
{
  SEL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BC3C6268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  if (v12)
  {
  }
  if (!v11) {

  }
  _Unwind_Resume(a1);
}

void sub_1BC3C6374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C6584(_Unwind_Exception *a1)
{
  uint64_t v7 = v4;

  _Unwind_Resume(a1);
}

void sub_1BC3C6828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C6884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C68FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C6B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  if (v14) {

  }
  if (!a14) {
  _Unwind_Resume(a1);
  }
}

void sub_1BC3C6DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C6EB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C6ED0(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v8 = objc_msgSend_localeType(v9, v3, v4, v5, v6, v7);
  if (!v8 || v8 == *(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1BC3C6F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C703C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C70CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C715C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C7618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C790C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C7964(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  if (a3) {
    objc_msgSend_appendString_(*(void **)(a1 + 32), v5, @",\n", v6, v7, v8);
  }
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = objc_msgSend_JSONWithIndent_(v15, v5, (*(unsigned char *)(a1 + 40) + 2), v6, v7, v8);
  objc_msgSend_appendString_(v9, v11, (uint64_t)v10, v12, v13, v14);
}

void sub_1BC3C79F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C7B58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C8404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3C8564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t KVItemTypeToCascadeItemType(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend_cascadeItemTypeFromItemType_(KVItemConverter, a2, a1, a4, a5, a6);
}

uint64_t KVFieldTypeToCascadeFieldType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x1F4181798](KVItemConverter, sel_cascadeFieldTypeFromFieldType_, a1, a4, a5, a6);
}

uint64_t KVFieldTypeFromCascadeFieldType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x1F4181798](KVItemConverter, sel_fieldTypeFromCascadeFieldType_, a1, a4, a5, a6);
}

void sub_1BC3C8AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 192), 8);
  _Block_object_dispose((const void *)(v17 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1BC3C8B04(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1BC3C8B14(uint64_t a1)
{
}

id sub_1BC3C8B1C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend_metaContent(v4, v6, v7, v8, v9, v10);
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = (void *)0x1E4F29000;
  uint64_t v13 = NSString;
  uint64_t v14 = objc_msgSend_content(v4, v6, v7, v8, v9, v10);
  uint64_t v25 = objc_msgSend_jsonDict(v14, v15, v16, v17, v18, v19);
  if (v11)
  {
    uint64_t v26 = NSString;
    uint64_t v12 = objc_msgSend_jsonDict(v11, v20, v21, v22, v23, v24);
    objc_msgSend_stringWithFormat_(v26, v27, @", MetaContent: %@", v28, v29, v30, v12);
    id v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v13, v32, @"Encountered KVItemBuilder error: %@ while converting cascade item (Content: %@%@)", v33, v34, v35, v3, v25, v31);
  }
  else
  {
    id v31 = &stru_1F15F1CC8;
    objc_msgSend_stringWithFormat_(v13, v20, @"Encountered KVItemBuilder error: %@ while converting cascade item (Content: %@%@)", v22, v23, v24, v3, v25, &stru_1F15F1CC8);
  uint64_t v36 = };
  objc_msgSend_setObject_forKey_(v5, v37, (uint64_t)v36, *MEMORY[0x1E4F28228], v38, v39);

  if (v11)
  {
  }
  if (v3) {
    objc_msgSend_setObject_forKey_(v5, v40, (uint64_t)v3, *MEMORY[0x1E4F28A50], v41, v42);
  }
  uint64_t v43 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v40, @"com.apple.koa.item.converter", 3, (uint64_t)v5, v42);

  return v43;
}

void sub_1BC3C8CD0(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = v3;
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    int v10 = objc_msgSend_fieldType(v3, v4, v5, v6, v7, v8);
    switch(v10)
    {
      case 36446:
        uint64_t v18 = objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
        uint64_t v19 = 103;
        break;
      case 18568:
        unsigned int v25 = objc_msgSend_rawEnumValue(v9, v11, v12, v13, v14, v15) - 1;
        if (v25 > 0xB) {
          uint64_t v19 = 0;
        }
        else {
          uint64_t v19 = qword_1BC3E4888[v25];
        }
        uint64_t v26 = objc_msgSend_repeatedSubMessageIndex(v9, v20, v21, v22, v23, v24);
        __int16 v32 = objc_msgSend_parentMessageField(v9, v27, v28, v29, v30, v31);
        uint64_t v38 = objc_msgSend_repeatedSubMessageValue(v32, v33, v34, v35, v36, v37);
        uint64_t v43 = objc_msgSend_objectAtIndex_(v38, v39, v26, v40, v41, v42);
        uint64_t v18 = objc_msgSend_sourceItemIdentifier(v43, v44, v45, v46, v47, v48);

        break;
      case 7700:
        uint64_t v18 = objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
        uint64_t v19 = 158;
        break;
      default:
        uint64_t v18 = 0;
LABEL_14:

        goto LABEL_15;
    }
    uint64_t v49 = (void *)a1[4];
    uint64_t v50 = *(void *)(a1[6] + 8);
    id obj = *(id *)(v50 + 40);
    long long v51 = objc_msgSend_addFieldWithType_value_error_(v49, v16, v19, (uint64_t)v18, (uint64_t)&obj, v17);
    objc_storeStrong((id *)(v50 + 40), obj);

    if (!v51) {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    }
    goto LABEL_14;
  }
LABEL_15:
}

id sub_1BC3C8E5C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a2;
  id v6 = objc_alloc_init(v4);
  uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v7, @"Encountered error: %@ enumerating Cascade item: %@", v8, v9, v10, v3, v5);

  objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, *MEMORY[0x1E4F28228], v13, v14);
  if (v3) {
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v3, *MEMORY[0x1E4F28A50], v16, v17);
  }
  uint64_t v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v15, @"com.apple.koa.item.converter", 6, (uint64_t)v6, v17);

  return v18;
}

void sub_1BC3C8F4C(void *a1, void *a2)
{
  v109[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v9 = v3;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    int v10 = objc_msgSend_fieldType(v3, v4, v5, v6, v7, v8);
    switch(a1[9])
    {
      case 1:
        uint64_t v16 = 0;
        if (v10 > 25886)
        {
          if (v10 <= 38254)
          {
            if (v10 <= 30601)
            {
              if (v10 > 26515)
              {
                if (v10 != 26516)
                {
                  uint64_t v17 = 0;
                  if (v10 != 30601) {
                    goto LABEL_206;
                  }
                  objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
                  uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  uint64_t v16 = 0;
                  uint64_t v19 = 17;
                  goto LABEL_204;
                }
              }
              else if (v10 != 25887)
              {
                uint64_t v17 = 0;
                if (v10 != 26515) {
                  goto LABEL_206;
                }
                objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
                uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
                uint64_t v16 = 0;
                uint64_t v19 = 10;
                goto LABEL_204;
              }
              goto LABEL_203;
            }
            if (v10 <= 32968)
            {
              if (v10 != 30602)
              {
                uint64_t v17 = 0;
                if (v10 != 32968) {
                  goto LABEL_206;
                }
                objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
                uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
                uint64_t v16 = 0;
                uint64_t v19 = 12;
                goto LABEL_204;
              }
              goto LABEL_203;
            }
            if (v10 == 32969) {
              goto LABEL_203;
            }
            uint64_t v17 = 0;
            if (v10 != 38254)
            {
LABEL_206:

              break;
            }
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 15;
LABEL_204:
            v98 = (void *)a1[5];
            uint64_t v99 = *(void *)(a1[8] + 8);
            id v101 = *(id *)(v99 + 40);
            v100 = objc_msgSend_addFieldWithType_label_value_error_(v98, v18, v19, (uint64_t)v16, (uint64_t)v17, (uint64_t)&v101);
            objc_storeStrong((id *)(v99 + 40), v101);

            if (!v100) {
              *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
            }
            goto LABEL_206;
          }
          if (v10 <= 53485)
          {
            if (v10 > 44938)
            {
              if (v10 != 44939)
              {
                uint64_t v17 = 0;
                if (v10 != 53485) {
                  goto LABEL_206;
                }
                objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
                uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
                uint64_t v16 = 0;
                uint64_t v19 = 4;
                goto LABEL_204;
              }
            }
            else if (v10 != 38255)
            {
              uint64_t v17 = 0;
              if (v10 != 44938) {
                goto LABEL_206;
              }
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 5;
              goto LABEL_204;
            }
            goto LABEL_203;
          }
          if (v10 <= 61355)
          {
            if (v10 != 53486)
            {
              uint64_t v17 = 0;
              if (v10 != 61355) {
                goto LABEL_206;
              }
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 1;
              goto LABEL_204;
            }
            goto LABEL_203;
          }
          if (v10 == 61356) {
            goto LABEL_203;
          }
          if (v10 == 63372)
          {
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 2;
            goto LABEL_204;
          }
          int v36 = 63373;
        }
        else if (v10 <= 14708)
        {
          if (v10 > 7721)
          {
            if (v10 > 13886)
            {
              if (v10 == 13887)
              {
                objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
                uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
                uint64_t v16 = 0;
                uint64_t v19 = 3;
                goto LABEL_204;
              }
              int v36 = 13888;
            }
            else
            {
              if (v10 == 7722)
              {
                objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
                uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
                uint64_t v16 = 0;
                uint64_t v19 = 13;
                goto LABEL_204;
              }
              int v36 = 7723;
            }
          }
          else
          {
            if (v10 <= 5597)
            {
              if (v10 != 803)
              {
                uint64_t v17 = 0;
                if (v10 != 804) {
                  goto LABEL_206;
                }
                goto LABEL_203;
              }
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 7;
              goto LABEL_204;
            }
            if (v10 == 5598)
            {
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 11;
              goto LABEL_204;
            }
            int v36 = 5599;
          }
        }
        else if (v10 <= 15574)
        {
          if (v10 > 14818)
          {
            if (v10 == 14819)
            {
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 6;
              goto LABEL_204;
            }
            int v36 = 14820;
          }
          else
          {
            if (v10 == 14709)
            {
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 14;
              goto LABEL_204;
            }
            int v36 = 14710;
          }
        }
        else
        {
          if (v10 > 16253)
          {
            if (v10 != 16254)
            {
              if (v10 != 16255)
              {
                uint64_t v17 = 0;
                if (v10 != 25886) {
                  goto LABEL_206;
                }
                objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
                uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
                uint64_t v16 = 0;
                uint64_t v19 = 9;
                goto LABEL_204;
              }
LABEL_203:
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 20;
              goto LABEL_204;
            }
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 8;
            goto LABEL_204;
          }
          if (v10 == 15575)
          {
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 16;
            goto LABEL_204;
          }
          int v36 = 15576;
        }
        uint64_t v17 = 0;
        if (v10 != v36) {
          goto LABEL_206;
        }
        goto LABEL_203;
      case 2:
        uint64_t v16 = 0;
        if (v10 > 19746)
        {
          uint64_t v17 = 0;
          switch(v10)
          {
            case 19758:
              uint64_t v16 = objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              if (sub_1BC3CA810(v16))
              {

                uint64_t v16 = 0;
              }
              uint64_t v42 = objc_msgSend_repeatedSubMessageIndex(v9, v37, v38, v39, v40, v41);
              uint64_t v48 = objc_msgSend_parentMessageField(v9, v43, v44, v45, v46, v47);
              uint64_t v54 = objc_msgSend_repeatedSubMessageValue(v48, v49, v50, v51, v52, v53);
              id v59 = objc_msgSend_objectAtIndex_(v54, v55, v42, v56, v57, v58);
              objc_msgSend_name(v59, v60, v61, v62, v63, v64);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

              uint64_t v19 = 63;
              goto LABEL_204;
            case 19759:
            case 19761:
            case 19762:
            case 19763:
            case 19764:
            case 19766:
              goto LABEL_206;
            case 19760:
              uint64_t v16 = objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = 0;
              if (sub_1BC3CA810(v16)) {
                goto LABEL_206;
              }
              uint64_t v19 = 61;
              goto LABEL_204;
            case 19765:
              uint64_t v16 = objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = 0;
              if (sub_1BC3CA810(v16)) {
                goto LABEL_206;
              }
              uint64_t v19 = 58;
              goto LABEL_204;
            case 19767:
              uint64_t v16 = objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = 0;
              if (sub_1BC3CA810(v16)) {
                goto LABEL_206;
              }
              uint64_t v19 = 60;
              goto LABEL_204;
            default:
              if (v10 != 19747)
              {
                uint64_t v17 = 0;
                if (v10 == 19749)
                {
                  uint64_t v16 = objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
                  uint64_t v17 = 0;
                  if ((sub_1BC3CA810(v16) & 1) == 0)
                  {
                    uint64_t v19 = 59;
                    goto LABEL_204;
                  }
                }
                goto LABEL_206;
              }
              uint64_t v16 = objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = 0;
              if (sub_1BC3CA810(v16)) {
                goto LABEL_206;
              }
              uint64_t v19 = 57;
              break;
          }
        }
        else
        {
          uint64_t v17 = 0;
          switch(v10)
          {
            case 19679:
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 50;
              goto LABEL_204;
            case 19680:
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 51;
              goto LABEL_204;
            case 19681:
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 52;
              goto LABEL_204;
            case 19682:
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 53;
              goto LABEL_204;
            case 19683:
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 54;
              goto LABEL_204;
            case 19684:
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 55;
              goto LABEL_204;
            case 19685:
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 56;
              goto LABEL_204;
            case 19686:
            case 19687:
            case 19688:
            case 19689:
            case 19690:
            case 19691:
            case 19692:
              goto LABEL_206;
            case 19693:
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 64;
              goto LABEL_204;
            case 19694:
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 65;
              goto LABEL_204;
            case 19695:
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 66;
              goto LABEL_204;
            case 19696:
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 67;
              goto LABEL_204;
            case 19697:
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 68;
              goto LABEL_204;
            case 19698:
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 69;
              goto LABEL_204;
            case 19699:
              objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = 0;
              uint64_t v19 = 70;
              goto LABEL_204;
            default:
              uint64_t v17 = 0;
              if (v10 != 19744) {
                goto LABEL_206;
              }
              uint64_t v16 = objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
              uint64_t v17 = 0;
              if (sub_1BC3CA810(v16)) {
                goto LABEL_206;
              }
              uint64_t v19 = 62;
              break;
          }
        }
        goto LABEL_204;
      case 3:
        uint64_t v16 = 0;
        uint64_t v19 = 104;
        uint64_t v17 = 0;
        switch(v10)
        {
          case 36437:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 100;
            goto LABEL_204;
          case 36438:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 101;
            goto LABEL_204;
          case 36439:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 102;
            goto LABEL_204;
          case 36440:
            goto LABEL_206;
          case 36441:
            goto LABEL_132;
          default:
            goto LABEL_72;
        }
        goto LABEL_206;
      case 4:
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        switch(v10)
        {
          case 7701:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 150;
            goto LABEL_204;
          case 7702:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 157;
            goto LABEL_204;
          case 7703:
          case 7707:
            goto LABEL_206;
          case 7704:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 152;
            goto LABEL_204;
          case 7705:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 155;
            goto LABEL_204;
          case 7706:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 153;
            goto LABEL_204;
          case 7708:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 154;
            goto LABEL_204;
          case 7709:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 156;
            goto LABEL_204;
          case 7710:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 151;
            goto LABEL_204;
          default:
            goto LABEL_72;
        }
        goto LABEL_206;
      case 5:
        switch(v10)
        {
          case 18555:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 204;
            goto LABEL_204;
          case 18556:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 202;
            goto LABEL_204;
          case 18557:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 208;
            goto LABEL_204;
          case 18558:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 206;
            goto LABEL_204;
          case 18559:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 210;
            goto LABEL_204;
          case 18560:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 212;
            goto LABEL_204;
          case 18561:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 214;
            goto LABEL_204;
          case 18562:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 216;
            goto LABEL_204;
          case 18563:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 228;
            goto LABEL_204;
          case 18564:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 226;
            goto LABEL_204;
          case 18565:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 230;
            goto LABEL_204;
          case 18566:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 232;
            goto LABEL_204;
          default:
            goto LABEL_144;
        }
      case 8:
        switch(v10)
        {
          case 12015:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 302;
            break;
          case 12014:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 301;
            break;
          case 12013:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 300;
            break;
          default:
            goto LABEL_144;
        }
        goto LABEL_204;
      case 9:
        switch(v10)
        {
          case 49069:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 351;
            goto LABEL_204;
          case 49070:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 352;
            goto LABEL_204;
          case 49071:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 353;
            goto LABEL_204;
          case 49072:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 354;
            goto LABEL_204;
          case 49073:
            unsigned int v65 = objc_msgSend_rawEnumValue(v9, v11, v12, v13, v14, v15);
            if (v65 > 5)
            {
              uint64_t v17 = 0;
              uint64_t v16 = 0;
            }
            else
            {
              uint64_t v16 = 0;
              uint64_t v17 = off_1E62AD560[v65];
            }
            uint64_t v19 = 355;
            goto LABEL_204;
          default:
            goto LABEL_144;
        }
      case 0xCLL:
        switch(v10)
        {
          case 15768:
          case 15769:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 551;
            goto LABEL_204;
          case 15770:
          case 15771:
          case 15772:
          case 15773:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 552;
            goto LABEL_204;
          default:
            goto LABEL_144;
        }
      case 0xELL:
        uint64_t v16 = 0;
        if (v10 <= 14029)
        {
          if (v10 == 3620)
          {
            uint64_t v19 = 601;
          }
          else
          {
            uint64_t v17 = 0;
            if (v10 != 8199) {
              goto LABEL_206;
            }
            uint64_t v19 = 602;
          }
        }
        else if (v10 == 14030)
        {
          uint64_t v19 = 603;
        }
        else if (v10 == 34312)
        {
          uint64_t v19 = 600;
        }
        else
        {
          uint64_t v17 = 0;
          if (v10 != 36064) {
            goto LABEL_206;
          }
          uint64_t v19 = 604;
        }
LABEL_132:
        long long v84 = objc_msgSend_repeatedStringValueNoCopy(v9, v11, v12, v13, v14, v15);
        if (v84)
        {
          long long v105 = 0u;
          long long v106 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          id v85 = v84;
          uint64_t v88 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v86, (uint64_t)&v103, (uint64_t)v107, 16, v87);
          if (v88)
          {
            uint64_t v91 = v88;
            uint64_t v92 = *(void *)v104;
            do
            {
              for (uint64_t i = 0; i != v91; ++i)
              {
                if (*(void *)v104 != v92) {
                  objc_enumerationMutation(v85);
                }
                uint64_t v94 = *(void *)(*((void *)&v103 + 1) + 8 * i);
                __int16 v95 = (void *)a1[5];
                uint64_t v96 = *(void *)(a1[8] + 8);
                id obj = *(id *)(v96 + 40);
                uint64_t v97 = objc_msgSend_addFieldWithType_value_error_(v95, v89, v19, v94, (uint64_t)&obj, v90);
                objc_storeStrong((id *)(v96 + 40), obj);

                if (!v97)
                {
                  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
                  goto LABEL_143;
                }
              }
              uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v89, (uint64_t)&v103, (uint64_t)v107, 16, v90);
            }
            while (v91);
          }
LABEL_143:

          goto LABEL_144;
        }
        uint64_t v17 = 0;
        uint64_t v16 = 0;
        goto LABEL_204;
      case 0xFLL:
        if (v10 == 54389)
        {
          objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
          uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = 0;
          uint64_t v19 = 651;
        }
        else
        {
          if (v10 != 54388) {
            goto LABEL_144;
          }
          objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
          uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = 0;
          uint64_t v19 = 650;
        }
        goto LABEL_204;
      case 0x10:
        switch(v10)
        {
          case 42188:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 702;
            break;
          case 42190:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 701;
            break;
          case 42189:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 700;
            break;
          default:
            goto LABEL_144;
        }
        goto LABEL_204;
      case 0x11:
        if (v10 != 53617) {
          goto LABEL_144;
        }
        objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
        uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = 0;
        uint64_t v19 = 750;
        goto LABEL_204;
      case 0x12:
        uint64_t v16 = 0;
        uint64_t v19 = 804;
        uint64_t v17 = 0;
        switch(v10)
        {
          case 7825:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 801;
            goto LABEL_204;
          case 7826:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 800;
            goto LABEL_204;
          case 7827:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 802;
            goto LABEL_204;
          case 7828:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 803;
            goto LABEL_204;
          case 7829:
            goto LABEL_206;
          case 7830:
            goto LABEL_132;
          default:
            goto LABEL_72;
        }
        goto LABEL_206;
      case 0x13:
        if (v10 == 13000)
        {
          objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
          uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = 0;
          uint64_t v19 = 851;
        }
        else
        {
          if (v10 != 12999) {
            goto LABEL_144;
          }
          objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
          uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = 0;
          uint64_t v19 = 850;
        }
        goto LABEL_204;
      case 0x14:
        if (v10 == 61513)
        {
          objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
          uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = 0;
          uint64_t v19 = 901;
        }
        else
        {
          if (v10 != 61512) {
            goto LABEL_144;
          }
          objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
          uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = 0;
          uint64_t v19 = 900;
        }
        goto LABEL_204;
      case 0x15:
        switch(v10)
        {
          case 27132:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 952;
            break;
          case 27131:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 951;
            break;
          case 27126:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 950;
            break;
          default:
            goto LABEL_144;
        }
        goto LABEL_204;
      case 0x16:
        if (v10 == 53605)
        {
          objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
          uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = 0;
          uint64_t v19 = 1000;
          goto LABEL_204;
        }
        if (v10 == 53604)
        {
          objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
          uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = 0;
          uint64_t v19 = 1001;
          goto LABEL_204;
        }
LABEL_144:
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        goto LABEL_206;
      case 0x17:
        switch(v10)
        {
          case 62159:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 1050;
            goto LABEL_204;
          case 62160:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 1051;
            goto LABEL_204;
          case 62161:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 1052;
            goto LABEL_204;
          case 62162:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 1054;
            goto LABEL_204;
          case 62163:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 1053;
            goto LABEL_204;
          case 62164:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 1055;
            goto LABEL_204;
          default:
            goto LABEL_144;
        }
      case 0x18:
        uint64_t v16 = 0;
        uint64_t v19 = 1102;
        uint64_t v17 = 0;
        switch(v10)
        {
          case 47347:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 1103;
            goto LABEL_204;
          case 47348:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 1104;
            goto LABEL_204;
          case 47349:
            uint64_t v19 = 1105;
            goto LABEL_132;
          case 47350:
          case 47351:
            goto LABEL_206;
          case 47352:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 1101;
            goto LABEL_204;
          case 47353:
            goto LABEL_132;
          case 47354:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 1100;
            goto LABEL_204;
          default:
            goto LABEL_72;
        }
        goto LABEL_206;
      case 0x19:
        uint64_t v16 = 0;
        uint64_t v19 = 1152;
        uint64_t v17 = 0;
        switch(v10)
        {
          case 42612:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 1150;
            goto LABEL_204;
          case 42613:
          case 42614:
          case 42615:
          case 42616:
            goto LABEL_206;
          case 42617:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 1153;
            goto LABEL_204;
          case 42618:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 1154;
            goto LABEL_204;
          case 42619:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 1155;
            goto LABEL_204;
          case 42620:
            uint64_t v19 = 1156;
            goto LABEL_132;
          case 42621:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 1151;
            goto LABEL_204;
          case 42622:
            goto LABEL_132;
          default:
            goto LABEL_72;
        }
        goto LABEL_206;
      case 0x1ALL:
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        switch(v10)
        {
          case 17035:
            uint64_t v30 = NSString;
            uint64_t v31 = objc_msgSend_uint64Value(v9, v11, v12, v13, v14, v15);
            objc_msgSend_stringWithFormat_(v30, v32, @"%llu", v33, v34, v35, v31);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 175;
            goto LABEL_204;
          case 17036:
          case 17040:
            goto LABEL_206;
          case 17037:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 170;
            goto LABEL_204;
          case 17038:
            __int16 v66 = NSString;
            uint64_t v67 = objc_msgSend_uint32Value(v9, v11, v12, v13, v14, v15);
            objc_msgSend_stringWithFormat_(v66, v68, @"%u", v69, v70, v71, v67);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 171;
            goto LABEL_204;
          case 17039:
            uint64_t v72 = NSString;
            uint64_t v73 = objc_msgSend_uint32Value(v9, v11, v12, v13, v14, v15);
            objc_msgSend_stringWithFormat_(v72, v74, @"%u", v75, v76, v77, v73);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 172;
            goto LABEL_204;
          case 17041:
            objc_msgSend_stringValueNoCopy(v9, v11, v12, v13, v14, v15);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 173;
            goto LABEL_204;
          case 17042:
            v78 = NSString;
            uint64_t v79 = objc_msgSend_uint32Value(v9, v11, v12, v13, v14, v15);
            objc_msgSend_stringWithFormat_(v78, v80, @"%u", v81, v82, v83, v79);
            uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = 0;
            uint64_t v19 = 174;
            goto LABEL_204;
          default:
LABEL_72:
            uint64_t v17 = 0;
            break;
        }
        goto LABEL_206;
      default:
        int v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v108 = *MEMORY[0x1E4F28228];
        uint64_t v21 = objc_msgSend_stringWithFormat_(NSString, v11, @"No supported conversion for Cascade item: %@", v13, v14, v15, a1[4]);
        v109[0] = v21;
        uint64_t v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v22, (uint64_t)v109, (uint64_t)&v108, 1, v23);
        uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_(v20, v25, @"com.apple.koa.item.converter", 4, (uint64_t)v24, v26);
        uint64_t v28 = *(void *)(a1[7] + 8);
        uint64_t v29 = *(void **)(v28 + 40);
        *(void *)(v28 + 40) = v27;

        uint64_t v16 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
        goto LABEL_206;
    }
  }
}

uint64_t sub_1BC3CA810(void *a1)
{
  id v1 = a1;
  unint64_t v7 = objc_msgSend_length(v1, v2, v3, v4, v5, v6);
  uint64_t v13 = objc_msgSend_length(@"_$!<", v8, v9, v10, v11, v12);
  if (v7 >= objc_msgSend_length(@">!$_", v14, v15, v16, v17, v18) + v13
    && objc_msgSend_hasPrefix_(v1, v19, @"_$!<", v20, v21, v22))
  {
    uint64_t hasSuffix = objc_msgSend_hasSuffix_(v1, v23, @">!$_", v24, v25, v26);
  }
  else
  {
    uint64_t hasSuffix = 0;
  }

  return hasSuffix;
}

void sub_1BC3CAD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 184), 8);
  _Block_object_dispose((const void *)(v36 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1BC3CAD8C(void *a1, void *a2)
{
  id v17 = a2;
  switch(objc_msgSend_fieldType(v17, v3, v4, v5, v6, v7))
  {
    case 170:
      uint64_t v13 = objc_msgSend_value(v17, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[4];
      goto LABEL_7;
    case 171:
      uint64_t v13 = objc_msgSend_value(v17, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[5];
      goto LABEL_7;
    case 172:
    case 174:
      uint64_t v13 = objc_msgSend_value(v17, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[6];
      goto LABEL_7;
    case 173:
      uint64_t v13 = objc_msgSend_value(v17, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[7];
      goto LABEL_7;
    case 175:
      uint64_t v13 = objc_msgSend_value(v17, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[8];
LABEL_7:
      uint64_t v15 = *(void *)(v14 + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v13;

      break;
    default:
      break;
  }
}

id sub_1BC3CAE88(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a2;
  id v6 = objc_alloc_init(v4);
  uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v7, @"Encountered Cascade error: %@ while converting KVItem: %@", v8, v9, v10, v3, v5);

  objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, *MEMORY[0x1E4F28228], v13, v14);
  if (v3) {
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v3, *MEMORY[0x1E4F28A50], v16, v17);
  }
  uint64_t v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v15, @"com.apple.koa.item.converter", 5, (uint64_t)v6, v17);

  return v18;
}

id sub_1BC3CAF78(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F57F98];
  id v9 = a2;
  id v10 = a1;
  id v11 = [v8 alloc];
  id v21 = 0;
  uint64_t v14 = objc_msgSend_initWithContent_metaContent_error_(v11, v12, (uint64_t)v10, (uint64_t)v9, (uint64_t)&v21, v13);

  id v15 = v21;
  uint64_t v16 = v15;
  if (v14)
  {
    id v17 = v14;
  }
  else
  {
    uint64_t v18 = sub_1BC3CAE88(v15, v7);
    uint64_t v19 = v18;
    if (a4 && v18) {
      *a4 = v18;
    }
  }
  return v14;
}

void sub_1BC3CB684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a70, 8);
  _Block_object_dispose((const void *)(v70 - 248), 8);
  _Block_object_dispose((const void *)(v70 - 200), 8);
  _Block_object_dispose((const void *)(v70 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1BC3CB714(void *a1)
{
  if (!*(void *)(*(void *)(a1[4] + 8) + 40)
    && !*(void *)(*(void *)(a1[5] + 8) + 40)
    && !*(void *)(*(void *)(a1[6] + 8) + 40)
    && !*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    return 1;
  }
  id v2 = objc_alloc(MEMORY[0x1E4F708C0]);
  uint64_t v3 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v4 = *(void *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v5 = *(void *)(*(void *)(a1[7] + 8) + 40);
  uint64_t v6 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v8 = objc_msgSend_initWithTitle_subtitle_synonyms_error_(v2, v7, v3, v4, v5, (uint64_t)&obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F708B8]);
    uint64_t v10 = *(void *)(*(void *)(a1[4] + 8) + 40);
    uint64_t v11 = *(void *)(a1[8] + 8);
    id v33 = *(id *)(v11 + 40);
    uint64_t v14 = objc_msgSend_initWithCaseIdentifier_displayRepresentation_error_(v9, v12, v10, (uint64_t)v8, (uint64_t)&v33, v13);
    objc_storeStrong((id *)(v11 + 40), v33);
    BOOL v19 = v14 != 0;
    if (v14)
    {
      uint64_t v20 = *(void **)(*(void *)(a1[9] + 8) + 40);
      if (!v20)
      {
        id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v22 = *(void *)(a1[9] + 8);
        uint64_t v23 = *(void **)(v22 + 40);
        *(void *)(v22 + 40) = v21;

        uint64_t v20 = *(void **)(*(void *)(a1[9] + 8) + 40);
      }
      objc_msgSend_addObject_(v20, v15, (uint64_t)v14, v16, v17, v18);
      uint64_t v24 = *(void *)(a1[4] + 8);
      uint64_t v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = 0;

      uint64_t v26 = *(void *)(a1[5] + 8);
      uint64_t v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = 0;

      uint64_t v28 = *(void *)(a1[6] + 8);
      uint64_t v29 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = 0;

      uint64_t v30 = *(void *)(a1[7] + 8);
      uint64_t v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

void sub_1BC3CB8D8(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v32 = a2;
  switch(objc_msgSend_fieldType(v32, v6, v7, v8, v9, v10))
  {
    case 1150:
      uint64_t v16 = objc_msgSend_value(v32, v11, v12, v13, v14, v15);
      uint64_t v17 = a1[5];
      goto LABEL_18;
    case 1151:
      uint64_t v16 = objc_msgSend_value(v32, v11, v12, v13, v14, v15);
      uint64_t v17 = a1[6];
      goto LABEL_18;
    case 1152:
      uint64_t v18 = *(void **)(*(void *)(a1[7] + 8) + 40);
      if (v18) {
        goto LABEL_22;
      }
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v20 = *(void *)(a1[7] + 8);
      id v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;

      uint64_t v22 = a1[7];
      goto LABEL_21;
    case 1153:
      if (*(void *)(*(void *)(a1[8] + 8) + 40) && ((*(uint64_t (**)(void))(a1[4] + 16))() & 1) == 0)
      {
        *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
        *a4 = 1;
      }
      uint64_t v16 = objc_msgSend_value(v32, v11, v12, v13, v14, v15);
      uint64_t v17 = a1[8];
      goto LABEL_18;
    case 1154:
      if (*(void *)(*(void *)(a1[10] + 8) + 40) && ((*(uint64_t (**)(void))(a1[4] + 16))() & 1) == 0)
      {
        *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
        *a4 = 1;
      }
      uint64_t v16 = objc_msgSend_value(v32, v11, v12, v13, v14, v15);
      uint64_t v17 = a1[10];
      goto LABEL_18;
    case 1155:
      if (*(void *)(*(void *)(a1[11] + 8) + 40) && ((*(uint64_t (**)(void))(a1[4] + 16))() & 1) == 0)
      {
        *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
        *a4 = 1;
      }
      uint64_t v16 = objc_msgSend_value(v32, v11, v12, v13, v14, v15);
      uint64_t v17 = a1[11];
LABEL_18:
      uint64_t v23 = *(void *)(v17 + 8);
      uint64_t v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v16;
      goto LABEL_23;
    case 1156:
      uint64_t v18 = *(void **)(*(void *)(a1[12] + 8) + 40);
      if (v18) {
        goto LABEL_22;
      }
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v26 = *(void *)(a1[12] + 8);
      uint64_t v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

      uint64_t v22 = a1[12];
LABEL_21:
      uint64_t v18 = *(void **)(*(void *)(v22 + 8) + 40);
LABEL_22:
      uint64_t v24 = objc_msgSend_value(v32, v11, v12, v13, v14, v15);
      objc_msgSend_addObject_(v18, v28, (uint64_t)v24, v29, v30, v31);
LABEL_23:

LABEL_24:

      return;
    default:
      goto LABEL_24;
  }
}

void sub_1BC3CBFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 224), 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Block_object_dispose((const void *)(v35 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1BC3CC024(void *a1, void *a2)
{
  id v29 = a2;
  switch(objc_msgSend_fieldType(v29, v3, v4, v5, v6, v7))
  {
    case 1100:
      uint64_t v13 = objc_msgSend_value(v29, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[4];
      goto LABEL_8;
    case 1101:
      uint64_t v13 = objc_msgSend_value(v29, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[5];
      goto LABEL_8;
    case 1102:
      uint64_t v15 = *(void **)(*(void *)(a1[6] + 8) + 40);
      if (v15) {
        goto LABEL_12;
      }
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v17 = *(void *)(a1[6] + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      uint64_t v19 = a1[6];
      goto LABEL_11;
    case 1103:
      uint64_t v13 = objc_msgSend_value(v29, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[7];
      goto LABEL_8;
    case 1104:
      uint64_t v13 = objc_msgSend_value(v29, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[8];
LABEL_8:
      uint64_t v20 = *(void *)(v14 + 8);
      id v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v13;
      goto LABEL_13;
    case 1105:
      uint64_t v15 = *(void **)(*(void *)(a1[9] + 8) + 40);
      if (v15) {
        goto LABEL_12;
      }
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v23 = *(void *)(a1[9] + 8);
      uint64_t v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

      uint64_t v19 = a1[9];
LABEL_11:
      uint64_t v15 = *(void **)(*(void *)(v19 + 8) + 40);
LABEL_12:
      id v21 = objc_msgSend_value(v29, v8, v9, v10, v11, v12);
      objc_msgSend_addObject_(v15, v25, (uint64_t)v21, v26, v27, v28);
LABEL_13:

LABEL_14:

      return;
    default:
      goto LABEL_14;
  }
}

void sub_1BC3CC55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 208), 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose((const void *)(v35 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BC3CC5B8(void *a1, void *a2)
{
  id v17 = a2;
  switch(objc_msgSend_fieldType(v17, v3, v4, v5, v6, v7))
  {
    case 1050:
      uint64_t v13 = objc_msgSend_value(v17, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[4];
      goto LABEL_8;
    case 1051:
      uint64_t v13 = objc_msgSend_value(v17, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[5];
      goto LABEL_8;
    case 1052:
      uint64_t v13 = objc_msgSend_value(v17, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[6];
      goto LABEL_8;
    case 1053:
      uint64_t v13 = objc_msgSend_value(v17, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[7];
      goto LABEL_8;
    case 1054:
      uint64_t v13 = objc_msgSend_value(v17, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[8];
      goto LABEL_8;
    case 1055:
      uint64_t v13 = objc_msgSend_value(v17, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[9];
LABEL_8:
      uint64_t v15 = *(void *)(v14 + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v13;

      break;
    default:
      break;
  }
}

void sub_1BC3CC938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1BC3CC964(uint64_t a1, void *a2)
{
  id v18 = a2;
  uint64_t v8 = objc_msgSend_fieldType(v18, v3, v4, v5, v6, v7);
  if (v8 == 1001)
  {
    uint64_t v14 = objc_msgSend_value(v18, v9, v10, v11, v12, v13);
    uint64_t v15 = *(void *)(a1 + 40);
  }
  else
  {
    if (v8 != 1000) {
      goto LABEL_6;
    }
    uint64_t v14 = objc_msgSend_value(v18, v9, v10, v11, v12, v13);
    uint64_t v15 = *(void *)(a1 + 32);
  }
  uint64_t v16 = *(void *)(v15 + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v14;

LABEL_6:
}

void sub_1BC3CCCF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1BC3CCD2C(void *a1, void *a2)
{
  id v18 = a2;
  uint64_t v8 = objc_msgSend_fieldType(v18, v3, v4, v5, v6, v7);
  switch(v8)
  {
    case 952:
      uint64_t v14 = objc_msgSend_value(v18, v9, v10, v11, v12, v13);
      uint64_t v15 = a1[6];
      break;
    case 951:
      uint64_t v14 = objc_msgSend_value(v18, v9, v10, v11, v12, v13);
      uint64_t v15 = a1[5];
      break;
    case 950:
      uint64_t v14 = objc_msgSend_value(v18, v9, v10, v11, v12, v13);
      uint64_t v15 = a1[4];
      break;
    default:
      goto LABEL_8;
  }
  uint64_t v16 = *(void *)(v15 + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v14;

LABEL_8:
}

void sub_1BC3CD044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1BC3CD070(uint64_t a1, void *a2)
{
  id v18 = a2;
  uint64_t v8 = objc_msgSend_fieldType(v18, v3, v4, v5, v6, v7);
  if (v8 == 901)
  {
    uint64_t v14 = objc_msgSend_value(v18, v9, v10, v11, v12, v13);
    uint64_t v15 = *(void *)(a1 + 40);
  }
  else
  {
    if (v8 != 900) {
      goto LABEL_6;
    }
    uint64_t v14 = objc_msgSend_value(v18, v9, v10, v11, v12, v13);
    uint64_t v15 = *(void *)(a1 + 32);
  }
  uint64_t v16 = *(void *)(v15 + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v14;

LABEL_6:
}

void sub_1BC3CD36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1BC3CD398(uint64_t a1, void *a2)
{
  id v18 = a2;
  uint64_t v8 = objc_msgSend_fieldType(v18, v3, v4, v5, v6, v7);
  if (v8 == 851)
  {
    uint64_t v14 = objc_msgSend_value(v18, v9, v10, v11, v12, v13);
    uint64_t v15 = *(void *)(a1 + 40);
  }
  else
  {
    if (v8 != 850) {
      goto LABEL_6;
    }
    uint64_t v14 = objc_msgSend_value(v18, v9, v10, v11, v12, v13);
    uint64_t v15 = *(void *)(a1 + 32);
  }
  uint64_t v16 = *(void *)(v15 + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v14;

LABEL_6:
}

void sub_1BC3CD644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BC3CD664(uint64_t a1, void *a2)
{
  id v16 = a2;
  if (objc_msgSend_fieldType(v16, v3, v4, v5, v6, v7) == 750)
  {
    uint64_t v13 = objc_msgSend_value(v16, v8, v9, v10, v11, v12);
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

void sub_1BC3CDA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BC3CDA3C(void *a1, void *a2)
{
  id v20 = a2;
  uint64_t v8 = objc_msgSend_fieldType(v20, v3, v4, v5, v6, v7);
  switch(v8)
  {
    case 702:
      uint64_t v14 = *(void *)(a1[4] + 8);
      int v15 = 2;
      break;
    case 701:
      uint64_t v16 = objc_msgSend_value(v20, v9, v10, v11, v12, v13);
      uint64_t v17 = a1[6];
      goto LABEL_8;
    case 700:
      uint64_t v14 = *(void *)(a1[4] + 8);
      int v15 = 1;
      break;
    default:
      goto LABEL_9;
  }
  *(_DWORD *)(v14 + 24) = v15;
  uint64_t v16 = objc_msgSend_value(v20, v9, v10, v11, v12, v13);
  uint64_t v17 = a1[5];
LABEL_8:
  uint64_t v18 = *(void *)(v17 + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v16;

LABEL_9:
}

void sub_1BC3CDD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1BC3CDD8C(uint64_t a1, void *a2)
{
  id v18 = a2;
  uint64_t v8 = objc_msgSend_fieldType(v18, v3, v4, v5, v6, v7);
  if (v8 == 651)
  {
    uint64_t v14 = objc_msgSend_value(v18, v9, v10, v11, v12, v13);
    uint64_t v15 = *(void *)(a1 + 40);
  }
  else
  {
    if (v8 != 650) {
      goto LABEL_6;
    }
    uint64_t v14 = objc_msgSend_value(v18, v9, v10, v11, v12, v13);
    uint64_t v15 = *(void *)(a1 + 32);
  }
  uint64_t v16 = *(void *)(v15 + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v14;

LABEL_6:
}

void sub_1BC3CE2A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v45 - 224), 8);
  _Block_object_dispose((const void *)(v45 - 176), 8);
  _Block_object_dispose((const void *)(v45 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1BC3CE31C(void *a1, void *a2)
{
  id v22 = a2;
  uint64_t v8 = objc_msgSend_fieldType(v22, v3, v4, v5, v6, v7);
  if (v8 == 552)
  {
    uint64_t v18 = *(void *)(a1[7] + 8);
    uint64_t v19 = *(void *)(v18 + 24);
    *(void *)(v18 + 24) = v19 + 1;
    if (v19 == 2)
    {
      uint64_t v16 = objc_msgSend_value(v22, v9, v10, v11, v12, v13);
      uint64_t v17 = a1[10];
    }
    else if (v19 == 1)
    {
      uint64_t v16 = objc_msgSend_value(v22, v9, v10, v11, v12, v13);
      uint64_t v17 = a1[9];
    }
    else if (v19)
    {
      uint64_t v16 = objc_msgSend_value(v22, v9, v10, v11, v12, v13);
      uint64_t v17 = a1[11];
    }
    else
    {
      uint64_t v16 = objc_msgSend_value(v22, v9, v10, v11, v12, v13);
      uint64_t v17 = a1[8];
    }
  }
  else
  {
    if (v8 != 551) {
      goto LABEL_14;
    }
    uint64_t v14 = *(void *)(a1[4] + 8);
    uint64_t v15 = *(void *)(v14 + 24);
    *(void *)(v14 + 24) = v15 + 1;
    uint64_t v16 = objc_msgSend_value(v22, v9, v10, v11, v12, v13);
    if (v15) {
      uint64_t v17 = a1[6];
    }
    else {
      uint64_t v17 = a1[5];
    }
  }
  uint64_t v20 = *(void *)(v17 + 8);
  id v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v16;

LABEL_14:
}

void sub_1BC3CE770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BC3CE7C0(void *a1, void *a2)
{
  id v34 = a2;
  switch(objc_msgSend_fieldType(v34, v3, v4, v5, v6, v7))
  {
    case 351:
      uint64_t v13 = objc_msgSend_value(v34, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[4];
      goto LABEL_8;
    case 352:
      uint64_t v13 = objc_msgSend_value(v34, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[5];
      goto LABEL_8;
    case 353:
      uint64_t v13 = objc_msgSend_value(v34, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[6];
      goto LABEL_8;
    case 354:
      uint64_t v13 = objc_msgSend_value(v34, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[7];
LABEL_8:
      uint64_t v25 = *(void *)(v14 + 8);
      id v15 = *(id *)(v25 + 40);
      *(void *)(v25 + 40) = v13;
      goto LABEL_17;
    case 355:
      objc_msgSend_value(v34, v8, v9, v10, v11, v12);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToString_(v15, v16, @"common_RadioBand_AM", v17, v18, v19))
      {
        int v24 = 1;
      }
      else if (objc_msgSend_isEqualToString_(v15, v20, @"common_RadioBand_FM", v21, v22, v23))
      {
        int v24 = 2;
      }
      else if (objc_msgSend_isEqualToString_(v15, v26, @"common_RadioBand_XM", v27, v28, v29))
      {
        int v24 = 3;
      }
      else if (objc_msgSend_isEqualToString_(v15, v30, @"common_RadioBand_DAB", v31, v32, v33))
      {
        int v24 = 4;
      }
      else
      {
        int v24 = 0;
      }

      *(_DWORD *)(*(void *)(a1[8] + 8) + 24) = v24;
LABEL_17:

      break;
    default:
      break;
  }
}

void sub_1BC3CECA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Block_object_dispose((const void *)(v33 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BC3CECF8(void *a1, void *a2)
{
  id v25 = a2;
  switch(objc_msgSend_fieldType(v25, v3, v4, v5, v6, v7))
  {
    case 800:
      uint64_t v13 = objc_msgSend_value(v25, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[5];
      goto LABEL_6;
    case 801:
      uint64_t v13 = objc_msgSend_value(v25, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[4];
      goto LABEL_6;
    case 802:
      uint64_t v13 = objc_msgSend_value(v25, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[6];
      goto LABEL_6;
    case 803:
      uint64_t v13 = objc_msgSend_value(v25, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[7];
LABEL_6:
      uint64_t v15 = *(void *)(v14 + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v13;
      goto LABEL_7;
    case 804:
      uint64_t v17 = *(void **)(*(void *)(a1[8] + 8) + 40);
      if (!v17)
      {
        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v19 = *(void *)(a1[8] + 8);
        uint64_t v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;

        uint64_t v17 = *(void **)(*(void *)(a1[8] + 8) + 40);
      }
      uint64_t v16 = objc_msgSend_value(v25, v8, v9, v10, v11, v12);
      objc_msgSend_addObject_(v17, v21, (uint64_t)v16, v22, v23, v24);
LABEL_7:

      break;
    default:
      break;
  }
}

void sub_1BC3CF0FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BC3CF134(void *a1, void *a2)
{
  id v18 = a2;
  uint64_t v8 = objc_msgSend_fieldType(v18, v3, v4, v5, v6, v7);
  switch(v8)
  {
    case 302:
      uint64_t v14 = objc_msgSend_value(v18, v9, v10, v11, v12, v13);
      uint64_t v15 = a1[6];
      break;
    case 301:
      uint64_t v14 = objc_msgSend_value(v18, v9, v10, v11, v12, v13);
      uint64_t v15 = a1[5];
      break;
    case 300:
      uint64_t v14 = objc_msgSend_value(v18, v9, v10, v11, v12, v13);
      uint64_t v15 = a1[4];
      break;
    default:
      goto LABEL_8;
  }
  uint64_t v16 = *(void *)(v15 + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v14;

LABEL_8:
}

void sub_1BC3CF5A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 208), 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Unwind_Resume(a1);
}

BOOL sub_1BC3CF5F0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F70AA0];
  id v6 = a3;
  id v7 = [v5 alloc];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v11 = objc_msgSend_initWithSourceItemIdentifier_type_error_(v7, v9, (uint64_t)v6, a2, (uint64_t)&obj, v10);

  objc_storeStrong((id *)(v8 + 40), obj);
  if (v11)
  {
    uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v16)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend_addObject_(v16, v12, (uint64_t)v11, v13, v14, v15);
  }

  return v11 != 0;
}

void sub_1BC3CF6C8(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  switch(objc_msgSend_fieldType(v6, v7, v8, v9, v10, v11))
  {
    case 201:
      uint64_t v17 = a1[4];
      uint64_t v18 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      LOBYTE(v17) = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v17 + 16))(v17, 1, v18);

      if ((v17 & 1) == 0)
      {
        *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
        *a4 = 1;
      }
      break;
    case 202:
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 1;
      id v96 = objc_alloc(MEMORY[0x1E4F70A78]);
      uint64_t v28 = objc_msgSend_value(v6, v97, v98, v99, v100, v101);
      uint64_t v102 = *(void *)(a1[8] + 8);
      long long v103 = *(void **)(v102 + 40);
      uint64_t v30 = (id *)(v102 + 40);
      v182 = v103;
      uint64_t v35 = objc_msgSend_initWithName_error_(v96, v104, (uint64_t)v28, (uint64_t)&v182, v105, v106);
      id v36 = v182;
      goto LABEL_26;
    case 203:
      uint64_t v19 = a1[4];
      uint64_t v20 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      char v21 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v19 + 16))(v19, 3, v20);
      goto LABEL_28;
    case 204:
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 3;
      id v107 = objc_alloc(MEMORY[0x1E4F70A70]);
      uint64_t v28 = objc_msgSend_value(v6, v108, v109, v110, v111, v112);
      uint64_t v113 = *(void *)(a1[8] + 8);
      v114 = *(void **)(v113 + 40);
      uint64_t v30 = (id *)(v113 + 40);
      v181 = v114;
      uint64_t v35 = objc_msgSend_initWithName_error_(v107, v115, (uint64_t)v28, (uint64_t)&v181, v116, v117);
      id v36 = v181;
      goto LABEL_26;
    case 205:
      uint64_t v118 = a1[4];
      uint64_t v20 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      char v21 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v118 + 16))(v118, 11, v20);
      goto LABEL_28;
    case 206:
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 11;
      id v22 = objc_alloc(MEMORY[0x1E4F70A88]);
      uint64_t v28 = objc_msgSend_value(v6, v23, v24, v25, v26, v27);
      uint64_t v29 = *(void *)(a1[8] + 8);
      uint64_t v31 = *(void **)(v29 + 40);
      uint64_t v30 = (id *)(v29 + 40);
      v180 = v31;
      uint64_t v35 = objc_msgSend_initWithName_error_(v22, v32, (uint64_t)v28, (uint64_t)&v180, v33, v34);
      id v36 = v180;
      goto LABEL_26;
    case 207:
      uint64_t v119 = a1[4];
      uint64_t v20 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      char v21 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v119 + 16))(v119, 12, v20);
      goto LABEL_28;
    case 208:
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 12;
      id v120 = objc_alloc(MEMORY[0x1E4F70A80]);
      uint64_t v28 = objc_msgSend_value(v6, v121, v122, v123, v124, v125);
      uint64_t v126 = *(void *)(a1[8] + 8);
      v127 = *(void **)(v126 + 40);
      uint64_t v30 = (id *)(v126 + 40);
      v179 = v127;
      uint64_t v35 = objc_msgSend_initWithName_error_(v120, v128, (uint64_t)v28, (uint64_t)&v179, v129, v130);
      id v36 = v179;
      goto LABEL_26;
    case 209:
      uint64_t v131 = a1[4];
      uint64_t v20 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      char v21 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v131 + 16))(v131, 4, v20);
      goto LABEL_28;
    case 210:
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 4;
      id v132 = objc_alloc(MEMORY[0x1E4F70A98]);
      uint64_t v28 = objc_msgSend_value(v6, v133, v134, v135, v136, v137);
      uint64_t v138 = *(void *)(a1[8] + 8);
      v139 = *(void **)(v138 + 40);
      uint64_t v30 = (id *)(v138 + 40);
      v178 = v139;
      uint64_t v35 = objc_msgSend_initWithName_error_(v132, v140, (uint64_t)v28, (uint64_t)&v178, v141, v142);
      id v36 = v178;
      goto LABEL_26;
    case 211:
      uint64_t v37 = a1[4];
      uint64_t v20 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      char v21 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v37 + 16))(v37, 10, v20);
      goto LABEL_28;
    case 212:
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 10;
      id v38 = objc_alloc(MEMORY[0x1E4F70AB0]);
      uint64_t v28 = objc_msgSend_value(v6, v39, v40, v41, v42, v43);
      uint64_t v44 = *(void *)(a1[8] + 8);
      uint64_t v45 = *(void **)(v44 + 40);
      uint64_t v30 = (id *)(v44 + 40);
      v177 = v45;
      uint64_t v35 = objc_msgSend_initWithName_error_(v38, v46, (uint64_t)v28, (uint64_t)&v177, v47, v48);
      id v36 = v177;
      goto LABEL_26;
    case 213:
      uint64_t v49 = a1[4];
      uint64_t v20 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      char v21 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v49 + 16))(v49, 7, v20);
      goto LABEL_28;
    case 214:
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 7;
      id v50 = objc_alloc(MEMORY[0x1E4F70AB8]);
      uint64_t v28 = objc_msgSend_value(v6, v51, v52, v53, v54, v55);
      uint64_t v56 = *(void *)(a1[8] + 8);
      uint64_t v57 = *(void **)(v56 + 40);
      uint64_t v30 = (id *)(v56 + 40);
      v176 = v57;
      uint64_t v35 = objc_msgSend_initWithName_error_(v50, v58, (uint64_t)v28, (uint64_t)&v176, v59, v60);
      id v36 = v176;
      goto LABEL_26;
    case 215:
      uint64_t v143 = a1[4];
      uint64_t v20 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      char v21 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v143 + 16))(v143, 6, v20);
      goto LABEL_28;
    case 216:
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 6;
      id v144 = objc_alloc(MEMORY[0x1E4F70AC0]);
      uint64_t v28 = objc_msgSend_value(v6, v145, v146, v147, v148, v149);
      uint64_t v150 = *(void *)(a1[8] + 8);
      v151 = *(void **)(v150 + 40);
      uint64_t v30 = (id *)(v150 + 40);
      v175 = v151;
      uint64_t v35 = objc_msgSend_initWithName_error_(v144, v152, (uint64_t)v28, (uint64_t)&v175, v153, v154);
      id v36 = v175;
      goto LABEL_26;
    case 225:
      uint64_t v155 = a1[4];
      uint64_t v20 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      char v21 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v155 + 16))(v155, 2, v20);
      goto LABEL_28;
    case 226:
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 2;
      id v156 = objc_alloc(MEMORY[0x1E4F70AD0]);
      uint64_t v28 = objc_msgSend_value(v6, v157, v158, v159, v160, v161);
      uint64_t v162 = *(void *)(a1[8] + 8);
      v163 = *(void **)(v162 + 40);
      uint64_t v30 = (id *)(v162 + 40);
      id obj = v163;
      uint64_t v35 = objc_msgSend_initWithName_error_(v156, v164, (uint64_t)v28, (uint64_t)&obj, v165, v166);
      id v36 = obj;
      goto LABEL_26;
    case 227:
      uint64_t v61 = a1[4];
      uint64_t v20 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      char v21 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v61 + 16))(v61, 5, v20);
      goto LABEL_28;
    case 228:
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 5;
      id v62 = objc_alloc(MEMORY[0x1E4F70AC8]);
      uint64_t v28 = objc_msgSend_value(v6, v63, v64, v65, v66, v67);
      uint64_t v68 = *(void *)(a1[8] + 8);
      uint64_t v69 = *(void **)(v68 + 40);
      uint64_t v30 = (id *)(v68 + 40);
      v173 = v69;
      uint64_t v35 = objc_msgSend_initWithName_error_(v62, v70, (uint64_t)v28, (uint64_t)&v173, v71, v72);
      id v36 = v173;
      goto LABEL_26;
    case 229:
      uint64_t v169 = a1[4];
      uint64_t v20 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      char v21 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v169 + 16))(v169, 9, v20);
      goto LABEL_28;
    case 230:
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 9;
      id v73 = objc_alloc(MEMORY[0x1E4F70AD8]);
      uint64_t v28 = objc_msgSend_value(v6, v74, v75, v76, v77, v78);
      uint64_t v79 = *(void *)(a1[8] + 8);
      uint64_t v80 = *(void **)(v79 + 40);
      uint64_t v30 = (id *)(v79 + 40);
      v172 = v80;
      uint64_t v35 = objc_msgSend_initWithName_error_(v73, v81, (uint64_t)v28, (uint64_t)&v172, v82, v83);
      id v36 = v172;
      goto LABEL_26;
    case 231:
      uint64_t v84 = a1[4];
      uint64_t v20 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      char v21 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v84 + 16))(v84, 8, v20);
LABEL_28:
      char v170 = v21;

      if ((v170 & 1) == 0)
      {
        *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
        *a4 = 1;
      }
      break;
    case 232:
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 8;
      id v85 = objc_alloc(MEMORY[0x1E4F70AE0]);
      uint64_t v28 = objc_msgSend_value(v6, v86, v87, v88, v89, v90);
      uint64_t v91 = *(void *)(a1[8] + 8);
      uint64_t v92 = *(void **)(v91 + 40);
      uint64_t v30 = (id *)(v91 + 40);
      v171 = v92;
      uint64_t v35 = objc_msgSend_initWithName_error_(v85, v93, (uint64_t)v28, (uint64_t)&v171, v94, v95);
      id v36 = v171;
LABEL_26:
      objc_storeStrong(v30, v36);
      uint64_t v167 = *(void *)(a1[7] + 8);
      v168 = *(void **)(v167 + 40);
      *(void *)(v167 + 40) = v35;

      break;
    default:
      break;
  }
}

void sub_1BC3D0150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BC3D0194(void *a1, void *a2)
{
  id v3 = a2;
  switch(objc_msgSend_fieldType(v3, v4, v5, v6, v7, v8))
  {
    case 150:
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = 1;
      id v14 = objc_alloc(MEMORY[0x1E4F709F0]);
      uint64_t v20 = objc_msgSend_value(v3, v15, v16, v17, v18, v19);
      uint64_t v21 = *(void *)(a1[6] + 8);
      uint64_t v23 = *(void **)(v21 + 40);
      id v22 = (id *)(v21 + 40);
      uint64_t v116 = v23;
      uint64_t v27 = objc_msgSend_initWithName_error_(v14, v24, (uint64_t)v20, (uint64_t)&v116, v25, v26);
      id v28 = v116;
      goto LABEL_10;
    case 151:
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = 2;
      id v29 = objc_alloc(MEMORY[0x1E4F70A58]);
      uint64_t v20 = objc_msgSend_value(v3, v30, v31, v32, v33, v34);
      uint64_t v35 = *(void *)(a1[6] + 8);
      id v36 = *(void **)(v35 + 40);
      id v22 = (id *)(v35 + 40);
      v115 = v36;
      uint64_t v27 = objc_msgSend_initWithName_error_(v29, v37, (uint64_t)v20, (uint64_t)&v115, v38, v39);
      id v28 = v115;
      goto LABEL_10;
    case 152:
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = 3;
      id v40 = objc_alloc(MEMORY[0x1E4F70A10]);
      uint64_t v20 = objc_msgSend_value(v3, v41, v42, v43, v44, v45);
      uint64_t v46 = *(void *)(a1[6] + 8);
      uint64_t v47 = *(void **)(v46 + 40);
      id v22 = (id *)(v46 + 40);
      v114 = v47;
      uint64_t v27 = objc_msgSend_initWithName_error_(v40, v48, (uint64_t)v20, (uint64_t)&v114, v49, v50);
      id v28 = v114;
      goto LABEL_10;
    case 153:
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = 4;
      id v51 = objc_alloc(MEMORY[0x1E4F70A20]);
      uint64_t v20 = objc_msgSend_value(v3, v52, v53, v54, v55, v56);
      uint64_t v57 = *(void *)(a1[6] + 8);
      uint64_t v58 = *(void **)(v57 + 40);
      id v22 = (id *)(v57 + 40);
      uint64_t v113 = v58;
      uint64_t v27 = objc_msgSend_initWithName_deviceType_error_(v51, v59, (uint64_t)v20, 0, (uint64_t)&v113, v60);
      id v28 = v113;
      goto LABEL_10;
    case 154:
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = 5;
      id v61 = objc_alloc(MEMORY[0x1E4F70A48]);
      uint64_t v20 = objc_msgSend_value(v3, v62, v63, v64, v65, v66);
      uint64_t v67 = *(void *)(a1[6] + 8);
      uint64_t v68 = *(void **)(v67 + 40);
      id v22 = (id *)(v67 + 40);
      uint64_t v112 = v68;
      uint64_t v27 = objc_msgSend_initWithName_error_(v61, v69, (uint64_t)v20, (uint64_t)&v112, v70, v71);
      id v28 = v112;
      goto LABEL_10;
    case 155:
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = 6;
      id v72 = objc_alloc(MEMORY[0x1E4F70A18]);
      uint64_t v20 = objc_msgSend_value(v3, v73, v74, v75, v76, v77);
      uint64_t v78 = *(void *)(a1[6] + 8);
      uint64_t v79 = *(void **)(v78 + 40);
      id v22 = (id *)(v78 + 40);
      uint64_t v111 = v79;
      uint64_t v27 = objc_msgSend_initWithName_error_(v72, v80, (uint64_t)v20, (uint64_t)&v111, v81, v82);
      id v28 = v111;
      goto LABEL_10;
    case 156:
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = 7;
      id v83 = objc_alloc(MEMORY[0x1E4F70A50]);
      uint64_t v20 = objc_msgSend_value(v3, v84, v85, v86, v87, v88);
      uint64_t v89 = *(void *)(a1[6] + 8);
      uint64_t v90 = *(void **)(v89 + 40);
      id v22 = (id *)(v89 + 40);
      uint64_t v110 = v90;
      uint64_t v27 = objc_msgSend_initWithName_error_(v83, v91, (uint64_t)v20, (uint64_t)&v110, v92, v93);
      id v28 = v110;
      goto LABEL_10;
    case 157:
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = 8;
      id v94 = objc_alloc(MEMORY[0x1E4F709F8]);
      uint64_t v20 = objc_msgSend_value(v3, v95, v96, v97, v98, v99);
      uint64_t v100 = *(void *)(a1[6] + 8);
      uint64_t v101 = *(void **)(v100 + 40);
      id v22 = (id *)(v100 + 40);
      id obj = v101;
      uint64_t v27 = objc_msgSend_initWithName_deviceType_error_(v94, v102, (uint64_t)v20, 0, (uint64_t)&obj, v103);
      id v28 = obj;
LABEL_10:
      objc_storeStrong(v22, v28);
      uint64_t v104 = *(void *)(a1[5] + 8);
      uint64_t v105 = *(void **)(v104 + 40);
      *(void *)(v104 + 40) = v27;

      break;
    case 158:
      uint64_t v106 = objc_msgSend_value(v3, v9, v10, v11, v12, v13);
      uint64_t v107 = *(void *)(a1[7] + 8);
      uint64_t v108 = *(void **)(v107 + 40);
      *(void *)(v107 + 40) = v106;

      break;
    default:
      break;
  }
}

void sub_1BC3D08CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose((const void *)(v35 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BC3D091C(void *a1, void *a2)
{
  id v25 = a2;
  switch(objc_msgSend_fieldType(v25, v3, v4, v5, v6, v7))
  {
    case 'd':
      uint64_t v13 = objc_msgSend_value(v25, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[4];
      goto LABEL_6;
    case 'e':
      uint64_t v13 = objc_msgSend_value(v25, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[5];
      goto LABEL_6;
    case 'f':
      uint64_t v13 = objc_msgSend_value(v25, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[6];
      goto LABEL_6;
    case 'g':
      uint64_t v13 = objc_msgSend_value(v25, v8, v9, v10, v11, v12);
      uint64_t v14 = a1[7];
LABEL_6:
      uint64_t v15 = *(void *)(v14 + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v13;
      goto LABEL_7;
    case 'h':
      uint64_t v17 = *(void **)(*(void *)(a1[8] + 8) + 40);
      if (!v17)
      {
        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v19 = *(void *)(a1[8] + 8);
        uint64_t v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;

        uint64_t v17 = *(void **)(*(void *)(a1[8] + 8) + 40);
      }
      uint64_t v16 = objc_msgSend_value(v25, v8, v9, v10, v11, v12);
      objc_msgSend_addObject_(v17, v21, (uint64_t)v16, v22, v23, v24);
LABEL_7:

      break;
    default:
      break;
  }
}

void sub_1BC3D146C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose(&STACK[0x268], 8);
  _Block_object_dispose(&STACK[0x298], 8);
  _Block_object_dispose(&STACK[0x2C8], 8);
  _Block_object_dispose(&STACK[0x2F8], 8);
  _Block_object_dispose(&STACK[0x328], 8);
  _Block_object_dispose(&STACK[0x358], 8);
  _Block_object_dispose(&STACK[0x388], 8);
  _Block_object_dispose(&STACK[0x3B8], 8);
  _Block_object_dispose(&STACK[0x3E8], 8);
  _Block_object_dispose(&STACK[0x418], 8);
  _Block_object_dispose(&STACK[0x448], 8);
  _Block_object_dispose(&STACK[0x478], 8);
  _Block_object_dispose(&STACK[0x4A8], 8);
  _Block_object_dispose(&STACK[0x4D8], 8);
  _Block_object_dispose(&STACK[0x508], 8);
  _Block_object_dispose((const void *)(v68 - 232), 8);
  _Block_object_dispose((const void *)(v68 - 184), 8);
  _Block_object_dispose((const void *)(v68 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1BC3D1594(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  switch(objc_msgSend_fieldType(v6, v7, v8, v9, v10, v11))
  {
    case '2':
      uint64_t v17 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      uint64_t v18 = a1[4];
      goto LABEL_41;
    case '3':
      uint64_t v17 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      uint64_t v18 = a1[5];
      goto LABEL_41;
    case '4':
      uint64_t v17 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      uint64_t v18 = a1[6];
      goto LABEL_41;
    case '5':
      uint64_t v17 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      uint64_t v18 = a1[7];
      goto LABEL_41;
    case '6':
      uint64_t v17 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      uint64_t v18 = a1[8];
      goto LABEL_41;
    case '7':
      uint64_t v17 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      uint64_t v18 = a1[9];
      goto LABEL_41;
    case '8':
      uint64_t v17 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      uint64_t v18 = a1[10];
      goto LABEL_41;
    case '9':
      id v19 = objc_alloc(MEMORY[0x1E4F70990]);
      id v25 = objc_msgSend_label(v6, v20, v21, v22, v23, v24);
      uint64_t v26 = *(void *)(a1[11] + 8);
      id v128 = *(id *)(v26 + 40);
      id v29 = objc_msgSend_initWithLabel_stringValue_error_(v19, v27, (uint64_t)v25, 0, (uint64_t)&v128, v28);
      objc_storeStrong((id *)(v26 + 40), v128);

      if (!v29) {
        goto LABEL_32;
      }
      uint64_t v34 = *(void **)(*(void *)(a1[13] + 8) + 40);
      if (v34) {
        goto LABEL_31;
      }
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v36 = *(void *)(a1[13] + 8);
      uint64_t v37 = *(void **)(v36 + 40);
      *(void *)(v36 + 40) = v35;

      uint64_t v38 = a1[13];
      goto LABEL_30;
    case ':':
      id v39 = objc_alloc(MEMORY[0x1E4F70978]);
      uint64_t v45 = objc_msgSend_label(v6, v40, v41, v42, v43, v44);
      uint64_t v46 = *(void *)(a1[11] + 8);
      id obj = *(id *)(v46 + 40);
      id v29 = objc_msgSend_initWithLabel_email_error_(v39, v47, (uint64_t)v45, 0, (uint64_t)&obj, v48);
      objc_storeStrong((id *)(v46 + 40), obj);

      if (!v29) {
        goto LABEL_32;
      }
      uint64_t v34 = *(void **)(*(void *)(a1[14] + 8) + 40);
      if (v34) {
        goto LABEL_31;
      }
      id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v50 = *(void *)(a1[14] + 8);
      id v51 = *(void **)(v50 + 40);
      *(void *)(v50 + 40) = v49;

      uint64_t v38 = a1[14];
      goto LABEL_30;
    case ';':
      id v52 = objc_alloc(MEMORY[0x1E4F70998]);
      uint64_t v58 = objc_msgSend_label(v6, v53, v54, v55, v56, v57);
      uint64_t v59 = *(void *)(a1[11] + 8);
      id v126 = *(id *)(v59 + 40);
      id v29 = objc_msgSend_initWithLabel_street_subLocality_city_subAdministrativeArea_state_postalCode_country_ISOCountryCode_error_(v52, v60, (uint64_t)v58, 0, 0, 0, 0, 0, 0, 0, 0, &v126);
      objc_storeStrong((id *)(v59 + 40), v126);

      if (!v29) {
        goto LABEL_32;
      }
      uint64_t v34 = *(void **)(*(void *)(a1[15] + 8) + 40);
      if (v34) {
        goto LABEL_31;
      }
      id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v62 = *(void *)(a1[15] + 8);
      uint64_t v63 = *(void **)(v62 + 40);
      *(void *)(v62 + 40) = v61;

      uint64_t v38 = a1[15];
      goto LABEL_30;
    case '<':
      id v64 = objc_alloc(MEMORY[0x1E4F709B0]);
      uint64_t v70 = objc_msgSend_label(v6, v65, v66, v67, v68, v69);
      uint64_t v71 = *(void *)(a1[11] + 8);
      id v125 = *(id *)(v71 + 40);
      id v29 = objc_msgSend_initWithLabel_url_error_(v64, v72, (uint64_t)v70, 0, (uint64_t)&v125, v73);
      objc_storeStrong((id *)(v71 + 40), v125);

      if (!v29) {
        goto LABEL_32;
      }
      uint64_t v34 = *(void **)(*(void *)(a1[16] + 8) + 40);
      if (v34) {
        goto LABEL_31;
      }
      id v74 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v75 = *(void *)(a1[16] + 8);
      uint64_t v76 = *(void **)(v75 + 40);
      *(void *)(v75 + 40) = v74;

      uint64_t v38 = a1[16];
      goto LABEL_30;
    case '=':
      id v77 = objc_alloc(MEMORY[0x1E4F709A8]);
      id v83 = objc_msgSend_label(v6, v78, v79, v80, v81, v82);
      uint64_t v84 = *(void *)(a1[11] + 8);
      id v124 = *(id *)(v84 + 40);
      id v29 = objc_msgSend_initWithLabel_urlString_username_userIdentifier_serviceName_error_(v77, v85, (uint64_t)v83, 0, 0, 0, 0, &v124);
      objc_storeStrong((id *)(v84 + 40), v124);

      if (!v29) {
        goto LABEL_32;
      }
      uint64_t v34 = *(void **)(*(void *)(a1[17] + 8) + 40);
      if (v34) {
        goto LABEL_31;
      }
      id v86 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v87 = *(void *)(a1[17] + 8);
      uint64_t v88 = *(void **)(v87 + 40);
      *(void *)(v87 + 40) = v86;

      uint64_t v38 = a1[17];
      goto LABEL_30;
    case '>':
      id v89 = objc_alloc(MEMORY[0x1E4F70980]);
      uint64_t v95 = objc_msgSend_label(v6, v90, v91, v92, v93, v94);
      uint64_t v96 = *(void *)(a1[11] + 8);
      id v123 = *(id *)(v96 + 40);
      id v29 = objc_msgSend_initWithLabel_username_serviceName_error_(v89, v97, (uint64_t)v95, 0, 0, (uint64_t)&v123);
      objc_storeStrong((id *)(v96 + 40), v123);

      if (!v29) {
        goto LABEL_32;
      }
      uint64_t v34 = *(void **)(*(void *)(a1[18] + 8) + 40);
      if (v34) {
        goto LABEL_31;
      }
      id v98 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v99 = *(void *)(a1[18] + 8);
      uint64_t v100 = *(void **)(v99 + 40);
      *(void *)(v99 + 40) = v98;

      uint64_t v38 = a1[18];
      goto LABEL_30;
    case '?':
      id v101 = objc_alloc(MEMORY[0x1E4F709A0]);
      uint64_t v107 = objc_msgSend_label(v6, v102, v103, v104, v105, v106);
      uint64_t v113 = objc_msgSend_value(v6, v108, v109, v110, v111, v112);
      uint64_t v114 = *(void *)(a1[11] + 8);
      id v122 = *(id *)(v114 + 40);
      id v29 = objc_msgSend_initWithLabel_name_error_(v101, v115, (uint64_t)v107, (uint64_t)v113, (uint64_t)&v122, v116);
      objc_storeStrong((id *)(v114 + 40), v122);

      if (v29)
      {
        uint64_t v34 = *(void **)(*(void *)(a1[19] + 8) + 40);
        if (!v34)
        {
          id v117 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v118 = *(void *)(a1[19] + 8);
          uint64_t v119 = *(void **)(v118 + 40);
          *(void *)(v118 + 40) = v117;

          uint64_t v38 = a1[19];
LABEL_30:
          uint64_t v34 = *(void **)(*(void *)(v38 + 8) + 40);
        }
LABEL_31:
        objc_msgSend_addObject_(v34, v30, (uint64_t)v29, v31, v32, v33);
      }
      else
      {
LABEL_32:
        *(unsigned char *)(*(void *)(a1[12] + 8) + 24) = 1;
        *a4 = 1;
      }

LABEL_42:
      return;
    case '@':
      uint64_t v17 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      uint64_t v18 = a1[20];
      goto LABEL_41;
    case 'A':
      uint64_t v17 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      uint64_t v18 = a1[21];
      goto LABEL_41;
    case 'B':
      uint64_t v17 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      uint64_t v18 = a1[22];
      goto LABEL_41;
    case 'C':
      uint64_t v17 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      uint64_t v18 = a1[23];
      goto LABEL_41;
    case 'D':
      uint64_t v17 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      uint64_t v18 = a1[24];
      goto LABEL_41;
    case 'E':
      uint64_t v17 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      uint64_t v18 = a1[25];
      goto LABEL_41;
    case 'F':
      uint64_t v17 = objc_msgSend_value(v6, v12, v13, v14, v15, v16);
      uint64_t v18 = a1[26];
LABEL_41:
      uint64_t v120 = *(void *)(v18 + 8);
      v121 = *(void **)(v120 + 40);
      *(void *)(v120 + 40) = v17;

      goto LABEL_42;
    default:
      goto LABEL_42;
  }
}

void sub_1BC3D1F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1BC3D1FA8(void *a1, void *a2)
{
  id v19 = a2;
  switch(objc_msgSend_fieldType(v19, v3, v4, v5, v6, v7))
  {
    case 600:
    case 601:
    case 602:
    case 603:
    case 604:
      *(void *)(*(void *)(a1[4] + 8) + 24) = objc_opt_class();
      *(void *)(*(void *)(a1[5] + 8) + 24) = objc_opt_class();
      uint64_t v8 = *(void **)(*(void *)(a1[6] + 8) + 40);
      uint64_t v14 = objc_msgSend_value(v19, v9, v10, v11, v12, v13);
      objc_msgSend_addObject_(v8, v15, (uint64_t)v14, v16, v17, v18);

      break;
    default:
      break;
  }
}

void sub_1BC3D24B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 152), 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1BC3D2504(void *a1, void *a2)
{
  id v22 = a2;
  switch(objc_msgSend_fieldType(v22, v3, v4, v5, v6, v7))
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
      *(void *)(*(void *)(a1[4] + 8) + 24) = objc_opt_class();
      *(void *)(*(void *)(a1[5] + 8) + 24) = objc_opt_class();
      uint64_t v18 = objc_msgSend_value(v22, v13, v14, v15, v16, v17);
      uint64_t v19 = a1[6];
      goto LABEL_3;
    case 20:
      uint64_t v18 = objc_msgSend_value(v22, v8, v9, v10, v11, v12);
      uint64_t v19 = a1[7];
LABEL_3:
      uint64_t v20 = *(void *)(v19 + 8);
      uint64_t v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v18;

      break;
    default:
      break;
  }
}

BOOL KVIsEmptyOrWhitespace(void *a1)
{
  id v1 = a1;
  unint64_t v7 = objc_msgSend_length(v1, v2, v3, v4, v5, v6);
  uint64_t v17 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v8, v9, v10, v11, v12);
  if (v7)
  {
    uint64_t v18 = objc_msgSend_characterAtIndex_(v1, v13, 0, v14, v15, v16);
    if (objc_msgSend_characterIsMember_(v17, v19, v18, v20, v21, v22))
    {
      uint64_t v27 = 1;
      while (v7 != v27)
      {
        uint64_t v28 = objc_msgSend_characterAtIndex_(v1, v23, v27++, v24, v25, v26);
        if ((objc_msgSend_characterIsMember_(v17, v29, v28, v30, v31, v32) & 1) == 0)
        {
          unint64_t v33 = v27 - 1;
          goto LABEL_10;
        }
      }
      unint64_t v33 = v7;
LABEL_10:
      BOOL v34 = v33 >= v7;
    }
    else
    {
      BOOL v34 = 0;
    }
  }
  else
  {
    BOOL v34 = 1;
  }

  return v34;
}

void *KVSetError(void *result, id a2)
{
  if (result)
  {
    if (a2)
    {
      id v2 = result;
      uint64_t result = a2;
      void *v2 = result;
    }
  }
  return result;
}

void KVSetAndReportError(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = v3;
  if (a1 && v3) {
    *a1 = v3;
  }
  uint64_t v10 = objc_msgSend_domain(v9, v4, v5, v6, v7, v8);
  uint64_t v16 = objc_msgSend_length(v10, v11, v12, v13, v14, v15);

  if (v16)
  {
    id v17 = v9;
    AnalyticsSendEventLazy();
  }
}

id sub_1BC3D47FC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v59[4] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_underlyingErrors(*(void **)(a1 + 32), a2, a3, a4, a5, a6);
  uint64_t v13 = objc_msgSend_firstObject(v7, v8, v9, v10, v11, v12);

  uint64_t v19 = objc_msgSend_description(*(void **)(a1 + 32), v14, v15, v16, v17, v18);
  v58[0] = @"domain";
  uint64_t v25 = objc_msgSend_domain(*(void **)(a1 + 32), v20, v21, v22, v23, v24);
  v59[0] = v25;
  v58[1] = @"code";
  uint64_t v26 = NSNumber;
  uint64_t v32 = objc_msgSend_code(*(void **)(a1 + 32), v27, v28, v29, v30, v31);
  uint64_t v42 = objc_msgSend_numberWithInteger_(v26, v33, v32, v34, v35, v36);
  v59[1] = v42;
  v58[2] = @"underlyingCode";
  if (v13)
  {
    uint64_t v43 = NSNumber;
    uint64_t v44 = objc_msgSend_code(v13, v37, v38, v39, v40, v41);
    objc_msgSend_numberWithInteger_(v43, v45, v44, v46, v47, v48);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x1E4F1CA98], v37, v38, v39, v40, v41);
  uint64_t v54 = };
  v59[2] = v54;
  v58[3] = @"description";
  uint64_t v55 = v19;
  if (!v19)
  {
    uint64_t v55 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v49, v50, v51, v52, v53);
  }
  v59[3] = v55;
  uint64_t v56 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v49, (uint64_t)v59, (uint64_t)v58, 4, v53);
  if (!v19) {

  }
  return v56;
}

id KVHash64(void *a1)
{
  id v1 = a1;
  uint64_t v7 = v1;
  if (v1)
  {
    unsigned int v8 = objc_msgSend_length(v1, v2, v3, v4, v5, v6);
    id v9 = v7;
    uint64_t v15 = objc_msgSend_bytes(v9, v10, v11, v12, v13, v14);
    if (v8 >= 0x10)
    {
      unint64_t v20 = 0;
      uint64_t v21 = 0;
      do
      {
        unint64_t v23 = 0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69 * *(void *)(v15 + v20)) ^ ((0x9DDFEA08EB382D69 * *(void *)(v15 + v20)) >> 44));
        unint64_t v24 = 0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69 * *(void *)(v15 + v20 + 8)) ^ ((0x9DDFEA08EB382D69 * *(void *)(v15 + v20 + 8)) >> 44));
        v21 -= 0x622015F714C7D297 * ((v24 ^ (v24 >> 41)) + (v23 ^ (v23 >> 41)));
        v20 += 16;
      }
      while (v20 < (v8 & 0xFFFFFFF0));
    }
    else
    {
      LODWORD(v20) = 0;
      uint64_t v21 = 0;
    }
    if (v8 > v20) {
      __memcpy_chk();
    }
    uint64_t v22 = objc_msgSend_numberWithLongLong_(NSNumber, v16, v21, v17, v18, v19);
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

id KVHash64String(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = objc_msgSend_dataUsingEncoding_(a1, a2, 4, a4, a5, a6);
  uint64_t v7 = KVHash64(v6);

  return v7;
}

uint64_t KVScanHexString(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = 0;
  uint64_t v6 = objc_msgSend_scannerWithString_(MEMORY[0x1E4F28FE8], a2, a1, a4, a5, a6);
  objc_msgSend_scanHexLongLong_(v6, v7, (uint64_t)&v13, v8, v9, v10);
  uint64_t v11 = v13;

  return v11;
}

id KVConcatenateHash64(void *a1, void *a2)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v9 = objc_msgSend_longLongValue(a1, v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_longLongValue(v3, v10, v11, v12, v13, v14);

  v21[0] = v9;
  v21[1] = v15;
  uint64_t v19 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v16, (uint64_t)v21, 16, v17, v18);
  return v19;
}

id KVConcatenatedHash64Prefix(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4, v5, v6) == 16)
  {
    uint64_t v15 = 0;
    objc_msgSend_getBytes_range_(v1, v7, (uint64_t)&v15, 0, 8, v8);
    uint64_t v13 = objc_msgSend_numberWithLongLong_(NSNumber, v9, v15, v10, v11, v12);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

id KVConcatenatedHash64Suffix(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4, v5, v6) == 16)
  {
    uint64_t v15 = 0;
    objc_msgSend_getBytes_range_(v1, v7, (uint64_t)&v15, 8, 8, v8);
    uint64_t v13 = objc_msgSend_numberWithLongLong_(NSNumber, v9, v15, v10, v11, v12);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

id sub_1BC3D4D78(unsigned int a1)
{
  if (a1 >= 5)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    unsigned int v7 = 0;
    do
    {
      objc_msgSend_appendString_(v2, v3, @"  ", v4, v5, v6);
      ++v7;
    }
    while (v7 < a1);
  }
  else
  {
    id v2 = *(&off_1E62AD650 + a1);
  }
  return v2;
}

__CFString *sub_1BC3D4E00(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E4F28D90], a2, a1, 4, 0, a6);
  if (v6)
  {
    id v7 = [NSString alloc];
    uint64_t v11 = (__CFString *)objc_msgSend_initWithData_encoding_(v7, v8, (uint64_t)v6, 4, v9, v10);
  }
  else
  {
    uint64_t v11 = @"null";
    uint64_t v12 = @"null";
  }

  return v11;
}

void sub_1BC3D54DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1BC3D54F4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1EB5EE420)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = sub_1BC3D5648;
    v4[4] = &unk_1E62AD740;
    v4[5] = v4;
    long long v5 = xmmword_1E62AD678;
    uint64_t v6 = 0;
    qword_1EB5EE420 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!qword_1EB5EE420)
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
    Class result = objc_getClass("KMItemMapper");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_1EB5EE428 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1BC3D5648()
{
  uint64_t result = _sl_dlopen();
  qword_1EB5EE420 = result;
  return result;
}

uint64_t KVAdditionalFieldTypeFromNumber(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x1F4181798](a1, sel_intValue, a3, a4, a5, a6);
}

id sub_1BC3D5700(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  uint64_t v8 = objc_msgSend_formatOptions(v2, v3, v4, v5, v6, v7);
  objc_msgSend_setFormatOptions_(v2, v9, v8 | 0x800, v10, v11, v12);
  uint64_t v17 = objc_msgSend_stringFromDate_(v2, v13, a1, v14, v15, v16);

  return v17;
}

void sub_1BC3D59A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1BC3D59C0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!qword_1E9F97020)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = sub_1BC3D5B14;
    v4[4] = &unk_1E62AD740;
    v4[5] = v4;
    long long v5 = xmmword_1E62AD690;
    uint64_t v6 = 0;
    qword_1E9F97020 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!qword_1E9F97020)
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
    Class result = objc_getClass("SEMSpanMatchQueryBuilder");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_1E9F97018 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1BC3D5B14()
{
  uint64_t result = _sl_dlopen();
  qword_1E9F97020 = result;
  return result;
}

uint64_t sub_1BC3D5B88()
{
  qword_1EB5EE458 = (uint64_t)os_log_create("com.apple.siri.vocabulary", "Koa");
  return MEMORY[0x1F41817F8]();
}

void sub_1BC3D5C84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D5E24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D5F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D6040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D6144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D6208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D62DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D65F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D6748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D6814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D6B58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1BC3D6BB0()
{
  return 1;
}

void sub_1BC3D6C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D6D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D7034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D7358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D76C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D7A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D80EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D836C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1BC3D8388(unint64_t a1, void *a2, unsigned int *a3, int a4)
{
  id v7 = a2;
  objc_msgSend_buffer(v7, v8, v9, v10, v11, v12);
  id v13 = objc_claimAutoreleasedReturnValue();
  uint64_t v19 = (const void *)objc_msgSend_bytes(v13, v14, v15, v16, v17, v18);
  id v20 = v13;
  uint64_t v26 = objc_msgSend_bytes(v20, v21, v22, v23, v24, v25);
  uint64_t v32 = objc_msgSend_length(v20, v27, v28, v29, v30, v31);
  uint64_t v48 = 0;
  id v49 = 0;
  uint64_t v50 = 0;
  sub_1BC3D86E0(&v48, v19, v26 + v32, v26 + v32 - (void)v19);
  unint64_t v33 = v48;
  if (v49 == v48) {
    uint64_t v34 = &unk_1E9F97028;
  }
  else {
    uint64_t v34 = v48;
  }
  unsigned int v35 = sub_1BC3D8780((uint64_t *)a1, v34, v49 - v48);
  if (v33) {
    operator delete(v33);
  }
  sub_1BC3B8E08(a1);
  *(unsigned char *)(a1 + 70) = 1;
  int v36 = *(_DWORD *)(a1 + 32);
  int v37 = *(_DWORD *)(a1 + 48);
  int v38 = *(_DWORD *)(a1 + 40);
  sub_1BC3D87FC((_DWORD *)a1, v35);
  if (a3 && *a3)
  {
    int v39 = sub_1BC3B9838((_DWORD *)a1, *a3);
    sub_1BC3B9980(a1, 6, v39);
  }
  unsigned int v40 = sub_1BC3B8F6C(a1, v36 - v37 + v38);
  sub_1BC3B9208(a1, v40, "KPV2", a4);
  id v41 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v42 = sub_1BC3B930C(a1);
  uint64_t v46 = objc_msgSend_initWithBytes_length_(v41, v43, v42, (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40)), v44, v45);

  return v46;
}

void sub_1BC3D8528(_Unwind_Exception *a1)
{
  if (v3) {
    operator delete(v3);
  }

  _Unwind_Resume(a1);
}

void sub_1BC3D855C(void *a1, void *a2, void *a3, unsigned int a4)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  uint64_t v10 = NSString;
  uint64_t v16 = sub_1BC3C2E48(a4, v11, v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_stringWithFormat_(v10, v17, @"Failed to write %@ using format: %@ to stream %@", v18, v19, v20, v7, v16, v8, v29);
  v30[0] = v21;
  uint64_t v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v22, (uint64_t)v30, (uint64_t)&v29, 1, v23);
  uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_(v9, v25, @"com.apple.koa.profile", 4, (uint64_t)v24, v26);
  uint64_t v28 = v27;
  if (a1 && v27) {
    *a1 = v27;
  }
}

void sub_1BC3D86A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1BC3D86E0(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    long long v5 = result;
    if ((__sz & 0x8000000000000000) != 0) {
      sub_1BC3BF378();
    }
    uint64_t result = operator new(__sz);
    id v8 = (char *)result;
    void *v5 = result;
    v5[1] = result;
    v5[2] = (char *)result + __sz;
    size_t v9 = a3 - (void)a2;
    if (v9) {
      uint64_t result = memcpy(result, a2, v9);
    }
    v5[1] = &v8[v9];
  }
  return result;
}

void sub_1BC3D8764(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1BC3D8780(uint64_t *a1, const void *a2, unint64_t a3)
{
  sub_1BC3BEAD0((uint64_t)a1, a3, 1uLL);
  if (a3)
  {
    sub_1BC3B9660(a1, a3);
    uint64_t v6 = (void *)(a1[6] - a3);
    a1[6] = (uint64_t)v6;
    memcpy(v6, a2, a3);
  }
  return sub_1BC3BEB3C((uint64_t)a1, a3);
}

_DWORD *sub_1BC3D87FC(_DWORD *result, unsigned int a2)
{
  if (a2)
  {
    unint64_t v2 = (unint64_t)result;
    int v3 = sub_1BC3B9838(result, a2);
    return (_DWORD *)sub_1BC3B9980(v2, 4, v3);
  }
  return result;
}

void sub_1BC3D8AA4(_Unwind_Exception *a1)
{
  if (v2) {
    operator delete(v2);
  }

  _Unwind_Resume(a1);
}

void sub_1BC3D8CA4(_Unwind_Exception *a1)
{
  if (v3) {
    operator delete(v3);
  }

  _Unwind_Resume(a1);
}

void sub_1BC3D8D98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D8F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D90E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D924C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);

  sub_1BC3B9370((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1BC3D92F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D9428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D959C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D9900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D9BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D9DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3D9E8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3DA010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3DA694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3DA854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3DA9F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3DAACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3DAC80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3DAF78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3DB1F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3DB280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3DB6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BC3DB790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3DB85C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3DB9C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3DBAF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BC3DBDCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1BC3DC020()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2020000000;
  id v0 = (uint64_t (*)(void))off_1EB5EE448;
  id v7 = off_1EB5EE448;
  if (!off_1EB5EE448)
  {
    uint64_t v1 = (void *)sub_1BC3DC178();
    v5[3] = (uint64_t)dlsym(v1, "AFDeviceSupportsSiriUOD");
    off_1EB5EE448 = (_UNKNOWN *)v5[3];
    id v0 = (uint64_t (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    int v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return v0();
}

void *sub_1BC3DC128(uint64_t a1)
{
  unint64_t v2 = (void *)sub_1BC3DC178();
  uint64_t result = dlsym(v2, "AFOfflineDictationCapable");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1E9F97040 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1BC3DC178()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!qword_1EB5EE440)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = sub_1BC3DC288;
    v3[4] = &unk_1E62AD740;
    void v3[5] = v3;
    long long v4 = xmmword_1E62AD728;
    uint64_t v5 = 0;
    qword_1EB5EE440 = _sl_dlopen();
    uint64_t v1 = (void *)v3[0];
    uint64_t v0 = qword_1EB5EE440;
    if (qword_1EB5EE440)
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
  return qword_1EB5EE440;
}

uint64_t sub_1BC3DC288()
{
  uint64_t result = _sl_dlopen();
  qword_1EB5EE440 = result;
  return result;
}

void *sub_1BC3DC2FC(uint64_t a1)
{
  unint64_t v2 = (void *)sub_1BC3DC178();
  uint64_t result = dlsym(v2, "AFDeviceSupportsSiriUOD");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1EB5EE448 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1BC3DC454(uint64_t a1)
{
  unint64_t v2 = (void *)sub_1BC3DC178();
  uint64_t result = dlsym(v2, "AFDeviceSupportsSiriMUX");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1E9F97038 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1BC3DC5BC(uint64_t a1)
{
  unint64_t v2 = (void *)sub_1BC3DC178();
  uint64_t result = dlsym(v2, "AFShouldRunAsrOnServerForUOD");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1E9F97030 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_1BC3DC60C(void *a1)
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v7 = v1;
  if (!v1)
  {
    uint64_t v24 = 0;
    goto LABEL_22;
  }
  id v8 = objc_msgSend_domain(v1, v2, v3, v4, v5, v6);
  uint64_t v14 = objc_msgSend_code(v7, v9, v10, v11, v12, v13);
  if (objc_msgSend_isEqual_(v8, v15, *MEMORY[0x1E4F4FAD0], v16, v17, v18))
  {
    uint64_t v23 = 3;
  }
  else
  {
    if (objc_msgSend_isEqual_(v8, v19, *MEMORY[0x1E4F57F70], v20, v21, v22)) {
      BOOL v29 = v14 == 1;
    }
    else {
      BOOL v29 = 0;
    }
    if (v29)
    {
      uint64_t v23 = 2;
    }
    else
    {
      if (!objc_msgSend_isEqual_(v8, v25, *MEMORY[0x1E4F57F58], v26, v27, v28)) {
        goto LABEL_15;
      }
      uint64_t v23 = 1;
      if (v14 == 2 || v14 == 4) {
        goto LABEL_21;
      }
      if (v14 != 7)
      {
LABEL_15:
        int isEqual = objc_msgSend_isEqual_(v8, v30, *MEMORY[0x1E4F57F50], v31, v32, v33);
        if ((unint64_t)(v14 - 1) >= 0xB) {
          uint64_t v35 = 0;
        }
        else {
          uint64_t v35 = (unsigned __int16)(v14 + 6);
        }
        if (isEqual) {
          uint64_t v23 = v35;
        }
        else {
          uint64_t v23 = 0;
        }
        goto LABEL_21;
      }
      uint64_t v23 = 6;
    }
  }
LABEL_21:
  uint64_t v44 = *MEMORY[0x1E4F28A50];
  v45[0] = v7;
  int v36 = (void *)MEMORY[0x1E4F1C9E8];
  id v37 = v7;
  unsigned int v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v36, v38, (uint64_t)v45, (uint64_t)&v44, 1, v39);
  uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v41, @"com.apple.koa.donate", v23, (uint64_t)v40, v42);

LABEL_22:
  return v24;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
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

void objc_exception_throw(id exception)
{
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1F40CD0F0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}