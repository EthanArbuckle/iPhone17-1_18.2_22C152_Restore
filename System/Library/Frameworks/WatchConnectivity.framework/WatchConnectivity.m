void sub_222A044E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222A04A68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id wc_log()
{
  if (wc_log_onceToken != -1) {
    dispatch_once(&wc_log_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)wc_log___logger;

  return v0;
}

void sub_222A05B7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_222A05FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(v23);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_222A06474(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_222A065DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_14(uint64_t a1@<X8>)
{
  *(void *)(v1 - 24) = a1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

uint64_t OUTLINED_FUNCTION_0_1@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2114;
  *(void *)(a2 + 14) = result;
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x20u);
}

id WCCompactStringFromCollection(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 description];
  int v3 = [v1 conformsToProtocol:&unk_26D5313D0];

  if (v3)
  {
    v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"((){4})|\\\\+n|\n" options:0 error:0];
    uint64_t v5 = objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v2, 0, 0, objc_msgSend(v2, "length"), &stru_26D525540);

    uint64_t v2 = [v5 stringByReplacingOccurrencesOfString:@"\\\"" withString:@"\""];
  }

  return v2;
}

uint64_t __wc_log_block_invoke()
{
  wc_log___logger = (uint64_t)os_log_create("com.apple.wcd", "WC");

  return MEMORY[0x270F9A758]();
}

uint64_t WCDProtoUserInfoTransferReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 16;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 28) |= 1u;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
              *(void *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0) {
                goto LABEL_34;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v20) = 0;
            }
LABEL_36:
            *(_DWORD *)(a1 + 24) = v20;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        uint64_t v24 = PBReaderReadData();
        uint64_t v25 = 8;
      }
      v26 = *(void **)(a1 + v25);
      *(void *)(a1 + v25) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t LZ4_versionNumber()
{
  return 10700;
}

uint64_t LZ4_compressBound(unsigned int a1)
{
  if (a1 <= 0x7E000000) {
    return a1 + a1 / 0xFF + 16;
  }
  else {
    return 0;
  }
}

uint64_t LZ4_sizeofState()
{
  return 16416;
}

uint64_t LZ4_compress_fast_extState(void *a1, char *a2, unsigned char *a3, int a4, signed int a5, int a6)
{
  bzero(a1, 0x4020uLL);
  if (a6 <= 1) {
    int v12 = 1;
  }
  else {
    int v12 = a6;
  }
  signed int v13 = a4 + a4 / 0xFFu + 16;
  if (a4 > 0x7E000000) {
    signed int v13 = 0;
  }
  if (v13 <= a5)
  {
    if (a4 <= 65546)
    {
      LODWORD(v22) = 0;
      HIDWORD(v22) = v12;
      uint64_t v14 = (uint64_t)a1;
      int v15 = a2;
      v16 = a3;
      unsigned int v17 = a4;
      unsigned int v18 = 0;
      int v19 = 0;
      goto LABEL_11;
    }
    LODWORD(v22) = 0;
    HIDWORD(v22) = v12;
    uint64_t v14 = (uint64_t)a1;
    int v15 = a2;
    v16 = a3;
    unsigned int v17 = a4;
    unsigned int v18 = 0;
    int v19 = 0;
LABEL_14:
    int v20 = 1;
    return LZ4_compress_generic(v14, v15, v16, v17, v18, v19, v20, 0, v22, SHIDWORD(v22));
  }
  if (a4 > 65546)
  {
    LODWORD(v22) = 0;
    HIDWORD(v22) = v12;
    uint64_t v14 = (uint64_t)a1;
    int v15 = a2;
    v16 = a3;
    unsigned int v17 = a4;
    unsigned int v18 = a5;
    int v19 = 1;
    goto LABEL_14;
  }
  LODWORD(v22) = 0;
  HIDWORD(v22) = v12;
  uint64_t v14 = (uint64_t)a1;
  int v15 = a2;
  v16 = a3;
  unsigned int v17 = a4;
  unsigned int v18 = a5;
  int v19 = 1;
LABEL_11:
  int v20 = 2;
  return LZ4_compress_generic(v14, v15, v16, v17, v18, v19, v20, 0, v22, SHIDWORD(v22));
}

void LZ4_resetStream(void *a1)
{
}

uint64_t LZ4_compress_generic(uint64_t a1, char *__src, unsigned char *a3, unsigned int a4, unsigned int a5, int a6, int a7, int a8, int a9, int a10)
{
  if (a4 > 0x7E000000) {
    return 0;
  }
  uint64_t v13 = *(unsigned int *)(a1 + 16408);
  uint64_t v14 = &__src[-v13];
  if (a8 == 1)
  {
    v16 = &__src[-v13];
  }
  else
  {
    int v15 = __src;
    v16 = __src;
    if (a8 != 2) {
      goto LABEL_7;
    }
    v16 = __src;
  }
  int v15 = &__src[-*(unsigned int *)(a1 + 0x4000)];
LABEL_7:
  unsigned int v17 = *(char **)(a1 + 16392);
  if (a4 >= 0x1000B && a7 == 2) {
    return 0;
  }
  v82 = &__src[a4];
  v83 = a3;
  unint64_t v18 = (unint64_t)__src;
  if (a4 >= 0xD)
  {
    char v25 = a7 == 2 ? 13 : 12;
    char v26 = 40 - v25;
    int v27 = -1 << v25;
    unsigned int v28 = ((unint64_t)(0xCF1BBCDCBBLL * *(void *)__src) >> v26) & ~v27;
    if (a7 == 2)
    {
      *(_WORD *)(a1 + 2 * v28) = (_WORD)__src - (_WORD)v15;
      v29 = a3;
    }
    else
    {
      v29 = a3;
      if (a7 == 1) {
        *(_DWORD *)(a1 + 4 * v28) = __src - v15;
      }
    }
    unint64_t v18 = (unint64_t)__src;
    a3 = v29;
    if (a4 >= 0xE)
    {
      uint64_t v31 = 0;
      v84 = &v17[v13];
      uint64_t v32 = &v17[v13] - __src;
      int v33 = a9;
      unint64_t v34 = (unint64_t)(v82 - 12);
      int v35 = ~v27;
      int v36 = (a10 << 6) | 1;
      unsigned int v37 = a10 & 0x3FFFFFF;
      v38 = __src + 2;
      a3 = v83;
      unint64_t v18 = (unint64_t)__src;
      unint64_t v85 = (unint64_t)&v83[a5];
      v89 = &__src[-v13];
      v90 = v17;
      uint64_t v87 = v32;
      char v88 = v26;
      int v86 = ~v27;
      int v91 = a8;
LABEL_28:
      v39 = (_DWORD *)(v18 + 1);
      uint64_t v40 = *(void *)(v18 + 1);
      unsigned int v41 = v36;
      while (1)
      {
        v42 = v39;
        v39 = v38;
        uint64_t v43 = ((unint64_t)(0xCF1BBCDCBBLL * v40) >> v26) & v35;
        uint64_t v40 = *v38;
        if (a7 == 1)
        {
          unint64_t v44 = (unint64_t)&v15[*(unsigned int *)(a1 + 4 * v43)];
          if (v44 >= (unint64_t)__src) {
            v45 = __src;
          }
          else {
            v45 = v17;
          }
          if (v44 >= (unint64_t)__src) {
            uint64_t v46 = 0;
          }
          else {
            uint64_t v46 = v32;
          }
          if (a8 == 2)
          {
            v16 = v45;
            uint64_t v31 = v46;
          }
          *(_DWORD *)(a1 + 4 * v43) = v42 - v15;
        }
        else
        {
          unint64_t v44 = (unint64_t)&v15[*(unsigned __int16 *)(a1 + 2 * v43)];
          if (v44 >= (unint64_t)__src) {
            v47 = __src;
          }
          else {
            v47 = v17;
          }
          if (v44 >= (unint64_t)__src) {
            uint64_t v48 = 0;
          }
          else {
            uint64_t v48 = v32;
          }
          if (a8 == 2)
          {
            v16 = v47;
            uint64_t v31 = v48;
          }
          if (a7 == 2) {
            *(_WORD *)(a1 + 2 * v43) = (_WORD)v42 - (_WORD)v15;
          }
        }
        if ((v33 != 1 || v44 >= (unint64_t)v14)
          && (a7 == 2 || v44 + 0xFFFF >= (unint64_t)v42)
          && *(_DWORD *)(v44 + v31) == *v42)
        {
          break;
        }
        v38 = (void *)((char *)v39 + v37);
        unsigned int v37 = v41++ >> 6;
        if ((unint64_t)v38 > v34) {
          goto LABEL_10;
        }
      }
      if ((unint64_t)v42 > v18 && v44 + v31 > (unint64_t)v16)
      {
        uint64_t v49 = v31 - 1;
        v50 = (unsigned __int8 *)v42 - 1;
        while (*v50 == *(unsigned __int8 *)(v44 + v49))
        {
          unint64_t v51 = v44 - 1;
          v52 = v50 - 1;
          if ((unint64_t)v50 > v18)
          {
            unint64_t v53 = v44 + v49;
            --v50;
            --v44;
            if (v53 > (unint64_t)v16) {
              continue;
            }
          }
          v42 = v52 + 1;
          goto LABEL_65;
        }
        v42 = v50 + 1;
      }
      unint64_t v51 = v44;
LABEL_65:
      unsigned int v54 = v42 - v18;
      v55 = a3 + 1;
      if (!a6 || (unint64_t)v55 + v54 + v54 / 0xFFuLL + 8 <= v85)
      {
        int v56 = v54 - 15;
        if (v54 < 0xF)
        {
          *a3 = 16 * v54;
        }
        else
        {
          *a3 = -16;
          if (v56 >= 255)
          {
            if (v56 >= 509) {
              int v56 = 509;
            }
            unsigned int v57 = v42 - v18 - v56 + 239;
            v95 = a3;
            memset(v55, 255, v57 / 0xFFuLL + 1);
            a3 = v95;
            unsigned int v17 = v90;
            a8 = v91;
            v55 = &v95[v57 / 0xFFuLL + 2];
            LOBYTE(v56) = (_BYTE)v42 - v18 + v57 / 0xFF - 14;
          }
          *(unsigned char *)v55 = v56;
          v55 = (void *)((char *)v55 + 1);
        }
        v58 = (_WORD *)((char *)v55 + v54);
        do
        {
          uint64_t v59 = *(void *)v18;
          v18 += 8;
          *v55++ = v59;
        }
        while (v55 < (void *)v58);
        unint64_t v18 = (unint64_t)v42;
        unint64_t v60 = (unint64_t)(v82 - 5);
        while (1)
        {
          _WORD *v58 = v18 - v51;
          v93 = a3;
          if (a8 == 2 && v16 == v17)
          {
            if ((unint64_t)&v84[-v51 - v31 + v18] <= v60) {
              unint64_t v60 = (unint64_t)&v84[-v51 - v31 + v18];
            }
            unsigned int v61 = LZ4_count(v18 + 4, (_DWORD *)(v51 + v31 + 4), v60);
            v18 += v61 + 4;
            if (v18 == v60)
            {
              unsigned int v62 = LZ4_count(v60, __src, (unint64_t)(v82 - 5));
              v61 += v62;
              unint64_t v18 = v60 + v62;
            }
            unint64_t v60 = (unint64_t)(v82 - 5);
          }
          else
          {
            unsigned int v61 = LZ4_count(v18 + 4, (_DWORD *)(v51 + 4), v60);
            v18 += v61 + 4;
          }
          if (a6 && (unint64_t)v58 + (v61 >> 8) + 8 > v85) {
            break;
          }
          char v63 = *v93;
          unsigned int v64 = v61 - 15;
          if (v61 < 0xF)
          {
            char *v93 = v63 + v61;
            a8 = v91;
            uint64_t v14 = v89;
            unsigned int v17 = v90;
            uint64_t v32 = v87;
            char v26 = v88;
            a3 = v58 + 1;
            int v33 = a9;
            unint64_t v34 = (unint64_t)(v82 - 12);
            int v35 = v86;
          }
          else
          {
            char *v93 = v63 + 15;
            if (v64 < 0x1FE)
            {
              v67 = v58 + 1;
            }
            else
            {
              unsigned int v94 = v61 - 525;
              unsigned int v65 = (v61 - 525) / 0x1FE;
              uint64_t v66 = v65;
              memset(v58 + 1, 255, v66 * 2 + 2);
              unsigned int v64 = v94 - 510 * v65;
              unint64_t v60 = (unint64_t)(v82 - 5);
              v67 = &v58[v66 + 2];
            }
            a8 = v91;
            uint64_t v14 = v89;
            unsigned int v17 = v90;
            uint64_t v32 = v87;
            char v26 = v88;
            int v33 = a9;
            unint64_t v34 = (unint64_t)(v82 - 12);
            int v35 = v86;
            if (v64 >= 0xFF)
            {
              *v67++ = -1;
              LOBYTE(v64) = v64 + 1;
            }
            unsigned char *v67 = v64;
            a3 = v67 + 1;
          }
          if (v18 > v34) {
            goto LABEL_10;
          }
          int v68 = v18 - 2;
          unsigned int v69 = ((unint64_t)(0xCF1BBCDCBBLL * *(void *)(v18 - 2)) >> v26) & v35;
          if (a7 == 1)
          {
            *(_DWORD *)(a1 + 4 * v69) = v68 - v15;
            unsigned int v73 = ((unint64_t)(0xCF1BBCDCBBLL * *(void *)v18) >> v26) & v35;
            unint64_t v51 = (unint64_t)&v15[*(unsigned int *)(a1 + 4 * v73)];
            if (v51 >= (unint64_t)__src) {
              v74 = __src;
            }
            else {
              v74 = v17;
            }
            if (v51 >= (unint64_t)__src) {
              uint64_t v75 = 0;
            }
            else {
              uint64_t v75 = v32;
            }
            if (a8 == 2)
            {
              v16 = v74;
              uint64_t v31 = v75;
            }
            *(_DWORD *)(a1 + 4 * v73) = v18 - v15;
          }
          else if (a7 == 2)
          {
            *(_WORD *)(a1 + 2 * v69) = v68 - (_WORD)v15;
            unsigned int v70 = ((unint64_t)(0xCF1BBCDCBBLL * *(void *)v18) >> v26) & v35;
            unint64_t v51 = (unint64_t)&v15[*(unsigned __int16 *)(a1 + 2 * v70)];
            if (v51 >= (unint64_t)__src) {
              v71 = __src;
            }
            else {
              v71 = v17;
            }
            if (v51 >= (unint64_t)__src) {
              uint64_t v72 = 0;
            }
            else {
              uint64_t v72 = v32;
            }
            if (a8 == 2)
            {
              v16 = v71;
              uint64_t v31 = v72;
            }
            *(_WORD *)(a1 + 2 * v70) = v18 - (_WORD)v15;
          }
          else
          {
            unint64_t v51 = (unint64_t)&v15[*(unsigned __int16 *)(a1
                                                             + 2
                                                             * (((unint64_t)(0xCF1BBCDCBBLL
                                                                                                * *(void *)v18) >> v26) & v35))];
            if (v51 >= (unint64_t)__src) {
              v76 = __src;
            }
            else {
              v76 = v17;
            }
            if (v51 >= (unint64_t)__src) {
              uint64_t v77 = 0;
            }
            else {
              uint64_t v77 = v32;
            }
            if (a8 == 2)
            {
              v16 = v76;
              uint64_t v31 = v77;
            }
          }
          BOOL v79 = (v51 >= (unint64_t)v14 || v33 != 1) && v51 + 0xFFFF >= v18;
          if (!v79 || *(_DWORD *)(v51 + v31) != *(_DWORD *)v18)
          {
            v38 = (void *)(v18 + 2);
            unsigned int v37 = a10 & 0x3FFFFFF;
            int v36 = (a10 << 6) | 1;
            if (v18 + 2 <= v34) {
              goto LABEL_28;
            }
            goto LABEL_10;
          }
          *a3 = 0;
          v58 = a3 + 1;
        }
      }
      return 0;
    }
  }
LABEL_10:
  size_t v19 = (size_t)&v82[-v18];
  if (a6)
  {
    if (a3 - v83 + v19 + (v19 + 240) / 0xFF + 1 > a5) {
      return 0;
    }
  }
  unint64_t v21 = v19 - 15;
  if (v19 < 0xF)
  {
    *a3 = 16 * v19;
  }
  else
  {
    *a3 = -16;
    uint64_t v22 = a3 + 1;
    if (v21 >= 0xFF)
    {
      unint64_t v23 = (unint64_t)&__src[(int)a4 - v18 - 270];
      uint64_t v24 = a3;
      memset(v22, 255, v23 / 0xFF + 1);
      unint64_t v21 = v23 % 0xFF;
      uint64_t v22 = &v24[v23 / 0xFF + 2];
    }
    *uint64_t v22 = v21;
    a3 = v22;
  }
  int v30 = a3 + 1;
  memcpy(a3 + 1, (const void *)v18, v19);
  return (v30 + v19 - v83);
}

uint64_t LZ4_compress_fast()
{
  v0 = (char *)MEMORY[0x270FA5388]();
  memset(v6, 0, 512);
  return LZ4_compress_fast_extState(v6, v0, v1, v2, v3, v4);
}

uint64_t LZ4_compress_default(uint64_t a1, uint64_t a2, uint64_t a3)
{
  signed int v3 = (char *)MEMORY[0x270FA5388](a1, a2, a3);
  memset(v8, 0, 512);
  return LZ4_compress_fast_extState(v8, v3, v4, v5, v6, 1);
}

uint64_t LZ4_compress_destSize()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  signed int v2 = v1;
  int v4 = v3;
  signed int v6 = v5;
  v7 = (char *)v0;
  bzero(v14, 0x4020uLL);
  int v8 = *v4;
  signed int v9 = v8 + v8 / 0xFFu + 16;
  if (*v4 > 0x7E000000) {
    signed int v9 = 0;
  }
  if (v9 <= v2) {
    return LZ4_compress_fast_extState(v14, v7, v6, v8, v2, 1);
  }
  if (v8 > 65546)
  {
    unint64_t v10 = v4;
    int v11 = v2;
    int v12 = 1;
  }
  else
  {
    unint64_t v10 = v4;
    int v11 = v2;
    int v12 = 2;
  }
  return LZ4_compress_destSize_generic((uint64_t)v14, v7, (unint64_t)v6, v10, v11, v12);
}

void LZ4_createStream()
{
  uint64_t v0 = malloc_type_calloc(8uLL, 0x804uLL, 0x237C54B7uLL);

  bzero(v0, 0x4020uLL);
}

uint64_t LZ4_freeStream(void *a1)
{
  return 0;
}

uint64_t LZ4_loadDict(char *a1, char *a2, int a3)
{
  signed int v6 = a1 + 0x4000;
  if (*((void *)a1 + 2048) >= 0x40000001uLL) {
    bzero(a1, 0x4020uLL);
  }
  if (a3 > 7)
  {
    int v8 = &a2[a3];
    signed int v9 = v8 - 0x10000;
    if (a3 <= 0x10000) {
      signed int v9 = a2;
    }
    int v10 = *v6 + 0x10000;
    *((void *)a1 + 2049) = v9;
    uint64_t result = (v8 - v9);
    v6[6] = result;
    *signed int v6 = v10 + result;
    for (unint64_t i = (unint64_t)(v8 - 8); (unint64_t)v9 <= i; v10 += 3)
    {
      uint64_t v12 = *(void *)v9;
      v9 += 3;
      *(_DWORD *)&a1[4 * (((unint64_t)(0xCF1BBCDCBBLL * v12) >> 28) & 0xFFF)] = v10;
    }
  }
  else
  {
    uint64_t result = 0;
    *((void *)a1 + 2049) = 0;
    v6[6] = 0;
  }
  return result;
}

uint64_t LZ4_compress_fast_continue(uint64_t a1, char *__src, unsigned char *a3, signed int a4, unsigned int a5, int a6)
{
  signed int v6 = (unsigned int *)(a1 + 0x4000);
  if (*(_DWORD *)(a1 + 16388)) {
    return 0;
  }
  int v11 = *(char **)(a1 + 16392);
  uint64_t v12 = *(unsigned int *)(a1 + 16408);
  uint64_t v13 = &v11[v12];
  if (&v11[v12] >= __src || v12 == 0) {
    int v15 = __src;
  }
  else {
    int v15 = &v11[v12];
  }
  unint64_t v16 = *v6;
  if (v16 > 0x80000000 || v16 > (unint64_t)v15)
  {
    uint64_t v18 = 0;
    uint32x4_t v19 = (uint32x4_t)vdupq_n_s32((int)v16 - 0x10000);
    do
    {
      *(uint32x4_t *)(a1 + v18) = vqsubq_u32(*(uint32x4_t *)(a1 + v18), v19);
      v18 += 16;
    }
    while (v18 != 0x4000);
    *signed int v6 = 0x10000;
    LODWORD(v12) = *(_DWORD *)(a1 + 16408);
    if (v12 > 0x10000)
    {
      *(_DWORD *)(a1 + 16408) = 0x10000;
      LODWORD(v12) = 0x10000;
    }
    int v11 = &v13[-v12];
    *(void *)(a1 + 16392) = v11;
    LODWORD(v16) = 0x10000;
  }
  if (a6 <= 1) {
    int v20 = 1;
  }
  else {
    int v20 = a6;
  }
  unint64_t v21 = &__src[a4];
  if (v21 > v11 && v21 < v13)
  {
    LODWORD(v12) = v13 - v21;
    if ((v13 - v21) >= 0x10000) {
      LODWORD(v12) = 0x10000;
    }
    if (v12 >= 4) {
      uint64_t v12 = v12;
    }
    else {
      uint64_t v12 = 0;
    }
    *(_DWORD *)(a1 + 16408) = v12;
    *(void *)(a1 + 16392) = &v13[-v12];
  }
  BOOL v23 = v12 < 0x10000 && v12 < v16;
  if (v13 == __src)
  {
    uint64_t result = LZ4_compress_generic(a1, __src, a3, a4, a5, 1, 1, 1, v23, v20);
    signed int v24 = v6[6] + a4;
  }
  else
  {
    uint64_t result = LZ4_compress_generic(a1, __src, a3, a4, a5, 1, 1, 2, v23, v20);
    *(void *)(a1 + 16392) = __src;
    signed int v24 = a4;
  }
  v6[6] = v24;
  *v6 += a4;
  return result;
}

