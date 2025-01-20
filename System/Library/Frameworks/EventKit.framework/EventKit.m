void EKLogInitIfNeeded()
{
  if (EKLogInitIfNeeded_onceToken != -1) {
    dispatch_once(&EKLogInitIfNeeded_onceToken, &__block_literal_global_84);
  }
}

void sub_1A4E4A71C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4E4AAD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E4AEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E4DAF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E4DD84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _bitmaskContainsOption(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

{
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

{
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1A6266730](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1A4E4E9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E4FD24(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A4E505C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4E50DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E50F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id EKObjectIDFromDictionary()
{
  uint64_t v3 = 0;
  if (CalGetEntityIDFromFetchedObjectDictonary())
  {
    v0 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      EKObjectIDFromDictionary_cold_1((int *)&v3 + 1, (int *)&v3, v0);
    }
  }
  else
  {
    uint64_t v1 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      EKObjectIDFromDictionary_cold_2(v1);
    }
  }

  return 0;
}

void sub_1A4E51C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4E51F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E5210C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E53118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E53C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E54610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4E54A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E56414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E56590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E58C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E5BA94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E5C2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t restrictDateRange(void *a1, id *a2)
{
  id v3 = a1;
  if (v3)
  {
    if (a2)
    {
      v6 = v3;
      [*a2 timeIntervalSinceDate:v3];
      if (v4 > 126230400.0)
      {
        objc_msgSend(v6, "dateByAddingTimeInterval:");
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return MEMORY[0x1F41817F8]();
}

void sub_1A4E5F1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E5F44C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4E5F564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E5F9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E607DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Unwind_Resume(a1);
}

void sub_1A4E60A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E60DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1A4E61748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E61B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4E61D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E62980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E63284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A4E63488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E635AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E64528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4E64D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  objc_destroyWeak(v13);
  objc_destroyWeak(v14);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v15 - 128));
  _Unwind_Resume(a1);
}

void sub_1A4E64FD8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4E65348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4E65960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

id getREMStoreClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getREMStoreClass_softClass;
  uint64_t v7 = getREMStoreClass_softClass;
  if (!getREMStoreClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getREMStoreClass_block_invoke;
    v3[3] = &unk_1E5B969D8;
    v3[4] = &v4;
    __getREMStoreClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A4E65CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getREMStoreClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary_1();
  Class result = objc_getClass("REMStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMStoreClass_block_invoke_cold_1();
  }
  getREMStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ReminderKitLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __ReminderKitLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5B969F8;
    uint64_t v2 = 0;
    ReminderKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary) {
    ReminderKitLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

void ReminderKitLibrary_0()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_0)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __ReminderKitLibraryCore_block_invoke_0;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5B96AD8;
    uint64_t v2 = 0;
    ReminderKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_0) {
    ReminderKitLibrary_cold_1_0(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t ReminderKitLibrary_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_1)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __ReminderKitLibraryCore_block_invoke_1;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5B97200;
    uint64_t v4 = 0;
    ReminderKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = ReminderKitLibraryCore_frameworkLibrary_1;
  if (!ReminderKitLibraryCore_frameworkLibrary_1) {
    ReminderKitLibrary_cold_1_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

void ReminderKitLibrary_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_3)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __ReminderKitLibraryCore_block_invoke_3;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5B97F30;
    uint64_t v2 = 0;
    ReminderKitLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_3) {
    ReminderKitLibrary_cold_1_2(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

void ReminderKitLibrary_3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_5)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __ReminderKitLibraryCore_block_invoke_5;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5B9A728;
    uint64_t v2 = 0;
    ReminderKitLibraryCore_frameworkLibrary_5 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_5) {
    ReminderKitLibrary_cold_1_3(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

void sub_1A4E6684C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return v0;
}

void OUTLINED_FUNCTION_2_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

double __GetSharedLockForIndex_block_invoke()
{
  double result = 0.0;
  GetSharedLockForIndex_sharedLocks = 0u;
  *(_OWORD *)algn_1EB474770 = 0u;
  return result;
}

void sub_1A4E6A0F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __EKLogInitIfNeeded_block_invoke()
{
  os_log_t v0 = os_log_create(ekSubSystem, "EventKit");
  long long v1 = (void *)EKLogHandle;
  EKLogHandle = (uint64_t)v0;

  os_log_t v2 = os_log_create(ekSubSystem, "Availability");
  uint64_t v3 = (void *)EKAvailabilityHandle;
  EKAvailabilityHandle = (uint64_t)v2;

  os_log_t v4 = os_log_create(ekSubSystem, "UIAvailabilitySearch");
  uint64_t v5 = (void *)EKUIAvailabilitySearchHandle;
  EKUIAvailabilitySearchHandle = (uint64_t)v4;

  EKSavingSignpostsHandle = (uint64_t)os_log_create(ekSubSystem, "Saving");

  return MEMORY[0x1F41817F8]();
}

void sub_1A4E6BF1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4E6C698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E6D950(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose(&STACK[0x3E0], 8);
  _Block_object_dispose(&STACK[0x410], 8);
  _Block_object_dispose(&STACK[0x440], 8);
  _Block_object_dispose(&STACK[0x470], 8);
  _Block_object_dispose(&STACK[0x4A0], 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id getREMListClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getREMListClass_softClass;
  uint64_t v7 = getREMListClass_softClass;
  if (!getREMListClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getREMListClass_block_invoke;
    v3[3] = &unk_1E5B969D8;
    v3[4] = &v4;
    __getREMListClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A4E71EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getREMColorClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getREMColorClass_softClass;
  uint64_t v7 = getREMColorClass_softClass;
  if (!getREMColorClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getREMColorClass_block_invoke;
    v3[3] = &unk_1E5B969D8;
    v3[4] = &v4;
    __getREMColorClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A4E72388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getREMListClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary();
  Class result = objc_getClass("REMList");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMListClass_block_invoke_cold_1();
  }
  getREMListClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ReminderKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ReminderKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getREMColorClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary();
  Class result = objc_getClass("REMColor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMColorClass_block_invoke_cold_1();
  }
  getREMColorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getREMReminderClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getREMReminderClass_softClass;
  uint64_t v7 = getREMReminderClass_softClass;
  if (!getREMReminderClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getREMReminderClass_block_invoke;
    v3[3] = &unk_1E5B969D8;
    v3[4] = &v4;
    __getREMReminderClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A4E73714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getREMUserActivityClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getREMUserActivityClass_softClass;
  uint64_t v7 = getREMUserActivityClass_softClass;
  if (!getREMUserActivityClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getREMUserActivityClass_block_invoke;
    v3[3] = &unk_1E5B969D8;
    v3[4] = &v4;
    __getREMUserActivityClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A4E741A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E744D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getREMReminderClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary_0();
  Class result = objc_getClass("REMReminder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMReminderClass_block_invoke_cold_1();
  }
  getREMReminderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ReminderKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ReminderKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getREMUserActivityClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary_0();
  Class result = objc_getClass("REMUserActivity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMUserActivityClass_block_invoke_cold_1();
  }
  getREMUserActivityClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMReminderChangeItemClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary_0();
  Class result = objc_getClass("REMReminderChangeItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMReminderChangeItemClass_block_invoke_cold_1();
  }
  getREMReminderChangeItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A4E776C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1A4E78138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double OUTLINED_FUNCTION_0_2(double a1, double a2)
{
  return a1 / a2;
}

void sub_1A4E796B0(void *a1)
{
  objc_begin_catch(a1);

  objc_end_catch();
  JUMPOUT(0x1A4E79560);
}

void sub_1A4E797E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E7FDBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E7FFE8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4E80380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_0_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return a10;
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1A4E81DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E82154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E82BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_1A4E832CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getREMListClass_0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getREMListClass_softClass_0;
  uint64_t v7 = getREMListClass_softClass_0;
  if (!getREMListClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getREMListClass_block_invoke_0;
    v3[3] = &unk_1E5B969D8;
    v3[4] = &v4;
    __getREMListClass_block_invoke_0((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A4E8342C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E84250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

id getREMReminderClass_0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getREMReminderClass_softClass_0;
  uint64_t v7 = getREMReminderClass_softClass_0;
  if (!getREMReminderClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getREMReminderClass_block_invoke_0;
    v3[3] = &unk_1E5B969D8;
    v3[4] = &v4;
    __getREMReminderClass_block_invoke_0((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A4E84404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E8544C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
}

void sub_1A4E85984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t __Block_byref_object_copy__56(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1A6266730](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__57(uint64_t a1)
{
}

void sub_1A4E869A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

void sub_1A4E86CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E86F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1A4E875D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E87814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __ReminderKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  ReminderKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getREMListClass_block_invoke_0(uint64_t a1)
{
  ReminderKitLibrary_1();
  Class result = objc_getClass("REMList");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMListClass_block_invoke_cold_1_0();
  }
  getREMListClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMReminderClass_block_invoke_0(uint64_t a1)
{
  ReminderKitLibrary_1();
  Class result = objc_getClass("REMReminder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMReminderClass_block_invoke_cold_1_0();
  }
  getREMReminderClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMSaveRequestClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary_1();
  Class result = objc_getClass("REMSaveRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMSaveRequestClass_block_invoke_cold_1();
  }
  getREMSaveRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMAccountClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary_1();
  Class result = objc_getClass("REMAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMAccountClass_block_invoke_cold_1();
  }
  getREMAccountClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMAlarmClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary_1();
  Class result = objc_getClass("REMAlarm");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMAlarmClass_block_invoke_cold_1();
  }
  getREMAlarmClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMRecurrenceRuleClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary_1();
  Class result = objc_getClass("REMRecurrenceRule");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMRecurrenceRuleClass_block_invoke_cold_1();
  }
  getREMRecurrenceRuleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMStructuredLocationClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary_1();
  Class result = objc_getClass("REMStructuredLocation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMStructuredLocationClass_block_invoke_cold_1();
  }
  getREMStructuredLocationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getREMErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  os_log_t v2 = (void *)ReminderKitLibrary_1();
  Class result = dlsym(v2, "REMErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getREMErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A4E8A4D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E8A864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E8BF9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1A4E8C254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1A4E8C7E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,id a23)
{
}

Class __getCNAutocompleteStoreClass_block_invoke(uint64_t a1)
{
  ContactsAutocompleteLibrary();
  Class result = objc_getClass("CNAutocompleteStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNAutocompleteStoreClass_block_invoke_cold_1();
  }
  getCNAutocompleteStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ContactsAutocompleteLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!ContactsAutocompleteLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __ContactsAutocompleteLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5B97370;
    uint64_t v2 = 0;
    ContactsAutocompleteLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ContactsAutocompleteLibraryCore_frameworkLibrary) {
    ContactsAutocompleteLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __ContactsAutocompleteLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsAutocompleteLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCNAutocompleteFetchRequestClass_block_invoke(uint64_t a1)
{
  ContactsAutocompleteLibrary();
  Class result = objc_getClass("CNAutocompleteFetchRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNAutocompleteFetchRequestClass_block_invoke_cold_1();
  }
  getCNAutocompleteFetchRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNAutocompleteNameComponentsClass_block_invoke(uint64_t a1)
{
  ContactsAutocompleteLibrary();
  Class result = objc_getClass("CNAutocompleteNameComponents");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNAutocompleteNameComponentsClass_block_invoke_cold_1();
  }
  getCNAutocompleteNameComponentsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNAutocompleteResultClass_block_invoke(uint64_t a1)
{
  ContactsAutocompleteLibrary();
  Class result = objc_getClass("CNAutocompleteResult");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNAutocompleteResultClass_block_invoke_cold_1();
  }
  getCNAutocompleteResultClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A4E8DDC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4E8F014(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id rangesSafeToRemove(void *a1)
{
  uint64_t v1 = [a1 underlyingResult];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  _recursiveSafeRangesToRemoveFromResult(v1, v2);
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

void _recursiveSafeRangesToRemoveFromResult(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v2 = DDResultGetType();
  if (([@"ApproxTime" isEqualToString:v2] & 1) == 0
    && ([@"SpecialDateTime" isEqualToString:v2] & 1) == 0)
  {
    if (resultHasApproxTime())
    {
      CFArrayRef SubResults = (const __CFArray *)DDResultGetSubResults();
      if (SubResults)
      {
        CFArrayRef v4 = SubResults;
        CFIndex Count = CFArrayGetCount(SubResults);
        if (Count >= 1)
        {
          CFIndex v6 = Count;
          for (CFIndex i = 0; i != v6; ++i)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
            _recursiveSafeRangesToRemoveFromResult(ValueAtIndex, v12);
          }
        }
      }
    }
    else
    {
      uint64_t Range = DDResultGetRange();
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", Range, v10);
      [v12 addObject:v11];
    }
  }
}

uint64_t resultHasApproxTime()
{
  CFArrayRef SubResults = (const __CFArray *)DDResultGetSubResults();
  if (!SubResults) {
    return 0;
  }
  CFArrayRef v1 = SubResults;
  CFIndex Count = CFArrayGetCount(SubResults);
  CFIndex v3 = Count - 1;
  if (Count < 1) {
    return 0;
  }
  CFIndex v4 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v1, v4);
    CFIndex v6 = DDResultGetType();
    if (([@"ApproxTime" isEqualToString:v6] & 1) != 0
      || [@"SpecialDateTime" isEqualToString:v6])
    {
      break;
    }
    uint64_t HasApproxTime = resultHasApproxTime(ValueAtIndex);

    if ((HasApproxTime & 1) == 0 && v3 != v4++) {
      continue;
    }
    return HasApproxTime;
  }

  return 1;
}

uint64_t resultHasExactTime()
{
  CFArrayRef SubResults = (const __CFArray *)DDResultGetSubResults();
  if (!SubResults) {
    return 0;
  }
  CFArrayRef v1 = SubResults;
  CFIndex Count = CFArrayGetCount(SubResults);
  CFIndex v3 = Count - 1;
  if (Count < 1) {
    return 0;
  }
  CFIndex v4 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v1, v4);
    CFIndex v6 = DDResultGetType();
    if ((([@"Time" isEqualToString:v6] & 1) != 0
       || [@"TimeDuration" isEqualToString:v6])
      && (resultHasApproxTime() & 1) == 0)
    {
      break;
    }
    uint64_t HasExactTime = resultHasExactTime(ValueAtIndex);

    if ((HasExactTime & 1) == 0 && v3 != v4++) {
      continue;
    }
    return HasExactTime;
  }

  return 1;
}

void sub_1A4E91CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E92764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t OUTLINED_FUNCTION_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5()
{
  return v0;
}

__CFString *EKAvailabilitySpanTypeAsString(unint64_t a1)
{
  if (a1 > 7) {
    return 0;
  }
  else {
    return off_1E5B975F0[a1];
  }
}

void sub_1A4E97D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getREMStructuredLocationClass_block_invoke_0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_2)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __ReminderKitLibraryCore_block_invoke_2;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5B97658;
    uint64_t v5 = 0;
    ReminderKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_2) {
    __getREMStructuredLocationClass_block_invoke_cold_1_0(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("REMStructuredLocation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMStructuredLocationClass_block_invoke_cold_2();
  }
  getREMStructuredLocationClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ReminderKitLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  ReminderKitLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void sub_1A4E9AD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E9C538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA110C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA1944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA1B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA1DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA209C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void EKTravelEngineLogInitialize()
{
  if (EKTravelEngineLogInitialize_onceToken != -1) {
    dispatch_once(&EKTravelEngineLogInitialize_onceToken, &__block_literal_global_27);
  }
}

uint64_t __EKTravelEngineLogInitialize_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar", "store.log.travel.engine");
  CFArrayRef v1 = (void *)EKTravelEngineLogHandle;
  EKTravelEngineLogHandle = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.calendar", "store.log.travel.engine.throttle");
  uint64_t v3 = EKTravelEngineThrottleLogHandle;
  EKTravelEngineThrottleLogHandle = (uint64_t)v2;

  return MEMORY[0x1F41817F8](v2, v3);
}

void sub_1A4EA5E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA5F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA60D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA6254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA63D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA6554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA6690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA679C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EA7A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *a10, id *a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,id a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a64);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)&STACK[0x2B0]);
  _Unwind_Resume(a1);
}

void sub_1A4EA89D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(&a21);
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  _Unwind_Resume(a1);
}

void sub_1A4EABE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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
  _Block_object_dispose((const void *)(v11 - 160), 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_10(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1A4EACAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EAE828(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A4EB1728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EB35D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A4EB5880(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1A4EB84DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EB88C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EBAC94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4EBD480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id getREMRecurrenceEndClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getREMRecurrenceEndClass_softClass;
  uint64_t v7 = getREMRecurrenceEndClass_softClass;
  if (!getREMRecurrenceEndClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getREMRecurrenceEndClass_block_invoke;
    v3[3] = &unk_1E5B969D8;
    v3[4] = &v4;
    __getREMRecurrenceEndClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A4EBEFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getREMRecurrenceRuleClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getREMRecurrenceRuleClass_softClass_0;
  uint64_t v7 = getREMRecurrenceRuleClass_softClass_0;
  if (!getREMRecurrenceRuleClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getREMRecurrenceRuleClass_block_invoke_0;
    v3[3] = &unk_1E5B969D8;
    v3[4] = &v4;
    __getREMRecurrenceRuleClass_block_invoke_0((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A4EBF0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EBFBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getREMRecurrenceEndClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary_2();
  Class result = objc_getClass("REMRecurrenceEnd");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMRecurrenceEndClass_block_invoke_cold_1();
  }
  getREMRecurrenceEndClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ReminderKitLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  ReminderKitLibraryCore_frameworkLibrary_3 = result;
  return result;
}

Class __getREMRecurrenceRuleClass_block_invoke_0(uint64_t a1)
{
  ReminderKitLibrary_2();
  Class result = objc_getClass("REMRecurrenceRule");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMRecurrenceRuleClass_block_invoke_cold_1_0();
  }
  getREMRecurrenceRuleClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMRecurrenceDayOfWeekClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary_2();
  Class result = objc_getClass("REMRecurrenceDayOfWeek");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMRecurrenceDayOfWeekClass_block_invoke_cold_1();
  }
  getREMRecurrenceDayOfWeekClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A4EC4528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EC69C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EC6E40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EC8898(_Unwind_Exception *a1)
{
}

id logHandle()
{
  if (logHandle_onceToken_0 != -1) {
    dispatch_once(&logHandle_onceToken_0, &__block_literal_global_48);
  }
  os_log_t v0 = (void *)logHandle_handle;

  return v0;
}

uint64_t __logHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.eventkit", "EKPredicateExpanding");
  uint64_t v1 = logHandle_handle;
  logHandle_handle = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1A4ECAAA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ECAE08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ECAF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ECB0B4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1A4ECB398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1A6266730](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1A4ECB4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

void sub_1A4ECEF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ED0118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ED1A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ED1D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1A4ED4C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A4ED4DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EDF428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EE7090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EE7368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4EE94D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1A4EE9D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1A4EED978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1A4EF302C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getREMReminderClass_block_invoke_1(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_4)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __ReminderKitLibraryCore_block_invoke_4;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5B98C98;
    uint64_t v5 = 0;
    ReminderKitLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_4) {
    __getREMReminderClass_block_invoke_cold_1_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("REMReminder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMReminderClass_block_invoke_cold_2();
  }
  getREMReminderClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ReminderKitLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  ReminderKitLibraryCore_frameworkLibrary_4 = result;
  return result;
}

void *__getkSuggestionsEKEventAvailabilityStateSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreSuggestionsLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __CoreSuggestionsLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5B98CB0;
    uint64_t v6 = 0;
    CoreSuggestionsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  os_log_t v2 = (void *)CoreSuggestionsLibraryCore_frameworkLibrary;
  if (!CoreSuggestionsLibraryCore_frameworkLibrary) {
    __getkSuggestionsEKEventAvailabilityStateSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "kSuggestionsEKEventAvailabilityState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSuggestionsEKEventAvailabilityStateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreSuggestionsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreSuggestionsLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_10_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

int64_t CalAttendeeStatusToEKParticipantStatus(uint64_t a1)
{
  return +[EKAttendee _ekParticipantStatusFromCalAttendeeStatus:a1];
}

uint64_t EKParticipantStatusToCalAttendeeStatus(uint64_t a1)
{
  return +[EKAttendee _calAttendeeStatusFromEKParticipantStatus:a1];
}

void sub_1A4EFB4C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4EFBE5C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4EFDC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_1A4F00E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F01118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F01B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A4F02F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F037D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F05944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F065A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

id OUTLINED_FUNCTION_3_2(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return v0;
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_1A4F08974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4F0CF30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F0D0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F0D834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F0FDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return v0;
}

void OUTLINED_FUNCTION_10_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id gondolaDefaultExtensionName()
{
  uint64_t v0 = EKBundle();
  uint64_t v1 = [v0 localizedStringForKey:@"FaceTime" value:&stru_1EF932508 table:0];

  return v1;
}

void sub_1A4F13940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

void sub_1A4F14704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F14DFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4F18500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F1A0A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1A4F1C008(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4F1C7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A4F1CA70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4F21674(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A4F276FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F27A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F28118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4F29184(_Unwind_Exception *a1)
{
}

void sub_1A4F2A1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F2AF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F2B0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F2B66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F2B890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A4F2BC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4F2CB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F2CD48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F2D6F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F2D884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F2DFD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1A4F2E3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F300EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F30860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F30B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F30E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F31220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F314AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F316D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F31E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F32D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_1A4F32F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F330EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F334EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F33B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F343E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F366B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F369E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F36D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F37674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1A4F37848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F37A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3811C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F39080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1A4F394A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F39630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F39BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3A330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3A52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3A7AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3A910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3B328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3B9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3BFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3C2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3C864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3CA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3CDBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3D288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3D5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F3FA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F40E28(_Unwind_Exception *a1)
{
}

void sub_1A4F4177C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1A4F42600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F42B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_1A4F43348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4452C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4591C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F45B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F45D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4818C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F483FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4F485C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F49450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F495B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F497A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F49A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F49E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4A594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4A878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4AC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4AD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4AEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4B728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4F4BA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _shouldUseLegacyAccessBehavior()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (_shouldUseLegacyAccessBehavior_onceToken != -1) {
    dispatch_once(&_shouldUseLegacyAccessBehavior_onceToken, &__block_literal_global_1521);
  }
  if (_shouldUseLegacyAccessBehavior_forceLegacyBehavior)
  {
    uint64_t v0 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v4[0]) = 0;
      _os_log_impl(&dword_1A4E47000, v0, OS_LOG_TYPE_DEFAULT, "Forcing legacy access behavior.", (uint8_t *)v4, 2u);
    }
    return 1;
  }
  else
  {
    uint64_t v1 = [MEMORY[0x1E4F57690] isProgramSDKAtLeast:0x7E70901FFFFFFFFLL] ^ 1;
    os_log_t v2 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      v4[0] = 67109120;
      v4[1] = v1;
      _os_log_impl(&dword_1A4E47000, v2, OS_LOG_TYPE_INFO, "Using legacy access behavior: %{BOOL}d", (uint8_t *)v4, 8u);
    }
  }
  return v1;
}

void ___shouldUseLegacyAccessBehavior_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v0 infoDictionary];
  id v4 = [v1 objectForKey:@"com.apple.private.calendar.has-adopted-modern-request-access-methods"];

  os_log_t v2 = v4;
  if (v4)
  {
    char v3 = [v4 BOOLValue] ^ 1;
    os_log_t v2 = v4;
    _shouldUseLegacyAccessBehavior_forceLegacyBehavior = v3;
  }
}

void OUTLINED_FUNCTION_7_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_18(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return v0;
}

void OUTLINED_FUNCTION_26(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_5_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x280], 8) = a1;
}

id getREMAlarmTimeIntervalTriggerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getREMAlarmTimeIntervalTriggerClass_softClass;
  uint64_t v7 = getREMAlarmTimeIntervalTriggerClass_softClass;
  if (!getREMAlarmTimeIntervalTriggerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getREMAlarmTimeIntervalTriggerClass_block_invoke;
    v3[3] = &unk_1E5B969D8;
    v3[4] = &v4;
    __getREMAlarmTimeIntervalTriggerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A4F50558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getREMAlarmDateTriggerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getREMAlarmDateTriggerClass_softClass;
  uint64_t v7 = getREMAlarmDateTriggerClass_softClass;
  if (!getREMAlarmDateTriggerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getREMAlarmDateTriggerClass_block_invoke;
    v3[3] = &unk_1E5B969D8;
    v3[4] = &v4;
    __getREMAlarmDateTriggerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A4F5063C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getREMAlarmLocationTriggerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getREMAlarmLocationTriggerClass_softClass;
  uint64_t v7 = getREMAlarmLocationTriggerClass_softClass;
  if (!getREMAlarmLocationTriggerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getREMAlarmLocationTriggerClass_block_invoke;
    v3[3] = &unk_1E5B969D8;
    v3[4] = &v4;
    __getREMAlarmLocationTriggerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A4F50720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getREMAlarmTimeIntervalTriggerClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary_3();
  Class result = objc_getClass("REMAlarmTimeIntervalTrigger");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMAlarmTimeIntervalTriggerClass_block_invoke_cold_1();
  }
  getREMAlarmTimeIntervalTriggerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ReminderKitLibraryCore_block_invoke_5()
{
  uint64_t result = _sl_dlopen();
  ReminderKitLibraryCore_frameworkLibrary_5 = result;
  return result;
}

Class __getREMAlarmDateTriggerClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary_3();
  Class result = objc_getClass("REMAlarmDateTrigger");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMAlarmDateTriggerClass_block_invoke_cold_1();
  }
  getREMAlarmDateTriggerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMAlarmLocationTriggerClass_block_invoke(uint64_t a1)
{
  ReminderKitLibrary_3();
  Class result = objc_getClass("REMAlarmLocationTrigger");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREMAlarmLocationTriggerClass_block_invoke_cold_1();
  }
  getREMAlarmLocationTriggerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_1_10()
{
  return objc_opt_class();
}

id EKBundle()
{
  if (EKBundle_onceToken != -1) {
    dispatch_once(&EKBundle_onceToken, &__block_literal_global_82);
  }
  uint64_t v0 = (void *)EKBundle_eventKitBundle;

  return v0;
}

uint64_t __EKBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.eventkit"];
  uint64_t v1 = EKBundle_eventKitBundle;
  EKBundle_eventKitBundle = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t EKAutoCommentPrefix()
{
  return [NSString CalAutoCommentPrefix];
}

BOOL _bitmaskExclusivelyMatchesOption(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

id EKUtils_AdjustedAttendeeAddress(void *a1)
{
  id v1 = a1;
  os_log_t v2 = v1;
  if (v1)
  {
    if ([v1 length])
    {
      if ([v2 hasPrefix:@"mailto:"]) {
        [v2 substringFromIndex:7];
      }
      else {
      id v3 = [NSString stringWithFormat:@"%@%@", @"mailto:", v2];
      }
    }
    else
    {
      id v3 = v2;
    }
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v4 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      EKUtils_AdjustedAttendeeAddress_cold_1(v4);
    }
    uint64_t v5 = 0;
  }

  return v5;
}

BOOL EKUIAttendeeUtils_AttendeeHasResponded(void *a1)
{
  id v1 = a1;
  os_log_t v2 = v1;
  if (v1)
  {
    BOOL v3 = (unint64_t)[v1 participantStatus] > 1;
  }
  else
  {
    uint64_t v4 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      EKUIAttendeeUtils_AttendeeHasResponded_cold_1(v4);
    }
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t identityIsEqualToIdentity(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v4 emailAddress];
  uint64_t v6 = [v4 phoneNumber];
  uint64_t v7 = [v4 URL];

  uint64_t v8 = [v3 emailAddress];
  uint64_t v9 = [v3 phoneNumber];
  uint64_t v10 = [v3 URL];

  uint64_t v11 = [v7 absoluteString];
  uint64_t v12 = [v10 absoluteString];
  uint64_t v13 = doURLsEmailsPhoneNumbersMatch();

  return v13;
}

__CFString *EKRedaction(const void *a1, CC_LONG a2, const void *a3, CC_LONG a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(&v12, 0, sizeof(v12));
  CC_SHA256_Init(&v12);
  if (a3 && a4)
  {
    CC_SHA256_Update(&v12, a3, a4);
LABEL_5:
    CC_SHA256_Update(&v12, a1, a2);
    CC_SHA256_Final(md, &v12);
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:md length:6 freeWhenDone:0];
    uint64_t v9 = [v8 base64EncodedDataWithOptions:0];
    char v13 = 62;
    [v9 getBytes:v14 length:8];
    v14[4] = 60;
    uint64_t v10 = [NSString stringWithUTF8String:&v13];

    goto LABEL_7;
  }
  if (os_variant_has_internal_diagnostics()) {
    goto LABEL_5;
  }
  CC_SHA256_Final(md, &v12);
  uint64_t v10 = @"<EKRedacted>";
LABEL_7:

  return v10;
}

__CFString *EKUUIDString()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v1 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  os_log_t v2 = (__CFString *)CFUUIDCreateString(v0, v1);
  CFRelease(v1);

  return v2;
}

uint64_t EKDatabasePerformMigrationIfNeeded()
{
  CFAllocatorRef v0 = objc_alloc_init(EKEventStore);
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  CFUUIDRef v1 = [(EKEventStore *)v0 connection];
  os_log_t v2 = [v1 CADOperationProxySync];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __EKDatabasePerformMigrationIfNeeded_block_invoke;
  v5[3] = &unk_1E5B96D00;
  v5[4] = &v6;
  [v2 CADMigrateDatabaseIfNeeded:v5];

  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_1A4F57FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __EKDatabasePerformMigrationIfNeeded_block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __EKDatabasePerformMigrationIfNeeded_block_invoke_cold_1(a2, v3);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

uint64_t EKDatabaseSizeInBytes()
{
  return MEMORY[0x1F410E728]();
}

void sub_1A4F59C04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4F59C74()
{
  qword_1E9664648 = 4;
}

uint64_t static EKSpan.everyOccurrence.getter()
{
  return sub_1A4F59D44(&qword_1E9664640, (uint64_t)&qword_1E9664648);
}

void sub_1A4F59CA8()
{
  qword_1E9664658 = 3;
}

uint64_t static EKSpan.automaticChange.getter()
{
  return sub_1A4F59D44(&qword_1E9664650, (uint64_t)&qword_1E9664658);
}

void sub_1A4F59CDC()
{
  qword_1E9664668 = 2;
}

uint64_t static EKSpan.everyOccurrenceUnlessDetached.getter()
{
  return sub_1A4F59D44(&qword_1E9664660, (uint64_t)&qword_1E9664668);
}

void sub_1A4F59D10()
{
  qword_1E9663238 = 6;
}

uint64_t static EKSourceType.integrations.getter()
{
  return sub_1A4F59D44(&qword_1E9663230, (uint64_t)&qword_1E9663238);
}

uint64_t sub_1A4F59D44(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(void *)a2;
}

uint64_t sub_1A4F59D80()
{
  uint64_t v0 = sub_1A4F7AF08();
  __swift_allocate_value_buffer(v0, qword_1E9664C38);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9664C38);
  return sub_1A4F7AEF8();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1A4F59E94()
{
  if (qword_1E9664670 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1A4F7AF08();

  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9664C38);
}

uint64_t EKRemoteUISerializedObject.serializedObjectIDDictionary.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t EKRemoteUISerializedObject.objectIDToChangeSetDictionaryMap.getter()
{
  return swift_bridgeObjectRetain();
}

id sub_1A4F59FA0()
{
  sub_1A4F68994(0, &qword_1E96646F8);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664700);
  sub_1A4F68938(&qword_1E9664708, &qword_1E96646F8);
  uint64_t v0 = (void *)sub_1A4F7AF18();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t EKRemoteUISerializedObject.objectIDToPersistentDictionaryMap.getter()
{
  return swift_bridgeObjectRetain();
}

id EKRemoteUISerializedObject.__allocating_init(serializedObjectIDDictionary:objectIDToChangeSetDictionaryMap:objectIDToPersistentDictionaryMap:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (char *)objc_allocWithZone(v3);
  *(void *)&v7[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_serializedObjectIDDictionary] = a1;
  *(void *)&v7[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToChangeSetDictionaryMap] = a2;
  *(void *)&v7[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToPersistentDictionaryMap] = a3;
  v9.receiver = v7;
  v9.super_class = v3;
  return objc_msgSendSuper2(&v9, sel_init);
}

id EKRemoteUISerializedObject.init(serializedObjectIDDictionary:objectIDToChangeSetDictionaryMap:objectIDToPersistentDictionaryMap:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_serializedObjectIDDictionary] = a1;
  *(void *)&v3[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToChangeSetDictionaryMap] = a2;
  *(void *)&v3[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToPersistentDictionaryMap] = a3;
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for EKRemoteUISerializedObject();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for EKRemoteUISerializedObject()
{
  return self;
}

void EKRemoteUISerializedObject.init()()
{
}

id EKRemoteUISerializedObject.__deallocating_deinit()
{
  return sub_1A4F5A8A8(type metadata accessor for EKRemoteUISerializedObject);
}

id EKRemoteUIDeserializedObject.deserializedObject.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_deserializedObject);
}

uint64_t EKRemoteUIDeserializedObject.tempObjectIDMap.getter()
{
  return swift_bridgeObjectRetain();
}

id EKRemoteUIDeserializedObject.__allocating_init(deserializedObject:tempObjectIDMap:)(uint64_t a1, uint64_t a2)
{
  objc_super v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_deserializedObject] = a1;
  *(void *)&v5[OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_tempObjectIDMap] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id EKRemoteUIDeserializedObject.init(deserializedObject:tempObjectIDMap:)(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_deserializedObject] = a1;
  *(void *)&v2[OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_tempObjectIDMap] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for EKRemoteUIDeserializedObject();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for EKRemoteUIDeserializedObject()
{
  return self;
}

void EKRemoteUIDeserializedObject.init()()
{
}

id EKRemoteUIDeserializedObject.__deallocating_deinit()
{
  return sub_1A4F5A8A8(type metadata accessor for EKRemoteUIDeserializedObject);
}

id EKRemoteUIPersistentObjectPointer.objectID.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID);
}

