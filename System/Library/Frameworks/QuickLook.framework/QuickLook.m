unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t block_destroy_helper_8()
{
  return swift_release();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
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

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
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

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

void sub_217F64FEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_217F65130(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F65274(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_217F653B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F6555C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_217F656A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F65804(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_217F65988(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F65AC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F65B9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F65F20(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_217F660D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217F6649C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217F6712C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_217F67998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  objc_destroyWeak(v37);
  _Block_object_dispose(&a37, 8);
  objc_destroyWeak(&location);
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

void sub_217F6814C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217F687FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217F68924(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F68A04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F68BA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F68EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217F69040(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F6ACFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak(v9);
  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

void sub_217F6B8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217F6D434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217F6D514(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F6DB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_217F6EC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_217F6F7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217F6FF18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_217F7259C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217F735C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217F736B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F74D84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_217F74F5C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void QLPXAffineTransformDecomposeTranslationScaleRotation(uint64_t a1, void *a2, double *a3, double *a4, double *a5)
{
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  double v13 = *(double *)a1;
  long double v12 = *(double *)(a1 + 8);
  double v14 = atan2(v12, *(long double *)a1);
  __double2 v15 = __sincos_stret(v14);
  if (fabs(v15.__cosval) <= fabs(v15.__sinval))
  {
    double v16 = v12 / v15.__sinval;
    double v17 = -*(double *)(a1 + 16) / v15.__sinval;
    if (!a2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  double v16 = v13 / v15.__cosval;
  double v17 = *(double *)(a1 + 24) / v15.__cosval;
  if (a2)
  {
LABEL_5:
    *a2 = v10;
    a2[1] = v11;
  }
LABEL_6:
  if (a3) {
    *a3 = v16;
  }
  if (a4) {
    *a4 = v17;
  }
  if (a5) {
    *a5 = v14;
  }
}

double QLPXDerivative(double (**a1)(id, double), double a2)
{
  double v3 = a2 + 0.03125;
  v4 = a1 + 2;
  v5 = (double (*)(double))a1[2];
  v6 = a1;
  double v7 = v5(v3);
  double v8 = (*v4)(v6, a2 + -0.03125);

  return (v7 - v8) * 16.0;
}

void sub_217F7AC90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

double maxLoadingItemForItem(void *a1)
{
  id v1 = a1;
  double v2 = 0.0;
  if ([v1 useLoadingTimeout])
  {
    [v1 maxLoadingTime];
    if (v3 <= 0.0) {
      double v2 = 0.75;
    }
    else {
      double v2 = v3;
    }
  }

  return v2;
}

void sub_217F7D870(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_217F7DBA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F7DCA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F7E2B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217F7EAD4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 176));
  objc_destroyWeak((id *)(v1 - 168));
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_217F7EDAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F80004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217F80158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217F80308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217F8040C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F80588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217F8068C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F819E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217F81AC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F81CF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F820FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F82BC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_217F82CAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F87458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_217F87694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217F8A56C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_217F8A6A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217F8A87C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217F8A934(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217F8C0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

float64_t QLConvertPointFromAnchorPointToNewAnchorPoint(float64x2_t *a1, float64x2_t a2, float64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  a2.f64[1] = a3;
  *(void *)&a2.f64[0] = *(_OWORD *)&vaddq_f64(vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a7 * a13), *a1, a6 * a12)), vsubq_f64(a2, vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a5 * a13), *a1, a4 * a12))));
  return a2.f64[0];
}

BOOL QLSizeAspectRatioEqualToSizeAspectRatioWithTolerance(double a1, double a2, double a3, double a4)
{
  return vabdd_f64(a1 / a2, a3 / a4) <= 0.01;
}

void sub_217F91EA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217F91F6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217F986D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217F98888(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217F99F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_217F9B030(_Unwind_Exception *a1)
{
}

void sub_217F9B9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

id QLWaveformWithPowerLevels(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", (double)a2 * 3.0, 30.0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __QLWaveformWithPowerLevels_block_invoke;
  v10[3] = &unk_2642F6388;
  id v11 = v5;
  unint64_t v12 = a2;
  uint64_t v13 = a1;
  id v7 = v5;
  double v8 = [v6 imageWithActions:v10];

  return v8;
}

void __QLWaveformWithPowerLevels_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) set];
  if (*(void *)(a1 + 40))
  {
    unint64_t v2 = 0;
    do
    {
      double v3 = *(double *)(*(void *)(a1 + 48) + 8 * v2) * 30.0;
      v4 = [MEMORY[0x263F82B60] mainScreen];
      [v4 scale];
      double v6 = v5;

      double v7 = round(v3 * v6) / v6;
      if (v7 <= 1.0) {
        double v8 = 14.5;
      }
      else {
        double v8 = (30.0 - v7) * 0.5;
      }
      v9 = [MEMORY[0x263F82B60] mainScreen];
      [v9 scale];
      double v11 = v10;

      v12.origin.y = round(v11 * v8) / v11;
      v12.origin.x = (double)v2 * 3.0;
      v12.size.height = 30.0 - v12.origin.y * 2.0;
      v12.size.width = 2.0;
      UIRectFill(v12);
      ++v2;
    }
    while (v2 < *(void *)(a1 + 40));
  }
}

void sub_217F9D7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __QLWaveformDeterminePowerLevelsForAsset_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    v4 = dispatch_get_global_queue(-32768, 0);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __QLWaveformDeterminePowerLevelsForAsset_block_invoke_105;
    v10[3] = &unk_2642F5830;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    id v11 = v5;
    uint64_t v14 = v6;
    id v12 = v3;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(v4, v10);
  }
  else
  {
    double v7 = (NSObject **)MEMORY[0x263F62940];
    double v8 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      double v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v9;
      _os_log_impl(&dword_217F61000, v8, OS_LOG_TYPE_ERROR, "No tracks found for asset %@ #Waveform", buf, 0xCu);
    }
  }
}

void __QLWaveformDeterminePowerLevelsForAsset_block_invoke_105(uint64_t a1)
{
  v67[3] = *MEMORY[0x263EF8340];
  memset(&v65, 0, sizeof(v65));
  unint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 duration];
  }
  CMTime time = v65;
  double Seconds = CMTimeGetSeconds(&time);
  unint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  double v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  size_t v9 = 8 * *(void *)(a1 + 56);
  MEMORY[0x270FA5388](v6);
  double v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v10, v9);
  bzero(v8, v9);
  id v11 = [*(id *)(a1 + 40) objectAtIndex:0];
  uint64_t v12 = *(void *)(a1 + 32);
  id v63 = 0;
  id v13 = [MEMORY[0x263EFA4C0] assetReaderWithAsset:v12 error:&v63];
  id v14 = v63;
  if (v14 || !v13)
  {
    id v46 = [NSString stringWithFormat:@"Cannot create an AVAssetReader to read the audio levels (error: %@)", v14];
    NSLog(&cfstr_SError.isa, "QLWaveformDeterminePowerLevelsForAsset_block_invoke", v46);
  }
  else
  {
    uint64_t v15 = *MEMORY[0x263EF92C8];
    v66[0] = *MEMORY[0x263EF92C0];
    v66[1] = v15;
    uint64_t v16 = (void *)MEMORY[0x263EFA4D8];
    v67[0] = &unk_26C9130F0;
    v67[1] = &unk_26C913108;
    v66[2] = *MEMORY[0x263EF92D0];
    v67[2] = MEMORY[0x263EFFA80];
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:3];
    v18 = [v16 assetReaderTrackOutputWithTrack:v11 outputSettings:v17];

    [v18 setAlwaysCopiesSampleData:0];
    [v13 addOutput:v18];
    [v13 startReading];
    id v52 = v18;
    v19 = (opaqueCMSampleBuffer *)[v18 copyNextSampleBuffer];
    if (v19)
    {
      v48 = v13;
      v49 = 0;
      v50 = v11;
      v51 = &v47;
      double v20 = Seconds / (double)v4;
      int64_t v21 = -1;
      do
      {
        v22 = v19;
        FormatDescription = CMSampleBufferGetFormatDescription(v19);
        StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
        CMSampleBufferGetPresentationTimeStamp(&v62, v22);
        double v25 = CMTimeGetSeconds(&v62);
        CMSampleBufferGetDuration(&v61, v22);
        double v26 = CMTimeGetSeconds(&v61);
        BOOL v27 = StreamBasicDescription->mBitsPerChannel == 16;
        v53 = v22;
        if (v27)
        {
          double v28 = v26;
          memset(&time, 0, sizeof(time));
          CMBlockBufferRef blockBufferOut = 0;
          CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(v22, 0, (AudioBufferList *)&time, 0x18uLL, 0, 0, 0, &blockBufferOut);
          unint64_t value_low = LODWORD(time.value);
          if (LODWORD(time.value))
          {
            unint64_t v30 = 0;
            do
            {
              v31 = (char *)&time + 16 * v30;
              UInt32 v32 = *((_DWORD *)v31 + 3);
              UInt32 mBytesPerFrame = StreamBasicDescription->mBytesPerFrame;
              if (mBytesPerFrame <= v32)
              {
                unint64_t v54 = v30;
                int v34 = 0;
                uint64_t v35 = *((void *)v31 + 2);
                unsigned int v36 = v32 / mBytesPerFrame;
                double v37 = (double)(v36 - 1);
                unint64_t mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
                if (v36 <= 1) {
                  unsigned int v36 = 1;
                }
                unsigned int v55 = v36;
                double v39 = 0.0;
                unint64_t v40 = mChannelsPerFrame;
                do
                {
                  if (v40)
                  {
                    unint64_t v41 = 0;
                    do
                    {
                      double v43 = (double)(unint64_t)(*(void *)(a1 + 56) - 1);
                      if ((v25 + v39 / v37 * v28) / v20 < v43) {
                        double v43 = (v25 + v39 / v37 * v28) / v20;
                      }
                      unint64_t v44 = (unint64_t)v43;
                      unint64_t v45 = *(void *)&v8[8 * (unint64_t)v43];
                      int v42 = *(__int16 *)(v35 + 2 * (v34 + v41));
                      *(double *)&v10[8 * v44] = sqrt(((double)v42 * (double)v42+ *(double *)&v10[8 * (unint64_t)v43]* *(double *)&v10[8 * (unint64_t)v43]* (double)v45)/ (double)(v45 + 1));
                      *(void *)&v8[8 * v44] = v45 + 1;
                      if (v21 < (uint64_t)(unint64_t)v43)
                      {
                        block[0] = MEMORY[0x263EF8330];
                        block[1] = 3221225472;
                        block[2] = __QLWaveformDeterminePowerLevelsForAsset_block_invoke_118;
                        block[3] = &unk_2642F6400;
                        id v57 = *(id *)(a1 + 48);
                        unint64_t v58 = v44;
                        v59 = v10;
                        dispatch_async(MEMORY[0x263EF83A0], block);

                        unint64_t mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
                        int64_t v21 = v44;
                      }
                      ++v41;
                      unint64_t v40 = mChannelsPerFrame;
                    }
                    while (v41 < mChannelsPerFrame);
                  }
                  double v39 = v39 + 1.0;
                  ++v34;
                }
                while (v34 != v55);
                unint64_t value_low = LODWORD(time.value);
                unint64_t v30 = v54;
              }
              ++v30;
            }
            while (v30 < value_low);
          }
          CFRelease(blockBufferOut);
        }
        CFRelease(v53);
        v19 = (opaqueCMSampleBuffer *)[v52 copyNextSampleBuffer];
      }
      while (v19);
      id v11 = v50;
      id v14 = v49;
      id v13 = v48;
    }
    id v46 = v52;
  }
}

uint64_t __QLWaveformDeterminePowerLevelsForAsset_block_invoke_118(void *a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(a1[4] + 16))(a1[4], a1[5] + 1, a1[6]);
}

void sub_217F9EB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217F9F744(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_217FA2134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_217FA2A64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217FA2C54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217FA3204(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217FA382C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _QLShouldNotify()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ((_QLShouldNotify___QLDidDetermineShouldNotify & 1) == 0)
  {
    v0 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v1 = [v0 bundleIdentifier];

    _QLShouldNotify___QLShouldNotifyFlag = [v1 hasPrefix:@"com.apple.quicklook"];
    _QLShouldNotify___QLDidDetermineShouldNotify = 1;
    uint64_t v2 = (NSObject **)MEMORY[0x263F62940];
    id v3 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v4 = @"YES";
      if (!_QLShouldNotify___QLShouldNotifyFlag) {
        unint64_t v4 = @"NO";
      }
      int v6 = 138412546;
      uint64_t v7 = v1;
      __int16 v8 = 2112;
      size_t v9 = v4;
      _os_log_impl(&dword_217F61000, v3, OS_LOG_TYPE_DEBUG, "Determining if should notify: Bundle identifier = %@, Should notify = %@ #Testing", (uint8_t *)&v6, 0x16u);
    }
  }
  return _QLShouldNotify___QLShouldNotifyFlag;
}

void QLNotifySelector(const char *a1, void *a2)
{
  id v3 = a2;
  NSStringFromSelector(a1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  QLNotify(v4, v3);
}

void QLNotify(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if (_QLShouldNotify())
  {
    uint64_t v5 = (void *)[v4 mutableCopy];
    int v6 = NSNumber;
    uint64_t v7 = [MEMORY[0x263EFF910] date];
    [v7 timeIntervalSince1970];
    double v9 = v8 * 1000.0;
    *(float *)&double v9 = v9;
    uint64_t v10 = [v6 numberWithFloat:v9];
    [v5 setObject:v10 forKey:@"_timestamp"];

    id v11 = (NSObject **)MEMORY[0x263F62940];
    uint64_t v12 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      uint64_t v12 = *v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412546;
      id v15 = v3;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      _os_log_impl(&dword_217F61000, v12, OS_LOG_TYPE_DEBUG, "Sending notification %@ with context %@. #Testing", (uint8_t *)&v14, 0x16u);
    }
    id v13 = +[QLNotificationCenter sharedInstance];
    [v13 postNotificationName:v3 userInfo:v5];
  }
}

void sub_217FA5164(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

id QLSLogHandle()
{
  v0 = (void **)MEMORY[0x263F62940];
  uint64_t v1 = (void *)*MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    uint64_t v1 = *v0;
  }

  return v1;
}

void sub_217FA551C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FA5668(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FA617C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FA8CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FAA144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217FAA378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_217FAC2C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217FAC44C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217FAC588(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217FAC62C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217FAC6C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217FAC758(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217FAC8B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217FACA50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217FAE170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

__SecTask *_QLGetStringEntitlement(const __CFString *a1)
{
  uint64_t v1 = _QLCopyEntitlementValue(a1);
  if (v1)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID != CFGetTypeID(v1))
    {
      CFRelease(v1);
      uint64_t v1 = 0;
    }
  }

  return v1;
}

__SecTask *_QLCopyEntitlementValue(const __CFString *a1)
{
  __n128 result = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  if (result)
  {
    id v3 = result;
    CFTypeRef v4 = SecTaskCopyValueForEntitlement(result, a1, 0);
    CFRelease(v3);
    return (__SecTask *)v4;
  }
  return result;
}

BOOL _QLGetBoolEntitlement(const __CFString *a1)
{
  uint64_t v1 = _QLCopyEntitlementValue(a1);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  CFTypeID TypeID = CFBooleanGetTypeID();
  BOOL v4 = TypeID == CFGetTypeID(v2) && CFEqual(v2, (CFTypeRef)*MEMORY[0x263EFFB40]) != 0;
  CFRelease(v2);
  return v4;
}

id _QLGetOpenInAppClaimBindingForDocumentProxy(void *a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1)
  {
    id v20 = 0;
    goto LABEL_25;
  }
  uint64_t v3 = *MEMORY[0x263F018F0];
  id v27 = 0;
  BOOL v4 = [v1 availableClaimBindingsForMode:0 handlerRank:v3 error:&v27];
  id v5 = v27;
  if (!v4 || ![v4 count])
  {
    uint64_t v16 = (NSObject **)MEMORY[0x263F62940];
    uint64_t v17 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      uint64_t v17 = *v16;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = v17;
      v19 = [v2 typeIdentifier];
      *(_DWORD *)buf = 138412546;
      v29 = v19;
      __int16 v30 = 2112;
      id v31 = v5;
      _os_log_impl(&dword_217F61000, v18, OS_LOG_TYPE_ERROR, "Could not obtain Open In app for document proxy of content type %@. Error: %@ #Generic", buf, 0x16u);
    }
    id v20 = 0;
    goto LABEL_24;
  }
  int v6 = [v4 firstObject];
  uint64_t v7 = [v6 bundleRecord];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v7 supportsOpenInPlace])
  {
    int64_t v21 = (NSObject **)MEMORY[0x263F62940];
    v22 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      v22 = *v21;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
      goto LABEL_22;
    }
    uint64_t v13 = v22;
    uint64_t v14 = [v2 typeIdentifier];
    *(_DWORD *)buf = 138412546;
    v29 = v2;
    __int16 v30 = 2112;
    id v31 = v14;
    _os_log_impl(&dword_217F61000, v13, OS_LOG_TYPE_INFO, "First owner app for document proxy: %@ of type: %@ does not support Open In, returning nil. #Generic", buf, 0x16u);
    goto LABEL_21;
  }
  double v8 = [v7 bundleIdentifier];
  double v9 = +[QLUtilitiesInternal getCurrentApplicationBundleIdentifierUsingEntitlement];
  char v10 = [v8 isEqualToString:v9];

  id v11 = (NSObject **)MEMORY[0x263F62940];
  uint64_t v12 = *MEMORY[0x263F62940];
  if ((v10 & 1) == 0)
  {
    if (!v12)
    {
      QLSInitLogging();
      uint64_t v12 = *v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v24 = v12;
      double v25 = [v7 bundleIdentifier];
      double v26 = [v2 typeIdentifier];
      *(_DWORD *)buf = 138412802;
      v29 = v25;
      __int16 v30 = 2112;
      id v31 = v2;
      __int16 v32 = 2112;
      v33 = v26;
      _os_log_impl(&dword_217F61000, v24, OS_LOG_TYPE_INFO, "First owner app: %@ for document proxy: %@ of type: %@ supports Open In, returning it. #Generic", buf, 0x20u);
    }
    id v20 = v6;
    goto LABEL_23;
  }
  if (!v12)
  {
    QLSInitLogging();
    uint64_t v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v12;
    uint64_t v14 = [v7 bundleIdentifier];
    uint64_t v15 = [v2 typeIdentifier];
    *(_DWORD *)buf = 138412802;
    v29 = v14;
    __int16 v30 = 2112;
    id v31 = v2;
    __int16 v32 = 2112;
    v33 = v15;
    _os_log_impl(&dword_217F61000, v13, OS_LOG_TYPE_INFO, "First owner app: %@ for document proxy: %@ of type: %@ supports Open In but is the current app, returning nil. #Generic", buf, 0x20u);

LABEL_21:
  }
LABEL_22:
  id v20 = 0;
LABEL_23:

LABEL_24:
LABEL_25:

  return v20;
}

id _QLGetOpenInAppClaimBindingForContentType(void *a1)
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__8;
  double v8 = __Block_byref_object_dispose__8;
  id v9 = 0;
  id v3 = a1;
  QLRunInMainThreadSync();
  id v1 = (id)v5[5];

  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_217FAFA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

id _QLGetOpenInAppClaimBindingForItem(void *a1)
{
  id v1 = a1;
  if ([v1 previewItemType] == 2 || objc_msgSend(v1, "previewItemType") == 3)
  {
    uint64_t v2 = 0;
  }
  else
  {
    id v3 = [v1 previewItemContentType];
    uint64_t v2 = _QLGetOpenInAppClaimBindingForContentType(v3);
  }

  return v2;
}

void sub_217FB1E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FB4DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FB4EEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FB8490(_Unwind_Exception *a1)
{
}

void sub_217FB9E50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_217FB9FE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t QLGetScaleForAnimatedImageWithSize()
{
  return QLImageWithSizeShouldNotBeScaled();
}

void sub_217FBFFB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FC1E54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_217FC256C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_217FC2FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FC313C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FC500C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FC5130(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FC58B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FC64C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 232));
  _Unwind_Resume(a1);
}

void sub_217FC6624(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FC6B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FC6D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FC7B24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_217FC7DE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_217FC80D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FC8630(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_217FCA0D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 48));
  objc_destroyWeak((id *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_217FCA1E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FCA7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_217FCC590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FCC67C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FCC718(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FCC874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FCC98C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FCCBB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FCCC54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FCD198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FCD254(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FCD7F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FCD970(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FCE87C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FCEC08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
}

void sub_217FCEDF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_217FCEED4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FCF5F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v31 - 248));
  _Unwind_Resume(a1);
}

void sub_217FCF918(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FD49C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_217FD50F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_217FD5E48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_217FD8694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FD991C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_217FD99FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FD9B54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FDC00C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217FDDCD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_217FE0378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak((id *)(v19 - 120));
  _Unwind_Resume(a1);
}

void sub_217FE04B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FE164C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217FE17B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FE1A80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217FE4228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_217FE42B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t sub_217FE5A04()
{
  uint64_t v0 = sub_2180381D4();
  __swift_allocate_value_buffer(v0, qword_267BB9498);
  __swift_project_value_buffer(v0, (uint64_t)qword_267BB9498);
  return sub_2180381C4();
}

uint64_t QLAccessoryViewWrapper.hostProxy.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9520);
  sub_2180384F4();
  return v1;
}

uint64_t sub_217FE5AB8@<X0>(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9520);
  uint64_t result = sub_2180384F4();
  *a1 = v3;
  return result;
}

uint64_t sub_217FE5B00()
{
  return sub_218038504();
}

uint64_t QLAccessoryViewWrapper.hostProxy.setter()
{
  return sub_218038504();
}

void (*QLAccessoryViewWrapper.hostProxy.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9520);
  v2[4] = sub_2180384E4();
  return sub_217FE5BF0;
}

void sub_217FE5BF0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t QLAccessoryViewWrapper.$hostProxy.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9520);

  return MEMORY[0x270F04E10](v0);
}

uint64_t QLAccessoryViewWrapper.init(hostProxy:)()
{
  type metadata accessor for QLAccessoryAppExtensionSceneProxy(0);
  sub_217FE7308(&qword_267BB9528, (void (*)(uint64_t))type metadata accessor for QLAccessoryAppExtensionSceneProxy);

  return sub_218038524();
}

id QLAccessoryViewWrapper.makeUIViewController(context:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for QLAccessoryViewWrapper();
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  id v5 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v31 = (uint64_t)v30 - v7;
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)v30 - v8;
  if (qword_267BB9490 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_2180381D4();
  uint64_t v11 = __swift_project_value_buffer(v10, (uint64_t)qword_267BB9498);
  sub_217FE6B8C(v1, (uint64_t)v9);
  v30[3] = v11;
  uint64_t v12 = sub_2180381B4();
  os_log_type_t v13 = sub_2180388D4();
  BOOL v14 = os_log_type_enabled(v12, v13);
  v30[2] = v2;
  if (v14)
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v33 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    v30[1] = v15 + 4;
    sub_217FE6B8C((uint64_t)v9, v31);
    uint64_t v17 = sub_218038694();
    uint64_t v32 = sub_217FE6C68(v17, v18, &v33);
    sub_2180389D4();
    swift_bridgeObjectRelease();
    sub_217FE6BF0((uint64_t)v9);
    _os_log_impl(&dword_217F61000, v12, v13, "Configuring %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v16, -1, -1);
    MEMORY[0x21D460050](v15, -1, -1);
  }
  else
  {
    sub_217FE6BF0((uint64_t)v9);
  }

  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E10]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9520);
  sub_2180384F4();
  uint64_t v20 = v33;
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  v30[-2] = v20;
  v30[-1] = v19;
  uint64_t v33 = v20;
  sub_217FE7308(&qword_267BB9528, (void (*)(uint64_t))type metadata accessor for QLAccessoryAppExtensionSceneProxy);
  id v22 = v19;
  sub_218037E14();
  swift_release();
  swift_release();

  sub_217FE6B8C(v1, (uint64_t)v5);
  v23 = sub_2180381B4();
  os_log_type_t v24 = sub_2180388D4();
  if (os_log_type_enabled(v23, v24))
  {
    double v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v33 = v26;
    *(_DWORD *)double v25 = 136315138;
    sub_217FE6B8C((uint64_t)v5, v31);
    uint64_t v27 = sub_218038694();
    uint64_t v32 = sub_217FE6C68(v27, v28, &v33);
    sub_2180389D4();
    swift_bridgeObjectRelease();
    sub_217FE6BF0((uint64_t)v5);
    _os_log_impl(&dword_217F61000, v23, v24, "Configured %s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v26, -1, -1);
    MEMORY[0x21D460050](v25, -1, -1);
  }
  else
  {
    sub_217FE6BF0((uint64_t)v5);
  }

  return v22;
}

uint64_t type metadata accessor for QLAccessoryViewWrapper()
{
  uint64_t result = qword_267BB9660;
  if (!qword_267BB9660) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_217FE6210()
{
  return sub_218038354();
}

uint64_t sub_217FE624C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_217FE7308(&qword_267BB9708, (void (*)(uint64_t))type metadata accessor for QLAccessoryViewWrapper);

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_217FE62E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_217FE7308(&qword_267BB9708, (void (*)(uint64_t))type metadata accessor for QLAccessoryViewWrapper);

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

uint64_t sub_217FE6374()
{
  return sub_218038454();
}

void sub_217FE6390()
{
}

uint64_t sub_217FE63E8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_217FE7308(&qword_267BB9528, (void (*)(uint64_t))type metadata accessor for QLAccessoryAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t result = MEMORY[0x21D460130](v3 + 16);
  *a2 = result;
  return result;
}

void sub_217FE6494(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_217FE7308(&qword_267BB9528, (void (*)(uint64_t))type metadata accessor for QLAccessoryAppExtensionSceneProxy);
  id v2 = v1;
  sub_218037E14();
  swift_release();
}

void *sub_217FE6570@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x360], 8) = 0;
  return result;
}

void sub_217FE6580(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_217FE658C(uint64_t a1, uint64_t a2)
{
  return sub_217FE69BC(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_217FE65B8(uint64_t a1, id *a2)
{
  uint64_t result = sub_218038604();
  *a2 = 0;
  return result;
}

uint64_t sub_217FE6630(uint64_t a1, id *a2)
{
  char v3 = sub_218038614();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_217FE66B0@<X0>(uint64_t *a1@<X8>)
{
  sub_218038624();
  uint64_t v2 = sub_2180385F4();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_217FE66FC(uint64_t a1)
{
  uint64_t v2 = sub_217FE7308(&qword_267BB96F8, type metadata accessor for DocumentAttributeKey);
  uint64_t v3 = sub_217FE7308(&qword_267BB9700, type metadata accessor for DocumentAttributeKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_217FE67B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_218038624();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_217FE67E4(uint64_t a1)
{
  uint64_t v2 = sub_217FE7308(&qword_267BB96E8, type metadata accessor for DocumentType);
  uint64_t v3 = sub_217FE7308(&qword_267BB96F0, type metadata accessor for DocumentType);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_217FE68A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2180385F4();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_217FE68E8(uint64_t a1)
{
  uint64_t v2 = sub_217FE7308(&qword_267BB9748, type metadata accessor for DocumentReadingOptionKey);
  uint64_t v3 = sub_217FE7308(&qword_267BB9750, type metadata accessor for DocumentReadingOptionKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_217FE69A4(uint64_t a1, uint64_t a2)
{
  return sub_217FE69BC(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_217FE69BC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_218038624();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_217FE6A00()
{
  sub_218038624();
  sub_2180386B4();

  return swift_bridgeObjectRelease();
}

uint64_t sub_217FE6A54()
{
  sub_218038624();
  sub_218038C24();
  sub_2180386B4();
  uint64_t v0 = sub_218038C44();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_217FE6AC8()
{
  uint64_t v0 = sub_218038624();
  uint64_t v2 = v1;
  if (v0 == sub_218038624() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_218038BB4();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_217FE6B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for QLAccessoryViewWrapper();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_217FE6BF0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for QLAccessoryViewWrapper();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_217FE6C4C()
{
  return sub_217FEFDB0();
}

uint64_t sub_217FE6C68(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_217FE6D3C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_217FE7A00((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_217FE7A00((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_217FE6D3C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2180389E4();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_217FE6EF8(a5, a6);
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
  uint64_t v8 = sub_218038AA4();
  if (!v8)
  {
    sub_218038B04();
    __break(1u);
LABEL_17:
    uint64_t result = sub_218038B64();
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

uint64_t sub_217FE6EF8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_217FE6F90(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_217FE7170(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_217FE7170(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_217FE6F90(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_217FE7108(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_218038A84();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_218038B04();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2180386F4();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_218038B64();
    __break(1u);
LABEL_14:
    uint64_t result = sub_218038B04();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_217FE7108(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9710);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_217FE7170(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9710);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_218038B64();
  __break(1u);
  return result;
}

uint64_t sub_217FE72C0()
{
  return sub_217FE7308((unint64_t *)&unk_267BB9650, (void (*)(uint64_t))type metadata accessor for QLAccessoryViewWrapper);
}

uint64_t sub_217FE7308(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_217FE7350()
{
  return MEMORY[0x263F1BB58];
}

uint64_t initializeBufferWithCopyOfBuffer for QLAccessoryViewWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9520);
  size_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for QLAccessoryViewWrapper(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9520);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for QLAccessoryViewWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for QLAccessoryViewWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for QLAccessoryViewWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for QLAccessoryViewWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for QLAccessoryViewWrapper(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_217FE75E8);
}

uint64_t sub_217FE75E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9520);
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for QLAccessoryViewWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_217FE766C);
}

uint64_t sub_217FE766C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9520);
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_217FE76E0()
{
  sub_217FE776C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_217FE776C()
{
  if (!qword_267BB9670)
  {
    type metadata accessor for QLAccessoryAppExtensionSceneProxy(255);
    unint64_t v0 = sub_218038534();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BB9670);
    }
  }
}

void type metadata accessor for QLPreviewItemEditingMode(uint64_t a1)
{
}

void type metadata accessor for QLPreviewItemType(uint64_t a1)
{
}

void type metadata accessor for QLVisibilityState(uint64_t a1)
{
}

void type metadata accessor for QLPreviewControllerFirstTimeAppearanceActions(uint64_t a1)
{
}

void type metadata accessor for DocumentType(uint64_t a1)
{
}

void type metadata accessor for DocumentAttributeKey(uint64_t a1)
{
}

void type metadata accessor for CGContext(uint64_t a1)
{
}

uint64_t sub_217FE7850()
{
  return sub_217FE7308(&qword_267BB96B8, type metadata accessor for DocumentAttributeKey);
}

uint64_t sub_217FE7898()
{
  return sub_217FE7308(&qword_267BB96C0, type metadata accessor for DocumentAttributeKey);
}

uint64_t sub_217FE78E0()
{
  return sub_217FE7308(&qword_267BB96C8, type metadata accessor for DocumentType);
}

uint64_t sub_217FE7928()
{
  return sub_217FE7308(&qword_267BB96D0, type metadata accessor for DocumentType);
}

uint64_t sub_217FE7970()
{
  return sub_217FE7308(&qword_267BB96D8, type metadata accessor for DocumentType);
}

uint64_t sub_217FE79B8()
{
  return sub_217FE7308(&qword_267BB96E0, type metadata accessor for DocumentAttributeKey);
}

uint64_t sub_217FE7A00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

void type metadata accessor for CGColor(uint64_t a1)
{
}

void type metadata accessor for DocumentReadingOptionKey(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for PreviewApplication.PreviewConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_217FE7B2C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_217FE7B4C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + _Block_object_dispose(&STACK[0x360], 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t sub_217FE7B8C()
{
  return sub_217FE7308(&qword_267BB9730, type metadata accessor for DocumentReadingOptionKey);
}

uint64_t sub_217FE7BD4()
{
  return sub_217FE7308(&qword_267BB9738, type metadata accessor for DocumentReadingOptionKey);
}

uint64_t sub_217FE7C1C()
{
  return sub_217FE7308(&qword_267BB9740, type metadata accessor for DocumentReadingOptionKey);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_217FE7C70(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_217FE7C90(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + _Block_object_dispose(&STACK[0x360], 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_217FE7CE0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_217FE7D38()
{
  return sub_217FE6C4C();
}

uint64_t sub_217FE7D50()
{
  uint64_t v0 = sub_2180381D4();
  __swift_allocate_value_buffer(v0, qword_267BB9830);
  __swift_project_value_buffer(v0, (uint64_t)qword_267BB9830);
  return sub_2180381C4();
}

id sub_217FE7DD0()
{
  id result = objc_msgSend(self, sel_mapTableWithKeyOptions_valueOptions_, 0, 5);
  qword_267BB9848 = (uint64_t)result;
  return result;
}

void sub_217FE7E14()
{
  swift_getKeyPath();
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  if (MEMORY[0x21D460130](v0 + 16))
  {
    self;
    uint64_t v1 = swift_dynamicCastObjCClass();
    if (v1)
    {
      uint64_t v2 = (void *)v1;
      if (qword_267BB94B8 != -1) {
        swift_once();
      }
      id v3 = (id)qword_267BB9848;
      swift_unknownObjectRetain();
      id v4 = objc_msgSend(v2, sel_uuid);
      if (v4)
      {
        size_t v5 = v4;
        objc_msgSend(v3, sel_setObject_forKey_, v2, v4);

        swift_unknownObjectRelease_n();
      }
      else
      {
        __break(1u);
      }
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_217FE7F84()
{
  swift_getKeyPath();
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  return MEMORY[0x21D460130](v0 + 16);
}

uint64_t sub_217FE8028@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t result = MEMORY[0x21D460130](v3 + 16);
  *a2 = result;
  return result;
}

uint64_t sub_217FE80D4()
{
  return swift_release();
}

uint64_t sub_217FE81B4()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_217FE8204()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_217FE82A8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  *a2 = *(void *)(v3 + 24);
  return swift_unknownObjectRetain();
}

uint64_t sub_217FE8354()
{
  return swift_release();
}

uint64_t QLAppExtensionSceneProxy.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(void *)(v0 + 24) = 0;
  sub_218037E54();
  return v0;
}

uint64_t QLAppExtensionSceneProxy.init()()
{
  swift_unknownObjectWeakInit();
  *(void *)(v0 + 24) = 0;
  sub_218037E54();
  return v0;
}

uint64_t sub_217FE84EC(char a1)
{
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 32) = a1;
  return MEMORY[0x270FA2498](sub_217FE8510, 0, 0);
}

void *sub_217FE8510()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_getKeyPath();
  *(void *)(v0 + 16) = v1;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t result = (void *)MEMORY[0x21D460130](v1 + 16);
  if (result)
  {
    objc_msgSend(result, sel_setAllowInteractiveTransitions_, *(unsigned __int8 *)(v0 + 32));
    swift_unknownObjectRelease();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return (void *)v3();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for QLAppExtensionSceneProxy(uint64_t a1)
{
  return sub_217FF0300(a1, (uint64_t *)&unk_267BB98B8);
}

uint64_t sub_217FE87B4(char a1, void *aBlock, uint64_t a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  swift_retain();
  uint64_t v6 = swift_task_alloc();
  v3[4] = v6;
  *(void *)uint64_t v6 = v3;
  *(void *)(v6 + _Block_object_dispose(&STACK[0x360], 8) = sub_217FF2250;
  *(void *)(v6 + 24) = a3;
  *(unsigned char *)(v6 + 32) = a1;
  return MEMORY[0x270FA2498](sub_217FE8510, 0, 0);
}

uint64_t sub_217FE888C()
{
  swift_getKeyPath();
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t result = MEMORY[0x21D460130](v0 + 16);
  if (result)
  {
    uint64_t v2 = (void *)result;
    uint64_t v3 = (void *)sub_2180385F4();
    objc_msgSend(v2, sel_setHostApplicationBundleIdentifier_, v3);

    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_217FE8994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_2180381D4();
  __swift_project_value_buffer(v11, (uint64_t)qword_267BB9830);
  uint64_t v12 = sub_2180381B4();
  os_log_type_t v13 = sub_2180388E4();
  if (os_log_type_enabled(v12, v13))
  {
    BOOL v14 = (uint8_t *)swift_slowAlloc();
    char v21 = a5;
    uint64_t v15 = a2;
    uint64_t v16 = a4;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v23 = v17;
    *(_DWORD *)BOOL v14 = 136315138;
    sub_217FE6C68(0xD00000000000005ALL, 0x80000002180516C0, &v23);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v12, v13, "Service side: %s", v14, 0xCu);
    swift_arrayDestroy();
    uint64_t v18 = v17;
    a4 = v16;
    a2 = v15;
    a5 = v21;
    MEMORY[0x21D460050](v18, -1, -1);
    MEMORY[0x21D460050](v14, -1, -1);
  }

  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  uint64_t v23 = v6;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  swift_unknownObjectRetain();
  sub_218037E14();
  swift_unknownObjectRelease();
  swift_release();
  swift_getKeyPath();
  uint64_t v23 = v6;
  sub_218037E24();
  swift_release();
  uint64_t result = (void *)MEMORY[0x21D460130](v6 + 16);
  if (result)
  {
    objc_msgSend(result, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen_, a1, a2, a3, a4, a5 & 1);
    return (void *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_217FE8C8C()
{
  return sub_217FF21F8();
}

void *sub_217FE8D40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_2180381D4();
  __swift_project_value_buffer(v10, (uint64_t)qword_267BB9830);
  uint64_t v11 = sub_2180381B4();
  os_log_type_t v12 = sub_2180388E4();
  if (os_log_type_enabled(v11, v12))
  {
    os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v17 = v14;
    *(_DWORD *)os_log_type_t v13 = 136315138;
    sub_217FE6C68(0xD00000000000004FLL, 0x8000000218051720, &v17);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v11, v12, "Service side: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v14, -1, -1);
    MEMORY[0x21D460050](v13, -1, -1);
  }

  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  uint64_t v17 = v5;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  swift_unknownObjectRetain();
  sub_218037E14();
  swift_unknownObjectRelease();
  swift_release();
  swift_getKeyPath();
  uint64_t v17 = v5;
  sub_218037E24();
  swift_release();
  uint64_t result = (void *)MEMORY[0x21D460130](v5 + 16);
  if (result)
  {
    objc_msgSend(result, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_, a1, a2, a3, a4);
    return (void *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_217FE90C4(uint64_t a1, char a2)
{
  return sub_217FED394(a1, a2, 0xD000000000000027, 0x8000000218051770, (SEL *)&selRef_setCurrentPreviewItemIndex_animated_);
}

void *sub_217FE9100(char a1)
{
  return sub_217FEEB84(a1, 0xD000000000000025, 0x80000002180517A0, (SEL *)&selRef_hostApplicationDidEnterBackground_);
}

void *sub_217FE913C()
{
  return sub_217FEDFF4(0xD000000000000020, 0x80000002180517D0, (SEL *)&selRef_hostApplicationDidBecomeActive);
}

uint64_t sub_217FE9178(uint64_t a1)
{
  *(void *)(v2 + 136) = a1;
  *(void *)(v2 + 144) = v1;
  return MEMORY[0x270FA2498](sub_217FE9198, 0, 0);
}

uint64_t sub_217FE9198()
{
  os_log_type_t v13 = v0;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2180381D4();
  __swift_project_value_buffer(v1, (uint64_t)qword_267BB9830);
  uint64_t v2 = sub_2180381B4();
  os_log_type_t v3 = sub_2180388E4();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v12 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[10] = sub_217FE6C68(0xD000000000000014, 0x8000000218051820, &v12);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v5, -1, -1);
    MEMORY[0x21D460050](v4, -1, -1);
  }

  uint64_t v6 = v0[18];
  swift_getKeyPath();
  v0[10] = v6;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t v7 = MEMORY[0x21D460130](v6 + 16);
  v0[19] = v7;
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = v0[17];
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_217FE946C;
    uint64_t v10 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_217FE95B8;
    v0[13] = &block_descriptor;
    v0[14] = v10;
    objc_msgSend(v8, sel_toolbarButtonsForTraitCollection_withCompletionHandler_, v9, v0 + 10);
    uint64_t v7 = (uint64_t)(v0 + 2);
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA23F0](v7);
}

uint64_t sub_217FE946C()
{
  return MEMORY[0x270FA2498](sub_217FE954C, 0, 0);
}

uint64_t sub_217FE954C()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  swift_unknownObjectRelease();
  os_log_type_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v2, v1);
}

uint64_t sub_217FE95B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_217FF207C(0, &qword_267BBACB0);
  uint64_t v2 = sub_218038764();
  uint64_t v3 = sub_218038764();
  uint64_t v4 = *(uint64_t **)(*(void *)(v1 + 64) + 40);
  uint64_t *v4 = v2;
  v4[1] = v3;

  return MEMORY[0x270FA2400](v1);
}

uint64_t sub_217FE97D0(void *a1, void *aBlock, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_217FE98AC;
  v7[17] = v6;
  v7[18] = a3;
  return MEMORY[0x270FA2498](sub_217FE9198, 0, 0);
}

uint64_t sub_217FE98AC()
{
  uint64_t v1 = *(void (***)(void, void, void))(*v0 + 32);
  uint64_t v2 = *(void **)(*v0 + 16);
  uint64_t v7 = *v0;
  swift_task_dealloc();
  swift_release();

  sub_217FF207C(0, &qword_267BBACB0);
  uint64_t v3 = (void *)sub_218038754();
  uint64_t v4 = (void *)sub_218038754();
  ((void (**)(void, void *, void *))v1)[2](v1, v3, v4);

  _Block_release(v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_217FE9A74(uint64_t a1, uint64_t a2)
{
  v3[16] = a2;
  v3[17] = v2;
  v3[15] = a1;
  return MEMORY[0x270FA2498](sub_217FE9A98, 0, 0);
}

uint64_t sub_217FE9A98()
{
  os_log_type_t v13 = v0;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2180381D4();
  __swift_project_value_buffer(v1, (uint64_t)qword_267BB9830);
  uint64_t v2 = sub_2180381B4();
  os_log_type_t v3 = sub_2180388E4();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v12 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[10] = sub_217FE6C68(0xD000000000000025, 0x8000000218051840, &v12);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v5, -1, -1);
    MEMORY[0x21D460050](v4, -1, -1);
  }

  uint64_t v6 = v0[17];
  swift_getKeyPath();
  v0[10] = v6;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t v7 = MEMORY[0x21D460130](v6 + 16);
  v0[18] = v7;
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = sub_2180385F4();
    v0[19] = v9;
    v0[2] = v0;
    v0[3] = sub_217FE9D70;
    uint64_t v10 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_217FE9EB4;
    v0[13] = &block_descriptor_6;
    v0[14] = v10;
    objc_msgSend(v8, sel_toolbarButtonPressedWithIdentifier_completionHandler_, v9, v0 + 10);
    uint64_t v7 = (uint64_t)(v0 + 2);
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA23F0](v7);
}

uint64_t sub_217FE9D70()
{
  return MEMORY[0x270FA2498](sub_217FE9E50, 0, 0);
}

uint64_t sub_217FE9E50()
{
  uint64_t v1 = *(void **)(v0 + 152);
  swift_unknownObjectRelease();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_217FE9EB4(uint64_t a1)
{
  return MEMORY[0x270FA2400](*(void *)(a1 + 32));
}

uint64_t sub_217FEA03C(int a1, void *aBlock, uint64_t a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v5 = sub_218038624();
  uint64_t v7 = v6;
  v3[4] = v6;
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_217FEA128;
  v8[16] = v7;
  v8[17] = a3;
  v8[15] = v5;
  return MEMORY[0x270FA2498](sub_217FE9A98, 0, 0);
}

uint64_t sub_217FEA128()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 24);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  v1[2](v1);
  _Block_release(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t sub_217FEA288()
{
  *(void *)(v1 + 120) = v0;
  return MEMORY[0x270FA2498](sub_217FEA2A8, 0, 0);
}

uint64_t sub_217FEA2A8()
{
  uint64_t v12 = v0;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2180381D4();
  __swift_project_value_buffer(v1, (uint64_t)qword_267BB9830);
  uint64_t v2 = sub_2180381B4();
  os_log_type_t v3 = sub_2180388E4();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v11 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[10] = sub_217FE6C68(0xD00000000000001BLL, 0x8000000218051870, &v11);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v5, -1, -1);
    MEMORY[0x21D460050](v4, -1, -1);
  }

  uint64_t v6 = v0[15];
  swift_getKeyPath();
  v0[10] = v6;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t v7 = MEMORY[0x21D460130](v6 + 16);
  v0[16] = v7;
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v0[2] = v0;
    v0[7] = v0 + 17;
    v0[3] = sub_217FEA574;
    uint64_t v9 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_217FEA6BC;
    v0[13] = &block_descriptor_7;
    v0[14] = v9;
    objc_msgSend(v8, sel_shouldDisplayLockActivityWithCompletionHandler_, v0 + 10);
    uint64_t v7 = (uint64_t)(v0 + 2);
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA23F0](v7);
}

uint64_t sub_217FEA574()
{
  return MEMORY[0x270FA2498](sub_217FEA654, 0, 0);
}

uint64_t sub_217FEA654()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 136);
  swift_unknownObjectRelease();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_217FEA6BC(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  **(unsigned char **)(*(void *)(v2 + 64) + 40) = a2;
  return MEMORY[0x270FA2400](v2);
}

uint64_t sub_217FEA84C(const void *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_217FEA910;
  v4[15] = a2;
  return MEMORY[0x270FA2498](sub_217FEA2A8, 0, 0);
}

uint64_t sub_217FEA910(char a1)
{
  os_log_type_t v3 = *(void (***)(void, void))(*v1 + 24);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  swift_release();
  v3[2](v3, a1 & 1);
  _Block_release(v3);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

void *sub_217FEAA5C()
{
  return sub_217FEDFF4(0xD00000000000001BLL, 0x8000000218051890, (SEL *)&selRef_requestLockForCurrentItem);
}

uint64_t sub_217FEAA98(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = swift_retain();
  a3(v4);

  return swift_release();
}

uint64_t sub_217FEAADC()
{
  *(void *)(v1 + 12_Block_object_dispose(&STACK[0x360], 8) = v0;
  return MEMORY[0x270FA2498](sub_217FEAAFC, 0, 0);
}

uint64_t sub_217FEAAFC()
{
  uint64_t v12 = v0;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2180381D4();
  __swift_project_value_buffer(v1, (uint64_t)qword_267BB9830);
  uint64_t v2 = sub_2180381B4();
  os_log_type_t v3 = sub_2180388E4();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v11 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[10] = sub_217FE6C68(0x616D6D6F4379656BLL, 0xED0000292873646ELL, &v11);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v5, -1, -1);
    MEMORY[0x21D460050](v4, -1, -1);
  }

  uint64_t v6 = v0[16];
  swift_getKeyPath();
  v0[10] = v6;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t v7 = MEMORY[0x21D460130](v6 + 16);
  v0[17] = v7;
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_217FEADD0;
    uint64_t v9 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_217FEAF18;
    v0[13] = &block_descriptor_8;
    v0[14] = v9;
    objc_msgSend(v8, sel_keyCommandsWithCompletionHandler_, v0 + 10);
    uint64_t v7 = (uint64_t)(v0 + 2);
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA23F0](v7);
}

uint64_t sub_217FEADD0()
{
  return MEMORY[0x270FA2498](sub_217FEAEB0, 0, 0);
}

uint64_t sub_217FEAEB0()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_unknownObjectRelease();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_217FEAF18(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_217FF207C(0, &qword_267BBAC40);
  **(void **)(*(void *)(v1 + 64) + 40) = sub_218038764();

  return MEMORY[0x270FA2400](v1);
}

uint64_t sub_217FEB0FC(const void *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_217FEB1C0;
  v4[16] = a2;
  return MEMORY[0x270FA2498](sub_217FEAAFC, 0, 0);
}

uint64_t sub_217FEB1C0()
{
  uint64_t v1 = *(void (***)(void, void))(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  swift_release();
  sub_217FF207C(0, &qword_267BBAC40);
  uint64_t v2 = (void *)sub_218038754();
  swift_bridgeObjectRelease();
  ((void (**)(void, void *))v1)[2](v1, v2);

  _Block_release(v1);
  os_log_type_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

void *sub_217FEB340(uint64_t a1)
{
  return sub_217FEB428(a1, 0xD00000000000001ALL, 0x80000002180518D0, (SEL *)&selRef_keyCommandWasPerformed_);
}

void *sub_217FEB37C(uint64_t a1, char a2)
{
  return sub_217FED394(a1, a2, 0xD00000000000001ALL, 0x80000002180518F0, (SEL *)&selRef_setAppearance_animated_);
}

void *sub_217FEB404(uint64_t a1)
{
  return sub_217FEB428(a1, 0xD000000000000020, 0x8000000218051910, (SEL *)&selRef_notifyFirstTimeAppearanceWithActions_);
}

void *sub_217FEB428(uint64_t a1, uint64_t a2, unint64_t a3, SEL *a4)
{
  uint64_t v8 = v4;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_2180381D4();
  __swift_project_value_buffer(v10, (uint64_t)qword_267BB9830);
  uint64_t v11 = sub_2180381B4();
  os_log_type_t v12 = sub_2180388E4();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v18 = a4;
    uint64_t v13 = a1;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v19 = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    sub_217FE6C68(a2, a3, &v19);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v11, v12, "Service side: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v15, -1, -1);
    uint64_t v16 = v14;
    a1 = v13;
    a4 = v18;
    MEMORY[0x21D460050](v16, -1, -1);
  }

  swift_getKeyPath();
  uint64_t v19 = v8;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t result = (void *)MEMORY[0x21D460130](v8 + 16);
  if (result)
  {
    objc_msgSend(result, *a4, a1);
    return (void *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_217FEB698(void *a1)
{
  uint64_t v2 = v1;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2180381D4();
  __swift_project_value_buffer(v4, (uint64_t)qword_267BB9830);
  uint64_t v5 = sub_2180381B4();
  os_log_type_t v6 = sub_2180388E4();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v12 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v11 = sub_217FE6C68(0xD000000000000022, 0x8000000218051940, &v12);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v5, v6, "Service side: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v8, -1, -1);
    MEMORY[0x21D460050](v7, -1, -1);
  }

  swift_getKeyPath();
  uint64_t v12 = v2;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t result = MEMORY[0x21D460130](v2 + 16);
  if (result)
  {
    uint64_t v10 = (void *)result;
    if (a1) {
      a1 = (void *)sub_2180385A4();
    }
    objc_msgSend(v10, sel_notifyStateRestorationUserInfo_, a1, v11);

    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_217FEB96C(void *a1, uint64_t a2)
{
  return sub_217FED674(a1, a2, 0xD00000000000002ELL, 0x8000000218051970, (SEL *)&selRef_previewItemDisplayState_wasAppliedToItemAtIndex_);
}

uint64_t sub_217FEB9A8(uint64_t a1, uint64_t a2, char a3, char a4)
{
  *(void *)(v5 + 12_Block_object_dispose(&STACK[0x360], 8) = a2;
  *(void *)(v5 + 136) = v4;
  *(unsigned char *)(v5 + 153) = a4;
  *(unsigned char *)(v5 + 152) = a3;
  *(void *)(v5 + 120) = a1;
  return MEMORY[0x270FA2498](sub_217FEB9D4, 0, 0);
}

uint64_t sub_217FEB9D4()
{
  uint64_t v16 = v0;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2180381D4();
  __swift_project_value_buffer(v1, (uint64_t)qword_267BB9830);
  uint64_t v2 = sub_2180381B4();
  os_log_type_t v3 = sub_2180388E4();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v15 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v0 + 80) = sub_217FE6C68(0xD000000000000061, 0x80000002180519A0, &v15);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v5, -1, -1);
    MEMORY[0x21D460050](v4, -1, -1);
  }

  uint64_t v6 = *(void *)(v0 + 136);
  swift_getKeyPath();
  *(void *)(v0 + 80) = v6;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t v7 = MEMORY[0x21D460130](v6 + 16);
  *(void *)(v0 + 144) = v7;
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = *(unsigned __int8 *)(v0 + 153);
    uint64_t v10 = *(unsigned __int8 *)(v0 + 152);
    uint64_t v12 = *(void *)(v0 + 120);
    uint64_t v11 = *(void *)(v0 + 128);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_217FEBCB4;
    uint64_t v13 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 8_Block_object_dispose(&STACK[0x360], 8) = 0x40000000;
    *(void *)(v0 + 96) = sub_217FE9EB4;
    *(void *)(v0 + 104) = &block_descriptor_9;
    *(void *)(v0 + 112) = v13;
    objc_msgSend(v8, sel_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler_, v12, v11, v10, v9, v0 + 80);
    uint64_t v7 = v0 + 16;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA23F0](v7);
}

uint64_t sub_217FEBCB4()
{
  return MEMORY[0x270FA2498](sub_217FEBD94, 0, 0);
}

uint64_t sub_217FEBD94()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_217FEBF98(void *a1, uint64_t a2, char a3, char a4, void *aBlock, uint64_t a6)
{
  v6[3] = a2;
  v6[4] = a6;
  v6[2] = a1;
  v6[5] = _Block_copy(aBlock);
  id v12 = a1;
  swift_unknownObjectRetain();
  swift_retain();
  uint64_t v13 = swift_task_alloc();
  v6[6] = v13;
  *(void *)uint64_t v13 = v6;
  *(void *)(v13 + _Block_object_dispose(&STACK[0x360], 8) = sub_217FEC0A0;
  *(void *)(v13 + 12_Block_object_dispose(&STACK[0x360], 8) = a2;
  *(void *)(v13 + 136) = a6;
  *(unsigned char *)(v13 + 153) = a4;
  *(unsigned char *)(v13 + 152) = a3;
  *(void *)(v13 + 120) = v12;
  return MEMORY[0x270FA2498](sub_217FEB9D4, 0, 0);
}

uint64_t sub_217FEC0A0()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 40);
  uint64_t v2 = *(void **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_unknownObjectRelease();

  v1[2](v1);
  _Block_release(v1);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

void *sub_217FEC218(char a1)
{
  return sub_217FEEB84(a1, 0xD000000000000016, 0x8000000218051A10, (SEL *)&selRef_tearDownTransition_);
}

uint64_t sub_217FEC254(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_retain();
  a4(a3);

  return swift_release();
}

uint64_t sub_217FEC2AC(uint64_t a1, uint64_t a2)
{
  return sub_217FEC384(a1, a2, 0x6964616F4C746573, 0xEE00293A5F28676ELL, (SEL *)&selRef_setLoadingString_);
}

uint64_t sub_217FEC2F0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = sub_218038624();
  uint64_t v7 = v6;
  swift_retain();
  a4(v5, v7);
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_217FEC360(uint64_t a1, uint64_t a2)
{
  return sub_217FEC384(a1, a2, 0xD00000000000003BLL, 0x8000000218051A30, (SEL *)&selRef_overrideParentApplicationDisplayIdentifierWithIdentifier_);
}

uint64_t sub_217FEC384(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, SEL *a5)
{
  uint64_t v9 = v5;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_2180381D4();
  __swift_project_value_buffer(v10, (uint64_t)qword_267BB9830);
  uint64_t v11 = sub_2180381B4();
  os_log_type_t v12 = sub_2180388E4();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = a3;
    unint64_t v14 = a4;
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v20 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    sub_217FE6C68(v13, v14, &v20);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v11, v12, "Service side: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v16, -1, -1);
    MEMORY[0x21D460050](v15, -1, -1);
  }

  swift_getKeyPath();
  uint64_t v20 = v9;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t result = MEMORY[0x21D460130](v9 + 16);
  if (result)
  {
    uint64_t v18 = (void *)result;
    uint64_t v19 = (void *)sub_2180385F4();
    objc_msgSend(v18, *a5, v19);

    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_217FEC5EC()
{
  *(void *)(v1 + 120) = v0;
  return MEMORY[0x270FA2498](sub_217FEC60C, 0, 0);
}

uint64_t sub_217FEC60C()
{
  os_log_type_t v12 = v0;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2180381D4();
  __swift_project_value_buffer(v1, (uint64_t)qword_267BB9830);
  uint64_t v2 = sub_2180381B4();
  os_log_type_t v3 = sub_2180388E4();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v11 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[10] = sub_217FE6C68(0xD000000000000029, 0x8000000218051A70, &v11);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v5, -1, -1);
    MEMORY[0x21D460050](v4, -1, -1);
  }

  uint64_t v6 = v0[15];
  swift_getKeyPath();
  v0[10] = v6;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t v7 = MEMORY[0x21D460130](v6 + 16);
  v0[16] = v7;
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v0[2] = v0;
    v0[3] = sub_217FEC8D0;
    uint64_t v9 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_217FE9EB4;
    v0[13] = &block_descriptor_10;
    v0[14] = v9;
    objc_msgSend(v8, sel_preparePreviewCollectionForInvalidationWithCompletionHandler_, v0 + 10);
    uint64_t v7 = (uint64_t)(v0 + 2);
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA23F0](v7);
}

uint64_t sub_217FEC8D0()
{
  return MEMORY[0x270FA2498](sub_217FF2268, 0, 0);
}

uint64_t sub_217FECB1C(const void *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_217FF2250;
  v4[15] = a2;
  return MEMORY[0x270FA2498](sub_217FEC60C, 0, 0);
}

uint64_t sub_217FECBE0()
{
  *(void *)(v1 + 120) = v0;
  return MEMORY[0x270FA2498](sub_217FECC00, 0, 0);
}

uint64_t sub_217FECC00()
{
  os_log_type_t v12 = v0;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2180381D4();
  __swift_project_value_buffer(v1, (uint64_t)qword_267BB9830);
  uint64_t v2 = sub_2180381B4();
  os_log_type_t v3 = sub_2180388E4();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v11 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[10] = sub_217FE6C68(0xD000000000000013, 0x8000000218051AA0, &v11);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v5, -1, -1);
    MEMORY[0x21D460050](v4, -1, -1);
  }

  uint64_t v6 = v0[15];
  swift_getKeyPath();
  v0[10] = v6;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t v7 = MEMORY[0x21D460130](v6 + 16);
  v0[16] = v7;
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v0[2] = v0;
    v0[3] = sub_217FECEC4;
    uint64_t v9 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_217FE9EB4;
    v0[13] = &block_descriptor_11;
    v0[14] = v9;
    objc_msgSend(v8, sel_invalidateServiceWithCompletionHandler_, v0 + 10);
    uint64_t v7 = (uint64_t)(v0 + 2);
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA23F0](v7);
}

uint64_t sub_217FECEC4()
{
  return MEMORY[0x270FA2498](sub_217FECFA4, 0, 0);
}

uint64_t sub_217FECFA4()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_217FED170(const void *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_217FED234;
  v4[15] = a2;
  return MEMORY[0x270FA2498](sub_217FECC00, 0, 0);
}

uint64_t sub_217FED234()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 24);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  swift_release();
  v1[2](v1);
  _Block_release(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

void *sub_217FED370(uint64_t a1, char a2)
{
  return sub_217FED394(a1, a2, 0xD000000000000029, 0x8000000218051AC0, (SEL *)&selRef_hostViewControlerTransitionToState_animated_);
}

void *sub_217FED394(uint64_t a1, char a2, uint64_t a3, unint64_t a4, SEL *a5)
{
  uint64_t v9 = v5;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_2180381D4();
  __swift_project_value_buffer(v12, (uint64_t)qword_267BB9830);
  uint64_t v13 = sub_2180381B4();
  os_log_type_t v14 = sub_2180388E4();
  if (os_log_type_enabled(v13, v14))
  {
    char v20 = a2;
    uint64_t v15 = a3;
    unint64_t v16 = a4;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v21 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    sub_217FE6C68(v15, v16, &v21);
    a2 = v20;
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v13, v14, "Service side: %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v18, -1, -1);
    MEMORY[0x21D460050](v17, -1, -1);
  }

  swift_getKeyPath();
  uint64_t v21 = v9;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t result = (void *)MEMORY[0x21D460130](v9 + 16);
  if (result)
  {
    objc_msgSend(result, *a5, a1, a2 & 1);
    return (void *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_217FED5F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  swift_retain();
  a5(a3, a4);

  return swift_release();
}

uint64_t sub_217FED650(void *a1, uint64_t a2)
{
  return sub_217FED674(a1, a2, 0xD000000000000027, 0x8000000218051AF0, (SEL *)&selRef_setPreviewItemDisplayState_onItemAtIndex_);
}

uint64_t sub_217FED674(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, SEL *a5)
{
  uint64_t v9 = v5;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_2180381D4();
  __swift_project_value_buffer(v12, (uint64_t)qword_267BB9830);
  uint64_t v13 = sub_2180381B4();
  os_log_type_t v14 = sub_2180388E4();
  if (os_log_type_enabled(v13, v14))
  {
    id v22 = a5;
    uint64_t v15 = a1;
    unint64_t v16 = a4;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v23 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    unint64_t v19 = v16;
    a1 = v15;
    sub_217FE6C68(a3, v19, &v23);
    a5 = v22;
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v13, v14, "Service side: %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v18, -1, -1);
    MEMORY[0x21D460050](v17, -1, -1);
  }

  swift_getKeyPath();
  uint64_t v23 = v9;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t result = MEMORY[0x21D460130](v9 + 16);
  if (result)
  {
    uint64_t v21 = (void *)result;
    __swift_project_boxed_opaque_existential_0(a1, a1[3]);
    objc_msgSend(v21, *a5, sub_218038BA4(), a2);
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_217FED8EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(unsigned char *, uint64_t))
{
  swift_unknownObjectRetain();
  swift_retain();
  sub_2180389F4();
  swift_unknownObjectRelease();
  a5(v8, a4);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
}

uint64_t sub_217FED970()
{
  *(void *)(v1 + 120) = v0;
  return MEMORY[0x270FA2498](sub_217FED990, 0, 0);
}

uint64_t sub_217FED990()
{
  uint64_t v12 = v0;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2180381D4();
  __swift_project_value_buffer(v1, (uint64_t)qword_267BB9830);
  uint64_t v2 = sub_2180381B4();
  os_log_type_t v3 = sub_2180388E4();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v11 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[10] = sub_217FE6C68(0xD000000000000023, 0x8000000218051B20, &v11);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v5, -1, -1);
    MEMORY[0x21D460050](v4, -1, -1);
  }

  uint64_t v6 = v0[15];
  swift_getKeyPath();
  v0[10] = v6;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t v7 = MEMORY[0x21D460130](v6 + 16);
  v0[16] = v7;
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v0[2] = v0;
    v0[3] = sub_217FEC8D0;
    uint64_t v9 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_217FE9EB4;
    v0[13] = &block_descriptor_12;
    v0[14] = v9;
    objc_msgSend(v8, sel_prepareForActionSheetPresentationWithCompletionHandler_, v0 + 10);
    uint64_t v7 = (uint64_t)(v0 + 2);
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA23F0](v7);
}

uint64_t sub_217FEDDC0(const void *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_217FEDE84;
  v4[15] = a2;
  return MEMORY[0x270FA2498](sub_217FED990, 0, 0);
}

uint64_t sub_217FEDE84()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 24);
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  if (v2)
  {
    uint64_t v4 = *(void (***)(void))(v1 + 24);
    v4[2](v4);
    _Block_release(v4);
  }
  uint64_t v5 = *(uint64_t (**)(void))(v3 + 8);
  return v5();
}

void *sub_217FEDFD0()
{
  return sub_217FEDFF4(0xD000000000000017, 0x8000000218051B50, (SEL *)&selRef_actionSheetDidDismiss);
}

void *sub_217FEDFF4(uint64_t a1, unint64_t a2, SEL *a3)
{
  uint64_t v7 = v3;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_2180381D4();
  __swift_project_value_buffer(v8, (uint64_t)qword_267BB9830);
  uint64_t v9 = sub_2180381B4();
  os_log_type_t v10 = sub_2180388E4();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v14 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    sub_217FE6C68(a1, a2, &v14);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v9, v10, "Service side: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v12, -1, -1);
    MEMORY[0x21D460050](v11, -1, -1);
  }

  swift_getKeyPath();
  uint64_t v14 = v7;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t result = (void *)MEMORY[0x21D460130](v7 + 16);
  if (result)
  {
    [result *a3];
    return (void *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_217FEE220()
{
  uint64_t v1 = v0;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2180381D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BB9830);
  uint64_t v3 = sub_2180381B4();
  os_log_type_t v4 = sub_2180388E4();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v9 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_217FE6C68(0xD00000000000001DLL, 0x8000000218051B70, &v9);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v3, v4, "Service side: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v6, -1, -1);
    MEMORY[0x21D460050](v5, -1, -1);
  }

  swift_getKeyPath();
  uint64_t v9 = v1;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t result = (void *)MEMORY[0x21D460130](v1 + 16);
  if (result)
  {
    uint64_t v8 = result;
    if (objc_msgSend(result, sel_respondsToSelector_, sel_documentMenuActionWillBegin)) {
      objc_msgSend(v8, sel_documentMenuActionWillBegin);
    }
    return (void *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_217FEE464(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2180381D4();
  __swift_project_value_buffer(v4, (uint64_t)qword_267BB9830);
  uint64_t v5 = sub_2180381B4();
  os_log_type_t v6 = sub_2180388E4();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v11 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    sub_217FE6C68(0xD00000000000002CLL, 0x8000000218051B90, &v11);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v5, v6, "Service side: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v8, -1, -1);
    MEMORY[0x21D460050](v7, -1, -1);
  }

  swift_getKeyPath();
  uint64_t v11 = v2;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t result = (void *)MEMORY[0x21D460130](v2 + 16);
  if (result)
  {
    os_log_type_t v10 = result;
    if (objc_msgSend(result, sel_respondsToSelector_, sel_hostViewControllerBackgroundColorChanged_)) {
      objc_msgSend(v10, sel_hostViewControllerBackgroundColorChanged_, a1);
    }
    return (void *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_217FEE6B0(uint64_t a1, uint64_t a2, void *a3, void (*a4)(id))
{
  id v5 = a3;
  swift_retain();
  a4(v5);
  swift_release();
}

void *sub_217FEE714(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_2180381D4();
  __swift_project_value_buffer(v10, (uint64_t)qword_267BB9830);
  uint64_t v11 = sub_2180381B4();
  os_log_type_t v12 = sub_2180388E4();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v20 = a4;
    uint64_t v13 = a1;
    uint64_t v14 = a2;
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    aBlock[0] = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v21 = sub_217FE6C68(0xD000000000000042, 0x8000000218051BE0, aBlock);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v11, v12, "Service side: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v16, -1, -1);
    uint64_t v17 = v15;
    a2 = v14;
    a1 = v13;
    a4 = v20;
    MEMORY[0x21D460050](v17, -1, -1);
  }

  swift_getKeyPath();
  aBlock[0] = v5;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t result = (void *)MEMORY[0x21D460130](v5 + 16);
  if (result)
  {
    unint64_t v19 = result;
    if (objc_msgSend(result, sel_respondsToSelector_, sel_saveIntoPhotoLibraryMediaWithURLWrapper_previewItemType_completionHandler_))
    {
      if (a3)
      {
        aBlock[4] = (uint64_t)a3;
        aBlock[5] = a4;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_217FEEA14;
        aBlock[3] = (uint64_t)&block_descriptor_13;
        a3 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
      }
      objc_msgSend(v19, sel_saveIntoPhotoLibraryMediaWithURLWrapper_previewItemType_completionHandler_, a1, a2, a3, v20, v21);
      _Block_release(a3);
      return (void *)swift_unknownObjectRelease();
    }
    else
    {
      uint64_t result = (void *)swift_unknownObjectRelease();
      if (a3) {
        return (void *)((uint64_t (*)(void, void))a3)(0, 0);
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_217FEEA14(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void *sub_217FEEB60(char a1)
{
  return sub_217FEEB84(a1, 0xD000000000000017, 0x8000000218051C30, (SEL *)&selRef_setIsContentManaged_);
}

void *sub_217FEEB84(char a1, uint64_t a2, unint64_t a3, SEL *a4)
{
  uint64_t v8 = v4;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_2180381D4();
  __swift_project_value_buffer(v10, (uint64_t)qword_267BB9830);
  uint64_t v11 = sub_2180381B4();
  os_log_type_t v12 = sub_2180388E4();
  if (os_log_type_enabled(v11, v12))
  {
    char v18 = a1;
    uint64_t v13 = a4;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v19 = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    sub_217FE6C68(a2, a3, &v19);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v11, v12, "Service side: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v15, -1, -1);
    uint64_t v16 = v14;
    a4 = v13;
    a1 = v18;
    MEMORY[0x21D460050](v16, -1, -1);
  }

  swift_getKeyPath();
  uint64_t v19 = v8;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t result = (void *)MEMORY[0x21D460130](v8 + 16);
  if (result)
  {
    objc_msgSend(result, *a4, a1 & 1);
    return (void *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_217FEEDC8(char a1)
{
  *(void *)(v2 + 136) = v1;
  *(unsigned char *)(v2 + 152) = a1;
  return MEMORY[0x270FA2498](sub_217FEEDEC, 0, 0);
}

uint64_t sub_217FEEDEC()
{
  uint64_t v13 = v0;
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2180381D4();
  __swift_project_value_buffer(v1, (uint64_t)qword_267BB9830);
  uint64_t v2 = sub_2180381B4();
  os_log_type_t v3 = sub_2180388E4();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v12 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v0 + 80) = sub_217FE6C68(0xD000000000000028, 0x8000000218051C80, &v12);
    sub_2180389D4();
    _os_log_impl(&dword_217F61000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v5, -1, -1);
    MEMORY[0x21D460050](v4, -1, -1);
  }

  uint64_t v6 = *(void *)(v0 + 136);
  swift_getKeyPath();
  *(void *)(v0 + 80) = v6;
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t v7 = MEMORY[0x21D460130](v6 + 16);
  *(void *)(v0 + 144) = v7;
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = *(unsigned __int8 *)(v0 + 152);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_217FEF0C0;
    uint64_t v10 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 8_Block_object_dispose(&STACK[0x360], 8) = 0x40000000;
    *(void *)(v0 + 96) = sub_217FEF20C;
    *(void *)(v0 + 104) = &block_descriptor_14;
    *(void *)(v0 + 112) = v10;
    objc_msgSend(v8, sel_saveCurrentPreviewEditsSynchronously_withCompletionHandler_, v9, v0 + 80);
    uint64_t v7 = v0 + 16;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA23F0](v7);
}

uint64_t sub_217FEF0C0()
{
  return MEMORY[0x270FA2498](sub_217FEF1A0, 0, 0);
}

uint64_t sub_217FEF1A0()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  swift_unknownObjectRelease();
  os_log_type_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v2, v1);
}

uint64_t sub_217FEF20C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(*(void *)(v3 + 64) + 40);
  void *v4 = a2;
  v4[1] = a3;
  id v5 = a3;

  return MEMORY[0x270FA2400](v3);
}

uint64_t sub_217FEF3DC(char a1, void *aBlock, uint64_t a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  swift_retain();
  uint64_t v6 = swift_task_alloc();
  v3[4] = v6;
  *(void *)uint64_t v6 = v3;
  *(void *)(v6 + _Block_object_dispose(&STACK[0x360], 8) = sub_217FEF4B4;
  *(void *)(v6 + 136) = a3;
  *(unsigned char *)(v6 + 152) = a1;
  return MEMORY[0x270FA2498](sub_217FEEDEC, 0, 0);
}

uint64_t sub_217FEF4B4(uint64_t a1, void *a2)
{
  id v5 = *(void (***)(void, void, void))(*v2 + 24);
  uint64_t v8 = *v2;
  swift_task_dealloc();
  swift_release();
  ((void (**)(void, uint64_t, void *))v5)[2](v5, a1, a2);
  _Block_release(v5);

  uint64_t v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

uint64_t QLAppExtensionSceneProxy.deinit()
{
  sub_217FF0268(v0 + 16);
  swift_unknownObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC9QuickLook24QLAppExtensionSceneProxy___observationRegistrar;
  uint64_t v2 = sub_218037E64();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t QLAppExtensionSceneProxy.__deallocating_deinit()
{
  sub_217FF0268(v0 + 16);
  swift_unknownObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC9QuickLook24QLAppExtensionSceneProxy___observationRegistrar;
  uint64_t v2 = sub_218037E64();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

void QLAppExtensionSceneProxy.getPreviewCollectionUUIDWithCompletionHandler(completionHandler:)(void (*a1)(id))
{
  swift_getKeyPath();
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t v3 = (void *)MEMORY[0x21D460130](v1 + 16);
  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_uuid);
    swift_unknownObjectRelease();
    a1(v4);
  }
  else
  {
    __break(1u);
  }
}

void QLAppExtensionSceneProxy.setNotificationCenter(_:)(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_sharedInstance);
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v2, sel_setRemoteNotificationCenter_, a1);
  }
}

void QLAppExtensionSceneProxy.getNetworkObserverWithCompletionBlock(_:)(void (*a1)(void))
{
  id v2 = objc_msgSend(self, sel_sharedInstance);
  a1();
}

uint64_t QLAppExtensionSceneProxy.preparePreviewCollectionForInvalidationWithCompletionHandler(completionHandler:)(uint64_t a1, uint64_t a2)
{
  swift_getKeyPath();
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t result = MEMORY[0x21D460130](v2 + 16);
  if (result)
  {
    uint64_t v6 = (void *)result;
    v8[4] = a1;
    v8[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1107296256;
    v8[2] = sub_217FEFC38;
    v8[3] = &block_descriptor_17;
    uint64_t v7 = _Block_copy(v8);
    swift_retain();
    swift_release();
    objc_msgSend(v6, sel_preparePreviewCollectionForInvalidationWithCompletionHandler_, v7);
    _Block_release(v7);
    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_217FEFC38(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_217FEFD0C()
{
  swift_getKeyPath();
  sub_217FF0298(&qword_267BB9528, (void (*)(uint64_t))type metadata accessor for QLAccessoryAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  return MEMORY[0x21D460130](v0 + 16);
}

uint64_t sub_217FEFDB0()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t QLAccessoryAppExtensionSceneProxy.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_218037E54();
  return v0;
}

uint64_t QLAccessoryAppExtensionSceneProxy.init()()
{
  swift_unknownObjectWeakInit();
  sub_218037E54();
  return v0;
}

void sub_217FEFE50(void *a1)
{
  swift_getKeyPath();
  sub_217FF0298(&qword_267BB9528, (void (*)(uint64_t))type metadata accessor for QLAccessoryAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t v3 = MEMORY[0x21D460130](v1 + 16);
  if (v3)
  {
    id v4 = (void *)v3;
    if (qword_267BB94B8 != -1) {
      swift_once();
    }
    id v5 = objc_msgSend((id)qword_267BB9848, sel_objectForKey_, a1);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = objc_msgSend(v4, sel_view);
      objc_msgSend(v6, sel_setRemoteAccessoryContainer_, v7);

      goto LABEL_12;
    }
  }
  if (qword_267BB94B0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_2180381D4();
  __swift_project_value_buffer(v8, (uint64_t)qword_267BB9830);
  uint64_t v9 = a1;
  uint64_t v7 = sub_2180381B4();
  os_log_type_t v10 = sub_2180388F4();
  if (os_log_type_enabled(v7, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 138412290;
    uint64_t v13 = v9;
    sub_2180389D4();
    *uint64_t v12 = v9;

    _os_log_impl(&dword_217F61000, v7, v10, "Cannot configure accessory view container, no preview collection with UUID %@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v12, -1, -1);
    MEMORY[0x21D460050](v11, -1, -1);
  }
  else
  {

    uint64_t v7 = v9;
  }
LABEL_12:
}

uint64_t QLAccessoryAppExtensionSceneProxy.deinit()
{
  swift_unknownObjectWeakDestroy();
  uint64_t v1 = v0 + OBJC_IVAR____TtC9QuickLook33QLAccessoryAppExtensionSceneProxy___observationRegistrar;
  uint64_t v2 = sub_218037E64();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t QLAccessoryAppExtensionSceneProxy.__deallocating_deinit()
{
  swift_unknownObjectWeakDestroy();
  uint64_t v1 = v0 + OBJC_IVAR____TtC9QuickLook33QLAccessoryAppExtensionSceneProxy___observationRegistrar;
  uint64_t v2 = sub_218037E64();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_217FF0268(uint64_t a1)
{
  return a1;
}

uint64_t sub_217FF0298(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for QLAccessoryAppExtensionSceneProxy(uint64_t a1)
{
  return sub_217FF0300(a1, (uint64_t *)&unk_267BB9918);
}

uint64_t sub_217FF0300(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_217FF0338()
{
  return type metadata accessor for QLAppExtensionSceneProxy(0);
}

uint64_t sub_217FF0340()
{
  uint64_t result = sub_218037E64();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for QLAppExtensionSceneProxy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for QLAppExtensionSceneProxy);
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.crash(reply:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.setAllowInteractiveTransitions(_:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 216) + **(int **)(*(void *)v1 + 216));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_217FF2264;
  return v6(a1);
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.setHostApplicationBundleIdentifier(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.configure(withNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.configure(withNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.setCurrentPreviewItemIndex(_:animated:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.hostApplicationDidEnterBackground(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.hostApplicationDidBecomeActive()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.toolbarButtons(for:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 272) + **(int **)(*(void *)v1 + 272));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_217FF072C;
  return v6(a1);
}

uint64_t sub_217FF072C(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.toolbarButtonPressed(withIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 280) + **(int **)(*(void *)v2 + 280));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_217FF2264;
  return v8(a1, a2);
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.shouldDisplayLockActivity()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 288) + **(int **)(*(void *)v0 + 288));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_217FF0A40;
  return v4();
}

uint64_t sub_217FF0A40(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.requestLockForCurrentItem()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.keyCommands()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 304) + **(int **)(*(void *)v0 + 304));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_217FF0A40;
  return v4();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.keyCommandWasPerformed(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.setAppearance(_:animated:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.notifyFirstTimeAppearance(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.notifyStateRestorationUserInfo(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.previewItemDisplayState(_:wasAppliedToItemAt:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.startTransition(withSourceViewProvider:transitionController:presenting:useInteractiveTransition:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 352)
                                                                   + **(int **)(*(void *)v4 + 352));
  os_log_type_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *os_log_type_t v10 = v5;
  v10[1] = sub_217FF2264;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.tearDownTransition(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.setLoading(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.overrideParentApplicationDisplayIdentifier(withIdentifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.preparePreviewCollectionForInvalidation()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 384) + **(int **)(*(void *)v0 + 384));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_217FF2264;
  return v4();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.invalidateService()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 392) + **(int **)(*(void *)v0 + 392));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_217FF2264;
  return v4();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.hostViewControlerTransition(to:animated:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.setPreviewItemDisplayState(_:onItemAt:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.prepareForActionSheetPresentation()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 416) + **(int **)(*(void *)v0 + 416));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_217FF2264;
  return v4();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.actionSheetDidDismiss()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.documentMenuActionWillBegin()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.hostViewControllerBackgroundColorChanged(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.saveIntoPhotoLibraryMedia(with:previewItemType:completionHandler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.setIsContentManaged(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.saveCurrentPreviewEditsSynchronously(_:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 464) + **(int **)(*(void *)v1 + 464));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_217FF2260;
  return v6(a1);
}

uint64_t sub_217FF1424()
{
  return type metadata accessor for QLAccessoryAppExtensionSceneProxy(0);
}

uint64_t sub_217FF142C()
{
  uint64_t result = sub_218037E64();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for QLAccessoryAppExtensionSceneProxy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for QLAccessoryAppExtensionSceneProxy);
}

uint64_t dispatch thunk of QLAccessoryAppExtensionSceneProxy.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of QLAccessoryAppExtensionSceneProxy.configureAsAccessoryViewContainerForPreviewCollection(previewCollectionUUID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t sub_217FF1518()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_217FF1550()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_217FF1560(uint64_t a1, void (**a2)(void, void))
{
  swift_getKeyPath();
  sub_217FF0298(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
  sub_218037E24();
  swift_release();
  uint64_t v4 = (void *)MEMORY[0x21D460130](a1 + 16);
  if (v4)
  {
    id v5 = objc_msgSend(v4, sel_uuid);
    swift_unknownObjectRelease();
    ((void (**)(void, id))a2)[2](a2, v5);
  }
  else
  {
    _Block_release(a2);
    __break(1u);
  }
}

uint64_t sub_217FF1658()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v4 = *(void **)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *id v5 = v1;
  v5[1] = sub_217FF2264;
  uint64_t v6 = (uint64_t (*)(char, void *, uint64_t))((char *)&dword_267BB9928 + dword_267BB9928);
  return v6(v2, v4, v3);
}

uint64_t sub_217FF1710()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  id v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *id v5 = v1;
  v5[1] = sub_217FF2264;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_267BBAB00 + dword_267BBAB00);
  return v6(v2, v3, v4);
}

uint64_t sub_217FF17D4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_217FF2264;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_267BBAB10 + dword_267BBAB10);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_217FF18A0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_217FF18B0(char a1, uint64_t a2)
{
  sub_21801A7A8(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_217FF18BC()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_217FF2264;
  uint64_t v5 = (uint64_t (*)(const void *, uint64_t))((char *)&dword_267BB9948 + dword_267BB9948);
  return v5(v2, v3);
}

uint64_t sub_217FF1974()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_217FF2264;
  uint64_t v5 = (uint64_t (*)(const void *, uint64_t))((char *)&dword_267BB9968 + dword_267BB9968);
  return v5(v2, v3);
}

uint64_t sub_217FF1A2C()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_217FF2264;
  uint64_t v5 = (uint64_t (*)(const void *, uint64_t))((char *)&dword_267BB9988 + dword_267BB9988);
  return v5(v2, v3);
}

uint64_t sub_217FF1AE0()
{
  swift_unknownObjectRelease();
  _Block_release(*(const void **)(v0 + 40));
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_217FF1B30()
{
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  char v4 = *(unsigned char *)(v0 + 32);
  char v5 = *(unsigned char *)(v0 + 33);
  uint64_t v7 = *(void **)(v0 + 40);
  uint64_t v6 = *(void *)(v0 + 48);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  *uint64_t v8 = v1;
  v8[1] = sub_217FF2264;
  uint64_t v9 = (uint64_t (*)(void *, uint64_t, char, char, void *, uint64_t))((char *)&dword_267BB99A8 + dword_267BB99A8);
  return v9(v2, v3, v4, v5, v7, v6);
}

uint64_t sub_217FF1C14()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  char v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_217FF1CC0;
  char v5 = (uint64_t (*)(const void *, uint64_t))((char *)&dword_267BB99C8 + dword_267BB99C8);
  return v5(v2, v3);
}

uint64_t sub_217FF1CC0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t objectdestroy_76Tm()
{
  _Block_release(*(const void **)(v0 + 16));
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_217FF1E00()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_217FF2264;
  char v5 = (uint64_t (*)(const void *, uint64_t))((char *)&dword_267BB99E8 + dword_267BB99E8);
  return v5(v2, v3);
}

uint64_t sub_217FF1EB8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  char v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *char v5 = v1;
  v5[1] = sub_217FF2264;
  uint64_t v6 = (uint64_t (*)(int, void *, uint64_t))((char *)&dword_267BB9A08 + dword_267BB9A08);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_166Tm()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_217FF1FC0()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  char v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *char v5 = v1;
  v5[1] = sub_217FF2264;
  uint64_t v6 = (uint64_t (*)(void *, void *, uint64_t))((char *)&dword_267BB9A28 + dword_267BB9A28);
  return v6(v2, v3, v4);
}

uint64_t sub_217FF207C(uint64_t a1, unint64_t *a2)
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

uint64_t objectdestroy_60Tm()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_217FF20FC()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v4 = *(void **)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *char v5 = v1;
  v5[1] = sub_217FF2264;
  uint64_t v6 = (uint64_t (*)(char, void *, uint64_t))((char *)&dword_267BB9A48 + dword_267BB9A48);
  return v6(v2, v4, v3);
}

uint64_t objectdestroy_64Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_217FF21F8()
{
  *(void *)(*(void *)(v0 + 16) + 24) = *(void *)(v0 + 24);
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t sub_217FF2234()
{
  return sub_217FE81B4();
}

uint64_t sub_217FF226C()
{
  swift_getKeyPath();
  sub_217FF3084();
  sub_218037E24();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  sub_217FF2924(v1);
  return v1;
}

uint64_t sub_217FF22F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  sub_217FF2924(a2);
  return sub_217FF2964(v3);
}

void sub_217FF233C(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9A80);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_217FF28BC;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_217FEFC38;
  aBlock[3] = &block_descriptor_2;
  uint64_t v9 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_crashWithReply_, v9);
  _Block_release(v9);
}

uint64_t sub_217FF24E4()
{
  sub_217FF2964(v0[2]);
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC9QuickLook43QLHostPrimaryViewControllerWrapperViewModel___observationRegistrar;
  uint64_t v2 = sub_218037E64();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_217FF258C()
{
  return type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel();
}

uint64_t type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel()
{
  uint64_t result = qword_267BB9A70;
  if (!qword_267BB9A70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_217FF25E0()
{
  uint64_t result = sub_218037E64();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t destroy for QLHostPrimaryViewControllerWrapperViewModel.Session()
{
  swift_release();

  return swift_release();
}

void *_s9QuickLook43QLHostPrimaryViewControllerWrapperViewModelC7SessionVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for QLHostPrimaryViewControllerWrapperViewModel.Session(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for QLHostPrimaryViewControllerWrapperViewModel.Session(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for QLHostPrimaryViewControllerWrapperViewModel.Session(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for QLHostPrimaryViewControllerWrapperViewModel.Session(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + _Block_object_dispose(&STACK[0x360], 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel.Session()
{
  return &type metadata for QLHostPrimaryViewControllerWrapperViewModel.Session;
}

uint64_t sub_217FF2828()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9A80);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_217FF28BC()
{
  return sub_2180387C4();
}

uint64_t sub_217FF2924(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_217FF2964(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_217FF29A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[15] = a4;
  v5[16] = a5;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  uint64_t v6 = sub_218037F64();
  v5[17] = v6;
  v5[18] = *(void *)(v6 - 8);
  v5[19] = swift_task_alloc();
  uint64_t v7 = sub_218038974();
  v5[20] = v7;
  v5[21] = *(void *)(v7 - 8);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_217FF2AD8, 0, 0);
}

uint64_t sub_217FF2AD8()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[21];
  uint64_t v11 = v0[20];
  uint64_t v12 = v0[22];
  uint64_t v3 = v0[18];
  uint64_t v10 = v0[19];
  uint64_t v4 = v0[17];
  uint64_t v5 = v0[12];
  swift_retain();
  sub_218038964();
  v0[24] = sub_2180389A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v10, v5, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v12, v1, v11);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[25] = v6;
  void *v6 = v0;
  v6[1] = sub_217FF2C1C;
  uint64_t v7 = v0[22];
  uint64_t v8 = v0[19];
  return MEMORY[0x270EEBA38](v8, v7);
}

uint64_t sub_217FF2C1C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 20_Block_object_dispose(&STACK[0x360], 8) = a1;
  *(void *)(v3 + 216) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_217FF2F54;
  }
  else {
    uint64_t v4 = sub_217FF2D30;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_217FF2D30()
{
  *(void *)(v0 + 16) = *(void *)(v0 + 208);
  uint64_t v1 = *(void *)(v0 + 192);
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 4_Block_object_dispose(&STACK[0x360], 8) = &off_26C8F99B8;
  type metadata accessor for QLUIExtensionProxy();
  uint64_t v17 = swift_allocObject();
  uint64_t v2 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 16, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = (void *)swift_task_alloc();
  (*(void (**)(void *, uint64_t, uint64_t))(v3 + 16))(v4, v2, v1);
  *(void *)(v0 + 56) = *v4;
  *(void *)(v0 + 80) = v1;
  *(void *)(v0 + 8_Block_object_dispose(&STACK[0x360], 8) = &off_26C8F99B8;
  uint64_t v5 = qword_267BB94D0;
  swift_retain_n();
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = *(void *)(v0 + 184);
  uint64_t v7 = *(void *)(v0 + 168);
  uint64_t v16 = *(void *)(v0 + 160);
  uint64_t v8 = *(void *)(v0 + 144);
  uint64_t v14 = *(void *)(v0 + 96);
  uint64_t v15 = *(void *)(v0 + 136);
  uint64_t v9 = (void *)qword_267BBD388;
  *(void *)(v17 + 16) = qword_267BBD388;
  *(void *)(v17 + 64) = 0;
  sub_217FF3064((long long *)(v0 + 56), v17 + 24);
  id v10 = v9;
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_release();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v14, v15);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  uint64_t v12 = *(void *)(v0 + 208);
  return v11(v12, v17);
}

uint64_t sub_217FF2F54()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[21];
  (*(void (**)(void, void))(v0[18] + 8))(v0[12], v0[17]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_217FF3064(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_217FF3084()
{
  unint64_t result = qword_267BBA720;
  if (!qword_267BBA720)
  {
    type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA720);
  }
  return result;
}

uint64_t sub_217FF30DC()
{
  uint64_t v0 = sub_2180381D4();
  __swift_allocate_value_buffer(v0, qword_267BB9A90);
  __swift_project_value_buffer(v0, (uint64_t)qword_267BB9A90);
  return sub_2180381C4();
}

id sub_217FF3158(void *a1)
{
  uint64_t v2 = sub_2180381D4();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v32 - v7;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id result = objc_msgSend(ObjCClassFromMetadata, sel_applicationIdentifierEntitlementKey);
  if (!result)
  {
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v11 = result;
  id v12 = objc_msgSend(a1, sel_valueForEntitlement_, result);

  if (!v12)
  {
    if (qword_267BB94C0 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v2, (uint64_t)qword_267BB9A90);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v14, v2);
    uint64_t v15 = sub_2180381B4();
    os_log_type_t v16 = sub_2180388D4();
    if (!os_log_type_enabled(v15, v16)) {
      goto LABEL_10;
    }
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    *(void *)&v36[0] = v33;
    *(_DWORD *)uint64_t v17 = 136315138;
    id result = objc_msgSend(ObjCClassFromMetadata, sel_applicationIdentifierEntitlementKey);
    if (result)
    {
      uint64_t v18 = result;
      uint64_t v19 = sub_218038624();
      unint64_t v21 = v20;

      *(void *)&v35[0] = sub_217FE6C68(v19, v21, (uint64_t *)v36);
      sub_2180389D4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_217F61000, v15, v16, "No value returned for the %s entitlement", v17, 0xCu);
      uint64_t v22 = v33;
      swift_arrayDestroy();
      MEMORY[0x21D460050](v22, -1, -1);
      MEMORY[0x21D460050](v17, -1, -1);
LABEL_10:

      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      return 0;
    }
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  sub_2180389F4();
  swift_unknownObjectRelease();
  sub_217FF363C(v35, v36);
  sub_217FE7A00((uint64_t)v36, (uint64_t)v35);
  if (swift_dynamicCast())
  {
    uint64_t v13 = v34;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
    return (id)v13;
  }
  if (qword_267BB94C0 != -1) {
    swift_once();
  }
  uint64_t v23 = __swift_project_value_buffer(v2, (uint64_t)qword_267BB9A90);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v23, v2);
  os_log_type_t v24 = sub_2180381B4();
  os_log_type_t v25 = sub_2180388D4();
  if (!os_log_type_enabled(v24, v25)) {
    goto LABEL_16;
  }
  uint64_t v26 = (uint8_t *)swift_slowAlloc();
  uint64_t v33 = swift_slowAlloc();
  *(void *)&v35[0] = v33;
  *(_DWORD *)uint64_t v26 = 136315138;
  id result = objc_msgSend(ObjCClassFromMetadata, sel_applicationIdentifierEntitlementKey);
  if (result)
  {
    uint64_t v27 = result;
    uint64_t v28 = sub_218038624();
    unint64_t v30 = v29;

    uint64_t v34 = sub_217FE6C68(v28, v30, (uint64_t *)v35);
    sub_2180389D4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_217F61000, v24, v25, "Value for %s entitlement could not be converted to String", v26, 0xCu);
    uint64_t v31 = v33;
    swift_arrayDestroy();
    MEMORY[0x21D460050](v31, -1, -1);
    MEMORY[0x21D460050](v26, -1, -1);
LABEL_16:

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
    return 0;
  }
LABEL_21:
  __break(1u);
  return result;
}

_OWORD *sub_217FF363C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_217FF364C()
{
  uint64_t v0 = sub_2180381D4();
  __swift_allocate_value_buffer(v0, qword_267BBD370);
  __swift_project_value_buffer(v0, (uint64_t)qword_267BBD370);
  return sub_2180381C4();
}

BOOL sub_217FF36D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_217FF36E8()
{
  return sub_218038C44();
}

uint64_t sub_217FF3730()
{
  return sub_218038C34();
}

uint64_t sub_217FF375C()
{
  return sub_218038C44();
}

uint64_t sub_217FF37B0()
{
  *(void *)(v1 + 64) = v0;
  sub_2180387F4();
  *(void *)(v1 + 72) = sub_2180387E4();
  uint64_t v3 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_217FF3848, v3, v2);
}

uint64_t sub_217FF3848()
{
  uint64_t v1 = v0[8];
  swift_release();
  uint64_t v2 = *(void **)(v1 + 64);
  if (v2)
  {
    id v3 = *(id *)(v1 + 64);
  }
  else
  {
    __swift_project_boxed_opaque_existential_0((void *)(v0[8] + 24), *(void *)(v0[8] + 48));
    uint64_t v6 = (void *)sub_218038984();
    objc_msgSend(v6, sel_setRemoteObjectInterface_, *(void *)(v0[8] + 16));
    uint64_t v7 = swift_allocObject();
    swift_weakInit();
    v0[6] = sub_217FF4510;
    v0[7] = v7;
    uint64_t v8 = MEMORY[0x263EF8330];
    v0[2] = MEMORY[0x263EF8330];
    v0[3] = 1107296256;
    v0[4] = sub_217FEFC38;
    v0[5] = &block_descriptor_41;
    uint64_t v9 = _Block_copy(v0 + 2);
    swift_release();
    objc_msgSend(v6, sel_setInvalidationHandler_, v9);
    _Block_release(v9);
    uint64_t v10 = swift_allocObject();
    swift_weakInit();
    v0[6] = sub_217FF4518;
    v0[7] = v10;
    v0[2] = v8;
    v0[3] = 1107296256;
    v0[4] = sub_217FEFC38;
    v0[5] = &block_descriptor_45;
    uint64_t v11 = _Block_copy(v0 + 2);
    swift_release();
    objc_msgSend(v6, sel_setInterruptionHandler_, v11);
    _Block_release(v11);
    objc_msgSend(v6, sel_resume);
    id v12 = *(void **)(v1 + 64);
    *(void *)(v1 + 64) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  uint64_t v13 = (uint64_t (*)(id))v0[1];
  id v4 = v2;
  return v13(v3);
}

uint64_t sub_217FF3ACC(uint64_t a1)
{
  sub_217FF447C();
  uint64_t v2 = sub_218038924();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_217FF44BC;
  *(void *)(v3 + 24) = a1;
  v6[4] = sub_217FF4730;
  v6[5] = v3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_217FF3C18;
  v6[3] = &block_descriptor_53;
  id v4 = _Block_copy(v6);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v2, v4);

  _Block_release(v4);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v2) {
    __break(1u);
  }
  return result;
}

uint64_t sub_217FF3C18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_217FF3C40()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (qword_267BB94C8 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_2180381D4();
    __swift_project_value_buffer(v1, (uint64_t)qword_267BBD370);
    uint64_t v2 = sub_2180381B4();
    os_log_type_t v3 = sub_2180388F4();
    if (os_log_type_enabled(v2, v3))
    {
      id v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_217F61000, v2, v3, "Connection to appex interrupted", v4, 2u);
      MEMORY[0x21D460050](v4, -1, -1);
    }

    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for QLUIExtensionProxy()
{
  return self;
}

uint64_t sub_217FF3D78()
{
  *(void *)(v1 + 64) = v0;
  sub_2180387F4();
  *(void *)(v1 + 72) = sub_2180387E4();
  uint64_t v3 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_217FF3E10, v3, v2);
}

uint64_t sub_217FF3E10()
{
  uint64_t v1 = v0[8];
  swift_release();
  uint64_t v2 = *(void **)(v1 + 64);
  if (v2)
  {
    id v3 = *(id *)(v1 + 64);
  }
  else
  {
    __swift_project_boxed_opaque_existential_0((void *)(v0[8] + 24), *(void *)(v0[8] + 48));
    uint64_t v6 = (void *)sub_218038984();
    objc_msgSend(v6, sel_setRemoteObjectInterface_, *(void *)(v0[8] + 16));
    uint64_t v7 = swift_allocObject();
    swift_weakInit();
    v0[6] = sub_217FF4474;
    v0[7] = v7;
    uint64_t v8 = MEMORY[0x263EF8330];
    v0[2] = MEMORY[0x263EF8330];
    v0[3] = 1107296256;
    v0[4] = sub_217FEFC38;
    v0[5] = &block_descriptor_3;
    uint64_t v9 = _Block_copy(v0 + 2);
    swift_release();
    objc_msgSend(v6, sel_setInvalidationHandler_, v9);
    _Block_release(v9);
    v0[6] = sub_217FF42E8;
    v0[7] = 0;
    v0[2] = v8;
    v0[3] = 1107296256;
    v0[4] = sub_217FEFC38;
    v0[5] = &block_descriptor_28;
    uint64_t v10 = _Block_copy(v0 + 2);
    objc_msgSend(v6, sel_setInterruptionHandler_, v10);
    _Block_release(v10);
    objc_msgSend(v6, sel_resume);
    uint64_t v11 = *(void **)(v1 + 64);
    *(void *)(v1 + 64) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v12 = (uint64_t (*)(id))v0[1];
  id v4 = v2;
  return v12(v3);
}

uint64_t sub_217FF405C(uint64_t a1)
{
  sub_217FF447C();
  uint64_t v2 = sub_218038924();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_217FF44BC;
  *(void *)(v3 + 24) = a1;
  v6[4] = sub_217FF44E8;
  v6[5] = v3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_217FF3C18;
  v6[3] = &block_descriptor_35;
  id v4 = _Block_copy(v6);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v2, v4);

  _Block_release(v4);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v2) {
    __break(1u);
  }
  return result;
}

void sub_217FF41A8()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    if (qword_267BB94C8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2180381D4();
    __swift_project_value_buffer(v2, (uint64_t)qword_267BBD370);
    uint64_t v3 = sub_2180381B4();
    os_log_type_t v4 = sub_2180388F4();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_217F61000, v3, v4, "Connection to appex invalidated", v5, 2u);
      MEMORY[0x21D460050](v5, -1, -1);
    }

    __swift_project_boxed_opaque_existential_0((void *)(v1 + 24), *(void *)(v1 + 48));
    sub_218038944();
    objc_msgSend(*(id *)(v1 + 64), sel_invalidate);
    uint64_t v6 = *(void **)(v1 + 64);
    *(void *)(v1 + 64) = 0;
    swift_release();
  }
}

void sub_217FF42E8()
{
  if (qword_267BB94C8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2180381D4();
  __swift_project_value_buffer(v0, (uint64_t)qword_267BBD370);
  oslog = sub_2180381B4();
  os_log_type_t v1 = sub_2180388F4();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_217F61000, oslog, v1, "Connection to appex interrupted", v2, 2u);
    MEMORY[0x21D460050](v2, -1, -1);
  }
}

uint64_t sub_217FF43D0()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 24);

  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t type metadata accessor for QLAccessoryExtensionProxy()
{
  return self;
}

uint64_t sub_217FF443C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_217FF4474()
{
  return sub_217FF405C(v0);
}

unint64_t sub_217FF447C()
{
  unint64_t result = qword_267BB9AB8;
  if (!qword_267BB9AB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BB9AB8);
  }
  return result;
}

void sub_217FF44BC()
{
}

uint64_t sub_217FF44D8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_217FF44E8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_217FF4510()
{
  return sub_217FF3ACC(v0);
}

uint64_t sub_217FF4518()
{
  return sub_217FF3C40();
}

uint64_t sub_217FF4520()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t getEnumTagSinglePayload for ProxyError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ProxyError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x217FF468CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_217FF46B4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_217FF46BC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ProxyError()
{
  return &type metadata for ProxyError;
}

unint64_t sub_217FF46DC()
{
  unint64_t result = qword_267BB9AC0;
  if (!qword_267BB9AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB9AC0);
  }
  return result;
}

id sub_217FF4760()
{
  id result = sub_217FF4780();
  qword_267BBD388 = (uint64_t)result;
  return result;
}

id sub_217FF4780()
{
  uint64_t v0 = self;
  id v64 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_26C9477F8);
  id v63 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_26C971E28);
  id v62 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_26C971EE0);
  id v59 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_26C9564B8);
  id v61 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_26C971F90);
  objc_msgSend(v61, sel_setInterface_forSelector_argumentIndex_ofReply_, v62, sel_getURLWithDownloadTracker_completionHandler_, 0, 0);
  id v1 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_26C9223F0);
  int v2 = self;
  id v3 = objc_msgSend(v2, sel_encodedClasses);
  sub_2180388B4();

  unsigned int v4 = (void *)sub_218038894();
  swift_bridgeObjectRelease();
  CMTime v65 = v1;
  objc_msgSend(v1, sel_setClasses_forSelector_argumentIndex_ofReply_, v4, sel_previewItemAtIndex_withCompletionHandler_, 0, 1);

  objc_msgSend(v1, sel_setInterface_forSelector_argumentIndex_ofReply_, v61, sel_previewItemAtIndex_withCompletionHandler_, 1, 1);
  id v60 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_26C937418);
  id v5 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_26C921400);
  objc_msgSend(v5, sel_setInterface_forSelector_argumentIndex_ofReply_, v60, sel_setPrinter_, 0, 0);
  objc_msgSend(v5, sel_setInterface_forSelector_argumentIndex_ofReply_, v59, sel_showShareSheetWithPopoverTracker_customSharedURL_dismissCompletion_, 0, 0);
  id v6 = objc_msgSend(v2, sel_customExtensionCommunicationEncodedClasses);
  sub_2180388B4();

  BOOL v7 = (void *)sub_218038894();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setClasses_forSelector_argumentIndex_ofReply_, v7, sel_forwardMessage_toItemAtIndex_withUUID_completionHandler_, 0, 0);

  id v8 = objc_msgSend(v2, sel_customExtensionCommunicationEncodedClasses);
  sub_2180388B4();

  uint64_t v9 = (void *)sub_218038894();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setClasses_forSelector_argumentIndex_ofReply_, v9, sel_forwardMessage_toItemAtIndex_withUUID_completionHandler_, 0, 1);

  id v57 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_26C9294B0);
  id v10 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_26C95CC18);
  objc_msgSend(v10, sel_setInterface_forSelector_argumentIndex_ofReply_, v1, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_, 2, 0);
  unint64_t v58 = v5;
  objc_msgSend(v10, sel_setInterface_forSelector_argumentIndex_ofReply_, v5, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_, 3, 0);
  objc_msgSend(v10, sel_setInterface_forSelector_argumentIndex_ofReply_, v1, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen_, 2, 0);
  objc_msgSend(v10, sel_setInterface_forSelector_argumentIndex_ofReply_, v5, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen_, 3, 0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BB9D70);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_218044620;
  uint64_t v12 = sub_217FF207C(0, &qword_267BBACB0);
  *(void *)(v11 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9D80);
  *(void *)(v11 + 32) = v12;
  uint64_t v13 = sub_217FF207C(0, &qword_267BB9D88);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9D90);
  *(void *)(v11 + 8_Block_object_dispose(&STACK[0x360], 8) = v14;
  uint64_t v15 = v14;
  uint64_t v54 = v14;
  *(void *)(v11 + 64) = v13;
  uint64_t v16 = sub_217FF207C(0, &qword_267BB9D98);
  *(void *)(v11 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9DA0);
  *(void *)(v11 + 96) = v16;
  id v17 = objc_allocWithZone(MEMORY[0x263EFFA08]);
  uint64_t v18 = (void *)sub_218038754();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v17, sel_initWithArray_, v18);

  sub_217FF207C(0, &qword_267BB9DA8);
  sub_217FF5744();
  uint64_t v20 = sub_2180388B4();

  sub_217FF52CC(v20);
  swift_bridgeObjectRelease();
  unint64_t v21 = (void *)sub_218038894();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setClasses_forSelector_argumentIndex_ofReply_, v21, sel_toolbarButtonsForTraitCollection_withCompletionHandler_, 0, 1);

  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_218044630;
  *(void *)(v22 + 56) = v15;
  uint64_t v23 = v13;
  *(void *)(v22 + 32) = v13;
  uint64_t v56 = sub_217FF207C(0, &qword_267BB9DB8);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BB9DC0);
  *(void *)(v22 + 8_Block_object_dispose(&STACK[0x360], 8) = v55;
  *(void *)(v22 + 64) = v56;
  id v24 = objc_allocWithZone(MEMORY[0x263EFFA08]);
  os_log_type_t v25 = (void *)sub_218038754();
  swift_bridgeObjectRelease();
  id v26 = objc_msgSend(v24, sel_initWithArray_, v25);

  uint64_t v27 = sub_2180388B4();
  sub_217FF52CC(v27);
  swift_bridgeObjectRelease();
  uint64_t v28 = (void *)sub_218038894();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setClasses_forSelector_argumentIndex_ofReply_, v28, sel_toolbarButtonsForTraitCollection_withCompletionHandler_, 1, 1);

  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_218044630;
  *(void *)(v29 + 56) = v54;
  *(void *)(v29 + 32) = v23;
  uint64_t v30 = sub_217FF207C(0, &qword_267BBAC40);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9DD0);
  *(void *)(v29 + 8_Block_object_dispose(&STACK[0x360], 8) = v31;
  *(void *)(v29 + 64) = v30;
  id v32 = objc_allocWithZone(MEMORY[0x263EFFA08]);
  uint64_t v33 = (void *)sub_218038754();
  swift_bridgeObjectRelease();
  id v34 = objc_msgSend(v32, sel_initWithArray_, v33);

  uint64_t v35 = sub_2180388B4();
  sub_217FF52CC(v35);
  swift_bridgeObjectRelease();
  unsigned int v36 = (void *)sub_218038894();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setClasses_forSelector_argumentIndex_ofReply_, v36, sel_keyCommandsWithCompletionHandler_, 0, 1);

  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_218044630;
  *(void *)(v37 + 32) = v23;
  *(void *)(v37 + 8_Block_object_dispose(&STACK[0x360], 8) = v31;
  *(void *)(v37 + 56) = v54;
  *(void *)(v37 + 64) = v30;
  id v38 = objc_allocWithZone(MEMORY[0x263EFFA08]);
  double v39 = (void *)sub_218038754();
  swift_bridgeObjectRelease();
  id v40 = objc_msgSend(v38, sel_initWithArray_, v39);

  uint64_t v41 = sub_2180388B4();
  sub_217FF52CC(v41);
  swift_bridgeObjectRelease();
  int v42 = (void *)sub_218038894();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setClasses_forSelector_argumentIndex_ofReply_, v42, sel_keyCommandWasPerformed_, 0, 0);

  uint64_t v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_218044640;
  uint64_t v44 = sub_217FF207C(0, &qword_267BB9DD8);
  *(void *)(v43 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9DE0);
  *(void *)(v43 + 32) = v44;
  uint64_t v45 = sub_217FF207C(0, &qword_267BB9DE8);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9DF0);
  *(void *)(v43 + 64) = v45;
  *(void *)(v43 + 120) = v55;
  *(void *)(v43 + 8_Block_object_dispose(&STACK[0x360], 8) = v46;
  *(void *)(v43 + 96) = v56;
  uint64_t v47 = sub_217FF207C(0, &qword_267BB9DF8);
  *(void *)(v43 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9E00);
  *(void *)(v43 + 12_Block_object_dispose(&STACK[0x360], 8) = v47;
  id v48 = objc_allocWithZone(MEMORY[0x263EFFA08]);
  v49 = (void *)sub_218038754();
  swift_bridgeObjectRelease();
  id v50 = objc_msgSend(v48, sel_initWithArray_, v49);

  uint64_t v51 = sub_2180388B4();
  sub_217FF52CC(v51);
  swift_bridgeObjectRelease();
  id v52 = (void *)sub_218038894();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setClasses_forSelector_argumentIndex_ofReply_, v52, sel_setPreviewItemDisplayState_onItemAtIndex_, 0, 0);

  objc_msgSend(v10, sel_setInterface_forSelector_argumentIndex_ofReply_, v57, sel_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler_, 1, 0);
  objc_msgSend(v10, sel_setInterface_forSelector_argumentIndex_ofReply_, v64, sel_setNotificationCenter_, 0, 0);
  objc_msgSend(v10, (SEL)&selRef_setBackgroundColor_, v63, sel_getNetworkObserverWithCompletionBlock_, 0, 1);

  return v10;
}

uint64_t sub_217FF52CC(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (sub_218038A34()) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = MEMORY[0x263F8EE88];
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9E08);
  uint64_t v3 = sub_218038A64();
  if (!v2) {
    goto LABEL_7;
  }
LABEL_4:
  swift_bridgeObjectRetain();
  swift_retain();
  sub_218038A24();
  sub_217FF207C(0, &qword_267BB9DA8);
  sub_217FF5744();
  uint64_t result = sub_2180388C4();
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
    uint64_t v16 = sub_218038A44();
    if (!v16) {
      goto LABEL_45;
    }
    *(void *)&long long v31 = v16;
    sub_217FF207C(0, &qword_267BB9DA8);
    swift_dynamicCast();
LABEL_36:
    sub_217FF207C(0, &qword_267BB9DA8);
    swift_dynamicCast();
    uint64_t result = sub_218038A54();
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
              sub_217FF57AC();
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

id sub_217FF56F4()
{
  id result = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26C95CCE8);
  qword_267BBD390 = (uint64_t)result;
  return result;
}

unint64_t sub_217FF5744()
{
  unint64_t result = qword_267BB9DB0;
  if (!qword_267BB9DB0)
  {
    sub_217FF207C(255, &qword_267BB9DA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB9DB0);
  }
  return result;
}

uint64_t sub_217FF57AC()
{
  return swift_release();
}

void sub_217FF57B4()
{
  id v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    unint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_window);

    if (v3)
    {
      id v4 = objc_msgSend(v3, sel_windowScene);

      if (v4)
      {
        id v5 = objc_msgSend(v4, sel_screenshotService);

        if (v5)
        {
          objc_msgSend(v5, sel_setPrivateDelegate_, v0);
        }
      }
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_217FF58F4()
{
  id v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    unint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_window);

    if (v3)
    {
      id v4 = objc_msgSend(v3, sel_windowScene);

      if (v4)
      {
        id v5 = objc_msgSend(v4, sel_screenshotService);

        if (v5)
        {
          objc_msgSend(v5, sel_setPrivateDelegate_, 0);
        }
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_217FF5A28(uint64_t (*a1)(void, unint64_t, void, double, double, double, double), uint64_t a2)
{
  id v3 = v2;
  id v6 = objc_msgSend(v3, sel_internalCurrentPreviewItem);
  if (!v6) {
    return a1(0, 0xF000000000000000, 0, 0.0, 0.0, 0.0, 0.0);
  }
  unint64_t v7 = v6;
  id v8 = objc_msgSend(v3, sel_printer);
  if (!v8)
  {

    return a1(0, 0xF000000000000000, 0, 0.0, 0.0, 0.0, 0.0);
  }
  uint64_t v9 = (uint64_t)v8;
  id v10 = objc_msgSend(objc_allocWithZone((Class)QLPreviewPrinter), sel_initWithPreviewPrinter_, v8);
  if (!v10)
  {

    swift_unknownObjectRelease();
    return a1(0, 0xF000000000000000, 0, 0.0, 0.0, 0.0, 0.0);
  }
  uint64_t v11 = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  swift_unknownObjectRetain();
  id v13 = v11;
  swift_retain();
  sub_21800EEFC(v7, v9, v13, (uint64_t)sub_217FF6F28, v12);

  swift_unknownObjectRelease_n();

  return swift_release();
}

void sub_217FF5BA8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v37 = a6;
  uint64_t v41 = a5;
  uint64_t v42 = a4;
  id v40 = a3;
  uint64_t v7 = sub_218038574();
  uint64_t v39 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_218038594();
  uint64_t v10 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BB9E80);
  MEMORY[0x270FA5388](v13 - 8);
  unint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_218037D74();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217FF6F30(a1, (uint64_t)&aBlock, &qword_267BB9E78);
  if (v48)
  {
    if (swift_dynamicCast())
    {
      uint64_t v20 = v43;
      unint64_t v21 = v44;
LABEL_4:
      uint64_t v22 = (void *)swift_allocObject();
      uint64_t v23 = v41;
      v22[2] = v42;
      v22[3] = v23;
      v22[4] = v20;
      v22[5] = v21;
      v49 = sub_217FF6E34;
      id v50 = v22;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v46 = 1107296256;
      uint64_t v47 = sub_21800EE78;
      id v48 = &block_descriptor_15;
      unint64_t v24 = _Block_copy(&aBlock);
      sub_217FF6E70(v20, v21);
      swift_retain();
      sub_217FF6E70(v20, v21);
      swift_release();
      objc_msgSend(v37, sel_provideCurrentPageAndVisibleRectWithCompletionHandler_, v24);
      sub_217FF6EDC(v20, v21);
      sub_217FF6EDC(v20, v21);
      _Block_release(v24);
      return;
    }
  }
  else
  {
    sub_217FF6BD8((uint64_t)&aBlock, &qword_267BB9E78);
  }
  sub_217FF6F30(a1, (uint64_t)&aBlock, &qword_267BB9E78);
  uint64_t v36 = v10;
  if (!v48)
  {
    sub_217FF6BD8((uint64_t)&aBlock, &qword_267BB9E78);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
    goto LABEL_11;
  }
  int v25 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v15, v25 ^ 1u, 1, v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
LABEL_11:
    sub_217FF6BD8((uint64_t)v15, (uint64_t *)&unk_267BB9E80);
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
  if (sub_218037D14())
  {
    uint64_t v20 = sub_218037D84();
    unint64_t v21 = v35;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    goto LABEL_4;
  }
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
LABEL_13:
  uint64_t v26 = v41;
  uint64_t v28 = v38;
  uint64_t v27 = v39;
  sub_217FF447C();
  int64_t v29 = (void *)sub_218038924();
  uint64_t v30 = (void *)swift_allocObject();
  long long v31 = v40;
  uint64_t v32 = v42;
  v30[2] = v40;
  v30[3] = v32;
  void v30[4] = v26;
  v49 = sub_217FF6C74;
  id v50 = v30;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v46 = 1107296256;
  uint64_t v47 = sub_217FEFC38;
  id v48 = &block_descriptor_9_0;
  uint64_t v33 = _Block_copy(&aBlock);
  id v34 = v31;
  swift_retain();
  swift_release();
  sub_218038584();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_217FF6CA0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9E98);
  sub_217FF6CF8();
  sub_218038A04();
  MEMORY[0x21D45E9C0](0, v12, v9, v33);
  _Block_release(v33);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v28);
}

uint64_t sub_217FF61A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(long long *, void *))(a1 + 32);
  if (a2)
  {
    *((void *)&v9 + 1) = swift_getObjectType();
    *(void *)&long long v8 = a2;
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(&v8, a3);
  swift_release();

  return sub_217FF6BD8((uint64_t)&v8, &qword_267BB9E78);
}

void sub_217FF62C4(double a1, double a2, double a3, double a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a6 >> 60 == 15) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = sub_218037D94();
  }
  id v14 = (id)v13;
  (*(void (**)(uint64_t, double, double, double, double))(a8 + 16))(a8, a1, a2, a3, a4);
}

uint64_t sub_217FF6368(uint64_t a1, uint64_t (*a2)(uint64_t, unint64_t, void, double, double, double, double))
{
  uint64_t v4 = _s12GeneratedPDFVMa();
  MEMORY[0x270FA5388](v4);
  id v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9EA8);
  MEMORY[0x270FA5388](v7);
  long long v9 = (id *)&v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_217FF6F30(a1, (uint64_t)v9, &qword_267BB9EA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {

    return a2(0, 0xF000000000000000, 0, 0.0, 0.0, 0.0, 0.0);
  }
  else
  {
    sub_217FF6F94((uint64_t)v9, (uint64_t)v6);
    uint64_t v11 = sub_218037D84();
    unint64_t v13 = v12;
    a2(v11, v12, *(void *)&v6[*(int *)(v4 + 24)], *(double *)&v6[*(int *)(v4 + 28)], *(double *)&v6[*(int *)(v4 + 28) + 8], *(double *)&v6[*(int *)(v4 + 28) + 16], *(double *)&v6[*(int *)(v4 + 28) + 24]);
    sub_217FF6EDC(v11, v13);
    return sub_217FF6FF8((uint64_t)v6);
  }
}

uint64_t sub_217FF6518(void *a1, void (**a2)(void, void, void, double, double, double, double))
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  _Block_copy(a2);
  id v5 = objc_msgSend(a1, sel_internalCurrentPreviewItem);
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_msgSend(a1, sel_printer);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      id v9 = objc_msgSend(objc_allocWithZone((Class)QLPreviewPrinter), sel_initWithPreviewPrinter_, v7);
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = swift_allocObject();
        *(void *)(v11 + 16) = sub_217FF7054;
        *(void *)(v11 + 24) = v4;
        swift_unknownObjectRetain();
        id v12 = v10;
        swift_retain();
        sub_21800EEFC(v6, v8, v12, (uint64_t)sub_217FF7070, v11);
        swift_release();

        swift_unknownObjectRelease_n();
        goto LABEL_8;
      }

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
  a2[2](a2, 0, 0, 0.0, 0.0, 0.0, 0.0);
LABEL_8:

  return swift_release();
}

uint64_t sub_217FF66B8(void *a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9E70);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_218038184();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)&v37 - v12;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  _Block_copy(a2);
  id v15 = objc_msgSend(a1, sel_internalCurrentPreviewItem);
  if (!v15) {
    goto LABEL_13;
  }
  uint64_t v16 = v15;
  id v17 = objc_msgSend(v15, sel_previewItemContentType);
  if (!v17) {
    goto LABEL_12;
  }
  uint64_t v18 = v17;
  uint64_t v41 = v13;
  uint64_t v42 = v14;
  sub_218038624();
  uint64_t v19 = v8;

  sub_218038194();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {

    sub_217FF6BD8((uint64_t)v6, &qword_267BB9E70);
LABEL_13:
    _Block_copy(a2);
    sub_217FF6518(a1, (void (**)(void, void, void, double, double, double, double))a2);
    _Block_release(a2);
    return swift_release();
  }
  uint64_t v20 = v41;
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v41, v6, v7);
  sub_218038144();
  char v21 = sub_218038174();
  uint64_t v23 = v19 + 8;
  uint64_t v22 = *(void (**)(char *, uint64_t))(v19 + 8);
  v22(v11, v7);
  uint64_t v24 = v42;
  if ((v21 & 1) == 0)
  {
    unint64_t v35 = v20;
LABEL_11:
    v22(v35, v7);
LABEL_12:

    goto LABEL_13;
  }
  id v25 = objc_msgSend(self, sel_fetcherForPreviewItem_, v16);
  if (!v25)
  {
    unint64_t v35 = v41;
    goto LABEL_11;
  }
  uint64_t v26 = v25;
  id v27 = objc_msgSend(a1, sel_printer);
  if (!v27)
  {
    v22(v41, v7);

    goto LABEL_12;
  }
  id v38 = v27;
  id v28 = objc_msgSend(a1, sel__pdfItemAllowedOutputClasses);
  sub_2180388B4();
  uint64_t v40 = v23;

  uint64_t v39 = sub_218038894();
  swift_bridgeObjectRelease();
  id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A48]), sel_init);
  uint64_t v30 = (void *)swift_allocObject();
  v30[2] = a1;
  v30[3] = sub_217FF6B7C;
  id v31 = v38;
  void v30[4] = v24;
  v30[5] = v31;
  aBlock[4] = sub_217FF6BCC;
  aBlock[5] = v30;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_217FF61A4;
  aBlock[3] = &block_descriptor_4;
  uint64_t v32 = _Block_copy(aBlock);
  id v33 = a1;
  swift_retain();
  swift_unknownObjectRetain();
  swift_release();
  id v34 = (void *)v39;
  objc_msgSend(v26, sel_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock_, v39, v29, 0, v32);

  _Block_release(v32);
  swift_unknownObjectRelease();

  v22(v41, v7);
  return swift_release();
}

uint64_t sub_217FF6B44()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_217FF6B7C(uint64_t a1, unint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  sub_217FF62C4(a4, a5, a6, a7, a1, a2, a3, *(void *)(v7 + 16));
}

uint64_t sub_217FF6B84()
{
  swift_release();
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_217FF6BCC(uint64_t a1, uint64_t a2)
{
  sub_217FF5BA8(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void **)(v2 + 40));
}

uint64_t sub_217FF6BD8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_217FF6C34()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_217FF6C74()
{
  return sub_217FF5A28(*(uint64_t (**)(void, unint64_t, void, double, double, double, double))(v0 + 24), *(void *)(v0 + 32));
}

unint64_t sub_217FF6CA0()
{
  unint64_t result = qword_267BB9E90;
  if (!qword_267BB9E90)
  {
    sub_218038574();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB9E90);
  }
  return result;
}

unint64_t sub_217FF6CF8()
{
  unint64_t result = qword_267BB9EA0;
  if (!qword_267BB9EA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BB9E98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB9EA0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_217FF6D9C()
{
  swift_release();
  sub_217FF6DDC(*(void *)(v0 + 32), *(void *)(v0 + 40));

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_217FF6DDC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_217FF6E34(uint64_t result)
{
  if ((result & 0x8000000000000000) == 0) {
    return (*(uint64_t (**)(void, void, uint64_t))(v1 + 16))(*(void *)(v1 + 32), *(void *)(v1 + 40), result);
  }
  __break(1u);
  return result;
}

uint64_t sub_217FF6E70(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_217FF6E84(a1, a2);
  }
  return a1;
}

uint64_t sub_217FF6E84(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_217FF6EDC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_217FF6DDC(a1, a2);
  }
  return a1;
}

uint64_t sub_217FF6EF0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_217FF6F28(uint64_t a1)
{
  return sub_217FF6368(a1, *(uint64_t (**)(uint64_t, unint64_t, void, double, double, double, double))(v1 + 16));
}

uint64_t sub_217FF6F30(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_217FF6F94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s12GeneratedPDFVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_217FF6FF8(uint64_t a1)
{
  uint64_t v2 = _s12GeneratedPDFVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_217FF7074()
{
  swift_getKeyPath();
  sub_217FF88F4();
  sub_218037E24();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_217FF70E4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_217FF88F4();
  sub_218037E24();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 16);
  return result;
}

uint64_t sub_217FF715C()
{
  return swift_release();
}

uint64_t sub_217FF71FC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9QuickLookP33_CA8240D53F8462069CDA31A2DF9EC6E212HostingState___observationRegistrar;
  uint64_t v2 = sub_218037E64();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_217FF729C()
{
  return type metadata accessor for HostingState();
}

uint64_t type metadata accessor for HostingState()
{
  uint64_t result = qword_267BB9EC0;
  if (!qword_267BB9EC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_217FF72F0()
{
  uint64_t result = sub_218037E64();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_217FF738C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9F68);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9F70);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9F78);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)id v6 = sub_218038304();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9F80);
  sub_217FF75C8(a1, (uint64_t)&v6[*(int *)(v14 + 44)]);
  uint64_t v15 = sub_218038214();
  char v16 = sub_2180383E4();
  sub_217FF6F30((uint64_t)v6, (uint64_t)v10, &qword_267BB9F68);
  id v17 = &v10[*(int *)(v8 + 44)];
  *(void *)id v17 = v15;
  v17[8] = v16;
  sub_217FF6BD8((uint64_t)v6, &qword_267BB9F68);
  sub_218038564();
  sub_217FF7DD4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v13, 0.0, 1, INFINITY, 0);
  sub_217FF6BD8((uint64_t)v10, &qword_267BB9F70);
  uint64_t v18 = sub_218038474();
  char v19 = sub_2180383E4();
  sub_217FF6F30((uint64_t)v13, a2, &qword_267BB9F78);
  uint64_t v20 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BB9F88) + 36);
  *(void *)uint64_t v20 = v18;
  *(unsigned char *)(v20 + _Block_object_dispose(&STACK[0x360], 8) = v19;
  return sub_217FF6BD8((uint64_t)v13, &qword_267BB9F78);
}

uint64_t sub_217FF75C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v30 = sub_2180381E4();
  uint64_t v3 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9F90);
  uint64_t v28 = *(void *)(v6 - 8);
  uint64_t v29 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9F98);
  uint64_t v9 = MEMORY[0x270FA5388](v33);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)&v28 - v12;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9FA0);
  MEMORY[0x270FA5388](v31);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9FA8);
  MEMORY[0x270FA5388](v32);
  id v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v35 = a1;
  sub_217FF88F4();
  sub_218037E24();
  swift_release();
  if (*(unsigned char *)(a1 + 16) == 1)
  {
    *(void *)id v17 = sub_2180382D4();
    *((void *)v17 + 1) = 0;
    v17[16] = 1;
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9FD8);
    sub_217FF7A5C((uint64_t *)&v17[*(int *)(v18 + 44)]);
    char v19 = &qword_267BB9FA8;
    sub_217FF6F30((uint64_t)v17, (uint64_t)v15, &qword_267BB9FA8);
    swift_storeEnumTagMultiPayload();
    sub_217FF8CEC(&qword_267BB9FB8, &qword_267BB9FA8);
    sub_217FF8A48();
    sub_218038324();
    uint64_t v20 = (uint64_t)v17;
  }
  else
  {
    sub_2180381F4();
    uint64_t v21 = v30;
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F18560], v30);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v23 = (uint64_t *)&v11[*(int *)(v33 + 36)];
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9FB0);
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)v23 + *(int *)(v24 + 28), v5, v21);
    uint64_t *v23 = KeyPath;
    uint64_t v26 = v28;
    uint64_t v25 = v29;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v11, v8, v29);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v21);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v25);
    sub_217FF89E0((uint64_t)v11, (uint64_t)v13);
    char v19 = &qword_267BB9F98;
    sub_217FF6F30((uint64_t)v13, (uint64_t)v15, &qword_267BB9F98);
    swift_storeEnumTagMultiPayload();
    sub_217FF8CEC(&qword_267BB9FB8, &qword_267BB9FA8);
    sub_217FF8A48();
    sub_218038324();
    uint64_t v20 = (uint64_t)v13;
  }
  return sub_217FF6BD8(v20, v19);
}

uint64_t sub_217FF7A5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v35 = a1;
  uint64_t v1 = sub_2180381E4();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9F90);
  uint64_t v5 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9F98);
  uint64_t v9 = v8 - 8;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v31 - v13;
  sub_2180382E4();
  uint64_t v15 = sub_218038424();
  uint64_t v32 = v16;
  uint64_t v33 = v15;
  uint64_t v31 = v17;
  char v19 = v18 & 1;
  sub_2180381F4();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F18560], v1);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v21 = (uint64_t *)&v12[*(int *)(v9 + 44)];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9FB0);
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))((char *)v21 + *(int *)(v22 + 28), v4, v1);
  *uint64_t v21 = KeyPath;
  uint64_t v23 = v34;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v12, v7, v34);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v23);
  sub_217FF89E0((uint64_t)v12, (uint64_t)v14);
  sub_217FF6F30((uint64_t)v14, (uint64_t)v12, &qword_267BB9F98);
  uint64_t v24 = v35;
  uint64_t v25 = v32;
  uint64_t v26 = v33;
  uint64_t v27 = v31;
  *uint64_t v35 = v33;
  v24[1] = v27;
  *((unsigned char *)v24 + 16) = v19;
  v24[3] = v25;
  uint64_t v28 = v24;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9FE0);
  sub_217FF6F30((uint64_t)v12, (uint64_t)v28 + *(int *)(v29 + 48), &qword_267BB9F98);
  sub_217FF8B0C(v26, v27, v19);
  swift_bridgeObjectRetain();
  sub_217FF6BD8((uint64_t)v14, &qword_267BB9F98);
  sub_217FF6BD8((uint64_t)v12, &qword_267BB9F98);
  sub_217FF8B1C(v26, v27, v19);
  return swift_bridgeObjectRelease();
}

__n128 sub_217FF7DD4@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_218038904();
    uint64_t v23 = (void *)sub_2180383D4();
    sub_2180381A4();
  }
  sub_218038224();
  sub_217FF6F30(v13, a9, &qword_267BB9F70);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BB9F78) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  _OWORD *v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_217FF7F9C@<X0>(uint64_t a1@<X8>)
{
  return sub_217FF738C(*v1, a1);
}

id sub_217FF7FA4(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC9QuickLook23QLHostPlaceholderUIView_hostingState;
  type metadata accessor for HostingState();
  uint64_t v10 = swift_allocObject();
  *(unsigned char *)(v10 + 16) = 0;
  uint64_t v11 = v4;
  sub_218037E54();
  *(void *)&v4[v9] = v10;

  v33.receiver = v11;
  v33.super_class = (Class)type metadata accessor for QLHostPlaceholderUIView();
  id v12 = objc_msgSendSuper2(&v33, sel_initWithFrame_, a1, a2, a3, a4);
  id v13 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BB9F50));
  id v14 = v12;
  swift_retain();
  uint64_t v15 = (void *)sub_218038204();
  id v16 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v15, sel_setBackgroundColor_, v16);

  objc_msgSend(v15, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v14, sel_addSubview_, v15);
  uint64_t v17 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAD50);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_218044660;
  id v19 = objc_msgSend(v14, sel_leadingAnchor);
  id v20 = objc_msgSend(v15, sel_leadingAnchor);
  id v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v20);

  *(void *)(v18 + 32) = v21;
  id v22 = objc_msgSend(v14, sel_trailingAnchor);
  id v23 = objc_msgSend(v15, sel_trailingAnchor);
  id v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_, v23);

  *(void *)(v18 + 40) = v24;
  id v25 = objc_msgSend(v14, sel_topAnchor);
  id v26 = objc_msgSend(v15, sel_topAnchor);
  id v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_, v26);

  *(void *)(v18 + 4_Block_object_dispose(&STACK[0x360], 8) = v27;
  id v28 = objc_msgSend(v14, sel_bottomAnchor);
  id v29 = objc_msgSend(v15, sel_bottomAnchor);
  id v30 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v29);

  *(void *)(v18 + 56) = v30;
  sub_218038774();
  sub_217FF894C();
  long long v31 = (void *)sub_218038754();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_activateConstraints_, v31);

  return v14;
}

id sub_217FF8548()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLHostPlaceholderUIView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for QLHostPlaceholderUIView()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for HostingState.State(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x217FF867CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HostingState.State()
{
  return &type metadata for HostingState.State;
}

unint64_t sub_217FF86B8()
{
  unint64_t result = qword_267BB9F40;
  if (!qword_267BB9F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB9F40);
  }
  return result;
}

uint64_t sub_217FF870C(uint64_t a1)
{
  uint64_t v2 = sub_2180381E4();
  MEMORY[0x270FA5388](v2);
  unsigned int v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return MEMORY[0x21D45E2D0](v4);
}

uint64_t sub_217FF87D4()
{
  return swift_release();
}

void sub_217FF88E4()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 16) = *(unsigned char *)(v0 + 24);
}

unint64_t sub_217FF88F4()
{
  unint64_t result = qword_267BB9F48;
  if (!qword_267BB9F48)
  {
    type metadata accessor for HostingState();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB9F48);
  }
  return result;
}

unint64_t sub_217FF894C()
{
  unint64_t result = qword_267BB9F60;
  if (!qword_267BB9F60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BB9F60);
  }
  return result;
}

ValueMetadata *type metadata accessor for InnerView()
{
  return &type metadata for InnerView;
}

uint64_t sub_217FF899C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217FF89B8()
{
  return sub_218038234();
}

uint64_t sub_217FF89E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9F98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_217FF8A48()
{
  unint64_t result = qword_267BB9FC0;
  if (!qword_267BB9FC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BB9F98);
    sub_217FF8CEC(&qword_267BB9FC8, &qword_267BB9F90);
    sub_217FF8CEC(&qword_267BB9FD0, &qword_267BB9FB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB9FC0);
  }
  return result;
}

uint64_t sub_217FF8B0C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_217FF8B1C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_217FF8B30()
{
  unint64_t result = qword_267BB9FE8;
  if (!qword_267BB9FE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BB9F88);
    sub_217FF8BD0();
    sub_217FF8CEC(&qword_267BBA008, (uint64_t *)&unk_267BBA010);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB9FE8);
  }
  return result;
}

unint64_t sub_217FF8BD0()
{
  unint64_t result = qword_267BB9FF0;
  if (!qword_267BB9FF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BB9F78);
    sub_217FF8C4C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB9FF0);
  }
  return result;
}

unint64_t sub_217FF8C4C()
{
  unint64_t result = qword_267BB9FF8;
  if (!qword_267BB9FF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BB9F70);
    sub_217FF8CEC(&qword_267BBA000, &qword_267BB9F68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB9FF8);
  }
  return result;
}

uint64_t sub_217FF8CEC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_217FF8D30()
{
}

uint64_t QLPreviewReply.stringEncoding.getter()
{
  objc_msgSend(v0, sel_stringEncoding);

  return sub_218038664();
}

uint64_t sub_217FF8D8C(uint64_t a1, id *a2)
{
  uint64_t v4 = sub_218038684();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  objc_msgSend(*a2, sel_setStringEncoding_, sub_218038674());
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t QLPreviewReply.stringEncoding.setter(uint64_t a1)
{
  uint64_t v2 = v1;
  objc_msgSend(v2, sel_setStringEncoding_, sub_218038674());
  uint64_t v4 = sub_218038684();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);

  return v5(a1, v4);
}

void (*QLPreviewReply.stringEncoding.modify(void *a1))(void ***a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = sub_218038684();
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  objc_msgSend(v1, sel_stringEncoding);
  sub_218038664();
  return sub_217FF8FEC;
}

void sub_217FF8FEC(void ***a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (*a1)[3];
  uint64_t v4 = (*a1)[4];
  uint64_t v5 = (*a1)[1];
  size_t v6 = (void (**)(void *, void *, void *))(*a1)[2];
  uint64_t v7 = **a1;
  if (a2)
  {
    v6[2]((*a1)[3], v4, v5);
    objc_msgSend(v7, sel_setStringEncoding_, sub_218038674());
    uint64_t v8 = v6[1];
    ((void (*)(void *, void *))v8)(v3, v5);
    ((void (*)(void *, void *))v8)(v4, v5);
  }
  else
  {
    objc_msgSend(v7, sel_setStringEncoding_, sub_218038674());
    ((void (*)(void *, void *))v6[1])(v4, v5);
  }
  free(v4);
  free(v3);

  free(v2);
}

id QLPreviewReply.init(contextSize:isBitmap:drawUsing:)(char a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  id v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  *(void *)(v11 + 24) = a3;
  v15[4] = sub_217FF9300;
  v15[5] = v11;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 1107296256;
  v15[2] = sub_217FF9308;
  v15[3] = &block_descriptor_5;
  id v12 = _Block_copy(v15);
  swift_retain();
  swift_release();
  id v13 = objc_msgSend(v10, sel_initWithContextSize_isBitmap_drawingBlock_, a1 & 1, v12, a4, a5);
  swift_release();
  _Block_release(v12);
  return v13;
}

uint64_t sub_217FF9224(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return 1;
}

uint64_t sub_217FF92C8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_217FF9300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_217FF9224(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_217FF9308(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = *(uint64_t (**)(id, id, uint64_t))(a1 + 32);
  swift_retain();
  id v8 = a2;
  id v9 = a3;
  LOBYTE(a4) = v7(v8, v9, a4);
  swift_release();

  return a4 & 1;
}

id QLPreviewReply.init(forPDFWithPageSize:createDocumentUsing:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  v13[4] = sub_217FF9544;
  v13[5] = v9;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_217FF954C;
  v13[3] = &block_descriptor_6_0;
  id v10 = _Block_copy(v13);
  swift_retain();
  swift_release();
  id v11 = objc_msgSend(v8, sel_initForPDFWithPageSize_documentCreationBlock_, v10, a3, a4);
  swift_release();
  _Block_release(v10);
  return v11;
}

uint64_t sub_217FF94A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_217FF9544(uint64_t a1, uint64_t a2)
{
  return sub_217FF94A4(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

id sub_217FF954C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = (void *)v3();
  swift_release();

  return v5;
}

id QLPreviewReply.init(dataOfContentType:contentSize:createDataUsing:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  id v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v11 = (void *)sub_218038134();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  v17[4] = sub_217FF97DC;
  v17[5] = v12;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  v17[2] = sub_217FF97E4;
  v17[3] = &block_descriptor_12_0;
  id v13 = _Block_copy(v17);
  swift_retain();
  swift_release();
  id v14 = objc_msgSend(v10, sel_initWithDataOfContentType_contentSize_dataCreationBlock_, v11, v13, a4, a5);
  _Block_release(v13);
  swift_release();

  uint64_t v15 = sub_218038184();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(a1, v15);
  return v14;
}

uint64_t sub_217FF9738(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_217FF97DC(uint64_t a1, uint64_t a2)
{
  return sub_217FF9738(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

id sub_217FF97E4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = v3();
  unint64_t v7 = v6;
  swift_release();

  if (v7 >> 60 == 15)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = (void *)sub_218037D94();
    sub_217FF6EDC(v5, v7);
  }

  return v8;
}

uint64_t sub_217FF9894(id *a1)
{
  objc_msgSend(*a1, sel_stringEncoding);

  return sub_218038664();
}

unint64_t sub_217FF98DC()
{
  unint64_t result = qword_267BBA020;
  if (!qword_267BBA020)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BBA020);
  }
  return result;
}

uint64_t sub_217FF9928()
{
  uint64_t v0 = sub_2180381D4();
  __swift_allocate_value_buffer(v0, qword_267BBA028);
  __swift_project_value_buffer(v0, (uint64_t)qword_267BBA028);
  return sub_2180381C4();
}

uint64_t QLPrimaryAppExtensionScene.init(content:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0x7972616D697270;
  a3[1] = 0xE700000000000000;
  a3[2] = result;
  a3[3] = a2;
  return result;
}

uint64_t QLPrimaryAppExtensionScene.body.getter(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[3];
  type metadata accessor for QLAppExtensionSceneProxy(0);
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(void *)(v5 + 24) = 0;
  sub_218037E54();
  uint64_t v6 = swift_allocObject();
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(v6 + 16) = v8;
  *(void *)(v6 + 24) = v7;
  *(void *)(v6 + 32) = v3;
  long long v9 = *(_OWORD *)(v1 + 1);
  *(_OWORD *)(v6 + 40) = v9;
  *(void *)(v6 + 56) = v4;
  *(void *)(v6 + 64) = v5;
  uint64_t v10 = v9;
  swift_bridgeObjectRetain_n();
  swift_retain();
  swift_retain();

  return MEMORY[0x270EEB958](v3, v10, sub_217FF9C68, v6, sub_217FF9E8C, v5, v8, v7);
}

uint64_t sub_217FF9AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = *(void *)(a6 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](a5);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v19 - v14;
  v16(v13);
  sub_218015A50(v12, a6, a7);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v9 + 8);
  v17(v12, a6);
  sub_218015A50(v15, a6, a7);
  return ((uint64_t (*)(char *, uint64_t))v17)(v15, a6);
}

uint64_t sub_217FF9C20()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_217FF9C68()
{
  return sub_217FF9AE8(v0[4], v0[5], v0[6], v0[7], v0[8], v0[2], v0[3]);
}

uint64_t sub_217FF9C7C(id a1, uint64_t a2)
{
  if (qword_267BB94D0 != -1) {
    swift_once();
  }
  objc_msgSend(a1, sel_setExportedInterface_, qword_267BBD388);
  objc_msgSend(a1, sel_setExportedObject_, a2);
  objc_msgSend(a1, sel_resume);
  sub_217FFA110();
  sub_217FF3158(a1);
  if (!v4)
  {
    if (qword_267BB94E0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_2180381D4();
    __swift_project_value_buffer(v8, (uint64_t)qword_267BBA028);
    uint64_t v9 = sub_2180381B4();
    os_log_type_t v10 = sub_2180388F4();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_217F61000, v9, v10, "Failed to set hostApplicationBundleIdentifier on proxy", v11, 2u);
      MEMORY[0x21D460050](v11, -1, -1);
    }

    return 1;
  }
  swift_getKeyPath();
  sub_217FFA158();
  sub_218037E24();
  swift_release();
  uint64_t result = MEMORY[0x21D460130](a2 + 16);
  if (result)
  {
    uint64_t v6 = (void *)result;
    uint64_t v7 = (void *)sub_2180385F4();
    objc_msgSend(v6, sel_setHostApplicationBundleIdentifier_, v7);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

    return 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_217FF9E8C(void *a1)
{
  return sub_217FF9C7C(a1, v1);
}

uint64_t sub_217FF9E94(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + _Block_object_dispose(&STACK[0x360], 8) = result;
  return result;
}

uint64_t sub_217FF9ED0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217FF9F1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_217FF9F24()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_217FF9F60(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x360], 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_217FF9FAC(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_217FFA014(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x360], 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

uint64_t sub_217FFA064(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_217FFA0AC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + _Block_object_dispose(&STACK[0x360], 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + _Block_object_dispose(&STACK[0x360], 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for QLPrimaryAppExtensionScene()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_217FFA104()
{
  return MEMORY[0x263F04E30];
}

unint64_t sub_217FFA110()
{
  unint64_t result = qword_267BBA0C0;
  if (!qword_267BBA0C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BBA0C0);
  }
  return result;
}

unint64_t sub_217FFA158()
{
  unint64_t result = qword_267BB9860;
  if (!qword_267BB9860)
  {
    type metadata accessor for QLAppExtensionSceneProxy(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267BB9860);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t static QLWebLocationBarViewInterface.makeLocationBarUI(_:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for QLWebLocationBarView();
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v12 - v6;
  uint64_t v8 = sub_218037D74();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v7, a1, v8);
  sub_217FFA2E8((uint64_t)v7, (uint64_t)v5);
  id v9 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA0C8));
  uint64_t v10 = sub_218038314();
  sub_217FFA34C((uint64_t)v7);
  return v10;
}

uint64_t sub_217FFA2E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for QLWebLocationBarView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_217FFA34C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for QLWebLocationBarView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id QLWebLocationBarViewInterface.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id QLWebLocationBarViewInterface.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLWebLocationBarViewInterface();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for QLWebLocationBarViewInterface()
{
  return self;
}

id QLWebLocationBarViewInterface.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLWebLocationBarViewInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t QLHostRemoteView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA0D0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = *v1;
  uint64_t v6 = v1[1];
  *uint64_t v5 = sub_218038564();
  v5[1] = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA0D8);
  sub_217FFA738(v7, v6, (uint64_t *)((char *)v5 + *(int *)(v9 + 44)));
  uint64_t v10 = sub_218038214();
  LOBYTE(v7) = sub_2180383E4();
  sub_217FF6F30((uint64_t)v5, a1, &qword_267BBA0D0);
  uint64_t v11 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA0E0) + 36);
  *(void *)uint64_t v11 = v10;
  *(unsigned char *)(v11 + _Block_object_dispose(&STACK[0x360], 8) = v7;
  return sub_217FF6BD8((uint64_t)v5, &qword_267BBA0D0);
}

uint64_t sub_217FFA738@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  id v20 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA0F8);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v20 - v9;
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA100);
  sub_2180384B4();
  uint64_t v11 = v23;
  swift_getKeyPath();
  uint64_t v21 = v11;
  sub_217FFAC40();
  sub_218037E24();
  swift_release();
  uint64_t v12 = *(void *)(v11 + 40);
  swift_retain();
  swift_release();
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  sub_2180384B4();
  uint64_t v13 = v23;
  swift_getKeyPath();
  uint64_t v21 = v13;
  sub_218037E24();
  swift_release();
  int v14 = *(unsigned __int8 *)(v13 + 16);
  swift_release();
  if (v14 == 1)
  {
    uint64_t v21 = a1;
    uint64_t v22 = a2;
    sub_2180384B4();
    type metadata accessor for QLHostRemoteViewModel();
    sub_218038524();
    uint64_t v15 = type metadata accessor for QLHostDebugView();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v10, 0, 1, v15);
  }
  else
  {
    uint64_t v16 = type metadata accessor for QLHostDebugView();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 1, 1, v16);
  }
  sub_217FF6F30((uint64_t)v10, (uint64_t)v8, &qword_267BBA0F8);
  uint64_t v17 = v20;
  *id v20 = v12;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA108);
  sub_217FF6F30((uint64_t)v8, (uint64_t)v17 + *(int *)(v18 + 48), &qword_267BBA0F8);
  swift_retain();
  sub_217FF6BD8((uint64_t)v10, &qword_267BBA0F8);
  sub_217FF6BD8((uint64_t)v8, &qword_267BBA0F8);
  return swift_release();
}

uint64_t sub_217FFA9DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217FFA9F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA0D0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = *v1;
  uint64_t v6 = v1[1];
  *uint64_t v5 = sub_218038564();
  v5[1] = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA0D8);
  sub_217FFA738(v7, v6, (uint64_t *)((char *)v5 + *(int *)(v9 + 44)));
  uint64_t v10 = sub_218038214();
  LOBYTE(v7) = sub_2180383E4();
  sub_217FF6F30((uint64_t)v5, a1, &qword_267BBA0D0);
  uint64_t v11 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA0E0) + 36);
  *(void *)uint64_t v11 = v10;
  *(unsigned char *)(v11 + _Block_object_dispose(&STACK[0x360], 8) = v7;
  return sub_217FF6BD8((uint64_t)v5, &qword_267BBA0D0);
}

void *assignWithCopy for QLHostRemoteView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for QLHostRemoteView()
{
  return &type metadata for QLHostRemoteView;
}

unint64_t sub_217FFAB60()
{
  unint64_t result = qword_267BBA0E8;
  if (!qword_267BBA0E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBA0E0);
    sub_217FFABDC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA0E8);
  }
  return result;
}

unint64_t sub_217FFABDC()
{
  unint64_t result = qword_267BBA0F0;
  if (!qword_267BBA0F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBA0D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA0F0);
  }
  return result;
}

unint64_t sub_217FFAC40()
{
  unint64_t result = qword_267BBA870;
  if (!qword_267BBA870)
  {
    type metadata accessor for QLHostRemoteViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA870);
  }
  return result;
}

uint64_t sub_217FFACA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[8] = a3;
  v4[9] = v3;
  v4[6] = a1;
  v4[7] = a2;
  uint64_t v5 = sub_218037F04();
  v4[10] = v5;
  v4[11] = *(void *)(v5 - 8);
  v4[12] = swift_task_alloc();
  uint64_t v6 = sub_218037DF4();
  v4[13] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v4[14] = v7;
  v4[15] = *(void *)(v7 + 64);
  v4[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA160);
  v4[17] = swift_task_alloc();
  v4[18] = swift_task_alloc();
  v4[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA740);
  v4[20] = swift_task_alloc();
  uint64_t v8 = sub_218037F74();
  v4[21] = v8;
  v4[22] = *(void *)(v8 - 8);
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  uint64_t v9 = sub_218037ED4();
  v4[25] = v9;
  v4[26] = *(void *)(v9 - 8);
  v4[27] = swift_task_alloc();
  uint64_t v10 = sub_218037EE4();
  v4[28] = v10;
  v4[29] = *(void *)(v10 - 8);
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_217FFAF78, 0, 0);
}

uint64_t sub_217FFAF78()
{
  uint64_t v2 = v0[30];
  uint64_t v1 = v0[31];
  uint64_t v3 = v0[28];
  uint64_t v4 = v0[29];
  v0[32] = OBJC_IVAR____TtC9QuickLook24QLHostRemotePreviewModel_quickLookPreviewAppExtensionPointQuery;
  sub_218037EF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  sub_217FFC748((unint64_t *)&unk_267BBA890, MEMORY[0x263F04D48]);
  sub_218038884();
  uint64_t v5 = sub_217FFC748(&qword_267BBA168, MEMORY[0x263F04D38]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[33] = v6;
  void *v6 = v0;
  v6[1] = sub_217FFB100;
  uint64_t v7 = v0[25];
  return MEMORY[0x270FA1E80](v0 + 5, v7, v5);
}

uint64_t sub_217FFB100()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 272) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[26] + 8))(v2[27], v2[25]);
    uint64_t v3 = sub_217FFB69C;
  }
  else
  {
    uint64_t v3 = sub_217FFB22C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_217FFB22C()
{
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[26];
  uint64_t v2 = v0[27];
  uint64_t v4 = v0[25];
  if (!v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
LABEL_8:
    uint64_t v10 = v0[11];
    uint64_t v9 = v0[12];
    uint64_t v11 = v0[10];
    uint64_t v12 = v0[9] + v0[32];
    sub_218038A74();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v12, v11);
    sub_218038694();
    sub_2180386E4();
    swift_bridgeObjectRelease();
    sub_2180386E4();
    return sub_218038B14();
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (*(void *)(v1 + 16))
  {
    (*(void (**)(void, unint64_t, void))(v0[22] + 16))(v0[20], v1 + ((*(unsigned __int8 *)(v0[22] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[22] + 80)), v0[21]);
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  uint64_t v6 = v0[21];
  uint64_t v7 = v0[22];
  uint64_t v8 = v0[20];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v8, v5, 1, v6);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v8, 1, v6) == 1)
  {
    sub_217FF6BD8(v0[20], (uint64_t *)&unk_267BBA740);
    goto LABEL_8;
  }
  uint64_t v14 = v0[23];
  uint64_t v15 = v0[24];
  uint64_t v17 = v0[21];
  uint64_t v16 = v0[22];
  uint64_t v31 = v0[19];
  uint64_t v32 = v0[18];
  uint64_t v18 = v0[16];
  uint64_t v34 = v0[17];
  uint64_t v19 = v0[14];
  uint64_t v20 = v0[13];
  uint64_t v21 = v0[8];
  uint64_t v33 = v0[9];
  uint64_t v22 = v0[7];
  (*(void (**)(uint64_t, void, uint64_t))(v16 + 32))(v15, v0[20], v17);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, v15, v17);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v21, v20);
  unint64_t v23 = (*(unsigned __int8 *)(v19 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v22;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v19 + 32))(v24 + v23, v18, v20);
  swift_unknownObjectRetain();
  sub_218037F14();
  uint64_t v25 = sub_218037F34();
  uint64_t v26 = *(void *)(v25 - 8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(v31, 0, 1, v25);
  sub_217FFC8F0(v31, v32, &qword_267BBA160);
  uint64_t v27 = v33 + OBJC_IVAR____TtC9QuickLook24QLHostRemotePreviewModel_config;
  swift_beginAccess();
  sub_217FFC954(v32, v27, &qword_267BBA160);
  swift_endAccess();
  sub_217FFC9B8(v27, v34);
  uint64_t v28 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v34, 1, v25);
  if (v28 == 1)
  {
    __break(1u);
  }
  else
  {
    id v30 = (void *)swift_task_alloc();
    v0[35] = v30;
    *id v30 = v0;
    v30[1] = sub_217FFB7B0;
    uint64_t v29 = v0[17];
    uint64_t v28 = v0[6];
  }
  return MEMORY[0x270EEB850](v28, v29);
}

uint64_t sub_217FFB69C()
{
  (*(void (**)(void, void))(v0[29] + 8))(v0[31], v0[28]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_217FFB7B0()
{
  *(void *)(*(void *)v1 + 28_Block_object_dispose(&STACK[0x360], 8) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_217FFB9F4;
  }
  else {
    uint64_t v2 = sub_217FFB8C4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_217FFB8C4()
{
  uint64_t v1 = v0[31];
  uint64_t v2 = v0[28];
  uint64_t v3 = v0[29];
  (*(void (**)(void, void))(v0[22] + 8))(v0[24], v0[21]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_217FFB9F4()
{
  (*(void (**)(void, void))(v0[22] + 8))(v0[24], v0[21]);
  (*(void (**)(void, void))(v0[29] + 8))(v0[31], v0[28]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_217FFBB20(uint64_t a1, uint64_t a2)
{
  v3[16] = a1;
  v3[17] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA140);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  uint64_t v6 = sub_218037F64();
  v3[20] = v6;
  v3[21] = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  v3[22] = v7;
  v3[23] = sub_2180387F4();
  v3[24] = sub_2180387E4();
  uint64_t v8 = (void *)swift_task_alloc();
  v3[25] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_217FFBC98;
  return sub_217FFACA0(v7, a1, a2);
}

uint64_t sub_217FFBC98()
{
  *(void *)(*(void *)v1 + 20_Block_object_dispose(&STACK[0x360], 8) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_2180387A4();
  if (v0) {
    uint64_t v4 = sub_217FFC408;
  }
  else {
    uint64_t v4 = sub_217FFBDF4;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_217FFBDF4()
{
  uint64_t v1 = v0[26];
  uint64_t v3 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v5 = v0[19];
  uint64_t v4 = v0[20];
  uint64_t v7 = v0[17];
  uint64_t v6 = v0[18];
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v5, v2, v4);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v5, 0, 1, v4);
  sub_217FFC8F0(v5, v6, &qword_267BBA140);
  uint64_t v8 = v7 + OBJC_IVAR____TtC9QuickLook24QLHostRemotePreviewModel_previewApplicationProcess;
  swift_beginAccess();
  sub_217FFC954(v6, v8, &qword_267BBA140);
  swift_endAccess();
  uint64_t v9 = (void *)sub_218037F54();
  if (v1)
  {
    uint64_t v10 = "QuickLook/QLHostRemotePreviewModel.swift";
    uint64_t v11 = v1;
    uint64_t v12 = 40;
    uint64_t v13 = 1;
    uint64_t v14 = 48;
    return MEMORY[0x270FA0588](v11, v10, v12, v13, v14);
  }
  uint64_t v15 = v9;
  objc_msgSend(v9, sel_setExportedObject_, v0[16]);
  uint64_t v16 = self;
  id v17 = objc_msgSend(v16, sel_interfaceWithProtocol_, &unk_26C95D0A0);
  objc_msgSend(v15, sel_setExportedInterface_, v17);

  id v18 = objc_msgSend(v16, sel_interfaceWithProtocol_, &unk_26C9724B8);
  objc_msgSend(v15, sel_setRemoteObjectInterface_, v18);

  objc_msgSend(v15, sel_resume);
  if (objc_msgSend(v15, sel_remoteObjectInterface))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BB9D70);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_218044630;
    uint64_t v20 = sub_217FF207C(0, &qword_267BB9D88);
    *(void *)(v19 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9D90);
    *(void *)(v19 + 32) = v20;
    uint64_t v21 = sub_217FF207C(0, (unint64_t *)&qword_267BBA148);
    *(void *)(v19 + 8_Block_object_dispose(&STACK[0x360], 8) = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA150);
    *(void *)(v19 + 64) = v21;
    id v22 = objc_allocWithZone(MEMORY[0x263EFFA08]);
    unint64_t v23 = (void *)sub_218038754();
    swift_bridgeObjectRelease();
    objc_msgSend(v22, sel_initWithArray_, v23);

    uint64_t v11 = sub_2180388A4();
    __break(1u);
LABEL_12:
    __break(1u);
    return MEMORY[0x270FA0588](v11, v10, v12, v13, v14);
  }
  if (objc_msgSend(v15, sel_remoteObjectInterface))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BB9D70);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_218044630;
    uint64_t v25 = sub_217FF207C(0, &qword_267BB9D88);
    *(void *)(v24 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9D90);
    *(void *)(v24 + 32) = v25;
    uint64_t v26 = sub_217FF207C(0, (unint64_t *)&qword_267BBA148);
    *(void *)(v24 + 8_Block_object_dispose(&STACK[0x360], 8) = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA150);
    *(void *)(v24 + 64) = v26;
    id v27 = objc_allocWithZone(MEMORY[0x263EFFA08]);
    uint64_t v28 = (void *)sub_218038754();
    swift_bridgeObjectRelease();
    objc_msgSend(v27, sel_initWithArray_, v28);

    uint64_t v11 = sub_2180388A4();
    goto LABEL_12;
  }
  uint64_t v29 = v0[21];
  uint64_t v30 = v0[22];
  uint64_t v31 = v0[20];
  v0[6] = QLPHDisplayVelocityFromQLPXDisplayVelocity;
  v0[7] = 0;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_218034374;
  v0[5] = &block_descriptor_6;
  uint64_t v32 = _Block_copy(v0 + 2);
  id v33 = objc_msgSend(v15, sel_synchronousRemoteObjectProxyWithErrorHandler_, v32);
  _Block_release(v32);
  sub_2180389F4();
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA158);
  swift_dynamicCast();
  uint64_t v34 = v0[15];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = (uint64_t (*)(uint64_t))v0[1];
  return v35(v34);
}

uint64_t sub_217FFC408()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_217FFC494()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9QuickLook24QLHostRemotePreviewModel_quickLookPreviewAppExtensionPointQuery;
  uint64_t v2 = sub_218037F04();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_217FF6BD8(v0 + OBJC_IVAR____TtC9QuickLook24QLHostRemotePreviewModel_previewApplicationProcess, &qword_267BBA140);
  sub_217FF6BD8(v0 + OBJC_IVAR____TtC9QuickLook24QLHostRemotePreviewModel_config, &qword_267BBA160);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_217FFC564()
{
  return type metadata accessor for QLHostRemotePreviewModel();
}

uint64_t type metadata accessor for QLHostRemotePreviewModel()
{
  uint64_t result = qword_267BBA118;
  if (!qword_267BBA118) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_217FFC5B8()
{
  sub_218037F04();
  if (v0 <= 0x3F)
  {
    sub_217FFC6F4(319, (unint64_t *)&qword_267BBA860, MEMORY[0x263F04D70]);
    if (v1 <= 0x3F)
    {
      sub_217FFC6F4(319, &qword_267BBA138, MEMORY[0x263F04D60]);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_217FFC6F4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2180389C4();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_217FFC748(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_217FFC790()
{
  uint64_t v1 = sub_218037DF4();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_217FFC85C()
{
  sub_218037DF4();
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = (id)sub_218037DC4();
  objc_msgSend(v1, sel_previewTerminatedWithSessionUUID_, v2);
}

uint64_t sub_217FFC8F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_217FFC954(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_217FFC9B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_217FFCA20()
{
  uint64_t v0 = sub_2180381D4();
  __swift_allocate_value_buffer(v0, qword_267BBA170);
  __swift_project_value_buffer(v0, (uint64_t)qword_267BBA170);
  return sub_2180381C4();
}

id sub_217FFCAA4(uint64_t a1, char a2)
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = (void *)sub_218037D34();
  v13[0] = 0;
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_wrapperWithURL_readonly_error_, v4, a2 & 1, v13);

  id v6 = v13[0];
  if (v5)
  {
    uint64_t v7 = sub_218037D74();
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    id v9 = v6;
    v8(a1, v7);
  }
  else
  {
    id v10 = v13[0];
    sub_218037D04();

    swift_willThrow();
    uint64_t v11 = sub_218037D74();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

uint64_t sub_217FFCC04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_2180387F4();
  v5[4] = sub_2180387E4();
  uint64_t v7 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_2180015FC, v7, v6);
}

uint64_t sub_217FFCDB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_2180387F4();
  v5[4] = sub_2180387E4();
  uint64_t v7 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_217FFCE4C, v7, v6);
}

uint64_t sub_217FFCE4C()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[2];
  swift_release();
  id v3 = objc_msgSend(self, sel_sharedApplication);
  id v4 = objc_msgSend(v3, sel_connectedScenes);

  sub_217FF207C(0, &qword_267BBA218);
  sub_218001258();
  uint64_t v5 = sub_2180388B4();

  swift_bridgeObjectRetain();
  sub_21800026C(v5, v2, v1);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
    self;
  }
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_217FFCF94(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v5 = sub_218037DF4();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218037DD4();
  a4(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_217FFD144(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA228);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_218001384(a1);
    sub_217FFDC60(a2, (uint64_t)v8);
    uint64_t v13 = sub_218037DF4();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
    return sub_218001384((uint64_t)v8);
  }
  else
  {
    sub_2180010D4(a1, (uint64_t)v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v3;
    *id v3 = 0x8000000000000000;
    sub_217FFE950((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native);
    *id v3 = v18;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_218037DF4();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t sub_217FFD410()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for HostHandler()
{
  return self;
}

uint64_t sub_217FFD444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_217FFD44C()
{
  uint64_t result = sub_218038874();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_218038864();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_217FFD520(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_218038874();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_218038864();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_217FFD634(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_218038874();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  uint64_t v6 = sub_218038864();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_217FFD6F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_218038874();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_218038864();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_217FFD7B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_218038874();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_218038864();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_217FFD878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_218038874();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_218038864();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_217FFD93C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_218038874();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_218038864();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_217FFDA00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_217FFDA14);
}

uint64_t sub_217FFDA14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_218038874();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_218038864();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 28);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_217FFDB18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_217FFDB2C);
}

uint64_t sub_217FFDB2C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_218038874();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_218038864();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 28);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for DataProvider()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_217FFDC60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_2180086B4(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *id v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_217FFEDD4();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_218037DF4();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
    uint64_t v20 = *(void *)(v13 - 8);
    sub_2180010D4(v12 + *(void *)(v20 + 72) * v6, a2);
    sub_217FFE608(v6, v9);
    *id v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_217FFDE18(uint64_t a1, int a2)
{
  id v3 = v2;
  uint64_t v5 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  uint64_t v49 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v54 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_218037DF4();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v51 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA250);
  int v50 = a2;
  uint64_t v11 = v10;
  uint64_t v12 = sub_218038B44();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v46 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  unint64_t v44 = v2;
  int64_t v45 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v47 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  id v52 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v53 = v7;
  uint64_t v18 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  uint64_t v48 = v11;
  uint64_t v21 = v51;
  while (1)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v45) {
      break;
    }
    uint64_t v26 = v46;
    unint64_t v27 = v46[v25];
    ++v20;
    if (!v27)
    {
      int64_t v20 = v25 + 1;
      if (v25 + 1 >= v45) {
        goto LABEL_34;
      }
      unint64_t v27 = v46[v20];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v45)
        {
LABEL_34:
          swift_release();
          id v3 = v44;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v46[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v20 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v45) {
              goto LABEL_34;
            }
            unint64_t v27 = v46[v20];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v28;
      }
    }
LABEL_21:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v20 << 6);
    uint64_t v21 = v51;
LABEL_22:
    uint64_t v29 = v8;
    uint64_t v30 = *(void *)(v8 + 72);
    unint64_t v31 = *(void *)(v11 + 48) + v30 * v24;
    if (v50)
    {
      (*v52)(v21, v31, v53);
      uint64_t v32 = *(void *)(v11 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_2180010D4(v32 + v33 * v24, v54);
    }
    else
    {
      (*v47)(v21, v31, v53);
      uint64_t v34 = *(void *)(v11 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_218001594(v34 + v33 * v24, v54, type metadata accessor for PreviewApplication.PreviewSessionMap);
    }
    sub_218001448(&qword_267BBA4A0, MEMORY[0x263F07508]);
    uint64_t result = sub_2180385C4();
    uint64_t v35 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v36 = result & ~v35;
    unint64_t v37 = v36 >> 6;
    if (((-1 << v36) & ~*(void *)(v18 + 8 * (v36 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v36) & ~*(void *)(v18 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v21 = v51;
    }
    else
    {
      char v38 = 0;
      unint64_t v39 = (unint64_t)(63 - v35) >> 6;
      uint64_t v21 = v51;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v40 = v37 == v39;
        if (v37 == v39) {
          unint64_t v37 = 0;
        }
        v38 |= v40;
        uint64_t v41 = *(void *)(v18 + 8 * v37);
      }
      while (v41 == -1);
      unint64_t v22 = __clz(__rbit64(~v41)) + (v37 << 6);
    }
    *(void *)(v18 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v52)((char *)(*(void *)(v13 + 48) + v30 * v22), (unint64_t)v21, v53);
    uint64_t result = sub_2180010D4(v54, *(void *)(v13 + 56) + v33 * v22);
    ++*(void *)(v13 + 16);
    uint64_t v11 = v48;
    uint64_t v8 = v29;
  }
  swift_release();
  id v3 = v44;
  uint64_t v26 = v46;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v42 = 1 << *(unsigned char *)(v11 + 32);
  if (v42 >= 64) {
    bzero(v26, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v26 = -1 << v42;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *id v3 = v13;
  return result;
}

uint64_t sub_217FFE308(uint64_t a1, char a2)
{
  id v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA268);
  uint64_t v6 = sub_218038B44();
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
              id v3 = v2;
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
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_217FF363C(v24, v35);
      }
      else
      {
        sub_217FE7A00((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_218038C24();
      sub_2180386B4();
      uint64_t result = sub_218038C44();
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
      void *v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_217FF363C(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *id v3 = v7;
  return result;
}

unint64_t sub_217FFE608(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_218037DF4();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_218038A14();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v39 = (result + 1) & v12;
      unint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      unint64_t v37 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      char v38 = v14;
      uint64_t v36 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v15;
        int64_t v18 = v15 * v11;
        v38(v8, *(void *)(a2 + 48) + v15 * v11, v4);
        sub_218001448(&qword_267BBA4A0, MEMORY[0x263F07508]);
        uint64_t v19 = sub_2180385C4();
        unint64_t result = (*v37)(v8, v4);
        unint64_t v20 = v19 & v12;
        if (a1 >= (uint64_t)v39)
        {
          if (v20 >= v39 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            if (v17 * a1 < v18
              || *(void *)(a2 + 48) + v17 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v18 + v17))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v17 * a1 != v18)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v23 = *(void *)(a2 + 56);
            uint64_t v24 = *(void *)(*(void *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8)
                            + 72);
            int64_t v25 = v24 * a1;
            unint64_t result = v23 + v24 * a1;
            int64_t v26 = v24 * v11;
            unint64_t v27 = v23 + v24 * v11 + v24;
            BOOL v28 = v25 < v26 || result >= v27;
            uint64_t v9 = v16;
            if (v28)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v11;
              uint64_t v12 = v36;
            }
            else
            {
              a1 = v11;
              uint64_t v12 = v36;
              if (v25 != v26)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v11;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v39 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
        uint64_t v15 = v17;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    unint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    unint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  uint64_t *v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_217FFE950(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_218037DF4();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_2180086B4(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_217FFEDD4();
      goto LABEL_7;
    }
    sub_217FFDE18(v17, a3 & 1);
    unint64_t v24 = sub_2180086B4(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      unint64_t v14 = v24;
      unint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_217FFEC8C(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_218038BD4();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = v21
      + *(void *)(*(void *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8) + 72) * v14;

  return sub_2180013E4(a1, v22);
}

_OWORD *sub_217FFEB38(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_21800874C(a2, a3);
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
      sub_217FFF100();
      goto LABEL_7;
    }
    sub_217FFE308(v15, a4 & 1);
    unint64_t v21 = sub_21800874C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      char v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_218038BD4();
    __break(1u);
    return result;
  }
LABEL_7:
  char v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_217FF363C(a1, v19);
  }
LABEL_13:
  sub_217FFED68(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_217FFEC8C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_218037DF4();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  uint64_t result = sub_2180010D4(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

_OWORD *sub_217FFED68(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_217FF363C(a4, (_OWORD *)(a5[7] + 32 * a1));
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

void *sub_217FFEDD4()
{
  uint64_t v1 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  uint64_t v29 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1 - 8);
  id v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_218037DF4();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA250);
  unint64_t v24 = v0;
  uint64_t v8 = *v0;
  uint64_t v9 = sub_218038B34();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t *v24 = v10;
    return result;
  }
  uint64_t result = (void *)(v9 + 64);
  unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12) {
    uint64_t result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  }
  int64_t v13 = 0;
  *(void *)(v10 + 16) = *(void *)(v8 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v8 + 64);
  uint64_t v25 = v8 + 64;
  int64_t v26 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v27 = v5 + 32;
  uint64_t v28 = v5 + 16;
  while (1)
  {
    if (v16)
    {
      unint64_t v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v21 >= v26) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v25 + 8 * v21);
    ++v13;
    if (!v22)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v26) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v25 + 8 * v13);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v16 = (v22 - 1) & v22;
    unint64_t v18 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v5 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(void *)(v8 + 48) + v19, v4);
    unint64_t v20 = *(void *)(v29 + 72) * v18;
    sub_218001594(*(void *)(v8 + 56) + v20, (uint64_t)v3, type metadata accessor for PreviewApplication.PreviewSessionMap);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(void *)(v10 + 48) + v19, v7, v4);
    uint64_t result = (void *)sub_2180010D4((uint64_t)v3, *(void *)(v10 + 56) + v20);
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v26) {
    goto LABEL_23;
  }
  unint64_t v22 = *(void *)(v25 + 8 * v23);
  if (v22)
  {
    int64_t v13 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v13 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v13 >= v26) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v25 + 8 * v13);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_217FFF100()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA268);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_218038B34();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
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
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_217FE7A00(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = v19;
    v21[1] = v18;
    sub_217FF363C(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
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

id sub_217FFF2E8(uint64_t *a1)
{
  uint64_t v2 = sub_218037D74();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  v72 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v70 = (char *)&v69 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v69 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  int64_t v13 = (char *)&v69 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v69 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v69 - v17;
  uint64_t v19 = type metadata accessor for PreviewItem.Source(0);
  MEMORY[0x270FA5388](v19 - 8);
  int64_t v21 = (char *)&v69 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = a1[1];
  uint64_t v71 = *a1;
  uint64_t v74 = a1[2];
  uint64_t v23 = type metadata accessor for PreviewItem(0);
  sub_218001594((uint64_t)a1 + *(int *)(v23 + 24), (uint64_t)v21, type metadata accessor for PreviewItem.Source);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v18, v21, v2);
  sub_217FF207C(0, &qword_267BBA270);
  uint64_t v75 = v3;
  int64_t v24 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  uint64_t v25 = v18;
  int64_t v26 = v18;
  uint64_t v27 = v2;
  v24(v16, v26, v2);
  uint64_t v73 = v22;
  swift_bridgeObjectRetain();
  id v28 = sub_217FFCAA4((uint64_t)v16, 0);
  uint64_t v42 = v28;
  if (v28)
  {
    uint64_t v43 = v25;
    if (qword_267BB94E8 != -1) {
      swift_once();
    }
    uint64_t v44 = sub_2180381D4();
    __swift_project_value_buffer(v44, (uint64_t)qword_267BBA170);
    int64_t v45 = v25;
    uint64_t v31 = v27;
    v24(v13, v45, v27);
    uint64_t v46 = sub_2180381B4();
    os_log_type_t v47 = sub_218038914();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = v13;
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      v72 = (char *)swift_slowAlloc();
      v77[0] = (uint64_t)v72;
      *(_DWORD *)uint64_t v49 = 136315138;
      sub_218001448(&qword_267BBA278, MEMORY[0x263F06EA8]);
      uint64_t v50 = sub_218038B84();
      uint64_t v76 = sub_217FE6C68(v50, v51, v77);
      sub_2180389D4();
      swift_bridgeObjectRelease();
      uint64_t v41 = *(void (**)(char *, uint64_t))(v75 + 8);
      v41(v48, v31);
      _os_log_impl(&dword_217F61000, v46, v47, "Readwrite sandbox wrapper created for PreviewItem %s", v49, 0xCu);
      id v52 = v72;
      swift_arrayDestroy();
      MEMORY[0x21D460050](v52, -1, -1);
      MEMORY[0x21D460050](v49, -1, -1);
    }
    else
    {
      uint64_t v41 = *(void (**)(char *, uint64_t))(v75 + 8);
      v41(v13, v27);
    }

    if (v73)
    {
LABEL_24:
      uint64_t v53 = (void *)sub_2180385F4();
      swift_bridgeObjectRelease();
LABEL_28:
      id v66 = objc_allocWithZone(MEMORY[0x263F62978]);
      id v65 = objc_msgSend(v66, sel_initWithURLSandboxWrapper_previewTitle_editingMode_, v42, v53, v74);
      goto LABEL_29;
    }
LABEL_27:
    uint64_t v53 = 0;
    goto LABEL_28;
  }
  uint64_t v29 = v25;
  uint64_t v30 = v25;
  uint64_t v31 = v27;
  v24(v10, v30, v27);
  id v32 = sub_217FFCAA4((uint64_t)v10, 1);
  uint64_t v42 = v32;
  uint64_t v54 = v72;
  if (v32)
  {
    if (qword_267BB94E8 != -1) {
      swift_once();
    }
    uint64_t v55 = sub_2180381D4();
    __swift_project_value_buffer(v55, (uint64_t)qword_267BBA170);
    uint64_t v56 = v70;
    v72 = v29;
    v24(v70, v29, v27);
    id v57 = sub_2180381B4();
    os_log_type_t v58 = sub_218038914();
    if (os_log_type_enabled(v57, v58))
    {
      id v59 = v56;
      id v60 = (uint8_t *)swift_slowAlloc();
      uint64_t v61 = swift_slowAlloc();
      v77[0] = v61;
      *(_DWORD *)id v60 = 136315138;
      sub_218001448(&qword_267BBA278, MEMORY[0x263F06EA8]);
      uint64_t v62 = sub_218038B84();
      uint64_t v76 = sub_217FE6C68(v62, v63, v77);
      sub_2180389D4();
      swift_bridgeObjectRelease();
      uint64_t v41 = *(void (**)(char *, uint64_t))(v75 + 8);
      v41(v59, v31);
      _os_log_impl(&dword_217F61000, v57, v58, "Readonly sandbox wrapper created for PreviewItem %s", v60, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D460050](v61, -1, -1);
      MEMORY[0x21D460050](v60, -1, -1);
    }
    else
    {
      uint64_t v41 = *(void (**)(char *, uint64_t))(v75 + 8);
      v41(v56, v27);
    }

    uint64_t v43 = v72;
    if (v73) {
      goto LABEL_24;
    }
    goto LABEL_27;
  }
  if (qword_267BB94E8 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_2180381D4();
  __swift_project_value_buffer(v33, (uint64_t)qword_267BBA170);
  uint64_t v34 = v29;
  v24(v54, v29, v27);
  uint64_t v35 = sub_2180381B4();
  os_log_type_t v36 = sub_2180388F4();
  if (os_log_type_enabled(v35, v36))
  {
    unint64_t v37 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    v77[0] = v38;
    *(_DWORD *)unint64_t v37 = 136315138;
    sub_218001448(&qword_267BBA278, MEMORY[0x263F06EA8]);
    uint64_t v39 = sub_218038B84();
    uint64_t v76 = sub_217FE6C68(v39, v40, v77);
    uint64_t v31 = v27;
    sub_2180389D4();
    swift_bridgeObjectRelease();
    uint64_t v41 = *(void (**)(char *, uint64_t))(v75 + 8);
    v41(v54, v27);
    _os_log_impl(&dword_217F61000, v35, v36, "Couod not create sandbox wrapper created for PreviewItem %s", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v38, -1, -1);
    MEMORY[0x21D460050](v37, -1, -1);
  }
  else
  {
    uint64_t v41 = *(void (**)(char *, uint64_t))(v75 + 8);
    v41(v54, v27);
  }

  uint64_t v43 = v34;
  uint64_t v53 = (void *)sub_218037D34();
  if (v73)
  {
    uint64_t v42 = (void *)sub_2180385F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v42 = 0;
  }
  id v64 = objc_allocWithZone(MEMORY[0x263F62978]);
  id v65 = objc_msgSend(v64, sel_initWithURL_previewTitle_editingMode_, v53, v42, v74);
LABEL_29:
  id v67 = v65;

  v41(v43, v31);
  return v67;
}

uint64_t sub_217FFFC28(unint64_t a1)
{
  if (a1 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_218038B24();
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      uint64_t v3 = 4;
      do
      {
        uint64_t v4 = v3 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          MEMORY[0x21D45EB20](v3 - 4, a1);
          uint64_t v5 = v3 - 3;
          if (__OFADD__(v4, 1)) {
            goto LABEL_24;
          }
        }
        else
        {
          swift_unknownObjectRetain();
          uint64_t v5 = v3 - 3;
          if (__OFADD__(v4, 1))
          {
LABEL_24:
            __break(1u);
            goto LABEL_25;
          }
        }
        self;
        uint64_t v6 = swift_dynamicCastObjCClass();
        if (v6)
        {
          uint64_t v7 = (void *)v6;
          swift_unknownObjectRetain();
          if (objc_msgSend(v7, sel_previewItemDataProvider))
          {
            swift_bridgeObjectRelease();
            swift_unknownObjectRelease();
            if (qword_267BB94E8 != -1) {
              swift_once();
            }
            uint64_t v9 = sub_2180381D4();
            __swift_project_value_buffer(v9, (uint64_t)qword_267BBA170);
            uint64_t v10 = sub_2180381B4();
            os_log_type_t v11 = sub_2180388F4();
            if (os_log_type_enabled(v10, v11))
            {
              uint64_t v12 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v12 = 0;
              int64_t v13 = "Invalid QLItem dataProvider found in preview items.";
              goto LABEL_22;
            }
LABEL_23:

            swift_unknownObjectRelease_n();
            return 0;
          }
          id v8 = objc_msgSend(v7, sel_previewItemData);
          if (v8)
          {
            uint64_t v14 = v8;
            uint64_t v15 = sub_218037DA4();
            unint64_t v17 = v16;

            sub_217FF6DDC(v15, v17);
            swift_bridgeObjectRelease();
            if (qword_267BB94E8 != -1) {
              swift_once();
            }
            uint64_t v18 = sub_2180381D4();
            __swift_project_value_buffer(v18, (uint64_t)qword_267BBA170);
            uint64_t v10 = sub_2180381B4();
            os_log_type_t v11 = sub_2180388F4();
            if (os_log_type_enabled(v10, v11))
            {
              uint64_t v12 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v12 = 0;
              int64_t v13 = "Invalid QLItem data found in preview items.";
LABEL_22:
              _os_log_impl(&dword_217F61000, v10, v11, v13, v12, 2u);
              MEMORY[0x21D460050](v12, -1, -1);
            }
            goto LABEL_23;
          }
          swift_unknownObjectRelease();
        }
        swift_unknownObjectRelease();
        ++v3;
      }
      while (v5 != v2);
    }
  }
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_217FFFF10(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA230);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  int64_t v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v27 - v14;
  if (qword_267BB94F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v16 = qword_267BBD3A8;
  if (!*(void *)(qword_267BBD3A8 + 16)) {
    return swift_endAccess();
  }
  unint64_t v17 = sub_2180086B4(a1);
  if ((v18 & 1) == 0) {
    return swift_endAccess();
  }
  sub_218001594(*(void *)(v16 + 56) + *(void *)(v10 + 72) * v17, (uint64_t)v13, type metadata accessor for PreviewApplication.PreviewSessionMap);
  sub_2180010D4((uint64_t)v13, (uint64_t)v15);
  swift_endAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420);
  v27[1] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  sub_218038844();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v19 = &v15[*(int *)(v9 + 24)];
  uint64_t v20 = *((void *)v19 + 1);
  if (v20)
  {
    uint64_t v21 = *(void *)v19;
    uint64_t v22 = sub_218038824();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v4, 1, 1, v22);
    sub_2180387F4();
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_2180387E4();
    int64_t v24 = (void *)swift_allocObject();
    uint64_t v25 = MEMORY[0x263F8F500];
    v24[2] = v23;
    v24[3] = v25;
    v24[4] = v21;
    v24[5] = v20;
    sub_21801A818((uint64_t)v4, (uint64_t)&unk_267BBA260, (uint64_t)v24);
    swift_release();
  }
  return sub_218001138((uint64_t)v15);
}

void sub_21800026C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_218038A24();
    sub_217FF207C(0, &qword_267BBA218);
    sub_218001258();
    sub_2180388C4();
    uint64_t v5 = v31;
    uint64_t v28 = v32;
    uint64_t v6 = v33;
    int64_t v7 = v34;
    unint64_t v8 = v35;
  }
  else
  {
    uint64_t v9 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v28 = a1 + 56;
    uint64_t v10 = ~v9;
    uint64_t v11 = -v9;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v8 = v12 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v6 = v10;
    int64_t v7 = 0;
  }
  uint64_t v26 = v6;
  int64_t v27 = (unint64_t)(v6 + 64) >> 6;
  int64_t v29 = v7;
  unint64_t v30 = v8;
  if (v5 < 0) {
    goto LABEL_10;
  }
LABEL_8:
  if (v8)
  {
    unint64_t v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v14 = v13 | (v7 << 6);
    goto LABEL_29;
  }
  int64_t v16 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    if (v16 < v27)
    {
      unint64_t v17 = *(void *)(v28 + 8 * v16);
      ++v7;
      if (v17) {
        goto LABEL_28;
      }
      int64_t v7 = v16 + 1;
      if (v16 + 1 >= v27) {
        goto LABEL_36;
      }
      unint64_t v17 = *(void *)(v28 + 8 * v7);
      if (v17) {
        goto LABEL_28;
      }
      int64_t v7 = v16 + 2;
      if (v16 + 2 >= v27) {
        goto LABEL_36;
      }
      unint64_t v17 = *(void *)(v28 + 8 * v7);
      if (v17) {
        goto LABEL_28;
      }
      int64_t v7 = v16 + 3;
      if (v16 + 3 >= v27) {
        goto LABEL_36;
      }
      unint64_t v17 = *(void *)(v28 + 8 * v7);
      if (v17)
      {
LABEL_28:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v14 = __clz(__rbit64(v17)) + (v7 << 6);
LABEL_29:
        id v15 = *(id *)(*(void *)(v5 + 48) + 8 * v14);
        if (v15)
        {
          while (1)
          {
            id v19 = objc_msgSend(v15, sel_session, v26);
            uint64_t v20 = a3;
            id v21 = objc_msgSend(v19, sel_persistentIdentifier);

            uint64_t v22 = sub_218038624();
            uint64_t v24 = v23;

            a3 = v20;
            if (v22 == a2 && v24 == v20) {
              break;
            }
            char v25 = sub_218038BB4();
            swift_bridgeObjectRelease();
            if (v25) {
              goto LABEL_36;
            }

            int64_t v29 = v7;
            unint64_t v30 = v8;
            if ((v5 & 0x8000000000000000) == 0) {
              goto LABEL_8;
            }
LABEL_10:
            if (sub_218038A44())
            {
              sub_217FF207C(0, &qword_267BBA218);
              swift_unknownObjectRetain();
              swift_dynamicCast();
              id v15 = v36;
              swift_unknownObjectRelease();
              unint64_t v8 = v30;
              if (v36) {
                continue;
              }
            }
            goto LABEL_36;
          }
          swift_bridgeObjectRelease();
        }
        goto LABEL_36;
      }
      int64_t v7 = v16 + 4;
      if (v16 + 4 < v27)
      {
        unint64_t v17 = *(void *)(v28 + 8 * v7);
        if (!v17)
        {
          uint64_t v18 = v29 + 6;
          while (v27 != v18)
          {
            unint64_t v17 = *(void *)(v28 + 8 * v18++);
            if (v17)
            {
              int64_t v7 = v18 - 1;
              goto LABEL_28;
            }
          }
          goto LABEL_36;
        }
        goto LABEL_28;
      }
    }
LABEL_36:
    sub_217FF57AC();
    return;
  }
  __break(1u);
}

uint64_t sub_218000600(uint64_t a1, void *a2)
{
  id v25 = a2;
  uint64_t v28 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA228);
  MEMORY[0x270FA5388](v2 - 8);
  int64_t v27 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_218037DF4();
  uint64_t v26 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA230);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  unint64_t v17 = (char *)&v24 - v16;
  if (qword_267BB94F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v18 = qword_267BBD3A8;
  if (!*(void *)(qword_267BBD3A8 + 16)) {
    return swift_endAccess();
  }
  unint64_t v19 = sub_2180086B4(v28);
  if ((v20 & 1) == 0) {
    return swift_endAccess();
  }
  sub_218001594(*(void *)(v18 + 56) + *(void *)(v12 + 72) * v19, (uint64_t)v15, type metadata accessor for PreviewApplication.PreviewSessionMap);
  sub_2180010D4((uint64_t)v15, (uint64_t)v17);
  swift_endAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420);
  id v29 = v25;
  id v21 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  sub_218038844();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_218038854();
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v6, v28, v4);
  uint64_t v22 = (uint64_t)v27;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v27, 1, 1, v11);
  swift_beginAccess();
  sub_217FFD144(v22, (uint64_t)v6);
  swift_endAccess();
  return sub_218001138((uint64_t)v17);
}

uint64_t sub_2180009AC(uint64_t a1)
{
  uint64_t v36 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA228);
  MEMORY[0x270FA5388](v1 - 8);
  unint64_t v35 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_218037DF4();
  uint64_t v33 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA230);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  unint64_t v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  unint64_t v19 = (char *)&v32 - v18;
  if (qword_267BB94F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v20 = qword_267BBD3A8;
  if (!*(void *)(qword_267BBD3A8 + 16)) {
    return swift_endAccess();
  }
  unint64_t v21 = sub_2180086B4(v36);
  if ((v22 & 1) == 0) {
    return swift_endAccess();
  }
  sub_218001594(*(void *)(v20 + 56) + *(void *)(v14 + 72) * v21, (uint64_t)v17, type metadata accessor for PreviewApplication.PreviewSessionMap);
  sub_2180010D4((uint64_t)v17, (uint64_t)v19);
  swift_endAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420);
  uint64_t v37 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  sub_218038844();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_218038854();
  uint64_t v23 = &v19[*(int *)(v13 + 24)];
  uint64_t v24 = *((void *)v23 + 1);
  if (v24)
  {
    uint64_t v25 = *(void *)v23;
    uint64_t v26 = sub_218038824();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v8, 1, 1, v26);
    sub_2180387F4();
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_2180387E4();
    uint64_t v28 = (void *)swift_allocObject();
    uint64_t v29 = MEMORY[0x263F8F500];
    v28[2] = v27;
    v28[3] = v29;
    v28[4] = v25;
    v28[5] = v24;
    sub_21801A818((uint64_t)v8, (uint64_t)&unk_267BBA248, (uint64_t)v28);
    swift_release();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v5, v36, v34);
  uint64_t v30 = (uint64_t)v35;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v35, 1, 1, v13);
  swift_beginAccess();
  sub_217FFD144(v30, (uint64_t)v5);
  swift_endAccess();
  return sub_218001138((uint64_t)v19);
}

uint64_t sub_218000E48(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v23 - v10;
  if (qword_267BB94F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v12 = qword_267BBD3A8;
  if (!*(void *)(qword_267BBD3A8 + 16)) {
    return swift_endAccess();
  }
  unint64_t v13 = sub_2180086B4(a1);
  if ((v14 & 1) == 0) {
    return swift_endAccess();
  }
  sub_218001594(*(void *)(v12 + 56) + *(void *)(v6 + 72) * v13, (uint64_t)v9, type metadata accessor for PreviewApplication.PreviewSessionMap);
  sub_2180010D4((uint64_t)v9, (uint64_t)v11);
  swift_endAccess();
  uint64_t v15 = &v11[*(int *)(v5 + 24)];
  uint64_t v16 = *((void *)v15 + 1);
  if (v16)
  {
    uint64_t v17 = *(void *)v15;
    uint64_t v18 = sub_218038824();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v4, 1, 1, v18);
    sub_2180387F4();
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_2180387E4();
    uint64_t v20 = (void *)swift_allocObject();
    uint64_t v21 = MEMORY[0x263F8F500];
    v20[2] = v19;
    v20[3] = v21;
    v20[4] = v17;
    v20[5] = v16;
    sub_21801A818((uint64_t)v4, (uint64_t)&unk_267BBA210, (uint64_t)v20);
    swift_release();
  }
  return sub_218001138((uint64_t)v11);
}

uint64_t sub_2180010D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_218001138(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_218001198(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_217FF2264;
  return sub_217FFCC04(a1, v4, v5, v7, v6);
}

unint64_t sub_218001258()
{
  unint64_t result = qword_267BBA220;
  if (!qword_267BBA220)
  {
    sub_217FF207C(255, &qword_267BBA218);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA220);
  }
  return result;
}

uint64_t sub_2180012C4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_217FF1CC0;
  return sub_217FFCDB4(a1, v4, v5, v7, v6);
}

uint64_t sub_218001384(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA228);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2180013E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_218001448(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2180014D4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_217FF2264;
  return sub_217FFCC04(a1, v4, v5, v7, v6);
}

uint64_t sub_218001594(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_218001648()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed);
  swift_beginAccess();
  return *v1;
}

id sub_2180016E4(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed);
  swift_beginAccess();
  *uint64_t v3 = a1;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC9QuickLook14QLGradientView_gradientLayer);
  if (a1) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  if (a1) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  objc_msgSend(v4, sel_setStartPoint_, 0.5, v5);
  return objc_msgSend(v4, sel_setEndPoint_, 0.5, v6);
}

void (*sub_21800178C(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_2180017F8;
}

void sub_2180017F8(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = v3[3];
    double v5 = *(void **)(v4 + OBJC_IVAR____TtC9QuickLook14QLGradientView_gradientLayer);
    if (*(unsigned char *)(v4 + v3[4])) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.0;
    }
    if (*(unsigned char *)(v4 + v3[4])) {
      double v7 = 0.0;
    }
    else {
      double v7 = 1.0;
    }
    objc_msgSend(v5, sel_setStartPoint_, 0.5, v6);
    objc_msgSend(v5, sel_setEndPoint_, 0.5, v7);
  }

  free(v3);
}

id QLGradientView.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id QLGradientView.init()()
{
  v0[OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed] = 0;
  uint64_t v1 = OBJC_IVAR____TtC9QuickLook14QLGradientView_gradientLayer;
  id v2 = objc_allocWithZone(MEMORY[0x263F157D0]);
  uint64_t v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_init);

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for QLGradientView();
  id v4 = objc_msgSendSuper2(&v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_218001AF8();

  return v4;
}

uint64_t type metadata accessor for QLGradientView()
{
  return self;
}

void sub_218001AF8()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC9QuickLook14QLGradientView_gradientLayer];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BB9D70);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_218044630;
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithWhite_alpha_, 0.0, 0.5);
  id v4 = objc_msgSend(v3, sel_CGColor);

  type metadata accessor for CGColor(0);
  uint64_t v6 = v5;
  *(void *)(v2 + 56) = v5;
  *(void *)(v2 + 32) = v4;
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithWhite_alpha_, 0.0, 0.0);
  id v8 = objc_msgSend(v7, sel_CGColor);

  *(void *)(v2 + 8_Block_object_dispose(&STACK[0x360], 8) = v6;
  *(void *)(v2 + 64) = v8;
  uint64_t v9 = (void *)sub_218038754();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setColors_, v9);

  uint64_t v10 = &v0[OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed];
  swift_beginAccess();
  *uint64_t v10 = 0;
  objc_msgSend(v1, sel_setStartPoint_, 0.5, 0.0);
  objc_msgSend(v1, sel_setEndPoint_, 0.5, 1.0);
  id v11 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v11, sel_insertSublayer_atIndex_, v1, 0);
}

id QLGradientView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void QLGradientView.init(frame:)()
{
}

id QLGradientView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLGradientView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_218001E2C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

id sub_218001E80(char *a1)
{
  return sub_2180016E4(*a1);
}

uint64_t method lookup function for QLGradientView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for QLGradientView);
}

uint64_t dispatch thunk of QLGradientView.reversed.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of QLGradientView.reversed.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of QLGradientView.reversed.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t sub_218001F6C()
{
  uint64_t v0 = sub_2180381D4();
  __swift_allocate_value_buffer(v0, qword_267BBA290);
  __swift_project_value_buffer(v0, (uint64_t)qword_267BBA290);
  return sub_2180381C4();
}

uint64_t QLPreviewCollectionWrapper.hostProxy.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA2A8);
  sub_2180384F4();
  return v1;
}

uint64_t sub_218002020()
{
  return sub_218038504();
}

uint64_t QLPreviewCollectionWrapper.hostProxy.setter()
{
  return sub_218038504();
}

void (*QLPreviewCollectionWrapper.hostProxy.modify(void *a1))(void *a1)
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA2A8);
  v2[4] = sub_2180384E4();
  return sub_217FE5BF0;
}

uint64_t QLPreviewCollectionWrapper.$hostProxy.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA2A8);

  return MEMORY[0x270F04E10](v0);
}

uint64_t QLPreviewCollectionWrapper.init(hostProxy:)()
{
  type metadata accessor for QLAppExtensionSceneProxy(0);
  sub_218002E64(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);

  return sub_218038524();
}

uint64_t sub_2180021E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for QLPreviewCollectionWrapper();
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v36 = (uint64_t)v35 - v7;
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)v35 - v8;
  if (qword_267BB94F0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_2180381D4();
  uint64_t v11 = __swift_project_value_buffer(v10, (uint64_t)qword_267BBA290);
  sub_218002EAC(v1, (uint64_t)v9);
  v35[1] = v11;
  uint64_t v12 = sub_2180381B4();
  os_log_type_t v13 = sub_2180388D4();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v37 = v5;
  v35[0] = v2;
  if (v14)
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v39 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    sub_218002EAC((uint64_t)v9, v36);
    uint64_t v17 = sub_218038694();
    uint64_t v38 = sub_217FE6C68(v17, v18, &v39);
    sub_2180389D4();
    swift_bridgeObjectRelease();
    sub_218002F10((uint64_t)v9);
    _os_log_impl(&dword_217F61000, v12, v13, "Configuring %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v16, -1, -1);
    MEMORY[0x21D460050](v15, -1, -1);
  }
  else
  {
    sub_218002F10((uint64_t)v9);
  }

  uint64_t v19 = self;
  id v20 = objc_msgSend(v19, sel_previewCollectionClassName, v35[0]);
  if (!v20)
  {
    sub_218038624();
    id v20 = (id)sub_2180385F4();
    swift_bridgeObjectRelease();
  }
  sub_218038624();
  id v21 = objc_msgSend(v19, sel_previewCollectionWithClassName_, v20);

  uint64_t v41 = &unk_26C959350;
  uint64_t v42 = &unk_26C93B0F8;
  uint64_t v22 = swift_dynamicCastObjCProtocolConditional();
  if (v22)
  {
    uint64_t v23 = v22;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA2A8);
    sub_2180384F4();
    uint64_t v24 = v39;
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    uint64_t v39 = v24;
    sub_218002E64(&qword_267BB9860, (void (*)(uint64_t))type metadata accessor for QLAppExtensionSceneProxy);
    id v26 = v21;
    sub_218037E14();
    swift_release();
    swift_release();

    uint64_t v27 = (uint64_t)v37;
    sub_218002EAC(v1, (uint64_t)v37);
    uint64_t v28 = sub_2180381B4();
    os_log_type_t v29 = sub_2180388D4();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v39 = v31;
      *(_DWORD *)uint64_t v30 = 136315138;
      sub_218002EAC(v27, v36);
      uint64_t v32 = sub_218038694();
      uint64_t v38 = sub_217FE6C68(v32, v33, &v39);
      sub_2180389D4();
      swift_bridgeObjectRelease();
      sub_218002F10(v27);
      _os_log_impl(&dword_217F61000, v28, v29, "Configured %s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D460050](v31, -1, -1);
      MEMORY[0x21D460050](v30, -1, -1);
    }
    else
    {
      sub_218002F10(v27);
    }

    return v23;
  }
  else
  {

    uint64_t v39 = 0;
    unint64_t v40 = 0xE000000000000000;
    sub_218038A74();
    swift_bridgeObjectRelease();
    uint64_t v39 = 0xD00000000000002DLL;
    unint64_t v40 = 0x8000000218052560;
    sub_2180386E4();
    uint64_t result = sub_218038B14();
    __break(1u);
  }
  return result;
}

uint64_t sub_218002798()
{
  return sub_218002E64(&qword_267BBA2B0, (void (*)(uint64_t))type metadata accessor for QLPreviewCollectionWrapper);
}

uint64_t type metadata accessor for QLPreviewCollectionWrapper()
{
  uint64_t result = qword_267BBA2B8;
  if (!qword_267BBA2B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_218002830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_218002E64(qword_267BBA2D0, (void (*)(uint64_t))type metadata accessor for QLPreviewCollectionWrapper);

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_2180028C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_218002E64(qword_267BBA2D0, (void (*)(uint64_t))type metadata accessor for QLPreviewCollectionWrapper);

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_218002958()
{
}

uint64_t sub_2180029B0@<X0>(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA2A8);
  uint64_t result = sub_2180384F4();
  *a1 = v3;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for QLPreviewCollectionWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA2A8);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for QLPreviewCollectionWrapper(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA2A8);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for QLPreviewCollectionWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA2A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for QLPreviewCollectionWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA2A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for QLPreviewCollectionWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA2A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for QLPreviewCollectionWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA2A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for QLPreviewCollectionWrapper(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_218002C88);
}

uint64_t sub_218002C88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA2A8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for QLPreviewCollectionWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_218002D0C);
}

uint64_t sub_218002D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA2A8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_218002D80()
{
  sub_218002E0C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_218002E0C()
{
  if (!qword_267BBA2C8)
  {
    type metadata accessor for QLAppExtensionSceneProxy(255);
    unint64_t v0 = sub_218038534();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BBA2C8);
    }
  }
}

uint64_t sub_218002E64(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_218002EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for QLPreviewCollectionWrapper();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_218002F10(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for QLPreviewCollectionWrapper();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_218002F74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  type metadata accessor for QLGlobalAppExtensionConfiguration.ExportedObject();
  id v6 = sub_2180033B0(a1);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  *a3 = v6;
  return result;
}

Swift::Bool __swiftcall QLGlobalAppExtensionConfiguration.accept(connection:)(NSXPCConnection connection)
{
  return 0;
}

void sub_218002FF8()
{
}

id sub_21800303C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLGlobalAppExtensionConfiguration.ExportedObject();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2180030B0(void *a1)
{
  objc_super v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = *MEMORY[0x263F8EED0] & *a1;
  swift_release();
  uint64_t v4 = (char *)a1 + *(void *)((*v2 & *a1) + 0x68);
  uint64_t v5 = *(uint64_t (**)(char *))(*(void *)(*(void *)(v3 + 80) - 8) + 8);

  return v5(v4);
}

uint64_t sub_218003170()
{
  return 0;
}

uint64_t QLNonUIProxy.deinit()
{
  return v0;
}

uint64_t QLNonUIProxy.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for QLGlobalAppExtensionConfiguration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2180031AC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for QLGlobalAppExtensionConfiguration.ExportedObject()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for QLNonUIProxy()
{
  return self;
}

uint64_t method lookup function for QLNonUIProxy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for QLNonUIProxy);
}

id sub_2180032A4(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x263F8EED0];
  uint64_t v4 = *MEMORY[0x263F8EED0] & *(void *)v1;
  uint64_t v5 = *(void *)(v4 + 0x60);
  type metadata accessor for QLNonUIProxy();
  *(void *)&v1[v5] = swift_allocObject();
  (*(void (**)(char *, uint64_t, void))(*(void *)(*(void *)(v4 + 80) - 8) + 16))(&v1[*(void *)((*v3 & *(void *)v1) + 0x68)], a1, *(void *)(v4 + 80));
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for QLGlobalAppExtensionConfiguration.ExportedObject();
  return objc_msgSendSuper2(&v7, sel_init);
}

id sub_2180033B0(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for QLGlobalAppExtensionConfiguration.ExportedObject());
  return sub_2180032A4(a1);
}

void sub_2180033EC()
{
}

uint64_t sub_21800341C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_218038824();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_218038814();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_217FF6BD8(a1, (uint64_t *)&unk_267BBA400);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2180387A4();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_2180035A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_218038824();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_218038814();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_217FF6BD8(a1, (uint64_t *)&unk_267BBA400);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2180387A4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA588);
  return swift_task_create();
}

unint64_t sub_21800372C()
{
  unint64_t result = sub_21801048C(MEMORY[0x263F8EE78]);
  qword_267BBD3A8 = result;
  return result;
}

uint64_t sub_218003754()
{
  type metadata accessor for HostHandler();
  uint64_t result = swift_allocObject();
  qword_267BBD3B0 = result;
  return result;
}

uint64_t static PreviewApplication.open(urls:selectedURL:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v45 = a2;
  uint64_t v47 = type metadata accessor for PreviewItem(0);
  uint64_t v6 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BB9E80);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v44 = (uint64_t)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_218037D74();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v43 = (char *)&v39 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA3F8);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v42 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  id v21 = (char *)&v39 - v20;
  uint64_t v51 = a1;
  int64_t v22 = *(void *)(a1 + 16);
  uint64_t v23 = MEMORY[0x263F8EE78];
  uint64_t v46 = v3;
  if (v22)
  {
    uint64_t v39 = (char *)&v39 - v20;
    uint64_t v41 = a3;
    uint64_t v52 = MEMORY[0x263F8EE78];
    sub_218008C74(0, v22, 0);
    uint64_t v40 = v12;
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    uint64_t v25 = (char *)(v51 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)));
    uint64_t v48 = *(void *)(v12 + 72);
    uint64_t v49 = v24;
    id v26 = (void (**)(char *, uint64_t))(v12 + 8);
    uint64_t v27 = v47;
    uint64_t v50 = v11;
    uint64_t v51 = v6;
    do
    {
      uint64_t v28 = v49;
      v49(v15, v25, v11);
      v28(&v8[*(int *)(v27 + 24)], v15, v11);
      sub_218037DE4();
      *(void *)uint64_t v8 = 0;
      *((void *)v8 + 1) = 0;
      *((void *)v8 + 2) = 1;
      (*v26)(v15, v11);
      uint64_t v23 = v52;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_218008C74(0, *(void *)(v23 + 16) + 1, 1);
        uint64_t v27 = v47;
        uint64_t v23 = v52;
      }
      unint64_t v30 = *(void *)(v23 + 16);
      unint64_t v29 = *(void *)(v23 + 24);
      if (v30 >= v29 >> 1)
      {
        sub_218008C74(v29 > 1, v30 + 1, 1);
        uint64_t v27 = v47;
        uint64_t v23 = v52;
      }
      *(void *)(v23 + 16) = v30 + 1;
      uint64_t v6 = v51;
      sub_218009520((uint64_t)v8, v23+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v51 + 72) * v30, type metadata accessor for PreviewItem);
      v25 += v48;
      --v22;
      uint64_t v11 = v50;
    }
    while (v22);
    uint64_t v12 = v40;
    a3 = v41;
    id v21 = v39;
  }
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v32 = v47;
  v31(v21, 1, 1, v47);
  uint64_t v33 = v44;
  sub_217FF6F30(v45, v44, (uint64_t *)&unk_267BB9E80);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v33, 1, v11) == 1)
  {
    sub_217FF6BD8(v33, (uint64_t *)&unk_267BB9E80);
  }
  else
  {
    uint64_t v34 = a3;
    unint64_t v35 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v43, v33, v11);
    uint64_t v36 = v42;
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(&v42[*(int *)(v32 + 24)], v35, v11);
    sub_218037DE4();
    *(void *)uint64_t v36 = 0;
    *((void *)v36 + 1) = 0;
    *((void *)v36 + 2) = 1;
    uint64_t v37 = v35;
    a3 = v34;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v37, v11);
    sub_217FF6BD8((uint64_t)v21, &qword_267BBA3F8);
    v31(v36, 0, 1, v32);
    sub_218008C94((uint64_t)v36, (uint64_t)v21);
  }
  static PreviewApplication.open(items:selectedItem:)(v23, (uint64_t)v21, a3);
  swift_bridgeObjectRelease();
  return sub_217FF6BD8((uint64_t)v21, &qword_267BBA3F8);
}

uint64_t type metadata accessor for PreviewItem(uint64_t a1)
{
  return sub_217FF0300(a1, qword_267BBA518);
}

uint64_t PreviewItem.init(url:displayName:editingMode:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v10 = type metadata accessor for PreviewItem(0);
  sub_218037DE4();
  uint64_t v11 = (char *)a5 + *(int *)(v10 + 24);
  uint64_t v12 = sub_218037D74();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v11, a1, v12);
  *a5 = a2;
  a5[1] = a3;
  a5[2] = a4;
  return result;
}

uint64_t static PreviewApplication.open(items:selectedItem:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA3F8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PreviewItem(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (uint64_t *)((char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v27 - v16;
  uint64_t v18 = *(void *)(a1 + 16);
  unint64_t v19 = MEMORY[0x263F8EE78];
  uint64_t v31 = a1;
  uint64_t v32 = v15;
  if (v18)
  {
    uint64_t v27 = a2;
    uint64_t v29 = a3;
    uint64_t v30 = v3;
    v33[0] = MEMORY[0x263F8EE78];
    sub_218038AD4();
    uint64_t v20 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    uint64_t v28 = v11;
    uint64_t v21 = *(void *)(v11 + 72);
    uint64_t v22 = v18;
    do
    {
      sub_218009588(v20, (uint64_t)v14, type metadata accessor for PreviewItem);
      sub_217FFF2E8(v14);
      sub_218009ADC((uint64_t)v14, type metadata accessor for PreviewItem);
      sub_218038AB4();
      sub_218038AE4();
      sub_218038AF4();
      sub_218038AC4();
      v20 += v21;
      --v22;
    }
    while (v22);
    unint64_t v19 = v33[0];
    a3 = v29;
    a2 = v27;
    uint64_t v11 = v28;
  }
  sub_217FF6F30(a2, (uint64_t)v9, &qword_267BBA3F8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v32) == 1)
  {
    sub_217FF6BD8((uint64_t)v9, &qword_267BBA3F8);
    uint64_t v23 = -1;
  }
  else
  {
    sub_218009520((uint64_t)v9, (uint64_t)v17, type metadata accessor for PreviewItem);
    if (v18)
    {
      uint64_t v23 = 0;
      uint64_t v24 = v31 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
      uint64_t v25 = *(void *)(v11 + 72);
      while (!_s9QuickLook11PreviewItemV2eeoiySbAC_ACtFZ_0(v24, (uint64_t)v17))
      {
        ++v23;
        v24 += v25;
        if (v18 == v23) {
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      uint64_t v23 = -1;
    }
    sub_218009ADC((uint64_t)v17, type metadata accessor for PreviewItem);
  }
  v33[0] = 0;
  v33[1] = 0;
  v33[2] = 1;
  char v34 = 0;
  static PreviewApplication.open(items:selectedItemIndex:configuration:)(v19, v23, 0, (uint64_t)v33, a3);
  return swift_bridgeObjectRelease();
}

uint64_t static PreviewApplication.open(items:selectedItemIndex:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  v5[0] = 0;
  v5[1] = 0;
  v5[2] = 1;
  char v6 = 0;
  return static PreviewApplication.open(items:selectedItemIndex:configuration:)(a1, a2, a3 & 1, (uint64_t)v5, a4);
}

uint64_t static PreviewApplication.open(items:selectedItem:configuration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v40 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA3F8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PreviewItem(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (uint64_t *)((char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v31 - v16;
  long long v18 = *a3;
  uint64_t v19 = *((void *)a3 + 2);
  int v20 = *((unsigned __int8 *)a3 + 24);
  uint64_t v21 = *(void *)(a1 + 16);
  unint64_t v22 = MEMORY[0x263F8EE78];
  long long v39 = v18;
  uint64_t v36 = a1;
  uint64_t v38 = v15;
  if (v21)
  {
    int v33 = v20;
    uint64_t v34 = v19;
    uint64_t v35 = v4;
    *(void *)&long long v41 = MEMORY[0x263F8EE78];
    sub_218038AD4();
    uint64_t v23 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    uint64_t v32 = v11;
    uint64_t v24 = *(void *)(v11 + 72);
    uint64_t v25 = v21;
    do
    {
      sub_218009588(v23, (uint64_t)v14, type metadata accessor for PreviewItem);
      sub_217FFF2E8(v14);
      sub_218009ADC((uint64_t)v14, type metadata accessor for PreviewItem);
      sub_218038AB4();
      sub_218038AE4();
      sub_218038AF4();
      sub_218038AC4();
      v23 += v24;
      --v25;
    }
    while (v25);
    uint64_t v26 = v40;
    unint64_t v22 = v41;
    uint64_t v19 = v34;
    LOBYTE(v20) = v33;
    uint64_t v11 = v32;
  }
  else
  {
    uint64_t v26 = v40;
  }
  sub_217FF6F30(v37, (uint64_t)v9, &qword_267BBA3F8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v38) == 1)
  {
    sub_217FF6BD8((uint64_t)v9, &qword_267BBA3F8);
    uint64_t v27 = -1;
  }
  else
  {
    sub_218009520((uint64_t)v9, (uint64_t)v17, type metadata accessor for PreviewItem);
    if (v21)
    {
      uint64_t v27 = 0;
      uint64_t v28 = v36 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
      uint64_t v29 = *(void *)(v11 + 72);
      while (!_s9QuickLook11PreviewItemV2eeoiySbAC_ACtFZ_0(v28, (uint64_t)v17))
      {
        ++v27;
        v28 += v29;
        if (v21 == v27)
        {
          uint64_t v27 = -1;
          break;
        }
      }
      uint64_t v26 = v40;
    }
    else
    {
      uint64_t v27 = -1;
    }
    sub_218009ADC((uint64_t)v17, type metadata accessor for PreviewItem);
  }
  long long v41 = v39;
  uint64_t v42 = v19;
  char v43 = v20;
  static PreviewApplication.open(items:selectedItemIndex:configuration:)(v22, v27, 0, (uint64_t)&v41, v26);
  return swift_bridgeObjectRelease();
}

uint64_t static PreviewApplication.open(items:selectedItemIndex:configuration:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int v59 = a3;
  uint64_t v58 = a2;
  unint64_t v67 = a1;
  uint64_t v69 = a5;
  uint64_t v6 = sub_218037DF4();
  uint64_t v56 = *(void *)(v6 - 8);
  uint64_t v57 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v55 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v68 = (uint64_t)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  unint64_t v62 = *(void *)(v10 - 8);
  unint64_t v63 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
  uint64_t v13 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v15 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA418);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for PreviewSession(0);
  uint64_t v21 = v20 - 8;
  uint64_t v52 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v66 = (uint64_t)&v51 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v51 - v24;
  uint64_t v26 = *(void *)a4;
  uint64_t v53 = *(void *)(a4 + 8);
  uint64_t v54 = v26;
  uint64_t v65 = *(void *)(a4 + 16);
  int v64 = *(unsigned __int8 *)(a4 + 24);
  type metadata accessor for QLHostRemotePreviewModel();
  uint64_t v27 = swift_allocObject();
  sub_218037EC4();
  uint64_t v28 = v27 + OBJC_IVAR____TtC9QuickLook24QLHostRemotePreviewModel_previewApplicationProcess;
  uint64_t v29 = sub_218037F64();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v28, 1, 1, v29);
  uint64_t v30 = v27 + OBJC_IVAR____TtC9QuickLook24QLHostRemotePreviewModel_config;
  uint64_t v31 = sub_218037F34();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 1, 1, v31);
  uint64_t v32 = &v25[*(int *)(v21 + 32)];
  swift_retain();
  sub_218037DE4();
  (*(void (**)(char *, void, uint64_t))(v17 + 104))(v19, *MEMORY[0x263F8F580], v16);
  sub_218038834();
  uint64_t v33 = v16;
  unint64_t v34 = v67;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v33);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v25, v15, v61);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420);
  (*(void (**)(char *, char *, unint64_t))(v62 + 32))(&v25[*(int *)(v35 + 28)], v12, v63);
  *(void *)&v25[*(int *)(v21 + 28)] = v27;
  if (sub_217FFFC28(v34))
  {
    uint64_t v36 = sub_218038824();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v68, 1, 1, v36);
    sub_218009588((uint64_t)v25, v66, type metadata accessor for PreviewSession);
    sub_2180387F4();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v37 = v53;
    uint64_t v38 = v54;
    sub_2180095F0(v54, v53, v65);
    uint64_t v39 = sub_2180387E4();
    unint64_t v40 = (*(unsigned __int8 *)(v52 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
    unint64_t v41 = (v51 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v62 = (v41 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v63 = (v41 + 31) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v42 = (void *)swift_allocObject();
    uint64_t v43 = MEMORY[0x263F8F500];
    v42[2] = v39;
    v42[3] = v43;
    v42[4] = v27;
    sub_218009520(v66, (uint64_t)v42 + v40, type metadata accessor for PreviewSession);
    *(void *)((char *)v42 + v41) = v34;
    uint64_t v44 = (char *)v42 + v62;
    *(void *)uint64_t v44 = v58;
    v44[8] = v59 & 1;
    uint64_t v45 = (char *)v42 + v63;
    *(void *)uint64_t v45 = v38;
    *((void *)v45 + 1) = v37;
    *((void *)v45 + 2) = v65;
    v45[24] = v64;
    *(void *)((char *)v42 + ((v41 + 63) & 0xFFFFFFFFFFFFFFF8)) = v60;
    sub_21800341C(v68, (uint64_t)&unk_267BBA498, (uint64_t)v42);
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_267BB9500 != -1) {
      swift_once();
    }
    uint64_t v47 = (uint64_t)v55;
    uint64_t v46 = v56;
    uint64_t v48 = v57;
    (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v55, v32, v57);
    sub_2180094CC();
    uint64_t v49 = (void *)swift_allocError();
    swift_retain();
    sub_218000600(v47, v49);
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v47, v48);
  }
  return sub_218009520((uint64_t)v25, v69, type metadata accessor for PreviewSession);
}

uint64_t sub_218004B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(unsigned char *)(v8 + 357) = v16;
  *(void *)(v8 + 192) = v15;
  *(_OWORD *)(v8 + 176) = v14;
  *(unsigned char *)(v8 + 356) = a8;
  *(void *)(v8 + 160) = a6;
  *(void *)(v8 + 16_Block_object_dispose(&STACK[0x360], 8) = a7;
  *(void *)(v8 + 144) = a4;
  *(void *)(v8 + 152) = a5;
  *(void *)(v8 + 200) = type metadata accessor for PreviewSession(0);
  *(void *)(v8 + 20_Block_object_dispose(&STACK[0x360], 8) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA228);
  *(void *)(v8 + 216) = swift_task_alloc();
  uint64_t v9 = sub_218037DF4();
  *(void *)(v8 + 224) = v9;
  *(void *)(v8 + 232) = *(void *)(v9 - 8);
  *(void *)(v8 + 240) = swift_task_alloc();
  *(void *)(v8 + 24_Block_object_dispose(&STACK[0x360], 8) = swift_task_alloc();
  sub_2180387F4();
  *(void *)(v8 + 256) = sub_2180387E4();
  uint64_t v11 = sub_2180387A4();
  *(void *)(v8 + 264) = v11;
  *(void *)(v8 + 272) = v10;
  return MEMORY[0x270FA2498](sub_218004CBC, v11, v10);
}

uint64_t sub_218004CBC()
{
  if (qword_267BB9500 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v3 = qword_267BBD3B0;
  *(void *)(v0 + 280) = qword_267BBD3B0;
  uint64_t v4 = *(int *)(v1 + 24);
  *(_DWORD *)(v0 + 352) = v4;
  uint64_t v5 = v2 + v4;
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 28_Block_object_dispose(&STACK[0x360], 8) = v6;
  void *v6 = v0;
  v6[1] = sub_218004DB8;
  return sub_217FFBB20(v3, v5);
}

uint64_t sub_218004DB8(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[37] = a1;
  v3[38] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = v3[33];
    uint64_t v5 = v3[34];
    uint64_t v6 = sub_218005578;
  }
  else
  {
    swift_release();
    uint64_t v4 = v3[33];
    uint64_t v5 = v3[34];
    uint64_t v6 = sub_218004ED4;
  }
  return MEMORY[0x270FA2498](v6, v4, v5);
}

uint64_t sub_218004ED4()
{
  unint64_t v1 = *(void *)(v0 + 160);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_218038B24();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v2)
  {
    uint64_t v3 = sub_218038AD4();
    if (v2 < 0)
    {
      __break(1u);
      return MEMORY[0x270FA23F0](v3);
    }
    uint64_t v4 = *(void *)(v0 + 160);
    uint64_t v5 = self;
    uint64_t v6 = 0;
    uint64_t v7 = v4 + 32;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = MEMORY[0x21D45EB20](v6, *(void *)(v0 + 160));
      }
      else
      {
        uint64_t v8 = *(void *)(v7 + 8 * v6);
        swift_unknownObjectRetain();
      }
      ++v6;
      id v9 = objc_msgSend(v5, sel_itemWithPreviewItem_, v8);
      swift_unknownObjectRelease();
      sub_218038AB4();
      sub_218038AE4();
      sub_218038AF4();
      sub_218038AC4();
    }
    while (v2 != v6);
  }
  uint64_t v10 = *(void *)(v0 + 192);
  char v11 = *(unsigned char *)(v0 + 356);
  uint64_t v12 = *(void *)(v0 + 168);
  uint64_t v13 = sub_218037DC4();
  *(void *)(v0 + 312) = v13;
  sub_21800D454();
  uint64_t v14 = sub_218038754();
  *(void *)(v0 + 320) = v14;
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(self, sel_mainBundle);
  id v16 = objc_msgSend(v15, sel_bundleIdentifier);
  *(void *)(v0 + 32_Block_object_dispose(&STACK[0x360], 8) = v16;

  if (v10 == 1) {
    sub_2180106A8(MEMORY[0x263F8EE78]);
  }
  else {
    sub_218005838();
  }
  if (v11) {
    uint64_t v12 = -1;
  }
  uint64_t v17 = *(void **)(v0 + 296);
  uint64_t v18 = sub_2180385A4();
  *(void *)(v0 + 336) = v18;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_21800521C;
  uint64_t v19 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 8_Block_object_dispose(&STACK[0x360], 8) = 0x40000000;
  *(void *)(v0 + 96) = sub_2180059B8;
  *(void *)(v0 + 104) = &block_descriptor_43;
  *(void *)(v0 + 112) = v19;
  objc_msgSend(v17, sel_openWithSessionUUID_items_selectedIndex_bundleID_configuration_completionHandler_, v13, v14, v12, v16, v18, v0 + 80);
  uint64_t v3 = v0 + 16;
  return MEMORY[0x270FA23F0](v3);
}

uint64_t sub_21800521C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 344) = v2;
  uint64_t v3 = *(void *)(v1 + 272);
  uint64_t v4 = *(void *)(v1 + 264);
  if (v2) {
    uint64_t v5 = sub_2180056C8;
  }
  else {
    uint64_t v5 = sub_21800534C;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_21800534C()
{
  uint64_t v1 = *(void **)(v0 + 328);
  uint64_t v2 = *(void **)(v0 + 336);
  uint64_t v4 = *(void **)(v0 + 312);
  uint64_t v3 = *(void **)(v0 + 320);
  swift_release();

  if (qword_267BB94F8 != -1) {
    swift_once();
  }
  uint64_t v5 = *(void *)(v0 + 296);
  uint64_t v6 = *(void *)(v0 + 248);
  uint64_t v7 = *(void *)(v0 + 208);
  uint64_t v8 = *(void *)(v0 + 216);
  uint64_t v10 = *(void *)(v0 + 184);
  uint64_t v9 = *(void *)(v0 + 192);
  uint64_t v18 = *(void *)(v0 + 176);
  uint64_t v11 = *(void *)(v0 + 152);
  (*(void (**)(uint64_t, uint64_t, void))(*(void *)(v0 + 232) + 16))(v6, v11 + *(int *)(v0 + 352), *(void *)(v0 + 224));
  sub_218009588(v11, v7, type metadata accessor for PreviewSession);
  if (v9 == 1) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v10;
  }
  if (v9 == 1) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v9;
  }
  sub_218009520(v7, v8, type metadata accessor for PreviewSession);
  uint64_t v14 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  *(void *)(v8 + *(int *)(v14 + 20)) = v5;
  id v15 = (uint64_t *)(v8 + *(int *)(v14 + 24));
  uint64_t *v15 = v12;
  v15[1] = v13;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 0, 1, v14);
  swift_beginAccess();
  sub_2180095F0(v18, v10, v9);
  swift_unknownObjectRetain();
  sub_217FFD144(v8, v6);
  swift_endAccess();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_218005578()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 232);
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 16))(v1, *(void *)(v0 + 152) + *(int *)(v0 + 352), v2);
  sub_2180094CC();
  uint64_t v4 = (void *)swift_allocError();
  swift_retain();
  sub_218000600(v1, v4);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_2180056C8()
{
  uint64_t v1 = *(void **)(v0 + 336);
  uint64_t v3 = *(void **)(v0 + 320);
  uint64_t v2 = *(void **)(v0 + 328);
  uint64_t v4 = *(void **)(v0 + 312);
  swift_release();
  swift_willThrow();
  swift_unknownObjectRelease();

  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v6 = *(void *)(v0 + 224);
  uint64_t v7 = *(void *)(v0 + 232);
  (*(void (**)(uint64_t, void, uint64_t))(v7 + 16))(v5, *(void *)(v0 + 152) + *(int *)(v0 + 352), v6);
  sub_2180094CC();
  uint64_t v8 = (void *)swift_allocError();
  swift_retain();
  sub_218000600(v5, v8);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

unint64_t sub_218005838()
{
  char v1 = *v0;
  char v2 = v0[1];
  uint64_t v4 = *((void *)v0 + 1);
  uint64_t v3 = *((void *)v0 + 2);
  char v5 = v0[24];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA5B0);
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 32) = 0xD000000000000010;
  *(void *)(inited + 40) = 0x8000000218052650;
  uint64_t v7 = MEMORY[0x263F8D4F8];
  *(_OWORD *)(inited + 16) = xmmword_218044620;
  *(void *)(inited + 72) = v7;
  *(unsigned char *)(inited + 4_Block_object_dispose(&STACK[0x360], 8) = v1;
  if (qword_267BB9508 != -1) {
    swift_once();
  }
  uint64_t v8 = unk_267BBA3E8;
  *(void *)(inited + 80) = qword_267BBA3E0;
  *(void *)(inited + 8_Block_object_dispose(&STACK[0x360], 8) = v8;
  *(unsigned char *)(inited + 96) = v2;
  *(void *)(inited + 120) = v7;
  *(void *)(inited + 12_Block_object_dispose(&STACK[0x360], 8) = 0xD000000000000010;
  *(void *)(inited + 136) = 0x8000000218052690;
  *(void *)(inited + 16_Block_object_dispose(&STACK[0x360], 8) = v7;
  *(unsigned char *)(inited + 144) = v5;
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_2180106A8(inited);
  if (v3)
  {
    uint64_t v14 = MEMORY[0x263F8D310];
    *(void *)&long long v13 = v4;
    *((void *)&v13 + 1) = v3;
    sub_217FF363C(&v13, v12);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_217FFEB38(v12, 0xD000000000000015, 0x8000000218052670, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  return v9;
}

uint64_t sub_2180059B8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA590);
    uint64_t v4 = swift_allocError();
    *char v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return MEMORY[0x270FA2408](v7);
  }
}

unint64_t static PreviewApplication.PreviewConfiguration.hideDocumentMenuKey.getter()
{
  return 0xD000000000000010;
}

void sub_218005A6C()
{
  qword_267BBA3E0 = 0x736F6C43776F6873;
  unk_267BBA3E8 = 0xEF6E6F7474754265;
}

uint64_t static PreviewApplication.PreviewConfiguration.showCloseButtonKey.getter()
{
  if (qword_267BB9508 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_267BBA3E0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t static PreviewApplication.PreviewConfiguration.matchScenePlacementIDKey.getter()
{
  return 0xD000000000000015;
}

unint64_t static PreviewApplication.PreviewConfiguration.isContentManaged.getter()
{
  return 0xD000000000000010;
}

uint64_t PreviewApplication.PreviewConfiguration.hideDocumentMenu.getter()
{
  return *v0;
}

uint64_t PreviewApplication.PreviewConfiguration.hideDocumentMenu.setter(uint64_t result)
{
  *char v1 = result;
  return result;
}

uint64_t (*PreviewApplication.PreviewConfiguration.hideDocumentMenu.modify())()
{
  return QLPHDisplayVelocityFromQLPXDisplayVelocity;
}

uint64_t PreviewApplication.PreviewConfiguration.showCloseButton.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t PreviewApplication.PreviewConfiguration.showCloseButton.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*PreviewApplication.PreviewConfiguration.showCloseButton.modify())()
{
  return QLPHDisplayVelocityFromQLPXDisplayVelocity;
}

uint64_t PreviewApplication.PreviewConfiguration.matchScenePlacementID.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewApplication.PreviewConfiguration.matchScenePlacementID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + _Block_object_dispose(&STACK[0x360], 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*PreviewApplication.PreviewConfiguration.matchScenePlacementID.modify())()
{
  return QLPHDisplayVelocityFromQLPXDisplayVelocity;
}

uint64_t PreviewApplication.PreviewConfiguration.isContentManaged.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t PreviewApplication.PreviewConfiguration.isContentManaged.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 24) = result;
  return result;
}

uint64_t (*PreviewApplication.PreviewConfiguration.isContentManaged.modify())()
{
  return QLPHDisplayVelocityFromQLPXDisplayVelocity;
}

QuickLook::PreviewApplication::PreviewConfiguration __swiftcall PreviewApplication.PreviewConfiguration.init()()
{
  *(_WORD *)uint64_t v0 = 0;
  *(void *)(v0 + _Block_object_dispose(&STACK[0x360], 8) = 0;
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 24) = 0;
  return result;
}

uint64_t PreviewApplication.deinit()
{
  return v0;
}

uint64_t PreviewApplication.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t PreviewItem.displayName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewItem.editingMode.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t PreviewItem.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PreviewItem(0) + 28);
  uint64_t v4 = sub_218037DF4();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t PreviewItem.hash(into:)()
{
  return sub_2180385D4();
}

uint64_t PreviewItem.hashValue.getter()
{
  return sub_218038C44();
}

uint64_t sub_218005E54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 28);
  uint64_t v5 = sub_218037DF4();
  id v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_218005EC4()
{
  return sub_218038C44();
}

uint64_t sub_218005F58()
{
  return sub_2180385D4();
}

uint64_t sub_218005FD8()
{
  return sub_218038C44();
}

uint64_t sub_218006068()
{
  return 1;
}

uint64_t sub_218006070()
{
  return sub_218038C44();
}

uint64_t sub_2180060B4()
{
  return sub_218038C34();
}

uint64_t sub_2180060DC()
{
  return sub_218038C44();
}

uint64_t PreviewSession.events.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t PreviewSession.close()()
{
  v1[5] = v0;
  uint64_t v2 = type metadata accessor for PreviewSession(0);
  v1[6] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[7] = v3;
  v1[8] = *(void *)(v3 + 64);
  v1[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  v1[10] = swift_task_alloc();
  uint64_t v4 = *(void *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  v1[11] = v4;
  v1[12] = *(void *)(v4 + 64);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2180062FC, 0, 0);
}

uint64_t sub_2180062FC()
{
  if (qword_267BB94F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v1 = qword_267BBD3A8;
  if (*(void *)(qword_267BBD3A8 + 16) && (unint64_t v2 = sub_2180086B4(v0[5] + *(int *)(v0[6] + 24)), (v3 & 1) != 0))
  {
    uint64_t v5 = v0[14];
    uint64_t v4 = v0[15];
    uint64_t v6 = v0[13];
    uint64_t v8 = v0[10];
    uint64_t v7 = v0[11];
    uint64_t v18 = v0[12];
    uint64_t v16 = v0[9];
    uint64_t v17 = v0[7];
    uint64_t v9 = v0[5];
    sub_218009588(*(void *)(v1 + 56) + *(void *)(v7 + 72) * v2, v5, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_218009520(v5, v4, type metadata accessor for PreviewApplication.PreviewSessionMap);
    swift_endAccess();
    uint64_t v10 = sub_218038824();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
    sub_218009588(v4, v6, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_218009588(v9, v16, type metadata accessor for PreviewSession);
    unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    unint64_t v12 = (v18 + *(unsigned __int8 *)(v17 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = 0;
    *(void *)(v13 + 24) = 0;
    sub_218009520(v6, v13 + v11, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_218009520(v16, v13 + v12, type metadata accessor for PreviewSession);
    sub_21800341C(v8, (uint64_t)&unk_267BBA4B8, v13);
    swift_release();
    sub_218009ADC(v4, type metadata accessor for PreviewApplication.PreviewSessionMap);
  }
  else
  {
    swift_endAccess();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_2180065D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 120) = a4;
  *(void *)(v5 + 12_Block_object_dispose(&STACK[0x360], 8) = a5;
  return MEMORY[0x270FA2498](sub_2180065F0, 0, 0);
}

uint64_t sub_2180065F0()
{
  uint64_t v1 = v0[15];
  unint64_t v2 = *(void **)(v1 + *(int *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) + 20));
  type metadata accessor for PreviewSession(0);
  uint64_t v3 = sub_218037DC4();
  v0[17] = v3;
  v0[2] = v0;
  v0[3] = sub_218006718;
  uint64_t v4 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_2180059B8;
  v0[13] = &block_descriptor_40;
  v0[14] = v4;
  objc_msgSend(v2, sel_closeWithSessionUUID_completionHandler_, v3, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_218006718()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    unint64_t v2 = sub_21800D498;
  }
  else {
    unint64_t v2 = sub_21800D494;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

unint64_t PreviewSession.Action.init(rawValue:)(unint64_t a1)
{
  return sub_218009B3C(a1);
}

BOOL sub_218006848(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21800685C()
{
  return sub_218038C44();
}

uint64_t sub_2180068A4()
{
  return sub_218038C34();
}

uint64_t sub_2180068D0()
{
  return sub_218038C44();
}

unint64_t sub_218006914@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_218009B3C(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x360], 8) = v4 & 1;
  return result;
}

uint64_t sub_218006948()
{
  return sub_218038734();
}

uint64_t sub_2180069A8()
{
  return sub_218038724();
}

uint64_t PreviewSession.perform(action:)(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = type metadata accessor for PreviewSession(0);
  v2[7] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[8] = v4;
  v2[9] = *(void *)(v4 + 64);
  v2[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  v2[11] = swift_task_alloc();
  uint64_t v5 = *(void *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  v2[12] = v5;
  v2[13] = *(void *)(v5 + 64);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_218006B6C, 0, 0);
}

uint64_t sub_218006B6C()
{
  if (qword_267BB94F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v1 = qword_267BBD3A8;
  if (*(void *)(qword_267BBD3A8 + 16) && (unint64_t v2 = sub_2180086B4(v0[6] + *(int *)(v0[7] + 24)), (v3 & 1) != 0))
  {
    uint64_t v5 = v0[15];
    uint64_t v4 = v0[16];
    uint64_t v6 = v0[14];
    uint64_t v8 = v0[11];
    uint64_t v7 = v0[12];
    uint64_t v18 = v0[13];
    uint64_t v16 = v0[10];
    uint64_t v17 = v0[8];
    uint64_t v9 = v0[6];
    uint64_t v19 = v0[9];
    uint64_t v20 = v0[5];
    sub_218009588(*(void *)(v1 + 56) + *(void *)(v7 + 72) * v2, v5, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_218009520(v5, v4, type metadata accessor for PreviewApplication.PreviewSessionMap);
    swift_endAccess();
    uint64_t v10 = sub_218038824();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
    sub_218009588(v4, v6, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_218009588(v9, v16, type metadata accessor for PreviewSession);
    unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    unint64_t v12 = (v18 + *(unsigned __int8 *)(v17 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = 0;
    *(void *)(v13 + 24) = 0;
    sub_218009520(v6, v13 + v11, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_218009520(v16, v13 + v12, type metadata accessor for PreviewSession);
    *(void *)(v13 + ((v19 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = v20;
    sub_21800341C(v8, (uint64_t)&unk_267BBA4D0, v13);
    swift_release();
    sub_218009ADC(v4, type metadata accessor for PreviewApplication.PreviewSessionMap);
  }
  else
  {
    swift_endAccess();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_218006E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[16] = a5;
  v6[17] = a6;
  v6[15] = a4;
  return MEMORY[0x270FA2498](sub_218006E78, 0, 0);
}

uint64_t sub_218006E78()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[15];
  char v3 = *(void **)(v2 + *(int *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) + 20));
  type metadata accessor for PreviewSession(0);
  uint64_t v4 = sub_218037DC4();
  v0[18] = v4;
  v0[2] = v0;
  v0[3] = sub_218006FB4;
  uint64_t v5 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_2180059B8;
  v0[13] = &block_descriptor_38;
  v0[14] = v5;
  objc_msgSend(v3, sel_performActionWithSessionUUID_action_itemIndex_completionHandler_, v4, v1, 0, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_218006FB4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = sub_218007128;
  }
  else {
    uint64_t v2 = sub_2180070C4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2180070C4()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_218007128()
{
  uint64_t v1 = *(void **)(v0 + 144);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t PreviewSession.update(items:selectedItem:)(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  uint64_t v4 = type metadata accessor for PreviewSession(0);
  v3[8] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[9] = v5;
  v3[10] = *(void *)(v5 + 64);
  v3[11] = swift_task_alloc();
  uint64_t v6 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA3F8) - 8);
  v3[12] = v6;
  v3[13] = *(void *)(v6 + 64);
  v3[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  v3[15] = swift_task_alloc();
  uint64_t v7 = *(void *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  v3[16] = v7;
  v3[17] = *(void *)(v7 + 64);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_218007374, 0, 0);
}

uint64_t sub_218007374()
{
  if (qword_267BB94F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v1 = qword_267BBD3A8;
  if (*(void *)(qword_267BBD3A8 + 16) && (unint64_t v2 = sub_2180086B4(v0[7] + *(int *)(v0[8] + 24)), (v3 & 1) != 0))
  {
    uint64_t v4 = v0[19];
    uint64_t v5 = v0[20];
    uint64_t v6 = v0[18];
    uint64_t v7 = v0[15];
    uint64_t v8 = v0[16];
    uint64_t v9 = v0[14];
    uint64_t v19 = v0[11];
    uint64_t v20 = v0[12];
    uint64_t v22 = v0[13];
    uint64_t v21 = v0[9];
    uint64_t v10 = v0[6];
    uint64_t v18 = v0[7];
    uint64_t v23 = v0[17];
    uint64_t v24 = v0[5];
    sub_218009588(*(void *)(v1 + 56) + *(void *)(v8 + 72) * v2, v4, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_218009520(v4, v5, type metadata accessor for PreviewApplication.PreviewSessionMap);
    swift_endAccess();
    uint64_t v11 = sub_218038824();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
    sub_217FF6F30(v10, v9, &qword_267BBA3F8);
    sub_218009588(v5, v6, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_218009588(v18, v19, type metadata accessor for PreviewSession);
    unint64_t v12 = (*(unsigned __int8 *)(v20 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
    unint64_t v13 = (v22 + *(unsigned __int8 *)(v8 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    unint64_t v14 = (v23 + *(unsigned __int8 *)(v21 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
    id v15 = (void *)swift_allocObject();
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = v24;
    sub_218008C94(v9, (uint64_t)v15 + v12);
    sub_218009520(v6, (uint64_t)v15 + v13, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_218009520(v19, (uint64_t)v15 + v14, type metadata accessor for PreviewSession);
    swift_bridgeObjectRetain();
    sub_21800341C(v7, (uint64_t)&unk_267BBA4E8, (uint64_t)v15);
    swift_release();
    sub_218009ADC(v5, type metadata accessor for PreviewApplication.PreviewSessionMap);
  }
  else
  {
    swift_endAccess();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_2180076B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[17] = a6;
  v7[18] = a7;
  v7[15] = a4;
  v7[16] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA3F8);
  v7[19] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for PreviewItem(0);
  v7[20] = v8;
  v7[21] = *(void *)(v8 - 8);
  v7[22] = swift_task_alloc();
  v7[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2180077B8, 0, 0);
}

uint64_t sub_2180077B8()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v4 = v0[21];
    sub_218038AD4();
    uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    uint64_t v7 = v2;
    do
    {
      uint64_t v8 = (uint64_t *)v0[22];
      sub_218009588(v5, (uint64_t)v8, type metadata accessor for PreviewItem);
      sub_217FFF2E8(v8);
      sub_218009ADC((uint64_t)v8, type metadata accessor for PreviewItem);
      sub_218038AB4();
      sub_218038AE4();
      sub_218038AF4();
      sub_218038AC4();
      v5 += v6;
      --v7;
    }
    while (v7);
    swift_release();
  }
  uint64_t v9 = v0[20];
  uint64_t v10 = v0[21];
  uint64_t v11 = v0[19];
  sub_217FF6F30(v0[16], v11, &qword_267BBA3F8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    sub_217FF6BD8(v0[19], &qword_267BBA3F8);
    if (v2)
    {
      uint64_t v12 = v0[21];
      uint64_t v33 = v3;
      sub_218038AD4();
      uint64_t v13 = *(void *)(v12 + 72);
      unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
      uint64_t v15 = -1;
      goto LABEL_14;
    }
LABEL_27:
    uint64_t v15 = -1;
    uint64_t v20 = v3;
    if ((v3 & 0xC000000000000000) == 0) {
      goto LABEL_18;
    }
LABEL_28:
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_218038B24();
    swift_bridgeObjectRelease();
    if (!v21) {
      goto LABEL_29;
    }
    goto LABEL_19;
  }
  sub_218009520(v0[19], v0[23], type metadata accessor for PreviewItem);
  if (!v2)
  {
    sub_218009ADC(v0[23], type metadata accessor for PreviewItem);
    goto LABEL_27;
  }
  uint64_t v15 = 0;
  uint64_t v16 = v0[21];
  unint64_t v14 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v17 = v0[15] + v14;
  uint64_t v13 = *(void *)(v16 + 72);
  while (!_s9QuickLook11PreviewItemV2eeoiySbAC_ACtFZ_0(v17, v0[23]))
  {
    ++v15;
    v17 += v13;
    if (v2 == v15)
    {
      uint64_t v15 = -1;
      break;
    }
  }
  sub_218009ADC(v0[23], type metadata accessor for PreviewItem);
  uint64_t v33 = v3;
  sub_218038AD4();
LABEL_14:
  uint64_t v18 = v0[15] + v14;
  do
  {
    uint64_t v19 = (uint64_t *)v0[22];
    sub_218009588(v18, (uint64_t)v19, type metadata accessor for PreviewItem);
    sub_217FFF2E8(v19);
    sub_218009ADC((uint64_t)v19, type metadata accessor for PreviewItem);
    sub_218038AB4();
    sub_218038AE4();
    sub_218038AF4();
    sub_218038AC4();
    v18 += v13;
    --v2;
  }
  while (v2);
  uint64_t v20 = v33;
  if (v33 < 0 || (v33 & 0x4000000000000000) != 0) {
    goto LABEL_28;
  }
LABEL_18:
  uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v21) {
    goto LABEL_29;
  }
LABEL_19:
  uint64_t v22 = sub_218038AD4();
  if (v21 < 0)
  {
    __break(1u);
    return MEMORY[0x270FA23F0](v22);
  }
  uint64_t v23 = self;
  uint64_t v24 = 0;
  do
  {
    if ((v20 & 0xC000000000000001) != 0)
    {
      uint64_t v25 = MEMORY[0x21D45EB20](v24, v20);
    }
    else
    {
      uint64_t v25 = *(void *)(v20 + 8 * v24 + 32);
      swift_unknownObjectRetain();
    }
    ++v24;
    id v26 = objc_msgSend(v23, sel_itemWithPreviewItem_, v25);
    swift_unknownObjectRelease();
    sub_218038AB4();
    sub_218038AE4();
    sub_218038AF4();
    sub_218038AC4();
  }
  while (v21 != v24);
LABEL_29:
  swift_bridgeObjectRelease();
  uint64_t v27 = v0[17];
  uint64_t v28 = *(void **)(v27 + *(int *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) + 20));
  type metadata accessor for PreviewSession(0);
  uint64_t v29 = sub_218037DC4();
  v0[24] = v29;
  sub_21800D454();
  uint64_t v30 = sub_218038754();
  v0[25] = v30;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = sub_218007CF8;
  uint64_t v31 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_2180059B8;
  v0[13] = &block_descriptor_36;
  v0[14] = v31;
  objc_msgSend(v28, sel_updateContentsWithSessionUUID_items_selectedIndex_completionHandler_, v29, v30, v15, v0 + 10);
  uint64_t v22 = (uint64_t)(v0 + 2);
  return MEMORY[0x270FA23F0](v22);
}

uint64_t sub_218007CF8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 20_Block_object_dispose(&STACK[0x360], 8) = v1;
  if (v1) {
    uint64_t v2 = sub_218007E98;
  }
  else {
    uint64_t v2 = sub_218007E08;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_218007E08()
{
  uint64_t v1 = *(void **)(v0 + 192);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_218007E98()
{
  uint64_t v1 = (void *)v0[25];
  uint64_t v2 = (void *)v0[24];
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t PreviewSession.bringToFront()()
{
  v1[5] = v0;
  uint64_t v2 = type metadata accessor for PreviewSession(0);
  v1[6] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[7] = v3;
  v1[8] = *(void *)(v3 + 64);
  v1[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  v1[10] = swift_task_alloc();
  uint64_t v4 = *(void *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  v1[11] = v4;
  v1[12] = *(void *)(v4 + 64);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2180080B4, 0, 0);
}

uint64_t sub_2180080B4()
{
  if (qword_267BB94F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v1 = qword_267BBD3A8;
  if (*(void *)(qword_267BBD3A8 + 16) && (unint64_t v2 = sub_2180086B4(v0[5] + *(int *)(v0[6] + 24)), (v3 & 1) != 0))
  {
    uint64_t v5 = v0[14];
    uint64_t v4 = v0[15];
    uint64_t v6 = v0[13];
    uint64_t v8 = v0[10];
    uint64_t v7 = v0[11];
    uint64_t v18 = v0[12];
    uint64_t v16 = v0[9];
    uint64_t v17 = v0[7];
    uint64_t v9 = v0[5];
    sub_218009588(*(void *)(v1 + 56) + *(void *)(v7 + 72) * v2, v5, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_218009520(v5, v4, type metadata accessor for PreviewApplication.PreviewSessionMap);
    swift_endAccess();
    uint64_t v10 = sub_218038824();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
    sub_218009588(v4, v6, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_218009588(v9, v16, type metadata accessor for PreviewSession);
    unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    unint64_t v12 = (v18 + *(unsigned __int8 *)(v17 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = 0;
    *(void *)(v13 + 24) = 0;
    sub_218009520(v6, v13 + v11, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_218009520(v16, v13 + v12, type metadata accessor for PreviewSession);
    sub_21800341C(v8, (uint64_t)&unk_267BBA500, v13);
    swift_release();
    sub_218009ADC(v4, type metadata accessor for PreviewApplication.PreviewSessionMap);
  }
  else
  {
    swift_endAccess();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_218008388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 120) = a4;
  *(void *)(v5 + 12_Block_object_dispose(&STACK[0x360], 8) = a5;
  return MEMORY[0x270FA2498](sub_2180083A8, 0, 0);
}

uint64_t sub_2180083A8()
{
  uint64_t v1 = v0[15];
  unint64_t v2 = *(void **)(v1 + *(int *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) + 20));
  type metadata accessor for PreviewSession(0);
  uint64_t v3 = sub_218037DC4();
  v0[17] = v3;
  v0[2] = v0;
  v0[3] = sub_2180084D0;
  uint64_t v4 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_2180059B8;
  v0[13] = &block_descriptor_0;
  v0[14] = v4;
  objc_msgSend(v2, sel_bringToFrontWithSessionUUID_completionHandler_, v3, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2180084D0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    unint64_t v2 = sub_218008644;
  }
  else {
    unint64_t v2 = sub_2180085E0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2180085E0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_218008644()
{
  uint64_t v1 = *(void **)(v0 + 136);
  swift_willThrow();

  unint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_2180086B4(uint64_t a1)
{
  sub_218037DF4();
  sub_21800A9B8(&qword_267BBA4A0, MEMORY[0x263F07508]);
  uint64_t v2 = sub_2180385C4();

  return sub_218008858(a1, v2);
}

unint64_t sub_21800874C(uint64_t a1, uint64_t a2)
{
  sub_218038C24();
  sub_2180386B4();
  uint64_t v4 = sub_218038C44();

  return sub_218008A18(a1, a2, v4);
}

unint64_t sub_2180087C8(uint64_t a1)
{
  sub_218038624();
  sub_218038C24();
  sub_2180386B4();
  uint64_t v2 = sub_218038C44();
  swift_bridgeObjectRelease();
  return sub_218008AFC(a1, v2);
}

unint64_t sub_218008858(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_218037DF4();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    unint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_21800A9B8((unint64_t *)&unk_267BBA5A0, MEMORY[0x263F07508]);
      char v15 = sub_2180385E4();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_218008A18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_218038BB4() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_218038BB4() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_218008AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_218038624();
    uint64_t v8 = v7;
    if (v6 == sub_218038624() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_218038BB4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_218038624();
          uint64_t v15 = v14;
          if (v13 == sub_218038624() && v15 == v16) {
            break;
          }
          char v18 = sub_218038BB4();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_218008C74(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_218008CFC(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_218008C94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA3F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_218008CFC(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA5C0);
  uint64_t v10 = *(void *)(type metadata accessor for PreviewItem(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  id v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for PreviewItem(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  char v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_218038B64();
  __break(1u);
  return result;
}

BOOL _s9QuickLook11PreviewItemV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewItem(0);
  uint64_t v5 = v4 - 8;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v49 = (uint64_t)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v48 = (uint64_t)&v44 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v50 = (char *)&v44 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v51 = (uint64_t *)((char *)&v44 - v12);
  uint64_t v13 = sub_218037D74();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  unint64_t v17 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v44 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA5B8);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v23 = (char *)&v44 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = *(int *)(v5 + 32);
  uint64_t v25 = a2 + v24;
  uint64_t v26 = (uint64_t)&v23[*(int *)(v21 + 56)];
  sub_218009588(a1 + v24, (uint64_t)v23, type metadata accessor for PreviewItem.Source);
  sub_218009588(v25, v26, type metadata accessor for PreviewItem.Source);
  uint64_t v45 = v14;
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v27(v19, v23, v13);
  uint64_t v46 = v13;
  uint64_t v28 = v13;
  uint64_t v29 = v50;
  v27(v17, (char *)v26, v28);
  uint64_t v30 = v17;
  LOBYTE(v26) = MEMORY[0x21D45DDD0](v19, v17);
  uint64_t v47 = a1;
  uint64_t v31 = v51;
  sub_218009588(a1, (uint64_t)v51, type metadata accessor for PreviewItem);
  sub_218009588(a2, (uint64_t)v29, type metadata accessor for PreviewItem);
  if (v26)
  {
    uint64_t v44 = a2;
    uint64_t v32 = v31[1];
    uint64_t v33 = v29[1];
    if (v32)
    {
      if (v33)
      {
        if (*v31 != *v29 || v32 != v33)
        {
          char v35 = sub_218038BB4();
          swift_bridgeObjectRetain();
          sub_218009ADC((uint64_t)v29, type metadata accessor for PreviewItem);
          sub_218009ADC((uint64_t)v31, type metadata accessor for PreviewItem);
          swift_bridgeObjectRelease();
          uint64_t v36 = v48;
          sub_218009588(v47, v48, type metadata accessor for PreviewItem);
          uint64_t v37 = v49;
          sub_218009588(v44, v49, type metadata accessor for PreviewItem);
          BOOL v38 = 0;
          uint64_t v30 = v17;
          uint64_t v40 = v45;
          uint64_t v39 = v46;
          if ((v35 & 1) == 0) {
            goto LABEL_19;
          }
          goto LABEL_18;
        }
        swift_bridgeObjectRetain();
        sub_218009ADC((uint64_t)v29, type metadata accessor for PreviewItem);
        sub_218009ADC((uint64_t)v31, type metadata accessor for PreviewItem);
        swift_bridgeObjectRelease();
LABEL_17:
        uint64_t v36 = v48;
        sub_218009588(v47, v48, type metadata accessor for PreviewItem);
        uint64_t v37 = v49;
        sub_218009588(v44, v49, type metadata accessor for PreviewItem);
        uint64_t v30 = v17;
        uint64_t v40 = v45;
        uint64_t v39 = v46;
LABEL_18:
        BOOL v38 = *(void *)(v36 + 16) == *(void *)(v37 + 16);
        goto LABEL_19;
      }
      swift_bridgeObjectRetain();
      sub_218009ADC((uint64_t)v29, type metadata accessor for PreviewItem);
      sub_218009ADC((uint64_t)v31, type metadata accessor for PreviewItem);
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_218009ADC((uint64_t)v29, type metadata accessor for PreviewItem);
      sub_218009ADC((uint64_t)v31, type metadata accessor for PreviewItem);
      if (!v33) {
        goto LABEL_17;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v36 = v48;
    uint64_t v37 = v49;
    a2 = v44;
    uint64_t v41 = v47;
    uint64_t v30 = v17;
  }
  else
  {
    sub_218009ADC((uint64_t)v29, type metadata accessor for PreviewItem);
    sub_218009ADC((uint64_t)v31, type metadata accessor for PreviewItem);
    uint64_t v36 = v48;
    uint64_t v37 = v49;
    uint64_t v41 = v47;
  }
  uint64_t v40 = v45;
  uint64_t v39 = v46;
  sub_218009588(v41, v36, type metadata accessor for PreviewItem);
  sub_218009588(a2, v37, type metadata accessor for PreviewItem);
  BOOL v38 = 0;
LABEL_19:
  sub_218009ADC(v37, type metadata accessor for PreviewItem);
  sub_218009ADC(v36, type metadata accessor for PreviewItem);
  uint64_t v42 = *(void (**)(char *, uint64_t))(v40 + 8);
  v42(v30, v39);
  v42(v19, v39);
  return v38;
}

uint64_t type metadata accessor for PreviewSession(uint64_t a1)
{
  return sub_217FF0300(a1, (uint64_t *)&unk_267BBA530);
}

unint64_t sub_2180094CC()
{
  unint64_t result = qword_267BBA428;
  if (!qword_267BBA428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267BBA428);
  }
  return result;
}

uint64_t sub_218009520(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_218009588(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2180095F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_218009604()
{
  uint64_t v1 = (int *)(type metadata accessor for PreviewSession(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  unint64_t v4 = (*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v5 = v0 + v3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420) + 28);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  uint64_t v9 = v5 + v1[8];
  uint64_t v10 = sub_218037DF4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + ((v4 + 31) & 0xFFFFFFFFFFFFFFF8) + 16) != 1) {
    swift_bridgeObjectRelease();
  }

  return MEMORY[0x270FA0238](v0, ((v4 + 63) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_2180097D0(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for PreviewSession(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v1[3];
  uint64_t v15 = v1[2];
  uint64_t v8 = v1[4];
  uint64_t v9 = *(void *)((char *)v1 + v5);
  uint64_t v10 = (uint64_t)v1 + v4;
  uint64_t v11 = *(void *)((char *)v1 + v6);
  char v12 = *((unsigned char *)v1 + v6 + 8);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_217FF2264;
  return sub_218004B34(a1, v15, v7, v8, v10, v9, v11, v12);
}

uint64_t type metadata accessor for PreviewApplication.PreviewSessionMap(uint64_t a1)
{
  return sub_217FF0300(a1, (uint64_t *)&unk_267BBA568);
}

uint64_t sub_218009994()
{
  uint64_t v2 = *(void *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(type metadata accessor for PreviewSession(0) - 8) + 80);
  unint64_t v6 = v3 + v4 + v5;
  uint64_t v7 = v0 + v3;
  uint64_t v8 = v0 + (v6 & ~v5);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  void *v9 = v1;
  v9[1] = sub_217FF2264;
  v9[15] = v7;
  v9[16] = v8;
  return MEMORY[0x270FA2498](sub_2180065F0, 0, 0);
}

uint64_t sub_218009ADC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_218009B3C(unint64_t result)
{
  if (result > 3) {
    return 0;
  }
  return result;
}

uint64_t sub_218009B4C()
{
  uint64_t v1 = *(void *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = (int *)(type metadata accessor for PreviewSession(0) - 8);
  uint64_t v6 = *(unsigned __int8 *)(*(void *)v5 + 80);
  uint64_t v17 = (v3 + v4 + v6) & ~v6;
  unint64_t v18 = ((*(void *)(*(void *)v5 + 64) + v17 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v19 = v2 | v6 | 7;
  swift_unknownObjectRelease();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v16(v0 + v3, v7);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420);
  uint64_t v8 = v0 + v3 + *(int *)(v15 + 28);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  v14(v8, v9);
  swift_release();
  uint64_t v10 = v0 + v3 + v5[8];
  uint64_t v11 = sub_218037DF4();
  char v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v16(v0 + v17, v7);
  v14(v0 + v17 + *(int *)(v15 + 28), v9);
  swift_release();
  v12(v0 + v17 + v5[8], v11);

  return MEMORY[0x270FA0238](v0, v18, v19);
}

uint64_t sub_218009DFC()
{
  uint64_t v2 = *(void *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(type metadata accessor for PreviewSession(0) - 8);
  unint64_t v6 = (v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = v0 + v3;
  uint64_t v8 = v0 + v6;
  uint64_t v9 = *(void *)(v0 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *uint64_t v10 = v1;
  v10[1] = sub_217FF2264;
  v10[16] = v8;
  v10[17] = v9;
  v10[15] = v7;
  return MEMORY[0x270FA2498](sub_218006E78, 0, 0);
}

uint64_t sub_218009F74()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA3F8) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v33 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(v33 - 8) + 80);
  uint64_t v6 = *(void *)(*(void *)(v33 - 8) + 64);
  uint64_t v7 = type metadata accessor for PreviewSession(0);
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(v7 - 8) + 80);
  uint64_t v30 = *(void *)(*(void *)(v7 - 8) + 64);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = v0 + v3;
  uint64_t v10 = type metadata accessor for PreviewItem(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v0 + v3, 1, v10))
  {
    swift_bridgeObjectRelease();
    uint64_t v31 = v4;
    uint64_t v11 = v6;
    uint64_t v12 = v9 + *(int *)(v10 + 24);
    uint64_t v13 = sub_218037D74();
    uint64_t v14 = v12;
    uint64_t v6 = v11;
    uint64_t v4 = v31;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v14, v13);
    uint64_t v15 = v9 + *(int *)(v10 + 28);
    uint64_t v16 = sub_218037DF4();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  }
  uint64_t v17 = (v3 + v4 + v5) & ~v5;
  uint64_t v29 = (v17 + v6 + v8) & ~v8;
  uint64_t v32 = v2 | v5 | v8 | 7;
  uint64_t v18 = v0 + v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
  uint64_t v28 = *(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8);
  v28(v18, v19);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420);
  uint64_t v20 = v18 + *(int *)(v27 + 28);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  uint64_t v26 = *(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8);
  v26(v20, v21);
  swift_release();
  uint64_t v22 = v18 + *(int *)(v7 + 24);
  uint64_t v23 = sub_218037DF4();
  uint64_t v24 = *(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8);
  v24(v22, v23);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v28(v0 + v29, v19);
  v26(v0 + v29 + *(int *)(v27 + 28), v21);
  swift_release();
  v24(v0 + v29 + *(int *)(v7 + 24), v23);

  return MEMORY[0x270FA0238](v0, v29 + v30, v32);
}

uint64_t sub_21800A370(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA3F8) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(void *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  unint64_t v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(type metadata accessor for PreviewSession(0) - 8) + 80);
  unint64_t v11 = v8 + v9 + v10;
  uint64_t v12 = v1[2];
  uint64_t v13 = v1[3];
  uint64_t v14 = v1[4];
  uint64_t v15 = (uint64_t)v1 + v5;
  uint64_t v16 = (uint64_t)v1 + v8;
  uint64_t v17 = (uint64_t)v1 + (v11 & ~v10);
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v18;
  void *v18 = v2;
  v18[1] = sub_217FF2264;
  return sub_2180076B4(a1, v12, v13, v14, v15, v16, v17);
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v1 = *(void *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  unint64_t v5 = (int *)(type metadata accessor for PreviewSession(0) - 8);
  uint64_t v6 = *(unsigned __int8 *)(*(void *)v5 + 80);
  uint64_t v17 = (v3 + v4 + v6) & ~v6;
  uint64_t v18 = v2 | v6 | 7;
  uint64_t v19 = v17 + *(void *)(*(void *)v5 + 64);
  swift_unknownObjectRelease();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v16(v0 + v3, v7);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420);
  uint64_t v8 = v0 + v3 + *(int *)(v15 + 28);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  v14(v8, v9);
  swift_release();
  uint64_t v10 = v0 + v3 + v5[8];
  uint64_t v11 = sub_218037DF4();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v16(v0 + v17, v7);
  v14(v0 + v17 + *(int *)(v15 + 28), v9);
  swift_release();
  v12(v0 + v17 + v5[8], v11);

  return MEMORY[0x270FA0238](v0, v19, v18);
}

uint64_t sub_21800A7E0()
{
  uint64_t v2 = *(void *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(type metadata accessor for PreviewSession(0) - 8) + 80);
  unint64_t v6 = v3 + v4 + v5;
  uint64_t v7 = v0 + v3;
  uint64_t v8 = v0 + (v6 & ~v5);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  void *v9 = v1;
  v9[1] = sub_217FF1CC0;
  v9[15] = v7;
  v9[16] = v8;
  return MEMORY[0x270FA2498](sub_2180083A8, 0, 0);
}

uint64_t sub_21800A928()
{
  return sub_21800A9B8(&qword_267BBA4A0, MEMORY[0x263F07508]);
}

uint64_t sub_21800A970()
{
  return sub_21800A9B8(&qword_267BBA508, (void (*)(uint64_t))type metadata accessor for PreviewItem);
}

uint64_t sub_21800A9B8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21800AA04()
{
  unint64_t result = qword_267BBA510;
  if (!qword_267BBA510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA510);
  }
  return result;
}

uint64_t type metadata accessor for PreviewApplication()
{
  return self;
}

uint64_t method lookup function for PreviewApplication(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PreviewApplication);
}

uint64_t destroy for PreviewApplication.PreviewConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PreviewApplication.PreviewConfiguration(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + _Block_object_dispose(&STACK[0x360], 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PreviewApplication.PreviewConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + _Block_object_dispose(&STACK[0x360], 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PreviewApplication.PreviewConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + _Block_object_dispose(&STACK[0x360], 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewApplication.PreviewConfiguration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewApplication.PreviewConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + _Block_object_dispose(&STACK[0x360], 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewApplication.PreviewConfiguration()
{
  return &type metadata for PreviewApplication.PreviewConfiguration;
}

uint64_t *initializeBufferWithCopyOfBuffer for PreviewItem(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    uint64_t *v4 = *a2;
    int v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    a1[2] = a2[2];
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_218037D74();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 28);
    uint64_t v14 = (char *)v4 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_218037DF4();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return v4;
}

uint64_t destroy for PreviewItem(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_218037D74();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = sub_218037DF4();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

void *initializeWithCopy for PreviewItem(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_218037D74();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_218037DF4();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

void *assignWithCopy for PreviewItem(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_218037D74();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_218037DF4();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t initializeWithTake for PreviewItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_218037D74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_218037DF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

void *assignWithTake for PreviewItem(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_218037D74();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_218037DF4();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21800B234);
}

uint64_t sub_21800B234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    if (*(_DWORD *)(*(void *)(type metadata accessor for PreviewItem.Source(0) - 8) + 84) == a2)
    {
      uint64_t v9 = a1 + *(int *)(a3 + 24);
      uint64_t v10 = sub_218037D74();
      uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
      uint64_t v12 = v10;
      uint64_t v13 = v9;
    }
    else
    {
      uint64_t v14 = sub_218037DF4();
      uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
      uint64_t v12 = v14;
      uint64_t v13 = a1 + *(int *)(a3 + 28);
    }
    return v11(v13, a2, v12);
  }
}

uint64_t type metadata accessor for PreviewItem.Source(uint64_t a1)
{
  return sub_217FF0300(a1, qword_267BBA550);
}

uint64_t storeEnumTagSinglePayload for PreviewItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21800B394);
}

uint64_t sub_21800B394(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + _Block_object_dispose(&STACK[0x360], 8) = a2;
  }
  else
  {
    if (*(_DWORD *)(*(void *)(type metadata accessor for PreviewItem.Source(0) - 8) + 84) == a3)
    {
      uint64_t v7 = v5 + *(int *)(a4 + 24);
      uint64_t v8 = sub_218037D74();
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
      uint64_t v10 = v8;
      uint64_t v11 = v7;
    }
    else
    {
      uint64_t v12 = sub_218037DF4();
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
      uint64_t v10 = v12;
      uint64_t v11 = v5 + *(int *)(a4 + 28);
    }
    return v9(v11, a2, a2, v10);
  }
  return result;
}

uint64_t sub_21800B4B0()
{
  uint64_t result = sub_218037D74();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_218037DF4();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for PreviewSession(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420) + 28);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_218037DF4();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_retain();
    v16(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for PreviewSession(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420) + 28);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = sub_218037DF4();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);

  return v9(v7, v8);
}

uint64_t initializeWithCopy for PreviewSession(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420) + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_218037DF4();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_retain();
  v15(v12, v13, v14);
  return a1;
}

uint64_t assignWithCopy for PreviewSession(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420) + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_218037DF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t initializeWithTake for PreviewSession(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420) + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_218037DF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t assignWithTake for PreviewSession(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420) + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_218037DF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewSession(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21800BD00);
}

uint64_t sub_21800BD00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_218037DF4();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for PreviewSession(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21800BE44);
}

uint64_t sub_21800BE44(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_218037DF4();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_21800BF74()
{
  sub_21800C048();
  if (v0 <= 0x3F)
  {
    sub_218037DF4();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_21800C048()
{
  if (!qword_267BBA540)
  {
    unint64_t v0 = type metadata accessor for DataProvider();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BBA540);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for PreviewSession.Event(void *a1, void **a2)
{
  unint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for PreviewSession.Event(void **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for PreviewSession.Event(void **a1, void **a2)
{
  unint64_t v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF) {
      id v7 = v4;
    }
    *a1 = v4;
  }
  else if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    *a1 = *a2;
  }
  else
  {
    id v5 = v4;
    uint64_t v6 = *a1;
    *a1 = v4;
  }
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **assignWithTake for PreviewSession.Event(void **a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF) {
    goto LABEL_6;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewSession.Event(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PreviewSession.Event(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + _Block_object_dispose(&STACK[0x360], 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + _Block_object_dispose(&STACK[0x360], 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_21800C2A8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_21800C2C0(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for PreviewSession.Event()
{
  return &type metadata for PreviewSession.Event;
}

ValueMetadata *type metadata accessor for PreviewSession.Action()
{
  return &type metadata for PreviewSession.Action;
}

unint64_t sub_21800C304()
{
  unint64_t result = qword_267BBA548;
  if (!qword_267BBA548)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBA410);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA548);
  }
  return result;
}

uint64_t *sub_21800C360(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = sub_218037D74();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  return a1;
}

uint64_t sub_21800C410(uint64_t a1)
{
  uint64_t v2 = sub_218037D74();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_21800C474(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_218037D74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_21800C4D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_218037D74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_21800C53C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_218037D74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_21800C5A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_218037D74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_21800C604(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_218037D74();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_21800C670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_218037D74();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, a2, a3, v6);
}

uint64_t sub_21800C6EC(uint64_t a1)
{
  uint64_t result = sub_218037D74();
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8);
    swift_initEnumMetadataSingleCase();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t *sub_21800C790(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420) + 28);
    uint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = type metadata accessor for PreviewSession(0);
    *(uint64_t *)((char *)a1 + *(int *)(v12 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v12 + 20));
    uint64_t v13 = *(int *)(v12 + 24);
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_218037DF4();
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
    swift_retain();
    v17(v14, v15, v16);
    uint64_t v18 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    uint64_t v19 = (uint64_t *)((char *)a1 + v18);
    uint64_t v20 = (uint64_t *)((char *)a2 + v18);
    uint64_t v21 = v20[1];
    void *v19 = *v20;
    v19[1] = v21;
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_21800C954(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  uint64_t v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420) + 28);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = type metadata accessor for PreviewSession(0);
  swift_release();
  uint64_t v6 = a1 + *(int *)(v5 + 24);
  uint64_t v7 = sub_218037DF4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21800CA8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420) + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = type metadata accessor for PreviewSession(0);
  *(void *)(a1 + *(int *)(v11 + 20)) = *(void *)(a2 + *(int *)(v11 + 20));
  uint64_t v12 = *(int *)(v11 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_218037DF4();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
  swift_retain();
  v16(v13, v14, v15);
  uint64_t v17 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  uint64_t v20 = v19[1];
  void *v18 = *v19;
  v18[1] = v20;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21800CC00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420) + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = type metadata accessor for PreviewSession(0);
  *(void *)(a1 + *(int *)(v11 + 20)) = *(void *)(a2 + *(int *)(v11 + 20));
  swift_retain();
  swift_release();
  uint64_t v12 = *(int *)(v11 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_218037DF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21800CD8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420) + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = type metadata accessor for PreviewSession(0);
  *(void *)(a1 + *(int *)(v11 + 20)) = *(void *)(a2 + *(int *)(v11 + 20));
  uint64_t v12 = *(int *)(v11 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_218037DF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v16) = *(_OWORD *)(a2 + v16);
  return a1;
}

uint64_t sub_21800CED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA410);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBA420) + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA238);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = type metadata accessor for PreviewSession(0);
  *(void *)(a1 + *(int *)(v11 + 20)) = *(void *)(a2 + *(int *)(v11 + 20));
  swift_release();
  uint64_t v12 = *(int *)(v11 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_218037DF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_unknownObjectRelease();
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21800D03C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21800D050);
}

uint64_t sub_21800D050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PreviewSession(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_21800D110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21800D124);
}

uint64_t sub_21800D124(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for PreviewSession(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_21800D1E0()
{
  uint64_t result = type metadata accessor for PreviewSession(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewSession.Failure(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for PreviewSession.Failure(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x21800D370);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewSession.Failure()
{
  return &type metadata for PreviewSession.Failure;
}

unint64_t sub_21800D3AC()
{
  unint64_t result = qword_267BBA578;
  if (!qword_267BBA578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA578);
  }
  return result;
}

unint64_t sub_21800D400()
{
  unint64_t result = qword_267BBA580;
  if (!qword_267BBA580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA580);
  }
  return result;
}

unint64_t sub_21800D454()
{
  unint64_t result = qword_267BBA148;
  if (!qword_267BBA148)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BBA148);
  }
  return result;
}

uint64_t sub_21800D4A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_218037D74();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_21800D50C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21800D520);
}

uint64_t sub_21800D520(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_218037D74();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_21800D58C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21800D5A0);
}

uint64_t sub_21800D5A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_218037D74();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for QLWebLocationBarView()
{
  uint64_t result = qword_267BBA5D0;
  if (!qword_267BBA5D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21800D65C()
{
  uint64_t result = sub_218037D74();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_21800D6E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21800D704@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v73 = a1;
  uint64_t v3 = type metadata accessor for QLWebLocationBarView();
  uint64_t v81 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v82 = v4;
  uint64_t v69 = (uint64_t)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_218038414();
  uint64_t v79 = *(void *)(v5 - 8);
  uint64_t v80 = v5;
  MEMORY[0x270FA5388](v5);
  v78 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_218037D74();
  uint64_t v67 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v68 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA5E0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA5E8);
  MEMORY[0x270FA5388](v65);
  uint64_t v14 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA5F0);
  MEMORY[0x270FA5388](v66);
  uint64_t v16 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA5F8);
  MEMORY[0x270FA5388](v74);
  v72 = (char *)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA600);
  uint64_t v76 = *(void *)(v18 - 8);
  uint64_t v77 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v75 = (char *)&v62 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA608);
  MEMORY[0x270FA5388](v70);
  uint64_t v71 = (char *)&v62 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_218037D64();
  if (v22)
  {
    uint64_t v23 = v21;
    unint64_t v24 = v22;
    if (sub_218038704())
    {
      uint64_t v25 = sub_2180386C4();
      uint64_t v26 = sub_21800E4D0(v25, v23, v24);
      uint64_t v63 = v7;
      uint64_t v28 = v27;
      uint64_t v29 = v10;
      uint64_t v30 = v9;
      uint64_t v32 = v31;
      uint64_t v64 = v2;
      uint64_t v34 = v33;
      swift_bridgeObjectRelease();
      uint64_t v35 = v28;
      uint64_t v7 = v63;
      uint64_t v36 = v32;
      uint64_t v9 = v30;
      uint64_t v10 = v29;
      uint64_t v23 = MEMORY[0x21D45E730](v26, v35, v36, v34);
      unint64_t v24 = v37;
      uint64_t v2 = v64;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v23 = sub_218037D24();
    unint64_t v24 = v38;
  }
  uint64_t v83 = v23;
  unint64_t v84 = v24;
  (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v68, v2, v7);
  sub_21800DED4();
  sub_218038404();
  uint64_t v39 = sub_218038484();
  uint64_t v40 = v2;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v14, v12, v9);
  uint64_t v42 = (uint64_t *)&v14[*(int *)(v65 + 36)];
  *uint64_t v42 = KeyPath;
  v42[1] = v39;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v43 = sub_2180383F4();
  uint64_t v44 = swift_getKeyPath();
  sub_217FF6F30((uint64_t)v14, (uint64_t)v16, &qword_267BBA5E8);
  uint64_t v45 = (uint64_t *)&v16[*(int *)(v66 + 36)];
  *uint64_t v45 = v44;
  v45[1] = v43;
  sub_217FF6BD8((uint64_t)v14, &qword_267BBA5E8);
  uint64_t v47 = v78;
  uint64_t v46 = v79;
  uint64_t v48 = v80;
  (*(void (**)(char *, void, uint64_t))(v79 + 104))(v78, *MEMORY[0x263F1A798], v80);
  uint64_t v49 = swift_getKeyPath();
  uint64_t v50 = (uint64_t)v72;
  uint64_t v51 = (uint64_t *)&v72[*(int *)(v74 + 36)];
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA618);
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))((char *)v51 + *(int *)(v52 + 28), v47, v48);
  uint64_t *v51 = v49;
  sub_217FF6F30((uint64_t)v16, v50, &qword_267BBA5F0);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v48);
  sub_217FF6BD8((uint64_t)v16, &qword_267BBA5F0);
  uint64_t v53 = v69;
  sub_217FFA2E8(v40, v69);
  unint64_t v54 = (*(unsigned __int8 *)(v81 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80);
  uint64_t v55 = swift_allocObject();
  sub_21800E1A0(v53, v55 + v54);
  sub_21800E264();
  uint64_t v56 = v75;
  sub_218038464();
  swift_release();
  sub_217FF6BD8(v50, &qword_267BBA5F8);
  LOBYTE(v53) = sub_2180383E4();
  uint64_t v58 = v76;
  uint64_t v57 = v77;
  uint64_t v59 = (uint64_t)v71;
  (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v71, v56, v77);
  uint64_t v60 = v59 + *(int *)(v70 + 36);
  *(unsigned char *)uint64_t v60 = v53;
  *(_OWORD *)(v60 + _Block_object_dispose(&STACK[0x360], 8) = 0u;
  *(_OWORD *)(v60 + 24) = 0u;
  *(unsigned char *)(v60 + 40) = 1;
  (*(void (**)(char *, uint64_t))(v58 + 8))(v56, v57);
  return sub_21800E468(v59, v73);
}

id sub_21800DE80()
{
  unint64_t v0 = (void *)sub_218037D34();
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F088E0]), sel_initWithObject_, v0);

  return v1;
}

unint64_t sub_21800DED4()
{
  unint64_t result = qword_267BBA610;
  if (!qword_267BBA610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA610);
  }
  return result;
}

uint64_t sub_21800DF28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_218038274();
  *a1 = result;
  return result;
}

uint64_t sub_21800DF54()
{
  return sub_218038284();
}

uint64_t sub_21800DF80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_218038294();
  *a1 = result;
  return result;
}

uint64_t sub_21800DFAC()
{
  return sub_2180382A4();
}

uint64_t sub_21800DFD8()
{
  return sub_218038254();
}

uint64_t sub_21800DFFC(uint64_t a1)
{
  uint64_t v2 = sub_218038414();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_218038264();
}

uint64_t sub_21800E0C8()
{
  uint64_t v1 = *(void *)(type metadata accessor for QLWebLocationBarView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_218037D74();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_21800E1A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for QLWebLocationBarView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_21800E204()
{
  type metadata accessor for QLWebLocationBarView();

  return sub_21800DE80();
}

unint64_t sub_21800E264()
{
  unint64_t result = qword_267BBA620;
  if (!qword_267BBA620)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBA5F8);
    sub_21800E304();
    sub_217FF8CEC(&qword_267BBA660, &qword_267BBA618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA620);
  }
  return result;
}

unint64_t sub_21800E304()
{
  unint64_t result = qword_267BBA628;
  if (!qword_267BBA628)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBA5F0);
    sub_21800E3A4();
    sub_217FF8CEC(&qword_267BBA650, &qword_267BBA658);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA628);
  }
  return result;
}

unint64_t sub_21800E3A4()
{
  unint64_t result = qword_267BBA630;
  if (!qword_267BBA630)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBA5E8);
    sub_217FF8CEC(&qword_267BBA638, &qword_267BBA5E0);
    sub_217FF8CEC(&qword_267BBA640, &qword_267BBA648);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA630);
  }
  return result;
}

uint64_t sub_21800E468(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA608);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21800E4D0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return MEMORY[0x270F9D8F0]();
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v4 = 11;
  }
  unint64_t v5 = v4 | (v3 << 16);
  unint64_t v6 = sub_2180386D4();
  if (v7) {
    unint64_t v6 = v5;
  }
  if (4 * v3 < v6 >> 14) {
    goto LABEL_14;
  }

  return MEMORY[0x270F9D8F0]();
}

unint64_t sub_21800E584()
{
  unint64_t result = qword_267BBA668;
  if (!qword_267BBA668)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBA608);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBA5F8);
    sub_21800E264();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA668);
  }
  return result;
}

uint64_t sub_21800E634()
{
  swift_getKeyPath();
  sub_21800EE20();
  sub_218037E24();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  sub_217FF2924(v1);
  return v1;
}

uint64_t sub_21800E6B8()
{
  sub_217FF2964(v0[2]);
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC9QuickLook45QLHostAccessoryViewControllerWrapperViewModel___observationRegistrar;
  uint64_t v2 = sub_218037E64();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_21800E760()
{
  return type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel();
}

uint64_t type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel()
{
  uint64_t result = qword_267BBA678;
  if (!qword_267BBA678) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21800E7B4()
{
  uint64_t result = sub_218037E64();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel.Session()
{
  return &type metadata for QLHostAccessoryViewControllerWrapperViewModel.Session;
}

uint64_t sub_21800E860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[15] = a4;
  v5[16] = a5;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  uint64_t v6 = sub_218037F64();
  v5[17] = v6;
  v5[18] = *(void *)(v6 - 8);
  v5[19] = swift_task_alloc();
  uint64_t v7 = sub_218038974();
  v5[20] = v7;
  v5[21] = *(void *)(v7 - 8);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21800E994, 0, 0);
}

uint64_t sub_21800E994()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[21];
  uint64_t v11 = v0[20];
  uint64_t v12 = v0[22];
  uint64_t v3 = v0[18];
  uint64_t v10 = v0[19];
  uint64_t v4 = v0[17];
  uint64_t v5 = v0[12];
  swift_retain();
  sub_218038964();
  sub_218038954();
  v0[24] = sub_2180389A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v10, v5, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v12, v1, v11);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[25] = v6;
  void *v6 = v0;
  v6[1] = sub_21800EAE0;
  uint64_t v7 = v0[22];
  uint64_t v8 = v0[19];
  return MEMORY[0x270EEBA38](v8, v7);
}

uint64_t sub_21800EAE0(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 20_Block_object_dispose(&STACK[0x360], 8) = a1;
  *(void *)(v3 + 216) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_217FF2F54;
  }
  else {
    uint64_t v4 = sub_21800EBF4;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_21800EBF4()
{
  *(void *)(v0 + 16) = *(void *)(v0 + 208);
  uint64_t v1 = *(void *)(v0 + 192);
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 4_Block_object_dispose(&STACK[0x360], 8) = &off_26C8F99B8;
  type metadata accessor for QLAccessoryExtensionProxy();
  uint64_t v17 = swift_allocObject();
  uint64_t v2 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 16, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = (void *)swift_task_alloc();
  (*(void (**)(void *, uint64_t, uint64_t))(v3 + 16))(v4, v2, v1);
  *(void *)(v0 + 56) = *v4;
  *(void *)(v0 + 80) = v1;
  *(void *)(v0 + 8_Block_object_dispose(&STACK[0x360], 8) = &off_26C8F99B8;
  uint64_t v5 = qword_267BB94D8;
  swift_retain_n();
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = *(void *)(v0 + 184);
  uint64_t v7 = *(void *)(v0 + 168);
  uint64_t v16 = *(void *)(v0 + 160);
  uint64_t v8 = *(void *)(v0 + 144);
  uint64_t v14 = *(void *)(v0 + 96);
  uint64_t v15 = *(void *)(v0 + 136);
  uint64_t v9 = (void *)qword_267BBD390;
  *(void *)(v17 + 16) = qword_267BBD390;
  *(void *)(v17 + 64) = 0;
  sub_217FF3064((long long *)(v0 + 56), v17 + 24);
  id v10 = v9;
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_release();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v14, v15);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  uint64_t v12 = *(void *)(v0 + 208);
  return v11(v12, v17);
}

unint64_t sub_21800EE20()
{
  unint64_t result = qword_267BBAD10;
  if (!qword_267BBAD10)
  {
    type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBAD10);
  }
  return result;
}

uint64_t sub_21800EE78(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v11 = *(void (**)(uint64_t, double, double, double, double))(a1 + 32);
  swift_retain();
  v11(a2, a3, a4, a5, a6);

  return swift_release();
}

id sub_21800EEFC(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v48 = a1;
  uint64_t v45 = a5;
  uint64_t v46 = a2;
  uint64_t v43 = a4;
  uint64_t v6 = sub_218037DF4();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_218038184();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_218037D74();
  uint64_t v14 = *(void *)(v44 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v44);
  uint64_t v40 = v16;
  uint64_t v41 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v40 - v17;
  id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F61090]), sel_init);
  uint64_t v47 = a3;
  objc_msgSend(v42, sel_setPrintPageRenderer_, a3);
  uint64_t v19 = self;
  sub_218038144();
  uint64_t v20 = (void *)sub_218038134();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  id v21 = objc_msgSend(v48, sel_uuid);
  sub_218037DD4();

  unint64_t v22 = (void *)sub_218037DC4();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  id v23 = objc_msgSend(v19, sel__QLTemporaryFileURLWithType_uuid_, v20, v22);

  sub_218037D54();
  unint64_t v24 = v18;
  id v48 = (id)sub_218037D34();
  id result = objc_msgSend(v49, sel_view);
  if (result)
  {
    uint64_t v26 = result;
    id v27 = objc_msgSend(result, sel_window);

    id v28 = objc_msgSend(v27, sel_windowScene);
    uint64_t v29 = v41;
    uint64_t v30 = v44;
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v41, v24, v44);
    unint64_t v31 = (*(unsigned __int8 *)(v14 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    uint64_t v32 = (char *)swift_allocObject();
    uint64_t v34 = v45;
    uint64_t v33 = v46;
    *((void *)v32 + 2) = v43;
    *((void *)v32 + 3) = v34;
    uint64_t v35 = v47;
    *((void *)v32 + 4) = v33;
    *((void *)v32 + 5) = v35;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v32[v31], v29, v30);
    aBlock[4] = sub_21800F738;
    aBlock[5] = v32;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21800FB40;
    aBlock[3] = &block_descriptor_7;
    uint64_t v36 = _Block_copy(aBlock);
    swift_retain();
    swift_unknownObjectRetain();
    id v37 = v35;
    swift_release();
    id v38 = v42;
    id v39 = v48;
    objc_msgSend(v42, sel_savePDFToURL_showProgress_hostingScene_completionHandler_, v48, 0, v28, v36);
    _Block_release(v36);

    return (id)(*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v24, v30);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_21800F398(uint64_t a1, char a2, void *a3, void (*a4)(void *), uint64_t a5, void *a6, void *a7, uint64_t a8)
{
  uint64_t v33 = a8;
  uint64_t v34 = a6;
  uint64_t v35 = a5;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9EA8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (uint64_t *)((char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = sub_218037D74();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    if (!a3)
    {
      uint64_t v19 = a7;
      objc_msgSend(a7, sel_printableRect);
      double v21 = v20;
      double v23 = v22;
      (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v33, v15);
      unint64_t v24 = (*(unsigned __int8 *)(v16 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
      uint64_t v25 = (char *)swift_allocObject();
      uint64_t v26 = v34;
      *((void *)v25 + 2) = v34;
      *((void *)v25 + 3) = a7;
      uint64_t v27 = v35;
      *((void *)v25 + 4) = a4;
      *((void *)v25 + 5) = v27;
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(&v25[v24], v18, v15);
      aBlock[4] = sub_21800FD10;
      aBlock[5] = v25;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_21800FAEC;
      aBlock[3] = &block_descriptor_6_1;
      id v28 = _Block_copy(aBlock);
      swift_unknownObjectRetain();
      id v29 = v19;
      swift_retain();
      swift_release();
      objc_msgSend(v26, sel_numberOfPagesWithSize_completionHandler_, v28, v21, v23);
      _Block_release(v28);
      return;
    }
  }
  else if (!a3)
  {
    id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F087E8]), sel_init);
    goto LABEL_7;
  }
  id v30 = a3;
LABEL_7:
  *uint64_t v14 = v30;
  swift_storeEnumTagMultiPayload();
  id v31 = a3;
  a4(v14);
  sub_21800FBD4((uint64_t)v14);
}

uint64_t sub_21800F65C()
{
  uint64_t v1 = sub_218037D74();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_21800F738(uint64_t a1, char a2, void *a3)
{
  uint64_t v7 = *(void *)(sub_218037D74() - 8);
  uint64_t v8 = (void (*)(void *))v3[2];
  uint64_t v9 = v3[3];
  uint64_t v10 = (void *)v3[4];
  uint64_t v11 = (void *)v3[5];
  uint64_t v12 = (uint64_t)v3 + ((*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  sub_21800F398(a1, a2, a3, v8, v9, v10, v11, v12);
}

void sub_21800F7C8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_218037D74();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)aBlock - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a6, v11);
  unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a4;
  *(void *)(v15 + 24) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v15 + v14, (char *)aBlock - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
  *(void *)(v15 + ((v13 + v14 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  aBlock[4] = sub_21800FE60;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21800EE78;
  aBlock[3] = &block_descriptor_12_1;
  uint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(a2, sel_provideCurrentPageAndVisibleRectWithCompletionHandler_, v16);
  _Block_release(v16);
}

uint64_t sub_21800F9A0(uint64_t a1, void (*a2)(char *), double a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9EA8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_218037D74();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v19, a8, v20);
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    double v22 = (int *)_s12GeneratedPDFVMa();
    *(void *)&v19[v22[5]] = a9;
    *(void *)&v19[v22[6]] = a1;
    double v23 = (double *)&v19[v22[7]];
    double *v23 = a3;
    v23[1] = a4;
    v23[2] = a5;
    v23[3] = a6;
    swift_storeEnumTagMultiPayload();
    a2(v19);
    return sub_21800FBD4((uint64_t)v19);
  }
  return result;
}

uint64_t sub_21800FAEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_21800FB40(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v7 = *(void (**)(id, uint64_t, void *))(a1 + 32);
  swift_retain();
  id v9 = a2;
  id v8 = a4;
  v7(v9, a3, a4);
  swift_release();
}

uint64_t sub_21800FBD4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9EA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21800FC34()
{
  uint64_t v1 = sub_218037D74();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_21800FD10(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_218037D74() - 8);
  uint64_t v4 = (void *)v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  sub_21800F7C8(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_21800FD88()
{
  uint64_t v1 = sub_218037D74();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_21800FE60(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v11 = *(void *)(sub_218037D74() - 8);
  unint64_t v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = *(void (**)(char *))(v5 + 16);
  uint64_t v14 = *(void *)(v5 + 24);
  uint64_t v15 = *(void *)(v5 + ((*(void *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_21800F9A0(a1, v13, a2, a3, a4, a5, v14, v5 + v12, v15);
}

uint64_t _s12GeneratedPDFVMa()
{
  uint64_t result = qword_267BBA690;
  if (!qword_267BBA690) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_21800FF7C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_218037D74();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)a1 + v_Block_object_dispose(&STACK[0x360], 8) = *(uint64_t *)((char *)a2 + v8);
    uint64_t v9 = a3[7];
    uint64_t v10 = (_OWORD *)((char *)a1 + v9);
    uint64_t v11 = (_OWORD *)((char *)a2 + v9);
    long long v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
  }
  return a1;
}

uint64_t sub_218010064(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_218037D74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = (_OWORD *)(a1 + v8);
  uint64_t v10 = (_OWORD *)(a2 + v8);
  long long v11 = v10[1];
  _OWORD *v9 = *v10;
  v9[1] = v11;
  return a1;
}

uint64_t sub_2180100FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_218037D74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  return a1;
}

uint64_t sub_2180101B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_218037D74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = (_OWORD *)(a1 + v8);
  uint64_t v10 = (_OWORD *)(a2 + v8);
  long long v11 = v10[1];
  _OWORD *v9 = *v10;
  v9[1] = v11;
  return a1;
}

uint64_t sub_218010248(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_218037D74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = (_OWORD *)(a1 + v8);
  uint64_t v10 = (_OWORD *)(a2 + v8);
  long long v11 = v10[1];
  _OWORD *v9 = *v10;
  v9[1] = v11;
  return a1;
}

uint64_t sub_2180102E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2180102F4);
}

uint64_t sub_2180102F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_218037D74();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_218010360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_218010374);
}

uint64_t sub_218010374(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_218037D74();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_2180103E4()
{
  uint64_t result = sub_218037D74();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_21801048C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA6D8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA250);
  uint64_t v6 = sub_218038B54();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (uint64_t)&v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_217FF6F30(v12, (uint64_t)v5, &qword_267BBA6D8);
    unint64_t result = sub_2180086B4((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_218037DF4();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    uint64_t v19 = v7[7];
    uint64_t v20 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
    unint64_t result = sub_2180010D4(v9, v19 + *(void *)(*(void *)(v20 - 8) + 72) * v16);
    uint64_t v21 = v7[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    v7[2] = v23;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_2180106A8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA268);
  uint64_t v2 = sub_218038B54();
  uint64_t v3 = (void *)v2;
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
    sub_217FF6F30(v6, (uint64_t)&v15, &qword_267BBA6E0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_21800874C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_217FF363C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_2180107E0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA6D0);
  uint64_t v2 = (void *)sub_218038B54();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_2180087C4(v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
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

unint64_t sub_2180108EC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA6B8);
  uint64_t v2 = sub_218038B54();
  uint64_t v3 = (void *)v2;
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
    sub_217FF6F30(v6, (uint64_t)&v13, &qword_267BBA6C0);
    uint64_t v7 = v13;
    unint64_t result = sub_2180087C4(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_217FF363C(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

uint64_t sub_218010A3C()
{
  return (*(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 16) != 255) & *(unsigned char *)(v0 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 16);
}

void *sub_218010AD4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content;
  int v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 16);
  if (v2 == 255) {
    return 0;
  }
  uint64_t v3 = *(void **)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  uint64_t v5 = *(void **)v1;
  if (v2)
  {
    sub_218010BB4(v5, v4, 1);
    sub_218010BB4(v3, v4, 1);
    id v6 = objc_msgSend(v3, sel_string);
    uint64_t v7 = sub_218038624();

    sub_218010BC4(v3, v4, v2);
    sub_218010BC4(v3, v4, v2);
    return (void *)v7;
  }
  else
  {
    sub_218010BB4(v5, v4, 0);
  }
  return v3;
}

id sub_218010BB4(void *a1, uint64_t a2, char a3)
{
  if (a3) {
    return a1;
  }
  else {
    return (id)swift_bridgeObjectRetain();
  }
}

void sub_218010BC4(void *a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    sub_218010BDC(a1, a2, a3 & 1);
  }
}

void sub_218010BDC(void *a1, uint64_t a2, char a3)
{
  if (a3) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

id sub_218010C30()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content;
  int v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 16);
  if (v2 == 255) {
    return 0;
  }
  uint64_t v3 = *(void **)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  if (v2)
  {
    sub_218010BB4(*(void **)v1, *(void *)(v1 + 8), 1);
  }
  else
  {
    id v5 = objc_allocWithZone(MEMORY[0x263F086A0]);
    sub_218010BB4(v3, v4, 0);
    id v6 = (void *)sub_2180385F4();
    id v7 = objc_msgSend(v5, sel_initWithString_, v6);

    sub_218010BC4(v3, v4, v2);
    return v7;
  }
  return v3;
}

void sub_218010CFC(void *a1)
{
  int v2 = &v1[OBJC_IVAR____TtC9QuickLook14QLTextDocument_content];
  int v3 = v1[OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 16];
  if (v3 != 255)
  {
    id v5 = *(void **)v2;
    uint64_t v6 = *((void *)v2 + 1);
    if (v3)
    {
      *(void *)int v2 = a1;
      *((void *)v2 + 1) = v6 & 1;
      v2[16] = 1;
      sub_218010E20(v5, v6, v3);
      id v14 = a1;
      BOOL v11 = v5;
      uint64_t v12 = v6;
      unsigned __int8 v13 = v3;
    }
    else
    {
      sub_218010BB4(*(void **)v2, *((void *)v2 + 1), 0);
      id v7 = objc_msgSend(a1, sel_string);
      uint64_t v8 = sub_218038624();
      uint64_t v10 = v9;

      BOOL v11 = *(void **)v2;
      uint64_t v12 = *((void *)v2 + 1);
      *(void *)int v2 = v8;
      *((void *)v2 + 1) = v10;
      unsigned __int8 v13 = v2[16];
      v2[16] = 0;
    }
    sub_218010BC4(v11, v12, v13);
    objc_msgSend(v1, sel_updateChangeCount_, 0);
    sub_218010BC4(v5, v6, v3);
  }
}

id sub_218010E20(id result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_218010BB4(result, a2, a3 & 1);
  }
  return result;
}

void sub_218010EA0(uint64_t a1@<X8>)
{
  v41[13] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = sub_218038684();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content;
  int v9 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 16);
  if (v9 == 255)
  {
    *(void *)(a1 + 24) = MEMORY[0x263F06F78];
    *(_OWORD *)a1 = xmmword_2180451A0;
    return;
  }
  BOOL v11 = *(void **)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA6A8);
    if (v10)
    {
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_218045190;
      id v29 = (void *)*MEMORY[0x263F814D0];
      id v30 = (void *)*MEMORY[0x263F81550];
      *(void *)(inited + 32) = *MEMORY[0x263F814D0];
      *(void *)(inited + 40) = v30;
      sub_218010BB4(v11, v10, 1);
      sub_218010E20(v11, v10, v9);
      id v31 = v29;
      id v32 = v30;
      unint64_t v33 = sub_2180107E0(inited);
      id v34 = objc_msgSend(v11, sel_length);
      sub_21801139C(v33);
      swift_bridgeObjectRelease();
      type metadata accessor for DocumentAttributeKey(0);
      sub_2180123B0(&qword_267BB96F8, type metadata accessor for DocumentAttributeKey);
      uint64_t v35 = (void *)sub_2180385A4();
      swift_bridgeObjectRelease();
      v41[0] = 0;
      id v36 = objc_msgSend(v11, sel_fileWrapperFromRange_documentAttributes_error_, 0, v34, v35, v41);

      id v37 = v41[0];
      if (v36)
      {
        *(void *)(a1 + 24) = sub_218011740();
        id v38 = v37;
        sub_218010BC4(v11, v10, v9);
        sub_218010BC4(v11, v10, v9);
        *(void *)a1 = v36;
        return;
      }
      id v24 = v41[0];
    }
    else
    {
      uint64_t v15 = swift_initStackObject();
      *(_OWORD *)(v15 + 16) = xmmword_218045190;
      uint64_t v16 = (void *)*MEMORY[0x263F814D0];
      long long v17 = (void *)*MEMORY[0x263F81558];
      *(void *)(v15 + 32) = *MEMORY[0x263F814D0];
      *(void *)(v15 + 40) = v17;
      sub_218010BB4(v11, v10, 1);
      sub_218010E20(v11, v10, v9);
      id v18 = v16;
      id v19 = v17;
      unint64_t v20 = sub_2180107E0(v15);
      id v21 = objc_msgSend(v11, sel_length);
      sub_21801139C(v20);
      swift_bridgeObjectRelease();
      type metadata accessor for DocumentAttributeKey(0);
      sub_2180123B0(&qword_267BB96F8, type metadata accessor for DocumentAttributeKey);
      BOOL v22 = (void *)sub_2180385A4();
      swift_bridgeObjectRelease();
      v41[0] = 0;
      id v23 = objc_msgSend(v11, sel_dataFromRange_documentAttributes_error_, 0, v21, v22, v41);

      id v24 = v41[0];
      if (v23)
      {
        uint64_t v25 = sub_218037DA4();
        uint64_t v27 = v26;

        *(void *)(a1 + 24) = MEMORY[0x263F06F78];
        sub_218010BC4(v11, v10, v9);
        sub_218010BC4(v11, v10, v9);
        *(void *)a1 = v25;
        *(void *)(a1 + _Block_object_dispose(&STACK[0x360], 8) = v27;
        return;
      }
    }
    id v39 = v24;
    sub_218037D04();

    swift_willThrow();
    sub_218010BC4(v11, v10, v9);
    sub_218010BC4(v11, v10, v9);
  }
  else
  {
    v40[1] = v2;
    swift_bridgeObjectRetain();
    sub_218038654();
    uint64_t v12 = sub_218038634();
    unint64_t v14 = v13;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(void *)(a1 + 24) = MEMORY[0x263F06F78];
    sub_218010BC4(v11, v10, v9);
    if (v14 >> 60 == 15)
    {
      *(_OWORD *)a1 = xmmword_2180451A0;
    }
    else
    {
      *(void *)a1 = v12;
      *(void *)(a1 + _Block_object_dispose(&STACK[0x360], 8) = v14;
    }
  }
}

uint64_t sub_21801139C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA6C8);
    uint64_t v2 = sub_218038B54();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v29 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v28 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v30 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v30 << 6);
      goto LABEL_28;
    }
    int64_t v11 = v30 + 1;
    if (__OFADD__(v30, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v11 >= v28) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v29 + 8 * v11);
    int64_t v13 = v30 + 1;
    if (!v12)
    {
      int64_t v13 = v30 + 2;
      if (v30 + 2 >= v28) {
        goto LABEL_37;
      }
      unint64_t v12 = *(void *)(v29 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v30 + 3;
        if (v30 + 3 >= v28) {
          goto LABEL_37;
        }
        unint64_t v12 = *(void *)(v29 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v30 + 4;
          if (v30 + 4 >= v28) {
            goto LABEL_37;
          }
          unint64_t v12 = *(void *)(v29 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v30 = v13;
LABEL_28:
    uint64_t v16 = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    *(void *)&v33[0] = *(void *)(*(void *)(a1 + 48) + 8 * v10);
    uint64_t v15 = *(void **)&v33[0];
    *(void *)&v32[0] = v16;
    type metadata accessor for DocumentType(0);
    id v17 = v15;
    id v18 = v16;
    swift_dynamicCast();
    uint64_t v19 = *(void *)&v33[0];
    sub_217FF363C((_OWORD *)((char *)v33 + 8), v31);
    sub_217FF363C(v31, v33);
    sub_217FF363C(v33, v32);
    sub_218038624();
    sub_218038C24();
    sub_2180386B4();
    uint64_t v20 = sub_218038C44();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v21 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v22 = v20 & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v6 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v8 = __clz(__rbit64((-1 << v22) & ~*(void *)(v6 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v6 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v8 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v6 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(void *)(*(void *)(v2 + 48) + 8 * v_Block_object_dispose(&STACK[0x360], 8) = v19;
    uint64_t result = (uint64_t)sub_217FF363C(v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v8));
    ++*(void *)(v2 + 16);
  }
  int64_t v14 = v30 + 5;
  if (v30 + 5 >= v28)
  {
LABEL_37:
    swift_release();
    sub_217FF57AC();
    return v2;
  }
  unint64_t v12 = *(void *)(v29 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v30 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v28) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v29 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t sub_218011740()
{
  unint64_t result = qword_267BBA6B0;
  if (!qword_267BBA6B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BBA6B0);
  }
  return result;
}

void sub_218011858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v51 = a2;
  uint64_t v7 = sub_218038684();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_218038184();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  int64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217FE7A00(a1, (uint64_t)v50);
  if (swift_dynamicCast())
  {
    uint64_t v47 = v3;
    uint64_t v13 = (uint64_t)v48;
    unint64_t v12 = v49;
    if (a3)
    {
      uint64_t v46 = v4;
      sub_218038154();
      uint64_t v14 = a3;
      uint64_t v15 = sub_218038124();
      uint64_t v17 = v16;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      if (v15 == v51 && v17 == v14)
      {
        swift_bridgeObjectRelease();
        uint64_t v20 = v46;
      }
      else
      {
        char v19 = sub_218038BB4();
        swift_bridgeObjectRelease();
        uint64_t v20 = v46;
        if ((v19 & 1) == 0) {
          goto LABEL_8;
        }
      }
      sub_217FF6E84(v13, v12);
      unint64_t v42 = sub_2180108EC(MEMORY[0x263F8EE78]);
      id v43 = objc_allocWithZone(MEMORY[0x263F086A0]);
      id v44 = sub_218011FB0(v13, v12, v42, 0);
      sub_217FF6DDC(v13, v12);
      if (v20)
      {
LABEL_24:
        sub_217FF6DDC(v13, v12);
        return;
      }
      uint64_t v45 = v47 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content;
      BOOL v26 = *(void **)(v47 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content);
      uint64_t v27 = *(void *)(v47 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 8);
      *(void *)uint64_t v45 = v44;
      *(void *)(v45 + _Block_object_dispose(&STACK[0x360], 8) = 0;
      unsigned __int8 v28 = *(unsigned char *)(v45 + 16);
      *(unsigned char *)(v45 + 16) = 1;
LABEL_23:
      sub_218010BC4(v26, v27, v28);
      goto LABEL_24;
    }
LABEL_8:
    sub_218038654();
    uint64_t v21 = sub_218038644();
    if (v22) {
      uint64_t v23 = v21;
    }
    else {
      uint64_t v23 = 0;
    }
    unint64_t v24 = 0xE000000000000000;
    if (v22) {
      unint64_t v24 = v22;
    }
    uint64_t v25 = v47 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content;
    BOOL v26 = *(void **)(v47 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content);
    uint64_t v27 = *(void *)(v47 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 8);
    *(void *)uint64_t v25 = v23;
    *(void *)(v25 + _Block_object_dispose(&STACK[0x360], 8) = v24;
    unsigned __int8 v28 = *(unsigned char *)(v25 + 16);
    *(unsigned char *)(v25 + 16) = 0;
    goto LABEL_23;
  }
  sub_217FE7A00(a1, (uint64_t)v50);
  sub_218011740();
  if (swift_dynamicCast())
  {
    id v29 = v48;
    id v30 = objc_msgSend(v48, sel_serializedRepresentation);
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = sub_218037DA4();
      unint64_t v34 = v33;

      sub_217FF6E84(v32, v34);
      unint64_t v35 = sub_2180108EC(MEMORY[0x263F8EE78]);
      id v36 = objc_allocWithZone(MEMORY[0x263F086A0]);
      id v37 = sub_218011FB0(v32, v34, v35, 0);
      sub_217FF6DDC(v32, v34);
      if (!v4)
      {
        uint64_t v38 = v3 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content;
        id v39 = *(void **)(v3 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content);
        uint64_t v40 = *(void *)(v3 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 8);
        *(void *)uint64_t v38 = v37;
        *(void *)(v38 + _Block_object_dispose(&STACK[0x360], 8) = 1;
        unsigned __int8 v41 = *(unsigned char *)(v38 + 16);
        *(unsigned char *)(v38 + 16) = 1;
        sub_218010BC4(v39, v40, v41);
      }
      sub_217FF6DDC(v32, v34);
    }
  }
}

id QLTextDocument.__allocating_init(fileURL:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  uint64_t v4 = (void *)sub_218037D34();
  id v5 = objc_msgSend(v3, sel_initWithFileURL_, v4);

  uint64_t v6 = sub_218037D74();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return v5;
}

id QLTextDocument.init(fileURL:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = &v2[OBJC_IVAR____TtC9QuickLook14QLTextDocument_content];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = -1;
  id v5 = (void *)sub_218037D34();
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for QLTextDocument();
  id v6 = objc_msgSendSuper2(&v9, sel_initWithFileURL_, v5);

  uint64_t v7 = sub_218037D74();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
  return v6;
}

id QLTextDocument.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLTextDocument();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_218011FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v12[1] = *(id *)MEMORY[0x263EF8340];
  id v6 = (void *)sub_218037D94();
  type metadata accessor for DocumentReadingOptionKey(0);
  sub_2180123B0(&qword_267BB9748, type metadata accessor for DocumentReadingOptionKey);
  uint64_t v7 = (void *)sub_2180385A4();
  swift_bridgeObjectRelease();
  v12[0] = 0;
  id v8 = objc_msgSend(v4, sel_initWithData_options_documentAttributes_error_, v6, v7, a4, v12);

  if (v8)
  {
    id v9 = v12[0];
  }
  else
  {
    id v10 = v12[0];
    sub_218037D04();

    swift_willThrow();
  }
  return v8;
}

uint64_t type metadata accessor for QLTextDocument()
{
  return self;
}

uint64_t method lookup function for QLTextDocument(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for QLTextDocument);
}

uint64_t dispatch thunk of QLTextDocument.hasRichContent.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of QLTextDocument.textContent.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of QLTextDocument.attributedTextContent.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of QLTextDocument.save(textContent:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

void destroy for QLTextDocument.Content(uint64_t a1)
{
}

uint64_t _s9QuickLook14QLTextDocumentC7ContentOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_218010BB4(*(void **)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x360], 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for QLTextDocument.Content(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_218010BB4(*(void **)a2, v4, v5);
  id v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x360], 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_218010BDC(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for QLTextDocument.Content(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_218010BDC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for QLTextDocument.Content(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for QLTextDocument.Content(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 255;
    *(void *)(result + _Block_object_dispose(&STACK[0x360], 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_21801238C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_218012394(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for QLTextDocument.Content()
{
  return &type metadata for QLTextDocument.Content;
}

uint64_t sub_2180123B0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for QLTextDocument.RichTextType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2180124C4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for QLTextDocument.RichTextType()
{
  return &type metadata for QLTextDocument.RichTextType;
}

unint64_t sub_218012500()
{
  unint64_t result = qword_267BBA6E8;
  if (!qword_267BBA6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA6E8);
  }
  return result;
}

void sub_218012554(void *a1, uint64_t a2, uint64_t a3)
{
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    unsigned int v6 = (void *)v5;
    swift_getKeyPath();
    sub_217FF3084();
    id v7 = a1;
    sub_218037E24();
    swift_release();
    uint64_t v8 = *(void *)(a3 + 16);
    if (v8)
    {
      sub_217FF2924(v8);
      swift_retain();
      sub_2180389B4();
      type metadata accessor for QLHostPlaceholderUIView();
      id v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
      objc_msgSend(v6, sel_setPlaceholderView_, v9);
      swift_release();
      swift_release();
    }
    else
    {
      sub_2180389B4();
    }
  }
  else
  {
    sub_218038B14();
    __break(1u);
  }
}

id sub_2180126E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLHostPrimaryViewControllerWrapper.HostCoordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21801276C()
{
  return type metadata accessor for QLHostPrimaryViewControllerWrapper.HostCoordinator();
}

uint64_t type metadata accessor for QLHostPrimaryViewControllerWrapper.HostCoordinator()
{
  uint64_t result = qword_267BBA700;
  if (!qword_267BBA700) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2180127C0()
{
  sub_218012860();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_218012860()
{
  if (!qword_267BBA710)
  {
    sub_218037F74();
    unint64_t v0 = sub_2180389C4();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BBA710);
    }
  }
}

ValueMetadata *type metadata accessor for QLHostPrimaryViewControllerWrapper()
{
  return &type metadata for QLHostPrimaryViewControllerWrapper;
}

void sub_2180128CC(void *a1, uint64_t a2)
{
  sub_218012554(a1, a2, *v2);
}

id sub_2180128D4@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  unsigned int v4 = (objc_class *)type metadata accessor for QLHostPrimaryViewControllerWrapper.HostCoordinator();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  unsigned int v6 = &v5[OBJC_IVAR____TtCV9QuickLook34QLHostPrimaryViewControllerWrapper15HostCoordinator_identity];
  uint64_t v7 = sub_218037F74();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(void *)&v5[OBJC_IVAR____TtCV9QuickLook34QLHostPrimaryViewControllerWrapper15HostCoordinator_parent] = v3;
  v9.receiver = v5;
  v9.super_class = v4;
  swift_retain();
  id result = objc_msgSendSuper2(&v9, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_2180129A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_218012D60();

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_218012A04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_218012D60();

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_218012A68()
{
}

unint64_t sub_218012A94()
{
  unint64_t result = qword_267BBA718;
  if (!qword_267BBA718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA718);
  }
  return result;
}

id sub_218012AF0(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04E68]), sel_init);
  id result = objc_msgSend(v2, sel_view);
  if (!result) {
    goto LABEL_15;
  }
  unsigned int v4 = result;
  id v5 = objc_msgSend(result, sel_subviews);

  sub_218012D20();
  unint64_t v6 = sub_218038764();

  uint64_t v15 = a1;
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_218038B24();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (!v7) {
    goto LABEL_11;
  }
  id result = self;
  if (v7 < 1)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v8 = result;
  uint64_t v9 = 0;
  do
  {
    if ((v6 & 0xC000000000000001) != 0) {
      id v10 = (id)MEMORY[0x21D45EB20](v9, v6);
    }
    else {
      id v10 = *(id *)(v6 + 8 * v9 + 32);
    }
    int64_t v11 = v10;
    ++v9;
    id v12 = objc_msgSend(v8, sel_clearColor, v15);
    objc_msgSend(v11, sel_setBackgroundColor_, v12);
  }
  while (v7 != v9);
LABEL_11:
  swift_bridgeObjectRelease_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA730);
  sub_2180383C4();
  objc_msgSend(v2, sel_setDelegate_, v16);

  id result = objc_msgSend(v2, sel_view);
  if (result)
  {
    uint64_t v13 = result;
    id v14 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v13, sel_setBackgroundColor_, v14);

    return v2;
  }
LABEL_16:
  __break(1u);
  return result;
}

unint64_t sub_218012D20()
{
  unint64_t result = qword_267BBA728;
  if (!qword_267BBA728)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BBA728);
  }
  return result;
}

unint64_t sub_218012D60()
{
  unint64_t result = qword_267BBA738;
  if (!qword_267BBA738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA738);
  }
  return result;
}

uint64_t sub_218012DB4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA740);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Void __swiftcall QLPreviewController.loadView()()
{
  id v1 = objc_allocWithZone((Class)type metadata accessor for QLPreviewControllerView());
  id v2 = v0;
  id v3 = objc_msgSend(v1, sel_init);
  swift_unknownObjectWeakAssign();
  id v14 = v3;
  unsigned int v4 = (void *)sub_2180385F4();
  objc_msgSend(v14, sel_setAccessibilityIdentifier_, v4);

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    id v5 = objc_msgSend(self, sel_mainScreen);
    objc_msgSend(v5, sel_bounds);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v14, sel_setFrame_, v7, v9, v11, v13);
    objc_msgSend(v14, sel_setAutoresizingMask_, 18);
  }

  objc_msgSend(v2, sel_setView_, v14);
}

uint64_t type metadata accessor for QLPreviewControllerView()
{
  return self;
}

id sub_2180130D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLPreviewControllerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_218013118(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v11 = sub_218038044();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9E70);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = (void *)MEMORY[0x21D460130](&v5[OBJC_IVAR____TtC9QuickLook23QLPreviewControllerView_previewController]);
  if (!v18) {
    goto LABEL_8;
  }
  char v19 = v18;
  id v20 = objc_msgSend(v18, sel_internalCurrentPreviewItem);
  if (!v20)
  {

LABEL_8:
    uint64_t v32 = (objc_class *)type metadata accessor for QLPreviewControllerView();
    v44.receiver = v5;
    v44.super_class = v32;
    return objc_msgSendSuper2(&v44, sel__intelligenceCollectContentIn_collector_, a1, a2, a3, a4, a5);
  }
  uint64_t v21 = v20;
  unint64_t v42 = a1;
  uint64_t v41 = swift_allocBox();
  uint64_t v23 = v22;
  uint64_t v24 = sub_218038184();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 1, 1, v24);
  id v25 = objc_msgSend(v21, sel_previewItemContentType);
  if (v25)
  {
    BOOL v26 = v25;
    sub_218038624();

    sub_218038194();
    sub_2180157F8((uint64_t)v17, v23);
  }
  id v27 = objc_msgSend(v21, sel_previewItemTitle);
  if (v27)
  {
    unsigned __int8 v28 = v27;
    uint64_t v29 = sub_218038624();
    uint64_t v31 = v30;
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v31 = 0;
  }
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F81A30], v11);
  unint64_t v34 = v42;
  uint64_t v35 = sub_218037F84();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  id v36 = (void *)swift_allocObject();
  _OWORD v36[2] = v41;
  v36[3] = v21;
  v36[4] = v35;
  v36[5] = v34;
  v36[6] = v29;
  v36[7] = v31;
  v36[8] = v19;
  aBlock[4] = sub_2180157E4;
  aBlock[5] = v36;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_217FEFC38;
  aBlock[3] = &block_descriptor_8;
  id v37 = _Block_copy(aBlock);
  swift_retain();
  id v38 = v21;
  swift_retain();
  id v39 = v34;
  id v40 = v19;
  swift_release();
  objc_msgSend(v38, sel_prepareShareableURL_, v37);
  _Block_release(v37);

  swift_release();
  return (id)swift_release();
}

uint64_t sub_2180134F0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v172 = a7;
  uint64_t v196 = a6;
  uint64_t v181 = a5;
  uint64_t v183 = a4;
  uint64_t v197 = a3;
  v193 = a2;
  uint64_t v168 = sub_2180380E4();
  uint64_t v167 = *(void *)(v168 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v168);
  v166 = (char *)&v160 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v165 = (char *)&v160 - v10;
  uint64_t v171 = sub_2180380C4();
  uint64_t v170 = *(void *)(v171 - 8);
  MEMORY[0x270FA5388](v171);
  v169 = (char *)&v160 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA758);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  v178 = (char *)&v160 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v177 = (char *)&v160 - v15;
  uint64_t v16 = sub_218037FC4();
  MEMORY[0x270FA5388](v16 - 8);
  v179 = (char *)&v160 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v180 = sub_218038114();
  uint64_t v184 = *(void *)(v180 - 8);
  MEMORY[0x270FA5388](v180);
  v182 = (char *)&v160 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_218038044();
  uint64_t v195 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  v199 = (char *)&v160 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BB9E80);
  MEMORY[0x270FA5388](v21 - 8);
  v192 = (char *)&v160 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_218037D74();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v191 = (char *)&v160 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v163 = v26;
  MEMORY[0x270FA5388](v25);
  v187 = (char *)&v160 - v27;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9E70);
  uint64_t v29 = MEMORY[0x270FA5388](v28 - 8);
  uint64_t v188 = (uint64_t)&v160 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v176 = (uint64_t)&v160 - v32;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v173 = (uint64_t)&v160 - v34;
  MEMORY[0x270FA5388](v33);
  id v36 = (char *)&v160 - v35;
  uint64_t v37 = sub_218038184();
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  v175 = (char *)&v160 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  v174 = (char *)&v160 - v42;
  uint64_t v43 = MEMORY[0x270FA5388](v41);
  uint64_t v45 = (char *)&v160 - v44;
  MEMORY[0x270FA5388](v43);
  uint64_t v47 = (char *)&v160 - v46;
  uint64_t v164 = a1;
  uint64_t v48 = swift_projectBox();
  swift_beginAccess();
  uint64_t v190 = v48;
  sub_217FF6F30(v48, (uint64_t)v36, &qword_267BB9E70);
  unint64_t v49 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48);
  uint64_t v189 = v38 + 48;
  uint64_t v50 = v49;
  unsigned int v51 = v49((uint64_t)v36, 1, v37);
  uint64_t v198 = v19;
  uint64_t v194 = v37;
  uint64_t v186 = v38;
  v185 = v45;
  if (v51 == 1)
  {
    sub_217FF6BD8((uint64_t)v36, &qword_267BB9E70);
    uint64_t v52 = v195;
    uint64_t v53 = v199;
    uint64_t v54 = v23;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v47, v36, v37);
    sub_218038144();
    char v55 = sub_218038174();
    uint64_t v56 = v23;
    uint64_t v57 = *(void (**)(char *, uint64_t))(v38 + 8);
    v57(v45, v37);
    v57(v47, v37);
    uint64_t v58 = v198;
    uint64_t v53 = v199;
    uint64_t v54 = v56;
    uint64_t v52 = v195;
    if (v55)
    {
LABEL_19:
      (*(void (**)(char *, void, uint64_t))(v52 + 104))(v53, *MEMORY[0x263F81A30], v58);
      sub_218038034();
      return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v53, v58);
    }
  }
  id v59 = objc_msgSend(v193, sel_shareableURL);
  if (!v59)
  {
    uint64_t v63 = (uint64_t)v192;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v192, 1, 1, v54);
    goto LABEL_15;
  }
  uint64_t v60 = v59;
  uint64_t v61 = v191;
  sub_218037D54();

  uint64_t v62 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
  uint64_t v63 = (uint64_t)v192;
  v62(v192, v61, v54);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v24 + 56))(v63, 0, 1, v54);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v63, 1, v54) == 1)
  {
LABEL_15:
    sub_217FF6BD8(v63, (uint64_t *)&unk_267BB9E80);
    goto LABEL_16;
  }
  uint64_t v64 = v187;
  v62(v187, (char *)v63, v54);
  if ((sub_218037D14() & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v24 + 8))(v64, v54);
LABEL_16:
    uint64_t v58 = v198;
    if (v196)
    {
      v97 = v53;
      uint64_t v98 = v190;
      swift_beginAccess();
      uint64_t v99 = v98;
      uint64_t v100 = v188;
      sub_217FF6F30(v99, v188, &qword_267BB9E70);
      uint64_t v101 = v194;
      if (v50(v100, 1, v194) == 1)
      {
        sub_217FF6BD8(v100, &qword_267BB9E70);
        uint64_t v53 = v97;
      }
      else
      {
        uint64_t v102 = v186;
        v103 = v175;
        (*(void (**)(char *, uint64_t, uint64_t))(v186 + 32))(v175, v100, v101);
        swift_bridgeObjectRetain();
        v104 = v185;
        sub_218038164();
        char v105 = sub_218038174();
        v106 = *(void (**)(char *, uint64_t))(v102 + 8);
        v106(v104, v101);
        v192 = (char *)v106;
        v193 = (void *)(v102 + 8);
        if (v105)
        {
          uint64_t v107 = v176;
          (*(void (**)(uint64_t, char *, uint64_t))(v102 + 16))(v176, v103, v101);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v102 + 56))(v107, 0, 1, v101);
          uint64_t v108 = sub_218037DB4();
          v109 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v108 - 8) + 56);
          v109(v177, 1, 1, v108);
          v109(v178, 1, 1, v108);
          sub_218037FA4();
          v110 = v199;
          sub_218038014();
          (*(void (**)(char *, void, uint64_t))(v52 + 104))(v110, *MEMORY[0x263F81A10], v58);
          sub_218038034();
          (*(void (**)(char *, uint64_t))(v52 + 8))(v110, v58);
          return ((uint64_t (*)(char *, uint64_t))v192)(v103, v194);
        }
        sub_218037F94();
        __swift_project_boxed_opaque_existential_0(&v200, v201);
        v111 = v182;
        sub_2180380D4();
        char v112 = sub_218038104();
        (*(void (**)(char *, uint64_t))(v184 + 8))(v111, v180);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v200);
        if (v112)
        {
          uint64_t v113 = v176;
          (*(void (**)(uint64_t, char *, uint64_t))(v102 + 16))(v176, v103, v101);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v102 + 56))(v113, 0, 1, v101);
          uint64_t v114 = sub_218037DB4();
          v115 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v114 - 8) + 56);
          v115(v177, 1, 1, v114);
          v115(v178, 1, 1, v114);
          sub_218037FA4();
          v116 = v199;
          sub_2180380B4();
          (*(void (**)(char *, void, uint64_t))(v52 + 104))(v116, *MEMORY[0x263F81A88], v58);
          sub_218038034();
          (*(void (**)(char *, uint64_t))(v52 + 8))(v116, v58);
          return ((uint64_t (*)(char *, uint64_t))v192)(v103, v194);
        }
        ((void (*)(char *, uint64_t))v192)(v103, v101);
        swift_bridgeObjectRelease();
        uint64_t v53 = v199;
      }
    }
    goto LABEL_19;
  }
  uint64_t v65 = v190;
  swift_beginAccess();
  uint64_t v66 = v173;
  sub_217FF6F30(v65, v173, &qword_267BB9E70);
  uint64_t v67 = v194;
  unsigned int v68 = v50(v66, 1, v194);
  uint64_t v162 = v24;
  uint64_t v161 = v54;
  v160 = (void (*)(unint64_t, char *, uint64_t))v62;
  if (v68 == 1)
  {
    uint64_t v69 = v53;
    sub_217FF6BD8(v66, &qword_267BB9E70);
    goto LABEL_9;
  }
  uint64_t v117 = v186;
  v118 = v174;
  (*(void (**)(char *, uint64_t, uint64_t))(v186 + 32))(v174, v66, v67);
  v119 = v185;
  sub_218038164();
  uint64_t v120 = v67;
  char v121 = sub_218038174();
  v122 = *(void (**)(char *, uint64_t))(v117 + 8);
  v122(v119, v120);
  v192 = (char *)v122;
  if (v121)
  {
    v193 = (void *)(v117 + 8);
    sub_218037F94();
    __swift_project_boxed_opaque_existential_0(&v200, v201);
    v123 = v191;
    sub_2180380D4();
    uint64_t v124 = v161;
    (*(void (**)(char *, char *, uint64_t))(v162 + 16))(v123, v64, v161);
    uint64_t v125 = v176;
    uint64_t v126 = v194;
    (*(void (**)(uint64_t, char *, uint64_t))(v117 + 16))(v176, v174, v194);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v117 + 56))(v125, 0, 1, v126);
    uint64_t v127 = sub_218037DB4();
    v128 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v127 - 8) + 56);
    v128(v177, 1, 1, v127);
    v128(v178, 1, 1, v127);
    swift_bridgeObjectRetain();
    v129 = v187;
    uint64_t v130 = v124;
    sub_218037FA4();
    v131 = v199;
    v132 = v174;
    sub_218038004();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v200);
    uint64_t v133 = v195;
    uint64_t v134 = v198;
    (*(void (**)(char *, void, uint64_t))(v195 + 104))(v131, *MEMORY[0x263F81A10], v198);
    sub_218038034();
    v135 = v192;
    (*(void (**)(char *, uint64_t))(v133 + 8))(v131, v134);
    uint64_t v136 = v162;
LABEL_32:
    ((void (*)(char *, uint64_t))v135)(v132, v194);
    return (*(uint64_t (**)(char *, uint64_t))(v136 + 8))(v129, v130);
  }
  sub_218037F94();
  __swift_project_boxed_opaque_existential_0(&v200, v201);
  v137 = v182;
  sub_2180380D4();
  char v138 = sub_218038104();
  (*(void (**)(char *, uint64_t))(v184 + 8))(v137, v180);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v200);
  if (v138)
  {
    v193 = (void *)(v117 + 8);
    sub_218037F94();
    __swift_project_boxed_opaque_existential_0(&v200, v201);
    sub_2180380D4();
    uint64_t v139 = v161;
    (*(void (**)(char *, char *, uint64_t))(v162 + 16))(v191, v64, v161);
    uint64_t v140 = v186;
    uint64_t v141 = v176;
    uint64_t v142 = v194;
    (*(void (**)(uint64_t, char *, uint64_t))(v186 + 16))(v176, v118, v194);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v140 + 56))(v141, 0, 1, v142);
    uint64_t v143 = sub_218037DB4();
    v144 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v143 - 8) + 56);
    v144(v177, 1, 1, v143);
    v144(v178, 1, 1, v143);
    swift_bridgeObjectRetain();
    v129 = v187;
    uint64_t v130 = v139;
    sub_218037FA4();
    v145 = v169;
    sub_218038094();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v200);
    uint64_t v146 = v170;
    v147 = v199;
    uint64_t v148 = v171;
    (*(void (**)(char *, char *, uint64_t))(v170 + 16))(v199, v145, v171);
    uint64_t v149 = v195;
    uint64_t v150 = v198;
    (*(void (**)(char *, void, uint64_t))(v195 + 104))(v147, *MEMORY[0x263F81A88], v198);
    sub_218038034();
    (*(void (**)(char *, uint64_t))(v149 + 8))(v147, v150);
    uint64_t v136 = v162;
    (*(void (**)(char *, uint64_t))(v146 + 8))(v145, v148);
    v132 = v174;
    v135 = v192;
    goto LABEL_32;
  }
  ((void (*)(char *, uint64_t))v192)(v118, v194);
  uint64_t v52 = v195;
  uint64_t v69 = v199;
LABEL_9:
  uint64_t v70 = v191;
  sub_218037F94();
  __swift_project_boxed_opaque_existential_0(&v200, v201);
  uint64_t v71 = v182;
  sub_2180380D4();
  v72 = v185;
  sub_218038144();
  char v73 = sub_218038104();
  (*(void (**)(char *, uint64_t))(v186 + 8))(v72, v194);
  uint64_t v74 = v184 + 8;
  uint64_t v75 = *(void (**)(char *, uint64_t))(v184 + 8);
  uint64_t v76 = v180;
  v75(v71, v180);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v200);
  if ((v73 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v162 + 8))(v187, v161);
    uint64_t v58 = v198;
    uint64_t v53 = v69;
    goto LABEL_19;
  }
  uint64_t v184 = v74;
  id v77 = objc_msgSend(v172, sel_printer);
  uint64_t v53 = v69;
  if (!v77)
  {
LABEL_35:
    (*(void (**)(char *, uint64_t))(v162 + 8))(v187, v161);
    uint64_t v58 = v198;
    goto LABEL_19;
  }
  uint64_t v78 = (uint64_t)v77;
  id v79 = objc_msgSend(objc_allocWithZone((Class)QLPreviewPrinter), sel_initWithPreviewPrinter_, v77);
  if (!v79)
  {
    swift_unknownObjectRelease();
    goto LABEL_35;
  }
  id v80 = v79;
  uint64_t v194 = v78;
  sub_218037F94();
  __swift_project_boxed_opaque_existential_0(&v200, v201);
  sub_2180380D4();
  uint64_t v81 = v165;
  sub_2180380F4();
  v75(v71, v76);
  uint64_t v82 = v167;
  uint64_t v83 = v166;
  uint64_t v84 = v168;
  (*(void (**)(char *, void, uint64_t))(v167 + 104))(v166, *MEMORY[0x263F81BD0], v168);
  sub_218015860();
  char v85 = sub_2180385E4();
  v86 = *(void (**)(char *, uint64_t))(v82 + 8);
  v86(v83, v84);
  v87 = v81;
  v88 = v80;
  v86(v87, v84);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v200);
  uint64_t v89 = v162;
  uint64_t v90 = v161;
  (*(void (**)(char *, char *, uint64_t))(v162 + 16))(v70, v187, v161);
  if (v85)
  {
    uint64_t v91 = v190;
    swift_beginAccess();
    sub_217FF6F30(v91, v176, &qword_267BB9E70);
    uint64_t v92 = sub_218037DB4();
    v93 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v92 - 8) + 56);
    v93(v177, 1, 1, v92);
    v93(v178, 1, 1, v92);
    swift_bridgeObjectRetain();
    sub_218037FA4();
    v94 = v199;
    sub_218038084();
    uint64_t v95 = v198;
    (*(void (**)(char *, void, uint64_t))(v52 + 104))(v94, *MEMORY[0x263F81A88], v198);
    sub_218038034();

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v94, v95);
    return (*(uint64_t (**)(char *, uint64_t))(v89 + 8))(v187, v161);
  }
  else
  {
    unint64_t v151 = (*(unsigned __int8 *)(v89 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80);
    unint64_t v152 = (v163 + v151 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v153 = swift_allocObject();
    uint64_t v154 = v164;
    *(void *)(v153 + 16) = v197;
    *(void *)(v153 + 24) = v154;
    v160(v153 + v151, v191, v90);
    v155 = (void *)(v153 + v152);
    uint64_t v156 = v196;
    void *v155 = v181;
    v155[1] = v156;
    swift_bridgeObjectRetain();
    uint64_t v157 = v90;
    uint64_t v158 = v194;
    swift_unknownObjectRetain();
    id v159 = v88;
    swift_retain();
    swift_retain();
    sub_21800EEFC(v193, v158, v159, (uint64_t)sub_2180159AC, v153);
    swift_release();
    swift_unknownObjectRelease_n();

    return (*(uint64_t (**)(char *, uint64_t))(v89 + 8))(v187, v157);
  }
}

void sub_218014D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v73 = a5;
  uint64_t v74 = a6;
  uint64_t v71 = a4;
  uint64_t v76 = a1;
  uint64_t v65 = sub_218038044();
  uint64_t v64 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v63 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_267BBA768);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v62 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_218037FD4();
  uint64_t v68 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  uint64_t v67 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_218037D74();
  uint64_t v80 = *(void *)(v75 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v75);
  id v59 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v57 - v13;
  uint64_t v61 = sub_2180380C4();
  uint64_t v60 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  v72 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA758);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v19 = (char *)&v57 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v57 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9E70);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v24 = (char *)&v57 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_218037FC4();
  uint64_t v78 = *(void *)(v25 - 8);
  uint64_t v79 = v25;
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  uint64_t v66 = (char *)&v57 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v57 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v81 = (char *)&v57 - v31;
  uint64_t v69 = _s12GeneratedPDFVMa();
  MEMORY[0x270FA5388](v69);
  uint64_t v77 = (uint64_t)&v57 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9EA8);
  MEMORY[0x270FA5388](v33);
  uint64_t v35 = (id *)((char *)&v57 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v36 = swift_projectBox();
  sub_217FF6F30(v76, (uint64_t)v35, &qword_267BB9EA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    id v37 = *v35;
    id v38 = *v35;
    sub_218038024();

    return;
  }
  uint64_t v76 = a2;
  uint64_t v39 = v77;
  sub_217FF6F94((uint64_t)v35, v77);
  swift_beginAccess();
  sub_217FF6F30(v36, (uint64_t)v24, &qword_267BB9E70);
  uint64_t v40 = sub_218037DB4();
  uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56);
  v41(v21, 1, 1, v40);
  v41(v19, 1, 1, v40);
  sub_218037FA4();
  sub_218037FB4();
  uint64_t v42 = *(void (**)(char *, uint64_t))(v78 + 8);
  uint64_t v71 = v78 + 8;
  uint64_t v58 = v42;
  v42(v30, v79);
  uint64_t v43 = *(void (**)(void, void, void))(v80 + 16);
  v80 += 16;
  uint64_t v57 = v43;
  v43(v14, v39, v75);
  (*(void (**)(char *, void, uint64_t))(v68 + 104))(v67, *MEMORY[0x263F818A8], v70);
  uint64_t v44 = sub_218038184();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v24, 1, 1, v44);
  v41(v21, 1, 1, v40);
  v41(v19, 1, 1, v40);
  swift_bridgeObjectRetain();
  sub_218037FA4();
  sub_218037FF4();
  swift_allocObject();
  sub_218037FE4();
  uint64_t v45 = v79;
  (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v30, v81, v79);
  uint64_t v46 = v72;
  sub_2180380A4();
  uint64_t v47 = v77;
  uint64_t v48 = v45;
  uint64_t v49 = *(void *)(v77 + *(int *)(v69 + 24));
  if (__OFADD__(v49, 1))
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v49 + 1 < v49)
  {
LABEL_8:
    __break(1u);
    return;
  }
  uint64_t v50 = v62;
  sub_218038054();
  uint64_t v51 = sub_218038064();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v50, 0, 1, v51);
  sub_218038074();
  uint64_t v52 = v60;
  uint64_t v53 = v63;
  uint64_t v54 = v61;
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v63, v46, v61);
  uint64_t v55 = v64;
  uint64_t v56 = v65;
  (*(void (**)(char *, void, uint64_t))(v64 + 104))(v53, *MEMORY[0x263F81A88], v65);
  sub_218038034();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v53, v56);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v46, v54);
  v58(v81, v48);
  sub_217FF6FF8(v47);
}

uint64_t sub_218015784()
{
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2180157E4()
{
  return sub_2180134F0(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void **)(v0 + 64));
}

uint64_t sub_2180157F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9E70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_218015860()
{
  unint64_t result = qword_267BBA760;
  if (!qword_267BBA760)
  {
    sub_2180380E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA760);
  }
  return result;
}

uint64_t sub_2180158B8()
{
  uint64_t v1 = sub_218037D74();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

void sub_2180159AC(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_218037D74() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + v4;
  uint64_t v8 = (uint64_t *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];

  sub_218014D68(a1, v5, v6, v7, v9, v10);
}

uint64_t sub_218015A54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t QLAccessoryAppExtensionScene.init(content:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0x726F737365636361;
  a3[1] = 0xE900000000000079;
  a3[2] = result;
  a3[3] = a2;
  return result;
}

uint64_t QLAccessoryAppExtensionScene.body.getter(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[3];
  type metadata accessor for QLAccessoryAppExtensionSceneProxy(0);
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_218037E54();
  uint64_t v6 = swift_allocObject();
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(v6 + 16) = v8;
  *(void *)(v6 + 24) = v7;
  *(void *)(v6 + 32) = v3;
  long long v9 = *(_OWORD *)(v1 + 1);
  *(_OWORD *)(v6 + 40) = v9;
  *(void *)(v6 + 56) = v4;
  *(void *)(v6 + 64) = v5;
  uint64_t v10 = v9;
  swift_bridgeObjectRetain_n();
  swift_retain();
  swift_retain();

  return MEMORY[0x270EEB958](v3, v10, sub_218015D58, v6, sub_218015E00, v5, v8, v7);
}

uint64_t sub_218015BCC@<X0>(uint64_t a1@<X4>, uint64_t a2@<X5>, char *a3@<X8>)
{
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v16 - v10;
  v12(v9);
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v13(v11, v8, a2);
  uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, a2);
  v13(a3, v11, a2);
  return ((uint64_t (*)(char *, uint64_t))v14)(v11, a2);
}

uint64_t sub_218015D10()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_218015D58@<X0>(char *a1@<X8>)
{
  return sub_218015BCC(*(void *)(v1 + 64), *(void *)(v1 + 16), a1);
}

uint64_t sub_218015D6C(id a1, uint64_t a2)
{
  if (qword_267BB94D8 != -1) {
    swift_once();
  }
  objc_msgSend(a1, sel_setExportedInterface_, qword_267BBD390);
  objc_msgSend(a1, sel_setExportedObject_, a2);
  objc_msgSend(a1, sel_resume);
  return 1;
}

uint64_t sub_218015E00(void *a1)
{
  return sub_218015D6C(a1, v1);
}

uint64_t sub_218015E08(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + _Block_object_dispose(&STACK[0x360], 8) = result;
  return result;
}

uint64_t sub_218015E44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for QLAccessoryAppExtensionScene()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_218015EA4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_21801A528((unint64_t *)&qword_267BBAD10, (void (*)(uint64_t))type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  *a2 = v4;
  a2[1] = v5;
  return sub_217FF2924(v4);
}

uint64_t sub_218015F50(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_217FF2924(v1);
  sub_21801A528((unint64_t *)&qword_267BBAD10, (void (*)(uint64_t))type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel);
  sub_218037E14();
  sub_217FF2964(v1);
  return swift_release();
}

uint64_t sub_218016040()
{
  uint64_t v0 = sub_2180381D4();
  __swift_allocate_value_buffer(v0, qword_267BBA7F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_267BBA7F0);
  return sub_2180381C4();
}

uint64_t sub_2180160C0()
{
  swift_getKeyPath();
  sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_218016160(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

uint64_t sub_218016168()
{
  swift_getKeyPath();
  sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_218016208(uint64_t result, char a2)
{
  *(unsigned char *)(result + 17) = a2;
  return result;
}

void *sub_218016210()
{
  swift_getKeyPath();
  sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

id sub_2180162BC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v4 = *(void **)(v3 + 24);
  *a2 = v4;
  return v4;
}

uint64_t sub_218016368(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  id v2 = v1;
  sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E14();

  return swift_release();
}

uint64_t sub_218016444()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_2180164E8(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = a2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t sub_218016524()
{
  return swift_retain();
}

uint64_t sub_2180165C8(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 40) = a2;
  swift_retain();
  return swift_release();
}

uint64_t sub_218016604()
{
  return swift_retain();
}

uint64_t sub_2180166A8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  *a2 = *(void *)(v3 + 48);
  return swift_retain();
}

uint64_t sub_218016754()
{
  return swift_release();
}

uint64_t sub_218016834@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v3 = v1 + OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel__process;
  swift_beginAccess();
  return sub_21801A4C0(v3, a1);
}

uint64_t sub_218016900@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel__process;
  swift_beginAccess();
  return sub_21801A4C0(v4, a2);
}

uint64_t sub_2180169CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA140);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21801A4C0(a1, (uint64_t)v6);
  uint64_t v7 = *a2;
  swift_getKeyPath();
  uint64_t v10 = v7;
  uint64_t v11 = v6;
  uint64_t v12 = v7;
  sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E14();
  swift_release();
  return sub_217FF6BD8((uint64_t)v6, &qword_267BBA140);
}

uint64_t sub_218016B08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel__process;
  swift_beginAccess();
  sub_21801A458(a2, v3);
  return swift_endAccess();
}

uint64_t sub_218016B74()
{
  *(_WORD *)(v0 + 16) = 256;
  type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel();
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0;
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = 0;
  sub_218037E54();
  *(void *)(v0 + 40) = v1;
  type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = 0;
  sub_218037E54();
  *(void *)(v0 + 4_Block_object_dispose(&STACK[0x360], 8) = v2;
  uint64_t v3 = v0 + OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel__process;
  uint64_t v4 = sub_218037F64();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  sub_218037EC4();
  sub_218037E54();
  return v0;
}

uint64_t sub_218016C84(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  uint64_t v3 = sub_218037F04();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  uint64_t v4 = sub_218037F34();
  v2[12] = v4;
  v2[13] = *(void *)(v4 - 8);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA740);
  v2[16] = swift_task_alloc();
  uint64_t v5 = sub_218037F74();
  v2[17] = v5;
  v2[18] = *(void *)(v5 - 8);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  uint64_t v6 = sub_218037ED4();
  v2[21] = v6;
  v2[22] = *(void *)(v6 - 8);
  v2[23] = swift_task_alloc();
  uint64_t v7 = sub_218037EE4();
  v2[24] = v7;
  v2[25] = *(void *)(v7 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_218016F14, 0, 0);
}

uint64_t sub_218016F14()
{
  uint64_t v2 = v0[26];
  uint64_t v1 = v0[27];
  uint64_t v3 = v0[24];
  uint64_t v4 = v0[25];
  v0[28] = OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel_quickLookUIExtensionPointQuery;
  sub_218037EF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  sub_21801A528((unint64_t *)&unk_267BBA890, MEMORY[0x263F04D48]);
  sub_218038884();
  uint64_t v5 = sub_21801A528(&qword_267BBA168, MEMORY[0x263F04D38]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[29] = v6;
  void *v6 = v0;
  v6[1] = sub_21801709C;
  uint64_t v7 = v0[21];
  return MEMORY[0x270FA1E80](v0 + 6, v7, v5);
}

uint64_t sub_21801709C()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 240) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[22] + 8))(v2[23], v2[21]);
    uint64_t v3 = sub_2180175E0;
  }
  else
  {
    uint64_t v3 = sub_2180171C8;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_2180171C8()
{
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[22];
  uint64_t v2 = v0[23];
  uint64_t v4 = v0[21];
  if (!v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
LABEL_8:
    uint64_t v10 = v0[10];
    uint64_t v9 = v0[11];
    uint64_t v11 = v0[9];
    uint64_t v12 = v0[8] + v0[28];
    sub_218038A74();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v12, v11);
    sub_218038694();
    sub_2180386E4();
    swift_bridgeObjectRelease();
    sub_2180386E4();
    return sub_218038B14();
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (*(void *)(v1 + 16))
  {
    (*(void (**)(void, unint64_t, void))(v0[18] + 16))(v0[16], v1 + ((*(unsigned __int8 *)(v0[18] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[18] + 80)), v0[17]);
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  uint64_t v6 = v0[17];
  uint64_t v7 = v0[18];
  uint64_t v8 = v0[16];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v8, v5, 1, v6);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v8, 1, v6) == 1)
  {
    sub_217FF6BD8(v0[16], (uint64_t *)&unk_267BBA740);
    goto LABEL_8;
  }
  uint64_t v15 = v0[19];
  uint64_t v14 = v0[20];
  uint64_t v16 = v0[17];
  uint64_t v17 = v0[18];
  (*(void (**)(uint64_t, void, uint64_t))(v17 + 32))(v14, v0[16], v16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v15, v14, v16);
  swift_allocObject();
  swift_weakInit();
  sub_218037F14();
  uint64_t v18 = (void *)sub_2180385F4();
  uint64_t v19 = (void *)sub_2180385F4();
  id v20 = objc_msgSend(self, sel_attributeWithDomain_name_, v18, v19);

  uint64_t v21 = (void (*)(void *, void))sub_218037F24();
  uint64_t v23 = v22;
  id v24 = v20;
  MEMORY[0x21D45E7D0]();
  if (*(void *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_218038784();
  }
  uint64_t v26 = v0[14];
  uint64_t v25 = v0[15];
  uint64_t v27 = v0[12];
  uint64_t v28 = v0[13];
  sub_218038794();
  sub_218038774();

  v21(v0 + 2, 0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v26, v25, v27);
  uint64_t v29 = (void *)swift_task_alloc();
  v0[31] = v29;
  void *v29 = v0;
  v29[1] = sub_2180176DC;
  uint64_t v30 = v0[14];
  uint64_t v31 = v0[7];
  return MEMORY[0x270EEB850](v31, v30);
}

uint64_t sub_2180175E0()
{
  (*(void (**)(void, void))(v0[25] + 8))(v0[27], v0[24]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_2180176DC()
{
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_218017924;
  }
  else {
    uint64_t v2 = sub_2180177F0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2180177F0()
{
  uint64_t v1 = v0[27];
  uint64_t v2 = v0[24];
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[20];
  uint64_t v6 = v0[17];
  uint64_t v5 = v0[18];
  (*(void (**)(void, void))(v0[13] + 8))(v0[15], v0[12]);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_218017924()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[18];
  (*(void (**)(void, void))(v0[13] + 8))(v0[15], v0[12]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  (*(void (**)(void, void))(v0[25] + 8))(v0[27], v0[24]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_218017A58()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = swift_allocObject();
    swift_weakInit();
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = v1;
    *(void *)(v2 + 24) = 0;
    aBlock[4] = sub_21801A5B8;
    aBlock[5] = v2;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_217FEFC38;
    aBlock[3] = &block_descriptor_9;
    uint64_t v3 = _Block_copy(aBlock);
    swift_release();
    QLRunInMainThread();
    _Block_release(v3);
    return swift_release();
  }
  return result;
}

uint64_t sub_218017B64()
{
  v1[7] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA140);
  v1[8] = swift_task_alloc();
  uint64_t v2 = sub_218037F64();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  uint64_t v3 = swift_task_alloc();
  v1[13] = v3;
  v1[14] = sub_2180387F4();
  v1[15] = sub_2180387E4();
  uint64_t v4 = (void *)swift_task_alloc();
  v1[16] = v4;
  void *v4 = v1;
  v4[1] = sub_218017CD0;
  return sub_218016C84(v3);
}

uint64_t sub_218017CD0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 136) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_2180387A4();
  if (v0)
  {
    uint64_t v5 = sub_218018984;
  }
  else
  {
    *(void *)(v2 + 144) = v3;
    *(void *)(v2 + 152) = v4;
    uint64_t v5 = sub_218017EF4;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_218017E34()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_218017EF4()
{
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[12];
  uint64_t v1 = v0[10];
  uint64_t v10 = v0[9];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  uint64_t v4 = *(void (**)(uint64_t))(v1 + 16);
  v0[20] = v4;
  v0[21] = (v1 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v4(v3);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1 + 56))(v3, 0, 1, v10);
  swift_getKeyPath();
  uint64_t v5 = swift_task_alloc();
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v3;
  v0[22] = OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel___observationRegistrar;
  v0[2] = v2;
  v0[23] = sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E14();
  swift_release();
  swift_task_dealloc();
  sub_217FF6BD8(v3, &qword_267BBA140);
  ((void (*)(uint64_t, uint64_t, uint64_t))v4)(v12, v11, v10);
  uint64_t v6 = swift_allocObject();
  v0[24] = v6;
  swift_weakInit();
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_267BB9A88 + dword_267BB9A88);
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[25] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_218018154;
  uint64_t v8 = v0[12];
  return v13(v8, 0x7972616D697270, 0xE700000000000000, (uint64_t)sub_21801A400, v6);
}

uint64_t sub_218018154(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[26] = a1;
  v4[27] = a2;
  v4[28] = v2;
  swift_task_dealloc();
  swift_release();
  if (v2)
  {
    uint64_t v5 = v4[18];
    uint64_t v6 = v4[19];
    uint64_t v7 = sub_218017E34;
  }
  else
  {
    swift_release();
    uint64_t v5 = v4[18];
    uint64_t v6 = v4[19];
    uint64_t v7 = sub_2180185A8;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_2180182A0()
{
  uint64_t v2 = v0[29];
  uint64_t v1 = v0[30];
  uint64_t v10 = v0[13];
  uint64_t v8 = v0[10];
  uint64_t v9 = v0[9];
  uint64_t v3 = v0[7];
  swift_release();
  swift_getKeyPath();
  v0[5] = v3;
  sub_218037E24();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 48);
  swift_getKeyPath();
  uint64_t v5 = (void *)swift_task_alloc();
  v5[2] = v4;
  void v5[3] = v1;
  v5[4] = v2;
  v0[6] = v4;
  sub_21801A528((unint64_t *)&qword_267BBAD10, (void (*)(uint64_t))type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_218037E14();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release_n();
  swift_release_n();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_2180184CC()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_2180185A8()
{
  uint64_t v1 = v0[27];
  uint64_t v2 = v0[26];
  uint64_t v13 = (void (*)(uint64_t, uint64_t, uint64_t))v0[20];
  uint64_t v10 = v0[11];
  uint64_t v11 = v0[9];
  uint64_t v12 = v0[13];
  uint64_t v3 = v0[7];
  swift_getKeyPath();
  v0[3] = v3;
  sub_218037E24();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 40);
  swift_getKeyPath();
  uint64_t v5 = (void *)swift_task_alloc();
  v5[2] = v4;
  void v5[3] = v2;
  v5[4] = v1;
  v0[4] = v4;
  sub_21801A528((unint64_t *)&qword_267BBA720, (void (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_218037E14();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_task_dealloc();
  v13(v10, v12, v11);
  uint64_t v6 = swift_allocObject();
  v0[31] = v6;
  swift_weakInit();
  uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_267BBA688 + dword_267BBA688);
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[32] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_218018830;
  uint64_t v8 = v0[11];
  return v14(v8, 0x726F737365636361, 0xE900000000000079, (uint64_t)sub_21801A434, v6);
}

uint64_t sub_218018830(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void **)v3;
  *(void *)(*(void *)v3 + 264) = v2;
  swift_task_dealloc();
  swift_release();
  if (v2)
  {
    uint64_t v7 = v6[18];
    uint64_t v8 = v6[19];
    uint64_t v9 = sub_2180184CC;
  }
  else
  {
    swift_release();
    v6[29] = a2;
    v6[30] = a1;
    uint64_t v7 = v6[18];
    uint64_t v8 = v6[19];
    uint64_t v9 = sub_2180182A0;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

uint64_t sub_218018984()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_218018A18(uint64_t a1, const char *a2)
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    id v3 = objc_msgSend(self, sel_sharedInstance);
    if (!v3)
    {
      __break(1u);
      return;
    }
    uint64_t v4 = v3;
    objc_msgSend(v3, sel_setRemoteObserver_, 0);
    swift_release();
  }
  if (qword_267BB9510 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2180381D4();
  __swift_project_value_buffer(v5, (uint64_t)qword_267BBA7F0);
  uint64_t v6 = sub_2180381B4();
  os_log_type_t v7 = sub_2180388D4();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_217F61000, v6, v7, a2, v8, 2u);
    MEMORY[0x21D460050](v8, -1, -1);
  }
}

id sub_218018B68(uint64_t a1, void *a2)
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
    sub_218037E24();
    swift_release();
    swift_retain();
    swift_release();
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_21801A528((unint64_t *)&qword_267BBA720, (void (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel);
    sub_218037E14();
    swift_release();
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
    sub_218037E24();
    swift_release();
    swift_retain();
    swift_release();
    uint64_t v4 = swift_getKeyPath();
    MEMORY[0x270FA5388](v4);
    sub_21801A528((unint64_t *)&qword_267BBAD10, (void (*)(uint64_t))type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel);
    sub_218037E14();
    swift_release();
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    id result = objc_msgSend(self, sel_sharedInstance);
    if (!result)
    {
      __break(1u);
      return result;
    }
    uint64_t v6 = result;
    objc_msgSend(result, sel_setRemoteObserver_, 0);

    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    uint64_t v7 = swift_getKeyPath();
    MEMORY[0x270FA5388](v7);
    sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
    sub_218037E14();
    swift_release();
    swift_release();
  }
  swift_beginAccess();
  id result = (id)swift_weakLoadStrong();
  if (result)
  {
    uint64_t v8 = swift_getKeyPath();
    MEMORY[0x270FA5388](v8);
    id v9 = a2;
    sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
    sub_218037E14();

    swift_release();
    return (id)swift_release();
  }
  return result;
}

uint64_t sub_2180190BC()
{
  *(void *)(v1 + 32) = v0;
  return MEMORY[0x270FA2498](sub_2180190DC, 0, 0);
}

uint64_t sub_2180190DC()
{
  uint64_t v1 = v0[4];
  swift_getKeyPath();
  v0[2] = v1;
  sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 40);
  swift_getKeyPath();
  v0[3] = v2;
  sub_21801A528((unint64_t *)&qword_267BBA720, (void (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel);
  swift_retain();
  sub_218037E24();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 16);
  v0[5] = v3;
  v0[6] = *(void *)(v2 + 24);
  sub_217FF2924(v3);
  swift_release();
  if (v3)
  {
    uint64_t v7 = (uint64_t (__cdecl *)())((char *)&dword_267BBAF28 + dword_267BBAF28);
    swift_retain();
    uint64_t v4 = (void *)swift_task_alloc();
    v0[7] = v4;
    void *v4 = v0;
    v4[1] = sub_218019314;
    return v7();
  }
  else
  {
    sub_21801A2F4();
    swift_allocError();
    swift_willThrow();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_218019314(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    uint64_t v5 = sub_21801A770;
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    uint64_t v5 = sub_21801A774;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_218019458()
{
  *(void *)(v1 + 32) = v0;
  return MEMORY[0x270FA2498](sub_218019478, 0, 0);
}

uint64_t sub_218019478()
{
  uint64_t v1 = v0[4];
  swift_getKeyPath();
  v0[2] = v1;
  sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 48);
  swift_getKeyPath();
  v0[3] = v2;
  sub_21801A528((unint64_t *)&qword_267BBAD10, (void (*)(uint64_t))type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel);
  swift_retain();
  sub_218037E24();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 16);
  v0[5] = v3;
  v0[6] = *(void *)(v2 + 24);
  sub_217FF2924(v3);
  swift_release();
  if (v3)
  {
    uint64_t v7 = (uint64_t (__cdecl *)())((char *)&dword_267BBAF68 + dword_267BBAF68);
    swift_retain();
    uint64_t v4 = (void *)swift_task_alloc();
    v0[7] = v4;
    void *v4 = v0;
    v4[1] = sub_2180196B0;
    return v7();
  }
  else
  {
    sub_21801A2F4();
    swift_allocError();
    swift_willThrow();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_2180196B0(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    uint64_t v5 = sub_218019864;
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    uint64_t v5 = sub_2180197F4;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_2180197F4()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 72);
  return v1(v2);
}

uint64_t sub_218019864()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2180198D0()
{
  v1[3] = v0;
  v1[4] = sub_2180387F4();
  v1[5] = sub_2180387E4();
  uint64_t v3 = sub_2180387A4();
  v1[6] = v3;
  v1[7] = v2;
  return MEMORY[0x270FA2498](sub_21801996C, v3, v2);
}

uint64_t sub_21801996C()
{
  uint64_t v1 = v0[3];
  swift_getKeyPath();
  v0[2] = v1;
  v0[8] = OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel___observationRegistrar;
  v0[9] = sub_21801A528((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 40);
  swift_getKeyPath();
  v0[2] = v2;
  sub_21801A528((unint64_t *)&qword_267BBA720, (void (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel);
  swift_retain();
  sub_218037E24();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 16);
  v0[10] = v3;
  v0[11] = *(void *)(v2 + 24);
  sub_217FF2924(v3);
  swift_release();
  if (v3)
  {
    v0[12] = sub_2180387E4();
    uint64_t v4 = sub_2180387A4();
    uint64_t v6 = v5;
    uint64_t v7 = sub_218019C78;
LABEL_5:
    return MEMORY[0x270FA2498](v7, v4, v6);
  }
  uint64_t v8 = v0[3];
  swift_getKeyPath();
  v0[2] = v8;
  sub_218037E24();
  swift_release();
  uint64_t v9 = *(void *)(v8 + 48);
  swift_getKeyPath();
  v0[2] = v9;
  sub_21801A528((unint64_t *)&qword_267BBAD10, (void (*)(uint64_t))type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel);
  swift_retain();
  sub_218037E24();
  swift_release();
  uint64_t v10 = *(void *)(v9 + 16);
  v0[13] = v10;
  v0[14] = *(void *)(v9 + 24);
  sub_217FF2924(v10);
  swift_release();
  if (v10)
  {
    v0[15] = sub_2180387E4();
    uint64_t v4 = sub_2180387A4();
    uint64_t v6 = v11;
    uint64_t v7 = sub_218019EE0;
    goto LABEL_5;
  }
  swift_release();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_218019C78()
{
  uint64_t v1 = v0[11];
  swift_release();
  __swift_project_boxed_opaque_existential_0((void *)(v1 + 24), *(void *)(v1 + 48));
  sub_218038944();
  objc_msgSend(*(id *)(v1 + 64), sel_invalidate);
  uint64_t v2 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = 0;
  swift_release();
  swift_release();

  uint64_t v3 = v0[6];
  uint64_t v4 = v0[7];
  return MEMORY[0x270FA2498](sub_218019D28, v3, v4);
}

uint64_t sub_218019D28()
{
  uint64_t v1 = v0[3];
  swift_getKeyPath();
  v0[2] = v1;
  sub_218037E24();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 48);
  swift_getKeyPath();
  v0[2] = v2;
  sub_21801A528((unint64_t *)&qword_267BBAD10, (void (*)(uint64_t))type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel);
  swift_retain();
  sub_218037E24();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 16);
  v0[13] = v3;
  v0[14] = *(void *)(v2 + 24);
  sub_217FF2924(v3);
  swift_release();
  if (v3)
  {
    v0[15] = sub_2180387E4();
    uint64_t v5 = sub_2180387A4();
    return MEMORY[0x270FA2498](sub_218019EE0, v5, v4);
  }
  else
  {
    swift_release();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_218019EE0()
{
  uint64_t v1 = v0[14];
  swift_release();
  __swift_project_boxed_opaque_existential_0((void *)(v1 + 24), *(void *)(v1 + 48));
  sub_218038944();
  objc_msgSend(*(id *)(v1 + 64), sel_invalidate);
  uint64_t v2 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = 0;
  swift_release();
  swift_release();

  uint64_t v3 = v0[6];
  uint64_t v4 = v0[7];
  return MEMORY[0x270FA2498](sub_218019F90, v3, v4);
}

uint64_t sub_218019F90()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_218019FF0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_217FF6BD8((uint64_t)v0 + OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel__process, &qword_267BBA140);
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel_quickLookUIExtensionPointQuery;
  uint64_t v2 = sub_218037F04();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = (char *)v0 + OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel___observationRegistrar;
  uint64_t v4 = sub_218037E64();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *((unsigned int *)*v0 + 12);
  uint64_t v6 = *((unsigned __int16 *)*v0 + 26);

  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_21801A10C()
{
  return type metadata accessor for QLHostRemoteViewModel();
}

uint64_t type metadata accessor for QLHostRemoteViewModel()
{
  uint64_t result = qword_267BBA828;
  if (!qword_267BBA828) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_21801A160()
{
  sub_21801A28C();
  if (v0 <= 0x3F)
  {
    sub_218037F04();
    if (v1 <= 0x3F)
    {
      sub_218037E64();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_21801A28C()
{
  if (!qword_267BBA860)
  {
    sub_218037F64();
    unint64_t v0 = sub_2180389C4();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BBA860);
    }
  }
}

unint64_t sub_21801A2F4()
{
  unint64_t result = qword_267BBA880;
  if (!qword_267BBA880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA880);
  }
  return result;
}

uint64_t sub_21801A348()
{
  return sub_217FF22F0(v0[2], v0[3], v0[4]);
}

uint64_t sub_21801A368()
{
  *(void *)(*(void *)(v0 + 16) + 4_Block_object_dispose(&STACK[0x360], 8) = *(void *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_21801A3AC()
{
  return sub_218016B08(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_21801A3C8()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_21801A400()
{
  sub_218018A18(v0, "Preview collection view service did terminate normally.");
}

void sub_21801A434()
{
  sub_218018A18(v0, "Accessory view service did terminate normally.");
}

uint64_t sub_21801A458(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA140);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_21801A4C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA140);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21801A528(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21801A570()
{
  return sub_218017A58();
}

uint64_t sub_21801A578()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_21801A5B8()
{
  return sub_218018B68(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_21801A5C8()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 17) = *(unsigned char *)(v0 + 24);
}

void sub_21801A5E0()
{
}

void sub_21801A5F8()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = v1;
  id v4 = v1;
}

unsigned char *storeEnumTagSinglePayload for QLHostRemoteViewModel.InternalError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x21801A6E0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for QLHostRemoteViewModel.InternalError()
{
  return &type metadata for QLHostRemoteViewModel.InternalError;
}

unint64_t sub_21801A71C()
{
  unint64_t result = qword_267BBA8A0;
  if (!qword_267BBA8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBA8A0);
  }
  return result;
}

uint64_t sub_21801A778()
{
  return sub_21801A3AC();
}

uint64_t sub_21801A790()
{
  return sub_21801A348();
}

void sub_21801A7A8(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_218037CF4();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

uint64_t sub_21801A818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_218038824();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_218038814();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_217FF6BD8(a1, (uint64_t *)&unk_267BBA400);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2180387A4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21801A9C4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_218031A80((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 16);
  return result;
}

uint64_t sub_21801AA6C()
{
  return swift_release();
}

uint64_t sub_21801AB3C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_218031A80((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 17);
  return result;
}

uint64_t sub_21801ABE4()
{
  return swift_release();
}

uint64_t sub_21801ACB4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_218031A80((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  *a2 = *(void *)(v3 + 32);
  return swift_unknownObjectRetain();
}

uint64_t sub_21801AD60()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_21801AE40()
{
  uint64_t v0 = sub_2180381D4();
  __swift_allocate_value_buffer(v0, qword_267BBA8B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_267BBA8B0);
  return sub_2180381C4();
}

id sub_21801AEC0()
{
  uint64_t v1 = OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___accessoryViewController;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___accessoryViewController);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___accessoryViewController);
  }
  else
  {
    id v4 = sub_21801AF24(v0);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_21801AF24(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04E68]), sel_init);
  uint64_t v3 = *(void *)(a1 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel);
  swift_getKeyPath();
  sub_218031A80((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 48);
  swift_getKeyPath();
  sub_218031A80((unint64_t *)&qword_267BBAD10, (void (*)(uint64_t))type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel);
  swift_retain();
  sub_218037E24();
  swift_release();
  uint64_t v5 = *(void *)(v4 + 16);
  sub_217FF2924(v5);
  swift_release();
  if (v5)
  {
    swift_retain();
    sub_2180389B4();
    type metadata accessor for QLHostPlaceholderUIView();
    id v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    objc_msgSend(v2, sel_setPlaceholderView_, v6);
    swift_release();
    swift_release();
  }
  else
  {
    sub_2180389B4();
  }
  return v2;
}

uint64_t sub_21801B1B8()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel);
  swift_getKeyPath();
  sub_218031A80((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  return *(unsigned __int8 *)(v1 + 17);
}

uint64_t sub_21801B360@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA8D8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  id v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v13[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid;
  swift_beginAccess();
  sub_21801B52C(v9, (uint64_t)v8);
  uint64_t v10 = sub_218037DF4();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v11 + 32))(a1, v8, v10);
  }
  sub_217FF6BD8((uint64_t)v8, &qword_267BBA8D8);
  sub_218037DE4();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_21801B594((uint64_t)v6, v9);
  return swift_endAccess();
}

uint64_t sub_21801B52C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA8D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21801B594(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA8D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21801B784(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA8D8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_218037DF4();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v5, a1, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  uint64_t v8 = v1 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid;
  swift_beginAccess();
  sub_21801B594((uint64_t)v5, v8);
  return swift_endAccess();
}

uint64_t sub_21801B8B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA8D8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_218037DF4();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  uint64_t v11 = *a2;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v6, v10, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  uint64_t v12 = v11 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid;
  swift_beginAccess();
  sub_21801B594((uint64_t)v6, v12);
  return swift_endAccess();
}

void (*sub_21801BA44(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[6] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA8D8);
  v3[7] = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  uint64_t v5 = sub_218037DF4();
  v3[8] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[9] = v6;
  size_t v7 = *(void *)(v6 + 64);
  v3[10] = malloc(v7);
  uint64_t v8 = malloc(v7);
  v3[11] = v8;
  sub_21801B360((uint64_t)v8);
  return sub_21801BB34;
}

void sub_21801BB34(uint64_t a1, char a2)
{
  id v2 = *(void **)a1;
  uint64_t v4 = *(void **)(*(void *)a1 + 80);
  uint64_t v3 = *(void **)(*(void *)a1 + 88);
  if (a2)
  {
    uint64_t v5 = v2[8];
    uint64_t v6 = v2[9];
    uint64_t v8 = v2[6];
    size_t v7 = (void *)v2[7];
    (*(void (**)(void, void, uint64_t))(v6 + 16))(v2[10], v2[11], v5);
    (*(void (**)(void *, void *, uint64_t))(v6 + 32))(v7, v4, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v5);
    uint64_t v9 = v8 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid;
    swift_beginAccess();
    sub_21801B594((uint64_t)v7, v9);
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v3, v5);
  }
  else
  {
    uint64_t v10 = v2[8];
    uint64_t v11 = v2[9];
    uint64_t v12 = v2[6];
    size_t v7 = (void *)v2[7];
    (*(void (**)(void *, void, uint64_t))(v11 + 32))(v7, v2[11], v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    uint64_t v13 = v12 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid;
    swift_beginAccess();
    sub_21801B594((uint64_t)v7, v13);
    swift_endAccess();
  }
  free(v3);
  free(v4);
  free(v7);

  free(v2);
}

id sub_21801BCE0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel;
  type metadata accessor for QLHostRemoteViewModel();
  swift_allocObject();
  size_t v7 = v3;
  *(void *)&v3[v6] = sub_218016B74();
  *(void *)&v7[OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___accessoryViewController] = 0;
  uint64_t v8 = &v7[OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid];
  uint64_t v9 = sub_218037DF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);

  if (a2)
  {
    uint64_t v10 = (void *)sub_2180385F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13.receiver = v7;
  v13.super_class = (Class)type metadata accessor for QLRemoteUIHostViewController();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, v10, a3);

  return v11;
}

uint64_t type metadata accessor for QLRemoteUIHostViewController()
{
  uint64_t result = qword_267BBAAD8;
  if (!qword_267BBAAD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id QLRemoteUIHostViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLRemoteUIHostViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static QLRemoteUIHostViewController.remotePreviewCollection()()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_267BBA8F0 + dword_267BBA8F0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_217FF0A40;
  return v3();
}

void sub_21801C180(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_sharedInstance);
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v2, sel_setRemoteObserver_, a1);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21801C1F8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_21801C258(uint64_t a1, void *a2)
{
}

uint64_t sub_21801C3C0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_2180387F4();
  *(void *)(v1 + 24) = sub_2180387E4();
  uint64_t v3 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21801C458, v3, v2);
}

uint64_t sub_21801C458()
{
  uint64_t v1 = (const void *)v0[2];
  swift_release();
  v0[4] = _Block_copy(v1);
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_267BBA8F0 + dword_267BBA8F0);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[5] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_21801C50C;
  return v4();
}

uint64_t sub_21801C50C(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 32);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.toggleDebugView()()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel);
  swift_getKeyPath();
  sub_218031A80((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  swift_getKeyPath();
  sub_218037E44();
  swift_release();
  *(unsigned char *)(v1 + 16) = (*(unsigned char *)(v1 + 16) & 1) == 0;
  swift_getKeyPath();
  sub_218037E34();
  swift_release();
}

Swift::Bool __swiftcall QLRemoteUIHostViewController.isRemote()()
{
  return 1;
}

Swift::Void __swiftcall QLRemoteUIHostViewController.setAllowInteractiveTransitions(_:)(Swift::Bool a1)
{
}

uint64_t sub_21801C7D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 220) = a5;
  *(void *)(v5 + 144) = a4;
  sub_2180387F4();
  *(void *)(v5 + 152) = sub_2180387E4();
  uint64_t v7 = sub_2180387A4();
  *(void *)(v5 + 160) = v7;
  *(void *)(v5 + 16_Block_object_dispose(&STACK[0x360], 8) = v6;
  return MEMORY[0x270FA2498](sub_21801C874, v7, v6);
}

uint64_t sub_21801C874()
{
  uint64_t v1 = *(void *)(v0[18] + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel);
  swift_getKeyPath();
  v0[15] = v1;
  sub_218031A80((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 40);
  swift_getKeyPath();
  v0[16] = v2;
  sub_218031A80((unint64_t *)&qword_267BBA720, (void (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel);
  swift_retain();
  sub_218037E24();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 16);
  v0[22] = v3;
  v0[23] = *(void *)(v2 + 24);
  sub_217FF2924(v3);
  swift_release();
  if (v3)
  {
    uint64_t v7 = (uint64_t (__cdecl *)())((char *)&dword_267BBAF28 + dword_267BBAF28);
    swift_retain();
    uint64_t v4 = (void *)swift_task_alloc();
    v0[24] = v4;
    void *v4 = v0;
    v4[1] = sub_21801CA98;
    return v7();
  }
  else
  {
    swift_release();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_21801CA98(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 200) = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    uint64_t v5 = v4[20];
    uint64_t v6 = v4[21];
    uint64_t v7 = sub_21801CEA4;
  }
  else
  {
    v4[26] = a1;
    uint64_t v7 = sub_21801CBF0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_21801CBF0()
{
  uint64_t v1 = *(void **)(v0 + 208);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 220);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_21801CCEC;
  uint64_t v3 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 8_Block_object_dispose(&STACK[0x360], 8) = 0x40000000;
  *(void *)(v0 + 96) = sub_217FE9EB4;
  *(void *)(v0 + 104) = &block_descriptor_456;
  *(void *)(v0 + 112) = v3;
  objc_msgSend(v1, sel_setAllowInteractiveTransitions_completionHandler_, v2, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_21801CCEC()
{
  return MEMORY[0x270FA2498](sub_21801CDCC, 0, 0);
}

uint64_t sub_21801CDCC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 168);
  return MEMORY[0x270FA2498](sub_21801CE44, v1, v2);
}

uint64_t sub_21801CE44()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21801CEA4()
{
  swift_release();
  swift_release();
  swift_release();
  if (qword_267BB9518 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 200);
  uint64_t v2 = sub_2180381D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BBA8B0);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2180381B4();
  os_log_type_t v6 = sub_2180388F4();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void **)(v0 + 200);
  if (v7)
  {
    int v9 = *(unsigned __int8 *)(v0 + 220);
    uint64_t v10 = swift_slowAlloc();
    id v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 67109378;
    *(_DWORD *)(v0 + 216) = v9;
    sub_2180389D4();
    *(_WORD *)(v10 + _Block_object_dispose(&STACK[0x360], 8) = 2112;
    id v12 = v8;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 136) = v13;
    sub_2180389D4();
    *id v11 = v13;

    _os_log_impl(&dword_217F61000, v5, v6, "Failed to set allowInteractiveTransitions to %{BOOL}d. Error: %@", (uint8_t *)v10, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v11, -1, -1);
    MEMORY[0x21D460050](v10, -1, -1);
  }
  else
  {
  }
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

void __swiftcall QLRemoteUIHostViewController.accessoryView()(UIView *__return_ptr retstr)
{
  id v1 = sub_21801AEC0();
  id v2 = objc_msgSend(v1, sel_view);

  if (!v2) {
    __break(1u);
  }
}

Swift::Void __swiftcall QLRemoteUIHostViewController.setHostApplicationBundleIdentifier(_:)(Swift::String a1)
{
}

uint64_t sub_21801D20C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  v6[5] = sub_2180387F4();
  void v6[6] = sub_2180387E4();
  v6[7] = sub_2180387E4();
  uint64_t v8 = sub_2180387A4();
  v6[8] = v8;
  v6[9] = v7;
  return MEMORY[0x270FA2498](sub_21801D2B8, v8, v7);
}

uint64_t sub_21801D2B8()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *id v1 = v0;
  v1[1] = sub_21801D354;
  return sub_2180190BC();
}

uint64_t sub_21801D354(uint64_t a1)
{
  id v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 8_Block_object_dispose(&STACK[0x360], 8) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[8];
    uint64_t v6 = v4[9];
    uint64_t v7 = sub_21801D5A4;
  }
  else
  {
    v4[12] = a1;
    uint64_t v5 = v4[8];
    uint64_t v6 = v4[9];
    uint64_t v7 = sub_21801D47C;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_21801D47C()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21801D500, v1, v0);
}

uint64_t sub_21801D500()
{
  uint64_t v1 = *(void **)(v0 + 96);
  swift_release();
  uint64_t v2 = (void *)sub_2180385F4();
  objc_msgSend(v1, sel_setHostApplicationBundleIdentifier_, v2);

  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_21801D5A4()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218031D74, v1, v0);
}

uint64_t QLRemoteUIHostViewController.configure(withNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = &unk_26C921498;
  uint64_t v15 = swift_dynamicCastObjCProtocolConditional();
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)&v6[OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel];
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v26 = a2;
    uint64_t v27 = a3;
    MEMORY[0x270FA5388](KeyPath);
    *(&v25 - 2) = v17;
    *(&v25 - 1) = v16;
    uint64_t v28 = v17;
    sub_218031A80((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
    swift_unknownObjectRetain();
    sub_218037E14();
    swift_unknownObjectRelease();
    swift_release();
    a2 = v26;
    a3 = v27;
  }
  sub_218038804();
  uint64_t v19 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v14, 0, 1, v19);
  sub_2180387F4();
  swift_unknownObjectRetain();
  id v20 = v6;
  swift_unknownObjectRetain();
  uint64_t v21 = sub_2180387E4();
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = MEMORY[0x263F8F500];
  *(void *)(v22 + 16) = v21;
  *(void *)(v22 + 24) = v23;
  *(void *)(v22 + 32) = v20;
  *(void *)(v22 + 40) = a1;
  *(void *)(v22 + 4_Block_object_dispose(&STACK[0x360], 8) = a2;
  *(void *)(v22 + 56) = a3;
  *(void *)(v22 + 64) = a4;
  *(unsigned char *)(v22 + 72) = a5 & 1;
  sub_21800341C((uint64_t)v14, (uint64_t)&unk_267BBA930, v22);
  return swift_release();
}

uint64_t sub_21801D8E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)(v8 + 120) = v13;
  *(void *)(v8 + 40) = a7;
  *(void *)(v8 + 4_Block_object_dispose(&STACK[0x360], 8) = a8;
  *(void *)(v8 + 24) = a5;
  *(void *)(v8 + 32) = a6;
  *(void *)(v8 + 16) = a4;
  *(void *)(v8 + 56) = sub_2180387F4();
  *(void *)(v8 + 64) = sub_2180387E4();
  *(void *)(v8 + 72) = sub_2180387E4();
  uint64_t v10 = sub_2180387A4();
  *(void *)(v8 + 80) = v10;
  *(void *)(v8 + 8_Block_object_dispose(&STACK[0x360], 8) = v9;
  return MEMORY[0x270FA2498](sub_21801D9A4, v10, v9);
}

uint64_t sub_21801D9A4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21801DA40;
  return sub_2180190BC();
}

uint64_t sub_21801DA40(uint64_t a1)
{
  id v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 104) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[10];
    uint64_t v6 = v4[11];
    uint64_t v7 = sub_21801DC9C;
  }
  else
  {
    v4[14] = a1;
    uint64_t v5 = v4[10];
    uint64_t v6 = v4[11];
    uint64_t v7 = sub_21801DB68;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_21801DB68()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21801DBEC, v1, v0);
}

uint64_t sub_21801DBEC()
{
  uint64_t v1 = *(void **)(v0 + 112);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  swift_release();
  objc_msgSend(v1, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen_, v6, v5, v4, v3, v2);
  swift_unknownObjectRelease();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_21801DC9C()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21801DD20, v1, v0);
}

uint64_t sub_21801DD20()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t QLRemoteUIHostViewController.configure(withNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = &unk_26C921498;
  uint64_t v12 = swift_dynamicCastObjCProtocolConditional();
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)&v4[OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel];
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v23 = a1;
    uint64_t v24 = a3;
    MEMORY[0x270FA5388](KeyPath);
    *(&v22 - 2) = v14;
    *(&v22 - 1) = v13;
    uint64_t v25 = v14;
    sub_218031A80((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
    swift_unknownObjectRetain();
    sub_218037E14();
    swift_unknownObjectRelease();
    swift_release();
    a1 = v23;
    a3 = v24;
  }
  sub_218038804();
  uint64_t v16 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v11, 0, 1, v16);
  sub_2180387F4();
  swift_unknownObjectRetain();
  uint64_t v17 = v4;
  swift_unknownObjectRetain();
  uint64_t v18 = sub_2180387E4();
  uint64_t v19 = (void *)swift_allocObject();
  uint64_t v20 = MEMORY[0x263F8F500];
  v19[2] = v18;
  v19[3] = v20;
  v19[4] = v17;
  v19[5] = a1;
  v19[6] = a2;
  v19[7] = a3;
  v19[8] = a4;
  sub_21800341C((uint64_t)v11, (uint64_t)&unk_267BBA940, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_21801E0AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[5] = a7;
  void v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  v8[7] = sub_2180387F4();
  v8[8] = sub_2180387E4();
  v8[9] = sub_2180387E4();
  uint64_t v10 = sub_2180387A4();
  v8[10] = v10;
  v8[11] = v9;
  return MEMORY[0x270FA2498](sub_21801E15C, v10, v9);
}

uint64_t sub_21801E15C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21801E1F8;
  return sub_2180190BC();
}

uint64_t sub_21801E1F8(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 104) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[10];
    uint64_t v6 = v4[11];
    uint64_t v7 = sub_21801DC9C;
  }
  else
  {
    v4[14] = a1;
    uint64_t v5 = v4[10];
    uint64_t v6 = v4[11];
    uint64_t v7 = sub_21801E320;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_21801E320()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21801E3A4, v1, v0);
}

uint64_t sub_21801E3A4()
{
  uint64_t v1 = (void *)v0[14];
  uint64_t v3 = v0[5];
  uint64_t v2 = v0[6];
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  swift_release();
  objc_msgSend(v1, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_, v5, v4, v3, v2);
  swift_unknownObjectRelease();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.setCurrentPreviewItemIndex(_:animated:)(Swift::Int _, Swift::Bool animated)
{
}

uint64_t sub_21801E50C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v6 + 96) = a6;
  *(void *)(v6 + 16) = a4;
  *(void *)(v6 + 24) = a5;
  *(void *)(v6 + 32) = sub_2180387F4();
  *(void *)(v6 + 40) = sub_2180387E4();
  *(void *)(v6 + 4_Block_object_dispose(&STACK[0x360], 8) = sub_2180387E4();
  uint64_t v8 = sub_2180387A4();
  *(void *)(v6 + 56) = v8;
  *(void *)(v6 + 64) = v7;
  return MEMORY[0x270FA2498](sub_21801E5B8, v8, v7);
}

uint64_t sub_21801E5B8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21801E654;
  return sub_2180190BC();
}

uint64_t sub_21801E654(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[7];
    uint64_t v6 = v4[8];
    uint64_t v7 = sub_21801E898;
  }
  else
  {
    v4[11] = a1;
    uint64_t v5 = v4[7];
    uint64_t v6 = v4[8];
    uint64_t v7 = sub_21801E77C;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_21801E77C()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21801E800, v1, v0);
}

uint64_t sub_21801E800()
{
  uint64_t v1 = *(void **)(v0 + 88);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 24);
  swift_release();
  objc_msgSend(v1, sel_setCurrentPreviewItemIndex_animated_, v3, v2);
  swift_unknownObjectRelease();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_21801E898()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218031D34, v1, v0);
}

Swift::Void __swiftcall QLRemoteUIHostViewController.hostApplicationDidEnterBackground(_:)(Swift::Bool a1)
{
}

uint64_t sub_21801E970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 8_Block_object_dispose(&STACK[0x360], 8) = a5;
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = sub_2180387F4();
  *(void *)(v5 + 32) = sub_2180387E4();
  *(void *)(v5 + 40) = sub_2180387E4();
  uint64_t v7 = sub_2180387A4();
  *(void *)(v5 + 4_Block_object_dispose(&STACK[0x360], 8) = v7;
  *(void *)(v5 + 56) = v6;
  return MEMORY[0x270FA2498](sub_21801EA1C, v7, v6);
}

uint64_t sub_21801EA1C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21801EAB8;
  return sub_2180190BC();
}

uint64_t sub_21801EAB8(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[6];
    uint64_t v6 = v4[7];
    uint64_t v7 = sub_21801ECEC;
  }
  else
  {
    v4[10] = a1;
    uint64_t v5 = v4[6];
    uint64_t v6 = v4[7];
    uint64_t v7 = sub_21801EBE0;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_21801EBE0()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21801EC64, v1, v0);
}

uint64_t sub_21801EC64()
{
  uint64_t v1 = *(void **)(v0 + 80);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 88);
  swift_release();
  objc_msgSend(v1, sel_hostApplicationDidEnterBackground_, v2);
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_21801ECEC()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218031D38, v1, v0);
}

Swift::Void __swiftcall QLRemoteUIHostViewController.hostApplicationDidBecomeActive()()
{
}

uint64_t sub_21801EDD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  v4[3] = sub_2180387F4();
  v4[4] = sub_2180387E4();
  v4[5] = sub_2180387E4();
  uint64_t v6 = sub_2180387A4();
  v4[6] = v6;
  v4[7] = v5;
  return MEMORY[0x270FA2498](sub_21801EE80, v6, v5);
}

uint64_t sub_21801EE80()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21801EF1C;
  return sub_2180190BC();
}

uint64_t sub_21801EF1C(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[6];
    uint64_t v6 = v4[7];
    uint64_t v7 = sub_21801ECEC;
  }
  else
  {
    v4[10] = a1;
    uint64_t v5 = v4[6];
    uint64_t v6 = v4[7];
    uint64_t v7 = sub_21801F044;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_21801F044()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21801F0C8, v1, v0);
}

uint64_t sub_21801F0C8()
{
  uint64_t v1 = *(void **)(v0 + 80);
  swift_release();
  objc_msgSend(v1, sel_hostApplicationDidBecomeActive);
  swift_unknownObjectRelease();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t QLRemoteUIHostViewController.toolbarButtons(for:)(uint64_t a1)
{
  v2[18] = a1;
  v2[19] = v1;
  v2[20] = sub_2180387F4();
  v2[21] = sub_2180387E4();
  v2[22] = sub_2180387E4();
  uint64_t v4 = sub_2180387A4();
  v2[23] = v4;
  v2[24] = v3;
  return MEMORY[0x270FA2498](sub_21801F224, v4, v3);
}

uint64_t sub_21801F224()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21801F2C0;
  return sub_2180190BC();
}

uint64_t sub_21801F2C0(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 20_Block_object_dispose(&STACK[0x360], 8) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[23];
    uint64_t v6 = v4[24];
    uint64_t v7 = sub_21801F6F8;
  }
  else
  {
    v4[27] = a1;
    uint64_t v5 = v4[23];
    uint64_t v6 = v4[24];
    uint64_t v7 = sub_21801F3E8;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_21801F3E8()
{
  swift_release();
  uint64_t v2 = sub_2180387A4();
  *(void *)(v0 + 224) = v2;
  *(void *)(v0 + 232) = v1;
  return MEMORY[0x270FA2498](sub_21801F46C, v2, v1);
}

uint64_t sub_21801F46C()
{
  uint64_t v1 = (void *)v0[27];
  uint64_t v2 = v0[18];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_21801F570;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_217FE95B8;
  v0[13] = &block_descriptor_1;
  v0[14] = v3;
  objc_msgSend(v1, sel_toolbarButtonsForTraitCollection_withCompletionHandler_, v2, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_21801F570()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 232);
  uint64_t v2 = *(void *)(*(void *)v0 + 224);
  return MEMORY[0x270FA2498](sub_21801F678, v2, v1);
}

uint64_t sub_21801F678()
{
  swift_release();
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[16];
  swift_unknownObjectRelease();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v1, v2);
}

uint64_t sub_21801F6F8()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21801F77C, v1, v0);
}

uint64_t sub_21801F77C()
{
  swift_release();
  if (qword_267BB9518 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 208);
  uint64_t v2 = sub_2180381D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BBA8B0);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2180381B4();
  os_log_type_t v6 = sub_2180388F4();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void **)(v0 + 208);
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 136) = v12;
    sub_2180389D4();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_217F61000, v5, v6, "Failed to get toolbar buttons: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v10, -1, -1);
    MEMORY[0x21D460050](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  uint64_t v14 = MEMORY[0x263F8EE78];
  uint64_t v15 = MEMORY[0x263F8EE78];
  return v13(v14, v15);
}

uint64_t sub_21801FB04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_2180387F4();
  v3[5] = sub_2180387E4();
  uint64_t v5 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21801FBA0, v5, v4);
}

uint64_t sub_21801FBA0()
{
  uint64_t v1 = (void *)v0[4];
  id v3 = (void *)v0[2];
  uint64_t v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  id v4 = v3;
  id v5 = v1;
  os_log_type_t v6 = (void *)swift_task_alloc();
  v0[7] = v6;
  void *v6 = v0;
  v6[1] = sub_21801FC64;
  uint64_t v7 = v0[2];
  return QLRemoteUIHostViewController.toolbarButtons(for:)(v7);
}

uint64_t sub_21801FC64()
{
  uint64_t v1 = *(void (***)(void, void, void))(*v0 + 48);
  uint64_t v2 = *(void **)(*v0 + 32);
  id v3 = *(void **)(*v0 + 16);
  uint64_t v8 = *v0;
  swift_task_dealloc();

  sub_217FF207C(0, &qword_267BBACB0);
  id v4 = (void *)sub_218038754();
  id v5 = (void *)sub_218038754();
  ((void (**)(void, void *, void *))v1)[2](v1, v4, v5);

  _Block_release(v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_type_t v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

uint64_t QLRemoteUIHostViewController.toolbarButtonPressed(withIdentifier:)(uint64_t a1, uint64_t a2)
{
  v3[20] = a2;
  v3[21] = v2;
  v3[19] = a1;
  v3[22] = sub_2180387F4();
  v3[23] = sub_2180387E4();
  uint64_t v5 = sub_2180387A4();
  v3[24] = v5;
  v3[25] = v4;
  return MEMORY[0x270FA2498](sub_21801FEC8, v5, v4);
}

uint64_t sub_21801FEC8()
{
  uint64_t v14 = v0;
  if (qword_267BB9518 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2180381D4();
  v0[26] = __swift_project_value_buffer(v1, (uint64_t)qword_267BBA8B0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_2180381B4();
  os_log_type_t v3 = sub_2180388D4();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[20];
  if (v4)
  {
    uint64_t v12 = v0[19];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v13 = v7;
    *(_DWORD *)uint64_t v6 = 136315394;
    v0[17] = sub_217FE6C68(0xD000000000000025, 0x8000000218051840, &v13);
    sub_2180389D4();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[18] = sub_217FE6C68(v12, v5, &v13);
    sub_2180389D4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_217F61000, v2, v3, "Calling %s on the service (%s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v7, -1, -1);
    MEMORY[0x21D460050](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v8 = *(void *)(v0[21] + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel);
  swift_getKeyPath();
  v0[15] = v8;
  sub_218031A80((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  if (*(unsigned char *)(v8 + 17) == 1)
  {
    v0[27] = sub_2180387E4();
    uint64_t v9 = (void *)swift_task_alloc();
    v0[28] = v9;
    void *v9 = v0;
    v9[1] = sub_21802021C;
    return sub_2180190BC();
  }
  else
  {
    swift_release();
    id v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
}

uint64_t sub_21802021C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 232) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_2180387A4();
    uint64_t v7 = v6;
    uint64_t v8 = sub_218020680;
  }
  else
  {
    *(void *)(v4 + 240) = a1;
    uint64_t v5 = sub_2180387A4();
    uint64_t v7 = v9;
    uint64_t v8 = sub_21802039C;
  }
  return MEMORY[0x270FA2498](v8, v5, v7);
}

uint64_t sub_21802039C()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v2 = *(void *)(v0 + 200);
  return MEMORY[0x270FA2498](sub_218020400, v1, v2);
}

uint64_t sub_218020400()
{
  uint64_t v1 = (void *)v0[30];
  uint64_t v2 = sub_2180385F4();
  v0[31] = v2;
  v0[2] = v0;
  v0[3] = sub_218020508;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_217FE9EB4;
  v0[13] = &block_descriptor_38_0;
  v0[14] = v3;
  objc_msgSend(v1, sel_toolbarButtonPressedWithIdentifier_completionHandler_, v2, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_218020508()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 200);
  uint64_t v2 = *(void *)(*(void *)v0 + 192);
  return MEMORY[0x270FA2498](sub_218020610, v2, v1);
}

uint64_t sub_218020610()
{
  uint64_t v1 = *(void **)(v0 + 248);
  swift_release();
  swift_unknownObjectRelease();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_218020680()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v2 = *(void *)(v0 + 200);
  return MEMORY[0x270FA2498](sub_2180206E4, v1, v2);
}

uint64_t sub_2180206E4()
{
  uint64_t v1 = (void *)v0[29];
  swift_release();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_2180381B4();
  os_log_type_t v5 = sub_2180388F4();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[29];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[16] = v10;
    sub_2180389D4();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_217F61000, v4, v5, "Failed to inform toolbar button has been pressed: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v8, -1, -1);
    MEMORY[0x21D460050](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = (void *)v0[29];
  }
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_218020A1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_2180387F4();
  v3[5] = sub_2180387E4();
  uint64_t v5 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218020AB8, v5, v4);
}

uint64_t sub_218020AB8()
{
  uint64_t v1 = (void *)v0[4];
  id v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  uint64_t v3 = sub_218038624();
  uint64_t v5 = v4;
  v0[7] = v4;
  id v6 = v1;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[8] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_218020B94;
  return QLRemoteUIHostViewController.toolbarButtonPressed(withIdentifier:)(v3, v5);
}

uint64_t sub_218020B94()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 48);
  id v2 = *(void **)(*v0 + 32);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  v1[2](v1);
  _Block_release(v1);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t QLRemoteUIHostViewController.shouldDisplayLockActivity()()
{
  v1[16] = v0;
  v1[17] = sub_2180387F4();
  v1[18] = sub_2180387E4();
  v1[19] = sub_2180387E4();
  uint64_t v3 = sub_2180387A4();
  v1[20] = v3;
  v1[21] = v2;
  return MEMORY[0x270FA2498](sub_218020D98, v3, v2);
}

uint64_t sub_218020D98()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218020E34;
  return sub_2180190BC();
}

uint64_t sub_218020E34(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 184) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[20];
    uint64_t v6 = v4[21];
    uint64_t v7 = sub_218021258;
  }
  else
  {
    v4[24] = a1;
    uint64_t v5 = v4[20];
    uint64_t v6 = v4[21];
    uint64_t v7 = sub_218020F5C;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_218020F5C()
{
  swift_release();
  uint64_t v2 = sub_2180387A4();
  *(void *)(v0 + 200) = v2;
  *(void *)(v0 + 20_Block_object_dispose(&STACK[0x360], 8) = v1;
  return MEMORY[0x270FA2498](sub_218020FE0, v2, v1);
}

uint64_t sub_218020FE0()
{
  uint64_t v1 = (void *)v0[24];
  v0[2] = v0;
  v0[7] = v0 + 27;
  v0[3] = sub_2180210DC;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_217FEA6BC;
  v0[13] = &block_descriptor_40_0;
  v0[14] = v2;
  objc_msgSend(v1, sel_shouldDisplayLockActivityWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2180210DC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 208);
  uint64_t v2 = *(void *)(*(void *)v0 + 200);
  return MEMORY[0x270FA2498](sub_2180211E4, v2, v1);
}

uint64_t sub_2180211E4()
{
  swift_release();
  uint64_t v1 = *(unsigned __int8 *)(v0 + 216);
  swift_unknownObjectRelease();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_218021258()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_2180212DC, v1, v0);
}

uint64_t sub_2180212DC()
{
  swift_release();
  if (qword_267BB9518 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[23];
  uint64_t v2 = sub_2180381D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BBA8B0);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2180381B4();
  os_log_type_t v6 = sub_2180388F4();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[23];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[15] = v12;
    sub_2180389D4();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_217F61000, v5, v6, "Failed to know if current preview can be locked: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v10, -1, -1);
    MEMORY[0x21D460050](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13(0);
}

uint64_t sub_218021654(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_2180387F4();
  v2[4] = sub_2180387E4();
  uint64_t v4 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_2180216EC, v4, v3);
}

uint64_t sub_2180216EC()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_21802179C;
  return QLRemoteUIHostViewController.shouldDisplayLockActivity()();
}

uint64_t sub_21802179C(char a1)
{
  id v3 = *(void (***)(void, void))(*v1 + 40);
  uint64_t v4 = *(void **)(*v1 + 24);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  v3[2](v3, a1 & 1);
  _Block_release(v3);
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.requestLockForCurrentItem()()
{
}

uint64_t sub_218021918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  v4[3] = sub_2180387F4();
  v4[4] = sub_2180387E4();
  v4[5] = sub_2180387E4();
  uint64_t v6 = sub_2180387A4();
  v4[6] = v6;
  v4[7] = v5;
  return MEMORY[0x270FA2498](sub_2180219C0, v6, v5);
}

uint64_t sub_2180219C0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218021A5C;
  return sub_2180190BC();
}

uint64_t sub_218021A5C(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[6];
    uint64_t v6 = v4[7];
    uint64_t v7 = sub_21801ECEC;
  }
  else
  {
    v4[10] = a1;
    uint64_t v5 = v4[6];
    uint64_t v6 = v4[7];
    uint64_t v7 = sub_218021B84;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_218021B84()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218021C08, v1, v0);
}

uint64_t sub_218021C08()
{
  uint64_t v1 = *(void **)(v0 + 80);
  swift_release();
  objc_msgSend(v1, sel_requestLockForCurrentItem);
  swift_unknownObjectRelease();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t QLRemoteUIHostViewController.keyCommands()()
{
  v1[17] = v0;
  v1[18] = sub_2180387F4();
  v1[19] = sub_2180387E4();
  v1[20] = sub_2180387E4();
  uint64_t v3 = sub_2180387A4();
  v1[21] = v3;
  v1[22] = v2;
  return MEMORY[0x270FA2498](sub_218021D64, v3, v2);
}

uint64_t sub_218021D64()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218021E00;
  return sub_2180190BC();
}

uint64_t sub_218021E00(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 192) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[21];
    uint64_t v6 = v4[22];
    uint64_t v7 = sub_218022224;
  }
  else
  {
    v4[25] = a1;
    uint64_t v5 = v4[21];
    uint64_t v6 = v4[22];
    uint64_t v7 = sub_218021F28;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_218021F28()
{
  swift_release();
  uint64_t v2 = sub_2180387A4();
  *(void *)(v0 + 20_Block_object_dispose(&STACK[0x360], 8) = v2;
  *(void *)(v0 + 216) = v1;
  return MEMORY[0x270FA2498](sub_218021FAC, v2, v1);
}

uint64_t sub_218021FAC()
{
  uint64_t v1 = (void *)v0[25];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_2180220A8;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_217FEAF18;
  v0[13] = &block_descriptor_46;
  v0[14] = v2;
  objc_msgSend(v1, sel_keyCommandsWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2180220A8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 216);
  uint64_t v2 = *(void *)(*(void *)v0 + 208);
  return MEMORY[0x270FA2498](sub_2180221B0, v2, v1);
}

uint64_t sub_2180221B0()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 120);
  swift_unknownObjectRelease();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_218022224()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_2180222A8, v1, v0);
}

uint64_t sub_2180222A8()
{
  swift_release();
  if (qword_267BB9518 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 192);
  uint64_t v2 = sub_2180381D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BBA8B0);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2180381B4();
  os_log_type_t v6 = sub_2180388F4();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void **)(v0 + 192);
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 12_Block_object_dispose(&STACK[0x360], 8) = v12;
    sub_2180389D4();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_217F61000, v5, v6, "Failed to get key commands: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v10, -1, -1);
    MEMORY[0x21D460050](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v14 = MEMORY[0x263F8EE78];
  return v13(v14);
}

uint64_t sub_218022618(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_2180387F4();
  v2[4] = sub_2180387E4();
  uint64_t v4 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_2180226B0, v4, v3);
}

uint64_t sub_2180226B0()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_218022760;
  return QLRemoteUIHostViewController.keyCommands()();
}

uint64_t sub_218022760()
{
  uint64_t v1 = *(void (***)(void, void))(*v0 + 40);
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v6 = *v0;
  swift_task_dealloc();

  sub_217FF207C(0, &qword_267BBAC40);
  id v3 = (void *)sub_218038754();
  swift_bridgeObjectRelease();
  ((void (**)(void, void *))v1)[2](v1, v3);

  _Block_release(v1);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t QLRemoteUIHostViewController.keyCommandWasPerformed(_:)(void *a1)
{
  return sub_218029FD8(a1, (uint64_t)&unk_26C8F9D58, (uint64_t)&unk_267BBA9B8, (void (*)(char *, uint64_t, void *))sub_21800341C);
}

uint64_t sub_218022910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  void v5[3] = a5;
  v5[4] = sub_2180387F4();
  v5[5] = sub_2180387E4();
  v5[6] = sub_2180387E4();
  uint64_t v7 = sub_2180387A4();
  v5[7] = v7;
  v5[8] = v6;
  return MEMORY[0x270FA2498](sub_2180229B8, v7, v6);
}

uint64_t sub_2180229B8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218022A54;
  return sub_2180190BC();
}

uint64_t sub_218022A54(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[7];
    uint64_t v6 = v4[8];
    uint64_t v7 = sub_218022C88;
  }
  else
  {
    v4[11] = a1;
    uint64_t v5 = v4[7];
    uint64_t v6 = v4[8];
    uint64_t v7 = sub_218022B7C;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_218022B7C()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218022C00, v1, v0);
}

uint64_t sub_218022C00()
{
  uint64_t v1 = (void *)v0[11];
  uint64_t v2 = v0[3];
  swift_release();
  objc_msgSend(v1, sel_keyCommandWasPerformed_, v2);
  swift_unknownObjectRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_218022C88()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218022D0C, v1, v0);
}

uint64_t sub_218022D0C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t QLRemoteUIHostViewController.setAppearance(_:animated:)(void *a1, char a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218038804();
  uint64_t v8 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  sub_2180387F4();
  id v9 = v2;
  id v10 = a1;
  uint64_t v11 = sub_2180387E4();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v13;
  *(void *)(v12 + 32) = v9;
  *(void *)(v12 + 40) = v10;
  *(unsigned char *)(v12 + 4_Block_object_dispose(&STACK[0x360], 8) = a2;
  sub_21800341C((uint64_t)v7, (uint64_t)&unk_267BBA9C8, v12);
  return swift_release();
}

uint64_t sub_218022EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v6 + 96) = a6;
  *(void *)(v6 + 16) = a4;
  *(void *)(v6 + 24) = a5;
  *(void *)(v6 + 32) = sub_2180387F4();
  *(void *)(v6 + 40) = sub_2180387E4();
  *(void *)(v6 + 4_Block_object_dispose(&STACK[0x360], 8) = sub_2180387E4();
  uint64_t v8 = sub_2180387A4();
  *(void *)(v6 + 56) = v8;
  *(void *)(v6 + 64) = v7;
  return MEMORY[0x270FA2498](sub_218022F8C, v8, v7);
}

uint64_t sub_218022F8C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218023028;
  return sub_2180190BC();
}

uint64_t sub_218023028(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[7];
    uint64_t v6 = v4[8];
    uint64_t v7 = sub_21801E898;
  }
  else
  {
    v4[11] = a1;
    uint64_t v5 = v4[7];
    uint64_t v6 = v4[8];
    uint64_t v7 = sub_218023150;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_218023150()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_2180231D4, v1, v0);
}

uint64_t sub_2180231D4()
{
  uint64_t v1 = *(void **)(v0 + 88);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 24);
  swift_release();
  objc_msgSend(v1, sel_setAppearance_animated_, v3, v2);
  swift_unknownObjectRelease();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.notifyFirstTimeAppearance(with:)(__C::QLPreviewControllerFirstTimeAppearanceActions with)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218038804();
  uint64_t v6 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  sub_2180387F4();
  id v7 = v1;
  uint64_t v8 = sub_2180387E4();
  uint64_t v9 = (__C::QLPreviewControllerFirstTimeAppearanceActions *)swift_allocObject();
  Swift::UInt v10 = MEMORY[0x263F8F500];
  v9[2].rawValue = v8;
  v9[3].rawValue = v10;
  v9[4].rawValue = (Swift::UInt)v7;
  v9[5].rawValue = with.rawValue;
  sub_21800341C((uint64_t)v5, (uint64_t)&unk_267BBA9D8, (uint64_t)v9);
  swift_release();
}

uint64_t sub_2180234F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  void v5[3] = a5;
  v5[4] = sub_2180387F4();
  v5[5] = sub_2180387E4();
  v5[6] = sub_2180387E4();
  uint64_t v7 = sub_2180387A4();
  v5[7] = v7;
  v5[8] = v6;
  return MEMORY[0x270FA2498](sub_2180235A0, v7, v6);
}

uint64_t sub_2180235A0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21802363C;
  return sub_2180190BC();
}

uint64_t sub_21802363C(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[7];
    uint64_t v6 = v4[8];
    uint64_t v7 = sub_21801E898;
  }
  else
  {
    v4[11] = a1;
    uint64_t v5 = v4[7];
    uint64_t v6 = v4[8];
    uint64_t v7 = sub_218023764;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_218023764()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_2180237E8, v1, v0);
}

uint64_t sub_2180237E8()
{
  uint64_t v1 = (void *)v0[11];
  uint64_t v2 = v0[3];
  swift_release();
  objc_msgSend(v1, sel_notifyFirstTimeAppearanceWithActions_, v2);
  swift_unknownObjectRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.notifyStateRestorationUserInfo(_:)(Swift::OpaquePointer_optional a1)
{
  rawValue = a1.value._rawValue;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218038804();
  uint64_t v6 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  sub_2180387F4();
  swift_bridgeObjectRetain();
  id v7 = v1;
  uint64_t v8 = sub_2180387E4();
  uint64_t v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  v9[5] = rawValue;
  sub_21800341C((uint64_t)v5, (uint64_t)&unk_267BBA9E8, (uint64_t)v9);
  swift_release();
}

uint64_t sub_218023AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[7] = sub_2180387F4();
  v5[8] = sub_2180387E4();
  v5[9] = sub_2180387E4();
  uint64_t v7 = sub_2180387A4();
  v5[10] = v7;
  v5[11] = v6;
  return MEMORY[0x270FA2498](sub_218023B90, v7, v6);
}

uint64_t sub_218023B90()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218023C2C;
  return sub_2180190BC();
}

uint64_t sub_218023C2C(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v4[2] = v2;
  v4[3] = a1;
  v4[4] = v1;
  v4[13] = v1;
  swift_task_dealloc();
  uint64_t v5 = v3[11];
  uint64_t v6 = v3[10];
  if (v1) {
    uint64_t v7 = sub_21801DC9C;
  }
  else {
    uint64_t v7 = sub_218023D70;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_218023D70()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218023DF4, v1, v0);
}

uint64_t sub_218023DF4()
{
  uint64_t v1 = *(void **)(v0 + 48);
  swift_release();
  if (v1) {
    uint64_t v1 = (void *)sub_2180385A4();
  }
  objc_msgSend(*(id *)(v0 + 24), sel_notifyStateRestorationUserInfo_, v1);

  swift_unknownObjectRelease();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t QLRemoteUIHostViewController.previewItemDisplayState(_:wasAppliedToItemAt:)(uint64_t a1, uint64_t a2)
{
  return sub_2180281D8(a1, a2, (uint64_t)&unk_26C8F9DF8, (uint64_t)&unk_267BBA9F8);
}

uint64_t sub_21802404C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  v6[5] = sub_2180387F4();
  void v6[6] = sub_2180387E4();
  v6[7] = sub_2180387E4();
  uint64_t v8 = sub_2180387A4();
  v6[8] = v8;
  v6[9] = v7;
  return MEMORY[0x270FA2498](sub_2180240F8, v8, v7);
}

uint64_t sub_2180240F8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218024194;
  return sub_2180190BC();
}

uint64_t sub_218024194(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 8_Block_object_dispose(&STACK[0x360], 8) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[8];
    uint64_t v6 = v4[9];
    uint64_t v7 = sub_21801D5A4;
  }
  else
  {
    v4[12] = a1;
    uint64_t v5 = v4[8];
    uint64_t v6 = v4[9];
    uint64_t v7 = sub_2180242BC;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_2180242BC()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218024340, v1, v0);
}

uint64_t sub_218024340()
{
  uint64_t v1 = (void *)v0[12];
  uint64_t v3 = (void *)v0[3];
  uint64_t v2 = v0[4];
  swift_release();
  __swift_project_boxed_opaque_existential_0(v3, v3[3]);
  objc_msgSend(v1, sel_previewItemDisplayState_wasAppliedToItemAtIndex_, sub_218038BA4(), v2);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t QLRemoteUIHostViewController.startTransition(withSourceViewProvider:transitionController:presenting:useInteractiveTransition:)(uint64_t a1, uint64_t a2, char a3, char a4)
{
  *(void *)(v5 + 136) = a2;
  *(void *)(v5 + 144) = v4;
  *(unsigned char *)(v5 + 233) = a4;
  *(unsigned char *)(v5 + 232) = a3;
  *(void *)(v5 + 12_Block_object_dispose(&STACK[0x360], 8) = a1;
  *(void *)(v5 + 152) = sub_2180387F4();
  *(void *)(v5 + 160) = sub_2180387E4();
  *(void *)(v5 + 16_Block_object_dispose(&STACK[0x360], 8) = sub_2180387E4();
  uint64_t v7 = sub_2180387A4();
  *(void *)(v5 + 176) = v7;
  *(void *)(v5 + 184) = v6;
  return MEMORY[0x270FA2498](sub_2180244CC, v7, v6);
}

uint64_t sub_2180244CC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 192) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218024568;
  return sub_2180190BC();
}

uint64_t sub_218024568(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 200) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[22];
    uint64_t v6 = v4[23];
    uint64_t v7 = sub_2180249A8;
  }
  else
  {
    v4[26] = a1;
    uint64_t v5 = v4[22];
    uint64_t v6 = v4[23];
    uint64_t v7 = sub_218024690;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_218024690()
{
  swift_release();
  uint64_t v2 = sub_2180387A4();
  *(void *)(v0 + 216) = v2;
  *(void *)(v0 + 224) = v1;
  return MEMORY[0x270FA2498](sub_218024714, v2, v1);
}

uint64_t sub_218024714()
{
  uint64_t v1 = *(void **)(v0 + 208);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 233);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 232);
  uint64_t v5 = *(void *)(v0 + 128);
  uint64_t v4 = *(void *)(v0 + 136);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_218024834;
  uint64_t v6 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 8_Block_object_dispose(&STACK[0x360], 8) = 0x40000000;
  *(void *)(v0 + 96) = sub_217FE9EB4;
  *(void *)(v0 + 104) = &block_descriptor_68;
  *(void *)(v0 + 112) = v6;
  objc_msgSend(v1, sel_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler_, v5, v4, v3, v2, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_218024834()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 224);
  uint64_t v2 = *(void *)(*(void *)v0 + 216);
  return MEMORY[0x270FA2498](sub_21802493C, v2, v1);
}

uint64_t sub_21802493C()
{
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2180249A8()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218024A2C, v1, v0);
}

uint64_t sub_218024A2C()
{
  swift_release();
  if (qword_267BB9518 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[25];
  uint64_t v2 = sub_2180381D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BBA8B0);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2180381B4();
  os_log_type_t v6 = sub_2180388F4();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[25];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[15] = v12;
    sub_2180389D4();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_217F61000, v5, v6, "Failed to start transition: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v10, -1, -1);
    MEMORY[0x21D460050](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_218024DD8(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 32) = a5;
  *(void *)(v6 + 40) = a6;
  *(unsigned char *)(v6 + 73) = a4;
  *(unsigned char *)(v6 + 72) = a3;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  sub_2180387F4();
  *(void *)(v6 + 4_Block_object_dispose(&STACK[0x360], 8) = sub_2180387E4();
  uint64_t v8 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218024E7C, v8, v7);
}

uint64_t sub_218024E7C()
{
  uint64_t v1 = *(void **)(v0 + 40);
  uint64_t v2 = *(const void **)(v0 + 32);
  id v3 = *(void **)(v0 + 16);
  swift_release();
  *(void *)(v0 + 56) = _Block_copy(v2);
  id v4 = v3;
  swift_unknownObjectRetain();
  id v5 = v1;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v6;
  void *v6 = v0;
  v6[1] = sub_218024F54;
  char v7 = *(unsigned char *)(v0 + 73);
  char v8 = *(unsigned char *)(v0 + 72);
  uint64_t v10 = *(void *)(v0 + 16);
  uint64_t v9 = *(void *)(v0 + 24);
  return QLRemoteUIHostViewController.startTransition(withSourceViewProvider:transitionController:presenting:useInteractiveTransition:)(v10, v9, v8, v7);
}

uint64_t sub_218024F54()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 56);
  uint64_t v2 = *(void **)(*v0 + 40);
  id v3 = *(void **)(*v0 + 16);
  uint64_t v6 = *v0;
  swift_task_dealloc();

  swift_unknownObjectRelease();
  v1[2](v1);
  _Block_release(v1);
  id v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.tearDownTransition(_:)(Swift::Bool a1)
{
}

uint64_t sub_2180250FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 8_Block_object_dispose(&STACK[0x360], 8) = a5;
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = sub_2180387F4();
  *(void *)(v5 + 32) = sub_2180387E4();
  *(void *)(v5 + 40) = sub_2180387E4();
  uint64_t v7 = sub_2180387A4();
  *(void *)(v5 + 4_Block_object_dispose(&STACK[0x360], 8) = v7;
  *(void *)(v5 + 56) = v6;
  return MEMORY[0x270FA2498](sub_2180251A8, v7, v6);
}

uint64_t sub_2180251A8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218025244;
  return sub_2180190BC();
}

uint64_t sub_218025244(uint64_t a1)
{
  id v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[6];
    uint64_t v6 = v4[7];
    uint64_t v7 = sub_218025478;
  }
  else
  {
    v4[10] = a1;
    uint64_t v5 = v4[6];
    uint64_t v6 = v4[7];
    uint64_t v7 = sub_21802536C;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_21802536C()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_2180253F0, v1, v0);
}

uint64_t sub_2180253F0()
{
  uint64_t v1 = *(void **)(v0 + 80);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 88);
  swift_release();
  objc_msgSend(v1, sel_tearDownTransition_, v2);
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_218025478()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_2180254FC, v1, v0);
}

uint64_t sub_2180254FC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.setLoading(_:)(Swift::String a1)
{
}

uint64_t sub_2180255C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  v6[5] = sub_2180387F4();
  void v6[6] = sub_2180387E4();
  v6[7] = sub_2180387E4();
  uint64_t v8 = sub_2180387A4();
  v6[8] = v8;
  v6[9] = v7;
  return MEMORY[0x270FA2498](sub_218025674, v8, v7);
}

uint64_t sub_218025674()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218025710;
  return sub_2180190BC();
}

uint64_t sub_218025710(uint64_t a1)
{
  id v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 8_Block_object_dispose(&STACK[0x360], 8) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[8];
    uint64_t v6 = v4[9];
    uint64_t v7 = sub_218025960;
  }
  else
  {
    v4[12] = a1;
    uint64_t v5 = v4[8];
    uint64_t v6 = v4[9];
    uint64_t v7 = sub_218025838;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_218025838()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_2180258BC, v1, v0);
}

uint64_t sub_2180258BC()
{
  uint64_t v1 = *(void **)(v0 + 96);
  swift_release();
  uint64_t v2 = (void *)sub_2180385F4();
  objc_msgSend(v1, sel_setLoadingString_, v2);

  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_218025960()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_2180259E4, v1, v0);
}

uint64_t sub_2180259E4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.overrideParentApplicationDisplayIdentifier(withIdentifier:)(Swift::String withIdentifier)
{
}

uint64_t sub_218025AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, uint64_t, void *))
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218038804();
  uint64_t v13 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 0, 1, v13);
  sub_2180387F4();
  id v14 = v5;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_2180387E4();
  uint64_t v16 = (void *)swift_allocObject();
  uint64_t v17 = MEMORY[0x263F8F500];
  v16[2] = v15;
  v16[3] = v17;
  v16[4] = v14;
  v16[5] = a1;
  v16[6] = a2;
  a5(v12, a4, v16);
  return swift_release();
}

uint64_t sub_218025BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  void v6[6] = sub_2180387F4();
  v6[7] = sub_2180387E4();
  v6[8] = sub_2180387E4();
  uint64_t v8 = sub_2180387A4();
  v6[9] = v8;
  v6[10] = v7;
  return MEMORY[0x270FA2498](sub_218025CA4, v8, v7);
}

uint64_t sub_218025CA4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 8_Block_object_dispose(&STACK[0x360], 8) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218025D40;
  return sub_2180190BC();
}

uint64_t sub_218025D40(uint64_t a1)
{
  id v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 96) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[9];
    uint64_t v6 = v4[10];
    uint64_t v7 = sub_218025F8C;
  }
  else
  {
    v4[13] = a1;
    uint64_t v5 = v4[9];
    uint64_t v6 = v4[10];
    uint64_t v7 = sub_218025E68;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_218025E68()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218025EEC, v1, v0);
}

uint64_t sub_218025EEC()
{
  uint64_t v1 = *(void **)(v0 + 104);
  swift_release();
  uint64_t v2 = (void *)sub_2180385F4();
  objc_msgSend(v1, sel_overrideParentApplicationDisplayIdentifierWithIdentifier_, v2);

  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_218025F8C()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218026010, v1, v0);
}

uint64_t sub_218026010()
{
  swift_release();
  if (qword_267BB9518 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[12];
  uint64_t v2 = sub_2180381D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BBA8B0);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2180381B4();
  os_log_type_t v6 = sub_2180388F4();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[12];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v12;
    sub_2180389D4();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_217F61000, v5, v6, "Failed to override parent application display identifier: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v10, -1, -1);
    MEMORY[0x21D460050](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_218026250(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(char *, uint64_t, void *))
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_218038624();
  uint64_t v14 = v13;
  id v15 = a1;
  sub_218038804();
  uint64_t v16 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v11, 0, 1, v16);
  sub_2180387F4();
  id v17 = v15;
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_2180387E4();
  uint64_t v19 = (void *)swift_allocObject();
  uint64_t v20 = MEMORY[0x263F8F500];
  v19[2] = v18;
  v19[3] = v20;
  v19[4] = v17;
  v19[5] = v12;
  v19[6] = v14;
  a6(v11, a5, v19);

  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t QLRemoteUIHostViewController.preparePreviewCollectionForInvalidation()()
{
  v1[16] = v0;
  v1[17] = sub_2180387F4();
  v1[18] = sub_2180387E4();
  v1[19] = sub_2180387E4();
  uint64_t v3 = sub_2180387A4();
  v1[20] = v3;
  v1[21] = v2;
  return MEMORY[0x270FA2498](sub_21802646C, v3, v2);
}

uint64_t sub_21802646C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218026508;
  return sub_2180190BC();
}

uint64_t sub_218026508(uint64_t a1)
{
  id v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 184) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[20];
    uint64_t v6 = v4[21];
    BOOL v7 = sub_2180268B0;
  }
  else
  {
    v4[24] = a1;
    uint64_t v5 = v4[20];
    uint64_t v6 = v4[21];
    BOOL v7 = sub_218026630;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_218026630()
{
  swift_release();
  uint64_t v2 = sub_2180387A4();
  *(void *)(v0 + 200) = v2;
  *(void *)(v0 + 20_Block_object_dispose(&STACK[0x360], 8) = v1;
  return MEMORY[0x270FA2498](sub_2180266B4, v2, v1);
}

uint64_t sub_2180266B4()
{
  uint64_t v1 = (void *)v0[24];
  v0[2] = v0;
  v0[3] = sub_2180267A8;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_217FE9EB4;
  v0[13] = &block_descriptor_82;
  v0[14] = v2;
  objc_msgSend(v1, sel_preparePreviewCollectionForInvalidationWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2180267A8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 208);
  uint64_t v2 = *(void *)(*(void *)v0 + 200);
  return MEMORY[0x270FA2498](sub_218031D30, v2, v1);
}

uint64_t sub_2180268B0()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218026934, v1, v0);
}

uint64_t sub_218026934()
{
  swift_release();
  if (qword_267BB9518 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[23];
  uint64_t v2 = sub_2180381D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BBA8B0);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2180381B4();
  os_log_type_t v6 = sub_2180388F4();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[23];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[15] = v12;
    sub_2180389D4();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_217F61000, v5, v6, "Failed to prepare preview collection for invalidation: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v10, -1, -1);
    MEMORY[0x21D460050](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_218026CA8(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_2180387F4();
  v2[4] = sub_2180387E4();
  uint64_t v4 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218026D40, v4, v3);
}

uint64_t sub_218026D40()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_218031D7C;
  return QLRemoteUIHostViewController.preparePreviewCollectionForInvalidation()();
}

uint64_t QLRemoteUIHostViewController.invalidateService()()
{
  v1[16] = v0;
  v1[17] = sub_2180387F4();
  v1[18] = sub_2180387E4();
  v1[19] = sub_2180387E4();
  uint64_t v3 = sub_2180387A4();
  v1[20] = v3;
  v1[21] = v2;
  return MEMORY[0x270FA2498](sub_218026E98, v3, v2);
}

uint64_t sub_218026E98()
{
  v0[22] = *(void *)(v0[16] + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[23] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218026F38;
  return sub_2180190BC();
}

uint64_t sub_218026F38(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 192) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[20];
    uint64_t v6 = v4[21];
    BOOL v7 = sub_2180274FC;
  }
  else
  {
    v4[25] = a1;
    uint64_t v5 = v4[20];
    uint64_t v6 = v4[21];
    BOOL v7 = sub_218027060;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_218027060()
{
  swift_release();
  uint64_t v2 = sub_2180387A4();
  *(void *)(v0 + 20_Block_object_dispose(&STACK[0x360], 8) = v2;
  *(void *)(v0 + 216) = v1;
  return MEMORY[0x270FA2498](sub_2180270E4, v2, v1);
}

uint64_t sub_2180270E4()
{
  uint64_t v1 = (void *)v0[25];
  v0[2] = v0;
  v0[3] = sub_2180271D8;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_217FE9EB4;
  v0[13] = &block_descriptor_84;
  v0[14] = v2;
  objc_msgSend(v1, sel_invalidateServiceWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2180271D8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 216);
  uint64_t v2 = *(void *)(*(void *)v0 + 208);
  return MEMORY[0x270FA2498](sub_2180272E0, v2, v1);
}

uint64_t sub_2180272E0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 224) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218027370;
  return sub_2180198D0();
}

uint64_t sub_218027370()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 216);
  uint64_t v3 = *(void *)(v1 + 208);
  return MEMORY[0x270FA2498](sub_218027490, v3, v2);
}

uint64_t sub_218027490()
{
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2180274FC()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218027580, v1, v0);
}

uint64_t sub_218027580()
{
  swift_release();
  if (qword_267BB9518 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[24];
  uint64_t v2 = sub_2180381D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BBA8B0);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2180381B4();
  os_log_type_t v6 = sub_2180388F4();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[24];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[15] = v12;
    sub_2180389D4();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_217F61000, v5, v6, "Failed to invalidate service: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v10, -1, -1);
    MEMORY[0x21D460050](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_2180278F4(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_2180387F4();
  v2[4] = sub_2180387E4();
  uint64_t v4 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21802798C, v4, v3);
}

uint64_t sub_21802798C()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_218027A3C;
  return QLRemoteUIHostViewController.invalidateService()();
}

uint64_t sub_218027A3C()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 40);
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  id v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t QLRemoteUIHostViewController.hostViewControlerTransition(to:animated:)(uint64_t a1, char a2)
{
  return sub_218027B94(a1, a2, (uint64_t)&unk_26C8F9E98, (uint64_t)&unk_267BBAA50);
}

uint64_t sub_218027B94(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218038804();
  uint64_t v11 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  sub_2180387F4();
  id v12 = v4;
  uint64_t v13 = sub_2180387E4();
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = MEMORY[0x263F8F500];
  *(void *)(v14 + 16) = v13;
  *(void *)(v14 + 24) = v15;
  *(void *)(v14 + 32) = v12;
  *(void *)(v14 + 40) = a1;
  *(unsigned char *)(v14 + 4_Block_object_dispose(&STACK[0x360], 8) = a2;
  sub_21800341C((uint64_t)v10, a4, v14);
  return swift_release();
}

uint64_t sub_218027CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v6 + 96) = a6;
  *(void *)(v6 + 16) = a4;
  *(void *)(v6 + 24) = a5;
  *(void *)(v6 + 32) = sub_2180387F4();
  *(void *)(v6 + 40) = sub_2180387E4();
  *(void *)(v6 + 4_Block_object_dispose(&STACK[0x360], 8) = sub_2180387E4();
  uint64_t v8 = sub_2180387A4();
  *(void *)(v6 + 56) = v8;
  *(void *)(v6 + 64) = v7;
  return MEMORY[0x270FA2498](sub_218027D70, v8, v7);
}

uint64_t sub_218027D70()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218027E0C;
  return sub_2180190BC();
}

uint64_t sub_218027E0C(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[7];
    uint64_t v6 = v4[8];
    uint64_t v7 = sub_218022C88;
  }
  else
  {
    v4[11] = a1;
    uint64_t v5 = v4[7];
    uint64_t v6 = v4[8];
    uint64_t v7 = sub_218027F34;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_218027F34()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218027FB8, v1, v0);
}

uint64_t sub_218027FB8()
{
  uint64_t v1 = *(void **)(v0 + 88);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 24);
  swift_release();
  objc_msgSend(v1, sel_hostViewControlerTransitionToState_animated_, v3, v2);
  swift_unknownObjectRelease();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_218028070(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v10 - 8);
  id v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = a1;
  sub_218038804();
  uint64_t v14 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v12, 0, 1, v14);
  sub_2180387F4();
  id v15 = v13;
  uint64_t v16 = sub_2180387E4();
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = MEMORY[0x263F8F500];
  *(void *)(v17 + 16) = v16;
  *(void *)(v17 + 24) = v18;
  *(void *)(v17 + 32) = v15;
  *(void *)(v17 + 40) = a3;
  *(unsigned char *)(v17 + 4_Block_object_dispose(&STACK[0x360], 8) = a4;
  sub_21800341C((uint64_t)v12, a6, v17);

  return swift_release();
}

uint64_t QLRemoteUIHostViewController.setPreviewItemDisplayState(_:onItemAt:)(uint64_t a1, uint64_t a2)
{
  return sub_2180281D8(a1, a2, (uint64_t)&unk_26C8F9EC0, (uint64_t)&unk_267BBAA60);
}

uint64_t sub_2180281D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218038804();
  uint64_t v11 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  sub_217FE7A00(a1, (uint64_t)v17);
  sub_2180387F4();
  id v12 = v4;
  uint64_t v13 = sub_2180387E4();
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = MEMORY[0x263F8F500];
  *(void *)(v14 + 16) = v13;
  *(void *)(v14 + 24) = v15;
  *(void *)(v14 + 32) = v12;
  sub_217FF363C(v17, (_OWORD *)(v14 + 40));
  *(void *)(v14 + 72) = a2;
  sub_21800341C((uint64_t)v10, a4, v14);
  return swift_release();
}

uint64_t sub_218028328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  v6[5] = sub_2180387F4();
  void v6[6] = sub_2180387E4();
  v6[7] = sub_2180387E4();
  uint64_t v8 = sub_2180387A4();
  v6[8] = v8;
  v6[9] = v7;
  return MEMORY[0x270FA2498](sub_2180283D4, v8, v7);
}

uint64_t sub_2180283D4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218028470;
  return sub_2180190BC();
}

uint64_t sub_218028470(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 8_Block_object_dispose(&STACK[0x360], 8) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[8];
    uint64_t v6 = v4[9];
    uint64_t v7 = sub_21801D5A4;
  }
  else
  {
    v4[12] = a1;
    uint64_t v5 = v4[8];
    uint64_t v6 = v4[9];
    uint64_t v7 = sub_218028598;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_218028598()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21802861C, v1, v0);
}

uint64_t sub_21802861C()
{
  uint64_t v1 = (void *)v0[12];
  uint64_t v3 = (void *)v0[3];
  uint64_t v2 = v0[4];
  swift_release();
  __swift_project_boxed_opaque_existential_0(v3, v3[3]);
  objc_msgSend(v1, sel_setPreviewItemDisplayState_onItemAtIndex_, sub_218038BA4(), v2);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_2180286F4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain();
  id v12 = a1;
  sub_2180389F4();
  swift_unknownObjectRelease();
  sub_218038804();
  uint64_t v13 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 0, 1, v13);
  sub_217FE7A00((uint64_t)v20, (uint64_t)v19);
  sub_2180387F4();
  id v14 = v12;
  uint64_t v15 = sub_2180387E4();
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = MEMORY[0x263F8F500];
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = v17;
  *(void *)(v16 + 32) = v14;
  sub_217FF363C(v19, (_OWORD *)(v16 + 40));
  *(void *)(v16 + 72) = a4;
  sub_21800341C((uint64_t)v11, a6, v16);

  swift_release();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v20);
}

uint64_t QLRemoteUIHostViewController.prepareForActionSheetPresentation()()
{
  v1[16] = v0;
  v1[17] = sub_2180387F4();
  v1[18] = sub_2180387E4();
  v1[19] = sub_2180387E4();
  uint64_t v3 = sub_2180387A4();
  v1[20] = v3;
  v1[21] = v2;
  return MEMORY[0x270FA2498](sub_21802891C, v3, v2);
}

uint64_t sub_21802891C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2180289B8;
  return sub_2180190BC();
}

uint64_t sub_2180289B8(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 184) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[20];
    uint64_t v6 = v4[21];
    uint64_t v7 = sub_218028DCC;
  }
  else
  {
    v4[24] = a1;
    uint64_t v5 = v4[20];
    uint64_t v6 = v4[21];
    uint64_t v7 = sub_218028AE0;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_218028AE0()
{
  swift_release();
  uint64_t v2 = sub_2180387A4();
  *(void *)(v0 + 200) = v2;
  *(void *)(v0 + 20_Block_object_dispose(&STACK[0x360], 8) = v1;
  return MEMORY[0x270FA2498](sub_218028B64, v2, v1);
}

uint64_t sub_218028B64()
{
  uint64_t v1 = (void *)v0[24];
  v0[2] = v0;
  v0[3] = sub_218028C58;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_217FE9EB4;
  v0[13] = &block_descriptor_95;
  v0[14] = v2;
  objc_msgSend(v1, sel_prepareForActionSheetPresentationWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_218028C58()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 208);
  uint64_t v2 = *(void *)(*(void *)v0 + 200);
  return MEMORY[0x270FA2498](sub_218028D60, v2, v1);
}

uint64_t sub_218028D60()
{
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_218028DCC()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218028E50, v1, v0);
}

uint64_t sub_218028E50()
{
  swift_release();
  if (qword_267BB9518 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[23];
  uint64_t v2 = sub_2180381D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BBA8B0);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2180381B4();
  os_log_type_t v6 = sub_2180388F4();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[23];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[15] = v12;
    sub_2180389D4();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_217F61000, v5, v6, "Failed to prepare for action sheet presentation: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v10, -1, -1);
    MEMORY[0x21D460050](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_2180291C4(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_2180387F4();
  v2[4] = sub_2180387E4();
  uint64_t v4 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21802925C, v4, v3);
}

uint64_t sub_21802925C()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_21802930C;
  return QLRemoteUIHostViewController.prepareForActionSheetPresentation()();
}

uint64_t sub_21802930C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 40);
  id v3 = *(void **)(*v0 + 24);
  uint64_t v4 = *v0;
  swift_task_dealloc();

  if (v2)
  {
    uint64_t v5 = *(void (***)(void))(v1 + 40);
    v5[2](v5);
    _Block_release(v5);
  }
  uint64_t v6 = *(uint64_t (**)(void))(v4 + 8);
  return v6();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.actionSheetDidDismiss()()
{
}

uint64_t sub_218029488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  v4[3] = sub_2180387F4();
  v4[4] = sub_2180387E4();
  v4[5] = sub_2180387E4();
  uint64_t v6 = sub_2180387A4();
  v4[6] = v6;
  v4[7] = v5;
  return MEMORY[0x270FA2498](sub_218029530, v6, v5);
}

uint64_t sub_218029530()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2180295CC;
  return sub_2180190BC();
}

uint64_t sub_2180295CC(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[6];
    uint64_t v6 = v4[7];
    BOOL v7 = sub_218025478;
  }
  else
  {
    v4[10] = a1;
    uint64_t v5 = v4[6];
    uint64_t v6 = v4[7];
    BOOL v7 = sub_2180296F4;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_2180296F4()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218029778, v1, v0);
}

uint64_t sub_218029778()
{
  uint64_t v1 = *(void **)(v0 + 80);
  swift_release();
  objc_msgSend(v1, sel_actionSheetDidDismiss);
  swift_unknownObjectRelease();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.documentMenuActionWillBegin()()
{
}

uint64_t sub_218029860(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t, void *))
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218038804();
  uint64_t v9 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  sub_2180387F4();
  id v10 = v3;
  uint64_t v11 = sub_2180387E4();
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  id v12[2] = v11;
  uint64_t v12[3] = v13;
  v12[4] = v10;
  a3(v8, a2, v12);
  return swift_release();
}

uint64_t sub_21802998C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = sub_2180387F4();
  v4[5] = sub_2180387E4();
  v4[6] = sub_2180387E4();
  uint64_t v6 = sub_2180387A4();
  v4[7] = v6;
  v4[8] = v5;
  return MEMORY[0x270FA2498](sub_218029A34, v6, v5);
}

uint64_t sub_218029A34()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218029AD0;
  return sub_2180190BC();
}

uint64_t sub_218029AD0(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 80) = a1;
  *(void *)(v4 + 8_Block_object_dispose(&STACK[0x360], 8) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(v3 + 56);
  if (v1) {
    uint64_t v7 = sub_218029D44;
  }
  else {
    uint64_t v7 = sub_218029C14;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_218029C14()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218029C98, v1, v0);
}

uint64_t sub_218029C98()
{
  uint64_t v1 = *(void **)(v0 + 80);
  swift_release();
  unsigned __int8 v2 = objc_msgSend(v1, sel_respondsToSelector_, sel_documentMenuActionWillBegin);
  if (v2) {
    objc_msgSend(*(id *)(v0 + 80), sel_documentMenuActionWillBegin);
  }
  uint64_t v3 = *(BOOL **)(v0 + 16);
  swift_unknownObjectRelease();
  *uint64_t v3 = (v2 & 1) == 0;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_218029D44()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218029DC8, v1, v0);
}

uint64_t sub_218029DC8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_218029E60(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, uint64_t, void *))
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a1;
  sub_218038804();
  uint64_t v12 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 0, 1, v12);
  sub_2180387F4();
  id v13 = v11;
  uint64_t v14 = sub_2180387E4();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x263F8F500];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v13;
  a5(v10, a4, v15);

  return swift_release();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.hostViewControllerBackgroundColorChanged(_:)(UIColor a1)
{
}

uint64_t sub_218029FD8(void *a1, uint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t, void *))
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218038804();
  uint64_t v11 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  sub_2180387F4();
  id v12 = v4;
  id v13 = a1;
  uint64_t v14 = sub_2180387E4();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x263F8F500];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v12;
  v15[5] = v13;
  a4(v10, a3, v15);
  return swift_release();
}

uint64_t sub_21802A110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  v5[5] = sub_2180387F4();
  v5[6] = sub_2180387E4();
  v5[7] = sub_2180387E4();
  uint64_t v7 = sub_2180387A4();
  v5[8] = v7;
  v5[9] = v6;
  return MEMORY[0x270FA2498](sub_21802A1BC, v7, v6);
}

uint64_t sub_21802A1BC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21802A258;
  return sub_2180190BC();
}

uint64_t sub_21802A258(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 8_Block_object_dispose(&STACK[0x360], 8) = a1;
  *(void *)(v4 + 96) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 72);
  uint64_t v6 = *(void *)(v3 + 64);
  if (v1) {
    uint64_t v7 = sub_21802A4D0;
  }
  else {
    uint64_t v7 = sub_21802A39C;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_21802A39C()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21802A420, v1, v0);
}

uint64_t sub_21802A420()
{
  uint64_t v1 = *(void **)(v0 + 88);
  swift_release();
  unsigned __int8 v2 = objc_msgSend(v1, sel_respondsToSelector_, sel_hostViewControllerBackgroundColorChanged_);
  if (v2) {
    objc_msgSend(*(id *)(v0 + 88), sel_hostViewControllerBackgroundColorChanged_, *(void *)(v0 + 32));
  }
  uint64_t v3 = *(BOOL **)(v0 + 16);
  swift_unknownObjectRelease();
  *uint64_t v3 = (v2 & 1) == 0;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_21802A4D0()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21802A554, v1, v0);
}

uint64_t sub_21802A554()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21802A5EC(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void (*a6)(char *, uint64_t, void *))
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v10 - 8);
  id v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = a3;
  id v14 = a1;
  sub_218038804();
  uint64_t v15 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 0, 1, v15);
  sub_2180387F4();
  id v16 = v13;
  id v17 = v14;
  uint64_t v18 = sub_2180387E4();
  uint64_t v19 = (void *)swift_allocObject();
  uint64_t v20 = MEMORY[0x263F8F500];
  _OWORD v19[2] = v18;
  v19[3] = v20;
  v19[4] = v17;
  v19[5] = v16;
  a6(v12, a5, v19);

  return swift_release();
}

uint64_t QLRemoteUIHostViewController.saveIntoPhotoLibraryMedia(with:previewItemType:completionHandler:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218038804();
  uint64_t v11 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_2180387F4();
  swift_retain();
  id v13 = a1;
  sub_2180307D8(a3);
  uint64_t v14 = sub_2180387E4();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x263F8F500];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v12;
  v15[5] = v13;
  void v15[6] = a2;
  v15[7] = a3;
  v15[8] = a4;
  swift_release();
  sub_21801A818((uint64_t)v10, (uint64_t)&unk_267BBAAA8, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_21802A8D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[10] = a7;
  v8[11] = a8;
  v8[8] = a5;
  v8[9] = a6;
  v8[7] = a4;
  v8[12] = sub_2180387F4();
  v8[13] = sub_2180387E4();
  uint64_t v10 = sub_2180387A4();
  v8[14] = v10;
  v8[15] = v9;
  return MEMORY[0x270FA2498](sub_21802A97C, v10, v9);
}

uint64_t sub_21802A97C()
{
  uint64_t v1 = v0[7] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x21D460130](v1);
  v0[16] = v2;
  if (v2)
  {
    v0[17] = sub_2180387E4();
    uint64_t v4 = sub_2180387A4();
    v0[18] = v4;
    v0[19] = v3;
    return MEMORY[0x270FA2498](sub_21802AA6C, v4, v3);
  }
  else
  {
    swift_release();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_21802AA6C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21802AB08;
  return sub_2180190BC();
}

uint64_t sub_21802AB08(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 16_Block_object_dispose(&STACK[0x360], 8) = a1;
  *(void *)(v4 + 176) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 152);
  uint64_t v6 = *(void *)(v3 + 144);
  if (v1) {
    uint64_t v7 = sub_21802AFF4;
  }
  else {
    uint64_t v7 = sub_21802AC4C;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_21802AC4C()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 120);
  return MEMORY[0x270FA2498](sub_21802ACB0, v1, v2);
}

uint64_t sub_21802ACB0()
{
  uint64_t v1 = v0[21];
  uint64_t v3 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v4 = sub_2180387E4();
  v0[23] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[24] = v5;
  v5[2] = v1;
  void v5[3] = v3;
  v5[4] = v2;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[25] = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAD00);
  void *v6 = v0;
  v6[1] = sub_21802ADD8;
  uint64_t v8 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2318](v0 + 5, v4, v8, 0xD000000000000042, 0x8000000218051BE0, sub_218031884, v5, v7);
}

uint64_t sub_21802ADD8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 120);
  uint64_t v3 = *(void *)(v1 + 112);
  return MEMORY[0x270FA2498](sub_21802AF38, v3, v2);
}

uint64_t sub_21802AF38()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_release();
  uint64_t v2 = *(void **)(v0 + 48);
  uint64_t v3 = *(void **)(v0 + 128);
  if (v1)
  {
    (*(void (**)(void, void))(v0 + 80))(*(unsigned __int8 *)(v0 + 40), *(void *)(v0 + 48));
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_21802AFF4()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 120);
  return MEMORY[0x270FA2498](sub_21802B058, v1, v2);
}

uint64_t sub_21802B058()
{
  uint64_t v1 = v0[10];
  swift_release();
  uint64_t v2 = (void *)v0[22];
  uint64_t v3 = (void *)v0[16];
  if (v1)
  {
    uint64_t v4 = (void (*)(void, void *))v0[10];
    id v5 = v2;
    v4(0, v2);
  }
  else
  {
  }
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_21802B110(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAD08);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  if ((objc_msgSend(a2, sel_respondsToSelector_, sel_saveIntoPhotoLibraryMediaWithURLWrapper_previewItemType_completionHandler_) & 1) == 0)return sub_2180387C4(); {
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  }
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = sub_218031924;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_217FEEA14;
  aBlock[3] = &block_descriptor_393;
  id v13 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(a2, sel_saveIntoPhotoLibraryMediaWithURLWrapper_previewItemType_completionHandler_, a3, a4, v13);
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

uint64_t sub_21802B318(int a1, id a2)
{
  id v2 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAD08);
  return sub_2180387C4();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.setIsContentManaged(_:)(Swift::Bool a1)
{
}

uint64_t sub_21802B474(char a1, uint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t, uint64_t))
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218038804();
  uint64_t v11 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  sub_2180387F4();
  id v12 = v4;
  uint64_t v13 = sub_2180387E4();
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = MEMORY[0x263F8F500];
  *(void *)(v14 + 16) = v13;
  *(void *)(v14 + 24) = v15;
  *(void *)(v14 + 32) = v12;
  *(unsigned char *)(v14 + 40) = a1;
  a4(v10, a3, v14);
  return swift_release();
}

uint64_t sub_21802B5A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 8_Block_object_dispose(&STACK[0x360], 8) = a5;
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = sub_2180387F4();
  *(void *)(v5 + 32) = sub_2180387E4();
  *(void *)(v5 + 40) = sub_2180387E4();
  uint64_t v7 = sub_2180387A4();
  *(void *)(v5 + 4_Block_object_dispose(&STACK[0x360], 8) = v7;
  *(void *)(v5 + 56) = v6;
  return MEMORY[0x270FA2498](sub_21802B654, v7, v6);
}

uint64_t sub_21802B654()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21802B6F0;
  return sub_2180190BC();
}

uint64_t sub_21802B6F0(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[6];
    uint64_t v6 = v4[7];
    uint64_t v7 = sub_21801ECEC;
  }
  else
  {
    v4[10] = a1;
    uint64_t v5 = v4[6];
    uint64_t v6 = v4[7];
    uint64_t v7 = sub_21802B818;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_21802B818()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21802B89C, v1, v0);
}

uint64_t sub_21802B89C()
{
  uint64_t v1 = *(void **)(v0 + 80);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 88);
  swift_release();
  objc_msgSend(v1, sel_setIsContentManaged_, v2);
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_21802B958(void *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, void (*a6)(char *, uint64_t, uint64_t))
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v10 - 8);
  id v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = a1;
  sub_218038804();
  uint64_t v14 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v12, 0, 1, v14);
  sub_2180387F4();
  id v15 = v13;
  uint64_t v16 = sub_2180387E4();
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = MEMORY[0x263F8F500];
  *(void *)(v17 + 16) = v16;
  *(void *)(v17 + 24) = v18;
  *(void *)(v17 + 32) = v15;
  *(unsigned char *)(v17 + 40) = a3;
  a6(v12, a5, v17);

  return swift_release();
}

uint64_t QLRemoteUIHostViewController.saveCurrentPreviewEditsSynchronously(_:)(char a1)
{
  *(void *)(v2 + 152) = v1;
  *(unsigned char *)(v2 + 264) = a1;
  uint64_t v3 = sub_2180381D4();
  *(void *)(v2 + 160) = v3;
  *(void *)(v2 + 16_Block_object_dispose(&STACK[0x360], 8) = *(void *)(v3 - 8);
  *(void *)(v2 + 176) = swift_task_alloc();
  *(void *)(v2 + 184) = sub_2180387F4();
  *(void *)(v2 + 192) = sub_2180387E4();
  *(void *)(v2 + 200) = sub_2180387E4();
  uint64_t v5 = sub_2180387A4();
  *(void *)(v2 + 20_Block_object_dispose(&STACK[0x360], 8) = v5;
  *(void *)(v2 + 216) = v4;
  return MEMORY[0x270FA2498](sub_21802BBAC, v5, v4);
}

uint64_t sub_21802BBAC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 224) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21802BC48;
  return sub_2180190BC();
}

uint64_t sub_21802BC48(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 232) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[26];
    uint64_t v6 = v4[27];
    uint64_t v7 = sub_21802C080;
  }
  else
  {
    v4[30] = a1;
    uint64_t v5 = v4[26];
    uint64_t v6 = v4[27];
    uint64_t v7 = sub_21802BD70;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_21802BD70()
{
  swift_release();
  uint64_t v2 = sub_2180387A4();
  *(void *)(v0 + 24_Block_object_dispose(&STACK[0x360], 8) = v2;
  *(void *)(v0 + 256) = v1;
  return MEMORY[0x270FA2498](sub_21802BDF4, v2, v1);
}

uint64_t sub_21802BDF4()
{
  uint64_t v1 = *(void **)(v0 + 240);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 264);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_21802BEF8;
  uint64_t v3 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 8_Block_object_dispose(&STACK[0x360], 8) = 0x40000000;
  *(void *)(v0 + 96) = sub_217FEF20C;
  *(void *)(v0 + 104) = &block_descriptor_120;
  *(void *)(v0 + 112) = v3;
  objc_msgSend(v1, sel_saveCurrentPreviewEditsSynchronously_withCompletionHandler_, v2, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_21802BEF8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 256);
  uint64_t v2 = *(void *)(*(void *)v0 + 248);
  return MEMORY[0x270FA2498](sub_21802C000, v2, v1);
}

uint64_t sub_21802C000()
{
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v2, v1);
}

uint64_t sub_21802C080()
{
  swift_release();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21802C104, v1, v0);
}

uint64_t sub_21802C104()
{
  uint64_t v30 = v0;
  swift_release();
  if (qword_267BB9518 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 232);
  uint64_t v3 = *(void *)(v0 + 168);
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v4 = *(void *)(v0 + 160);
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_267BBA8B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_2180381B4();
  os_log_type_t v9 = sub_2180388F4();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = *(void **)(v0 + 232);
  uint64_t v13 = *(void *)(v0 + 168);
  uint64_t v12 = *(void *)(v0 + 176);
  uint64_t v14 = *(void *)(v0 + 160);
  if (v10)
  {
    uint64_t v28 = *(void *)(v0 + 176);
    int v15 = *(unsigned __int8 *)(v0 + 264);
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v29 = v26;
    *(_DWORD *)uint64_t v16 = 136315394;
    if (v15) {
      uint64_t v18 = 0x6F7268636E797361;
    }
    else {
      uint64_t v18 = 0x6E6F7268636E7973;
    }
    uint64_t v27 = v14;
    if (v15) {
      unint64_t v19 = 0xEE00796C73756F6ELL;
    }
    else {
      unint64_t v19 = 0xED0000796C73756FLL;
    }
    *(void *)(v0 + 136) = sub_217FE6C68(v18, v19, &v29);
    sub_2180389D4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2112;
    id v20 = v11;
    uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 144) = v21;
    sub_2180389D4();
    *uint64_t v17 = v21;

    _os_log_impl(&dword_217F61000, v8, v9, "Failed to save current preview edits %s: %@", (uint8_t *)v16, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v26, -1, -1);
    MEMORY[0x21D460050](v16, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v28, v27);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  uint64_t v22 = *(void **)(v0 + 232);
  uint64_t v23 = sub_218037CE4();

  if (v23 < 0) {
    return sub_218038B04();
  }
  swift_task_dealloc();
  uint64_t v24 = *(uint64_t (**)(uint64_t, void))(v0 + 8);
  return v24(v23, 0);
}

uint64_t sub_21802C618(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(unsigned char *)(v3 + 56) = a1;
  sub_2180387F4();
  *(void *)(v3 + 32) = sub_2180387E4();
  uint64_t v5 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21802C6B4, v5, v4);
}

uint64_t sub_21802C6B4()
{
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = *(const void **)(v0 + 16);
  swift_release();
  *(void *)(v0 + 40) = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 4_Block_object_dispose(&STACK[0x360], 8) = v4;
  void *v4 = v0;
  v4[1] = sub_21802C76C;
  char v5 = *(unsigned char *)(v0 + 56);
  return QLRemoteUIHostViewController.saveCurrentPreviewEditsSynchronously(_:)(v5);
}

uint64_t sub_21802C76C(uint64_t a1, void *a2)
{
  char v5 = *(void (***)(void, void, void))(*v2 + 40);
  id v6 = *(void **)(*v2 + 24);
  uint64_t v9 = *v2;
  swift_task_dealloc();

  ((void (**)(void, uint64_t, void *))v5)[2](v5, a1, a2);
  _Block_release(v5);

  uint64_t v7 = *(uint64_t (**)(void))(v9 + 8);
  return v7();
}

void sub_21802C8C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel);
  swift_getKeyPath();
  sub_218031A80((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  if (*(unsigned char *)(v1 + 17) == 1)
  {
    type metadata accessor for QLHostRemoteViewModel();
    swift_retain();
    sub_2180384A4();
    id v2 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267BBAD48));
    swift_retain();
    swift_retain();
    id v3 = (void *)sub_218038314();
    sub_21802D0D8(v3);
    swift_release();
    swift_release();
  }
  else
  {
    sub_21802CA5C(v1);
    swift_getKeyPath();
    sub_218037E24();
    swift_release();
    uint64_t v4 = *(void **)(v1 + 32);
    if (v4) {
      objc_msgSend(v4, sel_remoteViewControllerWasInvalidated);
    }
  }
}

void sub_21802CA54()
{
  sub_21802C8C0(*(void *)(v0 + 16));
}

void sub_21802CA5C(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)QLErrorItemViewController), sel_init);
  swift_getKeyPath();
  v10[0] = a1;
  sub_218031A80((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_currentItem, v10[0]);
    id v5 = objc_msgSend(v4, sel_createPreviewContext);
  }
  else
  {
    id v5 = 0;
    id v4 = 0;
  }
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = v2;
  void v10[4] = sub_218031D08;
  v10[5] = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_21802D544;
  v10[3] = &block_descriptor_484;
  uint64_t v8 = _Block_copy(v10);
  id v9 = v2;
  swift_release();
  objc_msgSend(v9, sel_loadPreviewControllerWithContents_context_completionHandler_, v4, v5, v8);
  _Block_release(v8);

  swift_unknownObjectRelease();
}

uint64_t sub_21802CC54(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x21D460130](a1 + 16);
  sub_2180387F4();
  uint64_t v7 = sub_2180387E4();
  uint64_t v8 = (void *)swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8F500];
  v8[2] = v7;
  v8[3] = v9;
  v8[4] = v6;
  sub_21801A818((uint64_t)v4, (uint64_t)&unk_267BBAD38, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_21802CD8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_2180387F4();
  *(void *)(v4 + 24) = sub_2180387E4();
  uint64_t v6 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_21802CE24, v6, v5);
}

uint64_t sub_21802CE24()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 16);
    sub_21802CF08();
    *(void *)(swift_task_alloc() + 16) = v2;
    *(void *)(swift_task_alloc() + 16) = v2;
    sub_218037E04();
    swift_task_dealloc();
    swift_task_dealloc();
  }
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

id sub_21802CF08()
{
  id v1 = objc_msgSend(v0, sel_childViewControllers);
  sub_217FF207C(0, &qword_267BBAD40);
  unint64_t v2 = sub_218038764();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
    return (id)swift_bridgeObjectRelease_n();
  }
LABEL_12:
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_218038B24();
  if (!v3) {
    return (id)swift_bridgeObjectRelease_n();
  }
LABEL_3:
  for (uint64_t i = 4; ; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)MEMORY[0x21D45EB20](i - 4, v2);
    }
    else {
      id v5 = *(id *)(v2 + 8 * i);
    }
    uint64_t v6 = v5;
    uint64_t v7 = i - 3;
    if (__OFADD__(i - 4, 1))
    {
      __break(1u);
      goto LABEL_12;
    }
    objc_msgSend(v5, sel_willMoveToParentViewController_, 0);
    id result = objc_msgSend(v6, sel_view);
    if (!result) {
      break;
    }
    uint64_t v9 = result;
    objc_msgSend(result, sel_removeFromSuperview);

    objc_msgSend(v6, sel_removeFromParentViewController);
    if (v7 == v3) {
      return (id)swift_bridgeObjectRelease_n();
    }
  }
  __break(1u);
  return result;
}

void sub_21802D07C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x21D460130](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    sub_21802D0D8(a3);
  }
}

void sub_21802D0D8(void *a1)
{
  unint64_t v2 = v1;
  id v32 = objc_msgSend(a1, sel_view);
  if (!v32) {
    goto LABEL_15;
  }
  id v4 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v32, sel_setBackgroundColor_, v4);

  objc_msgSend(v32, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v2, sel_addChildViewController_, a1);
  id v5 = objc_msgSend(v2, sel_view);
  if (!v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v6 = v5;
  objc_msgSend(v5, sel_addSubview_, v32);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAD50);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_218044660;
  id v8 = objc_msgSend(v32, sel_topAnchor);
  id v9 = objc_msgSend(v2, sel_view);
  if (!v9)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v10 = v9;
  id v11 = objc_msgSend(v9, sel_topAnchor);

  id v12 = objc_msgSend(v8, sel_constraintEqualToAnchor_, v11);
  *(void *)(v7 + 32) = v12;
  id v13 = objc_msgSend(v32, sel_bottomAnchor);
  id v14 = objc_msgSend(v2, sel_view);
  if (!v14)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  int v15 = v14;
  id v16 = objc_msgSend(v14, sel_bottomAnchor);

  id v17 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v16);
  *(void *)(v7 + 40) = v17;
  id v18 = objc_msgSend(v32, sel_leadingAnchor);
  id v19 = objc_msgSend(v2, sel_view);
  if (!v19)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v20 = v19;
  id v21 = objc_msgSend(v19, sel_leadingAnchor);

  id v22 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v21);
  *(void *)(v7 + 4_Block_object_dispose(&STACK[0x360], 8) = v22;
  id v23 = objc_msgSend(v32, sel_trailingAnchor);
  id v24 = objc_msgSend(v2, sel_view);
  if (!v24)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    sub_218038A74();
    swift_bridgeObjectRelease();
    id v30 = a1;
    id v31 = objc_msgSend(v30, sel_description);
    sub_218038624();

    sub_2180386E4();
    swift_bridgeObjectRelease();
    sub_218038B14();
    __break(1u);
    return;
  }
  uint64_t v25 = v24;
  uint64_t v26 = self;
  id v27 = objc_msgSend(v25, sel_trailingAnchor);

  id v28 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v27);
  *(void *)(v7 + 56) = v28;
  sub_218038774();
  sub_217FF207C(0, (unint64_t *)&qword_267BB9F60);
  uint64_t v29 = (void *)sub_218038754();
  swift_bridgeObjectRelease();
  objc_msgSend(v26, sel_activateConstraints_, v29);

  objc_msgSend(a1, sel_didMoveToParentViewController_, v2);
}

void sub_21802D544(uint64_t a1, void *a2)
{
}

void sub_21802D54C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_21802D5BC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_217FF2264;
  return v6();
}

uint64_t sub_21802D688(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *id v5 = v4;
  v5[1] = sub_217FF2264;
  return v7();
}

uint64_t sub_21802D754(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_218038824();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_218038814();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_217FF6BD8(a1, (uint64_t *)&unk_267BBA400);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2180387A4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21802D900(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_218031D78;
  return v6(a1);
}

uint64_t sub_21802D9DC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_21802DAB8;
  return v6(a1);
}

uint64_t sub_21802DAB8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_21802DBB0()
{
  v0[15] = sub_2180387F4();
  v0[16] = sub_2180387E4();
  uint64_t v2 = sub_2180387A4();
  v0[17] = v2;
  v0[18] = v1;
  return MEMORY[0x270FA2498](sub_21802DC48, v2, v1);
}

uint64_t sub_21802DC48()
{
  type metadata accessor for QLRemoteUIHostViewController();
  uint64_t v1 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel;
  v0[19] = v1;
  v0[20] = v2;
  v0[21] = *(void *)&v1[v2];
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[22] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_21802DD10;
  return sub_218017B64();
}

uint64_t sub_21802DD10()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[17];
    uint64_t v4 = v2[18];
    uint64_t v5 = sub_21802F444;
  }
  else
  {
    swift_release();
    v2[24] = sub_2180387E4();
    uint64_t v6 = sub_2180387A4();
    uint64_t v4 = v7;
    v2[25] = v6;
    v2[26] = v7;
    uint64_t v5 = sub_21802DE70;
    uint64_t v3 = v6;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_21802DE70()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21802DF04;
  return sub_2180190BC();
}

uint64_t sub_21802DF04(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 224) = a1;
  *(void *)(v4 + 232) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 208);
  uint64_t v6 = *(void *)(v3 + 200);
  if (v1) {
    uint64_t v7 = sub_21802E34C;
  }
  else {
    uint64_t v7 = sub_21802E048;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_21802E048()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 144);
  return MEMORY[0x270FA2498](sub_21802E0AC, v1, v2);
}

uint64_t sub_21802E0AC()
{
  uint64_t v1 = (uint64_t (*)())objc_msgSend(self, sel_sharedInstance);
  if (v1)
  {
    uint64_t v4 = v1;
    objc_msgSend(*(id *)(v0 + 224), sel_setNotificationCenter_, v1);

    swift_unknownObjectRelease();
    *(void *)(v0 + 240) = sub_2180387E4();
    uint64_t v5 = sub_2180387A4();
    uint64_t v3 = v6;
    *(void *)(v0 + 24_Block_object_dispose(&STACK[0x360], 8) = v5;
    *(void *)(v0 + 256) = v6;
    uint64_t v1 = sub_21802E190;
    uint64_t v2 = v5;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_21802E190()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21802E224;
  return sub_2180190BC();
}

uint64_t sub_21802E224(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 272) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[31];
    uint64_t v6 = v4[32];
    uint64_t v7 = sub_21802E910;
  }
  else
  {
    v4[35] = a1;
    uint64_t v5 = v4[31];
    uint64_t v6 = v4[32];
    uint64_t v7 = sub_21802E5B8;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_21802E34C()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 144);
  return MEMORY[0x270FA2498](sub_21802E3B0, v1, v2);
}

uint64_t sub_21802E3B0()
{
  swift_release();
  uint64_t v1 = (void *)v0[29];
  if (qword_267BB9518 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2180381D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BBA8B0);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2180381B4();
  os_log_type_t v6 = sub_2180388F4();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[14] = v10;
    sub_2180389D4();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_217F61000, v5, v6, "Failed to create remote preview collection: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v8, -1, -1);
    MEMORY[0x21D460050](v7, -1, -1);
  }
  else
  {
  }
  id v11 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v12 = v0[19];
  return v11(v12);
}

uint64_t sub_21802E5B8()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 144);
  return MEMORY[0x270FA2498](sub_21802E61C, v1, v2);
}

uint64_t sub_21802E61C()
{
  uint64_t v1 = (void *)v0[35];
  v0[6] = sub_21801C180;
  v0[7] = 0;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_21801C1F8;
  v0[5] = &block_descriptor_462;
  uint64_t v2 = _Block_copy(v0 + 2);
  objc_msgSend(v1, sel_getNetworkObserverWithCompletionBlock_, v2);
  _Block_release(v2);
  swift_unknownObjectRelease();
  v0[36] = sub_2180387E4();
  uint64_t v4 = sub_2180387A4();
  v0[37] = v4;
  v0[38] = v3;
  return MEMORY[0x270FA2498](sub_21802E738, v4, v3);
}

uint64_t sub_21802E738()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 312) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21802E7CC;
  return sub_218019458();
}

uint64_t sub_21802E7CC(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 320) = a1;
  *(void *)(v4 + 32_Block_object_dispose(&STACK[0x360], 8) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 304);
  uint64_t v6 = *(void *)(v3 + 296);
  if (v1) {
    uint64_t v7 = sub_21802EDCC;
  }
  else {
    uint64_t v7 = sub_21802EB7C;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_21802E910()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 144);
  return MEMORY[0x270FA2498](sub_21802E974, v1, v2);
}

uint64_t sub_21802E974()
{
  swift_release();
  uint64_t v1 = (void *)v0[34];
  if (qword_267BB9518 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2180381D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BBA8B0);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2180381B4();
  os_log_type_t v6 = sub_2180388F4();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[14] = v10;
    sub_2180389D4();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_217F61000, v5, v6, "Failed to create remote preview collection: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v8, -1, -1);
    MEMORY[0x21D460050](v7, -1, -1);
  }
  else
  {
  }
  id v11 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v12 = v0[19];
  return v11(v12);
}

uint64_t sub_21802EB7C()
{
  swift_release();
  v0[42] = sub_2180387E4();
  uint64_t v2 = sub_2180387A4();
  v0[43] = v2;
  v0[44] = v1;
  return MEMORY[0x270FA2498](sub_21802EC10, v2, v1);
}

uint64_t sub_21802EC10()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21802ECA4;
  return sub_2180190BC();
}

uint64_t sub_21802ECA4(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 36_Block_object_dispose(&STACK[0x360], 8) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[43];
    uint64_t v6 = v4[44];
    uint64_t v7 = sub_21802F1CC;
  }
  else
  {
    v4[47] = a1;
    uint64_t v5 = v4[43];
    uint64_t v6 = v4[44];
    uint64_t v7 = sub_21802F038;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_21802EDCC()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 144);
  return MEMORY[0x270FA2498](sub_21802EE30, v1, v2);
}

uint64_t sub_21802EE30()
{
  swift_release();
  uint64_t v1 = (void *)v0[41];
  if (qword_267BB9518 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2180381D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BBA8B0);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2180381B4();
  os_log_type_t v6 = sub_2180388F4();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[14] = v10;
    sub_2180389D4();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_217F61000, v5, v6, "Failed to create remote preview collection: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v8, -1, -1);
    MEMORY[0x21D460050](v7, -1, -1);
  }
  else
  {
  }
  id v11 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v12 = v0[19];
  return v11(v12);
}

uint64_t sub_21802F038()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 144);
  return MEMORY[0x270FA2498](sub_21802F09C, v1, v2);
}

uint64_t sub_21802F09C()
{
  uint64_t v1 = (void *)v0[47];
  uint64_t v2 = v0[40];
  swift_release();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  v0[12] = sub_218031B20;
  v0[13] = v3;
  v0[8] = MEMORY[0x263EF8330];
  v0[9] = 1107296256;
  v0[10] = sub_21801C258;
  v0[11] = &block_descriptor_470;
  uint64_t v4 = _Block_copy(v0 + 8);
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(v1, sel_getPreviewCollectionUUIDWithCompletionHandlerWithCompletionHandler_, v4);
  _Block_release(v4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v6 = v0[19];
  return v5(v6);
}

uint64_t sub_21802F1CC()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 144);
  return MEMORY[0x270FA2498](sub_21802F230, v1, v2);
}

uint64_t sub_21802F230()
{
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v1 = (void *)v0[46];
  if (qword_267BB9518 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2180381D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BBA8B0);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2180381B4();
  os_log_type_t v6 = sub_2180388F4();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[14] = v10;
    sub_2180389D4();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_217F61000, v5, v6, "Failed to create remote preview collection: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v8, -1, -1);
    MEMORY[0x21D460050](v7, -1, -1);
  }
  else
  {
  }
  id v11 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v12 = v0[19];
  return v11(v12);
}

uint64_t sub_21802F444()
{
  swift_release();
  swift_release();
  uint64_t v1 = (void *)v0[23];
  if (qword_267BB9518 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2180381D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BBA8B0);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2180381B4();
  os_log_type_t v6 = sub_2180388F4();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[14] = v10;
    sub_2180389D4();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_217F61000, v5, v6, "Failed to create remote preview collection: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA980);
    swift_arrayDestroy();
    MEMORY[0x21D460050](v8, -1, -1);
    MEMORY[0x21D460050](v7, -1, -1);
  }
  else
  {
  }
  id v11 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v12 = v0[19];
  return v11(v12);
}

uint64_t sub_21802F660()
{
  return objectdestroyTm_0(41);
}

uint64_t sub_21802F668(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_217FF2264;
  return sub_21801C7D8(a1, v4, v5, v6, v7);
}

uint64_t sub_21802F730(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  id v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_217FF2264;
  return sub_21801D20C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_21802F7F8()
{
  return objectdestroy_12Tm(73);
}

uint64_t sub_21802F800(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_217FF2264;
  return sub_21801D8E8(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_21802F8F8()
{
  return sub_2180164E8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_21802F914()
{
  return objectdestroy_12Tm(72);
}

uint64_t objectdestroy_12Tm(uint64_t a1)
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_21802F978(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_217FF2264;
  return sub_21801E0AC(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_21802FA54()
{
  return objectdestroyTm_0(49);
}

uint64_t sub_21802FA5C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_217FF2264;
  return sub_21801E50C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_21802FB24()
{
  return objectdestroyTm_0(41);
}

uint64_t sub_21802FB2C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  char v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *char v8 = v2;
  v8[1] = sub_217FF2264;
  return sub_21801E970(a1, v4, v5, v6, v7);
}

uint64_t sub_21802FBF0()
{
  return objectdestroyTm_0(40);
}

uint64_t sub_21802FBF8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  char v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *char v7 = v2;
  v7[1] = sub_217FF2264;
  return sub_21801EDD8(a1, v4, v5, v6);
}

uint64_t sub_21802FCAC()
{
  return objectdestroyTm_0(40);
}

uint64_t sub_21802FCB4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  char v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *char v7 = v2;
  v7[1] = sub_217FF2264;
  return sub_218021918(a1, v4, v5, v6);
}

uint64_t sub_21802FD68()
{
  return objectdestroy_48Tm(48);
}

uint64_t sub_21802FD70(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  char v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *char v8 = v2;
  v8[1] = sub_217FF2264;
  return sub_218022910(a1, v4, v5, v7, v6);
}

uint64_t sub_21802FE30()
{
  return objectdestroy_48Tm(49);
}

uint64_t sub_21802FE38(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_217FF2264;
  return sub_218022EE0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_21802FF00()
{
  return objectdestroyTm_0(48);
}

uint64_t sub_21802FF08(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  char v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *char v8 = v2;
  v8[1] = sub_217FF2264;
  return sub_2180234F8(a1, v4, v5, v7, v6);
}

uint64_t sub_21802FFCC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  char v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *char v8 = v2;
  v8[1] = sub_217FF2264;
  return sub_218023AE8(a1, v4, v5, v7, v6);
}

uint64_t sub_218030090(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (uint64_t)(v1 + 5);
  uint64_t v8 = v1[9];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_217FF2264;
  return sub_21802404C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_21803015C()
{
  return objectdestroyTm_0(41);
}

uint64_t sub_218030164(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_217FF2264;
  return sub_2180250FC(a1, v4, v5, v6, v7);
}

uint64_t sub_21803022C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_217FF2264;
  return sub_2180255C8(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2180302F8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_217FF2264;
  return sub_218025BF8(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2180303C0()
{
  return objectdestroyTm_0(49);
}

uint64_t sub_2180303C8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_217FF2264;
  return sub_218027CC4(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_218030494(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (uint64_t)(v1 + 5);
  uint64_t v8 = v1[9];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_217FF2264;
  return sub_218028328(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_218030560()
{
  return objectdestroyTm_0(40);
}

uint64_t sub_218030568(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_217FF2264;
  return sub_218029488(a1, v4, v5, v6);
}

uint64_t sub_21803061C()
{
  return objectdestroyTm_0(40);
}

uint64_t sub_218030624(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_217FF2264;
  return sub_21802998C(a1, v4, v5, v6);
}

uint64_t sub_2180306D8()
{
  return objectdestroy_48Tm(48);
}

uint64_t sub_2180306E0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_217FF2264;
  return sub_21802A110(a1, v4, v5, v7, v6);
}

uint64_t sub_2180307A0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2180307D8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2180307E8()
{
  swift_unknownObjectRelease();
  swift_release();

  if (*(void *)(v0 + 56)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_218030840(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_217FF2264;
  return sub_21802A8D8(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_21803091C()
{
  return objectdestroyTm_0(41);
}

uint64_t sub_218030924(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_217FF2264;
  return sub_21802B5A8(a1, v4, v5, v6, v7);
}

uint64_t sub_2180309E8@<X0>(uint64_t a1@<X8>)
{
  return sub_21801B360(a1);
}

uint64_t sub_218030A10()
{
  return type metadata accessor for QLRemoteUIHostViewController();
}

void sub_218030A18()
{
  sub_218030BA8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for QLRemoteUIHostViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for QLRemoteUIHostViewController);
}

uint64_t dispatch thunk of QLRemoteUIHostViewController.isAvailable.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of QLRemoteUIHostViewController.uuid.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of QLRemoteUIHostViewController.uuid.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of QLRemoteUIHostViewController.uuid.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

void sub_218030BA8()
{
  if (!qword_267BBAAE8)
  {
    sub_218037DF4();
    unint64_t v0 = sub_2180389C4();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BBAAE8);
    }
  }
}

uint64_t sub_218030C00()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_218030C40()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_217FF2264;
  uint64_t v6 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_267BBAAF0 + dword_267BBAAF0);
  return v6(v2, v4, v3);
}

uint64_t sub_218030CFC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_218030D34(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_217FF2264;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267BBAB20 + dword_267BBAB20);
  return v6(a1, v4);
}

uint64_t sub_218030DEC()
{
  return objectdestroyTm_0(41);
}

uint64_t sub_218030DF4()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_218030E2C()
{
  return objectdestroy_48Tm(48);
}

uint64_t sub_218030E34()
{
  return objectdestroyTm_0(40);
}

uint64_t sub_218030E3C()
{
  return objectdestroyTm_0(40);
}

uint64_t sub_218030E44()
{
  return objectdestroy_170Tm(MEMORY[0x263EF8310]);
}

uint64_t sub_218030E5C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_217FF2264;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_267BBAB50 + dword_267BBAB50);
  return v5(v2, v3);
}

uint64_t sub_218030F14()
{
  return objectdestroyTm_0(49);
}

uint64_t sub_218030F1C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_217FF1CC0;
  return sub_218027CC4(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_218030FE4()
{
  return objectdestroy_170Tm(MEMORY[0x263EF8310]);
}

uint64_t sub_218030FFC()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_217FF2264;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_267BBAB80 + dword_267BBAB80);
  return v5(v2, v3);
}

uint64_t sub_2180310B0()
{
  return objectdestroy_170Tm(MEMORY[0x263EF8310]);
}

uint64_t sub_2180310C8()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_217FF2264;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_267BBABA0 + dword_267BBABA0);
  return v5(v2, v3);
}

uint64_t sub_218031184()
{
  return objectdestroyTm_0(41);
}

uint64_t sub_21803118C()
{
  swift_unknownObjectRelease();
  _Block_release(*(const void **)(v0 + 40));

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2180311DC()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  char v4 = *(unsigned char *)(v0 + 32);
  char v5 = *(unsigned char *)(v0 + 33);
  uint64_t v7 = *(void *)(v0 + 40);
  uint64_t v6 = *(void *)(v0 + 48);
  char v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  *char v8 = v1;
  v8[1] = sub_217FF2264;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, char, char, uint64_t, uint64_t))((char *)&dword_267BBABD8
                                                                              + dword_267BBABD8);
  return v9(v2, v3, v4, v5, v7, v6);
}

uint64_t objectdestroy_64Tm_0()
{
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_0(v0 + 40);

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t objectdestroy_60Tm_0()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_218031354()
{
  return objectdestroyTm_0(48);
}

uint64_t sub_21803135C()
{
  return objectdestroy_48Tm(49);
}

uint64_t sub_218031364()
{
  return objectdestroy_48Tm(48);
}

uint64_t objectdestroy_48Tm(uint64_t a1)
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_2180313C0()
{
  return objectdestroy_170Tm(MEMORY[0x263EF8310]);
}

uint64_t sub_2180313D8()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  char v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_217FF2264;
  char v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_267BBAC20 + dword_267BBAC20);
  return v5(v2, v3);
}

uint64_t sub_21803148C()
{
  return objectdestroyTm_0(40);
}

uint64_t sub_218031494()
{
  return objectdestroy_170Tm(MEMORY[0x263EF8310]);
}

uint64_t sub_2180314AC()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  char v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_217FF2264;
  char v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_267BBAC50 + dword_267BBAC50);
  return v5(v2, v3);
}

uint64_t sub_218031564()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  char v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *char v5 = v1;
  v5[1] = sub_217FF2264;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_267BBAC70 + dword_267BBAC70);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_315Tm()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21803166C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  char v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *char v5 = v1;
  v5[1] = sub_217FF2264;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_267BBAC90 + dword_267BBAC90);
  return v6(v2, v3, v4);
}

uint64_t sub_218031728()
{
  return objectdestroyTm_0(40);
}

uint64_t sub_218031730()
{
  return objectdestroyTm_0(41);
}

uint64_t sub_218031738()
{
  return objectdestroyTm_0(49);
}

uint64_t objectdestroy_8Tm()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_21803178C()
{
  return objectdestroyTm_0(41);
}

uint64_t sub_218031794()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2180317CC()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_217FF2264;
  uint64_t v4 = (uint64_t (*)(uint64_t))((char *)&dword_267BBACE0 + dword_267BBACE0);
  return v4(v2);
}

uint64_t sub_218031884(uint64_t a1)
{
  return sub_21802B110(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_218031890()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAD08);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_218031924(int a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAD08);

  return sub_21802B318(a1, a2);
}

uint64_t sub_2180319B8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_217FF2264;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267BBAD18 + dword_267BBAD18);
  return v6(a1, v4);
}

uint64_t sub_218031A80(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_218031AC8()
{
  return sub_218016160(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_218031AE8()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_218031B20(id result)
{
  if (result) {
    return objc_msgSend(*(id *)(v1 + 16), sel_configureAsAccessoryViewContainerForPreviewCollectionWithPreviewCollectionUUID_, result);
  }
  return result;
}

uint64_t sub_218031B3C()
{
  return sub_21802CC54(v0);
}

uint64_t sub_218031B44()
{
  return objectdestroyTm_0(40);
}

uint64_t objectdestroyTm_0(uint64_t a1)
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_218031B98(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_217FF1CC0;
  return sub_21802CD8C(a1, v4, v5, v6);
}

uint64_t (*sub_218031C4C())()
{
  return sub_218031B3C;
}

uint64_t sub_218031CA8()
{
  return objectdestroy_170Tm(MEMORY[0x263F8EED8]);
}

uint64_t objectdestroy_170Tm(void (*a1)(void))
{
  a1(*(void *)(v1 + 16));

  return MEMORY[0x270FA0238](v1, 32, 7);
}

void sub_218031D08(uint64_t a1)
{
  sub_21802D07C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_218031D10()
{
  return sub_218016208(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_218031D5C()
{
  return sub_21802F8F8();
}

uint64_t sub_218031D80(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_218031DA8()
{
  return sub_218031D80(*v0);
}

uint64_t static QLAppExtensionSceneBuilder.buildBlock<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v7 = *(void *)(a2 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  *(void *)(v11 + 24) = a3;
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, v9, a2);
  *a4 = sub_218031EE4;
  a4[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v11;
  return result;
}

uint64_t sub_218031EE4@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, unint64_t))(*(void *)(*(void *)(v1 + 16) - 8) + 16))(a1, v1+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80)));
}

uint64_t static QLAppExtensionSceneBuilder.buildBlock<A, B>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t (**a7)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  uint64_t v26 = a7;
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v12);
  id v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v14 + 16))(v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a2, a4);
  unint64_t v17 = (*(unsigned __int8 *)(v14 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v18 = (v15 + *(unsigned __int8 *)(v10 + 80) + v17) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  id v19 = (char *)swift_allocObject();
  *((void *)v19 + 2) = a3;
  *((void *)v19 + 3) = a4;
  uint64_t v20 = v25;
  *((void *)v19 + 4) = v24;
  *((void *)v19 + 5) = v20;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v19[v17], v16, a3);
  uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v10 + 32))(&v19[v18], (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
  id v22 = v26;
  *uint64_t v26 = sub_218032228;
  v22[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v19;
  return result;
}

uint64_t sub_218032128()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = *(void *)(v1 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v4 + *(void *)(v2 + 64) + v6) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v3 | v6 | 7;
  (*(void (**)(uint64_t))(v2 + 8))(v0 + v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v7, v1);

  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_218032228@<X0>(uint64_t *a1@<X8>)
{
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v1[2] - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1[2] - 8) + 80);
  return sub_2180322C8((uint64_t)v1 + v2, (uint64_t)v1+ ((v2 + *(void *)(*(void *)(v1[2] - 8) + 64) + *(unsigned __int8 *)(*(void *)(v1[3] - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1[3] - 8) + 80)), v1[2], v1[3], *(void *)(v1[4] + 8), *(void *)(v1[5] + 8), a1);
}

uint64_t sub_2180322C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  id v22 = a7;
  uint64_t v23 = a6;
  uint64_t v20 = a5;
  uint64_t v21 = a2;
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAE70);
  sub_218037EB4();
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_218044630;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, a3);
  sub_218037EA4();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v21, a4);
  uint64_t result = sub_218037EA4();
  uint64_t *v22 = v18;
  return result;
}

uint64_t QLAppExtension.configuration.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  v17[1] = a3;
  uint64_t v7 = *(void *)(a1 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v17 - v11;
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v13((char *)v17 - v11, v4, a1);
  unint64_t v14 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a1;
  *(void *)(v15 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v15 + v14, v12, a1);
  v13(v10, v4, a1);
  sub_218002F74((uint64_t)v10, a1, &v18);
  _OWORD v17[2] = v18;
  swift_getAssociatedTypeWitness();
  type metadata accessor for QLGlobalAppExtensionConfiguration();
  swift_getAssociatedConformanceWitness();
  swift_getWitnessTable();
  return sub_218037E84();
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_218032794()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 32))();
}

uint64_t sub_218032800@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 96);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 16))(a1, v4);
}

uint64_t sub_2180328A4(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v2 + 80) - 8) + 32))(v2 + *(void *)(*(void *)v2 + 96), a1);
  return v2;
}

uint64_t sub_218032938(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 80);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)v34 - v6;
  sub_218032800((uint64_t)v34 - v6);
  uint64_t v8 = *(void *)(v3 + 88);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 16))(v4, v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  objc_msgSend(a1, sel_setExportedObject_, v9);
  swift_unknownObjectRelease();
  uint64_t v10 = self;
  id v11 = objc_msgSend(v10, sel_interfaceWithProtocol_, &unk_26C9724B8);
  objc_msgSend(a1, sel_setExportedInterface_, v11);

  id v12 = objc_msgSend(v10, sel_interfaceWithProtocol_, &unk_26C95D0A0);
  objc_msgSend(a1, sel_setRemoteObjectInterface_, v12);

  objc_msgSend(a1, sel_resume);
  id v13 = objc_msgSend(a1, sel_exportedInterface);
  if (v13)
  {
    unint64_t v14 = v13;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BB9D70);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_218044630;
    uint64_t v16 = sub_217FF207C(0, &qword_267BB9D88);
    *(void *)(v15 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9D90);
    *(void *)(v15 + 32) = v16;
    uint64_t v17 = sub_217FF207C(0, (unint64_t *)&qword_267BBA148);
    *(void *)(v15 + 8_Block_object_dispose(&STACK[0x360], 8) = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA150);
    *(void *)(v15 + 64) = v17;
    id v18 = objc_allocWithZone(MEMORY[0x263EFFA08]);
    id v19 = (void *)sub_218038754();
    swift_bridgeObjectRelease();
    id v20 = objc_msgSend(v18, sel_initWithArray_, v19);

    uint64_t v35 = 0;
    uint64_t result = sub_2180388A4();
    if (!v35)
    {
      __break(1u);
      goto LABEL_12;
    }

    id v22 = (void *)sub_218038894();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_setClasses_forSelector_argumentIndex_ofReply_, v22, sel_openWithSessionUUID_items_selectedIndex_bundleID_configuration_completionHandler_, 1, 0);
  }
  id v23 = objc_msgSend(a1, sel_exportedInterface);
  if (v23)
  {
    uint64_t v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BB9D70);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_218044630;
    uint64_t v26 = sub_217FF207C(0, &qword_267BB9D88);
    *(void *)(v25 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB9D90);
    *(void *)(v25 + 32) = v26;
    uint64_t v27 = sub_217FF207C(0, (unint64_t *)&qword_267BBA148);
    *(void *)(v25 + 8_Block_object_dispose(&STACK[0x360], 8) = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBA150);
    *(void *)(v25 + 64) = v27;
    id v28 = objc_allocWithZone(MEMORY[0x263EFFA08]);
    uint64_t v29 = (void *)sub_218038754();
    swift_bridgeObjectRelease();
    id v30 = objc_msgSend(v28, sel_initWithArray_, v29);

    uint64_t v35 = 0;
    uint64_t result = sub_2180388A4();
    if (v35)
    {

      id v31 = (void *)sub_218038894();
      swift_bridgeObjectRelease();
      objc_msgSend(v24, sel_setClasses_forSelector_argumentIndex_ofReply_, v31, sel_updateContentsWithSessionUUID_items_selectedIndex_completionHandler_, 1, 0);

      goto LABEL_7;
    }
LABEL_12:
    __break(1u);
    return result;
  }
LABEL_7:
  id v32 = objc_msgSend(a1, sel_remoteObjectProxy);
  sub_2180389F4();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(qword_267BBAD58);
  if (swift_dynamicCast()) {
    uint64_t v33 = v34[1];
  }
  else {
    uint64_t v33 = 0;
  }
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v33, v4, v8);
  swift_endAccess();
  return 1;
}

uint64_t QuickLookPreviewConfiguration.deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 96));
  return v0;
}

uint64_t QuickLookPreviewConfiguration.__deallocating_deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 96));
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_218032FCC(void *a1)
{
  return 1;
}

uint64_t QuickLookPreviewAppExtension.configuration.getter(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for QuickLookPreviewConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, a1);
  return sub_2180328A4((uint64_t)v5);
}

uint64_t type metadata accessor for QuickLookPreviewConfiguration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t dispatch thunk of QLAppExtension.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

ValueMetadata *type metadata accessor for QLAppExtensionSceneBuilder()
{
  return &type metadata for QLAppExtensionSceneBuilder;
}

uint64_t sub_21803310C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for QuickLookPreviewConfiguration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for QuickLookPreviewConfiguration);
}

uint64_t dispatch thunk of QuickLookPreviewConfiguration.accept(connection:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of QuickLookPreviewAppExtension.protocolHandler.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of QuickLookPreviewAppExtension.hostProxy.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of QuickLookPreviewAppExtension.hostProxy.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of QuickLookPreviewAppExtension.hostProxy.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t sub_21803322C()
{
  type metadata accessor for QLAppExtensionSceneBuilder._QLAppExtensionScene();

  return swift_getWitnessTable();
}

uint64_t type metadata accessor for QLAppExtensionSceneBuilder._QLAppExtensionScene()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_218033294()
{
  unint64_t result = qword_267BBADE0;
  if (!qword_267BBADE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_267BBADE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBADE0);
  }
  return result;
}

void *sub_2180332F0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_218033320()
{
  return swift_release();
}

void *sub_218033328(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_218033364(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_218033398()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2180333DC(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + _Block_object_dispose(&STACK[0x360], 8) = result;
  return result;
}

uint64_t sub_218033418(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_218033428(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAE78);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_218033498(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAE78);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_218033500(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAE78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_218033568(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAE78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_2180335D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAE78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_218033638(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAE78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_2180336A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2180336B4);
}

uint64_t sub_2180336B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAE78);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_218033724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_218033738);
}

uint64_t sub_218033738(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAE78);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for QLHostDebugView()
{
  uint64_t result = qword_267BBAE80;
  if (!qword_267BBAE80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2180337F8()
{
  sub_218033884();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_218033884()
{
  if (!qword_267BBAE90)
  {
    type metadata accessor for QLHostRemoteViewModel();
    unint64_t v0 = sub_218038534();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BBAE90);
    }
  }
}

uint64_t sub_2180338DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2180338F8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2180372B8((unint64_t *)&qword_267BBA720, (void (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  *a2 = v4;
  a2[1] = v5;
  return sub_217FF2924(v4);
}

uint64_t sub_2180339A4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_217FF2924(v1);
  sub_2180372B8((unint64_t *)&qword_267BBA720, (void (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel);
  sub_218037E14();
  sub_217FF2964(v1);
  return swift_release();
}

uint64_t sub_218033A94()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218033B20;
  return sub_217FF37B0();
}

uint64_t sub_218033B20(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 32) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_218033C54, 0, 0);
  }
}

uint64_t sub_218033C54()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = swift_allocObject();
  v0[5] = v2;
  *(unsigned char *)(v2 + 16) = 0;
  uint64_t v3 = swift_task_alloc();
  v0[6] = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[7] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAF30);
  void *v4 = v0;
  v4[1] = sub_218033D78;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x8000000218052D80, sub_21803770C, v3, v5);
}

uint64_t sub_218033D78()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_218033F00;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_218033E94;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_218033E94()
{
  uint64_t v1 = (void *)v0[4];
  swift_release();

  uint64_t v2 = v0[2];
  uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(v2);
}

uint64_t sub_218033F00()
{
  uint64_t v1 = *(void **)(v0 + 32);
  swift_release();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_218033F74()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218034000;
  return sub_217FF3D78();
}

uint64_t sub_218034000(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 32) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_218034134, 0, 0);
  }
}

uint64_t sub_218034134()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = swift_allocObject();
  v0[5] = v2;
  *(unsigned char *)(v2 + 16) = 0;
  uint64_t v3 = swift_task_alloc();
  v0[6] = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[7] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAF70);
  void *v4 = v0;
  v4[1] = sub_218034258;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x8000000218052D80, sub_218037A60, v3, v5);
}

uint64_t sub_218034258()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_218037C0C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_218037BFC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_218034374(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_2180343DC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAF38);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (unsigned char *)(a3 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v12 + v11, v9, v6);
  aBlock[4] = sub_218037720;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_218034374;
  aBlock[3] = &block_descriptor_10;
  id v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v14 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v13);
  _Block_release(v13);
  sub_2180389F4();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAF30);
  if (swift_dynamicCast() && (uint64_t v15 = v20) != 0)
  {
    swift_beginAccess();
    if (*v10)
    {
      return swift_unknownObjectRelease();
    }
    else
    {
      swift_beginAccess();
      *uint64_t v10 = 1;
      uint64_t v19 = v15;
      return sub_2180387C4();
    }
  }
  else
  {
    uint64_t result = swift_beginAccess();
    if ((*v10 & 1) == 0)
    {
      swift_beginAccess();
      *uint64_t v10 = 1;
      sub_21803772C();
      uint64_t v17 = swift_allocError();
      unsigned char *v18 = 1;
      uint64_t v19 = v17;
      return sub_2180387B4();
    }
  }
  return result;
}

uint64_t sub_2180346BC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAF78);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (unsigned char *)(a3 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v12 + v11, v9, v6);
  aBlock[4] = sub_218037B3C;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_218034374;
  aBlock[3] = &block_descriptor_63;
  id v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v14 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v13);
  _Block_release(v13);
  sub_2180389F4();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAF70);
  if (swift_dynamicCast())
  {
    uint64_t v15 = v19[1];
    swift_beginAccess();
    if (*v10)
    {
      return swift_unknownObjectRelease();
    }
    else
    {
      swift_beginAccess();
      *uint64_t v10 = 1;
      v19[0] = v15;
      return sub_2180387C4();
    }
  }
  else
  {
    uint64_t result = swift_beginAccess();
    if ((*v10 & 1) == 0)
    {
      swift_beginAccess();
      *uint64_t v10 = 1;
      sub_21803772C();
      uint64_t v17 = swift_allocError();
      unsigned char *v18 = 1;
      v19[0] = v17;
      return sub_2180387B4();
    }
  }
  return result;
}

uint64_t sub_218034998(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = (unsigned char *)(a2 + 16);
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(a2 + 16) & 1) == 0)
  {
    swift_beginAccess();
    *uint64_t v7 = 1;
    id v9 = a1;
    __swift_instantiateConcreteTypeFromMangledName(a4);
    return sub_2180387B4();
  }
  return result;
}

uint64_t sub_218034A38@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2180372B8((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  *a2 = *(void *)(v3 + 40);
  return swift_retain();
}

uint64_t sub_218034AE4()
{
  return swift_release();
}

uint64_t sub_218034BC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAEA0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAEA8);
  uint64_t v8 = v7 - 8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v18 - v12;
  *(void *)uint64_t v6 = sub_2180382D4();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAEB0);
  sub_218034D94(a1, (uint64_t)&v6[*(int *)(v14 + 44)]);
  LOBYTE(a1) = sub_2180383E4();
  sub_217FF6F30((uint64_t)v6, (uint64_t)v11, &qword_267BBAEA0);
  uint64_t v15 = &v11[*(int *)(v8 + 44)];
  char *v15 = a1;
  *(_OWORD *)(v15 + _Block_object_dispose(&STACK[0x360], 8) = 0u;
  *(_OWORD *)(v15 + 24) = 0u;
  v15[40] = 1;
  sub_217FF6BD8((uint64_t)v6, &qword_267BBAEA0);
  sub_217FFC8F0((uint64_t)v11, (uint64_t)v13, &qword_267BBAEA8);
  sub_217FF6F30((uint64_t)v13, (uint64_t)v11, &qword_267BBAEA8);
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x360], 8) = 1;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAEB8);
  sub_217FF6F30((uint64_t)v11, a2 + *(int *)(v16 + 48), &qword_267BBAEA8);
  sub_217FF6BD8((uint64_t)v13, &qword_267BBAEA8);
  return sub_217FF6BD8((uint64_t)v11, &qword_267BBAEA8);
}

uint64_t sub_218034D94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v83 = a2;
  uint64_t v3 = type metadata accessor for QLHostDebugView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAEC0);
  uint64_t v95 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v79 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v75 = (char *)&v74 - v11;
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v74 - v12;
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAEC8);
  uint64_t v14 = MEMORY[0x270FA5388](v94);
  uint64_t v82 = (uint64_t)&v74 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v81 = (uint64_t)&v74 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v80 = (uint64_t)&v74 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v76 = (char *)&v74 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v78 = (uint64_t)&v74 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v74 = (char *)&v74 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v77 = (uint64_t)&v74 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  id v30 = (char *)&v74 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v93 = (uint64_t)&v74 - v31;
  sub_218037528(a1, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for QLHostDebugView);
  uint64_t v32 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v33 = (v32 + 16) & ~v32;
  uint64_t v91 = v32 | 7;
  uint64_t v92 = v33 + v5;
  uint64_t v34 = swift_allocObject();
  sub_2180370EC((uint64_t)v6, v34 + v33);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAED0);
  unint64_t v89 = sub_218037168();
  uint64_t v90 = v35;
  sub_2180384C4();
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAE78);
  sub_2180384F4();
  uint64_t v36 = v96;
  swift_getKeyPath();
  uint64_t v96 = v36;
  uint64_t v87 = sub_2180372B8((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v37 = *(void *)(v36 + 40);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  uint64_t v96 = v37;
  uint64_t v86 = sub_2180372B8((unint64_t *)&qword_267BBA720, (void (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v38 = *(void *)(v37 + 16);
  sub_217FF2924(v38);
  swift_release();
  if (v38) {
    sub_217FF2964(v38);
  }
  BOOL v39 = v38 != 0;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v41 = swift_allocObject();
  *(unsigned char *)(v41 + 16) = v39;
  uint64_t v42 = v95;
  char v85 = *(void (**)(char *, char *, uint64_t))(v95 + 16);
  v85(v30, v13, v7);
  uint64_t v43 = (uint64_t *)&v30[*(int *)(v94 + 36)];
  *uint64_t v43 = KeyPath;
  v43[1] = (uint64_t)sub_218037368;
  v43[2] = v41;
  uint64_t v44 = *(void (**)(char *, uint64_t))(v42 + 8);
  uint64_t v95 = v42 + 8;
  uint64_t v84 = v44;
  v44(v13, v7);
  sub_217FFC8F0((uint64_t)v30, v93, &qword_267BBAEC8);
  sub_218037528(a1, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for QLHostDebugView);
  uint64_t v45 = swift_allocObject();
  sub_2180370EC((uint64_t)v6, v45 + v33);
  uint64_t v46 = v75;
  sub_2180384C4();
  sub_2180384F4();
  uint64_t v47 = v96;
  swift_getKeyPath();
  uint64_t v96 = v47;
  sub_218037E24();
  swift_release();
  uint64_t v48 = *(void *)(v47 + 40);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  uint64_t v96 = v48;
  sub_218037E24();
  swift_release();
  uint64_t v49 = *(void *)(v48 + 16);
  sub_217FF2924(v49);
  swift_release();
  if (v49) {
    sub_217FF2964(v49);
  }
  BOOL v50 = v49 == 0;
  uint64_t v51 = swift_getKeyPath();
  uint64_t v52 = swift_allocObject();
  *(unsigned char *)(v52 + 16) = v50;
  uint64_t v53 = (uint64_t)v74;
  v85(v74, v46, v7);
  uint64_t v54 = (uint64_t *)(v53 + *(int *)(v94 + 36));
  *uint64_t v54 = v51;
  v54[1] = (uint64_t)sub_218037C08;
  v54[2] = v52;
  v84(v46, v7);
  uint64_t v55 = v77;
  sub_217FFC8F0(v53, v77, &qword_267BBAEC8);
  sub_218037528(a1, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for QLHostDebugView);
  uint64_t v56 = swift_allocObject();
  sub_2180370EC((uint64_t)v6, v56 + v33);
  uint64_t v57 = v79;
  sub_2180384C4();
  sub_2180384F4();
  uint64_t v58 = v96;
  swift_getKeyPath();
  uint64_t v96 = v58;
  sub_218037E24();
  swift_release();
  uint64_t v59 = *(void *)(v58 + 40);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  uint64_t v96 = v59;
  sub_218037E24();
  swift_release();
  uint64_t v60 = *(void *)(v59 + 16);
  sub_217FF2924(v60);
  swift_release();
  if (v60) {
    sub_217FF2964(v60);
  }
  BOOL v61 = v60 == 0;
  uint64_t v62 = swift_getKeyPath();
  uint64_t v63 = swift_allocObject();
  *(unsigned char *)(v63 + 16) = v61;
  uint64_t v64 = (uint64_t)v76;
  v85(v76, v57, v7);
  uint64_t v65 = (uint64_t *)(v64 + *(int *)(v94 + 36));
  *uint64_t v65 = v62;
  v65[1] = (uint64_t)sub_218037C08;
  v65[2] = v63;
  v84(v57, v7);
  uint64_t v66 = v78;
  sub_217FFC8F0(v64, v78, &qword_267BBAEC8);
  uint64_t v67 = v93;
  uint64_t v68 = v80;
  sub_217FF6F30(v93, v80, &qword_267BBAEC8);
  uint64_t v69 = v81;
  sub_217FF6F30(v55, v81, &qword_267BBAEC8);
  uint64_t v70 = v82;
  sub_217FF6F30(v66, v82, &qword_267BBAEC8);
  uint64_t v71 = v83;
  sub_217FF6F30(v68, v83, &qword_267BBAEC8);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAF10);
  sub_217FF6F30(v69, v71 + *(int *)(v72 + 48), &qword_267BBAEC8);
  sub_217FF6F30(v70, v71 + *(int *)(v72 + 64), &qword_267BBAEC8);
  sub_217FF6BD8(v66, &qword_267BBAEC8);
  sub_217FF6BD8(v55, &qword_267BBAEC8);
  sub_217FF6BD8(v67, &qword_267BBAEC8);
  sub_217FF6BD8(v70, &qword_267BBAEC8);
  sub_217FF6BD8(v69, &qword_267BBAEC8);
  return sub_217FF6BD8(v68, &qword_267BBAEC8);
}

uint64_t sub_2180357D8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for QLHostDebugView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_218038824();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_218037528(a1, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for QLHostDebugView);
  sub_2180387F4();
  uint64_t v10 = sub_2180387E4();
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  *(void *)(v12 + 16) = v10;
  *(void *)(v12 + 24) = v13;
  sub_2180370EC((uint64_t)v5, v12 + v11);
  sub_21800341C((uint64_t)v8, (uint64_t)&unk_267BBAF60, v12);
  return swift_release();
}

uint64_t sub_218035998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  sub_2180387F4();
  v4[4] = sub_2180387E4();
  uint64_t v6 = sub_2180387A4();
  v4[5] = v6;
  v4[6] = v5;
  return MEMORY[0x270FA2498](sub_218035A30, v6, v5);
}

uint64_t sub_218035A30()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAE78);
  sub_2180384F4();
  v0[7] = v0[2];
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_218035AE0;
  return sub_218017B64();
}

uint64_t sub_218035AE0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    uint64_t v5 = sub_218035C60;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    uint64_t v5 = sub_218035BFC;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_218035BFC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_218035C60()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_218035CD0@<X0>(uint64_t a1@<X8>)
{
  return sub_2180364D4(0xED00006E6F697373, 0x7269632E79616C70, 0xEB00000000656C63, a1);
}

uint64_t sub_218035D10(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for QLHostDebugView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218038804();
  uint64_t v9 = sub_218038824();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  sub_218037528(a1, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for QLHostDebugView);
  sub_2180387F4();
  uint64_t v10 = sub_2180387E4();
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  *(void *)(v12 + 16) = v10;
  *(void *)(v12 + 24) = v13;
  sub_2180370EC((uint64_t)v5, v12 + v11);
  sub_21801A818((uint64_t)v8, (uint64_t)&unk_267BBAF50, v12);
  return swift_release();
}

uint64_t sub_218035ED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  v4[4] = sub_2180387F4();
  v4[5] = sub_2180387E4();
  uint64_t v6 = sub_2180387A4();
  v4[6] = v6;
  v4[7] = v5;
  return MEMORY[0x270FA2498](sub_218035F74, v6, v5);
}

uint64_t sub_218035F74()
{
  v0[8] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAE78);
  sub_2180384F4();
  uint64_t v1 = v0[2];
  swift_getKeyPath();
  v0[2] = v1;
  v0[9] = sub_2180372B8((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 40);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  v0[2] = v2;
  v0[10] = sub_2180372B8((unint64_t *)&qword_267BBA720, (void (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 16);
  v0[11] = v3;
  v0[12] = *(void *)(v2 + 24);
  sub_217FF2924(v3);
  swift_release();
  if (v3)
  {
    v0[13] = sub_2180387E4();
    uint64_t v5 = sub_2180387A4();
    return MEMORY[0x270FA2498](sub_218036284, v5, v4);
  }
  else
  {
    swift_release();
    sub_2180384F4();
    uint64_t v6 = v0[2];
    swift_getKeyPath();
    v0[2] = v6;
    sub_218037E24();
    swift_release();
    uint64_t v7 = *(void *)(v6 + 40);
    swift_retain();
    swift_release();
    swift_getKeyPath();
    uint64_t v8 = (void *)swift_task_alloc();
    v8[3] = 0;
    v8[4] = 0;
    v8[2] = v7;
    v0[2] = v7;
    sub_218037E14();
    swift_release();
    swift_release();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
}

uint64_t sub_218036284()
{
  uint64_t v1 = v0[12];
  swift_release();
  __swift_project_boxed_opaque_existential_0((void *)(v1 + 24), *(void *)(v1 + 48));
  sub_218038944();
  objc_msgSend(*(id *)(v1 + 64), sel_invalidate);
  uint64_t v2 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = 0;
  swift_release();
  swift_release();

  uint64_t v3 = v0[6];
  uint64_t v4 = v0[7];
  return MEMORY[0x270FA2498](sub_218036334, v3, v4);
}

uint64_t sub_218036334()
{
  swift_release();
  sub_2180384F4();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_getKeyPath();
  *(void *)(v0 + 16) = v1;
  sub_218037E24();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 40);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  uint64_t v3 = (void *)swift_task_alloc();
  v3[3] = 0;
  v3[4] = 0;
  v3[2] = v2;
  *(void *)(v0 + 16) = v2;
  sub_218037E14();
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_218036498@<X0>(uint64_t a1@<X8>)
{
  return sub_2180364D4(0xEC0000006E6F6973, 0x7269632E706F7473, 0xEB00000000656C63, a1);
}

uint64_t sub_2180364D4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  v28[1] = a2;
  v28[2] = a3;
  v28[0] = a1;
  uint64_t v29 = a4;
  uint64_t v4 = sub_2180384D4();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_218038554();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAEF8);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAEE8);
  uint64_t v16 = v15 - 8;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2180382E4();
  sub_218038494();
  char v19 = sub_2180383E4();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v18, v14, v11);
  uint64_t v20 = &v18[*(int *)(v16 + 44)];
  *uint64_t v20 = v19;
  *(_OWORD *)(v20 + _Block_object_dispose(&STACK[0x360], 8) = 0u;
  *(_OWORD *)(v20 + 24) = 0u;
  v20[40] = 1;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_218038544();
  uint64_t v21 = *MEMORY[0x263F19860];
  uint64_t v22 = sub_2180382F4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 104))(v6, v21, v22);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAED0);
  uint64_t v24 = v29;
  uint64_t v25 = v29 + *(int *)(v23 + 36);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v25, v10, v7);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAF08);
  sub_218037528((uint64_t)v6, v25 + *(int *)(v26 + 52), MEMORY[0x263F1B7A0]);
  *(_WORD *)(v25 + *(int *)(v26 + 56)) = 256;
  sub_217FF6F30((uint64_t)v18, v24, &qword_267BBAEE8);
  sub_218037590((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return sub_217FF6BD8((uint64_t)v18, &qword_267BBAEE8);
}

uint64_t sub_218036834()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBA400);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAE78);
  sub_2180384F4();
  uint64_t v3 = v13;
  swift_getKeyPath();
  uint64_t v13 = v3;
  sub_2180372B8((unint64_t *)&qword_267BBA870, (void (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 40);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  uint64_t v13 = v4;
  sub_2180372B8((unint64_t *)&qword_267BBA720, (void (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel);
  sub_218037E24();
  swift_release();
  uint64_t v5 = *(void *)(v4 + 16);
  uint64_t v6 = *(void *)(v4 + 24);
  sub_217FF2924(v5);
  swift_release();
  if (v5)
  {
    uint64_t v7 = sub_218038824();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v2, 1, 1, v7);
    sub_2180387F4();
    swift_retain();
    swift_retain();
    uint64_t v8 = sub_2180387E4();
    uint64_t v9 = (void *)swift_allocObject();
    uint64_t v10 = MEMORY[0x263F8F500];
    v9[2] = v8;
    v9[3] = v10;
    v9[4] = v5;
    v9[5] = v6;
    sub_21800341C((uint64_t)v2, (uint64_t)&unk_267BBAF20, (uint64_t)v9);
    swift_release();
    swift_release();
    return swift_release();
  }
  else
  {
    uint64_t result = sub_218038B14();
    __break(1u);
  }
  return result;
}

uint64_t sub_218036AD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a5;
  v5[6] = sub_2180387F4();
  v5[7] = sub_2180387E4();
  uint64_t v8 = (uint64_t (*)(void))((char *)&dword_267BBAF28 + dword_267BBAF28);
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  v5[8] = v6;
  void *v6 = v5;
  v6[1] = sub_218036BA8;
  return v8();
}

uint64_t sub_218036BA8(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[2] = v2;
  v3[3] = a1;
  v3[4] = v1;
  v3[9] = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    uint64_t v4 = sub_2180387A4();
    uint64_t v6 = v5;
    uint64_t v7 = sub_218036FF8;
    uint64_t v8 = v4;
    uint64_t v9 = v6;
  }
  else
  {
    uint64_t v7 = sub_218036D0C;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_218036D0C()
{
  uint64_t v1 = v0[3];
  v0[10] = v1;
  uint64_t v2 = swift_task_alloc();
  v0[11] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[12] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_218036DF8;
  uint64_t v4 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2318](v3, 0, 0, 0x29286873617263, 0xE700000000000000, sub_2180376F4, v2, v4);
}

uint64_t sub_218036DF8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_218036F10, 0, 0);
}

uint64_t sub_218036F10()
{
  swift_unknownObjectRelease();
  uint64_t v1 = sub_2180387A4();
  return MEMORY[0x270FA2498](sub_218036F94, v1, v0);
}

uint64_t sub_218036F94()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_218036FF8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21803705C@<X0>(uint64_t a1@<X8>)
{
  return sub_2180364D4(0xEB00000000786570, 0x636F2E6B72616D78, 0xED00006E6F676174, a1);
}

uint64_t sub_21803709C@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_218038304();
  *(void *)(a1 + _Block_object_dispose(&STACK[0x360], 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAE98);
  return sub_218034BC4(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_2180370EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for QLHostDebugView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_218037150()
{
  return sub_2180374A4(sub_2180357D8);
}

unint64_t sub_218037168()
{
  unint64_t result = qword_267BBAED8;
  if (!qword_267BBAED8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBAED0);
    sub_218037208();
    sub_217FF8CEC(&qword_267BBAF00, &qword_267BBAF08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBAED8);
  }
  return result;
}

unint64_t sub_218037208()
{
  unint64_t result = qword_267BBAEE0;
  if (!qword_267BBAEE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBAEE8);
    sub_217FF8CEC(&qword_267BBAEF0, &qword_267BBAEF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBAEE0);
  }
  return result;
}

uint64_t sub_2180372B8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_218037300@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2180382B4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_218037330()
{
  return sub_2180382C4();
}

uint64_t sub_218037358()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_218037368(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_218037384()
{
  return sub_2180374A4(sub_218035D10);
}

uint64_t sub_21803739C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t objectdestroyTm_2()
{
  uint64_t v1 = *(void *)(type metadata accessor for QLHostDebugView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAE78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_21803748C()
{
  return sub_2180374A4((uint64_t (*)(uint64_t))sub_218036834);
}

uint64_t sub_2180374A4(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for QLHostDebugView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_218037518()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_218037528(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_218037590(uint64_t a1)
{
  uint64_t v2 = sub_2180384D4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2180375EC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_218037634(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_217FF1CC0;
  return sub_218036AD4(a1, v4, v5, v7, v6);
}

void sub_2180376F4(uint64_t a1)
{
  sub_217FF233C(a1, *(void **)(v1 + 16));
}

uint64_t sub_2180376FC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_21803770C(uint64_t a1)
{
  return sub_2180343DC(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_218037714()
{
  return objectdestroy_41Tm(&qword_267BBAF38);
}

uint64_t sub_218037720(void *a1)
{
  return sub_218037B48(a1, &qword_267BBAF38);
}

unint64_t sub_21803772C()
{
  unint64_t result = qword_267BBAF40;
  if (!qword_267BBAF40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267BBAF40);
  }
  return result;
}

uint64_t sub_218037784(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for QLHostDebugView() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_217FF1CC0;
  return sub_218035ED8(a1, v5, v6, v7);
}

uint64_t sub_218037870()
{
  return sub_2180165C8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t objectdestroy_44Tm()
{
  uint64_t v1 = *(void *)(type metadata accessor for QLHostDebugView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_unknownObjectRelease();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBAE78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_218037974(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for QLHostDebugView() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_217FF2264;
  return sub_218035998(a1, v5, v6, v7);
}

uint64_t sub_218037A60(uint64_t a1)
{
  return sub_2180346BC(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_218037A68()
{
  return objectdestroy_41Tm(&qword_267BBAF78);
}

uint64_t objectdestroy_41Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 24) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return MEMORY[0x270FA0238](v1, v6, v7);
}

uint64_t sub_218037B3C(void *a1)
{
  return sub_218037B48(a1, &qword_267BBAF78);
}

uint64_t sub_218037B48(void *a1, uint64_t *a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8);
  return sub_218034998(a1, *(void *)(v2 + 16), v2 + ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), a2);
}

uint64_t sub_218037BC0()
{
  return sub_217FF8CEC(&qword_267BBAF80, &qword_267BBAF88);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_218037CE4()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_218037CF4()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_218037D04()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_218037D14()
{
  return MEMORY[0x270EEFBC0]();
}

uint64_t sub_218037D24()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_218037D34()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_218037D44()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_218037D54()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_218037D64()
{
  return MEMORY[0x270EEFE50]();
}

uint64_t sub_218037D74()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_218037D84()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_218037D94()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_218037DA4()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_218037DB4()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_218037DC4()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_218037DD4()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_218037DE4()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_218037DF4()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_218037E04()
{
  return MEMORY[0x270FA11C0]();
}

uint64_t sub_218037E14()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_218037E24()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_218037E34()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_218037E44()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_218037E54()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_218037E64()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_218037E84()
{
  return MEMORY[0x270EEB968]();
}

uint64_t sub_218037E94()
{
  return MEMORY[0x270EEB978]();
}

uint64_t sub_218037EA4()
{
  return MEMORY[0x270EEB980]();
}

uint64_t sub_218037EB4()
{
  return MEMORY[0x270EEB988]();
}

uint64_t sub_218037EC4()
{
  return MEMORY[0x270EEB7E8]();
}

uint64_t sub_218037ED4()
{
  return MEMORY[0x270EEB7F8]();
}

uint64_t sub_218037EE4()
{
  return MEMORY[0x270EEB808]();
}

uint64_t sub_218037EF4()
{
  return MEMORY[0x270EEB810]();
}

uint64_t sub_218037F04()
{
  return MEMORY[0x270EEB818]();
}

uint64_t sub_218037F14()
{
  return MEMORY[0x270EEB830]();
}

uint64_t sub_218037F24()
{
  return MEMORY[0x270EEB840]();
}

uint64_t sub_218037F34()
{
  return MEMORY[0x270EEB848]();
}

uint64_t sub_218037F54()
{
  return MEMORY[0x270EEB858]();
}

uint64_t sub_218037F64()
{
  return MEMORY[0x270EEB870]();
}

uint64_t sub_218037F74()
{
  return MEMORY[0x270EEB8E8]();
}

uint64_t sub_218037F84()
{
  return MEMORY[0x270F80B58]();
}

uint64_t sub_218037F94()
{
  return MEMORY[0x270F80B68]();
}

uint64_t sub_218037FA4()
{
  return MEMORY[0x270F80B90]();
}

uint64_t sub_218037FB4()
{
  return MEMORY[0x270F80BA8]();
}

uint64_t sub_218037FC4()
{
  return MEMORY[0x270F80BB0]();
}

uint64_t sub_218037FD4()
{
  return MEMORY[0x270F80BC8]();
}

uint64_t sub_218037FE4()
{
  return MEMORY[0x270F80BF0]();
}

uint64_t sub_218037FF4()
{
  return MEMORY[0x270F80BF8]();
}

uint64_t sub_218038004()
{
  return MEMORY[0x270F80D68]();
}

uint64_t sub_218038014()
{
  return MEMORY[0x270F80D70]();
}

uint64_t sub_218038024()
{
  return MEMORY[0x270F80DC8]();
}

uint64_t sub_218038034()
{
  return MEMORY[0x270F80DD0]();
}

uint64_t sub_218038044()
{
  return MEMORY[0x270F80FA8]();
}

uint64_t sub_218038054()
{
  return MEMORY[0x270F80FC8]();
}

uint64_t sub_218038064()
{
  return MEMORY[0x270F80FD8]();
}

uint64_t sub_218038074()
{
  return MEMORY[0x270F80FE8]();
}

uint64_t sub_218038084()
{
  return MEMORY[0x270F80FF0]();
}

uint64_t sub_218038094()
{
  return MEMORY[0x270F81000]();
}

uint64_t sub_2180380A4()
{
  return MEMORY[0x270F81010]();
}

uint64_t sub_2180380B4()
{
  return MEMORY[0x270F81020]();
}

uint64_t sub_2180380C4()
{
  return MEMORY[0x270F81028]();
}

uint64_t sub_2180380D4()
{
  return MEMORY[0x270F811B8]();
}

uint64_t sub_2180380E4()
{
  return MEMORY[0x270F811E8]();
}

uint64_t sub_2180380F4()
{
  return MEMORY[0x270F81300]();
}

uint64_t sub_218038104()
{
  return MEMORY[0x270F813C0]();
}

uint64_t sub_218038114()
{
  return MEMORY[0x270F81410]();
}

uint64_t sub_218038124()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_218038134()
{
  return MEMORY[0x270FA1778]();
}

uint64_t sub_218038144()
{
  return MEMORY[0x270FA17B8]();
}

uint64_t sub_218038154()
{
  return MEMORY[0x270FA17C8]();
}

uint64_t sub_218038164()
{
  return MEMORY[0x270FA1868]();
}

uint64_t sub_218038174()
{
  return MEMORY[0x270FA18E0]();
}

uint64_t sub_218038184()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_218038194()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_2180381A4()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_2180381B4()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2180381C4()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2180381D4()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2180381E4()
{
  return MEMORY[0x270EFEF50]();
}

uint64_t sub_2180381F4()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_218038204()
{
  return MEMORY[0x270EFFD88]();
}

uint64_t sub_218038214()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_218038224()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_218038234()
{
  return MEMORY[0x270F008E8]();
}

uint64_t sub_218038244()
{
  return MEMORY[0x270F008F0]();
}

uint64_t sub_218038254()
{
  return MEMORY[0x270F009D0]();
}

uint64_t sub_218038264()
{
  return MEMORY[0x270F009D8]();
}

uint64_t sub_218038274()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_218038284()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_218038294()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_2180382A4()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_2180382B4()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_2180382C4()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_2180382D4()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_2180382E4()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_2180382F4()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_218038304()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_218038314()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_218038324()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_218038334()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_218038344()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_218038354()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_218038374()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_218038384()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_218038394()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_2180383B4()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_2180383C4()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_2180383D4()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_2180383E4()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2180383F4()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_218038404()
{
  return MEMORY[0x270F02DA8]();
}

uint64_t sub_218038414()
{
  return MEMORY[0x270F02FE8]();
}

uint64_t sub_218038424()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_218038434()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_218038444()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_218038454()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_218038464()
{
  return MEMORY[0x270F04068]();
}

uint64_t sub_218038474()
{
  return MEMORY[0x270F04408]();
}

uint64_t sub_218038484()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_218038494()
{
  return MEMORY[0x270F04760]();
}

uint64_t sub_2180384A4()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_2180384B4()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_2180384C4()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_2180384D4()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_2180384E4()
{
  return MEMORY[0x270F04DE8]();
}

uint64_t sub_2180384F4()
{
  return MEMORY[0x270F04DF0]();
}

uint64_t sub_218038504()
{
  return MEMORY[0x270F04E00]();
}

uint64_t sub_218038524()
{
  return MEMORY[0x270F04E20]();
}

uint64_t sub_218038534()
{
  return MEMORY[0x270F04E38]();
}

uint64_t sub_218038544()
{
  return MEMORY[0x270F04F98]();
}

uint64_t sub_218038554()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_218038564()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_218038574()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_218038584()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_218038594()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2180385A4()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2180385B4()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2180385C4()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2180385D4()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2180385E4()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2180385F4()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_218038604()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_218038614()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_218038624()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_218038634()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_218038644()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_218038654()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_218038664()
{
  return MEMORY[0x270EF1AC0]();
}

uint64_t sub_218038674()
{
  return MEMORY[0x270EF1AC8]();
}

uint64_t sub_218038684()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_218038694()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2180386A4()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2180386B4()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2180386C4()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2180386D4()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_2180386E4()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2180386F4()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_218038704()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_218038724()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_218038734()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_218038744()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_218038754()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_218038764()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_218038774()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_218038784()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_218038794()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2180387A4()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2180387B4()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2180387C4()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2180387E4()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2180387F4()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_218038804()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_218038814()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_218038824()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_218038834()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t sub_218038844()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_218038854()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_218038864()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t sub_218038874()
{
  return MEMORY[0x270FA1F88]();
}

uint64_t sub_218038884()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_218038894()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_2180388A4()
{
  return MEMORY[0x270EF1CA8]();
}

uint64_t sub_2180388B4()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_2180388C4()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_2180388D4()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2180388E4()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2180388F4()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_218038904()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_218038914()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_218038924()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_218038934()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_218038944()
{
  return MEMORY[0x270EEBA10]();
}

uint64_t sub_218038954()
{
  return MEMORY[0x270EEBA18]();
}

uint64_t sub_218038964()
{
  return MEMORY[0x270EEBA20]();
}

uint64_t sub_218038974()
{
  return MEMORY[0x270EEBA28]();
}

uint64_t sub_218038984()
{
  return MEMORY[0x270EEBA30]();
}

uint64_t sub_2180389A4()
{
  return MEMORY[0x270EEBA40]();
}

uint64_t sub_2180389B4()
{
  return MEMORY[0x270EEBA50]();
}

uint64_t sub_2180389C4()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2180389D4()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2180389E4()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2180389F4()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_218038A04()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_218038A14()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_218038A24()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_218038A34()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_218038A44()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_218038A54()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_218038A64()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_218038A74()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_218038A84()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_218038A94()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_218038AA4()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_218038AB4()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_218038AC4()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_218038AD4()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_218038AE4()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_218038AF4()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_218038B04()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_218038B14()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_218038B24()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_218038B34()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_218038B44()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_218038B54()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_218038B64()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_218038B84()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_218038BA4()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_218038BB4()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_218038BD4()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_218038BE4()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_218038BF4()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_218038C04()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_218038C14()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_218038C24()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_218038C34()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_218038C44()
{
  return MEMORY[0x270F9FC90]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x270EFB7B0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE5060](*(void *)&encoding);
}

CFStringEncoding CFStringConvertNSStringEncodingToEncoding(unint64_t encoding)
{
  return MEMORY[0x270EE5078](encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x270EE5970](t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x270EE5980](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF4FF8](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5048](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x270EF5068](isrc);
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return (CGPDFDocumentRef)MEMORY[0x270EE6B90](provider);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x270EE6C00](document, pageNumber);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
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

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x270EE7998](desc);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE7A08](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x270EE7A20](theBuffer);
}

OSStatus CMFormatDescriptionCreate(CFAllocatorRef allocator, CMMediaType mediaType, FourCharCode mediaSubType, CFDictionaryRef extensions, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7AD8](allocator, *(void *)&mediaType, *(void *)&mediaSubType, extensions, formatDescriptionOut);
}

OSStatus CMSampleBufferCreateReady(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BF0](allocator, dataBuffer, formatDescription, numSamples, numSampleTimingEntries, sampleTimingArray, numSampleSizeEntries, sampleSizeArray);
}

OSStatus CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(CMSampleBufferRef sbuf, size_t *bufferListSizeNeededOut, AudioBufferList *bufferListOut, size_t bufferListSize, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE7C08](sbuf, bufferListSizeNeededOut, bufferListOut, bufferListSize, blockBufferStructureAllocator, blockBufferBlockAllocator, *(void *)&flags, blockBufferOut);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C28](retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x270EE7C30](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C78](retstr, sbuf);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
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

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x270EE7E68](retstr, time, multiplier);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x270EE7E80](range, time);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x270EE7EF8](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7F08](retstr, lhs, rhs);
}

uint64_t FPExtendBookmarkForDocumentURL()
{
  return MEMORY[0x270EEBAA8]();
}

uint64_t FPURLMightBeInFileProvider()
{
  return MEMORY[0x270EEBB78]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x270EF2BF8]();
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x270F82BB8](transform);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F82BC0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F82BD0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NSStringFromQLNetworkState()
{
  return MEMORY[0x270F58CF8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t QLAdaptSizeToRect()
{
  return MEMORY[0x270F58CC8]();
}

uint64_t QLCGSizeFromQLItemThumbnailSize()
{
  return MEMORY[0x270F58D00]();
}

uint64_t QLFrameworkBundle()
{
  return MEMORY[0x270F58CD0]();
}

uint64_t QLImageWithSizeShouldNotBeScaled()
{
  return MEMORY[0x270F58D08]();
}

uint64_t QLLocalizedDictionaryString()
{
  return MEMORY[0x270F58D10]();
}

uint64_t QLLocalizedString()
{
  return MEMORY[0x270F58D18]();
}

uint64_t QLLocalizedStringFromTable()
{
  return MEMORY[0x270F58D20]();
}

uint64_t QLLocalizedStringWithDefaultValue()
{
  return MEMORY[0x270F58D28]();
}

uint64_t QLPreviewCopyEmbeddedPDF()
{
  return MEMORY[0x270F58CE0]();
}

uint64_t QLRunInBackgroundThread()
{
  return MEMORY[0x270F58D30]();
}

uint64_t QLRunInMainThread()
{
  return MEMORY[0x270F58D38]();
}

uint64_t QLRunInMainThreadSync()
{
  return MEMORY[0x270F58D40]();
}

uint64_t QLSInitLogging()
{
  return MEMORY[0x270F58CE8]();
}

uint64_t QLScaledPlatformImageFromImageSource()
{
  return MEMORY[0x270F58CF0]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F82C48]();
}

void UIGraphicsBeginPDFContextToData(NSMutableData *data, CGRect bounds, NSDictionary *documentInfo)
{
}

void UIGraphicsBeginPDFPage(void)
{
}

void UIGraphicsEndPDFContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x270F82E78]();
}

void UIRectFill(CGRect rect)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x270EE5718]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x270EE5750]();
}

uint64_t _CFURLIsItemPromiseAtURL()
{
  return MEMORY[0x270EE5768]();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x270EE5778]();
}

uint64_t _CFURLPromiseSetPhysicalURL()
{
  return MEMORY[0x270EE5780]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

uint64_t _QLContentTypeConformsToContentTypeInSet()
{
  return MEMORY[0x270F58D48]();
}

uint64_t _UIAccessibilityZoomTouchEnabled()
{
  return MEMORY[0x270F82F58]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x270F82F60]();
}

uint64_t _UIBarsDesktopNavigationBarEnabled()
{
  return MEMORY[0x270F82F70]();
}

uint64_t _UIStringFromWhitePointAdaptivityStyle()
{
  return MEMORY[0x270F83008]();
}

uint64_t _UIUpdateRequestActivate()
{
  return MEMORY[0x270F83020]();
}

uint64_t _UIUpdateRequestDeactivate()
{
  return MEMORY[0x270F83028]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x270F98178](atoken);
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
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
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t PXAssetBadgeInfoCreateWithBadges_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUICore)) {
    dlopenHelper_PhotosUICore(a1);
  }
  return MEMORY[0x270F53CC0]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_DataDetectorsUI(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_PhotosUI(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_PhotosFormats(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_PhotosUIPrivate(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_Photos(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_TelephonyUtilities(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_ScreenTimeUI(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_PhotosUICore(double a1)
{
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___STBlockingViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_ScreenTimeUI)) {
    return dlopenHelper_ScreenTimeUI(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PUVideoComplementItemSource(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUIPrivate)) {
    return dlopenHelper_PhotosUIPrivate(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PUUISaveToCameraRollActivity(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUIPrivate)) {
    return dlopenHelper_PhotosUIPrivate(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___TUDialRequest(double result)
{
  if (!atomic_load(&dlopenHelperFlag_TelephonyUtilities)) {
    return dlopenHelper_TelephonyUtilities(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PHLivePhoto(double result)
{
  if (!atomic_load(&dlopenHelperFlag_Photos)) {
    return dlopenHelper_Photos(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PFVideoComplement(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosFormats)) {
    return dlopenHelper_PhotosFormats(result);
  }
  return result;
}

void gotLoadHelper_x24__OBJC_CLASS___PHLivePhoto(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_Photos)) {
    dlopenHelper_Photos(a1);
  }
}

double gotLoadHelper_x8__OBJC_CLASS___PFImageMetadata(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosFormats)) {
    return dlopenHelper_PhotosFormats(result);
  }
  return result;
}

void gotLoadHelper_x23__OBJC_CLASS___PHLivePhotoView(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUI)) {
    dlopenHelper_PhotosUI(a1);
  }
}

double gotLoadHelper_x8__DDDetectionControllerWillPresentActionNotification(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DataDetectorsUI)) {
    return dlopenHelper_DataDetectorsUI(result);
  }
  return result;
}

double gotLoadHelper_x8__DDDetectionControllerDidDismissActionNotification(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DataDetectorsUI)) {
    return dlopenHelper_DataDetectorsUI(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PHVideoScrubberView(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUIPrivate)) {
    return dlopenHelper_PhotosUIPrivate(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PHPlaceholderView(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUIPrivate)) {
    return dlopenHelper_PhotosUIPrivate(result);
  }
  return result;
}

double gotLoadHelper_x8__PXAssetBadgeInfoNull(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUICore)) {
    return dlopenHelper_PhotosUICore(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PXUIAssetBadgeView(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUICore)) {
    return dlopenHelper_PhotosUICore(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PFMetadata(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosFormats)) {
    return dlopenHelper_PhotosFormats(result);
  }
  return result;
}

void gotLoadHelper_x20__OBJC_CLASS___PHPhotoLibrary(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_Photos)) {
    dlopenHelper_Photos(a1);
  }
}

double gotLoadHelper_x8__OBJC_CLASS___PHAssetCreationRequest(double result)
{
  if (!atomic_load(&dlopenHelperFlag_Photos)) {
    return dlopenHelper_Photos(result);
  }
  return result;
}