size_t LZ4_saveDict(uint64_t a1, void *__dst, unsigned int a3)
{
  uint64_t v5 = *(unsigned int *)(a1 + 16408);
  if (a3 >= v5) {
    unsigned int v6 = *(_DWORD *)(a1 + 16408);
  }
  else {
    unsigned int v6 = a3;
  }
  if (v6 >= 0x10000) {
    size_t v7 = 0x10000;
  }
  else {
    size_t v7 = v6;
  }
  memmove(__dst, (const void *)(*(void *)(a1 + 16392) + v5 - v7), v7);
  *(void *)(a1 + 16392) = __dst;
  *(_DWORD *)(a1 + 16408) = v7;
  return v7;
}

uint64_t LZ4_decompress_safe(unsigned __int8 *a1, char *__dst, int a3, int a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  long long v36 = 0u;
  uint64_t v37 = 0;
  uint64_t v38 = -1;
  uint64_t v39 = 0;
  long long v40 = xmmword_222A2F460;
  uint64_t v41 = 3;
  if (a4)
  {
    uint64_t v5 = (unsigned __int16 *)&a1[a3];
    unsigned int v6 = &__dst[a4];
    size_t v7 = v6 - 12;
    int v8 = v6 - 8;
    signed int v9 = a1;
    int v10 = __dst;
    while (1)
    {
      unsigned int v12 = *v9++;
      char v11 = v12;
      size_t v13 = (unint64_t)v12 >> 4;
      if (v13 == 15)
      {
        size_t v13 = 15;
        do
        {
          unsigned int v15 = *v9++;
          unsigned int v14 = v15;
          v13 += v15;
        }
        while (v9 < (unsigned __int8 *)v5 - 15 && v14 == 255);
        if ((v13 & 0x8000000000000000) != 0) {
          return (~v9 + a1);
        }
      }
      unint64_t v16 = &v10[v13];
      unsigned int v17 = (unsigned __int16 *)&v9[v13];
      if (&v10[v13] > v7 || v17 > v5 - 4)
      {
        if (v17 == v5 && v16 <= v6)
        {
          memcpy(v10, v9, v13);
          return (v16 - __dst);
        }
        return (~v9 + a1);
      }
      do
      {
        uint64_t v19 = *(void *)v9;
        v9 += 8;
        *(void *)int v10 = v19;
        v10 += 8;
      }
      while (v10 < v16);
      int v20 = &v16[-*v17];
      signed int v9 = (unsigned __int8 *)(v17 + 1);
      if (v20 < __dst) {
        return (~v9 + a1);
      }
      uint64_t v21 = v11 & 0xF;
      if ((v11 & 0xF) == 0xF)
      {
        uint64_t v21 = 15;
        while (v9 <= (unsigned __int8 *)v5 - 5)
        {
          unsigned int v22 = *v9++;
          v21 += v22;
          if (v22 != 255)
          {
            if (v21 < 0) {
              return (~v9 + a1);
            }
            goto LABEL_19;
          }
        }
        return (~v9 + a1);
      }
LABEL_19:
      unint64_t v23 = *v17;
      if (v23 <= 7)
      {
        uint64_t v28 = *((void *)&v36 + v23);
        char *v16 = *v20;
        v16[1] = v20[1];
        v16[2] = v20[2];
        v16[3] = v20[3];
        v29 = &v20[qword_222A2F470[v23]];
        *((_DWORD *)v16 + 1) = *(_DWORD *)v29;
        signed int v24 = &v29[-v28];
      }
      else
      {
        uint64_t v25 = *(void *)v20;
        signed int v24 = v20 + 8;
        *(void *)unint64_t v16 = v25;
      }
      int v10 = &v16[v21 + 4];
      char v26 = v16 + 8;
      if (v10 > v7)
      {
        if (v10 > v6 - 5) {
          return (~v9 + a1);
        }
        if (v26 < v8)
        {
          int v30 = v16 + 8;
          uint64_t v31 = (uint64_t *)v24;
          do
          {
            uint64_t v32 = *v31++;
            *(void *)int v30 = v32;
            v30 += 8;
          }
          while (v30 < v8);
          v24 += v8 - v26;
          char v26 = v6 - 8;
        }
        while (v26 < v10)
        {
          char v33 = *v24++;
          *v26++ = v33;
        }
      }
      else
      {
        do
        {
          uint64_t v27 = *(void *)v24;
          v24 += 8;
          *(void *)char v26 = v27;
          v26 += 8;
        }
        while (v26 < v10);
      }
    }
  }
  else if (a3 == 1)
  {
    if (*a1) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
}

uint64_t LZ4_decompress_safe_partial(unsigned __int8 *a1, char *__dst, int a3, int a4, int a5)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v5 = &__dst[a5];
  long long v37 = 0u;
  uint64_t v38 = 0;
  uint64_t v39 = -1;
  uint64_t v40 = 0;
  long long v41 = xmmword_222A2F460;
  uint64_t v42 = 3;
  if (&__dst[a4] <= v5 - 12) {
    unsigned int v6 = &__dst[a4];
  }
  else {
    unsigned int v6 = v5 - 12;
  }
  if (a5)
  {
    int v8 = &a1[a3];
    signed int v9 = v5 - 8;
    int v10 = a1;
    char v11 = __dst;
    while (1)
    {
      unsigned int v13 = *v10++;
      char v12 = v13;
      size_t v14 = (unint64_t)v13 >> 4;
      if (v14 == 15)
      {
        size_t v14 = 15;
        do
        {
          unsigned int v16 = *v10++;
          unsigned int v15 = v16;
          v14 += v16;
        }
        while (v10 < v8 - 15 && v15 == 255);
        if ((v14 & 0x8000000000000000) != 0) {
          return (~v10 + a1);
        }
      }
      unsigned int v17 = &v11[v14];
      uint64_t v18 = &v10[v14];
      if (&v11[v14] > v6 || v18 > v8 - 8)
      {
        if (v17 <= v5 && v18 <= v8)
        {
          memcpy(v11, v10, v14);
          return (v17 - __dst);
        }
        return (~v10 + a1);
      }
      do
      {
        uint64_t v20 = *(void *)v10;
        v10 += 8;
        *(void *)char v11 = v20;
        v11 += 8;
      }
      while (v11 < v17);
      uint64_t v21 = &v17[-*(unsigned __int16 *)v18];
      int v10 = v18 + 2;
      if (v21 < __dst) {
        return (~v10 + a1);
      }
      uint64_t v22 = v12 & 0xF;
      if ((v12 & 0xF) == 0xF)
      {
        uint64_t v22 = 15;
        while (v10 <= v8 - 5)
        {
          unsigned int v23 = *v10++;
          v22 += v23;
          if (v23 != 255)
          {
            if (v22 < 0) {
              return (~v10 + a1);
            }
            goto LABEL_22;
          }
        }
        return (~v10 + a1);
      }
LABEL_22:
      unint64_t v24 = *(unsigned __int16 *)v18;
      if (v24 <= 7)
      {
        uint64_t v29 = *((void *)&v37 + v24);
        *unsigned int v17 = *v21;
        v17[1] = v21[1];
        v17[2] = v21[2];
        v17[3] = v21[3];
        int v30 = &v21[qword_222A2F470[v24]];
        *((_DWORD *)v17 + 1) = *(_DWORD *)v30;
        uint64_t v25 = &v30[-v29];
      }
      else
      {
        uint64_t v26 = *(void *)v21;
        uint64_t v25 = v21 + 8;
        *(void *)unsigned int v17 = v26;
      }
      char v11 = &v17[v22 + 4];
      uint64_t v27 = v17 + 8;
      if (v11 > v5 - 12)
      {
        if (v11 > v5 - 5) {
          return (~v10 + a1);
        }
        if (v27 < v9)
        {
          uint64_t v31 = v17 + 8;
          uint64_t v32 = (uint64_t *)v25;
          do
          {
            uint64_t v33 = *v32++;
            *(void *)uint64_t v31 = v33;
            v31 += 8;
          }
          while (v31 < v9);
          v25 += v9 - v27;
          uint64_t v27 = v5 - 8;
        }
        while (v27 < v11)
        {
          char v34 = *v25++;
          *v27++ = v34;
        }
      }
      else
      {
        do
        {
          uint64_t v28 = *(void *)v25;
          v25 += 8;
          *(void *)uint64_t v27 = v28;
          v27 += 8;
        }
        while (v27 < v11);
      }
    }
  }
  else if (a3 == 1)
  {
    if (*a1) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
}

uint64_t LZ4_decompress_fast(unsigned __int8 *__src, char *__dst, int a3)
{
  int v3 = (int)__src;
  uint64_t v37 = *MEMORY[0x263EF8340];
  long long v31 = 0u;
  uint64_t v32 = 0;
  uint64_t v33 = -1;
  uint64_t v34 = 0;
  long long v35 = xmmword_222A2F460;
  uint64_t v36 = 3;
  if (a3)
  {
    int v4 = &__dst[a3];
    uint64_t v5 = v4 - 8;
    unsigned int v6 = __src;
    while (1)
    {
      unsigned int v8 = *v6++;
      char v7 = v8;
      size_t v9 = (unint64_t)v8 >> 4;
      if (v9 == 15)
      {
        size_t v9 = 15;
        do
        {
          unsigned int v10 = *v6++;
          v9 += v10;
        }
        while (v10 == 255);
      }
      char v11 = &__dst[v9];
      if (&__dst[v9] > v5) {
        break;
      }
      char v12 = (uint64_t *)v6;
      do
      {
        uint64_t v13 = *v12++;
        *(void *)__dst = v13;
        __dst += 8;
      }
      while (__dst < v11);
      size_t v14 = &v6[v9];
      unsigned int v16 = *(unsigned __int16 *)v14;
      unsigned int v6 = v14 + 2;
      uint64_t v15 = v16;
      uint64_t v17 = v7 & 0xF;
      if ((v7 & 0xF) == 0xF)
      {
        uint64_t v17 = 15;
        do
        {
          unsigned int v18 = *v6++;
          v17 += v18;
        }
        while (v18 == 255);
      }
      uint64_t v19 = &v11[-v15];
      if (v15 <= 7)
      {
        uint64_t v24 = *((void *)&v31 + v15);
        char *v11 = *v19;
        v11[1] = v19[1];
        v11[2] = v19[2];
        v11[3] = v19[3];
        uint64_t v25 = &v19[qword_222A2F470[v15]];
        *((_DWORD *)v11 + 1) = *(_DWORD *)v25;
        uint64_t v20 = &v25[-v24];
      }
      else
      {
        uint64_t v21 = *(void *)v19;
        uint64_t v20 = v19 + 8;
        *(void *)char v11 = v21;
      }
      __dst = &v11[v17 + 4];
      uint64_t v22 = v11 + 8;
      if (__dst > v4 - 12)
      {
        if (__dst > v4 - 5) {
          return (~v6 + v3);
        }
        if (v22 < v5)
        {
          uint64_t v26 = v22;
          uint64_t v27 = (uint64_t *)v20;
          do
          {
            uint64_t v28 = *v27++;
            *(void *)uint64_t v26 = v28;
            v26 += 8;
          }
          while (v26 < v5);
          v20 += v5 - v22;
          uint64_t v22 = v4 - 8;
        }
        while (v22 < __dst)
        {
          char v29 = *v20++;
          *v22++ = v29;
        }
      }
      else
      {
        do
        {
          uint64_t v23 = *(void *)v20;
          v20 += 8;
          *(void *)uint64_t v22 = v23;
          v22 += 8;
        }
        while (v22 < __dst);
      }
    }
    if (v11 != v4) {
      return (~v6 + v3);
    }
    memcpy(__dst, v6, v9);
    return (v6 + v9 - v3);
  }
  else if (*__src)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 1;
  }
}

void *LZ4_createStreamDecode()
{
  return malloc_type_calloc(1uLL, 0x20uLL, 0x1000040E0EAB150uLL);
}

uint64_t LZ4_setStreamDecode(void *a1, uint64_t a2, int a3)
{
  a1[2] = a2 + a3;
  a1[3] = a3;
  *a1 = 0;
  a1[1] = 0;
  return 1;
}

uint64_t LZ4_decompress_safe_continue(void *a1, char *__src, char *__dst, int a4, int a5)
{
  uint64_t v5 = __dst;
  uint64_t v120 = *MEMORY[0x263EF8340];
  unsigned int v6 = (char *)a1[2];
  unint64_t v7 = a1[3];
  unsigned int v8 = &__src[a4];
  size_t v9 = &__dst[a5];
  int v112 = (int)__src;
  v98 = (unsigned __int16 *)v8;
  v99 = v9;
  if (v6 != __dst)
  {
    *a1 = &v6[-v7];
    a1[1] = v7;
    long long v114 = 0u;
    uint64_t v115 = 0;
    uint64_t v116 = -1;
    uint64_t v117 = 0;
    long long v118 = xmmword_222A2F460;
    uint64_t v119 = 3;
    if (a5)
    {
      unsigned int v10 = &__dst[-v7];
      char v11 = v9 - 12;
      char v12 = v8 - 15;
      uint64_t v13 = v8 - 8;
      size_t v14 = v9 - 8;
      uint64_t v15 = v8 - 5;
      unint64_t v108 = v7;
      v110 = v9 - 5;
      unsigned int v16 = (unsigned __int8 *)__src;
      uint64_t v17 = __dst;
      v104 = v9 - 12;
      v106 = &__dst[-v7];
      v100 = v9 - 8;
      v102 = v8 - 8;
      while (1)
      {
        while (1)
        {
          unsigned int v19 = *v16++;
          char v18 = v19;
          size_t v20 = (unint64_t)v19 >> 4;
          if (v20 == 15)
          {
            size_t v20 = 15;
            do
            {
              unsigned int v22 = *v16++;
              unsigned int v21 = v22;
              v20 += v22;
            }
            while (v16 < (unsigned __int8 *)v12 && v21 == 255);
            if ((v20 & 0x8000000000000000) != 0)
            {
LABEL_95:
              uint64_t result = (~v16 + v112);
LABEL_96:
              v92 = a1;
              if ((int)result >= 1)
              {
                a1[3] = result;
                v93 = &v5[result];
                goto LABEL_106;
              }
              return result;
            }
          }
          uint64_t v23 = &v17[v20];
          uint64_t v24 = (unsigned __int16 *)&v16[v20];
          if (&v17[v20] > v11 || v24 > (unsigned __int16 *)v13)
          {
            if (v24 == v98 && v23 <= v99)
            {
              memcpy(v17, v16, v20);
              uint64_t result = (v23 - v5);
              goto LABEL_96;
            }
            goto LABEL_95;
          }
          do
          {
            uint64_t v26 = *(void *)v16;
            v16 += 8;
            *(void *)uint64_t v17 = v26;
            v17 += 8;
          }
          while (v17 < v23);
          uint64_t v27 = &v23[-*v24];
          unsigned int v16 = (unsigned __int8 *)(v24 + 1);
          if (!(v7 >> 16) && v27 < v10) {
            goto LABEL_95;
          }
          uint64_t v28 = v18 & 0xF;
          if (v28 == 15)
          {
            uint64_t v28 = 15;
            while (v16 <= (unsigned __int8 *)v15)
            {
              unsigned int v29 = *v16++;
              v28 += v29;
              if (v29 != 255)
              {
                if (v28 < 0) {
                  goto LABEL_95;
                }
                goto LABEL_21;
              }
            }
            goto LABEL_95;
          }
LABEL_21:
          size_t v30 = v28 + 4;
          long long v31 = &v23[v28 + 4];
          if (v27 >= v5) {
            break;
          }
          if (v31 > v110) {
            goto LABEL_95;
          }
          int64_t v32 = v5 - v27;
          uint64_t v33 = v6;
          uint64_t v34 = &v6[-(v5 - v27)];
          size_t v35 = v30 - (v5 - v27);
          if (v30 <= v5 - v27)
          {
            memmove(v23, v34, v30);
            goto LABEL_36;
          }
          memcpy(v23, v34, v5 - v27);
          uint64_t v17 = &v23[v32];
          if (v35 <= &v23[v32] - v5)
          {
            memcpy(v17, v5, v35);
LABEL_36:
            uint64_t v17 = v31;
            unsigned int v6 = v33;
            unsigned int v10 = v106;
            unint64_t v7 = v108;
            uint64_t v13 = v102;
            char v11 = v104;
            size_t v14 = v100;
          }
          else
          {
            unsigned int v6 = v33;
            unsigned int v10 = v106;
            unint64_t v7 = v108;
            uint64_t v13 = v102;
            char v11 = v104;
            size_t v14 = v100;
            if ((uint64_t)v30 > v32)
            {
              uint64_t v36 = v5;
              do
              {
                char v37 = *v36++;
                *v17++ = v37;
              }
              while (v17 < v31);
            }
          }
        }
        unint64_t v38 = *v24;
        if (v38 <= 7)
        {
          uint64_t v43 = *((void *)&v114 + v38);
          char *v23 = *v27;
          v23[1] = v27[1];
          v23[2] = v27[2];
          v23[3] = v27[3];
          unint64_t v44 = &v27[qword_222A2F470[v38]];
          *((_DWORD *)v23 + 1) = *(_DWORD *)v44;
          uint64_t v39 = &v44[-v43];
        }
        else
        {
          uint64_t v40 = *(void *)v27;
          uint64_t v39 = v27 + 8;
          *(void *)uint64_t v23 = v40;
        }
        long long v41 = v23 + 8;
        if (v31 <= v11) {
          break;
        }
        if (v31 > v110) {
          goto LABEL_95;
        }
        if (v41 < (void *)v14)
        {
          v45 = v23 + 8;
          uint64_t v46 = (uint64_t *)v39;
          do
          {
            uint64_t v47 = *v46++;
            *(void *)v45 = v47;
            v45 += 8;
          }
          while (v45 < v14);
          v39 += v14 - (char *)v41;
          long long v41 = v14;
        }
        uint64_t v17 = v31;
        if (v41 < (void *)v31)
        {
          do
          {
            char v48 = *v39++;
            *(unsigned char *)long long v41 = v48;
            long long v41 = (void *)((char *)v41 + 1);
          }
          while (v41 < (void *)v31);
LABEL_33:
          uint64_t v17 = v31;
        }
      }
      do
      {
        uint64_t v42 = *(void *)v39;
        v39 += 8;
        *v41++ = v42;
      }
      while (v41 < (void *)v31);
      goto LABEL_33;
    }
LABEL_108:
    if (a4 != 1) {
      return 0xFFFFFFFFLL;
    }
    if (*__src) {
      return 0xFFFFFFFFLL;
    }
    return 0;
  }
  uint64_t v50 = *a1;
  unint64_t v49 = a1[1];
  long long v114 = 0u;
  uint64_t v115 = 0;
  uint64_t v116 = -1;
  uint64_t v117 = 0;
  long long v118 = xmmword_222A2F460;
  uint64_t v119 = 3;
  if (!a5) {
    goto LABEL_108;
  }
  unint64_t v51 = &__dst[-v7];
  v52 = &v51[-v49];
  uint64_t v109 = v50 + v49;
  unint64_t v53 = v9 - 12;
  unsigned int v54 = v8 - 15;
  v55 = v8 - 8;
  int v56 = v9 - 8;
  unsigned int v57 = v8 - 5;
  v111 = v9 - 5;
  unint64_t v58 = v49 >> 16;
  uint64_t v59 = (unsigned __int8 *)__src;
  unint64_t v60 = __dst;
  int v97 = (int)__dst;
  v105 = v55;
  v107 = v9 - 12;
  unint64_t v101 = v49 >> 16;
  v103 = v9 - 8;
  while (1)
  {
    unsigned int v62 = *v59++;
    char v61 = v62;
    size_t v63 = (unint64_t)v62 >> 4;
    if (v63 == 15)
    {
      size_t v63 = 15;
      do
      {
        unsigned int v65 = *v59++;
        unsigned int v64 = v65;
        v63 += v65;
      }
      while (v59 < (unsigned __int8 *)v54 && v64 == 255);
      if ((v63 & 0x8000000000000000) != 0) {
        break;
      }
    }
    uint64_t v66 = &v60[v63];
    v67 = (unsigned __int16 *)&v59[v63];
    if (&v60[v63] > v53 || v67 > (unsigned __int16 *)v55)
    {
      if (v67 == v98 && v66 <= v99)
      {
        memcpy(v60, v59, v63);
        uint64_t result = (v66 - v5);
        goto LABEL_104;
      }
      break;
    }
    do
    {
      uint64_t v69 = *(void *)v59;
      v59 += 8;
      *(void *)unint64_t v60 = v69;
      v60 += 8;
    }
    while (v60 < v66);
    unsigned int v70 = &v66[-*v67];
    uint64_t v59 = (unsigned __int8 *)(v67 + 1);
    if (!v58 && v70 < v52) {
      break;
    }
    uint64_t v71 = v61 & 0xF;
    if (v71 == 15)
    {
      uint64_t v71 = 15;
      while (v59 <= (unsigned __int8 *)v57)
      {
        unsigned int v72 = *v59++;
        v71 += v72;
        if (v72 != 255)
        {
          if (v71 < 0) {
            goto LABEL_103;
          }
          goto LABEL_65;
        }
      }
      break;
    }
LABEL_65:
    size_t v73 = v71 + 4;
    v74 = &v66[v71 + 4];
    if (v70 >= v51)
    {
      unint64_t v80 = *v67;
      if (v80 <= 7)
      {
        uint64_t v85 = *((void *)&v114 + v80);
        *uint64_t v66 = *v70;
        v66[1] = v70[1];
        v66[2] = v70[2];
        v66[3] = v70[3];
        int v86 = &v70[qword_222A2F470[v80]];
        *((_DWORD *)v66 + 1) = *(_DWORD *)v86;
        v81 = &v86[-v85];
      }
      else
      {
        uint64_t v82 = *(void *)v70;
        v81 = v70 + 8;
        *(void *)uint64_t v66 = v82;
      }
      v83 = v66 + 8;
      if (v74 <= v53)
      {
        do
        {
          uint64_t v84 = *(void *)v81;
          v81 += 8;
          *v83++ = v84;
        }
        while (v83 < (void *)v74);
        goto LABEL_77;
      }
      if (v74 > v111) {
        break;
      }
      if (v83 < (void *)v56)
      {
        uint64_t v87 = v66 + 8;
        char v88 = (uint64_t *)v81;
        do
        {
          uint64_t v89 = *v88++;
          *(void *)uint64_t v87 = v89;
          v87 += 8;
        }
        while (v87 < v56);
        v81 += v56 - (char *)v83;
        v83 = v56;
      }
      unint64_t v60 = v74;
      if (v83 < (void *)v74)
      {
        do
        {
          char v90 = *v81++;
          *(unsigned char *)v83 = v90;
          v83 = (void *)((char *)v83 + 1);
        }
        while (v83 < (void *)v74);
LABEL_77:
        unint64_t v60 = v74;
      }
    }
    else
    {
      if (v74 > v111) {
        break;
      }
      int64_t v75 = v51 - v70;
      v76 = (const void *)(v109 - (v51 - v70));
      uint64_t v77 = v51;
      if (v73 <= v51 - v70)
      {
        memmove(v66, v76, v73);
        unint64_t v60 = v74;
        unint64_t v51 = v77;
        goto LABEL_80;
      }
      memcpy(v66, v76, v75);
      unint64_t v60 = &v66[v75];
      unint64_t v51 = v77;
      if (v73 - v75 <= &v66[v75] - v77)
      {
        memcpy(v60, v77, v73 - v75);
        unint64_t v51 = v77;
        unint64_t v60 = v74;
LABEL_80:
        LODWORD(v5) = v97;
        v55 = v105;
        unint64_t v53 = v107;
        unint64_t v58 = v101;
        int v56 = v103;
      }
      else
      {
        LODWORD(v5) = v97;
        v55 = v105;
        unint64_t v53 = v107;
        unint64_t v58 = v101;
        int v56 = v103;
        if ((uint64_t)v73 > v75)
        {
          v78 = v51;
          do
          {
            char v79 = *v78++;
            *v60++ = v79;
          }
          while (v60 < v74);
        }
      }
    }
  }
LABEL_103:
  uint64_t result = (~v59 + v112);
LABEL_104:
  v92 = a1;
  if ((int)result >= 1)
  {
    uint64_t v95 = a1[2];
    a1[3] += result;
    v93 = (char *)(v95 + result);
LABEL_106:
    v92[2] = v93;
  }
  return result;
}

