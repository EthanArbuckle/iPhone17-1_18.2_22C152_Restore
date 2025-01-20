void sub_2399387B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_239938810(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (([*(id *)(a1 + 32) _writeDataToEAN:a3 withKey:v7] & 1) == 0)
  {
    v8 = sub_23993FC14(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_2399400F4();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void sub_23993C65C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_23993C684(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_23993C6A0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_23993C6E8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_23993CFB0(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _getDataClassesFromSealingMap];
  id v4 = v1;
  if (v1)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = [MEMORY[0x263EFFA08] set];
  }
  v3 = (void *)qword_268A059F0;
  qword_268A059F0 = (uint64_t)v2;
}

void sub_23993FBA0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_23993FC08(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id sub_23993FC14(unint64_t a1)
{
  if (qword_268A05A10 != -1) {
    dispatch_once(&qword_268A05A10, &unk_26ED1B968);
  }
  id v2 = (id)MEMORY[0x263EF8440];
  id v3 = MEMORY[0x263EF8440];
  if (a1 <= 1)
  {
    id v2 = (id)qword_268A05A00[a1];
  }
  return v2;
}

uint64_t sub_23993FCA4()
{
  os_log_t v0 = os_log_create("com.apple.corerepair", "device");
  uint64_t v1 = (void *)qword_268A05A00[0];
  qword_268A05A00[0] = (uint64_t)v0;

  qword_268A05A08 = (uint64_t)os_log_create("com.apple.corerepair", "device-error");
  return MEMORY[0x270F9A758]();
}

uint64_t sub_23993FD14(uint64_t result, unint64_t *a2, unint64_t *a3)
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
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      v14 = v12 + 1;
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
            result = 0;
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
          result = 3;
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
          v28 = &v5[-v23];
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
  result = 3;
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
    v12 = (char *)(v6 + 1);
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

unint64_t *sub_23993FF04(unint64_t *result, unint64_t *a2)
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

uint64_t sub_23993FF30(unint64_t *a1, unint64_t *a2)
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
  uint64_t result = sub_23993FD14((uint64_t)v10, a2, 0);
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

void sub_23993FFF0()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Unable to find /defaults node", v2, v3, v4, v5, v6);
}

void sub_239940024()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to retrieve data classes to write to EAN", v2, v3, v4, v5, v6);
}

void sub_239940058()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "EAN Verify failed", v2, v3, v4, v5, v6);
}

void sub_23994008C()
{
  sub_23993C6C8();
  sub_23993C684(&dword_239937000, v0, v1, "Failed to delete FDR data instance for: %@", v2, v3, v4, v5, v6);
}

void sub_2399400F4()
{
  sub_23993C6C8();
  sub_23993C684(&dword_239937000, v0, v1, "Failed to write FDR data instance for: %@", v2, v3, v4, v5, v6);
}

void sub_23994015C()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Cannot allocate buffer for data padding", v2, v3, v4, v5, v6);
}

void sub_239940190()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Could not get queryKey", v2, v3, v4, v5, v6);
}

void sub_2399401C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_23994023C()
{
  sub_23993C6BC();
  sub_23993C6A0(&dword_239937000, v0, v1, "Failed to write to EAN with kernResult = 0x%x", v2, v3, v4, v5, v6);
}

void sub_2399402A4()
{
  sub_23993C6D4();
  sub_23993C6E8(&dword_239937000, v0, v1, "IOServiceOpen on %s failed, kernResult = 0x%x", v2, v3, v4, v5, 2u);
}

void sub_239940318(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_23994038C()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Final size of padded data isn't inputSize+paddingSize", v2, v3, v4, v5, v6);
}

void sub_2399403C0()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to get chosen info", v2, v3, v4, v5, v6);
}

void sub_2399403F4()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to get syscfg-erly-kbgs-data-class", v2, v3, v4, v5, v6);
}

void sub_239940428()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Unable to allocate memory for byte reversal", v2, v3, v4, v5, v6);
}

void sub_23994045C()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Invalid args", v2, v3, v4, v5, v6);
}

void sub_239940490()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Unexpected der length", v2, v3, v4, v5, v6);
}