uint64_t EKRemoteUIPersistentObjectPointer.isPendingInsert.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert);
}

uint64_t static EKRemoteUIPersistentObjectPointer.supportsSecureCoding.getter()
{
  return 1;
}

id EKRemoteUIPersistentObjectPointer.__allocating_init(objectID:isPendingInsert:)(uint64_t a1, char a2)
{
  objc_super v5 = objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = a1;
  v5[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id EKRemoteUIPersistentObjectPointer.init(objectID:isPendingInsert:)(uint64_t a1, char a2)
{
  *(void *)&v2[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = a1;
  v2[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for EKRemoteUIPersistentObjectPointer();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for EKRemoteUIPersistentObjectPointer()
{
  return self;
}

uint64_t EKRemoteUIPersistentObjectPointer.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  sub_1A4F680D0(a1);
  uint64_t v5 = v4;

  return v5;
}

uint64_t EKRemoteUIPersistentObjectPointer.init(coder:)(void *a1)
{
  sub_1A4F680D0(a1);
  uint64_t v3 = v2;

  return v3;
}

void sub_1A4F5A670(void *a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID);
  uint64_t v4 = (void *)sub_1A4F7AF48();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

  uint64_t v5 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert);
  id v6 = (id)sub_1A4F7AF48();
  objc_msgSend(a1, sel_encodeBool_forKey_, v5, v6);
}

void EKRemoteUIPersistentObjectPointer.init()()
{
}

id EKRemoteUIPersistentObjectPointer.__deallocating_deinit()
{
  return sub_1A4F5A8A8(type metadata accessor for EKRemoteUIPersistentObjectPointer);
}

id sub_1A4F5A8A8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id EKRemoteUIObjectSerializer.serializedRepresentation(ekObject:obfuscateKeyProperties:)(void *a1, int a2)
{
  uint64_t v9 = MEMORY[0x1E4FBC868];
  id v10 = (id)MEMORY[0x1E4FBC868];
  uint64_t v2 = sub_1A4F5A980(a1, a2, &v10, &v9);
  uint64_t v4 = v9;
  id v3 = v10;
  uint64_t v5 = (objc_class *)type metadata accessor for EKRemoteUISerializedObject();
  id v6 = (char *)objc_allocWithZone(v5);
  *(void *)&v6[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_serializedObjectIDDictionary] = v2;
  *(void *)&v6[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToChangeSetDictionaryMap] = v3;
  *(void *)&v6[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToPersistentDictionaryMap] = v4;
  v8.receiver = v6;
  v8.super_class = v5;
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t sub_1A4F5A980(void *a1, int a2, id *a3, void *a4)
{
  v346 = a4;
  v349 = a3;
  int v350 = a2;
  uint64_t v6 = sub_1A4F7AF08();
  uint64_t v322 = *(void *)(v6 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  v338 = (char *)&v321 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  v336 = (char *)&v321 - v9;
  id v10 = objc_msgSend(a1, sel_persistentObject);
  if (!v10) {
    goto LABEL_323;
  }
  uint64_t v11 = v10;
  objc_msgSend(v10, sel_isPendingInsert);

  uint64_t v351 = v4;
  uint64_t v12 = *(void *)(v4 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKIsPendingInsertKey);
  uint64_t v13 = *(void *)(v4 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKIsPendingInsertKey + 8);
  uint64_t v14 = sub_1A4F68994(0, &qword_1E9664758);
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1A4F7AFB8();
  uint64_t v362 = v14;
  *(void *)&long long v360 = v15;
  sub_1A4F6841C(&v360, &v357);
  uint64_t v16 = (void *)MEMORY[0x1E4FBC868];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v375.id receiver = v16;
  sub_1A4F66D7C(&v357, v12, v13, isUniquelyReferenced_nonNull_native);
  id receiver = v375.receiver;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v364 = v16;
  v365 = v16;
  id v18 = objc_msgSend(a1, sel_changeSet);
  id v331 = a1;
  if (!v18)
  {
LABEL_225:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E96647C0);
    uint64_t v228 = swift_allocObject();
    *(_OWORD *)(v228 + 16) = xmmword_1A4F901B0;
    uint64_t v229 = v351;
    uint64_t v230 = *(void *)(v351 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetSingleValueChangesKey + 8);
    *(void *)(v228 + 32) = *(void *)(v351
                                       + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetSingleValueChangesKey);
    *(void *)(v228 + 40) = v230;
    uint64_t v231 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664700);
    *(void *)(v228 + 4_Block_object_dispose(&STACK[0x280], 8) = v16;
    uint64_t v232 = *(void *)(v229 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueAdditionsKey);
    uint64_t v233 = *(void *)(v229
                     + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueAdditionsKey
                     + 8);
    *(void *)(v228 + 72) = v231;
    *(void *)(v228 + 80) = v232;
    v235 = v364;
    v234 = v365;
    *(void *)(v228 + 8_Block_object_dispose(&STACK[0x280], 8) = v233;
    *(void *)(v228 + 96) = v234;
    uint64_t v236 = *(void *)(v229 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueRemovalsKey);
    uint64_t v237 = *(void *)(v229 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueRemovalsKey + 8);
    *(void *)(v228 + 120) = v231;
    *(void *)(v228 + 12_Block_object_dispose(&STACK[0x280], 8) = v236;
    *(void *)(v228 + 16_Block_object_dispose(&STACK[0x280], 8) = v231;
    *(void *)(v228 + 136) = v237;
    *(void *)(v228 + 144) = v235;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v238 = sub_1A4F5E640(v228);
    uint64_t v239 = *(void *)(v229 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetKey);
    uint64_t v240 = *(void *)(v229 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetKey + 8);
    uint64_t v362 = v231;
    *(void *)&long long v360 = v238;
    sub_1A4F6841C(&v360, &v357);
    swift_bridgeObjectRetain();
    v241 = receiver;
    char v242 = swift_isUniquelyReferenced_nonNull_native();
    v375.id receiver = v241;
    sub_1A4F66D7C(&v357, v239, v240, v242);
    v335 = (uint64_t *)v375.receiver;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v243 = v331;
    id v244 = objc_msgSend(v331, sel_persistentObject);
    if (!v244) {
      goto LABEL_324;
    }
    v245 = v244;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v246 = objc_msgSend(v245, sel_objectID);

    if (v246)
    {
      uint64_t v247 = *(void *)(v351 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKPersistentObjectKey);
      uint64_t v248 = *(void *)(v351 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKPersistentObjectKey + 8);
      uint64_t v362 = sub_1A4F68994(0, &qword_1E96646F8);
      *(void *)&long long v360 = v246;
      sub_1A4F6841C(&v360, &v357);
      swift_bridgeObjectRetain();
      id v249 = v246;
      v250 = v335;
      char v251 = swift_isUniquelyReferenced_nonNull_native();
      v375.id receiver = v250;
      sub_1A4F66D7C(&v357, v247, v248, v251);
      v335 = (uint64_t *)v375.receiver;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v252 = objc_msgSend(v243, sel_backingObject);
      if (v252)
      {
        v253 = v252;
        v254 = v346;
        uint64_t v255 = sub_1A4F5D38C(v252, v350 & 1, v346);
        char v256 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&long long v360 = *v254;
        void *v254 = 0x8000000000000000;
        sub_1A4F66C08(v255, v249, v256);
        void *v254 = v360;
        id v243 = v331;

        swift_bridgeObjectRelease();
      }
      else
      {
      }
    }
    v257 = (void *)MEMORY[0x1E4FBC868];
    v363 = (void *)MEMORY[0x1E4FBC868];
    id v258 = objc_msgSend(v243, sel_cachedMeltedObjects);
    if (!v258) {
      goto LABEL_304;
    }
    v259 = v258;
    uint64_t v260 = MEMORY[0x1E4FBC840] + 8;
    uint64_t v261 = sub_1A4F7AF38();

    v262 = (char *)sub_1A4F5E778(v261);
    swift_bridgeObjectRelease();
    if (!v262) {
      goto LABEL_304;
    }
    uint64_t v345 = 0;
    uint64_t v263 = *((void *)v262 + 8);
    v336 = v262 + 64;
    uint64_t v264 = 1 << v262[32];
    if (v264 < 64) {
      uint64_t v265 = ~(-1 << v264);
    }
    else {
      uint64_t v265 = -1;
    }
    unint64_t v266 = v265 & v263;
    v267 = &v358;
    v268 = &v361;
    int64_t v340 = (unint64_t)(v264 + 63) >> 6;
    v330 = (void (**)(char *, uint64_t, uint64_t))(v340 - 1);
    id v341 = (id)(MEMORY[0x1E4FBC838] + 8);
    v338 = (char *)&v358;
    v339 = v262;
    int64_t v337 = (int64_t)&v361;
    v332 = (long long *)v260;
    uint64_t v333 = v231;
LABEL_237:
    while (!v266)
    {
      int64_t v275 = v345 + 1;
      if (__OFADD__(v345, 1)) {
        goto LABEL_309;
      }
      if (v275 < v340)
      {
        unint64_t v276 = *(void *)&v336[8 * v275];
        if (v276) {
          goto LABEL_243;
        }
        uint64_t v277 = v345 + 2;
        ++v345;
        if (v275 + 1 < v340)
        {
          unint64_t v276 = *(void *)&v336[8 * v277];
          if (v276) {
            goto LABEL_246;
          }
          uint64_t v345 = v275 + 1;
          if (v275 + 2 < v340)
          {
            unint64_t v276 = *(void *)&v336[8 * v275 + 16];
            if (v276)
            {
              v275 += 2;
LABEL_243:
              uint64_t v270 = (v276 - 1) & v276;
              unint64_t v271 = __clz(__rbit64(v276)) + (v275 << 6);
              uint64_t v345 = v275;
LABEL_239:
              uint64_t v272 = *((void *)v262 + 7);
              v273 = (void *)(*((void *)v262 + 6) + 16 * v271);
              uint64_t v274 = v273[1];
              *(void *)&long long v357 = *v273;
              *((void *)&v357 + 1) = v274;
              sub_1A4F68358(v272 + 32 * v271, (uint64_t)v267);
              swift_bridgeObjectRetain();
              goto LABEL_258;
            }
            uint64_t v277 = v275 + 3;
            uint64_t v345 = v275 + 2;
            if (v275 + 3 < v340)
            {
              unint64_t v276 = *(void *)&v336[8 * v277];
              if (v276)
              {
LABEL_246:
                int64_t v275 = v277;
                goto LABEL_243;
              }
              while (1)
              {
                int64_t v275 = v277 + 1;
                if (__OFADD__(v277, 1)) {
                  goto LABEL_319;
                }
                if (v275 >= v340) {
                  break;
                }
                unint64_t v276 = *(void *)&v336[8 * v275];
                ++v277;
                if (v276) {
                  goto LABEL_243;
                }
              }
              uint64_t v345 = (uint64_t)v330;
            }
          }
        }
      }
      uint64_t v270 = 0;
      long long v358 = 0u;
      long long v359 = 0u;
      long long v357 = 0u;
LABEL_258:
      sub_1A4F683B4((uint64_t)&v357, (uint64_t)&v360);
      uint64_t v278 = *((void *)&v360 + 1);
      if (!*((void *)&v360 + 1))
      {
        swift_release();
        v257 = v363;
LABEL_304:
        uint64_t v315 = *(void *)(v351 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKCachedMeltedObjectsKey);
        uint64_t v316 = *(void *)(v351 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKCachedMeltedObjectsKey + 8);
        uint64_t v362 = v231;
        *(void *)&long long v360 = v257;
        sub_1A4F6841C(&v360, &v357);
        swift_bridgeObjectRetain();
        v317 = v335;
        char v318 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&long long v355 = v317;
        sub_1A4F66D7C(&v357, v315, v316, v318);
        uint64_t v319 = v355;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v319;
      }
      unint64_t v348 = v270;
      uint64_t v279 = v360;
      sub_1A4F6841C(v268, &v357);
      uint64_t ObjCClassFromObject = swift_getObjCClassFromObject();
      uint64_t v347 = v279;
      v281 = (void *)sub_1A4F7AF48();
      LOBYTE(ObjCClassFromObject) = objc_msgSend((id)ObjCClassFromObject, sel_isWeakRelationObject_forKey_, v243, v281);

      if (ObjCClassFromObject)
      {
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v357);
        swift_bridgeObjectRelease();
        unint64_t v266 = v348;
        continue;
      }
      sub_1A4F68358((uint64_t)&v357, (uint64_t)&v355);
      sub_1A4F68994(0, &qword_1E9664730);
      if (!swift_dynamicCast())
      {
        sub_1A4F68358((uint64_t)&v357, (uint64_t)&v355);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E96647C8);
        if ((swift_dynamicCast() & 1) == 0)
        {
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v357);
          unint64_t v266 = v348;
          continue;
        }
        unint64_t v294 = *(void *)&v353[0];
        *(void *)&v353[0] = MEMORY[0x1E4FBC860];
        if ((v294 & 0xC000000000000001) != 0)
        {
          sub_1A4F7B048();
          sub_1A4F68938(&qword_1E96647D0, &qword_1E9664730);
          sub_1A4F7AF98();
          unint64_t v294 = (unint64_t)v375.receiver;
          super_class = (uint64_t *)v375.super_class;
          v295 = v376;
          uint64_t v296 = v377;
          unint64_t v297 = v378;
        }
        else
        {
          uint64_t v296 = 0;
          uint64_t v300 = -1 << *(unsigned char *)(v294 + 32);
          uint64_t v301 = *(void *)(v294 + 56);
          super_class = (uint64_t *)(v294 + 56);
          uint64_t v302 = ~v300;
          uint64_t v303 = -v300;
          if (v303 < 64) {
            uint64_t v304 = ~(-1 << v303);
          }
          else {
            uint64_t v304 = -1;
          }
          unint64_t v297 = v304 & v301;
          v295 = (uint64_t *)v302;
        }
        v334 = v295;
        v342 = (long long *)(v294 & 0x7FFFFFFFFFFFFFFFLL);
        int64_t v343 = (unint64_t)(v295 + 8) >> 6;
        if ((v294 & 0x8000000000000000) != 0)
        {
LABEL_280:
          v305 = (void *)sub_1A4F7B078();
          if (!v305) {
            goto LABEL_302;
          }
          v354 = v305;
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v306 = (id)v355;
          swift_unknownObjectRelease();
          uint64_t v307 = v296;
          uint64_t v308 = v297;
          if (!v306) {
            goto LABEL_302;
          }
          goto LABEL_300;
        }
        while (1)
        {
          if (v297)
          {
            uint64_t v308 = (v297 - 1) & v297;
            unint64_t v309 = __clz(__rbit64(v297)) | (v296 << 6);
            uint64_t v307 = v296;
          }
          else
          {
            int64_t v310 = v296 + 1;
            if (__OFADD__(v296, 1)) {
              goto LABEL_307;
            }
            if (v310 >= v343)
            {
LABEL_302:
              sub_1A4F6898C();
              uint64_t v314 = *(void *)&v353[0];
              uint64_t v356 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664720);
              *(void *)&long long v355 = v314;
              sub_1A4F5E40C((uint64_t)&v355, v347, v278);
              __swift_destroy_boxed_opaque_existential_0((uint64_t)&v357);
              id v243 = v331;
              uint64_t v231 = v333;
              v267 = (long long *)v338;
              v262 = v339;
              v268 = (uint64_t *)v337;
              unint64_t v266 = v348;
              goto LABEL_237;
            }
            unint64_t v311 = super_class[v310];
            uint64_t v307 = v296 + 1;
            if (!v311)
            {
              uint64_t v307 = v296 + 2;
              if (v296 + 2 >= v343) {
                goto LABEL_302;
              }
              unint64_t v311 = super_class[v307];
              if (!v311)
              {
                uint64_t v307 = v296 + 3;
                if (v296 + 3 >= v343) {
                  goto LABEL_302;
                }
                unint64_t v311 = super_class[v307];
                if (!v311)
                {
                  uint64_t v307 = v296 + 4;
                  if (v296 + 4 >= v343) {
                    goto LABEL_302;
                  }
                  unint64_t v311 = super_class[v307];
                  if (!v311)
                  {
                    uint64_t v312 = v296 + 5;
                    do
                    {
                      if (v343 == v312) {
                        goto LABEL_302;
                      }
                      unint64_t v311 = super_class[v312++];
                    }
                    while (!v311);
                    uint64_t v307 = v312 - 1;
                  }
                }
              }
            }
            uint64_t v308 = (v311 - 1) & v311;
            unint64_t v309 = __clz(__rbit64(v311)) + (v307 << 6);
          }
          id v306 = *(id *)(*(void *)(v294 + 48) + 8 * v309);
          if (!v306) {
            goto LABEL_302;
          }
LABEL_300:
          uint64_t v313 = sub_1A4F5A980(v306, v350 & 1, v349, v346);
          sub_1A4F5EB4C(v313);

          uint64_t v296 = v307;
          unint64_t v297 = v308;
          if ((v294 & 0x8000000000000000) != 0) {
            goto LABEL_280;
          }
        }
      }
      v282 = *(void **)&v353[0];
      uint64_t v283 = sub_1A4F5A980(*(void *)&v353[0], v350 & 1, v349, v346);
      uint64_t v356 = v231;
      *(void *)&long long v355 = v283;
      sub_1A4F6841C(&v355, v353);
      v284 = v363;
      char v285 = swift_isUniquelyReferenced_nonNull_native();
      v354 = v284;
      unint64_t v287 = sub_1A4F64554(v347, v278);
      uint64_t v288 = v284[2];
      BOOL v289 = (v286 & 1) == 0;
      uint64_t v290 = v288 + v289;
      if (__OFADD__(v288, v289)) {
        goto LABEL_312;
      }
      char v291 = v286;
      if (v284[3] >= v290)
      {
        if ((v285 & 1) == 0) {
          sub_1A4F673E4();
        }
      }
      else
      {
        sub_1A4F65DBC(v290, v285);
        unint64_t v292 = sub_1A4F64554(v347, v278);
        if ((v291 & 1) != (v293 & 1)) {
          goto LABEL_325;
        }
        unint64_t v287 = v292;
      }
      v268 = (uint64_t *)v337;
      v298 = v354;
      if (v291)
      {
        v299 = (_OWORD *)(v354[7] + 32 * v287);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v299);
        sub_1A4F6841C(v353, v299);
      }
      else
      {
        sub_1A4F671CC(v287, v347, v278, v353, v354);
        swift_bridgeObjectRetain();
      }
      v262 = v339;
      v363 = v298;

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v357);
      v267 = (long long *)v338;
      unint64_t v266 = v348;
    }
    unint64_t v269 = __clz(__rbit64(v266));
    uint64_t v270 = (v266 - 1) & v266;
    unint64_t v271 = v269 | (v345 << 6);
    goto LABEL_239;
  }
  id v325 = v18;
  id v19 = objc_msgSend(v18, sel_singleValueChanges);
  int64_t v340 = v6;
  if (v19)
  {
    v20 = v19;
    *(void *)&long long v360 = 0;
    uint64_t v347 = MEMORY[0x1E4FBC840] + 8;
    sub_1A4F7AF28();

    if ((void)v360)
    {
      unint64_t v348 = 0;
      int64_t v343 = v360;
      uint64_t v21 = *(void *)(v360 + 64);
      v335 = (uint64_t *)(v360 + 64);
      uint64_t v22 = 1 << *(unsigned char *)(v360 + 32);
      uint64_t v23 = -1;
      if (v22 < 64) {
        uint64_t v23 = ~(-1 << v22);
      }
      unint64_t v24 = v23 & v21;
      v342 = &v358;
      super_class = &v361;
      int64_t v337 = (unint64_t)(v22 + 63) >> 6;
      v334 = (uint64_t *)(v337 - 1);
      v25 = (void *)MEMORY[0x1E4FBC868];
      uint64_t v345 = MEMORY[0x1E4FBC868];
      if ((v23 & v21) == 0) {
        goto LABEL_10;
      }
LABEL_8:
      unint64_t v26 = __clz(__rbit64(v24));
      v24 &= v24 - 1;
      unint64_t v27 = v26 | (v348 << 6);
LABEL_9:
      uint64_t v28 = *(void *)(v343 + 56);
      uint64_t v29 = (void *)(*(void *)(v343 + 48) + 16 * v27);
      uint64_t v30 = v29[1];
      *(void *)&long long v357 = *v29;
      *((void *)&v357 + 1) = v30;
      sub_1A4F68358(v28 + 32 * v27, (uint64_t)v342);
      swift_bridgeObjectRetain();
      v25 = (void *)v345;
      while (1)
      {
        sub_1A4F683B4((uint64_t)&v357, (uint64_t)&v360);
        uint64_t v34 = *((void *)&v360 + 1);
        if (!*((void *)&v360 + 1))
        {
          swift_release();
          goto LABEL_63;
        }
        uint64_t v35 = v360;
        sub_1A4F6841C(super_class, &v357);
        sub_1A4F68358((uint64_t)&v357, (uint64_t)&v375);
        sub_1A4F68994(0, &qword_1E9664750);
        if ((swift_dynamicCast() & 1) == 0) {
          goto LABEL_38;
        }
        v36 = (void *)v371;
        id v37 = objc_msgSend((id)v371, sel_objectID);
        if (!v37)
        {

          v25 = (void *)v345;
LABEL_38:
          sub_1A4F68358((uint64_t)&v357, (uint64_t)&v375);
          char v63 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v371 = v25;
          unint64_t v65 = sub_1A4F64554(v35, v34);
          uint64_t v66 = *(void *)(v345 + 16);
          BOOL v67 = (v64 & 1) == 0;
          uint64_t v68 = v66 + v67;
          if (__OFADD__(v66, v67)) {
            goto LABEL_308;
          }
          char v69 = v64;
          if (*(void *)(v345 + 24) >= v68)
          {
            if (v63)
            {
              v25 = (void *)v371;
              if ((v64 & 1) == 0) {
                goto LABEL_42;
              }
            }
            else
            {
              sub_1A4F673E4();
              v25 = (void *)v371;
              if ((v69 & 1) == 0) {
                goto LABEL_42;
              }
            }
          }
          else
          {
            sub_1A4F65DBC(v68, v63);
            unint64_t v70 = sub_1A4F64554(v35, v34);
            if ((v69 & 1) != (v71 & 1)) {
              goto LABEL_325;
            }
            unint64_t v65 = v70;
            v25 = (void *)v371;
            if ((v69 & 1) == 0)
            {
LABEL_42:
              v25[(v65 >> 6) + 8] |= 1 << v65;
              v72 = (uint64_t *)(v25[6] + 16 * v65);
              uint64_t *v72 = v35;
              v72[1] = v34;
              sub_1A4F6841C(&v375, (_OWORD *)(v25[7] + 32 * v65));
              uint64_t v73 = v25[2];
              BOOL v60 = __OFADD__(v73, 1);
              uint64_t v74 = v73 + 1;
              if (v60) {
                goto LABEL_316;
              }
              v25[2] = v74;
              swift_bridgeObjectRetain();
LABEL_47:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              __swift_destroy_boxed_opaque_existential_0((uint64_t)&v357);
              uint64_t v345 = (uint64_t)v25;
              if (v24) {
                goto LABEL_8;
              }
              goto LABEL_10;
            }
          }
          v75 = v25;
          uint64_t v76 = v25[7] + 32 * v65;
          __swift_destroy_boxed_opaque_existential_0(v76);
          v77 = (_OWORD *)v76;
          v25 = v75;
          sub_1A4F6841C(&v375, v77);
          goto LABEL_47;
        }
        v38 = v37;
        unsigned __int8 v39 = objc_msgSend(v36, sel_isPendingInsert);
        v40 = (objc_class *)type metadata accessor for EKRemoteUIPersistentObjectPointer();
        v41 = objc_allocWithZone(v40);
        *(void *)&v41[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = v38;
        v41[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = v39;
        v352.id receiver = v41;
        v352.super_class = v40;
        id v341 = v38;
        id v42 = objc_msgSendSuper2(&v352, sel_init);
        v43 = (void *)swift_getObjCClassFromObject();
        id v44 = v36;
        v45 = (void *)sub_1A4F7AF48();
        unsigned __int8 v46 = objc_msgSend(v43, sel_isWeakRelationObject_forKey_, v44, v45);

        uint64_t v377 = (uint64_t)v40;
        v375.id receiver = v42;
        sub_1A4F6841C(&v375, &v371);
        v339 = (char *)v42;
        uint64_t v47 = v345;
        char v48 = swift_isUniquelyReferenced_nonNull_native();
        v366 = (void *)v47;
        unint64_t v50 = sub_1A4F64554(v35, v34);
        uint64_t v51 = *(void *)(v47 + 16);
        BOOL v52 = (v49 & 1) == 0;
        uint64_t v53 = v51 + v52;
        if (__OFADD__(v51, v52)) {
          goto LABEL_317;
        }
        char v54 = v49;
        if (*(void *)(v47 + 24) >= v53)
        {
          if (v48)
          {
            v57 = v366;
            if (v49) {
              goto LABEL_51;
            }
          }
          else
          {
            sub_1A4F673E4();
            v57 = v366;
            if (v54) {
              goto LABEL_51;
            }
          }
        }
        else
        {
          sub_1A4F65DBC(v53, v48);
          unint64_t v55 = sub_1A4F64554(v35, v34);
          if ((v54 & 1) != (v56 & 1)) {
            goto LABEL_325;
          }
          unint64_t v50 = v55;
          v57 = v366;
          if (v54)
          {
LABEL_51:
            v62 = v57;
            v78 = (_OWORD *)(v57[7] + 32 * v50);
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v78);
            sub_1A4F6841C(&v371, v78);
            goto LABEL_52;
          }
        }
        v57[(v50 >> 6) + 8] |= 1 << v50;
        v58 = (uint64_t *)(v57[6] + 16 * v50);
        uint64_t *v58 = v35;
        v58[1] = v34;
        sub_1A4F6841C(&v371, (_OWORD *)(v57[7] + 32 * v50));
        uint64_t v59 = v57[2];
        BOOL v60 = __OFADD__(v59, 1);
        uint64_t v61 = v59 + 1;
        if (v60) {
          goto LABEL_318;
        }
        v62 = v57;
        v57[2] = v61;
        swift_bridgeObjectRetain();
LABEL_52:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v46)
        {
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v357);
        }
        else
        {
          v79 = v349;
          uint64_t v80 = sub_1A4F5D38C(v44, v350 & 1, v349);
          char v81 = swift_isUniquelyReferenced_nonNull_native();
          v375.id receiver = *v79;
          id *v79 = (id)0x8000000000000000;
          uint64_t v82 = v80;
          v83 = v341;
          sub_1A4F66C08(v82, v341, v81);
          id *v79 = v375.receiver;

          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v357);
        }
        uint64_t v6 = v340;
        v25 = v62;
        uint64_t v345 = (uint64_t)v62;
        if (v24) {
          goto LABEL_8;
        }
LABEL_10:
        int64_t v31 = v348 + 1;
        if (__OFADD__(v348, 1)) {
          goto LABEL_313;
        }
        if (v31 < v337)
        {
          unint64_t v32 = v335[v31];
          if (v32) {
            goto LABEL_13;
          }
          int64_t v33 = v348 + 2;
          ++v348;
          if (v31 + 1 < v337)
          {
            unint64_t v32 = v335[v33];
            if (v32) {
              goto LABEL_16;
            }
            unint64_t v348 = v31 + 1;
            if (v31 + 2 < v337)
            {
              unint64_t v32 = v335[v31 + 2];
              if (v32)
              {
                v31 += 2;
                goto LABEL_13;
              }
              int64_t v33 = v31 + 3;
              unint64_t v348 = v31 + 2;
              if (v31 + 3 < v337)
              {
                unint64_t v32 = v335[v33];
                if (!v32)
                {
                  while (1)
                  {
                    int64_t v31 = v33 + 1;
                    if (__OFADD__(v33, 1)) {
                      goto LABEL_320;
                    }
                    if (v31 >= v337)
                    {
                      unint64_t v348 = (unint64_t)v334;
                      goto LABEL_27;
                    }
                    unint64_t v32 = v335[v31];
                    ++v33;
                    if (v32) {
                      goto LABEL_13;
                    }
                  }
                }
LABEL_16:
                int64_t v31 = v33;
LABEL_13:
                unint64_t v24 = (v32 - 1) & v32;
                unint64_t v27 = __clz(__rbit64(v32)) + (v31 << 6);
                unint64_t v348 = v31;
                goto LABEL_9;
              }
            }
          }
        }
LABEL_27:
        unint64_t v24 = 0;
        long long v358 = 0u;
        long long v359 = 0u;
        long long v357 = 0u;
      }
    }
  }
  uint64_t v345 = MEMORY[0x1E4FBC868];