uint64_t LZ4_decompress_fast_continue(uint64_t *a1, unsigned __int8 *__src, char *__dst, int a4)
{
  int v4 = __dst;
  uint64_t v5 = a1;
  uint64_t v92 = *MEMORY[0x263EF8340];
  uint64_t v6 = a1[3];
  unint64_t v7 = &__dst[a4];
  int v83 = (int)__src;
  uint64_t v80 = a4;
  v81 = v7;
  if ((char *)a1[2] != __dst)
  {
    *a1 = (uint64_t)&__dst[-v6];
    a1[1] = v6;
    long long v86 = 0u;
    uint64_t v87 = 0;
    uint64_t v88 = -1;
    uint64_t v89 = 0;
    long long v90 = xmmword_222A2F460;
    uint64_t v91 = 3;
    if (a4)
    {
      unsigned int v8 = v7 - 12;
      size_t v9 = v7 - 8;
      unsigned int v10 = &__dst[a4 - 5];
      char v11 = __src;
      char v12 = __dst;
      while (1)
      {
        while (1)
        {
          unsigned int v14 = *v11++;
          char v13 = v14;
          size_t v15 = (unint64_t)v14 >> 4;
          if (v15 == 15)
          {
            size_t v15 = 15;
            do
            {
              unsigned int v16 = *v11++;
              v15 += v16;
            }
            while (v16 == 255);
          }
          uint64_t v17 = &v12[v15];
          if (&v12[v15] > v9)
          {
            unint64_t v7 = v81;
            if (v17 != v81)
            {
              uint64_t v5 = a1;
LABEL_40:
              uint64_t result = (~v11 + v83);
              goto LABEL_80;
            }
            memcpy(v12, v11, v15);
            uint64_t v5 = a1;
            uint64_t result = (v11 + v15 - v83);
LABEL_80:
            if ((int)result >= 1)
            {
LABEL_81:
              v5[3] = v80;
              goto LABEL_86;
            }
            return result;
          }
          char v18 = (uint64_t *)v11;
          do
          {
            uint64_t v19 = *v18++;
            *(void *)char v12 = v19;
            v12 += 8;
          }
          while (v12 < v17);
          size_t v20 = &v11[v15];
          unsigned int v22 = *(unsigned __int16 *)v20;
          char v11 = v20 + 2;
          uint64_t v21 = v22;
          uint64_t v23 = v13 & 0xF;
          if (v23 == 15)
          {
            uint64_t v23 = 15;
            do
            {
              unsigned int v24 = *v11++;
              v23 += v24;
            }
            while (v24 == 255);
          }
          uint64_t v25 = &v17[-v21];
          uint64_t v26 = v23 + 4;
          uint64_t v27 = &v17[v23 + 4];
          if (&v17[-v21] >= v4) {
            break;
          }
          if (v27 > v10) {
            goto LABEL_88;
          }
          uint64_t v28 = v4 - v25;
          size_t v29 = v26 - (v4 - v25);
          if (v26 <= (unint64_t)(v4 - v25))
          {
            memmove(v17, v25, v23 + 4);
            goto LABEL_28;
          }
          memcpy(v17, v25, v4 - v25);
          char v12 = &v17[v28];
          if (v29 <= &v17[v28] - v4)
          {
            memcpy(v12, v4, v29);
            goto LABEL_28;
          }
          if (v26 > v28)
          {
            size_t v30 = v4;
            do
            {
              char v31 = *v30++;
              *v12++ = v31;
            }
            while (v12 < v27);
          }
        }
        uint64_t v32 = v21;
        if (v21 <= 7)
        {
          uint64_t v37 = *((void *)&v86 + v21);
          *uint64_t v17 = *v25;
          v17[1] = v25[1];
          v17[2] = v25[2];
          v17[3] = v25[3];
          unint64_t v38 = &v25[qword_222A2F470[v32]];
          *((_DWORD *)v17 + 1) = *(_DWORD *)v38;
          uint64_t v33 = &v38[-v37];
        }
        else
        {
          uint64_t v34 = *(void *)v25;
          uint64_t v33 = v25 + 8;
          *(void *)uint64_t v17 = v34;
        }
        size_t v35 = v17 + 8;
        if (v27 <= v8) {
          break;
        }
        if (v27 > v10)
        {
LABEL_88:
          unint64_t v7 = v81;
          uint64_t v5 = a1;
          goto LABEL_40;
        }
        if (v35 < (void *)v9)
        {
          uint64_t v39 = v17 + 8;
          uint64_t v40 = (uint64_t *)v33;
          do
          {
            uint64_t v41 = *v40++;
            *(void *)uint64_t v39 = v41;
            v39 += 8;
          }
          while (v39 < v9);
          v33 += v9 - (char *)v35;
          size_t v35 = v9;
        }
        char v12 = v27;
        if (v35 < (void *)v27)
        {
          do
          {
            char v42 = *v33++;
            *(unsigned char *)size_t v35 = v42;
            size_t v35 = (void *)((char *)v35 + 1);
          }
          while (v35 < (void *)v27);
LABEL_28:
          char v12 = v27;
        }
      }
      do
      {
        uint64_t v36 = *(void *)v33;
        v33 += 8;
        *v35++ = v36;
      }
      while (v35 < (void *)v27);
      goto LABEL_28;
    }
    if (!*__src)
    {
      uint64_t result = 1;
      goto LABEL_81;
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t v44 = *a1;
  uint64_t v45 = a1[1];
  long long v86 = 0u;
  uint64_t v87 = 0;
  uint64_t v88 = -1;
  uint64_t v89 = 0;
  long long v90 = xmmword_222A2F460;
  uint64_t v91 = 3;
  if (!a4)
  {
    if (!*__src)
    {
      uint64_t result = 1;
      goto LABEL_85;
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t v46 = &__dst[-v6];
  uint64_t v84 = v44 + v45;
  uint64_t v85 = v7 - 12;
  uint64_t v47 = v7 - 8;
  char v48 = v7 - 5;
  unint64_t v49 = __src;
  while (1)
  {
    unsigned int v51 = *v49++;
    char v50 = v51;
    size_t v52 = (unint64_t)v51 >> 4;
    if (v52 == 15)
    {
      size_t v52 = 15;
      do
      {
        unsigned int v53 = *v49++;
        v52 += v53;
      }
      while (v53 == 255);
    }
    unsigned int v54 = &v4[v52];
    if (&v4[v52] > v47) {
      break;
    }
    v55 = (uint64_t *)v49;
    do
    {
      uint64_t v56 = *v55++;
      *(void *)int v4 = v56;
      v4 += 8;
    }
    while (v4 < v54);
    unsigned int v57 = &v49[v52];
    unsigned int v59 = *(unsigned __int16 *)v57;
    unint64_t v49 = v57 + 2;
    uint64_t v58 = v59;
    uint64_t v60 = v50 & 0xF;
    if ((v50 & 0xF) == 0xF)
    {
      uint64_t v60 = 15;
      do
      {
        unsigned int v61 = *v49++;
        v60 += v61;
      }
      while (v61 == 255);
    }
    unsigned int v62 = &v54[-v58];
    uint64_t v63 = v60 + 4;
    unsigned int v64 = &v54[v60 + 4];
    if (&v54[-v58] >= v46)
    {
      if (v58 <= 7)
      {
        uint64_t v74 = *((void *)&v86 + v58);
        *unsigned int v54 = *v62;
        v54[1] = v62[1];
        v54[2] = v62[2];
        v54[3] = v62[3];
        int64_t v75 = &v62[qword_222A2F470[v58]];
        *((_DWORD *)v54 + 1) = *(_DWORD *)v75;
        unsigned int v70 = &v75[-v74];
      }
      else
      {
        uint64_t v71 = *(void *)v62;
        unsigned int v70 = v62 + 8;
        *(void *)unsigned int v54 = v71;
      }
      unsigned int v72 = v54 + 8;
      if (v64 <= v85)
      {
        do
        {
          uint64_t v73 = *(void *)v70;
          v70 += 8;
          *v72++ = v73;
        }
        while (v72 < (void *)v64);
        goto LABEL_67;
      }
      if (v64 > v48) {
        goto LABEL_78;
      }
      if (v72 < (void *)v47)
      {
        v76 = v54 + 8;
        uint64_t v77 = (uint64_t *)v70;
        do
        {
          uint64_t v78 = *v77++;
          *(void *)v76 = v78;
          v76 += 8;
        }
        while (v76 < v47);
        v70 += v47 - (char *)v72;
        unsigned int v72 = v47;
      }
      int v4 = v64;
      if (v72 < (void *)v64)
      {
        do
        {
          char v79 = *v70++;
          *(unsigned char *)unsigned int v72 = v79;
          unsigned int v72 = (void *)((char *)v72 + 1);
        }
        while (v72 < (void *)v64);
LABEL_67:
        int v4 = v64;
      }
    }
    else
    {
      if (v64 > v48) {
        goto LABEL_78;
      }
      int64_t v65 = v46 - v62;
      uint64_t v66 = (const void *)(v84 - (v46 - v62));
      unint64_t v67 = v63 - (v46 - v62);
      if (v63 <= (unint64_t)(v46 - v62))
      {
        memmove(v54, v66, v60 + 4);
        goto LABEL_67;
      }
      memcpy(v54, v66, v65);
      int v4 = &v54[v65];
      if (v67 <= &v54[v65] - v46)
      {
        memcpy(&v54[v65], v46, v63 - v65);
        goto LABEL_67;
      }
      if (v63 > v65)
      {
        int v68 = v46;
        do
        {
          char v69 = *v68++;
          *v4++ = v69;
        }
        while (v4 < v64);
      }
    }
  }
  if (v54 != v81)
  {
LABEL_78:
    uint64_t v5 = a1;
    uint64_t result = (~v49 + v83);
    goto LABEL_83;
  }
  memcpy(v4, v49, v52);
  uint64_t v5 = a1;
  uint64_t result = (v49 + v52 - v83);
LABEL_83:
  if ((int)result < 1) {
    return result;
  }
  int v4 = (char *)v5[2];
  uint64_t v6 = v5[3];
LABEL_85:
  v5[3] = v6 + v80;
  unint64_t v7 = &v4[v80];
LABEL_86:
  v5[2] = (uint64_t)v7;
  return result;
}

uint64_t LZ4_decompress_safe_usingDict(unsigned __int8 *__src, char *__dst, int a3, int a4, uint64_t a5, int a6)
{
  unint64_t v7 = __src;
  uint64_t v157 = *MEMORY[0x263EF8340];
  if (!a6)
  {
    long long v151 = 0u;
    uint64_t v152 = 0;
    uint64_t v153 = -1;
    uint64_t v154 = 0;
    long long v155 = xmmword_222A2F460;
    uint64_t v156 = 3;
    if (!a4) {
      goto LABEL_165;
    }
    unint64_t v49 = &__src[a3];
    char v50 = &__dst[a4];
    unsigned int v51 = v50 - 12;
    size_t v52 = v50 - 8;
    unsigned int v53 = __src;
    unsigned int v54 = __dst;
    while (1)
    {
      unsigned int v56 = *v53++;
      char v55 = v56;
      size_t v57 = (unint64_t)v56 >> 4;
      if (v57 == 15)
      {
        size_t v57 = 15;
        do
        {
          unsigned int v59 = *v53++;
          unsigned int v58 = v59;
          v57 += v59;
        }
        while (v53 < v49 - 15 && v58 == 255);
        if ((v57 & 0x8000000000000000) != 0) {
          return (~v53 + v7);
        }
      }
      uint64_t v60 = &v54[v57];
      unsigned int v61 = (unsigned __int16 *)&v53[v57];
      if (&v54[v57] > v51 || v61 > (unsigned __int16 *)v49 - 4) {
        break;
      }
      do
      {
        uint64_t v63 = *(void *)v53;
        v53 += 8;
        *(void *)unsigned int v54 = v63;
        v54 += 8;
      }
      while (v54 < v60);
      unsigned int v64 = &v60[-*v61];
      unsigned int v53 = (unsigned __int8 *)(v61 + 1);
      if (v64 < __dst) {
        return (~v53 + v7);
      }
      uint64_t v65 = v55 & 0xF;
      if ((v55 & 0xF) == 0xF)
      {
        uint64_t v65 = 15;
        do
        {
          if (v53 > v49 - 5) {
            return (~v53 + v7);
          }
          unsigned int v66 = *v53++;
          v65 += v66;
        }
        while (v66 == 255);
        if (v65 < 0) {
          return (~v53 + v7);
        }
      }
      unint64_t v67 = *v61;
      if (v67 <= 7)
      {
        uint64_t v72 = *((void *)&v151 + v67);
        *uint64_t v60 = *v64;
        v60[1] = v64[1];
        v60[2] = v64[2];
        v60[3] = v64[3];
        uint64_t v73 = &v64[qword_222A2F470[v67]];
        *((_DWORD *)v60 + 1) = *(_DWORD *)v73;
        int v68 = &v73[-v72];
      }
      else
      {
        uint64_t v69 = *(void *)v64;
        int v68 = v64 + 8;
        *(void *)uint64_t v60 = v69;
      }
      unsigned int v54 = &v60[v65 + 4];
      unsigned int v70 = v60 + 8;
      if (v54 > v51)
      {
        if (v54 > v50 - 5) {
          return (~v53 + v7);
        }
        if (v70 < v52)
        {
          uint64_t v74 = v60 + 8;
          int64_t v75 = (uint64_t *)v68;
          do
          {
            uint64_t v76 = *v75++;
            *(void *)uint64_t v74 = v76;
            v74 += 8;
          }
          while (v74 < v52);
          v68 += v52 - v70;
          unsigned int v70 = v50 - 8;
        }
        while (v70 < v54)
        {
          char v77 = *v68++;
          *v70++ = v77;
        }
      }
      else
      {
        do
        {
          uint64_t v71 = *(void *)v68;
          v68 += 8;
          *(void *)unsigned int v70 = v71;
          v70 += 8;
        }
        while (v70 < v54);
      }
    }
    BOOL v138 = v61 == (unsigned __int16 *)v49;
    goto LABEL_158;
  }
  unsigned int v8 = (char *)(a5 + a6);
  if (v8 == __dst)
  {
    if (a6 >= 0xFFFF)
    {
      long long v151 = 0uLL;
      uint64_t v152 = 0;
      uint64_t v153 = -1;
      uint64_t v154 = 0;
      long long v155 = xmmword_222A2F460;
      uint64_t v156 = 3;
      if (!a4) {
        goto LABEL_165;
      }
      uint64_t v78 = 0;
      char v79 = &__src[a3];
      uint64_t v80 = &__dst[a4];
      int64_t v81 = a4;
      uint64_t v82 = v80 - 12;
      int v83 = v80 - 8;
      uint64_t v84 = v80 - 5;
      unsigned int v53 = __src;
      while (1)
      {
        unsigned int v86 = *v53++;
        char v85 = v86;
        size_t v87 = (unint64_t)v86 >> 4;
        if (v87 == 15)
        {
          size_t v87 = 15;
          do
          {
            unsigned int v89 = *v53++;
            unsigned int v88 = v89;
            v87 += v89;
          }
          while (v53 < v79 - 15 && v88 == 255);
          if ((v87 & 0x8000000000000000) != 0) {
            return (~v53 + v7);
          }
        }
        long long v90 = &__dst[v78];
        int64_t v91 = v87 + v78;
        uint64_t v92 = &__dst[v87 + v78];
        v93 = (unsigned __int16 *)&v53[v87];
        if (v92 > v82 || v93 > (unsigned __int16 *)v79 - 4) {
          break;
        }
        do
        {
          uint64_t v95 = *(void *)v53;
          v53 += 8;
          *(void *)long long v90 = v95;
          v90 += 8;
        }
        while (v90 < v92);
        uint64_t v96 = v91 - *v93;
        unsigned int v53 = (unsigned __int8 *)(v93 + 1);
        if (v96 < -65536) {
          return (~v53 + v7);
        }
        uint64_t v97 = v85 & 0xF;
        if ((v85 & 0xF) == 0xF)
        {
          uint64_t v97 = 15;
          do
          {
            if (v53 > v79 - 5) {
              return (~v53 + v7);
            }
            unsigned int v98 = *v53++;
            v97 += v98;
          }
          while (v98 == 255);
          if (v97 < 0) {
            return (~v53 + v7);
          }
        }
        v99 = &__dst[v96];
        int64_t v100 = v92 - v99;
        if (v92 - v99 <= 7)
        {
          uint64_t v106 = *((void *)&v151 + v100);
          char *v92 = *v99;
          v92[1] = v99[1];
          v92[2] = v99[2];
          v92[3] = v99[3];
          v107 = &v99[qword_222A2F470[v100]];
          *((_DWORD *)v92 + 1) = *(_DWORD *)v107;
          unint64_t v101 = &v107[-v106];
        }
        else
        {
          uint64_t v102 = *(void *)v99;
          unint64_t v101 = v99 + 8;
          *(void *)uint64_t v92 = v102;
        }
        uint64_t v78 = v91 + v97 + 4;
        v103 = &__dst[v78];
        v104 = v92 + 8;
        if (&__dst[v78] > v82)
        {
          if (v103 > v84) {
            return (~v53 + v7);
          }
          if (v104 < (void *)v83)
          {
            unint64_t v108 = (char *)v104;
            uint64_t v109 = v101;
            do
            {
              uint64_t v110 = *(void *)v109;
              v109 += 8;
              *(void *)unint64_t v108 = v110;
              v108 += 8;
            }
            while (v108 < v83);
            v101 += v83 - (char *)v104;
            v104 = v83;
          }
          while (v104 < (void *)v103)
          {
            char v111 = *v101++;
            *(unsigned char *)v104 = v111;
            v104 = (void *)((char *)v104 + 1);
          }
        }
        else
        {
          do
          {
            uint64_t v105 = *(void *)v101;
            v101 += 8;
            *v104++ = v105;
          }
          while (v104 < (void *)v103);
        }
      }
      if (v93 == (unsigned __int16 *)v79 && v91 <= v81)
      {
        memcpy(v90, v53, v87);
        return v91;
      }
      return (~v53 + v7);
    }
    long long v151 = 0uLL;
    uint64_t v152 = 0;
    uint64_t v153 = -1;
    uint64_t v154 = 0;
    long long v155 = xmmword_222A2F460;
    uint64_t v156 = 3;
    if (!a4) {
      goto LABEL_165;
    }
    int v112 = &__src[a3];
    char v50 = &__dst[a4];
    v113 = &__dst[-a6];
    long long v114 = v50 - 12;
    uint64_t v115 = v50 - 8;
    unsigned int v53 = __src;
    unsigned int v54 = __dst;
    while (1)
    {
      unsigned int v117 = *v53++;
      char v116 = v117;
      size_t v57 = (unint64_t)v117 >> 4;
      if (v57 == 15)
      {
        size_t v57 = 15;
        do
        {
          unsigned int v119 = *v53++;
          unsigned int v118 = v119;
          v57 += v119;
        }
        while (v53 < v112 - 15 && v118 == 255);
        if ((v57 & 0x8000000000000000) != 0) {
          return (~v53 + v7);
        }
      }
      uint64_t v60 = &v54[v57];
      uint64_t v120 = (unsigned __int16 *)&v53[v57];
      if (&v54[v57] > v114 || v120 > (unsigned __int16 *)v112 - 4) {
        break;
      }
      do
      {
        uint64_t v122 = *(void *)v53;
        v53 += 8;
        *(void *)unsigned int v54 = v122;
        v54 += 8;
      }
      while (v54 < v60);
      v123 = &v60[-*v120];
      unsigned int v53 = (unsigned __int8 *)(v120 + 1);
      if (v123 < v113) {
        return (~v53 + v7);
      }
      uint64_t v124 = v116 & 0xF;
      if ((v116 & 0xF) == 0xF)
      {
        uint64_t v124 = 15;
        do
        {
          if (v53 > v112 - 5) {
            return (~v53 + v7);
          }
          unsigned int v125 = *v53++;
          v124 += v125;
        }
        while (v125 == 255);
        if (v124 < 0) {
          return (~v53 + v7);
        }
      }
      unint64_t v126 = *v120;
      if (v126 <= 7)
      {
        uint64_t v131 = *((void *)&v151 + v126);
        *uint64_t v60 = *v123;
        v60[1] = v123[1];
        v60[2] = v123[2];
        v60[3] = v123[3];
        v132 = &v123[qword_222A2F470[v126]];
        *((_DWORD *)v60 + 1) = *(_DWORD *)v132;
        v127 = &v132[-v131];
      }
      else
      {
        uint64_t v128 = *(void *)v123;
        v127 = v123 + 8;
        *(void *)uint64_t v60 = v128;
      }
      unsigned int v54 = &v60[v124 + 4];
      v129 = v60 + 8;
      if (v54 > v114)
      {
        if (v54 > v50 - 5) {
          return (~v53 + v7);
        }
        if (v129 < v115)
        {
          v133 = v60 + 8;
          v134 = (uint64_t *)v127;
          do
          {
            uint64_t v135 = *v134++;
            *(void *)v133 = v135;
            v133 += 8;
          }
          while (v133 < v115);
          v127 += v115 - v129;
          v129 = v50 - 8;
        }
        while (v129 < v54)
        {
          char v136 = *v127++;
          *v129++ = v136;
        }
      }
      else
      {
        do
        {
          uint64_t v130 = *(void *)v127;
          v127 += 8;
          *(void *)v129 = v130;
          v129 += 8;
        }
        while (v129 < v54);
      }
    }
    BOOL v138 = v120 == (unsigned __int16 *)v112;
LABEL_158:
    if (v138 && v60 <= v50)
    {
      memcpy(v54, v53, v57);
      return (v60 - __dst);
    }
    return (~v53 + v7);
  }
  long long v151 = 0u;
  uint64_t v152 = 0;
  uint64_t v153 = -1;
  uint64_t v154 = 0;
  long long v155 = xmmword_222A2F460;
  uint64_t v156 = 3;
  if (a4)
  {
    size_t v9 = (char *)&__src[a3];
    unsigned int v10 = &__dst[a4];
    char v11 = &__dst[-a6];
    char v12 = v10 - 12;
    char v13 = v9 - 15;
    unsigned int v14 = v9 - 8;
    size_t v15 = v10 - 8;
    v142 = v10;
    v143 = (unsigned __int16 *)v9;
    unsigned int v16 = v9 - 5;
    int v149 = a6;
    v150 = v10 - 5;
    int v144 = (int)__src;
    v145 = v10 - 8;
    uint64_t v17 = __dst;
    v147 = v10 - 12;
    v148 = v11;
    v146 = v9 - 8;
    while (1)
    {
      while (1)
      {
        unsigned int v19 = *v7++;
        char v18 = v19;
        size_t v20 = (unint64_t)v19 >> 4;
        if (v20 == 15)
        {
          size_t v20 = 15;
          do
          {
            unsigned int v22 = *v7++;
            unsigned int v21 = v22;
            v20 += v22;
          }
          while (v7 < (unsigned __int8 *)v13 && v21 == 255);
          if ((v20 & 0x8000000000000000) != 0) {
            return (~v7 + v144);
          }
        }
        unint64_t v23 = (unint64_t)&v17[v20];
        unsigned int v24 = (unsigned __int16 *)&v7[v20];
        if (&v17[v20] > v12 || v24 > (unsigned __int16 *)v14)
        {
          if (v24 == v143 && v23 <= (unint64_t)v142)
          {
            memcpy(v17, v7, v20);
            return (v23 - __dst);
          }
          return (~v7 + v144);
        }
        do
        {
          uint64_t v26 = *(void *)v7;
          v7 += 8;
          *(void *)uint64_t v17 = v26;
          v17 += 8;
        }
        while ((unint64_t)v17 < v23);
        uint64_t v27 = (char *)(v23 - *v24);
        unint64_t v7 = (unsigned __int8 *)(v24 + 1);
        if (!HIWORD(a6) && v27 < v11) {
          return (~v7 + v144);
        }
        uint64_t v28 = v18 & 0xF;
        if (v28 == 15)
        {
          uint64_t v28 = 15;
          while (v7 <= (unsigned __int8 *)v16)
          {
            unsigned int v29 = *v7++;
            v28 += v29;
            if (v29 != 255)
            {
              if (v28 < 0) {
                return (~v7 + v144);
              }
              goto LABEL_22;
            }
          }
          return (~v7 + v144);
        }
LABEL_22:
        size_t v30 = (char *)(v28 + 4);
        char v31 = (char *)(v23 + v28 + 4);
        if (v27 >= __dst) {
          break;
        }
        if (v31 > v150) {
          return (~v7 + v144);
        }
        uint64_t v32 = (char *)(__dst - v27);
        uint64_t v33 = v8;
        uint64_t v34 = &v8[-(__dst - v27)];
        size_t v35 = (size_t)&v30[-(__dst - v27)];
        if ((unint64_t)v30 <= __dst - v27)
        {
          memmove((void *)v23, v34, (size_t)v30);
          uint64_t v17 = v31;
          unsigned int v8 = v33;
          goto LABEL_37;
        }
        memcpy((void *)v23, v34, __dst - v27);
        uint64_t v17 = &v32[v23];
        if (v35 <= &v32[v23] - __dst)
        {
          memcpy(v17, __dst, v35);
          uint64_t v17 = v31;
          unsigned int v8 = v33;
LABEL_37:
          char v11 = v148;
          a6 = v149;
          unsigned int v14 = v146;
          char v12 = v147;
          size_t v15 = v145;
        }
        else
        {
          unsigned int v8 = v33;
          char v11 = v148;
          a6 = v149;
          unsigned int v14 = v146;
          char v12 = v147;
          size_t v15 = v145;
          if ((uint64_t)v30 > (uint64_t)v32)
          {
            uint64_t v36 = __dst;
            do
            {
              char v37 = *v36++;
              *v17++ = v37;
            }
            while (v17 < v31);
          }
        }
      }
      unint64_t v38 = *v24;
      if (v38 <= 7)
      {
        uint64_t v43 = *((void *)&v151 + v38);
        *(unsigned char *)unint64_t v23 = *v27;
        *(unsigned char *)(v23 + 1) = v27[1];
        *(unsigned char *)(v23 + 2) = v27[2];
        *(unsigned char *)(v23 + 3) = v27[3];
        uint64_t v44 = &v27[qword_222A2F470[v38]];
        *(_DWORD *)(v23 + 4) = *(_DWORD *)v44;
        uint64_t v39 = &v44[-v43];
      }
      else
      {
        uint64_t v40 = *(void *)v27;
        uint64_t v39 = v27 + 8;
        *(void *)unint64_t v23 = v40;
      }
      uint64_t v41 = (void *)(v23 + 8);
      if (v31 <= v12) {
        break;
      }
      if (v31 > v150) {
        return (~v7 + v144);
      }
      if (v41 < (void *)v15)
      {
        uint64_t v45 = (char *)(v23 + 8);
        uint64_t v46 = (uint64_t *)v39;
        do
        {
          uint64_t v47 = *v46++;
          *(void *)uint64_t v45 = v47;
          v45 += 8;
        }
        while (v45 < v15);
        v39 += v15 - (char *)v41;
        uint64_t v41 = v15;
      }
      uint64_t v17 = v31;
      if (v41 < (void *)v31)
      {
        do
        {
          char v48 = *v39++;
          *(unsigned char *)uint64_t v41 = v48;
          uint64_t v41 = (void *)((char *)v41 + 1);
        }
        while (v41 < (void *)v31);
LABEL_34:
        uint64_t v17 = v31;
      }
    }
    do
    {
      uint64_t v42 = *(void *)v39;
      v39 += 8;
      *v41++ = v42;
    }
    while (v41 < (void *)v31);
    goto LABEL_34;
  }
LABEL_165:
  if (a3 != 1) {
    return 0xFFFFFFFFLL;
  }
  if (*__src) {
    return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t LZ4_decompress_fast_usingDict(unsigned __int8 *__src, char *__dst, int a3, uint64_t a4, int a5)
{
  uint64_t v5 = __dst;
  int v6 = (int)__src;
  uint64_t v123 = *MEMORY[0x263EF8340];
  unint64_t v7 = &__dst[a3];
  if (!a5)
  {
    long long v117 = 0u;
    uint64_t v118 = 0;
    uint64_t v119 = -1;
    uint64_t v120 = 0;
    long long v121 = xmmword_222A2F460;
    uint64_t v122 = 3;
    if (a3)
    {
      uint64_t v44 = v7 - 8;
      uint64_t v45 = __src;
      while (1)
      {
        unsigned int v47 = *v45++;
        char v46 = v47;
        size_t v48 = (unint64_t)v47 >> 4;
        if (v48 == 15)
        {
          size_t v48 = 15;
          do
          {
            unsigned int v49 = *v45++;
            v48 += v49;
          }
          while (v49 == 255);
        }
        char v50 = &v5[v48];
        if (&v5[v48] > v44) {
          break;
        }
        unsigned int v51 = (uint64_t *)v45;
        do
        {
          uint64_t v52 = *v51++;
          *(void *)uint64_t v5 = v52;
          v5 += 8;
        }
        while (v5 < v50);
        unsigned int v53 = &v45[v48];
        unsigned int v55 = *(unsigned __int16 *)v53;
        uint64_t v45 = v53 + 2;
        uint64_t v54 = v55;
        uint64_t v56 = v46 & 0xF;
        if ((v46 & 0xF) == 0xF)
        {
          uint64_t v56 = 15;
          do
          {
            unsigned int v57 = *v45++;
            v56 += v57;
          }
          while (v57 == 255);
        }
        unsigned int v58 = &v50[-v54];
        if (v54 <= 7)
        {
          uint64_t v63 = *((void *)&v117 + v54);
          char *v50 = *v58;
          v50[1] = v58[1];
          v50[2] = v58[2];
          v50[3] = v58[3];
          unsigned int v64 = &v58[qword_222A2F470[v54]];
          *((_DWORD *)v50 + 1) = *(_DWORD *)v64;
          unsigned int v59 = &v64[-v63];
        }
        else
        {
          uint64_t v60 = *(void *)v58;
          unsigned int v59 = v58 + 8;
          *(void *)char v50 = v60;
        }
        uint64_t v5 = &v50[v56 + 4];
        unsigned int v61 = v50 + 8;
        if (v5 > v7 - 12)
        {
          if (v5 > v7 - 5) {
            return (~v45 + __src);
          }
          if (v61 < v44)
          {
            uint64_t v65 = v61;
            unsigned int v66 = (uint64_t *)v59;
            do
            {
              uint64_t v67 = *v66++;
              *(void *)uint64_t v65 = v67;
              v65 += 8;
            }
            while (v65 < v44);
            v59 += v44 - v61;
            unsigned int v61 = v7 - 8;
          }
          while (v61 < v5)
          {
            char v68 = *v59++;
            *v61++ = v68;
          }
        }
        else
        {
          do
          {
            uint64_t v62 = *(void *)v59;
            v59 += 8;
            *(void *)unsigned int v61 = v62;
            v61 += 8;
          }
          while (v61 < v5);
        }
      }
LABEL_118:
      if (v50 == v7)
      {
        memcpy(v5, v45, v48);
        return (v45 + v48 - v6);
      }
      return (~v45 + __src);
    }
LABEL_122:
    if (*__src) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 1;
    }
  }
  unsigned int v8 = (void *)(a4 + a5);
  if (v8 == (void *)v5)
  {
    uint64_t v69 = v7 - 12;
    if (a5 < 0xFFFF)
    {
      long long v117 = 0uLL;
      uint64_t v118 = 0;
      uint64_t v119 = -1;
      uint64_t v120 = 0;
      long long v121 = xmmword_222A2F460;
      uint64_t v122 = 3;
      if (a3)
      {
        uint64_t v92 = v7 - 8;
        uint64_t v45 = __src;
        while (1)
        {
          unsigned int v94 = *v45++;
          char v93 = v94;
          size_t v48 = (unint64_t)v94 >> 4;
          if (v48 == 15)
          {
            size_t v48 = 15;
            do
            {
              unsigned int v95 = *v45++;
              v48 += v95;
            }
            while (v95 == 255);
          }
          char v50 = &v5[v48];
          if (&v5[v48] > v92) {
            break;
          }
          uint64_t v96 = (uint64_t *)v45;
          do
          {
            uint64_t v97 = *v96++;
            *(void *)uint64_t v5 = v97;
            v5 += 8;
          }
          while (v5 < v50);
          unsigned int v98 = &v45[v48];
          unsigned int v100 = *(unsigned __int16 *)v98;
          uint64_t v45 = v98 + 2;
          uint64_t v99 = v100;
          uint64_t v101 = v93 & 0xF;
          if ((v93 & 0xF) == 0xF)
          {
            uint64_t v101 = 15;
            do
            {
              unsigned int v102 = *v45++;
              v101 += v102;
            }
            while (v102 == 255);
          }
          v103 = &v50[-v99];
          if (v99 <= 7)
          {
            uint64_t v108 = *((void *)&v117 + v99);
            char *v50 = *v103;
            v50[1] = v103[1];
            v50[2] = v103[2];
            v50[3] = v103[3];
            uint64_t v109 = &v103[qword_222A2F470[v99]];
            *((_DWORD *)v50 + 1) = *(_DWORD *)v109;
            v104 = &v109[-v108];
          }
          else
          {
            uint64_t v105 = *(void *)v103;
            v104 = v103 + 8;
            *(void *)char v50 = v105;
          }
          uint64_t v5 = &v50[v101 + 4];
          uint64_t v106 = v50 + 8;
          if (v5 > v69)
          {
            if (v5 > v7 - 5) {
              return (~v45 + __src);
            }
            if (v106 < v92)
            {
              uint64_t v110 = v106;
              char v111 = (uint64_t *)v104;
              do
              {
                uint64_t v112 = *v111++;
                *(void *)uint64_t v110 = v112;
                v110 += 8;
              }
              while (v110 < v92);
              v104 += v92 - v106;
              uint64_t v106 = v7 - 8;
            }
            while (v106 < v5)
            {
              char v113 = *v104++;
              *v106++ = v113;
            }
          }
          else
          {
            do
            {
              uint64_t v107 = *(void *)v104;
              v104 += 8;
              *(void *)uint64_t v106 = v107;
              v106 += 8;
            }
            while (v106 < v5);
          }
        }
        goto LABEL_118;
      }
    }
    else
    {
      long long v117 = 0uLL;
      uint64_t v118 = 0;
      uint64_t v119 = -1;
      uint64_t v120 = 0;
      long long v121 = xmmword_222A2F460;
      uint64_t v122 = 3;
      if (a3)
      {
        unsigned int v70 = v7 - 8;
        uint64_t v45 = __src;
        while (1)
        {
          unsigned int v72 = *v45++;
          char v71 = v72;
          size_t v48 = (unint64_t)v72 >> 4;
          if (v48 == 15)
          {
            size_t v48 = 15;
            do
            {
              unsigned int v73 = *v45++;
              v48 += v73;
            }
            while (v73 == 255);
          }
          char v50 = &v5[v48];
          if (&v5[v48] > v70) {
            break;
          }
          uint64_t v74 = (uint64_t *)v45;
          do
          {
            uint64_t v75 = *v74++;
            *(void *)uint64_t v5 = v75;
            v5 += 8;
          }
          while (v5 < v50);
          uint64_t v76 = &v45[v48];
          unsigned int v78 = *(unsigned __int16 *)v76;
          uint64_t v45 = v76 + 2;
          uint64_t v77 = v78;
          uint64_t v79 = v71 & 0xF;
          if ((v71 & 0xF) == 0xF)
          {
            uint64_t v79 = 15;
            do
            {
              unsigned int v80 = *v45++;
              v79 += v80;
            }
            while (v80 == 255);
          }
          int64_t v81 = &v50[-v77];
          if (v77 <= 7)
          {
            uint64_t v86 = *((void *)&v117 + v77);
            char *v50 = *v81;
            v50[1] = v81[1];
            v50[2] = v81[2];
            v50[3] = v81[3];
            size_t v87 = &v81[qword_222A2F470[v77]];
            *((_DWORD *)v50 + 1) = *(_DWORD *)v87;
            uint64_t v82 = &v87[-v86];
          }
          else
          {
            uint64_t v83 = *(void *)v81;
            uint64_t v82 = v81 + 8;
            *(void *)char v50 = v83;
          }
          uint64_t v5 = &v50[v79 + 4];
          uint64_t v84 = v50 + 8;
          if (v5 > v69)
          {
            if (v5 > v7 - 5) {
              return (~v45 + __src);
            }
            if (v84 < v70)
            {
              unsigned int v88 = v84;
              unsigned int v89 = (uint64_t *)v82;
              do
              {
                uint64_t v90 = *v89++;
                *(void *)unsigned int v88 = v90;
                v88 += 8;
              }
              while (v88 < v70);
              v82 += v70 - v84;
              uint64_t v84 = v7 - 8;
            }
            while (v84 < v5)
            {
              char v91 = *v82++;
              *v84++ = v91;
            }
          }
          else
          {
            do
            {
              uint64_t v85 = *(void *)v82;
              v82 += 8;
              *(void *)uint64_t v84 = v85;
              v84 += 8;
            }
            while (v84 < v5);
          }
        }
        goto LABEL_118;
      }
    }
    goto LABEL_122;
  }
  long long v117 = 0u;
  uint64_t v118 = 0;
  uint64_t v119 = -1;
  uint64_t v120 = 0;
  long long v121 = xmmword_222A2F460;
  uint64_t v122 = 3;
  if (!a3) {
    goto LABEL_122;
  }
  int v115 = (int)__src;
  char v116 = v7 - 12;
  size_t v9 = v7 - 8;
  long long v114 = v7;
  unsigned int v10 = v7 - 5;
  char v11 = __src;
  char v12 = v5;
  while (1)
  {
    unsigned int v14 = *v11++;
    char v13 = v14;
    size_t v15 = (unint64_t)v14 >> 4;
    if (v15 == 15)
    {
      size_t v15 = 15;
      do
      {
        unsigned int v16 = *v11++;
        v15 += v16;
      }
      while (v16 == 255);
    }
    uint64_t v17 = &v12[v15];
    if (&v12[v15] > v9) {
      break;
    }
    char v18 = (uint64_t *)v11;
    do
    {
      uint64_t v19 = *v18++;
      *(void *)char v12 = v19;
      v12 += 8;
    }
    while (v12 < v17);
    size_t v20 = &v11[v15];
    unsigned int v22 = *(unsigned __int16 *)v20;
    char v11 = v20 + 2;
    uint64_t v21 = v22;
    uint64_t v23 = v13 & 0xF;
    if ((v13 & 0xF) == 0xF)
    {
      uint64_t v23 = 15;
      do
      {
        unsigned int v24 = *v11++;
        v23 += v24;
      }
      while (v24 == 255);
    }
    uint64_t v25 = &v17[-v21];
    uint64_t v26 = v23 + 4;
    uint64_t v27 = &v17[v23 + 4];
    if (&v17[-v21] >= v5)
    {
      if (v21 <= 7)
      {
        uint64_t v37 = *((void *)&v117 + v21);
        *uint64_t v17 = *v25;
        v17[1] = v25[1];
        v17[2] = v25[2];
        v17[3] = v25[3];
        unint64_t v38 = &v25[qword_222A2F470[v21]];
        *((_DWORD *)v17 + 1) = *(_DWORD *)v38;
        uint64_t v33 = &v38[-v37];
      }
      else
      {
        uint64_t v34 = *(void *)v25;
        uint64_t v33 = v25 + 8;
        *(void *)uint64_t v17 = v34;
      }
      size_t v35 = v17 + 8;
      if (v27 <= v116)
      {
        do
        {
          uint64_t v36 = *(void *)v33;
          v33 += 8;
          *v35++ = v36;
        }
        while (v35 < (void *)v27);
        goto LABEL_29;
      }
      if (v27 > v10) {
        return (~v11 + v115);
      }
      if (v35 < (void *)v9)
      {
        uint64_t v39 = v17 + 8;
        uint64_t v40 = (uint64_t *)v33;
        do
        {
          uint64_t v41 = *v40++;
          *(void *)uint64_t v39 = v41;
          v39 += 8;
        }
        while (v39 < v9);
        v33 += v9 - (char *)v35;
        size_t v35 = v9;
      }
      char v12 = v27;
      if (v35 < (void *)v27)
      {
        do
        {
          char v42 = *v33++;
          *(unsigned char *)size_t v35 = v42;
          size_t v35 = (void *)((char *)v35 + 1);
        }
        while (v35 < (void *)v27);
LABEL_29:
        char v12 = v27;
      }
    }
    else
    {
      if (v27 > v10) {
        return (~v11 + v115);
      }
      uint64_t v28 = v5 - v25;
      unsigned int v29 = (char *)v8 - (v5 - v25);
      size_t v30 = v26 - (v5 - v25);
      if (v26 <= (unint64_t)(v5 - v25))
      {
        memmove(v17, v29, v23 + 4);
        goto LABEL_29;
      }
      memcpy(v17, v29, v5 - v25);
      char v12 = &v17[v28];
      if (v30 <= &v17[v28] - v5)
      {
        memcpy(v12, v5, v30);
        goto LABEL_29;
      }
      if (v26 > v28)
      {
        char v31 = v5;
        do
        {
          char v32 = *v31++;
          *v12++ = v32;
        }
        while (v12 < v27);
      }
    }
  }
  if (v17 != v114) {
    return (~v11 + v115);
  }
  memcpy(v12, v11, v15);
  return (v11 + v15 - v115);
}

uint64_t LZ4_compress(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = v6;
  uint64_t v19 = v7;
  uint64_t v16 = v2;
  uint64_t v17 = v3;
  uint64_t v14 = v4;
  uint64_t v15 = v5;
  MEMORY[0x270FA5388](a1, a1, a2);
  memset(v13, 0, 512);
  return LZ4_compress_fast_extState(v13, v8, v9, v10, v11, 1);
}

uint64_t LZ4_compress_limitedOutput_withState(void *a1, char *a2, unsigned char *a3, int a4, signed int a5)
{
  return LZ4_compress_fast_extState(a1, a2, a3, a4, a5, 1);
}

uint64_t LZ4_compress_withState(void *a1, char *a2, unsigned char *a3, unsigned int a4)
{
  if (a4 <= 0x7E000000) {
    signed int v4 = a4 + a4 / 0xFF + 16;
  }
  else {
    signed int v4 = 0;
  }
  return LZ4_compress_fast_extState(a1, a2, a3, a4, v4, 1);
}

uint64_t LZ4_compress_limitedOutput_continue(uint64_t a1, char *a2, unsigned char *a3, signed int a4, unsigned int a5)
{
  return LZ4_compress_fast_continue(a1, a2, a3, a4, a5, 1);
}

uint64_t LZ4_compress_continue(uint64_t a1, char *a2, unsigned char *a3, unsigned int a4)
{
  if (a4 <= 0x7E000000) {
    unsigned int v4 = a4 + a4 / 0xFF + 16;
  }
  else {
    unsigned int v4 = 0;
  }
  return LZ4_compress_fast_continue(a1, a2, a3, a4, v4, 1);
}

uint64_t LZ4_resetStreamState(void *a1, uint64_t a2)
{
  if ((a1 & 3) != 0) {
    return 1;
  }
  bzero(a1, 0x4020uLL);
  uint64_t result = 0;
  a1[2050] = a2;
  return result;
}

void *LZ4_create(uint64_t a1)
{
  uint64_t v2 = malloc_type_calloc(8uLL, 0x804uLL, 0x798FCC56uLL);
  bzero(v2, 0x4020uLL);
  v2[2050] = a1;
  return v2;
}

size_t LZ4_slideInputBuffer(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16400);
  uint64_t v3 = *(unsigned int *)(a1 + 16408);
  if (v3 >= 0x10000) {
    size_t v4 = 0x10000;
  }
  else {
    size_t v4 = v3;
  }
  memmove(*(void **)(a1 + 16400), (const void *)(*(void *)(a1 + 16392) + v3 - v4), v4);
  *(void *)(a1 + 16392) = v2;
  *(_DWORD *)(a1 + 16408) = v4;
  return *(void *)(a1 + 16400) + v4;
}

uint64_t LZ4_decompress_safe_withPrefix64k(unsigned __int8 *a1, char *__dst, int a3, int a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  long long v36 = 0u;
  uint64_t v37 = 0;
  uint64_t v38 = -1;
  uint64_t v39 = 0;
  long long v40 = xmmword_222A2F460;
  uint64_t v41 = 3;
  if (a4)
  {
    uint64_t v5 = (unsigned __int16 *)&a1[a3];
    uint64_t v6 = &__dst[a4];
    uint64_t v7 = v6 - 12;
    unsigned int v8 = v6 - 8;
    size_t v9 = a1;
    int v10 = __dst;
    while (1)
    {
      unsigned int v12 = *v9++;
      char v11 = v12;
      size_t v13 = (unint64_t)v12 >> 4;
      if (v13 == 15)
      {
        size_t v13 = 15;
        do
        {
          unsigned int v15 = *v9++;
          unsigned int v14 = v15;
          v13 += v15;
        }
        while (v9 < (unsigned __int8 *)v5 - 15 && v14 == 255);
        if ((v13 & 0x8000000000000000) != 0) {
          return (~v9 + a1);
        }
      }
      uint64_t v16 = &v10[v13];
      uint64_t v17 = (unsigned __int16 *)&v9[v13];
      if (&v10[v13] > v7 || v17 > v5 - 4)
      {
        if (v17 == v5 && v16 <= v6)
        {
          memcpy(v10, v9, v13);
          return (v16 - __dst);
        }
        return (~v9 + a1);
      }
      do
      {
        uint64_t v19 = *(void *)v9;
        v9 += 8;
        *(void *)int v10 = v19;
        v10 += 8;
      }
      while (v10 < v16);
      size_t v9 = (unsigned __int8 *)(v17 + 1);
      uint64_t v20 = v11 & 0xF;
      if ((v11 & 0xF) == 0xF)
      {
        uint64_t v20 = 15;
        while (v9 <= (unsigned __int8 *)v5 - 5)
        {
          unsigned int v21 = *v9++;
          v20 += v21;
          if (v21 != 255)
          {
            if (v20 < 0) {
              return (~v9 + a1);
            }
            goto LABEL_18;
          }
        }
        return (~v9 + a1);
      }
LABEL_18:
      unsigned int v22 = &v16[-*v17];
      unint64_t v23 = *v17;
      if (v23 <= 7)
      {
        uint64_t v28 = *((void *)&v36 + v23);
        char *v16 = *v22;
        v16[1] = v22[1];
        v16[2] = v22[2];
        v16[3] = v22[3];
        unsigned int v29 = &v22[qword_222A2F470[v23]];
        *((_DWORD *)v16 + 1) = *(_DWORD *)v29;
        unsigned int v24 = &v29[-v28];
      }
      else
      {
        uint64_t v25 = *(void *)v22;
        unsigned int v24 = v22 + 8;
        *(void *)uint64_t v16 = v25;
      }
      int v10 = &v16[v20 + 4];
      uint64_t v26 = v16 + 8;
      if (v10 > v7)
      {
        if (v10 > v6 - 5) {
          return (~v9 + a1);
        }
        if (v26 < v8)
        {
          size_t v30 = v16 + 8;
          char v31 = (uint64_t *)v24;
          do
          {
            uint64_t v32 = *v31++;
            *(void *)size_t v30 = v32;
            v30 += 8;
          }
          while (v30 < v8);
          v24 += v8 - v26;
          uint64_t v26 = v6 - 8;
        }
        while (v26 < v10)
        {
          char v33 = *v24++;
          *v26++ = v33;
        }
      }
      else
      {
        do
        {
          uint64_t v27 = *(void *)v24;
          v24 += 8;
          *(void *)uint64_t v26 = v27;
          v26 += 8;
        }
        while (v26 < v10);
      }
    }
  }
  else if (a3 == 1)
  {
    if (*a1) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
}

uint64_t LZ4_count(unint64_t a1, _DWORD *a2, unint64_t a3)
{
  uint64_t v3 = (_DWORD *)a1;
  if (a3 - 7 <= a1)
  {
LABEL_4:
    if ((unint64_t)v3 < a3 - 3 && *a2 == *v3)
    {
      ++v3;
      ++a2;
    }
    if ((unint64_t)v3 < a3 - 1 && *(unsigned __int16 *)a2 == *(unsigned __int16 *)v3)
    {
      uint64_t v3 = (_DWORD *)((char *)v3 + 2);
      a2 = (_DWORD *)((char *)a2 + 2);
    }
    if ((unint64_t)v3 < a3 && *(unsigned __int8 *)a2 == *(unsigned __int8 *)v3) {
      LODWORD(v3) = v3 + 1;
    }
  }
  else
  {
    while (1)
    {
      unint64_t v4 = *(void *)v3 ^ *(void *)a2;
      if (v4) {
        break;
      }
      v3 += 2;
      a2 += 2;
      if ((unint64_t)v3 >= a3 - 7) {
        goto LABEL_4;
      }
    }
    uint64_t v3 = (_DWORD *)((char *)v3 + (__clz(__rbit64(v4)) >> 3));
  }
  return (v3 - a1);
}

uint64_t LZ4_compress_destSize_generic(uint64_t a1, char *__src, unint64_t a3, int *a4, int a5, int a6)
{
  uint64_t result = 0;
  if (a5 < 1) {
    return result;
  }
  uint64_t v8 = *a4;
  if (v8 > 0x7E000000) {
    return result;
  }
  int v10 = a3;
  if (a6 == 2 && v8 > 0x1000A) {
    return 0;
  }
  unsigned int v57 = &__src[v8];
  unint64_t v58 = a3 + a5;
  unsigned int v12 = __src;
  unint64_t v13 = a3;
  int v60 = a3;
  if (v8 < 0xD) {
    goto LABEL_64;
  }
  char v14 = a6 == 2 ? 13 : 12;
  char v15 = 40 - v14;
  *a4 = 0;
  int v16 = -1 << v14;
  unsigned int v17 = ((unint64_t)(0xCF1BBCDCBBLL * *(void *)__src) >> v15) & ~v16;
  if (a6 == 2)
  {
    *(_WORD *)(a1 + 2 * v17) = 0;
  }
  else if (a6 == 1)
  {
    *(_DWORD *)(a1 + 4 * v17) = 0;
  }
  unsigned int v12 = __src;
  unint64_t v13 = a3;
  if (v8 < 0xE) {
    goto LABEL_64;
  }
  unint64_t v18 = (unint64_t)(v57 - 12);
  unint64_t v63 = v58 - 6;
  int v19 = ~v16;
  uint64_t v20 = __src + 2;
  unint64_t v13 = a3;
  unsigned int v12 = __src;
  int v62 = ~v16;
  char v61 = v15;
LABEL_16:
  unsigned int v21 = v12 + 1;
  uint64_t v22 = *(void *)(v12 + 1);
  unsigned int v23 = 65;
  unsigned int v24 = 1;
  while (1)
  {
    uint64_t v25 = v20;
    uint64_t v26 = ((unint64_t)(0xCF1BBCDCBBLL * v22) >> v15) & v19;
    uint64_t v22 = *(void *)v20;
    if (a6 == 1)
    {
      uint64_t v27 = &__src[*(unsigned int *)(a1 + 4 * v26)];
      *(_DWORD *)(a1 + 4 * v26) = v21 - __src;
      goto LABEL_21;
    }
    uint64_t v27 = &__src[*(unsigned __int16 *)(a1 + 2 * v26)];
    if (a6 == 2) {
      break;
    }
LABEL_21:
    if (v27 + 0xFFFF >= v21) {
      goto LABEL_22;
    }
LABEL_23:
    uint64_t v20 = &v25[v24];
    unsigned int v24 = v23++ >> 6;
    unsigned int v21 = v25;
    if ((unint64_t)v20 > v18) {
      goto LABEL_64;
    }
  }
  *(_WORD *)(a1 + 2 * v26) = (_WORD)v21 - (_WORD)__src;
LABEL_22:
  if (*(_DWORD *)v27 != *(_DWORD *)v21) {
    goto LABEL_23;
  }
  uint64_t v28 = 0;
  int v29 = v21 - v12;
  int v30 = v21 - v12 - 270;
  int v31 = v30;
  do
  {
    unsigned int v32 = v31;
    int v33 = v28;
    uint64_t v34 = &v21[v28];
    size_t v35 = &v27[v28];
    unsigned int v36 = v21 + v28 - v12;
    if (&v21[v28] <= v12 || v35 <= __src) {
      break;
    }
    --v31;
    --v28;
  }
  while (*(v34 - 1) == *(v35 - 1));
  uint64_t v38 = (void *)(v13 + 1);
  if (v13 + 1 + (v29 + v33 + 240) / 0xFFuLL + v36 <= v58 - 11)
  {
    if ((v29 + v33) < 0xF)
    {
      *(unsigned char *)unint64_t v13 = 16 * v36;
    }
    else
    {
      unsigned int v39 = v29 - 15 + v33;
      *(unsigned char *)unint64_t v13 = -16;
      if (v39 > 0xFE)
      {
        unsigned int v55 = v33 + v30;
        int v56 = v30 + v33;
        memset(v38, 255, (v30 + v33) / 0xFFu + 1);
        unsigned int v39 = v56 - 255 * (v32 / 0xFF);
        uint64_t v38 = (void *)(v13 + v55 / 0xFFuLL + 2);
      }
      *(unsigned char *)uint64_t v38 = v39;
      uint64_t v38 = (void *)((char *)v38 + 1);
    }
    long long v40 = (_WORD *)((char *)v38 + v36);
    do
    {
      uint64_t v41 = *(void *)v12;
      v12 += 8;
      *v38++ = v41;
    }
    while (v38 < (void *)v40);
    unsigned int v12 = v34;
    while (1)
    {
      uint64_t v42 = (unsigned char *)v13;
      *long long v40 = (_WORD)v12 - (_WORD)v35;
      unint64_t v13 = (unint64_t)(v40 + 1);
      unint64_t v43 = (unint64_t)(v12 + 4);
      unsigned int v44 = LZ4_count(v43, (_DWORD *)v35 + 1, (unint64_t)(v57 - 5));
      unint64_t v45 = (unint64_t)((unint64_t)v40
                             + ((((unint64_t)v44 + 240) * (unsigned __int128)0x101010101010102uLL) >> 64)
                             + 2) <= v63
          ? v44
          : 255 * (v63 - v13) + 14;
      unint64_t v46 = v45 - 15;
      if (v45 < 0xF)
      {
        *v42 += v45;
        unint64_t v18 = (unint64_t)(v57 - 12);
        int v19 = v62;
      }
      else
      {
        *v42 += 15;
        if (v46 >= 0xFF)
        {
          memset(v40 + 1, 255, (v45 - 270) / 0xFF + 1);
          char v15 = v61;
          LOBYTE(v46) = (v45 - 270) / 0xFF + v45 - 14;
          unint64_t v13 = (unint64_t)v40 + (v45 - 270) / 0xFF + 3;
        }
        unint64_t v18 = (unint64_t)(v57 - 12);
        int v19 = v62;
        *(unsigned char *)v13++ = v46;
      }
      unsigned int v12 = (char *)(v43 + v45);
      if ((unint64_t)v12 > v18 || v13 > v58 - 12) {
        break;
      }
      int v48 = v12 - 2;
      unsigned int v49 = ((unint64_t)(0xCF1BBCDCBBLL * *(void *)(v12 - 2)) >> v15) & v19;
      if (a6 == 1)
      {
        *(_DWORD *)(a1 + 4 * v49) = v48 - __src;
        unsigned int v51 = ((unint64_t)(0xCF1BBCDCBBLL * *(void *)v12) >> v15) & v19;
        size_t v35 = &__src[*(unsigned int *)(a1 + 4 * v51)];
        *(_DWORD *)(a1 + 4 * v51) = v12 - __src;
      }
      else if (a6 == 2)
      {
        *(_WORD *)(a1 + 2 * v49) = v48 - (_WORD)__src;
        unsigned int v50 = ((unint64_t)(0xCF1BBCDCBBLL * *(void *)v12) >> v15) & v19;
        size_t v35 = &__src[*(unsigned __int16 *)(a1 + 2 * v50)];
        *(_WORD *)(a1 + 2 * v50) = (_WORD)v12 - (_WORD)__src;
      }
      else
      {
        size_t v35 = &__src[*(unsigned __int16 *)(a1
                                         + 2
                                         * (((unint64_t)(0xCF1BBCDCBBLL * *(void *)v12) >> v15) & v19))];
      }
      if (v35 + 0xFFFF < v12 || *(_DWORD *)v35 != *(_DWORD *)v12)
      {
        uint64_t v20 = v12 + 2;
        int v10 = v60;
        if ((unint64_t)(v12 + 2) <= v18) {
          goto LABEL_16;
        }
        goto LABEL_64;
      }
      *(unsigned char *)unint64_t v13 = 0;
      long long v40 = (_WORD *)(v13 + 1);
    }
  }
  int v10 = v60;
LABEL_64:
  size_t v52 = v57 - v12;
  unsigned int v53 = (unsigned char *)(v13 + 1);
  if (v13 + 1 + (v57 - v12 + 240) / 0xFFuLL + v57 - v12 > v58) {
    size_t v52 = ~v13 + v58 - (~v13 + v58 + 240) / 0xFF;
  }
  unint64_t v54 = v52 - 15;
  if (v52 < 0xF)
  {
    *(unsigned char *)unint64_t v13 = 16 * v52;
  }
  else
  {
    *(unsigned char *)unint64_t v13 = -16;
    if (v54 >= 0xFF)
    {
      memset(v53, 255, (v52 - 270) / 0xFF + 1);
      unint64_t v54 = (v52 - 270) % 0xFF;
      int v10 = v60;
      unsigned int v53 = (unsigned char *)(v13 + (v52 - 270) / 0xFF + 2);
    }
    *unsigned int v53 = v54;
    unint64_t v13 = (unint64_t)v53;
  }
  memcpy((void *)(v13 + 1), v12, v52);
  *a4 = v12 + v52 - __src;
  return (v13 + 1 + v52 - v10);
}

void sub_222A0E324(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
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

void sub_222A0E808(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_222A0EE30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222A0F04C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222A0F200(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222A10960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222A10B70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222A117F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222A118EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222A136F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_222A13890(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_222A13D94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_222A144E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_222A1479C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222A14948(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222A14D84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_222A15078(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222A15238(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222A1599C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222A15C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222A16220(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_222A166E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_222A16854(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222A16E74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_222A16FE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222A1778C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_222A17BE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_222A17D54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222A18368(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_222A184D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222A18B00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_222A19BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222A19F38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_222A1A400(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1, uint64_t a2)
{
  return *(void *)a2;
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_13(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2114;
  *(void *)(a3 + 24) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1)
{
  return *(void *)a1;
}

void OUTLINED_FUNCTION_18(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_222A1C324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_222A1CB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PizBufGenerateRaw(void *a1, uint64_t a2)
{
  id v3 = a1;
  initialize();
  uint64_t v4 = generate((uint64_t)v3, a2, 0);
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v5 length:v4 freeWhenDone:1];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void initialize()
{
  if (initialized == 1)
  {
    __dmb(0xFu);
  }
  else
  {
    stringType = CFStringGetTypeID();
    dataType = CFDataGetTypeID();
    numberType = CFNumberGetTypeID();
    BOOLType = CFBooleanGetTypeID();
    dateType = CFDateGetTypeID();
    dictType = CFDictionaryGetTypeID();
    arrayType = CFArrayGetTypeID();
    CFSetGetTypeID();
    CFNullGetTypeID();
    CFUUIDGetTypeID();
    CFURLGetTypeID();
    int valuePtr = -1;
    do
    {
      CFNumberRef v0 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      int v1 = valuePtr;
      int v2 = valuePtr + 1;
      numbers[v2] = v0;
      int valuePtr = v2;
    }
    while (v1 < 8);
    __dmb(0xFu);
    initialized = 1;
  }
}

uint64_t generate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)MEMORY[0x270FA5388](a1, a2, a3);
  unsigned int v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = v3;
  memset(v48, 0, 432);
  id v39 = 0;
  uint64_t v40 = 0;
  unint64_t v41 = 0;
  uint64_t v42 = 256;
  unint64_t v43 = v48;
  long long v44 = xmmword_222A2F520;
  memset(v49, 0, 512);
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  unint64_t v45 = v49;
  collectValuesRecursively(&v39, v8);
  if (v39)
  {
    unint64_t v9 = v41;
    if (v41)
    {
      uint64_t v10 = 0;
      unint64_t v11 = 0;
      do
      {
        if ((*(_DWORD *)((char *)v43 + v10) - 38) <= 0x11)
        {
          free(*(void **)((char *)v43 + v10 + 24));
          unint64_t v9 = v41;
        }
        ++v11;
        v10 += 32;
      }
      while (v11 < v9);
    }
    if (v43 != v48) {
      free(v43);
    }
    if (v45 != v49) {
      free(v45);
    }
    if (v7) {
      void *v7 = v39;
    }
    else {
      CFLog();
    }
    CFRelease(v39);
    uint64_t v36 = 0;
  }
  else
  {
    size_t v12 = v40 + v5;
    unint64_t v13 = (char *)malloc_type_malloc(v12, 0x9A5A75E3uLL);
    if (v12 && !v13) {
      generate_cold_1();
    }
    uint64_t v14 = v5;
    uint64_t v38 = &v13[v5];
    if (v41)
    {
      uint64_t v15 = 0;
      for (unint64_t i = 0; i < v41; ++i)
      {
        unsigned int v17 = (char *)v43;
        unint64_t v18 = v38;
        int v19 = v38;
        char *v38 = *(_DWORD *)((char *)v43 + v15);
        uint64_t v20 = v19 + 1;
        uint64_t v38 = v20;
        switch(*(_DWORD *)&v17[v15])
        {
          case 0xC:
          case 0x23:
          case 0x4C:
          case 0x5E:
            v18[1] = *(void *)&v17[v15 + 16];
            unsigned int v23 = v18 + 2;
            goto LABEL_38;
          case 0xD:
          case 0x24:
            *(_WORD *)(v18 + 1) = *(void *)&v17[v15 + 16];
            unsigned int v23 = v18 + 3;
            goto LABEL_38;
          case 0xE:
            *(_DWORD *)(v18 + 1) = *(void *)&v17[v15 + 16];
            goto LABEL_27;
          case 0xF:
          case 0x12:
            *(void *)(v18 + 1) = *(void *)&v17[v15 + 16];
            goto LABEL_37;
          case 0x10:
            uint64_t v25 = &v17[v15];
            *(void *)(v18 + 1) = *((void *)v25 + 2);
            *(void *)(v18 + 9) = *((void *)v25 + 3);
            unsigned int v23 = v18 + 17;
            goto LABEL_38;
          case 0x11:
            float v26 = *(double *)&v17[v15 + 16];
            *(float *)(v18 + 1) = v26;
LABEL_27:
            unsigned int v23 = v18 + 5;
            goto LABEL_38;
          case 0x25:
          case 0x4D:
          case 0x5F:
            uint64_t v24 = *(void *)&v17[v15 + 16];
            *(_WORD *)(v18 + 1) = v24;
            v18[3] = BYTE2(v24);
            v18[4] = BYTE3(v24);
            v18[5] = BYTE4(v24);
            v18[6] = BYTE5(v24);
            unsigned int v23 = v18 + 7;
            goto LABEL_38;
          case 0x26:
          case 0x27:
          case 0x28:
          case 0x29:
          case 0x2A:
          case 0x2B:
          case 0x2C:
          case 0x2D:
          case 0x2E:
          case 0x2F:
          case 0x30:
          case 0x31:
          case 0x32:
          case 0x33:
          case 0x34:
          case 0x35:
            unsigned int v21 = &v17[v15];
            goto LABEL_19;
          case 0x36:
            unsigned int v21 = &v17[v15];
            v18[1] = *(void *)&v17[v15 + 16];
            uint64_t v20 = v18 + 2;
            goto LABEL_19;
          case 0x37:
            unsigned int v21 = &v17[v15];
            uint64_t v27 = *(void *)&v17[v15 + 16];
            *(_WORD *)(v18 + 1) = v27;
            v18[3] = BYTE2(v27);
            v18[4] = BYTE3(v27);
            v18[5] = BYTE4(v27);
            v18[6] = BYTE5(v27);
            uint64_t v20 = v18 + 7;
LABEL_19:
            size_t v22 = *((void *)v21 + 2);
            memcpy(v20, *((const void **)v21 + 3), v22);
            uint64_t v38 = &v20[v22];
            free(*((void **)v21 + 3));
            break;
          case 0x38:
            uint64_t v28 = &v17[v15];
            v18[1] = *((void *)v28 + 2);
            int v29 = v18 + 2;
            goto LABEL_32;
          case 0x39:
            uint64_t v28 = &v17[v15];
            uint64_t v30 = *((void *)v28 + 2);
            *(_WORD *)(v18 + 1) = v30;
            v18[3] = BYTE2(v30);
            v18[4] = BYTE3(v30);
            v18[5] = BYTE4(v30);
            v18[6] = BYTE5(v30);
            int v29 = v18 + 7;
LABEL_32:
            uint64_t v38 = v29;
            writeUnicode16StringContents((void **)&v38, *((const __CFString **)v28 + 1), *((void *)v28 + 2));
            break;
          case 0x3A:
            int v31 = &v17[v15];
            v18[1] = *(void *)&v17[v15 + 16];
            unsigned int v32 = v18 + 2;
            goto LABEL_35;
          case 0x3B:
            int v31 = &v17[v15];
            uint64_t v33 = *(void *)&v17[v15 + 16];
            *(_WORD *)(v18 + 1) = v33;
            v18[3] = BYTE2(v33);
            v18[4] = BYTE3(v33);
            v18[5] = BYTE4(v33);
            v18[6] = BYTE5(v33);
            unsigned int v32 = v18 + 7;
LABEL_35:
            BytePtr = CFDataGetBytePtr(*((CFDataRef *)v31 + 1));
            size_t v35 = *((void *)v31 + 2);
            memcpy(v32, BytePtr, v35);
            unsigned int v23 = &v32[v35];
            goto LABEL_38;
          case 0x60:
            *(double *)(v18 + 1) = MEMORY[0x223CA34B0](*(void *)&v17[v15 + 8]);
LABEL_37:
            unsigned int v23 = v18 + 9;
LABEL_38:
            uint64_t v38 = v23;
            break;
          default:
            break;
        }
        v15 += 32;
      }
    }
    if (v43 != v48) {
      free(v43);
    }
    if (v45 != v49) {
      free(v45);
    }
    uint64_t v36 = v40 + v14;
  }

  return v36;
}

id PizBufGenerate(void *a1, uint64_t a2)
{
  id v3 = a1;
  initialize();
  uint64_t v4 = generate((uint64_t)v3, a2, 1);
  if (v5)
  {
    unsigned char *v5 = 0;
    uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v5 length:v4 freeWhenDone:1];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id PizBufGenerateCompressed(void *a1, uint64_t a2)
{
  id v3 = a1;
  initialize();
  unint64_t v4 = generate((uint64_t)v3, a2, 0);
  uint64_t v6 = v5;
  if (v5)
  {
    unint64_t v7 = v4;
    if (v4 >= 0x7E000001) {
      PizBufGenerateCompressed_cold_5();
    }
    int v8 = LZ4_compressBound(v4);
    BOOL v9 = v8 == -1;
    size_t v10 = v8 + 1;
    unint64_t v11 = malloc_type_malloc(v10, 0x9A5A75E3uLL);
    size_t v12 = v11;
    if (!v9 && !v11) {
      generate_cold_1();
    }
    unsigned int v13 = LZ4_compress_default((uint64_t)v6, (uint64_t)(v11 + 1), v7);
    if ((int)v13 <= 0) {
      PizBufGenerateCompressed_cold_3();
    }
    unsigned int v14 = v13;
    if (v7 <= v13)
    {
      *size_t v12 = 0;
      memcpy(v12 + 1, v6, v7);
      unint64_t v16 = v7 + 1;
    }
    else
    {
      unsigned int v15 = v7 / v13;
      if (v15 >= 0x100) {
        PizBufGenerateCompressed_cold_2();
      }
      if (v15 < 0xF)
      {
        *size_t v12 = v15;
        unint64_t v16 = v13 + 1;
      }
      else
      {
        if ((unint64_t)v13 + 2 >= v10) {
          PizBufGenerateCompressed_cold_1();
        }
        memmove(v12 + 2, v12 + 1, v13);
        *size_t v12 = 15;
        v12[1] = v15;
        unint64_t v16 = v14 + 2;
      }
    }
    free(v6);
    uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v12 length:v16 freeWhenDone:1];
  }

  return v6;
}

CFDataRef PizBufParseRaw(void *a1, void *a2)
{
  id v3 = a1;
  initialize();
  uint64_t v4 = [v3 length];
  id v5 = v3;
  uint64_t v6 = [v5 bytes];

  return parse(v4, v6, a2);
}

CFDataRef parse(uint64_t a1, uint64_t a2, void *a3)
{
  v8[0] = a2;
  v8[1] = a2;
  v8[2] = a2 + a1;
  BOOL v9 = v11;
  memset(v11, 0, 464);
  long long v10 = xmmword_222A2F530;
  id v12 = 0;
  CFDataRef Recursively = parseAndCreateRecursively(v8);
  if ((void)v10)
  {
    uint64_t v5 = v10 - 1;
    do
      CFRelease(*((CFTypeRef *)v9 + v5--));
    while (v5 != -1);
  }
  if (v9 != v11) {
    free(v9);
  }
  if (Recursively)
  {
    if (v12) {
      parse_cold_2();
    }
    CFDataRef v6 = Recursively;
  }
  else
  {
    if (!v12) {
      parse_cold_1();
    }
    setError(a3, v12);
  }

  return Recursively;
}

id PizBufParse(void *a1, void *a2)
{
  id v3 = a1;
  initialize();
  unint64_t v4 = [v3 length];
  id v5 = v3;
  CFDataRef v6 = (unsigned __int8 *)[v5 bytes];
  if (!v4)
  {
    long long v10 = @"Empty input frame";
LABEL_10:
    unint64_t v11 = (void *)CFRetain(v10);
    id v12 = a2;
LABEL_11:
    setError(v12, v11);
    unsigned int v13 = 0;
    goto LABEL_12;
  }
  unint64_t v7 = v6;
  if (frameHeader(v4, v6) >= 0x10)
  {
    long long v10 = @"Unrecognized format version";
    goto LABEL_10;
  }
  if ((frameHeader(v4, v7) & 0xF) != 0)
  {
    if ((frameHeader(v4, v7) & 0xF) != 0)
    {
      unsigned int v8 = frameHeader(v4, v7) & 0xF;
      if (v8 == 15)
      {
        if (v4 <= 1)
        {
          CFStringRef v9 = (const __CFString *)CFRetain(@"Frame header implies second compression ratio byte but the frame size is smaller than 2");
LABEL_28:
          CFStringRef v20 = v9;
          goto LABEL_29;
        }
        unsigned int v8 = v7[1];
        uint64_t v18 = -2;
        uint64_t v19 = 2;
      }
      else
      {
        uint64_t v18 = -1;
        uint64_t v19 = 1;
      }
      unint64_t v21 = v18 + v4;
      if (v18 + v4 >= 0x7E000001)
      {
        CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"Decompression failed because input is too big (max size is %lu, input size is %lu)", 2113929216, v21);
        goto LABEL_28;
      }
      size_t v15 = v21 + v21 * v8;
      if (v15 >= 0x7E000001)
      {
        CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"Decompression failed because projected decompressed frame size is too big (max size is %lu, projected size is %lu)", 2113929216, v15);
        goto LABEL_28;
      }
      size_t v22 = (char *)malloc_type_malloc(v15, 0x9A5A75E3uLL);
      unsigned int v17 = v22;
      if (v21 && !v22) {
        generate_cold_1();
      }
      unsigned int v23 = &v7[v19];
      if (v22) {
        bzero(v22, v15);
      }
      uint64_t v24 = LZ4_decompress_safe(v23, v17, v21, v15);
      if ((v24 & 0x80000000) != 0)
      {
        CFStringRef v20 = CFStringCreateWithFormat(0, 0, @"LZ4 decompression failed with result: %d", v24);
        if (v17) {
          free(v17);
        }
        goto LABEL_29;
      }
    }
    else
    {
      size_t v15 = v4 - 1;
      unint64_t v16 = (char *)malloc_type_malloc(v15, 0x9A5A75E3uLL);
      unsigned int v17 = v16;
      if (v15 && !v16) {
        generate_cold_1();
      }
      memcpy(v16, v7 + 1, v15);
    }
    if (!v17)
    {
      CFStringRef v20 = 0;
LABEL_29:
      id v12 = a2;
      unint64_t v11 = (void *)v20;
      goto LABEL_11;
    }
    unsigned int v13 = parse(v15, (uint64_t)v17, a2);
    free(v17);
  }
  else
  {
    unsigned int v13 = parse(v4 - 1, (uint64_t)(v7 + 1), a2);
  }
LABEL_12:

  return v13;
}

void setError(void *a1, id a2)
{
  if (a1) {
    *a1 = a2;
  }
  else {
    CFLog();
  }

  CFRelease(a2);
}

void collectValuesRecursively(void *a1, const __CFString *a2)
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  CFTypeID v4 = CFGetTypeID(a2);
  if (v4 == numberType)
  {
    keys[0] = 0;
    keys[1] = 0;
    if (CFNumberIsFloatType((CFNumberRef)a2))
    {
      double valuePtr = 0.0;
      CFNumberGetValue((CFNumberRef)a2, kCFNumberFloat64Type, &valuePtr);
      *(double *)&uint64_t v5 = valuePtr;
      int v6 = (int)valuePtr;
      if (*(void *)&valuePtr == COERCE__INT64((double)(int)valuePtr))
      {
        uint64_t v5 = v6;
        uint64_t v7 = 4;
        if ((__int16)v6 == v6)
        {
          uint64_t v7 = 2;
          int v8 = 13;
        }
        else
        {
          int v8 = 14;
        }
        int v9 = v6 + 3;
        if ((v6 - 9) < 0xFFFFFFF6) {
          int v9 = 12;
        }
        if (v6 == (char)v6) {
          uint64_t v10 = (v6 - 9) < 0xFFFFFFF6;
        }
        else {
          uint64_t v10 = v7;
        }
        if (v6 == (char)v6) {
          unsigned int v11 = v9;
        }
        else {
          unsigned int v11 = v8;
        }
      }
      else
      {
        float v25 = valuePtr;
        double v26 = v25;
        if (*(void *)&valuePtr == *(void *)&v26) {
          uint64_t v10 = 4;
        }
        else {
          uint64_t v10 = 8;
        }
        if (*(void *)&valuePtr == *(void *)&v26) {
          unsigned int v11 = 17;
        }
        else {
          unsigned int v11 = 18;
        }
      }
      size_t v22 = 0;
      goto LABEL_163;
    }
    CFNumberGetValue((CFNumberRef)a2, kCFNumberMaxType|kCFNumberSInt8Type, keys);
    size_t v22 = (UInt8 *)keys[0];
    uint64_t v5 = (uint64_t)keys[1];
    if (keys[0] == (void *)((uint64_t)keys[1] >> 63))
    {
      if (keys[1] == (void *)SLOBYTE(keys[1]))
      {
        size_t v22 = 0;
        unsigned int v23 = (LODWORD(keys[1]) << 24) - 150994944;
        BOOL v24 = v23 >= 0xF5000001;
        uint64_t v10 = v23 < 0xF5000001;
        unsigned int v11 = LODWORD(keys[1]) + 3;
        if (!v24) {
          unsigned int v11 = 12;
        }
        goto LABEL_163;
      }
      if (keys[1] == (void *)SLODWORD(keys[1]))
      {
        size_t v22 = 0;
        unsigned int v11 = 14;
LABEL_171:
        uint64_t v10 = 4;
        goto LABEL_163;
      }
      if (keys[1] == (void *)(uint64_t)(float)(uint64_t)keys[1])
      {
        size_t v22 = 0;
        *(double *)&uint64_t v5 = (float)(uint64_t)keys[1];
        unsigned int v11 = 17;
        goto LABEL_171;
      }
      size_t v22 = 0;
      unsigned int v11 = 15;
LABEL_185:
      uint64_t v10 = 8;
      goto LABEL_163;
    }
    uint64_t v10 = 16;
    unsigned int v11 = 16;
LABEL_163:
    keys[0] = (void *)v11;
    keys[1] = (void *)a2;
    *(void *)&long long v95 = v5;
    *((void *)&v95 + 1) = v22;
    appendValueGenerationData((uint64_t)a1, (uint64_t)keys, v10);
    return;
  }
  if (v4 == stringType)
  {
    keys[0] = 0;
    uint64_t v12 = ((unint64_t)a2 >> 8)
        + ((unint64_t)a2 >> 21)
        - ((((unint64_t)a2 >> 8) + ((unint64_t)a2 >> 21)) >> 32)
        + 8 * ((((unint64_t)a2 >> 8) + ((unint64_t)a2 >> 21)) >> 32);
    unint64_t v14 = a1[6];
    unsigned int v13 = (void *)a1[7];
    unint64_t v15 = (v14 - 1) & v12;
    uint64_t v16 = 2 * v15;
    uint64_t v17 = -1;
    while (v15 != v17)
    {
      CFStringRef v18 = (const __CFString *)v13[v16];
      ++v17;
      v16 -= 2;
      if (v18) {
        BOOL v19 = v18 == a2;
      }
      else {
        BOOL v19 = 1;
      }
      if (v19)
      {
        unint64_t v20 = v15 - v17;
        goto LABEL_45;
      }
    }
    uint64_t v27 = (const __CFString **)&v13[2 * v14 - 2];
    unint64_t v20 = a1[6];
    do
    {
      if (v20 <= v15) {
        collectValuesRecursively_cold_3();
      }
      --v20;
      CFStringRef v28 = *v27;
      v27 -= 2;
      CFStringRef v18 = v28;
      if (v28) {
        BOOL v29 = v18 == a2;
      }
      else {
        BOOL v29 = 1;
      }
    }
    while (!v29);
LABEL_45:
    if (v18)
    {
      unint64_t v30 = v13[2 * v20 + 1];
      if (v30 != -1)
      {
        uint64_t v31 = 1;
        uint64_t v32 = 6;
        if (v30 >= 0xFFFF)
        {
          int v33 = 37;
        }
        else
        {
          uint64_t v32 = 2;
          int v33 = 36;
        }
        if (v30 < 0xFF)
        {
          int v34 = 35;
        }
        else
        {
          uint64_t v31 = v32;
          int v34 = v33;
        }
        if (v30 <= 0xE) {
          uint64_t v10 = 0;
        }
        else {
          uint64_t v10 = v31;
        }
        size_t v22 = 0;
        if (v30 <= 0xE) {
          *(double *)&uint64_t v5 = 0.0;
        }
        else {
          uint64_t v5 = v30;
        }
        if (v30 <= 0xE) {
          unsigned int v11 = v30 + 19;
        }
        else {
          unsigned int v11 = v34;
        }
        goto LABEL_163;
      }
    }
    else
    {
      unint64_t v36 = a1[5];
      if (v36 >= v14 >> 1)
      {
        a1[6] = 2 * v14;
        a1[7] = malloc_type_calloc(0x10uLL, 2 * v14, 0xFF895670uLL);
        while (v14)
        {
          --v14;
          int v48 = &v13[2 * v14];
          unint64_t v49 = *v48;
          if (*v48)
          {
            unint64_t v50 = a1[6];
            uint64_t v51 = a1[7];
            unint64_t v52 = (v50 - 1) & ((v49 >> 8)
                             + (v49 >> 21)
                             - (((v49 >> 8) + (v49 >> 21)) >> 32)
                             + 8 * (((v49 >> 8) + (v49 >> 21)) >> 32));
            unsigned int v53 = (uint64_t *)(v51 + 16 * v52);
            uint64_t v54 = -1;
            while (v52 != v54)
            {
              uint64_t v56 = *v53;
              v53 -= 2;
              uint64_t v55 = v56;
              ++v54;
              if (v56) {
                BOOL v57 = v55 == v49;
              }
              else {
                BOOL v57 = 1;
              }
              if (v57)
              {
                unint64_t v50 = v52 - v54;
                goto LABEL_106;
              }
            }
            unint64_t v58 = (uint64_t *)(v51 + 16 * v50 - 16);
            do
            {
              if (v50 <= v52) {
                collectValuesRecursively_cold_3();
              }
              --v50;
              uint64_t v59 = *v58;
              v58 -= 2;
              uint64_t v55 = v59;
              if (v59) {
                BOOL v60 = v55 == v49;
              }
              else {
                BOOL v60 = 1;
              }
            }
            while (!v60);
LABEL_106:
            if (v55) {
              collectValuesRecursively_cold_4();
            }
            *(_OWORD *)(v51 + 16 * v50) = *(_OWORD *)v48;
          }
        }
        if (v13 != a1 + 1034) {
          free(v13);
        }
        unint64_t v61 = a1[6];
        uint64_t v62 = a1[7];
        unint64_t v63 = (v61 + 0x3FFFFFFFFFFFFFFLL) & v12;
        unsigned int v64 = (const __CFString **)(v62 + 16 * v63);
        uint64_t v65 = -1;
        while (v63 != v65)
        {
          CFStringRef v67 = *v64;
          v64 -= 2;
          CFStringRef v66 = v67;
          ++v65;
          if (v67) {
            BOOL v68 = v66 == a2;
          }
          else {
            BOOL v68 = 1;
          }
          if (v68)
          {
            unint64_t v61 = v63 - v65;
            goto LABEL_142;
          }
        }
        unsigned int v78 = (const __CFString **)(v62 + 16 * v61 - 16);
        do
        {
          if (v61 <= v63) {
            collectValuesRecursively_cold_3();
          }
          --v61;
          CFStringRef v79 = *v78;
          v78 -= 2;
          CFStringRef v66 = v79;
          if (v79) {
            BOOL v80 = v66 == a2;
          }
          else {
            BOOL v80 = 1;
          }
        }
        while (!v80);
LABEL_142:
        if (v66) {
          collectValuesRecursively_cold_2();
        }
        uint64_t v37 = (void *)(v62 + 16 * v61);
        unint64_t v36 = a1[5];
      }
      else
      {
        uint64_t v37 = &v13[2 * v20];
      }
      *uint64_t v37 = a2;
      a1[5] = v36 + 1;
      v37[1] = v36;
    }
    *(double *)&uint64_t v5 = COERCE_DOUBLE(CFStringGetLength(a2));
    int64_t v81 = (UInt8 *)malloc_type_malloc(v5, 0x9A5A75E3uLL);
    size_t v22 = v81;
    if (*(double *)&v5 != 0.0 && !v81) {
      generate_cold_1();
    }
    v113.location = 0;
    v113.length = v5;
    if (CFStringGetBytes(a2, v113, 0x600u, 0, 0, v81, v5, (CFIndex *)keys) == v5)
    {
      uint64_t v5 = (uint64_t)keys[0];
      uint64_t v82 = (char *)keys[0] + 6;
      if (keys[0] > (void *)0xFF)
      {
        int v83 = 55;
      }
      else
      {
        uint64_t v82 = (char *)keys[0] + 1;
        int v83 = 54;
      }
      if ((uint64_t)keys[0] <= 15) {
        uint64_t v10 = (uint64_t)keys[0];
      }
      else {
        uint64_t v10 = (uint64_t)v82;
      }
      if ((uint64_t)keys[0] <= 15) {
        unsigned int v11 = LODWORD(keys[0]) + 38;
      }
      else {
        unsigned int v11 = v83;
      }
    }
    else
    {
      free(v22);
      if (v5 <= 255) {
        uint64_t v10 = (2 * v5) | 1;
      }
      else {
        uint64_t v10 = 2 * v5 + 6;
      }
      size_t v22 = 0;
      if (v5 <= 255) {
        unsigned int v11 = 56;
      }
      else {
        unsigned int v11 = 57;
      }
    }
    goto LABEL_163;
  }
  if (v4 == BOOLType)
  {
    int Value = CFBooleanGetValue((CFBooleanRef)a2);
    uint64_t v10 = 0;
    size_t v22 = 0;
    *(double *)&uint64_t v5 = 0.0;
    unsigned int v11 = Value != 0;
    goto LABEL_163;
  }
  if (v4 == dataType)
  {
    unint64_t Length = CFDataGetLength((CFDataRef)a2);
    uint64_t v5 = Length;
    size_t v22 = 0;
    if (Length < 0x100) {
      uint64_t v10 = Length + 1;
    }
    else {
      uint64_t v10 = Length + 6;
    }
    if (Length < 0x100) {
      unsigned int v11 = 58;
    }
    else {
      unsigned int v11 = 59;
    }
    goto LABEL_163;
  }
  if (v4 == dictType)
  {
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    *(_OWORD *)keys = 0u;
    long long v95 = 0u;
    uint64_t v38 = a1[8];
    if (v38)
    {
      id v39 = (const __CFString **)a1[8];
      while (*v39 != a2)
      {
        id v39 = (const __CFString **)v39[1];
        if (!v39) {
          goto LABEL_77;
        }
      }
      if (!*a1)
      {
        uint64_t v85 = @"Payloads cannot contain recursive dictionaries";
LABEL_194:
        *a1 = CFRetain(v85);
        return;
      }
      return;
    }
LABEL_77:
    CFStringRef v92 = a2;
    uint64_t v93 = v38;
    a1[8] = &v92;
    unint64_t Count = CFDictionaryGetCount((CFDictionaryRef)a2);
    unint64_t v41 = Count;
    unsigned int v42 = Count + 78;
    uint64_t v43 = 6;
    if (Count >= 0x100)
    {
      int v44 = 95;
    }
    else
    {
      uint64_t v43 = 1;
      int v44 = 94;
    }
    if (Count >= 0x10) {
      unsigned int v42 = v44;
    }
    *(void *)&double valuePtr = v42;
    if (Count >= 0x10) {
      uint64_t v45 = v43;
    }
    else {
      uint64_t v45 = 0;
    }
    CFStringRef v89 = a2;
    unint64_t v90 = Count;
    uint64_t v91 = 0;
    appendValueGenerationData((uint64_t)a1, (uint64_t)&valuePtr, v45);
    uint64_t v46 = 2 * v41;
    if (2 * v41 >= 0x21)
    {
      uint64_t v47 = (const void **)mallocOrAbort(16 * v41);
      CFDictionaryGetKeysAndValues((CFDictionaryRef)a2, v47, &v47[v41]);
    }
    else
    {
      uint64_t v47 = (const void **)keys;
      CFDictionaryGetKeysAndValues((CFDictionaryRef)a2, (const void **)keys, (const void **)&keys[v41]);
      if (!v46)
      {
LABEL_177:
        a1[8] = v93;
        return;
      }
    }
    uint64_t v84 = 0;
    do
      collectValuesRecursively(a1, v47[v84++]);
    while (v46 != v84);
    if (v47 != (const void **)keys) {
      free(v47);
    }
    goto LABEL_177;
  }
  if (v4 != arrayType)
  {
    if (v4 == dateType)
    {
      size_t v22 = 0;
      *(double *)&uint64_t v5 = 0.0;
      unsigned int v11 = 96;
      goto LABEL_185;
    }
    if (!*a1)
    {
      CFStringRef v86 = CFCopyTypeIDDescription(v4);
      *a1 = CFStringCreateWithFormat(0, 0, @"Payloads cannot contain objects of type '%@'", v86);
      CFRelease(v86);
    }
    return;
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  *(_OWORD *)keys = 0u;
  long long v95 = 0u;
  uint64_t v69 = a1[9];
  if (!v69)
  {
LABEL_124:
    CFStringRef v92 = a2;
    uint64_t v93 = v69;
    a1[9] = &v92;
    unint64_t v71 = CFArrayGetCount((CFArrayRef)a2);
    unint64_t v72 = v71;
    unsigned int v73 = v71 + 60;
    uint64_t v74 = 6;
    if (v71 >= 0x100)
    {
      int v75 = 77;
    }
    else
    {
      uint64_t v74 = 1;
      int v75 = 76;
    }
    if (v71 >= 0x10) {
      unsigned int v73 = v75;
    }
    *(void *)&double valuePtr = v73;
    if (v71 >= 0x10) {
      uint64_t v76 = v74;
    }
    else {
      uint64_t v76 = 0;
    }
    CFStringRef v89 = a2;
    unint64_t v90 = v71;
    uint64_t v91 = 0;
    appendValueGenerationData((uint64_t)a1, (uint64_t)&valuePtr, v76);
    if (v72 >= 0x21)
    {
      uint64_t v77 = (const void **)mallocOrAbort(8 * v72);
      v114.location = 0;
      v114.length = v72;
      CFArrayGetValues((CFArrayRef)a2, v114, v77);
    }
    else
    {
      uint64_t v77 = (const void **)keys;
      v112.location = 0;
      v112.length = v72;
      CFArrayGetValues((CFArrayRef)a2, v112, (const void **)keys);
      if (!v72)
      {
LABEL_191:
        a1[9] = v93;
        return;
      }
    }
    for (uint64_t i = 0; i != v72; ++i)
      collectValuesRecursively(a1, v77[i]);
    if (v77 != (const void **)keys) {
      free(v77);
    }
    goto LABEL_191;
  }
  unsigned int v70 = (const __CFString **)a1[9];
  while (*v70 != a2)
  {
    unsigned int v70 = (const __CFString **)v70[1];
    if (!v70) {
      goto LABEL_124;
    }
  }
  if (!*a1)
  {
    uint64_t v85 = @"Payloads cannot contain recursive arrays";
    goto LABEL_194;
  }
}

void *mallocOrAbort(size_t a1)
{
  uint64_t result = malloc_type_malloc(a1, 0x9A5A75E3uLL);
  if (a1)
  {
    if (!result) {
      generate_cold_1();
    }
  }
  return result;
}

void writeUnicode16StringContents(void **a1, const __CFString *a2, CFIndex a3)
{
  size_t v6 = 2 * a3;
  uint64_t v7 = (UniChar *)malloc_type_malloc(2 * a3, 0x9A5A75E3uLL);
  int v8 = v7;
  if (v6 && !v7) {
    generate_cold_1();
  }
  v10.location = 0;
  v10.length = a3;
  CFStringGetCharacters(a2, v10, v7);
  memcpy(*a1, v8, v6);
  *a1 = (char *)*a1 + v6;

  free(v8);
}

__n128 appendValueGenerationData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) += a3 + 1;
  if (v5 == *(void *)(a1 + 24))
  {
    size_t v6 = *(const void **)(a1 + 32);
    uint64_t v7 = v5 << 6;
    if (v6 == (const void *)(a1 + 80))
    {
      CFRange v10 = malloc_type_malloc(v5 << 6, 0x9A5A75E3uLL);
      if (v7) {
        BOOL v11 = v10 == 0;
      }
      else {
        BOOL v11 = 0;
      }
      if (v11) {
        generate_cold_1();
      }
      *(void *)(a1 + 32) = v10;
      memcpy(v10, v6, 32 * *(void *)(a1 + 16));
    }
    else
    {
      int v8 = malloc_type_realloc(*(void **)(a1 + 32), v5 << 6, 0x6089071BuLL);
      if (v7) {
        BOOL v9 = v8 == 0;
      }
      else {
        BOOL v9 = 0;
      }
      if (v9) {
        appendValueGenerationData_cold_2();
      }
      *(void *)(a1 + 32) = v8;
    }
    *(void *)(a1 + 24) = 2 * v5;
    uint64_t v5 = *(void *)(a1 + 16);
  }
  uint64_t v12 = *(void *)(a1 + 32);
  *(void *)(a1 + 16) = v5 + 1;
  unsigned int v13 = (_OWORD *)(v12 + 32 * v5);
  __n128 result = *(__n128 *)a2;
  long long v15 = *(_OWORD *)(a2 + 16);
  *unsigned int v13 = *(_OWORD *)a2;
  v13[1] = v15;
  return result;
}

CFDataRef parseAndCreateRecursively(void *a1)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  int v2 = (unsigned __int8 *)a1[1];
  id v3 = (unsigned __int8 *)a1[2];
  if (v3 == v2)
  {
LABEL_73:
    uint64_t v43 = &v3[-*a1];
    uint64_t v44 = 1;
LABEL_74:
    CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"Out of bounds: at offset %lu, trying to read %lu bytes", v43, v44);
LABEL_75:
    uint64_t v7 = 0;
    a1[262] = v12;
    return (CFDataRef)v7;
  }
  else
  {
    CFTypeID v4 = v2 + 1;
    a1[1] = v2 + 1;
    int v5 = *v2;
    switch(*v2)
    {
      case 0u:
        unsigned int v13 = (const void **)MEMORY[0x263EFFB38];
        goto LABEL_20;
      case 1u:
        unsigned int v13 = (const void **)MEMORY[0x263EFFB40];
LABEL_20:
        BOOL v11 = *v13;
        goto LABEL_13;
      case 2u:
      case 3u:
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
      case 9u:
      case 0xAu:
      case 0xBu:
        BOOL v11 = (const void *)numbers[v5 - 2];
LABEL_13:
        return (CFDataRef)CFRetain(v11);
      case 0xCu:
        if (v3 == v4) {
          goto LABEL_73;
        }
        a1[1] = v2 + 2;
        LOBYTE(valuePtr) = v2[1];
        CFNumberType v14 = kCFNumberSInt8Type;
        return CFNumberCreate(0, v14, &valuePtr);
      case 0xDu:
        if ((unint64_t)(v3 - v4) <= 1) {
          goto LABEL_89;
        }
        long long v15 = v2 + 3;
        __int16 v16 = *(_WORD *)(v2 + 1);
        a1[1] = v15;
        LOWORD(valuePtr) = v16;
        CFNumberType v14 = kCFNumberSInt16Type;
        return CFNumberCreate(0, v14, &valuePtr);
      case 0xEu:
        if ((unint64_t)(v3 - v4) <= 3) {
          goto LABEL_88;
        }
        int v17 = *(_DWORD *)(v2 + 1);
        a1[1] = v2 + 5;
        LODWORD(valuePtr) = v17;
        CFNumberType v14 = kCFNumberSInt32Type;
        return CFNumberCreate(0, v14, &valuePtr);
      case 0xFu:
        if ((unint64_t)(v3 - v4) <= 7) {
          goto LABEL_87;
        }
        uint64_t v18 = *(void *)(v2 + 1);
        a1[1] = v2 + 9;
        *(void *)&long long valuePtr = v18;
        CFNumberType v14 = kCFNumberSInt64Type;
        return CFNumberCreate(0, v14, &valuePtr);
      case 0x10u:
        if ((unint64_t)(v3 - v4) > 0xF)
        {
          uint64_t v19 = *(void *)(v2 + 1);
          a1[1] = v2 + 9;
          *((void *)&valuePtr + 1) = v19;
          uint64_t v20 = *(void *)(v2 + 9);
          a1[1] = v2 + 17;
          *(void *)&long long valuePtr = v20;
          CFNumberType v14 = kCFNumberMaxType|kCFNumberSInt8Type;
          return CFNumberCreate(0, v14, &valuePtr);
        }
        uint64_t v43 = &v4[-*a1];
        uint64_t v44 = 16;
        goto LABEL_74;
      case 0x11u:
        if ((unint64_t)(v3 - v4) <= 3)
        {
LABEL_88:
          uint64_t v43 = &v4[-*a1];
          uint64_t v44 = 4;
          goto LABEL_74;
        }
        int v21 = *(_DWORD *)(v2 + 1);
        a1[1] = v2 + 5;
        LODWORD(valuePtr) = v21;
        CFNumberType v14 = kCFNumberFloat32Type;
        return CFNumberCreate(0, v14, &valuePtr);
      case 0x12u:
        if ((unint64_t)(v3 - v4) <= 7) {
          goto LABEL_87;
        }
        uint64_t v22 = *(void *)(v2 + 1);
        a1[1] = v2 + 9;
        *(void *)&long long valuePtr = v22;
        CFNumberType v14 = kCFNumberDoubleType;
        return CFNumberCreate(0, v14, &valuePtr);
      case 0x13u:
      case 0x14u:
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
        unint64_t v6 = (v5 - 19);
        if (a1[4] > v6)
        {
          uint64_t v7 = *(const void **)(a1[3] + 8 * v6);
          CFRetain(v7);
          return (CFDataRef)v7;
        }
        CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"Invalid string index: %lu", v6);
        goto LABEL_75;
      case 0x23u:
        if (v3 == v4) {
          goto LABEL_73;
        }
        a1[1] = v2 + 2;
        unint64_t v23 = v2[1];
        goto LABEL_43;
      case 0x24u:
        if ((unint64_t)(v3 - v4) <= 1)
        {
LABEL_89:
          uint64_t v43 = &v4[-*a1];
          uint64_t v44 = 2;
          goto LABEL_74;
        }
        unint64_t v23 = *(unsigned __int16 *)(v2 + 1);
        a1[1] = v2 + 3;
LABEL_43:
        return (CFDataRef)getParsedString(a1, v23);
      case 0x25u:
        if ((unint64_t)(v3 - v4) <= 5) {
          goto LABEL_82;
        }
        uint64_t v24 = *(unsigned int *)(v2 + 1);
        a1[1] = v2 + 5;
        uint64_t v25 = v2[5];
        uint64_t v26 = v2[6];
        a1[1] = v2 + 7;
        unint64_t v23 = v24 | (v25 << 32) | (v26 << 40);
        goto LABEL_43;
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
      case 0x32u:
      case 0x33u:
      case 0x34u:
      case 0x35u:
        unint64_t v8 = (v5 - 38);
        goto LABEL_6;
      case 0x36u:
        if (v3 == v4) {
          goto LABEL_73;
        }
        a1[1] = v2 + 2;
        unint64_t v8 = v2[1];
        goto LABEL_6;
      case 0x37u:
        if ((unint64_t)(v3 - v4) <= 5) {
          goto LABEL_82;
        }
        uint64_t v27 = *(unsigned int *)(v2 + 1);
        a1[1] = v2 + 5;
        uint64_t v28 = v2[5];
        uint64_t v29 = v2[6];
        a1[1] = v2 + 7;
        unint64_t v8 = v27 | (v28 << 32) | (v29 << 40);
LABEL_6:
        return (CFDataRef)readASCIIString(a1, v8);
      case 0x38u:
        if (v3 == v4) {
          goto LABEL_73;
        }
        a1[1] = v2 + 2;
        CFIndex v30 = v2[1];
        goto LABEL_54;
      case 0x39u:
        if ((unint64_t)(v3 - v4) <= 5) {
          goto LABEL_82;
        }
        uint64_t v31 = *(unsigned int *)(v2 + 1);
        a1[1] = v2 + 5;
        uint64_t v32 = v2[5];
        uint64_t v33 = v2[6];
        a1[1] = v2 + 7;
        CFIndex v30 = v31 | (v32 << 32) | (v33 << 40);
LABEL_54:
        return (CFDataRef)readUnicode16String(a1, v30);
      case 0x3Au:
        if (v3 == v4) {
          goto LABEL_73;
        }
        a1[1] = v2 + 2;
        unint64_t v34 = v2[1];
        goto LABEL_61;
      case 0x3Bu:
        if ((unint64_t)(v3 - v4) <= 5) {
          goto LABEL_82;
        }
        uint64_t v35 = *(unsigned int *)(v2 + 1);
        a1[1] = v2 + 5;
        uint64_t v36 = v2[5];
        uint64_t v37 = v2[6];
        a1[1] = v2 + 7;
        unint64_t v34 = v35 | (v36 << 32) | (v37 << 40);
LABEL_61:
        return readData(a1, v34);
      case 0x3Cu:
      case 0x3Du:
      case 0x3Eu:
      case 0x3Fu:
      case 0x40u:
      case 0x41u:
      case 0x42u:
      case 0x43u:
      case 0x44u:
      case 0x45u:
      case 0x46u:
      case 0x47u:
      case 0x48u:
      case 0x49u:
      case 0x4Au:
      case 0x4Bu:
        *(void *)&long long v56 = 0;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long valuePtr = 0u;
        return parseAndCreateArrayWithBuffer((int)a1, (const void **)&valuePtr, (v5 - 60));
      case 0x4Cu:
        if (v3 == v4) {
          goto LABEL_73;
        }
        a1[1] = v2 + 2;
        CFIndex v38 = v2[1];
        goto LABEL_68;
      case 0x4Du:
        if ((unint64_t)(v3 - v4) <= 5) {
          goto LABEL_82;
        }
        uint64_t v39 = *(unsigned int *)(v2 + 1);
        a1[1] = v2 + 5;
        uint64_t v40 = v2[5];
        uint64_t v41 = v2[6];
        a1[1] = v2 + 7;
        CFIndex v38 = v39 | (v40 << 32) | (v41 << 40);
LABEL_68:
        return parseAndCreateArray(a1, v38);
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
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long valuePtr = 0u;
        return parseAndCreateDictionaryWithBuffer((int)a1, (const void **)&valuePtr, (v5 - 78));
      case 0x5Eu:
        if (v3 == v4) {
          goto LABEL_73;
        }
        a1[1] = v2 + 2;
        CFIndex v42 = v2[1];
        goto LABEL_79;
      case 0x5Fu:
        if ((unint64_t)(v3 - v4) <= 5)
        {
LABEL_82:
          uint64_t v43 = &v4[-*a1];
          uint64_t v44 = 6;
          goto LABEL_74;
        }
        uint64_t v45 = *(unsigned int *)(v2 + 1);
        a1[1] = v2 + 5;
        uint64_t v46 = v2[5];
        uint64_t v47 = v2[6];
        a1[1] = v2 + 7;
        CFIndex v42 = v45 | (v46 << 32) | (v47 << 40);
LABEL_79:
        return parseDictionary(a1, v42);
      case 0x60u:
        if ((unint64_t)(v3 - v4) <= 7)
        {
LABEL_87:
          uint64_t v43 = &v4[-*a1];
          uint64_t v44 = 8;
          goto LABEL_74;
        }
        CFAbsoluteTime v48 = *(double *)(v2 + 1);
        a1[1] = v2 + 9;
        CFDataRef result = CFDateCreate(0, v48);
        break;
      default:
        CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"Wrong value kind: %u", *v2);
        goto LABEL_75;
    }
  }
  return result;
}

const void *getParsedString(void *a1, unint64_t a2)
{
  if (a1[4] <= a2)
  {
    int v2 = 0;
    a1[262] = CFStringCreateWithFormat(0, 0, @"Invalid string index: %lu", a2);
  }
  else
  {
    int v2 = *(const void **)(a1[3] + 8 * a2);
    CFRetain(v2);
  }
  return v2;
}

CFStringRef readASCIIString(void *a1, unint64_t numBytes)
{
  CFTypeID v4 = (const UInt8 *)a1[1];
  if (a1[2] - (void)v4 >= numBytes)
  {
    CFStringRef v5 = CFStringCreateWithBytes(0, v4, numBytes, 0x600u, 0);
    a1[1] += numBytes;
    addParsedString((uint64_t)a1, v5);
  }
  else
  {
    CFStringRef v5 = 0;
    a1[262] = CFStringCreateWithFormat(0, 0, @"Out of bounds: at offset %lu, trying to read %lu bytes", &v4[-*a1], numBytes);
  }
  return v5;
}

CFStringRef readUnicode16String(void *a1, CFIndex numChars)
{
  CFIndex v4 = 2 * numChars;
  CFStringRef v5 = (const UniChar *)a1[1];
  if (a1[2] - (void)v5 >= (unint64_t)(2 * numChars))
  {
    CFStringRef v6 = CFStringCreateWithCharacters(0, v5, numChars);
    a1[1] += v4;
    addParsedString((uint64_t)a1, v6);
  }
  else
  {
    CFStringRef v6 = 0;
    a1[262] = CFStringCreateWithFormat(0, 0, @"Out of bounds: at offset %lu, trying to read %lu bytes", (char *)v5 - *a1, v4);
  }
  return v6;
}

CFDataRef readData(void *a1, unint64_t length)
{
  CFIndex v4 = (const UInt8 *)a1[1];
  if (a1[2] - (void)v4 >= length)
  {
    CFDataRef result = CFDataCreate(0, v4, length);
    a1[1] += length;
  }
  else
  {
    a1[262] = CFStringCreateWithFormat(0, 0, @"Out of bounds: at offset %lu, trying to read %lu bytes", &v4[-*a1], length);
    return 0;
  }
  return result;
}

CFArrayRef parseAndCreateArrayWithBuffer(int a1, const void **values, CFIndex numValues)
{
  CFIndex v3 = numValues;
  CFIndex v4 = values;
  if (numValues)
  {
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t Recursively = parseAndCreateRecursively(a1);
      if (!Recursively) {
        break;
      }
      v4[v6++] = (const void *)Recursively;
      if (v3 == v6)
      {
        for (CFArrayRef i = CFArrayCreate(0, v4, v3, MEMORY[0x263EFFF70]); v3; --v3)
        {
          BOOL v9 = *v4++;
          CFRelease(v9);
        }
        return i;
      }
    }
    if (v6)
    {
      for (uint64_t j = 0; j != v6; ++j)
        CFRelease(v4[j]);
    }
    return 0;
  }
  else
  {
    CFRange v10 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
    return CFArrayCreate(0, values, 0, v10);
  }
}

CFArrayRef parseAndCreateArray(void *a1, CFIndex a2)
{
  uint64_t v4 = 8 * a2;
  CFStringRef v5 = (const void **)malloc_type_malloc(8 * a2, 0xAFE05621uLL);
  if (v5)
  {
    uint64_t v6 = v5;
    CFArrayRef ArrayWithBuffer = parseAndCreateArrayWithBuffer((int)a1, v5, a2);
    free(v6);
    return ArrayWithBuffer;
  }
  else
  {
    a1[262] = CFStringCreateWithFormat(0, 0, @"Out of memory: at offset %lu, failed to allocate %llu bytes", a1[1] - *a1, v4);
    return 0;
  }
}

CFDictionaryRef parseAndCreateDictionaryWithBuffer(int a1, const void **keys, CFIndex numValues)
{
  uint64_t v4 = keys;
  CFIndex v5 = 2 * numValues;
  if (2 * numValues)
  {
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t Recursively = parseAndCreateRecursively(a1);
      if (!Recursively) {
        break;
      }
      v4[v7++] = (const void *)Recursively;
      if (v5 == v7)
      {
        for (CFDictionaryRef i = CFDictionaryCreate(0, v4, &v4[numValues], numValues, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]); v5; --v5)
        {
          CFRange v10 = *v4++;
          CFRelease(v10);
        }
        return i;
      }
    }
    if (v7)
    {
      for (uint64_t j = 0; j != v7; ++j)
        CFRelease(v4[j]);
    }
    return 0;
  }
  else
  {
    BOOL v11 = &keys[numValues];
    CFStringRef v12 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
    unsigned int v13 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
    return CFDictionaryCreate(0, keys, v11, numValues, v12, v13);
  }
}

CFDictionaryRef parseDictionary(void *a1, CFIndex a2)
{
  uint64_t v4 = 16 * a2;
  CFIndex v5 = (const void **)malloc_type_malloc(16 * a2, 0xAFE05621uLL);
  if (v5)
  {
    uint64_t v6 = v5;
    CFDictionaryRef DictionaryWithBuffer = parseAndCreateDictionaryWithBuffer((int)a1, v5, a2);
    free(v6);
    return DictionaryWithBuffer;
  }
  else
  {
    a1[262] = CFStringCreateWithFormat(0, 0, @"Out of memory: at offset %lu, failed to allocate %llu bytes", a1[1] - *a1, v4);
    return 0;
  }
}

CFTypeRef addParsedString(uint64_t a1, CFTypeRef cf)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 == *(void *)(a1 + 40))
  {
    CFIndex v5 = *(const void **)(a1 + 24);
    uint64_t v6 = 16 * v4;
    if (v5 == (const void *)(a1 + 48))
    {
      BOOL v9 = malloc_type_malloc(16 * v4, 0x9A5A75E3uLL);
      if (v6) {
        BOOL v10 = v9 == 0;
      }
      else {
        BOOL v10 = 0;
      }
      if (v10) {
        generate_cold_1();
      }
      *(void *)(a1 + 24) = v9;
      memcpy(v9, v5, 8 * *(void *)(a1 + 32));
    }
    else
    {
      uint64_t v7 = malloc_type_realloc(*(void **)(a1 + 24), 16 * v4, 0x6089071BuLL);
      if (v6) {
        BOOL v8 = v7 == 0;
      }
      else {
        BOOL v8 = 0;
      }
      if (v8) {
        appendValueGenerationData_cold_2();
      }
      *(void *)(a1 + 24) = v7;
    }
    *(void *)(a1 + 40) = 2 * v4;
  }
  CFTypeRef result = CFRetain(cf);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v13 + 1;
  *(void *)(v12 + 8 * v13) = result;
  return result;
}

uint64_t frameHeader(uint64_t a1, unsigned __int8 *a2)
{
  if (!a1) {
    frameHeader_cold_1();
  }
  return *a2;
}

void sub_222A1FE94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222A2029C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_222A214BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id wc_pushkit_log()
{
  if (wc_pushkit_log_onceToken != -1) {
    dispatch_once(&wc_pushkit_log_onceToken, &__block_literal_global_4);
  }
  CFNumberRef v0 = (void *)wc_pushkit_log___logger;

  return v0;
}

uint64_t __wc_pushkit_log_block_invoke()
{
  wc_pushkit_log___logger = (uint64_t)os_log_create("com.apple.wcd", "PushKit");

  return MEMORY[0x270F9A758]();
}

void WCDashboardLog(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  BOOL v10 = WCDashboardClient();
  [v10 logv:a1 args:&a9];
}

id WCDashboardClient()
{
  if (WCDashboardClient_onceToken != -1) {
    dispatch_once(&WCDashboardClient_onceToken, &__block_literal_global_7);
  }
  CFNumberRef v0 = (void *)WCDashboardClient_client;

  return v0;
}

void WCDashboardLogJSON(void *a1)
{
  id v1 = a1;
  WCDashboardClient();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 logJSON:v1];
}

uint64_t __WCDashboardClient_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F38548]);
  id v1 = (void *)WCDashboardClient_client;
  WCDashboardClient_client = (uint64_t)v0;

  id v2 = (void *)WCDashboardClient_client;

  return [v2 activate];
}

