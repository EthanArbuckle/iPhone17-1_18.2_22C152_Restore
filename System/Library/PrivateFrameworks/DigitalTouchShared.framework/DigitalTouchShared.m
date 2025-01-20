uint64_t ETPHeaderReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  int v35;
  void *v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;

  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(void *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(unsigned char *)(a1 + 56) |= 8u;
          while (1)
          {
            v21 = *v3;
            v22 = *(void *)(a2 + v21);
            v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
              break;
            }
            v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0) {
              goto LABEL_48;
            }
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_50;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_48:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_50:
          *(_DWORD *)(a1 + 48) = v20;
          continue;
        case 2u:
          *(unsigned char *)(a1 + 56) |= 1u;
          v26 = *v3;
          v27 = *(void *)(a2 + v26);
          if (v27 <= 0xFFFFFFFFFFFFFFF7 && (v28 = v27 + 8, v27 + 8 <= *(void *)(a2 + *v4)))
          {
            v29 = *(void *)(*(void *)(a2 + *v7) + v27);
            *(void *)(a2 + v26) = v28;
          }
          else
          {
            v29 = 0;
            *(unsigned char *)(a2 + *v5) = 1;
          }
          *(void *)(a1 + 8) = v29;
          continue;
        case 3u:
          v30 = PBReaderReadData();
          v31 = 40;
          goto LABEL_36;
        case 4u:
          *(unsigned char *)(a1 + 56) |= 4u;
          v32 = *v3;
          v33 = *(void *)(a2 + v32);
          if (v33 <= 0xFFFFFFFFFFFFFFFBLL && (v34 = v33 + 4, v33 + 4 <= *(void *)(a2 + *v4)))
          {
            v35 = *(_DWORD *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v34;
          }
          else
          {
            v35 = 0;
            *(unsigned char *)(a2 + *v5) = 1;
          }
          *(_DWORD *)(a1 + 24) = v35;
          continue;
        case 5u:
          v30 = PBReaderReadString();
          v31 = 32;
LABEL_36:
          v36 = *(void **)(a1 + v31);
          *(void *)(a1 + v31) = v30;

          continue;
        case 6u:
          v37 = 0;
          v38 = 0;
          v39 = 0;
          *(unsigned char *)(a1 + 56) |= 0x10u;
          break;
        case 7u:
          *(unsigned char *)(a1 + 56) |= 2u;
          v44 = *v3;
          v45 = *(void *)(a2 + v44);
          if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(void *)(a2 + *v4))
          {
            v46 = *(void *)(*(void *)(a2 + *v7) + v45);
            *(void *)(a2 + v44) = v45 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            v46 = 0;
          }
          *(void *)(a1 + 16) = v46;
          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        v40 = *v3;
        v41 = *(void *)(a2 + v40);
        v42 = v41 + 1;
        if (v41 == -1 || v42 > *(void *)(a2 + *v4)) {
          break;
        }
        v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
        *(void *)(a2 + v40) = v42;
        v39 |= (unint64_t)(v43 & 0x7F) << v37;
        if ((v43 & 0x80) == 0) {
          goto LABEL_52;
        }
        v37 += 7;
        v15 = v38++ >= 9;
        if (v15)
        {
          v39 = 0;
          goto LABEL_54;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_52:
      if (*(unsigned char *)(a2 + *v5)) {
        v39 = 0;
      }
LABEL_54:
      *(unsigned char *)(a1 + 52) = v39 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_23B56110C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSKViewClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SpriteKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SpriteKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264DEC868;
    uint64_t v5 = 0;
    SpriteKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SpriteKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getSKViewClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("SKView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getSKViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpriteKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpriteKitLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t ETPHeartbeatReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  long long v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 32) |= 1u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFFBLL && v19 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          uint64_t v37 = 8;
          goto LABEL_57;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          *(unsigned char *)(a1 + 32) |= 2u;
          break;
        case 3u:
          *(unsigned char *)(a1 + 32) |= 8u;
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFFBLL && v30 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          uint64_t v37 = 20;
          goto LABEL_57;
        case 4u:
          *(unsigned char *)(a1 + 32) |= 0x10u;
          uint64_t v31 = *v3;
          unint64_t v32 = *(void *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFFBLL && v32 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v32 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          uint64_t v37 = 24;
          goto LABEL_57;
        case 5u:
          *(unsigned char *)(a1 + 32) |= 0x20u;
          uint64_t v33 = *v3;
          unint64_t v34 = *(void *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFFBLL && v34 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v34 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          uint64_t v37 = 28;
          goto LABEL_57;
        case 6u:
          *(unsigned char *)(a1 + 32) |= 4u;
          uint64_t v35 = *v3;
          unint64_t v36 = *(void *)(a2 + v35);
          if (v36 <= 0xFFFFFFFFFFFFFFFBLL && v36 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v36 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          uint64_t v37 = 16;
LABEL_57:
          *(_DWORD *)(a1 + v37) = v20;
          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v25 = *v3;
        uint64_t v26 = *(void *)(a2 + v25);
        unint64_t v27 = v26 + 1;
        if (v26 == -1 || v27 > *(void *)(a2 + *v4)) {
          break;
        }
        char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
        *(void *)(a2 + v25) = v27;
        v24 |= (unint64_t)(v28 & 0x7F) << v22;
        if ((v28 & 0x80) == 0) {
          goto LABEL_44;
        }
        v22 += 7;
        BOOL v15 = v23++ >= 9;
        if (v15)
        {
          LODWORD(v24) = 0;
          goto LABEL_46;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v24) = 0;
      }
LABEL_46:
      *(_DWORD *)(a1 + 12) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

long double HueFromRadians(long double a1)
{
  for (; a1 < 0.0; a1 = a1 + 6.28318531)
    ;
  return fmod(a1, 6.28318531) / 6.28318531;
}

double RadiansFromHue(double a1)
{
  return (a1 + a1) * 3.14159265;
}

void RoundViewOriginToViewScale(void *a1)
{
  id v8 = a1;
  [v8 frame];
  double v2 = v1;
  double v4 = v3;
  UIRoundToViewScale();
  double v6 = v5;
  UIRoundToViewScale();
  objc_msgSend(v8, "setFrame:", v6, v7, v2, v4);
}

void sub_23B56317C(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x23B563128);
  }

  _Unwind_Resume(exc_buf);
}

void sub_23B5632C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23B56334C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23B5633F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23B56355C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_23B563684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23B5638D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23B563C80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23B563D70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23B563F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23B564030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23B564098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23B5641C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23B56440C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23B564814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23B564BC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *_ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE16__init_with_sizeB8ne180100IPS4_S8_EEvT_T0_m(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    double v6 = result;
    _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE11__vallocateB8ne180100Em(result, a4);
    uint64_t result = _ZNSt3__135__uninitialized_allocator_copy_implB8ne180100INS_9allocatorINS_6vectorIDv2_fNS1_IS3_EEEEEEPS5_S7_S7_EET2_RT_T0_T1_S8_((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_23B565604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE16__destroy_vectorclB8ne180100Ev(&a9);
  _Unwind_Resume(a1);
}

char *_ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE11__vallocateB8ne180100Em(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
  }
  uint64_t result = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorINS_6vectorIDv2_fNS1_IS3_EEEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS9_m((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev()
{
}

void *_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorINS_6vectorIDv2_fNS1_IS3_EEEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS9_m(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void __clang_call_terminate(void *a1)
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264DEC538, MEMORY[0x263F8C060]);
}

void sub_23B565734(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  double v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *_ZNSt3__135__uninitialized_allocator_copy_implB8ne180100INS_9allocatorINS_6vectorIDv2_fNS1_IS3_EEEEEEPS5_S7_S7_EET2_RT_T0_T1_S8_(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *uint64_t v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(v4, *(const void **)v6, *(void *)(v6 + 8), (uint64_t)(*(void *)(v6 + 8) - *(void *)v6) >> 3);
      uint64_t v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  _ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_6vectorIDv2_fNS2_IS4_EEEEEEPS6_EEED2B8ne180100Ev((uint64_t)v8);
  return v4;
}

void sub_23B565850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_6vectorIDv2_fNS2_IS4_EEEEEEPS6_EEED2B8ne180100Ev(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    _ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_6vectorIDv2_fNS1_IS3_EEEEEEPS5_EclB8ne180100Ev(a1);
  }
  return a1;
}

void _ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_6vectorIDv2_fNS1_IS3_EEEEEEPS5_EclB8ne180100Ev(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  if (v1 != v2)
  {
    uint64_t v3 = **(void **)(a1 + 16);
    do
    {
      double v5 = *(void **)(v3 - 24);
      v3 -= 24;
      uint64_t v4 = v5;
      if (v5)
      {
        *(void *)(v1 - 16) = v4;
        operator delete(v4);
      }
      uint64_t v1 = v3;
    }
    while (v3 != v2);
  }
}

void _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE16__destroy_vectorclB8ne180100Ev(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE7__clearB8ne180100Ev((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE7__clearB8ne180100Ev(uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 24);
      v4 -= 24;
      double v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

void _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE18__assign_with_sizeB8ne180100IPS4_S8_EEvT_T0_l(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  char v9 = *(char **)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) < a4)
  {
    _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE13__vdeallocateEv((uint64_t *)a1);
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
    }
    unint64_t v10 = 0x5555555555555556 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3);
    if (v10 <= a4) {
      unint64_t v10 = a4;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v10;
    }
    _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE11__vallocateB8ne180100Em((void *)a1, v11);
    uint64_t v12 = _ZNSt3__135__uninitialized_allocator_copy_implB8ne180100INS_9allocatorINS_6vectorIDv2_fNS1_IS3_EEEEEEPS5_S7_S7_EET2_RT_T0_T1_S8_(v8, a2, a3, *(void **)(a1 + 8));
    goto LABEL_11;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3) < a4)
  {
    uint64_t v13 = a2 + 8 * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3);
    _ZNKSt3__111__copy_loopINS_17_ClassicAlgPolicyEEclB8ne180100IPNS_6vectorIDv2_fNS_9allocatorIS5_EEEES9_S9_EENS_4pairIT_T1_EESB_T0_SC_((int)&v20, a2, v13, v9);
    uint64_t v12 = _ZNSt3__135__uninitialized_allocator_copy_implB8ne180100INS_9allocatorINS_6vectorIDv2_fNS1_IS3_EEEEEEPS5_S7_S7_EET2_RT_T0_T1_S8_(v8, v13, a3, *(void **)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = v12;
    return;
  }
  _ZNKSt3__111__copy_loopINS_17_ClassicAlgPolicyEEclB8ne180100IPNS_6vectorIDv2_fNS_9allocatorIS5_EEEES9_S9_EENS_4pairIT_T1_EESB_T0_SC_((int)&v21, a2, a3, v9);
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(a1 + 8);
  if (v16 != v14)
  {
    uint64_t v17 = *(void *)(a1 + 8);
    do
    {
      uint64_t v19 = *(void **)(v17 - 24);
      v17 -= 24;
      uint64_t v18 = v19;
      if (v19)
      {
        *(void *)(v16 - 16) = v18;
        operator delete(v18);
      }
      uint64_t v16 = v17;
    }
    while (v17 != v15);
  }
  *(void *)(a1 + 8) = v15;
}

void sub_23B565B14(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_23B565B1C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE13__vdeallocateEv(uint64_t *a1)
{
  if (*a1)
  {
    _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE7__clearB8ne180100Ev(a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

uint64_t _ZNKSt3__111__copy_loopINS_17_ClassicAlgPolicyEEclB8ne180100IPNS_6vectorIDv2_fNS_9allocatorIS5_EEEES9_S9_EENS_4pairIT_T1_EESB_T0_SC_(int a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if ((char *)v5 != a4) {
        _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(a4, *(char **)v5, *(void *)(v5 + 8), (uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 3);
      }
      v5 += 24;
      a4 += 24;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void *_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_23B565C30(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
  }
  uint64_t result = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

char *_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  char v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 3)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61) {
      _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(v7, v11);
    uint64_t v13 = (char *)v7[1];
    uint64_t v12 = (void **)(v7 + 1);
    char v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      uint64_t v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v12 = (void **)(result + 8);
  uint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 3;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    char v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    uint64_t v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *uint64_t v12 = &v9[v17];
  return result;
}

void *std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_23B565E34(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *_ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE22__construct_one_at_endB8ne180100IJRKS4_EEEvDpOT_(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 8);
  void *v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  uint64_t result = _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(v3, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
  *(void *)(a1 + 8) = v3 + 3;
  return result;
}

void sub_23B565E9C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE21__push_back_slow_pathIRKS4_EEPS4_OT_(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  size_t v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorINS_6vectorIDv2_fNS1_IS3_EEEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS9_m(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  unint64_t v15 = v11;
  uint64_t v16 = &v10[24 * v9];
  *(void *)unint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(v11, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
  v15 += 24;
  _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS4_RS5_EE(a1, v14);
  uint64_t v12 = a1[1];
  _ZNSt3__114__split_bufferINS_6vectorIDv2_fNS_9allocatorIS2_EEEERNS3_IS5_EEED2Ev((uint64_t)v14);
  return v12;
}

void sub_23B565FA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _ZNSt3__114__split_bufferINS_6vectorIDv2_fNS_9allocatorIS2_EEEERNS3_IS5_EEED2Ev((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS4_RS5_EE(uint64_t *a1, void *a2)
{
  uint64_t result = _ZNSt3__142__uninitialized_allocator_move_if_noexceptB8ne180100INS_9allocatorINS_6vectorIDv2_fNS1_IS3_EEEEEENS_16reverse_iteratorIPS5_EES9_S9_EET2_RT_T0_T1_SA_((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t _ZNSt3__142__uninitialized_allocator_move_if_noexceptB8ne180100INS_9allocatorINS_6vectorIDv2_fNS1_IS3_EEEEEENS_16reverse_iteratorIPS5_EES9_S9_EET2_RT_T0_T1_SA_(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  _ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_6vectorIDv2_fNS2_IS4_EEEEEENS_16reverse_iteratorIPS6_EEEEED2B8ne180100Ev((uint64_t)v11);
  return v9;
}

uint64_t _ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_6vectorIDv2_fNS2_IS4_EEEEEENS_16reverse_iteratorIPS6_EEEEED2B8ne180100Ev(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    _ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_6vectorIDv2_fNS1_IS3_EEEEEENS_16reverse_iteratorIPS5_EEEclB8ne180100Ev(a1);
  }
  return a1;
}

void _ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_6vectorIDv2_fNS1_IS3_EEEEEENS_16reverse_iteratorIPS5_EEEclB8ne180100Ev(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t _ZNSt3__114__split_bufferINS_6vectorIDv2_fNS_9allocatorIS2_EEEERNS3_IS5_EEED2Ev(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void _ZNSt3__114__split_bufferINS_6vectorIDv2_fNS_9allocatorIS2_EEEERNS3_IS5_EEE17__destruct_at_endB8ne180100EPS5_(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

BOOL ETPTapReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  unint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
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
        if (v9++ >= 9)
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
      if ((v10 >> 3) == 4) {
        break;
      }
      if (v17 == 3)
      {
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 16;
        goto LABEL_24;
      }
      if (v17 == 2)
      {
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 24;
LABEL_24:
        char v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadData();
    uint64_t v19 = 8;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *NSStringFromETMessageType(unsigned int a1)
{
  if (a1 < 0xB && ((0x7C7u >> a1) & 1) != 0)
  {
    uint64_t v1 = off_264DEC918[(__int16)a1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown (%d)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

uint64_t _heartRateEnabledPreferenceChangeNotification(uint64_t a1, void *a2)
{
  return [a2 _updateHeartRateEnabled];
}

void sub_23B56880C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
}

BOOL ETPKissReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  unint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
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
        if (v9++ >= 9)
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
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 24;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 16;
LABEL_24:
        char v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadData();
    uint64_t v19 = 8;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_23B56AF60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ETPAngerReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  unint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          if (v9++ >= 9)
          {
            unint64_t v10 = 0;
            int v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        if (v16) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = (v10 & 7) == 4;
        }
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              *(unsigned char *)(a1 + 40) |= 1u;
              uint64_t v18 = *v3;
              unint64_t v19 = *(void *)(a2 + v18);
              if (v19 <= 0xFFFFFFFFFFFFFFFBLL && v19 + 4 <= *(void *)(a2 + *v4))
              {
                int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v19);
                *(void *)(a2 + v18) = v19 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                int v20 = 0;
              }
              uint64_t v29 = 16;
              goto LABEL_39;
            case 2u:
              *(unsigned char *)(a1 + 40) |= 2u;
              uint64_t v27 = *v3;
              unint64_t v28 = *(void *)(a2 + v27);
              if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(void *)(a2 + *v4))
              {
                int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v28);
                *(void *)(a2 + v27) = v28 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                int v20 = 0;
              }
              uint64_t v29 = 20;
              goto LABEL_39;
            case 3u:
              *(unsigned char *)(a1 + 40) |= 4u;
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 <= 0xFFFFFFFFFFFFFFFBLL && v22 + 4 <= *(void *)(a2 + *v4))
              {
                int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v22);
                *(void *)(a2 + v21) = v22 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                int v20 = 0;
              }
              uint64_t v29 = 24;
LABEL_39:
              *(_DWORD *)(a1 + v29) = v20;
              goto LABEL_40;
            case 4u:
              uint64_t v23 = PBReaderReadData();
              uint64_t v24 = 8;
              goto LABEL_27;
            case 5u:
              uint64_t v23 = PBReaderReadData();
              uint64_t v24 = 32;
LABEL_27:
              uint64_t v25 = *(void **)(a1 + v24);
              *(void *)(a1 + v24) = v23;

              goto LABEL_40;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_40:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_23B56E7EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B5728F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getSKSceneClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SpriteKitLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SpriteKitLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264DECAB0;
    uint64_t v5 = 0;
    SpriteKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!SpriteKitLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
LABEL_8:
      __getSKSceneClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("SKScene");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getSKSceneClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpriteKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SpriteKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_23B5745F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSKActionClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSKActionClass_softClass;
  uint64_t v7 = getSKActionClass_softClass;
  if (!getSKActionClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSKActionClass_block_invoke;
    v3[3] = &unk_264DEC848;
    v3[4] = &v4;
    __getSKActionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23B5746E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSKSetResourceBundleSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpriteKitLibrary();
  uint64_t result = dlsym(v2, "SKSetResourceBundle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSKSetResourceBundleSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SpriteKitLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SpriteKitLibraryCore_frameworkLibrary_1)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __SpriteKitLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264DECAC8;
    uint64_t v5 = 0;
    SpriteKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = SpriteKitLibraryCore_frameworkLibrary_1;
  id v1 = (void *)v3[0];
  if (!SpriteKitLibraryCore_frameworkLibrary_1)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __SpriteKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  SpriteKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getSKSpriteNodeClass_block_invoke(uint64_t a1)
{
  SpriteKitLibrary();
  Class result = objc_getClass("SKSpriteNode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKSpriteNodeClass_block_invoke_cold_1();
  }
  getSKSpriteNodeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSKActionClass_block_invoke(uint64_t a1)
{
  SpriteKitLibrary();
  Class result = objc_getClass("SKAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKActionClass_block_invoke_cold_1();
  }
  getSKActionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id PaletteColorsDataArray()
{
  uint64_t v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v0 synchronize];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __PaletteColorsDataArray_block_invoke;
  block[3] = &unk_264DEC6D0;
  id v1 = v0;
  id v7 = v1;
  if (PaletteColorsDataArray_onceToken != -1) {
    dispatch_once(&PaletteColorsDataArray_onceToken, block);
  }
  uint64_t v2 = [v1 arrayForKey:@"ETColorPickerColorData"];
  if (!v2)
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:7];
    for (uint64_t i = 0; i != 7; ++i)
    {
      long long v4 = [NSNumber numberWithUnsignedInt:bswap32(DefaultPaletteColors[i])];
      [v2 addObject:v4];
    }
    [v1 setObject:v2 forKey:@"ETColorPickerColorData"];
  }

  return v2;
}

void __PaletteColorsDataArray_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"ETColorPickerColors"];

  if (v2)
  {
    [*(id *)(a1 + 32) removeObjectForKey:@"ETColorPickerColors"];
    uint64_t v3 = *(void **)(a1 + 32);
    [v3 synchronize];
  }
}

uint64_t ETPDoodleReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  long long v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
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
        if (v15) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = (v10 & 7) == 4;
        }
        if (!v16)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v17 = 0;
              unsigned int v18 = 0;
              uint64_t v19 = 0;
              *(unsigned char *)(a1 + 40) |= 1u;
              break;
            case 2u:
              uint64_t v24 = PBReaderReadData();
              uint64_t v25 = 24;
              goto LABEL_31;
            case 3u:
              uint64_t v24 = PBReaderReadData();
              uint64_t v25 = 8;
              goto LABEL_31;
            case 4u:
              uint64_t v24 = PBReaderReadData();
              uint64_t v25 = 32;
LABEL_31:
              uint64_t v26 = *(void **)(a1 + v25);
              *(void *)(a1 + v25) = v24;

              goto LABEL_36;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_36:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_33;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_35;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_35:
          *(_DWORD *)(a1 + 16) = v19;
          goto LABEL_36;
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_23B5764CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void releasePixels(int a1, void *a2)
{
}

uint64_t ETPVideoReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  long long v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 4)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_34;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_36;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_36:
        *(_DWORD *)(a1 + 16) = v22;
      }
      else
      {
        if (v17 == 2)
        {
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 24;
        }
        else
        {
          if (v17 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 8;
        }
        uint64_t v26 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL ETPReadReceiptReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  long long v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  uint64_t v6 = (int *)MEMORY[0x263F62268];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t ETFrameworkBundle()
{
  uint64_t v0 = (void *)MEMORY[0x263F086E0];
  uint64_t v1 = objc_opt_class();

  return [v0 bundleForClass:v1];
}

uint64_t __dateFormatterWithMilliseconds_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v1 = (void *)dateFormatterWithMilliseconds_dateFormatter;
  dateFormatterWithMilliseconds_dateFormatter = (uint64_t)v0;

  uint64_t v2 = (void *)dateFormatterWithMilliseconds_dateFormatter;

  return [v2 setDateFormat:@"yyyy-MM-dd-HH:mm:ss.SSS"];
}

CGPath *createCirclePath(CGFloat a1, CGFloat a2)
{
  if (a1 <= 1.0) {
    return 0;
  }
  Mutable = CGPathCreateMutable();
  CGPathAddArc(Mutable, 0, 0.0, 0.0, a1, 0.0, 6.28318531, 1);
  CGPathCloseSubpath(Mutable);
  if (a2 > 1.0)
  {
    CGPathMoveToPoint(Mutable, 0, a2, 0.0);
    CGPathAddArc(Mutable, 0, 0.0, 0.0, a2, 0.0, 6.28318531, 0);
    CGPathCloseSubpath(Mutable);
  }
  return Mutable;
}

CGPath *createSemiCirclePath(CGFloat a1, CGFloat a2)
{
  if (a1 <= 1.0) {
    return 0;
  }
  CGFloat v4 = a2 + 3.14159265;
  Mutable = CGPathCreateMutable();
  CGPathAddArc(Mutable, 0, 0.0, 0.0, a1, a2, v4, 1);
  return Mutable;
}

float clampFloat(float a1, float a2, float a3)
{
  return fmaxf(a2, fminf(a3, a1));
}

void sub_23B579AE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23B57A400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_23B57A8B4(_Unwind_Exception *a1, int a2)
{
  uint64_t v6 = v4;

  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x23B57A83CLL);
  }

  _Unwind_Resume(a1);
}

void sub_23B57AD84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);

  objc_destroyWeak((id *)(v32 - 144));
  _Unwind_Resume(a1);
}

id getSKActionClass(void)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getSKActionClass(void)::softClass;
  uint64_t v7 = getSKActionClass(void)::softClass;
  if (!getSKActionClass(void)::softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = ___ZL16getSKActionClassv_block_invoke;
    v3[3] = &unk_264DECBF8;
    v3[4] = &v4;
    ___ZL16getSKActionClassv_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23B57AF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B57B0C4(_Unwind_Exception *a1, int a2)
{
  uint64_t v5 = v3;

  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x23B57B024);
  }
  _Unwind_Resume(a1);
}

void sub_23B57B194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_23B57B230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_23B57B3B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23B57C7AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _Unwind_Exception *exception_object, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Unwind_Resume(a1);
}

id getSKNodeClass(void)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getSKNodeClass(void)::softClass;
  uint64_t v7 = getSKNodeClass(void)::softClass;
  if (!getSKNodeClass(void)::softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = ___ZL14getSKNodeClassv_block_invoke;
    v3[3] = &unk_264DECBF8;
    v3[4] = &v4;
    ___ZL14getSKNodeClassv_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23B57CD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B57CDF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23B57CE6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23B57D018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class ___ZL16getSKActionClassv_block_invoke(uint64_t a1)
{
  SpriteKitLibrary();
  Class result = objc_getClass("SKAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKActionClass_block_invoke_cold_1();
  }
  getSKActionClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SpriteKitLibrary(void)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SpriteKitLibraryCore(char **)::frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = ___ZL20SpriteKitLibraryCorePPc_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264DECC18;
    uint64_t v5 = 0;
    SpriteKitLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = SpriteKitLibraryCore(char **)::frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!SpriteKitLibraryCore(char **)::frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t ___ZL20SpriteKitLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpriteKitLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

Class ___ZL19getSKFieldNodeClassv_block_invoke(uint64_t a1)
{
  SpriteKitLibrary();
  Class result = objc_getClass("SKFieldNode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    ___ZL19getSKFieldNodeClassv_block_invoke_cold_1();
  }
  getSKFieldNodeClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class ___ZL14getSKNodeClassv_block_invoke(uint64_t a1)
{
  SpriteKitLibrary();
  Class result = objc_getClass("SKNode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    ___ZL14getSKNodeClassv_block_invoke_cold_1();
  }
  getSKNodeClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class ___ZL19getSKShapeNodeClassv_block_invoke(uint64_t a1)
{
  SpriteKitLibrary();
  Class result = objc_getClass("SKShapeNode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    ___ZL19getSKShapeNodeClassv_block_invoke_cold_1();
  }
  getSKShapeNodeClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ET_SKSetResourceBundle(NSBundle *a1)
{
  id v1 = a1;
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v2 = (void (*)(NSBundle *))getSKSetResourceBundleSymbolLoc(void)::ptr;
  uint64_t v7 = getSKSetResourceBundleSymbolLoc(void)::ptr;
  if (!getSKSetResourceBundleSymbolLoc(void)::ptr)
  {
    uint64_t v3 = (void *)SpriteKitLibrary();
    v5[3] = (uint64_t)dlsym(v3, "SKSetResourceBundle");
    getSKSetResourceBundleSymbolLoc(void)::ptr = (_UNKNOWN *)v5[3];
    uint64_t v2 = (void (*)(NSBundle *))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (v2)
  {
    v2(v1);
  }
  else
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
}

void sub_23B57D420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

id getSKEmitterNodeClass(void)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSKEmitterNodeClass(void)::softClass;
  uint64_t v7 = getSKEmitterNodeClass(void)::softClass;
  if (!getSKEmitterNodeClass(void)::softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = ___ZL21getSKEmitterNodeClassv_block_invoke;
    v3[3] = &unk_264DECBF8;
    v3[4] = &v4;
    ___ZL21getSKEmitterNodeClassv_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23B57D510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSKKeyframeSequenceClass(void)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSKKeyframeSequenceClass(void)::softClass;
  uint64_t v7 = getSKKeyframeSequenceClass(void)::softClass;
  if (!getSKKeyframeSequenceClass(void)::softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = ___ZL26getSKKeyframeSequenceClassv_block_invoke;
    v3[3] = &unk_264DECBF8;
    v3[4] = &v4;
    ___ZL26getSKKeyframeSequenceClassv_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23B57D5F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *___ZL31getSKSetResourceBundleSymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpriteKitLibrary();
  Class result = dlsym(v2, "SKSetResourceBundle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSKSetResourceBundleSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class ___ZL21getSKEmitterNodeClassv_block_invoke(uint64_t a1)
{
  SpriteKitLibrary();
  Class result = objc_getClass("SKEmitterNode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    ___ZL21getSKEmitterNodeClassv_block_invoke_cold_1();
  }
  getSKEmitterNodeClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class ___ZL26getSKKeyframeSequenceClassv_block_invoke(uint64_t a1)
{
  SpriteKitLibrary();
  Class result = objc_getClass("SKKeyframeSequence");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    ___ZL26getSKKeyframeSequenceClassv_block_invoke_cold_1();
  }
  getSKKeyframeSequenceClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void sub_23B57D9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

id getSKNodeClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSKNodeClass_softClass;
  uint64_t v7 = getSKNodeClass_softClass;
  if (!getSKNodeClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSKNodeClass_block_invoke;
    v3[3] = &unk_264DEC848;
    v3[4] = &v4;
    __getSKNodeClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23B57E9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSKTextureClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSKTextureClass_softClass;
  uint64_t v7 = getSKTextureClass_softClass;
  if (!getSKTextureClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSKTextureClass_block_invoke;
    v3[3] = &unk_264DEC848;
    v3[4] = &v4;
    __getSKTextureClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23B57EA9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSKShaderClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSKShaderClass_softClass;
  uint64_t v7 = getSKShaderClass_softClass;
  if (!getSKShaderClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSKShaderClass_block_invoke;
    v3[3] = &unk_264DEC848;
    v3[4] = &v4;
    __getSKShaderClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23B57EB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSKUniformClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSKUniformClass_softClass;
  uint64_t v7 = getSKUniformClass_softClass;
  if (!getSKUniformClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSKUniformClass_block_invoke;
    v3[3] = &unk_264DEC848;
    v3[4] = &v4;
    __getSKUniformClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23B57EC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSKSpriteNodeClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSKSpriteNodeClass_softClass_0;
  uint64_t v7 = getSKSpriteNodeClass_softClass_0;
  if (!getSKSpriteNodeClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSKSpriteNodeClass_block_invoke_0;
    v3[3] = &unk_264DEC848;
    v3[4] = &v4;
    __getSKSpriteNodeClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23B57ED48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSKActionClass_0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSKActionClass_softClass_0;
  uint64_t v7 = getSKActionClass_softClass_0;
  if (!getSKActionClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSKActionClass_block_invoke_0;
    v3[3] = &unk_264DEC848;
    v3[4] = &v4;
    __getSKActionClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23B57EE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B57F348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_23B57F90C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getSKNodeClass_block_invoke(uint64_t a1)
{
  SpriteKitLibrary_0();
  Class result = objc_getClass("SKNode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    ___ZL14getSKNodeClassv_block_invoke_cold_1();
  }
  getSKNodeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SpriteKitLibrary_0()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SpriteKitLibraryCore_frameworkLibrary_2)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __SpriteKitLibraryCore_block_invoke_2;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264DECCD0;
    uint64_t v5 = 0;
    SpriteKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  uint64_t v0 = SpriteKitLibraryCore_frameworkLibrary_2;
  id v1 = (void *)v3[0];
  if (!SpriteKitLibraryCore_frameworkLibrary_2)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __SpriteKitLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  SpriteKitLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void *__getSKSetResourceBundleSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)SpriteKitLibrary_0();
  uint64_t result = dlsym(v2, "SKSetResourceBundle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSKSetResourceBundleSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSKTextureClass_block_invoke(uint64_t a1)
{
  SpriteKitLibrary_0();
  Class result = objc_getClass("SKTexture");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKTextureClass_block_invoke_cold_1();
  }
  getSKTextureClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSKShaderClass_block_invoke(uint64_t a1)
{
  SpriteKitLibrary_0();
  Class result = objc_getClass("SKShader");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKShaderClass_block_invoke_cold_1();
  }
  getSKShaderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSKUniformClass_block_invoke(uint64_t a1)
{
  SpriteKitLibrary_0();
  Class result = objc_getClass("SKUniform");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKUniformClass_block_invoke_cold_1();
  }
  getSKUniformClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSKSpriteNodeClass_block_invoke_0(uint64_t a1)
{
  SpriteKitLibrary_0();
  Class result = objc_getClass("SKSpriteNode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKSpriteNodeClass_block_invoke_cold_1();
  }
  getSKSpriteNodeClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSKActionClass_block_invoke_0(uint64_t a1)
{
  SpriteKitLibrary_0();
  Class result = objc_getClass("SKAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKActionClass_block_invoke_cold_1();
  }
  getSKActionClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_23B580F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id location)
{
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v38 - 176));
  _Unwind_Resume(a1);
}

id getSKUniformClass_0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSKUniformClass_softClass_0;
  uint64_t v7 = getSKUniformClass_softClass_0;
  if (!getSKUniformClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSKUniformClass_block_invoke_0;
    v3[3] = &unk_264DEC848;
    v3[4] = &v4;
    __getSKUniformClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23B5810B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSKActionClass_1()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSKActionClass_softClass_1;
  uint64_t v7 = getSKActionClass_softClass_1;
  if (!getSKActionClass_softClass_1)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSKActionClass_block_invoke_1;
    v3[3] = &unk_264DEC848;
    v3[4] = &v4;
    __getSKActionClass_block_invoke_1((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23B581198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B5815F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__getSKSetResourceBundleSymbolLoc_block_invoke_1(uint64_t a1)
{
  uint64_t v2 = (void *)SpriteKitLibrary_1();
  Class result = dlsym(v2, "SKSetResourceBundle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSKSetResourceBundleSymbolLoc_ptr_1 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SpriteKitLibrary_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SpriteKitLibraryCore_frameworkLibrary_3)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __SpriteKitLibraryCore_block_invoke_3;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264DECD10;
    uint64_t v5 = 0;
    SpriteKitLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  uint64_t v0 = SpriteKitLibraryCore_frameworkLibrary_3;
  id v1 = (void *)v3[0];
  if (!SpriteKitLibraryCore_frameworkLibrary_3)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __SpriteKitLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  SpriteKitLibraryCore_frameworkLibrary_3 = result;
  return result;
}

Class __getSKUniformClass_block_invoke_0(uint64_t a1)
{
  SpriteKitLibrary_1();
  Class result = objc_getClass("SKUniform");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKUniformClass_block_invoke_cold_1();
  }
  getSKUniformClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSKTextureClass_block_invoke_0(uint64_t a1)
{
  SpriteKitLibrary_1();
  Class result = objc_getClass("SKTexture");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKTextureClass_block_invoke_cold_1();
  }
  getSKTextureClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSKShaderClass_block_invoke_0(uint64_t a1)
{
  SpriteKitLibrary_1();
  Class result = objc_getClass("SKShader");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKShaderClass_block_invoke_cold_1();
  }
  getSKShaderClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSKSpriteNodeClass_block_invoke_1(uint64_t a1)
{
  SpriteKitLibrary_1();
  Class result = objc_getClass("SKSpriteNode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKSpriteNodeClass_block_invoke_cold_1();
  }
  getSKSpriteNodeClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSKActionClass_block_invoke_1(uint64_t a1)
{
  SpriteKitLibrary_1();
  Class result = objc_getClass("SKAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKActionClass_block_invoke_cold_1();
  }
  getSKActionClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id _endOfCurrentDay()
{
  uint64_t v0 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v1 = [MEMORY[0x263EFF910] date];
  uint64_t v2 = [v0 components:28 fromDate:v1];

  objc_msgSend(v2, "setDay:", objc_msgSend(v2, "day") + 1);
  uint64_t v3 = [v0 dateFromComponents:v2];

  return v3;
}

uint64_t _logUniqueSenderCount(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v10 = v1;
    if (!_logUniqueSenderCount_senderSet
      || (uint64_t v2 = (void *)_logUniqueSenderCount_endOfDay,
          [MEMORY[0x263EFF910] date],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          uint64_t v4 = [v2 compare:v3],
          v3,
          v4 == -1))
    {
      uint64_t v5 = [MEMORY[0x263EFF9C0] set];
      uint64_t v6 = (void *)_logUniqueSenderCount_senderSet;
      _logUniqueSenderCount_senderSet = v5;

      uint64_t v7 = _endOfCurrentDay();
      char v8 = (void *)_logUniqueSenderCount_endOfDay;
      _logUniqueSenderCount_endOfDay = v7;
    }
    if (([(id)_logUniqueSenderCount_senderSet containsObject:v10] & 1) == 0)
    {
      [(id)_logUniqueSenderCount_senderSet addObject:v10];
      [(id)_logUniqueSenderCount_senderSet count];
      ADClientSetValueForDistributionKey();
    }
  }

  return MEMORY[0x270F9A758]();
}

CFStringRef _createLogKeyForReceivedMessage(uint64_t a1, double a2)
{
  if (a2 < 0.0) {
    return 0;
  }
  HIDWORD(v5) = 1078853632;
  if (a2 > 60.0)
  {
    uint64_t v6 = @">60s";
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@.%@", a1, v6);
  }
  if (a2 > 30.0)
  {
    uint64_t v6 = @"30-60s";
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@.%@", a1, v6);
  }
  if (a2 > 20.0)
  {
    uint64_t v6 = @"20-30s";
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@.%@", a1, v6);
  }
  if (a2 > 10.0)
  {
    uint64_t v6 = @"10-20s";
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@.%@", a1, v6);
  }
  LODWORD(v5) = vcvtmd_s64_f64(a2);
  LODWORD(v2) = vcvtpd_s64_f64(a2);
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%d-%ds", v5, v2);
  CFStringRef v9 = CFStringCreateWithFormat(v7, 0, @"%@.%@", a1, v8);
  CFRelease(v8);
  return v9;
}

void ETAggdLogMessageReceived(uint64_t a1, unsigned int a2, void *a3, double a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (a4 != 0.0)
  {
    double v8 = CFAbsoluteTimeGetCurrent() - a4;
    if (a1 == 1) {
      CFStringRef v9 = @"com.apple.et.message.received.transportTime.toApp";
    }
    else {
      CFStringRef v9 = @"com.apple.et.message.received.transportTime.toDaemon";
    }
    CFStringRef LogKeyForReceivedMessage = _createLogKeyForReceivedMessage((uint64_t)v9, v8);
    if (LogKeyForReceivedMessage)
    {
      CFStringRef v11 = LogKeyForReceivedMessage;
      if (IMOSLoggingEnabled())
      {
        unint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v13 = 138412546;
          CFStringRef v14 = v11;
          __int16 v15 = 2048;
          double v16 = v8;
          _os_log_impl(&dword_23B55A000, v12, OS_LOG_TYPE_INFO, "Aggd Log Key %@ : transportTime is %f", (uint8_t *)&v13, 0x16u);
        }
      }
      ADClientAddValueForScalarKey();
      CFRelease(v11);
    }
    if (!a1)
    {
      if (a2 <= 8 && ((0x147u >> a2) & 1) != 0) {
        ADClientAddValueForScalarKey();
      }
      _logUniqueSenderCount(v7);
    }
  }
}

void sub_23B582148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B582BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ET_SKSetResourceBundle(void *a1)
{
  id v1 = a1;
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v2 = (void (*)(id))getSKSetResourceBundleSymbolLoc_ptr_2;
  id v7 = getSKSetResourceBundleSymbolLoc_ptr_2;
  if (!getSKSetResourceBundleSymbolLoc_ptr_2)
  {
    uint64_t v3 = (void *)SpriteKitLibrary_2();
    v5[3] = (uint64_t)dlsym(v3, "SKSetResourceBundle");
    getSKSetResourceBundleSymbolLoc_ptr_2 = (_UNKNOWN *)v5[3];
    uint64_t v2 = (void (*)(id))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v2) {
    -[ETMessage displayInScene:]();
  }
  v2(v1);
}

void sub_23B582CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSKUniformClass_1()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSKUniformClass_softClass_1;
  uint64_t v7 = getSKUniformClass_softClass_1;
  if (!getSKUniformClass_softClass_1)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSKUniformClass_block_invoke_1;
    v3[3] = &unk_264DEC848;
    v3[4] = &v4;
    __getSKUniformClass_block_invoke_1((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23B582DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B583444(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

id getSKActionClass_2()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSKActionClass_softClass_2;
  uint64_t v7 = getSKActionClass_softClass_2;
  if (!getSKActionClass_softClass_2)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSKActionClass_block_invoke_2;
    v3[3] = &unk_264DEC848;
    v3[4] = &v4;
    __getSKActionClass_block_invoke_2((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23B583570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23B583FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_23B584408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

Class __getSKSpriteNodeClass_block_invoke_2(uint64_t a1)
{
  SpriteKitLibrary_2();
  Class result = objc_getClass("SKSpriteNode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKSpriteNodeClass_block_invoke_cold_1();
  }
  getSKSpriteNodeClass_softClass_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SpriteKitLibrary_2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SpriteKitLibraryCore_frameworkLibrary_4)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __SpriteKitLibraryCore_block_invoke_4;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264DECE98;
    uint64_t v5 = 0;
    SpriteKitLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  }
  uint64_t v0 = SpriteKitLibraryCore_frameworkLibrary_4;
  id v1 = (void *)v3[0];
  if (!SpriteKitLibraryCore_frameworkLibrary_4)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __SpriteKitLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  SpriteKitLibraryCore_frameworkLibrary_4 = result;
  return result;
}

void *__getSKSetResourceBundleSymbolLoc_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)SpriteKitLibrary_2();
  uint64_t result = dlsym(v2, "SKSetResourceBundle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSKSetResourceBundleSymbolLoc_ptr_2 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSKTextureClass_block_invoke_1(uint64_t a1)
{
  SpriteKitLibrary_2();
  Class result = objc_getClass("SKTexture");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKTextureClass_block_invoke_cold_1();
  }
  getSKTextureClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSKUniformClass_block_invoke_1(uint64_t a1)
{
  SpriteKitLibrary_2();
  Class result = objc_getClass("SKUniform");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKUniformClass_block_invoke_cold_1();
  }
  getSKUniformClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSKActionClass_block_invoke_2(uint64_t a1)
{
  SpriteKitLibrary_2();
  Class result = objc_getClass("SKAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKActionClass_block_invoke_cold_1();
  }
  getSKActionClass_softClass_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSKShaderClass_block_invoke_1(uint64_t a1)
{
  SpriteKitLibrary_2();
  Class result = objc_getClass("SKShader");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSKShaderClass_block_invoke_cold_1();
  }
  getSKShaderClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_23B586558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_23B5872C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSKViewClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getSKSceneClass_block_invoke_cold_1(v0);
}

void __getSKSceneClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[ETMessage displayInScene:](v0);
}

void __getSKSpriteNodeClass_block_invoke_cold_1()
{
}

void __getSKActionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  ___ZL19getSKFieldNodeClassv_block_invoke_cold_1(v0);
}

void ___ZL19getSKFieldNodeClassv_block_invoke_cold_1()
{
}

void ___ZL14getSKNodeClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  ___ZL19getSKShapeNodeClassv_block_invoke_cold_1(v0);
}

void ___ZL19getSKShapeNodeClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  ___ZL21getSKEmitterNodeClassv_block_invoke_cold_1(v0);
}

void ___ZL21getSKEmitterNodeClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  ___ZL26getSKKeyframeSequenceClassv_block_invoke_cold_1(v0);
}

void ___ZL26getSKKeyframeSequenceClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getSKTextureClass_block_invoke_cold_1(v0);
}

void __getSKTextureClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getSKShaderClass_block_invoke_cold_1(v0);
}

void __getSKShaderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getSKUniformClass_block_invoke_cold_1(v0);
}

void __getSKUniformClass_block_invoke_cold_1()
{
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x270F0B6B0]();
}

uint64_t ADClientSetValueForDistributionKey()
{
  return MEMORY[0x270F0B6D0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x270EE5B98](color1, color2);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7F08](retstr, lhs, rhs);
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x270F3CE08]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x270F3CF00]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x270F58540]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteFixed32Field()
{
  return MEMORY[0x270F58550]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x270F58558]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteSfixed64Field()
{
  return MEMORY[0x270F58578]();
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

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x270F061F0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F06270]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
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

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
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

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
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

double drand48(void)
{
  MEMORY[0x270ED9670]();
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
}

void free(void *a1)
{
}

void glAttachShader(GLuint program, GLuint shader)
{
}

void glBindBuffer(GLenum target, GLuint buffer)
{
}

void glBindFramebuffer(GLenum target, GLuint framebuffer)
{
}

void glBindRenderbuffer(GLenum target, GLuint renderbuffer)
{
}

void glBindTexture(GLenum target, GLuint texture)
{
}

uint64_t glBindVertexArrayOES()
{
  return MEMORY[0x270EF97E0]();
}

void glBlendFunc(GLenum sfactor, GLenum dfactor)
{
}

void glBufferData(GLenum target, GLsizeiptr size, const GLvoid *data, GLenum usage)
{
}

void glBufferSubData(GLenum target, GLintptr offset, GLsizeiptr size, const GLvoid *data)
{
}

GLenum glCheckFramebufferStatus(GLenum target)
{
  return MEMORY[0x270EF9828](*(void *)&target);
}

void glClear(GLbitfield mask)
{
}

void glCompileShader(GLuint shader)
{
}

GLuint glCreateProgram(void)
{
  return MEMORY[0x270EF9868]();
}

GLuint glCreateShader(GLenum type)
{
  return MEMORY[0x270EF9870](*(void *)&type);
}

void glDeleteBuffers(GLsizei n, const GLuint *buffers)
{
}

void glDeleteFramebuffers(GLsizei n, const GLuint *framebuffers)
{
}

void glDeleteRenderbuffers(GLsizei n, const GLuint *renderbuffers)
{
}

void glDeleteShader(GLuint shader)
{
}

uint64_t glDeleteVertexArraysOES()
{
  return MEMORY[0x270EF98B8]();
}

void glDetachShader(GLuint program, GLuint shader)
{
}

uint64_t glDiscardFramebufferEXT()
{
  return MEMORY[0x270EF98E0]();
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
}

void glEnable(GLenum cap)
{
}

void glEnableVertexAttribArray(GLuint index)
{
}

void glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)
{
}

void glGenBuffers(GLsizei n, GLuint *buffers)
{
}

void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
{
}

void glGenRenderbuffers(GLsizei n, GLuint *renderbuffers)
{
}

void glGenTextures(GLsizei n, GLuint *textures)
{
}

uint64_t glGenVertexArraysOES()
{
  return MEMORY[0x270EF9960]();
}

GLenum glGetError(void)
{
  return MEMORY[0x270EF9990]();
}

void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
{
}

void glGetRenderbufferParameteriv(GLenum target, GLenum pname, GLint *params)
{
}

void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
{
}

void glLinkProgram(GLuint program)
{
}

void glPixelStorei(GLenum pname, GLint param)
{
}

void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels)
{
}

void glRenderbufferStorage(GLenum target, GLenum internalformat, GLsizei width, GLsizei height)
{
}

void glShaderSource(GLuint shader, GLsizei count, const GLchar *const *string, const GLint *length)
{
}

void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
{
}

void glTexParameteri(GLenum target, GLenum pname, GLint param)
{
}

void glUseProgram(GLuint program)
{
}

void glVertexAttrib1f(GLuint indx, GLfloat x)
{
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
}

void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

float hypotf(float a1, float a2)
{
  MEMORY[0x270ED9E60](a1, a2);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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
  return (Class)MEMORY[0x270F9A658](name);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t srdnoise2()
{
  return MEMORY[0x270F54168]();
}