LABEL_63:
  id v84 = objc_msgSend(v325, sel_multiValueAdditions);
  v85 = v336;
  if (!v84
    || (v86 = v84,
        *(void *)&long long v360 = 0,
        v335 = (uint64_t *)(MEMORY[0x1E4FBC840] + 8),
        sub_1A4F7AF28(),
        v86,
        !(void)v360))
  {
LABEL_143:
    id v156 = v325;
    id v157 = objc_msgSend(v325, sel_multiValueRemovals, v321);
    if (!v157)
    {

      goto LABEL_224;
    }
    v158 = v157;
    *(void *)&long long v360 = 0;
    v336 = (char *)(MEMORY[0x1E4FBC840] + 8);
    sub_1A4F7AF28();

    if ((void)v360)
    {
      int64_t v337 = 0;
      uint64_t v333 = v360;
      uint64_t v159 = *(void *)(v360 + 64);
      int64_t v326 = v360 + 64;
      uint64_t v160 = 1 << *(unsigned char *)(v360 + 32);
      if (v160 < 64) {
        uint64_t v161 = ~(-1 << v160);
      }
      else {
        uint64_t v161 = -1;
      }
      unint64_t v162 = v161 & v159;
      v332 = &v358;
      v335 = &v361;
      v330 = (void (**)(char *, uint64_t, uint64_t))(v322 + 16);
      v328 = (void (**)(char *, int64_t))(v322 + 8);
      *(void *)&long long v327 = (unint64_t)(v160 + 63) >> 6;
      int64_t v324 = v327 - 1;
      int64_t v343 = MEMORY[0x1E4FBC838] + 8;
      long long v329 = xmmword_1A4F901B0;
      v163 = v338;
      if ((v161 & v159) != 0) {
        goto LABEL_149;
      }
LABEL_152:
      while (2)
      {
        uint64_t v171 = v337 + 1;
        if (__OFADD__(v337, 1)) {
          goto LABEL_315;
        }
        if (v171 < (uint64_t)v327)
        {
          unint64_t v172 = *(void *)(v326 + 8 * v171);
          if (v172) {
            goto LABEL_155;
          }
          uint64_t v173 = v337 + 2;
          ++v337;
          if (v171 + 1 < (uint64_t)v327)
          {
            unint64_t v172 = *(void *)(v326 + 8 * v173);
            if (v172)
            {
LABEL_158:
              uint64_t v171 = v173;
LABEL_155:
              v165 = (char *)((v172 - 1) & v172);
              unint64_t v166 = __clz(__rbit64(v172)) + (v171 << 6);
              int64_t v337 = v171;
              goto LABEL_150;
            }
            int64_t v337 = v171 + 1;
            if (v171 + 2 < (uint64_t)v327)
            {
              unint64_t v172 = *(void *)(v326 + 8 * (v171 + 2));
              if (v172)
              {
                v171 += 2;
                goto LABEL_155;
              }
              uint64_t v173 = v171 + 3;
              int64_t v337 = v171 + 2;
              if (v171 + 3 < (uint64_t)v327)
              {
                unint64_t v172 = *(void *)(v326 + 8 * v173);
                if (v172) {
                  goto LABEL_158;
                }
                while (1)
                {
                  uint64_t v171 = v173 + 1;
                  if (__OFADD__(v173, 1)) {
                    goto LABEL_322;
                  }
                  if (v171 >= (uint64_t)v327) {
                    break;
                  }
                  unint64_t v172 = *(void *)(v326 + 8 * v171);
                  ++v173;
                  if (v172) {
                    goto LABEL_155;
                  }
                }
                int64_t v337 = v324;
              }
            }
          }
        }
        v165 = 0;
        long long v358 = 0u;
        long long v359 = 0u;
        long long v357 = 0u;
LABEL_170:
        sub_1A4F683B4((uint64_t)&v357, (uint64_t)&v360);
        uint64_t v174 = *((void *)&v360 + 1);
        if (!*((void *)&v360 + 1))
        {

          swift_release();
          goto LABEL_224;
        }
        v175 = (void *)v360;
        sub_1A4F6841C(v335, &v357);
        sub_1A4F68358((uint64_t)&v357, (uint64_t)&v375);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E96647D8);
        char v176 = swift_dynamicCast();
        v339 = v165;
        id v341 = v175;
        v342 = (long long *)v174;
        if ((v176 & 1) == 0)
        {
          if (qword_1E9664670 != -1) {
            swift_once();
          }
          uint64_t v181 = __swift_project_value_buffer(v6, (uint64_t)qword_1E9664C38);
          (*v330)(v163, v181, v6);
          uint64_t v182 = swift_allocObject();
          *(void *)(v182 + 16) = v175;
          *(void *)(v182 + 24) = v174;
          swift_bridgeObjectRetain();
          v183 = sub_1A4F7AEE8();
          os_log_type_t v184 = sub_1A4F7AFA8();
          uint64_t v185 = swift_allocObject();
          *(unsigned char *)(v185 + 16) = 32;
          uint64_t v186 = v6;
          uint64_t v187 = swift_allocObject();
          *(unsigned char *)(v187 + 16) = 8;
          uint64_t v188 = swift_allocObject();
          *(void *)(v188 + 16) = sub_1A4F68AC4;
          *(void *)(v188 + 24) = v182;
          uint64_t v189 = swift_allocObject();
          *(void *)(v189 + 16) = sub_1A4F68BF4;
          *(void *)(v189 + 24) = v188;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664740);
          uint64_t v190 = swift_allocObject();
          *(_OWORD *)(v190 + 16) = v329;
          *(void *)(v190 + 32) = sub_1A4F68C30;
          *(void *)(v190 + 40) = v185;
          *(void *)(v190 + 4_Block_object_dispose(&STACK[0x280], 8) = sub_1A4F68C30;
          *(void *)(v190 + 56) = v187;
          *(void *)(v190 + 64) = sub_1A4F68BF8;
          *(void *)(v190 + 72) = v189;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v183, v184))
          {
            v191 = v183;
            v192 = (uint8_t *)swift_slowAlloc();
            uint64_t v193 = swift_slowAlloc();
            *(void *)&long long v355 = 0;
            *(void *)&v353[0] = v193;
            *(_WORD *)v192 = 258;
            v192[2] = 32;
            swift_release();
            v192[3] = 8;
            v375.id receiver = v192 + 4;
            swift_release();
            swift_retain();
            sub_1A4F63570((uint64_t *)&v375, (uint64_t)&v355, (uint64_t *)v353, sub_1A4F68AC4);
            swift_release();
            swift_release();
            swift_release();
            _os_log_impl(&dword_1A4E47000, v191, v184, "EKRemoteUIObjectSerializer: Cannot parse changeSet multiValueRemovals as Set<EKPersistentObject> for key: %s", v192, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1A6266C00](v193, -1, -1);
            MEMORY[0x1A6266C00](v192, -1, -1);

            uint64_t v6 = v340;
            (*v328)(v338, v340);
          }
          else
          {

            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            (*v328)(v338, v186);
            uint64_t v6 = v186;
          }
          sub_1A4F68358((uint64_t)&v357, (uint64_t)&v375);
          v194 = v364;
          char v195 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v355 = v194;
          uint64_t v197 = (uint64_t)v341;
          uint64_t v196 = (uint64_t)v342;
          unint64_t v199 = sub_1A4F64554((uint64_t)v341, (uint64_t)v342);
          uint64_t v200 = v194[2];
          BOOL v201 = (v198 & 1) == 0;
          uint64_t v202 = v200 + v201;
          if (__OFADD__(v200, v201)) {
            goto LABEL_311;
          }
          char v203 = v198;
          if (v194[3] >= v202)
          {
            if (v195)
            {
              v206 = (void *)v355;
              if ((v198 & 1) == 0) {
                goto LABEL_183;
              }
            }
            else
            {
              sub_1A4F673E4();
              v206 = (void *)v355;
              if ((v203 & 1) == 0) {
                goto LABEL_183;
              }
            }
          }
          else
          {
            sub_1A4F65DBC(v202, v195);
            unint64_t v204 = sub_1A4F64554(v197, v196);
            if ((v203 & 1) != (v205 & 1)) {
              goto LABEL_325;
            }
            unint64_t v199 = v204;
            v206 = (void *)v355;
            if ((v203 & 1) == 0)
            {
LABEL_183:
              sub_1A4F671CC(v199, v197, v196, &v375, v206);
              swift_bridgeObjectRetain();
LABEL_187:
              v163 = v338;
              v364 = v206;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              __swift_destroy_boxed_opaque_existential_0((uint64_t)&v357);
              unint64_t v162 = (unint64_t)v339;
              if (v339) {
                goto LABEL_149;
              }
              continue;
            }
          }
          v207 = (_OWORD *)(v206[7] + 32 * v199);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v207);
          sub_1A4F6841C(&v375, v207);
          goto LABEL_187;
        }
        break;
      }
      uint64_t v177 = v355;
      *(void *)&long long v355 = MEMORY[0x1E4FBC870];
      if ((v177 & 0xC000000000000001) != 0)
      {
        sub_1A4F7B048();
        sub_1A4F68994(0, &qword_1E9664750);
        sub_1A4F68938(&qword_1E9664780, &qword_1E9664750);
        sub_1A4F7AF98();
        unint64_t v348 = *((void *)&v371 + 1);
        uint64_t v177 = v371;
        v178 = v372;
        uint64_t v179 = v373;
        unint64_t v180 = v374;
      }
      else
      {
        uint64_t v179 = 0;
        uint64_t v208 = -1 << *(unsigned char *)(v177 + 32);
        uint64_t v209 = *(void *)(v177 + 56);
        unint64_t v348 = v177 + 56;
        uint64_t v210 = ~v208;
        uint64_t v211 = -v208;
        if (v211 < 64) {
          uint64_t v212 = ~(-1 << v211);
        }
        else {
          uint64_t v212 = -1;
        }
        unint64_t v180 = v212 & v209;
        v178 = (uint64_t *)v210;
      }
      super_class = (uint64_t *)(v177 & 0x7FFFFFFFFFFFFFFFLL);
      v334 = v178;
      uint64_t v347 = (unint64_t)(v178 + 8) >> 6;
      while (1)
      {
        if (v177 < 0)
        {
          uint64_t v222 = sub_1A4F7B078();
          if (!v222) {
            goto LABEL_151;
          }
          *(void *)&v353[0] = v222;
          sub_1A4F68994(0, &qword_1E9664750);
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v223 = v375.receiver;
          swift_unknownObjectRelease();
          uint64_t v221 = v179;
          uint64_t v219 = v180;
          if (!v223) {
            goto LABEL_151;
          }
        }
        else
        {
          if (v180)
          {
            uint64_t v219 = (v180 - 1) & v180;
            unint64_t v220 = __clz(__rbit64(v180)) | (v179 << 6);
            uint64_t v221 = v179;
          }
          else
          {
            uint64_t v224 = v179 + 1;
            if (__OFADD__(v179, 1)) {
              goto LABEL_306;
            }
            if (v224 >= v347)
            {
LABEL_151:
              sub_1A4F6898C();
              v170 = (void *)v355;
              uint64_t v377 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664738);
              v375.id receiver = v170;
              sub_1A4F5E40C((uint64_t)&v375, (uint64_t)v341, (uint64_t)v342);
              __swift_destroy_boxed_opaque_existential_0((uint64_t)&v357);
              unint64_t v162 = (unint64_t)v339;
              uint64_t v6 = v340;
              v163 = v338;
              if (!v339) {
                goto LABEL_152;
              }
LABEL_149:
              unint64_t v164 = __clz(__rbit64(v162));
              v165 = (char *)((v162 - 1) & v162);
              unint64_t v166 = v164 | (v337 << 6);
LABEL_150:
              uint64_t v167 = *(void *)(v333 + 56);
              v168 = (void *)(*(void *)(v333 + 48) + 16 * v166);
              uint64_t v169 = v168[1];
              *(void *)&long long v357 = *v168;
              *((void *)&v357 + 1) = v169;
              sub_1A4F68358(v167 + 32 * v166, (uint64_t)v332);
              swift_bridgeObjectRetain();
              goto LABEL_170;
            }
            unint64_t v225 = *(void *)(v348 + 8 * v224);
            uint64_t v221 = v179 + 1;
            if (!v225)
            {
              uint64_t v221 = v179 + 2;
              if (v179 + 2 >= v347) {
                goto LABEL_151;
              }
              unint64_t v225 = *(void *)(v348 + 8 * v221);
              if (!v225)
              {
                uint64_t v221 = v179 + 3;
                if (v179 + 3 >= v347) {
                  goto LABEL_151;
                }
                unint64_t v225 = *(void *)(v348 + 8 * v221);
                if (!v225)
                {
                  uint64_t v221 = v179 + 4;
                  if (v179 + 4 >= v347) {
                    goto LABEL_151;
                  }
                  unint64_t v225 = *(void *)(v348 + 8 * v221);
                  if (!v225)
                  {
                    uint64_t v226 = v179 + 5;
                    do
                    {
                      if (v347 == v226) {
                        goto LABEL_151;
                      }
                      unint64_t v225 = *(void *)(v348 + 8 * v226++);
                    }
                    while (!v225);
                    uint64_t v221 = v226 - 1;
                  }
                }
              }
            }
            uint64_t v219 = (v225 - 1) & v225;
            unint64_t v220 = __clz(__rbit64(v225)) + (v221 << 6);
          }
          id v223 = *(id *)(*(void *)(v177 + 48) + 8 * v220);
          if (!v223) {
            goto LABEL_151;
          }
        }
        id v227 = objc_msgSend(v223, sel_objectID);
        if (v227)
        {
          v213 = v227;
          unsigned __int8 v214 = objc_msgSend(v223, sel_isPendingInsert);
          v215 = (objc_class *)type metadata accessor for EKRemoteUIPersistentObjectPointer();
          v216 = objc_allocWithZone(v215);
          id v217 = v213;
          *(void *)&v216[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = v217;
          v216[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = v214;
          v375.id receiver = v216;
          v375.super_class = v215;
          id v218 = objc_msgSendSuper2(&v375, sel_init);
          sub_1A4F63FE8(&v375, v218);
        }
        else
        {
        }
        uint64_t v179 = v221;
        unint64_t v180 = v219;
      }
    }

LABEL_224:
    uint64_t v16 = (void *)v345;
    goto LABEL_225;
  }
  int64_t v337 = 0;
  v332 = (long long *)v360;
  uint64_t v87 = *(void *)(v360 + 64);
  int64_t v324 = v360 + 64;
  uint64_t v88 = 1 << *(unsigned char *)(v360 + 32);
  if (v88 < 64) {
    uint64_t v89 = ~(-1 << v88);
  }
  else {
    uint64_t v89 = -1;
  }
  unint64_t v90 = v89 & v87;
  v330 = (void (**)(char *, uint64_t, uint64_t))&v358;
  v334 = &v361;
  v328 = (void (**)(char *, int64_t))(v322 + 8);
  *(void *)&long long v329 = v322 + 16;
  int64_t v326 = (unint64_t)(v88 + 63) >> 6;
  int64_t v321 = v326 - 1;
  int64_t v343 = MEMORY[0x1E4FBC838] + 8;
  long long v327 = xmmword_1A4F901B0;
  while (1)
  {
    if (v90)
    {
      v339 = (char *)((v90 - 1) & v90);
      unint64_t v92 = __clz(__rbit64(v90)) | (v337 << 6);
LABEL_73:
      uint64_t v93 = *((void *)v332 + 7);
      v94 = (void *)(*((void *)v332 + 6) + 16 * v92);
      uint64_t v95 = v94[1];
      *(void *)&long long v357 = *v94;
      *((void *)&v357 + 1) = v95;
      sub_1A4F68358(v93 + 32 * v92, (uint64_t)v330);
      swift_bridgeObjectRetain();
      goto LABEL_92;
    }
    int64_t v96 = v337 + 1;
    if (__OFADD__(v337, 1)) {
      goto LABEL_314;
    }
    if (v96 < v326)
    {
      unint64_t v97 = *(void *)(v324 + 8 * v96);
      if (v97) {
        goto LABEL_77;
      }
      int64_t v98 = v337 + 2;
      ++v337;
      if (v96 + 1 < v326)
      {
        unint64_t v97 = *(void *)(v324 + 8 * v98);
        if (v97) {
          goto LABEL_80;
        }
        int64_t v337 = v96 + 1;
        if (v96 + 2 < v326)
        {
          unint64_t v97 = *(void *)(v324 + 8 * (v96 + 2));
          if (v97)
          {
            v96 += 2;
            goto LABEL_77;
          }
          int64_t v98 = v96 + 3;
          int64_t v337 = v96 + 2;
          if (v96 + 3 < v326)
          {
            unint64_t v97 = *(void *)(v324 + 8 * v98);
            if (v97)
            {
LABEL_80:
              int64_t v96 = v98;
LABEL_77:
              v339 = (char *)((v97 - 1) & v97);
              unint64_t v92 = __clz(__rbit64(v97)) + (v96 << 6);
              int64_t v337 = v96;
              goto LABEL_73;
            }
            while (1)
            {
              int64_t v96 = v98 + 1;
              if (__OFADD__(v98, 1)) {
                goto LABEL_321;
              }
              if (v96 >= v326) {
                break;
              }
              unint64_t v97 = *(void *)(v324 + 8 * v96);
              ++v98;
              if (v97) {
                goto LABEL_77;
              }
            }
            int64_t v337 = v321;
          }
        }
      }
    }
    v339 = 0;
    long long v358 = 0u;
    long long v359 = 0u;
    long long v357 = 0u;
LABEL_92:
    sub_1A4F683B4((uint64_t)&v357, (uint64_t)&v360);
    v99 = (void *)*((void *)&v360 + 1);
    if (!*((void *)&v360 + 1))
    {
      swift_release();
      goto LABEL_143;
    }
    uint64_t v100 = v360;
    sub_1A4F6841C(v334, &v357);
    sub_1A4F68358((uint64_t)&v357, (uint64_t)&v375);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E96647D8);
    char v101 = swift_dynamicCast();
    id v341 = v99;
    v342 = (long long *)v100;
    if (v101) {
      break;
    }
    if (qword_1E9664670 != -1) {
      swift_once();
    }
    uint64_t v106 = __swift_project_value_buffer(v6, (uint64_t)qword_1E9664C38);
    (*(void (**)(char *, uint64_t, uint64_t))v329)(v85, v106, v6);
    uint64_t v107 = swift_allocObject();
    *(void *)(v107 + 16) = v342;
    *(void *)(v107 + 24) = v99;
    swift_bridgeObjectRetain_n();
    v108 = sub_1A4F7AEE8();
    os_log_type_t v109 = sub_1A4F7AFA8();
    uint64_t v110 = swift_allocObject();
    *(unsigned char *)(v110 + 16) = 32;
    uint64_t v111 = swift_allocObject();
    *(unsigned char *)(v111 + 16) = 8;
    uint64_t v112 = swift_allocObject();
    *(void *)(v112 + 16) = sub_1A4F68C34;
    *(void *)(v112 + 24) = v107;
    uint64_t v113 = swift_allocObject();
    *(void *)(v113 + 16) = sub_1A4F68BF4;
    *(void *)(v113 + 24) = v112;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664740);
    uint64_t v114 = swift_allocObject();
    *(_OWORD *)(v114 + 16) = v327;
    *(void *)(v114 + 32) = sub_1A4F68C30;
    *(void *)(v114 + 40) = v110;
    *(void *)(v114 + 4_Block_object_dispose(&STACK[0x280], 8) = sub_1A4F68C30;
    *(void *)(v114 + 56) = v111;
    *(void *)(v114 + 64) = sub_1A4F68BF8;
    *(void *)(v114 + 72) = v113;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v115 = v109;
    v116 = v108;
    if (os_log_type_enabled(v108, v109))
    {
      v117 = (uint8_t *)swift_slowAlloc();
      v118 = (void *)swift_slowAlloc();
      v375.id receiver = v118;
      *(_WORD *)v117 = 258;
      v117[2] = 32;
      swift_release();
      v117[3] = 8;
      swift_release();
      unint64_t v119 = (unint64_t)v341;
      swift_bridgeObjectRetain();
      *(void *)&long long v371 = sub_1A4F63668((uint64_t)v342, v119, (uint64_t *)&v375);
      sub_1A4F7AFE8();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A4E47000, v116, v115, "EKRemoteUIObjectSerializer: Cannot parse changeSet multiValueAdditions as Set<EKPersistentObject> for key: %s", v117, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A6266C00](v118, -1, -1);
      MEMORY[0x1A6266C00](v117, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    v85 = v336;
    uint64_t v6 = v340;
    (*v328)(v336, v340);
    sub_1A4F68358((uint64_t)&v357, (uint64_t)&v375);
    v120 = v365;
    char v121 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v371 = v120;
    uint64_t v122 = (uint64_t)v341;
    unint64_t v124 = sub_1A4F64554((uint64_t)v342, (uint64_t)v341);
    uint64_t v125 = v120[2];
    BOOL v126 = (v123 & 1) == 0;
    uint64_t v127 = v125 + v126;
    if (__OFADD__(v125, v126)) {
      goto LABEL_310;
    }
    char v128 = v123;
    if (v120[3] >= v127)
    {
      if (v121)
      {
        v131 = (void *)v371;
        if (v123) {
          goto LABEL_108;
        }
      }
      else
      {
        sub_1A4F673E4();
        v131 = (void *)v371;
        if (v128) {
          goto LABEL_108;
        }
      }
    }
    else
    {
      sub_1A4F65DBC(v127, v121);
      unint64_t v129 = sub_1A4F64554((uint64_t)v342, v122);
      if ((v128 & 1) != (v130 & 1)) {
        goto LABEL_325;
      }
      unint64_t v124 = v129;
      v131 = (void *)v371;
      if (v128)
      {
LABEL_108:
        v132 = (_OWORD *)(v131[7] + 32 * v124);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v132);
        sub_1A4F6841C(&v375, v132);
        goto LABEL_109;
      }
    }
    sub_1A4F671CC(v124, (uint64_t)v342, v122, &v375, v131);
    swift_bridgeObjectRetain();
LABEL_109:
    v365 = v131;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v357);
LABEL_70:
    unint64_t v90 = (unint64_t)v339;
  }
  unint64_t v102 = v371;
  *(void *)&long long v371 = MEMORY[0x1E4FBC870];
  if ((v102 & 0xC000000000000001) != 0)
  {
    sub_1A4F7B048();
    sub_1A4F68994(0, &qword_1E9664750);
    sub_1A4F68938(&qword_1E9664780, &qword_1E9664750);
    sub_1A4F7AF98();
    unint64_t v102 = (unint64_t)v366;
    unint64_t v348 = v367;
    uint64_t v103 = v368;
    uint64_t v104 = v369;
    unint64_t v105 = v370;
  }
  else
  {
    uint64_t v104 = 0;
    uint64_t v133 = -1 << *(unsigned char *)(v102 + 32);
    uint64_t v134 = *(void *)(v102 + 56);
    unint64_t v348 = v102 + 56;
    uint64_t v135 = ~v133;
    uint64_t v136 = -v133;
    if (v136 < 64) {
      uint64_t v137 = ~(-1 << v136);
    }
    else {
      uint64_t v137 = -1;
    }
    unint64_t v105 = v137 & v134;
    uint64_t v103 = v135;
  }
  super_class = (uint64_t *)(v102 & 0x7FFFFFFFFFFFFFFFLL);
  uint64_t v333 = v103;
  uint64_t v347 = (unint64_t)(v103 + 64) >> 6;
  while (2)
  {
    if ((v102 & 0x8000000000000000) != 0)
    {
      uint64_t v150 = sub_1A4F7B078();
      if (!v150) {
        goto LABEL_69;
      }
      *(void *)&long long v355 = v150;
      sub_1A4F68994(0, &qword_1E9664750);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v151 = v375.receiver;
      swift_unknownObjectRelease();
      uint64_t v149 = v104;
      uint64_t v147 = v105;
      if (!v151) {
        goto LABEL_69;
      }
      goto LABEL_138;
    }
    if (v105)
    {
      uint64_t v147 = (v105 - 1) & v105;
      unint64_t v148 = __clz(__rbit64(v105)) | (v104 << 6);
      uint64_t v149 = v104;
      goto LABEL_137;
    }
    uint64_t v152 = v104 + 1;
    if (!__OFADD__(v104, 1))
    {
      if (v152 >= v347) {
        goto LABEL_69;
      }
      unint64_t v153 = *(void *)(v348 + 8 * v152);
      uint64_t v149 = v104 + 1;
      if (!v153)
      {
        uint64_t v149 = v104 + 2;
        if (v104 + 2 >= v347) {
          goto LABEL_69;
        }
        unint64_t v153 = *(void *)(v348 + 8 * v149);
        if (!v153)
        {
          uint64_t v149 = v104 + 3;
          if (v104 + 3 >= v347) {
            goto LABEL_69;
          }
          unint64_t v153 = *(void *)(v348 + 8 * v149);
          if (!v153)
          {
            uint64_t v149 = v104 + 4;
            if (v104 + 4 >= v347) {
              goto LABEL_69;
            }
            unint64_t v153 = *(void *)(v348 + 8 * v149);
            if (!v153)
            {
              uint64_t v154 = v104 + 5;
              while (v347 != v154)
              {
                unint64_t v153 = *(void *)(v348 + 8 * v154++);
                if (v153)
                {
                  uint64_t v149 = v154 - 1;
                  goto LABEL_136;
                }
              }
LABEL_69:
              sub_1A4F6898C();
              v91 = (void *)v371;
              uint64_t v377 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664738);
              v375.id receiver = v91;
              sub_1A4F5E40C((uint64_t)&v375, (uint64_t)v342, (uint64_t)v341);
              __swift_destroy_boxed_opaque_existential_0((uint64_t)&v357);
              uint64_t v6 = v340;
              v85 = v336;
              goto LABEL_70;
            }
          }
        }
      }
LABEL_136:
      uint64_t v147 = (v153 - 1) & v153;
      unint64_t v148 = __clz(__rbit64(v153)) + (v149 << 6);
LABEL_137:
      id v151 = *(id *)(*(void *)(v102 + 48) + 8 * v148);
      if (!v151) {
        goto LABEL_69;
      }
LABEL_138:
      id v155 = objc_msgSend(v151, sel_objectID, v321);
      if (v155)
      {
        v138 = v155;
        unsigned __int8 v139 = objc_msgSend(v151, sel_isPendingInsert);
        v140 = (objc_class *)type metadata accessor for EKRemoteUIPersistentObjectPointer();
        v141 = objc_allocWithZone(v140);
        id v142 = v138;
        *(void *)&v141[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = v142;
        v141[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = v139;
        v375.id receiver = v141;
        v375.super_class = v140;
        id v143 = objc_msgSendSuper2(&v375, sel_init);
        sub_1A4F63FE8(&v375, v143);

        v144 = v349;
        uint64_t v145 = sub_1A4F5D38C(v151, v350 & 1, v349);
        char v146 = swift_isUniquelyReferenced_nonNull_native();
        v375.id receiver = *v144;
        id *v144 = (id)0x8000000000000000;
        sub_1A4F66C08(v145, v142, v146);
        id *v144 = v375.receiver;

        swift_bridgeObjectRelease();
      }
      else
      {
      }
      uint64_t v104 = v149;
      unint64_t v105 = v147;
      continue;
    }
    break;
  }
  __break(1u);
LABEL_306:
  __break(1u);
LABEL_307:
  __break(1u);
LABEL_308:
  __break(1u);
LABEL_309:
  __break(1u);
LABEL_310:
  __break(1u);
LABEL_311:
  __break(1u);
LABEL_312:
  __break(1u);
LABEL_313:
  __break(1u);
LABEL_314:
  __break(1u);
LABEL_315:
  __break(1u);
LABEL_316:
  __break(1u);
LABEL_317:
  __break(1u);
LABEL_318:
  __break(1u);
LABEL_319:
  __break(1u);
LABEL_320:
  __break(1u);
LABEL_321:
  __break(1u);
LABEL_322:
  __break(1u);
LABEL_323:
  __break(1u);
LABEL_324:
  __break(1u);
LABEL_325:
  uint64_t result = sub_1A4F7B1F8();
  __break(1u);
  return result;
}

id EKRemoteUIObjectSerializer.serializedRepresentation(ekObject:)(void *a1)
{
  uint64_t v8 = MEMORY[0x1E4FBC868];
  id v9 = (id)MEMORY[0x1E4FBC868];
  uint64_t v1 = sub_1A4F5A980(a1, 0, &v9, &v8);
  uint64_t v3 = v8;
  id v2 = v9;
  uint64_t v4 = (objc_class *)type metadata accessor for EKRemoteUISerializedObject();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_serializedObjectIDDictionary] = v1;
  *(void *)&v5[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToChangeSetDictionaryMap] = v2;
  *(void *)&v5[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToPersistentDictionaryMap] = v3;
  v7.id receiver = v5;
  v7.super_class = v4;
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t sub_1A4F5D38C(void *a1, char a2, void *a3)
{
  id v3 = objc_msgSend(a1, sel_updatedPropertiesWithOnlyPersistentObjects);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_1A4F7AF38();

    uint64_t v132 = v5 + 64;
    uint64_t v6 = 1 << *(unsigned char *)(v5 + 32);
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v5 + 64);
    uint64_t v134 = v5;
    int64_t v135 = 0;
    int64_t v133 = (unint64_t)(v6 + 63) >> 6;
    uint64_t v137 = (void *)MEMORY[0x1E4FBC868];
    while (1)
    {
      if (v8)
      {
        unint64_t v11 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v12 = v11 | (v135 << 6);
      }
      else
      {
        int64_t v16 = v135 + 1;
        if (__OFADD__(v135, 1)) {
          goto LABEL_143;
        }
        if (v16 >= v133) {
          goto LABEL_27;
        }
        unint64_t v17 = *(void *)(v132 + 8 * v16);
        if (!v17)
        {
          int64_t v18 = v135 + 2;
          ++v135;
          if (v16 + 1 >= v133) {
            goto LABEL_27;
          }
          unint64_t v17 = *(void *)(v132 + 8 * v18);
          if (v17)
          {
            ++v16;
          }
          else
          {
            int64_t v19 = v16 + 2;
            int64_t v135 = v16 + 1;
            if (v16 + 2 >= v133) {
              goto LABEL_27;
            }
            unint64_t v17 = *(void *)(v132 + 8 * v19);
            if (!v17)
            {
              while (1)
              {
                int64_t v16 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_148;
                }
                if (v16 >= v133) {
                  break;
                }
                unint64_t v17 = *(void *)(v132 + 8 * v16);
                ++v19;
                if (v17) {
                  goto LABEL_15;
                }
              }
              int64_t v135 = v133 - 1;
LABEL_27:
              unint64_t v8 = 0;
              memset(v156, 0, 32);
              long long v155 = 0u;
              goto LABEL_28;
            }
            v16 += 2;
          }
        }
LABEL_15:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v12 = __clz(__rbit64(v17)) + (v16 << 6);
        int64_t v135 = v16;
      }
      uint64_t v13 = *(void *)(v134 + 56);
      uint64_t v14 = (void *)(*(void *)(v134 + 48) + 16 * v12);
      uint64_t v15 = v14[1];
      *(void *)&long long v155 = *v14;
      *((void *)&v155 + 1) = v15;
      sub_1A4F68358(v13 + 32 * v12, (uint64_t)v156);
      swift_bridgeObjectRetain();