id WCTransferIdentifierFromComplicationIdentifier(void *a1)
{
  id v1 = [a1 stringByAppendingString:@"current-complication"];
  id v2 = objc_alloc(MEMORY[0x263F08C38]);
  id v3 = [v1 dataUsingEncoding:4];
  uint64_t v4 = objc_msgSend(v2, "initWithUUIDBytes:", objc_msgSend(v3, "bytes"));
  CFIndex v5 = [v4 UUIDString];

  return v5;
}

id WCSerializePayloadDictionary(void *a1, void *a2)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v12 = 0;
  id v3 = PizBufGenerateCompressed(a1, (uint64_t)&v12);
  id v4 = v12;
  CFIndex v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    int v17 = @"NSDebugDescription";
    v18[0] = v4;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    BOOL v8 = [v6 wcErrorWithCode:7010 userInfo:v7];

    if (v8)
    {
      if (a2) {
        *a2 = v8;
      }

      id v3 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  BOOL v9 = wc_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = "YES";
    if (!v3) {
      BOOL v10 = "NO";
    }
    *(_DWORD *)buf = 136446466;
    CFNumberType v14 = "NSData *WCSerializePayloadDictionary(NSDictionary<NSString *,id> *__strong, NSError *__autoreleasing *)";
    __int16 v15 = 2082;
    __int16 v16 = v10;
    _os_log_impl(&dword_222A02000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s success: %{public}s", buf, 0x16u);
  }

  return v3;
}