void sub_2399404C4()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to get true size of der object", v2, v3, v4, v5, v6);
}

void sub_2399404F8()
{
  sub_23993C6BC();
  sub_23993C6A0(&dword_239937000, v0, v1, "Failed to read EAN with kernResult = 0x%x", v2, v3, v4, v5, v6);
}

void sub_239940560()
{
  sub_23993C6BC();
  sub_23993C6A0(&dword_239937000, v0, v1, "Could not get size of data context IOConnectCallScalarMethod kAppleNVMeEANGetSize:%d", v2, v3, v4, v5, v6);
}

void sub_2399405C8(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  [a1 length];
  sub_23993C6C8();
  _os_log_error_impl(&dword_239937000, a2, OS_LOG_TYPE_ERROR, "key is not 4 bytes (%lu)", v3, 0xCu);
}

void sub_239940650()
{
  sub_23993C6BC();
  sub_23993C6A0(&dword_239937000, v0, v1, "Failed to delete EAN with kernResult = 0x%x", v2, v3, v4, v5, v6);
}

void sub_2399406B8()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Verify FDR data from EAN using cache, but missing cached data.", v2, v3, v4, v5, v6);
}

void sub_2399406EC()
{
  sub_23993C6C8();
  sub_23993C684(&dword_239937000, v0, v1, "Data class (%@) mismatch from previous data.", v2, v3, v4, v5, v6);
}

void sub_239940754()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to read data class from EAN", v2, v3, v4, v5, v6);
}

void sub_239940788()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to get EAN data classes to verify", v2, v3, v4, v5, v6);
}

void sub_2399407BC()
{
  sub_23993C6C8();
  sub_23993C684(&dword_239937000, v0, v1, "Data class (%@) mismatch from FDR local data.", v2, v3, v4, v5, v6);
}

void sub_239940824()
{
  sub_23993C6BC();
  sub_23993C6A0(&dword_239937000, v0, v1, "syscfg_fdr: could not determine actual size of DER encoded object (derstat = %d)", v2, v3, v4, v5, v6);
}

void sub_23994088C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_239940904(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_23994097C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2399409F4()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to get ap_ticket.", v2, v3, v4, v5, v6);
}

void sub_239940A28()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "fdrOptions failed allocation", v2, v3, v4, v5, v6);
}

void sub_239940A5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_239940ACC()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "failed to create FDR local store", v2, v3, v4, v5, v6);
}

void sub_239940B00()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to read trust object digest from apticket.", v2, v3, v4, v5, v6);
}

void sub_239940B34()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to load seal instance array.", v2, v3, v4, v5, v6);
}

void sub_239940B68()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to load seal data.", v2, v3, v4, v5, v6);
}

void sub_239940B9C()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Unable to read FDR Trust object.", v2, v3, v4, v5, v6);
}

void sub_239940BD0()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "key is NULL.", v2, v3, v4, v5, v6);
}

void sub_239940C04()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "payloadType is invalid.", v2, v3, v4, v5, v6);
}

void sub_239940C38()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "IOServiceGetMatchingService failed to find kNVMeEANServiceMatchName.", v2, v3, v4, v5, v6);
}

void sub_239940C6C()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "IOServiceOpen returned IO_OBJECT_NULL.", v2, v3, v4, v5, v6);
}

void sub_239940CA0()
{
  sub_23993C6BC();
  sub_23993C6A0(&dword_239937000, v0, v1, "getSize failed, kernResult = 0x%x.", v2, v3, v4, v5, v6);
}

void sub_239940D08()
{
  sub_23993C6BC();
  sub_23993C6A0(&dword_239937000, v0, v1, "IOServiceOpen returned result=0x%04x.", v2, v3, v4, v5, v6);
}

void sub_239940D70()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Hash is inside header.", v2, v3, v4, v5, v6);
}

void sub_239940DA4()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Hash size is zero.", v2, v3, v4, v5, v6);
}

void sub_239940DD8()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "FDR info payload is empty.", v2, v3, v4, v5, v6);
}

void sub_239940E0C()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Hash is extends outside payload.", v2, v3, v4, v5, v6);
}

void sub_239940E40()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Generation count is invalid.", v2, v3, v4, v5, v6);
}