LABEL_28:
      sub_1A4F683B4((uint64_t)&v155, (uint64_t)&v157);
      uint64_t v20 = v158;
      if (!v158)
      {
        swift_release();
        return (uint64_t)v137;
      }
      uint64_t v142 = v157;
      sub_1A4F6841C(&v159, &v155);
      sub_1A4F68358((uint64_t)&v155, (uint64_t)&v153);
      sub_1A4F68994(0, &qword_1E9664750);
      uint64_t v143 = v20;
      if (swift_dynamicCast())
      {
        id v21 = v150[0];
        id v22 = objc_msgSend(v150[0], sel_objectID);
        if (!v22)
        {

          goto LABEL_37;
        }
        uint64_t v23 = v22;
        unsigned __int8 v24 = objc_msgSend(v21, sel_isPendingInsert);
        v25 = (objc_class *)type metadata accessor for EKRemoteUIPersistentObjectPointer();
        unint64_t v26 = objc_allocWithZone(v25);
        *(void *)&v26[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = v23;
        v26[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = v24;
        v146.id receiver = v26;
        v146.super_class = v25;
        id v27 = v23;
        id v28 = objc_msgSendSuper2(&v146, sel_init);
        if (!objc_msgSend((id)swift_getObjCClassFromObject(), sel_meltedClass)) {
          goto LABEL_149;
        }
        swift_getObjCClassMetadata();
        id v29 = v21;
        uint64_t v30 = v142;
        uint64_t v31 = v20;
        unint64_t v32 = (void *)sub_1A4F7AF48();
        unsigned int v33 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_isWeakRelationObject_forKey_, v29, v32);

        self;
        if (!swift_dynamicCastObjCClass()) {
          goto LABEL_130;
        }
        if (v142 == sub_1A4F7AF58() && v34 == v31)
        {
          swift_bridgeObjectRelease();
LABEL_56:
          id v59 = objc_msgSend(self, sel_virtualObjectIDWithEntityType_, 1);
          if (!v59) {
            goto LABEL_151;
          }
          BOOL v60 = v59;
          uint64_t v61 = objc_allocWithZone(v25);
          *(void *)&v61[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = v60;
          v61[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = 0;
          v145.id receiver = v61;
          v145.super_class = v25;
          id v62 = v60;
          id v63 = objc_msgSendSuper2(&v145, sel_init);
          *((void *)&v151 + 1) = v25;

LABEL_125:
          v150[0] = v63;
          sub_1A4F6841C(v150, &v153);
          sub_1A4F68358((uint64_t)&v153, (uint64_t)v150);
          sub_1A4F68994(0, &qword_1E96647A8);
          if (swift_dynamicCast())
          {

            v120 = v137;
            swift_bridgeObjectRetain();
            unint64_t v121 = sub_1A4F64554(v142, v143);
            char v123 = v122;
            swift_bridgeObjectRelease();
            if (v123)
            {
              char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              id v152 = v137;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                sub_1A4F673E4();
                v120 = v152;
              }
              swift_bridgeObjectRelease();
              sub_1A4F6841C((_OWORD *)(v120[7] + 32 * v121), v150);
              uint64_t v137 = v120;
              sub_1A4F666A4(v121, (uint64_t)v120);
              swift_bridgeObjectRelease();
            }
            else
            {
              *(_OWORD *)uint64_t v150 = 0u;
              long long v151 = 0u;
            }
            swift_bridgeObjectRelease();
            sub_1A4F68B34((uint64_t)v150, &qword_1E9664710);
          }
          else
          {
            sub_1A4F68358((uint64_t)&v153, (uint64_t)v150);
            char v130 = swift_isUniquelyReferenced_nonNull_native();
            id v152 = v137;
            sub_1A4F66D7C(v150, v142, v143, v130);
            uint64_t v137 = v152;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v153);
          if (!v33) {
            goto LABEL_131;
          }
LABEL_136:
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v155);
        }
        else
        {
          char v58 = sub_1A4F7B1D8();
          swift_bridgeObjectRelease();
          if (v58) {
            goto LABEL_56;
          }
          uint64_t v30 = v142;
          uint64_t v31 = v143;
          if (v142 == sub_1A4F7AF58() && v65 == v143)
          {
            swift_bridgeObjectRelease();
LABEL_124:
            *((void *)&v151 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664738);
            id v63 = (id)MEMORY[0x1E4FBC870];
            goto LABEL_125;
          }
          char v119 = sub_1A4F7B1D8();
          swift_bridgeObjectRelease();
          if (v119) {
            goto LABEL_124;
          }
LABEL_130:
          *(_OWORD *)uint64_t v150 = 0u;
          long long v151 = 0u;
          sub_1A4F68B34((uint64_t)v150, &qword_1E9664710);
          *((void *)&v154 + 1) = v25;
          *(void *)&long long v153 = v28;
          sub_1A4F6841C(&v153, v150);
          id v125 = v28;
          char v126 = swift_isUniquelyReferenced_nonNull_native();
          id v152 = v137;
          sub_1A4F66D7C(v150, v30, v31, v126);
          uint64_t v137 = v152;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v33) {
            goto LABEL_136;
          }
LABEL_131:
          id v127 = v27;
          uint64_t v128 = sub_1A4F5D38C(v29, a2 & 1, a3);
          char v129 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v153 = *a3;
          *a3 = 0x8000000000000000;
          sub_1A4F66C08(v128, v127, v129);
          *a3 = v153;

          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v155);
        }
      }
      else
      {
LABEL_37:
        unint64_t v136 = v8;
        sub_1A4F68358((uint64_t)&v155, (uint64_t)&v153);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E96647D8);
        if (swift_dynamicCast())
        {
          unint64_t v35 = (unint64_t)v150[0];
          id v152 = (id)MEMORY[0x1E4FBC870];
          self;
          if (swift_dynamicCastObjCClass())
          {
            if (v142 == sub_1A4F7AF58() && v36 == v20)
            {
              swift_bridgeObjectRelease();
              goto LABEL_53;
            }
            char v51 = sub_1A4F7B1D8();
            swift_bridgeObjectRelease();
            if (v51)
            {
LABEL_53:
              id v52 = objc_msgSend(self, sel_virtualObjectIDWithEntityType_, 1);
              if (!v52) {
                goto LABEL_150;
              }
              uint64_t v53 = v52;
              char v54 = (objc_class *)type metadata accessor for EKRemoteUIPersistentObjectPointer();
              unint64_t v55 = objc_allocWithZone(v54);
              *(void *)&v55[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = v53;
              v55[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = 0;
              v147.id receiver = v55;
              v147.super_class = v54;
              id v56 = v53;
              id v57 = objc_msgSendSuper2(&v147, sel_init);
              *((void *)&v154 + 1) = v54;

LABEL_66:
              *(void *)&long long v153 = v57;
              __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664738);
              if (swift_dynamicCast())
              {
                swift_bridgeObjectRelease();
                id v67 = v150[0];
                swift_bridgeObjectRelease();
                id v152 = v67;
                goto LABEL_113;
              }
LABEL_69:
              if ((v35 & 0xC000000000000001) != 0)
              {
                sub_1A4F7B048();
                sub_1A4F68938(&qword_1E9664780, &qword_1E9664750);
                sub_1A4F7AF98();
                unint64_t v35 = v160;
                unsigned __int8 v139 = v161;
                uint64_t v68 = v162;
                uint64_t v69 = v163;
                unint64_t v70 = v164;
              }
              else
              {
                uint64_t v69 = 0;
                uint64_t v71 = -1 << *(unsigned char *)(v35 + 32);
                unsigned __int8 v139 = (char *)(v35 + 56);
                uint64_t v72 = ~v71;
                uint64_t v73 = -v71;
                if (v73 < 64) {
                  uint64_t v74 = ~(-1 << v73);
                }
                else {
                  uint64_t v74 = -1;
                }
                unint64_t v70 = v74 & *(void *)(v35 + 56);
                uint64_t v68 = v72;
              }
              int64_t v138 = (unint64_t)(v68 + 64) >> 6;
              unint64_t v141 = v35;
              if ((v35 & 0x8000000000000000) == 0) {
                goto LABEL_81;
              }
              while (2)
              {
                v75 = (void *)sub_1A4F7B078();
                if (!v75
                  || (v150[0] = v75,
                      swift_unknownObjectRetain(),
                      swift_dynamicCast(),
                      id v76 = (id)v153,
                      swift_unknownObjectRelease(),
                      uint64_t v77 = v69,
                      uint64_t v78 = v70,
                      !v76))
                {
LABEL_112:
                  sub_1A4F6898C();
                  id v67 = v152;
LABEL_113:
                  *((void *)&v154 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664738);
                  *(void *)&long long v153 = v67;
                  sub_1A4F6841C(&v153, v150);
                  char v108 = swift_isUniquelyReferenced_nonNull_native();
                  uint64_t v149 = v137;
                  unint64_t v110 = sub_1A4F64554(v142, v20);
                  uint64_t v111 = v137[2];
                  BOOL v112 = (v109 & 1) == 0;
                  uint64_t v113 = v111 + v112;
                  if (__OFADD__(v111, v112)) {
                    goto LABEL_145;
                  }
                  char v114 = v109;
                  if (v137[3] >= v113)
                  {
                    unint64_t v8 = v136;
                    if ((v108 & 1) == 0)
                    {
                      sub_1A4F673E4();
                      goto LABEL_117;
                    }
                  }
                  else
                  {
                    sub_1A4F65DBC(v113, v108);
                    unint64_t v115 = sub_1A4F64554(v142, v20);
                    if ((v114 & 1) != (v116 & 1)) {
                      goto LABEL_153;
                    }
                    unint64_t v110 = v115;
LABEL_117:
                    unint64_t v8 = v136;
                  }
                  unsigned __int8 v46 = v149;
                  uint64_t v137 = v149;
                  if (v114)
                  {
                    id v9 = (_OWORD *)(v149[7] + 32 * v110);
                    __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
                    id v10 = v150;
                    goto LABEL_7;
                  }
                  v149[(v110 >> 6) + 8] |= 1 << v110;
                  v117 = (uint64_t *)(v46[6] + 16 * v110);
                  uint64_t *v117 = v142;
                  v117[1] = v20;
                  sub_1A4F6841C(v150, (_OWORD *)(v46[7] + 32 * v110));
                  uint64_t v118 = v46[2];
                  BOOL v49 = __OFADD__(v118, 1);
                  uint64_t v50 = v118 + 1;
                  if (v49) {
                    goto LABEL_147;
                  }
                  goto LABEL_122;
                }
LABEL_98:
                id v83 = objc_msgSend(v76, sel_objectID);
                if (v83)
                {
                  id v84 = v83;
                  unint64_t v70 = v78;
                  unsigned __int8 v85 = objc_msgSend(v76, sel_isPendingInsert);
                  v86 = (objc_class *)type metadata accessor for EKRemoteUIPersistentObjectPointer();
                  uint64_t v87 = objc_allocWithZone(v86);
                  *(void *)&v87[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = v84;
                  v87[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = v85;
                  v148.id receiver = v87;
                  v148.super_class = v86;
                  id v88 = v84;
                  id v89 = objc_msgSendSuper2(&v148, sel_init);
                  sub_1A4F63FE8(&v153, v89);

                  id v90 = v88;
                  uint64_t v91 = sub_1A4F5D38C(v76, a2 & 1, a3);
                  char v92 = swift_isUniquelyReferenced_nonNull_native();
                  *(void *)&long long v153 = *a3;
                  uint64_t v93 = v153;
                  *a3 = 0x8000000000000000;
                  unint64_t v95 = sub_1A4F64510((uint64_t)v90);
                  uint64_t v96 = *(void *)(v93 + 16);
                  BOOL v97 = (v94 & 1) == 0;
                  uint64_t v98 = v96 + v97;
                  if (__OFADD__(v96, v97))
                  {
                    __break(1u);
LABEL_141:
                    __break(1u);
LABEL_142:
                    __break(1u);
LABEL_143:
                    __break(1u);
LABEL_144:
                    __break(1u);
LABEL_145:
                    __break(1u);
LABEL_146:
                    __break(1u);
LABEL_147:
                    __break(1u);
LABEL_148:
                    __break(1u);
LABEL_149:
                    __break(1u);
LABEL_150:
                    __break(1u);
LABEL_151:
                    __break(1u);
LABEL_152:
                    sub_1A4F68994(0, &qword_1E96646F8);
                    sub_1A4F7B1F8();
                    __break(1u);
LABEL_153:
                    uint64_t result = sub_1A4F7B1F8();
                    __break(1u);
                    return result;
                  }
                  char v99 = v94;
                  if (*(void *)(v93 + 24) >= v98)
                  {
                    if (v92)
                    {
                      unint64_t v102 = (void *)v153;
                      if ((v94 & 1) == 0) {
                        goto LABEL_108;
                      }
                    }
                    else
                    {
                      sub_1A4F67238();
                      unint64_t v102 = (void *)v153;
                      if ((v99 & 1) == 0) {
                        goto LABEL_108;
                      }
                    }
                  }
                  else
                  {
                    sub_1A4F65AE4(v98, v92);
                    unint64_t v100 = sub_1A4F64510((uint64_t)v90);
                    if ((v99 & 1) != (v101 & 1)) {
                      goto LABEL_152;
                    }
                    unint64_t v95 = v100;
                    unint64_t v102 = (void *)v153;
                    if ((v99 & 1) == 0)
                    {
LABEL_108:
                      v102[(v95 >> 6) + 8] |= 1 << v95;
                      uint64_t v104 = 8 * v95;
                      *(void *)(v102[6] + v104) = v90;
                      *(void *)(v102[7] + v104) = v91;
                      uint64_t v105 = v102[2];
                      BOOL v49 = __OFADD__(v105, 1);
                      uint64_t v106 = v105 + 1;
                      if (v49) {
                        goto LABEL_141;
                      }
                      v102[2] = v106;
                      id v107 = v90;
                      goto LABEL_110;
                    }
                  }
                  uint64_t v103 = v102[7];
                  swift_bridgeObjectRelease();
                  *(void *)(v103 + 8 * v95) = v91;
LABEL_110:
                  *a3 = v102;

                  swift_bridgeObjectRelease();
                  uint64_t v69 = v77;
                  uint64_t v20 = v143;
                  unint64_t v35 = v141;
                  if ((v141 & 0x8000000000000000) != 0) {
                    continue;
                  }
                }
                else
                {

                  uint64_t v69 = v77;
                  unint64_t v70 = v78;
                  if ((v35 & 0x8000000000000000) != 0) {
                    continue;
                  }
                }
                break;
              }
LABEL_81:
              if (v70)
              {
                uint64_t v78 = (v70 - 1) & v70;
                unint64_t v79 = __clz(__rbit64(v70)) | (v69 << 6);
                uint64_t v77 = v69;
              }
              else
              {
                int64_t v80 = v69 + 1;
                if (__OFADD__(v69, 1)) {
                  goto LABEL_142;
                }
                if (v80 >= v138) {
                  goto LABEL_112;
                }
                unint64_t v81 = *(void *)&v139[8 * v80];
                uint64_t v77 = v69 + 1;
                if (!v81)
                {
                  uint64_t v77 = v69 + 2;
                  if (v69 + 2 >= v138) {
                    goto LABEL_112;
                  }
                  unint64_t v81 = *(void *)&v139[8 * v77];
                  if (!v81)
                  {
                    uint64_t v77 = v69 + 3;
                    if (v69 + 3 >= v138) {
                      goto LABEL_112;
                    }
                    unint64_t v81 = *(void *)&v139[8 * v77];
                    if (!v81)
                    {
                      uint64_t v77 = v69 + 4;
                      if (v69 + 4 >= v138) {
                        goto LABEL_112;
                      }
                      unint64_t v81 = *(void *)&v139[8 * v77];
                      if (!v81)
                      {
                        uint64_t v82 = v69 + 5;
                        while (v138 != v82)
                        {
                          unint64_t v81 = *(void *)&v139[8 * v82++];
                          if (v81)
                          {
                            uint64_t v77 = v82 - 1;
                            goto LABEL_96;
                          }
                        }
                        goto LABEL_112;
                      }
                    }
                  }
                }
LABEL_96:
                uint64_t v78 = (v81 - 1) & v81;
                unint64_t v79 = __clz(__rbit64(v81)) + (v77 << 6);
              }
              id v76 = *(id *)(*(void *)(v35 + 48) + 8 * v79);
              if (!v76) {
                goto LABEL_112;
              }
              goto LABEL_98;
            }
            if (v142 == sub_1A4F7AF58() && v64 == v20)
            {
              swift_bridgeObjectRelease();
LABEL_65:
              *((void *)&v154 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664738);
              id v57 = (id)MEMORY[0x1E4FBC870];
              goto LABEL_66;
            }
            char v66 = sub_1A4F7B1D8();
            swift_bridgeObjectRelease();
            if (v66) {
              goto LABEL_65;
            }
          }
          long long v154 = 0u;
          long long v153 = 0u;
          sub_1A4F68B34((uint64_t)&v153, &qword_1E9664710);
          goto LABEL_69;
        }
        sub_1A4F68358((uint64_t)&v155, (uint64_t)&v153);
        char v37 = swift_isUniquelyReferenced_nonNull_native();
        v150[0] = v137;
        unint64_t v39 = sub_1A4F64554(v142, v20);
        uint64_t v40 = v137[2];
        BOOL v41 = (v38 & 1) == 0;
        uint64_t v42 = v40 + v41;
        if (__OFADD__(v40, v41)) {
          goto LABEL_144;
        }
        char v43 = v38;
        if (v137[3] >= v42)
        {
          if ((v37 & 1) == 0) {
            sub_1A4F673E4();
          }
        }
        else
        {
          sub_1A4F65DBC(v42, v37);
          unint64_t v44 = sub_1A4F64554(v142, v20);
          if ((v43 & 1) != (v45 & 1)) {
            goto LABEL_153;
          }
          unint64_t v39 = v44;
        }
        unsigned __int8 v46 = v150[0];
        uint64_t v137 = v150[0];
        if (v43)
        {
          id v9 = (_OWORD *)(*((void *)v150[0] + 7) + 32 * v39);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
          id v10 = (id *)&v153;
LABEL_7:
          sub_1A4F6841C(v10, v9);
          goto LABEL_8;
        }
        *((void *)v150[0] + (v39 >> 6) + 8) |= 1 << v39;
        uint64_t v47 = (uint64_t *)(v46[6] + 16 * v39);
        *uint64_t v47 = v142;
        v47[1] = v20;
        sub_1A4F6841C(&v153, (_OWORD *)(v46[7] + 32 * v39));
        uint64_t v48 = v46[2];
        BOOL v49 = __OFADD__(v48, 1);
        uint64_t v50 = v48 + 1;
        if (v49) {
          goto LABEL_146;
        }
LABEL_122:
        v46[2] = v50;
        swift_bridgeObjectRetain();
LABEL_8:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v155);
      }
    }
  }
  return MEMORY[0x1E4FBC868];
}

uint64_t sub_1A4F5E40C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_1A4F6841C((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *id v3 = 0x8000000000000000;
    sub_1A4F66D7C(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *id v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1A4F68B34(a1, &qword_1E9664710);
    sub_1A4F63CC0(a2, a3, v9);
    swift_bridgeObjectRelease();
    return sub_1A4F68B34((uint64_t)v9, &qword_1E9664710);
  }
}

uint64_t sub_1A4F5E4E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (a1)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = *v3;
    *id v3 = 0x8000000000000000;
    sub_1A4F6705C(a1, a2, a3, isUniquelyReferenced_nonNull_native);
    *id v3 = v15;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_1A4F64554(a2, a3);
    char v11 = v10;
    swift_bridgeObjectRelease();
    if (v11)
    {
      char v12 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v13 = *v3;
      uint64_t v16 = *v4;
      *uint64_t v4 = 0x8000000000000000;
      if ((v12 & 1) == 0)
      {
        sub_1A4F6776C();
        uint64_t v13 = v16;
      }
      swift_bridgeObjectRelease();
      sub_1A4F66A30(v9, v13);
      *uint64_t v4 = v13;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
    {
      __break(0xC471u);
    }
  }
  return swift_bridgeObjectRelease();
}