id WCDeserializePayloadData(void *a1, void *a2)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v13 = 0;
  id v3 = PizBufParse(a1, &v13);
  id v4 = v13;
  CFIndex v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v18 = @"NSDebugDescription";
  v19[0] = v4;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  id v8 = [v6 wcErrorWithCode:7010 userInfo:v7];

  if (v8)
  {
    if (a2)
    {
      id v8 = v8;
      id v9 = 0;
      *a2 = v8;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
LABEL_5:
    BOOL v10 = wc_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = "YES";
      if (!v3) {
        BOOL v11 = "NO";
      }
      *(_DWORD *)buf = 136446466;
      __int16 v15 = "NSDictionary<NSString *,id> *WCDeserializePayloadData(NSData *__strong, NSError *__autoreleasing *)";
      __int16 v16 = 2082;
      int v17 = v11;
      _os_log_impl(&dword_222A02000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s success: %{public}s", buf, 0x16u);
    }

    id v9 = v3;
    id v8 = 0;
  }

  return v9;
}

uint64_t WCIsDataAcceptableSizeForType(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 length];

  return WCIsSizeAcceptableForType(a1, v3);
}

uint64_t WCIsSizeAcceptableForType(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v4 = a2 < 262145;
  BOOL v5 = a2 <= 0x10000;
  if (a1) {
    BOOL v5 = 0;
  }
  if (a1 != 1) {
    BOOL v4 = v5;
  }
  if (a1 == 2) {
    uint64_t v6 = a2 <= 0x10000;
  }
  else {
    uint64_t v6 = v4;
  }
  uint64_t v7 = wc_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = "NO";
    BOOL v11 = "BOOL WCIsSizeAcceptableForType(WCPayloadType, NSInteger)";
    __int16 v12 = 2082;
    int v10 = 136446978;
    if (v6) {
      id v8 = "YES";
    }
    id v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = a1;
    __int16 v16 = 2048;
    uint64_t v17 = a2;
    _os_log_impl(&dword_222A02000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s acceptable: %{public}s, type: %lu, size: %lu", (uint8_t *)&v10, 0x2Au);
  }

  return v6;
}

