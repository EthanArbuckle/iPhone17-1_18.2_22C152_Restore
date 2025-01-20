uint64_t ccder_sizeof_tl(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t result;

  v3 = ccder_sizeof_tag(a1);
  v4 = ccder_sizeof_len(a2);
  v5 = __CFADD__(v3, v4);
  result = v3 + v4;
  if (v5) {
    __break(0x5500u);
  }
  return result;
}

uint64_t CTDecompressSignature(int a1, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5)
{
  v13 = 0;
  v14 = 0;
  if ((a3 & 0x8000000000000000) != 0) {
    __break(0x5519u);
  }
  uint64_t result = CTDecompressGetSignature(a1, a2, a3, (unint64_t *)&v13, &v14);
  uint64_t v8 = result;
  if (result) {
    return v8;
  }
  v9 = v14;
  if (v14 == (unsigned __int8 *)-1)
  {
LABEL_15:
    __break(0x5500u);
    goto LABEL_16;
  }
  unint64_t v10 = ccder_sizeof(3, (unint64_t)(v14 + 1));
  unint64_t v11 = v10;
  if (!a4) {
    goto LABEL_12;
  }
  uint64_t v8 = 393226;
  if (a4[1] - *a4 < v10) {
    return 393220;
  }
  uint64_t result = ccder_blob_encode_body(a4, (unint64_t)v9, v13);
  if (!result) {
    return v8;
  }
  uint64_t v12 = a4[1];
  if (v12)
  {
    a4[1] = v12 - 1;
    *(unsigned char *)(v12 - 1) = 0;
    if (v14 != (unsigned __int8 *)-1)
    {
      if (!ccder_blob_encode_tl(a4, 3uLL, (unint64_t)(v14 + 1))) {
        return v8;
      }
LABEL_12:
      uint64_t v8 = 0;
      if (a5) {
        *a5 = v11;
      }
      return v8;
    }
    goto LABEL_15;
  }
LABEL_16:
  __break(0x5513u);
  return result;
}

unint64_t CTDecompressCAComputeSKID(unint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(_DWORD *)(a3 + 16) = 0;
  if (a1 > 0xFFFFFFFFFFFFFFD2)
  {
    __break(0x5513u);
    goto LABEL_9;
  }
  if ((unint64_t)(a2 - 78) > 0xFFFFFFFFFFFFFFDELL || a1 + 45 < a1 || a1 + 45 > a1 + a2) {
LABEL_9:
  }
    __break(0x5519u);
  v8[0] = a1 + 45;
  v8[1] = 33;
  char v10 = -86;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v9[2] = v4;
  v9[3] = v4;
  v9[0] = v4;
  v9[1] = v4;
  unint64_t v5 = decompressECPublicKey((uint64_t)v8, (int **)&CTOidSECP256r1, (char *)v9, 65);
  if (!v5)
  {
    v6 = ccsha1_di();
    ccdigest((uint64_t)v6, 0x41uLL, (char *)v9, a3);
  }
  return v5;
}

unint64_t CTConvertByteArrayToAsciiHex(unint64_t result, uint64_t a2, char *a3, uint64_t a4)
{
  if (!__CFADD__(result, a2))
  {
    if (a4 != 2 * a2) {
      return 393220;
    }
    if (!__CFADD__(a3, a4))
    {
      uint64_t v4 = 0;
      if (result + a2 > result)
      {
        unint64_t v5 = &a3[a4];
        if (&a3[a4] > a3)
        {
          v6 = (unsigned __int8 *)result;
          while ((unint64_t)v6 >= result)
          {
            unint64_t v7 = *v6;
            uint64_t v8 = &nibbleToAsciiByte[v7 >> 4];
            BOOL v9 = v8 < "Apple iPhone Certification Authority" && v8 >= nibbleToAsciiByte;
            char v10 = &nibbleToAsciiByte[v7 & 0xF];
            BOOL v11 = !v9 || v10 >= "Apple iPhone Certification Authority";
            if (v11 || v10 < nibbleToAsciiByte) {
              break;
            }
            char v13 = *v10;
            *a3 = *v8;
            v14 = a3 + 1;
            if (v14 == (char *)-1) {
              goto LABEL_26;
            }
            uint64_t v4 = 0;
            char *v14 = v13;
            a3 = v14 + 1;
            if ((unint64_t)++v6 >= result + a2 || a3 >= v5) {
              return v4;
            }
          }
          __break(0x5519u);
          goto LABEL_26;
        }
      }
      return v4;
    }
  }
LABEL_26:
  __break(0x5513u);
  return result;
}

unint64_t CTDecompressDate(unint64_t result, uint64_t *a2, unint64_t *a3)
{
  unsigned int v5 = *(unsigned __int8 *)result;
  if (v5 >= 0x32)
  {
    if (v5 != 50) {
      goto LABEL_9;
    }
    if (result != -1)
    {
      if (*(unsigned char *)(result + 1) != 48) {
        goto LABEL_9;
      }
      if (result <= 0xFFFFFFFFFFFFFFFDLL)
      {
        if (*(unsigned __int8 *)(result + 2) < 0x35u) {
          goto LABEL_2;
        }
LABEL_9:
        uint64_t v9 = 0;
        unint64_t v6 = 14;
        unint64_t v7 = 17;
        unint64_t v8 = 24;
        if (!a2) {
          goto LABEL_19;
        }
        goto LABEL_10;
      }
    }
LABEL_22:
    __break(0x5513u);
    goto LABEL_23;
  }
LABEL_2:
  unint64_t v6 = 12;
  unint64_t v7 = 15;
  unint64_t v8 = 23;
  uint64_t v9 = 2;
  if (!a2)
  {
LABEL_19:
    uint64_t v10 = 0;
    if (a3) {
      *a3 = v7;
    }
    return v10;
  }
LABEL_10:
  uint64_t v10 = 393226;
  uint64_t v11 = a2[1];
  if (v11 - *a2 < v7) {
    return 393220;
  }
  if (!v11) {
    goto LABEL_22;
  }
  a2[1] = v11 - 1;
  *(unsigned char *)(v11 - 1) = 90;
  if (__CFADD__(result, v9)) {
    goto LABEL_22;
  }
  uint64_t v12 = (const void *)(result + v9);
  if (result + v9 <= result + 14 && (unint64_t)v12 >= result && v6 <= 14 - v9)
  {
    if (!ccder_blob_encode_body(a2, v6, v12) || !ccder_blob_encode_tl(a2, v8, v6 | 1)) {
      return v10;
    }
    goto LABEL_19;
  }
LABEL_23:
  __break(0x5519u);
  return result;
}

unint64_t CTCompressGetCommonNameSuffixPointer(uint64_t a1)
{
  unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  if (X509CertificateSubjectNameGetCommonName(a1, &v7)) {
    return 0;
  }
  unint64_t result = compare_octet_string_partial((uint64_t)&MFi4RootName, (uint64_t)&v7);
  if (!result)
  {
    unint64_t v4 = v7;
    if (v7 < 0xFFFFFFFFFFFFFFE6)
    {
      unint64_t v5 = v8;
      unint64_t result = v7 + 26;
      goto LABEL_11;
    }
LABEL_18:
    __break(0x5513u);
    return result;
  }
  v2 = &MFi4AccessoryCAName;
  unint64_t result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)&v7);
  if (result)
  {
    v2 = &MFi4AttestationCAName;
    unint64_t result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)&v7);
    if (result) {
      return 0;
    }
  }
  v3 = v2[1];
  unint64_t v4 = v7;
  if (__CFADD__(v7, v3)) {
    goto LABEL_18;
  }
  unint64_t v5 = v8;
  unint64_t result = (unint64_t)&v3[v7];
  if (!&v3[v7]) {
    return result;
  }
LABEL_11:
  BOOL v6 = __CFADD__(v4, v5);
  if (result > 0xFFFFFFFFFFFFFFF7 || v6) {
    goto LABEL_18;
  }
  if (v4 + v5 < result + 8) {
    return 0;
  }
  return result;
}

uint64_t CTGetGeneralizedTime(uint64_t result, unint64_t a2)
{
  v2 = (uint64_t **)result;
  uint64_t v3 = *(void *)(result + 8);
  if (v3 != 13)
  {
    if (v3 != 15) {
      return 720909;
    }
    unint64_t result = 0;
    unint64_t v4 = *v2;
    uint64_t v5 = *v4;
    *(void *)(a2 + 6) = *(uint64_t *)((char *)v4 + 6);
    *(void *)a2 = v5;
    return result;
  }
  if (a2 >= 0xFFFFFFFFFFFFFFFELL)
  {
    __break(0x5513u);
    goto LABEL_12;
  }
  uint64_t v6 = **(void **)result;
  *(_DWORD *)(a2 + 10) = *(_DWORD *)(*(void *)result + 8);
  *(void *)(a2 + 2) = v6;
  if (!*(void *)(result + 8))
  {
LABEL_12:
    __break(0x5519u);
    return result;
  }
  if (**(unsigned __int8 **)result > 0x34u)
  {
    unint64_t result = 0;
    __int16 v7 = 14641;
  }
  else
  {
    unint64_t result = 0;
    __int16 v7 = 12338;
  }
  *(_WORD *)a2 = v7;
  return result;
}

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateSubjectNameGetCommonName(a1 + 104, v4);
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

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!result) {
    *(void *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  }
  return result;
}

void *ccec_cp_for_oid(int **a1)
{
  if (!a1) {
    return 0;
  }
  v1 = a1[1];
  if (v1 != (int *)7)
  {
    if (v1 == (int *)10 && *(void *)*a1 == 0x33DCE48862A0806 && *((_WORD *)*a1 + 4) == 1793) {
      return (void *)ccec_cp_256();
    }
    return 0;
  }
  unint64_t v4 = *a1;
  if (**a1 == -2127887098 && *(int *)((char *)*a1 + 3) == 570426497) {
    return (void *)ccec_cp_384();
  }
  int v6 = *v4;
  int v7 = *(int *)((char *)v4 + 3);
  if (v6 != -2127887098 || v7 != 587203713) {
    return 0;
  }
  return ccec_cp_521();
}

unint64_t compressECPublicKey(void *a1, int **a2, char *a3, uint64_t a4)
{
  int v7 = (uint64_t *)ccec_cp_for_oid(a2);
  if (!v7) {
    return 655366;
  }
  uint64_t v8 = (uint64_t)v7;
  uint64_t v9 = *v7;
  if ((unint64_t)*v7 >> 61 || !is_mul_ok(8 * v9, 3uLL))
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
  unint64_t result = __chkstk_darwin(v7);
  v16 = (uint64_t *)((char *)&v19 - v14);
  unint64_t v17 = 0;
  do
  {
    v18 = &v16[v17 / 8];
    uint64_t *v18 = 0xAAAAAAAAAAAAAAAALL;
    v18[1] = 0xAAAAAAAAAAAAAAAALL;
    v17 += 16;
  }
  while (v14 != v17);
  if (v15 < 0x10) {
    goto LABEL_21;
  }
  uint64_t *v16 = v8;
  if (v14 < 1)
  {
LABEL_20:
    __break(0x5519u);
LABEL_21:
    __break(1u);
    return result;
  }
  unint64_t result = ccec_import_pub(v8, a1[1], *a1, (char *)&v19 - v14);
  if (!result)
  {
    unint64_t result = ccec_compressed_x962_export_pub_size(v8);
    if (result == a4)
    {
      if (!a3 || a4) {
        return ccec_compressed_x962_export_pub(v16, a3);
      }
      goto LABEL_20;
    }
    return 393220;
  }
  return result;
}

unint64_t decompressECPublicKey(uint64_t a1, int **a2, char *a3, uint64_t a4)
{
  int v7 = (uint64_t *)ccec_cp_for_oid(a2);
  if (!v7) {
    return 655366;
  }
  uint64_t v8 = *v7;
  if ((unint64_t)*v7 >> 61 || !is_mul_ok(8 * v8, 3uLL)) {
LABEL_22:
  }
    __break(0x550Cu);
  uint64_t v9 = 24 * v8;
  BOOL v10 = __CFADD__(v9, 16);
  unint64_t v11 = v9 + 16;
  if (v10 || v11 >= 0xFFFFFFFFFFFFFFF0)
  {
LABEL_21:
    __break(0x5500u);
    goto LABEL_22;
  }
  unint64_t result = __chkstk_darwin(v7);
  unint64_t v15 = (uint64_t *)((char *)&v19 - v13);
  unint64_t v16 = 0;
  do
  {
    unint64_t v17 = &v15[v16 / 8];
    *unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
    v17[1] = 0xAAAAAAAAAAAAAAAALL;
    v16 += 16;
  }
  while (v13 != v16);
  if (v14 < 0x10) {
    goto LABEL_24;
  }
  *unint64_t v15 = result;
  if (v13 >= 1)
  {
    uint64_t v18 = ccec_compressed_x962_import_pub((unint64_t *)result, *(void *)(a1 + 8), *(unsigned __int8 **)a1, (unint64_t **)((char *)&v19 - v13));
    if (!v18)
    {
      unint64_t result = cczp_bitlen(*v15);
      if (result < 0xFFFFFFFFFFFFFFF9)
      {
        if (!a3 || a4)
        {
          if ((((result + 7) >> 2) | 1) == a4) {
            uint64_t v18 = 0;
          }
          else {
            uint64_t v18 = 393220;
          }
          ccec_export_pub(v15, a3);
          return v18;
        }
        goto LABEL_23;
      }
      goto LABEL_21;
    }
    return v18;
  }
LABEL_23:
  __break(0x5519u);
LABEL_24:
  __break(1u);
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

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unsigned __int8 **a1, void *a2)
{
  unint64_t v16 = 0;
  unint64_t v15 = 0;
  uint64_t result = ccder_blob_decode_tl(a1, 0x2000000000000010, &v16);
  if (result)
  {
    uint64_t v13 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v14 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v5 = *a1;
    if (!__CFADD__(*a1, v16))
    {
      if (v5 > &v5[v16] || &v5[v16] > a1[1]) {
        goto LABEL_28;
      }
      uint64_t v13 = *a1;
      unint64_t v14 = &v5[v16];
      uint64_t result = ccder_blob_decode_tl(&v13, 6, &v15);
      if (!result) {
        return result;
      }
      unint64_t v7 = v15;
      uint64_t v8 = v13;
      if (a2)
      {
        if (v14 < v13 || v15 > v14 - v13) {
          goto LABEL_28;
        }
        *a2 = v13;
        a2[1] = v7;
      }
      if (!__CFADD__(v8, v7))
      {
        uint64_t v9 = &v8[v7];
        if (v9 == v14)
        {
          if (v9 <= a1[1] && *a1 <= v9)
          {
            *a1 = v9;
            return 1;
          }
LABEL_28:
          __break(0x5519u);
        }
        unint64_t v11 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
        if (v8 > v9 || v9 > v14) {
          goto LABEL_28;
        }
        unint64_t v11 = v9;
        unint64_t v12 = (unint64_t)v14;
        uint64_t result = ccder_blob_decode_tl(&v11, 5, &v15);
        if (!result) {
          return result;
        }
        if (v11 != v14) {
          return 0;
        }
        if (!__CFADD__(v11, v15))
        {
          BOOL v10 = &v11[v15];
          if (&v11[v15] <= a1[1] && *a1 <= v10)
          {
            *a1 = v10;
            return 1;
          }
          goto LABEL_28;
        }
      }
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t ccder_blob_decode_Time(unsigned __int8 **a1, void *a2)
{
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v13 = 0;
  unint64_t v11 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v2 = (unint64_t)a1[1];
  if ((unint64_t)*a1 > v2) {
    goto LABEL_17;
  }
  unint64_t v11 = *a1;
  unint64_t v12 = v2;
  uint64_t result = ccder_blob_decode_tl(&v11, 23, &v13);
  if (result)
  {
    unint64_t v6 = v13;
    if (v13 != 13) {
      return 0;
    }
LABEL_8:
    uint64_t v9 = v11;
    if (a2)
    {
      if (v12 < (unint64_t)v11 || v6 > v12 - (unint64_t)v11) {
        goto LABEL_17;
      }
      *a2 = v11;
      a2[1] = v6;
    }
    if (__CFADD__(v9, v6))
    {
      __break(0x5513u);
      return result;
    }
    BOOL v10 = &v9[v6];
    if (v10 <= a1[1] && *a1 <= v10)
    {
      *a1 = v10;
      return 1;
    }
LABEL_17:
    __break(0x5519u);
  }
  unint64_t v7 = (unint64_t)a1[1];
  if ((unint64_t)*a1 > v7) {
    goto LABEL_17;
  }
  unint64_t v11 = *a1;
  unint64_t v12 = v7;
  int v8 = ccder_blob_decode_tl(&v11, 24, &v13);
  uint64_t result = 0;
  if (v8)
  {
    unint64_t v6 = v13;
    if (v13 == 15) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t ccder_blob_check_null(unsigned __int8 **a1)
{
  unint64_t v2 = 0;
  LODWORD(result) = ccder_blob_decode_tl(a1, 5, &v2);
  if (v2) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t CTParseExtensionValue(unint64_t a1, uint64_t a2, const void *a3, size_t a4, void *a5, void *a6)
{
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
  uint64_t result = X509CertificateParseWithExtension((unsigned __int8 **)v11, (uint64_t)v10, a3, a4);
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

uint64_t X509CertificateParseImplicit(uint64_t a1, unsigned __int8 **a2, const void *a3, size_t a4)
{
  unint64_t v70 = 0;
  unint64_t v71 = 0;
  v68 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v69 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a2;
  unint64_t v5 = (unint64_t)a2[1];
  if ((unint64_t)*a2 > v5) {
    goto LABEL_186;
  }
  uint64_t v10 = 720915;
  v68 = *a2;
  unint64_t v69 = v5;
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
  uint64_t result = ccder_blob_decode_tl(&v68, 0x2000000000000010, &v71);
  if (!result) {
    return v10;
  }
  unint64_t v12 = v71;
  long long v13 = v68;
  long long v14 = (unsigned __int8 *)(v71 + v68 - v4);
  if (__CFADD__(v71, v68 - v4)) {
    goto LABEL_188;
  }
  if ((unint64_t)v14 > v5 - (unint64_t)v4) {
    goto LABEL_186;
  }
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v14;
  v66 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  v67 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12)) {
    goto LABEL_187;
  }
  long long v15 = &v13[v12];
  if (v13 > v15 || (unint64_t)v15 > v69) {
    goto LABEL_186;
  }
  v66 = v13;
  v67 = v15;
  v64 = v13;
  v65 = v15;
  if (ccder_blob_decode_tl(&v64, 0xA000000000000000, &v70))
  {
    unint64_t v16 = v70;
    unint64_t v17 = v64;
    if (__CFADD__(v64, v70)) {
      goto LABEL_187;
    }
    uint64_t v18 = 720916;
    if (ccder_blob_decode_uint64(&v64, (unint64_t *)(a1 + 32)) && v64 == &v17[v16])
    {
      if (&v17[v16] > v65) {
        goto LABEL_186;
      }
      v66 = &v17[v16];
      v67 = v65;
      goto LABEL_14;
    }
    return v18;
  }
LABEL_14:
  if (!ccder_blob_decode_tl(&v66, 2, &v70)) {
    return 720917;
  }
  v20 = v66;
  uint64_t v19 = v67;
  if (v67 < v66) {
    goto LABEL_186;
  }
  unint64_t v21 = v70;
  if (v70 > v67 - v66) {
    goto LABEL_186;
  }
  *(void *)(a1 + 136) = v66;
  *(void *)(a1 + 144) = v21;
  if (__CFADD__(v20, v21)) {
    goto LABEL_187;
  }
  v22 = &v20[v21];
  if (v20 > v22 || v22 > v19) {
    goto LABEL_186;
  }
  v66 = v22;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v66, (void *)(a1 + 152))) {
    return 720918;
  }
  if (!ccder_blob_decode_tl(&v66, 0x2000000000000010, &v70)) {
    return 720919;
  }
  v24 = v66;
  v23 = v67;
  if (v67 < v66) {
    goto LABEL_186;
  }
  unint64_t v25 = v70;
  if (v70 > v67 - v66) {
    goto LABEL_186;
  }
  *(void *)(a1 + 120) = v66;
  *(void *)(a1 + 128) = v25;
  if (__CFADD__(v24, v25)) {
    goto LABEL_187;
  }
  v26 = &v24[v25];
  if (v24 > v26 || v26 > v23) {
    goto LABEL_186;
  }
  v66 = v26;
  if (!ccder_blob_decode_tl(&v66, 0x2000000000000010, &v70)) {
    return 720920;
  }
  v28 = v66;
  v27 = v67;
  if (v67 < v66) {
    goto LABEL_186;
  }
  unint64_t v29 = v70;
  if (v70 > v67 - v66) {
    goto LABEL_186;
  }
  *(void *)(a1 + 72) = v66;
  *(void *)(a1 + 80) = v29;
  if (__CFADD__(v28, v29)) {
    goto LABEL_187;
  }
  v30 = &v28[v29];
  if (v28 > v30 || v30 > v27) {
    goto LABEL_186;
  }
  v66 = v30;
  if (!ccder_blob_decode_tl(&v66, 0x2000000000000010, &v70)) {
    return 720921;
  }
  v31 = v66;
  v32 = v67;
  if (v67 < v66) {
    goto LABEL_186;
  }
  unint64_t v33 = v70;
  if (v70 > v67 - v66) {
    goto LABEL_186;
  }
  *(void *)(a1 + 104) = v66;
  *(void *)(a1 + 112) = v33;
  if (__CFADD__(v31, v33)) {
    goto LABEL_187;
  }
  v34 = &v31[v33];
  if (v31 > &v31[v33] || v34 > v32) {
    goto LABEL_186;
  }
  v66 = &v31[v33];
  uint64_t result = ccder_blob_decode_tl(&v66, 0x2000000000000010, &v70);
  if (!result) {
    return 720922;
  }
  v35 = v66;
  unint64_t v36 = v70;
  v37 = (unsigned __int8 *)(v66 - v34 + v70);
  if (!__CFADD__(v66 - v34, v70))
  {
    if ((unint64_t)v37 > v32 - v34) {
      goto LABEL_186;
    }
    *(void *)(a1 + 88) = v34;
    *(void *)(a1 + 96) = v37;
    if (__CFADD__(v35, v36)) {
      goto LABEL_187;
    }
    v38 = &v35[v36];
    if (v35 > v38 || v38 > v67) {
      goto LABEL_186;
    }
    v65 = v67;
    v66 = v38;
    v64 = v38;
    if (ccder_blob_decode_tl(&v64, 0x8000000000000001, &v70)) {
      return 720923;
    }
    if (v66 > v67) {
      goto LABEL_186;
    }
    v64 = v66;
    v65 = v67;
    if (ccder_blob_decode_tl(&v64, 0x8000000000000002, &v70)) {
      return 720924;
    }
    if (v66 > v67) {
      goto LABEL_186;
    }
    v64 = v66;
    v65 = v67;
    if (ccder_blob_decode_tl(&v64, 0xA000000000000003, &v70))
    {
      v62 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      v63 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v64, v70)) {
        goto LABEL_187;
      }
      if (v64 > &v64[v70] || &v64[v70] > v65) {
        goto LABEL_186;
      }
      v62 = v64;
      v63 = &v64[v70];
      if (!ccder_blob_decode_tl(&v62, 0x2000000000000010, &v70) || !v70) {
        return 720925;
      }
      v39 = v62;
      if (__CFADD__(v62, v70)) {
LABEL_187:
      }
        __break(0x5513u);
      v40 = &v62[v70];
      if (v62 > &v62[v70] || v40 > v63) {
        goto LABEL_186;
      }
      v63 = &v62[v70];
      *(unsigned char *)(a1 + 266) = 0;
      memset(&v72[2], 0, 128);
      if (a3) {
        BOOL v41 = a4 == 0;
      }
      else {
        BOOL v41 = 1;
      }
      int v42 = !v41;
      memset(v72, 0, 32);
      if (v39 < v40)
      {
        unsigned __int8 v55 = 0;
        int v43 = 0;
        do
        {
          v60 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
          unint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
          BOOL v59 = 0;
          unint64_t v58 = 0;
          if ((ccder_blob_decode_tl(&v62, 0x2000000000000010, &v58) & 1) == 0) {
            return 720926;
          }
          v56 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
          v57 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v62, v58)) {
            goto LABEL_187;
          }
          if (v62 > &v62[v58] || &v62[v58] > v63) {
            goto LABEL_186;
          }
          v56 = v62;
          v57 = &v62[v58];
          if (!ccder_blob_decode_tl(&v56, 6, &v70)) {
            return 720927;
          }
          if (v57 < v56 || v70 > v57 - v56) {
            goto LABEL_186;
          }
          v60 = v56;
          unint64_t v61 = v70;
          if (__CFADD__(v56, v70)) {
            goto LABEL_187;
          }
          if (v56 > &v56[v70] || &v56[v70] > v57) {
            goto LABEL_186;
          }
          v56 += v70;
          if (!der_get_BOOLean(&v56, 1, &v59)) {
            return 720928;
          }
          if (!ccder_blob_decode_tl(&v56, 4, &v70)) {
            return 720929;
          }
          if (__CFADD__(v56, v70)) {
            goto LABEL_187;
          }
          if (v57 != &v56[v70]) {
            return 720929;
          }
          if (v42 && !compare_octet_string_raw((uint64_t)&v60, a3, a4))
          {
            if (v57 < v56) {
              goto LABEL_186;
            }
            unint64_t v45 = v70;
            if (v70 > v57 - v56) {
              goto LABEL_186;
            }
            *(void *)(a1 + 248) = v56;
            *(void *)(a1 + 256) = v45;
          }
          if (v61 == 3)
          {
            if (*(_WORD *)v60 == 7509 && v60[2] == 15)
            {
              uint64_t v18 = 720930;
              if ((v43 & 1) != 0 || (X509ExtensionParseKeyUsage((uint64_t)&v56, (unsigned char *)(a1 + 264)) & 1) == 0) {
                return v18;
              }
              v43 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v60 == 7509 && v60[2] == 19)
            {
              uint64_t v18 = 720931;
              if ((v43 & 2) != 0
                || (X509ExtensionParseBasicConstraints(&v56, (unint64_t *)(a1 + 200), (BOOL *)(a1 + 265)) & 1) == 0)
              {
                return v18;
              }
              v43 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v60 == 7509 && v60[2] == 35)
            {
              uint64_t v18 = 720932;
              if ((v43 & 4) != 0
                || (X509ExtensionParseAuthorityKeyIdentifier(&v56, (void *)(a1 + 168), (unint64_t *)(a1 + 176)) & 1) == 0)
              {
                return v18;
              }
              v43 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v60 == 7509 && v60[2] == 14)
            {
              uint64_t v18 = 720933;
              if ((v43 & 8) != 0
                || (X509ExtensionParseSubjectKeyIdentifier(&v56, (unsigned __int8 **)(a1 + 184), (unint64_t *)(a1 + 192)) & 1) == 0)
              {
                return v18;
              }
              v43 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v60 == 7509 && v60[2] == 37)
            {
              uint64_t v18 = 720934;
              if ((v43 & 0x10) != 0
                || (X509ExtensionParseExtendedKeyUsage(&v56, (void *)(a1 + 208), (unint64_t *)(a1 + 216)) & 1) == 0)
              {
                return v18;
              }
              v43 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v60 == 7509 && v60[2] == 17)
            {
              uint64_t v18 = 720935;
              if ((v43 & 0x20) != 0
                || (X509ExtensionParseSubjectAltName(&v56, (unsigned __int8 **)(a1 + 224), (unint64_t *)(a1 + 232)) & 1) == 0)
              {
                return v18;
              }
              v43 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v61 >= 8 && *(_DWORD *)v60 == -2042067414 && *(_DWORD *)(v60 + 3) == 1684273030)
          {
            uint64_t v18 = 720936;
            if (!X509CertificateVerifyOnlyOneAppleExtension((uint64_t)&v60, (uint64_t)v72, v55)) {
              return v18;
            }
            uint64_t result = X509ExtensionParseAppleExtension((uint64_t)&v56, (unint64_t)v60, v61, (unint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v42);
            if (!result) {
              return v18;
            }
            if (v55 == 0xFF) {
              goto LABEL_189;
            }
            ++v55;
            goto LABEL_155;
          }
          if (__CFADD__(v56, v70)) {
            goto LABEL_187;
          }
          if (v56 > &v56[v70] || &v56[v70] > v57) {
            goto LABEL_186;
          }
          v56 += v70;
          if (v59) {
            *(unsigned char *)(a1 + 266) = 1;
          }
LABEL_155:
          if (v56 != v57) {
            return 720926;
          }
          if (__CFADD__(v62, v58)) {
            goto LABEL_187;
          }
          v39 = &v62[v58];
          if (v62 > &v62[v58]) {
            goto LABEL_186;
          }
          v40 = v63;
          if (v39 > v63) {
            goto LABEL_186;
          }
          v62 += v58;
        }
        while (v39 < v63);
      }
      if (v39 != v40) {
        return 720925;
      }
      if (v39 > v67 || v66 > v39) {
        goto LABEL_186;
      }
      v66 = v39;
    }
    if (*(void *)(a1 + 32) < 3uLL)
    {
      uint64_t v18 = 720915;
      if (v66 != v67) {
        return v18;
      }
LABEL_170:
      if (__CFADD__(v68, v71)) {
        goto LABEL_187;
      }
      if (v68 > &v68[v71] || (unint64_t)&v68[v71] > v69) {
        goto LABEL_186;
      }
      v68 += v71;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v68, (void *)(a1 + 40))) {
        return 720937;
      }
      *(void *)&v72[0] = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v72[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      v62 = 0;
      uint64_t result = ccder_blob_decode_bitstring(&v68, (uint64_t)v72, (unint64_t *)&v62);
      if (!result) {
        return 720938;
      }
      if ((unint64_t)v62 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((void *)&v72[0] + 1) >= *(void *)&v72[0])
        {
          unint64_t v53 = (unint64_t)(v62 + 7) >> 3;
          if (v53 <= *((void *)&v72[0] + 1) - *(void *)&v72[0])
          {
            *(void *)(a1 + 56) = *(void *)&v72[0];
            *(void *)(a1 + 64) = v53;
            unint64_t v54 = v69;
            if ((unint64_t)v68 <= v69)
            {
              uint64_t v18 = 0;
              *a2 = v68;
              a2[1] = (unsigned __int8 *)v54;
              return v18;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v67 <= a2[1] && *a2 <= v67)
    {
      *a2 = v67;
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

uint64_t der_get_BOOLean(unsigned __int8 **a1, int a2, BOOL *a3)
{
  long long v13 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v3 = (unint64_t)a1[1];
  if ((unint64_t)*a1 > v3) {
    goto LABEL_22;
  }
  long long v13 = *a1;
  unint64_t v14 = v3;
  unint64_t v12 = 0;
  uint64_t result = ccder_blob_decode_tl(&v13, 1, &v12);
  if (result)
  {
    if (v12 == 1)
    {
      int v8 = v13;
      if ((unint64_t)v13 < v14)
      {
        int v9 = *v13;
        if (v9 != 255 && v9 != 0) {
          return 0;
        }
        if (a3) {
          *a3 = v9 != 0;
        }
        if (v8 == (unsigned __int8 *)-1)
        {
          __break(0x5513u);
          return result;
        }
        unint64_t v11 = v8 + 1;
        if (v11 <= a1[1] && *a1 <= v11)
        {
          *a1 = v11;
          return 1;
        }
      }
LABEL_22:
      __break(0x5519u);
    }
  }
  else if (a2)
  {
    if (a3) {
      *a3 = 0;
    }
    return 1;
  }
  return 0;
}

uint64_t X509ExtensionParseKeyUsage(uint64_t a1, unsigned char *a2)
{
  unint64_t v6 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v5 = 0;
  uint64_t result = ccder_blob_decode_bitstring((unsigned __int8 **)a1, (uint64_t)&v6, &v5);
  if (result)
  {
    if (v7 != *(void *)(a1 + 8) || v6 == (unsigned char *)v7 || v5 > 8)
    {
      return 0;
    }
    else if ((unint64_t)v6 >= v7)
    {
      __break(0x5519u);
    }
    else
    {
      *a2 = *v6 & (-1 << (8 - v5));
      return 1;
    }
  }
  return result;
}

uint64_t X509ExtensionParseBasicConstraints(unsigned __int8 **a1, unint64_t *a2, BOOL *a3)
{
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 0x2000000000000010, &v11);
  if (result)
  {
    uint64_t result = der_get_BOOLean(a1, 1, a3);
    if (result)
    {
      uint64_t result = ccder_blob_decode_uint64(a1, &v10);
      if (result)
      {
        if (!*a3) {
          return 0;
        }
        unint64_t v7 = v10;
        *a2 = v10;
        BOOL v8 = __CFADD__(v7, 1);
        unint64_t v9 = v7 + 1;
        if (v8)
        {
          __break(0x5500u);
          return result;
        }
        *a2 = v9;
      }
      return 1;
    }
  }
  return result;
}

uint64_t X509ExtensionParseAuthorityKeyIdentifier(unsigned __int8 **a1, void *a2, unint64_t *a3)
{
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 0x2000000000000010, &v14);
  if (result)
  {
    unint64_t v7 = *a1;
    if (__CFADD__(*a1, v14)) {
      goto LABEL_15;
    }
    if (&v7[v14] != a1[1]) {
      return 0;
    }
    unint64_t v11 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
    if (v7 > &v7[v14]) {
      goto LABEL_16;
    }
    unint64_t v11 = v7;
    unint64_t v12 = (unint64_t)&v7[v14];
    uint64_t result = ccder_blob_decode_tl(&v11, 0x8000000000000000, &v13);
    if (result)
    {
      if (v12 < (unint64_t)v11) {
        goto LABEL_16;
      }
      unint64_t v8 = v13;
      if (v13 > v12 - (unint64_t)v11) {
        goto LABEL_16;
      }
      *a2 = v11;
      *a3 = v8;
    }
    unint64_t v9 = *a1;
    if (__CFADD__(*a1, v14))
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      unint64_t v10 = &v9[v14];
      if (v9 <= &v9[v14] && v10 <= a1[1])
      {
        *a1 = v10;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseSubjectKeyIdentifier(unsigned __int8 **a1, unsigned __int8 **a2, unint64_t *a3)
{
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 4, &v17);
  if (result)
  {
    unint64_t v7 = a1[1];
    unint64_t v8 = v17;
    BOOL v10 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (v10)
    {
      BOOL v10 = v17 >= v9;
      BOOL v11 = v17 == v9;
    }
    else
    {
      BOOL v10 = 1;
      BOOL v11 = 0;
    }
    if (!v11 && v10) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = v8;
    unint64_t v12 = *a1;
    if (__CFADD__(*a1, v8))
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v13 = &v12[v8];
    unint64_t v14 = a1[1];
    if (v12 <= v13)
    {
      BOOL v15 = v13 >= v14;
      BOOL v16 = v13 == v14;
    }
    else
    {
      BOOL v15 = 1;
      BOOL v16 = 0;
    }
    if (!v16 && v15) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v13;
  }
  return result;
}

uint64_t X509ExtensionParseExtendedKeyUsage(unsigned __int8 **a1, void *a2, unint64_t *a3)
{
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  int v6 = ccder_blob_decode_tl(a1, 0x2000000000000010, &v15);
  uint64_t result = 0;
  if (v6 && v15)
  {
    unint64_t v12 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v8 = (unint64_t)a1[1];
    if ((unint64_t)*a1 > v8) {
      goto LABEL_12;
    }
    unint64_t v12 = *a1;
    unint64_t v13 = v8;
    uint64_t result = ccder_blob_decode_tl(&v12, 6, &v14);
    if (!result) {
      return result;
    }
    if (v13 < (unint64_t)v12) {
      goto LABEL_12;
    }
    unint64_t v9 = v14;
    if (v14 > v13 - (unint64_t)v12) {
      goto LABEL_12;
    }
    *a2 = v12;
    *a3 = v9;
    BOOL v10 = *a1;
    if (__CFADD__(*a1, v15))
    {
      __break(0x5513u);
      return result;
    }
    BOOL v11 = &v10[v15];
    if (v10 > &v10[v15] || v11 > a1[1]) {
LABEL_12:
    }
      __break(0x5519u);
    *a1 = v11;
  }
  return result;
}

uint64_t X509ExtensionParseSubjectAltName(unsigned __int8 **a1, unsigned __int8 **a2, unint64_t *a3)
{
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  LODWORD(result) = ccder_blob_decode_tl(a1, 0x2000000000000010, &v15);
  unint64_t v7 = v15;
  if (v15) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 0;
  }
  if (result == 1)
  {
    unint64_t v8 = a1[1];
    BOOL v9 = v8 >= *a1;
    unint64_t v10 = v8 - *a1;
    if (!v9 || v15 > v10) {
      goto LABEL_16;
    }
    *a2 = *a1;
    *a3 = v7;
    unint64_t v12 = *a1;
    if (__CFADD__(*a1, v7))
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v13 = &v12[v7];
    if (v12 > v13 || v13 > a1[1]) {
LABEL_16:
    }
      __break(0x5519u);
    *a1 = v13;
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

uint64_t X509ExtensionParseAppleExtension(uint64_t result, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, int a6)
{
  if (a6) {
    a5 = 0;
  }
  if (a3 == 11)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10901066463F786)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10301066463F786)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x200;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10601066463F786)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x800;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11801066463F786)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x12401066463F786)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11901066463F786)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x21901066463F786)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
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
      return X509ExtensionParseServerAuthMarker((unsigned __int8 **)result, a2, a3, a4, a5);
    }
    if (v44)
    {
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
      {
        uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
        if (!result) {
          return result;
        }
        uint64_t v24 = *a4 | 0x400000;
        goto LABEL_275;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
      {
        uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
        if (!result) {
          return result;
        }
        unint64_t v54 = *a4;
        uint64_t v55 = 37748736;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4354)
      {
        uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
        if (!result) {
          return result;
        }
        unint64_t v54 = *a4;
        uint64_t v55 = 0x8004000000;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
      {
        return (uint64_t)X509ExtensionParseMFI4Properties((unint64_t *)result, a4, a5);
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
      {
        v52 = *(unsigned __int8 **)result;
        unint64_t v51 = *(void *)(result + 8);
        if (a5)
        {
          if ((unint64_t)v52 > v51) {
            goto LABEL_281;
          }
          *a5 = (unint64_t)v52;
          a5[1] = v51 - (void)v52;
        }
        *a4 |= 0x80000000uLL;
LABEL_243:
        if ((unint64_t)v52 <= v51)
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
    v52 = *(unsigned __int8 **)result;
    unint64_t v51 = *(void *)(result + 8);
    goto LABEL_243;
  }
  if (a3 == 10)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      unint64_t v54 = *a4;
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
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0xF00;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_209:
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x40;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x1000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
    {
      return X509ExtensionParseMFISWAuth((unsigned __int8 **)result, a4, (unsigned __int8 **)a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x300000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
    {
      return X509ExtensionParseGenericSSLMarker(result, a4, a5);
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
    return X509ExtensionParseComponentAuth((unsigned __int8 **)result, a4, (unsigned __int8 **)a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 49)
  {
    BOOL v56 = 0;
    uint64_t result = der_get_BOOLean((unsigned __int8 **)result, 0, &v56);
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
    return X509ExtensionParseCertifiedChipIntermediate((unsigned __int8 **)result, a4, (unsigned __int8 **)a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 36)
  {
    return X509ExtensionParseMFIAuthv3Leaf((unsigned __int8 **)result, a4, (unsigned __int8 **)a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 22)
  {
    uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
    if (!result) {
      return result;
    }
    unint64_t v54 = *a4;
    uint64_t v55 = 1048584;
    goto LABEL_205;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 19)
  {
    uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
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
    uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x2000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 14)
  {
    uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x4000000;
    goto LABEL_275;
  }
  if (*(void *)a2 != 0x86463F78648862ALL || *(unsigned char *)(a2 + 8) != 3) {
    goto LABEL_242;
  }

  return X509ExtensionParseDeviceAttestationIdentity((unsigned __int8 **)result, a4, a5);
}

uint64_t X509CertificateParseWithExtension(unsigned __int8 **a1, uint64_t a2, const void *a3, size_t a4)
{
  uint64_t v8 = 720939;
  uint64_t v9 = *(unsigned __int8 **)a2;
  unint64_t v10 = *(void *)(a2 + 8);
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  if (!ccder_blob_decode_tl((unsigned __int8 **)a2, 0x2000000000000010, &v14)) {
    return v8;
  }
  BOOL v11 = *(unsigned __int8 **)a2;
  uint64_t result = X509CertificateParseImplicit((uint64_t)a1, (unsigned __int8 **)a2, a3, a4);
  uint64_t v8 = result;
  if (result) {
    return v8;
  }
  if (__CFADD__(v11, v14))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  uint64_t v8 = 720939;
  if (*(unsigned __int8 **)a2 != &v11[v14]) {
    return v8;
  }
  unint64_t v13 = (unsigned __int8 *)(v14 + v11 - v9);
  if (__CFADD__(v14, v11 - v9)) {
    goto LABEL_11;
  }
  if (v10 >= (unint64_t)v9 && (unint64_t)v13 <= v10 - (unint64_t)v9)
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

uint64_t X509CertificateParse(unsigned __int8 **a1, uint64_t a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0, 0);
}

uint64_t X509CertificateParseSPKI(unint64_t *a1, void *a2, unsigned __int8 **a3, void *a4)
{
  unint64_t v21 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  v22 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  if (__CFADD__(*a1, v5)) {
LABEL_38:
  }
    __break(0x5513u);
  unsigned __int8 v6 = (unsigned __int8 *)(v4 + v5);
  if (v4 > (unint64_t)v6) {
    goto LABEL_37;
  }
  uint64_t v10 = 655361;
  unint64_t v21 = (unsigned __int8 *)*a1;
  v22 = v6;
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  if (!ccder_blob_decode_tl(&v21, 0x2000000000000010, &v20)) {
    return v10;
  }
  if (!ccder_blob_decode_tl(&v21, 0x2000000000000010, &v20)) {
    return 655363;
  }
  uint64_t v18 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v19 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v21, v20)) {
    goto LABEL_38;
  }
  if (v21 > &v21[v20] || &v21[v20] > v22) {
    goto LABEL_37;
  }
  uint64_t v18 = v21;
  uint64_t v19 = &v21[v20];
  if (!ccder_blob_decode_tl(&v18, 6, &v20)) {
    return 655362;
  }
  unint64_t v11 = v20;
  unint64_t v12 = v18;
  if (!a2) {
    goto LABEL_13;
  }
  if (v19 < v18 || v20 > v19 - v18)
  {
LABEL_37:
    __break(0x5519u);
    goto LABEL_38;
  }
  *a2 = v18;
  a2[1] = v11;
LABEL_13:
  if (__CFADD__(v12, v11)) {
    goto LABEL_38;
  }
  unint64_t v13 = &v12[v11];
  if (v12 > &v12[v11]) {
    goto LABEL_37;
  }
  unint64_t v14 = v19;
  if (v13 > v19) {
    goto LABEL_37;
  }
  uint64_t v18 = v13;
  if (v13 == v19)
  {
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
  }
  else if (a3)
  {
    *a3 = v13;
    a3[1] = (unsigned __int8 *)(v14 - v13);
  }
  if (v14 > v22 || v21 > v14) {
    goto LABEL_37;
  }
  unint64_t v21 = v14;
  uint64_t v19 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = 0;
  uint64_t v18 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_bitstring(&v21, (uint64_t)&v18, &v17);
  if (!result) {
    return 655364;
  }
  if (!v17)
  {
    *a4 = 0;
    a4[1] = 0;
LABEL_33:
    if (v21 == v22) {
      return 0;
    }
    else {
      return 655365;
    }
  }
  if (v17 < 0xFFFFFFFFFFFFFFF9)
  {
    if (v19 >= v18)
    {
      unint64_t v16 = (v17 + 7) >> 3;
      if (v16 <= v19 - v18)
      {
        *a4 = v18;
        a4[1] = v16;
        goto LABEL_33;
      }
    }
    goto LABEL_37;
  }
  __break(0x5500u);
  return result;
}

uint64_t X509CertificateSubjectNameGetCommonName(uint64_t a1, void *a2)
{
  unint64_t v2 = *(unsigned __int8 **)a1;
  unint64_t v3 = *(void *)(a1 + 8);
  unint64_t v25 = v3;
  v23 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v2, v3)) {
    goto LABEL_62;
  }
  unint64_t v4 = &v2[v3];
  if (v2 > v4)
  {
LABEL_61:
    __break(0x5519u);
    goto LABEL_62;
  }
  uint64_t v6 = 720901;
  v23 = v2;
  unint64_t v24 = (unint64_t)v4;
  *a2 = 0;
  a2[1] = 0;
  if (v2 < v4)
  {
    while (1)
    {
      if (!ccder_blob_decode_tl(&v23, 0x2000000000000011, &v25) || !v25) {
        return 720898;
      }
      unint64_t v21 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      v22 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      unint64_t v2 = v23;
      if (__CFADD__(v23, v25)) {
        break;
      }
      unint64_t v7 = &v23[v25];
      if (v23 > &v23[v25] || (unint64_t)v7 > v24) {
        goto LABEL_61;
      }
      unint64_t v21 = v23;
      v22 = &v23[v25];
      while (v2 < v7)
      {
        if (!ccder_blob_decode_tl(&v21, 0x2000000000000010, &v25)) {
          return 720899;
        }
        uint64_t v19 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        unint64_t v20 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v21, v25)) {
          goto LABEL_62;
        }
        if (v21 > &v21[v25] || &v21[v25] > v22) {
          goto LABEL_61;
        }
        uint64_t v19 = v21;
        unint64_t v20 = &v21[v25];
        if (!ccder_blob_decode_tl(&v19, 6, &v25)) {
          return 720900;
        }
        uint64_t v10 = v19;
        unint64_t v2 = v20;
        if (v19 > v20 || v25 > v20 - v19) {
          goto LABEL_61;
        }
        if (__CFADD__(v19, v25)) {
          goto LABEL_62;
        }
        unint64_t v11 = &v19[v25];
        if (v19 > &v19[v25] || v11 > v20) {
          goto LABEL_61;
        }
        v19 += v25;
        if (v25 == 3)
        {
          int v12 = *(unsigned __int16 *)v10;
          int v13 = v10[2];
          if (v12 == 1109 && v13 == 3)
          {
            unint64_t v17 = v11;
            unint64_t v18 = (unint64_t)v20;
            if ((ccder_blob_decode_tl(&v17, 12, &v25) & 1) == 0)
            {
              if (v19 > v20) {
                goto LABEL_61;
              }
              unint64_t v17 = v19;
              unint64_t v18 = (unint64_t)v20;
              if ((ccder_blob_decode_tl(&v17, 19, &v25) & 1) == 0)
              {
                if (v19 > v20) {
                  goto LABEL_61;
                }
                unint64_t v17 = v19;
                unint64_t v18 = (unint64_t)v20;
                if (!ccder_blob_decode_tl(&v17, 20, &v25)) {
                  return v6;
                }
              }
            }
            unint64_t v15 = v25;
            if (!v25) {
              return v6;
            }
            if (__CFADD__(v17, v25)) {
              goto LABEL_62;
            }
            unint64_t v2 = &v17[v25];
            if (v20 != &v17[v25]) {
              return 720902;
            }
            if (v18 < (unint64_t)v17 || v25 > v18 - (unint64_t)v17) {
              goto LABEL_61;
            }
            *a2 = v17;
            a2[1] = v15;
          }
        }
        unint64_t v7 = v22;
        if (v2 > v22 || v21 > v2) {
          goto LABEL_61;
        }
        unint64_t v21 = v2;
      }
      if (v2 != v7) {
        return 720903;
      }
      unint64_t v4 = (unsigned __int8 *)v24;
      if ((unint64_t)v2 > v24 || v23 > v2) {
        goto LABEL_61;
      }
      v23 = v2;
      if ((unint64_t)v2 >= v24) {
        goto LABEL_49;
      }
    }
LABEL_62:
    __break(0x5513u);
  }
LABEL_49:
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

uint64_t X509CertificateParseValidity(uint64_t result, void *a2, void *a3)
{
  uint64_t v3 = 720906;
  if (!result) {
    return v3;
  }
  unint64_t v4 = *(void *)(result + 72);
  uint64_t v5 = *(void *)(result + 80);
  if (!v4 || v5 == 0) {
    return v3;
  }
  if (__CFADD__(v4, v5))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)(v4 + v5);
    if (v4 <= (unint64_t)v7)
    {
      v9[0] = *(unsigned __int8 **)(result + 72);
      v9[1] = v7;
      if (!ccder_blob_decode_Time(v9, a2)) {
        return 720907;
      }
      if (ccder_blob_decode_Time(v9, a3)) {
        return 0;
      }
      return 720908;
    }
  }
  __break(0x5519u);
  return result;
}

BOOL X509ExtensionParseComponentAuth(unsigned __int8 **a1, void *a2, unsigned __int8 **a3)
{
  unint64_t v14 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a1;
  unint64_t v3 = (unint64_t)a1[1];
  if ((unint64_t)*a1 > v3) {
    goto LABEL_19;
  }
  unint64_t v14 = *a1;
  unint64_t v15 = v3;
  unint64_t v13 = v3 - (void)v4;
  if (ccder_blob_decode_tl(&v14, 22, &v13)) {
    goto LABEL_5;
  }
  unint64_t v8 = (unint64_t)a1[1];
  if ((unint64_t)*a1 > v8) {
    goto LABEL_19;
  }
  unint64_t v14 = *a1;
  unint64_t v15 = v8;
  if (ccder_blob_decode_tl(&v14, 12, &v13))
  {
LABEL_5:
    uint64_t v10 = v14;
    uint64_t v9 = (unsigned __int8 *)v15;
    if ((unint64_t)v14 > v15) {
      goto LABEL_19;
    }
    *a1 = v14;
    a1[1] = v9;
    unint64_t v11 = v13;
  }
  else
  {
    uint64_t v10 = *a1;
    uint64_t v9 = a1[1];
    unint64_t v11 = v9 - *a1;
    unint64_t v13 = v11;
  }
  if (__CFADD__(v10, v11)) {
    goto LABEL_20;
  }
  if (v9 == &v10[v11])
  {
    if (!v11) {
      goto LABEL_16;
    }
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v10 <= v9)
      {
        *a1 = v9;
        return v9 == &v10[v11];
      }
      goto LABEL_19;
    }
    if (v10 <= v9 && v11 <= v9 - v10)
    {
      *a3 = v10;
      a3[1] = (unsigned __int8 *)v11;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v9 == &v10[v11];
}

uint64_t X509ExtensionParseCertifiedChipIntermediate(unsigned __int8 **a1, unint64_t *a2, unsigned __int8 **a3)
{
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 22, &v16);
  if (result)
  {
    unint64_t v7 = v16;
    unint64_t v8 = *a1;
    if (__CFADD__(*a1, v16))
    {
      __break(0x5513u);
      goto LABEL_34;
    }
    uint64_t v9 = &v8[v16];
    if (a1[1] != &v8[v16]) {
      return 0;
    }
    unint64_t v10 = *a2;
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v8 > v9) {
        goto LABEL_34;
      }
      *a3 = v8;
      a3[1] = (unsigned __int8 *)v7;
    }
    if (v7 == 4)
    {
      if (*(_DWORD *)v8 != 1953653621) {
        goto LABEL_30;
      }
      unint64_t v13 = 0x30001000000;
    }
    else
    {
      if (v7 == 17)
      {
        if (*(void *)v8 != 0x207372656B6E6F59 || *((void *)v8 + 1) != 0x726F74636146202DLL || v8[16] != 121)
        {
LABEL_30:
          if (v8 <= v9)
          {
            *a1 = v9;
            return 1;
          }
LABEL_34:
          __break(0x5519u);
          return result;
        }
        uint64_t v12 = 786432;
      }
      else
      {
        if (v7 != 16) {
          goto LABEL_30;
        }
        if (*(void *)v8 != 0x2D20656761766153 || *((void *)v8 + 1) != 0x79726F7463614620) {
          goto LABEL_30;
        }
        uint64_t v12 = 3;
      }
      unint64_t v13 = v12 & 0xFFFF0000FFFFFFFFLL | 0x30000000000;
    }
    *a2 = v10 | v13;
    goto LABEL_30;
  }
  return result;
}

uint64_t X509ExtensionParseMFIAuthv3Leaf(unsigned __int8 **a1, void *a2, unsigned __int8 **a3)
{
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 4, &v9);
  if (result)
  {
    unint64_t v7 = *a1;
    if (__CFADD__(*a1, v9))
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v8 = a1[1];
      if (v8 != &v7[v9]) {
        return 0;
      }
      if (v9 == 32)
      {
        if (a3)
        {
          if (v8 < v7 || (unint64_t)(v8 - v7) <= 0x1F) {
            goto LABEL_15;
          }
          *a3 = v7;
          a3[1] = (unsigned __int8 *)32;
        }
        *a2 |= 4uLL;
      }
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_15:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFISWAuth(unsigned __int8 **a1, void *a2, unsigned __int8 **a3)
{
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 4, &v10);
  if (result)
  {
    unint64_t v7 = v10;
    unint64_t v8 = *a1;
    if (__CFADD__(*a1, v10))
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v9 = a1[1];
      if (v9 != &v8[v10]) {
        return 0;
      }
      if (v10)
      {
        if (a3)
        {
          if (v9 < v8 || v10 > v9 - v8) {
            goto LABEL_15;
          }
          *a3 = v8;
          a3[1] = (unsigned __int8 *)v7;
        }
        *a2 |= 0x30000000uLL;
      }
      if (v8 <= v9)
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_15:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseGenericSSLMarker(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v17 = 0;
  int v6 = ccder_blob_decode_tl((unsigned __int8 **)a1, 12, &v17);
  uint64_t result = 0;
  if (v6)
  {
    unint64_t v8 = v17;
    if (v17 >= 0x19)
    {
      unint64_t v9 = *(void *)a1;
      BOOL v10 = **(void **)a1 == 0x2E3034382E322E31 && *(void *)(*(void *)a1 + 8) == 0x312E353336333131;
      unint64_t v11 = 0x2E37322E362E3030;
      if (!v10 || *(void *)(*(void *)a1 + 16) != 0x2E37322E362E3030) {
        return 0;
      }
      if (v9 < 0xFFFFFFFFFFFFFFE8)
      {
        unint64_t v13 = v9 + 24;
        if (v9 >= v9 + 24) {
          goto LABEL_21;
        }
        unint64_t v11 = *(void *)(a1 + 8);
        if (v13 > v11) {
          goto LABEL_21;
        }
        unint64_t v14 = (unsigned __int8 *)(v9 + 24);
        do
        {
          if ((unint64_t)v14 >= v11) {
            goto LABEL_22;
          }
          if (*v14 - 58 < 0xFFFFFFF6) {
            return 0;
          }
          if ((unint64_t)(v14 + 1) > v11) {
            break;
          }
          BOOL v15 = v14 > v14 + 1;
          ++v14;
        }
        while (!v15);
        while (1)
        {
LABEL_21:
          __break(0x5519u);
LABEL_22:
          if (!a3) {
            goto LABEL_26;
          }
          unint64_t v16 = v8 - 24;
          if (v8 < 0x18) {
            goto LABEL_31;
          }
          if (v16 <= v11 - v13)
          {
            *a3 = v13;
            a3[1] = v16;
LABEL_26:
            unint64_t v13 = *a2 | 0x200000000;
            *a2 = v13;
            if (__CFADD__(v9, v8)) {
              break;
            }
            v8 += v9;
            if (v9 <= v8 && v8 <= v11)
            {
              *(void *)a1 = v8;
              return 1;
            }
          }
        }
      }
      __break(0x5513u);
LABEL_31:
      __break(0x5515u);
    }
  }
  return result;
}

uint64_t X509ExtensionParseServerAuthMarker(unsigned __int8 **a1, unint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t result = ccder_blob_check_null(a1);
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
    uint64_t v12 = (char *)(a2 + 9);
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
        *a4 |= (unint64_t)&_mh_execute_header;
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

uint64_t X509ExtensionParseDeviceAttestationIdentity(unsigned __int8 **a1, void *a2, void *a3)
{
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 0x2000000000000010, &v14);
  if (result)
  {
    unint64_t v7 = *a1;
    if (__CFADD__(*a1, v14)) {
      goto LABEL_17;
    }
    if (a1[1] != &v7[v14]) {
      return 0;
    }
    unint64_t v11 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
    if (v7 > &v7[v14]) {
      goto LABEL_18;
    }
    unint64_t v11 = v7;
    unint64_t v12 = (unint64_t)&v7[v14];
    uint64_t result = ccder_blob_decode_tl(&v11, 0xA000000000000002, &v13);
    if (result)
    {
      uint64_t result = ccder_blob_decode_tl(&v11, 4, &v13);
      if (result)
      {
        if (a3)
        {
          if (v12 < (unint64_t)v11) {
            goto LABEL_18;
          }
          unint64_t v8 = v13;
          if (v13 > v12 - (unint64_t)v11) {
            goto LABEL_18;
          }
          *a3 = v11;
          a3[1] = v8;
        }
        *a2 |= 0x240000800000uLL;
        unint64_t v9 = *a1;
        if (!__CFADD__(*a1, v14))
        {
          unint64_t v10 = &v9[v14];
          if (v9 <= &v9[v14] && v10 <= a1[1])
          {
            *a1 = v10;
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

uint64_t *ccaes_ccm_decrypt_mode()
{
  unint64_t v0 = (*((void *)ccaes_ecb_encrypt_mode() + 1) + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v1 = v0 + ((*(void *)ccaes_ecb_encrypt_mode() + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  unint64_t v2 = ccaes_ecb_encrypt_mode();
  ccm_decrypt_info = v1;
  unk_100238748 = xmmword_1001B95F0;
  qword_100238758 = (uint64_t)ccmode_ccm_init;
  qword_100238760 = (uint64_t)ccmode_ccm_set_iv;
  qword_100238768 = (uint64_t)ccmode_ccm_cbcmac;
  qword_100238770 = (uint64_t)ccaes_vng_ccm_decrypt_wrapper;
  qword_100238778 = (uint64_t)ccmode_ccm_finalize;
  qword_100238780 = (uint64_t)ccmode_ccm_reset;
  unk_100238788 = v2;
  qword_100238790 = 0;
  return &ccm_decrypt_info;
}

uint64_t ccder_blob_decode_bitstring(unsigned __int8 **a1, uint64_t a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_range(a1, 3, (unsigned __int8 **)a2);
  if (result)
  {
    *a3 = 0;
    unint64_t v6 = *(unsigned __int8 **)a2;
    uint64_t v7 = *(void *)(a2 + 8);
    if (v7 != *(void *)a2)
    {
      unint64_t v8 = 8 * (~(unint64_t)v6 + v7);
      unint64_t v9 = *v6;
      BOOL v10 = v8 >= v9;
      unint64_t v11 = v8 - v9;
      if (v10) {
        *a3 = v11;
      }
      *(void *)a2 = v6 + 1;
    }
  }
  return result;
}

uint64_t cccmac_one_shot_generate_internal(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, char *a5, size_t a6, void *a7)
{
  unint64_t v14 = &v18 - 10 * ((a1[1] + *a1 + 159) / 0x50uLL);
  bzero(v14, 80 * ((a1[1] + *a1 + 159) / 0x50uLL));
  uint64_t inited = cccmac_init_internal(a1, (uint64_t)v14, a2, a3);
  if (!inited)
  {
    uint64_t inited = cccmac_update_internal(v14, a4, a5);
    if (!inited) {
      uint64_t inited = cccmac_final_generate_internal((char *)v14, a6, a7);
    }
  }
  uint64_t v16 = inited;
  cc_clear(a1[1] + *a1 + 80, v14);
  return v16;
}

uint64_t ccaes_arm_encrypt_cbc(uint64_t result, int8x16_t *a2, uint64_t a3, uint64_t a4, int8x16_t *a5)
{
  if (a3)
  {
    uint64_t v5 = *(unsigned int *)(result + 240);
    if (v5 == 160 || v5 == 192 || v5 == 224)
    {
      do
      {
        uint64_t v6 = v5 - 16;
        a4 += 16;
        _Q2 = *(int8x16_t *)result;
        uint64_t v7 = (int8x16_t *)(result + 16);
        do
        {
          __asm
          {
            AESE            V0.16B, V2.16B
            AESMC           V0.16B, V0.16B
          }
          _Q2 = *v7++;
          BOOL v15 = v6 <= 16;
          v6 -= 16;
        }
        while (!v15);
        __asm { AESE            V0.16B, V2.16B }
        int8x16_t v17 = veorq_s8(_Q0, *v7);
        uint64_t result = (uint64_t)v7->i64 - v5;
        *a5++ = v17;
        BOOL v15 = a3-- <= 1;
      }
      while (!v15);
      uint64_t result = 0;
      *a2 = v17;
    }
    else
    {
      return -1;
    }
  }
  return result;
}

uint64_t ccentropy_rng_init(void *a1, uint64_t a2)
{
  BOOL v5 = timingsafe_enable_if_supported();
  *a1 = &entropy_rng_info;
  a1[1] = a2;
  cc_disable_dit_with_sb((unsigned int *)&v5);
  return 0;
}

uint64_t ccentropy_rng_get_seed(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 8))();
}

BOOL ccder_blob_encode_body(void *a1, unint64_t a2, const void *a3)
{
  if (!a3) {
    return a2 == 0;
  }
  __dst[0] = 0;
  __dst[1] = 0;
  BOOL v5 = ccder_blob_reserve(a1, a2, __dst);
  if (v5) {
    memmove(__dst[0], a3, a2);
  }
  return v5;
}

uint64_t aes_key_expansion(unint64_t *a1, uint64_t a2, int a3, int a4)
{
  unint64_t v4 = &Rcon;
  *(_DWORD *)(a2 + 240) = 16 * a4;
  if (a3 == 6)
  {
    unint64_t v15 = *a1;
    unint64_t v16 = a1[1];
    unint64_t v14 = (uint64_t *)(a1 + 2);
    *(void *)a2 = v15;
    *(void *)(a2 + 8) = v16;
    int8x16_t v17 = (uint64_t *)(a2 + 16);
    uint64_t v18 = *v14;
    *int8x16_t v17 = *v14;
    uint64_t v19 = (unint64_t *)(v17 + 1);
    int v20 = 4 * a4 - 2;
    do
    {
      HIDWORD(v21) = HIDWORD(v18);
      LODWORD(v21) = HIDWORD(v18);
      unsigned int v22 = *v4++;
      uint64_t result = v22;
      uint64_t v23 = (AESSubBytesWordTable[BYTE5(v18)] | (AESSubBytesWordTable[(v21 >> 8) >> 24] << 24) | (AESSubBytesWordTable[((v21 >> 8) >> 16)] << 16) | (AESSubBytesWordTable[(unsigned __int16)(HIDWORD(v18) >> 8) >> 8] << 8)) ^ v22;
      v15 ^= v23 ^ ((v15 ^ v23) << 32);
      v16 ^= HIDWORD(v15) ^ ((v16 ^ HIDWORD(v15)) << 32);
      v18 ^= HIDWORD(v16) ^ ((v18 ^ HIDWORD(v16)) << 32);
      *uint64_t v19 = v15;
      v19[1] = v16;
      unint64_t v24 = v19 + 2;
      void *v24 = v18;
      uint64_t v19 = v24 + 1;
      BOOL v13 = __OFSUB__(v20, 6);
      v20 -= 6;
    }
    while (!((v20 < 0) ^ v13 | (v20 == 0)));
  }
  else if (a3 == 8)
  {
    unint64_t v26 = *a1;
    unint64_t v27 = a1[1];
    unint64_t v25 = a1 + 2;
    *(void *)a2 = v26;
    *(void *)(a2 + 8) = v27;
    v28 = (unint64_t *)(a2 + 16);
    unint64_t v29 = *v25;
    unint64_t v30 = v25[1];
    unint64_t *v28 = *v25;
    v28[1] = v30;
    v31 = v28 + 2;
    int v32 = 4 * a4 - 4;
    do
    {
      HIDWORD(v33) = HIDWORD(v30);
      LODWORD(v33) = HIDWORD(v30);
      unsigned int v34 = *v4++;
      uint64_t result = v34;
      uint64_t v35 = (AESSubBytesWordTable[BYTE5(v30)] | (AESSubBytesWordTable[(v33 >> 8) >> 24] << 24) | (AESSubBytesWordTable[((v33 >> 8) >> 16)] << 16) | (AESSubBytesWordTable[(unsigned __int16)(HIDWORD(v30) >> 8) >> 8] << 8)) ^ v34;
      v26 ^= v35 ^ ((v26 ^ v35) << 32);
      v27 ^= HIDWORD(v26) ^ ((v27 ^ HIDWORD(v26)) << 32);
      unint64_t *v31 = v26;
      v31[1] = v27;
      unint64_t v36 = v31 + 2;
      int v37 = v32 - 4;
      if (!v37) {
        break;
      }
      uint64_t result = AESSubBytesWordTable[HIBYTE(HIDWORD(v27))];
      uint64_t v38 = AESSubBytesWordTable[BYTE4(v27)] | (result << 24) | (AESSubBytesWordTable[BYTE6(v27)] << 16) | (AESSubBytesWordTable[BYTE5(v27)] << 8);
      v29 ^= v38 ^ ((v29 ^ v38) << 32);
      v30 ^= HIDWORD(v29) ^ ((v30 ^ HIDWORD(v29)) << 32);
      *unint64_t v36 = v29;
      v36[1] = v30;
      v31 = v36 + 2;
      BOOL v13 = __OFSUB__(v37, 4);
      int v32 = v37 - 4;
    }
    while (!((v32 < 0) ^ v13 | (v32 == 0)));
  }
  else
  {
    unint64_t v5 = *a1;
    unint64_t v6 = a1[1];
    *(void *)a2 = *a1;
    *(void *)(a2 + 8) = v6;
    uint64_t v7 = (unint64_t *)(a2 + 16);
    int v8 = 4 * a4;
    do
    {
      HIDWORD(v9) = HIDWORD(v6);
      LODWORD(v9) = HIDWORD(v6);
      unsigned int v11 = *v4++;
      uint64_t result = v11;
      uint64_t v12 = (AESSubBytesWordTable[BYTE5(v6)] | (AESSubBytesWordTable[(v9 >> 8) >> 24] << 24) | (AESSubBytesWordTable[((v9 >> 8) >> 16)] << 16) | (AESSubBytesWordTable[(unsigned __int16)(HIDWORD(v6) >> 8) >> 8] << 8)) ^ v11;
      v5 ^= v12 ^ ((v5 ^ v12) << 32);
      v6 ^= HIDWORD(v5) ^ ((v6 ^ HIDWORD(v5)) << 32);
      *uint64_t v7 = v5;
      v7[1] = v6;
      v7 += 2;
      BOOL v13 = __OFSUB__(v8, 4);
      v8 -= 4;
    }
    while (!((v8 < 0) ^ v13 | (v8 == 0)));
  }
  return result;
}

uint64_t ccaes_arm_encrypt_key128(unint64_t *a1, uint64_t a2)
{
  return aes_key_expansion(a1, a2, 4, 10);
}

uint64_t ccaes_arm_encrypt_key192(unint64_t *a1, uint64_t a2)
{
  return aes_key_expansion(a1, a2, 6, 12);
}

uint64_t ccaes_arm_encrypt_key256(unint64_t *a1, uint64_t a2)
{
  return aes_key_expansion(a1, a2, 8, 14);
}

__n128 aes_dkey_expansion(unint64_t *a1, uint64_t a2, int a3, uint64_t a4)
{
  aes_key_expansion(a1, a2, a3, a4);
  unint64_t v4 = (__n128 *)(a2 + 16);
  uint64_t v5 = a4 - 1;
  do
  {
    --v5;
    _Q0 = *v4;
    __asm { AESIMC          V0.16B, V0.16B }
    *v4++ = result;
  }
  while (!(_NF ^ _VF | _ZF));
  return result;
}

double ccaes_arm_decrypt_key128(unint64_t *a1, uint64_t a2)
{
  *(void *)&double result = aes_dkey_expansion(a1, a2, 4, 10).n128_u64[0];
  return result;
}

double ccaes_arm_decrypt_key192(unint64_t *a1, uint64_t a2)
{
  *(void *)&double result = aes_dkey_expansion(a1, a2, 6, 12).n128_u64[0];
  return result;
}

double ccaes_arm_decrypt_key256(unint64_t *a1, uint64_t a2)
{
  *(void *)&double result = aes_dkey_expansion(a1, a2, 8, 14).n128_u64[0];
  return result;
}

uint64_t ccaes_arm_encrypt_key(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v6 = a2;
  unint64_t v8 = a3;
  if (a3 > 32) {
    unint64_t v8 = (unint64_t)a3 >> 3;
  }
  switch(v8)
  {
    case 0x10uLL:
      ccaes_arm_encrypt_key128(a4, v6);
      break;
    case 0x18uLL:
      ccaes_arm_encrypt_key192(a4, v6);
      break;
    case 0x20uLL:
      ccaes_arm_encrypt_key256(a4, v6);
      break;
    default:
      return -1;
  }
  return 0;
}

uint64_t ccaes_arm_decrypt_key(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v6 = a2;
  unint64_t v8 = a3;
  if (a3 > 32) {
    unint64_t v8 = (unint64_t)a3 >> 3;
  }
  switch(v8)
  {
    case 0x10uLL:
      ccaes_arm_decrypt_key128(a4, v6);
      break;
    case 0x18uLL:
      ccaes_arm_decrypt_key192(a4, v6);
      break;
    case 0x20uLL:
      ccaes_arm_decrypt_key256(a4, v6);
      break;
    default:
      return -1;
  }
  return 0;
}

uint64_t *ccaes_ccm_encrypt_mode()
{
  unint64_t v0 = (*((void *)ccaes_ecb_encrypt_mode() + 1) + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v1 = v0 + ((*(void *)ccaes_ecb_encrypt_mode() + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  unint64_t v2 = ccaes_ecb_encrypt_mode();
  ccm_encrypt_info = v1;
  unk_1002387A0 = xmmword_1001B95F0;
  qword_1002387B0 = (uint64_t)ccmode_ccm_init;
  qword_1002387B8 = (uint64_t)ccmode_ccm_set_iv;
  qword_1002387C0 = (uint64_t)ccmode_ccm_cbcmac;
  qword_1002387C8 = (uint64_t)ccaes_vng_ccm_encrypt_wrapper;
  qword_1002387D0 = (uint64_t)ccmode_ccm_finalize;
  qword_1002387D8 = (uint64_t)ccmode_ccm_reset;
  unk_1002387E0 = v2;
  byte_1002387E8 = 1;
  *(_DWORD *)algn_1002387E9 = 0;
  dword_1002387EC = 0;
  return &ccm_encrypt_info;
}

uint64_t *ccrng_prng(_DWORD *a1)
{
  BOOL v3 = timingsafe_enable_if_supported();
  pthread_once(&ccrng_prng_init_pred, (void (*)(void))init_0);
  if (a1) {
    *a1 = 0;
  }
  cc_disable_dit_with_sb((unsigned int *)&v3);
  return &rng_ctx;
}

uint64_t init_0()
{
  if (ccrng_process_init((uint64_t)&process_rng_ctx, get_time_nsec, (uint64_t (**)(void, uint64_t, _OWORD *))&ccrng_getentropy))cc_abort(); {
  uint64_t result = pthread_atfork((void (*)(void))atfork_prepare, (void (*)(void))atfork_parent, (void (*)(void))atfork_child);
  }
  if (result) {
    cc_abort();
  }
  rng_ctx = (uint64_t)generate;
  return result;
}

uint64_t *ccrng(_DWORD *a1)
{
  return &rng_ctx;
}

uint64_t get_time_nsec()
{
  v1.tv_sec = 0;
  v1.tv_nsec = 0;
  if (clock_gettime(_CLOCK_MONOTONIC, &v1)) {
    cc_abort();
  }
  return v1.tv_nsec + 1000000000 * v1.tv_sec;
}

uint64_t atfork_prepare()
{
  uint64_t result = ccrng_process_atfork_prepare((os_unfair_lock_s *)&process_rng_ctx);
  if (result) {
    cc_abort();
  }
  return result;
}

uint64_t atfork_parent()
{
  uint64_t result = ccrng_process_atfork_parent((os_unfair_lock_s *)&process_rng_ctx);
  if (result) {
    cc_abort();
  }
  return result;
}

uint64_t atfork_child()
{
  uint64_t result = ccrng_process_atfork_child((uint64_t)&process_rng_ctx);
  if (result) {
    cc_abort();
  }
  return result;
}

uint64_t generate()
{
  uint64_t result = process_rng_ctx();
  if (result) {
    cc_abort();
  }
  return result;
}

uint64_t ccaes_arm_encrypt_key_with_length_check(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  if (a3 > 127)
  {
    if (a3 != 128 && a3 != 256 && a3 != 192) {
      return 4294967289;
    }
    return ccaes_arm_encrypt_key(a1, a2, a3, a4);
  }
  if ((unint64_t)a3 <= 0x20 && ((1 << a3) & 0x101010000) != 0) {
    return ccaes_arm_encrypt_key(a1, a2, a3, a4);
  }
  return 4294967289;
}

uint64_t ccec_mult_blinded_ws(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (**a6)(void, uint64_t, uint64_t *))
{
  unint64_t v10 = *a2;
  unint64_t v11 = ccn_bitlen_internal(*a2, a4);
  if (v11 > cczp_bitlen((uint64_t)a2)) {
    return 4294967289;
  }
  uint64_t v17 = 1;
  if (a6)
  {
    uint64_t result = (*a6)(a6, 8, &v17);
    if (result) {
      return result;
    }
    uint64_t v13 = v17 | 0x80000000;
  }
  else
  {
    uint64_t v13 = 2147483649;
  }
  uint64_t v17 = v13;
  uint64_t v14 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, unint64_t))(a1 + 24))(a1, 3 * v10);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v10);
  ccn_mux_seed_mask(v17);
  uint64_t v17 = v17;
  uint64_t result = ccec_mult_ws(a1, (uint64_t)a2);
  if (!result)
  {
    uint64_t v16 = 0;
    ccn_divmod_ws(a1, v10, a4, v10, v15, 1, (char *)&v16, (uint64_t)&v17);
    cczp_bitlen((uint64_t)a2);
    uint64_t result = ccec_mult_ws(a1, (uint64_t)a2);
    if (!result)
    {
      uint64_t result = ccec_mult_ws(a1, (uint64_t)a2);
      if (!result)
      {
        ccec_full_add_ws(a1, (uint64_t)a2);
        uint64_t result = 0;
      }
    }
  }
  *(void *)(a1 + 16) = v14;
  return result;
}

uint64_t ccaes_arm_encrypt_key_with_key_length_check(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  if (a3 > 127)
  {
    if (a3 != 128 && a3 != 256 && a3 != 192) {
      return 4294967289;
    }
    return ccaes_arm_encrypt_key(a1, a2, a3, a4);
  }
  if ((unint64_t)a3 <= 0x20 && ((1 << a3) & 0x101010000) != 0) {
    return ccaes_arm_encrypt_key(a1, a2, a3, a4);
  }
  return 4294967289;
}

uint64_t ccecdh_compute_shared_secret_ws(uint64_t a1, unint64_t **a2, unint64_t **a3, unint64_t *a4, char *a5, uint64_t (**a6)(void, uint64_t, uint64_t *))
{
  unint64_t v11 = *a2;
  uint64_t v21 = *(void *)(a1 + 16);
  uint64_t v12 = 3 * **a2;
  uint64_t v13 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  unint64_t v15 = *a4;
  *a4 = 0;
  unint64_t v16 = ccn_write_uint_size_internal(*v11, v11 + 3);
  if (v15 < v16
    || *a2 != *a3
    || (unint64_t v17 = v16,
        ccec_validate_point_and_projectify_ws(a1, (uint64_t *)v11, (uint64_t)v14, (uint64_t)(a3 + 2)))
    || ccec_validate_scalar(v11, (uint64_t)&a2[3 * **a2 + 2])
    || ccec_mult_blinded_ws(a1, v11, (uint64_t)v13, (uint64_t)&a2[3 * **a2 + 2], (uint64_t)v14, a6)
    || !ccec_is_point_projective_ws(a1, v11)
    || ccec_affinify_x_only_ws(a1, (uint64_t *)v11, (uint64_t)v13, (uint64_t)v13))
  {
    uint64_t v18 = 0xFFFFFFFFLL;
  }
  else
  {
    ccn_write_uint_padded_ct_internal(*v11, v13, v17, a5);
    uint64_t v18 = 0;
    *a4 = v17;
  }
  cc_clear(24 * *v11, v13);
  cc_clear(24 * *v11, v14);
  *(void *)(a1 + 16) = v21;
  return v18;
}

void *ccaes_cbc_encrypt_mode()
{
  return &ccaes_arm_cbc_encrypt_mode;
}

uint64_t ccec_generate_scalar_fips_retry_ws(uint64_t a1, void *a2, uint64_t (**a3)(void, unint64_t, void *), void *a4)
{
  unint64_t v8 = a2 + 4;
  uint64_t v9 = (uint64_t)&a2[5 * *a2 + 4];
  uint64_t v10 = cczp_n(v9);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v10);
  uint64_t v13 = (void *)cczp_prime(v9);
  ccn_set(v10, v12, v13);
  *v12 &= ~1uLL;
  uint64_t v14 = 100;
  while (1)
  {
    uint64_t v15 = cczp_bitlen((uint64_t)&v8[5 * *a2]);
    uint64_t result = ccn_random_bits_fips(v15, a4, a3);
    if (result) {
      break;
    }
    if ((ccn_cmp_internal(v10, a4, v12) & 0x80000000) != 0)
    {
      ccn_add1_ws(a1, v10, a4, a4, 1);
      uint64_t result = 0;
      break;
    }
    if (!--v14)
    {
      uint64_t result = 4294967281;
      break;
    }
  }
  *(void *)(a1 + 16) = v11;
  return result;
}

uint64_t ccn_cond_swap(uint64_t a1, char a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = ccn_mux_next_mask();
  for (uint64_t i = __ROR8__(0x5555555555555555, a2 | (2 * result)); a1; --a1)
  {
    uint64_t v10 = *a4 ^ *a3;
    *a3 ^= result;
    uint64_t v11 = *a4 ^ result;
    *a4 = v11;
    uint64_t v12 = *a3 ^ v10 & 0x5555555555555555;
    uint64_t v13 = v11 ^ v10 & 0x5555555555555555;
    uint64_t v14 = v10 & i;
    *a3++ = v12 ^ v14 ^ result;
    *a4++ = v13 ^ v14 ^ result;
  }
  return result;
}

uint64_t ccec_sign_internal_inner_ws(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t *a8, uint64_t a9, uint64_t (**a10)(void, uint64_t, uint64_t *))
{
  uint64_t v15 = *a2;
  uint64_t v22 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, unint64_t))(a1 + 24))(a1, *a2);
  unint64_t v16 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * v15);
  uint64_t result = ccec_mult_blinded_ws(a1, a2, (uint64_t)v16, a5, a6, a10);
  if (!result)
  {
    uint64_t result = ccec_affinify_x_only_ws(a1, (uint64_t *)a2, (uint64_t)v16, (uint64_t)v16);
    if (!result)
    {
      uint64_t v18 = (uint64_t)&a2[5 * v15 + 4];
      uint64_t v19 = (unint64_t *)cczp_prime(v18);
      BOOL v20 = ccn_sub_ws(a1, v15, a8, v16, v19);
      uint64_t v21 = (uint64_t *)cczp_prime(v18);
      ccn_cond_add(v15, v20, a8, a8, v21);
      if (ccn_n(v15, a8))
      {
        cczp_mul_ws(a1, v18);
        cczp_mul_ws(a1, v18);
        cczp_mul_ws(a1, v18);
        cczp_mul_ws(a1, v18);
        cczp_add_ws(a1, v18);
        uint64_t result = cczp_inv_ws(a1, v18);
        if (!result)
        {
          cczp_mul_ws(a1, v18);
          if (ccn_n(v15, a9)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = 4294967131;
          }
        }
      }
      else
      {
        uint64_t result = 4294967131;
      }
    }
  }
  *(void *)(a1 + 16) = v22;
  return result;
}

uint64_t ccec_sign_internal_ws(uint64_t a1, uint64_t **a2, unint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t (**a7)(void, unint64_t, void *))
{
  uint64_t v11 = *a2;
  uint64_t v13 = (uint64_t)(*a2 + 4);
  uint64_t v12 = **a2;
  if (a3 <= 0xF)
  {
    v31 = cc_log_default();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      ccec_sign_internal_ws_cold_1(a3, v31);
    }
  }
  uint64_t v35 = *(void *)(a1 + 16);
  uint64_t v14 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  v39 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t v36 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * v12);
  uint64_t uint_internal = ccec_projectify_ws(a1, (uint64_t)v11);
  if (uint_internal) {
    goto LABEL_20;
  }
  int v32 = a7;
  int v37 = (void *)v15;
  uint64_t v17 = **a2;
  uint64_t v18 = cczp_bitlen(v13 + 40 * *v11);
  uint64_t v19 = a2;
  unint64_t v20 = v18;
  unint64_t v21 = (unint64_t)(v18 + 7) >> 3 >= a3 ? a3 : (unint64_t)(v18 + 7) >> 3;
  uint64_t uint_internal = ccn_read_uint_internal(v12, v14, v21, a4);
  if ((uint_internal & 0x80000000) != 0)
  {
LABEL_20:
    uint64_t v29 = uint_internal;
    unint64_t v24 = a5;
  }
  else
  {
    uint64_t v22 = (uint64_t)&v19[3 * v17 + 2];
    if (v20 < 8 * a3) {
      ccn_shift_right(v12, v14, v14, -(int)v20 & 7);
    }
    uint64_t v23 = (unint64_t *)cczp_prime(v13 + 40 * v12);
    unint64_t v24 = a5;
    char v25 = ccn_sub_ws(a1, v12, a5, v14->i64, v23);
    ccn_mux(v12, v25, v14->i64, v14->i64, a5);
    uint64_t scalar_fips_retry_ws = ccec_validate_scalar(v11, v22);
    if (!scalar_fips_retry_ws)
    {
      int v27 = 10;
      while (1)
      {
        uint64_t scalar_fips_retry_ws = ccec_generate_scalar_fips_retry_ws(a1, v11, v32, v39);
        if (scalar_fips_retry_ws) {
          break;
        }
        uint64_t scalar_fips_retry_ws = ccec_generate_scalar_fips_retry_ws(a1, v11, v32, v37);
        if (scalar_fips_retry_ws) {
          break;
        }
        uint64_t v28 = ccec_sign_internal_inner_ws(a1, (unint64_t *)v11, (uint64_t)v14, v22, (uint64_t)v39, v36, (uint64_t)v37, a5, (uint64_t)a6, (uint64_t (**)(void, uint64_t, uint64_t *))v32);
        uint64_t v29 = v28;
        if (!v28) {
          goto LABEL_18;
        }
        if (v28 != -165) {
          goto LABEL_17;
        }
        if (!--v27) {
          cc_try_abort();
        }
      }
    }
    uint64_t v29 = scalar_fips_retry_ws;
  }
LABEL_17:
  cc_clear(8 * v12, v24);
  cc_clear(8 * v12, a6);
LABEL_18:
  *(void *)(a1 + 16) = v35;
  return v29;
}

uint64_t cczp_inv_field_ws(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8 = cczp_n(a2);
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v8);
  uint64_t v11 = (unint64_t *)cczp_prime(a2);
  if (ccn_sub1(v8, v10, v11, 2uLL)) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = cczp_power_fast_ws(a1, a2, a3, a4, (uint64_t)v10);
  }
  *(void *)(a1 + 16) = v9;
  return result;
}

uint64_t *ccaes_ctr_crypt_mode()
{
  unint64_t v0 = ((*(void *)ccaes_ecb_encrypt_mode() + 7) & 0xFFFFFFFFFFFFFFF8) + 48;
  timespec v1 = ccaes_ecb_encrypt_mode();
  ctr_crypt = v0;
  unk_100239148 = xmmword_1001B9710;
  qword_100239158 = (uint64_t)ccmode_ctr_init;
  qword_100239160 = (uint64_t)ccmode_ctr_setctr;
  qword_100239168 = (uint64_t)ccaes_vng_ctr_crypt;
  unk_100239170 = v1;
  return &ctr_crypt;
}

void *ccaes_ecb_encrypt_mode()
{
  return &ccaes_arm_ecb_encrypt_mode;
}

void *ccsigma_mfi_info()
{
  return &mfi_info;
}

double mfi_info_init(uint64_t a1)
{
  uint64_t v2 = ccec_cp_256();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = mfi_kex_ctx;
  *(void *)(a1 + 16) = mfi_peer_kex_ctx;
  unint64_t v3 = ((unint64_t)(cczp_bitlen(v2) + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL;
  *(void *)(a1 + 24) = v2;
  *(void *)(a1 + 32) = ccsha256_di();
  *(void *)(a1 + 40) = v3;
  *(void *)(a1 + 48) = mfi_sign_ctx;
  *(void *)(a1 + 56) = mfi_peer_sign_ctx;
  *(void *)(a1 + 64) = 14;
  *(void *)(a1 + 72) = &mfi_session_keys_info;
  *(void *)(a1 + 80) = 200;
  *(void *)(a1 + 88) = mfi_session_keys_buffer;
  *(void *)(a1 + 96) = mfi_session_keys_derive;
  *(void *)(a1 + 104) = 16;
  *(void *)(a1 + 112) = mfi_mac_compute;
  *(void *)&double result = 9;
  *(_OWORD *)(a1 + 120) = xmmword_1001B9720;
  *(void *)(a1 + 136) = mfi_sigma_compute_mac_and_digest;
  *(void *)(a1 + 144) = 16;
  *(void *)(a1 + 152) = mfi_aead_seal;
  *(void *)(a1 + 160) = mfi_aead_open;
  *(void *)(a1 + 168) = mfi_aead_next_iv;
  *(void *)(a1 + 176) = mfi_clear;
  return result;
}

uint64_t mfi_kex_ctx(uint64_t a1)
{
  return a1 + 32;
}

uint64_t mfi_peer_kex_ctx(uint64_t a1)
{
  return a1 + 176;
}

uint64_t mfi_sign_ctx(uint64_t a1)
{
  return a1 + 288;
}

uint64_t mfi_peer_sign_ctx(uint64_t a1)
{
  return a1 + 432;
}

uint64_t mfi_session_keys_buffer(uint64_t a1)
{
  return a1 + 544;
}

uint64_t mfi_session_keys_derive(uint64_t **a1, unint64_t a2, char *a3, size_t a4, const void *a5)
{
  uint64_t v10 = *a1;
  unint64_t v11 = ccec_compressed_x962_export_pub_size(**a1);
  size_t v12 = a4 + 2 * v11 + v10[28];
  if (v12 > 0x100) {
    return 4294967289;
  }
  unint64_t v13 = v11;
  memset(v27, 0, sizeof(v27));
  v26[0] = 0;
  v26[1] = 0;
  uint64_t v14 = ccaes_cbc_encrypt_mode();
  uint64_t result = cccmac_one_shot_generate_internal(v14, v10[24], v10[23], a2, a3, 0x10uLL, v26);
  if (!result)
  {
    uint64_t v16 = v10[28];
    __memcpy_chk();
    uint64_t v17 = (char *)v27 + v16;
    uint64_t inited = (uint64_t *)ccsigma_kex_init_ctx((uint64_t)a1);
    uint64_t result = ccec_compressed_x962_export_pub(inited, v17);
    if (!result)
    {
      uint64_t v19 = &v17[v13];
      unint64_t v20 = (uint64_t *)ccsigma_kex_resp_ctx((uint64_t)a1);
      uint64_t result = ccec_compressed_x962_export_pub(v20, v19);
      if (!result)
      {
        memcpy(&v19[v13], a5, a4);
        unint64_t v21 = ccaes_cbc_encrypt_mode();
        uint64_t v23 = (const void *)v10[25];
        size_t v22 = v10[26];
        rsize_t v24 = v10[10];
        char v25 = (char *)((uint64_t (*)(uint64_t **))v10[11])(a1);
        return ccnistkdf_ctr_cmac_internal(v21, 0x20u, 0x10uLL, (uint64_t)v26, v22, v23, v12, v27, v24, 4uLL, v25);
      }
    }
  }
  return result;
}

uint64_t mfi_mac_compute(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, char *a5, void *a6)
{
  size_t v12 = ccaes_cbc_encrypt_mode();
  size_t v13 = *(void *)(*(void *)a1 + 104);

  return cccmac_one_shot_generate_internal(v12, a2, a3, a4, a5, v13, a6);
}

uint64_t mfi_sigma_compute_mac_and_digest(uint64_t *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *a1;
  uint64_t v11 = *(void *)(*a1 + 32);
  size_t v12 = (*(void *)(v11 + 8) + *(void *)(v11 + 16) + 19) & 0xFFFFFFFFFFFFFFF8;
  size_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v13, v12);
  ccdigest_init_internal(v11, v13);
  ccdigest_update_internal((unint64_t *)v11, v13, *(void *)(v10 + 240), *(char **)(v10 + 232));
  unint64_t v14 = ccec_compressed_x962_export_pub_size(*(void *)v10);
  if (v14 > 0x21) {
    return 4294967291;
  }
  size_t v15 = v14;
  char v21 = 0;
  memset(__src, 0, sizeof(__src));
  uint64_t inited = (uint64_t *)ccsigma_kex_init_ctx((uint64_t)a1);
  ccec_compressed_x962_export_pub(inited, (char *)__src);
  ccdigest_update_internal((unint64_t *)v11, v13, v15, (char *)__src);
  uint64_t v17 = (uint64_t *)ccsigma_kex_resp_ctx((uint64_t)a1);
  ccec_compressed_x962_export_pub(v17, (char *)__src);
  ccdigest_update_internal((unint64_t *)v11, v13, v15, (char *)__src);
  v19[0] = 0;
  v19[1] = 0;
  uint64_t result = ccsigma_compute_mac_internal(a1, *(void *)(v10 + 8 * a2 + 120), a3, a4, (uint64_t)v19);
  if (!result)
  {
    ccdigest_update_internal((unint64_t *)v11, v13, *(void *)(v10 + 104), (char *)v19);
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 56))(v11, v13, a5);
    return 0;
  }
  return result;
}

uint64_t mfi_aead_seal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v18 = ccaes_ccm_encrypt_mode();
  return ccccm_one_shot_internal((uint64_t)v18, a2, a3, a4, a5, a8, a9, a10, a6, a7, *(void *)(*(void *)a1 + 144), a11);
}

uint64_t mfi_aead_open(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char *a11)
{
  unint64_t v11 = *(void *)(*(void *)a1 + 144);
  if (v11 > 0x10) {
    return 4294967291;
  }
  v22[0] = 0;
  v22[1] = 0;
  unint64_t v20 = ccaes_ccm_decrypt_mode();
  uint64_t result = ccccm_one_shot_internal((uint64_t)v20, a2, a3, a4, a5, a8, a9, a10, a6, a7, v11, (uint64_t)v22);
  if (!result)
  {
    if (cc_cmp_safe_internal(*(void *)(*(void *)a1 + 144), a11, (char *)v22)) {
      return 4294967294;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t mfi_aead_next_iv(unint64_t a1, uint64_t a2)
{
  return inc_uint(a2, a1);
}

uint64_t mfi_clear(void *__s)
{
  return cc_clear(0x2F0uLL, __s);
}

uint64_t ccder_blob_decode_range(unsigned __int8 **a1, uint64_t a2, unsigned __int8 **a3)
{
  unint64_t v8 = 0;
  uint64_t result = ccder_blob_decode_tl_internal(a1, a2, &v8, 0);
  if (result)
  {
    uint64_t v6 = *a1;
    uint64_t v7 = &(*a1)[v8];
    *a1 = v7;
    *a3 = v6;
    a3[1] = v7;
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
  return result;
}

uint64_t ccder_blob_decode_len_strict(unsigned __int8 **a1, unint64_t *a2)
{
  return ccder_blob_decode_len_internal(a1, a2, 1);
}

uint64_t ccder_blob_decode_len_internal(unsigned __int8 **a1, unint64_t *a2, int a3)
{
  unint64_t v4 = *a1;
  unint64_t v3 = (unint64_t)a1[1];
  if (*a1) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5 || (unint64_t)v4 >= v3) {
    goto LABEL_10;
  }
  uint64_t v7 = v4 + 1;
  unint64_t v8 = *v4;
  if ((char)*v4 < 0)
  {
    switch(*v4)
    {
      case 0x81u:
        if ((uint64_t)(v3 - (void)v7) >= 1)
        {
          uint64_t v7 = v4 + 2;
          int v10 = (char)v4[1];
          unint64_t v8 = v10;
          if (!a3 || v10 < 0) {
            break;
          }
        }
        goto LABEL_10;
      case 0x82u:
        if ((uint64_t)(v3 - (void)v7) >= 2)
        {
          uint64_t v7 = v4 + 3;
          unint64_t v8 = __rev16(*(unsigned __int16 *)(v4 + 1));
          if (!a3 || v8 >= 0x100) {
            break;
          }
        }
        goto LABEL_10;
      case 0x83u:
        if ((uint64_t)(v3 - (void)v7) >= 3)
        {
          uint64_t v7 = v4 + 4;
          unint64_t v8 = ((unint64_t)v4[1] << 16) | ((unint64_t)v4[2] << 8) | v4[3];
          if (!a3 || v8 >= 0x10000) {
            break;
          }
        }
        goto LABEL_10;
      case 0x84u:
        if ((uint64_t)(v3 - (void)v7) >= 4)
        {
          uint64_t v7 = v4 + 5;
          unint64_t v8 = bswap32(*(_DWORD *)(v4 + 1));
          if (!a3 || v8 >> 24) {
            break;
          }
        }
        goto LABEL_10;
      default:
        goto LABEL_10;
    }
  }
  if (v3 - (unint64_t)v7 < v8)
  {
LABEL_10:
    uint64_t result = 0;
    *a2 = 0;
  }
  else
  {
    *a2 = v8;
    *a1 = v7;
    return 1;
  }
  return result;
}

uint64_t ccder_blob_decode_len(unsigned __int8 **a1, unint64_t *a2)
{
  return ccder_blob_decode_len_internal(a1, a2, 0);
}

uint64_t ccder_blob_decode_tag(unsigned __int8 **a1, unint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = (unint64_t)a1[1];
  if (*a1) {
    BOOL v4 = (unint64_t)v2 >= v3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return 0;
  }
  unsigned int v8 = *v2;
  uint64_t v6 = v2 + 1;
  unint64_t v7 = v8;
  unint64_t v9 = v8 & 0x1F;
  if (v9 == 31)
  {
    unint64_t v9 = 0;
    while (1)
    {
      uint64_t v5 = 0;
      if ((unint64_t)v6 >= v3) {
        break;
      }
      unint64_t v10 = v9;
      if (v9 >> 57) {
        break;
      }
      char v11 = *v6++;
      unint64_t v9 = v11 & 0x7F | (v9 << 7);
      if ((v11 & 0x80) == 0)
      {
        if (v10 >> 54) {
          return 0;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    *a2 = v9 | (v7 >> 5 << 61);
    *a1 = v6;
    return 1;
  }
  return v5;
}

uint64_t ccder_blob_decode_tl_internal(unsigned __int8 **a1, uint64_t a2, unint64_t *a3, int a4)
{
  unint64_t v10 = 0;
  *a3 = 0;
  int v8 = ccder_blob_decode_tag(a1, &v10);
  uint64_t result = 0;
  if (v8 && v10 == a2)
  {
    if (a4) {
      return ccder_blob_decode_len_strict(a1, a3);
    }
    else {
      return ccder_blob_decode_len(a1, a3);
    }
  }
  return result;
}

uint64_t ccder_blob_decode_tl(unsigned __int8 **a1, uint64_t a2, unint64_t *a3)
{
  return ccder_blob_decode_tl_internal(a1, a2, a3, 0);
}

uint64_t ccder_blob_decode_uint64(unsigned __int8 **a1, unint64_t *a2)
{
  if (a2) {
    *a2 = 0;
  }
  unint64_t v7 = 0;
  int v8 = 0;
  uint64_t result = ccder_blob_decode_range(a1, 2, (unsigned __int8 **)&v7);
  if (result)
  {
    BOOL v4 = (unsigned __int8 *)v7;
    if (v7 == (char *)v8 || *v7 < 0) {
      return 0;
    }
    if (*v7) {
      goto LABEL_7;
    }
    BOOL v4 = (unsigned __int8 *)(v7 + 1);
    if (v7 + 1 == (char *)v8)
    {
      BOOL v4 = v8;
    }
    else if (((char)*v4 & 0x80000000) == 0)
    {
      return 0;
    }
LABEL_7:
    unint64_t v7 = (char *)v4;
    if ((unint64_t)(v8 - v4) <= 8)
    {
      if (v4 == v8)
      {
        unint64_t v5 = 0;
        if (!a2) {
          return 1;
        }
      }
      else
      {
        unint64_t v5 = 0;
        do
        {
          unsigned int v6 = *v4++;
          unint64_t v5 = v6 | (v5 << 8);
        }
        while (v4 != v8);
        if (!a2) {
          return 1;
        }
      }
      *a2 = v5;
      return 1;
    }
    return 0;
  }
  return result;
}

BOOL ccder_blob_reserve(void *a1, unint64_t a2, void *a3)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = v3 - *a1;
  if (v4 < a2)
  {
    *a3 = 0;
    a3[1] = 0;
  }
  else
  {
    a1[1] = v3 - a2;
    *a3 = v3 - a2;
    a3[1] = v3;
  }
  return v4 >= a2;
}

uint64_t ccder_blob_encode_len(uint64_t *a1, unint64_t a2)
{
  if (HIDWORD(a2)) {
    return 0;
  }
  uint64_t v3 = *a1;
  unint64_t v2 = a1[1];
  if (a2 > 0x7F)
  {
    if (a2 > 0xFF)
    {
      if (a2 >> 16)
      {
        if (a2 >> 24)
        {
          if (v3 + 5 <= v2)
          {
            *(unsigned char *)(v2 - 5) = -124;
            unint64_t v4 = v2 - 5;
            *(_DWORD *)(v4 + 1) = bswap32(a2);
            goto LABEL_17;
          }
        }
        else if (v3 + 4 <= v2)
        {
          *(unsigned char *)(v2 - 4) = -125;
          unint64_t v4 = v2 - 4;
          *(_WORD *)(v4 + 2) = bswap32(a2) >> 16;
          *(unsigned char *)(v4 + 1) = BYTE2(a2);
          goto LABEL_17;
        }
      }
      else if (v3 + 3 <= v2)
      {
        *(unsigned char *)(v2 - 3) = -126;
        unint64_t v4 = v2 - 3;
        *(_WORD *)(v4 + 1) = bswap32(a2) >> 16;
        goto LABEL_17;
      }
    }
    else if (v3 + 2 <= v2)
    {
      *(unsigned char *)(v2 - 2) = -127;
      unint64_t v4 = v2 - 2;
      *(unsigned char *)(v4 + 1) = a2;
      goto LABEL_17;
    }
    return 0;
  }
  if (v3 + 1 > v2) {
    return 0;
  }
  *(unsigned char *)(v2 - 1) = a2;
  unint64_t v4 = v2 - 1;
LABEL_17:
  *a1 = v3;
  a1[1] = v4;
  return 1;
}

uint64_t ccder_blob_encode_tag(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  unint64_t v4 = a2 & 0x1FFFFFFFFFFFFFFFLL;
  if ((a2 & 0x1FFFFFFFFFFFFFFFLL) > 0x1E)
  {
    if (v4 <= 0x7F)
    {
      if ((unint64_t)(v2 - v3) < 2) {
        return 0;
      }
      *(unsigned char *)(v2 - 1) = a2;
      unsigned int v6 = (unsigned char *)(v2 - 1);
LABEL_18:
      *(v6 - 1) = HIBYTE(a2) | 0x1F;
      unint64_t v5 = v6 - 1;
      goto LABEL_19;
    }
    if (v4 >> 14)
    {
      if (v4 >> 21)
      {
        unint64_t v9 = v2 - v3;
        if (v4 >> 28)
        {
          if (v9 < 6) {
            return 0;
          }
          uint64x2_t v11 = (uint64x2_t)vdupq_n_s64(a2);
          int16x8_t v12 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v11, (uint64x2_t)xmmword_1001B97F0), (int32x4_t)vshlq_u64(v11, (uint64x2_t)xmmword_1001B97E0));
          v12.i64[0] = *(void *)&vmovn_s32((int32x4_t)v12) | 0x80008000800080;
          *(_DWORD *)(v2 - 5) = vmovn_s16(v12).u32[0];
          unsigned int v6 = (unsigned char *)(v2 - 5);
          v6[4] = a2 & 0x7F;
          goto LABEL_18;
        }
        if (v9 < 5) {
          return 0;
        }
        *(unsigned char *)(v2 - 4) = (a2 >> 21) | 0x80;
        unsigned int v6 = (unsigned char *)(v2 - 4);
        v6[3] = a2 & 0x7F;
        v6[2] = (a2 >> 7) | 0x80;
        unsigned int v8 = a2 >> 14;
      }
      else
      {
        if ((unint64_t)(v2 - v3) < 4) {
          return 0;
        }
        *(unsigned char *)(v2 - 3) = (a2 >> 14) | 0x80;
        unsigned int v6 = (unsigned char *)(v2 - 3);
        v6[2] = a2 & 0x7F;
        unsigned int v8 = a2 >> 7;
      }
      char v7 = v8 | 0x80;
    }
    else
    {
      if ((unint64_t)(v2 - v3) < 3) {
        return 0;
      }
      char v7 = a2 & 0x7F;
      *(unsigned char *)(v2 - 2) = (a2 >> 7) | 0x80;
      unsigned int v6 = (unsigned char *)(v2 - 2);
    }
    v6[1] = v7;
    goto LABEL_18;
  }
  if (v2 != v3)
  {
    *(unsigned char *)(v2 - 1) = HIBYTE(a2) & 0xE0 | a2;
    unint64_t v5 = (unsigned char *)(v2 - 1);
LABEL_19:
    *a1 = v3;
    a1[1] = (uint64_t)v5;
    return 1;
  }
  return 0;
}

uint64_t ccder_blob_encode_tl(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  uint64_t result = ccder_blob_encode_len(a1, a3);
  if (result)
  {
    return ccder_blob_encode_tag(a1, a2);
  }
  return result;
}

uint64_t ccder_sizeof(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = ccder_sizeof_tag(a1);
  return v3 + a2 + ccder_sizeof_len(a2);
}

uint64_t ccder_blob_encode_body_tl(uint64_t *a1, unint64_t a2, unint64_t a3, const void *a4)
{
  uint64_t result = ccder_blob_encode_body(a1, a3, a4);
  if (result)
  {
    return ccder_blob_encode_tl(a1, a2, a3);
  }
  return result;
}

uint64_t ccrng_schedule_read(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return 3;
  }
  uint64_t result = (**(uint64_t (***)(uint64_t))a1)(a1);
  *(unsigned char *)(a1 + 8) = result == 3;
  return result;
}

uint64_t ccrng_schedule_notify_reseed(unsigned char *a1)
{
  a1[8] = 0;
  return (*(uint64_t (**)(unsigned char *))(*(void *)a1 + 8))(a1);
}

uint64_t ccrng_schedule_atomic_flag_init(uint64_t result)
{
  *(void *)uint64_t result = ccrng_schedule_atomic_flag_info;
  *(unsigned char *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = 1;
  return result;
}

uint64_t ccrng_schedule_atomic_flag_set(uint64_t result)
{
  *(_DWORD *)(result + 16) = 3;
  return result;
}

uint64_t ccrng_schedule_timer_init(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  *(void *)a1 = ccrng_schedule_timer_info;
  *(unsigned char *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  uint64_t result = a2();
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t ccrng_schedule_tree_init(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)uint64_t result = ccrng_schedule_tree_info;
  *(unsigned char *)(result + 8) = 0;
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = a3;
  return result;
}

uint64_t ccrng_schedule_atomic_flag_read(uint64_t result)
{
  return result;
}

uint64_t ccrng_schedule_timer_read(uint64_t a1)
{
  if ((unint64_t)((*(uint64_t (**)(void))(a1 + 16))() - *(void *)(a1 + 32)) < *(void *)(a1 + 24)) {
    return 1;
  }
  else {
    return 3;
  }
}

uint64_t ccrng_schedule_timer_notify_reseed(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(a1 + 16))();
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t ccrng_schedule_tree_read(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (*(unsigned char *)(v2 + 8))
  {
    unsigned int v3 = 3;
  }
  else
  {
    unsigned int v3 = (**(uint64_t (***)(void))v2)(*(void *)(a1 + 16));
    *(unsigned char *)(v2 + 8) = v3 == 3;
  }
  uint64_t v4 = *(void *)(a1 + 24);
  if (*(unsigned char *)(v4 + 8))
  {
    LODWORD(result) = 3;
  }
  else
  {
    LODWORD(result) = (**(uint64_t (***)(uint64_t))v4)(v4);
    *(unsigned char *)(v4 + 8) = result == 3;
  }
  if (v3 <= result) {
    return result;
  }
  else {
    return v3;
  }
}

uint64_t ccrng_schedule_tree_notify_reseed(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 16);
  v2[8] = 0;
  (*(void (**)(unsigned char *))(*(void *)v2 + 8))(v2);
  unsigned int v3 = *(unsigned char **)(a1 + 24);
  v3[8] = 0;
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)v3 + 8);

  return v4();
}

uint64_t ccder_sizeof_len(unint64_t a1)
{
  if (a1 < 0x80) {
    return 1;
  }
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  uint64_t v4 = 5;
  uint64_t v5 = 6;
  uint64_t v6 = 7;
  uint64_t v7 = 8;
  if (HIBYTE(a1)) {
    uint64_t v7 = 9;
  }
  if (HIWORD(a1)) {
    uint64_t v6 = v7;
  }
  if (a1 >> 40) {
    uint64_t v5 = v6;
  }
  if (HIDWORD(a1)) {
    uint64_t v4 = v5;
  }
  if (a1 >> 24) {
    uint64_t v3 = v4;
  }
  if (a1 >= 0x10000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x100) {
    return v2;
  }
  else {
    return 2;
  }
}

uint64_t ccn_n_asm(uint64_t result, uint64_t *a2)
{
  if (result)
  {
    unint64_t v2 = result;
    uint64_t result = 0;
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = *a2++;
      ++v3;
      if (v4) {
        uint64_t result = v3;
      }
    }
    while (v3 < v2);
  }
  return result;
}

uint64_t ccaes_vng_ctr_crypt(void *a1, unint64_t a2, int8x16_t *a3, int8x16_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = a1[1];
  if (a2)
  {
    unint64_t v10 = a2;
    uint64_t v11 = *a1;
    unint64_t v12 = (unint64_t)(*(void *)(*a1 + 8) + 7) >> 3;
    size_t v13 = a1 + 2;
    unint64_t v14 = (int8x16_t *)&a1[2 * v12 + 2];
    size_t v15 = (int8x16_t *)&a1[v12 + 2];
    uint64_t v16 = &a1[v12];
    while (1)
    {
      if (v7 == 16)
      {
        if (v10 >= 0x10)
        {
          aes_ctr_crypt(a3, a4, v10 & 0xFFFFFFFFFFFFFFF0, v15, v14, a6);
          a4 = (int8x16_t *)((char *)a4 + (v10 & 0xFFFFFFFFFFFFFFF0));
          a3 = (int8x16_t *)((char *)a3 + (v10 & 0xFFFFFFFFFFFFFFF0));
          v10 &= 0xFu;
        }
        (*(void (**)(int8x16_t *, uint64_t, int8x16_t *, void *))(v11 + 24))(v14, 1, v15, a1 + 2);
        uint64_t v17 = 31;
        do
        {
          if ((unint64_t)(v17 - 15) < 9) {
            break;
          }
          __int16 v18 = (*((unsigned char *)v16 + v17--))++ + 1;
        }
        while ((v18 & 0x100) != 0);
        uint64_t v7 = 0;
        uint64_t v19 = 0;
        if (!v10) {
          break;
        }
      }
      uint64_t v20 = 0;
      do
      {
        uint64_t v21 = v20 + 1;
        a4->i8[v20] = *((unsigned char *)v13 + v7 + v20) ^ a3->i8[v20];
        BOOL v22 = (unint64_t)(v20 + 1 + v7) > 0xF || v10 - 1 == v20;
        ++v20;
      }
      while (!v22);
      v7 += v21;
      a3 = (int8x16_t *)((char *)a3 + v21);
      a4 = (int8x16_t *)((char *)a4 + v21);
      v10 -= v21;
      if (!v10) {
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    uint64_t v19 = v7;
  }
  a1[1] = v19;
  return 0;
}

uint64_t ccder_sizeof_tag(uint64_t a1)
{
  unint64_t v1 = a1 & 0x1FFFFFFFFFFFFFFFLL;
  uint64_t v2 = 2;
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  uint64_t v5 = 5;
  if ((a1 & 0x1FFFFFFFFFFFFFFFuLL) >> 28) {
    uint64_t v5 = 6;
  }
  if (v1 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v1 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x80) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x1F) {
    return v2;
  }
  else {
    return 1;
  }
}

void *cczp_to_default_ws(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = cczp_n(a2);

  return ccn_set(v6, a3, a4);
}

uint64_t cczp_to_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 56))();
}

void cc_try_abort()
{
}

uint64_t cc_try_abort_if (uint64_t result)
{
  if (result) {
    cc_abort();
  }
  return result;
}

unint64_t cczp_negate(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v6 = cczp_n(a1);
  BOOL v7 = ccn_n(v6, a3) != 0;
  unsigned int v8 = (uint64_t *)cczp_prime(a1);

  return ccn_cond_rsub(v6, v7, a2, a3, v8);
}

unint64_t cczp_cond_negate(uint64_t a1, unsigned __int8 a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t v8 = cczp_n(a1);
  uint64_t v9 = (ccn_n(v8, a4) != 0) & a2;
  unint64_t v10 = (uint64_t *)cczp_prime(a1);

  return ccn_cond_rsub(v8, v9, a3, a4, v10);
}

void *cczp_from_default_ws(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = cczp_n(a2);

  return ccn_set(v6, a3, a4);
}

uint64_t cczp_from_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 64))();
}

unint64_t ccn_mul1_asm(uint64_t a1, void *a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v4 = 0;
  if (a1)
  {
    unint64_t v5 = *a3++;
    unint64_t v4 = (v5 * (unsigned __int128)a4) >> 64;
    *a2++ = v5 * a4;
    --a1;
  }
  if ((a1 & 2) != 0)
  {
    unint64_t v6 = *a3;
    unint64_t v7 = a3[1];
    a3 += 2;
    unsigned long long v8 = v6 * (unsigned __int128)a4 + __PAIR128__(v7 * a4, v4);
    unint64_t v4 = (__CFADD__(__CFADD__(v6 * a4, v4), (v6 * (unsigned __int128)a4) >> 64) | __CFADD__(v7 * a4, *((void *)&v8 + 1)))+ ((v7 * (unsigned __int128)a4) >> 64);
    *(_OWORD *)a2 = v8;
    a2 += 2;
    a1 -= 2;
  }
  while (1)
  {
    BOOL v9 = a1 < 4;
    a1 -= 4;
    if (v9) {
      break;
    }
    unint64_t v11 = *a3;
    unint64_t v12 = a3[1];
    unint64_t v10 = a3 + 2;
    unint64_t v14 = *v10;
    unint64_t v15 = v10[1];
    a3 = v10 + 2;
    uint64_t v16 = (v12 * (unsigned __int128)a4) >> 64;
    BOOL v17 = __CFADD__(__CFADD__(v11 * a4, v4), (v11 * (unsigned __int128)a4) >> 64);
    unsigned long long v13 = v11 * (unsigned __int128)a4 + __PAIR128__(v12 * a4, v4);
    *(_OWORD *)a2 = v13;
    __int16 v18 = a2 + 2;
    uint64_t v19 = (v14 * (unsigned __int128)a4) >> 64;
    uint64_t v20 = v16 + (v17 | __CFADD__(v12 * a4, *((void *)&v13 + 1))) + v14 * a4;
    uint64_t v22 = __CFADD__(v17 | __CFADD__(v12 * a4, *((void *)&v13 + 1)), v14 * a4) | __CFADD__(v16, (v17 | __CFADD__(v12 * a4, *((void *)&v13 + 1))) + v14 * a4);
    BOOL v17 = __CFADD__(v22, v19);
    uint64_t v21 = v22 + v19;
    unint64_t v4 = (v17 | __CFADD__(v15 * a4, v21)) + ((v15 * (unsigned __int128)a4) >> 64);
    void *v18 = v20;
    v18[1] = v15 * a4 + v21;
    a2 = v18 + 2;
  }
  return v4;
}

uint64_t ccdigest_internal(uint64_t a1, size_t a2, char *a3, uint64_t a4)
{
  size_t v8 = (*(void *)(a1 + 8) + *(void *)(a1 + 16) + 19) & 0xFFFFFFFFFFFFFFF8;
  BOOL v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v9, v8);
  ccdigest_init_internal(a1, v9);
  ccdigest_update_internal((unint64_t *)a1, v9, a2, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(a1 + 56))(a1, v9, a4);
  return cc_clear(*(void *)(a1 + 8) + *(void *)(a1 + 16) + 12, v9);
}

uint64_t ccdigest(uint64_t a1, size_t a2, char *a3, uint64_t a4)
{
  BOOL v9 = timingsafe_enable_if_supported();
  ccdigest_internal(a1, a2, a3, a4);
  return cc_disable_dit_with_sb((unsigned int *)&v9);
}

int8x16_t *ccm128_decrypt(int8x16_t *a1, int8x16_t *a2, int8x16_t *a3, int a4, int8x16_t *a5, int8x16_t *a6, unsigned int a7)
{
  int8x16_t v7 = *(int8x16_t *)&qword_100178FC0[2 * a7];
  _Q16 = *a5;
  _Q17 = a5[1];
  _Q18 = a5[2];
  _Q19 = a5[3];
  size_t v8 = a5 + 4;
  _Q20 = *v8;
  _Q21 = v8[1];
  _Q22 = v8[2];
  _Q23 = v8[3];
  v8 += 4;
  _Q24 = *v8;
  _Q25 = v8[1];
  int8x16_t v19 = v8[2];
  int64x2_t v20 = (int64x2_t)vqtbl1q_s8(*a6, *(int8x16_t *)Lbswap_mask);
  int64x2_t v21 = (int64x2_t)vorrq_s8(vandq_s8((int8x16_t)vaddq_s64(v20, *(int64x2_t *)qword_100178FC0), v7), vbicq_s8((int8x16_t)v20, v7));
  int8x16_t v23 = *a1;
  uint64_t result = a1 + 1;
  __asm
  {
    AESE            V3.16B, V16.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V17.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V18.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V19.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V20.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V21.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V22.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V23.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V24.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V25.16B
  }
  *a2 = veorq_s8(v23, veorq_s8(_Q3, v19));
  v47 = a2 + 1;
  int v48 = a4 - 1;
  if (v48)
  {
    do
    {
      int64x2_t v21 = (int64x2_t)vorrq_s8(vandq_s8((int8x16_t)vaddq_s64(v21, *(int64x2_t *)qword_100178FC0), v7), vbicq_s8((int8x16_t)v21, v7));
      int8x16_t v49 = *result++;
      __asm
      {
        AESE            V3.16B, V16.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V16.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V17.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V17.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V18.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V18.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V19.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V19.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V20.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V20.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V21.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V21.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V22.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V22.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V23.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V23.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V24.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V24.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V25.16B
        AESE            V1.16B, V25.16B
      }
      *v47++ = veorq_s8(v49, veorq_s8(_Q3, v19));
      _VF = __OFSUB__(v48--, 1);
    }
    while (!((v48 < 0) ^ _VF | (v48 == 0)));
  }
  __asm
  {
    AESE            V1.16B, V16.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V17.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V18.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V19.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V20.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V21.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V22.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V23.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V24.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V25.16B
  }
  *a6 = vqtbl1q_s8((int8x16_t)v21, *(int8x16_t *)Lbswap_mask);
  *a3 = veorq_s8(_Q1, v19);
  return result;
}

int8x16_t *ccm192_decrypt(int8x16_t *a1, int8x16_t *a2, int8x16_t *a3, int a4, int8x16_t *a5, int8x16_t *a6, unsigned int a7)
{
  int8x16_t v7 = *(int8x16_t *)&qword_100178FC0[2 * a7];
  _Q16 = *a5;
  _Q17 = a5[1];
  _Q18 = a5[2];
  _Q19 = a5[3];
  size_t v8 = a5 + 4;
  _Q20 = *v8;
  _Q21 = v8[1];
  _Q22 = v8[2];
  _Q23 = v8[3];
  v8 += 4;
  _Q24 = *v8;
  _Q25 = v8[1];
  _Q26 = v8[2];
  _Q27 = v8[3];
  int8x16_t v21 = v8[4];
  int64x2_t v22 = (int64x2_t)vqtbl1q_s8(*a6, *(int8x16_t *)Lbswap_mask);
  int64x2_t v23 = (int64x2_t)vorrq_s8(vandq_s8((int8x16_t)vaddq_s64(v22, *(int64x2_t *)qword_100178FC0), v7), vbicq_s8((int8x16_t)v22, v7));
  int8x16_t v25 = *a1;
  uint64_t result = a1 + 1;
  __asm
  {
    AESE            V3.16B, V16.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V17.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V18.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V19.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V20.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V21.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V22.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V23.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V24.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V25.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V26.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V27.16B
  }
  *a2 = veorq_s8(v25, veorq_s8(_Q3, v21));
  uint64_t v53 = a2 + 1;
  int v54 = a4 - 1;
  if (v54)
  {
    do
    {
      int64x2_t v23 = (int64x2_t)vorrq_s8(vandq_s8((int8x16_t)vaddq_s64(v23, *(int64x2_t *)qword_100178FC0), v7), vbicq_s8((int8x16_t)v23, v7));
      int8x16_t v55 = *result++;
      __asm
      {
        AESE            V3.16B, V16.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V16.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V17.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V17.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V18.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V18.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V19.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V19.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V20.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V20.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V21.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V21.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V22.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V22.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V23.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V23.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V24.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V24.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V25.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V25.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V26.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V26.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V27.16B
        AESE            V1.16B, V27.16B
      }
      *v53++ = veorq_s8(v55, veorq_s8(_Q3, v21));
      _VF = __OFSUB__(v54--, 1);
    }
    while (!((v54 < 0) ^ _VF | (v54 == 0)));
  }
  __asm
  {
    AESE            V1.16B, V16.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V17.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V18.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V19.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V20.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V21.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V22.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V23.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V24.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V25.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V26.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V27.16B
  }
  *a6 = vqtbl1q_s8((int8x16_t)v23, *(int8x16_t *)Lbswap_mask);
  *a3 = veorq_s8(_Q1, v21);
  return result;
}

int8x16_t *ccm256_decrypt(int8x16_t *a1, int8x16_t *a2, int8x16_t *a3, int a4, int8x16_t *a5, int8x16_t *a6, unsigned int a7)
{
  int8x16_t v7 = *(int8x16_t *)&qword_100178FC0[2 * a7];
  _Q16 = *a5;
  _Q17 = a5[1];
  _Q18 = a5[2];
  _Q19 = a5[3];
  size_t v8 = a5 + 4;
  _Q20 = *v8;
  _Q21 = v8[1];
  _Q22 = v8[2];
  _Q23 = v8[3];
  v8 += 4;
  _Q24 = *v8;
  _Q25 = v8[1];
  _Q26 = v8[2];
  _Q27 = v8[3];
  v8 += 4;
  _Q28 = *v8;
  _Q29 = v8[1];
  int8x16_t v23 = v8[2];
  int64x2_t v24 = (int64x2_t)vqtbl1q_s8(*a6, *(int8x16_t *)Lbswap_mask);
  int64x2_t v25 = (int64x2_t)vorrq_s8(vandq_s8((int8x16_t)vaddq_s64(v24, *(int64x2_t *)qword_100178FC0), v7), vbicq_s8((int8x16_t)v24, v7));
  int8x16_t v27 = *a1;
  uint64_t result = a1 + 1;
  __asm
  {
    AESE            V3.16B, V16.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V17.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V18.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V19.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V20.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V21.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V22.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V23.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V24.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V25.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V26.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V27.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V28.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V29.16B
  }
  *a2 = veorq_s8(v27, veorq_s8(_Q3, v23));
  BOOL v59 = a2 + 1;
  int v60 = a4 - 1;
  if (v60)
  {
    do
    {
      int64x2_t v25 = (int64x2_t)vorrq_s8(vandq_s8((int8x16_t)vaddq_s64(v25, *(int64x2_t *)qword_100178FC0), v7), vbicq_s8((int8x16_t)v25, v7));
      int8x16_t v61 = *result++;
      __asm
      {
        AESE            V3.16B, V16.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V16.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V17.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V17.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V18.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V18.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V19.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V19.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V20.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V20.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V21.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V21.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V22.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V22.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V23.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V23.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V24.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V24.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V25.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V25.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V26.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V26.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V27.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V27.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V28.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V28.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V29.16B
        AESE            V1.16B, V29.16B
      }
      *v59++ = veorq_s8(v61, veorq_s8(_Q3, v23));
      _VF = __OFSUB__(v60--, 1);
    }
    while (!((v60 < 0) ^ _VF | (v60 == 0)));
  }
  __asm
  {
    AESE            V1.16B, V16.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V17.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V18.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V19.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V20.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V21.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V22.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V23.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V24.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V25.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V26.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V27.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V28.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V29.16B
  }
  *a6 = vqtbl1q_s8((int8x16_t)v25, *(int8x16_t *)Lbswap_mask);
  *a3 = veorq_s8(_Q1, v23);
  return result;
}

uint64_t ccdigest_final_64be(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = (uint64_t)a2 + v7 + 8;
  if (v6 <= *(unsigned int *)(v8 + v6)) {
    *(_DWORD *)(v8 + v6) = 0;
  }
  size_t v9 = (v7 + v6 + 19) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = (uint64_t *)((char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v10, v9);
  memcpy(v10, a2, v7 + v6 + 12);
  uint64_t v11 = (char *)v10 + v7;
  uint64_t v12 = (uint64_t)v10 + v7 + 8;
  unsigned long long v13 = (char *)(v12 + v6);
  uint64_t v14 = *(unsigned int *)(v12 + v6);
  *v10 += (8 * v14);
  *(_DWORD *)(v12 + v6) = v14 + 1;
  *(unsigned char *)(v12 + v14) = 0x80;
  unint64_t v15 = *(unsigned int *)(v12 + v6);
  if (v15 < 0x39)
  {
    if (v15 == 56) {
      goto LABEL_9;
    }
  }
  else
  {
    if (v15 <= 0x3F)
    {
      do
      {
        *(_DWORD *)unsigned long long v13 = v15 + 1;
        *(unsigned char *)(v12 + v15) = 0;
        unint64_t v15 = *(unsigned int *)v13;
      }
      while (v15 < 0x40);
    }
    (*(void (**)(void *, uint64_t))(a1 + 48))(v10 + 1, 1);
    unint64_t v15 = 0;
    uint64_t v11 = (char *)v10 + *(void *)(a1 + 8);
    uint64_t v12 = (uint64_t)(v11 + 8);
    unsigned long long v13 = &v11[*(void *)(a1 + 16) + 8];
    *(_DWORD *)unsigned long long v13 = 0;
  }
  do
  {
    *(_DWORD *)unsigned long long v13 = v15 + 1;
    *(unsigned char *)(v12 + v15) = 0;
    unint64_t v15 = *(unsigned int *)v13;
  }
  while (v15 < 0x38);
LABEL_9:
  *((void *)v11 + 8) = bswap64(*v10);
  (*(void (**)(void *, uint64_t))(a1 + 48))(v10 + 1, 1);
  if (*(void *)a1 >= 4uLL)
  {
    unsigned int v16 = 0;
    unint64_t v17 = 0;
    unsigned int v18 = 1;
    do
    {
      *(_DWORD *)(a3 + v16) = bswap32(*((_DWORD *)v10 + v17 + 2));
      unint64_t v17 = v18++;
      v16 += 4;
    }
    while (v17 < *(void *)a1 >> 2);
  }
  return cc_clear(*(void *)(a1 + 8) + *(void *)(a1 + 16) + 12, v10);
}

void *ccdigest_init_internal(uint64_t a1, void *a2)
{
  uint64_t result = memcpy(a2 + 1, *(const void **)(a1 + 40), *(void *)(a1 + 8));
  *a2 = 0;
  *(_DWORD *)((char *)a2 + *(void *)(a1 + 8) + *(void *)(a1 + 16) + 8) = 0;
  return result;
}

unint64_t ccec_signature_r_s_size(uint64_t *a1)
{
  return (unint64_t)(cczp_bitlen(*a1) + 7) >> 3;
}

unint64_t *ccdigest_update_internal(unint64_t *result, void *a2, size_t a3, char *__src)
{
  size_t v5 = a3;
  uint64_t v7 = result;
  unint64_t v8 = result[2];
  uint64_t v9 = (uint64_t)a2 + result[1] + 8;
  if (v8 <= *(unsigned int *)(v9 + v8)) {
    *(_DWORD *)(v9 + v8) = 0;
  }
  if (a3)
  {
    unint64_t v10 = a2 + 1;
    do
    {
      size_t v11 = v7[2];
      uint64_t v12 = (char *)v10 + v7[1];
      uint64_t v13 = *(unsigned int *)&v12[v11];
      if (v5 > v11 && v13 == 0)
      {
        if (v11 == 128)
        {
          size_t v22 = v5 >> 7;
          size_t v16 = v5 & 0xFFFFFFFFFFFFFF80;
        }
        else if (v11 == 64)
        {
          size_t v22 = v5 >> 6;
          size_t v16 = v5 & 0xFFFFFFFFFFFFFFC0;
        }
        else
        {
          size_t v22 = v5 / v11;
          size_t v16 = v5 / v11 * v11;
        }
        uint64_t result = (unint64_t *)((uint64_t (*)(void *, size_t, char *))v7[6])(a2 + 1, v22, __src);
        *a2 += 8 * v16;
      }
      else
      {
        size_t v15 = v11 - v13;
        if (v15 >= v5) {
          size_t v16 = v5;
        }
        else {
          size_t v16 = v15;
        }
        uint64_t result = (unint64_t *)memcpy(&v12[v13], __src, v16);
        unint64_t v17 = v7[2];
        unsigned int v18 = (char *)v10 + v7[1];
        uint64_t v19 = (*(_DWORD *)&v18[v17] + v16);
        *(_DWORD *)&v18[v17] = v19;
        if (v17 == v19)
        {
          uint64_t result = (unint64_t *)((uint64_t (*)(void *, uint64_t))v7[6])(a2 + 1, 1);
          unint64_t v20 = v7[2];
          int8x16_t v21 = (char *)v10 + v7[1];
          *a2 += (8 * *(_DWORD *)&v21[v20]);
          *(_DWORD *)&v21[v20] = 0;
        }
      }
      __src += v16;
      v5 -= v16;
    }
    while (v5);
  }
  return result;
}

void *ccdrbg_factory_nistctr(void *result, uint64_t a2)
{
  *uint64_t result = 88;
  result[1] = init_1;
  result[3] = generate_0;
  result[2] = reseed;
  result[4] = done;
  result[5] = a2;
  result[6] = must_reseed;
  return result;
}

uint64_t init_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8)
{
  uint64_t v12 = *(uint64_t **)(a1 + 40);
  cc_clear(0x58uLL, (void *)a2);
  uint64_t v18 = *v12;
  rsize_t v19 = v12[1];
  *(void *)(a2 + 56) = *v12;
  *(void *)(a2 + 64) = v19;
  *(_DWORD *)(a2 + 72) = *((_DWORD *)v12 + 4);
  uint64_t v20 = v12[3];
  *(void *)(a2 + 80) = v20;
  if (v19 >= 0x21 || *(void *)(v18 + 16) != 16) {
    cc_try_abort();
  }
  if (!v20)
  {
    if (v19 + 16 >= a7 && v19 + 16 == a3)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long __s = 0u;
      __memcpy_chk();
      for (; a7; --a7)
        *((unsigned char *)&v26 + a7 + 7) ^= *(unsigned char *)(a8 - 1 + a7);
      goto LABEL_8;
    }
    uint64_t v21 = 4294967233;
LABEL_16:
    cc_clear(0x20uLL, (void *)a2);
    cc_clear(0x10uLL, (void *)(a2 + 32));
    uint64_t v23 = -1;
    goto LABEL_9;
  }
  uint64_t v21 = 4294967233;
  if ((unint64_t)(a3 - 65537) < 0xFFFFFFFFFFFF000FLL || a7 > 0x10000) {
    goto LABEL_16;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long __s = 0u;
  HIBYTE(v26) = HIBYTE(a8);
  uint64_t v22 = derive(a2, &__s, 3u, v13, v14, v15, v16, v17, a3);
  if (v22)
  {
    uint64_t v21 = v22;
    goto LABEL_16;
  }
  rsize_t v19 = *(void *)(a2 + 64);
LABEL_8:
  cc_clear(v19, (void *)a2);
  cc_clear(0x10uLL, (void *)(a2 + 32));
  update(a2, (uint64_t)&__s);
  uint64_t v21 = 0;
  uint64_t v23 = 1;
LABEL_9:
  *(void *)(a2 + 48) = v23;
  cc_clear(0x30uLL, &__s);
  return v21;
}

uint64_t generate_0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  memset(__s, 0, sizeof(__s));
  v23[0] = 0;
  v23[1] = 0;
  size_t v8 = (ccctr_context_size(*(void *)(a1 + 56)) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = (char *)v22 - v8;
  bzero((char *)v22 - v8, v8);
  if (a2 > 0x10000) {
    goto LABEL_22;
  }
  if (*(_DWORD *)(a1 + 72) && *(void *)(a1 + 48) > 0x1000000000000uLL)
  {
    uint64_t v16 = 4294967234;
    goto LABEL_21;
  }
  if (!a4) {
    goto LABEL_12;
  }
  if (*(void *)(a1 + 80))
  {
    if (a4 <= 0x10000)
    {
      uint64_t v15 = derive(a1, __s, 1u, v10, v11, v12, v13, v14, a4);
      if (v15)
      {
        uint64_t v16 = v15;
        goto LABEL_21;
      }
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v16 = 4294967233;
    goto LABEL_21;
  }
  if (*(void *)(a1 + 64) + 16 < a4) {
    goto LABEL_22;
  }
  cc_clear(0x30uLL, __s);
  __memcpy_chk();
LABEL_11:
  update(a1, (uint64_t)__s);
LABEL_12:
  v22[1] = v22;
  inc_uint(a1 + 40, 8uLL);
  ccctr_init_internal(*(void *)(a1 + 56));
  for (uint64_t i = -(int)a2 & 0xFLL; a2; a2 -= v18)
  {
    if (a2 >= 0x80) {
      uint64_t v18 = 128;
    }
    else {
      uint64_t v18 = a2;
    }
    ccctr_update_internal(*(void *)(a1 + 56), (uint64_t)v9, v18, (uint64_t)&zeros, a3);
    a3 += v18;
  }
  ccctr_update_internal(*(void *)(a1 + 56), (uint64_t)v9, i, (uint64_t)&zeros, (uint64_t)v23);
  cc_clear(i, v23);
  if (a4) {
    rsize_t v19 = __s;
  }
  else {
    rsize_t v19 = &zeros;
  }
  update_with_ctr(a1, (uint64_t)v9, (uint64_t)v19);
  rsize_t v20 = ccctr_context_size(*(void *)(a1 + 56));
  cc_clear(v20, v9);
  uint64_t v16 = 0;
  ++*(void *)(a1 + 48);
LABEL_21:
  cc_clear(0x30uLL, __s);
  return v16;
}

uint64_t reseed(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = a4;
  memset(__s, 0, sizeof(__s));
  if (!a1[10])
  {
    unint64_t v14 = a1[8] + 16;
    if (v14 < a4 || v14 != a2) {
      return 4294967233;
    }
    __memcpy_chk();
    for (; v9; --v9)
      *((unsigned char *)&v16 + v9 + 7) ^= *(unsigned char *)(a5 - 1 + v9);
    goto LABEL_6;
  }
  uint64_t v11 = 4294967233;
  if (a2 <= 0x10000 && a4 <= 0x10000 && *(void *)(a1[7] + 16) <= a2)
  {
    HIBYTE(v16) = HIBYTE(a5);
    uint64_t v12 = derive((uint64_t)a1, __s, 2u, a4, a5, a6, a7, a8, a2);
    if (v12)
    {
      uint64_t v11 = v12;
      goto LABEL_7;
    }
LABEL_6:
    update((uint64_t)a1, (uint64_t)__s);
    uint64_t v11 = 0;
    a1[6] = 1;
LABEL_7:
    cc_clear(a1[8] + 16, __s);
  }
  return v11;
}

uint64_t done(char *__s)
{
  cc_clear(0x20uLL, __s);
  uint64_t result = cc_clear(0x10uLL, __s + 32);
  *((void *)__s + 6) = -1;
  return result;
}

BOOL must_reseed(uint64_t a1)
{
  return *(_DWORD *)(a1 + 72) && *(void *)(a1 + 48) > 0x1000000000000uLL;
}

uint64_t derive(uint64_t a1, void *a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  uint64_t v15 = &a9;
  if (a3)
  {
    uint64_t v10 = a3;
    uint64_t v11 = (uint64_t *)v16 + 1;
    uint64_t v12 = a3;
    do
    {
      uint64_t v13 = v15;
      *uint64_t v11 = *v15;
      v15 += 2;
      *(v11 - 1) = v13[1];
      v11 += 2;
      --v12;
    }
    while (v12);
  }
  else
  {
    uint64_t v10 = 0;
  }
  return ccdrbg_df_derive_keys(*(uint64_t (***)(void))(a1 + 80), v10, (uint64_t)v16, *(void *)(a1 + 64) + 16, a2);
}

uint64_t update(uint64_t a1, uint64_t a2)
{
  size_t v4 = (ccctr_context_size(*(void *)(a1 + 56)) + 15) & 0xFFFFFFFFFFFFFFF0;
  size_t v5 = (char *)&v8 - v4;
  bzero((char *)&v8 - v4, v4);
  inc_uint(a1 + 40, 8uLL);
  ccctr_init_internal(*(void *)(a1 + 56));
  update_with_ctr(a1, (uint64_t)v5, a2);
  rsize_t v6 = ccctr_context_size(*(void *)(a1 + 56));
  return cc_clear(v6, v5);
}

uint64_t update_with_ctr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ccctr_update_internal(*(void *)(a1 + 56), a2, *(void *)(a1 + 64), a3, a1);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = a3 + *(void *)(a1 + 64);

  return ccctr_update_internal(v6, a2, 16, v7, a1 + 32);
}

uint64_t ccec_affinify_jacobian_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *a2;
  if (ccec_is_point_at_infinity(a2, a4)) {
    return 4294967289;
  }
  uint64_t v8 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  uint64_t v9 = cczp_inv_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_from_ws(a1, (uint64_t)a2);
  cczp_from_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v8;
  return v9;
}

uint64_t ccec_affinify_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 80))();
}

uint64_t ccec_affinify_x_only_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *a2;
  if (ccec_is_point_at_infinity(a2, a4)) {
    return 4294967289;
  }
  uint64_t v8 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  cczp_sqr_ws(a1, (uint64_t)a2);
  uint64_t v9 = cczp_inv_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_from_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v8;
  return v9;
}

uint64_t ccn_sqr_ws(uint64_t a1, unint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * a2);
  uint64_t result = ccn_mul1(a2 - 1, v9 + 8, a4 + 1, *a4);
  *(void *)(v9 + 8 * a2) = result;
  long long v11 = *a4;
  *a3 = *a4 * *a4;
  unint64_t v12 = *(void *)(v9 + 8);
  if (__CFADD__((unsigned __int128)(v11 * v11) >> 64, 2 * v12)) {
    uint64_t v13 = (v12 >> 63) + 1;
  }
  else {
    uint64_t v13 = v12 >> 63;
  }
  a3[1] = (__PAIR128__(2, v11) * v11) >> 64;
  unint64_t v14 = a2 - 2;
  if (a2 >= 2)
  {
    uint64_t v15 = 0;
    uint64_t v16 = v9 + 8 * a2 + 8;
    uint64_t v17 = (unint64_t *)(v9 + 24);
    uint64_t v18 = a3 + 3;
    do
    {
      uint64_t result = ccn_addmul1(v14, v17, &a4[v15 + 2], a4[v15 + 1]);
      *(void *)(v16 + v15 * 8) = result;
      unint64_t v19 = a4[v15 + 1];
      uint64_t v20 = (v19 * (unsigned __int128)v19) >> 64;
      unint64_t v21 = v19 * v19;
      BOOL v22 = __CFADD__(v21, v13);
      unint64_t v23 = v21 + v13;
      if (v22) {
        ++v20;
      }
      unint64_t v24 = *(v17 - 1);
      *(v18 - 1) = v23 + 2 * v24;
      unint64_t v25 = *v17;
      v17 += 2;
      uint64_t v26 = v25 >> 63;
      BOOL v22 = __CFADD__(v20, 2 * v25);
      uint64_t v27 = v20 + 2 * v25;
      if (v22) {
        uint64_t v28 = v26 + 1;
      }
      else {
        uint64_t v28 = v26;
      }
      BOOL v22 = __CFADD__(__CFADD__(v23, 2 * v24), v27) | __CFADD__(v24 >> 63, __CFADD__(v23, 2 * v24) + v27);
      unint64_t v29 = (v24 >> 63) + __CFADD__(v23, 2 * v24) + v27;
      if (v22) {
        uint64_t v13 = v28 + 1;
      }
      else {
        uint64_t v13 = v28;
      }
      unint64_t *v18 = v29;
      v18 += 2;
      ++v15;
      --v14;
    }
    while (v14 != -1);
  }
  *(void *)(a1 + 16) = v8;
  return result;
}

uint64_t ccn_p256_to_ws(uint64_t a1, uint64_t a2)
{
  return cczp_mul_ws(a1, a2);
}

uint64_t ccn_p384_to_ws(uint64_t a1, uint64_t a2)
{
  return cczp_mul_ws(a1, a2);
}

void *ccec_cp_521()
{
  return &ccec_cp521;
}

uint64_t ccn_mod_521_ws(uint64_t a1, uint64_t a2, uint64_t *a3, int8x16_t *a4)
{
  uint64_t v15 = 0;
  memset(v14, 0, sizeof(v14));
  uint64_t v13 = 0;
  memset(v12, 0, sizeof(v12));
  ccn_shift_right(9, v12, a4 + 4, 9);
  v13 += a4[4].i64[0] & 0x1FF;
  uint64_t v8 = ccn_add_ws(a1, 8, v12, v12[0].i64, a4->i64);
  v13 += v8;
  uint64_t v9 = (unint64_t *)cczp_prime(a2);
  char v10 = ccn_sub_ws(a1, 9, v14, v12[0].i64, v9);
  return ccn_mux(9, v10, a3, v12[0].i64, (uint64_t *)v14);
}

uint64_t ccec_double_ws(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  uint64_t result = cczp_sub_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

uint64_t ccec_export_pub(uint64_t *a1, char *a2)
{
  uint64_t v3 = (unint64_t *)(a1 + 2);
  uint64_t v4 = (unint64_t *)*a1;
  unint64_t v6 = ((unint64_t)(cczp_bitlen(*a1) + 7) >> 2) | 1;
  return ccec_export_affine_point_public_value(v4, 1, v3, &v6, a2);
}

uint64_t ccec_add_normalized_ws(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v9 = *a2;
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, *a2);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  if (a6) {
    cczp_add_ws(a1, (uint64_t)a2);
  }
  else {
    cczp_sub_ws(a1, (uint64_t)a2);
  }
  if (ccn_n(v9, v10) || ccn_n(v9, v11))
  {
    if (ccn_n(v9, v10) || !ccn_n(v9, v11))
    {
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      uint64_t result = cczp_div2_ws(a1, (uint64_t)a2, (int8x16_t *)&a3[v9], &a3[v9]);
    }
    else
    {
      ccn_seti(v9, a3, 1);
      cczp_to_ws(a1, (uint64_t)a2);
      ccn_set(v9, &a3[v9], a3);
      uint64_t result = cc_clear(8 * v9, &a3[2 * v9]);
    }
  }
  else
  {
    uint64_t result = ccec_double_ws(a1, a2);
  }
  *(void *)(a1 + 16) = v14;
  return result;
}

uint64_t ccec_full_add_normalized_ws(uint64_t a1, uint64_t *a2, char *a3, uint64_t a4, char *a5)
{
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *a2;
  if (ccec_is_point_at_infinity(a2, a4))
  {
    ccn_set(v11, a3, a5);
    ccn_set(v11, &a3[8 * *a2], &a5[8 * *a2]);
    uint64_t result = (uint64_t)ccn_set(v11, &a3[16 * *a2], &a5[16 * *a2]);
  }
  else
  {
    uint64_t result = ccec_add_normalized_ws(a1, a2, a3, a4, (uint64_t)a5, 0);
  }
  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t ccec_full_add_default_ws(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = cczp_n((uint64_t)a2);
  uint64_t v16 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  ccec_map_to_homogeneous_ws(a1, (uint64_t)a2);
  ccec_map_to_homogeneous_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  uint64_t v7 = cczp_n((uint64_t)a2);
  uint64_t v8 = *a2;
  uint64_t v9 = &a3[*a2];
  uint64_t v10 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  ccn_set(v7, v10, v9);
  cczp_from_ws(a1, (uint64_t)a2);
  BOOL v12 = ccn_n(v7, v11) == 1 && *v11 == 1;
  uint64_t v13 = &a3[2 * v8];
  if (ccn_n(v7, a3)) {
    BOOL v12 = 0;
  }
  char v14 = v12 & (ccn_n(v7, v13) == 0);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  ccn_mux(v7, v14, a3, (uint64_t *)v10, a3);
  uint64_t result = ccn_mux(v7, v14, v9, (uint64_t *)v10, v9);
  *(void *)(a1 + 16) = v16;
  return result;
}

uint64_t ccec_map_to_homogeneous_ws(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = cczp_n(a2);
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_mul_ws(a1, a2);
  cczp_sqr_ws(a1, a2);
  uint64_t result = cczp_mul_ws(a1, a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

uint64_t ccec_full_add_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 88))();
}

uint64_t ccec_full_sub_normalized_ws(uint64_t a1, uint64_t *a2, char *a3, uint64_t a4, char *a5)
{
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *a2;
  if (ccec_is_point_at_infinity(a2, a4))
  {
    ccn_set(v11, a3, a5);
    cczp_negate((uint64_t)a2, (uint64_t *)&a3[8 * *a2], (unint64_t *)&a5[8 * *a2]);
    uint64_t result = (uint64_t)ccn_set(v11, &a3[16 * *a2], &a5[16 * *a2]);
  }
  else
  {
    uint64_t result = ccec_add_normalized_ws(a1, a2, a3, a4, (uint64_t)a5, 1);
  }
  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t ccec_full_sub_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, char *a5)
{
  uint64_t v8 = *a2;
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * *a2);
  ccn_set(v8, v10, a5);
  cczp_negate((uint64_t)a2, (uint64_t *)&v10[8 * *a2], (unint64_t *)&a5[8 * *a2]);
  ccn_set(v8, &v10[16 * *a2], &a5[16 * *a2]);
  uint64_t result = ccec_full_add_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v9;
  return result;
}

int8x16_t *aes_ctr_crypt(int8x16_t *a1, int8x16_t *a2, uint64_t a3, int8x16_t *a4, int8x16_t *a5, uint64_t a6)
{
  int v6 = a5[15].i32[0];
  BOOL v8 = __OFSUB__(a3, 128);
  BOOL v7 = a3 - 128 < 0;
  uint64_t v9 = a3 - 128;
  if (v7 != v8) {
    return Decrypt_Main_Loop_End(a1, a2, v9, a4, a5, a6, v6);
  }
  else {
    return (int8x16_t *)Decrypt_Main_Loop(a1, a2, v9, (uint64_t)a4, a5, a6, v6);
  }
}

uint64_t Decrypt_Main_Loop(_OWORD *a1, int8x16_t *a2, uint64_t a3, uint64_t a4, int8x16_t *a5, uint64_t a6, int a7)
{
  do
  {
    int64x2_t v8 = vaddq_s64(v7, vaddq_s64(v7, vaddq_s64(v7, vaddq_s64(v7, v8))));
    _Q20 = *a5;
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[1];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[2];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[3];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[4];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[5];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[6];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[7];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[8];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[9];
    int8x16_t v167 = a5[10];
    if (a7 > 160)
    {
      __asm
      {
        AESE            V22.16B, V20.16B
        AESMC           V22.16B, V22.16B
        AESE            V23.16B, V20.16B
        AESMC           V23.16B, V23.16B
        AESE            V24.16B, V20.16B
        AESMC           V24.16B, V24.16B
        AESE            V25.16B, V20.16B
        AESMC           V25.16B, V25.16B
        AESE            V26.16B, V20.16B
        AESMC           V26.16B, V26.16B
        AESE            V27.16B, V20.16B
        AESMC           V27.16B, V27.16B
        AESE            V28.16B, V20.16B
        AESMC           V28.16B, V28.16B
        AESE            V29.16B, V20.16B
        AESMC           V29.16B, V29.16B
      }
      _Q20 = a5[10];
      __asm
      {
        AESE            V22.16B, V20.16B
        AESMC           V22.16B, V22.16B
        AESE            V23.16B, V20.16B
        AESMC           V23.16B, V23.16B
        AESE            V24.16B, V20.16B
        AESMC           V24.16B, V24.16B
        AESE            V25.16B, V20.16B
        AESMC           V25.16B, V25.16B
        AESE            V26.16B, V20.16B
        AESMC           V26.16B, V26.16B
        AESE            V27.16B, V20.16B
        AESMC           V27.16B, V27.16B
        AESE            V28.16B, V20.16B
        AESMC           V28.16B, V28.16B
        AESE            V29.16B, V20.16B
        AESMC           V29.16B, V29.16B
      }
      _Q20 = a5[11];
      int8x16_t v167 = a5[12];
      if (a7 > 192)
      {
        __asm
        {
          AESE            V22.16B, V20.16B
          AESMC           V22.16B, V22.16B
          AESE            V23.16B, V20.16B
          AESMC           V23.16B, V23.16B
          AESE            V24.16B, V20.16B
          AESMC           V24.16B, V24.16B
          AESE            V25.16B, V20.16B
          AESMC           V25.16B, V25.16B
          AESE            V26.16B, V20.16B
          AESMC           V26.16B, V26.16B
          AESE            V27.16B, V20.16B
          AESMC           V27.16B, V27.16B
          AESE            V28.16B, V20.16B
          AESMC           V28.16B, V28.16B
          AESE            V29.16B, V20.16B
          AESMC           V29.16B, V29.16B
        }
        _Q20 = a5[12];
        __asm
        {
          AESE            V22.16B, V20.16B
          AESMC           V22.16B, V22.16B
          AESE            V23.16B, V20.16B
          AESMC           V23.16B, V23.16B
          AESE            V24.16B, V20.16B
          AESMC           V24.16B, V24.16B
          AESE            V25.16B, V20.16B
          AESMC           V25.16B, V25.16B
          AESE            V26.16B, V20.16B
          AESMC           V26.16B, V26.16B
          AESE            V27.16B, V20.16B
          AESMC           V27.16B, V27.16B
          AESE            V28.16B, V20.16B
          AESMC           V28.16B, V28.16B
          AESE            V29.16B, V20.16B
          AESMC           V29.16B, V29.16B
        }
        _Q20 = a5[13];
        int8x16_t v167 = a5[14];
      }
    }
    int8x16_t v235 = *(int8x16_t *)a1;
    int8x16_t v236 = *((int8x16_t *)a1 + 1);
    int8x16_t v237 = *((int8x16_t *)a1 + 2);
    int8x16_t v238 = *((int8x16_t *)a1 + 3);
    v234 = a1 + 4;
    __asm
    {
      AESE            V22.16B, V20.16B
      AESE            V23.16B, V20.16B
      AESE            V24.16B, V20.16B
      AESE            V25.16B, V20.16B
    }
    int8x16_t v243 = veorq_s8(v235, veorq_s8(_Q22, v167));
    int8x16_t v244 = veorq_s8(v236, veorq_s8(_Q23, v167));
    int8x16_t v245 = veorq_s8(v237, veorq_s8(_Q24, v167));
    int8x16_t v246 = veorq_s8(v238, veorq_s8(_Q25, v167));
    int8x16_t v247 = *(int8x16_t *)v234;
    int8x16_t v248 = *((int8x16_t *)v234 + 1);
    int8x16_t v249 = *((int8x16_t *)v234 + 2);
    int8x16_t v250 = *((int8x16_t *)v234 + 3);
    a1 = v234 + 4;
    __asm
    {
      AESE            V26.16B, V20.16B
      AESE            V27.16B, V20.16B
      AESE            V28.16B, V20.16B
      AESE            V29.16B, V20.16B
    }
    *a2 = v243;
    a2[1] = v244;
    a2[2] = v245;
    a2[3] = v246;
    v255 = a2 + 4;
    int8x16_t *v255 = veorq_s8(v247, veorq_s8(_Q26, v167));
    v255[1] = veorq_s8(v248, veorq_s8(_Q27, v167));
    v255[2] = veorq_s8(v249, veorq_s8(_Q28, v167));
    v255[3] = veorq_s8(v250, veorq_s8(_Q29, v167));
    a2 = v255 + 4;
    _VF = __OFSUB__(a3, 128);
    _NF = a3 - 128 < 0;
    a3 -= 128;
  }
  while (_NF == _VF);
  return Decrypt_Main_Loop_End();
}

int8x16_t *Decrypt_Main_Loop_End(int8x16_t *result, int8x16_t *a2, uint64_t a3, int8x16_t *a4, int8x16_t *a5, uint64_t a6, int a7)
{
  BOOL v10 = a3 < -112;
  for (uint64_t i = a3 + 112; !v10; i -= 16)
  {
    _Q4 = *a5;
    _Q5 = a5[1];
    _Q6 = a5[2];
    int64x2_t v9 = vaddq_s64(v7, v9);
    __asm
    {
      AESE            V7.16B, V4.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V5.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V6.16B
      AESMC           V7.16B, V7.16B
    }
    _Q4 = a5[3];
    _Q5 = a5[4];
    _Q6 = a5[5];
    __asm
    {
      AESE            V7.16B, V4.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V5.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V6.16B
      AESMC           V7.16B, V7.16B
    }
    _Q4 = a5[6];
    _Q5 = a5[7];
    _Q6 = a5[8];
    __asm
    {
      AESE            V7.16B, V4.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V5.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V6.16B
      AESMC           V7.16B, V7.16B
    }
    _Q20 = a5[9];
    _Q21 = a5[10];
    if (a7 > 160)
    {
      __asm
      {
        AESE            V7.16B, V20.16B
        AESMC           V7.16B, V7.16B
        AESE            V7.16B, V21.16B
        AESMC           V7.16B, V7.16B
      }
      _Q20 = a5[11];
      _Q21 = a5[12];
      if (a7 > 192)
      {
        __asm
        {
          AESE            V7.16B, V20.16B
          AESMC           V7.16B, V7.16B
          AESE            V7.16B, V21.16B
          AESMC           V7.16B, V7.16B
        }
        _Q20 = a5[13];
        _Q21 = a5[14];
      }
    }
    __asm { AESE            V7.16B, V20.16B }
    int8x16_t v54 = *result++;
    *a2++ = veorq_s8(v54, veorq_s8(_Q7, _Q21));
    BOOL v10 = i < 16;
  }
  *a4 = vqtbl1q_s8((int8x16_t)v9, v8);
  return result;
}

uint64_t ccec_affine_point_from_x_ws(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *a2;
  uint64_t v8 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  if ((ccn_cmp_internal(*a2, a4, a2 + 3) & 0x80000000) != 0)
  {
    cczp_to_ws(a1, (uint64_t)a2);
    cczp_sqr_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
    cczp_add_ws(a1, (uint64_t)a2);
    cczp_add_ws(a1, (uint64_t)a2);
    cczp_sub_ws(a1, (uint64_t)a2);
    cczp_add_ws(a1, (uint64_t)a2);
    uint64_t result = cczp_sqrt_ws(a1, (uint64_t)a2);
    if (!result)
    {
      cczp_from_ws(a1, (uint64_t)a2);
      cczp_from_ws(a1, (uint64_t)a2);
      uint64_t result = 0;
    }
  }
  else
  {
    uint64_t result = 4294967289;
  }
  *(void *)(a1 + 16) = v8;
  return result;
}

uint64_t ccec_mult_default_ws(uint64_t a1, uint64_t *a2, uint64_t *a3, unsigned char *a4, unint64_t a5, uint64_t *a6)
{
  BOOL v12 = a2 + 4;
  if (cczp_bitlen((uint64_t)&a2[5 * *a2 + 4]) < a5) {
    return 4294967289;
  }
  unint64_t v51 = a3;
  __src = a4;
  int8x16_t v54 = v12;
  uint64_t v14 = *a2;
  unint64_t v15 = (a5 + 63) >> 6;
  uint64_t v53 = *(void *)(a1 + 16);
  uint64_t v16 = 3 * *a2;
  uint64_t v17 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v16);
  uint64_t v18 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v14);
  BOOL v55 = ccn_n(v14, a6) == 0;
  if (a5 + 63 >= 0x40) {
    ccn_set((a5 + 63) >> 6, v18, a4);
  }
  ccn_zero(v14 - v15, (char *)v18 + 8 * v15);
  v18->i64[v15 - 1] &= 0xFFFFFFFFFFFFFFFFLL >> -(char)a5;
  unint64_t v50 = (a5 + 63) >> 6;
  v57 = v18;
  ccn_shift_right(v50, v18, v18, v55);
  ccec_double_ws(a1, a2);
  ccn_mux(3 * v14, !v55, v17, a6, v17);
  if (!ccn_n(v14, v17))
  {
LABEL_13:
    uint64_t result = 0xFFFFFFFFLL;
    goto LABEL_16;
  }
  if (cczp_bitlen((uint64_t)&v54[5 * *a2]) >= a5)
  {
    uint64_t v19 = *a2;
    if (ccn_n(*a2, v17))
    {
      uint64_t v47 = v16;
      uint64_t v45 = *(void *)(a1 + 16);
      uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v19);
      uint64_t v49 = v19;
      unint64_t v21 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v19);
      uint64_t v56 = 2 * v19;
      uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v19);
      uint64_t v23 = *a2;
      uint64_t v42 = *(void *)(a1 + 16);
      __dst = (void *)v22;
      (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, *a2);
      (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v23);
      (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v23);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      v46 = v17;
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      uint64_t v24 = a1;
      uint64_t v25 = a1;
      uint64_t v26 = (uint64_t *)v20;
      cczp_sub_ws(v24, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_sqr_ws(v25, (uint64_t)a2);
      cczp_add_ws(v25, (uint64_t)a2);
      cczp_sub_ws(v25, (uint64_t)a2);
      uint64_t v48 = v25;
      *(void *)(v25 + 16) = v42;
      uint64_t v27 = v18;
      unint64_t v28 = *(unint64_t *)((char *)v18->i64 + (((a5 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (a5
                                                                                                 - 1);
      char v29 = v28 & 1;
      unsigned __int8 v30 = !(v28 & 1);
      unint64_t v31 = a5 - 2;
      if (a5 == 2)
      {
        char v43 = !(v28 & 1);
        LOBYTE(v32) = v28 & 1;
      }
      else
      {
        LOBYTE(v32) = v28 & 1;
        do
        {
          char v33 = v32;
          uint64_t v32 = (*(unint64_t *)((char *)v27->i64 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v31) & 1;
          cczp_cond_negate((uint64_t)a2, v30, &v21[v49], (unint64_t *)&v21[v49]);
          ccn_cond_swap(v56, v32 ^ v33 | v29 ^ 1, v26, v21);
          ccec_mult_XYCZaddC_ws(v25, a2);
          ccec_mult_XYCZadd_ws(v25, a2);
          unsigned __int8 v30 = v32 & (v29 ^ 1);
          uint64_t v27 = v18;
          v29 |= v32;
          --v31;
        }
        while (v31);
        char v43 = v29 ^ 1;
      }
      cczp_cond_negate((uint64_t)a2, v30, &v21[v49], (unint64_t *)&v21[v49]);
      ccn_cond_swap(v56, v27->i8[0] & 1 ^ v32, v26, v21);
      ccec_mult_XYCZaddC_ws(v25, a2);
      ccn_set(v56, __dst, v21);
      uint64_t v41 = v27->i64[0] & 1;
      ccn_cond_swap(v56, v27->i8[0] & 1, v26, v21);
      unsigned int v34 = v26;
      a1 = v25;
      uint64_t v35 = v51;
      uint64_t v40 = *(void *)(v25 + 16);
      cczp_sub_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_sqr_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      *(void *)(v25 + 16) = v40;
      ccn_cond_swap(v56, v41, v34, v21);
      ccec_mult_XYCZadd_ws(v25, a2);
      ccn_mux(v56, v41, v34, v21, v34);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      uint64_t v36 = (unint64_t *)cczp_prime((uint64_t)&v54[5 * *a2]);
      ccn_sub1(v49, __dst, v36, 1uLL);
      unsigned __int8 v37 = (ccn_cmpn_internal(v50, v57, v49, __dst) & 1) == 0;
      BOOL is_point_at_infinity = ccec_is_point_at_infinity(a2, (uint64_t)v46);
      ccn_mux(3 * v49, v43 | is_point_at_infinity | v37, v35, v46, v35);
      cczp_cond_negate((uint64_t)a2, v37, &v35[*a2], (unint64_t *)&v35[*a2]);
      char v39 = v43 & ~v57->i32[0] & 1;
      ccn_cond_clear(v49, v39, &v51[2 * *a2]);
      ccn_seti(v49, v34, 1);
      cczp_to_ws(v48, (uint64_t)a2);
      ccn_mux(v49, v39, v35, v34, v35);
      ccn_mux(v49, v39, &v35[*a2], v34, &v35[*a2]);
      *(void *)(v48 + 16) = v45;
      ccec_full_add_ws(v48, (uint64_t)a2);
      ccn_mux(v47, *__src & v55, v35, v46, v35);
      uint64_t result = 0;
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  uint64_t result = 4294967289;
LABEL_16:
  *(void *)(a1 + 16) = v53;
  return result;
}

uint64_t ccec_mult_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 96))();
}

uint64_t ccec_mult_XYCZaddC_ws(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  uint64_t result = cczp_sub_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

uint64_t ccec_mult_XYCZadd_ws(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  uint64_t result = cczp_sub_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

unint64_t ccn_addmul1_asm(uint64_t a1, unint64_t *a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v4 = 0;
  if (a1)
  {
    unint64_t v5 = *a3++;
    unint64_t v4 = (v5 * (unsigned __int128)a4 + *a2) >> 64;
    *a2++ += v5 * a4;
    --a1;
  }
  if ((a1 & 2) != 0)
  {
    unint64_t v6 = *a3;
    unint64_t v7 = a3[1];
    a3 += 2;
    unsigned long long v8 = *(_OWORD *)a2 + __PAIR128__(v7 * a4, v4);
    unsigned long long v9 = v8 + v6 * (unsigned __int128)a4;
    unint64_t v4 = (__CFADD__(__CFADD__((void)v8, v6 * a4), *((void *)&v8 + 1)) | __CFADD__((v6* (unsigned __int128)a4) >> 64, *((void *)&v9 + 1)))+ (__CFADD__(__CFADD__(*a2, v4), a2[1]) | __CFADD__(v7 * a4, *((void *)&v8 + 1)))+ ((v7 * (unsigned __int128)a4) >> 64);
    *(_OWORD *)a2 = v9;
    a2 += 2;
    a1 -= 2;
  }
  while (1)
  {
    BOOL v10 = a1 < 4;
    a1 -= 4;
    if (v10) {
      break;
    }
    unint64_t v11 = a2[2];
    unint64_t v12 = a2[3];
    unint64_t v14 = *a3;
    unint64_t v15 = a3[1];
    uint64_t v13 = a3 + 2;
    unint64_t v16 = *v13;
    unint64_t v17 = v13[1];
    a3 = v13 + 2;
    uint64_t v18 = (v15 * (unsigned __int128)a4) >> 64;
    unsigned long long v19 = *(_OWORD *)a2 + __PAIR128__(v15 * a4, v4);
    BOOL v20 = __CFADD__(__CFADD__(__CFADD__(*a2, v4), a2[1]) | __CFADD__(v15 * a4, *((void *)&v19 + 1)), v11);
    unint64_t v21 = (__CFADD__(__CFADD__(*a2, v4), a2[1]) | __CFADD__(v15 * a4, *((void *)&v19 + 1))) + v11;
    v20 |= __CFADD__(v18, v21);
    v21 += v18;
    BOOL v23 = v20;
    BOOL v20 = __CFADD__(v20, v12);
    unint64_t v22 = v23 + v12;
    v20 |= __CFADD__(v17 * a4, v22);
    v22 += v17 * a4;
    uint64_t v24 = v20 + ((v17 * (unsigned __int128)a4) >> 64);
    unsigned long long v25 = v19 + v14 * (unsigned __int128)a4;
    *(_OWORD *)a2 = v25;
    uint64_t v26 = a2 + 2;
    uint64_t v27 = (v16 * (unsigned __int128)a4) >> 64;
    uint64_t v29 = __CFADD__(__CFADD__((void)v19, v14 * a4), *((void *)&v19 + 1)) | __CFADD__((v14* (unsigned __int128)a4) >> 64, *((void *)&v25 + 1));
    BOOL v20 = __CFADD__(v29, v21);
    uint64_t v28 = v29 + v21;
    uint64_t v31 = v20 | __CFADD__(v16 * a4, v28);
    BOOL v20 = __CFADD__(v31, v22);
    uint64_t v30 = v31 + v22;
    unint64_t v4 = (v20 | __CFADD__(v27, v30)) + v24;
    void *v26 = v16 * a4 + v28;
    v26[1] = v27 + v30;
    a2 = v26 + 2;
  }
  return v4;
}

uint64_t ccec_pairwise_consistency_check_ws(uint64_t a1, unint64_t **a2, uint64_t (**a3)(void, unint64_t, void *))
{
  unint64_t v6 = **a2;
  char v13 = 0;
  uint64_t v7 = *(void *)(a1 + 16);
  unsigned long long v8 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v6);
  unsigned long long v9 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v6);
  BOOL v10 = (unint64_t *)ccsha256_di();
  uint64_t result = ccec_sign_composite_msg_ws(a1, a2, v10, 0, &v13, v8, v9, a3);
  if (!result)
  {
    v14[0] = 0;
    v14[1] = 0;
    unint64_t v12 = (unint64_t *)ccsha256_di();
    uint64_t result = ccec_verify_composite_msg_ws(a1, (uint64_t *)a2, v12, 0, &v13, (uint64_t)v8, (uint64_t)v9, v14);
    if (!result)
    {
      cc_cmp_safe_internal(16, CCEC_FAULT_CANARY, (char *)v14);
      uint64_t result = 0;
    }
  }
  *(void *)(a1 + 16) = v7;
  return result;
}

uint64_t (**ccec_projectify_jacobian_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (**a5)(void, unint64_t, uint64_t)))(void, unint64_t, uint64_t)
{
  unint64_t v5 = a5;
  uint64_t v9 = *(void *)(a1 + 16);
  if (a5)
  {
    uint64_t v10 = cczp_bitlen((uint64_t)a2);
    unint64_t v5 = (uint64_t (**)(void, unint64_t, uint64_t))ccn_random_bits(v10 - 1, a3 + 16 * *a2, v5);
    ccn_set_bit(a3 + 16 * *a2, v10 - 2, 1);
    cczp_sqr_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
  }
  else
  {
    ccn_seti(*a2, (void *)(a3 + 16 * *a2), 1);
    cczp_to_ws(a1, (uint64_t)a2);
  }
  cczp_to_ws(a1, (uint64_t)a2);
  cczp_to_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v9;
  return v5;
}

uint64_t ccec_projectify_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 72))();
}

uint64_t ccec_twin_mult_ws(uint64_t a1, uint64_t *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7)
{
  uint64_t v12 = *a2;
  uint64_t v24 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  char v13 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t v25 = 3 * v12;
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 12 * v12);
  uint64_t v15 = v14 + 48 * v12;
  uint64_t v26 = v14;
  uint64_t v16 = v14 + 72 * v12;
  ccec_full_add_ws(a1, (uint64_t)a2);
  ccec_full_sub_ws(a1, a2, v16, a5, a7);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  unsigned int v23 = cczp_inv_ws(a1, (uint64_t)a2);
  if (!v23)
  {
    ccec_twin_mult_normalize_ws(a1, a2);
    ccec_twin_mult_normalize_ws(a1, a2);
    ccec_twin_mult_normalize_ws(a1, a2);
    ccec_twin_mult_normalize_ws(a1, a2);
    ccn_seti(v12, v13, 1);
    cczp_to_ws(a1, (uint64_t)a2);
    ccn_set(v12, (void *)(v26 + 24 * v12 + 16 * *a2), (void *)(v26 + 16 * *a2));
    ccn_set(v12, (void *)(v15 + 16 * *a2), (void *)(v26 + 16 * *a2));
    ccn_set(v12, (void *)(v16 + 16 * *a2), (void *)(v26 + 16 * *a2));
    unint64_t v17 = ccn_bitlen_internal(v12, a4);
    unint64_t v18 = ccn_bitlen_internal(v12, a6);
    v27[1] = 0;
    v27[2] = 0;
    if (v17 <= v18) {
      unint64_t v17 = v18;
    }
    v27[0] = 0;
    ccn_recode_jsf_init((uint64_t)v27, v17, a4, a6);
    ccn_set(v12, a3, (void *)(v26 + 16 * *a2));
    ccn_set(v12, &a3[8 * *a2], (void *)(v26 + 16 * *a2));
    cc_clear(8 * v12, &a3[16 * *a2]);
    for (; v17 != -1; --v17)
    {
      ccec_double_ws(a1, a2);
      uint64_t v28 = 0;
      ccn_recode_jsf_column((uint64_t)v27, v17, (uint64_t)&v28);
      if (v28)
      {
        unsigned long long v19 = (char *)(v26 + 8 * ccn_recode_jsf_index(&v28) * v25);
        if (ccn_recode_jsf_direction((unsigned int *)&v28) == 1) {
          ccec_full_add_normalized_ws(a1, a2, a3, (uint64_t)a3, v19);
        }
        else {
          ccec_full_sub_normalized_ws(a1, a2, a3, (uint64_t)a3, v19);
        }
      }
    }
  }
  *(void *)(a1 + 16) = v24;
  return v23;
}

uint64_t ccec_twin_mult_normalize_ws(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  uint64_t result = cczp_mul_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

unint64_t cc_cmp_safe_internal(uint64_t a1, char *a2, char *a3)
{
  if (!a1) {
    return 1;
  }
  unsigned __int8 v3 = 0;
  do
  {
    char v5 = *a2++;
    char v4 = v5;
    char v6 = *a3++;
    v3 |= v6 ^ v4;
    --a1;
  }
  while (a1);
  return ((unint64_t)v3 + 0xFFFFFFFF) >> 32;
}

uint64_t ccec_generate_key_fips_ws(uint64_t a1, uint64_t *a2, uint64_t (**a3)(void, uint64_t, uint64_t *), uint64_t **a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t result = ccec_generate_key_internal_fips_ws(a1, a2, a3, a4);
  if (!result)
  {
    if (ccec_pairwise_consistency_check_ws(a1, (unint64_t **)a4, (uint64_t (**)(void, unint64_t, void *))a3))uint64_t result = 4294967278; {
    else
    }
      uint64_t result = 0;
  }
  *(void *)(a1 + 16) = v7;
  return result;
}

uint64_t ccec_x963_import_priv_ws(uint64_t a1, unint64_t *a2, unint64_t a3, unsigned __int8 *a4, unint64_t **a5)
{
  unsigned int v5 = *a4;
  BOOL v6 = v5 > 7;
  int v7 = (1 << v5) & 0xD0;
  if (v6 || v7 == 0) {
    return 4294967289;
  }
  uint64_t v14 = a2 + 4;
  if (a3 < (unint64_t)(cczp_bitlen((uint64_t)&a2[5 * *a2 + 4]) + 7) >> 3) {
    return 4294967289;
  }
  uint64_t v15 = *(void *)(a1 + 16);
  uint64_t v16 = cczp_bitlen((uint64_t)&v14[5 * *a2]);
  uint64_t result = ccec_x963_import_pub_ws(a1, a2, a3 - ((unint64_t)(v16 + 7) >> 3), a4, a5);
  if (!result)
  {
    unint64_t v18 = *a2;
    uint64_t v19 = (uint64_t)&a5[3 * **a5 + 2];
    unint64_t v20 = (unint64_t)(cczp_bitlen((uint64_t)&v14[5 * *a2]) + 7) >> 3;
    uint64_t v21 = cczp_bitlen((uint64_t)a2);
    uint64_t result = ccn_read_uint_internal(v18, v19, v20, &a4[((unint64_t)(v21 + 7) >> 2) | 1]);
  }
  *(void *)(a1 + 16) = v15;
  return result;
}

uint64_t ccec_x963_import_pub_ws(uint64_t a1, unint64_t *a2, uint64_t a3, unsigned __int8 *a4, unint64_t **a5)
{
  if (!a3) {
    return 4294967289;
  }
  if (a3 == 1)
  {
    int v10 = *a4;
    if (!*a4) {
      return 4294967136;
    }
  }
  else
  {
    int v10 = *a4;
  }
  unsigned int v12 = v10 - 2;
  if (v12 > 5 || ((0x37u >> v12) & 1) == 0) {
    return 4294967289;
  }
  int v13 = dword_1001B9880[(char)v12];
  uint64_t v14 = *(void *)(a1 + 16);
  *a5 = a2;
  uint64_t result = ccec_import_affine_point_ws(a1, a2, v13, a3, a4, a5 + 2);
  if (!result)
  {
    ccn_seti(*a2, &a5[2 * **a5 + 2], 1);
    uint64_t v15 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 3 * *a2);
    uint64_t result = ccec_validate_point_and_projectify_ws(a1, (uint64_t *)a2, v15, (uint64_t)(a5 + 2));
  }
  *(void *)(a1 + 16) = v14;
  return result;
}

uint64_t ccec_x963_import_pub(unint64_t *a1, uint64_t a2, unsigned __int8 *a3, unint64_t **a4)
{
  unsigned long long v8 = cc_malloc_clear(160 * *a1);
  uint64_t v9 = 20 * *a1;
  v12[0] = v8;
  v12[1] = v9;
  v12[2] = 0;
  v12[3] = cc_ws_alloc;
  int v13 = cc_ws_free;
  if (!v8) {
    return 4294967283;
  }
  uint64_t v10 = ccec_x963_import_pub_ws((uint64_t)v12, a1, a2, a3, a4);
  v13((uint64_t)v12);
  return v10;
}

int8x16_t *ccm128_encrypt(int8x16_t *result, int8x16_t *a2, int8x16_t *a3, int a4, int8x16_t *a5, int8x16_t *a6, unsigned int a7)
{
  int8x16_t v7 = *(int8x16_t *)&qword_10017D6C0[2 * a7];
  _Q16 = *a5;
  _Q17 = a5[1];
  _Q18 = a5[2];
  _Q19 = a5[3];
  unsigned long long v8 = a5 + 4;
  _Q20 = *v8;
  _Q21 = v8[1];
  _Q22 = v8[2];
  _Q23 = v8[3];
  v8 += 4;
  _Q24 = *v8;
  _Q25 = v8[1];
  int8x16_t v19 = v8[2];
  int64x2_t v20 = (int64x2_t)vqtbl1q_s8(*a6, *(int8x16_t *)Lbswap_mask_1);
  do
  {
    int64x2_t v20 = (int64x2_t)vorrq_s8(vandq_s8((int8x16_t)vaddq_s64(v20, *(int64x2_t *)qword_10017D6C0), v7), vbicq_s8((int8x16_t)v20, v7));
    int8x16_t v21 = *result++;
    __asm
    {
      AESE            V3.16B, V16.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V16.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V17.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V17.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V18.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V18.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V19.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V19.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V20.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V20.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V21.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V21.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V22.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V22.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V23.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V23.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V24.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V24.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V25.16B
      AESE            V1.16B, V25.16B
    }
    int8x16_t v64 = veorq_s8(_Q1, v19);
    *a2++ = veorq_s8(v21, veorq_s8(_Q3, v19));
    _VF = __OFSUB__(a4--, 1);
  }
  while (!((a4 < 0) ^ _VF | (a4 == 0)));
  *a6 = vqtbl1q_s8((int8x16_t)v20, *(int8x16_t *)Lbswap_mask_1);
  *a3 = v64;
  return result;
}

int8x16_t *ccm192_encrypt(int8x16_t *result, int8x16_t *a2, int8x16_t *a3, int a4, int8x16_t *a5, int8x16_t *a6, unsigned int a7)
{
  int8x16_t v7 = *(int8x16_t *)&qword_10017D6C0[2 * a7];
  _Q16 = *a5;
  _Q17 = a5[1];
  _Q18 = a5[2];
  _Q19 = a5[3];
  unsigned long long v8 = a5 + 4;
  _Q20 = *v8;
  _Q21 = v8[1];
  _Q22 = v8[2];
  _Q23 = v8[3];
  v8 += 4;
  _Q24 = *v8;
  _Q25 = v8[1];
  _Q26 = v8[2];
  _Q27 = v8[3];
  int8x16_t v21 = v8[4];
  int64x2_t v22 = (int64x2_t)vqtbl1q_s8(*a6, *(int8x16_t *)Lbswap_mask_1);
  do
  {
    int64x2_t v22 = (int64x2_t)vorrq_s8(vandq_s8((int8x16_t)vaddq_s64(v22, *(int64x2_t *)qword_10017D6C0), v7), vbicq_s8((int8x16_t)v22, v7));
    int8x16_t v23 = *result++;
    __asm
    {
      AESE            V3.16B, V16.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V16.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V17.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V17.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V18.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V18.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V19.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V19.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V20.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V20.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V21.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V21.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V22.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V22.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V23.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V23.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V24.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V24.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V25.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V25.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V26.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V26.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V27.16B
      AESE            V1.16B, V27.16B
    }
    int8x16_t v74 = veorq_s8(_Q1, v21);
    *a2++ = veorq_s8(v23, veorq_s8(_Q3, v21));
    _VF = __OFSUB__(a4--, 1);
  }
  while (!((a4 < 0) ^ _VF | (a4 == 0)));
  *a6 = vqtbl1q_s8((int8x16_t)v22, *(int8x16_t *)Lbswap_mask_1);
  *a3 = v74;
  return result;
}

int8x16_t *ccm256_encrypt(int8x16_t *result, int8x16_t *a2, int8x16_t *a3, int a4, int8x16_t *a5, int8x16_t *a6, unsigned int a7)
{
  int8x16_t v7 = *(int8x16_t *)&qword_10017D6C0[2 * a7];
  _Q16 = *a5;
  _Q17 = a5[1];
  _Q18 = a5[2];
  _Q19 = a5[3];
  unsigned long long v8 = a5 + 4;
  _Q20 = *v8;
  _Q21 = v8[1];
  _Q22 = v8[2];
  _Q23 = v8[3];
  v8 += 4;
  _Q24 = *v8;
  _Q25 = v8[1];
  _Q26 = v8[2];
  _Q27 = v8[3];
  v8 += 4;
  _Q28 = *v8;
  _Q29 = v8[1];
  int8x16_t v23 = v8[2];
  int64x2_t v24 = (int64x2_t)vqtbl1q_s8(*a6, *(int8x16_t *)Lbswap_mask_1);
  do
  {
    int64x2_t v24 = (int64x2_t)vorrq_s8(vandq_s8((int8x16_t)vaddq_s64(v24, *(int64x2_t *)qword_10017D6C0), v7), vbicq_s8((int8x16_t)v24, v7));
    int8x16_t v25 = *result++;
    __asm
    {
      AESE            V3.16B, V16.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V16.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V17.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V17.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V18.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V18.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V19.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V19.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V20.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V20.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V21.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V21.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V22.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V22.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V23.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V23.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V24.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V24.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V25.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V25.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V26.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V26.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V27.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V27.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V28.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V28.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V29.16B
      AESE            V1.16B, V29.16B
    }
    int8x16_t v84 = veorq_s8(_Q1, v23);
    *a2++ = veorq_s8(v25, veorq_s8(_Q3, v23));
    _VF = __OFSUB__(a4--, 1);
  }
  while (!((a4 < 0) ^ _VF | (a4 == 0)));
  *a6 = vqtbl1q_s8((int8x16_t)v24, *(int8x16_t *)Lbswap_mask_1);
  *a3 = v84;
  return result;
}

uint64_t ccrng_crypto_generate(uint64_t a1, rsize_t a2, char *a3)
{
  if (!a2) {
    return 0;
  }
  rsize_t v6 = a2;
  int8x16_t v7 = a3;
  while (1)
  {
    unsigned long long v8 = *(os_unfair_lock_s **)(a1 + 24);
    if (v8)
    {
      os_unfair_lock_lock(v8);
      uint64_t v9 = *(const os_unfair_lock **)(a1 + 24);
      if (v9) {
        os_unfair_lock_assert_owner(v9);
      }
    }
    memset(v29, 0, sizeof(v29));
    rsize_t v10 = *(void *)(a1 + 56);
    int v11 = ccrng_schedule_read(*(void *)(a1 + 16));
    if (v11 == 1) {
      goto LABEL_13;
    }
    int v12 = v11;
    uint64_t seed = ccentropy_get_seed(*(uint64_t (****)(void, uint64_t, uint64_t))(a1 + 8), v10, (uint64_t)v29);
    if (seed == -10) {
      break;
    }
    uint64_t v14 = seed;
    if (seed) {
      goto LABEL_40;
    }
    uint64_t v15 = drbg_reseed((void *)a1, v10, (uint64_t)v29, 0, 0);
    if (v15)
    {
      uint64_t v14 = v15;
LABEL_40:
      cc_clear(v10, v29);
      goto LABEL_36;
    }
    ccrng_schedule_notify_reseed(*(unsigned char **)(a1 + 16));
    cc_clear(v10, v29);
LABEL_13:
    if (v6 >= *(void *)(a1 + 48)) {
      unint64_t v16 = *(void *)(a1 + 48);
    }
    else {
      unint64_t v16 = v6;
    }
    unint64_t v17 = *(const os_unfair_lock **)(a1 + 24);
    if (v17) {
      os_unfair_lock_assert_owner(v17);
    }
    if (a2 <= 0xB && (unint64_t v18 = *(void *)(a1 + 64), v18 >= v16))
    {
      uint64_t v21 = *(void *)(a1 + 72);
      uint64_t v22 = *(void *)(a1 + 80);
      int8x16_t v23 = (void *)(v21 + v22);
      uint64_t v24 = v21 + v18;
      unint64_t v25 = v24 - (v21 + v22);
      if (v25 >= v16) {
        size_t v26 = v16;
      }
      else {
        size_t v26 = v24 - (v21 + v22);
      }
      memcpy(v7, (const void *)(v21 + v22), v26);
      cc_clear(v26, v23);
      *(void *)(a1 + 80) += v26;
      if (v25 < v16)
      {
        uint64_t v19 = drbg_generate((void *)a1, *(void *)(a1 + 64), *(void *)(a1 + 72));
        if (v19)
        {
LABEL_41:
          uint64_t v14 = v19;
          goto LABEL_36;
        }
        memcpy(&v7[v26], *(const void **)(a1 + 72), v16 - v26);
        cc_clear(v16 - v26, *(void **)(a1 + 72));
        *(void *)(a1 + 80) = v16 - v26;
      }
    }
    else
    {
      uint64_t v19 = drbg_generate((void *)a1, v16, (uint64_t)v7);
      if (v19) {
        goto LABEL_41;
      }
    }
    int64x2_t v20 = *(os_unfair_lock_s **)(a1 + 24);
    if (v20) {
      os_unfair_lock_unlock(v20);
    }
    v7 += v16;
    v6 -= v16;
    if (!v6) {
      return 0;
    }
  }
  if (v12 == 2) {
    goto LABEL_13;
  }
  if (v12 == 3) {
    uint64_t v14 = 4294967134;
  }
  else {
    uint64_t v14 = 0xFFFFFFFFLL;
  }
LABEL_36:
  uint64_t v28 = *(os_unfair_lock_s **)(a1 + 24);
  if (v28) {
    os_unfair_lock_unlock(v28);
  }
  cc_clear(a2, a3);
  return v14;
}

uint64_t drbg_reseed(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  rsize_t v10 = (const os_unfair_lock *)a1[3];
  if (v10) {
    os_unfair_lock_assert_owner(v10);
  }
  uint64_t result = ccdrbg_reseed(a1[4], a1[5], a2, a3, a4, a5);
  if (!result) {
    a1[10] = a1[8];
  }
  return result;
}

uint64_t ccrng_crypto_init(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10)
{
  if (a8 > 0x40) {
    return 4294967291;
  }
  uint64_t result = 0;
  *a1 = generate_1;
  a1[1] = a2;
  a1[2] = a3;
  a1[3] = a4;
  a1[4] = a5;
  a1[5] = a6;
  a1[6] = a7;
  a1[7] = a8;
  a1[8] = a9;
  a1[9] = a10;
  a1[10] = a9;
  return result;
}

uint64_t drbg_generate(void *a1, uint64_t a2, uint64_t a3)
{
  rsize_t v6 = (const os_unfair_lock *)a1[3];
  if (v6) {
    os_unfair_lock_assert_owner(v6);
  }
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];

  return ccdrbg_generate(v7, v8, a2, a3, 0, 0);
}

uint64_t cczp_inv_default_ws(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6 = a2;
  unint64_t v8 = cczp_n(a2);
  uint64_t v9 = cczp_prime(v6);
  if ((ccn_cmp_internal(v8, a4, v9) & 0x80000000) == 0) {
    return 4294967289;
  }
  uint64_t v46 = *(void *)(a1 + 16);
  long long __s = a3;
  int v11 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  int v12 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  cczp_from_ws(a1, v6);
  int v13 = (void *)cczp_prime(v6);
  ccn_set(v8, v12, v13);
  uint64_t v14 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  uint64_t v15 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  uint64_t v53 = v14;
  ccn_seti(v8, v14, 1);
  uint64_t __n = 8 * v8;
  int8x16_t v54 = v15;
  cc_clear(8 * v8, v15);
  v52 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  unint64_t v16 = (v8 << 7) | 0x1E;
  if (v16 != 30)
  {
    uint64_t v17 = 0;
    unint64_t v49 = v8 - 1;
    unint64_t v50 = v16 / 0x1F;
    unint64_t v48 = v8 - 2;
    unint64_t v51 = (void *)v6;
    uint64_t v56 = v8;
    do
    {
      uint64_t v18 = v11[v49];
      uint64_t v19 = v12[v49];
      uint64_t v55 = v17;
      if (v8 >= 2)
      {
        unint64_t v20 = v48;
        do
        {
          char v21 = __clz(v19 | v18 | 1);
          char v22 = (((v19 | v18) >> 63) - v21 + 64) & -(uint64_t)(((v19 | v18 | ((v19 | (unint64_t)v18) >> 32))
                                                             + 0xFFFFFFFF) >> 32);
          uint64_t v18 = (v11[v20] >> v22) | (v18 << v21);
          uint64_t v19 = (v12[v20--] >> v22) | (v19 << v21);
        }
        while (v20 < v8);
      }
      unint64_t v23 = 0;
      uint64_t v24 = 0;
      unint64_t v25 = v18 & 0xFFFFFFFF80000000 | *v11 & 0x7FFFFFFFLL;
      unint64_t v26 = v19 & 0xFFFFFFFF80000000 | *v12 & 0x7FFFFFFFLL;
      uint64_t v27 = 31;
      uint64_t v28 = 0x80000000;
      unint64_t v29 = 0x80000000;
      do
      {
        unint64_t v30 = v25 & 1;
        unint64_t v31 = v25 >> !(v25 & 1);
        unint64_t v32 = v31 ^ v26;
        unint64_t v33 = v25 & ((((v31 - v26) ^ v31 | v31 ^ v26) ^ v31) >> 63);
        uint64_t v34 = -(uint64_t)v33;
        unint64_t v35 = v26 & -(uint64_t)v33--;
        unint64_t v36 = v33 & v31 | v35;
        unint64_t v26 = v32 ^ v36;
        unint64_t v37 = v33 & v29 | v24 & v34;
        v24 ^= v29 ^ v37;
        unint64_t v38 = v33 & v23 | v28 & v34;
        v28 ^= v23 ^ v38;
        unint64_t v25 = (v36 - (v26 & -(uint64_t)v30)) >> v30;
        unint64_t v29 = (v37 - (v24 & -(uint64_t)v30)) & 0x8000000000000000 | ((v37 - (v24 & -(uint64_t)v30)) >> 1);
        unint64_t v23 = (v38 - (v28 & -(uint64_t)v30)) & 0x8000000000000000 | ((v38 - (v28 & -(uint64_t)v30)) >> 1);
        --v27;
      }
      while (v27);
      uint64_t v39 = a1;
      unint64_t updated = cczp_inv_update_ws(a1, v8, v52, v11, (v37 - (v24 & -(uint64_t)v30)) & 0x8000000000000000 | ((v37 - (v24 & -(uint64_t)v30)) >> 1), v12, (v38 - (v28 & -(uint64_t)v30)) & 0x8000000000000000 | ((v38 - (v28 & -(uint64_t)v30)) >> 1));
      unint64_t v41 = cczp_inv_update_ws(v39, v56, v12, v11, v24, v12, v28);
      ccn_set(v56, v11, v52);
      unint64_t v42 = updated - 1;
      uint64_t v43 = -(uint64_t)updated;
      a1 = v39;
      uint64_t v44 = v42 & v23 | v43 & -(uint64_t)v23;
      uint64_t v6 = (uint64_t)v51;
      unint64_t v8 = v56;
      cczp_inv_update_redc_ws(v39, v51, v52, v53, v42 & v29 | v43 & -(uint64_t)v29, v54, v44);
      cczp_inv_update_redc_ws(v39, v51, v54, v53, (v41 - 1) & v24 | -(uint64_t)v41 & -v24, v54, (v41 - 1) & v28 | -(uint64_t)v41 & -v28);
      ccn_set(v56, v53, v52);
      uint64_t v17 = v55 + 1;
    }
    while (v55 + 1 != v50);
  }
  if (ccn_n(v8, v12) == 1 && *v12 == 1)
  {
    cczp_to_ws(a1, v6);
    uint64_t result = 0;
  }
  else
  {
    cc_clear(__n, __s);
    uint64_t result = 4294967289;
  }
  *(void *)(a1 + 16) = v46;
  return result;
}

unint64_t cczp_inv_update_ws(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, uint64_t a7)
{
  uint64_t v19 = *(void *)(a1 + 16);
  uint64_t v13 = a2 + 1;
  uint64_t v14 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, a2 + 1);
  uint64_t v15 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v13);
  if (a2) {
    ccn_set(a2, v14, a4);
  }
  ccn_zero(1, (char *)v14 + 8 * a2);
  ccn_cond_neg(v13, a5 < 0, v14->i64, v14->i64);
  if (a2) {
    ccn_set(a2, v15, a6);
  }
  ccn_zero(1, &v15[8 * a2]);
  ccn_cond_neg(v13, a7 < 0, (uint64_t *)v15, (uint64_t *)v15);
  ccn_mul1(v13, v14, v14, (a5 ^ (a5 >> 63)) + ((unint64_t)a5 >> 63));
  ccn_addmul1(v13, v14, v15, (a7 ^ (a7 >> 63)) + ((unint64_t)a7 >> 63));
  unint64_t v16 = (unint64_t)v14->i64[a2] >> 63;
  ccn_cond_neg(v13, v14->i64[a2] < 0, v14->i64, v14->i64);
  ccn_shift_right(v13, v14, v14, 31);
  ccn_set(a2, a3, v14);
  *(void *)(a1 + 16) = v19;
  return v16;
}

uint64_t cczp_inv_update_redc_ws(uint64_t a1, void *a2, void *a3, unint64_t *a4, uint64_t a5, unint64_t *a6, uint64_t a7)
{
  uint64_t v12 = cczp_n((uint64_t)a2);
  uint64_t v21 = *(void *)(a1 + 16);
  uint64_t v13 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  uint64_t v14 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  cczp_cond_negate((uint64_t)a2, a5 < 0, v13->i64, a4);
  cczp_cond_negate((uint64_t)a2, a7 < 0, v14, a6);
  v13->i64[v12] = ccn_mul1(v12, v13, v13, (a5 ^ (a5 >> 63)) + ((unint64_t)a5 >> 63));
  v13->i64[v12] += ccn_addmul1(v12, v13, v14, (a7 ^ (a7 >> 63)) + ((unint64_t)a7 >> 63));
  uint64_t v15 = cczp_prime((uint64_t)a2);
  v13->i64[v12] += ccn_addmul1(v12, v13, v15, (LODWORD(a2[*a2 + 3]) * v13->i32[0]) & 0x7FFFFFFF);
  ccn_shift_right(v12 + 1, v13, v13, 31);
  ccn_set(v12, a3, v13);
  unint64_t v16 = (unint64_t *)cczp_prime((uint64_t)a2);
  char v17 = ccn_subn(v12 + 1, v13, v13->i64, v12, v16);
  uint64_t result = ccn_mux(v12, v17, (uint64_t *)a3, (uint64_t *)a3, v13->i64);
  *(void *)(a1 + 16) = v21;
  return result;
}

uint64_t cczp_inv_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 40))();
}

uint64_t cczp_n(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t cczp_bitlen(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t ccn_mul(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    result *= -8;
    char v4 = (unint64_t *)(a2 - result);
    uint64_t v5 = a3 - result;
    uint64_t v6 = a4 - result;
    uint64_t v7 = result;
    uint64_t v8 = result;
    unint64_t v9 = 0;
    unint64_t v10 = *(void *)(v6 + result);
    do
    {
      unsigned long long v11 = *(unint64_t *)(v5 + v8) * (unsigned __int128)v10 + v9;
      *(unint64_t *)((char *)v4 + v8) = v11;
      unint64_t v9 = *((void *)&v11 + 1);
      v8 += 8;
    }
    while (v8);
    while (1)
    {
      *char v4 = v9;
      v7 += 8;
      if (!v7) {
        break;
      }
      ++v4;
      uint64_t v12 = result;
      unint64_t v9 = 0;
      unint64_t v13 = *(void *)(v6 + v7);
      do
      {
        unsigned long long v14 = *(unint64_t *)(v5 + v12) * (unsigned __int128)v13 + v9 + *(unint64_t *)((char *)v4 + v12);
        *(unint64_t *)((char *)v4 + v12) = v14;
        unint64_t v9 = *((void *)&v14 + 1);
        v12 += 8;
      }
      while (v12);
    }
  }
  return result;
}

uint64_t ccmode_ctr_init(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)(a1 + 48);
  *a2 = v8;
  uint64_t v9 = (*(uint64_t (**)(void))(v8 + 16))();
  (*(void (**)(uint64_t, void *, uint64_t))(a1 + 32))(a1, a2, a5);
  return v9;
}

uint64_t ccn_cmpn_public_value(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a1 >= a3) {
    unint64_t v4 = a3;
  }
  else {
    unint64_t v4 = a1;
  }
  if (a1 >= a3) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = a4;
  }
  if (a1 <= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = a1;
  }
  if (a1 < a3) {
    unsigned int v7 = -1;
  }
  else {
    unsigned int v7 = 1;
  }
  unsigned int v8 = ccn_cmp_public_value(v4, a2, a4);
  if (ccn_n(v6 - v4, v5 + 8 * v4)) {
    return v7;
  }
  else {
    return v8;
  }
}

uint64_t cczp_sqrt_tonelli_shanks_precomp_ws(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4, unint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v12 = cczp_n(a2);
  uint64_t v23 = *(void *)(a1 + 16);
  unint64_t v13 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  unsigned long long v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t v15 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  unint64_t v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t result = cczp_power_fast_ws(a1, a2, a3, a4, a6);
  uint64_t v18 = v23;
  if (!result)
  {
    ccn_seti(v12, v16, 1);
    unint64_t v25 = v16;
    cczp_to_ws(a1, a2);
    ccn_set(v12, v15, a7);
    cczp_sqr_ws(a1, a2);
    cczp_mul_ws(a1, a2);
    cczp_mul_ws(a1, a2);
    if (a5 >= 2)
    {
      while (1)
      {
        ccn_set(v12, v14, v13);
        if (a5 - 1 < 2) {
          break;
        }
        uint64_t v19 = 2;
        do
        {
          cczp_sqr_ws(a1, a2);
          ++v19;
        }
        while (a5 != v19);
        char v20 = ccn_cmp_internal(v12, v14, v25) & 1;
        cczp_mul_ws(a1, a2);
        ccn_mux(v12, v20, a3, (uint64_t *)v14, a3);
        cczp_sqr_ws(a1, a2);
        cczp_mul_ws(a1, a2);
        ccn_mux(v12, v20, (uint64_t *)v13, (uint64_t *)v14, (uint64_t *)v13);
        --a5;
      }
      char v21 = ccn_cmp_internal(v12, v14, v25) & 1;
      cczp_mul_ws(a1, a2);
      ccn_mux(v12, v21, a3, (uint64_t *)v14, a3);
      cczp_sqr_ws(a1, a2);
      cczp_mul_ws(a1, a2);
      ccn_mux(v12, v21, (uint64_t *)v13, (uint64_t *)v14, (uint64_t *)v13);
    }
    cczp_sqr_ws(a1, a2);
    if (ccn_cmp_internal(v12, v14, a4)) {
      uint64_t result = 4294967289;
    }
    else {
      uint64_t result = 0;
    }
    uint64_t v18 = v23;
  }
  *(void *)(a1 + 16) = v18;
  return result;
}

uint64_t cczp_sqrt_default_ws(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t v8 = ~*(_DWORD *)cczp_prime(a2) & 3;
  uint64_t v9 = cczp_n(a2);
  uint64_t v10 = *(void *)(a1 + 16);
  unsigned long long v11 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
  uint64_t v12 = (void *)cczp_prime(a2);
  if (v8)
  {
    ccn_set(v9, v11, v12);
    v11->i64[0] &= ~1uLL;
    unint64_t v14 = ccn_trailing_zeros(v9, (uint64_t)v11);
    ccn_shift_right_multi(v9, v11, v11, v14);
    uint64_t v15 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
    ccn_sub1(v9, v15, (unint64_t *)v11, 1uLL);
    ccn_shift_right(v9, v15, v15, 1);
    unint64_t v16 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
    ccn_seti(v9, v16, 1);
    while (cczp_is_quadratic_residue_ws(a1, a2, v16) == 1)
      ccn_add1_ws(a1, v9, v16, v16, 1);
    uint64_t result = cczp_power_fast_ws(a1, a2, v16, v16, (uint64_t)v11);
    if (!result) {
      uint64_t result = cczp_sqrt_tonelli_shanks_precomp_ws(a1, a2, a3, a4, v14, (uint64_t)v15, v16);
    }
  }
  else
  {
    ccn_add1_ws(a1, v9, v11, (uint64_t *)v12, 1);
    ccn_shift_right(v9, v11, v11, 2);
    uint64_t result = cczp_power_fast_ws(a1, a2, a3, a4, (uint64_t)v11);
    if (!result)
    {
      cczp_sqr_ws(a1, a2);
      if (ccn_cmp_internal(v9, v11, a4)) {
        uint64_t result = 4294967289;
      }
      else {
        uint64_t result = 0;
      }
    }
  }
  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t cczp_sqrt_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 48))();
}

BOOL ccec_is_point_projective_ws(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  BOOL result = ccn_cmp_internal(v4, v7, v6) == 0;
  *(void *)(a1 + 16) = v5;
  return result;
}

BOOL ccec_is_point_at_infinity(void *a1, uint64_t a2)
{
  return ccn_n(*a1, a2 + 16 * *a1) == 0;
}

uint64_t ccentropy_get_seed(uint64_t (***a1)(void, uint64_t, uint64_t), uint64_t a2, uint64_t a3)
{
  BOOL v8 = timingsafe_enable_if_supported();
  uint64_t v6 = (**a1)(a1, a2, a3);
  cc_disable_dit_with_sb((unsigned int *)&v8);
  return v6;
}

uint64_t ccec_make_pub_from_priv_ws(uint64_t a1, uint64_t *a2, uint64_t (**a3)(void, uint64_t, uint64_t *), uint64_t a4, uint64_t a5, uint64_t **a6)
{
  *a6 = a2;
  uint64_t v12 = *a2;
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * *a2);
  if (ccec_validate_scalar(a2, a4))
  {
    uint64_t result = 4294967274;
    goto LABEL_10;
  }
  if (a5)
  {
    uint64_t result = ccec_validate_point_and_projectify_ws(a1, a2, v14, a5);
    if (result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t result = ccec_projectify_ws(a1, (uint64_t)a2);
    if (result) {
      goto LABEL_10;
    }
  }
  if (ccec_mult_blinded_ws(a1, (unint64_t *)a2, (uint64_t)(a6 + 2), a4, v14, a3))
  {
    uint64_t result = 4294967280;
  }
  else if (ccec_is_point_projective_ws(a1, a2))
  {
    if (ccec_affinify_ws(a1, (uint64_t)a2))
    {
      uint64_t result = 4294967279;
    }
    else
    {
      ccn_seti(v12, &a6[2 * **a6 + 2], 1);
      uint64_t result = 0;
    }
  }
  else
  {
    uint64_t result = 4294967277;
  }
LABEL_10:
  *(void *)(a1 + 16) = v13;
  return result;
}

uint64_t ccn_recode_jsf_init(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = 0;
  unint64_t v5 = (unint64_t)(a2 - 1) >> 6;
  *(void *)(result + 8) = a3;
  *(void *)(result + 16) = a4;
  char v6 = (a2 - 1) & 0x3F;
  unint64_t v7 = (unint64_t)(a2 - 2) >> 6;
  char v8 = (a2 - 2) & 0x3F;
  v16[0] = a3;
  v16[1] = a4;
  unint64_t v9 = (unint64_t)(a2 - 3) >> 6;
  char v10 = (a2 - 3) & 0x3F;
  unint64_t v11 = (unint64_t)(a2 - 4) >> 6;
  char v12 = (a2 - 4) & 0x3F;
  char v13 = 1;
  do
  {
    char v14 = v13;
    uint64_t v15 = v16[v4];
    *(unsigned char *)(result + v4) = (8 * ((*(void *)(v15 + 8 * v5) >> v6) & 1)) | (4
                                                                             * ((*(void *)(v15 + 8 * v7) >> v8) & 1)) | (2 * ((*(void *)(v15 + 8 * v9) >> v10) & 1)) | (*(void *)(v15 + 8 * v11) >> v12) & 1;
    uint64_t v4 = 1;
    char v13 = 0;
  }
  while ((v14 & 1) != 0);
  return result;
}

uint64_t ccn_recode_jsf_column(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  __int16 v10 = 0;
  if ((*(unsigned char *)result & 0x20) != 0) {
    char v4 = *(unsigned char *)result & 0x1F ^ 0x1F;
  }
  else {
    char v4 = *(unsigned char *)result & 0x1F;
  }
  LOBYTE(v10) = v4;
  if ((*(unsigned char *)(result + 1) & 0x20) != 0) {
    char v5 = *(unsigned char *)(result + 1) & 0x1F ^ 0x1F;
  }
  else {
    char v5 = *(unsigned char *)(result + 1) & 0x1F;
  }
  HIBYTE(v10) = v5;
  long long v11 = *(_OWORD *)(result + 8);
  char v6 = 1;
  do
  {
    char v7 = v6;
    if (a2 < 5) {
      LOBYTE(v8) = 0;
    }
    else {
      uint64_t v8 = (*(void *)(*((void *)&v11 + v3) + 8 * ((a2 - 5) >> 6)) >> ((a2 - 5) & 0x3F)) & 1;
    }
    if (*((unsigned __int8 *)&v10 + v3) >= F_2_2_11[*((unsigned __int8 *)&v10 + (v3 ^ 1))])
    {
      LOBYTE(v8) = v8 | 0x20;
      if ((*(unsigned char *)(result + v3) & 0x20) != 0) {
        int v9 = -1;
      }
      else {
        int v9 = 1;
      }
    }
    else
    {
      int v9 = 0;
    }
    char v6 = 0;
    *(_DWORD *)(a3 + 4 * v3) = v9;
    *(unsigned char *)(result + v3) = v8 ^ (2 * *(unsigned char *)(result + v3));
    uint64_t v3 = 1;
  }
  while ((v7 & 1) != 0);
  return result;
}

unint64_t ccn_recode_jsf_index(_DWORD *a1)
{
  return (*a1 & 1 | (2 * (a1[1] & 1u))) - (unint64_t)(*a1 + a1[1] != 0);
}

uint64_t ccn_recode_jsf_direction(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result != -1)
  {
    if (!result && a1[1] == -1) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 1;
    }
  }
  return result;
}

uint64_t ccec_compressed_x962_import_pub(unint64_t *a1, uint64_t a2, unsigned __int8 *a3, unint64_t **a4)
{
  LODWORD(result) = ccec_x963_import_pub(a1, a2, a3, a4);
  if (result == -7) {
    return 4294967135;
  }
  else {
    return result;
  }
}

BOOL ccn_add_ws(uint64_t a1, BOOL a2, void *a3, uint64_t *a4, uint64_t *a5)
{
  return ccn_add_asm(a2, a3, a4, a5);
}

uint64_t cc_log_default()
{
  if (cc_log_default_initp != -1) {
    _os_once();
  }
  return cc_log_default_log;
}

os_log_t cc_log_init(os_log_t *a1)
{
  os_log_t result = os_log_create("com.apple.corecrypto", "default");
  *a1 = result;
  return result;
}

BOOL ccn_add_asm(BOOL result, void *a2, uint64_t *a3, uint64_t *a4)
{
  BOOL v4 = 0;
  if (result)
  {
    if (result)
    {
      uint64_t v6 = *a3++;
      uint64_t v5 = v6;
      uint64_t v7 = *a4++;
      BOOL v4 = __CFADD__(v5, v7);
      *a2++ = v5 + v7;
    }
    if (result & 2)
    {
      uint64_t v8 = *a3;
      uint64_t v9 = a3[1];
      a3 += 2;
      uint64_t v10 = *a4;
      uint64_t v11 = a4[1];
      a4 += 2;
      uint64_t v13 = v4 + v8;
      BOOL v4 = __CFADD__(v4, v8) | __CFADD__(v10, v13);
      uint64_t v12 = v10 + v13;
      uint64_t v14 = v4 + v9;
      BOOL v4 = __CFADD__(v4, v9) | __CFADD__(v11, v14);
      *a2 = v12;
      a2[1] = v11 + v14;
      a2 += 2;
    }
    BOOL v15 = result & 0xFFFFFFFC;
    if (v15)
    {
      int v16 = v15 - 4;
      uint64_t v18 = *a3;
      uint64_t v19 = a3[1];
      char v17 = a3 + 2;
      uint64_t v21 = *a4;
      uint64_t v22 = a4[1];
      char v20 = a4 + 2;
      uint64_t v24 = *v17;
      uint64_t v25 = v17[1];
      uint64_t v23 = v17 + 2;
      uint64_t v27 = *v20;
      uint64_t v28 = v20[1];
      for (uint64_t i = v20 + 2; v16; uint64_t i = v38 + 2)
      {
        uint64_t v30 = v4 + v18;
        BOOL v4 = __CFADD__(v4, v18) | __CFADD__(v21, v30);
        uint64_t v29 = v21 + v30;
        uint64_t v32 = v4 + v19;
        BOOL v4 = __CFADD__(v4, v19) | __CFADD__(v22, v32);
        uint64_t v31 = v22 + v32;
        uint64_t v18 = *v23;
        uint64_t v19 = v23[1];
        unint64_t v33 = v23 + 2;
        uint64_t v35 = v4 + v24;
        BOOL v4 = __CFADD__(v4, v24) | __CFADD__(v27, v35);
        uint64_t v34 = v27 + v35;
        *a2 = v29;
        a2[1] = v31;
        unint64_t v36 = a2 + 2;
        uint64_t v37 = v4 + v25;
        BOOL v4 = __CFADD__(v4, v25) | __CFADD__(v28, v37);
        uint64_t v21 = *i;
        uint64_t v22 = i[1];
        unint64_t v38 = i + 2;
        *unint64_t v36 = v34;
        v36[1] = v28 + v37;
        a2 = v36 + 2;
        v16 -= 4;
        uint64_t v24 = *v33;
        uint64_t v25 = v33[1];
        uint64_t v23 = v33 + 2;
        uint64_t v27 = *v38;
        uint64_t v28 = v38[1];
      }
      uint64_t v40 = v4 + v18;
      BOOL v4 = __CFADD__(v4, v18) | __CFADD__(v21, v40);
      uint64_t v39 = v21 + v40;
      uint64_t v42 = v4 + v19;
      BOOL v4 = __CFADD__(v4, v19) | __CFADD__(v22, v42);
      uint64_t v41 = v22 + v42;
      uint64_t v44 = v4 + v24;
      BOOL v4 = __CFADD__(v4, v24) | __CFADD__(v27, v44);
      uint64_t v43 = v27 + v44;
      uint64_t v45 = v4 + v25;
      BOOL v4 = __CFADD__(v4, v25) | __CFADD__(v28, v45);
      *a2 = v39;
      a2[1] = v41;
      uint64_t v46 = a2 + 2;
      void *v46 = v43;
      v46[1] = v28 + v45;
    }
    return v4;
  }
  return result;
}

BOOL ccn_add1_ws(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5)
{
  if (a2) {
    return ccn_add1_asm(a2, a3, a4, a5);
  }
  else {
    return a5;
  }
}

uint64_t ccsigma_init(uint64_t a1, uint64_t a2, int a3, uint64_t (**a4)(void, uint64_t, uint64_t *))
{
  BOOL v14 = timingsafe_enable_if_supported();
  *(void *)a2 = a1;
  *(_DWORD *)(a2 + 8) = a3;
  uint64_t v8 = (uint64_t **)(*(uint64_t (**)(uint64_t))(a1 + 8))(a2);
  v12[0] = cc_malloc_clear(392 * **(void **)a1);
  uint64_t v9 = *(uint64_t **)a1;
  v12[1] = 49 * **(void **)a1;
  v12[2] = 0;
  v12[3] = cc_ws_alloc;
  uint64_t v13 = cc_ws_free;
  if (v12[0])
  {
    uint64_t key_fips_ws = ccec_generate_key_fips_ws((uint64_t)v12, v9, a4, v8);
    v13((uint64_t)v12);
  }
  else
  {
    uint64_t key_fips_ws = 4294967283;
  }
  cc_disable_dit_with_sb((unsigned int *)&v14);
  return key_fips_ws;
}

uint64_t ccsigma_import_signing_key(void *a1, unint64_t a2, unsigned __int8 *a3)
{
  BOOL v12 = timingsafe_enable_if_supported();
  uint64_t v6 = (unint64_t **)(*(uint64_t (**)(void *))(*a1 + 48))(a1);
  uint64_t v7 = 20 * **(void **)(*a1 + 24);
  v10[0] = cc_malloc_clear(160 * **(void **)(*a1 + 24));
  v10[1] = v7;
  void v10[2] = 0;
  v10[3] = cc_ws_alloc;
  uint64_t v11 = cc_ws_free;
  if (v10[0])
  {
    uint64_t v8 = ccec_x963_import_priv_ws((uint64_t)v10, *(unint64_t **)(*a1 + 24), a2, a3, v6);
    v11((uint64_t)v10);
    if (!v8)
    {
      a1[2] = ccsigma_sign_internal;
      a1[3] = a1;
    }
  }
  else
  {
    uint64_t v8 = 4294967283;
  }
  cc_disable_dit_with_sb((unsigned int *)&v12);
  return v8;
}

uint64_t ccsigma_set_signing_function(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  return 0;
}

uint64_t ccsigma_sign_internal(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t *a4, char *a5, uint64_t (**a6)(void, unint64_t, void *))
{
  BOOL v12 = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1);
  uint64_t v13 = (void *)*v12;
  v18[0] = cc_malloc_clear(280 * *(void *)*v12);
  v18[1] = 35 * *v13;
  v18[2] = 0;
  v18[3] = cc_ws_alloc;
  uint64_t v19 = cc_ws_free;
  if (!v18[0]) {
    return 4294967283;
  }
  unint64_t v14 = *(void *)(*(void *)a1 + 40);
  if (*a4 < v14)
  {
    uint64_t v16 = 4294967289;
    cc_ws_free((uint64_t)v18);
  }
  else
  {
    *a4 = v14;
    unint64_t v15 = ccec_signature_r_s_size(v12);
    uint64_t v16 = ccec_sign_composite_ws((uint64_t)v18, (unint64_t **)v12, a2, a3, a5, &a5[v15], a6);
    v19((uint64_t)v18);
  }
  return v16;
}

uint64_t ccsigma_import_peer_verification_key(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  BOOL v9 = timingsafe_enable_if_supported();
  uint64_t v6 = (unint64_t **)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
  uint64_t v7 = ccec_x963_import_pub(*(unint64_t **)(*(void *)a1 + 24), a2, a3, v6);
  cc_disable_dit_with_sb((unsigned int *)&v9);
  return v7;
}

uint64_t ccsigma_export_key_share(uint64_t **a1, rsize_t *a2, char *a3)
{
  BOOL v11 = timingsafe_enable_if_supported();
  unint64_t v6 = ccec_compressed_x962_export_pub_size(**a1);
  rsize_t v7 = *a2;
  if (*a2 < v6)
  {
    uint64_t v9 = 4294967289;
    goto LABEL_4;
  }
  *a2 = v6;
  uint64_t v8 = (uint64_t *)((uint64_t (*)(uint64_t **))(*a1)[1])(a1);
  uint64_t v9 = ccec_compressed_x962_export_pub(v8, a3);
  if (v9)
  {
    rsize_t v7 = *a2;
LABEL_4:
    cc_clear(v7, a3);
  }
  cc_disable_dit_with_sb((unsigned int *)&v11);
  return v9;
}

uint64_t ccsigma_import_peer_key_share(unint64_t ***a1, uint64_t a2, unsigned __int8 *a3)
{
  BOOL v9 = timingsafe_enable_if_supported();
  unint64_t v6 = (unint64_t **)((uint64_t (*)(unint64_t ***))(*a1)[2])(a1);
  uint64_t v7 = ccec_compressed_x962_import_pub(**a1, a2, a3, v6);
  cc_disable_dit_with_sb((unsigned int *)&v9);
  return v7;
}

uint64_t ccsigma_kex_init_ctx(uint64_t a1)
{
  uint64_t v1 = 16;
  if (!*(_DWORD *)(a1 + 8)) {
    uint64_t v1 = 8;
  }
  return (*(uint64_t (**)(void))(*(void *)a1 + v1))();
}

uint64_t ccsigma_kex_resp_ctx(uint64_t a1)
{
  uint64_t v1 = 16;
  if (*(_DWORD *)(a1 + 8) == 1) {
    uint64_t v1 = 8;
  }
  return (*(uint64_t (**)(void))(*(void *)a1 + v1))();
}

uint64_t ccsigma_derive_session_keys(uint64_t **a1, uint64_t a2, uint64_t a3, uint64_t (**a4)(void, uint64_t, uint64_t *))
{
  BOOL v18 = timingsafe_enable_if_supported();
  uint64_t v8 = *a1;
  uint64_t v9 = cczp_bitlen(**a1);
  unint64_t v17 = (unint64_t)(v9 + 7) >> 3;
  memset(v19, 0, sizeof(v19));
  if ((unint64_t)(v9 + 7) <= 0x107)
  {
    BOOL v11 = (unint64_t **)((uint64_t (*)(uint64_t **))v8[1])(a1);
    BOOL v12 = (unint64_t **)((uint64_t (*)(uint64_t **))(*a1)[2])(a1);
    uint64_t v13 = *v11;
    v15[0] = cc_malloc_clear(232 * **v11);
    v15[1] = 29 * *v13;
    v15[2] = 0;
    v15[3] = cc_ws_alloc;
    uint64_t v16 = cc_ws_free;
    if (v15[0])
    {
      uint64_t v10 = ccecdh_compute_shared_secret_ws((uint64_t)v15, v11, v12, &v17, (char *)v19, a4);
      v16((uint64_t)v15);
      if (!v10) {
        uint64_t v10 = ((uint64_t (*)(uint64_t **, unint64_t, _OWORD *, uint64_t, uint64_t))v8[12])(a1, v17, v19, a2, a3);
      }
    }
    else
    {
      uint64_t v10 = 4294967283;
    }
  }
  else
  {
    uint64_t v10 = 4294967291;
  }
  cc_disable_dit_with_sb((unsigned int *)&v18);
  return v10;
}

uint64_t ccsigma_compute_mac_internal(uint64_t *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a1;
  if (*(void *)(*a1 + 64) <= a2) {
    return 4294967289;
  }
  uint64_t v10 = 0;
  if (a2)
  {
    BOOL v11 = *(uint64_t **)(v5 + 72);
    unint64_t v12 = a2;
    do
    {
      uint64_t v13 = *v11++;
      v10 += v13;
      --v12;
    }
    while (v12);
  }
  uint64_t v14 = *(void *)(*(void *)(v5 + 72) + 8 * a2);
  uint64_t v15 = (*(uint64_t (**)(uint64_t *))(v5 + 88))(a1) + v10;
  uint64_t v16 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*a1 + 112);

  return v16(a1, v14, v15, a3, a4, a5);
}

uint64_t ccsigma_sign(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v16 = timingsafe_enable_if_supported();
  uint64_t v10 = *a1;
  unint64_t v11 = **(void **)(*a1 + 32);
  memset(v17, 0, sizeof(v17));
  if (v11 > 0x40)
  {
    uint64_t v13 = 4294967291;
  }
  else
  {
    uint64_t v12 = (*(uint64_t (**)(uint64_t *, void, uint64_t, uint64_t, _OWORD *))(v10 + 136))(a1, *((unsigned int *)a1 + 2), a3, a4, v17);
    if (!v12)
    {
      uint64_t v15 = *(void *)(*a1 + 40);
      uint64_t v12 = ((uint64_t (*)(uint64_t, unint64_t, _OWORD *, uint64_t *, uint64_t, uint64_t))a1[2])(a1[3], v11, v17, &v15, a2, a5);
    }
    uint64_t v13 = v12;
  }
  cc_disable_dit_with_sb((unsigned int *)&v16);
  return v13;
}

uint64_t ccsigma_verify(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v17 = timingsafe_enable_if_supported();
  uint64_t v8 = (uint64_t *)(*(uint64_t (**)(_DWORD *))(*(void *)a1 + 56))(a1);
  v15[0] = cc_malloc_clear(376 * *(void *)*v8);
  v15[1] = 47 * *(void *)*v8;
  v15[2] = 0;
  v15[3] = cc_ws_alloc;
  BOOL v16 = cc_ws_free;
  if (v15[0])
  {
    uint64_t v9 = *(void *)a1;
    unint64_t v10 = **(void **)(*(void *)a1 + 32);
    memset(v18, 0, sizeof(v18));
    if (v10 > 0x40)
    {
      uint64_t v13 = 4294967291;
    }
    else
    {
      uint64_t v11 = (*(uint64_t (**)(_DWORD *, BOOL, uint64_t, uint64_t, _OWORD *))(v9 + 136))(a1, a1[2] == 0, a3, a4, v18);
      if (!v11)
      {
        unint64_t v12 = ccec_signature_r_s_size(v8);
        uint64_t v11 = ccec_verify_composite_digest_ws((uint64_t)v15, v8, v10, (uint64_t)v18, a2, a2 + v12, 0);
      }
      uint64_t v13 = v11;
    }
    v16((uint64_t)v15);
  }
  else
  {
    uint64_t v13 = 4294967283;
  }
  cc_disable_dit_with_sb((unsigned int *)&v17);
  return v13;
}

uint64_t ccsigma_seal(uint64_t *a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  BOOL v34 = timingsafe_enable_if_supported();
  uint64_t v17 = *a1;
  if (*(void *)(*a1 + 64) <= a2) {
    goto LABEL_12;
  }
  uint64_t v18 = 0;
  if (a2)
  {
    uint64_t v19 = *(uint64_t **)(v17 + 72);
    unint64_t v20 = a2;
    do
    {
      uint64_t v21 = *v19++;
      v18 += v21;
      --v20;
    }
    while (v20);
  }
  uint64_t v22 = *(void *)(*(void *)(v17 + 72) + 8 * a2);
  uint64_t v23 = (*(uint64_t (**)(uint64_t *))(v17 + 88))(a1);
  uint64_t v24 = *a1;
  if (*(void *)(*a1 + 64) <= a3)
  {
LABEL_12:
    uint64_t v32 = 4294967289;
  }
  else
  {
    uint64_t v25 = v23 + v18;
    uint64_t v26 = 0;
    if (a3)
    {
      uint64_t v27 = *(uint64_t **)(v24 + 72);
      unint64_t v28 = a3;
      do
      {
        uint64_t v29 = *v27++;
        v26 += v29;
        --v28;
      }
      while (v28);
    }
    uint64_t v30 = *(void *)(*(void *)(v24 + 72) + 8 * a3);
    uint64_t v31 = (*(uint64_t (**)(uint64_t *))(v24 + 88))(a1) + v26;
    uint64_t v32 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*a1 + 152))(a1, v22, v25, v30, v31, a4, a5, a6, a7, a8, a9);
    if (!v32) {
      (*(void (**)(uint64_t, uint64_t))(*a1 + 168))(v30, v31);
    }
  }
  cc_disable_dit_with_sb((unsigned int *)&v34);
  return v32;
}

uint64_t ccsigma_open(uint64_t *a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v38 = timingsafe_enable_if_supported();
  uint64_t v16 = *a1;
  unint64_t v17 = *(void *)(*a1 + 144);
  v39[0] = 0;
  v39[1] = 0;
  if (v17 > 0x10)
  {
    uint64_t v35 = 4294967291;
  }
  else
  {
    if (*(void *)(v16 + 64) <= a2) {
      goto LABEL_13;
    }
    uint64_t v18 = 0;
    if (a2)
    {
      uint64_t v19 = *(uint64_t **)(v16 + 72);
      unint64_t v20 = a2;
      do
      {
        uint64_t v21 = *v19++;
        v18 += v21;
        --v20;
      }
      while (v20);
    }
    uint64_t v22 = *(void *)(*(void *)(v16 + 72) + 8 * a2);
    uint64_t v23 = (*(uint64_t (**)(uint64_t *))(v16 + 88))(a1);
    uint64_t v24 = *a1;
    if (*(void *)(*a1 + 64) <= a3)
    {
LABEL_13:
      uint64_t v35 = 4294967289;
    }
    else
    {
      uint64_t v25 = a7;
      uint64_t v26 = a8;
      uint64_t v37 = a6;
      uint64_t v27 = v23 + v18;
      uint64_t v28 = v25;
      uint64_t v29 = 0;
      if (a3)
      {
        uint64_t v30 = *(uint64_t **)(v24 + 72);
        unint64_t v31 = a3;
        do
        {
          uint64_t v32 = *v30++;
          v29 += v32;
          --v31;
        }
        while (v31);
      }
      uint64_t v33 = *(void *)(*(void *)(v24 + 72) + 8 * a3);
      uint64_t v34 = (*(uint64_t (**)(uint64_t *))(v24 + 88))(a1) + v29;
      __memcpy_chk();
      uint64_t v35 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(*a1 + 160))(a1, v22, v27, v33, v34, a4, a5, v37, v28, v26, v39);
      if (!v35) {
        (*(void (**)(uint64_t, uint64_t))(*a1 + 168))(v33, v34);
      }
    }
  }
  cc_disable_dit_with_sb((unsigned int *)&v38);
  return v35;
}

uint64_t ccn_mux(uint64_t result, char a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  unint64_t v5 = state ^ (state << 13) ^ ((state ^ (unint64_t)(state << 13)) >> 7);
  uint64_t v6 = v5 ^ (v5 << 17);
  state = v6;
  for (uint64_t i = __ROR8__(0x5555555555555555, a2 | (2 * v6)); result; --result)
  {
    uint64_t v9 = *a4++;
    uint64_t v8 = v9;
    uint64_t v10 = *a5++;
    *a3 = v10 ^ v6;
    *a3++ = (v10 ^ v8) & 0x5555555555555555 ^ v10 ^ v6 ^ (v10 ^ v8) & i ^ v6;
  }
  return result;
}

uint64_t ccn_mux_next_mask()
{
  unint64_t v0 = state ^ (state << 13) ^ ((state ^ (unint64_t)(state << 13)) >> 7);
  uint64_t result = v0 ^ (v0 << 17);
  state = result;
  return result;
}

uint64_t ccn_mux_seed_mask(uint64_t result)
{
  state ^= result;
  return result;
}

uint64_t cczp_power_fast_ws(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v10 = cczp_n(a2);
  uint64_t v11 = ccn_bitlen_internal(v10, a5);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v17 = *(void *)(a1 + 16);
    uint64_t v13 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * v10);
    ccn_set(v10, v13, a4);
    cczp_sqr_ws(a1, a2);
    cczp_mul_ws(a1, a2);
    uint64_t v14 = (*(void *)(a5 + (((unint64_t)(v12 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v12 - 1)) & 1;
    if ((v12 & 1) == 0) {
      uint64_t v14 = (*(void *)(a5 + (((unint64_t)(v12 - 2) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v12 - 2)) & 1 | (2 * v14);
    }
    ccn_set(v10, a3, &v13[8 * (v14 - 1) * v10]);
    if ((v12 | 0xFFFFFFFFFFFFFFFELL) + v12)
    {
      unint64_t v15 = v12 + (v12 | 0xFFFFFFFFFFFFFFFELL) - 1;
      do
      {
        cczp_sqr_ws(a1, a2);
        cczp_sqr_ws(a1, a2);
        if ((*(void *)(a5 + (((v15 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v15 - 1)) & 1 | (2 * ((*(void *)(a5 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v15) & 1))) {
          cczp_mul_ws(a1, a2);
        }
        v15 -= 2;
      }
      while (v15 != -1);
    }
    *(void *)(a1 + 16) = v17;
  }
  else
  {
    ccn_seti(v10, a3, 1);
    cczp_to_ws(a1, a2);
  }
  return 0;
}

unint64_t ccn_bitlen_public_value(unint64_t result, unint64_t *a2)
{
  if (result)
  {
    unint64_t v2 = result;
    uint64_t result = 0;
    uint64_t v3 = 64;
    do
    {
      unint64_t v4 = *a2++;
      uint64_t result = ((((v4 | HIDWORD(v4)) + 0xFFFFFFFF) >> 32) - 1) & result | (v3 - __clz(v4 | 1)) & -(uint64_t)(((v4 | HIDWORD(v4)) + 0xFFFFFFFF) >> 32);
      v3 += 64;
      --v2;
    }
    while (v2);
  }
  return result;
}

void cc_abort()
{
}

uint64_t ccn_mul_ws(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ccn_mul(a2, a3, a4, a5);
}

uint64_t ccn_divmod_ws(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8)
{
  uint64_t v12 = ccn_n(a6, a8);
  unint64_t v13 = a2 - v12;
  uint64_t v50 = *(void *)(a1 + 16);
  uint64_t v14 = v12 + 1;
  unint64_t v15 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  uint64_t v16 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  uint64_t v59 = a1;
  uint64_t v17 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  v15[v12] = 0;
  uint64_t v57 = v12 - 1;
  unint64_t v18 = __clz(*(void *)(a8 + 8 * (v12 - 1)));
  ccn_shift_left(v12, (uint64_t)v15, a8, v18, v19);
  int v20 = -(int)v18;
  unint64_t v60 = v18;
  unint64_t v21 = v18 + 0xFFFFFFFF;
  if (v12) {
    ccn_set(v12, v16, (void *)(a3 + 8 * v13));
  }
  uint64_t v53 = -(uint64_t)HIDWORD(v21);
  char v54 = v20 & 0x3F;
  ccn_zero(1, (char *)v16 + 8 * v12);
  ccn_shift_left(v14, (uint64_t)v16, (uint64_t)v16, v60, v22);
  unint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = v15[v57];
  uint64_t v27 = -v26;
  unint64_t v29 = (unsigned __int128)-(__int128)__PAIR128__(v28, v26) >> 64;
  uint64_t v30 = 65;
  unint64_t v31 = v26;
  do
  {
    unsigned long long v32 = __PAIR128__(v29, v27) - __PAIR128__(v31, v23);
    unint64_t v33 = (unint64_t)((__PAIR128__(v29, v27) - __PAIR128__(v31, v23)) >> 64) >> 63;
    uint64_t v34 = v29 & ((uint64_t)((__PAIR128__(v29, v27) - __PAIR128__(v31, v23)) >> 64) >> 63);
    uint64_t v27 = (v33 - 1) & v32 | v27 & (*((uint64_t *)&v32 + 1) >> 63);
    *((void *)&v35 + 1) = v25;
    *(void *)&long long v35 = v24;
    uint64_t v25 = v35 >> 63;
    *((void *)&v35 + 1) = v24;
    *(void *)&long long v35 = *((void *)&v32 + 1);
    unint64_t v29 = (v33 != 0 ? 0 : *((void *)&v32 + 1)) | v34;
    uint64_t v24 = (v35 >> 63) ^ 1;
    *((void *)&v35 + 1) = v31;
    *(void *)&long long v35 = v23;
    unint64_t v23 = v35 >> 1;
    v31 >>= 1;
    --v30;
  }
  while (v30);
  unint64_t v56 = (v24 + 2) | ((((HIDWORD(v15[v57]) ^ 0x80000000 | v15[v57]) + 0xFFFFFFFF) >> 32) - 1);
  size_t v52 = 8 * v12;
  uint64_t v58 = v12;
  unint64_t v36 = (void *)(a3 - 8 * v12 + 8 * a2);
  unint64_t v37 = v13;
  do
  {
    unint64_t v38 = v13;
    uint64_t v39 = *v36 << v60;
    v16->i64[0] = v39;
    if (v37) {
      v16->i64[0] = ((*(v36 - 1) & (unint64_t)v53) >> v54) | v39;
    }
    unint64_t v40 = v16->u64[v58];
    uint64_t v41 = v16->i64[v57];
    uint64_t v63 = v15[v57];
    unint64_t v42 = ((__PAIR128__(v40, v41) - (unint64_t)v63) >> 64) + ((v40 * (unsigned __int128)v56) >> 64) + 2;
    if (v42 < v40) {
      unint64_t v42 = -1;
    }
    unint64_t v62 = v42;
    v65[0] = 0;
    v65[1] = 0;
    ccn_mul(1, (uint64_t)v65, (uint64_t)&v62, (uint64_t)&v63);
    v64[0] = v41;
    v64[1] = v40;
    BOOL v43 = ccn_sub_ws(0, 2, v65, v64, (unint64_t *)v65);
    v62 -= 2 * v43;
    BOOL v44 = ccn_add1_ws(0, 2, v65, v65, v63);
    unint64_t v45 = v62 + v44;
    v17[v58] = ccn_mul1(v58, v17, v15, v62 + v44);
    BOOL v46 = ccn_sub_ws(v59, v14, v16, v16->i64, v17);
    uint64_t v47 = v46 - ccn_cond_add(v14, v46, v16->i64, v16->i64, v15);
    uint64_t result = ccn_cond_add(v14, v47, v16->i64, v16->i64, v15);
    if (a5 && v37 < a4) {
      *(void *)(a5 + 8 * v37) = v45 - (v46 + v47);
    }
    if (v37) {
      uint64_t result = (uint64_t)memmove(&v16->u64[1], v16, v52);
    }
    --v37;
    --v36;
    unint64_t v13 = v38;
  }
  while (v37 <= v38);
  if (a5 && a4 > v38 + 1) {
    uint64_t result = cc_clear(8 * (a4 - (v38 + 1)), (void *)(a5 + 8 * (v38 + 1)));
  }
  if (a7)
  {
    ccn_shift_right(v58, v16, v16, v60);
    if (v58) {
      ccn_set(v58, a7, v16);
    }
    uint64_t result = ccn_zero(a6 - v58, &a7[8 * v58]);
  }
  *(void *)(v59 + 16) = v50;
  return result;
}

uint64_t cccbc_init_internal(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t cccbc_set_iv_internal(uint64_t a1, void *__dst, void *__src)
{
  if (__src) {
    memcpy(__dst, __src, *(void *)(a1 + 8));
  }
  else {
    cc_clear(*(void *)(a1 + 8), __dst);
  }
  return 0;
}

uint64_t cccbc_update_internal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 24))(a2, a3, a4, a5, a6);
}

uint64_t cccbc_one_shot_explicit_internal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7, uint64_t a8, uint64_t a9)
{
  if (*(void *)(a1 + 8) != a4 || a3 && a3 != a4) {
    return 4294967289;
  }
  size_t v16 = (*(void *)a1 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v17 = (char *)&v22 - v16;
  bzero((char *)&v22 - v16, v16);
  size_t v18 = (*(void *)(a1 + 8) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64x2_t v19 = (char *)&v22 - v18;
  bzero((char *)&v22 - v18, v18);
  uint64_t v20 = (*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(a1 + 16))(a1, v17, a2, a6);
  if (v20) {
    return v20;
  }
  if (a7) {
    memcpy(v19, a7, *(void *)(a1 + 8));
  }
  else {
    cc_clear(*(void *)(a1 + 8), v19);
  }
  uint64_t v15 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t, uint64_t))(a1 + 24))(v17, v19, a5, a8, a9);
  cc_clear(*(void *)a1, v17);
  return v15;
}

uint64_t ccmode_ctr_setctr(int a1, void *a2, void *__src)
{
  uint64_t v3 = *a2;
  a2[1] = *(void *)(*a2 + 8);
  memcpy((char *)a2 + ((*(void *)(v3 + 8) + 7) & 0xFFFFFFFFFFFFFFF8) + 16, __src, *(void *)(v3 + 8));
  return 0;
}

uint64_t ccn_random_bits(uint64_t a1, uint64_t a2, uint64_t (**a3)(void, unint64_t, uint64_t))
{
  char v4 = a1;
  unint64_t v5 = (unint64_t)(a1 + 63) >> 6;
  uint64_t result = (*a3)(a3, 8 * v5, a2);
  if (!result) {
    *(void *)(a2 + 8 * v5 - 8) &= 0xFFFFFFFFFFFFFFFFLL >> -(((((unint64_t)(v4 & 0x3F) + 0xFFFFFFFF) >> 32) - 1) & 0x40 | v4 & 0x3F);
  }
  return result;
}

uint64_t ccn_random_bits_fips(uint64_t a1, void *a2, uint64_t (**a3)(void, unint64_t, void *))
{
  char v4 = a1;
  unint64_t v5 = (unint64_t)(a1 + 63) >> 6;
  if ((unint64_t)(a1 + 63) > 0x7F)
  {
    uint64_t v6 = (*a3)(a3, 8 * v5, a2);
  }
  else
  {
    int v9 = 0;
    uint64_t __src = 0;
    uint64_t v6 = (*a3)(a3, 12uLL, &__src);
    memcpy(a2, &__src, 8 * v5);
    cc_clear(8 * v5, &__src);
  }
  if (!v6) {
    *((void *)a2 + v5 - 1) &= 0xFFFFFFFFFFFFFFFFLL >> -(((((unint64_t)(v4 & 0x3F) + 0xFFFFFFFF) >> 32) - 1) & 0x40 | v4 & 0x3F);
  }
  return v6;
}

uint64_t ccn_read_uint_public_value(unint64_t a1, void *a2, unint64_t a3, unsigned __int8 *a4)
{
  unint64_t v4 = 8 * a1;
  if (a3 > 8 * a1)
  {
    int v5 = 0;
    unint64_t v6 = a3 - v4;
    uint64_t v7 = a4;
    do
    {
      int v8 = *v7++;
      v5 |= v8;
      --a3;
    }
    while (a3 > v4);
    if (v5) {
      return 4294967289;
    }
    a4 += v6;
    a3 = 8 * a1;
  }
  if (a3 < 8)
  {
    unint64_t v10 = 0;
  }
  else
  {
    unint64_t v10 = ((a3 - 8) >> 3) + 1;
    uint64_t v11 = a2;
    unint64_t v12 = v10;
    do
    {
      *v11++ = bswap64(*(void *)&a4[a3 - 8]);
      a3 -= 8;
      --v12;
    }
    while (v12);
  }
  if (a3)
  {
    unint64_t v13 = 0;
    uint64_t v14 = -(uint64_t)a3;
    do
      unint64_t v13 = a4[a3 + v14] | (v13 << 8);
    while (!__CFADD__(v14++, 1));
    a2[v10++] = v13;
  }
  if (v10 < a1) {
    bzero(&a2[v10], v4 - 8 * v10);
  }
  return 0;
}

void *ccn_set(uint64_t a1, void *__dst, void *__src)
{
  return memmove(__dst, __src, 8 * a1);
}

uint64_t ccrng_process_init(uint64_t a1, uint64_t (*a2)(void), uint64_t (**a3)(void, uint64_t, _OWORD *))
{
  uint64_t v6 = a1 + 128;
  ccrng_schedule_timer_init(a1 + 128, a2, 5000000000);
  ccrng_schedule_atomic_flag_init(a1 + 168);
  ccrng_schedule_tree_init(a1 + 96, v6, a1 + 168);
  uint64_t result = cc_lock_init((_DWORD *)(a1 + 208));
  if (!result)
  {
    uint64_t result = ccentropy_rng_init((void *)(a1 + 192), (uint64_t)a3);
    if (!result)
    {
      int v8 = ccaes_cbc_encrypt_mode();
      uint64_t result = ccdrbg_df_bc_init_internal((void *)(a1 + 224), v8, 0x20uLL);
      if (!result)
      {
        int v9 = ccaes_ctr_crypt_mode();
        long long v10 = xmmword_1001B98C0;
        DWORD2(v10) = 1;
        uint64_t v11 = a1 + 224;
        ccdrbg_factory_nistctr((void *)(a1 + 768), (uint64_t)&v9);
        memset(v13, 0, sizeof(v13));
        uint64_t result = (*a3)(a3, 32, v13);
        if (!result)
        {
          a2();
          strcpy(v12, "corecrypto process rng");
          uint64_t result = ccdrbg_init_internal(a1 + 768);
          if (!result)
          {
            uint64_t result = ccrng_crypto_init((void *)(a1 + 8), a1 + 192, a1 + 96, a1 + 208, a1 + 768, a1 + 824, 4096, 0x20uLL, 256, a1 + 2104);
            if (!result) {
              *(void *)a1 = generate_2;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t generate_2(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(a1 + 8);
}

uint64_t ccrng_process_atfork_prepare(os_unfair_lock_s *a1)
{
  return 0;
}

uint64_t ccrng_process_atfork_parent(os_unfair_lock_s *a1)
{
  return 0;
}

uint64_t ccrng_process_atfork_child(uint64_t a1)
{
  return cc_lock_init((_DWORD *)(a1 + 208));
}

uint64_t ccec_verify_composite_digest_ws(uint64_t a1, uint64_t *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  if (a7)
  {
    *a7 = 0;
    a7[1] = 0;
  }
  long long v21 = 0uLL;
  uint64_t v13 = *(void *)*a2;
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v13);
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v13);
  unint64_t v17 = ccec_signature_r_s_size(a2);
  if (ccn_read_uint_internal(v13, v15, v17, a5)
    || (unint64_t v18 = ccec_signature_r_s_size(a2), ccn_read_uint_internal(v13, v16, v18, a6)))
  {
    uint64_t result = 4294967289;
  }
  else
  {
    uint64_t result = ccec_verify_internal_ws(a1, (unint64_t **)a2, a3, a4, v15, v16, (uint64_t)&v21);
    if (a7 && !result) {
      *(_OWORD *)a7 = v21;
    }
  }
  *(void *)(a1 + 16) = v14;
  return result;
}

uint64_t ccec_verify_composite_msg_ws(uint64_t a1, uint64_t *a2, unint64_t *a3, size_t a4, char *a5, uint64_t a6, uint64_t a7, void *a8)
{
  memset(v15, 0, sizeof(v15));
  ccdigest_internal((uint64_t)a3, a4, a5, (uint64_t)v15);
  return ccec_verify_composite_digest_ws(a1, a2, *a3, (uint64_t)v15, a6, a7, a8);
}

uint64_t ccn_shift_right(uint64_t result, int8x16_t *a2, int8x16_t *a3, uint64_t a4)
{
  if (result) {
    return ccn_shift_right_asm(result, a2, a3, a4);
  }
  return result;
}

uint64_t ccn_shift_right_multi(uint64_t a1, int8x16_t *a2, int8x16_t *a3, unint64_t a4)
{
  uint64_t result = ccn_shift_right(a1, a2, a3, a4 & 0x3F);
  if (a1)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v8;
      do
      {
        v9 |= ((((v10 ^ (v8 + (a4 >> 6)) | ((v10 ^ (v8 + (a4 >> 6))) >> 32))
               + 0xFFFFFFFF) >> 32)
             - 1) & a2->i64[v10];
        ++v10;
      }
      while (a1 != v10);
      a2->i64[v8++] = v9;
    }
    while (v8 != a1);
  }
  return result;
}

BOOL ccn_sub_ws(uint64_t a1, BOOL a2, void *a3, uint64_t *a4, unint64_t *a5)
{
  return ccn_sub_asm(a2, a3, a4, a5);
}

BOOL ccn_sub_asm(BOOL result, void *a2, uint64_t *a3, unint64_t *a4)
{
  _BOOL1 v4 = 1;
  if (result)
  {
    if (result)
    {
      unint64_t v6 = *a3++;
      unint64_t v5 = v6;
      unint64_t v7 = *a4++;
      _BOOL1 v4 = v5 >= v7;
      *a2++ = v5 - v7;
    }
    if (result & 2)
    {
      uint64_t v8 = *a3;
      uint64_t v9 = a3[1];
      a3 += 2;
      unint64_t v10 = *a4;
      unint64_t v11 = a4[1];
      a4 += 2;
      _BOOL1 v13 = v4;
      _BOOL1 v4 = __CFSUB__(v8, v10, v4);
      uint64_t v12 = v8 - (v10 + !v13);
      _BOOL1 v14 = v4;
      _BOOL1 v4 = __CFSUB__(v9, v11, v4);
      *a2 = v12;
      a2[1] = v9 - (v11 + !v14);
      a2 += 2;
    }
    BOOL v15 = result & 0xFFFFFFFC;
    if (v15)
    {
      int v16 = v15 - 4;
      uint64_t v18 = *a3;
      uint64_t v19 = a3[1];
      unint64_t v17 = a3 + 2;
      unint64_t v21 = *a4;
      uint64_t v22 = a4[1];
      uint64_t v20 = (uint64_t *)(a4 + 2);
      uint64_t v24 = *v17;
      uint64_t v25 = v17[1];
      unint64_t v23 = v17 + 2;
      uint64_t v27 = *v20;
      uint64_t v28 = v20[1];
      for (uint64_t i = v20 + 2; v16; uint64_t i = v38 + 2)
      {
        _BOOL1 v30 = v4;
        _BOOL1 v4 = __CFSUB__(v18, v21, v4);
        uint64_t v29 = v18 - (v21 + !v30);
        _BOOL1 v32 = v4;
        _BOOL1 v4 = __CFSUB__(v19, v22, v4);
        uint64_t v31 = v19 - (v22 + !v32);
        uint64_t v18 = *v23;
        uint64_t v19 = v23[1];
        unint64_t v33 = v23 + 2;
        _BOOL1 v35 = v4;
        _BOOL1 v4 = __CFSUB__(v24, v27, v4);
        uint64_t v34 = v24 - (v27 + !v35);
        *a2 = v29;
        a2[1] = v31;
        unint64_t v36 = a2 + 2;
        _BOOL1 v37 = v4;
        _BOOL1 v4 = __CFSUB__(v25, v28, v4);
        unint64_t v21 = *i;
        uint64_t v22 = i[1];
        unint64_t v38 = i + 2;
        *unint64_t v36 = v34;
        v36[1] = v25 - (v28 + !v37);
        a2 = v36 + 2;
        v16 -= 4;
        uint64_t v24 = *v33;
        uint64_t v25 = v33[1];
        unint64_t v23 = v33 + 2;
        uint64_t v27 = *v38;
        uint64_t v28 = v38[1];
      }
      _BOOL1 v40 = v4;
      _BOOL1 v4 = __CFSUB__(v18, v21, v4);
      uint64_t v39 = v18 - (v21 + !v40);
      _BOOL1 v42 = v4;
      _BOOL1 v4 = __CFSUB__(v19, v22, v4);
      uint64_t v41 = v19 - (v22 + !v42);
      _BOOL1 v44 = v4;
      _BOOL1 v4 = __CFSUB__(v24, v27, v4);
      uint64_t v43 = v24 - (v27 + !v44);
      _BOOL1 v45 = v4;
      _BOOL1 v4 = __CFSUB__(v25, v28, v4);
      *a2 = v39;
      a2[1] = v41;
      BOOL v46 = a2 + 2;
      void *v46 = v43;
      v46[1] = v25 - (v28 + !v45);
    }
    return !v4;
  }
  return result;
}

unint64_t ccn_sub1(uint64_t a1, void *a2, unint64_t *a3, unint64_t a4)
{
  for (; a1; --a1)
  {
    unint64_t v4 = *a3++;
    unsigned long long v5 = v4 - (unsigned __int128)a4;
    *a2++ = v5;
    a4 = *((void *)&v5 + 1) >> 63;
  }
  return a4;
}

unint64_t ccn_write_uint_size_internal(unint64_t a1, unint64_t *a2)
{
  return (ccn_bitlen_public_value(a1, a2) + 7) >> 3;
}

uint64_t ccn_write_uint_padded_ct_internal(unint64_t a1, unint64_t *a2, unint64_t a3, char *__s)
{
  if (a3 > 0x7FFFFFFE) {
    return 4294967289;
  }
  unint64_t v6 = 8 * a1;
  if (8 * a1 > 0x7FFFFFFE) {
    return 4294967289;
  }
  unint64_t v7 = __s;
  unint64_t v8 = a3;
  unint64_t v10 = a3 - v6;
  if (a3 <= v6)
  {
    LODWORD(v10) = 0;
  }
  else
  {
    cc_clear(a3 - v6, __s);
    v7 += v10;
    unint64_t v8 = v6;
  }
  unint64_t v11 = ccn_bitlen_public_value(a1, a2);
  if (v8 < (v11 + 7) >> 3) {
    return 4294967289;
  }
  uint64_t result = v10 + v8 - ((v11 + 7) >> 3);
  if (v8 < 8)
  {
    unint64_t v12 = 0;
  }
  else
  {
    unint64_t v12 = ((v8 - 8) >> 3) + 1;
    _BOOL1 v13 = a2;
    unint64_t v14 = v12;
    do
    {
      unint64_t v15 = *v13++;
      *(void *)&v7[v8 - 8] = bswap64(v15);
      v8 -= 8;
      --v14;
    }
    while (v14);
  }
  if (v8)
  {
    unint64_t v16 = a2[v12];
    unint64_t v17 = &v7[v8 - 1];
    do
    {
      *v17-- = v16;
      v16 >>= 8;
      --v8;
    }
    while (v8);
  }
  return result;
}

BOOL ccn_add1_asm(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4)
{
  if (!a1) {
    return a4;
  }
  uint64_t v5 = *a3;
  unint64_t v4 = a3 + 1;
  BOOL v6 = __CFADD__(v5, a4);
  *a2 = v5 + a4;
  for (uint64_t i = a2 + 1; --a1; ++i)
  {
    uint64_t v8 = *v4++;
    BOOL v9 = v6;
    BOOL v6 = __CFADD__(v6, v8);
    *uint64_t i = v9 + v8;
  }
  return v6;
}

uint64_t ccn_cond_neg(uint64_t a1, char a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = ccn_mux_next_mask();
  uint64_t v9 = __ROR8__(0x5555555555555555, a2 | (2 * result));
  if (a1)
  {
    BOOL v10 = 1;
    do
    {
      uint64_t v12 = *a4++;
      uint64_t v11 = v12;
      BOOL v13 = v10 + ~v12;
      BOOL v10 = __CFADD__(v10, ~v12);
      uint64_t v14 = v11 ^ v13;
      uint64_t v15 = v11 ^ result;
      *a3 = v15;
      *a3++ = v14 & v9 ^ v14 & 0x5555555555555555 ^ v15 ^ result;
      --a1;
    }
    while (a1);
  }
  return result;
}

unint64_t ccec_compressed_x962_export_pub_size(uint64_t a1)
{
  return ((unint64_t)(cczp_bitlen(a1) + 7) >> 3) + 1;
}

uint64_t ccec_compressed_x962_export_pub(uint64_t *a1, char *a2)
{
  uint64_t v3 = (unint64_t *)(a1 + 2);
  unint64_t v4 = (unint64_t *)*a1;
  unint64_t v6 = ((unint64_t)(cczp_bitlen(*a1) + 7) >> 3) + 1;
  return ccec_export_affine_point_public_value(v4, 3, v3, &v6, a2);
}

uint64_t cc_lock_init(_DWORD *a1)
{
  *a1 = 0;
  return 0;
}

uint64_t cccmac_final_generate_internal(char *__s, size_t a2, void *a3)
{
  __src[0] = 0;
  __src[1] = 0;
  unint64_t v4 = (void *)*((void *)__s + 8);
  unint64_t v5 = *((void *)__s + 6);
  unint64_t v6 = *((void *)__s + 7) + v5;
  *((void *)__s + 7) = v6;
  if (v5 > 0x10)
  {
    uint64_t v10 = 0xFFFFFFFFLL;
  }
  else
  {
    if (v5) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v6 == 0;
    }
    char v9 = !v8;
    uint64_t v10 = 0xFFFFFFFFLL;
    if (a2 - 17 >= 0xFFFFFFFFFFFFFFF0 && (v9 & 1) == 0)
    {
      uint64_t v12 = __s + 32;
      BOOL v13 = __s;
      if (v5 != 16)
      {
        BOOL v13 = __s + 16;
        uint64_t v14 = &v12[v5];
        cc_clear(16 - v5, &v12[v5]);
        char *v14 = 0x80;
      }
      for (uint64_t i = 0; i != -16; --i)
        __s[i + 47] ^= v13[i + 15];
      cccbc_update_internal((uint64_t)v4, (uint64_t)(__s + 72), (uint64_t)&__s[*v4 + 72], 1, (uint64_t)(__s + 32), (uint64_t)__src);
      memcpy(a3, __src, a2);
      uint64_t v10 = 0;
      unint64_t v4 = (void *)*((void *)__s + 8);
    }
  }
  cc_clear(v4[1] + *v4 + 80, __s);
  return v10;
}

unint64_t ccn_subn(uint64_t a1, void *a2, uint64_t *a3, BOOL a4, unint64_t *a5)
{
  uint64_t v5 = a1 - a4;
  unint64_t v6 = &a2[a4];
  unint64_t v7 = (unint64_t *)&a3[a4];
  unint64_t v8 = ccn_sub_ws(0, a4, a2, a3, a5);

  return ccn_sub1(v5, v6, v7, v8);
}

uint64_t cc_fault_canary_set(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  for (unint64_t i = 0; i != 16; ++i)
    *(unsigned char *)(result + i) = *(unsigned char *)(a5 + i % a3) ^ *(unsigned char *)(a4 + i % a3) ^ *(unsigned char *)(a2 + i);
  if (a3 >= 0x11)
  {
    for (uint64_t j = 16; j != a3; ++j)
      *(unsigned char *)(result + (j & 0xF)) ^= *(unsigned char *)(a5 + j) ^ *(unsigned char *)(a4 + j);
  }
  return result;
}

uint64_t ccec_validate_scalar(void *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = cczp_prime((uint64_t)&a1[5 * *a1 + 4]);
  if ((ccn_cmp_internal(v4, a2, v5) & 0x80000000) == 0) {
    return 0xFFFFFFFFLL;
  }
  if (ccn_n(*a1, a2)) {
    return 0;
  }
  return 0xFFFFFFFFLL;
}

int32x4_t *AccelerateCrypto_SHA256_compress(int32x4_t *result, uint64_t a2, int8x16_t *a3)
{
  if (a2)
  {
    int8x16_t v4 = *a3;
    int8x16_t v5 = a3[1];
    int8x16_t v6 = a3[2];
    int8x16_t v7 = a3[3];
    uint64_t v3 = a3 + 4;
    _Q1 = (int32x4_t)vrev32q_s8(v5);
    int32x4_t v9 = *result;
    _Q2 = (int32x4_t)vrev32q_s8(v6);
    _Q17 = result[1];
    _Q3 = (int32x4_t)vrev32q_s8(v7);
    _Q18 = *result;
    _Q4 = vaddq_s32((int32x4_t)vrev32q_s8(v4), (int32x4_t)K256);
    _Q5 = vaddq_s32(_Q1, (int32x4_t)xmmword_1001817D0);
    _Q19 = _Q17;
    _Q6 = vaddq_s32(_Q2, (int32x4_t)xmmword_1001817E0);
    _Q7 = vaddq_s32(_Q3, (int32x4_t)xmmword_1001817F0);
    uint64_t v19 = &xmmword_100181800;
    int v20 = 3;
    do
    {
      _Q20 = _Q18;
      int32x4_t v22 = (int32x4_t)*v19;
      __asm { SHA256SU0       V0.4S, V1.4S }
      int32x4_t v28 = (int32x4_t)v19[1];
      __asm { SHA256H         Q18, Q19, V4.4S }
      int32x4_t v30 = (int32x4_t)v19[2];
      __asm { SHA256SU1       V0.4S, V2.4S, V3.4S }
      int32x4_t v32 = (int32x4_t)v19[3];
      __asm { SHA256H2        Q19, Q20, V4.4S }
      v19 += 4;
      _Q4 = vaddq_s32(_Q0, v22);
      _Q20 = _Q18;
      __asm
      {
        SHA256SU0       V1.4S, V2.4S
        SHA256H         Q18, Q19, V5.4S
        SHA256SU1       V1.4S, V3.4S, V0.4S
        SHA256H2        Q19, Q20, V5.4S
      }
      _Q5 = vaddq_s32(_Q1, v28);
      _Q20 = _Q18;
      __asm
      {
        SHA256SU0       V2.4S, V3.4S
        SHA256H         Q18, Q19, V6.4S
        SHA256SU1       V2.4S, V0.4S, V1.4S
        SHA256H2        Q19, Q20, V6.4S
      }
      _Q6 = vaddq_s32(_Q2, v30);
      --v20;
      _Q20 = _Q18;
      __asm
      {
        SHA256SU0       V3.4S, V0.4S
        SHA256H         Q18, Q19, V7.4S
        SHA256SU1       V3.4S, V1.4S, V2.4S
        SHA256H2        Q19, Q20, V7.4S
      }
      _Q7 = vaddq_s32(_Q3, v32);
    }
    while (!(_NF ^ _VF | _ZF));
    BOOL v44 = a2 <= 1;
    uint64_t v45 = a2 - 1;
    if (!v44)
    {
      BOOL v46 = (int32x4_t *)(v19 - 16);
      do
      {
        _Q20 = _Q18;
        __asm { SHA256H         Q18, Q19, V4.4S }
        int8x16_t v49 = v3[1];
        int8x16_t v50 = v3[2];
        __asm { SHA256H2        Q19, Q20, V4.4S }
        int8x16_t v52 = v3[3];
        _Q4 = vaddq_s32((int32x4_t)vrev32q_s8(*v3), *v46);
        _Q20 = _Q18;
        v3 += 4;
        __asm { SHA256H         Q18, Q19, V5.4S }
        _Q1 = (int32x4_t)vrev32q_s8(v49);
        __asm { SHA256H2        Q19, Q20, V5.4S }
        _Q5 = vaddq_s32(_Q1, v46[1]);
        _Q20 = _Q18;
        __asm { SHA256H         Q18, Q19, V6.4S }
        _Q2 = (int32x4_t)vrev32q_s8(v50);
        __asm { SHA256H2        Q19, Q20, V6.4S }
        _Q6 = vaddq_s32(_Q2, v46[2]);
        _Q20 = _Q18;
        __asm { SHA256H         Q18, Q19, V7.4S }
        _Q3 = (int32x4_t)vrev32q_s8(v52);
        __asm { SHA256H2        Q19, Q20, V7.4S }
        _Q7 = vaddq_s32(_Q3, v46[3]);
        int32x4_t v9 = vaddq_s32(v9, _Q18);
        _Q17 = vaddq_s32(_Q17, _Q19);
        _Q20 = v9;
        __asm
        {
          SHA256SU0       V0.4S, V1.4S
          SHA256H         Q18, Q19, V4.4S
          SHA256SU1       V0.4S, V2.4S, V3.4S
          SHA256H2        Q19, Q20, V4.4S
        }
        _Q4 = vaddq_s32(_Q0, v46[4]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V1.4S, V2.4S
          SHA256H         Q18, Q19, V5.4S
          SHA256SU1       V1.4S, V3.4S, V0.4S
          SHA256H2        Q19, Q20, V5.4S
        }
        _Q5 = vaddq_s32(_Q1, v46[5]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V2.4S, V3.4S
          SHA256H         Q18, Q19, V6.4S
          SHA256SU1       V2.4S, V0.4S, V1.4S
          SHA256H2        Q19, Q20, V6.4S
        }
        _Q6 = vaddq_s32(_Q2, v46[6]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V3.4S, V0.4S
          SHA256H         Q18, Q19, V7.4S
          SHA256SU1       V3.4S, V1.4S, V2.4S
          SHA256H2        Q19, Q20, V7.4S
        }
        _Q7 = vaddq_s32(_Q3, v46[7]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V0.4S, V1.4S
          SHA256H         Q18, Q19, V4.4S
          SHA256SU1       V0.4S, V2.4S, V3.4S
          SHA256H2        Q19, Q20, V4.4S
        }
        _Q4 = vaddq_s32(_Q0, v46[8]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V1.4S, V2.4S
          SHA256H         Q18, Q19, V5.4S
          SHA256SU1       V1.4S, V3.4S, V0.4S
          SHA256H2        Q19, Q20, V5.4S
        }
        _Q5 = vaddq_s32(_Q1, v46[9]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V2.4S, V3.4S
          SHA256H         Q18, Q19, V6.4S
          SHA256SU1       V2.4S, V0.4S, V1.4S
          SHA256H2        Q19, Q20, V6.4S
        }
        _Q6 = vaddq_s32(_Q2, v46[10]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V3.4S, V0.4S
          SHA256H         Q18, Q19, V7.4S
          SHA256SU1       V3.4S, V1.4S, V2.4S
          SHA256H2        Q19, Q20, V7.4S
        }
        _Q7 = vaddq_s32(_Q3, v46[11]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V0.4S, V1.4S
          SHA256H         Q18, Q19, V4.4S
          SHA256SU1       V0.4S, V2.4S, V3.4S
          SHA256H2        Q19, Q20, V4.4S
        }
        _Q4 = vaddq_s32(_Q0, v46[12]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V1.4S, V2.4S
          SHA256H         Q18, Q19, V5.4S
          SHA256SU1       V1.4S, V3.4S, V0.4S
          SHA256H2        Q19, Q20, V5.4S
        }
        _Q5 = vaddq_s32(_Q1, v46[13]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V2.4S, V3.4S
          SHA256H         Q18, Q19, V6.4S
          SHA256SU1       V2.4S, V0.4S, V1.4S
          SHA256H2        Q19, Q20, V6.4S
        }
        _Q6 = vaddq_s32(_Q2, v46[14]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V3.4S, V0.4S
          SHA256H         Q18, Q19, V7.4S
          SHA256SU1       V3.4S, V1.4S, V2.4S
          SHA256H2        Q19, Q20, V7.4S
        }
        _Q7 = vaddq_s32(_Q3, v46[15]);
        BOOL v44 = v45-- <= 1;
      }
      while (!v44);
    }
    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V4.4S
      SHA256H2        Q19, Q20, V4.4S
    }
    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V5.4S
      SHA256H2        Q19, Q20, V5.4S
    }
    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V6.4S
      SHA256H2        Q19, Q20, V6.4S
    }
    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V7.4S
      SHA256H2        Q19, Q20, V7.4S
    }
    *uint64_t result = vaddq_s32(v9, _Q18);
    result[1] = vaddq_s32(_Q17, _Q19);
  }
  return result;
}

uint64_t ccec_import_affine_point_ws(uint64_t a1, unint64_t *a2, int a3, uint64_t a4, unsigned __int8 *a5, void *a6)
{
  if (!a4) {
    return 4294967289;
  }
  unint64_t v11 = *a2;
  if (a4 == 1 && !*a5) {
    return 4294967136;
  }
  switch(a3)
  {
    case 4:
      uint64_t v12 = 4294967124;
      if (a4 != (unint64_t)(cczp_bitlen((uint64_t)a2) + 7) >> 3) {
        return v12;
      }
      goto LABEL_20;
    case 1:
      if ((((unint64_t)(cczp_bitlen((uint64_t)a2) + 7) >> 2) | 1) != a4) {
        return 4294967126;
      }
      uint64_t v12 = 4294967126;
      if (*a5 != 4) {
        return v12;
      }
LABEL_20:
      uint64_t v14 = *(void *)(a1 + 16);
      uint64_t v15 = (uint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v11);
      if (a3 == 4) {
        unint64_t v16 = a5;
      }
      else {
        unint64_t v16 = a5 + 1;
      }
      uint64_t v17 = cczp_bitlen((uint64_t)a2);
      uint64_t uint_public_value = ccn_read_uint_public_value(v11, a6, (unint64_t)(v17 + 7) >> 3, v16);
      if (uint_public_value) {
        goto LABEL_38;
      }
      if (ccn_cmp_public_value(v11, a6, a2 + 3) == -1)
      {
        if ((a3 - 3) <= 1)
        {
          uint64_t uint_public_value = ccec_affine_point_from_x_ws(a1, a2, (uint64_t)a6, (uint64_t)a6);
          if (!uint_public_value)
          {
            cczp_negate((uint64_t)a2, v15, &a6[*a2]);
            uint64_t v19 = &a6[*a2];
            if (a3 == 4) {
              unsigned int v20 = ccn_cmp_public_value(v11, v15, v19) >> 31;
            }
            else {
              LOBYTE(v20) = (*v19 & 1) != (*a5 & 1);
            }
            ccn_mux(v11, v20, v19, v15, v19);
            goto LABEL_35;
          }
LABEL_38:
          uint64_t v12 = uint_public_value;
          goto LABEL_36;
        }
        unint64_t v21 = &a5[((unint64_t)(cczp_bitlen((uint64_t)a2) + 7) >> 3) + 1];
        int32x4_t v22 = &a6[*a2];
        uint64_t v23 = cczp_bitlen((uint64_t)a2);
        uint64_t v12 = ccn_read_uint_public_value(v11, v22, (unint64_t)(v23 + 7) >> 3, v21);
        if (!v12)
        {
          if (a3 != 2 || (a6[*a2] & 1) == (*a5 & 1))
          {
LABEL_35:
            uint64_t v12 = 0;
            goto LABEL_36;
          }
          uint64_t v12 = 4294967125;
        }
      }
LABEL_36:
      *(void *)(a1 + 16) = v14;
      return v12;
    case 2:
      if ((((unint64_t)(cczp_bitlen((uint64_t)a2) + 7) >> 2) | 1) != a4) {
        return 4294967125;
      }
      unsigned int v13 = *a5 - 8;
      uint64_t v12 = 4294967125;
      goto LABEL_19;
  }
  if (a3 != 3) {
    return 4294967289;
  }
  if (ccec_compressed_x962_export_pub_size((uint64_t)a2) != a4) {
    return 4294967135;
  }
  unsigned int v13 = *a5 - 4;
  uint64_t v12 = 4294967135;
LABEL_19:
  if (v13 >= 0xFFFFFFFE) {
    goto LABEL_20;
  }
  return v12;
}

uint64_t cccmac_generate_subkeys(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5)
{
  v17[0] = 0;
  v17[1] = 0;
  __s[0] = 0;
  __s[1] = 0;
  uint64_t result = cccbc_one_shot_explicit_internal(a1, a2, 16, *(void *)(a1 + 8), 1, a3, v17, (uint64_t)__s, (uint64_t)__s);
  if (!result)
  {
    LOBYTE(v8) = 0;
    unsigned int v9 = SLOBYTE(__s[0]);
    for (uint64_t i = 15; i != -1; --i)
    {
      unsigned int v11 = *((unsigned __int8 *)__s + i);
      a4[i] = v8 | (2 * v11);
      unsigned int v8 = v11 >> 7;
    }
    LOBYTE(v12) = 0;
    a4[15] ^= (v9 >> 7) & 0x87;
    unsigned int v13 = *a4;
    for (uint64_t j = 15; j != -1; --j)
    {
      unsigned int v15 = a4[j];
      *(unsigned char *)(a5 + j) = v12 | (2 * v15);
      unsigned int v12 = v15 >> 7;
    }
    *(unsigned char *)(a5 + 15) ^= (v13 >> 7) & 0x87;
    cc_clear(0x10uLL, __s);
    return 0;
  }
  return result;
}

void *ccsha1_di()
{
  return &ccsha1_vng_arm_di;
}

int8x16_t gcm_init(int8x16_t *a1, int8x16_t *a2, double a3, double a4, double a5, double a6, double a7, int8x16_t a8)
{
  int32x4_t v8 = (int32x4_t)vqtbl1q_s8(*a2, *(int8x16_t *)qword_100182600);
  int8x16_t v9 = veorq_s8(a8, a8);
  int8x16_t v10 = veorq_s8(vandq_s8(vextq_s8(*(int8x16_t *)&qword_100182600[2], *(int8x16_t *)&qword_100182600[2], 8uLL), (int8x16_t)vshrq_n_s32(vdupq_laneq_s32(v8, 3), 0x1FuLL)), vorrq_s8(vextq_s8(v9, (int8x16_t)vshrq_n_u64((uint64x2_t)v8, 0x3FuLL), 8uLL), (int8x16_t)vshlq_n_s64((int64x2_t)v8, 1uLL)));
  *a1 = v10;
  a1[8] = veorq_s8(v10, vextq_s8(v10, v10, 8uLL));
  int8x16_t v11 = (int8x16_t)vmull_high_p64((uint64x2_t)v10, (uint64x2_t)v10);
  int8x16_t v12 = (int8x16_t)vmull_p64(v10.u64[0], v10.u64[0]);
  int8x16_t v13 = veorq_s8(v12, veorq_s8(v11, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0])));
  int8x16_t v14 = veorq_s8(vextq_s8(v9, v13, 8uLL), v12);
  int8x16_t v15 = veorq_s8(vextq_s8(v14, v14, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v14.u64[0]));
  int8x16_t v16 = veorq_s8(veorq_s8(vextq_s8(v13, v9, 8uLL), v11), veorq_s8(vextq_s8(v15, v15, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v15.u64[0])));
  a1[1] = v16;
  a1[9] = veorq_s8(v16, vextq_s8(v16, v16, 8uLL));
  v13.i64[0] = veorq_s8(v16, vextq_s8(v16, v16, 8uLL)).u64[0];
  int8x16_t v17 = (int8x16_t)vmull_high_p64((uint64x2_t)v16, (uint64x2_t)v10);
  int8x16_t v18 = (int8x16_t)vmull_p64(v16.u64[0], v10.u64[0]);
  int8x16_t v19 = veorq_s8(v18, veorq_s8(v17, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v13.u64[0])));
  int8x16_t v20 = veorq_s8(vextq_s8(v9, v19, 8uLL), v18);
  int8x16_t v21 = veorq_s8(vextq_s8(v20, v20, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v20.u64[0]));
  int8x16_t v22 = veorq_s8(veorq_s8(vextq_s8(v19, v9, 8uLL), v17), veorq_s8(vextq_s8(v21, v21, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v21.u64[0])));
  a1[2] = v22;
  a1[10] = veorq_s8(v22, vextq_s8(v22, v22, 8uLL));
  v19.i64[0] = veorq_s8(v22, vextq_s8(v22, v22, 8uLL)).u64[0];
  int8x16_t v23 = (int8x16_t)vmull_high_p64((uint64x2_t)v22, (uint64x2_t)v10);
  int8x16_t v24 = (int8x16_t)vmull_p64(v22.u64[0], v10.u64[0]);
  int8x16_t v25 = veorq_s8(v24, veorq_s8(v23, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v19.u64[0])));
  int8x16_t v26 = veorq_s8(vextq_s8(v9, v25, 8uLL), v24);
  int8x16_t v27 = veorq_s8(vextq_s8(v26, v26, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v26.u64[0]));
  int8x16_t v28 = veorq_s8(veorq_s8(vextq_s8(v25, v9, 8uLL), v23), veorq_s8(vextq_s8(v27, v27, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v27.u64[0])));
  a1[3] = v28;
  a1[11] = veorq_s8(v28, vextq_s8(v28, v28, 8uLL));
  v25.i64[0] = veorq_s8(v28, vextq_s8(v28, v28, 8uLL)).u64[0];
  int8x16_t v29 = (int8x16_t)vmull_high_p64((uint64x2_t)v28, (uint64x2_t)v10);
  int8x16_t v30 = (int8x16_t)vmull_p64(v28.u64[0], v10.u64[0]);
  int8x16_t v31 = veorq_s8(v30, veorq_s8(v29, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v25.u64[0])));
  int8x16_t v32 = veorq_s8(vextq_s8(v9, v31, 8uLL), v30);
  int8x16_t v33 = veorq_s8(vextq_s8(v32, v32, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v32.u64[0]));
  int8x16_t v34 = veorq_s8(veorq_s8(vextq_s8(v31, v9, 8uLL), v29), veorq_s8(vextq_s8(v33, v33, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v33.u64[0])));
  a1[4] = v34;
  a1[12] = veorq_s8(v34, vextq_s8(v34, v34, 8uLL));
  v31.i64[0] = veorq_s8(v34, vextq_s8(v34, v34, 8uLL)).u64[0];
  int8x16_t v35 = (int8x16_t)vmull_high_p64((uint64x2_t)v34, (uint64x2_t)v10);
  int8x16_t v36 = (int8x16_t)vmull_p64(v34.u64[0], v10.u64[0]);
  int8x16_t v37 = veorq_s8(v36, veorq_s8(v35, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v31.u64[0])));
  int8x16_t v38 = veorq_s8(vextq_s8(v9, v37, 8uLL), v36);
  int8x16_t v39 = veorq_s8(vextq_s8(v38, v38, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v38.u64[0]));
  int8x16_t v40 = veorq_s8(veorq_s8(vextq_s8(v37, v9, 8uLL), v35), veorq_s8(vextq_s8(v39, v39, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v39.u64[0])));
  a1[5] = v40;
  a1[13] = veorq_s8(v40, vextq_s8(v40, v40, 8uLL));
  v37.i64[0] = veorq_s8(v40, vextq_s8(v40, v40, 8uLL)).u64[0];
  int8x16_t v41 = (int8x16_t)vmull_high_p64((uint64x2_t)v40, (uint64x2_t)v10);
  int8x16_t v42 = (int8x16_t)vmull_p64(v40.u64[0], v10.u64[0]);
  int8x16_t v43 = veorq_s8(v42, veorq_s8(v41, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v37.u64[0])));
  int8x16_t v44 = veorq_s8(vextq_s8(v9, v43, 8uLL), v42);
  int8x16_t v45 = veorq_s8(vextq_s8(v44, v44, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v44.u64[0]));
  int8x16_t v46 = veorq_s8(veorq_s8(vextq_s8(v43, v9, 8uLL), v41), veorq_s8(vextq_s8(v45, v45, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v45.u64[0])));
  a1[6] = v46;
  a1[14] = veorq_s8(v46, vextq_s8(v46, v46, 8uLL));
  v43.i64[0] = veorq_s8(v46, vextq_s8(v46, v46, 8uLL)).u64[0];
  int8x16_t v47 = (int8x16_t)vmull_high_p64((uint64x2_t)v46, (uint64x2_t)v10);
  int8x16_t v48 = (int8x16_t)vmull_p64(v46.u64[0], v10.u64[0]);
  int8x16_t v49 = veorq_s8(v48, veorq_s8(v47, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v43.u64[0])));
  int8x16_t v50 = veorq_s8(vextq_s8(v9, v49, 8uLL), v48);
  int8x16_t v51 = veorq_s8(vextq_s8(v50, v50, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v50.u64[0]));
  int8x16_t result = veorq_s8(veorq_s8(vextq_s8(v49, v9, 8uLL), v47), veorq_s8(vextq_s8(v51, v51, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v51.u64[0])));
  a1[7] = result;
  a1[15] = veorq_s8(result, vextq_s8(result, result, 8uLL));
  return result;
}

int8x16_t gcm_gmult(int8x16_t *a1, uint64x2_t *a2, int8x16_t *a3, double a4, double a5, double a6, double a7, double a8, int8x16_t a9)
{
  int8x16_t v9 = vqtbl1q_s8(*a1, *(int8x16_t *)qword_100182600);
  int8x16_t v10 = veorq_s8(a9, a9);
  unint64_t v11 = veorq_s8(v9, vextq_s8(v9, v9, 8uLL)).u64[0];
  int8x16_t v12 = (int8x16_t)vmull_high_p64((uint64x2_t)v9, *a2);
  int8x16_t v13 = (int8x16_t)vmull_p64(v9.u64[0], a2->i64[0]);
  int8x16_t v14 = veorq_s8(v13, veorq_s8(v12, (int8x16_t)vmull_p64(veorq_s8(*(int8x16_t *)a2, vextq_s8(*(int8x16_t *)a2, *(int8x16_t *)a2, 8uLL)).u64[0], v11)));
  int8x16_t v15 = veorq_s8(vextq_s8(v10, v14, 8uLL), v13);
  int8x16_t v16 = veorq_s8(vextq_s8(v15, v15, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v15.u64[0]));
  int8x16_t result = vqtbl1q_s8(veorq_s8(veorq_s8(vextq_s8(v14, v10, 8uLL), v12), veorq_s8(vextq_s8(v16, v16, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v16.u64[0]))), *(int8x16_t *)qword_100182600);
  *a3 = result;
  return result;
}

int8x16_t gcm_ghash(int8x16_t *a1, uint64x2_t *a2, int8x16_t *a3, uint64_t a4)
{
  int8x16_t v5 = veorq_s8(v4, v4);
  int8x16_t v6 = vqtbl1q_s8(*a1, *(int8x16_t *)qword_100182600);
  BOOL v7 = a4 < 128;
  for (uint64_t i = a4 - 128; !v7; i -= 128)
  {
    int8x16_t v9 = vqtbl1q_s8(a3[7], *(int8x16_t *)qword_100182600);
    int8x16_t v10 = (int8x16_t)vmull_p64(a2->i64[0], v9.u64[0]);
    int8x16_t v11 = (int8x16_t)vmull_high_p64(*a2, (uint64x2_t)v9);
    int8x16_t v12 = (int8x16_t)vmull_p64(a2[8].u64[0], veorq_s8(v9, vextq_s8(v9, v9, 8uLL)).u64[0]);
    int8x16_t v13 = vqtbl1q_s8(a3[6], *(int8x16_t *)qword_100182600);
    uint64x2_t v14 = a2[1];
    int8x16_t v15 = veorq_s8(v10, (int8x16_t)vmull_p64(v14.u64[0], v13.u64[0]));
    int8x16_t v16 = veorq_s8(v11, (int8x16_t)vmull_high_p64(v14, (uint64x2_t)v13));
    int8x16_t v17 = veorq_s8(v12, (int8x16_t)vmull_p64(a2[9].u64[0], veorq_s8(v13, vextq_s8(v13, v13, 8uLL)).u64[0]));
    int8x16_t v18 = vqtbl1q_s8(a3[5], *(int8x16_t *)qword_100182600);
    uint64x2_t v19 = a2[2];
    int8x16_t v20 = veorq_s8(v15, (int8x16_t)vmull_p64(v19.u64[0], v18.u64[0]));
    int8x16_t v21 = veorq_s8(v16, (int8x16_t)vmull_high_p64(v19, (uint64x2_t)v18));
    int8x16_t v22 = veorq_s8(v17, (int8x16_t)vmull_p64(a2[10].u64[0], veorq_s8(v18, vextq_s8(v18, v18, 8uLL)).u64[0]));
    int8x16_t v23 = vqtbl1q_s8(a3[4], *(int8x16_t *)qword_100182600);
    uint64x2_t v24 = a2[3];
    int8x16_t v25 = veorq_s8(v20, (int8x16_t)vmull_p64(v24.u64[0], v23.u64[0]));
    int8x16_t v26 = veorq_s8(v21, (int8x16_t)vmull_high_p64(v24, (uint64x2_t)v23));
    int8x16_t v27 = veorq_s8(v22, (int8x16_t)vmull_p64(a2[11].u64[0], veorq_s8(v23, vextq_s8(v23, v23, 8uLL)).u64[0]));
    int8x16_t v28 = vqtbl1q_s8(a3[3], *(int8x16_t *)qword_100182600);
    uint64x2_t v29 = a2[4];
    int8x16_t v30 = veorq_s8(v25, (int8x16_t)vmull_p64(v29.u64[0], v28.u64[0]));
    int8x16_t v31 = veorq_s8(v26, (int8x16_t)vmull_high_p64(v29, (uint64x2_t)v28));
    int8x16_t v32 = veorq_s8(v27, (int8x16_t)vmull_p64(a2[12].u64[0], veorq_s8(v28, vextq_s8(v28, v28, 8uLL)).u64[0]));
    int8x16_t v33 = vqtbl1q_s8(a3[2], *(int8x16_t *)qword_100182600);
    uint64x2_t v34 = a2[5];
    int8x16_t v35 = veorq_s8(v30, (int8x16_t)vmull_p64(v34.u64[0], v33.u64[0]));
    int8x16_t v36 = veorq_s8(v31, (int8x16_t)vmull_high_p64(v34, (uint64x2_t)v33));
    int8x16_t v37 = veorq_s8(v32, (int8x16_t)vmull_p64(a2[13].u64[0], veorq_s8(v33, vextq_s8(v33, v33, 8uLL)).u64[0]));
    int8x16_t v38 = vqtbl1q_s8(a3[1], *(int8x16_t *)qword_100182600);
    uint64x2_t v39 = a2[6];
    int8x16_t v40 = veorq_s8(v35, (int8x16_t)vmull_p64(v39.u64[0], v38.u64[0]));
    int8x16_t v41 = veorq_s8(v36, (int8x16_t)vmull_high_p64(v39, (uint64x2_t)v38));
    int8x16_t v42 = veorq_s8(v37, (int8x16_t)vmull_p64(a2[14].u64[0], veorq_s8(v38, vextq_s8(v38, v38, 8uLL)).u64[0]));
    uint64x2_t v43 = a2[7];
    int8x16_t v44 = veorq_s8(vqtbl1q_s8(*a3, *(int8x16_t *)qword_100182600), v6);
    int8x16_t v45 = veorq_s8(v40, (int8x16_t)vmull_p64(v43.u64[0], v44.u64[0]));
    int8x16_t v46 = veorq_s8(v41, (int8x16_t)vmull_high_p64(v43, (uint64x2_t)v44));
    int8x16_t v47 = veorq_s8(v46, veorq_s8(v45, veorq_s8(v42, (int8x16_t)vmull_p64(a2[15].u64[0], veorq_s8(v44, vextq_s8(v44, v44, 8uLL)).u64[0]))));
    int8x16_t v48 = veorq_s8(v45, vextq_s8(v5, v47, 8uLL));
    int8x16_t v49 = veorq_s8((int8x16_t)vmull_p64(0xC200000000000000, v48.u64[0]), vextq_s8(v48, v48, 8uLL));
    int8x16_t v6 = veorq_s8(veorq_s8(v46, vextq_s8(v47, v5, 8uLL)), veorq_s8((int8x16_t)vmull_p64(0xC200000000000000, v49.u64[0]), vextq_s8(v49, v49, 8uLL)));
    a3 += 8;
    BOOL v7 = i < 128;
  }
  BOOL v7 = i < -112;
  uint64_t v50 = i + 112;
  if (!v7)
  {
    int8x16_t v52 = *a3;
    int8x16_t v51 = a3 + 1;
    int8x16_t v53 = veorq_s8(v6, vqtbl1q_s8(v52, *(int8x16_t *)qword_100182600));
    char v54 = (uint64x2_t *)((char *)a2 + v50);
    uint64x2_t v55 = *(uint64x2_t *)((char *)a2 + v50);
    int8x16_t v56 = (int8x16_t)vmull_p64(v53.u64[0], v55.u64[0]);
    int8x16_t v57 = (int8x16_t)vmull_high_p64((uint64x2_t)v53, v55);
    int8x16_t v58 = (int8x16_t)vmull_p64(veorq_s8(v53, vextq_s8(v53, v53, 8uLL)).u64[0], *(unint64_t *)((char *)a2[8].u64 + v50));
    BOOL v7 = v50 < 16;
    for (uint64_t j = v50 - 16; !v7; j -= 16)
    {
      --v54;
      int8x16_t v60 = *v51++;
      int8x16_t v61 = vqtbl1q_s8(v60, *(int8x16_t *)qword_100182600);
      int8x16_t v56 = veorq_s8(v56, (int8x16_t)vmull_p64(v61.u64[0], v54->i64[0]));
      int8x16_t v57 = veorq_s8(v57, (int8x16_t)vmull_high_p64((uint64x2_t)v61, *v54));
      int8x16_t v58 = veorq_s8(v58, (int8x16_t)vmull_p64(veorq_s8(v61, vextq_s8(v61, v61, 8uLL)).u64[0], v54[8].u64[0]));
      BOOL v7 = j < 16;
    }
    int8x16_t v62 = veorq_s8(v57, veorq_s8(v56, v58));
    int8x16_t v63 = veorq_s8(v56, vextq_s8(v5, v62, 8uLL));
    int8x16_t v64 = veorq_s8((int8x16_t)vmull_p64(0xC200000000000000, v63.u64[0]), vextq_s8(v63, v63, 8uLL));
    int8x16_t v6 = veorq_s8(veorq_s8(v57, vextq_s8(v62, v5, 8uLL)), veorq_s8((int8x16_t)vmull_p64(0xC200000000000000, v64.u64[0]), vextq_s8(v64, v64, 8uLL)));
  }
  int8x16_t result = vqtbl1q_s8(v6, *(int8x16_t *)qword_100182600);
  *a1 = result;
  return result;
}

int64x2_t *AccelerateCrypto_SHA512_compress_hwassist(int64x2_t *result, uint64_t a2, int8x16_t *a3)
{
  if (a2)
  {
    int64x2_t v3 = *result;
    int64x2_t v4 = result[1];
    int64x2_t v5 = result[2];
    int64x2_t v6 = result[3];
    do
    {
      _Q24 = v3;
      _Q25 = v4;
      _Q0 = vrev64q_s8(*a3);
      _Q1 = vrev64q_s8(a3[1]);
      _Q2 = vrev64q_s8(a3[2]);
      _Q3 = vrev64q_s8(a3[3]);
      _Q4 = vrev64q_s8(a3[4]);
      _Q5 = vrev64q_s8(a3[5]);
      _Q6 = vrev64q_s8(a3[6]);
      _Q7 = vrev64q_s8(a3[7]);
      a3 += 8;
      _Q29 = vextq_s8((int8x16_t)v5, (int8x16_t)v6, 8uLL);
      _Q28 = vextq_s8((int8x16_t)v4, (int8x16_t)v5, 8uLL);
      _Q31 = vextq_s8(_Q4, _Q5, 8uLL);
      __asm
      {
        SHA512H         Q27, Q29, V28.2D
        SHA512SU0       V0.2D, V1.2D
      }
      int64x2_t v26 = _Q27;
      __asm
      {
        SHA512H2        Q27, Q25, V24.2D
        SHA512SU1       V0.2D, V7.2D, V31.2D
      }
      int8x16_t v29 = (int8x16_t)vaddq_s64(v4, v26);
      _Q29 = vextq_s8(v29, (int8x16_t)v5, 8uLL);
      _Q28 = vextq_s8((int8x16_t)v3, v29, 8uLL);
      _Q31 = vextq_s8(_Q5, _Q6, 8uLL);
      __asm
      {
        SHA512H         Q26, Q29, V28.2D
        SHA512SU0       V1.2D, V2.2D
      }
      int64x2_t v35 = _Q26;
      __asm
      {
        SHA512H2        Q26, Q24, V27.2D
        SHA512SU1       V1.2D, V0.2D, V31.2D
      }
      int8x16_t v38 = (int8x16_t)vaddq_s64(v3, v35);
      _Q29 = vextq_s8(v38, v29, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v38, 8uLL);
      _Q31 = vextq_s8(_Q6, _Q7, 8uLL);
      __asm
      {
        SHA512H         Q25, Q29, V28.2D
        SHA512SU0       V2.2D, V3.2D
      }
      int64x2_t v44 = _Q25;
      __asm
      {
        SHA512H2        Q25, Q27, V26.2D
        SHA512SU1       V2.2D, V1.2D, V31.2D
      }
      int8x16_t v47 = (int8x16_t)vaddq_s64(_Q27, v44);
      _Q29 = vextq_s8(v47, v38, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v47, 8uLL);
      _Q31 = vextq_s8(_Q7, _Q0, 8uLL);
      __asm
      {
        SHA512H         Q24, Q29, V28.2D
        SHA512SU0       V3.2D, V4.2D
      }
      int64x2_t v53 = _Q24;
      __asm
      {
        SHA512H2        Q24, Q26, V25.2D
        SHA512SU1       V3.2D, V2.2D, V31.2D
      }
      int8x16_t v56 = (int8x16_t)vaddq_s64(_Q26, v53);
      _Q29 = vextq_s8(v56, v47, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v56, 8uLL);
      _Q31 = vextq_s8(_Q0, _Q1, 8uLL);
      __asm
      {
        SHA512H         Q27, Q29, V28.2D
        SHA512SU0       V4.2D, V5.2D
      }
      int64x2_t v62 = _Q27;
      __asm
      {
        SHA512H2        Q27, Q25, V24.2D
        SHA512SU1       V4.2D, V3.2D, V31.2D
      }
      int8x16_t v65 = (int8x16_t)vaddq_s64(_Q25, v62);
      _Q29 = vextq_s8(v65, v56, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v65, 8uLL);
      _Q31 = vextq_s8(_Q1, _Q2, 8uLL);
      __asm
      {
        SHA512H         Q26, Q29, V28.2D
        SHA512SU0       V5.2D, V6.2D
      }
      int64x2_t v71 = _Q26;
      __asm
      {
        SHA512H2        Q26, Q24, V27.2D
        SHA512SU1       V5.2D, V4.2D, V31.2D
      }
      int8x16_t v74 = (int8x16_t)vaddq_s64(_Q24, v71);
      _Q29 = vextq_s8(v74, v65, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v74, 8uLL);
      _Q31 = vextq_s8(_Q2, _Q3, 8uLL);
      __asm
      {
        SHA512H         Q25, Q29, V28.2D
        SHA512SU0       V6.2D, V7.2D
      }
      int64x2_t v80 = _Q25;
      __asm
      {
        SHA512H2        Q25, Q27, V26.2D
        SHA512SU1       V6.2D, V5.2D, V31.2D
      }
      int8x16_t v83 = (int8x16_t)vaddq_s64(_Q27, v80);
      _Q29 = vextq_s8(v83, v74, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v83, 8uLL);
      _Q31 = vextq_s8(_Q3, _Q4, 8uLL);
      __asm
      {
        SHA512H         Q24, Q29, V28.2D
        SHA512SU0       V7.2D, V0.2D
      }
      int64x2_t v89 = _Q24;
      __asm
      {
        SHA512H2        Q24, Q26, V25.2D
        SHA512SU1       V7.2D, V6.2D, V31.2D
      }
      int8x16_t v92 = (int8x16_t)vaddq_s64(_Q26, v89);
      _Q29 = vextq_s8(v92, v83, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v92, 8uLL);
      _Q31 = vextq_s8(_Q4, _Q5, 8uLL);
      __asm
      {
        SHA512H         Q27, Q29, V28.2D
        SHA512SU0       V0.2D, V1.2D
      }
      int64x2_t v98 = _Q27;
      __asm
      {
        SHA512H2        Q27, Q25, V24.2D
        SHA512SU1       V0.2D, V7.2D, V31.2D
      }
      int8x16_t v101 = (int8x16_t)vaddq_s64(_Q25, v98);
      _Q29 = vextq_s8(v101, v92, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v101, 8uLL);
      _Q31 = vextq_s8(_Q5, _Q6, 8uLL);
      __asm
      {
        SHA512H         Q26, Q29, V28.2D
        SHA512SU0       V1.2D, V2.2D
      }
      int64x2_t v107 = _Q26;
      __asm
      {
        SHA512H2        Q26, Q24, V27.2D
        SHA512SU1       V1.2D, V0.2D, V31.2D
      }
      int8x16_t v110 = (int8x16_t)vaddq_s64(_Q24, v107);
      _Q29 = vextq_s8(v110, v101, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v110, 8uLL);
      _Q31 = vextq_s8(_Q6, _Q7, 8uLL);
      __asm
      {
        SHA512H         Q25, Q29, V28.2D
        SHA512SU0       V2.2D, V3.2D
      }
      int64x2_t v116 = _Q25;
      __asm
      {
        SHA512H2        Q25, Q27, V26.2D
        SHA512SU1       V2.2D, V1.2D, V31.2D
      }
      int8x16_t v119 = (int8x16_t)vaddq_s64(_Q27, v116);
      _Q29 = vextq_s8(v119, v110, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v119, 8uLL);
      _Q31 = vextq_s8(_Q7, _Q0, 8uLL);
      __asm
      {
        SHA512H         Q24, Q29, V28.2D
        SHA512SU0       V3.2D, V4.2D
      }
      int64x2_t v125 = _Q24;
      __asm
      {
        SHA512H2        Q24, Q26, V25.2D
        SHA512SU1       V3.2D, V2.2D, V31.2D
      }
      int8x16_t v128 = (int8x16_t)vaddq_s64(_Q26, v125);
      _Q29 = vextq_s8(v128, v119, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v128, 8uLL);
      _Q31 = vextq_s8(_Q0, _Q1, 8uLL);
      __asm
      {
        SHA512H         Q27, Q29, V28.2D
        SHA512SU0       V4.2D, V5.2D
      }
      int64x2_t v134 = _Q27;
      __asm
      {
        SHA512H2        Q27, Q25, V24.2D
        SHA512SU1       V4.2D, V3.2D, V31.2D
      }
      int8x16_t v137 = (int8x16_t)vaddq_s64(_Q25, v134);
      _Q29 = vextq_s8(v137, v128, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v137, 8uLL);
      _Q31 = vextq_s8(_Q1, _Q2, 8uLL);
      __asm
      {
        SHA512H         Q26, Q29, V28.2D
        SHA512SU0       V5.2D, V6.2D
      }
      int64x2_t v143 = _Q26;
      __asm
      {
        SHA512H2        Q26, Q24, V27.2D
        SHA512SU1       V5.2D, V4.2D, V31.2D
      }
      int8x16_t v146 = (int8x16_t)vaddq_s64(_Q24, v143);
      _Q29 = vextq_s8(v146, v137, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v146, 8uLL);
      _Q31 = vextq_s8(_Q2, _Q3, 8uLL);
      __asm
      {
        SHA512H         Q25, Q29, V28.2D
        SHA512SU0       V6.2D, V7.2D
      }
      int64x2_t v152 = _Q25;
      __asm
      {
        SHA512H2        Q25, Q27, V26.2D
        SHA512SU1       V6.2D, V5.2D, V31.2D
      }
      int8x16_t v155 = (int8x16_t)vaddq_s64(_Q27, v152);
      _Q29 = vextq_s8(v155, v146, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v155, 8uLL);
      _Q31 = vextq_s8(_Q3, _Q4, 8uLL);
      __asm
      {
        SHA512H         Q24, Q29, V28.2D
        SHA512SU0       V7.2D, V0.2D
      }
      int64x2_t v161 = _Q24;
      __asm
      {
        SHA512H2        Q24, Q26, V25.2D
        SHA512SU1       V7.2D, V6.2D, V31.2D
      }
      int8x16_t v164 = (int8x16_t)vaddq_s64(_Q26, v161);
      _Q29 = vextq_s8(v164, v155, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v164, 8uLL);
      _Q31 = vextq_s8(_Q4, _Q5, 8uLL);
      __asm
      {
        SHA512H         Q27, Q29, V28.2D
        SHA512SU0       V0.2D, V1.2D
      }
      int64x2_t v170 = _Q27;
      __asm
      {
        SHA512H2        Q27, Q25, V24.2D
        SHA512SU1       V0.2D, V7.2D, V31.2D
      }
      int8x16_t v173 = (int8x16_t)vaddq_s64(_Q25, v170);
      _Q29 = vextq_s8(v173, v164, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v173, 8uLL);
      _Q31 = vextq_s8(_Q5, _Q6, 8uLL);
      __asm
      {
        SHA512H         Q26, Q29, V28.2D
        SHA512SU0       V1.2D, V2.2D
      }
      int64x2_t v179 = _Q26;
      __asm
      {
        SHA512H2        Q26, Q24, V27.2D
        SHA512SU1       V1.2D, V0.2D, V31.2D
      }
      int8x16_t v182 = (int8x16_t)vaddq_s64(_Q24, v179);
      _Q29 = vextq_s8(v182, v173, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v182, 8uLL);
      _Q31 = vextq_s8(_Q6, _Q7, 8uLL);
      __asm
      {
        SHA512H         Q25, Q29, V28.2D
        SHA512SU0       V2.2D, V3.2D
      }
      int64x2_t v188 = _Q25;
      __asm
      {
        SHA512H2        Q25, Q27, V26.2D
        SHA512SU1       V2.2D, V1.2D, V31.2D
      }
      int8x16_t v191 = (int8x16_t)vaddq_s64(_Q27, v188);
      _Q29 = vextq_s8(v191, v182, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v191, 8uLL);
      _Q31 = vextq_s8(_Q7, _Q0, 8uLL);
      __asm
      {
        SHA512H         Q24, Q29, V28.2D
        SHA512SU0       V3.2D, V4.2D
      }
      int64x2_t v197 = _Q24;
      __asm
      {
        SHA512H2        Q24, Q26, V25.2D
        SHA512SU1       V3.2D, V2.2D, V31.2D
      }
      int8x16_t v200 = (int8x16_t)vaddq_s64(_Q26, v197);
      _Q29 = vextq_s8(v200, v191, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v200, 8uLL);
      _Q31 = vextq_s8(_Q0, _Q1, 8uLL);
      __asm
      {
        SHA512H         Q27, Q29, V28.2D
        SHA512SU0       V4.2D, V5.2D
      }
      int64x2_t v206 = _Q27;
      __asm
      {
        SHA512H2        Q27, Q25, V24.2D
        SHA512SU1       V4.2D, V3.2D, V31.2D
      }
      int8x16_t v209 = (int8x16_t)vaddq_s64(_Q25, v206);
      _Q29 = vextq_s8(v209, v200, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v209, 8uLL);
      _Q31 = vextq_s8(_Q1, _Q2, 8uLL);
      __asm
      {
        SHA512H         Q26, Q29, V28.2D
        SHA512SU0       V5.2D, V6.2D
      }
      int64x2_t v215 = _Q26;
      __asm
      {
        SHA512H2        Q26, Q24, V27.2D
        SHA512SU1       V5.2D, V4.2D, V31.2D
      }
      int8x16_t v218 = (int8x16_t)vaddq_s64(_Q24, v215);
      _Q29 = vextq_s8(v218, v209, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v218, 8uLL);
      _Q31 = vextq_s8(_Q2, _Q3, 8uLL);
      __asm
      {
        SHA512H         Q25, Q29, V28.2D
        SHA512SU0       V6.2D, V7.2D
      }
      int64x2_t v224 = _Q25;
      __asm
      {
        SHA512H2        Q25, Q27, V26.2D
        SHA512SU1       V6.2D, V5.2D, V31.2D
      }
      int8x16_t v227 = (int8x16_t)vaddq_s64(_Q27, v224);
      _Q29 = vextq_s8(v227, v218, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v227, 8uLL);
      _Q31 = vextq_s8(_Q3, _Q4, 8uLL);
      __asm
      {
        SHA512H         Q24, Q29, V28.2D
        SHA512SU0       V7.2D, V0.2D
      }
      int64x2_t v233 = _Q24;
      __asm
      {
        SHA512H2        Q24, Q26, V25.2D
        SHA512SU1       V7.2D, V6.2D, V31.2D
      }
      int8x16_t v236 = (int8x16_t)vaddq_s64(_Q26, v233);
      _Q29 = vextq_s8(v236, v227, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v236, 8uLL);
      _Q31 = vextq_s8(_Q4, _Q5, 8uLL);
      __asm
      {
        SHA512H         Q27, Q29, V28.2D
        SHA512SU0       V0.2D, V1.2D
      }
      int64x2_t v242 = _Q27;
      __asm
      {
        SHA512H2        Q27, Q25, V24.2D
        SHA512SU1       V0.2D, V7.2D, V31.2D
      }
      int8x16_t v245 = (int8x16_t)vaddq_s64(_Q25, v242);
      _Q29 = vextq_s8(v245, v236, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v245, 8uLL);
      _Q31 = vextq_s8(_Q5, _Q6, 8uLL);
      __asm
      {
        SHA512H         Q26, Q29, V28.2D
        SHA512SU0       V1.2D, V2.2D
      }
      int64x2_t v251 = _Q26;
      __asm
      {
        SHA512H2        Q26, Q24, V27.2D
        SHA512SU1       V1.2D, V0.2D, V31.2D
      }
      int8x16_t v254 = (int8x16_t)vaddq_s64(_Q24, v251);
      _Q29 = vextq_s8(v254, v245, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v254, 8uLL);
      _Q31 = vextq_s8(_Q6, _Q7, 8uLL);
      __asm
      {
        SHA512H         Q25, Q29, V28.2D
        SHA512SU0       V2.2D, V3.2D
      }
      int64x2_t v260 = _Q25;
      __asm
      {
        SHA512H2        Q25, Q27, V26.2D
        SHA512SU1       V2.2D, V1.2D, V31.2D
      }
      int8x16_t v263 = (int8x16_t)vaddq_s64(_Q27, v260);
      _Q29 = vextq_s8(v263, v254, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v263, 8uLL);
      _Q31 = vextq_s8(_Q7, _Q0, 8uLL);
      __asm
      {
        SHA512H         Q24, Q29, V28.2D
        SHA512SU0       V3.2D, V4.2D
      }
      int64x2_t v269 = _Q24;
      __asm
      {
        SHA512H2        Q24, Q26, V25.2D
        SHA512SU1       V3.2D, V2.2D, V31.2D
      }
      int8x16_t v272 = (int8x16_t)vaddq_s64(_Q26, v269);
      _Q29 = vextq_s8(v272, v263, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v272, 8uLL);
      _Q31 = vextq_s8(_Q0, _Q1, 8uLL);
      __asm
      {
        SHA512H         Q27, Q29, V28.2D
        SHA512SU0       V4.2D, V5.2D
      }
      int64x2_t v278 = _Q27;
      __asm
      {
        SHA512H2        Q27, Q25, V24.2D
        SHA512SU1       V4.2D, V3.2D, V31.2D
      }
      int8x16_t v281 = (int8x16_t)vaddq_s64(_Q25, v278);
      _Q29 = vextq_s8(v281, v272, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v281, 8uLL);
      _Q31 = vextq_s8(_Q1, _Q2, 8uLL);
      __asm
      {
        SHA512H         Q26, Q29, V28.2D
        SHA512SU0       V5.2D, V6.2D
      }
      int64x2_t v287 = _Q26;
      __asm
      {
        SHA512H2        Q26, Q24, V27.2D
        SHA512SU1       V5.2D, V4.2D, V31.2D
      }
      int8x16_t v290 = (int8x16_t)vaddq_s64(_Q24, v287);
      _Q29 = vextq_s8(v290, v281, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v290, 8uLL);
      _Q31 = vextq_s8(_Q2, _Q3, 8uLL);
      __asm
      {
        SHA512H         Q25, Q29, V28.2D
        SHA512SU0       V6.2D, V7.2D
      }
      int64x2_t v296 = _Q25;
      __asm
      {
        SHA512H2        Q25, Q27, V26.2D
        SHA512SU1       V6.2D, V5.2D, V31.2D
      }
      int8x16_t v299 = (int8x16_t)vaddq_s64(_Q27, v296);
      _Q29 = vextq_s8(v299, v290, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v299, 8uLL);
      _Q31 = vextq_s8(_Q3, _Q4, 8uLL);
      __asm
      {
        SHA512H         Q24, Q29, V28.2D
        SHA512SU0       V7.2D, V0.2D
      }
      int64x2_t v305 = _Q24;
      __asm
      {
        SHA512H2        Q24, Q26, V25.2D
        SHA512SU1       V7.2D, V6.2D, V31.2D
      }
      int8x16_t v308 = (int8x16_t)vaddq_s64(_Q26, v305);
      _Q29 = vextq_s8(v308, v299, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v308, 8uLL);
      __asm
      {
        SHA512H         Q30, Q29, V28.2D
        SHA512H2        Q27, Q25, V24.2D
      }
      int8x16_t v313 = (int8x16_t)vaddq_s64(_Q25, _Q30);
      _Q29 = vextq_s8(v313, v308, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v313, 8uLL);
      __asm
      {
        SHA512H         Q30, Q29, V28.2D
        SHA512H2        Q26, Q24, V27.2D
      }
      int8x16_t v318 = (int8x16_t)vaddq_s64(_Q24, _Q30);
      _Q29 = vextq_s8(v318, v313, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v318, 8uLL);
      __asm
      {
        SHA512H         Q30, Q29, V28.2D
        SHA512H2        Q25, Q27, V26.2D
      }
      int8x16_t v323 = (int8x16_t)vaddq_s64(_Q27, _Q30);
      _Q29 = vextq_s8(v323, v318, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v323, 8uLL);
      __asm
      {
        SHA512H         Q30, Q29, V28.2D
        SHA512H2        Q24, Q26, V25.2D
      }
      int8x16_t v328 = (int8x16_t)vaddq_s64(_Q26, _Q30);
      _Q29 = vextq_s8(v328, v323, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v328, 8uLL);
      __asm
      {
        SHA512H         Q30, Q29, V28.2D
        SHA512H2        Q27, Q25, V24.2D
      }
      int8x16_t v333 = (int8x16_t)vaddq_s64(_Q25, _Q30);
      _Q29 = vextq_s8(v333, v328, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v333, 8uLL);
      __asm
      {
        SHA512H         Q30, Q29, V28.2D
        SHA512H2        Q26, Q24, V27.2D
      }
      int8x16_t v338 = (int8x16_t)vaddq_s64(_Q24, _Q30);
      _Q29 = vextq_s8(v338, v333, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v338, 8uLL);
      __asm
      {
        SHA512H         Q30, Q29, V28.2D
        SHA512H2        Q25, Q27, V26.2D
      }
      int64x2_t v343 = vaddq_s64(_Q27, _Q30);
      _Q29 = vextq_s8((int8x16_t)v343, v338, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, (int8x16_t)v343, 8uLL);
      __asm
      {
        SHA512H         Q30, Q29, V28.2D
        SHA512H2        Q24, Q26, V25.2D
      }
      int64x2_t v3 = vaddq_s64(v3, _Q24);
      int64x2_t v4 = vaddq_s64(v4, _Q25);
      int64x2_t v5 = vaddq_s64(v5, vaddq_s64(_Q26, _Q30));
      int64x2_t v6 = vaddq_s64(v6, v343);
    }
    while (a2-- > 1);
    *int8x16_t result = v3;
    result[1] = v4;
    result[2] = v5;
    result[3] = v6;
  }
  return result;
}

int32x4_t *AccelerateCrypto_SHA1_compress(int32x4_t *result, uint64_t a2, int8x16_t *a3)
{
  if (a2)
  {
    int8x16_t v5 = *a3;
    int8x16_t v6 = a3[1];
    int8x16_t v7 = a3[2];
    int8x16_t v8 = a3[3];
    int64x2_t v4 = a3 + 4;
    int32x4_t v10 = *result;
    int8x16_t v9 = result + 1;
    int32x4_t v11 = v10;
    v10.i32[0] = v9->i32[0];
    int8x16_t v12 = v9 - 1;
    v3.i32[0] = v10.i32[0];
    _Q1 = (int32x4_t)vrev32q_s8(v6);
    _Q2 = (int32x4_t)vrev32q_s8(v7);
    _Q3 = (int32x4_t)vrev32q_s8(v8);
    _Q4 = vaddq_s32((int32x4_t)vrev32q_s8(v5), *(int32x4_t *)K_XMM_AR);
    _Q5 = vaddq_s32(_Q1, *(int32x4_t *)K_XMM_AR);
    _Q19 = v3;
    _Q6 = vaddq_s32(_Q2, *(int32x4_t *)K_XMM_AR);
    _Q7 = vaddq_s32(_Q3, *(int32x4_t *)K_XMM_AR);
    __asm { SHA1SU0         V0.4S, V1.4S, V2.4S }
    _S20 = v11.i32[0];
    __asm
    {
      SHA1C           Q18, S19, V4.4S
      SHA1H           S19, S20
      SHA1SU1         V0.4S, V3.4S
    }
    _Q4 = vaddq_s32(_Q0, *(int32x4_t *)K_XMM_AR);
    __asm { SHA1SU0         V1.4S, V2.4S, V3.4S }
    _S20 = _Q18;
    __asm
    {
      SHA1C           Q18, S19, V5.4S
      SHA1H           S19, S20
      SHA1SU1         V1.4S, V0.4S
    }
    _Q5 = vaddq_s32(_Q1, *(int32x4_t *)&K_XMM_AR[2]);
    __asm { SHA1SU0         V2.4S, V3.4S, V0.4S }
    _S20 = _Q18;
    __asm
    {
      SHA1C           Q18, S19, V6.4S
      SHA1H           S19, S20
      SHA1SU1         V2.4S, V1.4S
    }
    _Q6 = vaddq_s32(_Q2, *(int32x4_t *)&K_XMM_AR[2]);
    __asm { SHA1SU0         V3.4S, V0.4S, V1.4S }
    _S20 = _Q18;
    __asm
    {
      SHA1C           Q18, S19, V7.4S
      SHA1H           S19, S20
      SHA1SU1         V3.4S, V2.4S
    }
    _Q7 = vaddq_s32(_Q3, *(int32x4_t *)&K_XMM_AR[2]);
    __asm { SHA1SU0         V0.4S, V1.4S, V2.4S }
    _S20 = _Q18;
    __asm
    {
      SHA1C           Q18, S19, V4.4S
      SHA1H           S19, S20
      SHA1SU1         V0.4S, V3.4S
    }
    _Q4 = vaddq_s32(_Q0, *(int32x4_t *)&K_XMM_AR[2]);
    __asm { SHA1SU0         V1.4S, V2.4S, V3.4S }
    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V5.4S
      SHA1H           S19, S20
      SHA1SU1         V1.4S, V0.4S
    }
    _Q5 = vaddq_s32(_Q1, *(int32x4_t *)&K_XMM_AR[2]);
    __asm { SHA1SU0         V2.4S, V3.4S, V0.4S }
    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V6.4S
      SHA1H           S19, S20
      SHA1SU1         V2.4S, V1.4S
    }
    _Q6 = vaddq_s32(_Q2, *(int32x4_t *)&K_XMM_AR[4]);
    __asm { SHA1SU0         V3.4S, V0.4S, V1.4S }
    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V7.4S
      SHA1H           S19, S20
      SHA1SU1         V3.4S, V2.4S
    }
    _Q7 = vaddq_s32(_Q3, *(int32x4_t *)&K_XMM_AR[4]);
    __asm { SHA1SU0         V0.4S, V1.4S, V2.4S }
    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V4.4S
      SHA1H           S19, S20
      SHA1SU1         V0.4S, V3.4S
    }
    _Q4 = vaddq_s32(_Q0, *(int32x4_t *)&K_XMM_AR[4]);
    __asm { SHA1SU0         V1.4S, V2.4S, V3.4S }
    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V5.4S
      SHA1H           S19, S20
      SHA1SU1         V1.4S, V0.4S
    }
    _Q5 = vaddq_s32(_Q1, *(int32x4_t *)&K_XMM_AR[4]);
    __asm { SHA1SU0         V2.4S, V3.4S, V0.4S }
    _S20 = _Q18;
    __asm
    {
      SHA1M           Q18, S19, V6.4S
      SHA1H           S19, S20
      SHA1SU1         V2.4S, V1.4S
    }
    _Q6 = vaddq_s32(_Q2, *(int32x4_t *)&K_XMM_AR[4]);
    __asm { SHA1SU0         V3.4S, V0.4S, V1.4S }
    _S20 = _Q18;
    __asm
    {
      SHA1M           Q18, S19, V7.4S
      SHA1H           S19, S20
      SHA1SU1         V3.4S, V2.4S
    }
    _Q7 = vaddq_s32(_Q3, loc_100182ED0);
    __asm { SHA1SU0         V0.4S, V1.4S, V2.4S }
    _S20 = _Q18;
    __asm
    {
      SHA1M           Q18, S19, V4.4S
      SHA1H           S19, S20
      SHA1SU1         V0.4S, V3.4S
    }
    _Q4 = vaddq_s32(_Q0, loc_100182ED0);
    __asm { SHA1SU0         V1.4S, V2.4S, V3.4S }
    _S20 = _Q18;
    __asm
    {
      SHA1M           Q18, S19, V5.4S
      SHA1H           S19, S20
      SHA1SU1         V1.4S, V0.4S
    }
    _Q5 = vaddq_s32(_Q1, loc_100182ED0);
    __asm { SHA1SU0         V2.4S, V3.4S, V0.4S }
    _S20 = _Q18;
    __asm
    {
      SHA1M           Q18, S19, V6.4S
      SHA1H           S19, S20
      SHA1SU1         V2.4S, V1.4S
    }
    _Q6 = vaddq_s32(_Q2, loc_100182ED0);
    __asm { SHA1SU0         V3.4S, V0.4S, V1.4S }
    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V7.4S
      SHA1H           S19, S20
      SHA1SU1         V3.4S, V2.4S
    }
    _Q7 = vaddq_s32(_Q3, loc_100182ED0);
    BOOL v105 = a2 <= 1;
    for (uint64_t i = a2 - 1; !v105; --i)
    {
      int8x16_t v107 = *v4;
      int8x16_t v108 = v4[1];
      int8x16_t v109 = v4[2];
      int8x16_t v110 = v4[3];
      v4 += 4;
      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V4.4S
        SHA1H           S19, S20
      }
      _Q4 = vaddq_s32((int32x4_t)vrev32q_s8(v107), *(int32x4_t *)K_XMM_AR);
      _Q1 = (int32x4_t)vrev32q_s8(v108);
      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V5.4S
        SHA1H           S19, S20
      }
      _Q5 = vaddq_s32(_Q1, *(int32x4_t *)K_XMM_AR);
      _Q2 = (int32x4_t)vrev32q_s8(v109);
      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V6.4S
        SHA1H           S19, S20
      }
      _Q6 = vaddq_s32(_Q2, *(int32x4_t *)K_XMM_AR);
      _Q3 = (int32x4_t)vrev32q_s8(v110);
      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V7.4S
        SHA1H           S19, S20
      }
      _Q7 = vaddq_s32(_Q3, *(int32x4_t *)K_XMM_AR);
      _Q19 = vaddq_s32(v3, _Q19);
      int32x4_t v11 = vaddq_s32(v11, _Q18);
      int32x4_t v3 = _Q19;
      __asm { SHA1SU0         V0.4S, V1.4S, V2.4S }
      _S20 = v11.i32[0];
      __asm
      {
        SHA1C           Q18, S19, V4.4S
        SHA1H           S19, S20
        SHA1SU1         V0.4S, V3.4S
      }
      _Q4 = vaddq_s32(_Q0, *(int32x4_t *)K_XMM_AR);
      __asm { SHA1SU0         V1.4S, V2.4S, V3.4S }
      _S20 = _Q18;
      __asm
      {
        SHA1C           Q18, S19, V5.4S
        SHA1H           S19, S20
        SHA1SU1         V1.4S, V0.4S
      }
      _Q5 = vaddq_s32(_Q1, *(int32x4_t *)&K_XMM_AR[2]);
      __asm { SHA1SU0         V2.4S, V3.4S, V0.4S }
      _S20 = _Q18;
      __asm
      {
        SHA1C           Q18, S19, V6.4S
        SHA1H           S19, S20
        SHA1SU1         V2.4S, V1.4S
      }
      _Q6 = vaddq_s32(_Q2, *(int32x4_t *)&K_XMM_AR[2]);
      __asm { SHA1SU0         V3.4S, V0.4S, V1.4S }
      _S20 = _Q18;
      __asm
      {
        SHA1C           Q18, S19, V7.4S
        SHA1H           S19, S20
        SHA1SU1         V3.4S, V2.4S
      }
      _Q7 = vaddq_s32(_Q3, *(int32x4_t *)&K_XMM_AR[2]);
      __asm { SHA1SU0         V0.4S, V1.4S, V2.4S }
      _S20 = _Q18;
      __asm
      {
        SHA1C           Q18, S19, V4.4S
        SHA1H           S19, S20
        SHA1SU1         V0.4S, V3.4S
      }
      _Q4 = vaddq_s32(_Q0, *(int32x4_t *)&K_XMM_AR[2]);
      __asm { SHA1SU0         V1.4S, V2.4S, V3.4S }
      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V5.4S
        SHA1H           S19, S20
        SHA1SU1         V1.4S, V0.4S
      }
      _Q5 = vaddq_s32(_Q1, *(int32x4_t *)&K_XMM_AR[2]);
      __asm { SHA1SU0         V2.4S, V3.4S, V0.4S }
      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V6.4S
        SHA1H           S19, S20
        SHA1SU1         V2.4S, V1.4S
      }
      _Q6 = vaddq_s32(_Q2, *(int32x4_t *)&K_XMM_AR[4]);
      __asm { SHA1SU0         V3.4S, V0.4S, V1.4S }
      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V7.4S
        SHA1H           S19, S20
        SHA1SU1         V3.4S, V2.4S
      }
      _Q7 = vaddq_s32(_Q3, *(int32x4_t *)&K_XMM_AR[4]);
      __asm { SHA1SU0         V0.4S, V1.4S, V2.4S }
      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V4.4S
        SHA1H           S19, S20
        SHA1SU1         V0.4S, V3.4S
      }
      _Q4 = vaddq_s32(_Q0, *(int32x4_t *)&K_XMM_AR[4]);
      __asm { SHA1SU0         V1.4S, V2.4S, V3.4S }
      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V5.4S
        SHA1H           S19, S20
        SHA1SU1         V1.4S, V0.4S
      }
      _Q5 = vaddq_s32(_Q1, *(int32x4_t *)&K_XMM_AR[4]);
      __asm { SHA1SU0         V2.4S, V3.4S, V0.4S }
      _S20 = _Q18;
      __asm
      {
        SHA1M           Q18, S19, V6.4S
        SHA1H           S19, S20
        SHA1SU1         V2.4S, V1.4S
      }
      _Q6 = vaddq_s32(_Q2, *(int32x4_t *)&K_XMM_AR[4]);
      __asm { SHA1SU0         V3.4S, V0.4S, V1.4S }
      _S20 = _Q18;
      __asm
      {
        SHA1M           Q18, S19, V7.4S
        SHA1H           S19, S20
        SHA1SU1         V3.4S, V2.4S
      }
      _Q7 = vaddq_s32(_Q3, loc_100182ED0);
      __asm { SHA1SU0         V0.4S, V1.4S, V2.4S }
      _S20 = _Q18;
      __asm
      {
        SHA1M           Q18, S19, V4.4S
        SHA1H           S19, S20
        SHA1SU1         V0.4S, V3.4S
      }
      _Q4 = vaddq_s32(_Q0, loc_100182ED0);
      __asm { SHA1SU0         V1.4S, V2.4S, V3.4S }
      _S20 = _Q18;
      __asm
      {
        SHA1M           Q18, S19, V5.4S
        SHA1H           S19, S20
        SHA1SU1         V1.4S, V0.4S
      }
      _Q5 = vaddq_s32(_Q1, loc_100182ED0);
      __asm { SHA1SU0         V2.4S, V3.4S, V0.4S }
      _S20 = _Q18;
      __asm
      {
        SHA1M           Q18, S19, V6.4S
        SHA1H           S19, S20
        SHA1SU1         V2.4S, V1.4S
      }
      _Q6 = vaddq_s32(_Q2, loc_100182ED0);
      __asm { SHA1SU0         V3.4S, V0.4S, V1.4S }
      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V7.4S
        SHA1H           S19, S20
        SHA1SU1         V3.4S, V2.4S
      }
      _Q7 = vaddq_s32(_Q3, loc_100182ED0);
      BOOL v105 = i <= 1;
    }
    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V4.4S
      SHA1H           S19, S20
    }
    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V5.4S
      SHA1H           S19, S20
    }
    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V6.4S
      SHA1H           S19, S20
    }
    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V7.4S
      SHA1H           S19, S20
    }
    *int8x16_t v12 = vaddq_s32(v11, _Q18);
    int8x16_t result = v12 + 1;
    result->i32[0] = vaddq_s32(v3, _Q19).u32[0];
  }
  return result;
}

void *ccec_cp_256_asm()
{
  return &ccec_cp256_asm;
}

_OWORD *ccn_p256_mul_asm_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4, unint64_t *a5)
{
  return ccn_mulmod_p256(a3, a4, a5);
}

_OWORD *ccn_p256_sqr_asm_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  return ccn_mulmod_p256(a3, a4, a4);
}

uint64_t ccn_p256_inv_asm_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  int v8 = 4;
  int8x16_t v9 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4);
  int32x4_t v10 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4);
  int32x4_t v11 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4);
  ccn_mulmod_p256(v11, a4, a4);
  ccn_mulmod_p256(v10, v11, a4);
  ccn_mulmod_p256(v10, v10, v10);
  ccn_mulmod_p256(v10, v10, v10);
  ccn_mulmod_p256(v9, v10, a4);
  ccn_mulmod_p256(v10, v9, v11);
  do
  {
    ccn_mulmod_p256(v10, v10, v10);
    --v8;
  }
  while (v8);
  ccn_mulmod_p256(v9, v9, v10);
  ccn_mulmod_p256(v10, v9, v11);
  int v12 = 8;
  do
  {
    ccn_mulmod_p256(v10, v10, v10);
    --v12;
  }
  while (v12);
  ccn_mulmod_p256(v9, v9, v10);
  ccn_mulmod_p256(v10, v9, v11);
  int v13 = 16;
  do
  {
    ccn_mulmod_p256(v10, v10, v10);
    --v13;
  }
  while (v13);
  ccn_mulmod_p256(v9, v9, v10);
  ccn_mulmod_p256(v10, v9, v11);
  ccn_set(4, v11, v10);
  int v14 = 32;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v14;
  }
  while (v14);
  ccn_mulmod_p256(v11, v11, a4);
  int v15 = 128;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v15;
  }
  while (v15);
  ccn_mulmod_p256(v11, v11, v10);
  int v16 = 32;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v16;
  }
  while (v16);
  ccn_mulmod_p256(v11, v11, v10);
  int v17 = 32;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v17;
  }
  while (v17);
  ccn_mulmod_p256(v10, v11, v9);
  ccn_mulmod_p256(v9, v10, a4);
  v19[0] = xmmword_1001B9B78;
  v19[1] = unk_1001B9B88;
  ccn_mulmod_p256(v9, v9, (unint64_t *)v19);
  if (ccn_n(4, v9) == 1 && *v9 == 1)
  {
    ccn_set(4, a3, v10);
    uint64_t result = 0;
  }
  else
  {
    uint64_t result = 4294967254;
  }
  *(void *)(a1 + 16) = v7;
  return result;
}

_OWORD *ccn_p256_from_asm_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  v5[0] = xmmword_1001B9B78;
  v5[1] = unk_1001B9B88;
  return ccn_mulmod_p256(a3, a4, (unint64_t *)v5);
}

uint64_t cczp_mm_redc_ws(uint64_t a1, void *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v8 = cczp_n((uint64_t)a2);
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = a2[*a2 + 3];
    int32x4_t v11 = a4;
    uint64_t v12 = v8;
    do
    {
      uint64_t v13 = cczp_prime((uint64_t)a2);
      *int32x4_t v11 = ccn_addmul1(v9, v11, v13, *v11 * v10);
      ++v11;
      --v12;
    }
    while (v12);
  }
  BOOL v14 = ccn_add_ws(a1, v9, &a4[v9], &a4[v9], a4);
  int v15 = (unint64_t *)cczp_prime((uint64_t)a2);
  char v16 = ccn_sub_ws(a1, v9, a4, &a4[v9], v15) ^ v14;

  return ccn_mux(v9, v16, a3, &a4[v9], a4);
}

uint64_t inc_uint(uint64_t result, unint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = (unsigned char *)(a2 + result - 1);
    unint64_t v3 = 2;
    do
    {
      if (++*v2--) {
        BOOL v5 = 1;
      }
      else {
        BOOL v5 = v3 > a2;
      }
      ++v3;
    }
    while (!v5);
  }
  return result;
}

uint64_t ccn_cond_clear(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t result = ccn_mux_next_mask();
  for (uint64_t i = __ROR8__(0x5555555555555555, a2 | (2 * result)); a1; --a1)
  {
    uint64_t v8 = *a3;
    uint64_t v9 = *a3 ^ result;
    *a3 = v9;
    *a3++ = v9 ^ v8 & 0x5555555555555555 ^ v8 & i ^ result;
  }
  return result;
}

uint64_t ccn_shift_right_asm(uint64_t result, int8x16_t *a2, int8x16_t *a3, uint64_t a4)
{
  if (result)
  {
    unint64_t v4 = a3->i64[0];
    char v5 = 64 - a4;
    uint64x2_t v6 = (uint64x2_t)vdupq_n_s64(64 - a4);
    uint64x2_t v7 = (uint64x2_t)vdupq_n_s64(-a4);
    BOOL v8 = result == 4;
    BOOL v9 = result < 4;
    result -= 4;
    if (!v9)
    {
      if (v8)
      {
        int8x16_t v13 = a3[1];
        *a2 = veorq_s8((int8x16_t)vshlq_u64(*(uint64x2_t *)a3, v7), (int8x16_t)vshlq_u64((uint64x2_t)vextq_s8(*a3, v13, 8uLL), v6));
        a2[1] = veorq_s8((int8x16_t)vshlq_u64((uint64x2_t)v13, v7), (int8x16_t)vshlq_u64((uint64x2_t)vextq_s8(v13, v13, 8uLL).u64[0], v6));
        return result;
      }
      do
      {
        int8x16_t v10 = *a3;
        int8x16_t v11 = a3[1];
        a3 += 2;
        unint64_t v4 = a3->i64[0];
        v12.i64[0] = vextq_s8(v11, v11, 8uLL).u64[0];
        v12.i64[1] = a3->i64[0];
        *a2 = veorq_s8((int8x16_t)vshlq_u64((uint64x2_t)v10, v7), (int8x16_t)vshlq_u64((uint64x2_t)vextq_s8(v10, v11, 8uLL), v6));
        a2[1] = veorq_s8((int8x16_t)vshlq_u64((uint64x2_t)v11, v7), (int8x16_t)vshlq_u64(v12, v6));
        a2 += 2;
        BOOL v9 = result <= 4;
        result -= 4;
      }
      while (!v9);
    }
    uint64_t v14 = result + 4;
    int v15 = &a3->u64[1];
    BOOL v16 = v14 == 2;
    BOOL v9 = v14 < 2;
    uint64_t result = v14 - 2;
    if (!v9)
    {
      if (v16)
      {
        uint64_t v19 = *v15 >> a4;
        a2->i64[0] = (v4 >> a4) | (*v15 << v5) & (((unint64_t)(64 - a4) >> 6) - 1);
        a2->i64[1] = v19;
        return result;
      }
      do
      {
        unint64_t v17 = *v15;
        unint64_t v18 = v15[1];
        v15 += 2;
        a2->i64[0] = (v4 >> a4) | (v17 << v5) & (((unint64_t)(64 - a4) >> 6) - 1);
        a2->i64[1] = (v17 >> a4) | (v18 << v5) & (((unint64_t)(64 - a4) >> 6) - 1);
        ++a2;
        unint64_t v4 = v18;
        BOOL v9 = result <= 2;
        result -= 2;
      }
      while (!v9);
    }
    a2->i64[0] = v4 >> a4;
  }
  return result;
}

uint64_t ccaes_vng_ccm_encrypt(_DWORD *a1, int8x16_t *a2, unint64_t a3, int8x16_t *a4, int8x16_t *a5)
{
  __int32 v10 = a2[4].i32[0];
  if (v10 == 5) {
    goto LABEL_6;
  }
  if (v10 == 4)
  {
    if (a2[4].i32[2])
    {
      (*(void (**)(_DWORD *, uint64_t, int8x16_t *, int8x16_t *))(*(void *)a1 + 24))(a1 + 2, 1, a2 + 1, a2 + 1);
      a2[4].i32[2] = 0;
    }
    a2[4].i32[0] = 5;
LABEL_6:
    unint64_t v11 = a2[4].u32[1];
    if (v11)
    {
      unint64_t v12 = v11 >= a3 ? a3 : a2[4].u32[1];
      ccmode_ccm_macdata((uint64_t)a1, (uint64_t)a2, 0, v12, (uint64_t)a4);
      ccmode_ccm_crypt((uint64_t)a1, (uint64_t)a2, v12, (uint64_t)a4, (uint64_t)a5);
      a4 = (int8x16_t *)((char *)a4 + v12);
      a5 = (int8x16_t *)((char *)a5 + v12);
      a3 -= v12;
      if (a2[4].i32[1]) {
        goto LABEL_24;
      }
    }
    if (a3 < 0x10) {
      goto LABEL_24;
    }
    int8x16_t v13 = (int8x16_t *)(a1 + 2);
    unint64_t v14 = a3 >> 4;
    int v15 = a1[62];
    if (v15 > 159)
    {
      if (v15 == 224)
      {
LABEL_21:
        ccm256_encrypt(a4, a5, a2 + 1, v14, v13, a2, *(void *)(*(void *)a1 + 8) + ~a2[5].i32[0]);
        goto LABEL_23;
      }
      if (v15 == 192)
      {
LABEL_22:
        ccm192_encrypt(a4, a5, a2 + 1, v14, v13, a2, *(void *)(*(void *)a1 + 8) + ~a2[5].i32[0]);
        goto LABEL_23;
      }
      if (v15 != 160)
      {
LABEL_23:
        unint64_t v16 = a3 & 0xFFFFFFFFFFFFFFF0;
        a3 &= 0xFu;
        a4 = (int8x16_t *)((char *)a4 + v16);
        a5 = (int8x16_t *)((char *)a5 + v16);
LABEL_24:
        ccmode_ccm_macdata((uint64_t)a1, (uint64_t)a2, 0, a3, (uint64_t)a4);
        ccmode_ccm_crypt((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5);
        return 0;
      }
    }
    else if (v15 != 10)
    {
      if (v15 != 12)
      {
        if (v15 != 14) {
          goto LABEL_23;
        }
        goto LABEL_21;
      }
      goto LABEL_22;
    }
    ccm128_encrypt(a4, a5, a2 + 1, v14, v13, a2, *(void *)(*(void *)a1 + 8) + ~a2[5].i32[0]);
    goto LABEL_23;
  }
  return 4294967228;
}

uint64_t ccn_set_bit(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = 1 << a2;
  uint64_t v4 = (a2 >> 3) & 0x1FFFFFFFFFFFFFF8;
  if (a3) {
    uint64_t v5 = *(void *)(result + v4) | v3;
  }
  else {
    uint64_t v5 = *(void *)(result + v4) & ~v3;
  }
  *(void *)(result + v4) = v5;
  return result;
}

uint64_t ccn_zero(uint64_t a1, void *a2)
{
  return cc_clear(8 * a1, a2);
}

uint64_t ccn_seti(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = a3;
  return cc_clear(8 * a1 - 8, a2 + 1);
}

unint64_t ccn_cond_rsub(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, uint64_t *a5)
{
  uint64_t mask = ccn_mux_next_mask();
  uint64_t v11 = __ROR8__(0x5555555555555555, a2 | (2 * mask));
  if (a1)
  {
    uint64_t v12 = 0;
    do
    {
      unint64_t v14 = *a4++;
      unint64_t v13 = v14;
      uint64_t v15 = *a5++;
      unsigned long long v16 = __PAIR128__(v12, v12) - v13;
      uint64_t v17 = v16 + v15;
      if (__CFADD__((void)v16, v15)) {
        uint64_t v18 = *((void *)&v16 + 1) + 1;
      }
      else {
        uint64_t v18 = (__PAIR128__(v12, v12) - v13) >> 64;
      }
      uint64_t v12 = v18 >> 63;
      uint64_t v19 = v13 ^ v17;
      uint64_t v20 = v13 ^ mask;
      *a3 = v20;
      *a3++ = v19 & v11 ^ v19 & 0x5555555555555555 ^ v20 ^ mask;
      --a1;
    }
    while (a1);
    unint64_t v21 = (unint64_t)v18 >> 63;
  }
  else
  {
    unint64_t v21 = 0;
  }
  return v21 & a2;
}

BOOL timingsafe_enable_if_supported()
{
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    BOOL v0 = _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) != 0;
    __asm { MSR             DIT, #1 }
  }
  else
  {
    BOOL v0 = 0;
  }
  if ((MEMORY[0xFFFFFC010] & 0x200000000000) != 0)
  {
    sb();
  }
  else
  {
    __dsb(0xFu);
    __isb(0xFu);
  }
  return v0;
}

uint64_t timingsafe_restore_if_supported(uint64_t result)
{
  if ((result & 1) == 0 && (MEMORY[0xFFFFFC010] & 0x200000000000000) != 0) {
    __asm { MSR             DIT, #0 }
  }
  return result;
}

void sb()
{
  __asm { SB }
}

uint64_t ccnistkdf_ctr_cmac_fixed_internal(void *a1, unsigned int a2, unint64_t a3, uint64_t a4, unint64_t a5, char *a6, rsize_t a7, char *a8)
{
  if (!a7) {
    return 4294967289;
  }
  rsize_t v11 = a1[1];
  memset(__src, 0, sizeof(__src));
  rsize_t v12 = a7 / v11;
  if (a7 % v11) {
    rsize_t v13 = v12 + 1;
  }
  else {
    rsize_t v13 = a7 / v11;
  }
  HIDWORD(v14) = a2;
  LODWORD(v14) = (a2 << 24) - 0x8000000;
  uint64_t result = 4294967289;
  if ((v14 >> 27) <= 3u && !(v13 >> a2))
  {
    if (a3)
    {
      if (a4)
      {
        unsigned long long v16 = a8;
        if (a8)
        {
          rsize_t v26 = v13;
          unint64_t v27 = a3;
          rsize_t v29 = a7 % v11;
          int8x16_t v30 = &v26;
          size_t v19 = 80 * ((v11 + *a1 + 159) / 0x50);
          uint64_t v20 = (char *)&v26 - v19;
          uint64_t v28 = a4;
          bzero((char *)&v26 - v19, v19);
          int8x16_t v31 = a1;
          size_t v21 = 80 * ((a1[1] + *a1 + 159) / 0x50uLL);
          int8x16_t v22 = (char *)&v26 - v21;
          bzero((char *)&v26 - v21, v21);
          cccmac_init_internal(v31, (uint64_t)&v26 - v19, v27, v28);
          if (v11 <= a7)
          {
            LODWORD(v23) = 1;
            do
            {
              memcpy(v22, v20, v19);
              PRF_EVAL(v22, a2, v23, a5, a6, v16);
              rsize_t v23 = (v23 + 1);
              v16 += v11;
            }
            while (v12 >= v23);
          }
          size_t v24 = v29;
          if (v29)
          {
            memcpy(v22, v20, v19);
            PRF_EVAL(v22, a2, v26, a5, a6, __src);
            memcpy(v16, __src, v24);
          }
          cc_clear(v11, __src);
          int8x16_t v25 = v31;
          cc_clear(v25[1] + *v25 + 80, v20);
          cc_clear(v25[1] + *v25 + 80, v22);
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t ccnistkdf_ctr_cmac_internal(void *a1, unsigned int a2, unint64_t a3, uint64_t a4, size_t a5, const void *a6, size_t a7, const void *a8, rsize_t a9, size_t a10, char *a11)
{
  size_t v18 = a5 + a7 + a10;
  v27[0] = cc_malloc_clear((v18 + 8) & 0xFFFFFFFFFFFFFFF8);
  v27[1] = (v18 + 8) >> 3;
  v27[2] = 0;
  void v27[3] = cc_ws_alloc;
  uint64_t v28 = cc_ws_free;
  if (!v27[0]) {
    return 4294967283;
  }
  unint64_t v25 = a3;
  size_t v19 = (char *)cc_ws_alloc(v27, (v18 + 8) >> 3);
  uint64_t v20 = 4294967289;
  if (a10 <= 4 && !((8 * a9) >> (8 * a10)))
  {
    size_t v21 = v19;
    unint64_t v22 = v18 + 1;
    if (a5 && a6) {
      memcpy(v19, a6, a5);
    }
    rsize_t v23 = &v21[a5];
    v21[a5] = 0;
    if (a7 && a8) {
      memcpy(v23 + 1, a8, a7);
    }
    unsigned int __src = bswap32(8 * a9) >> (-8 * a10);
    memcpy(&v23[a7 + 1], &__src, a10);
    uint64_t v20 = ccnistkdf_ctr_cmac_fixed_internal(a1, a2, v25, a4, v22, v21, a9, a11);
  }
  v28((uint64_t)v27);
  return v20;
}

uint64_t PRF_EVAL(char *a1, unsigned int a2, int a3, unint64_t a4, char *a5, void *a6)
{
  unint64_t __src = HIBYTE(a3);
  BYTE1(__src) = BYTE2(a3);
  BYTE2(__src) = BYTE1(a3);
  BYTE3(__src) = a3;
  __src >>= 8 * (4 - (a2 >> 3));
  cccmac_update_internal(a1, a2 >> 3, (char *)&__src);
  cccmac_update_internal(a1, a4, a5);
  return cccmac_final_generate_internal(a1, *(void *)(*((void *)a1 + 8) + 8), a6);
}

uint64_t AccelerateCrypto_ecb_AES_encrypt(long long *a1, int a2, uint64_t a3, int8x16_t *a4)
{
  uint64_t v4 = *((unsigned int *)a1 + 60);
  _VF = __OFSUB__(a2, 4);
  int v6 = a2 - 4;
  for (int8x16_t i = *(int8x16_t *)((char *)a1 + v4); v6 < 0 == _VF; v6 -= 4)
  {
    _Q4 = *a1;
    uint64_t v9 = 16;
    a3 += 64;
    do
    {
      __asm
      {
        AESE            V0.16B, V4.16B
        AESMC           V0.16B, V0.16B
        AESE            V1.16B, V4.16B
        AESMC           V1.16B, V1.16B
        AESE            V2.16B, V4.16B
        AESMC           V2.16B, V2.16B
        AESE            V3.16B, V4.16B
        AESMC           V3.16B, V3.16B
      }
      _Q4 = a1[(unint64_t)v9 / 0x10];
      v9 += 16;
    }
    while (v9 < v4);
    __asm
    {
      AESE            V0.16B, V4.16B
      AESE            V1.16B, V4.16B
      AESE            V2.16B, V4.16B
      AESE            V3.16B, V4.16B
    }
    *a4 = veorq_s8(_Q0, i);
    a4[1] = veorq_s8(_Q1, i);
    a4[2] = veorq_s8(_Q2, i);
    a4[3] = veorq_s8(_Q3, i);
    a4 += 4;
    _VF = __OFSUB__(v6, 4);
  }
  int v25 = v6 & 3;
  if (v25)
  {
    do
    {
      _Q4 = *a1;
      uint64_t v27 = 16;
      a3 += 16;
      do
      {
        __asm
        {
          AESE            V0.16B, V4.16B
          AESMC           V0.16B, V0.16B
        }
        _Q4 = a1[(unint64_t)v27 / 0x10];
        v27 += 16;
      }
      while (v27 < v4);
      __asm { AESE            V0.16B, V4.16B }
      *a4++ = veorq_s8(_Q0, i);
      _VF = __OFSUB__(v25--, 1);
    }
    while (!((v25 < 0) ^ _VF | (v25 == 0)));
  }
  return 0;
}

uint64_t ccaes_vng_ccm_decrypt(_DWORD *a1, int8x16_t *a2, unint64_t a3, int8x16_t *a4, int8x16_t *a5)
{
  __int32 v10 = a2[4].i32[0];
  if (v10 == 5) {
    goto LABEL_6;
  }
  if (v10 == 4)
  {
    if (a2[4].i32[2])
    {
      (*(void (**)(_DWORD *, uint64_t, int8x16_t *, int8x16_t *))(*(void *)a1 + 24))(a1 + 2, 1, a2 + 1, a2 + 1);
      a2[4].i32[2] = 0;
    }
    a2[4].i32[0] = 5;
LABEL_6:
    unint64_t v11 = a2[4].u32[1];
    if (v11)
    {
      unint64_t v12 = v11 >= a3 ? a3 : a2[4].u32[1];
      ccmode_ccm_crypt((uint64_t)a1, (uint64_t)a2, v12, (uint64_t)a4, (uint64_t)a5);
      ccmode_ccm_macdata((uint64_t)a1, (uint64_t)a2, 0, v12, (uint64_t)a5);
      a4 = (int8x16_t *)((char *)a4 + v12);
      a5 = (int8x16_t *)((char *)a5 + v12);
      a3 -= v12;
      if (a2[4].i32[1]) {
        goto LABEL_24;
      }
    }
    if (a3 < 0x10) {
      goto LABEL_24;
    }
    rsize_t v13 = (int8x16_t *)(a1 + 2);
    unint64_t v14 = a3 >> 4;
    int v15 = a1[62];
    if (v15 > 159)
    {
      if (v15 == 224)
      {
LABEL_21:
        ccm256_decrypt(a4, a5, a2 + 1, v14, v13, a2, *(void *)(*(void *)a1 + 8) + ~a2[5].i32[0]);
        goto LABEL_23;
      }
      if (v15 == 192)
      {
LABEL_22:
        ccm192_decrypt(a4, a5, a2 + 1, v14, v13, a2, *(void *)(*(void *)a1 + 8) + ~a2[5].i32[0]);
        goto LABEL_23;
      }
      if (v15 != 160)
      {
LABEL_23:
        unint64_t v16 = a3 & 0xFFFFFFFFFFFFFFF0;
        a3 &= 0xFu;
        a4 = (int8x16_t *)((char *)a4 + v16);
        a5 = (int8x16_t *)((char *)a5 + v16);
LABEL_24:
        ccmode_ccm_crypt((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5);
        ccmode_ccm_macdata((uint64_t)a1, (uint64_t)a2, 0, a3, (uint64_t)a5);
        return 0;
      }
    }
    else if (v15 != 10)
    {
      if (v15 != 12)
      {
        if (v15 != 14) {
          goto LABEL_23;
        }
        goto LABEL_21;
      }
      goto LABEL_22;
    }
    ccm128_decrypt(a4, a5, a2 + 1, v14, v13, a2, *(void *)(*(void *)a1 + 8) + ~a2[5].i32[0]);
    goto LABEL_23;
  }
  return 4294967228;
}

unint64_t ccec_export_affine_point_size(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 1:
    case 2:
      unint64_t result = ((unint64_t)(cczp_bitlen(a1) + 7) >> 2) | 1;
      break;
    case 3:
      unint64_t result = ccec_compressed_x962_export_pub_size(a1);
      break;
    case 4:
      unint64_t result = (unint64_t)(cczp_bitlen(a1) + 7) >> 3;
      break;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

uint64_t ccec_export_affine_point_public_value(unint64_t *a1, int a2, unint64_t *a3, unint64_t *a4, char *a5)
{
  unint64_t v10 = ccec_export_affine_point_size((uint64_t)a1, a2);
  if (!v10) {
    return 4294967289;
  }
  if (*a4 < v10) {
    return 4294967133;
  }
  *a4 = v10;
  unsigned int v11 = a2 - 1;
  if ((a2 - 1) <= 2) {
    *a5 = 0x20604u >> (8 * v11);
  }
  unint64_t v12 = *a1;
  if (a2 == 4) {
    rsize_t v13 = a5;
  }
  else {
    rsize_t v13 = a5 + 1;
  }
  uint64_t v14 = cczp_bitlen((uint64_t)a1);
  if ((ccn_write_uint_padded_ct_internal(v12, a3, (unint64_t)(v14 + 7) >> 3, v13) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (v11 <= 1)
  {
    int v15 = &v13[(unint64_t)(cczp_bitlen((uint64_t)a1) + 7) >> 3];
    unint64_t v16 = &a3[*a1];
    uint64_t v17 = cczp_bitlen((uint64_t)a1);
    if ((ccn_write_uint_padded_ct_internal(v12, v16, (unint64_t)(v17 + 7) >> 3, v15) & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
  }
  uint64_t result = 0;
  if ((a2 & 0xFFFFFFFE) == 2) {
    *a5 |= a3[*a1] & 1;
  }
  return result;
}

unint64_t ccn_trailing_zeros(unint64_t result, uint64_t a2)
{
  if (result)
  {
    unint64_t v2 = result;
    uint64_t result = 0;
    unint64_t v3 = v2 - 1;
    uint64_t v4 = (v2 << 6) - 64;
    do
    {
      unint64_t v5 = *(void *)(a2 + 8 * v3);
      uint64_t result = ((((v5 | HIDWORD(v5)) + 0xFFFFFFFF) >> 32) - 1) & result | (__clz(__rbit64(v5 | 0x8000000000000000))
                                                                                       + v4) & -(uint64_t)(((v5 | HIDWORD(v5)) + 0xFFFFFFFF) >> 32);
      --v3;
      v4 -= 64;
    }
    while (v3 < v2);
  }
  return result;
}

uint64_t ccec_verify_internal_with_base_ws(uint64_t a1, unint64_t **a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = (uint64_t *)*a2;
  uint64_t v16 = (uint64_t)(*a2 + 4);
  unint64_t v15 = **a2;
  if (a3 <= 0xF)
  {
    uint64x2_t v34 = cc_log_default();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      ccec_sign_internal_ws_cold_1(a3, v34);
    }
  }
  if (!ccec_validate_scalar(v14, a5) && !ccec_validate_scalar(v14, a6))
  {
    int8x16_t v38 = (unint64_t *)a5;
    uint64_t v41 = *(void *)(a1 + 16);
    size_t v19 = (int8x16_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v15);
    uint64x2_t v39 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v15);
    uint64_t v44 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v15);
    uint64_t v43 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v15);
    int8x16_t v40 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 3 * v15);
    int8x16_t v42 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 3 * v15);
    size_t v20 = ccec_signature_r_s_size((uint64_t *)a2);
    int8x16_t v36 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v15);
    memset(v36, 170, v20);
    long long __s = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v15);
    unint64_t v37 = v20;
    memset(__s, 255, v20);
    uint64_t v21 = cczp_bitlen(v16 + 40 * *v14);
    unint64_t v22 = v21;
    if ((unint64_t)(v21 + 7) >> 3 >= a3) {
      unint64_t v23 = a3;
    }
    else {
      unint64_t v23 = (unint64_t)(v21 + 7) >> 3;
    }
    uint64_t uint_internal = ccn_read_uint_internal(v15, v19, v23, a4);
    if ((uint_internal & 0x80000000) == 0)
    {
      if (v22 < 8 * a3) {
        ccn_shift_right(v15, v19, v19, -(int)v22 & 7);
      }
      int v25 = (unint64_t *)cczp_prime(v16 + 40 * v15);
      if (!ccn_sub_ws(a1, v15, v39, v19->i64, v25)) {
        ccn_set(v15, v19, v39);
      }
      if (cczp_inv_ws(a1, v16 + 40 * v15)
        || (cczp_mul_ws(a1, v16 + 40 * v15),
            cczp_mul_ws(a1, v16 + 40 * v15),
            rsize_t v26 = a2 + 2,
            ccn_n(v15, &a2[2 * *v14 + 2]) != 1)
        || v26[2 * *v14] != (unint64_t *)1)
      {
LABEL_37:
        uint64_t v17 = 4294967289;
LABEL_39:
        uint64_t v29 = v41;
LABEL_34:
        *(void *)(a1 + 16) = v29;
        return v17;
      }
      uint64_t v27 = v16 + 40 * v15;
      uint64_t uint_internal = ccec_projectify_ws(a1, (uint64_t)v14);
      if (!uint_internal)
      {
        uint64_t uint_internal = ccec_projectify_ws(a1, (uint64_t)v14);
        if (!uint_internal)
        {
          if (ccec_is_point_ws(a1, v14, v42))
          {
            uint64_t v28 = *v14;
            if (ccn_cmp_internal(*v14, v16 + 16 * *v14 + 8 * *v14, v26))
            {
              uint64_t v17 = ccec_twin_mult_ws(a1, v14, v40, v44, (uint64_t)v40, v43, v42);
              uint64_t v29 = v41;
              if (v17) {
                goto LABEL_34;
              }
            }
            else
            {
              uint64_t v30 = v16 + 40 * v28;
              uint64_t v31 = *(void *)(a1 + 16);
              (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * v28);
              cczp_bitlen(v30);
              if (ccec_mult_ws(a1, (uint64_t)v14)
                || (cczp_bitlen(v30), ccec_mult_ws(a1, (uint64_t)v14)))
              {
                uint64_t v17 = 0xFFFFFFFFLL;
              }
              else
              {
                ccec_full_add_ws(a1, (uint64_t)v14);
                uint64_t v17 = 0;
              }
              uint64_t v29 = v41;
              *(void *)(a1 + 16) = v31;
              if (v17) {
                goto LABEL_34;
              }
            }
            if (ccec_affinify_x_only_ws(a1, v14, (uint64_t)v40, (uint64_t)v40))
            {
              uint64_t v17 = 4294967289;
            }
            else
            {
              uint64_t v32 = cczp_prime(v27);
              if ((ccn_cmp_internal(v15, v40, v32) & 0x80000000) == 0)
              {
                int8x16_t v33 = (unint64_t *)cczp_prime(v27);
                ccn_sub_ws(a1, v15, v40, (uint64_t *)v40, v33);
              }
              if (ccn_cmp_internal(v15, v40, v38)) {
                uint64_t v17 = 4294967150;
              }
              else {
                uint64_t v17 = 0;
              }
              ccn_write_uint_padded_ct_internal(v15, v38, v37, (char *)v36);
              ccn_write_uint_padded_ct_internal(v15, (unint64_t *)v40, v37, (char *)__s);
              cc_fault_canary_set(a8, (uint64_t)&CCEC_FAULT_CANARY, v37, (uint64_t)v36, (uint64_t)__s);
            }
            goto LABEL_34;
          }
          goto LABEL_37;
        }
      }
    }
    uint64_t v17 = uint_internal;
    goto LABEL_39;
  }
  return 4294967289;
}

uint64_t ccec_verify_internal_ws(uint64_t a1, unint64_t **a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return ccec_verify_internal_with_base_ws(a1, a2, a3, a4, a5, a6, (uint64_t)&(*a2)[2 * **a2 + 4 + **a2], a7);
}

double ccn_shift_left(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64x2_t a5)
{
  uint64_t v5 = a2 + 8 * a1;
  uint64x2_t v6 = (uint64x2_t)vdupq_n_s64(a4);
  uint64x2_t v7 = (uint64x2_t)vdupq_n_s64(a4 - 64);
  BOOL v8 = (unint64_t *)(a3 + 8 * a1 - 8);
  BOOL v9 = a1 == 4;
  BOOL v10 = a1 < 4;
  uint64_t v11 = a1 - 4;
  if (!v10)
  {
    if (v9)
    {
      v16.i64[0] = 0;
      v16.i64[1] = *(v8 - 3);
      a5 = (uint64x2_t)veorq_s8((int8x16_t)vshlq_u64(v16, v7), (int8x16_t)vshlq_u64(*(uint64x2_t *)(v8 - 3), v6));
      int8x16_t v17 = veorq_s8((int8x16_t)vshlq_u64(*((uint64x2_t *)v8 - 1), v7), (int8x16_t)vshlq_u64(*(uint64x2_t *)(v8 - 1), v6));
      *(uint64x2_t *)(v5 - 32) = a5;
      *(int8x16_t *)(v5 - 16) = v17;
      return *(double *)a5.i64;
    }
    do
    {
      uint64x2_t v12 = *(uint64x2_t *)(v8 - 3);
      uint64x2_t v13 = *(uint64x2_t *)(v8 - 1);
      uint64x2_t v14 = *((uint64x2_t *)v8 - 2);
      uint64x2_t v15 = *((uint64x2_t *)v8 - 1);
      v8 -= 4;
      a5 = (uint64x2_t)veorq_s8((int8x16_t)vshlq_u64(v14, v7), (int8x16_t)vshlq_u64(v12, v6));
      *(uint64x2_t *)(v5 - 32) = a5;
      *(int8x16_t *)(v5 - 16) = veorq_s8((int8x16_t)vshlq_u64(v15, v7), (int8x16_t)vshlq_u64(v13, v6));
      v5 -= 32;
      BOOL v10 = v11 <= 4;
      v11 -= 4;
    }
    while (!v10);
  }
  uint64_t v18 = v11 & 3;
  if (!v18) {
    return *(double *)a5.i64;
  }
  if (v18 == 3)
  {
    uint64x2_t v19 = *((uint64x2_t *)v8 - 1);
  }
  else
  {
    if ((v18 & 2) == 0) {
      goto LABEL_13;
    }
    v19.i64[0] = 0;
    v19.i64[1] = *(v8 - 1);
  }
  a5 = (uint64x2_t)veorq_s8((int8x16_t)vshlq_u64(*(uint64x2_t *)(v8 - 1), v6), (int8x16_t)vshlq_u64(v19, v7));
  v8 -= 2;
  *(uint64x2_t *)(v5 - 16) = a5;
  v5 -= 16;
LABEL_13:
  if (v18)
  {
    a5.i64[0] = *v8;
    a5.i64[0] = vshlq_u64(a5, v6).u64[0];
    *(void *)(v5 - 8) = a5.i64[0];
  }
  return *(double *)a5.i64;
}

void *ccn_mulmod_p384(void *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  unint64_t v3 = a2 + 2;
  unint64_t v6 = *v3;
  unint64_t v7 = v3[1];
  v3 += 2;
  unint64_t v8 = *v3;
  unint64_t v9 = v3[1];
  unint64_t v11 = *a3;
  unint64_t v12 = a3[1];
  BOOL v10 = a3 + 2;
  unint64_t v13 = *v10;
  unint64_t v14 = v10[1];
  v10 += 2;
  unint64_t v15 = *v10;
  unint64_t v16 = v10[1];
  unsigned long long v17 = v5 * (unsigned __int128)v11 + ((v4 * (unsigned __int128)v11) >> 64);
  unsigned long long v18 = v17 + v4 * (unsigned __int128)v12;
  uint64_t v19 = __CFADD__(__CFADD__((void)v17, v4 * v12), *((void *)&v17 + 1)) | __CFADD__((v4* (unsigned __int128)v12) >> 64, *((void *)&v18 + 1));
  uint64_t v20 = (v6 * (unsigned __int128)v11) >> 64;
  uint64_t v21 = *((void *)&v18 + 1) + v6 * v11;
  _BOOL1 v22 = __CFADD__(__CFADD__(*((void *)&v18 + 1), v6 * v11), v19);
  uint64_t v23 = __CFADD__(*((void *)&v18 + 1), v6 * v11) + v19;
  v22 |= __CFADD__(v20, v23);
  v23 += v20;
  BOOL v24 = v22;
  uint64_t v25 = (v5 * (unsigned __int128)v12) >> 64;
  _BOOL1 v22 = __CFADD__(v21, v5 * v12);
  unint64_t v26 = v21 + v5 * v12;
  BOOL v28 = v22;
  _BOOL1 v22 = __CFADD__(v22, v23);
  uint64_t v27 = v28 + v23;
  v22 |= __CFADD__(v25, v27);
  v27 += v25;
  BOOL v29 = v22 + v24;
  uint64_t v30 = (v4 * (unsigned __int128)v13) >> 64;
  _BOOL1 v22 = __CFADD__(v26, v4 * v13);
  unint64_t v31 = v26 + v4 * v13;
  BOOL v33 = v22;
  _BOOL1 v22 = __CFADD__(v22, v27);
  uint64_t v32 = v33 + v27;
  v22 |= __CFADD__(v30, v32);
  v32 += v30;
  BOOL v34 = v22 + v29;
  uint64_t v35 = (v7 * (unsigned __int128)v11) >> 64;
  _BOOL1 v22 = __CFADD__(v32, v7 * v11);
  uint64_t v36 = v32 + v7 * v11;
  BOOL v38 = v22;
  _BOOL1 v22 = __CFADD__(v22, v34);
  uint64_t v37 = v38 + v34;
  v22 |= __CFADD__(v35, v37);
  v37 += v35;
  BOOL v39 = v22;
  uint64_t v40 = (v6 * (unsigned __int128)v12) >> 64;
  _BOOL1 v22 = __CFADD__(v36, v6 * v12);
  uint64_t v41 = v36 + v6 * v12;
  BOOL v43 = v22;
  _BOOL1 v22 = __CFADD__(v22, v37);
  uint64_t v42 = v43 + v37;
  v22 |= __CFADD__(v40, v42);
  v42 += v40;
  BOOL v44 = v22 + v39;
  uint64_t v45 = (v5 * (unsigned __int128)v13) >> 64;
  _BOOL1 v22 = __CFADD__(v41, v5 * v13);
  uint64_t v46 = v41 + v5 * v13;
  BOOL v48 = v22;
  _BOOL1 v22 = __CFADD__(v22, v42);
  uint64_t v47 = v48 + v42;
  v22 |= __CFADD__(v45, v47);
  v47 += v45;
  BOOL v49 = v22 + v44;
  uint64_t v50 = (v4 * (unsigned __int128)v14) >> 64;
  _BOOL1 v22 = __CFADD__(v46, v4 * v14);
  unint64_t v51 = v46 + v4 * v14;
  BOOL v53 = v22;
  _BOOL1 v22 = __CFADD__(v22, v47);
  uint64_t v52 = v53 + v47;
  v22 |= __CFADD__(v50, v52);
  v52 += v50;
  BOOL v54 = v22 + v49;
  uint64_t v55 = (*v3 * (unsigned __int128)v11) >> 64;
  _BOOL1 v22 = __CFADD__(v52, *v3 * v11);
  uint64_t v56 = v52 + *v3 * v11;
  BOOL v58 = v22;
  _BOOL1 v22 = __CFADD__(v22, v54);
  uint64_t v57 = v58 + v54;
  v22 |= __CFADD__(v55, v57);
  v57 += v55;
  BOOL v59 = v22;
  uint64_t v60 = (v7 * (unsigned __int128)v12) >> 64;
  _BOOL1 v22 = __CFADD__(v56, v7 * v12);
  uint64_t v61 = v56 + v7 * v12;
  BOOL v63 = v22;
  _BOOL1 v22 = __CFADD__(v22, v57);
  uint64_t v62 = v63 + v57;
  v22 |= __CFADD__(v60, v62);
  v62 += v60;
  BOOL v64 = v22 + v59;
  uint64_t v65 = (v6 * (unsigned __int128)v13) >> 64;
  _BOOL1 v22 = __CFADD__(v61, v6 * v13);
  uint64_t v66 = v61 + v6 * v13;
  BOOL v68 = v22;
  _BOOL1 v22 = __CFADD__(v22, v62);
  uint64_t v67 = v68 + v62;
  v22 |= __CFADD__(v65, v67);
  v67 += v65;
  BOOL v69 = v22 + v64;
  uint64_t v70 = (v5 * (unsigned __int128)v14) >> 64;
  _BOOL1 v22 = __CFADD__(v66, v5 * v14);
  uint64_t v71 = v66 + v5 * v14;
  BOOL v73 = v22;
  _BOOL1 v22 = __CFADD__(v22, v67);
  uint64_t v72 = v73 + v67;
  v22 |= __CFADD__(v70, v72);
  v72 += v70;
  BOOL v74 = v22 + v69;
  uint64_t v75 = (v4 * (unsigned __int128)v15) >> 64;
  _BOOL1 v22 = __CFADD__(v71, v4 * v15);
  unint64_t v76 = v71 + v4 * v15;
  BOOL v78 = v22;
  _BOOL1 v22 = __CFADD__(v22, v72);
  uint64_t v77 = v78 + v72;
  v22 |= __CFADD__(v75, v77);
  v77 += v75;
  BOOL v79 = v22 + v74;
  uint64_t v80 = (v9 * (unsigned __int128)v11) >> 64;
  _BOOL1 v22 = __CFADD__(v77, v9 * v11);
  uint64_t v81 = v77 + v9 * v11;
  BOOL v83 = v22;
  _BOOL1 v22 = __CFADD__(v22, v79);
  uint64_t v82 = v83 + v79;
  v22 |= __CFADD__(v80, v82);
  v82 += v80;
  BOOL v84 = v22;
  uint64_t v85 = (*v3 * (unsigned __int128)v12) >> 64;
  _BOOL1 v22 = __CFADD__(v81, *v3 * v12);
  uint64_t v86 = v81 + *v3 * v12;
  BOOL v88 = v22;
  _BOOL1 v22 = __CFADD__(v22, v82);
  uint64_t v87 = v88 + v82;
  v22 |= __CFADD__(v85, v87);
  v87 += v85;
  BOOL v89 = v22 + v84;
  uint64_t v90 = (v7 * (unsigned __int128)v13) >> 64;
  _BOOL1 v22 = __CFADD__(v86, v7 * v13);
  uint64_t v91 = v86 + v7 * v13;
  BOOL v93 = v22;
  _BOOL1 v22 = __CFADD__(v22, v87);
  uint64_t v92 = v93 + v87;
  v22 |= __CFADD__(v90, v92);
  v92 += v90;
  BOOL v94 = v22 + v89;
  uint64_t v95 = (v6 * (unsigned __int128)v14) >> 64;
  _BOOL1 v22 = __CFADD__(v91, v6 * v14);
  uint64_t v96 = v91 + v6 * v14;
  BOOL v98 = v22;
  _BOOL1 v22 = __CFADD__(v22, v92);
  uint64_t v97 = v98 + v92;
  v22 |= __CFADD__(v95, v97);
  v97 += v95;
  BOOL v99 = v22 + v94;
  uint64_t v100 = (v5 * (unsigned __int128)v15) >> 64;
  _BOOL1 v22 = __CFADD__(v96, v5 * v15);
  uint64_t v101 = v96 + v5 * v15;
  BOOL v103 = v22;
  _BOOL1 v22 = __CFADD__(v22, v97);
  uint64_t v102 = v103 + v97;
  v22 |= __CFADD__(v100, v102);
  v102 += v100;
  BOOL v104 = v22 + v99;
  uint64_t v105 = (v4 * (unsigned __int128)v16) >> 64;
  _BOOL1 v22 = __CFADD__(v101, v4 * v16);
  unint64_t v106 = v101 + v4 * v16;
  BOOL v108 = v22;
  _BOOL1 v22 = __CFADD__(v22, v102);
  uint64_t v107 = v108 + v102;
  v22 |= __CFADD__(v105, v107);
  v107 += v105;
  unint64_t v109 = 0x100000001 * v4 * v11;
  unint64_t v110 = HIDWORD(v109);
  unint64_t v111 = HIDWORD(v109) + __CFADD__(v4 * v11, (v4 * v11) << 32) + (void)v18;
  unsigned long long v112 = __PAIR128__(v51, __CFADD__(__CFADD__(v4 * v11, (v4 * v11) << 32), (void)v18) | __CFADD__(HIDWORD(v109), __CFADD__(v4 * v11, (v4 * v11) << 32)+ (void)v18))+ v31;
  BOOL v113 = __CFADD__(__CFADD__(__CFADD__(__CFADD__(v4 * v11, (v4 * v11) << 32), (void)v18) | __CFADD__(HIDWORD(v109), __CFADD__(v4 * v11, (v4 * v11) << 32)+ (void)v18), v31), v51);
  unsigned long long v114 = __PAIR128__(v106, v113) + v76;
  BOOL v116 = __CFADD__(__CFADD__(v113, v76), v106);
  unint64_t v115 = v109 + v116 + v107;
  unint64_t v117 = (__CFADD__(v116, v107) | __CFADD__(v109, v116 + v107)) + v22 + v104;
  _BOOL1 v22 = v111 >= (v4 * v11) << 32;
  unsigned long long v120 = __PAIR128__(v112, v111) - __PAIR128__(v109, (v4 * v11) << 32);
  unint64_t v119 = v120 >> 64;
  uint64_t v118 = v120;
  BOOL v121 = !__CFSUB__((void)v112, v109, v22);
  _BOOL1 v22 = v119 >= v110;
  unsigned long long v124 = __PAIR128__(*((unint64_t *)&v112 + 1), v119) - __PAIR128__(v121, v110);
  uint64_t v123 = v124 >> 64;
  uint64_t v122 = v124;
  _BOOL1 v126 = __CFSUB__(*((void *)&v112 + 1), v121, v22);
  unint64_t v125 = v114 - !v126;
  BOOL v128 = (unint64_t)v114 >= !v126;
  unint64_t v127 = *((void *)&v114 + 1) - !v128;
  unsigned long long v129 = __PAIR128__(v117, v115) - (*((void *)&v114 + 1) < (unint64_t)!v128);
  unsigned long long v130 = v129 + v9 * (unsigned __int128)v12;
  unsigned long long v131 = v130 + v8 * (unsigned __int128)v13;
  unsigned long long v132 = v131 + v7 * (unsigned __int128)v14;
  unsigned long long v133 = v132 + v6 * (unsigned __int128)v15;
  unsigned long long v134 = v133 + v5 * (unsigned __int128)v16;
  uint64_t v135 = 0x100000001 * v118;
  unint64_t v136 = (unint64_t)(0x100000001 * v118) >> 32;
  _BOOL1 v22 = __CFADD__(__CFADD__(v118, v118 << 32), v122);
  unint64_t v137 = __CFADD__(v118, v118 << 32) + v122;
  v22 |= __CFADD__(v136, v137);
  v137 += v136;
  uint64_t v138 = v22 + v123;
  BOOL v139 = __CFADD__(v22, v123);
  unsigned long long v140 = __PAIR128__(v127, v139) + v125;
  BOOL v142 = __CFADD__(__CFADD__(v139, v125), v127);
  unint64_t v141 = v142 + v134;
  uint64_t v143 = v135 + __CFADD__(v142, (void)v134) + *((void *)&v134 + 1);
  unint64_t v144 = (__CFADD__(__CFADD__(v142, (void)v134), *((void *)&v134 + 1)) | __CFADD__(v135, __CFADD__(v142, (void)v134)+ *((void *)&v134 + 1)))+ (__CFADD__(__CFADD__((void)v133, v5 * v16), *((void *)&v133 + 1)) | __CFADD__((v5 * (unsigned __int128)v16) >> 64, *((void *)&v134 + 1)))+ (__CFADD__(__CFADD__((void)v132, v6 * v15), *((void *)&v132 + 1)) | __CFADD__((v6 * (unsigned __int128)v15) >> 64, *((void *)&v133 + 1)))+ (__CFADD__(__CFADD__((void)v131, v7 * v14), *((void *)&v131 + 1)) | __CFADD__((v7 * (unsigned __int128)v14) >> 64, *((void *)&v132 + 1)))+ (__CFADD__(__CFADD__((void)v130, v8 * v13), *((void *)&v130 + 1)) | __CFADD__((v8 * (unsigned __int128)v13) >> 64, *((void *)&v131 + 1)))+ (unint64_t)(__CFADD__(__CFADD__((void)v129, v9 * v12), *((void *)&v129 + 1)) | __CFADD__((v9 * (unsigned __int128)v12) >> 64, *((void *)&v130 + 1)));
  _BOOL1 v22 = v137 >= v135 << 32;
  unint64_t v145 = v137 - (v135 << 32);
  LOBYTE(v142) = v22;
  _BOOL1 v22 = __CFSUB__(v138, v135, v22);
  unint64_t v146 = v138 - (v135 + !v142);
  uint64_t v147 = !v22;
  _BOOL1 v22 = v146 >= v136;
  unsigned long long v150 = __PAIR128__(v140, v146) - __PAIR128__(v147, v136);
  uint64_t v149 = v150 >> 64;
  uint64_t v148 = v150;
  _BOOL1 v152 = __CFSUB__((void)v140, v147, v22);
  unint64_t v151 = *((void *)&v140 + 1) - !v152;
  BOOL v154 = *((void *)&v140 + 1) >= (unint64_t)!v152;
  _BOOL1 v22 = v141 >= !v154;
  unint64_t v153 = v141 - !v154;
  unsigned long long v155 = __PAIR128__(v144, v143) - !v22;
  unsigned long long v156 = v155 + v9 * (unsigned __int128)v13;
  unsigned long long v157 = v156 + v8 * (unsigned __int128)v14;
  unsigned long long v158 = v157 + v7 * (unsigned __int128)v15;
  unsigned long long v159 = v158 + v6 * (unsigned __int128)v16;
  uint64_t v160 = 0x100000001 * v145;
  unint64_t v161 = (0x100000001 * v145) >> 32;
  _BOOL1 v22 = __CFADD__(__CFADD__(v145, v145 << 32), v148);
  unint64_t v162 = __CFADD__(v145, v145 << 32) + v148;
  v22 |= __CFADD__(v161, v162);
  v162 += v161;
  uint64_t v163 = v22 + v149;
  BOOL v164 = __CFADD__(v22, v149);
  unsigned long long v165 = __PAIR128__(v153, v164) + v151;
  BOOL v167 = __CFADD__(__CFADD__(v164, v151), v153);
  unint64_t v166 = v167 + v159;
  uint64_t v168 = v160 + __CFADD__(v167, (void)v159) + *((void *)&v159 + 1);
  unint64_t v169 = (__CFADD__(__CFADD__(v167, (void)v159), *((void *)&v159 + 1)) | __CFADD__(v160, __CFADD__(v167, (void)v159)+ *((void *)&v159 + 1)))+ (__CFADD__(__CFADD__((void)v158, v6 * v16), *((void *)&v158 + 1)) | __CFADD__((v6 * (unsigned __int128)v16) >> 64, *((void *)&v159 + 1)))+ (__CFADD__(__CFADD__((void)v157, v7 * v15), *((void *)&v157 + 1)) | __CFADD__((v7 * (unsigned __int128)v15) >> 64, *((void *)&v158 + 1)))+ (__CFADD__(__CFADD__((void)v156, v8 * v14), *((void *)&v156 + 1)) | __CFADD__((v8 * (unsigned __int128)v14) >> 64, *((void *)&v157 + 1)))+ (unint64_t)(__CFADD__(__CFADD__((void)v155, v9 * v13), *((void *)&v155 + 1)) | __CFADD__((v9 * (unsigned __int128)v13) >> 64, *((void *)&v156 + 1)));
  _BOOL1 v22 = v162 >= v160 << 32;
  unint64_t v170 = v162 - (v160 << 32);
  LOBYTE(v167) = v22;
  _BOOL1 v22 = __CFSUB__(v163, v160, v22);
  unint64_t v171 = v163 - (v160 + !v167);
  uint64_t v172 = !v22;
  _BOOL1 v22 = v171 >= v161;
  unsigned long long v175 = __PAIR128__(v165, v171) - __PAIR128__(v172, v161);
  uint64_t v174 = v175 >> 64;
  uint64_t v173 = v175;
  _BOOL1 v177 = __CFSUB__((void)v165, v172, v22);
  unint64_t v176 = *((void *)&v165 + 1) - !v177;
  BOOL v179 = *((void *)&v165 + 1) >= (unint64_t)!v177;
  _BOOL1 v22 = v166 >= !v179;
  unint64_t v178 = v166 - !v179;
  unsigned long long v180 = __PAIR128__(v169, v168) - !v22;
  unsigned long long v181 = v180 + v9 * (unsigned __int128)v14;
  unsigned long long v182 = v181 + v8 * (unsigned __int128)v15;
  unsigned long long v183 = v182 + v7 * (unsigned __int128)v16;
  uint64_t v184 = 0x100000001 * v170;
  unint64_t v185 = (0x100000001 * v170) >> 32;
  _BOOL1 v22 = __CFADD__(__CFADD__(v170, v170 << 32), v173);
  unint64_t v186 = __CFADD__(v170, v170 << 32) + v173;
  v22 |= __CFADD__(v185, v186);
  v186 += v185;
  uint64_t v187 = v22 + v174;
  BOOL v188 = __CFADD__(v22, v174);
  unsigned long long v189 = __PAIR128__(v178, v188) + v176;
  BOOL v191 = __CFADD__(__CFADD__(v188, v176), v178);
  unint64_t v190 = v191 + v183;
  uint64_t v192 = v184 + __CFADD__(v191, (void)v183) + *((void *)&v183 + 1);
  unint64_t v193 = (__CFADD__(__CFADD__(v191, (void)v183), *((void *)&v183 + 1)) | __CFADD__(v184, __CFADD__(v191, (void)v183)+ *((void *)&v183 + 1)))+ (__CFADD__(__CFADD__((void)v182, v7 * v16), *((void *)&v182 + 1)) | __CFADD__((v7 * (unsigned __int128)v16) >> 64, *((void *)&v183 + 1)))+ (__CFADD__(__CFADD__((void)v181, v8 * v15), *((void *)&v181 + 1)) | __CFADD__((v8 * (unsigned __int128)v15) >> 64, *((void *)&v182 + 1)))+ (unint64_t)(__CFADD__(__CFADD__((void)v180, v9 * v14), *((void *)&v180 + 1)) | __CFADD__((v9 * (unsigned __int128)v14) >> 64, *((void *)&v181 + 1)));
  _BOOL1 v22 = v186 >= v184 << 32;
  unint64_t v194 = v186 - (v184 << 32);
  LOBYTE(v191) = v22;
  _BOOL1 v22 = __CFSUB__(v187, v184, v22);
  unint64_t v195 = v187 - (v184 + !v191);
  uint64_t v196 = !v22;
  _BOOL1 v22 = v195 >= v185;
  unsigned long long v199 = __PAIR128__(v189, v195) - __PAIR128__(v196, v185);
  uint64_t v198 = v199 >> 64;
  uint64_t v197 = v199;
  _BOOL1 v201 = __CFSUB__((void)v189, v196, v22);
  unint64_t v200 = *((void *)&v189 + 1) - !v201;
  BOOL v203 = *((void *)&v189 + 1) >= (unint64_t)!v201;
  _BOOL1 v22 = v190 >= !v203;
  unint64_t v202 = v190 - !v203;
  unsigned long long v204 = __PAIR128__(v193, v192) - !v22;
  unsigned long long v205 = v204 + v9 * (unsigned __int128)v15;
  unsigned long long v206 = v205 + v8 * (unsigned __int128)v16;
  uint64_t v207 = 0x100000001 * v194;
  unint64_t v208 = (0x100000001 * v194) >> 32;
  _BOOL1 v22 = __CFADD__(__CFADD__(v194, v194 << 32), v197);
  unint64_t v209 = __CFADD__(v194, v194 << 32) + v197;
  v22 |= __CFADD__(v208, v209);
  v209 += v208;
  uint64_t v210 = v22 + v198;
  BOOL v211 = __CFADD__(v22, v198);
  unsigned long long v212 = __PAIR128__(v202, v211) + v200;
  BOOL v214 = __CFADD__(__CFADD__(v211, v200), v202);
  unint64_t v213 = v214 + v206;
  uint64_t v215 = v207 + __CFADD__(v214, (void)v206) + *((void *)&v206 + 1);
  unint64_t v216 = (__CFADD__(__CFADD__(v214, (void)v206), *((void *)&v206 + 1)) | __CFADD__(v207, __CFADD__(v214, (void)v206)+ *((void *)&v206 + 1)))+ (__CFADD__(__CFADD__((void)v205, v8 * v16), *((void *)&v205 + 1)) | __CFADD__((v8 * (unsigned __int128)v16) >> 64, *((void *)&v206 + 1)))+ (unint64_t)(__CFADD__(__CFADD__((void)v204, v9 * v15), *((void *)&v204 + 1)) | __CFADD__((v9 * (unsigned __int128)v15) >> 64, *((void *)&v205 + 1)));
  _BOOL1 v22 = v209 >= v207 << 32;
  unint64_t v217 = v209 - (v207 << 32);
  LOBYTE(v214) = v22;
  _BOOL1 v22 = __CFSUB__(v210, v207, v22);
  unint64_t v218 = v210 - (v207 + !v214);
  uint64_t v219 = !v22;
  _BOOL1 v22 = v218 >= v208;
  unsigned long long v222 = __PAIR128__(v212, v218) - __PAIR128__(v219, v208);
  uint64_t v221 = v222 >> 64;
  uint64_t v220 = v222;
  _BOOL1 v224 = __CFSUB__((void)v212, v219, v22);
  unint64_t v223 = *((void *)&v212 + 1) - !v224;
  BOOL v226 = *((void *)&v212 + 1) >= (unint64_t)!v224;
  _BOOL1 v22 = v213 >= !v226;
  unint64_t v225 = v213 - !v226;
  unsigned long long v227 = __PAIR128__(v216, v215) - !v22;
  unsigned long long v228 = v227 + v9 * (unsigned __int128)v16;
  uint64_t v229 = 0x100000001 * v217;
  unint64_t v230 = (0x100000001 * v217) >> 32;
  _BOOL1 v22 = __CFADD__(__CFADD__(v217, v217 << 32), v220);
  unint64_t v231 = __CFADD__(v217, v217 << 32) + v220;
  v22 |= __CFADD__(v230, v231);
  v231 += v230;
  uint64_t v232 = v22 + v221;
  BOOL v233 = __CFADD__(v22, v221);
  unsigned long long v234 = __PAIR128__(v225, v233) + v223;
  BOOL v236 = __CFADD__(__CFADD__(v233, v223), v225);
  unint64_t v235 = v236 + v228;
  uint64_t v237 = v229 + __CFADD__(v236, (void)v228) + *((void *)&v228 + 1);
  unint64_t v238 = (__CFADD__(__CFADD__(v236, (void)v228), *((void *)&v228 + 1)) | __CFADD__(v229, __CFADD__(v236, (void)v228)+ *((void *)&v228 + 1)))+ (unint64_t)(__CFADD__(__CFADD__((void)v227, v9 * v16), *((void *)&v227 + 1)) | __CFADD__((v9 * (unsigned __int128)v16) >> 64, *((void *)&v228 + 1)));
  _BOOL1 v22 = v231 >= v229 << 32;
  unint64_t v239 = v231 - (v229 << 32);
  LOBYTE(v236) = v22;
  _BOOL1 v22 = __CFSUB__(v232, v229, v22);
  unint64_t v240 = v232 - (v229 + !v236);
  uint64_t v241 = !v22;
  _BOOL1 v22 = v240 >= v230;
  unsigned long long v244 = __PAIR128__(v234, v240) - __PAIR128__(v241, v230);
  uint64_t v243 = v244 >> 64;
  uint64_t v242 = v244;
  _BOOL1 v246 = __CFSUB__((void)v234, v241, v22);
  uint64_t v245 = *((void *)&v234 + 1) - !v246;
  BOOL v248 = *((void *)&v234 + 1) >= (unint64_t)!v246;
  _BOOL1 v22 = v235 >= !v248;
  unint64_t v247 = v235 - !v248;
  unsigned long long v249 = __PAIR128__(v238, v237) - !v22;
  _BOOL1 v22 = v239 >= 0xFFFFFFFF;
  unint64_t v250 = v239 - 0xFFFFFFFF;
  _BOOL1 v252 = v22;
  _BOOL1 v22 = __CFSUB__(v242, 0xFFFFFFFF00000000, v22);
  uint64_t v251 = v242 - (!v252 - 0x100000000);
  _BOOL1 v254 = v22;
  _BOOL1 v22 = __CFSUB__(v243, -2, v22);
  uint64_t v253 = v243 - (!v254 - 2);
  _BOOL1 v256 = v22;
  _BOOL1 v22 = __CFSUB__(v245, -1, v22);
  uint64_t v255 = v245 - (!v256 - 1);
  _BOOL1 v258 = v22;
  _BOOL1 v22 = __CFSUB__(v247, -1, v22);
  unint64_t v257 = v247 - (!v258 - 1);
  uint64_t v259 = v249 - (!v22 - 1);
  uint64_t v260 = *((void *)&v249 + 1) - !__CFSUB__((void)v249, -1, v22);
  _BOOL1 v22 = __CFADD__(__CFADD__(v250, (v260 & 0xFFFFFFFF00000000) >> 32), v251);
  uint64_t v261 = __CFADD__(v250, (v260 & 0xFFFFFFFF00000000) >> 32) + v251;
  uint64_t v263 = v22 | __CFADD__(v260 & 0xFFFFFFFF00000000, v261);
  _BOOL1 v22 = __CFADD__(v263, v253);
  uint64_t v262 = v263 + v253;
  uint64_t v265 = v22 | __CFADD__(v260 & 0xFFFFFFFFFFFFFFFELL, v262);
  _BOOL1 v22 = __CFADD__(v265, v255);
  uint64_t v264 = v265 + v255;
  uint64_t v267 = v22 | __CFADD__(v260, v264);
  _BOOL1 v22 = __CFADD__(v267, v257);
  uint64_t v266 = v267 + v257;
  *a1 = v250 + ((v260 & 0xFFFFFFFF00000000) >> 32);
  a1[1] = (v260 & 0xFFFFFFFF00000000) + v261;
  v268 = a1 + 2;
  void *v268 = (v260 & 0xFFFFFFFFFFFFFFFELL) + v262;
  v268[1] = v260 + v264;
  uint64_t result = v268 + 2;
  *uint64_t result = v260 + v266;
  result[1] = v260 + (v22 | __CFADD__(v260, v266)) + v259;
  return result;
}

uint64_t cc_clear(rsize_t __n, void *__s)
{
  return memset_s(__s, __n, 0, __n);
}

uint64_t ccn_cond_add(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t mask = ccn_mux_next_mask();
  uint64_t v11 = __ROR8__(0x5555555555555555, a2 | (2 * mask));
  uint64_t v12 = 0;
  if (a1)
  {
    uint64_t v13 = 0;
    do
    {
      uint64_t v15 = *a4++;
      uint64_t v14 = v15;
      uint64_t v17 = *a5++;
      uint64_t v16 = v17;
      BOOL v18 = __CFADD__(v12, v14);
      uint64_t v19 = v12 + v14;
      if (v18) {
        uint64_t v13 = 1;
      }
      BOOL v18 = __CFADD__(v19, v16);
      uint64_t v20 = v19 + v16;
      if (v18) {
        uint64_t v12 = v13 + 1;
      }
      else {
        uint64_t v12 = v13;
      }
      uint64_t v21 = v14 ^ v20;
      uint64_t v22 = v14 ^ mask;
      *a3 = v22;
      *a3++ = v21 & v11 ^ v21 & 0x5555555555555555 ^ v22 ^ mask;
      uint64_t v13 = 0;
      --a1;
    }
    while (a1);
  }
  return v12 & a2;
}

uint64_t ccec_sign_composite_ws(uint64_t a1, unint64_t **a2, unint64_t a3, uint64_t a4, char *a5, char *a6, uint64_t (**a7)(void, unint64_t, void *))
{
  unint64_t v14 = **a2;
  uint64_t v15 = *(void *)(a1 + 16);
  uint64_t v16 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v14);
  uint64_t v17 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v14);
  uint64_t v18 = ccec_sign_internal_ws(a1, (uint64_t **)a2, a3, a4, v16, v17, a7);
  if (!v18)
  {
    unint64_t v19 = **a2;
    unint64_t v20 = ccec_signature_r_s_size((uint64_t *)a2);
    ccn_write_uint_padded_ct_internal(v19, v16, v20, a5);
    unint64_t v21 = **a2;
    unint64_t v22 = ccec_signature_r_s_size((uint64_t *)a2);
    ccn_write_uint_padded_ct_internal(v21, (unint64_t *)v17, v22, a6);
  }
  *(void *)(a1 + 16) = v15;
  return v18;
}

uint64_t ccec_sign_composite_msg_ws(uint64_t a1, unint64_t **a2, unint64_t *a3, size_t a4, char *a5, char *a6, char *a7, uint64_t (**a8)(void, unint64_t, void *))
{
  memset(v15, 0, sizeof(v15));
  ccdigest_internal((uint64_t)a3, a4, a5, (uint64_t)v15);
  return ccec_sign_composite_ws(a1, a2, *a3, (uint64_t)v15, a6, a7, a8);
}

uint64_t cczp_is_quadratic_residue_ws(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = cczp_n(a2);
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  unint64_t v9 = (void *)cczp_prime(a2);
  ccn_set(v6, v8, v9);
  v8->i64[0] &= ~1uLL;
  BOOL v10 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  ccn_shift_right(v6, v10, v8, 1);
  uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  unsigned int v12 = cczp_power_fast_ws(a1, a2, v11, a3, (uint64_t)v10);
  cczp_from_ws(a1, a2);
  BOOL v13 = ccn_n(v6, v11) == 1 && *v11 == 1;
  uint64_t result = v13 & ~(((v12 | ((unint64_t)(int)v12 >> 32)) + 0xFFFFFFFF) >> 32);
  *(void *)(a1 + 16) = v7;
  return result;
}

uint64_t ccdrbg_init_internal(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t ccdrbg_reseed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL v14 = timingsafe_enable_if_supported();
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 16))(a2, a3, a4, a5, a6);
  cc_disable_dit_with_sb((unsigned int *)&v14);
  return v12;
}

uint64_t ccdrbg_generate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL v14 = timingsafe_enable_if_supported();
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 24))(a2, a3, a4, a5, a6);
  cc_disable_dit_with_sb((unsigned int *)&v14);
  return v12;
}

uint64_t ccccm_one_shot_internal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  size_t v20 = (*(void *)a1 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v21 = (char *)&v26 - v20;
  bzero((char *)&v26 - v20, v20);
  size_t v22 = (*(void *)(a1 + 8) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v23 = (char *)&v26 - v22;
  bzero((char *)&v26 - v22, v22);
  uint64_t v24 = (*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(a1 + 24))(a1, v21, a2, a3);
  if (!v24)
  {
    uint64_t v24 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(v21, v23, a4, a5, a11, a9, a6);
    if (!v24)
    {
      uint64_t v24 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t))(a1 + 40))(v21, v23, a9, a10);
      if (!v24)
      {
        uint64_t v24 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t, uint64_t))(a1 + 48))(v21, v23, a6, a7, a8);
        if (!v24) {
          uint64_t v24 = (*(uint64_t (**)(char *, char *, uint64_t))(a1 + 56))(v21, v23, a12);
        }
      }
    }
  }
  cc_clear(*(void *)a1, v21);
  cc_clear(*(void *)(a1 + 8), v23);
  return v24;
}

uint64_t cczp_add_default_ws(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = cczp_n(a2);
  uint64_t v12 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v11);
  LOBYTE(a5) = ccn_add_ws(a1, v11, a3, a4, a5);
  BOOL v13 = (unint64_t *)cczp_prime(a2);
  BOOL v14 = ccn_sub_ws(a1, v11, v12, a3, v13);
  uint64_t result = ccn_mux(v11, !v14 | a5, a3, v12, a3);
  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t cczp_add_ws(uint64_t a1, uint64_t a2)
{
  return (**(uint64_t (***)(void))(a2 + 16))();
}

void *ccec_cp_384_asm()
{
  return &ccec_cp384_asm;
}

void *ccn_p384_mul_asm_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4, unint64_t *a5)
{
  return ccn_mulmod_p384(a3, a4, a5);
}

void *ccn_p384_sqr_asm_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  return ccn_mulmod_p384(a3, a4, a4);
}

uint64_t ccn_p384_inv_asm_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 6);
  unint64_t v9 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 6);
  uint64_t v10 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 6);
  ccn_mulmod_p384(v10, a4, a4);
  ccn_mulmod_p384(v9, v10, a4);
  ccn_mulmod_p384(v9, v9, v9);
  ccn_mulmod_p384(v9, v9, v9);
  ccn_mulmod_p384(v8, v9, a4);
  ccn_mulmod_p384(v9, v8, v10);
  int v11 = 4;
  do
  {
    ccn_mulmod_p384(v9, v9, v9);
    --v11;
  }
  while (v11);
  ccn_mulmod_p384(v8, v8, v9);
  ccn_mulmod_p384(v9, v8, v10);
  int v12 = 8;
  do
  {
    ccn_mulmod_p384(v9, v9, v9);
    --v12;
  }
  while (v12);
  ccn_mulmod_p384(v8, v8, v9);
  ccn_mulmod_p384(v9, v8, v10);
  int v13 = 16;
  do
  {
    ccn_mulmod_p384(v9, v9, v9);
    --v13;
  }
  while (v13);
  ccn_mulmod_p384(v8, v8, v9);
  ccn_mulmod_p384(v9, v8, a4);
  ccn_mulmod_p384(v10, v9, a4);
  int v14 = 32;
  do
  {
    ccn_mulmod_p384(v10, v10, v10);
    --v14;
  }
  while (v14);
  ccn_mulmod_p384(v9, v10, v9);
  int v15 = 64;
  do
  {
    ccn_mulmod_p384(v10, v10, v10);
    --v15;
  }
  while (v15);
  ccn_mulmod_p384(v10, v10, v8);
  ccn_mulmod_p384(v8, v9, a4);
  int v16 = 64;
  do
  {
    ccn_mulmod_p384(v8, v8, v8);
    --v16;
  }
  while (v16);
  ccn_mulmod_p384(v9, v8, v9);
  ccn_mulmod_p384(v8, v9, a4);
  int v17 = 128;
  do
  {
    ccn_mulmod_p384(v8, v8, v8);
    --v17;
  }
  while (v17);
  ccn_mulmod_p384(v8, v8, v9);
  int v18 = 128;
  do
  {
    ccn_mulmod_p384(v8, v8, v8);
    --v18;
  }
  while (v18);
  ccn_mulmod_p384(v9, v8, v10);
  ccn_mulmod_p384(v8, v9, a4);
  uint64_t v23 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v20 = 1;
  ccn_mulmod_p384(v8, v8, &v20);
  if (ccn_n(6, v8) == 1 && *v8 == 1)
  {
    ccn_set(6, a3, v9);
    uint64_t result = 0;
  }
  else
  {
    uint64_t result = 4294967254;
  }
  *(void *)(a1 + 16) = v7;
  return result;
}

void *ccn_p384_from_asm_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v8 = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  unint64_t v5 = 1;
  return ccn_mulmod_p384(a3, a4, &v5);
}

uint64_t cczp_div2_ws(uint64_t a1, uint64_t a2, int8x16_t *a3, uint64_t *a4)
{
  uint64_t v7 = cczp_n(a2);
  uint64_t v8 = *a4 & 1;
  unint64_t v9 = (uint64_t *)cczp_prime(a2);
  uint64_t v10 = ccn_cond_add(v7, v8, a3->i64, a4, v9);
  uint64_t result = ccn_shift_right(v7, a3, a3, 1);
  a3->i64[v7 - 1] |= v10 << 63;
  return result;
}

uint64_t cczp_modn_ws(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4, char *a5)
{
  unint64_t v10 = cczp_n((uint64_t)a2);
  uint64_t v11 = v10;
  if ((a4 - 1) / v10 <= 1) {
    unint64_t v12 = 1;
  }
  else {
    unint64_t v12 = (a4 - 1) / v10;
  }
  uint64_t v17 = a4;
  uint64_t v18 = *(void *)(a1 + 16);
  int v13 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * v10);
  unint64_t v19 = a5;
  ccn_set(v11, v13, a5);
  unint64_t v14 = v12 - 1;
  if (v12 != 1)
  {
    int v15 = &v19[8 * v11];
    do
    {
      ccn_set(v11, &v13[8 * v11], v15);
      cczp_mm_redc_ws(a1, a2, (uint64_t *)v13, (uint64_t *)v13);
      v15 += 8 * v11;
      --v14;
    }
    while (v14);
  }
  if (v17 != v12 * v11) {
    ccn_set(v17 - v12 * v11, &v13[8 * v11], &v19[8 * v12 * v11]);
  }
  ccn_zero(v11 - (v17 - v12 * v11), &v13[8 * v11 + 8 * (v17 - v12 * v11)]);
  cczp_mm_redc_ws(a1, a2, a3, (uint64_t *)v13);
  do
  {
    ccn_mul_ws(a1, v11, (uint64_t)v13, (uint64_t)a3, (uint64_t)&a2[*a2 + 4]);
    uint64_t result = cczp_mm_redc_ws(a1, a2, a3, (uint64_t *)v13);
    --v12;
  }
  while (v12);
  *(void *)(a1 + 16) = v18;
  return result;
}

uint64_t cczp_mod_default_ws(uint64_t a1, void *a2, uint64_t *a3, char *a4)
{
  uint64_t v8 = 2 * cczp_n((uint64_t)a2);

  return cczp_modn_ws(a1, a2, a3, v8, a4);
}

uint64_t cczp_mod_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 32))();
}

uint64_t cczp_mul_default_ws(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = cczp_n(a2);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v10);
  uint64_t v12 = cczp_n(a2);
  ccn_mul_ws(a1, v12, v11, a4, a5);
  uint64_t result = cczp_mod_ws(a1, a2);
  *(void *)(a1 + 16) = v9;
  return result;
}

uint64_t cczp_mul_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 16))();
}

_OWORD *ccn_mulmod_p256(void *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  unint64_t v3 = a2 + 2;
  unint64_t v6 = *v3;
  unint64_t v7 = v3[1];
  unint64_t v9 = *a3;
  unint64_t v10 = a3[1];
  uint64_t v8 = a3 + 2;
  unint64_t v11 = *v8;
  unint64_t v12 = v8[1];
  unint64_t v13 = v4 * v9;
  uint64_t v14 = (v5 * (unsigned __int128)v9) >> 64;
  uint64_t v15 = *v3 * v9;
  uint64_t v16 = (v6 * (unsigned __int128)v9) >> 64;
  unint64_t v18 = v9;
  uint64_t v17 = (__PAIR128__(v5, v4) * v9) >> 64;
  _BOOL1 v19 = __CFADD__(__CFADD__((v4 * (unsigned __int128)v9) >> 64, v5 * v9), v14);
  uint64_t v20 = __CFADD__((v4 * (unsigned __int128)v9) >> 64, v5 * v9) + v14;
  v19 |= __CFADD__(v15, v20);
  v20 += v15;
  uint64_t v21 = (v7 * (unsigned __int128)v9) >> 64;
  uint64_t v22 = (v7 * (unsigned __int128)v10) >> 64;
  BOOL v24 = v19;
  _BOOL1 v19 = __CFADD__(v19, v16);
  uint64_t v23 = v24 + v16;
  v19 |= __CFADD__(v7 * v9, v23);
  v23 += v7 * v9;
  BOOL v26 = v19;
  _BOOL1 v19 = __CFADD__(v19, v21);
  uint64_t v25 = v26 + v21;
  v19 |= __CFADD__(v7 * v10, v25);
  v25 += v7 * v10;
  uint64_t v27 = v7 * *v8;
  uint64_t v28 = (v7 * (unsigned __int128)v11) >> 64;
  BOOL v30 = v19;
  _BOOL1 v19 = __CFADD__(v19, v22);
  uint64_t v29 = v30 + v22;
  v19 |= __CFADD__(v27, v29);
  v29 += v27;
  BOOL v32 = v19;
  _BOOL1 v19 = __CFADD__(v19, v28);
  uint64_t v31 = v32 + v28;
  v19 |= __CFADD__(v7 * v12, v31);
  v31 += v7 * v12;
  uint64_t v33 = v19 + ((v7 * (unsigned __int128)v12) >> 64);
  uint64_t v34 = (v4 * (unsigned __int128)v10) >> 64;
  _BOOL1 v19 = __CFADD__(v17, v4 * v10);
  uint64_t v35 = (__PAIR128__(v10, v18) * __PAIR128__(v5, v4)) >> 64;
  BOOL v37 = v19;
  _BOOL1 v19 = __CFADD__(v19, v20);
  uint64_t v36 = v37 + v20;
  v19 |= __CFADD__(v34, v36);
  v36 += v34;
  uint64_t v38 = (v6 * (unsigned __int128)v10) >> 64;
  BOOL v40 = v19;
  _BOOL1 v19 = __CFADD__(v19, v23);
  uint64_t v39 = v40 + v23;
  v19 |= __CFADD__(v6 * v10, v39);
  v39 += v6 * v10;
  BOOL v42 = v19;
  _BOOL1 v19 = __CFADD__(v19, v25);
  uint64_t v41 = v42 + v25;
  v19 |= __CFADD__(v38, v41);
  v41 += v38;
  uint64_t v43 = (v6 * (unsigned __int128)v12) >> 64;
  BOOL v45 = v19;
  _BOOL1 v19 = __CFADD__(v19, v29);
  uint64_t v44 = v45 + v29;
  v19 |= __CFADD__(v6 * v12, v44);
  v44 += v6 * v12;
  BOOL v47 = v19;
  _BOOL1 v19 = __CFADD__(v19, v31);
  uint64_t v46 = v47 + v31;
  v19 |= __CFADD__(v43, v46);
  v46 += v43;
  uint64_t v48 = v19 + v33;
  uint64_t v49 = (v5 * (unsigned __int128)v10) >> 64;
  _BOOL1 v19 = __CFADD__(v36, v5 * v10);
  uint64_t v50 = v36 + v5 * v10;
  BOOL v52 = v19;
  _BOOL1 v19 = __CFADD__(v19, v39);
  uint64_t v51 = v52 + v39;
  v19 |= __CFADD__(v49, v51);
  v51 += v49;
  uint64_t v53 = (v6 * (unsigned __int128)v11) >> 64;
  BOOL v55 = v19;
  _BOOL1 v19 = __CFADD__(v19, v41);
  uint64_t v54 = v55 + v41;
  v19 |= __CFADD__(v6 * v11, v54);
  v54 += v6 * v11;
  BOOL v57 = v19;
  _BOOL1 v19 = __CFADD__(v19, v44);
  uint64_t v56 = v57 + v44;
  v19 |= __CFADD__(v53, v56);
  v56 += v53;
  BOOL v58 = v19;
  uint64_t v59 = (v4 * (unsigned __int128)v11) >> 64;
  _BOOL1 v19 = __CFADD__(v50, v4 * v11);
  uint64_t v60 = v50 + v4 * v11;
  BOOL v62 = v19;
  _BOOL1 v19 = __CFADD__(v19, v51);
  uint64_t v61 = v62 + v51;
  v19 |= __CFADD__(v59, v61);
  v61 += v59;
  uint64_t v63 = (v5 * (unsigned __int128)v12) >> 64;
  BOOL v65 = v19;
  _BOOL1 v19 = __CFADD__(v19, v54);
  uint64_t v64 = v65 + v54;
  v19 |= __CFADD__(v5 * v12, v64);
  v64 += v5 * v12;
  BOOL v67 = v19;
  _BOOL1 v19 = __CFADD__(v19, v56);
  uint64_t v66 = v67 + v56;
  v19 |= __CFADD__(v63, v66);
  v66 += v63;
  uint64_t v68 = v19 + v58;
  uint64_t v69 = (v5 * (unsigned __int128)v11) >> 64;
  _BOOL1 v19 = __CFADD__(v61, v5 * v11);
  uint64_t v70 = v61 + v5 * v11;
  BOOL v72 = v19;
  _BOOL1 v19 = __CFADD__(v19, v64);
  uint64_t v71 = v72 + v64;
  v19 |= __CFADD__(v69, v71);
  v71 += v69;
  uint64_t v73 = v19;
  uint64_t v74 = (v4 * (unsigned __int128)v12) >> 64;
  _BOOL1 v19 = __CFADD__(v70, v4 * v12);
  uint64_t v75 = v70 + v4 * v12;
  BOOL v77 = v19;
  _BOOL1 v19 = __CFADD__(v19, v71);
  uint64_t v76 = v77 + v71;
  v19 |= __CFADD__(v74, v76);
  v76 += v74;
  BOOL v79 = v19;
  _BOOL1 v19 = __CFADD__(v19, v66);
  uint64_t v78 = v79 + v66;
  v19 |= __CFADD__(v73, v78);
  v78 += v73;
  BOOL v81 = v19;
  _BOOL1 v19 = __CFADD__(v19, v46);
  uint64_t v80 = v81 + v46;
  v19 |= __CFADD__(v68, v80);
  v80 += v68;
  uint64_t v82 = v19 + v48;
  _BOOL1 v19 = __CFADD__(v35, v13 << 32);
  unint64_t v83 = v35 + (v13 << 32);
  BOOL v85 = v19;
  _BOOL1 v19 = __CFADD__(v19, v60);
  uint64_t v84 = v85 + v60;
  v19 |= __CFADD__(HIDWORD(v13), v84);
  v84 += HIDWORD(v13);
  BOOL v87 = v19;
  _BOOL1 v19 = __CFADD__(v19, v75);
  uint64_t v86 = v87 + v75;
  v19 |= __CFADD__(0xFFFFFFFF00000001 * v13, v86);
  v86 += 0xFFFFFFFF00000001 * v13;
  uint64_t v88 = v19 + ((v13 * (unsigned __int128)0xFFFFFFFF00000001) >> 64);
  _BOOL1 v19 = __CFADD__(v84, v83 << 32);
  unint64_t v89 = v84 + (v83 << 32);
  BOOL v91 = v19;
  _BOOL1 v19 = __CFADD__(v19, v86);
  uint64_t v90 = v91 + v86;
  v19 |= __CFADD__(HIDWORD(v83), v90);
  v90 += HIDWORD(v83);
  BOOL v93 = v19;
  _BOOL1 v19 = __CFADD__(v19, v76);
  uint64_t v92 = v93 + v76;
  v19 |= __CFADD__(0xFFFFFFFF00000001 * v83, v92);
  v92 += 0xFFFFFFFF00000001 * v83;
  uint64_t v94 = v19 + ((v83 * (unsigned __int128)0xFFFFFFFF00000001) >> 64);
  _BOOL1 v19 = __CFADD__(v90, v89 << 32);
  unint64_t v95 = v90 + (v89 << 32);
  BOOL v97 = v19;
  _BOOL1 v19 = __CFADD__(v19, v92);
  uint64_t v96 = v97 + v92;
  v19 |= __CFADD__(HIDWORD(v89), v96);
  v96 += HIDWORD(v89);
  BOOL v99 = v19;
  _BOOL1 v19 = __CFADD__(v19, v78);
  uint64_t v98 = v99 + v78;
  v19 |= __CFADD__(0xFFFFFFFF00000001 * v89, v98);
  v98 += 0xFFFFFFFF00000001 * v89;
  uint64_t v100 = v19 + ((v89 * (unsigned __int128)0xFFFFFFFF00000001) >> 64);
  _BOOL1 v19 = __CFADD__(v96, v95 << 32);
  uint64_t v101 = v96 + (v95 << 32);
  BOOL v103 = v19;
  _BOOL1 v19 = __CFADD__(v19, v98);
  uint64_t v102 = v103 + v98;
  v19 |= __CFADD__(HIDWORD(v95), v102);
  v102 += HIDWORD(v95);
  BOOL v105 = v19;
  _BOOL1 v19 = __CFADD__(v19, v80);
  uint64_t v104 = v105 + v80;
  v19 |= __CFADD__(0xFFFFFFFF00000001 * v95, v104);
  v104 += 0xFFFFFFFF00000001 * v95;
  uint64_t v106 = v19 + ((v95 * (unsigned __int128)0xFFFFFFFF00000001) >> 64);
  _BOOL1 v19 = __CFADD__(v88, v101);
  uint64_t v107 = v88 + v101;
  BOOL v109 = v19;
  _BOOL1 v19 = __CFADD__(v19, v94);
  uint64_t v108 = v109 + v94;
  v19 |= __CFADD__(v102, v108);
  v108 += v102;
  BOOL v111 = v19;
  _BOOL1 v19 = __CFADD__(v19, v100);
  unint64_t v110 = v111 + v100;
  v19 |= __CFADD__(v104, v110);
  v110 += v104;
  BOOL v113 = v19;
  _BOOL1 v19 = __CFADD__(v19, v106);
  uint64_t v112 = v113 + v106;
  v19 |= __CFADD__(v82, v112);
  v112 += v82;
  BOOL v114 = v19;
  _BOOL1 v19 = __CFADD__(v107++, 1);
  LOBYTE(v113) = v19;
  _BOOL1 v19 = __CFSUB__(v108, 0xFFFFFFFFLL, v19);
  uint64_t v115 = v108 - (!v113 + 0xFFFFFFFFLL);
  LOBYTE(v113) = v19;
  _BOOL1 v19 = v110 >= !v19;
  unint64_t v116 = v110 - !v113;
  LOBYTE(v113) = v19;
  _BOOL1 v19 = __CFSUB__(v112, 0xFFFFFFFF00000001, v19);
  BOOL v117 = v114 - !v19;
  uint64_t v118 = v114 - !v19;
  _BOOL1 v19 = __CFADD__(__CFADD__(v107, v117), v115);
  uint64_t v119 = __CFADD__(v107, v117) + v115;
  *a1 = v107 + v117;
  a1[1] = v118 + v119;
  uint64_t result = a1 + 2;
  *uint64_t result = __PAIR128__(v117 & 0xFFFFFFFF00000001, v19 | __CFADD__(v118, v119))
          + __PAIR128__(v112 - ((unint64_t)!v113 - 0xFFFFFFFF), v116);
  return result;
}

uint64_t cccmac_update_internal(void *a1, unint64_t a2, char *__src)
{
  uint64_t result = 0;
  if (a2)
  {
    unint64_t v5 = __src;
    if (__src)
    {
      unint64_t v6 = a2;
      unint64_t v7 = (void *)a1[8];
      memset(&v12[2], 0, 224);
      unint64_t v8 = a1[6];
      if (16 - v8 >= a2) {
        size_t v9 = a2;
      }
      else {
        size_t v9 = 16 - v8;
      }
      memset(v12, 0, 32);
      if (v8 > 0x10) {
        return 0xFFFFFFFFLL;
      }
      if (v8)
      {
        memcpy((char *)a1 + v8 + 32, __src, v9);
        a1[6] += v9;
        v6 -= v9;
        if (!v6) {
          return 0;
        }
        v5 += v9;
        cccbc_update_internal((uint64_t)v7, (uint64_t)(a1 + 9), (uint64_t)a1 + *v7 + 72, 1, (uint64_t)(a1 + 4), (uint64_t)v12);
        a1[7] += 16;
      }
      if (v6 >= 0x11)
      {
        unint64_t v10 = (v6 - 1) >> 4;
        do
        {
          if (v10 >= 0x10) {
            uint64_t v11 = 16;
          }
          else {
            uint64_t v11 = v10;
          }
          cccbc_update_internal((uint64_t)v7, (uint64_t)(a1 + 9), (uint64_t)a1 + *v7 + 72, v11, (uint64_t)v5, (uint64_t)v12);
          v5 += 16 * v11;
          v10 -= v11;
        }
        while (v10);
      }
      __memcpy_chk();
      uint64_t result = 0;
      a1[6] = v6 - ((v6 - 1) & 0xFFFFFFFFFFFFFFF0);
    }
  }
  return result;
}

uint64_t cczp_sqr_default_ws(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = cczp_n(a2);
  size_t v9 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * v8);
  ccn_sqr_ws(a1, v8, v9, a4);
  uint64_t result = cczp_mod_ws(a1, a2);
  *(void *)(a1 + 16) = v7;
  return result;
}

uint64_t cczp_sqr_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 24))();
}

uint64_t cczp_prime(uint64_t a1)
{
  return a1 + 24;
}

uint64_t cczp_sub_default_ws(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, unint64_t *a5)
{
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = cczp_n(a2);
  BOOL v12 = ccn_sub_ws(a1, v11, a3, a4, a5);
  unint64_t v13 = (uint64_t *)cczp_prime(a2);
  uint64_t result = ccn_cond_add(v11, v12, a3, a3, v13);
  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t cczp_sub_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 8))();
}

uint64_t cccmac_init_internal(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t result = 4294967289;
  if (a3 <= 0x20 && ((1 << a3) & 0x101010000) != 0)
  {
    uint64_t v9 = a2 + 72;
    cccbc_init_internal((uint64_t)a1);
    __src[0] = 0;
    __src[1] = 0;
    cccbc_set_iv_internal((uint64_t)a1, (void *)(v9 + *a1), __src);
    *(void *)(a2 + 56) = 0;
    *(void *)(a2 + 64) = a1;
    *(void *)(a2 + 48) = 0;
    return cccmac_generate_subkeys((uint64_t)a1, a3, a4, (char *)a2, a2 + 16);
  }
  return result;
}

uint64_t ccrng_getentropy_generate(int a1, unint64_t a2, char *buffer)
{
  if (a2)
  {
    unint64_t v4 = a2;
    do
    {
      if (v4 >= 0x100) {
        size_t v5 = 256;
      }
      else {
        size_t v5 = v4;
      }
      if (getentropy(buffer, v5) == -1) {
        cc_abort();
      }
      buffer += v5;
      v4 -= v5;
    }
    while (v4);
  }
  return 0;
}

void *ccsha256_di()
{
  return &ccsha256_vng_arm_di;
}

uint64_t ccdrbg_df_derive_keys(uint64_t (**a1)(void), uint64_t a2, uint64_t a3, rsize_t a4, void *a5)
{
  uint64_t v7 = (*a1)();
  if (v7) {
    cc_clear(a4, a5);
  }
  return v7;
}

uint64_t ccdrbg_df_bc_derive_keys(uint64_t a1, uint64_t a2, uint64_t a3, size_t a4, void *a5)
{
  BOOL v32 = a5;
  uint64_t v9 = *(void **)(a1 + 8);
  size_t v10 = (*v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v33 = (char *)&v31 - v10;
  bzero((char *)&v31 - v10, v10);
  size_t v11 = (v9[1] + 15) & 0xFFFFFFFFFFFFFFF0;
  BOOL v12 = (char *)&v31 - v11;
  unsigned int v13 = 0;
  if (a2)
  {
    uint64_t v14 = (uint64_t *)(a3 + 8);
    uint64_t v15 = a2;
    do
    {
      uint64_t v16 = *v14;
      v14 += 2;
      v13 += v16;
      --v15;
    }
    while (v15);
  }
  bzero(v12, v11);
  __src[0] = 0;
  __src[1] = 0;
  unsigned int v43 = bswap32(v13);
  unsigned int v44 = bswap32(a4);
  long long v41 = xmmword_1001B9BC0;
  memset(v40, 0, sizeof(v40));
  uint64_t v17 = *(void *)(a1 + 16);
  v39[0] = 0;
  v39[1] = 0;
  unint64_t v37 = v17 + 16;
  if (v17 == -16)
  {
LABEL_13:
    uint64_t v23 = v33;
    uint64_t inited = cccbc_init_internal((uint64_t)v9);
    uint64_t v25 = v32;
    if (!inited)
    {
      if (!a4)
      {
LABEL_26:
        uint64_t v29 = 0;
        goto LABEL_27;
      }
      BOOL v26 = (void *)((char *)v40 + *(void *)(a1 + 16));
      while (1)
      {
        uint64_t v27 = (uint64_t)v26;
        cc_clear(*(void *)(*(void *)(a1 + 8) + 8), v12);
        BOOL v26 = a4 <= 0xF ? v39 : v25;
        uint64_t inited = cccbc_update_internal(*(void *)(a1 + 8), (uint64_t)v23, (uint64_t)v12, 1, v27, (uint64_t)v26);
        if (inited) {
          break;
        }
        if (a4 <= 0xF) {
          memcpy(v25, v26, a4);
        }
        if (a4 >= 0x10) {
          uint64_t v28 = 16;
        }
        else {
          uint64_t v28 = a4;
        }
        uint64_t v25 = (void *)((char *)v25 + v28);
        a4 -= v28;
        if (!a4) {
          goto LABEL_26;
        }
      }
    }
    uint64_t v29 = inited;
    goto LABEL_27;
  }
  uint64_t v36 = a2;
  unsigned int v18 = 0;
  unint64_t v19 = 0;
  size_t v34 = 16 - (((_BYTE)v13 + 8) & 0xF);
  uint64_t v35 = (size_t *)(a3 + 8);
  while (1)
  {
    cc_clear(*(void *)(*(void *)(a1 + 8) + 8), v12);
    LODWORD(__src[0]) = bswap32(v18);
    uint64_t v38 = 0;
    uint64_t updated = update_0(*(void *)(a1 + 8), a1 + 32, (uint64_t)v12, (uint64_t)&v40[v19 / 0x10], &v38, 0x18uLL, (char *)__src);
    if (updated) {
      break;
    }
    uint64_t v21 = v35;
    uint64_t v22 = v36;
    if (v36)
    {
      do
      {
        uint64_t updated = update_0(*(void *)(a1 + 8), a1 + 32, (uint64_t)v12, (uint64_t)&v40[v19 / 0x10], &v38, *v21, (char *)*(v21 - 1));
        if (updated) {
          goto LABEL_28;
        }
        v21 += 2;
      }
      while (--v22);
    }
    uint64_t updated = update_0(*(void *)(a1 + 8), a1 + 32, (uint64_t)v12, (uint64_t)&v40[v19 / 0x10], &v38, v34, (char *)&v41);
    if (updated) {
      break;
    }
    ++v18;
    v19 += 16;
    if (v19 >= v37)
    {
      uint64_t v9 = *(void **)(a1 + 8);
      goto LABEL_13;
    }
  }
LABEL_28:
  uint64_t v29 = updated;
  uint64_t v23 = v33;
LABEL_27:
  cc_clear(**(void **)(a1 + 8), v23);
  cc_clear(*(void *)(*(void *)(a1 + 8) + 8), v12);
  return v29;
}

uint64_t update_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, size_t __n, char *__src)
{
  uint64_t v7 = __src;
  size_t v8 = __n;
  unint64_t v14 = 16 - *a5;
  if (*a5) {
    BOOL v15 = __n >= v14;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15)
  {
    memcpy((void *)(a4 + *a5), __src, 16 - *a5);
    uint64_t result = cccbc_update_internal(a1, a2, a3, 1, a4, a4);
    if (result) {
      return result;
    }
    v8 -= v14;
    v7 += v14;
    *a5 = 0;
  }
  if (v8 < 0x10)
  {
LABEL_11:
    if (v8)
    {
      memcpy((void *)(a4 + *a5), v7, v8);
      uint64_t result = 0;
      *a5 += v8;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = cccbc_update_internal(a1, a2, a3, 1, (uint64_t)v7, a4);
      if (result) {
        break;
      }
      v8 -= 16;
      v7 += 16;
      if (v8 <= 0xF) {
        goto LABEL_11;
      }
    }
  }
  return result;
}

uint64_t ccdrbg_df_bc_init_internal(void *a1, void *a2, unint64_t a3)
{
  uint64_t v3 = 4294967291;
  if (a3 <= 0x20 && *a2 <= 0x200uLL)
  {
    if (a2[1] == 16)
    {
      *a1 = ccdrbg_df_bc_derive_keys;
      a1[1] = a2;
      a1[2] = a3;
      return cccbc_init_internal((uint64_t)a2);
    }
    else
    {
      return 4294967291;
    }
  }
  return v3;
}

void *cc_malloc_clear(size_t a1)
{
  unint64_t v2 = malloc(a1);
  uint64_t v3 = v2;
  if (v2) {
    bzero(v2, a1);
  }
  return v3;
}

uint64_t cc_ws_alloc(void *a1, uint64_t a2)
{
  unint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  uint64_t v4 = *a1 + 8 * v2;
  unint64_t v5 = v2 + a2;
  a1[2] = v5;
  cc_try_abort_if (v5 > v3);
  return v4;
}

void cc_ws_free(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
}

uint64_t ccmode_ccm_init(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 72);
  *a2 = v2;
  (*(void (**)(void))(v2 + 16))();
  return 0;
}

uint64_t ccctr_context_size(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ccctr_init_internal(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t ccctr_update_internal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40))(a2, a3, a4, a5);
}

uint64_t ccmode_ccm_set_iv(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7)
{
  if (*(void *)(*(void *)a1 + 8) != 16) {
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)(a2 + 64) = 1;
  cc_clear(0x10uLL, (void *)(a2 + 48));
  *(_DWORD *)(a2 + 68) = 0;
  if ((unint64_t)(a5 - 17) < 0xFFFFFFFFFFFFFFF3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if ((a5 & 1) == 0)
  {
    unint64_t v14 = 15 - a3;
    if (6 - a3 >= 0xFFFFFFFFFFFFFFF9 && a3 >= 7 && a3 <= 0xD)
    {
      BOOL v15 = v14 >= 8 || a7 >> (8 * v14) == 0;
      BOOL v16 = !v15;
      if (!HIDWORD(a6) && !v16)
      {
        *(unsigned char *)(a2 + 16) = (((4 * a5) & 0xF8) - 8) | ((a6 != 0) << 6) | (14 - a3);
        *(void *)(a2 + 80) = a3;
        *(void *)(a2 + 88) = a5;
        uint64_t v17 = (unsigned char *)(a2 + 17);
        __memcpy_chk();
        unsigned int v18 = (unsigned char *)(a2 + 31);
        unint64_t v19 = 15 - a3;
        do
        {
          *v18-- = a7;
          a7 >>= 8;
          --v19;
        }
        while (v19);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 24))(a1 + 8, 1, a2 + 16, a2 + 16);
        *(unsigned char *)a2 = 14 - a3;
        __memcpy_chk();
        cc_clear(15 - a3, (void *)(a2 + 1 + a3));
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 24))(a1 + 8, 1, a2, a2 + 32);
        if (a6)
        {
          if (a6 >> 8 > 0xFE)
          {
            v22.i32[1] = -1;
            int16x8_t v23 = (int16x8_t)vshlq_u64((uint64x2_t)vdupq_n_s64(a6), (uint64x2_t)xmmword_1001B9BF0);
            *(int32x2_t *)v23.i8 = vmovn_s64((int64x2_t)v23);
            v22.i32[0] = *(_DWORD *)(a2 + 16);
            v24.i32[0] = 16646399;
            v24.i16[2] = v23.i16[0];
            v24.i16[3] = v23.i16[2];
            *(int8x8_t *)v23.i8 = veor_s8((int8x8_t)*(_OWORD *)&vmovl_u8(v22), v24);
            *(_DWORD *)(a2 + 16) = vmovn_s16(v23).u32[0];
            *(unsigned char *)(a2 + 20) ^= BYTE1(a6);
            uint64_t v17 = (unsigned char *)(a2 + 21);
            int v20 = 6;
          }
          else
          {
            *(unsigned char *)(a2 + 16) ^= BYTE1(a6);
            int v20 = 2;
          }
          *v17 ^= a6;
          int v21 = 4;
        }
        else
        {
          int v20 = 0;
          int v21 = 5;
        }
        uint64_t result = 0;
        *(_DWORD *)(a2 + 72) = v20;
        *(_DWORD *)(a2 + 64) = v21;
      }
    }
  }
  return result;
}

uint64_t ccmode_ccm_macdata(uint64_t result, uint64_t a2, int a3, unint64_t a4, uint64_t a5)
{
  uint64_t v8 = result;
  unsigned int v9 = *(_DWORD *)(*(void *)result + 8);
  if (a3)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)result + 24))(result + 8, 1, a2 + 16, a2 + 16);
    unsigned int v10 = 0;
    *(_DWORD *)(a2 + 72) = 0;
  }
  else
  {
    unsigned int v10 = *(_DWORD *)(a2 + 72);
  }
  uint64_t v17 = a2;
  if (a4)
  {
    unint64_t v11 = 0;
    uint64_t v12 = a2 + 16;
    uint64_t v13 = a5 - 1;
    uint64_t v14 = a2 + 15;
    do
    {
      if (a4 - v11 >= v9 - v10) {
        unint64_t v15 = v9 - v10;
      }
      else {
        unint64_t v15 = a4 - v11;
      }
      if (v15)
      {
        unint64_t v16 = v15;
        do
        {
          *(unsigned char *)(v14 + v10 + v16) ^= *(unsigned char *)(v13 + v11 + v16);
          --v16;
        }
        while (v16);
      }
      unsigned int v10 = (v10 + v15) % v9;
      if (!v10) {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v8 + 24))(v8 + 8, 1, v12, v12);
      }
      v11 += v15;
    }
    while (v11 < a4);
  }
  *(_DWORD *)(v17 + 72) = v10;
  return result;
}

uint64_t ccmode_ccm_cbcmac(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a3 && *(_DWORD *)(a2 + 64) != 4) {
    return 4294967228;
  }
  ccmode_ccm_macdata(a1, a2, 0, a3, a4);
  return 0;
}

uint64_t ccmode_ccm_crypt(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3)
  {
    uint64_t v9 = result;
    uint64_t v10 = 0;
    unint64_t v11 = *(void *)(*(void *)result + 8);
    uint64_t v12 = *(void *)(a2 + 80);
    uint64_t v19 = (v11 + ~v12);
    uint64_t v13 = result + 8;
    uint64_t v14 = a2 + 48;
    unint64_t v15 = *(unsigned int *)(a2 + 68);
    uint64_t v16 = a2 + v12;
    do
    {
      if (!v15)
      {
        uint64_t v17 = v19;
        do
        {
          if ((int)v17 < 1) {
            break;
          }
          __int16 v18 = (*(unsigned char *)(v16 + v17--))++ + 1;
        }
        while ((v18 & 0x100) != 0);
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v9 + 24))(v13, 1, a2, v14);
        unint64_t v15 = *(unsigned int *)(a2 + 68);
      }
      *(unsigned char *)(a5 + v10) = *(unsigned char *)(a2 + v15 + 48) ^ *(unsigned char *)(a4 + v10);
      unint64_t v15 = (*(_DWORD *)(a2 + 68) + 1) % v11;
      *(_DWORD *)(a2 + 68) = v15;
      ++v10;
    }
    while (v10 != a3);
  }
  return result;
}

uint64_t ccmode_ccm_finalize(uint64_t a1, uint64_t a2, void *__dst)
{
  if (*(_DWORD *)(a2 + 64) == 1) {
    return 4294967228;
  }
  if (*(_DWORD *)(a2 + 72)) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 24))(a1 + 8, 1, a2 + 16, a2 + 16);
  }
  for (uint64_t i = *(void *)(*(void *)a1 + 8); i; --i)
    *(unsigned char *)(a2 + i + 31) ^= *(unsigned char *)(a2 + i + 15);
  memcpy(__dst, (const void *)(a2 + 32), *(void *)(a2 + 88));
  return 0;
}

uint64_t ccmode_ccm_reset(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 72) = 0;
  *(void *)(a2 + 80) = 0;
  *(void *)(a2 + 88) = 0;
  *(void *)(a2 + 64) = 1;
  return 0;
}

uint64_t ccec_generate_key_internal_fips_ws(uint64_t a1, uint64_t *a2, uint64_t (**a3)(void, uint64_t, uint64_t *), uint64_t **a4)
{
  uint64_t v8 = *a2;
  *a4 = a2;
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v8);
  uint64_t v11 = cczp_bitlen((uint64_t)a2);
  uint64_t result = (*a3)(a3, ((unint64_t)(v11 + 62) >> 3) & 0x1FFFFFFFFFFFFFF8, (uint64_t *)v10);
  if (!result)
  {
    uint64_t result = ccec_generate_scalar_fips_retry_ws(a1, a2, (uint64_t (**)(void, unint64_t, void *))a3, &a4[3 * **a4 + 2]);
    if (!result) {
      uint64_t result = ccec_make_pub_from_priv_ws(a1, a2, a3, (uint64_t)&a4[3 * **a4 + 2], 0, a4);
    }
  }
  *(void *)(a1 + 16) = v9;
  return result;
}

uint64_t ccec_validate_point_and_projectify_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *a2;
  uint64_t v9 = cczp_prime((uint64_t)a2);
  if ((int)ccn_cmp_internal(v8, v9, a4) < 1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = *a2;
  uint64_t v11 = a4 + 8 * *a2;
  uint64_t v12 = cczp_prime((uint64_t)a2);
  if ((int)ccn_cmp_internal(v10, v12, v11) < 1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = ccec_projectify_ws(a1, (uint64_t)a2);
  if (!result)
  {
    if (ccec_is_point_ws(a1, a2, a3)) {
      return 0;
    }
    else {
      return 4294967289;
    }
  }
  return result;
}

uint64_t ccn_cmp_asm(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  if (result)
  {
    unint64_t v3 = result;
    uint64_t result = 0;
    do
    {
      unint64_t v5 = *a2++;
      unint64_t v4 = v5;
      unint64_t v6 = *a3++;
      BOOL v7 = v4 >= v6;
      if (v4 > v6) {
        uint64_t result = 1;
      }
      if (!v7) {
        uint64_t result = -1;
      }
    }
    while (v3-- > 1);
  }
  return result;
}

uint64_t cc_disable_dit_with_sb(unsigned int *a1)
{
  return timingsafe_restore_if_supported(*a1);
}

void platform_connectionInfo_configStreamCategoryListReady_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, &_os_log_default, v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

void logObjectForModule_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _getSleepAssertionPluginInstance_cold_1()
{
  uint64_t v0 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___ACCPlatformSleepAssertionPluginProtocol);
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "[#SleepAssertions] Could not find plugin conforming to %@!", v3, v4, v5, v6, 2u);
}

void _getACPowerPluginInstance_cold_1()
{
  uint64_t v0 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___ACCPlatformIOKitPowerPluginProtocol);
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "[#SleepAssertions] Could not find plugin conforming to %@!", v3, v4, v5, v6, 2u);
}

void acc_nvmInfo_getPairingStatus_cold_1(uint64_t a1, int a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", (uint8_t *)&v2, 0x12u);
}

void _parseIdentificationParams_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pEndpoint == NULL", v2, v3, v4, v5, v6);
}

void _parseIdentificationParams_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pMsg == NULL", v2, v3, v4, v5, v6);
}

void _parseIdentificationParams_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pGroup == NULL", v2, v3, v4, v5, v6);
}

void _parseIdentificationParams_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "could not create DigitalCarKeyInfo feature", v2, v3, v4, v5, v6);
}

void _parseIdentificationParams_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ACCEndpoint == NULL", v2, v3, v4, v5, v6);
}

void _parseIdentificationParams_cold_6(unsigned __int16 a1, unsigned __int16 a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing required subparams in Param ID: %d for Msg ID: 0x%04X - ignoring message", (uint8_t *)v3, 0xEu);
}

void _parseIdentificationParams_cold_9(__int16 a1, uint64_t a2, NSObject *a3)
{
  LOWORD(v3) = 1024;
  HIWORD(v3) = a1;
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, a2, a3, "Too many subparams SubparamID: %d in Param ID: %d for Msg ID: 0x%04X - ignoring message", 67109632, v3, (unsigned __int16)a2);
}

void _parseIdentificationParams_cold_11()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v2);
}

void _parseIdentificationParams_cold_12()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Too many subparams SubparamID: %d in Param ID: %d for Msg ID: 0x%04X - ignoring message", v2, v3, v4);
}

void _parseIdentificationParams_cold_14()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v2, v3, v4);
}

void _parseIdentificationParams_cold_15()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Too many subparams SubparamID: %d in Param ID: %d for Msg ID: 0x%04X - ignoring message", v2, v3, v4);
}

void _parseIdentificationParams_cold_17()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v2, v3, v4);
}

void _parseIdentificationParams_cold_18()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Too many subparams SubparamID: %d in Param ID: %d for Msg ID: 0x%04X - ignoring message", v2, v3, v4);
}

void _parseIdentificationParams_cold_20()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v2, v3, v4);
}

void _parseIdentificationParams_cold_21()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Too many subparams SubparamID: %d in Param ID: %d for Msg ID: 0x%04X - ignoring message", v2, v3, v4);
}

void _parseIdentificationParams_cold_23()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v2, v3, v4);
}

void _parseIdentificationParams_cold_24()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Too many subparams SubparamID: %d in Param ID: %d for Msg ID: 0x%04X - ignoring message", v2, v3, v4);
}

void _parseIdentificationParams_cold_26()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v2, v3, v4);
}

void _parseIdentificationParams_cold_27()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Too many subparams SubparamID: %d in Param ID: %d for Msg ID: 0x%04X - ignoring message", v2, v3, v4);
}

void _parseIdentificationParams_cold_29()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v2, v3, v4);
}

void _parseIdentificationParams_cold_30()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Too many subparams SubparamID: %d in Param ID: %d for Msg ID: 0x%04X - ignoring message", v2, v3, v4);
}

void _parseIdentificationParams_cold_32()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v2, v3, v4);
}

void _parseIdentificationParams_cold_33()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Too many subparams SubparamID: %d in Param ID: %d for Msg ID: 0x%04X - ignoring message", v2, v3, v4);
}

void _parseIdentificationParams_cold_35()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v2, v3, v4);
}

void _parseIdentificationParams_cold_36()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "not a kiAP2ParamIdentificationInfo_VehicleDigitalCarKeyInfo parameter passed in!", v2, v3, v4, v5, v6);
}

void iap2_accAuthentication_certificate_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_accAuthentication_certificate_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __iap2_accAuthentication_certificate_block_invoke_2_cold_1(unsigned __int8 *a1, uint64_t a2, os_log_t log)
{
  int v3 = *a1;
  uint64_t v4 = *(unsigned __int16 *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 48);
  v6[0] = 67109632;
  v6[1] = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  __int16 v9 = 2048;
  uint64_t v10 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "iAP2 auth failed bCertValid:%d, pkNonceBytes:%04lX, nonceLen:%02lX\n", (uint8_t *)v6, 0x1Cu);
}

void iap2_accAuthentication_certSerial_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_accAuthentication_certSerial_cold_3(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "iap2_accAuthentication_certSerial";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s Ignoring serial number data with invalid length:0x%02lX", (uint8_t *)&v2, 0x16u);
}

void iap2_destinationSharing_StartDestinationInformation_cold_3(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v1, v2, "Too many params Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, v7);
}

void iap2_destinationSharing_StartDestinationInformation_cold_4(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, v7);
}

void iap2_destinationSharing_DestinationInformationStatus_cold_1(unsigned __int16 a1, uint64_t a2, NSObject *a3)
{
  v4[0] = 67109632;
  v4[1] = a1;
  __int16 v5 = 1024;
  int v6 = 2;
  __int16 v7 = 1024;
  int MsgID = iAP2MsgGetMsgID(a2);
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", (uint8_t *)v4, 0x14u);
}

void iap2_destinationSharing_DestinationInformationUpdateHandler_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "locale = %@", v2, v3, v4, v5, v6);
}

void iap2_destinationSharing_DestinationInformationUpdateHandler_cold_6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "entryPointsCount = %ld", v2, v3, v4, v5, v6);
}

void iap2_destinationSharing_DestinationInformationUpdateHandler_cold_9(void *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218240;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, (uint64_t)a2, a3, "dLatitude = %f, dLongitude = %f", *(double *)v3, *(double *)&v3[8]);
}

void iap2_destinationSharing_DestinationInformationUpdateHandler_cold_17()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "addressParamStr = %@", v2, v3, v4, v5, v6);
}

void iap2_destinationSharing_DestinationInformationUpdateHandler_cold_19()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v0, v1, "addressStrings = %@, addressStringsCount = %ld");
}

void _checkIdentificationInfo_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Identified for Destination Sharing", v1, 2u);
}

void oobPairing_endpoint_create_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pProtocolEndpoint = NULL", v1, 2u);
}

void oobPairing_endpoint_processIncomingData_cold_1(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown messageID %d", (uint8_t *)v2, 8u);
}

void oobPairing_endpoint_processIncomingData_cold_4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "oobPairing_endpoint_processIncomingData: call acc_manager_checkForWirelessCTA", v1, 2u);
}

void _invokeFeatureHandlerIterator_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = *(_DWORD *)(a1 + 8);
  int v4 = *(_DWORD *)(a2 + 28);
  uint64_t v5 = *(void *)(a2 + 16);
  v6[0] = 67109634;
  v6[1] = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Skipping invokeHandler (handlerType: %d) for %{coreacc:ACCEndpoint_Protocol_t}d endpoint %@!", (uint8_t *)v6, 0x18u);
}

void mfi4Auth_protocol_messageHandler_receiveIncomingData_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_messageHandler_receiveIncomingData_cold_9()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Data not passed in", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_messageHandler_receiveIncomingData_cold_11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_messageHandler_receiveIncomingData_cold_13()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Failed to decrypt message", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_messageHandler_receiveIncomingData_cold_17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_messageHandler_setEndpointSecureTunnelDataReceiveTypeHandler_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "missing auth session", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_messageHandler_setEndpointSecureTunnelDataReceiveTypeHandler_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "missing data to send out", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_messageHandler_setEndpointSecureTunnelDataReceiveTypeHandler_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_messageHandler_handleOutgoingSecureTunnelDataForClient_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_messageHandler_handleOutgoingSecureTunnelDataForClient_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_messageHandler_handleOutgoingSecureTunnelDataForClient_cold_9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __mfi4Auth_endpoint_setAccessoryUserName_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "setAccessoryUserName: !sessionClosed", v2, v3, v4, v5, v6);
}

void _mfi4Auth_endpoint_waitSessionClosed_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "waitSessionClosed: no RequestSessionOpen property", v2, v3, v4, v5, v6);
}

void _mfi4Auth_endpoint_waitSessionClosed_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "waitSessionClosed: no SessionOpen property", v2, v3, v4, v5, v6);
}

void _mfi4Auth_endpoint_waitSessionClosed_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "waitSessionClosed: SessionOpen not a BOOL", v2, v3, v4, v5, v6);
}

void _mfi4Auth_endpoint_waitSessionClosed_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "waitSessionClosed: RequestSessionOpen != false", v2, v3, v4, v5, v6);
}

void _mfi4Auth_endpoint_waitSessionClosed_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "waitSessionClosed: RequestSessionOpen not a BOOL", v2, v3, v4, v5, v6);
}

void __mfi4Auth_endpoint_getAccessoryUserName_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "getAccessoryUserName: !sessionClosed", v2, v3, v4, v5, v6);
}

void __mfi4Auth_endpoint_provisionPairing_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "provisionPairing: !sessionClosed", v2, v3, v4, v5, v6);
}

void __mfi4Auth_endpoint_erasePairing_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "erasePairing: !sessionClosed", v2, v3, v4, v5, v6);
}

void _mfi4Auth_endpoint_setNvmKeyValues_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "setNvmKeyValues: !sessionClosed", v2, v3, v4, v5, v6);
}

void __mfi4Auth_endpoint_getPublicNvmKeyValues_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "getPublicNvmKeyValues: !sessionClosed", v2, v3, v4, v5, v6);
}

void __mfi4Auth_endpoint_getPrivateNvmKeyValues_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "getPrivateNvmKeyValues: !sessionClosed", v2, v3, v4, v5, v6);
}

void __mfi4Auth_endpoint_beginVendorKeyErase_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "beginVendorKeyErase: !sessionClosed", v2, v3, v4, v5, v6);
}

void _mfi4Auth_endpoint_requestNvmErasePublicKey_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "endpoint_requestNvmErasePublicKey: no endpointUUID for endpoint!!", v2, v3, v4, v5, v6);
}

void _mfi4Auth_endpoint_requestNvmErasePublicKey_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "endpoint_requestNvmErasePublicKey: no endpoint for endpoint!!", v2, v3, v4, v5, v6);
}

void _mfi4Auth_endpoint_requestNvmErasePublicKey_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "endpoint_requestNvmErasePublicKey: protocol_requestNvmErasePublicKey failed", v2, v3, v4, v5, v6);
}

void __mfi4Auth_endpoint_beginUserKeyErase_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "beginUserKeyErase: !sessionClosed", v2, v3, v4, v5, v6);
}

void iAP2PacketRelease_cold_1()
{
}

void iAP2PacketGenerateBuffer_cold_2()
{
  __assert_rtn("iAP2PacketGenerateBuffer", "iAP2Packet.c", 1644, "packet->bufferLen == packet->packetLen");
}

void acc_endpoint_create_cold_5()
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, &_os_log_default, v0, "Make sure you have called init_logging_signposts() / init_logging()!\n module %d, gLogSignpostObjects: %p, gNumLogSignpostObjects: %d", v1, v2, v3, v4, v5);
}

void acc_endpoint_publish_cold_6()
{
  OUTLINED_FUNCTION_5_2(__stack_chk_guard);
  int v2 = 136315650;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_0((void *)&_mh_execute_header, v0, v1, "%s: endpoint %@, mikeyBusInfoDict %@", v2);
}

void acc_endpoint_publish_cold_8()
{
  OUTLINED_FUNCTION_5_2(__stack_chk_guard);
  int v2 = 136315650;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_0((void *)&_mh_execute_header, v0, v1, "%s: endpoint %@, aidInfo %@", v2);
}

void acc_endpoint_publish_cold_10()
{
  OUTLINED_FUNCTION_5_2(__stack_chk_guard);
  int v2 = 136315650;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_0((void *)&_mh_execute_header, v0, v1, "%s: endpoint %@, accInfoDict %@", v2);
}

void acc_endpoint_processIncomingData_cold_2(const __CFData *a1, uint64_t a2, NSObject *a3)
{
  CFIndex Length = CFDataGetLength(a1);
  uint64_t v6 = *(void *)(a2 + 16);
  int v7 = 134218242;
  CFIndex v8 = Length;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "No Passthrough pair, ignore %ld bytes of data for endpoint %@", (uint8_t *)&v7, 0x16u);
}

void acc_endpoint_processIncomingData_cold_7()
{
  OUTLINED_FUNCTION_5_2(__stack_chk_guard);
  OUTLINED_FUNCTION_7_0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Endpoint %@ isPassThrough(passthroughMode=%d)", v1, 0x12u);
}

void __acc_endpoint_setupPassthroughPair_cold_1()
{
  OUTLINED_FUNCTION_5_2(__stack_chk_guard);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v0, v1, "setupPassthroughPair (Device) for endpoint %@, endpointCount=%ld");
}

void __acc_endpoint_setupPassthroughPair_cold_3()
{
  OUTLINED_FUNCTION_5_2(__stack_chk_guard);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "endpoint %@ is not a passthrough endpoint", (uint8_t *)&v2, 0xCu);
}

void __acc_endpoint_setupPassthroughPair_cold_5()
{
  OUTLINED_FUNCTION_5_2(__stack_chk_guard);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v0, v1, "setupPassthroughPair (Accessory) for endpoint %@, endpointCount=%ld");
}

void __acc_endpoint_setupPassthroughPair_cold_7()
{
  OUTLINED_FUNCTION_5_2(__stack_chk_guard);
  OUTLINED_FUNCTION_7_0();
  __int16 v4 = v0;
  int v5 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "setupPassthroughPair for endpoint %@, validPassthroughPair=%d passthroughMode=%d", v3, 0x18u);
}

void acc_endpoint_sendOutgoingData_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pEndpoint = NULL", v1, 2u);
}

void acc_endpoint_sendOutgoingData_cold_2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pEndpoint->pConnection = NULL", v1, 2u);
}

void _setupComponentList_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "_setupComponentList: transportComponent is NULL", buf, 2u);
}

void _setupComponentList_cold_2(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "_setupComponentList: transportComponents contains %ld entries", (uint8_t *)&v2, 0xCu);
}

void acc_authInfo_setCertData_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void acc_authInfo_setStatus_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_AvailableDigitalCarKeys_cold_2(uint64_t a1, NSObject *a2)
{
  v3[0] = 67109376;
  v3[1] = 0;
  __int16 v4 = 1024;
  int MsgID = iAP2MsgGetMsgID(a1);
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", (uint8_t *)v3, 0xEu);
}

void _checkIdentificationInfo_cold_1_0(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Identified for Digital Car Key Matching", v1, 2u);
}

void _checkIdentificationInfo_cold_3(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "digital car key matching is only available on the AirPlay transport", v1, 2u);
}

#error "10018A594: call analysis failed (funcsize=54)"

#error "10018A674: call analysis failed (funcsize=54)"

#error "10018A728: call analysis failed (funcsize=41)"

#error "10018A7D4: call analysis failed (funcsize=41)"

#error "10018A8AC: call analysis failed (funcsize=54)"

#error "10018A960: call analysis failed (funcsize=41)"

#error "10018AA0C: call analysis failed (funcsize=41)"

#error "10018AAB8: call analysis failed (funcsize=41)"

void acc_manager_getConnectionWithUUID_cold_1()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "%s:%d connectionUUID %@, deprecated, should use acc_manager_callbackForConnection", v2, v3, v4, v5, 2u);
}

void acc_manager_iterateAllConnections_cold_1(char a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "acc_manager_iterateAllConnections";
  __int16 v4 = 1024;
  int v5 = 556;
  __int16 v6 = 1024;
  int v7 = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s:%d iteratorCalled %d ", (uint8_t *)&v2, 0x18u);
}

void acc_manager_iterateAllEndpoints_cold_1(char a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "acc_manager_iterateAllEndpoints";
  __int16 v4 = 1024;
  int v5 = 601;
  __int16 v6 = 1024;
  int v7 = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s:%d iteratorCalled %d ", (uint8_t *)&v2, 0x18u);
}

void acc_manager_callbackForConnection_cold_1()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, v0, v1, "%s:%d connection %@, iteratorCalled %d ");
}

void acc_manager_callbackForConnection_cold_3()
{
  LODWORD(v2) = 136315906;
  *(void *)((char *)&v2 + 4) = "acc_manager_callbackForConnection";
  WORD6(v2) = 1024;
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, v0, v1, "%s:%d call iteratorCB, connection %@, context %d ", v2);
}

void acc_manager_callbackForEndpoint_cold_1()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, v0, v1, "%s:%d endpoint %@, iteratorCalled %d ");
}

void acc_manager_callbackForEndpoint_cold_3()
{
  LODWORD(v2) = 136315906;
  *(void *)((char *)&v2 + 4) = "acc_manager_callbackForEndpoint";
  WORD6(v2) = 1024;
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, v0, v1, "%s:%d call iteratorCB, endpoint %@, context %d ", v2);
}

void acc_manager_copyEndpointUUIDsForConnection_cold_1()
{
  v3[0] = 136315906;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5_3();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s:%d connectionUUID %@, endpointUUIDs %@ ", (uint8_t *)v3, 0x26u);
}

void acc_manager_copyEndpointUUIDsForConnection_cold_3()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "%s:%d connectionUUID %@ ", v2, v3, v4, v5, 2u);
}

void acc_manager_getEndpointWithUUID_cold_1()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "%s:%d endpointUUID %@, deprecated, should use acc_manager_callbackForEndpoint", v2, v3, v4, v5, 2u);
}

void acc_manager_enableLockoutForTransportType_cold_3(int a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid transport type: %{coreacc:ACCEndpoint_TransportType_t}d or timeout value: %u!", (uint8_t *)v3, 0xEu);
}

void acc_manager_isLockoutActiveForTransportType_cold_1(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Invalid transport type: %{coreacc:ACCEndpoint_TransportType_t}d!", (uint8_t *)v2, 8u);
}

void _CFDictionaryApplierFunction_findWirelessCTADonorCapableConnection_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "findWirelessCTADonorCapableConnection: donorConnectionsFound %@", (uint8_t *)&v2, 0xCu);
}

void _CFDictionaryApplierFunction_findWirelessCTADonorCapableConnection_cold_4()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, v0, v1, "%s:%d identifier %@, isBdAddrFormat %d");
}

void _CFDictionaryApplierFunction_findWirelessCTADonorCapableConnection_cold_6(uint64_t a1)
{
  acc_endpoint_getParentConnection(a1);
  acc_connection_isAuthenticated(a1, 6);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_13_0((void *)&_mh_execute_header, v2, v3, "findWirelessCTADonorCapableConnection: %@ type %{coreacc:ACCConnection_Type_t}d, isAuthenticated %d, ident: %@", v4, v5, v6, v7, v8);
}

void _CFDictionaryApplierFunction_findWirelessCTAReceiverCapableConnection_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  acc_endpoint_getParentConnection(a1);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_12_0((void *)&_mh_execute_header, a3, v4, "findWirelessCTAReceiverCapableConnection: %@ type %{coreacc:ACCConnection_Type_t}d", v5);
}

void _CFDictionaryApplierFunction_findOOBPairingEndpoint_cold_1()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_12_0((void *)&_mh_execute_header, v0, (uint64_t)v0, "findOOBPairingEndpoint: %@ protocol %{coreacc:ACCEndpoint_Protocol_t}d", v1);
}

void _CFDictionaryApplierFunction_findInductiveCTADonorCapableConnection_cold_2(uint64_t a1)
{
  acc_endpoint_getParentConnection(a1);
  acc_connection_isAuthenticated(a1, 6);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_13_0((void *)&_mh_execute_header, v2, v3, "findInductiveCTADonorCapableConnection: %@ type %{coreacc:ACCConnection_Type_t}d, isAuthenticated %d, ident: %@", v4, v5, v6, v7, v8);
}

void _CFDictionaryApplierFunction_findInductiveCTAReceiverCapableConnection_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  acc_endpoint_getParentConnection(a1);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_12_0((void *)&_mh_execute_header, a3, v4, "findInductiveCTAReceiverCapableConnection: %@ type %{coreacc:ACCConnection_Type_t}d", v5);
}

void _CFDictionaryApplierFunction_findInductiveAuthEndpoint_cold_1()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_12_0((void *)&_mh_execute_header, v0, (uint64_t)v0, "findInductiveAuthEndpoint: %@ protocol %{coreacc:ACCEndpoint_Protocol_t}d", v1);
}

void iap2_sessionFileTransfer_cleanUpRemoveTransferList_cold_1()
{
  OUTLINED_FUNCTION_4_4(__stack_chk_guard);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_6((void *)&_mh_execute_header, v1, v2, "iap2_sessionFileTransfer_cleanUpRemoveTransferList: %@ removed %u items", (void)v3, DWORD2(v3));
}

void iap2_sessionFileTransfer_cleanUpRemoveTransferList_cold_3()
{
  OUTLINED_FUNCTION_4_4(__stack_chk_guard);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "iap2_sessionFileTransfer_cleanUpRemoveTransferList: %@", (uint8_t *)&v2, 0xCu);
}

void iap2_sessionFileTransfer_findTransferEntry_cold_2()
{
  OUTLINED_FUNCTION_4_4(__stack_chk_guard);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_6((void *)&_mh_execute_header, v1, v2, "iap2_sessionFileTransfer_findTransferEntry: %@ bufferID=%u, use inTransferList", (void)v3, DWORD2(v3));
}

void iap2_sessionFileTransfer_findTransferEntry_cold_4()
{
  OUTLINED_FUNCTION_4_4(__stack_chk_guard);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_6((void *)&_mh_execute_header, v1, v2, "iap2_sessionFileTransfer_findTransferEntry: %@ bufferID=%u, use outTransferList", (void)v3, DWORD2(v3));
}

void iap2_sessionFileTransfer_findTransferEntryForFeature_cold_1(unsigned __int8 *a1, NSObject *a2)
{
  int v2 = *a1;
  int v3 = *((_DWORD *)a1 + 1);
  BOOL v4 = *((void *)a1 + 2) != 0;
  v5[0] = 67109632;
  v5[1] = v2;
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 1024;
  BOOL v9 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Failed to find transfer! compareItem(bufferID=%u type=%d context(%d))", (uint8_t *)v5, 0x14u);
}

void iap2_sessionFileTransfer_findTransferEntryForFeature_cold_3()
{
  OUTLINED_FUNCTION_4_4(__stack_chk_guard);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_6((void *)&_mh_execute_header, v1, v2, "iap2_sessionFileTransfer_findTransferEntryForFeature: %@ dir=%xh, use inTransferList", (void)v3, DWORD2(v3));
}

void iap2_sessionFileTransfer_findTransferEntryForFeature_cold_5()
{
  OUTLINED_FUNCTION_4_4(__stack_chk_guard);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_6((void *)&_mh_execute_header, v1, v2, "iap2_sessionFileTransfer_findTransferEntryForFeature: %@ dir=%xh, use outTransferList", (void)v3, DWORD2(v3));
}

void platform_iapd_bridge_accessory_connected_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "[#iapd Bridge] ignoring authenticated flag for iAP1 bridge", v2, v3, v4, v5, v6);
}

void iAP2TimeCreate_cold_1()
{
  __assert_rtn("iAP2TimeCreate", "iAP2Time.c", 606, "timeBuff != NULL");
}

void iAP2TimeCreate_cold_2()
{
  __assert_rtn("iAP2TimeCreate", "iAP2Time.c", 607, "expiredCB != NULL");
}

void iAP2TimeCreate_cold_3()
{
  __assert_rtn("iAP2TimeCreate", "iAP2Time.c", 608, "maxTimeouts != INVALID_TIMEOUT_ID");
}

void iAP2TimeCreate_cold_4()
{
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void audioProductCerts_endpoint_create_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pConnection = NULL", v1, 2u);
}

void audioProductCerts_endpoint_publish_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void audioProductCerts_endpoint_publish_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handlePropertiesDidChange_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v1, v2, "PropertiesDidchange: new %@, old %@", (void)v3, DWORD2(v3));
}

void _audioProductCerts_endpoint_handlePropertiesDidChange_cold_3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v1, v2, "Notification received %@, userInfo: %@", (void)v3, DWORD2(v3));
}

void _audioProductCerts_endpoint_processIncomingData_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = *(_DWORD *)(a1 + 24);
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "audioProductCerts processIncomingData: Unexpected data from %{coreacc:ACCEndpoint_TransportType_t}d dataIn %@", (uint8_t *)v4, 0x12u);
}

void audioProductCerts_endpoint_propertyDidChange_cold_2(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = *(void *)(a1 + 16);
  }
  else {
    uint64_t v1 = 0;
  }
  LODWORD(v4) = 138412546;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v2, v3, "PropertyDidchange: %@, value %@", (void)v4, DWORD2(v4));
}

void audioProductCerts_endpoint_propertyDidChange_cold_4(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = *(void *)(a1 + 16);
  }
  else {
    uint64_t v1 = 0;
  }
  LODWORD(v4) = 138412546;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v2, v3, "PropertyDidchange: %@, key %@", (void)v4, DWORD2(v4));
}

void audioProductCerts_endpoint_propertyDidChange_cold_9(uint64_t a1, CFTypeRef cf, NSObject *a3)
{
  CFTypeID v6 = CFGetTypeID(cf);
  LODWORD(v6) = v6 == CFNumberGetTypeID();
  CFTypeID v7 = CFGetTypeID(cf);
  int v8 = 136315906;
  BOOL v9 = "_audioProductCerts_endpoint_validKeyValueType";
  __int16 v10 = 2112;
  uint64_t v11 = a1;
  __int16 v12 = 1024;
  int v13 = v6;
  __int16 v14 = 1024;
  BOOL v15 = v7 == CFBooleanGetTypeID();
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%s: %@ is number(%d)/BOOLean(%d) type", (uint8_t *)&v8, 0x22u);
}

void audioProductCerts_endpoint_propertyDidChange_cold_11()
{
  v1[0] = 136315394;
  OUTLINED_FUNCTION_9_0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: %@ is array type", (uint8_t *)v1, 0x16u);
}

void audioProductCerts_endpoint_propertyDidChange_cold_13(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "PropertyDidchange: key / value types are invalid!", v1, 2u);
}

void audioProductCerts_endpoint_propertyDidChange_cold_14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void audioProductCerts_endpoint_propertyDidChange_cold_16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthCertList_cold_1()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10_1((void *)&_mh_execute_header, v0, v1, "%s: %@, Unable to allocate authChallengeList!", v2, v3, v4, v5, 2u);
}

void _audioProductCerts_endpoint_handleAuthResponseList_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleMissingCertList_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleMissingCertList_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleMissingCertList_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleMissingCertList_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleMissingCertList_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleMissingCertList_cold_15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleMissingCertList_cold_16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void audioProductCerts_endpoint_propertiesDidChange_cold_3()
{
  OUTLINED_FUNCTION_7_3(__stack_chk_guard);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v1, v2, "PropertiesDidchange: %@, %@", (void)v3, DWORD2(v3));
}

void _CFArrayApplierFunction_parseEntries_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_getSerialEntryIndexInCertList_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  long long v3 = "_audioProductCerts_endpoint_getSerialEntryIndexInCertList";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: resultIndex %ld", (uint8_t *)&v2, 0x16u);
}

void _audioProductCerts_endpoint_generateAuthChallenge_cold_1()
{
  OUTLINED_FUNCTION_7_3(__stack_chk_guard);
  v2[0] = 136315650;
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_11_1((void *)&_mh_execute_header, v0, v1, "%s: %@, currentAuthChallengeNonce %@", (uint8_t *)v2);
}

void _audioProductCerts_endpoint_generateAuthChallenge_cold_3()
{
  OUTLINED_FUNCTION_7_3(__stack_chk_guard);
  v2[0] = 136315650;
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_11_1((void *)&_mh_execute_header, v0, v1, "%s: %@, currentAuthChallenge %@", (uint8_t *)v2);
}

void _audioProductCerts_endpoint_generateAuthChallenge_cold_5()
{
  OUTLINED_FUNCTION_7_3(__stack_chk_guard);
  v3[0] = 136315650;
  OUTLINED_FUNCTION_5_4();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_11_1((void *)&_mh_execute_header, v2, (uint64_t)v2, "%s: %@, authChallenge %@", (uint8_t *)v3);
}

void _audioProductCerts_endpoint_generateAuthChallenge_cold_7()
{
  OUTLINED_FUNCTION_7_3(__stack_chk_guard);
  v1[0] = 136315650;
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_11_1((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: %@, authPendingList %@", (uint8_t *)v1);
}

void _audioProductCerts_endpoint_handlePrimaryBudMismatch_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handlePrimaryBudMismatch_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_validateChallenge_cold_1()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10_1((void *)&_mh_execute_header, v0, v1, "%s: %@, Failed to create authState property value!", v2, v3, v4, v5, 2u);
}

void _audioProductCerts_endpoint_validateChallenge_cold_6()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10_1((void *)&_mh_execute_header, v0, v1, "%s: %@, Failed to create blob from nonce!", v2, v3, v4, v5, 2u);
}

void _audioProductCerts_endpoint_validateChallenge_cold_8()
{
  v3[0] = 136315650;
  OUTLINED_FUNCTION_9_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: Unable to create blob!!! (%@, %@)", (uint8_t *)v3, 0x20u);
}

void _audioProductCerts_endpoint_validateChallenge_cold_17()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_10_1((void *)&_mh_execute_header, v0, v1, "%s: Unable to create truncated signature!!! %@", v2, v3, v4, v5, 2u);
}

void iAP2LinkProcessInOrderPacketCMD_cold_1(unsigned __int8 *a1, unsigned __int8 a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = 136316162;
  uint64_t v5 = "iAP2LinkProcessInOrderPacketCMD";
  __int16 v6 = 1024;
  int v7 = 100;
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 1024;
  int v11 = a2;
  __int16 v12 = 1024;
  int v13 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s:%d linkVer=%d cmdID=%xh(%d) not supported link version!", (uint8_t *)&v4, 0x24u);
}

void iAP2LinkProcessInOrderPacketCMD_cold_3(int a1, NSObject *a2)
{
  int v2 = 136315650;
  int v3 = "iAP2LinkProcessInOrderPacketCMD";
  __int16 v4 = 1024;
  int v5 = 119;
  __int16 v6 = 1024;
  int v7 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s:%d Unsupported control packet type=%d", (uint8_t *)&v2, 0x18u);
}

void _convertUserVendorNVMRead_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertUserVendorNVMRead_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMEraseResponse_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMEraseResponse_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "processIncomingData: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMEraseResponse_cold_8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertNVMEraseResponse_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertNVMEraseResponse_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMReadResponse_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMReadResponse_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMReadResponse_cold_13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertNVMReadResponse_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertNVMReadResponse_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertNVMReadResponse_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _handleNvmReadAccessoryInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _handleNvmReadAccessoryInfo_cold_15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _handleNvmReadUserPublicKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _handleNvmReadUserPublicKey_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _replyGetNVMKey_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMAuthStart_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMAuthStart_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMWriteResponse_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMWriteResponse_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMWriteResponse_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertNVMWriteResponse_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertNVMWriteResponse_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestUserNVMWrite_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestUserNVMWrite_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestUserNVMWrite_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestUserNVMWrite_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestUserNVMWrite_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_1()
{
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "handle_NVMPublicKeyChallenge: failed: %d", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_8()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handle_NVMPublicKeyChallenge: !authNonceRef", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_9()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handle_NVMPublicKeyChallenge: !isProgrammed", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_10()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handle_NVMPublicKeyChallenge: !kMFi4_Area51_NVM_User_PublicKey", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_12()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handle_NVMPublicKeyChallenge: BeginUserKeyErase: !authNonceRef", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_13()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handle_NVMPublicKeyChallenge: BeginUserKeyErase: !isProgrammed", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_14()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handle_NVMPublicKeyChallenge: BeginUserKeyErase: !kMFi4_Area51_NVM_User_PublicKey", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMWritePublicKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMWritePublicKey_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMWritePublicKey_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMWritePublicKey_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMWritePublicKey_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMErasePublicKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMErasePublicKey_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMErasePublicKey_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMErasePublicKey_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMAuthStart_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMAuthStart_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMAuthStart_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMAuthStart_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handle_NVMAuthStart: initSigmaContextNvm error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMAuthStart_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initSigmaContextNvm_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initSigmaContextNvm_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "!sigmaContextNvm", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContextNvm_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "!rng", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContextNvm_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ccsigma_init: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContextNvm_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_5()
{
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "handle_NVMAuthFinish: initMessage_RequestNVMOperation failed: %d", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_7()
{
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "handle_NVMAuthFinish: encryptPayload failed: %d", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_9()
{
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "handle_NVMAuthFinish: initMessage_RequestNVMPublicKeyChallenge failed: %d", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_17()
{
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "handle_NVMAuthFinish: ccsigma_open failed: %d", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_19()
{
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "handle_NVMAuthFinish: ccsigma_verify error: %d", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_22()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handle_NVMAuthFinish: ccsigma_import_peer_verification_key error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_26(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMPublicKeyChallenge_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMPublicKeyChallenge_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMOperation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMOperation_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMOperation_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMOperationResponse_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMOperationResponse_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMOperationResponse_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMOperationResponse_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handle_NVMOperationResponse: initMessage_RequestNVMOperation: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMOperationResponse_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handle_NVMOperationResponse: encryptPayload: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMOperationResponse_cold_6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handle_NVMOperationResponse: processIncomingData: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMOperationResponse_cold_7()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handle_NVMOperationResponse: decryptPayload: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_NVMOperationResponse_cold_9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_parse_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_parse_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_parse_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_parse_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestVendorNVMRead_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestVendorNVMRead_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestVendorNVMRead_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestManufacturerNVMRead_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestManufacturerNVMRead_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestManufacturerNVMRead_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertUserNVMWrite_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertUserNVMWrite_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_requestNvmErasePublicKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_requestNvmErasePublicKey_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_nvm_copyUserPublicKeyForSerialNumber_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "copyUserPublicKeyForSerialNumber: failed", v2, v3, v4, v5, v6);
}

void _getCachedUserPublicKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _getCachedUserPublicKey_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_convertUserAccessoryInfoToAction_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_convertUserAccessoryInfoToAction_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _generateUserAccessoryInfoPayload_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _generateUserAccessoryInfoPayload_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _generateUserAccessoryInfoPayload_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _getEndpointSampleRates_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "transportComponent is NULL", buf, 2u);
}

void t56_util_ios_getT56Endpoint_cold_1()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s:%d ERROR: Protocol context is NULL!!!!", v2, v3, v4, v5, 2u);
}

void t56_util_ios_getT56Endpoint_cold_3()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s:%d ERROR: Endpoint not found!!!!", v2, v3, v4, v5, 2u);
}

void t56_util_callbackOnTimer_cold_2()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s:%d ERROR: Timer not initialized!!!!", v2, v3, v4, v5, 2u);
}

void t56_util_callbackOnTimer_cold_4()
{
  *(_DWORD *)uint64_t v2 = 136315650;
  OUTLINED_FUNCTION_7_2();
  *(_DWORD *)&v2[7] = 241;
  v2[9] = v0;
  int v3 = 4;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s:%d ERROR: All available timers running!!!! %d", (uint8_t *)v2, 0x18u);
}

void t56_util_cancelTimer_cold_1()
{
  *(_DWORD *)int v3 = 136315650;
  OUTLINED_FUNCTION_7_2();
  *(_DWORD *)&int v3[7] = 261;
  v3[9] = v0;
  int v4 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s:%d ERROR: Timer %d not running!!!!", (uint8_t *)v3, 0x18u);
}

void acc_connection_create_cold_2()
{
  OUTLINED_FUNCTION_4_8();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging_signposts() / init_logging()!\n module %d, gLogSignpostObjects: %p, gNumLogSignpostObjects: %d", v0, 0x18u);
}

void acc_connection_setProperty_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "acc_connection_setProperty: call acc_manager_checkForInductiveCTA", v2, v3, v4, v5, v6);
}

void acc_connection_setProperty_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "acc_connection_setProperty: call acc_manager_checkForWirelessCTA", v2, v3, v4, v5, v6);
}

void acc_connection_publish_cold_3(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = "_checkForAdapterInfo";
  __int16 v6 = 1024;
  int v7 = 1505;
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  uint64_t v11 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s:%d Could not get adapterConnection for UUID %@ !!!  connection %@", (uint8_t *)&v4, 0x26u);
}

void acc_connection_publish_cold_9(uint64_t *a1, NSObject *a2)
{
  int v2 = *((unsigned __int16 *)a1 + 70);
  uint64_t v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v2;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%d EAService endpoints are now advertised for connection %@", (uint8_t *)v4, 0x12u);
}

void acc_connection_publish_cold_11()
{
  OUTLINED_FUNCTION_8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "No EA or EAServiceEndpointStats.EAServiceEndpointUUIDs", v1, 2u);
}

void acc_connection_destroy_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "acc_connection_destroy: call acc_manager_checkForInductiveCTA", v2, v3, v4, v5, v6);
}

void acc_connection_destroy_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "acc_connection_destroy: call acc_manager_checkForWirelessCTA", v2, v3, v4, v5, v6);
}

void acc_connection_setAuthStatus_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "acc_connection_setAuthStatus: auth passed for NFC connection, call acc_manager_checkForInductiveCTA", v2, v3, v4, v5, v6);
}

void acc_connection_setAuthStatus_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "acc_connection_setAuthStatus: auth passed for BT connection, call acc_manager_checkForWirelessCTA", v2, v3, v4, v5, v6);
}

void acc_connection_mapAccessoryInfo_cold_6()
{
  OUTLINED_FUNCTION_8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid endpoint for accessory info was specified!", v1, 2u);
}

void acc_connection_setProperties_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "acc_connection_setProperties: call acc_manager_checkForInductiveCTA", v2, v3, v4, v5, v6);
}

void acc_connection_setProperties_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "acc_connection_setProperties: call acc_manager_checkForWirelessCTA", v2, v3, v4, v5, v6);
}

void acc_connection_sendDataOut_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Sending outgoing data for connection %@...", (uint8_t *)&v3, 0xCu);
}

void platform_analytics_endpointAccessoryInfoDidChange_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void platform_analytics_endpointAccessoryInfoDidChange_cold_4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[#EventLogger] oldAccessoryInfo: %@, newAccessoryInfo: %@", (uint8_t *)&v3, 0x16u);
}

void __platform_analytics_endpointAccessoryInfoDidChange_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void acc_protocolParser_iAP2_run_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP2 validation failed!", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP2_run_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP2 Looking for SOP MSB...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP2_run_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP2 Looking for SOP LSB...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP2_run_cold_7()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP2 Looking for Length MSB...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP2_run_cold_9(unsigned __int16 *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "iAP2 Payload Length: %d", (uint8_t *)v3, 8u);
}

void acc_protocolParser_iAP2_run_cold_11(unsigned __int16 *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "iAP2 Packet Length: %d", (uint8_t *)v3, 8u);
}

void acc_protocolParser_iAP2_run_cold_13()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP2 Looking for Length LSB...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP2_run_cold_15()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP2 Looking for Control Byte...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP2_run_cold_17()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP2 Looking for Packet Sequence Number...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP2_run_cold_19()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP2 Looking for Packet Acknowledgement Number...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP2_run_cold_21()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP2 Looking for Session Identifier...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP2_run_cold_24()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP2 Looking for Header Checksum...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP2_run_cold_26()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP2 Looking for Payload...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP2_run_cold_30()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP2 Looking for Payload Checksum...", v2, v3, v4, v5, v6);
}

void iap2_wifisharing_AccessoryWiFiConfigurationInformation_cold_1(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_wifisharing_AccessoryWiFiConfigurationInformation_cold_2(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_wifisharing_AccessoryWiFiConfigurationInformation_cold_3(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_wifisharing_AccessoryWiFiConfigurationInformation_cold_4(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_wifisharing_AccessoryWiFiConfigurationInformation_cold_5(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _checkIdentificationInfo_cold_1_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Identified for Accessory WiFi Credentials Sharing", v1, 2u);
}

void _checkIdentificationInfo_cold_3_0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Identified for Device WiFi Credentials Sharing", v1, 2u);
}

void acc_protocolRouter_routeIncomingData_cold_1()
{
  OUTLINED_FUNCTION_4_9(__stack_chk_guard);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_10((void *)&_mh_execute_header, v0, v1, "Error routing incoming data for endpoint UUID: %@ with protocol: %{coreacc:ACCEndpoint_Protocol_t}d!");
}

void acc_protocolRouter_routeOutgoingSecureTunnelDataForClient_cold_1()
{
  OUTLINED_FUNCTION_4_9(__stack_chk_guard);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_10((void *)&_mh_execute_header, v0, v1, "Error routing incoming secure tunnel data for endpoint UUID: %@ with protocol: %{coreacc:ACCEndpoint_Protocol_t}d!");
}

void acc_protocolRouter_setSecureTunnelDataTypeHandler_cold_1()
{
  OUTLINED_FUNCTION_4_9(__stack_chk_guard);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_10((void *)&_mh_execute_header, v0, v1, "Error routing incoming handler for endpoint UUID: %@ with protocol: %{coreacc:ACCEndpoint_Protocol_t}d!");
}

void iAP2LinkRunLoopCreate_cold_1()
{
}

void iAP2LinkRunLoopCreate_cold_2()
{
}

void iAP2LinkRunLoopRunOnce_cold_1()
{
}

void iap2_navigation_startRouteGuidanceHandler_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, a2, a3, "iAP2Navigation StartRouteGuidance: for componentList=%@", a5, a6, a7, a8, 2u);
}

void iap2_navigation_startRouteGuidanceHandler_cold_4(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_navigation_startRouteGuidanceHandler_cold_5(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v1, v2, "Too many params Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_navigation_startRouteGuidanceHandler_cold_6(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_navigation_startRouteGuidanceHandler_cold_7(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v1, v2, "Too many params Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_navigation_startRouteGuidanceHandler_cold_8(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_navigation_startRouteGuidanceHandler_cold_9(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v1, v2, "Too many params Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_navigation_startRouteGuidanceHandler_cold_10(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_navigation_startRouteGuidanceHandler_cold_11(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v1, v2, "Too many params Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_navigation_startRouteGuidanceHandler_cold_12(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_navigation_startRouteGuidanceHandler_cold_13(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v1, v2, "Too many params Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_navigation_startRouteGuidanceHandler_cold_14(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_navigation_stopRouteGuidanceHandler_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, a2, a3, "iAP2Navigation StopRouteGuidance: for componentList=%@", a5, a6, a7, a8, 2u);
}

void iap2_navigation_roadObjectDetectionUpdateHandler_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_navigation_roadObjectDetectionUpdateHandler_cold_12(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _parseRoadSignParameter_cold_1()
{
  OUTLINED_FUNCTION_6_6();
  iAP2MsgGetParamID(v0);
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_11((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _parseRoadSignParameter_cold_3()
{
  OUTLINED_FUNCTION_6_6();
  iAP2MsgGetParamID(v0);
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_11((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _parseRoadSignParameter_cold_5()
{
  OUTLINED_FUNCTION_6_6();
  iAP2MsgGetParamID(v0);
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_11((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _parseRoadSignParameter_cold_7()
{
  OUTLINED_FUNCTION_6_6();
  iAP2MsgGetParamID(v0);
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_11((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _parseRoadSignParameter_cold_9()
{
  OUTLINED_FUNCTION_6_6();
  iAP2MsgGetParamID(v0);
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_11((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _parseRoadSignParameter_cold_11()
{
  OUTLINED_FUNCTION_6_6();
  iAP2MsgGetParamID(v0);
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_11((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _parseRoadLaneParameter_cold_13()
{
  OUTLINED_FUNCTION_6_6();
  iAP2MsgGetParamID(v0);
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_11((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _parseRoadLaneParameter_cold_15()
{
  OUTLINED_FUNCTION_6_6();
  iAP2MsgGetParamID(v0);
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_11((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _parseRoadLaneParameter_cold_18()
{
  OUTLINED_FUNCTION_6_6();
  iAP2MsgGetParamID(v0);
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_11((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _parseRoadLaneParameter_cold_21()
{
  OUTLINED_FUNCTION_6_6();
  iAP2MsgGetParamID(v0);
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_11((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _convertRouteGuidanceStateTypeForFunc_cold_1()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "unknown RouteGuidanceState %d !", v2, v3, v4, v5, v6);
}

void _convertManeuverStateTypeForFunc_cold_1()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "unknown ManeuverState %d !", v2, v3, v4, v5, v6);
}

void _convertDistaceUnitTypeForFunc_cold_1()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "unknown DistanceDisplayUnit %d !", v2, v3, v4, v5, v6);
}

void _convertManeuverTypeForFunc_cold_1()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "unknown ManeuverType %d !", v2, v3, v4, v5, v6);
}

void _convertDrivingSideTypeForFunc_cold_1()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "unknown DrivingSide %d !", v2, v3, v4, v5, v6);
}

void _convertJunctionTypeForFunc_cold_1()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "unknown junctionType %d !", v2, v3, v4, v5, v6);
}

void iap2_navigation_laneGuidanceInfoUpdateHandler_cold_3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "iAP2Navigation LaneGuidanceInfoUpdate %@, laneInfoList arrayObj=%@", (uint8_t *)&v4, 0x16u);
}

void _parseIdentificationParams_cold_1_0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, a1, a3, "pEndpoint == NULL", a5, a6, a7, a8, 0);
}

void _parseIdentificationParams_cold_2_0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, a1, a3, "navigation = NULL or navigation->displayComponents = NULL", a5, a6, a7, a8, 0);
}

void _parseIdentificationParams_cold_5_0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void acc_auth_protocol_sizeofMessageData_cold_5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LOWORD(v3) = 1024;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_2_11((void *)&_mh_execute_header, a2, a3, "[AccAuth] sizeofEncryptedAuthInfoData: encryptedInfoType %d, dataLen %d \n", 67109376, v3);
}

void acc_auth_protocol_isRespMessage_cold_1()
{
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_2_11((void *)&_mh_execute_header, v0, v1, "[AccAuth] isRespMessage: msgID %#04x, isRespMessage %d \n", v2, v3);
}

void acc_auth_protocol_initSetupMessage_cold_2(uint64_t a1, NSObject *a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 10);
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[AccAuth] initSetupMessage: DO_IF_ACCESSORY - copy authTypes, authTypesLen %d -> %d \n", (uint8_t *)v3, 0xEu);
}

void acc_auth_protocol_initSetupMessage_cold_4()
{
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_2_11((void *)&_mh_execute_header, v0, v1, "[AccAuth] initSetupMessage: DO_IF_HOST - copy authTypes, authTypesLen %d -> %d \n", v2, v3);
}

void acc_auth_protocol_createSessionWithContext_cold_2()
{
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_2_11((void *)&_mh_execute_header, v0, v1, "[AccAuth] createSession: setupInfo: role %d, sessionID %d, call _acc_auth_protocol_createSessionImplementation \n", v2, v3);
}

void acc_auth_protocol_createSessionWithContext_cold_4()
{
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_2_11((void *)&_mh_execute_header, v0, v1, "[AccAuth] createSession: setupInfo: role %d, sessionID %d, setup sessionID! \n", v2, v3);
}

void __acc_auth_protocol_handleAuthSetup_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[AccAuth] handleAuthSetup: no setupInfo! ", v1, 2u);
}

void __acc_auth_protocol_handleAuthSetup_cold_6(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[AccAuth] handleAuthSetup: setupInfo authTypesLen too large! ", v1, 2u);
}

void _parseIdentificationParams_cold_1_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pProtocolEndpoint == NULL", v1, 2u);
}

void _parseIdentificationParams_cold_3_0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "platform_location_setSupportedNMEASentences failed", v1, 2u);
}

void iap2_location_update_cold_2(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "paramID: %04X, nmeaSentenceRef = nil!\n", buf, 8u);
}

void iap2_location_send_gprmc_data_values_cold_2(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 65520;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Not identified for outgoing message ID: 0x%04X!", (uint8_t *)v1, 8u);
}

void _handleIdentificationRejection_cold_1(char a1, uint64_t a2, os_log_t log)
{
  if ((a1 & 1) != 0 || (uint64_t v3 = *(void *)(a2 + 8)) == 0) {
    uint64_t v3 = 0;
  }
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to reset SupportedNMEASentences for endpointUUID %@", (uint8_t *)&v4, 0xCu);
}

void platform_bluetooth_copyNameForMacAddress_cold_1(NSObject *a1)
{
  int v2 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___ACCPlatformBluetoothAccessoryInformationPluginProtocol);
  int v3 = 138412290;
  int v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "[#Bluetooth] Could not find plugin conforming to %@!", (uint8_t *)&v3, 0xCu);
}

void platform_bluetooth_copyNameForMacAddress_cold_2()
{
  OUTLINED_FUNCTION_0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v0, 0x12u);
}

void _parseIdentificationParamsPower_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pFeaturePower is NULL", v2, v3, v4, v5, v6);
}

void _parseIdentificationParamsPower_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "powerSourceType parse error!!", v2, v3, v4, v5, v6);
}

void _parseIdentificationParamsPower_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "powerDuringSleepType parse error!!", v2, v3, v4, v5, v6);
}

void _parseIdentificationParamsPower_cold_9()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "maximumSiphoningCurrent parse error!!", v2, v3, v4, v5, v6);
}

void _processPowerSourceUpdate_cold_6(uint64_t a1, unsigned __int16 *a2, os_log_t log)
{
  if (!a1 || (uint64_t v3 = *(void *)(a1 + 8)) == 0) {
    uint64_t v3 = 0;
  }
  int v4 = *((unsigned __int8 *)a2 + 2);
  int v5 = *a2;
  int v6 = 138412802;
  uint64_t v7 = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  __int16 v10 = 1024;
  int v11 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Check availableCurrentForDevice(ChargingCurrentLimit) for override, accessory %@, isValid %d, availableCurrentForDevice %d", (uint8_t *)&v6, 0x18u);
}

void _cbPowerSourceUpdateParams_cold_1()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "iAP2MsgPowerSourceUpdate unhandled paramID:%04X\n", v2, v3, v4, v5, v6);
}

void iap2_power_powerSourceUpdateHandler_cold_2()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "PowerSourceUpdate message processing error: %d\n", v2, v3, v4, v5, v6);
}

void _cbAccessoryPowerUpdateParams_cold_2()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "AccessoryPowerUpdate unhandled paramID:%04X\n", v2, v3, v4, v5, v6);
}

void iap2_power_accessoryPowerUpdateHandler_cold_1()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "AccessoryPowerUpdate message processing error: %d\n", v2, v3, v4, v5, v6);
}

void iap2_power_updateHandler_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "PowerUpdateHandler FeaturePower is NULL", v2, v3, v4, v5, v6);
}

void main_cold_12(void *a1, uint64_t a2)
{
  id v3 = a1;
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = v3;
  OUTLINED_FUNCTION_4_10((void *)&_mh_execute_header, v4, v5, "acc_strings_bundle: %@");
}

void main_cold_14(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "mainBundle.preferredLocalizations: %@", buf, 0xCu);
}

void main_cold_16(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "mainBundle.localizations: %@", buf, 0xCu);
}

void main_cold_18(void *a1)
{
  id v3 = OUTLINED_FUNCTION_3_13(a1);
  *(_DWORD *)uint64_t v2 = 138412290;
  *(void *)(v2 + 4) = v3;
  OUTLINED_FUNCTION_2_12((void *)&_mh_execute_header, v4, v5, "mainBundle.builtInPlugInsPath: %@");
}

void main_cold_20(void *a1)
{
  id v3 = OUTLINED_FUNCTION_3_13(a1);
  *(_DWORD *)uint64_t v2 = 138412290;
  *(void *)(v2 + 4) = v3;
  OUTLINED_FUNCTION_2_12((void *)&_mh_execute_header, v4, v5, "mainBundle.bundleIdentifier: %@");
}

void main_cold_22(void *a1)
{
  id v3 = OUTLINED_FUNCTION_3_13(a1);
  *(_DWORD *)uint64_t v2 = 138412290;
  *(void *)(v2 + 4) = v3;
  OUTLINED_FUNCTION_2_12((void *)&_mh_execute_header, v4, v5, "mainBundle.bundlePath: %@");
}

void main_cold_24(void *a1, uint64_t a2)
{
  id v3 = a1;
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = v3;
  OUTLINED_FUNCTION_4_10((void *)&_mh_execute_header, v4, v5, "mainBundle: %@");
}

void platform_externalAccessory_addEAAccessoryForEAEndpoints_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "platform_externalAccessory_addEAAccessoryForEAEndpoints: endpointUUIDs: %@, primaryEndpointUUID: %@", (uint8_t *)&v3, 0x16u);
}

void _findiAP2EndpointForConnection_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No iAP2 endpoint found!", v1, 2u);
}

void _sendEAPowerSourceUpdate_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error setting AccessoryPowerMode for endpoint: %@", (uint8_t *)&v3, 0xCu);
}

void platform_externalAccessory_removeEAAccessoryForPrimaryEndpoint_cold_3(void *a1, NSObject *a2)
{
  int v3 = [a1 primaryEndpointUUID];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Removing accessory primaryEndpointUUID %@", (uint8_t *)&v4, 0xCu);
}

void platform_externalAccessory_notifyClientsOOBBTPairingCompletionStatus_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "platform_externalAccessory_notifyClientsOOBBTPairingCompletionStatus";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s Couldn't find EA accessory to notify with primary endpointUUID %@", (uint8_t *)&v2, 0x16u);
}

void platform_externalAccessory_notifyClientsOOBBTPairingCompletionStatus_cold_3(unsigned __int8 a1, int a2, os_log_t log)
{
  int v3 = 136315906;
  __int16 v4 = "platform_externalAccessory_notifyClientsOOBBTPairingCompletionStatus";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  __int16 v9 = 2112;
  uint64_t v10 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "ERROR: %s: result=%d connectionID=%u macAddr=%@, invalid macAddr! skip update!", (uint8_t *)&v3, 0x22u);
}

void platform_auth_verifyNonceSignatureForType_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[#Authentication] Failed to parse certData!\n", v0, 2u);
}

void _sendUpdateForUUID_cold_1(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[#Device Notifications] Sending update for notification type: %{coreacc:ACCDeviceNotification_t}d to endpoint %@...", (uint8_t *)v3, 0x12u);
}

void ___addObserversForNotification_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void acc_protocolParser_iAP1_run_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP1 validation failed!", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP1_run_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP1 Looking for SOP...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP1_run_cold_5(unsigned __int16 *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "iAP1 Payload Length: %d", (uint8_t *)v3, 8u);
}

void acc_protocolParser_iAP1_run_cold_6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP1 Looking for Length...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP1_run_cold_8()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP1 Looking for Length MSB...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP1_run_cold_11()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP1 Looking for Length LSB...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP1_run_cold_13()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP1 Looking for Lingo...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP1_run_cold_15()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP1 Looking for Command ID MSB...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP1_run_cold_17()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP1 Looking for Command ID LSB...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP1_run_cold_19()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP1 Looking for Payload...", v2, v3, v4, v5, v6);
}

void acc_protocolParser_iAP1_run_cold_22()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP1 Looking for Checksum...", v2, v3, v4, v5, v6);
}

void loggingProtocol_handleMessage_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_6((void *)&_mh_execute_header, v0, v1, "Logging Protocol Session Sync Received. AccessoryName: %s, Protocol Version: %d", v2, v3);
}

void loggingProtocol_handleMessage_cold_3()
{
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s Inavlid message length: %u", v2, v3, v4, v5, 2u);
}

void loggingProtocol_handleMessage_cold_4()
{
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s Invalid binary log file size: %u", v2, v3, v4, v5, 2u);
}

void loggingProtocol_handleMessage_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void loggingProtocol_handleMessage_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void loggingProtocol_handleMessage_cold_8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void loggingProtocol_handleMessage_cold_9()
{
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s Inavlid message length: %u", v2, v3, v4, v5, 2u);
}

void loggingProtocol_handleMessage_cold_10()
{
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s Invalid binary log file size: %u", v2, v3, v4, v5, 2u);
}

void loggingProtocol_handleMessage_cold_12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void loggingProtocol_handleMessage_cold_13()
{
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s Inavlid message length: %u", v2, v3, v4, v5, 2u);
}

void loggingProtocol_handleMessage_cold_14()
{
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s Invalid binary log file size: %u", v2, v3, v4, v5, 2u);
}

void loggingProtocol_handleMessage_cold_16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void loggingProtocol_handleMessage_cold_17()
{
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s Inavlid message length: %u", v2, v3, v4, v5, 2u);
}

void loggingProtocol_handleMessage_cold_18()
{
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s Unexpected log segment received for LogFileID: %u.", v2, v3, v4, v5, 2u);
}

void loggingProtocol_handleMessage_cold_19()
{
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s Invalid data segment length: %u", v2, v3, v4, v5, 2u);
}

void loggingProtocol_handleMessage_cold_20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void loggingProtocol_handleMessage_cold_21(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Final binary log segment was received.", v1, 2u);
}

void loggingProtocol_handleMessage_cold_23(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LOWORD(v3) = 2080;
  *(void *)((char *)&v3 + 2) = a1;
  OUTLINED_FUNCTION_3_6((void *)&_mh_execute_header, a2, a3, "BinaryLogSegment received. LogFileID: %u, segmentData: %s", 67109378, (const char *)v3);
}

void loggingProtocol_handleMessage_cold_25()
{
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s Inavlid Log File ID: %u", v2, v3, v4, v5, 2u);
}

void loggingProtocol_requestAccessoryLogs_cold_1(int a1, NSObject *a2)
{
  v2[0] = 67109632;
  v2[1] = a1;
  __int16 v3 = 2048;
  uint64_t v4 = 0;
  __int16 v5 = 2048;
  uint64_t v6 = -1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Sending RequestBinaryLogAvailable. LogPriority: %u, TimeStampStart: %llu, TimeStampEnd: %llu", (uint8_t *)v2, 0x1Cu);
}

void sendMessage_stopBinaryLogFile_cold_1()
{
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_2_11((void *)&_mh_execute_header, v0, v1, "Sending StopBinaryLogFile. LogFileID: %u, Status: %u", v2, v3);
}

void sendMessage_requestBinaryLogFileInfo_cold_1()
{
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_2_11((void *)&_mh_execute_header, v0, v1, "Sending RequestBinaryLogFileInfo. LogFileID: %u, FilePriority: %u", v2, v3);
}

void writeMessage_binaryBlock_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Data is NULL.", v1, 2u);
}

void writeMessage_binaryBlock_cold_2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Data length must be non-zero.", v1, 2u);
}

void __acc_auth_protocol_handleNotInCache_cold_3()
{
  OUTLINED_FUNCTION_3_14(__stack_chk_guard);
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_6_7((void *)&_mh_execute_header, v0, v1, "[AccAuth][1Way] handleNotInCache: sessionID %d, role %d \n", v2, v3, v4, v5, v6);
}

void __acc_auth_protocol_handlContinueWithSegment_cold_2()
{
  OUTLINED_FUNCTION_3_14(__stack_chk_guard);
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_6_7((void *)&_mh_execute_header, v0, v1, "[AccAuth][1Way] handlContinueWithSegment: sessionID %d, role %d \n", v2, v3, v4, v5, v6);
}

void __acc_auth_protocol_handleCertificateChainInfoRequest_cold_2()
{
  OUTLINED_FUNCTION_3_14(__stack_chk_guard);
  v3[0] = 67109632;
  v3[1] = v0;
  __int16 v4 = 1024;
  int v5 = v1;
  __int16 v6 = 1024;
  int v7 = 32;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "[AccAuth][1Way] handleCertificateChainInfoRequest: sessionID %d, role %d, requestHashSize %d \n", (uint8_t *)v3, 0x14u);
}

void __acc_auth_protocol_handleChallenge_cold_2()
{
  OUTLINED_FUNCTION_8_4(__stack_chk_guard);
  OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "[AccAuth][1Way] handleChallenge: sessionID %d, role %d, challengeLen %d \n", v2, v3, v4);
}

void __acc_auth_protocol_handleCertificateHash_cold_2()
{
  OUTLINED_FUNCTION_8_4(__stack_chk_guard);
  OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "[AccAuth][1Way] handleCertificateHash: sessionID %d, role %d, certHashLen %d \n", v2, v3, v4);
}

void __acc_auth_protocol_handleCertificate_cold_2()
{
  OUTLINED_FUNCTION_3_14(__stack_chk_guard);
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_6_7((void *)&_mh_execute_header, v0, v1, "[AccAuth][1Way] handleCertificate: sessionID %d, role %d, first segment, init for segmented received. \n", v2, v3, v4, v5, v6);
}

void __acc_auth_protocol_handleCertificateChainCert_cold_2()
{
  OUTLINED_FUNCTION_3_14(__stack_chk_guard);
  OUTLINED_FUNCTION_7_6();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[AccAuth][1Way] handleCertificateChainCert: sessionID %d, role %d, first segment(=%d), init for segmented received. \n", v1, 0x14u);
}

void __acc_auth_protocol_handleResponse_cold_3()
{
  OUTLINED_FUNCTION_3_14(__stack_chk_guard);
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_6_7((void *)&_mh_execute_header, v0, v1, "[AccAuth][1Way] handleResponse: sessionID %d, role %d, process responseData \n", v2, v3, v4, v5, v6);
}

void __acc_auth_protocol_handleResponse_cold_7()
{
  OUTLINED_FUNCTION_3_14(__stack_chk_guard);
  OUTLINED_FUNCTION_7_6();
  __int16 v4 = v0;
  int v5 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "[AccAuth][1Way] handleCertificate: sessionID %d, role %d, first segment(=%d), init for segmented received. maxDataLen %d \n", v3, 0x1Au);
}

void __acc_auth_protocol_handleResponse_cold_10()
{
  OUTLINED_FUNCTION_3_14(__stack_chk_guard);
  OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "[AccAuth][1Way] handleResponse: sessionID %d, role %d, paramID1 %02x \n", v2, v3, v4);
}

void __acc_auth_protocol_sendCertChainRequestOrChallenge_cold_2()
{
  OUTLINED_FUNCTION_3_14(__stack_chk_guard);
  OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "[AccAuth][1Way] sendCertChainRequestOrChallenge: sessionID %d, role %d, needCertChainInfo %d \n", v2, v3, v4);
}

void iap2_CarPlayStartSession_cold_2(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_6_8();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, v7);
}

void iap2_CarPlayStartSession_cold_3(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_CarPlayStartSession_cold_4(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_CarPlayStartSession_cold_5(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_CarPlayStartSession_cold_6(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_CarPlayStartSession_cold_7(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_CarPlayStartSession_cold_11(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_CarPlayStartSession_cold_12(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_CarPlayStartSession_cold_13(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_6_8();
  OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, v7);
}

void iap2_CarPlayStartSession_cold_14(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_CarPlayStartSession_cold_15(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _checkIdentificationInfo_cold_1_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Identified for CarPlay Connection Initiation", v1, 2u);
}

void _isPowerDuringSleepForApplePencil_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[#Power] Failed to find ACCPlatformPowerInfo instance, no sleep assertion for Apple Pencil", v1, 2u);
}

void _sendOutgoingMessage_cold_3(unsigned __int16 a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 8);
  v4[0] = 67109378;
  v4[1] = a1;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Not identified for outgoing message ID: 0x%04X! (endpoint %@)", (uint8_t *)v4, 0x12u);
}

void iap2_sessionControl_authorizationHook_authentication_cold_1(unsigned int *a1)
{
  iap2_accAuthentication_getState(a1);
  iap2_identification_getState((uint64_t)a1);
  OUTLINED_FUNCTION_2_16();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v2, v3, "authState: %{coreacc:iAP2Feature_AccAuthentication_State_t}d, idState: %{coreacc:iAP2Feature_Identification_State_t}d", v4, v5, v6, v7, v8);
}

void ___requestAuthorization_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "certSerialString: %@, accName: %@", (uint8_t *)&v4, 0x16u);
}

void _statusUpdateHandler_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Vehicle status updates have not been started! - ignoring message", v2, v3, v4, v5, v6);
}

void _statusUpdateHandler_cold_5(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_6(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_7(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_8(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_9(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_10(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_11(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_12(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_13(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_14(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_15();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, v7);
}

void _statusUpdateHandler_cold_15(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_15();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, v7);
}

void _statusUpdateHandler_cold_16(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_15();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, v7);
}

void _statusUpdateHandler_cold_17(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_18(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_19(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_20(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_21(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_22(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_23(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_24(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_25(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_26(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_27(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_28(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_29(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_30(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _statusUpdateHandler_cold_31(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_vehicle_startStatusUpdatesHandler_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Vehicle status updates have not been identified for - ignoring request", v2, v3, v4, v5, v6);
}

void iap2_vehicle_startStatusUpdatesHandler_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Vehicle status updates have already been started - ignoring request", v2, v3, v4, v5, v6);
}

void _parseIdentificationParams_cold_1_2(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Unknown Param ID: %d for Msg ID: 0x%04X - ignoring param", v3, v4, v5, v6, 0);
}

void _parseIdentificationParams_cold_3_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "engineType >= eiAP2ParamID_VehicleInformationComponent_EngineType_Unknown", buf, 2u);
}

void _parseIdentificationParams_cold_4_0(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = 20;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "msgParamID: %d", buf, 8u);
}

void _parseIdentificationParams_cold_5_1(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = 21;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "msgParamID: %d", buf, 8u);
}

void _startFeatureFromDevice_cold_2(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "iAP2OOBBTPairing2 _startFeatureFromDevice: accInfoDict = %@", (uint8_t *)&v2, 0xCu);
}

void _startFeatureFromDevice_cold_5(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "transportComponent is NULL!", buf, 2u);
}

void mfi4Auth_endpoint_create_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pProtocolEndpoint = NULL", v2, v3, v4, v5, v6);
}

void mfi4Auth_endpoint_create_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "endpointUUID = NULL", v2, v3, v4, v5, v6);
}

void _mfi4Auth_endpoint_initSession_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _mfi4Auth_endpoint_initSession_cold_4(uint64_t a1, char a2, os_log_t log)
{
  int v3 = 136315650;
  uint64_t v4 = "_mfi4Auth_endpoint_initSession";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: endpointUUID %@, endpointSupportsMutualAuth %d", (uint8_t *)&v3, 0x1Cu);
}

void _mfi4Auth_endpoint_sendAuthSetupStart_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_endpoint_processIncomingData_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "missing protocol endpoint", v2, v3, v4, v5, v6);
}

void mfi4Auth_endpoint_processIncomingData_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "missing endpoint", v2, v3, v4, v5, v6);
}

void mfi4Auth_endpoint_processIncomingData_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "no data passed in", v2, v3, v4, v5, v6);
}

void mfi4Auth_endpoint_sendOutgoingData_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "no message to send out", v2, v3, v4, v5, v6);
}

void mfi4Auth_endpoint_setEndpointSecureTunnelDataReceiveTypeHandler_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "missing interna; tunnel handler", v2, v3, v4, v5, v6);
}

void ___mfi4Auth_endpoint_sendAuthSetupStart_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10_1((void *)&_mh_execute_header, v0, v1, "%s: no endpoint for endpoint %@ !!", v2, v3, v4, v5, 2u);
}

void ___mfi4Auth_endpoint_sendAuthSetupStart_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10_1((void *)&_mh_execute_header, v0, v1, "%s: wrong protocol for endpoint %@ !!", v2, v3, v4, v5, 2u);
}

void ___mfi4Auth_endpoint_sendAuthSetupStart_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10_1((void *)&_mh_execute_header, v0, v1, "%s: no protocol endpoint for endpoint %@ !!", v2, v3, v4, v5, 2u);
}

void ___mfi4Auth_endpoint_sendAuthSetupStart_block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __qiAuth_endpoint_processIncomingData_block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 52);
  int v4 = *(_DWORD *)(a1 + 48);
  uint64_t v5 = *a2;
  int v6 = 136315906;
  __int16 v7 = "qiAuth_endpoint_processIncomingData_block_invoke";
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 1024;
  int v11 = v4;
  __int16 v12 = 2112;
  uint64_t v13 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to process incoming message!!! hdr 0x%02X, (%d bytes) %@", (uint8_t *)&v6, 0x22u);
}

void _qiAuth_endpoint_handleMessage_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "dataOutBuffer not allocated", v2, v3, v4, v5, v6);
}

void qiAuth_endpoint_setAuthState_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Unknown AuthStatus passed in!!!!", v2, v3, v4, v5, v6);
}

void qiAuth_endpoint_setAuthState_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pEndpoint = NULL", v2, v3, v4, v5, v6);
}

void qiAuth_endpoint_setAuthState_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pConnection = NULL", v2, v3, v4, v5, v6);
}

void _userNotificationHandler_cold_1(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, v7);
}

void _userNotificationHandler_cold_8(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iAP2LinkActionHandleTimeSyncResponse_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, a2, a3, "Offset Uncertainty = %lld", a5, a6, a7, a8, 0);
}

void iAP2LinkActionHandleTimeSyncResponse_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, a2, a3, "Filtered Time Offset = %lld", a5, a6, a7, a8, 0);
}

void iAP2LinkActionHandleTimeSyncResponse_cold_6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, a2, a3, "Time Offset = %lld", a5, a6, a7, a8, 0);
}

void iAP2LinkActionHandleTimeSyncResponse_cold_8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, a2, a3, "Cur Timestamp = 0X%llx", a5, a6, a7, a8, 0);
}

void iAP2LinkActionHandleTimeSyncResponse_cold_10(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, a2, a3, "Recv Timestamp = 0X%llx", a5, a6, a7, a8, 0);
}

void iAP2LinkActionHandleTimeSyncResponse_cold_12(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, a2, a3, "Orig Timestamp = 0X%llx", a5, a6, a7, a8, 0);
}

void iap2_mediaLibrary_startMediaLibraryUpdatesHandler_cold_3(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_mediaLibrary_startMediaLibraryUpdatesHandler_cold_4(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_mediaLibrary_startMediaLibraryUpdatesHandler_cold_5()
{
  OUTLINED_FUNCTION_6_6();
  iAP2MsgGetMsgID(v0);
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, v7);
}

void iap2_mediaLibrary_startMediaLibraryUpdatesHandler_cold_6()
{
  OUTLINED_FUNCTION_6_6();
  iAP2MsgGetMsgID(v0);
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, v7);
}

void iap2_mediaLibrary_startMediaLibraryUpdatesHandler_cold_8(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_mediaLibrary_startMediaLibraryUpdatesHandler_cold_9(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_mediaLibrary_startMediaLibraryUpdatesHandler_cold_10(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_mediaLibrary_startMediaLibraryUpdatesHandler_cold_11()
{
  OUTLINED_FUNCTION_6_6();
  iAP2MsgGetMsgID(v0);
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, v7);
}

void iap2_mediaLibrary_playMediaLibraryItemsHandler_cold_4(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_mediaLibrary_playMediaLibraryCollectionHandler_cold_5(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_mediaLibrary_playMediaLibrarySpecialHandler_cold_1(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Not enough params Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_mediaLibrary_playMediaLibrarySpecialHandler_cold_3(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Too many params Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_mediaLibrary_playMediaLibrarySpecialHandler_cold_6(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Too many params Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_mediaLibrary_updateHandler_cold_3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "_iap2_mediaLibrary_playlistUpdateHandler: failed to get bufferID... need to retry later! (but not supported yet)", buf, 2u);
}

void _iAP2MediaLibraryMsgCleanupCB_cold_2()
{
  OUTLINED_FUNCTION_7_8();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x32u);
}

void _iAP2MediaLibraryMsgCleanupCB_cold_5(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  int v5 = (unsigned __int16)a1;
  int MsgID = iAP2MsgGetMsgID(a1);
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = a2[2];
  int v10 = *((_DWORD *)a2 + 6);
  int v11 = *((unsigned __int8 *)a2 + 28);
  v12[0] = 67110658;
  v12[1] = v5;
  __int16 v13 = 1024;
  int v14 = MsgID;
  __int16 v15 = 2112;
  uint64_t v16 = v7;
  __int16 v17 = 2112;
  uint64_t v18 = v8;
  __int16 v19 = 2112;
  uint64_t v20 = v9;
  __int16 v21 = 1024;
  int v22 = v10;
  __int16 v23 = 1024;
  int v24 = v11;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "_iAP2MediaLibraryMsgCleanupCB: msg=%hxh msgID=%04xh context(accessoryUID=%@ libraryUID=%@ lastRevision=%@ updatesInMsg=%d confirmed=%d)", (uint8_t *)v12, 0x38u);
}

void __MsgSentOutCB_cold_1()
{
  OUTLINED_FUNCTION_7_8();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x44u);
}

float iap2_mediaLibrary_updatePlaylistContentHandler_cold_6(unsigned __int8 *a1, NSObject *a2)
{
  int v2 = *a1;
  int v3 = *((_DWORD *)a1 + 1);
  int v4 = *((unsigned __int16 *)a1 + 4);
  int v5 = *((unsigned __int16 *)a1 + 8);
  v7[0] = 67109888;
  v7[1] = v2;
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 1024;
  int v11 = v4;
  __int16 v12 = 1024;
  int v13 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "updatePlaylistContentHandler: xferEntry(bufferID=%u type=%u fileXfer=%hxh context=%hxh)", (uint8_t *)v7, 0x1Au);
  return result;
}

void iap2_mediaLibrary_updatePlaylistContentHandler_cold_9(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "updatePlaylistContentHandler: failed to get bufferID... need to retry later! (but not supported yet)", v1, 2u);
}

void iap2_mediaLibrary_updatePlaylistContentHandler_cold_11(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "updatePlaylistContentHandler: ERROR: PlaylistContentStyleRecords style for sessionVer=%d is not valid!", (uint8_t *)v2, 8u);
}

void __handleTransferEnd_cold_2()
{
  OUTLINED_FUNCTION_7_8();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x20u);
}

void _calcWindowSize_cold_2()
{
  OUTLINED_FUNCTION_6_9();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v0, v1, "iAP2MediaLibrary _calcWindowSize: %@ - %s, maxUpdateMessagesInFlight not set, set to at least 1");
}

void _calcWindowSize_cold_4()
{
  OUTLINED_FUNCTION_6_9();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v0, v1, "iAP2MediaLibrary _calcWindowSize: %@ - %s, recordsPerMessage not set, set to at least 1");
}

void iap2_externalaccessory_statusEASessionHandler_cold_1()
{
  OUTLINED_FUNCTION_7_9();
  OUTLINED_FUNCTION_9_3((void *)&_mh_execute_header, v0, (uint64_t)v0, "Unknown sessionStatus %d (eaSessionID %d)", v1);
}

void iap2_externalaccessory_statusEASessionHandler_cold_5(unsigned __int16 a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "platform_externalAccessory couldn't close eaSession %d from accessory SessionStatus", (uint8_t *)v2, 8u);
}

void iap2_externalaccessory_statusEASessionHandler_cold_8(uint64_t a1, NSObject *a2)
{
  v4[0] = 67109376;
  v4[1] = 0;
  __int16 v5 = 1024;
  int MsgID = iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_9_3((void *)&_mh_execute_header, a2, v3, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", (uint8_t *)v4);
}

void iap2_externalaccessory_statusEASessionHandler_cold_9(uint64_t a1, NSObject *a2)
{
  v4[0] = 67109376;
  v4[1] = 1;
  __int16 v5 = 1024;
  int MsgID = iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_9_3((void *)&_mh_execute_header, a2, v3, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", (uint8_t *)v4);
}

void _iAP2_closeEASession_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _iAP2_closeEASession_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _iAP2_closeEASession_cold_6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_externalAccessory_openEASession_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "Creating mutable copy of sessionUUID string %@", v2, v3, v4, v5, v6);
}

void _iap2_externalAccessory_openEASessionSent_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "Couldn't find EA Session for UUID %@", v2, v3, v4, v5, v6);
}

void iap2_externalAccessory_closeEASession_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "iAP2: eaSessionUUID %@ not found, won't transmit close EASession message", v2, v3, v4, v5, v6);
}

void iap2_externalAccessory_outgoingEADataAvailable_cold_4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_7(a1, a2);
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "SST READ MAX POSSIBLE, WILL KEEP READING", v3, 2u);
}

void iap2_externalAccessory_sendOutgoingEAData_cold_2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_7(a1, a2);
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "dataBuf is NULL!", v3, 2u);
}

void iap2_externalAccessory_sendOutgoingEAData_cold_4(unsigned __int16 *a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = *a1;
  LOWORD(v4) = 2112;
  *(void *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_3_6((void *)&_mh_execute_header, a2, a3, "Queued all bytes for future send for eaSession %d (sessionUUID %@)", v3, (void)v4, WORD4(v4));
}

void iap2_externalAccessory_sendOutgoingEAData_cold_6()
{
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "has pending outgoing EA data in the eaSessionDictionary", v1, 2u);
}

void iap2_externalAccessory_sendOutgoingEAData_cold_8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "has EA Session dictionary for eaSessionUUID %@", v2, v3, v4, v5, v6);
}

void _queueOutgoingDataForEASessionUUID_cold_1(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "queueOutgoingData: Queued %d bytes in cache", (uint8_t *)v2, 8u);
}

void _queueOutgoingDataForEASessionUUID_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "Can't send any more outgoing data for eaSessionUUID %@! Queued up too many bytes", v2, v3, v4, v5, v6);
}

void _eaDataQueuedCB_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "_eaDataQueuedCB No eaSessionDictionary in global active sessions dictionary for sessionUUID %@", v2, v3, v4, v5, v6);
}

void _eaDataQueuedCB_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "_eaDataQueuedCB No pending data for sessionUUID %@", v2, v3, v4, v5, v6);
}

void _eaDataQueuedCB_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "dataBuf is NULL!", v2, v3, v4, v5, v6);
}

void _eaDataQueuedCB_cold_7(int a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Old cache length was %d, new length is %d", (uint8_t *)v3, 0xEu);
}

void _eaDataQueuedCB_cold_9(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "clear eaPacketDataBufLen %d bytes from cached data on packet queue success", (uint8_t *)v2, 8u);
}

void _eaDataQueuedCB_cold_12()
{
  OUTLINED_FUNCTION_7_9();
  OUTLINED_FUNCTION_9_3((void *)&_mh_execute_header, v0, (uint64_t)v0, "unable to queue %d ea bytes for cached packet,  eaSession %d", v1);
}

void _eaDataQueuedCB_cold_14()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_6((void *)&_mh_execute_header, v0, v1, "_eaDataQueuedCB: Have more data to send in cache, eaSessionUUID %@, pendingDataCFIndex Length = %d");
}

void _CFDictionaryApplierFunction_deactiveEASession_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "deactivating eaSessionUUID %@ from global list", v2, v3, v4, v5, v6);
}

void _parseIdentificationSupportedEAProtocol_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "newProtocol is NULL", v2, v3, v4, v5, v6);
}

void _parseIdentificationSupportedEAProtocol_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "EAFeature is NULL", v2, v3, v4, v5, v6);
}

void _parseIdentificationSupportedEAProtocol_cold_6(unsigned __int8 *a1, CFStringRef theString, NSObject *a3)
{
  int v4 = *a1;
  v5[0] = 67109378;
  v5[1] = v4;
  __int16 v6 = 2080;
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Already have an ea protocol for ID %d (protocol %s)", (uint8_t *)v5, 0x12u);
}

void _parseIdentificationPreferredBundleSeedID_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pFeature = NULL", v2, v3, v4, v5, v6);
}

void _iap2_externalAccessory_eaDataQueuedCB_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "after packet callback, free buffers are  remaining for eaSessionUUID %@, start notifications", v2, v3, v4, v5, v6);
}

void _destroyFeature_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Failed to disable usb fault monitoring!!", v2, v3, v4, v5, v6);
}

void _destroyFeature_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Failed to disable usb mode monitoring!!", v2, v3, v4, v5, v6);
}

void _startFeatureFromDevice_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Failed to send usb mode state notification!!", v2, v3, v4, v5, v6);
}

void _startFeatureFromDevice_cold_3()
{
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "_startFeatureFromDevice: Not identified for message USBModeNotification", v1, 2u);
}

void _checkIdentificationInfo_cold_1_3()
{
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Identified for USB Host Mode", v1, 2u);
}

void iap2_usbHostMode_StartUSBHostModeHandler_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Failed to get feature pointer!!", v2, v3, v4, v5, v6);
}

void iap2_usbHostMode_StartUSBHostModeHandler_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Failed to set usb fault detection!!", v2, v3, v4, v5, v6);
}

void iap2_usbHostMode_StartUSBHostModeHandler_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Failed to set usb host mode!!", v2, v3, v4, v5, v6);
}

void iap2_usbHostMode_StopUSBHostModeHandler_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Failed to stop usb fault detection!!", v2, v3, v4, v5, v6);
}

void iap2_usbHostMode_StopUSBHostModeHandler_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Failed to set usb device mode!!", v2, v3, v4, v5, v6);
}

void iap2_usbHostMode_USBModeChangeNotification_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Failed to send usb mode notification!!", v2, v3, v4, v5, v6);
}

void _requestAppLaunchHandler_cold_4(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _accSNTPTimeSync_endpoint_processIncomingData_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  if (*(void *)a1) {
    int v3 = *(_DWORD *)(*(void *)a1 + 24);
  }
  else {
    int v3 = 17;
  }
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "sntpTimeSync processIncomingData: %{coreacc:ACCEndpoint_TransportType_t}d dataIn %@", (uint8_t *)v4, 0x12u);
}

void platform_wifisharing_request_device_wifi_information_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "no deviceClass string for wifi sharing for unlock device alert", v1, 2u);
}

void platform_wifisharing_request_device_wifi_information_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "no deviceClass string for wifi sharing connect to wifi alert", v1, 2u);
}

void ___presentShareWiFiCredentialsNotification_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "device WiFi Configuration Information %@", (uint8_t *)&v2, 0xCu);
}

void ___presentShareWiFiCredentialsNotification_block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "userDeclinedWiFiNetworkSharing WiFi Configuration Information %@", (uint8_t *)&v2, 0xCu);
}

void iAP2ListArrayAddItemAfter_cold_1()
{
  __assert_rtn("iAP2ListArrayAddItemAfter", "iAP2ListArray.c", 600, "itemIndex != kiAP2ListArrayInvalidIndex");
}

void iap2_appLinks_start_cold_2(uint64_t a1, uint64_t a2)
{
  iAP2MsgGetMsgID(a2);
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v2, v3, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v4, v5, v6, v7, v8);
}

void iap2_appLinks_start_cold_5(uint64_t a1, uint64_t a2)
{
  iAP2MsgGetMsgID(a2);
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v2, v3, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v4, v5, v6, v7, v8);
}

void iap2_appLinks_appLinksUpdateHandler_cold_1()
{
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s Invalid subFeature: %d", v2, v3, v4, v5, 2u);
}

void iap2_appLinks_appLinksUpdateHandler_cold_8()
{
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s Invalid subFeature: %d", v2, v3, v4, v5, 2u);
}

void _calculateListCap_cold_2()
{
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s Invalid subFeature: %d", v2, v3, v4, v5, 2u);
}

void _appLinksAppIconResponse_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#App Links Failed to add file transfer!", v1, 2u);
}

void _appLinksAppIconResponse_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#App Links Failed to allocate file transfer buffer ID!", v1, 2u);
}

void _appIconFileTransferIDSent_cold_1(os_log_t log)
{
  int v1 = 138543362;
  CFStringRef v2 = @"#AppIcon";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to start file transfer!", (uint8_t *)&v1, 0xCu);
}

void _appIconFileTransferIDSent_cold_3(uint64_t a1, int *a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 109);
  int v4 = *(unsigned __int16 *)(a1 + 112);
  int v5 = *a2;
  v6[0] = 67109632;
  v6[1] = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  __int16 v9 = 1024;
  int v10 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Call Start pTransfer(ID=%u type=%d state=%d)", (uint8_t *)v6, 0x14u);
}

void _appIconFileTransferIDSent_cold_6(uint64_t a1, int *a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 109);
  int v4 = *a2;
  int v5 = 138544130;
  CFStringRef v6 = @"#AppIcon";
  __int16 v7 = 2048;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = v3;
  __int16 v11 = 1024;
  int v12 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%{public}@ ignore starting transfer in non-idle state, transfer (%p id=%d state=%d)", (uint8_t *)&v5, 0x22u);
}

void _appIconFileTransferEndHandler_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _appIconFileTransferEndHandler_cold_4(os_log_t log)
{
  int v1 = 138543362;
  CFStringRef v2 = @"#AppIcon";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to remove file transfer!", (uint8_t *)&v1, 0xCu);
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

void platform_connectionInfo_setAccessoryUserName_cold_2(uint64_t a1)
{
  acc_endpoint_getProtocolString(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "platform_connectionInfo_setAccessoryUserName: unexpected protocol: %s", v3, v4, v5, v6, v7);
}

void platform_connectionInfo_getAccessoryUserName_cold_2(uint64_t a1)
{
  acc_endpoint_getProtocolString(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "platform_connectionInfo_getAccessoryUserName: unexpected protocol: %s", v3, v4, v5, v6, v7);
}

void platform_connectionInfo_getPairingStatus_cold_2(uint64_t a1)
{
  acc_endpoint_getProtocolString(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "platform_connectionInfo_getPairingStatus: unexpected protocol: %s", v3, v4, v5, v6, v7);
}

void platform_connectionInfo_provisionPairing_cold_2(uint64_t a1)
{
  acc_endpoint_getProtocolString(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "platform_connectionInfo_provisionPairing: unexpected protocol: %s", v3, v4, v5, v6, v7);
}

void platform_connectionInfo_resetPairing_cold_2(uint64_t a1)
{
  acc_endpoint_getProtocolString(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "platform_connectionInfo_resetPairing: unexpected protocol: %s", v3, v4, v5, v6, v7);
}

void platform_connectionInfo_getPublicNvmKeyValues_cold_1(uint64_t a1)
{
  acc_endpoint_getProtocolString(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "platform_connectionInfo_getPublicNvmKeyValues: unexpected protocol: %s", v3, v4, v5, v6, v7);
}

void platform_connectionInfo_setPublicNvmKeyValues_cold_2(uint64_t a1)
{
  acc_endpoint_getProtocolString(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "platform_connectionInfo_setPublicNvmKeyValues: unexpected protocol: %s", v3, v4, v5, v6, v7);
}

void platform_connectionInfo_getPrivateNvmKeyValues_cold_2(uint64_t a1)
{
  acc_endpoint_getProtocolString(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "platform_connectionInfo_getPrivateNvmKeyValues: unexpected protocol: %s", v3, v4, v5, v6, v7);
}

void platform_connectionInfo_setPrivateNvmKeyValues_cold_2(uint64_t a1)
{
  acc_endpoint_getProtocolString(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "platform_connectionInfo_setPrivateNvmKeyValues: unexpected protocol: %s", v3, v4, v5, v6, v7);
}

void platform_connectionInfo_beginVendorKeyErase_cold_2(uint64_t a1)
{
  acc_endpoint_getProtocolString(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "platform_connectionInfo_beginVendorKeyErase: unexpected protocol: %s", v3, v4, v5, v6, v7);
}

void platform_connectionInfo_continueVendorKeyErase_cold_2(uint64_t a1)
{
  acc_endpoint_getProtocolString(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "platform_connectionInfo_continueVendorKeyErase: unexpected protocol: %s", v3, v4, v5, v6, v7);
}

void platform_connectionInfo_cancelVendorKeyErase_cold_2(uint64_t a1)
{
  acc_endpoint_getProtocolString(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "platform_connectionInfo_cancelVendorKeyErase: unexpected protocol: %s", v3, v4, v5, v6, v7);
}

void platform_connectionInfo_beginUserKeyErase_cold_2(uint64_t a1)
{
  acc_endpoint_getProtocolString(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "platform_connectionInfo_beginUserKeyErase: unexpected protocol: %s", v3, v4, v5, v6, v7);
}

void platform_connectionInfo_continueUserKeyErase_cold_2(uint64_t a1)
{
  acc_endpoint_getProtocolString(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "platform_connectionInfo_continueUserKeyErase: unexpected protocol: %s", v3, v4, v5, v6, v7);
}

void platform_connectionInfo_cancelUserKeyErase_cold_2(uint64_t a1)
{
  acc_endpoint_getProtocolString(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "platform_connectionInfo_cancelUserKeyErase: unexpected protocol: %s", v3, v4, v5, v6, v7);
}

void platform_connectionInfo_copyUserPrivateKey_cold_2(uint64_t a1)
{
  acc_endpoint_getProtocolString(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v1, v2, "platform_connectionInfo_copyUserPrivateKey: unexpected protocol: %s", v3, v4, v5, v6, v7);
}

void _acc_auth_protocol_isBusySessionID_cold_1(char a1, int a2, os_log_t log)
{
  v3[0] = 67109632;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  __int16 v6 = 1024;
  int v7 = (unsigned __int16)__availableSessionIDs;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[AccAuth] _isBusySessionID: sessionID %d, isBusySessionID %d, __availableSessionIDs %#04x \n", (uint8_t *)v3, 0x14u);
}

void _acc_auth_protocol_cleanupCertificateInfo_cold_2()
{
  OUTLINED_FUNCTION_7_4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[AccAuth] _cleanupCertificateInfo: certificateDataCount %d \n", v1, 8u);
}

void _acc_auth_protocol_cleanupCertificateData_cold_2()
{
  OUTLINED_FUNCTION_7_4();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "[AccAuth] _cleanupCertificateData: certificateDataLen %d, certificateHashLen %d \n", v2, 0xEu);
}

void _acc_auth_protocol_validateCertificateChain_cold_2()
{
  OUTLINED_FUNCTION_7_4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "[AccAuth] _validateCertificateChain:  couldn't allocate certList, certificateDataCount %d \n", v1, 8u);
}

void _acc_auth_protocol_validateCertificateChain_cold_4(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  id v4 = [a1 count];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[AccAuth] _validateCertificateChain: certList.count %lu \n", (uint8_t *)&v3, 0xCu);
}

void _acc_auth_protocol_validateCertificateChain_cold_6()
{
  OUTLINED_FUNCTION_7_4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[AccAuth] _validateCertificateChain: certificateDataCount %d \n", v1, 8u);
}

void iap2_assistiveTouch_startAssistiveTouchHandler_cold_1(uint64_t a1, unsigned __int8 *a2)
{
  *(_DWORD *)id v4 = 138413314;
  *(void *)&v4[4] = *(void *)(a1 + 8);
  *(_WORD *)&v4[12] = 1024;
  *(_DWORD *)&v4[14] = *a2;
  *(_WORD *)&v4[18] = 1024;
  *(_DWORD *)&v4[20] = 1;
  OUTLINED_FUNCTION_2_17();
  OUTLINED_FUNCTION_3_17((void *)&_mh_execute_header, v2, v3, "StartAssistiveTouch: %@ started %d->%d pEndpoint=%p assistiveTouch=%p", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16]);
}

void iap2_assistiveTouch_stopAssistiveTouchHandler_cold_1(uint64_t a1, unsigned __int8 *a2)
{
  *(_DWORD *)id v4 = 138413314;
  *(void *)&v4[4] = *(void *)(a1 + 8);
  *(_WORD *)&v4[12] = 1024;
  *(_DWORD *)&v4[14] = *a2;
  *(_WORD *)&v4[18] = 1024;
  OUTLINED_FUNCTION_2_17();
  OUTLINED_FUNCTION_3_17((void *)&_mh_execute_header, v2, v3, "StopAssistiveTouch: %@ started %d->%d pEndpoint=%p assistiveTouch=%p", *(void *)v4, *(void *)&v4[8], *(unsigned int *)&v4[16]);
}

void iap2_assistiveTouch_startAssistiveTouchUpdateHandler_cold_1(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)id v4 = 138413314;
  *(void *)&v4[4] = *(void *)(a1 + 8);
  *(_WORD *)&v4[12] = 1024;
  *(_DWORD *)&v4[14] = *(unsigned __int8 *)(a2 + 1);
  *(_WORD *)&v4[18] = 1024;
  *(_DWORD *)&unsigned char v4[20] = 1;
  OUTLINED_FUNCTION_2_17();
  OUTLINED_FUNCTION_3_17((void *)&_mh_execute_header, v2, v3, "StartAssistiveTouchUpdate: %@ infoRequested %d->%d pEndpoint=%p assistiveTouch=%p", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16]);
}

void iap2_assistiveTouch_stopAssistiveTouchUpdateHandler_cold_1(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)id v4 = 138413314;
  *(void *)&v4[4] = *(void *)(a1 + 8);
  *(_WORD *)&v4[12] = 1024;
  *(_DWORD *)&v4[14] = *(unsigned __int8 *)(a2 + 1);
  *(_WORD *)&v4[18] = 1024;
  OUTLINED_FUNCTION_2_17();
  OUTLINED_FUNCTION_3_17((void *)&_mh_execute_header, v2, v3, "StopAssistiveTouchUpdate: %@ infoRequested %d->%d pEndpoint=%p assistiveTouch=%p", *(void *)v4, *(void *)&v4[8], *(unsigned int *)&v4[16]);
}

void mfi4Auth_protocol_processIncomingMessageRelay_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "processIncomingMessageRelay: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessageRelay_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "processIncomingMessageRelay: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessageRelay_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "unable to find protocol endpoint from provided UUID", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessageRelay_cold_14()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "processIncomingMessageRelay: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessageRelay_cold_16()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "processIncomingMessageRelay: !msgId", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessageRelay_cold_18()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "Received unhandled message with ID: 0x%04x", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessageRelay_cold_20()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "failed to handle relay remote", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessageRelay_cold_22()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "failed to handle relay success", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "iAP2RelayRemote: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "iAP2RelayRemote: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_5()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_handle_iAP2RelayRemote: Has no payload !!!, retry after %d ms", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_7()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_handle_iAP2RelayRemote: unable to unpack nested message!!!", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_9(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_10(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_11()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_relay_handle_iAP2RelayRemote: invalid packageDataType!!!", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_12()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_relay_handle_iAP2RelayRemote: unable to create parser!!!", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_13()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_relay_handle_iAP2RelayRemote: failed to parse AccessoryInformationUpdate message!!!", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_15(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_20()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "iAP2RelayRemote: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_handle_iAP2RelaySucceeded_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "iAP2RelaySucceeded: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_handle_iAP2RelaySucceeded_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "iAP2RelaySucceeded: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_handle_iAP2RelaySucceeded_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "iAP2RelaySucceeded: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_handle_iAP2RelayFailed_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "iAP2RelayFailed: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_handle_iAP2RelayFailed_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "iAP2RelayFailed: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_handle_iAP2RelayFailed_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "iAP2RelayFailed: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_initMessage_DeviceiAP2RelayRemote_RequestAccessoryInfoUpdate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_relay_initMessage_DeviceiAP2RelayRemote_RequestAccessoryInfoUpdate_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_relay_StartRelayForType_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "missing auth session", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_StartRelayForType_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "missing outMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_StartRelayForType_cold_7(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_relay_StartRelayForType_cold_11()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "processOutgoingSecureTunnelDataForClient: SecureTunnelType(%d) not supported!", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_StartRelayForType_cold_14()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "wrong type (%d)", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_StartRelayForT56_cold_9(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_setSecureTunnelDataReceiveTypeHandler_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "missing data handler", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_setSecureTunnelDataReceiveTypeHandler_cold_5()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "invalide secureTunnelType (%d)", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processOutgoingSecureTunnelDataForClient_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "processOutgoingSecureTunnelDataForClient: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processOutgoingSecureTunnelDataForClient_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "processOutgoingSecureTunnelDataForClient: !dataOut", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processOutgoingSecureTunnelDataForClient_cold_8()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "missing secure tunnel handler", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processOutgoingSecureTunnelDataForClient_cold_9()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "processOutgoingSecureTunnelDataForClient: Using registered sendOutgoingHandler - handler should perform encryption", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processOutgoingSecureTunnelDataForClient_cold_13()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "processOutgoingSecureTunnelDataForClient: authSession shuttingDown", v2, v3, v4, v5, v6);
}

void mfi4Auth_relay_initMessage_DeviceiAP2RelayRemote_TypeData_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "missing outboundSecuredData", v2, v3, v4, v5, v6);
}

void _mfi4Auth_relay_handle_AccessoryInformationUpdate_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _mfi4Auth_relay_handle_AccessoryInformationUpdate_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _mfi4Auth_relay_handle_AccessoryInformationUpdate_cold_12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _mfi4Auth_relay_handle_AccessoryInformationUpdate_cold_14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void acc_platform_packetLogging_logEventVA_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Endpoint destroyed during logging", v1, 2u);
}

void acc_platform_packetLogging_logEventVA_cold_5(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

void iAP2BuffPoolGetBuffSize_cold_1()
{
}

void iAP2BuffPoolInit_cold_1()
{
}

void iAP2BuffPoolCleanup_cold_1()
{
}

void iAP2BuffPoolGet_cold_1()
{
}

void iAP2BuffPoolReturn_cold_1()
{
}

void _addMediaItemAttributesToMessage_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "mediaItemAttributes:\n%@", v2, v3, v4, v5, v6);
}

void _addMediaItemAttributesToMessage_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "mediaItemAttributesSubscriptionList:\n%@", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_mediaItemArtworkUpdateHandler_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "#Artwork Failed to add file transfer!", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_mediaItemArtworkUpdateHandler_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "#Artwork Failed to allocate file transfer buffer ID!", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_mediaItemArtworkUpdateHandler_cold_6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "#Artwork artworkData: NULL", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_mediaItemArtworkUpdateHandler_cold_8(const __CFData *a1)
{
  CFDataGetLength(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v1, v2, "#Artwork artworkData: %lu bytes", v3, v4, v5, v6, v7);
}

void iap2_nowPlaying_playbackAttributesUpdateHandler_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "playbackAttributesUpdateHandler: call _checkMoveWindowAndRequestPBQList: false", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_playbackAttributesUpdateHandler_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "Playback stopped/paused, pausing timer...", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_playbackAttributesUpdateHandler_cold_6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "Playback seeking forwards/backwards, pausing timer...", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_playbackAttributesUpdateHandler_cold_9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_nowPlaying_playbackAttributesUpdateHandler_cold_11()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "elapsedTimeMS: %u", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_playbackAttributesUpdateHandler_cold_13()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "elapsedTimeMSCF: %@", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_playbackAttributesUpdateHandler_cold_15()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "playbackStatus: %u", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_playbackAttributesUpdateHandler_cold_17()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "playbackStatusCF: %@", v2, v3, v4, v5, v6);
}

void _addplaybackAttributesToMessage_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "playbackAttributes:\n%@", v2, v3, v4, v5, v6);
}

void _addplaybackAttributesToMessage_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "playbackAttributesSubscriptionList:\n%@", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_playbackQueueListChangedHandler_cold_1()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "playbackQueueListChangedHandler: call _checkMoveWindowAndRequestPBQList: _dueToClientUpdate %d", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "#PlaybackQueueList queueListInfo does not contain Available info!", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "#PlaybackQueueList requestID does not exist in queueListInfo!", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "#PlaybackQueueList nil lastPBQInfoRequestID!", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "#PlaybackQueueList requestID does not match!", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "#PlaybackQueueList transfer not requested!", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "#PlaybackQueueList not supportsFileTransferSession!", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_7()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "#PlaybackQueueList Failed to send message with transfer ID / availability / intent!", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_10()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "#PlaybackQueueList Failed to add file transfer!", v2, v3, v4, v5, v6);
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_12()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "#PlaybackQueueList Failed to allocate file transfer buffer ID!", v2, v3, v4, v5, v6);
}

void ___createFeature_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Sending elapsed time update: %u ms for endpoint %@", v2, 0x12u);
}

void ___createFeature_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "timeDifferenceMS: %llu", v2, v3, v4, v5, v6);
}

void ___createFeature_block_invoke_cold_6(uint64_t a1, uint64_t a2, NSObject *a3)
{
  if (!a1 || (uint64_t v4 = *(void *)(a1 + 8)) == 0) {
    uint64_t v4 = 0;
  }
  int v5 = 138412546;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = obfuscatedPointer(a2);
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "iAP2 Now Playing elapsed time timer callback fired! %@, pFeature %p", (uint8_t *)&v5, 0x16u);
}

void ___createFeature_block_invoke_cold_8()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "iAP2 Now Playing elapsed time timer event handler fired", v2, v3, v4, v5, v6);
}

void _continueElapsedTimeTimer_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "_continueElapsedTimeTimer: SKIP start timer, already running or not needed", v2, v3, v4, v5, v6);
}

void _continueElapsedTimeTimer_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _continueElapsedTimeTimer_cold_5()
{
  OUTLINED_FUNCTION_3_12();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "_continueElapsedTimeTimer: elapsedTimerEnabled %d, elapsedTimerRunning %d", v1, 0xEu);
}

void _startNowPlayingUpdatesHandler_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "call _checkMoveWindowAndRequestPBQList: true", v2, v3, v4, v5, v6);
}

void _startNowPlayingUpdatesHandler_cold_12(CFArrayRef *a1)
{
  CFArrayGetCount(*a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v1, v2, "playbackAttrCount: %ld", v3, v4, v5, v6, v7);
}

void _startNowPlayingUpdatesHandler_cold_14(CFArrayRef *a1)
{
  CFArrayGetCount(*a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v1, v2, "mediaAttrCount: %ld", v3, v4, v5, v6, v7);
}

void _startNowPlayingUpdatesHandler_cold_16(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_13_1(a1, a2);
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v2, v3, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v4, v5, v6, v7, v8);
}

void _startNowPlayingUpdatesHandler_cold_18(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_13_1(a1, a2);
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v2, v3, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v4, v5, v6, v7, 0);
}

void _startNowPlayingUpdatesHandler_cold_20(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _startNowPlayingUpdatesHandler_cold_21(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _startNowPlayingUpdatesHandler_cold_22(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_4_12();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v1, v2, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _startNowPlayingUpdatesHandler_cold_23(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_13_1(a1, a2);
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v2, v3, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v4, v5, v6, v7, v8);
}

void _startNowPlayingUpdatesHandler_cold_25()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "Start Now Playing Updates!", v2, v3, v4, v5, v6);
}

void _stopNowPlayingUpdatesHandler_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "Stop Now Playing Updates!", v2, v3, v4, v5, v6);
}

void _setNowPlayingInfoHandler_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "_setNowPlayingInfoHandler: call _checkMoveWindowAndRequestPBQList: false", v2, v3, v4, v5, v6);
}

void _setNowPlayingInfoHandler_cold_3()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "_setNowPlayingInfoHandler: autoChoosePBQListStartIndex=%d", v2, v3, v4, v5, v6);
}

void _setNowPlayingInfoHandler_cold_8()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "Set Now Playing Info handler!", v2, v3, v4, v5, v6);
}

void _handleFileTransferIDSent_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@ Failed to start file transfer!", v1, 0xCu);
}

void _handleFileTransferIDSent_cold_3()
{
  OUTLINED_FUNCTION_3_12();
  __int16 v4 = v0;
  int v5 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Call Start pTransfer(ID=%u type=%d state=%d)", v3, 0x14u);
}

void _handleFileTransferEnd_cold_1()
{
  OUTLINED_FUNCTION_3();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%{public}@ _handleFileTransferEnd called with unexpected state: %d!", v2, 0x12u);
}

void _handleFileTransferEnd_cold_4()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@ Failed to remove file transfer!", v1, 0xCu);
}

void __iAP2FileTransferSendBufferPacket_cold_1()
{
  __assert_rtn("__iAP2FileTransferSendBufferPacket", "iAP2FileTransfer.c", 190, "payloadLen <= sizeof(payload)");
}

void __iAP2FileTransferSendBufferPacket_cold_4()
{
  OUTLINED_FUNCTION_7_8();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x30u);
}

void iAP2FileTransferAllocateBufferID_cold_2(unsigned __int8 a1, NSObject *a2)
{
  int v2 = 136315650;
  __int16 v3 = "iAP2FileTransferAllocateBufferID";
  __int16 v4 = 1024;
  int v5 = 603;
  __int16 v6 = 1024;
  int v7 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s:%d Could not allocate buffer ID for transfer, session=%d", (uint8_t *)&v2, 0x18u);
}

void iAP2FileTransferCreate_cold_1()
{
}

void iAP2FileTransferDelete_cold_1()
{
  OUTLINED_FUNCTION_5_8(__stack_chk_guard);
  OUTLINED_FUNCTION_12_1((void *)&_mh_execute_header, v0, v1, "%s:%d fileXfer=%hx state=%d session=%u sentSize=%lu totalSize=%lu (endCB=%hx userInfo=%hx) pBuffer=%hx buffSize=%lu", v2, v3, v4, v5, 2u);
}

void iAP2FileTransferCleanup_cold_1()
{
  OUTLINED_FUNCTION_5_8(__stack_chk_guard);
  OUTLINED_FUNCTION_12_1((void *)&_mh_execute_header, v0, v1, "%s:%d fileXfer=%hx state=%d session=%u sentSize=%lu totalSize=%lu (endCB=%hx userInfo=%hx) pBuffer=%hx buffSize=%lu", v2, v3, v4, v5, 2u);
}

void iAP2FileTransferStart_cold_1()
{
  __assert_rtn("iAP2FileTransferStart", "iAP2FileTransfer.c", 1121, "payloadLen <= iAP2LinkGetMaxSendPayloadSize (fileXfer->link, NULL)");
}

void iAP2FileTransferSuccess_cold_1()
{
  OUTLINED_FUNCTION_7_10(__stack_chk_guard);
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_6_10((void *)&_mh_execute_header, v0, v1, "%s:%d fileXfer=%hx buffID=0x%X Successful transfer, send Control Success", v2, v3, v4, v5, 2u);
}

void iAP2FileTransferSuccess_cold_3()
{
  OUTLINED_FUNCTION_5_8(__stack_chk_guard);
  OUTLINED_FUNCTION_12_1((void *)&_mh_execute_header, v0, v1, "%s:%d fileXfer=%hx state=%d session=%u sentSize=%lu totalSize=%lu (endCB=%hx userInfo=%hx) pBuffer=%hx buffSize=%lu", v2, v3, v4, v5, 2u);
}

void iAP2FileTransferResume_cold_1()
{
  OUTLINED_FUNCTION_7_10(__stack_chk_guard);
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_6_10((void *)&_mh_execute_header, v0, v1, "%s:%d fileXfer=%hx buffID=0x%X Resume send", v2, v3, v4, v5, 2u);
}

void iAP2FileTransferResume_cold_3()
{
  OUTLINED_FUNCTION_7_10(__stack_chk_guard);
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_6_10((void *)&_mh_execute_header, v0, v1, "%s:%d fileXfer=%hx buffID=0x%X Resume, send Control Start", v2, v3, v4, v5, 2u);
}

void iAP2FileTransferResume_cold_5()
{
  OUTLINED_FUNCTION_4_14(__stack_chk_guard);
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_2_18();
  OUTLINED_FUNCTION_10_4((void *)&_mh_execute_header, v0, v1, "%s:%d fileXfer=%hx state=%d session=%u sentSize=%lu totalSize=%lu (endCB=%hx userInfo=%hx)", v2, v3, v4, v5, 2u);
}

void iAP2FileTransferCancel_cold_1()
{
  OUTLINED_FUNCTION_7_8();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x24u);
}

void iAP2FileTransferCancel_cold_3()
{
  OUTLINED_FUNCTION_7_10(__stack_chk_guard);
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_6_10((void *)&_mh_execute_header, v0, v1, "%s:%d fileXfer=%hx buffID=0x%X Send Control Cancel", v2, v3, v4, v5, 2u);
}

void iAP2FileTransferCancel_cold_6()
{
  OUTLINED_FUNCTION_4_14(__stack_chk_guard);
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_2_18();
  OUTLINED_FUNCTION_10_4((void *)&_mh_execute_header, v0, v1, "%s:%d fileXfer=%hx state=%d session=%u sentSize=%lu totalSize=%lu (endCB=%hx userInfo=%hx)", v2, v3, v4, v5, 2u);
}

void platform_usb_setUSBHostHIDInterface_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "[#USB] Plugin conforming to ACCPlatformUSBHostPluginProtocol does not implement setUSBHostHIDInterface:forConnectionUUID:!", v2, v3, v4, v5, v6);
}

void _getUSBHostPluginInstance_cold_1(NSObject *a1)
{
  uint64_t v2 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___ACCPlatformUSBHostPluginProtocol);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "[#USB] Could not find plugin conforming to %@!", (uint8_t *)&v3, 0xCu);
}

void platform_usb_clearUSBHostHIDInterfaces_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "[#USB] Plugin conforming to ACCPlatformUSBHostPluginProtocol does not implement clearUSBHostHIDInterfacesForConnectionUUID:!", v2, v3, v4, v5, v6);
}

void platform_usb_configureUSBHostNCMInterface_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "[#USB] Plugin conforming to ACCPlatformUSBHostPluginProtocol does not implement setUSBHostNCMInterface:forConnectionUUID:!", v2, v3, v4, v5, v6);
}

void platform_usb_setNeedOutZlp_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "[#USB] Plugin conforming to ACCPlatformUSBHostPluginProtocol does not implement setNeedOutZLP:maxOutLength:forConnectionUUID:!", v2, v3, v4, v5, v6);
}

void configStream_endpoint_create_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "configStream initSession: ", v1, 2u);
}

void __configStream_endpoint_processIncomingData_block_invoke_cold_6(uint64_t a1, uint64_t a2, os_log_t log)
{
  if (a1 && *(void *)a1) {
    int v3 = *(_DWORD *)(*(void *)a1 + 24);
  }
  else {
    int v3 = 17;
  }
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "configStream processIncomingData: %{coreacc:ACCEndpoint_TransportType_t}d dataIn %@", (uint8_t *)v4, 0x12u);
}

void _configStream_endpoint_sendNextClientRequest_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 16);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "configStream sendNextClientRequest for endpoint: %@", (uint8_t *)&v3, 0xCu);
}

void qiAuth_protocol_start_cold_1()
{
  LODWORD(v2) = 136315906;
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5_9((void *)&_mh_execute_header, v0, v1, "%s:%d result %d, role %d", v2, v3, v4, v5);
}

void qiAuth_protocol_initMsg_GET_DIGESTS_cold_2()
{
  LODWORD(v3) = 136315906;
  *(void *)((char *)&v3 + 4) = "qiAuth_protocol_initMsg_GET_DIGESTS";
  OUTLINED_FUNCTION_12_2();
  LOWORD(v4) = 0;
  HIWORD(v4) = v0;
  LOWORD(v5) = v0;
  HIWORD(v5) = v1;
  OUTLINED_FUNCTION_5_9((void *)&_mh_execute_header, v1, v2, "%s:%d version %d, slotMask 0x%x", (const char *)v3, (unint64_t)"qiAuth_protocol_initMsg_GET_DIGESTS" >> 32, v4, v5);
}

void qiAuth_protocol_timeoutForRequest_cold_1(uint64_t a1, int a2, NSObject *a3)
{
  int v5 = *(unsigned __int8 *)(a1 + 12);
  qiAuth_protocol_msgTypeString(a2);
  *(_DWORD *)uint8_t v8 = 136316162;
  OUTLINED_FUNCTION_7_2();
  *(_DWORD *)&v8[7] = 2611;
  v8[9] = v6;
  int v9 = v5;
  __int16 v10 = v6;
  int v11 = a2;
  __int16 v12 = 2080;
  uint64_t v13 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s:%d TX: Unexpected MsgType!!! ver %d, msgType %d(%s)", (uint8_t *)v8, 0x28u);
}

void _qiAuth_protocol_timeoutCallback_cold_1()
{
  LODWORD(v2) = 136315906;
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_5_9((void *)&_mh_execute_header, v0, v1, "%s:%d Unknown role(%d)! can't handle timer %d!", v2, v3, v4, v5);
}

void _qiAuth_protocol_timeoutCallback_cold_3()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s:%d RX: Unhandled timeoutType %d !!!", v2, v3, v4, v5, 2u);
}

void qiAuth_protocol_processIncomingData_cold_2(int a1, NSObject *a2)
{
  qiAuth_protocol_msgTypeString(a1);
  *(_DWORD *)__int16 v6 = 136315906;
  OUTLINED_FUNCTION_7_2();
  *(_DWORD *)&v6[7] = 425;
  v6[9] = v4;
  int v7 = a1;
  __int16 v8 = 2080;
  uint64_t v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s:%d SendData, outMsgType %u(%s)", (uint8_t *)v6, 0x22u);
}

void qiAuth_protocol_processIncomingData_cold_4()
{
  *(_DWORD *)__int16 v4 = 136316674;
  OUTLINED_FUNCTION_10_5();
  *(_DWORD *)&v4[7] = 316;
  v4[9] = v0;
  int v5 = v1;
  __int16 v6 = v0;
  int v7 = 0;
  __int16 v8 = v0;
  int v9 = 0;
  __int16 v10 = 2080;
  int v11 = "UNKNOWN";
  __int16 v12 = v0;
  int v13 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s:%d Unknown Role! %d, ver %d, msgType %d(%s), dataInLen %d", (uint8_t *)v4, 0x34u);
}

void _qiAuth_protocol_handleResponse_DIGESTS_cold_3()
{
  OUTLINED_FUNCTION_15_0(__stack_chk_guard);
  v2[0] = 136315906;
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_11_3((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d", (uint8_t *)v2);
}

void _qiAuth_protocol_handleResponse_CERTIFICATE_cold_2()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s:%d Failed to validate certChain data!!! slot %d", v2, v3, v4, v5, 2u);
}

void _qiAuth_protocol_handleResponse_CERTIFICATE_cold_7()
{
  OUTLINED_FUNCTION_15_0(__stack_chk_guard);
  v2[0] = 136315906;
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_11_3((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d", (uint8_t *)v2);
}

void _qiAuth_protocol_handleResponse_CHALLENGE_AUTH_cold_7()
{
  OUTLINED_FUNCTION_15_0(__stack_chk_guard);
  v2[0] = 136315906;
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_11_3((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d", (uint8_t *)v2);
}

void _qiAuth_protocol_handleResponse_ERROR_cold_2()
{
  LODWORD(v5) = 136316162;
  OUTLINED_FUNCTION_8_5();
  LOWORD(v7) = 0;
  HIWORD(v7) = v0;
  LOWORD(v8) = v0;
  HIWORD(v8) = v1;
  OUTLINED_FUNCTION_6_11((void *)&_mh_execute_header, v2, v3, "%s:%d RX: ERROR msg(%d): Unknown errorCode 0x%02X, errorData 0x%02X", v5, v6, v7, v8, v4);
}

void _qiAuth_protocol_handleResponse_ERROR_cold_8()
{
  OUTLINED_FUNCTION_15_0(__stack_chk_guard);
  v2[0] = 136315906;
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_11_3((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d", (uint8_t *)v2);
}

void qiAuth_protocol_authStateString_cold_1()
{
  *(_DWORD *)int v4 = 136315906;
  OUTLINED_FUNCTION_7_2();
  *(_DWORD *)&v4[7] = 756;
  v4[9] = 2080;
  uint64_t v5 = v0;
  __int16 v6 = v1;
  int v7 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s:%d result %s, authState %d", (uint8_t *)v4, 0x22u);
}

void qiAuth_protocol_saveDigest_cold_2()
{
  LODWORD(v2) = 136316162;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_6_11((void *)&_mh_execute_header, v0, v1, "%s:%d Unknown/Invalid Role! %d, result %d, slot %d", v2, v3, v4, v5, v6);
}

void qiAuth_protocol_saveCertNextSegment_cold_3()
{
  LODWORD(v2) = 136316162;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_6_11((void *)&_mh_execute_header, v0, v1, "%s:%d Unknown/Invalid Role! %d, result %d, slot %d", v2, v3, v4, v5, v6);
}

void qiAuth_protocol_calculateChallengeHash_cold_2()
{
  OUTLINED_FUNCTION_13_2(__stack_chk_guard);
  LODWORD(v2) = 136315906;
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_7_12((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d, failed to hash TBSAuth!!!", v2, v3, v4, v5);
}

void qiAuth_protocol_calculateChallengeHash_cold_4()
{
  OUTLINED_FUNCTION_13_2(__stack_chk_guard);
  LODWORD(v2) = 136315906;
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_7_12((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d, failed to get compose TBSAuth !!!", v2, v3, v4, v5);
}

void qiAuth_protocol_calculateChallengeHash_cold_6()
{
  OUTLINED_FUNCTION_13_2(__stack_chk_guard);
  LODWORD(v2) = 136315906;
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_7_12((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d, failed to create temp CHALLENGE_AUTH message for TBSAuth !!!", v2, v3, v4, v5);
}

void qiAuth_protocol_calculateChallengeHash_cold_8()
{
  OUTLINED_FUNCTION_13_2(__stack_chk_guard);
  LODWORD(v2) = 136315906;
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_7_12((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d, failed to get certificate digest !!!", v2, v3, v4, v5);
}

void qiAuth_protocol_calculateChallengeHash_cold_10()
{
  OUTLINED_FUNCTION_13_2(__stack_chk_guard);
  LODWORD(v2) = 136315906;
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_7_12((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d, We have not received a certificate digest !!!", v2, v3, v4, v5);
}

void qiAuth_protocol_calculateChallengeHash_cold_12()
{
  OUTLINED_FUNCTION_13_2(__stack_chk_guard);
  LODWORD(v2) = 136315906;
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_7_12((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d, We have not received a valid certificateAuth message !!!", v2, v3, v4, v5);
}

void _qiAuth_protocol_getCachedCertLengthFromHeader_cold_1()
{
  LODWORD(v2) = 136315906;
  *(void *)((char *)&v2 + 4) = "_qiAuth_protocol_getCachedCertLengthFromHeader";
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_5_9((void *)&_mh_execute_header, v0, v1, "%s:%d result %d, slot %d", (const char *)v2, (unint64_t)"_qiAuth_protocol_getCachedCertLengthFromHeader" >> 32, v3, v4);
}

void _qiAuth_protocol_getCachedCertLengthFromHeader_cold_3()
{
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s:%d Unknown role! %d", v2, v3, v4, v5, 2u);
}

void _qiAuth_protocol_finishAuth_cold_2()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s:%d Failed to re-calculate challenge hash!!! slot %d", v2, v3, v4, v5, 2u);
}

void _qiAuth_protocol_finishAuth_cold_3()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s:%d Failed to calculate challenge hash!!! slot %d", v2, v3, v4, v5, 2u);
}

void _qiAuth_protocol_finishAuth_cold_5()
{
  LODWORD(v2) = 136315906;
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7_12((void *)&_mh_execute_header, v0, v1, "%s:%d We don't have the CHALLENGE request info anymore to calculate hash!!!  slot %d, lastMsgSent %d", v2, v3, v4, v5);
}

void _qiAuth_protocol_finishAuth_cold_8()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s:%d Invalid slot %d!!!", v2, v3, v4, v5, 2u);
}

void _qiAuth_protocol_finishAuth_cold_10()
{
  OUTLINED_FUNCTION_13_2(__stack_chk_guard);
  LODWORD(v2) = 136315906;
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_5_9((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d", v2, v3, v4, v5);
}

void _qiAuth_protocol_finishAuth_cold_12()
{
  OUTLINED_FUNCTION_15_0(__stack_chk_guard);
  v2[0] = 136315906;
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_11_3((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d", (uint8_t *)v2);
}

void iap2_features_registerMessageHandlers_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Message handlers already registered!", v1, 2u);
}

void iap2_features_registerMessageHandlers_cold_3(uint8_t *buf, uint64_t a2, int *a3, os_log_t log)
{
  int v4 = _kiAP2FeatureInfoEntries[4 * a2];
  *(_DWORD *)buf = 67109120;
  *a3 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Registering message handlers for %{coreacc:iAP2Feature_t}d...", buf, 8u);
}

void iap2_features_registerIdentificationParamHandlers_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Identification param handlers already registered!", v1, 2u);
}

void iap2_features_registerIdentificationParamHandlers_cold_3(uint8_t *buf, uint64_t a2, int *a3, os_log_t log)
{
  int v4 = _kiAP2FeatureInfoEntries[4 * a2];
  *(_DWORD *)buf = 67109120;
  *a3 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Registering identification param handlers for %{coreacc:iAP2Feature_t}d...", buf, 8u);
}

void iap2_features_createFeature_cold_2(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error creating feature: %{coreacc:iAP2Feature_t}d!", (uint8_t *)v2, 8u);
}

void iap2_sessionRouter_processSessionData_cold_2(uint64_t a1, NSObject *a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 1);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Received incoming packet for session type: %{coreacc:iAP2PacketServiceType_t}d", (uint8_t *)v3, 8u);
}

void iAP2FSMCreate_cold_1()
{
}

void iAP2FSMHandleEvent_cold_2()
{
}

void iAP2FSMHandleEvent_cold_3()
{
}

void _startCallStateUpdatesHandler_cold_1(CFSetRef *a1)
{
  CFSetGetCount(*a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v1, v2, "paramCount: %ld", v3, v4, v5, v6, v7);
}

void _startCallStateUpdatesHandler_cold_4(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _startCallStateUpdatesHandler_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "Start Call State Updates!", v2, v3, v4, v5, v6);
}

void _stopCallStateUpdatesHandler_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "Stop Call State Updates!", v2, v3, v4, v5, v6);
}

void _startCommunicationsUpdatesHandler_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "Start Communications Updates!", v2, v3, v4, v5, v6);
}

void _stopCommunicationsUpdatesHandler_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "Stop Communications Updates!", v2, v3, v4, v5, v6);
}

void _initiateCallHandler_cold_1()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "Invalid call type: %d - ignoring message", v2, v3, v4, v5, v6);
}

void _initiateCallHandler_cold_2()
{
  OUTLINED_FUNCTION_0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Call type is destination with invalid destination ID: %@ or service type: %d - ignoring message", v1, 0x12u);
}

void _initiateCallHandler_cold_4()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "Invalid iAP2 callService: %d!", v2, v3, v4, v5, v6);
}

void _initiateCallHandler_cold_6()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "Unknown initiate call type: %d!", v2, v3, v4, v5, v6);
}

void _acceptCallHandler_cold_2()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "Invalid acceptAction: %d - ignoring message", v2, v3, v4, v5, v6);
}

void _acceptCallHandler_cold_3()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "Invalid iAP2 acceptAction: %d!", v2, v3, v4, v5, v6);
}

void _endCallHandler_cold_2()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "Invalid endAction: %d - ignoring message", v2, v3, v4, v5, v6);
}

void _holdStatusUpdateHandler_cold_1()
{
  OUTLINED_FUNCTION_8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Hold status update without holdStatus parameter - ignoring message", v1, 2u);
}

void _muteStatusUpdateHandler_cold_1()
{
  OUTLINED_FUNCTION_8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Mute status update without muteStatus parameter - ignoring message", v1, 2u);
}

void _sendDTMFHandler_cold_1()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "Send DTMF Tone with invalid tone param: %d - ignoring message", v2, v3, v4, v5, v6);
}

void _startListUpdatesHandler_cold_6(uint64_t a1, uint64_t a2)
{
  iAP2MsgGetMsgID(a2);
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v2, v3, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v4, v5, v6, v7, v8);
}

void _startListUpdatesHandler_cold_11(uint64_t a1, uint64_t a2)
{
  iAP2MsgGetMsgID(a2);
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, v2, v3, "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message", v4, v5, v6, v7, v8);
}

void _startListUpdatesHandler_cold_12(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void _startListUpdatesHandler_cold_13(uint64_t a1)
{
  iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_2_10((void *)&_mh_execute_header, v1, v2, "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v3, v4, v5, v6, 0);
}

void iap2_communications_callStateUpdateHandler_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "callState:\n%@", v2, v3, v4, v5, v6);
}

void iap2_communications_callStateUpdateHandler_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "callStateUpdates.subscriptionList:\n%@", v2, v3, v4, v5, v6);
}

void iap2_communications_communicationsUpdateHandler_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "commStatus:\n%@", v2, v3, v4, v5, v6);
}

void iap2_communications_communicationsUpdateHandler_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "communicationsUpdates.subscriptionList:\n%@", v2, v3, v4, v5, v6);
}

void _recentsListUpdateHandler_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "subscriptionListString:\n%@", v2, v3, v4, v5, v6);
}

void _convertACCCallServiceToiAP2CallService_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iAP2MsgGetNextParamWithError_cold_1(int a1, int a2, os_log_t log)
{
  int v3 = 136315906;
  uint64_t v4 = "iAP2MsgGetNextParamWithError";
  __int16 v5 = 1024;
  int v6 = 406;
  __int16 v7 = 1024;
  int v8 = a1;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s:%d reached end of parameter (%d bytes), grplen %d\n", (uint8_t *)&v3, 0x1Eu);
}

void iAP2MsgGetNextParamWithError_cold_3(int a1, NSObject *a2)
{
  int v2 = 136315650;
  int v3 = "iAP2MsgGetNextParamWithError";
  __int16 v4 = 1024;
  int v5 = 411;
  __int16 v6 = 1024;
  int v7 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s:%d reached end of message buffer (%d bytes)\n", (uint8_t *)&v2, 0x18u);
}

void _getSystemPluginInstance_cold_1(NSObject *a1)
{
  int v2 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___ACCPlatformSystemPluginProtocol);
  int v3 = 138412290;
  __int16 v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "[#System] Could not find plugin conforming to %@!", (uint8_t *)&v3, 0xCu);
}

void mfi4Auth_util_packIntoTunnelDataiAP2Msg_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_util_packIntoTunnelDataiAP2Msg_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_util_packIntoTunnelDataiAP2Msg_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_util_unpackFromTunnelDataiAP2Msg_cold_4(uint64_t a1, NSObject *a2)
{
  v4[0] = 67109376;
  v4[1] = iAP2MsgGetMsgID(a1);
  __int16 v5 = 1024;
  int MsgLen = iAP2MsgGetMsgLen(a1);
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "mfi4Auth_util_unpackFromTunnelDataiAP2Msg: message 0x%04X, length %d", (uint8_t *)v4, 0xEu);
}

void accAuthProtocol_endpoint_publish_cold_1(unsigned __int8 **a1, NSObject *a2)
{
  int v2 = **a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "accAuthProtocol publish: acc_auth_protocol_endSession sessionID %d", (uint8_t *)v3, 8u);
}

void _accAuthProtocol_endpoint_sendAuthSetupStart_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "accAuthProtocol sendAuthSetupStart: no endpointUUID for endpoint!!", v1, 2u);
}

void __iAP2BuffPoolGetSendPacket_cold_1()
{
}

void __iAP2BuffPoolGetSendPacket_cold_2()
{
}

void __iAP2BuffPoolGetRecvPacket_cold_1()
{
}

void __iAP2BuffPoolGetRecvPacket_cold_2()
{
}

void qiAuth_util_generateNonce_cold_1()
{
  LODWORD(v2) = 136315906;
  *(void *)((char *)&v2 + 4) = "qiAuth_util_generateNonce";
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_5_9((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, nonceSize %d", (const char *)v2, (unint64_t)"qiAuth_util_generateNonce" >> 32, v3, v4);
}

void qiAuth_util_verifyCertificateChain_cold_2()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3_21();
  OUTLINED_FUNCTION_4_16((void *)&_mh_execute_header, v0, v1, "%s:%d INTERNAL: Success!!! %d -> %d", v2, v3, v4, v5, 2u);
}

void qiAuth_util_verifyChallengeSignature_cold_2()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3_21();
  OUTLINED_FUNCTION_4_16((void *)&_mh_execute_header, v0, v1, "%s:%d INTERNAL: Success!!! %d -> %d", v2, v3, v4, v5, 2u);
}

void qiAuth_util_verifyChallengeSignature_cold_5()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_3_21();
  OUTLINED_FUNCTION_4_16((void *)&_mh_execute_header, v0, v1, "%s:%d INTERNAL: Success!!! %d -> %d", v2, v3, v4, v5, 2u);
}

void qiAuth_util_policy_preferredSlot_cold_1()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_5_10((void *)&_mh_execute_header, v0, v1, "%s:%d PreferredSlot: %d", v2, v3, v4, v5, 2u);
}

void qiAuth_util_policy_challengeFirst_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void qiAuth_util_callbackOnTimer_cold_2()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%s:%d ERROR: Timer not initialized!!!!", v2, v3, v4, v5, 2u);
}

void qiAuth_util_callbackOnTimer_cold_4()
{
  v1[0] = 136315650;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_8_7();
  v1[5] = 4;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d ERROR: All available timers running!!!! %d", (uint8_t *)v1, 0x18u);
}

void qiAuth_util_cancelTimer_cold_1()
{
  v2[0] = 136315650;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_8_7();
  v2[5] = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s:%d ERROR: Timer %d not running!!!!", (uint8_t *)v2, 0x18u);
}

void platform_CarPlay_isWirelessCarPlayAllowedForCertSerial_cold_1()
{
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "[#CarPlay] isWirelessCarPlayAllowedForCertSerial() timed out after %lldms!", v2, v3, v4, v5, v6);
}

void platform_CarPlay_isCarPlayPairedWithCertSerial_cold_1()
{
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "[#CarPlay] isCarPlayPairedWithCertSerial() timed out after %lldms!", v2, v3, v4, v5, v6);
}

void platform_CarPlay_carPlayAppLinksStateForCertSerial_cold_1()
{
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "[#CarPlay] carPlayAppLinksStateForCertSerial() timed out after %lldms!", v2, v3, v4, v5, v6);
}

void platform_CarPlay_startSession_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[#CarPlay] platform_CarPlay_startSession: startSessionProperties %@", (uint8_t *)&v2, 0xCu);
}

void acc_accInfo_updateAccessoryInfoWithDictionary_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  uint64_t v9 = a1[7];
  uint64_t v10 = a1[8];
  uint64_t v11 = a1[9];
  uint64_t v12 = a1[10];
  uint64_t v13 = a1[11];
  uint64_t v15 = a1[12];
  uint64_t v14 = a1[13];
  int v16 = 136318978;
  __int16 v17 = "acc_accInfo_updateAccessoryInfoWithDictionary";
  __int16 v18 = 1024;
  int v19 = 381;
  __int16 v20 = 2112;
  uint64_t v21 = v2;
  __int16 v22 = 2112;
  uint64_t v23 = v3;
  __int16 v24 = 2112;
  uint64_t v25 = v4;
  __int16 v26 = 2112;
  uint64_t v27 = v5;
  __int16 v28 = 2112;
  uint64_t v29 = v6;
  __int16 v30 = 2112;
  uint64_t v31 = v7;
  __int16 v32 = 2112;
  uint64_t v33 = v8;
  __int16 v34 = 2112;
  uint64_t v35 = v9;
  __int16 v36 = 2112;
  uint64_t v37 = v11;
  __int16 v38 = 2112;
  uint64_t v39 = v10;
  __int16 v40 = 2112;
  uint64_t v41 = v12;
  __int16 v42 = 2112;
  uint64_t v43 = v13;
  __int16 v44 = 2112;
  uint64_t v45 = v15;
  __int16 v46 = 2112;
  uint64_t v47 = v14;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[#Accessory Info] %s:%d Set accessory info: name: %@, manufacturer: %@, model: %@, serialNumber: %@, hardwareVersion: %@, firmwareVersionActive: %@, firmwareVersionPending: %@, ppid: %@ regionCode: %@, deviceUID: %@, deviceCompatibility: %@, vid/pid: %@/%@, accessoryPlatformID: %@", (uint8_t *)&v16, 0x9Eu);
}

void _getPluginInstance_cold_1(NSObject *a1)
{
  uint64_t v2 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___ACCPlatformLightningPluginProtocol);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "[#Lightning] Could not find plugin conforming to %@!", (uint8_t *)&v3, 0xCu);
}

void _sendStopOOBBTPairing_cold_1()
{
  OUTLINED_FUNCTION_8();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "ERROR!!!: Unable to allocate buffer for invokeHandler call parameter struct", v1, 2u);
}

void iap2_identification_releaseIdentInfo_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "release identInfo", v2, v3, v4, v5, v6);
}

void iap2_identification_checkIdentificationInfoFeatures_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pFeatureInfoEntries == NULL!", v2, v3, v4, v5, v6);
}

void _addRejectParam_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pIdentInfo == NULL!", v2, v3, v4, v5, v6);
}

void iap2_identification_processStringParam_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pStr == NULL!", v2, v3, v4, v5, v6);
}

void iap2_identification_cbIdentificationInfoParams_cold_2()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "Failed to add received param: %d to set!!", v2, v3, v4, v5, v6);
}

void iap2_identification_cbIdentificationInfoParams_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_identification_cbIdentificationInfoParams_cold_6()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "Parsing identification info group failed for paramID: %u!", v2, v3, v4, v5, v6);
}

void iap2_identification_getParamHandler_cold_1()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "iAP2IdentificationParamHandler_t = NULL for param ID: %d!", v2, v3, v4, v5, v6);
}

void iap2_identification_releaseRejectMessage_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "release rejectMessage and identified for features", v2, v3, v4, v5, v6);
}

void iap2_identification_checkMsgIDList_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pIdentInfo->messagesRcvdFromDevSet = NULL", v2, v3, v4, v5, v6);
}

void iap2_identification_checkMsgIDList_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pIdentInfo->messagesSentByAccSet = NULL", v2, v3, v4, v5, v6);
}

void iap2_identification_checkRequiredTransportComponentParam_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Unhandled required transport component check!!", v2, v3, v4, v5, v6);
}

void iap2_identification_identificationInfoHandler_cold_5()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "Error parsing an identification component, aborting!\n(One of the param feature handlers returned error: %d)", v2, v3, v4, v5, v6);
}

void iap2_identification_identificationInfoHandler_cold_7()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "identInfoSet == false!", v2, v3, v4, v5, v6);
}

void iap2_identification_copyMacAddressForComponentID_cold_1(unsigned __int16 *a1, uint64_t a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "iap2_identification_copyMacAddressForComponentID: componentID=%d macAddr=%@", (uint8_t *)v4, 0x12u);
}

void iap2_identification_setParamHandler_cold_1()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "Added identification param handler for paramID: 0x%04X", v2, v3, v4, v5, v6);
}

void iap2_identification_setParamHandler_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "Initialized identification param handler dictionary!", v2, v3, v4, v5, v6);
}

void iap2_identification_setRequiredIdentificationParam_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_identification_setRequiredIdentificationParam_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "Initialized required identification params set!", v2, v3, v4, v5, v6);
}

void acc_protocolParser_detectProtocol_cold_1(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 0xFFFF;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Incoming data length is larger than max buffer size of %u - discarding data!", (uint8_t *)v1, 8u);
}

void _runFSM_cold_1(unsigned __int8 *a1, unsigned __int16 *a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Current byte: %02X, index: %d", (uint8_t *)v5, 0xEu);
}

void iap2_messageHandlers_setHandler_cold_1(unsigned __int16 a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Added message handler for ID: 0x%04X", (uint8_t *)v2, 8u);
}

void iap2_messageHandlers_setHandler_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Initialized message handler dictionary!", v1, 2u);
}

void __t56_endpoint_processIncomingData_block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 52);
  int v4 = *(_DWORD *)(a1 + 48);
  uint64_t v5 = *a2;
  int v6 = 136315906;
  int v7 = "t56_endpoint_processIncomingData_block_invoke";
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 1024;
  int v11 = v4;
  __int16 v12 = 2112;
  uint64_t v13 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to process incoming message!!! hdr 0x%02X, (%d bytes) %@", (uint8_t *)&v6, 0x22u);
}

void _t56_endpoint_handleMessage_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "dataOutBuffer not allocated", v2, v3, v4, v5, v6);
}

void t56_endpoint_sendOutgoingData_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pDataOut = NULL", v2, v3, v4, v5, v6);
}

void t56_endpoint_sendOutgoingData_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "dataOutLen = 0", v2, v3, v4, v5, v6);
}

void t56_endpoint_sendOutgoingData_cold_3(uint64_t a1, unsigned __int16 a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = 136315650;
  uint64_t v5 = "t56_endpoint_sendOutgoingData";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 1024;
  int v9 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: pProtocolEndpoint %@, dataOutLen %d", (uint8_t *)&v4, 0x1Cu);
}

void t56_endpoint_sendOutgoingDataCF_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "dataOut = NULL", v2, v3, v4, v5, v6);
}

void t56_endpoint_sendOutgoingDataCF_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pProtocolEndpoint->pEndpoint = NULL", v2, v3, v4, v5, v6);
}

void t56_endpoint_sendOutgoingDataCF_cold_4(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "t56_endpoint_sendOutgoingDataCF";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: parentEndpoint NULL, dataOut %@", (uint8_t *)&v2, 0x16u);
}

void t56_endpoint_sendOutgoingDataCF_cold_6()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_0((void *)&_mh_execute_header, v0, v1, "%s: parentEndpoint %@, dataOut %@", v2);
}

void t56_endpoint_sendOutgoingDataCF_cold_8()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_0((void *)&_mh_execute_header, v0, v1, "%s: pProtocolEndpoint %@, dataOut %@", v2);
}

void mfi4Auth_protocol_decryptIncomingData_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "decryptIncomingData: failed", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_decryptIncomingData_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "decryptIncomingData: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_decryptIncomingData_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "decryptIncomingData: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_decryptIncomingData_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "decryptIncomingData: !msgId", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_decryptIncomingData_cold_6()
{
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Received plain text message", v1, 2u);
}

void mfi4Auth_protocol_decryptIncomingData_cold_10()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "decryptIncomingData: authSession shutting down", v2, v3, v4, v5, v6);
}

void logObjectForModule_cold_1_0()
{
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, &_os_log_default, v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

void mfi4Auth_protocol_decryptPayload_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "decryptPayload: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_decryptPayload_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "decryptPayload: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_decryptPayload_cold_3()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "decryptPayload: ccsigma_open failed: %d", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_decryptPayload_cold_9()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "decryptPayload: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_encryptOutgoingData_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "encryptOutgoingData: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_encryptOutgoingData_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "encryptOutgoingData: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_encryptOutgoingData_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "encryptOutgoingData: !msgId", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_encryptOutgoingData_cold_5()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "encryptOutgoingData: encryptPayload: error: %d", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_encryptOutgoingData_cold_9()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "encryptOutgoingData: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_encryptPayload_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "encryptPayload: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_encryptPayload_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "encryptPayload: ccsigma_seal: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_encryptPayload_cold_6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "encryptPayload: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_authSetupStart_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "authSetupStart: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_authSetupStart_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "outMessage: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_authSetupStart_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "authSetupStart: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_RequestAuthSetup_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "RequestAuthSetup: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_RequestAuthSetup_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "RequestAuthSetup: !outMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_RequestAuthSetup_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "RequestAuthSetup: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handleAuthSessionClose_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handleAuthSessionClose: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handleAuthSessionClose_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handleAuthSessionClose: !endpointUUID", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handleAuthSessionClose_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handleAuthSessionClose: !pEndpoint", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handleAuthSessionClose_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handleAuthSessionClose: !pProtocolEndpoint", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handleAuthSessionClose_cold_6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handleAuthSessionClose: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetup_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthSetup: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetup_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthSetup: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetup_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_handle_AuthSetup: mfi4Auth_protocol_initMessage_RequestAuthStart error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetup_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "nego_trans malloc error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetup_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "initMessage_AuthStart error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetup_cold_6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "initSigmaContext error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetup_cold_7()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "missing params", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetup_cold_9(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_11()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "version fail", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetup_cold_12(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_13()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "auth type fail", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetup_cold_14(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_15()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "cert chain type fail", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetup_cold_16()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "sessionNonce fail", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetup_cold_17()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "dhPublicKey %d", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetup_cold_18()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "dhPublicKey fail", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetup_cold_19()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Capabilities fail: Too Many!", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetup_cold_20()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Capabilities fail", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetup_cold_21()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthSetup: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_RequestAuthChallengeResponse_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "RequestAuthChallengeResponse: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_RequestAuthChallengeResponse_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "RequestAuthChallengeResponse: !outMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_RequestAuthChallengeResponse_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "RequestAuthChallengeResponse: mismatched auth type", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_RequestAuthChallengeResponse_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "RequestAuthChallengeResponse: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_RequestAuthStart_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "RequestAuthStart: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_RequestAuthStart_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "RequestAuthStart: !outMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_RequestAuthStart_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "RequestAuthStart: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContext_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "initSigmaContext: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContext_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "initSigmaContext: !negoTrans", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContext_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "!sigmaContext", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContext_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "!rng", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContext_cold_8()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_initSigmaContext: key_share_size != 33", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContext_cold_10()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_initSigmaContext: ccsigma_export_key_share: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContext_cold_13()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ccsigma_derive_session_keys: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContext_cold_14()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ccsigma_import_peer_key_share: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContext_cold_15()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "initSigmaContext: no signing key", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContext_cold_17()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ccsigma_set_signing_function: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContext_cold_19()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ccsigma_import_signing_key: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContext_cold_21()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "ccsigma_init: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContext_cold_22()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_initIdentity error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContext_cold_23()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_initSigmaContext: no identity left", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSigmaContext_cold_27()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "initSigmaContext: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_AuthStart_cold_1()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_initMessage_AuthStart: error %d", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_AuthStart_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthStart: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_AuthStart_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthStart: !outMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_AuthStart_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthStart: ccsigma_seal: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_AuthStart_cold_6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthStart: ccsigma_sign: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_AuthStart_cold_7()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthStart: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthState_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthState: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthState_cold_2()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "AuthState: Unknown authStatus! %d", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthState_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthState: authSession shuttingDown", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetupFailed_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthSetupFailed: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetupFailed_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthSetupFailed: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthSetupFailed_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthSetupFailed: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthStart_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthStart: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_RequestAuthCert_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "RequestAuthCert: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_RequestAuthCert_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "RequestAuthCert: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_RequestAuthCert_cold_3(unsigned __int8 a1, NSObject *a2)
{
  int v2 = 136316162;
  uint64_t v3 = "mfi4Auth_protocol_handle_RequestAuthCert";
  __int16 v4 = 1024;
  int v5 = 744;
  __int16 v6 = 1024;
  int v7 = a1;
  __int16 v8 = 1024;
  int v9 = 1;
  __int16 v10 = 1024;
  int v11 = 2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s:%d paramMask 0x%x, CertHash paramMask 0x%x, CertKeyID paramMask 0x%x ", (uint8_t *)&v2, 0x24u);
}

void mfi4Auth_protocol_handle_RequestAuthCert_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_handle_RequestAuthCert: CertId failed", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_RequestAuthCert_cold_6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "RequestAuthCert: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_AuthCert_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthCert: !outMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_AuthCert_cold_2()
{
  OUTLINED_FUNCTION_0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "AuthCert:: Invalid cert_resp, null or 0 len(%zu), certType %d", v1, 0x12u);
}

void mfi4Auth_protocol_initMessage_AuthCert_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthCert: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthCert_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthCert: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthCert_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthCert: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthCert_cold_3()
{
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_handle_AuthCert: decompressed cert is too large! (%zu)", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthCert_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_handle_AuthCert: SecCertificateCreateWithBytes error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthCert_cold_6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_handle_AuthCert: SecCertificateGetSubjectKeyID error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthCert_cold_8()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_handle_AuthCert: SecCertificateGetSubjectKeyID(root) error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthCert_cold_11()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_handle_AuthCert: memcmp error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthCert_cold_14()
{
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_handle_AuthCert: decompress error: failed to allocated %zu bytes", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthCert_cold_15()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_handle_AuthCert: decompress error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthCert_cold_16()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_handle_AuthCert: decompress size error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthCert_cold_17()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_handle_AuthCert: iAP2MsgGetDataAsArrayU8 error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthCert_cold_18()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_handle_AuthCert: count=%d", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_RequestAuthCert_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "RequestAuthCert: !outMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_RequestAuthCert_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "initMessage_RequestAuthCert: malloc failed", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateCertChain_cold_1()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_validateCertChain: errorNo: %d", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateCertChain_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "validateCertChain: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateCertChain_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "validateCertChain: !certList", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateCertChain_cold_8()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "validateCertChain: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateSignature_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "validateSignature: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateSignature_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_validateSignature: !leafCert", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateSignature_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_validateSignature: !certData", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateSignature_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_validateSignature: !nonceData", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateSignature_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_validateSignature: !signatureData", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateSignature_cold_7()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_validateSignature: MFAAVerifyNonceSignature error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateSignature_cold_8()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_validateSignature: __createCertificateRefWithBytes error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateSignature_cold_9()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_validateSignature: SecCertificateCopyKey error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateSignature_cold_10()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_validateSignature: SecKeyCopyExternalRepresentation error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateSignature_cold_11()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_validateSignature: ccsigma_verify error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateSignature_cold_12()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_validateSignature: ccsigma_import_peer_verification_key error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateSignature_cold_14()
{
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_validateSignature: SecKeyCopyExternalRepresentation error: %@", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_validateSignature_cold_15()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "validateSignature: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_AuthenticationSucceeded_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthenticationSucceeded: !outMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initMessage_AuthenticationSucceeded_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthenticationSucceeded: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthFinish_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthFinish: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthFinish_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthFinish: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthFinish_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "handle_AuthFinish: initMessage_RequestAuthCert failed", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthFinish_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthFinish: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthChallengeResponse_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthChallengeResponse: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthChallengeResponse_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthChallengeResponse: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthChallengeResponse_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthChallengeResponse: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthenticationReset_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthenticationReset: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthenticationReset_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthenticationReset: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthenticationReset_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthenticationReset: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthenticationFailed_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthenticationFailed: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthenticationFailed_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthenticationFailed: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthenticationFailed_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthenticationFailed: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthenticationSucceeded_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthenticationSucceeded: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_handle_AuthenticationSucceeded_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "AuthenticationSucceeded: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initIdentity_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "initIdentity: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initIdentity_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "initIdentity: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initIdentityCerts_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "initIdentityCerts: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initIdentityCerts_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "initIdentityCerts: authSession shutting down", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_processIncomingMessage: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "processIncomingMessage: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "processIncomingMessage: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "processIncomingData: !msgId", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_8()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "failed to handle auth setup", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_9()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "received OperationFailed", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_11()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "failed to handle auth starat", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_12()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "unexpected message", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_13()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "failed to handle request auth cert", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_16()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "failed to handle auth cert", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_17()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "failed to handle auth finish", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_18()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "failed to handle auth challenge response", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_19()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "failed to handle auth reset", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_20()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Received AuthenticationReset", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_22()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Received AuthenticationFailed", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_24()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "failed to handle auth success", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessage_cold_27()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "processIncomingMessage: authSession shuttingDown", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessageExtra_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "mfi4Auth_protocol_processIncomingMessageExtra: error", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessageExtra_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "processIncomingMessageExtra: !authSession", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessageExtra_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "processIncomingMessageExtra: !inMessage", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_processIncomingMessageExtra_cold_9()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "processIncomingMessageExtra: authSession shuttingDown", v2, v3, v4, v5, v6);
}

void t56_protocol_init_cold_1()
{
  LODWORD(v3) = 136315906;
  OUTLINED_FUNCTION_7_2();
  LOWORD(v5) = 0;
  HIWORD(v5) = v0;
  LOWORD(v6) = v0;
  HIWORD(v6) = v1;
  OUTLINED_FUNCTION_5_9((void *)&_mh_execute_header, v1, v2, "%s:%d result %d, role %dX", v3, v4, v5, v6);
}

void t56_protocol_start_cold_1()
{
  OUTLINED_FUNCTION_5_11(__stack_chk_guard);
  LODWORD(v4) = 136315906;
  OUTLINED_FUNCTION_10_5();
  LOWORD(v6) = 0;
  HIWORD(v6) = v0;
  LOWORD(v7) = v0;
  HIWORD(v7) = v1;
  OUTLINED_FUNCTION_5_9((void *)&_mh_execute_header, v2, v3, "%s:%d result %d, role %d", v4, v5, v6, v7);
}

void t56_protocol_timeoutForRequest_cold_1(uint64_t a1, int a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 12);
  if ((a2 - 1) > 7) {
    int v4 = "UNKNOWN";
  }
  else {
    int v4 = off_10021A788[a2 - 1];
  }
  int v5 = 136316162;
  int v6 = "t56_protocol_timeoutForRequest";
  __int16 v7 = 1024;
  int v8 = 975;
  __int16 v9 = 1024;
  int v10 = v3;
  __int16 v11 = 1024;
  int v12 = a2;
  __int16 v13 = 2080;
  uint64_t v14 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s:%d Device: Unexpected MsgType!!! ver %d, msgType %d(%s)", (uint8_t *)&v5, 0x28u);
}

void _T56Protocol_timeoutCallback_cold_1()
{
  LODWORD(v2) = 136315906;
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_8_8();
  HIWORD(v5) = v0;
  OUTLINED_FUNCTION_5_9((void *)&_mh_execute_header, v0, v1, "%s:%d Unknown role(%d)! can't handle timer %d!", v2, v3, v4, v5);
}

void _T56Protocol_timeoutCallback_cold_3()
{
  *(_DWORD *)int v3 = 136315650;
  OUTLINED_FUNCTION_7_2();
  *(_DWORD *)&int v3[7] = 617;
  v3[9] = v0;
  int v4 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s:%d Device: Unhandled timeoutType %d !!!", (uint8_t *)v3, 0x18u);
}

void t56_protocol_processIncomingData_cold_2()
{
  *(_DWORD *)int v4 = 136315906;
  OUTLINED_FUNCTION_10_5();
  *(_DWORD *)&v4[7] = 350;
  v4[9] = v0;
  int v5 = v1;
  __int16 v6 = 2080;
  uint64_t v7 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s:%d SendData, outMsgType %u(%s)", (uint8_t *)v4, 0x22u);
}

void t56_protocol_processIncomingData_cold_4()
{
  *(_DWORD *)os_log_t v3 = 136316674;
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_8_8();
  *(_DWORD *)&v3[13] = 0;
  v3[15] = v0;
  int v4 = 0;
  __int16 v5 = 2080;
  __int16 v6 = "UNKNOWN";
  __int16 v7 = v0;
  int v8 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s:%d Unknown Role! %d, ver %d, msgType %d(%s), dataInLen %d", (uint8_t *)v3, 0x34u);
}

void _t56_protocol_handleResponse_SESSION_RSP_cold_4()
{
  OUTLINED_FUNCTION_5_11(__stack_chk_guard);
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5_10((void *)&_mh_execute_header, v0, v1, "%s:%d role %d", v2, v3, v4, v5, 2u);
}

void _t56_protocol_handleResponse_DISCOVER_RSP_cold_6()
{
  OUTLINED_FUNCTION_5_11(__stack_chk_guard);
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5_10((void *)&_mh_execute_header, v0, v1, "%s:%d role %d", v2, v3, v4, v5, 2u);
}

void _t56_protocol_handleResponse_DATA_cold_7()
{
  OUTLINED_FUNCTION_5_11(__stack_chk_guard);
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5_10((void *)&_mh_execute_header, v0, v1, "%s:%d role %d", v2, v3, v4, v5, 2u);
}

void _t56_protocol_handleResponse_STATUS_cold_4()
{
  OUTLINED_FUNCTION_5_11(__stack_chk_guard);
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5_10((void *)&_mh_execute_header, v0, v1, "%s:%d role %d", v2, v3, v4, v5, 2u);
}

void _t56_protocol_handleRequest_SESSION_cold_4()
{
  OUTLINED_FUNCTION_5_11(__stack_chk_guard);
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5_10((void *)&_mh_execute_header, v0, v1, "%s:%d role %d", v2, v3, v4, v5, 2u);
}

void _t56_protocol_handleRequest_DISCOVER_cold_3()
{
  OUTLINED_FUNCTION_5_11(__stack_chk_guard);
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5_10((void *)&_mh_execute_header, v0, v1, "%s:%d role %d", v2, v3, v4, v5, 2u);
}

void _t56_protocol_handleRequest_POLL_cold_3()
{
  OUTLINED_FUNCTION_5_11(__stack_chk_guard);
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5_10((void *)&_mh_execute_header, v0, v1, "%s:%d role %d", v2, v3, v4, v5, 2u);
}

void _t56_protocol_handleRequest_DATA_cold_4()
{
  OUTLINED_FUNCTION_5_11(__stack_chk_guard);
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5_10((void *)&_mh_execute_header, v0, v1, "%s:%d role %d", v2, v3, v4, v5, 2u);
}

void _t56_protocol_handleRequest_TERMINATE_cold_4()
{
  OUTLINED_FUNCTION_5_11(__stack_chk_guard);
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5_10((void *)&_mh_execute_header, v0, v1, "%s:%d role %d", v2, v3, v4, v5, 2u);
}

void t56_protocol_initMsg_DISCOVER_cold_2()
{
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5_10((void *)&_mh_execute_header, v0, v1, "%s:%d sessionID %d", v2, v3, v4, v5, 2u);
}

void t56_protocol_initMsg_POLL_cold_2()
{
  v1[0] = 136315394;
  OUTLINED_FUNCTION_7_2();
  *(_DWORD *)((char *)&v1[3] + 2) = 1328;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s:%d enter", (uint8_t *)v1, 0x12u);
}

void _checkIdentificationInfo_cold_1_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "Identified for Native HID", v2, v3, v4, v5, v6);
}

void _checkIdentificationInfo_cold_3_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "Identified for HID", v2, v3, v4, v5, v6);
}

void _checkIdentificationInfo_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "checking HID ident info", v2, v3, v4, v5, v6);
}

void _hidComponentFunctionType_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pFeature is NULL", v2, v3, v4, v5, v6);
}

void _hidComponentFunctionType_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pFeature->hidComponents is NULL", v2, v3, v4, v5, v6);
}

void _hidComponentFunctionType_cold_3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "hidComponent is NULL", buf, 2u);
}

void _parseiAPHIDComponentIdentificationParams_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pProtocolEndpoint == NULL", v2, v3, v4, v5, v6);
}

void _parseiAPHIDComponentIdentificationParams_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pFeature == NULL", v2, v3, v4, v5, v6);
}

void _parseUSBHostHIDComponentIdentificationParams_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Failed to set USBHostHID interfaces!!", v2, v3, v4, v5, v6);
}

void _parseNativeBTHIDComponentIdentificationParams_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "pProtocolEndpoint->pEndpoint == NULL", v2, v3, v4, v5, v6);
}

void mfi4Auth_protocol_initSessionCommon_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iAP2LinkDeviceActionAttach_cold_1()
{
}

void iAP2LinkDeviceActionAttach_cold_2()
{
}

void iAP2LinkDeviceActionSendResetSYNACK_cold_1()
{
}

void iAP2LinkDeviceActionSendResetSYNACK_cold_2()
{
}

void iAP2LinkDeviceActionSendDetect_cold_1()
{
}

void iAP2LinkDeviceActionSendDetect_cold_2()
{
}

void iAP2LinkDeviceActionSendRST_cold_1()
{
}

void iAP2LinkDeviceActionSendRST_cold_2()
{
}

void iAP2LinkDeviceActionSendSYNACK_cold_1()
{
}

void iAP2LinkDeviceActionSendSYNACK_cold_2()
{
}

void iAP2LinkDeviceActionResendSYNACK_cold_1()
{
}

void iAP2LinkDeviceActionResendSYNACK_cold_2()
{
}

void iAP2LinkDeviceActionHandleMaxRetries_cold_1()
{
}

void iAP2LinkDeviceActionHandleMaxRetries_cold_2()
{
}

void iAP2LinkDeviceActionNotifyConnection_cold_1()
{
}

void iAP2LinkDeviceActionNotifyConnection_cold_2()
{
}

void iAP2LinkDeviceActionSendRSTWithNewChecksumEnabled_cold_1()
{
}

void iAP2LinkDeviceActionSendRSTWithNewChecksumEnabled_cold_2()
{
}

void iAP2LinkDeviceActionSendSuspend_cold_1()
{
}

void iAP2LinkDeviceActionSendSuspend_cold_2()
{
}

void iAP2LinkDeviceActionSendResume_cold_1()
{
}

void iAP2LinkDeviceActionSendResume_cold_2()
{
}

void iap2_voiceOver_informationHandler_cold_4()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_6((void *)&_mh_execute_header, v0, v1, "informationHandler %@, parm type=%d");
}

void __iap2_endpoint_processIncomingData_block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "iAP2 packet complete!", buf, 2u);
}

void __iap2_endpoint_processIncomingData_block_invoke_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "iAP2 packet NOT complete.", buf, 2u);
}

void iAP2LinkActionNone_cold_1()
{
}

void iAP2LinkActionNone_cold_2()
{
}

void iAP2LinkActionHandleACK_cold_1()
{
}

void iAP2LinkActionHandleACK_cold_2()
{
}

void iAP2LinkActionSendData_cold_1()
{
}

void iAP2LinkActionSendData_cold_2()
{
}

void iAP2LinkProcessOutQueue_cold_1()
{
}

void iAP2LinkActionDetach_cold_1()
{
}

void iAP2LinkActionDetach_cold_2()
{
}

void iAP2LinkActionSendACK_cold_1()
{
}

void iAP2LinkActionSendACK_cold_2()
{
}

void iAP2LinkActionSendACK_cold_3()
{
}

void iAP2LinkActionSendACK_cold_4()
{
}

void iAP2LinkActionSendACK_cold_5()
{
}

void iAP2LinkActionResendMissing_cold_1()
{
}

void iAP2LinkActionResendMissing_cold_2()
{
}

void iAP2LinkActionResendData_cold_1()
{
}

void iAP2LinkActionResendData_cold_2()
{
}

void iAP2LinkActionHandleData_cold_1()
{
}

void iAP2LinkActionHandleData_cold_2()
{
}

void iAP2LinkIsNoRetransmit_cold_1(unsigned __int16 *a1, uint64_t a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = *(unsigned __int16 *)(a2 + 8);
  int v5 = *(unsigned __int8 *)(a2 + 2);
  int v6 = *(unsigned __int8 *)(a2 + 3);
  int v7 = 136316418;
  int v8 = "iAP2LinkIsNoRetransmit";
  __int16 v9 = 1024;
  int v10 = 2716;
  __int16 v11 = 1024;
  int v12 = v3;
  __int16 v13 = 1024;
  int v14 = v4;
  __int16 v15 = 1024;
  int v16 = v5;
  __int16 v17 = 1024;
  int v18 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s:%d SYN Param does NOT indicate NoRetransmit: retransmitTimeout=%d cumAckTimeout=%d maxRetransmissions=%d maxCumAck=%d", (uint8_t *)&v7, 0x2Au);
}

void iAP2LinkActionNotifyConnectionFail_cold_1()
{
}

void iAP2LinkActionNotifyConnectionFail_cold_2()
{
}

void iAP2LinkIsValidSynParam_cold_7()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "Invalid SYN Params detected: retransmitTimeout=%d", v2, v3, v4, v5, v6);
}

void iAP2LinkIsValidSynParam_cold_9()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "Invalid SYN Params detected: maxPacketSize=%d", v2, v3, v4, v5, v6);
}

void iAP2LinkIsValidSynParam_cold_11()
{
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "Invalid SYN Params detected: linkVersion=%d", v2, v3, v4, v5, v6);
}

void __iAP2LinkIsValidSynParamMaxOutstandingPackets_cold_1()
{
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "Invalid SYN Params detected: maxOutstandingPackets=%d", v2, v3, v4, v5, v6);
}

void __iAP2LinkIsValidSynParamCumAckTimeout_cold_1()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "Invalid SYN Params detected: cumAckTimeout=%d", v2, v3, v4, v5, v6);
}

void __iAP2LinkIsValidSynParamMaxRetransmissions_cold_1()
{
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "Invalid SYN Params detected: maxRetransmissions=%d", v2, v3, v4, v5, v6);
}

void __iAP2LinkIsValidSynParamMaxCumAck_cold_1()
{
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v0, v1, "Invalid SYN Params detected: maxCumAck=%d", v2, v3, v4, v5, v6);
}

void iAP2LinkGetBuffSize_cold_1()
{
  __assert_rtn("iAP2LinkGetBuffSize", "iAP2Link.c", 2807, "maxPacketSentRcvdAtOnce <= iAP2_LINK_MAX_SESS_PCKS_SUPPORTED");
}

void iAP2LinkCreate_cold_1()
{
}

void iAP2LinkHandleReadyPacket_cold_3()
{
  __assert_rtn("_CleanupRecvPackets", "iAP2Link.c", 1227, "link->recvPck == NULL");
}

void iAP2LinkHandleSuspend_cold_1()
{
  OUTLINED_FUNCTION_9_6(__stack_chk_guard);
  OUTLINED_FUNCTION_8_9();
  OUTLINED_FUNCTION_6_12();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s:%d suspend link=%hx(type=%d state=%d)", v1, 0x24u);
}

void iAP2LinkHandleResume_cold_1()
{
  OUTLINED_FUNCTION_9_6(__stack_chk_guard);
  OUTLINED_FUNCTION_8_9();
  OUTLINED_FUNCTION_6_12();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s:%d resume link=%hx(type=%d state=%d)", v1, 0x24u);
}

void iAP2LinkHandleTimeout_cold_1()
{
}

void _iAP2LinkComparePacketSeq_cold_1()
{
  __assert_rtn("_iAP2LinkComparePacketSeq", "iAP2Link.c", 502, "pck1->link == pck2->link");
}

void _ComparePckTimerIdCB_cold_1()
{
  __assert_rtn("_ComparePckTimerIdCB", "iAP2Link.c", 293, "aPck && bPck && dataSize == sizeof(uintptr_t)");
}

void ccec_sign_internal_ws_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Digest should be at least 128 bits long: argument digest_len = %lu", (uint8_t *)&v2, 0xCu);
}

uint64_t ACCConnectionInfoCopyLocalizedAccessoryNameCFPrivate()
{
  return _ACCConnectionInfoCopyLocalizedAccessoryNameCFPrivate();
}

uint64_t ACCConnectionInfoCopyLocalizedAccessoryNamePrivate()
{
  return _ACCConnectionInfoCopyLocalizedAccessoryNamePrivate();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return _CFArrayCreateCopy(allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return _CFBundleCopyLocalizedString(bundle, key, value, tableName);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return _CFDataCreateCopy(allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return _CFDataCreateMutableCopy(allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return _CFDataGetMutableBytePtr(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateCopy(allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

CFIndex CFDictionaryGetCountOfKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetCountOfKey(theDict, key);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return _CFHash(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return _CFNotificationCenterGetLocalCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return _CFNumberCompare(number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return _CFSetContainsValue(theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return _CFSetCreate(allocator, values, numValues, callBacks);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return _CFSetCreateCopy(allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return _CFSetGetCount(theSet);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return _CFStringGetIntValue(str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t CopySynchronizableKeyForAuthFeature()
{
  return _CopySynchronizableKeyForAuthFeature();
}

uint64_t CreateSynchronizableKeyForAuthFeature()
{
  return _CreateSynchronizableKeyForAuthFeature();
}

uint64_t DeleteKeyForAuthFeature()
{
  return _DeleteKeyForAuthFeature();
}

uint64_t DeleteSynchronizableKeyForAuthFeature()
{
  return _DeleteSynchronizableKeyForAuthFeature();
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return _DiagnosticLogSubmissionEnabled();
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MFAAAddCertChainDataEntryToCacheForHash()
{
  return _MFAAAddCertChainDataEntryToCacheForHash();
}

uint64_t MFAAAddCertDataEntryToCache()
{
  return _MFAAAddCertDataEntryToCache();
}

uint64_t MFAACertificateAuthVersionNumber()
{
  return _MFAACertificateAuthVersionNumber();
}

uint64_t MFAACreateCertChainDataFromHash()
{
  return _MFAACreateCertChainDataFromHash();
}

uint64_t MFAACreateCertDataFromSerialNumber()
{
  return _MFAACreateCertDataFromSerialNumber();
}

uint64_t MFAACreateCertificateCache()
{
  return _MFAACreateCertificateCache();
}

uint64_t MFAACreateCertificateSerialNumber()
{
  return _MFAACreateCertificateSerialNumber();
}

uint64_t MFAACreateMatchingHashForCertChainFromHashLSB()
{
  return _MFAACreateMatchingHashForCertChainFromHashLSB();
}

uint64_t MFAADeviceIdentityCertsExist()
{
  return _MFAADeviceIdentityCertsExist();
}

uint64_t MFAADeviceIdentityCopyCertificate()
{
  return _MFAADeviceIdentityCopyCertificate();
}

uint64_t MFAADeviceIdentityCreateSignature()
{
  return _MFAADeviceIdentityCreateSignature();
}

uint64_t MFAAIsDevelopmentHW()
{
  return _MFAAIsDevelopmentHW();
}

uint64_t MFAAVerifyNonceSignature()
{
  return _MFAAVerifyNonceSignature();
}

uint64_t MFi4AuthFeatureGroup()
{
  return _MFi4AuthFeatureGroup();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetProductType()
{
  return _MGGetProductType();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return _NSStringFromProtocol(proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

uint64_t SecCMSCertificatesOnlyMessageCopyCertificates()
{
  return _SecCMSCertificatesOnlyMessageCopyCertificates();
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return _SecCertificateCopyKey(certificate);
}

uint64_t SecCertificateCreateWithBytes()
{
  return _SecCertificateCreateWithBytes();
}

uint64_t SecCertificateGetAuthorityKeyID()
{
  return _SecCertificateGetAuthorityKeyID();
}

uint64_t SecCertificateGetBytePtr()
{
  return _SecCertificateGetBytePtr();
}

uint64_t SecCertificateGetLength()
{
  return _SecCertificateGetLength();
}

uint64_t SecCertificateGetSubjectKeyID()
{
  return _SecCertificateGetSubjectKeyID();
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return _SecKeyCopyExternalRepresentation(key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return _SecKeyCopyPublicKey(key);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return _SecKeyCreateSignature(key, algorithm, dataToSign, error);
}

uint64_t SimulateCrash()
{
  return _SimulateCrash();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return ___sprintf_chk(a1, a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
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

uint64_t _os_once()
{
  return __os_once();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint64_t acc_strings_bundle()
{
  return _acc_strings_bundle();
}

uint64_t acc_strings_bundleCF()
{
  return _acc_strings_bundleCF();
}

uint64_t acc_strings_copyPlaceholder_Unknown()
{
  return _acc_strings_copyPlaceholder_Unknown();
}

uint64_t acc_strings_placeholder_Unknown()
{
  return _acc_strings_placeholder_Unknown();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return _accept(a1, a2, a3);
}

uint32_t arc4random(void)
{
  return _arc4random();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return _dispatch_queue_get_label(queue);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
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
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

void free(void *a1)
{
}

int getentropy(void *buffer, size_t size)
{
  return _getentropy(buffer, size);
}

pid_t getpid(void)
{
  return _getpid();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

int listen(int a1, int a2)
{
  return _listen(a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return _memset_s(__s, __smax, __c, __n);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return _protocol_copyMethodDescriptionList(p, isRequiredMethod, isInstanceMethod, outCount);
}

int pthread_atfork(void (*a1)(void), void (*a2)(void), void (*a3)(void))
{
  return _pthread_atfork(a1, a2, a3);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return _pthread_once(a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_rdlock(a1);
}

int pthread_rwlock_trywrlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_trywrlock(a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_unlock(a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_wrlock(a1);
}

int rand(void)
{
  return _rand();
}

uint64_t random(void)
{
  return _random();
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return _send(a1, a2, a3, a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return _strndup(__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return _xpc_data_get_bytes(xdata, buffer, off, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return _xpc_equal(object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

id objc_msgSend_EAAccessoryDictionary(void *a1, const char *a2, ...)
{
  return [a1 EAAccessoryDictionary];
}

id objc_msgSend_EACertData(void *a1, const char *a2, ...)
{
  return [a1 EACertData];
}

id objc_msgSend_EACertSerial(void *a1, const char *a2, ...)
{
  return [a1 EACertSerial];
}

id objc_msgSend_EAConnectionID(void *a1, const char *a2, ...)
{
  return [a1 EAConnectionID];
}

id objc_msgSend_EADockType(void *a1, const char *a2, ...)
{
  return [a1 EADockType];
}

id objc_msgSend_EAFirmwareRevisionActive(void *a1, const char *a2, ...)
{
  return [a1 EAFirmwareRevisionActive];
}

id objc_msgSend_EAFirmwareRevisionPending(void *a1, const char *a2, ...)
{
  return [a1 EAFirmwareRevisionPending];
}

id objc_msgSend_EAHardwareRevision(void *a1, const char *a2, ...)
{
  return [a1 EAHardwareRevision];
}

id objc_msgSend_EAMACAddress(void *a1, const char *a2, ...)
{
  return [a1 EAMACAddress];
}

id objc_msgSend_EAManufacturer(void *a1, const char *a2, ...)
{
  return [a1 EAManufacturer];
}

id objc_msgSend_EAModelNumber(void *a1, const char *a2, ...)
{
  return [a1 EAModelNumber];
}

id objc_msgSend_EAName(void *a1, const char *a2, ...)
{
  return [a1 EAName];
}

id objc_msgSend_EAPPID(void *a1, const char *a2, ...)
{
  return [a1 EAPPID];
}

id objc_msgSend_EAPreferredApp(void *a1, const char *a2, ...)
{
  return [a1 EAPreferredApp];
}

id objc_msgSend_EAProductID(void *a1, const char *a2, ...)
{
  return [a1 EAProductID];
}

id objc_msgSend_EAProtocols(void *a1, const char *a2, ...)
{
  return [a1 EAProtocols];
}

id objc_msgSend_EAProtocolsAppMatching(void *a1, const char *a2, ...)
{
  return [a1 EAProtocolsAppMatching];
}

id objc_msgSend_EARegionCode(void *a1, const char *a2, ...)
{
  return [a1 EARegionCode];
}

id objc_msgSend_EASerialNumber(void *a1, const char *a2, ...)
{
  return [a1 EASerialNumber];
}

id objc_msgSend_EATransportType(void *a1, const char *a2, ...)
{
  return [a1 EATransportType];
}

id objc_msgSend_EAVendorID(void *a1, const char *a2, ...)
{
  return [a1 EAVendorID];
}

id objc_msgSend_SHA256(void *a1, const char *a2, ...)
{
  return [a1 SHA256];
}

id objc_msgSend_URLPathAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLPathAllowedCharacterSet];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_XPCConnection(void *a1, const char *a2, ...)
{
  return [a1 XPCConnection];
}

id objc_msgSend__E75To30PinAdapterConnected(void *a1, const char *a2, ...)
{
  return [a1 _E75To30PinAdapterConnected];
}

id objc_msgSend__createListenSocket(void *a1, const char *a2, ...)
{
  return [a1 _createListenSocket];
}

id objc_msgSend__determineEntitlementsForXPCConnection(void *a1, const char *a2, ...)
{
  return [a1 _determineEntitlementsForXPCConnection];
}

id objc_msgSend__flush(void *a1, const char *a2, ...)
{
  return [a1 _flush];
}

id objc_msgSend__generateLegacyIAPConnectionID(void *a1, const char *a2, ...)
{
  return [a1 _generateLegacyIAPConnectionID];
}

id objc_msgSend__generatePortID(void *a1, const char *a2, ...)
{
  return [a1 _generatePortID];
}

id objc_msgSend__generateSessionID(void *a1, const char *a2, ...)
{
  return [a1 _generateSessionID];
}

id objc_msgSend__initXPC(void *a1, const char *a2, ...)
{
  return [a1 _initXPC];
}

id objc_msgSend__notifyServerActive(void *a1, const char *a2, ...)
{
  return [a1 _notifyServerActive];
}

id objc_msgSend__openPipeFromApp(void *a1, const char *a2, ...)
{
  return [a1 _openPipeFromApp];
}

id objc_msgSend__openPipeToApp(void *a1, const char *a2, ...)
{
  return [a1 _openPipeToApp];
}

id objc_msgSend__processPowerInfoChangeTimeout(void *a1, const char *a2, ...)
{
  return [a1 _processPowerInfoChangeTimeout];
}

id objc_msgSend__readLoggingPrefs(void *a1, const char *a2, ...)
{
  return [a1 _readLoggingPrefs];
}

id objc_msgSend__registerForLoggingPrefsNotification(void *a1, const char *a2, ...)
{
  return [a1 _registerForLoggingPrefsNotification];
}

id objc_msgSend__reloadEventHandler(void *a1, const char *a2, ...)
{
  return [a1 _reloadEventHandler];
}

id objc_msgSend__sendChangedSiphoningValues(void *a1, const char *a2, ...)
{
  return [a1 _sendChangedSiphoningValues];
}

id objc_msgSend__sendHasAdaptor(void *a1, const char *a2, ...)
{
  return [a1 _sendHasAdaptor];
}

id objc_msgSend__sendSessionCloseNotification(void *a1, const char *a2, ...)
{
  return [a1 _sendSessionCloseNotification];
}

id objc_msgSend__sendSessionOpenNotification(void *a1, const char *a2, ...)
{
  return [a1 _sendSessionOpenNotification];
}

id objc_msgSend__updateSiphoningValues(void *a1, const char *a2, ...)
{
  return [a1 _updateSiphoningValues];
}

id objc_msgSend_accInfoDict(void *a1, const char *a2, ...)
{
  return [a1 accInfoDict];
}

id objc_msgSend_accessLock(void *a1, const char *a2, ...)
{
  return [a1 accessLock];
}

id objc_msgSend_accessoryBLEPairingNoAccessories(void *a1, const char *a2, ...)
{
  return [a1 accessoryBLEPairingNoAccessories];
}

id objc_msgSend_accessoryChargingCurrent(void *a1, const char *a2, ...)
{
  return [a1 accessoryChargingCurrent];
}

id objc_msgSend_accessoryFilterDictionary(void *a1, const char *a2, ...)
{
  return [a1 accessoryFilterDictionary];
}

id objc_msgSend_accessoryList(void *a1, const char *a2, ...)
{
  return [a1 accessoryList];
}

id objc_msgSend_accessoryListLock(void *a1, const char *a2, ...)
{
  return [a1 accessoryListLock];
}

id objc_msgSend_accessoryMacAddress(void *a1, const char *a2, ...)
{
  return [a1 accessoryMacAddress];
}

id objc_msgSend_accessoryPowerManager(void *a1, const char *a2, ...)
{
  return [a1 accessoryPowerManager];
}

id objc_msgSend_accessoryStatus(void *a1, const char *a2, ...)
{
  return [a1 accessoryStatus];
}

id objc_msgSend_accessoryUID(void *a1, const char *a2, ...)
{
  return [a1 accessoryUID];
}

id objc_msgSend_accum(void *a1, const char *a2, ...)
{
  return [a1 accum];
}

id objc_msgSend_activeConnection(void *a1, const char *a2, ...)
{
  return [a1 activeConnection];
}

id objc_msgSend_activeDestinationSharingUUIDs(void *a1, const char *a2, ...)
{
  return [a1 activeDestinationSharingUUIDs];
}

id objc_msgSend_activeLocationAccessoryUUIDs(void *a1, const char *a2, ...)
{
  return [a1 activeLocationAccessoryUUIDs];
}

id objc_msgSend_activeProvider(void *a1, const char *a2, ...)
{
  return [a1 activeProvider];
}

id objc_msgSend_addFeaturePlugInBundleSearchPaths(void *a1, const char *a2, ...)
{
  return [a1 addFeaturePlugInBundleSearchPaths];
}

id objc_msgSend_addPlatformPlugInBundleSearchPaths(void *a1, const char *a2, ...)
{
  return [a1 addPlatformPlugInBundleSearchPaths];
}

id objc_msgSend_addTransportPlugInBundleSearchPaths(void *a1, const char *a2, ...)
{
  return [a1 addTransportPlugInBundleSearchPaths];
}

id objc_msgSend_allAccessoryNotificationsEntitlement(void *a1, const char *a2, ...)
{
  return [a1 allAccessoryNotificationsEntitlement];
}

id objc_msgSend_allConnectionsNotificationsEntitlement(void *a1, const char *a2, ...)
{
  return [a1 allConnectionsNotificationsEntitlement];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowDuplicateClassTypes(void *a1, const char *a2, ...)
{
  return [a1 allowDuplicateClassTypes];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_applePencilBatteryNotificationClientUUID(void *a1, const char *a2, ...)
{
  return [a1 applePencilBatteryNotificationClientUUID];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assistiveTouchProviderInfo(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchProviderInfo];
}

id objc_msgSend_authorized(void *a1, const char *a2, ...)
{
  return [a1 authorized];
}

id objc_msgSend_average(void *a1, const char *a2, ...)
{
  return [a1 average];
}

id objc_msgSend_bDigAudIsActive(void *a1, const char *a2, ...)
{
  return [a1 bDigAudIsActive];
}

id objc_msgSend_bDigAudSendNewProp(void *a1, const char *a2, ...)
{
  return [a1 bDigAudSendNewProp];
}

id objc_msgSend_bLocationStarted(void *a1, const char *a2, ...)
{
  return [a1 bLocationStarted];
}

id objc_msgSend_bNMEAFilterListNew(void *a1, const char *a2, ...)
{
  return [a1 bNMEAFilterListNew];
}

id objc_msgSend_batteryNotificationClientUUID(void *a1, const char *a2, ...)
{
  return [a1 batteryNotificationClientUUID];
}

id objc_msgSend_blePairingProviderList(void *a1, const char *a2, ...)
{
  return [a1 blePairingProviderList];
}

id objc_msgSend_blePairingProviderListByUID(void *a1, const char *a2, ...)
{
  return [a1 blePairingProviderListByUID];
}

id objc_msgSend_blePairingUUID(void *a1, const char *a2, ...)
{
  return [a1 blePairingUUID];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_builtInPlugInsPath(void *a1, const char *a2, ...)
{
  return [a1 builtInPlugInsPath];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_bypassAuthorization(void *a1, const char *a2, ...)
{
  return [a1 bypassAuthorization];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_canSendLaunchEvent(void *a1, const char *a2, ...)
{
  return [a1 canSendLaunchEvent];
}

id objc_msgSend_carPlayAppLinksStateDidChangeObserver(void *a1, const char *a2, ...)
{
  return [a1 carPlayAppLinksStateDidChangeObserver];
}

id objc_msgSend_carPlayAppsSubscriberList(void *a1, const char *a2, ...)
{
  return [a1 carPlayAppsSubscriberList];
}

id objc_msgSend_carPlayRetryUpdateTimer(void *a1, const char *a2, ...)
{
  return [a1 carPlayRetryUpdateTimer];
}

id objc_msgSend_carPlaySupported(void *a1, const char *a2, ...)
{
  return [a1 carPlaySupported];
}

id objc_msgSend_categories(void *a1, const char *a2, ...)
{
  return [a1 categories];
}

id objc_msgSend_certSerial(void *a1, const char *a2, ...)
{
  return [a1 certSerial];
}

id objc_msgSend_certSerialString(void *a1, const char *a2, ...)
{
  return [a1 certSerialString];
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return [a1 charValue];
}

id objc_msgSend_chargingTypeExternalIsInductive(void *a1, const char *a2, ...)
{
  return [a1 chargingTypeExternalIsInductive];
}

id objc_msgSend_checkComponentsAlreadyPaired(void *a1, const char *a2, ...)
{
  return [a1 checkComponentsAlreadyPaired];
}

id objc_msgSend_clientBundleID(void *a1, const char *a2, ...)
{
  return [a1 clientBundleID];
}

id objc_msgSend_clientCapabilities(void *a1, const char *a2, ...)
{
  return [a1 clientCapabilities];
}

id objc_msgSend_clientConnections(void *a1, const char *a2, ...)
{
  return [a1 clientConnections];
}

id objc_msgSend_clientConnectionsLock(void *a1, const char *a2, ...)
{
  return [a1 clientConnectionsLock];
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return [a1 clientInfo];
}

id objc_msgSend_clientListLock(void *a1, const char *a2, ...)
{
  return [a1 clientListLock];
}

id objc_msgSend_clientPid(void *a1, const char *a2, ...)
{
  return [a1 clientPid];
}

id objc_msgSend_clientUID(void *a1, const char *a2, ...)
{
  return [a1 clientUID];
}

id objc_msgSend_closeDataPipes(void *a1, const char *a2, ...)
{
  return [a1 closeDataPipes];
}

id objc_msgSend_completionHandlers(void *a1, const char *a2, ...)
{
  return [a1 completionHandlers];
}

id objc_msgSend_componentID(void *a1, const char *a2, ...)
{
  return [a1 componentID];
}

id objc_msgSend_componentIdList(void *a1, const char *a2, ...)
{
  return [a1 componentIdList];
}

id objc_msgSend_componentList(void *a1, const char *a2, ...)
{
  return [a1 componentList];
}

id objc_msgSend_componentUID(void *a1, const char *a2, ...)
{
  return [a1 componentUID];
}

id objc_msgSend_components(void *a1, const char *a2, ...)
{
  return [a1 components];
}

id objc_msgSend_connectToACCBluetoothPairingService(void *a1, const char *a2, ...)
{
  return [a1 connectToACCBluetoothPairingService];
}

id objc_msgSend_connectedAccessoryLock(void *a1, const char *a2, ...)
{
  return [a1 connectedAccessoryLock];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connectionUID(void *a1, const char *a2, ...)
{
  return [a1 connectionUID];
}

id objc_msgSend_connectionUUIDs(void *a1, const char *a2, ...)
{
  return [a1 connectionUUIDs];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyDeviceWiFiNetworkInformation(void *a1, const char *a2, ...)
{
  return [a1 copyDeviceWiFiNetworkInformation];
}

id objc_msgSend_copyDict(void *a1, const char *a2, ...)
{
  return [a1 copyDict];
}

id objc_msgSend_copyDictionary(void *a1, const char *a2, ...)
{
  return [a1 copyDictionary];
}

id objc_msgSend_copyExternalAccessoryProtocols(void *a1, const char *a2, ...)
{
  return [a1 copyExternalAccessoryProtocols];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createApplePencilSleepAssertion(void *a1, const char *a2, ...)
{
  return [a1 createApplePencilSleepAssertion];
}

id objc_msgSend_createBackingUserNotification(void *a1, const char *a2, ...)
{
  return [a1 createBackingUserNotification];
}

id objc_msgSend_createBatteryNotificationClient(void *a1, const char *a2, ...)
{
  return [a1 createBatteryNotificationClient];
}

id objc_msgSend_createEASleepAssertion(void *a1, const char *a2, ...)
{
  return [a1 createEASleepAssertion];
}

id objc_msgSend_createFilePath(void *a1, const char *a2, ...)
{
  return [a1 createFilePath];
}

id objc_msgSend_createMFi4SleepAssertion(void *a1, const char *a2, ...)
{
  return [a1 createMFi4SleepAssertion];
}

id objc_msgSend_createSleepNotificationClient(void *a1, const char *a2, ...)
{
  return [a1 createSleepNotificationClient];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_daylightSavingTimeOffset(void *a1, const char *a2, ...)
{
  return [a1 daylightSavingTimeOffset];
}

id objc_msgSend_decrementUserCount(void *a1, const char *a2, ...)
{
  return [a1 decrementUserCount];
}

id objc_msgSend_defaultButtonName(void *a1, const char *a2, ...)
{
  return [a1 defaultButtonName];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destinationSharingOptions(void *a1, const char *a2, ...)
{
  return [a1 destinationSharingOptions];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_digAudEndpointUUID(void *a1, const char *a2, ...)
{
  return [a1 digAudEndpointUUID];
}

id objc_msgSend_digAudSampleEnum(void *a1, const char *a2, ...)
{
  return [a1 digAudSampleEnum];
}

id objc_msgSend_digAudSampleMask(void *a1, const char *a2, ...)
{
  return [a1 digAudSampleMask];
}

id objc_msgSend_digAudSoundCheck(void *a1, const char *a2, ...)
{
  return [a1 digAudSoundCheck];
}

id objc_msgSend_digAudVolumeLevel(void *a1, const char *a2, ...)
{
  return [a1 digAudVolumeLevel];
}

id objc_msgSend_disconnectFromACCBluetoothPairingService(void *a1, const char *a2, ...)
{
  return [a1 disconnectFromACCBluetoothPairingService];
}

id objc_msgSend_dismissOnUnlock(void *a1, const char *a2, ...)
{
  return [a1 dismissOnUnlock];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_eaAccessories(void *a1, const char *a2, ...)
{
  return [a1 eaAccessories];
}

id objc_msgSend_eaAccessoriesMutable(void *a1, const char *a2, ...)
{
  return [a1 eaAccessoriesMutable];
}

id objc_msgSend_eaAppsSubscriberList(void *a1, const char *a2, ...)
{
  return [a1 eaAppsSubscriberList];
}

id objc_msgSend_eaClientConnections(void *a1, const char *a2, ...)
{
  return [a1 eaClientConnections];
}

id objc_msgSend_eaClientConnectionsMutable(void *a1, const char *a2, ...)
{
  return [a1 eaClientConnectionsMutable];
}

id objc_msgSend_eaSessionUUID(void *a1, const char *a2, ...)
{
  return [a1 eaSessionUUID];
}

id objc_msgSend_eaSessionUUIDs(void *a1, const char *a2, ...)
{
  return [a1 eaSessionUUIDs];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_endAllCalls(void *a1, const char *a2, ...)
{
  return [a1 endAllCalls];
}

id objc_msgSend_endpointDataOutHandlers(void *a1, const char *a2, ...)
{
  return [a1 endpointDataOutHandlers];
}

id objc_msgSend_endpointUID(void *a1, const char *a2, ...)
{
  return [a1 endpointUID];
}

id objc_msgSend_endpointUUID(void *a1, const char *a2, ...)
{
  return [a1 endpointUUID];
}

id objc_msgSend_featurePowerMode(void *a1, const char *a2, ...)
{
  return [a1 featurePowerMode];
}

id objc_msgSend_featureUserCount(void *a1, const char *a2, ...)
{
  return [a1 featureUserCount];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_filteredAccessories(void *a1, const char *a2, ...)
{
  return [a1 filteredAccessories];
}

id objc_msgSend_filteredEndpoints(void *a1, const char *a2, ...)
{
  return [a1 filteredEndpoints];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return [a1 flush];
}

id objc_msgSend_getBatteryChargeLevel(void *a1, const char *a2, ...)
{
  return [a1 getBatteryChargeLevel];
}

id objc_msgSend_getBatteryChargingState(void *a1, const char *a2, ...)
{
  return [a1 getBatteryChargingState];
}

id objc_msgSend_getCurrentConnectionIsHighPowerMode(void *a1, const char *a2, ...)
{
  return [a1 getCurrentConnectionIsHighPowerMode];
}

id objc_msgSend_getDeviceMacAddress(void *a1, const char *a2, ...)
{
  return [a1 getDeviceMacAddress];
}

id objc_msgSend_getExternalBatteryChargingTypeIsInductive(void *a1, const char *a2, ...)
{
  return [a1 getExternalBatteryChargingTypeIsInductive];
}

id objc_msgSend_getManager(void *a1, const char *a2, ...)
{
  return [a1 getManager];
}

id objc_msgSend_getOverCurrentState(void *a1, const char *a2, ...)
{
  return [a1 getOverCurrentState];
}

id objc_msgSend_getPendingComponent(void *a1, const char *a2, ...)
{
  return [a1 getPendingComponent];
}

id objc_msgSend_groupIdentifier(void *a1, const char *a2, ...)
{
  return [a1 groupIdentifier];
}

id objc_msgSend_handleIAPDDisconnect(void *a1, const char *a2, ...)
{
  return [a1 handleIAPDDisconnect];
}

id objc_msgSend_hasHIDClient(void *a1, const char *a2, ...)
{
  return [a1 hasHIDClient];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hexadecimalCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 hexadecimalCharacterSet];
}

id objc_msgSend_holdingApplePencilSleepAssertion(void *a1, const char *a2, ...)
{
  return [a1 holdingApplePencilSleepAssertion];
}

id objc_msgSend_iconSize(void *a1, const char *a2, ...)
{
  return [a1 iconSize];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoreQuietMode(void *a1, const char *a2, ...)
{
  return [a1 ignoreQuietMode];
}

id objc_msgSend_incrementUserCount(void *a1, const char *a2, ...)
{
  return [a1 incrementUserCount];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_initAllPlugIns(void *a1, const char *a2, ...)
{
  return [a1 initAllPlugIns];
}

id objc_msgSend_initPlugin(void *a1, const char *a2, ...)
{
  return [a1 initPlugin];
}

id objc_msgSend_initialUpdateSent(void *a1, const char *a2, ...)
{
  return [a1 initialUpdateSent];
}

id objc_msgSend_initializeSessionClose(void *a1, const char *a2, ...)
{
  return [a1 initializeSessionClose];
}

id objc_msgSend_initiateCallToVoicemail(void *a1, const char *a2, ...)
{
  return [a1 initiateCallToVoicemail];
}

id objc_msgSend_initiateRedial(void *a1, const char *a2, ...)
{
  return [a1 initiateRedial];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_interceptEnabled(void *a1, const char *a2, ...)
{
  return [a1 interceptEnabled];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_isDeviceConnectedToWiFi(void *a1, const char *a2, ...)
{
  return [a1 isDeviceConnectedToWiFi];
}

id objc_msgSend_isDeviceLocked(void *a1, const char *a2, ...)
{
  return [a1 isDeviceLocked];
}

id objc_msgSend_isExternalChargerConnected(void *a1, const char *a2, ...)
{
  return [a1 isExternalChargerConnected];
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return [a1 isLoaded];
}

id objc_msgSend_isLockScreenUIDisplayed(void *a1, const char *a2, ...)
{
  return [a1 isLockScreenUIDisplayed];
}

id objc_msgSend_isModal(void *a1, const char *a2, ...)
{
  return [a1 isModal];
}

id objc_msgSend_isOnAC(void *a1, const char *a2, ...)
{
  return [a1 isOnAC];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isServerActive(void *a1, const char *a2, ...)
{
  return [a1 isServerActive];
}

id objc_msgSend_isServerStarted(void *a1, const char *a2, ...)
{
  return [a1 isServerStarted];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_last(void *a1, const char *a2, ...)
{
  return [a1 last];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastUpdateTime(void *a1, const char *a2, ...)
{
  return [a1 lastUpdateTime];
}

id objc_msgSend_legacyConnectionID(void *a1, const char *a2, ...)
{
  return [a1 legacyConnectionID];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listUpdateFailedToSend(void *a1, const char *a2, ...)
{
  return [a1 listUpdateFailedToSend];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return [a1 load];
}

id objc_msgSend_loadAllBundles(void *a1, const char *a2, ...)
{
  return [a1 loadAllBundles];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_macAddr(void *a1, const char *a2, ...)
{
  return [a1 macAddr];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_max(void *a1, const char *a2, ...)
{
  return [a1 max];
}

id objc_msgSend_mediaLibraryList(void *a1, const char *a2, ...)
{
  return [a1 mediaLibraryList];
}

id objc_msgSend_mediaLibraryProviderInfoList(void *a1, const char *a2, ...)
{
  return [a1 mediaLibraryProviderInfoList];
}

id objc_msgSend_mediaLibraryUID(void *a1, const char *a2, ...)
{
  return [a1 mediaLibraryUID];
}

id objc_msgSend_mergeCalls(void *a1, const char *a2, ...)
{
  return [a1 mergeCalls];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_minNMEAIntervalMs(void *a1, const char *a2, ...)
{
  return [a1 minNMEAIntervalMs];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationProviderInfo(void *a1, const char *a2, ...)
{
  return [a1 navigationProviderInfo];
}

id objc_msgSend_navigationProviderInfoList(void *a1, const char *a2, ...)
{
  return [a1 navigationProviderInfoList];
}

id objc_msgSend_newAudioPropertyNotification(void *a1, const char *a2, ...)
{
  return [a1 newAudioPropertyNotification];
}

id objc_msgSend_nextDaylightSavingTimeTransition(void *a1, const char *a2, ...)
{
  return [a1 nextDaylightSavingTimeTransition];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nextUpdateStartFull(void *a1, const char *a2, ...)
{
  return [a1 nextUpdateStartFull];
}

id objc_msgSend_nmeaIntervalMinMs(void *a1, const char *a2, ...)
{
  return [a1 nmeaIntervalMinMs];
}

id objc_msgSend_nmeaIntervalParamID(void *a1, const char *a2, ...)
{
  return [a1 nmeaIntervalParamID];
}

id objc_msgSend_nmeaTypeParamID(void *a1, const char *a2, ...)
{
  return [a1 nmeaTypeParamID];
}

id objc_msgSend_notificationDictMutable(void *a1, const char *a2, ...)
{
  return [a1 notificationDictMutable];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_oldUpdateTypesBitmask(void *a1, const char *a2, ...)
{
  return [a1 oldUpdateTypesBitmask];
}

id objc_msgSend_oobBtPairingProviderInfo(void *a1, const char *a2, ...)
{
  return [a1 oobBtPairingProviderInfo];
}

id objc_msgSend_openEASessionHandlers(void *a1, const char *a2, ...)
{
  return [a1 openEASessionHandlers];
}

id objc_msgSend_openEASessionUUIDsForEndpointUUID(void *a1, const char *a2, ...)
{
  return [a1 openEASessionUUIDsForEndpointUUID];
}

id objc_msgSend_openEASessions(void *a1, const char *a2, ...)
{
  return [a1 openEASessions];
}

id objc_msgSend_openEASessionsLock(void *a1, const char *a2, ...)
{
  return [a1 openEASessionsLock];
}

id objc_msgSend_openPipeFromApp(void *a1, const char *a2, ...)
{
  return [a1 openPipeFromApp];
}

id objc_msgSend_openPipeToApp(void *a1, const char *a2, ...)
{
  return [a1 openPipeToApp];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_otherButtonName(void *a1, const char *a2, ...)
{
  return [a1 otherButtonName];
}

id objc_msgSend_pNMEAFilterList(void *a1, const char *a2, ...)
{
  return [a1 pNMEAFilterList];
}

id objc_msgSend_pairingFinished(void *a1, const char *a2, ...)
{
  return [a1 pairingFinished];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_physFootprintMem(void *a1, const char *a2, ...)
{
  return [a1 physFootprintMem];
}

id objc_msgSend_pidForOpenSessionUUID(void *a1, const char *a2, ...)
{
  return [a1 pidForOpenSessionUUID];
}

id objc_msgSend_pluginAccessory(void *a1, const char *a2, ...)
{
  return [a1 pluginAccessory];
}

id objc_msgSend_pluginBundleSearchPaths(void *a1, const char *a2, ...)
{
  return [a1 pluginBundleSearchPaths];
}

id objc_msgSend_pluginBundleSearchPathsMutable(void *a1, const char *a2, ...)
{
  return [a1 pluginBundleSearchPathsMutable];
}

id objc_msgSend_pluginBundlesMutable(void *a1, const char *a2, ...)
{
  return [a1 pluginBundlesMutable];
}

id objc_msgSend_pluginInstances(void *a1, const char *a2, ...)
{
  return [a1 pluginInstances];
}

id objc_msgSend_pluginInstancesMutable(void *a1, const char *a2, ...)
{
  return [a1 pluginInstancesMutable];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return [a1 pointerValue];
}

id objc_msgSend_powerAccessories(void *a1, const char *a2, ...)
{
  return [a1 powerAccessories];
}

id objc_msgSend_powerUpdateSentDueToSleep(void *a1, const char *a2, ...)
{
  return [a1 powerUpdateSentDueToSleep];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_preferredLocalizations(void *a1, const char *a2, ...)
{
  return [a1 preferredLocalizations];
}

id objc_msgSend_presentViaSystemAperture(void *a1, const char *a2, ...)
{
  return [a1 presentViaSystemAperture];
}

id objc_msgSend_primaryEndpointUUID(void *a1, const char *a2, ...)
{
  return [a1 primaryEndpointUUID];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return [a1 principalClass];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processingQueue(void *a1, const char *a2, ...)
{
  return [a1 processingQueue];
}

id objc_msgSend_protocolStrings(void *a1, const char *a2, ...)
{
  return [a1 protocolStrings];
}

id objc_msgSend_providerUID(void *a1, const char *a2, ...)
{
  return [a1 providerUID];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_recursive(void *a1, const char *a2, ...)
{
  return [a1 recursive];
}

id objc_msgSend_refreshClientData(void *a1, const char *a2, ...)
{
  return [a1 refreshClientData];
}

id objc_msgSend_remoteExternalAccessoryServerLock(void *a1, const char *a2, ...)
{
  return [a1 remoteExternalAccessoryServerLock];
}

id objc_msgSend_remoteObject(void *a1, const char *a2, ...)
{
  return [a1 remoteObject];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllPlugIns(void *a1, const char *a2, ...)
{
  return [a1 removeAllPlugIns];
}

id objc_msgSend_removeApplePencilSleepAssertion(void *a1, const char *a2, ...)
{
  return [a1 removeApplePencilSleepAssertion];
}

id objc_msgSend_removeEASleepAssertion(void *a1, const char *a2, ...)
{
  return [a1 removeEASleepAssertion];
}

id objc_msgSend_requestSleepUpdate(void *a1, const char *a2, ...)
{
  return [a1 requestSleepUpdate];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetOverCurrentSiphoning(void *a1, const char *a2, ...)
{
  return [a1 resetOverCurrentSiphoning];
}

id objc_msgSend_residentMem(void *a1, const char *a2, ...)
{
  return [a1 residentMem];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scheduleFlush(void *a1, const char *a2, ...)
{
  return [a1 scheduleFlush];
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return [a1 secondsFromGMT];
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 seekToEndOfFile];
}

id objc_msgSend_sendAudioStateChangedNotification(void *a1, const char *a2, ...)
{
  return [a1 sendAudioStateChangedNotification];
}

id objc_msgSend_sendUpdatedSubscriberList(void *a1, const char *a2, ...)
{
  return [a1 sendUpdatedSubscriberList];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return [a1 sessionID];
}

id objc_msgSend_sessionNotificationLock(void *a1, const char *a2, ...)
{
  return [a1 sessionNotificationLock];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setOverCurrentSiphoning(void *a1, const char *a2, ...)
{
  return [a1 setOverCurrentSiphoning];
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return [a1 sharedClient];
}

id objc_msgSend_sharedDefaults(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaults];
}

id objc_msgSend_sharedDefaultsIapd(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaultsIapd];
}

id objc_msgSend_sharedDefaultsLogging(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaultsLogging];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedPlatformIAPDBridge(void *a1, const char *a2, ...)
{
  return [a1 sharedPlatformIAPDBridge];
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return [a1 sharedServer];
}

id objc_msgSend_shortValue(void *a1, const char *a2, ...)
{
  return [a1 shortValue];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return [a1 shutdown];
}

id objc_msgSend_siphoningControl(void *a1, const char *a2, ...)
{
  return [a1 siphoningControl];
}

id objc_msgSend_siphoningDebounceTimerSource(void *a1, const char *a2, ...)
{
  return [a1 siphoningDebounceTimerSource];
}

id objc_msgSend_sleepAssertionTimersForUUIDs(void *a1, const char *a2, ...)
{
  return [a1 sleepAssertionTimersForUUIDs];
}

id objc_msgSend_sleepAssertionUUIDs(void *a1, const char *a2, ...)
{
  return [a1 sleepAssertionUUIDs];
}

id objc_msgSend_sleepAssertionUUIDsLock(void *a1, const char *a2, ...)
{
  return [a1 sleepAssertionUUIDsLock];
}

id objc_msgSend_sleepNotificationClientUUID(void *a1, const char *a2, ...)
{
  return [a1 sleepNotificationClientUUID];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startAllPlugIns(void *a1, const char *a2, ...)
{
  return [a1 startAllPlugIns];
}

id objc_msgSend_startAudioPropertyNotifications(void *a1, const char *a2, ...)
{
  return [a1 startAudioPropertyNotifications];
}

id objc_msgSend_startIncomingDataNotifications(void *a1, const char *a2, ...)
{
  return [a1 startIncomingDataNotifications];
}

id objc_msgSend_startObservingApplicationState(void *a1, const char *a2, ...)
{
  return [a1 startObservingApplicationState];
}

id objc_msgSend_startObservingFirstUnlockNotification(void *a1, const char *a2, ...)
{
  return [a1 startObservingFirstUnlockNotification];
}

id objc_msgSend_startPlugin(void *a1, const char *a2, ...)
{
  return [a1 startPlugin];
}

id objc_msgSend_startPowerUpdates(void *a1, const char *a2, ...)
{
  return [a1 startPowerUpdates];
}

id objc_msgSend_startServer(void *a1, const char *a2, ...)
{
  return [a1 startServer];
}

id objc_msgSend_startSiphoningControl(void *a1, const char *a2, ...)
{
  return [a1 startSiphoningControl];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_startedComponentList(void *a1, const char *a2, ...)
{
  return [a1 startedComponentList];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stopAudioPropertyNotifications(void *a1, const char *a2, ...)
{
  return [a1 stopAudioPropertyNotifications];
}

id objc_msgSend_stopIncomingDataNotifications(void *a1, const char *a2, ...)
{
  return [a1 stopIncomingDataNotifications];
}

id objc_msgSend_stopPlugin(void *a1, const char *a2, ...)
{
  return [a1 stopPlugin];
}

id objc_msgSend_stopPowerUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopPowerUpdates];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_subFeatureState(void *a1, const char *a2, ...)
{
  return [a1 subFeatureState];
}

id objc_msgSend_subFeatureSubscribers(void *a1, const char *a2, ...)
{
  return [a1 subFeatureSubscribers];
}

id objc_msgSend_subscriberList(void *a1, const char *a2, ...)
{
  return [a1 subscriberList];
}

id objc_msgSend_supportedNMEASentenceMask(void *a1, const char *a2, ...)
{
  return [a1 supportedNMEASentenceMask];
}

id objc_msgSend_supportedNMEASentencesArray(void *a1, const char *a2, ...)
{
  return [a1 supportedNMEASentencesArray];
}

id objc_msgSend_supportedPairTypes(void *a1, const char *a2, ...)
{
  return [a1 supportedPairTypes];
}

id objc_msgSend_supportedSampleRatesList(void *a1, const char *a2, ...)
{
  return [a1 supportedSampleRatesList];
}

id objc_msgSend_supportsIAPD(void *a1, const char *a2, ...)
{
  return [a1 supportsIAPD];
}

id objc_msgSend_supportsMultipleSessionsPerProtocol(void *a1, const char *a2, ...)
{
  return [a1 supportsMultipleSessionsPerProtocol];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_suspendServer(void *a1, const char *a2, ...)
{
  return [a1 suspendServer];
}

id objc_msgSend_swapCalls(void *a1, const char *a2, ...)
{
  return [a1 swapCalls];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemSoundID(void *a1, const char *a2, ...)
{
  return [a1 systemSoundID];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceLastUpdate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceLastUpdate];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeIntervalSinceStart(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceStart];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}

id objc_msgSend_timerSource(void *a1, const char *a2, ...)
{
  return [a1 timerSource];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_transactions(void *a1, const char *a2, ...)
{
  return [a1 transactions];
}

id objc_msgSend_transactionsLock(void *a1, const char *a2, ...)
{
  return [a1 transactionsLock];
}

id objc_msgSend_triggerCallStateUpdates(void *a1, const char *a2, ...)
{
  return [a1 triggerCallStateUpdates];
}

id objc_msgSend_triggerCommunicationsUpdate(void *a1, const char *a2, ...)
{
  return [a1 triggerCommunicationsUpdate];
}

id objc_msgSend_triggerMediaItemArtworkUpdate(void *a1, const char *a2, ...)
{
  return [a1 triggerMediaItemArtworkUpdate];
}

id objc_msgSend_triggerMediaItemAttributesUpdate(void *a1, const char *a2, ...)
{
  return [a1 triggerMediaItemAttributesUpdate];
}

id objc_msgSend_triggerPlaybackAttributesUpdate(void *a1, const char *a2, ...)
{
  return [a1 triggerPlaybackAttributesUpdate];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unlockedSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 unlockedSinceBoot];
}

id objc_msgSend_unscheduleFlush(void *a1, const char *a2, ...)
{
  return [a1 unscheduleFlush];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_update(void *a1, const char *a2, ...)
{
  return [a1 update];
}

id objc_msgSend_updateAccessoryInfo(void *a1, const char *a2, ...)
{
  return [a1 updateAccessoryInfo];
}

id objc_msgSend_updateAssertions(void *a1, const char *a2, ...)
{
  return [a1 updateAssertions];
}

id objc_msgSend_updateTypesBitmask(void *a1, const char *a2, ...)
{
  return [a1 updateTypesBitmask];
}

id objc_msgSend_usbFaultSubscribers(void *a1, const char *a2, ...)
{
  return [a1 usbFaultSubscribers];
}

id objc_msgSend_usbModeSubscribers(void *a1, const char *a2, ...)
{
  return [a1 usbModeSubscribers];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userNotification(void *a1, const char *a2, ...)
{
  return [a1 userNotification];
}

id objc_msgSend_userNotificationCF(void *a1, const char *a2, ...)
{
  return [a1 userNotificationCF];
}

id objc_msgSend_userNotificationCFDict(void *a1, const char *a2, ...)
{
  return [a1 userNotificationCFDict];
}

id objc_msgSend_userNotifications(void *a1, const char *a2, ...)
{
  return [a1 userNotifications];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_vehicleStatus(void *a1, const char *a2, ...)
{
  return [a1 vehicleStatus];
}

id objc_msgSend_virtualMem(void *a1, const char *a2, ...)
{
  return [a1 virtualMem];
}

id objc_msgSend_voiceOverProviderInfo(void *a1, const char *a2, ...)
{
  return [a1 voiceOverProviderInfo];
}

id objc_msgSend_waitForBeginPairingTimer(void *a1, const char *a2, ...)
{
  return [a1 waitForBeginPairingTimer];
}

id objc_msgSend_weekOfYear(void *a1, const char *a2, ...)
{
  return [a1 weekOfYear];
}

id objc_msgSend_windowPerLibrary(void *a1, const char *a2, ...)
{
  return [a1 windowPerLibrary];
}