unint64_t sub_1A4F5E640(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E96647A0);
  uint64_t v2 = sub_1A4F7B1A8();
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1A4F68B90(v6, (uint64_t)&v15, (uint64_t *)&unk_1E9664800);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1A4F64554(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    char v11 = (uint64_t *)(v3[6] + 16 * result);
    *char v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1A4F6841C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1A4F5E778(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E96647A0);
    uint64_t v2 = (void *)sub_1A4F7B1A8();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v23 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v7 << 6);
      int64_t v12 = v7;
    }
    else
    {
      int64_t v13 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_37;
      }
      if (v13 >= v22)
      {
LABEL_33:
        sub_1A4F6898C();
        return (unint64_t)v2;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v13);
      int64_t v12 = v7 + 1;
      if (!v14)
      {
        int64_t v12 = v7 + 2;
        if (v7 + 2 >= v22) {
          goto LABEL_33;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v7 + 3;
          if (v7 + 3 >= v22) {
            goto LABEL_33;
          }
          unint64_t v14 = *(void *)(v23 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v7 + 4;
            if (v7 + 4 >= v22) {
              goto LABEL_33;
            }
            unint64_t v14 = *(void *)(v23 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v7 + 5;
              if (v7 + 5 >= v22) {
                goto LABEL_33;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_38;
                  }
                  if (v12 >= v22) {
                    goto LABEL_33;
                  }
                  unint64_t v14 = *(void *)(v23 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_1A4F68A14(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_1A4F68358(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_1A4F68A14((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_1A4F68B34((uint64_t)v30, &qword_1E96647F8);
      swift_bridgeObjectRelease();
      sub_1A4F6898C();
      swift_release();
      return 0;
    }
    sub_1A4F68358((uint64_t)v31 + 8, (uint64_t)v25);
    sub_1A4F68B34((uint64_t)v30, &qword_1E96647F8);
    sub_1A4F6841C(v25, v26);
    long long v27 = v24;
    sub_1A4F6841C(v26, v28);
    long long v16 = v27;
    sub_1A4F6841C(v28, v29);
    sub_1A4F6841C(v29, &v27);
    unint64_t result = sub_1A4F64554(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      uint64_t v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v8 = v16;
      unint64_t v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
      unint64_t result = (unint64_t)sub_1A4F6841C(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_1A4F6841C(&v27, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v19 = v2[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_36;
    }
    v2[2] = v21;
LABEL_8:
    int64_t v7 = v12;
    unint64_t v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_1A4F5EB4C(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1A4F63460(0, v3[2] + 1, 1, v3);
    uint64_t v3 = (void *)result;
  }
  unint64_t v6 = v3[2];
  unint64_t v5 = v3[3];
  if (v6 >= v5 >> 1)
  {
    uint64_t result = (uint64_t)sub_1A4F63460((void *)(v5 > 1), v6 + 1, 1, v3);
    uint64_t v3 = (void *)result;
  }
  v3[2] = v6 + 1;
  v3[v6 + 4] = a1;
  *uint64_t v1 = v3;
  return result;
}

id EKRemoteUIObjectSerializer.deserializedRepresentation(serializedDictionary:objectIDToChangeSetDictionaryMap:objectIDToPersistentDictionaryMap:eventStore:occurrenceDate:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v11 = MEMORY[0x1E4FBC868];
  uint64_t v12 = MEMORY[0x1E4FBC868];
  unint64_t v5 = (void *)sub_1A4F5EC98(a1, a2, a3, a4, a5, &v12, &v11);
  swift_bridgeObjectRelease();
  if (v5)
  {
    uint64_t v6 = v12;
    if (v12)
    {
      int64_t v7 = (objc_class *)type metadata accessor for EKRemoteUIDeserializedObject();
      uint64_t v8 = (char *)objc_allocWithZone(v7);
      *(void *)&v8[OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_deserializedObject] = v5;
      *(void *)&v8[OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_tempObjectIDMap] = v6;
      v10.id receiver = v8;
      v10.super_class = v7;
      return objc_msgSendSuper2(&v10, sel_init);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_1A4F5EC98(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6, uint64_t *a7)
{
  uint64_t v8 = v7;
  unint64_t v311 = a6;
  uint64_t v312 = a7;
  uint64_t v313 = a4;
  uint64_t v308 = a3;
  uint64_t v310 = a2;
  uint64_t v306 = sub_1A4F7AF08();
  uint64_t v302 = *(long long **)(v306 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v306);
  uint64_t v304 = (_OWORD *)((char *)&v277 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v11);
  uint64_t v303 = (char *)&v277 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E96646F0);
  uint64_t v15 = MEMORY[0x1F4188790](v14 - 8);
  uint64_t v307 = (char *)&v277 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  char v18 = (char *)&v277 - v17;
  if (!*(void *)(a1 + 16))
  {
    v322[0] = 0u;
    long long v321 = 0u;
    goto LABEL_9;
  }
  uint64_t v19 = *(void *)(v7 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKIsPendingInsertKey);
  uint64_t v20 = *(void *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKIsPendingInsertKey + 8);
  swift_bridgeObjectRetain();
  unint64_t v21 = sub_1A4F64554(v19, v20);
  if ((v22 & 1) == 0)
  {
    v322[0] = 0u;
    long long v321 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_1A4F68358(*(void *)(a1 + 56) + 32 * v21, (uint64_t)&v321);
  swift_bridgeObjectRelease();
  if (!*((void *)&v322[0] + 1))
  {
LABEL_9:
    sub_1A4F68B34((uint64_t)&v321, &qword_1E9664710);
LABEL_10:
    char v23 = 0;
    id v305 = 0;
    if (!*(void *)(a1 + 16)) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
  sub_1A4F68994(0, &qword_1E9664758);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_10;
  }
  id v305 = (id)v318;
  char v23 = objc_msgSend((id)v318, sel_BOOLValue);
  if (!*(void *)(a1 + 16))
  {
LABEL_6:
    v322[0] = 0u;
    long long v321 = 0u;
    int64_t v24 = v306;
LABEL_78:
    sub_1A4F68B34((uint64_t)&v321, &qword_1E9664710);
    goto LABEL_79;
  }
LABEL_11:
  uint64_t v25 = *(void *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKPersistentObjectKey);
  uint64_t v26 = *(void *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKPersistentObjectKey + 8);
  swift_bridgeObjectRetain();
  unint64_t v27 = sub_1A4F64554(v25, v26);
  if (v28)
  {
    sub_1A4F68358(*(void *)(a1 + 56) + 32 * v27, (uint64_t)&v321);
  }
  else
  {
    v322[0] = 0u;
    long long v321 = 0u;
  }
  int64_t v24 = v306;
  swift_bridgeObjectRelease();
  if (!*((void *)&v322[0] + 1)) {
    goto LABEL_78;
  }
  sub_1A4F68994(0, &qword_1E96646F8);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_79:
    id v94 = v305;
    if (qword_1E9664670 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v24, (uint64_t)qword_1E9664C38);
    unint64_t v95 = sub_1A4F7AEE8();
    os_log_type_t v96 = sub_1A4F7AFA8();
    if (os_log_type_enabled(v95, v96))
    {
      BOOL v97 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v97 = 0;
      _os_log_impl(&dword_1A4E47000, v95, v96, "EKRemoteUIObjectSerializer: Cannot create persistentObject because objectID is nil", v97, 2u);
      MEMORY[0x1A6266C00](v97, -1, -1);
      goto LABEL_83;
    }

    goto LABEL_85;
  }
  uint64_t v296 = (id)v318;
  sub_1A4F6165C(v296, v308, v313, v23, v311, v312);
  if (!v29)
  {
    if (qword_1E9664670 != -1) {
      goto LABEL_316;
    }
    goto LABEL_89;
  }
  uint64_t v30 = v29;
  self;
  uint64_t v31 = swift_dynamicCastObjCClass();
  char v291 = v30;
  uint64_t v292 = a1;
  if (!v31)
  {
    uint64_t v104 = v30;
    id v38 = objc_msgSend(v313, sel_publicObjectWithPersistentObject_, v104);
    if (v38) {
      goto LABEL_21;
    }
LABEL_92:
    if (qword_1E9664670 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v24, (uint64_t)qword_1E9664C38);
    unint64_t v95 = sub_1A4F7AEE8();
    os_log_type_t v105 = sub_1A4F7AFA8();
    BOOL v106 = os_log_type_enabled(v95, v105);
    id v94 = v305;
    if (!v106)
    {

      uint64_t v111 = v296;
      char v109 = v291;
      goto LABEL_100;
    }
    id v107 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v107 = 0;
    _os_log_impl(&dword_1A4E47000, v95, v105, "EKRemoteUIObjectSerializer: Cannot create EKObject from deserialized EKPersistentObject", v107, 2u);
    MEMORY[0x1A6266C00](v107, -1, -1);
    char v108 = v296;

    unint64_t v95 = v291;
LABEL_83:

    return 0;
  }
  uint64_t v32 = v31;
  sub_1A4F68B90(a5, (uint64_t)v18, &qword_1E96646F0);
  uint64_t v33 = sub_1A4F7AED8();
  uint64_t v34 = *(void *)(v33 - 8);
  int v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48))(v18, 1, v33);
  uint64_t v36 = v30;
  char v37 = 0;
  if (v35 != 1)
  {
    char v37 = (void *)sub_1A4F7AEB8();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v18, v33);
  }
  id v38 = objc_msgSend(objc_allocWithZone((Class)EKEvent), sel_initWithPersistentObject_occurrenceDate_, v32, v37);

  a1 = v292;
  int64_t v24 = v306;
  if (!v38) {
    goto LABEL_92;
  }
LABEL_21:
  id v293 = v38;
  uint64_t v39 = *(void *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetKey);
  uint64_t v40 = *(void *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetKey + 8);
  swift_bridgeObjectRetain();
  sub_1A4F615F8(v39, v40, a1, &v321);
  swift_bridgeObjectRelease();
  uint64_t v309 = v8;
  if (!*((void *)&v322[0] + 1))
  {
    sub_1A4F68B34((uint64_t)&v321, &qword_1E9664710);
    goto LABEL_98;
  }
  uint64_t v282 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664700);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_98:
    id v110 = v305;
    goto LABEL_246;
  }
  uint64_t v41 = v318;
  uint64_t v42 = *(void *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetSingleValueChangesKey);
  uint64_t v43 = *(void *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetSingleValueChangesKey + 8);
  swift_bridgeObjectRetain();
  v281 = (char *)v41;
  sub_1A4F615F8(v42, v43, v41, &v321);
  swift_bridgeObjectRelease();
  if (!*((void *)&v322[0] + 1))
  {
    sub_1A4F68B34((uint64_t)&v321, &qword_1E9664710);
    goto LABEL_102;
  }
  uint64_t v44 = MEMORY[0x1E4FBC840] + 8;
  uint64_t v45 = (uint64_t)&v321;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_102:
    unint64_t v297 = MEMORY[0x1E4FBC868];
    goto LABEL_104;
  }
  uint64_t v46 = *(void *)(v318 + 64);
  uint64_t v289 = v318 + 64;
  uint64_t v300 = v318;
  uint64_t v301 = 0;
  uint64_t v47 = 1 << *(unsigned char *)(v318 + 32);
  uint64_t v48 = -1;
  if (v47 < 64) {
    uint64_t v48 = ~(-1 << v47);
  }
  int64_t v24 = v48 & v46;
  v299 = &v319;
  BOOL v49 = v322;
  uint64_t v294 = (unint64_t)(v47 + 63) >> 6;
  uint64_t v288 = (long long *)(v294 - 1);
  unint64_t v297 = MEMORY[0x1E4FBC868];
  uint64_t v298 = v44;
  v295 = v322;
  if ((v48 & v46) == 0) {
    goto LABEL_32;
  }
LABEL_28:
  unint64_t v50 = __clz(__rbit64(v24));
  v24 &= v24 - 1;
  unint64_t v51 = v50 | (v301 << 6);
LABEL_29:
  uint64_t v52 = *(void *)(v300 + 56);
  uint64_t v53 = (void *)(*(void *)(v300 + 48) + 16 * v51);
  uint64_t v54 = v53[1];
  *(void *)&long long v318 = *v53;
  *((void *)&v318 + 1) = v54;
  sub_1A4F68358(v52 + 32 * v51, (uint64_t)v299);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_1A4F683B4((uint64_t)&v318, (uint64_t)&v321);
    uint64_t v58 = *((void *)&v321 + 1);
    if (!*((void *)&v321 + 1)) {
      break;
    }
    uint64_t v59 = v321;
    sub_1A4F6841C(v49, &v318);
    sub_1A4F68358((uint64_t)&v318, (uint64_t)&v328);
    type metadata accessor for EKRemoteUIPersistentObjectPointer();
    if (swift_dynamicCast())
    {
      BOOL v60 = (void *)v324;
      uint64_t v61 = *(void **)(v324 + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID);
      uint64_t v45 = *(unsigned __int8 *)(v324 + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert);
      id v62 = v293;
      uint64_t ObjCClassFromObject = swift_getObjCClassFromObject();
      id v64 = v61;
      id v65 = v62;
      char v66 = (void *)sub_1A4F7AF48();
      LOBYTE(ObjCClassFromObject) = objc_msgSend((id)ObjCClassFromObject, sel_isWeakRelationObject_forKey_, v65, v66);

      if (ObjCClassFromObject)
      {
        id v67 = sub_1A4F686D0(v64, v313, *v312);
        if (v67)
        {
          uint64_t v68 = v67;
          id v290 = v60;
          uint64_t v330 = sub_1A4F68994(0, &qword_1E9664750);
          *(void *)&long long v328 = v68;
          sub_1A4F6841C(&v328, &v324);
          id v69 = v68;
          uint64_t v45 = v297;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v316 = v45;
          unint64_t v72 = sub_1A4F64554(v59, v58);
          uint64_t v73 = *(void *)(v45 + 16);
          BOOL v74 = (v71 & 1) == 0;
          uint64_t v75 = v73 + v74;
          if (__OFADD__(v73, v74))
          {
            __break(1u);
            goto LABEL_318;
          }
          char v76 = v71;
          if (*(void *)(v45 + 24) >= v75)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              uint64_t v45 = (uint64_t)&v316;
              sub_1A4F673E4();
            }
          }
          else
          {
            sub_1A4F65DBC(v75, isUniquelyReferenced_nonNull_native);
            uint64_t v45 = v316;
            unint64_t v77 = sub_1A4F64554(v59, v58);
            if ((v76 & 1) != (v78 & 1)) {
              goto LABEL_321;
            }
            unint64_t v72 = v77;
          }
          unint64_t v297 = v316;
          if (v76)
          {
            uint64_t v45 = *(void *)(v316 + 56) + 32 * v72;
            __swift_destroy_boxed_opaque_existential_0(v45);
            sub_1A4F6841C(&v324, (_OWORD *)v45);
          }
          else
          {
            sub_1A4F671CC(v72, v59, v58, &v324, (void *)v316);
            swift_bridgeObjectRetain();
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

LABEL_75:
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v318);
LABEL_76:
          BOOL v49 = v295;
          if (v24) {
            goto LABEL_28;
          }
          goto LABEL_32;
        }
      }
      else
      {
        char v88 = v45;
        uint64_t v45 = v309;
        sub_1A4F6165C(v64, v310, v313, v88, v311, v312);
        if (v89)
        {
          id v90 = v89;
          uint64_t v330 = sub_1A4F68994(0, &qword_1E9664750);
          *(void *)&long long v328 = v90;
          sub_1A4F6841C(&v328, &v324);
          id v91 = v90;
          uint64_t v92 = v297;
          char v93 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v316 = v92;
          uint64_t v45 = (uint64_t)&v316;
          sub_1A4F66D7C(&v324, v59, v58, v93);
          unint64_t v297 = v316;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          goto LABEL_75;
        }
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v318);

      swift_bridgeObjectRelease();
      goto LABEL_76;
    }
    sub_1A4F68358((uint64_t)&v318, (uint64_t)&v328);
    uint64_t v45 = v297;
    char v79 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v324 = v45;
    unint64_t v81 = sub_1A4F64554(v59, v58);
    uint64_t v82 = *(void *)(v45 + 16);
    BOOL v83 = (v80 & 1) == 0;
    uint64_t v84 = v82 + v83;
    if (__OFADD__(v82, v83))
    {
LABEL_312:
      __break(1u);
LABEL_313:
      __break(1u);
LABEL_314:
      __break(1u);
LABEL_315:
      __break(1u);
LABEL_316:
      swift_once();
LABEL_89:
      __swift_project_value_buffer(v24, (uint64_t)qword_1E9664C38);
      unint64_t v95 = sub_1A4F7AEE8();
      os_log_type_t v100 = sub_1A4F7AFA8();
      BOOL v101 = os_log_type_enabled(v95, v100);
      id v94 = v305;
      if (v101)
      {
        unint64_t v102 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v102 = 0;
        _os_log_impl(&dword_1A4E47000, v95, v100, "EKRemoteUIObjectSerializer: Cannot generate a Deserialized EKPersistentObject.", v102, 2u);
        MEMORY[0x1A6266C00](v102, -1, -1);
        uint64_t v103 = v296;

        goto LABEL_83;
      }

      char v109 = v296;
LABEL_100:

LABEL_85:
      return 0;
    }
    char v85 = v80;
    if (*(void *)(v45 + 24) >= v84)
    {
      if ((v79 & 1) == 0)
      {
        uint64_t v45 = (uint64_t)&v324;
        sub_1A4F673E4();
      }
    }
    else
    {
      sub_1A4F65DBC(v84, v79);
      uint64_t v45 = v324;
      unint64_t v86 = sub_1A4F64554(v59, v58);
      if ((v85 & 1) != (v87 & 1)) {
        goto LABEL_321;
      }
      unint64_t v81 = v86;
    }
    unint64_t v297 = v324;
    if (v85)
    {
      uint64_t v45 = *(void *)(v324 + 56) + 32 * v81;
      __swift_destroy_boxed_opaque_existential_0(v45);
      sub_1A4F6841C(&v328, (_OWORD *)v45);
    }
    else
    {
      sub_1A4F671CC(v81, v59, v58, &v328, (void *)v324);
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v318);
    if (v24) {
      goto LABEL_28;
    }
LABEL_32:
    uint64_t v55 = v301 + 1;
    if (__OFADD__(v301, 1)) {
      goto LABEL_313;
    }
    if (v55 < v294)
    {
      unint64_t v56 = *(void *)(v289 + 8 * v55);
      if (v56) {
        goto LABEL_35;
      }
      uint64_t v57 = v301 + 2;
      ++v301;
      if (v55 + 1 < v294)
      {
        unint64_t v56 = *(void *)(v289 + 8 * v57);
        if (v56) {
          goto LABEL_38;
        }
        uint64_t v301 = v55 + 1;
        if (v55 + 2 < v294)
        {
          unint64_t v56 = *(void *)(v289 + 8 * (v55 + 2));
          if (v56)
          {
            v55 += 2;
LABEL_35:
            int64_t v24 = (v56 - 1) & v56;
            unint64_t v51 = __clz(__rbit64(v56)) + (v55 << 6);
            uint64_t v301 = v55;
            goto LABEL_29;
          }
          uint64_t v57 = v55 + 3;
          uint64_t v301 = v55 + 2;
          if (v55 + 3 < v294)
          {
            unint64_t v56 = *(void *)(v289 + 8 * v57);
            if (!v56)
            {
              while (1)
              {
                uint64_t v55 = v57 + 1;
                if (__OFADD__(v57, 1)) {
                  goto LABEL_319;
                }
                if (v55 >= v294)
                {
                  uint64_t v301 = (uint64_t)v288;
                  goto LABEL_49;
                }
                unint64_t v56 = *(void *)(v289 + 8 * v55);
                ++v57;
                if (v56) {
                  goto LABEL_35;
                }
              }
            }
LABEL_38:
            uint64_t v55 = v57;
            goto LABEL_35;
          }
        }
      }
    }
LABEL_49:
    int64_t v24 = 0;
    long long v319 = 0u;
    long long v320 = 0u;
    long long v318 = 0u;
  }
  swift_release();
  uint64_t v8 = v309;
  int64_t v24 = v306;
LABEL_104:
  *(void *)&long long v316 = MEMORY[0x1E4FBC868];
  uint64_t v112 = *(void *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueAdditionsKey);
  uint64_t v113 = *(void *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueAdditionsKey + 8);
  swift_bridgeObjectRetain();
  sub_1A4F615F8(v112, v113, (uint64_t)v281, &v321);
  swift_bridgeObjectRelease();
  if (*((void *)&v322[0] + 1))
  {
    uint64_t v114 = MEMORY[0x1E4FBC840] + 8;
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_174;
    }
    int64_t v115 = 0;
    uint64_t v116 = *(void *)(v318 + 64);
    v280 = (char *)(v318 + 64);
    uint64_t v117 = 1 << *(unsigned char *)(v318 + 32);
    if (v117 < 64) {
      uint64_t v118 = ~(-1 << v117);
    }
    else {
      uint64_t v118 = -1;
    }
    unint64_t v119 = v118 & v116;
    char v286 = &v319;
    unint64_t v287 = (_OWORD *)v318;
    v295 = v322;
    v120 = v303;
    v284 = (void (**)(char *, int64_t))v302 + 1;
    *(void *)&long long v285 = v302 + 1;
    int64_t v283 = (unint64_t)(v117 + 63) >> 6;
    int64_t v277 = v283 - 1;
    uint64_t v278 = (_OWORD *)(v283 - 5);
    uint64_t v279 = v318 + 104;
    uint64_t v300 = MEMORY[0x1E4FBC838] + 8;
    uint64_t v294 = v114;
    if ((v118 & v116) == 0) {
      goto LABEL_154;
    }
LABEL_110:
    while (2)
    {
      unint64_t v121 = __clz(__rbit64(v119));
      uint64_t v122 = (v119 - 1) & v119;
      unint64_t v123 = v121 | (v115 << 6);
LABEL_111:
      uint64_t v124 = *((void *)v287 + 7);
      id v125 = (void *)(*((void *)v287 + 6) + 16 * v123);
      uint64_t v126 = v125[1];
      *(void *)&long long v318 = *v125;
      *((void *)&v318 + 1) = v126;
      sub_1A4F68358(v124 + 32 * v123, (uint64_t)v286);
      swift_bridgeObjectRetain();
LABEL_112:
      sub_1A4F683B4((uint64_t)&v318, (uint64_t)&v321);
      id v127 = (void *)*((void *)&v321 + 1);
      if (*((void *)&v321 + 1))
      {
        uint64_t v128 = v321;
        sub_1A4F6841C(v295, &v318);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664738);
        int v129 = swift_dynamicCast();
        uint64_t v298 = v122;
        v299 = (long long *)v115;
        if (!v129)
        {
          if (qword_1E9664670 != -1) {
            swift_once();
          }
          uint64_t v135 = __swift_project_value_buffer(v24, (uint64_t)qword_1E9664C38);
          (*(void (**)(char *, uint64_t, int64_t))v285)(v120, v135, v24);
          uint64_t v136 = swift_allocObject();
          *(void *)(v136 + 16) = v128;
          *(void *)(v136 + 24) = v127;
          uint64_t v137 = sub_1A4F7AEE8();
          os_log_type_t v138 = sub_1A4F7AFA8();
          uint64_t v139 = swift_allocObject();
          *(unsigned char *)(v139 + 16) = 32;
          uint64_t v140 = swift_allocObject();
          *(unsigned char *)(v140 + 16) = 8;
          uint64_t v141 = swift_allocObject();
          *(void *)(v141 + 16) = sub_1A4F68C34;
          *(void *)(v141 + 24) = v136;
          uint64_t v142 = swift_allocObject();
          *(void *)(v142 + 16) = sub_1A4F68BF4;
          *(void *)(v142 + 24) = v141;
          os_log_type_t v143 = v138;
          if (os_log_type_enabled(v137, v138))
          {
            v144 = (uint8_t *)swift_slowAlloc();
            uint64_t v145 = swift_slowAlloc();
            *(void *)&long long v328 = 0;
            *(void *)&v315[0] = v145;
            *(_WORD *)v144 = 258;
            v144[2] = *(unsigned char *)(v139 + 16);
            swift_release();
            v144[3] = *(unsigned char *)(v140 + 16);
            *(void *)&long long v318 = v144 + 4;
            swift_release();
            sub_1A4F635F0((uint64_t *)&v318, (uint64_t)&v328, (uint64_t *)v315, *(uint64_t (**)(void))(v142 + 16));
            swift_release();
            _os_log_impl(&dword_1A4E47000, v137, v143, "EKRemoteUIObjectSerializer: cannot deserialize changeSet multiValueAdditions as a Set<EKObjectID> for key: %s", v144, 0xCu);
            swift_arrayDestroy();
            uint64_t v146 = v145;
            uint64_t v8 = v309;
            MEMORY[0x1A6266C00](v146, -1, -1);
            MEMORY[0x1A6266C00](v144, -1, -1);
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
          }

          (*v284)(v120, v24);
          unint64_t v119 = v298;
          int64_t v115 = (int64_t)v299;
          if (!v298) {
            goto LABEL_154;
          }
          continue;
        }
        uint64_t v289 = v128;
        id v290 = v127;
        uint64_t v130 = v328;
        *(void *)&long long v318 = MEMORY[0x1E4FBC870];
        if ((v328 & 0xC000000000000001) != 0)
        {
          sub_1A4F7B048();
          type metadata accessor for EKRemoteUIPersistentObjectPointer();
          sub_1A4F68550();
          sub_1A4F7AF98();
          uint64_t v131 = *((void *)&v324 + 1);
          uint64_t v130 = v324;
          uint64_t v132 = v325;
          uint64_t v133 = v326;
          unint64_t v134 = v327;
        }
        else
        {
          uint64_t v133 = 0;
          uint64_t v147 = -1 << *(unsigned char *)(v328 + 32);
          uint64_t v131 = v328 + 56;
          uint64_t v132 = ~v147;
          uint64_t v148 = -v147;
          if (v148 < 64) {
            uint64_t v149 = ~(-1 << v148);
          }
          else {
            uint64_t v149 = -1;
          }
          unint64_t v134 = v149 & *(void *)(v328 + 56);
        }
        uint64_t v301 = v130 & 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v288 = (long long *)v132;
        int64_t v24 = (unint64_t)(v132 + 64) >> 6;
        while (1)
        {
          if (v130 < 0)
          {
            uint64_t v153 = sub_1A4F7B078();
            if (!v153) {
              goto LABEL_153;
            }
            *(void *)&v315[0] = v153;
            type metadata accessor for EKRemoteUIPersistentObjectPointer();
            swift_unknownObjectRetain();
            swift_dynamicCast();
            long long v154 = (unsigned char *)v328;
            swift_unknownObjectRelease();
            uint64_t v152 = v133;
            uint64_t v150 = v134;
            if (!v154) {
              goto LABEL_153;
            }
          }
          else
          {
            if (v134)
            {
              uint64_t v150 = (v134 - 1) & v134;
              unint64_t v151 = __clz(__rbit64(v134)) | (v133 << 6);
              uint64_t v152 = v133;
            }
            else
            {
              int64_t v155 = v133 + 1;
              if (__OFADD__(v133, 1))
              {
                __break(1u);
                goto LABEL_309;
              }
              if (v155 >= v24) {
                goto LABEL_153;
              }
              unint64_t v156 = *(void *)(v131 + 8 * v155);
              uint64_t v152 = v133 + 1;
              if (!v156)
              {
                uint64_t v152 = v133 + 2;
                if (v133 + 2 >= v24) {
                  goto LABEL_153;
                }
                unint64_t v156 = *(void *)(v131 + 8 * v152);
                if (!v156)
                {
                  uint64_t v152 = v133 + 3;
                  if (v133 + 3 >= v24) {
                    goto LABEL_153;
                  }
                  unint64_t v156 = *(void *)(v131 + 8 * v152);
                  if (!v156)
                  {
                    uint64_t v152 = v133 + 4;
                    if (v133 + 4 >= v24) {
                      goto LABEL_153;
                    }
                    unint64_t v156 = *(void *)(v131 + 8 * v152);
                    if (!v156)
                    {
                      uint64_t v157 = v133 + 5;
                      while (v24 != v157)
                      {
                        unint64_t v156 = *(void *)(v131 + 8 * v157++);
                        if (v156)
                        {
                          uint64_t v152 = v157 - 1;
                          goto LABEL_149;
                        }
                      }
LABEL_153:
                      sub_1A4F6898C();
                      uint64_t v162 = sub_1A4F62618(v318);
                      swift_bridgeObjectRelease();
                      sub_1A4F5E4E4(v162, v289, (uint64_t)v290);
                      uint64_t v8 = v309;
                      int64_t v24 = v306;
                      v120 = v303;
                      unint64_t v119 = v298;
                      int64_t v115 = (int64_t)v299;
                      if (v298) {
                        goto LABEL_110;
                      }
LABEL_154:
                      int64_t v163 = v115 + 1;
                      if (__OFADD__(v115, 1)) {
                        goto LABEL_314;
                      }
                      if (v163 >= v283)
                      {
                        v165 = (char *)v115;
                        goto LABEL_159;
                      }
                      unint64_t v164 = *(void *)&v280[8 * v163];
                      if (v164) {
                        goto LABEL_157;
                      }
                      v165 = (char *)(v115 + 1);
                      if (v115 + 2 < v283)
                      {
                        unint64_t v164 = *(void *)&v280[8 * v115 + 16];
                        if (v164)
                        {
                          int64_t v163 = v115 + 2;
                          goto LABEL_157;
                        }
                        v165 = (char *)(v115 + 2);
                        if (v115 + 3 < v283)
                        {
                          unint64_t v164 = *(void *)&v280[8 * v115 + 24];
                          if (v164)
                          {
                            int64_t v163 = v115 + 3;
                            goto LABEL_157;
                          }
                          int64_t v163 = v115 + 4;
                          v165 = (char *)(v115 + 3);
                          if (v115 + 4 < v283)
                          {
                            unint64_t v164 = *(void *)&v280[8 * v163];
                            if (!v164)
                            {
                              while (v278 != (_OWORD *)v115)
                              {
                                unint64_t v164 = *(void *)(v279 + 8 * v115++);
                                if (v164)
                                {
                                  int64_t v163 = v115 + 4;
                                  goto LABEL_157;
                                }
                              }
                              v165 = (char *)v277;
                              goto LABEL_159;
                            }
LABEL_157:
                            uint64_t v122 = (v164 - 1) & v164;
                            unint64_t v123 = __clz(__rbit64(v164)) + (v163 << 6);
                            int64_t v115 = v163;
                            goto LABEL_111;
                          }
                        }
                      }
LABEL_159:
                      uint64_t v122 = 0;
                      long long v319 = 0u;
                      long long v320 = 0u;
                      int64_t v115 = (int64_t)v165;
                      long long v318 = 0u;
                      goto LABEL_112;
                    }
                  }
                }
              }
LABEL_149:
              uint64_t v150 = (v156 - 1) & v156;
              unint64_t v151 = __clz(__rbit64(v156)) + (v152 << 6);
            }
            long long v154 = *(id *)(*(void *)(v130 + 48) + 8 * v151);
            if (!v154) {
              goto LABEL_153;
            }
          }
          char v158 = v154[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert];
          id v159 = *(id *)&v154[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID];
          sub_1A4F6165C(v159, v310, v313, v158, v311, v312);
          if (v160)
          {
            id v161 = v160;
            sub_1A4F64268(&v328, v161);
          }
          else
          {
          }
          uint64_t v133 = v152;
          unint64_t v134 = v150;
        }
      }
      break;
    }
    swift_release();
  }
  else
  {
    sub_1A4F68B34((uint64_t)&v321, &qword_1E9664710);
  }
LABEL_174:
  *(void *)&v315[0] = MEMORY[0x1E4FBC868];
  uint64_t v166 = *(void *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueRemovalsKey);
  uint64_t v167 = *(void *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueRemovalsKey + 8);
  swift_bridgeObjectRetain();
  sub_1A4F615F8(v166, v167, (uint64_t)v281, &v321);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v322[0] + 1))
  {
    uint64_t v300 = MEMORY[0x1E4FBC840] + 8;
    if (swift_dynamicCast())
    {
      uint64_t v168 = 0;
      uint64_t v169 = *(void *)(v318 + 64);
      int64_t v283 = v318 + 64;
      uint64_t v170 = 1 << *(unsigned char *)(v318 + 32);
      if (v170 < 64) {
        uint64_t v171 = ~(-1 << v170);
      }
      else {
        uint64_t v171 = -1;
      }
      unint64_t v172 = v171 & v169;
      uint64_t v288 = &v319;
      uint64_t v289 = v318;
      v299 = v322;
      char v286 = (long long *)((char *)v302 + 8);
      unint64_t v287 = v302 + 1;
      v284 = (void (**)(char *, int64_t))((unint64_t)(v170 + 63) >> 6);
      v280 = (char *)v284 - 1;
      v281 = (char *)v284 - 5;
      uint64_t v282 = v318 + 104;
      uint64_t v302 = (long long *)(MEMORY[0x1E4FBC838] + 8);
      long long v285 = xmmword_1A4F901B0;
      uint64_t v173 = v304;
      if ((v171 & v169) == 0) {
        goto LABEL_222;
      }
LABEL_180:
      unint64_t v174 = __clz(__rbit64(v172));
      uint64_t v175 = (v172 - 1) & v172;
      unint64_t v176 = v174 | (v168 << 6);
LABEL_181:
      uint64_t v177 = *(void *)(v289 + 56);
      v178 = (void *)(*(void *)(v289 + 48) + 16 * v176);
      uint64_t v179 = v178[1];
      *(void *)&long long v318 = *v178;
      *((void *)&v318 + 1) = v179;
      sub_1A4F68358(v177 + 32 * v176, (uint64_t)v288);
      swift_bridgeObjectRetain();
      while (1)
      {
        sub_1A4F683B4((uint64_t)&v318, (uint64_t)&v321);
        uint64_t v180 = *((void *)&v321 + 1);
        if (!*((void *)&v321 + 1))
        {
          swift_release();
          goto LABEL_242;
        }
        uint64_t v181 = (_OWORD *)v321;
        sub_1A4F6841C(v299, &v318);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664738);
        int v182 = swift_dynamicCast();
        uint64_t v301 = v175;
        if (!v182)
        {
          uint64_t v188 = sub_1A4F59E94();
          (*(void (**)(_OWORD *, uint64_t, int64_t))v287)(v173, v188, v24);
          uint64_t v189 = swift_allocObject();
          *(void *)(v189 + 16) = v181;
          *(void *)(v189 + 24) = v180;
          uint64_t v190 = sub_1A4F7AEE8();
          os_log_type_t v191 = sub_1A4F7AFA8();
          uint64_t v192 = swift_allocObject();
          *(unsigned char *)(v192 + 16) = 32;
          uint64_t v193 = swift_allocObject();
          *(unsigned char *)(v193 + 16) = 8;
          uint64_t v194 = swift_allocObject();
          *(void *)(v194 + 16) = sub_1A4F68C34;
          *(void *)(v194 + 24) = v189;
          uint64_t v195 = swift_allocObject();
          *(void *)(v195 + 16) = sub_1A4F68520;
          *(void *)(v195 + 24) = v194;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664740);
          uint64_t v196 = swift_allocObject();
          *(_OWORD *)(v196 + 16) = v285;
          *(void *)(v196 + 32) = sub_1A4F684C4;
          *(void *)(v196 + 40) = v192;
          *(void *)(v196 + 4_Block_object_dispose(&STACK[0x280], 8) = sub_1A4F68C30;
          *(void *)(v196 + 56) = v193;
          *(void *)(v196 + 64) = sub_1A4F68548;
          *(void *)(v196 + 72) = v195;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_bridgeObjectRelease();
          os_log_type_t v197 = v191;
          if (os_log_type_enabled(v190, v191))
          {
            char v198 = (uint8_t *)swift_slowAlloc();
            uint64_t v199 = swift_slowAlloc();
            unint64_t v323 = 0;
            uint64_t v314 = v199;
            *(_WORD *)char v198 = 258;
            v198[2] = *(unsigned char *)(v192 + 16);
            swift_release();
            v198[3] = *(unsigned char *)(v193 + 16);
            *(void *)&long long v318 = v198 + 4;
            swift_release();
            sub_1A4F635F0((uint64_t *)&v318, (uint64_t)&v323, &v314, *(uint64_t (**)(void))(v195 + 16));
            swift_release();
            _os_log_impl(&dword_1A4E47000, v190, v197, "EKRemoteUIObjectSerializer: cannot deserialize changeSet multiValueRemovals as a Set<EKObjectID> for key: %s", v198, 0xCu);
            swift_arrayDestroy();
            uint64_t v200 = v199;
            uint64_t v173 = v304;
            MEMORY[0x1A6266C00](v200, -1, -1);
            MEMORY[0x1A6266C00](v198, -1, -1);
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
          }

          (*(void (**)(_OWORD *, int64_t))v286)(v173, v24);
          unint64_t v172 = v301;
          if (!v301) {
            goto LABEL_222;
          }
          goto LABEL_180;
        }
        uint64_t v294 = v168;
        v295 = v181;
        uint64_t v298 = v180;
        unint64_t v183 = v323;
        *(void *)&long long v318 = MEMORY[0x1E4FBC870];
        if ((v323 & 0xC000000000000001) != 0)
        {
          sub_1A4F7B048();
          type metadata accessor for EKRemoteUIPersistentObjectPointer();
          sub_1A4F68550();
          sub_1A4F7AF98();
          os_log_type_t v184 = (char *)*((void *)&v328 + 1);
          unint64_t v183 = v328;
          uint64_t v185 = v329;
          uint64_t v186 = v330;
          unint64_t v187 = v331;
        }
        else
        {
          uint64_t v186 = 0;
          uint64_t v201 = -1 << *(unsigned char *)(v323 + 32);
          os_log_type_t v184 = (char *)(v323 + 56);
          uint64_t v185 = ~v201;
          uint64_t v202 = -v201;
          uint64_t v203 = v202 < 64 ? ~(-1 << v202) : -1;
          unint64_t v187 = v203 & *(void *)(v323 + 56);
        }
        uint64_t v303 = (char *)(v183 & 0x7FFFFFFFFFFFFFFFLL);
        id v290 = (id)v185;
        int64_t v24 = (unint64_t)(v185 + 64) >> 6;
        while ((v183 & 0x8000000000000000) != 0)
        {
          uint64_t v207 = sub_1A4F7B078();
          if (!v207) {
            goto LABEL_221;
          }
          uint64_t v314 = v207;
          type metadata accessor for EKRemoteUIPersistentObjectPointer();
          swift_unknownObjectRetain();
          swift_dynamicCast();
          uint64_t v208 = (unsigned char *)v323;
          swift_unknownObjectRelease();
          uint64_t v206 = v186;
          uint64_t v204 = v187;
          if (!v208) {
            goto LABEL_221;
          }
LABEL_219:
          char v212 = v208[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert];
          id v213 = *(id *)&v208[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID];
          sub_1A4F6165C(v213, v310, v313, v212, v311, v312);
          if (v214)
          {
            id v215 = v214;
            sub_1A4F64268(&v323, v215);
          }
          else
          {
          }
          uint64_t v186 = v206;
          unint64_t v187 = v204;
        }
        if (v187) {
          break;
        }
        int64_t v209 = v186 + 1;
        if (__OFADD__(v186, 1))
        {
LABEL_309:
          __break(1u);
          goto LABEL_310;
        }
        if (v209 >= v24) {
          goto LABEL_221;
        }
        unint64_t v210 = *(void *)&v184[8 * v209];
        uint64_t v206 = v186 + 1;
        if (v210) {
          goto LABEL_217;
        }
        uint64_t v206 = v186 + 2;
        if (v186 + 2 >= v24) {
          goto LABEL_221;
        }
        unint64_t v210 = *(void *)&v184[8 * v206];
        if (v210) {
          goto LABEL_217;
        }
        uint64_t v206 = v186 + 3;
        if (v186 + 3 >= v24) {
          goto LABEL_221;
        }
        unint64_t v210 = *(void *)&v184[8 * v206];
        if (v210) {
          goto LABEL_217;
        }
        uint64_t v206 = v186 + 4;
        if (v186 + 4 >= v24) {
          goto LABEL_221;
        }
        unint64_t v210 = *(void *)&v184[8 * v206];
        if (v210)
        {
LABEL_217:
          uint64_t v204 = (v210 - 1) & v210;
          unint64_t v205 = __clz(__rbit64(v210)) + (v206 << 6);
LABEL_218:
          uint64_t v208 = *(id *)(*(void *)(v183 + 48) + 8 * v205);
          if (!v208) {
            goto LABEL_221;
          }
          goto LABEL_219;
        }
        uint64_t v211 = v186 + 5;
        while (v24 != v211)
        {
          unint64_t v210 = *(void *)&v184[8 * v211++];
          if (v210)
          {
            uint64_t v206 = v211 - 1;
            goto LABEL_217;
          }
        }
LABEL_221:
        sub_1A4F6898C();
        uint64_t v216 = sub_1A4F62618(v318);
        swift_bridgeObjectRelease();
        sub_1A4F5E4E4(v216, (uint64_t)v295, v298);
        int64_t v24 = v306;
        uint64_t v173 = v304;
        uint64_t v168 = v294;
        unint64_t v172 = v301;
        if (v301) {
          goto LABEL_180;
        }
LABEL_222:
        uint64_t v217 = v168 + 1;
        if (__OFADD__(v168, 1)) {
          goto LABEL_315;
        }
        if (v217 >= (uint64_t)v284)
        {
          uint64_t v219 = v168;
          goto LABEL_227;
        }
        unint64_t v218 = *(void *)(v283 + 8 * v217);
        if (v218) {
          goto LABEL_225;
        }
        uint64_t v219 = v168 + 1;
        if (v168 + 2 < (uint64_t)v284)
        {
          unint64_t v218 = *(void *)(v283 + 8 * (v168 + 2));
          if (v218)
          {
            uint64_t v217 = v168 + 2;
            goto LABEL_225;
          }
          uint64_t v219 = v168 + 2;
          if (v168 + 3 < (uint64_t)v284)
          {
            unint64_t v218 = *(void *)(v283 + 8 * (v168 + 3));
            if (v218)
            {
              uint64_t v217 = v168 + 3;
              goto LABEL_225;
            }
            uint64_t v217 = v168 + 4;
            uint64_t v219 = v168 + 3;
            if (v168 + 4 < (uint64_t)v284)
            {
              unint64_t v218 = *(void *)(v283 + 8 * v217);
              if (!v218)
              {
                while (v281 != (char *)v168)
                {
                  unint64_t v218 = *(void *)(v282 + 8 * v168++);
                  if (v218)
                  {
                    uint64_t v217 = v168 + 4;
                    goto LABEL_225;
                  }
                }
                uint64_t v219 = (uint64_t)v280;
                goto LABEL_227;
              }
LABEL_225:
              uint64_t v175 = (v218 - 1) & v218;
              unint64_t v176 = __clz(__rbit64(v218)) + (v217 << 6);
              uint64_t v168 = v217;
              goto LABEL_181;
            }
          }
        }
LABEL_227:
        uint64_t v175 = 0;
        long long v319 = 0u;
        long long v320 = 0u;
        uint64_t v168 = v219;
        long long v318 = 0u;
      }
      uint64_t v204 = (v187 - 1) & v187;
      unint64_t v205 = __clz(__rbit64(v187)) | (v186 << 6);
      uint64_t v206 = v186;
      goto LABEL_218;
    }
  }
  else
  {
    sub_1A4F68B34((uint64_t)&v321, &qword_1E9664710);
  }