void sub_239940E74()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109376;
  sub_23993C704();
  _os_log_error_impl(&dword_239937000, v0, OS_LOG_TYPE_ERROR, "Bad fdr info header version.\tExpect: %d\tFound: %d", (uint8_t *)v1, 0xEu);
}

void sub_239940EF4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109376;
  sub_23993C704();
  _os_log_error_impl(&dword_239937000, v0, OS_LOG_TYPE_ERROR, "Bad fdr info header magic.\tExpect: %d\tFound: %d", (uint8_t *)v1, 0xEu);
}

void sub_239940F78()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "FDR parts array is NULL.", v2, v3, v4, v5, v6);
}

void sub_239940FAC()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "FDR parts array is empty.", v2, v3, v4, v5, v6);
}

void sub_239940FE0()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to load APTK key.", v2, v3, v4, v5, v6);
}

void sub_239941014()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "ean_dictionary is NULL", v2, v3, v4, v5, v6);
}

void sub_239941048()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "IOServiceGetMatchingService failed to find kNVMeEANServiceMatchName", v2, v3, v4, v5, v6);
}

void sub_23994107C()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "IOServiceOpen returned IO_OBJECT_NULL", v2, v3, v4, v5, v6);
}

void sub_2399410B0()
{
  sub_23993C6BC();
  sub_23993C6A0(&dword_239937000, v0, v1, "IOServiceOpen returned result=0x%04x", v2, v3, v4, v5, v6);
}

void sub_239941118()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  sub_23993C6C8();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_239937000, v1, OS_LOG_TYPE_ERROR, "Failed to copy staged FDR EAN data:%@:%@", v2, 0x16u);
}

void sub_23994119C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_239941214()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "key1 is NULL.", v2, v3, v4, v5, v6);
}

void sub_239941248()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "key2 is NULL.", v2, v3, v4, v5, v6);
}

void sub_23994127C()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "payloadType1 is invalid.", v2, v3, v4, v5, v6);
}

void sub_2399412B0()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "payloadType2 is invalid.", v2, v3, v4, v5, v6);
}

void sub_2399412E4()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "IOServiceOpen returned IO_OBJECT_NULL.", v2, v3, v4, v5, v6);
}

void sub_239941318()
{
  sub_23993C6BC();
  sub_23993C6A0(&dword_239937000, v0, v1, "swapImage failed, kernResult = 0x%x.", v2, v3, v4, v5, v6);
}

void sub_239941380()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Versioned FDR corrupted", v2, v3, v4, v5, v6);
}

void sub_2399413B4()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to commit fdr2->fdr1", v2, v3, v4, v5, v6);
}

void sub_2399413E8()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "unable to find chosen node", v2, v3, v4, v5, v6);
}

void sub_23994141C()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "unable to create NSData of ticket hash", v2, v3, v4, v5, v6);
}

void sub_239941450()
{
  sub_23993C6C8();
  sub_23993C684(&dword_239937000, v0, v1, "img4CryptoHashMethodData not recognized:%@", v2, v3, v4, v5, v6);
}

void sub_2399414B8()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "no ticket available", v2, v3, v4, v5, v6);
}

void sub_2399414EC()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Unable to read ap ticket.", v2, v3, v4, v5, v6);
}

void sub_239941520()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to read ap ticket hash.", v2, v3, v4, v5, v6);
}

void sub_239941554()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to swap Versioned FDR", v2, v3, v4, v5, v6);
}

void sub_239941588()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to setupVersioned FDR", v2, v3, v4, v5, v6);
}

void sub_2399415BC()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "apTicket type mismatch", v2, v3, v4, v5, v6);
}

void sub_2399415F0()
{
  sub_23993FC08(*MEMORY[0x263EF8340]);
  sub_23993FBFC();
  sub_23993C684(&dword_239937000, v0, v1, "Local sealing manifest populate failed, error = %@", v2, v3, v4, v5, v6);
}

void sub_239941658()
{
  sub_23993FBE4();
  sub_23993FBA0(&dword_239937000, v0, v1, "Failed to verify local %@ data; error: %@");
}

void sub_2399416C4()
{
  sub_23993FBE4();
  sub_23993FBA0(&dword_239937000, v0, v1, "Failed to read local %@ data; error: %@");
}