uint64_t WCIsFileDirectory(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v12 = 0;
  uint64_t v1 = *MEMORY[0x263EFF6A8];
  id v11 = 0;
  uint64_t v2 = [a1 getResourceValue:&v12 forKey:v1 error:&v11];
  id v3 = v12;
  id v4 = v11;
  if (v2)
  {
    BOOL v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [v3 BOOLValue];
      uint64_t v7 = "NO";
      if (v6) {
        uint64_t v7 = "YES";
      }
      *(_DWORD *)buf = 136446466;
      __int16 v14 = "BOOL WCIsFileDirectory(NSURL *__strong)";
      __int16 v15 = 2082;
      __int16 v16 = v7;
      _os_log_impl(&dword_222A02000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s setting isDir %{public}s", buf, 0x16u);
    }

    uint64_t v2 = [v3 BOOLValue];
  }
  id v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = "NO";
    if (v2) {
      id v9 = "YES";
    }
    *(_DWORD *)buf = 136446466;
    __int16 v14 = "BOOL WCIsFileDirectory(NSURL *__strong)";
    __int16 v15 = 2082;
    __int16 v16 = v9;
    _os_log_impl(&dword_222A02000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s returning isDir %{public}s", buf, 0x16u);
  }

  return v2;
}

id WCCheckFileAndCreateExtensionForProcess(void *a1, int a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (isAllowedFileForProcess(v3, a2))
  {
    id v4 = v3;
    [v4 fileSystemRepresentation];
    BOOL v5 = (const char *)sandbox_extension_issue_file();
    if (v5)
    {
      int v6 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v5 length:strlen(v5) + 1];
      goto LABEL_9;
    }
    uint64_t v7 = wc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 path];
      __error();
      id v9 = NSPrintF();
      *(_DWORD *)buf = 136446722;
      id v12 = "NSData *WCCheckFileAndCreateExtensionForProcess(NSURL *__strong, pid_t)";
      __int16 v13 = 2114;
      __int16 v14 = v8;
      __int16 v15 = 2114;
      __int16 v16 = v9;
      _os_log_impl(&dword_222A02000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s Failed to issue sandbox extension for file %{public}@ due to %{public}@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v7 = wc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      id v12 = "NSData *WCCheckFileAndCreateExtensionForProcess(NSURL *__strong, pid_t)";
      _os_log_impl(&dword_222A02000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s File is not allowed", buf, 0xCu);
    }
  }

  int v6 = 0;
