BOOL itk_isiPad()
{
  void *v0;
  BOOL v1;

  v0 = [MEMORY[0x263F82670] currentDevice];
  v1 = [v0 userInterfaceIdiom] == 1;

  return v1;
}

BOOL itk_isiPhone()
{
  v0 = [MEMORY[0x263F82670] currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 0;

  return v1;
}

uint64_t ITKMNearlyEqualQuads(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  [v3 topLeft];
  [v4 topLeft];
  if (ITKNearlyEqualPoints()
    && ([v3 topRight], objc_msgSend(v4, "topRight"), ITKNearlyEqualPoints())
    && ([v3 bottomRight], objc_msgSend(v4, "bottomRight"), ITKNearlyEqualPoints()))
  {
    [v3 bottomLeft];
    [v4 bottomLeft];
    uint64_t v5 = ITKNearlyEqualPoints();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

double ITKMultiplyQuadSideLengthScaler(double a1, double a2, double a3, double a4, double a5)
{
  return a1 * a5;
}

double ITKMinimumQuadSideLength(double result, double a2, double a3, double a4)
{
  if (a3 >= a4) {
    a3 = a4;
  }
  if (a3 < result) {
    result = a3;
  }
  if (result >= a2) {
    return a2;
  }
  return result;
}

double computeCornerMatrix@<D0>(double *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  double v6 = a1[2];
  double v7 = a1[3];
  double v9 = a1[4];
  double v8 = a1[5];
  double v10 = a1[6];
  double v11 = a1[7];
  double v12 = *a1;
  double v13 = a1[1];
  double v14 = v9 + *a1 - v6 - v10;
  double v15 = v8 + v13 - v7 - v11;
  if (v14 == 0.0 && v15 == 0.0)
  {
    double v16 = v6 - v12;
    double v17 = v9 - v6;
    double v18 = v7 - v13;
    double v19 = v8 - v7;
    double v20 = 0.0;
    double v21 = 0.0;
  }
  else
  {
    double v22 = v10 - v9;
    double v23 = v7 - v8;
    double v24 = v6 - v9;
    double v25 = v24 * (v11 - v8) - (v7 - v8) * v22;
    double v20 = (v14 * (v11 - v8) - v15 * v22) / v25;
    double v21 = (v24 * v15 - v23 * v14) / v25;
    double v16 = v6 - v12 + v20 * v6;
    double v18 = v7 - v13 + v20 * v7;
    double v17 = v10 - v12 + v21 * v10;
    double v19 = v11 - v13 + v21 * v11;
  }
  double v26 = 1.0 / a3;
  double v27 = 1.0 / a4;
  *(double *)a2 = v26 * v16;
  *(double *)(a2 + 8) = v26 * v18;
  *(void *)(a2 + 16) = 0;
  *(double *)(a2 + 24) = v26 * v20;
  *(double *)(a2 + 32) = v27 * v17;
  *(double *)(a2 + 40) = v27 * v19;
  *(void *)(a2 + 48) = 0;
  *(double *)(a2 + 56) = v27 * v21;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(_OWORD *)(a2 + 80) = xmmword_252AA0300;
  *(void *)(a2 + 112) = 0;
  *(double *)(a2 + 96) = v12 + a6 * v17 + a5 * v16;
  *(double *)(a2 + 104) = v13 + a6 * v19 + a5 * v18;
  double result = a6 * v21 + a5 * v20 + 1.0;
  *(double *)(a2 + 120) = result;
  return result;
}

void sub_252A80194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_252A8021C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_252A80378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_252A8050C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void sub_252A80748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_252A80890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_252A809E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_252A80C90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_252A80E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_252A811BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_252A8123C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_252A812BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_252A815E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void **a28)
{
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a28);
  a28 = (void **)(v30 - 72);
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a28);

  _Unwind_Resume(a1);
}

void ClipperLib::Clipper::~Clipper(ClipperLib::Clipper *this)
{
  v2 = off_2702F8ED8;
  *(void *)((char *)this + *(v3 - 3)) = v2;
  std::__list_imp<long long>::clear((void *)this + 11);
  id v4 = (void *)*((void *)this + 7);
  if (v4)
  {
    *((void *)this + 8) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 4);
  if (v5)
  {
    *((void *)this + 5) = v5;
    operator delete(v5);
  }
  double v6 = (void *)*((void *)this + 1);
  if (v6)
  {
    *((void *)this + 2) = v6;
    operator delete(v6);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::Clipper *)((char *)this + 144));
}

{
  ClipperLib::ClipperBase *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  *(void *)this = &unk_2702F8E50;
  v2 = (ClipperLib::Clipper *)((char *)this + 144);
  *((void *)this + 18) = &unk_2702F8E98;
  std::__list_imp<long long>::clear((void *)this + 11);
  id v3 = (void *)*((void *)this + 7);
  if (v3)
  {
    *((void *)this + 8) = v3;
    operator delete(v3);
  }
  id v4 = (void *)*((void *)this + 4);
  if (v4)
  {
    *((void *)this + 5) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 1);
  if (v5)
  {
    *((void *)this + 2) = v5;
    operator delete(v5);
  }
  ClipperLib::ClipperBase::~ClipperBase(v2);
  JUMPOUT(0x2533C7A10);
}

void sub_252A818A0(_Unwind_Exception *exception_object)
{
}

void sub_252A81C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,void **a54)
{
  ClipperLib::ClipperOffset::~ClipperOffset((ClipperLib::ClipperOffset *)&a16);
  _Block_object_dispose(&a54, 8);
  ClipperLib::Clipper::~Clipper(v55);
  a54 = (void **)(v58 - 152);
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a54);

  _Unwind_Resume(a1);
}

void sub_252A81D24()
{
}

void sub_252A81D74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__16(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2 + 48;
  ClipperLib::ClipperBase::ClipperBase((ClipperLib::ClipperBase *)(a1 + 192), (const ClipperLib::ClipperBase *)(a2 + 48 + *(void *)(*(void *)(a2 + 48) - 24)));
  *(void *)(a1 + 48) = &unk_2702F8E50;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 192) = &unk_2702F8E98;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(v4 + 8);
  *(void *)(a1 + 72) = *(void *)(v4 + 24);
  *(void *)(v4 + 8) = 0;
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(v4 + 32);
  *(void *)(a1 + 96) = *(void *)(v4 + 48);
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 40) = 0;
  *(void *)(v4 + 48) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(v4 + 56);
  *(void *)(a1 + 120) = *(void *)(v4 + 72);
  *(void *)(v4 + 64) = 0;
  *(void *)(v4 + 72) = 0;
  *(void *)(v4 + 56) = 0;
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(v4 + 80);
  *(void *)(a1 + 136) = a1 + 136;
  *(void *)(a1 + 144) = a1 + 136;
  *(void *)(a1 + 152) = 0;
  std::list<long long>::splice(a1 + 136, (uint64_t *)(a1 + 136), (void *)(v4 + 88));
  __n128 result = *(__n128 *)(a2 + 160);
  long long v6 = *(_OWORD *)(a2 + 176);
  *(__n128 *)(a1 + 160) = result;
  *(_OWORD *)(a1 + 176) = v6;
  return result;
}

void __Block_byref_object_dispose__17(void *a1)
{
  v2 = off_2702F8ED8;
  *(void *)((char *)a1 + *(v3 - 3) + 48) = v2;
  std::__list_imp<long long>::clear(a1 + 17);
  uint64_t v4 = (void *)a1[13];
  if (v4)
  {
    a1[14] = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)a1[10];
  if (v5)
  {
    a1[11] = v5;
    operator delete(v5);
  }
  long long v6 = (void *)a1[7];
  if (v6)
  {
    a1[8] = v6;
    operator delete(v6);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)(a1 + 24));
}

void sub_252A8203C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_252A82148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_252A82238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252A8267C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL ITKArcIsClockwiseForAngles(double a1, double a2)
{
  ITKNormalizeAngleInRadians();
  double v3 = v2;
  ITKNormalizeAngleInRadians();
  return v3 >= v4;
}

void sub_252A828EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_252A82AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  v31 = v30;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

void sub_252A82C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_252A82D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_252A82F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_252A830C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_252A836BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,uint64_t a21,uint64_t a22,void **a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  v67 = v64;

  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a23);
  a23 = (void **)&a59;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a23);

  a23 = (void **)&STACK[0x220];
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a23);
  _Block_object_dispose(&STACK[0x238], 8);
  ClipperLib::ClipperOffset::~ClipperOffset(v62);
  _Block_object_dispose(&STACK[0x370], 8);
  _Block_object_dispose(&STACK[0x390], 8);
  ClipperLib::ClipperOffset::~ClipperOffset(v60);

  _Unwind_Resume(a1);
}

ClipperLib::ClipperOffset *__Block_byref_object_copy__25(uint64_t a1, uint64_t a2)
{
  return ClipperLib::ClipperOffset::ClipperOffset((ClipperLib::ClipperOffset *)(a1 + 48), (const ClipperLib::ClipperOffset *)(a2 + 48));
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
}

void sub_252A83850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_252A83968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_252A83AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v11;

  _Unwind_Resume(a1);
}

void sub_252A83C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_252A83D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_252A83F10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  double v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100]((uint64_t *)v2);
    double v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      long long v6 = *(void **)(v4 - 24);
      v4 -= 24;
      uint64_t v5 = v6;
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

void *std::__list_imp<long long>::clear(void *result)
{
  if (result[2])
  {
    BOOL v1 = result;
    __n128 result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        uint64_t v4 = (void *)result[1];
        operator delete(result);
        __n128 result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void *std::vector<std::vector<ClipperLib::IntPoint>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::vector<ClipperLib::IntPoint>>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    size_t v5 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_252A84100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

char *std::vector<std::vector<ClipperLib::IntPoint>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26538DE38, MEMORY[0x263F8C060]);
}

void sub_252A84210(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  BOOL v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

ClipperLib::ClipperBase *ClipperLib::ClipperBase::ClipperBase(ClipperLib::ClipperBase *this, const ClipperLib::ClipperBase *a2)
{
  uint64_t v4 = *((void *)a2 + 1);
  *(void *)this = &unk_2702F8DF8;
  *((void *)this + 1) = v4;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  std::vector<ClipperLib::LocalMinimum>::__init_with_size[abi:ne180100]<ClipperLib::LocalMinimum*,ClipperLib::LocalMinimum*>((void *)this + 2, *((const void **)a2 + 2), *((void *)a2 + 3), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 3) - *((void *)a2 + 2)) >> 3));
  char v5 = *((unsigned char *)a2 + 40);
  *((void *)this + 6) = 0;
  *((unsigned char *)this + 40) = v5;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  std::vector<ClipperLib::TEdge *>::__init_with_size[abi:ne180100]<ClipperLib::TEdge **,ClipperLib::TEdge **>((void *)this + 6, *((const void **)a2 + 6), *((void *)a2 + 7), (uint64_t)(*((void *)a2 + 7) - *((void *)a2 + 6)) >> 3);
  __int16 v6 = *((_WORD *)a2 + 36);
  *((void *)this + 10) = 0;
  *((_WORD *)this + 36) = v6;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  std::vector<ClipperLib::OutRec *>::__init_with_size[abi:ne180100]<ClipperLib::OutRec **,ClipperLib::OutRec **>((void *)this + 10, *((const void **)a2 + 10), *((void *)a2 + 11), (uint64_t)(*((void *)a2 + 11) - *((void *)a2 + 10)) >> 3);
  uint64_t v7 = *((void *)a2 + 13);
  *((void *)this + 14) = 0;
  *((void *)this + 13) = v7;
  *((void *)this + 15) = 0;
  *((void *)this + 16) = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>((void *)this + 14, *((const void **)a2 + 14), *((void *)a2 + 15), (uint64_t)(*((void *)a2 + 15) - *((void *)a2 + 14)) >> 3);
  return this;
}

void sub_252A84388(_Unwind_Exception *exception_object)
{
  __int16 v6 = *v4;
  if (*v4)
  {
    v1[11] = v6;
    operator delete(v6);
  }
  uint64_t v7 = *v3;
  if (*v3)
  {
    v1[7] = v7;
    operator delete(v7);
  }
  double v8 = *v2;
  if (*v2)
  {
    v1[3] = v8;
    operator delete(v8);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<ClipperLib::LocalMinimum>::__init_with_size[abi:ne180100]<ClipperLib::LocalMinimum*,ClipperLib::LocalMinimum*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    __int16 v6 = result;
    __n128 result = std::vector<std::vector<ClipperLib::IntPoint>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_252A84434(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<ClipperLib::TEdge *>::__init_with_size[abi:ne180100]<ClipperLib::TEdge **,ClipperLib::TEdge **>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    __int16 v6 = result;
    __n128 result = std::vector<ClipperLib::TEdge *>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_252A844B0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<ClipperLib::TEdge *>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void *std::vector<ClipperLib::OutRec *>::__init_with_size[abi:ne180100]<ClipperLib::OutRec **,ClipperLib::OutRec **>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    __int16 v6 = result;
    __n128 result = std::vector<ClipperLib::TEdge *>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_252A845A8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    __int16 v6 = result;
    __n128 result = std::vector<ClipperLib::TEdge *>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_252A84624(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::list<long long>::splice(uint64_t result, uint64_t *a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (v3)
  {
    uint64_t v5 = *a3;
    uint64_t v4 = (uint64_t *)a3[1];
    uint64_t v6 = *v4;
    *(void *)(v6 + 8) = *(void *)(*a3 + 8);
    **(void **)(v5 + 8) = v6;
    uint64_t v7 = *a2;
    *(void *)(v7 + 8) = v4;
    *uint64_t v4 = v7;
    *a2 = v5;
    *(void *)(v5 + 8) = a2;
    *(void *)(result + 16) += v3;
    a3[2] = 0;
  }
  return result;
}

ClipperLib::ClipperOffset *ClipperLib::ClipperOffset::ClipperOffset(ClipperLib::ClipperOffset *this, const ClipperLib::ClipperOffset *a2)
{
  *(_OWORD *)this = *(_OWORD *)a2;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  std::vector<std::vector<ClipperLib::IntPoint>>::__init_with_size[abi:ne180100]<std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>((void *)this + 2, *((void *)a2 + 2), *((void *)a2 + 3), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 3) - *((void *)a2 + 2)) >> 3));
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>((void *)this + 5, *((const void **)a2 + 5), *((void *)a2 + 6), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 6) - *((void *)a2 + 5)) >> 3));
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>((void *)this + 8, *((const void **)a2 + 8), *((void *)a2 + 9), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 9) - *((void *)a2 + 8)) >> 3));
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = 0;
  std::vector<ClipperLib::DoublePoint>::__init_with_size[abi:ne180100]<ClipperLib::DoublePoint*,ClipperLib::DoublePoint*>((void *)this + 11, *((const void **)a2 + 11), *((void *)a2 + 12), (uint64_t)(*((void *)a2 + 12) - *((void *)a2 + 11)) >> 4);
  long long v4 = *((_OWORD *)a2 + 9);
  long long v5 = *((_OWORD *)a2 + 10);
  uint64_t v6 = *((void *)a2 + 22);
  long long v8 = *((_OWORD *)a2 + 7);
  long long v7 = *((_OWORD *)a2 + 8);
  *((void *)this + 24) = 0;
  *((_OWORD *)this + 9) = v4;
  *((_OWORD *)this + 10) = v5;
  *((_OWORD *)this + 7) = v8;
  *((_OWORD *)this + 8) = v7;
  *((void *)this + 22) = v6;
  *((void *)this + 23) = &unk_2702F8D88;
  *((void *)this + 25) = 0;
  *((void *)this + 26) = 0;
  std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>((void *)this + 24, *((const void **)a2 + 24), *((void *)a2 + 25), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 25) - *((void *)a2 + 24)) >> 3));
  *((void *)this + 27) = 0;
  *((void *)this + 28) = 0;
  *((void *)this + 29) = 0;
  std::vector<ClipperLib::PolyNode *>::__init_with_size[abi:ne180100]<ClipperLib::PolyNode **,ClipperLib::PolyNode **>((void *)this + 27, *((const void **)a2 + 27), *((void *)a2 + 28), (uint64_t)(*((void *)a2 + 28) - *((void *)a2 + 27)) >> 3);
  long long v9 = *((_OWORD *)a2 + 15);
  *((void *)this + 32) = *((void *)a2 + 32);
  *((_OWORD *)this + 15) = v9;
  return this;
}

void sub_252A847FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  long long v8 = *v6;
  if (*v6)
  {
    v2[25] = v8;
    operator delete(v8);
  }
  long long v9 = *v5;
  if (*v5)
  {
    v2[12] = v9;
    operator delete(v9);
  }
  double v10 = *v4;
  if (*v4)
  {
    v2[9] = v10;
    operator delete(v10);
  }
  uint64_t v11 = *v3;
  if (*v3)
  {
    v2[6] = v11;
    operator delete(v11);
  }
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void *std::vector<std::vector<ClipperLib::IntPoint>>::__init_with_size[abi:ne180100]<std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::vector<ClipperLib::IntPoint>>::__vallocate[abi:ne180100](result, a4);
    __n128 result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_252A848DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  long long v4 = a4;
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
      *long long v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v4, *(const void **)v6, *(void *)(v6 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v6 + 8) - *(void *)v6) >> 3));
      long long v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_252A849A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  if (v1 != v2)
  {
    uint64_t v3 = **(void **)(a1 + 16);
    do
    {
      long long v5 = *(void **)(v3 - 24);
      v3 -= 24;
      long long v4 = v5;
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

void *std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<std::vector<ClipperLib::IntPoint>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_252A84AA4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<ClipperLib::DoublePoint>::__init_with_size[abi:ne180100]<ClipperLib::DoublePoint*,ClipperLib::DoublePoint*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<ClipperLib::DoublePoint>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_252A84B20(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<ClipperLib::DoublePoint>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void ClipperLib::PolyNode::~PolyNode(ClipperLib::PolyNode *this)
{
  ClipperLib::PolyNode::~PolyNode(this);
  JUMPOUT(0x2533C7A10);
}

{
  void *v2;
  void *v3;

  *(void *)this = &unk_2702F8D88;
  uint64_t v2 = (void *)*((void *)this + 4);
  if (v2)
  {
    *((void *)this + 5) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 1);
  if (v3)
  {
    *((void *)this + 2) = v3;
    operator delete(v3);
  }
}

void *std::vector<ClipperLib::PolyNode *>::__init_with_size[abi:ne180100]<ClipperLib::PolyNode **,ClipperLib::PolyNode **>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<ClipperLib::TEdge *>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_252A84C54(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

id itk_dataFromCGImage(CGImage *a1, void *a2, void *a3)
{
  long long v5 = a2;
  CFDictionaryRef v6 = a3;
  uint64_t v7 = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
  size_t v8 = CGImageDestinationCreateWithData(v7, v5, 1uLL, 0);
  if (v8)
  {
    char v9 = v8;
    CGImageDestinationAddImage(v8, a1, v6);
    if (CGImageDestinationFinalize(v9))
    {
      CFRelease(v9);
      uint64_t v10 = (void *)[(__CFData *)v7 copy];
      goto LABEL_10;
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      itk_dataFromCGImage_cold_2((uint64_t)v5);
    }
    CFRelease(v9);
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    itk_dataFromCGImage_cold_1();
  }
  uint64_t v10 = 0;
LABEL_10:

  return v10;
}

void sub_252A876D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

CGImageRef itk_createResizedCGImage(CGImage *a1, size_t a2, size_t a3)
{
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a1);
  size_t BytesPerRow = CGImageGetBytesPerRow(a1);
  ColorSpace = CGImageGetColorSpace(a1);
  uint32_t BitmapInfo = CGImageGetBitmapInfo(a1);
  uint64_t v10 = CGBitmapContextCreate(0, a2, a3, BitsPerComponent, BytesPerRow, ColorSpace, BitmapInfo);
  CGContextSetInterpolationQuality(v10, kCGInterpolationHigh);
  ITKRectWithSize();
  CGContextDrawImage(v10, v13, a1);
  CGImageRef Image = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  return Image;
}

CGColorSpace *itk_newARGB8BitmapContextFromImage(CGImage *a1)
{
  size_t Width = CGImageGetWidth(a1);
  size_t Height = CGImageGetHeight(a1);
  __n128 result = CGImageGetColorSpace(a1);
  if (result)
  {
    return CGBitmapContextCreate(0, Width, Height, 8uLL, 4 * Width, result, 2u);
  }
  return result;
}

CVPixelBufferRef itk_pixelBufferFromCGImageWithAttributes(CGImage *a1, void *a2, CGColorSpace *a3)
{
  CFDictionaryRef v5 = a2;
  DeviceRGB = a3;
  if (!a3) {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  }
  CVPixelBufferRef pixelBufferOut = 0;
  if (a1)
  {
    unint64_t Width = CGImageGetWidth(a1);
    unint64_t Height = CGImageGetHeight(a1);
    if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], Width, Height, 0x42475241u, v5, &pixelBufferOut))
    {
      CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
      CGRect v13 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, DeviceRGB, 0x2002u);
      v15.size.width = (double)Width;
      v15.size.height = (double)Height;
      v15.origin.x = 0.0;
      v15.origin.y = 0.0;
      CGContextDrawImage(v13, v15, a1);
      CGContextRelease(v13);
      CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
      if (a3) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  if (!a3) {
LABEL_6:
  }
    CGColorSpaceRelease(DeviceRGB);
LABEL_7:
  CVPixelBufferRef v9 = pixelBufferOut;

  return v9;
}

CVPixelBufferRef itk_ioSurfaceBackedPixelBufferFromCGImage(CGImage *a1, CGColorSpace *a2)
{
  v10[3] = *MEMORY[0x263EF8340];
  DeviceRGB = a2;
  if (!a2) {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  }
  uint64_t v5 = *MEMORY[0x263F040A0];
  v9[0] = *MEMORY[0x263F04130];
  v9[1] = v5;
  v10[0] = MEMORY[0x263EFFA78];
  v10[1] = MEMORY[0x263EFFA88];
  v9[2] = *MEMORY[0x263F04090];
  v10[2] = MEMORY[0x263EFFA88];
  CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  CVPixelBufferRef v7 = itk_pixelBufferFromCGImageWithAttributes(a1, v6, DeviceRGB);
  if (!a2) {
    CGColorSpaceRelease(DeviceRGB);
  }

  return v7;
}

CVPixelBufferRef itk_cgImageBackedPixelBufferFromCGImage(CGImage *a1, CGColorSpace *a2)
{
  if (a2)
  {
    return itk_pixelBufferFromCGImageWithAttributes(a1, 0, a2);
  }
  else
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    CVPixelBufferRef v5 = itk_pixelBufferFromCGImageWithAttributes(a1, 0, DeviceRGB);
    CGColorSpaceRelease(DeviceRGB);
    return v5;
  }
}

__CVBuffer *itk_cgImageFromPixelBuffer(__CVBuffer *result)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  CGImageRef imageOut = 0;
  if (result)
  {
    uint64_t v1 = result;
    VTCreateCGImageFromCVPixelBuffer(result, 0, &imageOut);
    __n128 result = imageOut;
    if (!imageOut)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_252A7A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "VT did not return a CGImage from a buffer, trying CI", buf, 2u);
      }
      uint64_t v2 = [MEMORY[0x263F00650] imageWithCVPixelBuffer:v1];
      uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F00628]) initWithOptions:0];
      CVPixelBufferGetHeight(v1);
      CVPixelBufferGetWidth(v1);
      ITKRectWithSize();
      CGImageRef imageOut = (CGImageRef)objc_msgSend(v3, "createCGImage:fromRect:", v2);
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        BOOL v6 = imageOut != 0;
        _os_log_impl(&dword_252A7A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "CGImage from CI has result: %d", buf, 8u);
      }

      return imageOut;
    }
  }
  return result;
}

id itk_pngDataFromCGImage(CGImage *a1)
{
  uint64_t v2 = [(id)*MEMORY[0x263F1DC08] identifier];
  uint64_t v3 = itk_dataFromCGImage(a1, v2, 0);

  return v3;
}

void itk_cgImageCropZeroAlpha(CGImage *a1, void *a2)
{
  double v26 = a2;
  if (!a1) {
    objc_msgSend(MEMORY[0x263F4BE58], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "imageRef", "void itk_cgImageCropZeroAlpha(CGImageRef _Nonnull, void (^ _Nonnull __strong)(CGImageRef _Nullable, CGRect))", 0, 0, @"Trying to crop a NULL image");
  }
  double v4 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  uint64_t v7 = itk_newARGB8BitmapContextFromImage(a1);
  if (v7)
  {
    size_t Width = CGImageGetWidth(a1);
    size_t Height = CGImageGetHeight(a1);
    double v10 = (double)Width;
    v28.size.height = (double)Height;
    v28.origin.x = 0.0;
    v28.origin.y = 0.0;
    v28.size.width = (double)Width;
    CGContextDrawImage(v7, v28, a1);
    Data = (unsigned __int8 *)CGBitmapContextGetData(v7);
    CGImageRef Image = CGBitmapContextCreateImage(v7);
    if (Data)
    {
      if (Height)
      {
        unint64_t v13 = 0;
        unint64_t v14 = 0;
        unint64_t v15 = 0;
        unint64_t v16 = Height;
        unint64_t v17 = Width;
        do
        {
          if (Width)
          {
            unint64_t v18 = 0;
            uint64_t v19 = Data;
            do
            {
              int v21 = *v19;
              v19 += 4;
              int v20 = v21;
              if (v17 >= v18) {
                unint64_t v22 = v18;
              }
              else {
                unint64_t v22 = v17;
              }
              if (v15 <= v18) {
                unint64_t v23 = v18;
              }
              else {
                unint64_t v23 = v15;
              }
              if (v16 >= v13) {
                unint64_t v24 = v13;
              }
              else {
                unint64_t v24 = v16;
              }
              if (v14 <= v13) {
                unint64_t v25 = v13;
              }
              else {
                unint64_t v25 = v14;
              }
              if (v20)
              {
                unint64_t v17 = v22;
                unint64_t v16 = v24;
                unint64_t v15 = v23;
                unint64_t v14 = v25;
              }
              ++v18;
            }
            while (Width != v18);
            Data += 4 * Width;
          }
          ++v13;
        }
        while (v13 != Height);
        double v10 = (double)v17;
        size_t Width = v17;
      }
      else
      {
        unint64_t v16 = 0;
        unint64_t v15 = 0;
        unint64_t v14 = 0;
      }
      double v3 = (double)v16;
      double v5 = (double)(v15 - Width + 1);
      double v6 = (double)(v14 - v16 + 1);
      double v4 = v10;
    }
    CGContextRelease(v7);
    if (Image)
    {
      v29.origin.x = v4;
      v29.origin.y = v3;
      v29.size.width = v5;
      v29.size.height = v6;
      uint64_t v7 = CGImageCreateWithImageInRect(Image, v29);
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F4BE58], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "context", "void itk_cgImageCropZeroAlpha(CGImageRef _Nonnull, void (^ _Nonnull __strong)(CGImageRef _Nullable, CGRect))", 0, 0, @"Couldn't create a bitmap context");
    CGImageRef Image = 0;
  }
  CGImageRelease(Image);
  v26[2](v26, v7, v4, v3, v5, v6);
  CGImageRelease(v7);
}

BOOL itk_isPixelBufferTransparentAtPoint(__CVBuffer *a1, double a2, double a3, double a4)
{
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  LODWORD(v4) = llround(a2);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if ((v4 & 0x80000000) != 0 || (LODWORD(v5) = llround(a3), (v5 & 0x80000000) != 0) || Width <= v4)
  {
    if (PixelFormatType == 1278226534) {
      return 0;
    }
LABEL_8:
    objc_msgSend(MEMORY[0x263F4BE58], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "BOOL itk_isPixelBufferTransparentAtPoint(CVPixelBufferRef _Nullable, CGPoint, CGFloat)", 0, 0, @"unsupported pixel format for itk_isPixelBufferTransparent");
    return 0;
  }
  if (PixelFormatType != 1278226534) {
    goto LABEL_8;
  }
  if (Height <= v5) {
    return 0;
  }
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  BOOL v14 = *(float *)((char *)CVPixelBufferGetBaseAddress(a1) + 4 * v4 + BytesPerRow * v5) <= a4;
  CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  return v14;
}

CGImageRef itk_createScaledCGImage(CGImage *a1, double a2)
{
  size_t v4 = vcvtmd_u64_f64((double)CGImageGetWidth(a1) * a2);
  size_t v5 = vcvtmd_u64_f64((double)CGImageGetHeight(a1) * a2);
  return itk_createResizedCGImage(a1, v4, v5);
}

double itk_sizeForPixelBuffer(__CVBuffer *a1)
{
  if (!a1) {
    return *MEMORY[0x263F001B0];
  }
  double Width = (double)CVPixelBufferGetWidth(a1);
  CVPixelBufferGetHeight(a1);
  return Width;
}

double itk_sizeForCGImage(CGImage *a1)
{
  if (!a1) {
    return *MEMORY[0x263F001B0];
  }
  double Width = (double)CGImageGetWidth(a1);
  CGImageGetHeight(a1);
  return Width;
}

void ClipperLib::PolyTree::Clear(ClipperLib::PolyTree *this)
{
  uint64_t v2 = *((void *)this + 10);
  uint64_t v3 = *((void *)this + 11);
  size_t v4 = (char *)this + 80;
  if (v3 != v2)
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(v2 + 8 * v5);
      if (v6)
      {
        (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
        uint64_t v2 = *((void *)this + 10);
        uint64_t v3 = *((void *)this + 11);
      }
      ++v5;
    }
    while (v5 < (v3 - v2) >> 3);
  }
  std::vector<ClipperLib::PolyNode *>::resize((uint64_t)v4, 0);
  std::vector<ClipperLib::PolyNode *>::resize((uint64_t)this + 32, 0);
}

void std::vector<ClipperLib::PolyNode *>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    std::vector<ClipperLib::PolyNode *>::__append((void **)a1, a2 - v2);
  }
}

uint64_t ClipperLib::PolyTree::GetFirst(ClipperLib::PolyTree *this)
{
  uint64_t v1 = *((void *)this + 4);
  if (v1 == *((void *)this + 5)) {
    return 0;
  }
  else {
    return *(void *)v1;
  }
}

uint64_t ClipperLib::PolyTree::Total(ClipperLib::PolyTree *this)
{
  unint64_t v2 = (void *)*((void *)this + 10);
  uint64_t result = (*((void *)this + 11) - (void)v2) >> 3;
  if ((int)result >= 1) {
    return result - (**((void **)this + 4) != *v2);
  }
  return result;
}

double ClipperLib::PolyNode::PolyNode(ClipperLib::PolyNode *this)
{
  *(void *)this = &unk_2702F8D88;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 53) = 0u;
  return result;
}

{
  double result;

  *(void *)this = &unk_2702F8D88;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 53) = 0u;
  return result;
}

uint64_t ClipperLib::PolyNode::ChildCount(ClipperLib::PolyNode *this)
{
  return (*((void *)this + 5) - *((void *)this + 4)) >> 3;
}

void ClipperLib::PolyNode::AddChild(ClipperLib::PolyNode *this, ClipperLib::PolyNode *a2)
{
  uint64_t v4 = *((void *)this + 4);
  uint64_t v6 = (void *)*((void *)this + 5);
  unint64_t v5 = (void **)((char *)this + 32);
  uint64_t v7 = (uint64_t)v6 - v4;
  size_t v8 = (char *)this + 32;
  unint64_t v11 = *((void *)v8 + 2);
  uint64_t v9 = (uint64_t)(v8 + 16);
  unint64_t v10 = v11;
  if ((unint64_t)v6 >= v11)
  {
    unint64_t v13 = (v7 >> 3) + 1;
    if (v13 >> 61) {
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = v10 - v4;
    uint64_t v15 = v14 >> 2;
    if (v14 >> 2 <= v13) {
      uint64_t v15 = (v7 >> 3) + 1;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v15;
    }
    if (v16) {
      unint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>(v9, v16);
    }
    else {
      unint64_t v17 = 0;
    }
    unint64_t v18 = &v17[8 * (v7 >> 3)];
    uint64_t v19 = &v17[8 * v16];
    *(void *)unint64_t v18 = a2;
    double v12 = v18 + 8;
    int v21 = (char *)*((void *)this + 4);
    int v20 = (char *)*((void *)this + 5);
    if (v20 != v21)
    {
      do
      {
        uint64_t v22 = *((void *)v20 - 1);
        v20 -= 8;
        *((void *)v18 - 1) = v22;
        v18 -= 8;
      }
      while (v20 != v21);
      int v20 = (char *)*v5;
    }
    *((void *)this + 4) = v18;
    *((void *)this + 5) = v12;
    *((void *)this + 6) = v19;
    if (v20) {
      operator delete(v20);
    }
  }
  else
  {
    *uint64_t v6 = a2;
    double v12 = v6 + 1;
  }
  *((void *)this + 5) = v12;
  *((void *)a2 + 7) = this;
  *((_DWORD *)a2 + 16) = (unint64_t)v7 >> 3;
}

uint64_t ClipperLib::PolyNode::GetNext(ClipperLib::PolyNode *this)
{
  uint64_t v1 = *((void *)this + 4);
  if (v1 == *((void *)this + 5))
  {
    do
    {
      uint64_t v4 = *((void *)this + 7);
      if (!v4) {
        return 0;
      }
      uint64_t v2 = *((unsigned int *)this + 16);
      uint64_t v3 = *(void *)(v4 + 32);
      this = (ClipperLib::PolyNode *)*((void *)this + 7);
    }
    while (((*(void *)(v4 + 40) - v3) >> 3) - 1 == v2);
    uint64_t v1 = v3 + 8 * (v2 + 1);
  }
  return *(void *)v1;
}

uint64_t ClipperLib::PolyNode::GetNextSiblingUp(ClipperLib::PolyNode *this)
{
  while (1)
  {
    uint64_t v1 = *((void *)this + 7);
    if (!v1) {
      break;
    }
    uint64_t v2 = *((unsigned int *)this + 16);
    uint64_t v3 = *(void *)(v1 + 32);
    this = (ClipperLib::PolyNode *)*((void *)this + 7);
    if (((*(void *)(v1 + 40) - v3) >> 3) - 1 != v2) {
      return *(void *)(v3 + 8 * (v2 + 1));
    }
  }
  return 0;
}

uint64_t ClipperLib::PolyNode::IsHole(ClipperLib::PolyNode *this)
{
  int v1 = 1;
  do
  {
    char v2 = v1;
    this = (ClipperLib::PolyNode *)*((void *)this + 7);
    v1 ^= 1u;
  }
  while (this);
  return v2 & 1;
}

uint64_t ClipperLib::PolyNode::IsOpen(ClipperLib::PolyNode *this)
{
  return *((unsigned __int8 *)this + 68);
}

unint64_t ClipperLib::Int128Mul@<X0>(unint64_t this@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  if ((this & 0x8000000000000000) == 0) {
    uint64_t v3 = this;
  }
  else {
    uint64_t v3 = -(uint64_t)this;
  }
  if (a2 >= 0) {
    uint64_t v4 = a2;
  }
  else {
    uint64_t v4 = -a2;
  }
  unint64_t v5 = v4 * (unint64_t)v3;
  unint64_t v6 = ((HIDWORD(v4) * (unint64_t)v3 + v4 * (unint64_t)HIDWORD(v3)) >> 32)
     + HIDWORD(v4) * (unint64_t)HIDWORD(v3);
  unint64_t v7 = v4 * v3;
  *a3 = v7;
  a3[1] = v6;
  if (v7 < v5) {
    a3[1] = ++v6;
  }
  if (this >> 63 != (unint64_t)a2 >> 63)
  {
    unint64_t v8 = -(uint64_t)v6;
    if (v7) {
      unint64_t v8 = ~v6;
    }
    *a3 = -(uint64_t)v7;
    a3[1] = v8;
  }
  return this;
}

BOOL ClipperLib::Orientation(uint64_t *a1)
{
  return ClipperLib::Area(a1) >= 0.0;
}

double ClipperLib::Area(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  double result = 0.0;
  if ((int)v2 >= 3)
  {
    uint64_t v4 = 0;
    int v5 = v2 - 1;
    unint64_t v6 = (uint64_t *)(v1 + 8);
    do
    {
      unint64_t v7 = (uint64_t *)(v1 + 24 * v5);
      double v8 = (double)*v7 + (double)*(v6 - 1);
      uint64_t v9 = *v6;
      v6 += 3;
      double result = result + v8 * ((double)v7[1] - (double)v9);
      int v5 = v4++;
    }
    while (-1431655765 * ((a1[1] - *a1) >> 3) != v4);
    return result * -0.5;
  }
  return result;
}

double ClipperLib::Area(void *a1)
{
  double result = 0.0;
  if (a1)
  {
    unint64_t v2 = a1;
    do
    {
      double result = result
             + (double)(uint64_t)(v2[1] + *(void *)(v2[5] + 8))
             * (double)(uint64_t)(*(void *)(v2[5] + 16) - v2[2]);
      unint64_t v2 = (void *)v2[4];
    }
    while (v2 != a1);
    return result * 0.5;
  }
  return result;
}

double ClipperLib::Area(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (!v1) {
    return 0.0;
  }
  double v2 = 0.0;
  uint64_t v3 = *(void **)(a1 + 24);
  do
  {
    double v2 = v2 + (double)(uint64_t)(v3[1] + *(void *)(v3[5] + 8)) * (double)(uint64_t)(*(void *)(v3[5] + 16) - v3[2]);
    uint64_t v3 = (void *)v3[4];
  }
  while (v3 != v1);
  return v2 * 0.5;
}

uint64_t ClipperLib::PointIsVertex(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a2;
  do
  {
    BOOL v5 = v4[1] == v2 && v4[2] == v3;
    uint64_t result = v5;
    if (v5) {
      break;
    }
    uint64_t v4 = (void *)v4[4];
  }
  while (v4 != a2);
  return result;
}

uint64_t ClipperLib::PointInPolygon(void *a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t **)a2;
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
  if (v3 < 3) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v6 = *v2;
  uint64_t v7 = v2[1];
  unint64_t v8 = 1;
  unint64_t v11 = a1;
  uint64_t v9 = *a1;
  uint64_t v10 = v11[1];
  while (1)
  {
    unint64_t v12 = v3 == v8 ? 0 : v8;
    unint64_t v13 = &v2[3 * v12];
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    if (v15 == v10 && (v14 == v9 || v7 == v10 && v14 <= v9 != v6 < v9)) {
      return 0xFFFFFFFFLL;
    }
    if (v7 >= v10 == v15 < v10)
    {
      BOOL v17 = __OFSUB__(v6, v9);
      BOOL v16 = v6 - v9 < 0;
      uint64_t v18 = v6 - v9;
      if (v16 != v17)
      {
        uint64_t v19 = v14 - v9;
        if (v14 <= v9) {
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v19 = v14 - v9;
        if (v14 > v9)
        {
          uint64_t result = (1 - result);
          goto LABEL_22;
        }
      }
      double v20 = (double)v18 * (double)(v15 - v10) - (double)v19 * (double)(v7 - v10);
      if (v20 == 0.0) {
        return 0xFFFFFFFFLL;
      }
      if (v15 > v7 != v20 <= 0.0) {
        uint64_t result = (1 - result);
      }
      else {
        uint64_t result = result;
      }
    }
LABEL_22:
    ++v8;
    uint64_t v6 = v14;
    uint64_t v7 = v15;
    if (v8 > v3) {
      return result;
    }
  }
}

uint64_t ClipperLib::PointInPolygon(void *a1, void *a2)
{
  uint64_t result = 0;
  uint64_t v6 = a1;
  uint64_t v4 = *a1;
  uint64_t v5 = v6[1];
  uint64_t v7 = a2;
  while (1)
  {
    unint64_t v8 = v7;
    uint64_t v7 = (void *)v7[4];
    uint64_t v9 = v7[2];
    if (v9 != v5)
    {
      uint64_t v11 = v8[2];
LABEL_9:
      if (v9 < v5 != v11 >= v5) {
        goto LABEL_21;
      }
      goto LABEL_10;
    }
    uint64_t v10 = v7[1];
    if (v10 == v4) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v11 = v8[2];
    if (v11 != v5) {
      goto LABEL_9;
    }
    if (v10 <= v4 != v8[1] < v4) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v11 = v5;
    if (v9 >= v5) {
      goto LABEL_21;
    }
LABEL_10:
    uint64_t v12 = v8[1];
    uint64_t v13 = v7[1];
    BOOL v15 = __OFSUB__(v12, v4);
    BOOL v14 = v12 - v4 < 0;
    uint64_t v16 = v12 - v4;
    if (v14 == v15) {
      break;
    }
    BOOL v15 = __OFSUB__(v13, v4);
    BOOL v17 = v13 == v4;
    BOOL v14 = v13 - v4 < 0;
    uint64_t v18 = v13 - v4;
    if (!(v14 ^ v15 | v17)) {
      goto LABEL_17;
    }
LABEL_21:
    if (v7 == a2) {
      return result;
    }
  }
  BOOL v15 = __OFSUB__(v13, v4);
  BOOL v17 = v13 == v4;
  BOOL v14 = v13 - v4 < 0;
  uint64_t v18 = v13 - v4;
  if (!(v14 ^ v15 | v17))
  {
    uint64_t result = (1 - result);
    goto LABEL_21;
  }
LABEL_17:
  double v19 = (double)v16 * (double)(v9 - v5) - (double)v18 * (double)(v11 - v5);
  if (v19 != 0.0)
  {
    if (v9 > v11 != v19 <= 0.0) {
      uint64_t result = (1 - result);
    }
    else {
      uint64_t result = result;
    }
    goto LABEL_21;
  }
  return 0xFFFFFFFFLL;
}

BOOL ClipperLib::Poly2ContainsPoly1(uint64_t a1, void *a2)
{
  uint64_t v4 = a1;
  while (1)
  {
    int v5 = ClipperLib::PointInPolygon((void *)(v4 + 8), a2);
    if ((v5 & 0x80000000) == 0) {
      break;
    }
    uint64_t v4 = *(void *)(v4 + 32);
    if (v4 == a1) {
      return 1;
    }
  }
  return v5 != 0;
}

BOOL ClipperLib::SlopesEqual(void *a1, void *a2, int a3)
{
  if (a3)
  {
    ClipperLib::Int128Mul(a1[7] - a1[1], a2[6] - *a2, v8);
    ClipperLib::Int128Mul(a1[6] - *a1, a2[7] - a2[1], v7);
    return v8[1] == v7[1] && v8[0] == v7[0];
  }
  else
  {
    return (a2[6] - *a2) * (a1[7] - a1[1]) == (a2[7] - a2[1]) * (a1[6] - *a1);
  }
}

BOOL ClipperLib::SlopesEqual(void *a1, uint64_t *a2, void *a3, int a4)
{
  if (a4)
  {
    uint64_t v7 = *a2;
    uint64_t v6 = a2[1];
    ClipperLib::Int128Mul(a1[1] - v6, *a2 - *a3, v11);
    ClipperLib::Int128Mul(*a1 - v7, v6 - a3[1], v10);
    return v11[1] == v10[1] && v11[0] == v10[0];
  }
  else
  {
    return (*a2 - *a3) * (a1[1] - a2[1]) == (a2[1] - a3[1]) * (*a1 - *a2);
  }
}

BOOL ClipperLib::SlopesEqual(void *a1, void *a2, void *a3, void *a4, int a5)
{
  if (a5)
  {
    ClipperLib::Int128Mul(a1[1] - a2[1], *a3 - *a4, v12);
    ClipperLib::Int128Mul(*a1 - *a2, a3[1] - a4[1], v11);
    return v12[1] == v11[1] && v12[0] == v11[0];
  }
  else
  {
    return (*a3 - *a4) * (a1[1] - a2[1]) == (a3[1] - a4[1]) * (*a1 - *a2);
  }
}

uint64_t ClipperLib::IntersectPoint(uint64_t result, uint64_t a2, uint64_t *a3)
{
  a3[2] = 0xBF800000BF800000;
  double v3 = *(double *)(result + 72);
  double v4 = *(double *)(a2 + 72);
  if (v3 == v4)
  {
    uint64_t v5 = *(void *)(result + 32);
    a3[1] = v5;
    if (*(void *)(result + 56) != v5)
    {
      double v11 = v3 * (double)(v5 - *(void *)(result + 8));
      double v12 = 0.5;
      if (v11 < 0.0) {
        double v12 = -0.5;
      }
      uint64_t v6 = *(void *)result + (uint64_t)(v11 + v12);
      goto LABEL_55;
    }
    goto LABEL_3;
  }
  if (v3 == 0.0)
  {
    uint64_t v7 = *(void *)result;
    *a3 = *(void *)result;
    uint64_t v8 = *(void *)(a2 + 8);
    if (v4 != -1.0e40)
    {
      double v9 = (double)v8 - (double)*(uint64_t *)a2 / v4;
      double v10 = (double)v7 / v4;
LABEL_13:
      double v14 = v10 + v9;
      double v15 = 0.5;
      if (v14 < 0.0) {
        double v15 = -0.5;
      }
      uint64_t v8 = (uint64_t)(v14 + v15);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (v4 == 0.0)
  {
    uint64_t v13 = *(void *)a2;
    *a3 = *(void *)a2;
    uint64_t v8 = *(void *)(result + 8);
    if (v3 != -1.0e40)
    {
      double v9 = (double)v8 - (double)*(uint64_t *)result / v3;
      double v10 = (double)v13 / v3;
      goto LABEL_13;
    }
LABEL_16:
    a3[1] = v8;
    goto LABEL_17;
  }
  double v20 = (double)*(uint64_t *)result - (double)*(uint64_t *)(result + 8) * v3;
  double v21 = (double)*(uint64_t *)a2 - (double)*(uint64_t *)(a2 + 8) * v4;
  double v22 = (v21 - v20) / (v3 - v4);
  if (v22 >= 0.0) {
    double v23 = 0.5;
  }
  else {
    double v23 = -0.5;
  }
  uint64_t v8 = (uint64_t)(v22 + v23);
  double v24 = v21 + v4 * v22;
  double v25 = v20 + v3 * v22;
  if (fabs(v3) >= fabs(v4)) {
    double v25 = v24;
  }
  if (v25 >= 0.0) {
    double v26 = 0.5;
  }
  else {
    double v26 = -0.5;
  }
  *a3 = (uint64_t)(v25 + v26);
  a3[1] = v8;
LABEL_17:
  uint64_t v16 = *(void *)(result + 56);
  uint64_t v17 = *(void *)(a2 + 56);
  if (v8 < v16 || v8 < v17)
  {
    if (v16 <= v17) {
      uint64_t v8 = *(void *)(a2 + 56);
    }
    else {
      uint64_t v8 = *(void *)(result + 56);
    }
    a3[1] = v8;
    if (fabs(v3) >= fabs(v4))
    {
      if (*(void *)(a2 + 56) == v8)
      {
        uint64_t v19 = *(void *)(a2 + 48);
        goto LABEL_44;
      }
      uint64_t v27 = *(void *)a2;
      double v28 = v4 * (double)(v8 - *(void *)(a2 + 8));
    }
    else
    {
      if (*(void *)(result + 56) == v8)
      {
        uint64_t v19 = *(void *)(result + 48);
LABEL_44:
        *a3 = v19;
        goto LABEL_45;
      }
      uint64_t v27 = *(void *)result;
      double v28 = v3 * (double)(v8 - *(void *)(result + 8));
    }
    double v29 = 0.5;
    if (v28 < 0.0) {
      double v29 = -0.5;
    }
    uint64_t v19 = v27 + (uint64_t)(v28 + v29);
    goto LABEL_44;
  }
LABEL_45:
  uint64_t v30 = *(void *)(result + 32);
  if (v8 <= v30) {
    return result;
  }
  a3[1] = v30;
  if (fabs(v3) > fabs(v4))
  {
    if (*(void *)(a2 + 56) == v30)
    {
      uint64_t v6 = *(void *)(a2 + 48);
      goto LABEL_55;
    }
    uint64_t v31 = *(void *)a2;
    double v32 = v4 * (double)(v30 - *(void *)(a2 + 8));
LABEL_52:
    double v33 = 0.5;
    if (v32 < 0.0) {
      double v33 = -0.5;
    }
    uint64_t v6 = v31 + (uint64_t)(v32 + v33);
    goto LABEL_55;
  }
  if (*(void *)(result + 56) != v30)
  {
    uint64_t v31 = *(void *)result;
    double v32 = v3 * (double)(v30 - *(void *)(result + 8));
    goto LABEL_52;
  }
LABEL_3:
  uint64_t v6 = *(void *)(result + 48);
LABEL_55:
  *a3 = v6;
  return result;
}

int8x16_t ClipperLib::ReversePolyPtLinks(__n128 *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      int8x16_t result = (int8x16_t)v1[2];
      v1[2] = (__n128)vextq_s8(result, result, 8uLL);
      uint64_t v1 = (__n128 *)result.i64[0];
    }
    while ((__n128 *)result.i64[0] != a1);
  }
  return result;
}

void *ClipperLib::DisposeOutPts(void *result)
{
  if (*result)
  {
    uint64_t v1 = (void **)result;
    *(void *)(*(void *)(*result + 40) + 32) = 0;
    while (1)
    {
      int8x16_t result = *v1;
      if (!*v1) {
        break;
      }
      *uint64_t v1 = (void *)result[4];
      MEMORY[0x2533C7A10]();
    }
  }
  return result;
}

uint64_t ClipperLib::InitEdge2(uint64_t result, int a2)
{
  uint64_t v2 = (_OWORD *)(result + 24);
  uint64_t v3 = *(void *)(result + 104);
  if (*(void *)(result + 32) >= *(void *)(v3 + 32))
  {
    *(_OWORD *)int8x16_t result = *v2;
    *(void *)(result + 16) = *(void *)(result + 40);
    uint64_t v5 = *(void *)(v3 + 40);
    *(_OWORD *)(result + 48) = *(_OWORD *)(v3 + 24);
    *(void *)(result + 64) = v5;
  }
  else
  {
    *(_OWORD *)(result + 48) = *v2;
    *(void *)(result + 64) = *(void *)(result + 40);
    uint64_t v4 = *(void *)(v3 + 40);
    *(_OWORD *)int8x16_t result = *(_OWORD *)(v3 + 24);
    *(void *)(result + 16) = v4;
  }
  uint64_t v6 = *(void *)(result + 56) - *(void *)(result + 8);
  if (v6) {
    double v7 = (double)(uint64_t)(*(void *)(result + 48) - *(void *)result) / (double)v6;
  }
  else {
    double v7 = -1.0e40;
  }
  *(double *)(result + 72) = v7;
  *(_DWORD *)(result + 80) = a2;
  return result;
}

uint64_t ClipperLib::RemoveEdge(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 112);
  *(void *)(v1 + 104) = *(void *)(a1 + 104);
  uint64_t v2 = *(void *)(a1 + 104);
  *(void *)(v2 + 112) = v1;
  *(void *)(a1 + 112) = 0;
  return v2;
}

__n128 ClipperLib::SwapPoints(__n128 *a1, __n128 *a2)
{
  unint64_t v2 = a1[1].n128_u64[0];
  __n128 result = *a1;
  unint64_t v4 = a2[1].n128_u64[0];
  *a1 = *a2;
  a1[1].n128_u64[0] = v4;
  *a2 = result;
  a2[1].n128_u64[0] = v2;
  return result;
}

BOOL ClipperLib::GetOverlapSegment(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = a1[1];
  uint64_t v7 = a2[1];
  uint64_t v8 = *a1 - *a2;
  if (v8 < 0) {
    uint64_t v8 = *a2 - *a1;
  }
  unint64_t v9 = v6 - v7;
  if (v6 - v7 < 0) {
    unint64_t v9 = v7 - v6;
  }
  if (v8 <= v9)
  {
    if (v6 < v7)
    {
      uint64_t v22 = a1[2];
      long long v23 = *(_OWORD *)a1;
      uint64_t v24 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v24;
      *(_OWORD *)a2 = v23;
      a2[2] = v22;
    }
    uint64_t v25 = a3[1];
    if (v25 < a4[1])
    {
      uint64_t v26 = a3[2];
      long long v27 = *(_OWORD *)a3;
      uint64_t v28 = a4[2];
      *(_OWORD *)a3 = *(_OWORD *)a4;
      a3[2] = v28;
      *(_OWORD *)a4 = v27;
      a4[2] = v26;
      uint64_t v25 = a3[1];
    }
    if (a1[1] >= v25) {
      double v29 = a3;
    }
    else {
      double v29 = a1;
    }
    long long v30 = *(_OWORD *)v29;
    *(void *)(a5 + 16) = v29[2];
    *(_OWORD *)a5 = v30;
    if (a2[1] <= a4[1]) {
      uint64_t v31 = a4;
    }
    else {
      uint64_t v31 = a2;
    }
    long long v32 = *(_OWORD *)v31;
    *(void *)(a6 + 16) = v31[2];
    *(_OWORD *)a6 = v32;
    return *(void *)(a5 + 8) > *(void *)(a6 + 8);
  }
  else
  {
    if (*a1 > *a2)
    {
      uint64_t v10 = a1[2];
      long long v11 = *(_OWORD *)a1;
      uint64_t v12 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v12;
      *(_OWORD *)a2 = v11;
      a2[2] = v10;
    }
    uint64_t v13 = *a3;
    if (*a3 > *a4)
    {
      uint64_t v14 = a3[2];
      long long v15 = *(_OWORD *)a3;
      uint64_t v16 = a4[2];
      *(_OWORD *)a3 = *(_OWORD *)a4;
      a3[2] = v16;
      *(_OWORD *)a4 = v15;
      a4[2] = v14;
      uint64_t v13 = *a3;
    }
    if (*a1 <= v13) {
      uint64_t v17 = a3;
    }
    else {
      uint64_t v17 = a1;
    }
    long long v18 = *(_OWORD *)v17;
    *(void *)(a5 + 16) = v17[2];
    *(_OWORD *)a5 = v18;
    if (*a2 >= *a4) {
      uint64_t v19 = a4;
    }
    else {
      uint64_t v19 = a2;
    }
    long long v20 = *(_OWORD *)v19;
    *(void *)(a6 + 16) = v19[2];
    *(_OWORD *)a6 = v20;
    return *(void *)a5 < *(void *)a6;
  }
}

uint64_t ClipperLib::FirstIsBottomPt(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  uint64_t v3 = *(void *)(result + 16);
  unint64_t v4 = (void *)result;
  do
  {
    unint64_t v4 = (void *)v4[5];
    uint64_t v5 = v4[1];
    uint64_t v6 = v4[2];
  }
  while (v4 != (void *)result && v5 == v2 && v6 == v3);
  uint64_t v9 = v6 - v3;
  if (v9) {
    double v10 = (double)(v5 - v2) / (double)v9;
  }
  else {
    double v10 = -1.0e40;
  }
  long long v11 = (void *)result;
  do
  {
    long long v11 = (void *)v11[4];
    uint64_t v12 = v11[1];
    uint64_t v13 = v11[2];
  }
  while (v11 != (void *)result && v12 == v2 && v13 == v3);
  uint64_t v16 = v13 - v3;
  if (v16) {
    double v17 = (double)(v12 - v2) / (double)v16;
  }
  else {
    double v17 = -1.0e40;
  }
  double v18 = fabs(v10);
  uint64_t v19 = a2[1];
  uint64_t v20 = a2[2];
  double v21 = a2;
  do
  {
    double v21 = (void *)v21[5];
    uint64_t v22 = v21[1];
    uint64_t v23 = v21[2];
  }
  while (v21 != a2 && v22 == v19 && v23 == v20);
  if (v23 == v20) {
    double v26 = -1.0e40;
  }
  else {
    double v26 = (double)(v22 - v19) / (double)(v23 - v20);
  }
  double v27 = fabs(v17);
  uint64_t v28 = a2;
  do
  {
    uint64_t v28 = (void *)v28[4];
    uint64_t v29 = v28[1];
    uint64_t v30 = v28[2];
  }
  while (v28 != a2 && v29 == v19 && v30 == v20);
  double v33 = fabs(v26);
  uint64_t v34 = v30 - v20;
  if (v34) {
    double v35 = (double)(v29 - v19) / (double)v34;
  }
  else {
    double v35 = -1.0e40;
  }
  double v36 = fabs(v35);
  if (v18 >= v27) {
    double v37 = v18;
  }
  else {
    double v37 = v27;
  }
  if (v33 >= v36) {
    double v38 = v33;
  }
  else {
    double v38 = v36;
  }
  if (v37 == v38 && (v27 >= v18 ? (double v39 = v18) : (double v39 = v27), v36 >= v33 ? (v40 = v33) : (v40 = v36), v39 == v40))
  {
    if (result)
    {
      double v41 = 0.0;
      v42 = (void *)result;
      do
      {
        double v41 = v41
            + (double)(uint64_t)(v42[1] + *(void *)(v42[5] + 8))
            * (double)(uint64_t)(*(void *)(v42[5] + 16) - v42[2]);
        v42 = (void *)v42[4];
      }
      while (v42 != (void *)result);
      return v41 * 0.5 > 0.0;
    }
  }
  else
  {
    BOOL v43 = v27 >= v33;
    if (v27 < v36) {
      BOOL v43 = 0;
    }
    return v18 >= v33 && v18 >= v36 || v43;
  }
  return result;
}

uint64_t ClipperLib::GetBottomPt(void *a1)
{
  uint64_t v1 = (uint64_t)a1;
  uint64_t v2 = (void *)a1[4];
  if (v2 == a1) {
    return v1;
  }
  uint64_t v3 = 0;
  do
  {
    uint64_t v4 = v2[2];
    uint64_t v5 = *(void *)(v1 + 16);
    if (v4 > v5)
    {
LABEL_4:
      uint64_t v3 = 0;
      uint64_t v1 = (uint64_t)v2;
      goto LABEL_11;
    }
    if (v4 == v5)
    {
      uint64_t v6 = v2[1];
      uint64_t v7 = *(void *)(v1 + 8);
      if (v6 <= v7)
      {
        if (v6 < v7) {
          goto LABEL_4;
        }
        if (v2[4] != v1 && v2[5] != v1) {
          uint64_t v3 = v2;
        }
      }
    }
LABEL_11:
    uint64_t v2 = (void *)v2[4];
  }
  while (v2 != (void *)v1);
  if (!v3 || v3 == (void *)v1) {
    return v1;
  }
  uint64_t v8 = (void *)v1;
  do
  {
    if (!ClipperLib::FirstIsBottomPt(v1, v3)) {
      uint64_t v8 = v3;
    }
    do
      uint64_t v3 = (void *)v3[4];
    while (v3[1] != v8[1] || v3[2] != v8[2]);
  }
  while (v3 != (void *)v1);
  return (uint64_t)v8;
}

uint64_t ClipperLib::Pt2IsBetweenPt1AndPt3(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = *a3;
  uint64_t v6 = a3[1];
  if (*a1 == *a3 && v4 == v6) {
    return 0;
  }
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  if (v3 == *a2 && v4 == v9) {
    return 0;
  }
  if (v5 == v8 && v6 == v9) {
    return 0;
  }
  unsigned int v12 = (v9 <= v4) ^ (v9 < v6);
  unsigned int v13 = (v8 <= v3) ^ (v8 < v5);
  if (v3 == v5) {
    return v12;
  }
  else {
    return v13;
  }
}

BOOL ClipperLib::HorzSegmentsOverlap(ClipperLib *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((uint64_t)this >= a2) {
    uint64_t v4 = (ClipperLib *)a2;
  }
  else {
    uint64_t v4 = this;
  }
  if ((uint64_t)this <= a2) {
    uint64_t v5 = (ClipperLib *)a2;
  }
  else {
    uint64_t v5 = this;
  }
  if (a3 >= a4) {
    uint64_t v6 = a4;
  }
  else {
    uint64_t v6 = a3;
  }
  if (a3 <= a4) {
    uint64_t v7 = a4;
  }
  else {
    uint64_t v7 = a3;
  }
  return (uint64_t)v4 < v7 && v6 < (uint64_t)v5;
}

double ClipperLib::ClipperBase::ClipperBase(ClipperLib::ClipperBase *this)
{
  *(void *)this = &unk_2702F8DF8;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 10) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 16) = 0;
  *((void *)this + 14) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((unsigned char *)this + 40) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_2702F8DF8;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 10) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 16) = 0;
  *((void *)this + 14) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((unsigned char *)this + 40) = 0;
  return result;
}

void ClipperLib::ClipperBase::~ClipperBase(ClipperLib::ClipperBase *this)
{
  *(void *)this = &unk_2702F8DF8;
  ClipperLib::ClipperBase::Clear(this);
  uint64_t v2 = (void *)*((void *)this + 14);
  if (v2)
  {
    *((void *)this + 15) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 10);
  if (v3)
  {
    *((void *)this + 11) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 6);
  if (v4)
  {
    *((void *)this + 7) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 2);
  if (v5)
  {
    *((void *)this + 3) = v5;
    operator delete(v5);
  }
}

{
  uint64_t vars8;

  ClipperLib::ClipperBase::~ClipperBase(this);
  JUMPOUT(0x2533C7A10);
}

uint64_t *ClipperLib::RangeTest(uint64_t *result, unsigned char *a2)
{
  uint64_t v2 = *result;
  if (!*a2)
  {
    if (v2 <= 0x3FFFFFFF && v2 >= -1073741823 && (unint64_t)(result[1] - 0x40000000) >= 0xFFFFFFFF80000001) {
      return result;
    }
    *a2 = 1;
  }
  if (v2 > 0x3FFFFFFFFFFFFFFFLL
    || (v2 >= (uint64_t)0xC000000000000001
      ? (BOOL v5 = (unint64_t)(result[1] - 0x4000000000000000) > 0x8000000000000000)
      : (BOOL v5 = 0),
        !v5))
  {
    exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
    ClipperLib::clipperException::clipperException(exception, "Coordinate outside allowed range");
  }
  return result;
}

void sub_252A8AAE8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ClipperLib::FindNextLocMin(uint64_t result)
{
  while (1)
  {
    while (1)
    {
      uint64_t v1 = *(void *)(result + 112);
      if (*(void *)result == *(void *)v1
        && *(void *)(result + 8) == *(void *)(v1 + 8)
        && (*(void *)(result + 24) != *(void *)(result + 48) || *(void *)(result + 32) != *(void *)(result + 56)))
      {
        break;
      }
      double result = *(void *)(result + 104);
    }
    if (*(double *)(result + 72) != -1.0e40 && *(double *)(v1 + 72) != -1.0e40) {
      break;
    }
    uint64_t v4 = result;
    do
    {
      uint64_t v5 = v4;
      uint64_t v4 = *(void *)(v4 + 112);
    }
    while (*(double *)(v4 + 72) == -1.0e40);
    uint64_t v6 = v4;
    double result = v5;
    if (*(double *)(v5 + 72) == -1.0e40)
    {
      double result = v5;
      do
        double result = *(void *)(result + 104);
      while (*(double *)(result + 72) == -1.0e40);
      uint64_t v6 = *(void *)(result + 112);
    }
    if (*(void *)(result + 56) != *(void *)(v6 + 8))
    {
      if (*(void *)v4 < *(void *)result) {
        return v5;
      }
      return result;
    }
  }
  return result;
}

uint64_t ClipperLib::ClipperBase::ProcessBound(void *a1, uint64_t *a2, int a3, __n128 a4)
{
  if (*((_DWORD *)a2 + 25) == -2)
  {
    uint64_t v5 = (double *)a2;
    if (a3)
    {
      do
      {
        uint64_t v6 = v5;
        uint64_t v7 = *((void *)v5 + 7);
        uint64_t v5 = (double *)*((void *)v5 + 13);
      }
      while (v7 == *((void *)v5 + 1));
      if (v6 == (double *)a2) {
        goto LABEL_27;
      }
      a4.n128_u64[0] = 0xC83D6329F1C35CA5;
      while (v6[9] == -1.0e40)
      {
        uint64_t v6 = (double *)*((void *)v6 + 14);
        if (v6 == (double *)a2) {
          goto LABEL_27;
        }
      }
    }
    else
    {
      do
      {
        uint64_t v6 = v5;
        uint64_t v8 = *((void *)v5 + 7);
        uint64_t v5 = (double *)*((void *)v5 + 14);
      }
      while (v8 == *((void *)v5 + 1));
      if (v6 == (double *)a2) {
        goto LABEL_27;
      }
      a4.n128_u64[0] = 0xC83D6329F1C35CA5;
      while (v6[9] == -1.0e40)
      {
        uint64_t v6 = (double *)*((void *)v6 + 13);
        if (v6 == (double *)a2) {
          goto LABEL_27;
        }
      }
    }
    if (v6 != (double *)a2)
    {
      uint64_t v13 = 14;
      if (a3) {
        uint64_t v13 = 13;
      }
      uint64_t v14 = a2[v13];
      uint64_t v15 = *(void *)(v14 + 8);
      *(_DWORD *)(v14 + 88) = 0;
      uint64_t v16 = ClipperLib::ClipperBase::ProcessBound(a1, v14, a4);
      unint64_t v17 = a1[4];
      double v18 = (void *)a1[3];
      if ((unint64_t)v18 >= v17)
      {
        uint64_t v43 = a1[2];
        unint64_t v44 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v18 - v43) >> 3);
        unint64_t v45 = v44 + 1;
        if (v44 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v46 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v17 - v43) >> 3);
        if (2 * v46 > v45) {
          unint64_t v45 = 2 * v46;
        }
        if (v46 >= 0x555555555555555) {
          unint64_t v47 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v47 = v45;
        }
        if (v47) {
          v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)(a1 + 4), v47);
        }
        else {
          v48 = 0;
        }
        v49 = &v48[24 * v44];
        v50 = &v48[24 * v47];
        *(void *)v49 = v15;
        *((void *)v49 + 1) = 0;
        *((void *)v49 + 2) = v14;
        uint64_t v19 = v49 + 24;
        v52 = (char *)a1[2];
        v51 = (char *)a1[3];
        if (v51 != v52)
        {
          do
          {
            long long v53 = *(_OWORD *)(v51 - 24);
            *((void *)v49 - 1) = *((void *)v51 - 1);
            *(_OWORD *)(v49 - 24) = v53;
            v49 -= 24;
            v51 -= 24;
          }
          while (v51 != v52);
          v51 = (char *)a1[2];
        }
        a1[2] = v49;
        a1[3] = v19;
        a1[4] = v50;
        if (v51) {
          operator delete(v51);
        }
      }
      else
      {
        *double v18 = v15;
        v18[1] = 0;
        uint64_t v19 = v18 + 3;
        v18[2] = v14;
      }
      a1[3] = v19;
      return v16;
    }
LABEL_27:
    if (a3) {
      return a2[13];
    }
    else {
      return a2[14];
    }
  }
  if (*((double *)a2 + 9) == -1.0e40)
  {
    uint64_t v9 = 13;
    if (a3) {
      uint64_t v9 = 14;
    }
    double v10 = (double *)a2[v9];
    double v11 = *v10;
    double v12 = *(double *)a2;
    if (v10[9] == -1.0e40)
    {
      if (*(void *)&v11 == *(void *)&v12 || *((void *)v10 + 6) == *(void *)&v12) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
    if (*(void *)&v11 != *(void *)&v12)
    {
LABEL_31:
      uint64_t v20 = a2[6];
      *((double *)a2 + 6) = v12;
      *a2 = v20;
      uint64_t v21 = a2[8];
      a2[8] = a2[2];
      a2[2] = v21;
    }
  }
LABEL_32:
  uint64_t v22 = a2;
  if (a3)
  {
    do
    {
      uint64_t v23 = v22;
      uint64_t v24 = v22[7];
      uint64_t v22 = (uint64_t *)v22[13];
    }
    while (v24 == v22[1] && *((_DWORD *)v22 + 25) != -2);
    if (*((double *)v23 + 9) == -1.0e40 && *((_DWORD *)v22 + 25) != -2)
    {
      uint64_t v25 = (double *)v23;
      do
        uint64_t v25 = (double *)*((void *)v25 + 14);
      while (v25[9] == -1.0e40);
      if (*((void *)v25 + 6) > v22[6]) {
        uint64_t v23 = (uint64_t *)v25;
      }
    }
    if (v23 != a2)
    {
      double v26 = (double *)a2;
      do
      {
        double v27 = (uint64_t *)*((void *)v26 + 13);
        *((void *)v26 + 15) = v27;
        if (v26 != (double *)a2 && v26[9] == -1.0e40 && *(void *)v26 != *(void *)(*((void *)v26 + 14) + 48))
        {
          uint64_t v28 = *((void *)v26 + 6);
          v26[6] = *v26;
          *(void *)double v26 = v28;
          uint64_t v29 = *((void *)v26 + 8);
          v26[8] = v26[2];
          *((void *)v26 + 2) = v29;
        }
        double v26 = (double *)v27;
      }
      while (v27 != v23);
      if (v23 != a2 && *((double *)v23 + 9) == -1.0e40 && *v23 != *(void *)(v23[14] + 48))
      {
        uint64_t v30 = v23[6];
        v23[6] = *v23;
        *uint64_t v23 = v30;
        uint64_t v31 = v23[8];
        v23[8] = v23[2];
        v23[2] = v31;
      }
    }
    long long v32 = v23 + 13;
  }
  else
  {
    do
    {
      double v33 = v22;
      uint64_t v34 = v22[7];
      uint64_t v22 = (uint64_t *)v22[14];
    }
    while (v34 == v22[1] && *((_DWORD *)v22 + 25) != -2);
    if (*((double *)v33 + 9) == -1.0e40 && *((_DWORD *)v22 + 25) != -2)
    {
      double v35 = (double *)v33;
      do
        double v35 = (double *)*((void *)v35 + 13);
      while (v35[9] == -1.0e40);
      if (*((void *)v35 + 6) >= v22[6]) {
        double v33 = (uint64_t *)v35;
      }
    }
    if (v33 != a2)
    {
      double v36 = (double *)a2;
      do
      {
        double v37 = (uint64_t *)*((void *)v36 + 14);
        *((void *)v36 + 15) = v37;
        if (v36 != (double *)a2 && v36[9] == -1.0e40 && *(void *)v36 != *(void *)(*((void *)v36 + 13) + 48))
        {
          uint64_t v38 = *((void *)v36 + 6);
          v36[6] = *v36;
          *(void *)double v36 = v38;
          uint64_t v39 = *((void *)v36 + 8);
          v36[8] = v36[2];
          *((void *)v36 + 2) = v39;
        }
        double v36 = (double *)v37;
      }
      while (v37 != v33);
      if (v33 != a2 && *((double *)v33 + 9) == -1.0e40 && *v33 != *(void *)(v33[13] + 48))
      {
        uint64_t v40 = v33[6];
        v33[6] = *v33;
        *double v33 = v40;
        uint64_t v41 = v33[8];
        v33[8] = v33[2];
        v33[2] = v41;
      }
    }
    long long v32 = v33 + 14;
  }
  return *v32;
}

uint64_t ClipperLib::ClipperBase::AddPath(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a3 == 1 && (a4 & 1) == 0)
  {
    exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
    ClipperLib::clipperException::clipperException(exception, "AddPath: Open paths must be subject.");
  }
  uint64_t v4 = *(void **)a2;
  int v5 = -1431655765 * ((*(void *)(a2 + 8) - *(void *)a2) >> 3);
  int v6 = v5 - 1;
  if (a4 && v5 >= 2)
  {
    do
    {
      uint64_t v7 = &v4[3 * --v5];
      uint64_t v9 = *v7;
      uint64_t v8 = v7[1];
      if (v9 != *v4 || v8 != v4[1])
      {
        int v6 = v5;
        goto LABEL_12;
      }
    }
    while (v5 > 1);
    int v6 = 0;
  }
LABEL_12:
  int v11 = v6 & (v6 >> 31);
  double v12 = (int64x2_t *)&v4[3 * v6];
  while (1)
  {
    BOOL v13 = __OFSUB__(v6--, 1);
    if (v6 < 0 != v13) {
      break;
    }
    int64x2_t v14 = *v12;
    double v12 = (int64x2_t *)((char *)v12 - 24);
    int32x2_t v15 = vmovn_s64(vceqq_s64(v14, *(int64x2_t *)&v4[3 * v6]));
    if ((v15.i32[0] & v15.i32[1] & 1) == 0)
    {
      int v11 = v6 + 1;
      break;
    }
  }
  if (v11 > a4)
  {
    is_mul_ok(v11 + 1, 0xA0uLL);
    operator new[]();
  }
  return 0;
}

void sub_252A8BAE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

uint64_t ClipperLib::ClipperBase::AddPaths(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a2;
  if (a2[1] == *a2)
  {
    LOBYTE(v11) = 0;
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    int v11 = 0;
    do
    {
      v11 |= (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 16))(a1, v4 + v9, a3, a4);
      ++v10;
      uint64_t v4 = *a2;
      v9 += 24;
    }
    while (v10 < 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
  }
  return v11 & 1;
}

void *ClipperLib::ClipperBase::Clear(void *this)
{
  uint64_t v1 = this;
  uint64_t v2 = this[2];
  this[3] = v2;
  this[1] = v2;
  uint64_t v4 = this[6];
  uint64_t v3 = this[7];
  if (v3 == v4)
  {
    uint64_t v4 = this[7];
  }
  else
  {
    unint64_t v5 = 0;
    do
    {
      this = *(void **)(v4 + 8 * v5);
      if (this)
      {
        this = (void *)MEMORY[0x2533C79F0](this, 0x1020C80A8A5F671);
        uint64_t v4 = v1[6];
        uint64_t v3 = v1[7];
      }
      ++v5;
    }
    while (v5 < (v3 - v4) >> 3);
  }
  v1[7] = v4;
  *((unsigned char *)v1 + 40) = 0;
  *((unsigned char *)v1 + 73) = 0;
  return this;
}

void *ClipperLib::ClipperBase::DisposeLocalMinimaList(void *this)
{
  uint64_t v1 = this[2];
  this[3] = v1;
  this[1] = v1;
  return this;
}

void ClipperLib::ClipperBase::Reset(ClipperLib::ClipperBase *this)
{
  uint64_t v2 = *((void *)this + 2);
  uint64_t v3 = (char *)*((void *)this + 3);
  *((void *)this + 1) = v2;
  if ((char *)v2 != v3)
  {
    std::__introsort<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *,false>(v2, v3, (uint64_t)&v8, 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v3[-v2] >> 3)), 1);
    uint64_t v4 = (void *)*((void *)this + 14);
    if (v4)
    {
      *((void *)this + 15) = v4;
      operator delete(v4);
    }
    *((void *)this + 14) = 0;
    *((void *)this + 15) = 0;
    *((void *)this + 16) = 0;
    unint64_t v5 = (uint64_t *)*((void *)this + 2);
    if (v5 != *((uint64_t **)this + 3))
    {
      do
      {
        uint64_t v9 = *v5;
        std::priority_queue<long long>::push((uint64_t)this + 112, &v9);
        uint64_t v6 = v5[1];
        if (v6)
        {
          *(_OWORD *)(v6 + 24) = *(_OWORD *)v6;
          *(void *)(v6 + 40) = *(void *)(v6 + 16);
          *(_DWORD *)(v6 + 84) = 1;
          *(_DWORD *)(v6 + 100) = -1;
        }
        uint64_t v7 = v5[2];
        if (v7)
        {
          *(_OWORD *)(v7 + 24) = *(_OWORD *)v7;
          *(void *)(v7 + 40) = *(void *)(v7 + 16);
          *(_DWORD *)(v7 + 84) = 2;
          *(_DWORD *)(v7 + 100) = -1;
        }
        v5 += 3;
      }
      while (v5 != *((uint64_t **)this + 3));
      unint64_t v5 = (uint64_t *)*((void *)this + 2);
    }
    *((void *)this + 13) = 0;
    *((void *)this + 1) = v5;
  }
}

void ClipperLib::ClipperBase::InsertScanbeam(ClipperLib::ClipperBase *this, uint64_t a2)
{
  uint64_t v2 = a2;
  std::priority_queue<long long>::push((uint64_t)this + 112, &v2);
}

uint64_t ClipperLib::ClipperBase::PopLocalMinima(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 8);
  if (v3 == *(void **)(a1 + 24) || *v3 != a2) {
    return 0;
  }
  *a3 = v3;
  *(void *)(a1 + 8) += 24;
  return 1;
}

double ClipperLib::ClipperBase::GetBounds@<D0>(ClipperLib::ClipperBase *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *((void *)this + 2);
  uint64_t v3 = *((void *)this + 3);
  if (v2 == v3)
  {
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    uint64_t v4 = *(uint64_t **)(v2 + 8);
    uint64_t v6 = *v4;
    uint64_t v5 = v4[1];
    *(void *)a2 = v6;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
    uint64_t v7 = v6;
    uint64_t v8 = v5;
    do
    {
      uint64_t v9 = *(uint64_t **)(v2 + 8);
      unint64_t v10 = *(uint64_t **)(v2 + 16);
      if (v5 <= v9[1]) {
        uint64_t v5 = v9[1];
      }
      *(void *)(a2 + 24) = v5;
      int v11 = v9;
      do
      {
        double v12 = (uint64_t *)v11[15];
        if (v12)
        {
          BOOL v13 = v11;
          do
          {
            uint64_t v14 = *v13;
            BOOL v13 = v12;
            if (v14 < v6)
            {
              *(void *)a2 = v14;
              uint64_t v6 = v14;
            }
            if (v14 > v7)
            {
              *(void *)(a2 + 16) = v14;
              uint64_t v7 = v14;
            }
            double v12 = (uint64_t *)v12[15];
          }
          while (v12);
        }
        else
        {
          BOOL v13 = v11;
        }
        if (*v13 < v6) {
          uint64_t v6 = *v13;
        }
        *(void *)a2 = v6;
        if (v7 <= *v13) {
          uint64_t v7 = *v13;
        }
        *(void *)(a2 + 16) = v7;
        if (v13[6] < v6) {
          uint64_t v6 = v13[6];
        }
        *(void *)a2 = v6;
        if (v7 <= v13[6]) {
          uint64_t v7 = v13[6];
        }
        *(void *)(a2 + 16) = v7;
        uint64_t v15 = v13[7];
        if (v15 < v8) {
          uint64_t v8 = v15;
        }
        *(void *)(a2 + 8) = v8;
        BOOL v16 = v11 == v9;
        int v11 = v10;
      }
      while (v16);
      v2 += 24;
    }
    while (v2 != v3);
  }
  return result;
}

void std::priority_queue<long long>::push(uint64_t a1, void *a2)
{
  uint64_t v4 = a1 + 16;
  unint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void **)(a1 + 8);
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v8 = *(void **)a1;
    uint64_t v9 = ((uint64_t)v6 - *(void *)a1) >> 3;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      BOOL v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>(v4, v12);
      uint64_t v8 = *(void **)a1;
      uint64_t v6 = *(void **)(a1 + 8);
    }
    else
    {
      BOOL v13 = 0;
    }
    uint64_t v14 = &v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    *(void *)uint64_t v14 = *a2;
    uint64_t v7 = v14 + 8;
    while (v6 != v8)
    {
      uint64_t v16 = *--v6;
      *((void *)v14 - 1) = v16;
      v14 -= 8;
    }
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *uint64_t v6 = *a2;
    uint64_t v7 = v6 + 1;
  }
  *(void *)(a1 + 8) = v7;
  unint64_t v17 = *(void **)a1;
  uint64_t v18 = (uint64_t)v7 - *(void *)a1;
  if (v18 >= 9)
  {
    unint64_t v19 = (((unint64_t)v18 >> 3) - 2) >> 1;
    uint64_t v20 = &v17[v19];
    uint64_t v23 = *(v7 - 1);
    uint64_t v22 = v7 - 1;
    uint64_t v21 = v23;
    uint64_t v24 = *v20;
    if (*v20 < v23)
    {
      do
      {
        *uint64_t v22 = v24;
        uint64_t v22 = v20;
        if (!v19) {
          break;
        }
        unint64_t v19 = (v19 - 1) >> 1;
        uint64_t v20 = &v17[v19];
        uint64_t v24 = *v20;
      }
      while (*v20 < v21);
      *uint64_t v22 = v21;
    }
  }
}

BOOL ClipperLib::ClipperBase::PopScanbeam(ClipperLib::ClipperBase *this, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)*((void *)this + 14);
  uint64_t v3 = (uint64_t *)*((void *)this + 15);
  if (v2 != v3)
  {
    *a2 = *v2;
    uint64_t v4 = (char *)v3 - (char *)v2;
    if ((char *)v3 - (char *)v2 >= 9)
    {
      uint64_t v5 = 0;
      uint64_t v6 = v4 >> 3;
      uint64_t v7 = *v2;
      int64_t v8 = (unint64_t)((v4 >> 3) - 2) >> 1;
      uint64_t v9 = v2;
      do
      {
        unint64_t v10 = &v9[v5 + 1];
        uint64_t v11 = (2 * v5) | 1;
        uint64_t v5 = 2 * v5 + 2;
        if (v5 >= v6)
        {
          uint64_t v12 = *v10;
          uint64_t v5 = v11;
        }
        else
        {
          uint64_t v12 = *v10;
          uint64_t v13 = v10[1];
          if (*v10 <= v13) {
            uint64_t v12 = v10[1];
          }
          if (*v10 >= v13) {
            uint64_t v5 = v11;
          }
          else {
            ++v10;
          }
        }
        *uint64_t v9 = v12;
        uint64_t v9 = v10;
      }
      while (v5 <= v8);
      uint64_t v14 = v3 - 1;
      if (v10 == v3 - 1)
      {
        *unint64_t v10 = v7;
      }
      else
      {
        *unint64_t v10 = *v14;
        *uint64_t v14 = v7;
        uint64_t v15 = (char *)v10 - (char *)v2 + 8;
        if (v15 >= 9)
        {
          unint64_t v16 = (((unint64_t)v15 >> 3) - 2) >> 1;
          unint64_t v17 = &v2[v16];
          uint64_t v18 = *v17;
          uint64_t v19 = *v10;
          if (*v17 < *v10)
          {
            do
            {
              *unint64_t v10 = v18;
              unint64_t v10 = v17;
              if (!v16) {
                break;
              }
              unint64_t v16 = (v16 - 1) >> 1;
              unint64_t v17 = &v2[v16];
              uint64_t v18 = *v17;
            }
            while (*v17 < v19);
            *unint64_t v10 = v19;
          }
        }
      }
    }
    uint64_t v20 = v3 - 1;
    if (v2 == v3 - 1)
    {
LABEL_40:
      uint64_t v21 = v2;
    }
    else
    {
      uint64_t v21 = v3;
      while (1)
      {
        uint64_t v22 = v21;
        uint64_t v21 = v20;
        uint64_t v23 = *a2;
        if (*a2 != *v2) {
          break;
        }
        uint64_t v24 = (char *)v20 - (char *)v2;
        if ((char *)v21 - (char *)v2 >= 9)
        {
          uint64_t v25 = 0;
          uint64_t v26 = v24 >> 3;
          int64_t v27 = (unint64_t)((v24 >> 3) - 2) >> 1;
          uint64_t v28 = v2;
          do
          {
            uint64_t v29 = &v28[v25 + 1];
            uint64_t v30 = (2 * v25) | 1;
            uint64_t v25 = 2 * v25 + 2;
            if (v25 >= v26)
            {
              uint64_t v31 = *v29;
              uint64_t v25 = v30;
            }
            else
            {
              uint64_t v31 = *v29;
              uint64_t v32 = v29[1];
              if (*v29 <= v32) {
                uint64_t v31 = v29[1];
              }
              if (*v29 >= v32) {
                uint64_t v25 = v30;
              }
              else {
                ++v29;
              }
            }
            uint64_t *v28 = v31;
            uint64_t v28 = v29;
          }
          while (v25 <= v27);
          double v33 = v22 - 2;
          if (v29 == v33)
          {
            uint64_t *v29 = v23;
          }
          else
          {
            uint64_t *v29 = *v33;
            *double v33 = v23;
            uint64_t v34 = (char *)v29 - (char *)v2 + 8;
            if (v34 >= 9)
            {
              unint64_t v35 = (((unint64_t)v34 >> 3) - 2) >> 1;
              double v36 = &v2[v35];
              uint64_t v37 = *v36;
              uint64_t v38 = *v29;
              if (*v36 < *v29)
              {
                do
                {
                  uint64_t *v29 = v37;
                  uint64_t v29 = v36;
                  if (!v35) {
                    break;
                  }
                  unint64_t v35 = (v35 - 1) >> 1;
                  double v36 = &v2[v35];
                  uint64_t v37 = *v36;
                }
                while (*v36 < v38);
                uint64_t *v29 = v38;
              }
            }
          }
        }
        uint64_t v20 = v21 - 1;
        if (v2 == v21 - 1) {
          goto LABEL_40;
        }
      }
    }
    *((void *)this + 15) = v21;
  }
  return v2 != v3;
}

ClipperLib::ClipperBase *ClipperLib::ClipperBase::DisposeAllOutRecs(ClipperLib::ClipperBase *this)
{
  uint64_t v1 = this;
  uint64_t v2 = *((void *)this + 11);
  if (v2 != *((void *)this + 10))
  {
    unint64_t v3 = 0;
    do
    {
      this = (ClipperLib::ClipperBase *)ClipperLib::ClipperBase::DisposeOutRec(v1, v3++);
      uint64_t v2 = *((void *)v1 + 10);
    }
    while (v3 < (*((void *)v1 + 11) - v2) >> 3);
  }
  *((void *)v1 + 11) = v2;
  return this;
}

uint64_t ClipperLib::ClipperBase::DisposeOutRec(ClipperLib::ClipperBase *this, uint64_t a2)
{
  uint64_t v4 = *(void *)(*((void *)this + 10) + 8 * a2);
  if (*(void *)(v4 + 24)) {
    ClipperLib::DisposeOutPts((void *)(v4 + 24));
  }
  uint64_t result = MEMORY[0x2533C7A10](v4, 0x1020C401FC46325);
  *(void *)(*((void *)this + 10) + 8 * a2) = 0;
  return result;
}

uint64_t ClipperLib::ClipperBase::DeleteFromAEL(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 128);
  uint64_t v3 = *(void *)(a2 + 136);
  if (*(_OWORD *)(a2 + 128) == 0)
  {
    if (*(void *)(result + 104) != a2) {
      return result;
    }
    goto LABEL_5;
  }
  if (!v3)
  {
LABEL_5:
    uint64_t v4 = (void *)(result + 104);
    goto LABEL_6;
  }
  uint64_t v4 = (void *)(v3 + 128);
LABEL_6:
  *uint64_t v4 = v2;
  if (v2) {
    *(void *)(v2 + 136) = v3;
  }
  *(void *)(a2 + 128) = 0;
  *(void *)(a2 + 136) = 0;
  return result;
}

void ClipperLib::ClipperBase::CreateOutRec(ClipperLib::ClipperBase *this)
{
}

uint64_t ClipperLib::ClipperBase::SwapPositionsInAEL(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 128);
  uint64_t v3 = *(void *)(a2 + 136);
  if (v4 != v3)
  {
    uint64_t v6 = *(void *)(a3 + 128);
    uint64_t v5 = *(void *)(a3 + 136);
    if (v6 != v5)
    {
      if (v4 == a3)
      {
        if (v6)
        {
          *(void *)(v6 + 136) = a2;
          uint64_t v3 = *(void *)(a2 + 136);
        }
        if (v3) {
          *(void *)(v3 + 128) = a3;
        }
        *(void *)(a3 + 128) = a2;
        *(void *)(a3 + 136) = v3;
        *(void *)(a2 + 128) = v6;
        *(void *)(a2 + 136) = a3;
        uint64_t v3 = *(void *)(a3 + 136);
      }
      else
      {
        if (v6 == a2)
        {
          if (v4)
          {
            *(void *)(v4 + 136) = a3;
            uint64_t v5 = *(void *)(a3 + 136);
          }
          if (v5) {
            *(void *)(v5 + 128) = a2;
          }
          *(void *)(a2 + 128) = a3;
          *(void *)(a2 + 136) = v5;
          uint64_t v3 = a2;
          *(void *)(a3 + 128) = v4;
          *(void *)(a3 + 136) = a2;
        }
        else
        {
          *(void *)(a2 + 128) = v6;
          if (v6)
          {
            *(void *)(v6 + 136) = a2;
            uint64_t v5 = *(void *)(a3 + 136);
          }
          *(void *)(a2 + 136) = v5;
          if (v5) {
            *(void *)(v5 + 128) = a2;
          }
          *(void *)(a3 + 128) = v4;
          if (v4) {
            *(void *)(v4 + 136) = a3;
          }
          *(void *)(a3 + 136) = v3;
          if (v3) {
            *(void *)(v3 + 128) = a3;
          }
        }
        if (!*(void *)(a2 + 136)) {
          goto LABEL_26;
        }
      }
      a2 = a3;
      if (v3) {
        return result;
      }
LABEL_26:
      *(void *)(result + 104) = a2;
    }
  }
  return result;
}

void ClipperLib::ClipperBase::UpdateEdgeIntoAEL(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = *(void *)(*a2 + 120);
  if (!v3)
  {
    exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
    ClipperLib::clipperException::clipperException(exception, "UpdateEdgeIntoAEL: invalid call");
  }
  *(_DWORD *)(v3 + 100) = *(_DWORD *)(v2 + 100);
  uint64_t v6 = v2 + 128;
  uint64_t v5 = *(void *)(v2 + 128);
  uint64_t v4 = *(void *)(v6 + 8);
  uint64_t v7 = (void *)(a1 + 104);
  if (v4) {
    uint64_t v7 = (void *)(v4 + 128);
  }
  *uint64_t v7 = v3;
  if (v5) {
    *(void *)(v5 + 136) = *(void *)(*a2 + 120);
  }
  uint64_t v8 = *(void *)(*a2 + 120);
  *(_OWORD *)(v8 + 84) = *(_OWORD *)(*a2 + 84);
  *a2 = v8;
  *(_OWORD *)(v8 + 24) = *(_OWORD *)v8;
  *(void *)(v8 + 40) = *(void *)(v8 + 16);
  *(void *)(*a2 + 136) = v4;
  *(void *)(*a2 + 128) = v5;
  if (*(double *)(*a2 + 72) != -1.0e40)
  {
    uint64_t v10 = *(void *)(*a2 + 56);
    std::priority_queue<long long>::push(a1 + 112, &v10);
  }
}

void sub_252A8C654(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ClipperLib::ClipperBase::LocalMinimaPending(ClipperLib::ClipperBase *this)
{
  return *((void *)this + 1) != *((void *)this + 3);
}

ClipperLib *ClipperLib::Clipper::Clipper(ClipperLib *this, uint64_t *a2, char a3)
{
  uint64_t v3 = *a2;
  *(void *)this = *a2;
  *(void *)((char *)this + *(void *)(v3 - 24)) = a2[1];
  *((void *)this + 9) = 0;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 8) = 0u;
  *((void *)this + 11) = (char *)this + 88;
  *((void *)this + 12) = (char *)this + 88;
  *((void *)this + 13) = 0;
  *((unsigned char *)this + 120) = 0;
  uint64_t v4 = *(void *)this;
  *((unsigned char *)this + *(void *)(*(void *)this - 24) + 40) = 0;
  *((unsigned char *)this + 132) = a3 & 1;
  *((unsigned char *)this + 134) = (a3 & 2) != 0;
  *((unsigned char *)this + *(void *)(v4 - 24) + 72) = (a3 & 4) != 0;
  *((unsigned char *)this + *(void *)(v4 - 24) + 73) = 0;
  *((void *)this + 17) = 0;
  return this;
}

double ClipperLib::Clipper::Clipper(ClipperLib::Clipper *this, char a2)
{
  *((void *)this + 24) = 0;
  *((void *)this + 25) = 0;
  *((void *)this + 26) = 0;
  *((void *)this + 29) = 0;
  *((void *)this + 30) = 0;
  *((void *)this + 28) = 0;
  *((void *)this + 33) = 0;
  *((void *)this + 34) = 0;
  *((void *)this + 32) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(void *)this = &unk_2702F8E50;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((void *)this + 9) = 0;
  *((void *)this + 11) = (char *)this + 88;
  *((void *)this + 12) = (char *)this + 88;
  *((void *)this + 13) = 0;
  *((unsigned char *)this + 120) = 0;
  *((unsigned char *)this + 184) = 0;
  *((unsigned char *)this + 132) = a2 & 1;
  *((unsigned char *)this + 134) = (a2 & 2) != 0;
  *((unsigned char *)this + 216) = (a2 & 4) != 0;
  *((unsigned char *)this + 217) = 0;
  *((void *)this + 17) = 0;
  *((void *)this + 18) = &unk_2702F8E98;
  return result;
}

uint64_t ClipperLib::Clipper::ZFillFunction(uint64_t result, uint64_t a2)
{
  *(void *)(result + 136) = a2;
  return result;
}

uint64_t ClipperLib::Clipper::Execute(uint64_t a1, int a2, uint64_t *a3, int a4)
{
  return ClipperLib::Clipper::Execute(a1, a2, a3, a4, a4);
}

uint64_t ClipperLib::Clipper::Execute(uint64_t a1, int a2, uint64_t *a3, int a4, int a5)
{
  if (*(unsigned char *)(a1 + 120)) {
    return 0;
  }
  if (*(unsigned char *)(a1 + *(void *)(*(void *)a1 - 24) + 73))
  {
    exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
    ClipperLib::clipperException::clipperException(exception, "Error: PolyTree struct is needed for open path clipping.");
  }
  *(unsigned char *)(a1 + 120) = 1;
  std::vector<std::vector<ClipperLib::IntPoint>>::resize(a3, 0);
  *(_DWORD *)(a1 + 124) = a5;
  *(_DWORD *)(a1 + 128) = a4;
  *(_DWORD *)(a1 + 80) = a2;
  *(unsigned char *)(a1 + 133) = 0;
  uint64_t v5 = (**(uint64_t (***)(uint64_t))a1)(a1);
  if (v5) {
    ClipperLib::Clipper::BuildResult((uint64_t *)a1, a3);
  }
  ClipperLib::ClipperBase::DisposeAllOutRecs((ClipperLib::ClipperBase *)(a1 + *(void *)(*(void *)a1 - 24)));
  *(unsigned char *)(a1 + 120) = 0;
  return v5;
}

void sub_252A8C998(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ClipperLib::Clipper::Execute(uint64_t a1, int a2, void **a3, int a4)
{
  return ClipperLib::Clipper::Execute(a1, a2, a3, a4, a4);
}

uint64_t ClipperLib::Clipper::Execute(uint64_t a1, int a2, void **a3, int a4, int a5)
{
  if (*(unsigned char *)(a1 + 120)) {
    return 0;
  }
  *(unsigned char *)(a1 + 120) = 1;
  *(_DWORD *)(a1 + 124) = a5;
  *(_DWORD *)(a1 + 128) = a4;
  *(_DWORD *)(a1 + 80) = a2;
  *(unsigned char *)(a1 + 133) = 1;
  uint64_t v5 = (**(uint64_t (***)(void))a1)();
  if (v5) {
    ClipperLib::Clipper::BuildResult2((ClipperLib::Clipper *)a1, a3);
  }
  ClipperLib::ClipperBase::DisposeAllOutRecs((ClipperLib::ClipperBase *)(a1 + *(void *)(*(void *)a1 - 24)));
  *(unsigned char *)(a1 + 120) = 0;
  return v5;
}

void std::vector<std::vector<ClipperLib::IntPoint>>::resize(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  BOOL v5 = a2 >= v4;
  unint64_t v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    std::vector<std::vector<ClipperLib::IntPoint>>::__append(a1, v6);
  }
  else if (!v5)
  {
    uint64_t v7 = *a1 + 24 * a2;
    if (v3 != v7)
    {
      uint64_t v8 = a1[1];
      do
      {
        uint64_t v10 = *(void **)(v8 - 24);
        v8 -= 24;
        uint64_t v9 = v10;
        if (v10)
        {
          *(void *)(v3 - 16) = v9;
          operator delete(v9);
        }
        uint64_t v3 = v8;
      }
      while (v8 != v7);
    }
    a1[1] = v7;
  }
}

void ClipperLib::Clipper::BuildResult(uint64_t *a1, uint64_t *a2)
{
  std::vector<std::vector<ClipperLib::IntPoint>>::reserve(a2, (*(uint64_t *)((char *)a1 + *(void *)(*a1 - 24) + 88) - *(uint64_t *)((char *)a1 + *(void *)(*a1 - 24) + 80)) >> 3);
  uint64_t v4 = *a1;
  BOOL v5 = (void *)(*a1 - 24);
  uint64_t v6 = *(uint64_t *)((char *)a1 + *v5 + 80);
  if (*(uint64_t *)((char *)a1 + *v5 + 88) != v6)
  {
    unint64_t v7 = 0;
    uint64_t v28 = a2;
    do
    {
      if (*(void *)(*(void *)(v6 + 8 * v7) + 24))
      {
        __p = 0;
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        uint64_t v8 = *(void *)(*(void *)(*(uint64_t *)((char *)a1 + *v5 + 80) + 8 * v7) + 24);
        uint64_t v9 = *(void *)(v8 + 40);
        if (v9)
        {
          unint64_t v10 = 0;
          uint64_t v11 = *(void *)(v8 + 40);
          do
          {
            uint64_t v11 = *(void *)(v11 + 32);
            ++v10;
          }
          while (v11 != v9);
          if (v10 != 1)
          {
            std::vector<ClipperLib::IntPoint>::reserve(&__p, v10);
            int v12 = 0;
            uint64_t v13 = v30;
            do
            {
              uint64_t v14 = (long long *)(v9 + 8);
              if (v13 >= v31)
              {
                unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v13 - (unsigned char *)__p) >> 3);
                unint64_t v17 = v16 + 1;
                if (v16 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
                }
                if (0x5555555555555556 * ((v31 - (unsigned char *)__p) >> 3) > v17) {
                  unint64_t v17 = 0x5555555555555556 * ((v31 - (unsigned char *)__p) >> 3);
                }
                if (0xAAAAAAAAAAAAAAABLL * ((v31 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
                  unint64_t v18 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v18 = v17;
                }
                if (v18) {
                  uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)&v31, v18);
                }
                else {
                  uint64_t v19 = 0;
                }
                uint64_t v20 = &v19[24 * v16];
                long long v21 = *v14;
                *((void *)v20 + 2) = *(void *)(v9 + 24);
                *(_OWORD *)uint64_t v20 = v21;
                uint64_t v23 = (char *)__p;
                uint64_t v22 = v30;
                uint64_t v24 = v20;
                if (v30 != __p)
                {
                  do
                  {
                    long long v25 = *(_OWORD *)(v22 - 24);
                    *((void *)v24 - 1) = *((void *)v22 - 1);
                    *(_OWORD *)(v24 - 24) = v25;
                    v24 -= 24;
                    v22 -= 24;
                  }
                  while (v22 != v23);
                  uint64_t v22 = (char *)__p;
                }
                uint64_t v13 = v20 + 24;
                __p = v24;
                uint64_t v30 = v20 + 24;
                uint64_t v31 = &v19[24 * v18];
                if (v22) {
                  operator delete(v22);
                }
              }
              else
              {
                long long v15 = *v14;
                *((void *)v13 + 2) = *(void *)(v9 + 24);
                *(_OWORD *)uint64_t v13 = v15;
                v13 += 24;
              }
              uint64_t v30 = v13;
              uint64_t v9 = *(void *)(v9 + 40);
              ++v12;
            }
            while (v10 != v12);
            unint64_t v26 = v28[1];
            if (v26 >= v28[2])
            {
              uint64_t v27 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v28, (uint64_t)&__p);
            }
            else
            {
              std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v28, (uint64_t)&__p);
              uint64_t v27 = v26 + 24;
            }
            v28[1] = v27;
            if (__p)
            {
              uint64_t v30 = (char *)__p;
              operator delete(__p);
            }
          }
        }
        uint64_t v4 = *a1;
      }
      ++v7;
      BOOL v5 = (void *)(v4 - 24);
      uint64_t v6 = *(uint64_t *)((char *)a1 + *(void *)(v4 - 24) + 80);
    }
    while (v7 < (*(uint64_t *)((char *)a1 + *(void *)(v4 - 24) + 88) - v6) >> 3);
  }
}

void sub_252A8CDC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ClipperLib::Clipper::BuildResult2(ClipperLib::Clipper *this, void **a2)
{
  ClipperLib::PolyTree::Clear((ClipperLib::PolyTree *)a2);
  std::vector<ClipperLib::PolyNode *>::reserve(a2 + 10, (uint64_t)(*(void *)((char *)this + *(void *)(*(void *)this - 24) + 88)- *(void *)((char *)this + *(void *)(*(void *)this - 24) + 80)) >> 3);
  uint64_t v5 = *(void *)((char *)this + *(void *)(*(void *)this - 24) + 80);
  if (*(void *)((char *)this + *(void *)(*(void *)this - 24) + 88) == v5)
  {
    unint64_t v13 = 0;
  }
  else
  {
    unint64_t v6 = 0;
    uint64_t v20 = this;
    do
    {
      uint64_t v7 = *(void *)(v5 + 8 * v6);
      uint64_t v8 = *(void *)(v7 + 24);
      if (v8)
      {
        int v9 = 0;
        uint64_t v10 = *(void *)(v7 + 24);
        do
        {
          uint64_t v10 = *(void *)(v10 + 32);
          --v9;
        }
        while (v10 != v8);
        unsigned int v11 = *(unsigned char *)(v7 + 5) ? 1 : 2;
        if (~v9 >= v11)
        {
          ClipperLib::Clipper::FixHoleLinkage(v4, v7);
          operator new();
        }
      }
      ++v6;
      this = v20;
      uint64_t v5 = *(void *)((char *)v20 + *(void *)(*(void *)v20 - 24) + 80);
      uint64_t v12 = *(void *)((char *)v20 + *(void *)(*(void *)v20 - 24) + 88) - v5;
    }
    while (v6 < v12 >> 3);
    unint64_t v13 = v12 >> 3;
  }
  std::vector<ClipperLib::PolyNode *>::reserve(a2 + 4, v13);
  uint64_t v14 = *(void *)((char *)this + *(void *)(*(void *)this - 24) + 80);
  if (*(void *)((char *)this + *(void *)(*(void *)this - 24) + 88) != v14)
  {
    unint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = *(void *)(v14 + 8 * v15);
      unint64_t v17 = *(ClipperLib::PolyNode **)(v16 + 16);
      if (v17) {
        break;
      }
LABEL_21:
      ++v15;
      uint64_t v14 = *(void *)((char *)this + *(void *)(*(void *)this - 24) + 80);
      if (v15 >= (*(void *)((char *)this + *(void *)(*(void *)this - 24) + 88) - v14) >> 3) {
        return;
      }
    }
    if (*(unsigned char *)(v16 + 5))
    {
      *((unsigned char *)v17 + 68) = 1;
    }
    else
    {
      uint64_t v19 = *(void *)(v16 + 8);
      if (v19)
      {
        unint64_t v18 = *(ClipperLib::PolyNode **)(v19 + 16);
        if (v18) {
          goto LABEL_20;
        }
      }
    }
    unint64_t v18 = (ClipperLib::PolyNode *)a2;
LABEL_20:
    ClipperLib::PolyNode::AddChild(v18, v17);
    goto LABEL_21;
  }
}

void ClipperLib::Clipper::FixHoleLinkage(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  if (v2)
  {
    int v3 = *(unsigned __int8 *)(a2 + 4);
    if (v3 == *(unsigned __int8 *)(v2 + 4) || !*(void *)(v2 + 24))
    {
      do
      {
        if (*(unsigned __int8 *)(v2 + 4) != v3 && *(void *)(v2 + 24)) {
          break;
        }
        uint64_t v2 = *(void *)(v2 + 8);
      }
      while (v2);
      *(void *)(a2 + 8) = v2;
    }
  }
}

uint64_t ClipperLib::Clipper::ExecuteInternal(ClipperLib::Clipper *this)
{
  (*(void (**)(char *))(*(void *)((char *)this + *(void *)(*(void *)this - 24)) + 32))((char *)this + *(void *)(*(void *)this - 24));
  v19[0] = (uint64_t)v19;
  v19[1] = (uint64_t)v19;
  v19[2] = 0;
  std::list<long long>::__move_assign((uint64_t *)this + 11, v19);
  std::__list_imp<long long>::clear(v19);
  *((void *)this + 14) = 0;
  uint64_t v18 = 0;
  v19[0] = 0;
  if (!ClipperLib::ClipperBase::PopScanbeam((ClipperLib::Clipper *)((char *)this + *(void *)(*(void *)this - 24)), v19))return 0; {
  ClipperLib::Clipper::InsertLocalMinimaIntoAEL(this, v19[0]);
  }
  while (1)
  {
    uint64_t v2 = ClipperLib::ClipperBase::PopScanbeam((ClipperLib::Clipper *)((char *)this + *(void *)(*(void *)this - 24)), &v18);
    if ((v2 & 1) == 0
      && *(void *)((char *)this + *(void *)(*(void *)this - 24) + 8) == *(void *)((char *)this
                                                                                          + *(void *)(*(void *)this - 24)
                                                                                          + 24))
    {
      break;
    }
    ClipperLib::Clipper::ProcessHorizontals(this);
    ClipperLib::Clipper::ClearGhostJoins(this);
    uint64_t v3 = v18;
    if (!ClipperLib::Clipper::ProcessIntersections(this, v18))
    {
      uint64_t v4 = 0;
      goto LABEL_30;
    }
    ClipperLib::Clipper::ProcessEdgesAtTopOfScanbeam(this, v3);
    ClipperLib::Clipper::InsertLocalMinimaIntoAEL(this, v3);
  }
  uint64_t v5 = *(void *)this;
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *(void *)(*(void *)this - 24);
  uint64_t v8 = *(void *)((char *)this + v7 + 80);
  if (*(void *)((char *)this + v7 + 88) != v8)
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v2 = *(void *)(v8 + 8 * v9);
      uint64_t v10 = *(int8x16_t **)(v2 + 24);
      if (v10)
      {
        if (!*(unsigned char *)(v2 + 5))
        {
          int v11 = *((unsigned __int8 *)this + 132) ^ *(unsigned __int8 *)(v2 + 4);
          if (v11 == ClipperLib::Area(v2) > 0.0)
          {
            uint64_t v12 = v10;
            do
            {
              int8x16_t v13 = v12[2];
              unint64_t v12[2] = vextq_s8(v13, v13, 8uLL);
              uint64_t v12 = (int8x16_t *)v13.i64[0];
            }
            while ((int8x16_t *)v13.i64[0] != v10);
            uint64_t v7 = *(void *)(v6 - 24);
          }
        }
      }
      ++v9;
      uint64_t v8 = *(void *)((char *)this + v7 + 80);
    }
    while (v9 < (*(void *)((char *)this + v7 + 88) - v8) >> 3);
  }
  if (*((void *)this + 1) != *((void *)this + 2))
  {
    uint64_t v2 = ClipperLib::Clipper::JoinCommonEdges((uint64_t)this);
    uint64_t v5 = *(void *)this;
  }
  uint64_t v14 = *(void *)((char *)this + *(void *)(v5 - 24) + 80);
  if (*(void *)((char *)this + *(void *)(v5 - 24) + 88) != v14)
  {
    unint64_t v15 = 0;
    do
    {
      uint64_t v16 = *(void *)(v14 + 8 * v15);
      if (*(void *)(v16 + 24))
      {
        if (*(unsigned char *)(v16 + 5)) {
          uint64_t v2 = (uint64_t)ClipperLib::Clipper::FixupOutPolyline(v2, v16);
        }
        else {
          uint64_t v2 = ClipperLib::Clipper::FixupOutPolygon((uint64_t)this, v16);
        }
      }
      ++v15;
      uint64_t v14 = *(void *)((char *)this + *(void *)(*(void *)this - 24) + 80);
    }
    while (v15 < (*(void *)((char *)this + *(void *)(*(void *)this - 24) + 88) - v14) >> 3);
  }
  if (*((unsigned char *)this + 134)) {
    ClipperLib::Clipper::DoSimplePolygons((uint64_t *)this);
  }
  uint64_t v4 = 1;
LABEL_30:
  ClipperLib::Clipper::ClearJoins(this);
  ClipperLib::Clipper::ClearGhostJoins(this);
  return v4;
}

void ClipperLib::Clipper::InsertLocalMinimaIntoAEL(ClipperLib::Clipper *this, uint64_t a2)
{
  uint64_t v2 = (char *)this + 40;
  uint64_t v3 = (char *)this + *(void *)(*(void *)this - 24);
  uint64_t v6 = (void *)*((void *)v3 + 1);
  uint64_t v4 = v3 + 8;
  uint64_t v5 = v6;
  if (v6 != (void *)v4[2])
  {
    unint64_t v9 = (uint64_t *)((char *)this + 112);
    do
    {
      if (*v5 != a2) {
        return;
      }
      *uint64_t v4 = v5 + 3;
      uint64_t v10 = v5[1];
      uint64_t v11 = v5[2];
      if (v10)
      {
        ClipperLib::Clipper::InsertEdgeIntoAEL((uint64_t *)this, v5[1], 0);
        if (!v11)
        {
          ClipperLib::Clipper::SetWindingCount((uint64_t)this, v10);
          if (ClipperLib::Clipper::IsContributing((uint64_t)this, (_DWORD *)v10)) {
            ClipperLib::Clipper::AddOutPt(this, v10, (void *)v10);
          }
          uint64_t v13 = *(void *)(*(void *)this - 24);
          uint64_t v60 = *(void *)(v10 + 56);
          std::priority_queue<long long>::push((uint64_t)v9 + v13, &v60);
          goto LABEL_67;
        }
        ClipperLib::Clipper::InsertEdgeIntoAEL((uint64_t *)this, v11, v10);
        ClipperLib::Clipper::SetWindingCount((uint64_t)this, v10);
        *(void *)(v11 + 92) = *(void *)(v10 + 92);
        if (ClipperLib::Clipper::IsContributing((uint64_t)this, (_DWORD *)v10)) {
          uint64_t v12 = ClipperLib::Clipper::AddLocalMinPoly(this, v10, v11, (void *)v10);
        }
        else {
          uint64_t v12 = 0;
        }
        uint64_t v14 = *(void *)(*(void *)this - 24);
        uint64_t v60 = *(void *)(v10 + 56);
        std::priority_queue<long long>::push((uint64_t)v9 + v14, &v60);
      }
      else
      {
        ClipperLib::Clipper::InsertEdgeIntoAEL((uint64_t *)this, v5[2], 0);
        ClipperLib::Clipper::SetWindingCount((uint64_t)this, v11);
        uint64_t v12 = 0;
        if (ClipperLib::Clipper::IsContributing((uint64_t)this, (_DWORD *)v11)) {
          uint64_t v12 = ClipperLib::Clipper::AddOutPt(this, v11, (void *)v11);
        }
        if (!v11) {
          goto LABEL_67;
        }
      }
      if (*(double *)(v11 + 72) == -1.0e40)
      {
        uint64_t v15 = *v9;
        *(void *)(v11 + 152) = 0;
        if (v15) {
          *(void *)(v15 + 152) = v11;
        }
        *unint64_t v9 = v11;
        *(void *)(v11 + 144) = v15;
        uint64_t v16 = *(void *)(v11 + 120);
        if (!v16) {
          goto LABEL_24;
        }
        uint64_t v17 = *(void *)(*(void *)this - 24);
        uint64_t v60 = *(void *)(v16 + 56);
        uint64_t v18 = (uint64_t)v9 + v17;
      }
      else
      {
        uint64_t v19 = *(void *)(*(void *)this - 24);
        uint64_t v60 = *(void *)(v11 + 56);
        uint64_t v18 = (uint64_t)v9 + v19;
      }
      std::priority_queue<long long>::push(v18, &v60);
LABEL_24:
      if (v10)
      {
        if (v12)
        {
          if (*(double *)(v11 + 72) == -1.0e40)
          {
            uint64_t v21 = *((void *)this + 4);
            uint64_t v20 = *((void *)this + 5);
            if (v20 != v21)
            {
              if (*(_DWORD *)(v11 + 88))
              {
                unint64_t v22 = 0;
                do
                {
                  uint64_t v23 = *(void **)(v21 + 8 * v22);
                  uint64_t v24 = *(void *)(*v23 + 8);
                  uint64_t v27 = v23[2];
                  long long v25 = v23 + 2;
                  uint64_t v26 = v27;
                  uint64_t v28 = *(void *)v11;
                  uint64_t v29 = *(void *)(v11 + 48);
                  BOOL v30 = v24 <= v27;
                  if (v24 >= v27) {
                    uint64_t v31 = v26;
                  }
                  else {
                    uint64_t v31 = v24;
                  }
                  if (v30) {
                    uint64_t v24 = v26;
                  }
                  if (v28 >= v29) {
                    uint64_t v32 = *(void *)(v11 + 48);
                  }
                  else {
                    uint64_t v32 = *(void *)v11;
                  }
                  if (v28 <= v29) {
                    uint64_t v28 = *(void *)(v11 + 48);
                  }
                  if (v31 < v28 && v32 < v24)
                  {
                    long long v58 = *(_OWORD *)v25;
                    uint64_t v59 = v25[2];
                    ClipperLib::Clipper::AddJoin();
                  }
                  ++v22;
                }
                while (v22 < (v20 - v21) >> 3);
              }
            }
          }
        }
        if ((*(_DWORD *)(v10 + 100) & 0x80000000) == 0)
        {
          uint64_t v34 = *(void *)(v10 + 136);
          if (v34)
          {
            if (*(void *)(v34 + 24) == *(void *)v10 && (*(_DWORD *)(v34 + 100) & 0x80000000) == 0)
            {
              long long v56 = *(_OWORD *)v34;
              uint64_t v57 = *(void *)(v34 + 16);
              long long v54 = *(_OWORD *)(v34 + 48);
              uint64_t v55 = *(void *)(v34 + 64);
              long long v52 = *(_OWORD *)(v10 + 24);
              uint64_t v53 = *(void *)(v10 + 40);
              uint64_t v51 = *(void *)(v10 + 64);
              long long v50 = *(_OWORD *)(v10 + 48);
              if (ClipperLib::SlopesEqual(&v56, &v54, &v52, &v50, v2[*(void *)(*(void *)this - 24)])&& *(_DWORD *)(v10 + 88)&& *(_DWORD *)(v34 + 88))
              {
                ClipperLib::Clipper::AddOutPt(this, v34, (void *)v10);
                long long v48 = *(_OWORD *)(v10 + 48);
                uint64_t v49 = *(void *)(v10 + 64);
                ClipperLib::Clipper::AddJoin();
              }
            }
          }
        }
        uint64_t v35 = *(void *)(v10 + 128);
        if (v35 != v11)
        {
          if ((*(_DWORD *)(v11 + 100) & 0x80000000) == 0)
          {
            uint64_t v36 = *(void *)(v11 + 136);
            if ((*(_DWORD *)(v36 + 100) & 0x80000000) == 0)
            {
              long long v46 = *(_OWORD *)(v36 + 24);
              uint64_t v47 = *(void *)(v36 + 40);
              long long v44 = *(_OWORD *)(v36 + 48);
              uint64_t v45 = *(void *)(v36 + 64);
              long long v42 = *(_OWORD *)(v11 + 24);
              uint64_t v43 = *(void *)(v11 + 40);
              uint64_t v41 = *(void *)(v11 + 64);
              long long v40 = *(_OWORD *)(v11 + 48);
              if (ClipperLib::SlopesEqual(&v46, &v44, &v42, &v40, v2[*(void *)(*(void *)this - 24)])&& *(_DWORD *)(v11 + 88)&& *(_DWORD *)(v36 + 88))
              {
                ClipperLib::Clipper::AddOutPt(this, v36, (void *)v11);
                ClipperLib::Clipper::AddJoin();
              }
            }
          }
          if (v35 && v35 != v11)
          {
            uint64_t v37 = (void *)(v10 + 24);
            do
            {
              ClipperLib::Clipper::IntersectEdges((uint64_t)this, (_DWORD *)v11, (_DWORD *)v35, v37);
              uint64_t v35 = *(void *)(v35 + 128);
            }
            while (v35 != v11);
          }
        }
      }
LABEL_67:
      uint64_t v38 = (char *)this + *(void *)(*(void *)this - 24);
      uint64_t v39 = (void *)*((void *)v38 + 1);
      uint64_t v4 = v38 + 8;
      uint64_t v5 = v39;
    }
    while (v39 != (void *)v4[2]);
  }
}

void ClipperLib::Clipper::ProcessHorizontals(ClipperLib::Clipper *this)
{
  uint64_t v2 = (uint64_t *)((char *)this + 112);
  for (i = (uint64_t *)*((void *)this + 14); i; i = (uint64_t *)*((void *)this + 14))
  {
    uint64_t v4 = i[18];
    uint64_t v5 = i[19];
    if (*((_OWORD *)i + 9) == 0)
    {
      uint64_t *v2 = 0;
    }
    else
    {
      uint64_t v6 = (uint64_t *)(v5 + 144);
      if (!v5) {
        uint64_t v6 = v2;
      }
      *uint64_t v6 = v4;
      if (v4) {
        *(void *)(v4 + 152) = v5;
      }
    }
    i[18] = 0;
    i[19] = 0;
    ClipperLib::Clipper::ProcessHorizontal((uint64_t *)this, i);
  }
}

void ClipperLib::Clipper::ClearGhostJoins(ClipperLib::Clipper *this)
{
  uint64_t v1 = *((void *)this + 4);
  uint64_t v2 = *((void *)this + 5);
  uint64_t v3 = (char *)this + 32;
  if (v2 != v1)
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(v1 + 8 * v5);
      if (v6)
      {
        MEMORY[0x2533C7A10](v6, 0x1020C40E349F4B1);
        uint64_t v1 = *((void *)this + 4);
        uint64_t v2 = *((void *)this + 5);
      }
      ++v5;
    }
    while (v5 < (v2 - v1) >> 3);
  }
  std::vector<ClipperLib::PolyNode *>::resize((uint64_t)v3, 0);
}

BOOL ClipperLib::Clipper::ProcessIntersections(ClipperLib::Clipper *this, uint64_t a2)
{
  if (!*(void *)((char *)this + *(void *)(*(void *)this - 24) + 104)) {
    return 1;
  }
  ClipperLib::Clipper::BuildIntersectList(this, a2);
  uint64_t v3 = (uint64_t)(*((void *)this + 8) - *((void *)this + 7)) >> 3;
  if (!v3) {
    return 1;
  }
  if (v3 == 1 || (BOOL result = ClipperLib::Clipper::FixupIntersectionOrder(this)))
  {
    ClipperLib::Clipper::ProcessIntersectList(this);
    *((void *)this + 14) = 0;
    return 1;
  }
  return result;
}

void sub_252A8DBC8(void *a1)
{
  __cxa_begin_catch(a1);
  *(void *)(v1 + 112) = 0;
  ClipperLib::Clipper::DisposeIntersectNodes(v1);
  exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
  ClipperLib::clipperException::clipperException(exception, "ProcessIntersections error");
}

void sub_252A8DC18(_Unwind_Exception *a1)
{
}

void ClipperLib::Clipper::ProcessEdgesAtTopOfScanbeam(ClipperLib::Clipper *this, uint64_t a2)
{
  uint64_t v4 = (void *)((char *)this + 104);
  unint64_t v5 = *(void **)((char *)this + *(void *)(*(void *)this - 24) + 104);
  uint64_t v51 = v5;
  if (v5)
  {
    uint64_t v6 = (uint64_t *)((char *)this + 88);
    while (v5[7] == a2)
    {
      if (v5[15] || (ClipperLib::GetMaximaPairEx(v5), v15) && *(double *)(v15 + 72) == -1.0e40)
      {
        uint64_t v7 = v5[15];
        if (v7 && *(double *)(v7 + 72) == -1.0e40)
        {
          ClipperLib::ClipperBase::UpdateEdgeIntoAEL((uint64_t)this + *(void *)(*(void *)this - 24), (uint64_t *)&v51);
          unint64_t v5 = v51;
          if ((*((_DWORD *)v51 + 25) & 0x80000000) == 0) {
            ClipperLib::Clipper::AddOutPt(this, (uint64_t)v51, v51);
          }
          uint64_t v8 = *((void *)this + 14);
          v5[19] = 0;
          if (v8) {
            *(void *)(v8 + 152) = v5;
          }
          *((void *)this + 14) = v5;
          v5[18] = v8;
          goto LABEL_18;
        }
        uint64_t v11 = v5[6];
LABEL_17:
        v5[3] = v11;
        v5[4] = a2;
LABEL_18:
        if (*((unsigned char *)this + 134))
        {
          if ((*((_DWORD *)v5 + 25) & 0x80000000) == 0)
          {
            if (*((_DWORD *)v5 + 22))
            {
              uint64_t v12 = v5[17];
              if (v12)
              {
                if ((*(_DWORD *)(v12 + 100) & 0x80000000) == 0
                  && *(void *)(v12 + 24) == v5[3]
                  && *(_DWORD *)(v12 + 88))
                {
                  long long v49 = *(_OWORD *)(v5 + 3);
                  uint64_t v50 = v5[5];
                  uint64_t v13 = (void (*)(uint64_t, uint64_t, void *, void *, long long *))*((void *)this + 17);
                  if (v13) {
                    v13(v12, v12 + 48, v5, v5 + 6, &v49);
                  }
                  ClipperLib::Clipper::AddOutPt(this, v12, &v49);
                  ClipperLib::Clipper::AddOutPt(this, (uint64_t)v5, &v49);
                  long long v47 = v49;
                  uint64_t v48 = v50;
                  ClipperLib::Clipper::AddJoin();
                }
              }
            }
          }
        }
        uint64_t v14 = (void **)(v5 + 16);
        goto LABEL_29;
      }
      if (*((unsigned char *)this + 134))
      {
        uint64_t v16 = operator new(0x18uLL);
        uint64_t v17 = v5[6];
        v16[1] = v6;
        v16[2] = v17;
        uint64_t v18 = *v6;
        *uint64_t v16 = *v6;
        *(void *)(v18 + 8) = v16;
        *uint64_t v6 = (uint64_t)v16;
        ++*v4;
      }
      uint64_t v19 = v5[17];
      ClipperLib::Clipper::DoMaxima((uint64_t *)this, (uint64_t)v5);
      if (v19) {
        uint64_t v14 = (void **)(v19 + 128);
      }
      else {
        uint64_t v14 = (void **)((char *)v4 + *(void *)(*(void *)this - 24));
      }
LABEL_29:
      uint64_t v51 = *v14;
      unint64_t v5 = v51;
      if (!v51) {
        goto LABEL_38;
      }
    }
    double v9 = *((double *)v5 + 9) * (double)(a2 - v5[1]);
    if (v9 >= 0.0) {
      double v10 = 0.5;
    }
    else {
      double v10 = -0.5;
    }
    uint64_t v11 = *v5 + (uint64_t)(v9 + v10);
    goto LABEL_17;
  }
LABEL_38:
  std::list<long long>::__sort<std::__less<void,void>>(*((uint64_t **)this + 12), (uint64_t *)this + 11, *((void *)this + 13), (uint64_t)&v49);
  ClipperLib::Clipper::ProcessHorizontals(this);
  std::__list_imp<long long>::clear((void *)this + 11);
  uint64_t v20 = *(void **)((char *)this + *(void *)(*(void *)this - 24) + 104);
  uint64_t v51 = v20;
  if (v20)
  {
    uint64_t v21 = (char *)this + 40;
    do
    {
      if (v20[7] == a2 && v20[15])
      {
        if ((*((_DWORD *)v20 + 25) & 0x80000000) != 0) {
          uint64_t v22 = 0;
        }
        else {
          uint64_t v22 = ClipperLib::Clipper::AddOutPt(this, (uint64_t)v20, v20 + 6);
        }
        ClipperLib::ClipperBase::UpdateEdgeIntoAEL((uint64_t)this + *(void *)(*(void *)this - 24), (uint64_t *)&v51);
        uint64_t v20 = v51;
        uint64_t v23 = v51[16];
        uint64_t v24 = v51[17];
        if (v24 && *(void *)(v24 + 24) == *v51)
        {
          uint64_t v25 = *(void *)(v24 + 32);
          if (v25 == v51[1] && v22 != 0 && (*(_DWORD *)(v24 + 100) & 0x80000000) == 0 && v25 > *(void *)(v24 + 56))
          {
            long long v45 = *(_OWORD *)(v51 + 3);
            uint64_t v46 = v51[5];
            long long v43 = *((_OWORD *)v51 + 3);
            uint64_t v44 = v51[8];
            long long v41 = *(_OWORD *)(v24 + 24);
            uint64_t v42 = *(void *)(v24 + 40);
            uint64_t v40 = *(void *)(v24 + 64);
            long long v39 = *(_OWORD *)(v24 + 48);
            if (ClipperLib::SlopesEqual(&v45, &v43, &v41, &v39, v21[*(void *)(*(void *)this - 24)])&& *((_DWORD *)v20 + 22)&& *(_DWORD *)(v24 + 88))
            {
              ClipperLib::Clipper::AddOutPt(this, v24, v20);
              long long v37 = *((_OWORD *)v20 + 3);
              uint64_t v38 = v20[8];
              goto LABEL_69;
            }
          }
        }
        if (v23 && *(void *)(v23 + 24) == *v20)
        {
          uint64_t v27 = *(void *)(v23 + 32);
          if (v27 == v20[1] && v22 != 0 && (*(_DWORD *)(v23 + 100) & 0x80000000) == 0 && v27 > *(void *)(v23 + 56))
          {
            long long v35 = *(_OWORD *)(v20 + 3);
            uint64_t v36 = v20[5];
            long long v33 = *((_OWORD *)v20 + 3);
            uint64_t v34 = v20[8];
            long long v31 = *(_OWORD *)(v23 + 24);
            uint64_t v32 = *(void *)(v23 + 40);
            uint64_t v30 = *(void *)(v23 + 64);
            long long v29 = *(_OWORD *)(v23 + 48);
            if (ClipperLib::SlopesEqual(&v35, &v33, &v31, &v29, v21[*(void *)(*(void *)this - 24)])&& *((_DWORD *)v20 + 22)&& *(_DWORD *)(v23 + 88))
            {
              ClipperLib::Clipper::AddOutPt(this, v23, v20);
LABEL_69:
              ClipperLib::Clipper::AddJoin();
            }
          }
        }
      }
      uint64_t v20 = (void *)v20[16];
      uint64_t v51 = v20;
    }
    while (v20);
  }
}

uint64_t ClipperLib::Clipper::JoinCommonEdges(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 8);
  if (*(void *)(this + 16) != v1)
  {
    uint64_t v2 = this;
    unint64_t v3 = 0;
    uint64_t v4 = this + 80;
    do
    {
      unint64_t v5 = *(int ***)(v1 + 8 * v3);
      uint64_t v6 = *(void *)(v4 + *(void *)(*(void *)v2 - 24));
      uint64_t v7 = *(int **)(v6 + 8 * **v5);
      do
      {
        uint64_t v8 = (uint64_t)v7;
        uint64_t v7 = *(int **)(v6 + 8 * *v7);
      }
      while ((int *)v8 != v7);
      double v9 = *(int **)(v6 + 8 * *v5[1]);
      do
      {
        uint64_t v10 = (uint64_t)v9;
        double v9 = *(int **)(v6 + 8 * *v9);
      }
      while ((int *)v10 != v9);
      if (*(void *)(v8 + 24) && *(void *)(v10 + 24) && !*(unsigned char *)(v8 + 5) && !*(unsigned char *)(v10 + 5))
      {
        if (v8 == v10)
        {
          this = ClipperLib::Clipper::JoinPoints((uint64_t *)v2, v5, v8, v8);
          if (this)
          {
            *(void *)(v8 + 24) = *v5;
            *(void *)(v8 + 32) = 0;
            ClipperLib::ClipperBase::CreateOutRec((ClipperLib::ClipperBase *)(v2 + *(void *)(*(void *)v2 - 24)));
          }
        }
        else
        {
          uint64_t v11 = v8;
          do
            uint64_t v11 = *(void *)(v11 + 8);
          while (v11 != v10 && v11 != 0);
          uint64_t LowermostRec = v10;
          if (v11 != v10)
          {
            uint64_t v14 = v10;
            do
              uint64_t v14 = *(void *)(v14 + 8);
            while (v14 != v8 && v14 != 0);
            uint64_t LowermostRec = v8;
            if (v14 != v8) {
              uint64_t LowermostRec = ClipperLib::GetLowermostRec(v8, v10);
            }
          }
          this = ClipperLib::Clipper::JoinPoints((uint64_t *)v2, v5, v8, v10);
          if (this)
          {
            *(void *)(v10 + 24) = 0;
            *(void *)(v10 + 32) = 0;
            *(_DWORD *)uint64_t v10 = *(_DWORD *)v8;
            *(unsigned char *)(v8 + 4) = *(unsigned char *)(LowermostRec + 4);
            if (LowermostRec == v10) {
              *(void *)(v8 + 8) = *(void *)(v10 + 8);
            }
            *(void *)(v10 + 8) = v8;
            if (*(unsigned char *)(v2 + 133)) {
              this = (uint64_t)ClipperLib::Clipper::FixupFirstLefts3((uint64_t *)v2, v10, v8);
            }
          }
        }
      }
      ++v3;
      uint64_t v1 = *(void *)(v2 + 8);
    }
    while (v3 < (*(void *)(v2 + 16) - v1) >> 3);
  }
  return this;
}

void *ClipperLib::Clipper::FixupOutPolyline(uint64_t a1, uint64_t a2)
{
  BOOL result = *(void **)(a2 + 24);
  uint64_t v4 = (void *)result[5];
  if (result == v4)
  {
    uint64_t v8 = *(void **)(a2 + 24);
LABEL_14:
    BOOL result = ClipperLib::DisposeOutPts(&v8);
    *(void *)(a2 + 24) = 0;
    return result;
  }
  do
  {
    BOOL result = (void *)result[4];
    unint64_t v5 = (void *)result[5];
    if (result[1] == v5[1] && result[2] == v5[2])
    {
      if (result == v4) {
        uint64_t v4 = (void *)result[5];
      }
      v5[4] = result[4];
      *(void *)(result[4] + 40) = v5;
      MEMORY[0x2533C7A10]();
      BOOL result = v5;
    }
  }
  while (result != v4);
  uint64_t v7 = (void *)result[5];
  uint64_t v8 = result;
  if (result == v7) {
    goto LABEL_14;
  }
  return result;
}

uint64_t ClipperLib::Clipper::FixupOutPolygon(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 32) = 0;
  uint64_t v4 = *(void **)(a2 + 24);
  if (*(unsigned char *)(a1 + *(void *)(*(void *)a1 - 24) + 72)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = *(unsigned char *)(a1 + 134) != 0;
  }
  BOOL v20 = v5;
  uint64_t v6 = v4 + 5;
  uint64_t v7 = (void *)v4[5];
  if (v7 != v4)
  {
    uint64_t v8 = 0;
    uint64_t v21 = a1 + 40;
    while (1)
    {
      double v9 = (void *)v4[4];
      if (v7 == v9) {
        break;
      }
      uint64_t v10 = v4[1];
      uint64_t v11 = v4[2];
      uint64_t v12 = (long long *)(v4 + 1);
      uint64_t v13 = (long long *)(v9 + 1);
      if (v10 == v9[1] && v11 == v9[2]) {
        goto LABEL_22;
      }
      uint64_t v15 = (long long *)(v7 + 1);
      if (v10 == v7[1] && v11 == v7[2]) {
        goto LABEL_22;
      }
      uint64_t v33 = v7[3];
      long long v32 = *v15;
      long long v17 = *v12;
      uint64_t v31 = v4[3];
      long long v30 = v17;
      long long v28 = *v13;
      uint64_t v29 = v9[3];
      uint64_t result = ClipperLib::SlopesEqual(&v32, (uint64_t *)&v30, &v28, *(unsigned __int8 *)(v21 + *(void *)(*(void *)a1 - 24)));
      if (!result) {
        goto LABEL_18;
      }
      if (!v20) {
        goto LABEL_22;
      }
      uint64_t v27 = v7[3];
      long long v26 = *v15;
      long long v19 = *v12;
      uint64_t v25 = v4[3];
      long long v24 = v19;
      long long v22 = *v13;
      uint64_t v23 = v9[3];
      uint64_t result = ClipperLib::Pt2IsBetweenPt1AndPt3((uint64_t *)&v26, (uint64_t *)&v24, (uint64_t *)&v22);
      if ((result & 1) == 0)
      {
LABEL_22:
        v7[4] = v9;
        *(void *)(v4[4] + 40) = v7;
        double v9 = (void *)*v6;
        MEMORY[0x2533C7A10](v4, 0x1020C404ACFEA97);
        uint64_t v8 = 0;
      }
      else
      {
LABEL_18:
        if (v4 == v8) {
          goto LABEL_27;
        }
        if (!v8) {
          uint64_t v8 = v4;
        }
      }
      uint64_t v6 = v9 + 5;
      uint64_t v7 = (void *)v9[5];
      uint64_t v4 = v9;
      if (v7 == v9) {
        goto LABEL_26;
      }
    }
  }
  double v9 = v4;
LABEL_26:
  uint64_t v34 = v9;
  uint64_t result = (uint64_t)ClipperLib::DisposeOutPts(&v34);
  uint64_t v8 = 0;
LABEL_27:
  *(void *)(a2 + 24) = v8;
  return result;
}

uint64_t *ClipperLib::Clipper::DoSimplePolygons(uint64_t *this)
{
  uint64_t v1 = *this;
  uint64_t v2 = *(uint64_t *)((char *)this + *(void *)(*this - 24) + 80);
  if (*(uint64_t *)((char *)this + *(void *)(*this - 24) + 88) != v2)
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = *(void *)(v2 + 8 * v3);
      BOOL v5 = *(void **)(v4 + 24);
      if (v5 && !*(unsigned char *)(v4 + 5))
      {
        uint64_t v6 = *(void **)(v4 + 24);
        do
        {
          if ((void *)v6[4] == v5) {
            break;
          }
          BOOL v5 = (void *)v6[4];
          do
          {
            BOOL v7 = v6[1] == v5[1] && v6[2] == v5[2];
            if (v7 && (void *)v5[4] != v6)
            {
              uint64_t v8 = (void *)v5[5];
              if (v8 != v6)
              {
                uint64_t v9 = v6[5];
                v6[5] = v8;
                v8[4] = v6;
                v5[5] = v9;
                *(void *)(v9 + 32) = v5;
                *(void *)(v4 + 24) = v6;
                ClipperLib::ClipperBase::CreateOutRec((ClipperLib::ClipperBase *)((char *)this + *(void *)(*this - 24)));
              }
            }
            BOOL v5 = (void *)v5[4];
          }
          while (v5 != *(void **)(v4 + 24));
          uint64_t v6 = (void *)v6[4];
        }
        while (v6 != v5);
        uint64_t v1 = *this;
      }
      ++v3;
      uint64_t v2 = *(uint64_t *)((char *)this + *(void *)(v1 - 24) + 80);
    }
    while (v3 < (*(uint64_t *)((char *)this + *(void *)(v1 - 24) + 88) - v2) >> 3);
  }
  return this;
}

void ClipperLib::Clipper::ClearJoins(ClipperLib::Clipper *this)
{
  uint64_t v1 = *((void *)this + 1);
  uint64_t v2 = *((void *)this + 2);
  unint64_t v3 = (char *)this + 8;
  if (v2 != v1)
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(v1 + 8 * v5);
      if (v6)
      {
        MEMORY[0x2533C7A10](v6, 0x1020C40E349F4B1);
        uint64_t v1 = *((void *)this + 1);
        uint64_t v2 = *((void *)this + 2);
      }
      ++v5;
    }
    while (v5 < (v2 - v1) >> 3);
  }
  std::vector<ClipperLib::PolyNode *>::resize((uint64_t)v3, 0);
}

uint64_t ClipperLib::Clipper::SetWindingCount(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 136);
  if (v2)
  {
    int v3 = *(_DWORD *)(a2 + 80);
    while (1)
    {
      if (*(_DWORD *)(v2 + 80) == v3)
      {
        int v4 = *(_DWORD *)(v2 + 88);
        if (v4) {
          break;
        }
      }
      uint64_t v2 = *(void *)(v2 + 136);
      if (!v2) {
        goto LABEL_6;
      }
    }
    unsigned int v9 = *(_DWORD *)(a2 + 88);
    if (v9)
    {
      uint64_t v10 = 124;
      if (!v3) {
        uint64_t v10 = 128;
      }
      if (!*(_DWORD *)(result + v10)) {
        goto LABEL_46;
      }
      int v11 = *(_DWORD *)(v2 + 92);
      if (((v11 * v4) & 0x80000000) == 0)
      {
        if (((v9 * v4) & 0x80000000) == 0) {
          int v12 = *(_DWORD *)(a2 + 88);
        }
        else {
          int v12 = 0;
        }
        unsigned int v9 = v11 + v12;
        goto LABEL_46;
      }
LABEL_29:
      if (v11 >= 0) {
        unsigned int v14 = v11;
      }
      else {
        unsigned int v14 = -v11;
      }
      if (v9 <= 1) {
        int v15 = 1;
      }
      else {
        int v15 = *(_DWORD *)(a2 + 88);
      }
      if (((v9 * v4) & 0x80000000) == 0) {
        int v16 = *(_DWORD *)(a2 + 88);
      }
      else {
        int v16 = 0;
      }
      unsigned int v17 = v11 + v16;
      if (v14 >= 2) {
        unsigned int v9 = v17;
      }
      else {
        unsigned int v9 = v15;
      }
      goto LABEL_46;
    }
    if (*(_DWORD *)(result + 80) == 1)
    {
      uint64_t v13 = 124;
      if (!v3) {
        uint64_t v13 = 128;
      }
      if (!*(_DWORD *)(result + v13))
      {
        uint64_t v18 = *(void *)(v2 + 136);
        for (i = 1; v18; uint64_t v18 = *(void *)(v18 + 136))
        {
          if (*(_DWORD *)(v18 + 80) == v3) {
            i ^= *(_DWORD *)(v18 + 88) != 0;
          }
        }
        unsigned int v9 = (i & 1) == 0;
        goto LABEL_46;
      }
      int v11 = *(_DWORD *)(v2 + 92);
      if (v11 * v4 < 0) {
        goto LABEL_29;
      }
      unsigned int v9 = ((v11 >> 31) | 1) + v11;
    }
    else
    {
      unsigned int v9 = 1;
    }
LABEL_46:
    int v7 = *(_DWORD *)(v2 + 96);
    *(_DWORD *)(a2 + 92) = v9;
    *(_DWORD *)(a2 + 96) = v7;
    uint64_t v8 = (uint64_t *)(v2 + 128);
    goto LABEL_47;
  }
LABEL_6:
  int v5 = *(_DWORD *)(a2 + 88);
  int v3 = *(_DWORD *)(a2 + 80);
  if (!v5)
  {
    uint64_t v6 = 124;
    if (!v3) {
      uint64_t v6 = 128;
    }
    if (*(_DWORD *)(result + v6) == 3) {
      int v5 = -1;
    }
    else {
      int v5 = 1;
    }
  }
  int v7 = 0;
  *(_DWORD *)(a2 + 92) = v5;
  *(_DWORD *)(a2 + 96) = 0;
  uint64_t v8 = (uint64_t *)(result + *(void *)(*(void *)result - 24) + 104);
LABEL_47:
  uint64_t v20 = *v8;
  BOOL v21 = v3 == 0;
  uint64_t v22 = 128;
  if (v21) {
    uint64_t v22 = 124;
  }
  if (*(_DWORD *)(result + v22))
  {
    if (v20 != a2)
    {
      do
      {
        v7 += *(_DWORD *)(v20 + 88);
        uint64_t v20 = *(void *)(v20 + 128);
      }
      while (v20 != a2);
      *(_DWORD *)(a2 + 96) = v7;
    }
  }
  else
  {
    while (v20 != a2)
    {
      if (*(_DWORD *)(v20 + 88))
      {
        int v7 = v7 == 0;
        *(_DWORD *)(a2 + 96) = v7;
      }
      uint64_t v20 = *(void *)(v20 + 128);
    }
  }
  return result;
}

BOOL ClipperLib::Clipper::IsEvenOddFillType(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 124;
  if (!*(_DWORD *)(a2 + 80)) {
    uint64_t v2 = 128;
  }
  return *(_DWORD *)(a1 + v2) == 0;
}

BOOL ClipperLib::Clipper::IsEvenOddAltFillType(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 128;
  if (!*(_DWORD *)(a2 + 80)) {
    uint64_t v2 = 124;
  }
  return *(_DWORD *)(a1 + v2) == 0;
}

uint64_t ClipperLib::Clipper::IsContributing(uint64_t a1, _DWORD *a2)
{
  int v2 = a2[20];
  uint64_t v3 = 124;
  if (v2) {
    uint64_t v4 = 124;
  }
  else {
    uint64_t v4 = 128;
  }
  if (v2) {
    uint64_t v3 = 128;
  }
  unsigned int v5 = *(_DWORD *)(a1 + v3);
  int v6 = *(_DWORD *)(a1 + v4);
  switch(v6)
  {
    case 2:
LABEL_10:
      int v7 = a2[23];
      goto LABEL_13;
    case 1:
      int v7 = a2[23];
      if (v7 < 0) {
        int v7 = -v7;
      }
LABEL_13:
      if (v7 == 1) {
        goto LABEL_14;
      }
      return 0;
    case 0:
      if (a2[22]) {
        goto LABEL_14;
      }
      goto LABEL_10;
  }
  if (a2[23] != -1) {
    return 0;
  }
LABEL_14:
  switch(*(_DWORD *)(a1 + 80))
  {
    case 0:
      BOOL v8 = v5 == 2;
      if (v5 >= 2) {
        goto LABEL_21;
      }
      return a2[24] != 0;
    case 1:
      goto LABEL_26;
    case 2:
      BOOL v8 = v5 == 2;
      if (v2)
      {
        if (v5 < 2) {
          return a2[24] != 0;
        }
LABEL_21:
        if (v8) {
          return a2[24] > 0;
        }
        unsigned int v10 = a2[24];
      }
      else
      {
        if (v5 < 2) {
          return a2[24] == 0;
        }
LABEL_29:
        if (v8) {
          return a2[24] < 1;
        }
        unsigned int v10 = ~a2[24];
      }
      uint64_t result = v10 >> 31;
      break;
    case 3:
      if (a2[22]) {
        return 1;
      }
LABEL_26:
      BOOL v8 = v5 == 2;
      if (v5 < 2) {
        return a2[24] == 0;
      }
      goto LABEL_29;
    default:
      return 1;
  }
  return result;
}

uint64_t ClipperLib::Clipper::AddLocalMinPoly(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = a2;
  double v8 = *(double *)(a3 + 72);
  if (v8 != -1.0e40 && *(double *)(a2 + 72) <= v8)
  {
    uint64_t v9 = ClipperLib::Clipper::AddOutPt(a1, a3, a4);
    *(_DWORD *)(v6 + 100) = *(_DWORD *)(a3 + 100);
    *(_DWORD *)(v6 + 84) = 2;
    *(_DWORD *)(a3 + 84) = 1;
    uint64_t v10 = *(void *)(a3 + 136);
    uint64_t v11 = v6;
    _ZF = v10 == v6;
    uint64_t v6 = a3;
    if (!_ZF) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v9 = ClipperLib::Clipper::AddOutPt(a1, a2, a4);
  *(_DWORD *)(a3 + 100) = *(_DWORD *)(v6 + 100);
  *(_DWORD *)(v6 + 84) = 1;
  *(_DWORD *)(a3 + 84) = 2;
  uint64_t v10 = *(void *)(v6 + 136);
  uint64_t v11 = a3;
  if (v10 == a3) {
LABEL_4:
  }
    uint64_t v10 = *(void *)(v11 + 136);
LABEL_5:
  if (v10 && (*(_DWORD *)(v10 + 100) & 0x80000000) == 0)
  {
    uint64_t v12 = a4[1];
    if (*(void *)(v10 + 56) == v12)
    {
      uint64_t v13 = *(void *)(v10 + 48);
    }
    else
    {
      double v14 = *(double *)(v10 + 72) * (double)(v12 - *(void *)(v10 + 8));
      double v15 = 0.5;
      if (v14 < 0.0) {
        double v15 = -0.5;
      }
      uint64_t v13 = *(void *)v10 + (uint64_t)(v14 + v15);
    }
    if (*(void *)(v6 + 56) == v12)
    {
      uint64_t v16 = *(void *)(v6 + 48);
    }
    else
    {
      double v17 = *(double *)(v6 + 72) * (double)(v12 - *(void *)(v6 + 8));
      double v18 = 0.5;
      if (v17 < 0.0) {
        double v18 = -0.5;
      }
      uint64_t v16 = *(void *)v6 + (uint64_t)(v17 + v18);
    }
    if (v13 == v16)
    {
      if (*(_DWORD *)(v6 + 88))
      {
        if (*(_DWORD *)(v10 + 88))
        {
          v30[0] = v13;
          v30[1] = v12;
          __asm { FMOV            V0.2S, #-1.0 }
          v30[2] = _D0;
          long long v28 = *(_OWORD *)(v10 + 48);
          uint64_t v29 = *(void *)(v10 + 64);
          v27[0] = v13;
          v27[1] = v12;
          v27[2] = _D0;
          long long v25 = *(_OWORD *)(v6 + 48);
          uint64_t v26 = *(void *)(v6 + 64);
          if (ClipperLib::SlopesEqual(v30, &v28, v27, &v25, *((unsigned __int8 *)a1 + *(void *)(*a1 - 24) + 40)))
          {
            ClipperLib::Clipper::AddOutPt(a1, v10, a4);
            ClipperLib::Clipper::AddJoin();
          }
        }
      }
    }
  }
  return v9;
}

uint64_t ClipperLib::Clipper::AddOutPt(void *a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(unsigned int *)(a2 + 100);
  uint64_t v4 = (ClipperLib::ClipperBase *)((char *)a1 + *(void *)(*a1 - 24));
  if ((v3 & 0x80000000) != 0) {
    ClipperLib::ClipperBase::CreateOutRec(v4);
  }
  uint64_t v5 = *(void *)(*((void *)v4 + 10) + 8 * v3);
  uint64_t v6 = *(void **)(v5 + 24);
  if (*(_DWORD *)(a2 + 84) == 1)
  {
    if (*a3 != v6[1] || a3[1] != v6[2]) {
      goto LABEL_14;
    }
    return *(void *)(v5 + 24);
  }
  else
  {
    uint64_t v8 = v6[5];
    if (*a3 != *(void *)(v8 + 8) || a3[1] != *(void *)(v8 + 16)) {
LABEL_14:
    }
      operator new();
  }
  return v8;
}

void ClipperLib::Clipper::AddJoin()
{
}

uint64_t ClipperLib::Clipper::AddLocalMaxPoly(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = ClipperLib::Clipper::AddOutPt(a1, a2, a4);
  if (!*(_DWORD *)(a3 + 88)) {
    uint64_t result = ClipperLib::Clipper::AddOutPt(a1, a3, a4);
  }
  int v9 = *(_DWORD *)(a2 + 100);
  int v10 = *(_DWORD *)(a3 + 100);
  if (v9 == v10)
  {
    *(_DWORD *)(a2 + 100) = -1;
    *(_DWORD *)(a3 + 100) = -1;
  }
  else
  {
    if (v9 < v10)
    {
      uint64_t v11 = a2;
      uint64_t v12 = a3;
    }
    else
    {
      uint64_t v11 = a3;
      uint64_t v12 = a2;
    }
    return ClipperLib::Clipper::AppendPolygon(a1, v11, v12);
  }
  return result;
}

uint64_t ClipperLib::Clipper::AppendPolygon(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)((char *)a1 + *(void *)(*a1 - 24) + 80);
  uint64_t v7 = *(void *)(v6 + 8 * *(int *)(a2 + 100));
  uint64_t v8 = *(void *)(v6 + 8 * *(int *)(a3 + 100));
  uint64_t v9 = v7;
  do
    uint64_t v9 = *(void *)(v9 + 8);
  while (v9 != v8 && v9 != 0);
  uint64_t result = v8;
  if (v9 != v8)
  {
    uint64_t v12 = v8;
    do
      uint64_t v12 = *(void *)(v12 + 8);
    while (v12 != v7 && v12 != 0);
    uint64_t result = v7;
    if (v12 != v7) {
      uint64_t result = ClipperLib::GetLowermostRec(v7, v8);
    }
  }
  uint64_t v14 = *(void *)(v7 + 24);
  uint64_t v15 = *(void *)(v14 + 40);
  uint64_t v16 = *(void *)(v8 + 24);
  uint64_t v17 = *(void *)(v16 + 40);
  int v18 = *(_DWORD *)(a2 + 84);
  int v19 = *(_DWORD *)(a3 + 84);
  if (v18 == 1)
  {
    if (v19 == 1)
    {
      uint64_t v20 = *(int8x16_t **)(v8 + 24);
      do
      {
        int8x16_t v21 = v20[2];
        v20[2] = vextq_s8(v21, v21, 8uLL);
        uint64_t v20 = (int8x16_t *)v21.i64[0];
      }
      while (v21.i64[0] != v16);
      *(void *)(v16 + 32) = v14;
      *(void *)(v14 + 40) = v16;
      *(void *)(v15 + 32) = v17;
      *(void *)(v17 + 40) = v15;
      *(void *)(v7 + 24) = v17;
    }
    else
    {
      *(void *)(v17 + 32) = v14;
      *(void *)(v14 + 40) = v17;
      *(void *)(v16 + 40) = v15;
      *(void *)(v15 + 32) = v16;
      *(void *)(v7 + 24) = v16;
    }
  }
  else if (v19 == 2)
  {
    uint64_t v22 = *(int8x16_t **)(v8 + 24);
    do
    {
      int8x16_t v23 = v22[2];
      v22[2] = vextq_s8(v23, v23, 8uLL);
      uint64_t v22 = (int8x16_t *)v23.i64[0];
    }
    while (v23.i64[0] != v16);
    *(void *)(v15 + 32) = v17;
    *(void *)(v17 + 40) = v15;
    *(void *)(v16 + 32) = v14;
    *(void *)(v14 + 40) = v16;
  }
  else
  {
    *(void *)(v15 + 32) = v16;
    *(void *)(v16 + 40) = v15;
    *(void *)(v14 + 40) = v17;
    *(void *)(v17 + 32) = v14;
  }
  *(void *)(v7 + 32) = 0;
  if (result == v8)
  {
    uint64_t v24 = *(void *)(v8 + 8);
    if (v24 != v7) {
      *(void *)(v7 + 8) = v24;
    }
    *(unsigned char *)(v7 + 4) = *(unsigned char *)(v8 + 4);
  }
  *(void *)(v8 + 24) = 0;
  *(void *)(v8 + 32) = 0;
  *(void *)(v8 + 8) = v7;
  int v25 = *(_DWORD *)(a2 + 100);
  int v26 = *(_DWORD *)(a3 + 100);
  *(_DWORD *)(a2 + 100) = -1;
  *(_DWORD *)(a3 + 100) = -1;
  uint64_t v27 = *(void *)((char *)a1 + *(void *)(*a1 - 24) + 104);
  if (v27)
  {
    while (*(_DWORD *)(v27 + 100) != v26)
    {
      uint64_t v27 = *(void *)(v27 + 128);
      if (!v27) {
        goto LABEL_36;
      }
    }
    *(_DWORD *)(v27 + 100) = v25;
    *(_DWORD *)(v27 + 84) = v18;
  }
LABEL_36:
  *(_DWORD *)uint64_t v8 = *(_DWORD *)v7;
  return result;
}

uint64_t ClipperLib::Clipper::AddEdgeToSEL(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 112);
  *(void *)(a2 + 152) = 0;
  if (v2) {
    *(void *)(v2 + 152) = a2;
  }
  *(void *)(result + 112) = a2;
  *(void *)(a2 + 144) = v2;
  return result;
}

BOOL ClipperLib::Clipper::PopEdgeFromSEL(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 112);
  uint64_t v2 = (void *)(a1 + 112);
  uint64_t v3 = v4;
  if (v4)
  {
    *a2 = v3;
    uint64_t v6 = *(void *)(*v2 + 144);
    uint64_t v7 = *(void *)(*v2 + 152);
    uint64_t v5 = *v2 + 144;
    if (*(_OWORD *)v5 == 0)
    {
      void *v2 = 0;
    }
    else
    {
      uint64_t v8 = (void *)(v7 + 144);
      if (!v7) {
        uint64_t v8 = v2;
      }
      *uint64_t v8 = v6;
      if (v6) {
        *(void *)(v6 + 152) = v7;
      }
    }
    *(void *)uint64_t v5 = 0;
    *(void *)(v5 + 8) = 0;
  }
  return v3 != 0;
}

uint64_t ClipperLib::Clipper::DeleteFromSEL(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 144);
  uint64_t v3 = *(void *)(a2 + 152);
  if (*(_OWORD *)(a2 + 144) == 0)
  {
    if (*(void *)(result + 112) != a2) {
      return result;
    }
    goto LABEL_5;
  }
  if (!v3)
  {
LABEL_5:
    uint64_t v4 = (void *)(result + 112);
    goto LABEL_6;
  }
  uint64_t v4 = (void *)(v3 + 144);
LABEL_6:
  *uint64_t v4 = v2;
  if (v2) {
    *(void *)(v2 + 152) = v3;
  }
  *(void *)(a2 + 144) = 0;
  *(void *)(a2 + 152) = 0;
  return result;
}

__n128 ClipperLib::Clipper::CopyAELToSEL(ClipperLib::Clipper *this)
{
  uint64_t v1 = *(__n128 **)((char *)this + *(void *)(*(void *)this - 24) + 104);
  *((void *)this + 14) = v1;
  if (v1)
  {
    do
    {
      __n128 result = v1[8];
      v1[9] = result;
      uint64_t v1 = (__n128 *)result.n128_u64[0];
    }
    while (result.n128_u64[0]);
  }
  return result;
}

void ClipperLib::Clipper::AddGhostJoin()
{
}

uint64_t *ClipperLib::Clipper::InsertEdgeIntoAEL(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *result;
  if (!*(uint64_t *)((char *)result + *(void *)(*result - 24) + 104))
  {
    *(void *)(a2 + 128) = 0;
    *(void *)(a2 + 136) = 0;
LABEL_43:
    uint64_t v16 = (uint64_t *)((char *)result + *(void *)(v3 - 24) + 104);
    goto LABEL_44;
  }
  if (!a3)
  {
    a3 = *(uint64_t *)((char *)result + *(void *)(*result - 24) + 104);
    uint64_t v18 = *(void *)(a2 + 24);
    uint64_t v19 = *(void *)(a3 + 24);
    BOOL v20 = v18 < v19;
    if (v18 == v19)
    {
      uint64_t v21 = *(void *)(a2 + 56);
      uint64_t v22 = *(void *)(a3 + 56);
      if (v21 <= v22)
      {
        if (v21 == v22)
        {
          uint64_t v25 = *(void *)(a2 + 48);
        }
        else
        {
          double v26 = *(double *)(a2 + 72) * (double)(v22 - *(void *)(a2 + 8));
          double v27 = 0.5;
          if (v26 < 0.0) {
            double v27 = -0.5;
          }
          uint64_t v25 = *(void *)a2 + (uint64_t)(v26 + v27);
        }
        if (*(void *)(a3 + 48) <= v25) {
          goto LABEL_3;
        }
LABEL_42:
        *(void *)(a2 + 136) = 0;
        *(void *)(a2 + 128) = *(uint64_t *)((char *)result + *(void *)(v3 - 24) + 104);
        *(void *)(*(uint64_t *)((char *)result + *(void *)(v3 - 24) + 104) + 136) = a2;
        goto LABEL_43;
      }
      double v23 = *(double *)(a3 + 72) * (double)(v21 - *(void *)(a3 + 8));
      double v24 = 0.5;
      if (v23 < 0.0) {
        double v24 = -0.5;
      }
      BOOL v20 = *(void *)(a2 + 48) < *(void *)a3 + (uint64_t)(v23 + v24);
    }
    if (!v20) {
      goto LABEL_3;
    }
    goto LABEL_42;
  }
LABEL_3:
  uint64_t v4 = *(void *)(a3 + 128);
  if (v4)
  {
    uint64_t v5 = *(void *)(a2 + 24);
    uint64_t v6 = a3;
    while (1)
    {
      a3 = v6;
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)(v4 + 24);
      BOOL v8 = v5 < v7;
      if (v5 == v7)
      {
        uint64_t v9 = *(void *)(a2 + 56);
        uint64_t v10 = *(void *)(v6 + 56);
        if (v9 <= v10)
        {
          if (v9 == v10)
          {
            uint64_t v13 = *(void *)(a2 + 48);
          }
          else
          {
            double v14 = *(double *)(a2 + 72) * (double)(v10 - *(void *)(a2 + 8));
            if (v14 >= 0.0) {
              double v15 = 0.5;
            }
            else {
              double v15 = -0.5;
            }
            uint64_t v13 = *(void *)a2 + (uint64_t)(v14 + v15);
          }
          if (*(void *)(v6 + 48) > v13) {
            goto LABEL_24;
          }
          goto LABEL_21;
        }
        double v11 = *(double *)(v6 + 72) * (double)(v9 - *(void *)(v6 + 8));
        if (v11 >= 0.0) {
          double v12 = 0.5;
        }
        else {
          double v12 = -0.5;
        }
        BOOL v8 = *(void *)(a2 + 48) < *(void *)v6 + (uint64_t)(v11 + v12);
      }
      if (v8) {
        goto LABEL_24;
      }
LABEL_21:
      uint64_t v4 = *(void *)(v6 + 128);
      if (!v4)
      {
        a3 = v6;
        break;
      }
    }
  }
  uint64_t v6 = 0;
LABEL_24:
  *(void *)(a2 + 128) = v6;
  uint64_t v16 = (void *)(a3 + 128);
  uint64_t v17 = *(void *)(a3 + 128);
  if (v17) {
    *(void *)(v17 + 136) = a2;
  }
  *(void *)(a2 + 136) = a3;
LABEL_44:
  *uint64_t v16 = a2;
  return result;
}

uint64_t ClipperLib::Clipper::IntersectEdges(uint64_t result, _DWORD *a2, _DWORD *a3, void *a4)
{
  uint64_t v7 = result;
  int v8 = a2[25];
  int v9 = a3[25];
  uint64_t v10 = *(uint64_t (**)(_DWORD *, _DWORD *, _DWORD *, _DWORD *, void *))(result + 136);
  if (v10) {
    __n128 result = v10(a2, a2 + 12, a3, a3 + 12, a4);
  }
  int v11 = a2[22];
  int v12 = a3[22];
  if (!v11)
  {
    if (!v12) {
      return result;
    }
    if (a2[20] == a3[20])
    {
      if (*(_DWORD *)(v7 + 80) != 1 || v9 < 0) {
        return result;
      }
    }
    else
    {
      int v25 = a3[23];
      if (v25 < 0) {
        int v25 = -v25;
      }
      if (v25 != 1 || *(_DWORD *)(v7 + 80) == 1 && a3[24]) {
        return result;
      }
    }
    __n128 result = ClipperLib::Clipper::AddOutPt((void *)v7, (uint64_t)a2, a4);
    if ((v8 & 0x80000000) == 0) {
      a2[25] = -1;
    }
    return result;
  }
  int v13 = a2[20];
  int v14 = a3[20];
  if (!v12)
  {
    if (v13 == v14)
    {
      if (*(_DWORD *)(v7 + 80) != 1 || v8 < 0) {
        return result;
      }
    }
    else
    {
      int v26 = a2[23];
      if (v26 < 0) {
        int v26 = -v26;
      }
      if (v26 != 1 || *(_DWORD *)(v7 + 80) == 1 && a2[24]) {
        return result;
      }
    }
    __n128 result = ClipperLib::Clipper::AddOutPt((void *)v7, (uint64_t)a3, a4);
    if (v9 < 0) {
      return result;
    }
    int v27 = -1;
    goto LABEL_92;
  }
  if (v13 == v14)
  {
    if (v13) {
      double v15 = (int *)(v7 + 124);
    }
    else {
      double v15 = (int *)(v7 + 128);
    }
    int v16 = a2[23];
    if (*v15)
    {
      int v17 = v16 + v12;
      if (!v17) {
        int v17 = -v16;
      }
      a2[23] = v17;
      int v18 = a3[23] - v11;
      if (v18) {
        a3[23] = v18;
      }
      else {
        a3[23] = -v11;
      }
    }
    else
    {
      a2[23] = a3[23];
      a3[23] = v16;
    }
  }
  else
  {
    if (v14) {
      uint64_t v19 = (_DWORD *)(v7 + 124);
    }
    else {
      uint64_t v19 = (_DWORD *)(v7 + 128);
    }
    int v20 = a2[24];
    int v21 = v20 + v12;
    if (*v19) {
      BOOL v22 = v21;
    }
    else {
      BOOL v22 = v20 == 0;
    }
    a2[24] = v22;
    if (v13) {
      double v15 = (int *)(v7 + 124);
    }
    else {
      double v15 = (int *)(v7 + 128);
    }
    int v23 = a3[24];
    if (*v15) {
      int v24 = v23 - v11;
    }
    else {
      int v24 = v23 == 0;
    }
    a3[24] = v24;
  }
  if (v13) {
    long long v28 = (int *)(v7 + 128);
  }
  else {
    long long v28 = (int *)(v7 + 124);
  }
  int v29 = *v15;
  if (v14) {
    long long v30 = (int *)(v7 + 124);
  }
  else {
    long long v30 = (int *)(v7 + 128);
  }
  if (v14) {
    uint64_t v31 = (int *)(v7 + 128);
  }
  else {
    uint64_t v31 = (int *)(v7 + 124);
  }
  int v32 = *v30;
  if (v29 == 3)
  {
    unint64_t v33 = -(uint64_t)(int)a2[23];
  }
  else if (v29 == 2)
  {
    unint64_t v33 = (int)a2[23];
  }
  else
  {
    LODWORD(v33) = a2[23];
    if ((v33 & 0x80000000) == 0) {
      unint64_t v33 = v33;
    }
    else {
      unint64_t v33 = -(int)v33;
    }
  }
  if (v32 == 3)
  {
    unint64_t v34 = -(uint64_t)(int)a3[23];
  }
  else if (v32 == 2)
  {
    unint64_t v34 = (int)a3[23];
  }
  else
  {
    LODWORD(v34) = a3[23];
    if ((v34 & 0x80000000) == 0) {
      unint64_t v34 = v34;
    }
    else {
      unint64_t v34 = -(int)v34;
    }
  }
  int v35 = *v28;
  int v36 = *v31;
  if (v8 < 0 || v9 < 0)
  {
    if ((v8 & 0x80000000) == 0)
    {
      if (v34 > 1) {
        return result;
      }
      long long v37 = (void *)v7;
      uint64_t v38 = (uint64_t)a2;
      goto LABEL_91;
    }
    if ((v9 & 0x80000000) == 0)
    {
      if (v33 > 1) {
        return result;
      }
      goto LABEL_90;
    }
    if (v33 <= 1 && v34 <= 1)
    {
      if (v35 == 3)
      {
        uint64_t v40 = -(uint64_t)(int)a2[24];
      }
      else if (v35 == 2)
      {
        uint64_t v40 = (int)a2[24];
      }
      else
      {
        LODWORD(v40) = a2[24];
        if ((int)v40 >= 0) {
          uint64_t v40 = v40;
        }
        else {
          uint64_t v40 = -(int)v40;
        }
      }
      if (v36 == 3)
      {
        uint64_t v41 = -(uint64_t)(int)a3[24];
      }
      else if (v36 == 2)
      {
        uint64_t v41 = (int)a3[24];
      }
      else
      {
        LODWORD(v41) = a3[24];
        if ((int)v41 >= 0) {
          uint64_t v41 = v41;
        }
        else {
          uint64_t v41 = -(int)v41;
        }
      }
      if (v13 == v14)
      {
        if (v33 == 1 && v34 == 1)
        {
          switch(*(_DWORD *)(v7 + 80))
          {
            case 0:
              if (v40 >= 1 && v41 >= 1) {
                goto LABEL_124;
              }
              return result;
            case 1:
              goto LABEL_122;
            case 2:
              if (v13 == 1 && v40 >= 1 && v41 > 0) {
                goto LABEL_124;
              }
              if (v13) {
                return result;
              }
LABEL_122:
              if (v40 <= 0 && v41 <= 0) {
                goto LABEL_124;
              }
              return result;
            case 3:
              goto LABEL_124;
            default:
              return result;
          }
        }
        int v42 = a2[21];
        a2[21] = a3[21];
        a3[21] = v42;
      }
      else
      {
LABEL_124:
        return ClipperLib::Clipper::AddLocalMinPoly((void *)v7, (uint64_t)a2, (uint64_t)a3, a4);
      }
    }
  }
  else
  {
    if (v33 <= 1 && v34 <= 1 && (v13 == v14 || *(_DWORD *)(v7 + 80) == 3))
    {
      ClipperLib::Clipper::AddOutPt((void *)v7, (uint64_t)a2, a4);
LABEL_90:
      long long v37 = (void *)v7;
      uint64_t v38 = (uint64_t)a3;
LABEL_91:
      __n128 result = ClipperLib::Clipper::AddOutPt(v37, v38, a4);
      int v39 = a2[21];
      a2[21] = a3[21];
      a3[21] = v39;
      int v27 = a2[25];
      a2[25] = a3[25];
LABEL_92:
      a3[25] = v27;
      return result;
    }
    return ClipperLib::Clipper::AddLocalMaxPoly((void *)v7, (uint64_t)a2, (uint64_t)a3, a4);
  }
  return result;
}

uint64_t ClipperLib::Clipper::SetZ(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 136);
  if (v4) {
    return v4(a3, a3 + 48, a4, a4 + 48, a2);
  }
  return result;
}

void *ClipperLib::Clipper::SetHoleState(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 136);
  if (v3)
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = v4;
      int v6 = *(_DWORD *)(v3 + 100);
      if ((v6 & 0x80000000) == 0)
      {
        if (*(_DWORD *)(v3 + 88))
        {
          uint64_t v4 = v3;
          if (v5)
          {
            if (*(_DWORD *)(v5 + 100) == v6) {
              uint64_t v4 = 0;
            }
            else {
              uint64_t v4 = v5;
            }
          }
        }
      }
      uint64_t v3 = *(void *)(v3 + 136);
    }
    while (v3);
    if (v4)
    {
      uint64_t v3 = *(void *)(*(void *)((char *)result + *(void *)(*result - 24) + 80) + 8 * *(int *)(v4 + 100));
      LOBYTE(v4) = *(unsigned char *)(v3 + 4) ^ 1;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  *(void *)(a3 + 8) = v3;
  *(unsigned char *)(a3 + 4) = v4;
  return result;
}

uint64_t ClipperLib::GetLowermostRec(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  BottomPt = *(void **)(a1 + 32);
  if (!BottomPt)
  {
    BottomPt = (void *)ClipperLib::GetBottomPt(*(void **)(v3 + 24));
    *(void *)(v3 + 32) = BottomPt;
  }
  uint64_t v5 = *(void **)(a2 + 32);
  if (!v5)
  {
    uint64_t v5 = (void *)ClipperLib::GetBottomPt(*(void **)(a2 + 24));
    *(void *)(a2 + 32) = v5;
    BottomPt = *(void **)(v3 + 32);
  }
  uint64_t v6 = BottomPt[2];
  uint64_t v7 = v5[2];
  if (v6 <= v7)
  {
    if (v6 < v7) {
      return a2;
    }
    uint64_t v8 = BottomPt[1];
    uint64_t v9 = v5[1];
    if (v8 < v9) {
      return v3;
    }
    if (v8 > v9 || (void *)BottomPt[4] == BottomPt)
    {
      return a2;
    }
    else if ((void *)v5[4] != v5 && !ClipperLib::FirstIsBottomPt((uint64_t)BottomPt, v5))
    {
      return a2;
    }
  }
  return v3;
}

BOOL ClipperLib::OutRec1RightOfOutRec2(uint64_t a1, uint64_t a2)
{
  do
    a1 = *(void *)(a1 + 8);
  while (a1 != a2 && a1 != 0);
  return a1 == a2;
}

int *ClipperLib::Clipper::GetOutRec(ClipperLib::Clipper *this, int a2)
{
  uint64_t v2 = *(void *)((char *)this + *(void *)(*(void *)this - 24) + 80);
  uint64_t v3 = *(int **)(v2 + 8 * a2);
  do
  {
    __n128 result = v3;
    uint64_t v3 = *(int **)(v2 + 8 * *v3);
  }
  while (result != v3);
  return result;
}

uint64_t ClipperLib::Clipper::GetLastOutPt(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)((char *)a1 + *(void *)(*a1 - 24) + 80) + 8 * *(int *)(a2 + 100)) + 24;
  if (*(_DWORD *)(a2 + 84) != 1) {
    uint64_t v2 = *(void *)v2 + 40;
  }
  return *(void *)v2;
}

void ClipperLib::Clipper::ProcessHorizontal(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = a2;
  v86[0] = a2;
  int v4 = *((_DWORD *)a2 + 22);
  uint64_t v5 = *a2;
  uint64_t v6 = a2[6];
  BOOL v7 = *a2 < v6;
  if (*a2 >= v6) {
    uint64_t v8 = a2[6];
  }
  else {
    uint64_t v8 = *a2;
  }
  if (*a2 < v6) {
    uint64_t v9 = a2[6];
  }
  else {
    uint64_t v9 = *a2;
  }
  uint64_t v79 = v9;
  uint64_t v80 = v8;
  uint64_t v10 = a2;
  while (1)
  {
    int v11 = v10;
    uint64_t v10 = (uint64_t *)v10[15];
    if (!v10) {
      break;
    }
    if (*((double *)v10 + 9) != -1.0e40)
    {
      MaximaPair = 0;
      goto LABEL_12;
    }
  }
  MaximaPair = ClipperLib::GetMaximaPair(v11);
LABEL_12:
  int v13 = a1 + 11;
  uint64_t v78 = (uint64_t)MaximaPair;
  if (a1[13])
  {
    int v14 = (void *)a1[12];
    if (v5 < v6)
    {
      while (1)
      {
        if (v14 == v13)
        {
          int v14 = 0;
          int v16 = a1 + 11;
          goto LABEL_30;
        }
        uint64_t v15 = v14[2];
        if (v15 > v5) {
          break;
        }
        int v14 = (void *)v14[1];
      }
      if (v15 >= v11[6]) {
        int v16 = a1 + 11;
      }
      else {
        int v16 = v14;
      }
      int v14 = 0;
      goto LABEL_30;
    }
    int v17 = a1 + 11;
    while (v17 != v14)
    {
      int v18 = v17;
      int v17 = (void *)*v17;
      uint64_t v19 = v17[2];
      if (v19 <= v5)
      {
        int v16 = 0;
        if (v19 > v11[6]) {
          int v14 = v18;
        }
        goto LABEL_30;
      }
    }
  }
  else
  {
    int v14 = 0;
  }
  int v16 = 0;
LABEL_30:
  uint64_t v81 = (uint64_t)v11;
  __asm { FMOV            V9.2S, #-1.0 }
  while (1)
  {
    v77 = v2 + 16;
    uint64_t v25 = 17;
    if (v7) {
      uint64_t v25 = 16;
    }
    uint64_t v26 = v2[v25];
    if (v26)
    {
      v82 = v2 + 6;
      do
      {
        if (a1[13])
        {
          if (v7)
          {
            if (v16 == v13)
            {
              int v16 = a1 + 11;
              goto LABEL_55;
            }
            while (v16[2] < *(void *)(v26 + 24))
            {
              if ((*((_DWORD *)v2 + 25) & 0x80000000) == 0 && v4)
              {
                uint64_t v27 = v2[1];
                uint64_t v83 = v16[2];
                uint64_t v84 = v27;
                uint64_t v85 = _D9;
                ClipperLib::Clipper::AddOutPt(a1, (uint64_t)v2, &v83);
              }
              int v16 = (void *)v16[1];
              if (v16 == v13)
              {
                int v16 = a1 + 11;
                break;
              }
            }
          }
          else
          {
            long long v28 = (void *)a1[12];
            if (v14 == v28) {
              goto LABEL_52;
            }
            while (1)
            {
              int v29 = (void *)*v14;
              if (*(void *)(*v14 + 16) <= *(void *)(v26 + 24)) {
                break;
              }
              if ((*((_DWORD *)v2 + 25) & 0x80000000) == 0 && v4)
              {
                uint64_t v30 = v2[1];
                uint64_t v83 = *(void *)(*v14 + 16);
                uint64_t v84 = v30;
                uint64_t v85 = _D9;
                ClipperLib::Clipper::AddOutPt(a1, (uint64_t)v2, &v83);
                int v29 = (void *)*v14;
                long long v28 = (void *)a1[12];
              }
              int v14 = v29;
              if (v29 == v28)
              {
                int v14 = v28;
                break;
              }
            }
          }
        }
        if (!v7)
        {
LABEL_52:
          uint64_t v31 = *(void *)(v26 + 24);
          if (v31 < v80) {
            break;
          }
          goto LABEL_56;
        }
LABEL_55:
        uint64_t v31 = *(void *)(v26 + 24);
        if (v31 > v79) {
          break;
        }
LABEL_56:
        if (v31 == *v82)
        {
          uint64_t v32 = v2[15];
          if (v32)
          {
            if (*(double *)(v26 + 72) < *(double *)(v32 + 72)) {
              break;
            }
          }
        }
        if ((*((_DWORD *)v2 + 25) & 0x80000000) == 0 && v4)
        {
          ClipperLib::Clipper::AddOutPt(a1, (uint64_t)v2, (void *)(v26 + 24));
          for (char i = (uint64_t *)a1[14]; i; char i = (uint64_t *)i[18])
          {
            if ((*((_DWORD *)i + 25) & 0x80000000) == 0)
            {
              uint64_t v34 = *v2;
              uint64_t v35 = v2[6];
              uint64_t v36 = *i;
              uint64_t v37 = i[6];
              if (*v2 >= v35) {
                uint64_t v38 = v2[6];
              }
              else {
                uint64_t v38 = *v2;
              }
              if (*v2 <= v35) {
                uint64_t v34 = v2[6];
              }
              if (v36 >= v37) {
                uint64_t v39 = i[6];
              }
              else {
                uint64_t v39 = *i;
              }
              if (v36 <= v37) {
                uint64_t v36 = i[6];
              }
              if (v38 < v36 && v39 < v34) {
                ClipperLib::Clipper::AddJoin();
              }
            }
          }
          ClipperLib::Clipper::AddGhostJoin();
        }
        if (v2 == (void *)v81 && v26 == v78)
        {
          if ((*(_DWORD *)(v81 + 100) & 0x80000000) == 0) {
            ClipperLib::Clipper::AddLocalMaxPoly(a1, v81, v78, v82);
          }
          uint64_t v50 = *a1;
          uint64_t v51 = (char *)a1 + *(void *)(*a1 - 24);
          uint64_t v53 = v2[16];
          uint64_t v52 = v2[17];
          if (*((_OWORD *)v2 + 8) == 0)
          {
            if (*((void *)v51 + 13) == v81) {
              goto LABEL_105;
            }
          }
          else
          {
            if (v52)
            {
              long long v54 = (void *)(v52 + 128);
              goto LABEL_106;
            }
LABEL_105:
            long long v54 = v51 + 104;
LABEL_106:
            void *v54 = v53;
            if (v53) {
              *(void *)(v53 + 136) = v52;
            }
            void *v77 = 0;
            v2[17] = 0;
            uint64_t v50 = *a1;
          }
          uint64_t v55 = (char *)a1 + *(void *)(v50 - 24);
          uint64_t v56 = *(void *)(v78 + 128);
          uint64_t v57 = *(void *)(v78 + 136);
          if (*(_OWORD *)(v78 + 128) == 0)
          {
            if (*((void *)v55 + 13) == v78) {
              goto LABEL_113;
            }
          }
          else
          {
            if (v57)
            {
              long long v58 = (void *)(v57 + 128);
              goto LABEL_114;
            }
LABEL_113:
            long long v58 = v55 + 104;
LABEL_114:
            *long long v58 = v56;
            if (v56) {
              *(void *)(v56 + 136) = v57;
            }
            *(void *)(v78 + 128) = 0;
            *(void *)(v78 + 136) = 0;
          }
          return;
        }
        uint64_t v41 = v2[4];
        uint64_t v83 = *(void *)(v26 + 24);
        uint64_t v84 = v41;
        uint64_t v85 = _D9;
        if (v7)
        {
          int v42 = v2;
          long long v43 = (_DWORD *)v26;
        }
        else
        {
          int v42 = (_DWORD *)v26;
          long long v43 = v2;
        }
        ClipperLib::Clipper::IntersectEdges((uint64_t)a1, v42, v43, &v83);
        uint64_t v44 = 136;
        if (v7) {
          uint64_t v44 = 128;
        }
        uint64_t v45 = *(void *)(v26 + v44);
        ClipperLib::ClipperBase::SwapPositionsInAEL((uint64_t)a1 + *(void *)(*a1 - 24), (uint64_t)v2, v26);
        uint64_t v26 = v45;
      }
      while (v45);
    }
    uint64_t v46 = v2[15];
    if (!v46 || *(double *)(v46 + 72) != -1.0e40) {
      break;
    }
    ClipperLib::ClipperBase::UpdateEdgeIntoAEL((uint64_t)a1 + *(void *)(*a1 - 24), (uint64_t *)v86);
    uint64_t v2 = v86[0];
    if ((*((_DWORD *)v86[0] + 25) & 0x80000000) == 0) {
      ClipperLib::Clipper::AddOutPt(a1, (uint64_t)v86[0], v86[0]);
    }
    uint64_t v47 = *v2;
    uint64_t v48 = v2[6];
    BOOL v7 = *v2 < v48;
    if (*v2 >= v48) {
      uint64_t v49 = v2[6];
    }
    else {
      uint64_t v49 = *v2;
    }
    if (*v2 < v48) {
      uint64_t v47 = v2[6];
    }
    uint64_t v79 = v47;
    uint64_t v80 = v49;
  }
  if ((*((_DWORD *)v2 + 25) & 0x80000000) == 0)
  {
    for (j = (uint64_t *)a1[14]; j; j = (uint64_t *)j[18])
    {
      if ((*((_DWORD *)j + 25) & 0x80000000) == 0)
      {
        uint64_t v60 = *v2;
        uint64_t v61 = v2[6];
        uint64_t v62 = *j;
        uint64_t v63 = j[6];
        if (*v2 >= v61) {
          uint64_t v64 = v2[6];
        }
        else {
          uint64_t v64 = *v2;
        }
        if (*v2 <= v61) {
          uint64_t v60 = v2[6];
        }
        if (v62 >= v63) {
          uint64_t v65 = j[6];
        }
        else {
          uint64_t v65 = *j;
        }
        if (v62 <= v63) {
          uint64_t v62 = j[6];
        }
        if (v64 < v62 && v65 < v60) {
          ClipperLib::Clipper::AddJoin();
        }
      }
    }
    ClipperLib::Clipper::AddGhostJoin();
  }
  int v67 = *((_DWORD *)v2 + 25);
  if (!v46)
  {
    if ((v67 & 0x80000000) == 0) {
      ClipperLib::Clipper::AddOutPt(a1, (uint64_t)v2, v2 + 6);
    }
    v72 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v74 = v2[16];
    uint64_t v73 = v2[17];
    if (*((_OWORD *)v2 + 8) == 0)
    {
      if (*((void **)v72 + 13) != v2) {
        return;
      }
    }
    else if (v73)
    {
      v75 = (void *)(v73 + 128);
LABEL_167:
      void *v75 = v74;
      if (v74) {
        *(void *)(v74 + 136) = v73;
      }
      void *v77 = 0;
      v2[17] = 0;
      return;
    }
    v75 = v72 + 104;
    goto LABEL_167;
  }
  if (v67 < 0)
  {
    ClipperLib::ClipperBase::UpdateEdgeIntoAEL((uint64_t)a1 + *(void *)(*a1 - 24), (uint64_t *)v86);
    return;
  }
  ClipperLib::Clipper::AddOutPt(a1, (uint64_t)v2, v2 + 6);
  ClipperLib::ClipperBase::UpdateEdgeIntoAEL((uint64_t)a1 + *(void *)(*a1 - 24), (uint64_t *)v86);
  v68 = v86[0];
  if (*((_DWORD *)v86[0] + 22))
  {
    uint64_t v69 = v86[0][16];
    uint64_t v70 = v86[0][17];
    if (v70
      && *(void *)(v70 + 24) == *v86[0]
      && (uint64_t v71 = *(void *)(v70 + 32), v71 == v86[0][1])
      && *(_DWORD *)(v70 + 88)
      && (*(_DWORD *)(v70 + 100) & 0x80000000) == 0
      && v71 > *(void *)(v70 + 56)
      && ClipperLib::SlopesEqual(v86[0], *((void **)v86[0] + 17), *((unsigned __int8 *)a1 + *(void *)(*a1 - 24) + 40)))
    {
      ClipperLib::Clipper::AddOutPt(a1, v70, v68);
    }
    else
    {
      if (!v69) {
        return;
      }
      if (*(void *)(v69 + 24) != *v68) {
        return;
      }
      uint64_t v76 = *(void *)(v69 + 32);
      if (v76 != v68[1]
        || !*(_DWORD *)(v69 + 88)
        || (*(_DWORD *)(v69 + 100) & 0x80000000) != 0
        || v76 <= *(void *)(v69 + 56)
        || !ClipperLib::SlopesEqual(v68, (void *)v69, *((unsigned __int8 *)a1 + *(void *)(*a1 - 24) + 40)))
      {
        return;
      }
      ClipperLib::Clipper::AddOutPt(a1, v69, v68);
    }
    ClipperLib::Clipper::AddJoin();
  }
}

void *ClipperLib::GetMaximaPair(void *a1)
{
  __n128 result = (void *)a1[13];
  uint64_t v4 = a1[6];
  uint64_t v3 = a1[7];
  BOOL v5 = result[6] == v4 && result[7] == v3;
  if (!v5 || result[15])
  {
    __n128 result = (void *)a1[14];
    BOOL v6 = result[6] == v4 && result[7] == v3;
    if (!v6 || result[15]) {
      return 0;
    }
  }
  return result;
}

double ClipperLib::GetMaximaPairEx(void *a1)
{
  MaximaPair = (double *)ClipperLib::GetMaximaPair(a1);
  if (MaximaPair && *((_DWORD *)MaximaPair + 25) != -2 && *((void *)MaximaPair + 16) == *((void *)MaximaPair + 17)) {
    return MaximaPair[9];
  }
  return result;
}

uint64_t ClipperLib::Clipper::SwapPositionsInSEL(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 144);
  if (!v3 && !*(void *)(a2 + 152)) {
    return result;
  }
  uint64_t v4 = *(void *)(a3 + 144);
  if (!v4)
  {
    BOOL v6 = (void *)(a3 + 152);
    uint64_t v7 = *(void *)(a3 + 152);
    if (!v7) {
      return result;
    }
    if (v3 != a3)
    {
      uint64_t v5 = *(void *)(a2 + 152);
      *(void *)(a2 + 144) = 0;
      *(void *)(a2 + 152) = v7;
LABEL_11:
      *(void *)(v7 + 144) = a2;
      goto LABEL_12;
    }
LABEL_17:
    uint64_t v8 = *(void *)(a2 + 152);
    if (v8) {
      *(void *)(v8 + 144) = a3;
    }
    *(void *)(a3 + 144) = a2;
    *(void *)(a3 + 152) = v8;
    *(void *)(a2 + 144) = v4;
    *(void *)(a2 + 152) = a3;
    goto LABEL_25;
  }
  if (v3 == a3)
  {
    *(void *)(v4 + 152) = a2;
    goto LABEL_17;
  }
  if (v4 == a2)
  {
    if (v3) {
      *(void *)(v3 + 152) = a3;
    }
    uint64_t v9 = *(void *)(a3 + 152);
    if (v9) {
      *(void *)(v9 + 144) = a2;
    }
    *(void *)(a2 + 144) = a3;
    *(void *)(a2 + 152) = v9;
    *(void *)(a3 + 144) = v3;
    *(void *)(a3 + 152) = a2;
    goto LABEL_25;
  }
  uint64_t v5 = *(void *)(a2 + 152);
  *(void *)(v4 + 152) = a2;
  BOOL v6 = (void *)(a3 + 152);
  uint64_t v7 = *(void *)(a3 + 152);
  *(void *)(a2 + 144) = v4;
  *(void *)(a2 + 152) = v7;
  if (v7) {
    goto LABEL_11;
  }
LABEL_12:
  *(void *)(a3 + 144) = v3;
  if (v3) {
    *(void *)(v3 + 152) = a3;
  }
  *BOOL v6 = v5;
  if (v5) {
    *(void *)(v5 + 144) = a3;
  }
LABEL_25:
  if (!*(void *)(a2 + 152) || (a2 = a3, !*(void *)(a3 + 152))) {
    *(void *)(result + 112) = a2;
  }
  return result;
}

uint64_t ClipperLib::GetNextInAEL(uint64_t a1, int a2)
{
  uint64_t v2 = 136;
  if (a2 == 1) {
    uint64_t v2 = 128;
  }
  return *(void *)(a1 + v2);
}

uint64_t *ClipperLib::GetHorzDirection(uint64_t *result, int *a2, void *a3, void *a4)
{
  uint64_t v4 = *result;
  uint64_t v5 = result[6];
  BOOL v6 = *result < v5;
  if (*result >= v5) {
    uint64_t v4 = result[6];
  }
  *a3 = v4;
  if (v6) {
    uint64_t v7 = result + 6;
  }
  else {
    uint64_t v7 = result;
  }
  uint64_t v8 = *v7;
  int v9 = v6;
  *a4 = v8;
  *a2 = v9;
  return result;
}

void *ClipperLib::Clipper::BuildIntersectList(void *this, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)this + *(void *)(*this - 24) + 104);
  if (v2)
  {
    this[14] = v2;
    do
    {
      long long v4 = *(_OWORD *)(v2 + 128);
      *(_OWORD *)(v2 + 144) = v4;
      if (*(void *)(v2 + 56) == a2)
      {
        uint64_t v5 = *(void *)(v2 + 48);
      }
      else
      {
        double v6 = *(double *)(v2 + 72) * (double)(a2 - *(void *)(v2 + 8));
        if (v6 >= 0.0) {
          double v7 = 0.5;
        }
        else {
          double v7 = -0.5;
        }
        uint64_t v5 = *(void *)v2 + (uint64_t)(v6 + v7);
      }
      *(void *)(v2 + 24) = v5;
      uint64_t v2 = v4;
    }
    while ((void)v4);
    __asm { FMOV            V8.2S, #-1.0 }
    uint64_t v13 = this[14];
    uint64_t v14 = *(void *)(v13 + 144);
    if (v14)
    {
      do
      {
        long long v20 = 0uLL;
        uint64_t v21 = _D8;
        if (*(void *)(v13 + 24) > *(void *)(v14 + 24))
        {
          ClipperLib::IntersectPoint(v13, v14, (uint64_t *)&v20);
          if (*((uint64_t *)&v20 + 1) < a2)
          {
            if (*(void *)(v13 + 56) == a2)
            {
              uint64_t v15 = *(void *)(v13 + 48);
            }
            else
            {
              double v16 = *(double *)(v13 + 72) * (double)(a2 - *(void *)(v13 + 8));
              if (v16 >= 0.0) {
                double v17 = 0.5;
              }
              else {
                double v17 = -0.5;
              }
              uint64_t v15 = *(void *)v13 + (uint64_t)(v16 + v17);
            }
            *(void *)&long long v20 = v15;
            *((void *)&v20 + 1) = a2;
            uint64_t v21 = _D8;
          }
          operator new();
        }
        uint64_t v13 = v14;
        uint64_t v14 = *(void *)(v14 + 144);
      }
      while (v14);
      uint64_t v18 = *(void *)(v13 + 152);
      if (v18) {
        *(void *)(v18 + 144) = 0;
      }
    }
    else
    {
      uint64_t v19 = *(void *)(v13 + 152);
      if (v19) {
        *(void *)(v19 + 144) = 0;
      }
    }
    this[14] = 0;
  }
  return this;
}

BOOL ClipperLib::Clipper::FixupIntersectionOrder(ClipperLib::Clipper *this)
{
  uint64_t v2 = *(void *)((char *)this + *(void *)(*(void *)this - 24) + 104);
  *((void *)this + 14) = v2;
  if (v2)
  {
    do
    {
      long long v3 = *(_OWORD *)(v2 + 128);
      *(_OWORD *)(v2 + 144) = v3;
      uint64_t v2 = v3;
    }
    while ((void)v3);
  }
  uint64_t v4 = *((void *)this + 7);
  uint64_t v5 = (char *)*((void *)this + 8);
  unint64_t v6 = 126 - 2 * __clz((uint64_t)&v5[-v4] >> 3);
  uint64_t v27 = ClipperLib::IntersectListSort;
  if (v5 == (char *)v4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  BOOL v8 = 1;
  std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **,false>(v4, v5, (uint64_t (**)(uint64_t, uint64_t))&v27, v7, 1);
  uint64_t v9 = *((void *)this + 8) - *((void *)this + 7);
  if (v9)
  {
    BOOL v8 = 0;
    unint64_t v10 = 0;
    unint64_t v11 = v9 >> 3;
    if ((unint64_t)(v9 >> 3) <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v9 >> 3;
    }
    unint64_t v13 = 1;
    do
    {
      if (v11 <= v13) {
        unint64_t v14 = v13;
      }
      else {
        unint64_t v14 = v11;
      }
      uint64_t v15 = *((void *)this + 7);
      double v16 = *(uint64_t **)(v15 + 8 * v10);
      uint64_t v17 = *v16;
      uint64_t v18 = v16[1];
      uint64_t v19 = *(void *)(*v16 + 144);
      if (v19 != v18)
      {
        if (*(void *)(v17 + 152) == v18)
        {
          uint64_t v19 = v16[1];
        }
        else
        {
          unint64_t v20 = v13;
          unint64_t v21 = v10;
          while (1)
          {
            if (v20 >= v11)
            {
              unint64_t v21 = v14;
              goto LABEL_24;
            }
            BOOL v22 = *(uint64_t **)(v15 + 8 * v20);
            uint64_t v24 = *v22;
            uint64_t v23 = v22[1];
            if (*(void *)(v24 + 144) == v23) {
              break;
            }
            ++v20;
            ++v21;
            if (*(void *)(v24 + 152) == v23) {
              goto LABEL_24;
            }
          }
          unint64_t v21 = v20;
LABEL_24:
          if (v21 == v11) {
            return v8;
          }
          *(void *)(v15 + 8 * v10) = *(void *)(v15 + 8 * v21);
          *(void *)(v15 + 8 * v21) = v16;
          uint64_t v25 = *(uint64_t **)(*((void *)this + 7) + 8 * v10);
          uint64_t v17 = *v25;
          uint64_t v19 = v25[1];
        }
      }
      ClipperLib::Clipper::SwapPositionsInSEL((uint64_t)this, v17, v19);
      BOOL v8 = ++v10 >= v11;
      ++v13;
    }
    while (v10 != v12);
  }
  return v8;
}

void *ClipperLib::Clipper::ProcessIntersectList(void *this)
{
  uint64_t v1 = this;
  uint64_t v2 = this[8];
  if (v2 != this[7])
  {
    unint64_t v3 = 0;
    uint64_t v2 = this[7];
    do
    {
      uint64_t v4 = *(uint64_t **)(v2 + 8 * v3);
      ClipperLib::Clipper::IntersectEdges((uint64_t)v1, (_DWORD *)*v4, (_DWORD *)v4[1], v4 + 2);
      ClipperLib::ClipperBase::SwapPositionsInAEL((uint64_t)v1 + *(void *)(*v1 - 24), *v4, v4[1]);
      this = (void *)MEMORY[0x2533C7A10](v4, 0x1020C40E349F4B1);
      ++v3;
      uint64_t v2 = v1[7];
    }
    while (v3 < (v1[8] - v2) >> 3);
  }
  v1[8] = v2;
  return this;
}

uint64_t ClipperLib::Clipper::DisposeIntersectNodes(uint64_t this)
{
  uint64_t v1 = this;
  uint64_t v3 = *(void *)(this + 56);
  uint64_t v2 = *(void *)(this + 64);
  if (v2 == v3)
  {
    uint64_t v3 = *(void *)(this + 64);
  }
  else
  {
    unint64_t v4 = 0;
    do
    {
      this = *(void *)(v3 + 8 * v4);
      if (this)
      {
        this = MEMORY[0x2533C7A10](this, 0x1020C40E349F4B1);
        uint64_t v3 = *(void *)(v1 + 56);
        uint64_t v2 = *(void *)(v1 + 64);
      }
      ++v4;
    }
    while (v4 < (v2 - v3) >> 3);
  }
  *(void *)(v1 + 64) = v3;
  return this;
}

BOOL ClipperLib::IntersectListSort(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24) < *(void *)(a1 + 24);
}

void ClipperLib::Clipper::DoMaxima(uint64_t *a1, uint64_t a2)
{
  ClipperLib::GetMaximaPairEx((void *)a2);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v7 = (void *)(a2 + 128);
    uint64_t v6 = *(void *)(a2 + 128);
    BOOL v8 = v6 != 0;
    if (v6) {
      BOOL v9 = v6 == v4;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      do
      {
        ClipperLib::Clipper::IntersectEdges((uint64_t)a1, (_DWORD *)a2, (_DWORD *)v6, (void *)(a2 + 48));
        ClipperLib::ClipperBase::SwapPositionsInAEL((uint64_t)a1 + *(void *)(*a1 - 24), a2, v6);
        uint64_t v6 = *(void *)(a2 + 128);
        BOOL v8 = v6 != 0;
        if (v6) {
          BOOL v10 = v6 == v5;
        }
        else {
          BOOL v10 = 1;
        }
      }
      while (!v10);
    }
    int v11 = *(_DWORD *)(a2 + 100);
    if (v11 != -1)
    {
      if ((v11 & 0x80000000) == 0)
      {
        if ((*(_DWORD *)(v5 + 100) & 0x80000000) == 0)
        {
          ClipperLib::Clipper::AddLocalMaxPoly(a1, a2, v5, (void *)(a2 + 48));
          uint64_t v12 = *a1;
          unint64_t v13 = (char *)a1 + *(void *)(*a1 - 24);
          uint64_t v15 = *(void *)(a2 + 128);
          uint64_t v14 = *(void *)(a2 + 136);
          if (*(_OWORD *)(a2 + 128) != 0)
          {
            if (v14)
            {
              double v16 = (void *)(v14 + 128);
              goto LABEL_46;
            }
LABEL_45:
            double v16 = v13 + 104;
LABEL_46:
            *double v16 = v15;
            if (v15) {
              *(void *)(v15 + 136) = v14;
            }
LABEL_52:
            *uint64_t v7 = 0;
            *(void *)(a2 + 136) = 0;
            uint64_t v12 = *a1;
            goto LABEL_53;
          }
          if (*((void *)v13 + 13) == a2) {
            goto LABEL_45;
          }
LABEL_53:
          uint64_t v25 = v12;
          goto LABEL_54;
        }
        if (!*(_DWORD *)(a2 + 88))
        {
          ClipperLib::Clipper::AddOutPt(a1, a2, (void *)(a2 + 48));
          *(_DWORD *)(a2 + 100) = -1;
LABEL_27:
          unint64_t v21 = (char *)a1 + *(void *)(*a1 - 24);
          uint64_t v23 = *(void *)(a2 + 128);
          uint64_t v22 = *(void *)(a2 + 136);
          if (*(_OWORD *)(a2 + 128) == 0)
          {
            if (*((void *)v21 + 13) != a2)
            {
LABEL_35:
              if ((*(_DWORD *)(v5 + 100) & 0x80000000) == 0)
              {
                ClipperLib::Clipper::AddOutPt(a1, v5, (void *)(a2 + 48));
                *(_DWORD *)(v5 + 100) = -1;
              }
              uint64_t v25 = *a1;
LABEL_54:
              uint64_t v17 = (char *)a1 + *(void *)(v25 - 24);
              uint64_t v19 = *(void *)(v5 + 128);
              uint64_t v20 = *(void *)(v5 + 136);
              uint64_t v18 = (void *)(v5 + 128);
              if (*(_OWORD *)(v5 + 128) == 0)
              {
                if (*((void *)v17 + 13) != v5) {
                  return;
                }
                goto LABEL_58;
              }
              goto LABEL_55;
            }
          }
          else if (v22)
          {
            uint64_t v24 = (void *)(v22 + 128);
LABEL_32:
            *uint64_t v24 = v23;
            if (v23) {
              *(void *)(v23 + 136) = v22;
            }
            *uint64_t v7 = 0;
            *(void *)(a2 + 136) = 0;
            goto LABEL_35;
          }
          uint64_t v24 = v21 + 104;
          goto LABEL_32;
        }
LABEL_63:
        exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
        ClipperLib::clipperException::clipperException(exception, "DoMaxima error");
      }
LABEL_23:
      if (!*(_DWORD *)(a2 + 88)) {
        goto LABEL_27;
      }
      goto LABEL_63;
    }
    if (*(_DWORD *)(v5 + 100) != -1) {
      goto LABEL_23;
    }
    uint64_t v12 = *a1;
    uint64_t v26 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v27 = *(void *)(a2 + 136);
    if (v27) {
      char v28 = 1;
    }
    else {
      char v28 = v8;
    }
    if (v28)
    {
      if (v27)
      {
        int v29 = (uint64_t *)(v27 + 128);
        goto LABEL_50;
      }
    }
    else if (*((void *)v26 + 13) != a2)
    {
      goto LABEL_53;
    }
    int v29 = (uint64_t *)(v26 + 104);
LABEL_50:
    uint64_t *v29 = v6;
    if (v8) {
      *(void *)(v6 + 136) = v27;
    }
    goto LABEL_52;
  }
  if ((*(_DWORD *)(a2 + 100) & 0x80000000) == 0) {
    ClipperLib::Clipper::AddOutPt(a1, a2, (void *)(a2 + 48));
  }
  uint64_t v17 = (char *)a1 + *(void *)(*a1 - 24);
  uint64_t v19 = *(void *)(a2 + 128);
  uint64_t v20 = *(void *)(a2 + 136);
  uint64_t v18 = (void *)(a2 + 128);
  if (*(_OWORD *)(a2 + 128) == 0)
  {
    if (*((void *)v17 + 13) != a2) {
      return;
    }
    goto LABEL_58;
  }
LABEL_55:
  if (!v20)
  {
LABEL_58:
    uint64_t v30 = v17 + 104;
    goto LABEL_59;
  }
  uint64_t v30 = (void *)(v20 + 128);
LABEL_59:
  *uint64_t v30 = v19;
  if (v19) {
    *(void *)(v19 + 136) = v20;
  }
  *uint64_t v18 = 0;
  v18[1] = 0;
}

void sub_252A9129C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ClipperLib::PointCount(uint64_t a1)
{
  uint64_t v1 = 0;
  if (a1)
  {
    uint64_t v2 = a1;
    do
    {
      uint64_t v1 = (v1 + 1);
      uint64_t v2 = *(void *)(v2 + 32);
    }
    while (v2 != a1);
  }
  return v1;
}

uint64_t std::vector<std::vector<ClipperLib::IntPoint>>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(result, a2);
    v7[1] = v7[0] + v5;
    unint64_t v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 24 * v6;
    std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_252A91374(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::vector<ClipperLib::IntPoint>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 24;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(v3, a2);
    uint64_t v7 = &v6[24 * v5];
    BOOL v9 = &v6[24 * v8];
    int v11 = (char *)*a1;
    BOOL v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
      }
      while (v10 != v11);
      BOOL v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void std::vector<ClipperLib::PolyNode *>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    BOOL v9 = &v6[8 * v8];
    int v11 = (char *)*a1;
    BOOL v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      BOOL v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

__n128 ClipperLib::SwapIntersectNodes(long long *a1, long long *a2)
{
  uint64_t v2 = *((void *)a1 + 4);
  long long v4 = *a1;
  long long v3 = a1[1];
  *a1 = *a2;
  __n128 result = (__n128)a2[1];
  *((void *)a1 + 4) = *((void *)a2 + 4);
  a1[1] = (__int128)result;
  *a2 = v4;
  a2[1] = v3;
  *((void *)a2 + 4) = v2;
  return result;
}

BOOL ClipperLib::GetOverlap(ClipperLib *this, uint64_t a2, uint64_t a3, uint64_t a4, ClipperLib **a5, ClipperLib **a6, uint64_t *a7)
{
  if ((uint64_t)this >= a2)
  {
    if (a3 >= a4)
    {
      if (a2 <= a4) {
        uint64_t v11 = a4;
      }
      else {
        uint64_t v11 = a2;
      }
      *a5 = (ClipperLib *)v11;
      if (a3 >= (uint64_t)this) {
        uint64_t v8 = this;
      }
      else {
        uint64_t v8 = (ClipperLib *)a3;
      }
    }
    else
    {
      if (a2 <= a3) {
        uint64_t v9 = a3;
      }
      else {
        uint64_t v9 = a2;
      }
      *a5 = (ClipperLib *)v9;
      if (a4 >= (uint64_t)this) {
        uint64_t v8 = this;
      }
      else {
        uint64_t v8 = (ClipperLib *)a4;
      }
    }
  }
  else if (a3 >= a4)
  {
    if ((uint64_t)this <= a4) {
      BOOL v10 = (ClipperLib *)a4;
    }
    else {
      BOOL v10 = this;
    }
    *a5 = v10;
    if (a3 >= a2) {
      uint64_t v8 = (ClipperLib *)a2;
    }
    else {
      uint64_t v8 = (ClipperLib *)a3;
    }
  }
  else
  {
    if ((uint64_t)this <= a3) {
      uint64_t v7 = (ClipperLib *)a3;
    }
    else {
      uint64_t v7 = this;
    }
    *a5 = v7;
    if (a4 >= a2) {
      uint64_t v8 = (ClipperLib *)a2;
    }
    else {
      uint64_t v8 = (ClipperLib *)a4;
    }
  }
  *a6 = v8;
  return (uint64_t)*a5 < (uint64_t)v8;
}

void ClipperLib::DupOutPt()
{
}

uint64_t ClipperLib::JoinHorz(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a1[1];
  uint64_t v6 = *(void *)(a2 + 8);
  int v7 = v5 <= v6;
  unsigned int v8 = *(void *)(a3 + 8) <= *(void *)(a4 + 8);
  if (v7 != v8)
  {
    uint64_t v9 = *a5;
    if (v5 <= v6)
    {
      do
      {
        BOOL v10 = a1;
        a1 = (void *)a1[4];
        uint64_t v11 = a1[1];
      }
      while (v11 <= v9 && v11 >= v10[1] && a1[2] == a5[1]);
      ClipperLib::DupOutPt();
    }
    do
    {
      uint64_t v12 = a1;
      a1 = (void *)a1[4];
      uint64_t v13 = a1[1];
    }
    while (v13 >= v9 && v13 <= v12[1] && a1[2] == a5[1]);
    ClipperLib::DupOutPt();
  }
  return v7 ^ v8;
}

uint64_t ClipperLib::Clipper::JoinPoints(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)*a2;
  uint64_t v5 = (void *)a2[1];
  unsigned int v8 = (uint64_t *)(*a2 + 8);
  uint64_t v7 = *v8;
  uint64_t v9 = *(void *)(*a2 + 16);
  BOOL v10 = a2 + 2;
  if (v9 != a2[3])
  {
    uint64_t v48 = (uint64_t)(v6 + 4);
    do
    {
      uint64_t v49 = *(void **)v48;
      uint64_t v51 = *(void *)(*(void *)v48 + 8);
      uint64_t v50 = *(void *)(*(void *)v48 + 16);
      uint64_t v48 = *(void *)v48 + 32;
    }
    while (v49 != v6 && v51 == v7 && v50 == v9);
    if (v50 <= v9
      && (long long v109 = *(_OWORD *)v8,
          uint64_t v110 = v8[2],
          long long v107 = *(_OWORD *)(v49 + 1),
          uint64_t v108 = v49[3],
          long long v105 = *(_OWORD *)v10,
          uint64_t v106 = a2[4],
          uint64_t v54 = *a1,
          ClipperLib::SlopesEqual(&v109, (uint64_t *)&v107, &v105, *((unsigned __int8 *)a1 + *(void *)(*a1 - 24) + 40))))
    {
      uint64_t v84 = v54;
      int v83 = 0;
    }
    else
    {
      uint64_t v49 = v6;
      do
      {
        uint64_t v49 = (void *)v49[5];
        uint64_t v55 = v49[2];
      }
      while (v49 != v6 && v49[1] == v7 && v55 == v9);
      if (v55 > v9) {
        return 0;
      }
      long long v103 = *(_OWORD *)v8;
      uint64_t v104 = v8[2];
      long long v101 = *(_OWORD *)(v49 + 1);
      uint64_t v102 = v49[3];
      long long v99 = *(_OWORD *)v10;
      uint64_t v100 = v10[2];
      uint64_t v58 = *a1;
      uint64_t result = ClipperLib::SlopesEqual(&v103, (uint64_t *)&v101, &v99, *((unsigned __int8 *)a1 + *(void *)(*a1 - 24) + 40));
      if (!result) {
        return result;
      }
      uint64_t v84 = v58;
      int v83 = 1;
    }
    uint64_t v60 = v5 + 1;
    uint64_t v61 = v5[1];
    uint64_t v62 = (uint64_t)(v5 + 4);
    uint64_t v63 = v5[2];
    do
    {
      uint64_t v64 = *(void **)v62;
      uint64_t v66 = *(void *)(*(void *)v62 + 8);
      uint64_t v65 = *(void *)(*(void *)v62 + 16);
      uint64_t v62 = *(void *)v62 + 32;
    }
    while (v66 == v61 && v65 == v63 && v64 != v5);
    if (v65 > v63) {
      goto LABEL_119;
    }
    long long v97 = *(_OWORD *)v60;
    uint64_t v98 = v5[3];
    long long v95 = *(_OWORD *)(v64 + 1);
    uint64_t v96 = v64[3];
    long long v93 = *(_OWORD *)v10;
    uint64_t v94 = v10[2];
    BOOL v69 = ClipperLib::SlopesEqual(&v97, (uint64_t *)&v95, &v93, *((unsigned __int8 *)a1 + *(void *)(v84 - 24) + 40));
    uint64_t v60 = v5 + 1;
    if (v69)
    {
      int v70 = 0;
    }
    else
    {
LABEL_119:
      uint64_t v64 = v5;
      do
      {
        uint64_t v64 = (void *)v64[5];
        uint64_t v71 = v64[2];
      }
      while (v64[1] == v61 && v71 == v63 && v64 != v5);
      if (v71 > v63) {
        return 0;
      }
      long long v91 = *(_OWORD *)v60;
      uint64_t v92 = v60[2];
      long long v89 = *(_OWORD *)(v64 + 1);
      uint64_t v90 = v64[3];
      long long v87 = *(_OWORD *)v10;
      uint64_t v88 = v10[2];
      uint64_t result = ClipperLib::SlopesEqual(&v91, (uint64_t *)&v89, &v87, *((unsigned __int8 *)a1 + *(void *)(v84 - 24) + 40));
      if (!result) {
        return result;
      }
      int v70 = 1;
    }
    uint64_t result = 0;
    if (v49 == v64 || v49 == v6 || v64 == v5) {
      return result;
    }
    if (a3 != a4 || v83 != v70) {
      operator new();
    }
    return 0;
  }
  uint64_t v11 = *v10;
  uint64_t v12 = (void *)*a2;
  if (*v10 == v7)
  {
    BOOL v13 = v11 == v5[1] && v9 == v5[2];
    uint64_t v12 = (void *)*a2;
    if (v13)
    {
      if (a3 == a4)
      {
        uint64_t v74 = (void *)*a2;
        while (1)
        {
          uint64_t v74 = (void *)v74[4];
          if (v74 == v6) {
            break;
          }
          uint64_t v75 = v74[2];
          if (v74[1] != v11 || v75 != v9) {
            goto LABEL_151;
          }
        }
        uint64_t v75 = *(void *)(*a2 + 16);
LABEL_151:
        v77 = (void *)a2[1];
        do
        {
          v77 = (void *)v77[4];
          if (v77 == v5)
          {
            if (v75 > v9) {
              goto LABEL_160;
            }
            return 0;
          }
          uint64_t v78 = v77[2];
        }
        while (v77[1] == v11 && v78 == v9);
        if (v75 > v9 == v78 <= v9) {
LABEL_160:
        }
          operator new();
      }
      return 0;
    }
  }
  do
  {
    uint64_t v14 = v12;
    uint64_t v12 = (void *)v12[5];
  }
  while (v12 != v6 && v12[2] == v9 && v12 != v5);
  uint64_t v17 = v14 + 2;
  do
  {
    uint64_t v18 = (uint64_t)v6;
    uint64_t v6 = (void *)v6[4];
  }
  while (v6 != v14 && v6[2] == v9 && v6 != v5);
  if (v6 == v14 || v6 == v5) {
    return 0;
  }
  uint64_t v22 = v5[2];
  uint64_t v23 = v5;
  do
  {
    uint64_t v24 = (uint64_t)v23;
    uint64_t v23 = (void *)v23[5];
  }
  while (v23 != (void *)v18 && v23[2] == v22 && v23 != v5);
  do
  {
    uint64_t v27 = (uint64_t)v5;
    uint64_t v5 = (void *)v5[4];
  }
  while (v5 != v14 && v5 != (void *)v24 && v5[2] == v22);
  if (v5 == (void *)v24 || v5 == v14) {
    return 0;
  }
  uint64_t v31 = v14[1];
  uint64_t v32 = *(void *)(v18 + 8);
  uint64_t v33 = *(void *)(v24 + 8);
  uint64_t v34 = *(void *)(v27 + 8);
  uint64_t v35 = v32 <= v34 ? *(void *)(v27 + 8) : *(void *)(v18 + 8);
  uint64_t v36 = v33 >= v31 ? v14[1] : *(void *)(v24 + 8);
  uint64_t v37 = v32 <= v33 ? *(void *)(v24 + 8) : *(void *)(v18 + 8);
  uint64_t v38 = v34 >= v31 ? v14[1] : *(void *)(v27 + 8);
  if (v33 >= v34) {
    uint64_t v38 = v36;
  }
  else {
    uint64_t v35 = v37;
  }
  uint64_t v39 = v31 <= v34 ? *(void *)(v27 + 8) : v14[1];
  uint64_t v40 = v33 >= v32 ? *(void *)(v18 + 8) : *(void *)(v24 + 8);
  uint64_t v41 = v31 <= v33 ? *(void *)(v24 + 8) : v14[1];
  uint64_t v42 = v34 >= v32 ? *(void *)(v18 + 8) : *(void *)(v27 + 8);
  if (v33 >= v34)
  {
    uint64_t v43 = v40;
  }
  else
  {
    uint64_t v39 = v41;
    uint64_t v43 = v42;
  }
  if (v31 < v32)
  {
    uint64_t v44 = v43;
  }
  else
  {
    uint64_t v39 = v35;
    uint64_t v44 = v38;
  }
  if (v39 >= v44) {
    return 0;
  }
  if (v31 < v39 || v31 > v44)
  {
    if (v33 < v39 || v33 > v44)
    {
      if (v32 < v39 || v32 > v44)
      {
        uint64_t v17 = (uint64_t *)(v27 + 16);
        uint64_t v45 = (int *)(v27 + 24);
        uint64_t v46 = (int *)(v27 + 28);
      }
      else
      {
        uint64_t v45 = (int *)(v18 + 24);
        uint64_t v46 = (int *)(v18 + 28);
        uint64_t v17 = (uint64_t *)(v18 + 16);
        uint64_t v34 = *(void *)(v18 + 8);
      }
    }
    else
    {
      uint64_t v45 = (int *)(v24 + 24);
      uint64_t v46 = (int *)(v24 + 28);
      uint64_t v17 = (uint64_t *)(v24 + 16);
      uint64_t v34 = *(void *)(v24 + 8);
    }
  }
  else
  {
    uint64_t v45 = (int *)(v14 + 3);
    uint64_t v46 = (int *)v14 + 7;
    uint64_t v34 = v14[1];
  }
  uint64_t v80 = *v17;
  int v81 = *v45;
  int v82 = *v46;
  *a2 = v14;
  a2[1] = v24;
  v111[0] = v34;
  v111[1] = v80;
  int v112 = v81;
  int v113 = v82;
  return ClipperLib::JoinHorz(v14, v18, v24, v27, v111);
}

uint64_t ClipperLib::Clipper::FixupFirstLefts1(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)result;
  uint64_t v4 = *(void *)(*(void *)result - 24);
  uint64_t v5 = *(void *)(result + v4 + 80);
  if (*(void *)(result + v4 + 88) != v5)
  {
    uint64_t v8 = result;
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = *(void *)(v5 + 8 * v9);
      for (uint64_t i = *(void *)(v10 + 8); i; uint64_t i = *(void *)(i + 8))
      {
        if (*(void *)(i + 24)) {
          break;
        }
      }
      if (i == a2)
      {
        uint64_t v12 = *(void *)(v10 + 24);
        if (v12)
        {
          BOOL v13 = *(void **)(a3 + 24);
          uint64_t v14 = *(void *)(v10 + 24);
          while (1)
          {
            uint64_t result = ClipperLib::PointInPolygon((void *)(v14 + 8), v13);
            if ((result & 0x80000000) == 0) {
              break;
            }
            uint64_t v14 = *(void *)(v14 + 32);
            if (v14 == v12) {
              goto LABEL_13;
            }
          }
          if (!result) {
            goto LABEL_14;
          }
LABEL_13:
          *(void *)(v10 + 8) = a3;
          uint64_t v4 = *(void *)(v3 - 24);
        }
      }
LABEL_14:
      ++v9;
      uint64_t v5 = *(void *)(v8 + v4 + 80);
    }
    while (v9 < (*(void *)(v8 + v4 + 88) - v5) >> 3);
  }
  return result;
}

uint64_t ClipperLib::Clipper::FixupFirstLefts2(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *(void *)(a3 + 8);
  uint64_t v3 = *(void *)result;
  uint64_t v4 = *(void *)(result + *(void *)(*(void *)result - 24) + 80);
  if (*(void *)(result + *(void *)(*(void *)result - 24) + 88) != v4)
  {
    uint64_t v7 = result;
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = *(void *)(v4 + 8 * v8);
      uint64_t v10 = *(void *)(v9 + 24);
      if (v9 != a2 && v9 != a3 && v10 != 0)
      {
        uint64_t v13 = *(void *)(v9 + 8);
        if (v13)
        {
          uint64_t v14 = *(void *)(v9 + 8);
          do
          {
            if (*(void *)(v14 + 24)) {
              break;
            }
            uint64_t v14 = *(void *)(v14 + 8);
          }
          while (v14);
        }
        else
        {
          uint64_t v14 = 0;
        }
        if (v14 == a3 || v14 == v20 || v14 == a2)
        {
          uint64_t v15 = *(void **)(a2 + 24);
          uint64_t v16 = *(void *)(v9 + 24);
          while (1)
          {
            uint64_t result = ClipperLib::PointInPolygon((void *)(v16 + 8), v15);
            if ((result & 0x80000000) == 0) {
              break;
            }
            uint64_t v16 = *(void *)(v16 + 32);
            if (v16 == v10)
            {
              uint64_t v17 = a2;
LABEL_29:
              *(void *)(v9 + 8) = v17;
              goto LABEL_30;
            }
          }
          uint64_t v17 = a2;
          if (result) {
            goto LABEL_29;
          }
          uint64_t v18 = *(void **)(a3 + 24);
          uint64_t v19 = v10;
          while (1)
          {
            uint64_t result = ClipperLib::PointInPolygon((void *)(v19 + 8), v18);
            if ((result & 0x80000000) == 0) {
              break;
            }
            uint64_t v19 = *(void *)(v19 + 32);
            if (v19 == v10)
            {
              uint64_t v17 = a3;
              goto LABEL_29;
            }
          }
          uint64_t v17 = a3;
          if (result) {
            goto LABEL_29;
          }
          uint64_t v17 = v20;
          if (v13 == a2) {
            goto LABEL_29;
          }
          uint64_t v17 = v20;
          if (v13 == a3) {
            goto LABEL_29;
          }
        }
      }
LABEL_30:
      ++v8;
      uint64_t v4 = *(void *)(v7 + *(void *)(v3 - 24) + 80);
    }
    while (v8 < (*(void *)(v7 + *(void *)(v3 - 24) + 88) - v4) >> 3);
  }
  return result;
}

uint64_t *ClipperLib::Clipper::FixupFirstLefts3(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *result;
  uint64_t v4 = *(void *)(*result - 24);
  uint64_t v5 = *(uint64_t *)((char *)result + v4 + 80);
  if (*(uint64_t *)((char *)result + v4 + 88) != v5)
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = *(void *)(v5 + 8 * v6);
      if (*(void *)(v7 + 8) == a2 && *(void *)(v7 + 24) != 0)
      {
        *(void *)(v7 + 8) = a3;
        uint64_t v4 = *(void *)(v3 - 24);
      }
      ++v6;
      uint64_t v5 = *(uint64_t *)((char *)result + v4 + 80);
    }
    while (v6 < (*(uint64_t *)((char *)result + v4 + 88) - v5) >> 3);
  }
  return result;
}

double ClipperLib::GetUnitNormal(void *a1, void *a2)
{
  uint64_t v2 = a2[1];
  uint64_t v3 = a1[1];
  BOOL v4 = *a2 == *a1 && v2 == v3;
  double result = 0.0;
  if (!v4) {
    return 1.0
  }
         / sqrt((double)(v2 - v3) * (double)(v2 - v3) + (double)(uint64_t)(*a2 - *a1) * (double)(uint64_t)(*a2 - *a1))
         * (double)(v2 - v3);
  return result;
}

double ClipperLib::ClipperOffset::ClipperOffset(ClipperLib::ClipperOffset *this, double a2, double a3)
{
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  __asm { FMOV            V3.2S, #-1.0 }
  *((void *)this + 22) = _D3;
  *((void *)this + 23) = &unk_2702F8D88;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *(_OWORD *)((char *)this + 237) = 0u;
  *(double *)this = a2;
  *((double *)this + 1) = a3;
  double result = NAN;
  *((_OWORD *)this + 10) = xmmword_252AA0470;
  return result;
}

{
  double result;

  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  __asm { FMOV            V3.2S, #-1.0 }
  *((void *)this + 22) = _D3;
  *((void *)this + 23) = &unk_2702F8D88;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *(_OWORD *)((char *)this + 237) = 0u;
  *(double *)this = a2;
  *((double *)this + 1) = a3;
  double result = NAN;
  *((_OWORD *)this + 10) = xmmword_252AA0470;
  return result;
}

void ClipperLib::ClipperOffset::~ClipperOffset(ClipperLib::ClipperOffset *this)
{
  ClipperLib::ClipperOffset::Clear(this);
  ClipperLib::PolyNode::~PolyNode((ClipperLib::ClipperOffset *)((char *)this + 184));
  uint64_t v2 = (void *)*((void *)this + 11);
  if (v2)
  {
    *((void *)this + 12) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 8);
  if (v3)
  {
    *((void *)this + 9) = v3;
    operator delete(v3);
  }
  BOOL v4 = (void *)*((void *)this + 5);
  if (v4)
  {
    *((void *)this + 6) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void **)((char *)this + 16);
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v5);
}

void *ClipperLib::ClipperOffset::Clear(void *this)
{
  uint64_t v1 = this;
  uint64_t v2 = this[27];
  uint64_t v3 = this[28];
  if ((int)((unint64_t)(v3 - v2) >> 3) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      this = *(void **)(v2 + 8 * v4);
      if (this)
      {
        this = (void *)(*(uint64_t (**)(void *))(*this + 8))(this);
        uint64_t v2 = v1[27];
        uint64_t v3 = v1[28];
      }
      ++v4;
    }
    while (v4 < (int)((unint64_t)(v3 - v2) >> 3));
  }
  v1[28] = v2;
  v1[20] = -1;
  return this;
}

void ClipperLib::ClipperOffset::AddPath(uint64_t a1, void *a2)
{
  if ((int)(-1431655765 * ((a2[1] - *a2) >> 3)) >= 1) {
    operator new();
  }
}

void ClipperLib::ClipperOffset::AddPaths(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  if (a2[1] != *a2)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      ClipperLib::ClipperOffset::AddPath(a1, (void *)(v2 + v5));
      ++v6;
      uint64_t v2 = *a2;
      v5 += 24;
    }
    while (v6 < 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
  }
}

void ClipperLib::ClipperOffset::FixOrientations(ClipperLib::ClipperOffset *this)
{
  uint64_t v2 = *((void *)this + 20);
  if (v2 < 0)
  {
    uint64_t v3 = *((void *)this + 27);
  }
  else
  {
    uint64_t v3 = *((void *)this + 27);
    if (ClipperLib::Area((uint64_t *)(*(void *)(v3 + 8 * (int)v2) + 8)) < 0.0)
    {
      uint64_t v4 = *((void *)this + 28);
      if ((int)((unint64_t)(v4 - v3) >> 3) >= 1)
      {
        uint64_t v5 = 0;
        do
        {
          uint64_t v6 = *(void *)(v3 + 8 * v5);
          int v7 = *(_DWORD *)(v6 + 76);
          if (!v7 || v7 == 1 && ClipperLib::Area((uint64_t *)(v6 + 8)) >= 0.0)
          {
            unint64_t v8 = *(void *)(v6 + 8);
            uint64_t v9 = *(void *)(v6 + 16);
            unint64_t v10 = v9 - 24;
            if (v8 != v9 && v10 > v8)
            {
              unint64_t v12 = v8 + 24;
              do
              {
                uint64_t v13 = *(void *)(v12 - 8);
                long long v14 = *(_OWORD *)(v12 - 24);
                uint64_t v15 = *(void *)(v10 + 16);
                *(_OWORD *)(v12 - 24) = *(_OWORD *)v10;
                *(void *)(v12 - 8) = v15;
                *(_OWORD *)unint64_t v10 = v14;
                *(void *)(v10 + 16) = v13;
                v10 -= 24;
                BOOL v16 = v12 >= v10;
                v12 += 24;
              }
              while (!v16);
              uint64_t v3 = *((void *)this + 27);
              uint64_t v4 = *((void *)this + 28);
            }
          }
          ++v5;
        }
        while (v5 < (int)((unint64_t)(v4 - v3) >> 3));
      }
      return;
    }
  }
  uint64_t v17 = *((void *)this + 28);
  if ((int)((unint64_t)(v17 - v3) >> 3) >= 1)
  {
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = *(void *)(v3 + 8 * v18);
      if (*(_DWORD *)(v19 + 76) == 1 && ClipperLib::Area((uint64_t *)(v19 + 8)) < 0.0)
      {
        unint64_t v20 = *(void *)(v19 + 8);
        uint64_t v21 = *(void *)(v19 + 16);
        unint64_t v22 = v21 - 24;
        if (v20 != v21 && v22 > v20)
        {
          unint64_t v24 = v20 + 24;
          do
          {
            uint64_t v25 = *(void *)(v24 - 8);
            long long v26 = *(_OWORD *)(v24 - 24);
            uint64_t v27 = *(void *)(v22 + 16);
            *(_OWORD *)(v24 - 24) = *(_OWORD *)v22;
            *(void *)(v24 - 8) = v27;
            *(_OWORD *)unint64_t v22 = v26;
            *(void *)(v22 + 16) = v25;
            v22 -= 24;
            BOOL v16 = v24 >= v22;
            v24 += 24;
          }
          while (!v16);
          uint64_t v3 = *((void *)this + 27);
          uint64_t v17 = *((void *)this + 28);
        }
      }
      ++v18;
    }
    while (v18 < (int)((unint64_t)(v17 - v3) >> 3));
  }
}

__n128 ClipperLib::ReversePath(unint64_t *a1)
{
  unint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  unint64_t v3 = v2 - 24;
  if (*a1 != v2 && v3 > v1)
  {
    unint64_t v5 = v1 + 24;
    do
    {
      uint64_t v6 = *(void *)(v5 - 8);
      __n128 result = *(__n128 *)(v5 - 24);
      uint64_t v8 = *(void *)(v3 + 16);
      *(_OWORD *)(v5 - 24) = *(_OWORD *)v3;
      *(void *)(v5 - 8) = v8;
      *(__n128 *)unint64_t v3 = result;
      *(void *)(v3 + 16) = v6;
      v3 -= 24;
      BOOL v9 = v5 >= v3;
      v5 += 24;
    }
    while (!v9);
  }
  return result;
}

void ClipperLib::ClipperOffset::Execute(uint64_t *a1, uint64_t *a2, double a3)
{
  std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100](a2);
  ClipperLib::ClipperOffset::FixOrientations((ClipperLib::ClipperOffset *)a1);
  ClipperLib::ClipperOffset::DoOffset((ClipperLib::ClipperOffset *)a1, a3);
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  uint64_t v48 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v26 = &unk_2702F8E50;
  *(_OWORD *)uint64_t v27 = 0u;
  *(_OWORD *)char v28 = 0u;
  long long v29 = 0u;
  *(_OWORD *)uint64_t v30 = 0u;
  uint64_t v31 = 0;
  v32[0] = v32;
  v32[1] = v32;
  v32[2] = 0;
  char v33 = 0;
  char v40 = 0;
  char v34 = 0;
  char v35 = 0;
  __int16 v44 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &unk_2702F8E98;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v37, a1 + 2, 0, 1);
  if (a3 <= 0.0)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    ClipperLib::ClipperBase::GetBounds((ClipperLib::ClipperBase *)((char *)&v27[-1] + *(v26 - 3)), (uint64_t)&v24);
    std::vector<ClipperLib::IntPoint>::vector(__p, 4uLL);
    uint64_t v6 = *((void *)&v24 + 1);
    uint64_t v7 = v24 - 10;
    uint64_t v8 = v25;
    uint64_t v9 = *((void *)&v25 + 1) + 10;
    unint64_t v10 = __p[0];
    *(void *)__p[0] = v24 - 10;
    v10[1] = v9;
    v8 += 10;
    v10[3] = v8;
    void v10[4] = v9;
    __asm { FMOV            V0.2S, #-1.0 }
    unint64_t v10[2] = _D0;
    v10[5] = _D0;
    v6 -= 10;
    v10[6] = v8;
    v10[7] = v6;
    v10[8] = _D0;
    v10[9] = v7;
    v10[10] = v6;
    v10[11] = _D0;
    ClipperLib::ClipperBase::AddPath((uint64_t)&v27[-1] + *(v26 - 3), (uint64_t)__p, 0, 1);
    char v34 = 1;
    ClipperLib::Clipper::Execute((uint64_t)&v26, 1, a2, 3, 3);
    BOOL v16 = (__n128 *)a2[1];
    if (v16 != (__n128 *)*a2)
    {
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::vector<ClipperLib::IntPoint> *,std::vector<ClipperLib::IntPoint> *,std::vector<ClipperLib::IntPoint> *,0>((__n128 *)(*a2 + 24), v16, *a2);
      uint64_t v18 = v17;
      uint64_t v19 = a2[1];
      if (v19 != v17)
      {
        uint64_t v20 = a2[1];
        do
        {
          unint64_t v22 = *(void **)(v20 - 24);
          v20 -= 24;
          uint64_t v21 = v22;
          if (v22)
          {
            *(void *)(v19 - 16) = v21;
            operator delete(v21);
          }
          uint64_t v19 = v20;
        }
        while (v20 != v18);
      }
      a2[1] = v18;
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  else
  {
    ClipperLib::Clipper::Execute((uint64_t)&v26, 1, a2, 2, 2);
  }
  long long v26 = &unk_2702F8E50;
  uint64_t v37 = &unk_2702F8E98;
  std::__list_imp<long long>::clear(v32);
  if (v30[0])
  {
    v30[1] = v30[0];
    operator delete(v30[0]);
  }
  if (v28[1])
  {
    *(void **)&long long v29 = v28[1];
    operator delete(v28[1]);
  }
  if (v27[0])
  {
    v27[1] = v27[0];
    operator delete(v27[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v37);
}

void sub_252A9307C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (__p) {
    operator delete(__p);
  }
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a17);
  _Unwind_Resume(a1);
}

unint64_t ClipperLib::ClipperOffset::DoOffset(ClipperLib::ClipperOffset *this, double a2)
{
  unint64_t v3 = (uint64_t *)((char *)this + 16);
  std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100]((uint64_t *)this + 2);
  *((double *)this + 14) = a2;
  if (a2 > -1.0e-20 && a2 < 1.0e-20)
  {
    unint64_t result = std::vector<std::vector<ClipperLib::IntPoint>>::reserve(v3, (int)((uint64_t)(*((void *)this + 28) - *((void *)this + 27)) >> 3));
    uint64_t v6 = *((void *)this + 27);
    uint64_t v5 = *((void *)this + 28);
    if ((int)((unint64_t)(v5 - v6) >> 3) >= 1)
    {
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = *(void *)(v6 + 8 * v7);
        if (!*(_DWORD *)(v8 + 76))
        {
          uint64_t v9 = v8 + 8;
          unint64_t v10 = *((void *)this + 3);
          if (v10 >= *((void *)this + 4))
          {
            unint64_t result = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v3, v9);
          }
          else
          {
            std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v3, v9);
            unint64_t result = v10 + 24;
          }
          *((void *)this + 3) = result;
          uint64_t v6 = *((void *)this + 27);
          uint64_t v5 = *((void *)this + 28);
        }
        ++v7;
      }
      while (v7 < (int)((unint64_t)(v5 - v6) >> 3));
    }
    return result;
  }
  double v11 = 0.5;
  if (*(double *)this > 2.0) {
    double v11 = 2.0 / (*(double *)this * *(double *)this);
  }
  *((double *)this + 18) = v11;
  double v12 = *((double *)this + 1);
  double v13 = fabs(a2);
  double v14 = v13 * 0.25;
  if (v12 <= v13 * 0.25) {
    double v14 = *((double *)this + 1);
  }
  if (v12 <= 0.0) {
    double v15 = 0.25;
  }
  else {
    double v15 = v14;
  }
  double v16 = 3.14159265 / acos(1.0 - v15 / v13);
  if (v16 <= v13 * 3.14159265) {
    double v17 = v16;
  }
  else {
    double v17 = v13 * 3.14159265;
  }
  __double2 v18 = __sincos_stret(6.28318531 / v17);
  *((__double2 *)this + 8) = v18;
  *((double *)this + 19) = v17 / 6.28318531;
  if (a2 < 0.0) {
    *((double *)this + 16) = -v18.__sinval;
  }
  unint64_t result = std::vector<std::vector<ClipperLib::IntPoint>>::reserve(v3, (int)((uint64_t)(*((void *)this + 28) - *((void *)this + 27)) >> 2) & 0xFFFFFFFFFFFFFFFELL);
  uint64_t v19 = *((void *)this + 27);
  double v20 = a2;
  if ((int)((unint64_t)(*((void *)this + 28) - v19) >> 3) >= 1)
  {
    uint64_t v21 = 0;
    unint64_t v22 = (int64x2_t **)((char *)this + 40);
    uint64_t v23 = (void **)((char *)this + 64);
    v199 = (float64x2_t **)((char *)this + 88);
    v200 = (void *)((char *)this + 104);
    float64x2_t v196 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0);
    long long v24 = (int64x2_t **)((char *)this + 80);
    __asm
    {
      FMOV            V1.2D, #0.5
      FMOV            V0.2D, #-0.5
    }
    int8x16_t v194 = _Q0;
    int8x16_t v195 = _Q1;
    __asm { FMOV            V12.2S, #-1.0 }
    v186 = v3;
    v197 = (void **)((char *)this + 64);
    do
    {
      uint64_t v32 = *(void *)(v19 + 8 * v21);
      if (v22 != (int64x2_t **)(v32 + 8))
      {
        unint64_t result = (unint64_t)std::vector<ClipperLib::IntPoint>::__assign_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>((char *)this + 40, *(char **)(v32 + 8), *(void *)(v32 + 16), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*(void *)(v32 + 16) - *(void *)(v32 + 8)) >> 3));
        double v20 = a2;
      }
      uint64_t v33 = (uint64_t)(*((void *)this + 6) - *((void *)this + 5)) >> 3;
      unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * v33;
      if (!(-1431655765 * v33)) {
        goto LABEL_259;
      }
      if (v20 <= 0.0)
      {
        if ((int)v34 < 3 || *(_DWORD *)(v32 + 76)) {
          goto LABEL_259;
        }
        *((void *)this + 9) = *((void *)this + 8);
      }
      else
      {
        char v35 = (int64x2_t *)*((void *)this + 8);
        *((void *)this + 9) = v35;
        if (v34 == 1)
        {
          if (*(_DWORD *)(v32 + 72) == 1)
          {
            if (v17 >= 1.0)
            {
              uint64_t v36 = 1;
              float64x2_t v37 = (float64x2_t)xmmword_252AA0300;
              do
              {
                float64x2_t v38 = vmlaq_f64(vcvtq_f64_s64(**v22), v196, v37);
                int64x2_t v39 = vcvtq_s64_f64(vaddq_f64(v38, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v38), v194, v195)));
                if (v35 >= *v24)
                {
                  char v40 = (int64x2_t *)*v23;
                  unint64_t v41 = 0xAAAAAAAAAAAAAAABLL * (((char *)v35 - (unsigned char *)*v23) >> 3);
                  unint64_t v42 = v41 + 1;
                  if (v41 + 1 > 0xAAAAAAAAAAAAAAALL) {
                    goto LABEL_263;
                  }
                  *(float64x2_t *)v188 = v37;
                  if (0x5555555555555556 * (((char *)*v24 - (char *)v40) >> 3) > v42) {
                    unint64_t v42 = 0x5555555555555556 * (((char *)*v24 - (char *)v40) >> 3);
                  }
                  if (0xAAAAAAAAAAAAAAABLL * (((char *)*v24 - (char *)v40) >> 3) >= 0x555555555555555) {
                    unint64_t v43 = 0xAAAAAAAAAAAAAAALL;
                  }
                  else {
                    unint64_t v43 = v42;
                  }
                  if (v43)
                  {
                    int64x2_t v187 = v39;
                    __int16 v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v43);
                    int64x2_t v39 = v187;
                    uint64_t v45 = v44;
                    char v40 = (int64x2_t *)*((void *)this + 8);
                    char v35 = (int64x2_t *)*((void *)this + 9);
                  }
                  else
                  {
                    uint64_t v45 = 0;
                  }
                  uint64_t v46 = (int64x2_t *)&v45[24 * v41];
                  *uint64_t v46 = v39;
                  v46[1].i64[0] = _D12;
                  uint64_t v47 = v46;
                  if (v35 != v40)
                  {
                    do
                    {
                      int64x2_t v48 = *(int64x2_t *)((char *)v35 - 24);
                      v47[-1].i64[1] = v35[-1].i64[1];
                      *(int64x2_t *)((char *)v47 - 24) = v48;
                      uint64_t v47 = (int64x2_t *)((char *)v47 - 24);
                      char v35 = (int64x2_t *)((char *)v35 - 24);
                    }
                    while (v35 != v40);
                    char v40 = (int64x2_t *)*v23;
                  }
                  char v35 = (int64x2_t *)((char *)v46 + 24);
                  *((void *)this + 8) = v47;
                  *((void *)this + 9) = (char *)v46 + 24;
                  *((void *)this + 10) = &v45[24 * v43];
                  if (v40) {
                    operator delete(v40);
                  }
                  float64x2_t v37 = *(float64x2_t *)v188;
                }
                else
                {
                  *char v35 = v39;
                  v35[1].i64[0] = _D12;
                  char v35 = (int64x2_t *)((char *)v35 + 24);
                }
                *((void *)this + 9) = v35;
                float64x2_t v49 = *((float64x2_t *)this + 8);
                float64x2_t v50 = (float64x2_t)vextq_s8((int8x16_t)v49, (int8x16_t)v49, 8uLL);
                v49.f64[0] = -v49.f64[0];
                ++v36;
                float64x2_t v37 = vmlaq_n_f64(vmulq_laneq_f64(v49, v37, 1), v50, v37.f64[0]);
              }
              while (v17 >= (double)v36);
            }
          }
          else
          {
            int v76 = 0;
            double v77 = -1.0;
            double v78 = -1.0;
            do
            {
              double v79 = (double)(*v22)->i64[0] + v77 * v20;
              if (v79 >= 0.0) {
                double v80 = 0.5;
              }
              else {
                double v80 = -0.5;
              }
              uint64_t v81 = (uint64_t)(v79 + v80);
              double v82 = (double)(*v22)->i64[1] + v78 * v20;
              if (v82 >= 0.0) {
                double v83 = 0.5;
              }
              else {
                double v83 = -0.5;
              }
              uint64_t v84 = (uint64_t)(v82 + v83);
              if (v35 >= *v24)
              {
                uint64_t v85 = (int64x2_t *)*v23;
                unint64_t v86 = 0xAAAAAAAAAAAAAAABLL * (((char *)v35 - (unsigned char *)*v23) >> 3);
                unint64_t v87 = v86 + 1;
                if (v86 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  goto LABEL_262;
                }
                if (0x5555555555555556 * (((char *)*v24 - (char *)v85) >> 3) > v87) {
                  unint64_t v87 = 0x5555555555555556 * (((char *)*v24 - (char *)v85) >> 3);
                }
                if (0xAAAAAAAAAAAAAAABLL * (((char *)*v24 - (char *)v85) >> 3) >= 0x555555555555555) {
                  unint64_t v88 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v88 = v87;
                }
                if (v88)
                {
                  long long v89 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v88);
                  uint64_t v85 = (int64x2_t *)*((void *)this + 8);
                  char v35 = (int64x2_t *)*((void *)this + 9);
                }
                else
                {
                  long long v89 = 0;
                }
                uint64_t v90 = (uint64_t *)&v89[24 * v86];
                *uint64_t v90 = v81;
                v90[1] = v84;
                v90[2] = _D12;
                long long v91 = v90;
                if (v35 == v85)
                {
                  uint64_t v23 = (void **)((char *)this + 64);
                }
                else
                {
                  uint64_t v23 = (void **)((char *)this + 64);
                  do
                  {
                    long long v92 = *(long long *)((char *)&v35[-2] + 8);
                    *(v91 - 1) = v35[-1].i64[1];
                    *(_OWORD *)(v91 - 3) = v92;
                    v91 -= 3;
                    char v35 = (int64x2_t *)((char *)v35 - 24);
                  }
                  while (v35 != v85);
                  uint64_t v85 = (int64x2_t *)*v197;
                }
                char v35 = (int64x2_t *)(v90 + 3);
                *((void *)this + 8) = v91;
                *((void *)this + 9) = v90 + 3;
                *((void *)this + 10) = &v89[24 * v88];
                if (v85) {
                  operator delete(v85);
                }
                double v20 = a2;
              }
              else
              {
                v35->i64[0] = v81;
                v35->i64[1] = v84;
                v35[1].i64[0] = _D12;
                char v35 = (int64x2_t *)((char *)v35 + 24);
              }
              *((void *)this + 9) = v35;
              if (v78 >= 0.0) {
                double v93 = v78;
              }
              else {
                double v93 = 1.0;
              }
              if (v78 >= 0.0) {
                double v94 = -1.0;
              }
              else {
                double v94 = v77;
              }
              if (v77 < 0.0)
              {
                double v77 = 1.0;
              }
              else
              {
                double v78 = v93;
                double v77 = v94;
              }
              ++v76;
            }
            while (v76 != 4);
          }
          goto LABEL_152;
        }
      }
      *((void *)this + 12) = *((void *)this + 11);
      std::vector<ClipperLib::DoublePoint>::reserve((void **)v199, (int)v34);
      uint64_t v51 = (v34 - 1);
      int v189 = v34 - 2;
      if ((int)v34 >= 2)
      {
        uint64_t v52 = 0;
        uint64_t v53 = (double *)*((void *)this + 12);
        do
        {
          double UnitNormal = ClipperLib::GetUnitNormal(&(*v22)->i64[3 * v52], &(*v22)[1].i64[3 * v52 + 1]);
          double v56 = UnitNormal;
          uint64_t v57 = v55;
          if ((unint64_t)v53 >= *v200)
          {
            uint64_t v58 = *v199;
            uint64_t v59 = ((char *)v53 - (char *)*v199) >> 4;
            unint64_t v60 = v59 + 1;
            if ((unint64_t)(v59 + 1) >> 60) {
              goto LABEL_261;
            }
            uint64_t v61 = *v200 - (void)v58;
            if (v61 >> 3 > v60) {
              unint64_t v60 = v61 >> 3;
            }
            if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v62 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v62 = v60;
            }
            if (v62)
            {
              uint64_t v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)v200, v62);
              uint64_t v58 = (float64x2_t *)*((void *)this + 11);
              uint64_t v53 = (double *)*((void *)this + 12);
            }
            else
            {
              uint64_t v63 = 0;
            }
            uint64_t v64 = &v63[16 * v59];
            *(double *)uint64_t v64 = v56;
            *((void *)v64 + 1) = v57;
            uint64_t v65 = v64;
            if (v53 != (double *)v58)
            {
              do
              {
                *((_OWORD *)v65 - 1) = *((_OWORD *)v53 - 1);
                v65 -= 16;
                v53 -= 2;
              }
              while (v53 != (double *)v58);
              uint64_t v58 = *v199;
            }
            uint64_t v53 = (double *)(v64 + 16);
            *((void *)this + 11) = v65;
            *((void *)this + 12) = v64 + 16;
            *((void *)this + 13) = &v63[16 * v62];
            if (v58) {
              operator delete(v58);
            }
          }
          else
          {
            *uint64_t v53 = UnitNormal;
            *((void *)v53 + 1) = v55;
            v53 += 2;
          }
          ++v52;
          *((void *)this + 12) = v53;
        }
        while (v52 != v51);
      }
      if (*(_DWORD *)(v32 + 76) >= 2u)
      {
        uint64_t v72 = *((void *)this + 11);
        uint64_t v71 = (float64x2_t *)*((void *)this + 12);
        uint64_t v73 = (float64x2_t *)(v72 + ((uint64_t)((v34 << 32) - 0x200000000) >> 28));
        v201[0] = *v73;
        unint64_t v74 = *((void *)this + 13);
        if ((unint64_t)v71 >= v74)
        {
          uint64_t v101 = ((uint64_t)v71 - v72) >> 4;
          unint64_t v102 = v101 + 1;
          if ((unint64_t)(v101 + 1) >> 60) {
LABEL_261:
          }
            std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
          uint64_t v103 = v74 - v72;
          if (v103 >> 3 > v102) {
            unint64_t v102 = v103 >> 3;
          }
          if ((unint64_t)v103 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v104 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v104 = v102;
          }
          if (v104) {
            long long v105 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)v200, v104);
          }
          else {
            long long v105 = 0;
          }
          uint64_t v108 = &v105[16 * v101];
          *(_OWORD *)uint64_t v108 = v201[0];
          uint64_t v110 = (float64x2_t *)*((void *)this + 11);
          long long v109 = (float64x2_t *)*((void *)this + 12);
          v111 = v108;
          if (v109 != v110)
          {
            do
            {
              *((float64x2_t *)v111 - 1) = v109[-1];
              v111 -= 16;
              --v109;
            }
            while (v109 != v110);
            long long v109 = *v199;
          }
          f64 = v108 + 16;
          *((void *)this + 11) = v111;
          *((void *)this + 12) = v108 + 16;
          *((void *)this + 13) = &v105[16 * v104];
          if (!v109) {
            goto LABEL_147;
          }
          long long v95 = v109;
LABEL_146:
          operator delete(v95);
          goto LABEL_147;
        }
        *uint64_t v71 = *v73;
      }
      else
      {
        double v66 = ClipperLib::GetUnitNormal((void *)(*((void *)this + 5) + 24 * (int)v51), *((void **)this + 5));
        double v68 = v66;
        float64_t v69 = v67;
        uint64_t v71 = (float64x2_t *)*((void *)this + 12);
        unint64_t v70 = *((void *)this + 13);
        if ((unint64_t)v71 >= v70)
        {
          long long v95 = *v199;
          uint64_t v96 = v71 - *v199;
          unint64_t v97 = v96 + 1;
          if ((unint64_t)(v96 + 1) >> 60) {
            goto LABEL_261;
          }
          uint64_t v98 = v70 - (void)v95;
          if (v98 >> 3 > v97) {
            unint64_t v97 = v98 >> 3;
          }
          if ((unint64_t)v98 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v99 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v99 = v97;
          }
          if (v99)
          {
            uint64_t v100 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)v200, v99);
            long long v95 = (float64x2_t *)*((void *)this + 11);
            uint64_t v71 = (float64x2_t *)*((void *)this + 12);
          }
          else
          {
            uint64_t v100 = 0;
          }
          uint64_t v106 = &v100[16 * v96];
          *(double *)uint64_t v106 = v68;
          *((float64_t *)v106 + 1) = v69;
          long long v107 = v106;
          if (v71 != v95)
          {
            do
            {
              *((float64x2_t *)v107 - 1) = v71[-1];
              v107 -= 16;
              --v71;
            }
            while (v71 != v95);
            long long v95 = *v199;
          }
          f64 = v106 + 16;
          *((void *)this + 11) = v107;
          *((void *)this + 12) = v106 + 16;
          *((void *)this + 13) = &v100[16 * v99];
          if (!v95) {
            goto LABEL_147;
          }
          goto LABEL_146;
        }
        v71->f64[0] = v66;
        v71->f64[1] = v67;
      }
      f64 = (void *)v71[1].f64;
LABEL_147:
      *((void *)this + 12) = f64;
      int v112 = *(_DWORD *)(v32 + 76);
      if (v112 == 1)
      {
        LODWORD(v201[0]) = v34 - 1;
        if ((int)v34 >= 1)
        {
          int v117 = 0;
          do
            ClipperLib::ClipperOffset::OffsetPoint(this, v117++, (int *)v201, *(_DWORD *)(v32 + 72));
          while (v34 != v117);
        }
        unint64_t v118 = *((void *)this + 3);
        if (v118 >= *((void *)this + 4))
        {
          unint64_t v119 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v186, (uint64_t)v197);
        }
        else
        {
          std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v186, (uint64_t)v197);
          unint64_t v119 = v118 + 24;
        }
        *((void *)this + 3) = v119;
        *((void *)this + 9) = *((void *)this + 8);
        v126 = (float64x2_t *)*((void *)this + 11);
        float64x2_t v127 = v126[(int)v51];
        if ((int)v34 > 1)
        {
          unint64_t v128 = (v34 - 1);
          do
          {
            BOOL v129 = v128 > 1;
            v126[v128] = vnegq_f64(v126[(v128 - 1)]);
            --v128;
          }
          while (v129);
        }
        float64x2_t *v126 = vnegq_f64(v127);
        LODWORD(v201[0]) = 0;
        if ((int)v34 >= 1)
        {
          do
          {
            ClipperLib::ClipperOffset::OffsetPoint(this, v51, (int *)v201, *(_DWORD *)(v32 + 72));
            LODWORD(v51) = v51 - 1;
          }
          while (v51 != -1);
          unint64_t v119 = *((void *)this + 3);
        }
        uint64_t v23 = (void **)((char *)this + 64);
        if (v119 >= *((void *)this + 4))
        {
          unint64_t result = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v186, (uint64_t)v197);
        }
        else
        {
          std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v186, (uint64_t)v197);
          unint64_t result = v119 + 24;
        }
        goto LABEL_258;
      }
      if (v112)
      {
        LODWORD(v201[0]) = 0;
        uint64_t v23 = (void **)((char *)this + 64);
        if ((int)v34 >= 3)
        {
          int v120 = 2;
          do
            ClipperLib::ClipperOffset::OffsetPoint(this, v120++ - 1, (int *)v201, *(_DWORD *)(v32 + 72));
          while (v34 != v120);
          int v112 = *(_DWORD *)(v32 + 76);
        }
        if (v112 == 2)
        {
          float64x2_t v121 = vmlaq_f64(vcvtq_f64_s64(*(int64x2_t *)(*((void *)this + 5) + 24 * (int)v51)), v196, *(float64x2_t *)(*((void *)this + 11) + 16 * (int)v51));
          int64x2_t v122 = vcvtq_s64_f64(vaddq_f64(v121, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v121), v194, v195)));
          v124 = (int64x2_t *)*((void *)this + 9);
          v123 = (int64x2_t *)*((void *)this + 10);
          if (v124 >= v123)
          {
            v131 = (int64x2_t *)*v197;
            unint64_t v132 = 0xAAAAAAAAAAAAAAABLL * (((char *)v124 - (unsigned char *)*v197) >> 3);
            unint64_t v133 = v132 + 1;
            if (v132 + 1 > 0xAAAAAAAAAAAAAAALL) {
              goto LABEL_263;
            }
            unint64_t v134 = 0xAAAAAAAAAAAAAAABLL * (((char *)v123 - (char *)v131) >> 3);
            if (2 * v134 > v133) {
              unint64_t v133 = 2 * v134;
            }
            if (v134 >= 0x555555555555555) {
              unint64_t v135 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v135 = v133;
            }
            if (v135)
            {
              *(int64x2_t *)v190 = v122;
              v136 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v135);
              int64x2_t v122 = *(int64x2_t *)v190;
              v137 = v136;
              v131 = (int64x2_t *)*((void *)this + 8);
              v124 = (int64x2_t *)*((void *)this + 9);
            }
            else
            {
              v137 = 0;
            }
            v138 = (int64x2_t *)&v137[24 * v132];
            int64x2_t *v138 = v122;
            v138[1].i64[0] = _D12;
            v139 = v138;
            if (v124 != v131)
            {
              do
              {
                int64x2_t v140 = *(int64x2_t *)((char *)v124 - 24);
                v139[-1].i64[1] = v124[-1].i64[1];
                *(int64x2_t *)((char *)v139 - 24) = v140;
                v139 = (int64x2_t *)((char *)v139 - 24);
                v124 = (int64x2_t *)((char *)v124 - 24);
              }
              while (v124 != v131);
              v131 = (int64x2_t *)*v197;
            }
            v123 = (int64x2_t *)&v137[24 * v135];
            v125 = (int64x2_t *)((char *)v138 + 24);
            *((void *)this + 8) = v139;
            *((void *)this + 9) = (char *)v138 + 24;
            *((void *)this + 10) = v123;
            if (v131)
            {
              operator delete(v131);
              v123 = *v24;
            }
          }
          else
          {
            int64x2_t *v124 = v122;
            v124[1].i64[0] = _D12;
            v125 = (int64x2_t *)((char *)v124 + 24);
          }
          *((void *)this + 9) = v125;
          float64x2_t v141 = vmlsq_f64(vcvtq_f64_s64(*(int64x2_t *)(*((void *)this + 5) + 24 * (int)v51)), v196, *(float64x2_t *)(*((void *)this + 11) + 16 * (int)v51));
          int64x2_t v142 = vcvtq_s64_f64(vaddq_f64(v141, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v141), v194, v195)));
          if (v125 >= v123)
          {
            v144 = (int64x2_t *)*v197;
            unint64_t v145 = 0xAAAAAAAAAAAAAAABLL * (((char *)v125 - (unsigned char *)*v197) >> 3);
            unint64_t v146 = v145 + 1;
            if (v145 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_262:
            }
              std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
            unint64_t v147 = 0xAAAAAAAAAAAAAAABLL * (((char *)v123 - (char *)v144) >> 3);
            if (2 * v147 > v146) {
              unint64_t v146 = 2 * v147;
            }
            if (v147 >= 0x555555555555555) {
              unint64_t v148 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v148 = v146;
            }
            if (v148)
            {
              *(int64x2_t *)v191 = v142;
              v149 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v148);
              int64x2_t v142 = *(int64x2_t *)v191;
              v150 = v149;
              v144 = (int64x2_t *)*((void *)this + 8);
              v125 = (int64x2_t *)*((void *)this + 9);
            }
            else
            {
              v150 = 0;
            }
            v151 = (int64x2_t *)&v150[24 * v145];
            int64x2_t *v151 = v142;
            v151[1].i64[0] = _D12;
            v152 = v151;
            if (v125 == v144)
            {
              uint64_t v23 = (void **)((char *)this + 64);
            }
            else
            {
              uint64_t v23 = (void **)((char *)this + 64);
              do
              {
                int64x2_t v153 = *(int64x2_t *)((char *)v125 - 24);
                v152[-1].i64[1] = v125[-1].i64[1];
                *(int64x2_t *)((char *)v152 - 24) = v153;
                v152 = (int64x2_t *)((char *)v152 - 24);
                v125 = (int64x2_t *)((char *)v125 - 24);
              }
              while (v125 != v144);
              v144 = (int64x2_t *)*v197;
            }
            v143 = &v151[1].i8[8];
            *((void *)this + 8) = v152;
            *((void *)this + 9) = (char *)v151 + 24;
            *((void *)this + 10) = &v150[24 * v148];
            if (v144) {
              operator delete(v144);
            }
          }
          else
          {
            int64x2_t *v125 = v142;
            v125[1].i64[0] = _D12;
            v143 = &v125[1].i8[8];
          }
          *((void *)this + 9) = v143;
        }
        else
        {
          *((void *)this + 15) = 0;
          *(float64x2_t *)(*((void *)this + 11) + 16 * (int)v51) = vnegq_f64(*(float64x2_t *)(*((void *)this + 11)
                                                                                                + 16 * (int)v51));
          int v130 = v34 - 1;
          if (v112 == 3) {
            ClipperLib::ClipperOffset::DoSquare(this, v130, v189);
          }
          else {
            ClipperLib::ClipperOffset::DoRound(this, v130, v189);
          }
        }
        if ((int)v34 >= 2)
        {
          v154 = *v199;
          unint64_t v155 = (v34 - 1);
          do
          {
            BOOL v129 = v155 > 1;
            v154[v155] = vnegq_f64(v154[(v155 - 1)]);
            --v155;
          }
          while (v129);
        }
        float64x2_t **v199 = vnegq_f64((*v199)[1]);
        LODWORD(v201[0]) = v34 - 1;
        if ((int)v34 > 2)
        {
          do
          {
            LODWORD(v51) = v51 - 1;
            ClipperLib::ClipperOffset::OffsetPoint(this, v51, (int *)v201, *(_DWORD *)(v32 + 72));
          }
          while (v51 > 1);
        }
        int v156 = *(_DWORD *)(v32 + 76);
        if (v156 == 2)
        {
          float64x2_t v157 = vmlsq_f64(vcvtq_f64_s64(*(int64x2_t *)*((void *)this + 5)), v196, *(float64x2_t *)*((void *)this + 11));
          int64x2_t v158 = vcvtq_s64_f64(vaddq_f64(v157, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v157), v194, v195)));
          v160 = (int64x2_t *)*((void *)this + 9);
          v159 = (int64x2_t *)*((void *)this + 10);
          v161 = v186;
          if (v160 >= v159)
          {
            v163 = (int64x2_t *)*v23;
            unint64_t v164 = 0xAAAAAAAAAAAAAAABLL * (((char *)v160 - (unsigned char *)*v23) >> 3);
            unint64_t v165 = v164 + 1;
            if (v164 + 1 > 0xAAAAAAAAAAAAAAALL) {
              goto LABEL_263;
            }
            unint64_t v166 = 0xAAAAAAAAAAAAAAABLL * (((char *)v159 - (char *)v163) >> 3);
            if (2 * v166 > v165) {
              unint64_t v165 = 2 * v166;
            }
            if (v166 >= 0x555555555555555) {
              unint64_t v167 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v167 = v165;
            }
            if (v167)
            {
              *(int64x2_t *)v192 = v158;
              v168 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v167);
              int64x2_t v158 = *(int64x2_t *)v192;
              v169 = v168;
              v163 = (int64x2_t *)*((void *)this + 8);
              v160 = (int64x2_t *)*((void *)this + 9);
            }
            else
            {
              v169 = 0;
            }
            v170 = (int64x2_t *)&v169[24 * v164];
            int64x2_t *v170 = v158;
            v170[1].i64[0] = _D12;
            v171 = v170;
            if (v160 != v163)
            {
              do
              {
                int64x2_t v172 = *(int64x2_t *)((char *)v160 - 24);
                v171[-1].i64[1] = v160[-1].i64[1];
                *(int64x2_t *)((char *)v171 - 24) = v172;
                v171 = (int64x2_t *)((char *)v171 - 24);
                v160 = (int64x2_t *)((char *)v160 - 24);
              }
              while (v160 != v163);
              v163 = (int64x2_t *)*v23;
            }
            v159 = (int64x2_t *)&v169[24 * v167];
            v162 = (int64x2_t *)((char *)v170 + 24);
            *((void *)this + 8) = v171;
            *((void *)this + 9) = (char *)v170 + 24;
            *((void *)this + 10) = v159;
            if (v163)
            {
              operator delete(v163);
              v159 = *v24;
            }
          }
          else
          {
            int64x2_t *v160 = v158;
            v160[1].i64[0] = _D12;
            v162 = (int64x2_t *)((char *)v160 + 24);
          }
          *((void *)this + 9) = v162;
          float64x2_t v173 = vmlaq_f64(vcvtq_f64_s64(*(int64x2_t *)*((void *)this + 5)), v196, *(float64x2_t *)*((void *)this + 11));
          int64x2_t v174 = vcvtq_s64_f64(vaddq_f64(v173, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v173), v194, v195)));
          if (v162 >= v159)
          {
            v176 = (int64x2_t *)*v23;
            unint64_t v177 = 0xAAAAAAAAAAAAAAABLL * (((char *)v162 - (unsigned char *)*v23) >> 3);
            unint64_t v178 = v177 + 1;
            if (v177 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_263:
            }
              std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
            unint64_t v179 = 0xAAAAAAAAAAAAAAABLL * (((char *)v159 - (char *)v176) >> 3);
            if (2 * v179 > v178) {
              unint64_t v178 = 2 * v179;
            }
            if (v179 >= 0x555555555555555) {
              unint64_t v180 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v180 = v178;
            }
            if (v180)
            {
              *(int64x2_t *)v193 = v174;
              v181 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v180);
              int64x2_t v174 = *(int64x2_t *)v193;
              v182 = v181;
              v176 = (int64x2_t *)*((void *)this + 8);
              v162 = (int64x2_t *)*((void *)this + 9);
            }
            else
            {
              v182 = 0;
            }
            v183 = (int64x2_t *)&v182[24 * v177];
            int64x2_t *v183 = v174;
            v183[1].i64[0] = _D12;
            v184 = v183;
            if (v162 != v176)
            {
              do
              {
                int64x2_t v185 = *(int64x2_t *)((char *)v162 - 24);
                v184[-1].i64[1] = v162[-1].i64[1];
                *(int64x2_t *)((char *)v184 - 24) = v185;
                v184 = (int64x2_t *)((char *)v184 - 24);
                v162 = (int64x2_t *)((char *)v162 - 24);
              }
              while (v162 != v176);
              v176 = (int64x2_t *)*v23;
            }
            v175 = &v183[1].i8[8];
            *((void *)this + 8) = v184;
            *((void *)this + 9) = (char *)v183 + 24;
            *((void *)this + 10) = &v182[24 * v180];
            if (v176) {
              operator delete(v176);
            }
          }
          else
          {
            int64x2_t *v162 = v174;
            v162[1].i64[0] = _D12;
            v175 = &v162[1].i8[8];
          }
          *((void *)this + 9) = v175;
        }
        else
        {
          *((void *)this + 15) = 0;
          v161 = v186;
          if (v156 == 3) {
            ClipperLib::ClipperOffset::DoSquare(this, 0, 1);
          }
          else {
            ClipperLib::ClipperOffset::DoRound(this, 0, 1);
          }
        }
        unint64_t v114 = *((void *)this + 3);
        v115 = v161;
        uint64_t v116 = (uint64_t)v23;
        if (v114 >= *((void *)this + 4)) {
          goto LABEL_257;
        }
        goto LABEL_256;
      }
      LODWORD(v201[0]) = v34 - 1;
      uint64_t v23 = (void **)((char *)this + 64);
      if ((int)v34 >= 1)
      {
        int v113 = 0;
        do
          ClipperLib::ClipperOffset::OffsetPoint(this, v113++, (int *)v201, *(_DWORD *)(v32 + 72));
        while (v34 != v113);
      }
LABEL_152:
      unint64_t v114 = *((void *)this + 3);
      if (v114 >= *((void *)this + 4))
      {
        v115 = v186;
        uint64_t v116 = (uint64_t)v23;
LABEL_257:
        unint64_t result = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v115, v116);
        goto LABEL_258;
      }
      v115 = v186;
      uint64_t v116 = (uint64_t)v23;
LABEL_256:
      std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v115, v116);
      unint64_t result = v114 + 24;
LABEL_258:
      *((void *)this + 3) = result;
      double v20 = a2;
LABEL_259:
      ++v21;
      uint64_t v19 = *((void *)this + 27);
    }
    while (v21 < (int)((unint64_t)(*((void *)this + 28) - v19) >> 3));
  }
  return result;
}

void ClipperLib::ClipperOffset::Execute(ClipperLib::ClipperOffset *this, void **a2, double a3)
{
  ClipperLib::PolyTree::Clear((ClipperLib::PolyTree *)a2);
  ClipperLib::ClipperOffset::FixOrientations(this);
  ClipperLib::ClipperOffset::DoOffset(this, a3);
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  uint64_t v47 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v25 = &unk_2702F8E50;
  *(_OWORD *)long long v26 = 0u;
  *(_OWORD *)uint64_t v27 = 0u;
  long long v28 = 0u;
  *(_OWORD *)long long v29 = 0u;
  uint64_t v30 = 0;
  v31[0] = v31;
  v31[1] = v31;
  v31[2] = 0;
  char v32 = 0;
  char v39 = 0;
  char v33 = 0;
  char v34 = 0;
  __int16 v43 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &unk_2702F8E98;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v36, (uint64_t *)this + 2, 0, 1);
  if (a3 <= 0.0)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    ClipperLib::ClipperBase::GetBounds((ClipperLib::ClipperBase *)((char *)&v26[-1] + *(v25 - 3)), (uint64_t)&v23);
    std::vector<ClipperLib::IntPoint>::vector(__p, 4uLL);
    uint64_t v6 = *((void *)&v23 + 1);
    uint64_t v7 = v23 - 10;
    uint64_t v8 = v24;
    uint64_t v9 = *((void *)&v24 + 1) + 10;
    unint64_t v10 = __p[0];
    *(void *)__p[0] = v23 - 10;
    v10[1] = v9;
    v8 += 10;
    v10[3] = v8;
    void v10[4] = v9;
    __asm { FMOV            V0.2S, #-1.0 }
    unint64_t v10[2] = _D0;
    v10[5] = _D0;
    v6 -= 10;
    v10[6] = v8;
    v10[7] = v6;
    v10[8] = _D0;
    v10[9] = v7;
    v10[10] = v6;
    v10[11] = _D0;
    ClipperLib::ClipperBase::AddPath((uint64_t)&v26[-1] + *(v25 - 3), (uint64_t)__p, 0, 1);
    char v33 = 1;
    ClipperLib::Clipper::Execute((uint64_t)&v25, 1, a2, 3, 3);
    double v16 = a2[4];
    double v17 = (char *)(a2 + 4);
    if ((((unsigned char *)a2[5] - v16) & 0x7FFFFFFF8) == 8
      && (uint64_t v18 = *(void *)v16,
          unint64_t v19 = *(void *)(*(void *)v16 + 40) - *(void *)(*(void *)v16 + 32),
          (int)(v19 >> 3) >= 1))
    {
      std::vector<ClipperLib::PolyNode *>::reserve(a2 + 4, (v19 >> 3));
      **(void **)double v17 = **(void **)(v18 + 32);
      *(void *)(**(void **)v17 + 56) = *(void *)(v18 + 56);
      uint64_t v20 = *(void *)(v18 + 32);
      if ((int)((unint64_t)(*(void *)(v18 + 40) - v20) >> 3) >= 2)
      {
        uint64_t v21 = 1;
        do
        {
          ClipperLib::PolyNode::AddChild((ClipperLib::PolyNode *)a2, *(ClipperLib::PolyNode **)(v20 + 8 * v21++));
          uint64_t v20 = *(void *)(v18 + 32);
        }
        while (v21 < (int)((unint64_t)(*(void *)(v18 + 40) - v20) >> 3));
      }
    }
    else
    {
      ClipperLib::PolyTree::Clear((ClipperLib::PolyTree *)a2);
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  else
  {
    ClipperLib::Clipper::Execute((uint64_t)&v25, 1, a2, 2, 2);
  }
  long long v25 = &unk_2702F8E50;
  uint64_t v36 = &unk_2702F8E98;
  std::__list_imp<long long>::clear(v31);
  if (v29[0])
  {
    v29[1] = v29[0];
    operator delete(v29[0]);
  }
  if (v27[1])
  {
    *(void **)&long long v28 = v27[1];
    operator delete(v27[1]);
  }
  if (v26[0])
  {
    v26[1] = v26[0];
    operator delete(v26[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v36);
}

void sub_252A943EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (__p) {
    operator delete(__p);
  }
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a17);
  _Unwind_Resume(a1);
}

void std::vector<ClipperLib::DoublePoint>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    uint64_t v9 = &v6[16 * v8];
    double v11 = (char *)*a1;
    unint64_t v10 = (char *)a1[1];
    double v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      unint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void ClipperLib::ClipperOffset::OffsetPoint(ClipperLib::ClipperOffset *this, int a2, int *a3, int a4)
{
  uint64_t v4 = a3;
  uint64_t v7 = *((void *)this + 11);
  uint64_t v8 = a2;
  uint64_t v9 = (double *)(v7 + 16 * a2);
  double v11 = *v9;
  double v10 = v9[1];
  float64x2_t v12 = *(float64x2_t *)(v7 + 16 * *a3);
  double v13 = vmlad_n_f64(vmuld_lane_f64(-*v9, v12, 1), v10, v12.f64[0]);
  *((double *)this + 15) = v13;
  double v14 = *((double *)this + 14);
  double v15 = 1.0;
  if (fabs(v13 * v14) >= 1.0)
  {
    if (v13 > 1.0 || (double v15 = -1.0, v13 < -1.0))
    {
      *((double *)this + 15) = v15;
      double v13 = v15;
    }
LABEL_8:
    if (v13 * v14 < 0.0)
    {
      uint64_t v27 = (int64x2_t *)*((void *)this + 10);
      long long v28 = (void **)((char *)this + 64);
      float64x2_t v29 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((void *)this + 5) + 24 * a2)), *(float64x2_t *)(*((void *)this + 11) + 16 * *a3), v14);
      __asm
      {
        FMOV            V3.2D, #0.5
        FMOV            V4.2D, #-0.5
      }
      int64x2_t v32 = vcvtq_s64_f64(vaddq_f64(v29, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v29), _Q4, _Q3)));
      char v33 = (int64x2_t *)*((void *)this + 9);
      int8x16_t v90 = _Q4;
      int8x16_t v91 = _Q3;
      if (v33 >= v27)
      {
        long long v37 = (int64x2_t *)*v28;
        unint64_t v38 = 0xAAAAAAAAAAAAAAABLL * (((char *)v33 - (unsigned char *)*v28) >> 3);
        unint64_t v39 = v38 + 1;
        if (v38 + 1 > 0xAAAAAAAAAAAAAAALL) {
          goto LABEL_84;
        }
        unint64_t v40 = 0xAAAAAAAAAAAAAAABLL * (((char *)v27 - (char *)v37) >> 3);
        if (2 * v40 > v39) {
          unint64_t v39 = 2 * v40;
        }
        if (v40 >= 0x555555555555555) {
          unint64_t v41 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v41 = v39;
        }
        if (v41)
        {
          int64x2_t v89 = v32;
          uint64_t v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v41);
          int64x2_t v32 = v89;
          __int16 v43 = v42;
          long long v37 = (int64x2_t *)*((void *)this + 8);
          char v33 = (int64x2_t *)*((void *)this + 9);
        }
        else
        {
          __int16 v43 = 0;
        }
        uint64_t v51 = (int64x2_t *)&v43[24 * v38];
        uint64_t v27 = (int64x2_t *)&v43[24 * v41];
        int64x2_t *v51 = v32;
        __asm { FMOV            V0.2S, #-1.0 }
        v51[1].i64[0] = _D0;
        uint64_t v35 = &v51[1].i8[8];
        if (v33 != v37)
        {
          do
          {
            int64x2_t v53 = *(int64x2_t *)((char *)v33 - 24);
            v51[-1].i64[1] = v33[-1].i64[1];
            *(int64x2_t *)((char *)v51 - 24) = v53;
            uint64_t v51 = (int64x2_t *)((char *)v51 - 24);
            char v33 = (int64x2_t *)((char *)v33 - 24);
          }
          while (v33 != v37);
          long long v37 = (int64x2_t *)*v28;
        }
        *((void *)this + 8) = v51;
        *((void *)this + 9) = v35;
        *((void *)this + 10) = v27;
        if (v37)
        {
          operator delete(v37);
          uint64_t v27 = (int64x2_t *)*((void *)this + 10);
        }
        _Q4 = v90;
        _Q3 = v91;
      }
      else
      {
        *char v33 = v32;
        __asm { FMOV            V0.2S, #-1.0 }
        v33[1].i64[0] = _D0;
        uint64_t v35 = &v33[1].i8[8];
      }
      *((void *)this + 9) = v35;
      uint64_t v54 = *((void *)this + 5) + 24 * (int)v8;
      if (v35 >= (__int8 *)v27)
      {
        unint64_t v57 = 0xAAAAAAAAAAAAAAABLL * ((v35 - (unsigned char *)*v28) >> 3);
        if (v57 + 1 > 0xAAAAAAAAAAAAAAALL) {
          goto LABEL_84;
        }
        unint64_t v58 = 0xAAAAAAAAAAAAAAABLL * (((char *)v27 - (unsigned char *)*v28) >> 3);
        uint64_t v59 = 2 * v58;
        if (2 * v58 <= v57 + 1) {
          uint64_t v59 = v57 + 1;
        }
        if (v58 >= 0x555555555555555) {
          unint64_t v60 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v60 = v59;
        }
        if (v60) {
          uint64_t v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v60);
        }
        else {
          uint64_t v61 = 0;
        }
        unint64_t v62 = &v61[24 * v57];
        uint64_t v63 = &v61[24 * v60];
        long long v64 = *(_OWORD *)v54;
        *((void *)v62 + 2) = *(void *)(v54 + 16);
        *(_OWORD *)unint64_t v62 = v64;
        double v56 = (int64x2_t *)(v62 + 24);
        double v66 = (char *)*((void *)this + 8);
        uint64_t v65 = (char *)*((void *)this + 9);
        if (v65 != v66)
        {
          do
          {
            long long v67 = *(_OWORD *)(v65 - 24);
            *((void *)v62 - 1) = *((void *)v65 - 1);
            *(_OWORD *)(v62 - 24) = v67;
            v62 -= 24;
            v65 -= 24;
          }
          while (v65 != v66);
          uint64_t v65 = (char *)*v28;
        }
        *((void *)this + 8) = v62;
        *((void *)this + 9) = v56;
        *((void *)this + 10) = v63;
        if (v65) {
          operator delete(v65);
        }
        _Q4 = v90;
        _Q3 = v91;
      }
      else
      {
        long long v55 = *(_OWORD *)v54;
        *((void *)v35 + 2) = *(void *)(v54 + 16);
        *(_OWORD *)uint64_t v35 = v55;
        double v56 = (int64x2_t *)(v35 + 24);
      }
      *((void *)this + 9) = v56;
      unint64_t v68 = *((void *)this + 10);
      float64x2_t v69 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((void *)this + 5) + 24 * (int)v8)), *(float64x2_t *)(*((void *)this + 11) + 16 * v8), *((double *)this + 14));
      int64x2_t v70 = vcvtq_s64_f64(vaddq_f64(v69, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v69), _Q4, _Q3)));
      if ((unint64_t)v56 < v68)
      {
        int64x2_t *v56 = v70;
        __asm { FMOV            V0.2S, #-1.0 }
        v56[1].i64[0] = _D0;
        uint64_t v72 = &v56[1].i8[8];
LABEL_75:
        *((void *)this + 9) = v72;
        goto LABEL_76;
      }
      uint64_t v73 = (int64x2_t *)*v28;
      unint64_t v74 = 0xAAAAAAAAAAAAAAABLL * (((char *)v56 - (unsigned char *)*v28) >> 3);
      unint64_t v75 = v74 + 1;
      if (v74 + 1 <= 0xAAAAAAAAAAAAAAALL)
      {
        unint64_t v76 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v68 - (void)v73) >> 3);
        if (2 * v76 > v75) {
          unint64_t v75 = 2 * v76;
        }
        if (v76 >= 0x555555555555555) {
          unint64_t v77 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v77 = v75;
        }
        if (v77)
        {
          int64x2_t v93 = v70;
          double v78 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v77);
          int64x2_t v70 = v93;
          double v79 = v78;
          uint64_t v73 = (int64x2_t *)*((void *)this + 8);
          double v56 = (int64x2_t *)*((void *)this + 9);
        }
        else
        {
          double v79 = 0;
        }
        double v80 = (int64x2_t *)&v79[24 * v74];
        uint64_t v81 = &v79[24 * v77];
        *double v80 = v70;
        __asm { FMOV            V0.2S, #-1.0 }
        v80[1].i64[0] = _D0;
        uint64_t v72 = &v80[1].i8[8];
        if (v56 != v73)
        {
          do
          {
            int64x2_t v83 = *(int64x2_t *)((char *)v56 - 24);
            v80[-1].i64[1] = v56[-1].i64[1];
            *(int64x2_t *)((char *)v80 - 24) = v83;
            double v80 = (int64x2_t *)((char *)v80 - 24);
            double v56 = (int64x2_t *)((char *)v56 - 24);
          }
          while (v56 != v73);
          uint64_t v73 = (int64x2_t *)*v28;
        }
        *((void *)this + 8) = v80;
        *((void *)this + 9) = v72;
        *((void *)this + 10) = v81;
        if (v73) {
          operator delete(v73);
        }
        goto LABEL_75;
      }
LABEL_84:
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    if (a4)
    {
      if (a4 == 1)
      {
        ClipperLib::ClipperOffset::DoRound(this, a2, *a3);
        goto LABEL_76;
      }
      if (a4 != 2)
      {
LABEL_76:
        *uint64_t v4 = a2;
        return;
      }
      a3 = (int *)*a3;
      double v36 = *(double *)(*((void *)this + 11) + 16 * a2 + 8)
          * *(double *)(*((void *)this + 11) + 16 * (void)a3 + 8)
          + *(double *)(*((void *)this + 11) + 16 * a2) * *(double *)(*((void *)this + 11) + 16 * (void)a3)
          + 1.0;
      if (v36 >= *((double *)this + 18))
      {
        ClipperLib::ClipperOffset::DoMiter(this, a2, (int)a3, v36);
        goto LABEL_76;
      }
    }
    else
    {
      LODWORD(a3) = *a3;
    }
    ClipperLib::ClipperOffset::DoSquare(this, a2, (int)a3);
    goto LABEL_76;
  }
  if (v10 * v12.f64[1] + v12.f64[0] * v11 <= 0.0) {
    goto LABEL_8;
  }
  unint64_t v16 = *((void *)this + 10);
  float64x2_t v17 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((void *)this + 5) + 24 * a2)), v12, v14);
  __asm
  {
    FMOV            V1.2D, #0.5
    FMOV            V3.2D, #-0.5
  }
  int64x2_t v24 = vcvtq_s64_f64(vaddq_f64(v17, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v17), _Q3, _Q1)));
  long long v25 = (int64x2_t *)*((void *)this + 9);
  if ((unint64_t)v25 >= v16)
  {
    uint64_t v44 = (int64x2_t *)*((void *)this + 8);
    unint64_t v45 = 0xAAAAAAAAAAAAAAABLL * (((char *)v25 - (char *)v44) >> 3);
    unint64_t v46 = v45 + 1;
    if (v45 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v47 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - (void)v44) >> 3);
    if (2 * v47 > v46) {
      unint64_t v46 = 2 * v47;
    }
    if (v47 >= 0x555555555555555) {
      unint64_t v48 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v48 = v46;
    }
    if (v48)
    {
      int64x2_t v92 = v24;
      uint64_t v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v48);
      int64x2_t v24 = v92;
      float64x2_t v50 = v49;
      uint64_t v44 = (int64x2_t *)*((void *)this + 8);
      long long v25 = (int64x2_t *)*((void *)this + 9);
    }
    else
    {
      float64x2_t v50 = 0;
    }
    uint64_t v84 = (int64x2_t *)&v50[24 * v45];
    uint64_t v85 = &v50[24 * v48];
    *uint64_t v84 = v24;
    __asm { FMOV            V0.2S, #-1.0 }
    v84[1].i64[0] = _D0;
    unint64_t v87 = &v84[1].i8[8];
    if (v25 != v44)
    {
      do
      {
        int64x2_t v88 = *(int64x2_t *)((char *)v25 - 24);
        v84[-1].i64[1] = v25[-1].i64[1];
        *(int64x2_t *)((char *)v84 - 24) = v88;
        uint64_t v84 = (int64x2_t *)((char *)v84 - 24);
        long long v25 = (int64x2_t *)((char *)v25 - 24);
      }
      while (v25 != v44);
      uint64_t v44 = (int64x2_t *)*((void *)this + 8);
    }
    *((void *)this + 8) = v84;
    *((void *)this + 9) = v87;
    *((void *)this + 10) = v85;
    if (v44) {
      operator delete(v44);
    }
    *((void *)this + 9) = v87;
  }
  else
  {
    *long long v25 = v24;
    __asm { FMOV            V0.2S, #-1.0 }
    v25[1].i64[0] = _D0;
    *((void *)this + 9) = (char *)v25 + 24;
  }
}

void ClipperLib::ClipperOffset::DoSquare(ClipperLib::ClipperOffset *this, int a2, int a3)
{
  uint64_t v5 = *((void *)this + 11);
  uint64_t v6 = (double *)(v5 + 16 * a3);
  double v7 = *v6;
  double v8 = v6[1];
  long double v9 = atan2(*((long double *)this + 15), v8 * *(double *)(v5 + 16 * a2 + 8) + *v6 * *(double *)(v5 + 16 * a2));
  double v10 = tan(v9 * 0.25);
  double v11 = (int64x2_t *)*((void *)this + 10);
  float64x2_t v12 = (uint64_t *)(*((void *)this + 5) + 24 * a2);
  double v13 = *((double *)this + 14);
  double v14 = (double)*v12 + v13 * (v7 - v8 * v10);
  if (v14 >= 0.0) {
    double v15 = 0.5;
  }
  else {
    double v15 = -0.5;
  }
  unint64_t v16 = (void **)((char *)this + 64);
  uint64_t v17 = (uint64_t)(v14 + v15);
  double v18 = (double)v12[1] + v13 * (v8 + v7 * v10);
  if (v18 >= 0.0) {
    double v19 = 0.5;
  }
  else {
    double v19 = -0.5;
  }
  uint64_t v20 = (uint64_t)(v18 + v19);
  uint64_t v21 = (uint64_t *)*((void *)this + 9);
  if (v21 >= (uint64_t *)v11)
  {
    long long v28 = (uint64_t *)*v16;
    unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * (((char *)v21 - (unsigned char *)*v16) >> 3);
    unint64_t v30 = v29 + 1;
    if (v29 + 1 > 0xAAAAAAAAAAAAAAALL) {
      goto LABEL_41;
    }
    double v56 = v10;
    unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * (((char *)v11 - (char *)v28) >> 3);
    if (2 * v31 > v30) {
      unint64_t v30 = 2 * v31;
    }
    if (v31 >= 0x555555555555555) {
      unint64_t v32 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v32 = v30;
    }
    if (v32)
    {
      char v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v32);
      long long v28 = (uint64_t *)*((void *)this + 8);
      uint64_t v21 = (uint64_t *)*((void *)this + 9);
    }
    else
    {
      char v33 = 0;
    }
    char v34 = (uint64_t *)&v33[24 * v29];
    double v11 = (int64x2_t *)&v33[24 * v32];
    *char v34 = v17;
    v34[1] = v20;
    __asm { FMOV            V0.2S, #-1.0 }
    v34[2] = _D0;
    uint64_t v27 = (int64x2_t *)(v34 + 3);
    if (v21 != v28)
    {
      do
      {
        long long v36 = *(_OWORD *)(v21 - 3);
        *(v34 - 1) = *(v21 - 1);
        *(_OWORD *)(v34 - 3) = v36;
        v34 -= 3;
        v21 -= 3;
      }
      while (v21 != v28);
      long long v28 = (uint64_t *)*v16;
    }
    *((void *)this + 8) = v34;
    *((void *)this + 9) = v27;
    *((void *)this + 10) = v11;
    if (v28)
    {
      operator delete(v28);
      double v11 = (int64x2_t *)*((void *)this + 10);
    }
    double v10 = v56;
  }
  else
  {
    *uint64_t v21 = v17;
    v21[1] = v20;
    __asm { FMOV            V1.2S, #-1.0 }
    v21[2] = _D1;
    uint64_t v27 = (int64x2_t *)(v21 + 3);
  }
  *((void *)this + 9) = v27;
  float64x2_t v37 = *(float64x2_t *)(*((void *)this + 11) + 16 * a2);
  *(void *)&v38.f64[0] = vdupq_laneq_s64((int64x2_t)v37, 1).u64[0];
  v38.f64[1] = -v37.f64[0];
  float64x2_t v39 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((void *)this + 5) + 24 * a2)), vmlaq_n_f64(v37, v38, v10), *((double *)this + 14));
  __asm
  {
    FMOV            V1.2D, #0.5
    FMOV            V3.2D, #-0.5
  }
  int64x2_t v42 = vcvtq_s64_f64(vaddq_f64(v39, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v39), _Q3, _Q1)));
  if (v27 < v11)
  {
    *uint64_t v27 = v42;
    __asm { FMOV            V0.2S, #-1.0 }
    v27[1].i64[0] = _D0;
    uint64_t v44 = &v27[1].i8[8];
    goto LABEL_40;
  }
  unint64_t v45 = (int64x2_t *)*v16;
  unint64_t v46 = 0xAAAAAAAAAAAAAAABLL * (((char *)v27 - (unsigned char *)*v16) >> 3);
  unint64_t v47 = v46 + 1;
  if (v46 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_41:
  }
    std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
  unint64_t v48 = 0xAAAAAAAAAAAAAAABLL * (((char *)v11 - (char *)v45) >> 3);
  if (2 * v48 > v47) {
    unint64_t v47 = 2 * v48;
  }
  if (v48 >= 0x555555555555555) {
    unint64_t v49 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v49 = v47;
  }
  if (v49)
  {
    int64x2_t v57 = v42;
    float64x2_t v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v49);
    int64x2_t v42 = v57;
    uint64_t v51 = v50;
    unint64_t v45 = (int64x2_t *)*((void *)this + 8);
    uint64_t v27 = (int64x2_t *)*((void *)this + 9);
  }
  else
  {
    uint64_t v51 = 0;
  }
  uint64_t v52 = (int64x2_t *)&v51[24 * v46];
  int64x2_t v53 = &v51[24 * v49];
  int64x2_t *v52 = v42;
  __asm { FMOV            V0.2S, #-1.0 }
  v52[1].i64[0] = _D0;
  uint64_t v44 = &v52[1].i8[8];
  if (v27 != v45)
  {
    do
    {
      int64x2_t v55 = *(int64x2_t *)((char *)v27 - 24);
      v52[-1].i64[1] = v27[-1].i64[1];
      *(int64x2_t *)((char *)v52 - 24) = v55;
      uint64_t v52 = (int64x2_t *)((char *)v52 - 24);
      uint64_t v27 = (int64x2_t *)((char *)v27 - 24);
    }
    while (v27 != v45);
    unint64_t v45 = (int64x2_t *)*v16;
  }
  *((void *)this + 8) = v52;
  *((void *)this + 9) = v44;
  *((void *)this + 10) = v53;
  if (v45) {
    operator delete(v45);
  }
LABEL_40:
  *((void *)this + 9) = v44;
}

void ClipperLib::ClipperOffset::DoRound(ClipperLib::ClipperOffset *this, int a2, int a3)
{
  uint64_t v4 = *((void *)this + 11);
  uint64_t v5 = (double *)(v4 + 16 * a3);
  uint64_t v6 = a2;
  double v8 = *v5;
  double v7 = v5[1];
  int v9 = 0;
  double v10 = *((double *)this + 19)
      * fabs(atan2(*((long double *)this + 15), v7 * *(double *)(v4 + 16 * a2 + 8) + *v5 * *(double *)(v4 + 16 * a2)));
  if (v10 >= 0.0) {
    double v11 = 0.5;
  }
  else {
    double v11 = -0.5;
  }
  if ((int)(uint64_t)(v10 + v11) <= 1) {
    int v12 = 1;
  }
  else {
    int v12 = (uint64_t)(v10 + v11);
  }
  double v13 = (void **)((char *)this + 64);
  double v14 = (uint64_t *)*((void *)this + 9);
  __asm { FMOV            V8.2S, #-1.0 }
  do
  {
    uint64_t v20 = (uint64_t *)(*((void *)this + 5) + 24 * (int)v6);
    double v21 = *((double *)this + 14);
    double v22 = (double)*v20 + v8 * v21;
    if (v22 >= 0.0) {
      double v23 = 0.5;
    }
    else {
      double v23 = -0.5;
    }
    uint64_t v24 = (uint64_t)(v22 + v23);
    double v25 = (double)v20[1] + v7 * v21;
    if (v25 >= 0.0) {
      double v26 = 0.5;
    }
    else {
      double v26 = -0.5;
    }
    uint64_t v27 = (uint64_t)(v25 + v26);
    unint64_t v28 = *((void *)this + 10);
    if ((unint64_t)v14 >= v28)
    {
      unint64_t v29 = (uint64_t *)*v13;
      unint64_t v30 = 0xAAAAAAAAAAAAAAABLL * (((char *)v14 - (unsigned char *)*v13) >> 3);
      unint64_t v31 = v30 + 1;
      if (v30 + 1 > 0xAAAAAAAAAAAAAAALL) {
        goto LABEL_48;
      }
      unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - (void)v29) >> 3);
      if (2 * v32 > v31) {
        unint64_t v31 = 2 * v32;
      }
      if (v32 >= 0x555555555555555) {
        unint64_t v33 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v33 = v31;
      }
      if (v33)
      {
        char v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v33);
        unint64_t v29 = (uint64_t *)*((void *)this + 8);
        double v14 = (uint64_t *)*((void *)this + 9);
      }
      else
      {
        char v34 = 0;
      }
      uint64_t v35 = (uint64_t *)&v34[24 * v30];
      *uint64_t v35 = v24;
      v35[1] = v27;
      v35[2] = _D8;
      long long v36 = v35;
      if (v14 != v29)
      {
        do
        {
          long long v37 = *(_OWORD *)(v14 - 3);
          *(v36 - 1) = *(v14 - 1);
          *(_OWORD *)(v36 - 3) = v37;
          v36 -= 3;
          v14 -= 3;
        }
        while (v14 != v29);
        unint64_t v29 = (uint64_t *)*v13;
      }
      double v14 = v35 + 3;
      *((void *)this + 8) = v36;
      *((void *)this + 9) = v35 + 3;
      *((void *)this + 10) = &v34[24 * v33];
      if (v29) {
        operator delete(v29);
      }
    }
    else
    {
      *double v14 = v24;
      v14[1] = v27;
      v14[2] = _D8;
      v14 += 3;
    }
    *((void *)this + 9) = v14;
    double v39 = *((double *)this + 16);
    double v38 = *((double *)this + 17);
    double v40 = -(v39 * v7);
    double v7 = v7 * v38 + v8 * v39;
    double v8 = v40 + v8 * v38;
    ++v9;
  }
  while (v9 != v12);
  unint64_t v41 = *((void *)this + 10);
  float64x2_t v42 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((void *)this + 5) + 24 * (int)v6)), *(float64x2_t *)(*((void *)this + 11) + 16 * v6), *((double *)this + 14));
  __asm
  {
    FMOV            V2.2D, #0.5
    FMOV            V3.2D, #-0.5
  }
  int64x2_t v45 = vcvtq_s64_f64(vaddq_f64(v42, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v42), _Q3, _Q2)));
  if ((unint64_t)v14 >= v41)
  {
    unint64_t v47 = (uint64_t *)*v13;
    unint64_t v48 = 0xAAAAAAAAAAAAAAABLL * (((char *)v14 - (unsigned char *)*v13) >> 3);
    unint64_t v49 = v48 + 1;
    if (v48 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_48:
    }
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    unint64_t v50 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v41 - (void)v47) >> 3);
    if (2 * v50 > v49) {
      unint64_t v49 = 2 * v50;
    }
    if (v50 >= 0x555555555555555) {
      unint64_t v51 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v51 = v49;
    }
    if (v51)
    {
      int64x2_t v57 = v45;
      uint64_t v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v51);
      int64x2_t v45 = v57;
      int64x2_t v53 = v52;
      unint64_t v47 = (uint64_t *)*((void *)this + 8);
      double v14 = (uint64_t *)*((void *)this + 9);
    }
    else
    {
      int64x2_t v53 = 0;
    }
    uint64_t v54 = (int64x2_t *)&v53[24 * v48];
    int64x2_t v55 = &v53[24 * v51];
    int64x2_t *v54 = v45;
    v54[1].i64[0] = _D8;
    unint64_t v46 = &v54[1].i64[1];
    if (v14 != v47)
    {
      do
      {
        int64x2_t v56 = *(int64x2_t *)(v14 - 3);
        v54[-1].i64[1] = *(v14 - 1);
        *(int64x2_t *)((char *)v54 - 24) = v56;
        uint64_t v54 = (int64x2_t *)((char *)v54 - 24);
        v14 -= 3;
      }
      while (v14 != v47);
      unint64_t v47 = (uint64_t *)*v13;
    }
    *((void *)this + 8) = v54;
    *((void *)this + 9) = v46;
    *((void *)this + 10) = v55;
    if (v47) {
      operator delete(v47);
    }
  }
  else
  {
    *(int64x2_t *)double v14 = v45;
    v14[2] = _D8;
    unint64_t v46 = v14 + 3;
  }
  *((void *)this + 9) = v46;
}

void ClipperLib::ClipperOffset::DoMiter(ClipperLib::ClipperOffset *this, int a2, int a3, double a4)
{
  uint64_t v5 = (char *)this + 80;
  unint64_t v6 = *((void *)this + 10);
  float64x2_t v7 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((void *)this + 5) + 24 * a2)), vaddq_f64(*(float64x2_t *)(*((void *)this + 11) + 16 * a3), *(float64x2_t *)(*((void *)this + 11) + 16 * a2)), *((double *)this + 14) / a4);
  __asm
  {
    FMOV            V2.2D, #0.5
    FMOV            V3.2D, #-0.5
  }
  int64x2_t v14 = vcvtq_s64_f64(vaddq_f64(v7, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v7), _Q3, _Q2)));
  double v15 = (int64x2_t *)*((void *)this + 9);
  if ((unint64_t)v15 >= v6)
  {
    double v18 = (void **)((char *)this + 64);
    double v19 = (int64x2_t *)*((void *)this + 8);
    unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * (((char *)v15 - (char *)v19) >> 3);
    unint64_t v21 = v20 + 1;
    if (v20 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - (void)v19) >> 3);
    if (2 * v22 > v21) {
      unint64_t v21 = 2 * v22;
    }
    if (v22 >= 0x555555555555555) {
      unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v23 = v21;
    }
    if (v23)
    {
      int64x2_t v30 = v14;
      uint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)v5, v23);
      int64x2_t v14 = v30;
      double v25 = v24;
      double v19 = (int64x2_t *)*((void *)this + 8);
      double v15 = (int64x2_t *)*((void *)this + 9);
    }
    else
    {
      double v25 = 0;
    }
    double v26 = (int64x2_t *)&v25[24 * v20];
    uint64_t v27 = &v25[24 * v23];
    *double v26 = v14;
    __asm { FMOV            V0.2S, #-1.0 }
    v26[1].i64[0] = _D0;
    uint64_t v17 = &v26[1].i8[8];
    if (v15 != v19)
    {
      do
      {
        int64x2_t v29 = *(int64x2_t *)((char *)v15 - 24);
        v26[-1].i64[1] = v15[-1].i64[1];
        *(int64x2_t *)((char *)v26 - 24) = v29;
        double v26 = (int64x2_t *)((char *)v26 - 24);
        double v15 = (int64x2_t *)((char *)v15 - 24);
      }
      while (v15 != v19);
      double v19 = (int64x2_t *)*v18;
    }
    *((void *)this + 8) = v26;
    *((void *)this + 9) = v17;
    *((void *)this + 10) = v27;
    if (v19) {
      operator delete(v19);
    }
  }
  else
  {
    *double v15 = v14;
    __asm { FMOV            V0.2S, #-1.0 }
    v15[1].i64[0] = _D0;
    uint64_t v17 = &v15[1].i8[8];
  }
  *((void *)this + 9) = v17;
}

uint64_t *ClipperLib::ReversePaths(uint64_t *result)
{
  uint64_t v2 = *result;
  uint64_t v1 = result[1];
  if (v1 != *result)
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = (unint64_t *)(v2 + 24 * v3);
      unint64_t v5 = *v4;
      unint64_t v6 = v4[1];
      unint64_t v7 = v6 - 24;
      if (v5 != v6 && v7 > v5)
      {
        unint64_t v9 = v5 + 24;
        do
        {
          uint64_t v10 = *(void *)(v9 - 8);
          long long v11 = *(_OWORD *)(v9 - 24);
          uint64_t v12 = *(void *)(v7 + 16);
          *(_OWORD *)(v9 - 24) = *(_OWORD *)v7;
          *(void *)(v9 - 8) = v12;
          *(_OWORD *)unint64_t v7 = v11;
          *(void *)(v7 + 16) = v10;
          v7 -= 24;
          BOOL v13 = v9 >= v7;
          v9 += 24;
        }
        while (!v13);
        uint64_t v2 = *result;
        uint64_t v1 = result[1];
      }
      ++v3;
    }
    while (v3 < 0xAAAAAAAAAAAAAAABLL * ((v1 - v2) >> 3));
  }
  return result;
}

void ClipperLib::SimplifyPolygon(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v27 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v5 = &unk_2702F8E50;
  *(_OWORD *)unint64_t v6 = 0u;
  *(_OWORD *)unint64_t v7 = 0u;
  long long v8 = 0u;
  *(_OWORD *)__p = 0u;
  uint64_t v10 = 0;
  v11[0] = v11;
  v11[1] = v11;
  unint64_t v11[2] = 0;
  char v12 = 0;
  char v19 = 0;
  char v13 = 0;
  __int16 v23 = 0;
  uint64_t v15 = 0;
  unint64_t v16 = &unk_2702F8E98;
  char v14 = 1;
  ClipperLib::ClipperBase::AddPath((uint64_t)&v16, a1, 0, 1);
  ClipperLib::Clipper::Execute((uint64_t)&v5, 1, a2, a3, a3);
  unint64_t v5 = &unk_2702F8E50;
  unint64_t v16 = &unk_2702F8E98;
  std::__list_imp<long long>::clear(v11);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v7[1])
  {
    *(void **)&long long v8 = v7[1];
    operator delete(v7[1]);
  }
  if (v6[0])
  {
    v6[1] = v6[0];
    operator delete(v6[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v16);
}

void sub_252A954AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void ClipperLib::SimplifyPolygons(uint64_t *a1, uint64_t *a2, int a3)
{
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v27 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v5 = &unk_2702F8E50;
  *(_OWORD *)unint64_t v6 = 0u;
  *(_OWORD *)unint64_t v7 = 0u;
  long long v8 = 0u;
  *(_OWORD *)__p = 0u;
  uint64_t v10 = 0;
  v11[0] = v11;
  v11[1] = v11;
  unint64_t v11[2] = 0;
  char v12 = 0;
  char v19 = 0;
  char v13 = 0;
  __int16 v23 = 0;
  uint64_t v15 = 0;
  unint64_t v16 = &unk_2702F8E98;
  char v14 = 1;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v16, a1, 0, 1);
  ClipperLib::Clipper::Execute((uint64_t)&v5, 1, a2, a3, a3);
  unint64_t v5 = &unk_2702F8E50;
  unint64_t v16 = &unk_2702F8E98;
  std::__list_imp<long long>::clear(v11);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v7[1])
  {
    *(void **)&long long v8 = v7[1];
    operator delete(v7[1]);
  }
  if (v6[0])
  {
    v6[1] = v6[0];
    operator delete(v6[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v16);
}

void sub_252A9561C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void ClipperLib::SimplifyPolygons(uint64_t *a1, int a2)
{
}

double ClipperLib::DistanceFromLineSqrd(uint64_t *a1, uint64_t *a2, void *a3)
{
  uint64_t v3 = a2[1];
  double v4 = (double)(v3 - a3[1]);
  uint64_t v5 = *a3 - *a2;
  double v6 = (double)v5 * (double)a1[1] + v4 * (double)*a1 - ((double)v3 * (double)v5 + v4 * (double)*a2);
  return v6 * v6 / ((double)v5 * (double)v5 + v4 * v4);
}

BOOL ClipperLib::SlopesNearCollinear(uint64_t *a1, uint64_t *a2, uint64_t *a3, double a4)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  if (*a1 - *a2 >= 0) {
    unint64_t v8 = *a1 - *a2;
  }
  else {
    unint64_t v8 = *a2 - *a1;
  }
  uint64_t v9 = v4 - v6;
  if (v4 - v6 >= 0) {
    unint64_t v10 = v4 - v6;
  }
  else {
    unint64_t v10 = v6 - v4;
  }
  if (v8 <= v10)
  {
    uint64_t v14 = a3[1];
    if (v4 <= v6 != v4 < v14)
    {
      double v12 = (double)(v6 - v14);
      uint64_t v13 = *a3 - v7;
      goto LABEL_12;
    }
    if (v4 >= v6 != v6 < v14)
    {
      double v12 = (double)(v4 - v14);
      double v15 = (double)(*a3 - v5);
      goto LABEL_17;
    }
    double v12 = (double)v9;
    double v15 = (double)(v7 - v5);
    double v16 = (double)v4 * v15 + (double)v9 * (double)v5;
    double v17 = (double)*a3;
    double v21 = (double)v14;
LABEL_21:
    double v20 = v15 * v21;
    return (v20 + v12 * v17 - v16) * (v20 + v12 * v17 - v16) / (v15 * v15 + v12 * v12) < a4;
  }
  uint64_t v11 = *a3;
  if (v7 >= v5 == *a3 > v5)
  {
    uint64_t v19 = v7 - v5;
    if (v7 <= v5 != v11 > v7)
    {
      double v12 = (double)(v4 - a3[1]);
      double v15 = (double)(*a3 - v5);
LABEL_17:
      double v16 = (double)v4 * v15 + v12 * (double)v5;
      double v17 = (double)v7;
      double v18 = (double)v6;
      goto LABEL_18;
    }
    double v12 = (double)v9;
    double v15 = (double)v19;
    double v16 = (double)v4 * (double)v19 + (double)v9 * (double)v5;
    double v17 = (double)v11;
    double v21 = (double)a3[1];
    goto LABEL_21;
  }
  double v12 = (double)(v6 - a3[1]);
  uint64_t v13 = v11 - v7;
LABEL_12:
  double v15 = (double)v13;
  double v16 = (double)v6 * (double)v13 + v12 * (double)v7;
  double v17 = (double)v5;
  double v18 = (double)v4;
LABEL_18:
  double v20 = v18 * v15;
  return (v20 + v12 * v17 - v16) * (v20 + v12 * v17 - v16) / (v15 * v15 + v12 * v12) < a4;
}

BOOL ClipperLib::PointsAreClose(uint64_t *a1, uint64_t *a2, double a3)
{
  double v3 = (double)*a1 - (double)*a2;
  double v4 = (double)a1[1] - (double)a2[1];
  return v4 * v4 + v3 * v3 <= a3;
}

uint64_t ClipperLib::ExcludeOp(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  *(void *)(v1 + 32) = *(void *)(a1 + 32);
  *(void *)(*(void *)(a1 + 32) + 40) = v1;
  *(_DWORD *)uint64_t v1 = 0;
  return v1;
}

void *ClipperLib::CleanPolygon(void *result, void *a2)
{
  uint64_t v2 = result[1] - *result;
  if (v2)
  {
    is_mul_ok(v2 / 24, 0x30uLL);
    operator new[]();
  }
  a2[1] = *a2;
  return result;
}

void std::vector<ClipperLib::IntPoint>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<ClipperLib::IntPoint>::__append((void **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 24 * a2;
  }
}

void *ClipperLib::CleanPolygon(void *a1)
{
  return ClipperLib::CleanPolygon(a1, a1);
}

void ClipperLib::CleanPolygons(uint64_t *a1, uint64_t *a2)
{
  std::vector<std::vector<ClipperLib::IntPoint>>::resize(a2, 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3));
  uint64_t v4 = *a1;
  if (a1[1] != *a1)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      ClipperLib::CleanPolygon((void *)(v4 + v5), (void *)(*a2 + v5));
      ++v6;
      uint64_t v4 = *a1;
      v5 += 24;
    }
    while (v6 < 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3));
  }
}

void ClipperLib::CleanPolygons(uint64_t *a1)
{
}

void ClipperLib::Minkowski(uint64_t *a1, void *a2, uint64_t *a3, char a4, unsigned int a5)
{
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  uint64_t v8 = a2[1] - *a2;
  if (v8) {
    _ZF = v6 == v7;
  }
  else {
    _ZF = 1;
  }
  if (_ZF)
  {
    std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100](a3);
  }
  else
  {
    unint64_t v13 = v8 / 24;
    uint64_t v127 = 0;
    unint64_t v128 = 0;
    unint64_t v129 = 0;
    std::vector<std::vector<ClipperLib::IntPoint>>::reserve(&v127, v8 / 24);
    unsigned int v116 = a5;
    unint64_t v14 = (v6 - v7) / 24;
    if (v13 <= 1) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = v13;
    }
    uint64_t v117 = v15;
    __asm { FMOV            V8.2S, #-1.0 }
    uint64_t v20 = 0;
    if (a4)
    {
      double v21 = a2;
      do
      {
        __p[0] = 0;
        __p[1] = 0;
        v131[0] = 0;
        std::vector<ClipperLib::IntPoint>::reserve(__p, v14);
        uint64_t v22 = *a1;
        if (a1[1] != *a1)
        {
          unint64_t v23 = 0;
          uint64_t v24 = (char *)__p[1];
          do
          {
            int64x2_t v25 = vaddq_s64(*(int64x2_t *)(v22 + 24 * v23), *(int64x2_t *)(*v21 + 24 * v20));
            if ((unint64_t)v24 >= v131[0])
            {
              int64x2_t v120 = v25;
              uint64_t v26 = (char *)__p[0];
              unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((v24 - (char *)__p[0]) >> 3);
              unint64_t v28 = v27 + 1;
              if (v27 + 1 > 0xAAAAAAAAAAAAAAALL) {
                std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
              }
              if (0x5555555555555556 * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3) > v28) {
                unint64_t v28 = 0x5555555555555556 * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3) >= 0x555555555555555) {
                unint64_t v29 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v29 = v28;
              }
              if (v29)
              {
                int64x2_t v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)v131, v29);
                uint64_t v26 = (char *)__p[0];
                uint64_t v24 = (char *)__p[1];
              }
              else
              {
                int64x2_t v30 = 0;
              }
              unint64_t v31 = &v30[24 * v27];
              *(int64x2_t *)unint64_t v31 = v120;
              *((void *)v31 + 2) = _D8;
              unint64_t v32 = v31;
              if (v24 == v26)
              {
                double v21 = a2;
              }
              else
              {
                double v21 = a2;
                do
                {
                  long long v33 = *(_OWORD *)(v24 - 24);
                  *((void *)v32 - 1) = *((void *)v24 - 1);
                  *(_OWORD *)(v32 - 24) = v33;
                  v32 -= 24;
                  v24 -= 24;
                }
                while (v24 != v26);
                uint64_t v26 = (char *)__p[0];
              }
              uint64_t v24 = v31 + 24;
              __p[0] = v32;
              __p[1] = v31 + 24;
              v131[0] = &v30[24 * v29];
              if (v26) {
                operator delete(v26);
              }
            }
            else
            {
              *(int64x2_t *)uint64_t v24 = v25;
              *((void *)v24 + 2) = _D8;
              v24 += 24;
            }
            __p[1] = v24;
            ++v23;
            uint64_t v22 = *a1;
          }
          while (v23 < 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3));
        }
        char v34 = v128;
        if ((unint64_t)v128 >= v129)
        {
          uint64_t v35 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(&v127, (uint64_t)__p);
        }
        else
        {
          *unint64_t v128 = 0;
          v34[1] = 0;
          v34[2] = 0;
          std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v34, __p[0], (uint64_t)__p[1], 0xAAAAAAAAAAAAAAABLL * (((char *)__p[1] - (char *)__p[0]) >> 3));
          uint64_t v35 = (uint64_t)(v34 + 3);
        }
        unint64_t v128 = (void *)v35;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        ++v20;
      }
      while (v20 != v117);
    }
    else
    {
      long long v36 = a2;
      do
      {
        __p[0] = 0;
        __p[1] = 0;
        v131[0] = 0;
        std::vector<ClipperLib::IntPoint>::reserve(__p, v14);
        uint64_t v37 = *a1;
        if (a1[1] != *a1)
        {
          unint64_t v38 = 0;
          double v39 = (char *)__p[1];
          do
          {
            int64x2_t v40 = vsubq_s64(*(int64x2_t *)(*v36 + 24 * v20), *(int64x2_t *)(v37 + 24 * v38));
            if ((unint64_t)v39 >= v131[0])
            {
              int64x2_t v121 = v40;
              unint64_t v41 = (char *)__p[0];
              unint64_t v42 = 0xAAAAAAAAAAAAAAABLL * ((v39 - (char *)__p[0]) >> 3);
              unint64_t v43 = v42 + 1;
              if (v42 + 1 > 0xAAAAAAAAAAAAAAALL) {
                std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
              }
              if (0x5555555555555556 * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3) > v43) {
                unint64_t v43 = 0x5555555555555556 * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3) >= 0x555555555555555) {
                unint64_t v44 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v44 = v43;
              }
              if (v44)
              {
                int64x2_t v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)v131, v44);
                unint64_t v41 = (char *)__p[0];
                double v39 = (char *)__p[1];
              }
              else
              {
                int64x2_t v45 = 0;
              }
              unint64_t v46 = &v45[24 * v42];
              *(int64x2_t *)unint64_t v46 = v121;
              *((void *)v46 + 2) = _D8;
              unint64_t v47 = v46;
              if (v39 == v41)
              {
                long long v36 = a2;
              }
              else
              {
                long long v36 = a2;
                do
                {
                  long long v48 = *(_OWORD *)(v39 - 24);
                  *((void *)v47 - 1) = *((void *)v39 - 1);
                  *(_OWORD *)(v47 - 24) = v48;
                  v47 -= 24;
                  v39 -= 24;
                }
                while (v39 != v41);
                unint64_t v41 = (char *)__p[0];
              }
              double v39 = v46 + 24;
              __p[0] = v47;
              __p[1] = v46 + 24;
              v131[0] = &v45[24 * v44];
              if (v41) {
                operator delete(v41);
              }
            }
            else
            {
              *(int64x2_t *)double v39 = v40;
              *((void *)v39 + 2) = _D8;
              v39 += 24;
            }
            __p[1] = v39;
            ++v38;
            uint64_t v37 = *a1;
          }
          while (v38 < 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3));
        }
        unint64_t v49 = v128;
        if ((unint64_t)v128 >= v129)
        {
          uint64_t v50 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(&v127, (uint64_t)__p);
        }
        else
        {
          *unint64_t v128 = 0;
          v49[1] = 0;
          v49[2] = 0;
          std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v49, __p[0], (uint64_t)__p[1], 0xAAAAAAAAAAAAAAABLL * (((char *)__p[1] - (char *)__p[0]) >> 3));
          uint64_t v50 = (uint64_t)(v49 + 3);
        }
        unint64_t v128 = (void *)v50;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        ++v20;
      }
      while (v20 != v117);
    }
    std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100](a3);
    unint64_t v51 = v13 + v116;
    std::vector<std::vector<ClipperLib::IntPoint>>::reserve(a3, v51 + v51 * v14);
    unint64_t v118 = v51 - 1;
    if (v51 != 1)
    {
      unint64_t v52 = 0;
      if (v14 <= 1) {
        uint64_t v53 = 1;
      }
      else {
        uint64_t v53 = v14;
      }
      uint64_t v119 = v53;
      do
      {
        unint64_t v54 = 0;
        unint64_t v122 = v52;
        unint64_t v55 = v52 + 1;
        do
        {
          v124 = 0;
          v125 = 0;
          v126 = 0;
          std::vector<ClipperLib::IntPoint>::reserve(&v124, 4uLL);
          uint64_t v56 = *(void *)(v127 + 24 * (v122 % v13)) + 24 * (v54 % v14);
          int64x2_t v57 = v125;
          if (v125 >= v126)
          {
            unint64_t v60 = 0xAAAAAAAAAAAAAAABLL * ((v125 - (unsigned char *)v124) >> 3);
            unint64_t v61 = v60 + 1;
            if (v60 + 1 > 0xAAAAAAAAAAAAAAALL) {
              goto LABEL_154;
            }
            if (0x5555555555555556 * ((v126 - (unsigned char *)v124) >> 3) > v61) {
              unint64_t v61 = 0x5555555555555556 * ((v126 - (unsigned char *)v124) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v126 - (unsigned char *)v124) >> 3) >= 0x555555555555555) {
              unint64_t v62 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v62 = v61;
            }
            if (v62) {
              uint64_t v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)&v126, v62);
            }
            else {
              uint64_t v63 = 0;
            }
            long long v64 = &v63[24 * v60];
            long long v65 = *(_OWORD *)v56;
            *((void *)v64 + 2) = *(void *)(v56 + 16);
            *(_OWORD *)long long v64 = v65;
            long long v67 = (char *)v124;
            double v66 = v125;
            unint64_t v68 = v64;
            if (v125 != v124)
            {
              do
              {
                long long v69 = *(_OWORD *)(v66 - 24);
                *((void *)v68 - 1) = *((void *)v66 - 1);
                *(_OWORD *)(v68 - 24) = v69;
                v68 -= 24;
                v66 -= 24;
              }
              while (v66 != v67);
              double v66 = (char *)v124;
            }
            uint64_t v59 = v64 + 24;
            v124 = v68;
            v125 = v64 + 24;
            v126 = &v63[24 * v62];
            if (v66) {
              operator delete(v66);
            }
          }
          else
          {
            long long v58 = *(_OWORD *)v56;
            *((void *)v125 + 2) = *(void *)(v56 + 16);
            _OWORD *v57 = v58;
            uint64_t v59 = (char *)v57 + 24;
          }
          v125 = v59;
          uint64_t v70 = *(void *)(v127 + 24 * (v55 % v13)) + 24 * (v54 % v14);
          if (v59 >= v126)
          {
            unint64_t v73 = 0xAAAAAAAAAAAAAAABLL * ((v59 - (unsigned char *)v124) >> 3);
            unint64_t v74 = v73 + 1;
            if (v73 + 1 > 0xAAAAAAAAAAAAAAALL) {
              goto LABEL_154;
            }
            if (0x5555555555555556 * ((v126 - (unsigned char *)v124) >> 3) > v74) {
              unint64_t v74 = 0x5555555555555556 * ((v126 - (unsigned char *)v124) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v126 - (unsigned char *)v124) >> 3) >= 0x555555555555555) {
              unint64_t v75 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v75 = v74;
            }
            if (v75) {
              unint64_t v76 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)&v126, v75);
            }
            else {
              unint64_t v76 = 0;
            }
            unint64_t v77 = &v76[24 * v73];
            long long v78 = *(_OWORD *)v70;
            *((void *)v77 + 2) = *(void *)(v70 + 16);
            *(_OWORD *)unint64_t v77 = v78;
            double v80 = (char *)v124;
            double v79 = v125;
            uint64_t v81 = v77;
            if (v125 != v124)
            {
              do
              {
                long long v82 = *(_OWORD *)(v79 - 24);
                *((void *)v81 - 1) = *((void *)v79 - 1);
                *(_OWORD *)(v81 - 24) = v82;
                v81 -= 24;
                v79 -= 24;
              }
              while (v79 != v80);
              double v79 = (char *)v124;
            }
            uint64_t v72 = v77 + 24;
            v124 = v81;
            v125 = v77 + 24;
            v126 = &v76[24 * v75];
            if (v79) {
              operator delete(v79);
            }
          }
          else
          {
            long long v71 = *(_OWORD *)v70;
            *((void *)v59 + 2) = *(void *)(v70 + 16);
            *(_OWORD *)uint64_t v59 = v71;
            uint64_t v72 = v59 + 24;
          }
          v125 = v72;
          uint64_t v83 = *(void *)(v127 + 24 * (v55 % v13)) + 24 * (++v54 % v14);
          if (v72 >= v126)
          {
            unint64_t v86 = 0xAAAAAAAAAAAAAAABLL * ((v72 - (unsigned char *)v124) >> 3);
            unint64_t v87 = v86 + 1;
            if (v86 + 1 > 0xAAAAAAAAAAAAAAALL) {
              goto LABEL_154;
            }
            if (0x5555555555555556 * ((v126 - (unsigned char *)v124) >> 3) > v87) {
              unint64_t v87 = 0x5555555555555556 * ((v126 - (unsigned char *)v124) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v126 - (unsigned char *)v124) >> 3) >= 0x555555555555555) {
              unint64_t v88 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v88 = v87;
            }
            if (v88) {
              int64x2_t v89 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)&v126, v88);
            }
            else {
              int64x2_t v89 = 0;
            }
            int8x16_t v90 = &v89[24 * v86];
            long long v91 = *(_OWORD *)v83;
            *((void *)v90 + 2) = *(void *)(v83 + 16);
            *(_OWORD *)int8x16_t v90 = v91;
            int64x2_t v93 = (char *)v124;
            int64x2_t v92 = v125;
            double v94 = v90;
            if (v125 != v124)
            {
              do
              {
                long long v95 = *(_OWORD *)(v92 - 24);
                *((void *)v94 - 1) = *((void *)v92 - 1);
                *(_OWORD *)(v94 - 24) = v95;
                v94 -= 24;
                v92 -= 24;
              }
              while (v92 != v93);
              int64x2_t v92 = (char *)v124;
            }
            uint64_t v85 = v90 + 24;
            v124 = v94;
            v125 = v90 + 24;
            v126 = &v89[24 * v88];
            if (v92) {
              operator delete(v92);
            }
          }
          else
          {
            long long v84 = *(_OWORD *)v83;
            *((void *)v72 + 2) = *(void *)(v83 + 16);
            *(_OWORD *)uint64_t v72 = v84;
            uint64_t v85 = v72 + 24;
          }
          v125 = v85;
          uint64_t v96 = *(void *)(v127 + 24 * (v122 % v13)) + 24 * (v54 % v14);
          if (v85 >= v126)
          {
            unint64_t v99 = 0xAAAAAAAAAAAAAAABLL * ((v85 - (unsigned char *)v124) >> 3);
            unint64_t v100 = v99 + 1;
            if (v99 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_154:
            }
              std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * ((v126 - (unsigned char *)v124) >> 3) > v100) {
              unint64_t v100 = 0x5555555555555556 * ((v126 - (unsigned char *)v124) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v126 - (unsigned char *)v124) >> 3) >= 0x555555555555555) {
              unint64_t v101 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v101 = v100;
            }
            if (v101) {
              unint64_t v102 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)&v126, v101);
            }
            else {
              unint64_t v102 = 0;
            }
            uint64_t v103 = &v102[24 * v99];
            long long v104 = *(_OWORD *)v96;
            *((void *)v103 + 2) = *(void *)(v96 + 16);
            *(_OWORD *)uint64_t v103 = v104;
            uint64_t v106 = (char *)v124;
            long long v105 = v125;
            long long v107 = v103;
            if (v125 != v124)
            {
              do
              {
                long long v108 = *(_OWORD *)(v105 - 24);
                *((void *)v107 - 1) = *((void *)v105 - 1);
                *(_OWORD *)(v107 - 24) = v108;
                v107 -= 24;
                v105 -= 24;
              }
              while (v105 != v106);
              long long v105 = (char *)v124;
            }
            uint64_t v98 = v103 + 24;
            v124 = v107;
            v125 = v103 + 24;
            v126 = &v102[24 * v101];
            if (v105) {
              operator delete(v105);
            }
          }
          else
          {
            long long v97 = *(_OWORD *)v96;
            *((void *)v85 + 2) = *(void *)(v96 + 16);
            *(_OWORD *)uint64_t v85 = v97;
            uint64_t v98 = v85 + 24;
          }
          v125 = v98;
          if (ClipperLib::Area((uint64_t *)&v124) < 0.0 && v124 != v98)
          {
            long long v109 = v98 - 24;
            if (v98 - 24 > v124)
            {
              uint64_t v110 = (char *)v124 + 24;
              do
              {
                *(_OWORD *)__p = *(_OWORD *)(v110 - 24);
                long long v111 = *(_OWORD *)__p;
                v131[0] = *((void *)v110 - 1);
                uint64_t v112 = v131[0];
                uint64_t v113 = *((void *)v109 + 2);
                *(_OWORD *)(v110 - 24) = *(_OWORD *)v109;
                *((void *)v110 - 1) = v113;
                *((void *)v109 + 2) = v112;
                *(_OWORD *)long long v109 = v111;
                v109 -= 24;
                _CF = v110 >= v109;
                v110 += 24;
              }
              while (!_CF);
            }
          }
          unint64_t v114 = a3[1];
          if (v114 >= a3[2])
          {
            uint64_t v115 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(a3, (uint64_t)&v124);
          }
          else
          {
            std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)a3, (uint64_t)&v124);
            uint64_t v115 = v114 + 24;
          }
          a3[1] = v115;
          if (v124)
          {
            v125 = (char *)v124;
            operator delete(v124);
          }
        }
        while (v54 != v119);
        unint64_t v52 = v55;
      }
      while (v55 != v118);
    }
    __p[0] = &v127;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  }
}

void sub_252A96644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,char *__p,uint64_t a24)
{
  __p = &a20;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

void ClipperLib::MinkowskiSum(uint64_t *a1, void *a2, uint64_t *a3, unsigned int a4)
{
  ClipperLib::Minkowski(a1, a2, a3, 1, a4);
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v27 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = &unk_2702F8E50;
  *(_OWORD *)uint64_t v6 = 0u;
  *(_OWORD *)uint64_t v7 = 0u;
  long long v8 = 0u;
  *(_OWORD *)__p = 0u;
  uint64_t v10 = 0;
  v11[0] = v11;
  v11[1] = v11;
  unint64_t v11[2] = 0;
  char v12 = 0;
  char v19 = 0;
  char v13 = 0;
  char v14 = 0;
  __int16 v23 = 0;
  uint64_t v15 = 0;
  double v16 = &unk_2702F8E98;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v16, a3, 0, 1);
  ClipperLib::Clipper::Execute((uint64_t)&v5, 1, a3, 1, 1);
  uint64_t v5 = &unk_2702F8E50;
  double v16 = &unk_2702F8E98;
  std::__list_imp<long long>::clear(v11);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v7[1])
  {
    *(void **)&long long v8 = v7[1];
    operator delete(v7[1]);
  }
  if (v6[0])
  {
    v6[1] = v6[0];
    operator delete(v6[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v16);
}

void sub_252A9680C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void ClipperLib::TranslatePath(void *a1, int64x2_t **a2, int64x2_t *a3)
{
  std::vector<ClipperLib::IntPoint>::resize((uint64_t)a2, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 3));
  uint64_t v6 = (_OWORD *)*a1;
  uint64_t v7 = a1[1] - *a1;
  if (v7)
  {
    unint64_t v8 = v7 / 24;
    if (v8 <= 1) {
      unint64_t v8 = 1;
    }
    uint64_t v9 = *a2 + 1;
    __asm { FMOV            V0.2S, #-1.0 }
    do
    {
      int64x2_t v15 = *(int64x2_t *)v6;
      uint64_t v6 = (_OWORD *)((char *)v6 + 24);
      v9[-1] = vaddq_s64(*a3, v15);
      v9->i64[0] = _D0;
      uint64_t v9 = (int64x2_t *)((char *)v9 + 24);
      --v8;
    }
    while (v8);
  }
}

void ClipperLib::MinkowskiSum(uint64_t *a1, uint64_t *a2, uint64_t *a3, unsigned int a4)
{
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v46 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v24 = &unk_2702F8E50;
  *(_OWORD *)uint64_t v25 = 0u;
  *(_OWORD *)uint64_t v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v29 = 0;
  v30[0] = v30;
  v30[1] = v30;
  v30[2] = 0;
  char v31 = 0;
  char v38 = 0;
  char v32 = 0;
  char v33 = 0;
  __int16 v42 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &unk_2702F8E98;
  uint64_t v4 = *a2;
  if (a2[1] != *a2)
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      ClipperLib::Minkowski(a1, (void *)(v4 + 24 * v8), &v21, 1, a4);
      uint64_t v9 = v21;
      if (v22 != v21)
      {
        uint64_t v10 = 0;
        unint64_t v11 = 0;
        char v12 = (char *)&v25[-1] + *(v24 - 3);
        do
        {
          (*(void (**)(char *, uint64_t, void, uint64_t))(*(void *)v12 + 16))(v12, v9 + v10, 0, 1);
          ++v11;
          uint64_t v9 = v21;
          v10 += 24;
        }
        while (v11 < 0xAAAAAAAAAAAAAAABLL * ((v22 - v21) >> 3));
      }
      if (a4)
      {
        __p = 0;
        char v19 = 0;
        uint64_t v20 = 0;
        char v13 = (void *)(*a2 + 24 * v8);
        uint64_t v14 = *a1;
        int64x2_t v16 = *(int64x2_t *)*a1;
        uint64_t v17 = *(void *)(v14 + 16);
        ClipperLib::TranslatePath(v13, (int64x2_t **)&__p, &v16);
        ClipperLib::ClipperBase::AddPath((uint64_t)&v25[-1] + *(v24 - 3), (uint64_t)&__p, 1, 1);
        if (__p)
        {
          char v19 = __p;
          operator delete(__p);
        }
      }
      __p = &v21;
      std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      ++v8;
      uint64_t v4 = *a2;
    }
    while (v8 < 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
  }
  ClipperLib::Clipper::Execute((uint64_t)&v24, 1, a3, 1, 1);
  uint64_t v24 = &unk_2702F8E50;
  uint64_t v35 = &unk_2702F8E98;
  std::__list_imp<long long>::clear(v30);
  if ((void)v28)
  {
    *((void *)&v28 + 1) = v28;
    operator delete((void *)v28);
  }
  if (v26[1])
  {
    *(void **)&long long v27 = v26[1];
    operator delete(v26[1]);
  }
  if (v25[0])
  {
    v25[1] = v25[0];
    operator delete(v25[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v35);
}

void sub_252A96B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,char a25)
{
}

void ClipperLib::MinkowskiDiff(uint64_t *a1, void *a2, uint64_t *a3)
{
  ClipperLib::Minkowski(a1, a2, a3, 0, 1u);
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v26 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = &unk_2702F8E50;
  *(_OWORD *)uint64_t v5 = 0u;
  *(_OWORD *)uint64_t v6 = 0u;
  long long v7 = 0u;
  *(_OWORD *)__p = 0u;
  uint64_t v9 = 0;
  v10[0] = v10;
  v10[1] = v10;
  unint64_t v10[2] = 0;
  char v11 = 0;
  char v18 = 0;
  char v12 = 0;
  char v13 = 0;
  __int16 v22 = 0;
  uint64_t v14 = 0;
  int64x2_t v15 = &unk_2702F8E98;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v15, a3, 0, 1);
  ClipperLib::Clipper::Execute((uint64_t)&v4, 1, a3, 1, 1);
  uint64_t v4 = &unk_2702F8E50;
  int64x2_t v15 = &unk_2702F8E98;
  std::__list_imp<long long>::clear(v10);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v6[1])
  {
    *(void **)&long long v7 = v6[1];
    operator delete(v6[1]);
  }
  if (v5[0])
  {
    v5[1] = v5[0];
    operator delete(v5[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v15);
}

void sub_252A96D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t ClipperLib::AddPolyNodeToPaths(uint64_t result, uint64_t a2, uint64_t *a3)
{
  if (a2 != 1)
  {
    uint64_t v5 = result;
    if (a2 != 2 || !*(unsigned char *)(result + 68))
    {
      uint64_t v6 = result + 8;
      if (*(void *)(result + 8) != *(void *)(result + 16))
      {
        unint64_t v7 = a3[1];
        if (v7 >= a3[2])
        {
          unint64_t result = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(a3, v6);
        }
        else
        {
          std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)a3, v6);
          unint64_t result = v7 + 24;
        }
        a3[1] = result;
      }
    }
    uint64_t v8 = *(void *)(v5 + 32);
    if ((int)((unint64_t)(*(void *)(v5 + 40) - v8) >> 3) >= 1)
    {
      uint64_t v9 = 0;
      do
      {
        unint64_t result = ClipperLib::AddPolyNodeToPaths(*(void *)(v8 + 8 * v9++), a2, a3);
        uint64_t v8 = *(void *)(v5 + 32);
      }
      while (v9 < (int)((unint64_t)(*(void *)(v5 + 40) - v8) >> 3));
    }
  }
  return result;
}

uint64_t ClipperLib::PolyTreeToPaths(uint64_t a1, uint64_t *a2)
{
  std::vector<std::vector<ClipperLib::IntPoint>>::resize(a2, 0);
  uint64_t v4 = *(void **)(a1 + 80);
  uint64_t v5 = (*(void *)(a1 + 88) - (void)v4) >> 3;
  if ((int)v5 >= 1) {
    LODWORD(v5) = v5 - (**(void **)(a1 + 32) != *v4);
  }
  std::vector<std::vector<ClipperLib::IntPoint>>::reserve(a2, (int)v5);
  return ClipperLib::AddPolyNodeToPaths(a1, 0, a2);
}

uint64_t ClipperLib::ClosedPathsFromPolyTree(uint64_t a1, uint64_t *a2)
{
  std::vector<std::vector<ClipperLib::IntPoint>>::resize(a2, 0);
  uint64_t v4 = *(void **)(a1 + 80);
  uint64_t v5 = (*(void *)(a1 + 88) - (void)v4) >> 3;
  if ((int)v5 >= 1) {
    LODWORD(v5) = v5 - (**(void **)(a1 + 32) != *v4);
  }
  std::vector<std::vector<ClipperLib::IntPoint>>::reserve(a2, (int)v5);
  return ClipperLib::AddPolyNodeToPaths(a1, 2, a2);
}

uint64_t ClipperLib::OpenPathsFromPolyTree(uint64_t a1, uint64_t *a2)
{
  std::vector<std::vector<ClipperLib::IntPoint>>::resize(a2, 0);
  uint64_t v4 = *(void **)(a1 + 80);
  uint64_t v5 = (*(void *)(a1 + 88) - (void)v4) >> 3;
  if ((int)v5 >= 1) {
    LODWORD(v5) = v5 - (**(void **)(a1 + 32) != *v4);
  }
  uint64_t result = std::vector<std::vector<ClipperLib::IntPoint>>::reserve(a2, (int)v5);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  if ((int)((unint64_t)(v7 - v8) >> 3) >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = *(void *)(v8 + 8 * v9);
      if (*(unsigned char *)(v10 + 68))
      {
        uint64_t v11 = v10 + 8;
        unint64_t v12 = a2[1];
        if (v12 >= a2[2])
        {
          uint64_t result = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(a2, v11);
        }
        else
        {
          std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)a2, v11);
          uint64_t result = v12 + 24;
        }
        a2[1] = result;
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v7 = *(void *)(a1 + 40);
      }
      ++v9;
    }
    while (v9 < (int)((unint64_t)(v7 - v8) >> 3));
  }
  return result;
}

void *ClipperLib::operator<<(void *a1)
{
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"(", 1);
  unint64_t v2 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)",", 1);
  BOOL v3 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)")", 1);
  return a1;
}

void *ClipperLib::operator<<(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  if (*a2 != v3)
  {
    uint64_t v4 = (v3 - *a2) >> 3;
    if (0xAAAAAAAAAAAAAAABLL * v4 != 1)
    {
      uint64_t v5 = 0;
      unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * v4 - 1;
      do
      {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"(", 1);
        uint64_t v7 = (void *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)",", 1);
        uint64_t v8 = (void *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"), ", 3);
        v5 += 24;
        --v6;
      }
      while (v6);
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"(", 1);
    uint64_t v9 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)",", 1);
    uint64_t v10 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)")\n", 2);
  }
  return a1;
}

void *ClipperLib::operator<<(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if (a2[1] != *a2)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      ClipperLib::operator<<(a1, (void *)(v3 + v5));
      ++v6;
      uint64_t v3 = *a2;
      v5 += 24;
    }
    while (v6 < 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"\n", 1);
  return a1;
}

void virtual thunk to'ClipperLib::Clipper::~Clipper(ClipperLib::Clipper *this)
{
  uint64_t v1 = (void *)((char *)this + *(void *)(*(void *)this - 24));
  *uint64_t v1 = &unk_2702F8E50;
  v1[18] = &unk_2702F8E98;
  std::__list_imp<long long>::clear(v1 + 11);
  unint64_t v2 = (void *)v1[7];
  if (v2)
  {
    v1[8] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)v1[4];
  if (v3)
  {
    v1[5] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)v1[1];
  if (v4)
  {
    v1[2] = v4;
    operator delete(v4);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)(v1 + 18));
}

{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  uint64_t v1 = (void *)((char *)this + *(void *)(*(void *)this - 24));
  *uint64_t v1 = &unk_2702F8E50;
  v1[18] = &unk_2702F8E98;
  std::__list_imp<long long>::clear(v1 + 11);
  unint64_t v2 = (void *)v1[7];
  if (v2)
  {
    v1[8] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)v1[4];
  if (v3)
  {
    v1[5] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)v1[1];
  if (v4)
  {
    v1[2] = v4;
    operator delete(v4);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)(v1 + 18));
  JUMPOUT(0x2533C7A10);
}

void std::vector<ClipperLib::PolyNode *>::__append(void **a1, unint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 3);
    if (v9 >> 61) {
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 3;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 2 > v9) {
      unint64_t v9 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      char v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>(v4, v12);
    }
    else {
      char v13 = 0;
    }
    uint64_t v14 = &v13[8 * v10];
    int64x2_t v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    long long v16 = &v14[8 * a2];
    char v18 = (char *)*a1;
    long long v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v14 - 1) = v19;
        v14 -= 8;
      }
      while (v17 != v18);
      long long v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

ClipperLib::clipperException *ClipperLib::clipperException::clipperException(ClipperLib::clipperException *this, char *a2)
{
  *(void *)this = &unk_2702F8F18;
  std::string::basic_string[abi:ne180100]<0>((void *)this + 1, a2);
  return this;
}

void sub_252A975A4(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void ClipperLib::clipperException::~clipperException(std::exception *this)
{
  ClipperLib::clipperException::~clipperException(this);
  JUMPOUT(0x2533C7A10);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_2702F8F18;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
}

uint64_t ClipperLib::clipperException::what(ClipperLib::clipperException *this)
{
  uint64_t result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0) {
    return *(void *)result;
  }
  return result;
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__introsort<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *,false>(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, char a5)
{
LABEL_1:
  uint64_t v11 = (char *)a1;
LABEL_2:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    a1 = (uint64_t)v11;
    uint64_t v13 = v12;
    uint64_t v14 = a2 - v11;
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((a2 - v11) >> 3);
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          uint64_t v27 = *((void *)a2 - 3);
          uint64_t v26 = a2 - 24;
          if (*(void *)v11 < v27)
          {
            uint64_t v38 = *((void *)v11 + 2);
            long long v35 = *(_OWORD *)v11;
            long long v28 = *(_OWORD *)v26;
            *((void *)v11 + 2) = *((void *)v26 + 2);
            *(_OWORD *)uint64_t v11 = v28;
            *(_OWORD *)uint64_t v26 = v35;
            *((void *)v26 + 2) = v38;
          }
          break;
        case 3uLL:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((long long *)v11, (uint64_t *)v11 + 3, (uint64_t *)a2 - 3);
          break;
        case 4uLL:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)v11, (uint64_t *)v11 + 3, (uint64_t *)v11 + 6, (uint64_t)(a2 - 24));
          break;
        case 5uLL:
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((__n128 *)v11, (uint64_t *)v11 + 3, (uint64_t *)v11 + 6, (__n128 *)(v11 + 72), (__n128 *)(a2 - 24));
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v14 <= 575) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *,ClipperLib::LocalMinimum *>(v11, a2, a2, a3);
      }
      return;
    }
    unint64_t v16 = v15 >> 1;
    long long v17 = (uint64_t *)&v11[24 * (v15 >> 1)];
    if ((unint64_t)v14 >= 0xC01)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((long long *)v11, (uint64_t *)&v11[24 * (v15 >> 1)], (uint64_t *)a2 - 3);
      uint64_t v18 = 3 * v16;
      uint64_t v19 = (uint64_t *)&v11[24 * v16 - 24];
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((long long *)(v11 + 24), v19, (uint64_t *)a2 - 6);
      uint64_t v20 = (long long *)(v11 + 48);
      uint64_t v21 = (uint64_t *)&v11[8 * v18 + 24];
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(v20, v21, (uint64_t *)a2 - 9);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((long long *)v19, v17, v21);
      uint64_t v37 = *(void *)(a1 + 16);
      long long v34 = *(_OWORD *)a1;
      long long v22 = *(_OWORD *)v17;
      *(void *)(a1 + 16) = v17[2];
      *(_OWORD *)a1 = v22;
      v17[2] = v37;
      *(_OWORD *)long long v17 = v34;
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((long long *)&v11[24 * (v15 >> 1)], (uint64_t *)v11, (uint64_t *)a2 - 3);
      if (a5) {
        goto LABEL_13;
      }
    }
    if (*(void *)a1 >= *(void *)(a1 - 24))
    {
      uint64_t v11 = (char *)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocalMinimum *,ClipperLib::LocMinSorter &>((void *)a1, (unint64_t)a2);
      goto LABEL_18;
    }
LABEL_13:
    uint64_t v23 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocalMinimum *,ClipperLib::LocMinSorter &>((uint64_t *)a1, (unint64_t)a2);
    if ((v24 & 1) == 0) {
      goto LABEL_16;
    }
    BOOL v25 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(a1, (uint64_t)v23);
    uint64_t v11 = (char *)(v23 + 3);
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)(v23 + 3), (uint64_t)a2))
    {
      a4 = -v13;
      a2 = (char *)v23;
      if (v25) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v12 = v13 + 1;
    if (!v25)
    {
LABEL_16:
      std::__introsort<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *,false>(a1, v23, a3, -v13, a5 & 1);
      uint64_t v11 = (char *)(v23 + 3);
LABEL_18:
      a5 = 0;
      a4 = -v13;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)v11, (uint64_t)a2);
  }
  else if (v11 != a2)
  {
    uint64_t v29 = v11 + 24;
    while (v29 != a2)
    {
      uint64_t v30 = (uint64_t)v29;
      uint64_t v31 = *(void *)(a1 + 24);
      if (*(void *)a1 < v31)
      {
        long long v36 = *(_OWORD *)(a1 + 32);
        uint64_t v32 = v30;
        do
        {
          *(_OWORD *)uint64_t v32 = *(_OWORD *)(v32 - 24);
          *(void *)(v32 + 16) = *(void *)(v32 - 8);
          uint64_t v33 = *(void *)(v32 - 48);
          v32 -= 24;
        }
        while (v33 < v31);
        *(void *)uint64_t v32 = v31;
        *(_OWORD *)(v32 + 8) = v36;
      }
      uint64_t v29 = (char *)(v30 + 24);
      a1 = v30;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 24;
    if (result + 24 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = result;
      do
      {
        uint64_t v5 = v2;
        uint64_t v6 = *(void *)(v4 + 24);
        if (*(void *)v4 < v6)
        {
          long long v10 = *(_OWORD *)(v4 + 32);
          uint64_t v7 = v3;
          while (1)
          {
            uint64_t v8 = result + v7;
            *(_OWORD *)(v8 + 24) = *(_OWORD *)(result + v7);
            *(void *)(v8 + 40) = *(void *)(result + v7 + 16);
            if (!v7) {
              break;
            }
            v7 -= 24;
            if (*(void *)(v8 - 24) >= v6)
            {
              uint64_t v9 = result + v7 + 24;
              goto LABEL_10;
            }
          }
          uint64_t v9 = result;
LABEL_10:
          *(void *)uint64_t v9 = v6;
          *(_OWORD *)(v9 + 8) = v10;
        }
        uint64_t v2 = v5 + 24;
        v3 += 24;
        uint64_t v4 = v5;
      }
      while (v5 + 24 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(long long *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a3;
  if (*(void *)a1 < *a2)
  {
    if (v3 < v4)
    {
      uint64_t v5 = *((void *)a1 + 2);
      long long v6 = *a1;
      uint64_t v7 = a3[2];
      *a1 = *(_OWORD *)a3;
      *((void *)a1 + 2) = v7;
      *(_OWORD *)a3 = v6;
      a3[2] = v5;
      return 1;
    }
    uint64_t v14 = *((void *)a1 + 2);
    long long v15 = *a1;
    uint64_t v16 = a2[2];
    *a1 = *(_OWORD *)a2;
    *((void *)a1 + 2) = v16;
    *(_OWORD *)a2 = v15;
    a2[2] = v14;
    if (*a2 >= *a3) {
      return 1;
    }
    uint64_t v17 = a2[2];
    long long v18 = *(_OWORD *)a2;
    uint64_t v19 = a3[2];
    *(_OWORD *)a2 = *(_OWORD *)a3;
    a2[2] = v19;
    *(_OWORD *)a3 = v18;
    a3[2] = v17;
    return 2;
  }
  if (v3 < v4)
  {
    uint64_t v8 = a2[2];
    long long v9 = *(_OWORD *)a2;
    uint64_t v10 = a3[2];
    *(_OWORD *)a2 = *(_OWORD *)a3;
    a2[2] = v10;
    *(_OWORD *)a3 = v9;
    a3[2] = v8;
    if (*(void *)a1 >= *a2) {
      return 1;
    }
    uint64_t v11 = *((void *)a1 + 2);
    long long v12 = *a1;
    uint64_t v13 = a2[2];
    *a1 = *(_OWORD *)a2;
    *((void *)a1 + 2) = v13;
    *(_OWORD *)a2 = v12;
    a2[2] = v11;
    return 2;
  }
  return 0;
}

void *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocalMinimum *,ClipperLib::LocMinSorter &>(void *a1, unint64_t a2)
{
  uint64_t v2 = *a1;
  if (*(void *)(a2 - 24) >= *a1)
  {
    uint64_t v5 = a1 + 3;
    do
    {
      uint64_t v3 = v5;
      if ((unint64_t)v5 >= a2) {
        break;
      }
      v5 += 3;
    }
    while (*v3 >= v2);
  }
  else
  {
    uint64_t v3 = a1;
    do
    {
      uint64_t v4 = v3[3];
      v3 += 3;
    }
    while (v4 >= v2);
  }
  if ((unint64_t)v3 < a2)
  {
    do
    {
      uint64_t v6 = *(void *)(a2 - 24);
      a2 -= 24;
    }
    while (v6 < v2);
  }
  while ((unint64_t)v3 < a2)
  {
    uint64_t v14 = v3[2];
    long long v13 = *(_OWORD *)v3;
    long long v7 = *(_OWORD *)a2;
    v3[2] = *(void *)(a2 + 16);
    *(_OWORD *)uint64_t v3 = v7;
    *(void *)(a2 + 16) = v14;
    *(_OWORD *)a2 = v13;
    do
    {
      uint64_t v8 = v3[3];
      v3 += 3;
    }
    while (v8 >= v2);
    do
    {
      uint64_t v9 = *(void *)(a2 - 24);
      a2 -= 24;
    }
    while (v9 < v2);
  }
  if (v3 - 3 != a1)
  {
    long long v10 = *(_OWORD *)(v3 - 3);
    a1[2] = *(v3 - 1);
    *(_OWORD *)a1 = v10;
  }
  *(v3 - 3) = v2;
  *((_OWORD *)v3 - 1) = v12;
  return v3;
}

uint64_t *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocalMinimum *,ClipperLib::LocMinSorter &>(uint64_t *a1, unint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = *a1;
  do
  {
    uint64_t v4 = a1[v2 + 3];
    v2 += 3;
  }
  while (v3 < v4);
  uint64_t v5 = &a1[v2];
  if (v2 == 3)
  {
    do
    {
      if ((unint64_t)v5 >= a2) {
        break;
      }
      uint64_t v7 = *(void *)(a2 - 24);
      a2 -= 24;
    }
    while (v3 >= v7);
  }
  else
  {
    do
    {
      uint64_t v6 = *(void *)(a2 - 24);
      a2 -= 24;
    }
    while (v3 >= v6);
  }
  uint64_t v8 = &a1[v2];
  if ((unint64_t)v5 < a2)
  {
    unint64_t v9 = a2;
    do
    {
      long long v10 = *(_OWORD *)v8;
      uint64_t v11 = v8[2];
      uint64_t v12 = *(void *)(v9 + 16);
      *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
      unint64_t v8[2] = v12;
      *(void *)(v9 + 16) = v11;
      *(_OWORD *)unint64_t v9 = v10;
      do
      {
        uint64_t v13 = v8[3];
        v8 += 3;
      }
      while (v3 < v13);
      do
      {
        uint64_t v14 = *(void *)(v9 - 24);
        v9 -= 24;
      }
      while (v3 >= v14);
    }
    while ((unint64_t)v8 < v9);
  }
  if (v8 - 3 != a1)
  {
    long long v15 = *(_OWORD *)(v8 - 3);
    a1[2] = *(v8 - 1);
    *(_OWORD *)a1 = v15;
  }
  *(v8 - 3) = v3;
  *((_OWORD *)v8 - 1) = v17;
  return v8 - 3;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      uint64_t v6 = (long long *)(a2 - 24);
      if (*(void *)a1 < *(void *)(a2 - 24))
      {
        uint64_t v7 = *(void *)(a1 + 16);
        long long v8 = *(_OWORD *)a1;
        uint64_t v9 = *(void *)(a2 - 8);
        *(_OWORD *)a1 = *v6;
        *(void *)(a1 + 16) = v9;
        *uint64_t v6 = v8;
        *(void *)(a2 - 8) = v7;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((long long *)a1, (uint64_t *)(a1 + 24), (uint64_t *)(a2 - 24));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(a1, (uint64_t *)(a1 + 24), (uint64_t *)(a1 + 48), a2 - 24);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((__n128 *)a1, (uint64_t *)(a1 + 24), (uint64_t *)(a1 + 48), (__n128 *)(a1 + 72), (__n128 *)(a2 - 24));
      return 1;
    default:
      long long v10 = (void *)(a1 + 48);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((long long *)a1, (uint64_t *)(a1 + 24), (uint64_t *)(a1 + 48));
      uint64_t v11 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    uint64_t v14 = *(void *)v11;
    if (*v10 < *(void *)v11)
    {
      long long v18 = *(_OWORD *)(v11 + 8);
      uint64_t v15 = v12;
      while (1)
      {
        uint64_t v16 = a1 + v15;
        *(_OWORD *)(v16 + 72) = *(_OWORD *)(a1 + v15 + 48);
        *(void *)(v16 + 88) = *(void *)(a1 + v15 + 64);
        if (v15 == -48) {
          break;
        }
        v15 -= 24;
        if (*(void *)(v16 + 24) >= v14)
        {
          uint64_t v17 = a1 + v15 + 72;
          goto LABEL_12;
        }
      }
      uint64_t v17 = a1;
LABEL_12:
      *(void *)uint64_t v17 = v14;
      *(_OWORD *)(v17 + 8) = v18;
      if (++v13 == 8) {
        return v11 + 24 == a2;
      }
    }
    long long v10 = (void *)v11;
    v12 += 24;
    v11 += 24;
    if (v11 == a2) {
      return 1;
    }
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((long long *)a1, a2, a3);
  if (*a3 < *(void *)a4)
  {
    uint64_t v9 = a3[2];
    __n128 result = *(__n128 *)a3;
    uint64_t v10 = *(void *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    a3[2] = v10;
    *(__n128 *)a4 = result;
    *(void *)(a4 + 16) = v9;
    if (*a2 < *a3)
    {
      uint64_t v11 = a2[2];
      __n128 result = *(__n128 *)a2;
      uint64_t v12 = a3[2];
      *(_OWORD *)a2 = *(_OWORD *)a3;
      a2[2] = v12;
      *(__n128 *)a3 = result;
      a3[2] = v11;
      if (*(void *)a1 < *a2)
      {
        uint64_t v13 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v14 = a2[2];
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v14;
        *(__n128 *)a2 = result;
        a2[2] = v13;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(__n128 *a1, uint64_t *a2, uint64_t *a3, __n128 *a4, __n128 *a5)
{
  result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)a1, a2, a3, (uint64_t)a4).n128_u64[0];
  if ((int64_t)a4->n128_u64[0] < (int64_t)a5->n128_u64[0])
  {
    unint64_t v11 = a4[1].n128_u64[0];
    __n128 result = *a4;
    unint64_t v12 = a5[1].n128_u64[0];
    *a4 = *a5;
    a4[1].n128_u64[0] = v12;
    *a5 = result;
    a5[1].n128_u64[0] = v11;
    if (*a3 < (int64_t)a4->n128_u64[0])
    {
      uint64_t v13 = a3[2];
      __n128 result = *(__n128 *)a3;
      uint64_t v14 = a4[1].n128_i64[0];
      *(__n128 *)a3 = *a4;
      a3[2] = v14;
      *a4 = result;
      a4[1].n128_u64[0] = v13;
      if (*a2 < *a3)
      {
        uint64_t v15 = a2[2];
        __n128 result = *(__n128 *)a2;
        uint64_t v16 = a3[2];
        *(_OWORD *)a2 = *(_OWORD *)a3;
        a2[2] = v16;
        *(__n128 *)a3 = result;
        a3[2] = v15;
        if ((int64_t)a1->n128_u64[0] < *a2)
        {
          uint64_t v17 = a1[1].n128_i64[0];
          __n128 result = *a1;
          uint64_t v18 = a2[2];
          *a1 = *(__n128 *)a2;
          a1[1].n128_u64[0] = v18;
          *(__n128 *)a2 = result;
          a2[2] = v17;
        }
      }
    }
  }
  return result;
}

char *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *,ClipperLib::LocalMinimum *>(char *a1, char *a2, char *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v6 = a2;
    uint64_t v8 = a2 - a1;
    uint64_t v9 = (a2 - a1) / 24;
    if (a2 - a1 >= 25)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      unint64_t v12 = &a1[24 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)a1, a4, v9, v12);
        v12 -= 24;
        --v11;
      }
      while (v11);
    }
    uint64_t v13 = v6;
    if (v6 != a3)
    {
      uint64_t v14 = v6;
      do
      {
        if (*(void *)a1 < *(void *)v14)
        {
          uint64_t v15 = *((void *)v14 + 2);
          long long v16 = *(_OWORD *)v14;
          uint64_t v17 = *((void *)a1 + 2);
          *(_OWORD *)uint64_t v14 = *(_OWORD *)a1;
          *((void *)v14 + 2) = v17;
          *(_OWORD *)a1 = v16;
          *((void *)a1 + 2) = v15;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)a1, a4, v9, a1);
        }
        v14 += 24;
      }
      while (v14 != a3);
      uint64_t v13 = a3;
    }
    if (v8 >= 25)
    {
      int64_t v18 = v8 / 0x18uLL;
      do
      {
        uint64_t v19 = 0;
        long long v28 = *(_OWORD *)a1;
        uint64_t v29 = *((void *)a1 + 2);
        uint64_t v20 = a1;
        do
        {
          uint64_t v21 = &v20[24 * v19 + 24];
          uint64_t v22 = (2 * v19) | 1;
          uint64_t v23 = 2 * v19 + 2;
          if (v23 < v18 && *((void *)v21 + 3) < *(void *)v21)
          {
            v21 += 24;
            uint64_t v22 = v23;
          }
          long long v24 = *(_OWORD *)v21;
          *((void *)v20 + 2) = *((void *)v21 + 2);
          *(_OWORD *)uint64_t v20 = v24;
          uint64_t v20 = v21;
          uint64_t v19 = v22;
        }
        while (v22 <= (uint64_t)((unint64_t)(v18 - 2) >> 1));
        v6 -= 24;
        if (v21 == v6)
        {
          *((void *)v21 + 2) = v29;
          *(_OWORD *)uint64_t v21 = v28;
        }
        else
        {
          long long v25 = *(_OWORD *)v6;
          *((void *)v21 + 2) = *((void *)v6 + 2);
          *(_OWORD *)uint64_t v21 = v25;
          *(_OWORD *)uint64_t v6 = v28;
          *((void *)v6 + 2) = v29;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)a1, (uint64_t)(v21 + 24), a4, 0xAAAAAAAAAAAAAAABLL * ((v21 + 24 - a1) >> 3));
        }
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3 >= 2)
  {
    int64_t v4 = (unint64_t)(a3 - 2) >> 1;
    if (v4 >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 3)))
    {
      uint64_t v5 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3)) | 1;
      uint64_t v6 = (void *)(a1 + 24 * v5);
      if (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2 >= a3)
      {
        uint64_t v7 = *v6;
      }
      else
      {
        uint64_t v7 = v6[3];
        BOOL v9 = __OFSUB__(v7, *v6);
        BOOL v8 = v7 - *v6 < 0;
        if (v7 >= *v6) {
          uint64_t v7 = *v6;
        }
        if (v8 != v9)
        {
          v6 += 3;
          uint64_t v5 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2;
        }
      }
      uint64_t v10 = *a4;
      if (*a4 >= v7)
      {
        __n128 v18 = *(__n128 *)(a4 + 1);
        do
        {
          unint64_t v11 = a4;
          a4 = v6;
          long long v12 = *(_OWORD *)v6;
          unint64_t v11[2] = v6[2];
          *(_OWORD *)unint64_t v11 = v12;
          if (v4 < v5) {
            break;
          }
          uint64_t v13 = (2 * v5) | 1;
          uint64_t v6 = (void *)(a1 + 24 * v13);
          uint64_t v5 = 2 * v5 + 2;
          if (v5 >= a3)
          {
            uint64_t v14 = *v6;
            uint64_t v5 = v13;
          }
          else
          {
            uint64_t v14 = v6[3];
            BOOL v16 = __OFSUB__(v14, *v6);
            BOOL v15 = v14 - *v6 < 0;
            if (v14 >= *v6) {
              uint64_t v14 = *v6;
            }
            if (v15 != v16) {
              v6 += 3;
            }
            else {
              uint64_t v5 = v13;
            }
          }
        }
        while (v10 >= v14);
        *a4 = v10;
        __n128 result = v18;
        *(__n128 *)(a4 + 1) = v18;
      }
    }
  }
  return result;
}

__n128 std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    unint64_t v4 = (unint64_t)(a4 - 2) >> 1;
    uint64_t v5 = (long long *)(a1 + 24 * v4);
    uint64_t v6 = (long long *)(a2 - 24);
    uint64_t v7 = *(void *)(a2 - 24);
    if (v7 < *(void *)v5)
    {
      __n128 v11 = *(__n128 *)(a2 - 16);
      do
      {
        BOOL v8 = v6;
        uint64_t v6 = v5;
        long long v9 = *v5;
        *((void *)v8 + 2) = *((void *)v5 + 2);
        *BOOL v8 = v9;
        if (!v4) {
          break;
        }
        unint64_t v4 = (v4 - 1) >> 1;
        uint64_t v5 = (long long *)(a1 + 24 * v4);
      }
      while (v7 < *(void *)v5);
      *(void *)uint64_t v6 = v7;
      __n128 result = v11;
      *(long long *)((char *)v6 + 8) = (__int128)v11;
    }
  }
  return result;
}

void std::vector<std::vector<ClipperLib::IntPoint>>::__append(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v19 = v4;
    if (v11) {
      long long v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(v4, v11);
    }
    else {
      long long v12 = 0;
    }
    BOOL v15 = v12;
    BOOL v16 = &v12[24 * v8];
    __n128 v18 = &v12[24 * v11];
    size_t v14 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v16, v14);
    uint64_t v17 = &v16[v14];
    std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(a1, &v15);
    std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)&v15);
  }
}

void sub_252A987C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  unint64_t v11[2] = &v14;
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
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>::operator()[abi:ne180100](uint64_t a1)
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

uint64_t std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<ClipperLib::IntPoint>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
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

uint64_t std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **,false>(uint64_t result, char *a2, uint64_t (**a3)(uint64_t, uint64_t), uint64_t a4, char a5)
{
  unint64_t v10 = (char *)result;
LABEL_2:
  unint64_t v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    unint64_t v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = a2 - v11;
    unint64_t v15 = (a2 - v11) >> 3;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t result = (*a3)(*((void *)a2 - 1), *(void *)v11);
          if (result)
          {
            uint64_t v22 = *(void *)v11;
            *(void *)unint64_t v11 = *((void *)a2 - 1);
            *((void *)a2 - 1) = v22;
          }
          break;
        case 3uLL:
          uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v11, (void *)v11 + 1, (void *)a2 - 1, (unsigned int (**)(void))a3);
          break;
        case 4uLL:
          uint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v11, (void *)v11 + 1, (void *)v11 + 2, (void *)a2 - 1, (unsigned int (**)(void))a3);
          break;
        case 5uLL:
          uint64_t result = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v11, (void *)v11 + 1, (void *)v11 + 2, (void *)v11 + 3, (void *)a2 - 1, (unsigned int (**)(void))a3);
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 191) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        return (uint64_t)std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **,ClipperLib::IntersectNode **>(v11, a2, (uint64_t *)a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    uint64_t v17 = &v11[8 * (v15 >> 1)];
    if ((unint64_t)v14 >= 0x401)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v11, &v11[8 * (v15 >> 1)], (void *)a2 - 1, (unsigned int (**)(void))a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((void *)v11 + 1, (void *)v17 - 1, (void *)a2 - 2, (unsigned int (**)(void))a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((void *)v11 + 2, &v11[8 * v16 + 8], (void *)a2 - 3, (unsigned int (**)(void))a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((void *)v17 - 1, v17, &v11[8 * v16 + 8], (unsigned int (**)(void))a3);
      uint64_t v18 = *(void *)v11;
      *(void *)unint64_t v11 = *(void *)v17;
      *(void *)uint64_t v17 = v18;
      if (a5) {
        goto LABEL_14;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(&v11[8 * (v15 >> 1)], v11, (void *)a2 - 1, (unsigned int (**)(void))a3);
      if (a5) {
        goto LABEL_14;
      }
    }
    if (((*a3)(*((void *)v11 - 1), *(void *)v11) & 1) == 0)
    {
      uint64_t result = (uint64_t)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::IntersectNode **,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *)>((uint64_t *)v11, (uint64_t *)a2, a3);
      unint64_t v11 = (char *)result;
      goto LABEL_19;
    }
LABEL_14:
    uint64_t v19 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::IntersectNode **,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *)>((uint64_t *)v11, (uint64_t *)a2, a3);
    if ((v20 & 1) == 0) {
      goto LABEL_17;
    }
    BOOL v21 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v11, v19, (unsigned int (**)(void))a3);
    unint64_t v11 = (char *)(v19 + 1);
    uint64_t result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v19 + 1, a2, (unsigned int (**)(void))a3);
    if (result)
    {
      a4 = -v13;
      a2 = (char *)v19;
      if (v21) {
        return result;
      }
      goto LABEL_2;
    }
    uint64_t v12 = v13 + 1;
    if (!v21)
    {
LABEL_17:
      uint64_t result = std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **,false>(v10, v19, a3, -v13, a5 & 1);
      unint64_t v11 = (char *)(v19 + 1);
LABEL_19:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  if (a5)
  {
    return std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((uint64_t)v11, (uint64_t *)a2, a3);
  }
  else
  {
    return std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((uint64_t)v11, a2, a3);
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(uint64_t result, uint64_t *a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  if ((uint64_t *)result != a2)
  {
    uint64_t v4 = (void *)result;
    char v5 = (uint64_t *)(result + 8);
    if ((uint64_t *)(result + 8) != a2)
    {
      uint64_t v7 = 0;
      long long v8 = (uint64_t *)result;
      do
      {
        uint64_t v10 = *v8;
        uint64_t v9 = v8[1];
        long long v8 = v5;
        uint64_t result = (*a3)(v9, v10);
        if (result)
        {
          uint64_t v11 = *v8;
          uint64_t v12 = v7;
          while (1)
          {
            *(void *)((char *)v4 + v12 + 8) = *(void *)((char *)v4 + v12);
            if (!v12) {
              break;
            }
            uint64_t result = (*a3)(v11, *(void *)((char *)v4 + v12 - 8));
            v12 -= 8;
            if ((result & 1) == 0)
            {
              uint64_t v13 = (void *)((char *)v4 + v12 + 8);
              goto LABEL_10;
            }
          }
          uint64_t v13 = v4;
LABEL_10:
          *uint64_t v13 = v11;
        }
        char v5 = v8 + 1;
        v7 += 8;
      }
      while (v8 + 1 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(uint64_t result, void *a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  if ((void *)result != a2)
  {
    uint64_t v4 = (void *)result;
    for (uint64_t i = (void *)(result + 8); v4 + 1 != a2; uint64_t i = v4 + 1)
    {
      uint64_t v8 = *v4;
      uint64_t v7 = v4[1];
      uint64_t v4 = i;
      uint64_t result = (*a3)(v7, v8);
      if (result)
      {
        uint64_t v9 = *v4;
        uint64_t v10 = v4;
        do
        {
          uint64_t v11 = v10;
          uint64_t v12 = *--v10;
          *uint64_t v11 = v12;
          uint64_t result = (*a3)(v9, *(v11 - 2));
        }
        while ((result & 1) != 0);
        *uint64_t v10 = v9;
      }
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(void *a1, void *a2, void *a3, unsigned int (**a4)(void))
{
  char v8 = ((uint64_t (*)(void, void))*a4)(*a2, *a1);
  uint64_t result = ((uint64_t (*)(void, void))*a4)(*a3, *a2);
  if ((v8 & 1) == 0)
  {
    if (!result) {
      return result;
    }
    uint64_t v11 = *a2;
    *a2 = *a3;
    *a3 = v11;
    if (!((unsigned int (*)(void, void))*a4)(*a2, *a1)) {
      return 1;
    }
    uint64_t v12 = *a1;
    *a1 = *a2;
    *a2 = v12;
    return 2;
  }
  uint64_t v10 = *a1;
  if (!result)
  {
    *a1 = *a2;
    *a2 = v10;
    if (!(*a4)(*a3)) {
      return 1;
    }
    uint64_t v13 = *a2;
    *a2 = *a3;
    *a3 = v13;
    return 2;
  }
  *a1 = *a3;
  *a3 = v10;
  return 1;
}

uint64_t *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::IntersectNode **,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *)>(uint64_t *a1, uint64_t *a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  uint64_t v4 = a2;
  uint64_t v6 = *a1;
  if ((*a3)(*a1, *(a2 - 1)))
  {
    uint64_t v7 = a1;
    do
    {
      uint64_t v8 = v7[1];
      ++v7;
    }
    while (((*a3)(v6, v8) & 1) == 0);
  }
  else
  {
    uint64_t v9 = a1 + 1;
    do
    {
      uint64_t v7 = v9;
      if (v9 >= v4) {
        break;
      }
      ++v9;
    }
    while (!(*a3)(v6, *v7));
  }
  if (v7 < v4)
  {
    do
      uint64_t v10 = *--v4;
    while (((*a3)(v6, v10) & 1) != 0);
  }
  while (v7 < v4)
  {
    uint64_t v11 = *v7;
    *uint64_t v7 = *v4;
    *uint64_t v4 = v11;
    do
    {
      uint64_t v12 = v7[1];
      ++v7;
    }
    while (!(*a3)(v6, v12));
    do
      uint64_t v13 = *--v4;
    while (((*a3)(v6, v13) & 1) != 0);
  }
  if (v7 - 1 != a1) {
    *a1 = *(v7 - 1);
  }
  *(v7 - 1) = v6;
  return v7;
}

uint64_t *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::IntersectNode **,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *)>(uint64_t *a1, uint64_t *a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  uint64_t v6 = 0;
  uint64_t v7 = *a1;
  do
    char v8 = (*a3)(a1[++v6], v7);
  while ((v8 & 1) != 0);
  uint64_t v9 = &a1[v6];
  uint64_t v10 = &a1[v6 - 1];
  if (v6 == 1)
  {
    do
    {
      if (v9 >= a2) {
        break;
      }
      uint64_t v12 = *--a2;
    }
    while (((*a3)(v12, v7) & 1) == 0);
  }
  else
  {
    do
      uint64_t v11 = *--a2;
    while (!(*a3)(v11, v7));
  }
  if (v9 < a2)
  {
    uint64_t v13 = &a1[v6];
    uint64_t v14 = a2;
    do
    {
      uint64_t v15 = *v13;
      *uint64_t v13 = *v14;
      *uint64_t v14 = v15;
      do
      {
        uint64_t v16 = v13[1];
        ++v13;
      }
      while (((*a3)(v16, v7) & 1) != 0);
      do
        uint64_t v17 = *--v14;
      while (!(*a3)(v17, v7));
    }
    while (v13 < v14);
    uint64_t v10 = v13 - 1;
  }
  if (v10 != a1) {
    *a1 = *v10;
  }
  *uint64_t v10 = v7;
  return v10;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(void *a1, void *a2, unsigned int (**a3)(void))
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (((unsigned int (*)(void, void))*a3)(*(a2 - 1), *a1))
      {
        uint64_t v8 = *a1;
        *a1 = *(a2 - 1);
        *(a2 - 1) = v8;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a1 + 1, a2 - 1, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      uint64_t v9 = a1 + 2;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a1 + 1, a1 + 2, a3);
      uint64_t v10 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v11 = 0;
      int v12 = 0;
      break;
  }
  while (1)
  {
    if (((unsigned int (*)(void, void))*a3)(*v10, *v9))
    {
      uint64_t v13 = *v10;
      uint64_t v14 = v11;
      while (1)
      {
        uint64_t v15 = (char *)a1 + v14;
        *(void *)((char *)a1 + v14 + 24) = *(void *)((char *)a1 + v14 + 16);
        if (v14 == -16) {
          break;
        }
        v14 -= 8;
        if ((((uint64_t (*)(uint64_t, void))*a3)(v13, *((void *)v15 + 1)) & 1) == 0)
        {
          uint64_t v16 = (void *)((char *)a1 + v14 + 24);
          goto LABEL_12;
        }
      }
      uint64_t v16 = a1;
LABEL_12:
      *uint64_t v16 = v13;
      if (++v12 == 8) {
        return v10 + 1 == a2;
      }
    }
    uint64_t v9 = v10;
    v11 += 8;
    if (++v10 == a2) {
      return 1;
    }
  }
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(void *a1, void *a2, void *a3, void *a4, unsigned int (**a5)(void))
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a2, a3, a5);
  uint64_t result = ((uint64_t (*)(void, void))*a5)(*a4, *a3);
  if (result)
  {
    uint64_t v11 = *a3;
    *a3 = *a4;
    *a4 = v11;
    uint64_t result = ((uint64_t (*)(void, void))*a5)(*a3, *a2);
    if (result)
    {
      uint64_t v12 = *a2;
      *a2 = *a3;
      *a3 = v12;
      uint64_t result = ((uint64_t (*)(void, void))*a5)(*a2, *a1);
      if (result)
      {
        uint64_t v13 = *a1;
        *a1 = *a2;
        *a2 = v13;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(void *a1, void *a2, void *a3, void *a4, void *a5, unsigned int (**a6)(void))
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a2, a3, a4, a6);
  uint64_t result = ((uint64_t (*)(void, void))*a6)(*a5, *a4);
  if (result)
  {
    uint64_t v13 = *a4;
    *a4 = *a5;
    *a5 = v13;
    uint64_t result = ((uint64_t (*)(void, void))*a6)(*a4, *a3);
    if (result)
    {
      uint64_t v14 = *a3;
      *a3 = *a4;
      *a4 = v14;
      uint64_t result = ((uint64_t (*)(void, void))*a6)(*a3, *a2);
      if (result)
      {
        uint64_t v15 = *a2;
        *a2 = *a3;
        *a3 = v15;
        uint64_t result = ((uint64_t (*)(void, void))*a6)(*a2, *a1);
        if (result)
        {
          uint64_t v16 = *a1;
          *a1 = *a2;
          *a2 = v16;
        }
      }
    }
  }
  return result;
}

uint64_t *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **,ClipperLib::IntersectNode **>(char *a1, char *a2, uint64_t *a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  if (a1 != a2)
  {
    uint64_t v8 = a2 - a1;
    uint64_t v9 = (a2 - a1) >> 3;
    if (a2 - a1 >= 9)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = &a1[8 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((uint64_t)a1, (unsigned int (**)(void, void))a4, v9, v12);
        v12 -= 8;
        --v11;
      }
      while (v11);
    }
    uint64_t v13 = a2;
    if (a2 != (char *)a3)
    {
      uint64_t v14 = (uint64_t *)a2;
      do
      {
        if ((*a4)(*v14, *(void *)a1))
        {
          uint64_t v15 = *v14;
          *uint64_t v14 = *(void *)a1;
          *(void *)a1 = v15;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((uint64_t)a1, (unsigned int (**)(void, void))a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      uint64_t v13 = (char *)a3;
    }
    if (v8 >= 9)
    {
      uint64_t v16 = (unint64_t)v8 >> 3;
      uint64_t v17 = a2 - 8;
      do
      {
        uint64_t v18 = *(void *)a1;
        uint64_t v19 = (char *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, (unsigned int (**)(void, void))a4, v16);
        if (v17 == v19)
        {
          *(void *)uint64_t v19 = v18;
        }
        else
        {
          *(void *)uint64_t v19 = *(void *)v17;
          *(void *)uint64_t v17 = v18;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((uint64_t)a1, (uint64_t)(v19 + 8), a4, (v19 + 8 - a1) >> 3);
        }
        v17 -= 8;
      }
      while (v16-- > 2);
    }
    return (uint64_t *)v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(uint64_t result, unsigned int (**a2)(void, void), uint64_t a3, void *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    char v5 = a4;
    uint64_t v6 = result;
    int64_t v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - result) >> 3)
    {
      uint64_t v10 = ((uint64_t)a4 - result) >> 2;
      uint64_t v11 = v10 + 1;
      uint64_t v12 = (void *)(result + 8 * (v10 + 1));
      uint64_t v13 = v10 + 2;
      if (v10 + 2 < a3 && (*a2)(*v12, v12[1]))
      {
        ++v12;
        uint64_t v11 = v13;
      }
      uint64_t result = ((uint64_t (*)(void, void))*a2)(*v12, *v5);
      if ((result & 1) == 0)
      {
        uint64_t v14 = *v5;
        do
        {
          uint64_t v15 = v12;
          *char v5 = *v12;
          if (v7 < v11) {
            break;
          }
          uint64_t v16 = (2 * v11) | 1;
          uint64_t v12 = (void *)(v6 + 8 * v16);
          if (2 * v11 + 2 < a3)
          {
            if ((*a2)(*v12, v12[1]))
            {
              ++v12;
              uint64_t v16 = 2 * v11 + 2;
            }
          }
          uint64_t result = ((uint64_t (*)(void, uint64_t))*a2)(*v12, v14);
          char v5 = v15;
          uint64_t v11 = v16;
        }
        while (!result);
        *uint64_t v15 = v14;
      }
    }
  }
  return result;
}

void *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(void *a1, unsigned int (**a2)(void, void), uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    uint64_t v9 = &a1[v6 + 1];
    uint64_t v10 = (2 * v6) | 1;
    uint64_t v11 = 2 * v6 + 2;
    if (v11 < a3 && (*a2)(a1[v6 + 1], a1[v6 + 2]))
    {
      ++v9;
      uint64_t v10 = v11;
    }
    *a1 = *v9;
    a1 = v9;
    uint64_t v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(uint64_t result, uint64_t a2, uint64_t (**a3)(uint64_t, uint64_t), uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    uint64_t v6 = result;
    unint64_t v7 = v4 >> 1;
    uint64_t v8 = (uint64_t *)(result + 8 * (v4 >> 1));
    uint64_t v9 = (uint64_t *)(a2 - 8);
    uint64_t result = (*a3)(*v8, *(void *)(a2 - 8));
    if (result)
    {
      uint64_t v10 = *v9;
      do
      {
        uint64_t v11 = v8;
        *uint64_t v9 = *v8;
        if (!v7) {
          break;
        }
        unint64_t v7 = (v7 - 1) >> 1;
        uint64_t v8 = (uint64_t *)(v6 + 8 * v7);
        uint64_t result = (*a3)(*v8, v10);
        uint64_t v9 = v11;
      }
      while ((result & 1) != 0);
      *uint64_t v11 = v10;
    }
  }
  return result;
}

void *std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 8);
  *uint64_t v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  uint64_t result = std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v3, *(const void **)a2, *(void *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3));
  *(void *)(a1 + 8) = v3 + 3;
  return result;
}

void sub_252A999D0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
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
  uint64_t v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  uint64_t v15 = v11;
  uint64_t v16 = &v10[24 * v9];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v11, *(const void **)a2, *(void *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3));
  v15 += 24;
  std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(a1, v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_252A99AE8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::vector<ClipperLib::IntPoint>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::vector<ClipperLib::IntPoint>>::__vallocate[abi:ne180100](a1, a2);
    unint64_t v4 = (void *)a1[1];
    unint64_t v5 = &v4[3 * a2];
    __asm { FMOV            V0.2S, #-1.0 }
    do
    {
      *unint64_t v4 = 0;
      v4[1] = 0;
      v4[2] = _D0;
      v4 += 3;
    }
    while (v4 != v5);
    a1[1] = v5;
  }
  return a1;
}

void sub_252A99B60(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

__n128 *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::vector<ClipperLib::IntPoint> *,std::vector<ClipperLib::IntPoint> *,std::vector<ClipperLib::IntPoint> *,0>(__n128 *a1, __n128 *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  if (a1 != a2)
  {
    do
    {
      std::vector<ClipperLib::IntPoint>::__move_assign(a3, v4);
      unint64_t v4 = (__n128 *)((char *)v4 + 24);
      a3 += 24;
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

__n128 std::vector<ClipperLib::IntPoint>::__move_assign(uint64_t a1, __n128 *a2)
{
  unint64_t v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

char *std::vector<ClipperLib::IntPoint>::__assign_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  unint64_t v9 = *(char **)result;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - *(void *)result) >> 3) < a4)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      unint64_t v7[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v11;
    }
    __n128 result = std::vector<std::vector<ClipperLib::IntPoint>>::__vallocate[abi:ne180100](v7, v12);
    uint64_t v14 = (char *)v7[1];
    uint64_t v13 = (void **)(v7 + 1);
    unint64_t v9 = v14;
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
  uint64_t v13 = (void **)(result + 8);
  uint64_t v15 = (unsigned char *)*((void *)result + 1);
  if (0xAAAAAAAAAAAAAAABLL * ((v15 - v9) >> 3) >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[8 * ((v15 - v9) >> 3)];
  if (v15 != v9)
  {
    __n128 result = (char *)memmove(*(void **)result, __src, v15 - v9);
    unint64_t v9 = (char *)*v13;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    uint64_t v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    __n128 result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *uint64_t v13 = &v9[v17];
  return result;
}

void std::vector<ClipperLib::IntPoint>::__append(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(void **)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (unsigned char *)v7) >> 3) >= a2)
  {
    if (a2)
    {
      uint64_t v13 = &v7[3 * a2];
      __asm { FMOV            V0.2S, #-1.0 }
      do
      {
        *uint64_t v7 = 0;
        v7[1] = 0;
        unint64_t v7[2] = _D0;
        v7 += 3;
      }
      while (v7 != v13);
      uint64_t v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (unsigned char *)*a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (unsigned char *)*a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      unint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(v4, v11);
    }
    else {
      unint64_t v12 = 0;
    }
    uint64_t v19 = &v12[24 * v8];
    char v20 = &v19[24 * a2];
    __asm { FMOV            V0.2S, #-1.0 }
    uint64_t v22 = v19;
    do
    {
      *(void *)uint64_t v22 = 0;
      *((void *)v22 + 1) = 0;
      *((void *)v22 + 2) = _D0;
      v22 += 24;
    }
    while (v22 != v20);
    uint64_t v23 = &v12[24 * v11];
    long long v25 = (char *)*a1;
    long long v24 = (char *)a1[1];
    if (v24 != *a1)
    {
      do
      {
        long long v26 = *(_OWORD *)(v24 - 24);
        *((void *)v19 - 1) = *((void *)v24 - 1);
        *(_OWORD *)(v19 - 24) = v26;
        v19 -= 24;
        v24 -= 24;
      }
      while (v24 != v25);
      long long v24 = (char *)*a1;
    }
    *a1 = v19;
    a1[1] = v20;
    a1[2] = v23;
    if (v24)
    {
      operator delete(v24);
    }
  }
}

uint64_t std::list<long long>::__move_assign(uint64_t *a1, void *a2)
{
  return std::list<long long>::splice((uint64_t)a1, a1, a2);
}

uint64_t *std::list<long long>::__sort<std::__less<void,void>>(uint64_t *result, uint64_t *a2, unint64_t a3, uint64_t a4)
{
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      unint64_t v5 = (uint64_t *)*a2;
      if (*(void *)(*a2 + 16) < result[2])
      {
        uint64_t v6 = *v5;
        *(void *)(v6 + 8) = v5[1];
        *(void *)v5[1] = v6;
        uint64_t v7 = *result;
        *(void *)(v7 + 8) = v5;
        *unint64_t v5 = v7;
        *__n128 result = (uint64_t)v5;
        v5[1] = (uint64_t)result;
        return v5;
      }
    }
    else
    {
      unint64_t v10 = a3 >> 1;
      unint64_t v11 = (a3 >> 1) + 1;
      unint64_t v12 = result;
      do
      {
        unint64_t v12 = (uint64_t *)v12[1];
        --v11;
      }
      while (v11 > 1);
      uint64_t v13 = (uint64_t *)std::list<long long>::__sort<std::__less<void,void>>(result, v12, a3 >> 1, a4);
      __n128 result = (uint64_t *)std::list<long long>::__sort<std::__less<void,void>>(v12, a2, a3 - v10, a4);
      uint64_t v14 = v13[2];
      if (result[2] >= v14)
      {
        uint64_t v16 = (uint64_t *)v13[1];
        uint64_t i = result;
        __n128 result = v13;
      }
      else
      {
        for (uint64_t i = (uint64_t *)result[1]; i != a2; uint64_t i = (uint64_t *)i[1])
        {
          if (i[2] >= v14) {
            goto LABEL_14;
          }
        }
        uint64_t i = a2;
LABEL_14:
        uint64_t v17 = *i;
        uint64_t v18 = *result;
        *(void *)(v18 + 8) = *(void *)(*i + 8);
        **(void **)(v17 + 8) = v18;
        uint64_t v19 = *v13;
        uint64_t v16 = (uint64_t *)v13[1];
        *(void *)(v19 + 8) = result;
        *__n128 result = v19;
        *uint64_t v13 = v17;
        *(void *)(v17 + 8) = v13;
      }
      if (v16 != i && i != a2)
      {
        char v20 = i;
        do
        {
          uint64_t v21 = v16[2];
          if (i[2] >= v21)
          {
            uint64_t v16 = (uint64_t *)v16[1];
          }
          else
          {
            for (j = (uint64_t *)i[1]; j != a2; j = (uint64_t *)j[1])
            {
              if (j[2] >= v21) {
                goto LABEL_25;
              }
            }
            j = a2;
LABEL_25:
            uint64_t v23 = *j;
            uint64_t v24 = *i;
            *(void *)(v24 + 8) = *(void *)(*j + 8);
            **(void **)(v23 + 8) = v24;
            if (v20 == i) {
              char v20 = j;
            }
            uint64_t v26 = *v16;
            long long v25 = (uint64_t *)v16[1];
            *(void *)(v26 + 8) = i;
            uint64_t *i = v26;
            *uint64_t v16 = v23;
            *(void *)(v23 + 8) = v16;
            uint64_t v16 = v25;
            uint64_t i = j;
          }
        }
        while (v16 != v20 && i != a2);
      }
    }
  }
  return result;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2533C7970](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      unint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x2533C7980](v13);
  return a1;
}

void sub_252A9A230(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x2533C7980](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x252A9A210);
}

void sub_252A9A284(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_252A9A404(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

uint64_t ITKDeviceRGBColorSpace()
{
  if (ITKDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1) {
    dispatch_once(&ITKDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_3);
  }
  return ITKDeviceRGBColorSpace_sDeviceRGBColorSpace;
}

CGColorSpaceRef __ITKDeviceRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceRGB();
  ITKDeviceRGBColorSpace_sDeviceRGBColorSpace = (uint64_t)result;
  return result;
}

uint64_t ITKDeviceCMYKColorSpace()
{
  if (ITKDeviceCMYKColorSpace_sDeviceCMYKDispatchOnce != -1) {
    dispatch_once(&ITKDeviceCMYKColorSpace_sDeviceCMYKDispatchOnce, &__block_literal_global_2);
  }
  return ITKDeviceCMYKColorSpace_sDeviceCMYKColorSpace;
}

CGColorSpaceRef __ITKDeviceCMYKColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceCMYK();
  ITKDeviceCMYKColorSpace_sDeviceCMYKColorSpace = (uint64_t)result;
  return result;
}

uint64_t ITKDeviceGrayColorSpace()
{
  if (ITKDeviceGrayColorSpace_sDeviceGrayDispatchOnce != -1) {
    dispatch_once(&ITKDeviceGrayColorSpace_sDeviceGrayDispatchOnce, &__block_literal_global_4);
  }
  return ITKDeviceGrayColorSpace_sDeviceGrayColorSpace;
}

CGColorSpaceRef __ITKDeviceGrayColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceGray();
  ITKDeviceGrayColorSpace_sDeviceGrayColorSpace = (uint64_t)result;
  return result;
}

CGColorRef ITKCGColorCreateDeviceRGB(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  if (ITKDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1) {
    dispatch_once(&ITKDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_3);
  }
  return CGColorCreate((CGColorSpaceRef)ITKDeviceRGBColorSpace_sDeviceRGBColorSpace, components);
}

CGColorRef ITKCGColorCreateDeviceGray(CGFloat a1, CGFloat a2)
{
  components[2] = *(CGFloat *)MEMORY[0x263EF8340];
  components[0] = a1;
  components[1] = a2;
  if (ITKDeviceGrayColorSpace_sDeviceGrayDispatchOnce != -1) {
    dispatch_once(&ITKDeviceGrayColorSpace_sDeviceGrayDispatchOnce, &__block_literal_global_4);
  }
  return CGColorCreate((CGColorSpaceRef)ITKDeviceGrayColorSpace_sDeviceGrayColorSpace, components);
}

CGPatternRef ITKCGPatternCreateWithImageAndTransform(CGImageRef image, long long *a2)
{
  if (!image) {
    objc_msgSend(MEMORY[0x263F4BE58], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "image != ((void *)0)", "CGPatternRef ITKCGPatternCreateWithImageAndTransform(CGImageRef, const CGAffineTransform *)", 0, 0, @"can't create an image pattern without an image");
  }
  CGImageRetain(image);
  CGFloat v4 = *MEMORY[0x263F00148];
  CGFloat v5 = *(double *)(MEMORY[0x263F00148] + 8);
  size_t Width = CGImageGetWidth(image);
  size_t Height = CGImageGetHeight(image);
  if (a2)
  {
    long long v8 = a2[1];
    long long v13 = *a2;
    long long v14 = v8;
    long long v9 = a2[2];
  }
  else
  {
    long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v13 = *MEMORY[0x263F000D0];
    long long v14 = v10;
    long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  }
  long long v15 = v9;
  v16.size.height = (double)Height;
  v16.size.width = (double)Width;
  *(_OWORD *)&v12.a = v13;
  *(_OWORD *)&v12.c = v14;
  *(_OWORD *)&v12.tx = v9;
  v16.origin.x = v4;
  v16.origin.y = v5;
  return CGPatternCreate(image, v16, &v12, (double)Width, v16.size.height, kCGPatternTilingConstantSpacing, 1, &ITKCGPatternCreateWithImageAndTransform_sCallbacks);
}

void ITKDrawImageAtOriginInContext(CGImage *a1, CGContext *a2)
{
  uint64_t v4 = *MEMORY[0x263F00148];
  uint64_t v5 = *(void *)(MEMORY[0x263F00148] + 8);
  double Width = (double)CGImageGetWidth(a1);
  double Height = (double)CGImageGetHeight(a1);
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  double v10 = Width;
  CGContextDrawImage(a2, *(CGRect *)&v8, a1);
}

CGPatternRef ITKCGPatternCreateWithImage(CGImage *a1)
{
  return ITKCGPatternCreateWithImageAndTransform(a1, 0);
}

CGColorRef ITKCGColorCreatePatternWithImageAndTransform(CGImage *a1, long long *a2)
{
  v6[1] = *(CGFloat *)MEMORY[0x263EF8340];
  uint64_t v2 = ITKCGPatternCreateWithImageAndTransform(a1, a2);
  Pattern = CGColorSpaceCreatePattern(0);
  v6[0] = 1.0;
  CGColorRef v4 = CGColorCreateWithPattern(Pattern, v2, v6);
  CGColorSpaceRelease(Pattern);
  CGPatternRelease(v2);
  return v4;
}

CGColorRef ITKCGColorCreatePatternWithImage(CGImage *a1)
{
  return ITKCGColorCreatePatternWithImageAndTransform(a1, 0);
}

uint64_t ITKHSBFromCGColorRef(CGColorRef color, double *a2, double *a3, double *a4, CGFloat *a5)
{
  *a5 = 0.0;
  *a4 = 0.0;
  *a3 = 0.0;
  *a2 = 0.0;
  if (!color) {
    objc_msgSend(MEMORY[0x263F4BE58], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "color", "BOOL ITKHSBFromCGColorRef(CGColorRef, CGFloat *, CGFloat *, CGFloat *, CGFloat *)", 0, 0, @"NULL color");
  }
  ColorSpace = CGColorGetColorSpace(color);
  if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB || CGColorGetNumberOfComponents(color) != 4) {
    return 0;
  }
  *a5 = CGColorGetAlpha(color);
  Components = CGColorGetComponents(color);
  ITKRGBToHSB(a2, a3, a4, *Components, Components[1], Components[2]);
  return 1;
}

double ITKRGBToHSB(double *a1, double *a2, double *a3, double a4, double a5, double a6)
{
  if (a4 < a5 || a4 < a6)
  {
    if (a5 >= a4) {
      double v7 = a4;
    }
    else {
      double v7 = a5;
    }
    if (a4 >= a6) {
      double v8 = a6;
    }
    else {
      double v8 = a4;
    }
    BOOL v9 = a5 < a4 || a5 < a6;
    if (v9) {
      double v10 = a6;
    }
    else {
      double v10 = a5;
    }
    if (v9) {
      double v11 = v7;
    }
    else {
      double v11 = v8;
    }
  }
  else
  {
    if (a5 >= a6) {
      double v11 = a6;
    }
    else {
      double v11 = a5;
    }
    double v10 = a4;
  }
  double v12 = 0.0;
  if (v10 <= 0.0)
  {
    double v14 = 0.0;
  }
  else
  {
    double v13 = v10 - v11;
    double v14 = (v10 - v11) / v10;
    if (v14 != 0.0)
    {
      double v15 = (v10 - a5) / v13;
      double v16 = (v10 - a6) / v13;
      if (v10 == a4)
      {
        if (v11 == a5) {
          double v12 = v16 + 5.0;
        }
        else {
          double v12 = 1.0 - v15;
        }
      }
      else
      {
        BOOL v18 = v10 == a5;
        double v19 = (v10 - a4) / v13;
        if (v18)
        {
          if (v11 == a6) {
            double v12 = v19 + 1.0;
          }
          else {
            double v12 = 3.0 - v16;
          }
        }
        else if (v11 == a4)
        {
          double v12 = v15 + 3.0;
        }
        else
        {
          double v12 = 5.0 - v19;
        }
      }
    }
  }
  *a3 = v10;
  double result = v12 / 6.0;
  *a1 = v12 / 6.0;
  *a2 = v14;
  return result;
}

double *ITKHSBToRGB(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  double v6 = a4 * 6.0;
  BOOL v7 = a4 == 1.0;
  double v8 = 0.0;
  if (!v7) {
    double v8 = v6;
  }
  uint64_t v9 = (uint64_t)v8;
  double v10 = v8 - (double)(uint64_t)v8;
  double v11 = (1.0 - a5) * a6;
  double v12 = (1.0 - a5 * v10) * a6;
  double v13 = (1.0 - a5 * (1.0 - v10)) * a6;
  double v14 = a6;
  double v15 = v13;
  switch(v9)
  {
    case 0:
      goto LABEL_10;
    case 1:
      double v14 = v12;
      double v15 = a6;
      goto LABEL_10;
    case 2:
      double v14 = v11;
      double v15 = a6;
      double v11 = v13;
      goto LABEL_10;
    case 3:
      double v14 = v11;
      double v15 = v12;
      goto LABEL_8;
    case 4:
      double v14 = v13;
      double v15 = v11;
LABEL_8:
      double v11 = a6;
      goto LABEL_10;
    case 5:
      double v14 = a6;
      double v15 = v11;
      double v11 = v12;
LABEL_10:
      *double result = v14;
      *a2 = v15;
      *a3 = v11;
      break;
    default:
      return result;
  }
  return result;
}

double ITKCMYKToRGB(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7)
{
  *a1 = 1.0 - fmin(a7 + a4 * (1.0 - a7), 1.0);
  *a2 = 1.0 - fmin(a7 + a5 * (1.0 - a7), 1.0);
  double result = 1.0 - fmin(a7 + a6 * (1.0 - a7), 1.0);
  *a3 = result;
  return result;
}

BOOL ITKColorIsBlack(CGColor *a1)
{
  ColorSpace = CGColorGetColorSpace(a1);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  Components = CGColorGetComponents(a1);
  double v5 = 0.0;
  if (Model)
  {
    if (Model == kCGColorSpaceModelCMYK)
    {
      Components += 3;
      double v5 = 1.0;
    }
    else
    {
      if (Model != kCGColorSpaceModelRGB || *Components != 0.0 || Components[1] != 0.0) {
        return 0;
      }
      Components += 2;
    }
  }
  return *Components == v5;
}

CGFloat ITKColorLightness(CGColor *a1)
{
  ColorSpace = CGColorGetColorSpace(a1);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  switch(Model)
  {
    case kCGColorSpaceModelMonochrome:
      return *CGColorGetComponents(a1);
    case kCGColorSpaceModelCMYK:
      Components = CGColorGetComponents(a1);
      double v8 = Components[3];
      double v9 = 1.0 - fmin(v8 + *Components * (1.0 - v8), 1.0);
      double v10 = 1.0 - fmin(v8 + Components[1] * (1.0 - v8), 1.0);
      double v11 = 1.0 - fmin(v8 + Components[2] * (1.0 - v8), 1.0);
      double v5 = fmax(fmax(v9, v10), v11) + fmin(fmin(v9, v10), v11);
      return v5 * 0.5;
    case kCGColorSpaceModelRGB:
      CGColorRef v4 = CGColorGetComponents(a1);
      double v5 = fmax(fmax(*v4, v4[1]), v4[2]) + fmin(fmin(*v4, v4[1]), v4[2]);
      return v5 * 0.5;
  }
  NSLog(&cfstr_WarningTesting.isa);
  return 0.0;
}

CGContext *ITKCreateRGBABitmapContext(int a1, double a2, CGFloat a3, CGFloat a4)
{
  if (ITKDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1) {
    dispatch_once(&ITKDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_3);
  }
  double v8 = CGBitmapContextCreate(0, (unint64_t)(a2 * a4), (unint64_t)(a3 * a4), 8uLL, (4 * (unint64_t)(a2 * a4) + 31) & 0xFFFFFFFFFFFFFFE0, (CGColorSpaceRef)ITKDeviceRGBColorSpace_sDeviceRGBColorSpace, 0x2002u);
  CGAffineTransformMakeScale(&transform, a4, a4);
  CGContextConcatCTM(v8, &transform);
  if (a1)
  {
    CGContextTranslateCTM(v8, 0.0, a3);
    CGAffineTransformMakeScale(&v10, 1.0, -1.0);
    CGContextConcatCTM(v8, &v10);
  }
  return v8;
}

unint64_t ITKBitmapGetAlignedBytesPerRow(uint64_t a1)
{
  return (a1 + 31) & 0xFFFFFFFFFFFFFFE0;
}

CGColorRef ITKCreateCheckerBoardColor(CGColor *a1, CGColor *a2, CGFloat a3, CGFloat a4)
{
  double v8 = a3 + a3;
  double v9 = a4 + a4;
  CGAffineTransform v10 = ITKCreateRGBABitmapContext(0, a3 + a3, a4 + a4, 1.0);
  if (!v10) {
    return 0;
  }
  double v11 = v10;
  CGContextSetFillColorWithColor(v10, a1);
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = v8;
  v15.size.height = v9;
  CGContextFillRect(v11, v15);
  CGContextSetFillColorWithColor(v11, a2);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = a3;
  v16.size.height = a4;
  CGContextFillRect(v11, v16);
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a3;
  v17.size.height = a4;
  CGContextFillRect(v11, v17);
  CGImageRef Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  if (!Image) {
    return 0;
  }
  CGColorRef PatternWithImageAndTransform = ITKCGColorCreatePatternWithImageAndTransform(Image, 0);
  CGImageRelease(Image);
  return PatternWithImageAndTransform;
}

uint64_t ITKVNBaselineAngles(void *a1, const char *a2)
{
  return objc_msgSend(a1, "itk_map:", &__block_literal_global_4);
}

id __ITKVNBaselineAngles_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 getCROutputRegion];
  [v2 visualTextAngle];
  CGColorRef v4 = [NSNumber numberWithDouble:(float)-v3];

  return v4;
}

double ITKVNGlobalBaselineAngleFromAngles(void *a1)
{
  id v1 = a1;
  if ([v1 count])
  {
    uint64_t v2 = [v1 sortedArrayUsingSelector:sel_compare_];
    float v3 = objc_msgSend(v2, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v2, "count") >> 1);
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

id ITKVNRectClosestToPoint(void *a1, double a2, double a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  CGFloat v6[2] = __ITKVNRectClosestToPoint_block_invoke;
  v6[3] = &__block_descriptor_48_e59_q24__0__VNRectangleObservation_8__VNRectangleObservation_16l;
  *(double *)&v6[4] = a2;
  *(double *)&v6[5] = a3;
  float v3 = [a1 sortedArrayUsingComparator:v6];
  if ([v3 count])
  {
    double v4 = [v3 firstObject];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

uint64_t __ITKVNRectClosestToPoint_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 boundingBox];
  ITKCenterOfRect();
  [v4 boundingBox];

  ITKCenterOfRect();
  ITKDistanceSquared();
  double v6 = v5;
  ITKDistanceSquared();
  if (v6 >= v7) {
    return v7 < v6;
  }
  else {
    return -1;
  }
}

uint64_t itk_orientationByRotatingLeft(unint64_t a1)
{
  if (a1 > 7) {
    return 0;
  }
  else {
    return qword_252AA04F0[a1];
  }
}

uint64_t itk_orientationByRotatingRight(unint64_t a1)
{
  if (a1 > 7) {
    return 0;
  }
  else {
    return qword_252AA0530[a1];
  }
}

void itk_orientationApplyToRectAtPoint(CGAffineTransform *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, -a6, -a7);
  _transformFromImageOrientation(a1, 0, (uint64_t)&t2);
  CGAffineTransform t1 = v18;
  CGAffineTransformConcat(&v17, &t1, &t2);
  CGAffineTransform v18 = v17;
  CGAffineTransformMakeTranslation(&v14, a6, a7);
  CGAffineTransform t1 = v18;
  CGAffineTransformConcat(&v17, &t1, &v14);
  CGAffineTransform v18 = v17;
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  CGRectApplyAffineTransform(v19, &v17);
}

CGAffineTransform *itk_transformToImageOrientation@<X0>(CGAffineTransform *a1@<X0>, uint64_t a2@<X8>)
{
  return _transformFromImageOrientation(a1, 0, a2);
}

uint64_t itk_clockwiseRotationsFromUpToMatchOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return 0;
  }
  else {
    return qword_252AA0570[a1 - 1];
  }
}

uint64_t itk_counterClockwiseRotationsFromUpToMatchOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return 0;
  }
  else {
    return qword_252AA05A8[a1 - 1];
  }
}

CGAffineTransform *_transformFromImageOrientation@<X0>(CGAffineTransform *result@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v4 = MEMORY[0x263F000D0];
  long long v5 = *MEMORY[0x263F000D0];
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)a3 = *MEMORY[0x263F000D0];
  *(_OWORD *)(a3 + 16) = v6;
  long long v7 = *(_OWORD *)(v4 + 32);
  *(_OWORD *)(a3 + 32) = v7;
  double v9 = 0.0;
  double v10 = 3.14159265;
  switch((unint64_t)result)
  {
    case 1uLL:
      goto LABEL_8;
    case 2uLL:
      double v10 = -1.57079633;
      goto LABEL_8;
    case 3uLL:
      double v10 = 1.57079633;
      goto LABEL_8;
    case 4uLL:
      goto LABEL_7;
    case 5uLL:
      double v9 = 3.14159265;
      goto LABEL_7;
    case 6uLL:
      double v9 = -1.57079633;
      goto LABEL_7;
    case 7uLL:
      double v9 = 1.57079633;
LABEL_7:
      *(_OWORD *)&v16.a = v5;
      *(_OWORD *)&v16.c = v6;
      *(_OWORD *)&v16.tx = v7;
      double result = CGAffineTransformScale((CGAffineTransform *)a3, &v16, -1.0, 1.0);
      double v10 = v9;
      if (v9 != 0.0)
      {
LABEL_8:
        double v11 = -v10;
        if (!a2) {
          double v11 = v10;
        }
        CGAffineTransformMakeRotation(&t2, v11);
        long long v12 = *(_OWORD *)(a3 + 16);
        *(_OWORD *)&v14.a = *(_OWORD *)a3;
        *(_OWORD *)&v14.c = v12;
        *(_OWORD *)&v14.tx = *(_OWORD *)(a3 + 32);
        double result = CGAffineTransformConcat(&v16, &v14, &t2);
        long long v13 = *(_OWORD *)&v16.c;
        *(_OWORD *)a3 = *(_OWORD *)&v16.a;
        *(_OWORD *)(a3 + 16) = v13;
        *(_OWORD *)(a3 + 32) = *(_OWORD *)&v16.tx;
      }
      break;
    default:
      return result;
  }
  return result;
}

CGAffineTransform *itk_transformFromImageOrientation@<X0>(CGAffineTransform *a1@<X0>, uint64_t a2@<X8>)
{
  return _transformFromImageOrientation(a1, 1, a2);
}

uint64_t itk_cgImagePropertyOrientationFromITKOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return 1;
  }
  else {
    return dword_252AA05E0[a1 - 1];
  }
}

uint64_t itk_imageOrientationFromTransform(long long *a1)
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  long long v1 = a1[1];
  long long v5 = *a1;
  long long v6 = v1;
  v4[2] = __itk_imageOrientationFromTransform_block_invoke;
  v4[3] = &unk_26538E370;
  long long v7 = a1[2];
  v4[4] = &v8;
  [&unk_2702FA308 enumerateObjectsUsingBlock:v4];
  uint64_t v2 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v2;
}

void sub_252A9C1B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

CGAffineTransform *__itk_imageOrientationFromTransform_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  long long v6 = (CGAffineTransform *)[a2 integerValue];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  double result = _transformFromImageOrientation(v6, 0, (uint64_t)&v8);
  if (vabdd_f64(*(double *)(a1 + 40), *(double *)&v8) < 0.00999999978
    && vabdd_f64(*(double *)(a1 + 48), *((double *)&v8 + 1)) < 0.00999999978
    && vabdd_f64(*(double *)(a1 + 56), *(double *)&v9) < 0.00999999978
    && vabdd_f64(*(double *)(a1 + 64), *((double *)&v9 + 1)) < 0.00999999978)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
    *a4 = 1;
  }
  return result;
}

unint64_t itk_swapLeftAndRightImageOrientation(unint64_t result)
{
  if (result <= 7) {
    return qword_252AA0600[result];
  }
  return result;
}

uint64_t itk_orientationFromCGImagePropertyOrientation(int a1)
{
  if ((a1 - 2) > 6) {
    return 0;
  }
  else {
    return qword_252AA0640[a1 - 2];
  }
}

void ITKClipperPathsFromCGPath(const CGPath *a1, double a2)
{
  CGPathRandomAccess::CGPathRandomAccess((CGPathRandomAccess *)v3, a1);
  CGPathRandomAccess::clipperPaths((CGPathRandomAccess *)v3, a2);
}

void sub_252A9C32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::vector<CGPathRandomAccessSubpath>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void CGPathRandomAccess::clipperPaths(CGPathRandomAccess *this, double a2)
{
}

void sub_252A9C4DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void CGPathRandomAccess::CGPathRandomAccess(CGPathRandomAccess *this, const CGPath *a2)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  CGPathRandomAccess::addPath(this, a2);
}

void sub_252A9C528(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::vector<CGPathRandomAccessSubpath>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

unint64_t CGPathRandomAccess::addPath(CGPathRandomAccess *this, CGPathRef path)
{
  v10[0] = 0;
  v10[1] = v10;
  unint64_t v10[2] = 0x4812000000;
  v10[3] = __Block_byref_object_copy__1;
  void v10[4] = __Block_byref_object_dispose__1;
  v10[5] = &unk_252AA2929;
  long long v12 = 0;
  uint64_t v13 = 0;
  uint64_t v11 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN18CGPathRandomAccess7addPathEPK6CGPath_block_invoke;
  block[3] = &unk_26538E028;
  block[4] = v10;
  CGPathApplyWithBlock(path, block);
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 1) - *(void *)this) >> 4);
  v7[0] = 0;
  v7[1] = v7;
  unint64_t v7[2] = 0x4012000000;
  v7[3] = __Block_byref_object_copy__1;
  v7[4] = __Block_byref_object_dispose__2;
  void v7[5] = &unk_252AA2929;
  long long v8 = *MEMORY[0x263F00148];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  CGFloat v6[2] = ___ZN18CGPathRandomAccess7addPathEPK6CGPath_block_invoke_4;
  v6[3] = &unk_26538E398;
  void v6[6] = this;
  v6[7] = v4;
  v6[4] = v10;
  v6[5] = v7;
  CGPathApplyWithBlock(path, v6);
  CGPathRandomAccessSubpath::closeIfNeeded((CGPathRandomAccessSubpath *)(*((void *)this + 1) - 48));
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(v10, 8);
  if (v11)
  {
    long long v12 = v11;
    operator delete(v11);
  }
  return v4;
}

void sub_252A9C734(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  float v3 = *(void **)(v1 - 88);
  if (v3)
  {
    *(void *)(v1 - 80) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__1(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

{
  __n128 result;

  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void ___ZN18CGPathRandomAccess7addPathEPK6CGPath_block_invoke(uint64_t a1, int *a2)
{
  int v2 = *a2;
  if ((*a2 - 2) < 2)
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56);
    ++*(void *)(v7 - 16);
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56);
    uint64_t v9 = *(void *)(v8 - 8) + 3;
LABEL_8:
    *(void *)(v8 - 8) = v9;
    return;
  }
  if (v2 == 1)
  {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56);
    ++*(void *)(v10 - 16);
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56);
    uint64_t v9 = *(void *)(v8 - 8) + 1;
    goto LABEL_8;
  }
  if (!v2)
  {
    float v3 = *(void **)(*(void *)(a1 + 32) + 8);
    unint64_t v4 = (int64x2_t *)v3[7];
    unint64_t v5 = v3[8];
    if ((unint64_t)v4 >= v5)
    {
      uint64_t v11 = (int64x2_t *)v3[6];
      uint64_t v12 = v4 - v11;
      unint64_t v13 = v12 + 1;
      if ((unint64_t)(v12 + 1) >> 60) {
        std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v14 = v5 - (void)v11;
      if (v14 >> 3 > v13) {
        unint64_t v13 = v14 >> 3;
      }
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v15 = v13;
      }
      if (v15)
      {
        CGAffineTransform v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)(v3 + 8), v15);
        uint64_t v11 = (int64x2_t *)v3[6];
        unint64_t v4 = (int64x2_t *)v3[7];
      }
      else
      {
        CGAffineTransform v16 = 0;
      }
      CGAffineTransform v17 = (int64x2_t *)&v16[16 * v12];
      CGAffineTransform v18 = &v16[16 * v15];
      *CGAffineTransform v17 = vdupq_n_s64(1uLL);
      long long v6 = v17 + 1;
      if (v4 != v11)
      {
        do
        {
          v17[-1] = v4[-1];
          --v17;
          --v4;
        }
        while (v4 != v11);
        uint64_t v11 = (int64x2_t *)v3[6];
      }
      v3[6] = v17;
      v3[7] = v6;
      v3[8] = v18;
      if (v11) {
        operator delete(v11);
      }
    }
    else
    {
      *unint64_t v4 = vdupq_n_s64(1uLL);
      long long v6 = v4 + 1;
    }
    v3[7] = v6;
  }
}

void ___ZN18CGPathRandomAccess7addPathEPK6CGPath_block_invoke_4(void *a1, uint64_t a2)
{
  unint64_t v4 = (uint64_t *)a1[6];
  switch(*(_DWORD *)a2)
  {
    case 0:
      unint64_t v5 = (_OWORD *)v4[1];
      if (v5 != (_OWORD *)*v4)
      {
        CGPathRandomAccessSubpath::closeIfNeeded((CGPathRandomAccessSubpath *)(v5 - 3));
        unint64_t v5 = (_OWORD *)v4[1];
      }
      unint64_t v6 = v4[2];
      if ((unint64_t)v5 >= v6)
      {
        unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v5 - *v4) >> 4);
        unint64_t v24 = v23 + 1;
        if (v23 + 1 > 0x555555555555555) {
          std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - *v4) >> 4);
        if (2 * v25 > v24) {
          unint64_t v24 = 2 * v25;
        }
        if (v25 >= 0x2AAAAAAAAAAAAAALL) {
          unint64_t v26 = 0x555555555555555;
        }
        else {
          unint64_t v26 = v24;
        }
        v135[4] = v4 + 2;
        if (v26) {
          uint64_t v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessSubpath>>((uint64_t)(v4 + 2), v26);
        }
        else {
          uint64_t v27 = 0;
        }
        int64x2_t v93 = &v27[48 * v23];
        v135[0] = v27;
        v135[1] = v93;
        v135[3] = &v27[48 * v26];
        *(_OWORD *)int64x2_t v93 = 0u;
        *((_OWORD *)v93 + 1) = 0u;
        *((_OWORD *)v93 + 2) = 0u;
        v135[2] = v93 + 48;
        std::vector<CGPathRandomAccessSubpath>::__swap_out_circular_buffer(v4, v135);
        uint64_t v7 = (char **)v4[1];
        std::__split_buffer<CGPathRandomAccessSubpath>::~__split_buffer((uint64_t)v135);
      }
      else
      {
        v5[1] = 0u;
        v5[2] = 0u;
        *unint64_t v5 = 0u;
        uint64_t v7 = (char **)(v5 + 3);
        v4[1] = (uint64_t)(v5 + 3);
      }
      v4[1] = (uint64_t)v7;
      double v94 = (unint64_t *)(*(void *)(*(void *)(a1[4] + 8) + 48)
                               + 16 * (~a1[7] - 0x5555555555555555 * (((unint64_t)v7 - *v4) >> 4)));
      unint64_t v95 = v94[1];
      std::vector<CGPathRandomAccessElement>::reserve(v7 - 6, *v94);
      std::vector<ClipperLib::DoublePoint>::reserve((void **)(v4[1] - 24), v95);
      *(_OWORD *)(*(void *)(a1[5] + 8) + 48) = *(_OWORD *)*(void *)(a2 + 8);
      uint64_t v41 = v4[1];
      __int16 v42 = (_OWORD *)(*(void *)(a1[5] + 8) + 48);
      uint64_t v43 = *(_OWORD **)(v41 - 16);
      unint64_t v96 = *(void *)(v41 - 8);
      if ((unint64_t)v43 < v96) {
        goto LABEL_117;
      }
      uint64_t v45 = (void **)(v41 - 24);
      uint64_t v97 = *(void *)(v41 - 24);
      uint64_t v98 = ((uint64_t)v43 - v97) >> 4;
      unint64_t v99 = v98 + 1;
      if ((unint64_t)(v98 + 1) >> 60) {
        goto LABEL_134;
      }
      uint64_t v100 = v96 - v97;
      if (v100 >> 3 > v99) {
        unint64_t v99 = v100 >> 3;
      }
      if ((unint64_t)v100 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v101 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v101 = v99;
      }
      if (v101) {
        unint64_t v102 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v41 - 8, v101);
      }
      else {
        unint64_t v102 = 0;
      }
      uint64_t v103 = &v102[16 * v98];
      long long v104 = &v102[16 * v101];
      *(_OWORD *)uint64_t v103 = *v42;
      long long v105 = v103 + 16;
      unint64_t v122 = *(char **)(v41 - 24);
      uint64_t v106 = *(char **)(v41 - 16);
      if (v106 == v122) {
        goto LABEL_130;
      }
      do
      {
        *((_OWORD *)v103 - 1) = *((_OWORD *)v106 - 1);
        v103 -= 16;
        v106 -= 16;
      }
      while (v106 != v122);
      goto LABEL_129;
    case 1:
      uint64_t v8 = v4[1];
      uint64_t v9 = ((uint64_t)(*(void *)(v8 - 16) - *(void *)(v8 - 24)) >> 4) - 1;
      unint64_t v10 = *(void *)(v8 - 40);
      unint64_t v11 = *(void *)(v8 - 32);
      if (v10 < v11)
      {
        *(void *)unint64_t v10 = v9;
        *(unsigned char *)(v10 + 8) = 0;
        uint64_t v12 = (char *)(v10 + 16);
        goto LABEL_31;
      }
      uint64_t v28 = *(void *)(v8 - 48);
      uint64_t v29 = (uint64_t)(v10 - v28) >> 4;
      unint64_t v30 = v29 + 1;
      if (!((unint64_t)(v29 + 1) >> 60))
      {
        uint64_t v31 = v11 - v28;
        if (v31 >> 3 > v30) {
          unint64_t v30 = v31 >> 3;
        }
        if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v32 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v32 = v30;
        }
        uint64_t v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v8 - 32, v32);
        long long v34 = &v33[16 * v29];
        long long v36 = &v33[16 * v35];
        *(void *)long long v34 = v9;
        v34[8] = 0;
        uint64_t v12 = v34 + 16;
        uint64_t v38 = *(unsigned char **)(v8 - 48);
        uint64_t v37 = *(unsigned char **)(v8 - 40);
        if (v37 != v38)
        {
          do
          {
            uint64_t v39 = *((void *)v37 - 2);
            v37 -= 16;
            char v40 = v37[8];
            *((void *)v34 - 2) = v39;
            v34 -= 16;
            v34[8] = v40;
          }
          while (v37 != v38);
          uint64_t v37 = *(unsigned char **)(v8 - 48);
        }
        *(void *)(v8 - 48) = v34;
        *(void *)(v8 - 40) = v12;
        *(void *)(v8 - 32) = v36;
        if (v37) {
          operator delete(v37);
        }
LABEL_31:
        *(void *)(v8 - 40) = v12;
        uint64_t v41 = v4[1];
        __int16 v42 = *(_OWORD **)(a2 + 8);
        uint64_t v43 = *(_OWORD **)(v41 - 16);
        unint64_t v44 = *(void *)(v41 - 8);
        if ((unint64_t)v43 >= v44)
        {
          uint64_t v45 = (void **)(v41 - 24);
          uint64_t v46 = *(void *)(v41 - 24);
          uint64_t v47 = ((uint64_t)v43 - v46) >> 4;
          unint64_t v48 = v47 + 1;
          if (!((unint64_t)(v47 + 1) >> 60))
          {
            uint64_t v49 = v44 - v46;
            if (v49 >> 3 > v48) {
              unint64_t v48 = v49 >> 3;
            }
            if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v50 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v50 = v48;
            }
            if (v50) {
              unint64_t v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v41 - 8, v50);
            }
            else {
              unint64_t v51 = 0;
            }
            uint64_t v103 = &v51[16 * v47];
            long long v104 = &v51[16 * v50];
            *(_OWORD *)uint64_t v103 = *v42;
            long long v105 = v103 + 16;
            long long v107 = *(char **)(v41 - 24);
            uint64_t v106 = *(char **)(v41 - 16);
            if (v106 == v107) {
              goto LABEL_130;
            }
            do
            {
              *((_OWORD *)v103 - 1) = *((_OWORD *)v106 - 1);
              v103 -= 16;
              v106 -= 16;
            }
            while (v106 != v107);
LABEL_129:
            uint64_t v106 = (char *)*v45;
LABEL_130:
            *(void *)(v41 - 24) = v103;
            *(void *)(v41 - 16) = v105;
            *(void *)(v41 - 8) = v104;
            if (v106) {
              operator delete(v106);
            }
            goto LABEL_132;
          }
          goto LABEL_134;
        }
        goto LABEL_117;
      }
      goto LABEL_133;
    case 2:
      uint64_t v13 = v4[1];
      uint64_t v14 = ((uint64_t)(*(void *)(v13 - 16) - *(void *)(v13 - 24)) >> 4) - 1;
      unint64_t v15 = *(void *)(v13 - 40);
      unint64_t v16 = *(void *)(v13 - 32);
      if (v15 < v16)
      {
        *(void *)unint64_t v15 = v14;
        *(unsigned char *)(v15 + 8) = 1;
        CGAffineTransform v17 = (char *)(v15 + 16);
        goto LABEL_51;
      }
      uint64_t v52 = *(void *)(v13 - 48);
      uint64_t v53 = (uint64_t)(v15 - v52) >> 4;
      unint64_t v54 = v53 + 1;
      if (!((unint64_t)(v53 + 1) >> 60))
      {
        uint64_t v55 = v16 - v52;
        if (v55 >> 3 > v54) {
          unint64_t v54 = v55 >> 3;
        }
        if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v56 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v56 = v54;
        }
        int64x2_t v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v13 - 32, v56);
        long long v58 = &v57[16 * v53];
        unint64_t v60 = &v57[16 * v59];
        *(void *)long long v58 = v14;
        v58[8] = 1;
        CGAffineTransform v17 = v58 + 16;
        unint64_t v62 = *(unsigned char **)(v13 - 48);
        unint64_t v61 = *(unsigned char **)(v13 - 40);
        if (v61 != v62)
        {
          do
          {
            uint64_t v63 = *((void *)v61 - 2);
            v61 -= 16;
            char v64 = v61[8];
            *((void *)v58 - 2) = v63;
            v58 -= 16;
            v58[8] = v64;
          }
          while (v61 != v62);
          unint64_t v61 = *(unsigned char **)(v13 - 48);
        }
        *(void *)(v13 - 48) = v58;
        *(void *)(v13 - 40) = v17;
        *(void *)(v13 - 32) = v60;
        if (v61) {
          operator delete(v61);
        }
LABEL_51:
        *(void *)(v13 - 40) = v17;
        uint64_t v65 = v4[1];
        double v66 = *(float64x2_t **)(v65 - 16);
        float64x2_t v67 = vmlaq_f64(v66[-1], (float64x2_t)vdupq_n_s64(0x3FE5555555555555uLL), vsubq_f64(*(float64x2_t *)*(void *)(a2 + 8), v66[-1]));
        unint64_t v68 = *(void *)(v65 - 8);
        if ((unint64_t)v66 >= v68)
        {
          unint64_t v86 = *(float64x2_t **)(v65 - 24);
          uint64_t v87 = v66 - v86;
          unint64_t v88 = v87 + 1;
          if ((unint64_t)(v87 + 1) >> 60) {
            goto LABEL_135;
          }
          uint64_t v89 = v68 - (void)v86;
          if (v89 >> 3 > v88) {
            unint64_t v88 = v89 >> 3;
          }
          if ((unint64_t)v89 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v90 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v90 = v88;
          }
          if (v90)
          {
            float64x2_t v133 = v67;
            long long v91 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v65 - 8, v90);
            float64x2_t v67 = v133;
            int64x2_t v92 = v91;
            unint64_t v86 = *(float64x2_t **)(v65 - 24);
            double v66 = *(float64x2_t **)(v65 - 16);
          }
          else
          {
            int64x2_t v92 = 0;
          }
          long long v108 = (float64x2_t *)&v92[16 * v87];
          long long v109 = &v92[16 * v90];
          *long long v108 = v67;
          f64 = (_OWORD *)v108[1].f64;
          if (v66 != v86)
          {
            do
            {
              v108[-1] = v66[-1];
              --v108;
              --v66;
            }
            while (v66 != v86);
            unint64_t v86 = *(float64x2_t **)(v65 - 24);
          }
          *(void *)(v65 - 24) = v108;
          *(void *)(v65 - 16) = f64;
          *(void *)(v65 - 8) = v109;
          if (v86) {
            operator delete(v86);
          }
        }
        else
        {
          float64x2_t *v66 = v67;
          f64 = (_OWORD *)v66[1].f64;
        }
        *(void *)(v65 - 16) = f64;
        uint64_t v110 = v4[1];
        float64x2_t v111 = vmlaq_f64(*(float64x2_t *)(*(void *)(a2 + 8) + 16), (float64x2_t)vdupq_n_s64(0x3FE5555555555555uLL), vsubq_f64(*(float64x2_t *)*(void *)(a2 + 8), *(float64x2_t *)(*(void *)(a2 + 8) + 16)));
        uint64_t v112 = *(char **)(v110 - 16);
        unint64_t v113 = *(void *)(v110 - 8);
        if ((unint64_t)v112 < v113)
        {
          *(float64x2_t *)uint64_t v112 = v111;
          unint64_t v114 = v112 + 16;
          goto LABEL_116;
        }
        uint64_t v115 = *(char **)(v110 - 24);
        uint64_t v116 = (v112 - v115) >> 4;
        unint64_t v117 = v116 + 1;
        if (!((unint64_t)(v116 + 1) >> 60))
        {
          uint64_t v118 = v113 - (void)v115;
          if (v118 >> 3 > v117) {
            unint64_t v117 = v118 >> 3;
          }
          if ((unint64_t)v118 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v119 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v119 = v117;
          }
          if (v119)
          {
            float64x2_t v134 = v111;
            int64x2_t v120 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v110 - 8, v119);
            float64x2_t v111 = v134;
            int64x2_t v121 = v120;
            uint64_t v115 = *(char **)(v110 - 24);
            uint64_t v112 = *(char **)(v110 - 16);
          }
          else
          {
            int64x2_t v121 = 0;
          }
          v123 = (float64x2_t *)&v121[16 * v116];
          v124 = &v121[16 * v119];
          float64x2_t *v123 = v111;
          unint64_t v114 = (_OWORD *)v123[1].f64;
          if (v112 != v115)
          {
            do
            {
              v123[-1] = *((float64x2_t *)v112 - 1);
              --v123;
              v112 -= 16;
            }
            while (v112 != v115);
            uint64_t v115 = *(char **)(v110 - 24);
          }
          *(void *)(v110 - 24) = v123;
          *(void *)(v110 - 16) = v114;
          *(void *)(v110 - 8) = v124;
          if (v115) {
            operator delete(v115);
          }
LABEL_116:
          *(void *)(v110 - 16) = v114;
          uint64_t v41 = v4[1];
          __int16 v42 = (_OWORD *)(*(void *)(a2 + 8) + 16);
          uint64_t v43 = *(_OWORD **)(v41 - 16);
          unint64_t v125 = *(void *)(v41 - 8);
          if ((unint64_t)v43 >= v125)
          {
            uint64_t v45 = (void **)(v41 - 24);
            uint64_t v126 = *(void *)(v41 - 24);
            uint64_t v127 = ((uint64_t)v43 - v126) >> 4;
            unint64_t v128 = v127 + 1;
            if (!((unint64_t)(v127 + 1) >> 60))
            {
              uint64_t v129 = v125 - v126;
              if (v129 >> 3 > v128) {
                unint64_t v128 = v129 >> 3;
              }
              if ((unint64_t)v129 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v130 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v130 = v128;
              }
              if (v130) {
                v131 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v41 - 8, v130);
              }
              else {
                v131 = 0;
              }
              uint64_t v103 = &v131[16 * v127];
              long long v104 = &v131[16 * v130];
              *(_OWORD *)uint64_t v103 = *v42;
              long long v105 = v103 + 16;
              unint64_t v132 = *(char **)(v41 - 24);
              uint64_t v106 = *(char **)(v41 - 16);
              if (v106 == v132) {
                goto LABEL_130;
              }
              do
              {
                *((_OWORD *)v103 - 1) = *((_OWORD *)v106 - 1);
                v103 -= 16;
                v106 -= 16;
              }
              while (v106 != v132);
              goto LABEL_129;
            }
LABEL_134:
            std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
          }
LABEL_117:
          *uint64_t v43 = *v42;
          long long v105 = v43 + 1;
LABEL_132:
          *(void *)(v41 - 16) = v105;
          return;
        }
LABEL_135:
        std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
      }
      goto LABEL_133;
    case 3:
      uint64_t v18 = v4[1];
      uint64_t v19 = ((uint64_t)(*(void *)(v18 - 16) - *(void *)(v18 - 24)) >> 4) - 1;
      unint64_t v20 = *(void *)(v18 - 40);
      unint64_t v21 = *(void *)(v18 - 32);
      if (v20 >= v21)
      {
        uint64_t v70 = *(void *)(v18 - 48);
        uint64_t v71 = (uint64_t)(v20 - v70) >> 4;
        unint64_t v72 = v71 + 1;
        if ((unint64_t)(v71 + 1) >> 60) {
LABEL_133:
        }
          std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
        uint64_t v73 = v21 - v70;
        if (v73 >> 3 > v72) {
          unint64_t v72 = v73 >> 3;
        }
        if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v74 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v74 = v72;
        }
        unint64_t v75 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v18 - 32, v74);
        unint64_t v76 = &v75[16 * v71];
        long long v78 = &v75[16 * v77];
        *(void *)unint64_t v76 = v19;
        v76[8] = 1;
        uint64_t v22 = v76 + 16;
        double v80 = *(unsigned char **)(v18 - 48);
        double v79 = *(unsigned char **)(v18 - 40);
        if (v79 != v80)
        {
          do
          {
            uint64_t v81 = *((void *)v79 - 2);
            v79 -= 16;
            char v82 = v79[8];
            *((void *)v76 - 2) = v81;
            v76 -= 16;
            v76[8] = v82;
          }
          while (v79 != v80);
          double v79 = *(unsigned char **)(v18 - 48);
        }
        *(void *)(v18 - 48) = v76;
        *(void *)(v18 - 40) = v22;
        *(void *)(v18 - 32) = v78;
        if (v79) {
          operator delete(v79);
        }
      }
      else
      {
        *(void *)unint64_t v20 = v19;
        *(unsigned char *)(v20 + 8) = 1;
        uint64_t v22 = (char *)(v20 + 16);
      }
      *(void *)(v18 - 40) = v22;
      uint64_t v83 = v4[1];
      uint64_t v84 = *(void *)(v83 - 16);
      uint64_t v85 = *(char **)(a2 + 8);
      std::vector<CGPoint>::__insert_with_size[abi:ne180100]<CGPoint*,CGPoint*>(v83 - 24, v84, v85, v85 + 48, 3);
      return;
    default:
      return;
  }
}

void sub_252A9D1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__split_buffer<CGPathRandomAccessSubpath>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void CGPathRandomAccessSubpath::closeIfNeeded(CGPathRandomAccessSubpath *this)
{
  uint64_t v1 = *(void *)this;
  unint64_t v2 = *((void *)this + 1);
  uint64_t v3 = v2 - *(void *)this;
  if ((unint64_t)v3 >= 0x20)
  {
    unint64_t v5 = (double *)*((void *)this + 3);
    uint64_t v6 = *((void *)this + 4);
    uint64_t v7 = ((v6 - (uint64_t)v5) >> 4) - 1;
    if (*(void *)(v2 - 16) != v7 && (*(double *)(v6 - 16) != *v5 || *(double *)(v6 - 8) != v5[1]))
    {
      uint64_t v9 = (char *)this + 16;
      unint64_t v10 = *((void *)this + 2);
      if (v2 >= v10)
      {
        uint64_t v12 = v3 >> 4;
        unint64_t v13 = (v3 >> 4) + 1;
        if (v13 >> 60) {
          std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v14 = v10 - v1;
        if (v14 >> 3 > v13) {
          unint64_t v13 = v14 >> 3;
        }
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v15 = v13;
        }
        unint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)v9, v15);
        CGAffineTransform v17 = &v16[16 * v12];
        uint64_t v19 = &v16[16 * v18];
        *(void *)CGAffineTransform v17 = v7;
        v17[8] = 0;
        unint64_t v11 = v17 + 16;
        unint64_t v21 = *(unsigned char **)this;
        unint64_t v20 = (unsigned char *)*((void *)this + 1);
        if (v20 != *(unsigned char **)this)
        {
          do
          {
            uint64_t v22 = *((void *)v20 - 2);
            v20 -= 16;
            char v23 = v20[8];
            *((void *)v17 - 2) = v22;
            v17 -= 16;
            v17[8] = v23;
          }
          while (v20 != v21);
          unint64_t v20 = *(unsigned char **)this;
        }
        *(void *)this = v17;
        *((void *)this + 1) = v11;
        *((void *)this + 2) = v19;
        if (v20) {
          operator delete(v20);
        }
      }
      else
      {
        *(void *)unint64_t v2 = v7;
        *(unsigned char *)(v2 + 8) = 0;
        unint64_t v11 = (char *)(v2 + 16);
      }
      *((void *)this + 1) = v11;
    }
  }
}

void std::vector<CGPathRandomAccessElement>::reserve(char **a1, unint64_t a2)
{
  unint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v3, a2);
    uint64_t v7 = &v6[v5];
    uint64_t v9 = &v6[16 * v8];
    unint64_t v11 = *a1;
    unint64_t v10 = a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 2);
        v10 -= 16;
        char v14 = v10[8];
        *((void *)v12 - 2) = v13;
        v12 -= 16;
        v12[8] = v14;
      }
      while (v10 != v11);
      unint64_t v10 = *a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void std::vector<CGPathRandomAccessSubpath>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CGPathRandomAccessSubpath>,std::reverse_iterator<CGPathRandomAccessSubpath*>,std::reverse_iterator<CGPathRandomAccessSubpath*>,std::reverse_iterator<CGPathRandomAccessSubpath*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  uint64_t v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  uint64_t v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  uint64_t v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessSubpath>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

__n128 std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CGPathRandomAccessSubpath>,std::reverse_iterator<CGPathRandomAccessSubpath*>,std::reverse_iterator<CGPathRandomAccessSubpath*>,std::reverse_iterator<CGPathRandomAccessSubpath*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 != a5)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = a7 + v7;
      uint64_t v9 = a3 + v7;
      *(void *)(v8 - 48) = 0;
      *(void *)(v8 - 40) = 0;
      *(void *)(v8 - 32) = 0;
      *(_OWORD *)(v8 - 48) = *(_OWORD *)(a3 + v7 - 48);
      *(void *)(v8 - 32) = *(void *)(a3 + v7 - 32);
      *(void *)(v9 - 48) = 0;
      *(void *)(v9 - 40) = 0;
      *(void *)(v9 - 32) = 0;
      *(void *)(v8 - 24) = 0;
      *(void *)(v8 - 16) = 0;
      *(void *)(v8 - 8) = 0;
      __n128 result = *(__n128 *)(a3 + v7 - 24);
      *(__n128 *)(v8 - 24) = result;
      *(void *)(v8 - 8) = *(void *)(a3 + v7 - 8);
      *(void *)(v9 - 24) = 0;
      *(void *)(v9 - 16) = 0;
      *(void *)(v9 - 8) = 0;
      v7 -= 48;
    }
    while (a3 + v7 != a5);
  }
  return result;
}

void std::__destroy_at[abi:ne180100]<CGPathRandomAccessSubpath,0>(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v3;
    operator delete(v3);
  }
}

uint64_t std::__split_buffer<CGPathRandomAccessSubpath>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 48;
    std::__destroy_at[abi:ne180100]<CGPathRandomAccessSubpath,0>(i - 48);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

char *std::vector<CGPoint>::__insert_with_size[abi:ne180100]<CGPoint*,CGPoint*>(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  uint64_t v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 4)
  {
    uint64_t v13 = *(void **)a1;
    unint64_t v14 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 4);
    if (v14 >> 60) {
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = (__dst - (uint64_t)v13) >> 4;
    uint64_t v16 = v10 - (void)v13;
    if (v16 >> 3 > v14) {
      unint64_t v14 = v16 >> 3;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v14;
    }
    uint64_t v37 = v9;
    if (v17) {
      uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v9, v17);
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v28 = &v18[16 * v15];
    __p = v18;
    long long v34 = v28;
    long long v36 = &v18[16 * v17];
    uint64_t v29 = 16 * a5;
    unint64_t v30 = &v28[16 * a5];
    do
    {
      long long v31 = *(_OWORD *)v7;
      v7 += 16;
      *(_OWORD *)uint64_t v28 = v31;
      v28 += 16;
      v29 -= 16;
    }
    while (v29);
    uint64_t v35 = v30;
    uint64_t v5 = (char *)std::vector<CGPoint>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34) {
      v35 += (v34 - v35 + 15) & 0xFFFFFFFFFFFFFFF0;
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  uint64_t v19 = v12 - __dst;
  uint64_t v20 = (uint64_t)(v12 - __dst) >> 4;
  if (v20 >= a5)
  {
    unint64_t v21 = &__src[16 * a5];
    char v23 = *(char **)(v9 - 8);
LABEL_17:
    unint64_t v24 = &v5[16 * a5];
    unint64_t v25 = &v23[-16 * a5];
    unint64_t v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      unint64_t v26 = v23;
      do
      {
        long long v27 = *(_OWORD *)v25;
        v25 += 16;
        *(_OWORD *)unint64_t v26 = v27;
        v26 += 16;
      }
      while ((unint64_t)v25 < v12);
    }
    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(&v23[-16 * ((v23 - v24) >> 4)], v5, v23 - v24);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7);
    }
    return v5;
  }
  unint64_t v21 = &__src[16 * v20];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[16 * v20], a4 - v21);
  }
  char v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v19 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_252A9D760(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<CGPoint>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  uint64_t v5 = *(void **)(a2 + 8);
  uint64_t v6 = (char *)*a1;
  uint64_t v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    uint64_t v9 = *(void *)(a2 + 8);
    do
    {
      uint64_t v7 = (void *)(v9 - 16);
      *(_OWORD *)(v9 - 16) = *((_OWORD *)v8 - 1);
      v8 -= 16;
      v9 -= 16;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  uint64_t v10 = a1[1];
  uint64_t v11 = *(void *)(a2 + 16);
  int64_t v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    uint64_t v7 = *(void **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v11 + v12;
  uint64_t v13 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v13;
  unint64_t v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v14;
  uint64_t v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v15;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void std::vector<CGPathRandomAccessSubpath>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        std::__destroy_at[abi:ne180100]<CGPathRandomAccessSubpath,0>(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void CGPathRandomAccessSubpath::clipperPath(uint64_t *a1, char **a2, double a3)
{
  uint64_t v4 = *a1;
  if (a1[1] != *a1)
  {
    unint64_t v6 = 0;
    uint64_t v83 = (uint64_t)(a2 + 2);
    __asm
    {
      FMOV            V1.2D, #3.0
      FMOV            V0.2D, #6.0
    }
    float64x2_t v81 = _Q0;
    float64x2_t v82 = _Q1;
    __asm
    {
      FMOV            V1.2D, #0.125
      FMOV            V0.2D, #0.25
    }
    float64x2_t v79 = _Q0;
    float64x2_t v80 = _Q1;
    __asm { FMOV            V0.2D, #0.5 }
    float64x2_t v78 = _Q0;
    do
    {
      if (!v6)
      {
        int32x2_t v15 = vmovn_s64(vcvtq_s64_f64(vmulq_n_f64(*(float64x2_t *)a1[3], a3)));
        unint64_t v16 = (unint64_t)a2[1];
        unint64_t v17 = (unint64_t)a2[2];
        if (v16 >= v17)
        {
          unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - (void)*a2) >> 3);
          unint64_t v21 = v20 + 1;
          if (v20 + 1 > 0xAAAAAAAAAAAAAAALL) {
            goto LABEL_53;
          }
          unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v17 - (void)*a2) >> 3);
          if (2 * v22 > v21) {
            unint64_t v21 = 2 * v22;
          }
          if (v22 >= 0x555555555555555) {
            unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v23 = v21;
          }
          unint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(v83, v23);
          unint64_t v26 = &v24[24 * v20];
          *(void *)&long long v27 = v15.i32[0];
          *((void *)&v27 + 1) = v15.i32[1];
          *(_OWORD *)unint64_t v26 = v27;
          *((void *)v26 + 2) = 0;
          uint64_t v29 = *a2;
          uint64_t v28 = a2[1];
          unint64_t v30 = v26;
          if (v28 != *a2)
          {
            do
            {
              long long v31 = *(_OWORD *)(v28 - 24);
              *((void *)v30 - 1) = *((void *)v28 - 1);
              *(_OWORD *)(v30 - 24) = v31;
              v30 -= 24;
              v28 -= 24;
            }
            while (v28 != v29);
            uint64_t v28 = *a2;
          }
          uint64_t v19 = v26 + 24;
          *a2 = v30;
          a2[1] = v26 + 24;
          a2[2] = &v24[24 * v25];
          if (v28) {
            operator delete(v28);
          }
        }
        else
        {
          *(void *)&long long v18 = v15.i32[0];
          *((void *)&v18 + 1) = v15.i32[1];
          *(_OWORD *)unint64_t v16 = v18;
          *(void *)(v16 + 16) = 0;
          uint64_t v19 = (char *)(v16 + 24);
        }
        a2[1] = v19;
        uint64_t v4 = *a1;
      }
      uint64_t v32 = v4 + 16 * v6;
      if (*(unsigned char *)(v32 + 8))
      {
        v95[0] = 0;
        v95[1] = v95;
        v95[2] = 0x3812000000;
        v95[3] = __Block_byref_object_copy__7;
        v95[4] = __Block_byref_object_dispose__8;
        v95[5] = &unk_252AA2929;
        v95[6] = 0;
        uint64_t v33 = a1[3] + 16 * *(void *)v32;
        v89[0] = MEMORY[0x263EF8330];
        v89[1] = 3221225472;
        unint64_t v90 = ___ZNK25CGPathRandomAccessSubpath11clipperPathEdRNSt3__16vectorIN10ClipperLib8IntPointENS0_9allocatorIS3_EEEE_block_invoke;
        long long v91 = &unk_26538E3C0;
        double v94 = a3;
        int64x2_t v92 = v95;
        int64x2_t v93 = a2;
        long long v34 = v89;
        float64x2_t v36 = *(float64x2_t *)v33;
        float64x2_t v35 = *(float64x2_t *)(v33 + 16);
        float64x2_t v37 = vsubq_f64(v35, *(float64x2_t *)v33);
        float64x2_t v39 = *(float64x2_t *)(v33 + 32);
        __n128 v38 = *(__n128 *)(v33 + 48);
        float64x2_t v40 = vsubq_f64(v39, v35);
        float64x2_t v41 = vsubq_f64(v40, v37);
        float64x2_t v42 = vsubq_f64(vsubq_f64((float64x2_t)v38, v39), v40);
        float64x2_t v43 = (float64x2_t)vzip2q_s64((int64x2_t)v41, (int64x2_t)v42);
        float64x2_t v44 = (float64x2_t)vzip1q_s64((int64x2_t)v41, (int64x2_t)v42);
        __n128 v45 = (__n128)vmlaq_f64(vmulq_f64(v43, v43), v44, v44);
        if (v45.n128_f64[0] <= v45.n128_f64[1]) {
          v45.n128_f64[0] = v45.n128_f64[1];
        }
        double v46 = v45.n128_f64[0] * 9.0 * 0.0625;
        v45.n128_u64[0] = *(void *)(v33 + 56);
        if (v46 > 0.04)
        {
          float64x2_t v47 = vsubq_f64(v42, v41);
          float64x2_t v48 = vmulq_f64(v47, v81);
          float64x2_t v49 = vmlaq_f64(v47, v82, vaddq_f64(v37, v41));
          float64x2_t v50 = vmulq_f64(vaddq_f64(v41, v47), v81);
          uint64_t v51 = 1;
          do
          {
            float64x2_t v48 = vmulq_f64(v48, v80);
            float64x2_t v50 = vsubq_f64(vmulq_f64(v50, v79), v48);
            float64x2_t v49 = vsubq_f64(vmulq_f64(v49, v78), vmulq_f64(v50, v78));
            v51 *= 2;
            double v46 = v46 * 0.0625;
          }
          while (v46 > 0.04 && v51 <= 0x10000);
          if (v51 >= 2)
          {
            uint64_t v52 = 1;
            float64x2_t v85 = v48;
            do
            {
              float64x2_t v86 = v49;
              float64x2_t v87 = v50;
              float64x2_t v88 = vaddq_f64(v36, v49);
              ((void (*)(void *, double, double, double))v90)(v34, v88.f64[0], v88.f64[1], (double)(int)v52 / (double)v51);
              v45.n128_u64[1] = *(void *)&v86.f64[1];
              v38.n128_u64[1] = *(void *)&v87.f64[1];
              float64x2_t v49 = vaddq_f64(v86, v87);
              float64x2_t v50 = vaddq_f64(v85, v87);
              ++v52;
              float64x2_t v36 = v88;
            }
            while (v51 != v52);
            v38.n128_u64[0] = *(void *)(v33 + 48);
            v45.n128_u64[0] = *(void *)(v33 + 56);
          }
        }
        ((void (*)(void *, __n128, __n128, double))v90)(v34, v38, v45, 1.0);

        _Block_object_dispose(v95, 8);
      }
      else
      {
        int32x2_t v53 = vmovn_s64(vcvtq_s64_f64(vmulq_n_f64(*(float64x2_t *)(a1[3] + 16 * ((*(void *)v32 + 1) % (unint64_t)((a1[4] - a1[3]) >> 4))), a3)));
        unint64_t v54 = (unint64_t)a2[1];
        unint64_t v55 = (unint64_t)a2[2];
        if (v54 >= v55)
        {
          unint64_t v58 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v54 - (void)*a2) >> 3);
          unint64_t v59 = v58 + 1;
          if (v58 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_53:
          }
            std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
          unint64_t v60 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v55 - (void)*a2) >> 3);
          if (2 * v60 > v59) {
            unint64_t v59 = 2 * v60;
          }
          if (v60 >= 0x555555555555555) {
            unint64_t v61 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v61 = v59;
          }
          unint64_t v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(v83, v61);
          char v64 = &v62[24 * v58];
          *(void *)&long long v65 = v53.i32[0];
          *((void *)&v65 + 1) = v53.i32[1];
          *(_OWORD *)char v64 = v65;
          *((void *)v64 + 2) = 0;
          float64x2_t v67 = *a2;
          double v66 = a2[1];
          unint64_t v68 = v64;
          if (v66 != *a2)
          {
            do
            {
              long long v69 = *(_OWORD *)(v66 - 24);
              *((void *)v68 - 1) = *((void *)v66 - 1);
              *(_OWORD *)(v68 - 24) = v69;
              v68 -= 24;
              v66 -= 24;
            }
            while (v66 != v67);
            double v66 = *a2;
          }
          int64x2_t v57 = v64 + 24;
          *a2 = v68;
          a2[1] = v64 + 24;
          a2[2] = &v62[24 * v63];
          if (v66) {
            operator delete(v66);
          }
        }
        else
        {
          *(void *)&long long v56 = v53.i32[0];
          *((void *)&v56 + 1) = v53.i32[1];
          *(_OWORD *)unint64_t v54 = v56;
          *(void *)(v54 + 16) = 0;
          int64x2_t v57 = (char *)(v54 + 24);
        }
        a2[1] = v57;
      }
      ++v6;
      uint64_t v4 = *a1;
    }
    while (v6 < (a1[1] - *a1) >> 4);
  }
  uint64_t v71 = *a2;
  uint64_t v70 = a2[1];
  if (0xAAAAAAAAAAAAAAABLL * ((v70 - *a2) >> 3) > 1)
  {
    uint64_t v73 = *((void *)v70 - 3);
    uint64_t v74 = *((void *)v70 - 2);
    unint64_t v72 = v70 - 24;
    uint64_t v76 = *(void *)v71;
    uint64_t v75 = *((void *)v71 + 1);
    if (v73 == v76 && v74 == v75) {
      a2[1] = v72;
    }
  }
}

void sub_252A9DE20(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 48) = *(void *)(a2 + 48);
  return result;
}

void ___ZNK25CGPathRandomAccessSubpath11clipperPathEdRNSt3__16vectorIN10ClipperLib8IntPointENS0_9allocatorIS3_EEEE_block_invoke(uint64_t a1, double a2, double a3)
{
  double v3 = *(double *)(a1 + 48);
  int v4 = (int)(a2 * v3);
  int v5 = (int)(a3 * v3);
  unint64_t v6 = *(void ***)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = v6[1];
  unint64_t v9 = (unint64_t)v6[2];
  if ((unint64_t)v8 >= v9)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v8 - (unsigned char *)*v6) >> 3);
    unint64_t v12 = v11 + 1;
    if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - (void)*v6) >> 3);
    if (2 * v13 > v12) {
      unint64_t v12 = 2 * v13;
    }
    if (v13 >= 0x555555555555555) {
      unint64_t v14 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v14 = v12;
    }
    int32x2_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)(v6 + 2), v14);
    unint64_t v16 = &v15[24 * v11];
    long long v18 = &v15[24 * v17];
    *(void *)unint64_t v16 = v4;
    *((void *)v16 + 1) = v5;
    *((void *)v16 + 2) = *(void *)(v7 + 48);
    uint64_t v10 = v16 + 24;
    unint64_t v20 = (char *)*v6;
    uint64_t v19 = (char *)v6[1];
    if (v19 != *v6)
    {
      do
      {
        long long v21 = *(_OWORD *)(v19 - 24);
        *((void *)v16 - 1) = *((void *)v19 - 1);
        *(_OWORD *)(v16 - 24) = v21;
        v16 -= 24;
        v19 -= 24;
      }
      while (v19 != v20);
      uint64_t v19 = (char *)*v6;
    }
    *unint64_t v6 = v16;
    v6[1] = v10;
    CGFloat v6[2] = v18;
    if (v19) {
      operator delete(v19);
    }
  }
  else
  {
    *uint64_t v8 = v4;
    v8[1] = v5;
    unint64_t v8[2] = *(void *)(v7 + 48);
    uint64_t v10 = v8 + 3;
  }
  v6[1] = v10;
}

uint64_t *UIViewAutoresizing.itk_flexibleWidth.unsafeMutableAddressor()
{
  return &static UIViewAutoresizing.itk_flexibleWidth;
}

uint64_t static UIViewAutoresizing.itk_flexibleWidth.getter()
{
  return static UIViewAutoresizing.itk_flexibleWidth;
}

uint64_t static UIViewAutoresizing.itk_flexibleWidth.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  static UIViewAutoresizing.itk_flexibledouble Width = a1;
  return result;
}

uint64_t (*static UIViewAutoresizing.itk_flexibleWidth.modify())()
{
  return j__swift_endAccess;
}

uint64_t *UIViewAutoresizing.itk_flexibleHeight.unsafeMutableAddressor()
{
  return &static UIViewAutoresizing.itk_flexibleHeight;
}

uint64_t static UIViewAutoresizing.itk_flexibleHeight.getter()
{
  return static UIViewAutoresizing.itk_flexibleHeight;
}

uint64_t static UIViewAutoresizing.itk_flexibleHeight.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  static UIViewAutoresizing.itk_flexibledouble Height = a1;
  return result;
}

uint64_t (*static UIViewAutoresizing.itk_flexibleHeight.modify())()
{
  return j_j__swift_endAccess;
}

CGRect __swiftcall CGRect.init(itk_point1:point2:)(CGPoint itk_point1, CGPoint point2)
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Swift::Bool __swiftcall CGRect.itk_isEqualToRect(_:)(CGRect a1)
{
  CGFloat height = a1.size.height;
  CGFloat width = a1.size.width;
  CGFloat y = a1.origin.y;
  CGFloat x = a1.origin.x;
  v10.origin.CGFloat x = v1;
  v10.origin.CGFloat y = v2;
  v10.size.CGFloat width = v3;
  v10.size.CGFloat height = v4;
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  return CGRectEqualToRect(v10, v11);
}

Swift::Bool __swiftcall CGRect.itk_isNearlyEqualToRect(_:)(CGRect a1)
{
  return sub_252A9E2F8(MEMORY[0x263F4BE38], a1.origin.x, a1.origin.y, a1.size.width, a1.size.height, v1, v2, v3, v4);
}

Swift::Bool __swiftcall CGRect.itk_isNearlyEqualToRect(_:threshold:)(CGRect _, Swift::Double threshold)
{
  return sub_252A9E28C();
}

Swift::Bool __swiftcall CGRect.itk_nearlyContainsRect(_:)(CGRect a1)
{
  return sub_252A9E2F8(MEMORY[0x263F4BE30], a1.origin.x, a1.origin.y, a1.size.width, a1.size.height, v1, v2, v3, v4);
}

BOOL static CGRect.== infix(_:_:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL v8 = a1 == a5;
  if (a2 != a6) {
    BOOL v8 = 0;
  }
  if (a3 != a7) {
    BOOL v8 = 0;
  }
  return a4 == a8 && v8;
}

BOOL static CGPoint.== infix(_:_:)(double a1, double a2, double a3, double a4)
{
  return a2 == a4 && a1 == a3;
}

uint64_t _sSo6CGRectV14InputToolKitUIE10itk_center4sizeABSo7CGPointV_So6CGSizeVtcfC_0()
{
  return MEMORY[0x270F3D5B0]();
}

Swift::Bool __swiftcall CGRect.isNearlyEqualToRect(_:)(CGRect a1)
{
  return sub_252A9E2F8(MEMORY[0x263F4BE38], a1.origin.x, a1.origin.y, a1.size.width, a1.size.height, v1, v2, v3, v4);
}

Swift::Bool __swiftcall CGRect.isNearlyEqualToRect(_:threshold:)(CGRect _, Swift::Double threshold)
{
  return sub_252A9E28C();
}

uint64_t sub_252A9E28C()
{
  return ITKNearlyEqualRectsWithThreshold();
}

Swift::Bool __swiftcall CGRect.nearlyContainsRect(_:)(CGRect a1)
{
  return sub_252A9E2F8(MEMORY[0x263F4BE30], a1.origin.x, a1.origin.y, a1.size.width, a1.size.height, v1, v2, v3, v4);
}

uint64_t sub_252A9E2F8(uint64_t (*a1)(double, double, double, double, double, double, double, double), double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a1(a6, a7, a8, a9, a2, a3, a4, a5);
}

Swift::Bool __swiftcall CGPoint.itk_isEqualToPoint(_:)(CGPoint a1)
{
  CGFloat y = a1.y;
  CGFloat x = a1.x;
  v6.CGFloat x = v1;
  v6.CGFloat y = v2;
  v7.CGFloat x = x;
  v7.CGFloat y = y;
  return CGPointEqualToPoint(v6, v7);
}

CGPoint __swiftcall CGPoint.itk_addPoint(_:)(CGPoint a1)
{
  sub_252A9E3A8(MEMORY[0x263F4BE18], a1.x, a1.y, v1, v2);
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

CGPoint __swiftcall CGPoint.itk_subtractPoint(_:)(CGPoint a1)
{
  sub_252A9E3A8(MEMORY[0x263F4BE50], a1.x, a1.y, v1, v2);
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

uint64_t sub_252A9E3A8(uint64_t (*a1)(double, double, double, double), double a2, double a3, double a4, double a5)
{
  return a1(a4, a5, a2, a3);
}

Swift::Bool __swiftcall CGPoint.itk_isCollinearWithPoints(p1:p2:)(CGPoint p1, CGPoint p2)
{
  return sub_252A9E504(MEMORY[0x263F4BE20], p1.x, p1.y, p2.x, p2.y, v2, v3);
}

Swift::Double __swiftcall CGPoint.itk_distance(toPoint:)(CGPoint toPoint)
{
  ITKDistance();
  return result;
}

Swift::Bool __swiftcall CGPoint.itk_isNearlyCollinearWithPoints(p1:p2:)(CGPoint p1, CGPoint p2)
{
  return sub_252A9E504(MEMORY[0x263F4BE28], p1.x, p1.y, p2.x, p2.y, v2, v3);
}

uint64_t static CGPoint.+ infix(_:_:)()
{
  return sub_252A9E448(MEMORY[0x263F4BE18]);
}

uint64_t static CGPoint.- infix(_:_:)()
{
  return sub_252A9E448(MEMORY[0x263F4BE50]);
}

uint64_t sub_252A9E448(uint64_t (*a1)(void))
{
  return a1();
}

Swift::Bool __swiftcall CGPoint.isNearlyEqualToPoint(_:)(CGPoint a1)
{
  return ITKNearlyEqualPoints();
}

uint64_t _sSo7CGPointV14InputToolKitUIE24itk_isNearlyEqualToPoint_9thresholdSbAB_SdtF_0()
{
  return ITKNearlyEqualPointsWithThreshold();
}

Swift::Bool __swiftcall CGPoint.isCollinearWithPoints(p1:p2:)(CGPoint p1, CGPoint p2)
{
  return sub_252A9E504(MEMORY[0x263F4BE20], p1.x, p1.y, p2.x, p2.y, v2, v3);
}

Swift::Double __swiftcall CGPoint.distanceSquared(toPoint:)(CGPoint toPoint)
{
  ITKDistanceSquared();
  return result;
}

Swift::Bool __swiftcall CGPoint.isNearlyCollinearWithPoints(p1:p2:)(CGPoint p1, CGPoint p2)
{
  return sub_252A9E504(MEMORY[0x263F4BE28], p1.x, p1.y, p2.x, p2.y, v2, v3);
}

uint64_t sub_252A9E504(uint64_t (*a1)(double, double, double, double, double, double), double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a1(a6, a7, a2, a3, a4, a5);
}

void itk_dataFromCGImage_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_252A7A000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to create CGImageDestinationRef", v0, 2u);
}

void itk_dataFromCGImage_cold_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  double v2 = "NSData * _Nullable itk_dataFromCGImage(CGImageRef _Nullable, NSString *__strong _Nonnull, NSDictionary * _Nullable __strong)";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_252A7A000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s -- Failed to finalize image with type '%@'.", (uint8_t *)&v1, 0x16u);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x270EE5A68]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B90](space, pattern, components);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x270EE5BC0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C50]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C90](baseSpace);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D08](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7008](path, transform);
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

CGPatternRef CGPatternCreate(void *info, CGRect bounds, CGAffineTransform *matrix, CGFloat xStep, CGFloat yStep, CGPatternTiling tiling, BOOL isColored, const CGPatternCallbacks *callbacks)
{
  return (CGPatternRef)MEMORY[0x270EE7110](info, matrix, *(void *)&tiling, isColored, callbacks, (__n128)bounds.origin, *(__n128 *)&bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height, xStep, yStep);
}

void CGPatternRelease(CGPatternRef pattern)
{
}

BOOL CGPointEqualToPoint(CGPoint point1, CGPoint point2)
{
  return MEMORY[0x270EE7158]((__n128)point1, *(__n128 *)&point1.y, (__n128)point2, *(__n128 *)&point2.y);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t ITKAddPoints()
{
  return MEMORY[0x270F3D498]();
}

uint64_t ITKAngleBetweenPoints()
{
  return MEMORY[0x270F3D4A0]();
}

uint64_t ITKAngleOfLine()
{
  return MEMORY[0x270F3D4A8]();
}

uint64_t ITKAveragePoints()
{
  return MEMORY[0x270F3D4B8]();
}

uint64_t ITKCenterOfRect()
{
  return MEMORY[0x270F3D4C0]();
}

uint64_t ITKClampSizeToMaxLength()
{
  return MEMORY[0x270F3D4D0]();
}

uint64_t ITKCrossPoints()
{
  return MEMORY[0x270F3D4D8]();
}

uint64_t ITKDistance()
{
  return MEMORY[0x270F3D4E0]();
}

uint64_t ITKDistanceSquared()
{
  return MEMORY[0x270F3D4E8]();
}

uint64_t ITKDynamicCast()
{
  return MEMORY[0x270F3D4F0]();
}

uint64_t ITKFitOrFillSizeInRect()
{
  return MEMORY[0x270F3D4F8]();
}

uint64_t ITKFlipPoint()
{
  return MEMORY[0x270F3D508]();
}

uint64_t ITKFlipRect()
{
  return MEMORY[0x270F3D510]();
}

uint64_t ITKIntersectionOfLines()
{
  return MEMORY[0x270F3D520]();
}

uint64_t ITKIntersectsLine()
{
  return MEMORY[0x270F3D528]();
}

uint64_t ITKMultiplyPointBySize()
{
  return MEMORY[0x270F3D540]();
}

uint64_t ITKMultiplyPointScalar()
{
  return MEMORY[0x270F3D548]();
}

uint64_t ITKMultiplySizeScalar()
{
  return MEMORY[0x270F3D550]();
}

uint64_t ITKNearestPointOnLineSegmentToPoint()
{
  return MEMORY[0x270F3D558]();
}

uint64_t ITKNearlyEqualPoints()
{
  return MEMORY[0x270F3D560]();
}

uint64_t ITKNearlyEqualPointsWithThreshold()
{
  return MEMORY[0x270F3D568]();
}

uint64_t ITKNearlyEqualRects()
{
  return MEMORY[0x270F3D570]();
}

uint64_t ITKNearlyEqualRectsWithThreshold()
{
  return MEMORY[0x270F3D578]();
}

uint64_t ITKNormalizeAngleInRadians()
{
  return MEMORY[0x270F3D580]();
}

uint64_t ITKNormalizedPointInRect()
{
  return MEMORY[0x270F3D588]();
}

uint64_t ITKPointFromNormalizedRect()
{
  return MEMORY[0x270F3D590]();
}

uint64_t ITKPointIsFinite()
{
  return MEMORY[0x270F3D598]();
}

uint64_t ITKRectFromNormalizedSubrect()
{
  return MEMORY[0x270F3D5A0]();
}

uint64_t ITKRectWithOriginAndSize()
{
  return MEMORY[0x270F3D5B8]();
}

uint64_t ITKRectWithPoints()
{
  return MEMORY[0x270F3D5C0]();
}

uint64_t ITKRectWithSize()
{
  return MEMORY[0x270F3D5C8]();
}

uint64_t ITKSizeIsEmptyOrHasNanOrInf()
{
  return MEMORY[0x270F3D5E0]();
}

uint64_t ITKSizeRatioFromSizes()
{
  return MEMORY[0x270F3D5E8]();
}

uint64_t ITKSlopeOfLine()
{
  return MEMORY[0x270F3D5F0]();
}

uint64_t ITKSubtractPoints()
{
  return MEMORY[0x270F3D5F8]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x270F06678](pixelBuffer, options, imageOut);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987D8]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

void std::exception::~exception(std::exception *this)
{
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

void operator new()
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

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
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

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t itk_dispatchMainAfterDelay()
{
  return MEMORY[0x270F3D610]();
}

uint64_t itk_isiOS()
{
  return MEMORY[0x270F3D630]();
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}