void sub_239941730()
{
  sub_23993C6C8();
  sub_23993C684(&dword_239937000, v0, v1, "Cannot copy %@ data from device", v2, v3, v4, v5, v6);
}

void sub_239941798(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_239937000, a2, OS_LOG_TYPE_ERROR, "Failed to get payload; stat: %d", (uint8_t *)v2, 8u);
}

void sub_239941810(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_239937000, a2, OS_LOG_TYPE_ERROR, "Failed to parse cert as img4; stat: %d",
    (uint8_t *)v2,
    8u);
}

void sub_239941888()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to get local sealing manifest", v2, v3, v4, v5, v6);
}

void sub_2399418BC()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Classes is not an array", v2, v3, v4, v5, v6);
}

void sub_2399418F0(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = *a1;
  sub_23993C684(&dword_239937000, a2, a3, "Failed to decode sealing manifest: %@", a5, a6, a7, a8, 2u);
}

void sub_23994196C(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = *a1;
  sub_23993C684(&dword_239937000, a2, a3, "Failed to decode sealing map: %@", a5, a6, a7, a8, 2u);
}

void sub_2399419E8()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Data class is nil", v2, v3, v4, v5, v6);
}

void sub_239941A1C()
{
  sub_23993FC08(*MEMORY[0x263EF8340]);
  sub_23993FBFC();
  sub_23993C684(&dword_239937000, v0, v1, "Failed to get DataInstance:%@", v2, v3, v4, v5, v6);
}

void sub_239941A84()
{
  sub_23993FC08(*MEMORY[0x263EF8340]);
  sub_23993FBFC();
  sub_23993C684(&dword_239937000, v0, v1, "Copy manifest data failed, error = %@", v2, v3, v4, v5, v6);
}

void sub_239941AEC()
{
  sub_23993C6C8();
  sub_23993C684(&dword_239937000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void sub_239941B54()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Local Sealing manifest fetch failed", v2, v3, v4, v5, v6);
}

void sub_239941B88()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "DataInstances and Classes count mismatch", v2, v3, v4, v5, v6);
}

void sub_239941BBC()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to read EAN", v2, v3, v4, v5, v6);
}

void sub_239941BF0(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  sub_23993C6C8();
  _os_log_error_impl(&dword_239937000, a2, OS_LOG_TYPE_ERROR, "%@", v4, 0xCu);
}

void sub_239941C84(void *a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 134218240;
  uint64_t v6 = [a1 count];
  __int16 v7 = 2048;
  uint64_t v8 = [a2 count];
  _os_log_error_impl(&dword_239937000, a3, OS_LOG_TYPE_ERROR, "Live classes: %lu. Live instances: %lu", (uint8_t *)&v5, 0x16u);
}

void sub_239941D34()
{
  sub_23993C6C8();
  sub_23993C684(&dword_239937000, v0, v1, "Missing live data: %@", v2, v3, v4, v5, v6);
}

void sub_239941D9C()
{
  sub_23993FBD8();
  v3[0] = 67109378;
  v3[1] = v1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  _os_log_error_impl(&dword_239937000, v2, OS_LOG_TYPE_ERROR, "Read live data: %d. %@", (uint8_t *)v3, 0x12u);
}

void sub_239941E34()
{
  sub_23993FBD8();
  sub_23993FBC0();
  sub_23993FBA0(&dword_239937000, v1, v2, "Failed to read sealed property of %@: %@");
}

void sub_239941EA8()
{
  sub_23993FBD8();
  sub_23993FBC0();
  sub_23993FBA0(&dword_239937000, v1, v2, "Failed to read live property of %@: %@");
}

void sub_239941F1C()
{
  sub_23993FBD8();
  sub_23993FBC0();
  sub_23993FBA0(&dword_239937000, v1, v2, "Failed to read sealed instances of %@: %@");
}

void sub_239941F90()
{
  sub_23993FBD8();
  sub_23993FBC0();
  sub_23993FBA0(&dword_239937000, v1, v2, "Failed to read live instances of %@: %@");
}