LABEL_9:

  return v6;
}

BOOL isAllowedFileForProcess(void *a1, int a2)
{
  id v3 = a1;
  id v4 = v3;
  if (v3)
  {
    int v5 = [v3 isFileURL];
    BOOL v6 = 0;
    if ((a2 & 0x80000000) == 0 && v5)
    {
      id v7 = [v4 path];
      [v7 fileSystemRepresentation];

      BOOL v6 = sandbox_check() == 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t WCConsumeSandboxToken(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  int v5 = v4;
  if (v4 && (BOOL v6 = malloc_type_malloc([v4 length], 0xCF6B25AuLL)) != 0)
  {
    id v7 = v6;
    objc_msgSend(v5, "getBytes:length:", v6, objc_msgSend(v5, "length"));
    uint64_t v8 = sandbox_extension_consume();
    if (v8 <= 0)
    {
      id v9 = wc_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = [v3 path];
        int v12 = 136446466;
        __int16 v13 = v7;
        __int16 v14 = 2114;
        __int16 v15 = v10;
        _os_log_impl(&dword_222A02000, v9, OS_LOG_TYPE_DEFAULT, "Failed to consume sandbox extension %{public}s for fileURL %{public}@", (uint8_t *)&v12, 0x16u);
      }
    }
    free(v7);
  }
  else
  {
    uint64_t v8 = -1;
  }

  return v8;
}

uint64_t WCCheckFileAndConsumeSandboxTokenForAuditToken(void *a1, void *a2, _OWORD *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = [v5 path];
  [v7 fileSystemRepresentation];

  long long v8 = a3[1];
  *(_OWORD *)buf = *a3;
  long long v13 = v8;
  if (sandbox_check_by_audit_token())
  {
    id v9 = wc_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222A02000, v9, OS_LOG_TYPE_DEFAULT, "Failed audit token check", buf, 2u);
    }

    uint64_t v10 = -1;
  }
  else
  {
    uint64_t v10 = WCConsumeSandboxToken(v5, v6);
  }

  return v10;
}