LABEL_242:
  sub_1A4F62A58(v297);
  swift_bridgeObjectRelease();
  sub_1A4F62E20(v316);
  swift_bridgeObjectRelease();
  sub_1A4F62E20(*(uint64_t *)&v315[0]);
  swift_bridgeObjectRelease();
  id v220 = objc_allocWithZone((Class)EKChangeSet);
  uint64_t v221 = (void *)sub_1A4F7AF18();
  swift_bridgeObjectRelease();
  uint64_t v222 = (void *)sub_1A4F7AF18();
  swift_bridgeObjectRelease();
  id v223 = (void *)sub_1A4F7AF18();
  swift_bridgeObjectRelease();
  id v224 = objc_msgSend(v220, sel_initWithSingleValueChanges_multiValueAdditions_multiValueRemovals_, v221, v222, v223);

  uint64_t v8 = v309;
  a1 = v292;
  id v110 = v305;
  if (v224)
  {
    if ([v296 isTemporary]) {
      objc_msgSend(v224, sel_setIsNew_, 1);
    }
    objc_msgSend(v293, sel_setChangeSet_, v224, v277);
  }
LABEL_246:
  objc_msgSend(v293, sel__resetAfterUpdatingChangeSetOrBackingObject, v277);
  unint64_t v323 = MEMORY[0x1E4FBC868];
  uint64_t v225 = *(void *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKCachedMeltedObjectsKey);
  uint64_t v226 = *(void *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKCachedMeltedObjectsKey + 8);
  swift_bridgeObjectRetain();
  sub_1A4F615F8(v225, v226, a1, &v321);
  swift_bridgeObjectRelease();
  if (!*((void *)&v322[0] + 1))
  {
    sub_1A4F68B34((uint64_t)&v321, &qword_1E9664710);
LABEL_305:
    int64_t v273 = MEMORY[0x1E4FBC868];
LABEL_307:
    sub_1A4F62A58(v273);
    swift_bridgeObjectRelease();
    uint64_t v274 = (void *)sub_1A4F7AF18();
    swift_bridgeObjectRelease();
    id v98 = v293;
    objc_msgSend(v293, sel_setCachedMeltedObjects_, v274);

    int64_t v275 = v296;
    unint64_t v276 = v291;

    return (uint64_t)v98;
  }
  int64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664700);
  uint64_t v45 = (uint64_t)&v321;
  uint64_t v292 = MEMORY[0x1E4FBC840] + 8;
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_305;
  }
  id v305 = v110;
  uint64_t v306 = 0;
  uint64_t v227 = *(void *)(v318 + 64);
  id v290 = (id)(v318 + 64);
  uint64_t v303 = (char *)v318;
  uint64_t v228 = 1 << *(unsigned char *)(v318 + 32);
  uint64_t v229 = -1;
  if (v228 < 64) {
    uint64_t v229 = ~(-1 << v228);
  }
  unint64_t v230 = v229 & v227;
  uint64_t v302 = &v319;
  uint64_t v304 = v322;
  uint64_t v231 = (long long *)*MEMORY[0x1E4F56BB0];
  uint64_t v298 = (unint64_t)(v228 + 63) >> 6;
  v299 = v231;
  uint64_t v289 = v298 - 1;
  uint64_t v301 = v24;
  while (v230)
  {
    unint64_t v232 = __clz(__rbit64(v230));
    v230 &= v230 - 1;
    unint64_t v233 = v232 | (v306 << 6);
LABEL_254:
    uint64_t v234 = *((void *)v303 + 7);
    v235 = (void *)(*((void *)v303 + 6) + 16 * v233);
    uint64_t v236 = v235[1];
    *(void *)&long long v318 = *v235;
    *((void *)&v318 + 1) = v236;
    sub_1A4F68358(v234 + 32 * v233, (uint64_t)v302);
    swift_bridgeObjectRetain();
LABEL_273:
    sub_1A4F683B4((uint64_t)&v318, (uint64_t)&v321);
    uint64_t v45 = *((void *)&v321 + 1);
    if (!*((void *)&v321 + 1))
    {
      swift_release();
      int64_t v273 = v323;
      id v110 = v305;
      goto LABEL_307;
    }
    uint64_t v240 = v321;
    sub_1A4F6841C(v304, &v318);
    sub_1A4F68358((uint64_t)&v318, (uint64_t)&v316);
    if (swift_dynamicCast())
    {
      uint64_t v241 = *(void *)&v315[0];
      uint64_t v242 = sub_1A4F7AED8();
      int64_t v243 = v45;
      id v244 = v307;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v242 - 8) + 56))(v307, 1, 1, v242);
      uint64_t v45 = sub_1A4F5EC98(v241, v310, v308, v313, v244, v311, v312);
      swift_bridgeObjectRelease();
      uint64_t v245 = (uint64_t)v244;
      int64_t v24 = v243;
      sub_1A4F68B34(v245, &qword_1E96646F0);
      if (v240 == sub_1A4F7AF58() && v246 == v243)
      {
        uint64_t v247 = v240;
        id v248 = (id)v45;
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v247 = v240;
        char v258 = sub_1A4F7B1D8();
        id v259 = (id)v45;
        swift_bridgeObjectRelease();
        if ((v258 & 1) == 0)
        {

          if (!v45) {
            goto LABEL_289;
          }
          goto LABEL_292;
        }
      }
      if (!v45) {
        goto LABEL_289;
      }
      id v260 = objc_msgSend((id)v45, sel_objectID);

      if (!v260) {
        goto LABEL_320;
      }
      unsigned __int8 v261 = objc_msgSend(v260, sel_isVirtual);

      if (v261)
      {
        id v262 = objc_msgSend(v313, sel_defaultCalendarForNewEvents);

        uint64_t v45 = (uint64_t)v262;
        if (!v262)
        {
LABEL_289:
          uint64_t v45 = (uint64_t)&v323;
          sub_1A4F63CC0(v247, v24, v315);
          swift_bridgeObjectRelease();
          sub_1A4F68B34((uint64_t)v315, &qword_1E9664710);
          goto LABEL_301;
        }
      }
LABEL_292:
      uint64_t v317 = sub_1A4F68994(0, &qword_1E9664730);
      *(void *)&long long v316 = v45;
      sub_1A4F6841C(&v316, v315);
      uint64_t v45 = v323;
      char v263 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v314 = v45;
      unint64_t v265 = sub_1A4F64554(v247, v24);
      uint64_t v266 = *(void *)(v45 + 16);
      BOOL v267 = (v264 & 1) == 0;
      uint64_t v268 = v266 + v267;
      if (__OFADD__(v266, v267)) {
        goto LABEL_311;
      }
      char v269 = v264;
      if (*(void *)(v45 + 24) >= v268)
      {
        if (v263)
        {
          if (v264) {
            goto LABEL_299;
          }
        }
        else
        {
          sub_1A4F673E4();
          uint64_t v45 = v314;
          if (v269) {
            goto LABEL_299;
          }
        }
      }
      else
      {
        sub_1A4F65DBC(v268, v263);
        uint64_t v45 = v314;
        unint64_t v270 = sub_1A4F64554(v247, v24);
        if ((v269 & 1) != (v271 & 1)) {
          goto LABEL_321;
        }
        unint64_t v265 = v270;
        if (v269)
        {
LABEL_299:
          uint64_t v272 = (_OWORD *)(*(void *)(v45 + 56) + 32 * v265);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v272);
          sub_1A4F6841C(v315, v272);
          goto LABEL_300;
        }
      }
      sub_1A4F671CC(v265, v247, v24, v315, (void *)v45);
      swift_bridgeObjectRetain();
LABEL_300:
      unint64_t v323 = v45;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_301:
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v318);
      int64_t v24 = v301;
    }
    else
    {
      sub_1A4F68358((uint64_t)&v318, (uint64_t)&v316);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664720);
      if (swift_dynamicCast())
      {
        uint64_t v294 = v240;
        v295 = (_OWORD *)v45;
        unint64_t v297 = v230;
        uint64_t v249 = *(void *)&v315[0];
        id v250 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA80]), sel_init);
        uint64_t v300 = v249;
        uint64_t v251 = *(void *)(v249 + 16);
        if (v251)
        {
          uint64_t v252 = v300 + 32;
          uint64_t v253 = sub_1A4F7AED8();
          v254 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v253 - 8) + 56);
          do
          {
            uint64_t v255 = (uint64_t)v307;
            v254(v307, 1, 1, v253);
            uint64_t v256 = swift_bridgeObjectRetain();
            v257 = (void *)sub_1A4F5EC98(v256, v310, v308, v313, v255, v311, v312);
            swift_bridgeObjectRelease();
            sub_1A4F68B34(v255, &qword_1E96646F0);
            if (v257)
            {
              objc_msgSend(v250, sel_addObject_, v257);
            }
            v252 += 8;
            --v251;
          }
          while (v251);
        }
        swift_bridgeObjectRelease();
        uint64_t v317 = sub_1A4F68994(0, &qword_1E9664728);
        *(void *)&long long v316 = v250;
        uint64_t v45 = (uint64_t)&v323;
        sub_1A4F5E40C((uint64_t)&v316, v294, (uint64_t)v295);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v318);
        int64_t v24 = v301;
        unint64_t v230 = v297;
      }
      else
      {
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v318);
      }
    }
  }
  uint64_t v237 = v306 + 1;
  if (__OFADD__(v306, 1))
  {
LABEL_310:
    __break(1u);
LABEL_311:
    __break(1u);
    goto LABEL_312;
  }
  if (v237 >= v298)
  {
LABEL_272:
    unint64_t v230 = 0;
    long long v319 = 0u;
    long long v320 = 0u;
    long long v318 = 0u;
    goto LABEL_273;
  }
  unint64_t v238 = *((void *)v290 + v237);
  if (v238)
  {
LABEL_258:
    unint64_t v230 = (v238 - 1) & v238;
    unint64_t v233 = __clz(__rbit64(v238)) + (v237 << 6);
    uint64_t v306 = v237;
    goto LABEL_254;
  }
  uint64_t v239 = v306 + 2;
  ++v306;
  if (v237 + 1 >= v298) {
    goto LABEL_272;
  }
  unint64_t v238 = *((void *)v290 + v239);
  if (v238) {
    goto LABEL_261;
  }
  uint64_t v306 = v237 + 1;
  if (v237 + 2 >= v298) {
    goto LABEL_272;
  }
  unint64_t v238 = *((void *)v290 + v237 + 2);
  if (v238)
  {
    v237 += 2;
    goto LABEL_258;
  }
  uint64_t v239 = v237 + 3;
  uint64_t v306 = v237 + 2;
  if (v237 + 3 >= v298) {
    goto LABEL_272;
  }
  unint64_t v238 = *((void *)v290 + v239);
  if (v238)
  {
LABEL_261:
    uint64_t v237 = v239;
    goto LABEL_258;
  }
  while (1)
  {
    uint64_t v237 = v239 + 1;
    if (__OFADD__(v239, 1)) {
      break;
    }
    if (v237 >= v298)
    {
      uint64_t v306 = v289;
      goto LABEL_272;
    }
    unint64_t v238 = *((void *)v290 + v237);
    ++v239;
    if (v238) {
      goto LABEL_258;
    }
  }
LABEL_318:
  __break(1u);
LABEL_319:
  __break(1u);
LABEL_320:

  __break(1u);
LABEL_321:
  uint64_t result = sub_1A4F7B1F8();
  __break(1u);
  return result;
}