void sub_239942004(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  sub_23993C684(&dword_239937000, a2, a3, "Failed to read live sensor number, error: %@", a5, a6, a7, a8, 2u);
}

void sub_239942080()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to create amfdr", v2, v3, v4, v5, v6);
}

void sub_2399420B4()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to create property value string", v2, v3, v4, v5, v6);
}

void sub_2399420E8()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to get 'SrvT' property", v2, v3, v4, v5, v6);
}

void sub_23994211C()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to read seal data", v2, v3, v4, v5, v6);
}

void sub_239942150()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "No EAN support.", v2, v3, v4, v5, v6);
}

void sub_239942184()
{
  sub_23993C678();
  sub_23993C65C(&dword_239937000, v0, v1, "Failed to create fdrLocal", v2, v3, v4, v5, v6);
}

void sub_2399421B8()
{
  sub_23993FC08(*MEMORY[0x263EF8340]);
  sub_23993FBFC();
  sub_23993C684(&dword_239937000, v0, v1, "Failed to get local manifest properties, error: %@", v2, v3, v4, v5, v6);
}

uint64_t AMFDRCreateTypeWithOptions()
{
  return MEMORY[0x270F91D98]();
}

uint64_t AMFDRCreateWithOptions()
{
  return MEMORY[0x270F91DA0]();
}

uint64_t AMFDRDataCopyManifest()
{
  return MEMORY[0x270F91DC8]();
}

uint64_t AMFDRDataCopySealingManifestProperty()
{
  return MEMORY[0x270F91DD0]();
}

uint64_t AMFDRDataCopyTrustObject()
{
  return MEMORY[0x270F91DE0]();
}

uint64_t AMFDRSealingManifestCopyDataClassesInstancesAndProperties()
{
  return MEMORY[0x270F91F18]();
}

uint64_t AMFDRSealingManifestCopyInstanceForClass()
{
  return MEMORY[0x270F91F20]();
}

uint64_t AMFDRSealingManifestCopyLocalDataForClass()
{
  return MEMORY[0x270F91F28]();
}

uint64_t AMFDRSealingManifestCopyMultiInstanceForClass()
{
  return MEMORY[0x270F91F38]();
}

uint64_t AMFDRSealingMapCopyDataClassesAndInstancesWithAttribute()
{
  return MEMORY[0x270F91F60]();
}

uint64_t AMFDRSealingMapCopyDataClassesWithAttribute()
{
  return MEMORY[0x270F91F68]();
}

uint64_t AMFDRSealingMapCopyLocalData()
{
  return MEMORY[0x270F91F78]();
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return MEMORY[0x270F91F80]();
}

uint64_t AMFDRSealingMapCopyManifestProperties()
{
  return MEMORY[0x270F91FA0]();
}

uint64_t AMFDRSealingMapCopyMultiInstanceForClass()
{
  return MEMORY[0x270F91FB8]();
}

uint64_t AMFDRSealingMapCopyPropertyWithTag()
{
  return MEMORY[0x270F91FC0]();
}

uint64_t AMFDRSealingMapCreateLocalMultiDataBlobForClass()
{
  return MEMORY[0x270F91FC8]();
}

uint64_t AMFDRSealingMapEntryHasAttribute()
{
  return MEMORY[0x270F91FD0]();
}

uint64_t AMFDRSealingMapPopulateSealingManifest()
{
  return MEMORY[0x270F91FF0]();
}

uint64_t AMFDRSetOption()
{
  return MEMORY[0x270F92008]();
}

uint64_t AMSupportSafeFree()
{
  return MEMORY[0x270F97B38]();
}

uint64_t AMSupportSafeRelease()
{
  return MEMORY[0x270F97B40]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B48](data, *(void *)&len, md);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t Img4DecodeGetObjectPropertyData()
{
  return MEMORY[0x270F97C30]();
}

uint64_t Img4DecodeGetPayload()
{
  return MEMORY[0x270F97C40]();
}

uint64_t Img4DecodeInit()
{
  return MEMORY[0x270F97C68]();
}

uint64_t Img4DecodeInitManifest()
{
  return MEMORY[0x270F97C70]();
}

uint64_t ZhuGeCopyValue()
{
  return MEMORY[0x270F0D560]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}