uint64_t WCCheckFileAndConsumeSandboxTokenForProcessID(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  if (isAllowedFileForProcess(v5, a3)) {
    uint64_t v7 = WCConsumeSandboxToken(v5, v6);
  }
  else {
    uint64_t v7 = -1;
  }

  return v7;
}

id WCInboxURLInContainer(uint64_t a1, void *a2)
{
  id v3 = NSURL;
  id v4 = a2;
  id v5 = [v3 fileURLWithPath:@"Documents" isDirectory:1 relativeToURL:a1];
  id v6 = [v5 URLByAppendingPathComponent:@"Inbox" isDirectory:1];

  uint64_t v7 = [v6 URLByAppendingPathComponent:@"com.apple.watchconnectivity" isDirectory:1];

  long long v8 = [v7 URLByAppendingPathComponent:v4 isDirectory:1];

  return v8;
}

id WCApplicationSupportURLInContainer(uint64_t a1, void *a2)
{
  id v3 = NSURL;
  id v4 = a2;
  id v5 = [v3 fileURLWithPath:@"Library" isDirectory:1 relativeToURL:a1];
  id v6 = [v5 URLByAppendingPathComponent:@"Application Support" isDirectory:1];

  uint64_t v7 = [v6 URLByAppendingPathComponent:@"com.apple.watchconnectivity" isDirectory:1];

  long long v8 = [v7 URLByAppendingPathComponent:v4 isDirectory:1];

  return v8;
}

id WCSessionFilesURLInContainer(uint64_t a1, void *a2)
{
  uint64_t v2 = WCInboxURLInContainer(a1, a2);
  id v3 = [v2 URLByAppendingPathComponent:@"FileMetadata" isDirectory:1];

  return v3;
}

id WCTransferredFilesURLInContainer(uint64_t a1, void *a2)
{
  uint64_t v2 = WCInboxURLInContainer(a1, a2);
  id v3 = [v2 URLByAppendingPathComponent:@"Files" isDirectory:1];

  return v3;
}

id WCTransferredUserInfoInboxURLInContainer(uint64_t a1, void *a2)
{
  uint64_t v2 = WCInboxURLInContainer(a1, a2);
  id v3 = [v2 URLByAppendingPathComponent:@"UserInfo" isDirectory:1];

  return v3;
}

id WCWatchDirectoryLocationInContainer(uint64_t a1, void *a2)
{
  uint64_t v2 = WCApplicationSupportURLInContainer(a1, a2);
  id v3 = [v2 URLByAppendingPathComponent:@"WatchContent" isDirectory:1];

  return v3;
}

id WCInboxAppContextFolderURLInContainer(uint64_t a1, void *a2)
{
  uint64_t v2 = WCInboxURLInContainer(a1, a2);
  id v3 = [v2 URLByAppendingPathComponent:@"ApplicationContext" isDirectory:1];

  return v3;
}

id WCFileTransfersURLInContainer(uint64_t a1, void *a2)
{
  uint64_t v2 = WCApplicationSupportURLInContainer(a1, a2);
  id v3 = [v2 URLByAppendingPathComponent:@"FileTransfers" isDirectory:1];

  return v3;
}

id WCUserInfoTransfersInContainer(uint64_t a1, void *a2)
{
  uint64_t v2 = WCApplicationSupportURLInContainer(a1, a2);
  id v3 = [v2 URLByAppendingPathComponent:@"UserInfoTransfers" isDirectory:1];

  return v3;
}

void WCDeleteItemAtURL(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [v1 path];
    *(_DWORD *)buf = 136446466;
    uint64_t v10 = "void WCDeleteItemAtURL(NSURL *__strong)";
    __int16 v11 = 2114;
    int v12 = v3;
    _os_log_impl(&dword_222A02000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v8 = 0;
  char v5 = [v4 removeItemAtURL:v1 error:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0 && v6 && [v6 code] != -1100)
  {
    uint64_t v7 = wc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      WCDeleteItemAtURL_cold_1(v1, (uint64_t)v6, v7);
    }
  }
}

void OUTLINED_FUNCTION_7_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 40) = a1;
}

void sub_222A2830C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void generate_cold_1()
{
}

void PizBufGenerateCompressed_cold_1()
{
}

void PizBufGenerateCompressed_cold_2()
{
  fprintf((FILE *)*MEMORY[0x263EF8348], "FATAL: %s:%d: assertion \"%s\" failed!\n", "/Library/Caches/com.apple.xbs/Sources/WatchConnectivity/Framework/pizbuf.m", 445, "compressionRatioBound <= 255");
  abort();
}

void PizBufGenerateCompressed_cold_3()
{
}

void PizBufGenerateCompressed_cold_5()
{
  fprintf((FILE *)*MEMORY[0x263EF8348], "FATAL: %s:%d: assertion \"%s\" failed!\n", "/Library/Caches/com.apple.xbs/Sources/WatchConnectivity/Framework/pizbuf.m", 407, "input.size <= LZ4_MAX_INPUT_SIZE");
  abort();
}

void parse_cold_1()
{
}

void parse_cold_2()
{
}

void collectValuesRecursively_cold_2()
{
}

void collectValuesRecursively_cold_3()
{
}

void collectValuesRecursively_cold_4()
{
}

void appendValueGenerationData_cold_2()
{
}

void frameHeader_cold_1()
{
}

void WCDeleteItemAtURL_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = [a1 path];
  char v5 = NSPrintF();
  *(_DWORD *)buf = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_fault_impl(&dword_222A02000, a3, OS_LOG_TYPE_FAULT, "error removing item %{public}@ due to %{public}@", buf, 0x16u);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x270EE47B0](type_id);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
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

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x270EE48C8](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x270EE48D8]();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

uint64_t CFLog()
{
  return MEMORY[0x270EE4AD8]();
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x270EE4BD0]();
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

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x270EE4C78](number);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x270EE4F78]();
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x270EE50F8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x270EE5448]();
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x270EE54A0]();
}

uint64_t CUMetricsLog()
{
  return MEMORY[0x270F23F60]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x270F244C8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x270F58540]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x270F585B0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x270F585E0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
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

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
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

uint64_t sandbox_check()
{
  return MEMORY[0x270EDB290]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x270EDB298]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}