void *sub_1A4F61520(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_1A4F64510((uint64_t)a1);
      if (v7)
      {
        unint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_1A4F7B148();

  if (!v4) {
    return 0;
  }
  sub_1A4F68994(0, &qword_1E9664750);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  unint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

double sub_1A4F615F8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_1A4F64554(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_1A4F68358(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

void sub_1A4F6165C(void *a1, uint64_t a2, void *a3, char a4, void *a5, uint64_t *a6)
{
  uint64_t v11 = *a6;
  uint64_t v12 = a1;
  uint64_t v13 = sub_1A4F61520(v12, v11);

  if (v13) {
    return;
  }
  char v108 = a6;
  if (![v12 isTemporary])
  {
    id v20 = objc_msgSend(a3, sel_registerFetchedObjectWithID_, v12);
    if (v20) {
      goto LABEL_10;
    }
LABEL_119:
    if (qword_1E9664670 != -1) {
      goto LABEL_127;
    }
    goto LABEL_120;
  }
  id v14 = [v12 entityName];
  uint64_t v15 = &selRef_insertedPersistentObjectWithEntityName_;
  if ((a4 & 1) == 0) {
    uint64_t v15 = &selRef_persistentObjectWithEntityName_;
  }
  id v16 = objc_msgSend(a3, *v15, v14);

  if (!*a5)
  {
    id v20 = v16;
    if (v16) {
      goto LABEL_10;
    }
    goto LABEL_119;
  }
  if (!v16 || (id v17 = objc_msgSend(v16, sel_objectID)) == 0)
  {
    uint64_t v92 = v12;
    char v93 = (void *)sub_1A4F63DC4((unint64_t)v92);

    id v20 = v16;
    if (v16) {
      goto LABEL_10;
    }
    goto LABEL_119;
  }
  uint64_t v18 = (uint64_t)v17;
  uint64_t v19 = v12;
  sub_1A4F63F1C(v18, v19, &qword_1E96647B0, sub_1A4F658A4);

  id v20 = v16;
LABEL_10:
  unint64_t v21 = v20;
  id v22 = v20;
  uint64_t v12 = v12;
  id v23 = v22;
  sub_1A4F63F1C((uint64_t)v23, v12, &qword_1E96647B8, sub_1A4F65648);
  if (!*(void *)(a2 + 16))
  {

    return;
  }
  BOOL v101 = v21;
  unint64_t v24 = sub_1A4F64510((uint64_t)v12);
  if ((v25 & 1) == 0)
  {

LABEL_117:
    return;
  }
  uint64_t v26 = a2;
  int64_t v115 = a5;
  uint64_t v27 = *(void *)(*(void *)(a2 + 56) + 8 * v24);
  swift_bridgeObjectRetain();

  int64_t v109 = 0;
  uint64_t v103 = v27 + 64;
  uint64_t v28 = 1 << *(unsigned char *)(v27 + 32);
  if (v28 < 64) {
    uint64_t v29 = ~(-1 << v28);
  }
  else {
    uint64_t v29 = -1;
  }
  unint64_t v30 = v29 & *(void *)(v27 + 64);
  uint64_t v107 = v27;
  int64_t v105 = (unint64_t)(v28 + 63) >> 6;
  uint64_t v116 = a2;
  id v106 = v23;
  uint64_t v114 = a3;
  while (1)
  {
    if (v30)
    {
      unint64_t v35 = __clz(__rbit64(v30));
      v30 &= v30 - 1;
      unint64_t v36 = v35 | (v109 << 6);
LABEL_23:
      uint64_t v37 = *(void *)(v107 + 56);
      id v38 = (void *)(*(void *)(v107 + 48) + 16 * v36);
      uint64_t v39 = v38[1];
      *(void *)&long long v123 = *v38;
      *((void *)&v123 + 1) = v39;
      sub_1A4F68358(v37 + 32 * v36, (uint64_t)&v124);
      swift_bridgeObjectRetain();
      goto LABEL_42;
    }
    int64_t v40 = v109 + 1;
    if (__OFADD__(v109, 1)) {
      goto LABEL_126;
    }
    if (v40 < v105)
    {
      unint64_t v41 = *(void *)(v103 + 8 * v40);
      if (!v41)
      {
        int64_t v42 = v109 + 2;
        ++v109;
        if (v40 + 1 >= v105) {
          goto LABEL_41;
        }
        unint64_t v41 = *(void *)(v103 + 8 * v42);
        if (!v41)
        {
          int64_t v109 = v40 + 1;
          if (v40 + 2 >= v105) {
            goto LABEL_41;
          }
          unint64_t v41 = *(void *)(v103 + 8 * (v40 + 2));
          if (v41)
          {
            v40 += 2;
            goto LABEL_27;
          }
          int64_t v42 = v40 + 3;
          int64_t v109 = v40 + 2;
          if (v40 + 3 >= v105) {
            goto LABEL_41;
          }
          unint64_t v41 = *(void *)(v103 + 8 * v42);
          if (!v41)
          {
            while (1)
            {
              int64_t v40 = v42 + 1;
              if (__OFADD__(v42, 1)) {
                break;
              }
              if (v40 >= v105)
              {
                int64_t v109 = v105 - 1;
                goto LABEL_41;
              }
              unint64_t v41 = *(void *)(v103 + 8 * v40);
              ++v42;
              if (v41) {
                goto LABEL_27;
              }
            }
            __break(1u);
LABEL_129:
            __break(1u);
            return;
          }
        }
        int64_t v40 = v42;
      }
LABEL_27:
      unint64_t v30 = (v41 - 1) & v41;
      unint64_t v36 = __clz(__rbit64(v41)) + (v40 << 6);
      int64_t v109 = v40;
      goto LABEL_23;
    }
LABEL_41:
    unint64_t v30 = 0;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v123 = 0u;
LABEL_42:
    sub_1A4F683B4((uint64_t)&v123, (uint64_t)&v126);
    uint64_t v113 = v127;
    if (!v127)
    {
      swift_release();
      goto LABEL_117;
    }
    sub_1A4F6841C(&v128, &v121);
    sub_1A4F68358((uint64_t)&v121, (uint64_t)&v123);
    type metadata accessor for EKRemoteUIPersistentObjectPointer();
    if (swift_dynamicCast())
    {
      uint64_t v43 = a3;
      uint64_t v44 = v26;
      uint64_t v34 = *(void **)&v117[0];
      uint64_t v45 = *(void **)(*(void *)&v117[0] + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID);
      uint64_t v46 = *(unsigned __int8 *)(*(void *)&v117[0]
                               + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert);
      uint64_t ObjCClassFromObject = (void *)swift_getObjCClassFromObject();
      uint64_t v48 = v23;
      id v49 = v45;
      if (!objc_msgSend(ObjCClassFromObject, sel_meltedClass)) {
        goto LABEL_129;
      }
      swift_getObjCClassMetadata();
      uint64_t v12 = v48;
      unint64_t v50 = (void *)sub_1A4F7AF48();
      unsigned __int8 v51 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_isWeakRelationObject_forKey_, v12, v50);

      if ((v51 & 1) == 0)
      {
        uint64_t v26 = v44;
        uint64_t v59 = (void *)sub_1A4F6165C(v49, v44, v43, v46, v115, v108);
        if (v59)
        {
          id v60 = v59;
          uint64_t v61 = (void *)sub_1A4F7AF48();
          swift_bridgeObjectRelease();
          [v12 setValue:v60 forKey:v61];

          uint64_t v26 = v44;
          uint64_t v34 = v60;
        }
        else
        {

          swift_bridgeObjectRelease();
          uint64_t v34 = v49;
        }
        id v23 = v106;
        goto LABEL_19;
      }
      v52.isa = v108->isa;
      if (objc_msgSend(v49, sel_entityType) == (id)1 && objc_msgSend(v49, sel_isVirtual))
      {
        id v53 = objc_msgSend(v43, sel_defaultCalendarForNewEvents);
        if (!v53) {
          goto LABEL_113;
        }
        uint64_t v54 = v53;
        id v31 = objc_msgSend(v53, sel_persistentObject);

        if (!v31) {
          goto LABEL_113;
        }
        goto LABEL_17;
      }
      if (((unint64_t)v52.isa & 0xC000000000000001) != 0)
      {
        id v62 = v49;
        uint64_t v63 = sub_1A4F7B148();
        if (v63)
        {
          *(void *)&v117[0] = v63;
          sub_1A4F68994(0, &qword_1E9664750);
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v31 = (id)v123;
          swift_unknownObjectRelease();
          goto LABEL_102;
        }
      }
      else
      {
        if (!*((void *)v52.isa + 2)) {
          goto LABEL_105;
        }
        unint64_t v84 = sub_1A4F64510((uint64_t)v49);
        if (v85)
        {
          id v31 = *(id *)(*((void *)v52.isa + 7) + 8 * v84);
LABEL_102:

          if (v31) {
            goto LABEL_17;
          }
          goto LABEL_105;
        }
      }

LABEL_105:
      if (objc_msgSend(v49, sel_isTemporary))
      {
        if (qword_1E9664670 != -1) {
          swift_once();
        }
        uint64_t v86 = sub_1A4F7AF08();
        __swift_project_value_buffer(v86, (uint64_t)qword_1E9664C38);
        char v87 = v49;
        uint64_t v12 = sub_1A4F7AEE8();
        os_log_type_t v88 = sub_1A4F7AFA8();
        if (os_log_type_enabled(v12, v88))
        {
          uint64_t v89 = swift_slowAlloc();
          id v90 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v89 = 138412290;
          *(void *)(v89 + 4) = v87;
          *id v90 = v87;
          _os_log_impl(&dword_1A4E47000, v12, v88, "EKRemoteUIObjectSerializer: Attempting to fetch from the eventStore using a temporary objectID: %@", (uint8_t *)v89, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664760);
          swift_arrayDestroy();
          uint64_t v44 = v116;
          MEMORY[0x1A6266C00](v90, -1, -1);
          MEMORY[0x1A6266C00](v89, -1, -1);
        }
        else
        {

          uint64_t v12 = v87;
        }

        goto LABEL_113;
      }
      id v31 = objc_msgSend(v43, sel_registerFetchedObjectWithID_, v49);
      if (!v31)
      {
LABEL_113:
        swift_bridgeObjectRelease();

        goto LABEL_18;
      }
LABEL_17:
      id v32 = v31;
      uint64_t v33 = (void *)sub_1A4F7AF48();
      swift_bridgeObjectRelease();
      [v12 setValue:v32 forKey:v33];

      uint64_t v34 = v32;
LABEL_18:
      id v23 = v106;
      uint64_t v26 = v44;
LABEL_19:
      a3 = v43;
      goto LABEL_20;
    }
    sub_1A4F68358((uint64_t)&v121, (uint64_t)&v123);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664738);
    if (swift_dynamicCast()) {
      break;
    }
    sub_1A4F68358((uint64_t)&v121, (uint64_t)&v123);
    sub_1A4F68994(0, &qword_1E96647A8);
    if (swift_dynamicCast())
    {

      uint64_t v12 = v113;
      uint64_t v34 = (void *)sub_1A4F7AF48();
      swift_bridgeObjectRelease();
      objc_msgSend(v23, sel_setValue_forKey_, 0, v34);
    }
    else
    {
      __swift_project_boxed_opaque_existential_0(&v121, v122);
      uint64_t v12 = sub_1A4F7B1C8();
      uint64_t v34 = (void *)sub_1A4F7AF48();
      swift_bridgeObjectRelease();
      objc_msgSend(v23, sel_setValue_forKey_, v12, v34);
      swift_unknownObjectRelease();
    }
LABEL_20:

    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v121);
  }
  uint64_t v55 = *(void *)&v117[0];
  if ((*(void *)&v117[0] & 0xC000000000000001) != 0)
  {
    sub_1A4F7B048();
    sub_1A4F68550();
    sub_1A4F7AF98();
    uint64_t v55 = v129;
    uint64_t v112 = v130;
    uint64_t v56 = v131;
    uint64_t v57 = v132;
    unint64_t v58 = v133;
  }
  else
  {
    uint64_t v57 = 0;
    uint64_t v64 = -1 << *(unsigned char *)(*(void *)&v117[0] + 32);
    uint64_t v112 = *(void *)&v117[0] + 56;
    uint64_t v56 = ~v64;
    uint64_t v65 = -v64;
    if (v65 < 64) {
      uint64_t v66 = ~(-1 << v65);
    }
    else {
      uint64_t v66 = -1;
    }
    unint64_t v58 = v66 & *(void *)(*(void *)&v117[0] + 56);
  }
  uint64_t v12 = v108;
  unint64_t v104 = v30;
  int64_t v110 = (unint64_t)(v56 + 64) >> 6;
  uint64_t v111 = (unsigned char *)MEMORY[0x1E4FBC870];
  while (1)
  {
    uint64_t v67 = v57;
    if ((v55 & 0x8000000000000000) == 0) {
      break;
    }
    uint64_t v70 = sub_1A4F7B078();
    if (!v70) {
      goto LABEL_110;
    }
    *(void *)&v117[0] = v70;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    char v71 = (char *)v123;
    swift_unknownObjectRelease();
    if (!v71) {
      goto LABEL_110;
    }
LABEL_88:
    id v75 = *(id *)&v71[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID];
    uint64_t v76 = ((uint64_t (*)(void))sub_1A4F6165C)();
    if (v76)
    {
      unint64_t v77 = (void *)v76;
      uint64_t v119 = v76;
      sub_1A4F68994(0, &qword_1E9664750);
      sub_1A4F68938(&qword_1E9664780, &qword_1E9664750);
      id v102 = v77;
      sub_1A4F7B0B8();
      swift_bridgeObjectRetain();
      uint64_t v78 = sub_1A4F7B088();
      uint64_t v79 = -1 << v111[32];
      unint64_t v80 = v78 & ~v79;
      if ((*(void *)&v111[((v80 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v80))
      {
        uint64_t v81 = ~v79;
        while (1)
        {
          sub_1A4F68A14(*((void *)v111 + 6) + 40 * v80, (uint64_t)&v123);
          char v82 = MEMORY[0x1A6265980](&v123, v117);
          sub_1A4F68A70((uint64_t)&v123);
          if (v82) {
            break;
          }
          unint64_t v80 = (v80 + 1) & v81;
          if (((*(void *)&v111[((v80 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v80) & 1) == 0) {
            goto LABEL_94;
          }
        }
        swift_bridgeObjectRelease();
        sub_1A4F68A70((uint64_t)v117);
        sub_1A4F68A14(*((void *)v111 + 6) + 40 * v80, (uint64_t)&v123);
      }
      else
      {
LABEL_94:
        swift_bridgeObjectRelease();
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_1A4F68A14((uint64_t)v117, (uint64_t)&v123);
        v120 = v111;
        sub_1A4F67924((uint64_t)&v123, v80, isUniquelyReferenced_nonNull_native);
        uint64_t v111 = v120;
        swift_bridgeObjectRelease();
        long long v123 = v117[0];
        long long v124 = v117[1];
        *(void *)&long long v125 = v118;
      }
      sub_1A4F7B0A8();
      sub_1A4F68A70((uint64_t)&v123);
      swift_dynamicCast();

      uint64_t v12 = v108;
    }
    else
    {
    }
  }
  if (v58)
  {
    unint64_t v68 = __clz(__rbit64(v58));
    v58 &= v58 - 1;
    unint64_t v69 = v68 | (v57 << 6);
LABEL_87:
    char v71 = (char *)*(id *)(*(void *)(v55 + 48) + 8 * v69);
    if (!v71) {
      goto LABEL_110;
    }
    goto LABEL_88;
  }
  int64_t v72 = v57 + 1;
  if (!__OFADD__(v57, 1))
  {
    if (v72 >= v110) {
      goto LABEL_110;
    }
    unint64_t v73 = *(void *)(v112 + 8 * v72);
    ++v57;
    if (!v73)
    {
      uint64_t v57 = v67 + 2;
      if (v67 + 2 >= v110) {
        goto LABEL_110;
      }
      unint64_t v73 = *(void *)(v112 + 8 * v57);
      if (!v73)
      {
        uint64_t v57 = v67 + 3;
        if (v67 + 3 >= v110) {
          goto LABEL_110;
        }
        unint64_t v73 = *(void *)(v112 + 8 * v57);
        if (!v73)
        {
          uint64_t v57 = v67 + 4;
          if (v67 + 4 >= v110) {
            goto LABEL_110;
          }
          unint64_t v73 = *(void *)(v112 + 8 * v57);
          if (!v73)
          {
            uint64_t v74 = v67 + 5;
            while (v110 != v74)
            {
              unint64_t v73 = *(void *)(v112 + 8 * v74++);
              if (v73)
              {
                uint64_t v57 = v74 - 1;
                goto LABEL_86;
              }
            }
LABEL_110:
            sub_1A4F6898C();
            id v91 = (void *)sub_1A4F7AF88();
            swift_bridgeObjectRelease();
            uint64_t v12 = v113;
            uint64_t v34 = (void *)sub_1A4F7AF48();
            swift_bridgeObjectRelease();
            id v23 = v106;
            objc_msgSend(v106, sel_setValue_forKey_, v91, v34);

            a3 = v114;
            uint64_t v26 = v116;
            unint64_t v30 = v104;
            goto LABEL_20;
          }
        }
      }
    }
LABEL_86:
    unint64_t v58 = (v73 - 1) & v73;
    unint64_t v69 = __clz(__rbit64(v73)) + (v57 << 6);
    goto LABEL_87;
  }
  __break(1u);
LABEL_126:
  __break(1u);
LABEL_127:
  swift_once();
LABEL_120:
  uint64_t v94 = sub_1A4F7AF08();
  __swift_project_value_buffer(v94, (uint64_t)qword_1E9664C38);
  unint64_t v95 = v12;
  os_log_type_t v96 = sub_1A4F7AEE8();
  os_log_type_t v97 = sub_1A4F7AFA8();
  if (os_log_type_enabled(v96, v97))
  {
    id v98 = (uint8_t *)swift_slowAlloc();
    char v99 = (void *)swift_slowAlloc();
    *(_DWORD *)id v98 = 138412290;
    uint64_t v126 = v95;
    os_log_type_t v100 = v95;
    sub_1A4F7AFF8();
    void *v99 = v95;

    _os_log_impl(&dword_1A4E47000, v96, v97, "EKRemoteUIObjectSerializer: Cannot create persistentObject from objectID: %@", v98, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664760);
    swift_arrayDestroy();
    MEMORY[0x1A6266C00](v99, -1, -1);
    MEMORY[0x1A6266C00](v98, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_1A4F62618(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (sub_1A4F7B058()) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = MEMORY[0x1E4FBC870];
    if (v2) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v8 = -1 << *(unsigned char *)(v1 + 32);
    uint64_t v30 = v1 + 56;
    uint64_t v5 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v7 = v10 & *(void *)(v1 + 56);
    swift_bridgeObjectRetain();
    uint64_t result = swift_retain();
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_6;
  }
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664778);
  uint64_t v3 = sub_1A4F7B0F8();
  if (!v2) {
    goto LABEL_7;
  }
LABEL_4:
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1A4F7B048();
  sub_1A4F68994(0, &qword_1E9664750);
  sub_1A4F68938(&qword_1E9664780, &qword_1E9664750);
  uint64_t result = sub_1A4F7AF98();
  uint64_t v1 = v34;
  uint64_t v30 = v35;
  uint64_t v5 = v36;
  uint64_t v6 = v37;
  unint64_t v7 = v38;
LABEL_11:
  int64_t v29 = (unint64_t)(v5 + 64) >> 6;
  uint64_t v11 = v3 + 56;
  while (v1 < 0)
  {
    uint64_t v16 = sub_1A4F7B078();
    if (!v16) {
      goto LABEL_45;
    }
    *(void *)&long long v31 = v16;
    sub_1A4F68994(0, &qword_1E9664750);
    swift_dynamicCast();
LABEL_36:
    sub_1A4F68994(0, &qword_1E9664750);
    swift_dynamicCast();
    uint64_t result = sub_1A4F7B088();
    uint64_t v22 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v11 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_46;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = *(void *)(v3 + 48) + 40 * v12;
    *(_OWORD *)uint64_t v13 = v31;
    *(_OWORD *)(v13 + 16) = v32;
    *(void *)(v13 + 32) = v33;
    ++*(void *)(v3 + 16);
  }
  if (v7)
  {
    unint64_t v14 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v15 = v14 | (v6 << 6);
LABEL_35:
    id v21 = *(id *)(*(void *)(v1 + 48) + 8 * v15);
    goto LABEL_36;
  }
  int64_t v17 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v17 >= v29) {
      goto LABEL_45;
    }
    unint64_t v18 = *(void *)(v30 + 8 * v17);
    uint64_t v19 = v6 + 1;
    if (!v18)
    {
      uint64_t v19 = v6 + 2;
      if (v6 + 2 >= v29) {
        goto LABEL_45;
      }
      unint64_t v18 = *(void *)(v30 + 8 * v19);
      if (!v18)
      {
        uint64_t v19 = v6 + 3;
        if (v6 + 3 >= v29) {
          goto LABEL_45;
        }
        unint64_t v18 = *(void *)(v30 + 8 * v19);
        if (!v18)
        {
          uint64_t v19 = v6 + 4;
          if (v6 + 4 >= v29) {
            goto LABEL_45;
          }
          unint64_t v18 = *(void *)(v30 + 8 * v19);
          if (!v18)
          {
            uint64_t v19 = v6 + 5;
            if (v6 + 5 >= v29) {
              goto LABEL_45;
            }
            unint64_t v18 = *(void *)(v30 + 8 * v19);
            if (!v18)
            {
              uint64_t v20 = v6 + 6;
              while (v29 != v20)
              {
                unint64_t v18 = *(void *)(v30 + 8 * v20++);
                if (v18)
                {
                  uint64_t v19 = v20 - 1;
                  goto LABEL_34;
                }
              }
LABEL_45:
              swift_release();
              sub_1A4F6898C();
              return v3;
            }
          }
        }
      }
    }
LABEL_34:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v19 << 6);
    uint64_t v6 = v19;
    goto LABEL_35;
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_1A4F62A58(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664790);
    uint64_t v2 = sub_1A4F7B1A8();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    int64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_1A4F68358(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1A4F6841C(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_1A4F6841C(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_1A4F6841C(v36, v37);
    sub_1A4F6841C(v37, &v33);
    uint64_t result = sub_1A4F7B088();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_1A4F6841C(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1A4F6898C();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1A4F62E20(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664790);
    uint64_t v2 = sub_1A4F7B1A8();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    int64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664798);
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_1A4F6841C(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_1A4F6841C(v35, v36);
    sub_1A4F6841C(v36, &v32);
    uint64_t result = sub_1A4F7B088();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_1A4F6841C(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_1A4F6898C();
    return v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

id EKRemoteUIObjectSerializer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id EKRemoteUIObjectSerializer.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = &v0[OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKIsPendingInsertKey];
  *(void *)uint64_t v2 = 0xD000000000000015;
  *((void *)v2 + 1) = 0x80000001A4F9AB30;
  uint64_t v3 = &v0[OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetKey];
  *(void *)uint64_t v3 = 0x676E6168434B456BLL;
  *((void *)v3 + 1) = 0xEF79654B74655365;
  uint64_t v4 = &v0[OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKPersistentObjectKey];
  *(void *)uint64_t v4 = 0xD000000000000016;
  *((void *)v4 + 1) = 0x80000001A4F9AB60;
  unint64_t v5 = &v0[OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKCachedMeltedObjectsKey];
  *(void *)unint64_t v5 = 0xD000000000000019;
  *((void *)v5 + 1) = 0x80000001A4F9AB80;
  uint64_t v6 = &v0[OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetSingleValueChangesKey];
  *(void *)uint64_t v6 = 0xD00000000000001FLL;
  *((void *)v6 + 1) = 0x80000001A4F9ABA0;
  unint64_t v7 = &v0[OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueAdditionsKey];
  *(void *)unint64_t v7 = 0xD000000000000020;
  *((void *)v7 + 1) = 0x80000001A4F9ABC0;
  int64_t v8 = &v0[OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueRemovalsKey];
  *(void *)int64_t v8 = 0xD00000000000001FLL;
  *((void *)v8 + 1) = 0x80000001A4F9ABF0;
  v10.id receiver = v0;
  v10.super_class = ObjectType;
  return objc_msgSendSuper2(&v10, sel_init);
}

id EKRemoteUIObjectSerializer.__deallocating_deinit()
{
  v2.id receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_1A4F63460(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E96647F0);
      objc_super v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      int64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      objc_super v10 = (void *)MEMORY[0x1E4FBC860];
      int64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1A4F685C4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A4F63570(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1A4F63668(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_1A4F7AFF8();
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1A4F635F0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1A4F63668(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_1A4F7AFF8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1A4F63668(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1A4F6373C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1A4F68358((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1A4F68358((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1A4F6373C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1A4F7B008();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1A4F638F8(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1A4F7B118();
  if (!v8)
  {
    sub_1A4F7B168();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1A4F7B1B8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1A4F638F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1A4F63990(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1A4F63B70(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1A4F63B70(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1A4F63990(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1A4F63B08(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1A4F7B108();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1A4F7B168();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1A4F7AF78();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1A4F7B1B8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1A4F7B168();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1A4F63B08(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664788);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _DWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1A4F63B70(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664788);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  int64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1A4F7B1B8();
  __break(1u);
  return result;
}

double sub_1A4F63CC0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1A4F64554(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *unint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1A4F673E4();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1A4F6841C((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_1A4F666A4(v8, v11);
    *unint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1A4F63DC4(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_1A4F64510(a1);
    char v13 = v12;
    swift_bridgeObjectRelease();
    if (v13)
    {
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v9 = *v2;
      uint64_t v17 = *v2;
      *uint64_t v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_1A4F675CC(&qword_1E96647B0);
        uint64_t v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  id v6 = (id)a1;
  uint64_t v7 = sub_1A4F7B148();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  uint64_t v8 = sub_1A4F7B058();
  uint64_t v9 = sub_1A4F658A4(v5, v8);
  swift_retain();
  a1 = sub_1A4F64510((uint64_t)v6);
  char v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  uint64_t v15 = *(void *)(*(void *)(v9 + 56) + 8 * a1);
  sub_1A4F6687C(a1, v9);
  *uint64_t v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_1A4F63F1C(uint64_t a1, void *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  id v6 = v4;
  uint64_t v9 = *v4;
  if ((*v4 & 0xC000000000000001) != 0)
  {
    if (v9 < 0) {
      uint64_t v11 = *v4;
    }
    else {
      uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = sub_1A4F7B058();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t *v6 = a4(v11, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v14 = *v6;
  uint64_t *v6 = 0x8000000000000000;
  sub_1A4F66ED0(a1, a2, isUniquelyReferenced_nonNull_native, a3);
  uint64_t *v6 = v14;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A4F63FE8(void *a1, void *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_1A4F7B068();

    if (v9)
    {
      swift_bridgeObjectRelease();

      type metadata accessor for EKRemoteUIPersistentObjectPointer();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v28;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_1A4F7B058();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_1A4F647CC(v7, result + 1);
    uint64_t v29 = v21;
    unint64_t v22 = *(void *)(v21 + 16);
    if (*(void *)(v21 + 24) <= v22)
    {
      uint64_t v26 = v22 + 1;
      id v27 = v8;
      sub_1A4F64BD0(v26, &qword_1E96647E0);
      uint64_t v23 = v29;
    }
    else
    {
      uint64_t v23 = v21;
      id v24 = v8;
    }
    sub_1A4F64E6C((uint64_t)v8, v23);
    *unint64_t v3 = v23;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1A4F7AFC8();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      type metadata accessor for EKRemoteUIPersistentObjectPointer();
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_1A4F7AFD8();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_1A4F7AFD8();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v30 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_1A4F64EF0((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v30;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_1A4F64268(void *a1, void *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_1A4F7B068();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_1A4F68994(0, &qword_1E9664750);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v28;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_1A4F7B058();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_1A4F649C4(v7, result + 1);
    uint64_t v29 = v21;
    unint64_t v22 = *(void *)(v21 + 16);
    if (*(void *)(v21 + 24) <= v22)
    {
      uint64_t v26 = v22 + 1;
      id v27 = v8;
      sub_1A4F64BD0(v26, &qword_1E9664768);
      uint64_t v23 = v29;
    }
    else
    {
      uint64_t v23 = v21;
      id v24 = v8;
    }
    sub_1A4F64E6C((uint64_t)v8, v23);
    *unint64_t v3 = v23;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1A4F7AFC8();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_1A4F68994(0, &qword_1E9664750);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_1A4F7AFD8();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_1A4F7AFD8();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v30 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_1A4F65084((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v30;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

unint64_t sub_1A4F64510(uint64_t a1)
{
  uint64_t v2 = sub_1A4F7AFC8();

  return sub_1A4F645CC(a1, v2);
}

unint64_t sub_1A4F64554(uint64_t a1, uint64_t a2)
{
  sub_1A4F7B208();
  sub_1A4F7AF68();
  uint64_t v4 = sub_1A4F7B218();

  return sub_1A4F646E8(a1, a2, v4);
}

unint64_t sub_1A4F645CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_1A4F68994(0, &qword_1E96646F8);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_1A4F7AFD8();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_1A4F7AFD8();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_1A4F646E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1A4F7B1D8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1A4F7B1D8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1A4F647CC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E96647E0);
    uint64_t v2 = sub_1A4F7B0E8();
    uint64_t v15 = v2;
    sub_1A4F7B048();
    if (sub_1A4F7B078())
    {
      type metadata accessor for EKRemoteUIPersistentObjectPointer();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v15;
        unint64_t v9 = *(void *)(v15 + 16);
        if (*(void *)(v15 + 24) <= v9)
        {
          sub_1A4F64BD0(v9 + 1, &qword_1E96647E0);
          uint64_t v2 = v15;
        }
        uint64_t result = sub_1A4F7AFC8();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v10 = 0;
          unint64_t v11 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v11 && (v10 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v12 = v7 == v11;
            if (v7 == v11) {
              unint64_t v7 = 0;
            }
            v10 |= v12;
            uint64_t v13 = *(void *)(v4 + 8 * v7);
          }
          while (v13 == -1);
          unint64_t v8 = __clz(__rbit64(~v13)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v_Block_object_dispose(&STACK[0x280], 8) = v14;
        ++*(void *)(v2 + 16);
      }
      while (sub_1A4F7B078());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC870];
  }
  return v2;
}

uint64_t sub_1A4F649C4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664768);
    uint64_t v2 = sub_1A4F7B0E8();
    uint64_t v15 = v2;
    sub_1A4F7B048();
    if (sub_1A4F7B078())
    {
      sub_1A4F68994(0, &qword_1E9664750);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v15;
        unint64_t v9 = *(void *)(v15 + 16);
        if (*(void *)(v15 + 24) <= v9)
        {
          sub_1A4F64BD0(v9 + 1, &qword_1E9664768);
          uint64_t v2 = v15;
        }
        uint64_t result = sub_1A4F7AFC8();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v10 = 0;
          unint64_t v11 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v11 && (v10 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v12 = v7 == v11;
            if (v7 == v11) {
              unint64_t v7 = 0;
            }
            v10 |= v12;
            uint64_t v13 = *(void *)(v4 + 8 * v7);
          }
          while (v13 == -1);
          unint64_t v8 = __clz(__rbit64(~v13)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v_Block_object_dispose(&STACK[0x280], 8) = v14;
        ++*(void *)(v2 + 16);
      }
      while (sub_1A4F7B078());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC870];
  }
  return v2;
}

uint64_t sub_1A4F64BD0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_1A4F7B0D8();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v30 = v2;
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    unint64_t v8 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v4 + 56);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_33;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_33;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                uint64_t v3 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v4 + 32);
                if (v29 > 63) {
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v8 = -1 << v29;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v11) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v4 + 48) + 8 * v17);
      uint64_t result = sub_1A4F7AFC8();
      uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v6;
  return result;
}

unint64_t sub_1A4F64E6C(uint64_t a1, uint64_t a2)
{
  sub_1A4F7AFC8();
  unint64_t result = sub_1A4F7B038();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_1A4F64EF0(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v8 = v6 + 1;
  if (a3)
  {
    sub_1A4F64BD0(v8, &qword_1E96647E0);
  }
  else
  {
    if (v7 > v6)
    {
      sub_1A4F6522C(&qword_1E96647E0);
      goto LABEL_14;
    }
    sub_1A4F653D0(v8, &qword_1E96647E0);
  }
  uint64_t v9 = *v3;
  uint64_t v10 = sub_1A4F7AFC8();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  a2 = v10 & ~v11;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    type metadata accessor for EKRemoteUIPersistentObjectPointer();
    id v12 = *(id *)(*(void *)(v9 + 48) + 8 * a2);
    char v13 = sub_1A4F7AFD8();

    if (v13)
    {
LABEL_13:
      sub_1A4F7B1E8();
      __break(1u);
    }
    else
    {
      uint64_t v14 = ~v11;
      while (1)
      {
        a2 = (a2 + 1) & v14;
        if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v15 = *(id *)(*(void *)(v9 + 48) + 8 * a2);
        char v16 = sub_1A4F7AFD8();

        if (v16) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v17 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v17 + 48) + 8 * a2) = a1;
  uint64_t v18 = *(void *)(v17 + 16);
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19) {
    __break(1u);
  }
  else {
    *(void *)(v17 + 16) = v20;
  }
}

void sub_1A4F65084(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v8 = v6 + 1;
  if (a3)
  {
    sub_1A4F64BD0(v8, &qword_1E9664768);
  }
  else
  {
    if (v7 > v6)
    {
      sub_1A4F6522C(&qword_1E9664768);
      goto LABEL_14;
    }
    sub_1A4F653D0(v8, &qword_1E9664768);
  }
  uint64_t v9 = *v3;
  uint64_t v10 = sub_1A4F7AFC8();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  a2 = v10 & ~v11;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_1A4F68994(0, &qword_1E9664750);
    id v12 = *(id *)(*(void *)(v9 + 48) + 8 * a2);
    char v13 = sub_1A4F7AFD8();

    if (v13)
    {
LABEL_13:
      sub_1A4F7B1E8();
      __break(1u);
    }
    else
    {
      uint64_t v14 = ~v11;
      while (1)
      {
        a2 = (a2 + 1) & v14;
        if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v15 = *(id *)(*(void *)(v9 + 48) + 8 * a2);
        char v16 = sub_1A4F7AFD8();

        if (v16) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v17 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v17 + 48) + 8 * a2) = a1;
  uint64_t v18 = *(void *)(v17 + 16);
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19) {
    __break(1u);
  }
  else {
    *(void *)(v17 + 16) = v20;
  }
}

id sub_1A4F6522C(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1A4F7B0C8();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 56);
  uint64_t v7 = v3 + 56;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 56);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20)
      {
        int64_t v10 = v19 + 2;
        if (v19 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v20 = *(void *)(v7 + 8 * v10);
        if (!v20) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void **)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v14) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1A4F653D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_1A4F7B0D8();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v3 = v6;
    return result;
  }
  uint64_t v29 = v2;
  uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v8 = v4 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1 << v7);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v4 + 56);
  int64_t v11 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v5 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    id v21 = *(id *)(*(void *)(v4 + 48) + 8 * v17);
    uint64_t result = sub_1A4F7AFC8();
    uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
    ++*(void *)(v6 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v3 = v29;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1A4F65648(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E96647B8);
    uint64_t v2 = sub_1A4F7B198();
    uint64_t v18 = v2;
    sub_1A4F7B128();
    uint64_t v3 = sub_1A4F7B158();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_1A4F68994(0, &qword_1E96646F8);
      do
      {
        swift_dynamicCast();
        sub_1A4F68994(0, &qword_1E9664750);
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_1A4F660BC(v12 + 1, 1, &qword_1E96647B8);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_1A4F7AFC8();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_1A4F7B158();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC868];
  }
  return v2;
}

uint64_t sub_1A4F658A4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E96647B0);
    uint64_t v2 = sub_1A4F7B198();
    uint64_t v18 = v2;
    sub_1A4F7B128();
    uint64_t v3 = sub_1A4F7B158();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_1A4F68994(0, &qword_1E96646F8);
      do
      {
        swift_dynamicCast();
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_1A4F660BC(v12 + 1, 1, &qword_1E96647B0);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_1A4F7AFC8();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_1A4F7B158();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC868];
  }
  return v2;
}

uint64_t sub_1A4F65AE4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E96647E8);
  uint64_t v6 = sub_1A4F7B188();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    long long v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      swift_bridgeObjectRetain();
    }
    uint64_t result = sub_1A4F7AFC8();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1A4F65DBC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E96647A0);
  uint64_t v6 = sub_1A4F7B188();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_1A4F6841C(v24, v35);
      }
      else
      {
        sub_1A4F68358((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1A4F7B208();
      sub_1A4F7AF68();
      uint64_t result = sub_1A4F7B218();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_1A4F6841C(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1A4F660BC(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v7 = sub_1A4F7B188();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v37 = v3;
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v15 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v22 = v21 | (v15 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v12) {
      break;
    }
    unint64_t v24 = (void *)(v6 + 64);
    unint64_t v25 = *(void *)(v38 + 8 * v23);
    ++v15;
    if (!v25)
    {
      int64_t v15 = v23 + 1;
      if (v23 + 1 >= v12) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v38 + 8 * v15);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_33:
          swift_release();
          uint64_t v4 = v37;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v38 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v15 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v15 >= v12) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v38 + 8 * v15);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v15 = v26;
      }
    }
LABEL_30:
    unint64_t v11 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_31:
    uint64_t v31 = 8 * v22;
    uint64_t v32 = *(void **)(*(void *)(v6 + 48) + v31);
    int64_t v33 = *(void **)(*(void *)(v6 + 56) + v31);
    if ((a2 & 1) == 0)
    {
      id v34 = v32;
      id v35 = v33;
    }
    uint64_t result = sub_1A4F7AFC8();
    uint64_t v16 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v17 = result & ~v16;
    unint64_t v18 = v17 >> 6;
    if (((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v18 == v28;
        if (v18 == v28) {
          unint64_t v18 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v13 + 8 * v18);
      }
      while (v30 == -1);
      unint64_t v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }
    *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t v20 = 8 * v19;
    *(void *)(*(void *)(v8 + 48) + v20) = v32;
    *(void *)(*(void *)(v8 + 56) + v20) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v37;
  unint64_t v24 = (void *)(v6 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v36 = 1 << *(unsigned char *)(v6 + 32);
  if (v36 >= 64) {
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v36;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_1A4F6638C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664770);
  char v36 = a2;
  uint64_t v6 = sub_1A4F7B188();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    BOOL v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1A4F7B208();
    sub_1A4F7AF68();
    uint64_t result = sub_1A4F7B218();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_1A4F666A4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1A4F7B028();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1A4F7B208();
        swift_bridgeObjectRetain();
        sub_1A4F7AF68();
        uint64_t v10 = sub_1A4F7B218();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *int64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *unint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *unint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_1A4F6687C(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_1A4F7B028();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        uint64_t v11 = sub_1A4F7AFC8();

        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            uint64_t v15 = *(void *)(a2 + 48);
            unint64_t v16 = (void *)(v15 + 8 * v3);
            unint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1) {
              *unint64_t v16 = *v17;
            }
            uint64_t v18 = *(void *)(a2 + 56);
            uint64_t v19 = (void *)(v18 + 8 * v3);
            uint64_t v20 = (void *)(v18 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v19 >= v20 + 1))
            {
              *uint64_t v19 = *v20;
              int64_t v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << a1) - 1;
  }
  *uint64_t v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

unint64_t sub_1A4F66A30(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1A4F7B028();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1A4F7B208();
        swift_bridgeObjectRetain();
        sub_1A4F7AF68();
        uint64_t v9 = sub_1A4F7B218();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          unint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *unint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

id sub_1A4F66C08(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_1A4F64510((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_1A4F67238();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      id result = (id)swift_bridgeObjectRelease();
      *(void *)(v16 + 8 * v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1A4F65AE4(v12, a3 & 1);
  unint64_t v18 = sub_1A4F64510((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_17:
    sub_1A4F68994(0, &qword_1E96646F8);
    id result = (id)sub_1A4F7B1F8();
    __break(1u);
    return result;
  }
  unint64_t v9 = v18;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v20 = 8 * v9;
  *(void *)(v15[6] + v20) = a2;
  *(void *)(v15[7] + v20) = a1;
  uint64_t v21 = v15[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v23;

  return a2;
}

_OWORD *sub_1A4F66D7C(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1A4F64554(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1A4F673E4();
      goto LABEL_7;
    }
    sub_1A4F65DBC(v15, a4 & 1);
    unint64_t v21 = sub_1A4F64554(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    id result = (_OWORD *)sub_1A4F7B1F8();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    char v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_1A4F6841C(a1, v19);
  }
LABEL_13:
  sub_1A4F671CC(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

void sub_1A4F66ED0(uint64_t a1, void *a2, char a3, uint64_t *a4)
{
  unint64_t v6 = v4;
  uint64_t v9 = *v4;
  unint64_t v11 = sub_1A4F64510((uint64_t)a2);
  uint64_t v12 = *(void *)(v9 + 16);
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v15 = v10;
  uint64_t v16 = *(void *)(v9 + 24);
  if (v16 >= v14 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v16 >= v14 && (a3 & 1) == 0)
  {
    sub_1A4F675CC(a4);
LABEL_7:
    uint64_t v17 = (void *)*v6;
    if (v15)
    {
LABEL_8:
      uint64_t v18 = v17[7];

      *(void *)(v18 + 8 * v11) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_1A4F660BC(v14, a3 & 1, a4);
  unint64_t v19 = sub_1A4F64510((uint64_t)a2);
  if ((v15 & 1) != (v20 & 1))
  {
LABEL_17:
    sub_1A4F68994(0, &qword_1E96646F8);
    sub_1A4F7B1F8();
    __break(1u);
    return;
  }
  unint64_t v11 = v19;
  uint64_t v17 = (void *)*v6;
  if (v15) {
    goto LABEL_8;
  }
LABEL_11:
  v17[(v11 >> 6) + 8] |= 1 << v11;
  uint64_t v21 = 8 * v11;
  *(void *)(v17[6] + v21) = a2;
  *(void *)(v17[7] + v21) = a1;
  uint64_t v22 = v17[2];
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v17[2] = v24;

  id v25 = a2;
}

uint64_t sub_1A4F6705C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1A4F64554(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1A4F6776C();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1A4F6638C(v15, a4 & 1);
  unint64_t v21 = sub_1A4F64554(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1A4F7B1F8();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  BOOL v23 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

_OWORD *sub_1A4F671CC(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1A4F6841C(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

void *sub_1A4F67238()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E96647E8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1A4F7B178();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1A4F673E4()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E96647A0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1A4F7B178();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *id v1 = v4;
    return result;
  }
  BOOL v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_1A4F68358(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_1A4F6841C(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    id v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1A4F675CC(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1A4F7B178();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v14) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v7 + 8 * v21);
    ++v10;
    if (!v22)
    {
      int64_t v10 = v21 + 1;
      if (v21 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v7 + 8 * v10);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v22 - 1) & v22;
    unint64_t v16 = __clz(__rbit64(v22)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void **)(*(void *)(v3 + 48) + v17);
    uint64_t v19 = *(void **)(*(void *)(v3 + 56) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    *(void *)(*(void *)(v5 + 56) + v17) = v19;
    id v20 = v18;
    id result = v19;
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v14) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v7 + 8 * v23);
  if (v22)
  {
    int64_t v10 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v7 + 8 * v10);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1A4F6776C()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664770);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1A4F7B178();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *id v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1A4F67924(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v5 = a3;
  int64_t v6 = result;
  uint64_t v7 = *(void *)v4;
  if (*(void *)(*(void *)v4 + 24) > *(void *)(*(void *)v4 + 16))
  {
    if (a3) {
      goto LABEL_87;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664778);
    uint64_t v9 = sub_1A4F7B0C8();
    uint64_t v5 = v9;
    if (*(void *)(v7 + 16))
    {
      uint64_t v10 = (void *)(v9 + 56);
      uint64_t v11 = v7 + 56;
      unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
      if (v5 != v7 || (unint64_t)v10 >= v11 + 8 * v12) {
        memmove(v10, (const void *)(v7 + 56), 8 * v12);
      }
      uint64_t v13 = 0;
      *(void *)(v5 + 16) = *(void *)(v7 + 16);
      uint64_t v14 = 1 << *(unsigned char *)(v7 + 32);
      uint64_t v15 = -1;
      if (v14 < 64) {
        uint64_t v15 = ~(-1 << v14);
      }
      unint64_t v16 = v15 & *(void *)(v7 + 56);
      int64_t v17 = (unint64_t)(v14 + 63) >> 6;
      while (1)
      {
        if (v16)
        {
LABEL_90:
          unint64_t v67 = __clz(__rbit64(v16));
          v16 &= v16 - 1;
          unint64_t v68 = v67 | (v13 << 6);
        }
        else
        {
          int64_t v73 = v13 + 1;
          if (__OFADD__(v13, 1)) {
            goto LABEL_114;
          }
          if (v73 >= v17) {
            break;
          }
          unint64_t v74 = *(void *)(v11 + 8 * v73);
          ++v13;
          if (!v74)
          {
            uint64_t v13 = v73 + 1;
            if (v73 + 1 >= v17) {
              break;
            }
            unint64_t v74 = *(void *)(v11 + 8 * v13);
            if (!v74)
            {
              uint64_t v13 = v73 + 2;
              if (v73 + 2 >= v17) {
                break;
              }
              unint64_t v74 = *(void *)(v11 + 8 * v13);
              if (!v74)
              {
                uint64_t v13 = v73 + 3;
                if (v73 + 3 >= v17) {
                  break;
                }
                unint64_t v74 = *(void *)(v11 + 8 * v13);
                if (!v74)
                {
                  uint64_t v13 = v73 + 4;
                  if (v73 + 4 >= v17) {
                    break;
                  }
                  unint64_t v74 = *(void *)(v11 + 8 * v13);
                  for (int64_t i = v73 + 4; !v74; ++i)
                  {
                    uint64_t v13 = i + 1;
                    if (__OFADD__(i, 1)) {
                      goto LABEL_115;
                    }
                    if (v13 >= v17) {
                      goto LABEL_111;
                    }
                    unint64_t v74 = *(void *)(v11 + 8 * v13);
                  }
                }
              }
            }
          }
          unint64_t v16 = (v74 - 1) & v74;
          unint64_t v68 = __clz(__rbit64(v74)) + (v13 << 6);
        }
        uint64_t v69 = 40 * v68;
        sub_1A4F68A14(*(void *)(v7 + 48) + 40 * v68, (uint64_t)&v80);
        uint64_t v70 = *(void *)(v5 + 48) + v69;
        long long v71 = v80;
        long long v72 = v81;
        *(void *)(v70 + 32) = v82;
        *(_OWORD *)uint64_t v70 = v71;
        *(_OWORD *)(v70 + 16) = v72;
      }
    }
LABEL_111:
    while (1)
    {
      id result = swift_release();
      *(void *)uint64_t v4 = v5;
LABEL_87:
      uint64_t v61 = *(void *)v4;
      *(void *)(*(void *)v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      uint64_t v62 = *(void *)(v61 + 48) + 40 * a2;
      long long v63 = *(_OWORD *)(v6 + 16);
      *(_OWORD *)uint64_t v62 = *(_OWORD *)v6;
      *(_OWORD *)(v62 + 16) = v63;
      *(void *)(v62 + 32) = *(void *)(v6 + 32);
      uint64_t v64 = *(void *)(v61 + 16);
      BOOL v65 = __OFADD__(v64, 1);
      uint64_t v66 = v64 + 1;
      if (!v65) {
        break;
      }
LABEL_110:
      __break(1u);
    }
    *(void *)(v61 + 16) = v66;
    return result;
  }
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664778);
  if ((v5 & 1) == 0)
  {
    uint64_t v5 = v18;
    uint64_t v38 = sub_1A4F7B0D8();
    uint64_t v11 = v38;
    if (*(void *)(v7 + 16))
    {
      uint64_t v77 = v4;
      int64_t v79 = v6;
      uint64_t v39 = 1 << *(unsigned char *)(v7 + 32);
      unint64_t v16 = v7 + 56;
      if (v39 < 64) {
        uint64_t v40 = ~(-1 << v39);
      }
      else {
        uint64_t v40 = -1;
      }
      a2 = v40 & *(void *)(v7 + 56);
      int64_t v6 = (unint64_t)(v39 + 63) >> 6;
      uint64_t v4 = v38 + 56;
      swift_retain();
      int64_t v17 = 0;
      uint64_t v13 = 40;
      while (1)
      {
        if (a2)
        {
          unint64_t v45 = __clz(__rbit64(a2));
          a2 &= a2 - 1;
          unint64_t v46 = v45 | (v17 << 6);
        }
        else
        {
          int64_t v47 = v17 + 1;
          if (__OFADD__(v17, 1)) {
            goto LABEL_109;
          }
          if (v47 >= v6) {
            goto LABEL_79;
          }
          unint64_t v48 = *(void *)(v16 + 8 * v47);
          ++v17;
          if (!v48)
          {
            int64_t v17 = v47 + 1;
            if (v47 + 1 >= v6) {
              goto LABEL_79;
            }
            unint64_t v48 = *(void *)(v16 + 8 * v17);
            if (!v48)
            {
              int64_t v17 = v47 + 2;
              if (v47 + 2 >= v6) {
                goto LABEL_79;
              }
              unint64_t v48 = *(void *)(v16 + 8 * v17);
              if (!v48)
              {
                int64_t v17 = v47 + 3;
                if (v47 + 3 >= v6) {
                  goto LABEL_79;
                }
                unint64_t v48 = *(void *)(v16 + 8 * v17);
                if (!v48)
                {
                  int64_t v17 = v47 + 4;
                  if (v47 + 4 >= v6) {
                    goto LABEL_79;
                  }
                  unint64_t v48 = *(void *)(v16 + 8 * v17);
                  int64_t v49 = v47 + 4;
                  if (!v48)
                  {
                    while (1)
                    {
                      int64_t v17 = v49 + 1;
                      if (__OFADD__(v49, 1)) {
                        goto LABEL_113;
                      }
                      if (v17 >= v6) {
                        break;
                      }
                      unint64_t v48 = *(void *)(v16 + 8 * v17);
                      ++v49;
                      if (v48) {
                        goto LABEL_67;
                      }
                    }
LABEL_79:
                    swift_release_n();
                    uint64_t v4 = v77;
                    int64_t v6 = v79;
LABEL_83:
                    *(void *)uint64_t v4 = v11;
                    uint64_t v5 = v6;
                    id result = sub_1A4F7B088();
                    uint64_t v59 = -1 << *(unsigned char *)(v11 + 32);
                    a2 = result & ~v59;
                    if (((*(void *)(v11 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
                      goto LABEL_87;
                    }
                    uint64_t v60 = ~v59;
                    while (1)
                    {
                      sub_1A4F68A14(*(void *)(v11 + 48) + 40 * a2, (uint64_t)&v80);
                      uint64_t v5 = MEMORY[0x1A6265980](&v80, v6);
                      id result = sub_1A4F68A70((uint64_t)&v80);
                      if (v5) {
                        goto LABEL_116;
                      }
                      a2 = (a2 + 1) & v60;
                      if (((*(void *)(v11 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
                        goto LABEL_87;
                      }
                    }
                  }
                }
              }
            }
          }
LABEL_67:
          a2 = (v48 - 1) & v48;
          unint64_t v46 = __clz(__rbit64(v48)) + (v17 << 6);
        }
        sub_1A4F68A14(*(void *)(v7 + 48) + 40 * v46, (uint64_t)&v80);
        uint64_t v5 = (uint64_t)&v80;
        uint64_t v50 = sub_1A4F7B088();
        uint64_t v51 = -1 << *(unsigned char *)(v11 + 32);
        unint64_t v52 = v50 & ~v51;
        unint64_t v53 = v52 >> 6;
        if (((-1 << v52) & ~*(void *)(v4 + 8 * (v52 >> 6))) != 0)
        {
          unint64_t v41 = __clz(__rbit64((-1 << v52) & ~*(void *)(v4 + 8 * (v52 >> 6)))) | v52 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v54 = 0;
          unint64_t v55 = (unint64_t)(63 - v51) >> 6;
          do
          {
            if (++v53 == v55 && (v54 & 1) != 0) {
              goto LABEL_89;
            }
            BOOL v56 = v53 == v55;
            if (v53 == v55) {
              unint64_t v53 = 0;
            }
            v54 |= v56;
            uint64_t v57 = *(void *)(v4 + 8 * v53);
          }
          while (v57 == -1);
          unint64_t v41 = __clz(__rbit64(~v57)) + (v53 << 6);
        }
        *(void *)(v4 + ((v41 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v41;
        uint64_t v42 = *(void *)(v11 + 48) + 40 * v41;
        long long v43 = v80;
        long long v44 = v81;
        *(void *)(v42 + 32) = v82;
        *(_OWORD *)uint64_t v42 = v43;
        *(_OWORD *)(v42 + 16) = v44;
        ++*(void *)(v11 + 16);
      }
    }
LABEL_82:
    swift_release();
    goto LABEL_83;
  }
  uint64_t v5 = v18;
  uint64_t v19 = sub_1A4F7B0D8();
  uint64_t v11 = v19;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_82;
  }
  uint64_t v76 = v4;
  int64_t v78 = v6;
  uint64_t v20 = 1 << *(unsigned char *)(v7 + 32);
  a2 = v7 + 56;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  else {
    uint64_t v21 = -1;
  }
  unint64_t v16 = v21 & *(void *)(v7 + 56);
  int64_t v6 = (unint64_t)(v20 + 63) >> 6;
  uint64_t v4 = v19 + 56;
  swift_retain();
  int64_t v17 = 0;
  uint64_t v13 = 40;
  while (v16)
  {
    unint64_t v24 = __clz(__rbit64(v16));
    v16 &= v16 - 1;
    unint64_t v25 = v24 | (v17 << 6);
LABEL_35:
    uint64_t v29 = *(void *)(v7 + 48) + 40 * v25;
    long long v80 = *(_OWORD *)v29;
    long long v81 = *(_OWORD *)(v29 + 16);
    uint64_t v82 = *(void *)(v29 + 32);
    uint64_t v5 = (uint64_t)&v80;
    uint64_t v30 = sub_1A4F7B088();
    uint64_t v31 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v32 = v30 & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v4 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v32) & ~*(void *)(v4 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_17;
    }
    char v34 = 0;
    unint64_t v35 = (unint64_t)(63 - v31) >> 6;
    do
    {
      if (++v33 == v35 && (v34 & 1) != 0)
      {
        __break(1u);
LABEL_89:
        __break(1u);
        goto LABEL_90;
      }
      BOOL v36 = v33 == v35;
      if (v33 == v35) {
        unint64_t v33 = 0;
      }
      v34 |= v36;
      uint64_t v37 = *(void *)(v4 + 8 * v33);
    }
    while (v37 == -1);
    unint64_t v22 = __clz(__rbit64(~v37)) + (v33 << 6);
LABEL_17:
    *(void *)(v4 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    uint64_t v23 = *(void *)(v11 + 48) + 40 * v22;
    *(_OWORD *)uint64_t v23 = v80;
    *(_OWORD *)(v23 + 16) = v81;
    *(void *)(v23 + 32) = v82;
    ++*(void *)(v11 + 16);
  }
  int64_t v26 = v17 + 1;
  if (__OFADD__(v17, 1))
  {
    __break(1u);
LABEL_109:
    __break(1u);
    goto LABEL_110;
  }
  if (v26 >= v6) {
    goto LABEL_77;
  }
  unint64_t v27 = *(void *)(a2 + 8 * v26);
  ++v17;
  if (v27) {
    goto LABEL_34;
  }
  int64_t v17 = v26 + 1;
  if (v26 + 1 >= v6) {
    goto LABEL_77;
  }
  unint64_t v27 = *(void *)(a2 + 8 * v17);
  if (v27) {
    goto LABEL_34;
  }
  int64_t v17 = v26 + 2;
  if (v26 + 2 >= v6) {
    goto LABEL_77;
  }
  unint64_t v27 = *(void *)(a2 + 8 * v17);
  if (v27) {
    goto LABEL_34;
  }
  int64_t v17 = v26 + 3;
  if (v26 + 3 >= v6) {
    goto LABEL_77;
  }
  unint64_t v27 = *(void *)(a2 + 8 * v17);
  if (v27)
  {
LABEL_34:
    unint64_t v16 = (v27 - 1) & v27;
    unint64_t v25 = __clz(__rbit64(v27)) + (v17 << 6);
    goto LABEL_35;
  }
  int64_t v17 = v26 + 4;
  if (v26 + 4 >= v6)
  {
LABEL_77:
    swift_release();
    uint64_t v58 = 1 << *(unsigned char *)(v7 + 32);
    uint64_t v4 = v76;
    int64_t v6 = v78;
    if (v58 >= 64) {
      bzero((void *)(v7 + 56), ((unint64_t)(v58 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    }
    else {
      *(void *)a2 = -1 << v58;
    }
    *(void *)(v7 + 16) = 0;
    goto LABEL_82;
  }
  unint64_t v27 = *(void *)(a2 + 8 * v17);
  int64_t v28 = v26 + 4;
  if (v27) {
    goto LABEL_34;
  }
  while (1)
  {
    int64_t v17 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v17 >= v6) {
      goto LABEL_77;
    }
    unint64_t v27 = *(void *)(a2 + 8 * v17);
    ++v28;
    if (v27) {
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_113:
  __break(1u);
LABEL_114:
  __break(1u);
LABEL_115:
  __break(1u);
LABEL_116:
  id result = sub_1A4F7B1E8();
  __break(1u);
  return result;
}

void sub_1A4F680D0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = (void *)sub_1A4F7AF48();
  id v5 = objc_msgSend(a1, sel_decodeObjectForKey_, v4);

  if (v5)
  {
    sub_1A4F7B018();
    swift_unknownObjectRelease();
    sub_1A4F6841C(&v10, &v11);
    sub_1A4F68994(0, &qword_1E96646F8);
    swift_dynamicCast();
    *(void *)&v3[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = v9;
    int64_t v6 = (void *)sub_1A4F7AF48();
    unsigned __int8 v7 = objc_msgSend(a1, sel_decodeBoolForKey_, v6);

    v3[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = v7;
    v8.id receiver = v3;
    v8.super_class = (Class)type metadata accessor for EKRemoteUIPersistentObjectPointer();
    objc_msgSendSuper2(&v8, sel_init);
  }
  else
  {
    __break(1u);
  }
}

uint64_t method lookup function for EKRemoteUISerializedObject(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EKRemoteUISerializedObject);
}

uint64_t dispatch thunk of EKRemoteUISerializedObject.__allocating_init(serializedObjectIDDictionary:objectIDToChangeSetDictionaryMap:objectIDToPersistentDictionaryMap:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for EKRemoteUIDeserializedObject(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EKRemoteUIDeserializedObject);
}

uint64_t dispatch thunk of EKRemoteUIDeserializedObject.__allocating_init(deserializedObject:tempObjectIDMap:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t method lookup function for EKRemoteUIPersistentObjectPointer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EKRemoteUIPersistentObjectPointer);
}

uint64_t dispatch thunk of EKRemoteUIPersistentObjectPointer.__allocating_init(objectID:isPendingInsert:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of EKRemoteUIPersistentObjectPointer.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of EKRemoteUIPersistentObjectPointer.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t type metadata accessor for EKRemoteUIObjectSerializer()
{
  return self;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1A4F68358(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1A4F683B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1A4F6841C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1A4F6847C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A4F684B4()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

unsigned char **sub_1A4F684C4(unsigned char **result)
{
  long long v2 = *result;
  *long long v2 = *(unsigned char *)(v1 + 16);
  *uint64_t result = v2 + 1;
  return result;
}

uint64_t sub_1A4F684D8()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

uint64_t sub_1A4F684E8()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A4F68520()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1A4F68548(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return sub_1A4F635F0(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_1A4F68550()
{
  unint64_t result = qword_1E9664748;
  if (!qword_1E9664748)
  {
    type metadata accessor for EKRemoteUIPersistentObjectPointer();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9664748);
  }
  return result;
}

uint64_t sub_1A4F685A4()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

uint64_t sub_1A4F685B4()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

uint64_t sub_1A4F685C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664700);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1A4F7B1B8();
  __break(1u);
  return result;
}

id sub_1A4F686D0(void *a1, void *a2, uint64_t a3)
{
  if (objc_msgSend(a1, sel_entityType) != (id)1 || !objc_msgSend(a1, sel_isVirtual))
  {
    id v9 = a1;
    id v8 = sub_1A4F61520(v9, a3);

    if (v8) {
      return v8;
    }
    if (!objc_msgSend(v9, sel_isTemporary)) {
      return objc_msgSend(a2, sel_registerFetchedObjectWithID_, v9);
    }
    if (qword_1E9664670 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1A4F7AF08();
    __swift_project_value_buffer(v10, (uint64_t)qword_1E9664C38);
    id v11 = v9;
    unint64_t v12 = sub_1A4F7AEE8();
    os_log_type_t v13 = sub_1A4F7AFA8();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 138412290;
      id v16 = v11;
      sub_1A4F7AFF8();
      *uint64_t v15 = v11;

      _os_log_impl(&dword_1A4E47000, v12, v13, "EKRemoteUIObjectSerializer: Attempting to fetch from the eventStore using a temporary objectID: %@", v14, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9664760);
      swift_arrayDestroy();
      MEMORY[0x1A6266C00](v15, -1, -1);
      MEMORY[0x1A6266C00](v14, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  id v6 = objc_msgSend(a2, sel_defaultCalendarForNewEvents);
  if (!v6) {
    return 0;
  }
  unsigned __int8 v7 = v6;
  id v8 = objc_msgSend(v6, sel_persistentObject);

  return v8;
}

uint64_t sub_1A4F68938(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1A4F68994(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A4F6898C()
{
  return swift_release();
}

uint64_t sub_1A4F68994(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1A4F68A14(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1A4F68A70(uint64_t a1)
{
  return a1;
}

uint64_t sub_1A4F68AC4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A4F68AF4()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

uint64_t sub_1A4F68B04()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

uint64_t sub_1A4F68B14()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

uint64_t sub_1A4F68B24()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

uint64_t sub_1A4F68B34(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1A4F68B90(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void __getREMListClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMListClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKFrozenReminderCalendar.m", 24, @"Unable to find class %s", "REMList");

  __break(1u);
}

void ReminderKitLibrary_cold_1(void *a1)
{
  long long v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ReminderKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKFrozenReminderCalendar.m", 23, @"%s", *a1);

  __break(1u);
}

void __getREMColorClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMColorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKFrozenReminderCalendar.m", 25, @"Unable to find class %s", "REMColor");

  __break(1u);
}

void __getREMReminderClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMReminderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKFrozenReminderReminder.m", 22, @"Unable to find class %s", "REMReminder");

  __break(1u);
}

void ReminderKitLibrary_cold_1_0(void *a1)
{
  long long v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ReminderKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKFrozenReminderReminder.m", 21, @"%s", *a1);

  __break(1u);
}

void __getREMUserActivityClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMUserActivityClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKFrozenReminderReminder.m", 23, @"Unable to find class %s", "REMUserActivity");

  __break(1u);
}

void __getREMReminderChangeItemClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMReminderChangeItemClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKFrozenReminderReminder.m", 24, @"Unable to find class %s", "REMReminderChangeItem");

  __break(1u);
}

void __getREMStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKReminderStore.m", 40, @"Unable to find class %s", "REMStore");

  __break(1u);
}

void ReminderKitLibrary_cold_1_1(void *a1)
{
  long long v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ReminderKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKReminderStore.m", 39, @"%s", *a1);

  __break(1u);
}

void __getREMListClass_block_invoke_cold_1_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMListClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKReminderStore.m", 42, @"Unable to find class %s", "REMList");

  __break(1u);
}

void __getREMReminderClass_block_invoke_cold_1_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMReminderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKReminderStore.m", 44, @"Unable to find class %s", "REMReminder");

  __break(1u);
}

void __getREMSaveRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMSaveRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKReminderStore.m", 43, @"Unable to find class %s", "REMSaveRequest");

  __break(1u);
}

void __getREMAccountClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMAccountClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKReminderStore.m", 41, @"Unable to find class %s", "REMAccount");

  __break(1u);
}

void __getREMAlarmClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMAlarmClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKReminderStore.m", 45, @"Unable to find class %s", "REMAlarm");

  __break(1u);
}

void __getREMRecurrenceRuleClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMRecurrenceRuleClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKReminderStore.m", 46, @"Unable to find class %s", "REMRecurrenceRule");

  __break(1u);
}

void __getREMStructuredLocationClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMStructuredLocationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKReminderStore.m", 47, @"Unable to find class %s", "REMStructuredLocation");

  __break(1u);
}

void __getCNAutocompleteStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNAutocompleteStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKAutocompleter.m", 42, @"Unable to find class %s", "CNAutocompleteStore");

  __break(1u);
}

void ContactsAutocompleteLibrary_cold_1(void *a1)
{
  long long v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ContactsAutocompleteLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKAutocompleter.m", 41, @"%s", *a1);

  __break(1u);
}

void __getCNAutocompleteFetchRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNAutocompleteFetchRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKAutocompleter.m", 43, @"Unable to find class %s", "CNAutocompleteFetchRequest");

  __break(1u);
}

void __getCNAutocompleteNameComponentsClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNAutocompleteNameComponentsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKAutocompleter.m", 45, @"Unable to find class %s", "CNAutocompleteNameComponents");

  __break(1u);
}

void __getCNAutocompleteResultClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNAutocompleteResultClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKAutocompleter.m", 44, @"Unable to find class %s", "CNAutocompleteResult");

  __break(1u);
}

void __getREMStructuredLocationClass_block_invoke_cold_1_0(void *a1)
{
  long long v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ReminderKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKFrozenReminderStructuredLocation.m", 22, @"%s", *a1);

  __break(1u);
}

void __getREMStructuredLocationClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMStructuredLocationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKFrozenReminderStructuredLocation.m", 23, @"Unable to find class %s", "REMStructuredLocation");

  __break(1u);
}

void __getREMRecurrenceEndClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMRecurrenceEndClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKFrozenReminderRecurrenceRule.m", 20, @"Unable to find class %s", "REMRecurrenceEnd");

  __break(1u);
}

void ReminderKitLibrary_cold_1_2(void *a1)
{
  long long v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ReminderKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKFrozenReminderRecurrenceRule.m", 18, @"%s", *a1);

  __break(1u);
}

void __getREMRecurrenceRuleClass_block_invoke_cold_1_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMRecurrenceRuleClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKFrozenReminderRecurrenceRule.m", 19, @"Unable to find class %s", "REMRecurrenceRule");

  __break(1u);
}

void __getREMRecurrenceDayOfWeekClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMRecurrenceDayOfWeekClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKFrozenReminderRecurrenceRule.m", 21, @"Unable to find class %s", "REMRecurrenceDayOfWeek");

  __break(1u);
}

void EKObjectIDFromDictionary_cold_1(int *a1, int *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  int v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Could not convert dictionary into EKObjectID. entityType = %d, rowID = %d", (uint8_t *)v5, 0xEu);
}

void EKObjectIDFromDictionary_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Could not convert dictionary into EKObjectID. Keys were missing.", v1, 2u);
}

void __getREMReminderClass_block_invoke_cold_1_1(void *a1)
{
  long long v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *ReminderKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKEvent.m", 95, @"%s", *a1);

  __break(1u);
}

void __getREMReminderClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMReminderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKEvent.m", 96, @"Unable to find class %s", "REMReminder");

  __break(1u);
}

void __getkSuggestionsEKEventAvailabilityStateSymbolLoc_block_invoke_cold_1(void *a1)
{
  long long v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *CoreSuggestionsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKEvent.m", 109, @"%s", *a1);

  __break(1u);
}

void __getREMAlarmTimeIntervalTriggerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMAlarmTimeIntervalTriggerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKFrozenReminderAlarm.m", 22, @"Unable to find class %s", "REMAlarmTimeIntervalTrigger");

  __break(1u);
}

void ReminderKitLibrary_cold_1_3(void *a1)
{
  long long v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *ReminderKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"EKFrozenReminderAlarm.m", 21, @"%s", *a1);

  __break(1u);
}

void __getREMAlarmDateTriggerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMAlarmDateTriggerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKFrozenReminderAlarm.m", 23, @"Unable to find class %s", "REMAlarmDateTrigger");

  __break(1u);
}

void __getREMAlarmLocationTriggerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getREMAlarmLocationTriggerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"EKFrozenReminderAlarm.m", 24, @"Unable to find class %s", "REMAlarmLocationTrigger");

  __break(1u);
}

void EKUtils_AdjustedAttendeeAddress_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "No 'address' given.  Will not create an adjusted address.", v1, 2u);
}

void EKUIAttendeeUtils_AttendeeHasResponded_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  long long v2 = "EKUIAttendeeUtils_AttendeeHasResponded";
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "'nil' participant given to function: [%s].  Will not compute needs response state.", (uint8_t *)&v1, 0xCu);
}

void __EKDatabasePerformMigrationIfNeeded_block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Migration returned error code %d", (uint8_t *)v2, 8u);
}

uint64_t sub_1A4F7AEB8()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1A4F7AEC8()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1A4F7AED8()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1A4F7AEE8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1A4F7AEF8()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1A4F7AF08()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1A4F7AF18()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1A4F7AF28()
{
  return MEMORY[0x1F40E6018]();
}

uint64_t sub_1A4F7AF38()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1A4F7AF48()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1A4F7AF58()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1A4F7AF68()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A4F7AF78()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1A4F7AF88()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1A4F7AF98()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1A4F7AFA8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1A4F7AFB8()
{
  return MEMORY[0x1F40E68F8]();
}

uint64_t sub_1A4F7AFC8()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1A4F7AFD8()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1A4F7AFE8()
{
  return MEMORY[0x1F41847B0]();
}

uint64_t sub_1A4F7AFF8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1A4F7B008()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1A4F7B018()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1A4F7B028()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1A4F7B038()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1A4F7B048()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1A4F7B058()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1A4F7B068()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1A4F7B078()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1A4F7B088()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1A4F7B098()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1A4F7B0A8()
{
  return MEMORY[0x1F4184C28]();
}

uint64_t sub_1A4F7B0B8()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1A4F7B0C8()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1A4F7B0D8()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1A4F7B0E8()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1A4F7B0F8()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1A4F7B108()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1A4F7B118()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1A4F7B128()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1A4F7B138()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1A4F7B148()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1A4F7B158()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1A4F7B168()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1A4F7B178()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1A4F7B188()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1A4F7B198()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1A4F7B1A8()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1A4F7B1B8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1A4F7B1C8()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1A4F7B1D8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A4F7B1E8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1A4F7B1F8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1A4F7B208()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A4F7B218()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t CADEKPersistentEventDefaultPropertiesToLoad()
{
  return MEMORY[0x1F410DF00]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9978](color);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1F40D99D0](color1, color2);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1F40DB598]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CalAbsoluteTimeGetAbsoluteTimeInTimeZone()
{
  return MEMORY[0x1F410F208]();
}

uint64_t CalAbsoluteTimeGetGregorianDate()
{
  return MEMORY[0x1F410F220]();
}

uint64_t CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone()
{
  return MEMORY[0x1F410F230]();
}

uint64_t CalAlertInviteeDeclines()
{
  return MEMORY[0x1F410DFB0]();
}

uint64_t CalAnalyticsSendEvent()
{
  return MEMORY[0x1F410F260]();
}

uint64_t CalAnalyticsTimeIntervalFromMachTimes()
{
  return MEMORY[0x1F410F270]();
}

uint64_t CalBooleanAsString()
{
  return MEMORY[0x1F410F280]();
}

uint64_t CalColorStringRepresentation()
{
  return MEMORY[0x1F410F290]();
}

uint64_t CalCopyTimeZone()
{
  return MEMORY[0x1F410F2B8]();
}

uint64_t CalCreateDateTimeFromICSDate()
{
  return MEMORY[0x1F410E2A8]();
}

uint64_t CalDatabaseCopyDirectoryPath()
{
  return MEMORY[0x1F410E3D0]();
}

uint64_t CalDateTimeRelease()
{
  return MEMORY[0x1F410F2D0]();
}

uint64_t CalEqualObjects()
{
  return MEMORY[0x1F410F2E0]();
}

uint64_t CalEqualStrings()
{
  return MEMORY[0x1F410F2E8]();
}

uint64_t CalEventOccurrenceCacheCopyBoundsForTimeZone()
{
  return MEMORY[0x1F410E928]();
}

uint64_t CalEventOccurrenceCacheGetIdealRangeAndTimeZone()
{
  return MEMORY[0x1F410E968]();
}

uint64_t CalGenerateQualifiedIdentifierWithClassAndSubdomain()
{
  return MEMORY[0x1F410F2F0]();
}

uint64_t CalGetEntityIDFromFetchedObjectDictonary()
{
  return MEMORY[0x1F410DF10]();
}

uint64_t CalGetRecurrenceUIDFromRealUID()
{
  return MEMORY[0x1F410EA40]();
}

uint64_t CalGetValuesFromFetchedObjectDictionary()
{
  return MEMORY[0x1F410DF18]();
}

uint64_t CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone()
{
  return MEMORY[0x1F410F320]();
}

uint64_t CalGregorianDateGetGregorianDateForDay()
{
  return MEMORY[0x1F410F330]();
}

uint64_t CalIsReminderBridgeEnabled()
{
  return MEMORY[0x1F410F350]();
}

uint64_t CalMonotonicTime()
{
  return MEMORY[0x1F410F358]();
}

uint64_t CalRecurrenceFrequencyFromICSFrequency()
{
  return MEMORY[0x1F410EB60]();
}

uint64_t CalRequestAuthorizationForServiceWithCompletion()
{
  return MEMORY[0x1F410DF20]();
}

uint64_t CalShowCompletedReminders()
{
  return MEMORY[0x1F410EC38]();
}

uint64_t CalTemporaryDirectory()
{
  return MEMORY[0x1F410F380]();
}

uint64_t CalTimeZoneCopyCFTimeZone()
{
  return MEMORY[0x1F410F388]();
}

uint64_t CalendarFoundationPerformBlockOnSharedContactStore()
{
  return MEMORY[0x1F410F390]();
}

uint64_t DDResultCopyExtractedDateFromReferenceDate()
{
  return MEMORY[0x1F4117188]();
}

uint64_t DDResultCopyExtractedStartDateEndDate()
{
  return MEMORY[0x1F4117198]();
}

uint64_t DDResultGetRange()
{
  return MEMORY[0x1F4117248]();
}

uint64_t DDResultGetSubResults()
{
  return MEMORY[0x1F4117268]();
}

uint64_t DDResultGetType()
{
  return MEMORY[0x1F4117278]();
}

uint64_t DDResultIsPastDate()
{
  return MEMORY[0x1F41172A0]();
}

uint64_t DDScannerCopyResultsWithOptions()
{
  return MEMORY[0x1F4117318]();
}

uint64_t DDScannerCreate()
{
  return MEMORY[0x1F4117320]();
}

uint64_t DDScannerScanString()
{
  return MEMORY[0x1F4117350]();
}

uint64_t DisplayNameStringForIdentityWithProperties()
{
  return MEMORY[0x1F410F3A8]();
}

uint64_t EKCachedTimeZoneWithName()
{
  return MEMORY[0x1F410F3B0]();
}

uint64_t EKDateComponentsGetDate()
{
  return MEMORY[0x1F410F3B8]();
}

uint64_t EKGetDefaultCalendarColors()
{
  return MEMORY[0x1F410F3D0]();
}

uint64_t EKSymbolicColorToRGBMapping()
{
  return MEMORY[0x1F410F3F8]();
}

uint64_t EKWeakLinkClass()
{
  return MEMORY[0x1F410F400]();
}

uint64_t EKWeakLinkStringConstant()
{
  return MEMORY[0x1F410F408]();
}

uint64_t GetSharedXPCInterfaceForCADClientInterface()
{
  return MEMORY[0x1F410DF28]();
}

uint64_t GetSharedXPCInterfaceForCADInterface()
{
  return MEMORY[0x1F410DF30]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1F40F6AD0](certificate);
}

uint64_t SecTrustDeserialize()
{
  return MEMORY[0x1F40F71E8]();
}

uint64_t SecTrustSerialize()
{
  return MEMORY[0x1F40F7250]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x1F415CC18]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFExecutableLinkedOnOrAfter()
{
  return MEMORY[0x1F40D8DB8]();
}

uint64_t _EKMSUUIDString()
{
  return MEMORY[0x1F410F1E8]();
}

uint64_t _EKMSUUIDStringForDetachedEvent()
{
  return MEMORY[0x1F410F1F0]();
}

uint64_t _NSMethodExceptionProem()
{
  return MEMORY[0x1F40E7398]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void bzero(void *a1, size_t a2)
{
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
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

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t doURLsEmailsPhoneNumbersMatch()
{
  return MEMORY[0x1F410F430]();
}

void free(void *a1)
{
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC5B0](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1F40CD038](*(void *)&token, check);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA8](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1F40CDAC0](a1, *(void *)&a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE148](__s1, __s2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1F40CE168](__dst, __src);
}

size_t strftime_l(char *a1, size_t a2, const char *a3, const tm *a4, locale_t a5)
{
  return MEMORY[0x1F40CE1A0](a1, a2, a3, a4, a5);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strptime_l(const char *a1, const char *a2, tm *a3, locale_t a4)
{
  return (char *)MEMORY[0x1F40CE228](a1, a2, a3, a4);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassFromObject()
{
  return MEMORY[0x1F4186600]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t tcc_authorization_check_audit_token()
{
  return MEMORY[0x1F415CC50]();
}

uint64_t tcc_credential_singleton_for_self()
{
  return MEMORY[0x1F415CCC8]();
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1F40CE590](a1);
}